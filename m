Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55C737F309
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250851; cv=fail; b=AhI4CySDTtbBNMp3u9iShXZg1NEui3nuYPquQ8yn5kbatnGwl/GhO1Q15f1fLQEnCW/sVPsub3eHKi8Vs5lzgE8rb1GFbmgI8Dv2rCwKSSme/bHiyy7FJhawoTBT6kG9zJR9n65PzU0A53RIkQjL2lhluI89LovkfwnPLDHcKFI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250851; c=relaxed/simple;
	bh=TdFWjgMLlCZHLFXhjNYdZYDaDcWRvne8QCdaxtSoS0w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NI/oXlNRiVlGZZ5iZv6CUqqxbWfNNiOivoBQKPCOhap86uldvU3bqfNey5axaGQH9ppd5h7h53DnqkxZpuR4skSiBDZFmTnpsMGaNa99Lm2G0y028dpTwQOkXO/ywliiwebY3wSZFP8Ik+EOJmqAQ0nDcP92zBzr27i8qql+j6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DSfm9t/q; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DSfm9t/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790250849; x=1821786849;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TdFWjgMLlCZHLFXhjNYdZYDaDcWRvne8QCdaxtSoS0w=;
  b=DSfm9t/qBc21rUxu+4ddqPzeP8ks2w9TwBallnlWTglam7n0rPBti5zZ
   r0/cCwpBBZ+1oGr9MHRyqeSFZJw4CP8XPYYTS5e742ZHzBFeVKtIhApcz
   uuFGT7DRonDDIOuDfmwkqKD0KdzbKAi1/v0HkW5iAHMG/rqtoFBa7/Eik
   inBH6UNvpKZlwGaDj/duhafo5s6z3GZxpidXvThDjIfn2nYAs5S1mwSas
   lznzX8AO/xG1xH7yelUFsBj4kQMfEhVIkQXejVBzuwbpU5cXzSA+Z5/5m
   YcArJjR/kYnQOP1yqDE6addC1sje9zYkvv1pYEH+vOstjJWwtcybbBoKF
   A==;
X-CSE-ConnectionGUID: DDTcyCC2SKe6ErlGAPI79A==
X-CSE-MsgGUID: QfATu498RmODqPtQelt9TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="116543104"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="116543104"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 04:54:08 -0700
X-CSE-ConnectionGUID: K9hF03DVSb2gMrAZV4fRcg==
X-CSE-MsgGUID: m+N7KosDTaCK+TQ+D8W+bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="278722408"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 04:54:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 04:54:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 04:54:07 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 04:54:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETBIHMu6B4TwZJV+s/J1NH7ZdpHKz/BVySDZUDcQRdWn96DRGLqepv2M/JBKG0Qv9mqvDOUKW6ge70XU5DUeCPyb3I9oTlLmwRfLzmzpAubGMjc6vq3zvYJVZuG3wMcQ1NRbFXGblkJYi8dVofIgT1TPeMpMjH6s1JBVa+Wp1UMITHMkSSEL2DpSvq8/NTN7XT0CbOoTKNtZoQinDKd99dTFeRmRMjwqhI6WiA4EDOapPwuHa9DdIQGurQPityABdceaWKNGn/apCJyT4Rg5lzQ/Qp+hbmKkVNEE+c6yAvvaOb2lcbsUL8m5fysL/xHNrbsheMBUj0x/wuURBDUz/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hj0RTIXnfV9vQzN/XvQHlLA3BOJKufYM8xm59mMpz6M=;
 b=tCkw2lRUEdjpR9/WHHI0ewOKxqinbbYGSwovmwbbnNYfwULFha9ijU3UZ555YqjP/XX5IIdBoWAO0ugEpcBznhHKvr5J2xGG7Qm645MBCA/Zx4xnCn2kAAWuB5JBZL0UXL5fnXBQnbRjgSAgj2st8+5V0HAQCrWoAaFVrzhcd+tATS4zEtQDFvi+atFRQ+KNauqFwAAIBmm6GzkU3DeOIcSkzSy5DhzwUhxrN8ISqoQEc5Z0KepITNuJ0tBBLldAcg60zkLcWBNslWXmTI7HVnorl7W1aKPS23ELP9uhg9tde4/hvWC/Htm5YwNoaa1dl740rK68kqybJ+wA6DWUTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SJ2PR11MB8540.namprd11.prod.outlook.com (2603:10b6:a03:574::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 11:54:00 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0451.014; Thu, 24 Sep 2026
 11:53:59 +0000
Message-ID: <79492a3b-dfe4-4311-8ded-0d77b8ce2a57@intel.com>
Date: Thu, 24 Sep 2026 14:53:54 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] i3c: use actual_len for read transfers
To: Sam Agazaryan <samagazaryan@google.com>, <linux-i3c@lists.infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Arnd Bergmann <arnd@arndb.de>, "Meagan
 Lloyd" <meaganlloyd@linux.microsoft.com>, Vitor Soares
	<vitor.soares@toradex.com>, Oleksandr Shulzhenko
	<oleksandr.shulzhenko.viktorovych@intel.com>, Boris Brezillon
	<boris.brezillon@collabora.com>, <linux-kernel@vger.kernel.org>
