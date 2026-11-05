Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793872340;
	b=pknETscR6kcBRJTr9L7cAaTwW8rQ2HIDynqPKXnULecoRQMr4exvAVMJfp/xTa2+fVtV
	 1D9LcdC9X1ySRSpWHPq+1nyRWo9uTxDz62EodiV8P8m3DSs36X95khTQPlTRRlVesE99+
	 p9Rkku5VnawYPr9psl2EJzTZCXD5OuwHtcwKfx3yuhBPhFnbHk+pxPCXD/al1DTnrDvQB
	 wfly1v1Ed5mlF+D5hZWxAGq+arutDTL99pBQiMgl7teAQzDm6zWoH+qj3RvCE/E8SZHSn
	 44IHlB40Jhfa5POsftcHj88FKLwwyTk6VGOSzSqMdD76fPif25bbZKGeLqkkA3wWISQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872340;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=yfipD4iCqn++6X8DGmXHo14VOdlkXmJ++ethvy84IHs=;
	b=PENnXNBpO6gObZhbqHw7kfm5Mlfcvk4whdir2RBb8Owy9Bnos2jxSvbYSIJut0gqwD5k
	 vRtv7I8nxihn8ujgbQFmvGlEGACo4pFpx9nv+wostoGvQeZL70DSkIgvW7+VxtnHeF9/8
	 vT1MrsO71/jn43BRp2BWK0zRe7ZuuXaKNZixZb1yoUPBrIHGh5vaooHse5NjlLiBJJY4P
	 IM6Vj0I4F1dgh4UoY2uxme//lhndE7bHvDpSYTg9LtKmXsihcnLTGvMiGt+jP5nt39lug
	 KAUEkmWSKVEjWTBceU0ZuUxX4WvhQWZMLkuE5p1IzAHE5JUT9Up66ouNEe8tRi/ryUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hxXK6guh;
	arc=fail smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDF7606CC46;
	Thu,  5 Nov 2026 09:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDF7606CC46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hxXK6guh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793872338; x=1825408338;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Yz8RN2EhcJiUkdOhU7o9q1wadBv0AgvFrvz8UW0LQTs=;
  b=hxXK6guhDbKLRGe+RfxK5TGYmy/p3MIhTmJF6+BK2cz5HoBWtaIaOVGO
   G+FjY4+EWf8N71s5o/sBP71LhYRdXvkJh/A39NVm3pD6Lk+PeU6PQ+xIW
   kMpTthbKnW+KTax1+bsJJL8S3TH2yyo27AF3PXzHMFaqZEU8pM/0Qjbbd
   yzDMLH5ripj0Rrh2m8y0tOj7TNDx62iKfPsq0WVaDLn/exbmoEXp418Gv
   ErEIAuGp+YXvo8rM1N6icVlcADQc8XlwxIDAUcDJ+YF37Hq79/eVJ5ox0
   o0h+rV+Px5UX+zfiI9geojesbTJfjfPfTOsXx9Cz64AL5mWBvni0iHRaw
   g==;
