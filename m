Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793548245;
	b=Mu4e1F7SkBEjdOB65ERTFHZQ4RXW7CUJY0R6tQwEn/re2bBzBazp2laUW0Fsvl0mRRcU
	 FUw6plS9nfaEVzVa9+ToVhjY7Ig93AedySO0HeiCYBH8cKF0AqZTB6a2ut7Nnzw79ERph
	 SB8IpR8cz2msWxG7ZD/1JwmJd5ot8pHhvFFbiIS0CObQLYg8OYOYbMupPe7lwPNmflzWO
	 iZOCdJTR6WHtnLYXCTW7u/y0ojK35EHcBdOC8wj9RLDor3onsoqpJI57Ieku4dyx23A29
	 mrpJrmA3HT65gNO1Gx38tSDCNyNRU4Ha4M6GumT1HftoDEcJJ2vLTWanOXSLYSuQiDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793548245;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=55JLyLuTNoaJyiB7S6grboaYscJxCyRSlL3ekqJh6Cc=;
	b=wu5JRlM9bSSB03ohYY2S8+3HfAmfQ4HVE8AUHrILm2HTusoxK6e8rez0nsExWq1X92Vx
	 MW9JSALYanHT5fYIeh8C8zeknLA1cQ4NL537693pWx5CGRFDFIn0Geug85E48/puHHqXi
	 5nwyfxnWvAODvewZMtqSqcWhnO6KNBmcKoSamqelwajVvnulERXhJEthM3ZlU9i+mdZrC
	 +q2U2WUSXq2ZPdx7K152sWm730hNL/mNnYGMI9SPeRIWGLECpbUNHa7kYMYb0dAcDR3j1
	 RaEM6VxHNVFktICjpps6k/ekjhCcYFv8Ngr9706oCDkZ6ugBmZgFVKy5DN792t1qPsw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=khDep+qv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37788606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37788606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=khDep+qv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793548244; x=1825084244;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=55JLyLuTNoaJyiB7S6grboaYscJxCyRSlL3ekqJh6Cc=;
  b=khDep+qv8+lTl9qYqA3uGMs+WlrZUSC8siV0yPjSCJrsQjGiI8g54U+5
   StPepNCrLxo3Lt2sp5wGrOa3c9K0QJFSI1259fVxYFh7Y9Lrndxr5cohL
   oViJH8Wk6mv3MltKSk5a/OPAB6Cueh41Mvo12rqGk/Q/MbWUx/wbnN19+
   woLUkYmM5WfqQQYhTvd7Zid+fCJCx0Mz8jtjaa+qJrGVMIknRzzZji2zY
   wMb1SICRvfNkZtL54xHij+vSUVUNtzSTtnrkfPpFhN3J4zk7ZVTux7Pos
   zZ1BacSP0cTf5aE+Tcx/bixMuJ82UvWslPJnISwhaYehAdXlCi2o85aSA
   w==;
