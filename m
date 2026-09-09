Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1535339B955
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788980351; cv=fail; b=m7LhlHVjBA8x6BhK/thOmo1mHdiIiE0KcK+DJCDs1t/Yra3N5CBB/UEXthbv/Aq5B5iWg7it8yCyqI0thBo2MxOUHrFb/8ibI5l1sfgEFEmq/bxoiDdyWcciL0wD4YEb4IIqW60t/jbcZ3a0Ty44xogAWB+0CJhj691ZoMDGPow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788980351; c=relaxed/simple;
	bh=FBy+UOMfSRMhGR6wVSkevzlxj6nGWutzA94u+RgU6Rs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RjJuStFge90H7x3k8Gmz0RKVOq3yx05jFLOzHP349WfH5XkwO18bCBFBVExxW5EyAckzDrMf64t8RezQ5Nx3QCyeMioYpBjp4yK9NVLP76pk+5oweqywLdb0WFrZkpQCpLh4bZfUO0/3gjHayR8KSRrCLCtbeaKKhZ+0Gzt3J9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gJlcn8rG; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJlcn8rG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788980349; x=1820516349;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=FBy+UOMfSRMhGR6wVSkevzlxj6nGWutzA94u+RgU6Rs=;
  b=gJlcn8rGS/lUvPa5t0+4KQHvCNdQ9ZqJ1YtLuyojx85KhC1bwwXVtgns
   lTX6PXlTLxAE33PP6tekcYVWvdCoIvsLPhxJk/1LxWPTdaA54ju5wPO11
   Xyd65S+9HV0dbFOXJvppRcXGHgxrKexY4Er4gu7PuoSCgaTx29rkfvL7z
   BunHyINRRTHOo/Orq9hLdBN7PCFsqW8zCJW5r5wbPJXkw2zQRgvnwrnXK
   f1K5mZB/FrZ44qCCx9s298H/+/our8hCZEukxXTYYUFty955J9hnOKk30
   kIJ06e363ULC7VR2FajqsGpwiYfTiaOK/cq4fPw8DlpV15zkzhVpDkysJ
   w==;
X-CSE-ConnectionGUID: eVusvItMR32Ne9BpoLeYLw==
X-CSE-MsgGUID: lWDGb+cxSs6VCsVKn9+/cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89288504"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="89288504"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 11:59:08 -0700
X-CSE-ConnectionGUID: upQOKEnrRAyX/Ym+i3TuXA==
X-CSE-MsgGUID: Tt2Wjjc0Qkma2MinfsH90g==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 11:59:08 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 11:59:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 9 Sep 2026 11:59:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 9 Sep 2026 11:59:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KdXlfYyy6mbFjzaq3GYRng4YgXgj91HqR3A9HthPLTWPVCVM1ctnCpfUsmGS8vPfaTmTwwRX0+f9XCquwRY9JRk3AisGc6cPThD8gvTuBTlAAOpl0JD5jJq8/RVTxhjHtmwib7RUsCixd3+4cvxuin2ouCoGZAH4v/t8qe3kv1dHF5YHLL8FNPcHQxUnpFWnOOX/qWQHBRaAP2mwP+7IhJ1YtP1U/Nxi5nj2yQd1fmcbDYJfmDlf9l2irOdaLcEsEtPGBhVgnisw+leIDUFvgYOJ9v/L7fC+1k6QoqE25TZUxQLWKYrEwPR/JH2A+0hKh0ramoZ0qI0QDIqRjcRUFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FBy+UOMfSRMhGR6wVSkevzlxj6nGWutzA94u+RgU6Rs=;
 b=yZ94zJ3xeV8z/r5l0MnODKl4ufh7K/t37L8UdVyVpp4sabvg+vh9dvRgbSlOanS1cBndbmtv8kOI5dzS+UJLEjo/Ohbj45xUNsRLWjnF0Uit+tZ0jVhT77qCguoXVB1NjS8+ZbzTcBZKNxUFfFhecsbi0RJuMWXaf+cvUrGsdBPaJHmwaMW0i6QrXeS4vG8QWZU0zNveWzdJOJWrJaKuMXQizMgFKCxWF0irMxRTqmTSbu1DmU6elzw+GyIAeJwSlbaQq7Or6EZ3lgvSaNGreyMLE0MSFguzz+Twfhlv+HG6YzsbXLbVi1s6klkRTv0ZmtZOoXMNwWgX8sBSFm25kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6771.namprd11.prod.outlook.com (2603:10b6:510:1b5::20)
 by MW4PR11MB6786.namprd11.prod.outlook.com (2603:10b6:303:20b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Wed, 9 Sep 2026
 18:59:05 +0000
Received: from PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4]) by PH7PR11MB6771.namprd11.prod.outlook.com
 ([fe80::effa:162e:c9c9:a1b4%4]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 18:59:04 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de"
	<bp@alien8.de>, "tglx@kernel.org" <tglx@kernel.org>, "bill.roberts@arm.com"
	<bill.roberts@arm.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] x86/shstk: shadow stack enabling write return code
 change
