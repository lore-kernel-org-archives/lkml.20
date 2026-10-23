Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792799756;
	b=bhM24g7idm194N4mPVeqvp93Mniab2Tf0PGI+dYZ4e3pEat9M133oosxC9VUXNf/VP46
	 V3wIC2/tW0x+bSX3omJSY1PFnyTHPV4r5Kb9Tvp3RXx5q3mu8QYJze65BiQo0JGz7Aorn
	 dbsmON4wEG9DnK+fUdpx4BsC4FdfT1JdvfZhBON1ZWcOec+o4/ubFuztcToTTAAnRxlNf
	 zzb3/6cPZo65AuNKIpekmC3REyo6xep1ZRRLUKd+JJZYG7kneJq67g+JeYLFxOB5cGf7u
	 hiaOFdXZKI/MxVfVA3DepopUmEXVphWL8xoMZeTTMJSI+l+yRQYedEJTgssTbWXu/JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799756;
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
	bh=Vc+TfOfOFq/NgwWnnjIo9V95kZ1tWJ8zYfuUWonski8=;
	b=pmD751RrsN2/ZdAspom+8I1t9smCwZrR6Ma0yHI4RZ76LXk1hwW2+zKB0YLUNXgkiEQy
	 CN/j3qq//O4YveNyx9bF0J+aesikAh8qBSMtI5Q4raZz1pPsDfe7Q92zMC53Qe75Jysy0
	 FBR+FTOcFm/Bbp9aUqPnf1zsVs5K+4FH/d9H0ayRSinn3Vh8IAJSM2VnJ3a1spOIJR7uS
	 QEVcT1G5aUEyN+EI24SYV8mnaKRJP1AdCWZGsD/g635GNYHdaV+cAikiR7jB7xbXRwZS/
	 dEuIwDJqW8Oj3ukdLrlDuNeAeXIeNYaX9IqZiNjOfXA/rXIpeU5jVgkZUdcdnmeJcEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vk9Uko8r;
	arc=fail smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010CA606A328
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:55:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 010CA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Vk9Uko8r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792799755; x=1824335755;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2iVX3WDZ/lTL1Hq0PEI49i4z5AQqEq32Y7EbYlV16lQ=;
  b=Vk9Uko8rcssDWw0AyS/dlNHPX/o0cj3VrZyT19icdZllSVE3cKVJYEhZ
   CfkkP9kMJR9W9ZG9crwhVYIJ0jdn7xo7CyzIKLDedDgrRZSSKmTKNad6L
   BmX+7awxZ8SH08bFd1yFd3r7tV0nkwDbZZxN/pgjaqIPWjmdLRKQOrrwL
   imfUpxKVkhpz3h6VzGrj68gCIv7DpdCahU31Ai8OYaKC8R6DuMBdmHaJo
   3OHMLggIsJwjl9M4XOs6c4fNx0Eu3sAZaNp/eKQH25UXgcfAJiY0EvdJY
   HHj+UBEqshbr2nCHF72Lekm21rsKGBVsKnpcFu/RN8MQ/Z3tJe1lwW3Pk
   w==;
X-CSE-ConnectionGUID: C/mRl7xfTj6a0HB0iIdv4A==
X-CSE-MsgGUID: eP5ufxMBR0O126a987Ve1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1459528"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1459528"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:55:55 -0700
X-CSE-ConnectionGUID: M5FmwZx0TAOgL2uLoo21EQ==
X-CSE-MsgGUID: iqzgVyLYQpS0OQdQXki/Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3868995"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:55:54 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:55:53 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 16:55:53 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.69) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:55:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pnJbqxqGYSSjjRntCSQeM8+G/i1B1HlyFH1bO2yOMg5Sg4I+TQ6Dlajt4mGldMYE0tpN0zongBNwAvlmFkeoM7Cb7Yf8FLglSuCVOF2VPy3DTrMfqF0YgireYs0AWkLJUGeZVToLMuISDvZV91V5p1yoHcdmX6xAzqkcLqc6QS+7JGLts59UEJBhviVnHRFqgl09G40EgDcyo+gzQ9DiWtPd30GNbuulOcO1HG2DpcCuhEPocxba4Nsu4RaDhw1TSm0WYxOY9JtijDM6ZaiBjkz1yH1rS1rUPycUIBwdKgX69dC2+erE6AykEDaBTkc/D6OjPvOtAm0Cu8K8inr6ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vc+TfOfOFq/NgwWnnjIo9V95kZ1tWJ8zYfuUWonski8=;
 b=msG9Ionfywx9DpIeDM49PcaiIrkSJpd4rX1O3fxxjMb/rU32z2gtE4M5w3ihj4IwitTXAvhgl6UCZy2xR2xRl3hERrRhMVxoYRrwPa56VGNEOHj06IU/ykoTsNAnR6MWVM/q8bc11/nwCNY+L6qS9bsQsdQdIEwAKI8GndDfDIs+JpNDysUyR6JNGPAMh9LHWyDPpdKfSoUe8xmZuqfeaqrsEElgtD4CltCXYwVLSRnQEkGgt6hrN4saMkJvS88EXTXGspyWJOTFjEzBAtBSnOPQJnCpoAEzdQZ4vYpQsFEoAubwZDV8ILcVRUKSE347vPNCSsDIEw5y9IsWdG54KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Fri, 23 Oct
 2026 23:54:08 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 23:54:06 +0000
