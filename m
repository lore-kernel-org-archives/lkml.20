Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793384085;
	b=YyKnPrxymLLFRIH/UVxh7f2uQ2sqnnZlHZenaeuwoAFxq+0W9lwO4iX/noj/BcL+1U6x
	 Hdg3X834DEESRm/Pp7vq96rAYSmQq2PSbBET0+mfdaYdZZd+lR+5GDL1GlBH2Z9DQLoGH
	 j1f18gpE+1EVw9XtTIg3Iy0TC54wCdgZj1RvfUnLSI2i+LUaKhLxrSgDoA1mCYXXRumm/
	 C0+MDyWtfVuqVJZ9U3587m3LlKbQ0yAx7ZJntmAvUkshYwPrCJH7BSPuuBaF+cyZU4LiX
	 k/uo9WnXNq6wqCwcHFL+RdG1XraKn4fwku3sEBYpH3UHYqjPPqTErHVnpkAnQFDZJUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793384085;
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
	bh=HjeEKJIF5+cfI3ZncIKalSvPIfeXSP03iU3Wuqz78AM=;
	b=aD8Fr5BNTG/WwspZ1o9GkxqvWvJiSUYuEzF/fkX3JFTWpd34Y4K5df/LPU+5SdV7Ox5i
	 Pss1T9r2rCUZnkKPxwwpPvueExR0+WuYHuFaz/vkpKiysmVZVJX2gsOwq0k8UPjg7XOLj
	 ySAxXhpwiyp3APgcR2FGaEOUq6u8dEinUkuIWRNhPbjY3snsFILgJFNJMuIjGzqVUeZkh
	 IbN7jhAi/Z0fBnxPYldg8t/7gtbyTYHMY7IEwqGacuMYWu4esrdmFwqiCqxhekgrOTfkQ
	 zwULphjn8PA87OkgONotF9X9BuouSSeP9sGMrti85o6eJ/mNrcHloFIzTn0crH0MZ9w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ROxgootB;
	arc=fail smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F2D606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1F2D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ROxgootB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793384084; x=1824920084;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=iQ/dQyQdjCMJPzx7E6rE3xPslVy0TNEX0IrhDFdQPPA=;
  b=ROxgootBbwquKPUkBDUjzAtMU4vVCZleG/oJmFMBwnRXSU9TiR+RhuP2
   ZWOEsu4aw2ad+IAVXO9AwMC9aMQutYnxHW7njeSRMx/W91d+lzKTdPxkS
   yEzjY4GtJH8KgkJp2vJVK9OQp5lMqTPEKxQx9vWEqYtQOYfmmsg1q/UL1
   PrfeQGcwaSnMIH6HqgzYSFu5R819nLUIM85/TJc5pr62RG4QYdxQ9iZ+I
   uSL+QMCOM5pQdAipToxwSRgMXNcgHg5tR/qqj1QmXtKn/Gwpd3Usmdujl
   8b4xZYoGidlUjUkhktdcjn5RC7ovdzdXsvq/tpgohBWHKouoXTi1WFDYP
   Q==;
