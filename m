Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EAE369D47
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632101; cv=fail; b=ef5c/YnuEP7Wtr/AgspIw13wMVAjod047hHon1flGKNjgrPhfUzpDzPoDEvrGZD2YWg+GulIaRuhTCK2NzNol7P0LVC8LqLQ7e7b42eo5mHOzLlNc+6QGoxxGStapnKwRAdLhNU4aZxWjJgI/LAaLEEMJNdg39e+wITiagR7YqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632101; c=relaxed/simple;
	bh=JtBURRCmOtJOGYRDAA9/61jJjWJbqw8t3Y7eTtSnkMg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cVHbOzKvrJniN5CXyjsaLZeQCa8wVv7lWSUwYOoWwoxYB/IonYZXNZu6pSwj2cbZGc4qmVN4T87b/fr3JGZ65ubNG0VRvAxX4N2xYnD1/5yOBp6JLC4fiun1HwX2JE/JjMw8Icc7SlGB2CJ8Q1Lpon1x3LPFM7YSaMlp/WsHcwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cRYVBqoQ; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cRYVBqoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790632099; x=1822168099;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JtBURRCmOtJOGYRDAA9/61jJjWJbqw8t3Y7eTtSnkMg=;
  b=cRYVBqoQ17GwBPC1gfJWZBxjWrEySLepUaV60ZnvK6A+W3P13/jvOHCR
   njVvDQszHOJD79fO2UrsL8f31pVP0OqAPIWXFVj3dv8tJ1MiXLI+ceoS9
   oDj5BAfrM1nuKJg9LVvPAeIDJsJpGg7lhudF5snMvKIyhptej3FIQP0aO
   09e+snaxCa+Omiqc8FGZJhQIk+DELicJjP2tWN3rrplp6YJdttjDRjMCd
   IENlZtkSfwV4touOQT9xnYgBvg5byuPTxdQBRf0mkcePCRMz0wrggdZ4g
   BryPOTS0PSa7VY586XhXrUkUb7cz5ncVZ1VCjCdSC4Rr86xagrzE4t/cr
   A==;
