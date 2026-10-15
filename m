Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CAC2F39B5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792034473; cv=fail; b=nFATFcCCpqonee7SFC0CmIeajziJVQ6cgukZv6nkX2V0yCdQGrPOkw4s7DP8N0GOVN6Z3iSYj16TuW7Y7cOXuRISwjgX4/q1gTeuSQeTbAUs3w8o0P/FZg/8TBbC4uQ3yKqudtvIUa2xCTb2SWWADdL2bu2r9+TSP/jnw0U6LO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792034473; c=relaxed/simple;
	bh=oBYEUG8tI+DrzLyIh6mxAasV8PAlp/5LnwGv+Yo0vJc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T1Zs/b+OFQ4coXiiK8pjqeUlryoFYhWpeJ+YLwIABAUoySaOAFEECCb4Ya7JC4YfPlPZmz7iHImBI0ZnA52X7jOPdgOfltzyyMXS0bWKEaCH8AETZcAf9aIvTVfx2vUHysz+ruBoJVk7s6G3Jsf05+3giIHlTK5/2ENZvVoYrqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdqSz4yP; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdqSz4yP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792034471; x=1823570471;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oBYEUG8tI+DrzLyIh6mxAasV8PAlp/5LnwGv+Yo0vJc=;
  b=FdqSz4yPfih7UEn7BbQ6K0TgOoqO6sKKPmj3rFzvc8wJOjdzOcGDCMJy
   8sfIPvueYSwsWlYz41i72i0auu7/0XYSqE7gGzwZCtUe4Unt1qrEzCslJ
   sFtGlgdERt6j6ePwZEkSMvmdY+AVSxpqym/X8hoKUcwRt4y06rO1EFxoA
   bOCV3t6FP3lZZEM3AyZiVooAlYqQ5ZyfIYboBcC78SIfsw3bXnyr5fU2D
   PHkUEz69DgVaLGWrdNprWR4HvX1kxNemobFirGz5kROOrGoacCMKSzAuv
   qr/nTl8fa+DsQM934l61toGBvBzHkSvzu0IsmITOphL/YjY+prNsC6hu4
   g==;
X-CSE-ConnectionGUID: P/zNGILcTd2vsBQuQsl/EQ==
X-CSE-MsgGUID: RkFt+JcTQ/Oy0fEVr035qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="792059"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="792059"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 20:21:10 -0700
X-CSE-ConnectionGUID: X4slnv5XRDqNsrlOBxJNUA==
X-CSE-MsgGUID: l07RGX90RoKn84weNWGJBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; 
   d="scan'208";a="1470029"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 20:21:10 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 20:21:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 20:21:08 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.23) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 20:21:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UN8d85NPQsgdi6/n5+5DC1scT/cS5/ZXCfIk6LIZJK3VizvzpVxTEsUKdysADQEoOCYH/ykmZJwFasDImgajaCMlF1iMFCBykVnRmtow3mrw7gG/BaPAdRlTJ8bOF39jvLFX1KzeB4CwchIzGDcsiG1PCWniwRASr9kccOkBgnSDpzYnSxYwwzQCPp06SapCcBQx+vCo2r5/1fgJchiwtSyc95t61KENTSSBbP5CCRm05+leKxOFqv5G5IgUIudkl52wQ3hXnswt0qEDEIBKvrNKi06DCm1xufu0vu7a9WsfFRTVpRYwZvyNWtqF9E8dosCB/Osp6ujhnV/s8ag7fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f49xfUwG6FHxNHyjUF4QK1ocDEatiD/UJhosJBuXGVw=;
 b=CYBK8RaqDZdL3LKFOrrHTww1llKtu5/ty8L6JmGoOTRQFRZyRghA3Bj2oxCL1yyN3yuhQNssQgB7/uNJXfWs98h0vtP1yuluS25QOP1hOVrqXwXh+2erXn5KQVETcV5ycwmbk+3WOG+cU5/eAD3D2aaznVeCrWglufKP+JxrNcXVqXdGLN9Zd6wxkIYhLLt05LdWIpPYMRu6GvJJTiwdJ9UkZFg34olwx4XPvPWfG/wcuqMWbYPniW6DcwpKcBAw6xweEQ8q08FFcILTEA6D3tEVH+9qLjc39h9OivZGeCLzbtTret1CgaFeq+3jeSoX4oVKXVvoaqjvBsOnpIE2QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.16; Thu, 15 Oct 2026 03:21:07 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0496.021; Thu, 15 Oct 2026
 03:21:06 +0000
