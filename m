Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794422083;
	b=c5u89MXHVJo9485jrGvsNTKh7HlDboA4K4PF9XFNubmfLr4ycO59KgZ8Ng2Bbc7kreWb
	 CoGtDBCM1WEaCMqSUdALw3GfCoDdqvUO5AYs9G/Ms0fztvCKAiaFNf318+2rGZDTcQc3h
	 VxBWNmQtVCLKrTkob3UiwsyTew+VjaAk5ux5qhwqnXzGRBvmWyPn7IHOda1EB9PtW89c7
	 TuMr1j14a7p+wsD3ctyL/m+KY1TfBr8evXW0u9tgMnQEap7i2SYun+rdulbDVEMJilDNr
	 Cyp4cTGi+FLk7jzN3ZsmS8uPDrNvYt4OQ7edIuEazN8GxgsYbAd+6Wq5CnnHBsDlkmw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
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
	bh=J67GvsEUK2usQYpQFaXZ80BgfloLkF+a5A/gm77kPz0=;
	b=hRiTf5mFpVATe6XclOcO/Z1VuUBiHwDS7jCqS/FothZfB0lbwExNfApWH1UnRtma7nSw
	 N3/oLhBDFIvTgxZ0RHunTTSCPvFiwICMw4nvw6W69Nzn57dBy8fqSzGSqsCQnF2WKy395
	 UslQrblDi7MwS9IYmp4hiKJBA4wtME7R9lGb44qnt0vjj29Dki5xepm0QPaxyzO8MciEu
	 EaV2wLgKZuwQLvfRp2OVhjxfk/KGIOTxU6yYYpZeClAk60msHHkc5qKlpM8M5zVNk3XoU
	 ujopJAxkGuMHuUmQGx4xe4yVCRZP5lscmzPyBkDO26RSs83VojpzLE8HfMc1fD3HsrA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OWv8X5WR;
	arc=fail smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3209606A31C;
	Wed, 11 Nov 2026 18:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3209606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OWv8X5WR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794422083; x=1825958083;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=aAh23KRZOcjU3rxPa34qRcsPuyEAevXr/f05RWC6NzI=;
  b=OWv8X5WRU0SP9dFKwmRq28JU+pKNfpI5rJUL83TjHtAYfuojKU+AAmdH
   p3mSYEUtUtkVVwQDuJwyMPFFheYqPbpi4ir5b55JpSh7RnI0HOBeGLGXJ
   txoU20Ne3zfXHJhEIPOVRZvcuqJ8pcf8mhEVbf9b8CmV7h+bgIufgRq9q
   VMIceBQHatp8pGjSEWtEtw8/3TMrcTYZYMiFEVyfza5DD9skigIwxEued
   iBntzikDkVSLDFAiSC9Ouy5WwVBk2vbIBiTlt23vnJgE++x1zjyqkIPb6
   UZZmBndXHBh5mBcIySc2CsoV+QaClgGC89UpPMF8tUGGirIBBs9+xPdfu
   g==;
