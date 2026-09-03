Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD5B4E56E4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450177; cv=fail; b=oV2Gm1iKftP695ZIu7zn2KXnxUcxd5xNzqkpfl8Iz2cg02xhIIybgMuBYt4+rkDacqgvxdHG5o8rYNvMAO3/8IfbEX+RtGLABeeZggkJwMgtST4D3G+whlw/7p6YJ9FWkf0J/J2Y9c6V7GsMjfDIy+zsxjdRmwAB7WseqcTeCHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450177; c=relaxed/simple;
	bh=rPnQK7Wxz1lS6J/yy62dXR9jSBFPUFnRugQkLyYk5+8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XS1cgPKB5J1uFy4CYcOO6JNHfJcR0yNqxjcKqvNLP4nBL90YRyeS5miS0Gkw+V2B2lA37TURmgjYcQM/JBqRWvvVQk/r30tDd2Xqxf12jIcnhB/heyy7Ei8TkiqGiV/xeScU1F3B3XgUAAqb7w+3wCYHIGIg0TQ4Ikg6QUNc0bQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVwwbTRL; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVwwbTRL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788450175; x=1819986175;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rPnQK7Wxz1lS6J/yy62dXR9jSBFPUFnRugQkLyYk5+8=;
  b=BVwwbTRLw/InzVtDvvcIvdO091JbNOenKDnjaaJ2uVQj27UmSrywgWhy
   uwqmtxO1YUU+ZCXGMEu3PGnwVwGZ/sxNEybZN71uTvYkcCjTZbImVGm2h
   +BPHN0y5za0+5barAblkhn7ctBeUEL9hMIW7I4WKXMT7kXEX5MBsS4abd
   gO4iNXdcsRcYOFw6MtZ8aMiWe6qK/2M8sf9SvELNhcUngY+PEHptlQ9zX
   F8ySem2czZiHLwYR+gsaTTFwtg9h07HXgBFZdoL+TAXmmhHo60AqeQ1RT
   8VC0eackCh2CzlXeUtmkYxLcpaQotHuTlKd853r3zjf1jehJi8wisr7RA
   A==;
X-CSE-ConnectionGUID: 3bNGA5YxQCmkENi3+fyc1g==
X-CSE-MsgGUID: dxXPjp1dSG2MLNfgXNnGUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="88990929"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="88990929"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:42:55 -0700
X-CSE-ConnectionGUID: N7zdPHAOSbq4gmDEdEBqUA==
X-CSE-MsgGUID: VoHxSFtjRCil6rsQ84lLWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="293266635"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:42:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:42:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 08:42:54 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.10)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:42:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dk9AKMQxHUjKSd4uBnN6UspneTr1aiXba+jxtQruILL1H5I1uPqVKTxiJenpbNbn9M58xhX9hBlrmJjndXFVicN8nHfTKEL4gMOROC0fC+/uOO6mD41ixKZruEAf0u2sQDS/Pfx2MIMD1GKaEPPP27WTu5+fgwo3v3u4+s0zgie+0adVabmW9OZgnXV7qt/daYA/AbtGaD1XN5SjhG6DV2tHTBlHpGgyv/Om+5+p8EaI/6Zpyt1qoyhKbxbpO7sousmv7F+D3Wa76oaZjprJeYVg2guUe4ds+aO8VuhtAjAt6VIvMwnIR7OEpLib1/n5BqK2DlBbwXnGsrdaZZDZgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5eDbJcfO80mPnOnr2RQO6SLNoV6MY2m076GizCHJh98=;
 b=oSlQBvrJwhKyMRDikWt55b+Q5b6V2HRUqSM08PUeq4toNqHtbJ6eOQcRdkihHDPJNfEU52nzBtQR6jWMl5c0JkRrQdnevFokBUsHV2t5HPOfsYEMH9VfsF1xiuzQkTxwgypxL4Wy0b8KsLmM2c/ddQphKlTFt3pZSpir2xtNwla5hoB0XgjXHuyxr3HAJ3136D25eVa0w0xaPO9PDPw91WMdLFDTgunFnPHwTJ/lw8n957/Z1Qk/6OJIBy501TnNl08nmaQGuxXwk4N8aDvIczLDLZzIrV4ZwE2Mw/9jbz21tds+yyOnxMC2P+xTgU54Sm8HPpr7pP8/KFX7m6FZzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH3PPF91320C45A.namprd11.prod.outlook.com (2603:10b6:518:1::d38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:42:49 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:42:49 +0000
Message-ID: <f7a73d18-25a4-4711-9d18-8b87eb9af7d3@intel.com>
Date: Thu, 3 Sep 2026 08:42:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] fs/resctrl: Avoid extra call to strlen() in
 schemata_list_add()
