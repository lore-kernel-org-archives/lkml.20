Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793262673;
	b=j7zoq2pDYTPacEmJzfF+Ptrizw6hcNwXHntLDdAMqlGisBq9Nak7WC0Sz4sIQvMUDXcA
	 NM0xcolmiwY7zZJM9pBQNlaWXPv02gZQCWwCMdSLGfWeOorCDhBBcq/N7Qo9mxFZ/MykE
	 EXMBtZvOM41Xt4+bTyS7y+t++fm31+FQG6tG3BBdpea2qk0RdGMjSmoXZJi3hMr1hIV2+
	 +dE03mNf50lB80Av0qUuIDU3yhKQB4NR4ou/Bb2LVKQScwiz9q/muAWEd/ZwRuREOLGnU
	 2Y1+PD+6nj1Xc6xB4ejKj9/MYFcIyRDqtSCblgWOA8BnngA+XUN9/F3qqaaLx8n/mtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262673;
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
	bh=Q2UdLmv7D00e49gJeDx/r0PF5WJXKzx3W/s2wQaofHc=;
	b=yGrRpbSNjAXu/Ad3MxylQrqclMJFgHcoevLtjnGVwQt366EGeiIFjqQMu3LCi00LiGxU
	 0sc8vl72E6rLC16MsL8tpD3QY897JZTk5TUG0xkbqv4ObX9wsYCHYKBeSQ/DmI6QwXfaq
	 z6nAyWtB/Ur/TLf0beP7aEtVOyHy/0C9MeyBNXSeNjFQ0o7Fw23V0+T2jvtw/MHcR1DiG
	 CBfZ1aNT+7uvOd82SkGFYsacEyPHTJ1GEwe30c582ICf/wFoFjKatWAmBp0PhYlP017nd
	 06Te5F7J0psengEH8lZs8z5+ngrZIZufZXeETdp5fY8V4nxgEkzXbJMAdOwRqXmxuyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NQyK80sy;
	arc=fail smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FAB606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FAB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NQyK80sy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793262671; x=1824798671;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ypK9c6jjKKG0CrllsBRpebXC2g+Qu0cRZom9ikL2yLs=;
  b=NQyK80syUSacYhydszy6AYAAKmmMieArNWhjBQIYbPj+aRL5WJyiLqng
   Z560w3iwCrohLilePbMerbKr+p+13U8gXKjux/rGaf64HNLfe4uhQEHWc
   MRiuRKh6rA7bfIbJkr9OeAvyeCMT1Fg2DLRQ3U9P8BNA9MGmJe0gRKEG9
   Jg+uXwMpIGuENGJxcgp5afJUAfYzWhySE6NqjsukKBU5+Lr4BdQc0Lnjl
   zss/LJesEkjVr9dLVsworcEqp4sb6P8ZbSBvVN93APgFtfbdClmUSwH0B
   V2QBWM+1vplSm5H39G8yRDYDGqzjOgYcgSBmpSdA93opOSvyLYbQw+BY+
   w==;
X-CSE-ConnectionGUID: xf3dtKhWTz+KFMx6tRd6Mw==
X-CSE-MsgGUID: ubbtIGF4SQOreqF3TESMYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2092186"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2092186"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:31:11 -0700
X-CSE-ConnectionGUID: CmgVNIeoQCqJaJ4jIYt0Bw==
X-CSE-MsgGUID: l4IrxXdjRNWCGb6Od00FtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="4964583"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 01:31:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:31:09 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:31:09 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:31:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFsjg+rHT7EPaTlci7MwbMdz9T2ArGidYdowBdZB+N+KKRJhttS5wRDthUJuiXZQxgNg6e9J53gi9o5WwwCWv2q7WMHWr9LGdbtdrHgmN7i9S3BTzTb4jtL1tNW57jv+RElR7h6KYSZurP34Y/WlsWQeLwGb6smRFIThPNOw8Yn7hkXqIPZHhszdc3LTJsqoTXkuRBURVkQbdE6QemdeJ2hoJmiN0flf952CJOT8XK6gw1ozejT5W+4m6kTdVqZixRJkgvLTPU5d0qfRDrkMBqcLUQ6HLNJERA7P9El/pibpD4wYfagHCEe2zrfqeK5wJS4hBUCw2cUYs0HHSIbdow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2UdLmv7D00e49gJeDx/r0PF5WJXKzx3W/s2wQaofHc=;
 b=s2nd2GzvBF39CCa8gluE2zbcREeh6HOtXIZN8dqE3BdDtIt5ReTUs+rNbLlmUe4CAcex3AbNPEwkDSrC3hc3akY0cnR5bkdU3MPSsGfjaeoeiUeXqzB3e//brAncp6pBMqQgDI9BnKW0z00PwEsNrAS9r/Y6GzvogKLx6OfarcbWtstFcavBqMPPeUEmKudhIVEvyyEqv/2fGI5ks7tozraKOXDyJclsCBzos1oh2hBYm9oUDCym6jWepLhEC4QIOn2bZnDcZri5MpBCalvHSH5GYh6nsw7jcLZ5hvhCIyw4Esw579Ua87IEXcGz8shkjywj2p6qfVeCYpadFBaL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MW6PR11MB8365.namprd11.prod.outlook.com (2603:10b6:303:240::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 29 Oct
 2026 08:31:07 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0569.007; Thu, 29 Oct 2026
 08:31:07 +0000
