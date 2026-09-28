Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E62146EC9F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592188; cv=fail; b=b6pFsVCy2aXEoU4uCqJwJJKLSQgSzm76SzhSGjHmglyHQ7AUU1dsvbCqwo5kN7ysgZ7EbLkbG4tecj/NAMWozhKzFDTBplCxqcPcelKiiYJmaeMbwc3DDEKKTLmg2dI9G8h0tAYCp8jm1GkI3hxO2XLdH3hc+vVvnHknhyLwd5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592188; c=relaxed/simple;
	bh=UCqiainbWVqJ3+SkbbODQNAmb5jNMPYza1m0pmxonB0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fTJB243r+Sip4F7AiSYfRs7G/Fe/Bff5kY9JViBnK3NQKg/rHwuvbE/GpSIFCrM/HIM9egx1MN1dRTC5SDuXpY3GD4RWfOHcFTo8GhhL2WGYaS/qic9kRZp6cAx5SJv9ypbe7TPF6cAQVZQo7Ko+nEgZ3ASGrFXrXk9dtPRPrQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWt+Yx34; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWt+Yx34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790592186; x=1822128186;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UCqiainbWVqJ3+SkbbODQNAmb5jNMPYza1m0pmxonB0=;
  b=VWt+Yx34dYiAbv5q8jZjLV9fMg9CQe4gGNcYwNTOnBA9q4dxDMHJNWjI
   qOSS14DsTNRC0s1VsX7CLWhCpaBQ6Nm0/KGHsABPUA35AukO/utC81ZqJ
   kxVXfmfcsPpEoh94a2BVWMLQsNwzVd1iKYrAMwp74UCUng/SjHTtZ3pth
   Uegw6pp+bCFY3k3AwzeJIToIIkd8PUoycqWfZZOu5VjBI5J6naIjP6+Jp
   pbRMggqmGbNc1imchRuuY+QmeQS4+Nk0cYrxl02gSBaTDaZX/HpeWHu51
   hOVZw9FqTjHfXPCR3lLtZQ26HKYic0Or57M6IU2q6ex5krSzbMKEaH931
   w==;
