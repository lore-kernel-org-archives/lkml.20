Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793721010;
	b=AspgICirsjENiPhJBFTp4HnkVk0Oi4NLkTsfXWZyhsB0eZ5JC+9bEyYtxiYEgzt8MDAb
	 kcDxBpdKWJhqJMdhz5CAyumca3M82afeMqWKU6FJNxjHm2bebE+MHl0wooLcyChokKiFU
	 3/xZX1iefG9OWvQq55yCnMHyLVv58aUFqnB0eVnTBmE7n/CDRf1HVl2RDc/OgSoaTpX9Q
	 yhNbGIJbT+2q0dJbvMIVBdA/BAp1LLAUkeOluFpGJyK56dzdnCCGRDIL9JK2gKZcAnOBN
	 Lpx90ldTKRyrR13lnkm5niTdcwZx7wBFjGZwmnZdFuIlNQXpURnLKf4jL8C6Gmn/e6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721010;
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
	bh=8AQtpdmbC/5712jQGLkTIYzOxhRwpEl7qjbwqBOqUoY=;
	b=cfKz33y9z39MxJS/FPtyNNwjqvc7eWJLYasaQJJXnuCagvcYRSnHEfArCMjuNx/fJb1x
	 UME/ejbUmYqTPepWqtwyXIKu6/J57prXmIJSHDwRIifTBr4X//0m7kuI2ce/OFVjfujOV
	 gk1SGLeWAFDP587Y6JpHhWbKJ0ImbVzJBUC8u3S9ED4hHOJ733HJX3SAyLwFP6cq93Yf3
	 1qoyahs9TtC0G/bUoyeohq09iVmGNTlfvPvCtAmZmGjYEnmmBZMEwr/Jze2LB7G+9z2sk
	 4j/outJN0lpdSf0+x8eAywli24Dqzyb/qxxMGeePPVw/eRgud69nnXVeAF0NORefsuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HM3br+mL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FE2606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88FE2606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HM3br+mL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793721008; x=1825257008;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8AQtpdmbC/5712jQGLkTIYzOxhRwpEl7qjbwqBOqUoY=;
  b=HM3br+mLr5eiSoo6L9zTonGaoxW/VkvM27NzUYbTYuVlD/+UXHWk59jU
   yejG1bz2ea8kqzZucH/HkRk5PecCtnUO+6Fe6BZ5iZz8HVrEWbcgfRgJc
   MdTMFqUsRwIQ0JIKpHPH4al8sWCRJgCdAUdG+YnDkaQgM6mfDYZgu81o+
   iqXLflWTjCoWecDdEcyEUxVUmt0Lk3/fVB/5cRLMzr88pPsKVVKA4ymiq
   GB8UHK+GY3B5s3r1df6yDagezUm08hWIVQ713hOMDirLhq1RRjvjGM42J
   EcEUzrf04jGgU2GXe2n9btVhpPupoxST423wBge1MMsc2yCTiu91GUHcY
   w==;
