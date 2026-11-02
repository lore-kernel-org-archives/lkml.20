Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793660741;
	b=PT0tkjqCnOHp7Jxne+kclsKaGxTq1cfU9tvZIEAVClJdaRj90gB9kVQZqW9FXS+ypaY5
	 PL3N9Xvr9H5W55zq/LLh+Y+WPUmQzig3G4y1xfZxB/P4OSDjoGkhoHBgVh9RsSKks8XrT
	 Un3Nnf3nGGBmz36yQimffEVIMRk21tjWSEuoljnkaSXEapwnNqiuOol9p4JW2nqdlV2hO
	 n4TclubFgncwUC1ol+bogoobF9SQ4ixqZ9QdN69xCvWYWhnihADdWaSwJh2tGt5PqA0N/
	 01oBEvOlIjoQ+w0SSPEmYsj4v5KVWURq83+5bOx2hZdS6s35klY9PeLREtiCYMESZxw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660741;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=x1hRwTerlH8sAvXQLJLkh1Ya3D8iRDZCm/N1zsn2oWk=;
	b=BuEyKPeVUiGaMo+S7xVifNPbHdO6KKVL5lLDtvjHEg2NOCAnY7TMj8DL4y7vSHibaja2
	 CZll37zBGX4GxhTpENB6x3forjz2I7XapjmbHz854L/EsL1ciZ9Sy1CGxpyDKUPwXVbzu
	 sDIbZYIeUIjGABWFy1MqrrpBfVIYFRdM0e/ZAZ99dYUaoxr2I81pVFjeGES1jLXhuc/cH
	 HfVhIRR7QfS5OAEJDlMfzVFEfeoOgbQKx/d4D7jasrwyVdTly9izh8/6nlShs4JgtNair
	 NEbqG8X9b72EOHFCfhNcXm9tQkMh5B4huyEwPSmb/Ve1Iug3BPRLMHNRPROghVQJzNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DI8K67iq;
	arc=fail smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B54606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:05:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8B54606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DI8K67iq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793660737; x=1825196737;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=Ps/eL+/QuiOVlxklQYwm7CGy8fUVmPOjc7MkinfjNWM=;
  b=DI8K67iqLmbK+7ogpkVUWfkms4TXOVgkKK9cv3VPo4xgAs4RBJc7z++g
   1skjp/di7DT1wpvorbiJIL/KMGkKfs8hVKP5PuDQqNpQsBHIPbA18nmMw
   JKxd4JaahyCnIbIFwr5n+ETcjZA6w2RFSzjsVBTwviy8u7v3XpTfJJK/9
   DdPrKAo24O7/hl+gOyE/y8YzjuDRySx7RyCrHlAsxupZbTbuVN75C/GIe
   qhJTemx5s2dUXFQjA8/bzeW9AkGereNqbBXRfYrWNnQxgrNgTklYgFZfC
   oXtx7qb4p2R8slKOrWxdcacuHfqxdN/AdHDp6oE0gTO2ByOIUrH4t7leD
   A==;
