Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793549988;
	b=RZF8Yq2FLaANrByflO3VZ/cRUsntNi6p7Ay59yULAy/35qsqKFMU1MNJOgd//A2uRPVB
	 YmtmT5pCHZpgE4iNeZ8zJ6kR5ArzI8TYrilE4ZhIdbucO5n+MkhTyz29qix4ydE7erlyH
	 RlwW79zGpDKgj4MkJx1rvoUEdI8uKPaDIRFj//Ts57fxRlAZrrIgcIqJAdK6LYncVBwzm
	 nI4kFFCj3nydQ8+aSya6EbrnxFsum9m42iXfasZ9+l2seWQRHSxdeysDyMzm9xl0y/gyj
	 mxUN9SBvwDHIQS9xwcNrKHmVUFi/yKYUp1pz1Xv4ei5s5AlO1m9EHhctSMpMJfdxTkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793549988;
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
	bh=XKki1BVP6boqaihfnG28ETsQK0Xv5aTvz37Z/p9Fc8M=;
	b=NbNaTS+mVA7FwyoZeKfMAFyuMRxG4xrhhqiiDbouLQjzUIUUkofERNogaJ8n1qQGAZAC
	 /aOglgFz6Fy7w7Fvw0o43o94gUh8zoggPUh8o1mAgRmGOmp9X21lf9Vv2+fBI48/eGkQW
	 rCrBOsKipZgLbEVdQl1xBpa3VvHJXdcBc7soWgCsLmkcWm+/ulzbI9XxNaz1TvETQVnFV
	 2SS9Rmchlj2mUAk0ogB/IUXSnxeTu1wzJ0MIWUX2foLXwuTjluQwkQljHT7TW8OjN7ipe
	 he7ALNLUbx0gF3EvXReGTHA2a97DORtZyHQwNkXcZyqr9aADgoiMkWupGJSV5iTFx6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ngyOjaV0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4734C606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4734C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ngyOjaV0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793549986; x=1825085986;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=XKki1BVP6boqaihfnG28ETsQK0Xv5aTvz37Z/p9Fc8M=;
  b=ngyOjaV03PUM+rfM2EMmFFyBS9ty9+Y8cL/5NNFut2Kqs2dEGXD1pGwz
   OCFuvA4DRy2fGeB+rgW8YV7jeY1KeySTeEfiD6Y6s4yZkxHM3MPtfSfeI
   mAAq/tcQDYwqwY1JNoDIl7vcyCeUgsELmQvbCvdlPFtBrm5ebDlXAUcJw
   AgF3f+xOhIMzorASPNZSufwo8p6x2xyKQU45lPd5xbwJcA2lMQo52wlXe
   JfgWDMujdzHh5ZpYRlYn32K1FSXvQA4nQyFssWTuQOphS9j+2kSI1Xj//
   F2MGsFF0r3LFAjZZtcRm0rsFic9wnMOq1JYtlegg44otvOWKGO3CclvCP
   A==;