X-CSE-ConnectionGUID: tzmB9CvcS0+R1NvbsJ1uMA==
X-CSE-MsgGUID: pU7jYD6DS6a0VGv2fRMnBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2671835"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2671835"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:52:17 -0800
X-CSE-ConnectionGUID: Fmhu8oGZSaSBOrxsAVfn/g==
X-CSE-MsgGUID: 8gPzhYGNRgmQGO9BriL8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6845385"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 01:52:15 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 01:52:14 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 01:52:14 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 01:52:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ID96kmumi6ccicdu3VvVpiK0mcLnyuV0sQ9Ypiu7ruOydEo1rfuX6zrBdYvXqO/Fsm5L8mYkZVytxqko/AzHTriSw/SwhEKhZ88wWpy5cUsKPhjwg4HRQs6UxC4JiAzoi62zmzk2uJVDEYzMNKTLLvvt0MFEnQX//udPHxglxxg52Ffq+0o8zaWtmEvG8l2l8V6zvSTEytPK15v9jrh/SpnQoiNnnTL7yIEug88YgP0sSvyDO0HUKpU2aDC6KKu8gJhc6528YYb9ca3APaTqxYXecaLohjG3iSgLQeN629deYKAtXhDUQhrXQ/5puuD8jT+3BZY80+RFssuo4jAe/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfipD4iCqn++6X8DGmXHo14VOdlkXmJ++ethvy84IHs=;
 b=Ti0hbuDBj327VJjbNSYSlSsVawZBnIr8UrR4+LsnXY6RDe0yVs/0cPsRpsdlC7wMrnpAxn7UwCXPW4ot41IGHdp7sdXwrPmu7kRi3gfq3ZezZdXtPuf7hZqNNVIDCOOw5o1pLZz5jcAa74lmzBdjB/pZ19o6f+lp0xBQmXh8IPtBeCZyv3CjzmpOtrtsZ1DsIlh83nW7XknMN2QR1QysyEam11vLpc2hJo6w8+SG1kTKlCpl2KWITtjxlwraTAeV2B4Yp9OfrRlWWeSocRwzpp1GmYjCFOsOelnNaxdtgSRIMUA0CMya7sujRz/tM7/DnQneq5B2EaQ5otC3XKfX6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by PH3PPFCF54B2894.namprd11.prod.outlook.com (2603:10b6:518:1::d4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 09:52:07 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 09:52:07 +0000
Message-ID: <afa90f3b-5e79-4e97-85d7-3e77b4d80a95@intel.com>
Date: Thu, 5 Nov 2026 10:52:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] ASoC: Intel: avs: Soundwire support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Vinod Koul
	<vkoul@kernel.org>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>, <tiwai@suse.com>,
	<perex@perex.cz>, <amade@asmblr.net>, <linux-kernel@vger.kernel.org>,
	<yung-chuan.liao@linux.intel.com>
References: <20261103134958.2089136-1-cezary.rojewski@intel.com>
 <bcfe64de-359c-4f16-9014-5d6f8bf30c40@linux.dev>
 <9da94716-4dde-4389-9574-12f90b52e05a@intel.com>
 <d9672276-5616-4609-98c1-5b9bdd06cf05@linux.dev> <aus0GT3ht1oEY2mc@parshuram>
 <746bae53-ed1d-4881-9268-968c25270bda@intel.com>
 <259d0c79-2a36-4a36-8e7c-fa24137a02bd@linux.dev>
 <54b9b19e-7513-49cb-8367-8ef7711ac918@intel.com>
 <a5b6947e-4184-48f0-840a-ff2222be3f80@linux.dev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <a5b6947e-4184-48f0-840a-ff2222be3f80@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF0000089F.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::65c) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|PH3PPFCF54B2894:EE_
