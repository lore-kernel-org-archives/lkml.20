Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792800594;
	b=jpNPE/NY5b+haJIANCGimsK1y74loXMaabPdAHUhx352a+OUMmA+hZSngWP5gGSt/RfA
	 b6p0WYS5Y73oi5bkcbnYGANl3hrLpgSRflWAqAvOIX3+/FVaO0hFdM02mtBSOK3tmC9QU
	 NdOE43noSkmlmZniqolODjKtii/KwjC5qVR+80wXD3OhuohUh5G47ni+Iryst4XNcF6Pz
	 jMzdOtGJKOsnOkwOJnX8OYJS8O0O/pyIBWlIa/DENnr76m1gY9l1Qh/di/iREFEjbBdjm
	 +aaUO9XHVeWx5DGHmPkTrWeUU8o5Y8iswDpCIJDpSEuSPcitr7SAQ0hzV7eiGdw0N+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800594;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
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
	bh=qiqPs6CggnmZOGD23S4brF2T+SpBFp8kwH3gPCYldB8=;
	b=Fvf4mLd6TDIydZCV7eqxIJpv2+/qXHeHMYD1EBhniRlyoJWBce2/m1bWWaxlIaybZrpD
	 h45sXDOEn39OZ9wX2tXDmb9YQjLcYYY6F10aI9IVDVqbHEcu1+ZLYz4wIBMOxeILvADZc
	 Y99Cd77pBm0d4gZSrTH+ZzLMF3oyMDMnO+pHmLIQtYS+ENTg4FS/QhDiKMHZhQnE+unNT
	 /aiYPM8g0EIsM62NsL0CO+GLSGsbyFb3TPhAzdMsGHpQkU5usS6Tt5F6J0VPYDE+7grTa
	 InmVpB6GQxxVElxw8BQsfjop9GW8VVMVowUGj650VcCFwnzkulaKAe26ICe/Y5Xj8xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OTbQvFvO;
	arc=fail smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7032F606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:09:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7032F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OTbQvFvO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792800593; x=1824336593;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wuurgCTc5/LkpfAc8NqtH6CKEoq//8WyHq7ezivLySw=;
  b=OTbQvFvOievaJM5ixiRZs0ikHJQy9C5YLoyzcMGrF/sYAGQpBiPz3Ozx
   XW1EIz3X3SJ6hUJnkU7t0iUW2Fr5uxjmEt2ozJC6e1oOtIzcvANT1rLjE
   BY5STXgV/u7MrMVuBZfnIEtAebEDjw2yj3nQ5Oo1vAlQsyqAkX1WULbtd
   TzvM6r/D/OYEs5MK6qqxFJ9IBGH2s+O2SXMZPK1iKelVg+g6QpLvSvH+2
   /Us4MvLlbUNXfLP5Z+E7/oIcu32ljgSI3urjAKt88cgq803nH8/3u04xn
   aqLcjgtzd6RvUHR+ohMifLZKcozdSiPwKgRWKFBvpLDIwdwRHO6Tu64kc
   g==;
