Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794422004;
	b=Jz1jK8HeqUCrRFGFB+fCrwR0/3bzJvsBakicSqUSHCHYaZdTNSUtOQ7sffUoqL3nGtZx
	 IrIs8/K9cbPlxgj+nNQtnzXNsqUukSYMsBMrBS0Y76+HfUWEI0bEpxuSJU3QhNt4eDNWC
	 s3PDA9rA3Pr6RfiLnMSJ3XNGIfz+IFFVwozM+kt9if9a5iIlWyOgZV5H+qqCsiKfhg2t0
	 e/om1st3KiSh9lLppZq17JPk499XhXY9g7SYXlBuxOJ8W4M+VMoGfg1Ou/ml0+OWrbxkA
	 PjPASghhl4YTqfwLFOwZpZA+cps+QEM+5llrYe/B+i0UsN9r5FDX8rR2Y4x3VTG1nVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422004;
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
	bh=19lcdKMgk38TdoXCiWhhelfCcBR8YDtZtnaqUa+rXMs=;
	b=juwTSnEpE76rXdseoAQe9LM7gjVE7Fc50CSrE9p/lSTQZ5oNjxsb8h3Yua/E8qB3JM2e
	 q36ePuOfUuEDMLaRE/ze6etWecak/HKG8dArIEDURdHxFqf5DU1UOtU1ext8w0OdvmuT0
	 6yDskTi8D/L4OnAPCfoBYPAJMuXcvM7mL0TkuJgGsdsjWYANhS+RyEDYRwihywznr2jfc
	 3kGrQ+Nv7Yc8WwCWjXDhuRNDxekLDbnB8IZ1JP6simLTRo62eFYbCvxkYBo3c0R20UDyr
	 zZbt8mCqkLGep1OIwKcoOMFuhe1w6hoV9WwwGyW/aijAfJmcSimOSUYFnihECF6J29w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f5d1RGm2;
	arc=fail smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B872606A31C;
	Wed, 11 Nov 2026 18:33:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B872606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f5d1RGm2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794422003; x=1825958003;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=zWm2Og6HAohtA9JVh3HCkOD+9H8QOd6KLxXPsc2XVQc=;
  b=f5d1RGm2QR1sntF8GsHHwnAAOKtWXzpQWvJrPprzPirFMmIQDyO4zdhT
   9w0WOlHk7dv3Ua+2Vsy2iMuMX89vTOVCWg7OTqCOp8DC/KXQCKYHkdYrJ
   qV0YEqV3xfFUeVODKHY51KqE2Zs1Ivqf8aZ0QBY1pTafGUrmGPJ58sYZn
   8+nn2Kf7T3vuqBG4nxJBD8ffkky6sIVhawGB1Vl0pU8KEq5j9NiJa53eZ
   TH2R4IMLsjPRC/v/1UuStlrurOsn0XOfgWuFp9Hj/SaaKQjzCKmJG55R8
   2ofkUxn5iN9qG2/L6YlVaN5yad996KeF/LQc6ID6g3zFv0G7/w4U7zM+S
   Q==;
X-CSE-ConnectionGUID: bO6iZjXyT4ymBqLZ0aAw+A==
X-CSE-MsgGUID: AleqptewSZeRaXEjj9S2tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3283372"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3283372"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:33:22 -0800
X-CSE-ConnectionGUID: AFurqsN5Ry2GSWuDLyiyuw==
X-CSE-MsgGUID: ecHfPJXeT0qbdTeeq2qH4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8477292"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:33:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:33:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 10:33:21 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.57) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:33:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cd2y1qzauVGy0vcpTLtDCfnugxLICXBiBUQ5MDJDfNw9TPx2+plKgZWd4r6HDCQkM/s4M3YYr3hrErOMpisKjFTfk2+3psnIqhjAfN8b7xeE/i6XfoMQ0Bb3Lt40EU5IqhDptQnIIt/EqMyBXocde4sDgoMKYVJUjyeD7a/kbUHZcfGsiybO1TFZdUE41T8GMB0+9kePp6na0Zr3uDYR5eYn4oZ/Qwm1k+TKvM3KPVhkgJEgy1QCqo8IQoOv5EPVSHLMUUW1WQaT9f5r3DCj8MWkSEVdCgqMo05Z80aKCMdc0mphKrBWo7TqCRX0FTQOnYoEXydg5v3ZEAMY56+nkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19lcdKMgk38TdoXCiWhhelfCcBR8YDtZtnaqUa+rXMs=;
 b=BZwmrnxL0FzGOh1+5zMnk0wA0Z5axMQ6CfaPreVjaVQ4z6cID12DZTKqkK7v/ysTZ9EF1qcY7LBW271tzGWvIh3hWQFN8lDDkBd0I8/Sj6Bc089jTucMnN2aRdPzulzfoTBwFzOUPs7Uy/LsXyhsp8w/2NEHhv2G0mUGpU9nCc7aBnQXOCSpvtieTpn+Ns/zCBJVDcp0ZLEILmG6/MSm0bL3Vo21PrrhtdBTRRuof1xBZx6HrsRsECKs7xr9AGVdbvy0lcv5srKfEDP3FWUUjFaBjb3U8zKjQ5otBSxRK7AFo1Ycm42s1lRw+E1mvr38MgAnbU+JOj5nDEwTvmMRQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by EA3PR11MB771531.namprd11.prod.outlook.com (2603:10b6:303:2eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 18:33:19 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 18:33:19 +0000
Message-ID: <3c48dac2-78af-44c9-b546-e5fcf7bbd8d6@intel.com>
Date: Wed, 11 Nov 2026 10:33:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 5/7] fs/resctrl: Release the limbo RMIDs when
 the CDP state changes
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-6-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261110133938.3768632-6-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0139.namprd04.prod.outlook.com
 (2603:10b6:303:84::24) To IA0PR11MB8379.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|EA3PR11MB771531:EE_
