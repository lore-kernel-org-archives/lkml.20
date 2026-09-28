Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036C2396B8C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631869; cv=fail; b=j1BXZfn9QpSdOIvnAQAvG/zbY1i2tmdCv5YCOosAhHTAQI7Amqmmfrxv/IttgcqkPCZ+0rx2PRLehwNjq5rKIv3AoeCJz6XfAodu7wQhtsHLhUBmJh4XT+r2KXI8CWiQ7kXhi20MxXuqcOjC0QttARLakcf2yFsZMPK2+q16ZYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631869; c=relaxed/simple;
	bh=qJoFRqt7qrhUK49G4y5ZUMwhWno8m2MXaShMhIqOjpg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SzsJ4cIz7xts5OuKeZIHKI8e+V6ot+4LfkSgdGk+4HJMv/RMLdWu1EDuKxjpcIFfTo3kVOeLUhSoasYiVar+MfIMsa9xEzalKN3JKXtWuEBXwZr6G12tSz170ZMznnx28fmm4kdvcPp0hZxJb03LGbjgxB3uh7i1LKj+9wws0iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLKmv02X; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLKmv02X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790631868; x=1822167868;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qJoFRqt7qrhUK49G4y5ZUMwhWno8m2MXaShMhIqOjpg=;
  b=MLKmv02XTepBoWaV8F/mRGDLBxhbcz1f/yDb8l1YAeSuYnLy+nDvL1+G
   see/w/WBeXcnphH5KU8nWTlCK3QbYlYUffWYbXxI1revyBaCU1ISCmR/s
   uvnTxH4jeW2Qts12JwQ11b9MrFTcsND9NpAow3amb8fjpcLqzWcUYUNag
   xKldT826vgwc+4c/bNvdDv5boSZ2fOOSuivZ3VXgbqvlW8yOld2WHl+hH
   7UuzaOs63Cn27LssYac2YJTM/KZE0Dfm9lLxaV1DLmcVz4c8BJ5FSZt/C
   39EQDO4W52Uj3qNf202RGzivaIpQ5MI11h7vGqScYZnvyy7q2KYm24t0d
   A==;
