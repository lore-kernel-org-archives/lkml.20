Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C194B8277
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789582600; cv=fail; b=qZtE37z9m5R2Lf6vfrVQu/l/Ol/EeiOIrKaB0wdk28gkpc+PaunNLi5DnE6lRzTfL04LyACd74WDwwHMEgVKXVVUMLZrCJ+zuRWpAgA5JW8Hv/O6EzuiN3GL2BOdkbr0vXGp8DSlWi7SzFgEgUxQ/onMCEZNP/RUA2hS+ZX5GRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789582600; c=relaxed/simple;
	bh=5lYptrDNgmyipGSLDyYP1JRrzJ3tRPj4DVA4Pu0vsdI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WkUyvf4PiHX/BNJ7vfGoyZ4v5Z7C07LnfSIMJMI9mRjEuCn/ivvBNppp6qP2SgZueQ3NJsmEwJ2i2CXZJDIirCW/DJxX0dEo2p56pgJkNQRHRTKe8sk/LwmChZIfBINbd1MMJKpu/6xoPmCSn7A+oul2lDkYP17iEbXp836o5ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2LLVJvQ; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2LLVJvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789582595; x=1821118595;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5lYptrDNgmyipGSLDyYP1JRrzJ3tRPj4DVA4Pu0vsdI=;
  b=E2LLVJvQUhHAFwCWx0t587aYJXP6io4P/qT4OOzEyX4s7klf5CRHat8h
   rAODUeL3j6U0NlJ9qrmBdx+5ww1ScfWRYHrC1FLn/NAysu/KL6wzSlBap
   lwzXOHcPW2kII90Ua4h3tpO7BmKAXB8z1HUGBarmUTEniQUGNzyi70Ryb
   MULonmoG5FZB02DHRqNQ9O9Yi9/PQUxExOYjyocOVsyH8+HdktnXC5NDU
   4BGlA5YvdmvfC4GFgYGeFwnZtrK44m4jtpKv3Z6aPA+jbqKRMiQkY32ta
   13TJccIB3zkPYezFmv1of5G69mVsjGyXal96Z/kTpsWdiAU3zZe4TdpaY
   g==;
X-CSE-ConnectionGUID: 80XANnaQSQWqWUfvsYWvng==
X-CSE-MsgGUID: by+luhn9QJC4Td8/M6R3HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77527091"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77527091"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 11:16:28 -0700
X-CSE-ConnectionGUID: n0cchZ87TPGlFe3Q3nlZTw==
X-CSE-MsgGUID: c2yrDW9wSf+K4MxJmxEoiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270783768"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 11:16:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 11:16:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 11:16:26 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 11:16:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjswbAClSsdrxjRx6HtBR8vRC8/althtK7aeDxOrl//qH7BXmp1F597r/wc9Oepi4GR2E7lYcJUukcTj+a1tXOWV4pqjvmOCS6X39dn8EbllDbTuOaJqshZ2SBFDiko5e3ptPjmFMX9Ih2UX/5AV7jJ1tWbnWdt7tKeBojDVAnmH1TwbuaMWUhnDCGyrRnoIS2zJEV9HDGK3Ik5uYKXngKeQgX/z9VUH+60Rn3gjkRNk0aC97wtht+3BYeIdR80bKVAu5yHBWZPts8E/IXbNXmiHOfC/DRWp2Og88lJlRTMSI8UIGn/43zyzmsXd4BPpO8VLjvwHZHsT8wB77saPTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeVwKf+NTR+6yKermcCUPpxaHOG10kp+9JJ2aCYVMLM=;
 b=yZwHGnoSPz4DU1R751dtesfKZ6iLP8p+4Xj1o7vzYPfgm2q3zFIuZia6NXTWSk9eCxxGSmZYV0FOSc7TFN/YVMeJAullsUSoUBBiLN/Yi0MQwgxFPHunUQpNIdHIH/KxbezsxS1HEVCz5OPbPi2x+3YxA1yDU8+r9c1CVRjh1Gh4m070noUPi2v7oDqPJ8VvkxiCujJyjkde05wna/0EoyBq+mwD0EcLPpfazz2enshSoccuPs14bdwveca1vLZX/erfUgAVpyY6geuYaI86ROP7sRjXlawp3qrqiOFWkZn0suyGNPigbZRFpNE1TQ6riAftZ1mbuCvfcjwYYJt3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.9; Wed, 16 Sep 2026 18:16:21 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 18:16:21 +0000