To: Dmitry Antipov <dmantipov@yandex.ru>, Borislav Petkov <bp@alien8.de>,
	<x86@kernel.org>
CC: Tony Luck <tony.luck@intel.com>, Dave Martin <Dave.Martin@arm.com>, "James
 Morse" <james.morse@arm.com>, Babu Moger <babu.moger@amd.com>,
	<linux-kernel@vger.kernel.org>
References: <20260821081128.19242-1-dmantipov@yandex.ru>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260821081128.19242-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:303:8f::31) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH3PPF91320C45A:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a6432e8-8bdc-4237-716a-08df09d201c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|10067099003|11063799006|56012099006|6133799003|22082099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: RfasE04NZ/wiVj+k/S7zK0iKeMvICEdNanDt7js7hC1TIWGnlQZIqjkHEPfvSIJhrH/RK4u0qJInZ3WByQpCYOTGqBgliHTNOCueP6BF8Q5xroH/Om93Y4VVCLQmlTA2SHbcgu6kjKz0+z40ComENCQUwCzqBU8J1r3AP7oPY9+maFN1JlP0Sg1eDhOLWI0Yj+WcDJBcd6fLHGQ4Nr5quGozA5+YDRLPqsumX8M5FbKmfMNxruYOX+vAxR7rw+XVD0m+N3H0I28kYOAV+2DRKGPX6eoF8kH+fpErj6lcsvvZhL38TAQHocQmX8KxCbIlqhINNVyRQ8lxX7kTLnBcBBodP1kgqGa7rUjCVHleb8N5IblKwIrGubvsSy5nSWAHTpRngUelOnCQDa3HWSDiMHzhkBZDq5VgX4C4AYsofz19NaRTEPzTuBaO2uOowNVeb9bGHD+JrM3xZIvFWmCF3T2mvEAM7/rQPkykQLFsm8HC0y7v3r7gsA5+imw+0/wJB91/QGhP+2JGfugQF5siMaw9kWLW2PxAJ9oQ4BDaAXZBIQXFVwqELnc+hqn7awPpH203Q2nRNTRc1fv+/tIToaPBrZF1wKGuu8lyvLsPz1+nFye6ZkDOd6Y1jzNHRXkoavWS64RJU8RnSq6HuHsx+rlc44YVKIE0EXbgjER3VOA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(6133799003)(22082099003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXNHS3RIRHJoSk9za3ptZFkzdUd0SUhLLzVWY2NmR09razNIcTJQTFVyZHJV?=
 =?utf-8?B?M3I1UXA4Y2I3bW9MSnk3WXdGOXlqUWp5TFE4YVhTSFJRVG5VMGYyMXNNdGU2?=
 =?utf-8?B?ZmZrSmhGVFZuYW11TWo5TVJVeURnb1k3Y3Q2Y1M0NGVna29FVUNpZ2cydkM2?=
 =?utf-8?B?SEliZ09vTDVJMGFFMkk4YkJSc1B5OHVkaHI5aWcvejlpNytZbnBMZUhydXI4?=
 =?utf-8?B?QXlVOSsxNWFxVUNOeWVyckVnZ3ZOS0ZEWkwraVE0ZmdMNlladG9YTnYxSnRE?=
 =?utf-8?B?WlJqSHBHaWNzVk5MUVBHcGRhN1h1YlVhVy9kbmluZXorNThPQmI5d0FZNm82?=
 =?utf-8?B?elF1Vzl0ZGR1N3hTZTBPb3F2T2c3K0dId3JnQitkTm1BaXg0K1RxSERBcURZ?=
 =?utf-8?B?UnVDbit1Sitlc0FMdGxQL2wwaGVwV1YrTmlIL3ZVTFVhekxxZzB4c0FIelJ3?=
 =?utf-8?B?YnhMUVcyMkdEY09kUGRPNkxia053R2h1RmVnZDdrem51MDZiaWlQM3VqaXZU?=
 =?utf-8?B?R3F5MlkxNm1pTy94RWdZc2RyYWJPQ1NqOHhHSGFNNG0vaE1hU0NhcXYreFhI?=
 =?utf-8?B?MFpVbnJFdXVxaWc5R0lGQW83THhpVEZTb3BMLzlYNHdsSHJCSW8yS0FaRFk5?=
 =?utf-8?B?c1dhbUdNYnl3T1V4OU4wL1dQYkxDcVVNUXpDRHdueDR4UTB5enFFaXVTenBS?=
 =?utf-8?B?RlJzOWdOZ2hIelBadGsyYW1HdW9xOG1UYUVmNVZWSU5sTW8rREh3THRpTzJy?=
 =?utf-8?B?dDFPSHJuM0EraWN5WFJNa2FrR2FFUHJvZXpjRStLVmdMRDdJckZWRkxWdjY1?=
 =?utf-8?B?RkNTeVI5ZFJpT0FPS3UyTXc2Q1RaNXhJN0dIT2ZHa0FsYWVpRk92ZU9Kek9G?=
 =?utf-8?B?SG5ZWFdGSVEwQnMzUkJzbDBDUDdVOXRIeG1nMHNKclRTbVc4RWcyUzJaRzgv?=
 =?utf-8?B?UkkvS2xSb244MEJuTnFUWGlEY0JMdnJQSGRqZTJNZmtlaDRxNWFPNTE0aFZJ?=
 =?utf-8?B?YUt1UzNVNzAxZGFkR1ZpV1c2R2FSTXU1YTc3ejVIWDd4c0swMS92bEhLZ25H?=
 =?utf-8?B?Yk1JVDd1Y0E1SE9Jc3dmWEhxWm5kTERETisyeTVpOGpjL0dNcndVOVFkVm1t?=
 =?utf-8?B?UnAveUNVT3VuN3B0Zkk5WHYzdW8vcHRYYTJKMEs5TlR0b0NWV0srRFNqaVlk?=
 =?utf-8?B?K3pmejIrUk02S0ltVThMQmg0bHFRWWVRM2kwRlBCRTN2VllEelAzWnhXNThX?=
 =?utf-8?B?TXVmd0JTK2RTaFlZV29Yak1lbEtuZ1k0UXdPa0tUTUU2VWZxb1J2QngwN0lI?=
 =?utf-8?B?bW1xU3Fhc05ycHltNXdaMUl4Z0tPaFNiM0wvK0JvQ1F1Z1pBY2ZuczBESzdp?=
 =?utf-8?B?Y1BvdXMzSWNUSC92ajNtZ2pFZFRUczFKOW1wUlErZHM1WThIc2JpWi9qSmRi?=
 =?utf-8?B?Z24wYXh6cURYTlFpS2pWdENha1AxNHdaMG1oSjhMek8waHhYdURLb0dad3N0?=
 =?utf-8?B?cXRuamhYcUFoZXhHMnZydzJLU3ZFc3hLK1VGSU9jTHltczRWQlNwTHA1THpw?=
 =?utf-8?B?NDNkY2hteWRlZ21BVm5rRmROU0plbS9vaW4zeFVjTTJ0RmVsZHZlaVVzQzhH?=
 =?utf-8?B?SGNuT3RUaThIbDV1N0N3ZVUwb2ZMazZZeDY2SDNUdGd5dE1UOUtJeXJNQyt5?=
 =?utf-8?B?czZmblpiNDVncnhwR3J3SGt0clJFTWJpNmFzKzJ6Y0s3K2lHRGI0TTB2WDds?=
 =?utf-8?B?MzZKRXhsUHcwWUw2YU5pM25lL1g1THE4bSs2eE1WL3Y4eXhaeW8xS2h4bDk3?=
 =?utf-8?B?REZWamVnNnVWU1dmaUhJY0NKTnhaa3BmMExETjhtcUVWZUlIemQzdHJoaVVu?=
 =?utf-8?B?WDl0Tm5JajlyQ29ZbDVlSmlRdnlETVBJemJzTityVXI0Uis1cUY5VU1PNTNv?=
 =?utf-8?B?eTlUeDNReG1pZnV1UHhRR2ZLS2hTL2UyWEZDSExvZnFpUWROTTdsUnBJVm5Q?=
 =?utf-8?B?YzZMTENLRnlnNThGSzR3STFpQ082SkZLZkhkOXE0SVN3dTBYVnY3K2hBaWgz?=
 =?utf-8?B?SFJjOEhaM28rcC9SL0NBcTNJREZ6czdTa0IxMkNyeVoxeUc2cjdkMHRvUnpG?=
 =?utf-8?B?QzRpQ1hRT1J5dWZGUTBLNnUwWFd4Z0JaTFdTS09GTEwyL1VwK3U1dEZHQlYw?=
 =?utf-8?B?clU2YUJibFJieHZoQzRpdXorNkhRYmtPQlFhZENCOWFZbVZVNVp2N1QyS3BD?=
 =?utf-8?B?eUM5bzI0NW05d2NraUptMDFReUJHaGlVcUUzLzYrMTU0b2pTOEEzcThRV1NL?=
 =?utf-8?B?NStxYlNUWFNud0xEczBxRDFCem1KTUM3ZlBVNnlyN2FKWGRuTldzK3ZRdUpk?=
 =?utf-8?Q?+OCSP1nTdDGlB2sE=3D?=
X-Exchange-RoutingPolicyChecked: VQAQ2/xy5cNQe0kImuX2eXL3wqn1CaM81/Xl3mKnWhQCcTpvBsf1d+GI3AY8YO+5nP6ZDta1V/uogaeQ9YXI1Lv7IcQHAFxv/xn6AXKKw78yQ0OHZCUucEpRS/DRDsPn6dHoWTciRz2iaW4Auj/mJ1LAWJ7GQjWA9/UohiIb1Kx6wSHHA7ELBkyxoYsfLHcQc9BBjyH1Bic4T8qumajqteGv4Cr/icgrHMQrN3spCngiWayo80VjhK9vOW2o1SzGxTJF7QHn9Yk/1OOcePCaGe7yEqI2h0ISffVXyxRyfsnWyN2PULFD+f68GyqoGJ0RWfmZ7RQ+gsUF351KRbpTIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6432e8-8bdc-4237-716a-08df09d201c4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:42:48.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Z2SVRrLeuNSSEP2dg1zihIX0fvKzTF14KW8FCV5PwLkPivnlqem0GlaOS4Mzwh7js2pmcj1n3T7Z30orzyYErHZabyJwmcZZyEsF8cKhf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF91320C45A
X-OriginatorOrg: intel.com

Dear x86 maintainers,

Could you please consider both cleanups in this series for inclusion?

Thank you very much.

Reinette

On 8/21/26 1:11 AM, Dmitry Antipov wrote:
> After passing an overflow check, it's safe to assume that snprintf()
> returns the number of characters emitted. So drop the unnecessary
> call to strlen().
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
> v2: adjust title and commit message (Reinette)
> ---
>  fs/resctrl/rdtgroup.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 5dcbb0a964e8..68be9b903ac6 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2858,7 +2858,7 @@ static int schemata_list_add(struct rdt_resource *r, enum resctrl_conf_type type
>  {
>  	struct resctrl_schema *s;
>  	const char *suffix = "";
> -	int ret, cl;
> +	int cl;
>  
>  	s = kzalloc_obj(*s);
>  	if (!s)
> @@ -2882,14 +2882,12 @@ static int schemata_list_add(struct rdt_resource *r, enum resctrl_conf_type type
>  		break;
>  	}
>  
> -	ret = snprintf(s->name, sizeof(s->name), "%s%s", r->name, suffix);
> -	if (ret >= sizeof(s->name)) {
> +	cl = snprintf(s->name, sizeof(s->name), "%s%s", r->name, suffix);
> +	if (cl >= sizeof(s->name)) {
>  		kfree(s);
>  		return -EINVAL;
>  	}
>  
> -	cl = strlen(s->name);
> -
>  	/*
>  	 * If CDP is supported by this resource, but not enabled,
>  	 * include the suffix. This ensures the tabular format of the

