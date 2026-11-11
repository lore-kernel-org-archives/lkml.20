Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794421634;
	b=u4R6qBuukg9gCkZ2EN97S/3oNQOORi7o9pVhi9c8X4l4D7R4bV38Uv6dxQ6bAFtoSdjr
	 8ZeoBqsH1FHiw3rJzyuZ+mYrODDRZppoFs227GXoRbwlCwsGP9+7LSYRp2GXcxEh2uPVo
	 Ixlt6sDGpxYuvL02y5hu+V1HWG6wo478MG71e3MkwEaVjklrDsFYP+/yvO9CEjaaARLWq
	 723s0O3rDpiiEabB36gXr3WpNjuZC/9ZzW+oZLrq4Xu96VMXl0YHYxrvnFE2cA2GuLNw9
	 1loHDB92VgOizo4pmajRopp5dn5BkgNUek+aYQPYTJSYCAwLtSuxJT1/KLj4Gq1lwvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421634;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
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
	bh=BM5VdfkIV4kZI28XMaS1wzuCOVIPcUsjq2R2aWhwXtU=;
	b=mLBi2h3lbyYCirBZfDDCpMBWkAu/2RhBz3WSib8TrC842YZKFgXr/ZYbm9RWTx2BcM/x
	 K/FZW5d19CWV3sWU6anySzOosxe6KzeTuqlmtYiJzL/aq/vaNk91p8BE30tVx2rBv4OBp
	 A/D8jx3EV6ZrR+gWX2D7auid5HpY2qOCsZVDYFv6AB1r+fEbmPiWFZu/H2Z4WYlo/tD8e
	 rnjohLMrh/1GajbFD/JXQy5X4X9SSp2i/If37+RDZWs4OpTsYsScI3Uv+kdSEjK/Fbgmy
	 45bdlY9ns/+nFR2ifzE9EaHe4fRoAy5tRQQG0UD4DHF5OUdbTg/RxvCe1iyQRZOKM8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3w7NZzt;
	arc=fail smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652ED606A321;
	Wed, 11 Nov 2026 18:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 652ED606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3w7NZzt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794421633; x=1825957633;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=S5NcJpPWU6u42nhMrndDxA3ww8yKvVuqkIZN85dsgqM=;
  b=C3w7NZztFp5y+5SviPL3Wfjb9ePAFXqR8ze+O2DmD/89NnuOtkMQFXkp
   kF8TJ7FihYm/pMc7+lLec7PH31OSwKZnf8rDxVuJ6ru0nzLocMnPmt+hC
   SgNfAuwUT8Z/URqSAwQAvdEP37pKLV7u8PCCCMGJcknqpHWZHQ/6OZdDW
   Ndqj1Ca9fOa+GSghVxIklY/c7EhQg4ZxoZuv3KmiiXEBVeWvwtUsReLxR
   ejSref9SXUAkxTuRT9eroP76SB7Gs2QrXizXPlSrveVcWtbuJwfBN4QE6
   x3kvJwPuW4TU0DKL5X3jYTqOF7IzXrX5TwNgW4FCma6Je/si/j1eEZht6
   g==;
