Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792768319;
	b=c+IZLY9dPvvDrif+gVXMuGf8NvalNdWcd9sdMxGXTUqK+kUf6pUFzTAvJQ5jwRpVPMzz
	 YySzhPilOEpdQ5jiW797VZPJG8dI7YCi6T7BmAKTde9rkijYv37rdzLlVN8GcOdf8D3gL
	 m6SibHo1S6I4d/9rMXhj+jsaOksaaRJaBn5r+tbz7Zsxti+PAs6mQ3tUOfH0NvpXKk+0q
	 QNSKOds0YqmVZMtRq/FI7vX4c+R2Q2vSnL9pPjaf6GR1RJ0obU9bpL+uz4yy0f97WcU/j
	 wClECD8K91K9JA/ifXxeNZy6DSDe0lzevdTxHCPH8Idcc5a/yHcpd3vhInLxsBFjZ9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768319;
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
	bh=g3UBcRzCSTlLSD0FBluelxwMy2nX/XGIwOSj/Kf8S0k=;
	b=JtIPhy4lNSoUGUYTLw9EuwE73VU9hMTwp42E91bG0fwAJ6eTSVJS4EM+0mxrpvGXwh4T
	 6Hj5kXrDjrmvuJ1Q+SMraYrMtaKTEP8rpfy03HEHdIhLdksGMMO0R5r38HyDnY0CSSeCm
	 3ETHTq6yj3Ba367Ne/pQYGrYwlNvBd0yZjk5O48QssNFKqUe4olkyBYPeN0wEXkJ9nmi+
	 yq44WUqzy8vc653NGzAuLSZQT3LimUlarNmrpFWhLOxG93MVFSNKM+2VCy+LSI45X1Icx
	 8Ugyuyi3yCR3yD3y+tgiOmpDDFl1YNXZzMe1q0DWWLTwAymQsWLorc0m3wOtaLaOFPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GraTKHBy;
	arc=fail smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2518606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2518606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GraTKHBy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792768318; x=1824304318;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=B1fvQIGcx3kH3/GBMxKlwysjHJwn+tRnTrMLrdvhgeE=;
  b=GraTKHByPSVvqslofQsZyJRoq6uov+FaCLfP5yPOX9Cg9FRDWYmoHcgC
   y5K13EIDrlEXoDdzvaf065+45Z9PIEO0scDSY/z41HkDBG3ZXG7Kyz3IU
   LOvk3UH+WvBq24m/Wmpe2V3lwrXRFz9cy7R2VdVTi5GLei2OB4eHun5Yk
   NoOksKrNP+LrSINffZnPG2fI3FcJLMYxubOiT+JedSuFrLx3m6YBJUHhH
   b0BGyxzZbmoxrMUZN1LVVqzUJJRBPFvdRh9B/hYfwFHk2EJYb+Yom7Hgq
   VT0Ys4RPnO/iOGBJQDbKDbhqIZTHVuX+e5XB/h/W4jE1nZr/SkZvaKBIb
   w==;