X-CSE-ConnectionGUID: NuoRcZs+TV+vjvFQ8EIbXQ==
X-CSE-MsgGUID: q38bRb83QXitczrP8bepaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2138546"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2138546"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 08:19:45 -0800
X-CSE-ConnectionGUID: ZuBRpbqVREeb6sQTI9/5zQ==
X-CSE-MsgGUID: 6T+l2M9iSyeR76E0y5xOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="6032138"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 08:19:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 08:19:44 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 1 Nov 2026 08:19:44 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.59) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 1 Nov 2026 08:19:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xS/XTv5dxd4V2fq01hbqsG0Xdc0J667L6Zrmyj4aJF0i2+mDsD8VPirKcSoO2XcJlAuMHqXojOkdbi6KMc9NAjLhVBNFtJ/i8vdzQFQWlUsllXNvCm615g7NHBn6t1tvb6YHwr1Q9l4l1g6jeR6+httgUrIX9qxVH7wseAraIAo+gJanuvZyNNSgM2tZYERzFbXA9ChXmAPubhIXbS3IHKUoLB9Pq588Yo6yS/mHkonOKu/CEB5w6tFYh626mmJ2W67aODCEokSSt9pThrC9pZH6YqrfoIZtzIoAFG6yeOjRiEpvudxIthGD4FJ4nzSX+F5uI3fWuAnT2F6RgbCHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKki1BVP6boqaihfnG28ETsQK0Xv5aTvz37Z/p9Fc8M=;
 b=Bh2J85GTYMDeJgGwgZe1arfbR9L5pxTG6hmf49buzNPLqcCJSsQd4ACyXh2zSzZliuTTemeYJJLO8ClDCfQXJenVTS9IxG8eJcuA7QT3N3EZ+Qa3Mis7s8icWCZP3NNDCNQDUrYY59kj46MySm9qj7UDTi7YEyANazzlFZQCVwqB7OhBnYmujlWWXiy4NU0hMaiW8l6SY4N7ez6FA4GDizyn3Qj0NdIRRxSHQIfGbUULsbwAoztUvJ4J1olCrjjcjNvRxk33WO0898bGMaR8db3I15tUWq/N2/AL91vB/akYSjHfqNs1fcH697gjCihiJj/h8fKFblQkeSOvBn0QJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 (2603:10b6:518:1::d57) by CY5PR11MB6414.namprd11.prod.outlook.com
 (2603:10b6:930:36::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.11; Sun, 1 Nov
 2026 16:16:29 +0000
Received: from PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3]) by PH3PPFE241D7F14.namprd11.prod.outlook.com
 ([fe80::e459:ea7c:45a:2ad3%4]) with mapi id 15.21.0569.011; Sun, 1 Nov 2026
 16:16:29 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: =?utf-8?B?QW50b25pbyBWw6F6cXVleiBCbGFuY28=?=
	<antoniovazquezblanco@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, Dorian Stoll <dorian.stoll@tmsp.io>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] mei: me: add ice lake point LP iTouch DID
Thread-Topic: [PATCH v2] mei: me: add ice lake point LP iTouch DID
Thread-Index: AQHdZ4Jh9WYUKzYKMk6XfFmdn2YQVrcZaRxw
Date: Sun, 1 Nov 2026 16:16:28 +0000
Message-ID: <PH3PPFE241D7F1431CFDADD8FED3A5F0D77ED6B2@PH3PPFE241D7F14.namprd11.prod.outlook.com>
References: <20261028221017.54426-1-antoniovazquezblanco@gmail.com>
 <20261029084859.4537-1-antoniovazquezblanco@gmail.com>
