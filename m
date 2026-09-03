Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75D34E56F8;
	Thu,  3 Sep 2026 15:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450056; cv=fail; b=urxnhy7I1IqUppFwyKf+t3pkZ5sg4mR63xoUHl8+qCIW2nFxhVZXeH/3oYt9seDpAZgHNRd8zozmWq+fA1tncZbj5AmEL9Gn4E0nKJt9jQUMjmI04kWH4kw+y1iHfQ2YlFQAjq2fyKP6KvOjvxFjBO6FdlRIv0KdiPbsimO5DDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450056; c=relaxed/simple;
	bh=ap/8Ifir1dnQLy+vrblDVsN5MCiYJdaXtx4l46anGKg=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YJiJcIjC37sgWsHE8Xm5lijMlI8seDugSai7l/NvfcPkhSMEH/GLDHhbMIZAYSLVCmapYFkTqPjYb4wk3xyl2u6Siyv1Fz3AbB4ejg+JE7loTy0+A5N3i1VhR96SsZilSfhubCSHQaX0t7cTtWfPE+ahfoF94qlxZ8+bJZKhUPc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwDN0twm; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwDN0twm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788450055; x=1819986055;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ap/8Ifir1dnQLy+vrblDVsN5MCiYJdaXtx4l46anGKg=;
  b=jwDN0twmA6wUDJsM9kyu7B64QIZHUqvOnRos1M6eWmE356MxFAwdcP8B
   +z2z6nxZHrpLRDTYwEhdqIXG/4jQuobKYSodnQcSr5gxBC2UNtpE5WLIR
   ZDc4d4tNnvmU6tPFObdcyvtVDtd7Sl++v/O9i2SVGApNZUpCZMDr+UOL7
   Zfc/ziMkCxS7TNG13QxDgaWr/Qm5z3leg/tEICg/wN/dlnOkDMe0nM45O
   uFR7ISefO5b8b5OIE3I+7hPF/qRP6pyS9d/xTDAYhjCwwdF/iZbFIVPqh
   803izqjKMf7zIBFcmB8ECjzEWc26MKz16qRzoD9aWQucvVrL7zL1aTiAL
   A==;
