Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856463A1A54;
	Wed,  2 Sep 2026 08:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337572; cv=fail; b=YOxykgm6TIutkZaYD+0Qq/eWq3VtZ2odohgXgMUbN7QPV4LYuevdrY/Rv3IB3YNIgl42hIsckAb+1RiuFF68xQYUVIsht/rBvOwKiTwwAqGAaM2HC00pUGb1grnbncQko9e86bqAlIjDPNJroEcJvOqO3gpWyhrYEJVrIt9BYck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337572; c=relaxed/simple;
	bh=6+2LxvyeHZMVAzynhkyeHZTiLfxjTiZ52UwCMjeJxek=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rTaPzVAqmcX1FgN76DXpuTp5RAV70+6bx8JyHv+7dQWZhHIEsBDr8BB2Lkl/KkQF3XS25qd1xruvRPakGz0CE3BAM3RnAUOseXl0A2UULWbsT/q4RpeTcPXUVFXPzp+BxxkFE3FLIB2bLkDig1vrimFK6oOfj6hHsYhaYV3iiDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bq6lix6L; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bq6lix6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788337571; x=1819873571;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6+2LxvyeHZMVAzynhkyeHZTiLfxjTiZ52UwCMjeJxek=;
  b=Bq6lix6LIwBti8dhcDJ/Eeds8oHTKEdYfOZtCxGvyMQSxPmdWKdhBf8t
   h2U919GDrHzM5oefL8k/BV8Evk0s6pDpuACSgMXGwORfxxla7y9bKTY2Y
   KnJiLjTL/WsbcHQgULFcHEpmvF7uReh8CrvAxO1nSNCvBgdFVKmkboXj9
   8NP+ouY6rFiM1p9wB9+VcE1DlDIWKUhQWHarXbKIuW58/VFsx0eFB8WNw
   dtuUSBbBUvCtmWAeu3qRnppcv3JVnIfAGGSv5RjdvVdoMs2HgnG7MATTJ
   0MVJsWG6QsIb4KIpMloaYRjIISphT0bplzmuA95SB7Svpls1gLn0t9k94
   g==;
X-CSE-ConnectionGUID: Th5y1hiHSxK92jVjNGlAew==
X-CSE-MsgGUID: 8DkzpmZJR62VEU7YeB3/Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="88994797"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="88994797"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:26:11 -0700
X-CSE-ConnectionGUID: wHuUifH/Sm26C4WehYOvTQ==
X-CSE-MsgGUID: 3RI06taYSBOqysAynpEanQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="294180969"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 01:26:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:26:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 01:26:10 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 01:26:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aB671beNmMOytkeI3L2zbG0H8F1o2mYkKPzaNk1ev6n9TgOpRZ8/72A4iZLBfbEpjaXUEpe4kkOwukTA7nwkk3LOUhO7h0yZtErx/XPXEMYV+Ol0ANhbgpteTzX8OHPZgm0TpwZEFe0L5QPWK6zBQjtj/rel87Al9VJxHNgdHUpu8fc+p6YXupW7fY0qKHVgfm9GauyMXLgeqRyJ6MlEI/Pim0kgWKq32eqo4WIbBloRut7dSb94pz1TS1Bwc/VHErFY8G2IfCjK3ri+kwkpPcmZu2GCLIxfjXdVEM1I/ebpvVkWMcB6iqXIaDeypa7oMFd3fIKsQTkM47y3gZJECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARjKCbQplbaEbk+cD0bIQrCDsLab0A1OFwjteR/J2/Q=;
 b=hfkhiG9a61Sj/52f5nfwDrTXcEdD99XY6n84b6c1EniTzhCZ+5ii5Y7SNatgiXFVXHlh8En2PkUb6JNsjmeKWDdXusxkqALejWl+VSxLaeSnFVmU+7RmbBVLZqycSPNvPXzjtfFn4joFo+iK1PQQF4xxnoDfwsslKczG0ZUm+8h4IbLtF8HqlgB+LGwL1pJKQE37e6Y+5p3GvgnRxqBRS4ePyXz4taXB6mKKqjTNEtLVKMKlGBRhR4c62ZghZWx+RgTh9AZoDRahjMIwJboOTrWypJD4bDdDjmG8vweg8MPGJfeRXxvWMwUnqGC52uqtF8fc7O3UqAF07z4P+0w+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CY8PR11MB7898.namprd11.prod.outlook.com (2603:10b6:930:7b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 08:26:07 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 08:25:55 +0000
Message-ID: <83d7a9ee-e164-4f02-b83c-31be3fe43fdc@intel.com>
Date: Wed, 2 Sep 2026 10:25:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/2] ASoC: Intel: Add Yoga Book RT5677 support
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
CC: <liam.r.girdwood@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <perex@perex.cz>, <tiwai@suse.com>,
	<jekhor@gmail.com>, <linux-kernel@vger.kernel.org>, <broonie@kernel.org>,
	<linux-sound@vger.kernel.org>
