Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49262463B9B;
	Wed, 23 Sep 2026 08:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151421; cv=fail; b=O251UuIKdoQV7itRc1Rq+NptT8WdvagtjB5Oy+QtCfC4+nnS1TYrBYtbVydDMa5B1SlPzh6bQT8TEjFUrBPP4UKlaQSBcRE3jnx3QwZaUkMbGImOuPAIrCHXGPTYFQ6dpiKKekWYNaj9Y8Tt56BsOBPnpugxQFMhXR3F18RgqNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151421; c=relaxed/simple;
	bh=rh3eS9g7qSZiMliTytYbAhNhYaUPrKMDs1jRK18434k=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=n5CE8b1mm8EMSu6vy1kU0dH2fP5Dz7wKyE43vtVJ4OtY82vJfR3DdJo3Uk6/NsjBoyOeA0YKEBWUeWU+kKGZx2WSwZ+uRgS+lmcFCf1pRlUSfJkVOgSjraQLgDqRlA7XO21SfBKMkmUwU2WGYkrAuqMHgaLsODWsxUKG1GX8wmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UeCKqWvC; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UeCKqWvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790151419; x=1821687419;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rh3eS9g7qSZiMliTytYbAhNhYaUPrKMDs1jRK18434k=;
  b=UeCKqWvCDYNwJW2KiK0XYVXtu7qai8ABHdYKn+o8xvYZb1pzg9hw6MK/
   vSTXm/r3HAfhEq4BD949k5MsXrXSWiHZK6frsnpxM2VhtvEjSWBYnSdwk
   nZ79wCiNTTFBpkf1mjeFKh3sZmQqXKTlLPtOgmuvZEgg+/P82T7kqNWmR
   wcIQAkGDJdF6oLXu26bk1V9Il8A9c66QzYLyLTLOBlVH0Ckxizp8wWKXS
   5+rhmDzebSLrgIajttIxsL2gPIMYdu4bfd+jdInfOHtEmPpBxcwtrzmUz
   UuXcr9IkP4xN02TXTXIgPk0amkWrbpkzDlBbeF9GsLQgXW+GpPJv8G001
   Q==;
X-CSE-ConnectionGUID: QiqjmRhUQnaW0Gl0VqicAw==
X-CSE-MsgGUID: z1xCt4MoR3+b2+E6RM7t+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="89739926"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="89739926"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:16:58 -0700
X-CSE-ConnectionGUID: 70/b3u7CQmeHB3ryMkL72g==
X-CSE-MsgGUID: xiHs2BTeQxq8S7AW/irgcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="299746181"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:16:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:16:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 01:16:57 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:16:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lwrvq7CK0QDxyUgJXQ9qqZH5g/LYyeAJf3ZZ0N93UOvVvXkPnrgXulJO/NNtbIXPpBlfSAxEJewK2+2aaDSi7V/cYmXSvQloGi8k6VNzddXRyfFXzpNiGvEzIZi31EJ0vxqKbuZDSmnlvZYnSzEWfJm2xTpnRNLMgzIznDxkiR1y1a3Hnvehm0ZBshYsf3zwRl/DbkTP6BXbJg3wwMSJaPMje7NVh0lpXGufgYpBuPlhl1vnQBgJ14aaNrGT+rpyRRIqosR+X1VKeloRkPOET7jRMAoJnCRX1X1RqrwHvidtKXmgqh3t+bv0JovcXs09qqmpaOCI3ym51AIc0V5a3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JcvtK4kcuFNLIxD+XFM4URD6pfKOoNLf2W3PI7L/61U=;
 b=FttgTOwrgxS8ddPBy3/8ZPnKPoMesFwLabAMDb622ovjk++q1iIHOYccjdhTZNsFuPmPHV+lL8Q/ne+Q7gD38WjPH3JqO715bCY9W27dyXxQx6LmnlFR/D3RdgtlWJ6Gd3mcgI9spKK8X3m6B9ueLg7eeAdGkiwdiccJmuXzxDL50UKB5WsmAMujcpM+ahnWWpNLVR3BG/9w4OXojcnYYVFzNf2D4Hojz+yghfBuISV13sRuGk+51DQc4/p1PnNnx6PNoBlEfAR4aZTPatn+Z4MQAlCoEWBHFiF0j48Vc9wOJBcbqcqVCfp0wdT0no4rwpmxNps5uzVpd2u4t3YzGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Wed, 23 Sep
 2026 08:16:48 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:16:39 +0000
