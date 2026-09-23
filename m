Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E7945A28E;
	Wed, 23 Sep 2026 08:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151604; cv=fail; b=reju7etWxVy/99SXq7xaq1aSYph8ajGCrEJF6Mrjo2fuXjR5zlDyq4tfq7Kji7SlO0xw3/Q7OpNw9Wl7YhrEjZLZih1CHqS/AFPoBEsdIQlOXSiWXzDZDeNbMM8Xbc131U18eaPt5sY1A/0w1dJ1Qc5VkAI8iZpKrn+6CMmc2a8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151604; c=relaxed/simple;
	bh=CdRtptdDye1PCUo3JyZnxECICFGmHyo5M0vDOpuqQ5c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uPZYIJ4KmPaz8sA3/A8Iy0ZVcQqQofQSxkhAtQqg+yryDr1OsnKKabJF0D0r9npBQkR5XifsXffYE+vqhWMRVUeDxI4JlxUSWVdcy5gTsLkCOZogzNK51/0LE8nFpJ3+pSmCsNYLuq/TZMtUCIZ/BOkaqeOJ0YizodJk/iRCcRY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mrXzw73E; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mrXzw73E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790151604; x=1821687604;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CdRtptdDye1PCUo3JyZnxECICFGmHyo5M0vDOpuqQ5c=;
  b=mrXzw73EZtnKbOizGKBzj8X3ARCoVT10GUJu1LGNraaZ6aayqQa1FEV6
   tpX2/ErVjLHYGYRwQU4nibR3KwmgP054eqN8G6qN4Bxp7J5KUcROrstuR
   W8oU1SxztgzFulD9BpdBV1IcBmsaOQkCjdBUze4HbLPTT0j4txnbp3h1f
   6saMYUppPXrN4R/bIlUk/GA054d/9PkMASz8Zh4cjeLTF0vk0phpwRf5P
   qLA6xgDsgCBeQ7R0ljBQF8IKVMpbzoQWGBlmn2Z+ut7s/uZjiAM+OJOct
   ZNv3bmLrndjFuBW18a5P4gz8hTlXcekcS4EdX7POZIybZ/s6ardvbfwo8
   g==;
X-CSE-ConnectionGUID: 3LGt2lUzTxe3UicWZ6uKGw==
X-CSE-MsgGUID: lIIZYMBLSyyMAyyOG+husQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="78375803"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="78375803"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:20:02 -0700
X-CSE-ConnectionGUID: 3C1JFkjVR+GixbHcOuxf3A==
X-CSE-MsgGUID: BzMiKKl0Qw+9VtZfpHYVbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4563805"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 01:20:03 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:20:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 01:20:01 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.32)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 01:20:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oAvdTpsADg6CybaT5euCdpisQV4b5bz4vNPL9WkxaaYl1r5KOiWqjSXAKysiebHwtYYYmn3x0yN2FJp5YMogl1m4XckzO+vlOiPnb658pcScFE5pl0jrwgUsvvT+DmdYJP1px3qsnEG9qlPLhmqBHsu2Ai1nP9LWIpfWbyZAtfj1lIRjJIaSZzGvMj5o8bt/EXvpG0LggV/zuBQyQxX8+7KbauqWZVQlchddabecY52R779xXJlYD+CHa6rYTSnCYNPqyhM0nlh2GrilUdfF5gqufE06Rjo0770oq8/Ncadf+wfdxBTccZMf1XRZHYDsMRmFFuDEdPiehECLGCkkcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIn8H2DlZCGEpsdZi1z7r2wJnVShYVo/NMjjwh494qI=;
 b=KVA3JCgFUEXN9jCcNXpZroCsac6yWyW1ROk96vhfpFu/cx66Wb/WITmFRip+Rbrn2pVS2qyTtAQMnpi1Cl/NZzABa4VyXaKcT4Pt47SAT0al/wZQdIsiw3FjvMDgjK46ZxO0nxTp5dG+1kGTEXH/k5mQX9Ot5YAKeewJasSu0Lj1NxO6T1303jMpLJhtEUrX9rq+PqqpOZorn7IIoqfD/Fb4MhVDblXAjnChnUGnNxp3Gm/0gvsGiAmP+kk5HYGgllRK7lKTftUFVmue3FbsKwoQcMNw3oxlRQ8tivAkYXpmOQQAT4SWCX2+/OB/3eMOzWB5UlvAVzTHl+UFs2zXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DS4PPF900531A26.namprd11.prod.outlook.com (2603:10b6:f:fc02::3b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:19:54 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:19:54 +0000
Message-ID: <061ae74c-6e3b-49e5-8725-09d104463d16@intel.com>
Date: Wed, 23 Sep 2026 10:19:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/21] ASoC: codecs: rt5514: Move clk acquisition to
 the i2c probe
