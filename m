Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680B63769E7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 05:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788845954; cv=fail; b=FWOJojf1qpSiYq8njBe5bFD/v3VzeHHrenPP0mypoU7EuSQYvdM26wGBgfEuQdbUd87xZXYLHsxWimhUCsjRLAVOD7EV22e7eHUHhSLFvKv0qJqjvofjfHx/ivFfkABVlFhLpz/jNtu+9lC3iJJ24+RZyON05I7/L14615gF/gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788845954; c=relaxed/simple;
	bh=cFtsWbqwdfnV+HIphMdBp3B7ZiLu3o8tjViTg/aVbmw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bHdaTqkjhb7KI9VLG9qcekbWYaXFs423HLOxaGXQPI9HFADoILVT73EdUN7EQA+qum+xQQYkkRRCHN0vdzd9LxIXZz5XjcoZo6eyn+wiC3legFyNjZ7fuAlhF6lxlciZz78e1I8fHviMTqpB8v4b3oDrMOofhYpMttqYLr4ctNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETMw3ZLZ; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETMw3ZLZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788845952; x=1820381952;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cFtsWbqwdfnV+HIphMdBp3B7ZiLu3o8tjViTg/aVbmw=;
  b=ETMw3ZLZN1s1/X8ce0cgQznQRN0R38N7DPqlm2OxN8FT2fNui5nFbmtS
   zn423IbtIEe9ZMMfh5dVIDbEMIUPXHc1R9bJqhwyx9CvnQ+yHXt2JAwK0
   ykPT3Wqt0OmjMe1QAPVXMT4odiz0/X8wDkSzDMDPXqH+S0ssAeFQBHNJQ
   dDZqxvrA/VkqyiEE+GQQI29mPDzM12pSv/opdCLWxpZvsdtI0+Z6sfY8c
   n/0aFU6L6EHNvkoj44Yov8PsgrkVKorqPt/cngBzZ/KVa+fR76dmVxtqj
   dmN5FZIoXhhzMM6hMR8NKc2RxNZQAjFOVkunGMUYWHMKYKYc4KT6aFaP4
   g==;
X-CSE-ConnectionGUID: JSxgyc+bTweBzuMdnsIo3Q==
X-CSE-MsgGUID: sKtqRoZ+SMC4x/cqdLmSgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="91747524"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="91747524"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 22:39:11 -0700
X-CSE-ConnectionGUID: 13yLZj2hT3iVuSJ8SC/8rQ==
X-CSE-MsgGUID: PZrCWHYTQUiJcqnkWA8kdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="269154760"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 22:39:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 22:39:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 22:39:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 22:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJzyHyzfyjhZ0AW9m4C5+pKe0ahWDeE6fbRymakS7wye5oTa/0OfAiIbqbHNWeAqlVqxIfjHpeiElP82MenzjIff1oteXD/qr1K1qHbdYWBSc1vnWniRfHiSdbL8A2ABH5RQ6kaIR3RqW3q9tvKrOcB6g5jRRkAzvPilQ8TMrqLD/dqCmWsno4pnL0KOU4WdWy0Rlw7dTn/wfeuEOYY1F+KFXryDNDKaEZd2l4QxQ+eMPalQbRS+Yv6GgzHURQeMuLjA2wYs2CdfT4uOq7nOK0jgsz1J4KI0X1lGCyXrudb3MoxqxoCTgNQsRKxR+VaX34Rq93Yv5S/rmHSxyYCNHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GI0I98Hw5jnm7+d8oWxXYU2PPGmdG/VTxCbXRCJTuao=;
 b=HP96e2s1kO38X3u0yjfU9qXydyGzWGlCjay36IGsS1GccZ1hHbK2fRNwjhaBVz/rru1pxgBp7csaNqltWKZIAOlo0PWuDbenZiReWwlvBfWvl4vnpf8ITFvLXRv4v+AOWwXm1RkiXprbBpcdpzOOTCwJUZFb6dpDkA/drPZr0bPQ219euL3Z4RdAIivYWrmDE+HJnSlpBaaeDFXSaOsny6ZN0hkHwh1bJ2b56s7oxrPD7m7sbotovZbzDyszSa2y7S0G/5gsxVorZybFfIt+pU37vVOzsN84OGVYF2zBtc8s5H5Y3SPxNI+b9gRLBF0Y0OeJfTCKttRG7LPQjkB9RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Tue, 8 Sep 2026 05:39:08 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 05:39:08 +0000