X-CSE-ConnectionGUID: utstPs9pTf2njJAwiflJJQ==
X-CSE-MsgGUID: hY5fFa2tTyer75ZxY9rQNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2259227"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2259227"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 11:14:43 -0700
X-CSE-ConnectionGUID: NrXP/32zRCCOFjezwq6iLg==
X-CSE-MsgGUID: AHGpRk6uQFifrprKLq+IIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5639289"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 11:14:43 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 11:14:42 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 11:14:42 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 11:14:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wifo/cZQ5gcDCtC3smGHJJwbBfniUJBloLRjZbcr9IOHkEJwQ4GivQ+T9Y5maTNFNGkKs0Tm4FbIwC6pbqKikHjxoKevPTw5hw4XnoYyQKKY0JsKWmb9OrVn5FwzIbJRwhiO/1UQr1/SOi2WcLe+01oM2tNozsKprtiegLuuTuYyhyAQ6x6XVTCYS/DS1+GGP9qCnymbd7dam7jolVT3VJtfdDcNZG1FaRyIWC2BF7bfPgxhsJ93SDKKTyHefUL1zLaZvyHxWyZW9/dind05Zl3INmgUNtq+i0k608WSn+xZvvACnvPmXRBCM3aqJ6E0bh6PePgwQb+9GfNFJMBgxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjeEKJIF5+cfI3ZncIKalSvPIfeXSP03iU3Wuqz78AM=;
 b=QEsGIm9tdpOp2WdrWF86wbH/1kwqNd8EsIZPxGvLCgxVCMsZ+IFslW+7RCRa8ZcI8XIksfVMrxdPpf1G+5ZiRxqKhbdPBtHm0ts+d0OvU0qSTd8ZGXhIwAl8ofmYW1RqgWlUslmRyzUQB+a6q8OBUvNeYENZjGunqYuwV219sf/urEx+7WZfBBitpLOEpEU38sxpBuGUo7aWBAftuP9OPOZEYMtYhkWgP4vivCF8m0dPmnxkM9zYNk29drJ4UNF2svKUlrqX8uMqM0jPeby99nIdI098SwbjQJJGLjnSC67TuaOpMIk6LH6afD4xgVfmY/aq9Ch/0Fg1h+ErSLjK5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 18:14:39 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 30 Oct 2026
 18:14:39 +0000
