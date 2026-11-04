Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793762271;
	b=YzXwcRB1Z9/F72WVUWQ/uzkaMaYIa0Kz8ttJJZ5FE0a1dtqKBZjblXFWSx0/2y4kpzMG
	 UJXd/sANtsE4Y/i/pAvuUMWX7yLXngYhPHlR9f9xlI06BAkviVX4jIyDi9BZL76wnuCqo
	 WYXG/Foe7QQ8XHLHxhryTJzpqOflT20mp7ivrG74P4esSgsmA+1dxBdAv/NndpUm2geYC
	 5QIefgpzrtO6BR3FKO3ex3e8w4XE8l1MelXxYtYRMD+PHJvjRSQ8Qbl1e6OIvhKrS7u+F
	 KZj6ddNrQ75W6dYvKLNA1BfDmvQBqy0wxDattGxbbnVfsWlhEymOKn6qtcpza2N31zw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793762271;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=83BoX6O590RxlDgvtNkx38fuE0c2Q0h8xmKOZmcJT74=;
	b=qDkQ8mxLx0Kl34MDm3HZexJfBzi2Kmj0t+IzS8/rE6u/mzvu9nbpypP0Odi2Fp0TopHL
	 QtxzfO/O8OGViT07aQvJu7VeHsOfA0cOhxryxft6o17tIIVHmf2rtBtMUXlA169ktQ719
	 5ahZnvVCVDSUo2gCCuaoipebJbOglealW8H/muDCH5asDncI5ENOmJqqATzP2Oa310T/W
	 ioY0kH4qZ3UCA3c+bqffRdLwVRLJaGLtkw/TiVJ827n9zPLhF7ukqcserVDyZyUbabzYA
	 bFTBh5xaURFBvnWfV7XVCqxoNChCqRmhJpGqovG1/r7ML0D6TECPXHDCpnRjJ4EGtDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aR+qFEom;
	arc=fail smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96249606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 03:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96249606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aR+qFEom
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793762270; x=1825298270;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ieCKPvrRnf/HVHeYp5clgNLF1iffD+Yo8Yo+pLPxFNs=;
  b=aR+qFEomgz8Mb34ZF4hGVNMqqlm3xVB9oqavhSMQcq5uemSOiS/qVsjh
   Eg+XBkcFnEDh/5TTCOi0h+r7XyPetjoBSZq6JRw6Z9oqH5t6ZrlP+YFyY
   Y4GYsachBzHD6Beh2e/GqYboa4SZZ2oCxrUPRffoj5TOaYZ9cWReH9pqu
   amXfjVAUXo77rni63h1b127tajYnYJkXoE5/6z/LgBbNvxUeHIj87Yrco
   R8sp0AcNWau+pLOHOUcod4s5WuRXavwn4dCosJaAmaz3+GITRn1jDR823
   TbuvNc9XxhecTG3kPCcrAPh0ItKMEF3tdVYUZggVIvrB2H4l/TnOOaPcy
   w==;