Message-ID: <1690dddf-02ba-4a30-b490-d9e317303b6f@intel.com>
Date: Wed, 23 Sep 2026 10:16:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] ASoC: codecs: rt5640: Move mclk acquisition to
 the i2c probe
To: Chancel Liu <chancel.liu@oss.nxp.com>
CC: Support Opensource <support.opensource@diasemi.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, "Oder
 Chiou" <oder_chiou@realtek.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
 <20260923061305.4041197-10-chancel.liu@oss.nxp.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260923061305.4041197-10-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000521.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::66b) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e0991ad-1f23-4cd5-d2ec-08df194afe54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|11063799006|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: JEIwOTu5hOF6mdlUbX6HdcKDUGXM0V0kzqGZJoVt7fa9jgEeA+F5Ia/zCcdBnFZzOrd6MxS3mx5DOP2XA7++u0i2sB7DKmoa4Se4xsqrs2O3UmvCZXGqITINUA4hAzxY+8nqN1yf/z2P9jY2PBlddkTCc/8LoLvCNaB/d5VzMGMegfMrDhfC9pUUY9SOaqWv2mcPEI1fQJ8uil47FBrTodfi01NDDPyt9JohOUeLjWs07Y+YKdH2BGTiLtwZHjHfRQkVo38m21RmpZDb79ctsLAg/zZ4ZTXECx1tnwvUrmlGReQvr/W+5TmooZJHYZ6vWXsDdkHTdUGpNnFKdaalM8oSbcr+BEkuTjT/S5HBnjHN913wm1vf7k4dM7FsMMYYuAzBK+XyPI66xXXYNavoL6JaSn0+Ju4joJuCJGIi+qduGF27/13j2sjBYg1SZ+/54gmsl7aT1NHhVIteQ8ieGFdtQrcv/X8yUIgv0w3bMq4wTLOO6Yw478skwZWJsqDWF0NapB86Ttp3nzcuqyNrEhXMmy0j88bbiB+G/sk/QyfLZEeNKdqNtNP2P13WzmV4sXXtSWoBFueNtapV0PfBNQ2WoCiA3AKuYwAWUO4EC39plvespcFSl+pfzdj+y/V/aryS2vfAM7yzgJyOVIGHe40qOi8/RiK1p5ijjUF/ruE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUZ5Z3Rac1puTmxQTWxKSmlTcUdWQzNMbGxUZDZzOEFyeWJJZ2xUTHhIR0xO?=
 =?utf-8?B?OHFsdXhtWXQ4ZWcrcjFRazIyWW0zQ3BHYll6QTZwMnpVV3l6ajdQaFMxMXFr?=
 =?utf-8?B?N1IybHgrbENYam9xV2lpOWFLNEdxc2xsQVdWWXY2N2dFVDNsT3FOcmZJbnNK?=
 =?utf-8?B?dkdVS2x2aHpvOFg4b2ZTSURhcEptbjQ4aU1KQUJjWmZISnllL3czM1Q5QXBy?=
 =?utf-8?B?dU1ncDMwNVBqR09zZU83YUVkdk95UkQzU2FvRG0wVlRpTlE1bmxTaUM3SnQz?=
 =?utf-8?B?Y3FLL1FFY1QxdHE0ZUZ0Q2ZuL2ZuRVdINFk3NWJTcXB3ZmlONnJEeTFLMVE3?=
 =?utf-8?B?RzFsb1JSRkkvTGZaVnJjRlRhTnl0ZnBYTmJVQlk4VE54ODB2U2g1OGJRMTZD?=
 =?utf-8?B?S1NyS2dUQnlqRnBwM21xa0luWWtvdUJWZlBFdWdZK1kyRHNLdDI2THRmSFFC?=
 =?utf-8?B?M3Y4N2tFK04yNHVkMy90dUR1MmZ6YTNQUFFwYUpKTlQ5czl4WHZMWEtMVmdS?=
 =?utf-8?B?WG5lbEc4TG10VytwenhRbVVKT1dXV1p6R01WYVlUVDUyWUdlOVV6d2w5NEY3?=
 =?utf-8?B?OHpVbjNOaTRxdHZlaHJpS29pMkZzc0UrcXB5TEVqQUw0VXVwZjhBdkVtRFo4?=
 =?utf-8?B?MWNqTVhUTkw2ZFpDclZGNkxEdFg0dG5CSEJsQlBwOTdQSFg1MDh0SjFpTnJM?=
 =?utf-8?B?TXByZDdFcFJYbEF0SS9XalB0VTFaZ000UWViVDJzQmV6R2NIS3pTaUdqdlV3?=
 =?utf-8?B?VWNGUXhqNmUrZXhXbTZKMkhZMG5lbjYxMHBLOGp1UXJ5YXhWazM5YU1zbldK?=
 =?utf-8?B?V0cwdHYyd2xmaFhkOWRRTUVnM0lDdU52OVVFQjc4ZnhocEZWeXpqTklmWUdD?=
 =?utf-8?B?S3FSM1BOdUY1Q2orei9YdFluMFRkZ2hvaDRBVnB2V2NLZ3pzQlVXWm1UZk9Y?=
 =?utf-8?B?Ris2c1c0OEc2MmlNOXRLU0VTcllDQ1F0QXE5WTkxbWNTNHdjRm16dFcvc1E5?=
 =?utf-8?B?cktXNTlITTBnem11VUdjQWpKM0dLL2pkTkt6NENxdVdhaERQWk5nekFQVGdE?=
 =?utf-8?B?VWJiTHhNLzM0YjBCRXFXY3U2Y05oZForTjUwNis2ejJORUZhckJIUVdkSEpM?=
 =?utf-8?B?bzdvSHVzZ2xtb3Q4cktHVjVLUkMrQVFmUWRLYVlsSnNaV2xndytpbTZ0QjVu?=
 =?utf-8?B?SytIUGQ4VWw5MHhDZ1dDcW5BWUtNR0Z4M3BLRzE5bGhiZjZhMWR6UTNHT2hO?=
 =?utf-8?B?bERmUXl5ZU05ZG03dXVqQ2Z0SW9LemZwdWVPU05MK0hOMUwrdzM3UDY1V0pW?=
 =?utf-8?B?czlUTG01bVNjL1plK0VGU2xoUEtEQ0hqbmorbXFub0NxSW5XL0ltcEoxMnZh?=
 =?utf-8?B?LzBkR3ZsdWVOMXBFU0xkQ0lqam5ucnQwSWxrU1pWT2Y0K0dqWEsxVEFlUEFX?=
 =?utf-8?B?Qy95dEpyaytpbFQvVFZtbFdCaE4yZEx5RWZ5Q0hicmFtdkh6enBOWmFYOXd6?=
 =?utf-8?B?ZEMvWStkQWZ5T0xGNjBNQVZBNXUrYks1a3pnaFpsSmpKNE92SUcxVU5mcUl3?=
 =?utf-8?B?MExHdUlqUHdNaFk0VkRZQVJLMzZYWkZQb0luQnZYMEJHT3I3cWZMd1BaeTQ2?=
 =?utf-8?B?UEk5N05tNENSdjBJWllEUGxPMkZuUURCdTVsQ3dmTVZOVElmZm42dmsxZG9Z?=
 =?utf-8?B?U0hFb3VZZGh0WDJLTk9MbFl3bFYvcmo0TFFDcWFCREJXN0xhRHdIQ0ROQy9m?=
 =?utf-8?B?N3V2Yll5UzlLWU9UT3N2Q0hIZjZqbXliM1VFSG5sNHJGaDFCOHpiQkVrUmY2?=
 =?utf-8?B?cWl1Ny9DMWxyMjJXRnZrM1VBQzhJOC9reFUyZlB5SXRYTCtCT1NXVnZUdTNW?=
 =?utf-8?B?NjNoanBaMDFCcGFGYVBvLzR3bzB4eHNVUlRFUWdMcHpWaXRhT2plSjJubVps?=
 =?utf-8?B?NVNPSXlrUHhLZVQyWkRlZElTNDlzUUFYVVE0RHdOOG9qYTlPaWYwYlJFSm0x?=
 =?utf-8?B?N0xzOER0bDN3UW80cWlXdmZxczVCU0gvcUZDa3EyU0dOSkNua0QyQ2Z2TnVV?=
 =?utf-8?B?UVlLaHBPZ0ZZZHhXV0lIakFCQTlCUnFlZkk2M0MwWVlHdGw2dzcyV0NoL0pE?=
 =?utf-8?B?bWkxZlJDcmxSWGI2Qi9CR0pIS3VlSmlFcGhWQW5tczRPQkw2ckVPNmRyZDVu?=
 =?utf-8?B?TUp2ZFVtc2xoc1FaeXJuNlhjT0U5OUh4YytiRGxsMG81V2NaT0JzTGNiN3pY?=
 =?utf-8?B?aG5waTdFc21Db0ZlbWVWZVRsWjYwYlVFVUNKamI3WEZLMHRNcWtlK3Z0a1Vq?=
 =?utf-8?B?WVpKcDNRbHJHNkNsN3ZJbVE2czJycm1jKzBuUW50N1ByK1R4VmQrMmZRSXZG?=
 =?utf-8?Q?casyH09k+TAh4Cbs=3D?=
