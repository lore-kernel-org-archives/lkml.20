Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794624371;
	b=s5aZ83qg3GvVEbIyY7dYgAZY/CdewwpOOtdPLou+xiTYzXY0k+mb/496NO60JcpZMTvC
	 2mZ7xW962dEI0WpWkzNP/jS0uK6buuP6Sxfy+ra00vnLcOIkfMh1QhDdFiskN4ZG+8gkL
	 XvN5vDdjbPGfxGw2XHaSIRvdS2+WJzEFFwxIMCY8sWsnMly88905b9Jt4jGKGdrpj9Xn3
	 N/MGOzgOhpqyytxMmO0Vm0EYPf2rqS+BsmwalCo11jhgpeTBmIb5L9vYfHDsL27eib7Dy
	 evqk2oxWMZVDjX6EIXt5FgVMlBDp/JLj6jzyeuI5NE9vWWt8ykYL0vpWPlgUoLoJ90g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794624371;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:
	 Subject:Content-Language:To:CC:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=PFITvWmIYxqzjggDaQTe+JlT2IQRDMbElDH6WbXzGr0=;
	b=ciYmpm/fJtGOU+f07n9curs4+/vdCLi54VHyM6tWSfyPWAP3JGi6kS4fxfIauIsoQ8U3
	 rsDzf5UUxfJyvUHBfOPlTp908rHEYo0JdHju80WtElPmGT9Wp2PY3nghIe0IOkxr7Eb18
	 Fmn39EXFtnsn0GwjbVdfe9yst40XkjDNMPVl3GpRPnt18xVOmA0WdA1PSaq7f6ELdBG+O
	 mBnAC+1Sx5p0JZPmHyh2o9doFvsNPsq31mS3cpzQIbvy6oh3ALcwEuDH6pMXfCnp8V9d8
	 22BRyTyLU2yyT/Q8BBfDKysNizTDhEP75/RgTdDZuEyvDZVkoWJ7W2780XPN+sJWAzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fIxtT9pM;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=J1MFefOc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE7606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 02:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DDE7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fIxtT9pM;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=J1MFefOc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794624370; x=1826160370;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7QQV7QyZkjQsNeGpmN79O6un11ReTh1KllWETwM0Kgs=;
  b=fIxtT9pM521GcuKGo+8NmhjHNw1dcf/VXQhv/mksEMFpdYaHCnKpQ5yJ
   +Xbto5GyTeMON2SNmDnXSe6PEsWmSuIdMgNpfQDMTeHtr4ulcovdylw7n
   +EYMWBn34z47CyQFh3fXMEzmSdWAekpP1J8gu8HRV4pGJZF1SBN3f8dH8
   J5A7nNh2aacrtcl0YHSe+g0D7CGbDTzfRpmDX9Zu1sBJQiCW9wXcQ/xIl
   ulByi0umPERDllCK0/UY0rVfYtIZEfn701GlYhobIKQ0mFuVRnW2MpBwe
   A1kl8cHlLhsWrfHenL4q/nB2eZusPoDgN6+LbXjA0SV30r6e2IyKURALq
   A==;
