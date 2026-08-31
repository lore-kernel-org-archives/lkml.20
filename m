Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE402DB789;
	Mon, 31 Aug 2026 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183182; cv=fail; b=sAyNfXJT4ajgkg06Q9x6j8JdjcEAkXEmkcQ8t/YSZhlrZ9ovXZNkfBqbMwwFzWyscgIFjlHAEaFcziaszYGAXhUGi/R5dH8u4FSzVNOMJkCD+q62bTFj6RTXn5w5lDSbglbp86NEK1J6/8xXmx56awu/vdyxiKQLlddXEtp6Pt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183182; c=relaxed/simple;
	bh=4OD4AHi1/HjSRigXfFxX065LqacC5QC07lC67OsHSM8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oe0ZSUy32e+t2q0MQHBIPJH3qhNq+1TjrB4GR61n+9k/ZN5kSeO0jmAkNPiNSiMnUtF6Ng8SqRqDOZ7duDz3aAqUIxL4SZngqpzxL+mhYs6v/jYuSCL+aZlWH7CCB6ize+7rJ0BBjqUmSwJ4w2RrqjSKabOSEjcwPvy4EHsy4d8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eo0+lC6k; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eo0+lC6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788183180; x=1819719180;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4OD4AHi1/HjSRigXfFxX065LqacC5QC07lC67OsHSM8=;
  b=eo0+lC6kfQpgZmM3jLKaAnPU6I9MflRHBAsh9g4dwXt+i0r2xMqLhNm8
   Uf7vBOuEnCYsGpRCDA1hMoDNZRY40OezfeJXQFLisg5e8L6ByEW8NN1xn
   xmLJFx++ZoTFkBLWCxrCxLUGqc075/5L2RUxHDMQc0D/Nepp4roR3mFDr
   NHIt6wxvFoqoZtfhqdSMirHNVZ6hOmAuCk7fgrbw/ni+lxHs1y0hCs6AK
   PA3zqHOiXtUEci0w9gJ9CqP59DPXeMEAmL4PQ0IUYxHieywhYEWs/B2gP
   EACaiNhkZnZnBXgVWZJ1oPe+qrq7XJOewZP/oMh89JofNe5IlWeDvLJGv
   g==;
X-CSE-ConnectionGUID: TK6iwWq9SmKza292VLQIEQ==
X-CSE-MsgGUID: SqFwu9aBQE+U7nIrs4LINw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="100102990"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="100102990"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:33:00 -0700
X-CSE-ConnectionGUID: XWg16bUSSiOWpFOXBnjmoA==
X-CSE-MsgGUID: jZ9bjUjIQBSUTE0mnNWD0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="265082990"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 06:32:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 06:32:59 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 06:32:58 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 06:32:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FaFADtecWWQS1wqdBegQzsfG1v56u+1zalRbuvnCCsxMLnCWo35Xo6j7NbnC+CdiYYBOdl/RWdswHw9304OEHSd7vcXISlx57RA5urCM8paVsHrqZ3xWW/44aHaOzUdBsPkQSc7e8J2Tsc3SUFJPBjkBgUFsYVajj868gpHKvmSj0veLj3Tp3xo2x6s8+qYuuEHBULQdQYC2K6UtyVpy3lvpZhkvQ0ErVgyJdSmAEuq6vbSodaxMXL9TvbK1GsIlkTLJkJd/6pSG6HIrUoh6sESyiGh3lLDT1mcrNuvPUVRgT64nPC3dx/0iyk780TTQhEwWPAdhUbxDyrV9S2t9OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4OD4AHi1/HjSRigXfFxX065LqacC5QC07lC67OsHSM8=;
 b=bLb7TfCzeAGFt/5BqkfOl+CbR2rmc7sbrKJMY/xBKwVQ2jm9uBs0EJKoOsvP0n5C2Qtp95jZkDoRAw8fZ8C7Bqrhm8oulDARArMH3UIA4B3x95EbTs4MWB7YjoIN/WcTKdFXT7Hddpw2s8ZId2DpUJWi6O4Yk39CQTW9EMNTYMwrw21jXx2h0jezPjETq0/1AKQwMvTO6pOVxGvJhw//lBtFOnLXn3lEAAaad3j3qmwamU3iwa+8q0AwtIESjXDdyyGmaQ+FvInAx1zfRRFsIERf6FtQig/RwYG0L0S8PwNOh7GNDjE2APYyQFbQOmuPdZrfLvpkVdAdv4iIfSdRWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by PH7PR11MB8123.namprd11.prod.outlook.com (2603:10b6:510:236::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 13:32:56 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0360.006; Mon, 31 Aug 2026
 13:32:56 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Amaan Lalani <zlzzm2014@outlook.com>, Mark Brown <broonie@kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "sound-open-firmware@alsa-project.org"
	<sound-open-firmware@alsa-project.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] ASoC: SOF: Intel: reuse name prefix for duplicate
 SoundWire devices