X-MS-Office365-Filtering-Correlation-Id: c157dad3-f002-4e42-3e88-08df4022420d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261009223027099003|10067099003|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|5023799004|56012099006|4143699003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: 40FFrXuYgRCKJBVd68GRmACiD83ebGqEDQTDHW9QeNuL3qIHtCoh/ZjKAZK5Hsq/KYKY4dgTNh4uuxy7h4e+SEk+Tgvzh93L9dKYmaUBdwUbvSD6Yups1tQQSFuJBog6thfD1GoUd6AhWecMvtywI+4W3U6SmfCfJK8D82w253Q3ou4d1ZpWPy/G+dmQq9SgNonip9/jPoVeI9KsHpXalkW+8dkfDvtVaftQ9IL6VOLTyO5Cn54sQuzV7vva4yNVQsd65al4oL+pk2qP4SO7hIH6RZl5blhgE84ii4SOejtQFQQSpB2l8G1vJt939V+rsyVBxrkM+uPmKzu4ljYhkoXd9H91Sa31UU8CuZsu4fFyry4lUjzCkTh0qnAi6DCg5ZX6kmf6NkCUkCn87Ac1Xc4GKNvy7A4U7TT/TKal61I01NkFecmlqxppnp/xjmY6JBkpRjpVAlLscTBJzbHoVlHYUUVAhotovCnjUC7GpeNroLeJl/1dvzngoZ/5cTljqbH4+P4B68IawmO10dgC/TyL/qAzvd4JflUUlTIfD4gQV3ZILLuwVDPYr7KOecq3tVG/PpfxyNy+epLa+MWOzyaXv6wtWkdvjQ11Vs7cvx4JnJfdbdMUuvUT0K0v98aVSuH9E3+VJ+NOj9eSDPQHRZnzcutVP0L+Zm0lNQYfBxOHFBt5orQPkkLaTmj67SPS5tsnVqkhUd2SNbNw97LPXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261009223027099003)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(5023799004)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEkxMk1NaGdEQnUwVWZyM0RvRkJ2bCs3bldPTG9hak1TS3lSeFYxSitRMERN?=
 =?utf-8?B?WDM2MnhiUzEvTkhlRU1ORnRrSkNZYUR5MVRuNTdBdUZXN1R6cnJBRWVtRnhK?=
 =?utf-8?B?MXhqcElTQXlvdEZyQ2N2SWNndGdGNUJaYTlITDlSZFhxZnRTUGFIMDJtV3Nw?=
 =?utf-8?B?dk5qOGV0ekJpZFFob0E5WXd5cDJ1WS90cUN5dnd1U3lvTjBNVDZhbkcxUUNU?=
 =?utf-8?B?YWxGRk0wbkZyZUs2RVBBaHNaanZ6UGVVbjRCdE1TbytscXVONGp1MkNpME9r?=
 =?utf-8?B?YmxQeE4wbmE4R2t0Nzdqa29sZlpjQWNpei95d0o4S01aTmppTzcrcE1vVWR2?=
 =?utf-8?B?QWFyK3dvS2JKSWdlVUVIb2NtUXR4d2N4SGkrQ0NSR3ljQ2NnT3VodXF5TGs2?=
 =?utf-8?B?Z3YyMmFVak9VWkpCVDFYU0dwcGhUYXM0U1ZhbTRZazhHV3FwcHdqVTFxWjN5?=
 =?utf-8?B?THpaL3JsdU9aalU2clVMNTBpN0xtVEQ5bTQrWlk1Zk5peXFmcERIRUNBOUF0?=
 =?utf-8?B?c2gzSE1XNTNPTjVESG1iQThpSFFsdTM5YXJ3K0NzVDZxN3RtTkNtdmVRVEdw?=
 =?utf-8?B?UFplZjJqVk9aK2hDZFZWRzUxWHo0STJlRWVINzZLaERJc0FzZ1ljVlZyUmdx?=
 =?utf-8?B?djJ3aURFbUZLZ1hIdEdhNk1oVEtoc2lWalRGRGcxbnU1a0I3em9FUVZvS2VC?=
 =?utf-8?B?SmNyd2UzNURiS1ZmL2p2R3RUNjU5cHdxZmtkd2tKQTl3ZUxpQm9VQnNyc05v?=
 =?utf-8?B?ZDBRcUgvVHRrMlJOV0Z6UmtXSVphb3N5UFc1U1BKblYxb2pwM0hjOUhlalpy?=
 =?utf-8?B?SlBLMDJTbGZuTjlaWmJneExOZ1p1Y2NvRzREdFcwZkRhbTE0a05zcWhEcGpz?=
 =?utf-8?B?Wnc4L2EvZ2NJZktBNHhqMzZvdXU2K1NxaVJxR1o4YnMzcGJkMWJNWm9Ia25m?=
 =?utf-8?B?WVZlUUUxTVpKNDZPSE1HZjNUWFpNcVp4YlN4ZmlnNUJJM1UxWnlneTdOMWVp?=
 =?utf-8?B?K3BjZnhCUVRoUkV5UmhZODlwMWpOaWJJek1OK3FTSHpQbldiYVdjWCtjN01s?=
 =?utf-8?B?MzNkS3h3U25Wa2ZHU3l6Q05LdU1HQ3YzRUtJU1p2UXFDbmU3OEM5TVVnK2lQ?=
 =?utf-8?B?Yk5CL0plbjl2enZyOWV3dFp1eVFuSStzc05VNzg2YlFBQm5IWndwN1AwcTg4?=
 =?utf-8?B?NkZPeTVlRFZhaEpQMEUyTzUwbElkRDh4UzVXZ2NhZzF1K3g2RC9QZDg0eDVs?=
 =?utf-8?B?bmdnUkp5TkhhU3pOdDBIRnU4VFVvUW9nV0syZmx2THAyMlRZR3lITFJOdTNh?=
 =?utf-8?B?YzZmL1dxOFRGS2E5WlY3NW9EUnJMTEptV051ZW5MNGQvR3lxNjBBNkFrYWJI?=
 =?utf-8?B?U2NJRDZueVAwNU5UaCtHbm1UNUNEcks1aU9iU0JzcG1NQUUwbjUyd3YzcDdv?=
 =?utf-8?B?Y3diOVE5SlB0aCtBcGFMNTc5NTVlREhCWUJFR3ZETk4zSFl6ZWZ2WWpVem9L?=
 =?utf-8?B?TWl4a1ZoTXVWYmdhbXByZFVISXk4dTBBN0hSTWFaU0hJOGV6K2QxQlYwZjdp?=
 =?utf-8?B?S1E1d04rNTgvUHUyTDA0SVJEZ3JwVVRxQ2NXaWlFVTFsSG43WDVhNmpoMnpP?=
 =?utf-8?B?NG1vNUxGQjlvb210T0Z3SE1RU2dTQ1lnaDc2aGR4TDJLWExmZFNqcFBEc05Q?=
 =?utf-8?B?MjE4cHVVU0IycGRsQVZXbWpzMWQ1d3RkTi81RlpOZUI0OUV1Qi9udXRFUDVq?=
 =?utf-8?B?Tks2MVZvUFJIL2pRZDMwdEZhSVA0dzVlRlFCMmtZS2VrUHZHdU5GOW5BOXI2?=
 =?utf-8?B?N0VMRkYzYWt4VWwwUjlQUkx1d3Q1RFJlNld6ZjBibDRqd3lXZnNkTm9rR0Vs?=
 =?utf-8?B?Ui9PQVB6QXpva3BwUVZvVTJ1eU9WUHcwWFVUZndYc1BMcEtaOUhVcExZdExa?=
 =?utf-8?B?MGJLa1NZRUNndEhnS0pyLyt4QTc2SEZKRjBXQVkzRWt6d2FIaTZ4R2NSL3My?=
 =?utf-8?B?Zk8yc05YOFpTdU1xQUNKbm43T1I0QisvVVE2R3NLVnc0bWR6cjdKeFhsN0N4?=
 =?utf-8?B?SWpjeFZ3eW1pbTJDeW9Oa2poRDd2aWFUR3NuQXVkSDI1Sk5ERmlRS2oxVXpR?=
 =?utf-8?B?S1ZrTGVJaEJNbEdYZzR6bmtMUnkzRDVGUEw4d2VzRFBHQUpoUlBBdXZrNTlj?=
 =?utf-8?B?S1RxdkRyTlRqOXhmbkJseFVnbkIrNGZkQnE0NDRNbkJodWRNV2gxemNqbkRV?=
 =?utf-8?B?YXhaNURHeGtCUmFaRkZ2RzVQMUFHL3Z4OGZXcXR1Z294STVHc1NvSlhCOWJH?=
 =?utf-8?B?K3hIUmlPZk8rb0RlUVRuVDF5NElxMEw2a1c1R2pqVDUvekZwT3ptb1VyOWRk?=
 =?utf-8?Q?oqavr9BA1ClsZ4m0=3D?=
