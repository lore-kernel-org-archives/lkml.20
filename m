Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793673870;
	b=SLmecQSRRG6xwVb9pLNnKclyBYx0M8TJLXR0n9iYKDN4Ln1+56ORtRTUm+RUIi2hDp/p
	 jnDvskFCWkfvGXggCGXDWh54eXkfbQmMUi8KZf8WLsfhHAoTorgEETeb14xOuK5QWEGLi
	 A5YPEzg2AytrpiirMGnOsaq/UEKnBiAzY3eUZT/DsQisFH5OC/kVSUBzrAbYcAqtncxNt
	 CCTfCP18oDSGZblJWDv2YCMcJs97nNfEWl7i6AB/nUJCXwcpW3F+tuL3MFKMMYSImqeyk
	 uyhyWhuxFLG64mJBYK0QkMxrH07DhGtNxbMbvsSYu/hUMFotvCALCjd3n1joQvzMBzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673870;
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
	bh=hofk/crGI7OV0rvymdNq28OsqIsqTa5jFADk7sxdao0=;
	b=YOUUlp+zhYNihiFvJ3UVC0GMyZEbjAc2/Hct/NyQSiCLtXW0IiI3kuVOOA3wJbV3Tx4q
	 Lk93hp/JTg61ewRfrKPvI0w2B2RkDfCYez+7qmojc20Y7uThbBkE70rTZPRg+r8YvuaI0
	 1BidzKmM5eWLdyFtTiLx+8Qj1Q0s1l2Hj/xXdh4pidcinrwbht0kZseAa4EYvW8omIK19
	 Fkdn19beNJLJXKX9Hnat0LvMkIzCU2Xuob77jDuDHqHDVaew4jS7e2sHLvC9TyBWJDZxe
	 /ihEDlTMo9hrp5c+5Sew/jzT9cqT2yu5Ip5VOnf2yLj7EqdfPgfoITXMyZcu4ixD5tA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iib45MRS;
	arc=fail smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCAE606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FCAE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Iib45MRS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793673868; x=1825209868;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=r8aQlf/FEu5dW8XRyC6hQ6rc5k6qKz079Bc8fXiQxJA=;
  b=Iib45MRSsLS0ycl5jHkkq8Tu0zi8PV1jJbjZqr9BHDshYdnszedmkk9a
   aWVqZ5T8rtzHoCQcAQwThodAjfoLAtmBIp0tAYUkaWQb5+F5UcgtbvLXS
   dA6mi3Fq8xea+5BewbLKnZ5y7Dzxo9RI1AEKWXf+MTubn4c+K3GuqXBYf
   JfLLzaDsiUp2l71SiGfUcwThrt9cspamAYrUogsm1GkzR7B/JNtOeVrLp
   3c3HhqUvJGxPh5dpp3iXARJszjVsepHjGIVFYOoiJo4UjSA90eQnIb5o7
   LOJ5LwRi/I9ZpqatBntsAhnBz295NHHVxXIusjpT06gWachnHQs3duMqx
   g==;
X-CSE-ConnectionGUID: NvM7DxsZQpuJ9psekvhF2g==
X-CSE-MsgGUID: w/9eyHcaShqTxsrABFbIuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2391984"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2391984"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 18:44:25 -0800
X-CSE-ConnectionGUID: 2YtNFWICR9qFyuCYd/BV9A==
X-CSE-MsgGUID: +x8lwqWDRp2p8j8c9Gu54g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6171274"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 18:44:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 18:44:22 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 18:44:22 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.12) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 18:44:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Trcn9MLGMlv3GZ8UrjTv+I7Vd6l/W+WbTlof3L13bGJsEbSu3Cod+zKI9HR5zsGeQu4LsUQ15lQdoQn6+Sv8eEohc4bVaOkSG+nkkIxvsxLmrl1AM9MzhGA2SQ26urhqF9LMMrsdPjyUKNoH/Ye1I4RIIAyHneq62lcvFHT7NdKk+mKCu9XV6d1jG9iKg6QAipQvzdfsR0EgCg9GHtImo1h/8sffhAwTMnLh2bN42yViVYZy88foWuR2h0ZUHvCd7Zy/74cNQOQayAfmkm/UfeDPpA+kJehfkJ/TmPkB26X7pbngJMmcesE6A4RT66HX61g6qc1JXpV8AOA4F4DNKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hofk/crGI7OV0rvymdNq28OsqIsqTa5jFADk7sxdao0=;
 b=WKvNvaFrFE05uWNABtkphOD12HGRGrcBQ+WXLRNfv4DxAlp6+nm/UfNcCo4aXsaRFadPYfcCpKA7v5PFa3MTqeIsn7HOaMXwuGOwPZ5Lg6NbHKNMZZb7LajHAisZ3+oH5RhcvQwnCYf+KRCGxEyIQT2x58Xe5LprZFSx0Z2FTFQazDJ116cF9IAn0A71Il3Y5lUkfp3YCsT66Wf/fk6f5+0tlivVY7SNIT/2+LfkcJw1M/J0Bxjj4u4xpZmz7iGQBnrgakViyQjFZuZrVWvofi8s4xp862bphKONV7x+LL8Xhfclx2/ewJ9UCVo2A59d82PR1mOKobIoIOhiqiOQDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 LV0PR11MB9816.namprd11.prod.outlook.com (2603:10b6:408:383::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 02:42:19 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 02:42:19 +0000
Date: Tue, 3 Nov 2026 10:24:44 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Qais Yousef <qyousef@layalina.io>
CC: Zhan Xusheng <zhanxusheng1024@gmail.com>, <peterz@infradead.org>,
	<mingo@kernel.org>, <tim.c.chen@linux.intel.com>,
	<vincent.guittot@linaro.org>, <juri.lelli@redhat.com>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] sched/cache: Don't use fits_capacity() to compare thread
 and CPU counts
