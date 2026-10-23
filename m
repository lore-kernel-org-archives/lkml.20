Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792799988;
	b=bCO7MqJUMwmFIWA+7ttMMW5VK7yF+g6Kpg6WWgIZWQKRUvccRyVGvtOaU9TxtZLknjgJ
	 VHjyQEVs5Kc7roE0uR4Si+hQkVGIh6fSRvXhZ1bpCF5s8Vh0jMpQJOJTD5LefvmvMG6zw
	 nQdThM4gUqdd4rANVGR1XFar/mBDNVAkFqpn3IoloHNoKWpWAnxeyj7GUABttJKa1MIos
	 7KVisckLkIFXgDCGwxnyMpUKrC+dHf7rpKUw2A7X0FY8BL8Hr7xTi332wtWfiaN8DJ8X9
	 /Tj5KxY10xUCFUggxGOQRimxnnDbnm68qZPql6RQr5x6GiqxLzvongGVGozmCEvsOqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799988;
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
	bh=PVlYVIl3bjb+Eo8/UKb/ITOexft55RZO41dw3GTy+Sw=;
	b=wxPY37kxeG4jIajvUwJFtK+vQYv8hPdp3AsXqtX7m68u8SZw0Xp6AQJLVu7CAlqeNVpO
	 ye8VuifZsoDXmWHPM76WuBqIvWW1mmPJhR7Ktv7PV/WS9bM6IgnTjYlB5J6wvnQaRbmOb
	 u3vgU1HmHdv6Z4MbtkItw6mc70QRK3WaIa2M4okFEbsHW6GgDjLWVEKrpGSaVu3kW4HpK
	 MB29FVrWK9dmAHmdlcr0HUGIETHdJ5KFqkrPfu+bXHYrU3u54qna3T/qgh6tstkNTjU4e
	 xiHks6fHj+56EwDxFw0hNZTiF4/uxOE0QAA/3YDPQ4xJrAaD2lCLWz3D1tzufteVwNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btsV2IFM;
	arc=fail smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49EA606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A49EA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btsV2IFM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792799988; x=1824335988;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bveOLffLTOjs1TkMldTebfvIb/Rh1S89ob1Q4ZnUmYs=;
  b=btsV2IFMMX4wqiqvwQAwCFuecWxJD2fZUXrRabl9fXIbcu8Y9Q/BIQuO
   RjS6O6p4ugzKAfsBfKgP3pdz1R9h6OMepwLai9QML1KjdEJ+rREVIOsjU
   EU356iJubjops+5TdLNZku3w707oXCzLJO1jsslzHkAxfOMj8IJIql47G
   ujqqQgw/hQf9i5bkzTK/yfQb3PGHMV5Uug+vsrIZZyCMHfV32qynkMe6d
   vwFJm9Z3W/drmiBkBzOL5Ruu8WvTokTaxLgeRDfhPz8F9FWiT2ubzRI6J
   fdQpKw1uVxbu7pItNPbYIIW7T88aQ0fmMcx5T20d0Te3mx7vzTkRX2bQ6
   Q==;
