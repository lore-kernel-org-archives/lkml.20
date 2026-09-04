Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0071551FCDF;
	Fri,  4 Sep 2026 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788556521; cv=fail; b=DMD19bsYeW0YLVkyuXrNBJWHfkcY+o544Gn2BG5i5TOkNxpVaA2Ng5gcszhmJlRBk1flTeuqF9uZsbN36o/4L3xFDKQp3yBauyXJHCbweGM0h8rAEiaR3awYXT8k276wEhv+Ef5yQY7zBLRAodTx+HtLMec9lGqrO/LD4VG/rAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788556521; c=relaxed/simple;
	bh=lXZZs5ZeGRlxA6eRl+q4bRJ/69Wnz9naCsXKKDTXWjY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=otvv8XrR0XNT+8NpWoG5IB1Tcegsf5S4nJL4B0f4e9itgSPbrN82RQJEw0Fbljkoy2hRS1RBh5H47CziAj8fQ3ger2F/80s0SVydkqSVsCgawUFVq19i2hZPY3z4uTjQMTVIb16Nu1lOgN+t5ZM19wG0pxBg9ZgcBwUkGt3vPv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CviEJj6T; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CviEJj6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788556517; x=1820092517;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lXZZs5ZeGRlxA6eRl+q4bRJ/69Wnz9naCsXKKDTXWjY=;
  b=CviEJj6TU/UfuRSUAzetBTWstCVgqEi2QcfeUB4blP5vTF2mZzDqMpLm
   3DcLHzKShwmwzbRn9LdHbkB+/vut7L7VB/o0QySN/dtXluFJcb8YOEGDC
   QlkPz3OrabS2O92OPc+TA9ADP1EQZ9I6zlc11epbM8P1PqbRNfq/TTE2F
   95epWjS91Jwu8JJ8SO3hAPDFzCJmZ8uNS5n0TPv3UwiIwQBztL2oYVmaC
   x/CLvONCH4D5rXD0kUxztETSq6Q9s/ndNWBTpUB6mVQUfo/QKSW/kDnFa
   QbvlG554B6qH0QoH/jM/XhxKnvoP/sb4HOIx4l0FTzLLxwp7VwFJdXm12
   A==;