X-Exchange-RoutingPolicyChecked: MSMrylB1RTwVFbsNcHsQNPyh9a/RvvUraPQ2IYUJ2feyI8JPxQcbhFu5If14lGS7+rryQqvBiEEC+kqHmAay34kSWv37C9NTJP/IBCV4RRd59HTF+0yWKoCVWFm83jmK0QZQ5GxbQbi0kCUNeR/4NEYXZifjjrkpncK2Df6xXzOdPlmvXTgFqZuL+z6eGYTmT7pBlpHiCzsialEiMmJ41Mr9brfd1pRSilNisfCtcXcGZ3TvJHrCdJbFjvZcOWxVdgkiNPmXXQuyk9xL8NnrN/ZBzXddq7VrDV3aqrcH6D1ckBx4SBy4AnBsRR2ce6o9p8Gf0h4E64X33/ubrJjj0g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c157dad3-f002-4e42-3e88-08df4022420d
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 18:33:19.3111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVwS5dw62whO/b2A5fSaCnFR8ePFs1FhaV8aWLsYaQXogbOdmuYQuTf2eQmQjYx1UdNZnMY061CoCv9g68EkM1EzGpvA5Rew5iR+5UHRzfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR11MB771531
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/10/26 5:39 AM, Jinjie Ruan wrote:
> On MPAM the counter of an RMID is selected by the PARTIDs of the CLOSID
> that owned it. Without CDP, CLOSID c is PARTID c; with CDP it is
> PARTIDs 2c and 2c+1. An RMID that stays in limbo across an unmount and
> a mount that changes the CDP state is read through the PARTIDs of the
> new state, which are not the PARTIDs its cache lines are tagged with.
> 
> With 5 PARTIDs:
> 
>   mount                  CDP off, CLOSID c -> PARTID c
>   mkdir g1..g4           CLOSIDs 1..4
>   umount                 RMIDs enter limbo with CLOSIDs 1..4
>   mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
>   limbo handler          reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
>                          MSC error interrupt, mpam_disable()
> 
> The other direction is worse because nothing reports it. If resctrl is
> mounted with CDP and mounted again without it, CLOSID c is read as
> PARTID c, which is in range, so the limbo handler silently tests the
> occupancy of the PARTID of a different CLOSID and frees or keeps the
> RMIDs based on it.
> 
> When a mount changes the CDP state, release the RMIDs in limbo without
> reading them instead of restarting the limbo handler. Cache lines that