X-Exchange-RoutingPolicyChecked: LaZrNMQIecK7itga75/20bqInO0ss6XSzYo88I14QptuMkk1KFDVEgWuJddFwoW4yPytLPEESlVX1CV4inWyXgzBpn9P2uwO1y2qzTSbNMKu74TPSALUhUq9FjarDvgcmncGn8SQ5vVexD4t409gZ6B1/3KUhH6ie94yoIKGKGOsbbIIPBIbLnKqLhYAw/yqKBkX4BvhNn11/FT7hwMwrLBKCePJoBVLdQihf1LgnukWs2UBfBL3XZiQWpsJ/KnAcrjx8oaMWoj4+kQWhEYASvIbEgssGiZpVBoV1WNmli2i6iOhUW/wBae0rwYoKBt9TzJ8jTEuwElxSWaZMISMRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e0991ad-1f23-4cd5-d2ec-08df194afe54
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:16:39.6206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvMPjMiANHtL0f1QG+t2GF8sl6e7b8BBmO7+6Mdyk+zXFXmATxiP0aCvLK39QvRCALOmFiqDz41kryutumzqn0WMCwmyDrdaYNY3t6LT1pI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
X-OriginatorOrg: intel.com

On 9/23/2026 8:12 AM, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> component->dev is the underlying i2c device whose devres is only
> released on physical device removal, not on ASoC card unbind. Getting
> the codec clock with devm_clk_get_optional(component->dev, ...) in the
> component probe therefore leaks a clk reference on every card
> bind/unbind cycle.
> 
> Move the devm_clk_get_optional() to rt5640_i2c_probe() so the clk
> reference is tied to the physical device lifetime.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
I see no reason why my tag was removed. Nonetheless:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
