Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849EE3AEB39
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791474755; cv=fail; b=OyfgM+hWqJbegIUU613kUg8R857E8qNJoEFvIPZ2uSTJeCzd6or6jDdpnnUoOl97iUbPlPUa/BOzceyNYK3icXr+KK5WDKs7dFXTaL6aqi28851Gb/rpfToOagNCG5+M9t/BA531ue9uHSRKnvrhHNddp9Gt8pCPg+tuwMS3RT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791474755; c=relaxed/simple;
	bh=xIM7WgY4Lo6NABCQaLyq+wI5/rkkq3PibhQDaK/IX6Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gSQCbe71s+vkL8ifRGQIffTqM3GQjoP9Sq89e+NFEQLMw0kWTSlBHcqe6AZSkXLWkCFhfPuIACOB/ZzVg84gzx3l0TIazSDVffyqKjVfmQv5gwAN+6B/fcxDwatcD4InyGmfmSKT1mUHFF9ZS9ZwCcQpyCeSgJh5/XYk/5XoBIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSuOAQD5; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSuOAQD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791474753; x=1823010753;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xIM7WgY4Lo6NABCQaLyq+wI5/rkkq3PibhQDaK/IX6Y=;
  b=PSuOAQD5S3/HHczlzPJXnw1WDR/q5aj8QdeDJMuJrVAFlrRqy8e3oj9B
   368eUlFiIujbhMPoM18RfQtltULPUm74O7vZEDSbCUbssbqFUx8QSP/Uu
   HDAappLCTePXS7YCnr6PC6T7tCI1UxU18wNlFahJUG6jIPvva3OLUbqa4
   ZA9Mw4c/vLK8XGiaV4hDnf51Qy8K8TOABcg5Xiucy7FnmqUq/CQRdHqBo
   MVV/ooXrRDIWEnUnhPSdJIWp7V1Eao+wyaZ2d7bUCHdURqXU2KrXOFFuc
   bFkhiMHIaA5eWyrUO141pOiUT257Qr2s6+sYD1ZHNk2rEXzHK4RsRYqX+
   w==;
X-CSE-ConnectionGUID: 5j+rEgVDTH2p6D++Cng99g==
X-CSE-MsgGUID: PKpCK0ieQpiRqjxHe9Phfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="269972"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="269972"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 08:52:32 -0700
X-CSE-ConnectionGUID: LGJw+92/R+SvuA0MJjqZeg==
X-CSE-MsgGUID: zEsXaet5QrSDEPHUAMwjDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="437760"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 08:52:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 08:52:31 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 08:52:31 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 08:52:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMokRfwFsOST0yjXWB75aL4+YSkWRO5UDr+fehAUBqXIITNo3mNfeQ+ReeHWNgR/n1/6f9YRyEkSGX+pa4S8NshvlptQDRsY12eiRbkfzDqRDU+PZeZkyYXcU5ayEB9w1k8G+dTrvWdJ98f0LBehDpbozjdyj28XR7qoABgVSxK6pFj6jku9jtqNyb2OPB2to6RVJ1IBpIynReNj7H1tgY+KMeGprPoiSzNjYlZF37rineK0FVuyftOj84C4G+/ks2DV/wDdAomlx0hFySceDHmnFoKa5F4bXyPkve8dQlZ/8UXmSMzm9RLN30PopB3RQmreUvwAMY0iMOltVfIHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwlWph+LMpMkGuZ3Sd4n/VorS+lAZ7cG1OwbGjSzYd0=;
 b=Girhjl5mBaxud8anD03CdXHEL9ytl0l3/7khAPtrj6NC5kII8nYHgrqdu7m8sxXN8obShlJUrWne9uOc9tsaIdr364UpjJSyqlSkpMJ4jNsGkPGFZs330s97lIUyHRA6R5YNw3NygoLLTvvplt4sZ1AfIFCUV/JxwKJj3y0IS6bcYcgofxc6S79snfDm8Gg347Z2Asu2z0ntojgaZTegVEZkfoBCZ0oGy697vQC4JbhbpBbs7m7Zdu2YGPeoMSwEr1WgwvMRSWEPmN5mOsYJTlmE7s9ib+tZA4rL4b55ZEF8wS3l5Nr+XIAkTEBQRGf7EN/rB19uqQdmGPwzPrypYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by PH9PR11MB681838.namprd11.prod.outlook.com (2603:10b6:510:419::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 15:52:30 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0496.010; Thu, 8 Oct 2026
 15:52:30 +0000
Message-ID: <b25e24fd-33ea-46b4-a526-d4121aaa3c26@intel.com>
Date: Thu, 8 Oct 2026 08:52:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] x86/resctrl: Add MMIO-based LLC occupancy
 monitoring support
