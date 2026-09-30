Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F0C5187EA
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790789047; cv=fail; b=mNfLliWZkeij/3x9CCDIKveq/SWxFVmupZonHrXiVyFUZfDNTPqYJv6GjsG7Im96eE8IZ2JEUqIewNyjK2oFNCgo4dobDOlfZfNdGUyRtWRHDzLULfFQ++a6xe5XqMIRgk88pWXWKBIvptogE17rLycRl4C9cVUlyNlLuqlJlJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790789047; c=relaxed/simple;
	bh=xscfPdJzwbmn/6sROcOUvLswePuHf4uPYUtbDToQdMk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LHJhuC7EdLhLnG/cQ/8EzoqqJ0Kh7nRlmo8HBgeHWcQyaDUOqzcBzRPmRNeyQemIAwgsGS2ol6lm4t2Kv+Ca0bR+vXX9CbIiC27kXs0ijxEDGO0+NHupzUHIQq3F4WbCjkfwbU24MupoACx5sfMa4VHDkPO/OaiswOHrRQUMu3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tw9giKrO; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tw9giKrO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790789046; x=1822325046;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xscfPdJzwbmn/6sROcOUvLswePuHf4uPYUtbDToQdMk=;
  b=Tw9giKrOfPozRFlcx7IOBm85OpbrMi+ght5bHP7KP6rrCjILgPsXcmiB
   8PGQJFJJP+7mgdTVy/3cAoNRw20+Sg2RFCCQO/F4gJxBU3M3rERer5/2S
   o1ef+C6ofS8kRQGm7yoG1khi84MYyV5T/xIbJkpqYQrhDg+IcGxIkVXbd
   /ahQXjFwjQaq4pfTwrayOemIvhBjRlWsywgIL1HebZhPKsOdCP/40OOTT
   qbSeBvy6COiFmrcV/nbT0/BosaflrAzoJIiuaD1T7ZjTeq4/WYeoy+1A5
   Vdpb56/S9y0vMjVYPBiBYgkJBANbZq17biBhLhDpZ0FWZzmtRoVlaJBCY
   g==;
X-CSE-ConnectionGUID: ge7qqem3TNaa0tYhAQwFwg==
X-CSE-MsgGUID: /V4oinUZTFCDmNHHN9/veA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117060068"
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="117060068"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:24:04 -0700
X-CSE-ConnectionGUID: AaFvEX0SRe+zWXbPVw74LQ==
X-CSE-MsgGUID: oqwYoOGhTY6GGP1uhaPsEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,133,1787036400"; 
   d="scan'208";a="305241660"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 10:24:05 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 10:24:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 10:24:03 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 10:24:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ec2Qko8DVXSpRFQIgAlChovy8vgBUAlrg7lXSf+vZlvBz3N7DctO+0GunNSnfY1zH0tMMXaAK2t7CxHipkx1mClWYMTq8tEwlceL2OALBGhrpOidefbeOYEGyDB9pf5N0P3BftbdJGevQOsCFgFND6Mj+XHCspuqOyW9BCrteqXdMM8VxaBPlsg2KPYXJSEvtm5SvS+kkYLeiNiZcwIcD6Jd7nOw3HKMvrwmxYdJtghqaLBNj2an9rfNouMriLqA7JzrZHKEQVpfZVtHLQDHDdQbFdbk0kXVLH91qwkBQKjKSUlvvP/Ly1pj3fzI+oxl5MUMduN02/oCliijJvyIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfsDbRgMmEQ6zNdpjst0Bmk88umSpwAWKWCMyHgTjyA=;
 b=j/fmp0imIcA/NAIMK2TLSciZeZeG8he6KWswfbjYGsqGKyiuvhX2CMpeN1cW4MKm235eYauZ6GSYm8P6LurGv38bBEqJ0P/pnQDfPzWANb7i8AbJvdPEw0/Gb1swTCjqeSfbRmqQPmtPoRZNM/BK+5HDejEiNxHpBpzmBX9Mq+H9n1+K7HI5iqfe94Xxdptvdh4mAJ1FEc5asiXJ6NaFWWAkJec1WGPJjPYNVqEgQQSnn2JLoP2LMJnyeCSVi7nwSiAz9mspbDgR7kEg0akq5l/ayaL3faIrCUBSfQ9Ipprg9MZHl3pmtWCj7hgF2X76xhUla6zz6XJWUyk5XEUakw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 17:23:55 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 17:23:55 +0000
