Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF71C23A99F;
	Wed, 16 Sep 2026 04:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789531726; cv=fail; b=RYXq6r6zW2EfD7JWHp6gGglSM7EOp7nc3xaqNpSouUCU4zVJH/jRMV1LQSpolq1PsLdD7eeOhk3YmWzxBA23lfjeSlRZpCbhMmtJF/QZIj1bN3/JkR160H3EhKtP63tLB/M0RA3StZFQZQDsHskhI/XrgRc8UDOwWi1YYwvprJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789531726; c=relaxed/simple;
	bh=Z5s+5Nefe5P5jOPNOcC5n9wJM0OGjU0D4Be2vnAQmv8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=unnIPfwWJizAH99vjFZAIHFQnrD6W+F2BBP8d0x4ENLIsVmDB6KF5tHFPRpFaWGR0UG/5FazGG7txBmPX5jsFA9f+Hx+GMqOB7FgpJpKknNF+8qJ9BhSMSBPJYzue1VPfpahprf7Hn2CzmkHKQX017uYBprV3GBMeHdohMfaKuE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kxUAmbr2; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kxUAmbr2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789531724; x=1821067724;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z5s+5Nefe5P5jOPNOcC5n9wJM0OGjU0D4Be2vnAQmv8=;
  b=kxUAmbr2p3k3I7X7/LxjMUKTvdSP4BaXYbSwa+Qj8Iae5anhZTfcyy/b
   oseZ8kxdlOENtN/QnF4/wRsLIvXBIPvvSjxaLSOKx9xffX5Yeb2rgmBwS
   7O50+5Gequ9zx1if2ULMw8ehD2DBOQ0Tg0MZjlGjt1U/sut9Un8gLlBAh
   wG9Cf7NMlEI96T72owJdM8GgcQbgk6OxAl3154A4twpFkMRsgQsQiAyqN
   7jYM1l2VyT488xYfZJOfTM/bL88Y4aMaaNR2ShsSmqtShjSNzhLd05s6b
   OxaYIh/MV4aKUITDl/7yNlrjbS7NxifhcvUy+M2y8xOFTxlngNWVPpeBZ
   Q==;
