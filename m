Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793685081;
	b=e3v4Ol24gWC0sQQkr/EJse8ckCy1QDsvHQyPLIlw2q48DFkQgV8ImAjMzvJ1qOTpQMJw
	 /dSd+ttx3p0pui1iwATrUfwNjM65nHHs8C95h10hyO8jRuFeSUvveoOfAR/1pH0UBinUq
	 E2Vrpq3SSuvRa75owTpbt4wIXbZHya7yl+yir8sdBeHV5Xkl3jpVYJFZPZ0n/7WkZO7+Q
	 MTPyQdWxFB/8wKOqHH0M5SfHpaI03HOWTGjhizVdybIVi8gLSEOzZxTfm+MIPhKDfrnXx
	 ufw6/N+UFf8azjcFpHp4T35nHeMU79/ifnuSXdyo6EzzXYsJzXaZ6rVfQ0tyWRoFEaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793685081;
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
	bh=gqTYKy4OePIHXW0YREs2nZ20ZTnkENAguco+/cFfg/k=;
	b=1XbdvJ2A+TB2vXjmntWpdmIWebmtTQY3N5BUx02eylXAFmxL3+GY3dxIS/MqQdTJULcE
	 4zFZwI60yVVUCDaW+Ecb3plzzaMtpgnwRbpnu4pXEf6ZFzwMfVO6AZ37TfxvmtFbAvq/t
	 haHUZJ1SqC4ERti9o58Aek79+JLvrpxl18xf/80aM+nOYQIBnyjig1E/YP5wK7QE6MK3i
	 bh8xsfhVFYlDAQBML/sg+uXoYin6hBvCEC7y9ck4tBhuZ/0zOo3mGCv9O38EaHaRILtDV
	 0tZaXwgqT1mxTYsmAUFFb3p5sTsyqsj6gwleE4WekyntmW+T+S4iqLYsLqd9RqfPK1w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="LocCzTJ/";
	arc=fail smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7423F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:51:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7423F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LocCzTJ/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793685080; x=1825221080;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=p+DaYYvFf6AjVWsJTCktQSS7FHKezW2ifpiYhQ8iC4Y=;
  b=LocCzTJ/EhLloJlHDY5ETx1Rsrc8eiIsvKCV0ph5TIKtx2rkzUhEfpPt
   iRUI0puGIvAx643Wv//xrWvyBVVftPlS7VeAM7EHqmxsQnRPVYj0zMl4E
   NxIU8Ey/wKhyk1qMn8aulR33LHkxSBA55M5py9m+2TN8sxzwa0h3TxGXv
   YFnQJEG+5yb71KMXwj+csjLYv/gdjYLV6g7sKrpYriS8U87TL6smrrGYs
   jGZyFSnOPGfzWwSwKN1T4qRZoGdKtzT6/9lLngViFETQvL4qOCBetIXX6
   W11sjfMrfOB1Q2tQ1XxkFp8Aae2I36TcS3+Pbc5dr8KRKoQ2voAESFtWk
   w==;
