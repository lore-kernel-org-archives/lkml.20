Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BBE44237F;
	Fri, 11 Sep 2026 22:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164231; cv=fail; b=vBIqt9GYXdE7kT86Kdaiym71pLMIijUy2Mqv+jYoL2IvBKIj7AjrG/GcZ1LPDyLPpzsi12p/2v/RTVzDqsOLD5O1RHmqlDG122bIVSzI3taM5duGSeuRLI0YZuDreB6vLFD9TMgyN70gZXmj6wUU1F6GuuUfLXzEW3MiNj2jSNg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164231; c=relaxed/simple;
	bh=I/zH0QkKwGCSQzUGKoJiawsbKmjl/knSj1eQSvroUAw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i1MoOHfIoYBPDBA1Zg2y3evfEKCi8FITbPXh/Cu/LcWlwfFwnIFv8gzD3e1lQcY3KpVpk2ZmScgUc35yrugi2RwOtPMm2YxjNtNXql/9RVCged1x5+3rC25gEjJkleJoyh7xC8qAD7vE4DXlNQmtMfxEEFDpA5c0UCoLeU0WfXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSrmlyFH; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSrmlyFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789164229; x=1820700229;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=I/zH0QkKwGCSQzUGKoJiawsbKmjl/knSj1eQSvroUAw=;
  b=nSrmlyFH7mEmReGTjIRhkx4wXA1THZ+Acpghp5Wz/QwOqj3npNz0EUaT
   iKr8dHHqnfn6Sj7mzpbmwyHJjXIXiBdbpMf56orXsqLy3ycXCF4Q29wfL
   GokxgdAGglpaf1+cftIP7IKOii4t1IzuQhPXp6NaQMY0Zktoo11bnrBSr
   mjcxoGKv8O1El43QmMPl3ksTQLBA9dC0xMvui055jATWiJ0MnOftK8bNw
   o6CAnYVcx3fUIUghlWMJkPKk8Ac+2C6Erkn5gGM6ke4y+2qzrXVjXeSuf
   M+qzDIqQ09C6AEXBryGU6MP8DIU7v7SAxXfrFNrBfSu/vNh5U8fgYdGew
   w==;
