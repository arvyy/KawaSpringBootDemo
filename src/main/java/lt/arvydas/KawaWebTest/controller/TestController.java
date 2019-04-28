package lt.arvydas.KawaWebTest.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lt.arvydas.KawaWebTest.service.MandelbrotGen;

@RestController
public class TestController {

	@Autowired MandelbrotGen service;
	
	@GetMapping("mandelbrot.svg")
	public String get(
		@RequestParam(name = "x", defaultValue = "-2") float x,
		@RequestParam(name="y", defaultValue="-2") float y,
		@RequestParam(name="width", defaultValue="4") float width,
		@RequestParam(name="height", defaultValue="4") float height,
		@RequestParam(name="delta", defaultValue="0.04") float delta,
		@RequestParam(name="iterations", defaultValue="20") float maxIterationCount
	) {
		return service.make(x, y, width, height, delta, maxIterationCount);
	}
	
}
