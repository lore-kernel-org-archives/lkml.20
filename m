Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794252126;
	b=19ERGdELkfGMqZUErDHJ5feboiDuRDwaQEYLqFEeTm8JWIGfRUAEVRRACJv9E/uDfkWG
	 EcFriGl2eXjly/7y9GZJTvweh2ahyiKLnwMv5F6zEj5T4Zuhh9XhNX3GXapOUsJWqWTnb
	 /2n54OyBBjP4k3WyKa6xkbfmqhoHsAJt1SR+lLJEGMyCqFbuKzKVnW7UBIvXtlE34SAuo
	 YbQ1JR2CE+FG8lXTa00JzpbpniVxDq/5HrknKKZ9bmqnjpiRqJNcbQFGxyQTKaWzYHzJl
	 KICiYNDNCfMuytjjdpVSbCc5Fv5sMclkAyacTlQoQn90Bgr85nO3BYkAVZF3mlR7JFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794252126;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
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
	bh=+IKI0Ua7qxYol4S3JM2SyqfxOzGTER4DnYypturjH6E=;
	b=lFUWHiR315akcP4cpz/c8PtdkbaNz11o6hYMl4E307qG9sFSFv5ooM3kxPwdcef0JpPs
	 lCOc6Va3cyTUz5KdWtGGd4mbyUnHU5EupMLnA+jSlmiuWxuT3y+gL0uY2Z4YXq1ZAQRQ/
	 xA1BYAtkacteBgBQB6On/1OqofNoCvfZmxCfOzQM8DyrTM6nxMAUlrTfOAYkDwlyLFYSp
	 kQlyqxTHb2dUoY/6Arbo3Xdp1iHeGaRwQw2l/8EswAohdXxfq5D8CURwQJrmCFa90WfPo
	 xVX1StVp5XREUjExp87TxgTCNfHDF1EDv0641zALhVt/1S1YhrnMs3t//bMkO3tkduA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NUXw2LQC;
	arc=fail smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF616606A31C;
	Mon,  9 Nov 2026 19:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF616606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NUXw2LQC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794252125; x=1825788125;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=wTzoeiRY7qgXCd3QQu9jO3puByIlCr5i9BrqKECwefI=;
  b=NUXw2LQCMx3cVg92zbA9JlyiMHrN+udNh0EJiV8nx6nFO0FLPSu5Np6+
   cKr+veNXPzlL/7HuPyv2OBM6d6ZV54PPu3Qwz0efhCnNhAxaaRi26UyA2
   hI6ojg58J8e8XB58D9Hp316xyp7qzICGOKl8+fiisvAbBiwNrzSGMCPrb
   5DrqJ6osUdAh+11Vxvsw55HU+s6YQCobxR1hlMHIYBSjbxDvrK7+TZHcl
   1kyvIE+BnSZLyyUfO43Y1XqMTshI4v50HMKpQ3g5d9jLkRURq/E8n171X
   0/DGlVyU6NhTR5pdYU9sTK41Tg/CCcXL+mAu05XDjWGU+K+sawZUckeEM
   w==;