In-Reply-To: <20261029084859.4537-1-antoniovazquezblanco@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPFE241D7F14:EE_|CY5PR11MB6414:EE_
x-ms-office365-filtering-correlation-id: eb0c2e87-f194-42b3-cfa0-08df38337c59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|38070700021|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|10067099003|22082099003|18002099003|6133799003|3023799007;
x-microsoft-antispam-message-info: l3QbXJql1TLJNbEFJRImP8yCRYM0HknkBWfZXz4JI5Uk/nMkRWVZKB0Xkox6RPcR1UG2JI33vmiMMyM6Xyxcv2BepqP172/pTvdHcID4wxmSUm9HGs7RfKUXNPo6WtRCAWEYq5WpzGHMWj301/3PkSKt6lu+jtZIa9GBbBpm7YB6SKSVYE1Mm2FEgZJw9hCI+GYeM0l2G+OUDohq3yimBeAunIaQdUxn2A0UV2AOilw5DotGzY9aBc5991Q4sEm3QfyeWk8wEma+ncXVELiwUsJAkwRrNtTm3ya6UBY8NMid+vMyC03XShZeDo/Fw7fBwmJNqn+taadLb+hcP8f3LLKTjjlRlgBrZoeQ9J+P4e6R3G2ztgRezCEWEqTrFMgO8O7/RQXkPk/x/Obw6YtIqLRwQEtn5Jd7Z6ggTxSawSG1rF2Z1+IMNES+p9ZJtbse0N3q7ceLv0s9xmhHOVBWwvfr2UoCwukVuTrgqyaNReQuGPcUm+X2F+Skz1KLpmiap3wTcoesn/l76bne4XuFLtauDD+UtwPtxTNUil4abuwnTBuJ59QqpvvhjiQnox13K/gqpNHrndeo0twF9tyWyuXc8UWrhPZznlfcFoat5RtzJKQbQfNuM9X+K245QjbsUAnn5/LK11pWp/qRaTK2R/FrvOawx84WehiVS5yCANsbJWU2sP4ssoXFgcNeXbum
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPFE241D7F14.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGx2eVM3YkRubHozVkkyVzJnUWZKeHF5eFp2bUd3aWM5dUxtYm1URXZLd3k4?=
 =?utf-8?B?M3ZObzNXSTF0ckdGS2pJT09OWldsWFM2Y1JxT21iUHkrcjFIQzY4QWhZVmdP?=
 =?utf-8?B?dTBpcjVTaGhaZlp0NEN2eVNiMUl6OHVWZ0thLy9aN2lNZnFremd4QlBDZ2No?=
 =?utf-8?B?ZkcySHd0SmZrTTFDTGRoblRyZWNVa1AwMGt3a2E4UXhUUnRVQTlmWjlha1Mw?=
 =?utf-8?B?T2dxQ0FOVDVaUkVpNjQ3bEx3M0pEN1NobEJQWUVZZjdMMXZ0OXM1ZWo4dTBh?=
 =?utf-8?B?MkRVS3BZbWxlZ0FMc3VYaEJ6cTVkNHFaa1JBTGdNcUtueVYwWFIveUlGRkFm?=
 =?utf-8?B?amJ1ZEROYlMxam94SWJRd2ZEVkt2RmNZeFpybXFiNFNqTzl3QVd1VGM0dnJQ?=
 =?utf-8?B?T0psY0Jmbngwb0xJWjFBalJENmlEMlhlNlZ6amJJZGQ3QTF4eWZqUXlTMWNw?=
 =?utf-8?B?TGliK3FUZEYwVEZkWGw5cnU3WGhmZnNUYXdJQ0dEaGVhNWlnTEV4bERodElH?=
 =?utf-8?B?NTNTRXhKUHBrdi8zclBEYkJhMUxYb1Ryc3NzVkdCVXF5ckFhREtRcXlSZFVv?=
 =?utf-8?B?U2NPUlJRSGdBSENNSGpoOTZxaTE2MGgxWFRPMS9hT05GdE9mcEpyZi9LTk44?=
 =?utf-8?B?L004eFZoT2IzTTl2QUFCVkNhV0NMRmZ5V2xPVjNhK1ByeERDM2gzM2NTVWh2?=
 =?utf-8?B?RnIyRFpGQjRMS1lYU2FCL2pQcFRaMnB0dVkwcFQ3enVJU1NiRGRreXAzNEp0?=
 =?utf-8?B?YmxWMkw3Y01lNytmM0x6SVB3K0paV3gzZ0tOOWtuYW5BNmxuOFdxdW9FTFgw?=
 =?utf-8?B?akRBYlA1cUxTLzZmWGwyR0RQQytYTFozWmpPSXFmVStRbEk1TXRPczQ4b29w?=
 =?utf-8?B?VU9KZE5lOGV0THdVRWsyN0lXaGNrTURIcE14NU1GdW55T0RWTGYyQTZTbk10?=
 =?utf-8?B?MndqSXBXaFo1OUl1M2ZZS1RiSXN2VUxpNkljWmtXMzNHVnlOODNkMzNGcHV2?=
 =?utf-8?B?ekNhcGwxa3gyelQ4N3I5L0tmK3lyUXBIUXJCcU5CZ01qWkYxbnVkRDJSYnda?=
 =?utf-8?B?aVlHY0FVc25KTnptV3I2Yng1a090TUxEd0lTRUNTNGRmcFJUL0dsYzdETE50?=
 =?utf-8?B?WEd5eFd1cU5DUjJXR2YzMlJKNnhqN2pUZW45aHgzWll3blc3Ym9tSFFCSVBj?=
 =?utf-8?B?TGNyN042VWF6M1FRR3pCV2R4Q3VPdG9COVNJUldPNklDUjEwdGJhajEraWZO?=
 =?utf-8?B?MHBETGIrMlNPZDRaUGRFcFRnU0tZNVJWZU1UM3NZTFNhNFlPbldheHBYWFh3?=
 =?utf-8?B?M3lLS2EvY3BoNEpyTG50YVE0WTVscVdROGQreGd3MUhHRjhOTDgvd1dLZlYv?=
 =?utf-8?B?WkV2ZEhaYkhiRkcvbFJCWFBhMm1JamdMTlZSMFhuK1BHejVXZzRNM3BieEhR?=
 =?utf-8?B?RFJoMmdJaTFqM0F0YkpEV08vaENjNW5BVmIzUUJWcUg4RmF2VFhuZ2NQdmRO?=
 =?utf-8?B?aDFGT3JDZUZ6WDJxYUlPbGpxNGpralRsWm9FaW5pREpsMGlybEowYngxcFhz?=
 =?utf-8?B?TkFpMDdpQkNpR0Nmd0VZY3FEYjZzRFFCNU1UN2IrT21UbWtPSmxMaVpXRXky?=
 =?utf-8?B?OE8wYjdnQ0Iya2xJQ2xVdjJrb2tjQU10R2JMMFF0b1Y4dXlNdVRvME5EU2Ju?=
 =?utf-8?B?NzZ5RW5ra081YWJLL2l6M01QK09zbjFWWGtGWGhOM0J1U0pQdnZYNWJTbElF?=
 =?utf-8?B?eTRNRlB2Y0hXWHpqZFlOY1RFUmgwZTRvRTRiYzgxeDRHRGp5TzdZdHpnOCtF?=
 =?utf-8?B?R1ZmTEYwVXI4eFJRVEYrRTFoZUhZcWJjUVFJVUM0TEYzUXlmcm05bGNNdjZB?=
 =?utf-8?B?Ym9HZGZDbWFJeDJOWkp2dmxTOC9lMW9jeTZJYmN5Wm1LZmlTRHVMOTg1K1Rv?=
 =?utf-8?B?N2ROTHVYUmc3TUVTQjJKb0FSaEJhVWhDd1MwVnl1N243MzFobVcyRnZuaElC?=
 =?utf-8?B?U2RqQ1p6K1lZVjhja3F6NGtNV2p3c3k0YW96NzVtWlllSXZMRVNpZ2tHNWFz?=
 =?utf-8?B?U0t6cHltT3R0eWRGeDcyME15UVRkUzJJYUZVZk5YM0E5UmxibEZQQTUxM0xl?=
 =?utf-8?B?UTMxQi9UaVpPb1VGNjNUSGkxUjFFZDZ6YTN3d3BsOU5wWjNvOHMzYk1vcWdp?=
 =?utf-8?B?MGlpcjlxV2R2L1JrVll6ZmpRWktRc2FKczl5YjByR0l6ZnRVT0Urd0EvZ01R?=
 =?utf-8?B?Rm1UV3VsQ3RTUWxXNjNNYTFKMk5rSytMZ2daWmpoUmZVRm16bnVhY0o3ZWdH?=
 =?utf-8?B?dWJBT2FnZmNZVEk5dG1xemdIOWNKaVVpdFcvWVBrbkpDT2Y5UlFRZz09?=
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
X-Exchange-RoutingPolicyChecked: Ze4+dVAFgJkJp5+OjHwlJHEgyHk+Lmtf1AA9V+PrlBK5J9AtW15ASvfsLzXutLLy2zNSAlhBm2tmu4Aem2DKm1ob9QrE63JhMPZBGihQZjvCMHCOFfRmd74CSGwOIGQB5iCty0Em6a+DKQfYx0IsXaUs07LrYU+BYzNG52warwIinbQf4W5B64p0QCRGMTLBJQi8gEFzFBxik4rrZgFQJi680yVPRIZVCw1MbrjXj0PrV4snP7jYPVJTFhcd5MDasDtQjNsdlmgrSuKcVNxG651rARaNKQW4RFoHv9nPV42jGPylIAH0z20cenMisYxzCEpHhMb63HbQD7bFYbFLXA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPFE241D7F14.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0c2e87-f194-42b3-cfa0-08df38337c59
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2026 16:16:29.0011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HK76j7n9JYMoow5EKpHZmOPrdFHPbKKeloUbxFHEY7/BtgbTJFOY4YR2vMsCwwBK95+UjZF/U5ewxFMDVoS7DrFhaKdemu0jAAyNyFLu99o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggdjJdIG1laTogbWU6IGFkZCBpY2UgbGFrZSBwb2ludCBMUCBpVG91
Y2ggRElEDQo+IA0KPiBBZGQgdGhlIGRldmljZSBJRCBmb3IgdGhlIEludGVsIFByZWNpc2UgVG91
Y2ggJiBTdHlsdXMgKGlUb3VjaCkgZnVuY3Rpb24NCj4gb24gSWNlIExha2UgUG9pbnQgTFAuIEl0
IGFwcGVhcnMgYXMgUENJIGRldmljZSA4MDg2OjM0ZTQsIG5leHQgdG8gdGhlDQo+IHJlZ3VsYXIg
TUVJIGZ1bmN0aW9uIGF0IDgwODY6MzRlMCwgb24gTWljcm9zb2Z0IFN1cmZhY2UgUHJvIDcgYW5k
DQo+IFN1cmZhY2UgTGFwdG9wIDMuDQo+IA0KPiBXaXRob3V0IHRoaXMgZW50cnkgbWVpX21lIGRv
ZXMgbm90IGJpbmQsIHRoZSB0b3VjaCBjb250cm9sbGVyIGlzDQo+IHVucmVhY2hhYmxlLCBhbmQg
bmVpdGhlciB0aGUgdG91Y2hzY3JlZW4gbm9yIHRoZSBwZW4gd29yay4gVXNlcnMNCj4gY3VycmVu
dGx5IHdvcmsgYXJvdW5kIHRoaXMgYnkgYmluZGluZyB0aGUgZGV2aWNlIGJ5IGhhbmQgYXQgYm9v
dDoNCj4gDQo+ICAgZWNobyAiODA4NiAzNGU0IGZmZmZmZmZmIGZmZmZmZmZmIDAgMCA5IiA+IFwN
Cj4gICAgICAgICAgIC9zeXMvYnVzL3BjaS9kcml2ZXJzL21laV9tZS9uZXdfaWQNCj4gDQo+IHdo
ZXJlIHRoZSB0cmFpbGluZyA5IGlzIHRoZSBtZWlfbWVfY2Znc1tdIGluZGV4IG9mIE1FSV9NRV9Q
Q0gxMl9DRkcuDQo+IFRoYXQgaXMgZnJhZ2lsZSBieSBjb25zdHJ1Y3Rpb24sIHNpbmNlIHRoZSBp
bmRleCBpcyBwb3NpdGlvbmFsIGFuZCBhbnkNCj4gcmVvcmRlcmluZyBvZiB0aGUgY29uZmlnIGFy
cmF5IHNpbGVudGx5IGNoYW5nZXMgd2hpY2ggY29uZmlnIHRoZSBkZXZpY2UNCj4gZ2V0cy4NCj4g
DQo+IFRoaXMgSUQgd2FzIGZpcnN0IHJlcG9ydGVkIGluIEp1bmUgMjAyMCwgdG9nZXRoZXIgd2l0
aCBTdW5yaXNlIFBvaW50J3MNCj4gMHg5ZDNlLCBpbiAibWVpOiBtZTogQWRkIGl0b3VjaCBkZXZp
Y2UgSURzIGZvciBTUFQgLyBJQ1AiIFsxXS4gVGhhdA0KPiBzdWJtaXNzaW9uIHdhcyBkZWNsaW5l
ZCBvdmVyIHRoZSBzZXJ2ZXIgcGxhdGZvcm0gSUQgY29uZmxpY3QsIGFuZCB0aGUNCj4gU3Vucmlz
ZSBQb2ludCBoYWxmIHdhcyBzdWJzZXF1ZW50bHkgYWRkZWQgaW4gY29tbWl0IDM3MmE4Mjk4NjJl
NSAoIm1laToNCj4gbWU6IGFkZCBNRUkgZGV2aWNlIGZvciBTUFQgd2l0aCBJVFBTIGNhcGFiaWxp
dHkiKS4gSWNlIExha2UgUG9pbnQgd2FzDQo+IG5ldmVyIGFkZGVkLg0KPiANCj4gVXNlIE1FSV9N
RV9QQ0gxMl9TUFNfSVRPVUNIX0NGRywgc28gdGhhdCB0aGUgZGV2aWNlIGlzIHJlcG9ydGVkIHdp
dGgNCj4gdGhlDQo+IGNvcnJlY3Qga2luZCBhbmQgdGhlIFNQUyBmaXJtd2FyZSBleGNsdXNpb24g
YXBwbGllcy4gTm90ZSB0aGlzIGlzIG5vdCB0aGUNCj4gY29uZmlnIHRoZSBtYW51YWwgbmV3X2lk
IHdvcmthcm91bmQgYWJvdmUgc2VsZWN0czogaXQgcmVwb3J0cyBraW5kDQo+ICJpdG91Y2giIHJh
dGhlciB0aGFuICJtZWkiLCBhbmQgaXQgZG9lcyBub3Qgc2V0IHVwIGEgRE1BIHJpbmcuDQo+IA0K
DQpBY2tlZC1ieTogQWxleGFuZGVyIFVzeXNraW4gPGFsZXhhbmRlci51c3lza2luQGludGVsLmNv
bT4NCg0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMDA2MDExNTU5NTQu
NzY0NTU4LTEtDQo+IGRvcmlhbi5zdG9sbEB0bXNwLmlvLyBbMV0NCj4gU2lnbmVkLW9mZi1ieTog
QW50b25pbyBWw6F6cXVleiBCbGFuY28gPGFudG9uaW92YXpxdWV6YmxhbmNvQGdtYWlsLmNvbT4N
Cj4gLS0tDQo+IHYyOiB1c2UgTUVJX01FX1BDSDEyX1NQU19JVE9VQ0hfQ0ZHIGluc3RlYWQgb2Yg
TUVJX01FX1BDSDEyX0NGRywNCj4gYXMNCj4gICAgIHJlcXVlc3RlZCBieSBBbGV4YW5kZXIgVXN5
c2tpbi4gQ29tbWl0IG1lc3NhZ2UgdXBkYXRlZCB0byBzYXkgd2h5LCBhbmQNCj4gICAgIHRvIHNw
ZWxsIG91dCB0aGF0IHRoaXMgaXMgZGVsaWJlcmF0ZWx5IG5vdCB0aGUgY29uZmlnIHRoZSBuZXdf
aWQNCj4gICAgIHdvcmthcm91bmQgc2VsZWN0cy4NCj4gDQo+IHYxOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNjEwMjgyMjEwMTcuNTQ0MjYtMS0NCj4gYW50b25pb3ZhenF1ZXpibGFu
Y29AZ21haWwuY29tLw0KPiANCj4gTm90ZXMgZm9yIHJldmlldzoNCj4gDQo+IEJ1aWx0IG9uIGNo
YXItbWlzYy1uZXh0ICh4ODZfNjQgZGVmY29uZmlnICsgQ09ORklHX0lOVEVMX01FSV9NRT1tKTsg
bWVpDQo+IGFuZA0KPiBtZWktbWUgY29tcGlsZSBjbGVhbiB3aXRoIG5vIG5ldyB3YXJuaW5ncywg
YW5kIGNoZWNrcGF0Y2ggLS1zdHJpY3QgaXMgY2xlYW4uDQo+IFRoZSBlbWl0dGVkIHRhYmxlIGVu
dHJ5IGluIHBjaS1tZS5vIGlzIHZlbmRvcj0weDgwODYgZGV2aWNlPTB4MzRlNA0KPiBzdWJ2ZW5k
b3Ivc3ViZGV2aWNlPVBDSV9BTllfSUQgZHJpdmVyX2RhdGE9MTIsIHdoaWNoIGlzDQo+IE1FSV9N
RV9QQ0gxMl9TUFNfSVRPVUNIX0NGRyBhcyBpbnRlbmRlZC4NCj4gDQo+IEkgc3RpbGwgZG8gbm90
IGhhdmUgSWNlIExha2UgaGFyZHdhcmUsIHNvIHRoaXMgaXMgTk9UIHRlc3RlZCBvbiBhIHJlYWwg
ZGV2aWNlLg0KPiANCj4gT25lIHRoaW5nIHdvcnRoIGZsYWdnaW5nIGV4cGxpY2l0bHk6IHVubGlr
ZSB2MSwgdGhpcyBpcyBhIGJlaGF2aW91cmFsIGNoYW5nZQ0KPiBmb3IgcGVvcGxlIGN1cnJlbnRs
eSB1c2luZyB0aGUgbmV3X2lkIHdvcmthcm91bmQsIHNpbmNlIHRoYXQgc2VsZWN0cw0KPiBNRUlf
TUVfUENIMTJfQ0ZHIGFuZCBzbyBnaXZlcyB0aGVtIGEgRE1BIHJpbmcgd2hlcmUgdGhpcyBwYXRj
aCB3aWxsIG5vdC4NCj4gSSBhbQ0KPiBmb2xsb3dpbmcgeW91ciBjYWxsIG9uIHRoZSBoYXJkd2Fy
ZSwgYnV0IGl0IGlzIGEgcmVhbCBkaWZmZXJlbmNlIHJhdGhlciB0aGFuIGENCj4gcmVsYWJlbGxp
bmcsIHNvIGEgVGVzdGVkLWJ5IG9uIGEgU3VyZmFjZSBQcm8gNyBvciBMYXB0b3AgMyB3b3VsZCBi
ZSBtb3JlDQo+IHVzZWZ1bA0KPiBoZXJlIHRoYW4gaXQgd2FzIGZvciB2MS4NCj4gDQo+ICBkcml2
ZXJzL21pc2MvbWVpL2h3LW1lLXJlZ3MuaCB8IDEgKw0KPiAgZHJpdmVycy9taXNjL21laS9wY2kt
bWUuYyAgICAgfCAxICsNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21laS9ody1tZS1yZWdzLmggYi9kcml2ZXJzL21p
c2MvbWVpL2h3LW1lLXJlZ3MuaA0KPiBpbmRleCBiOWE2NzYyOTQ5NmIuLjM5NzJmOTUwNGYxMiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9taXNjL21laS9ody1tZS1yZWdzLmgNCj4gKysrIGIvZHJp
dmVycy9taXNjL21laS9ody1tZS1yZWdzLmgNCj4gQEAgLTk0LDYgKzk0LDcgQEANCj4gICNkZWZp
bmUgUENJX0RFVklDRV9JRF9JTlRFTF9NRUlfQ0RGICAgICAgICAweDE4RDMgIC8qIENlZGFyIEZv
cmsgKi8NCj4gDQo+ICAjZGVmaW5lIFBDSV9ERVZJQ0VfSURfSU5URUxfTUVJX0lDUF9MUCAgICAg
MHgzNEUwICAvKiBJY2UgTGFrZSBQb2ludCBMUCAqLw0KPiArI2RlZmluZSBQQ0lfREVWSUNFX0lE
X0lOVEVMX01FSV9JQ1BfTFBfMyAgIDB4MzRFNCAgLyogSWNlIExha2UgUG9pbnQgTFAgMw0KPiAo
aVRvdWNoKSAqLw0KPiAgI2RlZmluZSBQQ0lfREVWSUNFX0lEX0lOVEVMX01FSV9JQ1BfTiAgICAg
IDB4MzhFMCAgLyogSWNlIExha2UgUG9pbnQgTiAqLw0KPiANCj4gICNkZWZpbmUgUENJX0RFVklD
RV9JRF9JTlRFTF9NRUlfSlNQX04gICAgICAweDRERTAgIC8qIEphc3BlciBMYWtlIFBvaW50IE4N
Cj4gKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9tZWkvcGNpLW1lLmMgYi9kcml2ZXJz
L21pc2MvbWVpL3BjaS1tZS5jDQo+IGluZGV4IDc5MGE0NjQ3ODExYi4uY2ZkZWY5NTMxYWIxIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL21pc2MvbWVpL3BjaS1tZS5jDQo+ICsrKyBiL2RyaXZlcnMv
bWlzYy9tZWkvcGNpLW1lLmMNCj4gQEAgLTk4LDYgKzk4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVj
dCBwY2lfZGV2aWNlX2lkIG1laV9tZV9wY2lfdGJsW10gPSB7DQo+ICAJeyBQQ0lfREVWSUNFX0RB
VEEoSU5URUwsIE1FSV9DTVBfSF8zLA0KPiBNRUlfTUVfUENIOF9JVE9VQ0hfQ0ZHKSB9LA0KPiAN
Cj4gIAl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgTUVJX0lDUF9MUCwgTUVJX01FX1BDSDEyX0NG
RykgfSwNCj4gKwl7IFBDSV9ERVZJQ0VfREFUQShJTlRFTCwgTUVJX0lDUF9MUF8zLA0KPiBNRUlf
TUVfUENIMTJfU1BTX0lUT1VDSF9DRkcpIH0sDQo+ICAJeyBQQ0lfREVWSUNFX0RBVEEoSU5URUws
IE1FSV9JQ1BfTiwgTUVJX01FX1BDSDEyX0NGRykgfSwNCj4gDQo+ICAJeyBQQ0lfREVWSUNFX0RB
VEEoSU5URUwsIE1FSV9UR1BfTFAsIE1FSV9NRV9QQ0gxNV9DRkcpIH0sDQo+IC0tDQo+IDIuNTYu
MA0KDQo=
