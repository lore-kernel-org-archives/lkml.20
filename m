Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794500672;
	b=1gFdd3IK4QsZbWo6Lq8k9fqK0T3RkdtQ5NORnCF3bMGiz8dy8Wk8fzn56t8ik5Gs7eT5
	 /R8AYUOrnnOyv6a2EaDOgRxmd0mg5FHv6xw2zjRfG9e8uicoAPUM512KLr4cTqhdRzXjh
	 WJDTfkSp2er6JD3SSirjboWb1yp/U4SzQKseaAEDVZ86F7pzJOl2CEhQtmQz4yDLC5Yt5
	 LqUZEAxfVe8KGhz3slyJllpzzknmhopU3cq0f2+SQ0Atemfl2TlnRcOIXh17nY4WGqXl4
	 8kicPXwCgtY7V2mJ6NntGkAhi9F6dvWLyruk/J3sjlZv4NPa6HkvlUa+auag0yB75/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500672;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:To:CC:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=1hT+O8f4xWNrMT3vbq99xs0CTE2hRUCbA6xJSrAzdRo=;
	b=1msFAkjxdTLRvomEHxHrsPhQvmqwc/fDc8HBZfBCS4tjMPezPRAvik7a4WxryCNLeoet
	 bAZIsW44qdJop3OvHJ6Cenxvqr+UC+YAM4KJWBTl5aYR5zQTRwDFNQJAm+1N45qEGTEpB
	 RWwervnJI4m7erpG2G8V50+uHE4XE3UDxr1g7vTphnHnkqtzhgrZqqqDRlYZKl3KDhvMH
	 XBpDLtRUUyPnVrqkrTfgl6o557k1iekit/j6YlAOJjDwwBGHmWVsWLHxJkjWKJISTU+56
	 MPdToNzO4ryJ1D/W91S2R48b12BU6t9c9a73ge2cP9JbSkl1nG+Vgc7iNPQObwnGTkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QOUmZqm8;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KW9ctu91;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20090606A323;
	Thu, 12 Nov 2026 16:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20090606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QOUmZqm8;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=KW9ctu91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794500672; x=1826036672;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vFxOp2GePGqjMILIOhSKrxvzEZvUTiM/jHFRBd1lbYI=;
  b=QOUmZqm8q+6thMhT4MGVLx/XlTeEFz/Esj9gKCT6k03GZqGQx6AUAqc2
   USItVSxvvagXZmxV3C0YItSmn4gBCWXYi9thBp5Pc0b4Vel8Eso6ZltIr
   Z57T2l7J3oS6sl9o6jUbegDJ5CnT9HHGKWZbGttuBXL+bIpu77uygbI6q
   pCExufCcpfugObV3Olriy1PKgnFSXM1j+nJWjHAOauMvXkrFHv/NHMvN3
   FmI0g8am88qnu7TtixE3VXxjmuuobDRdUl0NH8IQvbNKaeMWbtCt3mZMK
   BUfX7noKNjq9K3Xz81tNqID0VG3ccyO/L1U6qpup4NNfGCKBE3BOUdmQn
   A==;
