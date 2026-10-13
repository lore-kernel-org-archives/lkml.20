Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4273A16A8;
	Tue, 13 Oct 2026 11:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890676; cv=fail; b=XqJCKvOzF6AYnPMZQ444BUj0PgJxyGqXrn8UJpvtTZCIulXQvmXQwIS/2Nfe2gD1QjOH6PpbMqG7s7drbaP3au5OVu7cOx4H+40AVEGkcjeEP83BBOtSkhN4Am7eoqzJw76//BwROyM7RYfcm8EKQtpWYlcy1Vi+OebSHpt7pO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890676; c=relaxed/simple;
	bh=EFhuZI7ZmsRbz6kc8pQ4bfyAlKYXvAVMFLvgmtimvOA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Mo5FSTpCG/qF6d7fagpvViu1jbj8B6oHcw3/dUKg4f46gWYeHCDkwS8N21xiQI3G1vthFOd5gaZ1SuVe5GkwRZJWMZjXmLw2u778v/sPL02iDDlseAZ4KSdRiHpMiyu2Dwaux0vkHugtntMonEH+zv3bq77bYhMXCBoYksAi5yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fvNP0cUv; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fvNP0cUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791890675; x=1823426675;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EFhuZI7ZmsRbz6kc8pQ4bfyAlKYXvAVMFLvgmtimvOA=;
  b=fvNP0cUvowdAqrHU8GMOhrjsBYNTpeYF8QyGgVI0GgmF+j4cdJOoW+5N
   z2ULSy1ajedh7lXHgaMV5wb6QYTEXesPG6f+N3/YLSGhdwzvMuaXhaG5Y
   0CRIjQEgeqmLlJaQmteTucMwEVcZOqoh0JAK3tCZ9qBrfi6f8lQsKJlV8
   7VdnszGT4KeouzhtV6EIJiWGBggkNKq4xGNluTS7nwMHivSqZLROIUodp
   lSxuw+Iz+tFiPGrGWKq9+pur9lL+Jca7DWN97HQiWVJUZW41Y6N+YfAoJ
   gos1XIeMHdR4O4IY9sH2GPltCJJ4pc5oRX8357b4ajRs848xMeFANVzYu
   w==;
X-CSE-ConnectionGUID: Yx8gyMrPQy6mbsNHKS+YOg==
X-CSE-MsgGUID: ceBq05/iS1CtLUd1n06HoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="619283"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="619283"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 04:24:34 -0700
X-CSE-ConnectionGUID: Hqccp8Q8RmSD+BgFzx7fgQ==
X-CSE-MsgGUID: Lh7AQqX4RjuS6T31X8QIZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1093189"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 04:24:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 04:24:33 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 13 Oct 2026 04:24:33 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 13 Oct 2026 04:24:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OleYSGdXvJSn2u1OyLb+6jMpmh7c15FOMlGNF9UxKNo2qicpIqas4LdOHt3X6pdamMvg0XV/C29sgCIRJZBXEwxvoSjD7jHztPQZM0wAFr9WS9R5vCPKMn4ulbmA870P7LtL33memi+eqDvV+2TtldElNXPHvCj5iewPaXqD4RsWTa02JWDBXH35HiPSRckqkH3s4A45XKlj8mROkGV64ATGa5ZykPzdw2RlwtdpDsk5WUHj26AaLXyQjnDE+OyaSPQsIC/Fxl+oOe38dfZPYh7bzBlPKbpxKE0xsKbO0j9+rzjGuS7C3Yeds9aR6QzGVudLMqTSbUZeqWb3r5ZFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cUbREX2tEQGtuYhemCUMY0Ez6rva5gTsYdpWGWAgK40=;
 b=HD8hsV7YvndmaHNuGeGU2TsYFvxs2k9oggPxQzPOT6e0Xecig4W4ZH8ywmHevmqBrHIInREao02iDHp6pKTlfweAUMd/OgtRF+JymKTpEgV/x7RUYVR611eut0u7MC2lWs7I4PCJzghnFmJUqXSJMt/dVOLxVu6vdpG5i+YWCgHOPxFXodEt3WGGhwmU8ljNypXusfCP3GOk+zBF71v+MgnJZsy18JTHQt6KHR2ASd8CYzshu1frOHAIFUY4M0Qlby/+UDZTu96oQit4z/YWAV+bPM9/vIJqvshPZfEkj3cWqD6hf3XkR+/xEuax9eIdFe8YL2ygOV93Z7dcosgyGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CH3PR11MB905664.namprd11.prod.outlook.com (2603:10b6:610:363::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Tue, 13 Oct
 2026 11:24:30 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.020; Tue, 13 Oct 2026
 11:24:29 +0000
Message-ID: <40696247-e763-40d8-9d4e-338047cdd4fe@intel.com>
Date: Tue, 13 Oct 2026 13:24:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] ASoC: core: Create new components in sane state
To: Mark Brown <broonie@kernel.org>, Kuninori Morimoto
	<kuninori.morimoto.gx@renesas.com>
