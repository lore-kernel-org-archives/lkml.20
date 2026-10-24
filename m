Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792802365;
	b=dP+C9rht8ZA7k1q363I8pK9Ms0Q+rjON7np/DS6Q6nYQ/7ercp2g5HN6U3pnrKeiGjTo
	 FLvEz7zEQdLhYqTYOxStQXvpnPiTZkUcu32C5HoTRERF1CaZRcY977ox4JidKJ6achrZj
	 y8GdmPS7p8Bqh6nclDYdjCQT854uGO6FznUYgZQYW4COBWhcVTRg5eU9n78CmtHnKGMOQ
	 Z1BEXrUGVSFIavmOkMtvycyeLtTUaLMagFAyOFwZBacAMgtYsg4pCUAenfBLe0IKywsTe
	 ftkdNiKdL1HVf995yqyHEriDjaWV6mXUiuuCQfVlvtNEjvxCgBdLwZ344bTVhaaqI1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802365;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:From:To:
	 CC:References:Content-Language:In-Reply-To:Content-Type:
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
	bh=W87suzq61fhoc00Rhn8NNeoP1apTONgeLy8Eptiyo+o=;
	b=v+5m+rt3UiTOykIcBnx+pNSRdRYFzeRrHIh5OnfjOR7b9LQW3Vgq7IUwM18znZ0+Oyob
	 6Q4rkUuhJFZrbeAhGnPtq+6+NXyJ9tXOUT+u3t6b/67e5yJAowUYbSfctK1MI5CxJ6/by
	 ZaOAfofrf+IDgl6yWxXPAfASTvb3ECyHizaT0AQ1eP47oUVbXKhvui0W2EdLkrFIV3FcL
	 DR4AOeRJxq1TSWFxGj007pWvSW7TO56HYYkuh+nDpjTJI/eY9Xt6dsR1T5dbVZDkEbvz2
	 2NT6bO59pFK8zu25bg7ebqTuWAGaibdoa4YRQhqQjA4Tb9vyYgS4mNlcGiVLDc9nA+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TIZb9ujq;
	arc=fail smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37120606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 00:39:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37120606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TIZb9ujq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792802364; x=1824338364;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Sa72Kuum9lHUdw2FqMEpcGAd+TXQCU30faLROEJyw78=;
  b=TIZb9ujqtNCGWDUKPsvSoWMjd+5QyRNWtNpuWiZKrIaTt46yhbq5I3AM
   Qw/bBrF110V+FP8DcJUqyZ+WFQsFzjNU3vd+oblGo7ursQtfWgixEK1rK
   HJYIfAHUWQosYW1potQcWVxTntviTKlEowThitu6KSyLfUdiWRsf3ATAh
   HZRLrxNZPGte8iZhaThKr6OyzY4tEWLZv5kcpRHO38IWafoJb4VTGLdCZ
   3b9rIvSJQZPN+zRBgc4ahhyT2JEiS+rRJwd+eXVc4iXUbB5W5B4k453Ui
   WOg/UclLiEunOaZ3VzMaT2LPYBW/Ot6COmQ/Ae3hqsQLIIL+kRTPX7m4y
   w==;
