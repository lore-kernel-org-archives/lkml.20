Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793380199;
	b=T6LZA/PJTDpW6j2ahWNZ1GtjHNXCMIOhPxjQUq+NIq9ulmQysR4GVE6u1S472YjPWo5A
	 txXrYNS6nTZwutTkEdD134mj6zDbaBAtMmFi/D1C4JFATusaI0WpXvHiNxpr2mR1w3JdV
	 X77WPhQ7240rTBTnycGQxChsBb7DHQ/qJ2ILy+U9TxjvLZCVZsa4Ukw8hG8sBrgRPca0Q
	 gYGLia/Di7rLKNmFmiOWaS+gCv7VQTOZmywHCN1HsznalqYsjD/pdoUxIyvzgh/eU+kWr
	 +tpw292wl1UNu9PlESigmXqbWOpeIbBPn2ypCuZ/l6mapFLjKD8j+8BosfmwgKZcWvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380199;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:From:Subject:To:
	 References:Content-Language:In-Reply-To:Content-Type:
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
	bh=H/57nvo8MTnqlDnt44LPogGYFeVmELDFWIZIKo68k0s=;
	b=1Wl717VFgvA1vEuUn2cFjWExhT0JImBG/AKxnn39tHNKZxlNr6s6P1YJ8ZCTxmWkCS4c
	 mBSPy8CwVipMMstkwdNYtGbobHorhL4QXoI87Nom9+r19RACQh7PGj1xd5Sinw1x07j4B
	 BW+RGPhYpG/xEtbYvEs6JDQXYMM+jKcrDNyzOmU6Zl1WrueSMy19dg1ZvjPGfb+SlDHBC
	 J+JHyg0W4SHgv9yUJTeEbTZqdD8KRF1677k7REZhYQ3JHs22rugij/wtFwwqCiG18L9CT
	 P5GlY/wzoTuEXKi5YDDupptgrm/GJ+ZiCCZlEJ4CvE25H8KK/X/erWxPVf3ClFltNPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YpuK7GhD;
	arc=fail smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACB4606A31C;
	Fri, 30 Oct 2026 17:09:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DACB4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YpuK7GhD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793380199; x=1824916199;
  h=message-id:date:from:subject:to:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/1Qs/kKk9jvMWJJy3gY8MF2maNgpjeAgnndTg32EjHc=;
  b=YpuK7GhD3PBLBOb6hKJ80VP8HFy7Bh4oJR5HXYbG2HJ/qqb2ResSwsaH
   vXyqdjJURVe6fjS4MdlPA8o3RQyK7InWEYR63yD0Gb3tGbaCoeEqW8UIc
   jX0lSuezxfHdoXDDA5Gjd4xOy3f82h4fzIjxlPBHSg4CiVrxlcjJI4IsY
   b10CSrpsI7+igyvEtWsHJWR7j//sOLIJ6NzHq4rvQl3me+de9SSvSQULY
   4x6IUe+mB8yAWo5ub3P/VgaO5CCfL8mWYspqf8AKeHuKpHH9AYYO3Bpju
   4bNh3+QqObMqtMTKBO9NUuMNvAQtvKCHo46vbB0+IcuU8QSGpK/B50Cs/
   A==;