X-CSE-ConnectionGUID: XD7ScFQTRrS/26W5rcQEfQ==
X-CSE-MsgGUID: dVRLtDX4Rx6XFOP33MUTWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3282838"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3282838"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:27:12 -0800
X-CSE-ConnectionGUID: H/us+pcRTUSpCYtWROktIg==
X-CSE-MsgGUID: 59cZzQBZT1SZsXtRikWxNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8566801"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:27:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:27:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 10:27:11 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.17) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:27:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUcaj7sgRIihE2/EHGerGvaDFruRAXXij+fDJTFKIxwU6aNfJh8pYrKhwzIQURcfDE5DkFkklEZNu2Dv+JBlpoSgoMSLOo1qT/UcjyawHVeXswOHTlrKvnO0Pe3i0PL1VAgwUVUywwZykR0yGG3gKcbhjKvzFtaRYAkH5zakHXSCCikH2Fqrf4xQxvpIc01H5u1ImXWSQS4Z6kfgAObg7iqGsnxMeh0CplfJPtyaU2+PEjKNieT6FMSOui7AKgkWCO3JVNGEgLUlfqWfFLhzT/iCPya1Gb/xk97vbfiT0o8g09KCTbZDPbaY+u/B9tekw8WcSP9Z5tEo3wNwVyxzxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BM5VdfkIV4kZI28XMaS1wzuCOVIPcUsjq2R2aWhwXtU=;
 b=HX9YWkxeyKUOCPPQx8wTVuCZ2Lv+VwHnFx1e7WkskHRypul2LW9qIBhZiIA997YOalsiGdAnPVZYYiddkTcfzRLnje1FUDOmmBoExJRohFH04AG5sCg3RcKAy0TVz0lBE0hYT+PI+fYY0fM+WqX1pHCKiUY1BM/eLnkOSmYzzXdMQ4DS+6CprBjcbbxKN4QJ2pSD1YXgvqu4+LERQbVDJXPe6/ZjYM6R+ovrtiS+YEp6CY+YLRQPEk5Hl6sS9lM2BjwMOhdXNrNp8UC45xMUOO4xA+NoYSJndYoodLHnLryWDQ1KTUQ5ZgSQNZEmECxEE/T1WebboDbtJo1V1MEA/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by SA1PR11MB8447.namprd11.prod.outlook.com (2603:10b6:806:3ac::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 18:27:08 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 18:27:04 +0000
Message-ID: <54da1db7-95e2-4b8f-9d9d-cc2ba4bc6a59@intel.com>
Date: Wed, 11 Nov 2026 10:26:59 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 4/7] fs/resctrl: Stop the limbo handler while
 resctrl is unmounted
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-5-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261110133938.3768632-5-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0136.namprd04.prod.outlook.com
 (2603:10b6:303:84::21) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|SA1PR11MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: d8f06654-10c3-41b8-6e76-08df402162ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|4143699003|56012099006|5023799004|921020|22082099003|18002099003|11063799006|10067099003|261009223027099003|261026121527099003|261026140227099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261021135927099003|261021123027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: jb4NbtLO/xDLu/uDDzoSs1kNt0xrmJESh/Kf6irg+xG3OA37CvQbEL+rBQEMbHJfqAYC1uEjudmzffBm++wRvxUEcptx7WzmTTAJoZyu6k3sIA8Hp+wuCSio7ukpVl96hVfoHr3PxaCSjfISvwa2PaHyCrDdZSAy4VdyxqzRikX5wgoouLAOnWlek8CVxk4pUmTALLSaE0e2/3yjbYX29BbTmicPvD5nmYxOBmIfWiFg6262qSPVWb6Ab8D8//kUxXRyoYkOIkSz9pJ6pHOXZDAD8cHuJEE6Hy+OjtIKM+4TOlUCM9HWWvWckL/q9bOYpkGZ5ZHfImdijDC3JKRKeheze5/2roHWBIuAFUadTkr+P5IB4QeYoUr59YL0/irlsLdoTfUU1XFD8AZql6vy4LpiMg+wecOtMLB493Ktyi3TE4gR/A2R8wtAJnyduWuR3O0BGza5VOOzoSrlC77SjqUUSCYDWK9nWy3p2FAfdw7JCYq65ldo1x7z0Y7HeFiUaL2Q1gWriuEYs7RArDDybyjQiQkJuBPyfrPNuZVCwEei6uwd/Pw2Wtc/vdC8qVyqbrIkXKHWk47a6uVvlFBqsz6BWgMC/pnT4zDnmgAILc+YGgUMhpsowhUwnTgcfK7vqllR07f50wVlrNLdJy/xatLFckfR/dAG2E1qCsOFTh2Z07+tensORHreAY47VVJeFbxbx/VsKGoKM4NWW0si0g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(4143699003)(56012099006)(5023799004)(921020)(22082099003)(18002099003)(11063799006)(10067099003)(261009223027099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261021135927099003)(261021123027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGZIYlNleUZIMldBNTU1ZXFTTHphaVR5dFFJUW5MdS9LUHpFUkRqYnRSd1FJ?=
 =?utf-8?B?RlhLdTJ0anNXSElTNzk5Rk5ZSEVyMFg2Uk5wUTVrd04xVitjRUxRc1lGR3Rp?=
 =?utf-8?B?V0xBOFdvRnc5eFZHYUYzVmhMNE5GVVZTN01kd3dVcGJGeGgyajJzN3o2YVFP?=
 =?utf-8?B?UkhuTE54TXpmYWpqUFZ5cjhnenNIb21pVnFNLzNXYmtjQ0dFWXNtM3o0NVQw?=
 =?utf-8?B?L3V3aTJ1RG5KUms4NDVubmFyYlkxb09wNzl0QVFBcEFQY0VhQ2Y0alM0bTha?=
 =?utf-8?B?Vk4yblVPbUZXZUJHL0tUMHdlTGZXWXJZZjJCUUFXRFJ0OUV0M0pnSmZPU2Ni?=
 =?utf-8?B?cU12LzllTWEwUWRrZVNBVldqRFNiZ2RsdStOUVJEQS9seVhBR0QxU1FFYW5o?=
 =?utf-8?B?aWxWdkpWNCtuaCt1MC90MVFBU3pHTlBaNmk4THV0M0tQZEU1Ny90ZUJkYlJ1?=
 =?utf-8?B?bnZqdk5xR1gvSHFTVEdpRTVKbkNURzlCSktPeHcvM3FjSytKK0llSU5Gd281?=
 =?utf-8?B?MlR5SDRxWUwrWnpxTkwxUCs2dFk4empXUnpoOFB3TzdpUUltWUJJcnZlRFMz?=
 =?utf-8?B?bHUvWXBSZWxtS05ySE5ac0wvM084dDRGZnkwZVhIVjhHNWI5QnZpSitBa3J1?=
 =?utf-8?B?SElsaVVtdy9jb2FYa2NPVko0YTRqKzdXTGZycERiTzRPZFBZNS91QVhuYmlV?=
 =?utf-8?B?ck5BS3NPK1gxbFQ1RUdYVThEZFUrNDNtK2piNnorbVJnd2pEUHhYZDNZcmJ1?=
 =?utf-8?B?Nk5wNnhGdWw0Y2pmMHN5WWpkOC85RE9La3RVZWtOcEhjVkRZdzZvVHZna3JQ?=
 =?utf-8?B?SFBDWFVnTzJqc2Zxc1NYSEhRSFE2b2w5U08yYzY3OWlyY1VZVDU4Y0l3L1g4?=
 =?utf-8?B?UWVPTklvcStMK1d4aHZ4enlNWGttWVArWFI3RkFBdjBxUUw3YnlLZDJyR2sz?=
 =?utf-8?B?NDlPaFUyL085T1piRmp2NXphSm5DQXFFT2VEOXhGUTN4cjVrVFV2L0U1RFlF?=
 =?utf-8?B?UXpMVHI4Q0laNVVIWXhhK09xUHYwdEl0WlpYZFFLektLbnVLZUh3bzh1dWl5?=
 =?utf-8?B?czRwd0h4dGJkOU9BcjlKSVExaEVvWTV5cDVHaWZJdVRTa1ovUjFkRFJjWGIz?=
 =?utf-8?B?REJMTm9tRUNnT1lFYVlKZXdtL2xxRVBoU1p5eFlOUEdJS1VFZWFiaStNcmtP?=
 =?utf-8?B?aVZVZ0hwejdoeUFTcHF5cURtakNyUjRXSVJGVnNLSmpaanVNUVd0QTNMOTJC?=
 =?utf-8?B?TFUxU2doeEZwczZ4ODFiUjlwZVVNNTlncjZMdGNEdm9xREtOVE16TzNudldI?=
 =?utf-8?B?RW9pRHNhQ3FZUlBZdGpXVTlsUmNsYVMrZE95TFB3QzVnRUJaMW5Ia1dHcUJC?=
 =?utf-8?B?MmhIeDNkTHlKejVsL25POTF0b0tMM0hmRmZ2bk5vNFdTMGgxNVcyekpMMjRT?=
 =?utf-8?B?V0JlWE93Wm5QQzZONkVMSVI2ZHd1RkUxUmQvT0VqWHNoSDM5aXF1aHczek1Y?=
 =?utf-8?B?YmxYejVKTVBGanJqWkJMYnBCbGJqQWRzbmVkSVpKeWtxUU12THpBSGxDZzdR?=
 =?utf-8?B?dlUvNHNWbjAwb0ZsZTlKdFNrZldiN2lQWG5jeE1rMm5nY3ZObElFS0t0LzdT?=
 =?utf-8?B?VWMwc25acGJCSzIwOGxQZWdsY2VKWC81bGM3WXI4N2JObG45SzVnemNEMHU5?=
 =?utf-8?B?WERJc1V3U1AyRkNneHRMOGxPazNTaHpXcVFZRzdFRklaMFMzTEJxcG4wdzVL?=
 =?utf-8?B?R0N2NkhWWFg1L1g3akt0NlIwV0NISlloNzJsUlZtMHJXREsrRGhiM0d6aWZo?=
 =?utf-8?B?RHZTLzBSd0VUUElJTW1SOGk4eHMxdzB5NStXcTlhd1hqeDlIV3BqaFBkYll1?=
 =?utf-8?B?TDFPYVNDL2p1MUhzakZzUmdIbWFLY0djU25mZjg2eGJoRzVoN0hiRGgrU1J1?=
 =?utf-8?B?dFJZNENLbHRnYm9xMzhWOUYwQXM1eld2OW5xejNGRmR3azhUa0pRK0JLaXF6?=
 =?utf-8?B?NFhkQW8rMmd6b25wMXVISHJUZm9ZcjloL2NHNWlGdkNlOXFuMmRPK0tHeC9o?=
 =?utf-8?B?UHFoZk03cHBHYVZ4MDlncEtEeUpwYUhJbUQzZVg1RVFyQnZuTVBaTXRaNjBr?=
 =?utf-8?B?d0VWVG5td3ZTWHJiZnBIdVdheEo1VGM5ZkVIODFBYmg0cWg3bjVidFAwVnNa?=
 =?utf-8?B?eWdnL1c1dk1XLzdMWHh2Q3J2U1FJdmVRVXNtTyt1VDBHT21na2hUZm1HUXNx?=
 =?utf-8?B?dWp4cnBYUzJ5ZlpvbmorYVZDeE82aHFhQTkyTE4zams0S1hrM0J4ZUJza3JF?=
 =?utf-8?B?ZkgzSmQzdFJIQ1RqUzc1YjJIRGJQUU40Yi9wQUxURFNpd09FL2R4bmxNVzY2?=
 =?utf-8?Q?ifE5dBKveftaSlqk=3D?=