To: Chen Yu <yu.c.chen@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <bfe91aeeb714f14e2d1a9c3066ceab0e62c3c231.1789705667.git.yu.c.chen@intel.com>
 <6999ac64-054a-4f7f-a62f-36f8efb129bb@intel.com>
 <asc_gEQv8p9Egi4V@chenyu-dev>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <asc_gEQv8p9Egi4V@chenyu-dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0125.namprd04.prod.outlook.com
 (2603:10b6:303:84::10) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|PH9PR11MB681838:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c8ccb90-3542-4461-573f-08df2554288f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 0vibKuCL0502+caEXNNk4wKyyjrFT7IVM7dAdbxKDIEdH4sLQ05VPZOBblNLbDOp8nUqCMzSPfnAamMPV0A15fWz1iXFmcftRg4zY6FoA1WwG3UhKgv8uQoYzCJCuE6Szyek3PCwRIEeyH9m95tn+GTjGJZCixRFNdzkE3y9J4XNpaZJ7FNHNWr3L23qjtZiERLdCh12U4Laev/xHe2QT1RhQHSPZ/NY30+ArD2w/n8W/U7QPwSSlcSp62tDXcqlTI9WPWhLFKG6zwCM7+y0qzNnx1x6Sq+5M35oFFmQI/MIxj76i8yZ5MteC6FFJ6hGIhjncU88ywlsgSU4hwcXYG1BmIk2PzvHvv1OLrk2TPH60vdfE2WDNTOalhcvTOLPsrhpAHIUXRfljQeWX32jMeNLsLEruJUVjOhN06zml3sunV+jjVWRAkGTPyM9/kVhk7j3IBMUNMXjDMmDfLmo/PtE+N7w6xWpHya5BOCovP7EIFwbonZoryJMhJr5rJtYis0FCe6OODdvkpwFqC/S8C+SYafpIjqBRtWqHTqvhZb2lqFmTAXCeQg50PVF/KC2zAQdkVEGDQmNdDDPdrCAl9CUnZIXKG/zPX98PvUZtX6FukHl7sUCHCC68vLjK6QpSaLZYwhJSnQQmbc4S+uV+Fl2eFfNVRgVjLABOY1sFHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTZ3blFUZzIxalF6YVFkcDVkMkZ5R1QwbXZPS2xzc1ZCUzU4emZlaWJFaVVp?=
 =?utf-8?B?YXBYcG9MNEl6OE14WnR1dFFWVE9rd3d0QU9LcklQck05TGY0d0U0MHhuK2g3?=
 =?utf-8?B?RjBJWUxIOEZacldOdlV2VFZKdTV4S2lMcFdLS3dOdGoveS9zeTQyVytNSkNw?=
 =?utf-8?B?NFhxOEZLTHJXQ09NbE5wZklVRnNHSW9PYndQMkkzSVo1S0VqczdVblU3MDkx?=
 =?utf-8?B?dUI1N3ZsOTJmcEdUVXJVM0hna1VpVnhIdXp0Z3pBZTlNVUswOHN5SHhIbGw4?=
 =?utf-8?B?cXNMbFRuSXlHckxYaVNyU1lsaDV4T2dVY1JmY3ZZbk5EK3ZtRlhtMU4xN0kw?=
 =?utf-8?B?TlVPREduSWdFY3BhS0lXa3hrSGMyMXZFODF4Mi90RGZqRjgvYlArZjcxeVQ5?=
 =?utf-8?B?azlHUnpmTUwvQWJuZ2pxNXJQTUlORVV1K0h5WDFQTjRveUlGU3U4eHB5Q3dh?=
 =?utf-8?B?eVpaM0tOQ0pkY2ZLWnBzU3BXL2xaZXczbFN3a2d2MkRORFR1bDN6WnpXdE44?=
 =?utf-8?B?MjIzUXlPQ1NEYktiTGgzR29QNkd2UVZwMGV0RmpFNHpnY2lpaGhYU2RabGpY?=
 =?utf-8?B?c3RZQkZHcE4ycTluZUw4WHUwYnJ4SjVCVXVhNGJzeVhpL2lOUjlwenNybVNt?=
 =?utf-8?B?VHNXU3h4WFhLMmlKS3ZVWUN0N3crUCs0dk1BK05VaEM3SGxpM2pNOGVXSWVw?=
 =?utf-8?B?b0hCL0o0N2lhVXNHc0JmNWNnbnNFZGVoU0puUHBxYU5BeTVDOC8vR1R2eXVK?=
 =?utf-8?B?cGJaWlFPYjR3K3l0MVoyaU9WeVJTT1ZydXBVTU55bjRiY1luWm02OHBKcmh2?=
 =?utf-8?B?M3dXaVVqU29xejVnaTIrMWczdVh5MUxvZkp1N3VvNlZKbzFTN21IekRqMkFk?=
 =?utf-8?B?ZW84ZVFVQzloenBDSEV1OTVFV1pLM0FXakNMWkVxMjZ4VXI2QlpsZkg4aVpH?=
 =?utf-8?B?RXR0eDVXRTJ2K3FTYWlNazBrbFZUNWpueWNVR0o4N1JxUmorV2xLRHliYkJi?=
 =?utf-8?B?Zk92OGZMNVFGaDVNdUt1UXFhbTY0eVpxQU5xM1dEZWFmT2FiY0U0Vk9IY2JH?=
 =?utf-8?B?bWRUSjFncXdlZmxmb0xSbmZWYitZcTROcHhvMkN5M01yRm92YVJkbzV4bVRF?=
 =?utf-8?B?elpvQkdDQUVrZVllM29pckE0L1pMUG5BdGFvOXBQVkFBMHlJR1BXU0hQVndU?=
 =?utf-8?B?U3Zra2RLZ3hEa05uTUFxMmdCS3FTeC9nVVVmQVBYOHBjSWkyRGRBUThQTDRQ?=
 =?utf-8?B?SG1pTUpTdjFxM08wdWVpN0g1TDZzYkQvR0E2cGFIaFVTMVgyRk1DWStJSXRD?=
 =?utf-8?B?a1pFb2RZNXBNZ3BrOFVTcTNWV0FHYW1JRWRuM2YwTndsWkRwbEpwSU9UR1dv?=
 =?utf-8?B?SXF0TTVyb09pcVdpWFFnT0l4ODVHUmZmUDBndUlOaWZvZzQyM0h1ZGttZm8z?=
 =?utf-8?B?bXRtU04xUEFONXlkWGRUSjBkRGtsMmM4dllXcmNiY012cmJNSXo3eWdzR1VX?=
 =?utf-8?B?bjU5cW1idkc4S0xVL0dVbmFncUZoN1hwYTRvWDIyd1VNWnMrdzFHU1g2LzFC?=
 =?utf-8?B?bFNuUUpnTFdpS0FoN1E0dy9TL1c1ZldMcW1OSVVIVnZZck43Zm85NTUzR3Bj?=
 =?utf-8?B?U2dTQXdDeGVzc29lN3VBcFFZK2xHcXVOcUNvUy9idnk1OXZPWUExWW5oNGtu?=
 =?utf-8?B?a3JWSWhMM0xQRVRUVVV6Uk1kazBWcUFSRExQVGppSmRZanROUVl0TWNEMmFs?=
 =?utf-8?B?UXc5dDR5RXJxKysyYzhVenh5UzkvVi9xUkNDUUpxQ3kvT0M0VFVIOHU0K2FB?=
 =?utf-8?B?MVc1MDdBeUJJRXN4V0NOb2FlRzNzZVNnVDRqUHhjQ0ZIMWttaUs5ckU1MU1i?=
 =?utf-8?B?am4zdVVFU0xibS8wdDV3UzZOWjFiaUt5Tk1XZjFPbWhuNnYrb2x1Y2dnUm5G?=
 =?utf-8?B?dFJzUUVhdDhCTFZ3WjVhWVBhS3duaGlCdGRPcjVwUGUzY3UwY3pRSXlRRFRl?=
 =?utf-8?B?ZmlMc2U4OU1sMDJHU0dka2JycDVHT1V4Q2xEZWdwNUJyTWpjYVM5b1RKQ2Nk?=
 =?utf-8?B?ZFMvU05DanRybGErM0lXT0lRaU1aWU8rK3BYWVFCN215R085UzRoYW92TjRJ?=
 =?utf-8?B?djhXazFsN3hoV2VMcFVTeERtSHRvdW9HclU1L3hGWFIzakY4YmFsRFhnT2cx?=
 =?utf-8?B?eS9tR20vTFRpREhjYTJ2OHZURFZycG5Vd3JQWjg1VnNjckRxN29qZUk2bUdi?=
 =?utf-8?B?OXpuc1Fqa3ZWL3cwQVJQR1BrSytnc2dtTDFoYVRwN09YNlRoNWpWdHY5d0JV?=
 =?utf-8?B?MVFqUWFmUzRhM0JMRUcwb0JLRndCOVNvYXFRbXRFYXkvYWVOUmNTV05RNWky?=
 =?utf-8?Q?V3I/i7fBkWusY9Uc=3D?=