X-CSE-ConnectionGUID: 1nSV8YO2SbeGO5c7l/0t8w==
X-CSE-MsgGUID: gifBL7TsTSGBrt1MsZg5Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1668872"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1668872"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:09:52 -0700
X-CSE-ConnectionGUID: ePCt1797RGyYDZoR/DnUQw==
X-CSE-MsgGUID: oZHWiKMGS/6p26IdPy5b3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3703732"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:09:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 17:09:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 17:09:51 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 17:09:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lNn4b6WdSule9evjfTGr1viUafCQHj9mn7EfiJaGwcbO6GFatRazofmPWEJ92rAwxp5evHLar6HRVcYYIxBdi3rssF8vIrNh/tYh91g9yl6MsCUyT9nLVoW/gqLtjcY8fu/LHtO2edr4SwII87IBStkBLFSCSQzR/Z2naYJmIyU2mfjVapycuOlN6KMZ4fwjvrLEZC3tTq/BdiIdeUaSYpns9tPEdXB6Zh2EVajMOsn6EJCSDEjks+U3ked+hw0gN4xrQozii/vZSiMJorqlaooYeTZ3oSXhFs/EpD7K38oDB45Li8nvY4OJygSfmSdBB3ErKzIoFsu6yeXc2mzRkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiqPs6CggnmZOGD23S4brF2T+SpBFp8kwH3gPCYldB8=;
 b=dRW2umhHQMv7ggR0Jyto8J9Lt53mSruSR1LRO0xtYsxgs6GOWQsCKM2nYVHo8CkCA0/vv5ho8yAlWOi9E+rmTFjS4CXGfUyoNQsl+2e7kak4DZkyUa/2IXuP9wK6oHzf+Ld6MZngOTPRo4aD+7MyaNcXOAh3memrmGmQ4MSl6V5UDCIC/l69j8iWTc6zAsEts/kHkMOFF4VZuP+Bu+EZYCKNvid+/iek3x5Szg8HeAZmTvDsUL/DlYKpCDmHUflZrhb26JKz7+J/gl/c4UkOBHAL+ERTHq/VeansnjAZo6eorFvdtFVdy8IY4xXs9/Q0zCdqoCIvf1cdUxC6l2TRVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH3PR11MB825148.namprd11.prod.outlook.com (2603:10b6:610:39e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Sat, 24 Oct
 2026 00:08:46 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Sat, 24 Oct 2026
 00:08:46 +0000
Message-ID: <9e4fc1c8-c40d-45f3-8735-94d218168b8c@intel.com>
Date: Fri, 23 Oct 2026 17:08:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/12] x86/resctrl: Add MMIO-based LLC occupancy
 monitoring support
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <afa6d022d767b0debb2aa7814699ac9842825820.1791933001.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <afa6d022d767b0debb2aa7814699ac9842825820.1791933001.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:303:8e::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CH3PR11MB825148:EE_
X-MS-Office365-Filtering-Correlation-Id: cce9d6a5-6751-4e00-da65-08df3162f91b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|261022075727099003|4143699003|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: esy5nlZyxJpWeUZ/rd+6VvlNaPthG2adTJbu4+w4i7LHE2DF/hu+aCWTt/rSfUpSEF58NHTjOmnST7mlVSooHxyEB8rvMwBQ9yoXavsfhtejEsNoQa5FrCZCcHuzUIOtKiKXD8Cg8GSHwqvdnxKJmiL0f3QsD2lGA1IKCKiILLx/l3hyYEkX9SvSdPhsm/GKP3gnil8Kd36vyMd/dl8b1dC5EwyKpN7x3+aDM91gP06eWJCOcYjVYfUb6IuxYVNU2lNM30Zl4aZzDKGvNOizTb/AZ37ZSmdz13m2xcnXr+VtM/blOw0buc47d79jbCApcd59RH/KI6iVgU0f8qfYRg5+/I7g3olrJuHFSu83PX9vgjhVAvg5tbMNOjPHwKyzoKF6gUSlGvO/JnDH1HxLy//zWt86Hk/qgy3+vKbv64yoZDJMQLS14bMELpYZJzctbK34+n2k/L8DrdfcRvrv1KQZk6c5xs79XkHFM8S4eFleNLqBR2eS7N8ZFIpF7juEyS9PtFsu/99cWEi+bQzlzJpItwyPg8Vq5nR4N//4IFjzY8LoNiCrXe0KeRqsL+SXHd2yG20orWdkAwUMJAGXIyoMd9FaB8dWebyo1YRo5Hn51KxU+QDalEf/z2qlxcSQNuXtQ/okoD1jSHtYNojRFTPR9vPjiOFL+TvaDAimcP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(261022075727099003)(4143699003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlJpMEF3NjltNlMrckROYWVCOElQKzFiMXlTazlsMExhc0Y4V0VKS3F0RlMr?=
 =?utf-8?B?cFZ5OHJoYitFUWd2MjBSeGtYbjFEUUNxSzgycGJVYUVoZFlFWnVkQ0NsMXBi?=
 =?utf-8?B?VDg2MFBsb28wSkxwdEVBQTgrcGpDRGdEOVlxa0VPZ09IaE1qN29pdXRTWkRK?=
 =?utf-8?B?ZU5DSm5yQURxb2RYdXlrWkNnbXcvMEtIZTl3OHZpbzlJRkd0Z1FKaDh3eDQ0?=
 =?utf-8?B?NWtHTFRCZHo2MmYra2hHMWdHdTF5RDZIVENyeEU2SWhNWWduS0hEcS90OS9K?=
 =?utf-8?B?dEFUWHdSMVYzbmc0cEJKR3RqSTc2dnR0bVlXdlgwV1BHUUg1Wll4ZVkwSmIz?=
 =?utf-8?B?am1MQTBPbzNHb2h1KzFLNU5uM0txQzlkUkI0MXZUWGxVM2VkTjAvRzRRcTA1?=
 =?utf-8?B?Q29McFdDNmdKMzNNbGlDdmdvQ3dFOXZzWG14YlJIZVVwQ0xFU2FjajMvWXdF?=
 =?utf-8?B?NllYZis5dGMvWW1ZbnFKd0piNTRvdkJSdFJ1eHZpT3NQQ0VFd3pOUVhibExi?=
 =?utf-8?B?eFRjZjFyZzF0VDI1ZlJLRnIxZis1MktNVkdVdU9wdXF5aFAwZDcrek9jaXNI?=
 =?utf-8?B?VmVtUlcrT2VBc1hGVm1VQUFjV0FRcm15d1FYVzExR0xaOE95YVlaRy9oSEla?=
 =?utf-8?B?RXVwNmNoL243TGxKV0RUaENQYXlhKzlNTXRPbDhPb25HV3AxTmFIaldVd1ha?=
 =?utf-8?B?VEdUTmdyeFpqb3A4V0tHaFY0Tit3TGIyWTRLUnVqdUlYSWtPUkJuS25Vb0ZL?=
 =?utf-8?B?djNQc1ZpRis4dzhXKzZ3QklBV3E2eUNjZmFLektaOGFEeWFoS2d6ajM2S2RO?=
 =?utf-8?B?bVpZcEUvakR0YVY3aTlFU2V2SjRVM2RrN2hKYys1bXRyRGwxSjczNkhha0E1?=
 =?utf-8?B?Z0U4bEwyR3Yrdnk5SEpJMVB0VWN6WDFiN3BCV0xJTDFid3RQT3pCVUF4NEs2?=
 =?utf-8?B?THQybk5HQUhWZEZ5ZDlDcElJUnVSbE1UbkdEa3JPeHUwcFgzYTJLOVM5OElR?=
 =?utf-8?B?aWJ3UmFJaGp6NGxrWmduby9iSkg4UUl5TmxsR2k3bHFJWWh6dWtFdlMxZnhD?=
 =?utf-8?B?bHBDSUFiSE02ZVFpWHRndlcvOWRyS2prek9sTDM2a2NMYVVydUtDUVQ4M0x0?=
 =?utf-8?B?M1JaUjN3R0xhL015ZzhoK3pNVllTRlNyVU1ELys0ek9IVDFUclV4dkF0L2t5?=
 =?utf-8?B?TG9sNmZ4a0NJbUxwT2J5eEovdjFKWEhMYzhWMjV6TldsYmd6SUlHQUVTMWw2?=
 =?utf-8?B?UitYV3BVKzB2YklWbE95eml5US9jblF0RkM5c3UzRWRkOCtRdlU3eWJiTzNz?=
 =?utf-8?B?aXpCQUxYcmFFTm9SeGNYK0Z0dE16V3N4WU9jOWNHMkxjTDNXbGg4aFNpaHdZ?=
 =?utf-8?B?SmpzUUc1VTR0UWd4NnVzMTkvN2c0cC9xdXJIYmNoeS9uQ1ZXaDNPcnFNRSs3?=
 =?utf-8?B?S3JwQTE0WmdWc1psZjdJb0RsaC9aMDdDL20xS01JRjJuaHc3UHYza1EwbVJa?=
 =?utf-8?B?bzZRYUJqalM3U2hhMXZ5VHFFWW5ZZDJIVmwweThmNS81ZHNDRkIvWVk5OVEv?=
 =?utf-8?B?c3JxT0lTQzVsT3N3YmRlRmc2Q3pzVjdZbmc0VG5XTjdkeDNXcmJIVWd1RE5v?=
 =?utf-8?B?aE9PUEc1RFhXRGpMU2hnVm9rTzVhSHhWdVBNejUvcnppNUtSVkowOUJUY3Bp?=
 =?utf-8?B?L0ZIVXMrSURraVIxSW5EMEVaZ3ZHZStkTitGYkdKM3lBdFFrWm5iV0RxRkFH?=
 =?utf-8?B?MmxTYXhYVlFGQlN6N0VoaFluS0VIeGE5R2FFOEM1RDZUZXh4TjU4OUdMaDN3?=
 =?utf-8?B?bHNTUkc4SGswdEV1bnMyZ0hSUzdod0JVTTRET25jS2R1MThhOWZFYnptTXNa?=
 =?utf-8?B?TnRsaDBUdk41RjQvVXNGNVFxc2R0Y1BNVVBUb1phNlY0bWU3SDhrOFV2RUVB?=
 =?utf-8?B?cW5zMmZrRGJTMSt5YldpdGh6Szd1SmY4T3J4SndhZEVxb2FlR09WdFljcllX?=
 =?utf-8?B?YzVPbmYzaGN1OUJzWENxdy9uWU1COXhKNFRMU3ZCTGVHVXZFc0xkRzY1K2lQ?=
 =?utf-8?B?MVlrLy9aMzVhSnZxQUwvQUVtMk4zSVhSMityNVlGSlUwMlM0b1M4Rm5pTXU5?=
 =?utf-8?B?UHJ3ZW1LNUZSOGtXN3ByMkw2SWRRZDZybEMzUWpmODJUOVI1TzlvVkN6a1Js?=
 =?utf-8?B?cGkvbytZYllKZm5nZWI2Z2JWUjdlbFNBUDBWYTl0ZkNHMCtLRlR1ZCtLdDlJ?=
 =?utf-8?B?cG5xQTFUK3N2ZW81ZDFabFdGbUxvbUdBaHQ4ei81L3BGcEdpbXJhY3p6M3dQ?=
 =?utf-8?B?alBtaEk2bWZuUXFSUmhteWFiSW9XNFNIZVMrMXdoUlNQU2NyeEJFcWxSUFBC?=
 =?utf-8?Q?KPAc3WyxUQUUoniU=3D?=