X-CSE-ConnectionGUID: KxiSMnNMQeqteshoD9mEEw==
X-CSE-MsgGUID: qfBMo8rJRUS3qvSJtdJYGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2504503"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2504503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 19:17:49 -0800
X-CSE-ConnectionGUID: gfUVOroMR5aMfbecWAvisA==
X-CSE-MsgGUID: Dk0V/kRrRUiUPrg3i6VWxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="7152367"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 19:17:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 19:17:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 19:17:48 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 19:17:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9SVR1KoITr5qQIo5rA3TzSkLGXIwG5PX/x4MYYV9pEPXSSESXHC/RXcdd5hP/mCuNVRrPQWSuv1Xp8xFCdSE6d761kE2SSiKfDjFlFeUvrpfRqsClkxCmsDjI6iMmhmqiGcuduGru4MDcsVDdAhT1AupWWX9bKfzM+QYCg8IKgXRC9bYqnE2kYieKvk0Fbn08UGIQnV8Wt6x120Zc5xCE01BvlYUsEaNVP0LU6M7x4EtdN/RUP+8GbvLcfG9XoEuILHGgCXuEWi2MgZaxvTLT4Hi8pF1LHQwHD330T1vCUPGSyshRfFWoxGSNYJC8l1L/7hQGNQhPzSNDCzMBXb1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83BoX6O590RxlDgvtNkx38fuE0c2Q0h8xmKOZmcJT74=;
 b=tsK9tI5fcpNSymid2N3jrX2u7qCvHOVz7p58eEGrRsuYP1t6IvD1zeURCWD1A0vOVXqIgnyJKZcco/IGvJS/lgYIfmj2bLODffwW41zG4VoHfWwIb/D5mhn11BQwYhNKowf8in2a7Rf6nPpVYTcOi+eyYckRo+nv6CaZC+SU/2b9NSGElVfkaBBZcSDOuBN8sH9qO4mVz0LBh0XDYDU6IWdlRZLNHtMWVXJSPjRRz1K6ktGwJRuTfzpVN6o6ufVXkDLe/Bpr9MJjcT4VS0+B2YP6vf8Cmx+rpr3zUHkFOgLC4yxI2FMGxN0d6XVDQlVHDknmaeKUvyqDZ6eaE5rX1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 SA3PR11MB986170.namprd11.prod.outlook.com (2603:10b6:806:52d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 03:17:46 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 03:17:46 +0000
Date: Wed, 4 Nov 2026 11:00:11 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Ben Horgan <ben.horgan@arm.com>
CC: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <babu.moger@amd.com>,
	<hongyu.ning@intel.com>, <chen.yu@linux.dev>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 06/12] x86,fs/resctrl: Move
 resctrl_arch_round_mon_val() out of line
Message-ID: <auqfu-1dLZbgenKT@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <e3d614c6c6d9cbcb92e5dcc975cafae4bfb059a6.1791933001.git.yu.c.chen@intel.com>
 <39e86f89-1d7f-481e-a066-a273bf41f5d8@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <39e86f89-1d7f-481e-a066-a273bf41f5d8@arm.com>