X-CSE-ConnectionGUID: ghhWl0zsR62HFAOlc2juEg==
X-CSE-MsgGUID: pOtIRFnMQkWTqT/vhh4pdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2144119"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2144119"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 10:09:57 -0700
X-CSE-ConnectionGUID: fmr70KBSQcOravwcHcpvsg==
X-CSE-MsgGUID: mrroDinkS6KjchgrJ/FqqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5372957"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 10:09:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:09:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 10:09:56 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 10:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJJlrvVGKEhKgohnknTFkXI7mYdjYxl9Ji+hCS7equzr5gOna336bK/ef8ieQHj+++U1UhIJ3uixgxEZT1G76t364vxERniiqDVvBYANRHaZ9X+S9Lh2PT2qVGbDtnjBawIej9Rq8WBoNegycEsLxCbCN/U/YoSzqCVBqS7E5qCCgUjeVNhWkSnOqzR+NOz15gNLRllDSxXHymqkY0kwtaHcodDCpDy5HrMDYWr8NrV2m0Z3cbyJCQmq3ugmPsuDE5Bb5IanNty9s0xBlXqZ0wbeO4Q2a8gC9PNct75ge2v/favnmAzwtEvMm6vjylBXTqRqaUVV3JKIlAsTwmBaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/57nvo8MTnqlDnt44LPogGYFeVmELDFWIZIKo68k0s=;
 b=xm5BhGbeIy3GwA78Do+P9/mS2/NXKTH35zpBAWGsxClAPrF82K5w2HhSrPjZ1A23cmvkSwqR70upR/civEOAZ/F7n0VPFVKSKEw6NusfofUQRa3HfkGKRMlbLJrGVP5mso9Lbw0BmF1ujaAUzrAbSZi4BgmYODSd9d96kl3GyYDHnmCQfX7oy6OW+z6OFkXnC/mj0vEZ0HXHlLnsRkxVgr4S/hBRBSic8vhnk4MLBwaGqJQJwi41KdWntw3gDt92xDn9yxYVAIwrV/fNBw6hHgf9YfqJbA6b5mK1vNupxFsqhyK7pGxi/x9dfQ87Xur0NSiOcLGmMlMqEsDY+WimsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH0PR11MB4917.namprd11.prod.outlook.com (2603:10b6:510:32::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 17:09:52 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 30 Oct 2026
 17:09:52 +0000
Message-ID: <d4a54429-7d45-4936-b5b3-06d8fa8545ee@intel.com>
Date: Fri, 30 Oct 2026 10:09:48 -0700
User-Agent: Mozilla Thunderbird
From: Reinette Chatre <reinette.chatre@intel.com>
Subject: Re: [RFC PATCH v2 00/19] resctrl: Generalize monitor events across
 resources
To: Jinjie Ruan <ruanjinjie@huawei.com>, <james.morse@arm.com>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <tan.shaopeng@jp.fujitsu.com>, <jic23@kernel.org>,
	<zengheng4@huawei.com>, <gshan@redhat.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
Content-Language: en-US
In-Reply-To: <20261029123611.1108424-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:303:b7::11) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH0PR11MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f8d6aa7-29d3-4d8b-cd1e-08df36a89cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|921020|11063799006|56012099006|261009223027099003|261026121527099003|261021121427099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: GYNoFA/IbKHcp8+Ea3TBssBSH5c3mw13hjiqMUvvaXOY/TR2Uvn/nRW5XwHmifeFXW9BvuQq3CZlmqyjgHVgVyKESHgY+4bkHFmA7fwilQWZhc94XGaWgeRw6MsZRX4u33hdzOeSZNRAiiGvHDe6NBIDqGxRzXj6s8v8FEW0IwOr7MXiP0dzROiauJkgRMCtbSBMvLcy9JIA7oXeYpccw20NnMZem/yaKpE+LzaHztCVegRTRb16X/Fj8e9hdWVAm+xIVYU2MsAMz4jQhHKFMW72RTXiBMXxKUGzBv6GN8dYqBE14Tc8DUxiNc+Ga5mdT2QHgvkzKr2u79WMMJmnnLDAE7oEjxZttf4Wypj7nHvjs5F4W6L5/EhNcXTTm+ol1t8766GXKqQDEMVUldodVW2A+7W8I6IPFChVOpSGzY9bJsxQdgGnw2edQiVcyf7YBmHha7hgyI2PluR8puMPtu8MFSNQp45og2rZ0Nfl7U/1+uO+bfpSe5aSE0tRTPqQWsjxTUjW71I/gDy+Iq3BYuUog/0Jn06qSMaIPS9zHmFJvZfknGedKUDlZ9W9CwbirhPH3ebNAJo5nZB4PqQIXa+uo3Di1qdWxX34s7zeN4RKvaeLnkErgIEg/MpK1mgWqHPOX+H6xsJqNgjHlmyoVzIEorytFhy5vy5aA9V56AVdyDOS8OmJFpk6paJEIhSs3ZQF7RrdYZpNT6PMpR3f6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(921020)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDdGd0ZQaThtdk5Ddmg0ZXk1RFFqYlpKclBGdThLYmhFVGJSR0hTeEVLc2dB?=
 =?utf-8?B?NG5oRFFCSi93OXFTZGpSYjVibXBBU0hpeXNpV2JpNWFndkFpb29iQ2ROTkJQ?=
 =?utf-8?B?ZzdiSWVhb1BrSnZsSzkvTGJnUVdzQXJRMkJvTVRFWUxXdVRLUEx6NE9kKzJC?=
 =?utf-8?B?N3doOG9KeWlwT01uazRjWkIrL0ZuOVV0aVNmNWJ1ZTZmVjI5STZ1MVc0Mjc2?=
 =?utf-8?B?cDVuOTlDU0lKSmZDNWx0K3lNTzJaUEtZazJmWkJ0OUE4QjZlZjRvWWRMVVhY?=
 =?utf-8?B?VHZYSUtVTlJHZWtxc2RDdE4rMlN2NXJmRnl6ajhnOUpuVnFXY3NheW5nTGJo?=
 =?utf-8?B?RGNvWGNETldIM0UzRWhPSjdQTnllWWtoenhmK001N0ROVTNiaEUxMlo2UTFE?=
 =?utf-8?B?QTFqOEpiVUF2SjhOSE9pa08yVGU1cWVRTEpLSXYxSy9ybnFFMlN3ejVKck9E?=
 =?utf-8?B?MGlUQWEvcDdETXhHYWd0VjlBMVZlck9SSmhnb0FOY0Qxa0EzUEI0QVZaaFd5?=
 =?utf-8?B?Y2ZxRVFEa1lRUVpMTWZISmJwc3oxb3J2NFQwQWFKaW40OVQ2VU52K3BIUGdw?=
 =?utf-8?B?R0VkV2JYdU81aWdpSFdFeFd3VDlxSDNYTXBuSDA4VnR3TzExcWJYdTd2am1a?=
 =?utf-8?B?QzRQN1FOVUNkNkpqbWhwTnU3M3J4d294bzBDN0NCVktKYm8zaDlLaS9wU0dY?=
 =?utf-8?B?TW43VW5VV2taWVVUeVVWUGZzLzk0NTcxQlNuSytsclZMMjM3V1JETFhHTlV0?=
 =?utf-8?B?bmw5ai9QZGNMUG85RlRnMEltT1cvMnNiaXErZEVyN1p1VUZva2p2Qk1uWVJW?=
 =?utf-8?B?NnZadGxyR3hRVi9BR2h3MklVZkZOODFLenJ1Mis5MDVjUkJoNXljVENtWXAy?=
 =?utf-8?B?WERMcHBmZi96SGNaYWl4bXRidGNSSUQwN09HTlBhVTU5bTgzbER3MHNvVnox?=
 =?utf-8?B?eG95ZWZvTVpHU0ZrSTc2YkxVN25KMlcrTnI1Q2NHR1p0bkRQRU9PNzRYNE9B?=
 =?utf-8?B?aERmZldYTllMa1FDQTNFaGM3dnRpUXVjUXBUUlhFUmRqMERLNlhNSmFFZFdN?=
 =?utf-8?B?VFl2WHFvZngrRTJQalJXSUIvbkQ0bktuQVkrY1lPUUxsQXB5MzJZY25VWHoy?=
 =?utf-8?B?dldGQW50SlRNMm9SaWw0U2JaWWxHaVlCZ3VoM2hrSFZaNmdvdEt1OUUzVGs0?=
 =?utf-8?B?WG5JclA4VGwxajJ0MDBlZ09HK1FiOWVBT0JFdUtkZlBUWUFtK0UwKzZ0a1pK?=
 =?utf-8?B?WnhzWjdKOFAwcnJUNkpOSlJ5dlBCMjRDYllrbnVKZ0MxalBTOGlmcGk1eXNs?=
 =?utf-8?B?ZHhSdTNBdm9CZzlhUkdGMmtIdWZuajRDWDlIWGZGc2ZqRkN6NkVZZ1I4T2N6?=
 =?utf-8?B?TzNNckVTRnJNb3ZQS0tQZUhDNXp3QStmYVJqK3lxWldrR3pLNXlmQTFxUWZm?=
 =?utf-8?B?d1JoUVluSE5FR1pLRmkxanhGM2ZiUnNvV09EUy9oVXdZVEw1b2NFdndGRldw?=
 =?utf-8?B?NGk5dEhHZGlzUm02Qm8wSzQ2WHBZUlJKWVBwWncxNjUyc3BjdHE2QmdRMnpF?=
 =?utf-8?B?S0VXdlE2eDMyT09ETlM1TTBPQnUyVThJZ3BYWXlEMk53bHhWUUk1elgyZWpn?=
 =?utf-8?B?SUNTSWFFclNYa2ZseTA4MDBENi81YnE5MHgvVE1neGpaNzc0Q2N1eUZVd3k4?=
 =?utf-8?B?SW1VZzNHdENrZXZ1K3hKckRlSXZzczA0d1pzTFRJSXhZdlkvL0VHSEFqQWZo?=
 =?utf-8?B?QjJKdDlOY2tvWlJXMmpWZ3FOV21ST040UHlHM2NYV3hCZjdyZ2hQQVpmbm94?=
 =?utf-8?B?ektKd3ZLRGRYWW9UYXpyeC9BZFY0QnZzcTBRNnc2K0RTWnJWU3dYZDRGWlJE?=
 =?utf-8?B?VEhmZkJYQU1oOERkb3dCOG1EcHJVN1pBUS92eGRqSURVYVNNL1ptQ0x4S1R1?=
 =?utf-8?B?NTFhUHBsNEdBVnMwVVhQdy9JNFYrWm5MbHVKcHNTR0F3ZnNVdUtqcnpsY2Z3?=
 =?utf-8?B?RE9sWVFyNU9Ba3Vvek52dWJmSTMyUGRqK0VDaXlWdDBmN2RDR2NUdEZVTi9U?=
 =?utf-8?B?bms1NUVzSnR1cG5OU2F2KzZMemJuS1dSeStPTndja3JuWlJQWTRSays1ZjhR?=
 =?utf-8?B?b0Z4SldIcjFhaHMrdGpudFdPOElya0taZTVLcHlMcjQrUGI4L0JLSUVpMHp5?=
 =?utf-8?B?U2pDc245d1hadVhBd2lhNWk5N202Z3VabVMwM2dKb2VaNXg5amwzcUR3TlNX?=
 =?utf-8?B?S1V5QzA4SjFyR3BpSWlTcmVYdWt0UzlJQ3BvKzR1ZjlJT1FqNGI5QmpsaEp4?=
 =?utf-8?B?eDYxUzJqUVlmQVBmS3EzT0p1aXU0M1NrZGx0cjJIcktPVnNGU0tjZjMzV1l5?=
 =?utf-8?Q?uF557SPw8m4rTFBc=3D?=
