Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBAA518134
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789081; cv=fail; b=tl4QcSShndUh4KALEj2cZI+umiB3M5/i8CO9pMSjDGQ4AKgn5uJjIVrg2/OWFOkvDlziNbTdPnQoiHpJcFHaU8HNQhkHZpyBOYPkBHbg0yQO4xF3IMD+Y+tdnqN8+/tJF6jvluR50d7Z1vp5syzv3dZqqZak5HCGfimoutM4kFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789081; c=relaxed/simple;
	bh=zyEmjYbpd2u2+w1dKbQFFarTBWgE2V/yGIPDx6S/js8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sG9UXUUUILtEzKY/aZNIRkWHWaSn3jwhGNv+fV9nccKpzldDlmERA2YyvLXeEYlgv3qTGeUGK9KOZXjjcZREcaDxdxPq4ZXU9i9qsC8jbawTMKevG9edjKpvza3DFmdjApDq8sE9Q5NURYLX4sV2Ekv8pAekeFb9OMF3z8aWrDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KYVF2i2q; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KYVF2i2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789081; x=1822325081;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zyEmjYbpd2u2+w1dKbQFFarTBWgE2V/yGIPDx6S/js8=;
  b=KYVF2i2qwhpNONlB5y+wJocwbTUBKYjepmsAn++d9yFU0idF+YB0jfq7
   nmH27ZB1vWeXvLMu06qa/aLG8i3tr8Dhv0k/YR8m1UI59Lz6VtLmRJ3NP
   eOsdt39qLrmBOzI0OXzhcZDWC7GH6fgk4Nfm9q1whlpMloI910pFmIKQh
   XOiwVo8QBS4vMUf7cLYbgMwJeJQvXwDg+2hFZdqO1pN2buh9F1MAVp/EN
   vpgFVZhlIVc7OHGSj3FpozhxlltGd8LWSC0cwp9KQn29fo8nt0QiumX5S
   e8fJuqi4loAMylGBuLaXKqXjtahdyscOdRxTsP7gtb+cTrlFgjHuPCvi/
   w==;
X-CSE-ConnectionGUID: XuLjhht9Rwqxmp8t8hdmNw==
X-CSE-MsgGUID: 2d25/82pRSijIpICQCKIlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117060172"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="117060172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:24:29 -0700
X-CSE-ConnectionGUID: x+sYiO1wTjCd+neh96DXYA==
X-CSE-MsgGUID: wQDlfECNTAywG8aPYxNAEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="274368639"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:24:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 10:24:29 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 10:24:29 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 10:24:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kkvy6uOPRvsyC146m0h47Uz5Nf+ssEJDNJkR50p4myPeRs+fMEqi6zVMzVqdxQcvrcY5CxjGObOMv2tM4gl6prDZ3cJRukLfmUanL5Mpe0CQNxp/BI+RdlzKAxW7jGe58nBlLW3FH7NYVyap61NvOpJhHk4FFk7Ku4KuSaVH5sWWRLkNVeiSaXDVY9+dpbd34zTYJoL2nyRBrcA9VMqxA4oTvJyGAHhf8YvF28xDOGOYcO8g+lfpYHn9Kvpa7fld4gjNgC0lRZBmIkwg3Xk6/XsEfq/glHjXw507BiSmdvqgwTMiE8XNo0/ueXzFSrvF8wUPlABwaosBfar092T52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o/3WmaJ4vARojqjTTgE40nYpma96H+2oMPqhIvWTeyI=;
 b=wyeIE9DnEBqFz+6jRKIs1wduAibuRZ2+XViZrFirEI8SQZhbvRyGImG2WiYwsOU8VZ1uM3s/Mu5QIZ8xVFnMesOMzy/updJygyjS2kelFAe8qsX9jcF3ENKABq+prMspQpv9i4K7YczMTOWdYAZZB/aq9JuAaxlSVilevms/8p+X+uTIKhpWTDswvakkjupgUZZc8RYxQmuj2GCsdMWcdSoChcOVIzPvv1vCZPylyMjTRLCYn3AMBb6Ve5Q5BneYdQffUCIuoH13UCxa1ikhfv4fVi6zqNFY37AKucL2LChlT6WG3FQHz+zfA+EG0jDhkHMu6KP3dMDxn7cptoK4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 17:24:21 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 17:24:21 +0000
