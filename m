Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC09C4CDDE7;
	Fri,  9 Oct 2026 11:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545152; cv=fail; b=Tzg29XeAX3trux2JzTK8a3f2VFLRbDhvSWd2AJ2q0YIjJ4k3uFyguc0mHJYXGMEYS3iIlIfGOh2rvH5zJtHYazrjuzpmfnL/ai6e7vADs8k+1v8bDwsgv9ZdExe6tudpnb8isZu2lZlDo73orhaBelHEBYj6NeLJN84RAopGXAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545152; c=relaxed/simple;
	bh=6k125EOUrQhSg9/AURp5MxCxGT4aejrDJgIyHqoKxLs=;
	h=Message-ID:Date:Subject:To:References:CC:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ofjjdQr6Zo6Cv03AvXzd9EWlddE/jf0QtvexLhgamm/B4lPxSBVJaYdCUwNndjx4Rte5myTFP0F1uvsDHm9zRvjmtLowiszwYIsCWd6mCQeNy/xs56J0DwZBmKD6Pky1ibTuQjOHYaHbhVlUpCdpa9lYMR6Pntm7Goitsl7dPGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQdPrzUE; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQdPrzUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791545145; x=1823081145;
  h=message-id:date:subject:to:references:cc:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6k125EOUrQhSg9/AURp5MxCxGT4aejrDJgIyHqoKxLs=;
  b=AQdPrzUEeSjRgtBJvnpzw865P0ieGiJz31EnVKTVXgDEH2u1okK31mLr
   OrT+dQCQDi6IrWxcfnl2lcGLZKJnAMRW9KRr32GcaFCdjnTD+8l1RFnpI
   wAFVpS0PX48O8gO+bNAvcbyjLkI8hl6ZJev8CzdQNP2INy/kgqwJTLWn8
   ZpPub+SvjX4hTVBC7QFpwjIQXkx5UlsggtHJ+g+ZlyQOemWafBoIZqV5q
   oZwujdD9fP8Z1TPlfT4w2GzwkIloFBlNdyJBEuC4nsJzYXiiKMjzRKA8F
   da1Ybi3dSR5ZoBNg3FZ6whH85zH4zBh5eFSlYFmDvu5fwDe/n/T12va9v
   w==;
X-CSE-ConnectionGUID: LMSB2R/IQOCiPU63Q0EIeQ==
X-CSE-MsgGUID: 50hKUv7bToqtNFPhpCwyEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="243528"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="243528"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:25:44 -0700
X-CSE-ConnectionGUID: woROhCUURbe2fN6pJ+WcsA==
X-CSE-MsgGUID: 6va47AKsTsW6ODJG6igLew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="619775"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:25:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 04:25:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 04:25:42 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.63) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 04:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2rf4MOKP9XLIqw6IKzx7kreIy/xNVgMea6b4ggpQHgyp4zGUS5IF6DZKjh4p0ChmLGjct8RsWe8f9reahhCx9pOOAc1Ny5n31Mr7wMq5lWJEEv02brFPcdE7q2GJcokm3TQhXk/g7VTZUfqU5MuqRXjvK7cKXZBkSbRv3mjA1wC4UmhTJwBnD81E+S9IyC5vlTmToDHpdshfMgM2EEszllQT2WnnQxF86IH7d80vPd32r/jksLoibxLeIR2saRk6bWzbLJ4YzDmAci9FIK0RPAWkYLXtt1+x8CjJJkjHqGx9OM9VLE0exkjTDVm4Lk+pvEacLwMyN8ktletaP20eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6omFu4x4lIlhC2dCvJ7vVyU9j1paEZ0TN2Fgnu5NZhc=;
 b=gbDCdX2ZjCLndhImG1csikn8/Fk3tlg0JhfDKOsg7PsZpUOFAEq9GhEmhVdlxMCK4R8wTgHYzgUSUtIsaQHQsW9D6qSAFvKHKrViTgiZwlLc8bce15suAF6VtBiyG9yRcV8AdYkKy+Y3vqGaQKMxARe3VHoR7SpyIrOg4eDbW9OXU7SXIcNRm8VsS78Zz8s1q/QelJTL8QsGphDvSIluAEp1u854DP+wMfHif2jXBkdJdMcNFrPiXWbauf/xxBkcSlIxMYR7DocBUU4nbKuEuFCFoc4c45JPwZuBx9Ky9u4SDtP6nS9eL4cDN1K05w2kHnnQkZGsl0IK3fZpFo+g7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SJ0PR11MB5939.namprd11.prod.outlook.com (2603:10b6:a03:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 11:23:55 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 11:23:55 +0000
Message-ID: <6c610758-5f34-4408-a6e5-f3718218ba94@intel.com>
Date: Fri, 9 Oct 2026 13:23:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] ASoC: Add support for Airoha AN7581
To: Christian Marangi <ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Content-Language: en-US
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>, Rosen Penev <rosenp@gmail.com>, Daniel
 Golle <daniel@makrotopia.org>, bui duc phuc <phucduc.bui@gmail.com>,
	<linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008B0.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::65a) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SJ0PR11MB5939:EE_
