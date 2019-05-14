object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos()= 1
	method reacciona(){}
}

object bumblebee {
	var transformadoEnAuto = true
	method transformadoEnAuto()= transformadoEnAuto
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultos()= 2
	method reacciona(){self.transformar()}
}
object paqueteLadrillos{
	var property cantLadrillos
	method nivelPeligrosidad() { return 2 }
	method peso(){
		return 2 * cantLadrillos
	}
	method cantLadrillos(cant){
		cantLadrillos = cant
	}
	method bultos(){
		if(cantLadrillos <= 100){
			return 1
		}
		else if( cantLadrillos > 100 and cantLadrillos <= 300){
			return 2
		}else{
			return 3
		}
	}
	method reacciona(){cantLadrillos = cantLadrillos + 12}
}

object arena{
	var property peso
	method peso() = peso
	method setearPeso(valor){peso = valor}
	method nivelPeligrosidad() { return 1}
	method bultos()= 1
	method reacciona(){ peso = peso + 20}
}



object bateriaAntiaerea{
	var conMisiles = false
	method peso(){
		if(conMisiles){
			return 300
		}else{
			return 200
		}
	}
	method conMisiles()= conMisiles
	method cargarMisiles(){conMisiles = true}
	method nivelPeligrosidad(){
		if(conMisiles){
			return 100
		}else{
			return 0
		}
	}
	method bultos(){
		if(conMisiles){
			return 2
		}else{
			return 1
		}
	}
	method reacciona(){
		if(not conMisiles){
			self.cargarMisiles()
		}
	}
}



object contenedor{
	var cosas = []
	method agregarCosa(cosa){
		cosas.add(cosa)
	}
	method cosas()= cosas
	method peso(){return 100 + self.pesoCosas()}
	method pesoCosas()= cosas.sum({cosa => cosa.peso()})
	method nivelPeligrosidad(){
		if(cosas.size() == 0 ){
			return 0 
		}else{
			return self.peligrosidadCosas().max()
		}
	}
	method peligrosidadCosas()= cosas.map({cosa=>cosa.nivelPeligrosidad()})
	method bultos(){
		return 1 + self.sumaBultosDeCosas()
	}
	method sumaBultosDeCosas() = cosas.sum({cosa=> cosa.bultos()})
	method reacciona(){cosas.forEach({cosa=> cosa.reacciona()})}
	//all retorna booleano
}

object residuosRadioactivos{
	var property peso
	method peso() = peso
	method setearPeso(valor){peso = valor}
	method nivelPeligrosidad() { return 200}
	method bultos()= 1
	method reacciona(){
		peso= peso + 15
	}
}

object embalaje{
	var cosaInterior
	method peso()= cosaInterior.peso()
	method cubrirA(cosa){
		cosaInterior = cosa
	}
	method nivelPeligrosidad()= cosaInterior.nivelPeligrosidad() / 2
	method bultos()= 1
}
	