X-CSE-ConnectionGUID: jE7zOP9FTzKvqlC2EZvejQ==
X-CSE-MsgGUID: FW56ovz9Q0yJIRKD8GXJjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="92805418"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="92805418"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:40:54 -0700
X-CSE-ConnectionGUID: m4KtjjMOSVq6ucqLEL4CBw==
X-CSE-MsgGUID: nC/X1iMTR2KZlwlo3RayPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="269752298"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:40:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:40:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 08:40:53 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.8) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 08:40:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlMVGsva+3Q9gaAXA1UBVG9tJgqWCO6X8m09ic7jLUc/bZp5lhe0aMsSs/1zp1JJKz8StxoT7Xo2vyP8/R3zNeTMUOVxVTcnXX4XEhsMJf9oPehfo+L+LQJai16pHQofDQ6xKSmygYUHiK0y/DDGWw8UCCWd3nC8hbNOmwdj0EDneH1U1fmVa2J8NdQ+4cksE6G0BJTPkH3aF2bAzjRQoO+ZwRrrPZVGekoXI8c0FwsBlPRzMH7oCEhKx6fRMvfe9FqVxbrFCtXFPSE1dFobVIaibgEHyINw1Tlt544/rl/EYSojCy5qpKDwO1TtTkRFGYGvyZW1BNxp1nzTa4g8zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4stFt9H8QyxSprfIhTJP/lSPIHGIy6M91G2b9UrAtA=;
 b=g5oMUDqUSJ6lnbGAVBPz/5EI5FspmDC8smm2RCrZZK274hzpX65rfu9fEL5aYV3hU4a9TaWj5H9vdZ1XC1cmj1wfPabVInDFKwC+FKYyAkMmaHHvSpNrWP6qjb4aIF/cd2D3iBuVXfkRmvu5RWGGjg7PGzBwGsStxGR6pSEfzsnNkztmSnzFoV0Ri4lGAJeg8MK5hxSq7MawcJCYC5P5qkokRHY65Dv+Mn/+c41mX9vzlHAogKWZBKNOJ2Kt7zGf5M5KbblystXcvL8ycNuJXCIzeAYobjiEIEbbqXrg/gUHfsa37U9DyuQNiislSUUOzAwVQOncepNfuGUS8GIeog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by CO1PR11MB4788.namprd11.prod.outlook.com (2603:10b6:303:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 15:40:50 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 15:40:50 +0000
Message-ID: <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
Date: Thu, 3 Sep 2026 08:40:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
From: Reinette Chatre <reinette.chatre@intel.com>
To: Ben Horgan <ben.horgan@arm.com>, <bp@alien8.de>, <x86@kernel.org>
CC: <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
	<dave.martin@arm.com>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
Content-Language: en-US
In-Reply-To: <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:303:8f::16) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|CO1PR11MB4788:EE_
X-MS-Office365-Filtering-Correlation-Id: 206b1e70-6000-4f68-3d45-08df09d1bb65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|4143699003|11063799006|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: m9TSDWEcu7Ob/4KpY3EcmxTpjsxH0Hn5dNkMfmRXj8tZlynS5fffiyi/YJYHhwTCqaQR65Opt+TjkNpqvq9tYWMjrVry7dHfu4f+10KKyTr/cfeo9/jLsFrrTaPnosGNtGyAnWsVzki9U9PXu+PKDNZz6H1MQ4J5TKizQuM19bE1fDYSubB/OeJV0n3Q/dYH2SkbT3GfAj8QJXCAF28kiay161ROHEJJI9J/ziBEBAniZJCJ5PPgMB0aEfkfGcA4afkvK4ZkH+pVDUMPJpWWA+ZCWxRhbnabwgug3V64jnfImStp339L7EWBLXiFvIWaLJ99/VhmJpcNPDniYWLjGAoFPHxQPE8DfLrkMPvrSAXZE+uZVnZMDiAKRfZILYQPFxys4EWgKVYjF744BVDUyZAhIUyZYk3dRWmwm6tlg1+5Mir5rmCh7jw2Qxok1I4dccpD9jESfu1Y7OY3SLEqlswQ7kC8QNTs3XyHCgsbkCPH0NmvrUEIsiCKLiKpioiRh7zcc1liigSvraky9BCTt/0xxpx93P7p2JbLZ50AyB54B0QCQCmEQJ1STLQSnnxtWeqfrUoRLlgJiHuVFe2MFfCdsWtpx+JT/w0jxudoTNpfXm6in/ePgb8uvHjbnEWtLzrR09hgKe7urTvZwQlGrzldPQUSt5HYpwz8eWKM3m0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmtodzBVZHc5S0NzanVkQVlYN2hoWmcwK3pLd201YVlFMXVOVXQ0QWhteUVW?=
 =?utf-8?B?WFpwM0c3eGN5VWNvQ2Vxa0lpYVhCZCtqbmIxTDNXVTZtK2pCY1ZqNmNDTDhN?=
 =?utf-8?B?QUNVLzlCVFVtR0s2djR0YXQwaGh2K1BSNkJVUHovODIrc29xclNqbENRWCsw?=
 =?utf-8?B?bFdCKzlkL3NJK0NUSmtyUTZHcURYb0Frc0lVUi9nT1Q3OXNsVWZxWWY2ekov?=
 =?utf-8?B?cGhEb0VjaitsSllQeTVRTzJPdjErd09pZDFxcFNjcEpqK1JBWTBWSXlhaEZL?=
 =?utf-8?B?N3c1SjVmZzlxczdsSFZiY3BpbFdKUS82cEVLSUdkSFgwQ0R1NEhuUVloNzBD?=
 =?utf-8?B?ZzFPZi92b0s3MGV4QWNFalkzM3FRbjVvSG9HYUFMcmxZMmRObE5PdjMvMWdX?=
 =?utf-8?B?K3E5MHFHbEJTZ3lOKzZFb25Tdk1XNW8vRm1OTjFpdzRiVFRGdzJ2UEJtVFdr?=
 =?utf-8?B?a01adDB5M3BkS2RSMXhHSFMvMjRYVmVCYTNoY1JKS2FIamtQNDJhN01TZ216?=
 =?utf-8?B?MjFrdVVCTHAwd1YrUmpXT0w0ZWdRNGZzNDZKL1VsdHRMVDBnYWxyT0dZNnk3?=
 =?utf-8?B?VEFabmJVczRXdmlZc3ZFd3M0TnJkS2RwT1JuMm9sL0dsSW9reVEydEJnejA2?=
 =?utf-8?B?K1hweFpYR1VkUG5SYVRlaTVOSW1vc0Q5LzkycEdRZlloYTUzWTIrV1RKN3pF?=
 =?utf-8?B?YTF5QmNrNEhzNlZ2YktGaTBGK25WYU1ZeXp2SzFKM0NCUmZxOUNwNWZML2t1?=
 =?utf-8?B?dndxd1lFQ2lXT2c2TzJsV3lGMEZRcjNOL1ZJbWJOMTU4T1VxR004Rjk4aHVs?=
 =?utf-8?B?RzdPWndlOFNsZlo4RmZwcllja21ESFpZZ2VKTk03cHRVekhwYzR1ckVLcGx1?=
 =?utf-8?B?T0hoU09FY0FaaTN0cTcwWmlMUWg3TkdvRUJ6QlBORElXdWw4VU9CcWQ0L2VE?=
 =?utf-8?B?L0pBR045K1puTExCUDdiOG9FRVJZY2ZSSzVOaFlCbDNJVUR3SkVpQzNWSEwv?=
 =?utf-8?B?S3Y0Q3grNkN3WXQ4UUgyT2FkVjZHeGtZa2gyZ3BDay9NQkRQVkRRV1NkdXQ5?=
 =?utf-8?B?UForNSs2NjRGQm9meEJ2d2V2N1M1MFYxc2ZpSzVxZ2F3QmljZHhieC9DN3E0?=
 =?utf-8?B?LzBwOGRJeWZPL0J4dFU0UGJZNzI5b3M2WDlDcVgzb1c5cHNaN1pJMzg3Um9D?=
 =?utf-8?B?bGFTV2dFeDJYd1dIODJrR2FuK1N0eUZHMFZ4S1lYRmlCbUV5cnB6SUJmamhC?=
 =?utf-8?B?L3NPMGNCV1FKMXNiTWMrWHBubUp2dE44WVNvbGNtSllMWmpsSnVNU0ZKMy9z?=
 =?utf-8?B?UTB6UnRiMW1zUlowb3h4ZUtYR3lYQ2NrbXNpUHQwNlNITGFqTzhOd3FjSk9l?=
 =?utf-8?B?Q1UxMHNKNkZyOVdnZ2pEWHhMRjczRm00Y0lDdThRQWlkb084TngxTThmS1Vx?=
 =?utf-8?B?QXVRbmxjZDJDSit1UUtjcGVDRjNCdkM2cGc0S1lVb2pLdHRVSDlMTVFxSGsz?=
 =?utf-8?B?YkJIWXVXa0pDdVFTSjJleEowdjBCY3JvdlZPYmZHajlvd2dTVEVZUnJTYXN5?=
 =?utf-8?B?WFJ4K2dOelB5VVU1Q1Q2WjVFQ0hEWjgwYlZzbmdtV2dyQmo4YUttWUVyd2pN?=
 =?utf-8?B?TUdUUjJTeWNCaFRTK1VLeDQ5Z0JtcWtkcmRJNzdxcTJCVU9MQWFvTVczUkd6?=
 =?utf-8?B?UUhyaHRDWHk0OU94TGM1SVhmTVFDRk1oK2hRbTVnVzBERDFnTjVNUHNqK1ZH?=
 =?utf-8?B?YzNLQi8vbHp5OWdTYUF5N0IxcXpSWmZiTC9TYVVHQjdFOVIvT0ZaU0p3dldz?=
 =?utf-8?B?OEFUT2hCazdIWVNqWTJSKzN6Q2VHUHk4L0hMUktHK3M1ZzFLK0JlaEd0MkRt?=
 =?utf-8?B?UTYwNGlQMlpTNFdtY0hXVUw1K05rSWFORHI0N0x2eWpwbkZzZTV1MmpKRUU3?=
 =?utf-8?B?dXF5SGZtWFlXTDB2WmpUemFNZ3c3TTg3dzU2TElMaUxhMzhiY1ZPNjN3bEZx?=
 =?utf-8?B?UStpYzB4ZUFIUTlreUZtR0R1UVBGalg0eTBiM25RSzFodnExVWhZajl5ZHVh?=
 =?utf-8?B?NFhJZlBwVDIxeTRZL0o0TDlIa2NRTS9Jdnp3N1l1ckJSNm5FaVhiQ1hyQ0Nq?=
 =?utf-8?B?c3VjZ1RsZWpKY3dYNDhjSUpZSGdMZVZiSWp6VExlVGtVZzJaVDVqYUtZenIz?=
 =?utf-8?B?dTQwS3JJdjU5R05UT0tIRUVTdW9SVmViS3hvNUdHb3RhdkpWSk9EZWxranNp?=
 =?utf-8?B?T21PL3ErTXFwL254bmNmRGg2QzlYbXQzUHBKSnBXMDBYR0FyeDZ6T1ZheUtw?=
 =?utf-8?B?cTZWYmdId0lmMjVQOURXR3NuM3k2ZGpsUEFHTGxUT1FvdWp3b01qQVRuTW15?=
 =?utf-8?Q?E3Wzm6fn70Ob8SnI=3D?=
