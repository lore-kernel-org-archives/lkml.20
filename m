Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63343583AB4;
	Tue,  8 Sep 2026 17:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889200; cv=fail; b=IN3atk0/zbXEqZcCU41pWQghbXXDFhxZyIzFD2Cws32aWvhbfeWFSwMleHuuVcT8MZm7qynpTtWxJKBkRcTd7Yl8YjqtYxDtZ1j6iBQoJlaZUB1ue0aWN5zucJmfqGQyDRMcaCQ4dRU8lLWkUfwVOrVr5xWDSoIvUMTcEIqOX8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889200; c=relaxed/simple;
	bh=vQ7nTextc3qBAkfnMhmojnUlpX+Skcgs2kDpfH6Do20=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J2Tx6WgRdaZVAJ6VhwtgyBjtN0jf3pAJp1BzaR0EGxuL+k1KkJnfFZp5g4ZYpjC8p8aVttq4r04rf2PgjKbcDbkjQEQYmbQ55UIKkG1LysA4NMq/ILc4D7/XVsRIGVTpL4HndlfUb3fVqmSpp9a6RfAywDCbRjXNMaSLQpg5nac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JntOeBm2; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JntOeBm2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788889198; x=1820425198;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vQ7nTextc3qBAkfnMhmojnUlpX+Skcgs2kDpfH6Do20=;
  b=JntOeBm2IGEWrEbpRNeBrVCK+I+31y6WFlg/Zd0qNES/14RERgdL1kkF
   k0wy+GPnlNshV/G7XHwmraM/ZHk0ExYl8Z0ovoEovstanHFf72iUD7Aq0
   gLLmjh3XvEKoT4YZxvkazR3sXMq/VvlDJAMtnGrEusor78pjmeWDu5eWV
   ZSyqEDJvGTsMbAPRKiCAqk5RgYE+9PL9ZwVOtnJvWpzCPgWiVbyv2b2/1
   e/XQ6ZSOJA2Z3j9V9h05s280F235g8iPcRaXTFRtk8z2gNrSr6Nv+sQWa
   CANZo8BfrXQjnBzoNG7/L7neEmIMghPrb/gt4EXFj2k+SbAtYGuXHHeqE
   w==;
X-CSE-ConnectionGUID: E1MPq5rVRYO4XEkiGnnNYw==
X-CSE-MsgGUID: +lsbOuZaRcyzekM6wOzmuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89504730"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="89504730"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 10:39:58 -0700
X-CSE-ConnectionGUID: 6je0RH6xSMGb8ZdVaDrOWA==
X-CSE-MsgGUID: ZFoBpEHsQfGPhyvC1PQ1Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="274858925"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 10:39:58 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 10:39:57 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 10:39:57 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 10:39:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ILgofRO9QqBLTVYpJoZt4RMXfiny6CtSEc86HieffYjpVY2f+SDw2tLh0mOkuzg8pkOlWnwhUneG99/gbR2TmfQNB0EEqaTG5oySzDs+7oBi8pF11zQ3fwdCrJOtV/OaFTvz6CsRR6CcGClohtgfqEs9jU3Bf+7nGdLNy1kNmAT63zNmp5BbFOd3myn/8fDyjflUQXMFnCa5UqfevzK9G1yqbc/3+WpUIoGdZwTW5pq0xxs/FLJznsTwTgprGmZYHxh5L6+pQQSy2dz65n8ap2IWKMVVJN0wsOR6duUM0Ky0clfxxCsBEyZDV6PzeAxdDic7719zTL3bi9YAvBns5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W3ilsyeKXgw1sobRQEI8Mz8nucZEJcxB++QERge6I9k=;
 b=B/E3PY2bGkGbJFPvnbt2HerBZ5ZOVCrKhVvPuiARhMgDd1FH61uyh+KPzvvtV3Jc8vMCsb5d3eLEnWirG6expy3UkIQVOl9yJnDHVydfN8swrbX563qGh68liq4ZNxuYANmXjOx/OSZR95rS+953K3RaR4qrgl9ZPOmLpRFGQkY0h5qHXmMyGQXh6g8ZdtvBpUQ6dVxMZFmt13eNAMeuPnJn9/0WvhPidjgF4iDjGPaOEL+nM50IT2hyWgalUviKyPQn34eBEjc3T9iazmPzkyFQJYyBVJW05Sh7XpXp6UcAJOhMfXjwOfa7tQuMz4+ThGAX5pBEy46zmao0Mfjvxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 17:39:51 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0382.014; Tue, 8 Sep 2026
 17:39:51 +0000