X-CSE-ConnectionGUID: VfRXrfXwSk2Hd6M/A3r53Q==
X-CSE-MsgGUID: yIuxTOoYRJuR23t06picJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90243847"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90243847"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:48:18 -0700
X-CSE-ConnectionGUID: QNWrGvm5SgWsYV3JekO6YA==
X-CSE-MsgGUID: R4W865LZR56zNiX82ybePA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278986503"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:48:17 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:48:16 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 14:48:16 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:48:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=arqzwF1yRbldPlTyMILW0heH/etv2C2WMgN52Lr/3NePusw7aNWyDADzPi/DrfOpkWovW+NGaZJX/e1plYQskf/RmY7ZLLRx5BhSpubP/fd32bbB5J9Z+Mu9niWCjClsDYZJ/hDR1o2INTOXwjASNhQt/YkG36Si7P4/y5XlRyuJ4Udd8oU6fHnlApLJXZEVupbVrOAbLk/VDM0XQKfw8zkkNUbH3s06Sj7qsMNZe+iv8Mxky/EBIWzcHifWDOp5v8rjfcNUIjIQzoSGVsqqqwPwd0HgOlNh/UuIcrisHBW9k6GG07EAtqR4rJ50YqUdLkNF9Dad7CaFDoAQaE5muA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DXMeYgZN0Y3u5dkSLkRoBxd0fsNy1780MLbmXzFkhII=;
 b=SN/ZU6lZsgZmGfNJ6iK7/jEiZBe1jr6WcJDr0XzaYv34bqLGrvlskFrSkVAlLzXgszboOL7/4TqvpI/oWjxZQe2CgZLM9jm4pDpLA14Nrk9aFKAAblJNKoY76zqdytNf04FBICZMNcbECXiq5qjcjFrEIYqtxVV2s/29JI+V5xxtXbKfRBoaFWH20ZRBE9d/G8DBgc+Fg7VTWa/u9j/WpNYpLAxZzDW/gLoDlM9GEy6E3gLMhTgJvtONsyslfcX6+xMyC94CcJJZ3DL29J/kBP6haSpgwH+8+0aws7F6IxjXc3iGQZWaxCXwuvcu9BFrAAqx2ma13KeiRDr6xC0PAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA3PR11MB831931.namprd11.prod.outlook.com (2603:10b6:806:589::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 21:48:14 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 21:48:14 +0000
Message-ID: <432f616b-314f-4b46-bfa0-28759a493cae@intel.com>
Date: Mon, 28 Sep 2026 14:48:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] fs/resctrl: Do not invoke smp_processor_id() in
 preemptible context
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <6e0ff955200ead6a2ac689d492a5e5c73ebc3552.1789705667.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <6e0ff955200ead6a2ac689d492a5e5c73ebc3552.1789705667.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:303:b5::18) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA3PR11MB831931:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c1eff9-94c2-45e9-0b2d-08df1daa32e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|366016|1800799024|376014|22082099003|18002099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: RNzOv/WHOpo4JB8t8sy/QNDtx/iHAsWhdQ801i3y3GOIMU8jw0jS5CkqBtObqdZSJL4Xqf8VNOmJk6byL5JQtTQ9tf2BTR59eY3K1sE9sZ4rGVO6ezyZiGTpP/8sbq1qfRbexz71N2xqujq70Sr0qW/0VwHeNfDtcXjkfuhk+5h73gNX/NjSDwVcXeBIpMduRCZy4tMmZyOj7wzV53CdcPcGxiMKqH/1dm98YVoBqzaVS5bHK/P1OX6Fg+VcxJ2qmWR+dj6VjREEKvU2fwck5CmqRYc31D1Obj2fKtVaDv0tHXN5rUDNOht07zl920mHJe+z5CaDs9qsBE3SLi1gTgVbGYlYw7A1Sf3VX3IVj+NSTv03CTC2ujZYy3zIViM2fxuZBbllGv0Ul6LLnIs9LCjhyOpRIy2MXXQTL7iMewDHSiKYSOu4Ou0jRZyezdobuqhv6JrS4a71DRAyApA3YHFfckHrOb9YyngD/WSO+pFabCzXQcyWWUmaKmpn1ThAjlVw7uRlgoKN88wBlZRtqw/Vlq0A8WRgSYg6MUY4VlBth7SGoY8brjdzqrYF2/rrxEvHTKmbtVE0wIk9EeQrR1t2d8RjxxGy27pb1md2UnLLey2OUvLkPESzWXz1JSd7/0aFMvh86POy0ECYGOSfB43hNBjP2VZJOFK3fF+Z37k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2x4WGpkS2pRYXYxV1Y4cEZoWG0wYlNxSFIwZWVUbU5KU1VnbkJrbkRJNk4w?=
 =?utf-8?B?cGM2UHluRm5OMTZtcjNDdGU1MGowc2IwaUJaSkdOVldwZmVJUVVEQzV4ZDVo?=
 =?utf-8?B?VURpY2hJS2NUMnY0dWtpSmEySklVSTFJc0pMRmMwMXc3WFhvd3NiRWdDYllo?=
 =?utf-8?B?TVhIcmlkNHV0U0ZMWDYzR3R4b0JJYTYzUnhoWmU5dzIrL1NhZEhqMzVQTWpX?=
 =?utf-8?B?YTVsdnVndFZoZzlEUnk1dE5weUZHSHlXMVV0VUhaOGVveE5neldYeEhoVGxK?=
 =?utf-8?B?a3o0UEFsN1dhdW9uRUI5eEJLQWl6UmVXOTlCNGo2UzdscGF4YjhLMS9QUmli?=
 =?utf-8?B?Mm9XS3ZLZXBqUXNjZHduNFE1V1J1NWVVbHdLZ2pCYU9jMzV5YjFobEJhYUMw?=
 =?utf-8?B?a0dJSjVOZEFEeGdlMENkRnlYMm14TWRtR1VOUEZkUGhhUkVwMUV3NE11VlFI?=
 =?utf-8?B?dmZ0WWsra05iU1N4MkNsdm1RSFBGQ1RhNFBPcXYzQUtRNXFiRG5VMU01MjlQ?=
 =?utf-8?B?aTY5c0kxZ3R3OVA3K01nTXY4TXliVEVweGg0dEdWaHhENFh6NHFZNUlWYW5U?=
 =?utf-8?B?SUVlR1FEV2FINThZUzZWazJJNXNvZ21WclI0MXYvZkFxZThrcHdJalRBT0Fr?=
 =?utf-8?B?Zkx5M0oyUE1DbVBFZVg2aVZqTHVIcHJFbStkN2JkZjJKSGM5NEZWTEJWT1Mv?=
 =?utf-8?B?RHdVWlRtSHhWNkFic3NUZ0pYWDMwczVRSDVGMHk3c1c3cWE5NzVCNVBWSlVF?=
 =?utf-8?B?VVFrUVZad3IydGJOM3pSSEZUU29TRzNTdWV3YjNXMm5FYUtFOWVTaEFlQW9r?=
 =?utf-8?B?ME9ERlVMOG5iaVo1bkgwb2pvemVHV3dMUmd5ZG9tZERSRVE4L0xWWW1LNnRS?=
 =?utf-8?B?WHlpYThVVGRXMmFxaE5TUG1qTzBBWGRPK29kOFdqQUNSa2FGVEhvN2kwU2NR?=
 =?utf-8?B?NlV4VDJNMytvRHY1UUNodnNlZzNhaURWRFFUZzJXMmlBcDRZMWZrVmlmcm1U?=
 =?utf-8?B?b2E3WkxtTGliQUplQitkM3hBcEFmTTJobm1CYUc3emsxOSs5b0E0QmZLTGt1?=
 =?utf-8?B?dWVPK1ZlMzI3eXhtajcvdmJwWE82S3NKendqRXdFL1V6c0tncmJJNkZlekg5?=
 =?utf-8?B?RTFYQnFvblVDakdEaGZrNkt6c1Ara25KK2JhVEhxUCt6dmhtRC9GTE9ETjAv?=
 =?utf-8?B?Yjc5SG9XSnJLWVpLaVk2WWdkUTd6cFp1blI4ckNNMmw0cXZrNk9Lc3Q5V1cz?=
 =?utf-8?B?Sk45UkFVenhIbnBzbEYvVGFNd3p1VVJRZWZjajdGYkVNcGdiU2plelJwb1pO?=
 =?utf-8?B?UXk5T2ZkOCtIZ0pRY1dEZ0RsL2YyLzdsTEthMVRNRTNSaGUvMnlhR2tZWnNo?=
 =?utf-8?B?VmY2VGVEczZGaXdaOWRlL25QcHFWSXU4ck9MUllmUE1ManVTWG44NGZITnhL?=
 =?utf-8?B?ejdlK2lhNDltNyttMzExMUlrTEVYZ0ljcWxHWmJWbW9hbktYK3pqNERhMHdZ?=
 =?utf-8?B?eklwQkpyb0R0MGViNGRDTEJpQlFOMnJUdWZYaGJtZmtrQmdEcW5YZXdtWjBJ?=
 =?utf-8?B?aElqd0ZmeXBTZlBXSlF0MnMzdmxUbEZDbTh3V0h0SHhYMnZHZXA4bWpYVUFj?=
 =?utf-8?B?R1lDSmNvTkw4WWI0Q0JDN2ZZQkpETUZ3cWJPYlNlTjhGRDVDblZHSmFrWVZz?=
 =?utf-8?B?a0psQ2pmT3hIa0paVUdLUVJ0M25OOGFocVR1MGpBY3BCTFh1cUlPKzR3YUN1?=
 =?utf-8?B?S292NDFmajMwOUtQNXNpY1R5eDkxbnB2VFdSM2F1amtsV0ZBOElNb1phRFlr?=
 =?utf-8?B?ZVhjWC9Fd0ZvQVR4ckFZd08ra1hneENxRlNuazM1alRKakd5bWw3cHJEZnZR?=
 =?utf-8?B?bkJaMThnOXg2M2FNaWJyS1kyVkFweWxnUGlaS3dHbXY5SmRidWdRYVY1eXBq?=
 =?utf-8?B?ZjA0UElSbTlGdVZyQjhBMFI4WnJPaklBN3dONFhPblVsZ0FwYzFoakZRakNm?=
 =?utf-8?B?N0JZYmJQTU00RnVpaEJEQUlGY21rVlZiaDd6MmdzTHZWd1NVNHZ0MG5Pb0FI?=
 =?utf-8?B?Si9jbFlXRml3Mk1rUHhuNFhUUkx2dzc0MVBIRkc3SU5lRkErbE9EOUR4d2Jt?=
 =?utf-8?B?ejc4eUxyRWlvZGhLQ2Z6OUdyMFQ5dXc3SGh4bmxubjZuaENrdHBYVzRwaDFZ?=
 =?utf-8?B?ejA5YXJZd1BBbUNzWXdYbjEwTGZ5RHNGbkw3QU95QkNzaUNaVWJyMUhOc2VT?=
 =?utf-8?B?b1ZuRFVWWmVVRWkwM3M5TUpxTnRxVlV2VlY1MkQwczVYeG9rVS9IVG5iRTNh?=
 =?utf-8?B?a1pBK3QrejFFRnZuY05TdEcyYmJidDlocGlMY1JRTXFkdTVGZzdzRm10MS9Z?=
 =?utf-8?Q?yXHQUAGzFGMS73io=3D?=