X-CSE-ConnectionGUID: 4WQtl8UDQB6efDQ5iDWZUA==
X-CSE-MsgGUID: tEqwSGxyTduFJvEm75DA+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1460425"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1460425"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:39:23 -0700
X-CSE-ConnectionGUID: neuvTWjtSeK4uwBeUGNFMw==
X-CSE-MsgGUID: jnlR0/oKSUW9PocnYSbO2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="4142991"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:37:11 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 17:37:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 17:37:10 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 17:37:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E1tDOtChWs+PPGkAxc8dptpYhSln5OI2CfFze2wcZ//EFm97PHSzyISxjoPy9uddWNVvqzBMgypHMl8vHolXnXSwsPfruDGu1aYsoyCuRPa/8RH3bAPlU+zLukmeZJgshUBy59ChEH6MiqkcwclY7dDSIzEYbbop6QmuXOMk4P8438CZAwoYW9Doy0LYu7yMFFg4XhvNh5fb2TLYjXqk7R2KfbjIoNPDUeQ6VTtHfOxPZzFKS4jHvbHHY7QAmr42TrG2z98Qt3nG8cNNfnKzhguuoWx08mVxL3WRr10BiRqbVg/3AlV9HUnOvo5JVzUYq6RzH6WU9b1bRlFDBEpGQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W87suzq61fhoc00Rhn8NNeoP1apTONgeLy8Eptiyo+o=;
 b=I6feAHRM9PUbQ4KGosVBp55/Xv2UPsIf/Y1kBv8U4qlFV5UwcUtCLG/T56K6aycq4CvLFw1fzMHIeJFwsEdq90Vy94slGe5MiPGGmf1qD+u4lyAUEcZLod4o1Rx/iqjp7qcUywOhoMfchlHIgIFK48XD+KDbYl8UhJJT1jJAZhhbMMWkniTit5v7dX5Bw96w+ZQY3UrT68OzsFcYu2V9qyGNMeAbRvoFB9D6RqbTbf7PzrUv++6qwgK9hR24IqNgNSy04Cu08QQar08N0YcbsZB0m2gcvjHIFWSli/V7tmu1rT/JdrHhIOXPKiCblTgFtIJmYnvZ1Na791WoPa54qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by FT1PR11MB671131.namprd11.prod.outlook.com (2603:10b6:170:2f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Sat, 24 Oct
 2026 00:37:06 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Sat, 24 Oct 2026
 00:37:06 +0000
Message-ID: <3e107248-d0aa-4c5d-9c51-d5b73be003e6@intel.com>
Date: Fri, 23 Oct 2026 17:37:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/12] x86/resctrl: Attach ACPI ERDT information to L3
 mon domain on CPU online
From: Reinette Chatre <reinette.chatre@intel.com>
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <2d3327d86480b1a41bf1a7c935317f14884a83f9.1791933001.git.yu.c.chen@intel.com>
 <2317c664-0c9b-4dad-b135-a771959be024@intel.com>
Content-Language: en-US
In-Reply-To: <2317c664-0c9b-4dad-b135-a771959be024@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0105.namprd04.prod.outlook.com
 (2603:10b6:303:83::20) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|FT1PR11MB671131:EE_
