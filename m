Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793395773;
	b=zbia6kG4v8sQLSu+NUGBFlvsU6To7Xwl2oOCItJeP5dYPNmH17Aqc90guwQgcxUc2f7z
	 o6tSpqKXHlJITodAOpJ6vXQqua/xyStW46Cvj4GAl8yJA7EB/j5QKF04qYajWgjc1w0gd
	 Ny5qCgQmEJUcYJw7GzPNBsCMY9aBiMznROLmWlD1h/eG3d+/3Wu5G/a8x+t/Ckxd19BmI
	 +tvzrx6f+9zv2pR0ST9Z/7d+bcno0ocAV1TxwMtSMI72+7d3R53fJKcoRvBZGZqJXQ8k8
	 U7MX0ARtricIh+cjwPUtc7qy3D9I7ZQlr7F2lzreqg1XKS6y5lHFSilMjCRKKxIpYrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395773;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:
	 Content-Language:To:CC:References:From:In-Reply-To:Content-Type:
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
	bh=T6IDSZ84R2y3qhKhqW2h2B7vMnUh8AA9DXCsBiKTE4Q=;
	b=ofLpRwKlYerP4PSrB3tM9nzKoo6fGUUV9l2VjRI+p1geaJzuowPfntgcBgz9XITG9A3J
	 SI6kT1SUkC/NskMw2T5Ol+iP+rX8Ypnwh29gQvF9xenjujW4uNVgS0wtMgKkTwAl8K6dh
	 l/zfJpaspKfEcw763YSsoFSZH5TfRQwSV/1bovFxMoESxH/MPuyTM8ECa3B49ELDS+EiT
	 DFSPn/aan0ArS63h7RsKQ4+c4H7uNH0jPKmD6MenD5D5Bm6I7Qxp1znFhG9YXqwSjO6+k
	 xl0a/DMDMSKbgcGvsVKXoSYBSHHLEKQgggIEXEmmXLLL7CsjKpKahQpyb4FvV2jk8gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hz2Y0fuK;
	arc=fail smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB77B606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB77B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hz2Y0fuK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793395773; x=1824931773;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8DgLm20yjJAbhMvv5VVT5M5550qHJeyrD5U/n445qIo=;
  b=hz2Y0fuKxhZUT/S3HrViRcdB9lTdlfTTa/Ky4FvE96VWW6IlApl6etg7
   kcMaTcEBx/o0p8SunpuSGKWyfL/PlATzmPpLb2+fzVj0o9qvqOtBN0T5w
   ig4hceA6SUiIFQEioV35BSb7659Vw1EFHueEyKdNm3Xf8iIbM12XFC6AY
   0B7+kcRr5pL6I/TqpE8D6d22hE3vaKRYe+h3NRMxe76xLm7ctWDHe6AC6
   /GOJCqEFXdJj6bV/eGREWmGmyc3+X64kEFiNnogyklROrlD/BOuZk9kRg
   jxJJfMbBfhAl8c0S1NNn7Ys3veAbYgWhqg0QpsCuYTHKhG4YSEmeJtbhB
   A==;
