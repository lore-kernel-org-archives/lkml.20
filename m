Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793646491;
	b=qUuw905Wp/JIUteVxNohjofeR7KqCsQUinQ1EzNXD4XA2uHJQDqjzg0eLMsjXQYSkG0a
	 U4ejq+mw/GhFOmkAyHzADvyyAemYpNCsqXF8PVaB/qvPyJnr2u6mjjMMzLk8yBqJBAT1w
	 3bMyEnP6npiKDMn4NJ1GQqDpVNmIeeii069Ap8RAOgrhUhd50C0MLKg0Jx34gP/h15GRt
	 bTznqZFa/hFvldAuusMc+FyJO4PU11t4To0h8ANfJBwOVrRIKlFL2ndQHZZkdz3NovC3t
	 eaLOZGxHyeCmQWam/UUOlh3//1E0I6aiERTpDNg8bk6WNeVi7H1dD1uIiDBIqrvf83w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646491;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:user-agent:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=9SGSRKHcj4K4ufrM+1BViMC3DIUO28ayyCTPvcgAIFE=;
	b=nKMM70OdcIBrmB2BNHtSG7E8OoWHSutb/OE1iw1Hb0rOZxmdoMJ3UxEbdrVlkXamONAz
	 smzogUnYUUSPJFhHFfp0LQVKnYh54R3HtpFUbbdPsoj7NM15z14pO8yWZhy6Io52lshYF
	 2YMiiK1PcI6c+NXr7fLGk5OI6vtNZEF3MiPMkr4Wzf4uf0oiYl8jKLmW4BEvhaMI3JN2n
	 wt6i4iuweQuZ361aPVEGTLlUg4NOe6oAnj4SDbTT1/09+NVYy7bfIa9GbVs3Eu4FiwQ10
	 Rmygm8k36gm+tp/dNb/z1p3scsYcQNzKxuSmhmX8SJgoUOZ7FtC3kEM5sfak3OMOdQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glra0gYy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBF8606EE96
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EBF8606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=glra0gYy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793646490; x=1825182490;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=9SGSRKHcj4K4ufrM+1BViMC3DIUO28ayyCTPvcgAIFE=;
  b=glra0gYyW/FpZTkS9pYylMSDsmiSn1J+t41T2iK0EvQYgI+1G8c/GYCl
   p7k0cbZCi8RS0IxGmT6bWqDrgO6akAIUdxbrg+4tfq9ZMN/zwiKMS+7Ir
   pBbbwWVtSreRE57QLSKHzgMBWYFi+9HIsvpoYBxVSBK1VaxCcja3OfLLN
   m58w4QYFaRa/Yh2B8asC1IpYhyeEQKS5C/C8B+4XNNjO2s/bOBUbnjnx/
   P7aCSxl/E+96K29y238RQ6hZn7BYTFR0kb05IYcjwU+n8D1b0MQdbBTth
   EMxc++OO8BCTe29P7ZqdLjbxMkaDrefG87Zc93kov6Z59U/1oNrqCo9bD
   Q==;