X-CSE-ConnectionGUID: SkCXj8H2TuW5gjYAMqwm0Q==
X-CSE-MsgGUID: 87gPHVLMR4uYbfUStRqdtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3290556"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3290556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:24:30 -0800
X-CSE-ConnectionGUID: pnckLvM1Soux5XMPIaNWig==
X-CSE-MsgGUID: AXks7bLPRJyzf8P862Kw9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="8695757"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 08:24:31 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 08:24:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 08:24:29 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 08:24:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pSx+tHB7KLX1uhusBaEHIaUV9oEtp/cHn9iI9KOmXxbgKigQsAyuP7DkbuVUcwVmYqsJE+6pU7lc28JzzWp8ugPmXt4QGlA8oUG9lpahmdfXGCswrCFRdDoJaoJxBF0pvvtGZ/bpif6AjKR2mA2wT+O0z09u1N5sCPOlKJsW3AlTJFKYvAt8cSMZZLLD9co/KdQZiKPXb/XcRSk+eluvhwXoBAEp3bO1vZxLbvVewdSAEPdCYY2gnDNN526hLgOKjRFxYlVWvq/prRe4eTWVJaVUSnuIampG+E/Qu0wNXOkoMjo1mIgp0qC+EnFEx6/ZIdcsNUc4ZnCIA1RI/8PPPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1hT+O8f4xWNrMT3vbq99xs0CTE2hRUCbA6xJSrAzdRo=;
 b=R6Q2naJSF2gkmo6VSpP39fJ67N8tAxqZGyeAcqjlkjBb05OIKKV/p/TkYbnj6iytKpEBfNT/6KFe4qvN7y26D2ZeEd7L6ZUpuL2s8gZceJ2yu17/p2leRNFjbhPasltWYUMsyPNC95NB70Y6f6os60Zrysbdf35582hERoJS8Ch757DpJYglxdIHFN1JodUuns0cNQllP9Y0YWlJvOInYZNVd5G3ujPYoc4XRaQMb5Mj4x0ZJmW5Xr/ZV31Res477ZtuhgBD7zDzkZITxAv2T0C+iQ84RZG6os+xH2Qyxa+41tpMj96vbdhYVUZFg3w/CowYn7N2FRwTHpFZZ1TBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hT+O8f4xWNrMT3vbq99xs0CTE2hRUCbA6xJSrAzdRo=;
 b=KW9ctu91Q1pkf+MR8gaxmg1LWd4BLJ+fmYf46nXk7fUjN+qAXROdjYT6i15uo9v0kb7EDsQE73MRKiUjyGp4fVraz9uhUKKs67rc9LXOzxnIwGAMe9BRBPsr4nIcY2BTmwUJa33kwws+PXo1kC3j9qytiLXfD781o8WeR8yLz3o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 16:24:25 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0615.007; Thu, 12 Nov 2026
 16:24:24 +0000
