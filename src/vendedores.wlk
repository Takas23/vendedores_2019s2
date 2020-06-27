class Vendedor {
	var property certificaciones = [ ]
	
	method puntos() {
		return certificaciones.sum({cert => cert.puntaje()})
	}
	method puedeTrabajar(ciudad)

	method esVersatil() {
		return certificaciones.size() >= 3
			and self.certProducto().between(1, certificaciones.size() - 1)	
	}
	
	method certProducto() {
		return certificaciones.count({cert => cert.sobreProducto()})
	}
	method certGenerica() {
		return certificaciones.size() - self.certProducto()
	}
	method esFirme() {
		return self.puntos() >= 30
	}
	method certificar(certificacion) {
		certificaciones.add(certificacion)
	}
	method tieneAfinidad(centro) {
		return self.puedeTrabajar(centro.ciudad())
	}
	method esCandidato(centro) {
		return self.esVersatil()
			and self.tieneAfinidad(centro)
	}
}

class Fijo inherits Vendedor {
	const property fisico = true
	var property viveEn 
	
	override method puedeTrabajar(ciudad) {
		return ciudad == viveEn
	}
	method esInfluyente() = false

}

class Viajante inherits Vendedor {
	const property fisico = true
	var property provHabilitadas = [ ] //provincias
	
	override method puedeTrabajar(ciudad) {
		return provHabilitadas.contains(ciudad.provincia())
	}
	method esInfluyente() {
		return provHabilitadas.sum({prov => prov.poblacion()}) >= 10000000
	}
}

class Comercio inherits Vendedor {
	const property fisico = false
	var property sucursales = [ ] //ciudades
	
	override method puedeTrabajar(ciudad) {
		return sucursales.contains(ciudad)
	}
	override method tieneAfinidad(centro) {
		return super(centro) 
			and not sucursales.any({suc => centro.puedeCubrir(suc)})
	}
	method esInfluyente() {
		return sucursales.size() >= 5
			or self.provincias().size() >= 3
	}
	method provincias() {
		return sucursales.map({suc => suc.provincia()}).asSet()
	}
	
}

class Certificacion {
	var property sobreProducto 	//t-f
	var property puntaje
}

class Provincia {
	var property poblacion
}

class Ciudad {
	var property provincia
}