X-CSE-ConnectionGUID: eqinrS73Rs2L5NbJLUIkJg==
X-CSE-MsgGUID: u2wVj8zrSJux1tBaFEauaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="91364154"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="91364154"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:44:27 -0700
X-CSE-ConnectionGUID: 5G5PjjM+Q7aw7fZbBTCF9w==
X-CSE-MsgGUID: g54viOZ2ToumitSYwz5vhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="275302988"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:44:27 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:44:26 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 14:44:26 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=su8gFmxt4RDQB3FTP8SmR7J7tzs1L9YR47t/BimZtX4O7SjigPJ3MdPq/xUykk5ia0vOs7t35egjFtM2weiy8u5p5PBoBJsNR7nGdTKbhrL60g8CzEDjlemdDhIuBuhF3oMIKqFr/92b8tcPpBFrpPghneWzaKp0ye1xCnJo4ut2va94gxajDC+/uctoukXjXT5JuqiJD/TEUbhNn6h1PedTcKTKKu+G2ZxO5E5+YzIp6SCZLyi570a/Vb9UBxhuefjO1wslgh4XFT+rn0dMnFVK2ZxTGJzta92t5mBpaUmHGBq1f7ko8FfQRYmNSt00mNmuS+OUDnI0urg89TTd4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKlwztiJAHOkhnM0H0d5hoUkB4Yl+PC19kwGszsXxUk=;
 b=YeRd01pMI/t3utgoUsUg+9Z70pR3UGQY/TPXp+ZFbodqDmQePUga2TEGeAa5vFq/psrosG+NKC8N+vbhu/RCWIjDCAFFY657NUFrUSO8phfS3X90ToMw2OVX8nvBJ/RSYcPZ8hQ+5zUYwV6r96dx2Truf35ROT5ltl/7ANLX8s9+Bx30zc48CIaE/+xDRhLl1Dhrge2uoU7D5qesh1Uf3LYFyutwDi78dYIy6lJCbGj3sGsxAasQRqOPssLeZaxB/dmDUQZZVxWzul+BIfW2KCKS3IsV1vj6Dlh15lSrRi6mR+2EJ4UUwM855oIdN7JBrpeF+ZvImfFxPISifVd1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DSVPR11MB9891.namprd11.prod.outlook.com (2603:10b6:8:45a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 21:44:21 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 21:44:21 +0000
Message-ID: <f79a0d30-2a3d-49dc-9632-b8a81e4fa7d8@intel.com>
Date: Mon, 28 Sep 2026 14:44:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/9] x86/resctrl: Attach ACPI ERDT information to L3
 mon domain on CPU online
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <1299d05391a5095a151d6204a459d6ca0f431462.1789705667.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <1299d05391a5095a151d6204a459d6ca0f431462.1789705667.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0175.namprd04.prod.outlook.com
 (2603:10b6:303:85::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DSVPR11MB9891:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c951e3-4b30-4908-7d26-08df1da9a7c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|10067099003|11063799006|5023799004|260925022911599003|260925021311599003|6133799003|3023799007|56012099006|260925021911599003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: 46mdjC3NkG+ksD3Pdy06FUvb83+azzJvCeMCaPYIytb659VUElhvqHcCA4I1wkT9jZYFFREFid805rvXsj3TFN7ULrZPt6OkrVzcazU8+Gw83qEh4Uk46BEVpX7dPaL1wq/eo6h2P6kyQcegRDgcZ/a3yKSwfh/SaubdbxiTcwo04hU9FJ928L3CP3lYPixvre2C8xU3+Zq7RJv5hJw+inEg5MIoHswnq1RLW8VoHS7McbN2vd2KzrFeB3Jl3dxJvcYElLmAK3i6WgcBuwF/HbRFtpibVwlELnrkcG/gjiVjXPWDR0nFWC9asO7do5otr0y+v2PajOJQGKwlDJEZY2oHTLzM+00NvBGPYiKCNFTMaE40yVZ2JT7ECUJil4FQnvFDVE2qdfy/qg7VoaBwtnjTuKS3GUgYYC4JymXNC3Y7lRA1KN/13tutjwbm97l8D6FuCTdjGJwdsPQvuYDVcuVuV0fCeBHIMHDcbABmXs5JvkRqgg6BFgX/h2Yn0YPWWfW0sVyi4cCmU+sAXC1A0bz77aWgCBz9wBQihKLfjQLR9p7e9RXdv5cbODPeaaDARMgrhJkgCPvp71QIQQSSVu5UpcWPnc5HQfLp5DIEPg4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(10067099003)(11063799006)(5023799004)(260925022911599003)(260925021311599003)(6133799003)(3023799007)(56012099006)(260925021911599003)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHdDZjhveVAyMUpGV2dVQmh5V2FYZTFWVEl1Kzg3N1VSODF2dmhaYlkzNldQ?=
 =?utf-8?B?N0FralNwaE9hSnY3S2NwWnpmWmJpRWI2U0NIUUJhVTY0bGZBUWJlT004RGts?=
 =?utf-8?B?eGpyYlBVbnVxdE16eTdOdTZ0dVNHTTAzSm96aW45bkFnTnIwR3JyZ2ZDSDVv?=
 =?utf-8?B?OENtdE4wMHlzUG9xUVpPdVJEUE5FQkZSbXlaK0lxNERJTUR6RGR3TE1tcG16?=
 =?utf-8?B?cmlLU3lMU3hRd2NxcFNqL3JnK0hCQm9EM0lKWkl6ZW1aY1JCVVQ5bjQycHRD?=
 =?utf-8?B?anRwVzdHMWVBS0xXdmhNQ2JBSVpCVlBxS2I2M0c2T1dhdDdjUGp1R1h0QWI2?=
 =?utf-8?B?c2ZyNXBaOUxGcDlCakNFM1dNR0hyV1lUVDVYYko0d0svU2pUeW5SeU1ONGpo?=
 =?utf-8?B?UGNNbWdUMzVnay9OY3lNRk9zTmsxNzlYOVpXVEdPYURuYm9KNlpTSGNpOSsz?=
 =?utf-8?B?aWMvOVpkdGF6djJGSi9OMm92OSs2aURKVWxNQVAzakx1U09TSmcrTDc4Zzcz?=
 =?utf-8?B?ektoSmRYQUVzcEl3ZVNuS3MxSHFLM3pGZW4zQXB0ODl6VDhnYnI4dmFTNEw2?=
 =?utf-8?B?VnZzc21xbDBaYlEvdG1wVUZpZnUva1dCMUFvQUZmSXd4ZkppKzh5NlVhL3pw?=
 =?utf-8?B?ZUZEQThUMG1MM0UwdDd6OWNBRm41ek03M0xxWHhtMDJXK1NtTkw4S2NvdzVL?=
 =?utf-8?B?YUV1eU9nczNkd2NtU3ZOUVFvNHd2Uk5MN0YrQjB4RjVQU0hVMzVzRENKYWdI?=
 =?utf-8?B?clNORURFM0M3OU44YU5kR3hwbnVJZVNOQlBRSUZ2U3FYRVVUZTU4QnZMV0w3?=
 =?utf-8?B?TXRZSGxGdlhYRUJ4aEJiQTEycEEvSGJBNEorMWpMZ2lNZS9jRUI2UGFqcGw1?=
 =?utf-8?B?bFVPRUZuWFJPVGpUekp6cjhDSURJc2sxYUIyalpCTHJZYmJlNk4zU1d1ZlUw?=
 =?utf-8?B?N1RhV0NyRlp5RWhrbTBBVnJMU1FwNVg2c2ZhRHhLMjBrZkxSUFNYdW1NRDB6?=
 =?utf-8?B?UzNZZ1k4NFpnVjhWd3kvcHZ4WThrTEpOZXFwMmIxTVVYVDA3eXF0Zk1GYVN6?=
 =?utf-8?B?TThVUmtCZDZhaUl0UXJ0MVZmTDdvK0RhM3c4VGtwRUxid2c1bHVhVlJMNDFN?=
 =?utf-8?B?cEZwUFVjUWs3SXd6bXhvSUtwV0c5Ym1iQVdzNTNNQ3dTY29IVEFMdUlDazBI?=
 =?utf-8?B?aGxCSU81d0ZwWkRubHM1TG9RcmUzK3VtQTk3U0MxcFRRaFp3RHJYamRsZlNH?=
 =?utf-8?B?cmNucms0M2ZCcEpxelNDOSsyYUhWd3FyVW0rNE5zY2toYXlBUUdTMk9ML2lK?=
 =?utf-8?B?dkR1QUpRVzBWVmEzY2hONlhJSDZ1MVhOakYvVVp5RUx3UUwzZTJNaWNxYkdJ?=
 =?utf-8?B?SUYzY3hYMWQvM1N3VHhET05kb0NEc1pqMXJEcEtPN3hNZVQ3cVVROElWRHdE?=
 =?utf-8?B?RjE0NVc1bXNQN3hRSW4rbGlIVnRjKzNyR1haQmRVL081cHN3SFNIT0lYeVRS?=
 =?utf-8?B?cUVGWUFlRFRQWmhNMVRvS0FyN25FdjFpZnZ3dENtMGg5ZTk1c3A2NmZRNUZT?=
 =?utf-8?B?NVE0dWNGaGI0bzRDUTlybkN4c3VuVVE5ZEJUZm9IN1lxUXZZc3BGK1phRThJ?=
 =?utf-8?B?bXBvSkdvRDFpNUxaYU5JczJQbHNabDJCWjJlT2xxVy9uc0Yxdk1QRWRLU0R0?=
 =?utf-8?B?NWdzdjNjTHN0akR0bE9xKytXOW5rV25RTjlHaTNsT0d5akMraW9ZVEViTEhz?=
 =?utf-8?B?Y242ZE93YzBrZWJ1TXZaRFJ3aTExSzZWWi9XaE0yMnA2dXVrN05pMkdzUGF0?=
 =?utf-8?B?VDVFb1JJRktTQStVQkErNjhSQ0tsd2FBSUpoemkwNXFFQmM5c21tei9Jekk2?=
 =?utf-8?B?eUF2YnZWbklGMjk5UUlpSlBaVUh4RnZyZmtWZmVoTEFaMkpUWm5mbktqMlZR?=
 =?utf-8?B?cm9UYW54LzVVSkRQZit2RGZ1TGlzVDJ5V2xvSnBYaWV3REgzRnh4RzRxeDFS?=
 =?utf-8?B?RGVObUU2alMxdWVNUkNTZmd2NFh6UnkzdncvcHVuZUxoN2hHRVBLcHowSWNQ?=
 =?utf-8?B?bHRUZWJOdVQrTTRaTm43OVRpTDdpemw3S1dzcFlsU2Z2akVQbG1lQUZNTytv?=
 =?utf-8?B?dng5eWI0b2kwZHJnRnhlNTMwVzRBQS90M2pqeW82dnhJZDM3WHduWTB3a3gr?=
 =?utf-8?B?WFhzb3lDNG11a2VKN05FeTZJeEJVNExEWmxDOHpyTGVzbSttV3phNTg2NE1K?=
 =?utf-8?B?dmU3ZWtQTVNsQ0pRM1FGM0tUQ09YellGMElTdWxHZ2pwUUprZ0I3WVVWajNh?=
 =?utf-8?B?emU5THRXSFpORFdka3MrQXdDZEhCQzRjVzAzVkFWSGlPZUFjNXpiZTloVmVD?=
 =?utf-8?Q?kzqUejsgy93eTg6U=3D?=
X-Exchange-RoutingPolicyChecked: sqKgqX3ik7bj3j8sQyLzcrcJhW2ZwVZRewlzxVSZaFDq4unN0EZmSZ2Q6iU/Cr03UJfX3miag5CADmLHI21oM7S/NkzlVhfpb52dQz9uionwK8T+BDhNwZ9LVNWX5zsuf/MeTUmvCPvzBz7zQIG6nCiA5FNUEe4Jv6cTEsTRwEMeFJC0LmbC6GNC2ZoHfw0vO8qepZdVfdWUlq43eHlVMREZN0tjQ8H6hSJ6hlF3IqA0Qhf1sVHPl6d/e5FeFt8kRK1m81qKTnb94W2O31XdxdhgUwXNQy9hBm/MjxI9DkkYWWJH3BkLi8kxWszSP3kF9ej7LunMm18cwHbUStB5/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c951e3-4b30-4908-7d26-08df1da9a7c2
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 21:44:21.2802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbOXlGsSrdmP+yPvx91zUWnSHvCX4W7AhqfWnLbv5V23f46ry1gpxcbFT6qJsbebzUdti0Cg5O1806M9wlHx0CCHjnqT/uHp9ufBvfxVnXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9891
X-OriginatorOrg: intel.com

Hi Chenyu,

On 9/17/26 9:50 PM, Chen Yu wrote:
> Reading LLC occupancy counters via MMIO requires the per-domain ERDT
> information, parsed from the ACPI ERDT table, to be reachable from the resctrl
> L3 monitoring domain. Nothing links the two yet, so the monitoring code cannot
> locate the MMIO registers of a domain.

Last sentence sets this change up as a bugfix when it is actually a preparatory patch.

> 
> ERDT and CPUID enumerate CPU-to-L3-domain membership independently: CPUID leaf 4
> describes the L3 cache topology, while the firmware CACD sub-table lists the
> CPUs of each ERDT domain. Both views must agree on a CPU's L3 domain for that
> CPU to be monitored safely.
> 
> When a CPU comes online, validate that firmware and CPUID agree on its L3 domain
> before adding it to any resctrl domain. Exclude the CPU from all resctrl domains
> on a mismatch because a topology inconsistency between ERDT and CPUID indicates
> a firmware defect that makes the CPU's domain placement unreliable for any
> resource. Otherwise attach the matching ERDT domain information to the L3
> monitoring domain so that monitoring data can be read via ERDT and its
> sub-tables.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---
>  arch/x86/kernel/cpu/resctrl/core.c     |  16 ++++
>  arch/x86/kernel/cpu/resctrl/erdt.c     | 109 +++++++++++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/internal.h |   5 ++
>  3 files changed, 130 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 54cfdf12dfbb..3514d73a8056 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -34,6 +34,9 @@
>   * the domain list must either take cpus_read_lock(), or rely on an RCU
>   * read-side critical section, to avoid observing concurrent modification.
>   * All writers take this mutex:

Above sentence ends with ":" since the definition used to follow it, adding
text below it breaks this reference. 

> + *
> + * This mutex also protects the ERDT domain_info_list, which is modified when a
> + * CPU comes online.

Please read the comment that is above this added line ...

>   */
>  static DEFINE_MUTEX(domain_list_lock);
>  
> @@ -564,6 +567,8 @@ static void l3_mon_domain_setup(int cpu, int id, struct rdt_resource *r, struct
>  		return;
>  	}
>  	list_add_tail_rcu(&d->hdr.list, add_pos);
> +
> +	erdt_l3_mon_domain_setup(id, &d->hdr);

... the comment above domain_list_lock's definition explains how the domain list
is managed between resctrl fs and the architecture. Even though this change is made
with domain_list_lock held the above setup _after_ adding the domain to the RCU list
changes the resctrl monitoring domain _after_ it is made available to resctrl filesystem
via the RCU list.

This issue was also flagged by sashiko:
https://sashiko.dev/#/patchset/cover.1789705667.git.yu.c.chen%40intel.com?part=9


Apart from above I think this is the first hint that SNC and ERDT is not quite
integrated. Sashiko also found a couple of SNC vs ERDT sticky points.
For above, please consider that when SNC is enabled then resctrl sets the scope
of the L3 resource's monitoring domains to be RESCTRL_L3_NODE. That means that
@id parameter of l3_mon_domain_setup() could be the NUMA node ID, not L3 cache ID.

erdt_l3_mon_domain_setup() seems to assume an L3 cache ID and just searches for
a matching ERDT domain.

>  }
>  
>  static void domain_add_cpu_mon(int cpu, struct rdt_resource *r)
> @@ -742,6 +747,17 @@ static int resctrl_arch_online_cpu(unsigned int cpu)
>  	struct rdt_resource *r;
>  
>  	mutex_lock(&domain_list_lock);
> +	/*
> +	 * A CPU whose ERDT and CPUID L3 domain views disagree is not added to
> +	 * any domain. resctrl_arch_offline_cpu() still tries to remove it when
> +	 * it goes offline and warns that no domain contains it. That warning is
> +	 * expected.
> +	 */
> +	if (!erdt_cpu_valid(cpu)) {
> +		mutex_unlock(&domain_list_lock);
> +		return 0;
> +	}
> +
>  	for_each_capable_rdt_resource(r)
>  		domain_add_cpu(cpu, r);
>  	mutex_unlock(&domain_list_lock);
> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> index 0dfe5eda166c..249ba547d7c8 100644
> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -209,6 +209,115 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
>  	return false;
>  }
>  
> +bool erdt_cpu_valid(int cpu)

