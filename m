Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76069365A1D;
	Wed, 16 Sep 2026 05:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789536781; cv=fail; b=JjzRFfn/7MxfACowrobSG0j7FP7CF3TS5djGqIbmp6FdDJbbtYcyBRCNxt7IevQa9WX72k4aTlqYshIo22Z08l1gUHttWWdip/6NPr79Salut/BY1l2q6kKjCoIr0LiL3Ist1Lj2fnpeZ4XRvASK6KioOcofhzJI/bBHK7OP2l8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789536781; c=relaxed/simple;
	bh=BAtc6RbTY3SSMKgJvPm+SzIEsqz7Ssipf6MRlkJSX20=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RBObCqOGOCQwsH0I3+3fSz63w2LbQ2aV8cqfGiqSE1CFwXvWO4CO8Xd/MC/iFWHQZyJTpM/J+Rhbxq+OCk8Afnw3p6Rc/VL9a0+JdlegdsN4zwXL5XtI2s5XIrJ4Q7zgAW45Ft+SvqrPcEBnL4kDKmexqfqXrrHjJTYo9ZoNjy4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XeaX/M2U; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XeaX/M2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789536779; x=1821072779;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BAtc6RbTY3SSMKgJvPm+SzIEsqz7Ssipf6MRlkJSX20=;
  b=XeaX/M2UIxDVN0eQCceInw85xEW9gkhnYsxRo/rmaXlvVIxX6A65q3Vz
   lNtLFZXIQVZtAqo8h5VMYSMaHH/8NYutakSg37s3lfyk1noYCVrvASvJi
   +HexpwWiJAD30vrmoFTN71kZGywUYmF6ASoLkRkT2befrJMCumA/irGmq
   7chpyd9Z/2orlRGA10nQR0n+MhUngEsxYPizK+LAwbAS3Q1v7fYnsptpT
   u9u/ZZAVtf84+vlFVPTWHxLA/mGDVHR6br5qkMRfFD88LE731TQGMOrsq
   7NQ40cu1HPFSVS/8cBR6CATzLfrrUvL7Yt33Nc41bAwWQshtOvrDTRKLJ
   A==;
X-CSE-ConnectionGUID: jSL7LglJSziHRfBQzhyqyw==
X-CSE-MsgGUID: BUBn+dwESo2FcZCkXV4xhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89665440"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89665440"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:32:58 -0700
X-CSE-ConnectionGUID: uljS7WnZQy+xD4z8qVmewA==
X-CSE-MsgGUID: XGKLH4YmR8COmxCPqBFTIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273199279"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:32:58 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:32:57 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:32:57 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.39) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:32:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3d2PJcdjCO7NqU45Uds+bPI1E3mbT/fAyvDym6vo3ZDuaZkgJoTFWT82oEDPEfAAoeyDVzMS5e9ZFObvpi3TjL/fyVapl8N7P9srXgb3qRATaIuJPOfUo3kjQMidsZwn8ME9qYGaj9EaCOt9N3kg6FHcYCXzN6/XA6L4hb9LPUgufAaPzTzGKAWRylCn/vHk2w9vNfc7jF1qt5eZk1vxCVwvEof3aqZUTdnfbM/YsnwWPnoUQKEHFObzE+hPUDfye68RAl2biQ068iS2rgQ/yVEHPfVVlxcIbaM05flFUHUROYECgA4jemnLkJUQiHEzjTXtck7b4ktoZAHorY+Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfCOfwu+6wRUrd2Gbd/J8aK+8pYnd+D6o6lOvCDBypY=;
 b=qfHkACp/HK6Q8Y5aTEoHf4RrpaIVluIhmw78SC/C6VPSR3T0UK370M6JZ4v02brmVn4SbjVRbpzrSeDEn8dd5xl3LsbOr3P2INy1zMvbQTW9sx3uAslFfSgMR1ObA+cb0P/NH6nUm2CfNrbqk7tdTfPhHjx7xpP2jtcH7tORNCwKOBptOR+HeswSaWZfaoxbei2cl2HybAizROVJd3D7BOeBLTAfuqiHvhBq7xkJKHzV0sGhaGfuglVPixjhJqJc69G2TEokaPdFlIjnUw8YHrasvkig4EEkkwAkWKFUlvCErrSd8ehhmrweQlAlgsPOv7X+NDsbTY8tzXp3HI+vSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM6PR11MB4708.namprd11.prod.outlook.com (2603:10b6:5:28f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:32:54 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:32:54 +0000
Message-ID: <4d22e8ff-1050-4a88-af47-e78c96db1f6e@intel.com>
Date: Tue, 15 Sep 2026 22:32:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/16] fs/resctrl: Add interface to display supported
 and active kernel modes
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>,
	<ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <akpm@linux-foundation.org>,
	<rppt@kernel.org>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<jlayton@kernel.org>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <seanjc@google.com>, <peterz@infradead.org>,
	<chao.gao@intel.com>, <jmattson@google.com>, <naveen@kernel.org>,
	<ricardo.neri-calderon@linux.intel.com>, <tiala@microsoft.com>,
	<chang.seok.bae@intel.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
