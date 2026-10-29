Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793251278;
	b=hCi89AFUZUV3hQpWxwsrgjH6MonElzsSBBSP9OJXrCZwLA1lgbNoMCYVzvqfoP9uluJw
	 vGi7afGaYRWOgecTjkkYfIXuYbw4XhRF6L5oXh3mD6Tyxus2XFmf0RCwnTBBt46EMq1SO
	 KSRVMDsjrmvlUtRZVBIDifAnfPKIrL0Yl3fxzs1Huo/KnZnt/SCAzImka4C5wmDE0kJZY
	 pPmxeiafZ6T1M+ZHCJ3+UHW9PVyNmqJIhVQ4Ja9831PtEsvt1ISSPlWFRMt0IRA/TlBTU
	 kznrWs/nvohJ6nkP9EKuw2EK0UIsXFSTFFrayJm15KsYrY+Dv3M4Ku0Klel9WECiMrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793251278;
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
	bh=/+Dn59dyIW319NoUa0IrbS7kYCNuxzGhuIoIfQ0fHrk=;
	b=4iPQ5DhP5EvJ4A7U8Xq4aud/j6U6p5Iclm4cw39jGgvAcMDdWEBwPytHLeE5GzxrbJan
	 Db6ZXxvZT0FC0sq2HsVkIThuMsCJ58Y+Zwto103dm6Bht/m+WjwgxrQYDh5zabmJbhPL9
	 XNXnHW6ZcGRNQ4F4YCiiLS8mCBLh/LScWrUkxJxXmaeXqq4GQEtPe0KUQMMXM5c2uIrNr
	 FNeyDSpmABoxbWFCG+UZu+eJani19/R8cwMZE6tDjgzNL7uezk7aFl7EpAR8U93htdbUB
	 hzi3Rw/7/xuTi5/VQdtzmmGMcawEEaH8a+T/Xq+j3gi9GkuuQrSdaxlJXMgAKmja2dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mgGkEmsZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8518A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8518A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mgGkEmsZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793251276; x=1824787276;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/+Dn59dyIW319NoUa0IrbS7kYCNuxzGhuIoIfQ0fHrk=;
  b=mgGkEmsZ8C/7xUTIrD3RegTDyZWPEALNRpYTljFIASF9c4Rz2GXBoASP
   5fSMpZTxRdzyhHGxC0X8YpR2uwjbaeUHUW6Gr1I/doEELsDKlC2OZPH/w
   g/6xPCKAw2RgMs4qUYuVwfiT8Kmpv4NXXNnQdjviKLaROGJkXVr5Afo4O
   RZ1Do5UK3feMgazUwg2Hab9mgb4mYQCfwYe29AY6sLVCrUaFRzxpSZ9KY
   rnyw6GZUT7ucZKltRF3mnG+bUQwUOc8lPB6NaTk1rt1YOYUtgHkWpO+5E
   0StCYWcGubGwJZMMdG1LEBC+OdX8TI02VjJDQt4E9vh4NjHK1RweKNY3u
   A==;
