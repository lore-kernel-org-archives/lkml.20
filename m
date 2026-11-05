Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793894300;
	b=2KI4iFxlBFjgJ8XzGiRlHO3Txpw/4mnr1al3P9k/JE38CSufKHXEv9Ka6TpBP7aK0DNj
	 k1+jdeTRVg2EarYAxYMAILsFOodPrvIok7Q3tMWitICiZLre+kqa4xfNryj9LGR1SkuCX
	 OuleN+gprXelL8wMsZxMIhglIFk9jJHmJSqesn3IyuMp+DAhngJYDN6zDN2xoNt4e0Mm/
	 MC4b7cPyuDEOdiWxtLgdLMndPgqOfNsoCC+JTMZVimgCh9bIRlcHAlpQj5ws5kf/NqW+f
	 Ki9Y8NYX8HcQn8UvKK2TPG7TEWEhvdoLSVz/winqJqI89/S3JXbd2ZYCYbw/hYm6AYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894300;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
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
	bh=ajNNayl1v/g+p2pUpnN1Ukj3TRjlYwrUo/TbZ2/CxSs=;
	b=XVRCzGQGxEF6obYA2O4c6x4GXS19vS9Tjb5V+kU1LDGHrnt/C1XyQci0uXrDaBquxxzU
	 //iwd0n/14iJLt7KtBdvwdtD2IarfQdQJH/3xEe7uSPeuHorIdPLzKjb82aEYTjBmdbal
	 HBDn6tBQHZA6OYLAvUYQWB7Vlg4KXGF4BwpWC91VB+NPmvb5uEcdgxu3V0P+p18CX1mB8
	 wEP7FHtAAZr8ubdz0upZhiMn4Vcd+IRrYD3oWga80PY+I+nXumFzv0tFDwpaNsv5SXVet
	 yr5SQ48YZGvjFLfLYbikT3392ve27ZGDcWi44QkDdy2tHChqjNpASb4biAefsyRD9Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iIa7+mrb;
	arc=fail smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9048606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9048606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iIa7+mrb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793894298; x=1825430298;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=5prN0yeLfl6Y9mXwn505ytKgrfwysZjrMGOR0bSKx1A=;
  b=iIa7+mrbnppQcN25LWU1FHcyu5pCXwlRu6U695wUCjU10p9x6k1g1+RF
   OdmxSJYzXo//+dvUVUsSU1gS+frqgQ2IKpjqFNE6TffduU04F7764xj7x
   5+GdAFTLwJ/m8MTCOv5EItsYgFBAuJaoQNej8vOLOlSkfj3emm2P5Ncwf
   rBPiUQWnuMt0bGz7K6FOr1wYroAd252CLdxqmnw6f9KAyAsHRrbcNx/Y9
   oS8XvyZG3E0jFUAmvEWzWibjDiCmDflqPgxPUzRcUBXPDmkxVtvQ7X93c
   Ms1bL65qZOG1J10NQB/+AucEADAV7+S0Cxu7U06LGxpC2z9utMbAmd3/H
   Q==;