X-Exchange-RoutingPolicyChecked: Ut0dPor9MeNCoIIF+mbHkD6DxZkk417orYXwZE8HeZ7AilSL5HM4CzPS0qVrfExid+kCrVcIp+0J164Uu3nRfUG03u4X1aZ7RSDK8fRkK4h72RB/i5kwjTYhw0DOS3iwklFgqtu0D/HF+OSzDyVHEmE5ZgfomDmdCQIWBieS1qSDn3PK3xAFCftlGR0TMsOVuUi8WYeCfheStgZC8bk2J4BNNIpgFP4HbVI0EYwmyZopJ9tk6UET+oLPdSyUIRPUzLBEwMir2iqdVhtuFtZ12vfnhi1la/wTINpfVQpP4o0RWiOUkBst5koAX+8XLR+MAxXPCIG8jI8sqrRbyBNTZA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c8ccb90-3542-4461-573f-08df2554288f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 15:52:30.0332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sv4+6/hOaF8zYaWUhGm0eTuu5oBu8VO9xZvmmMHaZA2HfDQfefCWhlGk7TfGftsFrxyhz3CU1Ty/MqVNRqU0HBnaPlLMzYbRgLPJgn0BwM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB681838
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/8/26 12:00 AM, Chen Yu wrote:
> On Mon, Sep 28, 2026 at 02:54:48PM -0700, Reinette Chatre wrote:
>> On 9/17/26 9:51 PM, Chen Yu wrote:
 
