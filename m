Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794276456;
	b=zX++QLvZF52yYxn5Df6DasU6kLNd7kPPoQmXY6wgWQargC+ePleiAlMVa9/td7pW3vy7
	 TqFjdfBjBnkwhK3OjqhkSR8uGxPP65OaE/zEGRkrI8/6vOQr5ci6M6WyH3u7odBbgtayu
	 7CYQTJIs6lTDoUGffTLNhvQnPCQLEim1RRenY5qF+S3K7gV+C+ts2D7G2dSB68+OvTSXt
	 Cg7qK1fOTD5nFO/zaPTF5QimfOwP8+DNlFU6uiZ/SDefQWqYAygbKeJlKkAx3l/UWIp+c
	 +NRa1BngxoUVLbxvq6V3xN23YD0qmR0ETWProaelmf8fJyUxr1vgd6eRsx7yoqISL7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276456;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:From:Subject:To:
	 CC:References:Content-Language:In-Reply-To:Content-Type:
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
	bh=ekzI/YmylElg+ET2ZhdpYvJ4UwtnNnkt5zQ0FEyrFZM=;
	b=tI3ElMLmuEhEoFryCuL7wl5ybHPnqUgEcMP96veVJ9U+SoanzL7wXW7RKDW4hI9DgWOe
	 7qVfOvwvgD+CWI/JpsJvkVzNJ/y5UCg8PSUKugWJY1Lg0R0+Ljvzhzfw0+gy6g2hdyBu4
	 Zhr4ADDJBzYzWvcmfy6M5wgWNkARh2ueBTpX6DuAPmIW6Xy96krkPAqGzVlp+qkkuxCtd
	 MIME0IeRdHoKxcrw/R46qI476o6Ey8s2/tlUBmodadFDzjOs1ALKt2rhIQTuUdVQERI2l
	 +SCJsCv1aGHYKjuHi5rcR2FGMuH7E5v7PCeRa5Q60icc03rssq9AiyWrckM1x4bQQtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqin8Edm;
	arc=fail smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94430606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94430606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gqin8Edm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794276456; x=1825812456;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iJkN6ytPJo985jtuDWsLvySPwJN9ZziL0jgENIOYLNY=;
  b=gqin8EdmkK9fNnKR9YoMa8eJZDBha0OcnhZo0nFWRGvFwjSb3OWSrmXI
   eQgQ2Wtza67f9F/OfUAIt56h+4NPM+26hKYwjPNCBtabq7Om+r2Lgf3iW
   kewZ1fXxC8wTmwdG8C5s9innmaA+1F3PscoNk+VOVxgL9AsFqmsv5A71U
   QmuN5PRMMomukoYKZSz9wcJicBtyY9S+8EqZuLVJhgkVintfnr2KL+rkt
   iW969Zw8dqns2hPhbxn5iO3IVAczpRtTLQ8k9rIN2JFKd3dixX/pRXxs1
   +6D0j16hGJ20PP7wyunoMeksVoxJVu+R/fDjujipc4aubm52qUoUWksJ0
   Q==;
