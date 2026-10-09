Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B914C4F40;
	Fri,  9 Oct 2026 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791543101; cv=fail; b=QetmLBh6/WDcZiRHSO5cKJDDieI3+Ac9EuwB1xi1R1ZPzyVj2JAu433eyybHvzA3hg7nYGf+cbk2Gyu1fbOdx7O2Hi0yWUAI7wKP6lVZxv+e6Xc+qEu2eTvInMGuybM/m7SpeMOKgBT5/b1UnaA9wdM7icVMQXucBIcMdJasu6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791543101; c=relaxed/simple;
	bh=9W2vIXzw40Khyu1bWbXhhDTc5vk44Qdhb++cywkiad8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hDiGBaBAW5cpTiyx2DvYsAEGdCh61uQhFQ2ospY9XgUCE+LiubESdn2jvqB4294cfRl7FlqbMWHB7mkIHFuZKOQp0+t8q9yb8kfCMT8swP7yO2DKwoMYr2XvVWAEu4KnNz0skz7JQTsfi1TbSyKufWT6Oy8onk+89ILSF7uZ7kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1i9dgTg; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1i9dgTg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791543093; x=1823079093;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9W2vIXzw40Khyu1bWbXhhDTc5vk44Qdhb++cywkiad8=;
  b=C1i9dgTgbU31yZwpe2MWjYNe3RXwqzNKny+tveE6k2BcTiu30ffA6AjZ
   9OP8cs31FghDF35sPqZFcDtrkoCP+RlkirRd1pffuxeWVmtfPb6b8La+j
   e58d1YUfYb7Z1AuvNaNWjNJfD5FKFpHBWjZji02YFRwfnxOsxCOvxRfd5
   Ntd77bh6ghXJtu59LzWbLaTsPoek1hzH8EsZZHga3/LSPmJ8ZvDu9hlMh
   fg4MM3hcXfNA62ySzzWopItxJas5UOeg8RcZhZFjiJJUVEVUQoCBRY5yb
   FOiVvV0HmrwAvzGyAtnNUEMumseFyMgX/TVUtkUD70EIahdrAJJqyBEy6
   A==;