X-MS-Office365-Filtering-Correlation-Id: a7f813ff-cdaf-4b9a-8fd8-08df3166ee18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|23010399003|11063799006|4143699003|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: D8twabsApH9gBwZTZNOWUcVhhrjG8B+hK4K0XffX/km3b5BQZznnGSaBUvu01fQm6KFWckL+Q1xZTMqvAwJrIdleWR5uim53ky+TQu68E2E+SH2LTUSyG9ANMmMbJf4mWyVp5ItILGv5yrLlbmvam4bTgyPRafpfatfDafzY5EPquxyIWSFz8DKkU4NDQ2SmgPcU91PrZ5uBPNJKOg8pcL1VsigCoj62PQWcpSh8RMs/V3HEAopo0MM/HqfNmGv6qT6GmQWTkI+X1+H5wV6aF9v+z0q5tZd6Q/1jOjpBebkKN+xMg9jI+ydxDyr4OCcq9JamWdGNh6vHXuytYwhloU3bQ+EL7JnkyB/t9S5r8em8H/TtsipZBqTfzYBZy4aGU3V22kBLkhkC5aoY6JKOrEt5e7yY23QbNpJXUSR3Ih+6oPxiqO/Y2/64Onh4miyOL8lYr+EuO0aH61Eced0Sq+s6G+/vc81hqfnw/H5h+zp2QqNJWpwuh2N/7yfJZLsHcRdAuT//Aiw6BLigmEOdTXTvsWy1fDH4PgE4Yb8S7uLGMq7dUr4Ub/11QlmZrNRnuNeNjOpcnWj78zIhy+IPoQDJSLVw9ZcntuO4viSukZvPrAkEFFaiOgG79hYEpgt5BMD4+GU089Bm1tsbG7RkkWPN0zol/b3X89BBzf0+UMI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmpjdmNlaXRSUHpUc2N4NndTb1lnMEFpaS9sanhZWlhSSk80T0dkTDVYcmRQ?=
 =?utf-8?B?MnBIcGVyM1ROaS9mTVRRUlBhM29ubENtenFrSE1oYzF5VU0zVHVSV1JWbzRH?=
 =?utf-8?B?bGxRa09RcEh3RGdsYmduL2xzVTRyRUhuOUJtcGFsYVN0bEZqeERzdUVyS1Yz?=
 =?utf-8?B?bUFyVXVGSzdDb3dYMmg4cmdPVXVVYjN2bkFudG9HYkNkRU1iV1owekxpaWVt?=
 =?utf-8?B?eHd3aWIzNmlVSzZQK0w4VHFFNW0yV3orNlAxN0hIM2FGbTd5d1JSVEFyYVJv?=
 =?utf-8?B?NUFrZmx5aVE3YUJtQUhZc2p6Wk9UN2V5RmFmNFllZTJwUDhTSDk3MjNuenZp?=
 =?utf-8?B?UHRURTVWMUU4aWlnc2liQ0JDNWp4dEs2UGNMQ2dVNEFkT281c0JYbjcrdDJO?=
 =?utf-8?B?YVBJQzltdVFFTGtpS2hscm40S3hReC9iRSs2dlhNcExZUVNJMjhJcWZLSzlG?=
 =?utf-8?B?WEpOUFlrZzZBbDNpY241bFdSVmpvWUUwM2p4YW9KZzE1c3gvZ1JxYXlIbGZL?=
 =?utf-8?B?K1JQclk3VFEza0RMWHhseDdaTmRMK2hqcFBMTTFDbEdldk02eExFeURCV2hV?=
 =?utf-8?B?OTlVVk5lSkJHT0licXFteFhSZGhPQzFUZndlQ1l6dEpvbmQ2TEIzVWJIMnZn?=
 =?utf-8?B?RGRHa1VGeWp2ekJ2S3dsZldYS2NkdFRxeThQUzNkTXdNVjZYZ1hKV001OUdV?=
 =?utf-8?B?a0NJbURBWEN4UDVMZVlDYWJIOElZWGZMNkZjeGpTNUNqYVJoclJwM01ZLzBC?=
 =?utf-8?B?WGd1ODdOaklid2YzNWJLWGx3b3FXdmh6Y3JJUllyVFlhZmo0cFlyYjFwU0hD?=
 =?utf-8?B?a1JCZXZJOGFzUDM3SnpMZWpRaitwMkk0RUJnNjQvejRPbnlpL3BtcDAxOFA2?=
 =?utf-8?B?UStJWXAyOUhab1RNL2hiaEt4UjVXcmJCYzRXN3RSSUlIQmJlVkZRTmVLWmdH?=
 =?utf-8?B?MUY3eExGTnFhdDFjVTQwZW1Yd1U0RDBQMHpSY3NTTkxRZVk1eHdoMUdJOEZ5?=
 =?utf-8?B?ZmtrWGVUaTFPOUxBY2RxYXpEdDhxQjJRNHp6dkZXb09qZStINnlTMkh4QjVm?=
 =?utf-8?B?bnRrS3grTGVtR2F3MnNvUmtKK0xCUm5ZVDJ4Q1A4UlhnL1p1R1phSXFtb0pL?=
 =?utf-8?B?ZmoxS2NZaEgzbDZCUWtRZ3VIaHJyNnZ4OTllWGVSOGw2dVM0U2ROR1FDS0Ja?=
 =?utf-8?B?cGNpZHZYZXVMaG1xdnVTUWw3WUNHNUpJdEI1U0JaMndTTEVGMnVtcDRHMHF6?=
 =?utf-8?B?OVhFS2JxN2R5eDRORDloVVlvMDFYc3doa2JRa2Z2Q052a21VNzVNU1dKV1ZE?=
 =?utf-8?B?eTcwNWNtamN4bm9mWTlQTW8wZC9JaHBPSTBZUE9BcU5YMU1UUzhjU2M4YlBy?=
 =?utf-8?B?WFRqWGhvZHVPOTc1ZGMrREJwUXFxQmw3cmJ1VkJpRytRRUF3aVJvVHRyaXRT?=
 =?utf-8?B?WE5JdWhuVnZheFBrSG5STzRtbU1UUkNWZnZ0ak1MZFkyZjZacVpFQnBUeXVT?=
 =?utf-8?B?bllwZ081cFA5aUJjbDdNUkNlNlhGMGJqNVI4K0FEaEhWbHZ4ZmpsUHNKd2sr?=
 =?utf-8?B?V3ZmbnBTWENyR01BK0dXNU9KemRMNDczKzJ2UWExRGI5TStUOEN4SVE4REZp?=
 =?utf-8?B?SG9VR21nd3ZnZ0NYK2J2elRMUFNmMERXeGp3VmVWOWJZRkJOcGNOSzUrNjRO?=
 =?utf-8?B?ajg1a0dpSm03RTJxb2txK0Z5VWNiOTZPeHJjeFRsdDN6VlhCZlNOa01IalFh?=
 =?utf-8?B?NFlrbkcxNXFuQnVKeGh5a0VHeHJOb0ZyZHhUQ2FIZDYvTHV5elZ2Q05ZWjFL?=
 =?utf-8?B?RXhpZURjOHFqZGRkK09qQy9mNm9TSURBYjNBdUFKcCsvbHJVY3ppaVpKZnRi?=
 =?utf-8?B?eEtFM2trNnNHb3QwU0pRZ3lNMXBYOGxPZ3FtY3pFNkNFR0NnSnU0UC9iQU1a?=
 =?utf-8?B?VXhIL0FnM0swYW94d1RXZXM5NEZnV1VsRmFTZGpmbjArUlc5U1F4Q1gxbGZD?=
 =?utf-8?B?K2ovZnNhdkthTkhPNU8zUnJzS0NWR2VCYVJ6M1g3R0JnMmtFWjk3NXlVM3dP?=
 =?utf-8?B?Vk5WK3IzZ0QwOTJWWHZucHpvajFMaHVHZEdpbjlvN1ozWHZhMUlFS1d6Rjc0?=
 =?utf-8?B?OU1lSERZQk1lNWpkL015MTBGQmQvTjR2bVZYaDM1WjlsVDR5bm4xOWdRaFBp?=
 =?utf-8?B?U2lkdVVrVStiUWZPc0ZVaE9xWTB4K2UrY3RyQW0xbEJ2VTVKNmJ0OXViaTlO?=
 =?utf-8?B?MEM3RFd6NGVPR3lodFk3RzAyWHk3azJFWHd6TmdMT0JZb2hISXFwRjVEa0JV?=
 =?utf-8?B?YkhibFM4a1V0NWVNUE1haDIzYjFRKzFZYTF1THJoREpuUGMzdUZlUnZIVkRL?=
 =?utf-8?Q?ndYxrGp3Pk4bljlw=3D?=
