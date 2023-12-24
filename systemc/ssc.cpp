// Learn with Examples, 2020, MIT license
#include <systemc>
using namespace sc_core;

SC_MODULE(FIFO) {
  sc_fifo<int> f1, f2, f3;
  SC_CTOR(FIFO) : f1(2), f2(2), f3(2) { // fifo with size 2
    SC_THREAD(Data_MPU_6050);
    SC_THREAD(Data_MPU_6050_);

    SC_THREAD(Data_Receiver);
    SC_THREAD(Data_Receiver_);

    SC_THREAD(MCU);
    SC_THREAD(MCU_);
  }
  void Data_MPU_6050() { // blocking write
    int v = 0;
    while (true) {
      f1.write(v); // same as f = v, which is not recommended.
      std::cout << sc_time_stamp() << ": Data_MPU_6050 writes " << v++ << std::endl;
      wait(1, SC_SEC); // write every 1 s
    }
  }
  void Data_MPU_6050_() { // blocking read
    int v = -1;
    while (true) {
      f1.read(v); // same as v = int(f), which is not recommended; or, v = f1.read();
      std::cout << sc_time_stamp() << ": Data_MPU_6050_ reads " << v << std::endl;
      wait(3, SC_SEC); // read every 3 s, fifo will fill up soon
    }
  }
  void Data_Receiver() { // non-blocking write
    int v = 0;
    while (true) {
      while (f2.nb_write(v) == false ) { // nb write until succeeded
        wait(f2.data_read_event()); // if not successful, wait for data read (a fifo slot becomes available)
      }
      std::cout << sc_time_stamp() << ": Data_Receiver writes " << v++ << std::endl;
      wait(1, SC_SEC); // write every 1 s
    }
  }
  void Data_Receiver_() { // non-blocking read
    int v = -1;
    while (true) {
      while (f2.nb_read(v) == false) {
        wait(f2.data_written_event());
      }
      std::cout << sc_time_stamp() << ": Data_Receiver_ reads " << v << std::endl;
      wait(3, SC_SEC); // read every 3 s, fifo will fill up soon
    }
  }
  
  void MCU() { // free/available slots before/after write
    int v = 0;
    while (true) {
      std::cout << sc_time_stamp() << ": MCU, before write, #free/#available=" << f3.num_free() << "/" << f3.num_available() << std::endl;
      f3.write(v++);
      std::cout << sc_time_stamp() << ": MCU, after write, #free/#available=" << f3.num_free() << "/" << f3.num_available() << std::endl;
      wait(1, SC_SEC);
    }
  }
  void MCU_() { // free/available slots before/after read
    int v = -1;
    while (true) {
      std::cout << sc_time_stamp() << ": MCU_, before read, #free/#available=" << f3.num_free() << "/" << f3.num_available() << std::endl;
      f3.read(v);
      std::cout << sc_time_stamp() << ": MCU_, after read, #free/#available=" << f3.num_free() << "/" << f3.num_available() << std::endl;
      wait(3, SC_SEC); // read every 3 s, fifo will fill up soon
    }
  }
};

int sc_main(int, char*[]) {
  FIFO fifo("fifo");
  sc_start(10, SC_SEC);
  return 0;
}

