package lt.arvydas.KawaWebTest.service;

public interface MandelbrotGen {

	String make(float x, float y, float width, float height, float delta, float maxIterationCount);
	
}