Message-ID: <54079068-9f33-4ea3-91dc-c5c82e37a70f@intel.com>
Date: Thu, 12 Nov 2026 08:24:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/5] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
To: Drew Fustini <fustini@kernel.org>, Adrien Ricciardi
	<aricciardi@baylibre.com>, Alexandre Ghiti <alex@ghiti.fr>, Albert Ou
	<aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>, Babu Moger
	<babu.moger@amd.com>, Ben Horgan <ben.horgan@arm.com>, Borislav Petkov
	<bp@alien8.de>, Chen Pei <cp0613@linux.alibaba.com>, Conor Dooley
	<conor.dooley@microchip.com>, Conor Dooley <conor+dt@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Dave Martin <Dave.Martin@arm.com>, Fenghua Yu
	<fenghuay@nvidia.com>, Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai
	<gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>, James Morse
	<james.morse@arm.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>, "Liu
 Zhiwei" <zhiwei_liu@linux.alibaba.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Peter Newman <peternewman@google.com>,
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>, Rob Herring
	<robh@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Sunil V L
	<sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, Weiwei Li
	<liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Zhanpeng Zhang
	<zhangzhanpeng.jasper@bytedance.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron
	<jic23@kernel.org>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, Zeng Heng
	<zengheng@picoheart.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <x86@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
 <20261108-dfustini-atl-sc-cbqri-dt-v11-2-33a1bf0cf01c@kernel.org>
 <avOmHFcy/yFOr9YX@x1>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <avOmHFcy/yFOr9YX@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0379.namprd04.prod.outlook.com
 (2603:10b6:303:81::24) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c77d62c-1a4d-4b54-524f-08df40d969e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|10067099003|261028144727099003|261026140227099003|261102123227099003|261026121527099003|261022105027099003|261021121427099003|261022075727099003|4143699003|11063799006|56012099006|921020|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: X2cahth2+t5XUHGXb0U899kmuPWkstB8ARwk7wF+Ur9zs8vwqO2qfNpLzKs3wOQeWUmZ/UZQP+uWdcJbXCBKPUzOh69WR5dO/pqY2vPGZjOZS/4wGtuOwLE4ixDL8W89lZ/v8zcTqOA47t+zBOW0r+qQbI9h+PgSKKNENYOMiOUxCefYNnJuApLoWKy0B8iRV2LZ9wbOWA6k337IdmcOgguORaour2C+KHX6I09a+PuqK0B4nnUjzgVhSH3laggcGPw510AtFkd3arpfpmEdVa3Q0qB9+Yb4Lb06Cw5IzktrrcWZ3DJps4RbD3YnUvpB7f0HUZxgPqAZYNF/stnGh52s3VKDZyiC6BSYLxHruCngIRV7lSHanrBDsLsJRTNOZ+GwORkPeVj7ZRRcnCNtfC3Idts0mzfEk6NEJbPLgIRU4E+/WcNjlg96JvxEAeoGEiaI2+Y2wByW9EJWsBA7++yy7GY1fDn607Lzjd0wuVzxshFQBLnOhmiWF+ItsfSUiMPcyUNjiFbibdL1iUzYLIZbM/BpkjlgHxv5M0lJDdX55OWFBJIqj67ifBKur6guzXDNYOWMB+BU8FvYFKzpmd0x1jXzUBLC3QYQYDO3LbIiW3s1uswVCxB7lPPsZLMugyUo7OARV6+Ml458WZyF/KS+nvf3BQV3HpUJaP22dFhwQC5cYVPI7sWtH+wZ25EzrPyzZN4e0UwyCEtxKxGM4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(10067099003)(261028144727099003)(261026140227099003)(261102123227099003)(261026121527099003)(261022105027099003)(261021121427099003)(261022075727099003)(4143699003)(11063799006)(56012099006)(921020)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1NBalUzNG81SXZVTUVFVWdVN3ZCUXNYYksvZE9YZVFGSmhaQWx3bzdmWFJN?=
 =?utf-8?B?ZEtEVVowdnhWTjJPcjlnQXc1dXlrd3BuUEdpVWIxY3pnN1c5VXQ2bUJDV0Fn?=
 =?utf-8?B?bE9nVzBqT1h5ZWhndXY1Ujl0RmxsU0hSVDlxdlh3VGltTTRiZ0pNczl4RU1r?=
 =?utf-8?B?Y3JvOVlXOGdTRU9tbUV2aXZBeWVuWXFTVGpZaTJYSjMzd2xrRUxiZnFUdEVm?=
 =?utf-8?B?STE3Q21sQlZ5NjVBTDRMbXFyTGYvYWZCMWRsRmZ3dGtBanVzRkFWbHVpU09r?=
 =?utf-8?B?bU9LQkVCQzk2TWtPRTlMRjJtTXRYUlgwSThKSHBWck1CV0tqRWJPYXhidVhH?=
 =?utf-8?B?R0ZiYkFXbm92UFNNZ3Q2SmQxSUNJbHdDWmZYWVZRNFdYUUpjTGtQQUdOMTN1?=
 =?utf-8?B?cWhmYW9KUDhpVnRKamN0OVR3OGFjWUJETFlMVE1aTXBNcGloYUlGeXREaW1i?=
 =?utf-8?B?TzhQUi9mUVJkMnBENjZCTjJwcENaZ0ZzQ0JTRGt5NFdvQ0E5UkxmSENmZFFi?=
 =?utf-8?B?WlpEby9HSmV4SXBmaXhKUFRWOGVRYVVPRXoyUjV4aGMza0xLYlF0Y0xrdG96?=
 =?utf-8?B?UHl0Y2NNTElMMi9GSlBXeVNPa2VjRlExRlNjQis0ODZ5QzFQcVNsbW1tTE5Q?=
 =?utf-8?B?V1FTM0RHelVLaE51SGFGYmdVc3NtNWtDNHl6dWlPZUZyTWZYQzVweFZlNHQx?=
 =?utf-8?B?QWQ1ekN4ajM5azBFUXl0Q3Q4R1o1N0YxYm1rL3N0ZDJDTk03R25mZEdOSTFQ?=
 =?utf-8?B?VlZWc25nYVpzSlZqYXVTNC93Yy9CMnBsM2lFQ1JTQ0U3WUlnaE5qbkUyTytB?=
 =?utf-8?B?YUVyek5VaVI1LzNVSjREOEYrQ2RaQ2F3bEdBVFJLdCtRWnRuR2lQU1hYM1VC?=
 =?utf-8?B?eVpnMHR1QXA3ZnhDUFJxbjJuKzc0dTNpMElsZzJvZ3pMQ2xRVnZYeFdCNFZF?=
 =?utf-8?B?bzl1ampTK3RYb2MwemZrb1UwcWRhQ29EQUc5L0NkWGRVVUl3VzZNTkNET1k3?=
 =?utf-8?B?aEcxd2Njb1I2dGVtU0I5NHFQMTdOUGVyU3E4L21hTlVhVU1pazE3VnpUTGxE?=
 =?utf-8?B?UEo0MkQxT3Y2L2FIRmlCWTJFdG5NYThNTEt3U0xqcGpRRDRpUXpoRVlPNDZF?=
 =?utf-8?B?Mnlyd0JYM1Zpc09CSmhNb0V5bWhVZE53R1hNbWRwZ3BHcHV5VFFRZE9INEx1?=
 =?utf-8?B?aXVoSGJlbzRjd3ZuL0szS2lVQnd1d25sbEU2cDB1NG43MjN1dmMxZ1BUWkdZ?=
 =?utf-8?B?Z3dUYjMvYTNSR2YzWEtJOXFFR2ZwVDBXNXFIQVhCRkZ5SkhQUHhTbTBQV2ZM?=
 =?utf-8?B?c1E1M0xxeVVneS9Cd1pyQW5yUjlmM1YzVnFjTWRMeHpONjB6TnN0ZVgvYVZT?=
 =?utf-8?B?UGJMOEx4SVh1TElPZG5YWmNMRm8zdTJSU2NYYk9UbHBlOExTUjQwYWw3SHlT?=
 =?utf-8?B?dE1YNHFmRlA2OFR6NkhrSkVjMDczK1ZMY2M2T1cyYmVqRFcvVFdnTHVScnlM?=
 =?utf-8?B?T3lBb3oyWDBpb2xzd3FHNVIvc3JsOFNoZGRHdTB0Nm9tcnVZMWlrTFRoQmpJ?=
 =?utf-8?B?SGRNOWVxdEdNWUdBTkg0V0ptVThIYjFKUXpab1FDRDBHSmsvTHVtY29Idldh?=
 =?utf-8?B?RElMR09ieEVNK2lBbHoyRWJmTHRpaWtKTzBLL21jSzVCQ2UzSFBrcit3ZmdF?=
 =?utf-8?B?amlDbHh5WFdyWUt1aTB5SnlEUlJ5WmZtTWwwNXE2MEJjR0wvcFdNS2t3dFVu?=
 =?utf-8?B?YU1GNjQrVDIyZXNxbngvcytRbFcvY3VFQmxBZlFCSDhqZzR0Ri9CdDh0TDFP?=
 =?utf-8?B?ME9UZjlwVnRId3l6L05tN01BOEM1QVdhTW9Ma0hEN3RCU1U4eC9BRWhlSWdv?=
 =?utf-8?B?cm1vR1JnWGxCczk1eEpVTFF1ZHlSSTAxZTA1bFFLeE1yWFpUVkpYaDR3aDJZ?=
 =?utf-8?B?djZaL2I5azgwVU4rRnlEcFoyRTNmTjhKbFZpWDl5VWhhR3BmUkdrZnliWGFz?=
 =?utf-8?B?Q2syVkpIQ3JIcFVnZm9GYnVlcWhhaDFGKzR6YXhZUU1HdUlHUGhDdVNNL1o0?=
 =?utf-8?B?UU1lV0o5REUrVmZLWFV5L3Y4clM4UEFLRVJLSGNidVJaaUoyc3d1WDRHYkZX?=
 =?utf-8?B?QWhHbGtJWHh1bzRIRThVL2srNXhVckpOdXcySzVudVgvUEZMTDhZRlk5V215?=
 =?utf-8?B?WllmaXV6NzdHbnIvSyt2dmJrcGlVQnpDNGpJdS9nK2M5dWt4SDZmbk9tUUZP?=
 =?utf-8?B?WU1tWFN5SUExVzZkK2tTbVRNOS9pY1dVSzhubS9KZzFlTVdRc3hZY0FrWFEr?=
 =?utf-8?B?QjdWbnQ1UStnU2Vvb2R2YnljSlI0VXpEWjlaVmFoOXlQeXZsMUNFaktjOXF5?=
 =?utf-8?Q?o2iFKTcWi88TaAf8=3D?=