Message-ID: <aulF7A_9Y0nbgo61@chenyu-dev>
References: <20261102021536.1026143-1-zhanxusheng1024@gmail.com>
 <bc97743f-5ceb-4ecd-8f3d-1b217eb9020f@layalina.io>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <bc97743f-5ceb-4ecd-8f3d-1b217eb9020f@layalina.io>
X-ClientProxiedBy: SI3PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:295::18) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|LV0PR11MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b14344-f76d-4cba-ba23-08df39541489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|261102123227099003|56012099006|4143699003|11063799006|261021123027099003|261009223027099003|261028144727099003|261022075727099003|261022105027099003|261026140227099003|261022115727099003|261026121527099003|261021121427099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: qFuhBFlse3P7Dm5WNGQUJcub4ITmAs0ojnznDeCM4aCA35VgrNloGRsMmkgRw61HqIHnjI5HSesyXwyKuaTjSDS0i8HITm3Jw3LsTc2FJfu2ZjJsSwa8J4caaE51IUpksZNPwvgh/7gqal0GMTc5+5ElWcoK06twKKOrOXMGkCrW41UyEVZ9eTy8I6GR5ScBIu8/y/c0sH+GuGOjjdIbpttHA20H3Dr401y2dH4FgSzNmySBvZFhcEGob6twgGr356BJjLS9ywzJr4zw4SxhbAhvqs7MHlWUSRt0gKb2mES8fM8egv1par87sW1Fe1pvciqXZqPjuPXYGFEv2SrL34qXDm98ymLgAu5VvH4DG6rSzjQklSNF+iO59jv+szc4gFTlEx/KordwiOSFy2QjKIn5phM3pmmA10ElKaND4XU76J4IgRer/HGguY1D3vLVzh2/B3vll4HDsWG7n9df2aL1YGuKQLxI+tnA71JJuTH4tyGMAq3HCGgU/RpS7yU3Md56dIRxbztVAqqTxw6w0fy9qMJg2fT1iR8+pX7paokjouYqgnfEjFWlev93P1dwDl/82ZZ/e/b3FikX3Ou40TnRYRlX9S3GKtMlcdEPm+P7u8DHaTj3c9zQgGqJBJOP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(261102123227099003)(56012099006)(4143699003)(11063799006)(261021123027099003)(261009223027099003)(261028144727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261022115727099003)(261026121527099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PatgSMklY179MJqleZZBJmWKcBS6RLDQiZ+Yl6LDu3Roag9sd91NO6IoCLec?=
 =?us-ascii?Q?6Qt/gWVC+qkY5olx3C45YTwTInMr2l8z8W324fDliAIt6YIouuWFwaIv/aee?=
 =?us-ascii?Q?2vaskStQMB8Plw7qcbLyAAscRPQtXLkZBx8gXKGM6R/vuhxqltT4sEOftQxV?=
 =?us-ascii?Q?bw4kid6GnNaH7WT8J7JVIjs00PFPwisT9y6TY5U/Felb0LUC9kFvolFy/e4Y?=
 =?us-ascii?Q?Mc9XppXh+bIhiieccZCkC1O7ufjMJBfbtLvsRP8/XgwCpSujtxofvFpyW9Ou?=
 =?us-ascii?Q?ePVltuVkklaRqCaKG9T3aC4IvL5mi74YdJDY9L/EKNX8B6wJCQWLel1hX6po?=
 =?us-ascii?Q?Io8gjg2RJ5WjHCPKinngeW0hpLkVyIQjPbMPrE4feYeYCaHle5W7F+JoiTCE?=
 =?us-ascii?Q?vYToa4WxsjaLuq53T6bFCk5xTMLEw24xvv2kurOnBJ/n8jJ02DeyXubUE4KK?=
 =?us-ascii?Q?SCM2ZPRycGSyfN7Cli2diX8VbC2tk3bxfLA0jdFjV+DJ2SqlaBWh4I92DMUc?=
 =?us-ascii?Q?wPylYycC96nhelfl2xDzEgq03YqmDuJLY2oOd3YzLeuEaKCZkWu+GarW/Ssg?=
 =?us-ascii?Q?1lBJSpSewiXbPjbZZYdBBvFt9BDNCD9lK+vXWRkb2PSjaQBTb90bI+y6Cwx1?=
 =?us-ascii?Q?jYLXyu2NOQ0PPFh6hS2oXy2JoUFv9qZ5Ubj1M+bDukhh6lXwp/9+JU2ArXjx?=
 =?us-ascii?Q?pDAUMZF4wxbkKtlRvSWHmRhFXxvL189c1/p0CSYA0pn8c7Q/8bjAY+BXqOUs?=
 =?us-ascii?Q?vU70Lor230Ss1jKfeITJbLtuirWh5P18VAZmBN+M9CS4OzICWzn1EUvNmiO9?=
 =?us-ascii?Q?lEAdGNRrgV9KqxhnhMUt9SRG2QUjwlRvJ+2cF0jV6H2vtMTQwZDtBF0g8B92?=
 =?us-ascii?Q?SYDvCfX9Ite1ZDLrhVvscuI0/RpRb8t+71gY3mzuYej5rLyj1/LUxZy9pFxD?=
 =?us-ascii?Q?dMtGdyIqL+g+sEmdxHoTo8iaLvh7J5wMISbq/YTi4Pc71SZwpzK70SOh68ZS?=
 =?us-ascii?Q?lsLq/N6A6r74oZGciVbDCkiK5CywtnZNT/s/vWUOucSQOCTsmj6+rJKD0dMs?=
 =?us-ascii?Q?JSCIr99wpBZ0tu7QPGiD8MnhKso3nXPXtJbrxgi/41UEAXsuPqiBs5VvmL3C?=
 =?us-ascii?Q?tNRWdgDUc2pInxo5EzZgxTjpaRSmG6bTRAzqsMZKoTG3LrRhs7gu5O9JmrYC?=
 =?us-ascii?Q?vbtkougoIHUQ8YOFEalDjrGzj7nVs+iHBeLj8LL1yKpRdZP2MyiunuQsfILk?=
 =?us-ascii?Q?FE9QPXXEUB8RZkixz2zs10OBPcKCHF9A/D8hdvUGin5NZnXt2uVoQvkIv37W?=
 =?us-ascii?Q?wnMMG+TWxBSUIRNjZOyq3eWOumwY6NG/QNKu0t7+RLnS74GVqy/pLibILO8r?=
 =?us-ascii?Q?HJ+bgHFmURT4J0766TbKLiiwh3CyG+SGUE0X7p58Lvr/YyxW++9HB83ulH3e?=
 =?us-ascii?Q?mZrtjWSdakuU3/mwomBdeyrgIdAEn3YW4Cl0VNcpXHMKkHsrVcDMhTGCANni?=
 =?us-ascii?Q?lMmrUVCWUTzOgk1J/5XGxRsyLUwoJW6kIwylBHnAEI4PFupQUaEwKEa0N0ix?=
 =?us-ascii?Q?JbWBDIi0E3KftmiNKkHaf90JuO14OBkFMj20hbeqaLtNsCg84tscS03aa42u?=
 =?us-ascii?Q?0i7I9lwwPmQL2L7zKgGbCUCxNyVNIBFyobM60C1Mp+Ezs62a4Dn6XPWpYt/T?=
 =?us-ascii?Q?Qu4t/qhhpBXuFAOGevrcl+lNr0+oNiY4ul+CAbC3fbXpXqRkaZ/zUC586Zeh?=
 =?us-ascii?Q?3ZcgELb3vA=3D=3D?=
X-Exchange-RoutingPolicyChecked: vl3IshPGzZikYdMk0s7wIVxPzAE5wwhGLSI6V6nJLZBmQ2j3K0ct2aid+33UeQdQ/KT6SROcy8glGP1Zngz6lDzNVFwv9u3O28UCyA474fEIPmPytkH3D5nzYRgREjEjXvFYVog5vog6OcwI9M3YnRCdL18P1cMinXQS2vc73hKgZE2jfB7wqC0rCOo961sVv2ohRclIF/5K+1nFEoWtH9G0PTo1R42v2NceYiC0C+jjrjIi8iNDB2b2cYXC0ybIspCab9slBvMPeH8BDTXPh5Sj7xeesv8CidYyzTVAQL+WZ93zWJ6FZh1qr1F08DMMBBYCclWrm9M43i8lvbAoyA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b14344-f76d-4cba-ba23-08df39541489
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 02:42:19.6375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Gua9j64pLgp+7nQd0x1SD6BlZkzsEyBIcQLyQNidsLC3QmeLg2r3PpfFBd6uvcVe39oOrmsa/iYcYdmACA45g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR11MB9816
X-OriginatorOrg: intel.com

Hi Qais,

On Tue, Nov 03, 2026 at 01:31:17AM +0000, Qais Yousef wrote:
> On 11/2/26 02:15, Zhan Xusheng wrote:
> > From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> > 
> > invalid_llc_nr() uses fits_capacity() to compare a thread count with a
> > CPU count, only for its 20% margin.  Qais's series changes
> > fits_capacity() to take a CPU number as its second argument, and this
> > call would then pass the CPU count as a CPU number without a warning.
> > 
> > Give the check its own helper.  x * 5 < y * 4 is the same comparison as
> > x * 1280 < y * 1024, so there is no functional change.
> > 
> > Link: https://lore.kernel.org/all/20260504020003.71306-5-qyousef@layalina.io/
> > Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> Thanks for the patch. LGTM, although I hope we can do better.
> 
> Reviewed-by: Qais Yousef <qyousef@layalina.io>
> 
> > ---
> > This keeps the 20% margin.  Qais would rather not add hardcoded
> > margins, and llc_aggr_tolerance already scales the LLC size here, so
> > the margin could go, but that changes when a process stops being
> > aggregated.  Tim, Chen Yu, would you drop it?
> 
> Tim, Chen,
> 
> From capacity comparisons, we had issues that we move too slowly or too fast in
> some cases, that's why I was trying to remove this magic number.
> 
> I'd be surprised if this gives a global win.
> 
> Is this the best we can do? What is the problem you're working around here?
> 
> I see we have other magic like llc_aggr_tolerance and llc_imb_pct etc.
>

The original idea was to avoid threads overaggregating on their preferred LLC.
There are several metrics used to avoid this overaggregation: the first one is
utilization, the second one is the number of active threads, and the third one
is the LLC cache size.

1. llc_overaggr_pct is used for utilization. The default value is 50%, which means
that if the utilization of the preferred LLC exceeds 50%, we slow down the aggregation.

2. invalid_llc_nr() leverages fits_capacity() to skip any process that has too many
active threads, and we don't want it to become saturated because every CPU in this LLC
has one runnable thread. fits_capacity() was reused only because it happened to be a good
fit for this case, and we don't want introduce extra tuning knobs like llc_overaggr_pct,
so 80% was chosen simply because fits_capacity() uses that value.

2. exceed_llc_capacity() checks whether a task's memory footprint exceeds the LLC cache
size. This is where llc_aggr_tolerance is involved.

So for 1, 2, and 3, they address different aspects that prevent overaggregation. We can not
simply remove one of them and let the rest avoid overaggregation. For example, the process
might have very low utilization (frequently doing context switch) but have a large number of
active threads. In this case, we don't want to do aggregation for this process.

After the fine-grained control cache-aware scheduling is introduced, we allow the user tune
these parameters per group aggressively. But for the global settings, we don't want to bring
any performance regression, so these parameters are just safeguards for a global conservative
strategy. 

For Xusheng's patch, it looks good to me at the moment.

thanks,
Chenyu


> > 
> >  kernel/sched/fair.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index cfc982205b98..dfd6528d18ee 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -1469,6 +1469,12 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
> >  	return false;
> >  }
> >  
> > +/* Are the running threads (in SMT siblings) below ~80% of the LLC's CPUs? */
> > +static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
> > +{
> > +	return nr_threads * 5 < (u64)nr_cpus * 4;
> > +}
> > +
> >  static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
> >  			   int cpu)
> >  {
> > @@ -1485,8 +1491,8 @@ static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
> >  	if (scale == INT_MAX)
> >  		return false;
> >  
> > -	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads),
> > -			(scale * per_cpu(sd_llc_size, cpu)));
> > +	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads,
> > +			    scale * per_cpu(sd_llc_size, cpu));
> >  }
> >  
> >  /*
> > 
> > base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> 
