class Pedido {
	var property distanciaARecorrer
	var property tiempoMaximo
	var property pasajeros
	var property coloresIncompatibles = #{}
	
	method velocidadRequerida() = return distanciaARecorrer/tiempoMaximo
	
	method satisfacePedido(auto) {
		return auto.velocidadMaxima() >= self.velocidadRequerida()+10
		and auto.capacidad() >= pasajeros
		and not coloresIncompatibles.any{ a => a == auto.color() }
	}
	
	method acelerar() = tiempoMaximo--
	method relajar() = tiempoMaximo++
}
