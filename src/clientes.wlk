import vendedores.*

class Cliente {
	method puedeSerAtendidoPor(vendedor)
	
}

class Inseguro inherits Cliente {
	override method puedeSerAtendidoPor(vendedor) {
		return vendedor.esFirme()
			and vendedor.esVersatil()
	}
}

class Detallista inherits Cliente {
	override method puedeSerAtendidoPor(vendedor) {
		return vendedor.certProducto() >= 3
	}
}

class Humanista inherits Cliente {
	override method puedeSerAtendidoPor(vendedor) {
		return vendedor.fisico()
	}
}