X-CSE-ConnectionGUID: U6n3LMIOQn61TrqiG8qQjQ==
X-CSE-MsgGUID: FUHonjI9SIu6MiHpajbQiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2388144"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2388144"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 15:05:27 -0800
X-CSE-ConnectionGUID: bxuvozV2RaONSZ81UenPGg==
X-CSE-MsgGUID: Qlusf94cRO2FOWqejnhl6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6788988"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 15:05:27 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 15:05:26 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 15:05:26 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 15:05:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plAr1Sf97ay7m+YC+GYt4lbTYtM3TAdFI2FlWJ17/mL+BARfYObsDap/EuA6682rL0Uz6TaLTcKyBHChsrrMbCSlTMZgF8ucMCigvW7bs+XwefkuBFzZOxLerbVkxPO0rKv5xDJhb28Ekmk71ORp6JC9u80UXCKTdG43D6yQUgbHShg2c7/XMqbR6dXk2nKJCiarfxY97Wmw6kqPNfuc3Qkm0ayYY/U9PpRgBWMPvvtPcaaxjzYxBBT2XzfAYlUmCUJZkrhdu1xvzBUQL9LaTedB9tPBd05Y9s4gGW3WGASOICd7RD9joxYsJNRhdbLnxo5tVOhy9ZvMc5NRoLukUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1hRwTerlH8sAvXQLJLkh1Ya3D8iRDZCm/N1zsn2oWk=;
 b=V1cKCWjtOhs2uDr4XhATFTdXKqDULnLBcX3/L10fVQMW2Ng5QNNwCK9LtHOQr65fQnA6aVKOhL2t0+3ywTzVsYOMHUFLjUgH+1CgePv3tkRmMiSP+IB3ct7M1T9AOrsaskUOXOeC/MtNKyDloe/zs0/XkVtjZsUidkLonbXEoRXpVdM5C+Gg0d0JxKaO3fMTkgiDimztCD+wALsCLw5eVMje5VVEaBlzgzT7++pyTEEP+BMj/oCtdKhTjoMixvoc+/AIiTt+kNu5Ks7FW9aiH7k7/PlAShTDC6SL9yKNIRbLbWy4xZZ243vguweFhS+JV7r7V3Ijah6/8BuJ1Syymw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH9PR11MB904373.namprd11.prod.outlook.com (2603:10b6:510:418::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 23:05:25 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 23:05:25 +0000
Message-ID: <16017edc-787e-4153-afb5-d4cce89c2584@intel.com>
Date: Mon, 2 Nov 2026 15:05:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] fs/resctrl: Report a temporary RMID shortage per
 CLOSID
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261031063634.1678345-1-ruanjinjie@huawei.com>
 <20261031063634.1678345-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261031063634.1678345-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0131.namprd03.prod.outlook.com
 (2603:10b6:303:8c::16) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH9PR11MB904373:EE_
