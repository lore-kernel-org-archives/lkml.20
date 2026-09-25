Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B9E4B0E2A;
	Fri, 25 Sep 2026 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346953; cv=fail; b=W+rlZroTEuKhkaxburioPaoYruDb5Sqg//2DC0WIOeNgFLywatEaVyV6vgRh9A+Q3AvMQEI6mc6Gd3eSE+tnRgV9BuC9q/fTnJ0R3LeiCqhJUw51w175w8ZMHih60bB3YqFNqAMkCiMj8GPeIAJru4jzC7oCcpuuq9gM5vzjDkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346953; c=relaxed/simple;
	bh=B1bbzPJjBvcaLlhKTutvshOtiMlHkecLoEX0YKYrRmw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=c1z7CsCECcC1v2T86Shcyytl+Ju6A+s+BBwBesIipsfUGP8RcXIDNCRqhxZy/apcBk+QjT4Mf7Ck7/AsHOxLWReR+pX0tFSGI+U2FQIOv2s19jRS7IBfTg6E9hX3sTJQ9v3hX+Ruw4oZld2pzlvqynBTgpqDwBWhMldGPBIIxjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gY93Sd6s; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gY93Sd6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790346950; x=1821882950;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B1bbzPJjBvcaLlhKTutvshOtiMlHkecLoEX0YKYrRmw=;
  b=gY93Sd6sye3fFeEEn3wr+38aT8IhgH6Qh0cgSBH3vDVL8yDZXsstpfV2
   PMXSUP2zqatVq30cY1bT1vt0m5r5FxK387nDfcliUsdUZwmE+jM9xyWaA
   FjleqZLyvOd3Y/pd31zl5HDNmqmv/Mj/fVuHuLmtkfNclT/DL1m4OLG6Q
   qrhsx+fSye7QPwNbxVwB7Q/aRCO9d9UtcT4tplqw3ISwUckAO1pGtBrju
   vk0dDNpNveaq0QUNZKCeNqYr8gDv/yF2oR3Mzf3wFuZDunfxp92h1CK1H
   8xsusnvU5wuxtzM7rUC4+v66JaYQpvGAvQYv0QK9yeHEeNtvkTn4ODJ6/
   g==;