References: <cover.1788286335.git.mauriziocasciano7@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <cover.1788286335.git.mauriziocasciano7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0573.eurprd06.prod.outlook.com
 (2603:10a6:20b:486::8) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CY8PR11MB7898:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a3753cf-a274-46e2-dbc4-08df08cbceea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: nrr/B5aBwwiVd/8iGQGADqPvCXtrZLkB06UC60gKTq8GfkosxArEkr5FPWiCISwrgVBDCcoej7hBGhFG7bVA8w/44jaZDMLBc64VUGVTuTmQG9YfNMNh2m0zFF59tm4EXKd2KPjTgKdkL/LJoP5DJhLqNcyaVVPkLY4OhgnHSONJNdSKDJBPa1kcvfF6U1ez3XAR7QSWxxqllxqIjcr8a2ka3w0QtM9UA/obWkEwQOgz5ZySfSzULcw2u6Fagh8clQIgTPGIVQG7P6ze2mpmSs3EQZLdRGNowzRnbn99aBJIgVdD1XAYv/rmaarpZj+c5AygLR8d61WxN3MdLAUGfwgKnttR5LRAKBX2+IE5uE21ROdU/wlc6fLQ++DFNXt82yPgUwqVXwKG8r5PsHWoC7waL4orSxSfo222wm0FSy+OqGH/HDrWdhHAnpB6DUY2EV7fydzoSnI5VUtDdUDKN0IAjwLmJEXnoHHUCaZi9fwE7ZW1Jejw3o22cIn7G/dDli/x63eh8DP/kxuBt+2fP5yy28lB6VuF3dfRdWjWDl6m/vrRUQTm6tUH/3EdHFBR87PePqm9Dy3r9sqvWnqMn6mxq3ecOVNB/zc4ZIOcNr3HTB/BOS/+kNVdh+OmPmwwB2L024e7hJFJDEyW/xI1J4QCQGXiCeQXXIfCJPprd1k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTNqdHRKTytxU1hLQk04MEJBV0ZnOHJQeHdZdjZkV0dZVlozR21nSnZYUHVa?=
 =?utf-8?B?OGFKVHNMbzFCeVNJcSthSmhXd0tDdTNYbktZRTJyUTNtSEN5RUVFaExlOThO?=
 =?utf-8?B?emc1cnN2cTdna0lyNlZOcGQ3ajVwdEJsSE5XbHI4WUlHLytDSi9FdXNDYW84?=
 =?utf-8?B?T0tDN3dRZHdIbkhGK3hjV1RlR0RXREYzZll1Y1Azd0ZLM1U1cVFzT0ZvcTVG?=
 =?utf-8?B?cVk1VGd4Ny9EOXE2ZWZ5RGNmaUtqeTBhQjBjbDVsamFweHZ0Z0FXYm93V0xK?=
 =?utf-8?B?RS81THJ6bXdyemVscjREOG0ydUwwc1R6dVJTcGpaaHc2UHl4b1Aya0dWMXJ3?=
 =?utf-8?B?Zkxtdk5Ca0tZbEMyMUFMNENVVnNFWVZjcytMdFdxc3ZtT0tTVlpTK3diMXBn?=
 =?utf-8?B?dnluWjB0b1FiOEJGMlVRM0xOb1IwOFp3Yzk5MTFkOHF0Q1FFL0JoNHVSL2li?=
 =?utf-8?B?YWQwQjlTdm1qMXk4TTVPdU4vV1RDOGNlT1Y0NHhpYXJFc1VsY3FZSnlxZzdL?=
 =?utf-8?B?Qm11VHF2R0dnbEkvcWZlLy9mTXZRd0NndVUzUXZsZ2VtekpBNG5yQzZ0TnM4?=
 =?utf-8?B?a1BqMVVKY01YT0hYcmVRc09LK2pEMTdPUUtRNnk5SW42V1dZbVpOZ0dRbUFo?=
 =?utf-8?B?bkdIYndJY29ERW9Qd2JVVWVmZ1plQWF4Smg4UzhoSlhOVm9qUjBMMG9IYmJj?=
 =?utf-8?B?S2FEcUF6SVhNeWtQZzVWRE45elEvY1ZwZEZ3VGYxL2VqY1ZUL0QrbEYzWVhP?=
 =?utf-8?B?bjh1czRSWTZ3Z2dJMUtxTkxEbGdqR2RlcTNEb2dGam5QRWx1TW95SHRXbUgv?=
 =?utf-8?B?RWVDbkRQODVzTjJURXhRS2hGWE1LUmFiRk4vMDg1SzQyMFkrOU5YWGNiT3V3?=
 =?utf-8?B?ZDF1R0tnKzBjK3FoZ1o4ejNTTDJGdG1nSFlyT1g1STVNNUNoQ1VEZ0o2Q29W?=
 =?utf-8?B?ajluVFhOUytMK2M2UjdSaGovQXZwRUN6ay9FZjljNC90VTdIYmxCbEdod3hq?=
 =?utf-8?B?b281Qk9DVTlBMWIrZUYvaFhmSmVmajIxL2kycUo4eFVhYklmdnp0NWtnTnRH?=
 =?utf-8?B?b3RVTW9GZ3ErSnhwdlVDYm5PU25HRGI0RDF5YVYxSUhBajZObzBzaW9GNEZ2?=
 =?utf-8?B?NXJTSng0NmtOdzVaZjExV1RuMUlQVUNVY0hVK1JXbnZ0TjJHTU5tdGlZVzBk?=
 =?utf-8?B?OWRVRXJkR2txY2UzQUJhb0NhV2R2c0NEVjRLSjRoS1o2Y2NwdktFNHBJU3lT?=
 =?utf-8?B?RnFGNnQ5ZjVtQ1BUR1lPNVdMbHFqcThpTkt4ZmpLd01KaVZuQnBmaTBEOTlO?=
 =?utf-8?B?b1lGdGNrK1Y1dkZaaGdDaVNtdThDZXJ3dCt1dzd0Si8xWkVpa3VRSy9SdFE1?=
 =?utf-8?B?ZXV4T055czZSSzVrSFBKYXZ5TkpHZEhIL1RLakRvdk5IM3hjS1pxQkZub2hJ?=
 =?utf-8?B?YnFPK0JwSXBKWXIwd0FtSHZFSmNlUXRsUkZjOHpTaHRKM2dWQ2U5K25sWjlk?=
 =?utf-8?B?STU5Z3ZMNXI1MG45dnBxWkpza0xHUjRkU1hoVUVFd2lKNFZqU1pCK3BJamgx?=
 =?utf-8?B?U3RVY3YxbTRsL0k5cmZ5YUlNVjBKeENTc0cvSzIzc2Mvb3ZlTHFWSzcwTEox?=
 =?utf-8?B?Vk5DZWJpMm9NNHB5YlJ3WWVyVlpaM2RucWJGRHpnbTN3R240WTg2UFhhbUl5?=
 =?utf-8?B?dk5HUmE5Q2JYSVkwb0Jid0RRZlN5cy9QUmRaRmZsWjJhc1NpMStQMnVtMzRq?=
 =?utf-8?B?WUJnMDlXYU1MejJYa2NHaDFMQ2Z3OU9HQmZsQlZGdTNOanRPM1B4M2VFT0V6?=
 =?utf-8?B?WWl3RHF1aURGNHk4WStXbUZOWDJBa3hPc3BRaElWTzg4MTQvTkI5c211SXdR?=
 =?utf-8?B?MklVNHhxLzh5cGZSN3JmUU9ZdU14dDF6UlRKYXBRZzJ0WnZLdElMcUFpdmZO?=
 =?utf-8?B?em5kNStxZmltYk45VzBWb2J0c3Q4SXUwVGJudVBERlBYVGdnVHVGWTBGM1VJ?=
 =?utf-8?B?RUU2U1Byc3VHZHBMRUVGdFBKWUZ0V0JUaEpraTJBcndsaW1KaGZzd1NjRGZ0?=
 =?utf-8?B?dEFPUzRtMjBzNEpNdW52anMxZ1E2WmRweUUydUFxZ2w3akNGUFFVNUFsd3c0?=
 =?utf-8?B?SHY0bXR4VG0yWDZTSklSN3RZNEhPQ2h0OUFSYXZyNndybVVMWlljcDFRSHNS?=
 =?utf-8?B?U09ERzlDQnAyYm00eGxybGxFTGpXWWNMMjVLTVczbCtzeXhJOEFHS0RoOVZT?=
 =?utf-8?B?cy8rczV4K2JubXo3dGh2S25VZDJra3ZXMmdkSXJhM3BkZll3SFJOYnlEbnlY?=
 =?utf-8?B?aGEzbzNPSE1KT1FvbUdtY0NpQjMrZngzTGV0b3JpNXBlZGpHWFZ6S0tGWFdq?=
 =?utf-8?Q?m/a8bUVIV4hH+C4A=3D?=