X-Exchange-RoutingPolicyChecked: ssxEY0qN62yXSqqH7/UNnUYoXi2xoROGw5wzhC7e+dWcVrP8nXuxH1grKPDh6hL7uC5h5DHa3G0/yZCeX6sb9xUGjy1YWoFRBWI0Pd6tIwFxBwSfeHs9qLVBErf8M2eCoqjFEgjBZRbQGrlXQnPPKwtxallGL/OcQLFs/VeUmk3hq+9ooRzVtfR4I5EO+3rPFQGX0CNG4RoUSnacenTWnIwNFl5IHvxX75XanXkRRbMXw9VTjO/jOTGWugLQUeHQG7+qRjwn58nMrE9p+/SzuAFD5CnnJcKsLr5yWq39lBSUOgDYwSSERUXavi2iTdlYOy+825jpkZKXF5vMiZEzvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: a7f813ff-cdaf-4b9a-8fd8-08df3166ee18
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2026 00:37:06.2863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JM8B0/jsSLlUD7ofWPymehJuw3LTXJQzcONNOO9kvnkVcHx0MHPTKfVT55VxQ3Jw/9OIDhshRbKQ6VG4mg8qpL2sISNCD5NCC2qpebYkXPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FT1PR11MB671131
X-OriginatorOrg: intel.com



