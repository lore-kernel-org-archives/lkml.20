Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794246038;
	b=Ym2Pn/Jk6rbPmmvP52V57ul9SUxjrBvVdNEkGZgCTqFZPiWaznhSsdahRh7D9fGXFvN4
	 w0AsHnmOqBj9W++1mK6zexQdiJ+qZCmnOHyPyu+VLvRGVRaWxYFy4K50e0gBvWnM1jJLk
	 wgK0amfFfZghnMgOJ9E+mcT5mBPYYbOnDTBbIqswai/ZHhSU18GnR7TaevCbsYBV87UTa
	 BPzST/VRKqS5zxOwq0bl6ZbkxWtNcNO4PKB2gRUVU/GN1qLNVO3MLTZASf/x5GH0clOcy
	 jnCB+ESPJ4vPxbnbwEsyWYQ4UiFvuylc6Oy8mqxnr9ffNqQ6BBRDsIT83GzeXXZWmjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246038;
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
	bh=URvUfFBlewZmd5+23JgRQET231Mal53xdae/4dJOBjo=;
	b=iZISV9705k2cwrjh18mga4j3lQyc87aUBNLcNfZ5y4hGlYHfd2LTusAnF7H0B28tl6xr
	 P5Dut+v8vaiIeqww+HzzCq06i17ksC9n+F2Ib2s1ZYV/z2CSXMmhrbpbUE7UUIx8C4XiG
	 uvjhTKnshrPGGIC2tpe7Dx6/A8b6nxjgi6MCNeX7Z6nqpqQ8XeOnmMMhMzeqqcbZ0Z5BH
	 HThF4up8SQrPrmodFLdPZcTQ9JJ6cdvs0uIUdoadyz0uFi5Xvl+HuzDxNpcB9vjsWEfWS
	 BwadIbf2lblzVkd8BAbgzesG6IUDh8GBfMqUCkAPtmrzDG6pSRXjEQPEagkkacwLz8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="mGchQYK/";
	arc=fail smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F13A606A325;
	Mon,  9 Nov 2026 17:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F13A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mGchQYK/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794246038; x=1825782038;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=a5TuOxB4t2OwoOo/rFkwfcaubvFPrYJBiGEuBFSw6Hk=;
  b=mGchQYK/HtkKukveSgSOVtOha/OVT+0JjItiiNG4wYnIgmElYNEzPraY
   EjrlTEcXtpov1iKRw8urmuOnnyVE4VpeLrz+8dzIrHiV6KTHULXUV/+vA
   yS1sxPjdMuspukJsyxYChwWiRH1D6yr7zNQKyYQhabKPvD6Obiiv7efor
   5FH4KFiCI9IaXX0pOYBpm9A5JuXzTXv0ME0DRbMZOcPNpYd4+67KMlNCi
   uzlGXNeK2g66BrJSa7WLy/gXNE+LcYBEhpIN+YOO3zlF9XPVsafglYB1z
   NOQ/wIu3G6OUQLPwyuZZqxwrQ6f7oW+x81jeIMWLl7xelHxbtEXu5g8sp
   w==;