X-MS-Office365-Filtering-Correlation-Id: 92a1bf9d-c278-4fd6-f5c8-08df3b227411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261028144727099003|261021121427099003|261021135927099003|261022105027099003|261022113327099003|261102123227099003|261026140227099003|261022075727099003|261026121527099003|4143699003|11063799006|5023799004|56012099006|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bvepRGOjbgNolssAWaenMe5JAtTAmEaYgE+ymcnesFFVpoyUSaQzNGzBBNI2f+jHVVnw+QMqizwdnhV1b6N0F1KDypxcSwJLxVUxWkPM3UoyD8ZJCKb8rxRW3cVQBLlrTGlVhXyYnmyriCM+uaw2/wl2TwFf+lqkxU059MUfuJ0WaTw7UCrmh2QOmI/UFrLChIX+8kyWgJwGr2sP10rwCv9UPGUw6MD6hb2ZOXJoAPK9iL4FE+86+uaB49yyA+x8L4iRo/j7BOdypco7ikVSkKzJJaG3i7NICrcGr/+Uyi7QzZCdEGUIRkQ8Qk8v3KgH3QMZRcdYapZDL1f/AqpIIEwVZrWWZLnf9vPYrx16iiIMnBEPc7rz8gNKxlCOjgHPI0BBCxtMxqMNV6MHBQ4JNFWMLlRp4+v+WfmihY8LM42Fm1Gflqp+wcW6q8lAu8j9rJR+apP6nzc2t8BYrn2aZEyfENJDPKDdUc453LjOF1vaKrv+3NVu8nQvbIWsp3pSNKzE8477e81TS0y4MwCJthykQfX3cBpnRvDyqQTF+xbY4EM6sgGZluPyJWZbIHvkbNio7O/t3ls0UxpfnEOUU09rZnTrAqd76I7PXrax1Z/Se0viMGnJa9ssQ9L65cOn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261028144727099003)(261021121427099003)(261021135927099003)(261022105027099003)(261022113327099003)(261102123227099003)(261026140227099003)(261022075727099003)(261026121527099003)(4143699003)(11063799006)(5023799004)(56012099006)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDNPWlVpUmRmbldXTXhrWWJ6LzhqQldaZWJHblZ4V3Y4cWl6RW9RNEVSYTlH?=
 =?utf-8?B?SDM1UTVqa0haeDFiUUEvaWZyeHoyRXdhUHZnczBmMWU0ZkhSQjZMbWh0Y3RI?=
 =?utf-8?B?ZFh4QjFBR25pYnBFMWIxcDVVOGlGeUJpSzM5THo2aEFuclEzMjZYcVpkc3lR?=
 =?utf-8?B?TEdRdUMvNHV0WEE5bk9xWTgzVzJjSHc1Sk1sMmFzaVJVcHB4RE1rL0s1Rzdx?=
 =?utf-8?B?UkxiS3NYKzF2MHlqV1RmeU9uV2hGSFpCNTk4d1g3KzVxa2VDQ2lybGI5VUJ6?=
 =?utf-8?B?cVZBcHFPQjA5bU1RNWFZa2JwSmFxK1NrVFdUNW9QYnVEaXBId0pEQTR6TGp0?=
 =?utf-8?B?S2NFVDVSL1QzbVVlaDdpMnQwNjg3cEpVUWs2Wis1QVNIYUFkRmZaMVNpSXJH?=
 =?utf-8?B?ZHphUDZvaysvakdiTlBENUVSWnBpU1g4L1V0MVVTcll5VEo0Zm5aMmtFVWxN?=
 =?utf-8?B?K05tcWRIQWc3aVVLY0h3WklSNkpIR0Y3bGxNTGFka1Vrdy9nUGgwN2psT1Z3?=
 =?utf-8?B?VE82QVN0VHQ2a3d3aU1tbGZ0Q2dnQ29YQm9KTkZpVXQ5dXppZUlmUElFVG5l?=
 =?utf-8?B?RG5NNHlyNnc3OUhiVVNDVFdNdXJiOWk0UXpyU1RaRDNnTlhHc2JOdTRKSi9r?=
 =?utf-8?B?ODBWdG5idmlhMGEvbUlDUG1SN1FGdWpzTEVJaE5WVWpXTUZoOGJ2WU54blV3?=
 =?utf-8?B?R09oOEJZZTZHSmVPTWFCaGxlL0hxSytmTmJxUnNjd0U0eDdMVFBGWFE3SVpV?=
 =?utf-8?B?WWtnYWcxblVYVWd3SFNVZnVVOWhla0ovS3BTZEU0QTVLWWtRb0M5eTk5LzZT?=
 =?utf-8?B?bmx6NjNpT2pTVjhiRW95YzErMnYvOTJjVkd4TENNUG8xYk5KaWVPTjFsUHRR?=
 =?utf-8?B?ekQ4eUxOWkxRSTczaDRXNWRZUlV3UkxzK3lwbXBUWTBtbGZ3dVVRZ3crS1k2?=
 =?utf-8?B?cldtTHdzZnBqNFphNDEwTkl5dXNVSXFpWkpRdUxWbFFxckFTRzA3RVpUaVlQ?=
 =?utf-8?B?QjVhSTlhalljaVpVQkNmY2M4VUR4Vmd3WFlReUtyTUpUbmZaaUgrdVRFK05Q?=
 =?utf-8?B?cTBHMFZBeitMRU4xeXNFSDZpOG82b0FiMUg5UzJEUTFwTmZwRGJjQ2tVNGtB?=
 =?utf-8?B?UXBoZ0ZBSXdYU2Z4UXhvM2M0ejhtRTg2L1hMczhLT1MxaDlpTUFLdnZ2WWRR?=
 =?utf-8?B?eTFGcDhwV2FBSC83T1NkejdVak5ZRFdMN01jMThOczNTVXptRldpT1FQaVlu?=
 =?utf-8?B?UU5wV3lwblpMM2RqVnlsOGRydWdUUEpoN1F4NnVTdzRLZnRzRkhqV2I2eVIx?=
 =?utf-8?B?Q0JmanlTTUxRTGdlN1gyZkV0bU5zcUNBaUtJV1hjbkowOEFHUzNGS1dKQ3Na?=
 =?utf-8?B?N2tiYThWZSt6eTdqaEtuRzBFSm1DM2pZelBrTmszT2xnaC9rVzQ4VTZzYjdq?=
 =?utf-8?B?TmtGR2dac2gzKzhteEEzNUs3Njc1VzJsK284MGZUWS9EL1UrWTVPSit4Sjg1?=
 =?utf-8?B?U2FGRSt1M21jN0lxeUtyWHdFWURsV1MrSFlzYWNqaUJmS3ltK3dtNVQzTXZS?=
 =?utf-8?B?b2p5M0VObldqVE51bVQyZi9DT3pIUG8xdUJkaGYwb0c2aXY5blYzQ1FOS20x?=
 =?utf-8?B?UktFVVFwTFgxcVk3TkJJckVUbHdxRmY2ODFUS0xTRWRwU0lUa2VPV2IyNlBj?=
 =?utf-8?B?cjlYUklXNm01aFA1YzJBVlkrbU0yMzhVTlo2cUpaYUFtSklId0pBOHpUa2h1?=
 =?utf-8?B?VHRVMGV5Q0NxRkJIVHJYMkpqd0pLWWpTajJEZUQ0Z3FtTkdqRWx3M01RWEpP?=
 =?utf-8?B?YW9nVzNJV3NOU3FpQUZhQVhhci9ON3VBQmhqRGhTYXpWQjJqekFDWGlvUVQr?=
 =?utf-8?B?eWpoSTl0c3pRTTU0L3IzWGRXNExEN3JwQk9VazR6NXdrWkF1cFR4V2dyUjZN?=
 =?utf-8?B?ckdSRGRvbFdmd2ZFUEhpSERsTHBQN3crNTBtZjE3REk5Z05taFFvVGc5elcv?=
 =?utf-8?B?S2J6K3FYYmNzRHlwRm5PdVdYRmJpcDh5WjQyNHh0NnJGZTZZanlTQ3c3a2U1?=
 =?utf-8?B?cVhBamhSWXorNm9DdjVYdnNZZG9VQjRhSUpPbFN1N05qZDRNZG5Mek9GTC9s?=
 =?utf-8?B?NSttVEdxOUhxWHY3TXBvVUU0dFk2RTN6UmwxaDFTd1JOaktBK2Y2Y0xTcEx1?=
 =?utf-8?B?RStvbVJpVGRic3pMK3pxTEJyekwzMzVoamJXK0dBZmthYUJqbmlWRU93djY4?=
 =?utf-8?B?Tm00RkZzUEIxTHppdkJhU3I1RjJyOC80Rk5wVnlSamlTamU4WmhDMkx6emVr?=
 =?utf-8?B?VGFsNzZIc0JXcGhnRG1Ca2tKOVFvajllM0lXRndUR3VWRzM4OHQ3Zz09?=
