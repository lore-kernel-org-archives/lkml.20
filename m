Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D872472AE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 00:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788395687; cv=fail; b=jvS6AJMGvs96bYqsJoow1k/3weeJv/Uc3OAVWmqFCxY0MWQ5gDvLwx/xhIxCEHN2mafhsnjiy1zhB7DaIw7vK7pIiiHaiai7ydbDQOApjAeYJ9ioTR/TBzfXB42tqWm5JVXCgFyKvJiruXYY4BaeeIPYU7qHGtcriK0KDN1dm7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788395687; c=relaxed/simple;
	bh=gnY7ihDp/fbdz1vULP/solyrCBbib4NXjr0/mUobBXg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UwP50QuA6K3TLdj58iwraVdjpPjKnCaIRO6dVK/6FKyNDJwLap/mxDjVaUiEBr4D/dhhBzRFPRjSEuM5AXznAj6d35obVYvdNhlxM7DHWqIPgHSp6Z0TAOzDAMhcXqDnjS9RlhqejTLl1vSjoxixX9ABoNvs/D8KjYnOijTRZto=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c7N/BQVp; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c7N/BQVp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788395685; x=1819931685;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gnY7ihDp/fbdz1vULP/solyrCBbib4NXjr0/mUobBXg=;
  b=c7N/BQVpKQ3L+vzKWTteRhfGplJpFktkaPX94+jQnJLteswgvG2QbDtS
   eQie62AsQ4P57r8v94JNe6C+zwcYY4LbS3sXhYi/aIIQwvQNmCtfteUZg
   OuJkNabbW+z4uvuzcU3Mv/UgiqeWvu2CutfFL+ndNJvEirKNXGKjwfQzY
   lFyQ7SKSAhRuiJ94n4dAPvWemAkokir2lH1GxExa9ZjcFIzsypSyUtbhb
   u/jovuzFpdTdl0hAkY3uKyHf5nZ1m7ZiqpCuVhfX7KPgxox7tBjGOI/tV
   tfsbCr9ENnsi8CoCsKwIObjXefiRcEqMZZG8qCnv8m610mpUo9EUYykYy
   A==;
X-CSE-ConnectionGUID: ob6QS7a8TEmwEGpWR/NWoA==
X-CSE-MsgGUID: w/+k+LBqTfCHfQZ19Ul2yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88714354"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88714354"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 17:34:44 -0700
X-CSE-ConnectionGUID: 9GHMxQ5ISIe9ywGsqVwm/A==
X-CSE-MsgGUID: cC0yt+BjQD+M76QwIOHIGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269013510"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 17:34:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 17:34:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 2 Sep 2026 17:34:44 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.8) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 2 Sep 2026 17:34:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0DhA8lokaUeEZGhk7r4E17+knc8tBp+yd/RZ8pfxX9dwMNaPxE7aHqAmZqe/S1SJX5ioKqEUxatiFVX6V1i0nf7xI0lElrZVuDeE+YGg0YUux9U2sOvXDEm2a/SRG//Nf1OqdZKPXXDQuEuGi3KNpU0ZZ03MK0vRgrFwssNAV28nNQJrTKtY1uY+wikbqFnXt1NGfaEqv7pOYAvVg3Ds6CA2HaLbdNrXT03iQ5uPmr3Ujnn3fmpaju5CDNBYld5CE3u1sE0GCt9KvFY4nMsCZp6o0QPOa7eY7uPGit0xZ5r5gH8flGAgedunrNXO2PlppMpty8DCEVcMfQJyWo/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H41AQtFDUjsRce5eFv5VWSStM//1A4UYmo+gpZN34jI=;
 b=eseymdnu85JSU2+oDl1/U7rHbz/vmikr//6eCyfpL2fh9lTocPDhE7lpkRIlnis6/gdXAQS4zseWJy+v9UGuYxZGow0AzNpmoIPUP6Xw5rw5VYPDWajDpQ2bOJStd5AW2ammA5Nx1B36AnmEx08pr+2zEiMrG2k6GZDdseqlCPEiKWXRJqrOdXYk0D8eC9pTB17OcOnQrBgMkoqHXvTtTXqmDFEkvhViV251cbFRt/28+mcoUoCn5xBsFj4qFcJu0iqbO8EJI2AaHzL9rMb1X70HsoRfETXxVqO8A2CZ50cTzB1Kw1k9I6gNnT9q5zoAhUVGc/Gx0EMZAyetaZ11tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7997.namprd11.prod.outlook.com (2603:10b6:8:125::14)
 by CH3PR11MB8443.namprd11.prod.outlook.com (2603:10b6:610:1bd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 00:34:36 +0000
Received: from DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246]) by DS0PR11MB7997.namprd11.prod.outlook.com
 ([fe80::24fa:827f:6c5b:6246%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 00:34:35 +0000
Message-ID: <ff13fe1e-59e3-42f4-a438-bbd3cfbd94c9@intel.com>
Date: Wed, 2 Sep 2026 17:34:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Introduce helper for checking direct map 1G page
 support
Content-Language: en-US
To: Dave Hansen <dave.hansen@linux.intel.com>, <linux-kernel@vger.kernel.org>
CC: Andy Lutomirski <luto@kernel.org>, Borislav Petkov <bp@alien8.de>, "H.
 Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, <x86@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>
References: <20260902194718.E1FF3041@davehans-spike.ostc.intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <20260902194718.E1FF3041@davehans-spike.ostc.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::6) To DS0PR11MB7997.namprd11.prod.outlook.com
 (2603:10b6:8:125::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7997:EE_|CH3PR11MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: a39c6adc-f731-4822-6200-08df09532159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|22082099003|18002099003|3023799007|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: Au4l/csKgFT3/AClgSaqHxuJQLDtdTiyarWZ6joT7wHMYwFPeAPJH46P33Qq3rBDt5a8S1KoifYud2N/R9xgqCOx7VPaAI7uNhpVX/czl1V0D3Djb6E1FNrMZtXeMIMO23F0PYMJTtci53ajf5kNEI4PAAetlCOR86qmU9JZQXzguFXLd6Lx/DIzP3xfCOGfbNdJjR8a6U2EkxRXum5MjA8GR2fU18V0X4ad3GcFHhlARL9Ofo/P/kW1lOVKU33Wh7qP1vjl4Dv048jjnJft3ZQq5VfU45t8AQqDcwKymT3DuNc8vCPG69uPo8DEI1zYzIBJtsRBgpHrHRb3CdXEYxclTIYYlkdEOg9Y21dgW6BVqeAthPNqk2Hiz1K3CNgKgIMG8JyVUPQIo17drEXD+/qng06iyhF5WOGhqAI2w1t1LTPE/xRqAUwWELxAh/oxdrUnr+l+ajTuFMVCn1lYWa5bMKXOK90TXD8m2h/erIvzFSVrr0jvhLge3pN51X40iZsKcsa0EFsiWpt6t/RWuog6vMuPJiYdmRs7PU/yHwmpsLS/1qI7xYjtkHnWSOPJqCj2ibe2xnWwX0ZBhXTFhjyXBFpcqFodJQB7YBIw7ITnBj0vvBSifvXkOwvrr+Bbt36myOZyXXGpZEdO3a1GrgzT7rPF33BD409+sLmEk7E=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7997.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzVSbDNqWmVsL1ByY1l2eTh6YjNJVHpjamQvWjFWRitMUmQ0MThTUzVaQUZK?=
 =?utf-8?B?YTBhbjhEM3BMUkRFT0VJUTZXNldxM1lxY1Q1cUdHTDRvUE90UXFpMVpyMkQx?=
 =?utf-8?B?cit1VThEWUpId1JjNWRoV0hDSmpPNVZ4NnZRdENrMUhPNjJBZ1RuVHFsaG4y?=
 =?utf-8?B?aHU5b2VCS3lpWFg4TGhkR2NoWlNtMk52MXFsWjJlNnp5V1FFUXozRnhFVDlQ?=
 =?utf-8?B?MExaejBEcXh3bkR2UnRUa0ZSUm5zZk1hRk0yM3hUMGpHcHJIL3pkTjdDQitm?=
 =?utf-8?B?S1BtSU50dDhkVTBTamFpT3ZEVEp5SlFwdmpiSHBJOWtlZ1RRK3FxWU1Eakdw?=
 =?utf-8?B?ZjcxWFZ4U2RHb2FYOGtCQmM3eTk2MDE2S0tadVZpN3lSWGtCc1BlTURZc2dl?=
 =?utf-8?B?dWFXbkhrQWNLZEltNkJUdHFNV0I2SWRpa3EwTytkais4YnQvUTNzODdxaUNE?=
 =?utf-8?B?a1N0SWQ5bGRJdGgvZERuR0g5Z2dUeHM1cjJUblhETkFkckpDYm1KektyaE90?=
 =?utf-8?B?U1BDTUZzbC84aUR4TGpSSTJLeE05UW1Ddi93cXp3WGovaEF3cDY3L1BVSnF4?=
 =?utf-8?B?Tjc3NnJQc3NpSHFQZEd2SmN4azJjZGhQN2ZiOUlFbEdGWnhHRkRDdEM1dzlx?=
 =?utf-8?B?ajYzbkErZ3R0VjNkWFhyTGNBb2VBQkF0SzFIeXRIYWtVOWRoTzJoaUFad1dE?=
 =?utf-8?B?dUJCWmRoellnRVV1K3NHdDM5TEdFVFNKSEZuNzVlNmhqRlBRZDVXajRncnZR?=
 =?utf-8?B?NEFGQmZGN2JhNlJkcWRJVjBGRmlkOUJ2UTd0bXd1cEZsYjR4Mmk0T29NZHFP?=
 =?utf-8?B?eFptTW5KOFZOZEc0eWxpeXZRNk1weDBLSkFLamZYM1FQWFVTZ3BscDZCdjJv?=
 =?utf-8?B?Z3hDWXFnbWdkNGhhT1pBZmttSjdlSWt1cXBDc1N2TUNlOWg4SjBkL1FUbTgz?=
 =?utf-8?B?NGdUUFRwNU5Sd1ZoK3ptRFJDQ3FLTW1jSzkzLzVYMGMrRU9tSHZKbjd0Wk9t?=
 =?utf-8?B?ajBPd2pMZGh1ZGkrSU4vU0RSd0JyRm9zNVRYc0d2S2xHQUpRa042VGQ3alhO?=
 =?utf-8?B?S2lpUnFBNm80dk9CSjF0ZEFaSkNoSWJCNFR3YXA2U1oxOXlNUFJML3dkdW84?=
 =?utf-8?B?bFJFeTRGeHZubld6RW1LSTduRE5LQkVoOUMvOWlCUkE3ZnIvdGFXSEZ1QTkx?=
 =?utf-8?B?MmJ4N3VRQ2hrdEgvWWNSWjJESXdmcXNUU3FpdjNUV2lTK1d1K3dBc2gyUktW?=
 =?utf-8?B?YmsvdmErd0NOaElZZ05taXcxT3k3bitSSGRESUV0eVd2NWNyLzMzN1pMZFFa?=
 =?utf-8?B?cGM4RGRPUGxQWHZiZ3ZWeU9mYnJ6dmU2TGt2UWl1K3RCWkwvQVV6TlIwc3My?=
 =?utf-8?B?eTZ4UFNGdG5lMTE0cmUxa201cWR3ekFIYXRRN29DWk53U3RoSUdCY09uM0J6?=
 =?utf-8?B?cUMzdi9tYmVLR0Q1SmkxTkxzdUI3WTl0TUovR2k3QlpnL1hYV0wzQVpXMXRp?=
 =?utf-8?B?dnBYMkVtYVkwYW5LblNicTJTMi9waG02dERtNjFEQWRhdDhGZG5JWThXaW5l?=
 =?utf-8?B?cVZMMi9OQVBmTHNkUGNpNzVtbzdiVDUzT3NzMG5qVlp3eUpCNGYxTGdWanNG?=
 =?utf-8?B?MHFHcDE3MVZYZ29xcXZXc2FtNnBoK1NqVXlqRi8yeGJNbHZSSXNLSUxZYzFR?=
 =?utf-8?B?Z3BuYjRhWFN3RGNLaGRvVTc4RWtOWERPdlVQajBkeDMxMG1KTGVBNjNjQmE0?=
 =?utf-8?B?SzB1Q2U4TDRBT0FKWHNXSW5rYmdwdW5aeE5zdWdCUUQ2QmhvUzVqSk9PamNG?=
 =?utf-8?B?REYzR2RPbjhFNWI4NE5CZExpVkhrbERTclcyUW85SnBQenRCdXU1S3VjdjBi?=
 =?utf-8?B?Rkpoa0c4UnVJMHdtdDBTNlRrNEpqVnkydFdxTkdMKzRTZ0lJb3B4enN4ZkNa?=
 =?utf-8?B?OFNDUDkyMDVZZUcyak42SSs0NHNaTk8vQ3dwNmIrSUxCMkxCNGNhaU45WHl2?=
 =?utf-8?B?WDJKZVV0Z3dwSXVGbUlodkUvQVFxdWticVhVUmVhR1crb3JTQVZPZXZMY2Er?=
 =?utf-8?B?Ulh6eHRMTEJ0YmRyTldVK0RqNUdCWlhKd0xQZ1dwWHVzeVdmKzNFOGxVdEhw?=
 =?utf-8?B?ZFRHR0lwdythc1JkRTFVMk5YWHNJMk9TSXpDZUJIQmRsMWEwcS9ucDV6S0ZL?=
 =?utf-8?B?Zlp4bXA5SGpSOGxPaURBaXJLay9kS3JyN0t2by9xUnc3R3UzUTZWYmh6bUVh?=
 =?utf-8?B?eitZZVl4ZWZhb1VNVEtTY0pNQTZpZnJmRSs2RVliT0d1TXFxQjdnM3J1MStV?=
 =?utf-8?B?eVhNU2krN0REMFdXc1VwRlFIRGpOVHRTcXQ5YW5KaDBlQm9PREdiZz09?=
X-Exchange-RoutingPolicyChecked: szkFVPykrDAI6IXI9XGSW9ahzmTwxvo/zHb97x3x92b7NnItlMIAX9lQTLah0fuMgI50PP2hZ12XfRJsTgaE98xZ4Fq7MdDSZvI1l3XqTo8BNNl+hp2ZDp7/vIuLfXLVNzXEqyfdjTSv76AH/KjlzlLr3YJf7gIY+a7my3bKRL9TJnuhCAYYjJxLCsjptx4symWV+ansIvUMFX31NgI/PZqUEAZYLvSeS/PWus5W6FtY63S2zXC/8fXN0buS7suPKRfF6eMq4p+Zksny3BAYLZE3fBiSM73hpITL6hn3luZRgCRUY2HqbTq8rNS3lLLFs1oxBPm1XWMqL4ZWoz50vw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a39c6adc-f731-4822-6200-08df09532159
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7997.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 00:34:35.7724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eRRXcRdMN2ryqWWviyZecJ0aoIkV4yB96/9hu9RDleun6zV2YEGi5Gvxw4q4BLTkXYGXBObWOH79boZjEfqATw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8443
X-OriginatorOrg: intel.com

On 9/2/2026 12:47 PM, Dave Hansen wrote:
> 
> From: Dave Hansen <dave.hansen@linux.intel.com>
> 
> There is an existing variable (direct_gbpages) that says whether the
> kernel can and should use 1G pages in the direct map. It is driven
> by a bunch of other machinery. At least:
> 
>  1. Hardware support for 1G pages
>  2. Kconfig support for 1G direct mappings
>  3. Kernel command line overrides
> 
> Most code just checks the 'direct_gbpages' variable itself.  But there
> are cases where 1G mappings are compile-time disabled (via
> X86_DIRECT_GBPAGES) and 'direct_gbpages' is always 0. Unfortunately,
> that constraint is invisible to the compiler.
> 
> This opacity has been historically functionally harmless; it only
> leaves a bit of dead code. But, there are plans to tigthen up the

s/tigthen/tighten


> compile-time checks around folded page table levels. The build will
> break if that dead code appears reachable to the compiler. Making
> the compile-time config visible to the compiler fixes the build.
> 
> Add a helper to replace 'direct_gbpages' checks. Check the Kconfig
> option and base CPU support before looking at the variable.
> 

It is a bit confusing when this variable is finalized and when the
helper can be called. I was assuming that early __init code modifies the
variable and later code consumes the helper.

That is mostly true except for probe_page_size_mask() which is an __init
consumer as well as a modifier. I don't see any functional issue. But it
may be worthy of a code comment to avoid future issues.

> This lets the compiler optimize things better, especially
> collapse_pud_page() where most of the function can now be optimized
> out when the PUD level is folded.
> 

The Link: tag below mentions [1]. Did you mean to reference it here?

> Notes:
> 
> Use boot_cpu_has() instead of cpu_feature_enabled(). There's no
> required/disabled features for 1G pages themselves
> (X86_DIRECT_GBPAGES is for kernel mappings only) and the
> static_cpu_has() infrastructure is just gets in the compiler's way.
> 

s/is//

> This makes 64-bit build marginally larger (20 bytes in one compile)
> and 32-bit builds less marginally _smaller_ (~700 bytes).
> 
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Tested-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Link: https://lore.kernel.org/all/20260902-dummy_ptxp3-v3-15-5d8f5b17c25c@arm.com/ [1]
> ---
> 
>  b/arch/x86/include/asm/pgtable.h     |   14 ++++++++++++++
>  b/arch/x86/kernel/cpu/common.c       |    2 +-
>  b/arch/x86/kernel/machine_kexec_64.c |    2 +-
>  b/arch/x86/mm/init.c                 |    2 +-
>  b/arch/x86/mm/pat/set_memory.c       |    4 ++--
>  5 files changed, 19 insertions(+), 5 deletions(-)
> 

Overall, the changes look good to me.

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>


> diff -puN arch/x86/include/asm/pgtable.h~direct_gbpages-compiletime arch/x86/include/asm/pgtable.h
> --- a/arch/x86/include/asm/pgtable.h~direct_gbpages-compiletime	2026-09-02 10:08:59.999169372 -0700
> +++ b/arch/x86/include/asm/pgtable.h	2026-09-02 10:09:00.011170394 -0700
> @@ -1163,6 +1163,20 @@ static inline int pgd_none(pgd_t pgd)
>  #ifndef __ASSEMBLER__
>  
>  extern int direct_gbpages;
> +static inline bool direct_gbpages_enabled(void)
> +{
> +	/* Check the direct map config option: */
> +	if (!IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES))
> +		return false;
> +
> +	/* Check the CPU feature: */
> +	if (!boot_cpu_has(X86_FEATURE_GBPAGES))
> +		return false;
> +

The first two comments don't add much beyond the code. Would it be
useful to say why boot_cpu_has() instead of static_cpu_has() over here
(mainly to avoid accidental cleanup)?

> +	/* Check the command-line and early setup variable: */
> +	return direct_gbpages;
> +}
> +
>  void init_mem_mapping(void);
>  void early_alloc_pgt_buf(void);
>  void __init poking_init(void);
> diff -puN arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime arch/x86/kernel/machine_kexec_64.c
> --- a/arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime	2026-09-02 10:09:00.004169798 -0700
> +++ b/arch/x86/kernel/machine_kexec_64.c	2026-09-02 10:09:00.012170479 -0700
> @@ -257,7 +257,7 @@ static int init_pgtable(struct kimage *i
>  		info.kernpg_flag |= _PAGE_ENC;
>  	}
>  
> -	if (direct_gbpages)
> +	if (direct_gbpages_enabled())
>  		info.direct_gbpages = true;
>  

How about:

	info.direct_gbpages = direct_gbpages_enabled()


>  	for (i = 0; i < nr_pfn_mapped; i++) {