X-MS-Office365-Filtering-Correlation-Id: c080b978-30d5-43ac-6bbe-08df25f7cdfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|56012099006|11063799006|22082099003|18002099003|10067099003|3023799007;
X-Microsoft-Antispam-Message-Info: 41hVtRS/hhSreG23NTzo2zneZ6NzjES707aHVn4j3HULlOoLyMv0qAiLqlBZ+Huf1npbrD0YVMrO5TYbbic65rUQrJnos9j9CArHiTGUn6q6a/AlnOw8wYBI6PsTSZquT5ZFc2LorLyVl9f8YK/LNLE6euJpje6VT/SslIBOdYovVNOUFkBW5B4FCvn0CUyVOkzXZHbFRe0+i7tOd5Jc5s7dbc1bCg1dy7lF9Xr0DqN+/6v7Tq+zbgbPAS/qjnSRXPMAKL1WEceg9npeRwK1jjaqofEoefItohBSXEs3hfWepehA5Tu/1gwQPhVRYkUkfjPIujHtJvCHoXXaYBP60fI60EAr+ea7mgJRchLQ8ejTFfWeDmQ3ZW9nCzNY9e5WAlFpmXmJi50GEbw7ZyzK/FR02TPVf7ZTeHDk1WvWnoTsapDBflZMMzPBKmSAXZ8D0avdF2NDwdZkGBFyUTgQoFx0Gtrh7DfT04fDwzpnKIqtnXGnHNY9f+a6NoueGjZ7J7dUe9ozXuQF0/2zeuaPvCanKk0bJNsLGjkpCCn5EUNh8aV1quDOxF2FwOtFyG8HBg2bLegzVbzw9KUNvFt4UcoZQoatTtipRwbtAq7MH1v2EM2irJjy/TrsYEQV7vP4AlVr+YP8PT0G7VcwbHYm3lELG+DE+rTbGyiSEj83fU0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(56012099006)(11063799006)(22082099003)(18002099003)(10067099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXFIaE9nclJUVENyVjRncFNxT0pTNkRsR3h0Y1dtT2g0SWlhUTJNQ3N2RHgr?=
 =?utf-8?B?K2Fid21PZWhWeFVGZnd6VU1YMFRFNk1zc0FZNllDendUbjN3WXdRY0pwSmlW?=
 =?utf-8?B?V3JSbzY4eDdwL2VyZlFZV2tyTXZFa1ZpMTRKSCtpVDJJN3lISlIxbmZUTTk2?=
 =?utf-8?B?cEFpYjNQMG5ENXdtcXNQeWJWeG1vM3hFbXd1WFYraFA1RmE1OGNPd1NIdXF5?=
 =?utf-8?B?ZEVLcGxjL21YNlBXaEEwQm0rMytPamkzTEdrei9Ib2ptR3BEUTlOcmlCeUhy?=
 =?utf-8?B?V2VMeGRPd1ZYdnl0ZWpnWHZTR2ZPbmhBZ2g1bDVWWEdRY3U1QWFnWFVJaFVH?=
 =?utf-8?B?Z3A5eVlGQWloMjZCaml0L0VZT3p6ZlhyMHU5NDR6NC9ZZ2pCaU1BL1VZQ1dQ?=
 =?utf-8?B?RUoyTXRMcGpXUFg0dFc2cmZ5QnlQTWZTemJCZjBNWCsrSUZIS1RVMnFDanE1?=
 =?utf-8?B?UHRUTXQvODgzWmlMYlZ0S2kxK3AvcVFZUWl5aHBWQXBVNm9OY3YrRFhxdHlz?=
 =?utf-8?B?alQ5UzJ5enBqMjdlOHlTdHpxN1F1SEYxcGtYOWZmM0huRmNING14cUpTRUlX?=
 =?utf-8?B?dTVnWXAvZlFpK3BHajJUZVowUGpyVjZqK3dCVGxsN3BZRnFMTSsvUUdvWHFq?=
 =?utf-8?B?TUU4U0ZuNnNtdDNsUE5NSjFBbEpRWC90Qk9EYndCSWFwKzZDLzJ5czhDWjRI?=
 =?utf-8?B?Y0ZvNEc4RkdDMHhObmVtelVVZzNDZ1pDS1lFQk5kMHg3UWF4MXVxVlRib1NT?=
 =?utf-8?B?T1QxQ3hRRkNVbmF4UXJ1OFVaUGR4aVZWU0tkS0VwMlZKdGwxdkJpNnd0OXU1?=
 =?utf-8?B?b0tkdGdTWXU1UW5qZi82azFQc1k2L3NZRVlTQWZ1L05ORlNMY3R3SnpYSzAv?=
 =?utf-8?B?TWpndmlYU0U1QkRnYy9qOTBBekY3eHZWOVFiSVBoS0xxNW4xcjdtYXFFVlNQ?=
 =?utf-8?B?Z0NITFRqQjd0MGtMMUVWS0FwZEticWhBeElvcy9tb1RMOGE1eEUvMTJPbFZt?=
 =?utf-8?B?d1o2YTk1OEhpNm9aNUF4eU5QUTQwU3Npbk1Ka0lzTitldnVsa3FhNjhqMS9w?=
 =?utf-8?B?YXB0aGs2L0k1Rm1Oa2xDZElUaGJtbzhTRXpUTC9aNEZVZ2MzbXNPcllEVHVv?=
 =?utf-8?B?ZVVCVzBWeVI5aXlPQ3dtcCs3YWFhQ1JGK1h5cEhSVmRlYjhZa2lRNGpOMFQy?=
 =?utf-8?B?NUtjUWNXWXkyQnRFODFWSkRPYm5vbGFjQzVDeGtUTnR1RG1ub1lDa3VqTUFw?=
 =?utf-8?B?QzMwbXVkYjBVemFZT3NWSTFvS0FhcHdaa3NURzltVzhvbG9JeHJtRjhnVDU5?=
 =?utf-8?B?UEVOUWlIRkhnYzBPa0I5b1VqVnN0T1VVRXduUElEMzhRclo1dHFiK0MweHQ1?=
 =?utf-8?B?YXFBUkIxMnlYclZLakVDbTI0Uk5peUp6MHRpK0tkY2diM2VvZ0lJbWdqUCsy?=
 =?utf-8?B?dTUvQjlvdG9wVWIwZlNIRVBuTGVBd1o1STkwOWhueFJveUFIb2ZZSk1ua3pI?=
 =?utf-8?B?MGdqZ0NwaEpKZ0xIUVpTVjgvM3pvcnl6bkxua0pVZkkyZnEwaWw5Z1pkend5?=
 =?utf-8?B?dU1EbUxSUDRlZC9wczA1Y3F3cnRubjRCcmVSdUxlcW50dGI2TFVmK2EwMFBh?=
 =?utf-8?B?ODlML2t0MWdhcU16MGh2dmw1MnBvLzlUbEN4cjBIRDVtRU9NMmJMcnJWODhh?=
 =?utf-8?B?YXhTaWVxaUI3U1NYcTlZcVRDckxNUDkxcDRBcFNhRTNQZkdIczA2SzNqNldk?=
 =?utf-8?B?YlFLNmZiOFgvYkZHSUUxVUlFa05HYjEvRkwvK25CcVM0WWxhbnBvaDROMmRi?=
 =?utf-8?B?NWMrZmlsa3ppc2w2end3dXp0anNYV21VSjN0TjlkUjB4T01lREVrUnlqUGpP?=
 =?utf-8?B?UVJ6elNlRW12VlVPWVc2bm5WenMvZVJqeGxVYXJHdEdXK2NZOEU3TGFKTTZB?=
 =?utf-8?B?MXVNY215Nm9wQlF1V1lYMGNoVzVhLzVVMjBqeGIwcCtFT0VEOTVuLzQ0Q1Aw?=
 =?utf-8?B?c053amcrdll0eHdzQ3ZYZEIvbDYxNW14OWV4dG9LVzhBTm1tUmJ5ZVArWElE?=
 =?utf-8?B?T0FWU1o0VTh2aG52eDJMYTRhYUdOSjFod05oSFZJdTFQTXB0dGwwNkMzMGFS?=
 =?utf-8?B?OTBRUTd4dE9vMUVMQ1hKOEN4cUZvakgrWVhxdmNmMVdzcmRJYStwSnEwQWxX?=
 =?utf-8?B?dlNOdDNxMno2MlJtbGhKQSt0dHhkN0ozS2lCdU8xNFlpSUZCV2FlZUJVeDI3?=
 =?utf-8?B?d0hSMDY2Y2VsYVZEVFFrN25jb05lcXptTHZwUWxTeXpJZHd3bUdldm1EYVVO?=
 =?utf-8?B?QzJiM1ZqMDN2Q2RmTGFkbGFmZFVFaTZZQzNnQXNpTmRlZDY4YUV5RmVoSTQ3?=
 =?utf-8?Q?IcBKI/M1lvNaZR+8=3D?=
X-Exchange-RoutingPolicyChecked: 07liWeMWp6/v84WihyKYlE79K13eFC8roTjA4UH5/mXQDiI5Smc9OYDK5so9dMCDx+zhQsVUHhx+5/jVe3K+rLjNRM/G1rMSqUJ8ovEdUP1pSg8E6yl5kqlQZSfFPVvrh1NpWzTKXL77JQ/JKn8SWitV11Deb+yDDrvUblGmerKdn/5RYiRkNiiZ0vsqbwpq0Al5pbL3c6YOsti/3qtm31dS67MRS4bg236qSPWc6Clx7DDY8hHOzU2+ekzNm+5J2kNlz4hbouT2ciK8S4pOkvVuXmsZPF/Snf8rqRPDb5WPIhJBpRBB/QML2TMqRcOGzaRDC4zu6TSjZmzKnlETwQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c080b978-30d5-43ac-6bbe-08df25f7cdfa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 11:23:55.5450
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAE9fc326D363fzGIDB8YPI/1S5E3q0hcW3kZ9M2l+c34n9Rw/nnQP8UqYtqvqW6NsWWo/2M0kmnaQT7jTFs1tVuwXJfGZD99plfGTQQye0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5939
X-OriginatorOrg: intel.com

On 9/8/2026 11:04 AM, Christian Marangi wrote:
> Add all the patch and documentation to support Airoha AN7581
> sound driver.
> 
> The card follows similar implementation with Mediatek with
> the codec present on i2c but with a simplified implementation
> register wise and additional frequency supported.
> 
> Changes v6:
> - Fix PCM probe allocation logic
> - Split driver patch to dedicated PCM/ETDM patch and machine driver
> Changes v5:
> - Address comments from bot
> - Better handle concurrent irq status bit
> - Protect enable etdm
> - Add Review tag for documentation patch
> - Address formal comments from Cezary

You've not included all the reviewers in the Cc list despite addressing
some of the comments. I hope that wasn't done in bad faith to avoid
further review.

> Changes v4:
> - Improve Documentation YAML
> - Move IRQ regmap to mtk_base_afe_irq
> - Use mutex for user tracking in ETDM
> - Register IRQ after memif allocation
> - Address suggestion from bot
> Changes v3:
> - Major fix to the ETDM code
> - Add duplex support
> - Improve Kconfig setup
> - Rework and improve YAML schema
> Changes v2:
> - Fix wrong edit in MAINTAINERS file


