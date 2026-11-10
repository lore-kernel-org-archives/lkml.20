Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794276230;
	b=pkn0NxFQmsQgM4t0r+xJ1ayY3A7Zp1ynCR2KYOJGnknlr+kPz+pXHdrGC30a/ATkBE5F
	 1M1nVTK8nc2UuS+Gsge/1cE6JqRwh/3r64w2LYg06q5vgkPRwT+TkWCnIxiw8SsQvlaDj
	 Wv3KyTUdeGK5M2/687bXjKkb+K+W11rvkeJlm65FsYIEJOU2FeDLDVnXljY9/z3D8EoEk
	 VEmEb0XixXSGksmH6HqoJitgZWLhwUUO3qLROip9Ipn9zJODWA/tb0CCFuXoiqO0FZuLY
	 1RX5Ft153mvndjVMnRlNWWCaXWS8OosPpnbDXDSg65y3JTwPaEzreuq9xzaXfsiT+ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276230;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Content-Type:Message-ID:Date:User-Agent:
	 From:Subject:To:CC:References:Content-Language:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=QL2R/+kKKTnQRg5DoRC2lwpbQOVSzeMixyvicUwAJGI=;
	b=pJ39VERXOwkLCqWYJX5si6qOH95hbwCB9cyHTciztd3Cyd7J0ukfe5VMWIBiJyhNSwYS
	 /iiLAublBl75WIKfFNCaeXsr7sWaypV9j4urJkIH19bkYkfmke2cojOU4ENXwhnmG0Z5L
	 +Z335ApIGZUenjHN9Sgj93PH8dreyf5Dd+3ShUCgqf+NiT3WDpdSRf3j6Bq/+eg66/6Ui
	 RZ32MnaLDxOD4UXqae0tmd0WQ+BC6x+HP1V/J9ANSUDyzbSIW4J+S5+MciSTy8tuLubHX
	 qPau+nXavbkkqxe5XEjWb4atBHo4hRsAT60NAs7UqACK27lJKaCy9OSUHgpAqE9YtFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3FiWJYH;
	arc=fail smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4872606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4872606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3FiWJYH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794276228; x=1825812228;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:mime-version;
  bh=dNdYj+oKz8bs9Gn5POT3+oZ+zv8c9KaxDwAxBxA1tVo=;
  b=C3FiWJYHK8GyXVH/rqy85AGlz7R0p/0mHqnF58c4j2buS/WLBEsZ3nYs
   s5FyvhsamRQpF5CASxpyrru7GhyL0Elkxq2VJ4JV4gnSuexsa+jPbZWjP
   nWVDRSvI4K90MHj6N9fpXQPQk0+wBxv+dbiitC+/9Wu/2z+u65wUnyGiZ
   xr68xI1UZDvaqbNNXr1M5D+vTGasXgmRTQtJv+Akn4f/bKB0zPBfPT027
   OkYNqHsAgMZHfEZyGo1TNzQS6aofdlhrQKyip9SVcxaKMQiQzCm5Wtutj
   VmtFvu0xV+TK7rmjJFV9VgUjhe1o1iwJQzvni9Ex8/2GXhX6nAMP4u0or
   w==;
