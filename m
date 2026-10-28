Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793223014;
	b=nx984ijuIL6cXtk8Yv8M0n2ndk9snjFF5Uv5BiYrlnxCQNuBu0QbLgwexv7oYGZ1z5Nm
	 U1P4fYVjovvLYzO2pJwPJGConfZa8YCaLDW1F/J4QEedFn66BB2IpPMKGewLUXyB2w0Pm
	 xA0EdXMs7QH51ca2Ca+vFO5uzIYsYyuLa1mjWnzW6JynFnHZUaCUGBoqqZJBYYlGdWzWX
	 kg7XGUuAxirCaaMHbFFxPDtD+x6FjpoxZblqv0LHRjWVOfy2ABFprvbQC3nwMp96tzlbw
	 /t2UO03FLqaxuli2L9PbtZkZgih3pGSVCzUeazag+E4YNVWZyjWvimpyD9nmkZ/X1Lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223014;
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
	bh=0Hw6TmD0abP1I9DTcU2L71b+4GQuHbGhC5hqorcLrZA=;
	b=M1ZjL2mEne051x5iidBaJN3MRvNbiezifsai+Zrtt+I9tFzOK4LQkNfJfMRAVjoLOkks
	 uDXepZETvyLxHVadBYq3A2k5KUyrpoipZPt02VXxlhr0l18GHNYBV2eCQUC3hNwuQL4fO
	 veN4UUJX1hbgKNadCX5UEGqm5ekMhkIxRLAxIoLkm7aB3hhmjd3ahXSHliaCyRmdMnEUt
	 bWtVFlnKW584GiWLYJSFsyXnWhg0UsG0C/nFl46ywiWx+u4J/zIIPuwoc01ohFLJi2eWV
	 3FhSosgZZ5FGAKk+XZLzAjKlTGGdclUKqlZtMzXs8eSTWwXeIRGdXuEprYnffzoJ16A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TShL3u0S;
	arc=fail smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7B606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6A7B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TShL3u0S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793223013; x=1824759013;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=0KUFReeCPIU2ZEIVnUPJyRA1PwGM1xQzToNxgkRaaic=;
  b=TShL3u0S2CW3PQ/zs6jEirs8U9Yig8Qc3X6Js+MLn+ALmp2A+zJoWz/6
   W8x6TR5g2ZhZoTI7CPvNnAfKyEl5R9+K9uPChKygS5DH5fjifTaGVdlp6
   6nUzmGFbH5G+c7iEGbvFvKQN1lISAu+DTw/e3EQEL48H/hcNBFApKYiHG
   CnBv8vnfDCPxZUdrRy0ydxOj1Kd9bEaJ23jFCE+S5UVKFokBntG06x5je
   eaCWIuTOLQCWnaGjOHE+tRFfTCc6ZdsrCNoHfi9jnAEL4T07gb+dpCOEa
   ptLsVWGJ0keHAEuhtCW73NiB6c9AWQCgH43ojU5Nol+zCGoqgPJ0bHXiJ
   g==;
X-CSE-ConnectionGUID: abOVjTKIQL6fM9p/tlqFuQ==
X-CSE-MsgGUID: aLo3Vvf+T6i9BEQzvI71MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1850556"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1850556"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 14:30:13 -0700
X-CSE-ConnectionGUID: 0vlV7tjDTaWL6swHbah5kQ==
X-CSE-MsgGUID: 2M6PBBNwQ3Sekfe4YtBGSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="4969120"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 14:30:12 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 14:30:11 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 14:30:11 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.44) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 14:30:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y0Rq+mW7LmLEK5QohiwJNtQuwwAraRErOCzYFD5zyaEFpN4SBdHNNVR4A0ZA8XTHFo42gELWGkA3fnZOqzUc5r6V9Cehe4immkL7uHxAErFe3juw+2RMVROk/KAnlqVJ3ZTjgmUzzM0SVNwPoYgs++sAK96FotEPklPEIXXg4hAL8Nj+HtMDYeDZMpUXFr9LPkfGOqQjwG7JUWaZLZj+yiy3HCWzZNbr5XxWOiM1mtuiuUeH22pZ6aiMOsbfuLtyJw/oeNuoLczL1kyGcAwdqUvzz9dpIGaT7X+GSDpyG3wsFSWLJCyl6iWTyxmFreyNqIv7fRoLUQDaLjDeaOqCRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Hw6TmD0abP1I9DTcU2L71b+4GQuHbGhC5hqorcLrZA=;
 b=WLOMGBh8q7K7IwB1fGnttXF/OHkSxc8Q0sIa6Rpr4/UdPVr0Vjz69zJT8K3YNxRueA5p3046HVAnmSox/vhoTE3TR8g7UBWsz6NFJLPGgGxOFVHGaSuFOh38D/nEUvLco6/Pd1etLQDPns/zTrZmFoPYsClYzhCiPcpee3UAcmH0xwQ9sNSpNDVbptZnhJMlrw9Tal+6oz/GOdJElAGAIJre1Hm7zAK1TFP1reXeuMaMWiOroljNPLukOVuE+jmo6pESQ+QCbrDhrisqzfANIHDUvdtD18in7zfhAsZ2UMr5q8JDUkxR/CzvRGABtWu4XrrW/nbRHBV1Rrk1LC7GJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 21:29:45 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Wed, 28 Oct 2026
 21:29:45 +0000