X-CSE-ConnectionGUID: dRH1aKJSR+aHDf/+5l/+EA==
X-CSE-MsgGUID: BX1bY9JAQ/yiyH0pZLwztg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3358272"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3358272"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 18:46:09 -0800
X-CSE-ConnectionGUID: lNgWSNkiQEmZ89QPAzxtbg==
X-CSE-MsgGUID: CbRI7ffpRRqqMJ4oiCc5Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="10795039"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 18:46:10 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 18:46:09 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 13 Nov 2026 18:46:09 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 13 Nov 2026 18:46:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CMR1Wg96oknyN3mXwfSvtPpBOCyrP+KMAFE410cGm0vm6PnUApbS7aGp5UWgCi5V0VlvURI1dJHJ1kPGNANRC0VBMq1aJWqAFgEC2P0nRlebcdpKt+HOtNiid04dKevgKsQbwiLaD/xiN7M+zO3Y4k4FF9qzOJFgCPECyX21On2CkClQW2PBkETVtFWKXs0w9hPbnvOLBbYar8MSGLzXQByINhtWMeNh+w0XlE9bvy+ty9Jct3CjiUjc19ruDuBRQC3k9WFsjnARgACqcKrLPUyZj2+uOlljDZFtTeenoXUhp5OPbZd33h8L0ddK21gA5hL2IAzYBTfK2wAiALdomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFITvWmIYxqzjggDaQTe+JlT2IQRDMbElDH6WbXzGr0=;
 b=Y866lB04OwCJ5a6x1sQzEoE+jePNFAdQnmvV1RbUR0m/Kb9Y/rJBRH2Sz2DvvvIu03Dv0UQR5Ex2BQ99x7uQlqIC1pUu4qUfHW1Z/QXFx4xEXx6u89wq7Pp+xGPP7xX6RnbM7dyTP+L6UevgJANYO2nKeQ0nkRUvkglID+rHPnaaTuKqtj8Tr6IpVEcJ9bvtCFSHzqGGu8QN/R3p34TKCUWv0sTVLoNdwkepOKkOOOCbb3d/WKrlF8swGBmfiCfqxCDM+2cSh9o19kaQM0PDzH/8dfUbEA5Z0qchir76hEmPbQaR1CY30AtlAqe+r4oxhMeARN0sI6kJuGZ5/Km5kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFITvWmIYxqzjggDaQTe+JlT2IQRDMbElDH6WbXzGr0=;
 b=J1MFefOc3LDkLxy/l+4qS/UGVCnTvVf+WWAR7FZo4g5Hh+ipkzPhzOyxzgr0smuteRmo9rwrkMoHx+YlABd+uCx0N9EKn8OAGgf3IDNuMlGMehi6pdwlzHmrkMQSjoVDBHPm+0K49/XkqHsb9/paQ2T5hV4O/fZFo9IQFA+TrJY=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 by DS6PR11MB704522.namprd11.prod.outlook.com (2603:10b6:8:412::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Sat, 14 Nov
 2026 02:46:07 +0000
Received: from CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395]) by CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395%7]) with mapi id 15.21.0592.010; Sat, 14 Nov 2026
 02:46:06 +0000
Message-ID: <39bc7f0e-205b-49a6-9bd3-d23e976cb30b@intel.com>
Date: Fri, 13 Nov 2026 18:46:03 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/x86/intel: keep the highest microcode revision
Content-Language: en-US
To: Hamdy Abou El Anein <info@daylightlinux.ch>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>
CC: "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "hamdy.aea@protonmail.com"
	<hamdy.aea@protonmail.com>
