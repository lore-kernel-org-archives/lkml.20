Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242D347CC82;
	Thu,  8 Oct 2026 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459843; cv=fail; b=p0JNgYZSNJdIxDdLJUge0Z7IuXbaC9yGRSNf0v8ASy3phDFj8SA+huuSzykw+ZVu4Dp2JOL9GTuCvQriDD8sJKT3mJ+GX3caIRt+hJDmWnN1XEnoo6hIi4jFpgHtfJs54XnpLmblOEDQbWU9UvAIJk4bw9NT/WVM/xsUHZF1Ahw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459843; c=relaxed/simple;
	bh=oK7SXisTTred1aoFgTfw0QUiVUq6KPtTViZLNc8tO/8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lN140gQuy/FChu9SyCMMiswoxKXU44jhA/i6g7NkvNxdi+iiZ6VppeGFx2ye0F1hN4kZjreeKVtwXyas//ejNjXUq224RMh1k6msFcIW1+2fEBoqHWxSEjXpsI9xkp70IMS6qQ3IHZfPCeBdou19VAvBdO3hznFklrNzJCqAU4o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mJ09cmOE; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mJ09cmOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791459842; x=1822995842;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=oK7SXisTTred1aoFgTfw0QUiVUq6KPtTViZLNc8tO/8=;
  b=mJ09cmOE1mBF0i3gG21PxYChI2POAjIBsaONtzziC/J9H/lK8tGmdm19
   3Tz9z1lw3wimceBoBQWk5bVMyCBTSrpdLpGVLroykwVL0pIF6DfbLF1D5
   zRvqcDS1VAFUsQwUmbVmIG0qVneSYARnshxiKBhfIIWDjVrezhztuX//r
   0kZFaUzDOUXs4kxXtvXo/Z54wP+AEt0FbVKtOyg10sxSf8zpG/yVvoDuP
   4q+5cI3O5zcaKWv5uGhr7tUgXetNh1RDu4+/9e/uJ20nYQwoqLEDaQReF
   LwJ/xyV8/YdJcGeJxuAiSrh6FFDhzFKtbdtKMgk2j1I40SnuFMSXJjkYQ
   g==;
X-CSE-ConnectionGUID: 3O1qWkW6QfyfGEtoj13cWA==
X-CSE-MsgGUID: yoZzTtnCQdO08Mv5jFuf5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="129388"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="129388"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:44:01 -0700
X-CSE-ConnectionGUID: z1DmPUzFRaqthc6I8hTR/A==
X-CSE-MsgGUID: 2g8zrqqHTqOhX1LfAWPWbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="25394"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:44:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:44:00 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 04:44:00 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XWSu9ZQCnOnlnTwCPBaNXXqH7nLqnI/aQFDLFCf+ygEJ/7rZ8HH95781cgdRnvZEHlIpU367kaVCVGNv0Lk65UZ+cwEa/GMROlVCKeazHzkJM0TW/qB6Umi1cunQPhsLd6uAT0sFTiDGnZxQWCNd+RlS8oNsrx8DHaKCDcbD60kYBCTH+HI0XHF1BNsvLFCyVqDUqLkX8hT/KYrWq1dfJOz+9MhQa1oVUNVAaErKCMzo9CV+BLRzLzkRWpw/cpWlNZ/Wa6g/WAlHed1i4L6gnnCjubneu3UOXsKJK5WHm3uJ8xsYIKQT9qtcnx+YoCXeVEHFVfZLouLHiGdwc4Y9ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=85KCX7ncs6GkePR7dTBj8p1eXRHiaRS3eFl2SGZjxzI=;
 b=tWYW49lmCT163Ivxsy2y8zhZC5yBsxkkM4n2QZebIn1ixjErFY8xsb5dO/bIV/or8gGI8ls5E84BfCyLxNS+7gNwQXa7qaIjXkwbvSN+OVHskAXTsxQJedg9bwZBvAA7+/CIaVyyH/0X/UFL8jjOnXfHpFjJfT36zG1YJLHlWQoz7cIokYWDI8k0ZNiSjwBcCXJ5YeesAPgL2W5ETPBbvPfIcjlMBPYNUlIvV0w8Jiu7gfi4lG6CNz3Z0C+yJOpMu9Y28+TybA4uu2/QNSclI1maMGXqy9cBunv+BQo+c7sIqaBwW7qrt5GYVxUd0pBD8AsfIu5ed2FOLjSuu62z9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 8 Oct
 2026 11:43:58 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 11:43:52 +0000
Message-ID: <d17960fd-154a-4975-aba5-e67c8bc53854@intel.com>
Date: Thu, 8 Oct 2026 13:43:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] ALSA: seq: Don't lose partial read failure
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
References: <20261007172533.14667-1-tiwai@suse.de>
 <20261007172533.14667-8-tiwai@suse.de>
 <aa22e14b-fa6d-4164-b8fa-6a77eb2a2d39@intel.com>
 <87o6d4609l.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87o6d4609l.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008C5.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::68d) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|SN7PR11MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eff3f0f-a530-40f4-24b3-08df25316cb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|11063799006|4143699003|56012099006|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: fk5+uZMDKs2Hm9XH0TR/XVYXTkvpiaYOHCagscaguTVoIReOxoNc9vuZG30qSq1uZ5i9+5pMHKAXoQ1PwXMZAkuQpmxzGRiN+3HTxvpDtpKHalTpHZTCT38o/4U6KId8tWoXbAd0vIPKgdDJeGU7oP8X/5CVQZ0Y/7hQN1EsKUIZmISm3mMQ0QrRtIanAgpS8AsaHSNEP+1tt4rEUDbl5kNjMWzUFm4CIOPYDfHWWQrPgRSqkLDZGeqA3Uo5vloF1xwm1+XsyeGTJirvp7goLwx8xlLfHBedwasyl5n2T00vI2Sx40LW1stYRJceUZAD8mp5tP1pWI9UoHHsOdNBJredIe/FnqQkyqIMci7U+8K7ZoHBd5t+vjgkzukj4yhJ6wyIanE+L5MEf85m8sabstdFOqcbv9SmUOAZAJa0a3ByDy8twJobfYEhDpXmDt2ZcjIoLVFv9vzaNAofg6DDbKI8RsWGf2/SJonDZRL5zbXid9s3IWAhODDgJEYz5/H+pYIns7E069KhR7LnVMeZkIFrugdXeQbt8gpaQD2BC1NSQJ/mZjH8YBBu9n24I6lEaaMsf9Ijl90Wd2DNm80tJ4WZl5fYQaCMxhzz9ki9RF9ZpJ2mO8HEn/rvlmiGZ8XpnXCi11yOgoMm7Zvk47JbNAVlmIwRTRJCfWSheKDgDiQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHF2YVJTTEpETEVBalB6SUcreVFPajVzY2plYlU1WHRwNVZ1VkxQb09vajlE?=
 =?utf-8?B?Unk0TGtoYm1oU2ZqckZvYUxUTkFYQnRzZVkxd21wZXU4Q0RvSUhGN0xFeDQy?=
 =?utf-8?B?MDRHNVc1NzZtQ2xybUM3S2Znd1I4cTZTc0F4cktoUXk0NGF6VHVidS8yS3Zr?=
 =?utf-8?B?TitESjJhN1YwYW0ydjgvVE1xaWI1YnFUQUV5cytUcnNTY0VCUVl1ZDdtUW8w?=
 =?utf-8?B?WHhnTG91OTFFQkU0SG1YeCtiNDZyVDA1c29CQmozd3JZSm5aYTUzZ2Q3ZXUr?=
 =?utf-8?B?WCtHSy91OGthMW56R1hoWHJJQzlieUpjdW9kWk9CVzE2RjA1TXNNME8xTGpN?=
 =?utf-8?B?WWJGMngvTXp5VU9lV0x1N05KWkh5enR5WVEwQVAwRk9WTm1rZkplTm5YY29l?=
 =?utf-8?B?enZvdXZzMnZvU3dGdklkeXJZSmE5ZjZ0bFZCTVNxTXZpOUxtMk15TzVpeWQ3?=
 =?utf-8?B?RWk4a2h3YjE3M205NkxtbXVoc1NDTFdSckd2MklRNnhUNTJwa2NmOGMvY2sy?=
 =?utf-8?B?Yk9TV2ZEdnNiSTdnbUR2aDlkaXI1eTJNMFMyM1RFWi8yR3QyaW5lL3MybnpD?=
 =?utf-8?B?U0J0N2RDRWFmVUwzNDN2Wlc5QTg1a0crWk9vV3QxczhKZnNOR1VudUN2TTR5?=
 =?utf-8?B?UmJHL2hCZFRVak9WNVRjOEZnRjJ5SVZ5SDV1ZDlrNlRBMlVNY3F3ZEtNd1hr?=
 =?utf-8?B?ZmNkNlNwOUZYS3RtQ1pLb3JpY2R2TkZlRDROMEtiSUo5am8zZ0t4MCs4OFU2?=
 =?utf-8?B?QmwzUTl5RGEwaldxbzJWUmV3RnlaSk9rRDl2QmR2SEtSaXFVbUJ0TEpiQzlE?=
 =?utf-8?B?QUEwbm05T2NFc292aFhPQ0hsbWk5SDFJcWUrbEk0VHFiU1dza2p2eHRmakRT?=
 =?utf-8?B?dXM1TDNkdTBYNG1VZG80SE9yMkFFZThTaHVxN0VxR0Rra21KUE5zUTZQOEcw?=
 =?utf-8?B?a2hTeW45NlRwY0ZkbjRGWWEzTDhOVU5SZTUxa2JXOWl2Z2tINUY0Umt4eXVL?=
 =?utf-8?B?SWgvZGMyRnFNNGpDUXhXaW5tUC9mSHg5ODdUR0lxN0tQRE1tR1RuZzJUdkNB?=
 =?utf-8?B?bm5YUkdWdUNwUW8yUVExRGdXNEVNQ2xSWHFrKzJxYUN4RlRJNWxtREtJNGUw?=
 =?utf-8?B?ZnRFK1RPMmxSZDlmRUFlL0tRTG5TNVhxaUVVYy93NFpjTWsvc1RyWVlsUmJs?=
 =?utf-8?B?Ym44dTdJV1Erd1BNNDY5Rjd6VW5SUEpodk9vK2tDVzBqcTEzMlBsYmthdGJ6?=
 =?utf-8?B?Z3d4cDVPdm1SRzZMY0lRT3dvU0N3RXlmTlRoYkRjY09XRmhVSFVQblVOUG5i?=
 =?utf-8?B?Ykh1VzRRaE5yNlpiWnVQa2NPOEhyTnlkbmdxZVdKOGtRSjRKKzQwRk5SYm92?=
 =?utf-8?B?MnRhcm5NbWRNeU5lT25EOHNYZVVxUllmSzgxd1FhZTUzUGdDdWhxN2JrTmNH?=
 =?utf-8?B?N0tXQ1RFbWJZbVZCTmxKbS81THpHamVPcW5jN1JCek9SaytuREpMSjdwRlhJ?=
 =?utf-8?B?L3BpRVAzY0IvL3Z6TFlaV3ptM2NMWURjK1k5VGlsM0tIaXFFK2o1T3lNTE1s?=
 =?utf-8?B?QWNWaSsxcXNnYkcrS3EySUhQUnRKMlFVSXFOTTBtRDhZcHREVVY0UUd5dnBy?=
 =?utf-8?B?dDl0dThUQXhSb25WeXNFeVc3a3BycEl6WlJkeVUycU1YMUk5Qnk3ZkR4ck1V?=
 =?utf-8?B?N1pJUGVxYmF0UHNpeldYWDZVNy9DeXY2a2RNd3JDbWhEUnMvQUVuS0dOTVVy?=
 =?utf-8?B?ZEkxY21aTmxkbjBEaG0ySFAvYU9wUFBrOTI3aU5xRlE5YjNYeW1vUXRBZEVm?=
 =?utf-8?B?NEs4QnhaUWFpYU1hazBtZ1VSSkNrZE4ybG9lS2tTRmdBamJNdFFtQTMraGRt?=
 =?utf-8?B?VkJIRzU5ZERNcUY3N3NjZFdUSnhLbk5YNDRld25YZWs3NUZMeEJuNC9Xb2l3?=
 =?utf-8?B?N0JYUEpFa0VVUUdTQ3h3U0l6OFYxQklZL1k5WUtuWHZYM05SN2tvcU8yWFdt?=
 =?utf-8?B?ZkovQW5tQU9HSVZxNUpHQk14R1pxTDFxdjRJQk4wUUhWdUR3dmkyWkxGQVFS?=
 =?utf-8?B?QTZXYVlYckFmQ1laTllzM0ZtT3hlTURxNVBZY1JqSTc3eWNpdi8weXBHWDhQ?=
 =?utf-8?B?SHc5MXFIc25Icjc5YUxvaGRhNERGS2hwR2JVUjUrenUyVERkSTR4eTd0OXIv?=
 =?utf-8?B?dUlxNmNqQmFIMFc3N0V0M29UaURSZ1ZhWDYxTEpuVEtzU2xXdmhGNWpTb1Jx?=
 =?utf-8?B?Z0toNmhiZUljZGtMZnNDT1dMTTd1akNUTTNpdk1WVGZjT3dpV01LdUEyaDFn?=
 =?utf-8?B?dHZIekx3WWVGOWM4ZlVCTmlSWUpKMnRBaEtyVHJHVW1NTFBjN29VUT09?=