X-Exchange-RoutingPolicyChecked: TZhLwFC1P1cyiI+9RPqI8rkY7Nj0Vox+kxY0KB+IcPGTryu3iXK+puG40GsinGy2/IsHaCNnjUYn+gb3f+RZMNj6yFZ7SpTXQvW9N5MD5LGCM0kOujz7hUXzqPe4IPUKkjavs+KNn1Iquyugy1yhuE1mvXHhsxtl7B7HSCR2Lr2+Ivhxm9bAoVt/K2pkJKQOWgp6V3sNWNB9w0/pcq9lbQ24bmqns5RrAXicDnG2tZJO5Py7HB53RuKCO7azOnT/ROqzOgY5eWTNtnhqx6ZsD1E/9eQPKeY+ig0OEEhxhPaD9U4yYuA1d2T2CLn7p+OxZ/YbP1PgUEkID/QRV87nLQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: cce9d6a5-6751-4e00-da65-08df3162f91b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 00:08:46.7009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ne//bV/iIRRNinto5T8KhYEOvfRvquj6wt8y9ucbIQQzx7oWphaz/VtJ8E5GMfHC7bKhrI9afK6GR1CxeLulI0HmKBlFoCye0xUnfz7B1zQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB825148
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/13/26 8:01 PM, Chen Yu wrote:
> Add erdt_mon_read() to read LLC occupancy via MMIO and use it
> when the platform supports ERDT. Register the L3 occupancy event
> with ERDT enabled when available, falling back to the MSR-based
> path otherwise.
> 
> Use the CMRC (Cache Monitoring Registers for CPU Agents Description)
> ACPI sub-table to read LLC occupancy counters for each RMID via MMIO
> when ERDT is enabled.
> 
> Although the occupancy counters can now be read from any CPU via
> MMIO, keep the per-domain limbo handler. A global handler would
> still have to iterate over every domain and would save nr_domains - 1