X-CSE-ConnectionGUID: q81WZ2L3R9+j2B5PPenTyg==
X-CSE-MsgGUID: eOcJ5xhiTpWbhwgRO+iyag==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2273398"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2273398"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 07:50:44 -0800
X-CSE-ConnectionGUID: gwJQ/k2eS8mOv5YcmkjPoQ==
X-CSE-MsgGUID: ZFABJ/cSTaqwOvtArGgJpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5909059"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 07:50:44 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 07:50:43 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 1 Nov 2026 07:50:43 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.50) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 07:50:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLwDuKVtrqxIKeOoVpLNZBCR5AwMtMPMkKMX2xhIMkkhBGExz+79xjAXoPXX9uJ0QIvJJX3P4duoBK5gC43CMZlZkW2JEjYU83y/g1Fc2jL0p3s4eE91tWKR8tGtX5BlXRDPlRjWPDS9NiVdxiTaLwgJaQgo5CGQSoZKbcqgyNpO34pIskbw/6ZJPFU4TnlIFB2pE2f4KPEdmX8WeYW2vsoOI2rxb9Apen1TTxv/inxsce8rlUKKa/HykTlegaaCOeS002y8yb+f/xYIl0t910hUo8yWatCUvdlP80MXmJc84cK6HijW/TBet/11WZCoUTeptVVoUOgDxlhP/a7Mrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55JLyLuTNoaJyiB7S6grboaYscJxCyRSlL3ekqJh6Cc=;
 b=Y+bdnVjboqfDSFOjlD2jTUZ6Bf2Fn/JTEGDD5ag0gVJBGyV7bIIt+VTf/Xm3CASH4L2sxBeXraDDdNM/Rul2zt7zHHZ7WsrL9z9pWAMK/LLKeUfVevS9C14+5gyXrmrz9a4C9KDXxFPHBijDfqqjLyvrvHEZi4np50kB1xgIGo5Ir0mytyCcN8VSXOzKOwE/V8LAtfpFDVYT+iD46XZIO+lNf09NxcTTHdSBI3cB2bnIinR98awE/4TpRIhLpTGWxzQZcvUcm7dSMd4NR6xtmcizfKpiPNwiTyHeSWd2IwSuQ89RU890GYKqJv/cW4KGU0R1w1jrD8ZPVFEQKvh00Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 (2603:10b6:518:1::d57) by CY8PR11MB7196.namprd11.prod.outlook.com
 (2603:10b6:930:94::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Sun, 1 Nov
 2026 15:50:40 +0000
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3]) by PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3%4]) with mapi id 15.21.0569.011; Sun, 1 Nov 2026
 15:50:40 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Adin, Menachem" <menachem.adin@intel.com>
Subject: RE: [PATCH char-misc-next] mei: bail out if no matching hbm request
 found
Thread-Topic: [PATCH char-misc-next] mei: bail out if no matching hbm request
 found
Thread-Index: AQHdag3UlD5NDAJ+jUiXEHOigh8ZXbcZW9MAgAAASmA=
Date: Sun, 1 Nov 2026 15:50:40 +0000
Message-ID: <PH3PPFE241D7F1473556BD599CA79BD5365ED6B2@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <20261101-bail_out_on_nonexisting_hbm-v1-1-ec1eb6aa5547@intel.com>
 <2026110108-unnerve-transfer-3d5c@gregkh>
