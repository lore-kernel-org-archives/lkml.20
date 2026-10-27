Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793098187;
	b=r/PluwmonPZuAsael4spJR+uQFObYnihbFbcI8xiotQHLTAwnAA3UiLsVtTfJM0ZVKgn
	 tFPHapqpYchqkJV8Bfu5hC1hsrUpt9O+Dd8PWOcqAb5rdG6auXRiWYafWKoexmf4y1Euw
	 wbab6dOL/O2L67CLBCaJSllnaebYT27WE7VGy9UDlsGWi+u7tkmd7AdhBbiqqnTOa6Jlx
	 PFC9Nx6i/aMnCA2c1UoAZAKfXHbQk3ljfAz5z45vBO955HSftud/vfLOpSp0LeekxaxUT
	 etpzkt+BpqIf2DTfCOesSwYbIvX0Dje1Rib1yfzX6Or1NJcZbmee0ucw3S/IGrwOUaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098187;
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
	bh=+IMCpnrkQn98REZW8av83vaLmH+UmZW6HmysnHxnV1U=;
	b=TI3Zvc8qQoe5L+O4V5Kkb6U7QxMLhn7GrXUgXVN0zwDZ5qKb4jEpjORHSLsR6atT9siE
	 eVhSE1D1Mb/hZbbxVsiV6xsyfmgc7Rr6K4gcU3PuTPSZTAFLyIHB9OZ9Od/zt3qsoDf34
	 RQdTftf6iiS0i+D5oUK4fcSFARmwSg4Zmfpkjtb+zFkGAs+hB4A08NE3QRCG5JiwQCsLK
	 yHfNfPt7lB9e4axq5sca2vzQao4TkFR5fR//DnLwbP02M4I6UsKv6Dkan0WDrIu5BQixb
	 lr9fwlqcPK+/W7OuwAk9p8vgYE74dgI+5iAszDxHPlvueeLp2qtvwj+jDXrpXa00h7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L86k0kGh;
	arc=fail smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B13E606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B13E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L86k0kGh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793098186; x=1824634186;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=suQRkf1Q/dvB2vPCwwK2BoceTiUZTdRUyBwwQNi508k=;
  b=L86k0kGh8QUqBnpFiXn81Cy13yu5OJTo2EaVMnhb5MdihRtJNoVVWODZ
   uTx8sD8BEaksJMGomAz+AggVfPiCYgeME0PpHbS6XlcR6QHvT/Mdc2FFN
   HXCqhOyvuRkwbGl7zHaUywE9py8p1a2IdynBcVXXsa5cJEXJfkLfYD5Np
   vWqInekWNRwTgLBNASlUTsif5TUrbXR4OBStK6APA+5ouEjpCKx5GZODZ
   fzH1YAXqGZI+SwrkGUZeAi6HPuj0bitVx2E6VqqFrqi/ftWO2L6gncFH/
   HETx9vnSmVVi2g99a1vLgLapvs7K+CV89AT+NaJzqalqpJRcf4lbV6Di1
   Q==;
