Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A21746D56A;
	Wed, 23 Sep 2026 08:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151562; cv=fail; b=eXBKW1wnaLP7VUonbDEMvZ8PFM9UDZ63VCvLXrddBvmukU3mrnNKuoFkKKVZNMDTQND6DXlTzg5DUKdEV6CYykVDWext1FrtaHBmDPM2YNRO86X5cq1ZCrowcQJbK938A/+IxbLAt6ehklNQrxuegvlMEZG5+nPgP2NWvyTfoJY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151562; c=relaxed/simple;
	bh=wKNCXhSWfyxv3UdEx1B+6eLfAJGlAkFzSj+4se1gbPI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e5Da+TnUb1wQH3A1JGBAKc9GQ169+ZPV9BbKD//1NeF8CvvHU0ohHzOfb+fHWzI1WuxwzCJLSJF5Vp+uerb7/iSW9Thf7L7W5N50F0PBUPqDugiA0cKNLJjeFE7RcbwoajkeXkL6Gyg1nFQb/uAT2n9mmaGUDfxEvotjvYQSZpE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mZD1nKY2; arc=fail smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mZD1nKY2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790151561; x=1821687561;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wKNCXhSWfyxv3UdEx1B+6eLfAJGlAkFzSj+4se1gbPI=;
  b=mZD1nKY2jR8OlPX1k1Dj6gxbLuVTTe99716QqC+ZoNn8YVetNhDJjxr2
   b0kNwpX+rmOxg5kTFDKPEwAxN1YootZnSNXLL42aReTTAoips/gaJZS4v
   aEUMNHAue/gLbfqQ6k58fKP8PaYhw6WVshY2XWMVV+TfnBKinYhm5WVfP
   Bu8eBVG4cwjKlT9Drd0f53wlB8I0ATP8jWLHB5D9kzv69ou9DybLw4FRM
   iEd/p4FN9/958hqiCVTkozfk6ZdQVunXQqJPBT+RpdM98p6cPdRX4/q4h
   DPuHo/V2HISWbqlXCKphTbr+nt3M+FINEtKn9TT1hwHwMkASCxdnXglfu
   Q==;
X-CSE-ConnectionGUID: Xie5PRCXQ/mxiRaDaQyJzA==
X-CSE-MsgGUID: yg9QTWWzTMy3ZtOHcELo8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1314406"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1314406"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:19:20 -0700
X-CSE-ConnectionGUID: 7bGRPp4rTEOlG82652uqCg==
X-CSE-MsgGUID: CtJeVvYgTMuCp7S3OUqkqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4577511"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:19:20 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:19:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 01:19:19 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.35)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:19:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+9RLbuKNXILcxVtTXHQp/8rBViV/aNEGLfZicTMggOiBSGUgGcT8hkot2UCc13Pa7s4a1eKrdjNLhg9J2rnTTTqVv23TMxWRkVdFAq+3JBazBnUgUQYBgJMTu7sS1nL5FYoBXeKM+qRjTsFbIPEcxnBs7GOEah2pfqyAFe3TxOsOjJgB8TeNfkOEeQL1o6wxsBaAYTJ9MI+esuddImOj7XzFJJIRbGisEDjZOmSKS4sTT2NF9dvqNyNq8BuqXk9nvsscGoweaNMMGHQ/41qxUCa1KazamUpAfcCOEAl2HKm+zSiVAEvYS9UbxL4EawtSrplxwhFOaqYGRLQgqWZYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqxlnU5XJxXQZb/gPTOFlNPeb1EW/TM++o0OD/nqzf4=;
 b=XRAMTABvqv+Ik3K1sjM7XzCkMEMJ+m0FdivLSkGFzzgXBDL69al/pgY+Pgs69fFzz518M6kdyM9tyDKTIeVjsIbYo7tbW2Y6L6OHcYi3FnOmVU3cJwqoHu+7iYmrIPeKLiiNIgTPn9E85wmSx4lr7xBajUP7rgZMxRJZOmUA5MCgrxLBIu7W3feT6Fa8oS0k6xNiDsiwdUCEr557CBg/RLk9apLp5mBQ+YOPx/ZymUOQfOXvltC6b3CZGplHmaNNkXrtjQRy8VVjX46fpjyR0613GhXqViUFJxd9G/2yv6uipDfDUXPwmo26VJzBxGEFhDDr5XSwLATVxdDP8mXscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DS4PPF900531A26.namprd11.prod.outlook.com (2603:10b6:f:fc02::3b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:19:12 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:19:12 +0000
Message-ID: <de53d800-3970-47c9-aaf3-9e85b352a15e@intel.com>
Date: Wed, 23 Sep 2026 10:19:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/21] ASoC: codecs: es8316: Move mclk acquisition to
 the i2c probe
