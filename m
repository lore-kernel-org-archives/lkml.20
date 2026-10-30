Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793384112;
	b=EsyVQNkTzqoQSxQ8grPJ8WURyXIxDrZvi0Lf4eOPUpXGcu1elCfZz/61zqUvnIcf49P9
	 yOgTTAUEpJjYN7/MqDuvftlMJxDTcgic/rB6/NuawTvECVMqvvUJPZPrx7ktiVSWMpWGV
	 XXkew1U8QhLOwGszeyGU8KsGB1qMrsai4DLkGR5bcoCuQ4xKK9EykcW3A3MNiB62FbzER
	 Oa3wpubB7qJ7/5kSMnofbM6OAyvOttAzvdHzFTXzcEF9Gxoj//M1JYxYYjlj9qf24vkXD
	 j1D8IeS/Zj8Uq+B2bkuqP3Suv4CxbpaiZilQ1VnIAdMdThBmrpOfVCkvrWZbBcw97xw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384112;
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
	bh=aqq+MihAMXaeLo1FAFtZqZIpaAoCLxDO7mKLxPHdJYA=;
	b=X0aelYlcDy8magyWqJQr4zNfV7sGxew+SagAi5rOQus1dR4cslBmPMbJAgDFiElpDQVF
	 Z7lh5YBh6A7j7JTOYBqdY24syY2YkFaZiGWx39bem9xsVs+lvVU9WgnDgV1X8UiIDV1ql
	 8roMZoVToxk1hZnl6j79WnmvNGuC+ENWSbBiFyYTu9pZNG+nwTOCrwwg+yWn0zQLMSxj6
	 7HR+oAIBq94iRY0GCYAQHtwlHBjlxohDB9ovBvCXGj12x08/IWPB2P51pyUUjiVAz/AJH
	 GNIXSqEnqh1MQajwQGYvWSTYgfBnPUEwjf+wBbFmFXhiwl+qHrkzyuCnTkqtXP3U3qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NWFcSoCR;
	arc=fail smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F77606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32F77606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NWFcSoCR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793384112; x=1824920112;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=w3KfWmY+9Y5GqTSJOky4byZ6nOMHNq9voQtwRv+cuZU=;
  b=NWFcSoCRWD3K3rGKh/48XV7+69mR1Qg5M4PhbO43QJLF4bAW+sMY4Bi9
   zhxevGizEl4wal4GMuFJIqqlqOKxRukzlK6BJww4CEFQYqFpZ0F7vhh1N
   ObTX+GbJg8wzVOQfg4B9JWPHePPQT8IenNdeln1e3HresaZmMHZgj0D3s
   aCOr2/R9ST7qux7Dixzsy9OpE3lHl0pRBtT86RpfakSEKbosyqZP8mWLV
   fIzKnoTmurTYqfE1esXHLVKSe08NYuNeP/NLqzQU3KE/PiLEgpaaIjCAH
   2LRwP3zIfVWi2lmkS9Gn9DLSnScTnXY13qz9QxUoeTu61sE7eyH1Fdmca
   A==;
