Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0264B4DEC00;
	Mon, 28 Sep 2026 15:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608733; cv=fail; b=FF+bWrl0HSP+xVlRC1A9IqjrC7v7blUff7752Wg77RxE1dwHpcEOaMKrmhzCKCtZ16KzCuxx7cwV7lktfzFv8wDR+xwZRAgmMLiCA+UG2eXnNS27CUdr3+nVTHRZfisBPVpFUIiVekSMUo1u6g38IKZ89ExdaGDGw6LM2corBis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608733; c=relaxed/simple;
	bh=KQ2uPNX3bH4f+tZsXPUwTwQntP9K9+KPqxTecfEyN4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VKeUDO3dfx3sReL9BfQs2f3BaqAR3F95htf+/QkqgrFBno+cPIE5WBcwJvxQnp+oIhCYK9So0x3qRB4jSettN6R2QjwGmZkXeU26SJkwB1nkD7lkwjG5CtV0T/CfCCh+66B2XHjy2A98dQF0jkc+N05dK0Wb53IcplOjTg35S/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwSDzgGv; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwSDzgGv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790608732; x=1822144732;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KQ2uPNX3bH4f+tZsXPUwTwQntP9K9+KPqxTecfEyN4w=;
  b=UwSDzgGvknJ0zWT/ftmlG/o5aq+9wh3x8fk1ZhKv2sH4LDRezdy9b3Ei
   +MzXj8qwyJP6xlKwwhfMQlfDTYJjQTOaAQCcAsmFoJ9N1NDJhkW2R0Ojk
   jPsY3bmdfD3kmR6OkWbGGL4egQR+TiomXaFrcyjyZiIc3hHG/BAy5/UTG
   ExpsebkL39etg3LJiN/G7HD4Y2zYrSvUh/USbuIVBLuWLu88NiQrL6BxW
   S7evFVAALO1piCEDQiZaMV6ZREVQDPrl0zTMQnQJFxjGuuqUzqlG+eJxp
   6ZpgD48DE5IoykicZXHh7KeL9pRJ9YURZ6tTFaZjV/F9yEk6xIt+Re7VC
   A==;
