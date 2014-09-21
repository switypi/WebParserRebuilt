﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace WebParser.DAL.Model
{
    [DataContract]
    public class ReturnResultDTO
    {
        [DataMember]
        public bool IsSuccess { get; set; }

        [DataMember]
        public string Message { get; set; }

        [DataMember]
        public string NewPluginMessage { get; set; }

        [DataMember]
        public string NewComplianceMessage { get; set; }

        [DataMember]
        public string NewVarianceMessage { get; set; }

        [DataMember]
        public int NewPluginCount { get; set; }
        [DataMember]
        public int NewComplianceCount { get; set; }
        [DataMember]
        public int NewVarianceCount { get; set; }
    }
}
