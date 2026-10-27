Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793088448;
	b=NCnSqAbmNMicd4glzJsT25e+2cfxQiS+PZRCFy2ZKGuQuyCrlftcScAFdzBv2T7nQkXn
	 8ipyB4LynhGcNboLIY91+Zu0UqLuzSC8keZWpMCzwxE6V8ESMW7x2nmmA8UzVJ+INyEn0
	 EP8oUKmx0Lge5pJmxvQTW/peZTGD2MoajvuD7+fb4D5a4/iiqg2JOO+P2qXuwuvSG94mb
	 90OjU8eNT7uOyV0+7MS6gJT9e1tq+HHYU3yxSNygScNeEMK6QWeOYMvQ6xXvG101YxwT/
	 jXWGXoHuikc/RayY5OcAjVB/Tcyb6N3CpV5SP99dYhkHBCrx+9gVrwXBpwQNVnjPlZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088448;
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
	bh=I10IDCF2xD7YKQVAqSAeB2rehFuZaVnFfgyAn8Qoqck=;
	b=rG9p5e40soyOivikgDZPYIwS8RjIP+pk4UqoT1mso8LRICi5EPDrEdGn+eTW9itab8Wx
	 /lsnTZG4pMf2k/xmA2j1LlaVr61xXlemTyiWM+vws89ngRob4C63NE78hw2YVawxTypUx
	 Ch9FK2vdhuQHI7c0baCG/Q6ulchAIuUZ4ebr/JggBzCz+9mFMlWVBSzrl9oaI6QLkOYNt
	 jiHwy9xVUkyu5OQGVaNWlR8gacFawWH0la52wFLLnwJRIlrDopNbGZjq6VJDI1/77CdGX
	 8+74GDozLChEfJDp4G/nLdzT1ghMKyZFHIciHKxxLcwhzNsYl0SSiHa7ffDREwzza8w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GjGYKkF3;
	arc=fail smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37369606A329
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37369606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GjGYKkF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793088447; x=1824624447;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=2stjevnt2h8whu43uU9l06b/SRy2MsmjLk2ycw7oqgc=;
  b=GjGYKkF3pKvOax4IQ5hxFXALhyE6eTdmzkohWGDFUSgeFpOHenff/NAx
   bRgexNIav/dHyIonFhFJsYWFoCH16RZUsSjAfKiIX5MPcd9UGtr+JnRkN
   kY2opfPsQ/+NYPCg5wXltDzr72RI3eum/1xwXwxIgrWP/BUMuGLveWOrx
   ZX9Vg1fktjShBRHNt5ZUsDuFq1PWuCDuQJGz8qmy7RIBHgkrYsv8Imraq
   7fXhYv3+g655r4lwcJzkdKRGf1PvuIZ8530JV+3geTEOYAHYex2l8NUug
   KqyHx05r1XbMt+2E1QFTeWkDDdGmAP+55lhMu6fZUTf0tU3qkE1AnXvHj
   Q==;
