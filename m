Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E254BFE6F
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010666; cv=fail; b=S8NXpnQjrUhjzYFB2dwWLyrv2sFM2QWts5roQsWJDsE7TC6X9/EIp85dbMJ6UWSMHOk4mzT3SUwFyc2xOSP1yFQDmERtaPA2Z+/caoa09N6DMLOIReMxECDTfEwepZS0xjbAo7tXIzOZeRIkUMKanc6Hj+skYxg2jx8VdZeGFow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010666; c=relaxed/simple;
	bh=G+2rGbUQJ4ZBFlt0q1/w8K32iGCBQzRI38wtqB4DllQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MccOl1EpPPM5vrIVLABtWT/+A2V1u7p1dnONaAMSQZ1EPBPlFxWh6aIcCt3WjzxEQFV6VZDjgMhNBW+A1R0VjbuiFVzXUlrn7i5mxbdMHinnhRqSS5olKyhwpysHPrJFCr01NscYKfcx/KhWcwk+HZVS7nr2tY0TbaSGWH6FmkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEsHFBG5; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEsHFBG5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792010663; x=1823546663;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G+2rGbUQJ4ZBFlt0q1/w8K32iGCBQzRI38wtqB4DllQ=;
  b=nEsHFBG5y1P2BbaD3c7OfYD1iRI+3OG+mT3H9rB//pM7a6Sioi1hjQAJ
   R50De/OVA8Ku/sqiuua/ZscliP/a8U4b1ku+0kipyRGrJQaBn/+qO1OX5
   CwlMAjGYG2Y6dnGZ4YTmoCBYGuimi4okdSnlL9889ueyYNSGlePnjwXN3
   oldAJEjR3YoEBcQ94rxuR3P60WfC0i5jKGgOhXHzA3lVZ66kt4sSaieV8
   N5Hum6UbaUbYBBQ+8lg5jS/9lQOakvsHKyWQCFF11a99JN0A/rUSZyARk
   sukeAqpNFl+indzi6iieEC9Y6lPe0N+CXy2IDdlbwDxcVN0EVcdxVf09v
   w==;