X-CSE-ConnectionGUID: T2NTgj/iR7GRxuzsZBOb3g==
X-CSE-MsgGUID: Z/ousQ8pTzmLOG8JBLymbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2262100"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2262100"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 11:07:44 -0800
X-CSE-ConnectionGUID: iLeEuOUpS/iqUA3XGx40Gw==
X-CSE-MsgGUID: X5QKoLSeT0+ygO9I3/SX7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6327297"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 11:07:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 11:07:41 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 11:07:41 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 11:07:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j8PFpZ2vQahviOwxjkX+M0GQbvWe3XwijW2ufrhBP3YUBpDMu3mAebX5oN3D21kcnUqy8uttvLkzCdwhQsE3ggoF6WCFv3zdIUQzyJXwOIL27hpgtqCLCN+IYXoofA2+Cy2wDnsDecWljy+hEBm6YdHShKEyvMM+t1Ls8ce3YonBrSl7V1fHpQZ0n6s5HoLN54/ZpJpeTk7ubLGNq0+xRaNbHdHiHTcQyOvNb14QVS1u6Q/I/ucVv65xwBs7KEA4AsqQSgMuaiXFaCF/7Ety7vmhIK82iRfny7fDuumSEdauHM3mE7RRy4rpb3ErPYZ8YDQompL1tYLUOBXN4jKVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SGSRKHcj4K4ufrM+1BViMC3DIUO28ayyCTPvcgAIFE=;
 b=DxYyBX4kaEJ7z2Yy8XSbDdcRNi7flq7EeiREIr16XeLpJ4//YuDb6gX70ad2E66mFXPabxmXwEKAziWFe2ZPWFNc4qFkUYEhUqX7ojjXFpkqyAHXYUvBkgHpFbaKbH5djoPcZQwtZihUuxNCUCZjwG8UoCXNmrX9Ros0+6UE7FIOal3EzB1o+EpQoj58Naxgd9mOfUWyyyJTvyhT3fL/EVbfY6owQCW0YI1KOK3s+577z1PJXUULTo3e/Dtut9RYV67uz1ZxnmVDLM9za64ZN91LFRvDmki6QD/Ts87p1WARUxrtbTvfH1qkmrP0D1tPCa5Qth+63QdTwKTFoCzy3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by SJ0PR11MB5039.namprd11.prod.outlook.com
 (2603:10b6:a03:2da::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 19:07:37 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 19:07:36 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "kas@kernel.org" <kas@kernel.org>
CC: "andrew+kernel@donnellan.id.au" <andrew+kernel@donnellan.id.au>,
	"luto@kernel.org" <luto@kernel.org>, "pasha.tatashin@soleen.com"
	<pasha.tatashin@soleen.com>, "kernel-team@meta.com" <kernel-team@meta.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"rppt@kernel.org" <rppt@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"david@kernel.org" <david@kernel.org>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "peterx@redhat.com" <peterx@redhat.com>,
	"azpijr@gmail.com" <azpijr@gmail.com>, "tj@kernel.org" <tj@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "rmclure@linux.ibm.com"
	<rmclure@linux.ibm.com>, "tglx@kernel.org" <tglx@kernel.org>, "bp@alien8.de"
	<bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/mm: Define the zapped-entry checks only with
 CONFIG_DEBUG_VM
Thread-Topic: [PATCH] x86/mm: Define the zapped-entry checks only with
 CONFIG_DEBUG_VM
Thread-Index: AQHdatgdOWG1gcUTjkG6z8ShoYs60bca/56AgAALFgCAABpygA==
Date: Mon, 2 Nov 2026 19:07:36 +0000
Message-ID: <dc8912d37bf7cc3f286af8dd59070ab63c579909.camel@intel.com>
References: <20261102144001.342837-1-kas@kernel.org>
	 <f20b6d4f4e9368885e187e208453f21a9b0a2140.camel@intel.com>
	 <aujIo3W5yVZdZaf7@thinkstation>
In-Reply-To: <aujIo3W5yVZdZaf7@thinkstation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|SJ0PR11MB5039:EE_
x-ms-office365-filtering-correlation-id: bd432286-29f3-4d77-971a-08df39148e7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|38070700021|11063799006|4143699003|56012099006|261028144727099003|261022075727099003|261026140227099003|261026121527099003|261022105027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info: J2Nj4oL3YAlFf7PgUjoyftGq2/TFOUnmdGn4gldnTg1fDdRF4P91o7/o2CqIDmAUxUFAoQY08xpKNKje0Qy6+QHptNohCEbqiRXNmW2mma6zOz0wyI6VgQKiRb6xIPAWOYaBzNsVhlnRc0h7H84a/hd3GziELRijICX60ChI1/KuMwMtWHs6f2lZguvGulDJahXARZ8cTpIaFlZATf2PnIzBnJieR/D7J7EgX/9NokYXibsTblQpvJwkfl8pAH1aaXMjhmT0AAqcMrsIbzz0VzjqsyB3+sPcXR89uAF5iwRWsppoGzthElSa6YbnirBvr3N7MukAzBQaeWeR5sIDDB+vyrr1L2QMEY2JAehZraRL58DjLu0eKvo8SDrcZqS1gbG5eVsSkKIzga6SJrRL6UW1qXUTeLR9uZ0D/8qJVYQixrCA7JY27rhbuc1pm4bSWwbzQ2QnFJeFMyAG1ViOOJCfz/9f3ZFT8RXtXn96QzzqT6cAysU08UYWoHjiGsobICm+/D6XBvrvZPMTQZ5bPz9PGtBBqpVOlb1cKs+GnYVM6XAXKIYlJUKwU+QNz2kozNmVMRXyeg4yxILdYG9U8S8kIreBv+y+M3cay/DRDlGlIAQ6RBwVIzqAQWDbdpLEQT2Bvzh0OHsWjleH8PNagULXZuCx7TrIcinuMXEPOzQM26HU1a4mGnu73L0yv3PHoXA2SruWKEHB7+lyabnWd845r7slBQi2AftbXdSERkk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(38070700021)(11063799006)(4143699003)(56012099006)(261028144727099003)(261022075727099003)(261026140227099003)(261026121527099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QUlkYUZVMDFXa2dDVWRYdUI1bEVNQlkzK0V3ZUxZTUdiUC9MV3kxWHArWkFY?=
 =?utf-8?B?WXpibjRSWUFWdi9JQ3BxeWN1VjdjdHJjTlBhUWphSjJDVHlQTVBoQlEycXBV?=
 =?utf-8?B?RUdZM3pxNkIzQ2JMOWRQbkgvVnlWaHRKaGtOOHJtRHllVTFWbUh1QUt2TXli?=
 =?utf-8?B?MHdoNU9KbFJwMmVkcDl1SzRTdFpYeThZUXlpQ25kd2V0dEhISFNNbloxUXJX?=
 =?utf-8?B?cWlvczhtbG9KRWJSTXMxVkx4OVJMaFkrTHZWb3pKSWdVeDJtNEZhUmNXVkJE?=
 =?utf-8?B?cWVLcHRQR2lsNjV1c1oxUkVFbURxTjBnNE55WXpINGRUZkR5TmVoSXM4czZE?=
 =?utf-8?B?ZndLYXpKdTRKU2ZVZ0l2NDVDcG4yMnR1cFlTQmQ3RXpTQ3R2U1ltS3RTdXV1?=
 =?utf-8?B?eC9aVEFCa291Zy9Qcmllc01qaGFXcWdubHFLNzkraiswalVzdnpwbWd4dHRj?=
 =?utf-8?B?RFhNMHU1VTFNWGFRSXR2SlBQcmFYbHJRWVh6ZWtvTHVJOVF5ajJvV2JsSWx2?=
 =?utf-8?B?TlRWaERDeHRKUFVsVlpTRmxMemkxZTAzenhlZVQwSU9mbmhoc2JOQ0ZoSzJy?=
 =?utf-8?B?clIzOHlwSWdHTjZPalZrOW9VWU9OMi9NNFFMYXlVdjhEMTdUekUzU0NiUVlE?=
 =?utf-8?B?WlBPdUkrSGxDS1VocUlYL0Q4THQxdFo0cGdtVUZOb1JGcm5TS1Y5RTBUSVN1?=
 =?utf-8?B?OGx3VTA2NjlvaEZ0a1liRHE1L291MFpmT1ZOcENPZS9VbU9PZWNhV3FtNGZa?=
 =?utf-8?B?SThGQ2ZuQ0R3TElmUWY2UVRYQ3ArRjVDdGhUTGlLclNTbzgwK2lxREpqRFZ3?=
 =?utf-8?B?Vjh2cytlRW14QzVZVkdUdm1QZlpXYTBVK01MdHFLQXVNdXZLRTI0bjFvb1Vz?=
 =?utf-8?B?akdMWlBKaWFCR0FzMFB4VUFEbW9STXNla2p6eW9WN2RjNjl3NjM0LzJ3bEg4?=
 =?utf-8?B?RDdVRGkva1JXVTM2QU9Sd0lnMzlHT1l5SkZvWW00SnhQYmZld2dOYWxYbGVu?=
 =?utf-8?B?NHZ6UmlHc3F1Z0VLV1Z3NWpIcktnQnlMTjZYaVQrNFNnY1IwTGo1em9HK1ZF?=
 =?utf-8?B?WlRFR3lpWTRGeVVqUzFrdDFPN21GcGYvMlp5c3VIMytvY2wrTEZBcHpiUEFN?=
 =?utf-8?B?bkdVZVRXdjNBUVBlSHBCdHVOSElEYThiWlJPNDNYZ3BHMnN3S09XWi9QMzZS?=
 =?utf-8?B?aE1OU3ZleVVra1VSdGd1NjhPWEZrV0piNy9KbHhkMXZjOEJaMnFMcGw0aUpK?=
 =?utf-8?B?K1RCNGpoNWNnbUpaQ0lTMFJwMVRnNFJzUWdhdlA5eGdMd3RwZ2ZidGdmVk5F?=
 =?utf-8?B?MDZ6VG9yRFZVMitmVVd0TWt0TUZsTnhDNXQydXM2TzJKL0ZrNm9ld1NvTmwv?=
 =?utf-8?B?TklzMkJ3ZW9CcjJLWEF3cWQ2STlETlJmUEtsZ2NORHR0akJJNG56cDVSMHNr?=
 =?utf-8?B?dEVJanE5NFBhd3p2d2RCTU9WeStLRWdYUllQMVErWTJ5cEhkc1l3V1R6YU5C?=
 =?utf-8?B?OTBpckFWaHdUZXdVb2o5R1c5YnYvRktNZ1ZJV08xQk9ZM3hhTEViZEJrekdZ?=
 =?utf-8?B?YnRxc0ZZVlBRL01rVVY1VGJsc3hZTjFjOWkzSm1tbnN6am1Tcm5oaWxtbDdt?=
 =?utf-8?B?UE9OS2NWT05HaHhzZWRVMmxCNUZUa2RvTnhvcjlkWTVWSlVzSXdmMjQvcjV6?=
 =?utf-8?B?b0NrakRwNS96YUptOUcvZllsV3BKS0VhODlvSmhZU0I4VStKM1ZTM1JKWS83?=
 =?utf-8?B?SW85dWhSWUNvV2d1VUpoSU4wcjlFSEJ6T0ZFRkdtZ2J3WUlFcTZKbDNGREJh?=
 =?utf-8?B?YnNDTVQybjlHWmJwYnZ6YUJPYUNTWHhIekRXb2YvdjMxTkpWR25EMjRSUnBQ?=
 =?utf-8?B?dVpQTUJRZWJuVTI5dnlEdlplN3kxM1ZJY3N5RzJyL1hLSFJkZnNQQXlNdEZ4?=
 =?utf-8?B?Rks1V1pGN3Y4N3ZCZksrMjhWam94RTFVUjJWMmlTZ3g5WmpvVzZQSXFMVDBO?=
 =?utf-8?B?anpnSW5zaGgvOUt3VWNXa2tPa0Y3amNLQnY3bVFxSjl1d1JnUWN5Y2lGSVMx?=
 =?utf-8?B?STZydi82WVNFa21PMDJYWXZPZnpFdnlTc3A1SldiZVZBcmZCeE9ZbDl5UFBp?=
 =?utf-8?B?UU1NT2lzeUpTTjUrNEkwcDU0bmVXQVdmUmZQZlNhTEN6OWpRVUpjT2hNZXRm?=
 =?utf-8?B?cUEvbzBIQm9PNWxkN0JyNDkxc3pTZ3hIRkx3WTFxSWlUN09FMlpFY1lmaXRk?=
 =?utf-8?B?bVNjK3hGRVBWTGNaa3R1UmhoK1EwSHZHVVdiOHpJZmdacVR3dXdYak1jOWFL?=
 =?utf-8?B?Nm1saWNVNlMzZm5BRHl1dDdwd0hoc3RsSktPbGtnbFYrdzZ0UE12OFdRTXg0?=
 =?utf-8?Q?+Fw9sZwQCsxqF8iA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A4B8BA4D520E24C8D81F0F72DEB5F0B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Sw0ZsuEACdccuS0dxpN7Al9pmbnWuwLE4bn7AkTurN0cJZrPGNfezXY/Rj8rRQc+5788rR0t7XvA2N2QkdyVcPSebbbYJYXH7coyqdIiRQxLsXdE5k3RhOCJTo3vwuo1boe1F5wOqImvn1ZFDp7Ud7eEKbH/cl38x0aZhV+eUnDBsiM82RQ+8fOVQWR4wVhiZTpc+BMekg46RT9Ge3zPBY7GRIQsZc4qFX41wX9LU4+mZ497hMDYn7tpbx4VPGhYAWxTSxk79iRlW+Ok9Q7wPdRivW5yPPkcI1V21s4TNENEEfxk0QrSRii0m7ejPX7bgU4BZgyu++LG3iVwWE24dQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd432286-29f3-4d77-971a-08df39148e7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2026 19:07:36.2078
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LqTwRPr2CbpyHUNvy4oT/ESrRo2so6A2bw/R0r/w/5LCPLWuqVhDbNgYz9PcnhcvyK4mPbL8j4YkkyvLzf0p7Qx38Z0GrPQec0iahgxJMtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
X-OriginatorOrg: intel.com

T24gTW9uLCAyMDI2LTExLTAyIGF0IDE3OjMyICswMDAwLCBLaXJ5bCBTaHV0c2VtYXUgd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDAyLCAyMDI2IGF0IDA0OjUzOjE3UE0gKzAwMDAsIEVkZ2Vjb21iZSwg
UmljayBQIHdyb3RlOg0KPiA+IERvIHlvdSBoYXBwZW4gdG8ga25vdyBpZiB0aGlzIHBlcmZvcm1h
bmNlIGltcGFjdCBpcyByZWxldmFudCBhdCBhbGwgaW4gdGhlDQo+ID4gbm9uIFNhZmUgUkVUIGNh
c2U/DQo+IA0KPiBZZXMsIGJvdGggc2lkZXMgb2YgdGhlIGNvbXBhcmlzb24gYXJlIHRoZSBzYW1l
IGtlcm5lbCB3aXRoIFNhZmUgUkVUIG9uLA0KPiB3aXRoIGFuZCB3aXRob3V0IHRoZSBwYXRjaC4N
Cj4gDQo+IFdpdGhvdXQgU2FmZSBSRVQgKHNwZWNfcnN0YWNrX292ZXJmbG93PW9mZiwgc2FtZSB0
d28ga2VybmVscykgdGhlIGNhbGwNCj4gYW5kIHJldHVybiBwcmVkaWN0IGZpbmU6IGJyYW5jaCBt
aXNzZXMgYXJlIHRoZSBzYW1lIHdpdGggYW5kIHdpdGhvdXQgdGhlDQo+IHBhdGNoLCBhbmQgdGhl
IGdhaW4gaXMgdW5kZXIgMiUsIHdpdGhpbiBub2lzZS4NCg0KSG1tLCBJJ2Qgd29uZGVyIGlmIHRo
ZSBmaXhlcyB0YWcgaXMgYXBwcm9wcmlhdGUgdGhlbi4gU2hvdWxkIGl0IGJlIHRoZSBzYWZlIHJl
dA0KY29tbWl0cz8NCg0KPiANCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9tbS9wZ3RhYmxl
LmMgYi9hcmNoL3g4Ni9tbS9wZ3RhYmxlLmMNCj4gPiA+IGluZGV4IDRhMTA1ZjI4M2NmYi4uMzM1
MmJjNjkwNGYzIDEwMDY0NA0KPiA+ID4gLS0tIGEvYXJjaC94ODYvbW0vcGd0YWJsZS5jDQo+ID4g
PiArKysgYi9hcmNoL3g4Ni9tbS9wZ3RhYmxlLmMNCj4gPiA+IEBAIC03OTgsNiArNzk4LDcgQEAg
cG1kX3QgcG1kX21rd3JpdGUocG1kX3QgcG1kLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QNCj4gPiA+
ICp2bWEpDQo+ID4gPiDCoAlyZXR1cm4gcG1kX2NsZWFyX3NhdmVkZGlydHkocG1kKTsNCj4gPiA+
IMKgfQ0KPiA+ID4gwqANCj4gPiA+ICsjaWZkZWYgQ09ORklHX0RFQlVHX1ZNDQo+ID4gPiDCoHZv
aWQgYXJjaF9jaGVja196YXBwZWRfcHRlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBwdGVf
dCBwdGUpDQo+ID4gPiDCoHsNCj4gPiA+IMKgCS8qDQo+ID4gPiBAQCAtODIzLDMgKzgyNCw0IEBA
IHZvaWQgYXJjaF9jaGVja196YXBwZWRfcHVkKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLA0K
PiA+ID4gcHVkX3QgcHVkKQ0KPiA+ID4gwqAJLyogU2VlIG5vdGUgaW4gYXJjaF9jaGVja196YXBw
ZWRfcHRlKCkgKi8NCj4gPiA+IMKgCVZNX1dBUk5fT05fT05DRSghKHZtYS0+dm1fZmxhZ3MgJiBW
TV9TSEFET1dfU1RBQ0spICYmDQo+ID4gPiBwdWRfc2hzdGsocHVkKSk7DQo+ID4gDQo+ID4gSSBn
dWVzcyBhbGwgb2YgdGhlc2UgZG9uJ3QgbmVlZCB0byBiZSB0aGUgIlZNX1dBUk5fIiB2YXJpZXRp
ZXMgaWYgdGhleSBhcmUNCj4gPiBjb21waWxlZCBvdXQgaW4gdGhlIG90aGVyIGNhc2UuDQo+IA0K
PiBJIGNhbiBkbyBlaXRoZXIgd2F5LiBJdCBpcyBmdW5jdGlvbmFsbHkgZXF1aXZhbGVudC4NCg0K
T3RoZXJ3aXNlIGl0J3MgZWZmZWN0aXZlbHkgYSBkdXBsaWNhdGUgY2hlY2suDQoNCg==
