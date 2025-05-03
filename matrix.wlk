object nave{
  const pasajeros = #{neo,morfeo, trinity} // # conjunto
  method cuantosPasajerosHay() = pasajeros.size()
  method pasajeroDeMayorVitalidad() = pasajeros.max({p =>p.vitalidad()}) //{} bloque de codigo
  method pasajeroDeMenorVitalidad() = pasajeros.min({p=>p.vitalidad()})
  method estaEquilibrada(){
    return
      self.pasajeroDeMayorVitalidad().vitalidad() < self.pasajeroDeMenorVitalidad().vitalidad() * 2
  }
  method estaElElegido() = pasajeros.any({p=>p.esElElegido()}) // any ve si hay al menos uno que cumpla la condicion
  method chocar() {
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
  }
  method acelerar() {
    pasajeros.filter({p => not p.esElElegido()}).forEach({p => p.saltar()})
    pasajeros.remove(neo)
  }
}
object neo {
  var energia = 100
  method saltar(){
    energia = energia / 2
  }
  method esElElegido() = true
  method vitalidad() = energia * 0.1
}

object morfeo {
  var vitalidad = 8
  var estaDescansado = true
  method esElElegido() = false
  method saltar() {
    estaDescansado = !estaDescansado
    vitalidad = (vitalidad-1).max(0)
  }
  method vitalidad() = vitalidad
}

object trinity{
  method vitalidad() = 0
  method esElElegido() = false
  method saltar(){}
}