Thread-Topic: [PATCH v2] x86/shstk: shadow stack enabling write return code
 change
Thread-Index: AQHdDkDgPF2SucxE0UOcvDqTlzNDULZj1iOAgABFu4CAAAEfAIAJY2qAgAABkgCAWXmdgIAAAneA
Date: Wed, 9 Sep 2026 18:59:03 +0000
Message-ID: <879b18319c8fc555e53938557d9918546afc3de7.camel@intel.com>
References: <20260707184542.1721085-1-bill.roberts@arm.com>
	 <f9223651-a51d-471d-805d-e9a2ee9c6b51@intel.com>
	 <0d639fcc-4bb1-46a5-825d-beb803b8f3e7@arm.com>
	 <77ad85d7-2d1a-41ad-aa44-aad26f7af5a3@intel.com>
	 <23183893-2106-4e5e-8bb7-2754dbe5864a@arm.com>
	 <5eb8f7d9-a996-4bd7-b355-3c5e77d03070@intel.com>
	 <e2e725f0-3271-4977-a3e6-1aa27e0beea6@arm.com>
In-Reply-To: <e2e725f0-3271-4977-a3e6-1aa27e0beea6@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6771:EE_|MW4PR11MB6786:EE_
x-ms-office365-filtering-correlation-id: ce01a0e6-6512-4fac-3729-08df0ea46ae2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: BI+DufN6e2/oK8nLmyQj5VHPNKub9mpvCbczUM/iXy4WfHH1ybM8A8L+ctLsAB+u/xYADQzJkSQkw8zfMdITFR19IsVHF6bxL+9jH5DaIxLb+bpd7O6KZikCf0udS3uIFgzv7n+lXq6rC2fDdX7V7a29PkaSH3OBdpACm8u6KLNF5qSpoaugFDlvW+h5k766u64okBsMFNRUqqNUiSKn2f5kLln0bpqM5LmAehIEKOgQjhF1ydzcDPa2ecZCSRhHbbkg2FhfJsaKNCwMTNwkA4a95cMMPtr95GxsPGOjttxspQCOI5gE2uHOy/mn40Hv5tsmuWTrVljNiY3y8i/l0d2NOJ1rVjxYXZEDavaRm3RoT4ieqxSUs60KOVeCcR09wLqGAU58gunAsoSTobrP+9WZfsMX3WJJb+T8mjrkJEHl2/VytISH+iofgdAFuz/63bhw+hQAAX/BfWEplqSpU64tnsPpzMPbKa85ul1mH3nYM/8GBrAyfiqeB8DFn8hpyxXO9bLygYr1h6mA/b8ZjruND+rpPkaZsfl84TUQYrK5+6ZFIWdHAWRCcFLJlZIoU6UfceFF+ULX9MgUzCRL4MzB2LzVBrMm0/FYKAD5VKRwFpRKpHBhf13RBb2M85+JcJ7OTK551xgBDSJME9N+ci/tqdDcRKw7586Qr5txy7pJmCYVXtGEHd4eEOHcGPgwJ15i5yqjdtCIWbW//LBoV0VkyvRPOqq2bVAGl94rJjQ=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6771.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bjlJaFVTNGRtVHpFMDVlWlZsWjkyQkx5SkF6TU1sU1BCQXh1WDBZZTJ2em0r?=
 =?utf-8?B?cHZzMm0wWUhIWjFWaWpTdDhjNmk3Y1k2RVRWa2kwakZ1bGpuNjAxRldCUW80?=
 =?utf-8?B?bnR5VkJKSy9KaWVlNFUzUFV0NWlRQndqM3lCdUZJakFyTVo5aWxULzMwWFgw?=
 =?utf-8?B?VTAyVjB6WW5va1ZXenJaTG1icVhLdFFoRmFTS1RocWNTbzlqK0VTb296eTR6?=
 =?utf-8?B?RVY4OWsvSGtpL2VqbkQ3eEhuYnlVbHRTNmhLWi9ZZEd0VlBZRDZCanV3QWtO?=
 =?utf-8?B?bHBadExEajE1ak0rUG01VzJidUVXMUNabDByWjJVcW5RMHRSQTN2b0Jrc3Bk?=
 =?utf-8?B?dGpVSkdLc0pzeU5uTVZOQXJyS2l3clFsaXlua2RUeHV0MTRVRnJ6Q1A0S0lr?=
 =?utf-8?B?ZFU5QzZxRFY4aHMvSy9aeitReEFNWnAxOWFiUyt6RTdNZFRCM01kakllQVg0?=
 =?utf-8?B?bXpUN0RNMnJBc3R2ZFJUbHBZTEFvcmlucDlGdVB6SjM2ejAwa2NwRjUyUjA4?=
 =?utf-8?B?QnNJOUxyVkFGWFlmcncwRjBsMlVWYW1kN1ZlTWlYaGUvbVdBWjZsRUREbTRF?=
 =?utf-8?B?TlhCN2cyRTJrbVJtU3dHcEp1aEVMK0Fqa0dCL3hTUjJCUUlNWStLVlpnVXkv?=
 =?utf-8?B?YmxWbU1kM0g2N2xHTkZVSkJ6UG9uNFl0MEU4cnd0RE02WVB2d3VTZXVVYjdq?=
 =?utf-8?B?NjN5Ly92Y1lyYWNFc2RBSENFSUFIcUVLRVRoVVhXZ2QvQlBFdnFoRFc4TG43?=
 =?utf-8?B?U3g5QXptTUw5dkMyMFhFZ0JqejRIcTlWRmhadDd6RWRDTkpEZkxJNDByWnlJ?=
 =?utf-8?B?dll4Zmkrb1ZROW9Nd21hRVpVYXNpb2gzN1JmMmliSGxUTkFKUVZQbDJIM2sy?=
 =?utf-8?B?ZEJJTXI5T0RGY3l3QzZFSllDaVVUR2NsKzV5U2dxYXJna0V4d1JPNVZhcVRz?=
 =?utf-8?B?TTY0dHg5cUVjTWFwYXdxUGRjb3VHa0U1aFUvMEVkTmVXNWFFbE5mdmNheUk1?=
 =?utf-8?B?Kzd4L1NaRThiMjdObFEwNnNHcG5HTWs0Z0x1QjVHS3hPazFlQVJ6dzlxT2Ra?=
 =?utf-8?B?QkphaUVkM0VyS2p6Q2g1ckt2NDRtc29GUjd2a3pGLzhSbVU0b2dKbmJ1Mzc4?=
 =?utf-8?B?MndsenZFUEpqYlZVaTZ0S0JQaXhCZFBGSmZncWdoczRIM0FWdWJLN2xYMXhw?=
 =?utf-8?B?cUpOSmo5NjRhK3hrbitqMWMrOWg1VWRVOEZpVnFOR01HeEtiVUdzbUk2ZlhY?=
 =?utf-8?B?RUkwRnJSYTN1bXVCL0FRaEkxQmFsa3dWOVRraTR1cDJORElsNmhOVHB1dk1B?=
 =?utf-8?B?TUpuQlBJQ1BKbG44d1E0OUtYdUJXMkNrRG02VEMwUms5QXA1L3AySXVyVXhF?=
 =?utf-8?B?NlFXZFlKUWZIbk5ldWhaK2VaQVZkSWUrOG96SlZCUmtvYjVRenlWcE5mMGt5?=
 =?utf-8?B?MWxvUGpTNENETTA1RFBWcjYvbm5FbzEwMXJDcHFNWStLYlh2MURNZEZYRFcz?=
 =?utf-8?B?WWFmY3N3OTVLZmhDbjQ3NFF0aXdDd09SR0hRUy9CcllDNFFub084emYwVjRo?=
 =?utf-8?B?T2VzbHZXZDRSejBxVjI2MFlKVXpLTmpML2RzZ3grQ2dKMHpMejhIeGtlUDl4?=
 =?utf-8?B?THhidzlPUkdhK09yMC9qMWsxV0R6Q0x5NjNDM2VHN0hsYnlNZnJoWStEWnV0?=
 =?utf-8?B?OTdhcVlnR1JiZWtLSTd4V3p1aDdEcjBQQmRSdUt2cFNGeDlEK09mNlVXSXZa?=
 =?utf-8?B?bUFvZUFMZFd6SjcxOGVnTUZNMkpFeVMvb2VGWXJSTGpFQ3h2UUE2MHlxZ3ZJ?=
 =?utf-8?B?NlVIc0Vtei9tb29FNVdCSExwQnN6dXlEM3VIb0doR1FoM0xoZ0dIY2tXQkhO?=
 =?utf-8?B?cWV2Lzc0ME1uRnN3d056NjE1K0swakR2N2tYWTA0U3REdGt4ZW5KdDZIVUNF?=
 =?utf-8?B?SGh2dUI3a1BkNjRzbGdNVythME5rWnNOWit5ZlkxMzFGKzZwMFV3cUhhS20y?=
 =?utf-8?B?MFloWVdPb1FvMWR2djBrQmFTQnhJQUdkR1QrdGFlRjhRSmg2ZC95Sjl5OEVl?=
 =?utf-8?B?NTYrSjE2UmRoTlN3aGdkeXRnRnB0VmJ5MnJlUkZERHlGMnl0VCt5YmtLcWNi?=
 =?utf-8?B?cGE1am1PV2liWnl6NWEyNnEzZEZIbU9NQnBVVGZnUGlReWVlaXVyTE02d3Vj?=
 =?utf-8?B?M3pCdW9uRkNMUm1OZGRGWFJabUpXcGdJZFNsTEZucmVFQ1FPYUhUUTV0V044?=
 =?utf-8?B?NmtTWVRDTmc1T293UWYrVVBRSmZZWGt5akJERjFZdDMwSHg0RWJvQlFJM2ly?=
 =?utf-8?B?d25yekRLck1pbm1kVGRUay9WUnlBZC95UlFBVUViVHJJL2J1bjFJcGprOUxo?=
 =?utf-8?Q?PUp0xyKAr5bRAW5g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7450410E4AA4641AE1BCC0B95D7E45B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: gwyBxf1GFqeImoDT+zwIJ6gslj3SVDw0QheReBjgyGnReEFxCWX/IkpNjOoXLNOGGJZofji7ads2sz/78a1jm+jhN33Meqltz2QGGoGbK4ehDwjsqaaHJDveJSWNv7E7f1Yi5H3wOGJCwT0hw36yQxgReEvEhVMOY6cQX+THR1+D3zGmfX61r5fbnvyLr7FnRT13vaXnsbPKSoXJby8I81nQd/vGhLjIe76jsketNUQUmHDxEhw2dDpPw2kwMerL56/JSwWij2XcBOLzRKxb7W/A7HGaugK66Z5y1EHRqqyamQ8//SqFyjVEPnx5GmQezYacGG/fI2dJg/1jVojjug==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6771.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce01a0e6-6512-4fac-3729-08df0ea46ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 18:59:04.0005
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z/i0ClYVgCpZv1l+ypotTpUiryMcgXmkWdwYXMkgP7x524ek6KddgZeFTtJh1QCKuHpj7E/Pya7F2DB0WbRHSMZzEj+yVsFei6WlO8VUFqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6786
X-OriginatorOrg: intel.com

T24gV2VkLCAyMDI2LTA5LTA5IGF0IDEzOjUwIC0wNTAwLCBCaWxsIFJvYmVydHMgd3JvdGU6DQo+
IEkgZGlkbid0IHNlZSB0aGlzIHF1ZXVlZCwgZGlkIEkgbWlzcyBzb21ldGhpbmc/IFRoYW5rcyBm
b2xrcy4NCg0KSSBnb3QgdGlwIGJvdCBtYWlsLCBhbmQgSSBzZWUgaXQ6DQpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90aXAvdGlwLmdpdC9sb2cvP2g9eDg2
L2NwdQ0K
