Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793039514;
	b=5po7BHlsKzlXEskDqzH9orQ+66n3BiruomNOJ9YgjKzey5/TKNlgufQfHcfv6hQHD5we
	 ZvEr/f16BexNSM7Lehp6XSduvG4d02X96P5FqXSP1zLNjUxBvgo5cZdqMEZf9CHkTTy0b
	 vDNeoqGQ1F9iTVzLl8Of1YoH2IMho8WVYMgWuTDPVyEcvnBnJXf++FbuAnJgDkjz6u2Y+
	 djdMv3wjEgVkrd9MrQqpNvWJj5yM6RjX4nDfqqYeqBB9vMEOUGjGw3kciICF0q1q8jgNm
	 73/gOxZvXaiSWwwdB9+DPMVxg1yzxX20Dm47x0c9CrWmAA37NTM1AaViTNVy2deWIYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039514;
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
	bh=J4uMOAs/9gA40Sa9kSWHRf2x6G8sei7ls4DgFpRUCFk=;
	b=1i7w4bM/tNbcnGhdmBmLqRnmy7iDlzXw8qI6Gq+IZVqET7EG+X0EnL96rKUSyV4vcu9M
	 aCrkVYeK2dZDZXay8gBkCJgwbw8UG8eEK1VpQspLghd4x7ZgD3GkYJ0Jmhy1bxK0LkPlT
	 wdrPPs7AMFhqFbd1XNNl25maC5T/rVd/EynFzGbpdUPYHiEHKg3LyJP4wstYYNAqsaqMs
	 FojDrYaya9ESisTZ1C/rODdHM9Jb/RqQO6zmW7ts2IoCAZqImB9zKjRR7lB1QzZBliovT
	 8g/m42Ygt1H4GOA2sbBWxz1t9PiwAoxI8DyjQDpBUPcu0h642zc8avJ0v0IVJgUzUXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DtLm3av+;
	arc=fail smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B63606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34B63606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DtLm3av+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793039512; x=1824575512;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6ejHD6D7ZLnz5zLfLoBIFKmQwsogUHVK3YVrZfsMMCM=;
  b=DtLm3av+Tl4BxXR5EHWZmj2a4tk/tyrAdzUgi0r1kduQ7qnf5fCRpVc1
   iYRLCAS86EFHs63w4ITwZ+fxQr/zthYktwZJZnu5PvDVRtRBdoZKaZJQY
   tu0mQcXEgjomc+UOSBCUbI1qrlb3zDgIHxOOxJIa1yhwMH3zozr/XUwBo
   E9gITWB+QdD8zERuGoXwsaM0Q6UTDCqN5YMzq9xtaPH5OIJCW/SGt7yNj
   ayLHuHoHwXPZl3MRIorU6nRxkxpFoCzwCMWQfufOZKWxLQ0aTpPtsqTsd
   Z9W9FxdkSiqkP525G7ve0MHrBOS2wA+4QztxHtvpnFWib+r9o+nl7U7jS
   A==;
X-CSE-ConnectionGUID: Ljhf1eMKQjamjfpUJEerZQ==
X-CSE-MsgGUID: K8/JJigdSQOnY8YWfk+zrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1748269"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1748269"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:31:51 -0700
X-CSE-ConnectionGUID: h9XI1Q0sSOWB4dh4LnCR6g==
X-CSE-MsgGUID: mNSpm7XgQmeHpib8Rng4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4694840"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 11:31:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 11:31:51 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 11:31:51 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 11:31:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rq9vmzip0NgYGFx2ZQ5/8/1b5gB6ptIGBuhwnSIq6xDSu1eomAxPG1qMzmyr5M6kcTptbcyoOTFWvfL10kmmNqDRDlqX8VIplS/DaHYPodtP0Jm6YrvdrbCVVPYzQuVVY6KEoi6B6vlg5Mjm5mqYcmczEILIQE3s8krVSsaa9EqMqtuDPDVP09Ps082cKiu+p/sI+u1xEhYfrCGVwB7nZQ0OcDA4336VUesHxNbsyonIYStIUoLjqUjTTtaZKVU5PLWSEDufE+33CmrddBk8UeQoFlWMaLIwfIo0PkZO4DBeNeA/XSehjhyI37pK8oMrMw3w/nmCqs5N0WAs0PPioA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J4uMOAs/9gA40Sa9kSWHRf2x6G8sei7ls4DgFpRUCFk=;
 b=fh99EwZA0NXb+zDMWCcXaZ8nAme5+SHCVhzT4ctm1qH9Z8VF55umhSq2l4ftFZMPvQ9I+gQJ6asXhaoL2etrjePFyVcZu0CaLgKLN1AItzcELG9Z9fe5CRnF2l382Hp+hazzPJvAfK5AFF6UFW+HZ5LcYQ+3RDdpkX3DwdW9Gkx978ZiXBRsTCEvKWe0NXYDvIzV98SgkNYitZL59j7Q6dNIc/difZzHWoUgUS93F0AzBVfM5SXSfgL8WGBh5OfNZGm7LJ8MHEEj5mNjyW0aD+R1Gsd8RA+2LIu7cNwt/Q/sVYzGXYHr2MZhOnxF6bxrGIVVkwxqsO1w56h2ZP0KQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CH3PR11MB870661.namprd11.prod.outlook.com (2603:10b6:610:367::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 18:31:49 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Mon, 26 Oct 2026
 18:31:49 +0000
Message-ID: <bf5e5341-f04e-4b34-afbe-55294d67d55c@intel.com>
Date: Mon, 26 Oct 2026 11:31:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] x86/msr: Switch users of native_wrmsr() to
 native_wrmsrq()
