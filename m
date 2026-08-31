Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5B53F9F45;
	Mon, 31 Aug 2026 12:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179404; cv=fail; b=MCJ7bg4VVX72zlME7X+NpV+ICpXqr49q8UTy+50Ok5x1GTEM+LjyZhq+fa+kAUaOt66elvuTOJQfeAa3AAzFYDRHbWZtzVCrJxK1Bc6ZqcPxhc2XtzZ2q0XxT7tNdMuo6Af5S+3tNZnq5A2wUONGTR29kDHbcXuFVm5ziZek5D4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179404; c=relaxed/simple;
	bh=+k54y53SN+IxNJEdxvYqcmtjvqo/kCFrGKNxD8tvG48=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WUqdFZOTbBo7jDxlnvb6WDxA6E3FAczBkc5ymKefE6LcWJzyTYvkFpHUdT5n8i4Nqfu4X/5DNVDLqPthr0XmT5JQzBLYL1Gs6xJzDH1JiEXR+q1yyrxhAnNStr9AsSkM6xA2kbI41Gft5Gbll2XDg+JIiExsg7+QQsZchXhqnbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MiISC8Qg; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MiISC8Qg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788179402; x=1819715402;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+k54y53SN+IxNJEdxvYqcmtjvqo/kCFrGKNxD8tvG48=;
  b=MiISC8QgEzb2qz9Dr2vRDCiBYHj5zDB/FCeAGxhUVd1PGWmSW6amVvcn
   mLhsdJIsfTanXaS/O1zjXWWs/GCYDKUqfScifZGQm8LD9PuKsodI3tufC
   RybVqZGfsiGM8B42o5GB+IbSyYOwRQsnFfUj1V2QvJ0L4j+zyJeXimptV
   Qbnmfq7NBF6bB6dVa9Mk5JtImgnojVOF+xj/KYAJ9lht77JWJGSIMoECT
   qHgqY9y1670UpQMbkyop0V9hKUn9kvuDXua0KP6/Zgl1ThwiBAuen6gpk
   UqSBKK8/IV5Rdg8TlR7WHHQWRpEHzC2D7rHKr3tSfa5MsdEksBbUPeYcA
   w==;
X-CSE-ConnectionGUID: mVkFEu3LSIaC1m0FoClWDg==
X-CSE-MsgGUID: rJn1jcewTv+4PrmWeA0M9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="114123275"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="114123275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:30:01 -0700
X-CSE-ConnectionGUID: cKSIB3mZSv6WSqlgwAyPeQ==
X-CSE-MsgGUID: DPd62PQFQN6YawCFoO6Q/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; 
   d="scan'208";a="293612766"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 05:30:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 05:30:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 05:30:00 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.28)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 05:29:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNld2StFxcIv6ljCyzKK/sWJBaODBXA8rWnqOnhZ9wyLFEAS0Tujlj7Uj/K0xTwrtQ0iW7/3fJ52gB+pSMNZbvFauuWbaYiogua045D3v+4Q63zz+LbDwppPt4T96EAWRR+06ahlYG3z9ZZDXXi+xPR5TTJMOlIgwy6i5V3yXlsPWf3szvOHBo2QTj60SldEuKDosrTZmE0ojTCHgXbaPuO96hHQ9IsBt82y8HbRPt35YKr35nE7t1xITTno6zA5YlKoQMy393N1edV4bZ/5Hii4nkgRdYZ3OiWJJlc8o3/s1fkiWStUbcrDZbuQQGuiKm52mr3T4UF1pBwc3I7vKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPamzIVgJpntTIPkkihGnekvFrcnREF1BzAZ9srD4qc=;
 b=I3Lc1oqUhP5i3QpLmDAZRKZz2GrWzVL/aFm6TEQjQyDhALvn+JAlXC+J0PDfyd3xbN7RfNw5wrFbAgT6Nte2TaHHPJVGHqp6sSsI5Fe9YZ/l1f+eFW1iOmBzovQECm7HBT12IxmnQwDrmO/rUTE9fso+4PbWYXVyVGpKGr91skAhE42XGnG3/3aHLs4wxpCaOTU5CE83UI+wL8vU1RLM8ZRcMcZiELAKUvH5mU3NgWnmrgATSeHjd8sBqrv6aHfYrWoxueW5tf5PiZ5vxkFhxkgYzNnaSqkU5/nwO1OKjqGtV35lCUZ4wWGFczS0/OYGSPxct4yvADb7r7bhEZzr4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 12:29:56 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0360.006; Mon, 31 Aug 2026
 12:29:56 +0000
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
Thread-Index: AQHdNyAG62iOkzxB/EyV5CUxy4uGqra4EyqQ
Date: Mon, 31 Aug 2026 12:29:56 +0000
Message-ID: <SJ2PR11MB84247CAA0DDE5DEBC95521B5FFA92@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
 <BY5PR02MB6370065815A8A47F536FE4CFA0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB6370065815A8A47F536FE4CFA0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|BL3PR11MB6458:EE_