X-Exchange-RoutingPolicyChecked: 18skn3Uw13v7w/mdWCZLSXOEsz5OHiVMyMSXtg6mfa0Gvhb5ZWnK2VY2QuwyCzKfHxsVaqWWFP7ydyGM8i0tt8LZV3Uf0kVOaox2lXgV6t1hDd18sB3Mb3GuzaEkQws4XVsC7q9sfxUMKl8Ful7quCzH0LycPoFiProEORjDUS0pXXRB2tMZ5qL/kYfFzGVjLkCom6fAKkBp35kPLf+ViARd7YdjDO9IrAJWBMwju5APMGH0xWpb6/pdkJeDFMst94L1PnVRjsA9JEpA5Z4R4G52mGkFnr4UZO2nCTX2Py1/c9otmwnVva+xC0jvtr8oyQhxuxf+NJiIG/AKC9eycA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c1eff9-94c2-45e9-0b2d-08df1daa32e9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 21:48:14.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKvjF7uI13/diOuGu7RxJl1bVLXPgCN8t3h2htPfnOoDiqshxNYjDGmPfcwE/G5vlKLEUGGb/EOD9Z2OmO5yl62yQJbAyNJcPH2sotJdCzg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB831931
X-OriginatorOrg: intel.com

Hi Chenyu,