X-CSE-ConnectionGUID: jTQHOA/bR9i4RvgGynEXtA==
X-CSE-MsgGUID: b6EZ+UIjQ+Gozg66TMbGOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1877064"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1877064"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 22:21:15 -0700
X-CSE-ConnectionGUID: gw906BacRraxr89ydxNqBQ==
X-CSE-MsgGUID: +fhZ9Uh0T+2uj8kL0Pibng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5374423"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 22:21:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 22:21:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 22:21:14 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 22:21:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmL2ZciRCQACF/7NkoKKg0mEhjbvetgoTvdeyexFJNvetWeNbECrSoCNXc/oHNnbQtYGq7GmYZZx9ZZY4OtYTt1hUzeD/AGrd/eV4JoqFT0HCfNGrc8MKC1Mnk8CUBQ7//CZ+BUyANweVtIHaMEv5oDhWu1bI7vGsLo59xTfUoL7wSxw9JzsMo+Z6hUA634sKCp3bWLZl96aQdFiicNfnk7W7hEmbRucwuoTELKApz26mIVRGmnNKRS22YiVwedVIYM2HWezD6g5LgUCQT4hFNtFA2BOWaJSW+x6tYC/fZslAvInQYYVN3brDKBU8JxKp6TWItgvrYnaSO9hgbX09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+Dn59dyIW319NoUa0IrbS7kYCNuxzGhuIoIfQ0fHrk=;
 b=AePLgSc8tUJlV4VkKjSVoxrf6R8FuIHHoB9HyHpFHzFAPqCtSF3q7hKSKtpitSyNsFS6x+3XOm/Qjk1+gQyxfRvQ9h4ENcXkxOHwZw/VVpZ1nD9fudsOZVmx5fcIwDenU28rcdoe8jKR31BSHso9nMp4mUNzjgMpsOn5t0jwh3ExefToHD/rsaWNrgBXDcQIZZYt248AgrJUByVwotKqNv6g5hKGhfxAapoWYmNHQitYTRYVbgmld2dpCLaWyWdF0BtpQd375jrleikbMcbOVfnS1GJHOwxr/jBiY4ZLecsKTkdPHPFeO2F83TFAT8UGblQXtkG+OnUAFhV5aXGzLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 (2603:10b6:518:1::d57) by IA0PR11MB7909.namprd11.prod.outlook.com
 (2603:10b6:208:407::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 05:21:12 +0000
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3]) by PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3%4]) with mapi id 15.21.0569.008; Thu, 29 Oct 2026
 05:21:11 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Josef Bacik
	<josef@toxicpanda.com>, stable <stable@kernel.org>, Arnd Bergmann
	<arnd@arndb.de>