X-CSE-ConnectionGUID: Xibv+0g+TPmYnfzqovVITg==
X-CSE-MsgGUID: 8TbHY4YJTdq0Y83b4Bld9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2259278"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2259278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 11:15:11 -0700
X-CSE-ConnectionGUID: pH5RUM+/SrWHyed+jv00mw==
X-CSE-MsgGUID: 47Ac7ByaTjuRyJnyYG0+dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5639433"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 11:15:11 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 11:15:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 11:15:10 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.40) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 11:15:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cl51Fc+G58kfSPQWmmLjtwKamcrwA3m2aiFYFn+6894iNbtPxNXpLK5/Z1lMZ7Z83ZAyQutrAh/DXUg5Ex3qSBEwBcf5muFpE4umqAxm4LxKRXYJB1muwCatLksPp2Wd6EDCHMwKRT36+EbqASVBp6yCq8CozCqiIV4O9VmN34k51R9+d9RPUco/j8GdTh5cl3erw/fOrNadwRwdh136D+tLy/RnIjp4e9ViUjzJCiSGotySV8AQky2PdiiEAEuLp08msxp5Fn+KFCMV/Vwb/8882UCCfSh+xZt3R+9aIuGp/LcekRuDeCQqtHPckF7R9VdntBhG4nZ40kTlD39M7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqq+MihAMXaeLo1FAFtZqZIpaAoCLxDO7mKLxPHdJYA=;
 b=p4ATxaZj039ODNV4yb1tAgQTuNju+XjaVrXbeqrbYwhu8hafqc72ppU2PCGa9OMPfvrF40Ri+lTiAPA/E0Zu9e/vYT9puY4YFJx8Wq6kOKiNbcyMacx+v+rBqt6R1GF0PARY+nuX2BIPqQm4igs4YDZkSSnmdhQueqigwReh4DHJcH8E5651lagJbtZsNPVlDkAXXobp8pEUC4vQ/p4ZvSmAMKAg5tplQucMs7UE6Ezmrp8UQPkbD2KpKRs0XZDB4b0ZkuKTEzHs+zS+LRnb+I/mCLiL+SW2abJN8O2dEuc9Ktt4bMBz3ufTEf/S7g0T0GZwoVJYy6qfBPtd1J1NQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 18:15:07 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 30 Oct 2026
 18:15:07 +0000
