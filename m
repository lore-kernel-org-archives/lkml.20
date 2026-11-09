Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794221797;
	b=YSJ6RWiN78ENrmZ43C6BSUnLJSyA/eLHMfxWR6HtrCFmDaBjN5+ff2n4Jzv6RIbVSISk
	 vhVPSwuiMmkahq8Bpu+Fv4WmT1200dYN90YQrsCGGyMFfR/s285hOvXWbHZyhhJtsBrg7
	 7or7Oq2OngytvfEAi0TRgIDuNFvb+o7f2uTsaNBSoUQvhSKKCjNCj6TGAVHlkaJ939AsV
	 EggSgHxQu1H3lYC+PiM38gRAO6X/uOGBPgVJH5QddJGlRhZhVLMxs58k0lGsRVmBqgv3Y
	 G3/8owW7CxNSz0OROQrCmRQgEmzRmD+V4AwJ4Vkd6mX+RkasHNm06/pPAOk69jDyQbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221797;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=hLjh2ebqVRecYq4ErdEQJ/8VN9902OXgFX9pKINPgG4=;
	b=FziFe1u1uIuA0yYbY+nesl5PNFEj4nX/L3IGJVetL9Udomzq2GNOAl6oS5NMOhScBNqG
	 On0l/rOLCUg59QpWZSy6GQAH1naL4zVGwKDYxPuzUyiC63dOTDzG61F6uO2e4lXCHbDn5
	 9MRc4V+qaYrJ4beJpqaFEf6ciBU/ikKsLIo05K3bSHzW2jGgN9CuvgkIwiyn8j2UwmZKr
	 3MAtx60NkZUzWGrqyzU1v+gsBQ4JiHrIg3qy4Gx3FIrwdhQiG0cQZMaGIY650WxjFn3Gj
	 Am7CW5VZ8xdXhkFypnOyyeJH0UqWJBoC5MDdQ9eyVjzxMQp19rxdCLKzP091dwacggg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H3+jG8rD;
	arc=fail smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB383606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB383606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H3+jG8rD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794221796; x=1825757796;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6VBrqZQpBQIXXvy3A/LPC7a0K2IqQpWQF65E3C6VhnQ=;
  b=H3+jG8rD10s58lSv8/ZIKyRmNc/eUadwFUCoMfYAwDI1nDAFos1MyuPY
   n3MGIsXTiqu/0mJ4+xyON1H1GvoN0r5lq5XPS5XVVA+49ovN+y485/Xvo
   Nvkc5rRs6mEK0y+PAzTtAP/f17anaa+yHlaR07ORQ7dOg01cCkmwYeEcW
   Ck/txmhpEa1ksCZRlNxNaGBFKBeKayb9ijU9iqMA86pTj51aaIwhOSAw2
   KwoRRTH2Bzz2hFB2OLwuhcwWYvdknYGgOjHMF1psBt/bLAr8dPf5T9mIb
   iI5zo0AgY2f5S+O69raj7weGkqSisI+EuFYjQP0dcLnvEvwGbxZtR2TGQ
   Q==;
