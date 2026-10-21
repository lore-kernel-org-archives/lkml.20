Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792559076;
	b=tjlyKqiQIreSaFFH1pFuGTNSaSld4eh5I6/Sfnd6xaaltpHPKPKFHp5p7rtWuu9rgXnP
	 vzoJG1O2q50CK0OyTDTbUezSSquVlI4z6aNKd2YjS5UYukd8p6BBEDIrXBlxiCWJ6YMkj
	 ZxxFV7AkZ/xLTpHdkPX818IgNIJFmcAnjWTC5ZSrwvDoYca+3gfXmAjrt5DYjhH2xVr4A
	 A/0eEelFduXssX+mUtXcQ4Efe7SEjzVPmP5k713Qng4IPgFAFKdbgG8RBgJGLRy21YpVr
	 9PVJSULmdDJdZB91l/Ribzf7szg/BJ2dwpbf6Ewvbjm6Fjxg7XFetkXN9G1MqGruE1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792559076;
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
	bh=4K2x8cqYheNKm/pE5sfXpnfROjkChh6Mr8maPBy6dvI=;
	b=F0qUVNfiYQDEhGjYap7i0GJiHxEMruwtqN2MvrNvs+GLX6uCPikGrOiSuzuV7iFFjo+l
	 BYXrCWUXn7Y8haaEnJCSpxPfibcvO9JXeU8bRs8YAZ1ufLM+0Ua8K0FN8lTguqkCqa+0c
	 RlN6VeGSpGLPRT3hslUHhXICsDqfwoO5JQTwu+2FIQAEtHfJOT8K7AOsPfXoMRNAdR+He
	 yOYy0t+CMXNobZnvWcOMp6z1IN+6v/2pm66x6xnS4SOyQxsPCQhvW7yKiNh+K8zbjGpCH
	 kiJwlfNP3c+AUYKqOjOCOorypCnFIqwNAHMtTUkph5DIEhCNfH5ZbIPninzV0cglRpg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=anhwiHra;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A04606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4A04606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=anhwiHra
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792559075; x=1824095075;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EtVRb4B7YDYkULFeMAbdGGg5UojKvHCXAysJdUCWKD4=;
  b=anhwiHraQfYFFajBjF+BpROJYINNX6q9O6IcrIXZ9HmBPIrbw461Gzne
   ctbqTklPS1mivCeBmwjjrUa/qxQh36OVSFiorNDdlz50T+p4nicpsDMjR
   RW73oCoHksPTz9gdhpVqrScVyCBTyoO6JArqXxNHBaydLq8h66qIn/PLr
   ydGSqazT1WkaOSgKhZjGjEYonN9XfH2viEHaImfIIcsRjIaVyju2ehfhL
   KFS0wV0HZVE6Ct7c/72X9raJs6X2NBG9BnVWE+S9c7HEqNq1qkMyd/7hs
   G/WSs+XCQKLgb/P69nQq/ES5NPOc5ERDNLUCcmUp79coAd0ks1643ZiOk
   w==;