The function name "erdt_cpu_valid()" that returns a bool creates impression that it
just does a validity check without changing any state. This function does more than this.
How about something like "erdt_try_bind_cpu(int cpu)" and then the supporting text in changelog
can be "... validate and bind the CPU to its ERDT domain ...".

> +{
> +	struct erdt_domain_info *d, *cpu_dom = NULL;
> +	int dom_id;
> +
> +	/* Without ERDT there is no firmware topology to disagree with. */
> +	if (!erdt_enabled)
> +		return true;
> +
> +	dom_id = get_cpu_cacheinfo_id(cpu, RESCTRL_L3_CACHE);
> +	if (dom_id < 0) {
> +		pr_warn(FW_BUG "Can't find L3 id for CPU:%d\n", cpu);
> +		return false;
> +	}
> +
> +	/*
> +	 * Find the erdt_domain_info that contains this CPU, then bind that ERDT
> +	 * domain to this CPU's L3 id. A CPU whose L3 id does not match the binding
> +	 * of its ERDT domain cannot be covered by resctrl.
> +	 *
> +	 * For example, the CACD sub-tables report:
> +	 * domain0: CPU0, CPU2, domain1: CPU1, CPU3
> +	 * while CPUID/cacheinfo reports the L3 cache is shared by:
> +	 * id0: CPU0, CPU1, id1: CPU2, CPU3
> +	 * With the CPUs coming online in order, CPU0 binds domain0 to L3 id0 and
> +	 * CPU3 binds domain1 to L3 id1, so CPU1 and CPU2 are not covered by
> +	 * resctrl.
> +	 */

Please move this comment block to be the comment of the entire function. It does not
have to be kernel-doc but it could borrow some of the style, for example, "this CPU"
can be @cpu to make it clear it refers to the function parameter.

The "With the CPUs coming online in order" also seems to describe whole function
and not just the snippet below it. With the function comment describing the example
entirely the smaller snippets within functions can refer to it more coherently.

> +	list_for_each_entry(d, &domain_info_list, entry) {
> +		if (cpumask_test_cpu(cpu, &d->cpu_mask)) {
> +			cpu_dom = d;
> +			break;
> +		}
> +	}
> +
> +	if (!cpu_dom) {
> +		pr_warn(FW_BUG "Cannot find the ERDT domain which has CPU%d\n", cpu);
> +		return false;
> +	}
> +
> +	/* This ERDT domain is already bound to this CPU's L3 domain. */
> +	if (cpu_dom->dom_id == dom_id)
> +		return true;
> +
> +	/*
> +	 * This ERDT domain is already bound to a different L3 domain. Rebinding it
> +	 * would leave two L3 domains reading the counters of one ERDT domain, so
> +	 * skip this CPU instead:
> +	 * When CPU2 is brought online, domain0 is found. But then it found that
> +	 * domain0's ID is 0, which is not -1(new domain), so CPU2 is ineligible.
> +	 */
> +	if (cpu_dom->dom_id != -1) {
> +		pr_warn(FW_BUG "CPU%d's id=%d not equal to CACD domain(%*pbl) id=%d, skip this CPU\n",
> +			cpu, dom_id, cpumask_pr_args(&cpu_dom->cpu_mask), cpu_dom->dom_id);
> +
> +		return false;
> +	}
> +
> +	/*
> +	 * A possible new binding. Check if another ERDT domain shares the same
> +	 * L3 id. If yes, this is a conflict and this CPU should not be considered
> +	 * by resctrl:
> +	 * When CPU1 is brought online, a new domain1 is found. But then it found that

Above is mixing tense

> +	 * domain0's ID is 0, which is the same as CPU1's dom_id, so CPU1 is ineligible.
> +	 */
> +	list_for_each_entry(d, &domain_info_list, entry) {
> +		if (d == cpu_dom)
> +			continue;
> +
> +		if (d->dom_id == dom_id) {
> +			pr_warn(FW_BUG "CPU%d's id=%d is already used by CACD domain(%*pbl), skip this CPU\n",
> +				cpu, dom_id, cpumask_pr_args(&d->cpu_mask));
> +
> +			return false;
> +		}
> +	}
> +
> +	/* Eligible new binding, assign the L3 id. */
> +	cpu_dom->dom_id = dom_id;
> +
> +	return true;
> +}
> +
> +/*
> + * Associate ERDT table information with this domain.
> + */
> +void erdt_l3_mon_domain_setup(int id, struct rdt_domain_hdr *hdr)

