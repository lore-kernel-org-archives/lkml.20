Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793643646;
	b=dOWjWxZFsQz2gLGOWZ4zmpudhLb0ItrfU4EeJcmOfjWBmGCMbue0K2waNM9dH4jG/QKi
	 5AxOYgqaxmSJ5Et+pcWmCxAQIJXBKuMsCM06gEjlmuyYw8mCjNPV/PbbQt7URMktM3U1W
	 H3LCngRDaB3UWmveb4w4+Sa7iwiiqqbgzuUyTGhQ2f/ZRVIBOZ9EiHUs9snUOHTDcTDf8
	 g3NAa1wOiJIwsOgS0Fgg4IV341i0zfUO6ZjCQ+M7OQFct3xG1/l1BtmypeNinSLg2aqFj
	 A3xjI7AwFg6yNI0DixI+lnTk4LnNu+0OR/SSRK4NGHC6W69bUPt8WAlJxluLGuye8HA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643646;
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
	bh=swAB2qvxoHyrgQjVOw2F9zw8aUMtolxvhqLt138u/n0=;
	b=w+V9v9082NkMqaNbjTEydL91MnMqG4kPyOY3o01eO9Tld297AEaVdSrkfsr/Z+NEkUJ7
	 InLg7fmPL49H+WX4UrawkGYTKfyYh93Iw+y18CwcshvrNdu78Kg7jQrcUTuClt+qPHS/R
	 Q7bOveAnRa/WZ6VE2YpeaDhY+mp5eAkgZlYiQa7bjPXkhZQ6kSHvT9wy5Ncv0qURdP8MC
	 Tj/8VJMLfllDwIL9qrTf5EBUzgTRXLHGHBSe9mAaZVuYJjC+pFAH+RUutpuujIqNMCyUN
	 E3RuHhpp43bHMQbHGkTKK9Yx/nwdzYSs7RKyEAJjDH4MEndwB8S0gJmg3OWdhP3Wiog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HCd+dc3t;
	arc=fail smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4229606A324;
	Mon,  2 Nov 2026 18:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4229606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HCd+dc3t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793643643; x=1825179643;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yvHXkf4ePZHWDoMu3sKbVuFlBlLir+U3BTyFexs3ZhE=;
  b=HCd+dc3t0BwoDytl2JUzy2ajMTEEAD5LrWo6J7hjwCB83Ej6ICaZlz48
   u+k/DHj3N69DFLL2Dd/to4XL+dZeQUlB5tz7nSMgcA7YAaY1wwDZ7XjTh
   YFebESMx5CeekNVhtCAAQTfXppWU/vt84a6WvEsIdddBU++uOEpcuFmvv
   NJ2mplWUNmtlROv2J7HYNfAisybb/Mok1HDFCWZzRYp7RLAucqOaglGBe
   klBlGNOJEaQQwoeHYvOwwiBJ/1iP2LU379UsNlMJLhSnaYkj9aVYmUMvh
   CryFqLH4+wg7LQ1h5wQga3rY3N5kzc7Bnlf8TPy3osx1cunawzq+uwfjQ
   w==;
X-CSE-ConnectionGUID: CfbBTW89QoCPANRokq60Mw==
X-CSE-MsgGUID: iJRJ/wQ8RX+qSJAPaDxBsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2359419"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2359419"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:20:43 -0800
X-CSE-ConnectionGUID: ze+XGzf3R9CQ7/QB1aKVvg==
X-CSE-MsgGUID: FIh12knMRTejXCj7HQ/WdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6304523"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 10:20:42 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 10:20:41 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 10:20:41 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 10:20:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5AEoJBbzLHnMlY7+788CJLfPBNnrXdGeU7QACP7T1k681S9PEjKWvTw+0aYsfwvPLcQ3DPiqaHjG+eVTyM2eB+e8w8LtRsYXu8l0gPOKt2eDZSR2a8jS3aSPRtNzaSr3uImZCqtCLOdhDc3y8CreBvTLmpicaNP6Ry9V8gcEbu+R3NI5F3rJUNrgJHu6I3QuI+xz74mCv+CnhJZrcJw480tnTsvoW3sAStKyDQYA93lLJKS2r1EzWbBRhDaJTmSAMzWSOg2K9ojsHgM1Vt+KbtZ4raEd+TDMgAo4ifqSASWX1to9SmlIihcmcP1jIHi8c+EKnSBeRrFIj4eNowlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swAB2qvxoHyrgQjVOw2F9zw8aUMtolxvhqLt138u/n0=;
 b=VZo9mfOg7wy/S6tnXI9Ou2SALNbdV5fF/YgcwNzrzqn4vPPAQoZnQ0kLXOKWTq1umoqCVukt3uY3L9z2po5ftjbPvFlB939ZpU1zHuIxaoeIvO/ANyFWxpDJIooUsyDVjtRkaiM0gxwseMXZueCyQziuoQGdWaqcDruiBY8MxCxDRsoGhMWiaj4SOaVCmbd1Jo68gFNtulr77O4M7SKA7Pnm/3lnALuXy4n12vwvJ3R9wP/JAUatOlJrkk2em2ouA4TVuaNtXEN3lQreoZWvuZW+f/c1yuRTK94imIx6CDuQ28QUaQkGs4phBKBlD8ZdHTk9Mxt91hhtijTr7MA27Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 18:20:33 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 18:20:33 +0000