X-Exchange-RoutingPolicyChecked: CvokrC084HGygNqNaX4yQk3uhfCmKJ73K1bMeCL4muAJRScYrPh8k6HYFr0S9yRYN6+7uOnD4m3o6fNc5+RTyu1VQA8fbXCjp+Z9enrVeT3B8gkyd3xvUJETIHnpVsid44KaiegiU2keVQUXHZ7idE8tVKfONXAJ25suFwITYQgtOTzk9Hq6F2FMzpyQrDr3grHVrS0FLds2SVLGSYvzE86XblYlAK3O2yozrYn7gqDB8hJF36NY/ope4LTfIXRnbCoZNCXePiUhgy7CMMGuijDv82dNXvQ2GGnrvZmkeehOqJxmewV87ZI63rvX2JxnWWgDSWIRvkNW/7GwDch1TQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eff3f0f-a530-40f4-24b3-08df25316cb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 11:43:52.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oA0c+SxdOoi4wLa1881Wsuup7938gAo+aaGaE6BSETs5Hty+uqNmmu19fISmUzbeM68m3+dM9qw5hHdF1Czxe4q1j/RhTkmrZbEoa9P2J90=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
X-OriginatorOrg: intel.com

On 10/8/2026 10:53 AM, Takashi Iwai wrote:
> On Thu, 08 Oct 2026 10:32:29 +0200,
> Cezary Rojewski wrote:

>>> --- a/sound/core/seq/seq_clientmgr.c
>>> +++ b/sound/core/seq/seq_clientmgr.c
>>> @@ -480,11 +480,11 @@ static ssize_t snd_seq_read(struct file *file, char __user *buf, size_t count,
>>>  	if (err < 0) {
>>>  		if (cell)
>>>  			snd_seq_fifo_cell_putback(fifo, cell);
>>> -		if (err == -EAGAIN && result > 0)
>>> -			err = 0;
>>>  	}
>>>  
>>> -	return (err < 0) ? err : result;
>>> +	if (result > 0)
>>> +		return result;
>>> +	return err < 0 ? err : 0;
>>
>> Can 'err' even be positive? Looks to me as if 'result' holds the bytes
>> and flat 'return err' suffices.
> 
> Yes, it's just to make sure.
It's not a blocker obviously, I'm just in favor of avoiding
double-protection. I'd rather fix the problem that causes 'err' to be
positive if somehow things turn that way.

Kind regards,
Czarek