To: Chancel Liu <chancel.liu@oss.nxp.com>
CC: Support Opensource <support.opensource@diasemi.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, "Oder
 Chiou" <oder_chiou@realtek.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
 <20260923061305.4041197-6-chancel.liu@oss.nxp.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260923061305.4041197-6-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B8A.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::63b) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DS4PPF900531A26:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c68008a-df05-49af-e6fb-08df194b593a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HGGICXZOyfDclHc0ii4Rb8NNNxt5NpFf8M7SiwdK2kRDFz0lxZYdRjrpcwUDMKHO2k1Szl7Z26ETXIkJwU2wyrT6DXnCN6ZJvHdl1YOxvouMUpSFt1Y2AB6xqyUcL3Fe3aTi2onkmveTxa2VWJ6AChXEtLlWG7CT66ePf7r0VqVr6AuQ3cI9xCsKAUXIJwvdSN5mglNv6BmpErvaE9YHscu84c37Xed72qZCmORpRVrSJdBmm3wc5pYX1Jg5Q+o79/tkDBLAJ9IjtNGe2r8A2rESy6n3WYabc5hFiib9disO0D5mcvhV/fkA3FMEyts+gMWS+2XkL/IkZYHhGOjxN4+YKPujo3V0m5Q4H6nErDTC917+8pdef0nhZGdf3dhMCzRkqd13/EFhJj72oCyNdSZ8CL4ev2on3e5dkp6/MAh1TOZJRkXixQUDjdQIEIEpEZLSpRW44Kz1h+Cz6W/3EcS055ZBbfgkM9RqmbQSsYNys2PxSIviiI87NJKH5OcYOkwCYXknMpsTgtZzRr69MWm18WgFbq0dZJQD1CZHdcCASOjBGFy3TrADfYBd91VeeBr88jiZ+V2vNnn5ziH3AgR44OWI+j2lUrPfr5Ft+RoXTKzVilm6mOlUCH3rDaRUY23nk9fQU70SpD0TDSBfWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aklIL1doeW5HZlZOeEJiT3VqUGpMWUJHMERSNHVpYSt3ak8remNrSmQxcVhD?=
 =?utf-8?B?R2QxS1JTU0prK21xOFJTYXBZNXkxS3ZDYWo0YkM5K2xCajU1MVo1dWFYQUNZ?=
 =?utf-8?B?dFUvRHozeXRGc1oyblRmKy9BMWNKMEZuZGJVWEZIL1RkNFhBbnZzZVh3UFdM?=
 =?utf-8?B?V2MyU2lGZ2ZSRmdkSFRTQ0V6Ym4vbTBWa0gzZ2FvTVN1bnlXM3RiMkN5a3NK?=
 =?utf-8?B?YmhHbHpPbXI1WmVtMXozemFIallVZkRlenlUNTNHcndUZWZXbzJKMWF6VjVX?=
 =?utf-8?B?Vm5QQ1diTUI4UXBycy9FQktjTnZyeWtYeGtMUDFCUk1JTnFBeno3T3FIY0ND?=
 =?utf-8?B?aS9lRU01cjdjdEhDZEhFbGsxMVU4YUpCeERsN2h2TmdSeUtLb3ZkZUZYMHFJ?=
 =?utf-8?B?UEJ4MG1qQU56UG9RdzcvU2FxZW80MmVnRGk2K0tEcnY1aTQwMllobytLUzAz?=
 =?utf-8?B?ZjJKTVg2MmhDM3JJajJna1FPUkNKSit1U2ZWRVhBU1pDTkwyWnJ1dVFrN1Bk?=
 =?utf-8?B?NVUyckMxd1N0enlsd0ZmQ0RDcGZwYTFCMXROWCtLSFZlN0xYNElHV2p1SkQv?=
 =?utf-8?B?bXBIUmFlNWdsZ3grVk1YNHlMZ2pjSGtCY0NEK0NMVTRkUkgrcS9QQ3ppZ0p3?=
 =?utf-8?B?TnR2akcyK3U5K2lucGY1NUNQZHNIMytBMkVBdnJ6dU9URnZTM3hsdmluQWhX?=
 =?utf-8?B?cENIN3RuNmI4VWN2QzMxRVAyR2NpV016S0J6em5XaXZaMkpzSXJlT1dQa1Jh?=
 =?utf-8?B?a0hvOVQ4czQzNnE4b3hYUFJlVkJNVzc3aEdsa0NHblZZYVE1UzZBMFkrS2Vk?=
 =?utf-8?B?Ty93eUpsWmRkenR1WDh0RFZrNEtYd3libGdVdTlqU1hiUFY0amhRV201SmF5?=
 =?utf-8?B?dm1yRE95WVpkSE44WFdQbzJCSDlrV3hsa2ZYdjZzaXBsK0E3ME1ablB2em5Q?=
 =?utf-8?B?UFZ2SGtBemttZnhGL3pTd1VTcFhrOGxIU21uY24rdWIwckh3cTRQbU5ROVFH?=
 =?utf-8?B?cEZsS0FrMmhVc3lDTkFkZEJuUS90V1dyUnUveWl2czNrcml3MWJBeXdKTjFU?=
 =?utf-8?B?SkV5YzVpY2xhemhtUTRrOEJ6YVhqeEl2dWpGRS81U3Y4RmV3ZDZ3bUxCNkJ1?=
 =?utf-8?B?R2p0R0xCM04zbys4UHVZQXV1cW5PNFhFRGZsZWNyUnI0dkcyT3hrbkVUbjQ1?=
 =?utf-8?B?Rk9NYVRLeVdTRStPOXRxNTdHSTQ5MXNRb3d5cjBVbU1hUHlTT081aGtXV1JW?=
 =?utf-8?B?ajhQUkRldGovQmg0RThsR0ZKWVJsbHNsbURFYXV1RWlPTHZZY2hpV3NpWU1y?=
 =?utf-8?B?d3lHYjVYME5HOHJ0UUY5RUhyU2ZhZVdWemxqYjF1c1dTSmFTV0VuVnUzZFhw?=
 =?utf-8?B?UXhQVWhwYmdrVkgxT0Vja05GdGFqZnRBR0pteFI5ZkNUYkZRZGQ5YU4xTFg3?=
 =?utf-8?B?L2NzdXZ6SnhyUG0rMk1RVXNCWDNSdnpGeGJwa1BBM1hBaGpERkNPRXZBeURN?=
 =?utf-8?B?VmhkelVrdFE0OXdVLytaYVMxM1NibXlkYXUraGNPc3VjTmFhNVd4KzNMVWpY?=
 =?utf-8?B?eUpXY2hLN29XNDFFZm40NlBvNml4cUFUZ0dJRGR1MFowWWJsQ1JORGcwNlhJ?=
 =?utf-8?B?aVU3RDJQaEM3MWZ6YW53N3ppYjBkWXVadXBCYTYyQkZncGszclByTWhZMnl1?=
 =?utf-8?B?cHBOQWpnWm5WSjB5cWkweHhCK1hTaEsyWFhGd2NtYXF4NXJWOXdRZFRZcHZs?=
 =?utf-8?B?Yit2aUNYYjRIeUlXU3Npc1NQL2ZnRzdsZjB1TUsydHVqSDNlYTJhT3JpOHR2?=
 =?utf-8?B?YktTVzdKSWw3YWhPNnAwdkZyYXB2N2JZbHAraTFVU294Wmk0eDdnMmFCU1Jq?=
 =?utf-8?B?UGhkWHBOMm5HMEhFVTBNNjF5SUpzSTBSUDlxZ2FXZTNFWXY4WXlBa28yTmUr?=
 =?utf-8?B?dnNJNGNXampYR3p2NEZYMDhVV0ZVYUZlZllQOURIcVAwWWFFb2w5aGhRdTd4?=
 =?utf-8?B?dVl3TjVsT1QxWEsvYjA5RXJZQUZseEZQNzhjLzYra01WWlBhelEzZEVTc0xT?=
 =?utf-8?B?YUlwb1M5ZnVaSUo2Ukk3RUVjZ0xrMW1YMTlTdGdkcHFYNTVGUGFNT3lVZit3?=
 =?utf-8?B?ZHZWVWJ5MVNvSVBONWNRZ2dDNG9Yd0dlVytlRzhZL29VZnNVRlUzTmpUTjFD?=
 =?utf-8?B?Y2FVNi8rb2U2Z21LcFlOTiswaHVXS3MvWVIyM09zMTAwRWNSS0Z3NWdEYlJz?=
 =?utf-8?B?Wk0wQnRkcjRxV1hxTWVmVitJUVVRUnJ3RnJqaVRwbzkwcmdGTDNaQkt4RnNo?=
 =?utf-8?B?Zm1oUG4vNmNWN3BIRGszRlRMQ29KSm1ZdDFtd05GOGJiYUd1NmlmQjdCaTlE?=
 =?utf-8?Q?3y1Wb+eqjogjkVmc=3D?=
