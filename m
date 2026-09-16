Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19BF3630AC;
	Wed, 16 Sep 2026 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570713; cv=fail; b=DLrgOx0BCexfxMR3uX5DzUaAtd2zPYabp5fVeXGoTd1ipN3ZBdc+ayP3xAzScsPSDO6svjwZVZPNA9X4A8dRJ2w7cf7DM2dcDaZf9IQ6EJTosAMYrcZoA68pvwBbu2LLhOuhELJva95ErTonQnRNT6BXcspJD49LEdlSyK5FVYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570713; c=relaxed/simple;
	bh=liUDlkZbIlaysYp977KQf7zVBtg88aRJnrfHuYF42vM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Sje4WoiWvb6rx4ycuLuI72VIT0GQJF2NTcE34vbF2Wt73TIVa6XT6019qpvcnDAQAgm7MO74s+1/F4R6g9H3d6rO5gKJ8/rLjsXibt2phmmaVvFjPp6PpIQ4hxvLaK5kxwg+RClPkOq9pYuuIwkzpv5W6w10YDikeFf6OfwfVgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5yMhXIo; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5yMhXIo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789570712; x=1821106712;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=liUDlkZbIlaysYp977KQf7zVBtg88aRJnrfHuYF42vM=;
  b=U5yMhXIoorTR1hBToNRC8pmtLEvNGxyWGegU0PfikFRFIDRJre6MMYEr
   AQDORlAmTRlqxh+soR1klRE7455df+u9+dSxjIfNCZ373gm0bqdOI8/F/
   X8TKDoKOckLle4F5JBn4xFeTmgk+gp9VsiUqMi0Jay0Mtl+HlKviacLiM
   cJoW4QwuvB4zAyRDJLOSxk+Ci8fKOg+Hkp3UX7TrZg9k6aQzPRXgcHdNF
   2tJNwUGIgfzALm7YJ9yrM7LzOyJ24DNl++qSjjYyzMNSTycpeIgixWVUf
   MeFK6UbKPuldOGuR23i7JCtFK2NDSU87iZbeLiuxvWkpUYy2kKN2rMAfg
   g==;
X-CSE-ConnectionGUID: BE0OslkoTsiZvY36aWWfew==
X-CSE-MsgGUID: ce4q1R7VTaujgextGFp2pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90083327"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90083327"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:58:31 -0700
X-CSE-ConnectionGUID: Mh2wcnryQN2M0EMdmADGcA==
X-CSE-MsgGUID: D9dDIWYNSbSQX/JCShQbYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273899303"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:58:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 07:58:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 07:58:30 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 07:58:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lXQTqre5MAEpqhIZgr1Uiz38u2QfwW3v9BMjJCtGfFdVmaseS2xW7jpZ49xfqwl1hszVUbRdxJykT39wZSO79caYq1dHc1llcDSjmjK1fo83dyeW0UmTbaVvVpSns8bPaZm4YI3vJSojxqnT6yDzlGm90lVEK83zNarEB1xN0hp0/Iwdn7e9F0XwW+5KytJYOdygUJYWdGoeKDTFv45QQsRlhBTGgwvJSTBhRayrcGsgZeCfxxTuUedz5oikcEsXs+Oq65+18n2NXzPRw9iSO180a+ZJZMbyooL7vk8YtVTPs6Z2DN5GtVzeWj2c30iJW/Ch6o6P4FRmMm+hmL1yFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLqRgz5XXt8C4h4qLLorFgGugUscPr0b+/sukO4/ZM0=;
 b=d9wqL+vF4T4B7ezcIFuHtlXIzwbY86yyId35pBhjmo/kBCPVsWa+9z/zlbKx7PiIjMVIK/jjgucLMoWrH3V/Xmad3je9akSKdu6OQk8Plkb7akp1HEYI+Hi6kaXvz8o/sbEslu822dBUT0labh7BEZgHp3GI0EBUH5AErIDU7//wSFyyMUkMe+33sT0A4V6+WccNZJsNhTHEIeUqv7pbmOncs/6aVK81TixOsPDeehtOxBxkCTc4NFLFDmfgq6IRSB0dSGgLcagRHW2UOmRbebwdLTv6DnnObkQJhCtm2KV2RDbYf8OIGdE1fXh3mdc7PzrqQMj7wcSFmg9H41u9cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB7500.namprd11.prod.outlook.com (2603:10b6:510:275::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 14:58:25 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 14:58:25 +0000
