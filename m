Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4E83E44E7
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 21:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383746; cv=fail; b=Qwn+2XdLZwfcorkMBr3Xu4w1iata6XDDxJh/3B0cx9xvq4aAigjS3zJhXJ8MvZF+6wHYWRaOeCd98gNkKTB8FMhLdSMFsKNXbG3nVTMhlOLXHbLxodgA1uld7oia0DR5n0JgsR3fsNd3oYwGOhuqwlxUcTjeAzJBIInZZImWqZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383746; c=relaxed/simple;
	bh=3hfBLDw2caFSJ7oBvpDLWEDC/x+TWRdFFSCMm6dw6TY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L9o7isxXVDB+tF5fzVaSx5vBEBsIskqos1uydzhMuHNuWk4Q6hoNOOmYStwnI8KALuTwEJJBVLTawt2fJjiACz3lBOJg8YCnLHIfjSQ0a3AmSilE1hRUy88ShpuZop1xkzhw6l2Nr+9EiFObcxwJ/Zbcz89sLvBJahkElg8RWqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQMY5d/K; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQMY5d/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788383742; x=1819919742;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3hfBLDw2caFSJ7oBvpDLWEDC/x+TWRdFFSCMm6dw6TY=;
  b=NQMY5d/KKn4KYbPWUr60SwaoRksFUGd4yXPbWLCtY5QWIboQfGQEa+Nc
   ZHykT2RmMjW4bN9bZkQgdGINJTCCrsJ4j+/9oEX37/CFuwo/sRC9ELM2d
   QyD9+0efmxgH8YtdrcNI+pqWYpWQnvtZT0HOpRzeYYoP7JwlxObnYbHxz
   sRuV0C86Fp+TziewWtidcP7evtMP9cQz6O/Of1ESsjoeufWgt7h82U1fy
   vjHoA6Qh8Ne+PbZTW5BjYWA9jVUh4sM3ZhZeW79CiaVcGe+NA5JHBy71L
   8PjoRKGvaVtLVDrS9A5DWPaV7cs40G6UZkN6Mfo1mRbDrIWn1FAeUxz5j
   A==;
X-CSE-ConnectionGUID: OtCRRF4BS96+4QCipnq2Yg==
X-CSE-MsgGUID: 5zGaF5TMTF2QrB4SVu4Vhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100208556"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100208556"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:15:37 -0700
X-CSE-ConnectionGUID: sRNMji5ETECDwc/u2GJC0g==
X-CSE-MsgGUID: rwvFHaSuSISlh2I41xOvag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="268978308"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 14:15:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:15:34 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 14:15:34 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 14:15:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZ/EYMuC2qKPUt1j4lF+RX4vSNld4uakBEDdsT72ACD3rDjASUKxlK1MrICMEFM60IcIxulvufPDi4jp2sJSGMUwrYcZ7Ed/aPgZRhnxuADbS0kINDVrzt7/0fgfQUV0pjPAVY5qBqCkM0IBLCs1gZnfwvbx73RY3FUad16xZ/Bo4Hl6jxe9cbcXeUvc35T7LWHoMT0n3trDYC/Nim3ya4hIwt9eJEQxGMrFPfxVRwAeazwsrY/fyisSgUinlVBnT1YN0iyaOOmyFc7K5DpS7KZz4wl5lJhsBONksqiQhuk5vpn5uiltsXE2XME9a8vng8t+y9dlMmcQyEDTjxBpJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aUP1jqJ/654mfPTetihI+529Tk0y/uEZO2n8l14nlWU=;
 b=s9nMbIyfojWnHY9u+jedLHjCip+unJsZn4d5acPlhAHbUnVw3/Y2cWcZL33FhpTzU0tvGv1L5QWcR/UGSPUItD/WD/VYGQ07bugZacF/gvTt74sffSdl3ErIguTPJnJfS7aDZ074QnNWEo+kNL/oE0ZND/CtNtwzXfBSkLervixiYZaap5lD3iE5/0Hwei8N5rTR2jJpn696HpLfA4rGr2NS7g4qTLdN7b6VwyycZ0Cdqe4jTHZg4rBbstBMHDha4CoRjz4mkPGyNoMK7lKC8QqcFBu66kayOUMTzfBXlO1BYPIhd1xQiT5pcTXNmehA9NYjunj2NkmnAU9JR4gjag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 PH7PR11MB8250.namprd11.prod.outlook.com (2603:10b6:510:1a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 21:15:26 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 21:15:26 +0000
Message-ID: <2c480c94-a996-4252-b9ba-be5145cfe69f@intel.com>
Date: Wed, 2 Sep 2026 14:15:24 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] x86/fpu: Split __fpu_restore_sig to extract compat
 path
