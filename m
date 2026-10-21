Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792623529;
	b=eDMMSyXlCScMHLPjQyIp+Cl/fM1QfJwF7VU8DpKGr4+ZkR3jrANCMu1XKVTKm9zcDLMY
	 /ohru+7FoDfMyq+aHMsJ/vbAbgLmaOyWGTbrWazBq3Qc52EMNaOuSlv64Ihu9yKI1k98f
	 mjgDXI1pHPE8vEcI2C5tdfW+pM9blOPwNx/N0zq8OnBowK1RPq+RdaZUTo51t8cv3Dloz
	 NlYlkkaZpnHm74+cCsLcPWBEFcqmbdU4gS2EZVsNu7tPoQHlleHTD/9tHls006LFx1ykK
	 LjFqBrHCsHkJNHis4Z8ILvuWwKurPdSuGNjLDQFNnA2ezM2Qag55CrXFc10YcdEshGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623529;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:From:Content-Language:In-Reply-To:Content-Type:
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
	bh=HYKujTtIS1YhpWsjz/tgOVqEv2TTFcp5ZSaHHYgIyco=;
	b=Gz7E0qENm40cmG67MQLsnsU+BEY027RTRjLXlSiksvrspaTmxWhUp0O1VP+qrSbm+tGz
	 52Ve/QyqsV6k9k+q6DF8V0Bmpcqh4NayGXgecPPsxv9WaTE+JkcaF6hzOKV5zd2FZrULJ
	 4Du0+wmnsjdC7wv+rUmhOSjjojQ2/S74iUy518VPoGdAXE1FZmVDLCIpMtTonZGHXeN/a
	 jYkrqcV/aH2tK43QQ5dN6Ln6oyefJDfMpz1cGNMK1+u0wS65gLaPZeVjVsoFs8CYv9/OG
	 RM2iAsQPsKVFazZ8j9fmO7yd+zDXHDlyuIIp2hZZ0WzG87AYwOtCuk0Vn94QkGmwgbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NaF26R2L;
	arc=fail smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EA0606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 22:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3EA0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NaF26R2L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792623527; x=1824159527;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VE7zngzvCYPhsUKp5OrdWUXisqXnV26cCaRtrkImtak=;
  b=NaF26R2LdljEszkwEdZ9c1vv/ilFGTFGWjT29gwBZblsCgUml1pGUVPm
   X92xjt88Srd2qo4XPO8JXZLgy1coFk7BbLA/WP/69kWI5nAHZnkcnM36D
   EtQ2/GoaWN94Z4KYO5EXkn9So9ooabFi2ieCJb7QKTMUNrA0OgDMZ20Rd
   4TlM1p/PEyy4EDd43ERjVfrQ70VAMEynrNpXHN+5Vd6qB0jFMOiTU0smW
   hePz6n4llXzmDEURL7kIoUyxVPWlAYyyS6LWfSE7OB5oe5dMhzFwSVkuZ
   k1dIf9ty0HVOp2nPyp5uUTYCapOYg5t+MQiChWrd2CNtLOEgJB6G8xb1W
   g==;
