Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.10
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792799882;
	b=zI6MYEtUGYpJFJraxnM80yGOGrUuzXyISdEgvrbFS0hun0mS2CZN1xb9FLB+pGpzf9Mg
	 ZKGC8LYiqchASbGW1ZivB0jqAC+cXIprsT4W6hKK7tlBUM0Ebtvm73Cd6u0jTLr9FaxQw
	 jYaEf73/XGJo1yeymigBAcICaw85KXTyzpLX6DklHM+7goD9r9u7Kbj5kZt7CBJHU5zHk
	 RyX11f0upeor0cLigvfu2PibG4uTdJCP6+51N1LcJG+M/s66qZMQ8zZgqvfgp0OEYi1u/
	 N/GryRNiaV+CqDFU2qIDnNfaRwFHo9WL2EBl7wT+4bRdqeRLSZnlOCtDoI+2Dj3tiyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799882;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
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
	bh=7OpYH74swdsc5rpO0Pf3apXcLm1/8lExJV4qwXFp3M4=;
	b=y8gbRcea3UZzQCaZb0nZ4bpAIU1ZUBZB+1YdnfTbg4aqQXIaGeEfjE6VPqBY/GqCfE/h
	 7AU/ZlkzDGKsjmcu8fU5Fe6pYFEV3GmrTF3sxFHPUVY6x2hiwRMuRWmQGa89yHn+DUOXC
	 7iHOgMa8JNV5ctcoIbPg5+FpcYVt6v0NFlMIxMAoaqHq5HCclJGBxMmCd+uaXmZS2tFFS
	 HopDHvEYTlXiDOqZ4TRGXBaGE2OqDzlE3xgAsOqf/a/XFTu0TElO10zh1ECwCZlpAcYdG
	 VEDsJy2KGkXlL+xSbXk5l7dUrTDoCswd5TQN1BsW3ymXNz7ry4wPr2NTxcXsYsLpsiQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W2y0ivc6;
	arc=fail smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9CC60A2602
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:58:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE9CC60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=W2y0ivc6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792799881; x=1824335881;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7UBv7Ly50Do1g5L8penDArDwuPoO0TE5EJqIqQwwspU=;
  b=W2y0ivc6D77hIh0hTUoxhhSxjJMTz2U6DOer7x0SVYmNHqhCuL+0dowG
   6aAeYyeirQqN2O3AdPhnY66KwgjK9V8287kRFviK9YScKYvf6Txqp3IV0
   VDFtNKB0GLcprfBw8tXE5E+b+pXrBmmk8PVS7fQAXrHcMZ6NrhNkqRcep
   F07QSCczEP+eWTNmjdsIDudc7Uo2tAn3Jj6j/7Whb2y/hAB71gdBuWuLA
   Zw4eInWFzJSzznxrMxNVAAqZOPscGwaaAWya7hDKxlbyOZU2rDJn/I1ze
   K9MPnVcbgm3bjryJBuuppaGufZlPi5RMF9OUL2TCMcdY9+SZ0VHIRjKkI
   g==;
