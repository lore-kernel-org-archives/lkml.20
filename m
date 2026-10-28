Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793157140;
	b=vvUl4ZVq5b8DVDIFyBaOTDFjIwLEnnGxOsTUSvBaQZMh88JYKclWjIo2tF4Bm4QOCVHl
	 zEDghvKjBu1aTxMbLi07cm2vBAzPx2PWOi9QnydGxo5XJfA7QIu+oCntG3B2r6eC1bfRz
	 VELQoILOqXmiUgpXn7+gaZN0udhFK1OZvr87E+Tq1SX2Pc8dd+tXNvI+okwMDNW7SHOmz
	 ypqGnR7bSs/hbCEuu/gK8YwlL4SadpIlD11Y/sZsZO29jr3QKpQnaYfcPSr6WHQvxcUlG
	 oRtx8KEZ/CxFlnpM3IcziJOM16vG04RVgZbcyU/BbZSn13AflFiMfFswMhAJTpcHfiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793157140;
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
	bh=yt4N7fTQrHsZN0+rObwEdB2gyINFYRGEZCfBguXpERM=;
	b=U/kn1PxQAZJwFRsQFyrQpBhfLux80qaJmdTa08F0xn2gQ8qfzMepL9s1ecDFjnK0foZr
	 4gR6jf4L3QA4jwKj0G6bNBSdKM8LJqgXQmGpDLRVUw/beTQfzVZZqyiS1zkeA+6gkPBEL
	 bLg6nVmAotLFCf6kiJukeaWhTpYNthPQhcMfo+xB3bOyevkaWF9dnPCGo+NE54E5gfTTN
	 Zzrl7NLy8Ee+mLEXc7iL3fURc4Ikc7B9ljv8INWLG3CPIqDUzfnkopxJbsqJFnajKvOOY
	 s/jcQ4o7uI8an9my7vX15Vgh33wAik/90ez3s3rpwfWR5vtGwp16pBTapQsGWHlXoEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMzdby7Y;
	arc=fail smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE124606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE124606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IMzdby7Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793157139; x=1824693139;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=RDbq47KR7M/mIM3p7GTJSuRkPXDiic6aoPlIgLW3T74=;
  b=IMzdby7YJ8aG/mdoZYsBI3W6h3oSRYGb5OBsge1idpuMqtVzb7oVzOqn
   9BCiIRe9XwETvH4th9J/G3WNPUe7Z4w2mInnuhqBCsRLUii5FSLQkFD76
   aIZV8AG7j2vNBLrjwjpmKwkFY3doHs1GztWp+qpuDEKIMK2Q+vnmC2rrI
   C5AJY6bJ4Hjllp3FnNnzrjBnUgAa4unbXWTFkeBBJL12L88zBfROMG8Sv
   3cRkJ8KDZ5c1qS919T6Cnq31BQ7IEArS4fNeXIdF8NfhC9OF+jNF/L1lK
   PWNY2W9mSYRJ2c7od2FFLmNM6HFKX/uy9pgdU9zorHIkx1UeoB8D7ji4J
   A==;
