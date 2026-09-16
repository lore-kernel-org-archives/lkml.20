Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E033C13E6;
	Wed, 16 Sep 2026 05:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535786; cv=fail; b=EiF5TEqc8wh2a/998bQrRnKwz9WaWWQr5prUyTcLcaZy74j5VHOFH23J/CG5rme3SysH9Zo9ZLfWbsXomLy6QTlOuaxgGG/LZhHL/MSTptfBrK+GXrUJV1fpa7dComiGfgzJptXsNAARAX1+oi19iKXzusd3LaEgQQTxqZ3A9l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535786; c=relaxed/simple;
	bh=c+kTXt28NE8rLmQ+YmQgNOeZUeq6PUmDQdJMgmBxDKA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L5czCSGYbEMT4IKnBb5l4Tcpi3N7pa5GriDhPus4xZJv7M1gGk7ElOp+a4XJhvzaIi8NqudWWBX1XCL9g6n5mfZ0t/cqopj15x3hGv1KwwASJl/fga4Yev05kIMzi0lRyxSmeQcoIyYdtYII+GeCaYWZGH5wy/+Vq/xf4cdDisw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYyekLMa; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYyekLMa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789535783; x=1821071783;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=c+kTXt28NE8rLmQ+YmQgNOeZUeq6PUmDQdJMgmBxDKA=;
  b=ZYyekLMa59Cuh+XaNQYpvl/K3UO0/3eKVMgSY9peP79ETq22VgKbkAmp
   n7UcCr7mgY17bfGDplEvhWQ9goI5P/wmOcZg1/OANedidptW7mlILeTzk
   iCspFxIb4VHJ66UX5RdlOyIxLbIwv6LowoKlkr1cxT0RwIk0BrGEiPzjo
   p5Dvt2g+fUE9NOwF0jU/GmCAgi2SdpgXX9jyVUhTRDP2j+G3YHe9dLckA
   ZgXX3q/vQly/Pv+xHkLNFDKOUWJlLCsXtrh8F+A37ygFYzKtD0lk6dVnB
   p0v7yZ6pwIMDX+WHRCWy3wEEfO7kwrVk9Pj7+RgqwYwm4GWk968kYLz3n
   Q==;
X-CSE-ConnectionGUID: tMgpDQi8T1eUkE5hyY5gOA==
X-CSE-MsgGUID: JR2FNoZ2QbmZffRHD98UFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77469110"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77469110"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:16:20 -0700
X-CSE-ConnectionGUID: BMGZTIYdSa+Bu3K/HrhesA==
X-CSE-MsgGUID: JKICa8pWQSuv3SnGz+153g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="311498026"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:16:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:16:20 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:16:20 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:16:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fCBjUnU53a0uj8vHlOca0QexpGyUanAYAvA6dlUIO+BY2Q8oG+QKhwGsu/BbZJI9BaXmtmUTC3itbSdGx0j+ynjYxqVIEOA/T0+XsPsJy477Ypu5OivojmgT7xsAQLLIcUfQGND1zks3hsTGkPZ+kAItcxrsLgw54DOv1puIfTFiMus7iJ+jR+clY2xnM9H1geM5rZEG1SG/9EjGPBdADPZsXdGq2eqwphwV0ej7S/9v41sG4tYNSi7/f887hKGQaBakCIhtBW9ctgeV7mSZZ0quV2An9hBSzMmBeyVl8PNZpjZUZ3HgUbwg/EM/IYemYhQzU38cUmEzXcMEybO/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZK6NbJNElzT42VxidRAtGQYP19NhcI8Oz/QAU+ts+Wo=;
 b=VyHuqRI0ZL9TjI+Ug6KnlXu1wt8yBERHJtyvo6zeeO9RZF3iUkwkVfe6y5wrpuVNMkLg/8SDxW4NP1/LLn63ZSj2HheD3dHc4dLS0T5br6jCKdq8ho446DIusuPF3EsB2f9NERXIER0u8RsQReBn/JKXYagfhmSBMb88X5yeffkYHeINkpB9R01OQmrgcI/ArN2DQkKtMSiEaeidkD4swZbtYYGOgpMv4847CmQYfrtE2gXAiwBZv5+R78l6cJzHEUoo6ljc4JCn0pcxUTe8iM/9T6xDrCz1Fof4k9j4bxPFwT/z074emkxc95Fqr5WIYFz4Ysgk/8h64E5NpA15UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Wed, 16 Sep
 2026 05:16:03 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:16:03 +0000