To: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <criu@lists.linux.dev>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Alexander Mikhalitsyn
	<alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260817042048.1579415-1-avagin@google.com>
 <20260817042048.1579415-4-avagin@google.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260817042048.1579415-4-avagin@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0165.namprd05.prod.outlook.com
 (2603:10b6:a03:339::20) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|PH7PR11MB8250:EE_
X-MS-Office365-Filtering-Correlation-Id: 3032c3ed-80a4-4b05-ebf3-08df09374ee8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|23010399003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: S4EbaaPJXcjEVvHuz6Lg1L3C7qO/0VSFZqak+GiTjcrjBkQCdFSYGLWrdTd6mTtJUutFVq2hLU2rRcsAV6nryQE6p9WMjh4ThuduZt7gRy2M1FIP55EA4IhtGW0Is/cyGzHoLjNmJn2UWpdLPefHK+b0raYUGszqHabrm6t3liBRgB2nekcir9RrhVXa68CoA1JpoZlJ6lIHXTF9ZgZux1aS5zHoFXiLSqd3VWVCG2r7Jvoa+sHg2IdG0nAetbYSzZHzCUfgtL7d1guI4O7/EO04mGQ+5jEXmQfB9XHbl37vr2CFG71EsQaxBXuRjIHthPpcar7uNHLnTYQb4e53o1W2Gh5NAcaui/9bpU6nb/FspbrO9N35kSilmWEar7z/J5b9Gdgz2Gy6deP0gQ3Dq50aaUzK11ADFacMvdKiudDa215nlX6rcwn++ODFbOU6GnHgjjhUtxs8V9j70p2aUedJh6p0vaN3Up9lV1GBPdbGMoHJom72Zk8vjxISteuHsNjvmZWaK1VYuM/8eNUm+6tOAHsIb1X4+vo6uat4Nav4iu9R99lE/4ZAewtTDIQwgXg3QpJVpmSXA7ZHVUXmBdFZRmBc44qwaKZWLaXlVG7Jv+xS2vjneN7WxkBnihCichDV59o23R4mAYZxGKNS0vop04X9DGO52m0SPwz3/7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzVENUpHcnFwT0MyeEx6Ni9DdVNGRHdSMk56U2hucEJsQklZWWt5RC9RYXVE?=
 =?utf-8?B?VlMzcjRBWVBpc1U0K2lJUHBvNy9ndkprSUVmcmdRaG9EUlg3eExORFAwOHhj?=
 =?utf-8?B?eHlvTEdZa3p5MTFBam9wOWYxUTcwQmpXdllPQzZHNVB3b3hJVWd2MngrcVQw?=
 =?utf-8?B?U3VndU1wZjc0bUJGYmIwbFhuYXM2RXkzTjY4cUtSZHQzS2hOS0F4dDVKZ2Fu?=
 =?utf-8?B?VHFhSW04ZVdjS2tVTnZYOTFpeVVKWVRyV2JneHZZRDkvL3EzaFEvRjBRcTM5?=
 =?utf-8?B?b0lubCtDTThZZytvYjkwSU5tQWJFMG1ZVGNEbFJ4WDJjVWV6cEEzejNwTWE2?=
 =?utf-8?B?WkJMRnArZGFCVzBERmY0SnQ4LzdxaDdEZDh6TDQzV1dIeVNlaEoremxORHZ4?=
 =?utf-8?B?K3BTNmU5TzhvVFF1RHZkYVkrd0FFS0NnMEt2TWhIbWY1Ylo0Nlpubis1ZFR4?=
 =?utf-8?B?T1JTeDNndGlCaE9wZ09uMWEvVGZsdGU5VTVmdDlhYUJWLzhxRko4QWRaeDlv?=
 =?utf-8?B?blVtRW01bjZWQTZoVmVIMTI3S1M5ZzJpMVVjM1owbkh3bUlCV2Q5RURuWnJs?=
 =?utf-8?B?KzVhTmh0NUpGRG0yU25XcFFCR1pzZ3V2VW5PbzUzVStqVitHRUc1eTIvclNw?=
 =?utf-8?B?SVZULys1dGRjKzAyOFJiajJnK0F5L21tckJiQVM2MkE0VnYrbHNBOHlRdGJv?=
 =?utf-8?B?SkJWV0MyeUVYZ092cVJpZHZ0ekROMno5TTduaE13WU5tdTc2YnlNRUFWejZC?=
 =?utf-8?B?ZGJ1bG1tSDB6WHU4NTRuOU9IdVU0V0MvWGNwUXl6MklIbXBaWjdTdng5TkJh?=
 =?utf-8?B?Nm9pZWxYTCtpbCtiZWFpcnpNOHNtblZvZE5TdzRtVlVRZVJpY3dwdXFGOGhJ?=
 =?utf-8?B?YmFSUVN2OFdjRVQ4S0xaWk4yR2dzT1ozZkRIdFU5QVZHeHNsQ0lmNUN5dGx2?=
 =?utf-8?B?VGdHODl5RnQrc3JuR0wwQWt5ejB5M0xuTUZ1cjIzRzA1NjFEVHFTN0hnL2Iv?=
 =?utf-8?B?MlliMWg0U09oeFN3UjZ3N2hGWFpkNHh2QzdmOXM1WnFzS3V3NEZxeXQwc3J2?=
 =?utf-8?B?NWkrTGliNWk2eXBjUjdLNTZRZXArTHF1ZEVGeCs3NnNvNWwzSWtQeTNhWjM5?=
 =?utf-8?B?SXoxS21pNnZFMFZWZ09HMVZKRzgwV2wwYWlnb2lwbHBvSW96TW5adlpiUzR5?=
 =?utf-8?B?WnUvS1ArSWdpby9tL1ZucDhOcnpod1FLclUrMzNhdDdKZU9NaUlPaVNLRjlQ?=
 =?utf-8?B?SldGdXFocmdWM00zR0RJUWh5ZHBkcGtoZEpKK0J2eUVPUzI0Z2pSR25GOUpW?=
 =?utf-8?B?c25DWEtCVHEvNlA1ZUJYUG1LYXdMZHpqVGY1UDFZcGhVS1F4ajNDL3ZzcVRa?=
 =?utf-8?B?ZEUyRmZxcTVsb3VxdVFVSXgvc2JrWnByNnY5TWg0WW9xOE94bE9xVzZuREpL?=
 =?utf-8?B?MFNJQzFDV3Brc2NyZmJGbmxQMzlWRFJXbTdaOGFwT1hNWjlRTWNlUUw1ZmtQ?=
 =?utf-8?B?cVNsVjg2K2NJTTFnNUJ2RjlXWTYwR3pBcTFMUDhHVEJSRW9oczR6YldNM21z?=
 =?utf-8?B?RzJmTVBMM0VBTTIxVEx1aWVLM1hGb2tUTzc2eUNFeHFjcktsT3lVbWlvd1pC?=
 =?utf-8?B?d0ptd1RsM0E5bnpKd1padmZhQ1RWMHVPMStzOHBrSCtSZWFrUjdvY1IxbnN1?=
 =?utf-8?B?K0h3VDhpUVpONUNTOWdyZmhYaW9iaDFsWDRUL1k3dEQvaW5OSi9EbllyM080?=
 =?utf-8?B?dGk1UCtoakpYS3pxQkJxbTZGU21yMERrVThaZHcxWnFYQkt3Y3hrajdZR2pI?=
 =?utf-8?B?emlacm1VSXFRMnBOU0hUVVhvS0toWndnbEY5dzB4YXRmYU1UUWx6ZjlQaHpX?=
 =?utf-8?B?S3V6U3ZsOHQ0ak83QXJPS3djL1NtMTFkVG42SktnbnYwdXhPYm5MT3dXbEpZ?=
 =?utf-8?B?MkJMREMxb3VJa3NEOE5TVG5kN0FmYWZKNUUvbGFOcXV0d01tR1U1OWplT1ly?=
 =?utf-8?B?eXN4dTdQZzdkTGNyVklVbFMzSHhOS0dhN3RXK2h0SWlvdVBlQmlva0ZWc2t3?=
 =?utf-8?B?dENxellwYTNuRndJVm1ON1V4aFlXbVpYaHFtU3A5THhXOTdxaDJidXZsamcw?=
 =?utf-8?B?SnEzUlRnSzlYaXpJaEw1cHpKVWJGZ015NVROUHNqRXo3Y1pLREE5OWRZQTVQ?=
 =?utf-8?B?WCt1NlIvSFF5OXM2NlExZ1VyZVZxbkd0MTRCbHAxRGY3SDljTDRrMWQvaGlW?=
 =?utf-8?B?eCt1Y3MybjJ1RVV6K01KRzd5STBhdEhaY1I1RzlEaDZ5VUVLSmJwcEl0ZERP?=
 =?utf-8?B?RVZ5Um1RekVmaTltbDY5alFwamQ5R2RFSE5vMTFuTGRQdG9pcjIxdz09?=