Subject: RE: [PATCH] mei: lb: read the MTU once
Thread-Topic: [PATCH] mei: lb: read the MTU once
Thread-Index: AQHdZjAhwDy3q3DuyUOevuLA7hHh17cT/cDA
Date: Thu, 29 Oct 2026 05:21:11 +0000
Message-ID: <PH3PPFE241D7F14963D90D365ADA450F3F6ED6E2@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <2026102739-boil-startup-145b@gregkh>
In-Reply-To: <2026102739-boil-startup-145b@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE241D7F14:EE_|IA0PR11MB7909:EE_
x-ms-office365-filtering-correlation-id: 185d6019-c9a5-49f7-eee8-08df357c71df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|11063799006|56012099006|261009223027099003|261026135527099003|261026140227099003|261026130827099003|261026121527099003|261028144727099003|261021135927099003|261022075727099003|261021130227099003|261021123027099003|261022113327099003|261021133027099003|261021121427099003|261022105027099003|10067099003|261022115727099003|22082099003|18002099003;
x-microsoft-antispam-message-info: wf5uGR3ijb9rLIjIuerHIjh1fm3L2Zx+IuAUIXc4OkWMDTiNFQlO0v4eQOqav+e6YEJ36bU7m8txz2jULTQxbtwtt28igWrLdpI6HGQO3g5cMHZ6HfZIYfDz6oCAKUy8MqldmZAXqbznZenTK4qHe8kGvVmrDcXLpZ6NF9+3YuBNz6rs19DJdOHp7szVghBScTMTxFmB6/iI2LqbX8ezgcG7jCdwh3HWywJ9/IKWBG57GwPgfC7HnsxRHJE0829um2Io1D1/av95m1KLPw2geKjS9wXN1bB9J74DWNv5Acg34P1OtuYf5z+WSZyNXTLFgzJaMWAhL8NMT7gMsRPEn6lS+vOWU4ycqm6KSlmPrCPvg9M0s+8+muov9dfBgv+jksxY3JaO6iT072iAKJ3KhGHCCnDoeWVsjpnkccLJIBpdLA94Pg7HdRgcJ8+a3RRagMSlZZ2kVil+Puc9xK5CzL5nVts+iXKNEk6PxynGN8K6Ofr2lgd0MgdbtnpGvNk2V0ZSsqEj3JE8hELg0PAtQ5aT3kU61rcvaPtshoD2GOLXe4ZbqSE6Vkyy6jXJ0Z80xgJhJ4/gsK51Qf+k+o5Mo1yEt/QxgrOFRAKvM/mY8VQX6GzVd8u1X5aKr8AzoDd02GSiARGQIqOW3DSEdrl6ooPEAALDGQJdvtFO9S5M5B5IkwAiXsywDorPCsSEOs6k9a5a7ONc0yKtPq8dKXbMola2RfbToeNLU18HvmT+rEk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFE241D7F14.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(11063799006)(56012099006)(261009223027099003)(261026135527099003)(261026140227099003)(261026130827099003)(261026121527099003)(261028144727099003)(261021135927099003)(261022075727099003)(261021130227099003)(261021123027099003)(261022113327099003)(261021133027099003)(261021121427099003)(261022105027099003)(10067099003)(261022115727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TTB0eXBXUThLSUZlaGZ4QUFuNWoxT2xBRWR3ZDRtSHVoSTJFTWNMYmpKSi8w?=
 =?utf-8?B?YWFzZVp1L3NoQ2RyK0JnK09nT2ozU0NnNlROaXh2SE1MM0xYVTBybzhXR25l?=
 =?utf-8?B?YU03QnVrVEhRZndQWm94bXA0RzZnY0lZMkVUaStpRGNFNk5wMjNvN2Y5d0dB?=
 =?utf-8?B?YTJXd1FCeEEzODBsQ1pPdHk0SFF1SkdSTWlrQzVkTjZrNFZLM1Y0d2xvbElk?=
 =?utf-8?B?YkJ3aUF6MGlmWUt2V2lDakdYc1dnVXl1MTVHaFJ4WnJXZVRNWTd0SGhtVVdN?=
 =?utf-8?B?cUp3MkVja2lyQkpCWm1pd1ZDOTVhaWRKL2tEM25Xd3lTQ241YjE4OWdmZ3Zm?=
 =?utf-8?B?b0c5TVlmU3VpTm1Ga1RLdzFFaEFrTlJhL1M2Si9mc240eWI0cEVFWTlsdTFV?=
 =?utf-8?B?WmlkSTZldGdMRVJUZmV1MWZXRFc3elA0SEFmSk01TFlsQ3hUaVNtZ0NPMlVi?=
 =?utf-8?B?LzIzOUloWmpMZVRvOVJFNFF6djNnQitGY1cvOGxoc08wekZ1cDlublRhcE5n?=
 =?utf-8?B?U1o2ZmpIMWlzbkdBZURCa2pZTnJISXU5ZUg1TXMvcStQWVcvdTNtcVpMK3hv?=
 =?utf-8?B?QnQveWw3TDBLZURzR3RXU1BmLzRpRG5OcEZ6UXBVRC9zYW9TZmp6RjdSY29w?=
 =?utf-8?B?Q2ZQdTgyL1NUMkdTbGRodHpHQUs4ZTJJVFNLbThtWmRJZU5QQmtjQTNpMURy?=
 =?utf-8?B?TEYwT05GWTFYVGpDRGhuRGFWTk1yYnRpR2VHaG1zN1RNcUFhaEU2UHl3dzZB?=
 =?utf-8?B?U0VrcWx5ME1RQkdxYUtESXJoQ0hUeEVQQmRSdlpYVUxlU2pjM0w0dXQrTXda?=
 =?utf-8?B?dlRWb2JBYlhMY3BrUzVxTmw5ajJVNzBhaEo1NE9aaExsSjltdUlmSGh4Qnp2?=
 =?utf-8?B?bEkrY1BVUUwyMFg2bVcrK0lyUUlLZTI0ejZGUHEwK1BNS01SNDRHWDdGT2tX?=
 =?utf-8?B?cGRNaWh4U3VBZktBUnBxVjZwTzVETk1KcXkydkpLQ0dWdU1rQVhpeXlpRnk2?=
 =?utf-8?B?UVM3VytuQXFDcE9MODc4eXRsN2NObmxrNG9vbmhmMldZRDQvMGpsNVpkL2RD?=
 =?utf-8?B?Z0xNbkx0V1NaWjNaTUl0NEIrVnBXQmF0b2NIblYwaFh4QjNBZE5KRkcrQVJ2?=
 =?utf-8?B?SXBEWGlPVTJJczBKSGdSVkhuVTQ2TzlWRWY1bE9MUHdEdnZRZWk1TTBMdTZx?=
 =?utf-8?B?MjErd2FOOTdpWGJoOVFRc1Yvd2tNTHZWYi9rOUVBZktheVRJcEozd0VDUnZF?=
 =?utf-8?B?M1Vrdk1sWDdTcG1lYjY3Z2ROUVRFYW9YT1dQcUJKa0QxeGpNZy9wNTdSdDR6?=
 =?utf-8?B?ZEJiTmQyMlV5U0VRN0VKaGZGNk1rdUM3Y3Rxd3Z2SzgyMHhRSGJDKy9IRjRM?=
 =?utf-8?B?dmV0bmVlc0luamZMeTBDZUxFeWFyT2wrTEtBbERveWdvNURpSUh4QlJOZkFV?=
 =?utf-8?B?d3l4SjZxdzVzZ2JXRTE3bnFJSUdZTzFnSityQkdNelZuSW1uNnNEZmVnWloz?=
 =?utf-8?B?cFV4am5rb0hpamdkZmR3L2FzVGZkWjFsY1dpMGFyNXo1dmJmRlJZRjNWWmpM?=
 =?utf-8?B?cnZ1YWtNVWZHWkEzMmJPRDh0UnVKYjV3K2NGWnhTSW5Uc0N2RGo1UmpEQjRD?=
 =?utf-8?B?SGlNMnNySWhoVFZRcStoNnNFcU90d1k1eFFPMUJEMUlPaC8vcHRoOHBjTE1E?=
 =?utf-8?B?akxzUHpXMWpBUjNIMGVGSVBYczZFYUJnWUdua3VmUHpPTWFRS2RBeVdWSE0r?=
 =?utf-8?B?NEpRNXdkYllmNyt4VUEyazNXUzhXZndMUHZKdG53aEI1ZE5kak1oSzhSTG13?=
 =?utf-8?B?dVdQa2VreVdiMUY5OTJFa3pzczV0dEN0cC93cDhlcVA5MUZYdDFTRFcyWmNk?=
 =?utf-8?B?UGdFdFNJaGlCRjNOeXMxWEZudCt1OGw3YUtVRVNwSXZzRWVCbVpWTjhIc1R2?=
 =?utf-8?B?Z3piNzkxQnlmMjhQbHNJSGtKeXFyTGpDa3A0SFhGWnIwb2hIS25XZ25ScEtL?=
 =?utf-8?B?WVQ0R2NxYktEQ3JSdVA1TnNkL0t0VTdzUUg3L3l1RFBsakxqSFcrb1h2cHBo?=
 =?utf-8?B?YnJWTHU3RVRlVjZRSW9sZnVtTkpDcVhJM1JkVnQ2NG9heDBab3hGL2JIdHdr?=
 =?utf-8?B?ek1tNldIQVZwUnpuOVdMQ2o5K0hodm1IbEhxbGRDYWZLM0d3aFFaK0swQmhY?=
 =?utf-8?B?cStJbTlvb2JOL0xGbktmUUIwbGM0RnpRRUp2cmZnbUJNeW1QN0VyQytUMmh5?=
 =?utf-8?B?aG1XL2NxNVUrQXZqRDZxWmxpVzhXWUFMdTBjd1ZXQVMvRFFkYWJJRjhHVzk5?=
 =?utf-8?B?STU3cGhoN2UzMGJZcGRxYlFrcFBFV1V6RldqV0ZZVGlMTEtuTnk4Zz09?=
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
X-Exchange-RoutingPolicyChecked: uzdd57QbllvONjO5pQ6ayxbScRWy7bnV8VN82hjRPdqQNiOxglHuMwjiPrZQ0zZvpDK+Q8V+q9ZhbV3zn2CJp4dDgn1Gv6XrzzXiA0L6IFovCaHxW5N6lqZU/lJmBPni5uU7VTRKN/hXU/rDV0z74yhhBGuBV3094vZ1kdGDgs7vQ9cmo2RuT1yqRHF8gDubIJauzekiNm1h3TXdVAfH46vX8BAOIII8BADVt7UdUVwPt9aWDRXE0kQUMvI6I7zD/5YTvIeLrN3DCf8VeZjMb1NC7MKveVQ8btAOJVBGGTjTFYxDnv79oSC7cFauQZtzJhNc+MNaZhJ8qNc0yQYnKw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE241D7F14.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 185d6019-c9a5-49f7-eee8-08df357c71df
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2026 05:21:11.2071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IDkwXnXhsu2r2kUU42CuA2wbm6DhpwXkPNigQLTTIlYkzUB/q/im9l1ZHV0O92767E0vEkp7QqJJH6H00yDQ4TueZJ+s+PrO5PBl+3nvI0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7909
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0hdIG1laTogbGI6IHJlYWQgdGhlIE1UVSBvbmNlDQo+IA0KPiBGcm9t
OiBKb3NlZiBCYWNpayA8am9zZWZAdG94aWNwYW5kYS5jb20+DQo+IA0KPiBtZWlfY2xkZXZfbXR1
KCkgcmV0dXJucyAwIGlmIHRoZSBjbGllbnQgaXMgbm90IGNvbm5lY3RlZC4gQSBsaW5rIHJlc2V0
DQo+IGRpc2Nvbm5lY3RzIGFsbCBjbGllbnRzIGF0IGFueSB0aW1lLCBmcm9tIHRoZSByZXNldCB3
b3JrLg0KPiANCj4gbWVpX2xiX3B1c2hfcGF5bG9hZF92MigpIGFza3MgZm9yIHRoZSBNVFUgdG8g
YWxsb2NhdGUgdGhlIHJlcXVlc3QgYnVmZmVyDQo+IGFuZCBhc2tzIGFnYWluIGZvciBldmVyeSBj
aHVuay4gSWYgdGhlIHJlc2V0IGNvbWVzIGluIGJldHdlZW4sDQo+IA0KPiAJY2h1bmtfc2l6ZSA9
IG1pbihwYXlsb2FkX3NpemUgLSBzZW50X2RhdGEsIDAgLSBzaXplb2YoKnJlcSkpOw0KPiANCj4g
bWFrZXMgdGhlIGNodW5rIHRoZSB3aG9sZSByZXN0IG9mIHRoZSBwYXlsb2FkLCBhbmQgdGhlIG1l
bWNweSgpIGJlaGluZCBpdA0KPiB3cml0ZXMgb3ZlciB0aGUgZW5kIG9mIHRoZSBidWZmZXIuIElm
IHRoZSByZXNldCBjb21lcyBiZWZvcmUgdGhlIGZpcnN0DQo+IGNhbGwsIGt6YWxsb2MoMCkgcmV0
dXJucyBaRVJPX1NJWkVfUFRSLCB3aGljaCBwYXNzZXMgdGhlIE5VTEwgY2hlY2sgYW5kIGlzDQo+
IGRlcmVmZXJlbmNlZC4gQW4gTVRVIG5vdCBiaWdnZXIgdGhhbiB0aGUgcmVxdWVzdCBoZWFkZXIg
aGFzIHRoZSBzYW1lDQo+IGVmZmVjdCBhcyAwLg0KPiANCj4gUmVhZCB0aGUgTVRVIG9uY2UgYW5k
IHJlZnVzZSBvbmUgd2hpY2ggbGVhdmVzIG5vIHJvb20gZm9yIHBheWxvYWQuIElmIHRoZQ0KPiBj
bGllbnQgaGFzIGdvbmUsIHNlbmRpbmcgdGhlIGNodW5rIGZhaWxzLg0KPiANCg0KTEdUTQ0KQWNr
ZWQtYnk6IEFsZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQoN
Cj4gRml4ZXM6IDc3M2E0M2I4NjI3ZiAoIm1laTogbGI6IGFkZCBsYXRlIGJpbmRpbmcgdmVyc2lv
biAyIikNCj4gQ2M6IHN0YWJsZSA8c3RhYmxlQGtlcm5lbC5vcmc+DQo+IENjOiBBbGV4YW5kZXIg
VXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KPiBDYzogQXJuZCBCZXJnbWFu
biA8YXJuZEBhcm5kYi5kZT4NCj4gU2lnbmVkLW9mZi1ieTogSm9zZWYgQmFjaWsgPGpvc2VmQHRv
eGljcGFuZGEuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdr
aEBsaW51eGZvdW5kYXRpb24ub3JnPg0KPiAtLS0NCj4gIGRyaXZlcnMvbWlzYy9tZWkvbWVpX2xi
LmMgfCAxMiArKysrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9tZWkvbWVp
X2xiLmMgYi9kcml2ZXJzL21pc2MvbWVpL21laV9sYi5jDQo+IGluZGV4IDlmYTY5YWNmMjhkNS4u
ZmZhZjViZTNiNjA1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21pc2MvbWVpL21laV9sYi5jDQo+
ICsrKyBiL2RyaXZlcnMvbWlzYy9tZWkvbWVpX2xiLmMNCj4gQEAgLTMxMiwxNiArMzEyLDI0IEBA
IHN0YXRpYyBpbnQgbWVpX2xiX3B1c2hfcGF5bG9hZF92MihzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+
IHN0cnVjdCBtZWlfY2xfZGV2aWNlICpjbGRlDQo+ICAJc2l6ZV90IGNodW5rX3NpemU7DQo+ICAJ
c2l6ZV90IHJlcV9zaXplOw0KPiAgCXNzaXplX3QgYnl0ZXM7DQo+ICsJc2l6ZV90IG10dTsNCj4g
IAlpbnQgcmV0Ow0KPiANCj4gLQlzdHJ1Y3QgbWVpX2xiMl9yZXEgKnJlcSBfX2ZyZWUoa2ZyZWUp
ID0ga3phbGxvYyhtZWlfY2xkZXZfbXR1KGNsZGV2KSwNCj4gR0ZQX0tFUk5FTCk7DQo+ICsJLyog
VGhlIE1UVSB0dXJucyBpbnRvIDAgd2hlbiBhIGxpbmsgcmVzZXQgZGlzY29ubmVjdHMgdGhlIGNs
aWVudCAqLw0KPiArCW10dSA9IG1laV9jbGRldl9tdHUoY2xkZXYpOw0KPiArCWlmIChtdHUgPD0g
c2l6ZW9mKHN0cnVjdCBtZWlfbGIyX3JlcSkpIHsNCj4gKwkJZGV2X2VycihkZXYsICJNVFUgaXMg
dG9vIHNtYWxsOiAlenVcbiIsIG10dSk7DQo+ICsJCXJldHVybiAtRU1TR1NJWkU7DQo+ICsJfQ0K
PiArDQo+ICsJc3RydWN0IG1laV9sYjJfcmVxICpyZXEgX19mcmVlKGtmcmVlKSA9IGt6YWxsb2Mo
bXR1LCBHRlBfS0VSTkVMKTsNCj4gIAlpZiAoIXJlcSkNCj4gIAkJcmV0dXJuIC1FTk9NRU07DQo+
IA0KPiAgCWZpcnN0X2NodW5rID0gTUVJX0xCMl9GTEFHX0ZTVF9DSFVOSzsNCj4gIAlsYXN0X2No
dW5rID0gMDsNCj4gIAlkbyB7DQo+IC0JCWNodW5rX3NpemUgPSBtaW4ocGF5bG9hZF9zaXplIC0g
c2VudF9kYXRhLA0KPiBtZWlfY2xkZXZfbXR1KGNsZGV2KSAtIHNpemVvZigqcmVxKSk7DQo+ICsJ
CWNodW5rX3NpemUgPSBtaW4ocGF5bG9hZF9zaXplIC0gc2VudF9kYXRhLCBtdHUgLSBzaXplb2Yo
KnJlcSkpOw0KPiANCj4gIAkJcmVxX3NpemUgPSBzdHJ1Y3Rfc2l6ZShyZXEsIHBheWxvYWQsIGNo
dW5rX3NpemUpOw0KPiAgCQlpZiAoc2VudF9kYXRhICsgY2h1bmtfc2l6ZSA9PSBwYXlsb2FkX3Np
emUpDQo+IC0tDQo+IDIuNTYuMA0KDQo=