X-CSE-ConnectionGUID: BsIDAbCNRLK/D/2jO/qnKw==
X-CSE-MsgGUID: ve5e2hymTvCXunwMFFoQfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1658925"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1658925"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:07:27 -0700
X-CSE-ConnectionGUID: eiiKR5UHQm2d2fUgDS8iqQ==
X-CSE-MsgGUID: 5wMUbNRLTFSfX6Jekw/gBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4522558"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 01:07:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 01:07:25 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 01:07:25 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.70) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 01:07:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uavUn5PnLOkqlGOZXzmw8cZjtbZh+NGbhyWnzNEeFechWWe/tru7vjFGGvpIpb2X8CVZRyQesPuACyD0NxyP4se26QzGiyLVd9c68sY2ff3BU96UrBfDoVl+bO5O1LX/GAgUOJopnGVhAK5d66D1oFcmDqX3Tn8VqIHYMORrJfGMkJ2kNBvOSpsiZoSbO2NNZFc8tFZbrTpwCOPE5eL6vDwoycFYh8Ioo1Ul2tOTdQkyoJdIBQ8bPMghLAQtT2iF0t62rTAvthoh5NRc5kE/Uew0yqHhl3BsLOuN3CWu5L4iTjNmGJrdHpEdUZBe3+jmq1qyNqLc/T1O5Gjj6/LF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I10IDCF2xD7YKQVAqSAeB2rehFuZaVnFfgyAn8Qoqck=;
 b=Imd77sLJgQDiEpYVrFU/zY+dtvdHLbRN4dDsWlIUPfMkpmGcIQj39xg+rbmjw4LZ3SMj5KmwJ1/n5VkjeuqCHHEfO4eK/wuXuCPQhLg0VqS+YDKXnXjn9izI/3ot+gfwUIUK1f1rsXw0Ft3oVai/faDLvE0tjH5pdDe7oZ8AuQf3wdYJaorvnASGi8g9L8b6i95TAzbzrjUx9hbOo/RLLGej6ResqLNkjUIic76Ien353BL5u/B+4nIwa+XgpY3svET6G8HxWFYL7SUTf3goZoms0knyoA6r4A6GfPqDwqTPtDjO7ROZOF6jMrX9CuaW9S7hmNEXfAnPsjSXRhfWVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Tue, 27 Oct 2026 08:07:18 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:07:18 +0000
Date: Tue, 27 Oct 2026 15:54:27 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 02/12] x86/resctrl: Require 64-bit x86 for resctrl
 support
Message-ID: <auBYs3FyB17bM0-E@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <2d718521cb64f27bb14a377da41121f890f77d43.1791933001.git.yu.c.chen@intel.com>
 <ba18fdf3-0a6b-42ac-befb-3c894965e26c@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ba18fdf3-0a6b-42ac-befb-3c894965e26c@intel.com>
