Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9355750C2B0;
	Thu,  3 Sep 2026 19:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788464628; cv=fail; b=rqFegyjegOg+kT/DGk7J0cmOoKTQFx9vfKKrTk8PsHIcryg4Qz+Z3f4GJjZWXmqsjtobsC7AzWr+iSSxrcbvTHhoQMgycBdLLFtryZb36/Nowg/CRH8TzrJuAud4l0mHCoOHBb5Dsq9JGSE5XUcYIcd6RuEYfriIptll8Ae4IRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788464628; c=relaxed/simple;
	bh=eR+0FF0ca/40HVqpzoyUuV7lBgR8ACXe0fHjRzNBBhM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AGogJXaxX7X7eXrBx9gwoga6qYwMxZCTHizAp4Fzntuulbyy8rmrEPSZg9t+e1bjc9GQm+UbTZKU8vQeHWDmumikwiA+JU4mLnSHJjxySZLXWxnZOC3V72WIdWPSLeoQNai36+LRIvvktdr/WtSYRLdh+sYwKIfE7hyDsYPtHJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VheggrWU; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VheggrWU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788464618; x=1820000618;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eR+0FF0ca/40HVqpzoyUuV7lBgR8ACXe0fHjRzNBBhM=;
  b=VheggrWUbh52sXp2MQmcTFa/9UdAfjbkf6yzMVSZr8ZxV8VJeyE+pvzX
   8dWSCN4ZBwZ/CcNDLN7caRGl0SWrdqF12O7uEnf+RIqoSGJz0P6c75IFA
   JA3IIXyiQzU4075Ucf+Uj6EMEw43CUZrJIvnsRaVsxCO5Uqjta5da6RMh
   9uN83r/22DhsRjkiRBp/Fiyvlk67HaKb0+LvRYpIgpqmBQeeUoF06mkAT
   +9+f4goipDDmgGou4aibFEQ687UXsdDBYheug9DDkZ9WlZntHS4dQ+JRS
   TG51qpYCvFGeepzodgDjubVkb1iHcvkRIVKJ428eKGg7IBZRPES3jiFa6
   Q==;
X-CSE-ConnectionGUID: tTxIuoB7SYu9XDG0QhoYZw==
X-CSE-MsgGUID: uEbLolgUR/23VUP9F3JtFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92658410"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92658410"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 12:43:32 -0700
X-CSE-ConnectionGUID: 0N8Ff5obSX2WA85fcGmtDw==
X-CSE-MsgGUID: GQxkjbMSSjynA3ogkgp7lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="270353025"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 12:43:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 12:43:31 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 12:43:31 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.11)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 12:43:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hq4ZzMaMh+rgIaWyibtkHrmsoZPtBAgfk8IQpOPOsJjgrh6+4SCSbGOIAxh140WdBOJVVyrCBq9F8egfv/aHcRxz3xZWZc3ZgxSgyp+G+/YAeeBXIcc3lTEwYLbGLqpFi1AltF4sEXHkM1ItZREBOH0NsD2Uj1kcsZV299YhUNmm6kjesGczs0eXa2Il+hH3QQn+9iBrVmu7bMFgFutG8G3gjyuHKcEVtp8yR7WK4v+3bQtrYWS5hBpUjQHCugaGVdK3LN4g6j4XLNOY3MY1U8JbgwIrEY4sR2Yj7qeOCvOuY2bXs9SSCVEt+lRi/x1oxhnYA/2f3FTA6ZBqBInDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eR+0FF0ca/40HVqpzoyUuV7lBgR8ACXe0fHjRzNBBhM=;
 b=c7xXGMiPnA84ij7kcYUXTBLO5BPFkTmXK9q9Hw/p5nF/XoYcB950EVMoeNCrgfTyWegRcIT7JUIFVojLlB5A/4eqNiM9tMfDbgFtaaiX8n+9LQk4EhydIiq/azzNCcXmg0OntIney77MdVXL4SyupY0J8rqg9Np89Y0T4c56sBE1cO4oMbZlyc0rl6GR+1losO5wJL054a/PV1eCY+9TR5V7GiGzcqSPoeZbhmmSpinJNUe7KSSz/kosje1rDZDVatySZhOZq5m/ME2uFYx5fVMWUleRGGzYNQ1xrYPjcQVjQanapXHb/uye8NW/p9BLgnLQD3M07y2nz38barE6HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DS4PR11MB131308.namprd11.prod.outlook.com (2603:10b6:8:502::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:43:28 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 19:43:28 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Aaron Tomlin <atomlin@atomlin.com>, Marco Crivellari
	<marco.crivellari@suse.com>
CC: "bp@alien8.de" <bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"hpa@zytor.com" <hpa@zytor.com>, "frederic@kernel.org" <frederic@kernel.org>,
	"neelx@suse.com" <neelx@suse.com>, "sean@ashe.io" <sean@ashe.io>,
	"chjohnst@gmail.com" <chjohnst@gmail.com>, "mproche@gmail.com"
	<mproche@gmail.com>, "nick.lange@gmail.com" <nick.lange@gmail.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] x86/mce: Avoid arming periodic polling timer when
 not required