X-CSE-ConnectionGUID: YJrxVrgfTfmX6MXeHtuiUw==
X-CSE-MsgGUID: vYzC3bMaRF2NxGHhSkOY5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="233857"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="233857"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:51:32 -0700
X-CSE-ConnectionGUID: 65RzNWGAS3q3OGyHOw+laQ==
X-CSE-MsgGUID: c5/hPQhMQVehLMf3+CG6Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="228388"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 03:51:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 03:51:30 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 03:51:30 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.45)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 03:51:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/n3hIyeO4PUMEiKzsuYJM5gdXlSN3Pd2/djV3fFnuDIzzoZcZv1eq+QEOXYwv5QxDrBk2l962of1eWtjD+HoSBCpWJy+wXyvIRkin9VPEfscCS3WplSFkilfzd0AKsWqRHFc78M5KJTcCqqvQ0fVRec/xp89LmyXfI9K1MZ55HS5x5KRK4cNeRADEiyFaC8sfX0h/SX4UJgcaCJm4AWoen5lTRqBzrdM+q5NDaN8ERxPw5UoV3b/NrT5L6pzzPCcn2Bns5O+fZN1odzi4+x67p5JYiQrjGTBV6AUfkZrW9YzDMBLfNx91QBd4kmQ+MpnJFFIc284X+hr5IcgC4NfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fATusquXtXgcG8YCMgEx8HFE5Nj6fzMVnNvZgIi7v1s=;
 b=BlLQrMvcOoIJ9EHGzFFLN7vuOd7Ro5XG/mM2nwd0zi8AH39aJ0pPztXDHgKM3O4I79uBaZ0LlhfEOjpS0tTMIkx4HsnlPTNMVRMjmg2nVav+khACjsUhgVPpWp8xFV7htx/Bhix7VWOXb1EjN0/brRokgLbCf2uMX/Cze+0D5Cym3E+G0ENLJjObEfEVWCRYTj+XswyzM3bpEY8zfr8GztAgJKD9XJdwamrzCRzgJJpl9/TjrDCQUAEuq4hsdi7hjqK0MlhSiPa4rw6Qq9QGXbddWjIzW0ziwrgYG+uQ9AF7+DIiU4F5NR/jdFLDq5jzLX2nAHr46pEHWi3YH8T9HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by IA4PR11MB9129.namprd11.prod.outlook.com (2603:10b6:208:55e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Fri, 9 Oct
 2026 10:51:28 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 10:51:27 +0000
Message-ID: <893e17e5-6520-4b4f-9ff1-15655c630c34@intel.com>
Date: Fri, 9 Oct 2026 12:51:21 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ASoC: pcm3168a: Fix the DAC zero flag polarity bit
To: HyeongJun An <sammiee5311@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, "Kevin
 Lu" <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark Brown
	<broonie@kernel.org>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
 <20261008130953.2446692-4-sammiee5311@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261008130953.2446692-4-sammiee5311@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0025.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::6) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|IA4PR11MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: c207c4fd-4667-4f9a-0aed-08df25f3450c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10067099003|56012099006|4143699003|11063799006|5023799004|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hNpr06HPjoApDQZlyMuhpMAA6FkIZUaiZxaht8Uc1N9yNtf83/PqDK861ctYjFECjsfXytpCiZJf4b8vgtEb1UpMm3/ZkRuCWsaVb5N7qYtVYY8jpD4lTo/dTn6gahO/uM9NCfGfWn2qx7GxrtXOXNDiX16WdzxLq9TTsttnWqLWdTkDuMEfJ7af1lrzRrfOAq6BE0of1qYN2YyEkLxOg8gySFTm/8gl5TwcFj9EYQYstFRtCeg0dR97/NHQhiRelYWs3ZLreNBNEDc6fTdRBf8Gk9DZ8TJgAlxK++P17gNOHgEpgSJiZRQ91/IoMwRjGExk3rFZMGG2DRD/Jfi+HcmAwPWv6i3SfKHlFehWE1IufJFEGJavdOck35Y7v3yIjfZFyqOyq+SjjX7VBWtfd5yUMJ70Czq5TOYMunD/ZcX8I0VzSsT/VfCRHf3VYFCzhZ7nmocHJGc2j1nb1nT5zuZaIfXo3Gj1BdOHO/a2LUUNtGYxBczz41SR1h7Qm/WC6HbTSnienYisMDMaZbv+2/6S5bLvURQSuO9vgLGR+9zNDogGBJiEBxM2sbt4j6gsiapcyocjcH+McjVzHPPt75E6bzJvs+eGR7e5nXSFYMEQO2WNdD5kqTha8X5vZBf24OaD1FLOnlW6XMXoNzm/C1d9oO/3AZWs6nRarC9aI0E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10067099003)(56012099006)(4143699003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmtEUEJFMTJrRlJaQ0YzZEF4UDR0bHI2MkgxZFVkTzFWdUJDTm1aNCtxb1Fa?=
 =?utf-8?B?dVUxa2FhaVc2bWNLT29uN0hZbDU1SGhkSVArYlZiNzlsT3Erdi9JbW03cWpR?=
 =?utf-8?B?bDRFQ0liNlZXK24rbFJzWnhlbHIvN3J0Q2JxRWZJZ05nRHpCSCtVb2RKT1Nn?=
 =?utf-8?B?VndUaURXdU40TldNNG93MmVUWjJFRW5kcGlBZ1h0NncxdkFFbTRmMGVLK0Nq?=
 =?utf-8?B?b3lXbEJHbWxvYnd0TjNuSlZEUmxWWjdUUzdMZThCRWtvdGtoSERuVnI4VXJs?=
 =?utf-8?B?QzV5bkRMV2haZVM4bnhvZDZyUHNiajFXcitwWUI1bnh3ZU9MbFRNNUhjRGV0?=
 =?utf-8?B?YnFOYlhyaW5TUzFpNGlyekU1TVg5VnlUaG9NUDlYRG8xcVkyendwQkVVZkND?=
 =?utf-8?B?YjE3VFhBM1U3N1RTbVNUcDljcU11UFd1SEcxSzRSQ1MvTzJpVERoT0ppVjR2?=
 =?utf-8?B?WURzUG1RUDdBa0FKMW9wOG05QXB0ZlZVNklBOXU5TjNZYXF6SWFQSFlTcXpx?=
 =?utf-8?B?Nm80Z0VZZUFVQlNxN2JFTk10eUFWVElValpvRnpSM3NzVUNIMUU0eDQvVVFT?=
 =?utf-8?B?eHpQR3U0WWorekViYVBJSnZidS9oTjFhazFXZEtUazd6bkJpSTVnU245eFdK?=
 =?utf-8?B?bzVpUFhWTUszSERYQXovbmw4am52a3dGdDdhSDBuSWpPSzRTa0htZVlhc2pV?=
 =?utf-8?B?eGxhcjR2Y09wVlhRb3pLYW5SaGJkVm9VRmwxeDZwVWtIK2VXWnVBSWpodGxL?=
 =?utf-8?B?cG9YQ3l5Qy9LczZzMXZaWi9VSVdiSjVCNzlGZnhDMWRqOHNEMFRTR3NOUHI1?=
 =?utf-8?B?eitwTy9NWEszZGRqK1NaQzhmVEpPSnphc3VUSkJNdW1Pa0xGVjcxM0pWZ3Jo?=
 =?utf-8?B?cm5ubFJiK3BMMnZabUI4WVVLVDloenFNSGo0Uy90L3d3dER6andHVDA3ZHRE?=
 =?utf-8?B?S3E0L3hTSXhmREI4UTh2MlZWYXB4QkFmL2ROWXo0TTJCWHRYY2ZQU0pvbExJ?=
 =?utf-8?B?NEdLUllqSlc0K00zRU9EZVVkVDlFYkhPTWgra25vaStXUXdUWkdRcWpWSTdt?=
 =?utf-8?B?VVlIVkJMTnViNXVseEZRVEdCSGVmMmxtbThqMWhLbWhsMHorcVdsYWtVYTAr?=
 =?utf-8?B?cUxLT1RxYy9YUU5qMzlrWmNNS1JscXlzUTdzaXhIWGpob25aT2R4L2xWVnVm?=
 =?utf-8?B?eVVjVmMwbGl5QzR5TnZGWlA3MTRyc2dxNmxNVFZ2cW1UN1RTY1BHM1JQTjZX?=
 =?utf-8?B?aEFudjJNbUZpUk1uNVZoRG9WV2gyZjVFdkdCMjRDdlpDYWY5bCtvdGMzMlcx?=
 =?utf-8?B?MDNkdzVmYmttVW0rR1J4WDhSdFQzc1pybm5aamMyN1lyTENYUFo0L2lvV3Nh?=
 =?utf-8?B?NUZyd1c4RG1hREErU2tMemsxRmlpSFQ0RThOMWhyWmp0RG9ocGZVbkg3RC9Q?=
 =?utf-8?B?bSszSGNqVDMxSzEwdWVqczJFU0dSdVArQTdTcEdGTlBqYzl5eWRJMlVJNkFR?=
 =?utf-8?B?TURoblJvR3RqVlNXdERpTlRyWTFhbTZxdXdHTUJNWG16WlRkM1lWUUJhMnJr?=
 =?utf-8?B?bEhrbU9HbWFsS0pkczZ2SURNK0R4RlprN3lmdjVTWkcvU2xGTitWWTRsajF1?=
 =?utf-8?B?eVFPMnJUVkttT3F5ZUhETkVMYjZuNysvYm1KQXlSN0hlR0ZrWHAyN1NPSDZq?=
 =?utf-8?B?cmw3c2U1RUE2cG5OT1FjM203Z2JxOXJ1dWF0amlZMzRpY1FRMlZrVnlzQ2FB?=
 =?utf-8?B?b0NmNzhtUFFodTQ1eGhUbFErQjJOTkFib08zUGRadGJYR2wvTzhzSFU2UFVy?=
 =?utf-8?B?QnJncGVnUGdtNlVLMFhmVFNMbVRuakg0WlNwRjgvbTIwc2ZXUktSUlBuN0hN?=
 =?utf-8?B?OUdNU0E5R0VhY1N0ZkpRbHZXUXZMcTJLcUUwYWVMNTF3cFZGV3BRZTU3cXoz?=
 =?utf-8?B?M0FhTkpwZEhCenBsMGJudDU4bW1DaDRzZEFodU5Pdy93WU9ndHBnMlFXSjFw?=
 =?utf-8?B?WkhjT25zZkhNc1k2djhjQWxEQUhGY2t6Y2Zyb2l3Q0dFQzNWVVdmckFTMGl6?=
 =?utf-8?B?M2RmRjdkek5wZTIrSnQyMUFGZlUwOWxlc3A2L292VDNnWDRNbytHeEY1M25L?=
 =?utf-8?B?VDdoNFNFVFViMEpZMlVaalpqTUwyODAxcHZLcVhoQlJXUUl0WUtlRjRNdnBY?=
 =?utf-8?B?K3NNSjZoL2thSzBhcEhFb2RuSWhxZnNoUUZZbG16ZU1oYkVwcDJIUUFjd1U2?=
 =?utf-8?B?ckZpdGNWT1lBM0Q2NkM3S1VFUGlGcEZGTzhqNkNrdVpVM1czaDZNbUxUZk9Z?=
 =?utf-8?B?SFB0c0JsMW9rMHRLaVZ0alZRS0NEd3I4MktXVk02M3BjSU9QVnNoUURieHlP?=
 =?utf-8?Q?3H/P/06oVg/BEGMA=3D?=
X-Exchange-RoutingPolicyChecked: meHL5C6ipWs7yzrVmsjUnrXDde1kk09R6KH4smZaARmqpm26WXHfLdGqQzj4iiip+mfcFHnr9MlpC1Qxv9NFRgcW45wKXetI6nEk4jPCkHAA83p9gi5TFsYEOzejmIQ9u2NORl4e4gGb12hSMksZqzruYFENqi5JQybpXv4MrYuQ+V+RAFie8C+nPYb3NaWmWkUDej7fccZYs0p18qP494+l4H6upa6gd3HJV0wA3LqMe/t29CHFqeFvJU2/gdFdy+1lWFJWZJhDLncqmTAg/gguW/rj5JUUzTG+brxq1m0CQMxAte7EwtbzKXratZsi+mEnTLC265wvgUGDR+SwFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c207c4fd-4667-4f9a-0aed-08df25f3450c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 10:51:27.8128
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFIHC9GjmIA/xSyDTCSNNKBdNyVGBXZT2mGrnFMoXGeBV7vuSVXYBJroArSlo3ycEadSJAa7xIOl8yBy3b+kKh2YjbRlODsfgqBTKdGXKuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9129
X-OriginatorOrg: intel.com

On 10/8/2026 3:09 PM, HyeongJun An wrote:
> The DAC Zero Flag Polarity enum uses PCM3168A_DAC_ATSPDA_SHIFT, which
> is bit 6 of register 70. That bit is ATSPDA, the attenuation speed,
> which the DAC Volume Rate Multiplier enum already owns. The datasheet
> puts ZREV, the zero flag polarity, at bit 0. The header defines
> PCM3168A_DAC_ZREV_SHIFT for it, but nothing uses it.
> 
> So changing the zero flag polarity changes the attenuation speed, and
> ZREV cannot be set.
> 
> Use PCM3168A_DAC_ZREV_SHIFT.

The entire message could be summarized with:

Field DAC Zero flag polarity select (ZREV) is found at offset 0 in
register DAC Control 3 (0x46), not at offset 6 - DAC Attenuation speed
(ATSPDA).


In regard to the commit title, you're not fixing the bit. Your change
actually makes pcm3168a_dac_zf_pol kctl useful and working.

ASoC: codecs: pcm3168a: Fix definition of DAC Zero polarity control

> 
> Fixes: a9b17a638af5 ("ASoC: pcm3168a: Add driver for pcm3168a codec")
> Link: https://www.ti.com/lit/ds/symlink/pcm3168a.pdf
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---
>  sound/soc/codecs/pcm3168a.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
> index cb6a6f08f2f8..6f45ea4869a7 100644
> --- a/sound/soc/codecs/pcm3168a.c
> +++ b/sound/soc/codecs/pcm3168a.c
> @@ -103,7 +103,7 @@ static SOC_ENUM_SINGLE_DECL(pcm3168a_dac_zf_func, PCM3168A_DAC_ATT_DEMP_ZF,
>  static const char *const pcm3168a_pol[] = { "Active High", "Active Low" };
>  
>  static SOC_ENUM_SINGLE_DECL(pcm3168a_dac_zf_pol, PCM3168A_DAC_ATT_DEMP_ZF,
> -		PCM3168A_DAC_ATSPDA_SHIFT, pcm3168a_pol);
> +		PCM3168A_DAC_ZREV_SHIFT, pcm3168a_pol);
Good catch. Not using the kctl with Intel's DSP + pcm3168a configuration
but won't hurt to say that no regression occurred.

I'd prefer to see a better message and commit title though the code
looks good:

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