To: Juergen Gross <jgross@suse.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>, "Dave
 Martin" <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>
References: <20261026141120.780172-1-jgross@suse.com>
 <20261026141120.780172-2-jgross@suse.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261026141120.780172-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::23) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CH3PR11MB870661:EE_
X-MS-Office365-Filtering-Correlation-Id: 10fed4f6-1663-43ac-5649-08df338f65a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|261009223027099003|261021121427099003|10067099003|56012099006|22082099003|18002099003|261026121527099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: O8jggk33rRpYn0tKtvLaGRuk88Jx3m3WgMkT8NXBVqnj0aOy5/04zhSOJrfPCoFkM91yma9HTm6XHG26ouA8JkZdXOrzC+truGZuJv7OUFU7v3mgIHk+6kNVcNmwxZ9mf+5vcfaiq5bJ0ssYvjQCEFngjr5wz3upOK4SkcNuJC2wZBADxxaH/75Vmmh6Mv53TRboN4O1MV3T5/wb64Uxj5bQQ5Iq557qtODKRHJpBtO/Gdh85/kzhWIk2Q9B0sXMtZ4eRstOreHhrGYDCKwHg4eqkkRhl91fNyakCOruku6jlHAxBaNvHv+LW7uWCn/eHLSL+oCK/AjPSLDHCKi1EfYow5qxDDy+pqFBsXJI6vq8fBbi5Vo2q9SrZGrr5d+pFJFWW4ez/w7xPNfoOLu3gVDjXStPYvhUwRWNb8mF2PJaS9YI++1ZO67OAfomBYYW4mwPL/q90cOAr8Y505XYZuxyAbBFhyMf8d2Y868J+EjKmJ6W/VJT7mAk4nfwkqO1GU0MeuP4Xgqu8C8ROph1VGDYgSeFVDHNvYGDZ8I+Dc0H4Me2hleCOBAy/TpFjb2+BwDk5ai7GvfVsRGMYgrFH6XBgtPebvan7zO6y1HPIKc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(261009223027099003)(261021121427099003)(10067099003)(56012099006)(22082099003)(18002099003)(261026121527099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkhaT1dMUHh5SVRwVExhUEFwSFphOG92TzQ0THJReEJ1MHNhNVZhRElYNHE1?=
 =?utf-8?B?QjMvY1czOFNLOHY3QTE5K3k2cTNYM2k0RVVCQ2tlNXlJSTNodXVCZkhTMXNz?=
 =?utf-8?B?TTJQNTllRUplQ0k5Qk52TXcvVVVRUXBvWWtZYUxkdHdvWlJPNENxWlBDU0Zv?=
 =?utf-8?B?VVpaN3lkRUNNQWdxVGQxdlFSVng5dC85ek11Z1FNWFlITm0zRHo5Zml3Vll6?=
 =?utf-8?B?UkdObzFUN04wK21MNVE5WUlzZVROdk8wMko2N1dFaldPV0crWTlzWkt6RmVX?=
 =?utf-8?B?eElUOTZYTFptL2RzSHB3UFZmZGFRQ1RMZzE1WDRJNlVaMmJtSXVqSERxTW5J?=
 =?utf-8?B?dEdRbmZKTDF4OTJvenhWMXlTV21HcXQvZXJKdXBEcXNFRVpKTk0yWFBTNDNX?=
 =?utf-8?B?dndTdzQ5ZU5PZTB4d2cwQkIxUGo0NytyYWY4T3d4YW8wWUVCZVBMTlZzTGJN?=
 =?utf-8?B?Y3VTU3lLekhSQ2xrYmpHM2p0dFhzMVh2SENkWlpmT3duOENlTE9wRndVVENL?=
 =?utf-8?B?Kzh0c3ZvUTFMMGo2dFEvaE5UbGtUeVBsejNEc1hkU056YXc3SE91MHQzM0Zm?=
 =?utf-8?B?dVY5dGhQM2huSXo3Slp6RXdQR1dMUk50OUVBSFYraWwrN0hob1dBblFYbnpP?=
 =?utf-8?B?MjB3Y1dReFZjV2V4NUFkV2NKMGZ2ZitjTjJ2ZEZmT0xrNDY4ZmF2NmpOajFh?=
 =?utf-8?B?bHlaaWtHRHFsMlc3cXFhd0s3cm1mYjBxeEJoNGhraVV5WllPcGxqaEtsQU9Z?=
 =?utf-8?B?SG9PWGtoNFlyT3Q0TkxzMHJwdllMVk5lYjdzTUovTUFwN0s3VVVVWjdwRFZz?=
 =?utf-8?B?U3RweUNJK1FISHRtOVFqSFl4a0VVUlRhTnkrNVBPSG5EYldxVS9lRE8zNWtY?=
 =?utf-8?B?UnVHeEdhWkgwMFZPOUlMKzlDSncxUkpzR2JiZmxBcVNzVFNwQSs2akNUUHBu?=
 =?utf-8?B?VnNadEZxL1Q2WisxTGdaWnJkNUNhSjdaYTlOM3NOZHJ5YWk0a2ZGOGk0bVNo?=
 =?utf-8?B?bFRDS2xvYndzWFZDaXJHc2RTcUZpOGNkakhtMUw5ZGFtUUt3Q0cwSEZOUzRC?=
 =?utf-8?B?SmdGOEQ2R0FRYlFzYkp1TW5nRkIyVlUwbDU4S2c2RGUrK3JKRG8rRGdGVU5z?=
 =?utf-8?B?YVJTV2IrZlFZQ0R1azdIUFJhaTFocXZPSXMwcnVyNjRJMjZOTU5wQ3RrOU5O?=
 =?utf-8?B?OHVMVllRQ3dTSDlLSEh5cnJORWxDTDBOQ0NyZXJrY1dtM1AxWXdMR08rTGNt?=
 =?utf-8?B?QmNzNkxwdjZOdW10Um9ZdmcrczFqWDl3K1daSm52SmFRcjNiY2h3bTNWUkxy?=
 =?utf-8?B?cFJHSkoxbmVKMmNqM0JROGdtMTEycEhLUjVPL1ZqVzVDZUt6UnhtZHVQZzcx?=
 =?utf-8?B?Tm91T2tUdEVWMmRJaExzWi80VzRxd3hSNk9QOVc5bWo0TWhGYjlidFNQdWZ1?=
 =?utf-8?B?bFIzR1dJSVBHRERnOFdFNXJsZHljbERGY1poUGFWcjNpVnNiL1BpakwrdkZE?=
 =?utf-8?B?R1VWU3phZ0g2Z29yV1hmSFRHWGQ4RE5aMWc5VjQyeFNBY0ZVZkNjOC9jSkNC?=
 =?utf-8?B?L3U4M1VBR3VOUno0OUp3RkIxTkxjQ3g0YU5MT1VXQ215dlB2TkpGWUdLV1ZG?=
 =?utf-8?B?TEgzSE1rNUtJb0NYaGgxV0lqbjBVWVlHNzlvdGZsUzU0RmxneGRlaHFGdWph?=
 =?utf-8?B?VEx3UlNlU2JERng2c3RMNGlhYWU2K1RVU0U3UUhhL0dlV3N1Nksxak1laUpN?=
 =?utf-8?B?L1RWdTlGSmM4cE56UjBkUFhIQ3Q5QVdzNTFDeVYxR1ZuaUxyNlI0SzZyV1hP?=
 =?utf-8?B?S0IrTDJrR2pLV2tiYmZSSENUMmphY3hvVW85elprTmxjYlpHb3BGT05DMjdU?=
 =?utf-8?B?NnpBa2dSRHhTa252bUZEUGovY3ZDckgwMFNONzExU3c5TVpzYmhta1N6d1A4?=
 =?utf-8?B?WUlGamVGbnBmVGp6RG4wM2FhelE3WHpVbUVCQ1lhdGZpRlB6cXppaTZIUkNH?=
 =?utf-8?B?REJ1VTQ5K1BzaXRaRGJCNUhlVysvelIzR1Evd2QxNXcyWWNLRlpSTWtSOSty?=
 =?utf-8?B?RmNnR2ZtQUxFUDE0bmxKNm4xdGRJRTEzbklVUFNrajRLUTBCTFpwa01LSG5S?=
 =?utf-8?B?TjhxQUU0Sm0xWE1sbTlwdlBtT0JheTNkOEFVS1ovZGx2T25jdHJEQ2tPZUdQ?=
 =?utf-8?B?eE5OWWI1aUo5eTlGZzgvUDNYSGQ4RXVvaXNGb0dKcjFUUGl3ejJ0WkV5Q0JN?=
 =?utf-8?B?eExDZE4yVGRCNGlmR0xFeGRjUnM4MVpGbUVWaGRiZXVISWpOcjZaWXhKeUVl?=
 =?utf-8?B?SGtWeVROYTkrSDFQSGdEbm01ZDh3SjAyR0hjczY5TTlJOHcyeHd6WnFURExr?=
 =?utf-8?Q?55Iw/h6NId3C3RqQ=3D?=
X-Exchange-RoutingPolicyChecked: Pi9IKSlXPja3JqYic21i6jsN/G978j2yqK+XnLg4CGMYvCG8L2NqUaYIy+ZI+FgvxSgeWbVtPLHAUZfalUGYLbTaQkW2qj0HK7HBmqA0/HMgX4zwOqSqpqijgZUmx9hBhEpDNUafnYBUlnCpxqS6/0ZYDI7j+3WHBqe+U8RWmIq5Bc+9lYLcUBe0IE3VBd1BibSnkQYjrveZ320vzHAFZqzCeiA5jxQUDzfeVAZY5iO0TJ1RgyTEART+Hke+XM5gmur/Zxo7LCtZImuo8kp0UhVqVXEC2L6zoV9nvDqSnk2RsdD9PKavXvhSCdJxzHIAy7RJiMPhqEGuucZm9jTqhQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10fed4f6-1663-43ac-5649-08df338f65a7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 18:31:49.0130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9tDw93kMDb2xuLZHfN/AEi91C70NYAotu49QvXM1ES1aAxpuLtgCFJ7kkltmwFbEfQamZ3gtKezBUjyvSSnX6LHbyG+5cVGJ21IInGSDI5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB870661
X-OriginatorOrg: intel.com

Hi Juergen,

On 10/26/26 7:11 AM, Juergen Gross wrote:
> Switch all users of native_wrmsr() to native_wrmsrq() in order to
> prepare removal of native_wrmsr().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - switch order of hi and lo parts when oring them (Reinette Chatre)
> V3:
> - fix another lo | hi instance (Reinette Chatre)
> ---

No new comments since v1 
	https://lore.kernel.org/lkml/d6239cec-02dd-4b4e-bdd6-2bd6f88d8753@intel.com/

>  enum es_result __vc_handle_msr(struct ghcb *ghcb, struct es_em_ctxt *ctxt, bool write);
> diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> index 0408ac7f66fd..24ded41652e3 100644
> --- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> +++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> @@ -175,7 +175,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
>  	 * pseudo-locked followed by reading of kernel memory to load it
>  	 * into the cache.
>  	 */
> -	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
> +	native_wrmsrq(MSR_IA32_PQR_ASSOC, ((u64)plr->closid << 32) | rmid_p);

nit: The parentheses are unnecessary

>  
>  	/*
>  	 * Cache was flushed earlier. Now access kernel memory to read it
> @@ -212,7 +212,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
>  	 * Critical section end: restore closid with capacity bitmask that
>  	 * does not overlap with pseudo-locked region.
>  	 */
> -	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
> +	native_wrmsrq(MSR_IA32_PQR_ASSOC, (u64)closid_p << 32 | rmid_p);

This one looks good.

Thank you.

>  
>  	/* Re-enable the hardware prefetcher(s) */
>  	wrmsrq(MSR_MISC_FEATURE_CONTROL, saved_msr);

While this change is fine I am curious why it has a different shape from
the other msr conversions you did that use the struct msr to compose the value?

Consider, for example:
	
	commit 4967c466ca38 ("x86/resctrl: Stop using 32-bit MSR interfaces")

I am curious especially since this cover letter note that this patch is based on the
series that the above merged commit is from.

Reinette