X-Exchange-RoutingPolicyChecked: CP4f9tUpS8xkOWRoPrnQRx4JnCdzA8RCpm59EqlAr5No5sn2x5nP4BMBqXi4ww134/sUYwoeIeBa3sI4jtljmIxMdyF2pjk2Cm5TSAmDqKwdWN0ZV8cZzenNgv1nyEmMlCVb6Y5IBBaryvVUKPxd7uIagXZYHAz/tN+JIoHv57/WfHEUma9H1I+HNRkLF4eulBcFQ2d3+/hi55sLbLszp/hfnLLlCm96ZIFtkGR1XKrdBYeaoUYsBYh+0cNrP6mYEV547Y83KSjKhssi7UgBHbeDWbLKT5ztnzhUrwbP/tdUDTXFj7USDobS1hsfyyWUIm/BX5FzOuv6r9HDO7NNHQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f8d6aa7-29d3-4d8b-cd1e-08df36a89cae
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 17:09:52.2032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4wSXCnFrqSUtu8bx3wvOAkdZkeoGwAZmGqusCo8JiMHf/UIg14cgmlJUkiEmJ/AjcusIofOsM5qWOpAiL+GLnDEmArf1qMhPvMbRHZD8nI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4917
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/29/26 5:35 AM, Jinjie Ruan wrote:
> Resctrl only knows about monitoring at the L3 scope. MPAM monitors are
> attached to a resource in an MSC, and firmware says which cache level that
> resource is. The driver already finds L2 monitors, but resctrl has
> nowhere to show them.
> 
> This is not MPAM specific. RISC-V can also place monitors at several
> points in the system.
> 

