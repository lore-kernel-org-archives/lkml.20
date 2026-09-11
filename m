Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63EB33F5A9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153424; cv=fail; b=le+Ni0fzv3D723pagv0/jcJK3Wfg5m/283Se7SIGelA4gbhpR87vA7sDJs65SQQk/5r7xeJEesODT4bu/1PWbMZ0etWeAGMNGCuBphg/bittThXZ0R8GS7cq7xwJQQhjGkKBLuyLvHI/JQ3Z/LDbKUug7MZ7hlNZRrYHabv0OnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153424; c=relaxed/simple;
	bh=dlRsLw9CCdhxXrv87ZesiJb8Ek7vWx3KCCUz4e3EKT4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=be/LFW4xaHcxmd80GWsOIxoSDJNL92L9ftegCOQyDYY4YS59FQ4bk6uwmoa0wGIpgriA1JMzg4IOm8/M+8a6JSUHTrnD1OgLxyivfdwcj/9HJ6sXDyPGhYmuIKzN+AayA97ujkFS2gBpHd34o0PdUYUIa1g4YoaeaodBapTpM9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiakvWnQ; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiakvWnQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789153423; x=1820689423;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dlRsLw9CCdhxXrv87ZesiJb8Ek7vWx3KCCUz4e3EKT4=;
  b=JiakvWnQe0CsWTjde7v3H7qTAMozEncawPpYyOEDGvEWzZqN2VBOusA5
   qbXv6gYLfWrZbqWIWZ54P/au3/EQ8jcZ8L4DJqebEc8xwlCh8n69vwCUi
   4LTx6qVxKY671L+GUBXszTEhO4I5d9GFBE9ArK5oNPGVjtjxTFpKCZDtW
   KOB+AvCUblRnfHNSOu0f0pmV3WGP5xeg/y4b9dDszerBUpr3DbCeClGF4
   t+Vn5IM+0t9NNSpT/5MDXzGI0cQ4fgMc1t7pQnuU7uifNf4y54J8p/O2K
   /W9yx17XdbEfx0kHT2zBr5vSxx7bO83IM3sPBRAKjszIGeex5WUZCri2i
   Q==;
X-CSE-ConnectionGUID: i2/aS8S4Qym6QVB2FTsBBg==
X-CSE-MsgGUID: ZwLqQEwVSTe6OnsawSL/xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="101141983"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="101141983"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 12:03:40 -0700
X-CSE-ConnectionGUID: HysEmd5ZQfWI/2toDBLcdA==
X-CSE-MsgGUID: 7Jnr8H3nQhmabkVSgNGE6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="265801612"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 12:03:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 12:03:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 12:03:38 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 12:03:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UbZLSRqWOumpu2VW6zIiztpSalZTZdVuxsv/gATfDIZ7yhZATZMoxWPz9l6c5EonaL/yhbWMM0JxYIZHJhcd2fIqyuzkK4ihz6h8PSLu0/h6ypXliDSgC8eMeX4ncshiXvpl/zP/whSWIc4owiH9UDccsw7sBKVvkWorZynepOUw1QGkHuUGbEJO5Rvz6Amx3iVz8tC4Jj107dTzOFBDJZl43f2jic+4WMFTBEfb+kPNf0E6YdUz7XNUeMzkTJxl9JVZ3JZVlyI1t6NNWVMGxJn/WMonmZ+B5BHxP6PLBCDBlBJfSJrizRnNOG/hs3X/0XwtcX07UfiEQDECrVTqYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFFQdhsiivvA+tIJeovUh6IHJ8Ci3RP++6FhAAzrSsY=;
 b=Nl4s2uEC+pLCy5IroB/eNzQbrAfoIGBIK0sNHWYbw7chVXFRZhMzHXEdN1AsET11ICoy7d1opaPRAdQ/eRM6BCoRzosxmBBmx51lULXycEWhhK7hagRdJ+3o+eKECSBl0ShjIL1qnSFfpjGP0wOHiezknS2HSX6qt3BoovTnwnhzF/+jkwqk9GfK7IT9N6Te5hkA+f/L5M72qOJ+K/KzqiyBVbe3gTrtHGU9zjsMsA6k8mwXF9NcjgXWinrQh6EFTvF0h84p9mOLyzgGEwpA4EOm9Cl5VQM7tTJRdbRSDLrHYeegfLf2Dc/V9+nY3qppAIJ3DvPFI4szsCSbedNW4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 19:03:23 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 19:03:22 +0000