X-Exchange-RoutingPolicyChecked: t0or+GoZeFbeJPNFoPU5pCNFnKpvCa220z3tcnDpNWZJ/RmRPMK3zSr4xndi7FbJhdY8UnE1St6GZNR/FSRq7SEWBNlE61hUIUHb4y1mpVAb1sgak7msIr+Bt69k7k+hE8okNz+QOn19nYWRLuS7tuBfouJsy0nAhdtDNRMk5njyOlktlDPuCWS3XHCTGWKAZo1i2BGeQcsXnzEnIwIqQao8zzUiouGHRKjE8zAbbCHpF9DrywRRsYtHB5wu+omSoYdiJEXHdLQG0lExmH6DyViJOZPsxXeBuZaSVK7c2zV2p/KyXJl1osBBpuUq7J4LJln8OU9I6g/haKcwNLvWDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d8f06654-10c3-41b8-6e76-08df402162ca
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 18:27:04.8395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1B4me/OdC8v1ZD7PFvYwX4bekHa2KtGQNCQkqKY+I/YHGsQbcu7/2tayC6P20O8HvF94AS/xqck63rUYNyGDycqfRi+rP7//tLKDzpKKePM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8447
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/10/26 5:39 AM, Jinjie Ruan wrote:
> A group's RMID is not returned to the free list when the group is
> removed. It stays in limbo until the cache lines tagged with it are
> evicted, and the limbo handler reads its occupancy counter in the