X-CSE-ConnectionGUID: yUvCA9rgS465VSKlthTK7w==
X-CSE-MsgGUID: h38orgS6Sv2dXKo6UYLFog==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1747713"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1747713"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 20:12:18 -0700
X-CSE-ConnectionGUID: 9Shy8fkPQYCCukSofgRYuw==
X-CSE-MsgGUID: 2uqPZopSQ+2v5hQ6jqcGhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="5235720"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 20:12:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 20:12:17 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 20:12:17 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.71) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 20:12:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rasyua5rQOvyCo6jVAShw88nMyyqQRU5I/XLyJ1aPMotYwuxy059aTD8bG+Zls44zJ9sfbofDZNlUZEXPO4lTTygDg4Di1v5CSTClLbz10mEj2NUJx4i/veN9muXrre1HVcFt6IO+9xeG/jbdWDad3VjjRyk+dkdZWeMaYPluqfzpx5vlcA4dpWMGYtYFD6itD6RyaBGjo8omQe1qqauUIZEUqDf3hOqH0NV15l1Yp21XZhMuP2PXc8qb9r8kbM+gsAvGi8ztEoTYn8RWX4o/XGNcBsO+71hWZYZ8wT9oJob4s5ACj4ubbntsuUG0JtF/2yF4wMcq9NmBfx/uXI63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yt4N7fTQrHsZN0+rObwEdB2gyINFYRGEZCfBguXpERM=;
 b=q/Jar6y1T8TyPTKMN7Qfxyc/b5ChOqRp+dnUiWAlKIL47jb3nUThDfS5BsHJp0aeDu4sBuJMXhvo6CcBYXnhnpPnAXKdmnswvosx220xfFqOuFwUZihXgr8yAT/LFlwcFid4PSOp9HEso8Ws+0QRksuVTvC0OV8IImxugpKAl5Dk1RYHaZkW+5fPz5OFaxy1Y6WuC6SVXqns2naWHCIfBpbGtyp30LYrfpSodUiJ0KP416U8PPM68WSm4wzNGWtGclesALfUSMClISScfJqdY6nproH0H3h/OjLmtIDqf4YG/+r+SdXAOD8DkofiUl3bHCU9KRmaipRf9mqg7SHbXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.22; Wed, 28 Oct 2026 03:12:14 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:12:14 +0000
Date: Wed, 28 Oct 2026 10:59:21 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Reinette Chatre <reinette.chatre@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
Subject: Re: [PATCH v9 12/12] x86/resctrl: Add MMIO-based LLC occupancy
 monitoring support