Message-ID: <d1e2dda5-0b8a-4e4b-a626-9ff9b2a98558@intel.com>
Date: Fri, 30 Oct 2026 11:14:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] fs/resctrl: Report a temporary RMID shortage per
 CLOSID
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261030092144.1233551-1-ruanjinjie@huawei.com>
 <20261030092144.1233551-3-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261030092144.1233551-3-ruanjinjie@huawei.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3473be78-5eac-4cb6-c427-08df36b1a97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|4143699003|11063799006|56012099006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: y8OPFaDE1PddaHGlLkuRvJGpsolc44qgak6ESESRD+aFScfz0FFWzZ/ZfpWt71GW72wJin/gzAgMfkyYCsSl2HLv1r3XJ+IeTjUFEWaQLqPJr8hBbrOBRmahhgXYxqYH3uuyJ5/ouLD26CVsrs4srg9dX+D12PMe4qTifp4Ss7QA0OZ1/xByYkNaJLtdJ49V6YTZQBde7YTHJ00N8W/r1F3pFi99FA4AXV0wKNGQEKJihmSVM+T4+yl9/WejvmCc3Rc+TiEZKOdPhE7SiWSuOSyZuzem4Oysm3P4dUimIQmK2aublPRla6I/jXMbVFL/rDuxCRHuH7hHOnt+SsogsI6KWtiUuaBtipEv7OfVG9JhJmcUinl30HAs/fTIZnAjQIQ1Goj2Q/9dzKanq5mB6TGVg9oZYmMdN//y/7V0DgSnvGXVHtinQE4coxxS7M1rQzaVow6hmf4jm+DS0Q7cqvUBtfRxZMY5N4atdb7wTcemh56UcWxzQT3gkoh35UqZQ6kuyoQqO2etDi5F/DU2J3TSGbGFHXBIQa1ZCrYacW5Xcw2J3IT/kSWGRgQWCc8cNr22Ar3n96TmDbZapjYGfs72whR5o4smNT2f6JQOd0XrcbIAMTH2ugZaPwIROV8OGfby3GScVZnxqZhygpOqc5v+Y03bWFWbS8xNXhp2YhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkczMVArU2d2VmhhNGtkQVBsWmFFZncwTzBoaTB2aGZLRmEyZlNqNXh3cEFn?=
 =?utf-8?B?NzQ3M0J3VGxKOHdEVlkzbm4yeXJZTUNGZGExVzJRSlFXMjJRNjMxay81NWw1?=
 =?utf-8?B?Nm9VK2IyMkhXVkFLcEI2dENlcHdBeUNEdVdkUUkycG82YzdBMU8rNkgvMSsr?=
 =?utf-8?B?ZDFtbGF2blVMRklDT1JzdFhTdVVYT3FoZFhDZnlrQ1Y2QTNHZG5PSzZEWGdZ?=
 =?utf-8?B?ZW5ySENCQ2l3b0ZFU3o4WFYvNHdQWTdQZ0ZGR1pTWUFDbkk2and2ZmNIWkFF?=
 =?utf-8?B?YlllcUNzOVdoTW9MMlVXcVVhdkN2dW5Td1g1UFRPSzZ1WlRoTWFDdGExaFRM?=
 =?utf-8?B?YWZaeng5NU9aTEhpbk5hYThnRUpGdkhwNTdWSjY1ZFlvTmhqZlRCY2dsT3dU?=
 =?utf-8?B?cStYcDR0WkpYZTg4aGo0eVdLK094dFo4OFVtVmJZZ2cvNjVLdkNGaDd0Rld1?=
 =?utf-8?B?R1I3YkhaSk5kY1cxV01GY3B1V25xRlEyRS9vZzN2QjdoYW5odW9kWmFWSUpL?=
 =?utf-8?B?dkkrdDdBUU8wQjhzb0hQQkVuSEJjTXAzMWZjTVFOaWlCY1EyTkpHZGk0QVdM?=
 =?utf-8?B?U1N6N2hDOGR6REt3NnZFbUU2UW9XZ09CT2s0eDBBbXA1TzFiTENhczlqeVUx?=
 =?utf-8?B?YUdEbVhjcjJpR2p1OFUyZVZEUDgvNWNiNUpWMmc1d1VkZkttNExKQ2JTUGNR?=
 =?utf-8?B?ck1nWThMV1VBL2Y0MERJc0JRWTBzWHNLVURkZlFzUGJBUWZuRDMxbm9jZDRQ?=
 =?utf-8?B?NHhPYlFURlpwL0svM0xKRzRGbVZicVBYRS9GQ0thOGo4NlpRZUZucnR5d3pT?=
 =?utf-8?B?aTUzWjJVTkhXMGc2L1dNQUx6YkJURnlSVFNSVVVHVFJXSDdPc0hEaU9PZzZk?=
 =?utf-8?B?RkpsdXZORk5HUU1SSk05RmREK25UUjNKUnNiWTFaWk1LdTE4TlhKWE9VbGdH?=
 =?utf-8?B?ZUc5ekV1NFZwdUdnTXlTTEpJTXNuU0s4bHRZd3hvaUdZNVVWV3Rod3dxSzZ1?=
 =?utf-8?B?dmtIYUpHOGRKZW80NGNCK29SRHA0cDVwMmhiOGRKcWw1Qkoxa25Wc2pleE5N?=
 =?utf-8?B?M2RVNytraUx4aXBLQWJCejl3Yytod0Frak9lZWt1dTV3dEVvcnVuQy9kZ3dy?=
 =?utf-8?B?a29leUdoUkIxMFBjWmlPbUgxRk8raDIrU0pWZEt0UWhTRWliSFIvbzFFVjR3?=
 =?utf-8?B?QjFma094Ti84NVZwR053TGtNemE4eHB3N1NVSndUSFYvWnJObUZtSDhWY1Ez?=
 =?utf-8?B?cHp0VDR0TXVqbm9MdGRoaEFiMU1CNnJMVys4STkrU0pzdHhVdHZpSDZUTHdE?=
 =?utf-8?B?V25iQzh4dGxvbStmSm1sQTU0VFMxdXpoZHg1UnpITmsyUTc2SW9kTXZDbGxZ?=
 =?utf-8?B?R0VGclY2bWdSMUxiRkxRd0IwZXVWNCthRnhySjhmM3I4T0pMVzl6VlVOeEVn?=
 =?utf-8?B?QnY4OTQxUUlZT21lVGdEU0hIaW5GRVlxazBVK3BML0h1RjRnQ0tKV1R4bU1t?=
 =?utf-8?B?MnpVNmdMLzA5RTc0bi9IbDgydHh1cFZlT3BqMEs0dm1iNEp5TzUwTmEyZFlo?=
 =?utf-8?B?VWUrcExHZ3VMRkFoRERiVG9GcG8rc3RHQXo3eGQ5elQxQW9hVTFUUmhjOXRw?=
 =?utf-8?B?VEpDMFdQZ2JnajlMcjhRZmdKUVcyUVVIOEFNNk9ZWkRVR0lrNG8xOFlTNmxh?=
 =?utf-8?B?M2xnSHZ3NnAvcFJnWFJ2aHI4bGIrUDIrQTZjWDJkbVdYby9HdHNxQXFPUTVn?=
 =?utf-8?B?ZmNMd2NEWHNrc2tyMSs3dllXSWpYQlQ5dGd3bjhWRVlsSy9ZQ3BWQkJQMy9R?=
 =?utf-8?B?UGFWeHhVTGV5S0piMDllTndKQmhNbU9Db1EzZHdoSDY3U3d0cjN6ZlM1N1Rn?=
 =?utf-8?B?a0VKZ0l0TFNBZVhyNGROM0NseVFQU3JoTnMyTWM2TlZzeG1tTzVZODlpTGE5?=
 =?utf-8?B?REhKQXcrZXQyVzNYeFRZNG8ya1RjOGt5c084R2h1Y0VxZWdyOCszQzN1cElj?=
 =?utf-8?B?UHFKd0Y4L3d3aTZWWFk2eU1MWlBaWmdFekptNVh3SStLVXMyYTFtNVhlai9O?=
 =?utf-8?B?ckVsbHNIYWZrcGUydDJDRzZucGloRytoRGhGRWV3eXJFNEZxbXV5QlYrcm45?=
 =?utf-8?B?bkxXNitqUzgzREFJWDJiSC9qK2llanEyNWNlWTgrS1d3SkpEajZYMDl5MUJo?=
 =?utf-8?B?b3I5dmRIRzZBOHYzTE5ZUUhxOENON3VHZFZWY3ZCSExtOEpKYWFDMzFrU0Vl?=
 =?utf-8?B?L0dSN0hDUktsdG5rTUdVQmV2YWpLbXQvWG02Yzl5WHhzeDk1UDBENXVsZE9s?=
 =?utf-8?B?Z0lzR2tLbWMvRDdCQ0REWllKT3ZiTjJGSmlmck9lNkkvOGdQN2pUbFh6Z1Mw?=
 =?utf-8?Q?i3srp3L8JV57n8/8=3D?=
