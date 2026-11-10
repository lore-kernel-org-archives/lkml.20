Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794302317;
	b=SkVi0RaUm2sQdbXGrGK++uICzvDlgz+cukn41/XS8ORsde6aulzgB5abFNBr0zbeX3DF
	 LuxIqL/REjTp7LxTymAOOBroX8MaYnmxbbHCnFRCsjp9oML6XS6JTjHGS6vDs0ScVrPO5
	 a9lkRDmb/tyVUVhY3WAkQNAT2vCLrM+FXY43GLnQ2piMZVGdGl+XyoOW7k6ziiomgZtOP
	 XWoea8r4mfF+rp+HVX2fP0QXlwjGlm7beZAQSqABJsMSJwG6fycAzi/YAgdAU2u07q8kQ
	 tgk0zHRjQxRB1lK9C4zzO7z33UiQcDsbHCaiGdWFdBVQa5LadJBduHNNxxY2QojEIog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302317;
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
	bh=+U81PQxEsmDg4moB3tndS9VjRc7alwViv4E9xPJTmkg=;
	b=ODygGFwxWdQAP1+tQJdNCqYe7GZD5KmdLalmJQ44TH0M8KhfFmzgkWsuYKRlT8wEc8fh
	 McQ/GHB7NEFIuIvkGdJO1GGmfwvfPUZ5jNzUNsPjj7w0aq2pG5yq3rQ8HvH2C+XMJ9ke8
	 B5OSsXyP8bjcKHY145a2DRApt7U2esBLNcAkTd9tPJ9m5M8JgqUbRk1Ttj3UKs9B7n6G0
	 /4C+UM5EnYuXBbTyarQ05nX2RQR4Yrh1Gj5KQxbF6kDvgeo02SjnLtdAh9siBvCv3sUui
	 C887jKhwH/GZyPENg2wET5NlVKc3FUkE9PaxJS24umouTUpG4F+E47/rSCl/sbj+OFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUujNVMA;
	arc=fail smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F41606B154;
	Tue, 10 Nov 2026 09:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89F41606B154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OUujNVMA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794302316; x=1825838316;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AaOwYb8UrOemjHFkfuBbYjEpXIUnpFDcTJgqcTvmLmI=;
  b=OUujNVMA5rG655OmS416Uf7746cRYlG9Ks1+S8Ex6skPkbKGlaZWC0tB
   9vl0WdsE0eowzsswpiqYUt5rWzyn+1sqcqohMUQlCKw5h0SYZHu7VL5RR
   yLYYkG2p/MGdNdtw7zChKPO0TDikWwgVMrn4tHmepOFaqVDPwX7Fc9/Bj
   BmfC5+Tr3I6hegY7EFvvPFSRwVGEEoY2Q2IQLAq+gim/kDG4uwLQjSgqB
   nJ2jSYr6WPB6mygo/re+GBMoVVglYxWuTG9S6YVR3KHB/5vJKuILlhvv7
   BjtOU61Q5KNcAFiCTNTqpgvu7pFWtCyrdwproY9PT3n2g3HrgNuL7/2Y2
   A==;
