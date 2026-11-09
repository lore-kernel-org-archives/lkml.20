Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794215408;
	b=EDJr9RfpWW9rwMvrYYqE5tqvx+d31H5KXOGRK/AUsFdkF/ERHhS7G2KkeY/cFt4+Nb9e
	 NhloOEa8TvF3vDwOyfZUiaQ9vyMHNHjJThkr1WcaAuNPYNzNrIfGifDd3tCvdDjyR6gue
	 qnZpr0pnnW7fw8NY8ddSZksDOxRjZpiFJ/w+0QAduuSnoH6wgmhVn2uF4K9jW3aUzS8KD
	 fj4oL4eDyoTP919yVVSATowHfMFvWa5BnOit3IUNeXDMHkNeIB25kLpaKFHwVAoMcSOyv
	 ZN3ALYTlEDfwOCRr1Ue85KIpnbQeqCmR/exs6ZsWcUQdk77j/m766k61k3FrzIdKtkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794215408;
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
	bh=IVl/+Plgd2HCX5h2Tuosq/Q2UP5OXSbPNOOtsl6RkyY=;
	b=B0vCQ806FWm3arMMbijPJv8pfnYy+8BO7hYJExdke6Boi2ZFbB+tJ0x62QoFYNDafOKW
	 E4ml3ZBmup8qNV6g86pv2wHX4mkrG0wj+bo6qmmLPqPTe+nvMTCcW8lzBYUNjc+4fVZp5
	 HApusf6TMEX1D0XugiaIiHdhP4IT/ub3ZS6jXDE99EurMgZJGfU5LVoQOB2N9r7dOktFt
	 IbWKuS4RJCgqZ6xkLiI6GOdSIF9UZEfHutuPa4mBsQiR6XrArTveKyMyLOR7Hj/nJfcre
	 1/AM4yHTAMD0bDvLAXHFSZq8AVqkXKc8CQVTrSwoB9ZVDdoN8cYQS9J6e1E/r0QO5sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YNEP3Cgv;
	arc=fail smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2512D606A31C;
	Mon,  9 Nov 2026 09:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2512D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YNEP3Cgv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794215408; x=1825751408;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ADygexWlaq9NdntWpP64oKJ0Z/eZiTiHVIpQQVif1dw=;
  b=YNEP3Cgvu3j7lK4CZi+cfWYGyW82OYD96HroR38T0vyy1UFM5JEU8JBm
   3A32SeLl86dex3k4uVG004bRgkTVhMH3e+Sk00j6FdLSg2DY4tt9NnPko
   IvNh2Q1uJ06hyxngrxQEyok6bW5W8qc6KBquR3ZkIiIYnmcn6KeZVdIZs
   x5/ETW4UZMM+eNblsiGx+Spb2vyN26wORQaav66eiGWiXQpGD7Cf+56wd
   /tUwWKVLsaergwy4CZAOIXjzkbQgAWg1e4KDMa/xdWClOQhdVZyAXJwXR
   5A8Bk/lMkciY2PtCgR6F4xPuoUU1/QcYZ8k5HmdrjkL+u1aNTZZD1S1m1
   w==;
