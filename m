Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577FA3C8719;
	Thu,  8 Oct 2026 11:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460378; cv=fail; b=edaj2dl7HvTQ/zLXf75Rc+yvigznfrjekK4OjmiL0M4l5mmItE8GSNiNoq+cihTAO8HjIy5DqM6cAYWmeZzd3ntLcPumWa0+S80HJ0DprCIAkLBVuUJ97MZuzNYpXVsdMZISke4/PKpkexxuREaqGpBRavruJDgLuLJAIHpWAcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460378; c=relaxed/simple;
	bh=8vgboJgQXdII1UB5SXYdKfGUij7sHMP6aw0zTKcNlTI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=J7kP7Je/5d6c1u3PmnIx3pLr0hQI9HyjcTqSnxp+P0ZnY1aF/60SndzNGvsQk0viExxFl/zJ0hgY44M8OCFN371AOFtSlRnurdQR4TiIbONhpGsfN18Bd3CI0fx6VFOoNYIDwixbhBiyZu/MkaGIGBgpb4dMv3UdnSkB0hoVKPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mPfEUI8e; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mPfEUI8e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791460377; x=1822996377;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8vgboJgQXdII1UB5SXYdKfGUij7sHMP6aw0zTKcNlTI=;
  b=mPfEUI8efTihTQRd3WJFtsdXDPBRr8vdFPZo9q1sDyJdv8BC+LolDwOU
   7LRyDegXT2LNlYKg18mBrlu9IyAna7qCZfjhhirJhAxkNeK1P5kDBUds7
   PXbcDjBW5ECHOum5QO5NT5G7W03Ki4wJ6FFObt2MepfoN8trS+pbsQ+oh
   n6waT2rK0EMyUjdT9RGplLTN/bY99FW9A/Rw6MxoMuOxeTGQUh0OF8D4I
   q86szm975VwrJteYH9bf98/f10OCOkJzjuqCUWCRyvE9rELw66wwGxMtO
   ljcP9r4sM79bn0dUeYTi1bqWcoBbtbDSyKBGyeedBOQ0NHfBPC+IFMcUs
   g==;
