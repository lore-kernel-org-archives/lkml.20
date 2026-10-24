Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792800140;
	b=gpQld8ZHM8/sSgTmqhMmO//oxthnbO4f2ScR0/ZX0cvlHVKqqf4c7TIkzxQZMa8wKUhR
	 LvDLm6PB3bJcJNr+TZ/JWD4ydzuGq24guY0Eh3apXNODAAKwXyX/TKwEBDkqobkIJthrd
	 w7N3o9V/mFoLvi/tbqGDxnI2hDFc58Hi1TLeECNZc0YTdLoJF+s4BCnFncsEyHlYxjOXX
	 ybonMrkKjlkc38RaBKlV7bP4X9mZ6bgt6U3AEgO7BaMiQ+UhvjJNaG6u82CIv0p5jPvqZ
	 UUkC8et95cnG8H5IXuajv+pLy8ItPc2mcAqD71flt88/iPvNs0EZI4Izus1/ZOYO1MQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800140;
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
	bh=bxpL8C3aPN6IJDGGUJqKxuXGR9KWeOz8FZFAS1z0RHc=;
	b=Rzrb3WzjXz49zGtEYfYuuuSAZP0REui0BqwAYrM+8aHh8j6k1kaTPF6BCUeGMmF46h8u
	 nTBjX0FPIU8C1ouydl22ctep6pgd+NTdbbQK9fvY3wCelyOsNbwGeawpvJ9IcHlpnON+j
	 xQgUADe/nby26ptqMbWR0bpqz1sispS2G/N9FDnDQyJJGLa53/zbOWh49gIinBF/wLhxv
	 7sMzbSJGRfYO3U2BJmgiPhfXfUUepJnUECPg7iHwFZit4rTMx/ehh1TqmcxWu4inRqFJP
	 ZtExAzKTHfJT/QXtibyguYC7PXQObobp9IAZTGmI6L9qT67qYgsNitSj1kxDcvyA0Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBWzwJm2;
	arc=fail smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C83606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88C83606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XBWzwJm2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792800140; x=1824336140;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lmWv8N1JqRHhKPuEM49wRm7BHBVHGJwtlggFrByfeec=;
  b=XBWzwJm2s1k2Lo8Q/sIBUnWistl3YmlEJVVAQEOmYHu8PpLz7dG3aqwo
   /DFvbMB76IpytXb/xj7FP0FQIdgSxEOfNWM+auJgeNZHd0yS6vKViP0zd
   /Jvj5++bgOc+VmOPaJfkNjm0zDwcc6tuXZftUsh2Z+sTL0NIQNKR0piBG
   yqB4V25GbLdBo9v65vo5bA8Y670Ceg3Y56o5Z8oFqua168K3SI8D9R698
   /WhJb8xZZPIJkmA5lOnP09YCkRk49ukIpQ+AJYHKjcbNmBXHZBxzTphnX
   Kk3EVPXLRsCT2uqD8DnjRTZpNQcurvUeScBhHQxtQfwYvI7gKvCy2nPs+
   Q==;