Message-ID: <b9a15922-e51b-4b37-bead-fda39bfe9bb8@intel.com>
Date: Tue, 8 Sep 2026 19:39:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: SST: Publish the PCI module aliases
To: hpp.iscas <hppiscas@163.com>
CC: Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Vinod Koul
	<vkoul@kernel.org>
References: <20260905133133.63661-1-hppiscas@163.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260905133133.63661-1-hppiscas@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIZP296CA0024.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a8::12) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|BL1PR11MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: f706fc2a-2e90-42d2-e441-08df0dd02fc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: XJu1H3uldVktLQI2NCbOuDCeffDECNQHs4XoCRcIWRWUQ/jvhezmVW5ED0pVNkRa0QEJhqgloJXfJfzCwocSGlYGB6c2hFHaws4/S1zuU7545Ej544N7jvmskJyIxNWImUcBWzE9NY0s3RKvAto9vIv4FcUZm95ofaJ3r6YFjc3hqlbzXJk1xHyifGMS/+o173zcA6sgXUU9CF7clnY+zc+vQ8KWLNJAdqg0P9ZRRlUlAtbOoMkz06WuRTJVqNp+9TM3WGnmAeyd1jGlafHwYq45elBKNccIyZl5TePeqkiwXQI3vKs/EKdgs85RH0DLnFahik7x/h/0Knds7ylLsNzYqRE66OiXFMOCe+5nqwjI+vXx6qyG12/BkqHUCZSyTYEluvjIGVfCLyPTW4awogaQ8SJcz9051KFarY/sF9+IZxi2s4MvFrlwzUKyulnb336C8ctQsibRBaK+bMQ1Wh7xQuu6NpYuBVX7un0CpA3kjoakqo6ojBBew5dHZ44BBtlYCr+PkV2r7oHUs49iI8cEYzHWFJ6oPvcP1aki4S+/ML1yRw+uCybgiUpa79JTj8XKnMeGkJwBa78JdXZdK0TRUCV7dxwP5bS0CGu6skF11VR1KI0uljbzUzJz6x394m0Pyq3f5I+sCMQbkN2QOR+BTQCRdwj5WrgM+FWtqnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0V6YzZWSG9pa0I3ZHpRUG9PZEloMm5PTFphRlBBZVg5S1hMWVZNWlNSZzM1?=
 =?utf-8?B?V1JGT0JJd2w0bE1JNlNKb1lRVmR1WUhZcDJzSUhGVS84Vng3MC8wbHNtKzBj?=
 =?utf-8?B?MWtHekpvWFptajNhZDQ1d0ZzUDFONi9LTWQyekNlZ3JFa0F6dGhDTzMyZVNy?=
 =?utf-8?B?N3dNZGlGT0JjdmJoakdJa3lNTGlTVitVV2RGU2VtYWErSVVISzRrcENBMjN1?=
 =?utf-8?B?dUN1ZjNWMDNCL1R4L1ZxRTZJVWN5azFkdmxnWXJoSWhSWXFFeUZsa1BwUngv?=
 =?utf-8?B?MkJOSzF3MDBNbG9PV3Z1ZFIwK2tGUlIvT1p3RE5RbVowelhjZXQwS3gyMnZC?=
 =?utf-8?B?MjJkbDVrN0w5cVJ5QzRPRHlFZFZOTHk3eEpTa0RKOGsvS0YrTHJMVy9iUmsr?=
 =?utf-8?B?WXdmU0R1Rit5UHZtUkVSeXNaU2xUTE9FM0E5NUVOMzcybXdveWxCeFdyVUZn?=
 =?utf-8?B?MWRNM1Z0SktOTlpLMFN6MDFnZjBHaGhWYnZqeWh3U2h2emtFQVJVdk9namoy?=
 =?utf-8?B?cldIdGc5VjNpYTVwcWZya3lCTS9ISWIxSnhzdm15OFRzOUxWRkdZMFltWGQr?=
 =?utf-8?B?VkFsYy9wN1d4Ukp3dUxiajRyMnMzemNZNzdFZDJBMytHalZpbCsyamVZR0Z4?=
 =?utf-8?B?czlPTllBNVRPMTRaOCszMVp0ei82bngvZ2dtVlhqYW9OU01tcXpmQXpTdEpI?=
 =?utf-8?B?RHRtWFpTeHQvY0ZLR1RhOThiMFV4clFsaFUrSFpyT28zdTlvYU9pTUs2TG5W?=
 =?utf-8?B?bDZFQjkwMEh2MEhzUG5KaUxNYjQyNVJvaW1lcHBrN3E3Qlpxc1doaVI5SmNS?=
 =?utf-8?B?UGRuN2Fndzc3VEVwNXVKMFdUNnZGWWNjNkVJTHVpRW9iR21Pd3ViWHVjaDB4?=
 =?utf-8?B?MkVmRlhJWDk0VEpiT3dxSndOUEFhRXZmL2NLK1VuMjRJSGltam9FZEpyVEp3?=
 =?utf-8?B?TEpaSXhYRUlQa1h3WHN0bTRISHpsaTZDVTJSWUJVOWNUWmtEN3g0elZZYm80?=
 =?utf-8?B?NDB2bHJxQ2lsTnJBRTNleGJ1aEdxV0pNZlo2c1YwTTMyeFdEejhRdTF0TW5k?=
 =?utf-8?B?VzlSUWlZNVdXSzVXQVRLUFNQWTV4VldMRit5OEFpR3JQSTBCNGxxeG9DdkRy?=
 =?utf-8?B?R1ZxdmJYeVdXbVdpRnh6Y2lPY2hDdzNoeEkvN1hQTi96ajF6TnQwTnlmVzVC?=
 =?utf-8?B?Mk42eGFRN0xQM3hGTnVLRDFpYzZNVjBBS1pYQkN5aHZNQjJMeUNrdzNJMXJS?=
 =?utf-8?B?MCtZNElSYjM2TTFQZi9CNkprT3UvT0k4cTdHMjUyeGVJemYrZWRKNlJOeStl?=
 =?utf-8?B?aDNyUElNSkFNeVo0LzZpbklrR2MwNE4wNlRNdWE0V2NlTG5TV3dMZGNxclc5?=
 =?utf-8?B?WFU4SGlCVno5aGRsY25kMkRhN0dya2ZYT1BUWTYzNU9MajVjMWZwTGhFbHZW?=
 =?utf-8?B?eWRmb1V0NmovTGpYVW5CampNV1NGcUFycWtJUVo5Zk5YeWRSZW1ObXg5YnlD?=
 =?utf-8?B?STR3YmVyNkVVTTRZZ1M2d2c1Y1JOeHo2NlRycWVjYUl2Mkt4d3dOZjhTNnor?=
 =?utf-8?B?L1NHTzUxeE5nUFNkdnB4RjQwUm85ZkZYbll1WERxQi9PbUJON1g2K1ZiZkJO?=
 =?utf-8?B?Z3EyN0xlQmRyZit2TFE5NE04VitGZGI1cUdjWWJSQVl1RWlOMWFzT1J2MjBw?=
 =?utf-8?B?RGNqSEU4S25ZZVMyWTI0WXJlb1FNdndjZGFiSC9NYzJmN29jenJZQk5DNFM0?=
 =?utf-8?B?dTFISVZXS0ZCanFpaE5oL3FzS0ZqVnRrc0FFdGtHc0FVb1kvZnZUL2pjaUl0?=
 =?utf-8?B?ZTJkZzBkRUJmS0lucEhxWXJaMnJvaEh3WlpHTmtJZEh2SHo5Q0NqR3hFbFF6?=
 =?utf-8?B?OHFGay9sQmJyQlA5cTFjL0JtMGNvd2NNRnJId0JIdHBzM3d0Q092NFoyM1p2?=
 =?utf-8?B?a3dhZnpWQ0VkRVdBK3dNSUpLMGpmV2loMU9hQkVkNG9nTElwMkU1VUs3U0Vo?=
 =?utf-8?B?TWliVVNxWTU1QUhuNVVjb05Xd09WMk40QVMxbzdaM3lQQlA3RWl6cHJSVmZv?=
 =?utf-8?B?VUV3K09jN1dtQVY2NnlnbS9GMUtkYVZwZ2pDY1d5clRMeG1YNGVXUTAzSi9w?=
 =?utf-8?B?Rk51UU5hRjRIbFpTVnRGRVFHdTlvVnpPLzBEbXREaUVqMHpOVDM4S1gwMkYw?=
 =?utf-8?B?M2phektPVUJvMXhlZnVRWVU2eUl3dHg0SUZES2lqcTRIcmJzdGlSK1YraTI3?=
 =?utf-8?B?c3g2MVlCTkNhRVQ1MUZMK2FZNWx1SFQxYmlIeUFBYTdHb1lpbUUvV1dVbWNi?=
 =?utf-8?B?OGh0WTlnT1lUd0J5a0g2RUp1MHZOMDh3cWtWZXBJdUJQOFVnWmtDK09MaENN?=
 =?utf-8?Q?NVCTWBQBeQL7nkLo=3D?=
