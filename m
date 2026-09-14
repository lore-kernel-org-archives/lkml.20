Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7314028F2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399919; cv=fail; b=aOIrlpoM6VZGa+t7lMYvW2JsndbR9qu/ivxPY+erClFoc6wjerX16s6RsCTyvtMx7C6CtSv8BzmawKNuDVOypjIekfHWH1/y/z8bLyMGAUe4AGUBe+losRl2KiH9YocJsOKZcaBWp+Ej6zZ2d2fjHQx9K0qipJ0oy616PXVeUSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399919; c=relaxed/simple;
	bh=fSW3+wuyVx1JPIQfFDwWmupp9ynwYrPWDu91uDjW8vQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L0MUKwtJor2+g2hbwoZ5x8AohRf9b3P8Jq5xQafAbYE5xiS3uuHX1qNhvk6r5eD8XbYSkyUbRi3RcgnSZOsYDG1MVoeQBsnLbt3n3NWeEax3DuT0x75qY73JI4//0brkGtLdRUgIIeiEAYuqPr4QZuEVLLRhVHyEeGZkwh9kE+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ghHUvqPq; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ghHUvqPq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789399917; x=1820935917;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fSW3+wuyVx1JPIQfFDwWmupp9ynwYrPWDu91uDjW8vQ=;
  b=ghHUvqPqQLivbC1lL2VVbCMzxxXY7cedr0LNJ4DYKSCXfXCfEWHKSIya
   y1YOca+Rx1ASeJ+94xXlunEcaBt7jHHOlZUF4LNgs0jcR0/9pi0z9wNLt
   UIk80VnnxBPKSmqCgCYeBWTeiUK105Gwycdez2H7hBOcHnjlrrN9h5UDD
   cNHhtqX+pBU71HFMwb7C6slGxECXo7H4PBdJ3fS6IDdaThU4LYDXxssXa
   YS/rTgAA3wIQd0YNVYqlYXPjLLqRWGxTiBdfWp/KsViEFSt7a5Qht0hro
   aQvFsulzWVvmHqcKSvMpptShKYllMH5zO0xdheJEA1VTtiUGONzcba47V
   Q==;
X-CSE-ConnectionGUID: si184pYMTKCGdAgxq6khtA==
X-CSE-MsgGUID: Obcp2XoXS5OLG3wduYC1lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100415620"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100415620"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 08:31:55 -0700
X-CSE-ConnectionGUID: 8mXmi/X2ToSYgRcQhtez8g==
X-CSE-MsgGUID: d6s+8B0SQXGIcjhVINgY0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273188976"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 08:31:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 08:31:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 08:31:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 08:31:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pqtSq6sXrq7OVWfzgEC8sA7x/jaMBQm3Z6qSqE5/I5/sYGzp7R0A9YbYvApDgAs+qQdr7ldtNGpoSUx6VxSlDla2ndIuBfAMTQqsbfDw+A2DWlqHTaXsFn5DpLEztXF22/Xoay4qmWMQUsmQQzgu31ZDwt+3KGAlmREjtUmMhS4B8/3+IeOqH9rGUhkyDwwNTHv5J9U4Ry9TGOh79LNExlfIhZUtLWBafn5wEMQyLmEkHDsradc26CLNduRNZrbxw37VBTA+BpEis7ve+6Cu1ZDRLgVxkd2KKTe5LVTyJnmQwESAzlJ7nTDVN8vzfa3wpwK+jM3+Tzb+V1mLRGmgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mgqh4xxo9Hsz8A0A7kVd7TDQ+W6s1eRNl+cCZHfwME0=;
 b=YOpZqo0UY2slGSjn4DMeQSias+R7XkNMcSsA+YzFfy5TqamAAXMGx41JkQU4NzFeG/Cr25yeJChRgPGIBzfneuw3iAZIgLCuXAL7M8c6IJ5D0d4i8Mltfxl58hJ6pN2it1SxApAadYnCsMhi6nr0LVBm5EQdYWp7kB2c8LtHPz/qEd6HJKZMkLnt3xMeIMytt8KzxOl5j+vdB79j7eb9677eRtDdvQFmffyG1SaOBlpWm/BK56gQ0vWkU2abWDTBolzI/JzSomKKvkU9TtQHdLvemml8ubb//LZdLqM1XVPbqzRs7eNX4SVXGlFNePiDtUzpmdkmFKIFniUBlwU4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA1PR11MB6292.namprd11.prod.outlook.com (2603:10b6:208:3e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 15:31:52 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 15:31:51 +0000