X-CSE-ConnectionGUID: K88IlojxS/SmTTh/bII9AA==
X-CSE-MsgGUID: 9dVN0pepQIG11lIma41tNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1451402"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1451402"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:58:00 -0700
X-CSE-ConnectionGUID: DLv3HqMpRtaUnbKCT+EsyA==
X-CSE-MsgGUID: yyJxCAtMTLm1QyD/Ka+L9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3725482"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:58:00 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:57:59 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 16:57:59 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:57:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tF//VQtPrkyYGwjFwrNqtcQi2hy4/o3frrVzyy5rBmNxELnB82s9gzvCwA7nF03OQwPJJvjcI9wDJc2EqEmvc6mUM6EXHOWQkXs4+OJ8zqt3lY+q6RtkjS5gynh+YHTCMTnwXM6EyEC+7luUbrDBr518evxXcZkE+HQV7niy3phg6BqWAC/a44cbE7FqNjdto80Xr5j1NTwjhxJvF332tc5KHsL2Pw0+tTe/45Zd8bCrcHj3tTE7tzcvGMnCGIMY+v4iaT2pKdLiaMiQ8EL6xgWwFtMO2TIHBaXzJXHzpKJOGwVFEzRHYIUMLpgwCZRg+P5O4HpSL4vxmYbyfI0dTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OpYH74swdsc5rpO0Pf3apXcLm1/8lExJV4qwXFp3M4=;
 b=brk3tgMC5nSv7amceLW4oH93CS5KajH+Hl93X4hJ220CJq9KF/Y8Ef3vM10YDGDAs2SdC8uFy+22IxsYVgJaaPvCxQQoBVyBRst69cZP+Aa91wZQ/97VduVqpWEpgfTz1SsKlUNTqjRR09BAIFmBkMhpwz3AaPr6Bia4UVaUQMOKSiKRNIHQ2Y9H7RsSKPt86Dkw+6pe56kBnyvjA2aUL4qgEdmsfVTfzTpbSKbsmBhK7iQslxJ/JyBBSVDfVsDSUkGO/HelaLDrJTGrsLb2pLjNFu/w4xKOxTeFwJV9nNwb5QmSiXxJySImjilJO00ryVig6gg17c+Zd0LoDca3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Fri, 23 Oct
 2026 23:57:56 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 23:57:56 +0000
