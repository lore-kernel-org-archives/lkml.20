Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6A447CA87;
	Fri, 25 Sep 2026 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345171; cv=fail; b=IJdqt8DRuTmcXPUJwFtoKI0t9W/49Nh+R+to4jV2/jfisS/sKS/Tlub0Dux/YM33QQnSw41GdIyCMBjzUeI14LwsJRBIkq4/VmP2aYIzM2eqmUwOMUsA3+YdDAlj507k5O1eoZ2bkFMmyoY1jUvMQYesU0v3ObHcGVju+PCltCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345171; c=relaxed/simple;
	bh=kUVvDYXsqMDmFE1vZq+wx0+eOJYVqF8zB8Q+ra11z4g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h2Rvs5jAphmMv/YH6JQIukGTgAcvNjGximkQhBMLKYzCr4KOIzOcscfR8aveQhgzVCr5bJYEZ4gBCpfSgcX3hTxj2MmZMLkxXksj1Q1cS0UIpKV5xOFMeU+MZWxJlXorp9VRiW4BylQHzWYioBEeNOw9miN83Mhq9M+Rxns1/XY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GucHja05; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GucHja05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790345169; x=1821881169;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kUVvDYXsqMDmFE1vZq+wx0+eOJYVqF8zB8Q+ra11z4g=;
  b=GucHja05Bh+ozfjQuEMov1ab+q8kNQz0L5u2UBWv7rtyCegcZqjOk1dH
   cVKxWQlNOx7qG8AxWnyociQGK8eL/D454Kz5h8VwKcYMoGGx//1tnFktH
   1rvuWeA2/trkFSFVfdaeYmNpMIn7Eu4j4byPeyUbzEXwuUkFJ69XrIUlL
   ZvylmjyFGLU/jfMCMtCd0QmRtFdAImUPSaUMRmTD8rkUWrl2XBS5QldC5
   sW3QLRRkDDxSDP9mqZeZMbWzXxbw41tWPEsD49OtOJ8C85aMBSBiQBxXU
   Eqo/YKZ1miMTLrdTav4yZsUU8i02WAeE/ZU3TUCvEzOWTyGSfNNsHg8u2
   A==;
