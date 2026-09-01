Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40B937C927;
	Tue,  1 Sep 2026 19:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788290786; cv=fail; b=JT2sixUlHo+ylMvkwGpsjxx541IntE86+Hp0vqdNohaGNJYRxy/u7Stc5fyHVVlJVI43hatnzVEtybrthkvbruV4Dsm5RJZ6xyiN+vSCy0BgcbiCHdOgOxC65i/mrsRcWNbifJ5vDHlPfRgG97DVhbtIyPsLyj4wN8PDkvFvz1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788290786; c=relaxed/simple;
	bh=I4P8zp5bhiuhAYfceM1BLMhU1CwBV/ENLwtFBFWrw9o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hLVc6PN/Co8bppkq2TL60hTzfB3Y1/F+UqBRAhkw1NoFmbfF4zTylWymhkQSYrpYg6Tm5BKQlub2Rd5ZvRJCUlMzlA0GM+0wl8AYEADcZ6MuNyWMPayxrsgHuWte0j9riWXtWNDqn2NgwNgKApcEXdErXiQxQx7YUVc/0b5QBdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iNO17xCC; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iNO17xCC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788290784; x=1819826784;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I4P8zp5bhiuhAYfceM1BLMhU1CwBV/ENLwtFBFWrw9o=;
  b=iNO17xCC1VzvLc7bJaWEmUcOCgv0PiFDQxOu0EIXrprmD7WDugKm26eR
   iXHPMM6LeiSDIciUojMtnIr/WF/OL0W+mQ7dY1xb8Z5zD7+tNWNikqZac
   /qAKH9lqyZdVUMDptD5ayLiyMPCwCy2a4oF7aGp4nip5778UQ73QpwwDv
   LLhnwWP9cjTKs0CKL/cJrrfiMJqOEn3DP/L/70Bf0/ji6+KMaivMN9sbY
   WaOLUHBao5rO7FDd6YhM8HULU7Ts4E1aJzAnI3USrbPcrBENLe7uh6Xls
   l8QIJdaze2pTP+9CYF1KPXscHRYyN2OeZYjZDGBu0pmiOY1OVV4Y/hHox
   g==;