X-CSE-ConnectionGUID: j6jxEsG7RZGmC+lbQHu0qQ==
X-CSE-MsgGUID: nEvgKztcRUejMRn7kYRn9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="3023386"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="3023386"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:10:07 -0800
X-CSE-ConnectionGUID: /vkhc7UPRXKxREKD4nJP2g==
X-CSE-MsgGUID: Mav4OpXuQ8qCdsQ0Za6ijA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="8161102"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 01:10:06 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 01:10:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 9 Nov 2026 01:10:06 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.29)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 9 Nov 2026 01:10:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuS8YaK3tRlJhdZHQq2WMRJkI06fbykrGgpOJIyoXVmRh7l3Mfm1xXBmQwKD8tqyQGwSA/bvM0mbVwF8blyWLPEWtBMEqzpdpNlzwB0l5EdmKP2wTUQn1u7pPYoGfLvdxmcCRbfVmlk+cZV2AbaXcYud1WVdvXRLSBMnEF4Ez+/r0h2syK74OO9t5EitzNge6MZQHkO+DE/JJ5/aermukTp6bAf5O8HOCsxpTAs6dS9N83FduJ7H9dB5xYHysLWj+wwlABO+rv6Of5kDCVOin64mmWL/wpc+7mPgf9CWsKZbEL6IkDw19m+kz2FFJbffV4C0jXW2zrLIwQ0vxTBUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVl/+Plgd2HCX5h2Tuosq/Q2UP5OXSbPNOOtsl6RkyY=;
 b=CB2+bQU44UdE+igYBluP8qkWsT8RDYdehiY69SHwVk6Fft2xRYugU8ERU3e3FXwW46Shcl53Imf8OTSyVcVTrinfBBZEMKm47MDDMhgPsiekJBkot0wv+KHCW3prz2nKY4dGw97alCvf1TpnUGNWGLUxTHCSJYCoI/kSkDIj88JYYOo45nEWnpEHyZL9oW5HlKkGqZHGwdceZnPSW48OIgCWamb3p+Qe2TlhcCXz6LIedCLElccpEIOQIdBdCDhNSdZJrwcojnZmrfMkr6ZoAfIA/Y8c18ZcAsRmpbVz/ut+p67RcilhWnulH7wJFvKapFlfpxV4fmmzWRM59hNz3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 by CH2PR11MB8836.namprd11.prod.outlook.com (2603:10b6:610:283::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 09:10:02 +0000
Received: from PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086]) by PH0PR11MB4952.namprd11.prod.outlook.com
 ([fe80::28e0:902b:4ee:4086%5]) with mapi id 15.21.0592.012; Mon, 9 Nov 2026
 09:10:02 +0000