On 9/17/26 9:50 PM, Chen Yu wrote:
> From: Tony Luck <tony.luck@intel.com>
> 
> An event flagged with mon_evt::any_cpu is read directly in preemptible task
> context instead of being dispatched to a CPU of the monitoring domain. Only
> Intel AET events set this flag, so __mon_event_count() rejects an any_cpu L3
> event with WARN_ON_ONCE(). The L3 read paths can therefore call
> smp_processor_id() unconditionally to check that the current CPU belongs to the
> domain being read.
> 
> MMIO-based LLC occupancy counters can be read from any CPU, so the L3 read
> paths have to tolerate an any_cpu event. Move that check into a helper which
> returns early for any_cpu events, avoiding smp_processor_id() in preemptible
> context, and report a wrong CPU via rmid_read::err.

"report a wrong CPU via rmid_read::err" is obvious from the patch.

> 
> Signed-off-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---
>  fs/resctrl/monitor.c | 48 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 14 deletions(-)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 73413cb128ea..3e05b0271c58 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -422,9 +422,37 @@ static void mbm_cntr_free(struct rdt_l3_mon_domain *d, int cntr_id)
>  	memset(&d->cntr_cfg[cntr_id], 0, sizeof(*d->cntr_cfg));
>  }
>  
> +/**
> + * cpu_on_correct_domain() - Check if current CPU is in the correct
> + *			      domain for the event.

The domain is not always relevant. When considering "Return: true if the
current CPU can read this event" ... could something like "cpu_can_read_event()"
be more descriptive? 

> + * @rr: The rmid_read structure containing event and domain information.
> + *
> + * Context: Preemptible process context when @rr->evt->any_cpu is set.
> + *          Non-migratable process context (via smp_call_on_cpu()) or
> + *          non-preemptible context (via smp_call_function_any()) when
> + *          the event must be read on a specific CPU.
> + * Return: true if the current CPU can read this event, false otherwise.
> + */
> +static bool cpu_on_correct_domain(struct rmid_read *rr)
> +{
> +	int cpu;
> +
> +	/* Any CPU is OK for this event */
> +	if (rr->evt->any_cpu)
> +		return true;
> +
> +	cpu = smp_processor_id();
> +
> +	/* Single domain. Must be on a CPU in that domain. */
> +	if (rr->hdr)
> +		return cpumask_test_cpu(cpu, &rr->hdr->cpu_mask);
> +
> +	/* Summing domains that share a cache, must be on a CPU for that cache. */
> +	return cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map);
> +}
> +
>  static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  {
> -	int cpu = smp_processor_id();
>  	u32 closid = rdtgrp->closid;
>  	u32 rmid = rdtgrp->mon.rmid;
>  	struct rdt_l3_mon_domain *d;
> @@ -457,11 +485,6 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  		return 0;
>  	}
>  
> -	/* Reading a single domain, must be on a CPU in that domain. */
> -	if (!cpumask_test_cpu(cpu, &d->hdr.cpu_mask)) {
> -		rr->err = -EIO;
> -		return -EINVAL;
> -	}
>  	if (rr->is_mbm_cntr)
>  		rr->err = resctrl_arch_cntr_read(rr->r, d, closid, rmid, cntr_id,
>  						 rr->evt->evtid, &tval);
> @@ -479,7 +502,6 @@ static int __l3_mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  
>  static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  {
> -	int cpu = smp_processor_id();
>  	u32 closid = rdtgrp->closid;
>  	u32 rmid = rdtgrp->mon.rmid;
>  	struct rdt_l3_mon_domain *d;
> @@ -497,12 +519,6 @@ static int __l3_mon_event_count_sum(struct rdtgroup *rdtgrp, struct rmid_read *r
>  		return -EINVAL;
>  	}
>  
> -	/* Summing domains that share a cache, must be on a CPU for that cache. */
> -	if (!cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map)) {
> -		rr->err = -EIO;
> -		return -EINVAL;
> -	}
> -
>  	/*
>  	 * Legacy files must report the sum of an event across all
>  	 * domains that share the same L3 cache instance.
> @@ -538,7 +554,11 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  {
>  	switch (rr->r->rid) {
>  	case RDT_RESOURCE_L3:
> -		WARN_ON_ONCE(rr->evt->any_cpu);
> +		if (!cpu_on_correct_domain(rr)) {
> +			rr->err = -EIO;
> +			return -EINVAL;
> +		}
> +
>  		if (rr->hdr)
>  			return __l3_mon_event_count(rdtgrp, rr);
>  		else

Reinette