x-ms-office365-filtering-correlation-id: 2a58306a-e812-4862-0e8e-08df075b90c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|1800799024|366016|376014|22082099003|18002099003|56012099006|3023799007|38070700021|4143699003|11063799006|10067099003;
x-microsoft-antispam-message-info: K/+RXMz7uxngqrXGKnXhCw1WdjGalLTa3fvLbi42TFeCKTHD68nWj/9TzbgGuzAjYYnVMoGZpoDqbZpnp4XnUF8pKyCYzj3y70DYk88TbYvmw9i7VA4YZb1zEQAwokvhYOAhje+vCXIlghvBvI5J3J3u2jqEtBqpsW/OqiQnKNIpMVQaVCZ6tNRH+YWjW4AO0eIg3HNqjYzoRM/JTsLtNFh4fVLImJQv2nSoW8eLu2xm9+0MmiCtJXVyGz1QrzI4x83wwO8+IW0UjhLBVI8ccg4QLrqW++DMvNtwQLU6PS1Xpmy0NwD/4fRgpSyQS5uYT5O6/KdLk3mRT5ZeAn/QfGyiAX6GdrOLDYim/+M5gXXAsC+zKf0nWFZL6wrGeeMD1vC6Ir3OmY1IIj1jovrcwyS0hrpzufjDfnCPfxgtsTZqjC9LEtdChFg8cWvvTYVHmgnzTAyD/pf5e5bY5dDUSuvV3FI+5dRB21KiHftmntyUtRoRujhYgn7/WCuOgADi6Fqd0pcGZKBVNaxT+fxWDzAHfWD7F6bHAEahI3Bdyf7AmteEjIgX6lRbl6o3FYkelqnIM15iKhtbCbiMfCcOA3pftiGUiedunuTfZaW1Ymefb7BREW91dCz2DY0h1iY2RIIhct4xnAkQ5APhjCUdkB4OAVxalSwu7GTqFujWzWzIpNrya5eVS/6A+gP9Tl4xpthbbAWpkMUgE2XgucDxnF7V7XOvJIgP8RRsMEFOJpw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(38070700021)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mXc1jZgxtu6E8rlXSraqmExajfrKgQ4nEIj56WRmhH7w1Mm8Z0pLsxusKv5i?=
 =?us-ascii?Q?iDNFLpbprrB35PHxeK0casS9XVIhZuUTWfowzIY98/ziwOa1g5QF7AyKRG1W?=
 =?us-ascii?Q?SENn974v0PG5B8MjZ2ybxoqCp7HVH9xIWUFZMxrBuKMGw6rVGz+XsgMEM3pQ?=
 =?us-ascii?Q?THfNNhPmByIfQr+VtAgBvExThg6/B8DXvTAYg8Z4W6b6Y0Z+2RXCX46CWmic?=
 =?us-ascii?Q?acuGmRtHD61DT9zH9X42Th88zZgJLEQYAHNP0DlSNY/8HsKo258SxwlWO77I?=
 =?us-ascii?Q?ijxfa+0fiV+HRm61e4+nw6NBeV/c4PMM5sv0zTzgiqc8bV91c0vQi0UCJV/3?=
 =?us-ascii?Q?YHsPZLGwMQA5t8BiGdsW3efAZArXX0uQYd0q7phhJ2Nwwe4qxPnO1MaLOt13?=
 =?us-ascii?Q?joNAybrW4L4i9sb2ASfLC65yvTQpy89lAeOsLQmTucSOTe3cSQ2M0qXmpMhm?=
 =?us-ascii?Q?tw9i+eVzGMh21pUg7Arm7YhmKDmZhy6NIU6T7amjQYLvoZC/6evz06HM/Chg?=
 =?us-ascii?Q?kEO/qtmglHbEB/5CpBgvYUX9UUvE08GYDj8wAdqFkfyYKkY3ew6g3//W/z+R?=
 =?us-ascii?Q?LNwIYTw80Q1a+Exv7q6+yehHrVHgD6gKvBX9/zVjteUZsa/gb0xj7QSZLnne?=
 =?us-ascii?Q?07znFtuGCxHHf9UzLicMwij61aJ4dZHe4wayRtlvi5ikYj9Rzsq58fbxngNu?=
 =?us-ascii?Q?eNQbCTNsSXf6YQuxyf2w44d3N+6ld8m2LNzmLkerhAksvdMZev+YxYmVnE6T?=
 =?us-ascii?Q?EKg7IIZUUizvry+gWSUwmU5ISBjMtp9sJPgUTJ1zkeQKPe/gyRI/jky7Xtr+?=
 =?us-ascii?Q?TSvxgEbMjVFohIqt4Dsai+4ZjR9qS5dCZTQztGiHwjHf7FkTrzM3oOM/Ttb8?=
 =?us-ascii?Q?7Guq2FCCubEpNBEdA4QCwzsBeV6yHT2IjcxWQD6ABt25PvA8psxnDqW1oJ5a?=
 =?us-ascii?Q?nClIXpXkUdEqsAXKrxluZ0xaOCb0KoJ+kjh1aePfwZNBMOFLliPGsRmjwBqH?=
 =?us-ascii?Q?+YUghNWEO4GeG4wRXVI+m9exq9EQWq06dTEzH4LmznA2w5n0idc7pPdtiZCP?=
 =?us-ascii?Q?GuJvRdMos44YwXQjLEdcX9wM2LAG/CA4/vzdaXbjUQjbpBOKv+egY4BZDKQI?=
 =?us-ascii?Q?KbRfXxy3NT7N0kYU5fuZGgYQrRo5og1HUv0wmzys85C2m8oFPHHeSQkEvjBW?=
 =?us-ascii?Q?0J0LpNj4sAiACXcx2L55m4O6nHXQfJBPIddZh5/qF+i1i1iBitPv4CdVijCk?=
 =?us-ascii?Q?0VjQdZh3YzLAhYhAdNscLD5vygOQ9O5YnS3OUWax7WVcT0oce9IoBxyX75iv?=
 =?us-ascii?Q?2Ox3VdAEmpFUTKQUa99/DYQtADpZ01K4bTED22xVtDpTA2XAA6O+Q/anm2jG?=
 =?us-ascii?Q?0f57JofYpXSMaDd/O52vtg/aQTgPXfibcsoiGuWv5GaPpywnPZtufjpPj0+P?=
 =?us-ascii?Q?3juKWgdr2YIWo1yJpRAY+gxA2LEm5nIoyI2MjeMSlkamd1G6857k4kJGMfgi?=
 =?us-ascii?Q?uHY6E8khlk9cKRy5GBPg85Rr54ASg06hfds4yagpacS6Nye1oNdyEtjshEW4?=
 =?us-ascii?Q?8KC+9vUX3dG+oepd7Us4FzutKZV2LwmoZbwRJsFiqGT+zhRkR+76NfOHh05b?=
 =?us-ascii?Q?VZc9l7q7FPxgpbUWE9n6b7WbMo7FxMHNRNRKbQ5muA+F5/fKVL43RfOaYFFF?=
 =?us-ascii?Q?yMs/EcLiOUsMnTvw0dfJNOjE7knU9KoW6KpqXqb99l/C8ISg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dNwlnCx/cl1WjqwzAFrrWRVznxg3qj4b7ivepVVL2TQgpjTHKXzLgKSLECHnghGh1ACa/KjuJnIu38bb/fKsThqNj0t6qF3gt0Nk0mg7R92zl62MHQfT7Agt6y213OjpfSubrdqCNrUftSYzzrBYYB8T0VuAdsOdx6Yx08Av8OGIkbehTZXZ8KhT7FKE4ZkjPN5xezwpXmUDhCBZ8L4Ig4hxK9auFaMGj869dLrfCamPhjeZZy/otLGlPF605DLL8p1QX+diCiKRIBlHYHarr5SQpCRd+LmFIfnbZBE15w1kUkUFPe/KLB429gvBqeFX2GV4/V7xf186otMPgEpT/g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a58306a-e812-4862-0e8e-08df075b90c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 12:29:56.1752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TaGWVVr7YF6fPFSLRfDvc+2NGyGp/IzIz0L0CjEfG2tMCof+Tbb3dHcsyp02+9AXaRbySgdTlDByGAyUMEhFEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Amaan Lalani <zlzzm2014@outlook.com>