Message-ID: <5fa0ba39-cd95-4644-8b7c-8327a3e75f7e@intel.com>
Date: Mon, 9 Nov 2026 10:09:56 +0100
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
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <fc911031-2367-4bb9-b0eb-f795965e629e@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0029.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::29) To PH0PR11MB4952.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB4952:EE_|CH2PR11MB8836:EE_
X-MS-Office365-Filtering-Correlation-Id: c394add8-2371-4f67-499c-08df3e413cc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|5023799004|4143699003|56012099006|261021135927099003|261021121427099003|261022105027099003|261022075727099003|261009223027099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 3I5RkCAWhiJzTRzfqPYkwKSUmhTrFV+2151l/cLzNnHmwz1eSIQkoZGNv1W1bevOQcT1DeeZKVSNZISvu7z7KwpYDTWoNkfnQNCO8lWx5pHx5GGUPdRLLhu1FSWXF4qOzAvKqYVa+vl4Db2VqAatCGiPs77ZVHt9Ngd7B+B6dEY8NDTRWExRRslhoHivIa9Kb7RE0IEpKgZ/ezEhMMRs5+UVEGkBKHfmbMflmH+0/iUEP0rLO2EFsMwtzWp8tZgf5wSBmhLicBzE5YgAWDel2nAK5VXWYQ2O9vX2SvnTLUt0xvCHTDPvGZw3byu1e9JEU0/K/necj8Kmk8JXn6CWW5dJp99nAY0u3+JhAv9wuKOdtYbpO7JSiJEf1VtMauf3UaVv1GWQ216Cp0LYZAxH/C7euUZRjgXEamIMh0L+JdhCTgfKooeSluccOBcoWGyEZvrDvzDQS5Ti8nnVBOjFbEytx/lBOLrmH/FMZFLgulSPzHhmjxnvQRWUAVtPx4PXjRjusgIWULbjDnl6Ne7CWKEZ6/DLtf18w+AJ8b7mePr0UGF2TZVd8wyCkZ7VH62MPgrtJHQKKM+s+7k2wpizBityZp6Snrk4VetWpdt30blgsmXyVIgQ76mBSMIxlx/uUdhjArhz3c4p7KGnOA61bf/5Gweufi3QR82EUreNKDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4952.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(5023799004)(4143699003)(56012099006)(261021135927099003)(261021121427099003)(261022105027099003)(261022075727099003)(261009223027099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVg0Rm02Mi9Od3lRSXY5bkNodUtyVEFyU3BjZXd6cXFoenlZMkJCTHc1UlhL?=
 =?utf-8?B?MjE3MWVNcXpsY2hLNjJ3WENMZGo4UDk1Y25KYjdYckh2SU5JeTdrblFacE5S?=
 =?utf-8?B?R0lzM0ZRcnZRNlJIYkROQkM3OGZORXc2bDg1cm4wbURBSkhYZUxBT2VRRldo?=
 =?utf-8?B?VVBPQUEvMThtbnpPMHpYbWpDaU9xUzRaNWc1cWhITEI1bndMdzRNY2k2aytn?=
 =?utf-8?B?VDZNbSsrcFdEMkdHOW5rM2RJQlBpVDBoSTdGd2xNc3VNRUR0L3phVXpTRjJU?=
 =?utf-8?B?eWdBcFNvQ1RDWm44bjAya1NsSUsxTGoyZ1lNbnE1aEd0cjBFcHliTDlyTFc2?=
 =?utf-8?B?MFVWdW1RNUNlSFJCNVY4MlBiSEVVSW5QSnFCVjExWlRYK0RzdFowc3QzWllI?=
 =?utf-8?B?WDg4T0EweXMwL3pZSkF5VFlhd1Q5VWVpQjFOdkt4K29ZcXhiUFpqYjFjMTdI?=
 =?utf-8?B?MHNSanhFMFR4TTNwUjZhWXRzZERXOFRPNUpEVmVRZExkZ09YK0t2WVNlSlBH?=
 =?utf-8?B?QldoU0N6N0tmUXdaYzBOWWpFUjdnOWVtbURPMVJ5dmt1R2hlYUk1c2c0clEy?=
 =?utf-8?B?THJBd3laT2lLcHdENmNOL3FvZFg5MGtDbEVEc0NaSlR1cHJSTGVpTFk4RUMy?=
 =?utf-8?B?bE1VTmxldHhNdjRDVWxuUHlUNWpjeUh4cHZmVDV6WDUvMW1rOUdsaVFHZ3pj?=
 =?utf-8?B?Y1V1V3hLT3hkclJISEowMXowVmdLTlF4NDR0MXFhZldhd2V1eHNOQVUyN2xh?=
 =?utf-8?B?blpHc3JldVc5ckExRFljbGVtVDRmdXdsTHpaYzlXRVZ0QmpGWklIY3ZkV2Nu?=
 =?utf-8?B?YXhmbEQ0em5sTkREcGpLb3JQQ0JTckdNZEtVQ0JzQzVRTzl4cHhzMVlYenpX?=
 =?utf-8?B?NExNU0p6dXQ1MDV4Tjh5MzU3Rjc1RWU1RXlaMFNmdHgxcWxrQXpKdmY5dVRr?=
 =?utf-8?B?bWpZdGczV3dZTnZnNkQrajNBdmNlUmxFcGo5QjJodWhnSkhyQXR6N3ZhbkFl?=
 =?utf-8?B?UUhiTFc4T0xvMStlUTh5akNVNDROZjdNVWdFNnlONFJ0cXFZN1NxWjRnUTVn?=
 =?utf-8?B?MEo0NjlSTFlZaDJGcnlQMm1LVEgvak53Z0RvZzFDcE5wYytjdG5qMmlRMlpG?=
 =?utf-8?B?eW5JWnQxeC9yWTNocXhERG1lSDVXblN4MDdUU2UrMllobzFPVnY5OG5UaHN3?=
 =?utf-8?B?U3h1K2Fnd0I1SXhOSmttLzB5SSsyNmx1THhTTEVvbDVYK0J3OTdVZ21hMlk3?=
 =?utf-8?B?TkxHVVpCV1huQXRzRTRFSitVRnpmTXFxZWYwc0ZIdVdNY1krMk5pYWRUOFEr?=
 =?utf-8?B?aXlaZG1RQ1JSK25SamZBYTB6amJJelluNUdGY3RuL0cvemFiMVNPWlhRRXRo?=
 =?utf-8?B?VmludnZldlhybEVlcXRwYUNLUEFGWjR1R044ZkxZdm5yemF5KzBxWGZ6WTRE?=
 =?utf-8?B?Tm9xT0ptdC9jQVM3WEtWMEVnL3VXcDRCcTBCQVZucWMweGdNNTR3RE1mNFg2?=
 =?utf-8?B?aWwzT1g4dnpCZW5yWjFtYmhMUHAzOG9BcTF0cXhCQVFIdWNuU1VObmluZ3RP?=
 =?utf-8?B?WUhSNU9iOHlsa0tRUFZoNC9JWGJ2eHUrdG9xYktmN01RRXRCeG5MZk5iejJk?=
 =?utf-8?B?dTQxUHNiQ0tXR2l3TzhnRWJvZ0tOaTNkMjk3enFhTm0rd2NLKzQzaEROODlu?=
 =?utf-8?B?UFZacXRhQkc0clRWTXNRM1RiSlRyaWdaaTlDa2hzdmd2YTBjT0Vnd0RpdGtx?=
 =?utf-8?B?V25iL09sdnR6eUNqZmM3bTdodkdaZGtUamI2eElHVUdTUnd1VWM2eEF3QkJD?=
 =?utf-8?B?U3dJRUc1UUl5c3g1cWs3bzR0VU5xczF6L3ZXcTgvRTdtZDVKYlU4TmxDeS9r?=
 =?utf-8?B?L3BrLzIwNnNsb0JoaVdGQ05EYjZ6UTg4UkpKNkc2SDBnNmdPWm5XcnI4SHBK?=
 =?utf-8?B?ZUZqSm95Z2xwcHAwTlNiNlJ1a3RlVElxQWpzN2RkdGQxZTJQMFhQVXM1cmxO?=
 =?utf-8?B?ZkZIMjlGQ2NLNUxZMlJzWG1PY3ZyNjdGdk8rWURRaERJUWRieWF2bmsxb2w3?=
 =?utf-8?B?dXFOYlJUNFFYUUZLUzJ2aTBGa2F1QUJUeVkyUFdHN2ZMa3E1ekhRQVIrUUpn?=
 =?utf-8?B?clZLajhwTDIxOE92YXBsOG5tMnp1aUFvWjlTdDgzM285L2ErQmViMTFjS3F0?=
 =?utf-8?B?aGhPVGVmdjdFSTVZTmUreDhHckpnVTdRTzdDRzduSDFlOFpZcnpDeVA1NzFw?=
 =?utf-8?B?aThQS0o3TXVYdWtKS1lsMjZlTTFrOWhHajFYTDJ5MFVqR3p5R0ZDc2tCNVhI?=
 =?utf-8?B?WGY2Y3M4dlg5NnhpVExTakZGZW91YllwUUExTEplUTRpT3pHb1VldDJYTm55?=
 =?utf-8?Q?5cRs5uB58UcF2bOs=3D?=
X-Exchange-RoutingPolicyChecked: pLTJdD8KV7a/Er+BKaNx7r1KwXK7jvi5rtY8Hio7I2xRhVlQEhuib688nJ2lYVInXH7CVbNgzcJuBf1iAxKXTZnQeRXegg7UAaUo+W8VT83iQQwf2wVvZ+2tew7pGQm79vnV+1R0prViRyiplbGeK0rrT5zftA7XEFkax+hOw4TsV1sG4z19l+CjywAnPibxPbdp8tDTHBHGtK4huTCTvXbvbgMJnImtaYQNbSGk3B78mGmOSXjk35WwY7d2FXstIGnDkCLJ9t4atp2rip08Dai6jP2QjheJhnv4fUSaitothaZ8MRLtyBfOJrp4fmk4JPxaK9a6JJpBegVUbhS2Pg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c394add8-2371-4f67-499c-08df3e413cc0
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 09:10:02.5841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+5GrJR3luW7oYXrEhzEe4hKfHp8pXzd7GzC/LYaiyv/dx5JNLEq7iT6FJtBVQitWkTlu64NFW2pq6fdcdhI7uqjecBPW9diN9lcGkhWM0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8836
X-OriginatorOrg: intel.com

On 11/6/2026 1:55 PM, Pierre-Louis Bossart wrote:
> I am afraid this patch needs to be completely re-visited. You mixed dai
> and dailink layers, and that explains most of the misunderstandings in
> the review of the PDI stuff where I mentioned that what matters is how
> the dailink is created.
>> +static int avs_sdw_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
>> +{
>> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>> +	struct sdw_stream_runtime *sdw_stream;
>> +	struct snd_soc_acpi_mach *mach;
>> +	struct snd_soc_dai *codec_dai;
>> +	struct avs_dma_data *data;
>> +	struct sdw_cdns_pdi *pdi;
>> +	struct sdw_slave *codec;
>> +	int dir, ret;
>> +
>> +	mach = dev_get_platdata(dai->component->card->dev);
>> +	codec = mach->pdata;
>> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
>> +		dir = SDW_DATA_DIR_RX;
>> +	else
>> +		dir = SDW_DATA_DIR_TX;
>> +
>> +	ret = avs_dai_startup(substream, dai);
>> +	if (ret)
>> +		return ret;
>> +
>> +	sdw_stream = sdw_alloc_stream(substream->name, SDW_STREAM_PCM);
>> +	if (!sdw_stream) {
>> +		ret = -ENOMEM;
>> +		goto err_alloc_stream;
>> +	}
> 
> This isn't quite the intented use of the SoundWire stream API, which
> provides a sdw_startup_stream() that's supposed to be invoked during the
> dailink creation in the machine driver that binds cpu and codec dais
> 
> "
>  sdw_alloc_stream should be called only once per stream. Typically
>  invoked from ALSA/ASoC machine/platform driver.
> "
> 
> 
> The dailink maps exactly 1:1 to the SoundWire stream concept, and that's
> what allows us to deal with aggregation - when multiple cpu_dais on
> multiple links are connected to multiple amps. That's the #1 reason why
> SoundWire exists and the #1 difference to other audio interfaces.


dai_link->startup() occurs at pcm->open(), directly before
dai->startup().  The binding process relates to card-binding and
FrontEnd exposition, at least that's my understanding of the subject.

Now, thank you for mentioning the intention.  Did not understand the
point before that.  However, given the above, plus the fact
dai->shutdown() frees the stream object, I see no difference from
functional perspective - allocate a stream object once per runtime, free
it when runtime is about to be destroyed.  The exact same thing happens
here.  For avs-driver, the machine boards are minimal.  Dai-link
operations tend to be used to patch up stuff between codec <> platform
expectations.  The intention is to make populating the configurations
easier _and_ have one location for the PCM operations - everything
happens in pcm.c file -or- in case of SDW, pcm_sdw.c

> BPT/BRA support is the only case where sdw_alloc_stream() is used in the
> Intel platform driver, since there's clearly no concept of cpu_ or codec
> DAI.

No intention to support that (BRA) for automotive right now.

>> +
>> +	pdi = sdw_cdns_assign_pdi(codec->bus, dir);
>> +	if (!pdi) {
>> +		ret = -EBUSY;
>> +		goto err_assign_pdi;
>> +	}
>> +
>> +	/* Fulfill the codec needs by setting the sdw_stream. */
>> +	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>> +	snd_soc_dai_set_stream(codec_dai, sdw_stream, substream->stream);
> 
> That absolutely does not scale to the case where you have multiple
> cpu_dais and multiple codec_dais.
> 
> Please take a look at the sof_sdw machine driver (same solution used by
> AMD), and please use the sdw_utils library to deal with all the stream
> management.


I believe you are talking about aggregation.  No intention to support
that with this code.

After reading the read I have an impression that the expectation of this
patchset is: full brown SoundWire support.  I wish I could agree with
you.  The reality is: standard PCM over codecs with and without SDCA.
If I get a user and an external release on top of that, I'll come back
and revisit.  The code present here provides simple implementation of
the goal, basically mirroring what's done for HDA in pcm.c nicely making
it easy to follow.

>> +	data = snd_soc_dai_get_dma_data(dai, substream);
>> +	data->sdw_stream = sdw_stream;
>> +	data->pdi = pdi;
>> +	return 0;
>> +
>> +err_assign_pdi:
>> +	sdw_release_stream(sdw_stream);
>> +err_alloc_stream:
>> +	avs_dai_shutdown(substream, dai);
>> +	return ret;
>> +}
> 