X-Exchange-RoutingPolicyChecked: EFsqpDRvKiVgni0lxRAZ5rZmYL0/ALRM0YFc2zAaZAUSh+a+tg9wFYumjR1ZSHZu4tCPbA0JqqW5H013hjLnJulMKlxNA4gyAJ6M0mNC/Aui4lVqAmxd2CVlhPkAVfyqCzqYT+Y62ajMzklBCyNTnwD6i96Wv+M8Br7S9cdw13lnzENYIIfBN2yHNpQ2lRuB6i5nY9KQgAI/s6mP9pXb2kLUeSmuyt8+dUIfL9DL2JOXyR9ByCpmxsGiBGDMdBFgV/bLfAMh0joeCzADGsb1BNdsvwHPckSpZWSHyKILoo87yEAuBFKkTPrqEHBY7T0EPTvSSLm8/A7rDscrXKJsRg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c77d62c-1a4d-4b54-524f-08df40d969e2
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 16:24:24.6611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kDYfAnxbX+FSLByQi2+/5wtEDwF/OQCSrAqYgXHtoyyt3yv9byNFiMItfVeFe4qAT0rPEClmVfGU1XRYUpOc2kXjf9EDZRI5bYKn1KuXS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
X-OriginatorOrg: intel.com

Hi Drew,