X-CSE-ConnectionGUID: QUkG2OJrRLS6w8ZtUFCZTQ==
X-CSE-MsgGUID: fZHmut9JSwCpKFLUsx70aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3047524"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3047524"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 18:07:36 -0800
X-CSE-ConnectionGUID: gCLN+1+6RES6iNADweT23w==
X-CSE-MsgGUID: 9ClFI647TbixCds0u5hvuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7881195"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 18:07:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 18:07:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 18:07:34 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.31) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 18:07:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cjrnBrbwv+2xz/PV4p2pwIEbKbT5LsdtIruQBigGCacPHLn0zBwGJ++5wIIGK94sJTZLmuisgl7Mjo3mM4SCkS3HfPPF5cm4WUAnifig8Gr9LrElrOHU7R5r9r7MciIJT/ChrvHUz5ceBBpDH8mk6ZbrUfmx36f+RzYDG65XalFJ8NTvqAEFsZnCXpfDQICOGc3igHM8O4Zwe/quK9Ggh8b3SAThebdmtnTQx2VCiNo/lxye+QgJGxHEHdiBnjaRKpZHKiSR2qRqum4nkpJo7e/KmRgB4s0I1Wzny0iqhtH0i0/7f+hrcdpLwKf2jDHaILnHLaQ3laGjBs7CVSZh8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekzI/YmylElg+ET2ZhdpYvJ4UwtnNnkt5zQ0FEyrFZM=;
 b=igvvmKXK3Hzw5Vo4ZfwX2RdaJav0IG++i0ycyXjzQb4AZUjF7P/Q0stwTrgsK5hYAiDIVxnZ8Ku7hDnKI9AKZiU+736ozSVZlSan7wBCyOhPNMT/qsI3R6mffr5zoQ4W2e8nY2FGGOhL5p8BZr7nHxIDE+5AzhfdDbBGbvA6nTJPG1pLM0l4QkKdjuyoqntfTPy6CP4eEK9vCpHemIlbaQOVAmLcTR7ujoYtJ6Bf4ApxcnDinWJwmnCbwtr7alOSlidrGXUY2XYK2G1R5abI8dOgIp753Ay5ANiFXKo9OKyzhLRKtt1EEiFWMVIIa4rT6OsyiwREQMVViXKBqzLBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 DS0PR11MB8763.namprd11.prod.outlook.com (2603:10b6:8:1bb::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.13; Tue, 10 Nov 2026 02:06:49 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0592.009; Tue, 10 Nov 2026
 02:06:49 +0000
Message-ID: <1944bd56-201a-4184-af7c-616e282cc953@intel.com>
Date: Mon, 9 Nov 2026 18:06:47 -0800
User-Agent: Mozilla Thunderbird
From: "Chang S. Bae" <chang.seok.bae@intel.com>
Subject: Re: [PATCH v3 2/9] stop_machine: Add NMI-based execution path
To: Nikolay Borisov <nik.borisov@suse.com>, "Chang S. Bae"
	<chang.seok.bae@intel.com>, <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <peterz@infradead.org>, <david.kaplan@amd.com>
References: <20261015211426.49114-1-chang.seok.bae@intel.com>
 <20261015211426.49114-3-chang.seok.bae@intel.com>
 <bfe8f403-06c9-4e93-9bcb-738c9128c557@suse.com>
Content-Language: en-US
In-Reply-To: <bfe8f403-06c9-4e93-9bcb-738c9128c557@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0062.namprd03.prod.outlook.com
 (2603:10b6:a03:331::7) To DS0PR11MB7925.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|DS0PR11MB8763:EE_
X-MS-Office365-Filtering-Correlation-Id: 974562bc-d58e-4d9c-8fc6-08df3ecf478f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|4143699003|261009223027099003|11063799006|261022105027099003|261026140227099003|56012099006|261022075727099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: p1gH6L0dZwGt9OpNVj8Xc/NhMN9oTeUKEcSr55zHnBmaZb0keqEGXmfEH3ed13gHOeEg/IFvzeSqoszdkONHuEStTZattn+7KYPKxISY14ljOOKWEPCxiIcPv6M3fP+cVSPsUR+nTHYUMolJYQo5dGLX+Xc1gn2+Xox7FLYdosYr3+NuCO+L+fEOXXuQqVLhGzLU9Th1e35kgCVLCQX5JocoOx0J0J4dQgwYytxyScUb/sN2XAqaVP5g3F8ldLo26gcU3oR5gQHDsbii/KvuhXL6/EizAMxz2U+zLCVr3a9xEizbI24edO2f4KtOLkoP/zoVsCmPi/jhLaVTY67yrUwRPssgUbbDPK5qOED7Pmskjyv8kVy09yET1vi/K2pJTHB3ijcC16cAHKJLLzr52qhZs8Qe2okS+SUBNZvF8eS69nekJ0RUKAFqSzNB9eKilQyw9rhgvbI4Qy8ogdZMfzidArXcgL3LRuxcCSPNMX2vV95ObD6JvtYmj5o1m9Ai+5Z3fblHD7aDeKO4p8iX+s/enEl6SSxb/WTa4tjJzu8GcKHWsVarOIv/PCdJs3bDaI8E0ONJkdIAnDxIGAb9oapQTYF/wNJkjcSkAeEROsDc9nrpTojHZxv09KcwAfSN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(4143699003)(261009223027099003)(11063799006)(261022105027099003)(261026140227099003)(56012099006)(261022075727099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmROWmQ1TllicWRmUlQrclpTNHkvVFpLZk1iR0c3RGdsY2I1aEUrY3JwMWVW?=
 =?utf-8?B?a0t4MndjWVJmSUt0cnJUdDViWkxQUWxjYTdVVkFGMVo2ck9Id21LcEVrT3JX?=
 =?utf-8?B?a01NTk5ZNC9ORDJuckZHVG9yUUU3ejU5SUhMRlR1SSs5Vmc5WWJ4OXBGeEg0?=
 =?utf-8?B?b1NkVWhvSXRlQTRzOWZpWjloQWorb2lyNnZBVjdVc2pCTitnNGlsRW1aNTlS?=
 =?utf-8?B?OHZNUHJaS1RSOHZ5ckVBRTQvSXBTK09wc01vQXdRWVVyeVVHYmNERkhhZUti?=
 =?utf-8?B?SFh2aGZRTFE3dVpqeFhIbzZRWHVBeEg3b1dEU1liTjhmUy8rcVZtVVRmTnVN?=
 =?utf-8?B?ZjNKclRJaWRUOEJYOUMxS3RwMWM5dm5KODR3NVdRZFhQKzF1YXRtYjBNalYw?=
 =?utf-8?B?eGZxNTB1aHdHaW5BUHdEK3hvbis4NCszSS9FVU5pbHVMaVFFaXJqb05wNlY3?=
 =?utf-8?B?UGJ3L0x5b2VyR0ptd3A0SllYb0dGa0Q5K2lBTG5kMjlUcnpCVVJkWTExMHNq?=
 =?utf-8?B?MTVMWlNSREdlUFhMV08wcEp5MjRTRldoVmJOOWoyMWJBWGE2T2E2WmRPUHhQ?=
 =?utf-8?B?eXZiU0Z1a2FxelFLQlpqNUFtVWlMUytnSGNSQ1V4RlVwdkRzeGRaSVBwWTM0?=
 =?utf-8?B?cmxhQXRVVnhPb1hraERyZ0RIa3pxWkI2UVVLNVhPaTJKM1huejYwTkxGa1BY?=
 =?utf-8?B?NjVHQWhyWGE3b2ZMcWx6eXRLaXI3dGxjMy9Jem9Jazk0ZWppanJ0RlNYbWl0?=
 =?utf-8?B?Y2lLWEZkWi9aS3RyRzB3S1NYcXlENHowYlVvSnM2Tzg0S1dXalNzeHNZMlcv?=
 =?utf-8?B?cnBZbjkrUVB0ZUJUempndGd2djI5eXIvaEJ5cVRHOHdaSVN3VlYwRTFWdjdq?=
 =?utf-8?B?VzlDeFc0aDNXTHMzQUcrLzB3MzhtNWJrVmEzbk4rTm9wa0UzQzRaRUxKU2tT?=
 =?utf-8?B?Ry9XSkIzM1BhTlRWZTJUZWpmY0VnRnY2OVUxbitKckdZbmpxdndscms2RVVo?=
 =?utf-8?B?NmFveGlwekpiNEtBLzhDN2FtclVVN2ZreVZFZ2JrcEtCdTIrZUxic3Q2RjlJ?=
 =?utf-8?B?QTRISFowNGJJYlFXMkdONk9ZVWZVWHFteFhjNEs1Mkd1Q2VZaFB2VFArQnNx?=
 =?utf-8?B?U3Y0cFNTdFVDNWM0amN5ZGZ1aUUyUCtydnJTMmw3WTlTdUNsSEVwNGg2TVRI?=
 =?utf-8?B?VjBXeTQ3SFFaUTdPZm1rU0k0SGpqNlQ3bkdiQ09hV0kySDV0TXV2enl0M0VU?=
 =?utf-8?B?M0JqbFdld0pUT3ltZkMzWTNySVR4bFJ4c3E2b3VHQ2Q0clRYS1A0bGVCK3lz?=
 =?utf-8?B?a0NGdldEd1NKSERpMHAremQ2NU8weWxjRXluc3BLSkFaUE9tK2lIak10L0lY?=
 =?utf-8?B?ZXZKdHJwSmJ2MzFxNDZOTFl0YnRJL21HZmRKd2JDMWhRTWhBVzFaNUdYYlMr?=
 =?utf-8?B?WXhZeXVPc1BqYjFHOGxIU2FuYk5KOGJwSnhRZzA2UW9BalJCWVpXMnF4T0ty?=
 =?utf-8?B?MjhjR2dzS3lHTldza1h6MlEvUXJ5ZlRMcVV2NUZSN3dmNjR1ZGx5dnhIeVQ5?=
 =?utf-8?B?dHRURFhtT21PSkszdlZnRlBKR0hiR2dOQU9qQm5USDZrL1NOK3h5RDEzWDNv?=
 =?utf-8?B?UmFBdHRmVDBnWVIvZEJVWGljRWdadHMwbFBvWDlaMURZSzRxcWZINkFTVWxm?=
 =?utf-8?B?SUJyTGp2WjFlZGI3eUVzcU95TmU1b2ZzUSsveG1sZ1BrMEVOcndOR2pESXBC?=
 =?utf-8?B?NFF6bUhKaHJoT3pDczFBbUhqcWlYTG1wUmVUWkFsU2VCR1FJcXk4bU1pamRq?=
 =?utf-8?B?YlJUaFBUcm5uUGZWT1d3NFNtZ1JEaG4rQjI1N0ZHd24wMDVRdzVnaU9Ka0tS?=
 =?utf-8?B?Vy9rZXEzZVBObklkUlM5ZWhRLzB0OHJPRVFhL0FTcXZIOU1QZVpKNy92a2dz?=
 =?utf-8?B?VkVpMTAvblpXdGRjcnBFQ2MzVzRkKzgwREQxWUFhRnlkY2hXZXpTYmJiUm44?=
 =?utf-8?B?T3krUnVnbDRERjU4NkZlUi9WaWxmdFlORUZqWXBER29iL2RIbWFiZWFZT2xq?=
 =?utf-8?B?RXhzdWNwTXhLek1ZTTJFRXd2TGJQVWdLQlVnTmsvTXYrTkpwck5pUUIzSXFY?=
 =?utf-8?B?MExuMGVuejVRK1AvTnIza1UzUEkyYW1BMHYxdWtOdTVlY0VaaGlYUEdVUDA2?=
 =?utf-8?B?SHVpSSt3cGhIOENSUGw2S0g3dmlNcGFZRnhsWGU4WTN2M21PeStPZWV4VWQ2?=
 =?utf-8?B?YmIyL003NEFuSUtYK1NLU3FlRFRlY3FOK0VmNDhDK3dkakNiNm10SjF6dnpT?=
 =?utf-8?B?Z1VTU2MwNURPN05EcitHSks4Q0Vpa0xLQS91N2JvdUNtS1g2Umkzdz09?=
X-Exchange-RoutingPolicyChecked: aKmHavmo44C4muSQ88Z7bnTh80Zh6er52AGDlh00T93kQ11bvniOGyrCTs+1yBLmayQ93PIMw5iUIf4fkulvHAszAGiye5P7iH/zUJG5ubpUG/pz0bLTvE8dxFNA3Ru9LOmwa0U295uIN20/RtAVB2VmJEr4RmPQUCR72YMOV97QPY1jXdknehvSVvmFErUYE0pyWa7CFJgju4Te/mUWU6bmz7DqMmL0hZLXRIeKPiqApuXv93V07iuP+MA/aULuhBtVSkjl+HOILhedIzeP5HEBxm1Z1XehWV3z6J/gjSpUJ3v924QQ5YA9ya+4U8ftc0q4jQWk/2ihIlL24ejJtg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 974562bc-d58e-4d9c-8fc6-08df3ecf478f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 02:06:49.3510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AMYXd3kUXH9gwzo+8xbt6G7ELYU3srr9XENFaSVuaEU1Lnm94FhjbSKlDcNOfHQvoZMmIbqmYIGbz0cXnM/j/WzwoFl1OHSYF2Sn/p+QAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8763
X-OriginatorOrg: intel.com

On 11/6/26 09:44, Nikolay Borisov wrote:
> 
> I think this function should be moved over to patch 5 and by having 
> moved/subsumed patch 4, Patch 5 should become patch 3 really so related 
> functionality is introduced in subsequent patches.

Yeah, the suggestion makes sense to me.

On top of this fix,
	https://lore.kernel.org/lkml/d81a45f9-1ba2-4eed-92f2-c5152c5caa7b@intel.com/

my local pile now has:

  * x86/microcode: Remove microcode_nmi_handler_enable
  * x86/nmi: Simplify offline microcode handler invocation
  * x86/microcode: Use stop-machine NMI facility
  * x86/microcode: Distinguish NMI control path on stop-machine callback
  * stop_machine: Introduce stop_machine_nmi_cpuslocked()
  * stop_machine: Add NMI-based execution path
  * x86/nmi: Support NMI stop-machine handler
  * x86/apic: Implement self-NMI support
  * stop_machine: Define build option for NMI stop-machine
  * stop_machine: Refactor multi-CPU stop glue code

I'll post a revision once sorting out the bugfix part and other feedback.

Thanks,
Chang