X-CSE-ConnectionGUID: A5NRNHOYRVeF4F7FhElY5w==
X-CSE-MsgGUID: 3TgnlfrbQ2K3Sg5rD8uGDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3099204"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3099204"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:34:42 -0800
X-CSE-ConnectionGUID: H4dRAnTFTOCImFWrhXNz1g==
X-CSE-MsgGUID: eMzdopL9TpOQZO1rJVQjDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8361561"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:34:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:34:40 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 10:34:40 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.33) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:34:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BWdRPt4z/ZJwbXFVo7NnE1HbmnItryfrkiKKf55h+yerTIafjI2WF8ESr86dp8aTSYsLscvfgzWpDabb0fMn+sgqfdxNyQ5TGRx4HRg0V8e3aJB6O1Z8rJ7vqV+BPsN7ekAy5CyNQefC8p6vDeUkkM0loJPwMFFABAi7+uhgR0t+sqL/Oo4EbYdpV3b1DLkQtKFVWyZHq7ln835EJ4EwahoLwFGbX23Lv2mksh31jLB013Iczubp1F+r0Ki/uJuDtcW4I68Bh1+GgiqwEkENaK13r5ndKwrom3B4bgISdYzykfUvSu3sfuWfAI3s+gRTLuYO00Q7lnDRObkknGU23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J67GvsEUK2usQYpQFaXZ80BgfloLkF+a5A/gm77kPz0=;
 b=cplGccQV3rgstAyGl+1+I250mjDRO1IVwY1Eb5Fz9m6fEWPdPxdOSkhkw0/l+4fnmwtwertSdwE0I0w5ZXXZgUYR9H2YaKCKs54HXYnN29XwUQZKDKTtbYjtl2SpyAExlDzm04y5Sj3g76JuZR15znnuqW64TTC/n9oAFof/ynF6bhCE4NCtt+Ti4PoZWURU5/Hx1gZ/FpzAWlVF9EpT4VL1uE7EsGy9+m9BXFB6T5WAgE6i0dIMH0pO4yFD8/xLQ63teQEymNB12cTrAM/YcyM4abblDtmHT9hvRr1bk9R53VlY1KLIXJcpIzlanUct5ofMTd9LohD37/P+BFZ0fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by EA3PR11MB771531.namprd11.prod.outlook.com (2603:10b6:303:2eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 18:34:38 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 18:34:38 +0000
Message-ID: <efd9c3d5-a732-47bf-bca1-50a8650fd0ef@intel.com>
Date: Wed, 11 Nov 2026 10:34:34 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 7/7] fs/resctrl: Add info/moveable_mon_group
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-8-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261110133938.3768632-8-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0126.namprd04.prod.outlook.com
 (2603:10b6:303:84::11) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|EA3PR11MB771531:EE_