X-CSE-ConnectionGUID: raRdH3zSTeaHo16m4rQEbQ==
X-CSE-MsgGUID: 5NKV2aFNQP+wsUtYmnwxVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89994966"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="89994966"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:06:08 -0700
X-CSE-ConnectionGUID: GknV8Zc2Qu6AFPdkAdQX/g==
X-CSE-MsgGUID: Ggpobdi2Rp+O2FDNKi8iOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273439458"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:06:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 07:06:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 07:06:07 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 07:06:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndQYBkalzj81gHr/Mrd9DS5P539vwHNU/PrF/GK6b+76f9SVDoSlzxKz3VJND9eMoKy1L6T6yOa45O/kfpcUEzWsySqaihCqU1TIra0XieR/yJm9NCik/VHixVHkZYpfKGSZxKJle2hYHptlozftTJ6lAsmxz7MVLCDL5QNw4ccqfrBOLO8PVlMfSS39vfC8YDbYyZfEH8aOmpJgpk3usj0jQTxLUUTpUCNwsuPQsB3jkZGcA6+eXowtKUeifbBjzCKIQIhPzSyw0VD/fJOUVw+82C9kveXTlgk5vsDbG3ulDWFjsJ6RviJzxl590KrimnjotNrLqfT/qebK1SKCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqb7YueKR334A2ci3WzzUvwNGrWnFca5f6CflVE4k/8=;
 b=I79sWsIgac3wUWQUSRKbhtPbIKnIGlTOJ2SAFXiqUbG43PeoyWlJXcTsU38JN6yIj4GKZEzgvDp2AWQQUPGmwA7ltA09lSSa82GHKCKJ+74jYTn+MO9qUqJqUhS2Z/mWdXIT/2YKkauN2xLd1ZixM38JVAlXSkhaEULMCn+72FSd+1O8K98IIjUzrt6nSj9BAlo0DzDz9UGi8ux6vsdzjd1OIjfwr17Dn6ytHcviNqhXyoW9ptb0W7JVB/ppWSPvM0uwBe2Kp0x3i1FIpBmzCl03LDipxSfrxoUjGgZodxVDHEW1JReNljxcpcn26rR9Qk9irGJA56qt4F31juWmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SA2PR11MB4873.namprd11.prod.outlook.com (2603:10b6:806:113::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 14:05:57 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:05:57 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>, Mark Brown
	<broonie@kernel.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>
CC: "Rojewski, Cezary" <cezary.rojewski@intel.com>, Liam Girdwood
	<liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Yung-Chuan Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Yauhen Kharuzhy <jekhor@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine
 entry
Thread-Topic: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine
 entry
Thread-Index: AQHdTIV2OYDs3nJ6VU+MGv/cQk94mLbfU8lg
Date: Fri, 25 Sep 2026 14:05:57 +0000
Message-ID: <SJ2PR11MB842437F022D1F62A2A527297FF802@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260925003030.1077471-1-mauriziocasciano7@gmail.com>
 <20260925003030.1077471-3-mauriziocasciano7@gmail.com>
In-Reply-To: <20260925003030.1077471-3-mauriziocasciano7@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SA2PR11MB4873:EE_
x-ms-office365-filtering-correlation-id: ea010e4f-3b26-4a86-281d-08df1b0e1f07
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|38070700021|11063799006|6133799003|10067099003|56012099006|4143699003|22082099003|18002099003;
x-microsoft-antispam-message-info: IrApfphzwXpRGEIoDs/Wq27SRyJH1HFdwL1TH94T+stysJuw+4Zi2INef3xWQKBBepjRn7QF3vjgo5R/j3UTgbUc6tYdGGUtf+PYMS9VI/SyKZTaP6HabYZKepFOrwaLae1oMh/vwQiq8kyK/10SIyfO9p0W4FFIys0QX6hSbL3Qpykg2roZ0t+Wx1KULHpSfZmaLThxbsYRoX45gnjPY1EEt/+W9URyg91Cpz9xaeEk1etkBsDIidwPPmR4S8KxqXdK8H3yR6b8AXeWiD5nDOEf9uGTZAt/Bt/sd5FkEDqG1S7PJIZKNCFcoZUWqNAVhT1+Dr36LPJXZgIlDLDt/twnnvRVMq9ajoVrgOBMTA/NrO8CXgWz58ef0S3haheavmob93fPDU2yON/nTmjyTThDaC+j/TCHdg06HWIU/TVNUYYPYeGwCIOBJNAcExYQmt6FKQ5EjNDzsRb2yBWb5rEYlT/wEDG6zg8hF6VtLoKtPuSysq/0FZlji6hMiAidFGLUwaCSULureWOyepVtCRlWHvHZxsReRtIsb0QmXWW2gH1dEifbopk8zpnjqPIHPOdNF/DBpUUpcONX4P2gSuGT87+YAGXdeFkD1V1O7A8Tl5Lx23gXjBdt+EG+jUKjuWcDiBNGVLokG68bhzPb1cH+RBvPu6B8NWgcVV7kXgS/E8POCbKAKjUqRg/tePROmDFD2TMJSxoq9vd3Tf22eFDaSoTGEV6m6yTsMHALfls=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(38070700021)(11063799006)(6133799003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KYFsfSsV7cGT3+TVodUDKollmHPmSLzjtcT4ccpM2EFG+/ovDLwSgmgXXuay?=
 =?us-ascii?Q?3XwYJZPH7G3t2C24ig+tsqatMeQ+pIkWY1JsjodU0Ux22wsLNq2HWSWYPpbR?=
 =?us-ascii?Q?hicw/YqQibA20R5PNq3CHw91lccdG1DKU7A6PFDhda5bNoNbuQzUdF1VvRuw?=
 =?us-ascii?Q?dyOSD8l2TwlGc8znoDTr/SAbQ4+giqdas6nO5On3YNh8M+k+lFvQ/aq9DYNP?=
 =?us-ascii?Q?XDXi0m00lt7sD3hsujXeY7cZMf1Wr/8jBNbJS9Kj1f+4Imefpk3HUYB2h1lR?=
 =?us-ascii?Q?JXjjf6u+YIzRkjcfnPE/02IcwahHlzHWR85a4PYoQ7z8ZVDedOptkOWwizJ/?=
 =?us-ascii?Q?j3QBrf4NdUpP6rKqeoKXy0tfzEyroavk+iCImE8iofhDkhkEHOPBdVGHxSYh?=
 =?us-ascii?Q?4BpW1Pv6U9VoGqUwKK6qjmH+N8ornU6Gq+bWOKw4NL1N79rFVU9VOqHUgCQJ?=
 =?us-ascii?Q?3i+uRD8Mj7ZIuJwlvJcspcaunCExmZCQGIK7rrXeHjSZoYwcHkW5ZTS9lyhe?=
 =?us-ascii?Q?+HsqbS/qkR2RfKzWvVZtZiA3aDCJ28JQ1NZJPMoQ5Ujm0eOQepmP3u4BGxuZ?=
 =?us-ascii?Q?8Wb+KbshHI53LWIfEhpAQODf3pR4QeE/dBMKzt/0UOHXr0lFjnA9y1rnqrvR?=
 =?us-ascii?Q?fcOABqC9HMsHX+HECrI3ywq1rMwhj3Qe3tbcNTGVuPhlE3ik0j5JOOMThDMj?=
 =?us-ascii?Q?oUG70+sHCEvufUTv304WuPKE8R6SJqYQbCKZC+FIHeKBgl4PaVxOh4IIVwPL?=
 =?us-ascii?Q?7xjmtz0W/6BHpbeJg3I0OhnZoFvKGhFm+xt6xnQX/UY+/hBzVU0VtE52envw?=
 =?us-ascii?Q?QY5pH+fpSgOedDOZfBCDjUwqWbClCVPY66FJPNhStSgYZakRMmQFz+rtgdhG?=
 =?us-ascii?Q?zKLSm10dA91WhIALl4Y9zMLgA8pivPHbl8SS8J0iJFsUEr5Stu8VS/RPVzCj?=
 =?us-ascii?Q?F/9dwjMauI4E1WQh5mNLANzjsf1i95PabTM87d21CEEfeGA+cv4I6s0Gmwln?=
 =?us-ascii?Q?h4LgC6tbRPFB15+BcJG7PFxdBpgsJ2Lp4+TJvQJ0u6sM8D/OygSl+arB+dXt?=
 =?us-ascii?Q?0mockNPdz1g5iZp3b2ycC8VvLRm7hBBKwVTKydVliFfpUzjhHiMzmrUs4NWa?=
 =?us-ascii?Q?4B4XpaXknkX6sotWmwryGvF5KuTN0yQ17QuS5W0uMGz+MauSylxiEr6UdIV9?=
 =?us-ascii?Q?/azhZHPXFkj+otC6lvIALPAze4r2Yw1om/tXC9cnDvdQXTSWa/6hJgs64hgY?=
 =?us-ascii?Q?WDGXQJ6IqTxsnGNY5zVrOcb6XxvefZAsrseS9Ni7EIW3BoIrcIKgAMPIUEKS?=
 =?us-ascii?Q?mqKAP8Sv4pj9jsQYrLFkJ2WbOQoHuF+ynNxYaeBI5y9Lv5DOp7EaTfyA3oYI?=
 =?us-ascii?Q?OL2MVVikJkb6Ll6mPmGGqzpeZxWEI/+KjB5fVj6WxbrtqL7RguJ8l+8Gr6tP?=
 =?us-ascii?Q?IdmUd2YKvAHWYLBK5zmyOhCbKq2m8XIqQOA6O1vMVf3bUSXvnrohwnb7KCLH?=
 =?us-ascii?Q?pmCYKp2ToQCT59TZz84zEr2nQDE/sgqfza+hQgkQQtKwUOLv3fSbLTamdyvz?=
 =?us-ascii?Q?XE5eNE4t6DBzFOF9/xAKPh7SguszzvYV6yIRzaCOlxcRqnK0p/RCsA4TpGXU?=
 =?us-ascii?Q?JFwFnjkM/RNs0KmfSS94h3aaUhurdcRRW7nLFTzewNFKkq6164lRjmRJYmbV?=
 =?us-ascii?Q?p2/tF7gHjY5ucSGz+QiISYH2NyZb23qo2EYPqnx5Ngg4rvI0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: XPEXnoAb2ZCVmB8QwYpEZ/K65h6BHnxmWtK7vWOYB9lTjz1RMN6v1Na8G+F/3yn3N+7MgGf8tl9R2AUbzoLunl4iXFgA5J7p71zkFKwzSCDolnDMWAX4OzaFCcuKt+19PSu/NtxB10lE4kdsisdRXSCFsxQFCHFm3co50ThEdlLk7/nhN0RkWI2t5IKXJo1n0N/Z6dvH+ntmquucz8k6SIwi4reMtgo0dkfxxVClvAuNr2QjutGpqgimn5ftJcQHQDLPDZwcIIUzLToPNa4uGJ1wFtPl/517zNpKzt6RQ9zWgazGzJx2Qo1dJZFXhm1Hp5WG8CpMcAeHkvHGypQK5Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea010e4f-3b26-4a86-281d-08df1b0e1f07
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 14:05:57.3586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQHJVFdmEAdPifY+l/Fv4rCNdTJGv06g9pXIfXKdDBDq2sQJfs+7sqE4tN6QlifCT/W57UFW0j7ycylp/C5ljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4873
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Maurizio Casciano <mauriziocasciano7@gmail.com>
> Sent: Friday, September 25, 2026 8:31 AM
> To: Mark Brown <broonie@kernel.org>; linux-sound@vger.kernel.org
> Cc: Rojewski, Cezary <cezary.rojewski@intel.com>; Liam Girdwood
> <liam.r.girdwood@linux.intel.com>; Peter Ujfalusi
> <peter.ujfalusi@linux.intel.com>; Yung-Chuan Liao <yung-
> chuan.liao@linux.intel.com>; Kai Vehmanen <kai.vehmanen@linux.intel.com>;
> Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>; Jaroslav Kysela
> <perex@perex.cz>; Takashi Iwai <tiwai@suse.com>; Yauhen Kharuzhy
> <jekhor@gmail.com>; linux-kernel@vger.kernel.org; Maurizio Casciano
> <mauriziocasciano7@gmail.com>
> Subject: [PATCH v8 2/2] ASoC: Intel: cht: Add Yoga Book RT5677 machine en=
try
>=20
> The Yoga Book YB1-X91F/L exposes its RT5677 codec as ACPI device
> 10EC5677. Add a Cherry Trail machine-table entry that supplies the legacy
> SST firmware and board names and the SOF topology name.
>=20
> The Intel DSP configuration selects one firmware path at probe time. SST
> loads intel/fw_sst_22a8.bin and uses the cht_rt5677 board name; SOF loads
> sof-cht-rt5677.tplg through the standard firmware search path. The same
> kernel and machine entry were boot-tested with both paths on a YB1-X91L.
>=20
> The SOF topology sources are maintained and distributed separately by the
> SOF project.

Please submit the topology PR on https://github.com/thesofproject/sof,
too. Otherwise, there will be no topology available for the SOF.

>=20
> Assisted-by: LLM
> Co-developed-by: Yauhen Kharuzhy <jekhor@gmail.com>
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
> ---
>  sound/soc/intel/common/soc-acpi-intel-cht-match.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20