Message-ID: <d057c4a8-5661-4e77-8242-46a72f7980d0@intel.com>
Date: Mon, 2 Nov 2026 19:20:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] ASoC: Intel: avs: Expose common PCM functions
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
CC: <linux-sound@vger.kernel.org>, <broonie@kernel.org>, <tiwai@suse.com>,
	<perex@perex.cz>, <linux-kernel@vger.kernel.org>,
	<yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<vkoul@kernel.org>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <20261102181042.1922005-7-cezary.rojewski@intel.com>
 <20261102191823.117f3a58@milkyway>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261102191823.117f3a58@milkyway>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIUP296CA0108.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:351::19) To PH0PR11MB4952.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|SJ0PR11MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: a834b2c5-298f-4db1-246e-08df390dfc03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|11063799006|4143699003|56012099006|261028144727099003|261022105027099003|261026140227099003|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: tIAlY2A6/B/MU4+qhLZAO9zhzAQ/d0B9BinQdGp+FlktcVtCZadFbnDofA2ShEI9Qskr6N9hqp8V/Mu2jxK2NPsvTujfTBiNRT7U+pNFXiTF9db0uKjMLZRddHfMEYJVKYNUcnP/Xp4WmXRNfHqtoHwK8Gm8XQxMdV/2OqiNWv31OFfZH0/Y1BDoAKzn2qroejx3b5J3299BTe5fBM3/p3FIx0zskHwOfsqIWZhGgSwaQLzklY/jU1Qkjh0F+dSGXNfpqPU/AKoItCmt6gdQmuHwSJWtj7JhRZTkmp2Jsn447JIgPSB6wJzcU6y2NlCcHt7yC83iNzaykpp688fWwELCcjMbHIi76VvOwGyZFiiDm4z+i+0U8C6TumiC7xzG0GondLk3QlVqyil3jmwX7mINXxJp0W4fN+4s9xQKLiG47HriuV8kL103j65QldqRhlPxPSPIyoO+yUDSU/YawnxFXyISAi4mJh6vMib3KozsqBKnkTn4XIehNnbhotNrtgfJdrrncPAZbr5JPyY8SNh3JxjJze6KaX5eboWQg0Rjx7xWWKyM6inHXuRBLnneGoXDcvhNg8vfhF//I/GBg3lpErvqNuaLm9J78GnccnCivVO9SIiN5uMyK9od9jyzC3UCjgxtcNXwotj1SczS9HKejIRt1Xb0gMKooc8YOOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(11063799006)(4143699003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXVCc0h4Z2duNXBMRnhOVGcwdDFVWkhZR1p4cmlQVUc2Sy9qeTQ3T3AyWVZi?=
 =?utf-8?B?MzVCeHlDSU9iSWE1MC83TU5YMU5JWkNGM21uM0huN29uRk1NdGd0NGhaUnBL?=
 =?utf-8?B?S2ZqWVRsaitzVFlBdmJOUURXMVFxVjZWRFd1UC9JaFl4eTVkKzB0Nm5WK3lv?=
 =?utf-8?B?bSt4RlhkaUFGMzdxdTBJa3BoMWhDZ3Q2WTJpOU5sS0ZJV0hrTlJ0cEMzWUUz?=
 =?utf-8?B?YW55MzFoNTdhYW93U255NFNQU2xFbmZ3dHBwSVBiZXhZSFNUZ0prVGh1N2M3?=
 =?utf-8?B?SldpY1g4dk5uZ0FxWjFKZlhHdStZbW9QZ0cvcEc3Wm9sbTdSOUVuc2d6cVUy?=
 =?utf-8?B?STZrUUErVUdUTlJWc1k1eHd4UGlJVUpuUkhtYSswUlpoS21OeS9DNGdHNm1a?=
 =?utf-8?B?d0gxMDVISzR1ZWdLOVArTzJYZzBXRHE1SkJBK3VSN3hkYTRPUUxzb3BxVTlu?=
 =?utf-8?B?TVF3TiswVWF2NFFPN0xoMFkxN0Rhb3lNZG96U09YN3E1MWV5WFlvZ01tUWJs?=
 =?utf-8?B?VTlqQU1DQXBlY3FXTm11cmxENHNqVVdWc1lCVTVyQnZLZG1LQjJYVUh4QUFs?=
 =?utf-8?B?M0RsTkZYeVNvaVVycGFXYUpoSXlBY3BwelhiZTFTTnZibENQV1UzeXhOKzli?=
 =?utf-8?B?djI0aXMycVpyS3BjQUZsRnV3OWVPYkJ4UE0vbnVjcld6S1BJbEhOSVFrVVFW?=
 =?utf-8?B?ZzVkbTFZOVorU2gyVjlXSCtoTG8zRS8xaFE1MGxkWHllMk5LVmQza0JSaW1j?=
 =?utf-8?B?VVRIK3BjS3FpcjFsUzFhbm9nVFlaZFUzOG9uWGZXUTNrK1Z4Z1NyZkZHcXQ3?=
 =?utf-8?B?NWx1MnhGVW5NMWhBR0NJeXBDNmVHQzlNZDZFSk1teG1JV1JXOWVUK2M5MzdP?=
 =?utf-8?B?R21XWHFYZmRub0NINkFoaXgvUW4vTFpOSTdkUENibE5HMEtNV28vWTJkNWpE?=
 =?utf-8?B?ekJsUXd1VnlrSGNGOXBGenJRRVQyRGVqMmlOT0VjZ3YzVmNBbGNHQ1JPYmlO?=
 =?utf-8?B?cFdQQ3UzNytOMTlGZmNkZDlhNHFPQ1pad21wTTZjdXNoOTNFQ01GOXVQcGhn?=
 =?utf-8?B?eldNdkVDRngweURxOW9YcnZ6NXNXMlBrM2ZPZFl0bTE0a0hCOURBQVpremE2?=
 =?utf-8?B?NVNldEdza09kOGp2VlFIc0kwUlJkZGR2MGVma3lNWmhGdG1KYmZyZ0wrOVJF?=
 =?utf-8?B?bkczYWc0VXkxcjVUUTcrVEVJSUFtVHpwNkQraFpucHdRb2RodnFlTDlndHpD?=
 =?utf-8?B?b0R4RkJVanIzcHZaMDlkSXRTU1hGdFRlYUM2TzBIV1ZmQVM0WWZnUmhNd0hl?=
 =?utf-8?B?ODRyRlVJb0NSRS9mTFh4dVBPMGJJODJtakt1VHBKbnNrWHVGbmtSQ0ZMWTdk?=
 =?utf-8?B?dW9FVGZHWUlRZmdUT1Nxb0FJa24zRHlkMHZablA1cW5XUGw0L0traFZFdTha?=
 =?utf-8?B?OUl3SmUzc3BZdDc5WC9JNWVoajgvVWYrMDZtTEV0YkZya3Z4YjdwLytkYnU4?=
 =?utf-8?B?clJGcGRQR3NTSEpER2lzaTk4eEdRZ0xoOG0wTy9aZVlqUWxoY2tmSmE3NEk5?=
 =?utf-8?B?TmtQY2N0MERvYWtyOElPcUIzNHpKckxHckdhY2RsMWJLOE1EcWhPcHhFZisy?=
 =?utf-8?B?c21NRnBtT20wNWxBSmFXSmpmZE1wL0FQblRTR0s4Ry9lL21oaitKUWgrT2ZC?=
 =?utf-8?B?Wmdra0lJcnZsY1I2OGZlUFlINGFzUlp4VE5tNmV6RUJtSUFPNWhwaEZxZW42?=
 =?utf-8?B?RjBMVEczUzdMNXZtTXVJV2U5dnNtNWF5YytZVTVsZ0thN3IzYmhBWWw4K2FG?=
 =?utf-8?B?RTdZWVBpZmF3NXh6V1NaaTVNVHhMYjB1TWV2OXhudDROcHBXVzl6U2E2MFBR?=
 =?utf-8?B?eStjbVd1clNMc0hZMVVDem5Uamt4OWhxWGEwRlkraUF6WFNLZzBnUXI3ZnpL?=
 =?utf-8?B?TmdIck1NNzdMSElFS09vdjVqMmUzQW9vY1pOVW5Sb0NhZ1RQaEJRZEI4enJO?=
 =?utf-8?B?OEU3aENkNUN5c3lHSnlyeXpWd1ZDRXZoMzhienlpM2hZSVJQTys0cFRDaHR5?=
 =?utf-8?B?SkJuOUJ4aDJzdVkveG00MnJpT1VXNGxMb0UwbU85T2dhcnVUdjZ0TmRwMjdq?=
 =?utf-8?B?UmcwUy9leFFvTm5kNDhoOWFINWgyMXE2Z3IrSE9CbUM4SFBHeUNVWStqNTcz?=
 =?utf-8?B?NjhZc05sUWcxVnBxVGd3RGhzSDVWNUVjYTIxbkw5WkhEa3NxS2hFeE9JemxV?=
 =?utf-8?B?bkxRQU1xbkViMzRReEU0RWlERlVVVTdNZnBRcnJCRTB3T042UmRpaGd6ZlJM?=
 =?utf-8?B?czJJRXZOL3l4V0RjUnE1OTlBZFhCMkdpTzNjOGlPTUlFRHhHcDlhQT09?=