X-CSE-ConnectionGUID: g2I90ICcRj+as22MtBHQIQ==
X-CSE-MsgGUID: c8dFvEMKTQaGkzTovpfdAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="116816764"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="116816764"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 03:43:05 -0700
X-CSE-ConnectionGUID: oY9S6Yo7SsCwNRt1BQlGgQ==
X-CSE-MsgGUID: 0/hpJfezToy7DnPcXzD8tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="278381082"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 03:43:04 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 03:43:04 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 03:43:04 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 03:43:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXWbl7XUQ3F+IUiEWYe5X01S+23cBoBfatroXkd7LRuU+nO8QDVBIoZnBUPny+ixJ0lHSluDZcIN/XZpUxOojw4ZdBZHQURh6tAGVRIiSmun9fUeRFmsU0XK8WWV43nyAYPrA/M+4QGEgWEps3d6dAffmP7mx1OK3maATlm7+R0zO7zhxaE+ToHkUDfC9ePma1sM5+gzVsHOvMUT7JBHObUZBPttOTYpBNsR+6hWQIio7TTKnozfBSZw1XsI8DkaNvozPcMOq6PQtSba21muBLos5UM+bckctEioILPW3Ji8XMRXTf8rHY9JS7Lz7Z35eQuvc+U+a+ZGkPn9/u69bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+12s527L1RwV8BHnXII3xxry3I/ssJwBpHbwqsHIDpQ=;
 b=tJMlSY4r2psHoRE2O15QZgw5siBSpgvO9NVJ6NH80sds/I3hjPWIrMJEaUUJIs98qh8wU6Gd2G6TsBGZWkJ2hS+DAxskEnFqZOOiDjamRlgqgmJZGb41OEPknnTKLo52VFgh/2yCplvR3ZHA+DzdddO1sjYz+U+2DXsPztKu+TUH45q/3brQy9uBWHLDcZaf+C7l/Ei9kpt7sBAPOPmFw+STWOnZIflgKIB9rPKRicRhNtaQqaPzM9tQ+OfKXtdxVkCBLm/gElc1bmqo9R0bqaUGZ2PMzJBZlOflXNQpC4YTWw4QQbayKnRiMkTE6kNuDLSZOCfOdjgkdf1e9VGHOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by LV8PR11MB8608.namprd11.prod.outlook.com (2603:10b6:408:1f0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 10:43:01 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 10:43:01 +0000
Message-ID: <22623823-a2c7-4627-b123-12d1baed0e93@intel.com>
Date: Mon, 28 Sep 2026 13:42:56 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] i3c: use actual_len for read transfers
To: Frank Li <Frank.li@oss.nxp.com>, Sam Agazaryan <samagazaryan@google.com>
CC: <linux-i3c@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, "Meagan
 Lloyd" <meaganlloyd@linux.microsoft.com>, Vitor Soares
	<vitor.soares@toradex.com>, Oleksandr Shulzhenko
	<oleksandr.shulzhenko.viktorovych@intel.com>, Boris Brezillon
	<boris.brezillon@collabora.com>, <linux-kernel@vger.kernel.org>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <20260921230603.2518652-4-samagazaryan@google.com>
 <araSUuwTSx0aIuDp@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <araSUuwTSx0aIuDp@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0021.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::26) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|LV8PR11MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dd36372-ae4b-420e-67ca-08df1d4d44e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: sx24amtxBbx9lA55PYeyn3Fg7SIPzLgBQGM5Lkz/zb7kB48itIlisa4hl4bOwThvB14jSgxdCtPMvOBG+QA7tEEkYbJI1rRgLJYiRwiS5G52sHnNvEi2rhLBzx6nu1Ckbv7YUzVgdmdEWT9EzXS4jVPOt2PT1DwlE34+scZ9yOZeYt91f0VMY3Wok7zgwAo3xah8/znzhuncb07xBMJwl62LXoTL15+fN7RhE/IHLqYFcKcBvnTu3lmicmkO8unxtoqvCe+t+HFFG0lH6XY7MJ6tAbYbbVo57U5o1vjK6nONLweKDTZ5gab+g3rsSBOaQJuJmvg3BTJYrRQ3X5BcJTpZMfBref/x0SMN9/m41kmDkNw/ogJTgP8ekmahwetO4uJufI2TU7Xce8cCtWL1eqkuI03gP9ZeewEtEKe0SCIsZZ7bZdHGZQXhJYhFoe/QovK4KgZ9fhXWrLQw68wsMJqPNJR6pxdhnIj2PAliHkkundOaqLLJYKkjEDctDkTA1hpVQuKlImEUE6GZ4+UyzKn2vICiPhXpigp1+fGRUhc1kLsHDiFSA+m/dkTsETkHoLpxCZSB7UzpDMNO4fWnawI3DEku34T9apSruRKKrtc1elx7I33EEQYVN0jZ49kmF61Kt3F4VlULtMFMoWGNhCMQ+Ak6APp2eV3VFQ3fRjA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alFacDI1QmR2Qk8zb3hPcEQvWnJRbVVVM1B2SnowTUtZeXhuc25MOGorekZ1?=
 =?utf-8?B?dHArY3RhOXJjRXlSTTJVdVJYclVPblErQmpack5Md2NTcU5uLythTHNQN242?=
 =?utf-8?B?V2Y3cUsrODFvSS82SEhpR29ZakFBaTBNZk5xU0pmQUpnNkpBNzRpMlFuZXlv?=
 =?utf-8?B?TmVYM3lQZnRSS05EeVo5STVrcWV4UVo5ZDRnSnJ2YkRMaEhNVmYrMTlwZU1T?=
 =?utf-8?B?d2x4ZVYzeDFyZkxKUCtiTXZBaUZLclJPbE9TeElWUUp6S3NHSTlGOHBpUFZu?=
 =?utf-8?B?dGRFcEJ2ZWF4cVluNjdWUXRMc3RRbXRwL1gwU0VzeU9rZUJDMHhHL0JvRzI5?=
 =?utf-8?B?WDJZaEhTU0ZWQkUyUU5JbGJVZm9xL05JRERqb0ZVblNJTTVjMzJpbnVlRzJw?=
 =?utf-8?B?N0Q3ZkVsaEVjNWZBdGh1eXVXb3FHOTJ3RkZzdXprUzlURC95Uk9XcUt1b05P?=
 =?utf-8?B?bXRHUTBOcE9QaXRScmlaVDNNT01IWG5NdHVwb1QwRkxBZUprYnkxWlFoTDJ1?=
 =?utf-8?B?ZG1XSXh2M0RSaGFST1JDZm0xOS9HQVMwQ1U0YmRFT3NCZFpBVllHK3dTK2di?=
 =?utf-8?B?ZHVIbHRRbFZETnpZM1U0cTcvMDh4bC9ZUnJIWFV0ZW94Y2xtanQ2WHc3T1Jz?=
 =?utf-8?B?Ym5wSXdtYlljWjlnREk3TjBqWlBjRzhlZU5QUWxvUjlONW1ORm1wb3Rua0ZZ?=
 =?utf-8?B?TWhweXUwcnREWEQ4RWlCVSthS25yaUtVM2ZHK3lZL2NZcTZXSzV5L0lJYUdn?=
 =?utf-8?B?M29iMnJENm1aenluZkdIODhSSEtBVitWZEpHNmtneExiVXdrYWRCcUxKN2Q1?=
 =?utf-8?B?TXVKVDZodDQvYVlFRklrdkIyZ2JzMUtrN2tGZ0oybVlpTkdVTDl5RFlHa091?=
 =?utf-8?B?TUJwNjJwSWhGMEJLYUU1Q2FPRWtpTklkVVE5NVhZZ0M4MUJQTDZNSHRxSjNM?=
 =?utf-8?B?M2htU2kvT2FaM1RUejhZejdmdGVaOXpaaDIzRUV2blJwNGFVVDRUVlM2VnBy?=
 =?utf-8?B?VXdzbWd6MkVTQ1VYS3B4WndCamk0Wmw4WmQzODFtSkRtQUFuV2lhMHEySTNM?=
 =?utf-8?B?Q2cvMzRxSmhMREhHdzR1VCt2ZGhsQjZrQ2htR3RZR29HWlpJWFhnbHNwYVR3?=
 =?utf-8?B?WDVlOEo0MFhlUzZ6YUFXYzFHQnRDbVBPdjd5aUpBcjNWS0ZoenRWMG1qeUdu?=
 =?utf-8?B?MHhUanl4Z0d1cGhJUzZiRmJYRjVKWUcvK0NsejFqNEJIbFBnaXpvbkZPUG1J?=
 =?utf-8?B?Q2l1V0dkREd6L1BPOUpna29VNytrN29pV01RcDU3bVRTUTNiWXhuLzc2S0kx?=
 =?utf-8?B?clpvZUhHZjZpaU1CYUhleFc2ckZGQnk1Y2gyRURzSmhTVVB3WHhGcTh3MTlO?=
 =?utf-8?B?UFpvQ0dpNUYvZDhwaHZieVV0dGJVN2dGMkROYm12THV0anMvMnUxaG9JWVJG?=
 =?utf-8?B?ZzI3bm5NRDh6NDQ5cjRtYXByODdmdHZsRGRmUytlQnU1RW1IbFVheGpvdzEy?=
 =?utf-8?B?QkN0bmlKN2FUdWtTYmhLT2NGQU9sanpVa3BYT2dBbFZJY2RQYWJoYm5BYlpp?=
 =?utf-8?B?dFovU1p3SFRmTHlHMHM4MUtLZ3B1U2J1NjNVSUNHNWJIVmo5QWROSitnblJv?=
 =?utf-8?B?cVEwcnMrUTNjRW9qR0hqdnozT1owT25Za2pnQ3hZZnhzcW1Jd3kxNUJVcE1S?=
 =?utf-8?B?K01jejhCQ1lmTGVpb0hLUUpkeGRWNGdMcE56U00vaVBUZmJMbGNhM1JscWlo?=
 =?utf-8?B?Z2M0Qk1UcmptUVMwUW5hUHAxZ1IwSStCWjVhTjZPZlhtUEZEamw4elhRYjkw?=
 =?utf-8?B?Y2Y2MGIvMjgwYjVyMENrMFNKTnVSWUl5akt1QjFZbUpxbXpCOUloTGYyekli?=
 =?utf-8?B?SklHak13QlhWMDFvVjVRbGdhK2d2S0hFcUFCU0NFUzZ2OXd1QXM5b3lxRnBF?=
 =?utf-8?B?ZXVVaUh1eWV4R2tYMUp3ZFhEOFVFWEZQR0tlVStiMWxJcDlqU1FsVnRFRnhh?=
 =?utf-8?B?ZkFpM0F2MnRIMEhKWlRBeUhqUHRqY1BOTkE1blhVMzVSQ2sraWNIWVllQzRk?=
 =?utf-8?B?VzhIODVjOUY0VjRGM0ZaQmlBemxUQzE0VGVKOExvTDhmblpYTk94MGxsOWll?=
 =?utf-8?B?dDFVaUVJUDNma1VkNnk0RlZ1d0JWK0gwZDg5ODJEZXdmbVpoRFAxOGl5UzNu?=
 =?utf-8?B?K3BFM2F6bTB6RnV0UjJ2SFBTVklhOVJLSU1za1lyODlrL0xqUFhmbmhmVlpF?=
 =?utf-8?B?UDFTRnJzYlluOUVWZ1pUeHBxMjJsU0lqMlBkTStBc2VXVU5IeDJGTnVJY2hM?=
 =?utf-8?B?ZUdyRzhZeGlranQ4R09ZVzZKa2dVNE4vTTdjQndUZjgxRmhSd1lVbDBWbThJ?=
 =?utf-8?Q?d+X50aTOB9Q9PrPE=3D?=
