Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62644F85D9;
	Mon, 21 Sep 2026 18:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016287; cv=fail; b=gh53RO5d85BzGCKmcthM81Os/ksheQg6o2uUoz08U6FHXdezSMowArusTe/JJ4WqKj1l2SGFVJp0jgItgD25UH6299wl9XEZPECFWOBG4UG6zwKn9OGy3Xg6SMgewv2Myh6PqN85KZcGjrzAK8vSDpEMyEDURgWdMCHB6QSU2LM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016287; c=relaxed/simple;
	bh=SsxGukuwx+FpDXXWV9tKSwXvbeNo0sLS7FKOZHmWATM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ioulx2blK2olln2sMZZf0KDSGmLaHIsYHpgxy61sPea7ZAaukAYqkG8eiq3K9sR9iIVRhCx91PK44EeCeulwZLanGg//s0vstPuX2E8tyQtHbU/sb0IyVFUg7RHPE2Tv3t8KAb2kviAaYWUVbUUQnnEiGKEg+zgA8JOsQsJafkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMjonQeI; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMjonQeI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790016285; x=1821552285;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SsxGukuwx+FpDXXWV9tKSwXvbeNo0sLS7FKOZHmWATM=;
  b=FMjonQeIikJaPTSC/WkFaqYXLT6pb/+obEoxOWNhZH8lpDlF2Gi1bxvZ
   UNiqULkrEoawOd8UaNDzwZwEQHvdXOuZwgkeAFNH6iHpSJn5mAdhU6qhc
   WxPwPaVoyih5YML0SqmKnHqakuCJ7GyojvsL2n9WC5Q3+U8q4fNylcD13
   Zp4Vj3UwCQPvUclD20X8EfG9/MYHPg1GvJ7IYHHVrYIGt9+Ejn75ccRI3
   w6jLCUH9nHOeuw6ZQrw6XkOCaigoPeCOlwgqxtggRBEoAWZi/N9lwFZEZ
   Z6NjndzxTCUb/zbjSYNoxq4svlr9UkblgtWRQGObcRTfANQpfYVb17Ip5
   g==;
X-CSE-ConnectionGUID: wbbGJBEQRLO+zHjQyx/KZQ==
X-CSE-MsgGUID: 0HLPCddUTHuatZlDodaHig==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89485858"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="89485858"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 11:44:44 -0700
X-CSE-ConnectionGUID: nY6cfNGYQ/ezH8DbYlzvoQ==
X-CSE-MsgGUID: 0ex4P3LKRkK3SEd6ybHMuw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 11:44:44 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 11:44:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 11:44:43 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 11:44:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uPqm+laYhcUFgXWx/GjH56qe639+zkmUud3lRxBiD1O2OarGanDBSpxN1vfjp2zXVAycnZKUgg54+nZ3znZ3gL6ts0GLyIPKoF5E1lYT4R9F/4hDUtHeymDqlnY4PseBww/LyY/oWyVBlQ1HRnaXOQQL0Lh4KT1WTRCiHwnfs/o4H0e4pvuWdyFpMjzRkBFm28iCesGxERj79CXHXkCgKSHp2khysvzrOlYeiVfjQd9MGHhBitEaWOj5aEOBh3QTQBQhul38ns3pbPIVDu1uLWIAX493Jr6fu5cVTONDitWDTrGj1wiZsuNX/eWHb1qchKIQcKbS3t2t6iTfXGNRrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGWsQDsiQJAoayIf38jRnxX70/IHuAjSasTUqzr8qGU=;
 b=dnDL2vgMyXzrUccveT+6PyZp43AJM9KmPQPV+U6eB4nYxNAiuwyhgMLBgEPRbamA9SqHKqFgsXYNtg/HRyKIGh+yWKd511mQswwA0iPODHAt1s14F/Cjg7USt3WA2xt1huLzMEHbNrIpHqVwhFYz2M4/46qQoIc3NRLGSu3aUnCeMfeD7Q6jrQyCGnWHK6yV9MiVyZZNLG43utqUN03MKin1E+CS71l3an7Mke+smXvsO47TBNpdYpRedERyxFRNVrbMPPoiDd0uY72SAt+7nWXXoVBTpqrlJnKxm9uRqDonGbgD0tpTq2K9mXP2zl4kRyBFvOqwL2SChDIudsqiRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DS0PR11MB9453.namprd11.prod.outlook.com (2603:10b6:8:298::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 18:44:35 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 18:44:35 +0000
Message-ID: <efe2712a-a36b-49be-b6cf-1d2e52b836f9@intel.com>
Date: Mon, 21 Sep 2026 20:44:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/21] ASoC: rt5682s: Move mclk acquisition to the i2c
 probe