X-Exchange-RoutingPolicyChecked: c/2PhYKeE4IeC8Rnpg5LAYtF4LD4xW/oc6iL6Op279fFpM1MaYLIJMvPa7M1xctXkEep+0boxRBIDU6BvXxXBvXWpxAqW3vq8PHVfCyCMweiR6ZCq/hjfJnaAc/TF1cZGxaPv22YeRYTjkjLADZtqlvGX7i2FTvDOo/G8MhQXq4NWPhSnEE4taCX+OtgUzRMEBPx+yfhsT7Cjh7GVmLYfubLmrZf5UBig7FFQTD4Im/Qu+1AwbIFKgfC4r9IOnpf1Y3ZGBaS4q1/DDynE4aFR6LlFQSnt8bUrU0rvqR0vE0lami7nCWGIdwR/2xzsG+ImlB4jFPTa/4XKnlVHGvxOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3753cf-a274-46e2-dbc4-08df08cbceea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 08:25:55.4968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aFDH5DXgF436qruVynBUOTYReEGLuiWOqPywgJfLQCpHWzXQDkmKro6zFn+qu53I4vT+r+Xol/oVLmjsdZdlvb6LsCmgKbkjVV3oUBYyhk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7898
X-OriginatorOrg: intel.com

On 9/1/2026 9:04 PM, Maurizio Casciano wrote:
> Hi,
> 
> This series adds the Cherry Trail machine driver and machine-table entry
> needed by the Lenovo Yoga Book YB1-X91F/L with its RT5677 codec and
> TS3A227E headset detector.
> 
> Only the SOF path is enabled. Legacy SST is deliberately not advertised
> because it has not been validated on this hardware.
Before I move on to the review, this is contrary to what Yauhen claimed
in v2 [1].  So, are we just rolling the dice here?  If you have tested
both, it's OK to have both supported.  Changing in the middle of review
does not increase credibility.

[1]: https://lore.kernel.org/all/aaYRd2Irw8bOpDL0@jekhomev/