X-MS-Office365-Filtering-Correlation-Id: 8767a9cc-ce60-4c71-a2c3-08df40227137
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|10067099003|261028144727099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|56012099006|4143699003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: XjeEncv9ywwdcz93KQENVhezkb72jGG+sdXIC9Mc8PImmtKjx0hIbiVms5bQjcBgdI1n8Phu82ItkZL3XxzLVKL4/wqMwzX0qj9Tua0jIt3wik4gDfDamwDQ146WO0ofOAVTj5df7dCuNfgvOaMT8wUEFpFFQvTHQ4+opyFhGroR+XT7EkOAB3ORAgPN6GPJWoZg09vk9cNNd47PF+aV4uJqy6IbIj0DxBIzHGHbKiTtJYFSxkTiR0zatmJGNWvHliLG6XQBP+qG7SmhOkPg96qNTctDKuwqjwArArybzegmoB+24GDF6rPWL1jZ8/N8ZKA/mNAVM1lqo7TG7/1WYz3Db4hJ5arOAaq7bBKyhwlYlgjc8bMLMHZqDGRbOHlgzVZ1D9C26H8nviMRvib4E6TYnc72XMfW9StgHtVwHJIMU8WnmD8OkQ4tJWHHhc3BhsoV5ZBBexsFyGjO2hga028WqABLSLaSB1mXqqC9UxJ61xNTPnzeTmwsZ0JN762b4jr4GoFmx1SCmGhV6NWJcCPsOGDUaMHMqsajEBCzjgvSatNJQzHmpyi2XP+jEPockYUcVmIdGnKnTvmdivrt+MU/ZgCHX1iD6/fQ1J12SP9qoStV5VznuiTM2kLa28h9qkAszzhWBtGobQuJAG+5S5y9/7gTJbk/OtWQbloT1w+DXW2uPjNbPfARtwQPppS46S3bcFNuaCMhTRLpAnWoYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUdBQ0hHbUk4QlBtRDV5bUZ5MFZ2SHNwQXkxbkpSVHZQM21LZFRlN2x2R0ZY?=
 =?utf-8?B?c3l6TCtuaDFDNGM0WEx2cit6M1lZRzZPUE91cldTVElHbUsxdUVGQTI4SGNE?=
 =?utf-8?B?VFkvK3g3d0I2R0pZcHg5Qm5qZW1FS2VEK2p1cFN1ejFzZ2lTT0JBTVM2c1Q2?=
 =?utf-8?B?V2k5OXMrWXhPV2FBdGRoRGplZ0FGUHBoZUZaMHZYaE9UYjl6dGZXd2ZmaVRx?=
 =?utf-8?B?TS9rTkFNdDhvb1RXUGkyTGhNSGFlNXdRb1kyZnV3VUtZeTFjZk1MVE1vNHBR?=
 =?utf-8?B?dUJISjhyVXVLYXM3a0ozcXJmd2lSOWdXc285ZEoxQ2ZoU1lWR3g4ZGw3L21a?=
 =?utf-8?B?UHVxVTZXaDIwNjNwUWRFL2ExeSt0ZGpXdVVWWnFodU1IVnVLYnppbkRHTG8y?=
 =?utf-8?B?VjQ3Y1p1VjVRbzlGVXlsVUoyakJJMi8xd2lseERaazRsRWY4R1pGSjdBcnRB?=
 =?utf-8?B?djdGb1FMS2s0Q1lkSTgzTkFLRU5iTm45bjB3eTkwbE55TXVNK0lOQit1NkE3?=
 =?utf-8?B?ajVneWRiWVN2VlR1OTBBNmdqY2RGdDVqUExJelY1M0pGMnlXY0xuYmxJb1Y3?=
 =?utf-8?B?c2tFZ3NmTit6aG41NHlVR2V1U2J1RUtWektkM1JJd2xqYWY2b051czZ2VUZM?=
 =?utf-8?B?WWU0WUJmVjdvMkwwT1JBZ3ZEbU5XR043bFl4WGQ0cVB0TjMza3FURERIM1RL?=
 =?utf-8?B?OVJuSVdaTnRPenhnSjdCTEVuenFpbTkzTmxiNnh3MmpNcW81TVhSbFFQVk9N?=
 =?utf-8?B?cmYxRzBQVk9FMThWT1hiTE0xbCtoR3MrU1owY0QwVkNkQitPT2FudnBkUW53?=
 =?utf-8?B?SjBIUnhXWmF1aHYwZ050S0p1RjY2dHBUU0l6aG9EQjl2Sm5kVlc2L3l3M09t?=
 =?utf-8?B?VHdlTlg5Ulh0STRTYVJYZEdaRzFZRHV2eVF4Mi9LT3ZMd054MklSaG1PdTA0?=
 =?utf-8?B?TUlaSDU5cDBFWkIrS0NVeEJLMlNuYzJwRENGVzdLdkd0NzdUTkdIZmZhSUM4?=
 =?utf-8?B?Zmx0NFF2aFdqTWdaNjJqZE1iVWd4UFpzTnhjQTl2ZTBBMzZXYzI3L0RFQ3Bq?=
 =?utf-8?B?eEJSNWdIeFQxL1d0b1N5ODN5VGNLZFJ4WE51SXhURUovU1JIbWtEckxwV1dm?=
 =?utf-8?B?S1k3ckRHblZucnhrSTlGZGE3QUhTbDdFNElGUjZ3RDdqQmFOenllN01mVXBL?=
 =?utf-8?B?WjF4ZjE5U2xwdC9mZjlqWnpDR3hjeFlGZGtwV2hYZjE5enJRSnhVRW5zMG9W?=
 =?utf-8?B?RW5Xb3dwTjcxdnNNYWpBTkpyU3dZbFFtTWQ3Q2g0TVc1SnpqVzNubTdkNTFj?=
 =?utf-8?B?MmwybndUenFyMTV3NTlkNXpMQTVNSGlUaElWcFBnZFp6MENrM01jSVk0T3Jm?=
 =?utf-8?B?T3dWQVN4L054d3VhdjJCMGZjM1FYUTlhWmh2MHFFbUYvaGVDa2pWcTlyS04r?=
 =?utf-8?B?bTlLVm4xN0NpeDFRZEp5Tk1TOGkxajhIcDVoYjlETDVpQ0d3bnAyZzB1RkNm?=
 =?utf-8?B?VGNWRjYycUV1UEc3VHNyZXJmcWJWc0YzbW5TaCtyU2J5TjcyVkh4NFNkcHpK?=
 =?utf-8?B?RkVrYmVCUmRaQjJKTFkrWEZVWmVOYkh3RURQMWRhZlpzUEtybG5Ic1BDRndh?=
 =?utf-8?B?MURCYUk1YXNTNG41MVhKejI0blIwOU10bzdUNitUTGZtK3BXUnZROGxma29C?=
 =?utf-8?B?bFYvR3M0VmQySGRFQ3pwc0FNYXk0d0Y3bkZENGNXV05hOEFRbXh1V2J4L3pw?=
 =?utf-8?B?eW42dWlSd0ZOcVU1NlZVYUpPWGtpZmUwSTE0c0R0cGRHb3hQUnZ0ZkMzZ3JM?=
 =?utf-8?B?N21kR0xZSDJONXJWSmRFd20vZEg2TjdnWmcrSWxtSllJckI5QjVEUld0cGFU?=
 =?utf-8?B?R2J0Z21oRyswUnhPV3hZby9lU0paeWppMXlSeEVEbXBIaVdWZ01STEhVaHZO?=
 =?utf-8?B?bk5BNWxPRVZZWjVlTHpzclZkM29zOUM1Y3NuSjEwMVVWcjVScTQyRlJISUpn?=
 =?utf-8?B?aCs2N2FZbHM3MzlrcFpYK1dXZ0NOTVJDSTRzOWs2NEVhTkR2b09vMHUxQ21X?=
 =?utf-8?B?ZXEyaUtDaW92UTJYZ2JDUTJkMVpXb2djaFZrdkpSNFFiRW8zL0U5a2k2U250?=
 =?utf-8?B?NmE4bmpZYy9Td20rU1BqWVowZ3JxRUJ5b3FaaFVPMkhGZHJVRDZvaVdnRjVk?=
 =?utf-8?B?a05OOW1tMzZCUmFtSjcwaFNJZEJvS1FISmNxU3hySWRGT2NaZzRRQjVhNE95?=
 =?utf-8?B?SWt0amxadXRlNWdKa3ZSM3FoOUsvNXUrcWRwMnZTdFEvRVQxUWFSbDhocUg0?=
 =?utf-8?B?cHdwTUVYbXBJck9zZUtOVDJhYlVrc0NYbEhlc0NBTmhpVWxRWi9YNDBrWmx4?=
 =?utf-8?Q?Ye9SvBYc7WC8AG50=3D?=
