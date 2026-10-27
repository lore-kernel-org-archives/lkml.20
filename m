Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793117810;
	b=qXheZ+EilTD8POA0M6IHXz+GBRi4DRd+QlexxQFdM+tfHwjCAqN8NbCKkquPmsdbGrxS
	 ilFh99J7zCdFP+M9f2Ftj7xK2qrHcUbf3VM122EDZVYfgayAhEuaAbEMGdAmUNSKZmTRO
	 hTl98+dQzA441s1vlRIBQ6H8mBUPcLpiWNiRc6qeOXOMA+bHE3isSDE3hhAGZNJNr6XMV
	 qvyJ0rLOt4XXGede5fEOL0/8k03H7BlwkV/nr6sRpArnCTpaK7AgedRDCWo2nVQvFgqr8
	 DKEWxgdHh0LG+vla9/3W5i/wmf6t7VtR5v8OKAvrmQIEbIS9WBX30KwDTWpzX9IFFBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117810;
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
	bh=g4yZYqdeNuR57bFocQ/p6r9PZPY6CqZGJMCJiIhjI0w=;
	b=OZ6RJhHkK33AwweFlKcVShGhiKVImKS8Lb6mPR1RTAr+dptyIg7QQ0bS8dgr+KeFOoNZ
	 zgtgb5Rl/wXrLCP+V4LG1gBXJKAyIK/HBYZhFkvF4/Ez7McO7sQPPq9VdwM9cIe8vnTzU
	 X7K5oo03DlQhxap3mmqmoMDCgoweLFjaW4f6j4sVYLqEGM+6K+fCGdBeKBb6SleBc5uQs
	 hE6x7CO+aNW6shUmZCqhd7OTdXGx5Zsi9uCkSiWRmMtQJ1rI6lz4F7tHc54tddkmfc6gg
	 v2Gsntllk0vXSAFj5n467jUhZqImQ0ZXFfyiZt3pHN4+YRYCZKcsx5UhCWQkYA5V+cA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X3yJiL52;
	arc=fail smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C84606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:16:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30C84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X3yJiL52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793117810; x=1824653810;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B+MRrCZwVxjVB0AFzBb3BgkwaDWwemJIpjyInY0D1+k=;
  b=X3yJiL52u1yNYbSXvQ9BNOxYFnPmqKzDMeWRVX/0+EGdDl543aRCGLsd
   vUG7Qq/JX6eLTThPXfvAJM/rnckkdq+ZLOP+RM+1123jae2vhXHL7COBI
   MG45DsnbY0EDrWhTadxg1r9V1uxitkdWQ8I/zNUTnxiMyPvYqmq7iNsL6
   86cdd/p7jLFizEbF8382dzIPIitPWs41oovjSuftdV8WX4+SOwIy3DwnE
   KoWL+oCvRLw0mZ/vK/8pcKw9KegxuGnzkspgMCIVeieskuEcDnU7ZeK9e
   YYuskEwdJUkSk6R13ytl9z5QxzKiTv/PUhE/ZHPDQf2iYPIgPl4n+Khst
   g==;
