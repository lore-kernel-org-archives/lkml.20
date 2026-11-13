Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794612677;
	b=P3kstZrW1AcJ1IiD0R39KuDuP57/cMDwplrDE/QOvawoYgtQgYzSdhxTlRuhYvWsGt7U
	 pd/eO4966Q0j8VsU7K3dS/oWuXl25WBwBSOUGBUYLCThs+9ZjivizHFQTwKdsKzDOyBNZ
	 ix1qMtTTqmoG/ok1OVvAIqJ8j4JCfp107iMDH9e1AS6Vsa3SPzo/CuDThFCIUSO858hy3
	 uU703olMXE6MEkJiuRbHU/TkpfDK8vtVC3aIllNtsjO/YP3cK2tGiuEnxHo4Xa8kPQgOd
	 a+BXqEg4sXD+UhkjsUmAkG+naF9MydkCdi8sPyKww9IlBO/HpSabtMS6v5qEIKelIIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794612677;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:Content-Language:To:CC:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=vRqtzNNH5aCuMOJYYJ1Mfr7Pwydu9gxAUf4/rzSydIc=;
	b=f82+Xk/50TDbHPWIYloAVUWe8yKV78EDw2G2GgxkV37odrmPI5Y2bJMQKGBu+rBlY387
	 MHfGjhKXWuwAMF2OGfdfsR3A96dyz7nn4Rjsm0+2Stu7ijmlt+5ydXEzc+OV/n9K8sYLO
	 uPs9GE14OuhiZznJ0Y+a4CryExgTWyEsriS+1JjuLqwuXtp5Eyd44rzzTpHyIdWwpN/om
	 R3OAerSnCKsBmqVHPTM/YFnXGN7XhiOoMh5TBHWFaR4WQBFuAvzIgvONqz1WaSzRd35E5
	 Ilns1XpsjidnVvDImpA8szDJSc8TEJW54Ej77R8bBC9qb1yj0fBbzjjgfHPj2NhUwig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QY9qxg4v;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Yym9sFfz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8208606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 23:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8208606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QY9qxg4v;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=Yym9sFfz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794612675; x=1826148675;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0PuXZnxk8f4G630X7RHa5NW42p6gzkY092kbd6tIPds=;
  b=QY9qxg4vLpsulpYjtG4lsRYQwScnuQkkiIiS5tkA1nOA1IzEFcA4/eRj
   upGqVfVKhOuj0mAdw8ybW1/9ceDbIRkCN9ho4ce573fUyak87A6njMrRq
   RkhHvqphKKXmVgmCamB7DJKBugXuSgbmjK6suN0llK9RdRVkYg2itjnFO
   ugeGXYk/sOaNAzWPrcE6Ra6hSpH/xwUuzy92lVsPTmyxEltyT+dM/p31U
   fOh4uJd8ZcC6BSEy/kMopLM/izkEQJ7lyUqtDrI9rcn2LBORMbT54Ytbk
   DvC88A9aeGayNEBFlFEyAhLQmWtBYhc1GXogQaczVfuCUINzbqsWDOMKl
   w==;
X-CSE-ConnectionGUID: lS0Me5CwRC+hAoshSBhWRQ==
X-CSE-MsgGUID: On62AzjtQiuG8gXVPzkXzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3293536"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3293536"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 15:31:14 -0800
X-CSE-ConnectionGUID: MIoNkVE7QX27HUV9i5qRGA==
X-CSE-MsgGUID: pqMHGKgwRaqYE8OiqzM2Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9207594"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 15:31:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 15:31:13 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 15:31:13 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.36) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 15:31:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GTDcofgEV69y/rI9exgNlv0SRaCnFEPgqlDbekAZ6H2ECAM/jB5JNiyxdG0N7NDT+Wtd0p2r2c9up6Ovk2xqRQodLa6jgVlZ3aobm4bhodl0kVvHSd3GfffaB8aEJN/zz5tuOCGhr8fLus0NEUC//sLW8ri2B/gOyj9/ovi+fdskrohTBO8oor0KZiu9ffw2dH0tYAn666H/MePEkJdaFFgYqid/3MHf0nm+J5Bc8ZmQqOQUSrAFPPXEhQkrvUGIcmSLkzniT5V/74Paibz8tekzkzcVrMPy0+S1rFOCMGcdEutsmhxKoPQYKgI+icJ1sUQRRz8Bs37tSDrcPoRkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRqtzNNH5aCuMOJYYJ1Mfr7Pwydu9gxAUf4/rzSydIc=;
 b=WRtjQkiTgcxphTsv7Nhql7yT2bb29vGuCkXJcDUJ+5iHdkfsWuC5GEAZ7AQIm7T3k6d4Y0K/D4ciA3SLrsUPCfCkyexWh+tSAk1nZRBNv34nAgWqFz/lZ2nXYbNJHp0THv23CxUrZf5m8jUOO38118q8oUd/xeS6RIAPdoExwIrVdXA/w2qbcyxVHfim4zZ301Lg9k03D69fNxiU1p0Jeir7UT9EDnaNTXhIfrVfxF9N9aelgXaJOzvlKrnv4S5e3lVEsBYXryI6hXY4RTIZy1Wyt7c+6WE5LHSRQlMM59q4zRZxs5JNsiyzCKsYhftoaP+ZqFxSySuGXJQivnIkiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRqtzNNH5aCuMOJYYJ1Mfr7Pwydu9gxAUf4/rzSydIc=;
 b=Yym9sFfzmfg/JoRbX0T5ZdjmwyKHh1KeGMi9bLK9BvxnswkT3LD1hwYL+VbBt8ysvogX3YYVFpBULzt/K88r+jYgGH7joMH/y7yGdQxsPXuGkntUNXpUfQc6hm2xRyZTswCG9AN9PU4DUKDUoClSmRNWI2one0J3r+XKotSjTc4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 by DS3PR11MB746707.namprd11.prod.outlook.com (2603:10b6:8:43a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Fri, 13 Nov
 2026 23:31:11 +0000
Received: from CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395]) by CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395%7]) with mapi id 15.21.0592.010; Fri, 13 Nov 2026
 23:31:06 +0000
