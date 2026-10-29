Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793297560;
	b=DJZd+xE1K0/IMDl5+MCAJRlNF6HdEkFXNYLBQIRoocS1bnZcXrpjylX7O7VKVu3WEWqI
	 m+CpHXOUveZAI1IN3rTDflkqZqPWp8xeN2FNenUYOUr4/SRgYeAoroGr2ri0AfRT/BroI
	 cHcSkq6ExgSOs+z99XVaqrIKIGXCY/hPlDogruP+1YvzOpGUQy983tXKq/2Sd/v1aeXCu
	 4OfiL6LUEQYkJy6p5g5dYgKwEnTabP/S6VyME+hGteUKxqEtdOGAthptV0klcrK+eHmqf
	 HijbGGmkrhadavDKnXyXszjmSyFP33kWuadulFHy8KCwPFMMvhUHRU7T60bUW9QPYQw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297560;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
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
	bh=x+4n/BBJs4hxg0QFauLX3+bmgtOiGdbyWeO/5BeRFIE=;
	b=l6tvpjbU4mJnjEdjt9/IA8HImFB+iNY91a5c1pnZ/2qfgaMvAG54mIJPEpsyYcg3N74c
	 ifvUrqq1MUtNuC5ZNie3oH+PQXJsuknlxYVWBV6yCQYa26Cde5PmJYIhsCUcMRWTMTIqA
	 DkPWhZ5GlI4a5YDVJWvS9vOlZcuT9is+CBdAOBFUQdPzgOeJnTLAs7opwDMDwUDfOv9xO
	 27SzkI8HIkOkF4+eqtLjWHpf8f8SfK7XjcZrASHkI8m/H57wleEd8fQCqlfDQRfxunUD5
	 ZTSDb4t0azcsq95Xhb7E3n/XJmKZrho5bgXiMH5XJGMZtu8pxflW7mbRuuCiVsedUbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FNIufExi;
	arc=fail smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BE8606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9BE8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FNIufExi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793297559; x=1824833559;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=JE1vmxybzaT+xs8Lf6KTcxhFQN1cRIdMFAi3i2dRpB0=;
  b=FNIufExiuYdZs1cXIMTXd/cI0X3svPLuxosqDxCoB2TV0DfnPQ/QJseU
   KUoNqXLk6/QVQ2w2uCCSp60qh0sdInmMg9OB1Ew+AjzBn83zJ9LFSRQYV
   FddpwaNamODD59I5VlIymGPSJn1pUby4DIikI6mErmFjbUf/ErRz1Q6r7
   Enw1JbYuXicJoTfCLWTdpS+9kBj9AJGuWKAZlE9dwmbTf8wUO+s2mcBNG
   YQ/GGjI2BT8eyPN+SPI5qfV19Ha3YAwpYvvJxwXvYIPXhraWJYj6mimXO
   f2mifAQdmQ8JGhKF79EkC6OlmcYcsZP7N75qOKNbT7/7BQQAo9iC0y+tn
   Q==;