X-CSE-ConnectionGUID: sTIxeWf3QKaQ2+eJPXBH/A==
X-CSE-MsgGUID: /y/he3uGSEeMzOSU+py3Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2330384"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2330384"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 07:50:08 -0800
X-CSE-ConnectionGUID: PX0/GnnPQpePNN4LEUmiNA==
X-CSE-MsgGUID: ULMyKlVcS7K782cRXJrY4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6540527"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 07:50:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 07:50:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 07:50:06 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 07:50:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJ7spnxfbBS1eRYxzOOXJtLkNyL2Sz3Oj4bt5AmNf9+xXXA2vF2mlr6S8Q4Z6G+A0sbHXPz21IkCtAN1laCFgOGT3lTzXEm7qMIAsiTXA3HqOz1vM0/KG2RtMOdCoyjxETtwj8QUQ6UBcMMtLeLWAT+8KGNIRbWA4JeTrow2tRi62Pjg3WxbfUOo/TJnwimZi62GIjDd0O3brvyw5pZ7l3CSICw7HpH2/SOnCxByF4GPrW/48o/XJzIcdCeMpy7RDyi7hzKgLboV4kcBWRhGOJQyc9Ogdzr/7D6Lz11TowU6II/4QEFppj/3i09q8fFDYilf+5p4Z9iwinqt8CVZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8AQtpdmbC/5712jQGLkTIYzOxhRwpEl7qjbwqBOqUoY=;
 b=m/+A7xkGkk+j/jPx5msy31OypO7Wx5mpyxkHwEs8mPj51NwIoKZq/VtKnFrrvoJUQbnUjfKuL6JQM+vAhtco5QvY2WxNeLPCuTbJuGumiKodXghqTemu5eS3bVGtjvSH1ZOBPcjWuN42lXs5h/Ax3KFRA45UQ+trxPiZ5LF/rdEk1SC4G/ZHNn42Vl/4UNyvBopsLXGgHzJLC5pL5QeiNKr7lRKOWA5B6Fd7z6cgs4xtAVBu+CwPOTSH8GeP4YkOJhf5u55K0yxupsW2IduYKdaDAd89WLKKgBHTiERtr15xmJgg20K2gdRgAqad7m6LUkkC2Qo+Xli8m797LL/uOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 (2603:10b6:208:549::23) by LV0PR11MB242363.namprd11.prod.outlook.com
 (2603:10b6:408:602::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 15:50:04 +0000
Received: from IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57]) by IA3PR11MB634048.namprd11.prod.outlook.com
 ([fe80::760f:f0a4:7417:6e57%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 15:50:04 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "kas@kernel.org" <kas@kernel.org>, "Hansen, Dave" <dave.hansen@intel.com>
CC: "andrew+kernel@donnellan.id.au" <andrew+kernel@donnellan.id.au>,
	"luto@kernel.org" <luto@kernel.org>, "pasha.tatashin@soleen.com"
	<pasha.tatashin@soleen.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"kernel-team@meta.com" <kernel-team@meta.com>, "david@kernel.org"
	<david@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "peterx@redhat.com" <peterx@redhat.com>,
	"tj@kernel.org" <tj@kernel.org>, "azpijr@gmail.com" <azpijr@gmail.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"tglx@kernel.org" <tglx@kernel.org>, "peterz@infradead.org"
	<peterz@infradead.org>, "rmclure@linux.ibm.com" <rmclure@linux.ibm.com>,
	"bp@alien8.de" <bp@alien8.de>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/mm: Define the zapped-entry checks only with
 CONFIG_DEBUG_VM
Thread-Topic: [PATCH] x86/mm: Define the zapped-entry checks only with
 CONFIG_DEBUG_VM
Thread-Index: AQHdatgdOWG1gcUTjkG6z8ShoYs60bcbSCGAgADaLICAAF39gA==
Date: Tue, 3 Nov 2026 15:50:04 +0000
Message-ID: <b45fe4c2a730a23845a36b5beba4f434c7be7477.camel@intel.com>
References: <20261102144001.342837-1-kas@kernel.org>
	 <b04316eb-a2f8-4587-9392-e673c7bd2fc8@intel.com>
	 <aumzjHyJsshPJBUI@thinkstation>
In-Reply-To: <aumzjHyJsshPJBUI@thinkstation>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB634048:EE_|LV0PR11MB242363:EE_
x-ms-office365-filtering-correlation-id: e50cca75-7938-45c1-cd8d-08df39c220a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|261026121527099003|261102123227099003|261021121427099003|56012099006|11063799006|4143699003|6133799003|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: Ssz6TOudzHql+HGFMj2K2n8+Uiws756e3AZ2eE25ARFF9e8Gyan4rWx5RyFu2h7xU03CgKP9BCH8JW6NOP46CFtIE+1TxGf7Z1QYOt26xmoqNI/9Wr+u7WWv38uLkyXxa40Z0WeeHBXkBA550oCYAqfK6AnrjuP0JGuf9Dn35PbH/R6k0t5+Y7x8CzUuMXvXeYGq/HPZnwkq+shSnk4ltu00iwZqmpk8OjZKQBqFCGNYlgPceyoebeKNGkEKur7WOaapu64OcO/CJIqcYzQt0r68/gWDtWMJAgh61UgkFA6RLVovEdABcc+QBd+H0jJw32MLb1gcwiUhuLeuGrMiyiVSbxQJKWbBeZTshMBctQG7V2b3M1f4w8U1WGx9DrchVNOaBefnZnbmwlGgrABlDM4Lx2pRwRE5W92TDW4oWUGwA80BgLI4ME/nmkLARGEdP93+O8s6JaBq5RkOnOHvxPNir22VhvoEPbRxDe+ZBFhM6G2Lm5yo6SZ0rk1kF2UmcUTLcgaw01CrZDgDPxxav73+fvGDHDf3q+mR20WBYLA6aIYanpU5sjxpQ858COtaOTh2QinFMpvF3bGeb5cEMKZC4yyOvmLmdQWgD/HeZZYmce4RYoSDdpXz/ZU7rVavBAG6piwb2jHdt+sJAsL9nMEhHYFm+VrV4M0HFgIS7oGOYeOUOFa2eqSA7N8aC8vmP4Z4Z/42l3/70NikQzTKSALU9Zd/NONFq77rBAKIhuQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB634048.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(261026121527099003)(261102123227099003)(261021121427099003)(56012099006)(11063799006)(4143699003)(6133799003)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEtyelgwc09hN3RIWG1tdGdJZEdTQUtSUVVHQlR2TStHTzNLUEpCdmx2elN2?=
 =?utf-8?B?R0Z1cEpwRGg0U05Wd0JVUGN2dllMNGZjUkVhTU9zRWVqOVlEbHZyVCtNZUFk?=
 =?utf-8?B?RThxdDZQSkswZ3RZL0hyNklJNFJCODZmeGMzdGp1WnpteFlhaTVZMXAvRHBx?=
 =?utf-8?B?cXBDWFNQWXhoM1M1bGRYTjdYMkRkMW5Cdm0yckk2Q1hncTFNV1Z3b1VNZmRa?=
 =?utf-8?B?TFluTGJRT1JnK3dEYTlwd3k0Z08wZTlCTTBiY0UvQitrcjYzalFjMEVaR3po?=
 =?utf-8?B?dzNKcGJuM3JORUIyVGxnUXcvalJqWjJEY3U1Njc3ZTNzNFlKcnltTXF4eVJT?=
 =?utf-8?B?d2RjZkVNQ0xUZVlaNTlLaW93YmoxenNBZi9KWUtVWklGQStQbkNKU3ozRDVr?=
 =?utf-8?B?VzFEVm1LKzJXQUhVSEVvQUF3QkRQUWZOVHhycXFjL1M5NG9pTGVudnhqTFZj?=
 =?utf-8?B?TmFNaER1OEt4MHRRS256N2ZlOWFBcUdZVlIzakxYYS9pUndnMlYwUlJDa0Rt?=
 =?utf-8?B?QjdoaEt1OGZpSWI4RnJ0ZmFMdlZZc21pRkh6MmRyaXBINVdEaVVtYTZpeEVn?=
 =?utf-8?B?cW9sYUE5U0lzQXBjak1URFhYNkFhcWxkS2xUVktOSGhRTnluSEtScy8rcmRv?=
 =?utf-8?B?aEluckc1cE9TVDJZdXRpekxVMDRQem9IcVpsUzF6R2ErOW43ZnFlclBGdzda?=
 =?utf-8?B?bGk3N29vc29RcUVOSzNYaUNQa2E5VmJ2cUJTcG9YTnZoa0Jlb3FCYWFtYUlm?=
 =?utf-8?B?TDJhZjFTNnZXMGFZM01OcExqUkVxWmNFK1pIWmQzRy80ZzlUMmJHalJ5Z003?=
 =?utf-8?B?RG81a3dUZ1dDbHEycHF4am5VMkRjSE95UlBLN2pZMjlyeEZkemZob2dGOTJU?=
 =?utf-8?B?V2wxR3owQVpFY1ZlcUZtd2tyYTJ5UEttc3pFNmpDeFlTangxS21zTjFrL3I4?=
 =?utf-8?B?VmFCdnFKQy9JaVFobDVNRkkzYzdjQkcyOHJsc0wyQzl2c0t6NVpyaXVMNTJ2?=
 =?utf-8?B?U0VVODl3bFc0WllyY3hTSGx0am5FNER1bHRtWldWQXdSZ2xBeWRVNVE0eFF5?=
 =?utf-8?B?R25iMmJ0SUdyN05PNFJWRlZnRVFvMVJUaTJyM0ZRQ3dsRmI4ek5ZUXltbWxm?=
 =?utf-8?B?QzMzQ2FqY3h2bXpLMkxDeDR0NGJ6dEhpbjhhT3plQTh4OHRrRWkrSzFwbndR?=
 =?utf-8?B?YjU4ZnhFYzlLVTFLV1F3WklaK09QbmNCc013Wlo3d2pkdWlLeWRFWGR0YjM5?=
 =?utf-8?B?dElucnZNRFlWaVdiaDU1VkpwVmdVQ0FMekY0NTB1bjhhTXE1bEVKbG9LU3hM?=
 =?utf-8?B?aEJBdUVvdEZsZDh3Tkx6WkRhMzFFYjAwMzBLeC9iZkEzdGRhNkI5cDNiSXpk?=
 =?utf-8?B?WlZ1VEtPVURwd1ZvRXlvUU5vZVhHV1cybTM2U2llWTJpeFhYU1RFVjM3cDNk?=
 =?utf-8?B?N0RUT2pWVmtMTjVKcnZ6MzZpazJhYWZJMXF0Uk9ySlIvazgraU0xU3UzTzNM?=
 =?utf-8?B?Vjg4b2VTU3h0bndoUUwyaHRtKzI0S0hJQVlKMjN0eVRoQm0rZ0dpK3hqeVRD?=
 =?utf-8?B?WUw4Z3FKMXRya1NlVEEzQXNjeVFQSUZQSFFJRURsQTMwSXM4a2kxNy9zbnla?=
 =?utf-8?B?VHFWdzZjUlpqSGV3MEh6QnlLQ01VTWtkVlpwODdtc1pXM2hrVUFOUXhYNTFk?=
 =?utf-8?B?QU1KMzhxUUp1eVBQd1FBZHlwbWN5Z2dpUk5CcG52eTZmL0xtN2ZGVGwrdktm?=
 =?utf-8?B?TUR5UGQyY3c2TXBuSTIrcXBydEJRRmthd0lxNVN2NDc3SUg4VGlDLzFReC9m?=
 =?utf-8?B?WWhPMWFpdFlWUjRWUms4ek1UTld2QlNqbytxNVRlcnZkWVFWODgxdXdTdUl1?=
 =?utf-8?B?TWZZaDBjdytKMnRvbXNFZWJ2QXRTcEkydzFxd1A3WEp0endtaFNvanJWRHRj?=
 =?utf-8?B?aFZCZFkxdk5GNy9sZ2YxaHlSNWV6R3lIQnNqR2oxUytpdnNTMjhtOFpkcEx0?=
 =?utf-8?B?QVNWV2J6NUd6WlZhODd2dU5ZRzQ0ek1hMXBGd1RjeWQvY1p1SXVSdldocGc0?=
 =?utf-8?B?QmZyVTRQa2JMZUNpYnFoejh1UzR1aGtxdFNCUDRPYVpZelhyNENYY2VvaGE0?=
 =?utf-8?B?SnZ2aXhZT3pIenE3aCs1ZCs1cDFsblcyeVhFS3JHa0FpaXBRdEI2R1lndHVH?=
 =?utf-8?B?Q1BEWi9maGRWdzZkOEZMU25LRElmU2xWTC9mNHk2MUxLR1hReWwzaStyS09p?=
 =?utf-8?B?ZDFUSGhxbDlMQnlzYjUvSzRuc3JOM2VWamlQTVdQUUExU2JpM2kyMVRtdzNh?=
 =?utf-8?B?TVNyblFyNC9RdXgzWUlwZjlkTjVXUVZaWDRCYWVNbHhHNm1vUW15UjVNZXMw?=
 =?utf-8?Q?HsCR9jPK7woH1QIA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5BF12A55932124D8C511F5915F5A1A4@namprd11.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: oVN33P6XlYuURcHme4QESLaIFvNchNvfK/pix78JL/H32rfNQdK1OnZcahqYBYLsM6KJZmi0PMPJZamtWfwk8XgR9sJIB1ICLOHWcMJtnbrS2AJV+Zh0Ie2pfhjgQYexWvC5ggHkphOMpmBC3YvXiHDAKZdCo/8/B9Rbj8tW+ERjithinWpXWIIycWtWC5m8px+89QZ7JoBqnA9BK9CamGUwqfmhQ0lxSyGzmCXCjGLm7/GDCjJy5qxgE2KaSQWvm1kKvKFoPEZXLXWK0OwZTNiWhEXlRHxLg1IpO6jz5WcJePf9QAZhoDEePpYm9Q/l8fPil7jAiKp4V/r9x30kEg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB634048.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e50cca75-7938-45c1-cd8d-08df39c220a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 15:50:04.3867
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NwdEREj1f6bCA+xaDHmPNzT27dWi68jYeXtVHhBmZSDTT9WQhB0IPM0SEoySS/7CY5bAIqOYanR8S6/RCo9ocXQ//nXq+wUkzJdskUXTWrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB242363
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI2LTExLTAzIGF0IDEwOjEzICswMDAwLCBLaXJ5bCBTaHV0c2VtYXUgd3JvdGU6
DQo+IE9uIE1vbiwgTm92IDAyLCAyMDI2IGF0IDAxOjEyOjQ3UE0gLTA4MDAsIERhdmUgSGFuc2Vu
IHdyb3RlOg0KPiA+IE9yLCBoZWNrLCBJJ20gbm90IHRoYXQgYXR0YWNoZWQgdG8gdGhlc2UgY2hl
Y2tzLiBMZXQncyBqdXN0IGtpbGwgdGhlbS4NCj4gDQo+IFdvcmtzIGZvciBtZS4geDg2IGlzIHRo
ZSBvbmx5IGFyY2hpdGVjdHVyZSB3aXRoIHRoZW0sIGFsdGhvdWdoIGFybTY0IGFuZA0KPiByaXNj
diBoYXZlIHNoYWRvdyBzdGFja3MgdG9vLCBhbmQgdGhlIHg4NiBoZWxwZXJzIGFscmVhZHkga2Vl
cA0KPiBXcml0ZT0wLERpcnR5PTEgb3V0IG9mIG90aGVyIFZNQXMuIFBhdGNoIGJlbG93LCB3aXRo
b3V0IHRoZSBGaXhlczogdGFnLg0KPiANCj4gUmljaywgYW55IG9iamVjdGlvbj8NCg0KRWgsIEkg
Z3Vlc3MgSSdtIGx1a2V3YXJtIG9uIGl0LiBUaGVzZSBjaGVja3Mgb25seSBjYXRjaCB0aGUgY2Fz
ZSBhdCB6YXAgdGltZSwgc28NCml0J3Mgbm90IGEgaHVnZSBwcm90ZWN0aW9uIHRoYXQgaXMgYmVp
bmcgcHVsbGVkIG91dC4gSSB0aG91Z2h0IHRoZXkgd2VyZSB1c2VmdWwuDQpBdCB0aGUgc2FtZSB0
aW1lLCB0aGV5IGhhdmUgbmV2ZXIgdHJpZ2dlcmVkLg0K