In-Reply-To: <2026110108-unnerve-transfer-3d5c@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE241D7F14:EE_|CY8PR11MB7196:EE_
x-ms-office365-filtering-correlation-id: ec6a4e0a-01aa-4875-3c17-08df382fe118
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|261022105027099003|38070700021|261026140227099003|261026121527099003|261028144727099003|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: lmuI6rfCmUxr4XjcWwll9z9MJa2Vb1QhR3NNIPBnNcGXZBs3Ot+SyE2F6eScfcakZq540KDspazo0Zz0FDpiZHzYk+zK2CKkD1V53txY3qGU3SXhOXvfFUWRT4E57QbgyEcH+y8yj4/nlpSwcWJF7mLmTjWGEjawe6jp4Dlk59GqmpcTR/UgJrkFocdph0cviN7CrrtgNYo1gEz4SMo4YhL+oDZYzyXEXXLdkvlpU2ZXFY7j/bw1k7xLT2ooHCTVBfP43MLafgaWe/nJuJrJisrYl2ttvdn9G+b2nAFN7Yx0lMIxMBrdBMv6OBM771dTpFsepyBUu3MNNttTEILvGAOWfupBX8ePvk1/ZwuQSIC0hC8/7gBn/r5aIyodh0SUB4DSGc9eVZ0bC0BjfdToMPgPqhBTYLgunvsYyRUd97mbObmUN3e6ScLJjcUWYQk1IOtpH1lqClogzcnt4PWzijbVcSYILT26L0RAFagKj7YCCeXVPePw4l1FCordJCTeJDZUBGaAga4nmztI0kfepcZJ9HDIamv8JCUJClccARouyJqoEL2SV00+G8bqqs2dlnQfzuhDVVY7mBHxoZDkYdDqlYdjd6o52TVunLgWsL5zPVabcpNGEDU+Xwr9rm2rTJXueiFcTjUv7t9+CiisYv4dGNeJgDhMNmpCIpwCFoEe9FSPCYOEC4lUfLCteqRiL96lxe7kq8+rtDnEhUTbrA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFE241D7F14.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(261022105027099003)(38070700021)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YmtoL2lGWDZMUTJTTTVLMU8zNFJqNVhueXhaVHFlQXFoOS9HN0RNc01hWUc5?=
 =?utf-8?B?anFaVlN2WE5DWUhhd0hZUUFWeUpQaW1rUDYrc1lrc0ZESFpOMTRVNzdCTVJI?=
 =?utf-8?B?NjB5OEJYT0xrYkRKbk9zenJMZlkvWXovUWxOSnlOckFueDF2anNLc3ZRTDdB?=
 =?utf-8?B?WHAxZEU4U1JxdUZ6dDJuTnlYZXRlcWhkc0VPVHNHZmw2c2pGOE5OVzRKUG9V?=
 =?utf-8?B?YmZVeE50VmxncjlRNWRlTGhGZ1ZRcVFFVUFlbFFldEs0aXRuWGtMZU81ZElh?=
 =?utf-8?B?Yithck1qbUVybU8zb1RzYUhXOUhETlpPUjlSNkpVWUswNUQ0V0hxVi9ieE5o?=
 =?utf-8?B?N0U0c3JhWklsejhQeCtXd0hhT1c1TnU5ditoOEFuMkg1K0RoR0lCN3hhN2Ni?=
 =?utf-8?B?Skt0UzZuSHlWOWh2SHBxRXdFT3UxNFBrTjArbGlsR3ltR01aT2pzYjJ3Tisz?=
 =?utf-8?B?UUJTZkxpVFlHSXlnZ2JPQWZUM1hucm15WjlxM3dEWkh3RW9sNFFIZVpmTEto?=
 =?utf-8?B?Nk1kSmJ0ampxek1ienBkaWpzTHExakxsbHFycjdlU1VMVWQvVU80SEFBaHlO?=
 =?utf-8?B?VWppbHY3dDVhb0xRN1crSkExZEl0OWd6RmtsU2IxQjd4aGl4djhWVFZPZWVi?=
 =?utf-8?B?M3M0enZ2QWJ0OUkrdGlBZmdZZmZLWkY1MUZKaUZhRlBwcThDc1daWTFRS0RF?=
 =?utf-8?B?RFBCN0ZrQ3JFZVM2WlNnMmxxdi9MRk84ai9TK1JZYVYvRmxtTTA4R1BKcXpI?=
 =?utf-8?B?VzFmK244cTBiK0xpWGhjWThzQW9zaEtyV0k3V3FZcUk5ZlplU2tyVDhRdkhD?=
 =?utf-8?B?VXUwZllCcEhqZWZ3cUdIT0tIUUY1UlhyaHViVlNHU1VONXljL2VFZDZOYlgy?=
 =?utf-8?B?eVFIZVl6SnZLeUh6SkJySCtHMUlwZ2xLanNRTmJTa0pycUNnK3ZWaGdZeTVz?=
 =?utf-8?B?d001a0VrR3hMSEdCZmtRdGw4S0ZtNXFhZWEwY2k2bThqVUFyWmtpNlFZZUxP?=
 =?utf-8?B?MGZ0TnB4SWJDVzB1ZDFKNnJESDN4MjErVG1RdE9Oa0NwUkJDbWM2Vnh3UjJY?=
 =?utf-8?B?ZTg2MHNrL0RtV0dwYXdBT2ZVWG9WUit0RDcxVVJvWExnUkV2UlNvM0wwQmlh?=
 =?utf-8?B?Z0w4amlvT084NjJ4Z1UzL0lJV2ZlSG1VV2l3b2FQT0NJbkZYWUxyV0R4S1BU?=
 =?utf-8?B?K2dQVlBNbDJOYko3UEVyMDUyQVkxaE1hd0wwNDBwdS8yaFBmbStWMTRaUjJU?=
 =?utf-8?B?OTJwUnBRRGRGOGk5c1pRL253U20xU3NTVXpDZzJ0bHY1TkVaKzdCZ1JpcEFa?=
 =?utf-8?B?MmFsWk15NFV0NlJOSWhVYXh6UElnUTNrYnBsdGVid0lhc0xLRWxabHE5WENU?=
 =?utf-8?B?cFFVQUJTbzkvWm5mbzlrSzd3b1V4MStES1NGak9zb1ljV1lwZ1V5WFU2RlFo?=
 =?utf-8?B?R2FFeGtJcmxlcTRHeUpDdjFRTzcrR0RoWDhLQUFYWnR5MlNuVnNJUnJEdVR6?=
 =?utf-8?B?QVd3TEo1NElnUjFrVi8xSGRsM1RvNlNTNkZzVHNZQ0x3dXFZOFhzS0MvUFJR?=
 =?utf-8?B?aEtDNFA5cmEzK1BjWUljSmJyOGN1and1dlRvbiszM3NFd1duY2hnTlZWVXox?=
 =?utf-8?B?SDRwOTA1TUVmS2JtVnI1dnI2bWFobzRhbEJFMTdkaTJrWXM1LzBnMUEzczlL?=
 =?utf-8?B?cDdkdkN2TXFoYnpOeEZGUS9tVS8vVHU4UmVOTVFZSUZuU1U1a3lsNlMyZk1M?=
 =?utf-8?B?RTczNml0Q0tvaVZuM0JUbmxzLzBmdWV6UmNFbWlCMkd0QlAyUTV6Z1pwYXFF?=
 =?utf-8?B?TStWYmxVTmZKVjVRVi9FTGkxNE5qeUFocW5DcFU4eWdFMEdKVGsyKzVmV1Zx?=
 =?utf-8?B?SDIydDhKa3drbHJvZlU0OGxObHZNM2VpRnhKeXVjVEIxalQ0S2tWYy9NMTEx?=
 =?utf-8?B?UjFBNkhYdVRaYkY1alk3cW5VSUNqT1NhSHRQUFJVS3llbUUwalA5TVdNMG1M?=
 =?utf-8?B?SHRaeThsT2dZaFRla3RQZU04ZHVDajdDOG0wVWcxd20raUdkMWJjMGkxYzB6?=
 =?utf-8?B?UmxwZXV5ZE95ZFJGUUJqTE1GdFhsQnJqUkpXTlVnQURNL1FPWDRRYW5NaGRJ?=
 =?utf-8?B?V2J4WmVtWmFpUWtvTkM2cWNMZG1MR0lUaSt3RU5KNTRjWGl2L0FkNFRySzZp?=
 =?utf-8?B?eXlIRmxwdTZaRXAvcnp1b2R4d2NhNERCRFBTODJrZWFLUGdaN1BXNitWM0s0?=
 =?utf-8?B?Uktqdmw3OWZCVHd3SFZ6ZmZGUkxmUDlVRE5iVGNOWW1TN1R1VkVwRFlFQXdI?=
 =?utf-8?B?L2hSWkZxb3RQaWcwV213S080QVZWVTlDcVlGUFMvWEVDNkNhN0NSdz09?=