X-CSE-ConnectionGUID: z1Z8ejvvSHWFp+GWavVa4Q==
X-CSE-MsgGUID: gsMhcCSiRHiinZ4/PyV77Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99070599"
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="99070599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:26:22 -0700
X-CSE-ConnectionGUID: 17whaIRdT/ibbqIfPpZjtA==
X-CSE-MsgGUID: 8mZpfFIoRqaE/WKA3ewCow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,256,1779174000"; 
   d="scan'208";a="272964376"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 12:26:22 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 12:26:21 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 1 Sep 2026 12:26:21 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.71) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 1 Sep 2026 12:26:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j6AT0rS1wypFYoF2GKD1NHYZmElpShopQPKhugyzLosaVA37jXrhymjAY0eqpELSfgp3fHAJp352IM9veyc9WetgZTy1mVkj+WOQT9RLbx9GbfoYTj8ViL0dAmu7eSqPms44zjW92mLgYeE+lJg1rOkf2YMQSVlBemlDqSgIEbzWWM48fcgZFmmO0wr/u7Zk0fiGP/BmKdUlna/uaZ0h3uMpNhbruwRRpZU/J//zkm6gVqnhp60cETmNgsPqaO/SF8v7F4nWJ9NAoQcmK91mFhWoTa7QIYqTwb/3IJWgO+Wb+LsAyDwL9xuWCVcbxa+dMbeoyDbNPBhiQcYltY8vHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKodbQ7StrukdSPI2dw4eO0J/8u87twWSQCg7fE/PQo=;
 b=I+TrUD2sg6L3+hK1+bJgh9N9BYSvbO661NA11SPNr6YU3WguuPhvPTOCTvGwayOkAh8ef3Pa45wVeU8VC9g7tSFrgRctGUAhCcvSyFoYX/tHPD6bzCQE33O/U3YsLsHW34nwcOgrWA8QK9B6QMpSmQwiFeYoJNBLZyzs+v9Aed20rUkwvDo7qJmFsmTGz0dNMHx7fsoRnwa0/gFM9YDVZde6tprLWD4FQXpsDeY0l7fPCRiDvWF5pOCwgOgUJF1yLypY1C46qRrQxRgvMOqVbmqmUgxTZ2Ks+R/qCCK3fqQfBr+Ncp3RLcI1XGsus7syQtdRRzVBMloQoXrfCZT5Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SA3PR11MB9461.namprd11.prod.outlook.com (2603:10b6:806:47f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 19:26:18 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 19:26:18 +0000
Message-ID: <d476ea5e-340b-4d65-8207-cc1a0055b4aa@intel.com>
Date: Tue, 1 Sep 2026 12:26:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>, "Borislav
 Petkov" <bp@alien8.de>
CC: "Luck, Tony" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
References: <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
 <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
 <1fe5cb09-aa2e-4b3d-9fbd-293d8e9f33d7@amd.com>
 <ad90a776-7be2-4d5d-88b4-280bc46b7387@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <ad90a776-7be2-4d5d-88b4-280bc46b7387@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0258.namprd03.prod.outlook.com
 (2603:10b6:303:b4::23) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SA3PR11MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3d0e7a-b8bf-41dd-1c49-08df085ee5cc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|4143699003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: VDn9/8Su4mlZGuodSOCH7tA/cahITXD//8ZMH+R+xLpZtnZlaDOjQeJlaXauB8afoJvgXGPzyOy6apC1f1BNirMWEeEwLKbmpyvw9C8s2YHn+bntxiiAw4YpJnfR3auOobgIu8eZuCu8ld+1xra2Lp6DNePdi+/FF4XuvsUf2jfwKC7If+qyBkEXXixE21dg0Z1tuXVcJMT5HwiRPnkdOxq3EwOyW4S1ofHiJbtFokqdrp/DYX1DsHBFDwdaIMX6U//w9pDmr4Sp7WGioUdf5g1pxW7GwJmCP7eKN0gAEHee3dQVk4E018KuTa3J1AYRrYVSLDQj/G1RM27t+ObyUkjeOwC8hydcv/qjlxVAg4Xtq+63IPwMSil/L8Utn5Ikyl8lpfgCl7tVDl7+coqy7xA0m8rd4ONHLo0eAUv8Guv6WfUqe4W91420tKtyYQFay3nlPZHxPEJ2Dd64MVbk6RqIK0yeRavuTA47/4gMrDUFzUY7Mil87I24rA6reYV+NBurDLNkXilGdnd1rVjWQY24xezMKkKUhrP3X8AZdM9LGtYJh+XXQJz0ue7+WQckhukT1KQ89c2Ii/durp1Mi4T9A1szKHU/O/hJnN0kPyQJg/uktjvZIkmLx2KkWkCHNESPuqW9Lzg1rx0l4fxj7w1NIb28vxAkQJp5Ibov+5Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UVUzV1hpZGphWTN5MkNLWTJ1cjRSeVJkM0RGaEVrcG5SOHZzS3NvbWYzUklF?=
 =?utf-8?B?Wldva3EwS1IzT25BZFp3eEV5UEYzc1V0V2JoZFJseFV1NFJreW54LzMzK0ts?=
 =?utf-8?B?NmRoMXBCOXc1bDBIYkJkMm42OUZ1MHIvTmZUc2pCcWdTNUJiVU9tK3NjMVBW?=
 =?utf-8?B?b01FcDBIVnBiSi9McVVWVDlzSHMvM2x3d0lwaUN5dEx5eFdlWE4xSVlFeGpU?=
 =?utf-8?B?ZWVKWVlKa0FTT0VmY3dPenVXTldQNFVKaWp2bGhzTzZxTENZMFN1T0dLMGpT?=
 =?utf-8?B?ZWtrZ1NaRkU0VDdUQ3hhVU9LZnc1NnZpWVhFUU95V1puSC9xWUxOeVBONEta?=
 =?utf-8?B?cjFoNU9zWWFDdEV2YVBWbkJyMFo3dEdUNnEwNFBUbmRwU282SDNZbmJ1LzBQ?=
 =?utf-8?B?U0t5M2thdGJNaUJ6SWt3UzhBM0RTRFhBenkxdG1LanJPVlpBLytIZTJLZGR2?=
 =?utf-8?B?UnF6VmNLWDc3cUlBVGtqVXRRZzlZcHR1WVI1eXBYVnY2UjJXTDgxeWN5U21Y?=
 =?utf-8?B?dzRNVWFQOVMyN3NvakZWekJPem1PaE9iT0IrMEczR3Z2NDA5TThDdFZMVXl5?=
 =?utf-8?B?aWUxdHZVd2hjQXd0ak9NVUFRT25yOTFTbVB1ckc2SkpYNTBnMzJjT3N5YjVn?=
 =?utf-8?B?RFJHZ1dBcUtVRmt3bUpkU0VYbmROSmJMUzhCejBBcFZLdzNLSUUwVjF3Rjla?=
 =?utf-8?B?TThkY1g5TWZQcDdFS3pXUjFicjBmNytJM0t1VmF5ajlkYTNocEoxVVBFQ2lP?=
 =?utf-8?B?THY0WXZVNklnbStERERBSEI2b2lFV29OSGJGYmt3cW5keFFzc3ArUjRkUHox?=
 =?utf-8?B?ZnRRekxTYnlHUkVEL0ZMZ3ZYSzBMSERPaEdjTXdNYnFyL2MzOEFiSTVHUklQ?=
 =?utf-8?B?eDg4dllZOG1yYTJKVW1TaEwzMGhiNDF6cWlqKzBMUkg1V0dFUHVPSjZPR2hG?=
 =?utf-8?B?OFU5elA1dEZmdWY5SFY4cEcrWnUvY1V4cGRUL253WU1DL2ZLVTVORjRNZTEy?=
 =?utf-8?B?N3JkWksraWh4TUdDYzFITWQ3M2lTNU5UUDlOTEQ2bjRuT244aDlsSkNkUFZL?=
 =?utf-8?B?SmpHNkh4SlJoczVYbWpnU1BTUVRsWjZqYzN2aFdWVGhjOGdzcGRCRGU1cTd0?=
 =?utf-8?B?emtmbUxzRXlqeEl5SlhOd2tnT1VwRUpIcnhkNE13VGM0YjRXbmVyeWJiNW13?=
 =?utf-8?B?MFN0b2pIOU1LVzhLdG5GaVpSTEpzNnJTOUdac3ZNUDd4UCtVaE44VDRDZkZV?=
 =?utf-8?B?K2orVG1nZjlwM2QxWGpkM1V3MWI0WCt1R1RxWUp5WU4vNXpncDI5YlpicmlK?=
 =?utf-8?B?UlF4K3R2a09rYzlDb3BtdGs1c3NIdjY0aFIwNG5KT3VWd1FkY2phVURRUVFv?=
 =?utf-8?B?cFA3Q2lqSFhOcERrS082MS9lSklVblJTMGZ5UFZEeWZrWUhTM05raUl3Mnpx?=
 =?utf-8?B?bkRidlBHVmNkalF5ZklQM2llNHQvV1EyM1p5ZXltM2hJUjJMZFVrbEd5a1hM?=
 =?utf-8?B?ZEc0UVUyaGNBK0puT3dRUkthTTFyc0xaNEp5YU5oWjlQL3FRM1NKOXc1T1ZG?=
 =?utf-8?B?MzBDYTNET0EyKzlEd1Erc1VPcEIrRXVPSmJRL2lQM1FNYm9NTVVXcWlybnhU?=
 =?utf-8?B?Z1NibDZYOVFUQmVhVngwRGQ0ZENsOHIyRU5lOHFMeWRuQjZWaEU0Mmt5RWY3?=
 =?utf-8?B?dDl2TmdFMkZhQkw3SEtpVFY4SmhsN1RKK2RCWU04a0V5U2lwMmJVT2g0T0g0?=
 =?utf-8?B?QjRsc0N1NmUrUDRTVThDdHZjSHZqSThDcnU0QW9XRnlsNEJsMzJBampCUTh5?=
 =?utf-8?B?eEhUc3pHZlBXdE96anVGelQwTS92blpsazFpb1FqeUxPaExwVkdCL2NRamdO?=
 =?utf-8?B?ZEpHRms0Rmt5ODcwazIxNnRKbHV6U0xIR3pQTWZzdG1tUzBJRnc5NStYdkFh?=
 =?utf-8?B?TjN0TFdyeFBaOWR4NS9ZUk9CWmFnR2RsbXRZTUtPUmRhNlRvWE1kVGxveWNL?=
 =?utf-8?B?Z2lkS28rMEdKaXE5akRVL0htVkhkZXRzTWZYRW95LzF5dndzY3Yxa2YxYjUw?=
 =?utf-8?B?QU5XUVNHNklWTzJPVk9jVU9EWXVlOVBYeXdaU2p5MjBqT0p4SWJQck0vRmFv?=
 =?utf-8?B?N0FlWTZNYzBZZkZocThGd0RKSGRSbktVSU82VlBQcnd3SitGc2M3bmRSQTdS?=
 =?utf-8?B?MzFmTzRvVUNLRGFieWlrOVNQNGMzOStEbTFoZ0ZyYURXYzhqbGptUnlmSVMx?=
 =?utf-8?B?eWhDQUt6dUVOOUw1cXFBbTR1TTg3WW9IRitINm5CODlIOUNoUENKQTFSRzRV?=
 =?utf-8?B?MlRMQytZbmJ6VUZCUXRNa2M5NjFsNEJ6dWE4Q1pBUWZSdWxYL2p0aytUK05M?=
 =?utf-8?Q?nQASvFYp+ZQAFUd0=3D?=
X-Exchange-RoutingPolicyChecked: 3z3Gw3N4QVZj7zxUyk1GSs8kfBD+Vm1vmPfzoDiM+8thKiHPK8kO1u4WfBihKWeVtCvaZzqJWInKOiR0aueCYk+Apz3ws2I7w+TyuGBNQjgpN0v4e3GRMvaM1btD8gxQtCGWHRcruNxhbGJGFPMNsBgmAfeHWbzWzYfGfeoHO2uhzalChwo39bvkumO1SoENm0G4GcW163EKNDZR14MJGk6uxMZLfOdUKA6HaD3o9/dpMseB1RUfTu/SwMTf7YT+p82Dc0wpRc4tLhIK4N4eeCL0ULcS/8tbCs9CCHyBfGmepex2o+lpcTbGJi3Rj6jMF8+P6KmaQmMuyR0baAT3Hg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d3d0e7a-b8bf-41dd-1c49-08df085ee5cc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 19:26:18.6585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ar3oNaUYQ+38kQ6XzHz8jdHOHRnt42E7cVLjdR0vqZsAxkExNoEOB3Rde3QuvsnDi/LvJ3B872lEcmGOh8vB+bwpTN5DVim3I/ilFkREQFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9461
X-OriginatorOrg: intel.com

Hi Babu,

On 8/31/26 3:59 PM, Babu Moger wrote:
> Hi Maintainers,
> 
> It's been a while since we last discussed this thread, and this item
> has been outstanding for some time. I'd like to revisit the
> conversation and understand the plan moving forward.
> 
> Please advice. More below.

From my side I provide a very high level summary of my view below as we await
guidance per [1]:

If this is the right thing to do then there should be no reason for the motivation
to omit the consequences, known limitations, and non-covered scenarios. These
should be highlighted upfront and weighed to justify why this direction makes
sense.

Beyond that, framing pqos as a first-class userspace solution in this motivation
is misleading, as pqos currently cannot fully accommodate the mode requested to
be made default by this patch.


Reinette

[1] https://lore.kernel.org/lkml/20260728170423.GAamjhF3W74TW4q9DG@fat_crate.local/