X-Exchange-RoutingPolicyChecked: ldJtAmtkjwKDHwtLnN5E2/U+n5YjWPQaAQv0sbMq5ippJlNuMuhK/9Adwbuhd5zqDW4jQl4I3NV5+BNR5da8rNon5vpvaXilUoAUH+QRL/EOY7jmesoVzFsbA83CGZTlXTaL15rTD9+fNd79yQdgAgGJJqddux2+SXe0PtVKRrtoTHvetBv/ykpmwVNtaujYONoZSmINTgWmfPwqEVk5T1BVIEH5fdOaycBZDplptUGC7NAQ9hoh1qHviMHHLkvwGqWPWCzbgme0WCnNj/hi6b5fkpZ6edB52I90JhWdK2ArsHct/Tvy9KuPdMUyp63nHnCX+fz9KzIujUpSZHSnIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3032c3ed-80a4-4b05-ebf3-08df09374ee8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:15:26.3911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NCpTdsHPHeTsfnoegMpO2XuDEkRs9D6wDzMUYch7Ql6LJVM57VTUaDeR8D/BMN8E+gLLJupCHSUcay3azpQr9ddYvXVXyxB2iLjc97NXig=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8250
X-OriginatorOrg: intel.com

On 8/16/2026 9:20 PM, Andrei Vagin wrote:
> Split __fpu_restore_sig to move the restore part for the legacy/compat
> FPU state (when buf_f is present) to a separate helper function.