On 10/23/26 4:57 PM, Reinette Chatre wrote:
> Hi Chenyu,
> 
> On 10/13/26 7:58 PM, Chen Yu wrote:
>> In preparation for MMIO-based LLC occupancy monitoring, link the per-domain
>> ERDT information to the resctrl L3 monitoring domain, so the MMIO read path
>> can locate a domain's MMIO registers.
> 
> Please review "Changelog" section of Documentation/process/maintainer-tip.rst
> I understand other subsystems need a snippet that describes the change at the
> top of changelog but x86 does not. Unless it is something really simple, which
> this is not, there has to be some context before the change is described.
> 
>>
>> ERDT and CPUID enumerate CPU-to-L3-domain membership independently: CPUID leaf 4
>> describes the L3 cache topology, while the firmware CACD sub-table lists the
>> CPUs of each ERDT domain. Both views must agree on a CPU's L3 domain for that
>> CPU to be monitored safely.
>>
>> When a CPU comes online, validate that firmware and CPUID agree on its L3 domain
>> and bind the CPU to its ERDT domain before adding it to any resctrl domain.
> 
> "bind the CPU to its ERDT domain" is this not what patch #3 did?
> 
> "adding it" - what does "it" refer to? the ERDT domain or the CPU?
> 
>> Fail the CPU online operation on a mismatch for now. Leaving the CPU
>> online but outside all resctrl domains is doable, but it would require a
>> change to cpus_ctrl_write() to reject CPUs that are online but not tracked by
>> any resctrl group. The current approach is stricter, but simpler.
> 
> I do not believe failing the CPU online operation is actually possible.
> 
> resctrl_arch_late_init() is a late initcall and all boot CPUs are already online,
> so the failure during this time will result in resctrl not being initialized at
> all without impacting online CPUs. A CPU onlined after that will fail to
> initialize, but that will make the CPU unusable for *everything*, not just 
> unmonitored. This sounds extreme for an ERDT table issue that should never happen.
> 
> A CPU that is online is still able to run tasks and the earlier enumeration 
> ensured that MSR_IA32_PQR_ASSOC is accessible and what the valid values for it
> are. Even this "failure" path demonstrates this by calling clear_closid_rmid()
> that writes to MSR_IA32_PQR_ASSOC *after* the supposed failure.
> 
> resctrl's current behavior when a CPU cannot be onlined, for example when
> domain creation fails, is to *not* prevent CPU from onlining. If a domain
> cannot be created then the CPU is still added to the default group's
> CPU mask (resctrl_online_cpu()) to ensure that tasks can continue to
> be scheduled on it by writing to MSR_IA32_PQR_ASSOC with values known to
> be valid.
> 
> Such a CPU is *not* added to a domain's CPU mask so resctrl will not
> attempt to make any configuration changes to it or read any counters from it.
> 
correction: with the CMT event marked as "any_cpu" it may be possible for
the counter to be read from a CPU that was not added to the domain, but this
read will go to MMIO that should succeed? At this point the system will already
be in a state with the logs showing "Firmware Bug" so further attempts at using
resctrl cannot be expected to be ideal. The CPU should continue to be usable
otherwise.

Reinette