X-Exchange-RoutingPolicyChecked: cMkz6JnKcS/SuKfKMxCegW3QBczYAssDaul9tW8601Xzd9X+JS0rPw+OnEeAkMlfnewXr84OjpzxrGq+ABIzl6opNZ4VpLQv9pdvRDIIFM62r27iGPWrAaXO0yA8GR+WZmXGvo3QLiYwJWDjYBCLfaWlG1odo38/y4HO0BpSrynAlOtPPa+6gxdkJ9nWESjB2SA4OwLXOSHia+Lnk/mkyB2i8PTdHz0xzd/5B490eRWZPWwmp2txw9hvHYjg4BumPrbqWVIlNthw9hY41UVxGFHQYX4udpwJZvKwU9o6eZzEzFWgX3XaYJE13fCK9GT+eSeSM4NrJ9POa26NGGx11g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3473be78-5eac-4cb6-c427-08df36b1a97a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 18:14:39.2215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNjydUTvB4oFxqunddKEm6m9bmjLvRJi7f23FeKlAlwTlyUSsOfXstcC4OnPqilAZn7byMRr/oIURmnhgJMyDSlt9kYKW35ro8LDwMcwz0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/30/26 2:21 AM, Jinjie Ruan wrote:
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
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Cc: <stable@vger.kernel.org> # 7.1.x
> ---

Thank you very much.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