Message-ID: <57833d3b-bf10-42b9-ae28-82d65a22a6af@intel.com>
Date: Tue, 8 Sep 2026 13:38:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] sched/numa: Drive NUMA task tick from execution
 context
To: Hui Su <sh_def@163.com>, Tim Chen <tim.c.chen@linux.intel.com>
CC: K Prateek Nayak <kprateek.nayak@amd.com>, Juri Lelli
	<juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Valentin Schneider
	<vschneid@redhat.com>, John Stultz <jstultz@google.com>, Ingo Molnar
	<mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260903041154.2479761-1-sh_def@163.com>
 <20260903041154.2479761-2-sh_def@163.com>
 <4593a7a4-cde1-499c-bba8-2fbe24f35422@intel.com>
 <08f682ba75a4700694d6f94719b367b4d26c032f.camel@linux.intel.com>
 <20260904141017.1512404-1-sh_def@163.com>
 <0d6117e597e6ca3ab3179c6304d6e5e454f53759.camel@linux.intel.com>
 <20260905135843.2818510-1-sh_def@163.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20260905135843.2818510-1-sh_def@163.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:820:d::19) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|DS0PR11MB7788:EE_
X-MS-Office365-Filtering-Correlation-Id: 53238e4b-3b5b-4a50-ba85-08df0d6b80e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|4143699003|10067099003|6133799003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: lug1cNnBYNgIyGnWn/Cm/QSQNnbEwnPFjREsq8E0Y/gRmPiSJp7mJb3+XoS7AA+VOr1BKnoeAIJtO7GBVW1A4Lt5x6kJqQ+ef04oAXDTqNeMUdt2tI7l0axVFrHqou6mQxWKKaZzcML5Vw3lp6GgSsInqivOji/p6S1XfEOAA1Y3ITvgBILZvx+9iVjeRuN0iY7GOuidEDVFODgl6r4kiV2npajKwTjLIxINow977BNhuPxsAD6fqj7gzsyA01JuZ66iYmTMpvKhwebv84tcJ3hyWvy2GfrRf/eOVAYMhV96VDnhMY8AzqHg8R53T2cm/hAFkYcWCIaQ8k307x14knn15DI65bfl9U9qcnzX/kajKRFrYYiem312B7cGZxObdtSkqJwgiZAAk19tYcSQgSJJJSE/9ZszLhLvbywM7r4+mUVbThjfN8RNE9EJ+IsVyngI47XReGXQYwi6iC1mqnKSTF5AiMMQG1DRAeiGOUNlFgT07//u24Yazj9NfY5yygEwsLINgUNfLYE+kVtHMXLru3i5bZBZdPma+fK/UJA2jzo6m3d21aBDh/gXaOR8LtDAom/qPMaGXNPl3oz3QoLPKzustpvzHqFC8BQe7jpIVQ70dAEHePvNNyGRcsFLaHa3otkIsJ7mjc3TN2ic0xnGZLw3g4Dbw02sXeQ/Wi8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(4143699003)(10067099003)(6133799003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXREeHp3WGYvaEtMMGtwWXQ4OEE1QWdpbUtvQWhtS05ScGhsVldZV2k1aU52?=
 =?utf-8?B?ZHc5a1JRQTZ2dW5seE55aUtmeFFZOXVSTzhFRldKTlFTVEE0ZndBNmZPODI3?=
 =?utf-8?B?SzlhcEVPK2ZWR3Z0ODRsK1NUMW1hL0FVZ1ludkcxblVURUJvWkRJY1cweWEx?=
 =?utf-8?B?K3pMSWw4bHFUSnd4Wjh0NGdvbTRLM0xUM0NWL0xCUjA4bTRkUlEvam83RHVR?=
 =?utf-8?B?aDI2WTRsYWZSeTg5NzAzZkg3ODdnVEtzK1UrYTNBNlF2dUlpREdYMlpuQTlH?=
 =?utf-8?B?S0Y2OFFodmZjcE5SdEsyNUZHRVlpa0crOGVwNVhsL0NHSSt5TWRhbE1teGVs?=
 =?utf-8?B?QVgxZTd6dTlSNkw4a1laTlZ5QXBpZWpGTEJ0aEMwS3Zya2c5bks1SG1PaDk0?=
 =?utf-8?B?Wkcza0RtTVd5TGlkSG9Da3owcDVWMmtFK0owdVhMUWIydStrem1MR3h3QklJ?=
 =?utf-8?B?amx6NTFQZzgvWWFIbjF4c2tOa1BuVUVKUlhmUVRHWjAvUVFyTEdVaEE3bEpp?=
 =?utf-8?B?YytLcWNqQXFJVFlIQk5DekEzd2FTSDc0aW9sMXVDZmhWU2xwQXpkaVBCSnls?=
 =?utf-8?B?TmVUT09DZktyUDhjT2hCVi92RzM3d1Q4TUVXOXhpZTdCeFIxcUJnUWFuakhi?=
 =?utf-8?B?L3BkMmRSQ0svWEFCa0pTNVpvNDZ3Z09YdEJBOXZTT0JaUGlvU2V1MnB3TE5i?=
 =?utf-8?B?dlIrWVdRbjRhd3dBU1pDNytYY2dBa0duWWVXbm5uYjVKaVBoalU1UGVUd2pZ?=
 =?utf-8?B?dk5LY2s5cDU5WWNjRXNmd1M2Rm8rVUZSN2VrclFaWm90eFpNbTFueU5iNFJq?=
 =?utf-8?B?ZmUyT2FjZlZFa3RKNG9udHpVNnZVcitjV0x3RS92clM1emxRUDBTNHdZdjh1?=
 =?utf-8?B?MUhxMC9qenU4YnpLVUdhS09ERXlrOU9rdDdmVE5oSnNIbmY5MkUvYlM5UVRO?=
 =?utf-8?B?NTRjdk9OOVE3SzRuWFY4ME9xblJqNmdTM0ZoZlV6KzdEUXBTWDdkMC96QStI?=
 =?utf-8?B?N1QvVWs2WGx3NjJWZDJyNldwTklkZk8vblVoek10WVExeE9LWXl6S2Q4VVph?=
 =?utf-8?B?NUFxdE4vbW50cWpwQXhvR1FicG1GSUZhZGl1ejNyUEJpNDkzTmZ3K0NGVmlE?=
 =?utf-8?B?RkVuWllycURuYTkwZ0VHU2FDM2krK2dmWWN6czJaZmpuYkErREprbXVma3cw?=
 =?utf-8?B?clRtSUZ3ekQ3ZHNFZStWSVVyRERIYURCd3VXWGdtUFZkTEszSlVrU1ltS1Zt?=
 =?utf-8?B?VmVIRkpVSm43UkVDbXYvdjFzSDY0QlQ1Wkc1WDBSVGtjZnRKVWd6Vld6QUNt?=
 =?utf-8?B?blRycWNGcUppejBYVnFnRW10ZlI3bEIwN3JCUGo2OVE3cUcrVjR5T1lpcWtS?=
 =?utf-8?B?ZGRzT3hNSnhUZVhLa09Td3dOMC8vQ3RsbSt5dDBqSWo3SjExam1VUE1LejV1?=
 =?utf-8?B?Y2t1YnZKaTJLTkQyVlR2bmxWMDhWdTRUTUhiM0lkajRJbGk3V3QvMEthNHpM?=
 =?utf-8?B?blVTYStIdG9RbXFaY2M5bkg5UXZuMk01R1BmV0lKZE5yaUViYzgzZXdHZGZk?=
 =?utf-8?B?d1dUdjdQdi9uUzEvMXdnRlFPcmVCQy9FSGxkVzMybWJ1QVg5YThHS3drbURx?=
 =?utf-8?B?YVNjVkRWYll5aFFEVzd0WXFQY1RGMG8yRk5JRmlDaGM0cXFRUjgvdWo4U1ZQ?=
 =?utf-8?B?ODlPajJFUUZtTXl6QUZFRnNocWoveUd2anBGR1IyTCsvWmloa3FaVkoxaEpG?=
 =?utf-8?B?QWMveVozTGU3RDBmZVg4QWEvc1F3cEs1d3o5VVlqSzN6R3F1Y3NxcEZ2enh0?=
 =?utf-8?B?RHdVS2dCMTB4RDMraFAxVi9VYjJQUkw0R29zRUtvMU8waXdCdkVUajc5S3dn?=
 =?utf-8?B?N2ZVZ3VoTXkzSlVYUzVIVVM5YlNBaWY2KzVYd3RlVDhGYzBHOXlrRWdwNUQx?=
 =?utf-8?B?bnVNNEZqY1pkbkZRSU8wWUVyTm5wQWRCRDQ2R01sTFJONVYzVTFHby9pT1k3?=
 =?utf-8?B?ZDF5R3V2OGljaXQvMDJjMFVjS1U1R3ZRYU5ZOGNhN2FSd2lhNitLT1lIUkFz?=
 =?utf-8?B?anM0SDdHeUdBQnloYkl2cWRmd2Y5WkhGVkEzSXBHQnREQnpTdnlEK21DVEdE?=
 =?utf-8?B?UVgwK3k1bFZJVlYwV0FnKzlTc3ZUNEExNldBdURSZFFPZmZwTi9EbE8wa3gx?=
 =?utf-8?B?Vmtsa0FVSFFDRlJxZ3AwTjJnSmVlcHdtb0VmQ3luOEdpai9IVEdpcGxGV3BL?=
 =?utf-8?B?UVp5cXRxeG4wbkdIelVjTU5VdjdUdjZqN3RtV2pSRHkwdGM1MHRHVUpyTG5Z?=
 =?utf-8?B?Z1VkNGNhajcyWmpNSThuN3ZJM05PTSs4NWNxUVBBWXRKN2dwaUg3QT09?=