X-CSE-ConnectionGUID: 0k9ew5TUSmOhK1++ZfFFvQ==
X-CSE-MsgGUID: MzG+N4eLRFmUdWvRjMWTeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2940151"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2940151"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:18:35 -0800
X-CSE-ConnectionGUID: JB7GsUmEQPy2mJgLThA2BQ==
X-CSE-MsgGUID: ujHA8HPiSoq35ZetkooeSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8079126"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:18:36 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 01:18:35 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 01:18:35 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 01:18:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xN9X2w/DHkiH2d1+AOC2XSkL7Nzf4OBCTTQoI0uE+VVYg2S4c0JFLXUZCzXRLy5b4oR2pAy11UO2MPDlgTkwobsgqTLe5A4Ku9Ep9vSq/SA8P9C+hmBKhbQUfA6CjcEaIcDTlS0DP55c9PbRHlSJ5Iu9CzRnb0eu0MacbtriHAniktb+5jJf2sWWH1POtC7qVwrRi4y/Rsp6J5HdpUUyPUG0Lwzun4PfE5vEGCke/edhBs6lQ9LfSNQMz80WfniotUIMG4Xg5NaCJoTYmTm5PYaoR40Kl3rAqboZdztZ61CJBRglth9s8jtltnSVwatC6hjkCDnxiTBw1UJ2KVQDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+U81PQxEsmDg4moB3tndS9VjRc7alwViv4E9xPJTmkg=;
 b=wSJGqriTcpQ6Pp3xBUwA5/Jcueh0szF1ITnQ6jSo3ph1mYUnrjCrusGZk8knW8M+siCYJLlfFo51lstJGzJbBSyCgOoatHc3M8A+37z76i5Idae/cz5TGZ9pDQAHoevgeHZECDUPgjzew7LBLZO2UUE/LSEX06YNk7O7HSKbZ8m4XycvYP5nDsg7TcwZbeYZDrr3RbJtAFhICnQGEXTYSb+YLJ0THGfdAkCJ2miKCy9WN3MIQgMNHt21PSVTGppSeLdxzH0EgDjmy8FVEcnsKSGCOF7a/XKy0oiK/VpHONPoKFguejGTauqXfOyU6Tx1Ijfu1OudnVUqfpTXIaLeoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by DS7PR11MB7885.namprd11.prod.outlook.com (2603:10b6:8:d8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 09:18:20 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 09:18:20 +0000
Message-ID: <e097b7e1-cc2e-4d4b-a0ad-aa1354eb4207@intel.com>
Date: Tue, 10 Nov 2026 10:18:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] ASoC: Intel: avs: SoundWire PCM BE operations
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: <broonie@kernel.org>, <tiwai@suse.com>, <perex@perex.cz>,
	<amade@asmblr.net>, <linux-kernel@vger.kernel.org>,
	<yung-chuan.liao@linux.intel.com>, <vkoul@kernel.org>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
 <20261106121557.2338556-8-cezary.rojewski@intel.com>
 <fc911031-2367-4bb9-b0eb-f795965e629e@linux.dev>
 <5fa0ba39-cd95-4644-8b7c-8327a3e75f7e@intel.com>
 <68fe056b-7351-4033-81ac-3dd346154842@linux.dev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <68fe056b-7351-4033-81ac-3dd346154842@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To PH0PR11MB4952.namprd11.prod.outlook.com
 (2603:10b6:510:40::15)
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|DS7PR11MB7885:EE_
X-MS-Office365-Filtering-Correlation-Id: 39e24cd6-1fe6-49ae-d698-08df3f0b8fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|18002099003|22082099003|6133799003|10067099003|11063799006|261028144727099003|261102123227099003|261026121527099003|261022105027099003|261022075727099003|261021121427099003|261021135927099003|56012099006|261009223027099003|261026140227099003|4143699003;
X-Microsoft-Antispam-Message-Info: sW54OMSuAGCs+8b4YmmqvodrE+VtUISnb/cO/j9b6MaJtOI0wyBXEvtlimgOj63aPCnRgBPgnR0bYDGzeDDgxBoJpsd/zZcT3BZDg4NMIp3A2Y91ZhxPftjIK3lrpULCagmG4ytN8FpvQx2JzzKVBHtgqmvJE057uP4W7tlkrEzsE7sTBPg+7vzCWdV9It550kqdE61v9iMRESuEQfcEyczSenBZB19xwl84/B/bWN9jkUFfREkIdNA4fYJ7SwQcOgdCNbJ/Qibicy/dHlXciSwL4iewaoyhurDPCszlkqNH70bVasjte/A79FZLiFbVCOlT3eBJgAfTXJdNP5/wXTZajYr0wKFDG7ZncCP3A5aKMtK7bjakYegY9Uq1bIzuzcsQlFJXTfIS1MNI8UlIcG5jHj2UHX0q5a/QL0vKDWkZIIq3wiHVP7EPsZFo293PnSYNq+A99V0qI05p0VGLGTxu0Yvaw/VEFw6/NJAh6y0OV9m9oiIejnrB1nqDcUFivox8bXXK6+TQtbUlQnFI1M8oFvCNoZhjIDcab1vsrBvoP4ANl9sscslSZAtATPnPAGHyts/w2lB+TZ+/vMi7aovqtOuq4aEi+NcqkpeaTNjS+bW+OctCiPa85IE3XUxtGNmJCXoCV0mSJXYdONxuGtox1HpilyDfjCIJ1TCwBjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(18002099003)(22082099003)(6133799003)(10067099003)(11063799006)(261028144727099003)(261102123227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261021121427099003)(261021135927099003)(56012099006)(261009223027099003)(261026140227099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3cxSGZoMzNDdlBCTXMrWTNWdjlYYWxzS2hQZ0phMUhrR3lpNGlsTnBjbGRw?=
 =?utf-8?B?SFRPdDBWSjFSS1hneTBIalRRdjhaRmFFcG9KK0dNSjd5emlacjZjVjhIZkZY?=
 =?utf-8?B?RGNHa2xkOHVZUUlNYXNWRzRUMEN0RTFNRktEY0d5eU9KSWQrSysyODJrbDky?=
 =?utf-8?B?SERYcHRpcjVBSUhRbk9qSVRjTzN6OVlZZXR6SWx1MHJKc2taaFE2SUdZTjMy?=
 =?utf-8?B?WkZ3cjVSaXJxWmtIRjFLMnYrc3FBSjhSK0NBd251NklzSnFhMEZGcmdWaGlr?=
 =?utf-8?B?SUNnK2pwU1dKWE5SZGRQaU9GQUtpTmpZRlE5cUV6SXJRY3kzQ3BVWERFMWhJ?=
 =?utf-8?B?L29McXh3enBRcWZCUDluN244aXVmUlJEZlhta2I1NzI2WVRSdnRUbSt0VU9Z?=
 =?utf-8?B?dFp0bnNWUzQ5aUU0alJqMFAvVHVkY293VGpESW9mRGxHNFFWQUtKS1BldkxL?=
 =?utf-8?B?UmZUNGhyRVNucFVxMU0rcHpIc09wRnFwZDlFbjl6V09rUzRJKytlSHNBbFp4?=
 =?utf-8?B?ZGs2WUlaZlNRZGs1SS9iQ2pjSGxUMGROSnBMRjQvaGdlbFpyZTc5elZQWHd4?=
 =?utf-8?B?YnJHSURRcjFNK3Y0SDlNKy9mcnVLcmc3SnZqbjFhR2orR2oyNFZscnA1OWg4?=
 =?utf-8?B?d05NUk5NamVxdjZlMnlESm53aEhBejN2b21jSHR4Z2pnSDVwWEZOMy9aVlBv?=
 =?utf-8?B?c3h1RkVhcXFOWVRGSEJHbFIwaUs1Z05UR0hyc1RTVG1mTE9SVmUrYmJYbTVQ?=
 =?utf-8?B?SXg3VjZkM3F3cFlmYmJLeTRpRVNNSmhzcTE3NWIvMVZYNklEQTR6OTZ0MFpj?=
 =?utf-8?B?VVUyU2laM0RZTWVXd2xWN3FJQ0w5L29nRGwxRkl0dG1YNFU5S2J5RUwrWEZM?=
 =?utf-8?B?QzM2eGY2NHF2ZWtucnVCaTRIVHpLRStFY0VueFNIdFRBT3pOREpXb2NScjdw?=
 =?utf-8?B?K3l3NThKYkdCelZaZEs5VUhqUDlKRklBNTI4ajRjQitvcnY3YjQ0YTNOUmVq?=
 =?utf-8?B?QnRnMFk2NkZDY2tCUkw1dy9jRnRSODk1cm93WUtqSVVHME9IRm9RZWVsdExL?=
 =?utf-8?B?RDM4Q2liekxvcExQdEoxTlB2Mnc5eVdnc3MxLy9MYXM4YyttSkErVTdxaENG?=
 =?utf-8?B?RWY3aStiV21kbHdHY1Bob1FHd1lwV0ZDSW9tdTJZMzBGOEdhQnlTU2hOQ1Bo?=
 =?utf-8?B?M1prNVgxSzRlNW5xekRIYXh0dTlvbXZ2V0trYlNkRzJXUHR5T1c0M3drazJy?=
 =?utf-8?B?TTV4N2cyTENEc3R3eithUFZVTHpkdG1qWWc2WTJkOThObmJOazczNUY2ckd3?=
 =?utf-8?B?d0JuRzAwVlRiY3RPNTBmR0JyUmpQajNrMVpsQ0tJWUxNeG5SdDF6eDBtZWFM?=
 =?utf-8?B?aXduWFlCaU1pVi9nc2QxVWdCWkhNNmNHL29LK1hEWlJVS0dFWHdFbFdJVkUw?=
 =?utf-8?B?WCtLcVB4RzBDK1NGQ2RlVmtFSW1JbTl3R1NUNE11RXhHbnNpWHpkMmdjSml6?=
 =?utf-8?B?alI3U1NRYnBDMTFBT29jcU9DbjhZdHdtbWtsUjRQUXNqVHZ3dTdNeGtKa1M3?=
 =?utf-8?B?MUJOZi9EckhNREhtRk1RUUIrYkI0bGJqTGNHQ3ZpZFVwRnQzWUZXdVFSa0hC?=
 =?utf-8?B?YTAvWm1BbGNRVjB6SFowRzA1QWQ2TUM0SS9YOGZBak1ic0cxV0ltaHhnVlR1?=
 =?utf-8?B?RlBheCswU0trRVExWHJXQjhHTENsOStpSzNQTUU1aEEwWktpTFV3QVBZZkk3?=
 =?utf-8?B?aXZDbzVyVUY1b0FvVDFNQ0l5Zld0cm1FSk4vOVIwQUNGOFo4ei9TcnJ2bEtB?=
 =?utf-8?B?WXFWNUV2K3dKTXpvNWZITHJoaXROVVZ3b2tsZGFyTUFRV0dXa3liN3RJME1X?=
 =?utf-8?B?V1Q3bFhqK0lIOFlYWDhUdG9qbEZXenMweW1QNFlPZGk0K2l0MXdpYzRUMHh2?=
 =?utf-8?B?NUVKVjZTa3MyeVNFT05BY01lazdvWUNORXYrMzlPM2tiZVFBL1ZkMFgzRUdr?=
 =?utf-8?B?WVYwcG52VjVsVDlRZ3g4NzdNVlA4cmdXTEYyWElhME5yRDJYYm9KOHBFK1ZT?=
 =?utf-8?B?SngzOWNtcHpGNm9VUkh6am9UNWsvRitjdGRvQS9NK2hrTFI5bnN6QlJPc1V0?=
 =?utf-8?B?aTEyVFAwbmhjRmwxaWIrUVZYUWdUYjdjOUVxdVQvWmpQRGVqQjVxOWt1MVdr?=
 =?utf-8?B?QXY3Z0U1UFpWSVJzWkhxTXROK3lGeHRFb2pKQ3dremVuU2lGbDRiSzQ4SDFX?=
 =?utf-8?B?eTA2OTh4THZ6d2dJMnN0bEZGQ2JmTEJLRVJDd3NaTFp0b3N4WmNqY0YzdWcx?=
 =?utf-8?B?bm9tcXJTbVFlejNrRXBodnBpcHdmWU1FaHpQNEJ2RzV1ck1kNzJYNE5qV2g5?=
 =?utf-8?Q?SseMTIwELN0+MGzg=3D?=
X-Exchange-RoutingPolicyChecked: Qu+OP+ubPoHIwJEerqCnj4YVwoa2p4ggTIX3yCHQ05/7vt+xlAqNxGx6L7zHSs4jtZt+YPcT9WY3P798PwZ19EtVOum6OqhrApFtxj5trKZbaVD0kaC4wAhGYwW85XIgGinYLUSq3d87XtDrH5iL0zawkJMXs6IRBGxuqK9IOgxzqBlyg8J9Lq4GXOvM8wgkHVN7fTtGkTFT3ydpbN5TCYezyT/YU9ahyrDXLk8LhhZ+0KvQwtOmfvQuCIVsRLlpyCib6RTBebajSGzcpOZe9XBl+3Kr0dVds4H/d8mtd1NlnWSAgLDg7iv3f+QYj9+OntHr1yDUKgj6VYxYr4tW/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e24cd6-1fe6-49ae-d698-08df3f0b8fe3
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 09:18:20.3777
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qa4NLz6P0/AOzI49GCL9LSD9u5DYqFwDAkZP7IU1ue1Vg2LJOs1LlSSHfApIuYkdypjFl/hKkZxotLDwr3anUvJ+l7D/RqXQZM34YYy3wPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7885
X-OriginatorOrg: intel.com

On 11/10/2026 9:02 AM, Pierre-Louis Bossart wrote:
> 
>>>> +
>>>> +	pdi = sdw_cdns_assign_pdi(codec->bus, dir);
>>>> +	if (!pdi) {
>>>> +		ret = -EBUSY;
>>>> +		goto err_assign_pdi;
>>>> +	}
>>>> +
>>>> +	/* Fulfill the codec needs by setting the sdw_stream. */
>>>> +	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>>>> +	snd_soc_dai_set_stream(codec_dai, sdw_stream, substream->stream);
>>>
>>> That absolutely does not scale to the case where you have multiple
>>> cpu_dais and multiple codec_dais.
>>>
>>> Please take a look at the sof_sdw machine driver (same solution used by
>>> AMD), and please use the sdw_utils library to deal with all the stream
>>> management.
>>
>>
>> I believe you are talking about aggregation.  No intention to support
>> that with this code.
>>
>> After reading the read I have an impression that the expectation of this
>> patchset is: full brown SoundWire support.  I wish I could agree with
>> you.  The reality is: standard PCM over codecs with and without SDCA.
>> If I get a user and an external release on top of that, I'll come back
>> and revisit.  The code present here provides simple implementation of
>> the goal, basically mirroring what's done for HDA in pcm.c nicely making
>> it easy to follow.
> well, I find it interesting that you are suggesting changes that impact
> existing to SoundWire *products* for what appears to be an experimental
> setup that will have to be changed *again* if and when there's a user.

The configurations are not experimental.  The base of this code exists
since 2021, shipping to upstream only now as the releases are external
only this year.  Is there a possibility for more configurations in the
future?  I guess the answer is yes.  Though I believe it's OK to change
stuff when the expectations/requirements change.

> It's ok to push background changes ahead of time to prepare the future.
> I am not sure what to think of your approach.
> 
> a) Mirroring HDaudio is not the goal, if that comes with a substandard
> way of using the SoundWire subsystem and capabilities does all this
> belong in the mainline? My take is that support for two amps is a
> standard feature, be they on the same link or not.
> b) At the very least you should have disclosed your goals, limitations
> of your approach, and be mindful of reviewer time.

You're correct, I should have listed the avs-pcm goals along the
reasoning behind the soundwire changes.  In regard to a), instead of
sending v4 today I'll try to integrate amp/aggregation and see the scale
of changes.  If it's wide-beyond the scope of this patchset, I'll opt
out.  If the changes are manageable, I'll update the series.

There is a benefit already of this iterative review - the first patch is
gone, the rest of them are not users of it and the code compiles just
fine without it - avs-driver brings in its own set of stubs in 5/7.

Thank you, Pierre!