X-CSE-ConnectionGUID: SGpT5ol1QleyN/ESuioBrg==
X-CSE-MsgGUID: CulSs1uzQw6tSIgBOf0x/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1251283"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1251283"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 15:58:46 -0700
X-CSE-ConnectionGUID: /btoXh8VReq+FO9HzxXV8w==
X-CSE-MsgGUID: Xjlk9bQqTd+6ymBw1KFyPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3335721"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 15:58:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 15:58:45 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 15:58:45 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 15:58:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VrMxd0XeGeueS6P3xHv9QL7fGsE0CSMl8VjHoXZShbOfoDjFBob1Gm7XNH3pyK0eJX/Vhzpvsk8wpwgTZQDoI7S4+Xhlxl9CtyuwEDrJBnSPWqunHALnpr1Diz11/yGIZugkh6EWuLB/sSM0U/odrgN82tEaivuaw/ipYzsl3nSyMWosiYcSAoJbu5/FbxOXPE9UBpp1aaZ2Brp3BhAXfRSjkizz/o7d6vo70uz7ImsjiwPlxUihqlRCoeeYPQeBWSMLNWFLbXPpshekvHfFIz90Tx6vda/YYVfEtbIetHdPe/jewZ6YnP45gy+IhLwzB5xzoAHA/jn+V2xoFa0J+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYKujTtIS1YhpWsjz/tgOVqEv2TTFcp5ZSaHHYgIyco=;
 b=Z1iWm72sI3nMSWAp7uTqf5QrTyJHerz5qfud1ta+lG1de79CHfhmqrhWpDa7DNtU9QPfI19tg90RCi8G5CimHxmN694rURrU3kfwgyoY5VWwg1KzUjLn0/t+vBfGddp6e8Z8p56oMG4oa0XqyGN43R+NOJt26ft4c5+LpRCMbQzjb3l4zmho/yVVaQfvNCm+3kI0wGqM5QMoaZtQFuL6aqDMtKiFF5IyDhlYNVatD60dZCyQm/FTXIV7RHfKMGT6XkyOP/xiibc0AB6+muUoJR3yAm0c/SwbH5yTmjkn5tJuL4D21w+5pEXV4BqWPmJ/Py9wlDvieHreZc0sSB/fjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 22:58:41 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 22:58:40 +0000
Message-ID: <c96fb51f-9ab2-42ac-81a3-a5e49c87c2b4@intel.com>
Date: Wed, 21 Oct 2026 15:58:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86,resctrl: Read event counters with an IPI when the
 read cannot block
To: Shakeel Butt <shakeel.butt@linux.dev>, Tony Luck <tony.luck@intel.com>
CC: Dave Martin <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>,
	"Babu Moger" <babu.moger@amd.com>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, Peter Newman <peternewman@google.com>, "Meta
 kernel team" <kernel-team@meta.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261020151352.2346257-1-shakeel.butt@linux.dev>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20261020151352.2346257-1-shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:303:8f::22) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CH0PR11MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: c862bd44-0f95-4849-7f34-08df2fc6d962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|366016|6133799003|10067099003|22082099003|18002099003|261021121427099003|4133799003|11063799006|5023799004|261009221227099003|261009223027099003|261009220027099003|261009221727099003|261009223327099003|56012099006;