CC: <linux-sound@vger.kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-kernel@vger.kernel.org>
References: <20261007133353.455185-1-cezary.rojewski@intel.com>
 <87pkxexyr6.wl-kuninori.morimoto.gx@renesas.com>
 <ed059f1e-2390-4e1d-bd1a-cff08a3441ad@sirena.org.uk>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <ed059f1e-2390-4e1d-bd1a-cff08a3441ad@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0272.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::45) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CH3PR11MB905664:EE_
X-MS-Office365-Filtering-Correlation-Id: 8befdb28-ca95-4a64-0a1d-08df291c8c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: /Jdek0wMQbIHS+sC64b7urO98tf0rwA3sMbll7MjUwU4W4iRU6z9sGCc6Oy8MQ7FiJZ9Ld7JPvVNWJzh3Y+NNkSxeJMYSjk4YOn9yjYfFemaBD7Dh9bD1idT8j0P/LKuKXj2ncO3r9ywcTPaaMk92J8flz2xg8k1liV9FBlQrfl43JgOvTR7cfZRo/LxznoDWfwq+RGyvVUBFYKxZJGlhPfa3J4CR+F/dOofYdAWNkmdI3mBKGYWxX59Yo7FEsEKOt4XWLZbGjtUy5EVRWka4G+ZxnwYiX+2ik5UJDqjGuoLAYPBGqktfVZMsx1slS8WrfcD8s4hWY+1O5wW343jlJ8Q/D4YDY/cam9Ig3w4BQ93jbLxMjfMEdFEjVevEryh6CO2LmQa631pxhQ7BdyQSdDs7IxhxYPRmqO92PNkhC50hQJSnqzDlpSTPaU0FdgCp6e+r+LOlFRFtb4GWTCeEWrpkBRmnZMJscd22G6IjhExHdmj/wRUcksIwJ5wrG+XaDmit+P1Ke455ps7jKHrG/DmGq9rd0SMZS3l4pRWGSx7npZLsP4j5LsuOyGifQ8JahgdJNidAySTjjeMiG65FhUy5KLo8/DSSJ5hOqco2aY01yYEuoYOX9V9yV70wBhxD6XY8bnMDjsmhSQIyiMmaPISpsGQUT028nLPbI+Uxbg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGYzWEJrUTNDL0g3bm8vWjQ3d2tVaWhLYW5iQk04aVdaemFsWE1pQlp4QXNN?=
 =?utf-8?B?Y21VMjV0aDA1UFk1V2lMVnorMEVVL2Vad2ZuZ3M4QVJRbW5JdTM0czhCOWRu?=
 =?utf-8?B?WWdxQ3FOZzdsdEZjZ0E3eGtJYlhCVktTNlA5U0pXeUptT1I0THB0Ym1Sb0o1?=
 =?utf-8?B?QUNhSTVkNHAvZmFzQUY4cGJFcUtUeW1lK3dGamVtQWFBajZWMkwxMURvdkZJ?=
 =?utf-8?B?eGVsU0VTcWEvK0pyQ3dPZGtoc0hQMWdCNklzdDZsM1MrNlpiUWtmVXJpcUsy?=
 =?utf-8?B?ai9yVDNtRkRDdWJGc2pScW9udEYzRXRXQjFBVWYyOWRDMXVzSndGWStPVXNN?=
 =?utf-8?B?V2hFUkNtNDk2Rm45ZGZndG14WU1XSGJsY28vS09UWkV5c25Lc3NiRnJUaGpC?=
 =?utf-8?B?dUh2NUphaFV3OXBNa0FFT1NTN1kwTXMvUUlVU05HbkRicFpJTzZ0bFFJcllR?=
 =?utf-8?B?dmxuamlDc3VaWG5DQkhodHF5bzV4SnE3RFI2a3ExNTEzSEN1WnJiY2NxOTA1?=
 =?utf-8?B?dEhOOEpITHZ2Sk9KNHF3Y2tGenhJcEJTS2ZORmtpMXBsa1ljYi9CRk9XKy9P?=
 =?utf-8?B?V2ZvNFJYU2d0T1l1c0tVVTlHYStGN2N4YW5JazUwTkFUd3ZLajhaN2dMRmlo?=
 =?utf-8?B?TUxpdDA0Y0FqSURIUDJ3L1JMYUh0OEFqSUhVWlJnM2dGT1ZIYndlR2tRTHZE?=
 =?utf-8?B?blZlV0hBVTlzTDRtMklWSlNuemtxN2lzZDBNOUo1N1k1UEdFWkVwZVNnZW5k?=
 =?utf-8?B?NVhNS2tRd0pPZXlnTzRkdHBzNFFyOHZaUFZjZ3ZnOXVuVVFLZnVGTHlKa0JT?=
 =?utf-8?B?OVJXemtvN1d3N3p0ai9nc3pvK1lZbXlpQnU1NExWbWhJSkM1SXpWSFVMVmJC?=
 =?utf-8?B?UE45anhKZlhYanNuWGhNK0xjcVlacFp5VTZWRXUyajhMa0lHWkhBRnk4OTUv?=
 =?utf-8?B?RHFxcWZ6bEt0RTBTTG50QTFrM0d3SjJCODFxZ3VxM1ZUQmhnWDg5ZFdRbjVs?=
 =?utf-8?B?ODB2Y3d1eG1YeVh1K3NGVSs3WnhxZUEvM0dBSEprMlRxcFZDYlR3NUQyc2lO?=
 =?utf-8?B?ZnJuZjVsUExrN0lVY2lkWkVTZFB3eEpsUk82cEtraWU0ZWNYWEZ3QmFuVVg1?=
 =?utf-8?B?cThOM3dCU3NBS2N3SlE0OEhTYXM2bjBXRTRacFE2bTk2c0cxWnd3TnEzNkNL?=
 =?utf-8?B?WjhtbEVjVVU1VGJpSm1rZW9VbFhDb05YaGRlOHZrOXErL0NlWGdtdGN4eW5Z?=
 =?utf-8?B?TDZPOEVMcHZEcmZGQzI0ZG0xSkxjRGpRTFg5WnlDWDVUNWFxQXpZRGNLM1Yz?=
 =?utf-8?B?RHdsdEFpWTBaaU5RODlvZ0tKTE5QSmxvdVJvMHpHNFRWeUFSbFZkbjE5Q3Ir?=
 =?utf-8?B?TGJiMW9xcHlqQmhFSEhxTGpsTUI5Y2pBM1ZOOC9TQjllWWYxQ0FtWitCU1JB?=
 =?utf-8?B?K05sK0EzTUhDQVRJUitHanVWSytQNWdQNWlvM2tQU0hka3NOL2s3YTNvcllG?=
 =?utf-8?B?ai9CYTZUZ1hmL3NJNGlMVnNWcjdITjQyWUlZNWxJYlFMTnFYS29aR0FSQnhn?=
 =?utf-8?B?R0ZVR1VjMTFVZmNkd1E5SGw5bjNYMmdEVThsR1FVWWZ0UHd0VTRZNFN5MHB6?=
 =?utf-8?B?OEZjOVo1cmo0bGNienQvV0p3cTFJdWlaTDZreGt3SnNLTHZhTmp0eTVnSDY2?=
 =?utf-8?B?aWNtQUY5d1hKRTJJbTk2TU1ORTg2ZFZSNW90TitjS2lJemhhY3dCQ0JBeGh3?=
 =?utf-8?B?bkIrakpFMm1GQ0wyeG9XK1RVL2FIUEJuTlFqcWhHZllRRk1ydTBEYXNTcDN0?=
 =?utf-8?B?R0tCZDRETU1FOEhKR2MyV3ZXTEVzNngwQUZtZHRhNFZPWUVZUlIxRjk1RUFQ?=
 =?utf-8?B?cDFMeWxJSlI0amdxa29malRwa1RSY1JJOWFzR2tmazhHdGdBWEZRQkxwK093?=
 =?utf-8?B?YTVaWUVwcDdNTHptZ2ExSi9iZ2FDUzROZXpGSlJDU2drcVR1a1hqSG90MzFv?=
 =?utf-8?B?VksvdHpadkpYUkRFYkZnMmZYRUluME9XcjlYMEZLUXB2eDhrbkFnS3ZZOGxD?=
 =?utf-8?B?a0VTMmtQL3AzQjFWK1lzRzU5bnJ2Nk40eEdINjJqVm9zVk1EYmQ3VXNmS0dN?=
 =?utf-8?B?UVA5SzJKNGkvUks3M0RtOFNCRGtlenlRVzdaQnNxSnJmemJVOVhXUWI1NGFU?=
 =?utf-8?B?dG81TStCNnl1N2kybUJGUTVBTXhJZ0cwWWU3ZWpCL0pGc0NjblZ4RXVlRFZF?=
 =?utf-8?B?RC9oaThPUFl1emtIWXVCbUl0NmNBSTlWbGI4eDJnS05OTzFYSGR6d2NFUi9o?=
 =?utf-8?B?WVRwYUhJcDhxV1h2Tm8wbUtQRWROSUk1U0trMHpub3FZblZwNHdDcFlGTW1S?=
 =?utf-8?Q?Kj43m//zLcmstoSQ=3D?=