X-CSE-ConnectionGUID: xh6xUtlMSbCjt0Pf09RqtQ==
X-CSE-MsgGUID: YZ9JH6MiRwCeZtBIOwdehA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="107001712"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="107001712"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 15:03:49 -0700
X-CSE-ConnectionGUID: wAXf+d0DTIeYW9fBPdx2HA==
X-CSE-MsgGUID: tyC61BxDTrKGVolGWyd4lg==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 15:03:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 15:03:47 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 15:03:47 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 15:03:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXcKzvOWasJYUDqQiep7oojtmfmpPVr6Yie0sXHXczN/acjsWCAZyzBFyIJ27azj0bjEC3na8t2A4L31BRHqm0nurbnnW6VzV1QGh8QIBoSg54dM6+IRghjXd/dlTIzNQOr9vNav3MMYMkayczjQ2HVkRnvXyZyQJlU20FpVZsUJFjTrOZS85jXho+VC0RZwRxvAcdnjfrSN1NYksQnrOAlYhup1ji/uTBntjWPIkOElIqLARpVkSdk7h/SjF/jPNK0xpY26KJ2hnISdJ02swoP52qBWLCn72O/G4oJReb5viTZuk6N3HxreT8qW9H8/9GgX3IeDO6EyjGg+QEfdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pp1a90HRI47Q2oZlYb0Aw0DlOOOgtzMePtosYUPMXdo=;
 b=snPRSXHfypDUB0V4ubW2MeXtii1VFutfAF00PeLWa+kMDFNEg0BBy52FItnj4peY5uay/WYzV8W1kA3NHzKw6wbkAXgfBQ6N9DVzOyirTnImcN8gl9VURAg6ZpyKoEHyxlorpfE0CeQBVy+L4yOAnjEM/dNK9vbRTRzQFWosXl9C36HLmuX0w/JKsC8UrQfjKnR78lNWfNMrBWj8YT4FBprD+B9m4EV+4gvmiyEVWr0Dg5KNjIdVJkymnSIp+YSxaXOE2hGOk4jOeay84ZOFYmEN0pyElAidqtPPyQReJf82t9nRBjlDy7jmiSarslYLf0/Gnb55gZ2Nf3bVd4cZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN7PR11MB993112.namprd11.prod.outlook.com (2603:10b6:208:5f5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 22:03:44 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 22:03:43 +0000
Message-ID: <afd86b47-d508-4739-ba6f-fd1c341e09a8@intel.com>
Date: Fri, 11 Sep 2026 15:03:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/resctrl: Fix ABMC counter programming for
 extended counter ranges
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1788545152.git.babu.moger@amd.com>
 <9e85f67add9ac84f55e4b0fced92ed8994f8419a.1788545152.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <9e85f67add9ac84f55e4b0fced92ed8994f8419a.1788545152.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0294.namprd04.prod.outlook.com
 (2603:10b6:303:89::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MN7PR11MB993112:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a091a89-2770-4baf-1415-08df10508bae
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|4143699003|6133799003|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Ha8Vx9lKtloAu6mxL15zm8PfxmmCDc5OodVHwFDZ978Bf1YMKkFl/S1Em11CYn9PyiGyWyw9vVnkzzJMuSDRSwCcIGkiEfTQwq066UoKH7q55oDHob5r1lbjrHJ36JUgPVjhLDB4hvI74b09H4UxPJHcAf3bHVWYdopZVizprnsQ5JKV9NZVw62DDUbuN+iel4aeKoj+az+v1zoRXoP/cQIrOYnFTWxhBAiGF3hAnW5HsWE8QbClD6FrycUDuxUpVpMS9KVeStKXcWYy5RUgh1C64f4KFMkL6cv2b91tfnMe8p1ODew4HytF1/0Kl0yi52BWiKclLtrM+r+XhOgXvig6PqLUspvvFHHjF7V8uzauLSdfxwJW8AKwXPpptMTd+rKLZCnuPlqY2UudX/gw5HD2DecTbAp+tffn70cNkcpi7Bx4FnUmQ14tvJt30z2AFfFTzauVhkbeB6MELlxPoqlDl67E2/VzuHeu5c+hRIamimeTqHl5Cot3bWY78BeMFBR4Bg3Mwe1cACQg5DHs+VuNQqMQhC+AgFgJcxfLLJyZzw4wLQEYMUR4fto1Is3Pwqa/Y0cPjGgtj3mip7uvwTVHEp04LUL+pzf3MEY+IbHZrv2zg77vtJkEjJBfjcp5enfkTrFqH6fvsFaGH9Ia/KZQzQG4hzr3rafiHoRFgBY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(4143699003)(6133799003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWNXZGtXVUZCdVVWcEt0LzBKWlo1U3p5aWNZSTB3ZWgrNnU4WlFIb0FxaDhU?=
 =?utf-8?B?QXBncHpPK3FEeGFLSVBSVWU4MFRoTmNiczFDOUJhNWJGWDh5QW0yYVA4QnpI?=
 =?utf-8?B?YjZHaGw2MHJ3RTU2dmNvYUhlNjdHa1g5SkFGT05WdVM4RjdhUEIrcWNSdHdy?=
 =?utf-8?B?UUJ2NFZ2cTZRdmk5WGR6T2ROSUVtRk1xQS8yK29jSWJNdTFuWGJwd2c2MWZD?=
 =?utf-8?B?NmNjcW9tTVgrYkgzS3JGNk9wcGhrNHpQZXp4QXlSeDZheWxPOFowTEN5cjdW?=
 =?utf-8?B?bXlGYytvT1djWVB1RWZBNHU4Y1V3VldIVnFJMlJ0WnJEMWgxYjEwSnlZcGRK?=
 =?utf-8?B?TjJqT25YaW5GU0RpZ1ArQTQwbkdGaDI0TE1aa0pRbFh5NjJyR2dudlp4ZnF2?=
 =?utf-8?B?cUJKOFpETng4bTZDUENDR3AwelNtNC9VcUxsNXJZUHR2ZUU3cTloZk13R2lW?=
 =?utf-8?B?bmVsRWVrWkJ0eStCYnhVYi9RelhpWXA4ZDJGY1lHaXFPWTNjOTNodWpsNDBV?=
 =?utf-8?B?TU1haGg1NG1EQTliSVBYWlAxRCtiYkRXUVlEV1A2bGF0emRKVE1NeG16UGpS?=
 =?utf-8?B?UFVxTkdkOXFDV0lQNldURjVqdEZldDdheW1yZWUxWnpOZDJ5MEd2Ymt6bE5W?=
 =?utf-8?B?N0hVNUxGNE8yREJOV2NGVng2cTJRRnhkOWdWcGgyYTJSZjY0NllhYkFUcC9m?=
 =?utf-8?B?VlpJaThGR0wvOGd5TjhlY21xajFQTWN6U2dFNWhwNkVDWWEvb3FJVEV4MjZk?=
 =?utf-8?B?NmRhWEpoc3d4V2pvTTN4d3VmQ2RlQTh4M3FxT1Z6bFR1c3F5dElrZTlycGVI?=
 =?utf-8?B?SFc0eGJLaXlLaDJnUkdSMkxvMU15a0FOeE5QQW1GOXhKd1VwR05kem5pTWpU?=
 =?utf-8?B?enpUZ3hVOUxnaWFRb0Q0K0t6NktETFNCL3VOR1RWaUc2VG5kaCtaME1mQkd0?=
 =?utf-8?B?UFZuYnJ4ZHBmaFo0b1E4b3QxRzNvR2I3VS96WjRyWnBXTFpleHBBUjE3djlK?=
 =?utf-8?B?ajhrRE9TNzdBbVl0UTAyR3ZuM2VNbGdjeHlNL1ZnQTF3YzQzVGVlUG9KdkI2?=
 =?utf-8?B?Um5udi9JNUtDZmNndzluaGdxN2U1M1JUc0h1cFJBTnJIQXBLeGhSdUg0dUZS?=
 =?utf-8?B?V2ZYUjlPZEdNRGRRUmRaR01Dd2lJdzdmb1RGYllTWUMrMHp5OFFjcXZuVzU1?=
 =?utf-8?B?NEpyZXFkVmk2bjlKTFpCNUxmQ05kdmZXNGZWZ1IrN04wNEJod1pIbHlBeC9T?=
 =?utf-8?B?T2ZrY01pMzBNeWdHVUpreWdRM3ZiL2tZTWVqSzNoVVhZYXlhbVdLYUNyYnc4?=
 =?utf-8?B?WFBNODh0Nm9CTDRCcW9QWk53YWtINkI1WS9BZnI4M2NxZTJ6bVBwY2oybmJ0?=
 =?utf-8?B?S0FFb2U0UERna3NoUFQyeWR3WXdRaTIzVVVHbjY5S0czK1o0OXhBRjYyajJr?=
 =?utf-8?B?d2dKUFlvQWlROHFYNnBYeGFSN3dTeHBlUGhzTnN2VlBzVUE3djBRNVBPNkx6?=
 =?utf-8?B?S25QOXNHOFQzWkoyRGJFVUVwOWg4dHo1a05QRTlNdXI1ZCtndWVvc0JKbS9y?=
 =?utf-8?B?ZitWSURQSFlSMDBOWnBPR2lYOUpjQWgzNTMwRFprekNFN25TQVNBZXpjR3Nu?=
 =?utf-8?B?ZjN2dkxyZ29rcVoydHg4dUh0ZEpjS0cyUHd2SG53NGZyQVNuVFFMY3Jmc1Av?=
 =?utf-8?B?dTZzTnZTOVBVVXpOOGtWc29YbzAwUTUzRjVLcVVzaktrZEJXNmVpSWc3aWRM?=
 =?utf-8?B?N0JMM0YrL1pUaWZ4VVA3dGNTeFVuVUxEM1p1Q2srekErSnl1djNFallSdWVO?=
 =?utf-8?B?Q0dxdGlHSGV2YUNEVm1ySGkrTnlJMGpzVGVkRTI0WkR6OXh0dDJtZEpwcEFT?=
 =?utf-8?B?bG55dm4rRU40ckZwZkZOSEVCUFZ0TUZVTU9HNXlEdmVQUXB4aUVlbjVMZk1s?=
 =?utf-8?B?eTdOaFh0bGtqSEREdUlueGlaZEMyY3ArQ3BNRFJ4WU4xVDdDb2RmbUhuU01U?=
 =?utf-8?B?UGJGay9mUUNEZ2IzSmRWSkVWNUdEZmVRR2pFdkJyS3pPQmV1Y0J4d0Y5RGtu?=
 =?utf-8?B?R1dCZEVPTjZmb0tjbU1MSUZ2WHBzRE9INTZmQmlJK3h0d0tvRUU1U0NxNGJT?=
 =?utf-8?B?WG9VOEVMdC9XdzQxUnM0UU1TSGM0Q1VqeDNtQi9KeVQzN2Jqa3RQT1htQWlW?=
 =?utf-8?B?OU1aTXNFSW8rZnVnZ05uZWVhTGlyZEowT05XOTVxRWV1UmZackhGTHMwd0hO?=
 =?utf-8?B?TDNuSUJmSkVKeEt1VEdQR0ZZQ2pENmN4SUZ2V0k5empQU3p6Y2txUHFnTW52?=
 =?utf-8?B?RlpkNk1PUW1UNEgzcXhGZThKK3lFREs4aTloVkVmNjFWSTNLYWxLVzBhaGZa?=
 =?utf-8?Q?YaKJSvoUpVqlM8d0=3D?=
X-Exchange-RoutingPolicyChecked: TySVh1T6hSmh2BFDCNcSHUCDyJ2SczeTx+t1RomZTorNcEBwHV3/3QuSjrKg1jC7ajby6HPVmOp62VrxHbMFyoos81Pohkq2F3iJ/SMHlpiThGZzhMj00NiSDx4OMuCf2hdiRtXRv8bhhZpLi0EvwO9jnjGJnAZYA5lIvHvxegqFuwLgb+mUW8x0aMt1I+fTyWzIYo0s9TmhzYXDUq6cdS4efg/YV5YC08RWnr0/IRHT77JVmFw/jyo3lth45Na9rbS9dorUEZd5CqZM6O9zQ4IGAW7nZeA8MISi1n7hVXPCHC5kKCyhFeQH9GIuB0qqXZD9HZoIw19LQPBnBA6P2g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a091a89-2770-4baf-1415-08df10508bae
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 22:03:43.8401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xDtMFQi8fHNqDmgR0upU4ZDa9VcsWUUB3A8iWEtPlxwIzUHql2lLAybN7h0lCRnuvubf1gPOz1Qpg0WQ4TFL4V+cdkdhsyXYbFTqnC7Y9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB993112
X-OriginatorOrg: intel.com

Hi Babu,

What does the "for extended counter ranges" in subject refer to? As I understand
"extended events" is another term for ABMC so this seems redundant? 
"counter ranges" also just seems to refer to one "part" of this patch so perhaps
it could just be:
	x86/resctrl: Fix ABMC counter programming

On 9/4/26 11:06 AM, Babu Moger wrote:
> Memory Bandwidth Monitoring (MBM) can report incorrect values when ABMC is
> enabled on systems supporting more than 32 ABMC counters. As the number of
> active monitoring groups increases beyond the range supported by the
> existing counter ID encoding, programming an ABMC counter may inadvertently
> affect a different counter, resulting in unexpected counter resets and
> abnormally large MBM readings.
> 
> The issue originates from the ABMC counter programming interface in the
> L3_QOS_ABMC_CFG MSR. The counter ID field is currently defined as 5 bits,
> which limits the addressable counter range to 32 counters. On systems
> implementing more than 32 ABMC counters, counter IDs above 31 cannot be
> encoded correctly. Consequently, programming a counter ID beyond the
> supported range may target an unintended counter and reset bandwidth
> statistics associated with another monitoring group.
> 
> While updating this logic, it was also observed that the bw_src field,
> which encodes the RMID, is currently at its 12-bit limit with support for
> 4096 RMIDs. This field also needs to be updated for future expansion.
> 
> Also found one more pre-existing issue. This union structure can truncate
> data on 32-bit x86 systems when unsigned long is used.
> 
> Fix the issues with the following changes:
> 
> 1. Update the cntr_id field handling to support the full hardware ABMC
> counter range and ensure that counter programming does not interfere with
> unrelated counters.

Sashiko's assessment that this statement is not accurate looks correct to me.

Looks like the enumeration needs a check to limit the number of supported
counters if the hardware supports more than what can be configured? It seems
awkward that such hardware could exist and unclear why the spec has a mismatch in
the number of bits here. Even if cntr_id expands further to use the remaining
reserved bits it would still not be sufficient to configure all the numbers
that hardware may claim to support. Are there perhaps more field width changes
in this upcoming spec update?

> 
> 2. Expand the bw_src field to 15 bits.

Do the comments describing the RMID field width when reading the monitoring
data (__cntr_id_read() and __rmid_read_phys()) need an update also? 

 
> 3. Change "unsigned long" to u64 to fix truncation on 32-bit x86.

Sashiko found that this change by itself is not sufficient to address issues
with 32-bit. What do you think of dropping this part of the patch and instead
adding your support to:

https://lore.kernel.org/lkml/20260831174421.13921-22-tony.luck@intel.com/ ?

> 
> The AMD64 Architecture Programmer's Manual [1] available at [2] will be
> updated accordingly in a future revision to document the expanded cntr_id
> and bw_src field definitions.

This changelog uses a lot of text to describe one of these spec updates and then,
seemingly as an afterthought, describe two more changes in a way that hints that
these should be separate patches.

Could the changelog be simplified (after dropping the 64-bit change) to something
like:

	AMD's Assignable Bandwidth Monitoring Counters (ABMC) are configured via        
	MSR_IA32_L3_QOS_ABMC_CFG. The architecture [1] received an update that          
	increases the width of two of the MSR's fields:                                 
                                                                                
	1. The counter ID (represented by l3_qos_abmc_cfg.split.cntr_id) increases
	   from 5 to 12 bits.
                                                                                
	2. The bandwidth source (represented by l3_qos_abmc_cfg.split.bw_src), used
	   for the RMID, increases from 12 to 15 bits.                                  
                                                                                
	Use the new field widths. The number of supported counters and RMID are
	enumerated separately. Designate this update as a fix to original enabling
	to avoid misconfigurations resulting from truncating the counter ID and RMID             
	on hardware that support a large number of these IDs.   

The changelog is just a suggestion based on its current form - other potential changes
like the comments and enumeration checks are not captured by it, but should be if/when
they are added.

> 
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming,
>     Publication #24593, Revision 3.41, Section 19.3.3.3 "Assignable
>     Bandwidth Monitoring (ABMC)"
> 
> Fixes: 84ecefb76674 ("x86/resctrl: Add data structures and definitions for ABMC assignment")

Is this a stable candidate?

> Signed-off-by: Babu Moger <babu.moger@amd.com>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
> ---
Reinette