X-CSE-ConnectionGUID: XMJQhl0DQ1O4kzmQeezR7w==
X-CSE-MsgGUID: Iue9eN64T+y16LkX5xvEZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3002365"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3002365"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:40:37 -0800
X-CSE-ConnectionGUID: ni1bvZRFQbud8Po83NC08w==
X-CSE-MsgGUID: kqyjsmoyRQmalqsstpzaaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9666807"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 09:40:37 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 09:40:35 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 09:40:35 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.10)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 09:40:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4Y/N65ICqlHssq5XqsmM6EoTlVyBSYmAN0Isy9wiGObyiiZM6HgYMAmUOF1MAm4+249o20Sr7/9ImHOiOb6WYuAypsuGTh6akZ69n1AnwmzMl4DjUnJmmySVEMXg+KpkeFGhqNgnmLN50Ji3X+x+//Crc+kZOFiXyDbjrrINVP9Mc53gQVFGRelWAAktfNYfRZD35BY+gihXZWA3unaOM/hoP1lRvrZIGnrlgLZjHhMS/+9Sx3p9MJNh9taq6uJegXrnOYU73nJjgZN8PtlHljLW0CESzYlsl8LyWIDpXf6Jk+GPIZYiWqy5jGY8b+wDV/oX356pngbFrYdyncHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URvUfFBlewZmd5+23JgRQET231Mal53xdae/4dJOBjo=;
 b=GwNI98vkR3bYl1HHmYD1yJrJ6xyL6s8kRUFWEcxR8kQu104rYbqGFh+8l0OVEUGLc60cmvVV8WLQNdGm4xezy+g3jb7eYgEresgQyZqBxhL5SOzvDnJ6ia3E4P+doVA+Go+KwkYpMyUEIcjUponECEQZVpYx0h26pc4yHGWzTgqBIfA4NxvTboCgZvvq3639bKRBzyC7ZNgDwKo/Xn8Q693nRUQcf9DzqB0Pvzi1GJgJILIZHyPbPzLPlU+Vr8Jd42HH4a5LU35bqIZdJ1v1pb09SzNCWVAdi0ILhSULjHmwXpYWdka6kxGxYE4weR+AHKaNJcOrG00QH24kouNTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by DS7PR11MB9450.namprd11.prod.outlook.com (2603:10b6:8:26b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 17:40:33 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 17:40:33 +0000
Message-ID: <6c5d88a9-f86b-4255-82cc-bee70c2d7736@intel.com>
Date: Mon, 9 Nov 2026 09:40:29 -0800
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
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <599b7b91-f6c8-4a8e-87a0-c023f3fd58ed@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:303:86::11) To IA0PR11MB8379.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|DS7PR11MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 78602bdb-90c6-4186-6b02-08df3e888e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|7416014|921020|11063799006|261021121427099003|261009223027099003|56012099006|261021123027099003|261022105027099003|261026140227099003|261026121527099003|261028144727099003|4143699003|261102123227099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: EYS/G9IQw6MQupRnAVTpy1F8+7q3rkXq4yiTfYLaXIZcUBRX26Q42PgaM2m5UXmSdBoDhEcFdGC9TR5MEtLKbPFR3fep2PrAdlnE+7lKezCJyY3Hp++Wcpt1A24yRI9BetfjMOOjJJvApow/14JsaA1TE6BAXfriEWtmMX2ogclm6Ta5sNaEZPhWKXhchlR5MmiktfCpgdFpW2ilXkQ4thgYNiwuGeh032KybJaGsrSWmoThOBOODH+nk8iBJkR4wC+FYYbtwHzkQGkj7wNngVBkMW9caSteoJSFWIcgzzTnxh7njQU7QiZqM5LXk1+B+h3ctVjcSai0MzLX4aplmwqZ6xMv25EIrZ+8z0GsGbxgNytXZV7+SENXvdCbngfiOcRl13CfotXeldnkOlp983YOaIVSMjdwM7MLPfOHdjpgZyZpxTL1C6FX/B/2RIw4y9sA9YNLUgf7BIQRn4sDJZiEsi7y6gE8/Fvk1RjtlI7nPRZIV2SDKjddznor8ZKukUZhOSXPypZvhiz/9h/d08NnV0FpJYL2aOVz9KnS1B/3qUFypYBnaJKWNeT6CAYOcm4WhmRgCcjlZ1I4k7dsEoqrBsW5XkfTM9OzOVKR1fgHQehV7+NsggXyD8lFEkZknt5PtsDi6zMsSr/+PT0ZwLx//2p4nLJtJC0HYHyk/HY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(7416014)(921020)(11063799006)(261021121427099003)(261009223027099003)(56012099006)(261021123027099003)(261022105027099003)(261026140227099003)(261026121527099003)(261028144727099003)(4143699003)(261102123227099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDI2ZXRQZi9DUFR0blBUaU1ObmF0Uy9iT3F4R3NESGJaVVFYOWtJMlFNM0ZF?=
 =?utf-8?B?SjNWYWZXd25BMlhPOW9BWnh6S1QyUVYvUXk2dkpTMmJKeS8wUmliTTZTdCtR?=
 =?utf-8?B?cGFOS1pKa1p3WHh4aUFyZno0Q1FkTUtLeXU0YnZLT3NWWFF6RmloVVRBejI4?=
 =?utf-8?B?V2FZTTlhOUtvbHpOWWpteEVaZFVuUkJuZ1Vzd0pkMVZQWkJIOXcvbzl4am4v?=
 =?utf-8?B?STNldExGTllIUW5NOXFhb1FLdm5aTnNMamE5dUdsbHFYbUl6ZTdYaktzREdw?=
 =?utf-8?B?WFUyRldhV21hRW5OR3ZnVFpVaHh3Wkt3NmJIMjNXaVZqN3N5TmRoR0d5RU1J?=
 =?utf-8?B?TVVwQzJwdjVDVlEyWWtxV250YkRwOUQrdGtIcVh0TTZCblEvUmRONW1FRlpO?=
 =?utf-8?B?SFhyY2YwcnVFby9ZbTJsQzR5eWtEbzlmd25URlJtNWhiQTNxWHJ6TDZ4UFNV?=
 =?utf-8?B?QXI5U1NyMVlOdExQcUNLakY5OFYvSHZqREtpa3JyeXB0dXVoTlIzcUtnalVP?=
 =?utf-8?B?OHR2VVR4QnZXQXA2QWRzL21rRjhtRVFsRThOaG5hVStQejNmVUZEeWt0Um5j?=
 =?utf-8?B?ak5jOTQzcjhCR0s3MkNySFpldXhUOUpXYkpFMGRpTXd6dkY3bGN0amdiQm0z?=
 =?utf-8?B?eFlNYi9pYjJDc0FITEsyWGpKZm96WTQybVZkUDd4dTRnMkJGdXp6Y0F5dEFX?=
 =?utf-8?B?VlRubWU4T1ZMTmRpQmNMSGdWRmFocm80T3NYSlZwaWdDMlpjcDA3S04xTjdn?=
 =?utf-8?B?N0lQejVxbG5iS1pVNGNnL2NaNXg2TU95ZFkvcDEvdjF0TkFFalE0d01oVUky?=
 =?utf-8?B?TEFXQXROaVlvbVNlQk15QitJVCt0bHI4NGNKMi9tcStaNERNbHNZdWlkaEdR?=
 =?utf-8?B?QlZib0VNcVZHSHk5Mm9jbTR4YWtPQlltbXluT3NmNUJ2YldoQm5xMzZLMGtY?=
 =?utf-8?B?R0xuMWxEZnFZK1kzcm5Gb0J5aWZjblFhTkZCZzFOdDl5RDVmZzA4T3VQRWY5?=
 =?utf-8?B?KzluNVVrSk9JS1NCK250UjQxRG5WZW1HbEtEN2xJeCthVkl2cEI4aGJzQjZy?=
 =?utf-8?B?aHNkc2xDd2NWOXJCU1p3Tjc4OWdvSEd4djZuYUZRUkxFbzg3bU5NaFFrSGI3?=
 =?utf-8?B?dmlWVTBKSzZadTlEYVhaUjdSNGMyeU1NOVhTRHVid1Z4ZlVFc1k1b2Mvc2xy?=
 =?utf-8?B?YnlDMjBOeURhWFk5ODNwZmtWVmRjV3Jia016Vk84bjNKazgwdEE0MG0waHdo?=
 =?utf-8?B?SjlrVElZRFQvM2pDbXhER1B4NC9GV2xqNjF0R3dpVlpVSmlTMk9hR3ZoZW1H?=
 =?utf-8?B?MHkwWE9vU2x5VEpHaStiWm1GTDJTUkltR0MyQ3VyVXdCak1rbEZqME9XR1Fn?=
 =?utf-8?B?b3ZlSG4zbkhyWWtWNHZmcC90Q1R6eHRrWTY5VzBhTWl2ZUc3RVN0NXpFSXYy?=
 =?utf-8?B?SnZhYVBRTk13UUVDLzhBTzhwMjlkd3hSWWpXVThZaTdFUnkxUndkVE9VUVlS?=
 =?utf-8?B?UThWMkkwSkVRek1ISFlsZ25GVTVpZC9RZ2NKVmg5YlVDTDE3aDNwRUc1RGFt?=
 =?utf-8?B?cFJSRmtyMGgwV0gwVEY3VHJHSzV6bitIanlITTk5Nzd3TFl6NmtSbHFvSCtK?=
 =?utf-8?B?bFQwTjJRZFJFNjdKeDM3RVNoTnRna09TcS9hZ0VjNlloSGJJenBobWVadDNJ?=
 =?utf-8?B?UG4zQmJ4Mi9YSy9wZnZncG85MHI5bTh0WWdZWTF1K2NQMjllYkNzZ0dTQktR?=
 =?utf-8?B?NUU3NnpmRUJQRG04NUJkS2JXQysyRFUwblc5UXkzZVdqSDI4RHM1S1BvTDJi?=
 =?utf-8?B?aml4OVQ2cFJ5dytWYWtJYUtSVHUwVEV4amN0bXVpZHhubnB1UFhLNTJUQzRx?=
 =?utf-8?B?UWxPcS9hcmlHK2k4N3BNeFoyNHRTNllhVHZSOHA5YklNMms3L1hGbmJTUHhQ?=
 =?utf-8?B?WEVRQ0NFUmxPVDF6aFl1RldKcnQ0b3VCZW1UQ2xzOGpCWDl2YktFYVovUkti?=
 =?utf-8?B?dzJyWkVQYUJ4QlF3V0FXOTNvNERjaW9aVWovNXVPSW9EejVpK2xYbGU1L0Ft?=
 =?utf-8?B?cVVJZmRGc1Z2YjFTS3Q2bUhBK2NBWW1Fay8vb2dsczhTdzFnR0lNOGdjemFB?=
 =?utf-8?B?dU8yQXRJU3hXV3NLaTFvVnNqSmt4aWNnWi92L05EUnNiUzNCRTFOc3RFNjNU?=
 =?utf-8?B?LzBacks2K3hOOUVZa085aEJ5akdOamR0ZlVGdUU5NU56bWNWRXZxdmxYWXpq?=
 =?utf-8?B?QlhKM00zQ1FpeFZ0eEl2dFpnU1o5dUEvQTVJTjJSOFdoemhoWVJhOVVOenpN?=
 =?utf-8?B?SWROV1RaUFZwOW1GRXNIdU1GMkxJTW9JYjF3QW1MbkRUcDVrajdJY3BVWVd1?=
 =?utf-8?Q?dloNs734t0bR9OXc=3D?=