Message-ID: <88fa6969-c9bd-4c53-89b4-aee2c185fc97@intel.com>
Date: Wed, 16 Sep 2026 11:16:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/9] Introduce MMIO-based CMT access for Enhanced RDT
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <chen.yu@linux.dev>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1787976868.git.yu.c.chen@intel.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <cover.1787976868.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0247.namprd03.prod.outlook.com
 (2603:10b6:303:b4::12) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 264465a6-09cf-49ed-1a49-08df141e9c21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|6133799003|18002099003|22082099003|5023799004|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1DXECvfK/eQ/yi9kMmlNObCQpkuy1WmkHkcgSi0KvwDWmWkK+0Gd8yr2aIPtBhNfNquQL14BkxzjNIpIVspYOKVVwXvJYn+E95B3o8pevAoUswwwocjc80J0LIRfLToV+seQVx/OB+xvI8wMGybL0HIeLuYjBKYtXv9SkPaflRVU7gwO0huu3vs2AF+Z3afi3p7pem4CuQjzv7m8ortBxNRWRsJcRUAduCT1TSztcKl45vmFhql/c4HXoJe/dp1jy3VjhNWVGE4lSVPSOhUtuTe0Y7/+V9wT6IIe06euibdpqfihbGZNrny5BcY9aPPAh5FYtBDFwCzVMZk97zNK+6vK7Z0PlEoq31a8yCl9rhi6G7LKDWujt46mckXdxcol6XtxxrtpqFQO2BBmT4trAhjjZcyhnbCQlIWjCHTsQQXWqa4AJFei+taRHdai+N66M/R2170yiEIpNA2EiiHyO/q3UMVTpha1RJgsdFbhpCPvcrkrHOsBkfI+0WXoGeTnd7MxQDZDomWtbydpSrqtOHBn10rWSK8nLiRX+lD+QW5nO5aimNvCQx+w2+OtYOcn4PeNqMc7YrKlnAln+s76ZBLbRezQz1R1lBvE8/nBzQ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(6133799003)(18002099003)(22082099003)(5023799004)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0hzcC9RT01uOGZWSkEzVjZZc1U4cDd4QnU2eEdEN1FKY1BMVnJ1TElKVGR1?=
 =?utf-8?B?dnJzeTZQK09XNTREdHZJNUcyMmZGd0wzUjlNckJTdjlpeVZHTC9xREdlRSs1?=
 =?utf-8?B?UUtFUWtyUkNrUTg3azEzYVlwVU9xVGFxQjFidFFiQzJLNUdKLytjMU1IYW5Y?=
 =?utf-8?B?MDNlcDBHOHBOL1FuL3IzTTBHR1VSM0VrUUJtSm1CcnZFSmlLN1hTY2NzTUc5?=
 =?utf-8?B?OXI5dE5tRXZ4WjNVQzdFS0FKNDB6anREaStsdGFtbU5IRm1NdnBCRG5RYlRn?=
 =?utf-8?B?ZWcvaU05R3BlZUN5MmdvVjBzbGpxM20zSTFRN2t6cW8rQ0d3ZVo0MUVBWWFV?=
 =?utf-8?B?djYyK0toOG9MMnRBUXZHNG5mNXlhMlpCNFdZbHVGOTg5WEl5MVFEdDRCT2NG?=
 =?utf-8?B?bVRyN1hCd1owWW9pWFNtUnJYcW5SditnbG4weVFRTDlZbnNrcFNjSlg4RDUw?=
 =?utf-8?B?MTJpdTBjOVJGOWl2Wi9ITWhrRyswek1FMHFvWWdpMU9KRUJwcDExMHplcGtG?=
 =?utf-8?B?NndScnJBZTJTMk1LNEhFV2gvcFUrV2l1ekV5WEp6OXd3cUMyMU5GNmVkMTVx?=
 =?utf-8?B?RENLZTd6ZTdMYWo2aGdLaVV2VFRURjBFbCt3UFZUVUhEeHFGUXZPbitVMHZo?=
 =?utf-8?B?cWdrOWhRS1UyK2kzaDEwZ2pyd1hjWmFqcWxEbFVzK0tTKzNiZDNCV0NYWVhn?=
 =?utf-8?B?d1ZnOGRWUnJ0SGFDQVVSMnJyMlFnZHh0Y1BjWmJERFZEVGV3cDI3VFpkUUph?=
 =?utf-8?B?QVVuMHhJR0hVZkIwWHIrR1RzT01vTFE1bkhETitEc2FYVG0rVmUwWlBabEdP?=
 =?utf-8?B?dTZlQjZMUEZDTTIvK3h1UWRZK003OExxNk4zdzh1Vm0vbEZZN1UraVM0Nllw?=
 =?utf-8?B?cExpWVlyYzVHU3p5RFA4MitlY3FHRjN0TkVQcGJXZEtCS2JoY0JubGFOc25D?=
 =?utf-8?B?UzBSSUYzeXNCOGJuT2I1dWV5WVpnL0s0VFFBREJZUExjTEd1Rjd2S3BBUUJR?=
 =?utf-8?B?SWI4L2loYmkvOUMrNllaYUUydC9hT0plODV5QUxOMWN0NVRDKzJKcktZZXZh?=
 =?utf-8?B?NmlvZFhSeXdhUXVsMHlHc1VUUDhxeGc2dlM0ZE9QNERzZUJNSThWQWtyZys1?=
 =?utf-8?B?Mkl2aVZ0WTFnaWlTWm1YUDZGQTNrY01VOVlsd2Z3M2dVR1pTVEh2OUZFSWp2?=
 =?utf-8?B?YWVMV1RZTDBxQ1JQTXRYN2U1SHlCd3VsMlZ1c2ppN0Urb1ZSNExWYS9ITm9V?=
 =?utf-8?B?REs0ZTlSQ21TZXhFamRxMGVOeUNqMmVtSHd1Q1EyQXh0VjA1K1dMUkRIQjc3?=
 =?utf-8?B?V0hIci9JVk5jdTd6RHJLemc0RDEyWThibU5uQXYxSE1yQTVDenZLVEc3Qk9i?=
 =?utf-8?B?Y3NkV25FOFJ3eUtkRVJTZU5uQmRVZlBMeDhDTnE0eFk4OEg2RlZORmNqdTNB?=
 =?utf-8?B?QkQra2pKcFBFaHRLWWI1MEQ1TVp3L0FGN0lRZTRVakoyQ3dUSGJ3RWR5TzBN?=
 =?utf-8?B?K3VWUW5nbExkUGlLS1BYbEhoMkw4eUtMM3pZVWZHNDVHOHpYOTEvSWdCVEt5?=
 =?utf-8?B?RnpabE9lLzZSUnM4enI5aE80Tm5UZDZRRkVaZU43dlJDVlVXaFMyc1NPd0VT?=
 =?utf-8?B?SkJvOVhINW5RTERyY0dSd1NCYXZIaGg0NjNOWFVNVjdFc3A4bVZqanQwVjNy?=
 =?utf-8?B?dWtCQWROelUvYWoyb2tOY2NTTDZIYUpoRmp5UFBUekpzbjNFZ253bW8vM2Vq?=
 =?utf-8?B?MWVXQjJrZCtkWVM5N2lrcWxiZThtNXAzaU5YYWxvR0VsMjVrVUlsS2R2VVIr?=
 =?utf-8?B?N2tHcFYzZFJmV292NzBlZHhqd2t0RHhQRVczN1NML3hKTlQwSlFGUm0yWm9S?=
 =?utf-8?B?VUdKbXVUeCs1RXhOSUt1N2YxRnYrWHNYZ1FuNEJtM0Yrd2dkamhkYTUvT0V3?=
 =?utf-8?B?RjFsTGM2b2xjV1FtRGZMYlluQ3F1aFJGekVjSS82czFOUXRKUm9VMCtlTFlB?=
 =?utf-8?B?UmJaZ3M2cVQwL25Uayt2NDJyVUlSNUw2SlhJQ1V1bmQ2ZVVxaVFFSTJuUWdt?=
 =?utf-8?B?RTBvN1JRM2pGRTBMNVFKODVxSXk5OU11eXlVSXFzSnN2WS80TlV0RnhJdmxQ?=
 =?utf-8?B?dWt1bTRneWtYWW11R3REU1ZyT0JJY05KQVZid3N1Y3hxY0JKUHZ0NE82eDdi?=
 =?utf-8?B?WnQ1TEx0QTRmSTVLaXExQ2dnenBjdDJ0Y3dySElkVlNCdWNhNDlBVkVUbm5n?=
 =?utf-8?B?clpBcitLb0M2cEgyUXlWWWhmTTRYZ3lyeWJmN05GUDJOR3lYUFhJc0xWM01o?=
 =?utf-8?B?c29oa2JKMGVlbjdBK1VoZGtQUVVCdG82aVVuSGhFUkg0MkpWRjNQK0RySUF1?=
 =?utf-8?Q?qwKyaKKbDwiThnF0=3D?=
