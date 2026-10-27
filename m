Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793117849;
	b=zWDuZtlIZ7RLjHHhvMEE6XyMWrusTa3KqISjOqIfV6s3h7kkvUsg53j6e33Ou69p5VaX
	 c6oTQr9Dij7R2BVKix9SVpZ51QDeiCiceYgw0STNG1sKKBKn8d9rwcv3tEtarqQxEfEtP
	 F97pMO/Wij4D+5H9nhbN2f5VwK00VimGBOzUkxXSUG6Y4QsK/ylPhBZNa+f7llB8QLcR/
	 kwvx1jpCebe1nw/rfA5PGnfdsElXm3w+kUtL7e8zYBKq2zSh8s6icXNsAq7nJX++n5mkc
	 SN6My+zHHFqLA05R46WD7vvCWsv4XWvqmSYah14bHond3COuoonGRPhghDRCJe1kP0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117849;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
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
	bh=dZkSg8IhiM5lMgK6jn3ZaeXoh3o1TqQgIAlMXXJ8vx8=;
	b=jtipUVpqF//9mZAaaUF1DA1N6I7tKusQidmy2B+iACFLU2M+Xni+qcnsKYyP0hNGO0cW
	 BArBxVaIBVIuZQ1S7vbWDABEINq5HG4PBWi9b/nSK2wGfsh65t5sYaYoZYiJhvN0niwUi
	 Zq9A5YbTR7BQlQSxZ14M6ZprBmR9iAwPER4VD6e0Ezp9YgYpcEhTARMeqX/3D8ZFL+2eQ
	 QgyiX16rTkf7/O6QevQZb3WM1YP+WM8K1ybBQl3iwZwNL7qbLB2moXQssTH7T7TWa8yrl
	 gjvdGrcw3v2Kxe37pP4uY2GgdZWjZEA83cHNdPpq3LgoZByFX56vgejP85CdPSZY7Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ebIBOJd5;
	arc=fail smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F83606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62F83606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ebIBOJd5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793117849; x=1824653849;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Sk/MjizxCPlnAg5PN3g8kmMJp6odbkfosrlrqg017j8=;
  b=ebIBOJd5Sa9B/T/2F6sDd/Lf5D0dlz4wp7Kl2vnRHJjsV/426tCjOi1E
   p7rkh2edpJlE0JJ4Ah4X8yfUVvyksXJHQZRQCA/D+szAhPXj0Tp1Tc6VM
   HFd/K1w4/NkgO/KasFNFDYtIoNTZsFlRcswpaes1nFqTomur6dIsri5FN
   cKefF+OKBfsfKrwSOT9oRyeTw1Rdcb+sI522m7q5ZCJZo32KcKCelF/TB
   uxdDcb44GK8FKvsBLd5s51MqTxSIl7Zq+wswBzi4i9Z8713YCYaErtc5I
   kqXdDGofIQZjbMTVGd2D98G5YS9BKbJVNIk19d8E5qDxeXEQvLBpvhhfS
   Q==;
