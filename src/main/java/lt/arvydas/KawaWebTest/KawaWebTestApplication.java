package lt.arvydas.KawaWebTest;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import lt.arvydas.KawaWebTest.service.MandelbrotGen;

@SpringBootApplication
public class KawaWebTestApplication {

	public static void main(String[] args) {
		SpringApplication.run(KawaWebTestApplication.class, args);
	}

	@Bean
	public MandelbrotGen mandelbrotGen() throws InstantiationException, IllegalAccessException, ClassNotFoundException {
		return (MandelbrotGen) Class.forName("mandelbrotgen").newInstance();
	}
	
}