Not sure where the justification for this refactoring is. Is this 
primarily preparation for the next change?

> 
> The legacy 32-bit FP frame duplicates the FP state portion of the
> FX/XSAVE frame. For backward compatibility, the legacy FP frame is
> treated as the source of truth, and its state is folded into the
> FX/XSAVE state before restoring the registers.

This reads more like a description of what the refactored code has 
already been doing than a motivation of the change itself.

> diff --git a/arch/x86/kernel/fpu/signal.c b/arch/x86/kernel/fpu/signal.c
> index 42c3d78bd849..6a14b528ac7f 100644
> --- a/arch/x86/kernel/fpu/signal.c
> +++ b/arch/x86/kernel/fpu/signal.c
> @@ -264,6 +264,9 @@ static int __restore_fpregs_from_user(void __user *buf, u64 task_xfeatures,
>   	}
>   }
>   
> +static bool restore_fpregs_from_user_compat(void __user *buf_f, void __user *buf_fx,
> +					    u64 xrestore_mask, bool fx_only);
> +
>   /*
>    * Attempt to restore the FPU registers directly from user memory.
>    * Pagefaults are handled and any errors returned are fatal.
> @@ -324,14 +327,9 @@ static bool restore_fpregs_from_user(void __user *buf, u64 xrestore_mask, bool f
>   	return true;
>   }
>   
> -static bool __fpu_restore_sig(void __user *buf_f, void __user *buf_fx,
> -			      bool ia32_fxstate)
> +static bool __fpu_restore_sig(void __user *buf_f, void __user *buf_fx)
>   {
> -	struct task_struct *tsk = current;
> -	struct fpu *fpu = x86_task_fpu(tsk);
> -	struct user_i387_ia32_struct env;
> -	bool success, fx_only = false;
> -	union fpregs_state *fpregs;
> +	bool fx_only = false;
>   	u64 xrestore_mask = 0;
>   
>   	if (use_xsave()) {
> @@ -346,11 +344,33 @@ static bool __fpu_restore_sig(void __user *buf_f, void __user *buf_fx,
>   		xrestore_mask = XFEATURE_MASK_FPSSE;
>   	}
>   
> -	if (likely(!ia32_fxstate)) {
> +	if (likely(!buf_f)) {
>   		/* Restore the FPU registers directly from user memory. */
>   		return restore_fpregs_from_user(buf_fx, xrestore_mask, fx_only);
>   	}
>   
> +	return restore_fpregs_from_user_compat(buf_f, buf_fx, xrestore_mask, fx_only);
> +}

I don't think replacing `ia32_fxstate` with `buf_f` is a clear win for 
description itself.

Furthermore, __fpu_restore_sig() now looks thin enough that this may not 
need to remain. It could be folded into fpu_restore_sig() rather than 
tweaking the argument naming, then. I assume the resulting 
fpu_restore_sig() does not become too messy.

Thanks,
Chang