References: <20260921230603.2518652-1-samagazaryan@google.com>
 <20260921230603.2518652-4-samagazaryan@google.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <20260921230603.2518652-4-samagazaryan@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::34) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SJ2PR11MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: c65f9538-5121-4796-8e19-08df1a32853b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|10067099003|56012099006|3023799007|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: BSn+FZYQTgm2Cy4NeejFjJmMTS/d0+AMPyHBelVe6tcyGFMb/tOBYA4uc+VqRdPPJjiVo0mSK3+BVl/WvyWVbkyJOxQbbTTsUhjMLLyWbjVhA4jrbEJCHJM7gyajtlmv1styZlakoYlsc8l03tbQFJh+GwCSiEywHreucUYq/qixB8BB8DbTQ+S1VmEYcL2t6Trt9+V5c426U+etb8N46l4BXtQona/e9QsPqlUl01rshrSrDizt+1c0DzFO3b++jwmVEDs4y2scBYu6ns05wtDh1RJ8UgNy6YSuMau/7RjGKlZLRbG55I1JCGN/OGfcnTgO25Cc+PNPG8iJks4uMvI7WZfM4x0dpZpWofDtUepDNdzOXkbjcCuQr7QsvTO4yXLp0k0wtqnZBqGRByRYw3Vkt3pAQ4/Bw2KfO+//U5csoaONwPjGeG4x3U11Crxt73DCQblokYlU/RFo7m5FUSic95PZroqUiiTNaugTX8Px7KjgVfBZRpBGndI8JUn7OBqco7AANORWxLeu6a/0qopn+7jlGX4drgkqbC6xuDBjcFJa52yIymgK9+ZUciEwGWXCV56kkFjBoauLsSb3YcZuAE52U752eME4REysvVA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVcxU0ExTlp4bWNtWTFCWHJjOGU0a2RyR2lXYWdIaGNCTVpNZlY4NldDVjR2?=
 =?utf-8?B?YVdIZlJSVnZ1YXVhbi9jVjVybENCdWtINjVlZ05TQkNqNmNYZEplY0hET0dx?=
 =?utf-8?B?L3phUFFMZDkxUzMzOXVaajBSWVV1bW4wbzZTdG1SRXpnaTJUS2UyUEZQeVRx?=
 =?utf-8?B?NS96VXhxZ2tJWTJra0N4VmJnVkFiU3c0S0wvOGRzNGZHU09PUE04a3lYOWFL?=
 =?utf-8?B?WjIxQ1lPS2ljMG1UR1Q2cDV3RE5kckhYK2FwT01zRHo4SjVwU0w5VnAzYzFJ?=
 =?utf-8?B?QlZYQUMyeDdSTWV4U0kvYjNNSklUS1R4cFJYSWZvMDhoK1JDKy9EbGE3U3pn?=
 =?utf-8?B?dGNERUl0YmY3Q1NmMldwcUFGY2JhWHpmVGsza2ZiaWF5UnFrNXcyL25mVUFa?=
 =?utf-8?B?RWhIRGozdVE1NzRGZnlkNGJ3N0pUNWlSSnVGR0I0eXpVM3V2eFRZWkFPdmcr?=
 =?utf-8?B?MDJQUDJpMjFaSk0zOExiSnBiOGIvdFpCQklBWGd1OVY5K09sZ1U3WW5Sa09O?=
 =?utf-8?B?OTlFVnVQYkdicTMrOUVqc1hUK0VjZ2pXdFRnM1ZoaUJrcDZrM3ZHYktlWlNS?=
 =?utf-8?B?eDdubUpRRGlINVFYMWF3TUc4TlEwczRkOVVzNEE0c1pRa091c1pzR01SR1cy?=
 =?utf-8?B?N080dUtQN3NQbms1d1QvRjNRMi9namc3c3lBRUh3S0JGQTJCUWVFaFZaa0dE?=
 =?utf-8?B?azhWdHoyb0F2SkdxMGhCMFZ2ak5SQlZDOWdNUFlENHpyWkRPK1FUTlJIZk5L?=
 =?utf-8?B?K2RxdExaZnk3enYxL0NkYk5JeXZDbDNMd2FWUW9qckc0OFA5SzNEK2VUd21Y?=
 =?utf-8?B?QUFlUHJqTmlvYWg4UzkyVGVKUkpoM3ZhcDlRcXNISnVOdzNqV3BCWTNUbEFs?=
 =?utf-8?B?QWhNd29LT3kxTXh4cm1iZXdJR0pOT0dxL2xmZWp6dXpVRmxOYk16TlliTlA4?=
 =?utf-8?B?OHpOZ2xIU3ZlbEswWm90Y2didG9FMWpzYWNtZXRjT2h2emcxUE5aQWhMazRW?=
 =?utf-8?B?MC9FVC9xNmttbysyWVlSTWx1MzlmcW1iNlEvSzNPcE00OURmRnE0elcxR3A3?=
 =?utf-8?B?cHE4dWN0dllLSm5JT0NMY1dYNDlrMzJ5SWNtMW9uSnFCSllISEYzWW9zUVB5?=
 =?utf-8?B?eDl5Kzg1dFdtVmhnaDlKdEJHM1VldHVxN3dtTGI2Yk9WK1FkM3pMZURiOVFG?=
 =?utf-8?B?emkvZ013amhnMit4SHZ1bTE0d2ZZMVNJM21keGNiS2Q0emYyRUtMcnlvZUNQ?=
 =?utf-8?B?cU1mVlpPR2RjamxqeVpZbTlpUUhSSkMvZGl6c2c5ZEUzMi9pVDdCU1ZDL1Bh?=
 =?utf-8?B?TVN5NkRGZm9DU1pmYi91d3pvWHpRVXg3YUhwMHpoc3ppcVlOdVF6MGkzc2RW?=
 =?utf-8?B?QmVaYTlKR2FpUEh2aC9EV0tTdU8xSSt5K1hJazdRN2t0eFEyMlFGcVRZVVdX?=
 =?utf-8?B?ZFJsLzc0OXdqakFta2srR21LazJKQkVyd3hWeG85UHJTVUJ2YTMxanR5TkN4?=
 =?utf-8?B?MWxpZjNnR05LY3RYWDRsN01vd2NWODFPZ0RvRTlmdWJSQjNFbGJDdFhaemU5?=
 =?utf-8?B?Y2xXSTNReHVDRkJIRi85SW1NQXRSb08rdTlWZHpQV1dKQzdKLzlQWjNRcTNV?=
 =?utf-8?B?dlN1dXM4RmtGbmY0RjNiaHFxUnJhclllWFdJcWI2VVFucHRQTUZsYWhLTGVB?=
 =?utf-8?B?NWsxWU53K1liUzVrOUFITHF5MmtJeG1UVzQ0TVFnck8xb0lNa2hMNmhDaGFh?=
 =?utf-8?B?RlRNMHdnOVUyNnJ5ajVWT3Fwc1VFdnVWaktBYm84Z0dtRTZVVXlpZlBydk5U?=
 =?utf-8?B?OUtzdVd3SE9Peks1ckVNRlpZWXJLSWlSazZFaVZRVWlRTnFzZndjRFJRbldG?=
 =?utf-8?B?RnZDc1VXaENTMjJPQkJkQ0xTdWRCVWduV2IzRkl3WlhTS0tiazdNL3NaQzND?=
 =?utf-8?B?Yk1ZOWJNdUFDWHhIZTkzYWZ2Z3NkMkxGUnlFZFpjUzc5TzI5WGJQaGxVdVZq?=
 =?utf-8?B?VHp3SnJDRk9TbTMyMnF4bTZuQmpZRVNCd2VJZnA1Q0E0NnNUSWk0akR3RHVw?=
 =?utf-8?B?eVZPL3QrQjFOT3cyTDJOL1NCZjVwM3c4ZjV2c1AxYmNHcWFORStLQk5HZFJ6?=
 =?utf-8?B?bVBJWFNOTkVnQ2swZHUvS0cxZHVzcHo5ZEdmcjZLM2t0a2dTSVdSZ285TjY3?=
 =?utf-8?B?VENSZUpHVytGR3R5SUFxbUlnSDF1RXVCOUkwbHJhRjN1MnA1WnRNeXZGY2FJ?=
 =?utf-8?B?Ukg3YVpob3VwVFBmUUJ3SVdqZlYyZVRkb3VKekdnRFB2MG9FWTBCK291WFQv?=
 =?utf-8?B?bzZ1d29ZWnFFeGtUckYrYjAwTEpva2g4MlFpNE14RGpVTHFBT2IxQkd1ZUZj?=
 =?utf-8?Q?0z4YjFEYK4ofu47Q=3D?=