Message-ID: <5c2c561e-b970-4ca0-a66d-b1043608d847@intel.com>
Date: Fri, 30 Oct 2026 11:15:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fs/resctrl: Do not allocate a monitor context when
 releasing limbo RMIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261030092144.1233551-1-ruanjinjie@huawei.com>
 <20261030092144.1233551-4-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261030092144.1233551-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0151.namprd04.prod.outlook.com
 (2603:10b6:303:85::6) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f900db6-884c-48ec-ff9e-08df36b1ba70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|4143699003|5023799004|11063799006|56012099006|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 0H2qyJInA/JgraQzkBMyj5i/ScV2M9OB1nwK7aMJ112e3I6qvrQsc7+eASqeuxkJRkiF8dGeBSnxhbLmzb8yVoSHuloiuD60TJSBjGBCP65+HSaHKMMtk1yaZVDysM1BduL34ohwgtoisuSn1RW8lKO32KXcgWKX2Ii+DzYDZmL2gnRFz+sygIBkeU/nEqrkh65P4N8r0aB47trZ78lhx+T32q/v3eHoN+fIIkFDQSHd1xa89MKhnI9Ec5IHf6jNkejh/SqSiZCS3dxCx6KiIBymBTjo7VVLTvIKgrkaRZ73trKKYgpHtOARS3FpxM076jFAubjr4lAB4G9crR/KcbCJriJ09/6bMDxb1EdGC47KlUo2gHp/TUseRIk2dW6mBEAcrS+4sZOpjmC6c8Itlgx+heL4NRHs4nKsmuiIbQa6XU6b/5cMzjyACSwyLDjLF7Wa2xDLxDfFSYEqVPoRARJP3wUI2gP/52eOmsB85HkO9F/jbUYz0/hf236CGIB/bS7bKgQHTYFiJhUkiI+5C6R/YsoInyn5kmmoQGbqau8aKWzbTMMgnN6SrI3d3s127UxNjQ3JK8xJ312ou9uF+kgu4be+aVexO9Dzbl3q9wqvQ1QvqDJ72OPWXVNPcx27IPwTmvhsn9GKoJjKMR+ZiiDAFyMJksIknwOXHmM/27c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(5023799004)(11063799006)(56012099006)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1lQZUJZeXE3SEVvVmo4NHZiK1JVSFBkTVlIU2pKcVlNN2pxb1JzQ2pEdGVD?=
 =?utf-8?B?ZnNsd1dPM0dzQXNxRjcxWnlaTVZvU0hpRlFDOE1oT0FHUjM0STQwRlpyL2xr?=
 =?utf-8?B?LzhzN3NRNElxVXo2dkE4ZWFZbzdVQmFxMUVSYm44cWlPRFh4SWZSOWpXVklm?=
 =?utf-8?B?bDQ4N1c0bVFUUklqcHhkdlN6UzFTYU1BaFRMYStkNWdVRFExbDMvSGFkem5D?=
 =?utf-8?B?Q213NWk1c0NiK3A4U0Y3TlNNTysyMDNqdVFuaklVc0t0Z0grdXFGSGR0THNK?=
 =?utf-8?B?QlpyVmRTd2MzZTZaSWhnaHg4WFBVbS9HRm9qTDA1K3lVVEFRZzBFb1Q4L1FS?=
 =?utf-8?B?bzBDdFovTnBLQUJ6QVMyQXIyR09OY3R5emgxTGFzZzZnM2ZSSG9LQUNMYk1k?=
 =?utf-8?B?MDJtWk5CbU93T0I4cDVJY3p1RXVheUtLVDVOd2RFYWoyS1ZQcTdpZkhZVC9i?=
 =?utf-8?B?MklGTGJzNXBOQUtJeUh1UERBd1VQdHJZUk1KUGFkenJWTHMxVDlUOEpNdjN2?=
 =?utf-8?B?b1hvSHNUWDl1MU02Zkc4aFpUMG42YWtvb1J3UTluZXFFKzFTbkswbkJLMkZz?=
 =?utf-8?B?Smx6SXNLdHdYRHZONHQzVUMzY0Z3ZmtYeFJvK0RtTXJBc3FsQ1k5MEZNeFlm?=
 =?utf-8?B?S2NObGhCUHVTSnZzeTlpei9oN1VwV0RCa2hFT0xRay9BVGVFV25IYnZBRE5I?=
 =?utf-8?B?cmVOR1JDYXR3TGMwQm5sY2dSQlBpRmYrQWhXUDF1UlVtbkl2eERNL25tSFpL?=
 =?utf-8?B?V21iU0xHZTc2L2l0STVlSzl4aHR4bThuS3lMODdMZ2JhVVpaN3hOZVBIdnZj?=
 =?utf-8?B?cGZHdDlOWmZVL1h3VHdBTCs2MkJhTFNGYTNZb3ZDS1d2VDZSaDV4SXQ5VTJa?=
 =?utf-8?B?MWd4eHN1U3hDdG5hZDYyUGswTHhpK0RTRXRHalN1aXFWaTlaYmx0ZVRHdzBX?=
 =?utf-8?B?anFHMndUaDZLZ2Q2TFYzeld6Wnk1RjNYdUJQcTNicmdLdTRUcGFISkp0a1My?=
 =?utf-8?B?bWY5Yzh0R05Xbkw1YTFya2llWDZNN3dYZDRXOWVPajVDdnNZUE9CNUdIU2lh?=
 =?utf-8?B?QTBpTGlza0tIbzlTdTNoYmFWVXExelBuRmRBaFFqZkdBV3BpU0V5b1NQbDhn?=
 =?utf-8?B?bndrUWxHOElzYnRhNTkvSXdlZm9GQWdEOVJramNjNDhKaXVnbHkwaXJxcTc2?=
 =?utf-8?B?cXdzUkhhRXI3WTVBZXYxUDRxWTlnQjJha21LVWdrdE4wNVc2WXhXNEhzRTBV?=
 =?utf-8?B?YXErSm40Tk43SWRuMHFJSE9IaW1ya3pEMSt4K0J1VFFFQlplZ29udE9rbHNw?=
 =?utf-8?B?S2FVTEZKOUUraVhDWG1SVElGRHA2bHZUTndXdXhpeXNHTlhPSytFZ3VPOW5Q?=
 =?utf-8?B?T3JqdmEwbWtyamEraHNvZUZQcUE5cmNoMWJ5SVdLb3ZVMWU0RkYwWVRhNWxW?=
 =?utf-8?B?andjK3FsV08yeHcwVzNPQ0JTWXdOQjY0VmNkLys3TW8zcXpVZ0JjWkhCSUEw?=
 =?utf-8?B?ZnVQRXZRUU9kY3p1Sk04SVQ1cVdkUy9SNXRMWC9sYmQ5T2p1Mnp4NmVUTU9l?=
 =?utf-8?B?ZHpjT2NKQUFvWVVmV25ZSWRQM0Q5Z01hT0czN3hTeHVSbGFSSFg2R1IzWVIx?=
 =?utf-8?B?UENxUlpsK1crWnNyNjJHMHFuampCb3Izc2lLVU9YWnJJOCtVS3ZrWXBLWUU0?=
 =?utf-8?B?ZHY2Nzh2am9nWmFKSFM5dW10RUVyclpidG01RGlCZiszYXVuTk05d1dVZTZo?=
 =?utf-8?B?eGVUQXMySGdURmJFQ3RSODBOakpQTTR5L1FsTXZZMXMwK09mS2VOY1RES0lT?=
 =?utf-8?B?eHd3M2EyUzRhcFIwenFncDNVdTNLVFAwWkc0bXM5cWpsZ1YrOVVzUXFzU2VT?=
 =?utf-8?B?WkR0T0pFUVlrVVBwclhIeHF6UkpWaklSOXF1U2dDVi9Za2JlTThydUFWQncw?=
 =?utf-8?B?NUMwaEs1MDZGWGVNMGhNSVhpZDdGb3RzZC93NFhUc0gwOC9UWURkc2RRSjlx?=
 =?utf-8?B?eVJTMnJ0SkpxZmpEWFk0d21zYTFXb0ovTHJYUnFySFVGRnZaYXBQTlNHYmdq?=
 =?utf-8?B?c0VJUDZOdGZmSXN5YXpNUTFQL3hKeittbTdrNWlucE1PN3lSRVhtbmY4ZUFI?=
 =?utf-8?B?blJvVGRQOXhoNm5IQ1NNUFZoandwdUpWOGlHZ2lnRHRmQkNrTkxLQWlxZmJ6?=
 =?utf-8?B?S0lmVklWYWJvNHd1RjFSL3l0ek5Eak91RFE3NjNMaUsvaTduNXBqNGxOeW9R?=
 =?utf-8?B?dkJZaXlibzlDdXVyZlQ0NEcrNkZNdU84SFQ3YnVhUWsvSXZSaEZhZWZlMndu?=
 =?utf-8?B?Um1UZzBpdjlWYzdjVFBrVjkvdFRoU3hwTGZLakViSWQ3c252aVZYejU2cDUv?=
 =?utf-8?Q?Nd3NJCWHK7SX/e+M=3D?=