X-CSE-ConnectionGUID: y2qmJfCaSHqFBhHmMXmyNw==
X-CSE-MsgGUID: cFanxn2SRp6/IeausCO2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="115443360"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="115443360"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:08:43 -0700
X-CSE-ConnectionGUID: cYCAAhrWQhaeOOmqbVTswQ==
X-CSE-MsgGUID: wr6xYwciQ2ekxZld6Ue1PQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:08:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 21:08:41 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 21:08:41 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 21:08:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay9H4zGff3I1783BZvwfn/uDJ+bMpH5tWFndbryyDY8IgT5Vb/UsrpuKX4sbDH5E+q52shHHzb+spHtNdVtxU8fhbTQm0V9h0QM3Ln3gXmtuBoOCOCUXkOCzYsoJdqQtm7Wod9xcQqWtxH7pHaBlP/p0SpL9PhJlWciXBY3ZQpfrgWBl+A3xFuDY86Avp92yGNTglQD7hGxFno1iKMAkS0Mmr7jpOXk9rrYufqQ9owl52sxA50KW1g0ijbcTAZatk3RmjBWUg6qmMGs6pE6E0fuA7zJCrjbRZ+dfSPJjA/dpT78LvGaxHUkWDKX6EFAHtcvDk3lV3170l5GJGa4ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5s+5Nefe5P5jOPNOcC5n9wJM0OGjU0D4Be2vnAQmv8=;
 b=MAAXnXEMoUZ2N3PVZOZgQoNB+3BqJmSsgA/i70xdfyl9pPqgVMjVCMLCHj3Ik8r/SijEj6kdU5VLrfZYumtXyCXC5HDWq+erO5c/k/nBp0rzUDISP/X8XETI3uxlIBtH5QzGR6tocVm2gA9HGiApYBjsOeQ5GztxRDdJnBZQKEU6nhUGz6ffQLfuKitlhj5eaTA76LnBMEbrYhmW7SkTiGlqElDLxViXPVadkPO+p2lnLbhEXN32dHb+x9ZP55bn7pn6t5dRR8C4Jx8jAWhr8sbJMZhQLQvg2rQoPF2NGhZgMWA8FTmIUtnQdyOFhrHd61RLUcb2s0Of2GUkul4cJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com (2603:10b6:a03:53e::10)
 by SA3PR11MB925731.namprd11.prod.outlook.com (2603:10b6:806:530::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 16 Sep
 2026 04:08:33 +0000
Received: from SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76]) by SJ2PR11MB8424.namprd11.prod.outlook.com
 ([fe80::3df:33f9:59a1:da76%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 04:08:33 +0000
From: "Liao, Bard" <bard.liao@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "vkoul@kernel.org" <vkoul@kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.de" <tiwai@suse.de>
CC: "vinod.koul@linaro.org" <vinod.koul@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
Subject: RE: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the
 mach table
Thread-Topic: [PATCH 0/3] ASoC/soundwire: remove ghost peripherals from the
 mach table
Thread-Index: AQHdRRQPZ2kignuw5UqsnkRDoqnbO7bQAQ6AgACIb+A=
Date: Wed, 16 Sep 2026 04:08:32 +0000
Message-ID: <SJ2PR11MB8424E1911A4CA6F9414A07DAFFB92@SJ2PR11MB8424.namprd11.prod.outlook.com>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
 <528a9777-1587-4dfc-a366-000fc0867d4b@linux.dev>
In-Reply-To: <528a9777-1587-4dfc-a366-000fc0867d4b@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR11MB8424:EE_|SA3PR11MB925731:EE_
x-ms-office365-filtering-correlation-id: 785e5153-efaf-4952-a61c-08df13a82c69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|4143699003|56012099006|3023799007|5023799004|11063799006|22082099003|38070700021|10067099003|18002099003|6133799003;
x-microsoft-antispam-message-info: bza5hlTceQ3AGVRO6ci8cN4XiYi/5UBiVW2/3J5nAYc2RjJUEYYma0zTWRBk7M5Mb3EDLgzacS4tPXsOWzK1Qis4uoMoW1bncvBjN/cEH2zrHFGU4wntXL8Bj6o0mfH/0HynG3c7NLHnPyin+hCXctbwYVATizAfcUhXX00ZXfNDmRk8ozjifOC/hCrE6tT4QEay3wH8KUa790L7F5q9oz8vEG1LsplS5WO4svy5jJ3WoPcdylz+Ytz03LTUxG9evsamQnRaZTpPDu4evN/lqecUZK05L49CT1b730GR8UZnnA72KSDU4laBIZOe0C4QDLb4T1cWWlhWsIie48teDRWuZePWJwzDBq2ZHttrt/KEiC1+s1bM7Ym/bqHO+WSQtBotMcaIB6K2/A9xCqx+x+ZjNIAgfundWpMbW/rV3Dv5UyFLxLGLGs3apn3lFMGmtGQnCtyqMXUc+Rk4SmsZS1QCHF1FwdNM0z0Ww3fHfBao+B1o5ViSAPOam6j8Y2VewXW58+R2BDO1nyeI8uQwELydd6TpvSCmFUDdn6PFXFu0VrqNYuiV8jmXPHa2VJtqfvczngCp2cBWtDZ0ml0+V+1D1iqIhiGZRAycJ42cRP/Cbhm+7+Jmiju8aN88ONwbqPGTOZYUzDynbCzMeW1RU1uRF26OGujftd6Gll6Qc0aXvZdTauQ3in9UgUi4Vl9XUlx48YNwBMNKD4x+ObgNtiEcR2V2mO3jVEAqTICLSIM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8424.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(4143699003)(56012099006)(3023799007)(5023799004)(11063799006)(22082099003)(38070700021)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NlNzRHRWNGgxUEdka0NUc1VvaVl6d0dkcHI0eCtIZjc4U3gxSWpTS0xCMDZ4?=
 =?utf-8?B?QnpGNXRaRTVSb3lKbnAvdG56VmRmYlc1QTV0UHpYUlJsTzB3NGZ3ay83ZUU5?=
 =?utf-8?B?YUhXZ2d4NGNlVG5ERUQ4OGpON2tFNXBySjlkUXgyNXloRHFKSmIrTEk1OFRt?=
 =?utf-8?B?LzFtNDhyVEhuZHRGYmVtcHVSUWZseFZFQW5Qdm52a0ZnMCtSYnBlcVhrc2x1?=
 =?utf-8?B?L1FnbFdGK2pIOWNWZHhBbzFnTTdZQ25ocmZLQmdIY3NScDErcnlMNTA2R0o0?=
 =?utf-8?B?YTgzYXlKZnFBWHJrZFRJcWRCOGIvMjFzUmVITFBhL1J0RjdJVXZVK2FUSlhL?=
 =?utf-8?B?RUhRWUcvOXRQUisxTkxTNnIvWFVaNFllaThVQm1KekV1NlUyNVJqRTAyQWZ6?=
 =?utf-8?B?OWtxWlNpZkVYaFdZT3R0MmFpZUtsTnlCQTl3cG84am9OdVZLWFhpUk84SHJa?=
 =?utf-8?B?Qm82WUNINlVjYUJUc3dWUk9qenlSbTA0SHlEbUhNcEZOUFVFMk9IRjQwY241?=
 =?utf-8?B?eC8rT0pKRC9paUZuelZpU01ic2Z2NFJvMnA4cU1uZ25qalJVcTBZc2hRdTlq?=
 =?utf-8?B?cUlVd2J1akYxcTJhYm1FRTlkN2liblIrRDE4a1lCck44VHdDb05mMGY5ZDBs?=
 =?utf-8?B?K2ZrOE96TmV6elBZOFJtUE85V2FTclJvOGpkNUV6OUJRNjZ4Y2o5ZjJpK3A5?=
 =?utf-8?B?MVNMbDZqblNyMHp3empScEtBZnU4ZUgzQURsWXBHQUhCUmthTytpdmpCYWRI?=
 =?utf-8?B?cjB6WDJzYWxOMlB6dURVWkh1UWRZR1NHNVFzUVMxcC9WU05RUU5YT0NYSWNE?=
 =?utf-8?B?ZWlLT29CRGNhSzk1ekpjUVBua3ByWWlvREZSdHJWZlZFUWhDNVJtM2p4aGpF?=
 =?utf-8?B?RUVPVHVBbGZjNnFPZFpxU1NqYW9jVDl0dm1OZy9vT1pObFcxRVFUWGowMjA2?=
 =?utf-8?B?bkxhbmV4eDVuUGljeGVmcDJNd3R5T2tCL0I5TkxXTmJmcVRDenpMRjMwV2N4?=
 =?utf-8?B?Y3owZUtJS2YvWVhDRWxYZSt4UVhOK2k4TldnNjc5R0ZPdEMyeHo0WG9aVWxv?=
 =?utf-8?B?VGwyOU9WVVlmd2tieHZmUU8vTVo4ZEJ5dDhRRFpRVmVxMGdkd2RFTnQ0Y095?=
 =?utf-8?B?STI2VjIyNE16ZTQ4N2dIQUxkVUg1TGdwenRkbWYwSWlUUklpZG1pUERMa2xv?=
 =?utf-8?B?UGtoZGtKd09sUzZ0T3hGcVlrTkZtUUF4dHF1YkVpKzFuSnU4VTM1Q3VjbVA3?=
 =?utf-8?B?b1FFbksva0c1Slc4ZEd4MEx5Z0pmaXZmdmdhVXZBMi80RFdEVVRKZWNId1Zv?=
 =?utf-8?B?OGUyRW9PRkZXTUZ3Z0hleVZQQ3NyZnBVdHpYMlNBYi9UV1U4VXVBUmRMOFpF?=
 =?utf-8?B?cXJ1eTl3cEs5aXZSZ0Evajc5SjZTalFZa0RaYUt0dDE5VWs3dk54MkZnT2tW?=
 =?utf-8?B?S0Zwd1k5YU1pNjJQbnU4TkRuTitJb3hxNzh1MVVBNE5Cd0x0L0VTVHNpT1Jp?=
 =?utf-8?B?N0p4alhBYVJrM1ZMVUtoU0FWZTJ0bHkzOHBPTFpoR3kwYXYxaGZiMTRkd1RT?=
 =?utf-8?B?K1JKZFZPaE5XeXp1TTBKRDd3T0ZqZkUwNXhtOFl2VFJTcUxCckV0aTRjTUhJ?=
 =?utf-8?B?RmlwZnJDODUzS0RoMU9IQWcwRjhvY205MmxhQTVJUjQ4Q2JCRjBNa3R2dUR2?=
 =?utf-8?B?RXAyd2RUTVJhRUdNWFpyd1hWWDgwYWY5amMzbVpmdVZ2Z205NEh1bFlXeFJY?=
 =?utf-8?B?RjBjeXFNMG9TRXNhRTZrTlVuYW5OMjg0ZmI0YWllMHFRVWVJRVBtRTkwOTBi?=
 =?utf-8?B?MjhtOU42c2hSWEJXNjkrbWdrZDNMTGJwWTZnQWN0M3IxVUFFODJObjRSYWdH?=
 =?utf-8?B?d2xBTVprTkZEQy80My8yTlB1ekZhdjhYTjl3bnA3cExNT01DRkxFSGlXY2Ro?=
 =?utf-8?B?eU5CbG93K3hubWtoazkyMXBHZmY4aTZQclA2cHNmc05WNkxRb0taNFI2d0w1?=
 =?utf-8?B?VEhydDRIWUt2SXdmUHU4NkIyT09IZnZzOHREWVkxS3IwSU83UzhTK0U0eEIr?=
 =?utf-8?B?TFcxRkJTWmFJdHZnTU1DRXZvdzZkdzJHYktWVzRoNVI4aXVaclRTNFpkcUNY?=
 =?utf-8?B?STFuRU5iS1UyT00wTmpyeW1VdllYQitHUGNUYjk3TU5RamF2Q1Jpa2pqaThn?=
 =?utf-8?B?NE1PMzN4SzlhWU00NTFqMUlCRW9Ra1NiZXZmZWdFWjk2TVoxQkZJRUxVOVRU?=
 =?utf-8?B?WUJpSlNlN1ExamVnMWpKakZHWm1ETi9kRFhGRnFJc0F2RE9zeXRsYmEvSDUy?=
 =?utf-8?B?aVBJVUJHMjhiWG53QUlXOEZLQjRBQ1BUbExKVXRVTGVLSXllOEwyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 1xrB8OkObIN4Gmo/ovg7Gapo5R1GDhQV2sGhMyFc2eQaxvvkaHNgca7qxiUKup4k05txmaE08m6cqBP9+7SxIR0aORLJFkELsAmMdJQVWqvcegZbX52Aqt3f2LoMMOrmjV5neyiCPj/U4CYBwqEuqllztQr5I/vu5IMXcszP4oTAEuW3rPHZwb2Efpt8lnnPKJ2dtan5SSQ636jYvGdvy1yxeAO9DsCZy9RNL1jqvNKrine7KPkPwJFwO968L172SL+3FMtVnHB41aXKw7J5mLz4yctrvu3Aix1KLSQPkiKoe+8gMP8l1o4uT8TODyt9Toy2WbnteiOVkwuXHp91IQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8424.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 785e5153-efaf-4952-a61c-08df13a82c69
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 04:08:32.9583
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VomaFEhml29QFVhZRksD5xG7HFJHTY8jZ12GnAS+XiMZSo+uLKxNS917tW91Rhmsp0xfaT2vgIia8oKrtT8NFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB925731
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGllcnJlLUxvdWlzIEJv
c3NhcnQgPHBpZXJyZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmRldj4NCj4gU2VudDogV2VkbmVzZGF5
LCBTZXB0ZW1iZXIgMTYsIDIwMjYgMzowOSBBTQ0KPiBUbzogQmFyZCBMaWFvIDx5dW5nLWNodWFu
LmxpYW9AbGludXguaW50ZWwuY29tPjsgbGludXgtDQo+IHNvdW5kQHZnZXIua2VybmVsLm9yZzsg
dmtvdWxAa2VybmVsLm9yZzsgYnJvb25pZUBrZXJuZWwub3JnOw0KPiB0aXdhaUBzdXNlLmRlDQo+
IENjOiB2aW5vZC5rb3VsQGxpbmFyby5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
DQo+IHBldGVyLnVqZmFsdXNpQGxpbnV4LmludGVsLmNvbTsgTGlhbywgQmFyZCA8YmFyZC5saWFv
QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzNdIEFTb0Mvc291bmR3aXJlOiBy
ZW1vdmUgZ2hvc3QgcGVyaXBoZXJhbHMgZnJvbSB0aGUNCj4gbWFjaCB0YWJsZQ0KPiANCj4gT24g
OS8xNS8yNiAxNToxMywgQmFyZCBMaWFvIHdyb3RlOg0KPiA+IEFDUEkgbWF5IHJlcG9ydCBhIGdo
b3N0IFNvdW5kV2lyZSBwZXJpcGhlcmFsLiBJdCB3aWxsIGNhdXNlIHVuZXhwZWN0ZWQNCj4gPiBl
cnJvciBsaWtlIGR1cGxpY2F0ZWQgbGlua3MsIGNvZGVjIGRyaXZlciBjYW4ndCBwcm9iZSwgZXRj
LiBUaGlzIHNlcmllcw0KPiA+IGNoZWNrIHRoZSBwcmVzZW5jZSBvZiBTb3VuZFdpcmUgcGVyaXBo
ZXJhbHMgYW5kIHNraXAgdGhlIG5vbi1leGlzdGluZw0KPiA+IHBlcmlwaGVyYWxzLg0KPiANCj4g
SSBhbSBhZnJhaWQgdGhpcyByYWlzZXMgcXVpdGUgYSBmZXcgb3BlbnMsIHN1Y2ggYXMgdGhlICdt
b2NrdXAnIHN1cHBvcnQNCj4gYW5kIGRlbGF5ZWQgZW51bWVyYXRpb24uDQoNClRoZSBtb2NrdXAg
c3VwcG9ydCB3aWxsIG5vdCBjaGFuZ2UuIFdlIHdpbGwgb25seSBjaGVjayB0aGUgZXhpc3RhbmNl
IGlmDQpubyBtYWNoIGl0ZW0gbWF0Y2hlZC4gQW5kIHdlIGNhbiBhbHdheXMgYWRkIHRoZSBtb2No
dXAgY29uZmlndXJhdGlvbnMgdG8NCnRoZSBtYWNoIHRhYmxlLg0KQW5kIGluZGVlZCwgaXQgd2ls
bCBhZGQgYSBsaXR0bGUgZGVsYXkgaW4gc29tZSBjYXNlcy4gSG93ZXZlciwgYmFzZWQgb24NCm91
ciB0ZXN0LCBvbmx5IGFib3V0IDEgbXMgZGVsYXkgd2lsbCBiZSBhZGRlZC4NCg0KPiANCj4gQSBi
ZXR0ZXIgd2F5IHRvIG9ubHkgZGVhbCB3aXRoIGFjdHVhbCBjb2RlY3Mgd291bGQgYmUgdG8gb25s
eSBwcm9iZQ0KPiBjb2RlYyBkcml2ZXJzIHdoZW4gdGhlIGNvZGVjcyByZXBvcnQgYXMgQVRUQUNI
RUQgYW5kIGdldCBlbnVtZXJhdGVkLA0KPiBpbnN0ZWFkIG9mIGR1cmluZyB0aGUgQUNQSSBwYXJz
aW5nIHN0YWdlLg0KDQpCdXQgdGhpcyBkb2Vzbid0IHNvbHZlIG91ciBpc3N1ZS4gVGhlIERBSSBs
aW5rIHdpbGwgc3RpbGwgYmUgY3JlYXRlZA0KYW5kIHRoZSBzb3VuZCBjYXJkIHdpbGwgbm90IHBy
b2JlIGJlY2F1c2UgdGhlIGNvZGVjIGRyaXZlciBkb2Vzbid0IHByb2JlLg0KT3VyIHRhcmdldCBp
cyB0aGF0IHRoZSBnaG9zdCBkZXZpY2Ugc2hvdWxkIG5vdCBiZSBhZGRlZCBpbiB0aGUgREFJIGxp
bmsuDQpTbyB0aGF0IHRoZSBzb3VuZCBjYXJkIGNhbiBwcm9iZSBwcm9wZXJseS4NCg0KPiBUaGlz
IGlzIGEgc29sdXRpb24gdGhhdCB3YXMgZGlzY3Vzc2VkIGEgb25nIHRpbWUgYWdvLCBwcm9iYWJs
eSBjaXJjYQ0KPiAyMDE2LCBkdXJpbmcgb25lIG9mIHRoZSBMUEMgbWluaWNvbmZlcmVuY2VzLCBh
bmQgdGhlIGRpcmVjdGlvbiBmcm9tDQo+IG1haW50YWluZXJzIHdhcyB0aGF0IHRoZSBwcm9iZSBj
b3VsZCBiZSB1c2VkIHRvIGVuYWJsZSByZXNvdXJjZXMgKHBvd2VyLA0KPiBncGlvLCBjbG9ja3Mp
IHRoYXQgbWlnaHQgYmUgcmVxdWlyZWQgZm9yIHRoZSBoYXJkd2FyZSBjb2RlYyB0byBiZWNvbWUN
Cj4gZnVuY3Rpb25hbCBhbmQgcmVwb3J0IGFzIEFUVEFDSEVELiBUaGF0J3MgdGhlIHJlYXNvbiB3
aHkgdGhlIHByb2JlIGlzDQo+IGRvbmUgb24gYWxsIGNvZGVjcyBleHBvc2VkIGluIEFDUEksIGV2
ZW4gJ2dob3N0JyBvbmVzLCB3aXRoIGFuDQo+IHVwZGF0ZV9zdGF0dXMoKSBjYWxsYmFjayB0byB0
aGUgY29kZWMgZHJpdmVyIHdoZW4gdGhlIHByZXNlbmNlIG9mIHRoYXQNCj4gY29kZWMgaXMgZGV0
ZWN0ZWQgb24gdGhlIGJ1cy4NCj4gDQo+IEluIHByYWN0aWNlIEkgYW0gbm90IGF3YXJlIG9mIGFu
eSBjb2RlYyBkcml2ZXJzIGRvaW5nIGFueXRoaW5nIHdpdGgNCj4gcG93ZXIvZ3Bpby9jbG9ja3Mg
aW4gdGhlIHByb2JlIHN0YWdlcywgYXQgbGVhc3QgZm9yIEFDUEkgcGxhdGZvcm1zLCBzbw0KPiBp
dCBtYXkgYmUgYSBnb29kIHRpbWUgdG8gcmV2aXNpdCB0aGlzIGRpcmVjdGlvbi4gU0RDQSBjbGFz
cyBkcml2ZXJzIGRvDQo+IGV4YWN0bHkgd2hhdCBJIGRlc2NyaWJlZCwgdGhlIHN1YmRldmljZXMg
YXJlIHJlZ2lzdGVyZWQgb25seSB1cG9uDQo+IGVudW1lcmF0aW9uLCBub3QgZHVyaW5nIEFDUEkg
cGFyc2luZy4gSXQncyBhIG11Y2ggc2ltcGxlciBkZXNpZ24gd2l0aCBhDQo+IGxvdCBmZXdlciBw
b3RlbnRpYWwgcmFjZXMuDQo+IA0KPiBQcm9ibGVtczoNCj4gLSB0aGlzIHdvdWxkIGJlIGEgdmVy
eSBpbnZhc2l2ZSBjaGFuZ2UgdG8gc2R3X3NsYXZlX2FkZCgpLCB3aXRoIHRoZQ0KPiBkZXZpY2Vf
cmVnaXN0ZXIoKSBza2lwcGVkIGFuZCBtb3ZlZCB0byB0aGUgZW51bWVyYXRpb24gc3RhZ2UuIEl0
J2QgaGF2ZQ0KPiB0byBiZSBvcHQtaW4gYW5kIHVzZWQgb25seSBhIG5ld2VyIHBsYXRmb3JtcyB0
byBhdm9pZCBicmVha2luZyB0aGUNCj4gJ2xlZ2FjeScgZGV2aWNlcy4NCg0KSSBkaWRuJ3QgY2hh
bmdlIHNkd19zbGF2ZV9hZGQoKS4gQWxsIHRoZSBjaGFuZ2UgaW4gU291bmRXaXJlIGRyaXZlciBp
cyB0bw0KYWRkIGEgZmxhZyBhbmQgYSBjb21wbGV0aW9uIHRvIHNoYXJlIHRoZSBpbmZvcm1hdGlv
biBvZiB3aGV0aGVyIHRoZQ0KZW51bWVyYXRpb24gb2YgdGhlIGJ1cyBpcyBjb21wbGV0ZWQuDQoN
Cj4gLSB0aGVyZSBpcyBzdGlsbCAqbm90aGluZyogdGhhdCB3b3VsZCB0ZWxsIHlvdSB0aGF0IGFs
bCBjb2RlYyBoYXJkd2FyZQ0KPiBvbiBhIGdpdmVuIHBsYXRmb3JtIGNvbXBsZXRlZCB0aGUgZW51
bWVyYXRpb24uIFlvdSBjb3VsZCBoYXZlIGEgZml4ZWQNCj4gZGVsYXkgYnV0IHRoaXMgd291bGQg
bmVlZCB0byBiZSBsYXJnZSBlbm91Z2ggdG8gY292ZXIgYWxsIGNhc2VzIGFuZCB0aGF0DQo+IGNv
dWxkIG1ha2UgdGhlIHBsYXRmb3JtIGJvb3Qgc2xvd2VyIHRoYW4gdGhlIGN1cnJlbnQgc29sdXRp
b24gLSBub3QgaWRlYWwuDQoNClllYWgsIEkgc2V0IGEgMyBzZWMgdGltZW91dC4gSSBiZWxpZXZl
IHRoYXQgaXMgbGFyZ2UgZW5vdWdoLiBBbmQgdGhlIGZsYWcNCmFuZCB0aGUgY29tcGxldGlvbiBp
cyB0byBhdm9pZCB0aGUgbWVhbmluZ2xlc3Mgd2FpdGluZy4gV2l0aCB0aGUNCmlzX3ByZXNlbnQg
ZmxhZywgd2UgY2FuIGVuc3VyZSBhIGJ1cyB3aWxsIG5vdCBiZSB3YWl0aW5nIGZvciBtb3JlIHRo
YW4gMQ0KdGltZS4gQW5kIHdpdGggdGhlIGVudW1lcmF0aW9uX2NvbXBsZXRlIGNvbXBsZXRpb24s
IHdlIHdvbid0IHdhaXQgZm9yIHRoZQ0KZ2hvc3QgZGV2aWNlIHRvIGJlIGVudW1lcmF0ZWQuDQoN
Cj4gDQo+IEFub3RoZXIgb3B0aW9uIHdvdWxkIGJlIHRvIHBhcnNlIHRoZSBBQ1BJMDAxOCBkZXZp
Y2UsIHdoaWNoIGRlc2NyaWJlcw0KPiBhdWRpbyBlbmRwb2ludHMgYW5kIG1ha2VzIHJlZmVyZW5j
ZXMgdG8gY29kZWNzLCB3aGljaCBjb3VsZCBiZSB1c2VkIHRvDQo+IGZpbHRlciBvdXQgJ2dob3N0
JyBjb2RlY3MgdGhhdCBkb24ndCBwcm92aWRlIGFueSBlbmRwb2ludHMuIFRoZSBzcGVjIGZvcg0K
PiB0aGlzIEFDUEkwMDE4IGlzIG5vdCBwdWJsaWMgYnV0IGNvdWxkIGJlIHJldmVyc2UtZW5naW5l
ZXJlZCBmcm9tIFdpbmRvd3MNCj4gcGxhdGZvcm1zLiBUaGUgbWFpbiBiZW5lZml0IGlzIHRoYXQg
dGhpcyBmaWx0ZXJpbmcgY291bGQgYmUgZG9uZSBpbiB0aGUNCj4gQUNQSSBwYXJzaW5nIHN0YWdl
cyBhbmQgbm90IGNoYW5nZSBhbnl0aGluZyBpbiB0aGUgcHJvYmUgYW5kIHN0YXJ0dXANCj4gc2Vx
dWVuY2VzLg0KDQpJcyBBQ1BJMDAxOCByZWxpYWJsZT8gV2lsbCBpdCBzdGlsbCBsaXN0IHRoZSBn
aG9zdCBkZXZpY2U/IFRoZSBnaG9zdCBydDcyMg0KaGFzIGFsbCBlbmRwb2ludHMgbGlzdGVkIGlu
IGl0cyBEaXNDbyB0YWJsZQ0K