X-CSE-ConnectionGUID: t+PcwDCtR6eY05m4seUlAg==
X-CSE-MsgGUID: 0thWQB4xT7W5KnGCKMRHng==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="94024559"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="94024559"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 08:18:49 -0700
X-CSE-ConnectionGUID: nU08LIKRRl6OJBglJ5RDDA==
X-CSE-MsgGUID: H4rplJtVQ3qNocA04I9mRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="313002176"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 08:18:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 08:18:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 08:18:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 08:18:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+mP5jcVSGMBn3dkkHuZgfkpWlGij32rrX/2qT0/U6TCWsYnYF3cWf/jSODJbFRqjhJYo1qMyIXmcQMuiclJtTdxVgAm/183sFVNPlad6GAC+JzuQuGuYPB8pXJMp/atFY25vGoS1TIzk4DIhaiCiCqgEsXUVLuE1VaknkcheG4krdwo1+vxZGC/WzEcIV2+LwyYrmVlUPLN+q8h3rxBIC6K3qw6/Tp8SD/K9nnC6nJOm8NWc+3/vT81hS2jCE3FgH8W/3YpWL9TorzAB3WR+FuQv+VZp7j/EZefkkRUsMtZnW9K+tsif/62NGbF7VIUCc5NrY6AmMwbbS7F7Uz9lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+UNfdATDZPvWDXVxPoX6FVuG5FeywFN8XxOe7UymKs=;
 b=tc22c/57thZWnULRsYYoSFXcBVzf6huqCg7LVssPyN7diPdg0QbDu/Ac3vswwTz3yA0AWDkRCU4THXXeVRULMZlUNexMui/PvNDPMImttQ2WmoVnQhwC8MaRrjyiGisU0HvDbCaILjNuMY52lZvz+IvBLxABT7t6haPnYugeffO8xckv5Xe9r/0htu2mdsw7xUDAs2tmRQGnH7OLzcpLWuhqOcfL7JmaNGJWxQV627U9BQm1DWNX1YEsaQe0KT8XMSk0UG+lfRQmm4DSJ0xkWCA8pSnlppOWq2u2xzTjfR0oVNPgrpjDB99pSzRGXrinLyq6cPAuSNyV/NMm0C5T/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA3PR11MB8986.namprd11.prod.outlook.com (2603:10b6:208:577::21)
 by CY8PR11MB6915.namprd11.prod.outlook.com (2603:10b6:930:59::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 15:18:38 +0000
Received: from IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c]) by IA3PR11MB8986.namprd11.prod.outlook.com
 ([fe80::e6f0:6afb:6ef9:ab5c%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 15:18:37 +0000
From: "Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "elver@google.com"
	<elver@google.com>, "bvanassche@acm.org" <bvanassche@acm.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "kees@kernel.org"
	<kees@kernel.org>, "tudor.ambarus@linaro.org" <tudor.ambarus@linaro.org>
Subject: RE: [PATCH] docs: kdoc: parse context_lock_struct() as struct
 declaration
Thread-Topic: [PATCH] docs: kdoc: parse context_lock_struct() as struct
 declaration
Thread-Index: AQHdTUddKqFqBNYIHUWQKSJKPkKverbkHqLg
Date: Mon, 28 Sep 2026 15:18:37 +0000
Message-ID: <IA3PR11MB8986B474B6FEA09972D2E55DE58D2@IA3PR11MB8986.namprd11.prod.outlook.com>
References: <20260925234054.128477-1-emmaonana18@gmail.com>
In-Reply-To: <20260925234054.128477-1-emmaonana18@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA3PR11MB8986:EE_|CY8PR11MB6915:EE_
x-ms-office365-filtering-correlation-id: 14657655-ad25-4dea-8657-08df1d73c54d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|38070700021|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info: QGhB9eSA7hXpPcYvjfun1HigzATl6jg5Ahn7ISJqxFLtCM6olWiAEyKVwpgaSJA/5mSlZFDQR/pZsH/t9Tdmx9bO0/Zgxmp0PKq5pXjlrojZol85igQY6Y7toP/7Mon9Rx+x7CY+guXCG53Uq54r0jB+eVbKeffFtM0VOIquOGI0CXtMGSX28x0+6ISO4x7VmqA7iaZRzIuGACmoQHabHpsgnVVfuMx9P76dNThJLNeKajepPC3ITZ0P00StgRTgzAOtdCzjBgcRUsqnT4hy/sFpLXfQFJYFenl35ABvI37DXvXUDevDISHShBSDUIkWWjn9PAX7CFm/m/F+n+1ZTMonoZDwegfcIvAGlgdtXoZdIzx9RPdIZonx4Aonj0nnfRoyHjZhOaL/xdmHirQyFCVzeRftydrdnLiJsS5G08ILtemdTreIflAJ6Mpo8aKRFwJqCiZWpwEASig90CaxxuddwLUxGCfRRQjeVzWidtjtI+EET9uo5Y0q+5umS1TvPJo60Wsy+RpwQ1iXoqwVtvtz4cl6HryqsnVove2AIKiJLnuASjwwjpw8QD9hVhQZ0zHVHpUkccLSROS3rEK25MsevJgcp3PclfoRrRnRY7f0jlGqCw8xezD6N/dqgKRDpP7BEbdnAIkfOsCUghHAUPUdkXQpsbcYpMKSl4lXqcwLrE/uc3r/3dvZbfJfnIrKQRKYj8nTaQe5mJExL+fSyW/gwz1lp0wQ8xEKHLBGJdY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB8986.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(38070700021)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W+L+6/TjfeqgzGXStcC3mRdP5LLVZFwTYBHwElZ4cuQUkkZoGih1eOYuZYQY?=
 =?us-ascii?Q?sFc/eDXfJMZ/7QYm8UCo8y6V9PAHKL3Dh/11Ot4OggJjNkasY90mJdBq7Nct?=
 =?us-ascii?Q?Q7SgjTUaoMPPIoka6P81REof/NvntpkwMIGwPh+S3K3c5509xGnDoCCJY5JR?=
 =?us-ascii?Q?FGdaZRUVKNIIfjHetsNjDxS34AvN+3q5BsG0MbEUWrqevkwVAnuFW04FCkDh?=
 =?us-ascii?Q?70v7dXLhdgoTiwP2qUFHsnCDPqC89BTcUVYXEbb7xd/gH/bHBe1hyiPxoJzX?=
 =?us-ascii?Q?LHmjxXaAauotFq2xy+bDRdTPuDmfx5FO2E5lh+GwVBIN2Ysokpb/WJDA+dwm?=
 =?us-ascii?Q?CT1IV/iQ4yRE2adoH1kYavLB0F2t3jzX7Wp+gnV9Gh/Gm04v5RfGPZFgrEVN?=
 =?us-ascii?Q?rlDnOKb1t4VLZzvVYXEjUFKEWJNYCBlukW56ZSxMoMqCBFUHgkYGtXype8AQ?=
 =?us-ascii?Q?6lNIbA9591cs6ctXRvXHR99sZu9Jz0XMsONNYs/wLD4vaXvxqTnHs9ARWz5B?=
 =?us-ascii?Q?p8GNSBq3jQ4nTd2/yU6WU6G3ZIRUTNxT5kg00Q9pSJj6hfxkUCOKz3HO9aak?=
 =?us-ascii?Q?ODmr3orleL7cNCVE+s8WFlD2TnYEeMir8bo4UDodFK3OF53AE7k5WAWNs+nf?=
 =?us-ascii?Q?1UE5H+uAHtBFQKLFtknnuHRCdEodVzMV0e44TtKT6a8JwGHjVsKUP5jb7bkz?=
 =?us-ascii?Q?0pR67N5/W09Gt0SYha7V8Z8VTtyQ/F4kyklZSRSVjTHeHke8T2LgSmCu87Fp?=
 =?us-ascii?Q?XWgSS3SWvnfnyI4AJ3rPUDeTVAKFLMYrCSsqSb77/6Zy9Y9U3wGIaUgb1qDf?=
 =?us-ascii?Q?XImmym4nYn+t0rnhs/l/tAxY9JrJKEY3VwIfx8P0sPVbjyjqKo8H2IX8Ptur?=
 =?us-ascii?Q?0J+llVpDpkC3lr9RNGsmLBHK4WzxrP65cEkSNSXgLOs18YmiYAzDrPZr77Tb?=
 =?us-ascii?Q?UEzqU4B4ADtC1zh9acdo6ojKKSwOFnDYXTsh3Qlex8KJdvI/JYSYaeGIqmz0?=
 =?us-ascii?Q?bK89wAHnGDDpfBJdjC54ahA7FrCiOhH74GrLFjaiYQVygXjcUtsf+59zx/nu?=
 =?us-ascii?Q?0oWWMiutQHylU0EfUJkIxrKL/cXPEvWIfgdr4N2m7k9VfrIf28Uf4bvDVIG/?=
 =?us-ascii?Q?+IpqbF/MJ1PF/uGW5JZNSp2g1lFqyRF0rUHXvjT+HE6ytxSYUO4lBOHip6WD?=
 =?us-ascii?Q?fUqSdlIjhky9uN4upHCKfJ19yj5pvprTXfObiglmaVUrPHuHS204ZZ740eGV?=
 =?us-ascii?Q?M2hLbNojGvNlQJnxtQvMkLLb40Ic8dYX/AXpybcU9I6AdlSSRSxHFg/EoqfN?=
 =?us-ascii?Q?GYHs6Z01jpMFzNrwsWGGrRsu94HvySfZEJmQ6PQ7gwBIkJZa2Ih9u0i7E3Xa?=
 =?us-ascii?Q?M/3Ihee/meO6aHm/PmrYXp+jvnTkAtnsPJjCBtcf2YJ6zSJr0+BQtA3Y0mZr?=
 =?us-ascii?Q?qXaOqYfGXQh+K2KpG7VLEnb6Poyo5VJHXtAyEDaj2jIhYPOKz4MO+Kxk8ELB?=
 =?us-ascii?Q?tDCiXFSuVTXRhsS/MQ06W8b9sz7zH3+U3oOWKGcVzFYGVn+F55GSe9td7bJE?=
 =?us-ascii?Q?AnTqon0vKzqNfQYvsYSc/VbTRyYH0CFU8hcfQvh21HSgLgour0wGfMB7FV+T?=
 =?us-ascii?Q?LmLprbxcLi15KW9Go7qLstFSsz4U+23EY7CiTj68nr2LusNu0npioxf7j5Ww?=
 =?us-ascii?Q?tBnM3bOKReJq7H5RaK7TLbFwnvDcA8wycFR8F3SJylb8s80yLxK7X5kOWxCm?=
 =?us-ascii?Q?NN05KCLD3YBiSgDMleKXOTAPUdRInxw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: eVYFKGFlTXwTwMVionoDjQiwElWVCZg91nLGApj3syhMkAxQBvEz6d0PY5ULm2PS+GlmMqcXvBoC/AWlAKrmDJzHjy4Z4B3oxogjfu6cVwLg+O/QcA8GTF9CKoQFIvVooqjCXdwBTusq6OXYIKIBArfzCjNUphqLCHnwDdm2kAZgZnuhtkLandIMUqkozoQYwHsP/543dH1pis2z8UCah7BYKWcacWPTu6A/q1IiuEFIOdgpQlTkt71LQZ8zOGRoW3pvQmOjhC+hKX2sbeV3PTz5cH03eHOcFUeCocnXZl95ibcQzqVfMZk1ZCUg+3MUkeN7QFj5Tayjeo93ahX7GA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB8986.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14657655-ad25-4dea-8657-08df1d73c54d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 15:18:37.8111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J1oIuPFXoj4ApfiWywakBloCc/UMUeyGsV8/TTPgTIUk3EPonRgKaDLuBl3ZFoQ0HO3PeV6wciirpy99f3LAy6+0ZUKFyBpk8IJDJ4dE3KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6915
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> Sent: Saturday, September 26, 2026 1:41 AM
> To: peterz@infradead.org; elver@google.com; bvanassche@acm.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: corbet@lwn.net; skhan@linuxfoundation.org; rdunlap@infradead.org;
> mchehab@kernel.org; Loktionov, Aleksandr
> <aleksandr.loktionov@intel.com>; kees@kernel.org;
> emmaonana18@gmail.com; tudor.ambarus@linaro.org
> Subject: [PATCH] docs: kdoc: parse context_lock_struct() as struct
> declaration
>=20
> kernel-doc fails to parse struct declarations wrapped in
> context_lock_struct(), e.g. struct debugfs_cancellation:
>=20
>   include/linux/debugfs.h:245 ... error: Cannot parse struct or union!
>=20
> Add a struct transform that expands context_lock_struct() to a plain
> struct declaration, and apply the struct transforms to the whole
> declaration before split_struct_proto(), matching what dump_var() and
> dump_function() already do for their prototypes. The member-only
> transform in dump_struct() is then redundant.
>=20
> Add a regression test for the debugfs_cancellation declaration.
>=20
> Fixes: 6e530e2e3119 ("debugfs: Make debugfs_cancellation a context
> lock struct")
> Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py  | 11 +++++++----
> tools/lib/python/kdoc/xforms_lists.py |  1 +
>  tools/unittests/test_kdoc_parser.py   | 26 ++++++++++++++++++++++++++
>  3 files changed, 34 insertions(+), 4 deletions(-)
>=20
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py
> b/tools/lib/python/kdoc/kdoc_parser.py
> index d9ad1ddc87dd..80d4245acd17 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -831,6 +831,13 @@ class KernelDoc:
>          #
>          source =3D source
>          proto =3D trim_private_members(proto)
> +
> +        #
> +        # Expand macro-based declarations, like
> context_lock_struct(),
> +        # into a plain struct/union declaration before splitting it,
> +        # as dump_var() and dump_function() already do.
> +        #
> +        proto =3D self.xforms.apply("struct", proto)
>          struct_parts =3D self.split_struct_proto(proto)
>          if not struct_parts:
>              self.emit_msg(ln, f"{proto} error: Cannot parse struct or
> union!") @@ -841,10 +848,6 @@ class KernelDoc:
>              self.emit_msg(ln, f"expecting prototype for {decl_type}
> {self.entry.identifier}. "
>                            f"Prototype was for {decl_type}
> {declaration_name} instead")
>              return
> -        #
> -        # Go through the list of members applying all of our
> transformations.
> -        #
> -        members =3D self.xforms.apply("struct", members)
>=20
>          #
>          # Deal with embedded struct and union members, and drop enums
> entirely.
> diff --git a/tools/lib/python/kdoc/xforms_lists.py
> b/tools/lib/python/kdoc/xforms_lists.py
> index e3dda2fe8a53..9f2c750a811b 100644
> --- a/tools/lib/python/kdoc/xforms_lists.py
> +++ b/tools/lib/python/kdoc/xforms_lists.py
> @@ -62,6 +62,7 @@ class CTransforms:
>          (CMatch("struct_group_attr"), r"struct { \3+ };"),
>          (CMatch("struct_group_tagged"), r"struct { \3+ };"),
>          (CMatch("__struct_group"), r"struct { \4+ };"),
> +        (CMatch("context_lock_struct"), r"struct \1"),
>      ]
>=20
>      #: Transforms for function prototypes.
> diff --git a/tools/unittests/test_kdoc_parser.py
> b/tools/unittests/test_kdoc_parser.py
> index c4a76ed13dbc..4baa78ca02b3 100755
> --- a/tools/unittests/test_kdoc_parser.py
> +++ b/tools/unittests/test_kdoc_parser.py
> @@ -418,6 +418,32 @@ class TestSelfValidate(GenerateKdocItem):
>          """
>          self.run_test(self.SOURCE, [self.DEFAULT.copy()],
> self.EXPORTS)
>=20
> +class TestContextLockStruct(GenerateKdocItem):
> +    def test_context_lock_struct_declaration(self):
> +        source =3D """
> +            /**
> +             * struct debugfs_cancellation - cancellation data
> +             * @list: internal, for keeping track
> +             * @cancel: callback to call
> +             * @cancel_data: extra data for the callback to call
> +             */
> +            context_lock_struct(debugfs_cancellation) {
> +                struct list_head list;
> +                void (*cancel)(struct dentry *, void *);
> +                void *cancel_data;
> +            };
> +        """
> +
> +        kernel_doc =3D KernelDoc(self.config, "test.c", self.xforms)
> +        patcher =3D patch('builtins.open', new_callable=3Dmock_open,
> +                        read_data=3Ddedent(source))
> +        with patcher:
> +            _, entries =3D kernel_doc.parse_kdoc()
> +
> +        self.assertEqual(len(entries), 1)
> +        self.assertEqual(entries[0].name, "debugfs_cancellation")
> +        self.assertEqual(entries[0].warnings, [])
> +
>  #
>  # Class and logic to create dynamic tests from YAML  #
> --
> 2.43.0

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>