@id is unnecessary, function can just use hdr->id (but keep above comment about
@id not always being an L3 cache ID in mind).

> +{
> +	struct rdt_hw_l3_mon_domain *hw_dom;
> +	struct erdt_domain_info *d;
> +
> +	if (!erdt_enabled)
> +		return;
> +
> +	hw_dom = resctrl_to_arch_mon_dom(container_of(hdr, struct rdt_l3_mon_domain, hdr));
> +
> +	list_for_each_entry(d, &domain_info_list, entry) {
> +		if (d->dom_id == id) {
> +			/* Assign the ERDT information to hw_dom */

This comment is just duplicate of function comment and does not add any information
to the code it aims to describe.

> +			if (hw_dom->d_info) {

Is this necessary? hw_dom has just been kzalloc'ed so it cannot have any value here 

> +				pr_warn(FW_BUG "Duplicated ERDT domains are mapped to an existing L3 domain\n");
> +				return;
> +			}
> +			hw_dom->d_info = d;
> +			return;
> +		}
> +	}
> +}
> +
>  void erdt_exit(void)
>  {
>  	struct erdt_domain_info *d, *tmp;
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 156206088372..2e8fb36ad804 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -97,14 +97,19 @@ struct rdt_hw_ctrl_domain {
>   * @arch_mbm_states:	Per-event pointer to the MBM event's saved state.
>   *			An MBM event's state is an array of struct arch_mbm_state
>   *			indexed by RMID on x86.
> + * @d_info:		ERDT table information of this domain
>   *
>   * Members of this structure are accessed via helpers that provide abstraction.
>   */
>  struct rdt_hw_l3_mon_domain {
>  	struct rdt_l3_mon_domain	d_resctrl;
>  	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_L3_MBM_EVENTS];
> +	const struct erdt_domain_info	*d_info;
>  };
>  
> +bool erdt_cpu_valid(int cpu);
> +void erdt_l3_mon_domain_setup(int id, struct rdt_domain_hdr *hdr);
> +

Why did these two erdt related prototypes land here instead of with the
other erdt related prototypes?

>  static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
>  {
>  	return container_of(r, struct rdt_hw_ctrl_domain, d_resctrl);

Reinette