Thread-Topic: [PATCH v4 2/2] x86/mce: Avoid arming periodic polling timer when
 not required
Thread-Index: AQHdO1qbO7zN8Pg6EE2Ffh60tVK1era8i5MAgACvuQCAAAZ5YA==
Date: Thu, 3 Sep 2026 19:43:28 +0000
Message-ID: <SJ1PR11MB60838CF1E66802F66273CD26FCB62@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260903041320.179965-1-atomlin@atomlin.com>
 <20260903041320.179965-3-atomlin@atomlin.com>
 <CAAofZF7rNbEZuiGJXyjn+wwtdF0Y9vDEo2hGhJak6CCkP8YB-g@mail.gmail.com>
 <meco6huj6tnwozht5h3zrp22f5ljtvyulphesu7csou7y64uoz@4zkit3wvrtea>
In-Reply-To: <meco6huj6tnwozht5h3zrp22f5ljtvyulphesu7csou7y64uoz@4zkit3wvrtea>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DS4PR11MB131308:EE_
x-ms-office365-filtering-correlation-id: 7290f5a8-098a-4386-32c3-08df09f3a063
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|7416014|366016|38070700021|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: UTRqRPsI3wdbdrwiQFDohdKvE7AgagdVGy7WBLCAzcZzKhFxkNN0bWfoUYVWLEID4SPYYKnLQE4CSy7ra2D5FLyqsgil/GBMyM8UvpC9lMDY1YymdO3drV0E3k/LuggnY3XGsYbrHobwQlpmJgfq3TFDwMos9Oinsi9QxmfiOcH+DRAfCuXY1y+OY3RLZnAslllBFNr0vEH0q03EiAB2fYPpSP7Oqda5FuI0CnNwzH9pipl9l5WAGprtYwktfrH3PG9DT2q2X4VvFrc6UzFB+9dNNsgCFJlN55bis403UjT2RiXJgkDwADxpIv+Wa2rXOci75XjbIJPLrN5TI2EaU9Oek0Wrw/YQ03iTCJEXr1s4jqD+Mir/QyQTMh3P/LUPprD0AgnaLxhawEqbbsmshEO88czPw3CBD9l/dUhinjq3a4VhUgOk0WdpnTSvLwmWAR8NjaiReV5aTlBD4dKrqo+kZBbby3UdvG08GTCb9NwDs4IdJgWfVJJx9v+ve7sOblwYbCGxB9lGp6SqXMoHGbRoYRoTs7Jw2Icig8LcL4ZYJXtgQ052ZD35Iax5+O5lVGHvBJxpiR9sCKwfu9irwhEebNNOW5aG4fxYanGiaNHAcUQbB+y6A6Ap860AIoLpnFzwldKi5ozKM6QhXBRFyQXZt13jTay8BJ3V3LJmGFY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(7416014)(366016)(38070700021)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVZiU2ZvalQ5Uk40Q3k4MXlEb3BweVFCS0RITHVBYmkwYlpaNHpock9IK201?=
 =?utf-8?B?R2lvaHdyOEJ5d2c1TDhIRmxjREdlanJqcFBpbnNnekNvWkFLcGxmRzNQOHpv?=
 =?utf-8?B?N3ZiRkxQeU9DMDJYUHlMajdEOCtpUk5EWUVkQmpFNll1d0FlWlFyRTk2M09C?=
 =?utf-8?B?RkRhTXZkZkFtSlBDbFVsVG53T1VxSmgxV1I5SEtTZ3hjV3YyZUQ1TkhhVk9o?=
 =?utf-8?B?WHY0RU55YVJ2K1Q1WjZJaXFDUnV3ZWx4aDQyTDRURjk0N3REZTU3ckY0Z2Yr?=
 =?utf-8?B?bnI2S2V4cWU3UzJ0NndjSE4vUktRdVhZVjM0bkl0dGVscHVkOS8yM2pDdkNO?=
 =?utf-8?B?MVNpSUZtZ3piZWxnSmY5K2p0a28vaVF2ZkFjdy9PRk9Jc1RQeitMaGhQdWxD?=
 =?utf-8?B?aWV4elQvV1VIaGpiTTc1K294RjF3VjlTMEJwMnNzMDJVWU9HVmRzRlZ5bTdt?=
 =?utf-8?B?NGNzdmM2S2V3TGpOY29LYnplcms4WGFneEFpZ2pNWGNHem1xNTRkVnlXVW9C?=
 =?utf-8?B?RndGVzFHaXZLSWpkOEpOckZzTkVOSmlLTXFHM0hsby9YNXdXWURxT1VsYTQr?=
 =?utf-8?B?Wi9OTUZMamFlOE80UkNvKzB1VHRmZzFhNXJDT1p3Uko0SHUwM0Y2SE1CSm5x?=
 =?utf-8?B?eWJGOXgwVXBDU1JURDBnaklubTNvUUt5cC9WTzJqQmxIS1h3VUFTNnY1eVVN?=
 =?utf-8?B?ZHFRNVMzR1A0cHN6Ylg4M2Vncmkza0VreThJVEZOVFViL3ZqQ1hyQ3BRZmoy?=
 =?utf-8?B?elJqaWFHMXlGZEMweGxPaklSbm90aDZSekpyTmZXR2RKR0lRb3RrZWJOblNk?=
 =?utf-8?B?SlFNdUxRWWVFcThLTmlsKzgvcnAwdjN4ZGg5L0Z4V2NDQXJNa2o4WWxoZWpT?=
 =?utf-8?B?NFRTVE8xcFVNamJJRlV6aGppR3VTYWREK3pwUUxPSzY0S013U0ZhbnlzNE13?=
 =?utf-8?B?Y0xtZXVrNkF0VUg3dW12eE9nNWE3SFppM2xEeERIclhQaUpkcE5XdWdONEZT?=
 =?utf-8?B?S1RyWFpUcDdORWw4WXhnaW9IK2N4Q2xsUURyWlhUZU5EWkhrY3Fib1JNVUJN?=
 =?utf-8?B?cURzbU9EZkxZbExKdFJNK0lYQ1Y5alZxQUNPMDVXUDNlU0JCMGhPSWJDRmZV?=
 =?utf-8?B?YzQ5bm9lU1ROaG45OXduc1BsQUxVWDRGWVFCSDBYM0pCSTNHS3JjcjZGNHh1?=
 =?utf-8?B?bjBTd1RqbXp4S0k5S1daZi9vemJnSDVCb0lQdHc2Q1dYUWVVZlJZb1oyeU1v?=
 =?utf-8?B?TmlGTm1tWlY0TVRpMWsrYWVGQlJjK1I3WGtQMzdtYXRLcnNCQk50VWU0cGtE?=
 =?utf-8?B?ZW91VU5MdE9jdm1tZkZBNkNXUmlKS1pqSVNsUTlJMm84WWNOZ0tOcVg5RklS?=
 =?utf-8?B?aStYTGZaRGVPcURoTCtxY1pQMlNrSTlvMnNXU3hUdFJ2RzhCS1BiZUtqVFd1?=
 =?utf-8?B?Vk1RQUZPZW82S3g2cld6cTJkZzdvVkdURVFyYTdYQjNCaVUxNDJNL0lLUWRL?=
 =?utf-8?B?SEc1RVFtVFduSnNxbjJDaDNHeUJxSXgzS0M1OWVMSzkrTDJ3SUxaQit3WU5s?=
 =?utf-8?B?QjV0SjhEeUtFQWg3dmdISnpaWk9TR3hvU1NDVWtVUVltdnd1UEFZUFpQTkJQ?=
 =?utf-8?B?bU5EUHRMTXRkaHBRQXRSWVdoaUtDU2ZZZUZYcnlVNVgvR0dzekZMTkRXMmd6?=
 =?utf-8?B?R2V4c0llZnBySXRJYXZpQ0dOVHh2dEh5cnJjL20xc0hEZS93YkhRZ2w3WkE4?=
 =?utf-8?B?a0dlZ1Y3aVUxU3dXNVZHU3ptWExCbGZ5bnQyeG9IWkFzY0tENW4rTWMzcW9C?=
 =?utf-8?B?aFBzbzgrWTU1aDBtUEYwdkkvS2xIVndNalAwelhDQ2piL0xrT0xVb216VDBS?=
 =?utf-8?B?Tld4UEhTemJlUWt3bloycFpGN3RtYTUyYkdXZTJlalluMlNKbzZ0dTRKOTNR?=
 =?utf-8?B?NjBoS1FoVHpTMnBjb2YvQzFQelAyVVpCbVpiaXpVOXFzbTBFVFE1SHlFSWtX?=
 =?utf-8?B?SHRIRTRoeThkZnlWK1lGZGU3bHp2VS92dE4rMSsvdEtBWjcrdG1jTm9jRlQx?=
 =?utf-8?B?OFdUWTJaZ0RYTVp3ZVJmRHFoTXpCcnRMc3R0eVFkM1lMTXZNaFo3bjcreG8z?=
 =?utf-8?B?RnhpQU5vY0wxYUxzVmoyM3pmM21TcUR2V0F1TEFvWittejJaQ2VISG05aWhN?=
 =?utf-8?B?eGx4TTBvSHN6NmZySkROM3JHRHRRMUZOdWVyVU02ZlRvWGRsdEdHTng3cG1k?=
 =?utf-8?B?ZmE1SmgyTkNnWSs3cnNlNnZXOHJQQjE3dFdSZHJSSzV0UkRWemM1TGFjQWQx?=
 =?utf-8?Q?2Oeiakjs/fxmBVbGrO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: xtXx7dGg8/rIiswrNTOr7XSG42MjLopPPkMg3mDIlm5j+LOcvcX7TEm7zwL7IMeoV1B0xfrkHPg7xkjKxa56RXeAafU74H5dOfG/pzS40SR28Qc1tPpUUkpnQxme9ubGcfOwl4BU2C3g99vOZkNlvUYwnckn0uwukoB8WgoOWj5Hxq8pdTpd+nY3ZlrVaMFNYwLpe/LyUOvW5macNwUMLZKSATOGBrVdUONYXp8wBx3ji223Vnb0MCljPv9JOeR9ND7DrELQT75EYZuzLM2BhpDEzfyoy0FgOgGQT6qUSU6QukyxonTND50TfgNsF8FiThubNI743j1CS0+Eyc80DQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7290f5a8-098a-4386-32c3-08df09f3a063
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2026 19:43:28.2288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DIlH3dYNhD2bK59VU0+G/iZhF32wY1zQqbfILfZTddXs9cH2CXiKwPtbH2SKYYxsSY8b5HwVzcP9hoxXu8VDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR11MB131308
X-OriginatorOrg: intel.com