X-CSE-ConnectionGUID: KY1dN7aqS3iLQZu/80Qyng==
X-CSE-MsgGUID: J/u7gcO4R6a5bhrQien9Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3041201"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3041201"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 02:56:34 -0800
X-CSE-ConnectionGUID: WjVLyzxjTCK45oof/cLhrA==
X-CSE-MsgGUID: t8IFhQY3SO21ZKQzG1OO+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7965064"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 02:56:33 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 02:56:33 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 02:56:33 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 02:56:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRTDbiqSC8sF1oVwksSD+KVKU6Tn7BhEhaKpHC/zUJhyLSEnD46MnqWZDh3yKPUgEghUKgg3UKjaWsT8b8hudqYpUUNV/bmK1MFYvWHNcWzzyxOLLJP4vTGoaQKc3CtWAtttxFJFEoHcvC3sqsMgRj9yPLu95U/o/beijsDALIf4bm6JpMTuc0rlBUlVqxmKDo/YaKlYKWO8socM29qjniEC61X0Hx1BHuvO+pISWXVtBCnh5oZcKPrXAwanAgNmSf7i/B9avAGuKZzEOrjFpViiSV+n1zvjk3FmLLNVMAY80FE2Vsx9e+cUln/LJPyPFgKTgLL+q1Csv1RDCQ60eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLjh2ebqVRecYq4ErdEQJ/8VN9902OXgFX9pKINPgG4=;
 b=fEYj7X0tVf45VzHCalQUah41sINPECtva1a8rAKv24w9xXdkrI13t/5/xGj2r+5PdhvnvHsWIoUi0HI5kubDxUCH3zKT7X1PQ1nEetIy4WOVXCIBd5oRnFRtq15UzwNqE64J7p36yk+bmhD+Tk0zFrSHg+cFySYdN8ES9tbRNizSTMrnM3iwFfU5EVHjOL3saY8HN4R/l5qIOKnGpVr0wjQI0IJ9KAdXcH7lgmvxJ6Z6pSlm2+1EQzFn1rK1xlnTht69OGXrEha7UimbV+CGbg+Fq3e2bwgcwhsAnk1DoSXmw/zOtY51miwdhYV2Ga05LaLoUumBxP2eIseLQ/ptVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA3PR11MB808482.namprd11.prod.outlook.com (2603:10b6:806:531::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 10:56:30 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 10:56:30 +0000
Message-ID: <d52e1070-be5d-4367-b9d2-d79bbe9a4c8e@intel.com>
Date: Mon, 9 Nov 2026 12:56:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Re-raise irq_work lost during Xen suspend
To: Julian Vetter <julian@outer-limits.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Juergen
 Gross" <jgross@suse.com>, Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra
	<peterz@infradead.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Mathieu Desnoyers
	<mathieu.desnoyers@efficios.com>, Jiayuan Chen <jiayuan.chen@linux.dev>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, "Vineeth Pillai (Google)"
	<vineeth@bitbyteword.org>
References: <1793977074.8631fc262581453bbf619ec5b2062170.1a1b15dc430000403d@vates.tech>
 <20261106153647.F7ld02De@linutronix.de>
 <1fb98f79-183c-4144-aaac-45a437ff2d32@outer-limits.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <1fb98f79-183c-4144-aaac-45a437ff2d32@outer-limits.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2P250CA0025.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::30) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
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
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA3PR11MB808482:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ec45d8-34a3-4bc1-697e-08df3e501be9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|10067099003|5023799004|11063799006|4143699003|56012099006|261021121427099003|261022105027099003|261009223027099003|261026140227099003|261028144727099003|261026121527099003|261102123227099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: UKS6TwpZ6dC/Qh4uA8kCBF4hN5JWHQ+OXbulc6rJYje1EsPHGG945GhPUzIFcBx5QXF3Pr7H3wbFyiltLf1G+rtGofEFNdh5j5LMbfkguH5+++c1HVfAFUy2f+lvBcnFQPUGja/+WU8/uqQWtErV2AGkiQMZuZ8ISGrh7JwpfNlBXBYgd53kva2WzKrjjfZ3WIgnNBCRVfCzfuJCuzWoZlxG/4SzD5mG1RPxXBgKBVYLjyPLVDHk9E0OT5T6ejYvYCn6p0M4ybvAug4OfeQJx+i6Vo1Zia6ApAHQDmxEZHj2BbCdlm8dTExw9ln4EJ90RAV6O3ODMFWe4vLDTdNhvae/74l+pwWdVaiVTM789bucSqBbmHehQ2+JBuIW/u9rh/DiShWiFQqmitLWwAZeD0mha0nNvRJ8lLUXKQynxOqzUthLNd/Qcl4uFbtI6ezjzLG/aP+aFw7Gt+hVXX/n7ZU/zS2mwxmpLT6myw2g2rvLHE74buAXLv+HNtVbfPCGJITmaYsc8KE+aMjb5nYjzuuZlUY6PJEndy11Wft8nUlRLdDK3o6w27G/CPN1JSXcdHsAuONLDYpaEU8MBoZ4zQ57myKaNnqi4Jxia0tdsAAfG49iZ/DrKPoEZUXjE+n+p71pN+phP7nNo4NYQ9NYy0rbhjvd5er7FVDxEjlhTHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261026140227099003)(261028144727099003)(261026121527099003)(261102123227099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVBteHdrd1BoRTkwN2szaXBxaXJmQnN0WlUvL0k5bFl0OWJ2MnVvSHcySDFD?=
 =?utf-8?B?Q0hINmQwL0F0OHdxSDIrWkdRaEdHamFaTDlSazd4anBndTF4clozYUQ3MjBr?=
 =?utf-8?B?V0dMT3A5Mk5uaUwyOU5lTFVQZ3FpZXp1NThvVFhZeGJVeGpabUxxcmtBaUFG?=
 =?utf-8?B?TFZjTDduQ09LZ0NOWVR0LzFoUVYwdno4NVlJYXRHNXl1SmVpMXZ1WDcxcGdm?=
 =?utf-8?B?OFdKZmxtVTlmY01rT1MyZWJLVjUyMkFHQ0xIbEtOeVlmRkQzRkhGWWRuSWtM?=
 =?utf-8?B?NVJNczA2cWdONXhSMXE0UUhHYUlUdGtiN0E3cTNaRUM4ZUZoTVAwSzg1VGdH?=
 =?utf-8?B?S3ZoNDYrSEUyOXRlLzRhbGhwQk9WM0JnRmJGaHhFcnRUVHdYUGZwMnNka0VR?=
 =?utf-8?B?ZEtvaUNCUlpJWG5jVUpqeUx6K3Q0Z1dMdXY5T1lmK2FzMnQva2w2TEZ0Yld4?=
 =?utf-8?B?cnVoOWdZVHVRR3VBMXM3UHZCdDZsRUJTazVHUFJuNm12VGN1UjlpVlBxQ1hK?=
 =?utf-8?B?VDhCSkVIbkErV29SQTVjVlBudnJoenZaL0xaTFlrODFyZEZqVlhkb1ovZWJI?=
 =?utf-8?B?dDcrY2t4SXpwYmhBNVhrU3gzMER4RTdwRFFaZC9UZHZMQ2xUcWxlTWVRSW91?=
 =?utf-8?B?SEJVbVJVNSs4d2dpamwyem1ldUNUMmEzMUpSb0FPK1RsV1UyWkF5T3prOHJB?=
 =?utf-8?B?RHE3Rlpxd1o0YWJNeExIZW0rUkUyWkNBTDRKUUtBODRTdEdWY2VHcE1FeTNZ?=
 =?utf-8?B?NkZ6WXVWbGxsZ2NRQ3VNT3dCNWpONWxVNDdwUEswU1FIN0wvdGV1MnQwY3lk?=
 =?utf-8?B?N2NLblBpL3dzVkwwMWNkYjhYYTNJTVIrN1NBZVpRS0JaT0wrZmdaczVReVdK?=
 =?utf-8?B?OXhvYVRCUmM2WS9yQTVBUElrblNZUkpZZ0dSZjZJZ1JUVHJHcUFYdlNFK1A4?=
 =?utf-8?B?ZnhKM3FXbVZiVTd3Qm5nRm9rK3F6akxydHJ2WVhMNVBSUUs2VGpLMmF1VXlK?=
 =?utf-8?B?WHRzSlNESHlhczUrSHM5djB0UzltcUJ2blZidlFZL2twNDB3Y0pHckVVbnhC?=
 =?utf-8?B?Mm5HcC9QM0REcTdSYVlBNVZhZjNjQWZQdXdKRmVFdFRYdnk3c3lyV0lDU3RI?=
 =?utf-8?B?V1huTEV1THVaWnFoOE1KcklFSEJ6YnIydXB5YWtINXhNS2dDbXZSeUNCUCs3?=
 =?utf-8?B?cmpxK3B2eGNEaE0xTFNjWVlGdGtmbkVrTGJjdmkvNkxmQlNYcVRyUHNBcVRO?=
 =?utf-8?B?KytFRXFyUzAxd0hXR2RXb3hqMVU4TVZTZlZ6ZENneVp2YXB0VFI0QzRPNkd5?=
 =?utf-8?B?MDh4SDFyalVIVkNPalRDSWJHK2s3T0JzdEJvUGtkcGVMVlZNTVNhV1BKdzJB?=
 =?utf-8?B?STdkSEx6eFhiYllibXJzRWhIY3VDT2ZtNmkrQkNuUDY5aWNHNEhzaFUxMnZU?=
 =?utf-8?B?QTdzRFdzRE1HSWVua29Kc2puRE9lTDE5elFQYTJ6ZlRmVU8yZmQyNkJ2ZWpw?=
 =?utf-8?B?TGQzUHNQYzA1VFYzeFdST3M0bnJpVzRvUWJ0Q2szdGRPMXJtYTIyRnFDU3VU?=
 =?utf-8?B?TVRuZ0FKMTluVUZXTzV2dFdteG9kbllDMmhqUnFiL3QxUnAvTUFKZC8weDZL?=
 =?utf-8?B?emp0L0pXOEh2NXBRVW53NFhUVnZkUmpmSUJVajJPMk1jWFNZZnRNOWc4ZjR0?=
 =?utf-8?B?ckFlOFM5S2ZuYlFBS1c3MTg2Q2JiK3kreXVnTEtSdUtBVkEvaHh1SlFWRUtq?=
 =?utf-8?B?SUxjRUQ5MUhhdWFnRFozMENQOU1aMExVYzhEaWdHdmViNmtZR1lUZW9mUnZ5?=
 =?utf-8?B?eWZOYmtlTUM3aDdGeXlDeWd0WFZFN1lLcXp1Y2xuc0lrN0xVbVhwNUJnMmJV?=
 =?utf-8?B?WjhMNXBhWHlrMUF5emdYSHdIa3ZTTG4wbm5hbVlVdUVVSnNucmJNc25KSGFh?=
 =?utf-8?B?djNySjI3eDN1bE43N2JEc1YyRXJDZDBzU0p6bHMvc3B6NkhlS3hrMFVmdmJN?=
 =?utf-8?B?WlpOV2xwdG1Cb3lsaXlNWWtuNUttdTEzNHZUZDB0dlZISjdqdTdYeDlwWFZl?=
 =?utf-8?B?enVwOERrRmdsT2FQNDZzQmNOVUxSK0F4QTF4V0VyazdaYWdIZzhFOTUxRCtl?=
 =?utf-8?B?UlMvSHYyUjFtRUdTcHplT3ZqcTZlV1cyclo2NjVQeTNGaFBMNDNNL2NuN1Bn?=
 =?utf-8?B?eXZKWVMyR3h6T2ZMSWMyQk9TZWMwWFN4cE5GRytDVGRKaTNqTVRob1VsYjc5?=
 =?utf-8?B?anFkNWxWWUlwTGU3cW5nKzFIdlY4bFpqS2dad1lSTUNzbUtNL05BR3N5TnJB?=
 =?utf-8?B?YlJHdFdPRk1zdy8yZlZKaWxyT1NPa3NyeTFGN3lxVXVsWUwrOWdPUEJxd0xJ?=
 =?utf-8?Q?oAMXvfBNusIkJfHk=3D?=
X-Exchange-RoutingPolicyChecked: qaI61NWoDPuVCF/xyq9w3Ob2HXK5+rfc3MFD45R9I3HVu1T/53hrLWgZpxXbw93DXZTlKD/EMCQtWYozNyWNouQyJdYmwb1FAHTS+KkKsMwFpv73M86l4JPEplfdUYkJ4Mt6TM/SyvloB0x8/8f+Sx1RTxOQ3dkrbRmuevAUuqdqa7qRflvFQXsQE7hQfFc7yetfeHKGQKufV/nRHt4Z+jxgsE/Nayjqeqz+aGchNjcluHFDBqn/MXk9N5bJME9UJ/5er1sNlmpp6V0rNiR8tvu0/gFHA/EPjAjhzvMOpOCZOuCXLf81SyQYm9xT/GBFLbq3SLn/w0/8hnYxhdA4Tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ec45d8-34a3-4bc1-697e-08df3e501be9
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 10:56:29.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2j4lxZYqMb84wAtdKyqxUPAKqtXREe9VVDNsOZx2XV9hHZ+JaCYJgtNn3PG5vSpEUdotiOFVGxVaUqkqhZBYtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB808482
X-OriginatorOrg: intel.com

On 09/11/2026 12:16, Julian Vetter wrote:
> On 11/6/26 4:39 PM, Sebastian Andrzej Siewior wrote:
>>
>> Looking at #1, you could probably limit it to a nop on
>> !arch_irq_work_has_interrupt(). The tick should not be disabled if
>> irq_work_needs_cpu() returns true (you don't add anything).
>>
> 
> Yes, right, the lazy part is pointless.
> 
>> And lazy items get handled via irq_work_tick() anyway. This make me
>> think if it gets any easier if we handle both in irq_work_tick(). On x86
>> raised_list is evaluated anyway so by dropping
>> arch_irq_work_has_interrupt() we would avoid the APIC check and handle
>> list in this rare case. If the IRQ-work is working then the list remains
>> empty.
>>
> 
> This is maybe a cleaner solution, it needs no APIC access and no call site in the suspend paths. But irq_work_needs_cpu() would need the same change, otherwise in a CONFIG_NOHZ=y setting an idle CPU would still sit on the work until it leaves idle and re-enables the timer tick, no? I will test this.

A fix for stable is needed, so need to check that there is no
irq_work that would have a problem running in the tick context.