X-CSE-ConnectionGUID: BcyXe3etS4yGUnQa6WvibQ==
X-CSE-MsgGUID: TcuOWrB7Te+sBmVZBIH2kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3047135"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208,223";a="3047135"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 18:03:48 -0800
X-CSE-ConnectionGUID: 3295PnOyRu6whrne58wTiw==
X-CSE-MsgGUID: wF77pAPCR4+miiW0L+i76A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208,223";a="7880230"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 18:03:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 18:03:46 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 18:03:46 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 18:03:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJy6xBOq4w9AjsELCcMRQF1htcEgqU1BvkcJ+UCMIoBs2H4fSiTvjqcfo0/inaogVQjexW/Q+2yEGjoCWEA6TOtAKBc20IiPrURxG3wKpaGdMjJhlk3fxyrt2hoGlu+sr69Ss3HBvU7Btbub8qb2c1J+vz50DrYVwO8W4jKKGVF5p8YdMYdWXvgi/Ifl0omymD6u/K1XcZS5B3MsDBpaL+GqUfdTHLJiE0hT9FEgWw3qYyrVamksOP8vpCuSJ4ui0p6FSHAztvWHKN7Tl53XwzPxYj4mCVZzJ7ODaXb67Pb9cYIS6XUn7VPg3HytipYol3SgBNXNeyFuGiHDqxd3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELPEtQRCptQ/5LgQ6n9ZEcnOY1odWirxGUn7xpuC9zE=;
 b=Bb1KuKhowzC0kg910gmuL1TDB/VdVG6q7xaULUFZi1VemABFrfCm+t/QZIKnZ1C8fyLQyyiHB82ojwl3iuv1rEB+XfDDPhtrhSYJ9mEi79fMzitgCBG6rL/rrwcvoim7Lu9uRhHspsnIZfA96KONgLp6/JidlyQ63eWZ881ACpIGrMbZzaXTozJyrltuBPl8uyxoLYF/1YxaU2RqKWbiwVmxA3AKcN2G0tzPg+urjck+pjmwWJ9AEcFhuNuzqIS+bipJVTsFQOnwMIdCq482yNebbmuyVBSxBnh7eaJeESJSxb82W7V6XfFdUtaggqhPnn6JR3hrAnLKehrHlyX7SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 CY8PR11MB7171.namprd11.prod.outlook.com (2603:10b6:930:92::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.13; Tue, 10 Nov 2026 02:03:45 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 02:03:44 +0000
Content-Type: multipart/mixed;
	boundary="------------CzFr0nhMIGrHY4Z0NuVxmnpW"
Message-ID: <d81a45f9-1ba2-4eed-92f2-c5152c5caa7b@intel.com>
Date: Mon, 9 Nov 2026 18:03:42 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH v4 8/9] x86/nmi: Simplify offline microcode handler
 invocation
To: "Chang S. Bae" <chang.seok.bae@intel.com>, <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <peterz@infradead.org>, <david.kaplan@amd.com>
References: <20261104182322.578066-1-chang.seok.bae@intel.com>
 <20261104182322.578066-9-chang.seok.bae@intel.com>
 <1994d38c-6944-451c-8416-7be4859e2ecb@intel.com>