This is a resctrl filesystem patch. Please take care to make it clear when
the description refers to architecture specific behavior and when it describes
filesystem behavior that impacts all architectures. First two paragraphs
describe MPAM behavior. Above then jumps to resctrl filesystem behavior
but it describes the filesystem behavior specific to MPAM systems as the
new filesystem behavior for all architectures.

Specifically, above needs a caveat that this new resctrl filesystem behavior
is restricted to systems where RMID depends on CLOSID.

> still carry those RMIDs are accounted to the next user of each RMID.
> 
> The CDP state that matters is the one that changes the PARTIDs used by
> the monitors, which is not necessarily the CDP state of the L3
> resource. MPAM gives every CLOSID two PARTIDs in all MSCs while CDP is
> enabled on any resource, so enabling CDP on L2 alone also changes the
> PARTIDs the L3 monitors use. Add resctrl_arch_mon_cdp_enabled() to let
> the architecture report this. Only MPAM can be affected, so the RMIDs
> are only released where the RMID depends on the CLOSID. On x86 the
> RMID does not depend on the CLOSID, and resctrl_arch_mon_cdp_enabled()
> returns false.

nack. The helper name and value returned on x86 is the first hint that this
is not right. For x86 the value is not a statement about x86: CDP exists on
x86 and can be enabled, so a function called resctrl_arch_mon_cdp_enabled()
returning false reads as wrong until the comment above it explains that what
is really being reported is whether CDP changes the IDs the monitors use.

