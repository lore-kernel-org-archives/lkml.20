Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793761285;
	b=b+CRZd2F/D5tLJnDGy3xvwz9AhrzuzkXe5c91hBjAGxGR9yMaaY/Xzb5KJmn3YhkGhf8
	 GJI18cAxbqFetYxvugkt6g6ufJE2cj6cfEvk+TWc6YfVn6f7mBQyO/XMHlzChNsAoSLQO
	 lrsM02I+3uJMWJ/sMTUhaI+VQmEoJIcUjXsqN0vDFYG+gMTGiyA0hpfMNUzrZNA1Td9eJ
	 kBwMS/x5Sjdzfl2IBSSr6izhD3Xq3qurNuaodS7O2EHttZTq84ZL3EGZNHrB7ZoLKYY4V
	 uAto94V9w9zQgT+j8U7V+CMNw7Ohh44stw1DDZeQzMksjCJ5qNBrPDn2Y93mNDHhTTQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793761285;
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
	bh=moz28PuYAVPQkOiuwNgK5QQrlmlqo7bUTLnJA1Cf8ss=;
	b=vwN9u8xRq9TiqntO4rR14mmurKa/71FX6+IgvV3tZPHlgh1KvqhIJ3zYfOsqLNj/4Bv2
	 dakEYMGXZenSefcuKk2F63pgcyRwVThVyYqzapM+sR+7rifnFR244Jc5J+dDmF3y02pM7
	 moX+z4Ym0vREmvMFrpVespBz/QSOi3KchGMKzD1vGHwp7L9g4oIokOqTIyxx958ODd3pe
	 VWRFDvrC1Jr98Z9gss0hkR7ynkPuNf1v29IZTl5ljanUyYrEdhsmwitsMuZLxmjJ57PR3
	 IJVEMSBU2vhH9+3rVbz5+MkPmp+E5g2qsXgN0uYWwk90hxSxbxjmTD/F2Z/z0Cro/eg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mZpxVkO1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06212606A326;
	Wed,  4 Nov 2026 03:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06212606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mZpxVkO1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793761284; x=1825297284;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RDOKx6HlBYVs3y6WKe9NTKBbEZjkmpaKPJvy6HyDhZs=;
  b=mZpxVkO1LcSdRz4AnikPaclXPT0pXXtBWwlebNQf1YRJCOhKNUdXKh5S
   6cD4LFipQpflCNCJFpDsh0gaM/bqX7aq1Dy3GxcbV4djsh2dw/K/GEsXw
   3fBTrLEEMWdnXcB7Kcfwy9w6H/qEmMnTVQARFZk2vLSLvY7ezEWgvkaf1
   fWY/6e0Mj/Wiqxe4A6VN0I13vqPGdBipvg5W3e2iC+JnohWRFECfoxZRN
   5hjBakFyeL8WyznpklRjR7dVsUlnHankm1kRptW6+9J0xJB8yn9pmLzeK
   ahuQOH4d/BfDDjSPwBr0MTz20orV0XNMwJY/e1hhY39Dp9Nftzhz4qq0k
   Q==;
X-CSE-ConnectionGUID: nYYePEF/RViLfRtr+l/Qtg==
X-CSE-MsgGUID: WyKmTEyWS4uixc1XDwA1Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2400083"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2400083"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 19:01:23 -0800
X-CSE-ConnectionGUID: 9usr69tdR3WoRQ/tyPnztg==
X-CSE-MsgGUID: urFhHgLqQl2YB6iw9zK5QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8383949"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 19:01:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 19:01:21 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 19:01:21 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.46) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 19:01:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkK/RDbMjjrBU0ntZv93svI+Hkm59/dEwMfRuY+zvDbuOXQNx9TlJyI4CVBbQPdYUDPQnCiahIabSKaunidsAZtEucbPNEkbFLDEnD3AL8O04/4yjYL1/SnqJ/A2bbnzuB9XI7oivS6SbtxXoENB8N6IGD/9502/mzlqBQS9gjuTDyrqr6/EYAFturqlm9jY9RGLfoqkzu/W4CKIqxvOcUB552KFkZZSqPi+RkHWdWnIMXDxWk0miDAy7yniReF8z8s8eaC+3c3/xHiioXh6ssSta2pHjIMHrjvTWsWL1J2FJ9YQvZSDPW7+GDS0I3nRjujD1iqzhTqE00V39r3iFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moz28PuYAVPQkOiuwNgK5QQrlmlqo7bUTLnJA1Cf8ss=;
 b=jwZt7mDCA6DsRqBLhKzqEHPXir9ulAmU0MBHXDafOKgPrBjdx9QlC69VtYTKgcRFFI2Koeaj2MjzO69y1x+eGLMwjTH2q1G6zgRr4C5EI0u2isEqhNTpEtqg7Z12C+uJZW5oZAri3jIw/09ygKgivS4DHRdleFxi55hvzt8l0umy+QSy/aIBpkB0SZ8QOnIUUsvEzrM1ocJWJ10v2jjXGeilvESQgIKNKVe+5/S4iBI3opUnVrdGSqxS8roDGH58Sk8jr7J/ZOVsvW0Ouqus7QFDRrW26IIs+dn066mlsxP1/HXvWfRDPnc7804Ky5HPyPpxDsNI+oGLN1I2GrZGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by DSWPR11MB9763.namprd11.prod.outlook.com (2603:10b6:8:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 03:01:14 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%3]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 03:01:14 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Matthew Schwartz <matthew.schwartz@linux.dev>, "broonie@kernel.org"
	<broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, "Rojewski, Cezary"
	<cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 4/5] ASoC: sdw_utils: honor empty DisCo port lists when
 creating DAI links