X-Exchange-RoutingPolicyChecked: 0923nG/Qf0ijbZL7A5e75rcnjDW/SPycHA6RIHwVGfdeGIG11nxJtnvhcQ0MGfPG2RkMlzGg1SkYsPJFPhPA8bxGZenoTj6VCKcYJ8KxomfifgVFF0T9z4oXh0U/H/W2qV7FXfS0vLZj2KX7r6WzNfqLvCoiq8kOHwj0GUuJifLusj+/+fbXFkfbI6YSNypz/SIjqbQZO/MD+s2reEWZegnLaar2V5C85elnbaY7ayO3dPSZ3uw+fvchO8WFgMvlPqXuSKkRLsfJjFQ5OsoBhPsARSAP9IKlaSQA2naebfGnFgN571raLoTjxc2qWPcUOdrzA8QbIGrxFV8ymP4fFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 264465a6-09cf-49ed-1a49-08df141e9c21
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 18:16:21.2414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GY89VIG4mAsNzD2950GRn4++BB1AwrwcmTkvqPdShpwS3BcOsHTHv67I9diyJdm6GtUSp2S5ZnQbAcLYTCj2aCANFCnRASLdqQmhCfMD4mA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
X-OriginatorOrg: intel.com

Hi Chenyu,

What is this series based on? It does not apply on top of resctrl changes
that have been queued for more than a month before you sent this version.