Message-ID: <a2fc3eb0-7b64-474d-adc0-1cb3d4cf17dd@intel.com>
Date: Mon, 14 Sep 2026 08:31:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] x86/msr: Switch users of native_wrmsr() to
 native_wrmsrq()
To: Juergen Gross <jgross@suse.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Tony Luck <tony.luck@intel.com>, "Dave
 Martin" <Dave.Martin@arm.com>, James Morse <james.morse@arm.com>, Babu Moger
	<babu.moger@amd.com>
References: <20260911075216.3142309-1-jgross@suse.com>
 <20260911075216.3142309-2-jgross@suse.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260911075216.3142309-2-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0154.namprd04.prod.outlook.com
 (2603:10b6:303:85::9) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA1PR11MB6292:EE_
X-MS-Office365-Filtering-Correlation-Id: 203eaf3d-2f04-42b8-e6be-08df12754bfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: q/90mebGFU2a4pmaSkEYtRAX+Z7hcjfwXMtlMexv/AcjbBHnMOE8o+/bzVmnusr3F/F6qGHq2rNwOqu0wnpDhD0rib0DMk5FXQFNI9C533McSV04VFLsf7fCWEXt2v4S37yvmUd/qgpQL3ddrDy+S68mN5wM3Mglo+HIMwUyG/Za8TtsfO4U20dMxOA2rF105r8H33w48GmLnYLJolfttKhYaH2wV0Eu1GfJsoYqYClfEsl4qm8yIDHyZDhO8x7MItpc894T83Wd7ci7RxaAnwN24D29P5tab7q7yLRATGg9JPOasHOYSAiv/iQkG8YxwkLidT8/Z5zOTmp+XUZWjifgEN+5OdmkTf0QVFBFpCJ2TCTKQJBG3KuaPDOpOHh1IEjET/4sKVPOAojA9cs9BrYtLpBuRCvyMkexX+Nb/pSLxDNQkv31kCXX9Xr8KyfLgDT9/vq+wIkD+KAHUvu5uSGvGRdBVJB+pfd1VucuG6JCn0K0sJLyIMS5nrMGuUwxtVf6TZK3CPM1j6lRkhOEpQWGpv9nCRhDIGLazNJeK8LGcdsRFKnSwEpxodZsyIWgg32EGcRmk5Z41xH2VcqiYIQZCAd9CdrEZ1Av1UNTt2ynFpa2LgvqX8olOGsy4DqGXR3TQSK09fW+Pz1HNOUfVQsrkI5XSh71i15bCAHA9dA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eklYajc1ZHVKeFNDQk9Dd0NRL0ZTQ3hTcUp6WGFjKzhPYit6Vk9iMWg5Z3pQ?=
 =?utf-8?B?aVdRK3dsZDlmY3ZIMDdFU1B2eWZ6UVZBSFE0a1BWSy9hQ3dFSTNkNUluWC9t?=
 =?utf-8?B?ZHQxUEVFWjNHVEVWcjJHbjlTNTRwREQ4YVQxMjRYNXhoZHJJQTYzYlVsZXFp?=
 =?utf-8?B?L3V5UG41bko4cjJzQ1g5dEdrbDE3YmdrcFZRTEZwdjlKa3NFSXhKdWJiNmp3?=
 =?utf-8?B?dG9uMFhWYWJtVzZLVWhuMzAxaFE1ZDRpR2gxY1JZa3Nnc1FvenRBQ1krZjVH?=
 =?utf-8?B?YUVWUExCZlE4L1Y4eFJUMTRWaUhtZUJVQ0xRNUlEamJWNUZTcnZscUowcW1B?=
 =?utf-8?B?UURET3hGd0ZPZEdiOEs5aWpvRVJDdzVuWTc2MWtYV3BYTWtEUzFEYUMxK0JK?=
 =?utf-8?B?Z1kvaEsxVjVYcmhLRmFSTzk4UksrYTRiSmRxcnNLRkgxQTNSWHJBdTloaTNw?=
 =?utf-8?B?K24vUWtoVnN0eGkxZXpDY0gzdjl5MmdWRkRUNVZMb3g4TnJlSUFvWVNlc2lL?=
 =?utf-8?B?QVU0K0wyNHY1T0dpUmNJbVZVcVlTTkJPN1dEOUtDWEwySlNuSnRGTmdENDhw?=
 =?utf-8?B?c0o2TGREWEh3Si9ESTZtZmtDLzFNRHJ0dTFXb1dDeEMwQTl5elNDRFpPUG1R?=
 =?utf-8?B?U3RlTlA0aDRwVDdOZkNLdjVzVVJEQTRoS2c4MzkvSTgvcGlaT2FiQ0kySHRG?=
 =?utf-8?B?bllWbGxNd1VtVFppdHlPUFNnVEk3V1VQN0RjcjVmVGxPblBycVd2ZHZqL29I?=
 =?utf-8?B?eS9UWWxKV0wvSzRiVWplbFJMV0xCZHE1WFNyaHZIZnhnb3J6bnBrdFVGNk55?=
 =?utf-8?B?WWQxUkZNRm0xb2Urd2gvWHZFbTFQMElKUHB0V3RDZ2lFZEVuSDlrdUxYYmZ6?=
 =?utf-8?B?aFZnaVRqQkFOdFZTSlduWHJ5bUZoSG5CNW5zME82bE9nQ1paTGlINmRPQ0pJ?=
 =?utf-8?B?QnR1UURkR1gvVlpzbkVheU81SVFIYjN6cUZ4OHhCM2ZOeHRFR0pIRjZzRk5o?=
 =?utf-8?B?YzhlOU9pUnFMcHZYQnRtNWQrcW1qNHMzM3drTG1OcVhyK2UrU2tRZGV2b3BU?=
 =?utf-8?B?bklLc24ybkhjS25mODFMay9QbkQrNTdMMm05bHI5Wkd2VlRMV3l3MUhWK2Yx?=
 =?utf-8?B?elROZjVtMk01NFJaYUw0dURKVHd0a3IwM0duTFQvTCtBdTNKVmU4YU1Hc3M4?=
 =?utf-8?B?cHMvaXJEczhHUlIvcFgybCtKbVNWTWlUaGhNVEhCK0QzcXUramhWR0JvOWNR?=
 =?utf-8?B?MzkyMHcxQWwyeUkwRU90YXppaTBXcFQvZ3pEZTJhaEphMzR4ejRINGk1cmN5?=
 =?utf-8?B?cjNMOEdlUWVua2wwelpFNUtIVjB4eTlxV1BaVHphWURqVDBzUkJablcza1U0?=
 =?utf-8?B?SUxsajhTM0ttYVAxRHhRd1Q1VzhNaFZsNTBmSGxmSCs2TUdnS1V3K2NaeFY3?=
 =?utf-8?B?WTc1dm5ZeUNWUTMrNlRmRW1jUlNiS0NpZEk4eVRaMmEwc0NtUVNUNlhYUm5w?=
 =?utf-8?B?MkpJU0kydGdSUTU4Mll2TnBBV1hyTGpKQVVEdWVSSXdpbld4VW9iczl3RDNk?=
 =?utf-8?B?ZUNIZzZqZUY3eU9iUFg5cUZzQ1A5NzlQankwNlQ0SEdXVklKS3V5SnBhVWpV?=
 =?utf-8?B?TXRkdk5UZCtGRTNNWElQVFhlVjd4d2NaZHhDR1JQYmxFUGZNTWFZa2hhcFhS?=
 =?utf-8?B?d2VHSU1Jb05Yb1ROQzErWWNHT3ZKNXI0RGtOSTMwbnJoTU9ySUhyZGIwZHph?=
 =?utf-8?B?cWQvMG5mRndBUFRycXIyZlBsVkhOZnlFQmRTRlhaaEo5RUF2ZFowdzVueERy?=
 =?utf-8?B?azY4OTVsM1BqdVJncTBsUVcxaFg5TjFUTGhMRzBmQlVKNW4xc2wvUFczaWgv?=
 =?utf-8?B?am5Kck9IUytXVFIxL0JQWWFvcStvQ1Ywa29Qd0ZId05XOGdUYmsvUjlXcUJX?=
 =?utf-8?B?Qk5KTkdUdlg0dG56bVZYVmtveXdNbGlnQUM4Ty9EcG9VTHZuamdUQ3JoVllQ?=
 =?utf-8?B?Z1AxOXVHU1loeEZiNDAzSENmekZxbHM0WlR2UGJwWEZ5ZFhybjZFeEV0NGpM?=
 =?utf-8?B?RXdXTEVLb0d1NDUzWFdKWGE3QzYrRFoydmdleVF6WDgrU2RjS3V3VWRnbDR1?=
 =?utf-8?B?UU12ZmxxTStkZFdNZFRuVmhlYjFMdFNyU0JCQ05oYlIzN1JMQklLNXV2N2VJ?=
 =?utf-8?B?QjQ2cTdBZVNBOGx0OTlVRWVhUDR0L1hwYnUyU21kdm5FTUlWODlNUnJMdjAr?=
 =?utf-8?B?K2NaWjVvMTJUR0lQTkhLdUZiaU1KZlJ1a0hvclhweUM5K0o0OHd1UENWa243?=
 =?utf-8?B?V1Nlcm9NZXpNMncycDYyTkFxQ1BIOW9uUC8wYmNkdXRza3o5KzZkUTNQeXRy?=
 =?utf-8?Q?Zo6JPlF9zrdtzZRU=3D?=