X-CSE-ConnectionGUID: qfWbHz2nTtKhheLKJ+V2bw==
X-CSE-MsgGUID: 0srxpZGCRmCOfVcB5+0DUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="116662318"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116662318"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:35:43 -0700
X-CSE-ConnectionGUID: HYZCkyFVQJeG34NzsFiFDQ==
X-CSE-MsgGUID: HGsUSBVNQJiphGMu3Xd1pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="303856551"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 07:35:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 07:35:42 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 25 Sep 2026 07:35:42 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 25 Sep 2026 07:35:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pTO8TFaHHlcdAXQYqLp/c+HQQLnFsD09k9sPQFkS1bhVAIGlLB6hAJ3+jp5r+FDwxo84i5/Bn744AyBw2icyVVyMpsxNT0kOfIN9k4koA/Q9Qo8n6lydroLy2BaMQ+xq9DzJXSfBnkxlEle+tgbcPvapeGE/DBJrY8tzhafpH6Zt1tY/WqBlA0PBzSckmceNj3suEpEWarhf2sNGlRdqsYrYgR03TFZ8os46hVEjxn3wZKZ7a+cdUl6hkAvDPnMKoJrcFa1CxFK4vqCJ3cVTkWUZhJQZ9yugcFctaWjRyA/dE4bFOBQbKduUXtlypuQbPG5t3Rrg95LXe7Uh6CCSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0suP2lSjtcaS7CQOdizBM/xyKiwBEpNc6JTJZ7/3Io=;
 b=jcBcIFNiYphCUilfPtOr5PCPO9ndXyoQM6EctnsKGT9Ec5X/uGKFlxk3YaRxnVvvpzVuue7ADu3SNwrrpZQwx2/+Ph9edGIeSZBE4bHIsSkyHx1dnXB2k592XHpTan+06uK3z47v1II1ahwpi1KAef0BT3+g8GRbyYuWV7Jqxc1Hl5sYccqUP2QgWapdOaANbzrwPBiNrV21MRiSenh0Aud3XmzANMSgFVdv+FZ7ATLDxN/+v4dV8kkMAJBXcuPN6OedWZnhAp5dwOrQG9OiIxyHGJkoWLpQYFgJufXAF/LYOfg2qOB0tAH38y/aIAWsjqPvWnPW3Z1Z6wdW2ZsVDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by MW4PR11MB6887.namprd11.prod.outlook.com (2603:10b6:303:225::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Fri, 25 Sep
 2026 14:35:39 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 14:35:39 +0000
Message-ID: <ab6f28d6-4ce7-477d-80ce-ba076cc1b025@intel.com>
Date: Fri, 25 Sep 2026 16:35:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ASoC: codecs: aw88166: remove async start
To: <webgeek1234@gmail.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Val Packett
	<val@packett.cool>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Weidong Wang <wangweidong.a@awinic.com>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
 <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260925-aw88166-cleanup-v1-5-11f74cb5fe28@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA3PEPF00000522.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::66c) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|MW4PR11MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 982c785c-d956-4537-cff0-08df1b1244cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: ACROUe6W1tj0PM3CbK3QlKf8M23InPFw0xC3EmT0hYoxzJtRnkxhUmdH60GvTOXYXgFp4ls/hdmlwDJImfrfh3xiGayumweLHc2QGCNT7PYxoxdKUe/rRmnCOXBzkBPVJ6QPUgt3zROOAOBMLSRhMa/Bq55dJ72wue5jGfKoY1oDSxbk4uD3Piq1mMxyy45Tvp0Ao03uTNdwV482gdzJispvxj7s6VJhtNkta2SApslsTC5dtEUbhS/cNb9wRGq0Sl9Y+NZFmghA+TjTaumx24CDkcE0QCcMZiliCMRypjF9SdCY63XminjQ/oyBtDkAA4vMK4Oa3zb9my5nTCHQ4dL9gQ2/LxJys7lMBCqdHxJfmSVZclxyHP0+RSJDggbfnA9SAQP6G2FYtKats4d9c6f4/uThHRqpU2o2jXQCZW3zRTIm4o+DcUqyM/BOWsH8lVRUVBp3K5y95nDNOJcn3AgpamlzTJMKeG/GG4YIybrJh72LqtOTCHP1GCzPqIZp9Kdr5JsPxa6mie1+KLNfmBOi02A2ciLUSyBRX/ab8QCBIvVn11Pj5z9CMy9z1jRJpBaILsTCS81pGvusIK0sRPq20ejuusmj4tper1jhkkqGavXUljavUeYhdVBuYq+Ja5p7eCPCMeTjGJK5AUjKKy7R/AbZZ6CMy/qxRjUgaVY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUhSSmliQkxieDY1dnVnaCtXOWw1YTQxQjBEUlA3RG83UEVjc2FYV1pCZTEz?=
 =?utf-8?B?alRxUkhJNDJ2OENLcTdXN0s4bTh6QmVoNG5rR3IxdzNJbk5CZEVYcngrZjNH?=
 =?utf-8?B?UTVtdGIwZnRhN0NxUWpER1llOWszMCtmUDZwemdOK0dGbEw2OHUzeU13Qnpo?=
 =?utf-8?B?SHNDbnUzOVBJTlh5K3JmVm01TTAycC85Y2VmNFk3ZnQ0OFBlVTRNOXBXSThw?=
 =?utf-8?B?OG5MTFI2VHFjK1VOZFpmYjBSUm5ZbndzTDdTS2VBNTZ0LzBOeU1PM1lQYXU5?=
 =?utf-8?B?U3dJRmtlQlJBeS96bWx0QTR3RWJTTDMwRUpqSGF3ajlucnZlZ3N2YnZua2tq?=
 =?utf-8?B?emhmeUExRDBtWmNuMGJXZDN2dUFNVmRjeDNVTVdENzNhakwzWVY0KzdqOHho?=
 =?utf-8?B?Y2pyVHNLR1JmUHpMMUVTcUU3RnRvZ2JMS0dBV3pxWFdsN1l5NkR2T2E2YVZp?=
 =?utf-8?B?OU1yZlIxbUtqYStrODE3ejBOSkk3QzR4ZUxFTVd0NFhkQ3RvaDZjcEhUdU15?=
 =?utf-8?B?V0tySWR5TVg2QkRvT0hQU3FnVHdVVFpPN2xEOG9qU1NBemNPUlJZbDNXcWsv?=
 =?utf-8?B?VElLczJZV2pZTGFxYW1TbE5xSWdtQ1VoTm9mZnFwcm12WmlubTdXak5zRjQ2?=
 =?utf-8?B?SlM5Z2MzMllaMm5XekVqQ2pWVGM4UzVkZzU5cStlNFNLL2sraW5lZEhKK0Jl?=
 =?utf-8?B?SnJha05lekZZcUdZR3FaVWVuMFFscXcwdVNEZ2xIckV3YmZNRkQxS05FMHU1?=
 =?utf-8?B?OXpoOVltaGc0MmNDT25JMStaTitNQkxqcS9ZM2FlVGdwVTZ4ZzNDSUtXcGk3?=
 =?utf-8?B?L0JkQzRDWncvd1JzR0VBT2NSc2dpKzdidnJ2V0UwRm1qZEcwaVRqK2I4SE9Y?=
 =?utf-8?B?NHNGcGFoWkVHVGM3Z0FUNm94K3I1Ym13ZGtmTWpLZ1k2VkVVQksveTJ3b2kv?=
 =?utf-8?B?MEdUdlpUY1lRamlNalZCMitrQ1VsTlFpM2tuaEo2NlFjaXVGdDcvd05sNVRD?=
 =?utf-8?B?TnFBZGZqNVBQTXRVcTBMcXNmZXB6MStjY2dhRWw3RFhldFA0bHUzUFpsQ3ZO?=
 =?utf-8?B?NTA3dlVsem9LVVFrdmpqY1dlOFo3ZDg5UWNLQWt4cjVnMys4cnBuVFhhMFRo?=
 =?utf-8?B?bmhNNFB3NlkxWHJiM2FlSUVwQ3pxZWRROWdtemlQSjJiWnFsUjNrcDc2c0Iz?=
 =?utf-8?B?QkpKbnJGUGttQk5MVWs0MTMrSjJqdlF4ZEF4TmVIWmcrYlJGVnM3TXJYWkp4?=
 =?utf-8?B?Uldubk5yRkQyYzNkNWhHaWtDWVdPSHE0WXZvRTN2cXhJU2orRXRXcmVpSU1L?=
 =?utf-8?B?TnU0UjA1NFZwRDRQVk5YRHkvQUpZY0o3ZFJqVWRRcHJ1ZXIwYTBCdTJ6R0Na?=
 =?utf-8?B?Z2w0UldSc0MyN1YxMVorN1NJaHNVTFNhM0hOQzdsNkZlT01KTjlCYWRCRXNZ?=
 =?utf-8?B?UWh4V3ZOY2VZUWpXU3pSVU1GdVRLT2lSbG54YWlzMVVlTTQ5QkJDTjRhUmx4?=
 =?utf-8?B?NVE0ME5XSWljMDlIWnpnUmpRS2JCQU1SRFgwRFZjM3NiUFpLYWgycVBlRURp?=
 =?utf-8?B?SEVYeXhCcVIxcHhSMSsxU0t6VFB6MDVPcmxDRUlkbzRWTjJ0dy9tdDQ3RHVt?=
 =?utf-8?B?dTF2dURqVWxZcVhXSzN4cVc5SWlCS1owTGNIVnVPODdWQzd4eC94bUo1czJB?=
 =?utf-8?B?dUtmdnJHakNCMyt0TjE2cmFBbXJyNXY0VVBwbGJuRHJhN2RZQ2NkbGFsbm5t?=
 =?utf-8?B?WU5SM2V3K3FJRjZVS1R1dWg4U3E4akpveHRMbmpLdWdteXJVajNPMHFabnpR?=
 =?utf-8?B?VmRNUWdscWp4MHRvdndLbTJtSmFTZXFrZWUzQ1FqY0FFamxHeFZRWjdEUEdx?=
 =?utf-8?B?SWVocGJUWkJ0enJOckk4bkYzTkt2a1BkbS9BYmMzaTZQSVIvK2t3bVJ4Qzl5?=
 =?utf-8?B?NFQ1U3V1Z3ZoZnMrVjRkVmZKdFJrUjU1U2d3aHFiRzNqMjBnZTVSaUJ2WHZK?=
 =?utf-8?B?ZG10YUxuSDZnb3FJOTNpa0pET3gxcmo4WnEvem1YeVBIWG1neTdLbWc3Yk5P?=
 =?utf-8?B?aGM1TlVNb0Y0MW91OUdjZ3kyYUVYSkQ4WEtDUUNDWFNuZjg4M2s3bFdVcGtu?=
 =?utf-8?B?VW5kT2pNYVhRK1JDVXh0ekdkdC9iRElrcHBMazd6bDZsaWlvNVM1K21lbVlB?=
 =?utf-8?B?ZmNWVVBRMW5QNDN1UjVkcDk3SVNVVWg1NHNSZXIrSmJiZXJ0M2dnQWZheDZp?=
 =?utf-8?B?LzN5K1R6VHowNm5Eb3RFUzZDYWFVZDduUkxqeHBZSDdTaUdPSzJYeHBWS2ZP?=
 =?utf-8?B?MzVTRU85bUVZTjF0cUFZbU9Rb0o5K0NaclZFaVJPaHRKd1dDdDRMZz09?=