hmmm ... technically all cache lines associated with an RMID need not
be evicted but instead the number of cache lines tagged with the RMID
needs to be below a threshold.

> meantime. The limbo handler keeps running after resctrl is unmounted,
> while the MBM overflow handler stops once resctrl_mounted is cleared.
> 
> Reading the RMIDs in limbo while resctrl is unmounted is not safe on
> every architecture. On MPAM the counter of an RMID is selected by the
> PARTIDs of the CLOSID that owned it, and the CLOSID to PARTID mapping
> depends on the CDP state. The unmount clears the CDP state, so the
> handler that keeps running reads the RMIDs freed under CDP through the
> PARTIDs of the cleared state.

Can the jumping between CLOSID and PARTID be avoided to reduce confusion?
For example, could above paragraph be simplified to something like below:

	Reading the RMIDs in limbo while resctrl is unmounted is not safe on
	every architecture. On MPAM the counter of an RMID is selected by the
	CLOSID that owns it, and the CLOSID depends on the CDP state. Unmount
	clears the CDP state, so the limbo handler that keeps running reads
	the RMIDs freed under CDP through the CLOSIDs of the cleared state.

> 
> Stop the limbo handler while resctrl is unmounted, as the overflow
> handler does, and restart it after a mount on every domain that still
> has RMIDs in limbo. The worker can stay queued across the unmount, so
> cancel it before queuing it again. This keeps the limbo handler
> lifetime the same on every architecture.
> 
> On x86 the RMIDs in limbo are no longer drained while resctrl is
> unmounted. Nothing needs them until the mount that follows the
> unmount, after which the handler frees them as before.