PiBZZXMsIHRoZSBwZXItQ1BVIHZhcmlhYmxlIG1jZV9wb2xsX2JhbmtzIGNhbiBpbmRlZWQgYmUg
bW9kaWZpZWQgYWNyb3NzDQo+IGRpZmZlcmVudCBleGVjdXRpb24gY29udGV4dHMgb24gdGhlIHNh
bWUgQ1BVLg0KPg0KPiBUb255LCBJIHdpbGwgYWRkcmVzcyB3aGF0IFNhc2hpa28gWzFdIHJlcG9y
dGVkIGluIHRoZSBuZXh0IGl0ZXJhdGlvbi4NCj4NCj4gWzFdOiBodHRwczovL3Nhc2hpa28uZGV2
LyMvcGF0Y2hzZXQvMjAyNjA5MDMwNDEzMjAuMTc5OTY1LTEtYXRvbWxpbiU0MGF0b21saW4uY29t
DQoNCkhpIEFhcm9uLA0KDQpPSy4gSXQncyBhIHNlcGFyYXRlIGlzc3VlLCBzbyBwdXQgdGhlIGNo
YW5nZSBpbiBpdCdzIG93biBwYXRjaC4NCg0KUGF0Y2hlcyAxICYgMiBub3cgbG9vayB0byBiZSBp
biBnb29kIHNoYXBlLg0KDQotVG9ueQ0K