X-CSE-ConnectionGUID: rgFtFNlSQyes4BuqbW0d8Q==
X-CSE-MsgGUID: yh543ZHKTcuObw6NEy60yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1885017"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1885017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:49:45 -0700
X-CSE-ConnectionGUID: pPrZCsIKTbCV9J59soLKWg==
X-CSE-MsgGUID: rZcWqTeqTM60onbwLOJFGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4616281"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:49:45 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:49:44 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 03:49:44 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 03:49:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ot2Tq3KYWcX1Q301W7G9llavvuwt0AvEVMnrJya4o6K5KRis3Vm3iGFJKjYDN+uDPmb6oaejPhmW4NFzFhTowlexC/cbNZHKJQhkjJtfAkG1r2H3NwmpiIgqZmMHR3Mq2RqdKpzE3CMnHDfIpXI4e3B61Eb6/2If+nwDxBb7KiNA2kta6CTczf5cOXTIR74pAXaWp1n0NQAX5kyKUuY8M2UwjWUr9yBd3O3BcmA3IbN1c6mNx0GLFFNu0qYmcnVc6/cDeznMAiv0dFbEwrPtX5M/DJnRtpLrNFqEEA+7UAF7Ca+Q59P10UFFdk01G4P0izYzH+Lx7F1BbkIUg8lvyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IMCpnrkQn98REZW8av83vaLmH+UmZW6HmysnHxnV1U=;
 b=j1SZj1Ma7Tx+GDKvM9159UL9oNJk8nVyWNHZ6v54bLmG0J12Dqj7Gf+aeh+hls9DSm2XHga0cZrP0agqjiMcM4s+yJS/mseFP9ZMkU7WCPbc+ClLoAMUdHSV8V6BkQ0jJX0PtZgLu0FwfnXMOuv7hiFL2vSZDnNNnCeH5f2nKXiRudGvsHO3X+QSEAZRhymHfU2l9ECjwKC+yhblUbukXZcnxFJxeO0Dt9BZwSkh0rjTDuxh3GrVcN7HphCTVsStXuaEuMpT+UJClVRYlsdOXDSRcNT6tNxfgwUUrbTDtRXKmNHjqtykKXcQWCZYuRnaSIjd1DEF1Yojn8pg3I5ymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH0PR11MB5144.namprd11.prod.outlook.com (2603:10b6:510:3e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.20; Tue, 27 Oct 2026 10:49:42 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 10:49:41 +0000
Date: Tue, 27 Oct 2026 18:36:47 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v9 05/12] x86/resctrl: Attach ACPI ERDT information to L3
 mon domain on CPU online
Message-ID: <auB-vz3-QCXxfGU4@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <2d3327d86480b1a41bf1a7c935317f14884a83f9.1791933001.git.yu.c.chen@intel.com>
 <2317c664-0c9b-4dad-b135-a771959be024@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2317c664-0c9b-4dad-b135-a771959be024@intel.com>
X-ClientProxiedBy: SI2PR02CA0019.apcprd02.prod.outlook.com
 (2603:1096:4:195::13) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH0PR11MB5144:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d26b7d-7fb6-49f0-38f8-08df34180127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|6133799003|22082099003|18002099003|10067099003|261026140227099003|3023799007|261026121527099003|5023799004|4143699003|11063799006|56012099006|261009223027099003|261022075727099003|261021121427099003|261022105027099003;