> Sent: Saturday, August 29, 2026 3:04 AM
> To: Mark Brown <broonie@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>; Jaroslav Kysela
> <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Peter Ujfalusi
> <peter.ujfalusi@linux.intel.com>; Bard Liao <yung-
> chuan.liao@linux.intel.com>; Pierre-Louis Bossart <pierre-
> louis.bossart@linux.dev>; linux-sound@vger.kernel.org; sound-open-
> firmware@alsa-project.org; linux-kernel@vger.kernel.org; Amaan Lalani
> <zlzzm2014@outlook.com>
> Subject: [PATCH 1/2] ASoC: SOF: Intel: reuse name prefix for duplicate
> SoundWire devices
>=20
> Some firmware describes a single physical SoundWire peripheral with
> multiple _ADR entries that differ only in SDCA class ID.
>=20
> These entries currently consume separate amplifier indices when the
> SoundWire machine description is built. This can cause the peripheral
> that actually enumerates to receive a different name prefix from the
> one expected by UCM.
>=20
> Detect entries which differ only in class ID and reuse the name prefix
> assigned to the first entry. Do not increment the amplifier index for
> the duplicate entry.
>=20
> Fixes: 5226d19d4cae ("ASoC: SOF: Intel: use sof_sdw as default SDW machin=
e
> driver")
>=20
> Assisted-by: LLM
> Signed-off-by: Amaan Lalani <zlzzm2014@outlook.com>
> ---
>  sound/soc/sof/intel/hda.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
> index 4dbba9186b29..c785e27089ea 100644
> --- a/sound/soc/sof/intel/hda.c
> +++ b/sound/soc/sof/intel/hda.c
> @@ -1245,6 +1245,20 @@ static struct snd_soc_acpi_adr_device
> *find_acpi_adr_device(struct device *dev,
>  			((u64)(sdw_device->id.sdw_version & 0xF) << 44) |
>  			((u64)(sdw_device->bus->link_id & 0xF) << 48);
>=20
> +	/*
> +	 * Firmware may describe the same physical peripheral with multiple
> +	 * _ADR entries that differ only in SDCA class ID. Reuse the prefix
> +	 * so duplicate entries do not consume another amplifier index.
> +	 */
> +
> +	for (j =3D 0; j < index; j++) {
> +		if ((adr_dev[j].adr & ~SDW_CLASS_ID_MASK) =3D=3D
> +		    (adr_dev[index].adr & ~SDW_CLASS_ID_MASK)) {
> +			adr_dev[index].name_prefix =3D
> adr_dev[j].name_prefix;
> +			goto done_name_prefix;
> +		}
> +	}
> +

It seems be a valid assumption that 2 peripherals with the same vendor
and part ID but different class ID will never coexist in the same device.
However, the implementation is not correct. We should skip the duplicated
peripheral completely not just reuse the name_prefix.

>  	if (!codec_info_list[i].is_amp) {
>  		/* For non-amp codecs, get name_prefix from
> codec_info_list[] */
>  		adr_dev[index].name_prefix =3D devm_kasprintf(dev,
> GFP_KERNEL, "%s", name_prefix);
> --
> 2.55.0
>=20

