Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F25A40EB8D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790632501; cv=fail; b=hh/NPG6EU7Q9ICxo/3nRieoTfRf8l8wn+eZAfez5Xut1lvL/1+LP3r1bR4mhYwvE1dANQxYZD2Gwx4bV8cZTihWSqW0JRpMrofCc1J25cZwLQAVCGJq4qNnhkur/cgc2WEVcThqTTMXSDWaueEJiwlqXSMxv07cxPVP2vIKyIgc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790632501; c=relaxed/simple;
	bh=fQoiHqFimGenW+SXf7e83DkBwe38R6w++1qhS2umrTY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jZ6icuEsnJRhLN2KnrobahDQ/04VmSWo3ulK1YNiwFd/n4vJX+oqpHX8xaFw9pFFY/LuVdkyaYEa1LL/fD+4gtJcj9R4tX3KUVIyJAbl4fwUB1PrG+I2i4qRpyLxtrZBytTLg6YZCcY3tUgSyDoylYcLc/XeEnP+GX7z3PIecf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hsiwEGeq; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hsiwEGeq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790632497; x=1822168497;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fQoiHqFimGenW+SXf7e83DkBwe38R6w++1qhS2umrTY=;
  b=hsiwEGeqScF1uadoApO5KN8Emi0Djc4SSzgFCGLNT2UavvcnqWSB225p
   QIX5bZUE70MwEW7d630JEcACB4DwRtahifKZygUudMNYz7N08t7+uyaWg
   dis5nCzm1H6Ojl6wUeb8go/K0Q0U7ndY57JM0LxfLG9VrsxVy+2HyEAkB
   TSkyIVjHA1ZUgXJ+4srYAc3RFByXwiulKs4P9U8hRehk85LPB95b30QvQ
   fivRkoxjj2sBwYQPxTwuKGAbibUV8s7UXHBKhNNklloLO+2sTmN5B2D3P
   EdSOhys4ow4OX7w2ABNJFbc3o1Nrd3Cwo2KJmrM1sIZMhZoLS3VdvlESG
   g==;
X-CSE-ConnectionGUID: m+q4JqN+TSuNWPbOXuNvlg==
X-CSE-MsgGUID: hJIZ/pvjR06Wqa+X79QtWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90472378"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90472378"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:54:55 -0700
X-CSE-ConnectionGUID: xo/Id60VS7SKm3DbQmVZzQ==
X-CSE-MsgGUID: c/TDmREkSvehKqX8ti0Q2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="303114005"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 14:54:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:54:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 14:54:54 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.65) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 14:54:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcO9CbBJp1MCJkdY8951wuYOuCpJw3eEMorkRiFVqRb7sT/ZqTeTt5va7b7tWaecImFiGVwQ7mfNoeJZkvybqt/ve8wKTh60iry5BUPk6DjPgD4TdRK4NwFLVIfU8w01K+KcSgsNcVokVEaYCy5L2dM21lmvXl0Edb4TqqS89r8wGjMoFtW2DbcWLvdTDtGJpkcSSnBkDEvAmwZXdCw71mlFyr2Beei5M52Nk0z+sd/z5ECxVG92Stz37BtULvz3Jl4q134D7p/cWDdYRG+Vu7WekxGPgJeZ6AnWUi44au9HcceEuLReJedSx1mUiF5nKF+0a0OPdEDB+ZZoonNRAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi8h9ECA1ar7UmHdSGRhcCUvsBiSV2sxL89eQYOGk3M=;
 b=ca2ePhK5HXt5oCGri36AwoEtoqFzBEZnQRJLn1JFldhiApHgGpUtX82O3mSiOk8DVgwdIut8XWsQolYXResbdf4xaCclKrg9YDzS0hOUvpbAXQmvqQqMJdTK3d+j+pFiDLwZbcq7SVei08/lSbEo11TjHnOTOZlHD+YkheeBSpzjpZMBxANDErEgI+UBrSHjggVVoOD/eJ1THta5FPgK5ZTs5CZ6JRUD8QUWZYivUiYH7ykQDnEhNG2aKoVbeaIgFYVxJl3MkINkzAr1dFlzLlTPpj22jP98gyC0wm1pO3ZyIwmsP1dPrBfz09cKST2haN3jnw/YEM+LYx/lZV13RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA0PR11MB8378.namprd11.prod.outlook.com (2603:10b6:208:48e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 21:54:50 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 21:54:50 +0000
Message-ID: <6999ac64-054a-4f7f-a62f-36f8efb129bb@intel.com>
Date: Mon, 28 Sep 2026 14:54:48 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] x86/resctrl: Add MMIO-based LLC occupancy
 monitoring support