Please write what "nr_domains - 1" means in English since as it is written
it is not clear how this "does not justify maintaining two limbo handler
models."

> worker threads, which does not justify maintaining two limbo handler
> models.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---

...

> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> index 110e7b9806b4..1a9847a11de8 100644
> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -27,6 +27,9 @@ static bool erdt_enabled;
>  #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
>  #define ERDT_DOMAIN_ID_UNSET		-1
>  
> +#define CMRC_UNAVAILABLE_COUNTER	BIT_ULL(63)
> +#define CMRC_FLAG_UNAVAILABLE_BIT	BIT(0)
> +
>  /* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
>  static u32 valid_subtbl_mask;
>  
> @@ -52,14 +55,84 @@ static unsigned int erdt_scale;
>  
>  bool erdt_support(int flag)
>  {
> -	return false;
> +	if (!erdt_enabled)
> +		return false;
> +
> +	switch (flag) {
> +	case X86_FEATURE_CQM_OCCUP_LLC:
> +		return valid_subtbl_mask & BIT(ACPI_ERDT_TYPE_CMRC);
> +	default:
> +		return false;
> +	}
> +}
> +
> +unsigned int erdt_get_max_rmid(void)
> +{
> +	if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
> +		return 0;

This does not look right. Why is this restriction needed? At first glance it seems to
be a quirk used to simplify the get_rdt_mon_resources() changes but not actually
be the right thing to do?

> +
> +	return erdt_max_rmid;
>  }
>  
>  unsigned int erdt_get_scale(void)
>  {
> +	if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
> +		return 0;
> +
>  	return erdt_scale;

Constraining a global value to one feature is confusing, could this
instead be, for exaple, erdt_get_cmt_scale() that returns erdt_cmt_scale
that will be more accurate and clear why the erdt_cpu_has() check is there?
This change can be added to the introduction of this function when the patch
doing so is placed correctly in the series.

>  }
>  
> +/*
> + * Compute the CMRC MMIO offset for CMRC_SUPPORTED_INDEX_FN using the
> + * MMIO_offset_for_RMID# = (RMID / ClumpSize) * Stride + (RMID % ClumpSize) * 8
> + * formula from the Intel RDT Architecture Specification.
> + */
> +static u32 cmrc_index_function_1(struct acpi_erdt_cmrc *cmrc, u32 rmid)
> +{
> +	return (rmid / cmrc->clump_size) * cmrc->clump_stride +
> +	       (rmid % cmrc->clump_size) * sizeof(u64);
> +}
> +
> +static int erdt_read_l3_occupancy(const struct erdt_domain_info *d, u32 rmid, u64 *val)
> +{
> +	struct acpi_erdt_cmrc *cmrc;
> +	u64 l3_cmt_count;
> +	u32 offset;
> +
> +	cmrc = d->cmrc;
> +	if (!cmrc)
> +		return -EIO;
> +
> +	offset = cmrc_index_function_1(cmrc, rmid);
> +	if (offset + sizeof(u64) > (u32)cmrc->cmt_reg_size * SZ_4K)

Could you please explain what this is validating here? 
cmrc->cmt_reg_size is already u32 so the cast is unexpected. These comparisons
with different types can be tricky, looks like right side is 32 bit and may be
truncated before the comparison to left 64 bit?

> +		return -EINVAL;
> +
> +	l3_cmt_count = readq(d->base[ERDT_MMIO_CMRC_BASE] + offset);
> +	if ((cmrc->flags & CMRC_FLAG_UNAVAILABLE_BIT) &&
> +	    (l3_cmt_count & CMRC_UNAVAILABLE_COUNTER))
> +		return -EINVAL;
> +
> +	*val = l3_cmt_count * cmrc->up_scale;
> +
> +	return 0;
> +}
> +
> +int erdt_mon_read(struct rdt_domain_hdr *hdr, enum resctrl_event_id evtid, u32 rmid, u64 *val)
> +{
> +	struct rdt_hw_l3_mon_domain *hw_dom;
> +	const struct erdt_domain_info *d;
> +
> +	hw_dom = resctrl_to_arch_mon_dom(container_of(hdr, struct rdt_l3_mon_domain, hdr));
> +	d = hw_dom->d_info;
> +	if (!d)
> +		return -EIO;
> +
> +	if (evtid == QOS_L3_OCCUP_EVENT_ID)
> +		return erdt_read_l3_occupancy(d, rmid, val);
> +
> +	return -EIO;
> +}
> +
>  static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
>  {
>  	void __iomem *addr;
> @@ -161,6 +234,8 @@ static __init bool cmrc_init(struct acpi_subtbl_hdr_16 *subtbl,
>  		return false;
>  	}
>  
> +	erdt_scale = max(erdt_scale, cmrc->up_scale);
> +

This change is out of place.

>  	return true;
>  }
>  
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 88fae7a84fc7..3561a7ae8c7e 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -291,6 +291,8 @@ static inline bool intel_handle_aet_option(bool force_off, char *tok) { return f
>  bool erdt_cpu_has(int flag);
>  bool erdt_support(int flag);
>  unsigned int erdt_get_scale(void);
> +unsigned int erdt_get_max_rmid(void);
> +int erdt_mon_read(struct rdt_domain_hdr *hdr, enum resctrl_event_id evtid, u32 rmid, u64 *val);
>  void erdt_init(void);
>  void erdt_exit(void);
>  bool erdt_try_bind_cpu(int cpu);
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index e66e4c845739..93ee638119d3 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -283,6 +283,10 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr *hdr,
>  
>  	switch (r->rid) {
>  	case RDT_RESOURCE_L3:
> +		if (eventid == QOS_L3_OCCUP_EVENT_ID &&
> +		    erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))
> +			return erdt_mon_read(hdr, eventid, rmid, val);
> +
>  		return arch_l3_read_event(r, hdr, rmid, eventid, val);
>  	case RDT_RESOURCE_PERF_PKG:
>  		return intel_aet_read_event(hdr->id, rmid, arch_priv, val);
> @@ -438,7 +442,7 @@ unsigned int resctrl_arch_round_mon_val(unsigned int val)
>  	if (!scale)
>  		scale = boot_cpu_data.x86_cache_occ_scale;
>  
> -	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */
> +	/* h/w works in units of the occupancy scale  */

Please move to patch that introduces the "scale" usage to resctrl_arch_round_mon_val().

>  	val /= scale;
>  	return val * scale;
>  }
> @@ -447,12 +451,21 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
>  {
>  	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
> +	unsigned int erdt_max_rmid;

Please do not shadow globals.

>  	unsigned int threshold;
> +	int max_rmid;
>  	u32 eax, ebx, ecx, edx;

reverse fir please

>  
> +	erdt_max_rmid = erdt_get_max_rmid();
> +	if (erdt_max_rmid)
> +		max_rmid = min_t(unsigned int, erdt_max_rmid,
> +				 boot_cpu_data.x86_cache_max_rmid);
> +	else
> +		max_rmid = boot_cpu_data.x86_cache_max_rmid;
> +
>  	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
>  	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
> -	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
> +	r->mon.num_rmid = (max_rmid + 1) / snc_nodes_per_l3_cache;
>  	hw_res->mbm_width = MBM_CNTR_WIDTH_BASE;
>  
>  	if (mbm_offset > 0 && mbm_offset <= MBM_CNTR_WIDTH_OFFSET_MAX)

Reinette