References: <cover.1787772750.git.babu.moger@amd.com>
 <530d77a64117347dc1a4d2666967df188a3a4757.1787772750.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <530d77a64117347dc1a4d2666967df188a3a4757.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0258.namprd04.prod.outlook.com
 (2603:10b6:303:88::23) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM6PR11MB4708:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da1ee4a-9f6e-4b12-1d50-08df13b3f54d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|3023799007|10067099003|56012099006|4143699003|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info: tMOjp/NxRiQ+tp99jAuZGQz82dHEpf0ZawOIOY5JfkiQyi356MJVh5h1U7rPN2sJGeL+EbGpawjGu7NG/oAVSv5qmoy937fo/dh8Qs6wLyXjC9DemolyjJuC9cSegcSER5G36IRR1Ll4Svu+QQvnxaVw62gJVrkOxIPGnGY4W/lErO5Uvoo1dB5v994Ged5Q+LRcfWPLqTiO/KWlSWFxbe6ELPTMSwMz2v+Bl04HXbjriE8EB8BqN7DtLWdRAmKRwXxRG5mPF58i45gN6RrwAhvpJ76z9THPZtMyjhtkeJKy3rnrxN+l+ZmNl6/XGtTWcErXLdmKKdjdtZT4QaC07dxY3l/QHPKCY9QntzNOtvS7pjIb581Nh2MiTb7pfq/zrsRQGms/7I3+/uCJVSBUKxmEyqXRMYCMvha+Jlo6ntKrZRapSKmx3GVGl2M1Wk/qnBxJH3z0OyeVilCyaPMmFzLxQ1tdlDaa6Yn4Anm8x+Or50Div2s6ExqL6GY5PBhUSaJSNKabFERUXImpZG7psmzTqsHogVpAk51z5qT/2r1tRNCiby/5VJq+yfz+rakff4+xpCPsbhZvHQOtv88dq2IbzIRbni/pZRRTBk91l5kz2C5QoZMaUmNS/WuGkDF86X5zxfjhrTxHyMd4GwYfI5ROKop2LM+rJzoxBiaeni0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTdFT25RR1E5bXRxRGdjUWg3TVRkckNYRmpVZE1PMHEvQURUd1BSZXFvWWRj?=
 =?utf-8?B?QlQ4ZXhPbGVqbTBtaURTcTlPaXRweGJmUVlVRjhFUVJSUWxsQ2ZQakR2YU5q?=
 =?utf-8?B?cm54T3V5d1puRHlTczBOSW8yd1FramsxSWwyTzVZY0lJUEtUZlo0bzhJMjJh?=
 =?utf-8?B?djNWbVRwT2dFUmFSeEdPUVBSckxSUDFkZzlQSE5sZ3FZdm10RnlPcy9sSUxr?=
 =?utf-8?B?RHJKbXZQd3VSb3g0czY2N1FWS3o5eGpEbGxzQTlRMGpJUndKUVJwaDhHRVYx?=
 =?utf-8?B?RllzcU9MbzhUQTB4WHIycEJLMkZLRDJjcStPbC9iR1VCblhGM0YyMWdLbzZa?=
 =?utf-8?B?aDROSHR1bUpoUlhURmh1TDNsc2FOQVVLdkdtUk50VmJlSUJkN1B2YmVnRlMz?=
 =?utf-8?B?MWJsSEg3QTh3L1hYeHU4SnMrMldOYUtadm85eUJPeUowM040QkNHSVlUL0Nt?=
 =?utf-8?B?blR6dVM1WklkdGxDS1Y2bFFsZDZ1V3A2a3JuYk01UU1keDRWRjZmTXNaZTIx?=
 =?utf-8?B?eVlDcEE1WUo2a3hEd0ZxdUl5OFgxeTNIck1vRVVHYXcrTDArZzBPb0pMUGNx?=
 =?utf-8?B?WWlKT0JCQ1JtMHliRWdLTmJhNUtuR2duN2dYNVhudHZtOGdNc2hnMng0TW5I?=
 =?utf-8?B?aEluMDdCd2NWSGx1VVVTVlp4SmNlSXpsK0VTTlZBekp3clVJd0RleXB4NUZq?=
 =?utf-8?B?c2t2UDFEQk1LZ0k2WjhybmRtMHk4QXpKV1cxUDByR0UvWnk3QlV3dGNRczVM?=
 =?utf-8?B?YmU4aDB4VmJmTnlUaUpsdlVYYmlTNGM4cjFUVmdNYVdnZTlqL01XVC9wbGNS?=
 =?utf-8?B?SllrcWlsTm9VMTlXVjFYdEkvSFNBSEFxRlBnMXpUbC9FL20wTXY3Q1dleVl2?=
 =?utf-8?B?bFZjTHJ2MjJwdkpUa0dUM0IraGhCbkl1OEpCWjQ2UTdjYjZqcURJd0wyQmpO?=
 =?utf-8?B?VjhzU0MzVjN5a2haWjVwd1RDZzlSdE9OMDJ4aEZ4clVFajZlUE1Lcy8zMExp?=
 =?utf-8?B?RlkyaUplY3htQVhsMUVickhLTnpzRVhZZG1oMjZobXBiZlh0N0ZEcVhKeW93?=
 =?utf-8?B?em4veVFhd21icy9ZSGR0V1hyVFQxVUxLRjlDR2hVZkUyK0FlakRwU2JuYnBY?=
 =?utf-8?B?dXlkTS9yVStVWE5FSDlDeHVkMUxDRzBCekJYMlRkUlRNOCsyYlR3YzJuTXVm?=
 =?utf-8?B?WDZQNzBCcGNuT3dhOXFNNE4yK21GY2hqaHpGYkFpVW8yMUdJdFY2cVFaMDNN?=
 =?utf-8?B?TUNERFZrTXZNWWE3RDQxa1U5OE4xdERyYzVXeDkvMGhLUWRDUVdJa3ZzRk5W?=
 =?utf-8?B?TmNuZ1BhdXQzNzZhSlN5Z0E3aDBDdzhEczVSSndMdG5ldk9YSCtoTmpiSGpK?=
 =?utf-8?B?VmF6czFlb3RwK1RKMnZpUURuVGRRL01vY2dWZ3JmeU9oUTlTSTVVQlczbU1j?=
 =?utf-8?B?WmtCMFJEa2Z0ZnNVbFVReW9wbWFOUDYraUpocVAyWkwwK3FFOGZzaDZkUWxh?=
 =?utf-8?B?U3M2T2RqbkxkN1BpNFNjOHBoM3FLUkowMDJHZEZLakQvZnRhMnVLRkJjNHp2?=
 =?utf-8?B?S1lER1FFdWIrUHlObGhkN0diblZ3ajRtWjhBdXh1MEpBM3l6VElMd2RFcHpq?=
 =?utf-8?B?RmtQRlJSSnd6QXJqRWhtU0RRQ08zU2dhNHYzbXFzOG5samtJL0hVeGlGZE5r?=
 =?utf-8?B?V3Jvd0FsSzU0RVZuSVEzYkxPWVFpd0h4c0p1WVhlUUVNWll4K09yZzBwTTVF?=
 =?utf-8?B?bFErTW9MU3d0a0g1SVQ3eC9idE9IVDNadDhFRGt4R1ZWVUZMK0s2VmtTWWV2?=
 =?utf-8?B?aVR0TkJJQmtRcEpFMDBFOUp1ZHhQejZoaE96ZW9OSjBUMm4zb0xVVnFOMmFz?=
 =?utf-8?B?Q0loVDVrNW56bFRnSG5MdlFhRkFIV0k5SGIxSjkrZFRWVGhTMmJFTXRNNEFj?=
 =?utf-8?B?R2V1S3lDQ0xmWjJmVEd0VnpFNXIwZHl0SVFiOXlYZURIRVlNRGlkZmxpd0Na?=
 =?utf-8?B?QlgyL3NFd1ptaWFJTUFGQWM1TmVyTEF0UTFVMFpRd2RvNlN6czltTXJGdk1l?=
 =?utf-8?B?TjkvZzJMdVB1dDVNNVpjTmhMZlBvR2RVUCtIdTBxL3d1MFkwNzhOZFhhRU8y?=
 =?utf-8?B?ZW5nKzQ1bUNaQ29qaTYvTmFKcmR0YlVZU1NHalhHQXo2T1NUeW1BVThMYkNH?=
 =?utf-8?B?NmY5SGRmYlBhZFJUcHRCcjVGbld1Z2hlK0lQeXN1WXBvKzZCckFZTStLRGN1?=
 =?utf-8?B?akdiN3ZKOWZhWDRyYWd5Ym44TzhNU2pCekl4WUdSUDBHUHJMR2F5ZmpCSmlx?=
 =?utf-8?B?RnpWK1Fqd2xrTDRtYzJod2FNYm9FbU1TNUQ5cklpNEUvZVFSUWVSMzF4UFdk?=
 =?utf-8?Q?HDXpVQpEcFq9vrQA=3D?=