X-Exchange-RoutingPolicyChecked: nTfJFCvq1I34pALDSHwrvXTipX7FcmYYi5DzyhfLCj0AvAoRKKkCZ6ldBfRr7pKlwMS9zGLEZwdcBHGWV+rrskElqXkRiNqjOeqKR1hWPAs6ySQzN9Q+lSK8M92LhOqgkiQEWb1FFmR2ePXC/wq9e2YfFAQKLojnfTkRS1gwC+6SlaCoygpo4+GI4I8zRO36Nt/k6v4ndKJxre6DJ5ztPUD13CR+flOPvz7gqZqalmU7pZx03zwTY2hID3pe/RM9dWjAoztPFd1egrwC1NbsUQBuI/OfHnB1xyazJvsxjHnFYLCcQ2XFVgLi5+6F31UGxQi9q+jhBjUsA5QPK+p3xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 53238e4b-3b5b-4a50-ba85-08df0d6b80e2
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 05:39:08.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAZtOd++JAwWu8K5qcUXMe2Uf07ks/RyU3FaP1cKYPpfXAY6DjvQTQegIhSiVqiJfGlkmNjjQXB5MSXsejjU5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
X-OriginatorOrg: intel.com

On 9/5/2026 9:58 PM, Hui Su wrote:
> On Fri, Sep 4, 2026 at 1:15 PM, Tim Chen wrote:
>> Yes, you have a good point. The code I proposed just look at whether
>> we have consumed our allotment in the current slice.
>>
>> What we should have looked at is whether the donor's total run time has
>> exceeded its quota when doing core scheduling. And we may happen to
>> hit __entity_slice_used() at the front of the slice after advancing
>> the deadline and __entity_slice_used()
>> returns false instead of true, even though I have consumed more than
>> my fair share when looking at longer time period across multiple slices.
>>
>> The accumulated run time of the donor since it was picked for running
>> should be used for selection time baseline.
>>
>> So maybe a patch like the following instead.
> 