To: Chancel Liu <chancel.liu@oss.nxp.com>
CC: Support Opensource <support.opensource@diasemi.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, "Oder
 Chiou" <oder_chiou@realtek.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
 <20260923061305.4041197-12-chancel.liu@oss.nxp.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260923061305.4041197-12-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1PEPF00005B9C.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::634) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DS4PPF900531A26:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a53dd60-9860-438a-9461-08df194b726a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|7416014|10067099003|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: LQbcqcvuHaB9y002BlvXTdd9KUaKZDWuyQSwUDI7eyfgUuKutMwbzRL3aOLiIcloFB+loPeCyDpzKCVlc2dgOr/FbeUDwwqiyNZ7rtTH0U7SygsvuM0GH0Oxt89TT1J1uAhrkO/EAez0TqKgZ4J1WF0jyfyegjmN0X69NfaRN+sxVBJQhfQRitv4HkKa9KNhuxw3tmQsw9JkhE8OMpHaYunCESPOa9iD300vkyicPwzBBN6faOz8/5tuaBME6tzfPKAYlZ8rJEbWDIBQG9t8bcf8SyuHx0bctw9wW42iL825c0osoFnyUhW/BsK2S2zrr2zEoSkc0vAAmpsvpfrt7rgVJRJb91led90PzP23FuHgybhpLjkTtOucAVImc+hsWaFjOr9FE+wILMVydQyV8yeMNYkev8fFxG0l65BjNVMQZH6HwKtaT26FXVCqn+RMC9YhP3KmEQAeKnEb4MWbtNPfHDatyDBnui1etQ5cXey3q3FOcFOT/a1TWGcIldGEHFykj9g2XZJpXEur9z+JLw+2pDpcpP25rvyUE1wOnQvXnYQ8qHRFXNLriZtvaJMSvdHHsUs3CxGLEeeSZGR/bJ/tuEql9b5ivjWoyABQV3w7o5MEIFI2bbEGXVQv1DR/IumhSNbQLgBwwlWsavhZjGLp3/svcA1ePdc3v/I1N4s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(7416014)(10067099003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dERBQjZhb1R0OHBLZm1VWEdrK3Q0bnorblJxbnp3WDUyYnVia0xTYnVqa2Rq?=
 =?utf-8?B?VDlsL2dOeUVYdFEycXhhbzNDRldtU1RxWTdsYm1oUWFTbUxoYWtkOTBEcTR3?=
 =?utf-8?B?RFNOTWt2UXJHQWJZZ1VWTTJuYVZrb2VBamsrWVBOTFRjeHdsTFlyWUFqYzBv?=
 =?utf-8?B?dzhSa0FEVGp3ekQ5OTZ5dzZPMVNHWWVYWVRyMmRoVHlqSWtOaS9NSDNBRnp1?=
 =?utf-8?B?NU9wTXJhU0JISDRHMnhuYzcyQzVkaG5MdkFjN3hqYWMrdHdIcjhTc3ZYY0JQ?=
 =?utf-8?B?ZW5jT3l3ZzRkc3BiTlVBVEdCdkl6UzU3L3dENnBGNCtqbDJzK0g0bXN0M0tG?=
 =?utf-8?B?YU9CV0poRVVjZG9iLzAzNW5yWUVMNjY3TTN1WjM3cWxvZDg2RkVOTlNFN3dK?=
 =?utf-8?B?L2tudjJEcS93Y1RVOTk5T0dmTE80akROVTJiYkZ3MjZPUkRtYW56azF4SlU3?=
 =?utf-8?B?bGZTQW9jOGFqL0ZYZXpvUG5NekNyRzNWWk1rNndWbXF6YjRaZWNtcEFkK3gw?=
 =?utf-8?B?U2xOZ1J1bDJsUVl0ZXBhdTZvRm0xMUxsSFIzbzBTNTI2UEtRQTlNVmdIRzQr?=
 =?utf-8?B?ZGJEcjhoUmlzellnTzNzbDNkOUV6UCtOOGJkYjVveCtWT3FaeVdKekVDWEw2?=
 =?utf-8?B?bHU1cWZRbXlhR3RBZm01by83dlF0VVpYSFQwRmVNMUdUM0lFY2RwaTk1MXE5?=
 =?utf-8?B?WXdjc21mL3ZvUUVOaFV5YXl5NEcySUtiSWJaZnRUaWYxOWhuWmJDMSt6d213?=
 =?utf-8?B?cEI2Z2dFKyszckdJQk96YVV0VXROUnk4VUhWUjhybUJMWXdpMFplZmFSaTRp?=
 =?utf-8?B?U05QUEtHT21Pa1gxeTJpL25qdXRnc1FnVTFkeFk3dWgvSTJVcW92bkNVWW83?=
 =?utf-8?B?dDdVV28vZExKcG9QeElBd2lMUDk2MWlkVmYrRCs4VmZJcStRNzJIc2RSNHRk?=
 =?utf-8?B?ZWtSVzRiYUlnbnNtLzRwMzhMZGk1VjZyM2FLclpocFJtN2hFZ214dWpXRzF1?=
 =?utf-8?B?V1Jhdm9PQ3c1a3ZXRTJVQTZPUU1YbENxZFRxRjdPVDV1T2hHY05IbklURUZI?=
 =?utf-8?B?eVp6Vko2S2ZNQkIxb1YxdDVTZzlaTThpdHdLNUZOdEhhTTVYSU9tbGxqVjhw?=
 =?utf-8?B?V1NicUFpVFJBMUtVblR5ZjBVY3htUVRqaVIveHRTU0pPVkpTczJzRzlrUFF1?=
 =?utf-8?B?YXpZM3cxS0UwWjh4MHNtVzNTbmNOZGI4eDJHRkxqM3hZOHIxbzF1aFp1cnpE?=
 =?utf-8?B?ZmhqN0dOUmc5eTU5dmRwM2djKzcxWHQ4cDFvVkRHWW5jRGFXaGptSnpUbktw?=
 =?utf-8?B?MWZaeXJ2U09MZndTQy9YSEJRQ2l2aW80bGJJaFhuQW1hcUd3aDhGVzlzaTcx?=
 =?utf-8?B?Ykx0NktuZ0J2aEFQWHAzZkpKcFE0aENsbkNMVCtTWDN1NEllblZFclN2YUJN?=
 =?utf-8?B?LzFiVTB2VUMxZnRqWXZQZW9kbTNFSzZ5SFpDR0VxNnFwcVNqQjhWV3dMTGVm?=
 =?utf-8?B?eEh3Unpva1hiK2c1bUluVUFVZXM0WXdmN1Roc1JlNy9kSXdrRnBzWmN0N3JJ?=
 =?utf-8?B?UDZIZmgrMTFoK3hNNUFQT295d203dGR6UURzelFJbk93STZYd0hsa2JraVpI?=
 =?utf-8?B?RmhucmQyVW9udFBYWWdYZHR3am9hdlYwaGEzdHNwUkpicjNWTzRqRktwZkd1?=
 =?utf-8?B?cEpZajFnNnc2V3JRN3NETEU3MkRSUzNOUU1WMEFqZTRMQ1BJMjhNTS9BZGha?=
 =?utf-8?B?dUtBV0hXaHE1SGNFY3lVWXdWeDRKcTM3a3JQQ0NzNEZOWmJQL3NZVXRGMitz?=
 =?utf-8?B?czhxSk1hdCtmdzdUQ2NWVzFsWUxNMWRrTlBSSS9JOFZKOFdoYjlCY1RyWDNp?=
 =?utf-8?B?cDZpWHhUVnYraERlRldlR3hWcnJJYlFBUDdZNGY2MFByNWZWVzhTYWpLWkV2?=
 =?utf-8?B?TDFhVnZjNXdQdzkyZzFKbFVRVncxY0tTUUpHWTVGTWptZm1QV3F4a3JhM3RY?=
 =?utf-8?B?RW5BcmdXd1BuY1M4bk9JRlVRWkxQeElrY3RIdHFRVjhOTVdPYUoxaCtobjNv?=
 =?utf-8?B?SEZtV1JDeGxIQ0pGK05jRUNvVVRheC9XdjFlVGY2VDh3N0dQb2F4V01ZbUtr?=
 =?utf-8?B?OHhSRm5iZVZrREpTaEdyc2NtL1g1cENIamRjNGZlemtjcEIvYUMwcnpVeE8w?=
 =?utf-8?B?aXNPMThhZ0RLQzJKQ3puTG1UVHRUWUdXZzl2dStwdnB2QkUrK2pGVXhVWDAw?=
 =?utf-8?B?bkd2MUZXRDBxZzJyNHZ3YmlVSDBIeHJNUFVDcWdVNmh2U0tFZWV6aEhPSUox?=
 =?utf-8?B?N1Q3dzVkby9PSEVBVjJpOC9JclZNd1BkcmVKWW83a0xVYklObzlmZz09?=
X-Exchange-RoutingPolicyChecked: VFRRZ18DSTow4piqWOfxQdNxc5M43/y3UUnGk+sU8ScyHAkrEVltql2SKTWtCs8BBksfLRQf8yx0OjebXWwE2hB2igf05p6pxqjCUAJB2L067cnNrZ84TwzM9au6Qob9n7Cml/jbTY18iF8eUQL7zMBhJP9ThTLGlkc9Sl6t7O/h1qG0GBQDEihPLUqaOU/G5PHtUd5yLwGorHrMtZO6K1JJhHp9rg76AZxvwQEnr7n8SE+aNwv36TXDT1XtQ/0et5GSISs8aGrZ+71Cb0baoJkZdSElna3sTtKYwbwuLfi7lwxBa5vd+OYTRcXdjjZsde15L5lbkW+AOyOeaj4wdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a53dd60-9860-438a-9461-08df194b726a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:19:54.4984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dvArTDZt+v8cSTeuA21d1yuiFMCMvE5ERggPa9r2CNendK4zc7KsHF8yNzB0z8C2aN2/9+68tCG/8Y2YK9GLpb6x+9mtKMkxKKu2PS5thE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF900531A26
X-OriginatorOrg: intel.com

On 9/23/2026 8:12 AM, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> component->dev is the underlying i2c device whose devres is only
> released on physical device removal, not on ASoC card unbind. Getting
> the codec clocks with devm_clk_get*(component->dev, ...) in the
> component probe therefore leaks clk references on every card
> bind/unbind cycle.
> 
> Move the mclk and dsp_calib_clk acquisition to rt5514_i2c_probe() so
> the clk references are tied to the physical device lifetime.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