Message-ID: <2317c664-0c9b-4dad-b135-a771959be024@intel.com>
Date: Fri, 23 Oct 2026 16:57:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/12] x86/resctrl: Attach ACPI ERDT information to L3
 mon domain on CPU online
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <2d3327d86480b1a41bf1a7c935317f14884a83f9.1791933001.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <2d3327d86480b1a41bf1a7c935317f14884a83f9.1791933001.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS7PR11MB6197:EE_
X-MS-Office365-Filtering-Correlation-Id: d02fab42-8d30-4cda-db98-08df3161758a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|7416014|56012099006|261022075727099003|4143699003|11063799006|5023799004|261009223027099003|22082099003|18002099003|10067099003|6133799003|261022105027099003|261021121427099003|3023799007;
X-Microsoft-Antispam-Message-Info: MnMt0w/tllJ4KYkaTPHn5FrrtESlRZFyDMGvIFFxMmfR14viTT1847u7FcQTq1pI1UP9XvabC3KAKqycj6Cv3kUG0zfWMCCnYhXM1i5Ty0SDSClUVb6mRaLVZQG3wMIER2ZouKIjV5Jl0j84eT4mY/M+PER4tjhVZeogt2q+GZBiyUv2CbZzYv3EvedXoY+MRqUbJUsPzVBPhAROXsYNwMlYXnA8mdOwn8USLcDnibpSwS9CmMy+q5zgfark9uXfKCxtkEhq4axWOhdY4Ye66i/bi01L0ogmaoYsIh+iJvzPj2EjRVXR5sjt8wlIo+Yn8Jjv7M8QqrGWIkbxZjNmgHWAhicqhkokAPV4QabsfjCVq5RZUAWSuy3L4uE6qJuchNuPgd7OXO36Xgcs9viXSp0a1xTZSVSW4R8/iMSt8qm2HCs+8k8QT3EHCsMT4wyK5QOdE7wWUiBv1DW+P/EZhNH1NgpJx/mhyWP3ZDWw4aNOvhvWE1wa7CqQhzNAyG/UBsErsZJU+IOZ2jB7GfMR/b4kGPUqVKo9QZqnBw3bTa/lfR6hkmCvG30Yort2UkkgxxtMnfWNCeDi9nW/t4BqPgJF/EFAQ9LH/AgcDcsmde6DSyAJ4ffr0xOf8kTHaXmKVCEUSGgnogQZ5J2GdNP/BLTV3t0WI7+zVZogUonmRVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(7416014)(56012099006)(261022075727099003)(4143699003)(11063799006)(5023799004)(261009223027099003)(22082099003)(18002099003)(10067099003)(6133799003)(261022105027099003)(261021121427099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUZYR3ZnVHpPUXJPQlhhZEFjaGYwNXhvZ0Flajg1b2lSZlJlS2VwRnJSeXpn?=
 =?utf-8?B?TjRXT0VVMFJmQTZGUFR3b083djU2Vno5RkhlbEtYdHFHeEIyQnVYeXVaeWZz?=
 =?utf-8?B?NDg4T2F6czB0elhPaHU2WHM5UXg2dTMzNWtEblJRZVlPc3ZMLzZBQ3ZHVVV1?=
 =?utf-8?B?Z3BGWWtoQm4vc3lvandNV1NTWTY2L1B6T3RCVzdONWJGUnpWbVYrL2o3TDNu?=
 =?utf-8?B?ZFJ6bERVY0x5VXEzUWVoWjRxRWlra2lxNDdLWExUV1Jnc0Z1Ykc0Ymt1VWU0?=
 =?utf-8?B?RSs2ZzBlYnBnQjF5UDFDV09TdjBEbUVIdXM5ZTRzaXBqTzRMK0dPZDVNQW54?=
 =?utf-8?B?QU0yZm5FTFBEeW10K3kvZnYwYlJFYkY1cFEvWXgzWjAyQ1dwRVRaOWIvbWRi?=
 =?utf-8?B?aTlNWHcrbzhQWEVtRE0yYzl0Rm45dXpGVmh2RldNM3RiV21vU0NKVnBhNyt6?=
 =?utf-8?B?ak1IcnMrVTN1REliVmgvbFRNOVBuYmZEQVpRTm1zT0NiaU1GMmhaOWpDc3Uy?=
 =?utf-8?B?Ty9NaDFlZUNOek54WG9ZVUxVQ3gzT1BnWVAwZDR0NVp1d3hJUUhVRWc3Y0Vm?=
 =?utf-8?B?QkJyNnVReHc0cUtDanZaUDh4RGxRbUE5ajg0WmdwV2d2RytLK2VLUnYxbG5N?=
 =?utf-8?B?WWxWK2Vyc0hmYUY5eFVpa1N3SjBuMnJ1OVhIMy90U3llMklOWDROc3NDRnlW?=
 =?utf-8?B?cFVGbVAwaXNRdUhRSzJZSDdlYStQS20zQlZnd2d4ZDdVdGpZQmtGd0tLT1RE?=
 =?utf-8?B?S1Y3MUxBNDdSbmM1MEI1Q1BpVTA3aUdibDVDeFE1NkdKTU5oNlN2T1hjcUI4?=
 =?utf-8?B?K0dLR0FHdG1TVFZDUHNPNWNDSlVWUUY0alRjNGkvcHRBK01SYmJDQld2Ymo3?=
 =?utf-8?B?ZmN1SVBNeVpWQVJ6RFI2T1d1djZnbzlvQlJLZXNHRzJLTkpoQUs0aVNZdzIw?=
 =?utf-8?B?TlZUNUsvZjZkdDFJNGtmMk1zZG15L3JBbHE3Q2Y1bFdZYzNXZ2VpVWhkTGYw?=
 =?utf-8?B?UHJtNngyL1R6MzV3eWlaWVhwK0xEbDFhVnlnTUEzMzl0SWJLMmVaR0xjcjI3?=
 =?utf-8?B?Mm9nQ2pLdzIyd3BHVWJXRDBCSmRuWVgvaDBxV1dwRkRXVWFZRVFEOGRqZkRz?=
 =?utf-8?B?YjRyMHkzYWVTbDVSZVlwa3FkTTZSaG5rRXh4VXl2dFhLelFrZnA5K05tcUJS?=
 =?utf-8?B?SG5TWk00U29vbFFEUFB0RVZaNEN2VnBqWm9tQjhDTVlCMjU5UmJqSmZTTmwx?=
 =?utf-8?B?TWl3YzFnbkhiMEVkNHgxclVUbk0xckdRK1dQbWZicHlRUGxDUzhvdFZ2UGds?=
 =?utf-8?B?UE54cCszTUlOYXE1bXgzUFFycThiK2VwL3RGQy9oWUdkM0U4QTIwU2FPbDdl?=
 =?utf-8?B?U3pDUlBWdkRYUzdBcFdpaEF1VVVnUVRxNzZwcEFtVm9sdzRtdEViUSttVEg0?=
 =?utf-8?B?cDVwanR0N2hLU2FneVIrWWxGaWMxVE4wRENnV0hRWUZENnpJeVMxVEtMd1NV?=
 =?utf-8?B?WUNXT2xOTTBWWCttQ1R4ZHFaZDFHQUxHQnNqSStSMmJPdXRhbkdlN1JFOFJC?=
 =?utf-8?B?OFNJSnlxUlYyemhLVUQ1d2JJOERXSFFWeDlJcWZ4bnF0Qk05dFhNb1VpMzk5?=
 =?utf-8?B?em5FdzY5b1diYUJ1c25LeXdiK2paY1k4WEFiNW5QUlgzNGY3ZnVCWTNXemV3?=
 =?utf-8?B?b2JGN1Z6NUNEallVOENZdk8rOHVJVWNhQmZEandIQVJPQzFoeTdQQllHMm45?=
 =?utf-8?B?UnprdVlEU1lCL3dKR09qdWgvclp4VCszNWI0bnZacU00cG92M1lYaE4rajRh?=
 =?utf-8?B?L3VxNVd0OWswdHhzVFI4VFlnU0dGN09CWm5SVFBXMlBQZ0EwVGVqTmJTRXlB?=
 =?utf-8?B?K1BGN2puWGRQdTJRZC82N3BHcFlXV1dmdnFYTDBVbnpJS0l0QUFZbiszUURQ?=
 =?utf-8?B?STZhdVA0WE1teUs5c2Y0cTN6c0FpbW5VRUw3TS9kd2JEUzJWN29nS1YvZCt1?=
 =?utf-8?B?cURZSzJ3V2FiVUF3enNFTlJJaWVtcjNmY0RGMkV3N0FPSFFDbFBFbytwQjI3?=
 =?utf-8?B?Uk9XZE56SGVLcG91ODRrQkRZMHAxbHhJUkNlWUF4TkpjSVVKSEZHOVRyTFRE?=
 =?utf-8?B?TlJ4encyZnB4YkhEVlZxT1p4UGM1T0VDc29oRlhoYWdDRDVKVWZhQnlCZTBK?=
 =?utf-8?B?VXErMWtTcTk5QzU1eDkxb0NYVmhQTUhtVkJxdUtzZkFyRDN3WWYyT05GSUto?=
 =?utf-8?B?Mk44cEQwVDE4K2VHYzY1K1lScGhjOCtIWmFZUFAzQStkZjZ3bm84a0F6bTE0?=
 =?utf-8?B?U0FzSEpVY3BWOWs5M3FYWFlnZlUzZ2h5T3dXTkd3K3I4Z05ZSVc2NElOOEdi?=
 =?utf-8?Q?OdCu5A/4W5875bxo=3D?=
X-Exchange-RoutingPolicyChecked: b9giLLDyFWfANyNt/x6qkAZ0XxFXzf808zltobp/jEPYYeQxJiSjeMYGqhUlHXEpz2DISX6KH8Rnm+mhPTm7MH0QYRM/6Tj1rSgS3ZQdCJkLHpv9ToI1256hTSFuNUy178tqsShK3zQxByGHKgfCeBol1SEFRljtTzT0PVtG4ow0PU9a+fNohP/ygMB1Yrkasl1isKGZmxMy4F3xBZm4nI1EyfJstvLoJ8zhTmnIqZYATo5Cps2ET30lAY1tCY8hujoX1lGVOXDdTUOGjnkG6yf3vp16/u/68vGTSvlF/IySFb+vmomDz7OHJ93R43PbjSVOJPWAFSn8+DEMq8xsSg==
X-MS-Exchange-CrossTenant-Network-Message-Id: d02fab42-8d30-4cda-db98-08df3161758a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 23:57:56.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uE1/zhlcezeqtM6Z43kyh8QnuxR+i9d3OOIZP9l56Pn0f5VGJVymKjPpHpMiTiL/FLAj8S2o4/blqZPMQxrTivbaW0NPWfoeTJwa2JDGQlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/13/26 7:58 PM, Chen Yu wrote:
> In preparation for MMIO-based LLC occupancy monitoring, link the per-domain
> ERDT information to the resctrl L3 monitoring domain, so the MMIO read path
> can locate a domain's MMIO registers.

Please review "Changelog" section of Documentation/process/maintainer-tip.rst
I understand other subsystems need a snippet that describes the change at the
top of changelog but x86 does not. Unless it is something really simple, which
this is not, there has to be some context before the change is described.

> 
> ERDT and CPUID enumerate CPU-to-L3-domain membership independently: CPUID leaf 4
> describes the L3 cache topology, while the firmware CACD sub-table lists the
> CPUs of each ERDT domain. Both views must agree on a CPU's L3 domain for that
> CPU to be monitored safely.
> 
> When a CPU comes online, validate that firmware and CPUID agree on its L3 domain
> and bind the CPU to its ERDT domain before adding it to any resctrl domain.

"bind the CPU to its ERDT domain" is this not what patch #3 did?

"adding it" - what does "it" refer to? the ERDT domain or the CPU?

> Fail the CPU online operation on a mismatch for now. Leaving the CPU
> online but outside all resctrl domains is doable, but it would require a
> change to cpus_ctrl_write() to reject CPUs that are online but not tracked by
> any resctrl group. The current approach is stricter, but simpler.

I do not believe failing the CPU online operation is actually possible.

resctrl_arch_late_init() is a late initcall and all boot CPUs are already online,
so the failure during this time will result in resctrl not being initialized at
all without impacting online CPUs. A CPU onlined after that will fail to
initialize, but that will make the CPU unusable for *everything*, not just 
unmonitored. This sounds extreme for an ERDT table issue that should never happen.

A CPU that is online is still able to run tasks and the earlier enumeration 
ensured that MSR_IA32_PQR_ASSOC is accessible and what the valid values for it
are. Even this "failure" path demonstrates this by calling clear_closid_rmid()
that writes to MSR_IA32_PQR_ASSOC *after* the supposed failure.

resctrl's current behavior when a CPU cannot be onlined, for example when
domain creation fails, is to *not* prevent CPU from onlining. If a domain
cannot be created then the CPU is still added to the default group's
CPU mask (resctrl_online_cpu()) to ensure that tasks can continue to
be scheduled on it by writing to MSR_IA32_PQR_ASSOC with values known to
be valid.

Such a CPU is *not* added to a domain's CPU mask so resctrl will not
attempt to make any configuration changes to it or read any counters from it.

> 
> The ID used to match a resctrl monitoring domain against an ERDT domain is
> always the L3 cache ID. ERDT is only enabled when Sub-NUMA Clustering is
> disabled, so resctrl keeps the L3 monitoring domains at L3 cache scope
> instead of node scope.

Please always write with imperative tone.

> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---

...

> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 0ea888807bd0..9a59643f366c 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -33,6 +33,8 @@
>   * The rdt_resource's domain list is updated when this happens. Readers of
>   * the domain list must either take cpus_read_lock(), or rely on an RCU
>   * read-side critical section, to avoid observing concurrent modification.
> + * This mutex also protects the ERDT domain_info_list, which is modified when a
> + * CPU comes online.

This places unrelated text in the middle of the description about how reads and writes to
existing domain list is managed. Please consider entire paragraph and ensure that the end
result is coherent.

>   * All writers take this mutex:
>   */
>  static DEFINE_MUTEX(domain_list_lock);
> @@ -558,6 +560,8 @@ static void l3_mon_domain_setup(int cpu, int id, struct rdt_resource *r, struct
>  		return;
>  	}
>  
> +	erdt_l3_mon_domain_setup(&d->hdr);
> +
>  	err = resctrl_online_mon_domain(r, &d->hdr);
>  	if (err) {
>  		l3_mon_domain_free(hw_dom);
> @@ -742,6 +746,13 @@ static int resctrl_arch_online_cpu(unsigned int cpu)
>  	struct rdt_resource *r;
>  
>  	mutex_lock(&domain_list_lock);
> +	/* Refuse to online a CPU whose ERDT and CPUID L3 domain views disagree. */
> +	if (!erdt_try_bind_cpu(cpu)) {
> +		mutex_unlock(&domain_list_lock);
> +		clear_closid_rmid(cpu);
> +		return -EINVAL;

(comments added in response to changelog)

> +	}
> +
>  	for_each_capable_rdt_resource(r)
>  		domain_add_cpu(cpu, r);
>  	mutex_unlock(&domain_list_lock);
> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> index d94c54617fa1..d4b630358d6d 100644
> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -199,6 +199,115 @@ static __init bool parse_rmdd_table(struct acpi_subtbl_hdr_16 *rmdd_hdr)
>  	return false;
>  }
>  
> +/*
> + * erdt_try_bind_cpu() - Validate @cpu's L3 domain against ERDT and bind the

Now that the changelog and descriptions come together I do not find my earlier
suggestion for function name to be appropriate. How about erdt_try_bind_domain()?

> + * ERDT domain containing @cpu to that L3 domain.
> + *
> + * Find the erdt_domain_info whose CACD lists @cpu, then bind that ERDT domain
> + * to @cpu's L3 id. A CPU whose L3 id does not match the binding of its ERDT
> + * domain cannot be covered by resctrl.
> + *
> + * For example, the CACD sub-tables report:
> + * domain0: CPU0, CPU2, domain1: CPU1, CPU3
> + * while CPUID/cacheinfo reports the L3 cache is shared by:
> + * id0: CPU0, CPU1, id1: CPU2, CPU3
> + * With the CPUs coming online in order:
> + * - CPU0 binds domain0 to L3 id0.
> + * - CPU1 is in the unbound domain1, but L3 id0 is already bound to domain0,
> + *   so CPU1 is not covered by resctrl.
> + * - CPU2 is in domain0, which is bound to L3 id0 rather than CPU2's L3 id1,
> + *   so CPU2 is not covered by resctrl.
> + * - CPU3 binds domain1 to L3 id1.
> + *
> + * Return: true if @cpu can be covered by resctrl, false otherwise.

Could "can be covered by resctrl" be more specific?

> + */
> +bool erdt_try_bind_cpu(int cpu)
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
> +		pr_warn_once(FW_BUG "Can't find L3 id for CPU:%d\n", cpu);
> +		return false;
> +	}
> +
> +	list_for_each_entry(d, &domain_info_list, entry) {
> +		if (cpumask_test_cpu(cpu, &d->cpu_mask)) {
> +			cpu_dom = d;
> +			break;
> +		}
> +	}
> +
> +	if (!cpu_dom) {
> +		pr_warn_once(FW_BUG "Cannot find the ERDT domain which has CPU%d\n", cpu);
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
> +	 * skip @cpu instead (CPU2 in the example above).
> +	 */
> +	if (cpu_dom->dom_id != ERDT_DOMAIN_ID_UNSET) {
> +		pr_warn_once(FW_BUG "CPU%d's id=%d not equal to CACD domain(%*pbl) id=%d, skip this CPU\n",
> +			     cpu, dom_id, cpumask_pr_args(&cpu_dom->cpu_mask), cpu_dom->dom_id);
> +
> +		return false;
> +	}
> +
> +	/*
> +	 * A possible new binding. Check if another ERDT domain shares the same
> +	 * L3 id. If yes, this is a conflict and @cpu should not be considered
> +	 * by resctrl (CPU1 in the example above).
> +	 */
> +	list_for_each_entry(d, &domain_info_list, entry) {
> +		if (d == cpu_dom)
> +			continue;
> +
> +		if (d->dom_id == dom_id) {
> +			pr_warn_once(FW_BUG "CPU%d's id=%d is already used by CACD domain(%*pbl), skip this CPU\n",
> +				     cpu, dom_id, cpumask_pr_args(&d->cpu_mask));
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

Could this add a note (if it is actually true) that earlier checks ensures
that hw_dom->d_info will *always* point to a valid ERDT domain ... or does
resctrl need to check for hw_dom->d_info everywhere like erdt_mon_read()?
Or are those checks just for robustness?

> + */
> +void erdt_l3_mon_domain_setup(struct rdt_domain_hdr *hdr)
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
> +		if (d->dom_id == hdr->id) {
> +			hw_dom->d_info = d;
> +			return;
> +		}
> +	}
> +}
> +
>  void erdt_exit(void)
>  {
>  	struct erdt_domain_info *d, *tmp;
Reinette