X-CSE-ConnectionGUID: IdLrX2OTRqWGGVAzkaxFnA==
X-CSE-MsgGUID: /arSp8GrSAmtsxJeJV5Q3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1545085"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1545085"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 08:11:57 -0700
X-CSE-ConnectionGUID: f52OYogvQT+MQzQm2PpOWQ==
X-CSE-MsgGUID: mEjUocZ4S0KAKKo3DzQLqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3552250"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 08:11:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 08:11:56 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 23 Oct 2026 08:11:56 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 23 Oct 2026 08:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9otGB9AcxH6KQklvAhKyYJPjoMbDkgu+8cajGqwuKMQ4/n+/xpBmsnMIHdHGioomrmxW/phopEUDPOGCIgOdBthbwPz3fxQqEWwaoTLtX4OQT5rGAU6xnai7C6gQfZGODK6JfdLI1HyzH4LJdbnd095j+oPPsYSaeM2ZfK0BE91lx7cYrpI/69ovej/3KYVbzyNDraPGvmUWBVoAZ3OewrckoYg94CqQpoa4/ObKxc0ihoETMK9y9LX1uvpi+eZ97zguwGx5WHOfYGfCYrhEYjXj0dRCeJq3VXJfGbFQFuq3pI3i4aZdLR/1i18d75vQKGgZ2XMDoB1syERmK3B1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g3UBcRzCSTlLSD0FBluelxwMy2nX/XGIwOSj/Kf8S0k=;
 b=eNkfQ6OHXwcMWvzxGN+3HXdZNJLT8ukG2MSmHIIlyUtWPeRHCT/cawNPATa4+7rsY2WBc9KHRa4agZ7fy98bX/TibY5bnWUh3wLQeN4hSoyyfTXBh7lpB0h5wXI24OX+FPnBvIpd+q0mXZNpDL7CEsozWWbFV7tgq3Jwlqlvm0Sx9C6mpb6QYYvXjKLU8jRoZoybsxKgl0idoHFT23unrJd7dzkjUPWBHD6uGZi30ERgMZmRVSnvJHBqwriTvfxLiKpmt4XZoF4/AD0igJN3rcarC26PeyAvEFmlM7n3w6jDnqj84WZLjPQlPANGqSJxjFJYCOW9VN6oXpmbV8oLdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA4PR11MB8989.namprd11.prod.outlook.com (2603:10b6:208:56c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Fri, 23 Oct
 2026 15:11:54 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Fri, 23 Oct 2026
 15:11:53 +0000
Message-ID: <34dcdf73-5404-406a-99a5-60630032c054@intel.com>
Date: Fri, 23 Oct 2026 08:11:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] arm_mpam: Add extra MPAM controls in resctrl
To: Jinjie Ruan <ruanjinjie@huawei.com>, <james.morse@arm.com>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261023024812.232820-1-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261023024812.232820-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0186.namprd04.prod.outlook.com
 (2603:10b6:303:86::11) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA4PR11MB8989:EE_
