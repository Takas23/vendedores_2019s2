import vendedores.*


class Centro {
	var property ciudad
	var property vendedores = []
	
	method agregarVendedor(vendedor) {
		if (not self.esta(vendedor)) {
			vendedores.add(vendedor)
		}
			else self.error("ya esta registrado")
	}
	method esta(vendedor) {
		return vendedores.contains(vendedor)
	}
//revisar
	method vendedorEstrella() {
		return vendedores.max({ve => ve.puntos()})
	}
	method puedeCubrir(unaCiudad) {
		return vendedores.any({ve => ve.puedeTrabajar(unaCiudad)})
	}
	method vendedoresGenericos() {
		return vendedores.filter({ve => ve.certGenerica() > 0})
	}
	method esRobusto() {
		return vendedores.count({ve => ve.esFirme()}) >= 3
	}
	method repartir(certificacion) {
		vendedores.forEach({ve => ve.certificar(certificacion)})
	}
	
}