To: Chen Yu <yu.c.chen@intel.com>, <tony.luck@intel.com>
CC: <tglx@kernel.org>, <bp@alien8.de>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <fenghuay@nvidia.com>,
	<babu.moger@amd.com>, <hongyu.ning@intel.com>, <chen.yu@linux.dev>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, Hongyu Ning
	<hongyu.ning@linux.intel.com>
References: <cover.1789705667.git.yu.c.chen@intel.com>
 <bfe91aeeb714f14e2d1a9c3066ceab0e62c3c231.1789705667.git.yu.c.chen@intel.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <bfe91aeeb714f14e2d1a9c3066ceab0e62c3c231.1789705667.git.yu.c.chen@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA0PR11MB8378:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e989bb9-8223-4102-8f3f-08df1dab1ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|7416014|366016|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IBCJzpOzMMxjs0AV+X3Y6yT9YuB7dkhonQUfR/PmCyTZFmVTvKatLTKeg9V0+0U0AiM8/7uaHyshu1G5tax3vWKeaOCY3pOJh3+BqnUbk0q7m9LNXuNAURv36SXmaQxLp8YxSBDyB/ZFybGVAvFDm5F440cGFqH+2MN0BkrDItUu37pwGFM/0jJdoaDbTskbANAegZhMZ7apNjGbbyt9yyBRSX54nEPL5qja9jb08Rc9Am/yg1LtFQ3y+ZcysEBQzSrEMqUictyq/aOA/yrMIxUtMtMuYxGJ8tgoJMBtNSKwvRhVPkmljm2xScHRZyrzMXdlJkeCbuuJbnNBZDgtdmLM8uRK9oWWATnhIbXQh0zaL+LcewavD5+OwWQsHqUWlcI0Ml8Ts5XN9k7oZHKnfTf3MAsw5c+2L25KL3xzCNHpjAiCtqnK5uSo7BqnN78+vV9B7aUPL7DYk4Nm2zNb8cvSZbmU4l7bT8f7UbHEB5lYZeY/9xO4xwd2xX0emPctfZW/895ygelcvzxFgmpiX1Xs1QTmGd9/Wj6fGVIJ7SkmcxGjJdhBACofjhfIw58Ztc2rBiaMoIT6/E4SXSdGzaz3cltDWcge1dIHVt+4MF8Iian9a0tLAnLh/BUFllHTYmMopCDYCN6hEOZ25EB9tQi7os+Q75L9SwThf+tXK9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(7416014)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blhtYlJBYlpNaWNwNHg1WEdqY1ZyVkM0eTlHcE9sZmVmREFPREV5MElqYmcx?=
 =?utf-8?B?YzV0bDQ5K3hmYVBwbjVaam53akFnM2docWxQUnJMYnV5enJWS0tHcHloUUJS?=
 =?utf-8?B?ZlN6dWw2MFNuV2UxUVorQUdKc1hneDc0YVZ1VjJwalZKZ09qUExBYWlQcWxL?=
 =?utf-8?B?cmV5WkZSUk5KaUxYZTdGei8zWGJFNWpBa3NKZGErUkVrL2kwemdHcTN3QkdF?=
 =?utf-8?B?SUtVYTgxelZHblY5L3h1VzBRUENqdjlQU3pEL3VDSnlEa2JOMVJyNkNYZDdL?=
 =?utf-8?B?VkNLMEpvSGZ2SlVBVHhoQ0dCc1R1Y0YwU1hiUkwwdE5IQjB5dEVUamZkVFVz?=
 =?utf-8?B?VFhDdHJBNTAzS2M1WGV6OWdLZVhLcmNPV3A3cDEyVU1SbzNjT1VFWDlUM1dO?=
 =?utf-8?B?aFMyam5DOCt3M1Z6SG9PUVlFTDZKUkp3YzA2anRNN0FmWHNab2VWMldKQ1Fi?=
 =?utf-8?B?LzZ2NndWTWFWK1pGVEhISzZweGo4TnpJcVEwWVNvWTVydmZLVFBsaVVwZkdz?=
 =?utf-8?B?TzhzQ212cXJxMGFRUXVrZklDaFE5YkJmWXlqek90RjNwMFF3Y1ZOM0QrVTJo?=
 =?utf-8?B?dEZja2s0SzJWVzZURmcyNm5jOFdKNXh0QVpMS3MrMVB5YkNVcnlMS3AxQ0hu?=
 =?utf-8?B?b05uZnR1d3dLd1ZXUHhFTXArMVZZSTBuSzdQSXIvMWM0NitFMDEzaHZEdm8w?=
 =?utf-8?B?WXlDaXU1VFM5ck9xbFNaaFBmTk11WmVjenBTZG16RTFmcGVDa2JEaXA0WUcv?=
 =?utf-8?B?VHlIRmVEenQ2TkdTRlZVc3JpRnVZcHA4WUl2dTJkQjZoVllnaEdTelBFYUJC?=
 =?utf-8?B?UTE3YkM4ZmhISUlDQ2luRFVIRHJ6cVVPem4yK0FMMUViaHF3dERGSk9sRmV4?=
 =?utf-8?B?QnVRYVdKMS8zYU9qNExYRy9PMi9DQUhYSThVbVhlQVlYQkh4Z2NVSVRqT2JZ?=
 =?utf-8?B?WktEVlNCYU9wc2d6bEFRd2x2RWNsaGwrS3pCUWZQMzVKS0xrajNGcnF4WWEv?=
 =?utf-8?B?anNjTndocVdOTklkUC9QTGFBWUpRREFOdnF4YlZmYzdpckUwOFc2dXBibDBZ?=
 =?utf-8?B?RE5aVjNoNzVqcnlLaEx0Sjk2YVhxckQxMUxjYkgySHRldlQwaUtWRXhOcTFR?=
 =?utf-8?B?S2FDcytWdjhnS2QyTWJNdXBBMUU2UFIydERuMGZqWTRtUllCSU9TMUcvVEdF?=
 =?utf-8?B?SHI0NzEwbnFTc1NLSHVYUlRRTlQyYXdYQkxQMllXV2JKZWN2ZVBGSjloaGpC?=
 =?utf-8?B?UXJlSVdnS3lDWW5BMVd3NzhZRkxJekRmb0FXQTlReC9CQUkvL2FlVWYvNWFJ?=
 =?utf-8?B?WWg1UkRSY0RSMUUrcHZpMi9xQnRla2g1elFaanA3Nk9FdnVWNHdDQ280UWE0?=
 =?utf-8?B?cWdsNWwyOExzQWFBYUxybkpPS0VHRGJrUlBYeVhDRmw1RGlpLzlGMy9qejdL?=
 =?utf-8?B?eGtqQmFnWDRVQUdGb1M2Vk1PVFhRVENEeUdWYy9iQUpmZzNmbDAwMzhxSndz?=
 =?utf-8?B?Q3IzbmwwNWxGUHk1cmhYajU4c2NJdnpvd3U5dVBERTVxWjVoTGFPaTlqRlI3?=
 =?utf-8?B?anFVOUwvRVhjZk9ZdHAxeTBESmdzOWZGeGloVkxZR1NrRVU5Z2tTc0pjNTVE?=
 =?utf-8?B?UkhIQ2h1SENGOVZzWFlmWVNyVTczaXhneEtVZHNsb2xVTFBZbG8rZXIvSC9N?=
 =?utf-8?B?VStSUkVJdDl0cW5BMEg4Rlp4Y3MvQkU2dm1rWklpb0dsWlJPelduaEM2S2l4?=
 =?utf-8?B?ZlBVMFhQdHVadTBMQnhGS3dYVUtBbTIxUTFZZjhBWllROWJrdjNyOXdtbzUy?=
 =?utf-8?B?Tkgva2R3TjNES1J0cmZSTTVHWVE1ODdvSVZWZndnd0kwcCtIaGRBaE41NWJC?=
 =?utf-8?B?RHdERkNDUkl0Ni9Eb0xjUDdYNEZIc3BsMGs1NFVHWmVab1llTzRWcUpKMWkw?=
 =?utf-8?B?Wm10WWZxRW5QeGtKZmJVOTVRSVQ3R1BWMjI4aDFLbEJmM2VyTUZqbktJdlpH?=
 =?utf-8?B?NEhndnZIK3A3bURMWUFYTGI2TytaYzJ1TTZPVElFNCttaGFLSlpERWFzVTdE?=
 =?utf-8?B?aEVOOWtaRlJwL0R1RUkvS05ISGZncm1uVXFGOUczUkY2eHNUZm5UQUpEVkJk?=
 =?utf-8?B?Y29KbUVXMDZ5WGJsTDYxUzVlZy9teFVtNFc4RDhHSzJjcGNjN1pwRmZJTmRt?=
 =?utf-8?B?RjdJdTlGeEF5UFM0QVZEZlRFMjlOcWtEbkdWbUZqVytFNnN6TE5ySlZXcy9S?=
 =?utf-8?B?Tk9LWjFHTnBtS3hoTC91Z3NISHhyQi9lYnZFWHJhOTBHcHdOR01IRVIxMm9B?=
 =?utf-8?B?NlVvRnRGUjQ5RjFXMm9wWWxUUnd0bXdJc2RtMG5SS0pwM3VSR2xWaEl1azhv?=
 =?utf-8?Q?bA5/gD+QoHfQys8A=3D?=