X-CSE-ConnectionGUID: 1lsg6ksoQJ6ZNTNh58YtaQ==
X-CSE-MsgGUID: xvuEg/boSGSrv84iymdkRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1853743"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1853743"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:17:27 -0700
X-CSE-ConnectionGUID: m4tcIza3TeCNFP7JOqVcwQ==
X-CSE-MsgGUID: P4JfiwnbQ0Wijnx9qCgQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4621794"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 09:17:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 09:17:24 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 27 Oct 2026 09:17:23 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.17) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 27 Oct 2026 09:17:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WpRdR83azvzEVEPdgkG2sAnkUiUFuZrzMon7rw9wOmJ29pjoYoZas1gaDikYvlLohk5jAWmG7Hx5TVgJPW1TvuMYUqf82+R9wCzAlerJroOEzsY3LE3BAuOoGb20i+x56+t0KaBCAV8cX5CdZykwCZIKhlV9gO+366A+HzD9QhlmaIT5M+ye4eWAt8ifyKOPmv4ltUntTLHG84ifrf/ci+pFa0qaSc5YiHkbFj1eDGUXm308rtvGw44fvMf72b3rsC1T1vb/Bp6QFDX+P4tXvCxsgEUj8pWHBu1kbWPJFxs2Cf63Z2d2jdXoC09J43vKSJyydCINF8GNq3j5EXdRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZkSg8IhiM5lMgK6jn3ZaeXoh3o1TqQgIAlMXXJ8vx8=;
 b=p+t1tBbIQihWGFSxAwD5tmqvqJRTDdsRCbVM4Yrgc3CHM4Q6BJ08bZOLUdALbn/W2wFSVlQzmRGFb42gfsdG/jEQGz1o+iriA4ky66eLX5DBnFi0UYDzzRzmm9zKTUL63XPvNROZUsMHltd11Bf2GGQhC94xnxsET9EH8Oo4dTMfFfpUtJDjAlg+X1j2PZ82STYEr3xQlKxLe160oIQOE8rdizmznEzu+Llve/Rcu4LThWQ1xySvbaOy2KD0p+q5kFjTyDtaUfS2uaOZa7ew2yihr8/qVPF2k7vuwyICQkIeOuNmPU8TX4/S7cnCYtgYKoURcNBMjAg17DZw3Vy5Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SN7PR11MB6876.namprd11.prod.outlook.com (2603:10b6:806:2a7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.20; Tue, 27 Oct
 2026 16:17:21 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Tue, 27 Oct 2026
 16:17:20 +0000
Message-ID: <f5cd13e8-532e-4c4f-ae6a-152d5001cbd7@intel.com>
Date: Tue, 27 Oct 2026 09:17:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/12] x86/resctrl: Attach ACPI ERDT information to L3
 mon domain on CPU online
To: Chen Yu <yu.c.chen@intel.com>
CC: <tony.luck@intel.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<fenghuay@nvidia.com>, <babu.moger@amd.com>, <hongyu.ning@intel.com>,
	<chen.yu@linux.dev>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	"Hongyu Ning" <hongyu.ning@linux.intel.com>