X-CSE-ConnectionGUID: +/6WnHOmRRW0LUuUzZ/j8g==
X-CSE-MsgGUID: TXRsSRqhQg63dPp1+CHoWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="251514"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="251514"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:52:56 -0700
X-CSE-ConnectionGUID: FLR2vUP4TiWNGJKuZliMQA==
X-CSE-MsgGUID: 5r2OH7K2Spynh0VQatvVGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="474122"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 04:52:56 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:52:55 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 04:52:55 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 04:52:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnEHSLsj2ODltEsPKywheAfvmweR+lOHUO/0tfuJHhV/UFALV7Dg3UnBXspgc3qAaJKLFRTR2mXZ4c4SwqQD2qZMU3xZl64ZYd4heSaIjL59/c2Jwc8Q4o92fn1AW5qC+7TSqtxix+89Un8VqnDXsWOQrwlqDttn24iwSyTU7yCH9rQLkXd5sXmTWGHCYhPp+ov1HRMJYNRRgk+BJbk9sCPLtGehDdu3qohek2jx73YgGpjkOmr8NIpORri573Bz1Hxb5JFyLlWfJbzA7GPygYRw0GBXZ9dvJNAfSxEBO+hQg/0/UWAwF0g/bLVMc2KRI/cvIVibGZQvz9DbuOTG0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NnGXF1snGO8ztJtKLpVUA8ZSEpPyyer5ivGNNhDGpI=;
 b=uQkEJ/lEQ8kVT8gMqF0npdbZdAOmgOzmoBB+a2Seem51Ay0ZwjYK5K+R1GZF4Tr0kdyWGTv+SRb0y0afCKj/70x6p6QRday57xbhRFafd17hy03ebu9GcXx59J/TRQhLw7v6lfwiA6hpY6ccxDbIPTKBYae/HLbtP870dfAAa98Dl/JXfAD87gItdT1bk3jN6BoKw5qDQj41B6Jn1IF3j6YqMXMGL83uxY4xNgbmVSDRYV+7qZhI7fqIeWqfCyr8YhVONjW+gDD7qmvkPneT4Hp351gf991g+enqJyNILYw7stfCyTch6OO9FDIaGgLGq2tMTgRBCBFeXSDIOxQjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH0PR11MB5879.namprd11.prod.outlook.com (2603:10b6:510:142::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 11:52:47 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 11:52:46 +0000
Message-ID: <8a57e670-2b8f-480f-b313-850561bc9090@intel.com>
Date: Thu, 8 Oct 2026 13:52:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ALSA: hda: Stop unsol events and jack polling before
 codec unbind
To: Takashi Iwai <tiwai@suse.de>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>
References: <20261007215650.159871-1-tiwai@suse.de>
 <20261007215650.159871-2-tiwai@suse.de>
 <7efc9ca8-b470-410c-b717-3c548bd196f1@intel.com>
 <87ik3c5wfq.wl-tiwai@suse.de>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <87ik3c5wfq.wl-tiwai@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008C5.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::68d) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH0PR11MB5879:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f705e16-eeeb-45dc-bc2f-08df2532ab59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rZ9W2N4f+DUbn/knEdx8tfMhwLbsyRsuWA38AzmH5Xte6ZwP8azGiaWCImetC/oG2qVh/pmIzHw6fduvVqI0sTYM01gubWlu2LcUa6paJBlLQ83EHesKhh8xYtoDw870o/0w4AOT+wucLrF1hYOusH+0Av6lkNT9oZesMor7/OpKgRNTVbBizReRPRVQi84G/T8dnvt2eaB2x/aoT6r8/bUa0LUkUR2HYym+0AVOggmRB4QL4ueO0MtWDVd3xNFw7bWlXADIBrYiTQIg+ilnAOLYckju9hMAayHet7rlpvT3pH9bkvNjp0ON3K6RPc769n11cZXePXd4O3tEfGAovNJg4MLx0uVeXNt8sNViRS+7ejeLkinut5GDYQ4itxSF8V1po5gkmyjc2AuLg0K89frzry1RpW4eG5rx39aPA4SDYEHbDTNtcH/CsBWhwJQ8D5bS66j5A5SN+EJ17pdh9zVIGvwIDPQEs8h5hreGhxCkKf0gwdT66WiwxKCvOuf9gqi9SeYsNEqdZSMMD5H36/ft8AbakFd2Z/GmDEA3Fs/85+rrk99dPZvFLLLmWvPTvKYPoMe+A0vpV+/4XtfVanxLRS3gT7Z0S3DVi8LfWXf/w/H76v1AqM5oAquhge+E4nAI2UKEZDL/mW0rXFH36I7J0GWj81bfDuPBTkgtihY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUVUTk95Zm12UFh4ai91ZkxWUU9OYzg1ZExsYXo1QnZ5SEJLeEM0SFd0SUNv?=
 =?utf-8?B?M2JHcG9Tb051Y1huMlV5YmVKNlExekxBYmlzMmxZWG95OXZEYnU5OXFYenVW?=
 =?utf-8?B?ZUNUT2Z6QVhhL2xFbXRmajdqR2kycDR0TXFLbWxTOXhqRUpiZ0Jha3hURytW?=
 =?utf-8?B?ak5zSXJhWkpSb3F5bllna0J0QkJvb2dvOGlMUXkzZDdWSjc0WVFYYlE3dDRP?=
 =?utf-8?B?djM1QUJGVm01TmxBU3pGMThjSSs0N0NyaDMrSmhkeFg3N0xiZDBXME8vZ1p2?=
 =?utf-8?B?bkZtRlp4S2NhNUpMM0hrcjNVSVBSaXFFOVozU1Jua2F1VVZQTzRrcGpmSzdN?=
 =?utf-8?B?U3QyTGpzZXFhZjVzWUw5Rk9WRU1VOE01dW1mT3kzcUREQmJoYzAxUTdZeFVr?=
 =?utf-8?B?T2NUSHkvRGJwbzRPT25sYkMvTk1XL3V5UERxQkQxR1pwLzA1enp0ZHFUUXRM?=
 =?utf-8?B?bWwzWkgrcUliZ3JyTklNOVBSTkdYUHdWUkcvOFVleEJrbmlCbElzd1RVSExr?=
 =?utf-8?B?S0Q2QzdwMk5rNnhLdG5sWXhJVlQwTmY0WFpzUmxDNHpUOUx3bzNUbThaMCtn?=
 =?utf-8?B?MW5IcGhpZjVEYTY5Vlg1UFpsTFpUTjZpRTM2TTdrZmpXdjZPM0VvU01XR3Z5?=
 =?utf-8?B?SU8wNXhqYUNQNzU2L0RsOTdyYjJXdlpMLzA4OUlGaEVxZVV3RnpZYlplcmdF?=
 =?utf-8?B?NEN6MkFnR1dZNWJpQlZjU1EwY3JoUm9CN0R6bEVkRXJVUklYSmkxRSttRkRL?=
 =?utf-8?B?ZDFOMytSZUxzVFRQNEczL2VXa0tMTU9CSkNqSDJYWnE2c25QQ2FHOHdPM2Fw?=
 =?utf-8?B?S29vSytqb3k0U09hRUhIa1MvU2Y0T1FIMmRuL2RQL3VhSmxXT3hXSWNKbHY2?=
 =?utf-8?B?R2NEcmw5dnc4U2hxbFV2dWtoOFpVQ1VrNkFXeklLTlU1S3RvTWVrZ2xONWhx?=
 =?utf-8?B?eWVVWU9CNHRCR3NMREdITnBNNTNtUzlYVkZabWRoREtQdXFHaDdPa3NoYXpj?=
 =?utf-8?B?TWdFdGgxZzl1c3ZQNmNlMk84Q0tJRVhKZ3pQVGlRZk5RbU0yUFU1NUJQM25W?=
 =?utf-8?B?NW5OSFVYSHl2bkpqQUkrZVZaVlBlODVkNjlqZkZ4WjFKMnpGMXBwMTEza3JU?=
 =?utf-8?B?bHVIUXViOWJPN3huRUlyWGNhSlNRYjZXTlNxZGROWkFPWXN5YWJkUXp5citt?=
 =?utf-8?B?akJwU2t4Q1hvQ29wRWFvUzUrZHhUazNKR3FzcGQvUHUvQjBwWjRIMEZWLzYw?=
 =?utf-8?B?N3V4L1BDWUU5RzNwWUdoRXB0eVFQMlRhczJRZnN5cDF2aXNMSVRCTmd5UDF4?=
 =?utf-8?B?anRXcExlZy9YaUdlaE8rc0p0SmUzMkpjbWVJbnNiblRESFErZjdINVhrRXpY?=
 =?utf-8?B?K1I5ODBFb0NWT0t5Kzg2Z2VFVTNMWGVlb0pyMmhjaXp4U25uWEpKRTJtcTQ4?=
 =?utf-8?B?dEI2a28xS3JQL2hLeENpcWxDclRnYTZ4Q3g2VVRTc3R5VU5teXNMMXpLVnhW?=
 =?utf-8?B?TmRPOVFjYmVRakRSODRGOG45clVpUWVtbEo4OVlQTkF5dkpMYkNJaVRRZlZt?=
 =?utf-8?B?NGtydkZRUnB2UEkxVjM1QmVQQ21iOC9nemtqT0h1N2xVMHg0SDVLaG9kbEox?=
 =?utf-8?B?Tm50R2RZdnBPVHc4cVJkQmhGb2M4V3hTVnpPRnZ1VjRlZXVWVUpFQWNEbkdY?=
 =?utf-8?B?cjNMNEsxVFJVelhObTJtZEdhYjh1QThaNEMxSnZQOHpBcWVwbG1PeG0wQ3NH?=
 =?utf-8?B?SEpXYisvZWw1YVlybHZaWmNqNUY2blhzaXF0SHlUQ29zK1pQWnBJaVU0Rkts?=
 =?utf-8?B?WEpKMU8wbXEzQmZIeWs5ZHNwdFVqVEh4eG40b2FoMEM0T1d6TEtVZkREVjZZ?=
 =?utf-8?B?dnlVNlY3akVvaTBCblUzR056OVhCNGVFQ0FUQk51Ym12eEVsaEdYNkw5WG1P?=
 =?utf-8?B?Zkc2bjdwMU1hQ1NoOW5sQkVKeDlPNGNLeGZkRTNhTmdIb0VKdnF6RlZGQ2Rp?=
 =?utf-8?B?NDZTUUw0UW1zYW16TkQ0aEpJVGJROG9CMVVTdzUzOEhIVmRxMjNDYkpVM3NH?=
 =?utf-8?B?ZTF3VzFIR1lkSVNqNVZDaTJqMCtQYTdRampqOW9MdkN3YjNKcDhXSk9QeStV?=
 =?utf-8?B?ZGxjVFBzWE1sVjlkUDFyTkdkK3M1QTg2Q3NISC82cE9HYm5XV09ESjJhYkJQ?=
 =?utf-8?B?V1BzdlFyZWJteDdaRmx0L2paSHE1TFQ3OXJ3VzhEWUdiZUQzaXhIY2tCVG9H?=
 =?utf-8?B?MlR2YW4veFdRLzJMSlV4dzZqOTl0b3NaTUltaTJUVXFBZXY5czVwc3IxMHRQ?=
 =?utf-8?B?VUFHaHNWRXNtYTZsZzVBWW9MNHlsTEJJU3BNbWplTTI0eFA2SnJzZz09?=