X-CSE-ConnectionGUID: BQiTzVNtQv6BR+QzYdb0Tw==
X-CSE-MsgGUID: F513/D2aR7qFBplQT7LdWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1853593"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1853593"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:16:43 -0700
X-CSE-ConnectionGUID: Vv+ZuPqNRuKtnMlTAVmOQQ==
X-CSE-MsgGUID: ApIqTlm9TGGO196DWSbGwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4621707"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:16:42 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 09:16:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 09:16:42 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.12) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 09:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=asotH8OBQA/MoV/ifO91BHkxUbwRPZ5zdwUfwsPOzLMUprvdwXQHxzhW9nL0T8/eGtk3CAraV82adFH4qW2jGn1QfJs5e/2gIuml1hIjjIKChV4xy6N9NS4y/4hB3eD3eSSbJWck42K0LrKOtzUvAox8asRxUwEyNgHLLh9NEafehWoaKRXXJA7Yjtmol+EULiadA+3+qzIpE2l6uqkKenKZktkEsPhOUnzWZyG0xeV2HX9Nc1fCggCOt+FnA/d9bSrqMchoJCdNldaJseDX1OWDIFWdBvyG8nJEGQqahFqrfB6gFRmiYVmWyZxVT9rCDZLbQNfhllR8URWnaobr8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4yZYqdeNuR57bFocQ/p6r9PZPY6CqZGJMCJiIhjI0w=;
 b=Zx1VhmNNL6tRaa/AzcmoYQZG4aCFJrjN7sNvtNXxov6IePnJP76cvPw1H4RcBxz8HDqs5kJxoh9aNrErPqCS+Cb0mhSBAVITqTqsgSrGtVADfm4ceNqMuh1WpDZjGNUMbIGNYOuvya7D8cAEZ12vs0JRQblelG066fmTwm6nhMsPUmRb5a72VyO1IaQJAG/uZGDB93iy6arBrnwbZCZzQ6vHrB1ICmCPEWuitwhDOkvkzXKbpOo82bQD4KMBnGipz2tk+VZcSGpAJUjCpUDq5TqdlKBDq7gkAbefKaf18CSAPv+qICJ+PAzDeRX86ZGTtmrV8RDoH4pZdMtSxlNzYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SN7PR11MB6876.namprd11.prod.outlook.com (2603:10b6:806:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Tue, 27 Oct
 2026 16:16:38 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Tue, 27 Oct 2026
 16:16:38 +0000
Message-ID: <cf99e4d9-d5fb-4435-a8f6-a83add85ce16@intel.com>
Date: Tue, 27 Oct 2026 09:16:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/12] x86/resctrl: Do not enable ERDT when Sub-NUMA
 Cluster is enabled
