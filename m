Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C83E2576E;
	Thu, 10 Sep 2026 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021746; cv=fail; b=g2mP5wJ3yI/ywXWIlf4S3Y55RzaJdimAZavtM9V2eKISlzvP78iybnho47dCqK52NYPn5gd/LihtSqVLN9suCWyxz0CS2hHGVUpD4729UtcWhri9kaNCXfAfXXsqbXPR2YmjmVajkTnNM7ete4HeJBqYGGLK5zU6pzguW99RR98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021746; c=relaxed/simple;
	bh=rUzwUvR1+gv2gRsPpfYTYV6eSR5aY1xtBnUE57aS+iM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=usy2srCzO/fZOyz3JDq32j8GtR7zJeAejWA9DxVF0ivpnf/TCxxcL7GOFhlZ9jP+ljgqHU8pyr0uEuVYM7EgCCI3m7U8hAXkhZh2s271FG4mJXs32GyulutJVtYU00/R7AzdPmPZx6XrZ04A3Cu1lS5nG8AjVDbla6oLC5bsmro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMuN7cww; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMuN7cww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789021744; x=1820557744;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rUzwUvR1+gv2gRsPpfYTYV6eSR5aY1xtBnUE57aS+iM=;
  b=VMuN7cwwfJ1fR71ERNmnYzIduZzaZNtlNGhEjIwwtijAO2Ewc2L4Ld1D
   7fHGuXAb+vU+ETVm40DmSYmEyTxSqka8uSIIg14yQ5hdR/ylTD1CTM3TJ
   XNsxaI4WPNa/16JKgVe6LNjYK9ZE0fDCyxxiS/NMXhTImduPns6fewQfO
   elcr3cDHMvHtf+0VzGSLx/E/cNohv5sxDAnaFfCU1Cd16u+FzK10fQaKK
   4WryasHWKpVKfLigP7bedTa1bRU6CLRyf/1ltBul5DHT/xGoCHO37XTnR
   o5yzRj0FLFH9BqqRxpRoZOI7X5zKeLawYM2YL3Qn7RKccOeMVNa39jw51
   Q==;