Content-Language: en-US
In-Reply-To: <1994d38c-6944-451c-8416-7be4859e2ecb@intel.com>
X-ClientProxiedBy: SJ0PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:a03:331::18) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|CY8PR11MB7171:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d20a99-955f-4f90-b307-08df3eced97a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|6049299003|376014|23010399003|18002099003|22082099003|10067099003|4053099003|11063799006|56012099006|261028144727099003|261022105027099003|261009223027099003|261026140227099003|4143699003;
X-Microsoft-Antispam-Message-Info: Yoznrb74tLFK7ofpsOaTv1XW9ajIIbqvUcB3dJRNQYPnaFi+x4p8KTpY/G19su0j4XMou5yAzvKBDLB33URpeigVdKJyW2HrQVPvFDVdY8rfHMUVQNRbpL4zrJLsK7VCso+5QFc97l2epzlzmKWeoUY3LeG/SDnwn7gZFwsfWVA84HRWPDOg8jf2ouV6d3Ntweoky4hBnmJFbTXNIzn9ym692r5yuP0qMYlpUkP3sFSPWDRd0vl3orW/6cpXjq77x0JJkTa75Ruv6Ty8dPXJ++WgK7LPqWY7eXF1+T3FReP/srxR6+CvDOulwpdMLcXlEE53M0aoxUrXHK3RUI95FVXLIJ7DzsATE3QO2ZsVvYb8yDYqrz64B9l7p7ZQyBxFzufjqRa87n29mn8/f98w7KIe7TxERGd315n0f6T2SWVObxMJjYGYKGVVI2MCoUrXiAS9vYjJdKbvYvwYhU5t0XDAtADCTELumA4CiVMGKfSaCXqBh60v0/q8ckGScH9PXKLMGn6Zd4Gdt7GdoZEyoM74pGlOEUEnDwGlT6xymODVGYAzpGRlA7i3Z3J8Ga2LgBQlZtS1T9BC2KO51sKpFn9dVeiNGnTKJQIH2J8j0YM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(6049299003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(4053099003)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261009223027099003)(261026140227099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGhvdVlTOHd4bVV5NDNwbmJWNzZlRWxjdEZNUCtwM1JsczVJaGJia1dMSmxX?=
 =?utf-8?B?bjdIakdVMWx3OStUTjVrVU5JY2dVWUlWeFBlaFZtSUxBc1RwOWNQWlhhMTVp?=
 =?utf-8?B?OEtraWRXL1pLL1dIOExMRTYyekV5dTBvMjQ4Tm16TkQxQ05LelRFY3JvMWIv?=
 =?utf-8?B?Q2J5RVgvaEJObjFKNUpmcDhYaTJGNGtzaFF3SUY3Qk80SEROR0pTVVMwWXFO?=
 =?utf-8?B?L3hYRTRUVEFXbGFuNHBZT20xVklnQmJWSm0vT2E5UkVxNjlNeW8vMm1PV1Q2?=
 =?utf-8?B?R0FjQi9VVTF6OVNnTEREZUhOL3l4Q2Myc0hYeWU4QnFpcmtLM0FuLzI3Rzl1?=
 =?utf-8?B?SFVjVmlVQUJKVUwyUyswNkhYeStlUWs1ODlUY0l6cGRJOUNvcXBQS3JaNkhT?=
 =?utf-8?B?TTV0YmZLekJuQTFCNms2d3RPeGN6R05lQ3o4c2VIK3F5L2ZtemlxZE5XZDBu?=
 =?utf-8?B?b0xmRXlrbW9FVW53bjZBMjRYNWp5dmNEcWV1UUtFOVhTbDIrcXZiQnhYeUxW?=
 =?utf-8?B?c3RYUWdEWitleE5wa3piVmNSNk1JbFdXY1Nid1RQUHRPVnpkVVhkQ0lQMWlw?=
 =?utf-8?B?NXZrbThPbDVQN1lqYzJXeWtFQmZvc1BYWTNFQnkxQnR0UnkrRmYzajQyaHgx?=
 =?utf-8?B?T0t3YUR1TDF2cUwzbnBmWkpZS1lRY016VGFJMGpaTjNlNk5IdlJmTkc2Wmo0?=
 =?utf-8?B?eGxzUDlDN1psQkVYM2NQbHAwOWZmOGk3YXY3MklMRGFCV3lUMUxLM2lGOEN3?=
 =?utf-8?B?b1VVcVhaQ1lINEY2NW1qQXpURXk2MHdXL1Nna25vVDhIMDBUcUkvZDBENnQw?=
 =?utf-8?B?Q0hoTXN0R0s2ai9WR2ZqcjlFOGhCUk1Cc2NkbkdOY2preDFseWdoZXU3cmt5?=
 =?utf-8?B?elRkdXRqZ0NXQ0xJT2pZbkNOcXpKdkZKNHEydGZVaGJvWDFyZHo5dFZ2TEx1?=
 =?utf-8?B?WWJVVjFyaUFPOEpnU1BGYWxqeFFlb2NmYU9JaGVqMTE1OEdxaGM4aHlndDRv?=
 =?utf-8?B?L1luV2NKZkJCcGZ6NmVvYlhhMTZJVi9RZUJ4SmJvSmpuZzR4RlBqaEU1Szlj?=
 =?utf-8?B?Q2dVbVc5TFFBUlpQMWxYSkRqRHdMOStSWGppYmdSMHR2YWZWeWxHSjU2c0Uy?=
 =?utf-8?B?Wk1ham1XWXBtOVJkQTJ4dkp5bG90dTY3RHNhYUpMR0Z1aGI0YVJ0aFY4QzlE?=
 =?utf-8?B?YWViQmMrY3N2TWZzNW9iZDdTUWx0UFpqZG5GcEpuV3AydzlUdVdzWFlPU3RL?=
 =?utf-8?B?bDdBVm9vc0JoSlZKZU9EV2RVSTZVVkNhcWdpbG5rOVNvb0k4b2pQVCtXQWlO?=
 =?utf-8?B?TkNnTmtkalpBWkNKK0I2S0Riek45Mi9FeHp5b0N1SzZMRW5qSElNSXA0UTNK?=
 =?utf-8?B?TVZBTjYySHBMT1VzZEFmTUI5Rys2enZGME1xYmRpT3dYMUZGR3BSMExWL0xn?=
 =?utf-8?B?c0JRMW5ndHBiNnR6NDJvMmx1YUEzQyt0djZKRXZ3N2tmNDJheXZMSU1HQTlO?=
 =?utf-8?B?L2pHNE40ZTZndnA2SHNSeHp1cDJGeHZ1YmRVVmh6ZEJyNFpUTnV3T2MrN1Zr?=
 =?utf-8?B?MTQ0YmYzS1hHWGppZDBjVFF4TTFnZlFBVHk1TDV4NFNhUVVkUGZjMVlDc2oz?=
 =?utf-8?B?UzROa0R6Z1lxbFNMOUdZZFliYVNPYnc0aGlvM002WVR1dHdkenRBWHc0SnZZ?=
 =?utf-8?B?MWcvYk9nRGYwQkc5TE5wcjJNVVVuTkdGdFVuMWVKZG1LdWJJd1Y4bTNiN096?=
 =?utf-8?B?UUlrYzdab21iVG1Rb2kzT1VXNHpZQTJrVElsMXBDN3IrS0NJVW95dDVpQXll?=
 =?utf-8?B?MDliRkNvYk5UYmdnSkhIY092cHltMk9lempCTUNuaWRRKzBXY3dQS21IeklH?=
 =?utf-8?B?bUh0eFFPcmp5WEdpOVhwNXVWY01sczRMSnJjZGN5cUFpbnc4MThSZzlSNnhn?=
 =?utf-8?B?RUhJaHcvVmNHbXRpNjZlNC9TcjNLZ3AwMkYzZ1I2UjA0MHFDUDZHazRuY3VT?=
 =?utf-8?B?NWhaVU43YUh6Zkc0aDR0MjdWR05Bc0hkZ080NFlMMnVUdEhHUmdReWQycEto?=
 =?utf-8?B?UzRNWG9FS3lERzRYa3ZXVS81NnAxUEtwWGFwZW5JckNOYkdrRTZPVlMyeGQ3?=
 =?utf-8?B?Sm9CU0VEU3Q2NkhsTERnRWJGeDVmeGNiTnhpR2dJZ3BBZHB0bUlRQTIrL3kx?=
 =?utf-8?B?aXZTYTFOdng2MTQxaEU0TnhHMXpIeXJEVG9vRCtJZ1lKWEJhem9WcWE1ekIx?=
 =?utf-8?B?azVsRkEwT3c0dW1Fb2dPYnZFeDkwU1gyaXl3bVhYMTlSclBvVmhQZmNnZDAz?=
 =?utf-8?B?dmdHVmlhRzVwOXVKZmRkeTVLQzlnODRBRFQ5MG9NTGJ6UkRvajJTUT09?=
X-Exchange-RoutingPolicyChecked: p/Dv/130TQ4yI0Ya44CBpcUGD0Zf0gDc6dDkTyvcplqKxmwr0ObRJAZn4ywwwYt3cheiruEYebWERv5HAxaX8aXMZXTBkmAcBWUfiTtigukTsuhwt41sxAp6LKr82bMzC6jU16o8YwtOOH5F/elEkOmyXEZ9r+PdqurXOqkTlVWVUlFl76waj19oI2yIAQRfEi68XJ0lUDq+i8VmndIUS27PfoUW4PQ5tpGK8+NeRuSrEF5fXeKT2YfOfvpAIwvvoQLeb92lgt9zIJNyHqTlDLC2A9MyPuN64C7hdWJ+5z7MihLLukEsYFVnzVeRhToAQ28GjWGkDbOUVtix2Y7v3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d20a99-955f-4f90-b307-08df3eced97a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 02:03:44.7542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGi7eMfNCbo7pOQG+TsQpU0DRm0f5UFMPhr9W4zNoXVIWFO50ctZgMh4cHByJGk9PNp5CaSkSEt/TqqWH2hK5jaiXoB8QRGqBQ+2ZqWsDI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7171
X-OriginatorOrg: intel.com

--------------CzFr0nhMIGrHY4Z0NuVxmnpW
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/4/26 13:56, Chang S. Bae wrote:
> On 11/4/2026 10:23 AM, Chang S. Bae wrote:
>>
>> diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
>> index e3660b8b8f38..11c965445bdc 100644
>> --- a/arch/x86/kernel/nmi.c
>> +++ b/arch/x86/kernel/nmi.c
>> @@ -553,7 +553,7 @@ DEFINE_IDTENTRY_RAW(exc_nmi)
>>           raw_atomic_long_inc(&nsp->idt_calls);
>>       if (arch_cpu_is_offline(smp_processor_id())) {
>> -        if (microcode_nmi_handler_enabled())
>> +        if (IS_ENABLED(CONFIG_MICROCODE_LATE_LOADING))
>>               microcode_offline_nmi_handler();
>>           return;
>>       }
>> @@ -715,7 +715,7 @@ DEFINE_FREDENTRY_NMI(exc_nmi)
>>       irqentry_state_t irq_state;
>>       if (arch_cpu_is_offline(smp_processor_id())) {
>> -        if (microcode_nmi_handler_enabled())
>> +        if (IS_ENABLED(CONFIG_MICROCODE_LATE_LOADING))
>>               microcode_offline_nmi_handler();
>>           return;
>>       }
> 
> There is a Sashiko comment on this:
> https://sashiko.dev/#/patchset/20261104182322.578066-1- 
> chang.seok.bae%40intel.com
> 
> I thought waking up soft-offlined SMT siblings with an NMI was benign. 
> Right now the path is not explicitly gated by the use_nmi flag even 
> though the underlying mechanism is NMI-based.

As looking more, this looks like a bug to me. NMIs are raised to those 
CPUs, but not handled because the static key is off. So I ended up with 
this patch:


--------------CzFr0nhMIGrHY4Z0NuVxmnpW
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-x86-microcode-Gate-soft-offlined-SMT-siblings-handli.patch"
Content-Disposition: attachment;
	filename*0="0001-x86-microcode-Gate-soft-offlined-SMT-siblings-handli.pa";
	filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA3MTdmNTkzMWEwNTc5YmFjMjM5ZDgwOTEzYjNhYTRlZjExZTVkYzdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiQ2hhbmcgUy4gQmFlIiA8Y2hhbmcuc2Vvay5iYWVAaW50ZWwu
Y29tPgpEYXRlOiBGcmksIDYgTm92IDIwMjYgMTc6Mjc6MzUgLTA4MDAKU3ViamVjdDogW1BBVENI
XSB4ODYvbWljcm9jb2RlOiBHYXRlIHNvZnQtb2ZmbGluZWQgU01UIHNpYmxpbmdzIGhhbmRsaW5n
CgpIYW5kbGluZyBvZiBzb2Z0LW9mZmxpbmVkIFNNVCBzaWJsaW5ncyByZWxpZXMgb24gTk1JIGV2
ZW50cywgYnV0IGlzCmN1cnJlbnRseSBhbHNvIGV4ZWN1dGVkIGV2ZW4gaWYgdXNlX25taSBpcyBm
YWxzZS4KClRoaXMgY2F1c2VzIGEgcHJhY3RpY2FsIHByb2JsZW0gb24gIXVzZV9ubWkgc3lzdGVt
cy4gV2hlbiBTTVQgc2libGluZ3MKYXJlIHNvZnQtb2ZmbGluZWQsIGtpY2tfb2ZmbGluZV9jcHVz
KCkgc2VuZHMgTk1JcyB0byB0aGVtLCBidXQgdGhlCm9mZmxpbmUgTk1JIGhhbmRsZXIgaXMgYWxy
ZWFkeSBzd2l0Y2hlZCBvZmYuIFRodXMsIHRob3NlIHNpYmxpbmdzIGFwcGVhcgpub3QgcmVzcG9u
ZGluZywgdGhlIHJlbmRlenZvdXMgZ29lcyB0aW1lb3V0LCB0aGVuIGZpbmFsbHkgdGhlIGxvYWQg
ZmFpbHMuCgpHYXRlIHRoZSB3YWtlLXVwIGFuZCByZWxlYXNlIHBhdGhzIG9uIHVzZV9ubWkuIE90
aGVyd2lzZSwga2VlcCB0aGUKc29mdC1vZmZsaW5lZCBzaWJsaW5ncyBpbiB0aGUgb2ZmbGluZSBz
dGF0ZSBpbnN0ZWFkLgoKRml4ZXM6IDhmODQ5ZmY2M2JjYiAoIng4Ni9taWNyb2NvZGU6IEhhbmRs
ZSAib2ZmbGluZSIgQ1BVcyBjb3JyZWN0bHkiKQpTaWduZWQtb2ZmLWJ5OiBDaGFuZyBTLiBCYWUg
PGNoYW5nLnNlb2suYmFlQGludGVsLmNvbT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKLS0t
Ck5vdyBJIGVuZGVkIHVwIHNvcnRpbmcgb3V0IHRoaXMgY291bGQgYmUgYSByZWFsIGlzc3VlIG9u
IEFNRCBzeXN0ZW1zLiBCdXQKSSBhcHByZWNpYXRlIGlmIHNvbWVvbmUgbGlrZWx5IGZyb20gQU1E
IGNvdWxkIHRlc3QgYW5kIGNvbmZpcm0gdGhpcyBmaXgKYmVmb3JlIG1vdmluZyBvbi4KLS0tCiBh
cmNoL3g4Ni9rZXJuZWwvY3B1L21pY3JvY29kZS9jb3JlLmMgfCAyMyArKysrKysrKysrKysrKysr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2VybmVsL2NwdS9taWNyb2NvZGUvY29yZS5jIGIvYXJj
aC94ODYva2VybmVsL2NwdS9taWNyb2NvZGUvY29yZS5jCmluZGV4IDBkZDBjNzI0MWM1Ny4uZjFi
ZDM5OWY1ZWJmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rZXJuZWwvY3B1L21pY3JvY29kZS9jb3Jl
LmMKKysrIGIvYXJjaC94ODYva2VybmVsL2NwdS9taWNyb2NvZGUvY29yZS5jCkBAIC00OTgsMjEg
KzQ5OCwzNiBAQCBzdGF0aWMgdm9pZCByZWxlYXNlX29mZmxpbmVfY3B1cyh2b2lkKQogCQlwZXJf
Y3B1KHVjb2RlX2N0cmwuY3RybCwgY3B1KSA9IFNDVFJMX0RPTkU7CiB9CiAKK3N0YXRpYyB2b2lk
IGtlZXBfb2ZmbGluZV9jcHVzKHZvaWQpCit7CisJdW5zaWduZWQgaW50IGNwdTsKKworCWZvcl9l
YWNoX2NwdShjcHUsICZjcHVfb2ZmbGluZV9tYXNrKQorCQlwZXJfY3B1KHVjb2RlX2N0cmwucmVz
dWx0LCBjcHUpID0gVUNPREVfT0ZGTElORTsKK30KKwogc3RhdGljIHZvaWQgbG9hZF9wcmltYXJ5
KHVuc2lnbmVkIGludCBjcHUpCiB7CiAJdW5zaWduZWQgaW50IG5yX29mZmwgPSBjcHVtYXNrX3dl
aWdodCgmY3B1X29mZmxpbmVfbWFzayk7CiAJYm9vbCBwcm9jZWVkID0gdHJ1ZTsKIAotCS8qIEtp
Y2sgc29mdC1vZmZsaW5lZCBTTVQgc2libGluZ3MgaWYgcmVxdWlyZWQgKi8KLQlpZiAoIWNwdSAm
JiBucl9vZmZsKQotCQlwcm9jZWVkID0ga2lja19vZmZsaW5lX2NwdXMobnJfb2ZmbCk7CisJLyoK
KwkgKiBLaWNrIHNvZnQtb2ZmbGluZWQgU01UIHNpYmxpbmdzIHZpYSBOTUkgZXZlbnRzLCB3aGVu
IHJlcXVpcmVkIGFuZAorCSAqIE5NSSB1c2UgaXMgY29uZmlndXJlZC4gT3RoZXJ3aXNlLCBrZWVw
IHRoZW0gaW4gdGhlIG9mZmxpbmUgc3RhdGUuCisJICovCisJaWYgKCFjcHUgJiYgbnJfb2ZmbCkg
eworCQlpZiAobWljcm9jb2RlX29wcy0+dXNlX25taSkKKwkJCXByb2NlZWQgPSBraWNrX29mZmxp
bmVfY3B1cyhucl9vZmZsKTsKKwkJZWxzZQorCQkJa2VlcF9vZmZsaW5lX2NwdXMoKTsKKwl9CiAK
IAkvKiBJZiB0aGUgc29mdC1vZmZsaW5lZCBDUFVzIGRpZCBub3QgcmVzcG9uZCwgYWJvcnQgKi8K
IAlpZiAocHJvY2VlZCkKIAkJX19sb2FkX3ByaW1hcnkoY3B1KTsKIAogCS8qIFVuY29uZGl0aW9u
YWxseSByZWxlYXNlIHNvZnQtb2ZmbGluZWQgU01UIHNpYmxpbmdzIGlmIHJlcXVpcmVkICovCi0J
aWYgKCFjcHUgJiYgbnJfb2ZmbCkKKwlpZiAobWljcm9jb2RlX29wcy0+dXNlX25taSAmJiAhY3B1
ICYmIG5yX29mZmwpCiAJCXJlbGVhc2Vfb2ZmbGluZV9jcHVzKCk7CiB9CiAKLS0gCjIuNTMuMAoK

--------------CzFr0nhMIGrHY4Z0NuVxmnpW--
