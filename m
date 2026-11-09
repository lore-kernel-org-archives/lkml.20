Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794246879;
	b=yxJe4i/aLLULyjeXQVfaC202r+zWWZDAe4+uXodAwAY0E0yAf6jUNk/hvN7upduGJsx3
	 jfnbS/JxN4eSrPP3StDsmu+EHLnysaYp09GRV1Fm1D8njhEkYEEi/TYWnAp/bEtgNb/Bs
	 32bS6Yf8Gk7G7ctYeiQWQ2TAb2XtPjGBUvk27c1qS7Fl8v4HofEyy7qRqPXg5s0wqS0Mr
	 2XmlYI05clpVru9hWVOd3BMvxgpi9pLohFeNMh9aSpZYyiUFwTT7aoEsyVKVGFqMj6Sm5
	 LU8UkHedKsPTtq0JSPvZ83x7Kk2S1ru5wXm/dITCMai+M1P5zhuaoSogDp/0GmQCZCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246879;
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
	bh=JKpbFkhglszn8QRdm8gWKc7kNR3JqFbUDOqahbMI46A=;
	b=3B792kn0sNJHbA1FMuw+CBO8tu4TJ4V0rNJaEKm7k+QgSE421G5RaBzR+HgqiNye7PTw
	 +n9nk/RXbIDvjWatYQy2TPLHaz2pRQbTRucyClk7lJZnMQnBRSXqu/3o2+UOGsI0YiFIP
	 8yfd7OiKxonQymnnj58dZYAdQA4kOEApsNDPsvF4nLpO3U2WZb27flRol55SrRKeeTxmz
	 QixglFm24jjzapc0taEA+aY+UXWnw2b79qnAKsBK6SvUGpHFvBMkVf92Xj6WLFzKlf0ht
	 iq0wz7eBw1d21T+GJz2KSOdoCwTJuFiLCCGvBKnKrN/zyFC0iYoJsvUyyUPtC1iZjSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="KqSCXb/w";
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7967A606A321;
	Mon,  9 Nov 2026 17:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7967A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KqSCXb/w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794246879; x=1825782879;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JKpbFkhglszn8QRdm8gWKc7kNR3JqFbUDOqahbMI46A=;
  b=KqSCXb/wW5IthocEaVrejYBgEb1pTtejRHZ3beoHPsdyVdk+2B37vq0k
   srQozMLRvnjdtrXfjQWFRnOzKpZ9IISetZy0zd8v82Jaq3Zai85Cr0M3K
   lYOPiCfL3PevcsO34Ftivh5GZng51mvNKXqdMJPE9mQLRLC42DDvVgvTO
   66RuPIcb0S2dqvfmyWysRxSBxPj29pPPqZzhnfdipt9RP6N0W4z1ABzVk
   QQ6OLd5e2b3A1PDPMw+LBeKjUSdq++dMmQgYIKb13M3ZWe3wnX5Yzvgw0
   qhxSMhi5t7UIJE/ZGHguQ7/A7axj+Qz4Up2lpUuffOYEouWhJSAQHEOw3
   g==;