On 11/10/26 3:17 PM, Drew Fustini wrote:
> On Sun, Nov 08, 2026 at 03:20:51PM -0800, Drew Fustini wrote:
>> Wire CBQRI capacity controllers into resctrl as the L2 and L3 cache
>> resources.
>>
>> resctrl exposes a single capacity mask per resource, so when more than
>> one capacity controller backs a cache level they must report the same
>> number of capacity blocks. The same holds for the other capabilities
>> resctrl exposes once per resource. A level whose controllers disagree
>> is left unexposed. Other levels are unaffected.
>>
>> The set of controllers backing each level is fixed when resctrl is set
>> up at late_initcall. Control domains are created in the cpuhp online
>> callback and keyed on the onlining CPU's cache id from cacheinfo, so a
>> CPU that is offline at probe time still joins its domain once it comes
>> online, provided a controller for its cache is in that set.
>>
>> A CPU whose cache has no controller, or whose domain cannot be created,
>> still comes online. It is left out of that level and a warning is
>> logged, since bringing the CPU up matters more than controlling its
>> cache traffic. A domain is published on the ctrl_domains RCU list only
>> after it is fully initialized and brought online, and removed from the
>> list before it is taken offline, following the documented safe
>> traversal rules.
>>
>> Tested-by: Chen Pei <cp0613@linux.alibaba.com>
>> Acked-by: Reinette Chatre <reinette.chatre@intel.com>
> 
> Hi Reinette, I still need to get more reviews on this series, but I
> wanted to check if your expectation is that all the patches in this
> series should be merged through arch/riscv?
Here I'll defer to what works best for the architecture and tip maintainers.

We still need to create a strategy with the respective architecture maintainers 
for how conflicts between the resctrl filesystem and architecture drivers should
to be resolved. Without encountering this yet this may end up evolving based on
the conflicts encountered. Even so, I think it is worthwhile to at least start the
conversation with the architecture maintainers to introduce that this driver
may need extra support/coordination during merge window.

Reinette