To: Chancel Liu <chancel.liu@oss.nxp.com>
CC: Support Opensource <support.opensource@diasemi.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<patches@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, "Oder
 Chiou" <oder_chiou@realtek.com>
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-13-chancel.liu@oss.nxp.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260921104640.1941554-13-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF00000981.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::818) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DS0PR11MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f121f06-bffa-496c-4557-08df18106208
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: G0pvGQlHf1Cf36YQ1QPTcaLkWVj3WVkeHltyRppVcej4afJ6hOk7ECtmpYGN2VNQi0dAtSKZH1QxI/NR3F1yAqOxLoOapemM8Y95BRbKMizuyWfy2VugACsWPQJFy6/I3OZjbPVEKEs5DXZJuYu6b5Fj293ZkNMnVmdKB0YQptxWPbP+UkvfkGEEbmrMchXmbMOV2U8MBrDS5lz71oyZzQbSQfa2ZcSe0xdwcr9NM3YqboH52+FL0QsXXQxKM72IybhKr6fWacNCDmYqf0Fc4IpBY9TiJ/HH1uZg1nEp0W0ss4W8nd/P8D1rEWEjZTJkwkw5pJkLx0mxK91G8bsiHrqTm/5H0OaPqc1OIwODs33/83v7IlktVsf8PVQCdv8W+Col0k9J+HTmeI5uPcT7dz9U4j3uuLIaWY7Q1WffnhPbD8jARVwq2uHYQb52gOFO/3Z/tVoKK24qptXxpo3Oa5rXQLeFc1JnAgg9GYdt2yMnbQJduveuhAV0+03Yg1yw7iM3BCdzs9t0HZcv5lWuokmSIy9FScNiWO9tMIizas6whiO1xyyOf/PI/i27WKRi0bT2fh84eaCCN6l3M9vkRGBjONwGpcDq9C8OsDNN3bmVKM5qFBlsa61z7YSfikJy6PY7cQP3ijO3SwcbDom84J/FxYnoMP8K8HESpQqk5Ck=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjl6UzRKd0lFUDNxbXF6SFp2bzJCMzlKVkVRc3dHTjlFZDlSWGdyUElib3lT?=
 =?utf-8?B?bnR4a2JaQXVtcUovWS9hdEcxYVZmQ09pdS9NZ3JFTDVXU1dJWW9wbVpDdkRU?=
 =?utf-8?B?NXEzRE9tK2dmVURVUndSWWE5NzRyUTkwVEFHSzB2V1lTR0R1T3FCRWl0MUdG?=
 =?utf-8?B?ejFybEJSc1NSaDNuZjJiMXpnOVNOUW9QRklYZjlSZjh2VkdSL1h2MHNmejZP?=
 =?utf-8?B?RDdJZ2dOb3FDc210YTZrL0gwS0dKMElZUFFzZmhzT0pONG50bmdBS1ZPdDM4?=
 =?utf-8?B?TmJ1UWVaazBiSjhNanQyUHFPemVnMlRwWkhoU3ozTy9ZelBhODJpRkFvZUFz?=
 =?utf-8?B?eDVUYWp0cEU4MDNXKzJyKzVqNTN3OEtHKzU2WUtFeWwxMHhocWVxKzY3aHZC?=
 =?utf-8?B?THRHcmhFRFhPK0paNkFKNGRmeE90K2MzZW9FalR4MlllRjVaZ2ZUSXZNTDN4?=
 =?utf-8?B?N0RCc2ZYOGFIWnBUb1AxcE8wZ0xWbit3LytFdkRUR1l4MlZaeWRRd2hFVTUv?=
 =?utf-8?B?WXh2VnZhNGgrRU03UlhYSVlwbi9HUmlUSkYvZmMwRGh0cG55R1JZalBWV0Nk?=
 =?utf-8?B?cUttd0dDNGV3ZlplYjhadk5xS3JmMktaK3JsVHEvUmQ5SU9wVW9MVWV5OTd6?=
 =?utf-8?B?VHpOdXk0OTBBOGp0bjFNbUJINmlRc2ZOMnA1Q0hEZS9oeFZ2TG1KNFh3TklD?=
 =?utf-8?B?VXArN28xTlM4djJqaHVWZm1ONU5KdjJuWFZienVYOSsxS3Job2J5QXFTWVF0?=
 =?utf-8?B?KzZIMFJjYnVLTmNHckNRUzVkSnlId0wwczFodTBhTEV0MzhTZENCbGpiUmVy?=
 =?utf-8?B?Yk9Bd2dtUHl2Tk90bllhNlZRM1ByTTRkMGczUWJ3NHhoWjNJSnJrL3phd2lw?=
 =?utf-8?B?Mkl0TnJuWW9RakhtbWxWOTJUcEtiVndMYit1UWxjR0tnWU9YcGVRdnhNUWlI?=
 =?utf-8?B?VDFTWmVvM1Juc2xpa1dyRjQrS0RQVU5nZHZ4Z2ZGUTM5dUNsRkdBbUdkSHg4?=
 =?utf-8?B?ZXl1VEZLeXloeERqblNkNUpTQVVqejZPK3ZlS1NDV0tJYWl0YzBZS0VHK1JD?=
 =?utf-8?B?RXpmblMwSnpxSm9qd3FpUUlORmhib1ZzalQ2Q1hhTldsMzRKNlI0Z2pSZ2hR?=
 =?utf-8?B?TmxkME9JeGVTUHdKZXpJR0MyUG9jYzl4RDlLZjlzY1dpa3hjSklpRStrVm9o?=
 =?utf-8?B?MXJacHVCdzh6V1Y0SUs2SlV2dmt3MTd5QTFIQllIL2hlS3FScnhiQzVuZmpH?=
 =?utf-8?B?cURMRUorb2FiM1FKVGNmSGliOTlkd0x2czJCQTNQL0NoUkp6bm1YM29mak0y?=
 =?utf-8?B?UXpQTzJNY01WcTBnT3k4ZzNBYXVJZ1ZhOU85ZnJWc3BZdXVBWCtpTkJTOTE2?=
 =?utf-8?B?NTBPNmNUSWFmelBEWHlDU1hJU1ZnQzBXd1c5NVJicEtnNEZKb2xLdTJBTy9T?=
 =?utf-8?B?UXNhMjFUWmpGQWx0UzBMWFVvcFZIN1F4d2djSy9FaTc3NHRYN1hPK0dHT1cr?=
 =?utf-8?B?cjl0dE8vRTRJM3RUbmNRekJjZVdaVEpMeVYrVEdVVzA5ZkkvMGhVK2kvT0la?=
 =?utf-8?B?Z3FiRHJUb0JUTTJuU1lPZlVqMHkrbEs2dGtCeUdTUndyUjV5UEtRb1YzMkMv?=
 =?utf-8?B?a1k4WlNqaTFqcHFQY20raHNnMURKdk4xNmNIazZ6TjQ2UW5aT0l2VExmcWlR?=
 =?utf-8?B?cEppeHdzQ0dSTGVSYUxYSUdyQmV2em1oVkR4Ni9tVjJ5eDhISWFrRWc1eHZq?=
 =?utf-8?B?VG1xZXF4TEowT2hkajlwWGg0bkxZMWNTV0xzRS9YRHp1TXJudG5hSGNVVTli?=
 =?utf-8?B?cGhWaWV5SzE5MDlJbjByMnZrMEljakQ2Y3RhbzVCVEFRQkJzZ25LWjBzU2xH?=
 =?utf-8?B?dHFJYlhXNUlpWUNvaXdZZnZ0cThYQk9aY1QrUEQ1Wm94aWJnQlZpZ0FZY3Uv?=
 =?utf-8?B?YkNIV2dUeHRLOElLY2hwbThPUlF2clNUWUdiTHNnVHBwMTBVYjNmYkl0bnR1?=
 =?utf-8?B?bDFIcndKTUM1TXAwanZKRy9VaVVZR1A4T1NQNVNCbndYQ1BnN0hUaDFXVzdF?=
 =?utf-8?B?elFoV01VUEVmOElVYUhaMmk4eExYL0lDcXI2TFYxVWVyditIN0YvWEVNc0or?=
 =?utf-8?B?aUZmdk5rc1gydlFkaGpqQjNJdUZMWVJseW84SzJuUHZZcSt6UHJaUjhGYU5j?=
 =?utf-8?B?UStXUmRLL09COGVDSHdKeXpFdm0yUVZCbFlqT0t0MkFkemVneW1sV29SUXpR?=
 =?utf-8?B?YnVOclR6VHdoMFhTZlNsNUhpYXhBL2dFMmpEOUI0cEdML1UxVHRSajRLU1Rm?=
 =?utf-8?B?WjUvYVNmWnRSWnlxM3VONWppMGlaTlBOUFF4UFhiZTJXLzE3Rnp4bUdaeGVx?=
 =?utf-8?Q?AU962v7u9aH7qjEw=3D?=