Content-Type: text/plain; charset="utf-8"
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
X-Exchange-RoutingPolicyChecked: Xr1Iz+FASLJp6HGFdvt8zTRZLm6r3p7wAXeQ005t0YY4l586wmHhEvl1f7umL5uNK/2lqR13h9rDq9SJ8tcH5G/JbMZAM6Ggv9DN+wt6Mu4uyAbwXfv7gQ2w5iSZT0dAew7jKtSoY6ObyrB/mUGs1mwOS5yqc3/Su7+kYRN5PYirCb7Da1W7eJRWHi8Axwv46hrOuSb7HwQdI0GZ2YblbQoa5eF5vZ6ATxdn6+uy1wR/PZeEl+i6DkAwZtGOIhM6LGCk4NRcAmzTse39y0HqGvC3NpG3y8OMBwCutoBY0gYbhInIUIyzyspAhgXEt5/JQoH7otd3Hh57N3UxaFS4yw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE241D7F14.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec6a4e0a-01aa-4875-3c17-08df382fe118
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2026 15:50:40.0946
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Re6UjRgkw2ACvE1Mt082iF5HuYzxP4WmrUX1xip1QEjZV4qI8Xr7pD77vqUbW1cSZDcVFc8ggDOEM9KmYuOBRcKdWmFyw76MZbXljgKhQx0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW1BBVENIIGNoYXItbWlzYy1uZXh0XSBtZWk6IGJhaWwgb3V0IGlmIG5v
IG1hdGNoaW5nIGhibSByZXF1ZXN0DQo+IGZvdW5kDQo+IA0KPiBPbiBTdW4sIE5vdiAwMSwgMjAy
NiBhdCAwNDozMjowNlBNICswMjAwLCBBbGV4YW5kZXIgVXN5c2tpbiB3cm90ZToNCj4gPiBVbWF0
Y2hlZCBIQk0gY2xpZW50IHJlc3BvbnNlIGFjdHMgb24gd3JvbmcgY2xpZW50DQo+ID4gYXMgbGFz
dCB0cmF2ZXJzZWQgY2xpZW50IGlzIHVzZWQuDQo+IA0KPiBPZGQgbGluZSB3cmFwcGluZyA6KQ0K
PiANCj4gPiBGaWxsIGNsIHBvaW50ZXIgb25seSB3aGVuIG1hdGNoIGlzIGZvdW5kIGFuZCBhZGQg
ZGVidWcgcHJpbnQNCj4gPiBmb3IgdGhhdCBlZGdlIGNhc2UuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KPiAN
Cj4gRG9lcyB0aGlzIG5lZWQgYSBGaXhlcyBhbmQgY2M6IHN0YWJsZSB0YWcsIGFzIGl0IGZpeGVz
IGEgcmVhbCBpc3N1ZQ0KPiBzZWVuLCBvciBpcyBpdCBqdXN0IGEgImhhbmRsZSB0aGUgZXJyb3Ig
cGF0aCBpZiBpdCBldmVyIGhhcHBlbnMgdG8gYmUNCj4gaGl0IiB0eXBlIG9mIGNoYW5nZSBmb3Ig
Ny41LXJjMT8NCj4gDQoNClRoaXMgaXMgImhhbmRsZSB0aGUgZXJyb3IgcGF0aCIgY2FzZS4NClN1
Y2ggZmFpbHVyZSBzaG91bGQgaGFwcGVuIGZyb20gdGltZSB0byB0aW1lLCBidXQgSSBuZXZlciB0
cmFjZWQgcmVhbCBpc3N1ZSB0byB0aGlzLg0KSSBjYW4ndCBmaW5kIGV4YWN0IGNvbW1pdCB0aGF0
IGl0IGZpeGVzIGFzIGl0IHRyYWNlcyB0byB0aGUgb25lIG9mIHRoZSBmaXJzdCB2ZXJzaW9ucyBv
ZiB0aGUgZmlsZS4NCg0KLSAtIA0KVGhhbmtzLA0KU2FzaGENCg0KDQo+IHRoYW5rcywNCj4gDQo+
IGdyZWcgay1oDQo=