Message-ID: <40ed95c5-a103-4139-a802-893c4bc8a497@intel.com>
Date: Fri, 23 Oct 2026 16:54:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 04/12] x86/resctrl: Do not enable ERDT when Sub-NUMA
 Cluster is enabled
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <eefa12618e3be5b5e19a88a343d192ab8d9049ae.1791933001.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <eefa12618e3be5b5e19a88a343d192ab8d9049ae.1791933001.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::16) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS7PR11MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d049eb-a507-438c-728d-08df3160ec58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016|23010399003|6133799003|22082099003|18002099003|10067099003|261021121427099003|3023799007|261022113327099003|261022105027099003|11063799006|4143699003|5023799004|261009223027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info: bvOi1uNJFFF9Tgen/GAIx00hcI6UGq+w7g0KG99x8IVHOHaoxbBr/DgiugQezvDg/bx5B9Fd2ngHAP99QdjjAqCUv4zrNeWASOb7X20Y/iOAwh0qiHxryURx82PSZ8Az2S5xZQ2N8bpR3jTk4YWg/6HzU2Y75zDZEvLkgom5k1OwxoPMZaMpqrUdO5qA2X6zIB3ZM3yFdxKxE61yUz/vSMgQSFGKFG9gy+eiJhvK1ZxdSk078xvyZSpyZwavkvL0BeoNt9QmHlXHA1WBBGl1if/Nsp1nkxm2UsKDpO/i4UAx++QqmKGn5zo0eAgLl6X9s+uB4lJRP2yX1h11EG5sKhz3AkflpifbycQwxEHjf3OidgoIGpxOwpeAsR9TpQVZUN90tccswhDi1fL2wMl06Lb1sDRzb3eW9Ag4Qei7wM76b15x18MjUGw/lAv28/6y6/tzGqGyPrh2Rb7XGL3Pguzgcqxnx2Oi3seTtX87W57j+wmFEFbYW24d0KHSThno/PmNnPch9ItPPAIv8+ab6/iq4rAUctXGJL9D0BNK2XAQ+SSYyfU1yZ3GpHixtERNoWUev9oSv+W1CiNdL7U/qFXT1D+8mEIhnJ9ggY3l1BXTSY4em8r/3gaRDzrXkR6GciaJ0iGftk3/S4X375Q+fJcnBAmLAXC9nQtWNKI2pLM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(23010399003)(6133799003)(22082099003)(18002099003)(10067099003)(261021121427099003)(3023799007)(261022113327099003)(261022105027099003)(11063799006)(4143699003)(5023799004)(261009223027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFJwaGEvV2RDbUpCTzhFTVNFejZnK3dFa3R4Tk1lZGRaYkZkTy9ZQXhMS3pR?=
 =?utf-8?B?U2lyTktaNkZCQURsYzFacjJHd2F0cDJ4bTNSdzNiUTdDeG1lY1h6VDFXYk5h?=
 =?utf-8?B?UVNwc29Rc3I3YnZTa29UYWNLR3FXOHJ3ZTRwMVg4WkVobkVWc25Kei9GWFA3?=
 =?utf-8?B?VDZHKzRrWVZ4TE1yMjJCQUw4Qmp4cThHKzJrWERpT3VuTk5LZ3loWGtmenR5?=
 =?utf-8?B?U05mU0cvK29CNmhna2tIMmVsSTRXenZ5L3ovVkd3VXpoZmtYTkk5dU5wdEVS?=
 =?utf-8?B?dUlGYkMzUDMxWXlYTlFEbGNvRjJUWUNITVNaUlY1YzIrMlIwTm5OWk1zVGYz?=
 =?utf-8?B?TW4zMzZNRDNVK05ZR2FITlJ0QjFoSGtsMVFpay9STnNNRHhXU044ZkFTeVZi?=
 =?utf-8?B?dWVBYTBTbVRQZEltNUFhZ0l5djZLSHUzazVDUkdMRVFzbW9kcDFELzFnelpI?=
 =?utf-8?B?WlN6b0s4Tkc2ZEVobXZndmpOckVJd3BwVHhwcUVabjZoV0hXRG9wdkhOQ1I0?=
 =?utf-8?B?RmNST01hWGdraUQ1M2NuRjdhZEM2aWZ3YWtrdXBRREdvc2lYZ2VpYi9lQTlR?=
 =?utf-8?B?Zmd2TThJV2w0ZXNYOWlSVDJKaHk0c1drcFNMbGx2ZWRmRUVWYnZZMklSZFRz?=
 =?utf-8?B?Z1BvQXYvRklyMzdycUtJcmJuZHVEdytqK0ZrKy9PTnlucWhaNHhFbWd1ZEJv?=
 =?utf-8?B?cnpQdy8wanpGd2ZDOFIvakltRlQ3dlZ5YVlvdmkxaGdQSzBNUFVBeXljRUYw?=
 =?utf-8?B?bkdwZjZUdU1KMzBxaHRtUWhPVEFqNERJUzRtTUl6WUxmcGdaalQ2MjJDWk5W?=
 =?utf-8?B?WEg2VkV5T3gzZy9aa1dVSnZQV3pCVEFRaDdDL2tSMGppdmlkbjhzTUxmUG5B?=
 =?utf-8?B?Tjk0WHZ1elF5eFNXaWJyeGlSSzdXSG5xWUh5dnh6SUFNWi9SWFlnaUN4bHhi?=
 =?utf-8?B?YzA1QlgrQlVjZElCMnVGSmFSMytjWnBjdEtHWkVySjhCY3Z5a0hURmpxZUIr?=
 =?utf-8?B?LytCbjZTeXVHQTRTN1JoejFoS3VxTzRGMVpSU2pyWDR6aUF6SXpKbm40SytV?=
 =?utf-8?B?d0RsMTdUVVVWaGp1TTVLdlpOejZaYndqL1JDY0xFZm1wRmFZT1BiUUd0ejkw?=
 =?utf-8?B?WkpGRjBYRklPemhoaVF6M051NUZmWGZFd0tYVE5ZRm5NbkFZLzBhdmlHbHBx?=
 =?utf-8?B?eXhEUmFuQUtqV3BRenhYN3Z2a1M1cE9qcW9JajZuNk4zRXVnczRTaEhPeEtR?=
 =?utf-8?B?N28rRlV0cUxvT2k5a3lMY0xpV0Q3c1ZPSDVJbXdlTWNaTXhoWjlBNzVaSFdN?=
 =?utf-8?B?dmY3WUxGeHhETCsvaStGbGk5YmdlMHEydW9jbkJjaHNCMzZrc0svcFZvQS9G?=
 =?utf-8?B?TjFwek5JNWFkWEQ1YVd6bjRyd2FGTlhoSDRvdThxNWNpMms2WGRVcFBTWGlj?=
 =?utf-8?B?NDRERm0vTmNSWDFxNTR4QmtkcEpPTVRlbGw5ZUtWeFpxREtkczIyZFVEeThE?=
 =?utf-8?B?MnpMbTdZc2FvbW1oYkcrcEVGMkQrR29yekE2WUJPTUh0cHFJbWZqcENrNVd5?=
 =?utf-8?B?TkNXZUZrZ0t2Yk9qWGdtcVRRcFJTSDVHbVRDd2IxUXVWTTMvMTMrcG1RK1kw?=
 =?utf-8?B?L3hiaFdUWnhidlcvU1FGMkJFQk1PbzJ1cXBnZnIzT2NhNnlHODI5ZzdSeU4w?=
 =?utf-8?B?MUhTZFpQclNvSGhYbHMrSHpWNm1iMElwSnd5a3lJc2puOE9NV1BSN3V5U1lz?=
 =?utf-8?B?eHZVSmI0TWhvSFZUWkowNUt5c0tneGk5M3EwUUhPTUJBa25yNXFZY3R1K24r?=
 =?utf-8?B?Y3VpN0tBWWlKQU1PR2JCcXozSExpRFVYYzFNNUlMTDVTbVNtdjVkUTBKMUN4?=
 =?utf-8?B?Ykl1VkphclNsLytncWhXSDBaSURSMlFFcnIxaHVPS09LSlJESlh6RU1rVVo5?=
 =?utf-8?B?QjkrajV0azAyL3lyZjl0Qmp6UjVDaTV3VXJwSVl5bElpb3lGUVJLa3ZvUzln?=
 =?utf-8?B?bXduRElObHFNSnBlNmVnOU56VkJVWDJPMHdGTUFpZ0NIbS8xcXJ6ZHhyS3la?=
 =?utf-8?B?ZEJkNld0QlhxVytUTUM4YUt5Y0tjL2EvWnRnZWJtUkVtZDloWFdQVXUrekk1?=
 =?utf-8?B?NE5US2RIbXcrTVRyM2ZMVktPZkl3cEtkcVl2dU1Fd05GWWdDcCtKN2lmYlU4?=
 =?utf-8?B?NnhUNm5GTE9rU2dFQ01WUk81R1lWblNPYldwV253OUhteUNVMm5NVWpGTGZI?=
 =?utf-8?B?dVpTTkNWRnZEc1g4NDh2UzlzQU05b1JYYjZpd0ZYek01cngxem15T1h2OEVh?=
 =?utf-8?B?SVZleDdQUVJjMnBIUVF0bVpOS1JNZ1pJblR2S3lCNmZEZC9uWXdQNFZRUTdo?=
 =?utf-8?Q?7dIrh9PnkggtlGGI=3D?=
X-Exchange-RoutingPolicyChecked: mdvbJG/2FwTo/ORTiSKi0yiWWIIUweED/WJA9rz7iKWs4Cz6jr/p9RPkd0m6p5XuU0tLbNS3tpVsaaw69kX1zeV3KrvwFFNC+5BHt1j2KGoigDfTLMywJ4DwqOLQ9o/mqDvOs4Xzxo3/h2k10yB9YfuA2UNq5x4jDecGHhZI2CgveBkVu4TPpiEjVy6nqzb1jjuAdEV1YxrOn0jUF2raNQyhVXYJE1jwrGOg1o/IfZfLKqfRGfqvrq2nTU7iPwt1GGVL+vyyEeRg1UojqHE6NYHzCGE6vfJNvMA3dgeXe8BRKBrtA20NeB9Rj7dvzY69N3u5geJyde8O0ENWuq83Gw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d049eb-a507-438c-728d-08df3160ec58
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 23:54:06.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tv6nN0LEvFIWnYgcgG1aPQtnVzyFiCKWaPsCzuGDBbbn+1ujQX6U9qccD014n3clo5+fLJSlQ1Yl6uZ3YT0MKbKTKXKMV4U4vCGPV3Y1R4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/13/26 7:58 PM, Chen Yu wrote:
> ERDT cannot coexist with SNC(Sub-NUMA-Clustering). The definition of SNC

"Sub-NUMA-Clustering" -> "Sub-NUMA-Cluster mode"

> is to 'divide' an L3 into smaller L3 slices by mapping addresses to
> different L3 slices. The current platform with ERDT enabled has several
> L3 per socket, and it will not be divided into smaller slices.
> Furthermore, ERDT has only L3 scope for the CPU agent, and there are no
> node-scope domains.
> 
> snc_nodes_per_l3_cache is calculated in rdt_get_l3_mon_config(), which
> runs after erdt_init() has parsed the ACPI ERDT table. Introduce
> resctrl_arch_update_snc() to do that calculation and call it from
> get_rdt_resources() before erdt_init(). Leave ERDT disabled if SNC is
> detected and keep using the legacy MSR based CMT interface. Do this check
> while parsing the ERDT table so that platforms that do not provide an
> ERDT table at all stay silent.

Please do not just narrate the code in changelog but instead describe
at high level in regular language what the change does.

> 
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---


> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 7fadfebb5312..0ea888807bd0 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -1018,6 +1018,7 @@ static __init bool get_rdt_resources(void)
>  {
>  	bool ret;
>  
> +	resctrl_arch_update_snc();

"resctrl_arch_..." is the common prefix for helpers found in include/linux/resctrl.h that all
architectures are required to implement.
Is a helper really needed here? It is just one line, could it just be open coded?

>  	erdt_init();
>  	rdt_alloc_capable = get_rdt_alloc_resources();
>  	rdt_mon_capable = get_rdt_mon_resources();
> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> index eb5e262e243a..d94c54617fa1 100644
> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -229,6 +229,18 @@ static __init int enumerate_erdt_table(struct acpi_table_header *table_hdr)
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * ERDT describes monitoring resources per L3 cache domain, while SNC
> +	 * splits an L3 cache into NUMA node scoped monitoring domains. The two
> +	 * cannot be matched up, so leave ERDT disabled and fall back to the
> +	 * MSR based CMT interface. snc_nodes_per_l3_cache has been computed by

"MSR CMT interface" - this restriction is not specific to CMT, is it? Could "CMT"
just be dropped?

Last sentence of comment can be dropped. It surely will be a bug if snc_nodes_per_l3_cache
is not initialized before it is used here and one can just go find where that happens.

> +	 * resctrl_arch_update_snc() before erdt_init() is called.
> +	 */
> +	if (snc_nodes_per_l3_cache > 1) {

Looks like this check occurs *after* parsing of ERDT table already started. Could this
be moved to be the first check to avoid that unnecessary work?

> +		pr_info("Not supported with Sub-NUMA Cluster enabled, using legacy CMT\n");

"using legacy CMT" ERDT is not limited to CMT so this can just be dropped?
I understand that the pr_info() adds an "ERDT:" prefix but I think it will be useful
to include in this message that ERDT in its entirety is not supported:
 "ERDT not supported with Sub-NUMA Cluster enabled".

I think this work could be integrated better by switching the order between
this patch and "x86/resctrl: Parse ACPI ERDT table and save CACD cpumask per RMD",
separating the change to where snc_nodes_per_l3_cache is initialized and the new
dependency by moving just this hunk to "x86/resctrl: Parse ACPI ERDT table and save
CACD cpumask per RMD" with a note in the changelog that ERDT and SNC are not compatible.

> +		return -EINVAL;
> +	}
> +
>  	for (subtbl = (void *)erdt + sizeof(*erdt);
>  	     subtbl_valid((void *)erdt + erdt->header.length, subtbl);
>  	     subtbl = next_subtbl(subtbl)) {
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index e2f3b884847c..34d29f719076 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -177,6 +177,8 @@ static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r
>  
>  extern struct rdt_hw_resource rdt_resources_all[];
>  
> +extern int snc_nodes_per_l3_cache;
> +
>  void arch_mon_domain_online(struct rdt_resource *r, struct rdt_l3_mon_domain *d);
>  
>  /* CPUID.(EAX=10H, ECX=ResID=1).EAX */
> @@ -251,6 +253,7 @@ union l3_qos_abmc_cfg {
>  void rdt_ctrl_update(void *arg);
>  
>  int rdt_get_l3_mon_config(struct rdt_resource *r);
> +__init void resctrl_arch_update_snc(void);
>  
>  bool rdt_cpu_has(int flag);
>  
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 3838e0a13d36..6e46f10d8640 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -34,7 +34,7 @@ bool rdt_mon_capable;
>  
>  #define CF(cf)	((unsigned long)(1048576 * (cf) + 0.5))
>  
> -static int snc_nodes_per_l3_cache = 1;
> +int snc_nodes_per_l3_cache = 1;
>  
>  /*
>   * The correction factor table is documented in Documentation/filesystems/resctrl.rst.
> @@ -416,6 +416,11 @@ static __init int snc_get_config(void)
>  	return ret;
>  }
>  
> +__init void resctrl_arch_update_snc(void)
> +{
> +	snc_nodes_per_l3_cache = snc_get_config();
> +}
> +

This looks unnecessary. Could all these references to snc_nodes_per_l3_cache be dropped
from monitor.c?
Definition of snc_nodes_per_l3_cache could be moved to core.c where it is
initialized now and its initialization could just be open coded in get_rdt_resources().

>  int __init rdt_get_l3_mon_config(struct rdt_resource *r)
>  {
>  	unsigned int mbm_offset = boot_cpu_data.x86_cache_mbm_width_offset;
> @@ -423,8 +428,6 @@ int __init rdt_get_l3_mon_config(struct rdt_resource *r)
>  	unsigned int threshold;
>  	u32 eax, ebx, ecx, edx;
>  
> -	snc_nodes_per_l3_cache = snc_get_config();
> -
>  	resctrl_rmid_realloc_limit = boot_cpu_data.x86_cache_size * 1024;
>  	hw_res->mon_scale = boot_cpu_data.x86_cache_occ_scale / snc_nodes_per_l3_cache;
>  	r->mon.num_rmid = (boot_cpu_data.x86_cache_max_rmid + 1) / snc_nodes_per_l3_cache;

Reinette