X-CSE-ConnectionGUID: kpAVCFAyQde7FQc4k+nuog==
X-CSE-MsgGUID: xijXOx7ZQw2hNJq2akELcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2500768"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2500768"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 21:51:19 -0800
X-CSE-ConnectionGUID: ph5NJ6GdTTOZRiOu+Rg6Cg==
X-CSE-MsgGUID: BDhfBT1NT321p+CnPBF4pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6164764"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 21:51:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 21:51:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 21:51:17 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 21:51:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuFu9wkhMELODhp1AJgqjzQLa3LAuyAlV7YXRTdBKA/I/3Z+E3ImPPPibY57sGJA/+JlMI5dpGrCKS16qun/HeMYXScDpdRDDtbDEAHUFA1xZ3kG14XzxaNx0/8F149u0GDlO7GbsxsS+jAHtufW8OfN/fRDCIk+lokfiiObTpthHAefVDwXL6REKhC18OjobHMwcV4JsPBFYu+K44nRuDhnqYyOjGo9ssSfGQiYB1OokAvaIuUDYxVdBuWKSLbynpg5MnDJD4+0igNpNp3WHguDnMQWxDaY+mv55jAqEGV4pZJQhdsKCN0GJcqiaTI1VogO7oASSK5mC3bL2frNMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqTYKy4OePIHXW0YREs2nZ20ZTnkENAguco+/cFfg/k=;
 b=k5MQlqVsW4tzW5k+1y/KM+Aa1TBlkqz6ofec7J/938dq4/EhTocz0RL1S1tNVvqY1GqMjGDp/J7mzAqM+9uziMLpot+h+SbMghAYJ76yDT/mxNW27CVEG5lFZUr6FvTqTusPQjWVVT7zGqbwaTePNW3KC2BOVu44Kd2A/WGTKQtaK/uzIkXfZeDhG8JBdrBsTd1/YPNDQ6065+YArup8/O8wo9f9tlQBvKPPeLHzEAIG1uvs6QPHiX4rHYRr63j8Ho4ltJgCl4usrPkZGbSqBDsYSUC6PHPUOrP/LEK3E43IMFvD3/5pPg+kRMwZz8XTEISj2aTuUJ2sQfjdbrzpEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM3PPF97A7CBDC1.namprd11.prod.outlook.com (2603:10b6:f:fc00::f3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 05:51:09 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 05:51:08 +0000
Message-ID: <71a65c26-da2f-469c-a38a-4b6b279ead96@intel.com>
Date: Mon, 2 Nov 2026 21:51:06 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/resctrl: Unmount resctrl with the CDP state it was
 mounted with
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<jic23@kernel.org>, <ben.horgan@arm.com>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261031094616.1691026-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261031094616.1691026-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0024.namprd06.prod.outlook.com
 (2603:10b6:303:2a::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM3PPF97A7CBDC1:EE_
X-MS-Office365-Filtering-Correlation-Id: 20749ed7-9b4f-47ab-c46f-08df396e7542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|7416014|921020|261102123227099003|261021121427099003|11063799006|261021123027099003|56012099006|261009223027099003|261028144727099003|261026121527099003|261026140227099003|261022075727099003|261022105027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: B78Ic9BEe38xY2Sq9VaL33UWq8em1pT4Z5KMuEMAZK9Q+6cfmf1NvtP+COev7xlPShg5AYDWRyTUCIiazR3flxZLGvnh9ehoD0nt1mabWXNYDI5WGcurmp+/VCskkczHppQmY7ySFHs29/dwh7cczI/D1P91r1U98jFtXpmzEnY23kPxl/XoPz50MVBq3S5NaHfeE56jEI/dGPMPR4ZjQrTRDsFk/Wy93UU56y3co46IR5qCIg/nxtUT/O3pVYKXbTMFawG4QFNIugcbsDXxks04tbvKoYjWluLedcSM/QkOR9htyVnt8/GDZedBZxVSPYy94ixkhT9E9CKke9h+iVPyJZcrPBP271o6Kf1ISl+Xxc9hsBZHqOuq+8s9Z6VHYrV8XDIY1WrCaRkyq3goia3CwxY2NKox8bP2iOXP8r3FEZGanqtOo1faVPcgVUUQyGp43N1n14l7R3fW1WrJW95ijvpIBeaS9cBFRyuXCLehNYwOMyFtWzHqAXUxFDvbXQODA/DHwJ8955114vsWmYTrjkced4yxxuT4B+V1Nr5FIvOTqK75t5tUApNbC2LImLwN0wJousnATxT/eMVVEcjYpKCIjE9noCR+AopAnkR6xICzjwA5PYkNQn4PKp7RNhnh4Egb006C2uboAPYWkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(7416014)(921020)(261102123227099003)(261021121427099003)(11063799006)(261021123027099003)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022075727099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkVLWU5xeVdjUXZ0TzZCOTBrd2p5aVYzU3ZjT3p3dEtFNGNXNzdkcmdjbnBl?=
 =?utf-8?B?OXFRT2lPbnlFL0dOUk5tcmVYMGFUVUJtM053TDlDdmJGNjZEK0dKbE5BS1Br?=
 =?utf-8?B?dDBTMlJQZ3lyNVh1MTRtSzNoVmdFNkRZcWc5c3k2cGVwdkdiOHBqbVoySmYy?=
 =?utf-8?B?UjU0MGREeng0aU5INm8xV2pJVDhydVBuZW1Ha3Rlbm03TGZHRnlPQ0R5RS9R?=
 =?utf-8?B?emRsd0VxUHN0UW40eVJvaUxXQlRmam9sNlBuR0JzOVJJakp5VnVrWmFxL1Jt?=
 =?utf-8?B?azRLZFU0UEF3VFBwdGNkN01oaWhndkZHcGtVNkxZWjlKQVJPa3pNZ0RHRWl2?=
 =?utf-8?B?Y0d1bVVrR21JVnRZam1zN0RVWGx0YmZGcERQQUFVSjU3bmVndElFM1FhTjFX?=
 =?utf-8?B?Y0FwN1p4ZTNPTmp1MWZpOVZaU3BqSGFVZU9vbEJjYkF4dndCMW9kTXVZWGwv?=
 =?utf-8?B?ZHk1L2I5d0JBZ2VmZUJaSE80MnBScjlVRTd0SjV1Z3k2Z2F5VDcxWC82RTB6?=
 =?utf-8?B?WTBpTDFNYjdycENkZWZ2WThCem5oSlRacHYwcTN1WjdJV0x6SHB3aVZmQURP?=
 =?utf-8?B?WFJudm8yU3Fob0hhY2tleis3dXRlNGVxODdWYlFOaFlVSStRR0hwNGgzYUll?=
 =?utf-8?B?UHpTS0NCTGFYdG1LOXdVdjhZT1pRcmVTREtTdWI0VExVZnplOFRGcnlRbzI0?=
 =?utf-8?B?aG1Zdk1mVzV3RzJRaStiMS9NVjNWV1JRNm02ZmxmM1VvM2U4VG00eHFpc2Qw?=
 =?utf-8?B?OGtteXBjMlB2RWVUOFFHNzgySitpbUIySzF1TGJtejVPaGFlSExpeGVhbTVv?=
 =?utf-8?B?YXpjVWcvTC91NHVMRERiSXI4SVg1SkQ5WkNvOGo0RXZZeG0rdXZka1FDTHdj?=
 =?utf-8?B?ZUtEN3VadmhwL29Ib1YvODQ0STZERElJak1iSDhXYVdycURoS29PNnBaTmpn?=
 =?utf-8?B?YjczSXljcXprS1hpeHo3S3I3SUJDQ096UXBJL2RNa3d0MEM5SDYyc1FXMHBE?=
 =?utf-8?B?TDI0d0hra3hvYnpwVVpZdWRDOFIzVEJuVkhRZzQxZHlBUmtNdk1Gcmh6ZjJX?=
 =?utf-8?B?VFFvSFhUaVIvL0cyd1BWdkYrdDJUM2FXdldlWHYvYzIyYmZ0WnpHTlJMUE5j?=
 =?utf-8?B?UXMwRTFoTUY2a0c3bXNQc2ZIaUlEcXNGMFFYTXhVZGhuRWhPMll0ZG92ZHdB?=
 =?utf-8?B?Sk9PWlF2eS9jWFJ2c3kwTHJMU2ozZEZaMzl1MTRZQ0luekJwcWRZaHV5Zzdq?=
 =?utf-8?B?RGdSZ0ttQy9VWXpUeTBUelN4cHBGMU1JdWc2d1RoWWxyZ1FnRElDMWJzYUNX?=
 =?utf-8?B?eUwwckhTRG93RkFsaUxMbU5nMUJQOTBJcTVORFllZkdjYWpBNTJlZ0h5Uzdn?=
 =?utf-8?B?UU8vZXB2OW1Qc0JsLzdNb1VyeFAxZGNoZE14K3FCNGpXNUlSYWhYczZSVkhu?=
 =?utf-8?B?ZFladFRvdE1CYUtKeEtzaStWYjArTjdoV3IvK2E2QS81SXpKSUZwbnM2MFVN?=
 =?utf-8?B?c1ZEY2cwa1pwaHVZRDdXekxqQld4UTBJM2ZEbnFWNjc3Q0tRMXBqUS8rbWo3?=
 =?utf-8?B?M3BzMExiR1NZanp5WXpGSFlKZGdZY0pmOUVoRS9vMVMvQ0FlRnJaL0ZzdXk5?=
 =?utf-8?B?R3dQVUk4MFhFYzI0YmpMdmNZTkNIcWJoMVBBTVRYNzVsVUNva1hQMFpqSDV1?=
 =?utf-8?B?K1hWNXIvUEg4WUtjK2VOVG0zS2pNTjJxMWFqRTFPMncwZlB3dHl6MUdQK1Fq?=
 =?utf-8?B?MVgrVWFKNFJHSFB0ampYd0krRHNFVjBpSUFMUk1TYzZ3aWZNYm5Fckk2RXox?=
 =?utf-8?B?Zm5GRHFTRzU0cFBkWFBkWXMyaW11ODdnY2Z1OU5yWUsvdk9nZVRtUE1wZDlH?=
 =?utf-8?B?WTRtMGdSWHpHWHZpNVlMTVV3UVdOY09ZQlNRNkF6bERTd0s4WkQ1d1dWUHBX?=
 =?utf-8?B?REYxcGZDZFh6K0gxVlp0KzFrSGZaNkduUUl0UnQ3VGFXME9zWmZmc29PTlUx?=
 =?utf-8?B?eU16dkNCUnRMSmNSY3Rjc09uS1JzSkthcXVPWEdGTjJzMkJyUE9rWXJKb3Ry?=
 =?utf-8?B?bk52MTExS3RhTVZnaVBWYm9zbXJKaXliMVdMWGxGdG0rUjM2ZDN5WllvWHMy?=
 =?utf-8?B?QUlCVitUTFh4OHpmMXl6QUVJNURYck4yVytRZGozYXZGYndlU3dGeTMycUV5?=
 =?utf-8?B?bXpreUtrc0s3cmloRW9UeGIzU0VyUERxaUJEZy9VYno5bGk2SWplSS9ONXZF?=
 =?utf-8?B?VTZudXV5c000N3hCRlBySldWcDllMzFWV0s2SWJQQnAwWUpnKzlCck9HTDkv?=
 =?utf-8?B?Q1p2MjBkMi9mbkx0Q2JhQXBGZUNCcTBWVFY5U1FyeVN2blZ4VGdodTFxbUcz?=
 =?utf-8?Q?6pcR9QIReXW8CB9A=3D?=
X-Exchange-RoutingPolicyChecked: jLyP6yRtwtFwDKHGp0MUvnnpuchnxQtY3Fl8y/qWiTZ3ZufoehyQNwV5u5Z6XNqGMInM9xvmiKpwX+IlMWc3Gxi4bRcTbWczlAXIKxdS/+F/Fmok/MtAuc2sgscOE01Q33g/cpXiwdtwik9sAyeEAi1eDWaSX1DmVgmyyyBUs1OxF5EXA2GdeySnT9jXbQwBvNBrUlL8B3cJOXrmWNTeAUfJabQ1q2ldDQMRJekb3/Ix18zwOEEEI4/6pw3slxKyIBvBcvjBuGY7Z1wgDxERwd8nvKsB3VgrddY8P9Nzxz6NsOADbRZYXtcs3Vz9BckV1DI5tbonisCn0wEoq72BXg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 20749ed7-9b4f-47ab-c46f-08df396e7542
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 05:51:08.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uE3SFiccx5eAV9KS7+6lWd1qX6GFVGsCzGTqNaTcBjkAAdVDgIoeaiYBlO2CspmaFNk7Pj23d4g76E+Z5+Z4FnysKTvHeg/8Ir6UQbMbk2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF97A7CBDC1
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/31/26 2:46 AM, Jinjie Ruan wrote:
> Busy RMIDs of a monitor domain are normally released by the limbo handler
> once their cache occupancy drops below the threshold. The handler keeps
> running after resctrl is unmounted, and  each RMID left in limbo retains
> the CLOSID it was allocated with.
> 
> When reading the counter for an RMID in limbo, the architecture translates
> the CLOSID associated with that RMID into a PARTID. On arm64 MPAM with CDP
> enabled, CLOSID c maps to data PARTID 2 * c and code PARTID 2 * c + 1,
> so the same CLOSID selects a different PARTID depending on the CDP state.
> resctrl_unmount() clears the CDP state before resctrl_fs_teardown() frees
> the groups, so an RMID left in limbo is read using the CDP state of the
> next mount rather than the state it was allocated under. A CLOSID from the
> upper half of the range then produces a PARTID beyond the MSC's range; the
> MSC raises an MPAM error interrupt, and mpam_disable() disables MPAM.

Could you please start the problem description with a brief description of the
scenario? As it is written it is not clear what is meant with "the next mount".

> 
> Move the CDP disable after the groups have been torn down, so every
> CLOSID freed on unmount is translated with the CDP state it was
> allocated under.

Above is a brief statement that appears unrelated to earlier problem description.
Does it aim to capture some other problems encountered with existing rdt_disable_ctx()
placement? I think MPAM is fortunate that it does not use CLOSID in 
resctrl_arch_reset_all_ctrls() but from what I can tell the per-resource group
rdtgroup_unassign_cntrs() may also end up leaving stale monitor configuration
behind?

> Keep the RMIDs in limbo instead of forcing them back
> to the free list, because a quick remount would otherwise reuse RMIDs
> whose counters are still dirty. Pause the limbo handler while the
> filesystem is unmounted. At mount, release any RMID left in limbo under
> a different CDP state without reading its counter, since its CLOSID no
> longer selects the same PARTID, and restart the handler.

Sounds reasonable.

> 
> x86 RMIDs are independent of the CLOSID, so the CDP state does not
> change which counter is read. Only arm64 MPAM systems are affected, and
> only when CDP is enabled with the cdp mount option (CDP depends on
> CONFIG_EXPERT).
> 
> Reproduced on QEMU:
> - mount resctrl, create four control groups
> - unmount, and mount again with -o cdp.
> 
> Before this patch, the limbo handler reads the counters for the limbo RMIDs

(nit: please never use the "this patch" term in a changelog - this is by definition
a patch and this term can be a trigger word for some).

> using the doubled PARTID:
> 
> 	mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
> 	mpam:mpam_disable: MPAM disabled due to hardware error interrupt
> 
> After this patch the RMIDs are released before their counters are read, and
> the same sequence completes without an error.
> 
> Rebased on the below fix.
> 	https://lore.kernel.org/all/20261031063634.1678345-3-ruanjinjie@huawei.com/

Information like above rebase hint should not follow a change into the kernel
and is best left below the "---".

> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.3.x
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Dave Martin <Dave.Martin@arm.com>
> Cc: James Morse <james.morse@arm.com>
> Cc: Babu Moger <babu.moger@amd.com>
> ---
>  fs/resctrl/internal.h |  1 +
>  fs/resctrl/monitor.c  | 60 ++++++++++++++++++++++++++++++++++++++++---
>  fs/resctrl/rdtgroup.c | 31 +++++++++++++++++-----
>  3 files changed, 83 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 1c85e06f09bf..ccae796a1489 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -373,6 +373,7 @@ void closid_free(int closid);
>  int setup_rmid_lru_list(void);
>  
>  void free_rmid_lru_list(void);
> +void resctrl_limbo_pause(void);
>  
>  int alloc_rmid(u32 closid);
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 2002c4af1a5c..292f7f334b4c 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -70,6 +70,16 @@ static u32 *closid_num_dirty_rmid;
>   */
>  static unsigned int rmid_limbo_count;
>  
> +/*
> + * @limbo_paused - True if the filesystem is unmounted
> + *     The limbo handler must not read counters until the next mount has
> + *     set the CDP state up.

Is this new flag needed? The description "True if the filesystem is unmounted"
could be a hint that it could just use the "resctrl_mounted" flag
similar to how the MBM overflow handler uses it?


> + * @limbo_cdp - True if the RMIDs currently in limbo were freed with
> + *     CDP enabled.
> + */
> +static bool limbo_paused;
> +static bool limbo_cdp;
> +
>  /*
>   * @rmid_entry - The entry in the limbo and free lists.
>   */
> @@ -350,6 +360,8 @@ static void add_rmid_to_limbo(struct rmid_entry *entry)
>  		entry->busy++;
>  	}
>  
> +	if (!rmid_limbo_count)
> +		limbo_cdp = resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L3);