X-Exchange-RoutingPolicyChecked: wRos4/2lvdXnmWnbWwodISIUR2ZGKc63TqVLn2pLZJqskdcTE2JVIhY/uB2LYwoyBmfO+G0pUog6wi0obswvKzythODkUYyXCw1EUY0Oe976uAV4sQ6rA9Y96U+jdkeEwEdpNihyL+BsNVi61ySpMozOl1Q64RLSjHEQY1JvED8pMwV42PBzd9NMQJe0NIorQ7huL86ZiVNuWR8YU5h7IVJ8IholDp8zQ+QqGeEySOvixJUkIMZFT3zrj33jhjXnDBVf08Zc0jOK/g6I9JET5rKcqyjSWdE8wx0ZvURNnCn7CpXAib/ewMik04as/PrSv8cfquloXKnrX+OHw7kL3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c65f9538-5121-4796-8e19-08df1a32853b
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 11:53:59.9217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cSMy3qB3PGB84WQz2yImYIX0pY3D18rz5wups/XyvblaGeNE0bfnndjVInDN5yTbOCIcO7Uf8Dn8tgZn12ta0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8540
X-OriginatorOrg: intel.com

On 22/09/2026 02:06, Sam Agazaryan wrote:
> Currently only the amd and svc I3C controller drivers populate
> i3c_xfer.actual_len on reads, while dw-i3c-master and mipi-i3c-hci
> overwrite i3c_xfer.len with the received byte count and leave actual_len
> as 0. Because of this inconsistency, mctp-i3c reads xfer.len instead of
> xfer.actual_len, making it fail on controllers that do not mutate len.
> 
> Unify read length reporting across the subsystem:
> - Clarify in <linux/i3c/device.h> that actual_len reflects the actual
>   number of bytes transferred on reads.
> - Update adi, cdns, dw, mipi-i3c-hci, and renesas controller drivers to
>   populate actual_len on read transfers without mutating len.
> - Update mctp-i3c to read xfer.actual_len instead of xfer.len.
> 
> Co-developed-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Signed-off-by: Meagan Lloyd <meaganlloyd@linux.microsoft.com>
> Signed-off-by: Sam Agazaryan <samagazaryan@google.com>