Message-ID: <47dbc002-43ca-44f3-8f9d-cdab2c77d542@intel.com>
Date: Wed, 30 Sep 2026 10:24:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86,fs/resctrl: Use a consistent log prefix
To: Babu Moger <babu.moger@amd.com>, <bp@alien8.de>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <dapeng1.mi@linux.intel.com>, <peterz@infradead.org>,
	<thomas.lendacky@amd.com>, <chang.seok.bae@intel.com>, <jmattson@google.com>,
	<kim.phillips@amd.com>, <prathyushi.nangia@amd.com>, <acme@redhat.com>,
	<nik.borisov@suse.com>, <namhyung@kernel.org>, <linux-kernel@vger.kernel.org>
References: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
 <bc637e9a1f0c4624a01b8208f0e53582cbf21886.1790721445.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <bc637e9a1f0c4624a01b8208f0e53582cbf21886.1790721445.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:303:86::11) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4626:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dcd3caf-e2c6-4561-88df-08df1f17aa78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|4143699003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 8w6hsxa2D23nzcMWfdFWw5otK7R2QaxooQU07tpyA02ZFj/AR7KAByl9zmOe3PvdhNxg1SuNAlMql0nx0dH2f2RvcI1P1QOFmnXHeWQTq2+fVTRBk0wLk0nzHZ40hGlGoJ4JKQsMO8R5wjj9At57YgdPRLfyeSD0ZPuPf8BvFUfFYWxA/k7G9cDNboKLIzA29Neff6lX49BIfyBEspZZ0xLSnlV3Krm+58j+PATB1S+L4AKoR/dRrnIYRh84eA6RYoXZl/ErPs07DeGFUuJxBsrcUqZrvBZJs0ASWnyKjwGf9+/v2Zgr3ahtm+S7juzI2ga8BRlOe4zPax/W87//di/Y7qkr15vAKP2d0s/xsHmZsaiVIzaAD9SXur5Eq3JaQNuWGDH+TjbPbDMy2p+llo3ekrYqLsGgsnqdJ4AU87MMdVCzxCDceTb+T2CCBKQWqD75Sag4lqFH2z5/2fGISL1sBDWREoFRLK320ZjVg15eVRxD7/QFXkRkTtuJ+IehV3VxtVp1PF5H9IFfJex3zxEUH5iGRcHnimp48cs5ij+PR9ARh6OJY7sxcqX8KNB3XIGvnJz8+OZGjWL0h9bxLiAQs6YoyjL/YN2h8Y89h1gA0/+GDhCjuK7GARkBxOpoW03vLoCvQsSNHEnNwW12S3gdxQGmEXbzomyUChTHUZE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck56cnNGTTVvZFlNZlBWMEUvM2VWaVMyV2EraHcvUWkvVTZkWFgwcG54SzRX?=
 =?utf-8?B?ZTZQTTZDeU02R1pWby9Jdkh1OWcxeE5sSFViWkpHbWxab1ozeTQ5Uzh2R0oz?=
 =?utf-8?B?VDBRRWZTbjRLSlExTTdtVkNPYTBxMkcyS0tQWEZoTTcwTWdQMmJhQ2hXMFE1?=
 =?utf-8?B?QzRBclJkcktZVTBpanJXSW8vQW1QT3JRY3pMK3VGdDhQNnBjOHBRTGlPNWJG?=
 =?utf-8?B?WGNGbUY3L3dwZTVZZFVRK3V3Z0FBOXZvcDRKTnZST29lRHQ2MExGaVd3T0Z3?=
 =?utf-8?B?YUF0S1FlaXhjbkwvZHFtS1dBa1QwSkNrM2phVDJURUJ5L0tYVzk2a1F6Mkgr?=
 =?utf-8?B?MTRoR0NRZ002a25XZHMyaGhtVWk3dEtmZ0lJdG5vUVZJNlhQSjBPSEswdGFn?=
 =?utf-8?B?RDNyRXdSUHBHUTFqelo5c3B3T1J5TmllWXdocHJaZEd3YmRNYmpObmVMNm03?=
 =?utf-8?B?bGJzOXUwMk03SkpUbGVNQWZsWmVRTloxa1FGeDhsb1lRMmxFVjZYVHAzZmg0?=
 =?utf-8?B?Mlo5cTJSU3h0S0pCc1QwVktQNEhRV0s3ajJSb1cwQ0xXUUI4WU16WWNud1JN?=
 =?utf-8?B?Z2NDWmtkeDI5MEJzNU9tUFc5VHpTOGdjQjdqS0did3pjNWZWM3FpQXB2OGc3?=
 =?utf-8?B?ZXpkM1R2d3RET1g3SE5oWGFGNGIzaUllNlZWOTdoT0U5K0I5TWFxbWJiU1hV?=
 =?utf-8?B?eUZPRkZZNkVOcFR2bjlDM0hkMkoxaXcwU0NqZVJJY2RmVXgvY1NhOUI2VTB6?=
 =?utf-8?B?MFFzNFVGOVhGbUtNTWVYTE1QYnJvTTJKN2liekNkZ3JEV2x0cjFxb210LzNS?=
 =?utf-8?B?TlY1c0NId1AwT1ExMFN0QWVEOE9SZXIzb3RiTUtERlUxWHR6bjg1K3hray9F?=
 =?utf-8?B?U2V1NlJ3bWluVDBESHZONmhJVVdUN2JzUnhUcTNwMDYxQ2xHdUZHalZLV0RD?=
 =?utf-8?B?VldRaXpDRW5mdThQMHU5UU5BS3RueVE4UnNXVnE1MWdXUzFMamVFdXlSYWEy?=
 =?utf-8?B?NlVZbjdUTldjZGpxa2lZWFFvYk96NmpIbmwvL2V2K3d1WmYxS0g5RkIxcnIv?=
 =?utf-8?B?V1VKRnJnMDRyZUhrOW5ZajBKQTQyRUQwNGcvRzN4aTBKWTI5VFU3NkpHZmJi?=
 =?utf-8?B?QjY3aGJPZUp2cHhGQzFLQzFNUGFkM0wyTE9GRGlLTWNRQXo0SHA2b3A1MXpM?=
 =?utf-8?B?WnZ3bkVCdTB0c1FpQ0p5UzYvaE51dXd2bTNWZjBVd2hUeDh4NnloQVpjQXdR?=
 =?utf-8?B?UEd5SDY5eUoyNjJjWGFLVHVHVUViUDVSWDJneTRMMHhTY3RMQS9ZSHp4L2dN?=
 =?utf-8?B?REd1WHZiQ1hGNUdFSi9SdTJzanFrSkVpeFI4SWxIZ1czd1BRY2pucWNQaUdx?=
 =?utf-8?B?RGhqK2lsYjJqNmVkaXYvRVBvQTc1ZE5rUU5Qc09oSW9RSWdGSm92Y2lzL0Nr?=
 =?utf-8?B?d1FJZ1BleStCUFdYWmhFcW5MejlybUdGVzc2eTRPNURUckN4RVA0OXNlQkRZ?=
 =?utf-8?B?b21WSTRMbDVaNkdqa2hOZCthVXNBQnJCdEh3NUYyNyt3KzI2TXlLK2NoU0Yw?=
 =?utf-8?B?Nkg0bjBGRjVxWjVHaXhxOTFMWGtKaEdlUThnaEM1NlRDQUdibVlaVllnUmNF?=
 =?utf-8?B?VWtJb09NWFJVczhERUVKUWxJUVZNZjFoVGZHM0FNdmJCaFRFb0UvM0o2SUk4?=
 =?utf-8?B?N0Z3K2NLY01GVXdYd0txWjVPaHpseHRkRnk1ZVRwN0ZIRnNnaStkSS9jOGZW?=
 =?utf-8?B?U3FyVmdoZlUwNzQrM05jR2xYTEVkejVXckhINnBLT1BOUjF4M2VaUVBvWjZE?=
 =?utf-8?B?NlF4OVRLbUFtMWlmNy9jT2xXaE55djFmeGpYWGRKclcrUTgzTnczSjhtQ3pM?=
 =?utf-8?B?YnBwU3k4d1JZTXg5dWN1aVRBdE15ckJyR2JnMlpSK0Uyb3RsbmVkNUt1NXNK?=
 =?utf-8?B?aTAzMUtmdk94QTZyWlRhZzJxUFNMTHNFOEtXVnhmc2VJWTBtZ2FqZTg5eGtj?=
 =?utf-8?B?aCsrRVdEQnJkWkxNRHJrV3RPZ0p6LzZJakU1WnpkUWQvZGFnMHQ0S0c1UlYz?=
 =?utf-8?B?TDhod2RPL0VxUkR5RHlORVhzNXdYYnprT2g4T2crby9zR0xwVS8rUFNuNkor?=
 =?utf-8?B?RHNJbHAwb1VBRXNvbUJUTG9sTlFaL1REU0J2c3c1RzRKVFpOTnJPU2dYcmhu?=
 =?utf-8?B?OVYxYzVnYkZPOEkyOG9JRytQdHByQ08zNU0vamp0QkdrbWR3ZkpSSzI4R0Uv?=
 =?utf-8?B?clVFc1JXdWFRSVhEeHhERW0rTVp0UUFaNzNlSFZEVFhRSk5sS1VRMS9FUVFX?=
 =?utf-8?B?U1BqcFIrK2pDWW93cE1VUUJVbTJSdFA0MnJUZGlURUNQME9PV1VyTXovd3Yv?=
 =?utf-8?Q?XIy2j2sJMIUaOCqM=3D?=
