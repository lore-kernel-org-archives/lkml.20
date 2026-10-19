Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792442748;
	b=nQ6gyT8NklsWYVTQ6GzzmcFEQtsOTdbPLTwPCCte/Ev5QX6G720+TbW5ISGIn8hyU/PM
	 h9rUS0Eose2n1J0RDactQ1UySMaVZqn23lVwTmFgTZ7AqG4GxaIqT38RojJRhhwinwULG
	 e7QN3B4dnktTpx778LZ5IXHVobmiO8ZDg0MRscHbJd8qAH0eCty5ta1ty1tJ3RZgKrmrp
	 qmEMgIwKif3ayfNDKsf5sVOaIgpqFu2CpRpwnQfCM1+gUwedhSrfZn2QUJ7CRBNCuyq2l
	 E0MhP1Rc+7NpMBz2d2nblhQoXYmwtr7HZNULJ9kwZ3eNTckMLIQByAzvy9FbszJ1O7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792442748;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:
	 Content-Language:To:CC:References:From:In-Reply-To:Content-Type:
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
	bh=W6n1hO/rKe2l2d65Bt9EY6aSjlBIPaimaw+3qarpePk=;
	b=nRR7BYSm8OAkHWcVBO61o+mC9S3mSolbkQ3/9ZTuu4lypzZffaW2GUD+ht/PKfSYyFZK
	 uM4IQSLyfzpeieDsJty7Vkvju0WGjZYN0XTsqvhjTdmfC06Wi3n6W8UO41c1eEMbV4eUB
	 DVuXV6IoYjfV1ioYL79XaCfwMW3+dnvqsUOrSydawi/DrI2lO4G4SX0QELrD5NQw+f8ot
	 rgiIV4YIKJD6Bg5JyZAiZXb1AN0PlMGG2/q4+PA1su4zIOP/YyUFHnAkjsdhILIzMQvNF
	 Q+eFQEaUpwPrpPsVJ34gt0H9UIWmp2dykP2EvzrxAyj8o4+DT5glRYpmsAr37XPSaig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HlWrQrou;
	arc=fail smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066B606A325;
	Mon, 19 Oct 2026 20:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E066B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HlWrQrou
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792442748; x=1823978748;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FQEQ2+r5ffpENWPL+FM1kJP1WpTiiiyl4P2R/f1egY4=;
  b=HlWrQrouHOY+HTvfJWjfFtrbNLvPYGyclhzTBIRexqYuOUN0MV/MiakZ
   6DC9wOSsC0KjyIQTIES/gSum+k7j1kkydkSx63/bQbUhJFbVVs6DAqtjB
   hKkS3kWZFftHbZ41g0JuxUHsv2Rs2zM8y5M3k/lgJEQW+TIG9e2aw43dj
   Qg+ou/tqu76szUCyxDomyk5cFAy13lptzU9lOI1evxCiDN/i6T8edx0Vj
   03uttwMrjyYjIHSg+2tEqxVOM5BmyhCLZA8cfVL8LjINb6FFnafYDPkBd
   YdvGIiz1PB1JymOcva3t/prHa/APyOgC4WfVi4YqHFgZq1nSOwmPz0507
   g==;
X-CSE-ConnectionGUID: Lfh/yL3LR+qYmLzHcTSvWw==
X-CSE-MsgGUID: SVnjFa4fTPy/f6zSgdSJpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1041426"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1041426"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:45:47 -0700
X-CSE-ConnectionGUID: QWiAikR+SpihhUxhRrILsA==
X-CSE-MsgGUID: 4EdZMoBrQwqOr96jh4mcYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2683872"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 13:45:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 13:45:46 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 19 Oct 2026 13:45:46 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 19 Oct 2026 13:45:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqhyQGW0MmzStF+5/lFI8X7gl45NURA6AympaXm+I/peV/Q9NV4RCW/CRaFsRKbWaWUlNjHbM67EML4sGDfb9/uHu4hZ0C0axJ9rkozjIciAffL+/sOPHlC+PyU7UTdknC5ZH0UGcGoVHUxBODMqHV5DIdqWaI79jyYKD6yjfrlIuJ2oKgc1CJ5AACpu75aZ3ab28Yl3cpfKSP34sRnjn/yZD+n+x6rCPxIRxRducQqRGplfP8P0SUGU4yNgztS4lEA40uLPNCeY8g2axsmrrJsqiel/O9GbQtQ4I+GuNj85oVVyu9XQvRLbUIMAXao4Qu6SWJiKlJ3He8Q6ZSVZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6n1hO/rKe2l2d65Bt9EY6aSjlBIPaimaw+3qarpePk=;
 b=mEPWq7iZUUmG5DK6K+bIth1l9XnwKYMHxulphiVmdUg7pBHlXdOWZ4bqqjUnKJMXwX/v+xefPiQRK85mwlH0NxRULDBbUcLmmEERjINZP3/mJCO/hKxUmqErFxDrmCpUpg3V2dP/j8aW5DWUyA/4cHo8+ac80vQ44M/Lwm04v6ci9uAZdT7sRSO06RHP9QZGehFIDi/4IOFh2EmCk0mKjsdBONgPgukfgaQ8bhPAYHeAz7QanwI8HRbkBppHzzRjSUiHhGP2HU8QEiDvoOApnzDpvF7LTBHb9+2y/zvATSbSsyC5BwH/AuQScvzifkADuJDVYSrAKPI4h/+5MjndSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 by IA4PR11MB076721.namprd11.prod.outlook.com (2603:10b6:207:10c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 20:45:44 +0000
Received: from CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395]) by CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395%5]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 20:45:44 +0000
Message-ID: <7886e7b1-95fb-4338-a7bb-b6bf1da3a634@intel.com>
Date: Mon, 19 Oct 2026 13:45:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/mce: Do not treat cache hierarchy errors as memory
 errors