You can find latest staged resctrl changes on branch x86/cache on 
git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git

Could you please rebase this series on top of x86/cache and resubmit?

The baseline may need to change to master branch of tip.git when considering
this series also touches other x86 code but for now it can start with
x86/cache since it does not change as much as master.

Thank you

Reinette

ps Looks like Sashiko found a working base of x86/core of tip.git which was/is
   at v7.2-rc5 and without any of the staged resctrl changes that have since been merged
   into v7.3-rc1.

On 8/28/26 10:55 PM, Chen Yu wrote:
> v6: https://lore.kernel.org/lkml/cover.1784968626.git.yu.c.chen@intel.com/
> v5: https://lore.kernel.org/lkml/cover.1782866200.git.yu.c.chen@intel.com/
> v4: https://lore.kernel.org/lkml/cover.1781332698.git.yu.c.chen@intel.com/
> v3: https://lore.kernel.org/lkml/cover.1780710620.git.yu.c.chen@intel.com/
> v2: https://lore.kernel.org/lkml/cover.1780587063.git.yu.c.chen@intel.com/
> v1: https://lore.kernel.org/lkml/cover.1779872016.git.yu.c.chen@intel.com/
> 
> Intel Enhanced Resource Director Technology (ERDT) extends the existing
> RDT framework with two major capabilities:
> 
>   1. MMIO-based access to monitoring and allocation registers, replacing
>      the legacy MSR-based interface.
>   2. Region-aware RDT for fine-grained control over different tiers of
>      memory (e.g., CXL.mem, DDR).
> 
> This is described in the Intel RDT Architecture Specification:
> https://cdrdv2-public.intel.com/789566/356688-intel-rdt-arch-spec.pdf
> 
> This patch set focuses on the first part: enabling MMIO-based access for
> Cache Monitoring Technology (CMT), while CAT/MBM/MBA are still using MSR.
> The platform advertises the MMIO register layout through the ACPI ERDT
> (Enhanced Resource Director Technology) table, which contains sub-tables
> describing per-domain register regions for monitoring and allocation.
> 
> With ERDT, L3 cache occupancy counters are read via MMIO rather than
> MSR, allowing the reads to be performed from any CPU without requiring
> cross-CPU IPIs. This series parses the relevant ACPI sub-tables (RMDD,
> CMRC), prepares the resctrl monitor infrastructure for MMIO-based reads,
> and adds initial support for reading L3 occupancy via the CMRC interface.
> 
> kselftest of CMT and L3_CAT has passed with minor adjustment at
> https://lore.kernel.org/lkml/20260523101715.3964456-1-yu.c.chen@intel.com/.
> 
> Thanks Tony, Reinette, Thomas, Dave, Boris, Peter, Hongyu for your time to
> look at this patch set.
> 
> V7 has gone through local sashiko review, with false positives left
> unaddressed.
> 
> Changes from V6 to V7:
> - Let get_rdt_resources() clean up its own state on failure and drop the
>   asymmetric __resctrl_arch_late_init() wrapper. (Reinette Chatre)
> - Make erdt_max_rmid and num_ids unsigned and use a plain min(), match
>   erdt_ioremap() argument types to ioremap(), and reset erdt_max_rmid in
>   erdt_exit(). (Reinette Chatre)
> - Run erdt_cpu_valid() once in resctrl_arch_online_cpu(), and match an
>   ERDT domain to a resctrl monitoring domain by domain id rather than by
>   cpumask. Warn on an invalid dom_id and on a duplicate ERDT-to-resctrl
>   domain mapping. (Reinette Chatre)
> - Fix the silent truncation of the 64-bit CMRC up_scale: reject an
>   out-of-range value with a FW_BUG warning and fail closed instead of
>   using max_t(int, ...). (Reinette Chatre, Tony Luck)
> - Keep the original resctrl_arch_rmid_read() parameter order (resource
>   first) and drop the unused closid/arch_priv arguments. (Reinette Chatre)
> - Keep a single erdt_cpu_has() declaration in asm/resctrl.h, required by
>   the inline resctrl_arch_round_mon_val(). (Reinette Chatre)
> - Use switch() in erdt_support(), clamp max_rmid with min_t() so MSR-based
>   MBM events are not handed the ERDT RMID, and divide the ERDT scale by
>   snc_nodes_per_l3_cache under SNC. (Reinette Chatre)
> 
> Changes from V5 to V6:
> - Reorder the series so that the x86/topology change, which touches a
>   different subsystem, comes first. (Reinette Chatre)
> - Drop the v5 "x86/resctrl: Replace 'msr' in monitoring data identifiers"
>   patch. None of the renamed identifiers are used by the MMIO code.
>   (Reinette Chatre)
> - Split the domain setup into erdt_cpu_valid() and
>   erdt_l3_mon_domain_setup(). Validation now happens in
>   domain_add_cpu_mon() before the CPU is added to the domain cpumask,
>   and attaching ERDT data to a freshly created domain (Reinette Chatre)
> - Drop the SNC special case and the new resctrl_disable_mon_event().
>   (Reinette Chatre)
> - resctrl_arch_round_mon_val() now rounds to the ERDT scale instead of
>   returning the value unchanged (Reinette Chatre)
> - Make erdt_get_max_rmid() a global value instead of a per-CPU lookup.
>   (Reinette Chatre)
> - Use struct cpumask instead of cpumask_var_t, list_for_each_entry()
>   instead of open coded container_of(), and document every member of
>   struct erdt_domain_info. (Reinette Chatre)
> 
> Thanks Tony, Reinette, Thomas, Hongyu for your time to look at this patch set.
> 
> Changes from V4 to V5:
> There are some major changes since v4:
> - (biggest change) Eliminate the xarray for runtime lookups; embed
>   struct erdt_domain_info directly in rdt_hw_l3_mon_domain and assign
>   during l3_mon_domain_setup().
> - Separate CPUID and ACPI enumeration cleanly. Do not use CPUID feature
>   flags to gate MMIO-based monitoring. Use ACPI table presence (e.g., CMRC table)
>   to determine event enablement.
> - Use ACPI RMDD's own "Max RMID" field for MMIO access instead of relying
>   on CPUID's max RMID (which applies to MSR).
> - Enforce the SNC constraint in code rather than burying it behind a comment
>   WARN. Disable mon_capable in rdt_get_l3_mon_config() when ERDT is
>   enabled and snc_nodes_per_l3_cache > 1.
> - Split non-resctrl changes (topology.c, apic.h) into a separate preparatory
>   patch prefixed with x86/topology.
> - Move the "depends on X86" to "X86_64" adjustment to a separate patch with explicit
>   justification in its changelog.
> 
> Changes from V3 to V4:
> - Remove the redundant table length check in subtbl_valid() (Thomas Gleixner)
> - Reuse subtbl_valid() for all the table iteration (Thomas Gleixner)
> - Refine the commit log of [PATCH 5/6] to state that this change is a
>   preparation for [PATCH 6/6] rather than fixing an existing issue
>   (Thomas Gleixner, Reinette Chatre, Tony Luck)
> - Fix if CACD lists all CPUs in the LLC domain (sashiko)
> - Deal with a corner case that if there is no valid RMDD tables,
>   the erdt_enabled_flag should remain false.(sashiko)
> - Add Thomas's Reviewed-by and Hongyu's Tested-by.
> 
> Changes from V2 to V3:
> - Wrap __resctrl_arch_late_init() to avoid the goto logic. (Thomas Gleixner)
> - Make the variables in struct erdt_domain_info tabular format (Thomas Gleixner)
> - Remove tail comments (Thomas Gleixner)
> - Make the name of erdt_enabled() and variable in it consistent and
>   comprehensible. (Thomas Gleixner)
> - Use topo_lookup_cpuid() to search the CPU id according to the x2apic id
>   (Thomas Gleixner)
> - Fix kernel doc comment format (Thomas Gleixner)
> - Use brackets for multiple lines "if" case. (Thomas Gleixner)
> - Let the parameter for cacd_init() to fully utilize 100 characters.
>   (Thomas Gleixner)
> - Variables are reordered in reverse fir-tree.(Thomas Gleixner)
> - Added a named constant and use it in the rmdd->flags check.
>   (Thomas Gleixner)
> - Introduce helper functions to make the code readable when iterating
>   the RMDD tables. (Thomas Gleixner)
> - Make the macros tabular format. (Thomas Gleixner)
> 
> Changes from V1 to V2:
> - Add #include <linux/cleanup.h> to follow the "include-what-you-use" best
>   practice (Tony Luck)
> - Fix 3 issues reported by:
>   https://sashiko.dev/#/patchset/cover.1779872016.git.yu.c.chen%40intel.com
>   Remove the variable of cacd in struct erdt_domain_info as it will
>   never be used after initialization.
>   Invoke erdt_exit() to avoid resource leak if rdt_alloc_capable and
>   rdt_mon_capable are both false.
>   Adjust the comments suggested by sashiko.
> 
> Chen Yu (8):
>   x86/topology: Export topo_lookup_cpuid() for resctrl use
>   x86/resctrl: Require 64-bit x86 for resctrl support
>   x86/resctrl: Parse ACPI ERDT table and save CACD cpumask for RMDD
>     domains
>   x86/resctrl: Attach ACPI ERDT information to L3 mon domain on CPU
>     online
>   x86/resctrl: Parse ACPI CMRC table
>   x86/resctrl: Refactor the monitor read function
>   x86/resctrl: Introduce erdt_cpu_has() and erdt_support()
>   x86/resctrl: Add MMIO-based LLC occupancy monitoring support
> 
> Tony Luck (1):
>   fs/resctrl: Do not invoke smp_processor_id() in preemptible context
> 
>  arch/x86/Kconfig                       |   4 +-
>  arch/x86/include/asm/apic.h            |   1 +
>  arch/x86/include/asm/resctrl.h         |  11 +-
>  arch/x86/kernel/cpu/resctrl/Makefile   |   1 +
>  arch/x86/kernel/cpu/resctrl/core.c     |  61 ++-
>  arch/x86/kernel/cpu/resctrl/erdt.c     | 518 +++++++++++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/internal.h |  50 ++-
>  arch/x86/kernel/cpu/resctrl/monitor.c  |  38 +-
>  arch/x86/kernel/cpu/topology.c         |   2 +-
>  fs/resctrl/monitor.c                   |  44 ++-
>  10 files changed, 702 insertions(+), 28 deletions(-)
>  create mode 100644 arch/x86/kernel/cpu/resctrl/erdt.c
> 