Thread-Topic: [PATCH v2 4/5] ASoC: sdw_utils: honor empty DisCo port lists
 when creating DAI links
Thread-Index: AQHda9Apyuc+r7L/XU2/7XJLGUKEdbcdN/Kw
Date: Wed, 4 Nov 2026 03:01:14 +0000
Message-ID: <SJ2PR11MB84245460A5F91603F814E731FF682@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20261103200540.3863272-1-matthew.schwartz@linux.dev>
 <20261103200540.3863272-5-matthew.schwartz@linux.dev>
In-Reply-To: <20261103200540.3863272-5-matthew.schwartz@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|DSWPR11MB9763:EE_
x-ms-office365-filtering-correlation-id: ab2b8480-a37b-4f56-232c-08df3a1fe36e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|6133799003|10067099003|18002099003|22082099003|38070700021|56012099006|4143699003|261022105027099003|11063799006|261028144727099003|261102123227099003|261009223027099003|261026140227099003|261021121427099003;
x-microsoft-antispam-message-info: W4r4wcfwers6EZiEL8eYx2ZODphInuN/5msS8QV7XBrgkI87gDwI5HP2RXI1oL+KS/qU7c2Wtj9cCNGsVolof8g17kt20g2/wKjq6lTG/65OBmpNaOjPk5/1prdFO/4g9Mhw4RnFi+OFjLwgUZedJfFajpc6YJrMFU30U73DZgGaCxk0Vj0s3xynR7FS5XTaZuA9hSJ6n7NJvN1uTSfMXL9SHQapmimEAyi4VrV3oVKfyQh6sScV7CIYfjzZr0Qzp859B8q2E2jU4DqVl8ZSikcNCeivojLBUdRtoZO3L4zMD/Rasw72E/WfF5gCSsnaRRIpR++wYjAdiAUV/6m9d/DszbHcR9Py18ohAkBTK2zof+SI5RaSaORr9hoGRkRUIoyMyS42zoE25n0Df2VFAR1Mx2jmd5+YVyr9zo/yGlsOIt6fdpUo6xNSd/ooBtSkNrS/LqwePtEKsGDFIgqa88qWid+paov5XErFjM1pq6oFeKAtFHNjaP9XJJYFfshd0kmqDGk2Vr/3awQi+8G4TvTdTtVft1unkqYvwOEucauiR2Cw3jU+EB98doI8AxkHtMBDdwNWGiBsPR/RcwT0rKB5eQyn3TrbTtZKmjwgnpT7MBJ/RanC7ItJNEGz0+1FPl7Ptr8Dthw8Nfmsdpa3tWmiEeX+SJLN2mxhp6oFpgC5GbkIMsZCeSYtqWufAINRv9ldhoJxM5bDihBYijVjFzbGQenZO7JKksHtw+rzvGo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(18002099003)(22082099003)(38070700021)(56012099006)(4143699003)(261022105027099003)(11063799006)(261028144727099003)(261102123227099003)(261009223027099003)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XNAJAO3rHesmBspZktzEmRsRlAaq5l30Dec26mcosgCrUN6OXOKTcl9/szR6?=
 =?us-ascii?Q?n20/fZd9qoDIfKPGUNUQM7zqueIitKnL6Zh/lJOMNOhvp/VUqzOfq59ncHPf?=
 =?us-ascii?Q?hoOZAao2DXt/rP6MFzoJqSYKyV7zZgV1MJh4stxiRmD0eMoZ7+d4mgq1j55h?=
 =?us-ascii?Q?tclKVbgO5VXW4DUND5REaMv5xE/rHP8LcQaJMnnGTZFl0MSMZoTDNeKGtoMG?=
 =?us-ascii?Q?n4R0rnd//x2suGH7jdR8BFt5f9aqyZ6ZWHqQXAbD5S5LpxDWLC1dWABce/HT?=
 =?us-ascii?Q?wnHIVumVccIFEs4v/Y1qPukPl65CfH0rgtynIdRhzU+1BpTprm/mKu8qB5dw?=
 =?us-ascii?Q?5vQf+bEPsvemmDQEFw7gAGPHvpOe6JWXnD/+AKwHi+lHQTDz0s5vcr3oYs/1?=
 =?us-ascii?Q?J8naP2r42xdTrb9FOKHehzOKXGiyJ8pu5lE6HlOjkwNJypegfpKlWfu9T3Pe?=
 =?us-ascii?Q?OPEcqTvo6ZrmNVHQMKYtoi1HtS+mCnXLAFXPaVbNaqnFWqfd0/EJpjB06rdH?=
 =?us-ascii?Q?Pl6tMiaX1T4JpYDsIzc9RF3NpR29RX0t+H8T6lgeAUseUtFwvAmUv0UvCRQp?=
 =?us-ascii?Q?/gMr9ttfJukar+SXI690E+DLlqwZX2d/gNR/g0gaIadG1XRZPc/R5rzOlv7Q?=
 =?us-ascii?Q?691pPzqMzpOob9eDlHh9JzsJ+a/P1Lu9ZogDn3OBQGSYpbPcNleelC02nJkt?=
 =?us-ascii?Q?9LCP93ZW4fX/ob5atl1gDUTNhbVUQFyvhDYLMfT1ryrEKA+0zVZJ8OTTzAwJ?=
 =?us-ascii?Q?39ZCiMrtslZ5tmKvxIraSsunoBJODniFDLiMG2G5ljFBnGaql/UHePS38fc4?=
 =?us-ascii?Q?iDdyeQ8UEVtje2hSdqQ0YyXpoqu7MHMwHkzRB8ugHFUqWcmfLscdZb8U36Et?=
 =?us-ascii?Q?GHVN35VFMchQ1EndY/wxXbQ3FBNycXQG10YZgLrjUGekHSa1tHCbkyrXgiWY?=
 =?us-ascii?Q?BCcJSIiObWd4+FwgwM2JR7ZTdCAJTziwcNKrzsSIhNFVBQfR02vdH3LK/Mt6?=
 =?us-ascii?Q?4a4B81Sj8hrKzuyTtFMGw+lgo+MtTvxpGtMYKAb4M+cv/fWoK2sCbwm/Usjm?=
 =?us-ascii?Q?48weVb+0VItzHJC5jsVD/8InNVRtIiJ9w/QfRYjXl4sf/O9R4xMLBWOYvPFb?=
 =?us-ascii?Q?iZbmUMNarDcRdTLm0Dnj/L2KEnl4qsjOtah+JNAvpcbr1OPUoILYBpv67fS6?=
 =?us-ascii?Q?8aqD+rNCnj4KDimO5KGF0Tcsmy2JnLzxtW1TSiO0AyPsBOucdxfdcEKEKIY5?=
 =?us-ascii?Q?1/2iATFlo/8eRtsovx3ndETaiMyW3BTDUdZ3igYcEjz6P/3Gq/vvFzFCOlpq?=
 =?us-ascii?Q?QzgrIrYP625oC9Xo9kXqBki+rkfNVnc6x+GwQjvRvH894l71wF5eaSZVC1hC?=
 =?us-ascii?Q?elty7SrqXw7+bJ3iTXZbhRceRiTzpIhPuwPQDiGixqq9g4hW8unKYQEOaqlo?=
 =?us-ascii?Q?2xTym2ZzoVjjo9SvPeni280c51VpkyJ7HbyuMzH0Lx1E3+qbJLh77TGCQyGt?=
 =?us-ascii?Q?m9EaPGXASANhCe+SOsgFOle+Ojvc8jSK4WTIF+eGKMFtAyT6RlwQCY7TmMXa?=
 =?us-ascii?Q?7lbMlUwp194xuZxDbPzYzXoUzHuNPvCLI9IeGXoRChswtdhw7wzkztPuq/7J?=
 =?us-ascii?Q?H2h5G7jPgSojpDfzlVjNRkEbsIeP4Hl8zpwUhp751ppBIgL8+BrAF1RMspai?=
 =?us-ascii?Q?u+1xccLpI1RktAKya5jwof3DhQZsHPq/LJWeLEKIwqcxxk5sAKKN8UaGO92v?=
 =?us-ascii?Q?l6FepRHyig=3D=3D?=
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
X-Exchange-RoutingPolicyChecked: SkwXRsQ5mB9U4v6stqmQmZ5mIHG9N8uumu+Bm4ZkEwsW0cNxJ+jLd3WlAk0g34B6Q+qHzvUqEMSQsPqPME7z81sxAXo2APzcdASnIYhaQbbd82uVJ1CMiRR1isvBv4BeeyK4w/LN/A1T1PuuoJkxzP1wJ4mMrBCskjSkdmoQShWW5Ji1+4gPPZG9a3daw5MMNOyQWVQLaIFsJX8OREvzCO+GvnkxJOtIFtkBz2ibZJ+Xo21UtnCDX1Qfq4Rjq5arJzxaaIgAo14+A8f/kqBdtF8xG+pH+fhLwFf2iE+0d5NuTCfuvpfcbwVjfsKqlAKy91Nzbn0Jfl1x3DlMonxLDw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2b8480-a37b-4f56-232c-08df3a1fe36e
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 03:01:14.3362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6w2w68NeDzpUglOvUE+wA6BiobPZlwEeIotUdXN6pOUE/6dclMuyanTxD4cKGzgdkOwdahRjrtMBKncFgRl8rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9763
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Matthew Schwartz <matthew.schwartz@linux.dev>
> Sent: Wednesday, November 4, 2026 4:06 AM
> To: broonie@kernel.org
> Cc: Matthew Schwartz <matthew.schwartz@linux.dev>; Liam Girdwood
> <lgirdwood@gmail.com>; Jaroslav Kysela <perex@perex.cz>; Takashi Iwai
> <tiwai@suse.com>; Vijendar Mukunda <Vijendar.Mukunda@amd.com>;
> Venkata Prasad Potturu <venkataprasad.potturu@amd.com>; Rojewski,
> Cezary <cezary.rojewski@intel.com>; Peter Ujfalusi
> <peter.ujfalusi@linux.intel.com>; Bard Liao <yung-
> chuan.liao@linux.intel.com>; Kai Vehmanen <kai.vehmanen@linux.intel.com>;
> Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>; linux-
> sound@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v2 4/5] ASoC: sdw_utils: honor empty DisCo port lists whe=
n
> creating DAI links
>=20
> The codec_info tables give each DAI a fixed direction, so a TAS2783
> always gets an amp feedback capture link. The ASUS ROG Xbox Ally X20
> BIOS declares mipi-sdw-source-port-list as 0 for both of its TAS2783s,
> so the capture port has no DisCo properties and every open of the
> SmartAmp capture PCM fails in sdw_program_slave_port_params() with
> -EINVAL. The PCM is probed at session start, which logs a burst of
> transport errors on every boot, and the same failure is reported on the
> ASUS ProArt PX13.
>=20
> Store the effective direction in each endpoint and, for codecs whose
> driver takes its ports from the DisCo port lists, drop a direction when
> the peripheral declares an empty list for it, and skip the endpoint when
> neither direction is left. Other codecs keep the table direction, as
> many of their drivers use fixed port masks. Since endpoints in one group
> can now differ, the machine drivers take the stream name and DAI link ID
> from an endpoint that is part of the stream, and only count and
> initialize those endpoints.
>=20
> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> ---
[...]
>  int asoc_sdw_parse_sdw_endpoints(struct device *dev,
>  				 struct asoc_sdw_mc_private *ctx,
>  				 struct snd_soc_aux_dev *soc_aux,
> @@ -2493,6 +2520,26 @@ int asoc_sdw_parse_sdw_endpoints(struct
> device *dev,
>=20
>  				adr_end =3D &adr_dev->endpoints[j];
>  				dai_info =3D &codec_info->dais[adr_end->num];
> +
> +				if (adr_end->num >=3D codec_info->dai_num) {
> +					dev_err(dev,
> +						"%d is too many endpoints for
> codec: 0x%x\n",
> +						adr_end->num, codec_info-
> >part_id);
> +					return -EINVAL;
> +				}

This bounds check comes after `codec_info->dais[adr_end->num]`.
Please move it before the array access to validate the index first.
