Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756362E62A9;
	Mon, 31 Aug 2026 00:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788137762; cv=fail; b=XZ+ItU2hV+FLzK1HdI58YVA2/mjzOmNdpGrzYV5WOUMt+9caOnHvie3vUCLImI88a2O8zD3+SuwP0vPBdnirPa3RcuWzsa47QRrQRk9FVO7+NHRhdEOwIJ6riLswmM/9MhrNEy3PEUxzJYCSJ6FzJGWglQ0IJKIGX63ZFMgvuLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788137762; c=relaxed/simple;
	bh=V9/gJuUxrCE4e9yFXKQ+wDZmZejf5fI6ZdhUu3XRYtg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iAmwmV6cLacMAwyoY6lUf8w2XrVWHUkhRd1fGewnOEOFdtEo3c5Wah+keom4iDLJP8bSbeFHFWJ6edKIu9YG2DttHhXenOODpn9LgS2yGkHeNZLUs2fqIOMqTLo47ROVyiahSIBLMsrcOI9zLsbyjIn7ZLhxd9/oVkrxBfJNzwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hOGGpUJO; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hOGGpUJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788137760; x=1819673760;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V9/gJuUxrCE4e9yFXKQ+wDZmZejf5fI6ZdhUu3XRYtg=;
  b=hOGGpUJOiGCA43YNK60lbJh+dHHwT9DcA3wXsJYnCT5XB+suGUmrgYpz
   bfXBTzBgNJCG58BefvWR+hY3y5qiubq+x/ZPbiyLOn1J1Oq6rmZnzg2uy
   OxBthIpQ3IPxbXl6wvXSN8WJkjZizaj3AeXlRvXNtBuLEWg1/W9z+8JW8
   voiKJ2nFiU4cd/UKda8v/QYOidBGZgC+6ikB5W4H+Kl6zUqw0uu+QJjDe
   N7A7sSO7mtdZ2pqH/DO+PxADddlkaKz8trLSviF9SUFvyC/vEFQK2utXy
   oW+ZBXRx/AwQNA5k9jE6JPi6PqITtyhL6fvS4B4FTV7UxaBDLIG384NtF
   w==;
X-CSE-ConnectionGUID: uyFsAgXNRMmZoyL8MI8Cig==
X-CSE-MsgGUID: TPAr9IbPQuK2lDNQXS/TBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="98876624"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="98876624"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 17:55:59 -0700
X-CSE-ConnectionGUID: SZVVZfPHTNSbgPu1npLEGA==
X-CSE-MsgGUID: HHF9umBoSrKM/W/UaLlXFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="298568143"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 17:55:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 17:55:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 30 Aug 2026 17:55:58 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 30 Aug 2026 17:55:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiB/QFN8bFs35mIRqXFZD94wicf9x/hOIGzbojVpU+N/Wn9PSdTx8vmAy6gNOWU7RR1BkzThpysMub2L/kniWCHpcteZeAMydlfNLLlYlGLB3vVlyKRcYIs3eOXA7qA1yqTpLY98KTpOt0aYQBGroqQnhQpeZw05YU1MokmKGGndkhUtFrp6LVa1fTUg6UGC04n/5z+EPeOxHW1eAN7SuBhaX+3/+dE+bcu2oeciph+osH1KZfE5Fhu6wqaJB3GXVuCzE4AEDucM8wHmnUBQOwcQoBSLSdt9Tn+BdAXPruPpGS5qBlgU5StBydESU2CmIGT9XGMhBgjGMJ0wPj5WoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYFn9SDfJSBSiUU1uBLTdaHQJSmEaI6JTbUmF+uYOY8=;
 b=QzrfA0BMyJorKyF1HacdPiC3xF0RSpC2/C0M4OuSxSI1ZykmWZ79YVypnOBI6cHKIddlAsz/jz02sfDu7xgw+GCCB8Zu3h/pKXjWnoeiParRj+9kjIpWIp3OsSu+o9/2mBp4VzOgkVnhtdDrpM3cQzuK2w6J9F+jfJDWGtJS22JLKWNTuutf7A7ftCflvQXM+drO8VNOZQoWqHtjVuoGUzq1ZcjcbOf15q6u4RldC/96OjR4tCHPuIiYrOEV9nm2Mbll7mgft27R9lcIsvvs15JIR0nCtRr3js0TbOFVVz88UQUstu3WgqH/AbwakjYjzvCdtxvCPheOQnqtcMT42A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Mon, 31 Aug
 2026 00:55:53 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0360.006; Mon, 31 Aug 2026
 00:55:53 +0000
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
Subject: RE: [PATCH 2/2] ASoC: sdw_utils: skip unattached SoundWire
 peripherals