X-Exchange-RoutingPolicyChecked: YpNwxphFAbenwkEorkR5ChgeKNqqkIw4dRvri3+K9qMc40W7DHK21GlL/f/ZVg1/rE4fDf6JyaLJlcx0Cn1Yzl0ZjvRFGgIrpT5wqP/8JhDF3LWrMAWn5uoqnNc8V59FjaDcAkfMIGWNGne/0auzqp5YPmMU1F692GnO0JiGTPtkNjBoYt2MgvBOkphevDqEQY75SJ1Wx4jzWfM+SfQmbRSBfT/0ijwM3mZoFPVI3BCnSo6PoM5X5ep8rXeEqAbwqTllw3Cc1ZSfG+2QQXfFOLzXupEuNxPfeIU8X2z7zTWOfBSZKlRPvufksrzGsN6HFrWF+3fe2+mBULAyePPMGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92a1bf9d-c278-4fd6-f5c8-08df3b227411
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 09:52:07.3603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaVDfL/xhZRySQWgQS/KpIdrJiqYoIbW0403rdey1mF0/xYzgSgFEOm+PqiXXM2j9g3pYKGgDXw6q6QaQV2BLe08GX4Akuueko8miH5d7kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFCF54B2894
X-OriginatorOrg: intel.com

On 11/5/2026 10:01 AM, Pierre-Louis Bossart wrote:
> 
>>>> However, I find it easier to move from hardcodes to the basic allocation
>>>> approach (seen here, in this very patchset) than the other way around.
>>>> The change would consist of updating intel_hw_params() so the PDI
>>>> allocation is no longer done there.
>>>
>>> Change is risky, especially when this touches platforms all the way to
>>> CNL across at least 3 generations of Intel hardware since 2018, for no
>>> tangible benefit.
>>
>> Well, that's why I don't want to mix the 2 patchsets. However, I'm of
>> those who is not afraid of editing code that touches older platform - my
>> intention wouldn't be to level the code, obviously. From functional
>> perspective it should reach status quo. And both teams have their CIs.
> 
> CI resources are limited, lab space and maintenance costs result in
> older generation moved to 'community support', you'd be lucky if there
> is one device per generation...
> 
> "If it ain't broke don't fix it" applies here.
> 
> There are many other topics to work on with the on-going change from
> HDaudio to SoundWire in the PC space, Linux is way way behind Windows as
> measured by all the recent bug reports on configurations with new
> vendors/new chips - not to mention that there are very few reviewers for
> SoundWire...

