class Pedido {
	var property distanciaARecorrer
	var property tiempoMaximo
	var property pasajeros
	const coloresIncompatibles = #{"azul", "rojo"}
	var velocidadRequerida = distanciaARecorrer / tiempoMaximo
	
	method satisfacePedido(auto) {
		return auto.velocidadMaxima() >= velocidadRequerida+10
		and auto.capacidad() >= pasajeros
		and not coloresIncompatibles.any{ a => a == auto.color() }
	}
}