Message-ID: <1f27dd5d-eb95-4eae-bbe0-f57ec6210a95@intel.com>
Date: Wed, 30 Sep 2026 10:23:52 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/resctrl: Rename AMD resctrl MSR defines to use
 MSR_AMD_ prefix
To: Babu Moger <babu.moger@amd.com>, <bp@alien8.de>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <dapeng1.mi@linux.intel.com>, <peterz@infradead.org>,
	<thomas.lendacky@amd.com>, <chang.seok.bae@intel.com>, <jmattson@google.com>,
	<kim.phillips@amd.com>, <prathyushi.nangia@amd.com>, <acme@redhat.com>,
	<nik.borisov@suse.com>, <namhyung@kernel.org>, <linux-kernel@vger.kernel.org>
References: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <9ef5ec08d79c9c84f36b11251bd3189af1a38d52.1790721445.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0198.namprd04.prod.outlook.com
 (2603:10b6:303:86::23) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4626:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a2d0968-1ec9-4a03-3454-08df1f179abc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|366016|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: dx5jsvxfgr2bHR8/L+ZWGOmMPwUhpCmntNbGpGRkKbE1ghJYhnfF5kKVgIK+BYD7+GRb1374wlZTduFWoXjARH0G5y9IwJTT1R6eVtAlF7L6DSY2PCI4fYwKd1SBBBb/2dARuqXFrOYStACxIru2hQf+ds6GeuaZ6vQQgACjq0+ax71/FCXji2uuc5t1Og6OnsqXeURZYoc6k8WlZPBwb/h0ummMDZm2rPIGk3xCciI/FimTpvTJ0SyDqBFBjUPr80KGPP1yoP7vq8Lg4vwRtg7MwM8OKk71oNPg5+etC5ZJzKAFYymTPCZRzEPkcu3p4/dRlVCsDK16CMpIGTVKBbnbFww55Ah386aC7PNNsfDSFf7sGAAsomo9Wm18yJOJw2xLcDjElPaiJJTLFmietRsSPD9e0yRrs270MAHn44pFlZryV9TqglyUnknSmcSoDYrlwwPZmvy0L48zs9n9PiT+qSLHDgNLWgtfVgIZcqbHx6cZtUMTr29hyd8/DD4rtdTml87SW2oDjXofDrVukyMKbhBIyH/H6MPYJ3FVWhQpaxlXkWk93ftkuymyFn8Ed5voICjZaVTuWKad6Nez+6i4nrKuEHOC3536Q+LYbyuzujfwMB4JEo9MCb9vqPYuh54YrGnWQGvkDJpyaHk8jfbtLJNQuzQYONP+GrcwQtU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(366016)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDJscWtvME5XaktWSmhQVlU1NG1nM2MxQkZ4d2oyL0NWR0h2UFdld3kzOFZk?=
 =?utf-8?B?OTBlOU1xQWRmbmxEckNGSWVDQTA1cWt2TDhiMkVXajhxbUlORkkwUzhldGVW?=
 =?utf-8?B?V3M1ajRacmJHSEJDYjB0c2RTNHp5a3NhMjVTN2VEMXc4SUNuQzgzejFTQnI2?=
 =?utf-8?B?RU1lYlNrSjNYcmNDZk5SUWVTcXZzMk9RSitnTk5JU0RqTk1vVHlJblpwWkxp?=
 =?utf-8?B?Uk9maXVjQmk5cDV1RWdmcFM4OUhqU1NPbndoZDhmRlNSZE4vR05Fakk2K1oy?=
 =?utf-8?B?V3ZVN0NGeDBVK1YySjBpUmZCdmUwY09leUhIdnh0dDczQi80bHUzMUpmellF?=
 =?utf-8?B?d0xDZEtZaXZZSk1Bb2NYdHdybFpNTXZBQnovdExrTTh1MzY1RlRJcUxvTUpu?=
 =?utf-8?B?cjAyZDA0NWdKdWwycGVVS1JpSWNDc2pRR0FLYjNXSFd1RWgzNEIvNVlRZWth?=
 =?utf-8?B?UE54UmZRd1RCS0dCT0tkVkhyY2J4QjJHbXZyR1ZlN0l0ajJiclV1Q01wSTlM?=
 =?utf-8?B?OHJkWTFlS1lWVDB0STBrdFFaMmRIV3M1NEV2RTcwMXRTcEtGV2Y3VjBZektK?=
 =?utf-8?B?Q3lMQ1UvUmgvekM4V2tqMmYzdEVXOVVTcko2QklWbkVKTHhLRUpaVW5WUVRq?=
 =?utf-8?B?YkRPa1pRSWhUdnlkRlVGNGZ0dWZXeTBLVmVxUk5HTW0zYUp3NjI5N3Nhb3Ar?=
 =?utf-8?B?aTczaG10UWVrQlBVRzBmbFBqblNBWmY4ZGltZ3hDYjlJREhQSjdYQ1BzQjhz?=
 =?utf-8?B?Vnk3a3gxaFNMTmM4K2c3LzczMHFLWVRkc0VoOGtiL21KT0hZclZGVktwb0N3?=
 =?utf-8?B?cUIwMkRPODFHMDZsOHhMSFRrSENlU1JaL2NpMGQ5ZWtiRUlhNWNxbnlrU2pZ?=
 =?utf-8?B?VkNPcjlveHhpOUZiZWRZeEMydURSNnFSb0dEb204N0JpL3hNYjljVWExbWQ5?=
 =?utf-8?B?NlhMMmZaa1BQQ2RiaWxqcUh2a3U2aSsweHVqcEVQRHcyY0dpQ2pBNEVpZFN2?=
 =?utf-8?B?OE1adUIzWElwUUdURVRNaHUvaUorS0RIZytSenk3OWZENXlBYnlyMUpIUlJj?=
 =?utf-8?B?WTBxdnU3TmRjZzZaUW14TUlDenA4ZDR1QlhzczBUVVMvcVdPa1lzaThsWHE2?=
 =?utf-8?B?Q3lPeVJpa0I0T0dNeDMvKzhCbDFMUEhHQkFHdThpdTlrWm1GSVVMQnNveGdY?=
 =?utf-8?B?L3pTKzhDUmlnbExZYysrbSs2aFlHQTJWa1pIS3dnQnEwWmU2VUZCaXRPY2VX?=
 =?utf-8?B?bDJUaE4zL3ZubjZGUGtqbnBoK1BzZzBpZUxLNm9mUzU5YVA0Q0VYMllxWUNN?=
 =?utf-8?B?WS90Y1hrSElWaG10WFZ6Q3lmOEVLQmpWSTJmYSswdlZiKzFVRXhBdUpzMXNQ?=
 =?utf-8?B?blJ2Z0tUdkRzdjlUb1FlTCtYMmVoMitkRGlNWm5OZldiUTZDdjF1MldIaFJC?=
 =?utf-8?B?Z0c3RUQvUmVtMXc5ZWYrTjBXdFgzR0xKUWcvU3Z5RENYaitYZmtqcHlBRUlN?=
 =?utf-8?B?UzljSm5TL2dyTmViUTB4aEozYldQcG5OeGFZM3JNTkRtaTNzU0w4cTIwbGJV?=
 =?utf-8?B?MmhhYmF5K2ZQN3BxeVF3dmVOK0pWeEt4Z3IrQlN1dGkybGtKS2VWaXNpbEhp?=
 =?utf-8?B?N0NBYXdCbHRCRkJ5RkFGZ2hMTEI3cWxTeEdDL1ZoYWhtZ25Scm52NFlMbWkv?=
 =?utf-8?B?cG5aS2V3Y01TS0tUSVQ4V0tZREZVWnZoMEYxdWQ4czRGYVY0Y3hGY1N4MWU4?=
 =?utf-8?B?WVM1TWdXUjF1ZDVubnRTUFluVDZScExrRy83TnQwWHRzc01RZDNoZGRRbFND?=
 =?utf-8?B?Nyt6Z2JNd1pYcm5IVU5mN0JuMnFidEJ5UVlYOTVZZ1o0QkE2THN2Q1gzOUhW?=
 =?utf-8?B?RVZNMnNlNXZXczMxaUxkVWN2TEZxSTZtbzQ5NXgyaUxsb2VsSk1qY0ZSNksr?=
 =?utf-8?B?TWE0Tnpyem1ZbXdrSUlzdW9kWjB2c3VLS2tORy9MRmpRaWtLeXRwcUdRcWd4?=
 =?utf-8?B?cDhncFNPUzlHYnJtYURwNjYreVEyU1daNVowZXhrRFQ4ZitBK29jYk9zT084?=
 =?utf-8?B?bkZyV2l5cVRSWlR2c293aWpTQmtTc2dIbE94cGRtQ1EwSm93QjBpUXhnc0c2?=
 =?utf-8?B?L2k1aVRHaWdIcmxIeGF3WGhlNGlFTk1ONWhhWktJc1ZqRXNhdXZaNXZvLzFo?=
 =?utf-8?B?Ui9hKzExcnFvckdlUnlpbkVkbmtzaWFMdXdaNHRFcU9UaVduS1BSS1V5OWtF?=
 =?utf-8?B?M0JZVm03bVpPbnEwclFOMXFXazJvNktRdWVwMWdTamJacFJyeGFVRG04azVj?=
 =?utf-8?B?dzEyZm03eGxIeVNKSW1kWmgvWEpieUplYUZhQS9qL25YMXp0R2ZVQmltZmRq?=
 =?utf-8?Q?7Tc3H3U85kv1kcz8=3D?=