References: <cover.1791933001.git.yu.c.chen@intel.com>
 <2d3327d86480b1a41bf1a7c935317f14884a83f9.1791933001.git.yu.c.chen@intel.com>
 <2317c664-0c9b-4dad-b135-a771959be024@intel.com>
 <auB-vz3-QCXxfGU4@chenyu-dev>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <auB-vz3-QCXxfGU4@chenyu-dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0268.namprd04.prod.outlook.com
 (2603:10b6:303:88::33) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SN7PR11MB6876:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cff59ba-e7d9-4740-7d97-08df3445c71b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|10067099003|261026140227099003|4143699003|11063799006|5023799004|56012099006|261021121427099003|261022075727099003|261022105027099003|261009223027099003|6133799003|261026121527099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: gHYoFkSmxvay8JeozOMn51o6SakrXoY8CPsZxBURo6seMu4LIWCggTyLPJV6iRvVfOn6eQtW9YCN7oisCEQLb+jmOFEF3aDQSKo1klZ0zXTqEW1j0BuIA8gy9HUX8Imy5OQ43Rh1b3FW97277U7Hclwiv4zQragYIrEphZjrKrKdIKxASV/8xnjD2TQPLwGZG41btEHszjEHS97uywpsgds00LbV9HWAhy3g2XRe6Y0M3Q6vfEUReIIV8uZHgSwe4koCcjVvju4VdnktZlgl0ROyX0RyEzPtjbWrLMX288TyeECPcaID8x1fX0/OorC6XCdemoZmAqUDnS7lPc/FgW9ZzAzBvaUq0cMWKYYe9m0sqKpau+7p+Zq7f4V8nPlDkHWalLkUidZNtYYpXIJVVN2uiueC+HmEze3gaUJMbbiPId28vr3HFoaZqEgnrzNJieJdriIHdvO1rFHOJ0cw/XGu908FOVASYl9vtKw9PuZMRZYHoJ46so1eDnXumAeXh3tsmYvu6lN90Ijzl6TPSjLvnh7K87aqgSjsnV1Wg4bHIfqGmd+chX7RrMTKHVxsD5ESHcYSMLAngK063145bjUVRrv4kGjzC8Dfsf6MuIayVkgaylAq6Yw3sG6taud2unLFp9AEAP6/GsOkxiPwEVyujnkTpREi19cxsBGiTeg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(10067099003)(261026140227099003)(4143699003)(11063799006)(5023799004)(56012099006)(261021121427099003)(261022075727099003)(261022105027099003)(261009223027099003)(6133799003)(261026121527099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjIwa0Ftd0F4ZXN5dnIxSG9la05YQVhIcExjZHBzSUVuSWZXWFNaaUsxRjZ1?=
 =?utf-8?B?QTdxamFoQ3FsL0l3YmZpR1hwSlFnTGpuMHc4ZEp0bWtFRERHYjFQSmpyY05j?=
 =?utf-8?B?bWMxZUlZRjRnZUVGRHFVVk5xUEcvR1JGWHhJWjNDdlRRTzFoOUZEVS9Xc0pP?=
 =?utf-8?B?dmlJNWZNV1BYS01WSmhVYkhUTHNMeGFMRVlRT29HNnFneElaZHdQVTk2WHdH?=
 =?utf-8?B?KytPSGRORy8vZ25lTUs0WWZQVHJ4K3BEVkhsdlp1aGZzTHFHeG5ublU0M0RR?=
 =?utf-8?B?RXdPM1M5KzM2dnA2SnYzWi9sQWJuZ3JiaGFENWlnUW1YZmdoZFBnL0l5VWNG?=
 =?utf-8?B?Uk9sZUErWUtReTNhdjI3WUZxSEtRd0JiS3VFTVR5enVZcnBmcnFMOTdVU3Rq?=
 =?utf-8?B?cHl0akJhdWdsVmoxT1Erd0tZOWtpeE45YlRVdVlVaGpad0QwV2l3dzdBQ29l?=
 =?utf-8?B?Nnp1amZVR1UwVXpFdDhHZ1VYaitoKzEzUXZYZ0l6Qi9Md21SUitId3dHK2sx?=
 =?utf-8?B?ajJvSCtQK0orWi9QNHVXQjVLSVNzQ1FkYjBETVBYTGN1RXJyVnpKdzFlQ1JR?=
 =?utf-8?B?cWNWcWdkMndJa25ML0NKVDdRWWdBbVhpc201ZzR4cUdPM01FeHk3dnZLL0tC?=
 =?utf-8?B?REg0Y3FBV1ZlK2lMM0VKNnNhTEFYMlJnL2FBR0Y0VmNyTy9XaktLTG9xUG9M?=
 =?utf-8?B?UFRrUGd2RlZ3clYvajZhb3lzN3RBRzkzSDBPczVNZEhnT1kvLyszQXhBTHFm?=
 =?utf-8?B?NTBOVmw2cXpqb0Q1UGs2WURzSzJHWkEzcEZDVWV5Y2pTR25mTzlYY0UreVNh?=
 =?utf-8?B?MGg1SklQVVE5QWhIOXJSbkNaQy9FbDdPdlhnMXNyQnNwQWo0VHVMSlAyUWtP?=
 =?utf-8?B?L1hSSEV1UlhsUzVacDJyYWZNcERISzlwdmJHcldoQmZ1T3Z2a2tqbzdvUUZT?=
 =?utf-8?B?bDJTWEczSzdNNVZWU0oxbVJmK3ExTW9JVGMvL1lUZE1WWUZIU05yQUU3d3lq?=
 =?utf-8?B?a3BQU29aa0pRR3V1ZGhLMFlZcjc1Mkw3Vi9qSXNlVklzcWx4RHQvTmY4TjJU?=
 =?utf-8?B?NWVVQXdwRXFSYWxPWXV0a3hnL0h2RGYxTjVwVStpYzlnTnRTcmdxbFNwN1dk?=
 =?utf-8?B?Ym1ZSit3OHVGd2dObERYSGVBVGxoWG5mVE4xUStQQnkvenExR3ppMXFZU3Va?=
 =?utf-8?B?V3B3aTdNL2prRFIxL05zb0cxQUhVdzBBSzdNR21zeGJ5cFdlak5veitaSzRk?=
 =?utf-8?B?dk9JbHBKVDhtYS84Q0lSRnRlQUZOWEhPNUo2SHQ1bnVRL2pibmIyWXNZc1VT?=
 =?utf-8?B?Lzd2ZWdoVU9NNmFHRXh0dkUra3F4ZGRZdUwzOSs5NlpsbHU5Y0E5S0x1OEF3?=
 =?utf-8?B?Z2lBZnBraXZMVHZ1LytuSDNoeUtabWdxUHNFU1Rma3NHNUltVjRPckVBb1Yy?=
 =?utf-8?B?MWhzcW1iY1pUNUNEWlpkeTYrK1J2WGlaS29zb2djREhNOEl3YXkzMWtYUUJJ?=
 =?utf-8?B?MW5SYnJCZ2dSeDVYZ3JRZE9sVU1YeHZEZkFBQy9jT3RxbmN0MUhVTzdQMkhQ?=
 =?utf-8?B?ckZoMDB0RytOeWtrTlNzeWdDOXFzYUFZYmtDWHRkZENlSjlKbUV4cm9LNW9L?=
 =?utf-8?B?UkNva1E1YXlYU3hvMktNOW5JTUJ5d1pVZFlNck5pK1JOWVA1M29KdWYzaXNi?=
 =?utf-8?B?YkdrdkFJZ2hYdFd5WUczNGVVS1RLNUdYTEtuR3cvckVKVFdSQ3NRK1AzU2Zn?=
 =?utf-8?B?NWNYeUY3SjZBUEVIdTFhR25jTENLSmI2YXRoYmx5Z1BqL3RwMWRZT1hEWG91?=
 =?utf-8?B?WGUrakU2UDRBZHl4Y2JJdjZ1N0RWTnBoeDlaKzBjSGhXR3dKdXIwTHZpK2M3?=
 =?utf-8?B?WlZRZDRCZ1RzSFI5ZFJlVnRNRjJHS3NsZzMvQjNBSkxrbnRIa2lBUU9NNURk?=
 =?utf-8?B?TC80eEJvcWcwekwxVjg2Z1lrcXJ4bGlkc24xNHBSL3VTMGpkaXRBM2Y3anJi?=
 =?utf-8?B?WERIbjF0SVVjek9nTUFUMzMxc3RLTVRPYWtCaFNVSTJja3gxN2FoWjdmRVF3?=
 =?utf-8?B?VVpQSGJ0dVprN1RuWFJUQlVLWUlVZklnZG00WlZndWhsWkpHYkJCbjR2RlVx?=
 =?utf-8?B?N2FnOTBXT1lDbkJVRnJ3QkdEa1QrY0Y5OHU3dFU3YmxTMm5YaWo4aksxbHpO?=
 =?utf-8?B?S01OVGE3ZHQ4OFJlWEZSYkxvNnZCaTNzZkt3aHdpRHQzVHl4YUdCMThpREZx?=
 =?utf-8?B?MFNKeWFyeVAwZk9EUTIvcm5WREVnWXF2aXhub0YvTmxRUVh1akd0NFVJRzR0?=
 =?utf-8?B?NVIxVlR4RWpKampkK3dYKzl6QTdpVFBRMzg4eG1zV1hqOUlyT0VuU0xIQ2tJ?=
 =?utf-8?Q?7XuxnxmColG5zFEY=3D?=
X-Exchange-RoutingPolicyChecked: ADhIr165vl0C7+briEBDwkYQkLd7U3332OCmy6Wh4427jzoif9uD6hB5K3w8dHTczj1OyncthQxEUMiQwcn9IixolrcsWDtPCo4A94qQD4sqJxOKshFDxJwC99NFeKP1YUfaLJv9pVn/YgK5g2JIu600iHlnW/+I3Ahp0hW5NExQaEFegJc8YQfxbXHYzR71L7N4RJLI6H5V44JSFGWhbZkAlwBQLEV08fVbO3j2D2NxyIM1SgZAuttGU3D4V80a56J/XJDnhKDZdSo6/u275dX3zxFjDnuBfToaVqQvTdBJ5xgexDaXZ4lCv1MGkFAwzsGt+Z0RkPjYhqHjZQaofw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cff59ba-e7d9-4740-7d97-08df3445c71b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 16:17:20.9106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NSw6Yza1iF8pPO62aEw8vvGuk6eDKcDLyOxM+vrelvh3Ww2079ljNTHDRAfWOZ3OP2S54WcoqHZ/RADdUQZ6oRG/+soW0IjVkZt+jfIu26E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6876
X-OriginatorOrg: intel.com

Hi Chenyu,

On 10/27/26 3:36 AM, Chen Yu wrote:
> On Fri, Oct 23, 2026 at 04:57:54PM -0700, Reinette Chatre wrote:
>> On 10/13/26 7:58 PM, Chen Yu wrote:
...

>>> ERDT and CPUID enumerate CPU-to-L3-domain membership independently: CPUID leaf 4
>>> describes the L3 cache topology, while the firmware CACD sub-table lists the
>>> CPUs of each ERDT domain. Both views must agree on a CPU's L3 domain for that
>>> CPU to be monitored safely.
>>>
>>> When a CPU comes online, validate that firmware and CPUID agree on its L3 domain
>>> and bind the CPU to its ERDT domain before adding it to any resctrl domain.
>>
>> "bind the CPU to its ERDT domain" is this not what patch #3 did?
>>
> 
> Yes, this is done in patch #3. Here it actually assigns the L3 ID to the
> ERDT domain.
> 
>> "adding it" - what does "it" refer to? the ERDT domain or the CPU?
>>
> 
> "It" here refers to the CPU, but it is a bit confusing, I'll revise it to:
> When a CPU comes online, check that its ERDT domain and its CPUID L3 cache
> agree, and bind the ERDT domain to the CPU's L3 cache ID.

Looks good, thank you.

> 
>>> Fail the CPU online operation on a mismatch for now. Leaving the CPU
>>> online but outside all resctrl domains is doable, but it would require a
>>> change to cpus_ctrl_write() to reject CPUs that are online but not tracked by
>>> any resctrl group. The current approach is stricter, but simpler.
>>
>> I do not believe failing the CPU online operation is actually possible.
>>
>> resctrl_arch_late_init() is a late initcall and all boot CPUs are already online,
>> so the failure during this time will result in resctrl not being initialized at
>> all without impacting online CPUs. A CPU onlined after that will fail to
>> initialize, but that will make the CPU unusable for *everything*, not just 
>> unmonitored. This sounds extreme for an ERDT table issue that should never happen.
>>
>> A CPU that is online is still able to run tasks and the earlier enumeration 
>> ensured that MSR_IA32_PQR_ASSOC is accessible and what the valid values for it
>> are. Even this "failure" path demonstrates this by calling clear_closid_rmid()
>> that writes to MSR_IA32_PQR_ASSOC *after* the supposed failure.
>>
>> resctrl's current behavior when a CPU cannot be onlined, for example when
>> domain creation fails, is to *not* prevent CPU from onlining. If a domain
>> cannot be created then the CPU is still added to the default group's
>> CPU mask (resctrl_online_cpu()) to ensure that tasks can continue to
>> be scheduled on it by writing to MSR_IA32_PQR_ASSOC with values known to
>> be valid.
>>
>> Such a CPU is *not* added to a domain's CPU mask so resctrl will not
>> attempt to make any configuration changes to it or read any counters from it.
>>
> 
> Thanks for the detailed explanation, got it. I'll change it to:
> On a mismatch the CPU stays online and is not added to any monitor domain,
> but still goes through clear_closid_rmid() and resctrl_online_cpu(),
> so it joins the default group. How about the following:
> 
>         mutex_lock(&domain_list_lock);
>         /* Keep a CPU out of all domains if its ERDT and CPUID L3 domains conflict. */
>         if (!erdt_try_bind_domain(cpu))
>                 goto unlock;
> 
>         for_each_capable_rdt_resource(r)
>                 domain_add_cpu(cpu, r);
> unlock:
>         mutex_unlock(&domain_list_lock);
> 
>         clear_closid_rmid(cpu);
>         resctrl_online_cpu(cpu);
> 
>         return 0;
> 

Looks good, thank you.

> And you also mentioned that even if CPU1 is not eligible to be added to
> the monitor domain's cpumask, since the event can be read from any CPU,
> CPU1 can still read the domain's monitor data via (mmio_base, RMID) without
> involving any CPU, although the data read from this address is questionable
> because the ERDT is already broken.
> 

ack.

>>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>>> index 0ea888807bd0..9a59643f366c 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>>> @@ -33,6 +33,8 @@
>>>   * The rdt_resource's domain list is updated when this happens. Readers of
>>>   * the domain list must either take cpus_read_lock(), or rely on an RCU
>>>   * read-side critical section, to avoid observing concurrent modification.
>>> + * This mutex also protects the ERDT domain_info_list, which is modified when a
>>> + * CPU comes online.
>>
>> This places unrelated text in the middle of the description about how reads and writes to
>> existing domain list is managed. Please consider entire paragraph and ensure that the end
>> result is coherent.
>>
> 
> How about adding a separate paragraph after the domain list description. It also
> states more precisely what is protected: the binding:
> cpu_dom->dom_id = dom_id, not the list itself, because domain_info_list is only
> modified during init.
> 
>  * All writers take this mutex.
>  *
>  * This mutex also serializes binding an ERDT domain to an L3 cache ID
>  * (erdt_domain_info::dom_id) when a CPU comes online.
> 

Looks good, thank you.

> 
> On second thought, would this race condition really happen? erdt_try_bind_domain()
> is the function that changes erdt_domain_info::dom_id, and it is invoked by
> resctrl_arch_online_cpu(). CPU onlining is performed one at a time, not in parallel,
> so it is unlikely that two CPUs invoke erdt_try_bind_domain() at the same time. Although
> in the future, it is possible that onlining could be changed to run in parallel.

This assumes the current usage. If any future change needs to access erdt_domain_info::dom_id
then this makes it clear that such access requires domain_list_lock to not race with the
online handler that modifies it.

...

>>> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
>>> index d94c54617fa1..d4b630358d6d 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c

...

>>> + * ERDT domain containing @cpu to that L3 domain.
>>> + *
>>> + * Find the erdt_domain_info whose CACD lists @cpu, then bind that ERDT domain
>>> + * to @cpu's L3 id. A CPU whose L3 id does not match the binding of its ERDT
>>> + * domain cannot be covered by resctrl.
>>> + *
>>> + * For example, the CACD sub-tables report:
>>> + * domain0: CPU0, CPU2, domain1: CPU1, CPU3
>>> + * while CPUID/cacheinfo reports the L3 cache is shared by:
>>> + * id0: CPU0, CPU1, id1: CPU2, CPU3
>>> + * With the CPUs coming online in order:
>>> + * - CPU0 binds domain0 to L3 id0.
>>> + * - CPU1 is in the unbound domain1, but L3 id0 is already bound to domain0,
>>> + *   so CPU1 is not covered by resctrl.
>>> + * - CPU2 is in domain0, which is bound to L3 id0 rather than CPU2's L3 id1,
>>> + *   so CPU2 is not covered by resctrl.
>>> + * - CPU3 binds domain1 to L3 id1.
>>> + *
>>> + * Return: true if @cpu can be covered by resctrl, false otherwise.
>>
>> Could "can be covered by resctrl" be more specific?
>>
> 
> OK, how about changing it to:
> 
>  * Return: true if @cpu can be added to resctrl domains, false if @cpu must
>  * not be in any resctrl domain.

This refers to how caller acts on result of this function as opposed to what
this function actually returns. Compare to, for example:

 * Return: true if ERDT is unused, or if the ERDT domain containing @cpu is
 * bound to @cpu's L3 cache ID, whether that binding already existed or was
 * created by this call. false if ERDT and CPUID cannot be reconciled into a
 * one-to-one binding, in which case no binding is modified.

> 
> The other "covered by resctrl" wording in the comment is updated too.
> 
>>> + */
>>> +bool erdt_try_bind_cpu(int cpu)
>>> +{
>>> +	struct erdt_domain_info *d, *cpu_dom = NULL;
>>> +	int dom_id;
>>> +
>>> +	/* Without ERDT there is no firmware topology to disagree with. */
>>> +	if (!erdt_enabled)
>>> +		return true;
>>> +
>>> +	dom_id = get_cpu_cacheinfo_id(cpu, RESCTRL_L3_CACHE);
>>> +	if (dom_id < 0) {
>>> +		pr_warn_once(FW_BUG "Can't find L3 id for CPU:%d\n", cpu);
>>> +		return false;
>>> +	}
>>> +
>>> +	list_for_each_entry(d, &domain_info_list, entry) {
>>> +		if (cpumask_test_cpu(cpu, &d->cpu_mask)) {
>>> +			cpu_dom = d;
>>> +			break;
>>> +		}
>>> +	}
>>> +
>>> +	if (!cpu_dom) {
>>> +		pr_warn_once(FW_BUG "Cannot find the ERDT domain which has CPU%d\n", cpu);
>>> +		return false;
>>> +	}
>>> +
>>> +	/* This ERDT domain is already bound to this CPU's L3 domain. */
>>> +	if (cpu_dom->dom_id == dom_id)
>>> +		return true;
>>> +
>>> +	/*
>>> +	 * This ERDT domain is already bound to a different L3 domain. Rebinding it
>>> +	 * would leave two L3 domains reading the counters of one ERDT domain, so
>>> +	 * skip @cpu instead (CPU2 in the example above).
>>> +	 */
>>> +	if (cpu_dom->dom_id != ERDT_DOMAIN_ID_UNSET) {
>>> +		pr_warn_once(FW_BUG "CPU%d's id=%d not equal to CACD domain(%*pbl) id=%d, skip this CPU\n",
>>> +			     cpu, dom_id, cpumask_pr_args(&cpu_dom->cpu_mask), cpu_dom->dom_id);
>>> +
>>> +		return false;
>>> +	}
>>> +
>>> +	/*
>>> +	 * A possible new binding. Check if another ERDT domain shares the same
>>> +	 * L3 id. If yes, this is a conflict and @cpu should not be considered
>>> +	 * by resctrl (CPU1 in the example above).
>>> +	 */
>>> +	list_for_each_entry(d, &domain_info_list, entry) {
>>> +		if (d == cpu_dom)
>>> +			continue;
>>> +
>>> +		if (d->dom_id == dom_id) {
>>> +			pr_warn_once(FW_BUG "CPU%d's id=%d is already used by CACD domain(%*pbl), skip this CPU\n",
>>> +				     cpu, dom_id, cpumask_pr_args(&d->cpu_mask));
>>> +
>>> +			return false;
>>> +		}
>>> +	}
>>> +
>>> +	/* Eligible new binding, assign the L3 id. */
>>> +	cpu_dom->dom_id = dom_id;
>>> +
>>> +	return true;
>>> +}
>>> +
>>> +/*
>>> + * Associate ERDT table information with this domain.
>>
>> Could this add a note (if it is actually true) that earlier checks ensures
>> that hw_dom->d_info will *always* point to a valid ERDT domain ... or does
>> resctrl need to check for hw_dom->d_info everywhere like erdt_mon_read()?
>> Or are those checks just for robustness?
>>
> 
> It should be always valid if ERDT is enabled. The CPU that creates the L3
> monitoring domain has passed erdt_try_bind_domain(), which bound an ERDT
> domain to that CPU's L3 cache ID. The L3 monitoring domain ID is the L3
> cache ID, so the lookup should always find a match.

Could you please add a this information to the function comment?

> 
> The check in erdt_mon_read() was only for robustness(I did not find
> scenario that it could be NULL), just in case I added "if (WARN_ON_ONCE(!d))"
> in the next version.

Sounds good, thank you.
>>> + */
>>> +void erdt_l3_mon_domain_setup(struct rdt_domain_hdr *hdr)
>>> +{
>>> +	struct rdt_hw_l3_mon_domain *hw_dom;
>>> +	struct erdt_domain_info *d;
>>> +
>>> +	if (!erdt_enabled)
>>> +		return;
>>> +
>>> +	hw_dom = resctrl_to_arch_mon_dom(container_of(hdr, struct rdt_l3_mon_domain, hdr));
>>> +
>>> +	list_for_each_entry(d, &domain_info_list, entry) {
>>> +		if (d->dom_id == hdr->id) {
>>> +			hw_dom->d_info = d;
>>> +			return;
>>> +		}
>>> +	}
>>> +}
>>> +
Reinette