X-Exchange-RoutingPolicyChecked: aEtezCO5DooPgYu5WZUGFJzQF+6sSu7YbfjFxCHRQyfJqQ+UZ29xM4PDMLVOMQFrpKkwlwXE6Mzo4GGNwBLRuLnixEo2bl2A3YJtdjw/ktKnU5jBwPHM2k6UMTZjMZmZIwRu8AWnrZF0rvsr/Zjl9sQXFvw3uGtxwBQu8r8acD2SZ+baIAhWKoTaYz1QuuMxtVTPCy29CDFFTfh1pzWHQalXQ539qVaq1Vyxi29jo0zt+QZ+uehj0iR3kSlWuesYmQSZKyWm8i60okeLLPpq2vAzXFUaoe91I/j8ldtGoSDCkt4s7CVc7We5lzJdd0q+F5ttfpqz4HNLjGaX4BLXiQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 982c785c-d956-4537-cff0-08df1b1244cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 14:35:39.0855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnXH4HbPSl7x1CrJxYMf03qToIE4sUB++T7beDWWBugRzY0qRhI/P+KZhlnVdc7YiHXqeAvBBN/syt33Kd7RY8yId9yW/9qklIPwecjrIKE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6887
X-OriginatorOrg: intel.com

On 9/25/2026 9:47 AM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Codec drivers are not supposed to do anything like this. The result was
> that the first second or so of playback was essentially inaudible, and
> very short alert sounds could be missed entirely. Let's not do this.
Do anything like what?
Let's not do what?

With all due respect, the commit message found here is so vague I'm
surprised people even review this.  Your change is not a one-liner
cleanup.  I'd expect at least a short description provided, on what is
happening _currently_ and _why_ removal improves the functional
behaviour of the codec device.


Kind regards,
Czarek