>>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>>> index ca7e67f976d5..135f2eb2a5a5 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>>> @@ -1007,7 +1007,10 @@ static __init bool get_rdt_mon_resources(void)
>>>  	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
>>>  	bool ret = false;
>>>  
>>> -	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
>>> +	if (erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
>>> +		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, true, 0, NULL);
>>> +		ret = true;
>>> +	} else if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
>>>  		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
>>>  		ret = true;
>>>  	}
>>
>> Would https://lore.kernel.org/lkml/20260916231320.14502-3-tony.luck@intel.com/
>> break this?
>>
> 
> It would not break this - because the ERDT exists independently of the CPUID
> query result, but the CPUID result should be the fundamental check before ERDT

Does this mean this implementation, that parses ERDT _before_ CPUID, needs to be
flipped? Is this required? This series parses the table before checking CPUID, leaving
the decision whether to use it or not based on CPUID data checked afterwards. This
seems ok and looks to support a simpler implementation?

> parsing - the ERDT can decide whether to use the MMIO or legacy MSR interface,
> but the existence of CMT support should be the first thing to check. I
> got the following feedback from the RDT arch:
> "Architecturally, CPUID remains the mechanism that enumerates RDT monitoring
> capability and the specific monitoring features exposed to software. The ERDT 
> CMRC table provides topology/resource description associated with those monitoring
> capabilities, but it is not itself a capability enumeration mechanism.