X-CSE-ConnectionGUID: EfYrrfILSBCm8cW3kjU98A==
X-CSE-MsgGUID: K5sQIqAsRSmwi8oG0PpMUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2712379"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2712379"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 07:58:17 -0800
X-CSE-ConnectionGUID: CRDTTZ8kSpa8ANUTAl71zw==
X-CSE-MsgGUID: BPY+esm5RcuG933KS3kztw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7357865"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 07:58:17 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 07:58:16 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 07:58:16 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 07:58:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFF0sVx1YZRW8Dgqjwt0bfJqxU2l5yY2UN1U5iqnB06AcZMhZtxgd0BT16YS9C9w1FBAjrXj96WQptH5iWcrFVjUlA4QCJPbpjb7EDD45aQA7ieOVTrtBK5aYWi4PoMDWpSztat3QbqO0gkG1BBJ8kKzwU02p4r5AGaFL3JJw0PNVq4jdMobBSaKfPYZmk8p1FPIPswgvFulbIjEeQogDYPR6tfz1gNSjisjEfcKfrgCM3qyZRzHul3rK1Ma4p+JM0oWMrWfvQbp3YAwdg2fOqqTtGKi+wrDcfauxNf5WlZ48JmgBsErNNEK+AFGfBHhFfZPQHxUsisr1B37dVDHmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajNNayl1v/g+p2pUpnN1Ukj3TRjlYwrUo/TbZ2/CxSs=;
 b=SCiqNSdIZriPfAquT8vphIiQfyGlKA0/wcOKvI8cf8NNCYYnEodxS7+FskINHUxY1TKM5TKM6hyU81hlrmFk6Nk1lBJjijbfHar4aGs9wgcwXAV5HTpD4JHuEVUloqFL0n9UTSzYEid/TxyEB3U89UyE6k5GH5vRQxUDSJMuOIocWi/TcpRgyATiORr/Sy9LuCFwUbwEEyiInyCQgegntjJIcP1Bmf7jJP7AZWeH5iGI3BOf/xCl2rvmdXk06sG1qCXkbWGZq6kIQZ7X3gkNTQsXm44Cc6sOjxAj/CcR6cR8JMV+tuByNyW5HM/cD0WLDGpKvzLszJaNjDXG51u7Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by IA3PR11MB9349.namprd11.prod.outlook.com (2603:10b6:208:571::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 15:58:08 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 15:58:08 +0000
Message-ID: <0a2b0685-ed32-4e7a-b724-1b5be075ca19@intel.com>
Date: Thu, 5 Nov 2026 07:58:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Report why a schemata write failed
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<tglx@kernel.org>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261104102304.703535-1-ruanjinjie@huawei.com>
 <0bece210-cd99-4f4c-83cc-c58b59b7ebec@intel.com>
 <5e6fc827-d5ca-4e72-ab8b-3ad63d530c19@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <5e6fc827-d5ca-4e72-ab8b-3ad63d530c19@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:303:2b::7) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|IA3PR11MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d1327f5-9caf-4afc-7e48-08df3b55958c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|6133799003|10067099003|3023799007|4143699003|56012099006|11063799006|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261102123227099003|261021121427099003|261009223027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: aMnlTdX4F/IPXtkAkBOUbvHDmiBSR34tVEoRRGX1yykQ5+X+8/l93ChqrXYbL3J395UvPMXF1iR7TtFnCHMuVI9QDdbm91Nsm/GjMFqDt2CL72I4v72gJnv0B2cp1WfMqbNA9F/bqj1S1Fu5p7AXmg+8kG5AyvYs4aTMGFb/xpFNf2KO6geHMYa8x3Y/YFdh0ZNdODVOY2c+tJNXPkBObTk2yBo6tHmnP7zAHItpos0gbhnwb/eX9/FQZYoCiI+v8y0HqQF6EtwblCU82De4dkxiJbN558yXg9+2+CzhepiHSZR0//6fDNQnFnRoNDjJWfnLKhqfROUPODK1mGPD6398eVhxtXjLF/2cN+QYgaSLMbqwy/hvv4QzGcgRmep9R6Pp6Qc8FVX/9CgOZrC38t2XnTQtwpER4SdwsPGUULn2ex05WWLDuShO78gtWkPguV826ezzE5/9GHxGcfBTjttjkE8ZIJfsHu885mNK18xoIK55EQwB5W3ABcvW9DIGDe10KviQoVrAFf0xmUswKypTz92Bi5MxTwVvgEhcCb2cI2aah9K77z2t9eli28QAe3KOm2NaUWzj8g7n5VcHHVcTiUTxwlmBpjdYGm3Euatdqk72NxvM5eYmrlR/TsVqwtklp8i77ubuXxw7QBvHqbijMJQEl2WmTG2/kyrl7Tw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261102123227099003)(261021121427099003)(261009223027099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWtIT1hjZldLbk9ISHR0azc3dEVXK3p2YnNWNC9zZkM3TWxNK0ZQMHZpMWw0?=
 =?utf-8?B?VFVHSVo3NG9KdUQzdkc3Ymc0NkpFVHZxejZRcG5IYm0xSzRPUlRhL1ZOV0RM?=
 =?utf-8?B?NkRGMnJybE43WUZyZkJyVkFuSGtqUFp3Zk1VeUYxWGh4VG1BYkdJc2FGR2xo?=
 =?utf-8?B?Y3BKdHdFUGpEeTJDK1I4T09XS0xoOHVrSDl0aEkxSFVkYWZCSWNiK2FlOUJF?=
 =?utf-8?B?VHl1dEhabWVISml4VkRMSCt0RUxoWGNuYTBBaTljbzJLYVcwL21UQm1iWnRS?=
 =?utf-8?B?S1grOTBNTFlxT1FiZURQdzFhU21KdWptVGF0WEcwSE5DUFU0V0pSTFRDd1Er?=
 =?utf-8?B?SzFTNWorRlkzM1IwQUxhV3h0NFBJeEtYRm03OEVsTzdvSTFmdTNJcFFqL0pT?=
 =?utf-8?B?U0lXRFQ5TlRQZzFoMDlQcVB1amtJcW1ESzZBYTFzRDJKbTJYTzNkVXhkRXR2?=
 =?utf-8?B?OU1kM2hWT2xGUlYzNzFwaUJyT3BwZ2ZnUmEvVk5Ham54bUxnUlY2ME9mV3BW?=
 =?utf-8?B?WVNRRm9iVWhTOGZzRVo2TGk2LzREVmpNbm1LRytzNDNVbFYrbHJtcXBvakcv?=
 =?utf-8?B?ejRUT3pxY21wYk5DU0RIeUZQbktzTE5qcWo0ZVdSUlJyZVlIMmcxaFk4VGY1?=
 =?utf-8?B?U2dqR0h2MXRONDNDZFVvVkk3bzlWMlZYSWZIc2lMSDVXSUVRbHE3UTRJMm5K?=
 =?utf-8?B?cnE3UVU2Qi9ZOXppa1ArdlhrdXFtdlZWaXJyekx6N25kajdnRHB1K253U1Rh?=
 =?utf-8?B?TmZSWFdWTTloV1lYbGJsUkMxOEd6MjBkR1BsdVZ0RjJGWjRrOUJDaGlWYzFn?=
 =?utf-8?B?TDB1UUVUeVRWRmY0VGpWTzVubGp5MWRkLzZqdlVJZUZkK1NiU2dxdmhCLzN2?=
 =?utf-8?B?cE5pUGtnV1VDZ3oyNFdtdkp4bVJPdk5SMlBFYU5LWUpMZFRnNkhtR2piYUFp?=
 =?utf-8?B?UGNFTzRrY3QrcTdMWFd4bWNNaDhNSkFqdnQ3NHZOSGdjTlUwWVRWeUw1Yk9x?=
 =?utf-8?B?SkZkSENGc2xONWdLVDBoVm43aWpOS3lrT3prRzZnOGtsQm5ETnppUDN5Yytl?=
 =?utf-8?B?YU9iN0c0Skd6TGVQODczZ05YR01DSVl3dmp0SWJ5TlpHeEtQUlRIWXFpTzUr?=
 =?utf-8?B?ZWdXWDFObzBZcTYyejNoK05tSXlZOTUyNW40enNMRGFwWlRtb04vT1dLU1ds?=
 =?utf-8?B?UGg4L1JKMWtVS3FlVXlYQXUrcnpta3cwQkV0Y2FxMVExNHFhOFZ0RjNvNDlj?=
 =?utf-8?B?Rm1SNjJhUFN1MVZSUmxjejM0VmhMekxreUx0T0dQWkhmRG42akRSbk1XcEFo?=
 =?utf-8?B?eFQxUjBpUUV2QTZ4a1NVVldNcE8zT2JvcjVkMnNJZjZRdVIxYklEcFRONEZM?=
 =?utf-8?B?M2dZRHZ2OXg1NUxRbFN6eGoxeGZkTisveGFOeXdGUDhsRng0SFloUThnckYz?=
 =?utf-8?B?VEFyc1Z1cWswZ2dSeTNUVXYxRDNQRmR3VlJsaXNCY3BsNitaa1Fnczh0b2tq?=
 =?utf-8?B?S0NTNUpzNkRMZGE5bTZMY1FEY3Z4ZVJlY0pVaWE1bDN0SHBqL0ljcUlueXFD?=
 =?utf-8?B?bUtkNVRUSDIvMHQ4b3pVODFwV3MramlRWVhCbXpGS01sdTkyd3RTRnZiNUVU?=
 =?utf-8?B?L0t6RlNtNjh0eFdDNXV5TUtpOEpLTGY3V0d3QmNjaUVXVnZ6QlBxQ3VQOE02?=
 =?utf-8?B?SVBNRjM2M3Y0S0dOYkhoRU9Lalk3M3dYNmdiOEd0NzdqOUU1QzZ5QXhoRGND?=
 =?utf-8?B?ckhMQ0t0SmFWMENZVTdocHN6UG10K1JFZFdXSE81U2VRSEhCQ3pzay9TU2dJ?=
 =?utf-8?B?dU1maWNnTXc5M3dxMnJ0c0laRWFDNTM3MmNZZzdJeEh1RE9HRXpHNmUrVWkz?=
 =?utf-8?B?MkYvcXRNdEdsRTBFUEx2ZUxJS0tSa2MzRm5YeTIzaGZDSXkraGwxcmpZaGt4?=
 =?utf-8?B?Z0hZU1dWTFIxOUdod2pPS3dnZTcxTmFtVUhBd3BqUjFYdUxBdllCSzl0RC93?=
 =?utf-8?B?dE9xL1JWTkR6SzVaVUJUNC9XK0czMGJ5T081MFFudHF0Qnd2ZnlGQXM3aHZM?=
 =?utf-8?B?VHE1RHFkZFdOalA3OWs4TW1kaUlxT1RMaVBPd1lGNTk2L04yb1hDdk90cGMz?=
 =?utf-8?B?SGYzTlNhdzh3b1hjbC9PTTNGaTBSWEFrbE5xc1BjMWxxcTJZK1d0SXJobWEz?=
 =?utf-8?B?Nnl0Y3dxczBwekRvWmtURkxyb2VyMnlEd0ljVnZhb2RpWkRvU3B6c1RpUGRz?=
 =?utf-8?B?M3p6NEs5cnhyUVdIWUdWQXFGb20rOWtWcDlqV0dOanJWMUZVQlYzamx3dXFO?=
 =?utf-8?B?NUgyYmlTTnJPWUZCK3ZjTUNoM2hNSGpucUZoY3pDU3dOTGhFRDVSQ2tIcjFh?=
 =?utf-8?Q?0uprjI5LAI4E0ZOc=3D?=