X-CSE-ConnectionGUID: bvQ9J9OrQiCpC0y/XnArag==
X-CSE-MsgGUID: 2o3mr0eVQle2cYJQBmvxIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2051941"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2051941"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:29:33 -0700
X-CSE-ConnectionGUID: hrBpsYUKRkqriY9/q0cE2Q==
X-CSE-MsgGUID: lgq8NaboS9GdiCDikNRz+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5873970"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:29:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 14:29:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 14:29:31 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.11) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 14:29:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QTiXUJ4eNGi7/9OA1arbh6MXxMUlUj6EZzk4bw+7ChRGp1ejQG0zUrMGZWtDfhtnDPWbji/YfUP6Q2CCBOMeaxYkmJxQUaq8j67ML0fDq7aRVIfG9oGYu57UwnaxYLlY4CxJCv6OISx8tnZFu34YQt1fqSKSS4oAYMwJcCP+aWtIy4o1HZpdDM65TOm+PQfV3wNBWfO4MKbeihYp/ahc/MK00YiEGBoPUvL6LEozkSnIb24e5SsNioWMMPGr8rK2AOq7sklF+2/romgDW4grg6V+DHnFXZL445DgsmC6AL/mQ9THyO0MZGj8N5wlMMrdDvH9ssSNDgxQ9WPxu22HsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6IDSZ84R2y3qhKhqW2h2B7vMnUh8AA9DXCsBiKTE4Q=;
 b=SnF4W1h8yD+9eU2W6MM9k8F7E9gLfhzvE3ebwq87wp8g5Gpy39omRI6nKhGTstxDAcbSlVENdpWkaTbflLlcl7YwyAVrtOEf0NmhCrbJBhTBWGLxowZk9gzknTWZnlQV9siL44z0oee9bSz46TtDz1q8TNIOzLe6aFKFEZON65GvSnSkoSfalr6x6t2uF1EgkFygmUg5C2GBe4/nhvY/oOUrWznF+xMJSg0kTRbRY5zRtxtYgfQgBx3zF0VORU+xTU2Q49lUTKo8dihOkgxyKI0BeHZKQkK9Y+9Q2KfQIK60OdiBqeUkc5Zsgb+/j32sOQDfytBOCmMjWPVGtIQbug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7846.namprd11.prod.outlook.com (2603:10b6:930:79::14)
 by BN9PR11MB5323.namprd11.prod.outlook.com (2603:10b6:408:118::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 21:29:28 +0000
Received: from CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395]) by CY8PR11MB7846.namprd11.prod.outlook.com
 ([fe80::cae0:d05c:b2fc:c395%5]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 21:29:28 +0000
Message-ID: <2a6f9c90-a6a3-4b4b-a77b-9a3b99d66d4a@intel.com>
Date: Fri, 30 Oct 2026 14:29:25 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/cpu: Change AMD uarch detection
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Sean Christopherson <seanjc@google.com>
CC: x86-ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, "Luck, Tony" <tony.luck@intel.com>
References: <20261022040047.GDatmKb9L_fwqBGQ0_@fat_crate.local>
 <auDBUQQ9Ympsobkh@google.com>
 <20261028044653.GBauF-PdTS6gsOOozC@fat_crate.local>
 <auIBRhu4Zs3UgsQ7@google.com>
 <20261028153458.GBauIWIhGKCYhaxl2_@fat_crate.local>
 <20261029175611.GEauOIu-Xi9_DGVXKe@fat_crate.local>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20261029175611.GEauOIu-Xi9_DGVXKe@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::20) To CY8PR11MB7846.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: CY8PR11MB7846:EE_|BN9PR11MB5323:EE_