X-Exchange-RoutingPolicyChecked: t1waQNstvNBxn2LrkqbMy3JNMk1vCJT++D49ODcMRwEuAqB+eAghRZvuaxRW9ODG0aEVKbLTh2/4+CrpJkPPmq7+PwYnPrjRfBqdXkvyzy+4wdO9pu2VtFAWEDjIaMcrNOCyVhNOTMmp25n8Djm4i6g/jadEzAl5v9rQdK3HGRkiyInDMvqUwWO3dOIP6EJqgwaS+24Z+w+FcWe3gB/6aveYbSRmKb5qlWmxH7tOwO6JhZqx3tDpiIcPixgYmHN7hCJ/DaVU7sYFsqf0DYoCY9QF0UJSxQsepaZCN1G5I0+n1G2ZXMA3+LN4eKrvas/6R3z/bPiv+6sSpm+2krnPAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8befdb28-ca95-4a64-0a1d-08df291c8c16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 11:24:29.8193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gKG28YeenRQns9PPbC/b0fkBWxc8bXt0wHFPKln4Yb4FYwon/txe19pIO5peR6wd9ZmHeQosKAQJDU9gSBgG2MoskZvD7sO3aiOkaOXeiac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB905664
X-OriginatorOrg: intel.com

On 10/13/2026 12:53 PM, Mark Brown wrote:
> On Mon, Oct 12, 2026 at 11:52:45PM +0000, Kuninori Morimoto wrote:
> 
>> I would like to review this patch, but unfortunately I'm busy this week.
>> Actually, I'm now posting cleanup snd_soc_component_xxx(),
>> which has many steps, and is now under progress.
> 
>> I will review your patch next week, but I guess some of them (= not all)
>> are conflicts to mine...
> 
> Ah, unfortunately I already applied it since we're in the last week
> before the merge window and it didn't get a reply - sorry about that.

I do not see it applied to the for-next.

Obviously I'd appreciate the merge as the gap mentioned in the
cover-letter is there and the framework should sanitize the object
before returning it.

At the same time, I'm here to help with any conflicts should any arise.