X-Microsoft-Antispam-Message-Info: zEtq5x65E0H2EXluq3Cmmwyr5nhK6vdA2VptTbaDs5tmZ+IB56DAy+vgOaMrIMr3PmDyE7YCJhWv6bzupsfzbKPTBfXLA9sGkZ4DQSD0UlMUmnaQbHXv9o8isgZa96uMT/K9/aFPZOtDiPZiZEIIq6cTqVOZH7YZKOmJpKuevDiJX+FwrnUlCcGg+PC7chC20YAXXcXFMEjWonnxLZ7jieYNlZZmY89/CRYRzd4s/Jds5d8WyQayRwSuxgxBGzAe9lqJTAA3lPBThMziqaPpWxhBPELIDlKUQrazcTiI1oqh/lHod3A9lrRTY89cxgTeRAq3l0LAnArIj6FbBWrXN7gB4OH8G1lcAHPq7W4k0ipWsY6fWqs9TrUpYAN/+W8mDvqZxNtagTvwwChuKVl2KMk9TPgMNKaoLtluwSQTZUaXkOUi7wxf5HxQFLFZ/QCGF1mrYMoiMUfcdC+q4X80Y8AlPgAECSNqentZMWRGAaf82odD7DWQuF3OpDR9oCI/Bc4RJ7Vsczw3s1fkhuxl7h4MOzg/a0polP87iU16fCLMEuUxBqC6OKz4C7irnNwmXeMW2t/hZzezyeHJu4saOjx7wqSRjdl9+RCGgdif3v3dYVMPZCTsg1w9QC2CbqGs9plVQAPhHV4YaNltVoL5dD0/hxq4UQV4ip5/LMqd9+E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(261026140227099003)(3023799007)(261026121527099003)(5023799004)(4143699003)(11063799006)(56012099006)(261009223027099003)(261022075727099003)(261021121427099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PMpV4PZCSWqbApbmfoN4zHucYa/M4jwOCHgiVWvQ0GsIGplKSYd1FcanwDNR?=
 =?us-ascii?Q?9yV4ZyQWNyT6Gf0oPPxeh4Cj+IXXBw7ljf0fbhM0wSWulI7FC68uOaUccbWj?=
 =?us-ascii?Q?msS29tK6fw/Tyu58JJGCPcAU2LQ4PQHrQhHBW3EpvgH/BTaJlKfJhBQncXka?=
 =?us-ascii?Q?cgoB9y6MOrgkVmxG6v1OQKy84L64tpQsbl16ffJi2q0qfklaNP1bYXrLVIem?=
 =?us-ascii?Q?8UKCkTwbL6XFhwRNP/CtlsJQIKThoyp2L9xt2bHlRlDns0mrfhpbX4QVnv4s?=
 =?us-ascii?Q?XT5nMPst9eEzC/ZE6KIAE/bpagx34ZBBcmSCltZBJeAwDKpZOPvkEtyVFKcm?=
 =?us-ascii?Q?f4q2aWeZMAFnvB2QqpfRxvQ6QJBbLbryJXIuqkBFb0S0NBUf66la4Ut6XKGo?=
 =?us-ascii?Q?//7sZKJgBKg/EH55OtSKcSDZM7l2nPPxrrsFALt9i9j143sT4EUFoy7CBovH?=
 =?us-ascii?Q?XmhntXUZhjeITIRl18Z2LrUzN44ATdC4cW9hkK80BSHtWZmhnXMn7C/Emf0L?=
 =?us-ascii?Q?Y9cMd5zjhgN66o1FrKzb3dzeMkL9deTRiYc0S/oFA/TxF8+S1Wq2Wi8jJXVp?=
 =?us-ascii?Q?4htbLNLLvy/T2G3g2m38if7FGptWKKBMrc6Gc9HgspN4gWAOMPJKkzPHIc1v?=
 =?us-ascii?Q?UV2YJsSO8Nibh6loXe0q0RqLyXkVzjnzepWafcFFdcKYX29CMldjeFzVDWVx?=
 =?us-ascii?Q?Slbz/WjAXlZnKd6401+RVRHYkQr7Y3AriUjneyuk08LKvyPtBtIsI2FkiEF+?=
 =?us-ascii?Q?n7Xx/tsRPTut3sMPauV4uVai5LAseQY5qXU7Nt+b9/Zday6vZhyIvMHX906X?=
 =?us-ascii?Q?HurMWwNsE0ZbuAn9QJiBqYOhgHP9/+zLbPK33ZeFfeRNs7pO0Q3dpTtAkQ9b?=
 =?us-ascii?Q?rqH5NsesYRXZgZekwM0z/bMlxZ0denFO1RNY6p8tPZ0zMuGvXOAYFlIIKBrS?=
 =?us-ascii?Q?KVlfDzHlDijhWEwgocWnDKudK13UbdxgfcebrcAZ4kEPrvHwCB8IzH0CnZza?=
 =?us-ascii?Q?fdA/xd5RznQP3DTNRYbveMY5H5ufWwddWe1vrV33FwN5JYg6493pqd9322aP?=
 =?us-ascii?Q?JS6YanaTAG5IYocjmRSh4oWOMFundKgAKXEHUqVHWb45c2cjQD5J30OhOIi+?=
 =?us-ascii?Q?ihmDMWyHuSDgIxSE1JyJ4kynybjqehGsU88F8n+AhJKPCev4ys44XA3FXtVb?=
 =?us-ascii?Q?OIvsKIWxz4uhH5MPq2UAvPVAegbIseCNMJeNodAr2zd9lKGK3rEXXUs5hT6U?=
 =?us-ascii?Q?W+OYaBchble7qOw+Ar+Wk6qlrmQWrNp1Mbre0o/YFJhkRedM28KM+dgRfuDi?=
 =?us-ascii?Q?Nf1PmSUi4sgc1oi/qwsIM4HeGLY4+VqsV5gUfOGkcq40y/J4vKvLxOuPuoDK?=
 =?us-ascii?Q?JTX99irwwuM0KpdF5qsIawPXNR+OfkMa3QGm1oH4PwXjVGZQk5PIWO3bnyFh?=
 =?us-ascii?Q?y/CPQdexXV2VTrYa6x1vn3j+SR55uhGbLvscKEtXOWO70jSP8UvcRIsKozRV?=
 =?us-ascii?Q?+xPyQCFiMiLDlQBRFryJYN27PUVDrtUSANt2+QnWEPJhfPysAPN7fGSVjXAA?=
 =?us-ascii?Q?cKAb/0ojwJdcm82Ogcx3vkAmlJqdnA8sMpsOF4rkfC36Ueah8mBMR76GComp?=
 =?us-ascii?Q?+9hPC7TapTKnFA6bc62B1FHbhgtyXchwsDNugPRH71sUgVIpkVRmT+AU0Pq+?=
 =?us-ascii?Q?4wyzxlF4sdMOgQGQeuZ2i7uaOk3AvHJrdvb2kN3XKcooRikDF0OkO/o3cRd4?=
 =?us-ascii?Q?F6XjQ9YRWg=3D=3D?=
X-Exchange-RoutingPolicyChecked: G/aJEUKwgL490O3S1e5GI3B6tLosMURttJ1+D3p7i90ZI8SPj1ImswYTy/yqq9mtp6IVsUPx5LvcKpNvptedx9U85BG1GfeOj1VOvAiq3SAPy5WMiWA1PKhI3EFmMHKeHBfNNo5QEae0eqzt98Tb7ireL8yLQmCECsISFOnr5p6b6S0d+84CMcsDbxzirQmjjXigL/Y65o191n//5xx8ODGV3RmLskS37G3Ic8g4wIPcxr/qwY0vwKPJWbzS12Jp8UFWlZE17UDdbG62SQrDfWHlDorI2uGMptt11nzq1xGV9dO+63ViGzAlSW0h0oY3p9wg51ZjaEQ4MpDH71V+SA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d26b7d-7fb6-49f0-38f8-08df34180127
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 10:49:41.7402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FiAFsPQ3XIOYR4dvar50dV1pwp4C/xEKhwSeARcomLPc2RO92OwIU/fIb1+J/LAX8aJQWK8wrPoniBTCRTx1Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5144
X-OriginatorOrg: intel.com

Hi Reinette,

On Fri, Oct 23, 2026 at 04:57:54PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 10/13/26 7:58 PM, Chen Yu wrote:
> > In preparation for MMIO-based LLC occupancy monitoring, link the per-domain
> > ERDT information to the resctrl L3 monitoring domain, so the MMIO read path
> > can locate a domain's MMIO registers.
> 
> Please review "Changelog" section of Documentation/process/maintainer-tip.rst
> I understand other subsystems need a snippet that describes the change at the
> top of changelog but x86 does not. Unless it is something really simple, which
> this is not, there has to be some context before the change is described.
>

Got it, I'll revise the commit log.

> > 
> > ERDT and CPUID enumerate CPU-to-L3-domain membership independently: CPUID leaf 4
> > describes the L3 cache topology, while the firmware CACD sub-table lists the
> > CPUs of each ERDT domain. Both views must agree on a CPU's L3 domain for that
> > CPU to be monitored safely.
> > 
> > When a CPU comes online, validate that firmware and CPUID agree on its L3 domain
> > and bind the CPU to its ERDT domain before adding it to any resctrl domain.
> 
> "bind the CPU to its ERDT domain" is this not what patch #3 did?
>

Yes, this is done in patch #3. Here it actually assigns the L3 ID to the
ERDT domain.

> "adding it" - what does "it" refer to? the ERDT domain or the CPU?
>

"It" here refers to the CPU, but it is a bit confusing, I'll revise it to:
When a CPU comes online, check that its ERDT domain and its CPUID L3 cache
agree, and bind the ERDT domain to the CPU's L3 cache ID.

> > Fail the CPU online operation on a mismatch for now. Leaving the CPU
> > online but outside all resctrl domains is doable, but it would require a
> > change to cpus_ctrl_write() to reject CPUs that are online but not tracked by
> > any resctrl group. The current approach is stricter, but simpler.
> 
> I do not believe failing the CPU online operation is actually possible.
> 
> resctrl_arch_late_init() is a late initcall and all boot CPUs are already online,
> so the failure during this time will result in resctrl not being initialized at
> all without impacting online CPUs. A CPU onlined after that will fail to
> initialize, but that will make the CPU unusable for *everything*, not just 
> unmonitored. This sounds extreme for an ERDT table issue that should never happen.
> 
> A CPU that is online is still able to run tasks and the earlier enumeration 
> ensured that MSR_IA32_PQR_ASSOC is accessible and what the valid values for it
> are. Even this "failure" path demonstrates this by calling clear_closid_rmid()
> that writes to MSR_IA32_PQR_ASSOC *after* the supposed failure.
> 
> resctrl's current behavior when a CPU cannot be onlined, for example when
> domain creation fails, is to *not* prevent CPU from onlining. If a domain
> cannot be created then the CPU is still added to the default group's
> CPU mask (resctrl_online_cpu()) to ensure that tasks can continue to
> be scheduled on it by writing to MSR_IA32_PQR_ASSOC with values known to
> be valid.
> 
> Such a CPU is *not* added to a domain's CPU mask so resctrl will not
> attempt to make any configuration changes to it or read any counters from it.
>

Thanks for the detailed explanation, got it. I'll change it to:
On a mismatch the CPU stays online and is not added to any monitor domain,
but still goes through clear_closid_rmid() and resctrl_online_cpu(),
so it joins the default group. How about the following:

        mutex_lock(&domain_list_lock);
        /* Keep a CPU out of all domains if its ERDT and CPUID L3 domains conflict. */
        if (!erdt_try_bind_domain(cpu))
                goto unlock;

        for_each_capable_rdt_resource(r)
                domain_add_cpu(cpu, r);
unlock:
        mutex_unlock(&domain_list_lock);

        clear_closid_rmid(cpu);
        resctrl_online_cpu(cpu);

        return 0;

And you also mentioned that even if CPU1 is not eligible to be added to
the monitor domain's cpumask, since the event can be read from any CPU,
CPU1 can still read the domain's monitor data via (mmio_base, RMID) without
involving any CPU, although the data read from this address is questionable
because the ERDT is already broken.

> > 
> > The ID used to match a resctrl monitoring domain against an ERDT domain is
> > always the L3 cache ID. ERDT is only enabled when Sub-NUMA Clustering is
> > disabled, so resctrl keeps the L3 monitoring domains at L3 cache scope
> > instead of node scope.
> 
> Please always write with imperative tone.
>

OK, will adjust it.

> > 
> > Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> > ---
> 
> ...
> 
> > diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> > index 0ea888807bd0..9a59643f366c 100644
> > --- a/arch/x86/kernel/cpu/resctrl/core.c
> > +++ b/arch/x86/kernel/cpu/resctrl/core.c
> > @@ -33,6 +33,8 @@
> >   * The rdt_resource's domain list is updated when this happens. Readers of
> >   * the domain list must either take cpus_read_lock(), or rely on an RCU
> >   * read-side critical section, to avoid observing concurrent modification.
> > + * This mutex also protects the ERDT domain_info_list, which is modified when a
> > + * CPU comes online.
> 
> This places unrelated text in the middle of the description about how reads and writes to
> existing domain list is managed. Please consider entire paragraph and ensure that the end
> result is coherent.
>

How about adding a separate paragraph after the domain list description. It also
states more precisely what is protected: the binding:
cpu_dom->dom_id = dom_id, not the list itself, because domain_info_list is only
modified during init.

 * All writers take this mutex.
 *
 * This mutex also serializes binding an ERDT domain to an L3 cache ID
 * (erdt_domain_info::dom_id) when a CPU comes online.


On second thought, would this race condition really happen? erdt_try_bind_domain()
is the function that changes erdt_domain_info::dom_id, and it is invoked by
resctrl_arch_online_cpu(). CPU onlining is performed one at a time, not in parallel,
so it is unlikely that two CPUs invoke erdt_try_bind_domain() at the same time. Although
in the future, it is possible that onlining could be changed to run in parallel.

> >   * All writers take this mutex:
> >   */
> >  static DEFINE_MUTEX(domain_list_lock);
> > @@ -558,6 +560,8 @@ static void l3_mon_domain_setup(int cpu, int id, struct rdt_resource *r, struct
> >  		return;
> >  	}
> >  
> > +	erdt_l3_mon_domain_setup(&d->hdr);
> > +
> >  	err = resctrl_online_mon_domain(r, &d->hdr);
> >  	if (err) {
> >  		l3_mon_domain_free(hw_dom);
> > @@ -742,6 +746,13 @@ static int resctrl_arch_online_cpu(unsigned int cpu)
> >  	struct rdt_resource *r;
> >  
> >  	mutex_lock(&domain_list_lock);
> > +	/* Refuse to online a CPU whose ERDT and CPUID L3 domain views disagree. */
> > +	if (!erdt_try_bind_cpu(cpu)) {
> > +		mutex_unlock(&domain_list_lock);
> > +		clear_closid_rmid(cpu);
> > +		return -EINVAL;
> 
> (comments added in response to changelog)
>

OK, changed as mentioned above.

> > +	}
> > +
> >  	for_each_capable_rdt_resource(r)
> >  		domain_add_cpu(cpu, r);
> >  	mutex_unlock(&domain_list_lock);
> > diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> > index d94c54617fa1..d4b630358d6d 100644
> > --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> > +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> > @@ -199,6 +199,115 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
> >  	return false;
> >  }
> >  
> > +/*
> > + * erdt_try_bind_cpu() - Validate @cpu's L3 domain against ERDT and bind the
> 
> Now that the changelog and descriptions come together I do not find my earlier
> suggestion for function name to be appropriate. How about erdt_try_bind_domain()?
>

OK, changed.

> > + * ERDT domain containing @cpu to that L3 domain.
> > + *
> > + * Find the erdt_domain_info whose CACD lists @cpu, then bind that ERDT domain
> > + * to @cpu's L3 id. A CPU whose L3 id does not match the binding of its ERDT
> > + * domain cannot be covered by resctrl.
> > + *
> > + * For example, the CACD sub-tables report:
> > + * domain0: CPU0, CPU2, domain1: CPU1, CPU3
> > + * while CPUID/cacheinfo reports the L3 cache is shared by:
> > + * id0: CPU0, CPU1, id1: CPU2, CPU3
> > + * With the CPUs coming online in order:
> > + * - CPU0 binds domain0 to L3 id0.
> > + * - CPU1 is in the unbound domain1, but L3 id0 is already bound to domain0,
> > + *   so CPU1 is not covered by resctrl.
> > + * - CPU2 is in domain0, which is bound to L3 id0 rather than CPU2's L3 id1,
> > + *   so CPU2 is not covered by resctrl.
> > + * - CPU3 binds domain1 to L3 id1.
> > + *
> > + * Return: true if @cpu can be covered by resctrl, false otherwise.
> 
> Could "can be covered by resctrl" be more specific?
>

OK, how about changing it to:

 * Return: true if @cpu can be added to resctrl domains, false if @cpu must
 * not be in any resctrl domain.

The other "covered by resctrl" wording in the comment is updated too.

> > + */
> > +bool erdt_try_bind_cpu(int cpu)
> > +{
> > +	struct erdt_domain_info *d, *cpu_dom = NULL;
> > +	int dom_id;
> > +
> > +	/* Without ERDT there is no firmware topology to disagree with. */
> > +	if (!erdt_enabled)
> > +		return true;
> > +
> > +	dom_id = get_cpu_cacheinfo_id(cpu, RESCTRL_L3_CACHE);
> > +	if (dom_id < 0) {
> > +		pr_warn_once(FW_BUG "Can't find L3 id for CPU:%d\n", cpu);
> > +		return false;
> > +	}
> > +
> > +	list_for_each_entry(d, &domain_info_list, entry) {
> > +		if (cpumask_test_cpu(cpu, &d->cpu_mask)) {
> > +			cpu_dom = d;
> > +			break;
> > +		}
> > +	}
> > +
> > +	if (!cpu_dom) {
> > +		pr_warn_once(FW_BUG "Cannot find the ERDT domain which has CPU%d\n", cpu);
> > +		return false;
> > +	}
> > +
> > +	/* This ERDT domain is already bound to this CPU's L3 domain. */
> > +	if (cpu_dom->dom_id == dom_id)
> > +		return true;
> > +
> > +	/*
> > +	 * This ERDT domain is already bound to a different L3 domain. Rebinding it
> > +	 * would leave two L3 domains reading the counters of one ERDT domain, so
> > +	 * skip @cpu instead (CPU2 in the example above).
> > +	 */
> > +	if (cpu_dom->dom_id != ERDT_DOMAIN_ID_UNSET) {
> > +		pr_warn_once(FW_BUG "CPU%d's id=%d not equal to CACD domain(%*pbl) id=%d, skip this CPU\n",
> > +			     cpu, dom_id, cpumask_pr_args(&cpu_dom->cpu_mask), cpu_dom->dom_id);
> > +
> > +		return false;
> > +	}
> > +
> > +	/*
> > +	 * A possible new binding. Check if another ERDT domain shares the same
> > +	 * L3 id. If yes, this is a conflict and @cpu should not be considered
> > +	 * by resctrl (CPU1 in the example above).
> > +	 */
> > +	list_for_each_entry(d, &domain_info_list, entry) {
> > +		if (d == cpu_dom)
> > +			continue;
> > +
> > +		if (d->dom_id == dom_id) {
> > +			pr_warn_once(FW_BUG "CPU%d's id=%d is already used by CACD domain(%*pbl), skip this CPU\n",
> > +				     cpu, dom_id, cpumask_pr_args(&d->cpu_mask));
> > +
> > +			return false;
> > +		}
> > +	}
> > +
> > +	/* Eligible new binding, assign the L3 id. */
> > +	cpu_dom->dom_id = dom_id;
> > +
> > +	return true;
> > +}
> > +
> > +/*
> > + * Associate ERDT table information with this domain.
> 
> Could this add a note (if it is actually true) that earlier checks ensures
> that hw_dom->d_info will *always* point to a valid ERDT domain ... or does
> resctrl need to check for hw_dom->d_info everywhere like erdt_mon_read()?
> Or are those checks just for robustness?
>

It should be always valid if ERDT is enabled. The CPU that creates the L3
monitoring domain has passed erdt_try_bind_domain(), which bound an ERDT
domain to that CPU's L3 cache ID. The L3 monitoring domain ID is the L3
cache ID, so the lookup should always find a match.

The check in erdt_mon_read() was only for robustness(I did not find
scenario that it could be NULL), just in case I added "if (WARN_ON_ONCE(!d))"
in the next version.

thanks,
Chenyu

> > + */
> > +void erdt_l3_mon_domain_setup(struct rdt_domain_hdr *hdr)
> > +{
> > +	struct rdt_hw_l3_mon_domain *hw_dom;
> > +	struct erdt_domain_info *d;
> > +
> > +	if (!erdt_enabled)
> > +		return;
> > +
> > +	hw_dom = resctrl_to_arch_mon_dom(container_of(hdr, struct rdt_l3_mon_domain, hdr));
> > +
> > +	list_for_each_entry(d, &domain_info_list, entry) {
> > +		if (d->dom_id == hdr->id) {
> > +			hw_dom->d_info = d;
> > +			return;
> > +		}
> > +	}
> > +}
> > +
> >  void erdt_exit(void)
> >  {
> >  	struct erdt_domain_info *d, *tmp;
> Reinette
> 