X-ClientProxiedBy: SI3PR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:4:297::17) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|SA3PR11MB986170:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef16822-bcf9-40f3-0638-08df3a22327f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|261021121427099003|261102123227099003|261009223027099003|261022075727099003|4143699003|11063799006|10067099003|22082099003|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: CnAK4igi2Fy8vopCRwZmH3sY/SgYaULsP2MD9xSDS2/FTSNvs3cRNEcMd2TUVSGQvXb2ZpeZ4YBu1ZnbIRc5UaZWr07WUvrh4M5mBUTbGo7X/FUZGp1e/YtrdTW5sk6LIHxHRqahJXA/TnTTQvRictIqOPTCDHY4KC4nPr3NyQzO4v4lDWVo8hakibyHT9M7IJbwdH7Fe3Y76dIcK0LnahzR0rBVPgy6qlsjhT5Wp0SI/LAiofXJD2Tv1R+yOEo8gYl1A7MU+0xrlUohHSG2NnZ23vVRDPU0ubu4IwrJ6XZf7o23knsjuENqjvBY/RHXzGy1Eaa1YreAZjI5rOLGHvcP3jBYqXi0iHrvkCpfEIg1PXKgcpNsubsgc5rxE+EtiSQ3b61pmZbHlgl4NqVl4pgbpVyZxwvAsJlwP+yrW9T4GpdBK5AATpkVt+P+rd9OkR8yXT040pE3aY6jmskiiBpLtpaYoRjWhk+9y0xVsiQ7V6GqOwufaM+JdFn3LeQvyfmrWfHuk0G3IDjf2pVyu2ou7TXw+ORO4E2/C5lkUOJnZIQvePojqTxqAnejL/22d4usDisDwhFLXapGp1QYS3wpjiU9wmlrYKkBD3sunxi4e31fMDQALb109PjS8YXnOI/0YS+E1F4BucK1Jftv8aUMdh15p7x75dgnUq/Q3o0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(261021121427099003)(261102123227099003)(261009223027099003)(261022075727099003)(4143699003)(11063799006)(10067099003)(22082099003)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PiksijJq90fSUGzrET9smx3/37uZxQHBzHe50MGa7r9qvzsXl0zm4UzsOqye?=
 =?us-ascii?Q?7/k86XvafvCUelTNSSqrr01EWwlk18hyqKHoYF/Z+9Z0lgQis6wpuOb2L3Ik?=
 =?us-ascii?Q?ye5aJTR5nmh551vTc5KBq7T/DsIZgSFDsWff2Gt47HdezA+LB64MVnxoLKBE?=
 =?us-ascii?Q?mZ3KZhJCR2MvxfW+ohw6goD0j+Vuh839QdqrcaXzQ0wgtcZW3f+SGS10TM1T?=
 =?us-ascii?Q?YwhR8micvSALr9W7nUn05G/jsFnbLQVXt6GRl5Plik/ZyF9rQb5g2do1bVtI?=
 =?us-ascii?Q?hqx5z0BQZmALGvc+nfDQvKyfXHh3BS2N5rdfWh0vLEgipf+I4Yl/GgKuWYrE?=
 =?us-ascii?Q?tgkp37GeKpkCZ9TXXGAMPxBT/YtvQyHGwKj83uCirhSE2jnGQ6WMvTNoS2iw?=
 =?us-ascii?Q?njcz6Si3+4X9TWROQQd99YG4vFZX8sOkChrqxkbGh6NtacFG7rBMqGx2Lm/r?=
 =?us-ascii?Q?RN6qoEhlIzkZ1rAWqH8VqXFBaUDFpgbBxrhsJ86pkpkn6sAUeQRKeD8rHG37?=
 =?us-ascii?Q?WRrzGEq4hRyCduaHEaGqKGT7TC8L3vrpc4IoFbIjbFGLD6jQWCNUr5mawvf+?=
 =?us-ascii?Q?toZo2B2DnMunGJ6UmatwrjRZVimgZfV6WwsSqaJ0nFUDDNdJBGwTEMLdposy?=
 =?us-ascii?Q?ViWXjh73bKptIbKx8d6cmJWJQhZMuxaZI2kwyt0f8Do6BeVN8DG4a67wn4kq?=
 =?us-ascii?Q?vCVAbPGXW3mbjVZmNHrsbYoQMxiEeiy1fyIUos5L6GVMSNHuieU8wMo+/tEK?=
 =?us-ascii?Q?HqzGBGLGzxMfJG5WnuGSrQxmvVKTwMO4Q+fFiJcMQb8RrpX/KqcdjKWwM4Rs?=
 =?us-ascii?Q?EVinGsBCD7y9wuCAowoY1cRylKZ8DHmr8xzsySW1JPVvNEWXKQADgj83v+Ol?=
 =?us-ascii?Q?38q01RIuFnVZhhRp13wvaPplm4+Z7aLsB7oqgzqjA5/K1I+1/cSsFbT7xYcv?=
 =?us-ascii?Q?0VyPAU8uvWEyYcgtADzAeNKoUu4MPA53ZQmQR0A6nYDN+uH4U2eaHtmUubl6?=
 =?us-ascii?Q?suvxp27gJAtaaWkWxjPKAosDcnrOLCrxIrlbV529yIPiFNDYNXsFnJRe7oPb?=
 =?us-ascii?Q?HhTEO8N/i4bHhaTZiOeo2pq1EjVajF3L4Ca6AK+/5NyQaGSlszxRwon82cB8?=
 =?us-ascii?Q?vbpEgW3tuQweL5+5Jk7Qf/wTneqxKLpcu0Z7sHEz4mgQnD7x++EGn5I9L1S0?=
 =?us-ascii?Q?LzCZC2OCTvdKAIH/es4RvM74d8SAOKSlonGP1yh7MYRsI5G8tzqpnBUNdRn3?=
 =?us-ascii?Q?1isPbpz2SHU9VMi0vgIYzaJGtgeT0Q8JMBNTyfkrRwrSeW57kLK610ZRmLWc?=
 =?us-ascii?Q?T4+01oi5hJmL3pfX6NJSAtajCaAvWj9iQI9ZMVXbPjSrwnr3kxLnHGwRrCWd?=
 =?us-ascii?Q?+wFfrDqtGBaXkV36NltGAXc2DKgIetpfQp1m4pixtf9tpTztl8bHKtDJLwtM?=
 =?us-ascii?Q?yWQQXgIubKYTa6IoScY+/tjgTZIrFFM49oydsr26y5KKJubVHTeBPBOYK3N2?=
 =?us-ascii?Q?ffzhBCMUqWxKfedywY7dIUL38L6paxZQ7GZkiGxi64Nv+8rm4vaxqpDRsNoS?=
 =?us-ascii?Q?q2c84dCtTkNdkaqppxHbtMKQ/BbZ7QbIlUdapYitKBT1iPaTdhNik1uFRq7n?=
 =?us-ascii?Q?1GLDjzYaPz+gNLlGun53LgyeQ327nQhfZZUuqhTIF3j80UbzkNv5lDf8SWOK?=
 =?us-ascii?Q?7261n0AWYJQL4CmReLpTZ1yjWHkL3SjsMGHrEHGZGtiNPk7CM/9RbL+AFc9d?=
 =?us-ascii?Q?zsz/n3x7PA=3D=3D?=