X-CSE-ConnectionGUID: 1DWsX1FXTmSWkYnx+vMPNA==
X-CSE-MsgGUID: +teSPVqXTvWLTXQ/T2+wpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1376825"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1376825"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 22:04:35 -0700
X-CSE-ConnectionGUID: a9sjzRfTSCWS7myJKgq9kg==
X-CSE-MsgGUID: FRPVtzWxSvy4XvSJpKYGUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="4826768"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 22:04:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:04:33 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 22:04:33 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:04:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pgICUfEqlbc+T7ZJIlXZ0fmH76MkDQO8zwR9Jjf7Bj/gYEd3CmSqMddZNrRVeXyVQLPFxIlk1M8xNXwrsoTGxdq2FbOE28AHeAhvLmmOqK2OXBxgjHlcT77hLWsn62RWOk7ZrXMLBM5GV1iXK4To8KOncsvXs2aVH6KC0djD6n/5To+lsQrHZCiq/338tOHZdVR1r2fKlIVUMgk5EluYHkMRaDR7/OOtUZGQKPfEEVkIBTywbjM3csutaW+qOXX8oMxmrLNWgQFjME2t36qgpVTMsGSVAV/VshLprIXOivwtW/f9gmkoHJrePh9/mWJMzUxvOtIQNnyusYqG3YanaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4K2x8cqYheNKm/pE5sfXpnfROjkChh6Mr8maPBy6dvI=;
 b=DM6ItCK+NDxiYjbPgXf663TqRBH+nmhfWdMJvaqT1011EYZyddYIy0bIFI+OPKLzXRY0E5lAr+nBIZ36EBkwipN0Zj/EI4A820+VsP0EB5H2zCuJDwG9qntWL/gHu0DM0wXEMxW1I0Be27r6GZ7HZ+HUsMGUDYN/Plsof9+BShiaAHlS4c5euM4MAiipp5T01yhbdgsXmqnA67Rsws9mPysxnDYiUY2i6zB78PNV+U6KtEaKMMsGZEG4hbmi9YhsXYIkFP1oW4GJRRbOtBVTSE6ClORpx2G4x8EmuPwUPF6rEguq10cypSzqnGlHpf7KPNJs2Um6YLYw4mxQ/sBEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6153.namprd11.prod.outlook.com (2603:10b6:a03:488::18)
 by IA0PR11MB8335.namprd11.prod.outlook.com (2603:10b6:208:493::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 05:04:25 +0000
Received: from SJ1PR11MB6153.namprd11.prod.outlook.com
 ([fe80::d6e0:baf2:d31d:c812]) by SJ1PR11MB6153.namprd11.prod.outlook.com
 ([fe80::d6e0:baf2:d31d:c812%4]) with mapi id 15.21.0472.015; Wed, 21 Oct 2026
 05:04:24 +0000
From: "Li, Fei1" <fei1.li@intel.com>
To: "Liam R. Howlett (Google)" <liam@infradead.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Li, Fei1"
	<fei1.li@intel.com>
Subject: RE: [PATCH] samples/acrn: check posix_memalign() for any error
Thread-Topic: [PATCH] samples/acrn: check posix_memalign() for any error
Thread-Index: AQHdYELsowBKUsXwtE2YdHB/+rASmLcHcIsg
Date: Wed, 21 Oct 2026 05:04:24 +0000
Message-ID: <SJ1PR11MB6153D2B61FF87416E04460A0BF662@SJ1PR11MB6153.namprd11.prod.outlook.com>
References: <20261020032652.1920998-1-liam@infradead.org>
In-Reply-To: <20261020032652.1920998-1-liam@infradead.org>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6153:EE_|IA0PR11MB8335:EE_
x-ms-office365-filtering-correlation-id: d01f14da-ee18-4a94-a201-08df2f30c686
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|18002099003|22082099003|38070700021|11063799006|10067099003|261009223027099003|56012099006;
x-microsoft-antispam-message-info: m7XhiKAZkebGPqiUlc29jJd/ua2bZNoFibkc2wn8x6hDmezK5gxw8VAQ5olffo2W4b2qCsNWzKXyN/qbPog/UgQVfEl78Bl7nBYESFFIcLT2kSuxWVel0wz3ti4MoysCObhkfUd0LSs+XHE4PbiktaglJ6CB8KnqSCyN67TECz+0VWFZ1/cSZHf8IRyR++IdHBX0Ytf/uX0RthmMABFLfbic4sAXwyp97z+pmwinYhOUyO4KGVF8pAInijYRIAIbmw3lxeC8HJjq62hDTdGC1fLohBILpmuVot1fv6OIGv5vmzAiaorydkLvKmOfcs/RHsoWN3yr6Dy+e2vOTa7VVcOg6E9cwHNDBMG9pqS1FLxb7dsY7eIAQvNvP6RXFI3UTU3YirNVALoEn9txVHWjo+Go/62qF2i5monj0SQZYb5szE+Phj0LT2bwE8Ig2F+wIWEA/VmCLD8+zJ7pRQH/yT029A8tlja+dEwTH8ZVJm6PGY6+hwUM68tY+pPCW9u9urVHkuCxiH28ZjnNrtMk0G4GXfhb7pSx2A09WOxtBthyWeHOph+GVD+Sb7+Ti/K7VXI3a6BSMLY8JrLXprqlihHeG1g7riRpj1i2ycq0KoFH14LbuH34k3U28F+pIs5Ibp38xECXpTsccdYDlewbAk4x1yQF20egKPnhQ7tUCjDGJQTIt5wVjo51Tt3eKvnZZGMUiEo7Yv9vRB7OdJ1DhLywE8MLmilMJr0r9M/+ykg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6153.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(38070700021)(11063799006)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?UrVTXHUJBFF0Kr0SqwKJY/8NNtchaWeQPKb0Mmr2pDo3JNLIynPeo9WOVFDi?=
 =?us-ascii?Q?YPCVPjyle/RSqZOc2msGx83TKyYASCz9umvPb9RKzqH+8wIC4q4eaIzyPgJB?=
 =?us-ascii?Q?NGY0zPaNK+9qz7QLJCNlhTvME7pN0p9BWcIGzJ/nEA/ZtxLYInGwYssgob+V?=
 =?us-ascii?Q?SJ/C12em/C264BdK2yh6HPWIKGwUujzFrh6ndim6CB0f2mjiq6mh1EwVrNGC?=
 =?us-ascii?Q?491J+LU89zWK3XBTQDXkDPsVTSZva15YETxmHBw/ca6xHmEVbPNjCxgRHykj?=
 =?us-ascii?Q?DAyWSZRjnos4pg9rqFLpqg0wSZGoudQ3lP95Slh/jA3aPH9J6zeMdcinqIld?=
 =?us-ascii?Q?iYKo0GANPnBdmy9+aqFk3h2pydtH6THdGRVZgriNe21i+JJM4mMLogpVl0aY?=
 =?us-ascii?Q?SBrOMzyv0joxF/1aG3NQBXeeL4LRottAAf+qk0vDLfW1d55NSEsO7bdGvmTx?=
 =?us-ascii?Q?fOMLmuOOLRVu9FL5LlaqsEPCg1zeWehT/4+KqbcTjGoLPUVWAu8zYzTXsiRr?=
 =?us-ascii?Q?k18PLpW/P2G7ZO58TLrJnIRseuh31cd0U0Qm2bkU1ickJb7PTO4VTH/rg/Ez?=
 =?us-ascii?Q?1f+KqXslwMz4q125VethrFl78sERJoH1fk+OUGr+qibti7bqh7yZBaitOlqZ?=
 =?us-ascii?Q?X5/PJJCANLoCao8qWm8hobpYYrELR6JR58GTxQ8gJcSxc3yni4yOkbG7iyG7?=
 =?us-ascii?Q?+fPAAlzqzzHj2UWYPyn2QgtSk+Kso2xjtaWjCIePal5vY9jojIBB6bt+JXOu?=
 =?us-ascii?Q?8WE2rDo3wLbfsmEJwKlGBt+yuSeUVQSBXyfYk2Xb8pff8N1mkUWS4cmmiaG9?=
 =?us-ascii?Q?v10ViLDD0Yw5AsoV2kLfHYeWhOi7yhWizj7etk1RyckbGW9bqZtrdK8V/+fu?=
 =?us-ascii?Q?Rm7eVx4MA/XMAwGzkTX7fZOXMKopGY4TzKhmvwV3t747by5ZiGs67qqhuA17?=
 =?us-ascii?Q?9jHVso0FD9jMB74Ss95trH2bMOmIGyngnGX1l5zAgRUrDkgHM33eO+3FapHu?=
 =?us-ascii?Q?uCEcRMGDtCv2KOWB4DGiYyS5acSrauCSWE3IcoWDOTPGun4oJxrZ7xF6QoYr?=
 =?us-ascii?Q?WQxaBrG2RaYpwrej93nbuYa7rH8pf72iz8oGRbeeih/lgJCY2Kj9FDHbejs9?=
 =?us-ascii?Q?chS4GB42HlAaokZeHSTxy7XtBVXbuk7d10op9cAZAVBegp4qM+MquchZhLyQ?=
 =?us-ascii?Q?dA92T8ibel0yU7r3Lv7Vy11kUwnTPdnZ93Fey2+4eZIQSF1vcJiE7QRK91yB?=
 =?us-ascii?Q?hZ0/jfO0zaTNyui9zrM3L2xgSo9I7A8G+KFHIkaERy0VgNI5sUTdDzG7ihXI?=
 =?us-ascii?Q?4biF7UHAIvvMZ1NlHqit6fAJveB/2GN0TEGDAxJwwuBQdUUOFTaMBLn+urY9?=
 =?us-ascii?Q?W6fe+bnm83kaGL7DSOA4VVZCG/QVOZwZl+2mTWDSBdFwxLOMx8F4ZENFwDg7?=
 =?us-ascii?Q?GiLM+a1ghYAzHoRAfwdrK4T+dMPTSm3YcOVeGY7UmsS6EVd401jdBGJRiZqf?=
 =?us-ascii?Q?hOJlOxuiHkARVDdc6bS8sDH7ouKNl3XMkAwxfoxRtTX2W29Q5bnO9wy2YJGD?=
 =?us-ascii?Q?J5GdIXspF6hs+Vjpj/i/vmJ3eywI00EKfgTIeMn35h2eq1HHsCe70e6JLTZv?=
 =?us-ascii?Q?96kffmhXS8CfQNlojXiWm38cpAlAtHIJ5anKV+jmTVZrjyavmEb5eU589MeG?=
 =?us-ascii?Q?yqAXjZmi/Yk1b+gIl/gj6BlANeuY5wPu1kZ51+LCqTKOLqXG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yaEqZruDG3cOvgwXJHRmULUbXNyAVH0+z3x3t9vQbnVEHm33NdzobxxYuihmRyCANLgvMr6HvcHwd0eBpAbvuXw2gSiAbReLyjamdDrH2eUflkPwY7aiiHQ6u1sL7sXz2yQYSThucmVMJE9LDkdBOFeLTqAEMx14XSS7/q02Ub+qwLk0JIk4A5YAG4vZ/tBIAqqkb2Q81+WXdpVbuW5haIziazUUvN02C9apuq582rNHzWZgsPf9rAwueTKu6iqRu4h1fYFCSq+F4xMF08knxijRal6/KQgXdOxmBeoiTJJF5K6wcc/Jp0rPz1X7dBlWq14lAd9BHicqL92fcMMeYw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6153.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d01f14da-ee18-4a94-a201-08df2f30c686
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 05:04:24.4992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cH8L1AkgoQn+LOiDR4AIJlN3nMWQKwyl932Z4kahwuE2fv+LYDSSIFRfcLFV7QByaqCv25qDImgVCTYHteFZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8335
X-OriginatorOrg: intel.com

> -----Original Message-----
> From: Liam R. Howlett (Google) <liam@infradead.org>
> Sent: Tuesday, October 20, 2026 11:27 AM
> To: Li, Fei1 <fei1.li@intel.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; linux-
> kernel@vger.kernel.org; Liam R. Howlett (Google) <liam@infradead.org>
> Subject: [PATCH] samples/acrn: check posix_memalign() for any error
>=20
> posix_memalign() returns zero or a positive error number and does not set
> errno.  The check for a negative return is incorrect and a failed allocat=
ion goes
> on to copy the guest code through guest_memory unset.
>=20
> Test for a non-zero return.
>=20
> Fixes: 32118bdc9471 ("virt: acrn: Replace obsolete memalign() with
> posix_memalign()")
> Signed-off-by: Liam R. Howlett (Google) <liam@infradead.org>

Reviewed-by: Fei Li <fei1.li@intel.com>
Thanks.

> ---
>  samples/acrn/vm-sample.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/samples/acrn/vm-sample.c b/samples/acrn/vm-sample.c index
> c61e0f91456e0..0f98d2d75ae7c 100644
> --- a/samples/acrn/vm-sample.c
> +++ b/samples/acrn/vm-sample.c
> @@ -54,7 +54,7 @@ int main(int argc, char **argv)
>  	argv =3D argv;
>=20
>  	ret =3D posix_memalign(&guest_memory, 4096, GUEST_MEMORY_SIZE);
> -	if (ret < 0) {
> +	if (ret) {
>  		printf("Not enough memory!\n");
>  		return -1;
>  	}
> --
> 2.47.3