There is a chance you've just gained one :)

In regard to CI - have to object. Our CI hosts setups from Haswell
onwards. And each generation has more than 1 setup available. Perhaps
that's not something developers and maintainers are used to, though that
doesn't sound good.

Ah, the Windows side topic. Let me add something positive then to the
mix. This year decided to finish ~14 year _recommended sequence_ issue
from Broadwell era. That _was_ the last thing left on the list for that
project. Both SW [1] and FW received fixes.

ADL, CNL or similar sounds like a yesterday when compared to BDW. And
Windows is not using DSP on BDW. Which one has more configurations now!


[1]:
https://lore.kernel.org/all/20260528083444.1439233-1-cezary.rojewski@intel.com/
>> Now, I assume most of the discussion touches on patch 2/7, the one with
>> sdw_cdns_assign_pdi()/release_pdi(). The main suspect:
>>
>> intel_hw_params(dai)
>> 	alloc_pdi()
>> 	config_pdi()
>> 	params_hook()
>>
>> is a DAI operation, represents dai->hw_params(). The params hook is
>> there to give SOF some location to send IPC from. If intel_hw_params()
>> is split, there is no need for hooks. Such hooks are certainly not elegant.
> 
> The reason for those hooks is not technical, it's due to the split in
> the code between the Soundwire code in drivers/soundwire and the
> controller in sound/soc/sof/intel. There's no real other way to send an
> IPC from the SoundWire side, it is what it is now.

There is a way - let platform DSP component (ASoC component) do that
instead.

>> I believe the way forward is to convert DAI ops present in intel.c to
>> library-type functions. Let platform components call these. Frankly,
>> except for our friend, intel_hw_params(), one could say they already are
>> - perhaps the whole intel_pcm_dai_ops could be dropped.
> 
> No, the intel_pcm_dai_ops was introduced to have intel-bus-common define
> a generic behavior for a stream and the ops hide hardware-specific
> implementations between CNL and LNL. This has nothing to do with the PDI
> really.
> 
> There's a second level of indirection to send an IPC with the
> dai->hw_params, again the implementation is done differently depending
> on generations. Note that in theory on ACE2.x SoundWire could have been
> managed without any dependency on the DSP firmware and thus no IPC,
> unfortunately decisions made by firmware folks result in the need for
> this IPC. It is also what it is now.

These ops pair nicely with SOF. Other soundwire lib users do not use
them at all. If the intention is to share, the "library" approach is
what's going to make this happen.

Yes, there are differences with ACE2.x, I'm aware of them but all in due
time. One step at a time. Library approach makes this much easier
though. The DSP component is aware of its own (HW) differences.

Once again, I believe all below sound very reasonable:
	basic allocation in form of assign/release()
	dai->startup() as lone resource-availability check
	dai->hw_params() as lone resource configurator

Hope we can settle on that.