Message-ID: <7bf71a63-fb7d-491a-ae27-b5b72c7a0edc@intel.com>
Date: Wed, 28 Oct 2026 14:29:43 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 RESEND 02/15] fs/resctrl: Skip monitor context
 allocation when force-freeing RMIDs
To: Jinjie Ruan <ruanjinjie@huawei.com>, Ben Horgan <ben.horgan@arm.com>,
	<tony.luck@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<gshan@redhat.com>, <catalin.marinas@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-3-ruanjinjie@huawei.com>
 <069b920d-b1f9-4074-aee0-1607860dac21@arm.com>
 <a27fb58a-563b-4c40-8be2-cc9d05f24279@arm.com>
 <f927b065-3a87-44ec-b092-4ddff877260c@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <f927b065-3a87-44ec-b092-4ddff877260c@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0127.namprd04.prod.outlook.com
 (2603:10b6:303:84::12) To SJ2PR11MB8370.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|MN0PR11MB6254:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a764276-dddd-4fc3-1eb1-08df353a963b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|23010399003|22082099003|18002099003|6133799003|261026140227099003|261028144727099003|10067099003|921020|56012099006|11063799006|4143699003|261009223027099003|261022075727099003|261022105027099003|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: Ztvl59HWxaJuHN+xd4ENeM3wk15e0QskV7IwNl22a1iuoGyAVi112901UTceMXV5J3CQlcawwGr6e/JuXBJnAcwLIxIC9fNlBwnTmDo6x1GylCkWI6RcrPXmiOS2h7+sC31oxGRj2mxoYFHDslGprOXn5GLmsnvkTXBc01iGf1xs/ATDh2AhemXsV5kr/SZDH9P4/ZaVn1doXjY9jPGNT1bhMNcrqgPyFhVTPnU7/97zq2fqqf95zpx55jZsiEv0g+blR0kkrLb9c2Dv9hOlp3MEbZepqjKagnUcGfGKhoowqmZ9CVqTFdO+MwAG6S+h2ckuW7XphUnTdcvMl5Q1sd2ahW85iG5AeW4tBQ/+GEU4QLKMiyyX17Tx/TDVac3xQ19MzsUL05rSwpHk1LJyqbzQ/r7r3ogsH5q761FN+C2+yE+fOz7bAAGPUoNfiP4zDX8h7pu1vBnfZGarkvoF4phsgG1F4zORISpTPxNYP/4h0rlNVTIWfqjCW5B6y0kstAu1qK5LhqYwndtbXtFJ775j8dIZ3yn8+blotO/MHXzWk2kFQA3wmGu5MUVoIpC9kZqhvOaO//CeFfOnqa9gsNw69kHL461cOQPnnwWtVEgd302us/vzgIW4Lr6nog8hF5t0nyDgkYB/KZB1MgTzUnpilrHemr8KtYHcrWsBQhPcaVrIOH6afqT7Md9nHxBntBZNpjUrHdslM519JNz+hg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(23010399003)(22082099003)(18002099003)(6133799003)(261026140227099003)(261028144727099003)(10067099003)(921020)(56012099006)(11063799006)(4143699003)(261009223027099003)(261022075727099003)(261022105027099003)(261026121527099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjRoaTcydGpQZkRuTTYyb2RyN05nRHVCdFc5UVJkdVhLT0FBQzdjNXhLVnNK?=
 =?utf-8?B?OU9scW1jOXFmK1A3bUk0bTVwREdYM1l4Nk83R0F0WlBUM2o2azUrYStZR25z?=
 =?utf-8?B?aUVTNjQ5TEhXbjlBWGkxR2NwSkdncnF2Uk1VV2FiQ2RZYzI5N1B6Y09uaVNN?=
 =?utf-8?B?SGlzNDl5ejdKUzJCWXhzaXdzK1h5Rm1DN2o4WEhsTVRzdTljYlY5THUySkVm?=
 =?utf-8?B?ZTZ4clVUZEFybnk4dEhtTmI2QkY0NEs5Z05URGl1c1pIbS92d0RDSHd0ckNa?=
 =?utf-8?B?SWp5TTlFdmJWUjFvZkREQktUa2liVmZqYkF3ajBIc1NxNUdsNXNQcVIvbXl3?=
 =?utf-8?B?b3ZxaXpjQkFzQTRONkt3Vy9JTXZCWkFxTVlwWU5GTmppbElhaUt5N2dOSVBu?=
 =?utf-8?B?TjIwck9GMmdxYmpBUUQ5RVJIZmQ5cVpLZmtWaE85MmdvSVgzQTFaVnpLejRu?=
 =?utf-8?B?ZmdLWEJ5SGwxTmo5c05DSHpSc1Y0WGxBbTZaMVlnWnFFeHNTWU12RnRSbmY1?=
 =?utf-8?B?M2YvL3NKbS9zejgwQzAzMC9CKzg4M1NkbnN0Q1pobGhmNGdBbE1zazdKU3hq?=
 =?utf-8?B?aEdyVFV0R2hUREVBQ3F3a3pXZDFmYUNUeGcvdmQwaXc0UGE2MlR1Q2pzd2k5?=
 =?utf-8?B?b2dBTGJIbzN1NUpmcnIrd3IrZlBDZzFqYlFSZjE0NVQvbFlDUUFodmoyMnRr?=
 =?utf-8?B?aEw2MC9VdmRKYzBKa3ZUWmhzSjFWbk1IRmFockt2ZnBlbnlDLy9VUWdqSjA0?=
 =?utf-8?B?VkdpRlAwa28vRTlBUFFNWjIxb0JQb1FiL0xsTkJxdnFKdVMrV1FORVB6ZFdv?=
 =?utf-8?B?QTlUdkIvYXg3U1J0aUM4bFM0aHFSb1NjVWh3cm1rQjNKa3VLZ0lrdFY3VlNR?=
 =?utf-8?B?WEVlMWdRUzRjOFFyajA1eUpLa3VkckxsWHFaU2NlS3VobG10VHRwd0NQNHh1?=
 =?utf-8?B?ckhmY1ZiVUpYNTFUZGxva2x0WXRtMnFlMmNBR1VlbmZtT2xteHhSbzkvVGJM?=
 =?utf-8?B?NVFhcVZHWmFJWkg1QzBTUXRWNHVnSHljQy9vZjR5eUpraElUOS8xTi9BSGlu?=
 =?utf-8?B?WlJVYk8rK29PMUtkOG1ISzRDVTUvbVJOOW4yVS9nTVh6a1dPNDVGbndTT05h?=
 =?utf-8?B?eXFUZndzMWZGUmg2ZDc5SXVZM1ltU2MxVFVHdDgzV1RibStIOTR6dFVkNU9K?=
 =?utf-8?B?UFd1NlFzeFM3WUM1bmYvSG1icmVGT3dNVHZKeG5uMGpHUTlFL3pnUXc1aWkw?=
 =?utf-8?B?dHpOVkxlVThabGZRdnpQdVlOOVdKNlRBSEpLTTllK0dpa0x0ZlJMRWZadHgw?=
 =?utf-8?B?Z3FmVFFqUUVvRTIzUTdmekhNTkJMS1Y2YmFEbkUxVDVEY1VJODB4RVZONGJt?=
 =?utf-8?B?Ni9DM0FZdDlkYWZONTFkbktaTGV2OEhGbGdRNUxQZnVWWE45N3VweXNaQStY?=
 =?utf-8?B?QVY3TFNzTHFHbXhZc0xUZGhmcDRXaWpPenByZGlpRVV0NlZlQ1hZZlRFaDc0?=
 =?utf-8?B?OFdGdXhOY2dzUmNXZURiczlNYmZzaDNsdjh4cHF5M0toTkFVMkdMWFd1VGlD?=
 =?utf-8?B?MDFrenZFek9xUFREVzMzTTJGaXNLaXZHU3pud1VFVW1ETzdOMTlMMzRXeFNm?=
 =?utf-8?B?RVRBRkhYTTZzOEpwWDJuYVBlWHc5ZnpQTkJhSTdiR2ZzdS9hMG95SkY5MmQv?=
 =?utf-8?B?MzhVakpxakZ6Z3N4OU0yVFd0NTdVVmpsdVhWaVV4YTN1SndTVWVQZUw0aGhN?=
 =?utf-8?B?UmxKUlV0YS95cjVVaG1rbjJ4cVE3QmJ6QzZMa3BzWEVYakszU1N3MVpIR1Vu?=
 =?utf-8?B?RXVPdDJJUnNHd2tNekk2blNxdHd4WjRYZWtDRDZ3blpSc3RES2FSeThmUUJo?=
 =?utf-8?B?MzlkUlRkbUNTSEsvRGpIOWxBakZZUjJWeTNlOUExZUdGYWhNZ01wSkswZHBX?=
 =?utf-8?B?ZGxTUmxONlB3NFFFRW1TcGdRenpXV1cxSTZPdmlkclk5V1dEZytwdmpuZ1Bj?=
 =?utf-8?B?REJ0NGIweHYvQkpVOTIwZnhWeWNQYlcyRmZGZmxxQXJkeEVjMkVlR1liR0sy?=
 =?utf-8?B?YW5jR1BMckYwVUJTeW5Bc2tKTUlWeSs4MHVsdzREZHdjaEF6USsxa0ExN3hF?=
 =?utf-8?B?NE5tNUplbzRKZXFxYnJTSmxqVCtCM1ZPYWM4c2ZwTEQ4TVlNSG5WK3BOZFFv?=
 =?utf-8?B?OFM5UUhCNVpCRHZIeXFHQ1Zxdjg1dGxhbS9odS9lbURxbFRwdTJkcFhFeFdH?=
 =?utf-8?B?NGs5UDdYNXU3VzJ3ekcraC9vSWZVMnNrTXBycUpBVGhzVU0xdHBEcGFXNHgy?=
 =?utf-8?B?UlJYTTQrSDYzUjFla3hQQkdXTVdpWnJOVDhoQ0ZCeEFNVmllTVZRVWdBR2ZM?=
 =?utf-8?Q?93vpU87lnxIX5WWA=3D?=