X-Exchange-RoutingPolicyChecked: Lz3utOtInv7KkkDSuv2kynG07PnG04YBito76DStByhnw92brH3TjenD/uE0r5y80gkxnt3QeHO2/m1LuqgnSFIUp5kZ4QOiSRJnzSU6qDo6Lg2cEro5G5G8ORzYOnT/W/cIB5U2PyN0sj2e/TSHQdpmjnTmb/QD7WLbU2CRlrZt0nnsu8+OEs3dQ+a71+0HGTfXLR4tvLX8rh69nXKbb1GLR/FgyyGilG7kSNmItKPzhtp5f+h3malfuORG0ByiYkl55U2W0nZJfDy/6I5srqSK9ZwwDyjO4yrmooqy72kl3be7edYI3ecX6R8oxZdCQ6z3ZWElDJ7DOVlkz3sq4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: f706fc2a-2e90-42d2-e441-08df0dd02fc3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 17:39:51.7866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: amay3pUD9eL0WTKIb2prdE1GzcBrOMWsOfWMokXkopcVdTY/8JyIesmlj0RhUvcr3iZvmn2PaPxSn34UrW/UTRljffdLIaIyxdge3JM2ST0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com

On 9/5/2026 3:31 PM, hpp.iscas wrote:
> The legacy SST PCI driver matches Intel Tangier devices using
> 
> intel_sst_ids, but its only explicit module alias is "sst". That alias
> 
> does not match PCI modalias events when this driver is built as a module.
> 
> 
> 
> Publish its PCI table. The independently configurable SOF driver does
> 
> not provide aliases for the legacy SST module.
> 
> 
> 
> Fixes: f533a035e4da ("ASoC: Intel: mrfld - create separate module for pci part")
> 
> Signed-off-by: hpp.iscas <hppiscas@163.com>
At least on my side the entire patch is weirdly spaced. Also, I'd expect
'Name Surname <email>' format in the Signed-off-by tag. "hpp.iscas"
looks more like a nickname.

Kind regards,
Czarek
