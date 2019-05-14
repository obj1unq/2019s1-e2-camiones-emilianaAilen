import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		self.hacerReaccionar(unaCosa)
	}
	method hacerReaccionar(cosa){
		cosa.reacciona()
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	method pesoCarga()= cosas.sum({cosa => cosa.peso()})
	
	method pesoTotal(){
		return 1000 + self.pesoCarga()
	}
	method excedidoDePeso(){
		return self.pesoTotal() > 2500
	}
	method objetosPeligrosos(nivel)= cosas.filter({cosa=> cosa.nivelPeligrosidad()> nivel})
	
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({unaCosa=> unaCosa.nivelPeligrosidad()> cosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.all({cosa=> cosa.nivelPeligrosidad()< nivelMaximoPeligrosidad})
	}
	method tieneAlgoQuePesaEntre(min, max) = cosas.any({cosa=> cosa.peso()>min and cosa.peso()< max})
	method cosaMasPesada()= cosas.max({cosa=> cosa.peso()})
	method pesos() = cosas.map({cosa=> cosa.peso()})
	method totalBultos() = cosas.sum({cosa=> cosa.bultos()})
}