Message-ID: <f1c98e95-5df5-4c8a-be67-df8ecba0c28a@intel.com>
Date: Wed, 16 Sep 2026 07:58:22 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/resctrl: Fix ABMC counter programming for
 extended counter ranges
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1788545152.git.babu.moger@amd.com>
 <9e85f67add9ac84f55e4b0fced92ed8994f8419a.1788545152.git.babu.moger@amd.com>
 <afd86b47-d508-4739-ba6f-fd1c341e09a8@intel.com>
 <10240e0e-6879-4378-8763-cb1a9baf1f2d@amd.com>
 <30dc55d0-511d-4f5f-92df-5dd0add354a2@intel.com>
 <dbaf3440-9d10-42a4-80fa-677451085198@intel.com>
 <5af3cdd2-9436-498c-bfe0-03765eecaf39@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <5af3cdd2-9436-498c-bfe0-03765eecaf39@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:303:b7::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB7500:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8ace1d-713b-47f9-78b7-08df1402f551
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|23010399003|1800799024|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: iT8Bb3zt1XnwbzQBxqb5vbB79/YfokNp4LklIqk6VkMJ1fEYSe6iJP0Vxt3YymlqmFu/C7eMjea56+kOLwSLx83zmq+XBHAX3h9FMo3LjYcX92xsDGUS1vKgMnwjsoN1ptGSS8k0b2OWKVzk1llwnjlf0eGw5WIrcfYmchWTcejH8QY4bAYItTY2YNppVbAeRbdfJ+q2Qn+ZukvLJyAQ5VQYPGC2ELsm91Vo00VmFqljshkWXmI8rdEQa75k2TbGjrHjz/jYAkxgLrWRW+MuTCwKCwWSR9bz2rAeoFkV6UhwoGJtU1gc3IO+A9j3GljLxfilOcGsLFPqAdDoEXBU+jr4tI/wejhRLLPtX6qZaLFFmsbMHjK9wnMkjf+2Klf5pe9BjaYWbSwXZ1aOCSdv02qICKSx89XLa0Lc/34aCLl4GPXG24wdDhfJce3XA15MTynupme6T3yWVbd9L0L3NKa3l4L0tSTzawsulZEDQRuSOo39BCkHCHX0ugnFEgs9Zd2TNHO7HGSBWUDLASybcTHJREEC0b9vO+QDar82TzbqCFz653i0mWzJE+tqGOMcnmxNciWDlreYZpvslFlFAfRjePD8JqacQVDRKBNeJA/tT/RLjMGptspJjljJQaQHyLHDvo82tl2YlwDn3J38EvN/A1zVX5YFL8iI0IgmFDY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWx4NmJ1eEJMNk5XZFRCeXdielBKQ21jUmdWTnpmWWlOcHl5Zm4ycURNY1pR?=
 =?utf-8?B?OXpoOVBCNFIrRmZOeWp5YVk1NnlWSEVDL25YNkJYNWRuOEFzMVNyVWQ2a3Bn?=
 =?utf-8?B?bTZrL3lNaGNYUWg5dkVabDhERVc1aGxpY2dxZDVucmFXc204dVRTSkRMOTlN?=
 =?utf-8?B?UnNYaWJ6QnNUK1JaTC93Y1VKbkhjV1czNll1c3F5MEhJZW1qN3d4UmI0Tkdh?=
 =?utf-8?B?akhkQml5KzBHZ2thcHdteSt5dXozdEZWUm1TSGswaWxJUDY2bmRCRVFUTFFZ?=
 =?utf-8?B?SEVCU21kbTJ4QmZoOGVaME9yYWhGRHowSjlxV3FOSzliNndheUk4cTFFZU0z?=
 =?utf-8?B?cVRSRDNaU1A2WEQ4eHJjeWVmSk5KdmVzMy9KaTZQT29jeUkrSjQ3NUd4Zm1r?=
 =?utf-8?B?aWZXelBoVjlnZ0h2MjBaRTBTV1hNUSsvbTFQMkxZSytpTXFFTDBjelM0NGdv?=
 =?utf-8?B?VklvVU9seG5nNkFiRmxmNGtnMzVJRVRiNmROclNVZkdGSUVyczZ3Z1RNRlRU?=
 =?utf-8?B?QlJtNWpDZmQ4UWdUcVRDamNKYndzWklsVjU2dDZ3NEF5ZkNkcjVqRVRjSlI2?=
 =?utf-8?B?OWdnVS9qTDFvSTlaVVdnOGg1R2Zld3NybHI4M0UwWlE3RU9PcnoyUTBWb243?=
 =?utf-8?B?NTZIZ0dBYTY5TTNBT25aZVRvZm5kRkpxaFhMZEZSY0Y2U0JFeW9uVi9keDlG?=
 =?utf-8?B?VEtKR1hWM2lQdGdtZTRIcGQ4dGtkRFZaWlE1V1RzK2dSMS9GZkJSVG5mRkNw?=
 =?utf-8?B?RmdzVmFXSjFWMlRnSW96cHJhZ0hVSWEvMDRPVWtLdHpNV0JTcjJSdmZ1UHha?=
 =?utf-8?B?S0VKTXhyUmFFNXpFQ0NjaVhYclB5RE1NMTNneHFnSERFM21JTVdqQXdQZHZh?=
 =?utf-8?B?RjZwbUlUdjlMWHBWeThTTEt3U2JJa2hIYm03TzR0MXVzSU5sanFoWFNFWlhM?=
 =?utf-8?B?MlVWMk9sU1Y5dlkwQ0hvQlp4dUdwRVpkVU05UlNYQzBwV3BCcmU3c1ZsYnNw?=
 =?utf-8?B?UGtuRGczWlZpMkpVOEUwblFWb3VXVUN3ckx0TkhWZGQ1OHBRV2t5eTFJaHpj?=
 =?utf-8?B?eEkwenVJaEk5dm9ycGp4LzN1bXRneC82cG5FTkdTWGUwckNtN1FlS2J5NEZP?=
 =?utf-8?B?eENnYzZaTWNzQi9iQmI0cnNDNXVGVENVK0R0aG5tNEM2UXJvS1RXbCsvNWpY?=
 =?utf-8?B?MTc1bnB6eElwcWVLSjJnTHlrMWRPRVM2WnlOT2RqTXRCY1lHZlcvbHFXNURl?=
 =?utf-8?B?aUEwTTFFRzBPckpOdUo2UHAyWnpTTjN1TXZSVlJFVzFKa1VVV09idithMFZ1?=
 =?utf-8?B?bFlvOGY1dTc5bVZxUDFuSERLS1BZZmx0cHRYWUdDbFkza2crdlM1czJDMlI1?=
 =?utf-8?B?eEErZVV1TzdnZHlmMTNrVHNxWXpsbFdweHo0UU5XZ0VxRHg2RmxlK3g1cnNJ?=
 =?utf-8?B?YitjUjNtM1dzdWY3TmljTCtLUlV0K0FPalRwY2xiYXE4K1NkaDl2Y3kzd09U?=
 =?utf-8?B?MjlQQlM0M0w2eVJKcEN5a2pPUTZtaVovWjZ2cm9VMEM2Zms0RUNxa2ppM1ZG?=
 =?utf-8?B?c3ZrYWdzdTRlZXYwV2x6ckRlVExjUm8wQ01ycU1nM1pyMXRJRDQyUk1pS2w1?=
 =?utf-8?B?QWFsVEtnNG1YL1NBa3J5dTlLcjcyWWRLTHJqNVd3NWVnTWZZWUZlR255bXRI?=
 =?utf-8?B?bDFReFlkZm5KQmk5Y1ZhV0wxeEVDRGZwR0QwVWhTRFRTa3Fha0ZkU1JObzlU?=
 =?utf-8?B?cWZ4eW5mUytEbVgrUWdxd3R6NVJ5YTZTd1RFcUdOYU9ZMGJBT1FlNWVIc2gz?=
 =?utf-8?B?Z3Rjb1duMVV2aXdEakhMcFQvWUFsakNsa3U5bk5wTTczakJaV3IxazlFQXpI?=
 =?utf-8?B?ekFZU2k4VUt1ek91amFtVDg3T1BiRWpuSHNVSjJjdEZtZmlUQW5ZL2tZTlFy?=
 =?utf-8?B?Zml5TXhGQk5IZ0xWbTFoc3F4UXlkTEJ3K25rTVJHMXlOalc4V2FZRzNJUEF4?=
 =?utf-8?B?c0lrM1hvL3ZZelZXRlBBak1kaEg4eVE4SE9qSW5teURMaHcrLzZoek5sZWNv?=
 =?utf-8?B?VEhGbEkxd0FrM3RDVXZWcXcwZUprMlpsV3FBeFRKaXhiRHVlZHhCcExjZHdS?=
 =?utf-8?B?dmJkMHNQeng4TEVhakg1TlJXVkkzTkdkNjJTV0orcHlaTkRBZTJXQmx0Yk5m?=
 =?utf-8?B?UUxyZ3FJMm4valdWME9kRTNSdTRGTHI5bW0wOEJaRmN3NFNkWFFZNTRhVlI4?=
 =?utf-8?B?d3VZVkduUTI4aW5Ba0RsM0tjTTdsMkwvTndHOHl2Z21UN0ZteUZseHRJVkJx?=
 =?utf-8?B?OUNvRzBBbEl4VUp4WUw5ZklEamtlM2VGR1l1N041ck8rYWFOanQ2eE9SdTcy?=
 =?utf-8?Q?mhL/OL3l5jTqzcVs=3D?=
