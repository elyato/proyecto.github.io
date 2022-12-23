<?php	
	class Conexion
	{
		private $host ="localhost";
		private $user ="root";
		private $password ="";
		private $db ="Dbo_Paloaguao";
		private $conect;

		public function __construct(){
		$conectionstring = "mysql:localhos=".$this->host.";dbname".$this->db.";charset=uft8";
		try {
			$this->conect = new PDO($conectionstring,$this->user,$this->password);
			$this->conect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);	
			echo "Conexión correcta";
			} catch (Exception$e)
			{
			$this->conect ='Error de conexión';
			echo "ERROR: ". $e->getMessage();
			}	
		}
	}
	$conect = new Conexion();
?>