X-CSE-ConnectionGUID: KBIcPsjWSAuOFr+uCx4GWA==
X-CSE-MsgGUID: m4EkxflvSqu0tZGmM0FO3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="106432128"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="106432128"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 14:15:15 -0700
X-CSE-ConnectionGUID: Mt5uXX8pSHiTIDzbzRodSg==
X-CSE-MsgGUID: UMAjMoIdRYmVT7wnL9mrwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="274298298"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 14:15:15 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 14:15:15 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 4 Sep 2026 14:15:15 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 4 Sep 2026 14:15:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o9XNy+I8I6dG+TfuiEB6Q8aOnDFl3vU7oGIQQx7zQJmDfqeQ5hSUtFW98lNK+hXBBX9bQte8Afe4mCciFXG74MpjhnMzybPduJ0roEb1OmWxGHFzUy9yxdG9gn6alpZmrhhkLUlqptpxHKjF0ka7jHh8LMa4qksdE79yukWX1o1Gtn+ve31JxCHUiUSDlBq24xPs/5AXUY2Y7Tii03Rg6KATh3R98wyH/FYcpOUOShEJwbxc5ommF2FVBmc6b40rJfjrrFcFhgUWeYNcgplPNn9FAm5teSGLtT6Fu5fk0bGNr+rstPm7NKHn020c3ywszJBz4KO10S1kz2H2gtT8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/81pgVSmuJvZPY+5TIamQOQK5uPTUJRvWZY5HtbvVD8=;
 b=gehoaF07lOs4jkzusr8xdVzon+bJJwi/j6ue7QpTNffCQ8Awxp2Tigh1h39CLyk4TNn5OTgZwRUYaR+ep3rGQ09AzTPr/6MsrbJjYnutQf+IHJrqVTqbwTmILJLI0SX4RvTRAdaR3yMxBlho2PK58TxsAvCAPYcaiyNX3cHWdHBfiF5wzZwnCPPQvDPq+xX2Bsr9CCDI3Gam8JK7IBO1G+njv1CJnpUeOTHEbnO/+52MNUXcVXqOmHijswFDr8E0Rr1XAwqDFQyIZtMUFVHLc/8UlkGwpODFLFYbqCkqSmkYHQL3/RXfTn59D4Rkx9XyqZqDLeQ+nGliZpQ4NP0txw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH3PR11MB8139.namprd11.prod.outlook.com (2603:10b6:610:157::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 21:15:11 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 21:15:11 +0000
Message-ID: <35ebb8d4-2ef0-4bc0-ac3f-afff0c95ae89@intel.com>
Date: Fri, 4 Sep 2026 14:15:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
To: Borislav Petkov <bp@alien8.de>
CC: Ben Horgan <ben.horgan@arm.com>, <x86@kernel.org>, <james.morse@arm.com>,
	<fenghuay@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<corbet@lwn.net>, <linux-doc@vger.kernel.org>, <dave.martin@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
 <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CH3PR11MB8139:EE_
X-MS-Office365-Filtering-Correlation-Id: b01f84a7-6e42-493e-dfa7-08df0ac99ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|4143699003|10067099003|11063799006|22082099003|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: bxd6o2xpKyhwGL2nsWNiAPvfDfJE7Lu6r02STuj4paFgR0bPmJG++kUl1D7vX99XnGOVNg5uQ7RwGtPFk/W8kWkZlCDRsHTybi5iHj9IzUEJLxZd3pBBFD47/z8FxhZFJvV225I1OPfHtV3nPS1ZM+e2O4g9Bixsc1SZdhUvkDJtSIBXVYjpmXGp2WygigmwxFYJaYESKOFKDc7c4oSbmz7PdT1eTtai1h9BdK96E5x3+Ns5WSgkD9XaRqA+sVvb3LeWlv6mZo8CMMa3XNHc2FMl3NAGSDZVOFpkwvG/S94JwypfCKtIS04BLnHBqEqSAQq1/lgqoV+QADp4uRI6x2SRCC1Qqe18HHgiXVt+vDn/4l43Cqa4cKFoGLHemp+bbqDRxcazVqUAZJ4Lma7om2MDsjrL7v+svz6j4+upYO4oSQnw/mMqQY+pMlCuSRzUrawSWCgXNkWFwUYQs3XgnXupUriIZUFM1ltWgytINVZlr15h6FzYDzuNr2DtlVfhwmU6YKkFtnVZiXNs37K9919CWb460MmFYKsd8fLmVaVLOgkUWvNT7MGBfQIZJBeH9Twip2RZK7DvHmH9cHyW/yuTzQu05PXmTo5n/4TLlgA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVVJRU56UGdYK2ZMbW0zaGxNeWR1dy9GcFMra0xZTmNzOHl0SFNyOXBmUXV6?=
 =?utf-8?B?NDhRRGJRUXYzaGdoemxpOUZieG9FNTMwWjM5RXNlMHIrN1RiNElrbUluL29h?=
 =?utf-8?B?MlVMaXd2UEt1RUw5djhXcDd1MHpFMkthRXJKS255UFB5WkNJS0t4Z1BrR1Bw?=
 =?utf-8?B?ZjNZRy9GV0lObVgxcEUrUTRCbEJZekIwOGdFRjd6QU9ML01vckQ3YWgxMnBL?=
 =?utf-8?B?MEhYY1lqK2cwOERaWHFzeXNRS3hTd1NxSktRelJnaVJzRXdEK2FXbG1tZVFW?=
 =?utf-8?B?TW5wMXpVa2wvVW5ia2FrY01wbU5YU3BRMzVkT0xEOXBSL201dDNJS2NPTEwy?=
 =?utf-8?B?SUZENThWRHNPKzE0RW9lRTFSOVdOVXlFeFh2Y0dacUJ6aU00MGtBeU1vRDQx?=
 =?utf-8?B?bUpkTTdpdk5mOUUxY3FaV3BvQjNRMkdJaG9YZVd3VGVXamVQWm5Gd0F5SWRy?=
 =?utf-8?B?RnA4WElMcjczTWk4RWdWMEpQNzBsdmlROVVxcGpsbEFqdG5VaWVpTjhyUmxB?=
 =?utf-8?B?dTl3TVVHQ3RtYU1DYWFWWTZQTGhmNTVaeDk5cWhvWVhSaWVDY2hQVHpWMitO?=
 =?utf-8?B?UnRXUlZTanZ5RXdPMzJ2Y1ZZei9KSWc3cGtDaGQ2ZHF6clMvT3FSM3M3QVR1?=
 =?utf-8?B?Sml2SUhRMWJ1MnVwTFFPYXVWN3l3ZktVc2hORHp2YmhLTnVaV2xRMGRxTzZ4?=
 =?utf-8?B?Z0g1eUorNlJOazBjaEx6ejVsZjdBRzNDWXFxbHVsTkNYZy9YY2RsZmY0dnJF?=
 =?utf-8?B?eTBTWWJjbDlyaGJiazY3cjBqeHl2ZGpOU0EwQ0kvSUV6Y1RpY2o3ejFqZ0tX?=
 =?utf-8?B?TUpyMVFIUDNJSUJTczZCUFoyTG5wd296bCtjYmRtOGNlaTA1K1daZmpEemRt?=
 =?utf-8?B?UEowWjhvSy9SbGFqOHpyam9vbXNFeXZMUWJCZVNOdlViTGYydTc1K1ovd2J3?=
 =?utf-8?B?Z1RMWnNaVStQQlVhRGNiamtRL2dwTXlJaUFaWHlERTJ1c3lRMS9ScC93V3o2?=
 =?utf-8?B?NG9QOS9sbWZVZng2a1J1V1dCYzlVdDdQS285WllENjdVOURxWkR2cm5sVmFo?=
 =?utf-8?B?dkVPYS9lMmlnNEIwOUZxTmdBTmVORFExVW90RDRmL05tWlBWb2NQMDl0T2ND?=
 =?utf-8?B?czJWODBkb2RTTHkwMHQ3OFllTUNaTk9tQmNRNVBwY1RTYklqaUs0TmR4MEw2?=
 =?utf-8?B?QTRWNTAzL0hIUzRFcWpEM1FTS2x3OWQxdERtSWpBd3JRRjlJRjUvWE0zektW?=
 =?utf-8?B?ZkxVNmgvWWpZa0o0Mk1zZVZaZ1M4d0tGU0F5RFhZeUdYVEhxUDJ4dFZMSzFv?=
 =?utf-8?B?KzFONXpURGdDTTI4NWZweDBidHFVdEl2blJ0NndBZ2dpd0U1NnNQTzlxV0Zn?=
 =?utf-8?B?bm9wWTVOWEFCSjVybTRyYnM3RWM2c1FnVnV2UXpHRTFGWnVydnJCMCt6Mkdq?=
 =?utf-8?B?WHJwUWdPNWdIbWZISENNMlhjaGVwejZXZkpzTnZhelVBOGl3cUZrSVJ1VGJP?=
 =?utf-8?B?bWVOVlNSUEpjNjVGcEhnNktJS0FIczVFS3BpejVRR1JqSHpLRlczcCs5dXky?=
 =?utf-8?B?QXpxZFloODFhbUtWYlNwNk4vTFhMK1lCKzRQZUxHQzdkMUxLdENLcE83VXFr?=
 =?utf-8?B?VXFqSUdPRmpqSnp2aW9ZV2wzM29oVXlDc0I4VTAxRDVneXBMU2NWZnFIQ2hh?=
 =?utf-8?B?d0Y3RHZNYlNsTVNSREVxbGF6dVdablNKVGtqRmZUS25rOWtvWHVyRzBIL3ZG?=
 =?utf-8?B?MjRUaGFtNElSVDMwcDFxZmVyelU5ZHAvQ0VuNjREUUtUMDFMY3p1SEd5Ui9O?=
 =?utf-8?B?UXR0TDRGWjZMeUcwclkxUDdZVERheHAzUndBbkpKUklSNGkzbWNGdm04L2VT?=
 =?utf-8?B?anJXQlR6R2w5YTBuM285SWJjRDRWS1Aweml0Uk85NXJMZ3BObzhkTTRTNkd5?=
 =?utf-8?B?U2RUMlVNQkkrUjFsUWFISzM5eCtiVUpTU01vdjN2UzRqbUIyOUo4eVN4M2dX?=
 =?utf-8?B?RHBoSjhqc3cxMDZLY0FDRmRML3B2VUg3TXozZWsxMmtpRHdJSHo2N3VoSlVL?=
 =?utf-8?B?T2VaUjVmdFdyQTI4a0N4U0x5U2hKdEFLbVVrZGV2UnY2VERCWDhrc0VndGhi?=
 =?utf-8?B?Z2o1NUtNZ2JtYnVFdmM0N1VXREF4Rm5zVjhjaUdLVUxRSWRUNVlNcW1hVmFl?=
 =?utf-8?B?UUFXWEU3MHV0Zm05cXFURnlxUldqZEVGZXNaQzhoRlhVS2V3eGNhNjdaMGJR?=
 =?utf-8?B?MTBYRS9aMWpOL2NKTmloMWlJbUMyam1oeURWQWltVnBDR3VUMTVuRWFXSzFJ?=
 =?utf-8?B?YTBCRUR3S2h2a2FPMHBLMCs4T3lHd1F0STNFb1NJalVmYkJVK2h0Ty9sMUR1?=
 =?utf-8?Q?fiXVul1cRZhgz9oI=3D?=
X-Exchange-RoutingPolicyChecked: vV2hzdSyUxt0kUo8KwxFMG1vmsvHduqwds6ZhmaYBRPevSh8DmSSBzyJmWntNtk6zYxnLmkSJ+wG8kUO5szM/I21+xAbDdwJmc+jQC1D0m+ANtXc8jyd3ruRJCxFGaX6lwk4FoTJJfY9p8f/nq4q001yGNNIcRxG/TQh5uiLGdIIxXkFQECJPOTetj+VQZj4cytryw29C6VpJmXmCukWsoo9rVl0z4MIh7Mhwxq9vRLOiTc5MVgNuf0Xe74kwFHePakHzOIRSTISY2YJUmdH0IW7AaZuE+lPtGYG3VcGBPrcxPhhJP85eT72WAaURFsvjmFt3Y9RXzSP14nF2UCknQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: b01f84a7-6e42-493e-dfa7-08df0ac99ae6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 21:15:11.6359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ob8rSXnC5B3Ak4vZsUz9EiWjcqgbbaO3iEo+BPUX8ZfLbX9nnb7V3o+oRfpEzoVY1C8SgmyUfY7IF3fRVeD5heT334lNTdm7GZzGT7IjAgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8139
X-OriginatorOrg: intel.com

Hi Boris,

On 9/4/26 10:36 AM, Borislav Petkov wrote:
> On Thu, Sep 03, 2026 at 08:37:51PM -0700, Borislav Petkov wrote:
>> Lemme have a look.
> 
> Sashiko has comments:
> 
> https://sashiko.dev/#/patchset/20260709093111.367851-1-ben.horgan%40arm.com
> 
> Please address them: if valid, fix them, if not, explain why they don't need
> to be fixed.
Sashiko has two comments. I'll defer to Ben on the first comment.

Sashiko's second comment is about resctrl's existing (not introduced by this patch)
Intel specific enumeration being resilient against a hypervisor misconfiguration.
Thus far resctrl assumed the enumeration would return what the actual hardware
is known to support.

Sashiko had similar "hypervisor misconfiguration" comments in response to another
resctrl series that already falls under the "cleanup" umbrella. It is not clear to
me how far resctrl needs to go to be resilient against hypervisor misconfiguration
but I can include needed validation addressing this report as part of [1]. 

Reinette

[1] https://sashiko.dev/#/patchset/cover.1788452481.git.reinette.chatre%40intel.com