Date: Thu, 29 Oct 2026 16:18:15 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Kayra Cizmeci <kayracizmeci@gmail.com>
CC: Zhan Xusheng <zhanxusheng1024@gmail.com>, <peterz@infradead.org>,
	<mingo@redhat.com>, <tim.c.chen@linux.intel.com>, <kprateek.nayak@amd.com>,
	<juri.lelli@redhat.com>, <vincent.guittot@linaro.org>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <linux-kernel@vger.kernel.org>,
	<zhanxusheng@xiaomi.com>
Subject: Re: [PATCH] sched/cache: Check reduced capacity before
 alb_break_llc()
Message-ID: <auMBRzyMRwBS2HFT@chenyu-dev>
References: <20261029023650.3404429-1-zhanxusheng1024@gmail.com>
 <auLs7xeL9FsHcf-h@scheduler.schedules>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <auLs7xeL9FsHcf-h@scheduler.schedules>
X-ClientProxiedBy: SI2P153CA0003.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::20) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MW6PR11MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 12f19076-6365-4c1f-47ca-08df3596fa1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|261028144727099003|261026121527099003|10067099003|11063799006|56012099006|261026140227099003|4143699003|261009223027099003|261021121427099003|261022105027099003|261022075727099003|261021123027099003|18002099003|22082099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: WkJ7tdfv+MWyEjk4JvHzKodXVMBmcMFMk9vDfij67Pz8kiGoisdQswxawB1ExHtud10tIS/VpyAF8Wu0th0pdIc1bI7ZbjHfsrOSKmpyiHU6dEvwhKsnSaIx/F4d8Oa0Gl1XcvnWJ3OhWKPPbvLXveDBrQYY4VhAY8EzCGuyqlCMUcU1bdWvTZMlOiSon7BlJSbrW6UMSmpJsN19+dKU928reyfeuk0sJSO2E8C7hIft4foE0yIVDx6VM234MIhZT0Ge7mzcjNAXptK8K0Wv2pR0Xhl9En/FddpP38PSNnHlWPumrc8lHJGaH1lL5lUPTUVqLE/3qGcpvRyNrAB7SasmU0upWNwAg7SxynG0FQss8WHOxGSbeUCmJOWgtIN7Ia2/nirmv9k07yn4JqMk4VoFziEnLWfLUdz/OI4IDmeJogMtu3N/WPm+NDLyTiORJNoAlq8gk7UtYbuJLFr0SYehnOQq2PThxzI/YyaNtSr/a4GdqhhqXpRTNNBEpJ0xc+ngY/4Wp3QT45x+OoBypOPDrt4o9UHSYM1+e4kx0egftkehNW8iCbCOJOGXJqRzSEYFlHL6ZUuJeupGVnzXcYw3cGK29vj4JCQW2sfvmBbUY5Hm4+jyKlaTiUY9OAKF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(261028144727099003)(261026121527099003)(10067099003)(11063799006)(56012099006)(261026140227099003)(4143699003)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261021123027099003)(18002099003)(22082099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jpeh2x2qboYzHBKMPjul3BraLS+nxzRTgNc/ztDYdSb2EQ4wOFyBGb8eTk2H?=
 =?us-ascii?Q?tu9nbh07ulYBJmKnGt7Yiqe0Vx9FbbsO40ZBjQ5w2NSxUVO7eXTbfk/Nti7J?=
 =?us-ascii?Q?7ESG6tnbvuaATo1/OazkWxwEskCa+AqB4FjirAm3wnpb2INNNGozmqmt3Da0?=
 =?us-ascii?Q?HdDXog+MFh7vab1XtRs/FFmUb8P13jTzREQqAicJw4MDXH29N1qFM8IXLhSR?=
 =?us-ascii?Q?9WIUUJGTwfRE5Jne+E4XDQILl+Rayiet8Oehsn2f58dfL51BxOlFDYzJ8e+a?=
 =?us-ascii?Q?VjCwfJ004DqxfHlaJeK3KllSMasSDperlmTvgKl/73PBvtsBlWcpPUwb98SM?=
 =?us-ascii?Q?VBmkh1prFbu1OLufTKNAkqdHyyBJLpGSjs6Y0iawF2Lg1s05X1+Qi0rKacbk?=
 =?us-ascii?Q?zz+ERQiV566Maib/C0joIXmT++DRxbYJEkD4dbd6/CJWYAmp5pJRjGexf08H?=
 =?us-ascii?Q?s8KkYNHi3KXU/Qm85Svww8Z0kyNBhy4MCN9pr7qssMrN7M6xorVZw7Xc7zFR?=
 =?us-ascii?Q?2VdWcgiOEdazy/Q2fwyMxZ/XOaTYCk44sxiva7Fo1uiC1Fky5yL8KLw/irf5?=
 =?us-ascii?Q?p4Tw00OMq0Xol4iBQJA3XnaoDuNBbp3KQgR5AIn4DqL9SR3uxrYm5Tx3fcl2?=
 =?us-ascii?Q?lfMxQfKvPqtGIJTIBb3h+M8AHihwiZBzekGuELgfrN6FWwiaVYpD4NUyrgXK?=
 =?us-ascii?Q?deLY8gdG5mPoRcaZxoBeMpGuofnFdKvMZ34Uj5QlpQRCXprfFdValpU8E1/a?=
 =?us-ascii?Q?XUn5ETczuFB+HatJdho9DigJkZhQrKUz95OHVJyImHrsS9lYYKLs7EYWfnot?=
 =?us-ascii?Q?lL1Ea5mP6OKGB5SvXTlb+dbE0l2NmxmlXxLyZsI7RHkpXegBf8bRmkcmjlJV?=
 =?us-ascii?Q?xpiLO0pSdYFjpffFSzREs6KD58njdgKW1SsZmUIK4dlxqkVf7FQjMefYxg/Q?=
 =?us-ascii?Q?RhBysfOjS1h2271CzrNehg25fui1vt+30pgd+6K4VsXClot0smnIavIOxxOO?=
 =?us-ascii?Q?TARP1Qn9KqW0RjWH/9q9HCsR+jglm0amMxODMhgB57SG2Rnuvm/mvUuI38/x?=
 =?us-ascii?Q?ABWpSoIOKh4X/LOesfXI33Iyf4c6qNu3i2W5s2CCeHpMcL2aVcK7z6KOOWlk?=
 =?us-ascii?Q?hPwBRv0Dn+0kQGoVwPpZm8eL/auVkxEqN55pm+7z3fITpqh7WhmGBi2uNYg3?=
 =?us-ascii?Q?Libh43KHzaxPJnN2pZFIi0Y/B7l07SFfjUqtH3RlxRPSwZE/sw3mNQWeoTaG?=
 =?us-ascii?Q?NOh9/Nbjk7qRtRjNz2jGjSEVnQ2evmXkhRaJbR5VktP8kunv5siH2OTfMzlJ?=
 =?us-ascii?Q?psPU6T1fzPBmVtxCTW7I0dwhxhoOGiW675g0PVZbOWgbULUmNQiCz8ArTC17?=
 =?us-ascii?Q?cm6kP2bPfQ24d7MUzmCKt268bmb7VAXEOnmfNujNA4zbQDzHrGej3vbNLYOg?=
 =?us-ascii?Q?UvlKXhq4Ek3YCfTL6cPlb5v7g+RVP1m0we5v7bHK+n9N3di2OajaX2QMJ3+b?=
 =?us-ascii?Q?Vnba27cC7qIpP0ZlLYPTqcU9B6Bl4K0dT87DFPJlyMsIDVoeQvi271O0En5U?=
 =?us-ascii?Q?9ti7yHFLhyXqZLi10Gv+iPyUzWozJRf4lIzMP/fyW2IZTgB5U7oLbzbcjo8Q?=
 =?us-ascii?Q?SvzHYMWFMt7zvbzBzWiJP2uXLMSr6rcnfWEZv+H1ysgDhlQsLXQxqorHFdH5?=
 =?us-ascii?Q?d2FRLeCO7vnWVnJMhTSCP/TNOpiy+ChrKgiSFJrXwgWaSdzc2CiqHTm5UaxI?=
 =?us-ascii?Q?gi3r00S4lA=3D=3D?=
X-Exchange-RoutingPolicyChecked: IpD+pFuwRzRUbnZP77iOUNAdUiG4LOsi2exfNZjCL/ijvMGYmlq6aXd3EMDTKJ//JR9gd5aElXoyQd+XVIVOSuGgKwE7vTobOxoo9SzVO0JtINUVy2QSol7DlzC1J8OPyoqLHfKHEQbJYyowiHKe0DKTf0XTB0/zNZnrGqJuicN9cwkTEg1YINtdNTirWC+LBauACvQTIrQw29lo3/NICfhck6JIU50EHxiruuqwevY9LiIuFMoD+7pwI9EvDLrz8hYcwRK/qRzOUTJ9cyskQFkQuqN8kqHab+ISw7HiCh1AuuL17JgObNR4XpyFtgbvkg7vG3g6EAq4aMen13pJ0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 12f19076-6365-4c1f-47ca-08df3596fa1b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:31:06.9502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ol29K8sQWIqR4K15qrWbocwImFI+s8QkYKjQ9klJHnvs9r/Ke4MQWJ5TEI+n69ldyHqGns2awPeEqVSxC1pJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8365
X-OriginatorOrg: intel.com

On Thu, Oct 29, 2026 at 10:13:10AM +0300, Kayra Cizmeci wrote:
> On Thu, Oct 29, 2026 at 10:36:50AM +0800, Zhan Xusheng wrote:
> 
> Hi Zhan,
> 
> > From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> > 
> > need_active_balance() moves the only CFS task off a CPU whose capacity
> > is reduced, for example by IRQ load, to an idle CPU with more.
> > alb_break_llc() runs first and refuses to move a lone task off its
> > preferred LLC, so if no other CPU in that LLC is idle the task stays on
> > the reduced CPU.  Like asym packing, which was moved ahead of
> > alb_break_llc() for the same reason, this is a performance case that
> > cache locality should not override.
> > 
> > With two LLCs of two CPUs, the other CPU of the task's LLC busy and 60%
> > of the task's CPU spent in a hardirq, a CPU-bound two-thread process
> > stayed there for 20 seconds at 38% of its normal throughput.  With this
> > change it moves to the idle LLC within a second, as it does with cache
> > aware scheduling disabled.
> 
> Sweet.
> 
> > 
> > Fixes: 714059f79ff0 ("sched/cache: Handle moving single tasks to/from their preferred LLC")
> > Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
> > ---
> >  kernel/sched/fair.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index cfc982205b98..e313c6d212c6 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -13585,12 +13585,6 @@ static int need_active_balance(struct lb_env *env)
> >  	if (asym_active_balance(env))
> >  		return 1;
> >  
> > -	if (alb_break_llc(env))
> > -		return 0;
> > -
> > -	if (imbalanced_active_balance(env))
> > -		return 1;
> > -
> >  	/*
> >  	 * The dst_cpu is idle and the src_cpu CPU has only 1 CFS task.
> >  	 * It's worth migrating the task if the src_cpu's capacity is reduced
> > @@ -13604,6 +13598,12 @@ static int need_active_balance(struct lb_env *env)
> >  			return 1;
> >  	}
> >  
> > +	if (alb_break_llc(env))
> > +		return 0;
> > +
> > +	if (imbalanced_active_balance(env))
> > +		return 1;
> > +
> >  	if (env->migration_type == migrate_misfit ||
> >  	    env->migration_type == migrate_llc_task)
> >  		return 1;
> > 
> > base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> > -- 
> > 2.43.0
> > 
> 
> Well yeah. alb_break_llc() just returns true in the nr_running <= 1
> case. FWIW, on my tip tree this just creates a conflict. On me
> alb_break_llc() is first, then asym_active_balance() and then
> imbalanced_active_balance(). I think in that case moving all three
> functions would be better? (below this other block that's for this case)
>

The position of asym has been adjusted in
https://lore.kernel.org/lkml/179284198232.4109677.752653731564503349.tip-bot2@tip-bot2/

thanks,
Chenyu