X-Exchange-RoutingPolicyChecked: UXYjEQRwlgnPrivqsP7/YRnN+jrJXAkIopenZ/FyqJj0cDbZWLGDAcYeaJoW25E+FleSRQmHaLYjNx4OtJ5JMdh8LZ4RQPRa6vX9zx9TSdBBLaUbVeT0HgZ/YQGe0N0QsgQ0xZU51iE+0ZO6p3hbo24Sf/vv5EulY24WBHHTckqVSGN8Nkp/cNQutkTHIRGIgR/wiETHky9TGpwEg/v4iw15Jv+0LXgFNm635rP5uuVozWPMipip6yd5jHnuwCT3tMGjRnhPbI/s774R6VXh9bNmJ0igFgtDMwnLBXJH3bWtJGSQNrpyN3Uha5UD2lbYOHSWdvqQGgP4YHxM1pEKaw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef16822-bcf9-40f3-0638-08df3a22327f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 03:17:46.1889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 281avm80uqKn2C+HxspoaJis1CDCA2ECrdHYTqL5HGm8RAL2WCHzSU5ZOe2Nf9nmb4jBWr1QB/dU3QDeZdYa+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB986170
X-OriginatorOrg: intel.com

On Tue, Nov 03, 2026 at 08:38:01PM +0000, Ben Horgan wrote:
> Hi Chen,
> 
> On 14/10/2026 03:59, Chen Yu wrote:
> > resctrl_arch_round_mon_val() is an inline function in the architecture
> > header. It is only called during resctrl initialization and when user space
> > writes "max_threshold_occupancy", neither of which is a hot path that
> > benefits from inlining.
> > 
> > Upcoming ERDT support needs resctrl_arch_round_mon_val() to consult
> > ERDT-specific state. Keeping it inline would force ERDT prototypes into the
> > architecture header, fragmenting the ERDT code across files.
> > 
> > Move resctrl_arch_round_mon_val() into monitor.c and declare it in
> > include/linux/resctrl.h alongside the other resctrl_arch_*() calls. Move the
> > MPAM stub from arm_mpam.h into mpam_resctrl.c accordingly.
> 
> For the MPAM part:
> 
> Acked-by: Ben Horgan <ben.horgan@arm.com>
> 

Thanks very much, Ben.

thanks,
Chenyu