X-Exchange-RoutingPolicyChecked: PE2w2ANdgLyWFCcYAHv75Y1dJcAXs7XC/3PGDQHdCfUdGwWwqe8QuuQN69ggk1dcN7c2op1qVkUTZgIIxl0O9d5l1N6Y7skD/wz69kUZTaBFlCFzj7zXiToO0p5EukfkC58+kp611ute+Zl456gv3GaSCuE7D5kucVQsxdoIw277ypxCql5aDBQDsCLAoyn4vprvehuiLmz9XXciZ3jdjEKBNKy57Pd6cBmzUHz7msm+Hf0hV4XUkYjPJ5mPwOjFkeAObAuvtc7j/0qh/j0K7Boczb/jJH6bL0UquNk142CQgEmEKoe+pdeoQAT0Q/W4n8F4LAW8WohTx6QrM7R/LQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 203eaf3d-2f04-42b8-e6be-08df12754bfd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 15:31:50.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAKqp1F1pGPxulc0d5ilzwhaoAVqabB3XefGYjUCJQfZ+ITCYYCdH7ePl0oy1cPcXzxXvepihodBKEBFrbM2CU0vpDhA0/Kyg1kqWAVeM2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6292
X-OriginatorOrg: intel.com

Hi Juergen

On 9/11/26 12:52 AM, Juergen Gross wrote:

...

> ---
> V2:
> - switch order of hi and lo parts when oring them (Reinette Chatre)
> ---

...

> diff --git a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> index 0408ac7f66fd..a04cf26e0302 100644
> --- a/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> +++ b/arch/x86/kernel/cpu/resctrl/pseudo_lock.c
> @@ -175,7 +175,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
>  	 * pseudo-locked followed by reading of kernel memory to load it
>  	 * into the cache.
>  	 */
> -	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, plr->closid);
> +	native_wrmsrq(MSR_IA32_PQR_ASSOC, rmid_p | ((u64)plr->closid << 32));
>  
>  	/*
>  	 * Cache was flushed earlier. Now access kernel memory to read it
> @@ -212,7 +212,7 @@ int resctrl_arch_pseudo_lock_fn(void *_plr)
>  	 * Critical section end: restore closid with capacity bitmask that
>  	 * does not overlap with pseudo-locked region.
>  	 */
> -	native_wrmsr(MSR_IA32_PQR_ASSOC, rmid_p, closid_p);
> +	native_wrmsrq(MSR_IA32_PQR_ASSOC, (u64)closid_p << 32 | rmid_p);
>  
>  	/* Re-enable the hardware prefetcher(s) */
>  	wrmsrq(MSR_MISC_FEATURE_CONTROL, saved_msr);

Could both these hunks please use the same "high | low" pattern?

Thank you

Reinette