X-MS-Office365-Filtering-Correlation-Id: 2849814b-5234-49c7-0c84-08df36cce109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|4143699003|261028144727099003|261022105027099003|261021123027099003|56012099006|261026140227099003|261026121527099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: HKI1bt1AP1Xfwq7bRWFBrQzRZUa5qTaqCbPvdPT2dzMghcUCEho8nAF+Jb+VPa7B0h8RwGKU0ivpzqJZ6maSMkaKTmoZxAKkjAuSzML66heYc8SNIXG02pPCtkjTir59xoHiu/tbS4mGfRcdp38r1X9qTKIHntoXPdLYzqejUGs2AcHqxD0mrGXicancFEREx+BmtZeGZbJwTqnYrquV8CJVKVqG+AMGJGU5qjBBjx2N0TcXk+gJQNH7PNr8sBdjOvD7tfTjlg5ql8rKpMwROXnmuwBfnyXt8l1Y/O7dtunl4neA+1CxAGIIuvfQS8Kt3Os3OtYMX2ICoWfs3DBl13iyjZo2i3WGRg+TYqB4wynOv/PfoV2bPE7fSuoAjr3Z3S4ubBFc0aUNQEKMMgIIT3F8EQzNcT7ZMsHZNRSRXBgUvH/dFJryTk3DztBvODcaWfqy3Quyo7NSKP2Z1pJHg9P8NMuESGKyzr5QAXrEM37gxc6xRjgY9J7R4Apbs1wzcHGueuklztdR+eDD6I/sCIRJZDenmm42O+UB9GGQHSc6AKzmPcK2WE6fvYiXp80ut+6ByqfEZxrsKV0GaqlAaObZJmhsXaQl8MNEbJKBFtNXKsvPaxXh/5V+nkKIc0A/h1uDGj96Z0LFkh6BMXW7d0XYKvnobvLPgUNEybuOnd0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7846.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(261028144727099003)(261022105027099003)(261021123027099003)(56012099006)(261026140227099003)(261026121527099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVNDUEE3a0c5N2FWT3UzakRQRXJBTm9XVXc2a1prUlIwS0lqWjRkRnEwNEtT?=
 =?utf-8?B?MitJczZNbFJtSzBpdlVRWmg3OTJYM0w0aktya0trM2VOSTlUNmlDZUVRSDFv?=
 =?utf-8?B?Tm5mL1U0WWNnOGdvSW80QzFmK09CS0twajU4RHF6bmtyME9GbFVkRTY0bVBj?=
 =?utf-8?B?VkZXR1RETnVheWFwTzlsZDR4WDhDcGJZNjhSVStEYlpwZVNNZitzdElPcUQw?=
 =?utf-8?B?aG1RME1vdHRodGcvYURBblI1YldYaVRlYkhSbG1zeXd6ZjZzNGs0Q1pKeFV5?=
 =?utf-8?B?MzcwbGtoek5US1JGVDVYZHRKckZIVkhDM1FjM1FxbEJYUjhnU0tHaHpuNFBt?=
 =?utf-8?B?WHYxdVBlalE5c2xnS0t6ZElmdEQ2L2JPWlZBTFpwK2kza3RDWVFXLzMzRks2?=
 =?utf-8?B?dzBJTUlVb0Z6S1M4K1NvRlZyMlFJZys1UEdNV1hxTW81QTRCakQwSTNzTzB1?=
 =?utf-8?B?VE1kU252MENiVDRLTzZjYndUclRaUmVzNHdMU0dJdGxCVzY1anM3d09zVVNh?=
 =?utf-8?B?alVraVE3WFozSVJUM1hjMXFJb29IbUxRb25kU3BubFNCUHFpYy9OTnRaR3JC?=
 =?utf-8?B?aEY0Q09wUkNrTjhiOFV6Uk1iODNlaGkrYTdxNzJyRlM4cTNVdjMveTM1Y1FR?=
 =?utf-8?B?N3JvblRtNWsrWXgyQ1JXQ0c1amt0ditxSllCbmVkeDBrYnZSQmcrU2JrNkNU?=
 =?utf-8?B?UVlZeUxPaHV2M2p2NSt3dmJVYWw5SE5YUlJ2M2xaUGdWWjJ1YjNjSFQ4QURz?=
 =?utf-8?B?SnM1dEtqUk1LWnlsK05NejJCRkErS3llNzRjbHBvcWJCLzhkM1pkMk5tM3VM?=
 =?utf-8?B?QWl2b1ExN28veSt0Q0xvTmhEcHJoTmpMeHEyc3pVMThxYklBY2RwcHJxd012?=
 =?utf-8?B?MGFKd2dYQ1NuNW4zTGhUSjViVVBhUisvMm1pN3JPYmN2N0ozVUFGeWJQWGk1?=
 =?utf-8?B?RnphaUViemtqWVBPNDE0WVczZjFsSFYrYlJYTDNxRjl2RUNkb2podk9UeGRx?=
 =?utf-8?B?MGVGRytvcjlqOVFSQXVqY3FXM0hRSk1jVEJmR3EyaTU4SkpoRlU5OFMycTN2?=
 =?utf-8?B?Yi9xakg5bWU0d2ZVK1ZwL3pVWUQ5LzhTaUpxNkRpR2ZCTkJwUWRZeUF4U2ZV?=
 =?utf-8?B?RTlIMWxPOGlNY1pWNWs2R3BZYVBlYjVhUGU2V3E3cHpxSTVJVktOaW12RWxn?=
 =?utf-8?B?bitjZjJKTW9oMG8zYmw0SFVxR2lvQVJFV2lSbHowVEFkUk5xbC80UEUyd0tl?=
 =?utf-8?B?VGFBTDBlakZiN2FhNTFRd0p5RkJyL2dTd2tsNFhza2NOK3YvQ1BpVXV2ekFC?=
 =?utf-8?B?MkN2T3k0QlliMjVaMkJ2L2JBeVZ1SmxDQUdwZXJTN3VsWHg4SmVXNUtLY3Ar?=
 =?utf-8?B?NC9RRmNQUHhubkZqSmdNZzVKZC9CblJCRmFHUDBlR1orYjNMVVN3NXc4SU9m?=
 =?utf-8?B?RGk5dkxVOFl4a2E1Z1NIRUM1RDhmSURBTzFkWG1XVXhlendicXhqa28xRXdh?=
 =?utf-8?B?ZlBxV1o5ZzV2QXNzV1JtY29uQnlLSjBaaGdYVEZBVmFYMTRqcE1henRDdTZj?=
 =?utf-8?B?dTFZVWtWWjZXWis5OUZKZDVjdVpmZHBTQ1VpN3c0RWtuMnhkRS8yanQwSzU2?=
 =?utf-8?B?eW05QWc2WkdIbkRHOWlOa3FDK1kza0tKNWQ4NXJBREd0MlNKWXhlbGhPN2ND?=
 =?utf-8?B?YVF6M3NERUxLNG5vN0ZCSlIvQWpKMFZLaVd0cmpHdzhsVjA5VnFhT3RBNjRw?=
 =?utf-8?B?K2NVRGNnYUgwZkdBUklMTmhSTWNxdDh2STZGTmJrU0M1dDFsbzJ5bCtHcm5F?=
 =?utf-8?B?Tktjd21TVis3akE5UVd3Mm5ab0R0NE9UQjhKNTZJUk81Q0x2QzBCNG5SQ2U1?=
 =?utf-8?B?eXVMWDNtMFl5VWdmdDZSSTZSS1hKZkI0M1Rhcy83OE9sL0grci9wK1pGVkhO?=
 =?utf-8?B?TUdMNE94bE9pNDBBTENGWHBmK216ekNqdkt1TGpMdVNudmk2TDJ1b2V5dThu?=
 =?utf-8?B?SUxvRnZGeWQyUXUxakswMWtvT2FUc3h5QUd2ZDZFZmdMRmladzVMbk96UFZG?=
 =?utf-8?B?TURYaU9WUEl0STlTZnowamZXaHp2U01sbEZ3WWxGRW45cXFPVU1DOFlCRVRo?=
 =?utf-8?B?L2FEa0lVSDNaaHovUzIwZi9tTDhmd0NFejFTVkR3VG1PK2dVSkMwRXVZU2RG?=
 =?utf-8?B?RmdxcnFxSTdFTG9LMWpvYVZ0cUcyamtMTVVReFlxcnliUDdmejVKZzIzNTQx?=
 =?utf-8?B?VTdkZjU5UDlpb1VsWjNZVEdMeEY4Q3ZyenAvaWtEemxoc3BOR0x2S1pGQUF2?=
 =?utf-8?B?bEJSQldhaHIwWWZ6ek1mTk1RQ0wzWU9ZdmFyU3AvLzJUU1VjMGNJZz09?=
X-Exchange-RoutingPolicyChecked: GYDE/0mU4a8kFDBSYoA95LALjB2v0EW6tCoo/SNstGO3OeJTb4ZTfa7EpknQx6OvQi8q1mCafZx39lzCJDJZJsKx90e1QEX1SB61Gy5Gv0t/FWK8/xrQd7f2noKXBKjClKxVK6ZccZxx86Uu3E4UgroZE2P/NbJkdOD+T4EWNss/k7fW1Xpf21a95t6tlFQXqJQb89aS1tIWdwyv2vwTVXLy7Z69NBvDJK6QrpjingMinwiQn+PI0kjhPIguF+KmOczdxO8DzkHnohGGngV88IsrYMcL4EchQSyvVmIxhP61OYS2a0ZXbj3gHmaB6DgezoMe3Vf/Y/shpLahhFY9Bg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2849814b-5234-49c7-0c84-08df36cce109
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7846.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 21:29:28.7294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SFMGUm4UuaxluRIBblAyMGijyUzwYqZYaqh6zmPUdPqV3WyDxsH8k1IUDNlMatDMxPzx72WQww+nwpuo1NIlKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5323
X-OriginatorOrg: intel.com

On 10/29/2026 10:56 AM, Borislav Petkov wrote:
> Looks easy enough but needs thorough testing and perhaps some commenting how
> we're using x86_vfm on AMD a bit differently.
> 

I was working on adding guidance for x86_vfm usage for Intel in the
kernel documentation when I saw this thread. Here's the initial draft I
had for Intel:

      Intel CPU model checks
      ----------------------

      Intel CPU model checks should use the combined vendor/family/model
      field, x86_vfm, together with the INTEL_* defines in
      asm/intel-family.h. Avoid comparing x86_model against literal
      model numbers. Instead of writing::

              if (c->x86 == 6 && c->x86_model == 0x97)

      Please use::

              if (c->x86_vfm == INTEL_ALDERLAKE)

      To match several models, prefer an x86_match_cpu() table built
      with X86_MATCH_VFM(). If a model is missing from
      asm/intel-family.h, add a define for it.

      Range checks on x86_vfm can work, but they are discouraged for
      newer CPUs. Model numbers are not assigned in release order, and
      the newer Families 18 and 19 interleave with Family 6, which makes
      ranges hard to get right.


IIUC, the AMD usage is primarily geared towards range checks for a group
of CPUs whereas the Intel usage is for specific targeted CPUs.

Expressing uarch reusing x86_vfm and using it for range checks can be
tricky. See below.

> amd-family.h is not really necessary right now but that's immaterial for this
> change - we can always convert to it later if absolutely necessary. And
> I don't think it will be.
> 

...
> @@ -483,13 +482,13 @@ static void bsp_init_amd(struct cpuinfo_x86 *c)
>  		switch (c->x86_model) {
>  		case 0x00 ... 0x2f:
>  		case 0x50 ... 0x5f:
> -			setup_force_cpu_cap(X86_FEATURE_ZEN1);
> +			c->x86_vfm = AMD_ZEN1;

Since x86_vfm is a union, wouldn't this clobber the vendor, family and
model? This will set the x86_vendor to 0 and get detected as an Intel CPU.

>  			break;
>  		case 0x30 ... 0x4f:
>  		case 0x60 ... 0x7f:
>  		case 0x90 ... 0x91:
>  		case 0xa0 ... 0xaf:
> -			setup_force_cpu_cap(X86_FEATURE_ZEN2);
> +			c->x86_vfm = AMD_ZEN2;
>  			break;
>  		default:
