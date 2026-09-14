Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCADC466B02
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405533; cv=fail; b=qaAta4zTH7Pm3nSWPOwiGm5ExUQUF7mfQR/artimQVxbT0bgUsY6PQRA/4QgeusRZkmp77HZ4992RShOCJnJnFZe/mwxZcl5QXAcE2CSqHLAjIV/ql4VnBZKwNafi0FnP/3cxnSgSmVUboq0s8gzl/InYG3tCJJotONv8crQy34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405533; c=relaxed/simple;
	bh=gJUw8oCp3SBQ/J2/ibdtzKHV7hAXphkZdrSwFa22cr8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rt37lPaxokSvZcLfdRFBhO6GP8TQLWtt9hiyzgGkHBFQC3R2oln/ixkgY53wZ+lIey3bdXZlsVCEuv7dn5J+8mmvsPy2vgZmRfgCARCCbOC6ZP44irWhb2RyvUn+4uaZlokdTdt6fgZ2+9ItGYP/ycowPU/sKgSMbKROq3jcb/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxH7O0pa; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxH7O0pa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789405532; x=1820941532;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gJUw8oCp3SBQ/J2/ibdtzKHV7hAXphkZdrSwFa22cr8=;
  b=GxH7O0paT8OaRhNy2bhAULPTcKi0qh7fDiPnkfklZ/AtEahzc4zG7mVo
   GJwB7hijWwbUfhJhtg0vwqOLl5Bh7+aD0MtD1ZQhjE4RIIggzvGXVpqRd
   6snGfUK2xLw1SrnJpURWeiN6iclUFMLZYZ2tOMq8XLMiNwVTXik0kz2vU
   fnk07QxL+y2zBSSY8nQPKi6jmBYmS5tt7W2LDpj1Nz769XzIJp5vo6B2R
   HCnE2bvMRieDEq9L7BwSlY9GwznkBNRYDoUB4dF5+svtP4/rhS1vhQjxh
   zqeKKWpx2LKKFYE8K1nAgavzTaczF8TWqm/0kj9t+ZNNUDkFiydfkQR09
   w==;
X-CSE-ConnectionGUID: d/6C78e7RgS0ZSbz+z/1cg==
X-CSE-MsgGUID: A4cI08eSS7i1Oh0EbNOoNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="101111212"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="101111212"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:05:31 -0700
X-CSE-ConnectionGUID: VxvDWpaVRQ+v+nwVu9k+og==
X-CSE-MsgGUID: s5CLNiCcQv+0TiRIumqNhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272190399"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 10:05:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 10:05:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 14 Sep 2026 10:05:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.6) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 14 Sep 2026 10:05:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ji+u7vqLq72vTJkxH3AT2LqUAlpjS2lAdhniNerUgl4+CrG/B33PwfJiB9265Znn/S9lD11sjZqT0BWd84yaX2HXND/7wsPbIFHgcBZ/35mU31Lcfx2cmjTs+B0eF/xCF6Gh/xkKiUarT7oz+k9qd/bOxBdsdvW1+gLaJjq8qKCdtEV/m/8bUCSYIkVqU8hWEpPODDe1F1dzNe70eyZindFTlroAqAulWbfWdc/VYNu3kQ3MZgIf2hhFx6ZsYg9c7NZgLSUlH+nh32jfbJHgL1GysuZNs/ZIdG2ZPvQUwk58AIe0bm6BYFU4nzbbKzHVdF17dchHRlH9YQofCeCTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MuRubY8/iRbw+JGqVr00cOrIuvrXnskrXqTm4Ny90S0=;
 b=uKqARlyPk5V8clH071+VAgj1BB+NtS84mc12MXBjpT7R9vAjK4IPoMoE1dJKsIjCzrFLoONr4v+6bYn9lFAaBqEF89ZgZMhuF8EtFXYmsbKlyQby/9SC5uSP4LdAM+uKDog225zgkO4cSVCMxiNwhaNKECQ87SndPamSnK755vn2jSwbrawuz7cnNikqOt+Rf5WKBcj5ITx+P20m7mV5uszKoFHd9vuE3j0LP3NzQ1bkfVTPROpqj9KK/nQzOTmnK7RYuuq0O+dhzB9aBOGOsUb3dUzySru6KgSX28y7p7CVH3Gyk+ae6OaLcy6Tn+Fs5WowMwZUN1QiL/o9u3lkOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7925.namprd11.prod.outlook.com (2603:10b6:8:f8::18) by
 PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.12; Mon, 14 Sep 2026 17:05:22 +0000
Received: from DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84]) by DS0PR11MB7925.namprd11.prod.outlook.com
 ([fe80::60af:89a0:65dc:9c84%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 17:05:22 +0000
Message-ID: <ac6c35ff-79fa-4ac8-bf7d-b665424360d0@intel.com>
Date: Mon, 14 Sep 2026 10:05:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] x86/fpu: Restore and reinforce signal frame
 portability
To: Andrei Vagin <avagin@google.com>, Thomas Gleixner <tglx@kernel.org>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
CC: <linux-kernel@vger.kernel.org>, <criu@lists.linux.dev>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, Alexander Mikhalitsyn
	<alexander@mihalicyn.com>, "H. Peter Anvin" <hpa@zytor.com>
References: <20260908043427.1842515-1-avagin@google.com>
Content-Language: en-US
From: "Chang S. Bae" <chang.seok.bae@intel.com>
In-Reply-To: <20260908043427.1842515-1-avagin@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To DS0PR11MB7925.namprd11.prod.outlook.com
 (2603:10b6:8:f8::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7925:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: 0853fcf4-c266-4961-3c7c-08df12825cdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|23010399003|376014|22082099003|18002099003|3023799007|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: IRK+r2/WJcsIxjApEkcpZUrqQ9ROOU5y4D4faGGVg3Zdjpv4mDNL41bHQDD+FcCVzuVhaOmqfM4DsEquw3Bwbw7ks+Q0skEJqpBIZXlfOn2V8lwd7VBTyUzruOEFSBwBweg2vHfWVQNLXFMMLxGZmSS+t4sl9N7NnCLl8vKV0myTCCe93I+k+LBoqcLgR6Wvli9curjf3JgKhULZnTYpYcECXs+7IDDO3e1AxAv6X7J3LW7/Fzqph2AauZtZ/V5qXWTeDRv2CebQLZTYoBarrk+OGSF9EOItlB2RwqQtORLQ5YVpr2mOtFuaxOjLIXJuPaTi+bKIogbKK6SeBeXDY4wuJYp9DjVbp7qQpZE8tvf6hcdEFDYX1tIwR39UJYOLBVFWykIE79zrZ8GQC3a7xa2nRzXGMOofIUiJN1DZZfU3qB4fcp5RhTmLLGrSmxlI9fV2dksL0tCSm1cptpkIq5fGem87B0x3mWzEkVAhkaIGAaI3Cg45WMWyeMcS7lnX08A2Wmtv5j8hPaKRRuESJ2dTTNKYZm7W8RfzgFP9y0y5vF5L2rFmK+6fDYfjNj3aN6L2caf9jhg2hb5Jk7SGlKwkyhqO2qh+tz6MX3LTFmVEdk0VY9CyMPaEoKH7OZn7mcDZGqUkzUDpMiQ5PIxvZ/IA86FsYBay1MllUezOQDc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7925.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3BiQS9RYVRmL1F1eXBKNCtYQUFFTCtjeVhlSDZYYXNHQituVzRaKzVueU9N?=
 =?utf-8?B?KzFzaHJZU01CdCtSRytlamJhQTc2QytRQkkvU3ZsWnJQc1ZPSTZYZVdlVVpT?=
 =?utf-8?B?bG1tU0dQSUp3S1pWRFNaVWtCTnlpb2E3UHJzSk1qaDByOTlzZjhzV2ZsbG01?=
 =?utf-8?B?MWZYdUJHZHdVb2YyUEYydFN0dThya2xLTy9GOVRUaHZJbkFHSEk0d2Vxdzgw?=
 =?utf-8?B?TnRBdVpxRWZGMm9wU2VRMEsxYjk5eXF1dm5GTk1xYmtGMWlFMjI4a2UzNHNj?=
 =?utf-8?B?YVVjT0hlT01xblZGUUpjRUxoeFp5RkswWExaZittdzlMOGhVaXlwL1RwdFpz?=
 =?utf-8?B?TytOU0VRVDcvSXVJRktxd1Iya2drVGFnU3pLNHdIUDJzMFgxcE9SZEJaVlh4?=
 =?utf-8?B?U1hnaS90SGNVeVFOcjdJU0Qxd3drWDkrVFJvV3FWd0p1NWNDZUcyK3VrMld1?=
 =?utf-8?B?b2hzTFE5aG5oUzBWMDIyVW9GUjZNQ3VBc3ZKTEtqekkydmxFblFxb244TUQw?=
 =?utf-8?B?YVh3MXVpcEVneFpBazNKTTRxaVhiNUl4OFZBa3dWbko0WmR6ZTdKZFVYMnlI?=
 =?utf-8?B?S3JHakdTblNqR1FPM3NiUHRjbGhhUEh2VGhndTdhQ0JRQk16R1QrRFk5YW04?=
 =?utf-8?B?RFJHeEpTRTIxcSs0QThVNHY3Yk5sTlBDV1grZUJsZmVJQ01HRHoxaHZTN0t2?=
 =?utf-8?B?MDZYenF3QWhockVsZUo5cWFRZnBlTVVNZTc5cHZjUEhtT2pLazhyMEdQck5S?=
 =?utf-8?B?di94V1dsRTFEMEg4bVBDc1FoU2NaQnA2YVJSVEtMQ0Ixc1BTdmVseHJJdTdS?=
 =?utf-8?B?MkxWL0NaVlFTRVdPRzJoV2ZMcHZZczhsa0J6bUsvNUlBSWlUdWo5bXBzZUtP?=
 =?utf-8?B?V2dzbWd6WGRlOFJLV21BTDVZb1Y5REpSMzVkajBvY1d3NEtRR1VFazZyVG04?=
 =?utf-8?B?T3M4YzVGaDIyeUlSd1B1Qkw3TVRBdU4wekNEVW1yQ1QwNUVDVWRqblFLNERs?=
 =?utf-8?B?SGhnVmlvLzNlVGFkL0Q2amZRT3hYeDJYQTVHckZDN25nSU9MeENHUjA0NWNS?=
 =?utf-8?B?RFJGQ3JGdTk3cDlsRUJUSDk2NXVYYStUdzNsSzBYYUtZV0NldC9wNU5DNUVl?=
 =?utf-8?B?QWc4NTQ5Nlk1SEJKbXdtTk9TN3JOSmEwdFhlN3E5Q1NoN2lrZjV6MUZ5dmJB?=
 =?utf-8?B?bXdVRlhUZjgxTmhnTE84aDRxbXJsdnMyTW8yblJ5UFkrTGxlQ0hkd0IreHZ4?=
 =?utf-8?B?blBBUW9xL3QyQklrQkU0S0tSdmlKZFYyQlFUOXZUYkwyZ0V1aCs3UzVTc1NO?=
 =?utf-8?B?WTBrcEx1bDhrOEZnYXo5WXBwMGtNc0k0eFNoZnFSOEtucFFKVVE3bXFUcHYv?=
 =?utf-8?B?NllWcmVUMlJ1ZnhlV0w5aVFsR2V3L09uTTlhVGRnWGxlVmFISkFZaHl3Qlp3?=
 =?utf-8?B?eWhDZVZ6S3M0Qm5lMDVoQkkrd1NvaUsxSUNjc0d3a1phZGZPQlNBaW83ak5E?=
 =?utf-8?B?NVpZbGhmc1lHY1JnRzZ1VkxoNzJaNEhobE82MGQ1TEVhZ2VHYmUwYlFTQ3hF?=
 =?utf-8?B?VmNpYmhQbk9MdldPMXJwMG9CSjcyRFZyN2FvbkREYzU3aytJcFh4ckV0bWJD?=
 =?utf-8?B?ZWpnNjFJbEY5UHhBZEFIcFU2cDB0Q2hIWXNsOGJ3WFJGQnUvMDVRWHZsNExZ?=
 =?utf-8?B?cWMyb2Q4MDdvdU9tV3RmR29WemRzNHZ6S1BtSEh6UCtkb3o4VThOYi96TlYy?=
 =?utf-8?B?MEMwbXpGWUxzV3BoRjYrOEw2TnM5eEFTZzE5ZE5OUjVaOTRHNVgwRlNaTWdP?=
 =?utf-8?B?ekNVYzVGUGxXMWtQb3FuMlMzczdZVGdtblh4OEJ2LzdCWjF1MTFJRG9nWi9k?=
 =?utf-8?B?eGtKUUdmdm1jb0o5ZUgrei93dGFJSEZ4NnFwTjVHR21NWE1uY1EzQVZVbTlR?=
 =?utf-8?B?S1pic0t1S3lFU0F2aHdVU0xJTSs0MkVnVVlVWHV1eTVITndzZ0p2ZVhHT1N3?=
 =?utf-8?B?V1hEOG9kMFFBZUVhZXJOcndTYU9qcjJXci9FYW5NK1BMZ093eWNJMHcxdHdY?=
 =?utf-8?B?cU1xWjZQWCtrRVAvN3Eva2g0eThaaUx6ZWJBUFN4cEVxdGNINjNxN2tuS2FL?=
 =?utf-8?B?eFppRmpYNGdLR1ZZdWZRVUlPb0hFMzNCWFljQjJHSjJFZXl1RHdpZWprcG45?=
 =?utf-8?B?cG9tVVhJblpiejN5UzZOWitGVEtHRERKUnBaSkNNeUoyQ255OTZxaHN5bEZR?=
 =?utf-8?B?akVNeERlREltRlZQMFYrM0poWWpSMlpoZ29jbC9mRHFQbTlaVmdZeDNReGl0?=
 =?utf-8?B?SmVJRmhibEJHK0U0bUlvSld6eGQzRDRFZXJPL3I0SThTQkttckFKZz09?=
X-Exchange-RoutingPolicyChecked: c0WU8PVQWSNhdnhYwxYXNssW7Cvow7BAVJZHVoUHTcPFIL/bdkrVRSSMU5n+ehLlya1TFcUyMx8cVk+r+dt1YG7q/NxFHduWJLvpyIy5ca/nr4/6kVzWmmyzIjiMhI65ZZTh3jtNee8UCCQLm49/9AjKFgrUAbdVL9FDB05jLuI96d/fw9fzQSKreum6A8pwmd1Ez2Bli418RqaaXb7I0iWzL9QACvPfuHbD7uPVBHRt7wh1yJQz2F6x9Qh6d8Hd8SCMmf7K1dtzX0ScCjgv9MPnxdLRjnXIvZikY80dlwSBc1nm2dCvrsgCgpdLsKJv+kkgk7Rl/i5tSmCcBdR60A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0853fcf4-c266-4961-3c7c-08df12825cdf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7925.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 17:05:22.4722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dz3DhLSZNYcvLxpsbnBNRqdqFtaSbCnKf5eds5S0B7YUOS7mDZyQxy45xZcln+I687VD7UxpAQgLFcw5RtgO26ie4BT7HA2Al0T4t+9k64I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com

On 9/7/2026 9:34 PM, Andrei Vagin wrote:
> 
> v5: Address Chang's comments:
>    - Documentation:
>      - Expanded Documentation/arch/x86/xstate.rst with a dedicated
>        section describing struct _fpx_sw_bytes, 32-bit vs 64-bit frame
>        layout differences, and architectural portability constraints.
>      - Trimmed the comment in <uapi/asm/sigcontext.h> and added a
>        reference to xstate.rst.
>    - x86/fpu core:
>      - Renamed the 32-bit helper to restore_from_ia32_fxstate() and
>        inlined the remaining native path directly into
>        fpu__restore_sig().
>    - Selftests:
>      - Consolidated the shrunk-frame and insufficient-size test cases.
Thanks for the update! I've provided my tags for the remaining patches 
in this series. Hopefully, this can move forward (perhaps with some 
further shaping) toward integration.

Chang