X-CSE-ConnectionGUID: P8DyVng2SGCvYl4gc0ilcQ==
X-CSE-MsgGUID: 5OYEIOawSKmF2CRbpyVDVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1551315"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1551315"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:02:11 -0700
X-CSE-ConnectionGUID: FyZ4a5UZShyKa8+jl4+e8g==
X-CSE-MsgGUID: tku6K4IXTF6qUDrNj35LEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3833179"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:02:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 17:02:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 17:02:09 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 17:02:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLZIpeOlTLU8odHv/cxhF4UwJpO/I4nRhphSbHBe2CvAvTFsX/3T6+9xWqf0Dri5LpJPLZ771fB0siOJMy4SPD1HXa/hd6LOLA+iQGpyIepadbmpKQ7akEzWYOHc9UuyeZ///qT3QsQuCiCg9l48GLtmb8knVGRfY8Az/NfCik6K+onZ89XQWwWj+CGQ/Q9Rs+Qof2utrEH1VPSh0TPWOYXrYkr9Z9vseQcCookbeM4NlCXAExTGtgc446Rl7NNPq+Mqtji/Y6cQrXB1dfIPa0ypgBQFc53k9giPIxUjAFuKFNlnJwMZUIYO+HspG/kuuVNOQa7cENyBpRaUGJb8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxpL8C3aPN6IJDGGUJqKxuXGR9KWeOz8FZFAS1z0RHc=;
 b=MMmWY8UZSX50aVFXIR7KmhiK12airBV/rXEYw2SrkZ8VISAzAfuLXTTuDwtzZxaMc0UAbExv9SaJ44ZEogJuUvhl323Bor6/0oNoBe3Tca2/AxOYO0OHYntI0NDBxaZfRcCI4t0UajEw/dM9+g3W+6S+k+faa5wGgPjUTcd0fUcVWv2XNsZkTX5x+hY+SiNzMYJRmRK70/bjvez4LdAiFx8lY/Zxv21teo2NsJbAI93rbIdYHDsg2HGdPUKF7iAVYFpgcQEZuipvmOMmdoDNyEESKjaCVGVugd14fAFb2al2oMTO7NwTFdOBhXu1hMtwLzmZzKSvfwGrQpnDJmv14w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH3PR11MB825148.namprd11.prod.outlook.com (2603:10b6:610:39e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Sat, 24 Oct
 2026 00:02:07 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Sat, 24 Oct 2026
 00:02:07 +0000
Message-ID: <4e594656-b883-47c3-975c-087d10b98c74@intel.com>
Date: Fri, 23 Oct 2026 17:02:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/12] x86/resctrl: Add a global ERDT monitor scale
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <ec2671aec51023ffacc8bd265a57f7aa09195d23.1791933001.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <ec2671aec51023ffacc8bd265a57f7aa09195d23.1791933001.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0375.namprd04.prod.outlook.com
 (2603:10b6:303:81::20) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 20d685f1-8777-446c-b05e-08df31620ae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|261022075727099003|4143699003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|22082099003|6133799003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: R4U8cdnCEDriS0oa8IOz1e6b4JoHRiGoGNqqmhk0TLgXZQQqGkCk3xDHChW2z0OvUf01Y0Thf6a7NOawWfymkWj5tHQlXx5OSVP3+Zfx1SFqL7K0TAKPRsB4HkWbshK5dNJVex6ZQGRj+IF0pxM/K4bMBBG/U9W2MOHu2UsAV0wKumG/CF2xH6dyCmDOTD1URXtkc9UdVjRAldb0MbbJX7EsZeKdaNy9Nw3xqBPgn6wT4CTHAddnXyqI8n8UbSJGGgPFtNkgQty8MqYVAG8pwrRk4zhzKEHkoH4bgUKR3+F+oIuc5y2w0LNptVmi9UKvQFxWVfO0dnenIx2iuujdgKr0PkBmv4+iEMPmLv+6sLpeOL/6j2MNTlMLOt+8IUw7kyhz3jn9ueJV/BV/Ww/ssIQve+MQ8EBTasuZ7JSutXip+q6lENJlAHn7lLB06MyaL/dpp6rH7JdVhzWfW0XQaRW4Gd2jpMgXMNtGFNBHa8+q6Aa4ruBofqfJdnZUlwWFc2Dl8FUwwD/sqjQ68WUbq9jV6CxAA3q6El6J4Fa+RNP9Ur30s7Zqcpwh350+xgASrF93fNNhJfWhdZDtFgvnfqf1Syve/GJDVMzAdEs6GZ/uZEaGvE55VJ2f8BUqVXzCiFrPcLvt3Q+I9/mN4IjZuKsfx1rPUVX2PwpWWNbna+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(261022075727099003)(4143699003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(22082099003)(6133799003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3QrejRqeUtYekhBTVBEVnZQSllhZDJWcUwrbVNpaWNFREVMclREN3UvUDRM?=
 =?utf-8?B?OEFCcHVQWndZQXNoeHZRT2FNcUFteCtta2FvUTU4TjJSWXczY1orTmZ0WGE4?=
 =?utf-8?B?WS9ESXBVSkMxdFJsL1pnQ1NzMXVzOE1NbDF4bUJmWllSbXBwU1lBUm9NZERK?=
 =?utf-8?B?TDF2bXRJTEZJM0wrcjEwb29pSGt2cGN6VkdIbzJvbTYyQk9xVUVmRHRkQ2ZY?=
 =?utf-8?B?NktsMTNaeGJFM2ZuLytyNmM2QWdEcitrL1pua2tOWmFkellBSnd3QzRPanF5?=
 =?utf-8?B?Q1NCMm90bFo0SlprRFhpUU4wT3lFMlVzdW9JUEZieExFTFRnS0FuTXlaa1pp?=
 =?utf-8?B?ZERSTDAyVkRFS1BERXBQRTZUbzVvZzNkd0JJTytsZ1poMThKUUxYbXUxdFV2?=
 =?utf-8?B?SFp5bXBSR2VoRDFibE05eVFQbDQ1cVFaSjYxUmZYd3REQ3dxaUg2a0JjSm95?=
 =?utf-8?B?Z0o2SUhGNXRYR1U3djdJUEFvc1MxQWhpR3dwV0xTbUZ3SGNOSWdBSjdweDZ2?=
 =?utf-8?B?QnJXc1NxY0lvOXJveCtYbmFBckwyenB3d3RjYS94dTZ2cExSdUplclJMNHhW?=
 =?utf-8?B?UVpaM0I2RGZ1L0RyRWhyWlR3MDNTNXZ3TE5NV2t4MXZDSWxnb0k4UHh1bHFJ?=
 =?utf-8?B?UmZqWG94bWs4Z0dLSUNJQjdDU2ZsSTV1WUd6TmtYQTFPcjJ3cU5wbUdmUVov?=
 =?utf-8?B?Rno4TUI4ck00OVRFWmJGeGsyZnlFMVNCN3c0UU1XcHlSSDluWnZndVBod21j?=
 =?utf-8?B?Sk80bGRMVnVyT2NuY0JEWEJDTnp1WDYwNXd2bjhTMHVVaFZHenpPejlta29N?=
 =?utf-8?B?ZWRWTkNTbk91Q1JEY2VFOWM2YVNZOHdVbDRuYkVLeG9zTytlb09wWnlYSkRV?=
 =?utf-8?B?S21pcXF1QS9SU0ZmL1hmMlg3QXBMWGN5NTdyOXgvakpHSStqTG90VnFaUmNn?=
 =?utf-8?B?c0o5OUdGOHU1eU42aldsVkt5VGpFVWMzbHc0OS81TFJSREp3elVucmlHM0xl?=
 =?utf-8?B?RFRxYlhvVU9VK2pTMFpab0ZxUWt5c2M4WTdobExxQndZc0tCKzRuTHNjRFBL?=
 =?utf-8?B?WFBLTXY4R3dmK3NYbmRIVlBINVJ1Zys5N2oyUjFRenYyWG1GTlFxcHI1cmJ2?=
 =?utf-8?B?U3JQNUFtTGxMVktLa0Nud0NoTnVxNkRQUHhRdFZOeEcvRjJmTVBnQUZmR0N0?=
 =?utf-8?B?cFppdDY4WTMzSktVa0YxSE4zRWIzK0hQNDJ5R09XeG9Md1hseHZrbFlJd1Ew?=
 =?utf-8?B?bW1CWFkvQXRzdXRiU2FIRVJsY2c0NXpQenhBMUI0c2h3WE1YS1JmT1doV2xm?=
 =?utf-8?B?azVaT1FzU3JzRkhyMlZ1azJPY0dnNVVjYkxNeHppeHNiWDN3RGIwOUZXaW55?=
 =?utf-8?B?ME1SVzRFMVhJQjNVM09ZRExFYStSeU54OGN5S3J1dExZcXU4c0tPYXJGMHQw?=
 =?utf-8?B?dm1YRkhoR3NWK2dhUjlTOVdHdHVUNFF1ZHJuekpQOW9TTjk0VmNEK295OWg2?=
 =?utf-8?B?NkdFTUIzeUtMc3FhRjVXZ3YvY3FCK05JakErUGtUbUptWDNBYzN6dGZXSVVM?=
 =?utf-8?B?UWtFVVY5MlExTDRzMVg5dmdLOXcydkhrRnNIdGhZcHp3OFlINHEzT3prZWMv?=
 =?utf-8?B?YjZFejVFc1BFd0N1UzZNd0QwT0ZobTFuNGUvSXZ0b0JhK0JCN2paT1VIZFhq?=
 =?utf-8?B?MHozR0Fra2Q4V2tDM1JPRy9KNXppMjYza0swZjZjRkN0b2xqNUNKNkpaWW5O?=
 =?utf-8?B?VGpXblp1Q2JQdEVoTnlpclFzZDlnc2liT2tqWFBwUTU1VlZ4VlhYWTJ6dWNw?=
 =?utf-8?B?YlZkQlFBNElkeU94bFQ1K0JCQVM0WXJubHpoODFlTzVxMkJMUXZQNzlsczlp?=
 =?utf-8?B?Ujh4bURncTB1NU03ZGhRa2JMK0FBdXF4Q0Q0WFpXbWZyN3pjc0o2WVEzTUdS?=
 =?utf-8?B?blQvR0dtZ1dJUWRScFdSYTBUK0s2U2g5VXNFaG5OSzJLZm1LN3RFdExnOU1I?=
 =?utf-8?B?enU0SXh2d1ZJNTJSbUpBUE4xcVB3NDBadjRWRFkzdnpQQjZsTWlHOTRLYTNE?=
 =?utf-8?B?TENtYWFVL29YWWc0ZGJCQmlzRVdkWWVuczl3OEJINHVodEdDdFkyeGRVTnJx?=
 =?utf-8?B?bGEyNnBUQVo4RnEwWUxscWE2NzROS0MvWnZQR0JWYzUzdzV4WnRHbk9IQmpn?=
 =?utf-8?B?OUtuenJ6d1lBdkZEV2Q2N3c2eHBIUloxaW1HVWZFcmZtdWpEZ2lpSjZhdTN3?=
 =?utf-8?B?RGxyZkkxc1h0N1ZBYUJmSXZvcWpWOEprb05uRXpFbnpqTFUrSTQ1U1lpTWtL?=
 =?utf-8?B?U3dCajVRQWlEK3pQTzFYeDAyb3FzcWdxVWdtNjgwUWtScXpVajdpeVE1ZC91?=
 =?utf-8?Q?nyvyrfn34uyFGhLE=3D?=
X-Exchange-RoutingPolicyChecked: iar6BX3qfaq/OySmzoiogoPDqytit25lc/GjeL/3g6RUjwgyJL895e23lVLTfs9hI3RgYte4XMLPsDfMlijAUFAcBh0icSOL+lyzhxVDvDgtTGXyRAoJkUSUjnQDdgIjRwf9pXzcCTfjZod2J7LOib3kW6yaAJszMlj8OsveBroVOJDjKlj7ufj45E8f2T4pflXfhhBfdzgbwcweL4+R11VU5GDAVG/wC8M/ebpgQjcebb4gMeWB8cIvT+3OU2nygH4wUlJXleZDnb91XmIr3tIA0i1EQc4U1JFJX3rBQG5tsGfkVXZp8jwGIHfqbSgENQu8pNARZJv0tYFYVtUl8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d685f1-8777-446c-b05e-08df31620ae3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 00:02:07.0617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6u96Cnt1uaSfED/HhleVBs0vYFxwdJ7iLfOWp7YDjUxRrOQXFXDa3VRW7wrBfPZynrUFOz0+6C3EgncQKJ7PU9ohPU0FiNwzwa2Rhsu4/WQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB825148
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/13/26 7:59 PM, Chen Yu wrote:
> The limbo handler polls the LLC occupancy of stale RMIDs and frees an RMID

"stale RMIDs"? This is a new concept unfamiliar to resctrl.

> once its occupancy drops below max_threshold_occupancy. User space writes

Please do not interchangeably use the name of the resctrl file and the variable
that backs it because the variable that backs the file may not have the value
that user space wrote to the file.

> that threshold in bytes, but the hardware counts occupancy in units of the
> occupancy scale, so the threshold is rounded down to a multiple of that
> scale. The scale is the number of bytes one counter unit represents, i.e.

This does not sound right, the threshold is explicitly noted as:
 	"This is the threshold cache occupancy in *bytes* ..."

> the granularity of the occupancy counter.
> 
> ERDT may provide per-domain monitoring scale factors, but resctrl rounds
> max_threshold_occupancy through a single global
> resctrl_rmid_realloc_threshold value that is visible to user space.
> 
> Prepare for that by adding erdt_scale/erdt_get_scale() and teaching

"Prepare for that" - Prepare for what?

> resctrl_arch_round_mon_val() to consult the ERDT scale when firmware has
> populated one.
> 
> When CMRC parsing provides per-domain up_scale values, erdt_scale will be
> updated with max(). The reason to use max is because rounding is a floor:
> a larger scale yields a slightly lower threshold, i.e. an RMID has to
> drop to a slightly lower occupancy before it is reused.
> 
> For now erdt_scale is intentionally left at its default value of 0.

This is a clear signal that the patch ordering needs to change.

> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> ---
> Changes since v8:
> - New patch. erdt_scale and erdt_get_scale() were introduced inside
>   "x86/resctrl: Parse ACPI CMRC table" without any mention in its
>   changelog. Split them out and describe why a single global scale is
>   used. (Reinette Chatre)
> - Reword the erdt_scale comment: it is not used by the limbo handler.
>   (Reinette Chatre)
> 
>  arch/x86/kernel/cpu/resctrl/erdt.c     | 16 ++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/internal.h |  1 +
>  arch/x86/kernel/cpu/resctrl/monitor.c  |  5 ++++-
>  3 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> index d4b630358d6d..09072e478bde 100644
> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -38,6 +38,22 @@ static u16 first_rmdd_domain_id;
>   */
>  static unsigned int erdt_max_rmid;
>  
> +/*
> + * Used only to round the global resctrl_rmid_realloc_threshold for the limbo
> + * handler. resctrl_rmid_realloc_threshold is exposed to user space as a single
> + * global value, so ERDT uses one scale derived from the per-domain
> + * cmrc->up_scale values. max() keeps this single threshold conservative across
> + * domains because the rounding is a floor: a larger scale yields a slightly
> + * lower threshold, i.e. an RMID has to drop to a slightly lower occupancy
> + * before it is reused.

This documents changes that do not exist at this point in series. Please reorder
this patch to ensure its dependencies land first.

> + */
> +static unsigned int erdt_scale;
> +
> +unsigned int erdt_get_scale(void)
> +{
> +	return erdt_scale;

The name and usage implies that this is a global scale. This will become more confusing
when trying to land the memory bandwidth monitoring changes that have separate scale values.

Having this change pretend it is a global change and then add a snippet to final
patch to constrain it with a "if (!erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC))" just makes
this work difficult to consume. 

If this is specific to the CMT scale only then let the global variable and its accessor
make that obvious. Let this change land after the CMRC parsing and erdt_cpu_has()
introduction so that it can be introduced as one coherent change.

> +}
> +
>  static void __iomem *erdt_ioremap(resource_size_t base, u32 num_pages, const char *desc)
>  {
>  	void __iomem *addr;
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 48aa64c1ff96..75dd4736937d 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -284,6 +284,7 @@ static inline void intel_aet_mon_domain_setup(int cpu, int id, struct rdt_resour
>  static inline bool intel_handle_aet_option(bool force_off, char *tok) { return false; }
>  #endif
>  
> +unsigned int erdt_get_scale(void);
>  void erdt_init(void);
>  void erdt_exit(void);
>  bool erdt_try_bind_cpu(int cpu);
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index e42ee2769a39..f1a28a3c81bc 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -423,7 +423,10 @@ __init void resctrl_arch_update_snc(void)
>  
>  unsigned int resctrl_arch_round_mon_val(unsigned int val)
>  {
> -	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
> +	unsigned int scale = erdt_get_scale();
> +
> +	if (!scale)
> +		scale = boot_cpu_data.x86_cache_occ_scale;
>  
>  	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */

The fixup of this comment found in patch #12 needs to be squashed here.

Reinette