X-Exchange-RoutingPolicyChecked: jyNv6p5c+Z/ccraoqELYmWi7ZwIJHqed9VAQ9zi6rL4wJv53/o/K7DdqDldvaS3VPBPQJk5rqb+XddC44oH3GjNVxEfUe0BMUwl9TbutQg27PjecyFO83W71av2Lb4B9KZGqt8zRH6ggu8ETUxASBwgKh+lTQpTO0mQRiMp+dzcCVcPtvLXNixtMTVl5+A4QcVy+nh0abFzBUmfwjKsuYer1XbiaikOH7XIs/3i0T5d90kWiv68dtMOy2Ysq5im/WHz5bZZUjAxaNNEy5xpqUwfYrESr4iWEJvYCVqfTWCS0C4QCCz2bFco/H/JWdLzGbqEtPvca1HjKrEeN5r3r9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a764276-dddd-4fc3-1eb1-08df353a963b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 21:29:45.5510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LFAWpYvvNYhVlpKtEJiwCa4IG6yRN1zLmebBwosQDFYQUtWRmVECJTfEWcVSz54WNiGGq3+zcIuS3M90mKjkiKxYMpXCjHnBGdfx12BRH+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/26/26 6:33 PM, Jinjie Ruan wrote:
> 
> 
> 在 2026/10/26 22:11, Ben Horgan 写道:
>> Hi Jinjie,
>>
>> On 26/10/2026 14:08, Ben Horgan wrote:
>>> Hi Jinjie,
>>>
>>> On 20/10/2026 14:42, Jinjie Ruan wrote:
>>>> __check_limbo() allocates the architecture monitor context before the
>>>> scan loop, even when force_free is set. The force-free path never reads
>>>> occupancy and never uses the context.
>>>>
>>>> If the allocation fails, the function returns early and leaves the limbo
>>>> list unflushed. Callers such as the unmount path then silently fail to
>>>> return the RMIDs to the free list, leaving stale CLOSIDs in limbo that
>>>> are re-interpreted with the CDP state of the next mount.
>>>
>>> Is this a theoretical fix or is there some way that resctrl_arch_mon_ctx_alloc() can fail in practice?
>>
>> This does seem a good change to me and we do have to consider that the memory alocation might fail.
> 
> Hi Ben,
> 
> I agree. force_free=true not rely on the allocation of arch_mon_ctx
> succeeding, we should directly loop to free the RMID.
> 
> Perhaps a small refactor is needed to split __check_limbo() into two
> versions as there isn't much duplication?
I agree that a split would look better here. With these additional checks of
force_free the __check_limbo() is becoming hard to follow. Even more than
two versions of __check_limbo() this could just be two distinct functions,
for example a new "void release_limbo_rmids(struct rdt_l3_mon_domain *d)"
that is only called from resctrl_offline_l3_mon_domain().

The changelog mentions the unmount path but it seems that the issue is with
domains going offline instead? As far as I understand the limbo state is not
impacted by mount/unmount.

I also think that the "Fixes:" tag should instead be:
	fc16126cc11d ("x86,fs/resctrl: Prevent out-of-bounds access while offlining CPU when SNC enabled")

The first two fixes in this series look appropriate for resctrl fs. I'd like
to echo Ben's request to submit them separately from this work.

Thank you very much.

Reinette