Date: Thu, 15 Oct 2026 11:08:06 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Jemmy Wong <jemmywong512@gmail.com>
CC: Chen Yu <chen.yu@linux.dev>, <tim.c.chen@linux.intel.com>, Ingo Molnar
	<mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak
	<kprateek.nayak@amd.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] sched/cache: Remove the old cache group footprint on
 exec
Message-ID: <atBDlr0OvYa-ExeV@chenyu-dev>
References: <20261010111612.31345-1-jemmywong512@gmail.com>
 <aspT_A1vl-RwKmoP@chenyu-dev>
 <32BC7D58-C1C9-4B24-857B-7433F19606A8@gmail.com>
 <as99ta0PWAuYROp0@three-body>
 <1174BE6F-35AC-4BBA-BD36-661B6FEC0794@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1174BE6F-35AC-4BBA-BD36-661B6FEC0794@gmail.com>
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 46e47580-7a0e-4e26-008c-08df2a6b59cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|56012099006|11063799006|4143699003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: VoJbYLjN1p9XvJtvH5s1eGqnKZI7ZY9PlBawMwfWUgZO7J7F6i7EnqU/TCVCn1/W4nX9CaIgaAY9OoobPg+6+V/C2u+fycKX4Z/K/U8w2XZFf205Iev0539DK8sBJSFxOtvKCAmMHP6xFRPk5OkK1vJoCbDLwV3RX2yAkAosR3r4+U6taa7ti7xbGT8aabZ2e2fdcdF64+NQ05tjQqB/jzLbfIJxZex8/hIzu9r9TNTGXSf+hzELgUDtvTvtwFuK3R6wF0O2Q7iHbT2JDDMisrYcAcmF2t3JvFU494qyPj5eyIQ2cg4KR/UwfQwqJ7rvKypuC/58cgWPMlRQk16PgvmrsGUTdx+gFNysxL5ef42zq9t+GMfgOM1qI9zKba4B5+Yi0w3LrnK7Uhi4hoDWmfdZETNmwxEM5KLND+AL1qVmhrasTS6AUxReKf6T72n8RSlw0Zhv4ZORWR6khZ1nLVkjlwZi+iDSa9sUvfpgr0RgO3J8W3GRLC2izPO2Gwk+ESmBnrdZpmQH/Baiq64+1l/iNEeQbTorRvGAjk/unSvPomWQyNMmaMFhPBlF1VcoSu4MOxsUzlzNg5VtXxjnT0sSbfYH1WC1LjoLRagRNc/Ml9anLpTPeE5bVMcNHEVqkof+tKVVCX6NXOAgkurHC/bIN7KsStyqM08ymFnhdAo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0tpK0NpbTZ0YmI0TDVBSXlVMDdaanQvM2pxUmt5S0JTTzIwdjgyUnVKNGNr?=
 =?utf-8?B?eTREcWdZKzNrZ1R0eXBnNEdBVmtBZlU5b3BDUWxKMXhmUUZkcUlLWkFDdmR3?=
 =?utf-8?B?d1dFWmRNT1FEUU5pbGpIbEJWNTJPeG5IMWtjNnZjOCt3WFBHRmQ3VDQ4VW83?=
 =?utf-8?B?ajhuNE0xTWpiREZQMTZUNWF2K3NzeWZlMFg5OE53bGFwUkVJS1c5TDUwbTNa?=
 =?utf-8?B?c0N1ajV0WDR2VjlRKy8yTzRxOEE1QW5RQ1NtNzduR3h2bnN4cDlEdG5FTE1F?=
 =?utf-8?B?cHZScHNyVmU0NXpqR3YzcmdrV0JudkkvdzBtckFvak03b3NTejB6aWwrMU9Y?=
 =?utf-8?B?SmZMNmw1SVdRcWdkOE5Ha2xmRTc0Qkdsa1J1Y2xVaEtYNUNKQmljbGRjdUJO?=
 =?utf-8?B?ajZ6REFQVytKUzV4dDUvenZHRzhZTnFMMm14M3YweXhoeThiT1BxWVlQSm54?=
 =?utf-8?B?RXZRQldYb0kyejZQSW9JWWc3dG44ak9TaUhmRzNUUGFrTXJ5dU9WWUVCZ0oy?=
 =?utf-8?B?dlNFWGNvaVk5aTk4Z1pvbjlla0VuYXhwY1pHNFozaFhBa1RCTkF4eHM5b3B1?=
 =?utf-8?B?NURrYkViY3NVZHpUZUF6YVBMWVJvYTNrS05TVW1ielpmbWxXck1JeUVCS1ZE?=
 =?utf-8?B?d0FmREhYd29yRmsybm5tWHFNekZFUmdFYzVxckJBRHoyTGVoYTJscGVTOGJp?=
 =?utf-8?B?cXZjN0tKWTYxbHRQR1RIaDNpbzlpanNIck1LcVJVWjIrTUVCRHNZK0NDdkpo?=
 =?utf-8?B?dXJKMUFzM1dQMmlNcmhoRFJMOHBOcW9ENHUwVUtrYmtHcTlGbVVxWGJzNXRN?=
 =?utf-8?B?VWloOHV5ZTVlWFR1MTl0SW5lUWVvNnEwUDU1ckVqMmllVjZzT1Q1Vnl5OFFR?=
 =?utf-8?B?T3lnRjRQbmxvdEprSGlQUjh2UEdSY1Z4VXNjeFdjMXU5aDMxQTNxREF4UFgr?=
 =?utf-8?B?RlNERmZBWnZxYzlUb0JZZkhpZXBnVzlobHZrYWxwZzhYNStoNGI0ZmN0M1Qz?=
 =?utf-8?B?dUJwcUxEZk5QbVRPYTFhUHR0OE9qVHRHcmkvdlZjSEdvTDVuT1d5UVljY2xE?=
 =?utf-8?B?ZDlwNTB3dmFlNEtRS3g3Q2tIQ0hld2VGR3F0VWhOazV4QUE3VVIxVllTWDl4?=
 =?utf-8?B?Qi9kZnlYVG1IWEJRYWNOQnBSd21hSUQzQy9XMGdxdm5LVlBQdU9sYXhiOWFQ?=
 =?utf-8?B?UElFQlhONlRtalBJRzllMlQ5blhiN3Nibms4bkpqemlvaEdxVEwzclZra0w5?=
 =?utf-8?B?M01SbEE5QWhjdWNXVWl5UlVTYWJXRDdhZ3RrZzJZV3JianlxcTZsejM3NFdL?=
 =?utf-8?B?T3VrQzd6U1hQbmJLa2NmU1RLMzdoK2hoQjg2S0x0RVJWZ0RpU2F5bDFpWVhG?=
 =?utf-8?B?YS84S3EzWnVOeDZiR21WaHZlQTk2blVIV2dzUlA4MFlOemZrY3BPbWEyTTlO?=
 =?utf-8?B?KytUMVQvMmJhbStDMExFd1BCM05Mci9iVlAzclM5c0VzYmYzZWFuVjdJeDJm?=
 =?utf-8?B?K2FYS1FLT01TaEtCZm9YenF2S1NFSWw5K0Y1T2c3OHQwclRzSlBsclVHSkVR?=
 =?utf-8?B?TXk4Z3MvM2RDKy9VNUFaQTZvK0RTQUFabTQwUUdvTGZ4Z01EWmpJcEVzZmNF?=
 =?utf-8?B?OTY3bUtSWTlRV2duZHpGL29kNHQxSm85VmFheWlFVWZZUENCdmdoYmJUWmRZ?=
 =?utf-8?B?MmxyVU5yWlhGU3Q2UU9wRk1ycW9mQ3IrZGNZeTVYQ2x1dGlpOXRscTJZODJF?=
 =?utf-8?B?YnlrcVIrWjRzUElMS2VqNFBwbStSdlh1bzZ5bzBkYVpCbDZjUkVSdlU4ajE5?=
 =?utf-8?B?YVErcVFEOURLS2xKWmdaazdoQTVjLzUwVkFnRk1XSlVXUWZaanR1eXZzMnVr?=
 =?utf-8?B?ME1BUDlHTGw3SEgzTGkvdUJHVVRKWGNlaXdYRHJSRzU1YnNvOUtzWVR2Q0x1?=
 =?utf-8?B?d1lNRVI3SjYwQnJHMFBnQSsrQzdIS0RzMnlPMFliWm1FZlVEN0tsYnVmVkRS?=
 =?utf-8?B?dGFVNGpGdDhBNmNNaW96aHJ6eGFsTlAwN3BNc1pXaTcyRFlUSDFmWFdTRnNv?=
 =?utf-8?B?ZG1iODZvaXN1RHVHejBrdUtpWWt1U3NpbVN0Yzl0S0xqcjFza2E5d0JrRDMr?=
 =?utf-8?B?WkpjNU1PQ2d6ekFqV1hsQ3ZZb2VNY3YraEFzWFVpRXFWWUdqZWQvUzQrajls?=
 =?utf-8?B?UUcybU00djlkKzR5ZmY2UHdCSUViVElBVUZ1cXRUVENNdk1rY0JxKzk3TVFy?=
 =?utf-8?B?MXpUdFlqVzlrazkrWnhkczlRa25IWkxxZFd5QTErUVdOOERJR2FtSmNobnoy?=
 =?utf-8?B?WUF4RkZxQ3p0dVZZQ2o5MTFydDV5OXZ0bWc5MTdsdjFDMVVoV2FlQT09?=