X-Exchange-RoutingPolicyChecked: rLoNv6BP0Conps+w5/RbX+pQKs0vu7v/UnK4pyXIEV4w9KtJQzZtHsEdE4n73EzQNk4p8nsL7HCG7PoM4s3JlMAUrrz2h7AIMNNahqJRL+Utj1v398bnz8fYnmxezI8Z0ajoFZ4raQj58Znc0AyDWfdsOVKAtSXDKtJj6/HjX4tCkcIGzNVv82nF6F6m41wW2OVG0EGbFzL58xzlUSqSXxz7ce4ZjtmJ75VtFbKOcVg/nsHH/l2oB/gAfh64tohJZ4xQMKnLRFhoHcmRVzVIpM4aA92C02PvM+5QG3v45h13quoVtKe8PqMjBWCK35kNSAEfS3rPNUhjEmZsVrP/9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f121f06-bffa-496c-4557-08df18106208
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 18:44:35.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7CXYt9LG+JjcgGPMY//x+DGqc0C6FKxWhQbcW2PKa6O8d+QR76gT8gAKZNLrMPZHCtKsQJD4UiUcenvEOB3NeYIzVOj0eDBy4j/05I+DvSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9453
X-OriginatorOrg: intel.com

On 9/21/2026 12:46 PM, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> component->dev is the underlying i2c device whose devres is only
> released on physical device removal, not on ASoC card unbind.  Getting
> the codec clock with devm_clk_get_optional(component->dev, ...) in the
> component probe chain therefore leaks a clk reference on every card
> bind/unbind cycle.
> 
> Move the devm_clk_get_optional() to rt5682s_i2c_probe() so the clk
> reference is tied to the physical device lifetime.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Nitpick: Same as with rt5640 (and TBH all the patches here), updating
the title so it starts "ASoC: codecs: (...)" would be appreciated. Alone
not a reason for resend.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