Since this change impacts all architectures the motivation why this is
ok should be stated prominently and not left as what seems like an
addendum to the changelog. What do you think of dropping the above paragraph
and instead add the following at the beginning of the changelog:

	A monitoring group's RMID is not returned to the free list when the
	group is removed. It stays in limbo until the cache occupancy still
	counted	against it has dropped low enough for the RMID to be reused,
	which the limbo handler checks once a second.

	The limbo handler keeps running after resctrl is unmounted, where
	there is nothing for it to achieve. An RMID is only allocated when a
	group is created, which needs resctrl to be mounted, so no RMID the
	limbo handler returns to the free list can be used before the next mount,
	and that mount can check them itself. The MBM overflow handler already
	stops for this reason once resctrl_mounted is cleared.

	Reading the RMIDs in limbo while resctrl is unmounted is not safe ...

	Stop the limbo handler while resctrl is unmounted ...

> 
> Fixes: 6789fb99282c ("arm_mpam: resctrl: Add CDP emulation")
> Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.1+

Looks like 6789fb99282c landed in 7.1 so this stable constraint looks unnecessary?

> ---
>  fs/resctrl/internal.h |  1 +
>  fs/resctrl/monitor.c  | 43 +++++++++++++++++++++++++++++++++++++++++--
>  fs/resctrl/rdtgroup.c |  2 ++
>  3 files changed, 44 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 1c85e06f09bf..c95fa6ce62e6 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -373,6 +373,7 @@ void closid_free(int closid);
>  int setup_rmid_lru_list(void);
>  
>  void free_rmid_lru_list(void);
> +void resctrl_limbo_resume(void);

