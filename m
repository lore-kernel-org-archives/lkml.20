Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793092048;
	b=EN5/ErdXr0PyJ0ED2w3tJbuS3x/7owfoolAUw2TCHIxEr1QgDNbmNmf+xtRNkcR7XQYu
	 bv9DFAvkbXeoyUbb0oUao57DYJjSrWvfSXVr/1l+h0CpdsU5oHfOLyh/wMNsHKLYvVNh6
	 Cr+7vRlz5k/RHXdjWUjHwfZLW3EIuc+1uWzkKfLsE7jnKQ6KaqQbzI5omv2eNHRZZohbz
	 2l62yQ25tTVwZ4lTCqVd789jzTHkcAQeKbJgSh1LJ28tyI0q0dFK/bfTjg+ORsUjnfQG1
	 6RTSYKrNnvXQmG21QOQh3z96iPxMLpX9fYDwnk2zhmOKXAofwoLPCcvS0TIR5qogZlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793092048;
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
	bh=qG78m6EoN4ntjFhTy5MoKtZaRY7mCWlHJ8FfOfCh7kI=;
	b=x19X+n6BxruG0V82SDXVwGpfg+0WcOyk+ULYT1rK9JV/cwCGeJGegX3W5KgZKBtJL7Vd
	 NjHsKIn88AbpmDoenToDGDBc2le9DXN2JXEH+lf0SwTSwzmvkGNhCbpa86g1o9IA4MniS
	 Fp1qFhJg2K1JK0+PLKcSTUYjwOA7z0ofDL5m7vew+fKAw8f6V035FqDI8nQaN/mG30UzM
	 FkpIg2HpXNUPv84HeeTxVQWyJE+yDZHalC+GFMaoggJrjT06Djct9xkPp2RUwt+u7+AC8
	 g4r9rLEJfjXB+wlu1p8e4tSmFC/wTToBAHfbah2zkB/r0jW2iX+Nr7On1vD9hAv+9Kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nD24wTuu;
	arc=fail smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468A9606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 468A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nD24wTuu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793092047; x=1824628047;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wjrtC8GW07i19ovmYHjJGlWYqkuc+tDZ1HYJE5nflkU=;
  b=nD24wTuuW21eQCRk5f23lSpeAYhivtpyfK/p22LinpBbgxcBFTOc8Czh
   yjYOxOQtgvRP9dWXuz4UzZ8hve4MSejLoM/ysv43QokYD203PcuDDcTGz
   TzOKPHGJRHG9uevIA0yrnvJ1dxW9Pa9/43JilLdeg3wo8JxMZa2WgZ49B
   4QRQmOld64yfCfOqC1yW94Py/oiBw6lhMu+gqAqOo7RBjkfNsVRCMakHV
   XO/i0KYxTIBScGfF5KfEhhugCqtY1P2a50K/XT6nSuM7J/UmB1QwP80PC
   nxAK9brT2j7zoJ62g/lUP5xGuxVPC7qmBSIpALEFBYfkbKlKAor+JgtCj
   A==;