Thread-Topic: [PATCH 2/2] ASoC: sdw_utils: skip unattached SoundWire
 peripherals
Thread-Index: AQHdNyANN39lr9KkVEWTJkuV6mcun7a3WFVg
Date: Mon, 31 Aug 2026 00:55:53 +0000
Message-ID: <SJ2PR11MB84249B32D24729C3CAB3612CFFA92@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
 <BY5PR02MB6370329690DCC8FF0F5DA8E8A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
In-Reply-To: <BY5PR02MB6370329690DCC8FF0F5DA8E8A0AC2@BY5PR02MB6370.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|IA0PR11MB7862:EE_
x-ms-office365-filtering-correlation-id: 27f77489-43ef-41a5-0eef-08df06fa9bef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|366016|18002099003|38070700021|10067099003|6133799003|3023799007|56012099006|11063799006|4143699003|22082099003;
x-microsoft-antispam-message-info: tZ9HAdtJQa/xvArWw5ZAAy7RgPc3xNj4Q0RXfm3BP3bEmrg95QOyLR7QLXYoYb269LR/M1tRDNJx+7ntqjOgRYlB+KoyVbsjzhRyg/ajQZAXGSgf2jgMz+/gXbG2xBPD5SJ977LghVj8H2BBlzCNAT1JMjA6tDzMfOdYIwcBWXmQHRwdYRzYhvjEuXz5UCpUY0gOrEfYlmfeSLOEwQCxSc4nFxpQ4+b6VcUFE0LBx/gMW0d8DXECIasJrqR+RsajMwAWBv0QMia2d1Jb6Hd2SGlIRHDmVmVJSV99f9+QrWTbFkwInFEEDz90v54v8HJVJWYljcO78cFZHVwgQLXN86P2hcpKhzNHQcAPe4ItvVBuWxj7kR4w7tz5ZHr2AC0ypL++Mq2WYo2TbzQiW3OFR8I8jAj7se04I2lb8iM4ZVsM2MXaYSnU7/SPmNKtbf4WuLoMVQ1zcyo910hdUcau3yKoRgKXzUGsMHXFRXcJto7dNzmt9XkkXqMAsIYcKg0cgPNeJjxnKrBK8ymD/fLOKCta1y9imqHbLIDA3R1AwVMwbmejgR9FLL7PlVUMmm9CcZtHHaZxi2vDtBzBXbWMBhzS5SDqnDrOSRS9hpsJedUBIiUlRIw4H1awe2Q3uMhnpxWpZXZ0AjpBcX706os/pOOxB3oE3Mlrp3P9TaorFMxthf4QC6RqoxQ3KFvJ04JN9Cmv92yhsQ4PrZ8q/4CKz8XcSSdqXhA4N5q/EoBzt6Y=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(38070700021)(10067099003)(6133799003)(3023799007)(56012099006)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ecry7eHU12iP8xENxq82as3HBC/Yli1AkPHFAGK1baVIIq+aTW18whiZCB55?=
 =?us-ascii?Q?vYPztgY6esGet/l35iTPmiWoauj1JRY9HzqYUpnyeDxMKWYgD4dqTiCwyvJu?=
 =?us-ascii?Q?R3IkxN3LOflM63sqV0oLQKroZAlIJl4su4eMrgI0c8za8xPkpdo2EyMITsWG?=
 =?us-ascii?Q?q+PvUmx8hAw81WMTB8VCYL21sOSJlmmm2RWznypeO18w2uHFPkzQcdXOMVXN?=
 =?us-ascii?Q?x0QhfeafZXC70InCSwdDBlYIvUaFECH4fgqRobETZfi3cnJarYWbIlx2yHlE?=
 =?us-ascii?Q?3pELocwFZRYcU06IAYOz+byzuFaxT64sXElaTuRjVXbflsGZTN7x10NvZWZA?=
 =?us-ascii?Q?Np97CbIN7DEiffgbX7Tc/uri+AGHtEg8+VAi7RQUBB6uMQJdX4ytS98faXvw?=
 =?us-ascii?Q?7CJpWqbJkIzdZ/KLlXPyCBRqX+QKLLOZza8HVpZs6Q/jFeXFuGNvJsY0UFZu?=
 =?us-ascii?Q?6kklCmpZTN19Q0STm7rVyz26k5BfkLhLeaBNqoOtnOTw5lR0nC9SuLtJZFl8?=
 =?us-ascii?Q?T3Tg2rra934jL1MtMis7fHtl1jfBjnCho7RXdDywzUUfN58j0WMALtsxxj9V?=
 =?us-ascii?Q?PJN7JmH5kklYdiV5gk9ujOhSU02ZGJdR3zXZ6GkuDNCz8GZ4/0vfHmpsLLc7?=
 =?us-ascii?Q?8cWhhS1x76+WE8CLP9OWaHsRPcPwVQab+reZHTHD27fXZUQZPFbWpG+gBV77?=
 =?us-ascii?Q?XsuIec7bnej6R5+jfKCtV3IBtCejo2uix5cfg/faTLkurlAZO0BGEKowOsZP?=
 =?us-ascii?Q?lxdhsVdrOIB7Wf/GtrQ+8gs78KAp3QWAvFIH9xr16t426SguUI9AELYE+aHf?=
 =?us-ascii?Q?YR/hFrL6z+DcTGgL+rGKrYLnMt3+9HAKhECgszSNyICDiZMP/dx2RG3PYGaV?=
 =?us-ascii?Q?IMtKA3BeH/NP/SdtvXLGD/AXMAIrrCVarAIMb8lRcfRwncu/2AIHE11zuq6z?=
 =?us-ascii?Q?1jJW9i25ufZ7sCwvSkqev1ESm6c5CsimfHsB6n5zt6acn6K9my4teF4cfMHs?=
 =?us-ascii?Q?pkL+HIoGJJs+eWO+KsB6rNaimoBkbzXapEtnCz/fDpIZTB9N7/xnynKCaQJD?=
 =?us-ascii?Q?h7vThMvOCO7YLlysqxmDOx7YnB4jdF3n25SHAqlOgUUpwHc1o0mHFgw6fBwy?=
 =?us-ascii?Q?KctbxA9hEzDT955lufR9FaL1wl8ps7AhiZDLEhqHUL7fCry8Yo0A7YLo+nr+?=
 =?us-ascii?Q?+h60fHRgxS/9UcnBk+eyzOFrKzAhOhM44EIJku8rxVDl/p4PMH0NtcaxoK+k?=
 =?us-ascii?Q?4uh4tmRE+du/+GUDXNMG+O7+PBhWyzu463p7elZDzNUpSZrfzdcUgF972lSC?=
 =?us-ascii?Q?0hgHXCuEx5lkR5o7Z0nW+GM9C83MN9UMndb3LCCXRlxvVjAVjpBKIOTo0xEn?=
 =?us-ascii?Q?ru0o5A+kTycl7b+zWmkm4o+1GCCuDIduDdaTwckHvk30WR8sLU6hbreG6Mvo?=
 =?us-ascii?Q?8zzVwlRx9ThutsfJN+4x7g/j5pLF4p4FDnrD0gviOBbhr2ge3JfhpYmCWR2I?=
 =?us-ascii?Q?RznNW9QK67aCHvUovUlNJvk8DUw/7zYd2vZD/Fo1zJJNEalh2SZk8rFDtW4F?=
 =?us-ascii?Q?vg4GNaWciow4rVwAgabRBv0UZA4XlUVUfM/oX+XhExtnLX9BIrcQUxHHWZls?=
 =?us-ascii?Q?RJU7YUwQ5yvWIygIxemQx2RbKexefZA8uY0BOPLrXWVY02ralW8yuxC+TqzR?=
 =?us-ascii?Q?r3GxZHzWaY4tDuQXPL5SsdukLP2wABnbWlAiQzkOscQN2xXw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VBC6owcmiHW0giOYcntBrRRvzyH7rQystAXF5X7BAS3z+oQdxn/TP+DvJshoQRoJ2M9UY63yXDIqvgHy9BMC5Yg2wEM9sCsqNybcUU0HJXOuf6a+G5MActe1ja1/l5DSbtHMr0o/yYqv5c8dd50LQqGFnVNq9vbsXNM38Y6d9DVAPddWbgIqpAY5b/arntU2CbRmuxrLtdcmMRmHtN1n/9W20VMAHDmyosPbyFkllNNOPxr7AUNf2xJVhfAxMr5YYn8qRA2ntvXC6B4xKbM2plnyVu3htrMqFfdTvm+CMp0AC55rVKduxkrfH3sta1aaikwEsSXA51niFgouVyo5Kw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f77489-43ef-41a5-0eef-08df06fa9bef
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2026 00:55:53.7095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrgAmnwwJd92/Zi3JWDNMsO58xAc4zgDONrbxrLL4gHRl7pOuqcftwYMWgY3NUvmT4trKoHwVLYFbQSqbUeouQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7862
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
> Subject: [PATCH 2/2] ASoC: sdw_utils: skip unattached SoundWire periphera=
ls
>=20
> Firmware may describe SoundWire peripherals which do not physically
> enumerate on the bus. The corresponding SoundWire device can still be
> present with SDW_SLAVE_UNATTACHED status.
>=20
> Counting and parsing endpoints for such peripherals can create entries
> for devices which are not actually present and therefore interfere with
> sound card registration.
>=20
> Check the SoundWire slave status before counting or parsing a
> peripheral. Skip peripherals reported as SDW_SLAVE_UNATTACHED while
> preserving the existing behavior when the SoundWire device cannot be
> looked up.
>=20
> Fixes: 27fd36aefa00 ("ASoC: Intel: sof-sdw: Add new code for parsing the
> snd_soc_acpi structs")
>=20
> Assisted-by: LLM
> Signed-off-by: Amaan Lalani <zlzzm2014@outlook.com>
> ---
>  sound/soc/sdw_utils/soc_sdw_utils.c | 35
> +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>=20
> diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c
> b/sound/soc/sdw_utils/soc_sdw_utils.c
> index 8a07ba2a29e5..381eb884efb9 100644
> --- a/sound/soc/sdw_utils/soc_sdw_utils.c
> +++ b/sound/soc/sdw_utils/soc_sdw_utils.c
> @@ -1854,6 +1854,33 @@ static int is_sdca_aux_dev_present(struct device
> *dev,
>  	return 0;
>  }
>=20
> +static bool is_peripheral_attached(struct device *dev,
> +				    const struct snd_soc_acpi_link_adr
> *adr_link,
> +				    int adr_index)
> +{
> +	const char *sdw_codec_name;
> +	struct sdw_slave *slave;
> +
> +	sdw_codec_name =3D _asoc_sdw_get_codec_name(dev, adr_link,
> adr_index);
> +	if (!sdw_codec_name)
> +		return true;
> +
> +	struct device *sdw_dev __free(put_device) =3D
> +	  bus_find_device_by_name(&sdw_bus_type, NULL,
> sdw_codec_name);
> +	if (!sdw_dev)
> +		return true;
> +
> +	slave =3D dev_to_sdw_dev(sdw_dev);
> +
> +	if (slave->status =3D=3D SDW_SLAVE_UNATTACHED) {
> +		dev_dbg(dev, "%s not present on the bus, skipping\n",
> +		  sdw_codec_name);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>  int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card,
>  				 int *num_devs, int *num_ends, int
> *num_aux)
>  {
> @@ -1870,6 +1897,11 @@ int asoc_sdw_count_sdw_endpoints(struct
> snd_soc_card *card,
>  			const struct snd_soc_acpi_adr_device *adr_dev =3D
> &adr_link->adr_d[i];
>  			struct asoc_sdw_codec_info *codec_info;
>=20
> +			if (!is_peripheral_attached(dev, adr_link, i)) {

Sorry, but I don't think it is correct.
The status just means the current state. A Peripheral aka Slave on the
bus could be attached or unattached. We can't use the slave->status to
determine whether a Peripheral is physically on the bus or not.
Checking slave->dev_num_sticky may work. However, there is a timing
issue that the Peripheral could be attached after the check.

> +				(*num_devs)--;
> +				continue;
> +			}
> +
>  			*num_ends +=3D adr_dev->num_endpoints;
>=20
>  			codec_info =3D
> asoc_sdw_find_codec_info_part(adr_dev->adr);
> @@ -2029,6 +2061,9 @@ int asoc_sdw_parse_sdw_endpoints(struct device
> *dev,
>  				return -EINVAL;
>  			}
>=20
> +			if (!is_peripheral_attached(dev, adr_link, i))
> +				continue;
> +
>  			codec_info =3D
> asoc_sdw_find_codec_info_part(adr_dev->adr);
>  			if (!codec_info)
>  				return -EINVAL;
> --
> 2.55.0
>=20

