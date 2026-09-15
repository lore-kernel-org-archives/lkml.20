Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C30647A86E
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465281; cv=fail; b=rpJsserKkRr/DYlp7/xA1bNZaPGMZbM/nHzTbcGS281PIkbZzKY5vkgFXhLImsn2j2ltIqbnmXsJNGY8KFd+sQPs43X/Q7p69nddcS1HjxlXYqHtT2uUTwJNn7JcqRcr9fTO0thT2B0v4iIIAYzqxXLrDK3qJGoV2HGH5Pr1tc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465281; c=relaxed/simple;
	bh=JmeenELQWfybUtL9AIq3qeNIrUryEEWAWoZNoOST2xM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oZMBBD7u2M/3pQQxwhT21739Nom9KCkzk1cTZm2VgpSlaid0MAyXUYWlOZgfgFfkcZpAiPJ1KKaP89R8+IxZ8secFbuljCgjRsW99J5ZZIFO6QCq57thE5KFyqpDpiJBISRAk5/+HJj7UbpmTKjh5woCf6lxb7g8n463rLjdgnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rl2Jh4aI; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rl2Jh4aI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789465279; x=1821001279;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JmeenELQWfybUtL9AIq3qeNIrUryEEWAWoZNoOST2xM=;
  b=Rl2Jh4aI3F6ywoCM4MMeqsvKI2kvhyaWO9vrxK89baJxy1MV4XFew/+M
   RmiVYnGf/kc/XhTsihogY6A9KzLVakfovZ047dcDW2uMNLXBoLTRm4ZT6
   fiKIC/HWWaFxmliRdLuVOX3PSoXl56vHbjT57Kqh117i6ofbLrAWAl0Vi
   yZAkv4Rng5BgSJYftXxpovP9B4Mtrj2YczcaN1TqNHxDlHpAnbW0WsBmc
   m+qYv4tisLxHMC3fXyEFHV+fCpa21kRTSeL8NRvXUTOyqT5oalPaaz01B
   MoPZtu3Uc05ZnRWBzGxzDYg0meKRGEwjAiNWYWJVKCbca8eDH1IKAgYrg
   w==;
X-CSE-ConnectionGUID: j/9vp9UnTE65efau4GxNVA==
X-CSE-MsgGUID: umpJwOLdTyCjjMMbD+XtYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89838269"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89838269"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:41:18 -0700
X-CSE-ConnectionGUID: 46QElm2dSzmfuHBC2UF6og==
X-CSE-MsgGUID: uXwSYSLVTIqoovlJgXdHew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1159858"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 02:41:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:41:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 02:41:17 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.13) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 02:41:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jGqDlTmAv6zERYwUnYhwrxZX+ueSOOZda1OeojnPRatPxlCUN2T6Smju+g6fNeOxJyxvzwxDz2gpDCjASdCsCHyrynQ7FrSqavUUHWcjMVj/vQGvoH5rhGLRjm/D2H0v6+wllG3u44BUrfn1AD86xj4PzxhunVTtX/0fATHRiF6WEQsuhpuwHr/Mo8eTJBsXgDAnhqoT730sNJJkNYiJ+PCJnEXgTPmoY5+B5TtWpl9IX76G6iwk6FkJV44xr7S7tvaB9Muq2T8L4gXwCtbZ1viDYHXwtIrBL67E/PTLpqqNK7h+wcRYftcHdOoDu822phqZmAfjyaWp2xeZY8Y0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89qRFYAZWg2T9f7KdMVivK1MwHJKFTt1ZX90ZWqp2kw=;
 b=gLHFLvHSIiCxV/8frCdqTmHA2Zv/moPJpZ48uuoCntwByFGishFsqCPjjzBlf1kyLJ6QoSuhmhq+bCYbpj+szU3iqNs6S/52RfF0zj3w6dioaTYoCsjeuEs22uNgwxuPMNxctHNhX4rE36J0NwEvYkIxEoknMz04rgGoDwCtl3pJf/jLsXuZPJJ9Jjb1+aIEqDgjhhcxLqmoAUDOPa0t4APwLH206OE7lh+M6bqjddxg2dEdJloJk92UVt4Aq0r/YnQt6Lx6Hr1v7QvdZf8U1by+j9HWjpRbWkrkipCgDY3gv/S4Ny1AnA2Rnx56MlIe1WnevOCqq1fO6lX9QLGbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 09:41:15 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 09:41:15 +0000