[ ... ]

> 
> In this example reweight_eevdf() did not change se->vruntime, so the
> divergence does not depend on a vruntime coordinate adjustment. The
> weight change alone is enough for the accumulated vused and the
> current-weight vslice to no longer necessarily use the same scale.
> 

Makes sense. In the current kernel with a flat cgroup(commit 85570f10a4c6
("sched/eevdf: Move to a single runqueue")), task_tick_fair()
tries to re-calculate the task's h_load.weight - if the cgroup changes
its share at runtime, the task se's h_load.weight changes accordingly.
Thus comparing the delta derived from the snapshot vruntime and the
slice using the latest weight is unreliable. (While before the flat cgroup
was introduced, a task's se->load.weight will not be re-evaluated during 
the tick, even if the cgroup changes its share at runtime.
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 8b3d47a325cc..c32d9931129f 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -590,6 +590,9 @@ struct sched_entity {
>   	u64				sum_exec_runtime;
>   	u64				prev_sum_exec_runtime;
>   	u64				vruntime;
> +#ifdef CONFIG_SCHED_CORE
> +	u64				core_sched_start;
> +#endif
>   	/* Approximated virtual lag: */
>   	s64				vlag;
>   	/* 'Protected' deadline, to give out minimum quantums: */
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f78275192036..22ae5dc57337 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4580,6 +4580,9 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
>   	p->se.prev_sum_exec_runtime	= 0;
>   	p->se.nr_migrations		= 0;
>   	p->se.vruntime			= 0;
> +#ifdef CONFIG_SCHED_CORE
> +	p->se.core_sched_start		= 0;
> +#endif
>   	p->se.vlag			= 0;
>   	p->se.rel_deadline		= 0;
>   	INIT_LIST_HEAD(&p->se.group_node);
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 8dff37059faf..1bd05c906d3a 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -6502,6 +6502,9 @@ set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
>   	}
>   
>   	se->prev_sum_exec_runtime = se->sum_exec_runtime;
> +#ifdef CONFIG_SCHED_CORE
> +	se->core_sched_start = se->exec_start;

if (entity_is_task(se)) ?

> +#endif
>   }
>   
>   static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags);
> @@ -14748,10 +14751,9 @@ static void rq_offline_fair(struct rq *rq)
>   static inline bool
>   __entity_slice_used(struct sched_entity *se, int min_nr_tasks)
>   {
> -	u64 rtime = se->sum_exec_runtime - se->prev_sum_exec_runtime;
> -	u64 slice = se->slice;
> +	u64 rtime = se->exec_start - se->core_sched_start;
> 
> -	return (rtime * min_nr_tasks > slice);
> +	return (rtime * min_nr_tasks > se->slice);
>   }
>   
>   #define MIN_NR_TASKS_DURING_FORCEIDLE	2
> 
> The task-clock version has matched the existing predicate in the
> non-proxy tests so far and fixes the proxy reproducer as well. I am
> still validating reselection, migration, and the remaining proxy
> boundary cases, so I have not posted either implementation.
> 
> Do you think keeping the check in the original real-time/task-clock
> domain is a reasonable direction here, or would you prefer preserving
> the vruntime approach by carrying the accumulated service across
> reweights?
> 

I would vote for the real-time comparison. What do you think, Tim?

thanks,
Chenyu