X-Exchange-RoutingPolicyChecked: J/aMCEgE2Giw2RHl4nVoDsPYme1lyJBNWCHCK7r0vhfxo8b/m7UTBHr/GNy28j1mc24OQ9ywNrcRsbjabY4jkRG3xFTpI85w+YMvaVrWFP4nb62Tj26Qx4CNxx+hre+M6z7rL0l1jvhUQAUmTVTMybnlOfT+R6VcN8HYOhIBVm9nsz3eI+efcPEf4QbO+eTAW4N6+js2WY6DBRcTMPfuUMHix39vROfDBu+E9dgqg2ol0myY10Z4AsQbTPv/tZi7MCUsFuDCx1YrqNsXG0XERD4EWkYn65m5pkKkPOtmHAEB838VdPMNZ5cUK9p0b6dQDO8QtTxcuMtZVXAGUq7QPw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e989bb9-8223-4102-8f3f-08df1dab1ef9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 21:54:50.7922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yHkRXZ7N5tIVMpftuknUxz8xOrXoc6p0KN0xiI92F90BcnuXYILexAaowambizvoJjm1+/NwlpRl0+yXfEV/ZUJT3NqFKwgEa+8v7xm/nso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8378
X-OriginatorOrg: intel.com

Hi Chenyu,