X-Exchange-RoutingPolicyChecked: z9ZdJN+q1FGoHyQDu8vFs4UnMNAIU92oFfDkoAey4j2u2lWCO/C7Dlh/HJZhdLz6Ly+nYIlSKzciWNc9d+lzb9Ksck38nlmoJ4WC7XBeaoR0uee7FUbXHuN6QkFweX2XrKUxKPXOHVOgipDZm2UvqJTINAK9Gzuc5dex58M96+Pp+bWjWQE00eClpxT+KlNenHz7DaPDPt3+/HR4k+qLeuWXfLYNp0YrsF4r1aEAgoJ1l38qzGdnijY5XyiBThzgiSFaibS25XW3xHMYKvrB+ukZCovZR2I5CgwA3B+9uvVpKvAWcBnFRGlI/ePVpXXBFMkMpETlanrXskgX+y0p2A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dd36372-ae4b-420e-67ca-08df1d4d44e9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 10:43:01.7310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHj9Nlbz4ikUtGOLof1lryD0z30GYRZiY7yEeK2xFrOZEDp7aWDo1oXozlUpcmpLXUJaa11PPVTO6VzgPUuK1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8608
X-OriginatorOrg: intel.com

On 25/09/2026 18:25, Frank Li wrote:
> On Mon, Sep 21, 2026 at 11:06:01PM +0000, Sam Agazaryan wrote:
>> Currently only the amd and svc I3C controller drivers populate
>> i3c_xfer.actual_len on reads, while dw-i3c-master and mipi-i3c-hci
>> overwrite i3c_xfer.len with the received byte count and leave actual_len
>> as 0. Because of this inconsistency, mctp-i3c reads xfer.len instead of
>> xfer.actual_len, making it fail on controllers that do not mutate len.
>>
>> Unify read length reporting across the subsystem:
>> - Clarify in <linux/i3c/device.h> that actual_len reflects the actual
>>   number of bytes transferred on reads.
>> - Update adi, cdns, dw, mipi-i3c-hci, and renesas controller drivers to
>>   populate actual_len on read transfers without mutating len.
>> - Update mctp-i3c to read xfer.actual_len instead of xfer.len.
>>
>> Co-developed-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
>> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
>> Signed-off-by: Sam Agazaryan <samagazaryan@google.com>
>> ---
>>  drivers/i3c/master/adi-i3c-master.c    |  5 ++++-
>>  drivers/i3c/master/dw-i3c-master.c     |  2 +-
>>  drivers/i3c/master/i3c-master-cdns.c   |  5 ++++-
>>  drivers/i3c/master/mipi-i3c-hci/core.c |  2 +-
>>  drivers/i3c/master/renesas-i3c.c       |  3 +++
>>  drivers/net/mctp/mctp-i3c.c            | 10 +++++-----
> 
> There are not dependence, suppose mctp-i3c.c change go through other tree
> It'd better use sperate patch to fix it.

Isn't mctp-i3c.c dependent on the len -> actual_len change in
any of the master drivers?