X-Exchange-RoutingPolicyChecked: NKUa2bTUK8nRSHVzrQhE2jKiDtTmTc3zEkHmiu7HBVIxCUvBXUrnH+b94lSiKN4oIX6YDRDIUxfDqb5jQAlPMV9TO7v4jA4O4gQwA/l4ipEix2HUflh5tg4mJNlGe00oLkpF823rn9RxjdjNeCuOC8ak86Q63mTP3cBpBlLFh7LLEgAX7Pk5SIre7YFQOYJlbsSqg0Mq+t7s4vNFtipoeZ+10mEJpAX9bu480W5ds84UoyR7wAMMSW5pJ/XstjbGxqOR2OPUkQ9uOajIi0DaoF/lOb9biKKnn5ekOGcxcULUsFVvTKR3TJhGDBSuFkpvLIwKCvVK9Hgoo8xhh5tADQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a834b2c5-298f-4db1-246e-08df390dfc03
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 18:20:33.6414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h3n2az/plo1900awPU7zRcvFGQKDX0Q9UmS3fmoK1mnbJKKEqwsZM/bfSP2Qul6guqKfNqtmZxbxoGa0J8f+5sahDUNN7wLH57ax6XS4Nno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
X-OriginatorOrg: intel.com

On 11/2/2026 7:18 PM, Amadeusz Sławiński wrote:
> On Mon,  2 Nov 2026 19:10:41 +0100
> Cezary Rojewski <cezary.rojewski@intel.com> wrote:
> 
>> diff --git a/sound/soc/intel/avs/pcm.h b/sound/soc/intel/avs/pcm.h
>> index 0f3615c90398..ac127ade4ca1 100644
>> --- a/sound/soc/intel/avs/pcm.h
>> +++ b/sound/soc/intel/avs/pcm.h
>> @@ -9,8 +9,57 @@
>>  #ifndef __SOUND_SOC_INTEL_AVS_PCM_H
>>  #define __SOUND_SOC_INTEL_AVS_PCM_H
>>  
>> +#include <linux/device.h>
>> +#include <sound/hdaudio_ext.h>
>>  #include <sound/pcm.h>
>> +#include <sound/pcm_params.h>
>> +#include <sound/soc-acpi.h>
>> +#include <sound/pcm_params.h>
>> +#include <sound/soc-acpi.h>
>> +#include <sound/soc-acpi-intel-match.h>
>> +#include <sound/soc-component.h>
>> +#include <sound/soc-dai.h>
> 
> Some headers are included twice?

Indeed, ACK.