X-Microsoft-Antispam-Message-Info: Cbltm5oeEPryg9NuaBgm4eJyTZgSpiQX9mw8lc3HIljbmYUAwQRgPw8r+WtBo0tMqXqR357LCSuQKkN56fplQsSKY5RIULCB7yoqjMHQt63DojoZPtFBplcUuEVC4Wry69Q3WI00WgRHAc6K3SjL6j6C8M25Bvres9cqaEieH7qnMvm3T9wZfW5VB+ZiO/ADjs9Bn+By07XJleFrlSzndSZLCfYhgQDLjCV/sQCocLDw5PeV/5Csn7bZtVKBhbzuS9023eGWvMWGYnKTfXxJChA1Xxn08uaoPJaUJorPBrt0KTfUGKA0sAm9EnDye7GfLhDoKiWHw5max9IdCpQI/iEeGaH0wwTsMVTG5o2tjQZGiqiqLzdKR3NYmFzFtPjj7HAa9QOFrM15QEByjjVQEneWJuPJF3uFELRCPjIRddg4tZ8vV0lv7U5qBpBeY/S55A0Qbh8qX/2YAU/hEbejmXl/CvfZ2cMvc9gDqIL1XaAw7Xkd5p09NUIWTWV0wxOGjPIvYDNGYaHcSuuelNpxJanqOwGSKRT9jfioDH6bBdFIdByWKqkNIp+s0vg3OMjDFp8DriebQ8c4YXN5M+7FYfQxTq6R8XlQk43uL8ot5MYC7fx0tIqxQRCCLMIB/7Ap
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(261021121427099003)(4133799003)(11063799006)(5023799004)(261009221227099003)(261009223027099003)(261009220027099003)(261009221727099003)(261009223327099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am52TVgxRWhkK291bjJkME5uVGMxZUVxVFkrNTBlR2xEUS9TZ2ZTNjNVQWV6?=
 =?utf-8?B?S3pWYjZVcHFRZTZzbEd0MTZPUVV6YjVpZmZFWWF2WHREeklocWdHUHA2S29w?=
 =?utf-8?B?bFFkUFppT2poZUFodXN4enBuZmdCZHA2N3M0aVNwVDcvNHEwSHRzWG1uNVVL?=
 =?utf-8?B?enhzUm9NL2VqbCtNakRlaU9SQU9IMk5SWlk3WmZ1b1dVdWZjQjRZSVNoR0Nz?=
 =?utf-8?B?QTN1QUhQOTZUSHRKY3ZZYVlWRUhPN252cml4QzE2YzkrV1M2Ujg0VUFMS0Fz?=
 =?utf-8?B?dFJZbVRRM3JaWEh1Vmh3NVBYa1RxK3pCMjkwd01sQzJOMEJlSU4ySGQ4Qkt2?=
 =?utf-8?B?d2I3U3VDS3cvTDc1T3dDeWZHNFQ3V3dKZWhkY2Q5TG9OMXE1UmNlYTRuMita?=
 =?utf-8?B?QmswZitCaXlUYUt1SS9nZFlpQ202SXNUZXgwRnQwY1Z3SUgyV3o3WmJmVHFo?=
 =?utf-8?B?bVVmbnRWUmRZU3RlSTRDanFNUzdHL3MzMWUycG9WdzlGdHBzemxqRllwUTlQ?=
 =?utf-8?B?bEJQNkhwMEFMdCtac2VkWSsvZm1rUDlyQ2l3WldwTVA4MHc4UExrNU9LQjdt?=
 =?utf-8?B?U2ttNEpmcmhkZ3UzNWljT0hhUEszVnpsSVZYVlBuZy9KVlZ5Vk5Rd2d0enJP?=
 =?utf-8?B?UkFFL0pKeGZHYk5VbzFFZElMSUR4Q0NIeEhFS0xmNDFWSWRPam45elRPanlE?=
 =?utf-8?B?RXJmd0cySFdKZUJ0UkNjYUM3ZXVZTm1PZStZOWtxK2ViRTlaNlorclJyR1pJ?=
 =?utf-8?B?TVJ1VnVzOW9tTUd5WlRzbVJ6dHVjdHNiTloyWUwvL1Q4djQzWVJzRXRlcC9m?=
 =?utf-8?B?VXBNN0MyL2ZaL2RlVFJYZ01DTkY1RU9nY010dDRTeTZpdHhJV1RSZXR1eGNi?=
 =?utf-8?B?WUlJZUU3cW85aWUwL2NDSkFmZ2F2cEJ6a3ZpV241Q2pXME9EUEZXS0pGWmFY?=
 =?utf-8?B?NHNiNHQzc0F6dHdzWkFEZThlQi8zWXFaVXFSeHg5WHFtMmdvT3dsRWdqeTlS?=
 =?utf-8?B?SmFSWDVZMFg0Z3orVlZLMVViVjJVcjA1YWRMTnFmZnBnY0dKNmdObTFLK2xT?=
 =?utf-8?B?SGxZUXdKZUFiMWdDei8wd05uWGVHZWpIS01TOEpLYjhFN2FYa0lqeXRHSi9C?=
 =?utf-8?B?dGFKUHN3ai9CZTZGNFMzaUZ3b1JFUW4zdS9Wb0xSNDFjdFpsb1Q1ZC9iMDgx?=
 =?utf-8?B?N2JsNnJNTGZIMDNHY2pNZTBsOUlvTCtNb0c1N1JqUW1UTmd5UVAvYjFDRmhL?=
 =?utf-8?B?VG9FVC9zWEE2bEJkU1pNU3ExMStXYXVxa2s4NmZOdXpPMUNhWTNzcWtLaUVJ?=
 =?utf-8?B?UUV0NitEaVlnVDdkdGZSTTN2ajBQaE4wZHEra2c3THdVTVEvYXVwdEEwVk9n?=
 =?utf-8?B?eDlhcHZKT29xSlhMUUtpb0plS0JCZG1ncnFKOTNxTDF3ZXk3VzBmZW9xMjJp?=
 =?utf-8?B?Q0RjZ09DUTRMZjFKSmJ2SE9iVWhza1hYZ1dFWjlZODduZWxlRERPYk1yUnFH?=
 =?utf-8?B?R0Z3TFdrUWVpTGpZUVRvY3VuRWp1Qk90TG04NDdYbmJwSE5sQ0FuNHZvQVla?=
 =?utf-8?B?YlVlZEZtanZsNVhzRlRVQVlINVh6a09ZNDJyZ0hhZGxnT28rNUJBa2UrSFB0?=
 =?utf-8?B?VFFZV3Vnd0dkaWhrSmxjNkxvcUszRjJCYTEybGR6SnlCSkovRHJ0b1NNN25F?=
 =?utf-8?B?QVI1allRU1psMnRxd3E3RFVkNXRUQ2NMaUhIbUU5NzU0NWxTVm1QbzFLUmtY?=
 =?utf-8?B?UnlPMUg0YXlZY3B3UGxDM3hEcktCMHcwMnNEYmVRVnRGVXMxOXRibE05aEJV?=
 =?utf-8?B?em5nWUQ2Sk5RVUhGbFhCUFY4ZEorUnhva2RHL1VRZkU0U2tsRUlMbmY5RVFY?=
 =?utf-8?B?bllLTXhuMW9uS010clJQZkhvY3FCOW9JV2srWXFWRnhENnNjZ0RwcGgrcHFJ?=
 =?utf-8?B?UVorbXdjVXJ0ZWtFbjZQRG9aNFBienNxTENweDNLT3FldTN5MEZkRUJocHk5?=
 =?utf-8?B?WTBENVZPTk1yREFWZWVqVXhtdjFkcWk1T1B0cnh4aHhmRXhxSzFFVVUxT2Zi?=
 =?utf-8?B?WGJ4Qnd5eWZubHg2Tjk4WWQrbDNZR25XZGIxVFQ5ZWVtU1N5eVBZZHdmQWlZ?=
 =?utf-8?B?Ky9TOWI5bE5HM1BONVlZTHdpRHRuUXNxOWVoWUcyQ0VhQU5mRWhPbHg1bmpN?=
 =?utf-8?B?Vk1hSldvSVpCSXF0aEl6RXl6SC96eXBRWkpQTUVaWDI2MVNzNEpDSWwva01O?=
 =?utf-8?B?Q1g3aDVGajFEZFpkV1NENWd5YjlzMkFsZG5XN3oxaDdGL3NnN0dYKzl2YWFC?=
 =?utf-8?B?Yk4yU1FwU2h5cGxpZTBBY0FNRHFUYjBJakE3OFYvbGZhaWhuQXdYcGQ5RGNz?=
 =?utf-8?Q?M+h8lsZgAwBC4hAQ=3D?=
X-Exchange-RoutingPolicyChecked: vybj7+4S7pB1aMNwHqPNYec40a6M26zR07uFxGel4+3Tmu6OTk+wRSrwA4Dm2Ps1YOm/U8+BFT9Z5NG0HbCgRLTJbaKvEweznVLCrY8nx8LyPYkD0qkzFHkWCEgOKInTeqjTotsRR4CFAoqFUfk+6s1PDz0MPrc5XTF/h5N9BxBCVQeJalfppp/ED6tEIrwEnYxvpyT3Y+hh1lVSZp7l1tzaULvSUgVlm030lxLTsMKJwTm6vNCoYwIN4O0dRK8pkxjvVAZ45ByUIfjKiLg9q9GYuhYMdGPihUJB9vDiiMs+o7O9kKUNAN6KHb/iZ6kSo+GozSCPxwJZ10VqQ7aIlQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c862bd44-0f95-4849-7f34-08df2fc6d962
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 22:58:40.8501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: evyqv2hhGYDFyffUQqhaFOnqwpigUYUltGh2/ygtWH8xZMEmAQ5Tgu9vle1k8/rfe5P/WUWvbAxMUrwuhU/pyfLcMoLpnw2TCz4mmOqC5lg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
X-OriginatorOrg: intel.com

Hi Shakeel,

On 10/20/26 8:13 AM, Shakeel Butt wrote:
> In the Meta fleet, readers of the resctrl mon_data files often sleep
> while holding rdtgroup_mutex. Over several hours, a lock profiler on
> several thousand hosts (almost all AMD) caught:
> 
>   - 96,368 reads that held rdtgroup_mutex and cpu_hotplug_lock for
>     17 ms on average and up to several seconds, mostly sleeping.
>   - Three different userspace applications [1, 2, 3] doing these reads.

This is very demanding usage of an interface that cannot and has never 
intended to be fast.

>   - Other readers and the MBM overflow worker waiting for the mutex.
> 
> These long stalls put gaps in the monitoring data for these
> applications.
> 
> The read has to run on a CPU in the L3 domain. mon_event_read() uses
> smp_call_on_cpu() for that. It queues work on that CPU and sleeps until
> a kworker runs it. When that CPU is busy, this takes a long time, and
> the mutex stays held all along.
> 
> Commit 09909e098113 ("x86/resctrl: Queue mon_event_read() instead of
> sending an IPI") did this for MPAM, whose reads may sleep. On x86 a
> read is just one WRMSR and one RDMSR and it don't need to sleep.
> 
> Add CONFIG_RESCTRL_MON_READ_IRQSAFE, which x86 selects. With it, read
> the counter with interrupts off: on the current CPU if it is a
> housekeeping (not nohz_full) CPU in the domain, otherwise with an IPI
> to one. If every CPU in the domain is nohz_full, keep the existing
> smp_call_function_any() fallback. MPAM and other architectures keep
> the old path. Peter Newman posted a similar change in 2024 [4].

Did you consider the thread that followed that proposal to learn why it did
not land? 

> 
> Results on a 316-CPU AMD EPYC with busy target CPUs, and readers that
> copy the fleet agents, per 60 s run:
> 
>                                        before    after
>   hold time per read, average          350 us    4 us
>   hold time per read, worst            3.4 ms    109 us
>   time off CPU while holding           9 s       0
>   one pass over 750 files, average     360 ms    7.4 ms

The numbers make the contention clear. If I got the math right the "after"
is still about 10us per file and with 4us spent holding rdtgroup_mutex there
is still about 6us per file spent outside resctrl. I expect this is
taken up by the syscalls, the various kernfs allocations to manage the read
cycle, also a seq_buf allocation of a page (just to return a few bytes of data).

I do not think the 750 file example accurately captures how "bad" things
can get. From what I can tell this proposal only *slightly* adjusts the limit
of how many monitor groups this deployment can support.

My guess is that the 750 file example looks like possibly about 25 monitor
groups with three events each monitored across 10 domains.

The "after" value indicates that this deployment can now support more monitoring
groups. For example, 250 monitor groups with a pass over the increased number
of files taking about 74ms.

AMD can support 4096 monitor groups though so while this change is undeniably
an improvement, it does not address the foundational limitations of this
interface and does not enable this deployment to use full capability of
the systems.

If the goal is indeed to obtain accurate monitoring data at regular
intervals when using the stated hardware at its full capacity then
I would suggest that you consider the per-group rate files that Peter
settled on per
https://lore.kernel.org/all/CALPaoCgpnVORZfbKVLXDFUZvv8jhpShHPzB3cwdLTZQH1o9ULw@mail.gmail.com/

I actually cannot remember seeing an update on that work after he posted that
message and my assumption has been that that is what they have been using since
then.

Essentially the solution builds on the monitoring data already collected by the
per-domain overflow handler, it turns that data into a rate that user space can
read on demand without any IPI.
 
> The cost: interrupts are off on the reading CPU for about 0.5 us per
> counter, and up to 131 us for a root group read with 128 MON groups.

128 MON groups sound low - it looks like AMD has 4096 possible MON groups.

Interrupting a monitored application with interrupts off for so long
is significant for a fleet whose product is the monitored application.

> A reader that runs every 100 ms used up to 29% more system time,

Is it really needed to get the data every 100ms? The overflow handler runs
every second and the data could just be queried from it.

> because it now spins for the IPI. A kernel with lockdep and
> DEBUG_ATOMIC_SLEEP gave no warnings while groups were created and
> removed and CPUs went offline under the readers.
> 
> Link: https://github.com/facebookincubator/below [1]
> Link: https://github.com/sched-ext/scx [2]
> Link: https://github.com/facebookincubator/dynolog [3]
> Link: https://lore.kernel.org/20241106154306.2721688-2-peternewman@google.com [4]
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---

...

As I understand this patch slightly moves the needle on how many monitoring
groups this deployment can support. I do not believe this patch enables this
deployment to support all monitoring groups possible. 

Please do consider per-group rate files as discussed in the thread around [4].

Even so, surely this patch improves performance under some scenarios. We could continue
to consider it if you still believe it useful.

> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index cafebdff70dc..c6fea953e962 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -601,10 +601,18 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
>  	 * MPAM's resctrl_arch_rmid_read() is unable to read the
>  	 * counters on some platforms if its called in IRQ context.
>  	 */
> -	if (tick_nohz_full_cpu(cpu))
> +	if (tick_nohz_full_cpu(cpu)) {
>  		smp_call_function_any(cpumask, mon_event_count, rr, 1);
> -	else
> +	} else if (IS_ENABLED(CONFIG_RESCTRL_MON_READ_IRQSAFE)) {

Please avoid a config option. This could be a per-resource property,
for example, rdt_resource::mon::read_irq_safe (I'll defer naming debates).
I'd recommend against an architectural helper like [4] since now that there
are multiple architectural drivers the scope of change will be significant since
it spans across branches that take different routes upstream.

> +		int this_cpu = raw_smp_processor_id();

hmmm ... this is meaningless without preemption disabled, no? Looks like this
uses raw_ to get around the CONFIG_DEBUG_PREEMPT check :(

On the face of this it seems to attempt a re-implementation of smp_call_function_any()?

> +
> +		if (cpumask_test_cpu(this_cpu, cpumask) &&
> +		    !tick_nohz_full_cpu(this_cpu))

Doesn't this "!tick_nohz_full_cpu(this_cpu)" check defeat one major goal of this
patch, which is to prevent an IPI if a reader pinned itself to the domain? A monitoring
data reader may very well pin itself to a CPU in the monitoring domain and be running
on a nohz_full CPU.

It looks like the rule should be "prefer the current CPU whenever it is in the domain,
nohz_full or not"?

On first glance I wonder if this could be re-ordered. I surely need to think about this
more but how about something like below:


	if (r->mon.read_irq_safe) {
                  /*
                   * Reading the counter does not sleep, it only has to run on a
                   * CPU in the domain. Prefer the current CPU when it is one:
                   * the counter can be read without an IPI and without
                   * disturbing any other CPU. A nohz_full current CPU is not
                   * avoided, the reasons to avoid nohz_full CPUs, interrupting
                   * user space and queueing work that may never run, do not
                   * apply to the CPU making this request.
                   *
                   * Preemption is disabled for the test because the answer is
                   * only valid while this task cannot migrate. It is enabled
                   * again before the IPI to let other work run while waiting.
                   */
                  cpu = get_cpu();
                  if (!cpumask_test_cpu(cpu, cpumask))
                          cpu = cpumask_any_housekeeping(cpumask,
                                                         RESCTRL_PICK_ANY_CPU);
                  put_cpu();

                  smp_call_function_single(cpu, mon_event_count, rr, 1);
                  goto out_ctx_free;
          }

          cpu = cpumask_any_housekeeping(cpumask, RESCTRL_PICK_ANY_CPU);		
	 ...


> +			cpu = this_cpu;
> +		smp_call_function_single(cpu, mon_event_count, rr, true);
> +	} else {
>  		smp_call_on_cpu(cpu, smp_mon_event_count, rr, false);
> +	}
>  
>  out_ctx_free:
>  	if (rr->arch_mon_ctx)
Reinette