References: <20261107191356.151287-1-info@daylightlinux.ch>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20261107191356.151287-1-info@daylightlinux.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:303:8f::23) To CY8PR11MB7846.namprd11.prod.outlook.com
 (2603:10b6:930:79::14)
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
X-MS-TrafficTypeDiagnostic: CY8PR11MB7846:EE_|DS6PR11MB704522:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a86c87-edbd-49db-4dbf-08df41f96e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|261026121527099003|10067099003|11063799006|56012099006|261022105027099003|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261009223027099003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: 1TWJh1jjtIQEQxVLjqLpw597t0CqtqvngzJDWxNRNlhADa7m12EsvXFOVZk7kn/Ae4mpj0N0ewjdSTzXiX40ISRn1C0sGtEfHcw3gS5jQkHA8F/gsTFcTZRSzwtZ2MeYafh04gAnpx3iucVxpeuDTgnOELFdFGBdeILvuookGwoAxj9Zkvj+WGqcVOdjtTaruBMrzYcjqaf7mxNUjbJvQeuVURRUudBTiLF0e2i6FdmJsAviMNpKhoL3VOUi9jIEKAlBA2O+tyyUGsLClE55AqsCh5AYq33LZquXttZzgM5s7aFEqAml9yY70rBXZEVcJL6p6OrjZLoowaoAundIyd1HXztvNKQlup5cEdguSob57uC8LmlQUPhPmGqfJ9hLdcxUTxq6UNQPUsACk3P3AF4pCI91nsDLjGrEeio5axBl4odJdPJ+dJli6UjEmn+DwFjbNWlb11Z/SfvUCrMboCKYJMiYjiNoGjsZjmjP+IChTOdJhjQwqFHWIEItpdZGxBuNClQEUBf0Muh2H+LT1b50ZlUBB8yLxR/8aFvRN6Ud2Itv/cjjD+fq7bqo4GCRPuFrDf0ew110j76x4SHIt4fJMrZwDttBD+FPSYQDMuNuKJVcYNVbVi2XJM/JB5RI
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7846.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261026121527099003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261009223027099003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2w2bkpNYlpMQ0Y3M0xGT2ovL1owWjNrZGVGR1pEZ0xJQmt5S2NKQVVtR0V5?=
 =?utf-8?B?NmJpM0tyWDE3SitMd0FFdGhaNnVqcEUwOG94WXk5Zmx3MXFuTC9hd0xVNTlp?=
 =?utf-8?B?NFJvVHNGVmZyb29uRW50V2FYcktlQXIwQ2lhK2NybWNIOWtTNGN0Sko0dVlV?=
 =?utf-8?B?bmN4VDNpTjJuQ29DcmVtdXJwSGVWdzlRN3BFejRaRnhGcWZRcCtIV2NTQjVi?=
 =?utf-8?B?TlkvME1vdzllR3R1REZBSUgrVWxwQUlMM0N5dldFY2pGdlBkM2lKSlV0aTEx?=
 =?utf-8?B?M2xQOG55SGN6amNTejhYWFhtMExkcXcrcTdwVk1pOTlJaTY0RmdWYThXZE4w?=
 =?utf-8?B?WFdBNEdNeGVKZDh2TWg1SkdKQlJML0tLc1NLZXQ0VmJHcUFRVTIwa2w1VFdK?=
 =?utf-8?B?MjlLN0FlNCtia25qNHhGOTFldHNKSXVPOVlnci84VmlKZkF6c2FHRUdudHVW?=
 =?utf-8?B?VlJ2ckx6WEN3VlJBdjhRK2xSRUNQRWVVWEoyRXhUZzViVW5qZXd5ZVBlZll2?=
 =?utf-8?B?bU00Yyt2MTNsTHBWQXo0RmswUjV2U0hWekdRcnJyaWErL1lDQVErQzlydGtP?=
 =?utf-8?B?ZEc5MCtOTFVjbm9WTmZNZWljM3htKzBCOHUvdXVRbmRDTVovWFI1aWQ5NTUr?=
 =?utf-8?B?czAwcDVQb3FEMmtWRHdzRmdkZGdNdWk2S3UwdWt0THhoUFlLcUNrK0tGcGpz?=
 =?utf-8?B?bk5rZUJUM2M2dTh0L2oyVjhISVM4Z1lCQzA2MmY5R3RuZjVob1dSSC9TVzBh?=
 =?utf-8?B?d0JUTFRBd2QzcDlxaC9MU2JEYU93ZitMMWkxT1VDOTlVSk00RUN2VDFyeU44?=
 =?utf-8?B?VjN4THc3TmxMaks3STAzc01qaEFNNkJnUENwbkl5bm9oZWZWTWRRelpRcHRD?=
 =?utf-8?B?SUFBT3VwS3lLbnlYMVEydGV3UXl3NTlHT2JSQkRZN0NUUXNjNXY0UnFTdVAw?=
 =?utf-8?B?cHZUQkJJa1J4bk00NEU2OVBRRTZ5eHNZbW9LK1Z6dXBKaW1TL2FPM09iQVBJ?=
 =?utf-8?B?QzFtUkNtN1JacndLS2Fsd1hCbzdKdzR5TDhVMDdTRUhTb3daWU1WM2h0NzdK?=
 =?utf-8?B?RENlYzYvQzFqcjFHM0ZXMWV2OFQ0QjU0Q1RCR3p3Z0VqZmlxVzI2MmtOaWtR?=
 =?utf-8?B?OFNYMkErQmVLWWFHQUZ5KzIxQXdDWDdlUXgvMDlHdG9kTHlKL1Z2KytDMkJu?=
 =?utf-8?B?QkFVcFZIQlg0YWl5UGpXYTA2VmhYR3JiQkYyaldBNGh0MWt5TkFkeDJDUXhR?=
 =?utf-8?B?RFdUYzY0bnJIeDFSV1h5Wk1kTEpEV3NJM3FKRTdWbzc4UVcydEJDUjdLSHAy?=
 =?utf-8?B?VWUrcGU5WjRRdHd2bzV3bHRuTDd2MXQzbS96SEZLVkVIcnJad3JVTXZIRjR1?=
 =?utf-8?B?b0Myb1Zyc2NTT2xUOUFPQ3kxaGM0NStSLzVtYzNabG5IZXZ2M3plSlpqV1lB?=
 =?utf-8?B?ejI3R2dOZVlPUVRLeG1jV0g3M3Y0eit6dWtKRThMV0lyam14R3F3WjkvS1B4?=
 =?utf-8?B?ZENzVXNnZk96ZGRGQ3RTbTh6ZjRMWmNwaHpSSDM3MXJTMVpVdlFIZVNmdU1Y?=
 =?utf-8?B?bERCODNrcDdwdVZuUlFMcnlhMDlPL200cUVoSFNhTVp3amdFa1U5b2J6QjNY?=
 =?utf-8?B?M1p2b1NyYzVVb1gyQU1hRGNSeCs1QmVjRVl3T2ZzaExOQnIzYWoxQ29RZFNl?=
 =?utf-8?B?UjBCM0NhcDN4elpseWRSYm5lNHYyT0N5MkRhYVhGOTE2dHhBNVA0QXBxTE9D?=
 =?utf-8?B?bmI4QW9zUzMvY084U0p0UWJYRXhZMUFldVF1amRUUjJyUW1wQXNWRWhIWGFs?=
 =?utf-8?B?dE9rT0U2Ly9WTmE4N1FCeTZwT0VIdS9yYkJ6VXh3U1hsTXl3Vy93MDZiNVc0?=
 =?utf-8?B?UXFhT2phMDV0WVQ2REp5RS9wM0NpRkJBMDFFK25qYWpMQ0g5enF1aUZRSmJM?=
 =?utf-8?B?YXVuNHFSeG5xZis1alBUUyt4RVZ4ZC9tbVZNYldJTy91VkU0ZnJ2WldrZVZ5?=
 =?utf-8?B?Y2R3dU5mKy84S1Q0Slp5MERJU1pUVG90OXZlNC9oZVN4UmxBUm5Yci9XSHpT?=
 =?utf-8?B?TGFzNjNCRnk0aFlzMXl0NkoxNFpqRHk2TStRUm1ienEwWVp4SlB5QkEzZGh1?=
 =?utf-8?B?dW04TDE1WlUwT01jOE1mNThiTU9DazljRkI2WjRDRk9JcGs5L1NOdnQ2a2JF?=
 =?utf-8?B?VkRrNDFVdE0raTBWV2lrSm94OHJVSnVabWpOcFMvMXB2OVVUa0VaZHFEU0R5?=
 =?utf-8?B?VDBHYkdTRjZvWjFpNHN0eXNhQzR4eElKS3VPM3lOV1lwbnhlTzEzMmtWd0FB?=
 =?utf-8?B?c29ZZEdySGxVbHFqVUpLLzhKemNPZERPTlFvRkthSHlsaGtNNFBmZz09?=