Message-ID: <bd1fb563-15b7-480f-b80c-823c006d91b5@intel.com>
Date: Tue, 15 Sep 2026 22:16:00 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/16] x86/resctrl: Add PLZA configuration definitions
 and data structures
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>,
	<ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <akpm@linux-foundation.org>,
	<rppt@kernel.org>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<jlayton@kernel.org>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <seanjc@google.com>, <peterz@infradead.org>,
	<chao.gao@intel.com>, <jmattson@google.com>, <naveen@kernel.org>,
	<ricardo.neri-calderon@linux.intel.com>, <tiala@microsoft.com>,
	<chang.seok.bae@intel.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
References: <cover.1787772750.git.babu.moger@amd.com>
 <702b88901bc62f07829144a96cc887471b427da8.1787772750.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <702b88901bc62f07829144a96cc887471b427da8.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0085.namprd04.prod.outlook.com
 (2603:10b6:303:6b::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ2PR11MB7573:EE_
X-MS-Office365-Filtering-Correlation-Id: 42200503-afe0-4da2-a81e-08df13b19a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|56012099006|11063799006|3023799007|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: at51agduoRlBMfiB8cgujRU3AOSNNMEkQDSzwy7dPPNfQyLHjZk/oqL7PcnK0EWmUKRjGA2g9oX2tlNzOybH+WRV4M8TKFYk9WNWcfkYMQ34ZRoSZZ4bFwfZ2NXbI8Yj1nM1xn71WL2YI8CYl+Vcd+dpQ9e/7TLVxJQyZ/DagEpwItzKnvZH5FzigX7qAYVottT0e94pjjsTvvSSikCwQmB79I+xR2eQQmtLye/QeT1b0xiuVJMYoKblw/6YgDV3St+sSYmgmL7otdnq6PaUWCUeY0DUiLqDRd8EIwuxIfSRvkI5ol37OLkBNLWwYLwT3Pio6G6CDdl/8EjZEOjji0Adqk4p7BRynwgHruTsilqpyD2JkbllsOHB9dmDOPJbX57FJlGmoCe9PzsFvqFk86Hx31pgCW8GNGPU16dmQJTDOWWBH/kdEe5PQFysbpm6M/bWtbFVPauQAwoTK2u0Uqf+IHxZm4zoLrfn9D0QUthDv+Wt4XurIINFaE4h6IYkeJPb8DVe6vfDr5zzswOloo43JE7xA073Q+huwOAx7xKo4K0YnT8HPBXmMUrIH40oA7qiS3tct+v7wgREb0H6MCl+rdFRiL1lmYuP5l5gAhDb6xQpZXJ39G1qwsqETsTvp4Il97SBTssFNAlkAd/JSnzdrWWor48y+taGxxyBnPM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(56012099006)(11063799006)(3023799007)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZEZTZmw0dEJRekpleGhXT0F2eFBLSGdBZXpxYmJJZk9ocDRseUUwQi9xRCt0?=
 =?utf-8?B?TmNsLytxeDZSZmRhdVNDMDBQNVBWMDREYlllTVhrOThkL0ZQNUdGUU1obXhB?=
 =?utf-8?B?VWhsWm5PQUcrSWJXOGExQnVNSER3ZVpZN01PdUVPU3VZbnQrTGU5SVZMMUZI?=
 =?utf-8?B?a05NSlFmTm9ncmhib3ltRmU1S1FyTzU3c1RzOXoydi9NeWd1cWVhQTBUOWRM?=
 =?utf-8?B?OThRN2FXTTBWNHBJRGlvZ1BTNUEvRjVHNXpvVElPSUIrcWhZbklDSVFEd04w?=
 =?utf-8?B?WFB0M25heENCZjRaTWh2WHVEL24zVzVJa3o0QmdhRW1IUklnb3BpK054ZW85?=
 =?utf-8?B?bjgvL0JISWxGMk5FL2R3Q1Jwa0hTL3JBNHcvZjhLVVBmKzZiQk1peGRaMS9I?=
 =?utf-8?B?SGdubjdoV2FPUEwvT3pseGxMd1BZRHRFK01IK3pjWnNXWTNEM2dDRXJkMGlD?=
 =?utf-8?B?dFladEJpeEd3TnNkTkltSG9EcFBtNVNteW9kLzA0eW03aTFnT1BQZGR3WlFK?=
 =?utf-8?B?N010ZGVnclBjZW9YNkc0NldiM1FTQlhIN0FObUN6YjJvU1FPSkZqQmJrcDBR?=
 =?utf-8?B?dmlORDkwOWtGczk5ZG0vbFJNZTRBQTZDQldFYkVjQ2dVdU9EbEFRYXNDcUpF?=
 =?utf-8?B?bFc5TnZEMFhPdmJFY24wNnlicFk0c2VLUGFBRUphTHlNN0pyeHk1eWpRYnUr?=
 =?utf-8?B?RWM0WVJNaG9xbDhnS3VISGRGck5SZDBPRkhyTFcxVWdTZkc3SmUwTjE3a3Bz?=
 =?utf-8?B?VGNVZW1RWlh0MVdVRGJITzhSU3laT056RlZkV0RNcmlwV1JsSXVsN3VPRStR?=
 =?utf-8?B?RW42NVc3N0dRelVVZWtjS2pUTkVYWU12V1BVYmZWWEtrc2FXK1oyQzE2UUQ4?=
 =?utf-8?B?NnE4Nmk0UXFPSHFaTm9wSGlQcytBdWJtMGtNMG9lMHR1MTViZUZHc2YwbmFs?=
 =?utf-8?B?c096ZjJTZTJSUk4yREV4b084OWdDbFoyRjdVRUJ5UGQ0OTVkdHM4MTcweXBQ?=
 =?utf-8?B?L0lDcmpwOUkrYSttRXdIR09ON3hzT1VDQXFuK3dWV1MvcEhzTDM0ZGRlejVF?=
 =?utf-8?B?Z2hKQXBsWU5pOFVNZjNBRzl0cUx0dWF2UkptRlZ4cUlJQUhnZnIxNXN3MXRU?=
 =?utf-8?B?V1V1SlZ5dFhVeXJybjVTZkswb2E2VHZxWHlmR29JMkg5N2paYitxVk1ueE1G?=
 =?utf-8?B?Q0xxaXFCczE3UzkvNzVlN1R0UThMOWdxT0xFaGNhN3BWTXVac2dWUWlZMWxJ?=
 =?utf-8?B?bTdNVWdVZjhhdnRTZ0x4RzY4RUdPU2ZuRzR6a2o3UVkwVnUzV1BKamcwWXpx?=
 =?utf-8?B?S09OSDBaTkU1ekZUcjhiQTlsdWZ6VVlEVFFLMDI1TXFnK1FiejltcVVkSFFl?=
 =?utf-8?B?TWQ4cUJzR0dIZ3oxY2VMbWxwd2Z4Mjh4TlJzc2JiZ1lYV1ZEQzVUZ0dwcU9p?=
 =?utf-8?B?dk03OW9tM2xLb2t6T0VUSzNuempxd1J3eGMvbFJxZkdueUhTS1FOUnpTMWR6?=
 =?utf-8?B?WVJyY0tIeTFiOFFZR0FwWEljSS80TG9lTzN1N1V6QjkyRElYS01IMkNVTmRH?=
 =?utf-8?B?Smx3V1lwcDYwZml1MFV4Rk1UV1FleG9vUndWbjJkRnd6NEhyYjRSMkJLZ2Rw?=
 =?utf-8?B?dkNEOWJHcWY3bXB2RVQ2UlczL2F6eWw4bHFZV1VlcitEV0Q4di9hRlZ0ZkUr?=
 =?utf-8?B?WW5SZnNmMVZGOUZFZ1NiWFFUQm1pc0NTSElmY3NjL3pFN2c4VTNhMFIzMllI?=
 =?utf-8?B?NUFDSzBKQ0Y4MEErc3hQV1NlQ08yMEVINHpKYk1zQi92NVlkNXY5UnBnWkxS?=
 =?utf-8?B?UkM0ZkdZdjZ0N2NXYVU2QkhyREk2clczc0czSXJKaXNwQVFWdGpGc3YzWHVE?=
 =?utf-8?B?TzBnQ1FIZWE5ZTBaby9VOVdXSkFIVW15cWViV01PT3JuMFA3aXVsYkN5V3hv?=
 =?utf-8?B?aThmS0tuOUlHNkN0bUt5M25ObU1TSktoNDdROXdmeEo2UXJta2VTeWR1VTBX?=
 =?utf-8?B?aUJ4Rys1ZFlwL242ZUdzcStaUHovVmp1ZXk2VUo5UVlZbEVpRmUrYnEyL1pp?=
 =?utf-8?B?RUdRUFNkcmVyS0plQ1BOZmZxelVnbGxEK29ZbDdnMGNBUk9WWjgrOSswT3hM?=
 =?utf-8?B?L2pnUHJ6VjRCOFdtUlB0d0NlczZsbWNJeHE0c0loQ1Z3THFySmJYa3J3ZmF4?=
 =?utf-8?B?NFo3M0NDMlFjdkJDdnRhd0NHdC9kRFI1TWQ1d0Zva2wyMXNzR2VZdUFxcU9n?=
 =?utf-8?B?Z0lyOXZHQXJsUXp0SE1yTUFVaE1OQmV4YS83QTZUL3NMSnZRTE1paWVMVFNS?=
 =?utf-8?B?eU5leEs5UUJLQ0UvNm4vcFpPTVoveXlUZm13R3VoUVpaQnhaTTY2ZGFhMU5T?=
 =?utf-8?Q?xoKH+rzEEHk/28mY=3D?=
X-Exchange-RoutingPolicyChecked: PzRIMzwunzJ2GjwKKSQxshpNj9ph4cQh8KmO9Yy+qxFtcwYfOeZyS/5c5zPQ4uQsYH/NrX7uo+BKbvlfAx9dQ+heecJMl1mLYBKzbGxFe7c/A2ptYYPdM7SjjRai1N5QgWwdB6HEojVqnynMjjyzpnvcThEN9MATxQLB98WaIickkp2B/IvTHbFi/xZCWvdy91WHGalgMojTy8jRYb8EFT0yhhJjiWTuIeqXenvJpkCXarPizbjEQS+sGytiivYeYT+MACMlBX3HzKpX0ZugFObwI4YKxtf9R9pPFXv0M6FGlQDUNQ4GyPgk5rzuihBzHDyrdlLbvsoXY0Ub4Z0Tzg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 42200503-afe0-4da2-a81e-08df13b19a9c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:16:03.5430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xeUo0NOZkgPB9F5GdaE6EiAWSEXh9Y5MMCFFFLI1Mc6Ciin409O4hN7qjnJXQfMMYgZLqY8u0yEhaAYAyPcaOMND+KyoG26U8W6Cv217fVQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7573
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index e3cfa0c10e92..2f4c60487a5d 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -222,6 +222,53 @@ union l3_qos_abmc_cfg {
>  	unsigned long full;
>  };
>  
> +/*

I understand that this is not specifically kernel-doc (since no /**)
but it clearly follows the pattern and also needs to match the 
style used in this file. Considering this, please use custom that
describes members first before the long description? With members
described first the long description can then use @ when referring to
the members.

> + * Privilege Level Zero Association (PLZA) is configured via
> + * MSR_IA32_PQR_PLZA_ASSOC. This MSR must be programmed on every CPU in
> + * a QoS domain. Each domain supports a single PLZA CLOSID and/or RMID
> + * association, and all fields except PLZA_EN must be programmed
> + * identically across the domain to ensure consistent behavior.
> + *
> + * RMID and CLOSID selection are controlled independently. When PLZA is
> + * enabled (plza_en = 1), CPL0 uses CLOSID and RMID values from
> + * MSR_IA32_PQR_PLZA_ASSOC depending on the corresponding enable bits.
> + * When PLZA is disabled (plza_en = 0), the CLOSID and RMID are always
> + * taken from MSR_IA32_PQR_ASSOC regardless of privilege level.
> + *
> + *   - rmid_en = 1: use the RMID programmed in this MSR.

"this MSR" -> "MSR_IA32_PQR_PLZA_ASSOC" or keeping text similar to the
rmid_en = 0 scenario may make it easier to follow what the bit accomplishes: 
	- @rmid_en = 1: use the RMID from MSR_IA32_PQR_PLZA_ASSOC if
			@plza_en = 1

> + *   - rmid_en = 0: use the RMID from MSR_IA32_PQR_ASSOC.
> + *   - closid_en = 1: use the CLOSID programmed in this MSR.

same comment as for rmid_en bit:
	- @closid_en = 1: use the CLOSID from MSR_IA32_PQR_PLZA_ASSOC
			  if @plza_en = 1

> + *   - closid_en = 0: use the CLOSID from MSR_IA32_PQR_ASSOC.
> + *
> + * This allows PLZA to override only RMID, only CLOSID, or both. If both
> + * rmid_en and closid_en are clear, the effective behavior is the same as
> + * when PLZA is disabled, with RMID and CLOSID derived from

"derived from" -> "used from"?

> + * MSR_IA32_PQR_ASSOC irrespective of privilege level.
> + *
> + * @rmid		: RMID programmed for PLZA.
> + * @reserved1		: Reserved.
> + * @rmid_en		: Enable RMID for PLZA.
> + * @closid		: CLOSID programmed for PLZA.
> + * @reserved2		: Reserved.
> + * @closid_en		: Enable CLOSID for PLZA.
> + * @reserved3		: Reserved.
> + * @plza_en		: Enable PLZA. When enabled, PLZA applies to the
> + *			  given CPU.
> + */
> +union msr_pqr_plza_assoc {
> +	struct {
> +		u64	rmid		:12,
> +			reserved1	:19,
> +			rmid_en		: 1,
> +			closid		: 4,
> +			reserved2	:11,
> +			closid_en	: 1,
> +			reserved3	:15,
> +			plza_en		: 1;
> +	} split;
> +	u64	full;
> +};
> +
>  void rdt_ctrl_update(void *arg);
>  
>  int rdt_get_l3_mon_config(struct rdt_resource *r);

Reinette
