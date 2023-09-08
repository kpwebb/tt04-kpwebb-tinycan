import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer, ClockCycles

@cocotb.test()
async def test_7seg(dut):
    dut._log.info("start")
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # reset
    dut._log.info("reset")
    dut.rst_n.value = 0
    # set the compare value
    dut.ui_in.value = 4
    dut.uio_in.value = 5
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1


    await ClockCycles(dut.clk, 1000)

    assert int(dut.uo_out.value) == 9


    


    