Content-Language: en-US
To: Adrian Schlegel <me@adrianschlegel.com>, Yazen Ghannam
	<yazen.ghannam@amd.com>
CC: <tony.luck@intel.com>, <bp@alien8.de>, <x86@kernel.org>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<kai.huang@intel.com>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
	"Dave Hansen" <dave.hansen@linux.intel.com>
References: <20261003222012.19685-1-me@adrianschlegel.com>
 <20261012193305.38931-1-me@adrianschlegel.com>
 <20261019153207.GA144824@yaz-khff2.amd.com>
 <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <DM914GO4A8WW.Q7YN7ISOQJJI@adrianschlegel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To CY8PR11MB7846.namprd11.prod.outlook.com
 (2603:10b6:930:79::14)
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
X-MS-TrafficTypeDiagnostic: CY8PR11MB7846:EE_|IA4PR11MB076721:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a353ce5-7d95-46c6-0ba7-08df2e21f23d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|18002099003|10067099003|22082099003|4143699003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 8Dj00t4GRqsSgykqB8nsiLR8PKVAKzC9sCfnLnebS5E2DsN0FCRlcoqA422iG0DoOu5K9Z2tAuG8H1oiyTnB+K/0kn2X/Eez9cDp2Cjks9fXhvSzK/pCnuqctEOMhv6YEOzBZehSoiHS9vqLZeUCHXz1/Ujobbv3mHSn8nOm89xVS9hjj0zcPb28gKAoMXe1AOSNU7gXnS3X13/HhvRAKy6LResU/SJOOob2wY3tBwC0du6p3tQ8DoG71qHn3ayhE6Aec+xB/VhpXk8aTVFjowRyZ8jDGxCFefW2c7Ias52cF4UWM/GUezwQCJo74zgnPo4YTa0TwViRCluy3i78nBug9Yw2B5ajxuEbL80m5uIj1Lhp9jpM1k4KfzrCFno5RVFZc79zw2rUjgNz5QfhXSqvwpNtOyv3bB0L1mzbr+zok9HDtM7uPFFTiXHcb7TU0QaOMpRXMR4YOew/tdElBIy/kfJx2dj0q0eBm/aVEzqJOQ7AZ9AhhWRTMPzjiwEiAkUhXbiN0M3vVYXWNvl42gQuDP+/sBC3RjbGbY6zoGgZNPtDvuliCrL/7j7HlxEYYFCCIchByAQEt6y2zumutOcbRrPC64ZxP7IMTkAZyNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7846.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(18002099003)(10067099003)(22082099003)(4143699003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aklKVlQ4QzJrbmlHdThZbFVjbTQ1Ym4xSHFRU1lwU0V4KzE0VDhqbUYzaWt1?=
 =?utf-8?B?dnVDeGRJa2FXN0RRUGVQQ0hUUzk2YzJhZ0Rzd0V4OFpETERPMTJrcmdOKzIy?=
 =?utf-8?B?dHR1a2QxMlhXSlRySmFTSTVJdHF0Q1MybDl1RmdZVGlNY3ROU2FYMEsxbCtC?=
 =?utf-8?B?ZmFWWHZma1JqUWNJNEs2RkZROGwyOVYrY09zMlFmRFZLNjdmVGp1d3BHTXZE?=
 =?utf-8?B?MFNyZStRWGhtK1A2SmhuK3dlOXlmbnF5YTlnOUc3UXd6OWFodGlLKzliQlJo?=
 =?utf-8?B?OWJnbmNxWWk5cjFrMCsyMEh5a1NPamlCS2V5dEZGb2FGUnhCdnpEc1dIN1I2?=
 =?utf-8?B?OXpuV01qamU4eXBTTW43RndoVmdDMWJNWWNpcjZmelZaYlZLSkh5am9TVHla?=
 =?utf-8?B?cGNLc1ZQcEFuc0tIejB1MnJrMmlsVHNGNk10RU5MSG8rSGJxMCtQU25RVlRu?=
 =?utf-8?B?b2Z2MzcxTzB3UzhZM2kyRWplWXc1alBNeFRJeGx0cFJmMnltY2dpZUcrcGtx?=
 =?utf-8?B?dE9kenJYcDhCU015YmRYdGJVRzF5cWc3c0lIMnhvcU1GZzFYbWxnTG00bXRu?=
 =?utf-8?B?NmpYLytiQzV6NC94emo5OEVmaklGaU5zVGtDNS9NNjBkOXlZcHZXS0IwUjhW?=
 =?utf-8?B?SEJmekRJU2N3Ry8zbFBVN1U1NFFOc1VVNWtNcDdBaFNFVXJnYWR1UXJTcXR0?=
 =?utf-8?B?ZWNKTmQxRmdjN2pMeExUZHJNTElEdTNIR0hpdjlnNXRSZ1pHSTh4RDdyUktW?=
 =?utf-8?B?RVFmVHRacU5RMDZ2ZDZtRVdGM3BxcjRrYUlJMENnUkRzcnBFME5iTXAwTWg3?=
 =?utf-8?B?NERHZW1mSnRWZGF6SHgzTGNHeHhHVVVJcTdCejZWa3plNVdKMVBFckFRbVk5?=
 =?utf-8?B?NEtFZURlVldhanc5Z1VreFJQY2NnL1NHaUcxTEhxdjYzbURDSTZJWkNyalhz?=
 =?utf-8?B?aDRiSFdkSndwaklGbzA5ZDV6Y0w5OE82VEZXTzRhbzdPMXZHUk91OGx5OFRl?=
 =?utf-8?B?SEhMS1hiYkgzNTdKMHhwbHZTVUZ3ck43MjN0N3pFYUhSTDNuTGxJcHF2cHNj?=
 =?utf-8?B?cGxhQWdLUk9SUCtRNUNXTGJOdG9yV1VHaHhOQjZoUnI3Vy9hM2VqZlJXS2hv?=
 =?utf-8?B?MnBVRGM1NE5ndHpwTW1CR3d2b21BS2Y1TW45bXBaeW1LUmV5dGhlTVNCWWRz?=
 =?utf-8?B?TFQ3bmVxSEdScGZIZGhRNTdQOGZzRHkwa3VhSVNjY3RBMit2aTJvRWorYldr?=
 =?utf-8?B?UmdHZHVYT3p2djF3MGpnN3A2RkRJZXJjbFdwNHFrRVhJSUNua253TXNpMTls?=
 =?utf-8?B?R2I5MXBTaVdDb0NYWGs1ZEx5WHVOTGE4UFRCdEdDVmdnQ3RTdWplMktrQUJU?=
 =?utf-8?B?c3V4VElqSk5uOFFSVS9oN0UxMkFqQVcvaUNpVnpwOG5qVlV3b25Fa2xOMXJ6?=
 =?utf-8?B?cXJYdzJsZ0pjbFl5QlRJMExGUjc1b2N3VnZNWnl2MGV6MU1rOFBFNnc5cU9h?=
 =?utf-8?B?M1JBT0xqbG4rUmxudFhYcUQxWEhvWFduOHcxR1h5TndhWnhXUXNySmdMa2VD?=
 =?utf-8?B?cE5ucHlaN0ZMUFUvS1ArbzRjaHd6dlEyblZMcllGdDB2QWxQR1lEU3JmS21k?=
 =?utf-8?B?MzBtMUoyZTVCTEZtcHFVY1Z3c3ZkdmZvcHVGTVpFaUFiSGRuVUdBTEFqNnND?=
 =?utf-8?B?UkMvTm5UU3c5SVZvM2MydUYva2poUkFhZTc2TlFDalBwSTJqZkJWMWdWVWMw?=
 =?utf-8?B?RlVwNlNVN0lRTytWc2xvZWw4WDQzTlF4QmdBT05aa0NoOXlUamwyL0x1RkVz?=
 =?utf-8?B?Zmdjcm5rVzJkZ1gzK1BEcDV5Q0RnbjljbEZDbklNck9wMXNTMTJZWS83MUlK?=
 =?utf-8?B?NXE1czVxSllMUklRNDZxdWFRZVFVZ29HSjNFYVZVSmh3TjNsdUFhYmlQSXRS?=
 =?utf-8?B?bUxBYmlheERKU0c5T1d5eU5HKytZVHRGcW00MWgvNVdjMHJGNTFGdDFoM3JK?=
 =?utf-8?B?NnREb25UVElkQlJGSkcyZi83VC96MkgwdzFQVFBQcmpiKzI4cklnN3hlOHpD?=
 =?utf-8?B?QTFjTnN4V1pwa3FWdnQ3TEdVbmF5QS95T01zeXJUeFhpbDByM3FhWGVDOUMx?=
 =?utf-8?B?aGFoTHRYSVZBdy9KK2dnQXFLaWhSZlJCMXFQdTQ0NUF3YnRKblgyL3E1YXRM?=
 =?utf-8?B?OHlVK0hVekFldm9mZjlXaTUzcGxiQnlyRmlwYjVkQVdjRjJsYVlPdUE0bnJz?=
 =?utf-8?B?N2gwVmgrMno4NnlveEllejNxMHdUZm0yNFpkNU1Tbm9zQkVHSHdmaU1qTDh6?=
 =?utf-8?B?bVVOaC9YSHRQeUdjbDl4YnQ2QU55ZWpRbWh1NEFqS0RCMFEvVDBSQT09?=
X-Exchange-RoutingPolicyChecked: dpqKMQDxaI6wls6BZBwZsf3HKwIpVzB6OFebfG1P3kCaPN4Olll2wq+oqNjDKhQuf63Hga6nuhdmCptIMD5C2lzLsIdolx0ExqrBBgQpeXpzvZnIcFATHxc9fDjM+/vxSQc9PLZ1xRoTHMwqe9uIPZ/C7S61qpXXANXUW8mKd/bSN39siTBbdQUIYpBhyXWToWOgqHRXJ253b+C4zMcmx6+27CQg2v2D2Ug5af6n5kBW4HzvLfu1OvfFdNPqBOuYbKYxmQhc7V2W/KDv9kKgzlO3Xdf6aaRM3uN794zUuFR/Nw8WvGXBQrLR5E+y0uVjzlBRxsiZlE+k7UF7cC+xRA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a353ce5-7d95-46c6-0ba7-08df2e21f23d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7846.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 20:45:44.4354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eLprxTqdSstU5XDaCYcK6JlqlilsD/+8sqBBcIWnkgQyM8iYYQ8RG3fi0bJnA5Z6SR7uJzIfTC2SVOvy6IyrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB076721
X-OriginatorOrg: intel.com


On 10/19/2026 11:34 AM, Adrian Schlegel wrote:
> On Mon Oct 19, 2026 at 5:32 PM CEST, Yazen Ghannam wrote:
>> The SDM also mentions "Extended Memory Errors". I guess these were left
>> out before, but should they be included?
> 
> I don't think so, since from what I can tell from the Intel SDM (Memory
> Controller and Extended Memory Errors), extended memory errors use the
> same encoding as normal memory errors, but report errors in memory that
> is used as a cache, similar to what cache hierarchy errors do.
> 

Yeah, the mismatch between the code and SDM has been a little confusing.
It might be worth adding a code comment or a changelog note about why
Extended Memory errors are not part of the check.


> I also found this thread, where Tony made the same point:
> https://lore.kernel.org/all/SJ1PR11MB60831E048B544C83E845D907FC8DA@SJ1PR11MB6083.namprd11.prod.outlook.com/
> 

Adrian just added me to this thread..

But, the TDX issue that Sashiko reported seems valid to me. It may only
affect early TDX platforms. So, adding some TDX folks in case they care
about this change.

https://sashiko.dev/#/patchset/20261012193305.38931-1-me%40adrianschlegel.com

Looking at the comment on top of tdx_dump_mce_info() and commit
70060463cb2b ("x86/mce: Differentiate real hardware #MCs from TDX
erratum ones") could poison consumption be reported with a cache
hierarchy code?

IIUC (based on the MCACOD_DATA example in the commit), the TDX error
line will no longer be printed after this patch:

CPU 147: Machine Check Exception: f Bank 1: bd80000000100134
Machine check: Data load in unrecoverable area of kernel
Machine Check: TDX private memory error. Possible kernel bug.