X-Exchange-RoutingPolicyChecked: ixOpJJsbywr6tTLIUcFC8nfRcc5TxcDppZcnyRVteDOwkUzxNCUPWlAaKGkaLAP06poSUwSwmZ7C2FSY4lpu/B1EvBRWu/CPOIcc/BLumJGf1jacsx3LLX3biGb+5Jw9iGesgq6jUEiDyzwSj0XChjJp4conoVI5BvHzG5XB95pltJXohbjfZp6ukmxeji769hlV6+P0G776IZ3MXEoUNf2zi4igSDshLl52zA4aJNjVXY5nA0P9T/Pw00x8caujFrqZA8Auz7/GxFVUojCIG0aU5+5XLfVwRxD7L+2+9NjCMqx9VtUG4mAqLXGlwodtxgZOfUOekn5di7sQ+E/tAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 206b1e70-6000-4f68-3d45-08df09d1bb65
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 15:40:50.8010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgeoGR1AItToOy53qWR/TXxWejnX/WdgJp7YE7rZpIwtJU4Jr7o+NPexbGO16z4MaZncBUR4v27PxGEGJGU2ruPMN2tjwAu9BbDei1tAnHk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4788
X-OriginatorOrg: intel.com

Dear x86 maintainers,

On 7/14/26 10:45 AM, Reinette Chatre wrote:
> Dear x86 maintainers,
> 
> Could you please consider this series for inclusion? It applies cleanly on top
> of x86/cache with HEAD at
> 	 2566b5cd6a27 ("fs/resctrl: Fix UAF from worker threads when domains are removed")
> 
> Please note that this is the first instance of a series that touches resctrl fs, x86, and
> Arm. Since this is a resctrl fs API change these patches should stay together. You will
> find in Ben's message below that patch routing via tip is supported by Arm.
> 
> Thank you very much

Could you please consider this series for inclusion during this cycle? It applies cleanly on
top of v7.3-rc1.

Please do let us know if you have a preference for how changes touching all parts
of resctrl (filesystem, x86, Arm) should be handled.

Thank you very much

Reinette