On 9/17/26 9:51 PM, Chen Yu wrote:
> Add erdt_mon_read() to read LLC occupancy via MMIO and use it when the platform
> supports ERDT. Register the L3 occupancy event with ERDT enabled when available,
> falling back to the MSR-based path otherwise.
> 
> Use the CMRC (Cache Monitoring Registers for CPU Agents Description) ACPI
> sub-table to read LLC occupancy counters for each RMID via MMIO when ERDT is
> enabled. Store the CMRC information in the rdt_hw_l3_mon_domain, which could be
> accessed directly.

Regarding "Store the CMRC ..." - wasn't that done in patch #5?

> 
> Although the occupancy counters can now be read from any CPU via MMIO, the
> per-domain limbo handler is kept. A global handler would still have to iterate

"per-domain limbo handler is kept" - needs imperative

> over every domain and would only save one worker thread, which does not justify

"would only save one worker thread"? this assumes that all systems will have two domains?

> maintaining two limbo handler models.
> 
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Chen Yu <yu.c.chen@intel.com>
> Tested-by: Hongyu Ning <hongyu.ning@linux.intel.com>
> ---
>  arch/x86/include/asm/resctrl.h         |  8 ++-
>  arch/x86/kernel/cpu/resctrl/core.c     |  5 +-
>  arch/x86/kernel/cpu/resctrl/erdt.c     | 74 +++++++++++++++++++++++++-
>  arch/x86/kernel/cpu/resctrl/internal.h |  9 +++-
>  arch/x86/kernel/cpu/resctrl/monitor.c  | 14 +++--
>  5 files changed, 102 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/include/asm/resctrl.h b/arch/x86/include/asm/resctrl.h
> index bcfcc8ac1fe6..31c2f81cd06e 100644
> --- a/arch/x86/include/asm/resctrl.h
> +++ b/arch/x86/include/asm/resctrl.h
> @@ -135,7 +135,13 @@ static inline void __resctrl_sched_in(struct task_struct *tsk)
>  
>  static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
>  {
> -	unsigned int scale = boot_cpu_data.x86_cache_occ_scale;
> +	unsigned int scale = boot_cpu_data.x86_cache_occ_scale, escale;
> +
> +	if (erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> +		escale = erdt_get_scale();
> +		if (escale)
> +			scale = escale;
> +	}
>  
>  	/* h/w works in units of "boot_cpu_data.x86_cache_occ_scale" */

This comment is no longer accurate.

>  	val /= scale;
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index ca7e67f976d5..135f2eb2a5a5 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -1007,7 +1007,10 @@ static __init bool get_rdt_mon_resources(void)
>  	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
>  	bool ret = false;
>  
> -	if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> +	if (erdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
> +		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, true, 0, NULL);
> +		ret = true;
> +	} else if (rdt_cpu_has(X86_FEATURE_CQM_OCCUP_LLC)) {
>  		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID, false, 0, NULL);
>  		ret = true;
>  	}