X-Exchange-RoutingPolicyChecked: HV3tzW/NTPjT0yrNn7gHZD26KdDrqRKwuJEp5Vfd6nQB4brCzguO/f6EdrBWUBJtjaT58Sm4R62lP9/D/QUPZ5QhGmewCM4oCzx5/ck4tubD3Uhy1zkYEYrfwUaKA79xMfqONhcJl/4Grw4JKozMPa+K5l4X3ZBNgjowuJWIAsiGGTCF0W1uMaY42uAralzwH6hL+jkBdFQXS81bqEx48+JJIRBDwciDT+dSbL6dNjldS2CqGatVBo2gQt7IHzDBYsvlX4QwOJpkjK9diNZA1bPqM/5R9YsqSm+99ayHIVAMwG16KgJaPqE/Qlo+12hdZrTJldxgjxO/LV8h7PddWA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da1ee4a-9f6e-4b12-1d50-08df13b3f54d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:32:54.6950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmtVptBOkFHGrPy0pjl62MvPxUQeUW3NyqPU+tlH+k8vioEpuThv+QpcUVAqSsK6Sx4I036f3eTpEKuvRVtZzyWmtg2d51zS0IOh+2ZVYY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4708
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
> ---
>  Documentation/filesystems/resctrl.rst |  29 +++++++
>  fs/resctrl/rdtgroup.c                 | 115 ++++++++++++++++++++++++++
>  2 files changed, 144 insertions(+)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index f3e941404967..c6e8cf828e18 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -528,6 +528,35 @@ conveyed in the error returns from file operations. E.g.
>  	# cat info/last_cmd_status
>  	mask f7 has non-consecutive 1-bits
>  
> +"kernel_mode":
> +	In the top level of the "info" directory, "kernel_mode" reports
> +	supported and active kernel modes available on the system.
> +
> +	Reading the file lists one mode per line. The active mode is wrapped in
> +	square brackets. inherit_user is shown without options.
> +	assign_global_enable_per_cpu is shown as::
> +
> +	  assign_global_enable_per_cpu:ctrl=<assign|inherit>;mon=<assign|inherit>;group=<ctrl>/<mon>/
> +
> +	- inherit_user: inherit allocation and monitoring from the user task.