Message-ID: <5fb77c2c-40b8-4dfe-95d3-e0c73b8559bc@intel.com>
Date: Fri, 11 Sep 2026 22:03:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Sam Agazaryan <samagazaryan@google.com>, Frank Li <Frank.li@oss.nxp.com>
CC: <linux-i3c@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>,
	Vitor Soares <vitor.soares@toradex.com>, Oleksandr Shulzhenko
	<oleksandr.shulzhenko.viktorovych@intel.com>, <linux-kernel@vger.kernel.org>
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com>
 <aqHU-6RV_AapSu3M@lizhi-Precision-Tower-5810>
 <DLC6ERLST1B6.6K3HLH38DQLK@google.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <DLC6ERLST1B6.6K3HLH38DQLK@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZP191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::17) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|CO1PR11MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: fc34999b-6d54-4ddc-61d8-08df103759a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: uLmrDStmWnKlcSi4R9mxL0wfDmEu8NodGwQMrDiP8tVRDS4qIOhBdmrGlOPNQYaqLT3ISR3N0/enfF2dvPj2kO709xsCJNJmHnxcrBN2JludLyO9W/dNsSe9lQL6UHgvVoakGdfxyvhEdp6AADKFH/s6WrqKGfc2cc4Jj2a+B3v35IaUN9I85ixkqgJEJ5moOD35ScgPuIoIyKLUHiUermmp5DAmlsWqYUSfmTsLtUfvm4vdQZhkkobRrfRxAVx+02FJj085qMl84plXd3ZLUJjtI0HBxAhzS/4pAPhP+D9U/Pk7l2rO/oo5AkfYhogkJwltS2CGiMijNdLe03KOqzbvuyjTwvFC1iixsTZcTKHJgoKpSVFHvw399m8auJeK+8TQ7uyhsvthZupgqu+vzF5rrSH/UUKIDc+j8Mlmadr5AsDOtNqrEQSdpTZ81lQw0dSEohgYjPp/u/s7y1c7d2hO5qWryUJdR03PJpS5BLKlCzSyBvYi6jtGKbIZ572ve53PdSv9yMpu3UMliidBoAzYn2Dq4TXW6yFsO7YQo7Ft0sj5fuO+dbLvOzhrBrWO4BiMPeqHWAeCCMo0nAwSuj5Yvcq4dgWKUbxsiLdTJwakMsn6gfdExuWaynJY010oKMqvMgUqwHafujZLFNZdMg60eLmqdYak0549+hIV+14=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGlJTmYzRGxZMnYxVjcrc29iUzEzd2VxVUx3SFM5c0NxUXRSZGFxMXB2Mndr?=
 =?utf-8?B?K20wOU11WEVFV0tlMU1PTkZka2FmdHZMckV1NkRsOGpSaXg3Z0c4RG83QkxQ?=
 =?utf-8?B?UWF2Q1RVd240UVp6RXdtQzdQSkZkRWdjNUJ1Q0V6RXJ2VXphdHZnWi9ZTC9y?=
 =?utf-8?B?aThkSzdmSTBiMFd6RTJFSC9KeTVVL3EzNitwMDFJY0dVbm9ZY2ttNEZVSXdO?=
 =?utf-8?B?RGFwdEhDU2hBTzlyV3NRUkt3N0ZHOGt2S1ZUdGcrWjBYWTlQUjlodm5LU1N5?=
 =?utf-8?B?SUdwRFJxME9TaDNhb0FjUFdsOFFidXRRMVVPUStHQlh1QktRTTc4aHh6U1Jz?=
 =?utf-8?B?Ty9GamRHUno4KzFQNUlHWHdiOElLQkxvb0IwNnVzVmpoM0hhajhrOFJweXpE?=
 =?utf-8?B?RjBLbXFnbWh4bU9vQmphczB2SUpYdjhFejJRa052WU1nNWZOakw4NFdwMEx2?=
 =?utf-8?B?S3M1Yytzd2ZQbnhQYmpHWGNTMkJURk9iZ2dhVzRraktJTm14dElPaTg1SUZX?=
 =?utf-8?B?RXFhcW5mSmZTc3EvaEpkS2Y3cjNuRmJUSnVJdFlKS1MzT2VDTnNCRGVoK3Vn?=
 =?utf-8?B?MEFzaEh5blk1M0I0aGNRVVErR1VsVmdBK0lrMG5BOHpqNk9QT1J3QzJ0YTMr?=
 =?utf-8?B?SFNzMDFNZ3dKZVRUc3hLbXgyY2J3NzVmKzFOdm9lMlZoWFhhOUlnZDB3STV2?=
 =?utf-8?B?ZUlONC9kZjhVeFB2N0h1L2lYUXdXV1VuRFp1Vm9OODlLS3lnNFdldTVCMEFR?=
 =?utf-8?B?N3ZnejQ1Snl5RkV2QVdmSUFyRThWbEtBeWw1L0ZQbm1IVGkrNEY2S1dpYlpZ?=
 =?utf-8?B?UGo5K0c0SDNuSElnVENwVEtGUU5UdzFRa0tsKzk1QVhnVWhGRFJiclJhdDF5?=
 =?utf-8?B?dytpQUpWTmR4eENXNlZSbVU0aHhZUWpxZkYreVhOSzhzMlY5VkNoL1hZV3Vw?=
 =?utf-8?B?SXFTOS9xVkdjdFNKV3NMRHJCZ2RqZWdKWTJMa2NFSURHRndLSC9vZHQ2bmw3?=
 =?utf-8?B?NVZVUU5IL2NNb2Vlb3dqQXZ5TWlweS95dDNLYTdEek9xLzlLVUEvQzB5aVdP?=
 =?utf-8?B?WEhPaFcrbW9vaFVBTlNDTktsdVRkOUhwTmxRdFY2eHhqeFZndGI3akRLUmdW?=
 =?utf-8?B?Rm9xZFV1V3NxRi9lV2svRVJCcVF0V09ZT05CV1JmcmVXK0FzTUh0a1cyRkE1?=
 =?utf-8?B?UWlNazNVTUtsczlUdVBScWxDTkxTNzVLd0MxUDd3d05GdTBmVDZRWWdlaHFo?=
 =?utf-8?B?amtSOXNyU1NWT2J6cFExaUF5OExGU1djZjhsUjR1M1EwcW1XaFZLYURpSCsr?=
 =?utf-8?B?aWNKdys2YnFhUWo0RzRIUWkydDR3dVlRaUlRSWdaQUtCRnRtVFlOcTAyWU12?=
 =?utf-8?B?ZU5KUnlra3ExOUpKL1I3cEk1ZmZlUU1ndndxK1kvSFlLQU1keFQzb0JGRTZQ?=
 =?utf-8?B?RXRDaWN4MDlpWVVNZjRZdVFiMksvbGFCcnFLdXZhME1UR3Q3US9udlhGUGJs?=
 =?utf-8?B?QzZBSmFRakxTZjlIelhJUFVRL3pqS3VtUnhYTXM2NGNlaDFLNStNZG1SUkFp?=
 =?utf-8?B?UjE5NVRGNEovRFdHTHN2NWhGYWNjM3lTdy9sTU1IQ2E2aWx1cFp0cFNDTDFC?=
 =?utf-8?B?SzlWNmdBN2srRW1HMXNReEF0RFVRZnd4R2Y1enlEeDBra04vNWxWVTdyVm9J?=
 =?utf-8?B?UFByU1JtWjAzbFQ5RkZtOU1GOUxuNjd4WEdoKzVObHg1N09RL214SFlPVEI5?=
 =?utf-8?B?SFFycDBwTEMyNjJIWGYwWGx5SVZxWVJVOHUrWmNYS0hhN2dlbklkcWt1K3pw?=
 =?utf-8?B?ZGcwSnJ5eStMd3Z6QzVZSGQzdFAwa3dZTjN6UzI1Tnd0ZE1PT2ozcXBIc3dz?=
 =?utf-8?B?TFFZUHdySjVTMTg2c2NpTkUvS2RxdWJFejZuVFZLdGdFSDVsRHZGdkdZSklq?=
 =?utf-8?B?TExMdHA0L2JmdFpwbk1nSEdKU3hNREt0V3lpZzlpdmV6VmtLdVRYV2ZhOXF3?=
 =?utf-8?B?SUU1THFCaXV3SWxUaURwcmh1UjQwUDFleXQ2ZVJTVE9wTkZwbVk4SnN2YTZv?=
 =?utf-8?B?MENFc3NsdnRrY25WTzBhbTdvTWVkYmZpSGxSa3M3a21NNVl5blNNUVluYlNE?=
 =?utf-8?B?eDYvUjA1OFUyeWFwTjJOSWZZV1ZUSWNEeWIva2U2YjRBbS9PWU1OUmd1cmtx?=
 =?utf-8?B?TjJwbHV6bnNWdVRPUnE0K1Z6bWlkYkptNjBYK000U01uUFkwSUZyL2NENGpj?=
 =?utf-8?B?WDI5VGJpUEZ2SGpJRXplYUh1ZVdSN0tyUUJJaEFhcGI2SjdOL1BySUk4WEFB?=
 =?utf-8?B?bytRVWNuRnBXRDhTWW91RFMxN3Q5ZEJ0ZFZVUmdnMUFKUTF2REhpemhhbm9q?=
 =?utf-8?Q?j8BfC8oQ8inqxoFY=3D?=