Looks good.

1 issue from Sashiko:

	https://sashiko.dev/#/patchset/20260921230603.2518652-1-samagazaryan%40google.com?part=3

Also i3c_dev_do_xfers_locked() should probably clamp actual_len to len.

> ---
>  drivers/i3c/master/adi-i3c-master.c    |  5 ++++-
>  drivers/i3c/master/dw-i3c-master.c     |  2 +-
>  drivers/i3c/master/i3c-master-cdns.c   |  5 ++++-
>  drivers/i3c/master/mipi-i3c-hci/core.c |  2 +-
>  drivers/i3c/master/renesas-i3c.c       |  3 +++
>  drivers/net/mctp/mctp-i3c.c            | 10 +++++-----
>  include/linux/i3c/device.h             |  2 +-
>  7 files changed, 19 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
> index b35386260350..d033bfd4ecc2 100644
> --- a/drivers/i3c/master/adi-i3c-master.c
> +++ b/drivers/i3c/master/adi-i3c-master.c
> @@ -412,8 +412,11 @@ static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  
>  	ret = xfer->ret;
>  
> -	for (i = 0; i < nxfers; i++)
> +	for (i = 0; i < nxfers; i++) {
>  		xfers[i].err = adi_i3c_cmd_get_err(&xfer->cmds[i]);
> +		if (xfers[i].rnw)
> +			xfers[i].actual_len = xfer->cmds[i].rx_len;
> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 4563d8761ba0..28e8eb293747 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1029,7 +1029,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
>  
>  		if (i3c_xfers[i].rnw)
> -			i3c_xfers[i].len = cmd->rx_len;
> +			i3c_xfers[i].actual_len = cmd->rx_len;
>  	}
>  
>  	ret = xfer->ret;
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 2d98c1ce9b12..331062c10b31 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -795,8 +795,11 @@ static int cdns_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  
>  	ret = cdns_xfer->ret;
>  
> -	for (i = 0; i < nxfers; i++)
> +	for (i = 0; i < nxfers; i++) {
>  		xfers[i].err = cdns_i3c_cmd_get_err(&cdns_xfer->cmds[i]);
> +		if (xfers[i].rnw)
> +			xfers[i].actual_len = cdns_xfer->cmds[i].rx_len;
> +	}
>  
>  	cdns_i3c_master_free_xfer(cdns_xfer);
>  
> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
> index dadf049bd4b5..f74c02fab9e3 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
> @@ -509,7 +509,7 @@ static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
>  		goto out;
>  	for (i = 0; i < nxfers; i++) {
>  		if (i3c_xfers[i].rnw)
> -			i3c_xfers[i].len = RESP_DATA_LENGTH(xfer[i].response);
> +			i3c_xfers[i].actual_len = RESP_DATA_LENGTH(xfer[i].response);
>  		if (RESP_STATUS(xfer[i].response) != RESP_SUCCESS) {
>  			ret = -EIO;
>  			goto out;
> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
> index 28c0927a0179..a3dcb4cd9b0e 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c
> @@ -918,6 +918,9 @@ static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_
>  		time_left = renesas_i3c_wait_xfer(i3c, xfer);
>  		if (!time_left)
>  			xfer_failed = true;
> +
> +		if (i3c_xfers[i].rnw)
> +			i3c_xfers[i].actual_len = cmd->rx_count;
>  	}
>  
>  	if (xfer_failed)
> diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
> index 6d2bbae7477b..5f94c11a1712 100644
> --- a/drivers/net/mctp/mctp-i3c.c
> +++ b/drivers/net/mctp/mctp-i3c.c
> @@ -131,12 +131,12 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
>  	if (rc < 0)
>  		goto err;
>  
> -	if (WARN_ON_ONCE(xfer.len > mi->mrl)) {
> +	if (WARN_ON_ONCE(xfer.actual_len > mi->mrl)) {
>  		/* Bad i3c bus driver */
>  		rc = -EIO;
>  		goto err;
>  	}
> -	if (xfer.len < MCTP_I3C_MINLEN) {
> +	if (xfer.actual_len < MCTP_I3C_MINLEN) {
>  		stats->rx_length_errors++;
>  		rc = -EIO;
>  		goto err;
> @@ -145,15 +145,15 @@ static int mctp_i3c_read(struct mctp_i3c_device *mi)
>  	/* check PEC, including address byte */
>  	addr = mi->addr << 1 | 1;
>  	pec = i2c_smbus_pec(0, &addr, 1);
> -	pec = i2c_smbus_pec(pec, xfer.data.in, xfer.len - 1);
> -	if (pec != ((u8 *)xfer.data.in)[xfer.len - 1]) {
> +	pec = i2c_smbus_pec(pec, xfer.data.in, xfer.actual_len - 1);
> +	if (pec != ((u8 *)xfer.data.in)[xfer.actual_len - 1]) {
>  		stats->rx_crc_errors++;
>  		rc = -EINVAL;
>  		goto err;
>  	}
>  
>  	/* Remove PEC */
> -	skb_trim(skb, xfer.len - 1);
> +	skb_trim(skb, xfer.actual_len - 1);
>  
>  	cb = __mctp_cb(skb);
>  	cb->halen = PID_SIZE;
> diff --git a/include/linux/i3c/device.h b/include/linux/i3c/device.h
> index 971d53349b6f..f868a7bf2bc9 100644
> --- a/include/linux/i3c/device.h
> +++ b/include/linux/i3c/device.h
> @@ -59,7 +59,7 @@ enum i3c_xfer_mode {
>   * @rnw: encodes the transfer direction. true for a read, false for a write
>   * @cmd: Read/Write command in HDR mode, read: 0x80 - 0xff, write: 0x00 - 0x7f
>   * @len: transfer length in bytes of the transfer
> - * @actual_len: actual length in bytes are transferred by the controller
> + * @actual_len: actual length in bytes transferred by the controller on read
>   * @data: input/output buffer
>   * @data.in: input buffer. Must point to a DMA-able buffer
>   * @data.out: output buffer. Must point to a DMA-able buffer