X-ClientProxiedBy: PUZP153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:301:c2::19) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: b1224df5-f313-4833-6159-08df340151c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|7416014|1800799024|366016|261026121527099003|11063799006|4143699003|56012099006|261009223027099003|261022075727099003|261022105027099003|261021121427099003|10067099003|22082099003|6133799003|18002099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 3LXJO9G8N9Z6PgTXQ1QDQpvSLRPVLvNATUF8YiQpcLJNNCfYo87DciMiP5uH3jbvf28X6RxgmKGjhOvgnjD8wLICZ6WI48WcauJsg7Hr/4E1VAoZJ+wNfjwnkqZf4E1eev8WxUvuPN1o5osIoTVgkKgQX9kjWXoHWAiczqo4o3MRlFU833MCdt9WsjgoZEprkqPWYxvJwiAarBgCD6yGue5n6x97LcP8hotzRkia/JAqEgWnbbnjGjXps0e6wDNWCqsWnzl68I9z5jEz8NZXNrDSSo2wiSCqiIMNEpHBdCDoN3p1Nv/COXPGo84d21ZckH1k0FPwc7OCU7kDuLRuAKNWbXUA2PwgxPGcOWrO7QsJets/BJlxxvW1evaK4nmUBWUgYmGyFmaWOkT9RsFTkBy25YfBp9xOsMKltSTv/LCd59ulRvmQJPSe0hT0VSxjOYitoPolPAm9NtpZica+CZNaoHFlL4bF4zbJAO4nXa+pvBdmKY/Xzu231XjLSGFLBwohdvuoQY6FcVgUuYLhaw/4UEa/eRzVyXmm8ASAnBmxLTZs8mEUZF5+MDqoNishEfuOFLGXwknW1fDm3wVZWDbyesJCNUbt8kVFBAiL0t1MAOkyCCLzMdTNM12J2jGE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(7416014)(1800799024)(366016)(261026121527099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003)(22082099003)(6133799003)(18002099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wWS02iUSXuFzZIpf6MOZDqEEpQtRuJ8sroa9Xy0YTrMPZmhzZ7beg8B5NZKK?=
 =?us-ascii?Q?mWytS9E2k0gIwaiQUT+sSLOc1MODBvj8fwi1dscRFRjD/3O5xD7SBqNKBcBt?=
 =?us-ascii?Q?CgW0qpMTNz1dxJIuy7a0oICwq3pmhOyWAvODbb2j97cd36J/6l1I57E0TSgJ?=
 =?us-ascii?Q?zHC6b3HC9CY0UzudfyxE1T1TjiGQC89LwmUNDL2xA9eofesMYPVHSDPGfP1x?=
 =?us-ascii?Q?oXbupARE6izG02erYymWumxNMpE6eNYrPcHswDR2KZerq+YvXzMYlQPVvpZg?=
 =?us-ascii?Q?gPPpUp3x4Z6aVaRli5x72XrZvK4PmUpHpITGZ6NppzFrzVUgURNu/dCxMvo7?=
 =?us-ascii?Q?9cUvmp+FEFrSpmIWyq3BFKQk6F6od4hSS3MjYpGTXVTTB6phoreWvsXH9zZ0?=
 =?us-ascii?Q?QFJFbWyaGeq4mJjR630StuXxU4Ampob0Zoiq7VJ9EYqYYw7IBwdsV/HcAKMy?=
 =?us-ascii?Q?XG71zQL9v3QMr3M4cIfKob58zkdsFmemZGDV6jaNkN3Kg/x7BH9b6oD1D+tf?=
 =?us-ascii?Q?fzOASsnZ/xstAe2AOT3tnMlpRoAJogykmxUZW/HhkEDqQ6czJPqXZOS55otg?=
 =?us-ascii?Q?/r3Wig3ywt7ezrXvY726omjN8sFeO//FB4cGkGhyML6/6KG2O0XKo/zYi3Dv?=
 =?us-ascii?Q?bHsUir2K58mn34SBbTBudzIIlYelLu0snMoByFK3olz//tUf+6+pTqZgab73?=
 =?us-ascii?Q?itkSL7lDu2PpmpO8RifMospIJZh2NW6V6rfemwhyMeaFJ82QCEQo8Xn+oWow?=
 =?us-ascii?Q?o+X/ovwRLKxrWBb9Nsh1YEK6H39YWRlBKsjEpG37S5TVDUg6hpb+Sx/TLAxx?=
 =?us-ascii?Q?fiSvev920NFOiMr0w2srldFNOHoZk5uTKgfUVWyClKaE/fZq5xBnlsn5aslb?=
 =?us-ascii?Q?nEOXGEC2eNbRJP1KgE8E84ZW2ZBD9oC9wW0Rp+6yxKU/ijzHMQibKmMUa7YS?=
 =?us-ascii?Q?PF+R0plEthUqLcfLzBBaHfEMpe2NjH6324NYHqzG3ds0+pMmo9IG/ib659Ci?=
 =?us-ascii?Q?0fwWM/AyUaE0w2m/Zr5srhdsGeXpZITdv+guj3G6pR2aEkVoGN2mDaCHhxzj?=
 =?us-ascii?Q?XoEFlPAC1LgR4E97T3UL79oIE3eM5HhJWcVjuhrJwXBGjwkvZ/iFEaGPfOke?=
 =?us-ascii?Q?rEXGqETI2Zr6Wwhh9vq4YuV/55/+6Ry6OzuwcaNcudMAjPmnw0mjkbl3zSIN?=
 =?us-ascii?Q?dRvW8sUF6WG86OOm1jlSdEJEC6xHChUoUbtoqYAJZzlHn4bth0aMaoFcAw7/?=
 =?us-ascii?Q?Y7yhj/vdkBYRJgP5/L7uw2SW+v/jvjJpZrWilQYoe4RcOMO3VueJlZAKPlW0?=
 =?us-ascii?Q?0hfYGy3W1XDwtsyva2UM20KiP5qR/550puvHK/YBiYjwmiahXZ+j2WZWcXiv?=
 =?us-ascii?Q?fZB+iH6KweA90ncp/NKTc3aUZciwQBOyA1anKBQM4m0lsRP4Fp9nrKaXajX+?=
 =?us-ascii?Q?tH7AHBDSoiL9z+bBuR7Ap/9+lDFAKzqiGc3E1wjivK7AyhWXKtGu3RM4NMfE?=
 =?us-ascii?Q?NlkoZ9SuIK3Y5LbZ+JS4CI+sq8MZ2Rio7Y86SLEuvIXtpFk6r9HcslwatXJl?=
 =?us-ascii?Q?mTigT3eRYodn2PsGRYQrDFOIuEkUb2maydmHyLuQWXe9XAoz237+GqNboHGF?=
 =?us-ascii?Q?dDGtZ1SY+sJPz/gYdhhPuM4mMVhFGdpDTxNMm4VOzICOqluUP5HukEAgi0/y?=
 =?us-ascii?Q?R66wflHlVzlfvMWfH7yukmVV04/y16yHDxQY2GQ4ee/lBySNakKmrpcAkLcV?=
 =?us-ascii?Q?y+f4ycTkuQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: hR2qWoddLnQeoxpQ60+jaBClVBzFoW5kGpZ9Igv06gPYf91N0NfVsAl1WSRbCXlN4bm3yzbN/xDujVZuIFDOJxsWPM2ZwZZZrNgLWNt2+4DlaM+1FGE6VCMDpJ3nP/ZIJ60hrLGcJYkDh9Z98787cUx7ysO1KBnpw8HNWgb71dEYvFVDZMSKZpQIciVF3cgjB/QUBm2sbAzV1nCNKmlyuAj9EI60m3NofPQQvHasaaC/PnMGr8YbwDg50lnjxScrsmiPGbvDGzI+3g5jhvTCj/92OYRpAhOSXgs1akIWLlCxRvPuP1ZQrFUwUndF3PKqEz0YDV/WhsA+ac7IGGZgXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b1224df5-f313-4833-6159-08df340151c5
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:07:18.2762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qSz5AGNaMdvscmVvpnSfkAEEdSdAOEooTYL5leFCtR03fGLhimoo6HcFB4IHLGchmLdeN2yD+TnF19QnxH3wuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
X-OriginatorOrg: intel.com

Hi Reinette,

On Fri, Oct 23, 2026 at 04:46:22PM -0700, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 10/13/26 7:58 PM, Chen Yu wrote:
> > From: Tony Luck <tony.luck@intel.com>
> > 
> > Intel Application Energy Telemetry (AET) provides event counts in 64-bit
> > registers in MMIO space. For accurate results these should be read with a
> > single 64-bit load operation from the CPU.
> > 
> > In preparation for the removal of the separate CONFIG_X86_CPU_RESCTRL_INTEL_AET
> > configuration option, move the X86_64 dependency to X86_CPU_RESCTRL.
> > 
> > This is in line with Dave Hansen's proposal[1] for an addition to Linux
> > documentation that details reduced 32-bit x86 support.
> > 
> > Signed-off-by: Tony Luck <tony.luck@intel.com>
> > Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> > Link: https://lore.kernel.org/all/c6ab0c24-8931-4f0d-9be6-23498ab4c38b@intel.com/ # [1]
> > ---
> > Changes since v8:
> > - Pick up the latest version of this patch from the AET series so that
> >   both series carry identical versions. Changelog wording only, no code
> 
> Please do continue to keep a note in patch changelog explaining that this is
> picked from the AET work to help explain why the changelog is unrelated to rest of
> the series.
>

Sure, I will keep that note in v10's changelog.

> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
>

Thanks!

thanks,
Chenyu