To make this easier to read, instead of mixing the modes, could you please have text like:
	
	Possible kernel modes are:
	
	<description of inherit_user>

	<description of assign_global_enable_per_cpu>

In addition to being easier to read something like above will also be easier to expand.

> +	- assign_global_enable_per_cpu: kernel mode may use separate
> +	  allocation and/or monitoring associations. ctrl= and mon= show
> +	  whether each is assigned or inherited, and group= identifies the

Earlier is "ctrl=<assign|inherit>;mon=<assign|inherit>" and above is
"ctrl= and mon= show whether each is assigned or inherited". This is rewrites
the same thing in different ways without helping to explain what the parameters
and their values mean.


> +	  associated resource group using <CTRL_MON>/<MON>/ path syntax.

This text is difficult to parse. It switches between "assigned" and "associated"
*in the same sentence* when referring to the same thing. Please use consistent terms
and just be specific about what this actually by avoiding this vague language. 

> +
> +	Only supported modes are listed. On an inactive
> +	assign_global_enable_per_cpu line, ctrl= and mon= show platform
> +	capability defaults rather than the last active assignment, and

I find the text to be very vague. Above could be moved to section dedicated to
the assign_global_enable_per_cpu mode and be made specific. For example,

	When inactive, the parameter values displayed are the default values
	that will be used when no new value is provided during enabling/activation(*) 
	
	(*) pick a term and stick with it