Would https://lore.kernel.org/lkml/20260916231320.14502-3-tony.luck@intel.com/
break this?

> diff --git a/arch/x86/kernel/cpu/resctrl/erdt.c b/arch/x86/kernel/cpu/resctrl/erdt.c
> index 400973ebf2b8..f350a516d3d9 100644
> --- a/arch/x86/kernel/cpu/resctrl/erdt.c
> +++ b/arch/x86/kernel/cpu/resctrl/erdt.c
> @@ -26,6 +26,10 @@ static bool erdt_enabled;
>  #define CMRC_SUPPORTED_INDEX_FN		1
>  #define RMDD_FLAG_CPU_L3_DOMAIN		BIT(0)
>  
> +/* Set in a monitoring counter when it holds no valid data to report. */
> +#define UNAVAILABLE_COUNTER		BIT_ULL(63)

Can this be CMRC_UNAVAILABLE_COUNTER? (or some other appropriate prefix that makes
it more specific)

> +#define CMRC_FLAG_UNAVAILABLE_BIT	BIT(0)
> +
>  /* Bitmask of valid sub-tables found in the first RMDD, used to ensure all RMDDs match. */
>  static u32 valid_subtbl_mask;
>  
> @@ -50,7 +54,12 @@ static unsigned int erdt_scale;
>  
>  bool erdt_support(int flag)
>  {
> -	return false;
> +	switch (flag) {
> +	case X86_FEATURE_CQM_OCCUP_LLC:
> +		return valid_subtbl_mask & BIT(ACPI_ERDT_TYPE_CMRC);
> +	default:
> +		return false;
> +	}
>  }
>  
>  unsigned int erdt_get_max_rmid(void)
> @@ -60,7 +69,68 @@ unsigned int erdt_get_max_rmid(void)
>  
>  unsigned int erdt_get_scale(void)
>  {
> -	return erdt_scale;
> +	/* Divided by snc_nodes_per_l3_cache, see erdt_read_l3_occupancy(). */
> +	return erdt_scale / snc_nodes_per_l3_cache;
> +}
> +


> +static u32 cmrc_index_function_1(struct acpi_erdt_cmrc *cmrc, u32 rmid)
Please add a function comment connecting cmrc_index_function_1() to CMRC_SUPPORTED_INDEX_FN
and also documents where this function comes from (eg. RDT architecture spec).

> +{
> +	/*
> +	 * MMIO_offset_for_RMID# =
> +	 *   (RMID / ClumpSize) * Stride +
> +	 *   (RMID % ClumpSize) * 8

Looks like above can just be on one line? When adding function comment about origin of
algorithm it may be more fitting to move this comment there.

> +	 */
> +	return (rmid / cmrc->clump_size) * cmrc->clump_stride +
> +	       (rmid % cmrc->clump_size) * 8;
> +}
> +
> +static int erdt_read_l3_occupancy(const struct erdt_domain_info *d, u32 rmid, u64 *val)
> +{
> +	struct acpi_erdt_cmrc *cmrc;
> +	u64 l3_cmt_count;
> +	u32 offset;
> +
> +	cmrc = d->cmrc;
> +	if (!cmrc)
> +		return -EIO;
> +
> +	offset = cmrc_index_function_1(cmrc, rmid);
> +	/* Overflow of cmt_reg_size * SZ_4K already validated in erdt_ioremap(). */
> +	if (offset + sizeof(u64) > (u32)cmrc->cmt_reg_size * SZ_4K)
> +		return -EINVAL;
> +
> +	l3_cmt_count = readq(d->base[ERDT_MMIO_CMRC_BASE] + offset);
> +	if ((cmrc->flags & CMRC_FLAG_UNAVAILABLE_BIT) &&
> +	    (l3_cmt_count & UNAVAILABLE_COUNTER))
> +		return -EINVAL;
> +
> +	/*
> +	 * In legacy mode, scale is divided by snc_nodes_per_l3_cache to
> +	 * prevent over-calculation of aggregated monitor data, do it
> +	 * the same for MMIO based access.
> +	 * This scaling factor might need to be revisited/tuned for future
> +	 * platforms that support both SNC and MMIO-based monitoring
> +	 * simultaneously.
> +	 */
> +	*val = l3_cmt_count * cmrc->up_scale / snc_nodes_per_l3_cache;

Please consider all sashiko's comments about SNC systems - from what I can tell
the comments are accurate and the SNC support needs a second look.

Reinette