X-CSE-ConnectionGUID: xpwLdaHgT8W973QqjIs45w==
X-CSE-MsgGUID: hPQlR9USSCK8fF+zAgd3zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2143809"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2143809"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 11:12:38 -0700
X-CSE-ConnectionGUID: MFgYz8PdTna/NjRR1dN3JQ==
X-CSE-MsgGUID: dLgmBXKoR8m5cPb+6swVYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5099499"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 11:12:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 11:12:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 11:12:37 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 11:12:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYE6Z/B6puWhp6kZ0N2FHulbWZAxpDIWvlrT85h4vH78NuZ83WLhQbMX2Lyof2EUsYoJILKvwDg9LULOOMVURyyP2oAjFwus2AmOsH3KiUrcCslGZBbQNlOAEF/9qCNGSyqR0Fi587kwkkwJ99v1bGWEa6gpukn6WZXpZyxcKSYPARRKCjzpFi4GB4ql6oAxqhFP2tiPNnRG/0aeWOeBYzKl135UTY+T4RVDMOAR0HqNUz0gyrDXKmfAc571V70BPAiTrj/TL5KPYlK5Lbtjc21iEa+ptJzJLfApd+EQIQFCTFjx8v6ogYLPAuU6FwKoiHlbl8k+hGIJwaYJq9oxrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+4n/BBJs4hxg0QFauLX3+bmgtOiGdbyWeO/5BeRFIE=;
 b=f+u+Al92gO074SJmxiz4X/gd7AOpV51nZYzWWDs5DBQngdN03zPvP+Lsb/E64SLNlDsgAswgY2KbjJHXLNqh4Dj0d1LO+LXhYvyR7zQ+naarRvyDf5Klgjcmf6fzT9/by7LSVfq4dyf6pQq5Pi01MQ8sKVHr1f+0QTXNrlPSGRvaMnTZmHU6/bkUCz3N/flZNwlch5sNQqjpSGjaCtlySEBxTH4P7oTTuwcVQsan8wAQGdVw2V8cIBmsYPQFt06AsaXCtI4auXR4/taXtGCAxB691Q/jtmHiHjDAjMobPgtI5Aqd+AQ0BXbvuhaYOwAcL6VXZ8K+DJfrHWqbFEjOEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN7PR11MB297008.namprd11.prod.outlook.com (2603:10b6:208:631::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Thu, 29 Oct
 2026 18:12:33 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Thu, 29 Oct 2026
 18:12:33 +0000
Message-ID: <0f6c4323-0ffb-414d-92be-e8515e05ab0e@intel.com>
Date: Thu, 29 Oct 2026 11:12:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fs/resctrl: Return -EBUSY when per-CLOSID RMIDs are
 in limbo
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261029081513.924019-1-ruanjinjie@huawei.com>
 <20261029081513.924019-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261029081513.924019-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0229.namprd03.prod.outlook.com
 (2603:10b6:303:b9::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MN7PR11MB297008:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b235006-333f-424c-ee8b-08df35e83445
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|22082099003|18002099003|261028144727099003|56012099006|11063799006|4143699003|261021123027099003|10067099003|261026121527099003|261009223027099003|261022105027099003|261026140227099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: PROIyBT8pUVIAi3yIuLRsuGTKdHTosdDL92xVbgR9s0fZov7DBzjpu0n8sQCmK75whYgVhMUYFM0S5SFJxMM4hLVhLMyiCLbcls1ZNU7kgYgUZj4OMjyF3cmMzgPqSbx0konVGSOVAM+FbROLFKXLKOUaEG6F7GMWkyOacfjJil5Mpb9TD27Q7LKf/HWNjIJszyqnVQE7CNpusF9U0vI+5M1VVWg2b7T1Xqec4+23xuUd6UhpwN+RGqdh/nwxRjTz0U3jBgKOUv3kTEpq6jIfND5y8Lj9QY1/CBwk+TbizCROUlVEg989xMww97DQhc+fln7ehZN0lwtSiIcs7+DU+Dh9OetOdcGS+s+/GA1t1A/R8jWk4Z87cRe7RPSwtyOdnBgaR0/n/SKw6slnQScY33L9LFDhgYsH58ufFBzNzRzeoUSfpN7ls1UDPqTp8q15GIj0x4B4ZKpQUQ55J5vN1d0Mo4unTr8kvOOmE7auONRe8uVGanuQgwbLK8mGCCLiP3sdaNCs/p3ccVki4u8ON7yK6/yZxn+Ug2lRt9h1PgovgPedS4Pw3Ufm8TVuDfPssl2lp5W2OzZe8owaui0SdZRUVWb/rMLjL+7Uf0YwedGVU0D5PQgvccKbPrYvk5Q45XVg4yBzi4ow++OOulN1H6q+kOzAhXVJ/fW4IeXX3A=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(22082099003)(18002099003)(261028144727099003)(56012099006)(11063799006)(4143699003)(261021123027099003)(10067099003)(261026121527099003)(261009223027099003)(261022105027099003)(261026140227099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDVVZ2JjbWllcCtaTXlRT2labGdxSTNHc1pDYTJaWm1SbENnbXRIQmRLbmF5?=
 =?utf-8?B?L1k3UUdrNFVKczhGOW9xNTRya2QvSWcraXVBZ3hZbmtiNmpadnhUcHRWaXdQ?=
 =?utf-8?B?UUxXdEE0dkw0SG9LbDJhOWhCeUI0WW1UZGp0UEduRmMwSkpDYjhJTWd4Z1li?=
 =?utf-8?B?VTJoTGg1M0ZQeXMvd21TMUhyRnBBWlU0cXpVbXczci9KczA1OGZFOFNoTjVq?=
 =?utf-8?B?Z2haYUlrT283MldldjhIdEFPNHV1WFprbmp2Q2twMTYxcGl6OUZ2aVlRejNz?=
 =?utf-8?B?Y094M1RjbDd2eFQrdGhsQzBaZ1FTdzUwOG9PeHl0S1U4TGx6aTVWeFRWRkE2?=
 =?utf-8?B?K2JpNFRVQ0o2TlVxSjdWM0c4ZmpDVEk3aUpvdDIvNVhma1VmWDNER1F2Uk4y?=
 =?utf-8?B?eXliVjY2WWlNWjBzWlcrSlljcnQzaE5hQzFPUElWMkI4UWRWN2o1S3E5UnlP?=
 =?utf-8?B?WEkvRGgvRjNEbVYySTZ4RjIrcTNWTFpWWmxBRWxOL2FVaS93MVU5UE9EVEQv?=
 =?utf-8?B?bS85NXY5anAvdzJaUEZHSWxJUnM5VWM1cXVtNzN4ZWIvZEFURlM2TEppRFo0?=
 =?utf-8?B?ZHZhRmtpNmE1azZ0bzduMSt0eSs3bFArSEcrNUtRQVp2SzA5UXVQb2Zic2Mr?=
 =?utf-8?B?WnZ4UVFMd2J4T01WOHd4V0lXcnhLdThvSWJISGM0RVJtRHh1dnFWTjc1alRW?=
 =?utf-8?B?NkFXUDlPall4a0tHeFlhVUlVZmFjNjhteCtWSVBFODQ2N0hlL09sQVo5dTZW?=
 =?utf-8?B?OFhqaCtVdFhhczV2MHNHU2FDY1dDVmxpSDNtaytVWHUxanp2ckJmSWtvZURR?=
 =?utf-8?B?Smc2TVFWWEtzdkd0aTZkUkpTOGpqVTNsWW9LZ3RxeFVoTEZxMS9lWmRRMGNO?=
 =?utf-8?B?VkwwYUhPb1kvbW0zRlo2bVArUXp4ZG1VV0NKZk9Da3dCZE5GUzF1RS9zWnNJ?=
 =?utf-8?B?d3IrQjAybjQrZC94TFJYT3pEcVRuc3lQU3Y2Z2QxdHRlQnB1RFAxRzlyUDVo?=
 =?utf-8?B?OUFzTzhINEZYeXBSL014ZFJaTmZCZ2dIZ1lLaFA2TW9tbEI3NU9RM3J6SzIz?=
 =?utf-8?B?MVNJYS9WWEluVkRaWG9ia2phbGxZV2l6Q3RPVFpXWWZCYnpBTmsrUFlLZWIr?=
 =?utf-8?B?dXhNZ1dLSGFyY1JHWldjd1haZzFTb1B1bjNhRk1sRXhuNlBka3lncDJ0VUpy?=
 =?utf-8?B?elZvMkRuNG4xRjBxWlpFdXNTeXByZG1VcTBFell2OHFZN3c2cWpIbTdCQ3hE?=
 =?utf-8?B?WDNJK2ZXTldIdkZCeGgzQ1FsdWVIUG0zTDcrTDNYMFZhaUhNaEJ5UFk2Tk9p?=
 =?utf-8?B?eExJOEExbGlMK2VqT0wwTEFBaG5ocHJiU3VOQW5hZnJTVHBVSHFwUGM0V0JY?=
 =?utf-8?B?MHVtbFJiVlRaSTQ3bnNFUFpxRTJEVkNzMFR6Uko2TVV4Q0JSR3MxWDZTSUl0?=
 =?utf-8?B?dzlaR1k0amtsSmlxS0RpV0RVbDQrL0hJdDBRUXNWanN3a09GdlI5YUZhT0l2?=
 =?utf-8?B?bE5WMFpJOFI4K0FjOFIxWC9PUTNFWWtuZ09ZRzBQc1dIMFBKS1FhOTduNWNx?=
 =?utf-8?B?MStSalhBbGgzTWtvcnJZeTVMK0JRVHppdzIzUUdrT3JtbDU0djM1ZHVyVW9Q?=
 =?utf-8?B?a1RPeHRvd0dkeUFnUHJIUkJvTEpYNzhVNGhOZ1VjbVo0ZTJpb2VQeDBmNzRx?=
 =?utf-8?B?WkNJcjNVZ0xxdkJoVThXbUw4OFdwTVNnSVRLTUozMnZGNjVSUkl4NVA5TytU?=
 =?utf-8?B?eVN0aWlwNHIxU21wQVE2SHdpUmV0aklubnlibS9wZHpkOEh4Yit5eXBNWmNu?=
 =?utf-8?B?cHZJYXZTYzR6Unl6dW9vNDBCeWpQZE5aM3ZveS93OVJOWFhQUXJkU0U2a2RQ?=
 =?utf-8?B?NjZmMEtIdGJzeEhaMEluMGROUEFyUHRNbHhHQjBGN1dvWWpnWXQxb3JiWFNz?=
 =?utf-8?B?clp4MVNlOXR0ejEzaDJwekNrZVcyNVh1MUJwK1hCTjhYdkpUTG1xZ281TGNM?=
 =?utf-8?B?cG8zdWhlaTVBU0twelFRK2I5Zms4RnJwd21HbThUR0dOb3k2Nk5SOE1maktz?=
 =?utf-8?B?TVZOQjdpYmduMjIrZlJLYkp1VGd5UHBKenRSMmFJWnpxZnlucjVtelNWVitk?=
 =?utf-8?B?UmhKNk52cFpaMklnZnYxQWRobFd0RXhLM245cVQ4Mk43NWROcnFtV0RoaVlM?=
 =?utf-8?B?OWpONFJsc2h4by8rMFRTcndQd0Y2OHkvaFlmSW1zWk4yWDBOZnFJS2RBbGNs?=
 =?utf-8?B?NkcyMVdIdzVTQlR1V1paK0JrRmUyaDhKOUdiNWU1Z3g3NlBEdWlWbnZMait0?=
 =?utf-8?B?amo5U3lwekhJL2JDa0Y4OFdRbk9wb2tmWFV3bnBZelVtcVRUU1huY0tnTVNM?=
 =?utf-8?Q?f0rqsHkQCfHFHWPQ=3D?=
X-Exchange-RoutingPolicyChecked: twS7IqgN6MePU9aFzWChQPk/P98L7LJukZ6H0e8JoIGPwVgl1sXy0OV/sO4mIg4dV21KhX/EL1v4iJAxtQ3ZvB7RWj6lk2Db3qeJIpSooCk9lgRFu2PIL/5N83GJEgh6V6WPrL3gVjZIqz0tAv9zd7JOnDbTeq0T/ZVyvCu141uXH3RTJ6U7T3cltR5vtXXsaMCYfKLADxkBnntkyURjTxe8yjck4U/7J5GeuH0Vr9fA/iJqvtnIpas6tAz15zx2UK6DpXPbjFM+cY6OU7UNpWmUocXwftdk+ZU4Mc1H12NvHfrd+pW2h5TEvRYcB74AKOW1lRHH+3jbJlWg7pTl3A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b235006-333f-424c-ee8b-08df35e83445
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 18:12:33.6626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oOYOLzd0h4LN3qMtNpG8+FdoQ20EaRGuq473yZhprs8xdLY4zUHt/MZpzaFTgM7GPyRDUuu7/svgikqOD4KiTDleUxUoxfYKpfglNgjhbjQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB297008
X-OriginatorOrg: intel.com

Hi Jinjie,

Thank you very much for these fixes.

On 10/29/26 1:15 AM, Jinjie Ruan wrote:
> resctrl_find_free_rmid() returns -ENOSPC when no matching RMID is
> found. With CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID the target CLOSID may
> have RMIDs in limbo rather than permanently exhausted.

Just a quick note about customs around resctrl fs and x86 patches that relate to
both of these patches:
  The resctrl patches need to follow the tip requirements documented in
  Documentation/process/maintainer-tip.rst. Of particular note is the "Changelog"
  section that needs fixes to be described in a particular format consisting
  of a context, problem, and solution.
  Apart from this the changelog should avoid narrating the code and instead
  describe it at a higher level to support understanding without needing to
  refer to the code and the impact.

Even though the changelog mentions CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID
it is written for somebody very familiar with the code and it is possible to
state the impact more clearly without needing to go look where
CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is set. I also think that it would be helpful
to describe all scenarios of the issue to help support the shape of the fix.

As an example that aims to address all comments above, consider a changelog
like below:

  fs/resctrl: Report a temporary RMID shortage per CLOSID

  An RMID that is freed is held in limbo until its cache occupancy drops
  below the threshold, after which it returns to the free list. A
  request that fails because of limbo is thus temporary and worth
  retrying, which resctrl reports to userspace as -EBUSY. A request
  that fails because every RMID is in use is permanent and reported as
  -ENOSPC.

  Where an RMID is only meaningful together with a CLOSID, a request can
  only be satisfied by an RMID belonging to the requested CLOSID, so the
  distinction has to be drawn per CLOSID. Instead it is drawn system
  wide. -ENOSPC is reported when the free list holds no RMID for the
  requested CLOSID, even when that CLOSID has RMIDs in limbo. -EBUSY is
  reported when the free list is empty and another CLOSID has an RMID in
  limbo, even when the requested CLOSID has none. Userspace is thus
  told to give up on a shortage that may clear on its own, and to retry
  one that cannot clear until it removes a group itself.

  Architectures where the RMID is independent of the CLOSID always match
  the first entry on the free list, so neither case arises there and only
  MPAM systems are affected.

  Draw the distinction from the number of RMIDs the requested CLOSID has
  in limbo where the RMID depends on the CLOSID, and from the system
  wide count otherwise. Drop the separate test for an empty free list,
  which the search handles on its own.

> 
> Check closid_num_dirty_rmid[] for the target CLOSID before returning
> -ENOSPC, and return -EBUSY so userspace can retry.
> 
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")

We should take care here. Even though this "Fixes:" commit added support for
RMID allocation to be scoped by CLOSID this issue only impacts MPAM systems,
and MPAM support landed after this commit.

Do you think this needs a "Cc: stable" tag? Have you heard complaints from
users or is this just something you noticed? Having a benefit to users may
be sufficient justification for adding a stable tag. Accuracy of
"Fixes:" tag is then very important, or the stable tag self can have extra
information on which kernels need it.

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Please re-order the tags based on "Ordering of commit tags" found in
Documentation/process/maintainer-tip.rst

> ---
>  fs/resctrl/monitor.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
Patch looks good to me.

Thank you very much.

Reinette