X-Exchange-RoutingPolicyChecked: ZVdrWz/kcyW1axA/vm35Y2wrI/1xVaThHOy/05B7pKRsrbF/DlIYkaQ7ljTlTW3HrUU0HkFvzwXsaNwlBkHKtMxK7kJJVOjPN9Tre2KOShBrrnL34/5dqT77H2yohkJXlTa27fnl4maDQ2oyzycedctFQyY3y05yW5wvItpVfGBPS8aQo2mcQYnPw1W34L8IAX0r+HmnxRk1vAPeHliYrRq28pe4RvAfOP9GomMHI3GSZepRcj9UW+DwBEDK/zk3Y/UOtcr7m2unoxys310nY9RczUdNIKNDL3Nu8GSu9BEmBD6pMfmOVz3eCtIEySQMIKRk0SAYLFNuCxQyIJddiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 78602bdb-90c6-4186-6b02-08df3e888e03
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 17:40:33.1307
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Aixz2o2PNx+3+Zrm6EkhhQ0HyazCcw1Mhk+6u/EVog8Qzos/Liouweq5hYuooqpRzzXH0PPmYG9UZZ8OIh5SO9q6ty+vxz1HCEz17HeYpCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9450
X-OriginatorOrg: intel.com

Hi Ben,

On 11/9/26 3:03 AM, Ben Horgan wrote:
> On 09/11/2026 10:52, Ben Horgan wrote:
>> On 05/11/2026 12:35, Jinjie Ruan wrote:
>>> From: Peter Newman <peternewman@google.com>
>>>
>>> A monitor group can be renamed into the mon_groups directory of another
>>> control group to move its tasks to that control group's allocation
>>> while keeping their monitoring data. Where the RMID is only meaningful
>>> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
>>> extends the PARTID, this move does not work. The rename succeeds, but:
>>>
>>> - The group's monitoring data is reset. Its counters are identified by
>>>   the CLOSID and RMID together, so after the move the group reads the
>>>   counters of the new CLOSID instead of the ones its tasks used.
>>>
>>> - The tasks are not moved. mongrp_reparent() sets the new parent and
>>>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>>>   to update, and the search then matches on the new CLOSID, which none
>>>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>>>   control group's allocation, and the group does not count them.
>>>
>>> The move has never worked on these systems, so rejecting it does not
>>> take away behavior that an existing user can rely on.
>>>
>>> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
>>> group, and document the restriction in resctrl.rst. Where the RMID does
>>> not depend on the CLOSID, such as on x86, the move keeps the same index
>>> and is still allowed.
>>>
>>> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
>>> Signed-off-by: Peter Newman <peternewman@google.com>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> Cc: <stable@vger.kernel.org> # 7.1.x
>>> Link: https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
>>> Link: https://lore.kernel.org/lkml/20261031101052.1692230-1-ruanjinjie@huawei.com/
>>> ---
>>> v2:
>>> - Drop the Suggested-by tag.
>>> - Describe the systems by whether the RMID depends on the CLOSID rather
>>>   than by MPAM, in both the changelog and resctrl.rst.
>>> - Explain that moving a monitor group is already broken on these systems
>>>   because the tasks are not moved, so no existing user relies on it.
>>> - v1: https://lore.kernel.org/all/20261104101913.586595-1-ruanjinjie@huawei.com/
>>> ---
>>>  Documentation/filesystems/resctrl.rst |  7 ++++---
>>>  fs/resctrl/rdtgroup.c                 | 13 +++++++++++++
>>>  2 files changed, 17 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>> index b52795e03303..9ae34aace0ff 100644
>>> --- a/Documentation/filesystems/resctrl.rst
>>> +++ b/Documentation/filesystems/resctrl.rst
>>> @@ -552,9 +552,10 @@ will automatically remove all MON groups below it.
>>>  Moving MON group directories to a new parent CTRL_MON group is supported
>>>  for the purpose of changing the resource allocations of a MON group
>>>  without impacting its monitoring data or assigned tasks. This operation
>>> -is not allowed for MON groups which monitor CPUs. No other move
>>> -operation is currently allowed other than simply renaming a CTRL_MON or
>>> -MON group.
>>> +is not allowed for MON groups which monitor CPUs, and fails with
>>> +-EOPNOTSUPP on systems where the RMID depends on the CLOSID. No other
>>> +move operation is currently allowed other than simply renaming a
>>> +CTRL_MON or MON group.
>>
>> A user may not readily know whether RMID depends on CLOSID. To document
>> this properly we need something specific we can point the user too.
>> Perhaps this can be a file in the info directory specifying whether the
>> move is possible or not, info/moveable_mon_group, as we discussed in v1.
>> I suggest a precursor patch adding this file, followed by this patch
>> which can then refer to the file.
> 
> On the other hand, that does add an extra dependency for any backporting
> of this fix.
Does this fix really depend on a new user interface? 

I understand this is helpful to user space and this can be added, but I do
not see how this fix requires it.

Reinette