X-Exchange-RoutingPolicyChecked: Nh6hMGOTRej1lpm3wDd99ztOxMyVp6G4BugLEe9R1eFcN8E3vmvxGzA5Fsb6Std6z3kswcLiR6/cs1PiDbDwbqA0ZHkoAj0NKTy5R1KRIwQ6/w+m8KLOUXWQp/rhSa6drkq9Jj/I/LZoR3g3h3B18770KZ8zjYCwHe0b3HskpRInJTWIJwytR7qmfWZ9fLHZNEeeFMc0x5cisQI7+jE9DM+ZGiRvhGYJlIpKfrFgOfSljv1iQkmMx0UmVYjMqc+AShFp3XjY5fOsy7nnlebTrqaTtBIrvY295Prh+8JCivKmrEZWEexXSiKoTBRuh5NdA6bOTo+kyaSt/taBDZnKXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dcd3caf-e2c6-4561-88df-08df1f17aa78
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:24:21.5837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfduEhBMZ29V5BdX7M4QDvxRBCSTCgkxDrABUtXxOlUrAp+aSE8q88t8B9OuSEumex+eIcmYHqZS3v/Gwx0NIx8Gi0sqkJbfXbznTxr5WWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
X-OriginatorOrg: intel.com

Hi Babu,

Thank you very much for doing this.

On 9/29/26 3:39 PM, Babu Moger wrote:
> resctrl code is split between arch and fs/resctrl/. Some files derive the
> printk prefix from KBUILD_MODNAME, while others use "resctrl: ". Since
> KBUILD_MODNAME follows the object name, messages use different prefixes
> such as "rdtgroup:", "ctrlmondata:", and "pseudo_lock:".
> 
> Use "resctrl: " throughout both directories so all resctrl messages have
> the same subsystem prefix.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> diff --git a/arch/x86/kernel/cpu/resctrl/intel_aet.c b/arch/x86/kernel/cpu/resctrl/intel_aet.c
> index c22c3cf5167d..04b665277884 100644
> --- a/arch/x86/kernel/cpu/resctrl/intel_aet.c
> +++ b/arch/x86/kernel/cpu/resctrl/intel_aet.c
> @@ -9,7 +9,7 @@
>   *    Tony Luck <tony.luck@intel.com>
>   */
>  
> -#define pr_fmt(fmt)   "resctrl: " fmt
> +#define pr_fmt(fmt)	"resctrl: " fmt
>  

This hunk is a bit out of place since it is just a whitespace change. To avoid this
surprise could you please add a snippet like: "Match indentation in files that already
use the right prefix." to the changelog?

| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