X-Exchange-RoutingPolicyChecked: OnxVl1gCcqpJHbGv7kVJ1VlJSIgfOLhh/aGU3UQaMBaYdSHUg83Ihp+geDDaG+c5cfuTFm2r7sAgaBdAGMCEvt5z8pDMlvgWFJ8xrVWfAWqXv8xTJDegaHwaCwj8rXM3eKxbf3X5NdL/JAL/VV1n9/WbhcdX/34lhRH9jYRQOY7uk3Z1UoS1S4j9fR/LClDgPEZvQbaz1ImEUIGuCv56FDrERn7ZNg81uQPWCeESYmiwhBZ99MQOiS5Kz0Uvphk47i0/+GK9zdIpLew3KWpPaMQj6S/VAKTbUWyoy2VG1/qEr9mHHSmxz5p881ub/RAE4ublEjLvg/tgNtlv8UxGzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d1327f5-9caf-4afc-7e48-08df3b55958c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 15:58:08.1144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p5PE27kfempAMccPjXDM/dWu3fWI21+cSwN5x4o7QA+2Tyhknc176Dz9YrXuWWB4x2PmmZj+deFoOd6oDNTMCYD2BZTnPgWiu6EJaCEb924=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9349
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/5/26 12:32 AM, Jinjie Ruan wrote:
> 在 2026/11/5 3:18, Reinette Chatre 写道:
>> On 11/4/26 2:23 AM, Jinjie Ruan wrote:
...