X-Exchange-RoutingPolicyChecked: GpgWt5NkCKbF2nU2+3hYJn6XIcfBHL+fVzlcLRRiueF73UV21S/t+xsuq8OI7blQTQmSUZ2t+cSSvyhxa4X6US6lv2ZK0ac6nxireuo7OnA6ffXQJNvS3fuVuG6PWrT2Kb/zMRxyjiwowcE3xvO6WLFSp+EXjkvbJUwzCpUoxYwsPLDWcTcDMlv8vx+zNHFB09YQflMvwd9kGRJpU74GiBlugaF6y7C1lru5QOfiCwmWgv+z4a+Eyf4w1/Vyl1hnXp/cxeuidPtjtz/Du0gndjWJnZJqwQH3crJ4xxMUE993JnaVHou79uQDWq6HB0keTu8jUIKujDUMgyD9vkLHQQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 46e47580-7a0e-4e26-008c-08df2a6b59cc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 03:21:06.8341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UJ3PeiSEhfxD0KwNzChoHebggiJhh9KXbLrzffJdwl1e58mI1Q3OSIVnXyLovnjsPgiCxkv6+1oAO+ueJ8vLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
X-OriginatorOrg: intel.com

On Thu, Oct 15, 2026 at 01:25:52AM +0800, Jemmy Wong wrote:
[…]

> I agree a pure pointer-assignment helper should not touch the
> footprint. I now think it is better to change its responsibility:
> rename it to sched_cache_switch_grp(): have it subtract the
> task's contribution from the old group, publish the new pointer,
> and return the old group for the caller to put. This keeps the
> leave-group accounting and NUMA guard centralized.
> 

Fair enough. I support this renaming proposal. Please feel free to
send a formal version.

thanks,
Chenyu