CDP state cannot change after resctrl mount so this runtime assignment
on each RMID state change looks redundant. It could just be set once on
mount? More on this later but I also think the !rmid_limbo_count assumes
an MPAM underlying architecture since there the rmid_limbo_count will
always be reset on a state change during mount. Having limbo_cdp gated
on rmid_limbo_count being zero may thus not behave the same on all
architectures.

>  	rmid_limbo_count++;
>  	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
>  		closid_num_dirty_rmid[entry->closid]++;
> @@ -852,6 +864,13 @@ void cqm_handle_limbo(struct work_struct *work)
>  	 */
>  	mutex_lock(&rdtgroup_mutex);
>  
> +	/*
> +	 * The limbo state is kept across mounts, but can't be read while
> +	 * the filesystem is unmounted: the CDP state may have changed.
> +	 */
> +	if (limbo_paused)

Could this be if (!resctrl_mounted) instead? Compare with mbm_handle_overflow().

> +		goto out_unlock;
> +
>  	/*
>  	 * Ensure the worker is dedicated to a CPU as intended and not
>  	 * relocated by workqueue subsystem as part of CPU going offline.
> @@ -991,6 +1010,8 @@ void mbm_setup_overflow_handler(struct rdt_l3_mon_domain *dom, unsigned long del
>  int setup_rmid_lru_list(void)
>  {
>  	struct rmid_entry *entry = NULL;
> +	struct rdt_l3_mon_domain *d;
> +	struct rdt_resource *r;
>  	u32 idx_limit;
>  	u32 idx;
>  	int i;
> @@ -1001,11 +1022,37 @@ int setup_rmid_lru_list(void)
>  	/*
>  	 * Called on every mount, but the number of RMIDs cannot change
>  	 * after the first mount, so keep using the same set of rmid_ptrs[]
> -	 * until resctrl_exit(). Note that the limbo handler continues to
> -	 * access rmid_ptrs[] after resctrl is unmounted.
> +	 * until resctrl_exit(). The limbo state is kept too, so that dirty
> +	 * RMIDs aren't reused after a quick remount.
>  	 */
> -	if (rmid_ptrs)
> +	if (rmid_ptrs) {
> +		r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +
> +		/*
> +		 * An entry freed under a different CDP state can't be read
> +		 * with the new one: its CLOSID selects a different PARTID.
> +		 * Release those without reading them.

Please refrain from adding architecture specific comments in resctrl filesystem code
that aims to be architecture agnostic. Since MPAM support was added after initial resctrl
design the "CLOSID" and "RMID" terms are "baked into" resctrl fs with known 
translations added by architectures. 

> +		 */
> +		if (resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L3) != limbo_cdp) {

Here I am not so sure since I am very unfamiliar with the MPAM driver. It looks
like the problematic path in MPAM is gated by a global "cdp_enabled" flag that
may be set when filesystem is mounted with -o cdpl2? Could this mean that
this test would not accurately capture whether MPAM driver uses the "cdp_enabled"
flows?

Apart from this, should this be gated by a 
	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID))
