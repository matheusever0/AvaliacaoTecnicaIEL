using System;
using System.Collections.Generic;

namespace AvaliacaoTecnicaIEL.Models
{
    public class CadastroAvaliacao
    {
        public string Nome { get; set; }
        public string Cpf { get; set; }
        public string Email { get; set; }
        public string Telefone { get; set; }
        public bool Habilitacao { get; set; }
        public string Categoria { get; set; }
        public List<int> Lingua_Estrangeira { get; set;}
        public string Estado { get; set; }
    }
}