X-CSE-ConnectionGUID: wi8qqN40Toi5vduDkac65g==
X-CSE-MsgGUID: /uL6zvnaTUWlvWo+lX3R4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="91978658"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="91978658"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 23:29:03 -0700
X-CSE-ConnectionGUID: qd6Zitf0T++QDOQWDhgE8g==
X-CSE-MsgGUID: +U25vpBFSKycBZv8fmKq4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="270186506"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 23:29:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:29:02 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 23:29:02 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 23:29:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZ8eZhQe6niafKfgMYqGX+0iAOgFpKIraWdISZ1uF7R5558UwbT0zKqvgn5w5wsfLH4kkg4tDIOztaO4uSlVXcFrFPx8VSqblcBABwGZfhltxU2rLxi+YX1huMTtNsxtVA2+bK66JNQ9dxcJk9LKwGg8hu9GOQvoftnyS0CTwY34YLUGrbX0raITvU5L0wi6MLrh6WeFJKxFGnyyWzIx9fT7KSufDyRNwFqMVFNFqhQnbYAVt1athnh4GhxZ0cGLFC7e0O4YWDD2TA4xsSnkM83s8Atf7i0n00JGTMrgCKaU0tkoMgY/roNTlOB7a1SzpuSREABdxS+MOF1gJ4QSTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dz3B/neZ98Gt9ICHoY2hIHS9zMS7ps9sDl9zKVAmSIM=;
 b=cEBtQ3Xc1vysJeH8l8ke5lLwK6OdK8gjdgVa4+gUFzguqh81HZsIhIYc3GaOziLJ2k4JfrNARn4cI9okKA4T0kN1ChKNXPyyL0lBWhCXZ2tW5ise/i0apnqNYD6GyYM9RMr15gO35KLTz2AUHHG3Xf90NuBp4ilbq+z9VEAtf4P7nbyC0EBTWNboJns9XzAtCUYUsmhbm09vChLFUXt6cQqLK86AVCUwxCSiiXaTxRlfVmP+VJ0DEPP1obbe8N2QXUjMfp16+fYjDw+TGu5X1/3VcO0QW+uKXlcWte+TW+V7y1d/QD2NL7v38rSteUXlVk/jf6DvqTxOYTf1MRO7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4SPRMB0091.namprd11.prod.outlook.com (2603:10b6:8:43::5) by
 DS6PR11MB797010.namprd11.prod.outlook.com (2603:10b6:8:528::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 06:29:00 +0000
Received: from DM4SPRMB0091.namprd11.prod.outlook.com
 ([fe80::8071:c0a8:f88:cdcb]) by DM4SPRMB0091.namprd11.prod.outlook.com
 ([fe80::8071:c0a8:f88:cdcb%5]) with mapi id 15.21.0406.007; Thu, 10 Sep 2026
 06:29:00 +0000
From: "Su, Jimmy" <jimmy.su@intel.com>
To: "Zhang, Qingwu" <qingwu.zhang@intel.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Pierre Pinon <pierre@pinon1.fr>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vadillo,
 Miguel" <miguel.vadillo@intel.com>, "Yeh, Serin" <serin.yeh@intel.com>
Subject: RE: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken
 1928x1088 binned mode
Thread-Topic: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken
 1928x1088 binned mode
Thread-Index: AQHdPHPIT0sowWnDAk2TlrRuufasvbbEc6YAgAGgkACAAUmdsA==
Date: Thu, 10 Sep 2026 06:28:59 +0000
Message-ID: <DM4SPRMB0091FCB6C62990275CABC68F9DBF2@DM4SPRMB0091.namprd11.prod.outlook.com>
References: <20260904134604.595685-1-pierre@pinon1.fr>
 <ap_YYNDTG7Va4MD8@kekkonen.localdomain>
 <PH3PPF7708D4D9D95D62B6929DEB21637B888B02@PH3PPF7708D4D9D.namprd11.prod.outlook.com>
In-Reply-To: <PH3PPF7708D4D9D95D62B6929DEB21637B888B02@PH3PPF7708D4D9D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4SPRMB0091:EE_|DS6PR11MB797010:EE_
x-ms-office365-filtering-correlation-id: c5afa683-2c05-4c08-beb5-08df0f04ccd2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|10067099003|4143699003|11063799006|56012099006|6133799003|3023799007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: pDo1A558V+5yKK7pTCoj83rpgjFRxkqOARm1H0BRwUVmE85aU7jMd0kem4sBNb9c1Ajs/tB24qXnq3eHVsMMMAoOhrkaRT0wdZ3Gf7RbmFAfRzbEwliVbQpMgstMBEts6ilE05KKxWyTz9HwCD3gyM9Ovi6sEXF1jWqAFUg6S2MiBEA2inFEBJXxxVF+dBFP1QgXs9KKRJ+sSFve5b99vc1VTOY4W7MHthbCc+fAbQJ0Gpz+uRDHyJlc4QFRbbET2vXFWidgkPEXMkenCh58qxxWq0CUx1PKu6stBAZWAhjFxV1gIC0r0Xc1C9rHANu+GBF2XvlmJl6+I7WunzQCi8Cm5OGchGrlIag77Tti3Inb7noeiOfCRJAxeiqFK6Zv8wrW0ui4+c9YvcOxXFQJ5RqiGJs5cXSpyE7YJYSHxEmXlwKOr36Q1IE14/1Aljm2XHSq5KisYDm5ftss1+i1G3hhNWT/ToIJUSuqezLfnBkIXcO9oDAzcFmRL7+1V3inXa4oeJhcGZ/gZF8jdhM/jn9G0kJ0vxlwctVTQOfIf2J1L7FqXbRVGizLvw5JXERuoSvPmduS9BzWnieOONbJSiXO4GGZytUqPsr6eYdorMd8nlBCicm/E1fOOoVENY97G8uUwnAK3G466IgsME9ZRiBjchAzLRmm4wSjV5VjkV5iacFdyB4Wds0ucPCQvvTi9HcFxprBcjWKKR8AmszXDrYECIGZuB6ciPe4reg9cYQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4SPRMB0091.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(10067099003)(4143699003)(11063799006)(56012099006)(6133799003)(3023799007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?425PYD/yOUkr++ptzIzcJTgHsoAM5YxBIR1eOZoEOAxlwWnWm1rlh5Peuj?=
 =?iso-8859-1?Q?SaSENWi/QSexLKPLprDmd0tsiO4yQDiBfWfUKDuYeye2hEqfr3PHkF3g+W?=
 =?iso-8859-1?Q?B8oEHCe7q3lLVP+hpRMLMMYzWorD0symeoTLxxOcCY18pXBTUExF7yFuuG?=
 =?iso-8859-1?Q?N9Id/nlO4+5vnKuhbHjs9U+3Ne8BaVRSa1kBg5BYNb9LVDM+7VtRsF0yk+?=
 =?iso-8859-1?Q?772b11ujguHdS7k0oGtf2LHEn3dYIV2aPU9+fFiJ9op3TbTNw8MLd4iD9b?=
 =?iso-8859-1?Q?9cunSkfXP5l49pR1ollPdjjqH3QGRZo4k9u3wmgeC06Ox+5I5mXvfMZSrX?=
 =?iso-8859-1?Q?kNlv5Pq0oUZKCn4r/lJtPDmuuJiKgb3mFettpNVCtrms8McIjg1xKuuFyS?=
 =?iso-8859-1?Q?7LwJHR0qrz8XQk1ozHoSLlCxXR20LioL1HYX8bkvp5vmTPyhhERkZ++fMM?=
 =?iso-8859-1?Q?wJSdzrwu3gKHAtuqv9HJaWhpyvzXsWhcbNCWHYiV4Qo3wyrYeSw0fvFO9T?=
 =?iso-8859-1?Q?nIMAG0/gFpSDncbJ3xWCSFd4q5xPQaIaLZfkaJHa0rKGaq0BQ53S6rU52V?=
 =?iso-8859-1?Q?fh9rP0ueI2MYy9+71PGzgsPS677c/HAe49EwS5w9MRW4VsW5bVVYW0OVsY?=
 =?iso-8859-1?Q?tFcq2j5ZGBxOLjrEjC7Z+HoCTFxIgfNni67kUS4oSXG+8uo2fJDiNk8W7c?=
 =?iso-8859-1?Q?+f10Z1Poyal8HlY/64M2ByCeqZoNvKBw0w8r8Az/RfncRf5PGW65g1zb9b?=
 =?iso-8859-1?Q?9LYAqu/0nhMQsqFpI5eacRpqLwapcZbXrJpXUmIKKZ9QsxOWD3ml8rIiMf?=
 =?iso-8859-1?Q?NFrFFOoZcoR9sZeyMnL4LLO/SfFMq9vfZuY2laEkY/MhTNMm53YyEJ6HDE?=
 =?iso-8859-1?Q?cnSLdLSv/6UcTthqhS3LBBql5VGqtvO7+x6JsKSLt9zZ0aov0LTKzc07b7?=
 =?iso-8859-1?Q?eKdNVgAIOy+TiX2i2WkIMsjrwdaGWXsWeAiUtD0x95JexU6kA2X+9fSNhQ?=
 =?iso-8859-1?Q?cpbw+4lrEkMcbGM/KN25L9OJhOKwSRDGONbgCf3rc09kYyLXy//6jCfQ1p?=
 =?iso-8859-1?Q?3ImvY4mGo/ez+6iJjHSDeOFp77SkMhY/tkHcV42RHtzqwGt9PD1UrswWRw?=
 =?iso-8859-1?Q?XVJI2jhmRImOzohRVh37p987BTo5MwhxR8urOTDtoLPk0Cs9K0qyiO8Itv?=
 =?iso-8859-1?Q?ha67j2hC3AnF+GDmRGY9x9iTUqH2qvi7xQRnufwAH5huMeCXGNrQrS1NPr?=
 =?iso-8859-1?Q?QmYGDW6ztUKXla2USCBZSWFeSkMJ7p4fK6tTUb64deieprSkHbneTj9IDm?=
 =?iso-8859-1?Q?jnSzgDBt1dR+KEyQN1a7rABxYZFCbJmg9BrUfdkYcqxrSS2faQvWdF8FXd?=
 =?iso-8859-1?Q?Kt+MP25+HZ886Q6i0Dd/3lZ6IURWsU/5CZs0F/z9nVVAWRnCVvUfeYh4S3?=
 =?iso-8859-1?Q?yJYWfqaAQIuZ4MoTCC8hY/N3YxY7mkTxfzrm2rP8SJuyckcmH8MIdrd7Ai?=
 =?iso-8859-1?Q?353CU4l9a5JtNjsIbd0PoPE9Hdiiy/9A6FxKenEZfIvh2Nm2wNAy4+3Uex?=
 =?iso-8859-1?Q?lwUGB58f+wnh32WfdOvBbOro7wL49fSSPjOWk6FPJnTWOI2kicIFGfLw9u?=
 =?iso-8859-1?Q?XQJV14XzKnypTM+U7T7so9DdOMBOV74NjO+n5Fw9G1gi9RQ5Z7qBhDGMsj?=
 =?iso-8859-1?Q?lrV607trC/LMmzeRJVC2o2RGEZVtiQhMaAw/dFU+qALIk2Mp+XgYp7KqQR?=
 =?iso-8859-1?Q?ZvWBZgkvCoOfnuJVW2cCG5rMZeU9eBjR2rlpArOR/fXlNx?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: nKBaDY4AHe69pGHqB/sP9itX1zzel1C3PsE28M0iXnxBv84IwsyXasH9hPChvUJfaLz0ypvqH3BCRSpyXZqfuI1vqafsKa1/MkDVj+lcHC13O6lkDGXdXMnP7hJoMiwRe9oATYfJOr3Duqbs6TyFtTJtNjc0rP8kR48ZhzRuCVzT3RcTHKhwuiZ52InPw0tq+xEo3cgTd8FvHgdqXRvYqvgvKrr244GkoSzGSWvgBd9QZXBXMunRrrrvYj6NqAI45Gv5bsJLTj8IjMvt6S+4CYtNwt5oJsd97uQEAk6qZFGFPKpAOPJ3G87ffW74+8k6Y8t10ksUxk15Y6Efri9EDA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4SPRMB0091.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5afa683-2c05-4c08-beb5-08df0f04ccd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2026 06:29:00.0242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hfp4Y9PMN0mIkM83ewFoVTNi3VGibJmklDYzt/d+MFrbsudgg/f7n5NUMBrX0ipNkvzGqLQ8TjsxF3f4m7NJlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB797010
X-OriginatorOrg: intel.com

Hi Sakari,=20
As I know, one of Chrome MTL project is using ov08x40 sensor.=20
It supports "3856x2416@4 lanes linear mode" & "1928x1208@ 4 lanes linear mo=
de".

Then Linux projects support 3856x2176@ 4 lanes & 2 lanes linear mode.  =20
BTW, Some Linux projects have CV solution.=20
From one CV vendor's feedback, 1928x1088 resolution only supports sHDR mode=
.=20
But our sensor driver only supports 1928x1088@linear mode.=20
It could have unexpected issue while this device has CVS board.=20

Jimmy

-----Original Message-----
From: Zhang, Qingwu <qingwu.zhang@intel.com>=20
Sent: Wednesday, September 9, 2026 6:33 PM
To: Sakari Ailus <sakari.ailus@linux.intel.com>; Pierre Pinon <pierre@pinon=
1.fr>; Su, Jimmy <jimmy.su@intel.com>
Cc: Jason Chen <jason.z.chen@intel.com>; linux-media@vger.kernel.org; Mauro=
 Carvalho Chehab <mchehab@kernel.org>; Hans de Goede <hansg@kernel.org>; li=
nux-kernel@vger.kernel.org; Vadillo, Miguel <miguel.vadillo@intel.com>
Subject: RE: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken 1928=
x1088 binned mode


Hi Sakari,

The binned mode of ov08x40 was verified and already had been used on many p=
rojects of Chrome and Linux.
We didn't verify the binned mode with CVS due to no such device in hand.

@Su, Jimmy, please help to comment if verified with CVS before.

Best Regards
Qingwu

-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Sent: Tuesday, September 8, 2026 5:42 PM
To: Pierre Pinon <pierre@pinon1.fr>
Cc: Jason Chen <jason.z.chen@intel.com>; Su, Jimmy <jimmy.su@intel.com>; li=
nux-media@vger.kernel.org; Mauro Carvalho Chehab <mchehab@kernel.org>; Hans=
 de Goede <hansg@kernel.org>; linux-kernel@vger.kernel.org; Vadillo, Miguel=
 <miguel.vadillo@intel.com>; Zhang, Qingwu <qingwu.zhang@intel.com>
Subject: Re: [PATCH 2/2] media: i2c: ov08x40: Do not expose the broken 1928=
x1088 binned mode

Hi Pierre,

On Fri, Sep 04, 2026 at 03:46:00PM +0200, Pierre Pinon wrote:
> On IPU7 platforms the 1928x1088 2x2-binned mode does not deliver=20
> usable
> frames: the sensor emits only the first and the last line of each=20
> frame, and the rest of the capture buffer is never written.
>=20
> Measured on a Dell Pro 14 Premium PA14260 (IPU7 + Intel CVS, 2 MIPI=20
> lanes at 1500 Mbps) by instrumenting libcamera's software ISP to=20
> count, for each line of the incoming buffer, how many samples were=20
> left at
> 0xffff:
>=20
>   3856x2176 mode : 2177 of 2177 lines carry data
>   1928x1088 mode :    2 of 1089 lines carry data (the first and the last)

Did you use upstream kernel to test this? There are some hints the CVS coul=
d be the culprit.

What USB and I=B2C devices can be found in the system?

Cc Miguel and Qingwu as well. Qingwu: any idea if the binned mode was ever =
tested and if CVS was involved?

Removing a presumably otherwise working (?) mode seems a bit drastic.

>=20
> The raw samples confirm it. In the working mode they sit in the=20
> expected 10-bit range; in the binned mode everything outside those two=20
> lines is
> 0xffff:
>=20
>   3856x2176 : min=3D59  max=3D81
>   1928x1088 : min=3D261 max=3D65535
>=20
> The consequence is not cosmetic. libcamera's simple pipeline handler=20
> selects the smallest sensor mode that can satisfy the requested=20
> output, so every capture at or below 1928x1088 -- which includes every=20
> resolution a browser asks for over WebRTC -- is routed to this mode=20
> and produces a uniformly saturated image. Requests above that size use=20
> the 3856x2176 mode and work correctly.
>=20
> I could not determine whether the fault lies in the mode's register=20
> list or in how the IPU7 CSI-2 receiver handles it; the register=20
> programming is unchanged since before commit ff1f5010a96a ("media:
> ov08x40: Remove common register settings from resolution-specific=20
> table"), which I verified does not drop or alter any register for this=20
> mode. The 4-lane binned mode (1928x1208) could not be exercised on this h=
ardware.
>=20
> Until the cause is understood, stop advertising the mode so that=20
> userspace falls back to the full resolution mode, which works. With=20
> this change a 640x480 capture on the affected machine goes from a=20
> uniform saturated frame to a correctly exposed image.
>=20
> Signed-off-by: Pierre Pinon <pierre@pinon1.fr>
> ---
>  drivers/media/i2c/ov08x40.c | 28 +++++++---------------------
>  1 file changed, 7 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c=20
> index 3de06e19803c..7b10780f25eb 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -1318,27 +1318,13 @@ static const struct ov08x40_mode supported_modes[=
] =3D {
>  		.exposure_shift =3D 1,
>  		.exposure_margin =3D OV08X40_EXPOSURE_MAX_MARGIN,
>  	},
> -	{
> -		.width =3D 1928,
> -		.height =3D 1088,
> -		.vts_def =3D OV08X40_VTS_BIN_30FPS,
> -		.vts_min =3D OV08X40_VTS_BIN_30FPS,
> -		.llp =3D 0x960,
> -		.lanes =3D 2,
> -		.reg_list =3D {
> -			.num_of_regs =3D ARRAY_SIZE(mode_1928x1088_regs_1500mbps),
> -			.regs =3D mode_1928x1088_regs_1500mbps,
> -		},
> -		.crop =3D {
> -			.left =3D 0,
> -			.top =3D 120,
> -			.width =3D 3872,
> -			.height =3D 2192,
> -		},
> -		.link_freq_index =3D OV08X40_LINK_FREQ_749MHZ_INDEX,
> -		.exposure_shift =3D 0,
> -		.exposure_margin =3D OV08X40_EXPOSURE_MAX_MARGIN,
> -	},
> +	/*
> +	 * The 1928x1088 binned mode is not exposed: on IPU7 platforms the
> +	 * sensor delivers only the first and last line of each frame in
> +	 * this mode, the rest of the buffer is never written. Measured on a
> +	 * Dell Pro 14 Premium PA14260: 2 valid lines out of 1088, against
> +	 * 2176/2176 in the 3856x2176 mode.
> +	 */
>  };
> =20
>  static const char * const ov08x40_supply_names[] =3D {

--
Regards,

Sakari Ailus