as well as a check that LLC occupancy is actually enabled?

(
 ah - looks like sashiko agrees, could you please also check the sashiko
 feedback at 
	https://sashiko.dev/#/patchset/20261031094616.1691026-1-ruanjinjie%40huawei.com
)


> +			list_for_each_entry(d, &r->mon_domains, hdr.list) {

list_for_each_entry_rcu()?

> +				if (has_busy_rmid(d))
> +					release_limbo_rmids(d);
> +			}
> +		}
> +
> +		limbo_paused = false;
> +
> +		/* Restart the handler for the domains that are still busy. */

Switching to resctrl_mounted flag would mean this needs to be started later, after
the flag is set. Doing so has the benefit of placing it with the code that starts
the MBM overflow handler that centralizes the workers.

Thinking about it more - there seems to be a lot of benefits with such a move and
may avoid needing to move when setup_rmid_lru_list() is called since removing the
entries that no longer have matching CDP state only needs to be done before
starting the worker so this can all be done together, after setting resctrl_mounted?

Could there perhaps be a new function that initializes limbo_cdp, releases limbo
RMIDs (if needed), and starts the limbo worker? This function can be called from rdt_get_tree()
after resctrl_mounted is set? I think this could simplify this implementation.


> +		if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
> +			list_for_each_entry(d, &r->mon_domains, hdr.list) {

list_for_each_entry_rcu()?

> +				if (has_busy_rmid(d))
> +					cqm_setup_limbo_handler(d, CQM_LIMBOCHECK_INTERVAL,

Why is a delay needed here instead of scheduling it to run immediately? 
With this delay a user may unnecessarily need to wait a second after mounting resctrl
before new resource groups can be created?

> +								RESCTRL_PICK_ANY_CPU);
> +			}
> +		}
> +
>  		return 0;
> +	}
>  
>  	idx_limit = resctrl_arch_system_num_rmid_idx();
>  	rmid_ptrs = kzalloc_objs(struct rmid_entry, idx_limit);
Reinette