Message-ID: <74eca949-2c86-4293-99b4-6b2dfc5935d9@intel.com>
Date: Fri, 13 Nov 2026 15:31:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/mce: Add CPU_SUP_* dependencies for
 Intel/Zhaoxin MCE features
Content-Language: en-US
To: Vincent Mailhol <mailhol@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>
References: <20261113-processor_select_is_not_an_expert_feature-v2-0-ae630b1f2e28@kernel.org>
 <20261113-processor_select_is_not_an_expert_feature-v2-1-ae630b1f2e28@kernel.org>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20261113-processor_select_is_not_an_expert_feature-v2-1-ae630b1f2e28@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::31) To CY8PR11MB7846.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY8PR11MB7846:EE_|DS3PR11MB746707:EE_
X-MS-Office365-Filtering-Correlation-Id: 71970b57-e68a-49ad-950b-08df41de30a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|22082099003|18002099003|261022075727099003|261021121427099003|56012099006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|10067099003|261022105027099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: kWIUkq3+dzfFbn8gKmpku+QueDUv8uhQCfXB24fPG3eB6v+Efy1oC8y6sqMg7XwHoJKz4NG6+/AwhdbX6OdJyVkqOVWcX8FpTvZuxcMzneWAa4k3oKcvU3F97d/6E06poF6IrfDopKZTvx++uF0ggoWs98CHL0XFxLkcE76y9/Mqcm8tQ+t6MQfddhulHMjCTbPpffao0oz13UgPKYriAH8Nv9EX7QqKlSVaryhHIL8y3vv7mpLPNfN3CjoLOTpEHV791X3Dc09nPlAhGJS3ysjgW8uLkL3wKwxQ88UrI6EZe6Gq/083tWEentIPSTCrFOrDX9lyaIHQ3rJVe6PMnBJWzJYX2O3+Mcfv8L7NfrL3JkMzxTeUgTILQmrs23QzARmtmyBJa6p3i94VgcsrEbKc3Ea/r47oJaOOAr8UlCd4j41bbTvBJTygNLK0LImksPy2eGwLU6RAV91/paf+DlVwTw+jkJv/GC5Xq7Bl8+0yhHnOHIG76MMxz6GHg7460Neh2b8AhEPTywcnkXPrZuMHg40tLj/bQ+9meTVqJFr7lHy5XKunt7zDADQoNhCL+01Ffueuc2innPQ5QOJVZJbbZSv/9As/7gg5tFBpUVT6/yx+p+nMV6Ywo1T3mz1EJ7pZIuCTjzvTgEHEcj/YfcOkM42weG6/MimAzDpRsiM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7846.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(22082099003)(18002099003)(261022075727099003)(261021121427099003)(56012099006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(10067099003)(261022105027099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjdFNGcyaTRoMW9EYkhuS0pWbjhlTTZXUmN4TFA5Rm4vZldzeGd2bGE0bkhw?=
 =?utf-8?B?eHFJQWcvZnhHTVpOeDNjU1pmenZHUi9oK1NOMTNRZThvVU56MmpCU0s3TVZD?=
 =?utf-8?B?UlpzYjF3d2F1OWM5eWM1cXdxZWZOc1hrd2pRN3VaSDkrZUUwNFZRQm9IOVVJ?=
 =?utf-8?B?Z3FjL3p0aVRaY2c5RWc0R0Eya2dvOWZoZ3pmMVhzRkxvQUpjbUM1VDRXY1ds?=
 =?utf-8?B?OGdRc1NVdVN4blphM2E4eFVvYXFKRmF1UlJYSG9PYm5SMkQ3dWFIcE5aekNr?=
 =?utf-8?B?T1VYNHZ5VkFkV3gzZG9KREVuc1NScFArWmJEOU5ZYjUvWWxFUDZjN2tkM2t2?=
 =?utf-8?B?bmV5c1gwOVBCMGl5OW5Sa2krcUxuL3VxWmdCM052TFdlQUYwcmpISWRoZkc0?=
 =?utf-8?B?MmVWMUVBMG91Sm84OHV2OVQ5Ky9MVGVHNlVRV2JLTHp2MjJpdTFHb3EzcHFM?=
 =?utf-8?B?V2FsdzZQRktKZ3hqcFZ5MmljcWRkL1lUcXpNT29YTFY0aDNGaThyMXVCMWky?=
 =?utf-8?B?R2RkbHVaeGZjZXpEU04vaXUzb2thenE1NG9MSjNpOXlLZzV6V0xTcHMvNlJj?=
 =?utf-8?B?TDM4RUYvcXZaVlQ1dS9ESG1aVzN6RWlpdW9iYUNOOEVJeUs1SmlGemN4QnZF?=
 =?utf-8?B?dnF5REdsVWFlOG8xazd1c2lDMFJ0MXdHUFU2U2xFbEI3QXJQMytwYVB3bzFl?=
 =?utf-8?B?LzBrV1lpcDNFdjZrdkF5Y3dEWG9xaXBIeG5ZcEZLOVpYTy92dXFvUklPNEcz?=
 =?utf-8?B?b2xaakt6SnY1NTJ3d3hUdnhyc3RhSVQyYkpoUFBrT09vSlY2RExRRkxmcnAv?=
 =?utf-8?B?bkVIR1lpOUtPV01kcHl1M2Vmd2lJUC9CakI0Qldwd1FnWSttQmYvN1dXWUd2?=
 =?utf-8?B?U3JzaHFhdW5McDJ4WEtZL1h1SWlWWDAreExoRTBSL3dDSVBMWHlhZFExUHAv?=
 =?utf-8?B?eW5HanFOWnFVTUFkMFlFVEVCSUkzTkpzZUMwMTNSYVI1Ty9CQ3dKYW9wN1Ni?=
 =?utf-8?B?Y08vTE5NRVJGbkw2cElGaFJ4RjBpd3Rya0M3OE91eGl2Vk9ZcVNrMSt0RFda?=
 =?utf-8?B?bXdwRkZmNStjemw2dWZMTW1RWXlxeG53UXJXVVJ4ci9oV0lHQXRLRUh5cmpQ?=
 =?utf-8?B?NWthTWZKNWxBdm9CaTdQYmZjSytnejRlbW5Qbnl3ZXJJeFgveUhLdUhxd0xj?=
 =?utf-8?B?eTlydC9NUGNtYmx2eWh6MWVGQXR0S2xkODBBbElQMU16RSs4cWxmQmJTSWM3?=
 =?utf-8?B?SFhqK1VKTit1MlhmZ245cFRSR2VqdmR1cHJJK0UrTXEvZ0xvQklMc21rRUp1?=
 =?utf-8?B?ZUpFbzhnQWhOU2VEZG8vTmMzMXFVVDVOUlNqZFZYWmdhejF3RjVkVW5ud0Rk?=
 =?utf-8?B?QldZR3FBaGdBUDJjVEhHSWI5TjdLVUhHWkVDVmxBcVVicmpRaVdOeUJvT1Nz?=
 =?utf-8?B?U2NBa01QMmNLZmVPZzJQU0RmYmhCSkpWRlhrb1d2Q0k3R2ZlblhuZVgzZ3Fr?=
 =?utf-8?B?Tkw2NFptNHRkWEkwcWsvKzdMUG5mZlRtVUlsSk43K2hQWFo4QmViMUd0MWFz?=
 =?utf-8?B?elcxVHd4ZFVtTVQ1NVBWMjB6TDlsS0lUMzQxeEE4cjErOWZFc2RiV09saU4w?=
 =?utf-8?B?YnduSFdmSWsySk56R0FuYWZjeGoycWxySUhRYkMzVkJod29rUDB4TlBNSkZT?=
 =?utf-8?B?K0JQYStJK0g0cUVuMmZnVlpBMElqMWRiTUlVeSs2VnRpN21CbnZMTGxuYTJN?=
 =?utf-8?B?djlIYmwvVWliTjZma0gyNzdNWkZWSVR3aG8wN2pTaFRBejJKa1dDbXRidG0v?=
 =?utf-8?B?ek5BN2duby9pMnRiOHBKMlVwVjF6YTZrdTdlZVRHRXlrTEc3andXaXB1S3FD?=
 =?utf-8?B?LzhvdXk5aEtsd3E4c3hrb2J1K1BaSm1sSk9wTnROa2tRWE1NdnZvOWFnZHNH?=
 =?utf-8?B?MVRvenBFNkcwM2tGVmpZQ2xNMU5RaEJscXFxNXV5TGxRQlFFcUFFQy95NFhw?=
 =?utf-8?B?Tkk1dk9CN0dYc3V4TkVnMlB0YzE1Z05JV2ZiWkpkOHZTWG02RXVPOG91TEIr?=
 =?utf-8?B?Nytua3R3TkdMNncvNFlGSU1rTFZLU0t3SGZ5S1ZMckVaR1JlQ0xHMjBtM1FE?=
 =?utf-8?B?RFptbWZ0M254dHpFZXlEZGlFWEIrZUxvWWtsUG10Nkdod2w0c1lzSWtUZVFQ?=
 =?utf-8?B?REN3TFJKWkdQczI5YysrZmxxVXVOYS9yZG42MTBGZGpLdkdIb2V0anMxbHdw?=
 =?utf-8?B?SGxsV2N1dE1LWGt0QmU1ZHpYR2tQT0pKa0Y1M1BPRStNaGZSTHVCNmJhTjY0?=
 =?utf-8?B?M0tOMlBobk53bTdMQS9sVUp5TmlWemI0WHJTeUVOdDZyMGtMZHpaUT09?=
X-Exchange-RoutingPolicyChecked: Nan7rqofqW6LoTh/kczQ1cm54J4yBKHiFlKzNILbhqKgmAeIu9iROdMvIgoIrKyW32PmQJ967OMVpRM6HTc8X+XC3CTIJQzEXrUWIHFV7OE4V0qd4aAi/7PQvk+4pp8/nn32UaEFt2PVGW5ysRqcaO0s8+pYKiAfO9tfvrwL3VN3Lka9wnoa6sjD2p/0BgnjWHU3HfeDUbP6LasBsVnR1JPWZfrZiP1lwmw73RTRZ6O4HDSpSEgZdUe2m7BPz3RWQGSDTZYyOmzxSkkytpWarkV2173/ijW3WaPVahlxPpxRwC9Gk24nYzcip8p2NE3SymPAIePeiGZ+IANYAE/4GQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71970b57-e68a-49ad-950b-08df41de30a2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7846.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 23:31:06.7701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBYBKBpB8kYE5BRa7budQhitgIiuSP5sZKd1kzi9aAjEkhVLh/N0chfmhGo6n/C7VKlMYwQwb4uKsqY0lM0vLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB746707
X-OriginatorOrg: intel.com

On 11/13/2026 9:59 AM, Vincent Mailhol wrote:
> Intel-style MCE features are only used on Intel and Zhaoxin CPUs.  Gate
> X86_MCE_INTEL on CPU_SUP_INTEL || CPU_SUP_ZHAOXIN.
> 
> Update the prompt and help text to mention both supported CPU vendors.
> 

Can we add a little bit more on why this change is needed? Is it mainly
correcting user visible documentation or to reduce the built kernel size?

> Signed-off-by: Vincent Mailhol <mailhol@kernel.org>
> ---
>  arch/x86/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 58dce0b66179..91b3bc7deafd 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1158,10 +1158,10 @@ config X86_MCELOG_LEGACY
>  
>  config X86_MCE_INTEL
>  	def_bool y
> -	prompt "Intel MCE features"
> -	depends on X86_MCE && X86_LOCAL_APIC
> +	prompt "Intel and Zhaoxin MCE features"
> +	depends on X86_MCE && X86_LOCAL_APIC && (CPU_SUP_INTEL || CPU_SUP_ZHAOXIN)
>  	help
> -	  Additional support for intel specific MCE features such as
> +	  Additional support for Intel and Zhaoxin MCE features such as
>  	  the thermal monitor.

The thermal monitor is no longer part of X86_MCE_INTEL since commit
9223d0dccb8f ("thermal: Move therm_throt there from x86/mce"). If we are
correcting this entry then can we remove the reference to the thermal
monitor?

>  
>  config X86_MCE_AMD
> 

config X86_MCE_AMD
	def_bool y
	prompt "AMD MCE features"
	depends on X86_MCE && X86_LOCAL_APIC
	help

The next entry looks slightly odd after the change. I was wondering why
the AMD one doesn't need to depend on any CPU_SUP_* whereas the Intel
one does?