X-Exchange-RoutingPolicyChecked: 0amy2h/EESkZ9CXVx4XbxkeSA3566vq5ApZfO5zbptaC2zy4ws1UA7QO7OIk6dl2kBZ+oXFvhdbcUZuzN2mXRzHkEZyEMo1eCFo5SiRvVcDJTi2AU4ckBvyVOdIij0JdG64XuqXNhL+iS12m05tMggXtd7JsgsYAyTsN5CduqX7jfbu5oaNupDb6VWlDAszXdqW++tC5kURyj9LyuZqjnHJKamBu9ieR+mOtz85K5zcS0jN5UtDGXijJHwE+PBZhuPvihRMjMpvAj70KiEavP5R9AqP3j+nO4XurYc4J4JjE+nMwfR6uGvGCH6lZGWrSbCrsCDuXHKElplaK+J/QDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f900db6-884c-48ec-ff9e-08df36b1ba70
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 18:15:07.5883
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6FrBpDpeoy3VuByJymRveupPqcjv7NuxLLzefDWckfUWAnm3NBgInMepuOs4jT2Ww0wgRUEA4FSbzYCdItdFkEWClyOPSuwk+FLWGY/T7HA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/30/26 2:21 AM, Jinjie Ruan wrote:
> Busy RMIDs of a monitor domain are normally released by the limbo
> handler once their cache occupancy drops below the threshold. When a
> domain goes offline, its busy RMIDs are released without checking
> occupancy, since the domain is going away and the RMIDs must not be
> left behind.

