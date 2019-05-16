import rodados.*

class Dependencia {
	const flota = #{}
	const pedidos = #{}
	var property empleados = 0
	
	method relajarPedidos() { pedidos.forEach{ p => p.relajar() } }
	
	method colorIncompatible(color) { return pedidos.all{ p => p.any{p.coloresIncompatibles() == color} } } //falta terminar
	
	method agregarPedido(pedido) {
		pedidos.add(pedido)
	}
	
	method quitarPedido(pedido) {
		pedidos.remove(pedido)
	}
	
	method totalPasajeros() { return pedidos.sum { p => p.pasajeros() } }
	
	method pedidosNoSatisfechos() { return
		pedidos.filter { p => not p.satisfacePedido( flota.forEach {  } ) } //dudas
	}
	
	method agregarAFlota(rodado) {
		flota.add(rodado)
	}
	
	method quitarDeFlota(rodado) {
		flota.remove(rodado)
	}
	
	method pesoTotalFlota() = flota.sum { r => r.peso() }
	
	method estaBienEquipada() {
		return flota.size() >= 3 and flota.all { r => r.velocidadMaxima() >= 100 } 
	}
	
	method capacidadTotalEnColor(unColor) {
		return flota
			.filter { r => r.color() == unColor }
			.sum { r => r.capacidad() }
	}
	
	method colorDelRodadoMasRapido() {
		return flota.max { r => r.velocidadMaxima() }.color()
	}
	
	method capacidadFaltante() {
		return empleados - self.capacidadTotal()
	}
	
	method capacidadTotal() {
		return flota.sum { r => r.capacidad() }
	}
	
	method esGrande() {
		return empleados >= 40 and flota.size() >= 5
	}
}