X-CSE-ConnectionGUID: AFOB3zXuRNuzKGifP7Qo4Q==
X-CSE-MsgGUID: PCqn3Sw9QXKXJ3LTqmTk0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1794431"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1794431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 02:07:27 -0700
X-CSE-ConnectionGUID: diMs3tA5R7yV7SSAEmnBcw==
X-CSE-MsgGUID: SDOemQwJSsKEKXpF0IVJNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4843680"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 02:07:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:07:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 02:07:25 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 02:07:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWnUDHmR0hOKVn8lnll5O3/rSFTiNeFYPdVA5xi4h67VkonMr/ywoQNew9+vFLG8zS3WHJv5qwgFZ9NSnHY7sqm1ak1/Bk4AgEQls38/iyo/3SdzLujPQBlPRceZrWbVVZN5WwdIZdZKx+HoNmiXIK/CZzdedsUwiaDEWjnBK9xGVGvwVoh9mWJY+9Q4+O7PXCAjcQvKrr2qo8Rd3weVZ5yK2EE5zeTvo/9b3Lz6q5UjsROh44HCgkqGfk/P13BxtBGpLQBmp4Krtv1v8rp6YPAMS4HnCad+0Zf6J3JY6Ofyi228uvFi6RM73whhlafXYE+GhGLDU1fhkAWE6Jrpfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG78m6EoN4ntjFhTy5MoKtZaRY7mCWlHJ8FfOfCh7kI=;
 b=xAiVHloC62Nt0PIHlTPUP19KUVcXNVKw1pd+lHZn5ofXZabkUFAuVE/b/EkZ9eXW5+nsxYyVB8I+eeg76IOOJh7jExWsI042wq4z9Jyl/tD/Hos8HOsZlM6WPYztI330iNZaRMrlhtvxXWtzcSajD6FjAFBTtXcb0fIgI2S75Z2U0Zwha61Vf3EWom0I+xS1ICM52U8r0B8sGTtu5FQGm7gO4MqU7blP7LhnEA5BRT8eJlLRH/xPLq1KGL08nhEBhIAJaN4mL504wBzQw1VYcpDAZInx/X2i48xRuyfvO2Ig/A+buUYY8iCbRZAPjcvUnsUNK/XYRW+qWHzX5XJ60A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN7PR11MB765673.namprd11.prod.outlook.com (2603:10b6:208:5f2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:07:18 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 09:07:18 +0000
Date: Tue, 27 Oct 2026 16:54:22 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v9 04/12] x86/resctrl: Do not enable ERDT when Sub-NUMA
 Cluster is enabled
Message-ID: <auBmvjC2ARQ_CNcG@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <eefa12618e3be5b5e19a88a343d192ab8d9049ae.1791933001.git.yu.c.chen@intel.com>
 <40ed95c5-a103-4139-a802-893c4bc8a497@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <40ed95c5-a103-4139-a802-893c4bc8a497@intel.com>