Message-ID: <7c1bbea2-810c-4375-9ffe-04817e9e2cd8@intel.com>
Date: Tue, 15 Sep 2026 12:41:10 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/17] i3c: mipi-i3c-hci: Support configurable device NACK
 retries
To: Frank Li <Frank.li@oss.nxp.com>
CC: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>,
	<billy_tsai@aspeedtech.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-16-adrian.hunter@intel.com>
 <aqg7Mhw8EpAoO5Fx@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <aqg7Mhw8EpAoO5Fx@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DB8PR06CA0046.eurprd06.prod.outlook.com
 (2603:10a6:10:120::20) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|SA2PR11MB4905:EE_
X-MS-Office365-Filtering-Correlation-Id: 9042e6ea-4188-4083-2f44-08df130d7c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|6133799003|18002099003|22082099003|4143699003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 1fLuA8yX+ip7kx9EwZISEbXMcaBAIhO7y1U7RWA/IBZVsOjnkO8JrmO7KfQKTRbxYErb6vCJP84MCo9s4DPiKjwuBRPIc8G5ogUM1z0gSX0CABsx+DyMEDNOxG1Q/C8P2qWVblzNkUuNcBjuwgWtiYhS7OI+qvQwt313SIPLoIr19f7mbykL4vMnRAOmu+gdnq4hodwdNbeSjis29OHh1TEXeAHWJeASHm/17xTn6Q9TjlPUPrMDexv7YiAFY8ILcD8diqNwpfl8xO7pOBO1/S2lAuPPZ/QuzawnCLr9STVK2Jv4raEBoRPeQ8nF0ivgIUUGd9mUKLAPSTrzCFHGMtGCt1aLB9wbpin9aC1gj36d1ZLZfQ0HIrRNwNDuBNInsuDUZWr/r6PIKRT3bgUjhN22eiMBe82Ae6F5KfyFrvDUEWCWFu9/DRU6wvRUtx9G2/cGz3zOVL54e+Ac1+Lx/5EqUTeP568ILE3UFb6JVkZ9cqtcnIizAXwjkyQLnPzlvMaSbRREYY8xncXkxpiCXrNwLfThpm0OpF+tXVZQ3dk9WeYqQsOVOW6WSjgC16IoIzVjOpTacqKZUt1yBcRjK8KKE8F5XhymH2WVYn5WlXC4Q7cJEsl5PvN+EyudDmgUlPtwe5y/aIkP+gAu6AxkGZaQothxyGJFodfWWbVF1I8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(18002099003)(22082099003)(4143699003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUF1WnRZbVBJMEVjZWFjdWJjR1d1blpSUEkzMkhYdFhaeEJuS3pTeEdZUGJ5?=
 =?utf-8?B?TS9BQnNhQnhqaHlEQldjTFp1dXAxZWI0YXUvRzdQUkhzN3Q4TUIrcFdaMmpF?=
 =?utf-8?B?S0VrTWJCTmV4S2RVcy9hb0VnVWw2bGpSQ1lpZFNFRTloTzVXSlkwSWRGTWwx?=
 =?utf-8?B?eCtVZVFuSGtKTE9EUVhYQnN3TUdjWFZWV0JmcGZjMWdSQ1l3Z1dVQUZpME9O?=
 =?utf-8?B?RDVDRU9adkpTZmo0dStVSkZjSUR5eGNjRzZoNmJTVUVKZ2t2dWZ5cUNobGN5?=
 =?utf-8?B?RGJ0aGk5dGN4cW1mNjRydkhLNXljQ3ZUZjl2MlBoYU0veVNaeUJJUHFubkVy?=
 =?utf-8?B?Q2RWZFZqTWRtYTdvT2ZaTmdZVEF5T0NNM1d2cSszNHNCYXNtU0lXT1pGNEto?=
 =?utf-8?B?VUtKbWlUS2o5Qkw4Qm9BQmV1TjJxblRNTHVWdkczM1puaTRiSFhya3ZOWEc3?=
 =?utf-8?B?MGZmUlMxTzNzV0dUYVFVU0ptZ3RVYmsrSFZvQk9CMzN5VjI4MHFpUzRwNkJi?=
 =?utf-8?B?Z3Iwa2crY1RnaEhvU3JNT3dyU3QwNjQ2QVBqemVaMldPcVF5d0xKWUFlS3ZB?=
 =?utf-8?B?akFhc2JieHFDNjFjSlNzcFJSOUxuM2NrOWVlYWZueUFXbWhiVXI3d3V1L2M3?=
 =?utf-8?B?ODExMWRmVmlDK0FsTmtlbGUzSmptN2cxUXc5Q0ZhTGdqcS9uamVaWWxLR0ZL?=
 =?utf-8?B?RjNZZFRtcEY2ck1FUzNPN0hGK1BGZHJaYTErZmVsUkVZM0hyU05Nc0NlUGs1?=
 =?utf-8?B?Tlk4ci9QZ3dtNW5jc1JUYnljNGl3emZJTFRVMUpSakFCQUZxelRNNGNtMERv?=
 =?utf-8?B?RjFBL3ZzQXdLN2h6L1R5V2pBcWdqNGhLTS9Ta0Z5WWtrT2xnbEhESGxYN2Y4?=
 =?utf-8?B?QnFyMVhRN2RMTFdFUlJueUxQd3J1RjlvU3oxbmFmQzBPbGtlYm80N2diWjlQ?=
 =?utf-8?B?TjNJNldPTThVK1NhN1hHYTZRL0RDU2hmRGs0b2xlaUI0My8rNlE2M2dYTExD?=
 =?utf-8?B?cktnaUw3UGhVNysrRUhjWWhTdmVRVkRFeFBGQkY3aEZUYUtnLy83OWE3RGxp?=
 =?utf-8?B?SjhEMCsvV3RmWW9DbFZJM1NYQUhWcjROZXhGV2N0SGxLVHNHeW1taFVUWUV0?=
 =?utf-8?B?QUZyTXA0VEVPckJvQVVCdmVKUVFYeTVBa2VtZ0N1UUduTVZtVkVGbXNDWDdw?=
 =?utf-8?B?eGIvamsrMjc2VmNHL0JMS1I2cEU4ZXp6SmRjSEdjbitqQ2xzNlpuMllMdCtS?=
 =?utf-8?B?enZXUG56aGU3OVdGaVdxSXM4U1BwTFlCQ2JtTWVZaS9odzZKZ0JPZFB1aE5D?=
 =?utf-8?B?UWY2Mll2V2JUcEtzRHpIZGN5ZnR0SFEwWjgyMk44enRuUFVRU2laeE9Xank0?=
 =?utf-8?B?VDRRUTlaYXBhNDA2eTg3dzVJb1BoMlRpR2M0anNZMDZVYXgrL2pheWU2djB2?=
 =?utf-8?B?U1JGdmxtN2U4ZnJvbGZIaEhVWmZLVFhkdHBuUDUzVm1PbWZyenJBNFpNUGdP?=
 =?utf-8?B?Wk9Ia2RhYld4QUtYclRWcEtCM2M3S0tEUnF6ZnJaWVpoNjVWQldPbkx6Qnh4?=
 =?utf-8?B?Uk5yTVpLUUdRTjI4OE9IZldFMnpjdWJtb1g5d1VFcjRyWXF4WDZiSmlyUWVI?=
 =?utf-8?B?Z2c1Z3ozSStjWk9ITVIzT2xFUUp4TmxNaVlQTEUxaFhKeHZqaklaNHpXdTNX?=
 =?utf-8?B?Tm5Tc1FRKzVBeWI5aXF0eHBRcGxxaGlrZklXSXZhZjFUZmtRMlBhb2lFMXU3?=
 =?utf-8?B?TlY2TllVYm9IVEhQZmpEcFQ5OXFnakd4YmVsbzBvYUROZVF6MUJ4S0dDTzg5?=
 =?utf-8?B?MW9TTFhENnhPa3RsUjcwQTFMakFuaFRpSVQ2YkZIZXZNQVcrNlF0SkxZRVIy?=
 =?utf-8?B?Z1lHOUROSG5FOWoxamxYcll0RW85QW1pUUNDVWUrNHhEMHRLYjFwSnFtcE9H?=
 =?utf-8?B?aFhkZUdyRjJjbHhtVCtZSkVPM3g1dytjV3JBaXlvbEdlclNZcFo1ZDdFenRX?=
 =?utf-8?B?M1dWcTA4VzZVSUt6SlJHeUFTOFFCRVlwdGJsT2drbTlNNlRpelQrYTNBVzgr?=
 =?utf-8?B?ajZEMmtBR0VDQWVNY2ZNWUJPcXdxZW9zL3ZJa0U5aGZQRkVEUkswMGt5RFdC?=
 =?utf-8?B?MlBlUXpmTllGbTE4eU1DVnp6UmtQaGxhTXdCemFCcHBISWYreDZ2T2RKVDFV?=
 =?utf-8?B?ZHpMaUVzM0hreVVLanF5Ukp2a0ZpSDhLaHFvVzA3RkNITjFkbzdEd282b2hX?=
 =?utf-8?B?eDRUWG12bWxUK2dvV05Od3ZQMVBmNGN5TWp5NjhlQkkyVkx0bmZaOVpydjlM?=
 =?utf-8?B?M2ZjemY2VzR4bTV6cmh3cFlrVW1lV1FsZk1yNWw4S21tekF2QnIrbDZOVDVy?=
 =?utf-8?Q?/5Sa9txWochykvJc=3D?=
X-Exchange-RoutingPolicyChecked: oDjnewxpJMdsrmhzmSGQ8veXswvR0ghWwPvNIXYOr0GAKEXrldOp4sFBlV3M40QdJXZzRPgJypMQhZzmVI1aLCg891MIe9ZI4rcRQ+35xprGzOJYY2S2Cw/eEwlVmuchWWAXaUvjz+oBqCla0zJVn+KDRW3Ap5+OPux3aVT175n1MCdpz8l1vmAwoMgvvJeCFKQ0nwupSD10IMRqIns9GpVNilhHF3JPt6XaIob7AbqW2cK7WeXUxG0R168Qcsbn8T2mY6sIPCzbRspEIdZgZBkd1vhba7f+Iak5SPJU0vymHqKDA8vZ7a8JDb8R1rFnvLiSXIEnfAtuGWDbwv3IAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9042e6ea-4188-4083-2f44-08df130d7c0e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 09:41:14.9726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 04Lonzri4poLTSwqe3Utb5GPGIrAB/MfehKJxq5mz7AtAoDWhQVuYcjYfuveclPPbxT8nJ+WNb7h8ra50mY3qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4905
X-OriginatorOrg: intel.com

On 14/09/2026 21:21, Frank Li wrote:
> On Mon, Sep 14, 2026 at 02:30:01PM +0300, Adrian Hunter wrote:
>> Implement the .set_dev_nack_retry() master operation using the
>> DAT_0_DEV_NACK_RETRY_CNT field in Device Address Table entries.
>>
>> Since the retry count is programmed per DAT entry, update all allocated
>> entries when the setting changes and initialize newly allocated entries
>> with the current value so that a consistent retry policy is applied
>> across all devices.
>>
>> Add DAT helper operations to update individual entries and all allocated
>> entries.  Return -ERANGE if the requested retry count exceeds the
>> hardware field width and -EOPNOTSUPP when the active command descriptor
>> model does not use DAT entries.
>>
>> In addition, default the retry count to 1.  The I3C specification
>> mandates a retry when a Target NACKs its Dynamic Address.  HCI v1.1
>> explicitly preserves that behaviour for Direct CCCs even when
>> DEV_NACK_RETRY_CNT is programmed to 0, but HCI v1.0 defines the field
>> only as a device-specific retry count and does not provide the same
>> exception.  As a result, a v1.0 controller left at the reset value of 0
>> may perform no retry whereas a v1.1 controller will retry once.
>> Promoting 0 to 1 at probe time makes the behaviour consistent across
>> controller versions.  Userspace can still select 0 retries explicitly
>> via dev_nack_retry_count.
>>
>> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
>> ---
>>  drivers/i3c/master/mipi-i3c-hci/core.c   | 25 ++++++++++++++++++++++++
>>  drivers/i3c/master/mipi-i3c-hci/dat.h    |  2 ++
>>  drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 25 ++++++++++++++++++++++++
>>  3 files changed, 52 insertions(+)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index 7a39be64c4e1..57d84d7682d7 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -555,6 +555,11 @@ static int i3c_hci_i2c_xfers(struct i2c_dev_desc *dev,
>>  	return ret;
>>  }
>>
>> +static void i3c_hci_dat_v1_set_curr_nack_retry(struct i3c_hci *hci, unsigned int dat_idx)
>> +{
>> +	mipi_i3c_hci_dat_v1.set_nack_retry(hci, dat_idx, hci->master.dev_nack_retry_count);
>> +}
>> +
>>  static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
>>  {
>>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>> @@ -573,6 +578,7 @@ static int i3c_hci_attach_i3c_dev(struct i3c_dev_desc *dev)
>>  		}
>>  		mipi_i3c_hci_dat_v1.set_dynamic_addr(hci, ret,
>>  						     dev->info.dyn_addr ?: dev->info.static_addr);
>> +		i3c_hci_dat_v1_set_curr_nack_retry(hci, ret);
>>  		dev_data->dat_idx = ret;
>>  	}
>>  	i3c_dev_set_master_data(dev, dev_data);
>> @@ -622,6 +628,7 @@ static int i3c_hci_attach_i2c_dev(struct i2c_dev_desc *dev)
>>  	}
>>  	mipi_i3c_hci_dat_v1.set_static_addr(hci, ret, dev->addr);
>>  	mipi_i3c_hci_dat_v1.set_flags(hci, ret, DAT_0_I2C_DEVICE, 0);
>> +	i3c_hci_dat_v1_set_curr_nack_retry(hci, ret);
>>  	dev_data->dat_idx = ret;
>>  	i2c_dev_set_master_data(dev, dev_data);
>>  	return 0;
>> @@ -733,6 +740,16 @@ static void i3c_hci_recycle_ibi_slot(struct i3c_dev_desc *dev,
>>  	hci->io->recycle_ibi_slot(hci, dev, slot);
>>  }
>>
>> +static int i3c_hci_set_dev_nack_retry(struct i3c_master_controller *m, unsigned int cnt)
>> +{
>> +	struct i3c_hci *hci = to_i3c_hci(m);
>> +
>> +	if (hci->cmd != &mipi_i3c_hci_cmd_v1)
>> +		return -EOPNOTSUPP;
>> +
>> +	return mipi_i3c_hci_dat_v1.set_all_nack_retry(hci, cnt);
>> +}
>> +
>>  static const struct i3c_master_controller_ops i3c_hci_ops = {
>>  	.bus_init		= i3c_hci_bus_init,
>>  	.bus_cleanup		= i3c_hci_bus_cleanup,
>> @@ -752,6 +769,7 @@ static const struct i3c_master_controller_ops i3c_hci_ops = {
>>  	.recycle_ibi_slot	= i3c_hci_recycle_ibi_slot,
>>  	.enable_hotjoin		= i3c_hci_enable_hotjoin,
>>  	.disable_hotjoin	= i3c_hci_disable_hotjoin,
>> +	.set_dev_nack_retry	= i3c_hci_set_dev_nack_retry,
>>  };
>>
>>  static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>> @@ -1186,6 +1204,13 @@ static int i3c_hci_probe(struct platform_device *pdev)
>>  	if (device_can_wakeup(i3c_hci_sysdev(&pdev->dev)))
>>  		hci->master.ibi_wakeup = true;
>>
>> +	/*
>> +	 * HCI v1.1 onward does 1 retry for Direct CCCs anyway, so for v1.0 to
>> +	 * be consistent, promote 0 to 1.
>> +	 */
>> +	if (!hci->master.dev_nack_retry_count)
>> +		hci->master.dev_nack_retry_count = 1;
>> +
>>  	return i3c_master_register(&hci->master, &pdev->dev, &i3c_hci_ops, false);
>>  }
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat.h b/drivers/i3c/master/mipi-i3c-hci/dat.h
>> index 6881f19da77f..a07086bf717a 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dat.h
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dat.h
>> @@ -25,6 +25,8 @@ struct hci_dat_ops {
>>  	void (*clear_flags)(struct i3c_hci *hci, unsigned int dat_idx, u32 w0, u32 w1);
>>  	int (*get_index)(struct i3c_hci *hci, u8 address);
>>  	void (*restore)(struct i3c_hci *hci);
>> +	void (*set_nack_retry)(struct i3c_hci *hci, unsigned int dat_idx, unsigned int cnt);
>> +	int (*set_all_nack_retry)(struct i3c_hci *hci, unsigned int cnt);
>>  };
>>
>>  extern const struct hci_dat_ops mipi_i3c_hci_dat_v1;
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
>> index 852966aa20d9..cb9aa43e69fb 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
>> @@ -189,6 +189,29 @@ static void hci_dat_v1_restore(struct i3c_hci *hci)
>>  	}
>>  }
>>
>> +static void hci_dat_v1_set_nack_retry(struct i3c_hci *hci, unsigned int dat_idx, unsigned int cnt)
>> +{
>> +	u32 dat_w0;
>> +
>> +	dat_w0 = dat_w0_read(dat_idx);
>> +	dat_w0 &= ~DAT_0_DEV_NACK_RETRY_CNT;
>> +	dat_w0 |= FIELD_PREP(DAT_0_DEV_NACK_RETRY_CNT, cnt);
>> +	dat_w0_write(dat_idx, dat_w0);
>> +}
>> +
>> +static int hci_dat_v1_set_all_nack_retry(struct i3c_hci *hci, unsigned int cnt)
>> +{
> 
> do you have other implement for set_all_nack_retry()?

If you mean the naming "dat_v1", that is just a common name for the
DAT implementation, presumably assuming there might be a dat_v2 one
day.

If you mean adding the function to struct hci_dat_ops, that is just
for consistency with how all other DAT functions are accessed.

> 
> Frank
>> +	unsigned int dat_idx;
>> +
>> +	if (cnt > FIELD_MAX(DAT_0_DEV_NACK_RETRY_CNT))
>> +		return -ERANGE;
>> +
>> +	for_each_set_bit(dat_idx, hci->DAT_data, hci->DAT_entries)
>> +		hci_dat_v1_set_nack_retry(hci, dat_idx, cnt);
>> +
>> +	return 0;
>> +}
>> +
>>  const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>>  	.init			= hci_dat_v1_init,
>>  	.alloc_entry		= hci_dat_v1_alloc_entry,
>> @@ -199,4 +222,6 @@ const struct hci_dat_ops mipi_i3c_hci_dat_v1 = {
>>  	.clear_flags		= hci_dat_v1_clear_flags,
>>  	.get_index		= hci_dat_v1_get_index,
>>  	.restore		= hci_dat_v1_restore,
>> +	.set_nack_retry		= hci_dat_v1_set_nack_retry,
>> +	.set_all_nack_retry	= hci_dat_v1_set_all_nack_retry,
>>  };
>> --
>> 2.53.0
>>