X-CSE-ConnectionGUID: PINROc+0QKuNfGkYNlhEFQ==
X-CSE-MsgGUID: kCXiRd02RuasoCpFckkXjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1597147"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1597147"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:59:47 -0700
X-CSE-ConnectionGUID: hAoj8jqMRo2kAyoyHtcOmQ==
X-CSE-MsgGUID: 9wZZXIuwRN2vrJfpVqLF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="3876423"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 16:59:46 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:59:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 16:59:46 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 16:59:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CTvHKtuSa01d8OvA0zQfPAUmMWJC9aPtzLcFvLRS5LcOVUimkaIiwnzRQAMjih995kseEBpXJvhflZ8rEd7faG9gZelMIEuI1eZr5zdoDIte9gVA2RfFBy8wJwIdHLfwBeYlSMARw2fj+8wnIqYN32wM4GydLtKIcQWU+it11pWFaysIqaVnwl25UIreMoVvYgKa0DHyZnWD824VYHMQmhATMC7TChAGEdL1Da3XKZ7q/Ad11nPnC/13jNdhRMq95cvgVeGyRJb7Wvk5BFQLhY1+JJVZWWYeBQuYfc2vFmAFQV29x/GMZArLK9IxcakzmYQFxjLmYRvDmOwqGQY5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVlYVIl3bjb+Eo8/UKb/ITOexft55RZO41dw3GTy+Sw=;
 b=dkdw95gun1K3IzZ15ZZRPsEaCNGf21OZIvyWc2bFEa4id3YS2kvXYLXcdCUPBJi8KyqRMuvpadwgoJzR9M7DXMzaqNIKZkWQ9eJFluLAafCmy4BBO1AZogr2L8IIonC1DmBrEFZ/k7NCZtIBr35jT+9pYZIGaYsvQVHNTKzH8vUoj5gI8kM2zFLvmVCr6KufORM8rqv2ZC0P3dUmvFEevnG0K5jB8XHDaca9mVxfrqTm4XLmqxurEdPYVWy8CfanP0OYqSd88QeXiuAidOUEd7EQ+SlE5cGToMxDbnCec3CSgvP/nWPddIOlvltDSUF779Y+mHRgfGU7oXapoalFXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS7PR11MB6197.namprd11.prod.outlook.com (2603:10b6:8:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Fri, 23 Oct
 2026 23:59:37 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 23:59:37 +0000
Message-ID: <89c4bcdc-7ca6-47d5-b24d-85befda08392@intel.com>
Date: Fri, 23 Oct 2026 16:59:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/12] x86,fs/resctrl: Move
 resctrl_arch_round_mon_val() out of line
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <e3d614c6c6d9cbcb92e5dcc975cafae4bfb059a6.1791933001.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <e3d614c6c6d9cbcb92e5dcc975cafae4bfb059a6.1791933001.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0301.namprd04.prod.outlook.com
 (2603:10b6:303:82::6) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: c3edfd5f-f89f-4d56-0fbd-08df3161b19b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|7416014|261021123027099003|56012099006|261022075727099003|4143699003|11063799006|261009223027099003|22082099003|18002099003|10067099003|6133799003|261022105027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: x8mLpGsb+aQFueeBm51YbmJq/UvjFRntK5dIs4c8Rgtah10zbHiOJydvs6ml8yqvbwBTpN6w7LK6a5iWdralT4fkwb1IqO7vkBPXAkb5juOvSkGPFWZYRo0hfJomzVgNs5oY5uXRfqlNViw0L/FCy3hAlQT1/mzgeb2K6Pi5ZT9q7CdqgycySzw8qyAa2wECx5vaeR58KlQWz8MYGd4UIlzyx/HLhbMsQkNCoYuNgHo4eKUI8BW15d43NTOpCy+18QOzWYm9UDC/sbRr6Cmd+lSF4AErYxv2Sm22kobp+YYtpfk0UjtOJSK2YgYr94Og6ami5CItDEQrGov8WHekIeuZt/MUHjZ9Zmj9Brul+lHaRgxiRRjMYT7TUIN25LqFJ4Yoy5MpfVg1XswU6Pl0zK7jiZdDBQFVGjLyBsVCJM8PHYejC/oVLLPV4IhOq2tN7qBYLckpAOn9VIW4lkYXSLEmeETEa83i4q+Mb44GqPAeGoOQD2zDdpVW5pG2xsOdGeIttY+BXO4MhtKmTxPl4gJIf/S8TTB9/LCuPEBoptJ8WGRh63cUFX2zcZDh4OUub+N5CCsHnDrCII5fRrbSuzr8z+wGLhn8X7ONdCx3INAQCyNhGFya6a3DH2jZoZqx9zIATLoGtlnamvrA2wDUJ8T5lkl0c6vwUcIdMx06CRA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(7416014)(261021123027099003)(56012099006)(261022075727099003)(4143699003)(11063799006)(261009223027099003)(22082099003)(18002099003)(10067099003)(6133799003)(261022105027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGpCcGRiaXFXT1YxVk1BNHhsVWx6aVJUWGJzQzRIUk5PNTlkbG9iZ21LNTY3?=
 =?utf-8?B?Skd0NkVYUnBDcVlaSHpFK3BiKzZ4Uk1YSSsvb3RhRlJrU05adlBCSEVnMDIz?=
 =?utf-8?B?ZVVGaDFkdlN4aDV3Q0w2THZJWEEzZ3NkS0lKSk1OV0prM1dQL3JkK3pjK0lN?=
 =?utf-8?B?TmtJWFRCTysycVRqZ2ljUys2amYxVTJscExiRDE0MDREVkR0bHRpb0hUZXNm?=
 =?utf-8?B?LzZqRGg3Q2t2UWxEYmwyN2lnbU5jMU92M2VzZ3NaamJwTlpTejRYdWExaXJY?=
 =?utf-8?B?VVRvMkp2QUFlbmxvL0xRcmNUYTRaaXdqSEZPS01LUWRSUC9UcHhlM0VkSTBL?=
 =?utf-8?B?aTI5QUxoWi9Dd3A3VzgvU2FJdk1kaFFnYnFJSElIU3hJdnJ2UkY2clphRHZI?=
 =?utf-8?B?ZXQ1a081NFoyVmNodmk3a0krZWZxUStqN1A1aUpXK2phYmo1WG1LL1FDenM2?=
 =?utf-8?B?L05ZckptQUJxWXdVbFgvSXNNWm9RREJ5TCswQktJUmdMSkJVQ2dHdFNkU29X?=
 =?utf-8?B?YXhWUmpkcXU3Y0NtWjl2L015cEI3WHRtL2FtVUxXQnZBRnhxZU83UGczbm9E?=
 =?utf-8?B?b2I3K2E4a0pDQTR3cnd1QjJhNk50cVZscUNsc0VVWDdyRHIrb29aQTkza0ha?=
 =?utf-8?B?WHJSenpoWkI0V0RVb2RVTy9KVUJ1MGlzdXJiVzA0WUJYZWhCcExwcHBtMGV0?=
 =?utf-8?B?RjRrTGV2WHB0NC84MHFoY0ZBRnd1VERyVEYrSjNleHAvZU1OWTNsV0NyODNT?=
 =?utf-8?B?NGdPRzVva1NHWndodGlZcVJpb3BZM2hlbEZJaDI0OW11NFEwUjRFU0dqRTFY?=
 =?utf-8?B?TTR3U2Rib01qUWlQUlJHdWVMeXJCbHVyTzJ0dGYxYVNncCtlNzZ5Szhtb2NE?=
 =?utf-8?B?RXVvWWFCK1cvQjJmK3EwOUpnZUtmM3h6WW0vZFExRnU4ekp5RVpXUXRTbm51?=
 =?utf-8?B?MklhWEpIdjFIZmNkMHRYemNKRnpQVnlzcStzU21tUHMvbUN0RWo5U2VnV1BJ?=
 =?utf-8?B?dWhEL3FlRnpnVENmMkNqajJuRzdVR2Z3MmlIQ3V5SW5nVFY5WDhyK3RHSGsr?=
 =?utf-8?B?TDV5WEpEdnBEUU1MOXNhT0p3UnVEakgyNTJ1UWhzY3lzblRJa3JWQ1B0N2Nm?=
 =?utf-8?B?TTVBamRQaTdnTmRJVXlsbkVRaVMzcklrSEFQQ0djQkRZN1RBN1puYlRWaWQy?=
 =?utf-8?B?NmdRbzlBNUUwR3JDS29kaGxEWnl6eTZ5VkVCLzlTQ3REMDF0VklabWxTUEt3?=
 =?utf-8?B?Q1RnUXd3NERhYlhqRFE4TzFtUFhMYmdRaWVRZ2o5UEhVdm40dDBXMWVteDBn?=
 =?utf-8?B?NVFtODRxNXNzcmdHSlFEdHZHdDhmZ2gwczRjOTNZdk9qS3phTlUwdkhzYU1y?=
 =?utf-8?B?VjRITmFsTEp4WHVWZ2VoMHhGYzJHOWJRZzdHd2p6QlUvNENaQVZrOGVRUGMy?=
 =?utf-8?B?VXExaWJOZS9uZDU3L3Exd1JUZzNadE5VYzJwZG5xWnF0c1lwSGZ5UW90cVlP?=
 =?utf-8?B?R2c3T2huQVNtZVBBWkRlZDNzS0l2ZDVHNis2NG1DUnRHR05aSTBuaWdINm1N?=
 =?utf-8?B?WkxQY25SUTFIdUtjYWFnb05uOFJIc3AvQlRyTHdPVnY1TGw0bVRDTVgrOU5w?=
 =?utf-8?B?SDc0OEVCOXo4eVU0Q3BjeVhPSE8xd2Z4MTF1K0ZQbFczbzZkVmpTMmRFVjBu?=
 =?utf-8?B?YWRuMFJkYnNELzM5K29neU4zcjBkQStkTUp0VjFZa0ZsU1cyaW5NTlZDM1Uz?=
 =?utf-8?B?TEFieUJ0b2hIUzc4bXVNaGJvQVcwSW95dGRYSlRDQmJzY1E2U3B5ZXFhVVBH?=
 =?utf-8?B?cW81WW9KcUZKeWNnOHN1R0JRay96c3dKdjFtUTJaM3pnUUR1cUJxNGxrRzNR?=
 =?utf-8?B?SGJTbmNUZEFGSms2RCtad0xORE1wQzlNa1A0bWZwamgrQk5sOElGckZYMFlz?=
 =?utf-8?B?U21MS1pVZWlFQlZvVGpyM2g0aVdGa2ZtNTcyQjdzV1AycVBpT0JlRXR0TTIv?=
 =?utf-8?B?KzdjbVFLa25RbVdSNGFJSlRoRDcvcUlWV3hOalV0ajJJeHpaYlM4S2VjZExi?=
 =?utf-8?B?eHk2c2lFb2ExaUdoakZhUE9TbE93MUYxa083dW9aMkhhQzBNbENiVzFCajRs?=
 =?utf-8?B?NGFXdjlZV1YyNXJ0WU1wM05JVlo0aXJHc2JMN3l3cTFOQU9BYlF4eWlYYk1z?=
 =?utf-8?B?SEF5UVE5RGJSdHpJb3U1eXg5WFovSG9EMmZmenBzYW0xWUZ0V3p6Q0pFWGxO?=
 =?utf-8?B?R1MvemxabTgwN1JMSlNnQ0h0YVA0eTQ4T0NmSWdsWjUwQkNVbDJoQ2JiT3U0?=
 =?utf-8?B?WUZhYnorL2wxTCthWEloSFphbzBQV0ZUS2dEd3l3WUxubnEzNDVnaVVKN2Jy?=
 =?utf-8?Q?HhJdTMy1NdTz9Mbc=3D?=
X-Exchange-RoutingPolicyChecked: NTyXi3I60TYiiS6RfU9R1jPOxLTqAteTEjbQ1vY46vDug2X81Mg5sukpWJnXLtl9xYMeRaomwweJ3ZQ7v0r2reMnyOr1dj+FnmAs9DF4Q43stUh0TFMIcVX0ptdA+FslKAg7tgt4xPFI0aRkBEkQW783EoY6eIYitxOGj6WihUbvqqNnJF6RBzszG7AZcuyJB1j9nzrWsFBnYNFaAPxv/XnWen7OdYwI3adE8o5bycfHR7doBh/ziJ9dYOmszAXFQUjrHqN6x0hDH6qtIxHlEfLthSHGWh2aOScf1dCVLgJp1FFyU8m4GuGYRJ+/PJ+fgmzJU8yWYWvAEcYgd17nMQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3edfd5f-f89f-4d56-0fbd-08df3161b19b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 23:59:37.2200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZ6LsI70XshIKC4wL6/MovEskwK8MxR94ZIxectaOU9pRUfGJ9Fy5pzpf576mHfEiNPeyGpW9idxAhj8FqiVxjgo4Y9DdejUvnUtRyGMW8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6197
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/13/26 7:59 PM, Chen Yu wrote:
> resctrl_arch_round_mon_val() is an inline function in the architecture
> header. It is only called during resctrl initialization and when user space

For emphasis this can be:
"in the architecture header" -> "in the x86 and MPAM architecture headers."

> writes "max_threshold_occupancy", neither of which is a hot path that
> benefits from inlining.
> 
> Upcoming ERDT support needs resctrl_arch_round_mon_val() to consult
> ERDT-specific state. Keeping it inline would force ERDT prototypes into the
> architecture header, fragmenting the ERDT code across files.

For emphasis:
"architecture header" -> "x86 asm header"
"fragmenting the ERDT code into the x86 asm header where it does not belong."?

> 
> Move resctrl_arch_round_mon_val() into monitor.c and declare it in
> include/linux/resctrl.h alongside the other resctrl_arch_*() calls. Move the
> MPAM stub from arm_mpam.h into mpam_resctrl.c accordingly.
> 
> No functional change.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> ---
> 
>  arch/x86/include/asm/resctrl.h        | 9 ---------
>  arch/x86/kernel/cpu/resctrl/monitor.c | 9 +++++++++
>  drivers/resctrl/mpam_resctrl.c        | 5 +++++
>  include/linux/arm_mpam.h              | 5 -----

This needs a subject prefix of "arm,x86,fs/resctrl:" to draw attention from
MPAM maintainers.

This needs an ack from the MPAM maintainer and at this time it is really
buried within this series and unlikely to get attention.

Placing this change in the middle of the series also places unnecessary burden
on MPAM maintainers since now they need to review all patches up to this
change when only a review of this change is needed.

Please move this patch to beginning of series, this could be the second
patch in the series after the "x86/topology" change.

>  include/linux/resctrl.h               | 1 +
>  5 files changed, 15 insertions(+), 14 deletions(-)
Patch looks good.

Reinette