>>> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
>>> index cafebdff70dc..cfb59cbc4135 100644
>>> --- a/fs/resctrl/ctrlmondata.c
>>> +++ b/fs/resctrl/ctrlmondata.c
>>> @@ -367,8 +367,11 @@ ssize_t rdtgroup_schemata_write(struct kernfs_open_file *of,
>>>  			continue;
>>>  
>>>  		ret = resctrl_arch_update_domains(r, rdtgrp->closid);
>>> -		if (ret)
>>> +		if (ret) {
>>> +			rdt_last_cmd_printf("%s: failed to update the domains: %pe\n",
>>> +					    r->name, ERR_PTR(ret));
>>
>> Please instead display the schema name (s->name) to user space as that is the name
>> that the user use to interact with the schemata file. 
>> Is it necessary to print error code again? This is the same error returned to
>> user space, no?
>>
>> I do not know what resctrl fs can claim here about hardware state - could such
>> a write then partially succeed on MPAM side? If so, best fs can display may be
>> something like "failed to update all domains". If so, could user space follow this
>> with a read of schemata file to see which domains failed? User may want to retry
>> in such scenario ... but back to earlier question, this sounds like a permanent
>> failure (until CPUs are back online) when attempting to make domain configuration
>> changes that does not sound right here.
> 
> There are some cases not permanent:
> 
> - PCC/MPAM-Fb MSC returns -EIO in case of protocol errors or timeouts
> （mpam_fb_send_request() or smp_call_on_cpu()）;
> 
> - -EINVAL when the calculated PARTID is out of bounds
> (resctrl_arch_update_one()).
> 
> Both will roll back and retry after the cause is resolved will succeed.

Could you please provide more detail about the above "roll back and retry"? 

I am trying to view this from user space side. The "PARTID is out of bounds"
sounds like a bug in the "should never happen" category. I am not familiar
with everything that can fall into the "protocol errors or timeouts"  bucket.
Would it be worthwhile for user to try again when these are encountered?
Could "-EBUSY" be more appropriate to help user know when it is worthwhile
to retry? If it is not possible to retry, does that mean a permanent failure
for which the domain should rather be removed to prevent user from encountering
the same issue over and over? 

> 
> I verified these error cases using fault inject for mpam_touch_msc().
> 
Thank you very much for all this testing.

Reinette