X-CSE-ConnectionGUID: ObKZ7ZrjRnqrooUIXFKrPQ==
X-CSE-MsgGUID: 3JptPgMtQ5SmhEdqqGTNaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3003573"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3003573"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:54:38 -0800
X-CSE-ConnectionGUID: tQIAxBr3SRG3bmCl4Y4EGg==
X-CSE-MsgGUID: 9UJ4jOrDRJiKN45GH9D5rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9670696"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:54:38 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 09:54:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 09:54:37 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.25)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 09:54:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H37AqfVIg4RC1Mf7+l0l8XkMn6/oIyT6JJRzLtM+GypIu2xq7fPia5csmO8MBXHdsKizPiIrEy7cZVRXI51kOJ1EZEf1IN+0X1DNQjMnRfWrJDkiBVL/bKuiT00jqbatjQmm8duBKTiAoHDzQ4QSO7tqP1V+AgYe9fhlX1QusMrwhaQ3EBfB502bD8KMekmAW+cykwYHiIhVs5TYcb9Le7DtsQoHREleQSWkyZGrPL5XXKTi9eK1WXGmVGMuCcyg+geYZCx3X4KtRnKNvSlOuC/wwnDBfT+6wfg9wESJ+FGTLbkH0ZKJRbvshoTj5admCiX8ntwI50nifnNxtYOq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JKpbFkhglszn8QRdm8gWKc7kNR3JqFbUDOqahbMI46A=;
 b=XbX2LSDQwCfXogkJqI1BEDiJGYS08P1Ngnf2h7oTiRS93WluTAsMWyvCCkjI0GgIbxQYGQBdsoG/gg7vXKeey00s/dwUVc7M6Y0+YbbK0T6nons9MkETCKYC3cMl+r2NyUITm2+0L6XZuv3+ORH2CptVh9QpamRk6tSsZBRYcDWxjivREKu5kMi0njmpBilpsun39gmFwbpmMBwAR5XXEG+zdAto90Bkgp7gdBESDPjYh9QNNmFwSGyRy/NvBl5+XmKfx+FdXQwIokBRQlVgCMidGbx+rpiXEofg4/eQGQa/8dBDPdr285fudcKoi6imylTAsIrBMH0IWdE8E3UA8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH8PR11MB403433.namprd11.prod.outlook.com
 (2603:10b6:610:32f::10) by PH8PR11MB9975.namprd11.prod.outlook.com
 (2603:10b6:510:3d1::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:54:35 +0000
Received: from CH8PR11MB403433.namprd11.prod.outlook.com
 ([fe80::b087:96e4:50ea:b5de]) by CH8PR11MB403433.namprd11.prod.outlook.com
 ([fe80::b087:96e4:50ea:b5de%4]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 17:54:34 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>, Rik van Riel <riel@surriel.com>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H.
 Peter Anvin" <hpa@zytor.com>, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>, Breno Leitao
	<leitao@debian.org>
Subject: RE: [PATCH] x86/mce: Restore rate limit on MCE logged message
Thread-Topic: [PATCH] x86/mce: Restore rate limit on MCE logged message
Thread-Index: AQHdb7ivN99zJscub06SbDharymls7ckn/EAgAFmQEA=
Date: Mon, 9 Nov 2026 17:54:34 +0000
Message-ID: <CH8PR11MB4034331B3E52AF39AA9C003E68FC732@CH8PR11MB403433.namprd11.prod.outlook.com>
References: <20261108143751.3af49e48@fangorn>
 <20261108202820.GCavDbZJgmwKqysH4X@fat_crate.local>
In-Reply-To: <20261108202820.GCavDbZJgmwKqysH4X@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR11MB403433:EE_|PH8PR11MB9975:EE_
x-ms-office365-filtering-correlation-id: 10e01c82-5367-463c-69fd-08df3e8a83b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|22082099003|18002099003|38070700021|11063799006|4143699003|56012099006|261009223027099003|261102123227099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261026121527099003|10067099003;
x-microsoft-antispam-message-info: eXumz6glsdIuxbhM/0/0n0nGYD8/H1SGJGGtWLBu4BpAVkIXTmYSA0Ha2ObHTs7uhlXFVKe4JZd0u1TngUClUm0byW3tmrGTH742opp/IGu6vLAPbyGL5Ew5+BDRHmUnpak3ZSSWx4Hz0xT3RhVKLOsf7eiRcKVzy6hJBHKniV7+7vzLMDzMY+dPuR1J28zHliHkRD4q89zHzUiyjo2/hp0VfAmJI131FU9fiHwChi/PkTtfMgAidKZkM1slXXNdemLC8SXulLU/53kOf4lUuJJUXgplLQ0Nan8eYNiixqoUU//Vuo4lxidtm8g1VPw7qV/yB/ncffSE+J8mLesqDjBj5fNuKLlHvPQb6AxD+AuDB2WxUnT6FpAkBJeRHQ3xImKsaSfRc8rWz8IZAbE5DAhgcUyGtTYxqJY7Vzj7wjVi5O6iibislrpqdLK7LPo8rtlAxS7woIvca8zZXO1s/tAoTgQfBiN4hd5r+hFxyZro8GS7g9GFFwlWy2UOYfpZ6WAr5V3/utoSP2TLOxeZJKTcm+I67Wwe7qQmK7Yz97FAxmwqamH63qFd+7u+/BqE/0/PuAi56JJO9vn3LfMO/OzJTsYPDnJMxWOux9DIv2nTierJtKRQ5jzx3nhZNQHVfw8TzioJCvlJfy5rfhv5LDmW2uYzvtvwF1mkaf5Rwu7gAS8OXfgYG7dK2hwDM/LqsCnHdtdp0WyAUSNWk5uiB9Lu9fLkJ053TAgc1U+mb6E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR11MB403433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(38070700021)(11063799006)(4143699003)(56012099006)(261009223027099003)(261102123227099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261026121527099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OTdYVVBMUlpTS2VIU0Y4VklkQU1iNlVyQ0g0RDVjTWJuQ0g5ZEhkaFZvSi9n?=
 =?utf-8?B?VmhNQ3RsRFJaTitYOTdKT3ZvSWtzOGk4QTBsS2oxR3Y3ZUtWVnVaQXdwNUdY?=
 =?utf-8?B?c0xjdjlJQVdCeXZxajd2NWRpcWlKTzlKWmVEeVRKRUFZeFpoS2FqcWlNbE5n?=
 =?utf-8?B?NWw3RWoyRkRzTWdHcFBEOEJTUkQyV3dWM0htSXpBYnFnc1kzbmdhcXU0SDlU?=
 =?utf-8?B?bE4vQWV3VWQzN0JzaE96V0dESjlUQmxEd3lKVnpVRUFqUUFxZnNyTnlnVHJN?=
 =?utf-8?B?VXBtUHJrTHhmVzkrM0MxWWZUVkV1UUVUMFBtMDNGYlVGaVlweEpQTCtWTGZk?=
 =?utf-8?B?UUJlV3Rwc2FnTDJXTDlZNmZqNkU1aU8xODBVUlBWMGFpT2VKWVVPWUdHQVBY?=
 =?utf-8?B?SEVzVlB2ZTgyWWtmM1g3T0xhK0xWM1h1N1BydUU1WnpVcmhSRDhhK1diTCtC?=
 =?utf-8?B?UHpNQXErRC9jZ3pFN2FOV0Vmb1FVYXo3YWI3NnI3RVc4aW5pY1ZCazgxUFNy?=
 =?utf-8?B?UE5NTnJvR1BsaHA2K3FaK0xiaWVqSzZiZ1ZLcHBlN1czZm0wK2RudURXRnUy?=
 =?utf-8?B?MDZTYjA1cHZndUZzSjZzK1ZZdTQyeHdsTktUM3dpd3o4MExNbWJ3Z2hIQy9r?=
 =?utf-8?B?eWZLQ0xpbWw4UUtZQnpYdlRWbStIMUFLSXhxcGFQMjBFVWJkN2lLUjFRWVRo?=
 =?utf-8?B?b2RVU2JoUE5UN3Z6cGN1MVh1bWZ3SnVxZnBmVGFYQy9peWJzQ3J3dVVoN0xh?=
 =?utf-8?B?MXIvUEl1VXRSYXJ1T0lrNmhpcTYrN21HNVpGVElNUjhLYzdNRFVtanlncDBa?=
 =?utf-8?B?RHRBckRveXFDV3M1SlArWVFRK1FDUEFISTlQeFJOejgzbktMTXB5OUVzemky?=
 =?utf-8?B?Q3cxcXhuUUdRMzMzcTZ5WnMxTWNkbmJPYnhNcE02d3h0a21ZUUZVYnNEWDdt?=
 =?utf-8?B?Wm9tbFE0ZlpHMGN4dUFZSkloRHhLNmNKeGtwZHp2a1R3TG1ObGlIUFpMQ3k2?=
 =?utf-8?B?dHFrOWpBSEh1bzRpWjZSMDM1VUVNU3ovRHE4VEVhS0d3NCtkLy96TVlWb1pt?=
 =?utf-8?B?RVVwVE52d2FMQ3pmT1RKOTAvRVFpejBXdzN4SHFnOGR5TVZZaW0wTlhLVHV3?=
 =?utf-8?B?eTFxMTVYQUg4Y0xkbk5NOGl3Y0FrMnRtYkNrN00xQWR6ZThMVnY3OXJtaTRv?=
 =?utf-8?B?YnRSWldrZnQ5ME52QkdkWjhoSDhvdFB4UlA4anA4cTVqMTBUV3NERzltQndM?=
 =?utf-8?B?eWszVzhVblROYkJlZ0Juc3BQbVo0Y1JTamMrU05zR3J0cndVN2wvMXd4N3ZD?=
 =?utf-8?B?QkdUZEJTd3M0T0NVRmxCQ004cTVaOXRZc3dFWFE5Z1VKdkUvTHNoMnBxa1pY?=
 =?utf-8?B?MDl5RVRrNGl1UWRsUnkrdHBWbDhDZ2lIT2t4Mzd2bndHMHlVUjByUXozTWRT?=
 =?utf-8?B?alNCbHBhV1ZoLzFBeFBWUHlPaTk2TE9GYk1CZEZIZzFjQzdLanp0TG9mbWw0?=
 =?utf-8?B?ZnFIMittVWRjSTRuVm9peHNxaGtjQ2xPQVBDRHNSR3p4Qk5ucURuckhkbktR?=
 =?utf-8?B?RnNZeW1QRkhuRFhYclhyMnVEYzZMQnlUZGRFbDJTVytpUWRwekM3c3VORW9u?=
 =?utf-8?B?dUZSazRSOEI0dTl1UEVDclpwRlBYRGtGSGtJcS9tTyt3VVNaMjliNFlGU2hH?=
 =?utf-8?B?cUlRV0QwTjc2RTJiZ1NQWjAvU01naG5Ca2hUSzlpeE1FSDJET1ZwVGw3bE5W?=
 =?utf-8?B?ZlVCU0JUYjA3SVJtM2hzd2JiVVAvZHdZL1JweE1ULzYwWitaWGlMUlFNNTdh?=
 =?utf-8?B?cDJOUDVjc1ZNWnByalF3Z09idjMzSDlmbjFSd2dqYUxoa0Z1UUQ3UXdEWU44?=
 =?utf-8?B?N3Vkd2hKOG13L1A5QzVmQ0xheXNUU0xtNjZWVGZZWFRaaHNpeDNXUWY2SzFG?=
 =?utf-8?B?amxCZWlLR0ZhbW4xTVZQVUZKNmI0dnEyUTIvdzBlOElYalozQkVRS3UwR25Z?=
 =?utf-8?B?aDVlVGQvZWhrRUJUNzg0Y0E2N1RBcHplaWdxZXErcHBZaDNOeGU4NVVUL2No?=
 =?utf-8?B?MWVDY3cxZUVuWmJrMGEzQVVVK0VIZHpPU2FsZXVOcmZROTdEWVlWTlZWdUFF?=
 =?utf-8?B?aHd4Vk5qWnpPdFhWKzhPeFNKUFl0VnBlRmhsTjBoejZyU2tjUnNSeHgzNXhl?=
 =?utf-8?B?cmc5bTFRUWFjYWt2VEQ3d3JTMGRSaFVLZmc0Z0g1cDlpMGl5YjVUSHdIRysw?=
 =?utf-8?B?NDlaeXZacmgwTmRuZHA4SmFtaFZhVGkvUTNSbTkvUi92WlJYR3F0Vm9hWmY3?=
 =?utf-8?Q?/6zkn7k6GH2QxoWaJN?=
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
X-Exchange-RoutingPolicyChecked: ZJZn7c7dmKzWpYEVIAcEMb0gJlobljij+0yKZzkve20fbWe5dub71fc5wOoZrAKHVzGsthAk3xkBToMo7y3rs1YAjt0dn7PiVUHybXC4vcryijSinUIe1E+xy92eSXrwyrOrNYqoKmMYwtX44+AMmieYCrvArdebYVn4K5hbMLnl2Bq5/Wha9va1qPNljlrZ4ufAj94JN+yCtS6DLfP9aw7uLtVHmRVp8fy7MeCn9fMd3KTTowbfVtMAV2qnQoGeZZwv3BdqE5M4xKiWszRVffdZCb8sqGR8STiTqXsL5n+FSVwiZDlJlvGqFIa9NzBfwr3gfBLqd5ci2St4HdpCCA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR11MB403433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e01c82-5367-463c-69fd-08df3e8a83b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2026 17:54:34.4649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UO8gtlO3Rs5dF/nkP37HZsCFP/4xuGDLKzVHx3ds5IdiTmKdoQ+92tECcalh+9Vpg9jacUP0mZ27U53dgWhT9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9975
X-OriginatorOrg: intel.com

PiBVc3VhbGx5LCBjb3JyZWN0YWJsZSBlcnJvcnMgYXJlIGNvbnN1bWVkIGJ5IHRoZSBDRUMgYW5k
IHlvdSBkb24ndCBzZWUNCj4gYW55dGhpbmcuIFNvIHlvdSBtdXN0IGJlIGRvaW5nIHNvbWV0aGlu
ZyBlbHNlLg0KDQptY2VfbG9nKCkgaXMgY2FsbGVkIGZyb20gdGhlIGludGVycnVwdC4gIENFQyBp
cyBjYWxsZWQgbGF0ZXIgYmVjYXVzZSBpdCByZWdpc3RlcmVkDQp3aXRoIG1jZV9yZWdpc3Rlcl9k
ZWNvZGVfY2hhaW4oKSB0byBiZSB0b2xkIGFib3V0IGVycm9ycyB0aGF0IHdlcmUgYWRkZWQgdG8g
dGhlDQpxdWV1ZSBieSBtY2VfZ2VuX3Bvb2xfYWRkKCkuDQoNClNvIHRoZSBtZXNzYWdlIGdvZXMg
b3V0IHRvIHRoZSBjb25zb2xlIGJlZm9yZSBDRUMgaGFzIGEgY2hhbmNlIHRvIHNxdWFzaA0KcmVw
b3J0aW5nIG9mIGNvcnJlY3RlZCBlcnJvcnMuDQoNCkNoYW5nZSBsb29rcyBnb29kIHRvIG1lOg0K
DQpSZXZpZXdlZC1ieTogVG9ueSBMdWNrIDx0b255Lmx1Y2tAaW50ZWwuY29tPg0KDQotVG9ueQ0K