X-Exchange-RoutingPolicyChecked: 0eNlbR/d2Ar+jwncgMv3wq44kMCMhJiH9jctLkKxHelLmzc5eNV+1ZmDpaB7oJIuvFfL1qTy9qwPTSRiGJGMc4No8gQRdWYcs00CH35D+pz3kaSlOAyz15fuPwutCdP+k3oGitpKBr1drhpn2MDYkFlr4+CwkyeeJImZ8OaAfiLIChVVPherIp4YGYWhux2NZidBrg889Dk/x1R7nKrjnZkeu7lHLVhOMrgWEGA5CPkS2b3/FNm0w8qWCClhAqQWU7I0J6WmLnZB/tJyuj/AYbpqFS1icPRBu05ZT9XrzffSgBaTCP4aCvaK1DNMkrR543bLxkFnsJ4v7zoYbyHi9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a2d0968-1ec9-4a03-3454-08df1f179abc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 17:23:55.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lJjs1dLvpBjAGBw7HZzWmiMZkssKHLi+Dg5MI3bW7s8O6HLujd4G876MyTJP4rCqJSTI/U1PqjBxlwy44eeCVzZ6Zql5dyW+SMmeQsvas8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
X-OriginatorOrg: intel.com

Hi Babu,

On 9/29/26 3:39 PM, Babu Moger wrote:
> ---
>  arch/x86/include/asm/msr-index.h          | 10 +++++-----
>  arch/x86/kernel/cpu/resctrl/core.c        |  4 ++--
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 +++---
>  arch/x86/kernel/cpu/resctrl/internal.h    |  6 +++---
>  arch/x86/kernel/cpu/resctrl/monitor.c     |  8 ++++----
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  4 ++--
>  fs/resctrl/rdtgroup.c                     |  4 ++--

nit: subject prefix is missing the update to filesystem code:
	x86,fs/resctrl: Rename AMD resctrl MSR defines to use MSR_AMD_ prefix

sidenote (not a critique of this change since it just renames
existing things): we should aim to avoid using architecture
specific register names in resctrl filesystem code.

| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