X-Exchange-RoutingPolicyChecked: BP09zBP6qT3J0S9dKGQjj6xQpAlT9Uir3t73l9N7PhdSzWaT++0YXGsep1UvyDL+eZPWUJNmYepHCTVPI0LSYcAmTX4afjjs1R5LEzwFTGi0MUS/fL+ySLMZW4YZyzKBTxMBVAFSR3Z1Awi/RqsSQc6rYEoWhBr2MNnTDHqJTsFP5ZuOedE0jGfWuftw9zh4pY6Q357/2843RK9On9a2mmxT+13GNjZw/bTmyLoCW1d6OqBpjWtUKwelunnb8NNHcV6BvikhCBdKYX9RCk5JJH6QuVw14I9ANqJTW3lad4LcFtn8AvRKU4VMgVYNhWFay3zXAxBWlhaw/kzFquYszQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c68008a-df05-49af-e6fb-08df194b593a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:19:12.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ouWmNqpr2hQ4ur/fLQSJdN40/6WBSI4NXMhn0Eb9gtH+ce7mq18Uxx+NSJPezHedXEtjIrmvxs2PpG1YSNR1fEBkYZ1AlmcIMt0osa7rMAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF900531A26
X-OriginatorOrg: intel.com

On 9/23/2026 8:12 AM, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> component->dev is the underlying i2c device whose devres is only
> released on physical device removal, not on ASoC card unbind. Getting
> the mclk with devm_clk_get_optional(component->dev, ...) in the
> component probe therefore leaks a clk reference on every card
> bind/unbind cycle.
> 
> Move the devm_clk_get_optional() to es8316_i2c_probe() so the clk
> reference is tied to the i2c device lifetime.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