One key to this is in the first sentence of this cover letter: "Resctrl only knows
about monitoring at the L3 *scope*.".

When it comes to exposing monitoring data to user space resctrl has been using "L3"
interchangeable as resource and scope. 

The existing resctrl user interface already establishes that the "L3" in
"L3_MON" and the per monitor group "mon_data/mon_L3_xx" refers to the L3 *scope*,
not the L3 resource. More specifically, consider the existing user interface:

# find mon_data/
mon_data/
mon_data/mon_L3_00
mon_data/mon_L3_00/mbm_local_bytes <=== monitoring data associated with MB resource at L3 scope
mon_data/mon_L3_00/mbm_total_bytes <=== monitoring data associated with MB resource at L3 scope
mon_data/mon_L3_00/llc_occupancy   <=== monitoring data associated with L3 resource at L3 scope

Associating the monitor events with the L3 resource was an implementation choice
that was convenient at the time. Since L2 can similarly be used interchangeably for resource
and scope associating the L2 scope monitoring with the L2 resource may similarly be convenient
when considering how to support L2 monitors as is done in this series.

Even so, I do not believe that associating monitoring with the resource will be
able to cleanly support all MPAM monitoring capability. Specifically the upcoming CPU-less
memory bandwidth monitoring.

As I see the plan at this time: CPU-less memory bandwidth allocation will be
backed by a new MB_NODE resource. For these systems the expectation is that their
monitoring data will be exposed to user space via NODE scope and will appear to user space as:

mon_data/
mon_data/mon_NODE_00
mon_data/mon_NODE_00/mbm_total_bytes <=== monitoring data associated with MB resource at NODE scope

The cover-letter is titled "Generalize monitor events across resources". As I see it such
generalization does not prepare resctrl for all MPAM monitoring capabilities. Could this
work do so?

Reinette