X-Exchange-RoutingPolicyChecked: vr+1SrDlf8+ihrf1JF474k/Xk7cbePZJRscIlnY3G6sBUz3aDi7QIngXYbONCLbBcKfu/Yj0o56qVpKwJwyiXqet1nEE/BTG1A2L9wkMandF5CLCaJwUKPtQrq25K3gD1Lx5B0EvCXp5WqOpnaBEyLkojPhBDPoTnDjtFc+QE+BFJvHu5ggPLJqUIif7EanxNN1xQMAPIluGXEHyXPsnNzwwnctz06JgSsp21lzX7AcgOeazEzbgCyhcenXAmaz9bz5dXZEXoNvUeyc42OdQ1dA9fgNlC1ny2oomDsTn3w+I6NQW3lore58P+/Gf1CDVCkS3aYS24gZSMvLLhqPQsw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a86c87-edbd-49db-4dbf-08df41f96e76
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7846.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 02:46:06.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yxNGueSouDnFZpZCqXyEN+u6Vtn8ywTyLRJlSmaFcWly1kbsR1e/HFlAEAGiyPeYq/43H+hjY/9xHowBPH8/Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB704522
X-OriginatorOrg: intel.com

On 11/7/2026 11:13 AM, Hamdy Abou El Anein wrote:
> From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
> 
> Ucode equality ignores the revision, so adding entries to a set keeps
> the first revision seen for a CPU identity and platform mask. When
> multiple input files contain different revisions of the same microcode,
> the generated old-microcode thresholds depend on their order.
> 

This is by design. The current script assumes only a single release is
used for generating the output.

https://lore.kernel.org/all/5e3dc792-c5aa-4024-b2a3-32db49da8132@intel.com/

Do you have a need where multiple directories need to be combined?

Also, sometimes newer releases remove entries or roll them back (in
exceptional cases like microcode-20260812). So combining releases to get
the highest value isn't always desirable.


> For example, passing the 06-8f-08 blobs from microcode-20250512 before
> microcode-20250812 keeps 0x2b000639 and 0x2c0003f7 instead of the newer
> 0x2b000643 and 0x2c000401. Reversing the inputs selects the newer values.
> 

> Keep entries in a dictionary keyed by the same CPU identity and platform
> mask, and replace an entry when a higher revision is found. Preserve
> the existing output ordering and debug-revision rejection.
> 