To: Chen Yu <yu.c.chen@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <eefa12618e3be5b5e19a88a343d192ab8d9049ae.1791933001.git.yu.c.chen@intel.com>
 <40ed95c5-a103-4139-a802-893c4bc8a497@intel.com>
 <auBmvjC2ARQ_CNcG@chenyu-dev>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <auBmvjC2ARQ_CNcG@chenyu-dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0253.namprd04.prod.outlook.com
 (2603:10b6:303:88::18) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SN7PR11MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: fcf8d283-ef20-44cd-c451-08df3445ad8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|261026140227099003|4143699003|11063799006|56012099006|261021121427099003|261022075727099003|261022105027099003|6133799003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: yF0gevn4C8kBXJ/7OnPXepT4aN3ILmK55z/M7DhYQB2qSem5tbfAfbWTjlPIjBf2YRb9pTkrFpxyTXL9yiBzoeKwsajezzHbnci0Y2VEYDHTGowFZCRBS69Kph1pJRFNHD+JrnykeYVBMV7XeCqdRT11o+xOCCABhMFV4+Rs/qMKGueK1YMsMHexHBCHMpbTNBScIqTHFU+ZjtikQ0IvmFuVrN82skdi8EnlA3Hp0k8x5EwRY0Yy7oK0jTG3PAU/8bI0F4zX6bE0fvi2OGdDnnk0V3usy5bdsBTp28KXahvwWP2bMfDNCi72rfH3H2SRutuKwGC75qfnBa5WBK7fR7MPjHhb8OhHJLLEyKCS5glG1rwf8cwHzBuqA4JNGvKX8XCfUnvRzMF+4gp1ucaTsAFW/JuP60WNJYSMItt57KOAfVNKyPsYEisdg2u8bU/YIlrJ6by7s69bRsHG9/Gcngo04jExLLbFReQwL/+rVaGquY/wfCtlb4swkIRww2hjnFt2ylL1AmWGVfTR7GvVosozbl1t5pXOo1bB1H1V/DafDOGG+7gCZv7SQ6e0s8zUaHwc8G2ff1a2zKIRxv4UI0jDNEDWJlVoGURCzQzjOzdMOInDwG/mfqHgv1rAdOjczj1naziCDLEMNuyuDeWQCyfGU4Bh9TCyW4XbB1CGMpY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(261026140227099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(6133799003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2hJS094RmxBL1BmMWljcVZhNHg1eGVuRk1Id3J1NGlESHFEekxCamJrN1l6?=
 =?utf-8?B?a2hBaGw4VjBkaEhuRiszV3F2WUk2ZmxHdUFDU3hPeit4UUJvMmtSSzdQRjI0?=
 =?utf-8?B?emhsUHBQd1hMek5nbnZYTTNKREtZcUFqbWVaemoxOC9RaW5vVzZqeWlVWkM3?=
 =?utf-8?B?V2NybUoxcEprSFcvZVhEUTU5dXRobHRnOUZYcWoxSkdta3huRjBsTWx5bTY5?=
 =?utf-8?B?QjhyNnZONjR4MGt5UElkSXhGVEt4V3FiMDRvbmM2RUswRlF4MnI1dVlHd1c4?=
 =?utf-8?B?NzNLSmNqUjdKc09RK1R2YmUrblVPbWtSYXJFKytBeE5mYTFta1FQQmdXd0Rr?=
 =?utf-8?B?b2o2K3h1YW91RzdHUXVYb3dCZmdaUmZ0NmVHWFdQM0hKSWh1QlcwdnlHaEN0?=
 =?utf-8?B?Ym9ydWJNc2ZROHp2Y1ZVQ0VBTXJsOUZLd2lUNjFvbHo2dFVOVWZPaUFyTTlW?=
 =?utf-8?B?QWh4V2h5amZQOUFPNDkwZHI0OWdrQTd0RDcrUHBjTDJuTUxyVzExaTRnZEdK?=
 =?utf-8?B?M0wzVDVTZE1mVXFkNEgvVlVFNStGTElkZGVsa0lwR1lNaDNKeSsycjJYOUgy?=
 =?utf-8?B?ekpMZWJKQmloZi8rekJNUSt6b2dpcnNpR25lVzVzZ1lyK2ppd0x2V0xxa1I2?=
 =?utf-8?B?S1MxS2JjMWdRUy9pSnphZHY1SEdqNG5laE9wWU01YUl5bEdiczdpQU1ibmll?=
 =?utf-8?B?UERWU25qKy9uOWxNK3pnR25XMXBwTXNKRTcxWTVzT2R3MmVlVDFKUGFnVnc1?=
 =?utf-8?B?REo0OWp0TGtOVkxVWjhVam1vMjlGVnA2NDZuZEczN0pjZlAvR3pjZ3lXYnFP?=
 =?utf-8?B?cmlDdFdZOEFlbDNwRGhkUEdSN01ZaENCRnZwQ2tmTEJhRk9MZ3NBbkhJYmdY?=
 =?utf-8?B?eldzRi91Y0VGcEo2VnpZZEFQMUcwWlpLaEIvdm4zYUpsV3dtY2NnbVRvWEZY?=
 =?utf-8?B?cys3KzAzcmRXM0M1K0ZMZnY1dDkxL1czazAvUm5acWhlOUY0YzBJZ2NoTEIv?=
 =?utf-8?B?b1Z2YXdDNHZ0TjNmcUI3T01KS282N0VtRDdjNng3clR6YVJUV1JCbU9YU0pO?=
 =?utf-8?B?WTEzY3V0T01JRnZ1eTlvbnlLNEtuang2eEJFRDVaZnlmS0RQTFNpMS9IQmIx?=
 =?utf-8?B?b25wWnhGU3A5WWQ3cHpyUTVsMnpJYkZpTzFyVENMUy9YVlpoRlo5VHBaamZO?=
 =?utf-8?B?Zk9vbGsxeitKd0lxYXFuUVdCQ3NXSFZNSGZKZlhxbXJLYTZoS1VWVUdmWElj?=
 =?utf-8?B?Rmd2V2F5V09LbFUvNnR5OHl2Ly9Qbmp5eG9telpzOStzNzNZL3V1MGpWRnZM?=
 =?utf-8?B?RXNteEtoN1BnOXVENTdWZVdzWHRXY3B3WlJ2TDZ5SnhJSnprQzZJdVNwMnBG?=
 =?utf-8?B?NDJDS1NEZkxEK2N0a08zT2lqWmx4TGtsOXN0U3lheVNhZkdkWmRZUTNERkVk?=
 =?utf-8?B?T01lZlVudlYvYWlid0hGbFdVSnp5bUxRZjNvSFJSYmorL0w4djgxMXZSQ1Rk?=
 =?utf-8?B?aVhhcHlqdThYU1pPbVRBYTlCWFdGalZpOUhnVzhFUjV5WWlBTkRKWktBTXk4?=
 =?utf-8?B?eUU2aXpSY2VEYkpjVDNaNkl4VENza2pXZlFtTmxBa0ZmeTBiUUpXNUtyTEVa?=
 =?utf-8?B?eE1ZVFlXTS92WGtYSUgxQ0l1Q0dZRUZpeHMybDMrZnVGVEVBTUt2YWV0bG9t?=
 =?utf-8?B?WVoxZEtkYXJGQVB2WVFac0VOa3pmQjllUHRSa3FscEd0QVVsaTdFM09vci8y?=
 =?utf-8?B?SWUyb3hLYUduSVN1MlBXeVhkdDdZQksyczBmNDc2V2dLdVNVY3Rpbk9PVnJl?=
 =?utf-8?B?S0dXamU3NG84allkeEdIcGg2YVhYeEYwdXZHK1VZWjFTdWgwMDE0U3ZEN3NO?=
 =?utf-8?B?T0tyRk9Jbnk5T3cxYnIrL3p0T2ZnaTQvVC9MbVZYMHcrcVNNanJhMVE3OGR0?=
 =?utf-8?B?c01kYnRDeDlKME5GU0Q3L05iRlRIWm5oMFVQaU5Vci9pU08zK245K2xpS2k4?=
 =?utf-8?B?YUpMcHR0L05Nb3dyQlJjZ3NsZXRpdlduRitXWjJ3dmZqU3RFYWUwd1NvRWJ4?=
 =?utf-8?B?NnFtTlBPRHVRNEhyc05TTnZmMWFDS0VTeVNVVUNiMmRtNjNZTlUydGxzbnlh?=
 =?utf-8?B?SGVHRitPWWZFTytyZjVNc3dsNTlZdUNnTS8xMUE2TjlkckZTeGI4Y3lQOGI0?=
 =?utf-8?B?bzlSajJFTHVZSnNLeExzMy9YNmVTVEJDTEtFOU9VRzZWbityUlp2Q3Brc1FM?=
 =?utf-8?B?WFEzcTl1anQwdHZtL3ova3U2RjRWdkR6NGcrT3NyMkYvZlprSXRMazdHL3dl?=
 =?utf-8?B?eTdWN3l4WVlQT2NYT3h5QkRZd1BMMVg3RkViMFZielZSVzVaMUtVMmJ0TFJo?=
 =?utf-8?Q?ZWOPi6rQQKb4kBjI=3D?=
X-Exchange-RoutingPolicyChecked: MF6tIMnmOa3NbBMIw1GKnoC/OSRYE+LoBKbWEpFw9mODMUFiLxXxOAssTcJiix/CkLpil358K154fDQBAWDvfxX978/YlTzUWYJiBCdGPezhuE7H4vLujWx2kq/VbgGu9yoRr9cMB/nqmUuq2D+Lty2t1kD5IPNHxcrmGyZCjUVbKH7+IplSjVuBPDUgX9H4Y++ynPQXFQjRltA9uI2xnUm6Jp14u+W1xSzpgKMaKwtaGAWSc5LgpOnn1BJfTbRtvZenYvHnax7mITf18dCmTbq0njzZFz0kf8nZC8zn6prBP1GUADibWQuKt6V0BXrVteinJJkU9EsYvBaC9YdvhA==
X-MS-Exchange-CrossTenant-Network-Message-Id: fcf8d283-ef20-44cd-c451-08df3445ad8e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:16:38.0590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03nlMES886jG9NQkpmuaMBcSDBtF9eZsuovTLoZe/9F7e98T/ePuOs3vhao4LrAQqpTi6ueAGSB4f9i3AOyHzWOLA64a4QKhRZuNyPwQkls=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6876
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/27/26 1:54 AM, Chen Yu wrote:
> On Fri, Oct 23, 2026 at 04:54:04PM -0700, Reinette Chatre wrote:
>> On 10/13/26 7:58 PM, Chen Yu wrote:

...

>>> +__init void resctrl_arch_update_snc(void)
>>> +{
>>> +	snc_nodes_per_l3_cache = snc_get_config();
>>> +}
>>> +
>>
>> This looks unnecessary. Could all these references to snc_nodes_per_l3_cache be dropped
>> from monitor.c?
>> Definition of snc_nodes_per_l3_cache could be moved to core.c where it is
>> initialized now and its initialization could just be open coded in get_rdt_resources().
>>
> 
> Yes, I moved the definition of snc_nodes_per_l3_cache to core.c and initialize
> it there, but we cannot move all references to snc_nodes_per_l3_cache out of monitor.c
> for now because several places in monitor.c use it. After all, IMHO snc_nodes_per_l3_cache
> was mainly introduced to deal with MBM.

Agreed. By "these references" I referred to the references in this patch, not _all_
references. I do expect snc_nodes_per_l3_cache to be added to internal.h and that
existing usages remain untouched. 

Reinette