X-ClientProxiedBy: PNYP287CA0090.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b6::11) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN7PR11MB765673:EE_
X-MS-Office365-Filtering-Correlation-Id: 7eca79b7-35a1-44ae-6be8-08df3409b3b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|6133799003|261026121527099003|3023799007|56012099006|5023799004|11063799006|4143699003|10067099003|261009223027099003|261022105027099003|261022113327099003|261022075727099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: TEvFYq77pf17aCbfMIFO2Bxk9J6jLm2uGpn900FgK2dUH28FgzdDeemhxR3jcWCzLr9TyXL9bRWkI5TlgD+TQlvnht4NtrXzeLFgCbfxX/pLoVbjoZAp4D55czIjA+eo2ICZzW7YeUbWS8+3WgpScIwORkZm0fZ6K5gngZYwoV4dbsS+6znQ+aoYOmu6jI/AW/rmbw7IQIG9QHmj/e3Myq+m1cqpOvfoFFr40v23SUtjN5bDVvMm24xNghhlZFh3XFLcY5P82x0L7QGCcdiSQVXWeDRRRnsurAnrbWabGZukayzHmyuGgu6maMGfYJqAJljiFJeBj0QHay0em0ZGoLaF/rcceso6DEMSG5zDEx4KGc/JXMTYlACuOWuUhPUtpV76xRIVoeKCHWvTM6aSKrJgeekA0tE1prwKtfANa7+I4SUtSeSQ7cq/zxjU1AP8qE0BIxrTyk2RKEFJh53Vg/PfZvDy52FkFr6URYj9cQzQZDzyZ1JIarBbFMeck9Q3RtcppUvyRg/Ghjq8IqW7R9WIYenA8oOdF8lbufjRffMrxlCD7h1CdH2gfpSJmvNBOmWVfXjGW+iT9T+nyI8DgQOpyLX4vvEADlqeyoF/shWGsfKu+yKn5iUVqnnnGj9MnMX9DI7XJDUb60NGjimW1ANK7761HbiQ0QS2fhQ0NMc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(261026121527099003)(3023799007)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003)(261009223027099003)(261022105027099003)(261022113327099003)(261022075727099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r43nxB5dDRb+rSglgm8OavL7rKk9sc/g24L7R+aRicoMHZ+swp1d3DufewcM?=
 =?us-ascii?Q?QKYArrNx1JeeajsXrvU2h8BzW8RXnytXGWFgT9gsJfJlipKALn03Z6XXFjCa?=
 =?us-ascii?Q?lmFqANg5YIar9xoEwlnGKP3B53S/TnxaoPMMH9iOipNsxfZoWyJsuC5kgoxl?=
 =?us-ascii?Q?grZIlUWrv65PNYL6DycjiA3QugwJKFCctWa00gytSkx6pKdSr+TxfMQm/gzE?=
 =?us-ascii?Q?hyn7hgXbvTUHumySWp0KwLgkeD1a5Rhx8FM6cWxwTN9+btH7I+AY4M3yA9LO?=
 =?us-ascii?Q?O+0r5up+zLQwAJxeSInEJwhGyWHITTvbSVyKgZB2AQ2ytwDSBfAw0e1y9srC?=
 =?us-ascii?Q?invwxkA1I/ZLultXa2hXKHH6i/fG4it2rqE3AZO5RJMAlak3xdApRJtnYIgH?=
 =?us-ascii?Q?xc/EuiW7WTLx0MdS951BrzRlSSbEccGHPpEiw5ljYHw4SImt0Ymb0CndvYrV?=
 =?us-ascii?Q?oUXYum18toY3TDNcZhe6EujOZsAvyXpxWOijGbjK++xAVvr76JvrtDG2o7se?=
 =?us-ascii?Q?fjpEvYha8VbaFvjZhsmadHLvav9hHrLXr1yLX4iLmhXI+v/qNkk8oeQmzbeD?=
 =?us-ascii?Q?DSNTUul9biA0z7Fvkgqner7BLiySURrUQu34vwVs7hH4SNFR58XBiCrzo2sW?=
 =?us-ascii?Q?lP+E151AO6aucYpAAXAuWOEY+sxIzTGV5LqQPYIOO8FHhovG1hGpPI1cDdt+?=
 =?us-ascii?Q?QB8BtosNEeoN9UcXjjjWU/bbOODgF/MtdNH/WdGcTtOree4rbpcV+pErYdGV?=
 =?us-ascii?Q?a5FsLG+JTU1SawpG9oMzmBpFhDvy4IalYd0bxmw0wut73U80eaj6EFEYETET?=
 =?us-ascii?Q?B0YZZ9uaLz8+E1wKd1jv7J3/Vp5tqgmdE/CxRAJyA7Hrw94FvrbDaCTsL8jD?=
 =?us-ascii?Q?fedYTzsqRftBshLLcIJmSYmYpgdRTaayRWTKpNd18qPKH/PFuQA0ddnw00uW?=
 =?us-ascii?Q?Ir/SnYmns4Rwffj3iC/8grAWEHSdknVWndS0nR9l948qpPTAASwRjVfI9hx0?=
 =?us-ascii?Q?CA47W/dC7iu2F57/RxxQ35oXmxvSybpUPZKq2RL1G9156DT3O1HM5re0fqdF?=
 =?us-ascii?Q?BOMN3H6Npur7TRFTyQWFdkwNh7yeqfjt/4B3Hj2HuRdLtLRbOiPG3xbTbLc2?=
 =?us-ascii?Q?U9pQm5iltlwb55sRiku/xp+tM4eaf5LUo5eyl0r45JaiU+JSeJjFHWtT2Qrg?=
 =?us-ascii?Q?ybf8OVDlSjFd4Jad97/KjThQtEt+FNalrNsIZVuV8+qTzGsRsx/kkPHznmxX?=
 =?us-ascii?Q?NXSg5MZ+i0Jm2imKXzZsvuI1ekyCINtzeddmTGhhMNy8iJ5MgnT3bHGo1TAf?=
 =?us-ascii?Q?3xwZAiuJ3QbmCHLYqZZTcc/WlqnYnfMkyM4pAhgz/Wu09dOC49+OqocfFCfg?=
 =?us-ascii?Q?et7rsm2wJkAisEYakKpqCIcjb6ukWuUXhODVNRMYSOP8VyVzmfFA5rTGqFu4?=
 =?us-ascii?Q?EtKS/S2zl8HQxKneZDjrhCdn4cPksCx275YRdZ6EFT3RFIrGivyGiQPJVBfJ?=
 =?us-ascii?Q?fxq7lVrFJqnahq/ZhJCc7rITkYFaXQrG6ncjV0DH4rdYP9xvAmM6uBjP614y?=
 =?us-ascii?Q?CImbWJgMp89YbiB3/e0UaZyqNQIoES/vIPJQdJEQ/HMpvpJC807gC4UhGE/T?=
 =?us-ascii?Q?nbl6wvbD8yC+PLmT7YWiQEGtKM5VojLd9Ft3IZrFrI0hh/BHMf7+ICUMbZWJ?=
 =?us-ascii?Q?2kMbCtgBimBcum+xEvujO/xB3ONp2IhWlsRA0M5oL2oj6a+OPMV/CeCIe45s?=
 =?us-ascii?Q?vBgZYzmPPw=3D=3D?=
X-Exchange-RoutingPolicyChecked: DOVEq6p6HBQrFcjjtm/mD2Q17h8M49IkTlBbLOwgXfu87P7kYnVhUzJJmTZc/Vy3Hj6a8o3VggcdruWy6cVrt19t1ajcCUyeqN0dc8poncNqP+F3JqFV/Zcw/rTsjF28n2mnXRmus2O4lPgv6ZAxDNruySt+wSOUGoNW++G+89rMuPvvEZco53/kVUGTQGOG8RESvZFW1ugIYAQbSXTpcIkaVrjdrDMMNMZNSWGQKO85fZV/cjuTsrePwjRAz3S4b9cu5IV1bDJoMiQ3RXBmJZUT9pDJMNlQIb1zZB5fInCbeKeM4gpaaOL+ExwHKcVHrkDMpn4ik5RKOkHFeKm9gQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eca79b7-35a1-44ae-6be8-08df3409b3b5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 09:07:18.7561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K66hR4HNkP19rSzJTJi8c42ebZpd/eDDwDeVF93/3GqxgLoF+NT80+GUELnSOjTu1lnlVc/K2nKucWMMzfNucw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB765673
X-OriginatorOrg: intel.com

Hi Reinette,

On Fri, Oct 23, 2026 at 04:54:04PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 10/13/26 7:58 PM, Chen Yu wrote:
> > ERDT cannot coexist with SNC(Sub-NUMA-Clustering). The definition of SNC
> 
> "Sub-NUMA-Clustering" -> "Sub-NUMA-Cluster mode"
>

OK, will change it.

> > is to 'divide' an L3 into smaller L3 slices by mapping addresses to
> > different L3 slices. The current platform with ERDT enabled has several
> > L3 per socket, and it will not be divided into smaller slices.
> > Furthermore, ERDT has only L3 scope for the CPU agent, and there are no
> > node-scope domains.
> > 
> > snc_nodes_per_l3_cache is calculated in rdt_get_l3_mon_config(), which
> > runs after erdt_init() has parsed the ACPI ERDT table. Introduce
> > resctrl_arch_update_snc() to do that calculation and call it from
> > get_rdt_resources() before erdt_init(). Leave ERDT disabled if SNC is
> > detected and keep using the legacy MSR based CMT interface. Do this check
> > while parsing the ERDT table so that platforms that do not provide an
> > ERDT table at all stay silent.
> 
> Please do not just narrate the code in changelog but instead describe
> at high level in regular language what the change does.
>

OK, I'll adjust above commit log accordingly.

> > 
> > Suggested-by: Tony Luck <tony.luck@intel.com>
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> > ---
> 
> 
> > diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> > index 7fadfebb5312..0ea888807bd0 100644
> > --- a/arch/x86/kernel/cpu/resctrl/core.c
> > +++ b/arch/x86/kernel/cpu/resctrl/core.c
> > @@ -1018,6 +1018,7 @@ static __init bool get_rdt_resources(void)
> >  {
> >  	bool ret;
> >  
> > +	resctrl_arch_update_snc();
> 
> "resctrl_arch_..." is the common prefix for helpers found in include/linux/resctrl.h that all
> architectures are required to implement.
> Is a helper really needed here? It is just one line, could it just be open coded?
>

OK, let me open-code it.

> >  	erdt_init();
> >  	rdt_alloc_capable = get_rdt_alloc_resources();
> >  	rdt_mon_capable = get_rdt_mon_resources();
> > diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> > index eb5e262e243a..d94c54617fa1 100644
> > --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> > +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> > @@ -229,6 +229,18 @@ static __init int enumerate_erdt_table(struct acpi_table_header *table_hdr)
> >  		return -EINVAL;
> >  	}
> >  
> > +	/*
> > +	 * ERDT describes monitoring resources per L3 cache domain, while SNC
> > +	 * splits an L3 cache into NUMA node scoped monitoring domains. The two
> > +	 * cannot be matched up, so leave ERDT disabled and fall back to the
> > +	 * MSR based CMT interface. snc_nodes_per_l3_cache has been computed by
> 
> "MSR CMT interface" - this restriction is not specific to CMT, is it? Could "CMT"
> just be dropped?
>

Yes, let me drop CMT.

> Last sentence of comment can be dropped. It surely will be a bug if snc_nodes_per_l3_cache
> is not initialized before it is used here and one can just go find where that happens.
>

OK dropped the last sentence.

> > +	 * resctrl_arch_update_snc() before erdt_init() is called.
> > +	 */
> > +	if (snc_nodes_per_l3_cache > 1) {
> 
> Looks like this check occurs *after* parsing of ERDT table already started. Could this
> be moved to be the first check to avoid that unnecessary work?
>

Yes, let me move it at the beginning of enumerate_erdt_table().

> > +		pr_info("Not supported with Sub-NUMA Cluster enabled, using legacy CMT\n");
> 
> "using legacy CMT" ERDT is not limited to CMT so this can just be dropped?
> I understand that the pr_info() adds an "ERDT:" prefix but I think it will be useful
> to include in this message that ERDT in its entirety is not supported:
>  "ERDT not supported with Sub-NUMA Cluster enabled".
>

OK, this was not specific to CMT, so I dropped the "CMT" term and changed it as
you suggested.

> I think this work could be integrated better by switching the order between
> this patch and "x86/resctrl: Parse ACPI ERDT table and save CACD cpumask per RMD",
> separating the change to where snc_nodes_per_l3_cache is initialized and the new
> dependency by moving just this hunk to "x86/resctrl: Parse ACPI ERDT table and save
> CACD cpumask per RMD" with a note in the changelog that ERDT and SNC are not compatible.
> 

OK, a new patch is introduced
"x86/resctrl: Detect Sub-NUMA Cluster mode before enumerating resources"
to initialize the snc_nodes_per_l3_cache earlier, and keep the
"snc_nodes_per_l3_cache > 1" check in current patch.

> > +__init void resctrl_arch_update_snc(void)
> > +{
> > +	snc_nodes_per_l3_cache = snc_get_config();
> > +}
> > +
> 
> This looks unnecessary. Could all these references to snc_nodes_per_l3_cache be dropped
> from monitor.c?
> Definition of snc_nodes_per_l3_cache could be moved to core.c where it is
> initialized now and its initialization could just be open coded in get_rdt_resources().
> 

Yes, I moved the definition of snc_nodes_per_l3_cache to core.c and initialize
it there, but we cannot move all references to snc_nodes_per_l3_cache out of monitor.c
for now because several places in monitor.c use it. After all, IMHO snc_nodes_per_l3_cache
was mainly introduced to deal with MBM.

 grep -r -n "snc_nodes_per_l3_cache" arch/x86/kernel/cpu/resctrl/monitor.c
101: * "snc_nodes_per_l3_cache == 1") no translation of the RMID value is
129:    if (snc_nodes_per_l3_cache == 1)
132:    return lrmid + (cpu_to_node(cpu) % snc_nodes_per_l3_cache) * r->mon.num_rmid;
384:    if (snc_nodes_per_l3_cache > 1)
457:    hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
458:    r->mon.num_rmid = (max_rmid + 1) / snc_nodes_per_l3_cache;

thanks,
Chenyu
> >  int __init rdt_get_l3_mon_config(struct rdt_resource *r)
> >  {
> >  	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
> > @@ -423,8 +428,6 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
> >  	unsigned int threshold;
> >  	u32 eax, ebx, ecx, edx;
> >  
> > -	snc_nodes_per_l3_cache = snc_get_config();
> > -
> >  	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
> >  	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
> >  	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;
> 
> Reinette