Thread-Topic: [PATCH 1/2] ASoC: SOF: Intel: reuse name prefix for duplicate
 SoundWire devices
Thread-Index: AQHdNyAG62iOkzxB/EyV5CUxy4uGqra4EyqQgAAX2ZA=
Date: Mon, 31 Aug 2026 13:32:55 +0000
Message-ID: <SJ2PR11MB84247925F9779CD9B402A898FFA92@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
 <BY5PR02MB6370065815A8A47F536FE4CFA0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
 <SJ2PR11MB84247CAA0DDE5DEBC95521B5FFA92@SJ2PR11MB8424.namprd11.prod.outlook.com>
In-Reply-To: <SJ2PR11MB84247CAA0DDE5DEBC95521B5FFA92@SJ2PR11MB8424.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|PH7PR11MB8123:EE_
x-ms-office365-filtering-correlation-id: 2565df77-44da-4071-b6cf-08df07645daf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|23010399003|376014|18002099003|22082099003|3023799007|11063799006|38070700021|56012099006|10067099003|4143699003;
x-microsoft-antispam-message-info: fKZaRHlCWT4EhPqGsGzxD4sZr9Ya02LDiOw+7lxnZvudT1f9/xVjnE9pnzxKNYf0gK8p7olRU/2Ybn3nWusWPqCKH2y6r6xv+Xc3EZGAgu6s3XzSSTkTfg0248PodmBd4W/O5lnjXu3om4Z6ebv+v2HqlWMPknwklE53nj8vYqH5IFepnZI/vG1w/YChn7Fi3LQ4oHeovr4JgYphvk34l02MyQJz3efkbtuQMErHU7I+GYmgmxm1m3FxTF4Q9/twivLI3W68Wv7idEX6e/p5RTJvthwkXsnB36ng6p1tGPakVTgVK5NJsjw4LzGwOVvXClx8WtlQjlwryOo/39ivp1tVl84Xby4ljbJhlG/E1vf3d6WIA/1xMg81ueV+zg5boHMKXTEyu+/UcP/foZJt+/ErEOqDlmRZNUoeW3mavUPFG2i974/r8YyNKM1f5hPkK2mW9anx0LInuF2inVY6RJxUdjN3PgDskXdj8AY7AAKeHFflLXwpgZw3DRa9GYKIxhoBOLM30yM9tXKyWIxpMsDNZEmOvWunUr/0+0lmCWztsXd9AZrpqAf67vlYfLBC2/MJzXknjdt3Ct/JVQILj81HYi2S4HNZbOM/yWQoC8Fxt3EVbkUniYIuM/nZYClcU0xBSYtEdWJWB0DnoV38xgtnC+gkJBLo5ZfYSGxJz+8XmuKVbpPVhbAoKwkEh0XFchnqWKbtV4rNhq8hChUHEW6CPG3x/7Cx3jroV8V/LI4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(3023799007)(11063799006)(38070700021)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VNNjpFGRQhOZd3uE/NJKryduLJRmTq7Ap5wiO4Wui/dEcp/ddwEoX2OB285G?=
 =?us-ascii?Q?vu5eaYPf22XUhvCRExRjGuMwlR8amdoDykdSaxZA4fNE20C+ZammFZJRkxrV?=
 =?us-ascii?Q?LtUC7pIbjuPWE1T+uxjirV/tfXJOqnzp/F97ubBqhVQdFwzW3eGcxxQsC37l?=
 =?us-ascii?Q?3IJAhq4VIxytjvGMm1l1k41UkPDWqkvAAnUFUsJDaqmq7Ioq74gMU/WtTMJF?=
 =?us-ascii?Q?6SOtNMNxmQRRNXn65v0P2Q0Rw8DkUK7QHIDAIG9+9ZLLIkLD6AS6zwQPd3qR?=
 =?us-ascii?Q?05gMDMazglOg/7vBg9PCtoD1UFETtXBrZ/LOsHJE9tqf6m4iQCVLHZ4XqvoH?=
 =?us-ascii?Q?iZ9eKjhldiHlSg5dqWk4VZNb+CzvAw2kUAGWK/fgDFfhwj91nPMV4RG9q4iQ?=
 =?us-ascii?Q?J2OiKMwQwY4O3BwenR0aybr6vP031VK20vLCb/SWFpAGCIUdeFfjNIgfYZ/l?=
 =?us-ascii?Q?MNCUfqyt9U1CzrNF8NwPCyxQvz00Dea7rpYJkyTTX1XxERwvZE2q646dErMr?=
 =?us-ascii?Q?mCZTbZRaegw9jUr+lKOaVARNHgqjFY3vBxSZraLxyM4fWAOYP+Tz54Jn0HqM?=
 =?us-ascii?Q?5GQQSrpYMyXDowYBgHR7EyPfeodu+g1TFsDtoV6Uz9hiXUFtjfJHChKmK9DB?=
 =?us-ascii?Q?zKFNSEeGyyvEwXKu4I+9h5IqQoTmMY9S0Dx7aGX+olCuqo/6NVnxzv8n1hqu?=
 =?us-ascii?Q?SzFoj6ma33n0Ko5uiDvVKpcQ2D1wJUDOT1nDITLpCTIbq/IU76tol7gqn+5t?=
 =?us-ascii?Q?O1mRfEaHf1LpqByRWbAbnn7/jVxEQrpyuWF1Q/vN+yRJeIwC/HvyrfjgNzL+?=
 =?us-ascii?Q?tgsj35jQdn4WOk2iLZJQdOsnlpkx5OmuKTK8Y8hz4+40vDQPQuTOpLyXX+vY?=
 =?us-ascii?Q?NE7ODv3rPjmj2RaO+16pFzBVU9Lf789c9aTbcolh0j5dBXNruHFUzOelO3w6?=
 =?us-ascii?Q?L3OuLnjK4fxuySKb8Z5ejIRLGdA4tbckaQYG6Q2tBdzHytsSRwNu6WNByRKD?=
 =?us-ascii?Q?rjhidG/L8RGfk8UVEG/+kr4ebIVyX7paD832agRQqfex7lK3i+aOEOTtyreI?=
 =?us-ascii?Q?fqdJ90j0dvTzEHu14bUEzDwDgIK5G4bCzOdmp4kxnK5OlwkMv+46EQdneEIp?=
 =?us-ascii?Q?pe44Hsfq4d/s3I0orNnwsifA1ISXAHUWoxJjD0rN5ExF8j1noRLTzmt992yX?=
 =?us-ascii?Q?5b5iqrSp9gTccC4UV939IPxxzwhQoN7ckahXIj5i91xBv81gFX0sd5FUZRB1?=
 =?us-ascii?Q?JUiJVCtjzivTd6EUYUE9GiiuFDdDJgQb0xl3o3HJxWgnh50a6Dnu6UFUvkR2?=
 =?us-ascii?Q?HUDSR7ftSnxHuie8gv0uipWEJe1sJ0IfH9FiWcB7LlWycWBd2Tns4sO/BBBz?=
 =?us-ascii?Q?4PnHbNyfAcY1Mh+O0lT+vsdZFt4IiC6FzJwDYvB0QyisoND2X62P4cufegYY?=
 =?us-ascii?Q?8bJpfJnEOKPnqtGCzVCMsf/4kU/L0LtdmTM3GonnPKar3TktwslKijqiClkQ?=
 =?us-ascii?Q?vA7WIOfN8PGbfMJClqTnhh4xVIFMnn2bJDqPzHyw4t9vgTinc+kebibLKjcG?=
 =?us-ascii?Q?3JVWAklCj3C1BSnYTwFR8kaMXxnY6VIFQzxSDEZ98kjsWjxy1jd1cUDtjyxG?=
 =?us-ascii?Q?+nP02g3qmThkbHRasuE3Py2GBAk5IPFuuWMXt4Jz/IAfEDvujHCf9PoZBt8b?=
 =?us-ascii?Q?VaSznDU5CzcleBdjdJe4xIj5EKk2Q7x+DMASYsrZhpffgJ7g?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dZSXqHFXDyR6+/7MzJyP+S+29ByZyLFzK9A+dbbj0xRsUGs9m1UBwrhxbPhZgc/cMQEh7Qp+7tYWqyA9fTCZXNvKiH9JhxPioTTILiybPnf8k64NQJGXT0v37JYYRLwe3e3hCnqksUlhXMroRIWTGxMd9IgG9Ajg6jNGOtgsnn0o/5y/7o6tDeguOWm/uo36XEBPXSgPji5hlMN8f5F+a6QwsKXxx7tT7HkpdE7L8qHOxywzpt7/RuX9qxYh4IsiZteuQn+mx5l7hiQQANPVppcX9olm3YxpeYwbVm1uzFcSZus0aJbrD2H/wIpD2E4GjAfbPVo7Fb/MCdoqUzGZcw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2565df77-44da-4071-b6cf-08df07645daf
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 13:32:55.9679
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UqjFEBjRtFRLPZjMQNrETOJFk3/VXUyQhJMrb1Sm3t6sYpyQ/n8mibha4itQqPjzyS7TzwPEqzR0ZySFkN7JyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8123
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Liao, Bard
> Sent: Monday, August 31, 2026 8:30 PM
> To: Amaan Lalani <zlzzm2014@outlook.com>; Mark Brown
> <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela
> <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Peter Ujfalusi
> <peter.ujfalusi@linux.intel.com>; Bard Liao <yung-
> chuan.liao@linux.intel.com>; Pierre-Louis Bossart <pierre-
> louis.bossart@linux.dev>; linux-sound@vger.kernel.org; sound-open-
> firmware@alsa-project.org; linux-kernel@vger.kernel.org
> Subject: RE: [PATCH 1/2] ASoC: SOF: Intel: reuse name prefix for duplicat=
e
> SoundWire devices
>=20
>=20
>=20
> > -----Original Message-----
> > From: Amaan Lalani <zlzzm2014@outlook.com>
> > Sent: Saturday, August 29, 2026 3:04 AM
> > To: Mark Brown <broonie@kernel.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela
> > <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Peter Ujfalusi
> > <peter.ujfalusi@linux.intel.com>; Bard Liao <yung-
> > chuan.liao@linux.intel.com>; Pierre-Louis Bossart <pierre-
> > louis.bossart@linux.dev>; linux-sound@vger.kernel.org; sound-open-
> > firmware@alsa-project.org; linux-kernel@vger.kernel.org; Amaan Lalani
> > <zlzzm2014@outlook.com>
> > Subject: [PATCH 1/2] ASoC: SOF: Intel: reuse name prefix for duplicate
> > SoundWire devices
> >
> > Some firmware describes a single physical SoundWire peripheral with
> > multiple _ADR entries that differ only in SDCA class ID.
> >
> > These entries currently consume separate amplifier indices when the
> > SoundWire machine description is built. This can cause the peripheral
> > that actually enumerates to receive a different name prefix from the
> > one expected by UCM.
> >
> > Detect entries which differ only in class ID and reuse the name prefix
> > assigned to the first entry. Do not increment the amplifier index for
> > the duplicate entry.
> >
> > Fixes: 5226d19d4cae ("ASoC: SOF: Intel: use sof_sdw as default SDW
> machine
> > driver")
> >
> > Assisted-by: LLM
> > Signed-off-by: Amaan Lalani <zlzzm2014@outlook.com>
> > ---
>=20
> It seems be a valid assumption that 2 peripherals with the same vendor
> and part ID but different class ID will never coexist in the same device.
> However, the implementation is not correct. We should skip the duplicated
> peripheral completely not just reuse the name_prefix.
>=20

The problem is that we don't know which one is the real one. And which
one should be skipped. We may need to enumerate the peripheral before
selecting the machine driver. I need to think more about it.