X-CSE-ConnectionGUID: oKpO5X0DSXSimqSUyO3U3w==
X-CSE-MsgGUID: gKbup2fWRqOawFlRSh8AvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3013896"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3013896"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:22:03 -0800
X-CSE-ConnectionGUID: WJ5QmmgVT9uqMidkPnzfZA==
X-CSE-MsgGUID: mL1D0ZUjQtGSCFRcrwmV+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8282420"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:22:01 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:21:58 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 11:21:58 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.18) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 11:21:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyoeQWly208N1Y0z2bwKitxbpq2nPb6T6PSoV2+X3PWSORdZzSawverBhfaiBGEoQkhbbSdRN6YKc28FIhGXf7puMsh8NPVWEL4kPaF1paVY86S4UMFtTm46YLbf2u3AJhfgYpxlT2k+WOjrjy31NzW+1cNKoAEnIgdH1eRcZ4pdECJlUEy1/3qop3kOmzwhAEUIseSV5sUw3wUymOwf2UIZ4hhnyp54XfcHOGLmWUMl3gfxgDyS9bfAtop05O8Nf+sE0Xl94gJFLyIr1vnIEhqLPd8jdNQm9n6BvH/bHbcndXNlj40qu1Zf+XnvpfNFgU6W6F8TIcZ01dXjSQYEXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IKI0Ua7qxYol4S3JM2SyqfxOzGTER4DnYypturjH6E=;
 b=hWZyJKFREV19Xj7+2mDLGsF476Dw3Nb9HTtAu+RnAklTxZ9tam4IPCwdhLFWBdL4DViNoq8DAHRp8F0GGANhdxvbB77l1pei5kmB4Y9frd8GdzetENZ+0vPd8JyPeaeGxcGiwGktsD1/Jm0KLAUMIBuPc+UsrEBlZMAehXKwSeC19LtiYbDQGr/1Xj9WuxsNCNuvMi3vi5tHg0Y7dJP2Tl+ZP+VnYeYFnMm2fH93G/0pXN4r4JDdTtxh9x/cF8QzF00wV0DWUUdPu+Y1QEnjxbB/0hd2oaxxUOdyxyTBfsPGI8czK2vlVXPnbsMH93uztHEON91ra+mDg39eUAVOxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by LV2PR11MB185511.namprd11.prod.outlook.com (2603:10b6:408:414::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 19:21:56 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 19:21:56 +0000
Message-ID: <131cd15b-9498-4487-a5ce-ed6a47ef8ddd@intel.com>
Date: Mon, 9 Nov 2026 11:21:53 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] fs/resctrl: Disallow monitor group rename when the
 RMID changes
To: Ben Horgan <ben.horgan@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
	<tony.luck@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<rdunlap@infradead.org>, <zengheng4@huawei.com>, <gshan@redhat.com>,
	<jic23@kernel.org>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