X-CSE-ConnectionGUID: /mckw1W9R/WeLd9qCwm1eQ==
X-CSE-MsgGUID: SSluTykCQV2Bc9UhYxHUMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="758206"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="758206"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 13:44:22 -0700
X-CSE-ConnectionGUID: BNw+OeJvQoig+pr7mN1zZA==
X-CSE-MsgGUID: /aDE15iBS1aKWcotQe5UYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1583364"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 13:44:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 13:44:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 14 Oct 2026 13:44:21 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 14 Oct 2026 13:44:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Li1z1HhCOhkzk9djIMuznHCJCbLt5raghkF0EJS+vuu1lLIkGvTkLxYhEcxpb4XVP9cM8qTKB9cX71XHAQNJbdPLHmtarQBpiXI+qpgmMUFH2VIOoFN5PoIYeRz5rj5b5MYN2SbT+p6WJ0V3MSvczDhEqjQVZ73Yy4dbSsAq0f+CGDjFtrquZQWFd6XcS8OQMb+BHxZ5+Th4fE9svZSeSDWTnNkoCA3iK+ak8tnVUwGt3CNUnEZVePb+Sia4ArhuIwGvkAFINjjiVBxtEbydeSmENupWi8v/iRecgefJuFvQ6Q9Pcfj5knPhH2WMC3kREfalWuPEAPkf5H6zhBlz1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pUgxm+KsEZefNQV3Bxh2Xw+foDgOWTcA2Hj5bfCn1sw=;
 b=sdCPhpsi+kJhSBW0oO/kSLCllTG/535u2rfMl+aotKm9n8lMDd4aPQ58F05H7f0Hui+Xa4L4WWj8DX0/31HefvEO7xMI+LuXwkpraeLpD8fYLR3Lq3cnGy79TrfAW6uc1xUioZh1kD2Cq4w6cojbSjydM0CietUoigz0jVG7G1BraoKwLBSx0WeEsr/wfr9v5k2XgLZHKzrt6YCJnnmOaKsrFWI1NlH6EQTWAr+KxfgigrWytRFTPUG/y0h2rZInapqDgy/MjQ2VHATGOqOKhTZF7XMhSxIq7YDYUU59sv89ZTpnUb/sWPj56llL96ksU401x01BdCZ4mqYKscg8Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA4PR11MB9083.namprd11.prod.outlook.com (2603:10b6:208:569::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 20:44:18 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 20:44:18 +0000
Message-ID: <4bc68d06-a45f-45cc-80a4-f72806d5c976@intel.com>
Date: Wed, 14 Oct 2026 13:44:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/resctrl: Require force for L3 CAT on early Skylake-X
To: Alexander Graf <graf@amazon.com>, Tony Luck <tony.luck@intel.com>
CC: Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
	"Babu Moger" <babu.moger@amd.com>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<nh-open-source@amazon.com>, <lshahed@amazon.de>, <jaspwise@amazon.co.uk>
References: <20261014083637.65430-1-graf@amazon.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20261014083637.65430-1-graf@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0047.namprd04.prod.outlook.com
 (2603:10b6:303:6a::22) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA4PR11MB9083:EE_
X-MS-Office365-Filtering-Correlation-Id: 56752ade-ca0c-42b6-13d6-08df2a33ea9e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|7416014|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Ghv/oFTMEk6kzZWVckc784mxHysf6CPORr8sc6LdJ+PjA7nX8JhyMN0EN/gFd6Sy3aLoD4EmSZnlgsqvfYG1uun6MBYFhtexf1wi1jFpzKjbaujeBCMLMlrkV+RcKHAimQiwcKkzK+g5l9fmLYH3O87stYQFK/dZ8XBYDpkPaGER5rqkyRREMrgWVj5s8l+zR63izULxW8ACTKUXAj5gDwSgg0WsBOyf5jip0gLOUk+Mmgw+NysZqVmj0QJtFTcKeot6Cl9eQrox+WLVqGVWoJ85oTyfHAmTZYu20xywqSZ/A/687pyb+vmqaUUcg8cFz+NhqDELi/Pe1Y698IOAkRppRcmIUSNpCY9cDt7taKEyg0WFBHOLgIu+fc8BjhuNNQb22YlwjmuUb6g8ahpZnN89LOkSegTnCBNOdlbouynI+lVujKQHVPzIm37V8JVZ/MA8cozRm812R3L63vNtuWHvS8/C+LnYUqU+euuVUOWPV6CIe6BKSTLQhIuUGkh1bjzj0RMjk+G3R2UrOv80sgWjMsT3+XA1mpCI9BO0ASkI8DO66AhC/S03HacCenKPyuNNzWSXSDUCXFQ7pLMguBDGdnCyeasE04/nDNIk7gLlikN2dtqlTql+vw5UxITc+FF7+CvAJwCAGGam65op9O6/oo2uiPgaZtHSdd8sIb8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(7416014)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c1N2S1dzbnE0MUV3MUVOcXN2RlMvb1lQRGtKYm52VlZGMEFSa1lwSXYvbU5s?=
 =?utf-8?B?cEtERFNCdGgwa0hZNGpyTkZaU3JzdDMwOWdyTE5zVzRZVGluUXp0Q1FiTDJF?=
 =?utf-8?B?YUlaS3NMdERoVVZxZjN4QldaNjhWbXBoN3I4ckpDMEl1eUszQ2NtZHB3Z2xD?=
 =?utf-8?B?RnRuVFFqRHBDc2gvSzR4QzMwWGFRUHJuVUZ5eHo1MlFOdnp5VU4wUXBZdExY?=
 =?utf-8?B?VmRrR0wycHo0YVVEVGlRVm1wSkN1bVVIMi8xVjQ3amt0bmw2S1hPaHVwZnZT?=
 =?utf-8?B?L2hyRzU0OER1Z2dITzRRNkNVYjFTUHFobmV5NFI1bE1ESTBvWklrUDdBNURs?=
 =?utf-8?B?UFMvQVBaclpKeHhzanRubzBpZnRKaTJTSGJGSzQ2OE4wWmVEQkNGOGZWNiti?=
 =?utf-8?B?dE5VMXNPLysrYnphZWdNeXo4L3NRY3M2WnVMcUc1R285dm84WndTTndpTkd5?=
 =?utf-8?B?M3VPUFhyT0l1RzdiUVl6Nys5QVJqR200QzBYaWxidXdzQWlKY08rdHhhcGRG?=
 =?utf-8?B?eHZndlAxMmRqVGsvWjd5b1hncHNIL0pReW9MUUhNdnFSOStBNEZNY2Uzd1lJ?=
 =?utf-8?B?Sk1KVkZSb2JmVFlHUGhXOTdhakw3RkZHWU1rZHJpN0hRRG1RbitGeTJHYk5E?=
 =?utf-8?B?OFFkSlpZNEtHNUFmeVN4SysvVjhnc2x1QitiaVUzOGIrVUM2NWQ5N2R1SzMv?=
 =?utf-8?B?USs0OHA5U2pCZVJWU3prRVMzSFJaOURDNzVZRTNua29SME0zbTJXcWZsRjIy?=
 =?utf-8?B?WDFuRFRpemdIZjFQV3U2Ry9jckhBR2JXVEZPUlJGVTRwZ09kYWNRWjNwZmZy?=
 =?utf-8?B?Yk1RaHJwYUh0R0pqZEt3bXpuSzRkZzFrM2VQYUhWNUIzdjdQOVVUbVhZbnFY?=
 =?utf-8?B?NHV3N3JoMHdSa2puR0xXODYvZ3d4Z09WZjRsNCtrelRMMm1EVWdIeHU3eDVZ?=
 =?utf-8?B?WnUwTkxFYS9DUFBmOHdBTzNRdmx6WXdxSWRGSk15Sm9ROUkyU3VycHZLZk11?=
 =?utf-8?B?QlJQcjUxQWtTbGtISzFPM3lrbkQ1UzZJRXJ0WXRJdC9YOVlZdUZ5YVZsVDZm?=
 =?utf-8?B?VGovM2VXM1hvNnNvS0IwQ1FDNDh6anU4ZysvMXU3N2xQdE5pSFpGU0Z4SzE2?=
 =?utf-8?B?Mk9GaXg2NUszYUVrZ2FhS3AvWFRQUGp1YytUTmxOUk9vSzBDU1dyd1JaWTJr?=
 =?utf-8?B?ZzVLRVA0VnBNTE4zZDJac1lha3FTeUgva2pHYnhveTlrSm1iZ0E0T2I4MWJz?=
 =?utf-8?B?UldtaVdSYkFycXVlclNhbks3ZFdJOVYyem8zWTlWdGtKSFJCNGxVZlZsbmhD?=
 =?utf-8?B?cWhoNTJiRUNJcFdRenFVeFF1OTJWSzdiU1NDODJva01IVVgvZUxZVmkzS0JS?=
 =?utf-8?B?S05HTUwyd0tJd3RIWHpMbXFNMEhPYXNlOTBvSUd1eUFKQVB5ZVpWVTRyMlVt?=
 =?utf-8?B?VmVlZzI1NG1xY2hwVjJObU52MmdNNlJFZVBYT1ZlWDZTSVNTKzlNMjh3cVNx?=
 =?utf-8?B?M1EvenhUVDJYV284cmtvaFByRTJjV2RaS3R1NVlGMkVvenJEMlVJTk5wTkth?=
 =?utf-8?B?OFIvNStSYW5EN25EY1Y4ODVTNDVwSHBYU25FQi9sWnNPMnR0a09YczRyZWht?=
 =?utf-8?B?aENUbHpaM2prems4VUF4bWtPMUlYakVqYjhSbXRIN0VLeVJoVjA0ZnpiNU12?=
 =?utf-8?B?MkZwcEF1RUxzOU1BMHU3Vk1ibWhHNXRzWksrYUV1TG4yS05QVDBPdU5LNFcw?=
 =?utf-8?B?c3Q3Q2VqV0dId3cvYnJPaC9EKy8vUDhvSElmclZlVWVWWmNvL2FqcFZ5TFBm?=
 =?utf-8?B?U0RtVldTaXUvSWZvdUR6b2V6V0liVGEySXY4VUo0eFNVbzhhcU9BQUtUTmpE?=
 =?utf-8?B?ZnNMcjFxWHl6enpQTXM2SHhRUll3RjI5bWVXRXVGaFArRVllU2liYjAwSjU4?=
 =?utf-8?B?ejR6QzhxS2VJdzNvM2tlT2YweUp0YW00SVZUaWZEU2FyRVh3M2xHWmdPWnlG?=
 =?utf-8?B?V0JCTFFaSHYrNE1QeFdoMDRibXRjUW9oWHJ4WFV6YTVsQzFxOXFhMHdlVHkv?=
 =?utf-8?B?WXh0ajJjelZ5ZklIbGZuc0dxUS82bE1qZzFWdTBRSnR1N0FtcFhPR1k2c2Yv?=
 =?utf-8?B?M0VKWlZ2NnhSR3BOWE5hd3RxaFJhNGt2eWx1SnIybi9nbzRLQWN2L1JkZlZh?=
 =?utf-8?B?WUZKck5zUW9PUElKSit4YlFtL1pVL2Z6QUFNdENZT3NKbmUrS0kwSjJRWUwz?=
 =?utf-8?B?cE9yd01SdTVQSTFJQ1BxWWdrRjIrKzhQUFVWaFR0WFIzUzVvMVFmdUpjdTkz?=
 =?utf-8?B?QUNiTjlCSHFmekFIam5xRWVHMU95MWxGYW1ZU3dSQTNkY1pSbERzN2F1MmN0?=
 =?utf-8?Q?lEqqyZUSK8zi/SmA=3D?=
X-Exchange-RoutingPolicyChecked: 4wcmfDN0Hnd+j2BpRGiFir31+Lb7FsrDuFQ6p/OL0AZy6yJ9ZOH2JwJ1Msgkq7UavL1lsAJjwPG6WdI4VIBD93+uKuDRH4LBiV+vewiOdTforlVaglaHFIwz8Fo8rFrc4JxIxiJ6YEayITDCQIIbxQn75LOuPQ4EczphQyR4KhnR+/kkoo7Sg5HiVMsmUbvuTFdoHbcj6NlgyLlRGBii4iLRguts1Kocm5fZJ4zqsTQpu/cjzi99PJyJ0u8LwCVtXkmep4+bnUJmrlLhgpptp8CQe8nBNIhmutoAltgOgQLUBj+05UKz4b5x/2Gb3PkTTqM4ZRyJnh018e3eKXFsUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 56752ade-ca0c-42b6-13d6-08df2a33ea9e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 20:44:17.9591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GQNC/EEVy7UJtPhtNp3lw4QACOiOrXS7G0EEErbAYnYmH3/qk2/oAjGbCjAWt33sbghYfXZdnlhF4oVh3+h8f6v8ZwpuBa8bRTFklxujQ2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9083
X-OriginatorOrg: intel.com

Hi Alexander,

On 10/14/26 1:36 AM, Alexander Graf wrote:
> When L3 CAT gets enabled with rdt=l3cat on Skylake-X stepping 3,
> consecutive kexec boots hang for me during secondary socket bringup.
> Cold boots on the same machine work.

Any insight into where the hang occurs?

What is state of resctrl fs when kexec runs? Is it mounted (with which options)?

Does the boot hang whether resctrl fs is mounted or not?

If resctrl is mounted at time of kexec, has it been set up with different groups?
Does kexec task run from a particular group?
 
Does it make a difference if resctrl fs is unmounted before kexec? As I understand
kexec takes system from resctrl without giving opportunity to reset. There should
be no accumulation of state but system may boot up with settings left over from
previous run. Unmounting resctrl would give opportunity to reset state so that
new kernel can start with clean slate.

What does "during secondary socket bringup" mean exactly? For example, is
the hang when first CPU of second socket is onlined and found to be hanging
in the resctrl online handler?

Thank you.

Reinette