X-Exchange-RoutingPolicyChecked: 2MC01nqzEBICENxoMznDLmoq2DrXEYD1dR1yQFR2awY1fha6fE8UF99BfWoa39yBD1IrMWOP2tyzOYkraoCfjkPMWA5cn6FW5v59QN8GVjOxj6nbAEMOiR7A9tq66H+MeOxO/FXY3CY6DZpnxbagX3hKPT9I5jD6BHgwMBDJJ1q6gNQByx2nKC0rBpHGwhbBBU3gDRRTxRWbNzSvQN6MMF0pB7HrV4xv59jetqws2LcTSbcu+0vbdsysd+oYuoBMD5UajENZXhQMlASk5TDAMxRscgICSPesNnjH1lELJtjXjm1zjLi47RXbAvkcPKWF3VH4OKeSZE6VMtWlfKECEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f705e16-eeeb-45dc-bc2f-08df2532ab59
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 11:52:46.4324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lVg6TnbuFuinDFAgIdFXIcMQSmswoEg6Oue+5BGKPEaZ05cs9jXJUlUbiXRvIbETWjrqq2eOZQCtW+VTXLN8Wax+r6xLD22i3o3ustWWn1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5879
X-OriginatorOrg: intel.com

On 10/8/2026 12:16 PM, Takashi Iwai wrote:
> On Thu, 08 Oct 2026 11:08:13 +0200,
> Cezary Rojewski wrote:
>>
>> On 10/7/2026 11:56 PM, Takashi Iwai wrote:

>>> +++ b/sound/hda/common/bind.c
>>> @@ -100,6 +100,9 @@ static int hda_codec_driver_probe(struct device *dev)
>>>  	if (WARN_ON(!codec->preset))
>>>  		return -EINVAL;
>>>  
>>> +	/* unsol events are still blocked until registered */
>>> +	codec->core.unsol_disabled = false;
>>> +
>>>  	err = snd_hda_codec_set_name(codec, codec->preset->name);
>>>  	if (err < 0)
>>>  		goto error;
>>> @@ -160,6 +163,10 @@ static int hda_codec_driver_remove(struct device *dev)
>>>  		return codec->bus->core.ext_ops->hdev_detach(&codec->core);
>>>  	}
>>>  
>>> +	/* stop asynchronous jack handling before freeing driver resources */
>>> +	snd_hdac_device_disable_unsol(&codec->core);
>>> +	cancel_delayed_work_sync(&codec->jackpoll_work);
>>
>>
>> IMHO this is a proof that ->registered flag doesn't do its job.
>> snd_hda_codec_cleanup_for_unbind() is called right after and it does
>> contain cancel_delayed_work_sync(&codec->jackpoll_work).  It does
>> contain snd_hda_codec_disconnect_pcms() and
>> snd_hda_jack_tbl_disconnect() operations too.
> 
> It's about the pending works, and the flag doesn't help there alone
> unless they are synchronized; at the time point you flip the flag, the
> work might be already in-flight, so the flag switch may miss the
> chances.

I agree, my suggestion was to make ->registered the sole owner of the
subject, including the synchronization. At the same time, fixing the
problem first and expanding the work later is also a valid approach.

Do you have a method for reproducing the problem easily?

>> I'd say it is snd_hda_codec_cleanup_for_unbind() that needs an update
>> and perhaps be responsible for calling driver->remove() too.
> 
> Yeah, some code reorganization would be good.