X-Exchange-RoutingPolicyChecked: o+ShFfG4Kb4W+YGxYIJsUarIQyZooz1qGQ64F1E829RmYii2vMQPyE+SRRDb7KC0yBO59VL03vtQLmxBl7yF64HJLugxDNpmX4/ATyRU9IdEjAaCPGz1PYhPCRV1Vw8nAqr8AvzeaigACb0le9YNzcTtveIIJtvdF/GwDV9znPFiW2qWVJa+1S62lsySMzDY2OwVlDO01P2qsI5TpneUgWoXAx0M0bZvZiAxt8CQkyCG/vUh8uRCGyiyauZ5Im0b5cdbkbRgd16XW28FrXsAUqYiyFnXtulbYbhYYvYYloO8vr8Ggs4dP5rzSt2yd0zBWtXBPIJ970qyljjGmU7axw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8767a9cc-ce60-4c71-a2c3-08df40227137
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 18:34:38.4070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWOdj5lsOX3BsaJS6mNjOPZpYqzCn5g94iqYJmlXYzG/42C4EbyBqvmP9HwGTpu0GgpoIPU0/oOD1bATnP7Vx18X0S4WKfI1prYrKrwoNMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR11MB771531
X-OriginatorOrg: intel.com

Hi Jinjie and Ben,

On 11/10/26 5:39 AM, Jinjie Ruan wrote:
> Moving a MON group into the mon_groups directory of another CTRL_MON
> group changes the CLOSID of the group while its RMID stays the same.
> Where the RMID is only meaningful together with the CLOSID, as on arm64
> MPAM, the move changes the RMID index of the group and is rejected with
> -EOPNOTSUPP.
> 
> Userspace cannot tell whether the move is supported without trying it.
> Add "info/moveable_mon_group", which reads 1 when a MON group can be
> moved to another CTRL_MON group and 0 when the move is rejected, and
> refer to it where resctrl.rst describes the move.
> 
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Do you find that this binary "supported/unsupported" accurately captures
everything that MPAM may ever want to do in this area? Could it be that, for
example, one day MPAM may be asked to support the move of a monitor group to
support scenarios where the reset of monitor counts is acceptable to the customer
and availability of PMG will be managed as part of the scenario needing support?

When adding a new interface it helps to consider future possible changes and
aim to create an interface that solves the immediate problem while leaving room
for future enhancements. If we do not do that the interface becomes a maze due
to new files just being added to address the problem of the day.

I would like to propose that this patch be submitted separately with the goal
to obtain more feedback on the new interface. 

Reinette