X-MS-Office365-Filtering-Correlation-Id: 26c7a3e1-84b3-46c1-50bc-08df3117f85f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|22082099003|18002099003|3023799007|11063799006|261021121427099003|10067099003|261009223027099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info: M9uk10xUpbeTgOG2WRe9Wv7fz9wkR6frBe7aOL1JHK893oPd0m2OM+kcIwXmjbJmku+PVs04G4848rqkt0cxD5NFvZx/vfQ95KWlA1QEXpmQoUWH4UTzhwx1TY/jhVrspEoT5kqq5PzvHhHx3XlcncOCuqUbcz6OELijQuD4EVyw9L+lyQX/tgu4ZLohi51xjVr/iTpjAq7kNNBVJpyN7+4FirGpM15qzBFWRfZ3Wh/I2Qbk7t83wMG0FWw5iQjthnb44LP8gZRxoBuU0DzBPDu9L3PAztFxOvg/iB/IzUeWTxnsmgOv9aA6w1QIy0LpRzlp2HUje/ty8nQU8s662AZCvEjlSf3C18aJFgKCHs/91kUN7RTkSFnIeJZgy+B72XESgj/nL/NZzclbZL5+wWNZyMshKeujzFf48LdBmhTmonLZVgEkWjvoXSpv1dULDkSyrSmmIsqhs4CkeH3q9j6fTErma5QqkwIHOKVs78wS28SW1NGnh8UM1jOWYToLVSg0VsnOjUsFreoAF/j1mLgG2oKtJlFvWiLdStV8FGhnJFlEVATvOA6YqTZbiGe+Fdt/XIBIAi35OE/PF6jbNj6ke1HHV81uTnfBKo9/uvrW1QBj6tc/XRs4UlnF/LZv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(22082099003)(18002099003)(3023799007)(11063799006)(261021121427099003)(10067099003)(261009223027099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFJFWUxHZktXNzdXQTdCSDVvK21tUWl2QlNGeE9MUVA0d1NjVzFRUFZJbFh5?=
 =?utf-8?B?ZFVpYklmODFNaTBNdDFaMHBvZS9vNWQzdVdnL25UVnJGQUpWeUIxa1lmTFIv?=
 =?utf-8?B?YjkyZ0hpZ3lYbFgxeWFnTkhlNFZ1Vnp4TEJ3c3FuNWxKbGhVWEd4ZzlxSFF4?=
 =?utf-8?B?VW9OWWxUVDJqUE90RHM1YUk3OWtSVDdJNm8rcE0yaG40dEJNTGF2WFhHOFAx?=
 =?utf-8?B?c3lERFEyQ3BrdjBYSlFFSmtwa3RNRHhUQmdGZGZoWWZXRjV6ai9IMTRtOHMw?=
 =?utf-8?B?RUtOQnp6UVVvVUpLZ21QUWVHeklOVm1jRVFrWlVMMGpORStDTlNjR0FhS2RI?=
 =?utf-8?B?QkRZSENBYm1peFhvQzZpR0RneXRyR3FwMWtVYXpSRjZJMHhkT3RhMGR3cDZz?=
 =?utf-8?B?SzdzMVJNcHdkSDEzK3ljb2gwaGtCclRXYmtEVkp0S0c5a2hUSklUNTArK01o?=
 =?utf-8?B?VSt3aWUyWkt5cWUraVRhYUs3R0R0eTVvQlhZRU5lU2I1ZERQZ0FzSXRFWlE1?=
 =?utf-8?B?bDd2Tm0weC9ZMTR4YWVNTUVpNWZZVFpDMVM0R05vQ3gxM2JRUjZPdkpXUStj?=
 =?utf-8?B?b0NMMGZPN0xnSUVEYTBEWFV4NG9rSUl3aktwdmF6akZBZ3dHcEdodW53VmVW?=
 =?utf-8?B?SGV4b21jNFhHc083UUUrY3p2aERHb2VTQXU3SlBNbUpScVcxOUhJYVdOMTVS?=
 =?utf-8?B?SnZ0YkZSd3dxUDBGby9Hb1F1aXlSK2pXWWRMY29sbjg5aWZqSzh6UTh4SC9m?=
 =?utf-8?B?WXFlUGlaTldjcmgxcHVxNnZGcU1lb0I3Z0xwUjY4K2ptbmRxamZDMUdxajc4?=
 =?utf-8?B?NjVRMFFVOE1DeHd6eGw4ZUQrZjhDL2prM1h0c2EyMERRWW5LOWRTOXcvcUZQ?=
 =?utf-8?B?Y0MwM0dVRXQ1eGU0TmY1UTU2aml2SHBDOG1uM05wSUlpQzMrSGVZYmpLQkZ2?=
 =?utf-8?B?VitaMDMyNkZHYzJoZmU5TXdQMHVPeGk1ay9MNnFDVkNwTUZMS21keFprdHZ3?=
 =?utf-8?B?c0laTjhEQ2NYd01YbWM2bS9vbnVSTFBweFBGMG5kR1ltak1aY1VkMUxjWVhW?=
 =?utf-8?B?UVg0T2EwcFhtQU1TZXRKTXBQczRCai83NFJKRzBOcmZxSzU3TUVrR0taMGkx?=
 =?utf-8?B?a3lWbHo5R3A3VXg5bkJCS002M3dLbVVOMzlBeWJDTXlUMU5XQlh3dVU5RVNs?=
 =?utf-8?B?MVFwSTgvcnI2Z01hSnd6WTBISHNsNElrY1lXVUtna3JJM3owdkJDTllqSFEr?=
 =?utf-8?B?eU42bnJHdklFNUdsRklCYk5HWjFjdG9QRGpPM2hZZUhhUnJ5RS9TdlRwMVB5?=
 =?utf-8?B?bXdqa3JXVWFReEhLdGkrWVhxU1ZEejNGYTk4VHVrMVBrbzBUVHdEVlM3TVQy?=
 =?utf-8?B?Q1QvTkhnb1JnaFU4dnkrWmVuZWVLYWtNWTYyRWxtaGs0SlFrNmkxYnQxUkJk?=
 =?utf-8?B?N1h1ZUtVSXFRZkU4Tk1wZVVZZnN4OXFiSE1jSnIvVmpHNmZMRko2VVg4Yk92?=
 =?utf-8?B?VUl4MXNLcTZQcEN4RFZvdGdpeHB5SmdhUjJ4bnJkcGpxbXNXVW5sYkZMcEpn?=
 =?utf-8?B?UXRvckxGTzNUYjNvT01kc3VnRXgrN05VUHVvZzBTNzFkWWxFM2ZibEtjTmJ5?=
 =?utf-8?B?L3JqT3hlY1k1RTIvSzNyWGhiRWpaaWRvNENzY1pNcmpLT3BRUFkvRVBFSzBF?=
 =?utf-8?B?cHo3a0pxTGN5TFdudm8wK1BraThlS0ZhNzh0dVF1cU9Pd3ZWcUZLeFVHYkdw?=
 =?utf-8?B?R3l1SlBhdjYvanlCQTdCNTk0S3VveVNpbXp3RUJuZjQrOVY4M01ZQWdiaG4z?=
 =?utf-8?B?dThsUlFRTkVhaE1qdTFpc3BHYkduQ3hvSDZkb0FQZTdrQVF6Z2R5c0pHZkkw?=
 =?utf-8?B?cWNxZEdOTEtCSzJOcDN1KytGbEE3OUdXV05FMWtCMktxUTkxcFNLc2UxS2NH?=
 =?utf-8?B?RFdZWHhNTUVLSGlUY0FzdjJ4VG5VcWlrZitZdDZjdUFXRzRUOE1vYm9Sb3BM?=
 =?utf-8?B?ckhHZkZ4T2dkMkNsVzA0NzVpcW05YXNqNGFzVjhnUDJENUdJOStHK05jQVA0?=
 =?utf-8?B?UmFhdmpxay9RZjZyRmF3SkhERXl3ckZiODNtck1JSk1ZUHRkRWFYNDVmNVA3?=
 =?utf-8?B?YlZONXA5a0Z4NTB2KzgwK1hXZmhaNFplSDBlanUyNThUTnJqTFZlQnR4cTR4?=
 =?utf-8?B?dkdGSVdYbWloVGRRb1Z6RXIxOHJrUkUvWjNRWGJlOWdLR1hxeDJCVC8wNGh4?=
 =?utf-8?B?a05yYlFteUJGSkZNdStXaCtoejJzNFlIZlVmaE5JRlJBVjlMSmI3Ni96R2x2?=
 =?utf-8?B?RzZ2c0FmU0pYK0VyU3IrYmlEZ3dkNkFyaE9hMUxyTXJzTm13S0tNQ0FES2NO?=
 =?utf-8?Q?efijGStNQPhhvifg=3D?=
X-Exchange-RoutingPolicyChecked: 1GrB7mjOnSk/kp69woKZfjKfkbGMIakLsV9ilrJ+3iFgEYtpF2UIeEwhqT5EbOkK2/KFm/esHKXBaB1xdDdSU1+oP0oqz7os2xkxXTp7VF2MouP/EZEaYJMFry11xrkqbKxNgL/PvboQiivLSS7IUHhnQ3jlrNwdAFjndOxIIhwKpxxTnckXP0GzDtuFQ1tUsW6I4teOYgutVFV+EG1z0XXaXePPyg+Oil0EoZ6e64MsGgWlVeUyiMfl9kZVAWLFo2kFp7w/ImqRXax/kHF4+MtsMwgHSSqUl5hQ52Fy248hPmOJMi9OKyoPMVBbQyYKSEAB/iuZLmYQyZ7ZyGDagg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c7a3e1-84b3-46c1-50bc-08df3117f85f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2026 15:11:53.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3aBFoxkEoH/mlxGZHld/kClboIUKQ89bNQ7k/yywJvwLpIu+WhiqY0M8Pbygh7Ym5pMw5t/afMqkQ2EjHSttHHwrUkQUcGz1Z8q2jZf13c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8989
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/22/26 7:48 PM, Jinjie Ruan wrote:
> Hi all,
> 
> Resctrl today only exposes CBM and the MBA bandwidth percentage.
> But MPAM MSCs also have per-PARTID fields for internal priority, capacity
> limits, a bandwidth minimum and the MBW_MAX hard-limit bit. The driver
> already writes these fields, but resctrl has no schemata line for them,
> so userspace can't choose the values.
> 
> So this series adds those schemata lines:
> 
> - Patch 1 fixes maybe_update_config(): a feature set with value zero
>   counts as no change, so the register is not written again.
>   The controls below can be zero, so this comes first.
> 
> - Patches 2-4 add mbw_min/max_limit, cmax/cmin and intpri to
>   mpam_config and write them from mpam_reprogram_ris_partid().
> 
> - Patch 5 adds the resource levels, selects the range path by schema_fmt
>   instead of the MBA/SMBA rid, skips the new resources in info/, and sets
>   their default value when a group is created.
> 
> - Patches 6-7 adjust the fixed-point helpers and clamp cmax_wd.
> 
> - Patches 8-10 add the schemata lines:
> 
>   L2MAX/L3MAX       CMAX, percent
>   L2MIN/L3MIN       CMIN, percent
>   MBMIN             MBW_MIN, percent
>   L2PRI/L3PRI/MBPRI INTPRI, raw value
>   MBHDL             HARDLIM, 0 or 1
>   MBOPT             MBW_MAX, raw fraction
> 
> The new resources reuse the class, domains and components of L2/L3/MB; only
> the mpam_config field written differs. MBOPT and MBA both write MBW_MAX.
> 
> So before this series userspace can only set CBM and the MBA percentage.
> After it, you can do:
> 
>   # echo "L3MAX:33751040=50" > schemata
>   # echo "MBHDL:33751040=1" > schemata
> 
> A new group starts from each resource's default value, so the new controls
> stay out of the way until schemata is written.
> 
> Tested this with a QEMU that has one L2 MSC, one L3 MSC and one
> memory-controller MSC (CMAX_WD 4, INTPRI_WD 2, BWA_WD 16). The guest writes
> every new line and reads it back, for example:
> 
>   WRITE-OK   [L3MAX:33751040=50]
>   SCHEMATA: L3MAX:33751040=50
> 
> Then reads the MSC registers:
> 
>   L3 MSC  partid0: PRI(IN)=2  CMIN=0x3000  CMAX=0x7000
>   mem MSC partid0: PRI(IN)=1  MBW_MIN=0x3fff  MBW_MAX=0x1fff  HARDLIM=Y
> 
> CMIN/CMAX are 4-bit fractions (3/16 for 25%, 7/16 for 50%); MBW_MIN is a
> 16-bit fraction (0x3fff for 25%); MBOPT writes the raw fraction (8191).

How does user space know what the valid control values are? What if a new
platform comes along with the same control but different properties of the
control value?


Please consider the ongoing work around adding support for multiple controls
to resctrl. Most recent RFC can be found at 

	https://lore.kernel.org/lkml/d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com/

An update on this can be found in LPC slides:

	https://lpc.events/event/20/contributions/2368/attachments/2066/4625/resctrl_2026_combined.pdf

The work aims to make the distinction between a resource and its control clear.
It will expose the controls in the schemata file but also support it
with a hierarchy in the info/ directory that makes clear to user space how the
control is associated with the resource while also providing an interface from which
user space can learn what the valid control values are as well as what a domain value
represents.

Reinette