X-Exchange-RoutingPolicyChecked: OVOXu5Ru5ADf9zNZ98uVrux/WcwH6e6ltUdBz/FcnoBlRYUleBFGIXjYXX8LENpM52GNmlXYf0uh9TcBe5uuwUZg39V4vYT+3LsZWy5YH2x4H7sGA05Pm433/7y92JBtZdUHuWYbuv7uxkjfgrMU+WO3wtWswQsSNey3qEj5IUil5SgDc0CxRUDRwAKiwHUcppEPVFfQdwOMW9NOet78CBkCpYc+IaVgM/7iuabvHpd6J36DGRlrFsG/lKFgHG4GRdLCqIPQjnp/hltS6mCs1BVo6DGv93cctw3cdkLUhS/QhWAhZLHcYz9G726Qqr94ntr8GmTtbIWKGdkCHdW2Yg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8ace1d-713b-47f9-78b7-08df1402f551
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 14:58:24.9470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vW8Lznge+sfguVruY+zNEhy2J1Mk0VSe3Bn9L1W0Os8eSZ6G1lAk+SCjusWyR51wHTC1+TcrqVm5uZCqCD0qJB5lEEKV2ADx/Y5moQGB5zY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7500
X-OriginatorOrg: intel.com

Hi Babu,

On 9/14/26 5:18 PM, Moger, Babu wrote:
> 
> The original issue arose when programming a Counter ID wider than 5 bits. To address that issue, the Counter ID width needs to be increased to 12 bits.
> 
> Currently, the RMID width is 12 bits, and there is no hardware that supports a width greater than 12 bits.
> 
> How about we address the Counter ID issue for now and revisit the RMID width when the specification changes?
> 
> Would that work?

Neither change seems to be reflected in any public spec. The comment in this patch
seems to be that the upcoming spec change will cover both?

	The AMD64 Architecture Programmer's Manual [1] available at [2] will be
	updated accordingly in a future revision to document the expanded cntr_id
	and bw_src field definitions.

If you thus plan to change RMID width when the specification changes then it is not clear
to me how the timing is different from the counter ID width change.

In the end it is up to you though since the impact is on AMD hardware that you
are best to judge.

Reinette