> +	group=// is shown. When the mode is active, ctrl= and mon= report
> +	the current assignment state and group= identifies the associated
> +	resource group.

Last sentence just repeats the paragraph above, no?


> +
> +	Example::
> +
> +	  # cat info/kernel_mode
> +	  [inherit_user]
> +	  assign_global_enable_per_cpu:ctrl=assign;mon=assign;group=//
> +
>  Resource alloc and monitor groups
>  =================================
>  
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 3bb0e3a203ac..992af586a194 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1010,6 +1010,114 @@ static int rdt_last_cmd_status_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +/* Sysfs lines for info/kernel_mode; indexed by enum resctrl_kernel_mode */
> +static const char * const resctrl_mode_str[] = {

This is incredibly close to resctrl's existing rdtgroup_mode_str while being
very high level. Could it be renamed to be more specific to this feature?
For example, resctrl_kmode_str[]?

> +	[RESCTRL_INHERIT_USER]	=			"inherit_user",
> +	[RESCTRL_ASSIGN_GLOBAL_ENABLE_PER_CPU] =	"assign_global_enable_per_cpu"

As mentioned earlier I am starting to think that the "assign" in the name
is not necessary and creates confusion with the "assign" values of its
parameters.

> +};
> +
> +static_assert(ARRAY_SIZE(resctrl_mode_str) == RESCTRL_NUM_KERNEL_MODES);
> +
> +static const char *resctrl_kmode_state_str(enum kmode_state state)
> +{
> +	return state == KMODE_ASSIGN ? "assign" : "inherit";
> +}
> +
> +static void resctrl_kmode_group_path(struct rdtgroup *rdtgrp,
> +				     const char **ctrl, const char **mon)
> +{
> +	*ctrl = "";
> +	*mon = "";
> +
> +	if (!rdtgrp)
> +		return;
> +
> +	if (rdtgrp->type == RDTMON_GROUP) {
> +		*ctrl = rdt_kn_name(rdtgrp->mon.parent->kn);
> +		*mon = rdt_kn_name(rdtgrp->kn);
> +	} else {
> +		*ctrl = rdt_kn_name(rdtgrp->kn);
> +	}
> +}
> +
> +/**
> + * resctrl_kernel_mode_show() - Display supported and active kernel modes
> + * @of: kernfs open file
> + * @seq: output seq_file
> + * @v: unused
> + *
> + * Lists one line per mode set in resctrl_kcfg.caps.kmode_sup. Brackets the
> + * active mode. inherit_user is shown without any options.
> + * assign_global_enable_per_cpu is shown as:
> + *
> + *   assign_global_enable_per_cpu:ctrl=<assign|inherit>;mon=<assign|inherit>;\
> + *					group=<ctrl>/<mon>/
> + *
> + * When assign_global_enable_per_cpu is inactive, ctrl=assign and mon=assign
> + * reflect resctrl_kcfg.caps.ctrl_en and resctrl_kcfg.caps.mon_en, and
> + * group=//. When active, assign state comes from resctrl_kcfg.active.ctrl_mode
> + * and resctrl_kcfg.active.mon_mode.

The code is much easier to read than above summary of it.

> + *
> + * Return: 0 on success, or -ENOENT on error.
> + */
> +static int resctrl_kernel_mode_show(struct kernfs_open_file *of,
> +				    struct seq_file *seq, void *v)
> +{
> +	const char *ctrl_state, *mon_state;
> +	enum resctrl_kernel_mode mode;
> +	struct rdtgroup *rdtgrp;
> +	const char *ctrl, *mon;
> +	bool active;
> +	int ret = 0;
> +
> +	if (!info_kn_lock(of->kn))
> +		return -ENOENT;
> +
> +	for (mode = 0; mode < RESCTRL_NUM_KERNEL_MODES; mode++) {
> +		if (!test_bit(mode, resctrl_kcfg.caps.kmode_sup))
> +			continue;
> +
> +		active = (resctrl_kcfg.active.kmode_cur == mode);
> +
> +		if (mode == RESCTRL_INHERIT_USER) {
> +			seq_printf(seq, active ? "[%s]\n" : "%s\n",
> +				   resctrl_mode_str[mode]);
> +			continue;
> +		}
> +
> +		if (active) {
> +			ctrl_state = resctrl_kmode_state_str(resctrl_kcfg.active.ctrl_mode);
> +			mon_state = resctrl_kmode_state_str(resctrl_kcfg.active.mon_mode);
> +			rdtgrp = resctrl_kcfg.active.k_rdtgrp;
> +			if (WARN_ON(!rdtgrp)) {

Just pr_warn() is sufficient and avoids the discussion about panic_on_warn kernels.

> +				rdt_last_cmd_puts("Invalid kernel mode group\n");
> +				ret = -ENOENT;
> +				goto out_unlock;
> +			}
> +			resctrl_kmode_group_path(rdtgrp, &ctrl, &mon);
> +		} else {
> +			ctrl_state = resctrl_kcfg.caps.ctrl_en ? "assign" : "inherit";

This does not look right. As I understand ctrl_en represents whether the system supports
allocation or not. So above means that if system supports allocation then the allocation
state is "assign" while a system that does *not* support allocation inherits *allocation*
association from user space?

> +			mon_state = resctrl_kcfg.caps.mon_en ? "assign" : "inherit";
> +			ctrl = "";
> +			mon = "";
> +		}
> +
> +		if (active) {

Why are there two separate "if (active)" blocks? 

> +			seq_printf(seq, "[%s:ctrl=%s;mon=%s;group=%s/%s/]\n",

This does not look right. The reason why this version moved to a single global mode
with parameters is to be able to support systems that do not support allocation or
monitoring. Having these separate parameters thus enables resctrl to only show the
"ctrl=" parameter on a system that only supports allocation and only show the
"mon=" parameter on a system that only supports monitoring. Above just keeps showing
both whether system supports allocation/monitoring or not.

> +				   resctrl_mode_str[mode], ctrl_state, mon_state,
> +				   ctrl, mon);
> +		} else {
> +			seq_printf(seq, "%s:ctrl=%s;mon=%s;group=%s/%s/\n",
> +				   resctrl_mode_str[mode], ctrl_state, mon_state,
> +				   ctrl, mon);
> +		}
> +	}
> +
> +out_unlock:
> +	info_kn_unlock(of->kn);
> +	return ret;
> +}
> +
>  void *rdt_kn_parent_priv(struct kernfs_node *kn)
>  {
>  	/*
> @@ -1995,6 +2103,13 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= rdt_last_cmd_status_show,
>  		.fflags		= RFTYPE_TOP_INFO,
>  	},
> +	{
> +		.name		= "kernel_mode",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= resctrl_kernel_mode_show,
> +		.fflags		= RFTYPE_TOP_INFO,
> +	},
>  	{
>  		.name		= "mbm_assign_on_mkdir",
>  		.mode		= 0644,

Reinette