Every architecture now needs to match this. This looks more like forcing
every architecture to indicate whether it has the same quirk as MPAM.

If there is no way to handle this in MPAM driver then handling this should at
least be contained between resctrl filesystem and MPAM driver. This should not
be forced on all architectures.

I trust the MPAM folks to say whether it can or cannot be done in MPAM driver.
If this is not possible in MPAM driver then it looks like this needs to go back
to include the L2 CDP check as was done in previous version. With this check 
gated by IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) it does hint "MPAM"
but would also need a comment to explain why that is done.

> Reproduced on QEMU with the sequence above:
> 
>   mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
>   mpam:mpam_disable: MPAM disabled due to hardware error interrupt
> 
> With the change the sequence completes without an error.
> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Suggested-by: Ben Horgan <ben.horgan@arm.com>
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1+

Is the "7.1+" constraint needed?


> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index f56d0e32fd06..87d744a168fb 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -70,6 +70,14 @@ static u32 *closid_num_dirty_rmid;
>   */
>  static unsigned int rmid_limbo_count;
>  
> +/*
> + * @limbo_cdp_enabled - Whether CDP changed the hardware IDs the monitors

"hardware IDs" should be invisible to resctrl filesystem. The filesystem and
architecture separation should ideally hide these details from resctrl filesystem.

How about something like below that also makes clear what "true" means:
	"True if the RMIDs in limbo were placed there while CDP was enabled."

> + *			used for a CLOSID when the RMIDs in limbo were freed.
> + *			Only set when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID

"set" -> "used"? (to highlight that all reads and writes are gated by
CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)

> + *			is enabled.

"enabled" -> "defined" (to match surrounding language)


Please match the spacing of surrounding code by using spaces, not tabs.

> + */
> +static bool limbo_cdp_enabled;
> +
>  /*
>   * @rmid_entry - The entry in the limbo and free lists.
>   */
> @@ -1044,12 +1052,15 @@ int setup_rmid_lru_list(void)
>   * resctrl_limbo_resume() - Restart the limbo handler after a mount.
>   *
>   * The limbo handler stops while resctrl is unmounted. Restart it on every
> - * domain that still has RMIDs in limbo.
> + * domain that still has RMIDs in limbo. Where the RMID depends on the
> + * CLOSID and the mount changed the hardware IDs a CLOSID is monitored

What does "hardware IDs" refer to here? On the resctrl filesystem side I
think "RMID index" will be the accurate term that makes it clear what this
refers to.

> + * with, the RMIDs in limbo can no longer be read: release them instead.
>   */
>  void resctrl_limbo_resume(void)
>  {
>  	struct rdt_l3_mon_domain *d;
>  	struct rdt_resource *r;
> +	bool release = false;
>  
>  	lockdep_assert_cpus_held();
>  	lockdep_assert_held(&rdtgroup_mutex);
> @@ -1057,6 +1068,13 @@ void resctrl_limbo_resume(void)
>  	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
>  		return;
>  
> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID)) {
> +		bool cdp_enabled = resctrl_arch_mon_cdp_enabled();
> +
> +		release = cdp_enabled != limbo_cdp_enabled;
> +		limbo_cdp_enabled = cdp_enabled;
> +	}
> +
>  	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
>  	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
>  				lockdep_is_cpus_held()) {
> @@ -1068,7 +1086,10 @@ void resctrl_limbo_resume(void)
>  		 * it is queued again on a CPU picked now.
>  		 */
>  		cancel_delayed_work(&d->cqm_limbo);
> -		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
> +		if (release)
> +			release_limbo_rmids(d);
> +		else
> +			cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
>  	}
>  }
>  

Reinette