Could this new limbo handler helper please be placed with the other limbo
handler related declarations and also match their naming? For example,
resctrl already has "cqm_setup_limbo_handler()", so perhaps this can be
"cqm_resume_limbo_handler()" to make it obvious that there is a connection
between them?

>  
>  int alloc_rmid(u32 closid);
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index ae9ddd380515..f56d0e32fd06 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -852,6 +852,13 @@ void cqm_handle_limbo(struct work_struct *work)
>  	 */
>  	mutex_lock(&rdtgroup_mutex);
>  
> +	/*
> +	 * If the filesystem has been unmounted this work no longer needs to
> +	 * run. resctrl_limbo_resume() restarts it on the next mount.
> +	 */
> +	if (!resctrl_mounted)
> +		goto out_unlock;
> +
>  	/*
>  	 * Ensure the worker is dedicated to a CPU as intended and not
>  	 * relocated by workqueue subsystem as part of CPU going offline.
> @@ -1001,8 +1008,8 @@ int setup_rmid_lru_list(void)
>  	/*
>  	 * Called on every mount, but the number of RMIDs cannot change
>  	 * after the first mount, so keep using the same set of rmid_ptrs[]
> -	 * until resctrl_exit(). Note that the limbo handler continues to
> -	 * access rmid_ptrs[] after resctrl is unmounted.
> +	 * until resctrl_exit(). Note that the RMIDs in limbo stay in limbo
> +	 * across an unmount and are checked again after the next mount.
>  	 */
>  	if (rmid_ptrs)
>  		return 0;
> @@ -1033,6 +1040,38 @@ int setup_rmid_lru_list(void)
>  	return 0;
>  }
>  
> +/**
> + * resctrl_limbo_resume() - Restart the limbo handler after a mount.
> + *
> + * The limbo handler stops while resctrl is unmounted. Restart it on every
> + * domain that still has RMIDs in limbo.
> + */
> +void resctrl_limbo_resume(void)
> +{
> +	struct rdt_l3_mon_domain *d;
> +	struct rdt_resource *r;
> +
> +	lockdep_assert_cpus_held();
> +	lockdep_assert_held(&rdtgroup_mutex);
> +

Could you also please gate this flow on rdt_resource::mon_capable? This matches
the custom of capability check. resctrl filesystem does not enable the event and,
for example, x86 sets monitoring capability after enabling the event. Having the
monitoring capability consistently used as gate for monitoring flow supports
a robust and consistent flow.

> +	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
> +		return;
> +
> +	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
> +				lockdep_is_cpus_held()) {
> +		if (!has_busy_rmid(d))
> +			continue;
> +
> +		/*
> +		 * The unmount may have left the worker queued. Cancel it so
> +		 * it is queued again on a CPU picked now.
> +		 */
> +		cancel_delayed_work(&d->cqm_limbo);
> +		cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
> +	}
> +}
> +
>  void free_rmid_lru_list(void)
>  {
>  	if (!resctrl_arch_mon_capable())
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 3312637fb514..b702fe6dbbec 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -3267,6 +3267,8 @@ static int rdt_get_tree(struct fs_context *fc)
>  						   RESCTRL_PICK_ANY_CPU);
>  	}
>  
> +	resctrl_limbo_resume();
> +
>  	/*
>  	 * Ensure root remains accessible after mutex is unlocked so that
>  	 * kernfs_kill_sb() can run safely if called by kernfs_get_tree()'s

Reinette