nit: "left behind" is vague. How about changing "RMIDs must not be
left behind" to "RMIDs would otherwise never return to the free list."

> 
> On the monitor domain offline path, __check_limbo() allocates
> the monitor context that an occupancy check needs before it scans
> the busy RMIDs, but without using it, and returns early when that
> allocation fails. Then the caller destroys the domain's monitoring state,
> including the bitmap that records which RMIDs are busy, so nothing can
> clear those bits afterwards and the busy counts never reach zero. Those
> RMIDs never return to the free list and, where the RMID depends on
> the CLOSID, the dirty count of their CLOSID never decreases. The allocation
> can also wait for a monitor to become free, which stalls the CPU offline
> path on a context that is not going to be used.
> 
> Only MPAM systems are affected. An architecture that can always read an
> RMID allocates nothing for the monitor context, so the allocation can
> neither fail nor wait there.
> 
> So move the release of busy RMIDs into a separate function that does

nit: Please drop "So" to stick with imperative. Just start with "Move the release ..."

> not take a monitor context and leave the occupancy check to
> __check_limbo().
> 
> This is not a revert of the fixed commit. It preserves the original fix's
> intent of not reading a counter in the offline path.

More on this below but after reconsidering the fallout I think above paragraph
needs to be dropped.

For entire changelog, could you please adjust the line wraps after edit to not
jump around as much?

> 
> Fixes: fc16126cc11d ("x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled")

Taking a closer look, the issue as described is present before fc16126cc11d. 
At fc16126cc11d^, __check_limbo() already returns early on allocation failure,
and the force-release caller already falls through to domain_destroy_l3_mon_state(d),
so the RMIDs leak there too. 

The issue seems to originate from feature that added the allocation and early
release, which is:
e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")

Even so, as with patch #1, since the impact is only on MPAM this need not
be backported as far. I thus think the tags should be:
	Fixes: e557999f80a5 ("x86/resctrl: Allow arch to allocate memory needed in resctrl_arch_rmid_read()")
and
	Cc: <stable@vger.kernel.org> # 7.1.x

This fix does depend on fc16126cc11d to apply cleanly but fortunately it has been
backported to 7.1.

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: <stable@vger.kernel.org>
> ---

...

>  /*
>   * Check the RMIDs that are marked as busy for this domain. If the
>   * reported LLC occupancy is below the threshold clear the busy bit and
>   * decrement the count. If the busy count gets to zero on an RMID, we
>   * free the RMID
>   */
> -void __check_limbo(struct rdt_l3_mon_domain *d, bool force_free)
> +static void __check_limbo(struct rdt_l3_mon_domain *d)
>  {
>  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
>  	struct rmid_entry *entry;
> -	bool rmid_dirty = true;
> +	bool rmid_dirty;
>  	u32 idx, cur_idx = 1;
>  	void *arch_mon_ctx;
>  	void *arch_priv;

Another difference between MPAM and tip style is that tip prefers variable
declarations to be in reverse fir order. For reference, see "Variable declarations" in 
Documentation/process/maintainer-tip.rst.

Please re-order the declarations to maintain reverse fir.

Everything else looks good.

Thank you very much.

Reinette