If I interpret this correctly a system with a CMRC table still has to indicate
LLC occupancy support via CPUID.0FH.01H:EDX? For the implementation that would mean
MMIO interface is only used when rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) *and* 
erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC) are true?

Apart from that it sounds like Tony's patch will support this work to make the
enumeration dependency clear.

> From that perspective, a CMRC table existing without the associated CPUID monitoring
> enumeration would create an architectural inconsistency, as software would have topology
> information for a monitoring capability that has not been exposed through the
> architectural discovery mechanism."
>>> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
>>> index 400973ebf2b8..f350a516d3d9 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c

...

>>> +static int erdt_read_l3_occupancy(const struct erdt_domain_info *d, u32 rmid, u64 *val)
>>> +{
>>> +	struct acpi_erdt_cmrc *cmrc;
>>> +	u64 l3_cmt_count;
>>> +	u32 offset;
>>> +
>>> +	cmrc = d->cmrc;
>>> +	if (!cmrc)
>>> +		return -EIO;
>>> +
>>> +	offset = cmrc_index_function_1(cmrc, rmid);
>>> +	/* Overflow of cmt_reg_size * SZ_4K already validated in erdt_ioremap(). */
>>> +	if (offset + sizeof(u64) > (u32)cmrc->cmt_reg_size * SZ_4K)
>>> +		return -EINVAL;
>>> +
>>> +	l3_cmt_count = readq(d->base[ERDT_MMIO_CMRC_BASE] + offset);
>>> +	if ((cmrc->flags & CMRC_FLAG_UNAVAILABLE_BIT) &&
>>> +	    (l3_cmt_count & UNAVAILABLE_COUNTER))
>>> +		return -EINVAL;
>>> +
>>> +	/*
>>> +	 * In legacy mode, scale is divided by snc_nodes_per_l3_cache to
>>> +	 * prevent over-calculation of aggregated monitor data, do it
>>> +	 * the same for MMIO based access.
>>> +	 * This scaling factor might need to be revisited/tuned for future
>>> +	 * platforms that support both SNC and MMIO-based monitoring
>>> +	 * simultaneously.
>>> +	 */
>>> +	*val = l3_cmt_count * cmrc->up_scale / snc_nodes_per_l3_cache;
>>
>> Please consider all sashiko's comments about SNC systems - from what I can tell
>> the comments are accurate and the SNC support needs a second look.
>>
> 
> Yes, I saw Sashiko's comments about SNC, but it looks like it's not a practical
> issue for now - at least for the current platform, I'm not sure how ERDT and SNC
> can co-exist:
> 
> The definition of SNC (Sub-NUMA Clustering) is to 'divide' an L3 into smaller L3
> slices by mapping addresses to different L3 slices. But the current platform with
> ERDT enabled has 4 L3 per socket, and it is unlikely this L3 is further divided.
> So my understanding is that, unless the real platform will do the SNC division,
> and with ERDT enhanced to support SNC node (currently ERDT is only L3 scope for
> the CPU agent, no node-scope domains), we can consider SNC. For now I do not see
> the need to consider SNC on an ERDT-enabled platform. Maybe we can print a warning
> if snc_nodes_per_l3_cache > 1 that the ERDT parsing should be stopped and should
> fall back to the legacy MSR interfaces?
Yes, if SNC need not be supported then please do make that clear. The current implementation,
for example in the line above, makes it seem as though SNC is supported but for correctness
then subtly requires it not to.

Reinette