References: <20261105123524.2282090-1-ruanjinjie@huawei.com>
 <7a8d6a15-5a10-4035-b825-4436cba537ee@arm.com>
 <599b7b91-f6c8-4a8e-87a0-c023f3fd58ed@arm.com>
 <6c5d88a9-f86b-4255-82cc-bee70c2d7736@intel.com>
 <113c13ba-e1de-44b1-9a6f-4bd94ecbd71e@arm.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <113c13ba-e1de-44b1-9a6f-4bd94ecbd71e@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0209.namprd04.prod.outlook.com
 (2603:10b6:303:86::34) To IA0PR11MB8379.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|LV2PR11MB185511:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b67784-8435-4281-aafd-08df3e96b823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|921020|56012099006|11063799006|261022105027099003|261021121427099003|261021123027099003|261026121527099003|261028144727099003|261009223027099003|261026140227099003|4143699003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BVz6AzeuF3AQwNdW4JbVpk2wb43sLldmUXeiscEHa4pD642KHYgesk0JUYfx6xYMk1BR+0sWxFVPNhY7ARgo2oW9kGoe0MYxf8kkcD1IIzoDz+cyjiRsW6ThBzGZzTCQlsbSfhV1ffa3MwXBjVRorLkRrxTF8Gjcsup6mH8sFKT3vw7OJZkiFbTyxfi3pG6q/DkzF8rjoQtlEuOkqSaYc3dymakgx4/zkdwID3jr5EPPwJPcgDZQ3t4lzSJl618LcjtVUFU7mIFu8kv44OKFy0laHlOvvIAYrXko7B4pEgssNnZtS4Q+QcAovIASGEmnpuOGlDbOyRp3fOGI8PEHJUtsEm6EeGd3oDMrm0pJ+qF+mJ1S3Apx3fGCIs8pcav2J0UTfEbycaH4IqXoRyxoiBIuHO+eSH1k1V/AeaD0pr6fdS3K7rcpi3ZcQsZgV6YuuGoVpMNa4/EcZ9nXVMXeIf2/KUUYd+ew81cDnxOazPrE23XuEtAhmeH+re1jZlMEq1J9RmnsClVX8eGdsEL/kS+h23GNApZahLgdyvYjvSuYEKS3pMGBuh1BvKZarUJJzjyhsBFogObRkfhoAJn2nPJGe2oXEwv+XE+XqknM7+t8E9slLPl4JIbgy42pdJvWOkgSFVYLdTUOjiax5/8QbYpPFKvIHRkEwF/t6LzJDuk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(921020)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261021123027099003)(261026121527099003)(261028144727099003)(261009223027099003)(261026140227099003)(4143699003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHJtRlcvakdqa3ZkTDQ0czFQUUo0SW9JM0I3ZHg1MDlnanFSSlVwb3o4WW9M?=
 =?utf-8?B?ek11S2haZ3dEeUJQZ1p0ZFp4NmF6QkUvc28rWmhsOGZPbXRJc0dNOU5haHIz?=
 =?utf-8?B?cUZkRTNzN0dsMnhaMEp4ckRwOGRKTkJqVDdTbld3ZzZZQkUvekN6MVRpRXAv?=
 =?utf-8?B?dmFzZjVGdGlxSTlxcExGSnhHZ3UyTStCd0VIaEpkUng2VkZGMXZSSzNmdUox?=
 =?utf-8?B?MU8zTUM3V1pIY25sL1RQQ3ZNdU4wUnh4TVVhTi83NFliSHRtdWphbUM0K2pj?=
 =?utf-8?B?TEFOdmFuRk52SkVHNXJCemF5MzZWUWVYNTR1d0VLSUhUU2dlL1JzV3V0K0NZ?=
 =?utf-8?B?ajEzNms4SERGa1c0NUoydWovZHRSK0RkU0hISG5rQUtSdUxxNldUVzdHS3lY?=
 =?utf-8?B?dTI0ZTJQUkZ0cUFOSDNVaXZXNnF5aVZwUlRTZTZEdFZ6bFZqb0laT3VqaFpX?=
 =?utf-8?B?dTlkVHZtcFQ5RVV2UU1PdTNMQTN2UUVwd1VuWHhtek4vSjBxeS83MWJqc01P?=
 =?utf-8?B?V2JnQWltL24vSjdLd3ZEZVErYU15S2t5UTNwODNUVC9oc1NCd0x0Z1JQSHVl?=
 =?utf-8?B?RDNGcnFqczk2aGMxK3VPcG91eUJmY1cyQjJnM0h6dDZEanVyMXd6MFU3WDFu?=
 =?utf-8?B?SjdNMkN1SnJVSjZVS2Q4U1VtM1pXUHFJTHZBSmZYOHZ5aCtFVW5JS1JDT25M?=
 =?utf-8?B?OEV6d2JDbUZraXdYU3lZWFVHZkdjM2J6SUw1dTEzS010VEpXbEdSSU1ETVBp?=
 =?utf-8?B?UldvTG9kSytZUVp1U3VwNVJsL3JPS0Y4MmNocnllaExWTzBiUGplMXNtOE0w?=
 =?utf-8?B?VFFCOEd2SVd6RWtJMGtWQUVWY3ZERXJVNmQ3dm9jSkFEMnMzbE1ZZ0s3UWRN?=
 =?utf-8?B?YWlKR3Qxb3JjSkxQSDZrTEkxQThDNEV3WFRZV1QrVDdNRmVmWlN4cVlodG1W?=
 =?utf-8?B?SmZpakVyRzNoSm1WRFhEcVh4NmN4R0NSai96VDFYN2o0MmJ0amZ2RitQYVpt?=
 =?utf-8?B?ZDdROW5FSWhFM0hQWGl4N0Y4MHZtc3NTQmR3dmp5VWtBUHR2Q25BOEJlV0Rs?=
 =?utf-8?B?NHB2NkI2OUZ0dzYyeFNDbmptWElSazYybkJpNFZuSG9PTU1XaEs3U0QzUEs4?=
 =?utf-8?B?OWN0QmNyZXhSRnV3aHluVzV5S3dJUWdBc09WYzVUUWdOd1BTbXlrb3RqcDZO?=
 =?utf-8?B?RlJGcjVuUUN2QUI4eC9rS1gySmIrVmFlanNFdjRyRzcxYmkzUHMvanZCQ2tF?=
 =?utf-8?B?dmhGQ3JpWkhQbnVmS2dKSVh2cnNYY2Y1MS9Ha0ZxSy9TV2J2UXBMcDNvNmsy?=
 =?utf-8?B?S3U1Yjk0ZDVLSVNpS1UyUFJ0SUZDd3VLT2RLS1VYUXZyaklaQXc0M3I5aSsw?=
 =?utf-8?B?MVpnazdiUkxSblZ4dzVFNkRhNHJhcStvTHI5L1hld3ZzT1dha1UzWW4xSzNw?=
 =?utf-8?B?S1ltaUs3eTVLL0hGQW1QMXpjckJKbG9KUWtDR2RucXhtM0FFa1F1S09lRXp1?=
 =?utf-8?B?RGVLU01pS2JiN1oyYTVsY1c5akRXTmFHSkp2eWV3Qk1YWjIxdGJZNzZUdjNL?=
 =?utf-8?B?YVVVS2c1SGFmVXVRTGlzRWsxZ0E0Rjc2R1V1ejk2bC9CVGZML3Fmb2NEMXFH?=
 =?utf-8?B?UkRVeDR4WjlsR3VvakFIaXNyNUVtQ0ppWVRObzdCSTZWMnNkMFY4SlZ4MDV5?=
 =?utf-8?B?MlpjeUdJdG55Vy92YVVQa05xSjZwa09uVGYxR2VPdU1EeVpkMW1IM0hzOUM4?=
 =?utf-8?B?UUxISU9WZHZxc3YyaVBCQmZORmM2QVJSQTRZN0hFNnBKWnhRcnN3K2VtM1FF?=
 =?utf-8?B?RVlnVVZxMkQ0QWVQWnFmbzhkRjh2QkEvdDhzcGJYU0ljbUtGV0xBS2x6eG1Q?=
 =?utf-8?B?UCtiTUgwc2V6aWV3OFYxUEJqamVvMkk0RG5qdG1CSnVXREJ2eXVCTDEwQlV5?=
 =?utf-8?B?WXNESEhnSlJMNnQ5VXJkZVVYekJscmNxWTBNYnk3WkZDeDRiZXBuekRqMXBE?=
 =?utf-8?B?NnpCYlNPRWhwWUxvckN1MWZma3JLc2NEVHc2MmRuLzNKL25ncU9TZlJwek1C?=
 =?utf-8?B?aG9ZcUVXRGE5NXZSbmpTRjkrQm1IZDU4ZGFTdmZJZlFBSUxOMEpMR2d6RlRW?=
 =?utf-8?B?UHVNWXpyVXR4cDVxcUpoOVQwR0dVNlIyMGprNnU1ZUlOdW9wOTZ6dmF2VGMv?=
 =?utf-8?B?aTJRTk9pcjBzbExlajRYbE9NSVlsQWZpRHlXcnhOekR6WlNpcmNzVU1jV3Vp?=
 =?utf-8?B?TFIwb1IwR3p1VUh2L3ppMGt3b21DQk9VQ0tkMjQrelQ4WGg3VFVpQjdlQi9H?=
 =?utf-8?B?Y2VmQktyTWRXbXNhVktqUGlmOXVyeUpwOHBqNDU4MXJoSnBZTjdjcmw5aU9X?=
 =?utf-8?Q?3CKAb8Dq68f6EqSk=3D?=
X-Exchange-RoutingPolicyChecked: cggyFxdj/rM1F6VS1GCtZX9utX752aky0eqSjLOPJ6i8b6Ek+qgyoKzXQfoeQudyhjuDmQJmBjOTjT7zwdHz+36iiGDVBoSa/y8L4f+KiWy1ykSMtVAqUB1toanIvgVDHI+mzqAFlimQlRNi9E4SE9voyZ64/kJGz8YM8jrvNQpLadGRHansd1Gip3/PCBA9lWnNb5MVYf2Py582rwrWLbCXZLyhM510vOqB/AU/W5MTURB23qenc7U9f4w5CAU/95F5TQKagMk1bU6Ms5oeE+oDH7+x2/FnL6hzJUjZH1ukHS0zam+WU+DbL8gf7iasBg0Spom6x/Byx1bIX88ypA==
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b67784-8435-4281-aafd-08df3e96b823
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 19:21:56.6791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPWEPnKE6Kj/cyvcMThDzfus+zpe6rFDFtp5AFFdwqHmLjx5yuSfKE9Fm1Uhu5P4l4o8STheBnqHXhXSeficDvkZxG8EPBuhMqqy1SIEx7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB185511
X-OriginatorOrg: intel.com

Hi Ben,

On 11/9/26 9:47 AM, Ben Horgan wrote:
> On 09/11/2026 17:40, Reinette Chatre wrote:
>> On 11/9/26 3:03 AM, Ben Horgan wrote:
>>> On 09/11/2026 10:52, Ben Horgan wrote:
>>>> On 05/11/2026 12:35, Jinjie Ruan wrote:
>>>>> From: Peter Newman <peternewman@google.com>
>>>>>
>>>>> A monitor group can be renamed into the mon_groups directory of another
>>>>> control group to move its tasks to that control group's allocation
>>>>> while keeping their monitoring data. Where the RMID is only meaningful
>>>>> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
>>>>> extends the PARTID, this move does not work. The rename succeeds, but:
>>>>>
>>>>> - The group's monitoring data is reset. Its counters are identified by
>>>>>   the CLOSID and RMID together, so after the move the group reads the
>>>>>   counters of the new CLOSID instead of the ones its tasks used.
>>>>>
>>>>> - The tasks are not moved. mongrp_reparent() sets the new parent and
>>>>>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>>>>>   to update, and the search then matches on the new CLOSID, which none
>>>>>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>>>>>   control group's allocation, and the group does not count them.
>>>>>
>>>>> The move has never worked on these systems, so rejecting it does not
>>>>> take away behavior that an existing user can rely on.
>>>>>
>>>>> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
>>>>> group, and document the restriction in resctrl.rst. Where the RMID does
>>>>> not depend on the CLOSID, such as on x86, the move keeps the same index
>>>>> and is still allowed.
>>>>>
>>>>> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
>>>>> Signed-off-by: Peter Newman <peternewman@google.com>
>>>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>>>> Cc: <stable@vger.kernel.org> # 7.1.x
>>>>> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
>>>>> Link: https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/
>>>>> ---
>>>>> v2:
>>>>> - Drop the Suggested-by tag.
>>>>> - Describe the systems by whether the RMID depends on the CLOSID rather
>>>>>   than by MPAM, in both the changelog and resctrl.rst.
>>>>> - Explain that moving a monitor group is already broken on these systems
>>>>>   because the tasks are not moved, so no existing user relies on it.
>>>>> - v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
>>>>> ---
>>>>>  Documentation/filesystems/resctrl.rst |  7 ++++---
>>>>>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>>>>>  2 files changed, 17 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>>>> index b52795e03303..9ae34aace0ff 100644
>>>>> --- a/Documentation/filesystems/resctrl.rst
>>>>> +++ b/Documentation/filesystems/resctrl.rst
>>>>> @@ -552,9 +552,10 @@ will automatically remove all MON groups below it.
>>>>>  Moving MON group directories to a new parent CTRL_MON group is supported
>>>>>  for the purpose of changing the resource allocations of a MON group
>>>>>  without impacting its monitoring data or assigned tasks. This operation
>>>>> -is not allowed for MON groups which monitor CPUs. No other move
>>>>> -operation is currently allowed other than simply renaming a CTRL_MON or
>>>>> -MON group.
>>>>> +is not allowed for MON groups which monitor CPUs, and fails with
>>>>> +-EOPNOTSUPP on systems where the RMID depends on the CLOSID. No other
>>>>> +move operation is currently allowed other than simply renaming a
>>>>> +CTRL_MON or MON group.
>>>>
>>>> A user may not readily know whether RMID depends on CLOSID. To document
>>>> this properly we need something specific we can point the user too.
>>>> Perhaps this can be a file in the info directory specifying whether the
>>>> move is possible or not, info/moveable_mon_group, as we discussed in v1.
>>>> I suggest a precursor patch adding this file, followed by this patch
>>>> which can then refer to the file.
>>>
>>> On the other hand, that does add an extra dependency for any backporting
>>> of this fix.
>> Does this fix really depend on a new user interface? 
>>
>> I understand this is helpful to user space and this can be added, but I do
>> not see how this fix requires it.
> 
> Not strictly, no. Up to a point the documentation does but we could go
> back to the documentation in v1 which mentions MPAM for the fix and
> then, as a new feature, add the new interface on top of that. The
> documentation can then be updated to mention the new interface only at
> the time the new interface is added.
Existing documentation makes a promise that monitoring data is not
impacted by a move. The fix could start by just updating that
snippet to match how other failures are handled. To keep things together
I'll combine a suggestion in this regard with my other feedback in response
to the patch self.

Reinette