X-MS-Office365-Filtering-Correlation-Id: 071160ef-879c-475e-500c-08df3935c758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|22082099003|261102123227099003|18002099003|56012099006|11063799006|4143699003|261026121527099003|261021121427099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: JYY7sZrX4zoCu8/8fd1QptX4tq6Z2lp6wDYURhmKTHldUYRfYaUvwypErEK72j3NHPUyDlfccu+3YURnX6CZUl0q9Eq42/qn2TWzt+ygub8cFvzmvOEnoydhLIng/gDWhZ8eNH7we5ddaqMEl/w/XsV3keZaaPDarwF6ReU8sLLYKqjNimLrgA9BHXlOqPOxAe3octU15Dw5oHa96e8ODAWdWJDGj72q5qJcUIDAxmDrJwKXhtUaLJ6YNTynQ9E4aJM+80XWu5n+neBsvcDqWdsGPq6o92Z6GifxFUYl0JWwYZQg6VFL2gW89dUnZaiw0thctA824haJ2XmxsXh+GZCa9vUlkq/38VCfFbMtOZsDpNKsHH9FUprdCHSHZB25+Oah3DPmYno8qfza8vPxhs9r1nklSq2U8z6r1axSoWUhZvgaQSFpJWyYGmks6BhV4CisuOxFQw15+cewYnsDK1Fepeiv2002SKCgNZLBJJKS+m+Jg1YYGkMDRuiByGGECb/jUI+J1K+m4XMgekvTz+fI6mB+1AUZTSXw3tS+8rVkbnt6zP24wXc/J7hiLzobRpmSl26HCd3PwiWmo9NO023vMxF17fzyy1nh+QxYNbdVH9EOPf/2IZfv0bbQAnl0+tbVEwr7FUe746k8cPWD5nXAlRq0MT4hqs4nL8/g6Ik=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(22082099003)(261102123227099003)(18002099003)(56012099006)(11063799006)(4143699003)(261026121527099003)(261021121427099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YThvaHZlV2U2V1ZIYWhmNDN0S1FnYlp3TkhKcW94TnJ6QUhGOW9STlkwZ0Ns?=
 =?utf-8?B?RmtKK2tsU0RsZXltWXE1ajRnbW9EVVZWaGd4Z2I2Y09yQklneGxJQ2FVT0pl?=
 =?utf-8?B?am1JeGtObktUWE9FRy9NYldRck15TFZmNzlUZmdQdHIwaFNRSHJ5aHdicjdQ?=
 =?utf-8?B?NWhFMnNTVmJyRFpLazVvUEl6NXVUVlFNWFZGZ3p5UzZuUDhTSEVaMWg2aWdH?=
 =?utf-8?B?RTZKazM0UkJmWTVKdCtEMU5uRnhPcmN6cWpuRVAvUDhjeWV3YmxWNFhqME8x?=
 =?utf-8?B?cmhXZis3OTFPUDN0Qm9IWTB0Uk5qTWZITFhUWmlQMzJFN0ZsdVFFSEdqNm04?=
 =?utf-8?B?TExLdWRXZTFyS0cxK1hMQXkxVGZXcVp4bTlleUR1WDBFeU95UjRVakFCMW9F?=
 =?utf-8?B?ejN3bTRaaTVJcnNlcTFjU0hFNm1DUFZWR0pyY3k0YXl2NXRTbk11VmZZZTBu?=
 =?utf-8?B?ZW03blNCb2tyMUZoNmpWTFByVis3UkN2VUJ5ZGxjaHA4TTAzWTBSQkdmN0hU?=
 =?utf-8?B?Z2dpZWV0VkhaZ3Z0SlQ2amNiOG14S044YUNvRHJ5WktzZGloaEtxTExrTTRp?=
 =?utf-8?B?YUtaS0hva1R3V0YvTUIyWjNxdWI1VFAySEdsckxrb1ZGN0pDU1NGVFVPQ1ZK?=
 =?utf-8?B?dlF5NFpvaVV6S1ovaDByeVhkaGtrNEtNdjA4c1RTL1lZM0dwNzR4SFBXWEps?=
 =?utf-8?B?RHFnSHd1K3VhMTE3WW9uOXRXYU1HSm92MTU1RGc2bUwwMVhHL0xubVBUUVJr?=
 =?utf-8?B?MUQ3bkszVjFPNzYzYlg1L0hWSnlkWmVxYk1SR0xYdFhvZWdTOC9wTFpNQjYw?=
 =?utf-8?B?RnV4T0NxaWppSUYzcTB3ckJicGZ1RE44UThUa0RleDN2Sk9VVTM4SUNGUm5i?=
 =?utf-8?B?YUZOODZzNll3V1M4alZpdGpHRDVtdEZRZlYwajJBZjdGU3ptOUJPSTB1Uzlq?=
 =?utf-8?B?alRQbUt0ZjlHZWhQNlNKZ3BENHRNejBvc1lrVjVSTTFFM2Z6cUtqbkJIQjlo?=
 =?utf-8?B?VHJLNnQrS0U3alIvRWRWY3FZQXBPcFpRM0VjcEZhNEpFUURoN0ErODA1aGdp?=
 =?utf-8?B?Q2hyMmo3Z0toNC81TVo0bndKSXViQ1JLMU15Qzh1aFJNZVcrbGpHL1p5c0VQ?=
 =?utf-8?B?MWE0dzZIb0xmVWxONVhQRUdhV1htNzVrR0VGeHFjM2lLMnNiSjV2RnQwN0Iy?=
 =?utf-8?B?L0MxNzh4U04yOTdBalNDYlhiM0RQK2lJMVdVVTRKZG02b1M1WFZWT1luOXIr?=
 =?utf-8?B?ZU9ZRFhYUnNEY3owL0lCT0VVSlptazNUcFRMSU5ubGpCVFJBeDZsZCt5QXd2?=
 =?utf-8?B?NG44WUI1ODJXQnNBTk1PNXBIbnkrWkhXQUQyalQySzdtQ0RETWlSbjN1ekd2?=
 =?utf-8?B?Qm8wdUFvMTJaNHZhVmdUazcxSUc4TnhTWkFkaXZYY0pKcHE4N2toeFVUdE9P?=
 =?utf-8?B?bCthd2w1ckViK29TUzVDOXhZZVNoRWdPMWlYVUZoMzc1ZzFjREJzNGNTTUZq?=
 =?utf-8?B?NU5uYSsyTFVnN21VS1lWTFRmMFFGWWI2cENpTHdzdXVHdVNRM1M0KzVZWDN2?=
 =?utf-8?B?L2JXb2lWcWxYR1ZHeEN2aC81ZEJZb2ZFTDJmSGRYMUNHQWhFMERpR0JrTXRM?=
 =?utf-8?B?bTN6RnI2eGpKaEhHL0hoNi9ibHRGZFZ2UXZVakpMMkQxL24vdm5XeFR4M3FT?=
 =?utf-8?B?MCsyaFNPYTZqMy9wdXg2dWIrSE5PY1c5YVhXZ2dWWW5zSGg0eFJyNUtPS244?=
 =?utf-8?B?OWFPRk5sMUp4YmkrOEN2OWg3MWlCaGpRcUdvNjlvVDNRMWtzKzVZNnJvdUFs?=
 =?utf-8?B?NEI2UlpjUU9RVVZIUU90SW5Wc0N3WUhtOEIrNGlDTkdBL08wTzhuQjEyVit5?=
 =?utf-8?B?RDR5aCtDMmFXdy9aYnI5VVNxYWMwc1ZCVVQxOGFRVmFUZ0Q3NHAzTmU5YVg0?=
 =?utf-8?B?Zm9XSmFab2xtUURiSFF2eUhudCtvcHZCWHpXSklMRWpnSkNUaFdaREhKWnp2?=
 =?utf-8?B?VnhwYVFwVnRLVU55czQwOTR1TncrbW1pOVV0UVltcXNPSHBFQm9UZXlvMDl6?=
 =?utf-8?B?R00xWitzWEkxY2hKdW1zd0xOTFRSVVFsdTh2Z2xRMEQyWlQwemZPcmU2Ulow?=
 =?utf-8?B?Rlp2MzJUTnBkMVZabDEyL29yNFNzNEkrUVBDZUc5cjdadUlaRWFVeHVyRmdj?=
 =?utf-8?B?eDdzQ2NNQmxTSTFDSkV0MXNGQmFzcmZaWHdGWUFzWHAvb3JsZFR3K0dxMC9J?=
 =?utf-8?B?ZVlESldGbVpscTdNbUhqayt1akhENW16L3ZzY2p5S0ZHUVpkUUxjZ2c1ZkFT?=
 =?utf-8?B?bllmTTNJSDZUVGdRR3R6RncvWnQrczVWRzlGRDFoWXVlT2hnejlIVDR4c3lZ?=
 =?utf-8?Q?oXC9DfCVzKLXob1s=3D?=
X-Exchange-RoutingPolicyChecked: VZMntKShwPXZGUqNq8xSmsPa1MRVyvoZyofwfdKINclnbzrVYOw94ghG8oaDgd461vOatpp81GBT5NNjESIcXQ4bz06acw6INjCIjGHN67Q2VJNCzkgirLD9ExeHCwX2sWVDxI4AWD8tfu4TSqKjhisGgG4/L79YZ8UCi80D1u+PNgUgzpz3RAvEnjY092AGUCUCoBvpKZEBEkt7nj5zDMjd6TpOhmWkEyNNVeK1zsMG4qFvDs7y2QWET4ln/sflE7+eaStOrFmuh+y2DJuCXPCuUV9EdK5PfcMQGXWxfAr543PsdzkRoZg6sRxvgVSZf9ur3oj/ZyGNcN34PhJOqw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 071160ef-879c-475e-500c-08df3935c758
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 23:05:25.1800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +NM9ckPm3gezfgNaXfu4dOCOGlkTiU72JL4YpEN3wL0ES8YhhMlohsVEG4fXGwXukmNecNWCSl6uTOf6W2FaKJVFzYRhmxfzGHjuLg77cAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB904373
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/30/26 11:36 PM, Jinjie Ruan wrote:
> An RMID that is freed is held in limbo until its cache occupancy drops
> below the threshold, after which it returns to the free list. A request
> that fails because of limbo is thus temporary and worth retrying, which
> resctrl reports to userspace as -EBUSY. A request that fails because
> every RMID is in use is permanent and reported as -ENOSPC.
> 
> Where an RMID is only meaningful together with a CLOSID, a request can
> only be satisfied by an RMID belonging to the requested CLOSID, so the
> distinction has to be drawn per CLOSID. Instead it is drawn system wide.
> -ENOSPC is reported when the free list holds no RMID for the requested
> CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is reported
> when the free list is empty and another CLOSID has an RMID in limbo,
> even when the requested CLOSID has none. Userspace is thus told to give
> up on a shortage that may clear on its own, and to retry one that cannot
> clear until it removes a group itself.
> 
> Architectures where the RMID is independent of the CLOSID always match
> the first entry on the free list, so neither case arises there and only
> MPAM systems are affected.
> 
> Draw the distinction from the number of RMIDs the requested CLOSID has
> in limbo where the RMID depends on the CLOSID, and from the system wide
> count otherwise. Drop the separate test for an empty free list, which
> the search handles on its own.
> 
> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Please note that the tip expects the Reviewed-by tag to follow the author's
Signed-off-by. For reference, please see "Ordering of commit tags" in
Documentation/process/maintainer-tip.rst

Reinette