X-Exchange-RoutingPolicyChecked: Bq2vMzvFprkJYxCX3cj2sE7tjUU/Tu9qwgcTfNRkw+mjkqDG9nDSQK0HnGgGsWOAk0jft2ryDHgqwJrcjVfMt8Z/caHDHjj08qn2Q4Xkx/6Sl+g/yt24h7llEzcIZa3dDXOvIgb2YccrM1mPux2luNZJFuoiVLjjtA44rdloaalHRcIxQ5Gv8UqQs2mW5zxhvYGSEiw8fXW+rO/OAs/DLO7ogUnqAl71wQerikjHAsiXWmo/lL0dIACCGY/650paofolC0dJHEHnnENifTUtoarrmCCTWU309dffkOeOZtGBZogagG2Y+rS3n0ZKgyaKXaZVcXG1PTLHD908qnII5g==
X-MS-Exchange-CrossTenant-Network-Message-Id: fc34999b-6d54-4ddc-61d8-08df103759a1
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 19:03:22.5783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9qWd8yyBGgn/HTZOwysBlLnOd7U2d456jiZ/4UvcG8V0klyJUS67SztNFkCYpRAxNPJIBPXOSSCoVvYIMmNLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5154
X-OriginatorOrg: intel.com

On 11/09/2026 06:44, Sam Agazaryan wrote:
> On Wed Sep 9, 2026 at 9:51 PM UTC, Frank Li wrote:
>> On Sun, Sep 06, 2026 at 08:27:47PM +0000, Sam Agazaryan wrote:
>>> From: Vitor Soares <vitor.soares@toradex.com>
>>> +	for (i = 0; i < nxfers; i++) {
>>> +		if (xfers[i].rnw) {
>>> +			if (copy_to_user(u64_to_user_ptr(xfers[i].data),
>>> +					 data_ptrs[i], xfers[i].len))
>>
>> Use actual_len,
>
> Updated in v5.

actual_len is a problem.  Only 2 controller drivers support it.
No I3C device drivers support it.  mctp-i3c reads len not actual_len.
regmap-i3c ignores len and actual_len.  And its definition comment
is not exactly correct since it is only valid for reads.

Despite that, the additional issue here, is what to do about a short
read.  Seems like it should be in the uapi, but actual_len needs to
be fixed first.