Message-ID: <auFlCdo7F-E15lDz@chenyu-dev>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <afa6d022d767b0debb2aa7814699ac9842825820.1791933001.git.yu.c.chen@intel.com>
 <9e4fc1c8-c40d-45f3-8735-94d218168b8c@intel.com>
 <auCJh7ZOL8CSbgvv@chenyu-dev>
 <d59c8bae-6429-4718-8653-117133462b49@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d59c8bae-6429-4718-8653-117133462b49@intel.com>
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To DM4PR11MB6020.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|PH0PR11MB4936:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fba8486-2efa-4181-2822-08df34a143be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|18002099003|22082099003|261026140227099003|261021123027099003|4143699003|11063799006|10067099003|261022105027099003|261026121527099003|56012099006;
X-Microsoft-Antispam-Message-Info: eisjo3yqNjNYZfjnyVlA3ONL1Q4YiANlfczJuiJbxJFy423EDsK9yAFP5dCmqA+P2QrVTFFwDjYI7SaWxxCYJSMQhxV9/s0lwl26p6YPQJABqFJHEOxdHFBoYh8i70cOrPYAUpW05uoCyLGE/P2W2wS5U1Nw2THZ5Zqn0DUECskNhed4lUFKAFPOC+dGY0EjMXjVRZ9YGQ7N6mFqviUaUWGs3Yn3wjmTD5si0YYlkCO2tt0vsf7KX0b8vei7UdNVjiWtUgyXnHtfYjvU+Ky+w6VB/TVVPjMRl6RMm8wMQ/I77Db5qgdN0vccFQwAzNplnG3CbAEULSvYTlWcLU7vwK1dt7izSDX9/ywEQJB1/2FSAAk6IJ/zi5Ym5WFPvUT8EJ8RLOijzwxhEqnvko2d+db6hMd4YnqwETePSXp0ceI1IxBZJXE5OBvJIk9NmN+kIIfQ+vhB/k6QaMRyGrhbxJkDjLLsEfYA9GuHL47TqactltgQyeaP6xd2aQhcIkaFIecLGcvsN5K2PREmMVEr924VK2NS5itAKdsfb57763ROeDsSVkLk/uddyFyybd+tChDQy0tf55rsy3Zg52h/+WgNZhihJ0rZiRU66IRLqiZmzaS0gnjLSFqwsgxyLitZSnTmzXoWF01pYyYnzFJcZoNIDeF2khKJhG8rQsBQGp0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(18002099003)(22082099003)(261026140227099003)(261021123027099003)(4143699003)(11063799006)(10067099003)(261022105027099003)(261026121527099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SwczdZgTXhfMoFqJq2MUYzkKAbyqg2ZYHrRrrm28iebhiYhMobgioNOWfw9H?=
 =?us-ascii?Q?vLApS1d02spIzesGAl/IUs4Zh3GKia8dmDwyV38M1MhSsPB/qG9LcmM+gLPF?=
 =?us-ascii?Q?bVGIFcoBMzYjxBhq5kQaH12HY0hRvbP2P+TZZ/qR7WvATVlG5erUW11wfN1S?=
 =?us-ascii?Q?dNn/ICT75sTwvwfpBx7Sh8Owb3mEmjEXcrFmO3GE4fBugs6+Yhhk8Zyo3kS9?=
 =?us-ascii?Q?wipQMMny/KpgMYDr0rEVI0OG1wkEZ/96FXdRUBR7e5uITRAyyUD5KETbmTLG?=
 =?us-ascii?Q?Vceh98jBgF4kE+Yhbc1aSA487w4xdUzhnBNzgE/bPO7ozd26UzeXMJnsBVF7?=
 =?us-ascii?Q?YSHhenUYkIDInuFR3w54yv5fUGEMrWAmvd6hqNM5+xkjS39AaQjdQ6y76CdR?=
 =?us-ascii?Q?ALE1xwWZFNJSs+8Qi4vhna2PIkPB44zjbeiBe7qzXNtEFNs/PGAeNYVJ927l?=
 =?us-ascii?Q?MhCpMTMRBDJn4Mj/mMYn7C1QfEoW11WvpeuKSBL+KBViy+jkYk0RGu3yBY+f?=
 =?us-ascii?Q?QsO7TNdELlxpJgxOE1AYfL6nQpxrk8AN1fCkfBGT6/CXDJllX6ymbK1Q9UGJ?=
 =?us-ascii?Q?90Mt5ZNbkqFmQt9mJnWOF/umtkvPScsw9+B9ppJX5vZJF/aTnRjLcCCoXMrV?=
 =?us-ascii?Q?U5xBp0PvPGLHMH+HCPWLxDFS+sJhIYoow0nNW6b9n7jaO+Fjbo9eHiddgjz/?=
 =?us-ascii?Q?MeJpTLo54i8Q8bZZmWN8FzGEKTILMcbZywqVaOXmOOcGerh6+HJHArDJWf/T?=
 =?us-ascii?Q?x73EETgy2ZrsjQmAaZkbC65inmSDE+hgmHrLSvCUH2hz+Aed9vlSN6+Aie5e?=
 =?us-ascii?Q?dysiyuQYsUrqqGMsDdHmBlmjCLyPcH0Fl7Am/jXX/kk0KNSCr8/nnNYW4En/?=
 =?us-ascii?Q?cHxMe1LCTB9ozpDixdw6oAoNtX/iixrJCEYGXUM3QE194jQm/3YK0Syq11b8?=
 =?us-ascii?Q?dg0mtO+0Z91XtN8JdtVaw08sGESZJU54Id4mvJCh/ulWDJDfC6CBeK3gSAv4?=
 =?us-ascii?Q?PE1SZs6HW+U5CV1SkHS+n68GDrbc6or6Wl+bwq5SuIZHFOoHM7DNSuzLwCQt?=
 =?us-ascii?Q?zcV8PRxcucj03v1LWkVtGGiL7Ol96ctmvfboIKyaS2oq2nk0Fu/eJrLlhukv?=
 =?us-ascii?Q?bp2h/Q02C8w6IUhnlRv00OVuiS/Xx+pgdsJi5JqTVFsG2K6Hgq1bFtWs8t8X?=
 =?us-ascii?Q?p9GlPjHVmT/W3N5g6YnoZEOn5mL1J1WXTju5Us34bjq6nyZRlF3+B1W99t1o?=
 =?us-ascii?Q?URXNSApe29p9PsZdyrd3QZC7oV5lhOzZ5she4SmTjXD/0kLeBpVk6DkSnE1C?=
 =?us-ascii?Q?P3xYpbdVp37AVoRSTTgiAg3anAQNAugmioG1V8PBMjUTNLMx5ADsa2bXUm1+?=
 =?us-ascii?Q?+92xamVxDJHtdudDA/sFEZTDTnAyN31AmrZlSsQgXr4QeD3rXdzpSXr2J3hS?=
 =?us-ascii?Q?jOV6B1Q8ak2pg7o+bxDJHYzoKmm0QT8k7j/9d7xseD1tit/Q9FwHzSTJ4OoY?=
 =?us-ascii?Q?45i1HO6Tr8VNpsIYt1q6SOq6mg4roHok1dWwBR2MadoJf3iorOvEdk8Kopfw?=
 =?us-ascii?Q?jToVgrRWJOMeDuxZNKXWhsr4xli3Dm2NLnYCjEITiDm6o7LqjvTofjZzTQ6m?=
 =?us-ascii?Q?3fag9qEqbChOtYpQXBo9MCNpsKVv3y9Ae6I2SxMntXReBt3L7df2qClx4O/N?=
 =?us-ascii?Q?m83Qu1kJfEfrbmMDKOvppor6goEH98Tst6lcOtdGxxrqMwkPv842zAJgy1nN?=
 =?us-ascii?Q?QK//6dzYUQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: amBNsadUluEveCDw/YhGaZA8MeRZ+u3nLy/sLWs285oxHh9elP6miGOi+oHSJcayLgI+4BoJHmwwHKo3Dc3gNgUKjg3/WhZGLqQgvqNNBYM9D4FOKGZ/8C0UDu69fOWXAztLi/g49RcqizO7YOjumzlcjrUMsUlGMg0oUqU2RULpte/lsZA/NyhU0BjWyntswAhCgMkcRWFDERQAyLk8fhpWkogMc8bWsOKlrDlgB5BBZb2u6vH/NZ/2fqnpLntFRidY3NY+7IeY59JryD1zuwe3GR2nry187V5fccjErJOmclvz1YUdN+fgzi7kILTQPvbSx9qPmxYn78a1ePQU1w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fba8486-2efa-4181-2822-08df34a143be
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:12:14.3957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tlvs81jFRJ0p5FTSHp3Qlc6yyuqAbrBC+5MtHjLktj1QYLdq4UcTlrRMp4ldwbxoOx5MGVDQ6dEveeVxdEc4tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
X-OriginatorOrg: intel.com

On Tue, Oct 27, 2026 at 09:21:56AM -0700, Reinette Chatre wrote:
> Hi Chenyu,
>

[ ... ]

> >>> Although the occupancy counters can now be read from any CPU via
> >>> MMIO, keep the per-domain limbo handler. A global handler would
> >>> still have to iterate over every domain and would save nr_domains - 1
> >>
> >> Please write what "nr_domains - 1" means in English since as it is written
> >> it is not clear how this "does not justify maintaining two limbo handler
> >> models."
> >>
> > 
> > OK, I'll rephrase it to a simpler version, how about this:
> > 
> > Although the occupancy counters can now be read from any CPU via MMIO,
> > keep the per domain limbo handler. A single global handler would still
> > have to check the limbo RMIDs of every L3 domain, so it would do the same
> > amount of work. The only saving would be running one limbo worker instead
> > of one per L3 domain, which does not justify maintaining two limbo handler
> > models.
> 
> ok. One nit, please let it start with "Keep the per domain limbo handler ...".
>

OK, will do.

thanks,
Chenyu
