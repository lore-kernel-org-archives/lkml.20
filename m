Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C65D4E1C7D;
	Fri,  9 Oct 2026 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546758; cv=fail; b=KGVLKLfylD9dl3ZEuFiR27uPFnhJUEKTRK8RmfsMYyaQ53RuZGpAFpZ7zXmHw2pJHgoB2ZOuVtxYZyDpWLIoK0aOYIivNMCGFTUfa57gmZQiTEwtWA6CjLOUBZol7dLVP71kRSdzEVVQGWVEFrTzxggVN1U1bAYK5rZk0+L5k8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546758; c=relaxed/simple;
	bh=+DnBTogc33iJWnHPJpF0KtE2Bm+3u1wHyYFNh9uMwPY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e2hQgb3NBqPVj3aqHlMpGpyX7gftUsV6FCz437madoImRDt0xl7hX0JiUL1CIZONpzpE6V6QZRmkJwCklHHt8OAIJVjnejoh5ZpHmhqqaRtYAnY4KvhePwHSucZlrDkfG8A6vrxaLEKjoQQR6l1IPvjS5py5wfydMFIjRUTKJWY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jJ1GIoNy; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jJ1GIoNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791546748; x=1823082748;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+DnBTogc33iJWnHPJpF0KtE2Bm+3u1wHyYFNh9uMwPY=;
  b=jJ1GIoNyQcvGv+tismZxY5fXbOIZyQFwr0fgBuZjwaiP3pNoVO927xLv
   XX6yZmhw5seKJxKf+rFZY6cPYzxYE6grUusyed4BLwlJ+h/ymDtjzcyUl
   E2JhQ9UavckA32/Esavqhiz8k8DdD0ct+/VceRxbnBM3hww8XvAhCtWO7
   uFeRbzLsQjcfX6DFWXzeU2QX++qJeFNaTcqfjLwXJvcO+XPFXPuEsNVUt
   fnmBF6jXODelXQ9yrPZdqmY5JdPfa5A5z2oQ1aeLY4Fe+99/ieHWN+JtS
   lMfYCOunPbKxgxcIOVbOInHub2X1Khg//XdMKUpZPMd9qtXd7AiK4BYey
   A==;
X-CSE-ConnectionGUID: CVxRDKTvS5CF9ER4jW+H7Q==
X-CSE-MsgGUID: KTFTpSAES6Wsh0wdgnSilg==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="350917"
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="350917"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:52:27 -0700
X-CSE-ConnectionGUID: qS08SzRVSH2i97rHEDRxIg==
X-CSE-MsgGUID: u/n9HAVgRYeWOEcA9IEE0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,148,1787036400"; 
   d="scan'208";a="296414"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 04:52:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 04:52:26 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 04:52:26 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.37) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 04:52:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4enefriVbklbtODAdEusn8f6zNw0EYn7eRggzw2v39xIRC2TXV9vOKzdLoT89USogUcIOUrN0ORkY610uTF4/CsJL1wutN1jJ2XDTfxkQzYYE9kq2P/HHZ2rvyN1Zsuw5PY1vb4yYrLEyhqcU2ViNF386HdheC20FIMS3H8qAlJUwY5ZPqxEhLNKWtnplcn4xjJgk8taTgUxZR8ODNETEEGLFly/a059HX4a60SD62AjgYB/I2LPUENnSBSAkvckTGzVAOQZFSVIsoVt8XP2075TImwNFE3X4tl7d9UzpTIfh5aRVFIgV1FVvQ3G9iKScV/lz3ivvbVfcOSoq6kSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBsVzpNhtQkj2g2E34XSnsFIgc3dqndUQQTnjxA8m3s=;
 b=hUg0WBubecl+3I524af28hfmjOukU/W+wkrbp9hsvZ/1R+CVU8xOZObjeRk0YzL1wS4ng5Vcc9n+d9MqVlLBFn4aX6yeLg5jhxWPdFQpkjqavrF5i9BTed4mxq38d0wR/jVbHm7oJogYMpFPO6DFbld/WQLw00h7xYYyR/+ALYHm2MiYzUylTiLH4jV2RaeIKE0EiodXlQkFEX0DVgNzX6CII5zBQw1ZbYd1bV227/WbweLzUoMwRG0+K0+2I+eykVrJJBpcOrH1W7tZ0RR3PET7lpmIF8ZU2Rxf8NQ7fhOO12dCjWv8ouSE3IoPnFJ4uXTf/EeL6yZcOHlOBXltqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by EAYPR11MB838216.namprd11.prod.outlook.com (2603:10b6:303:2fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 11:52:18 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 11:52:18 +0000
Message-ID: <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
Date: Fri, 9 Oct 2026 13:52:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: James Calligeros <jcalligeros99@gmail.com>
CC: <asahi@lists.linux.dev>, <linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Hector Martin <marcan@marcan.st>,
	"Sasha Finkelstein" <k@chaosmail.tech>, David Rhodes
	<david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>,
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
	<baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2PEPF000008B4.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::68a) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|EAYPR11MB838216:EE_
X-MS-Office365-Filtering-Correlation-Id: e99117aa-0aac-4e2b-4e0f-08df25fbc4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|7416014|1800799024|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: jys+9JVxc2YYP79Y0LAVn4h6oPVGEgXCmXRiKtSnuKIDLoTr2UedXMf9IdLSEHMTejouhx+saJ8KaAqv42h6jksQlNcIG7Argpmx6mZPq/ql1hF01gQrowq9xvCkHVBg1uIYIY0sPERYTk8Oq6JUgycdzrrJPOW/AShnzq5+wsXIVMvICSQnHqaUBR2/1VSxq3SNAQuYFHFi/QasTMrD5ny8qeVgkQLcnRSwIxYZ1orTUZZk9a3qLqFszU72wPwtZrBw/2q+nc9u90G012y1VcnSNJXfppREAF0R3khrePaIMRnV2L2cehTrqFAE9+3YKr6RVVpNdxYp9SFbDD8OnjvJfG8bNZR15o1umU6f4a/y7eppWpIHc+hJ6Fi91OGlXpmHVuTSt6jQ4pKC0SbGWw4oo7VPSSxxiPd6p4kQfXkS27DPs2WPJqME4u2Hr3/GHYOSpDY6epgUhmxaq+HKiVwumOEwaxZmup1dh7U3BhmukHm71hWsD/ioCX/Tcc72vHV2/5jsQk1Y0l/kFay7AgxqlLedY4JIvcrRI1/TVsNFCWcR8sltpW5AuC7QaeJjUcJ1EapiYLiyojFA7wteZkWgjA6wIkkFvLB5yUs0kSYIXjja6+6GeYfA7KzwfZLWsUzPbSfVHgZ/1xvaeQu8ZDG98jS9GHn4fWCtcLJhWaw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(7416014)(1800799024)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2NYbVhEcXhrYWlwTmx5RG9mNlIzRW5PL3Boa2RJaXJXSnJhYVJlby9PS2Va?=
 =?utf-8?B?clJUZlI3M3RjMmlDTEF2YlhGNW8vNlJQWllQRmhRUjZMeGNLZkdOenNWMW1j?=
 =?utf-8?B?cEFDUE9WcVRBZUN4Rkt1VThKRmdTWm5wanJmeUNKM0VnVVBTeEVEbTJWT2t0?=
 =?utf-8?B?TUkxVURPSWY4ZzZDbXBtZEhtZ0NDVkgzbnN3Vlg0V3NrcEJ4QWhxSnpjZzVC?=
 =?utf-8?B?WW5TdVRzOFR6dW1TTTNrdUJNREh4VU1TOXVBU01makRUL1VUTm1VTkpsQ2hE?=
 =?utf-8?B?bGcwK3BKOEpxdzkxMmdOb05zUWMwUUNINHQ4VHo5WDVlWEdab0NWNm95TzFn?=
 =?utf-8?B?QXU2VlpIS1loQVQ5REtoQU93ZWpoQ0lrZkpEbWNxR2Z3NWhrNFpsQ3lkWjZ6?=
 =?utf-8?B?czJGTDlPbkNNTHFBSEc4WGFXTTZXNEJXMEZiYTdKSFQwZFR1aGkxbUErQ2JG?=
 =?utf-8?B?U1crRUE1cmw5aEFlUDB6N0JLdmhZY254MlJlRTRTc1hkbXpENjREbUtxc0M2?=
 =?utf-8?B?N0tyam55TVFnWnplb1R2ejk4ODg1ZlNxRWMvKytkcGJBckpWK2tqcXBuc3Zt?=
 =?utf-8?B?eTJyZ09vU2tJWi91cVo2bU9oeUtJUXRxR0RqT1dGczBHRzAzSVdBM05iOEZJ?=
 =?utf-8?B?T2JXZ0I1WEpiU1pzQ1V2RC9CS3Z6WU03SFB6YzhEQmRDVXpMM3ZESVRoSjlW?=
 =?utf-8?B?blBxVTA1Qml5Kzc5QjhUNHlha2xFREhzU3hRdXZuMmZUZHBMUmpYeU5Vckts?=
 =?utf-8?B?UkNiaUt0WU1QMXR5K1JjL1h6S0xYcE1Pd2JtTXJlK1UxUWtYSElIUlo3MW5J?=
 =?utf-8?B?T1p0YVlPaUlNK2wvdzZmVkEwbUdKRmlTeWlxdDlKR2RPY0NYL3Z6QUNmeUZC?=
 =?utf-8?B?aEdLQXowODlrZVhoZ253ODBBZnRFbXJZY2xEWEV3UXR0OFBYVHExQzVlL1Av?=
 =?utf-8?B?NmN4azVQQnMwcHdSamFIV2tXVWNrbDFNRmhlYytUaURWSW15ZElhWEx1Uzg2?=
 =?utf-8?B?L2hacWtuRWxsMXMwaTRXS3RNRmE2NnlYdFY1Y210Ti9TUGR1MUZVcWNodjdr?=
 =?utf-8?B?aWZMTXkrM0c1T2pqUmdwamN6VkY4aWd2UzBDdnJrSzJtd2VxNU00SDkrTVlW?=
 =?utf-8?B?VldKSjgxbjF2TjlBNXEzaFMrekVRWkRlbnZOQUh2RG1tMnI2MFVsQUdBL2hV?=
 =?utf-8?B?N1dyay9TQVNPOVpMenQvZ0k0TlowaTlzUTFBVXdMUmdlMDF3VnZHc0JaenNj?=
 =?utf-8?B?MjFBQ2dGR0l1alN5OXMwaXUyME4vZWZwTUdNY1RpMERuc3JTeXNMRzRCZ0xs?=
 =?utf-8?B?ak1RclZFWE9ZUG0vYXZySm1lU0ZqaStGZS9DaFRyWFMra2hNTVEyK0RGNTQ3?=
 =?utf-8?B?M1hUanE4aXI2YkZvUE1RZXBIVFdDQUs2RDdnRVlQUlBWNEZhT01nUGtNcGll?=
 =?utf-8?B?aGtyRXRWd29ORGxvY2RmOE1jVG5sRGZ6VWhEbkFNNW9sRTY1Zi9NRHdHYmNl?=
 =?utf-8?B?aXZHczRFMTRNcG1SaFNXcWUzRnF6d29LL3FhTnVkcHdnSVllWXhmNmN4RDdw?=
 =?utf-8?B?V24zTnl6OFFqMEQ1OGNFYjlSSmY2a2xDRHhxa21scUp5TnJScy94dGF3c1VF?=
 =?utf-8?B?aGN0Qkt6bnRlZklMdkc0TmdjSFNvbEV5cjFBOURBa1ZMTEVrTTZmaytOMjNF?=
 =?utf-8?B?akpZdnZ1WFpjdWVtQjBXM0dpdXFXY0tkY3NVWTVVKy9FVFJoZDc0eStKUzdt?=
 =?utf-8?B?aTdQSWtVdndCWE5aQm5WanBqWFJWNFdCRGQxZXhmTElXY2FjMVMrcDRTenNB?=
 =?utf-8?B?NzV4NFk4NXpKUDRvc0xiU21XTS9Cc0FIYlFrS0lZQnFLMnJiQjFOMjVMc0d4?=
 =?utf-8?B?cXRaOVVUbitrdU1mT0FRZThoYzN3QVY1ek5RdERlQzkrWXNHVDV0cFNiRkt2?=
 =?utf-8?B?eTB0RHBsaU0vaE1IeDJHNytORlk2YnU3VUN5OE5WdE43L0Q1TEk5dG9ZandD?=
 =?utf-8?B?VWNVQkc1MFRlZXErU3FUMnc0dTJRcVJSNkR6RWpGQ05KL1FQTHh0a0wxditk?=
 =?utf-8?B?VytwbTI5VmY1S0JKdU1pc2hSdFEzeVY2UHpLWXA2WXFSeEVCMTFaajlqWEJa?=
 =?utf-8?B?L1lNcWhIaGE3SUJsdXFYczhoUk5SanJyWVFOMXBpVEp1WWJmV1Fab2tWdlJL?=
 =?utf-8?B?Z2E4YVhjYlA5elk3SkpzSks1TUdsZWlLa1ppcWQ4TDZqTXdvT2JlaHhiVGJY?=
 =?utf-8?B?M2c1clJ1R3Z2WGM2b3BIVVdzSnFBNmtrNUN0YlRoSlBHR3ZPdnhsK0Y4dXkz?=
 =?utf-8?B?UkdpMjEyeVJzWmRidE94SjZiZ2hBVUJpamErZW1hYXMrU2pvaTdLcHlYR2Y2?=
 =?utf-8?Q?BI2oQb18I4JRH6VE=3D?=
X-Exchange-RoutingPolicyChecked: ECx6KQ5HBWLzMr6HZGac1xw5h90VStnRxmpYGxJU+5+IYnpVdqjTUVDR5U2CS+1LYfqp/JXkQ1nQcxtINkVC1a6LeAuzs6Sa28sHSX94Pzq3c6uxxLVI37rTt1npWQ+JiDm1+eXGUQ1C2tSjSXf6kzoRKihCzuK4YyD4SbulOVFgyk4+3R8SzRqCqLr83iw7jykTwxsNKNBhIFKVXx73bW6RPaZeBnbNwQjeWIqS/Bi/HTh+stzX/D9proGfJBqdRUT+QnoX3OLfKP1xxT8knoGbOrW/Tl0odHDlaDAfl9plxQ4tE2bUxeSj4WuOsfWp9Y8U8Rs1mSvUb2uniicKNg==
X-MS-Exchange-CrossTenant-Network-Message-Id: e99117aa-0aac-4e2b-4e0f-08df25fbc4c5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 11:52:18.0519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4TaObi22jHD99kuk7eNYOfGrzR4bKdSpDGvVU0nowYAPsbqGfJeyRcskqYeLFIAnURAtCOinV3M4fGWFkvte0T8nkKtTyxar88Y+J1D1wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR11MB838216
X-OriginatorOrg: intel.com

On 10/4/2026 8:03 AM, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> Apple Silicon Macs have a complex audio subsystem consisting
> of an I2S peripheral (MCA) and multiple codecs of various
> models and capabilities. Some machines have a basic mono
> speaker with hardware downmix, while others have a very
> intricate stereo system consisting of multiple codecs and
> drivers per L/R channel. Some machines report voice coil
> voltage and current information back to the SoC, and others
> do not. All machines have a headset jack.
> 
> Add an ASoC machine driver for this platform.

> +struct ma_codec_idle {
> +	int idle_mode;
> +	u32 idle_mask;
> +};
> +
> +struct macaudio_snd_data {
> +	struct snd_soc_card card;
> +	struct snd_soc_jack jack;

Hi,

Typically storing both card and jack heralds that the design is off.
Especially when stored as fields. Looks to me as if you've made a one
structure to catch them all.

Let's start with the card. Below are the users - I'll skip dev_xxx()s as
that's an easy fix:

macaudio_dpcm_hw_params()
macaudio_be_hw_free()
	both can access the card from the substream/dai without
	relying on the ma-context

macaudio_parse_of()
macaudio_parse_of_be_dai_link()
	called in context which creates the very card

macaudio_vlimit_enable_timeout()
macaudio_vlimit_disable_timeout()
macaudio_vlimit_update()
	called in context of delayed part of the trigger() callback.
	I'd need more information on the trigger() implementation of
	yours to present a solution. See the comments below.

Skipped macaudio_vlimit_unlock() as it's called in context of
macaudio_vlimit_update() and macaudio_late_probe(). The latter has
direct access to the card while the former is mentioned above.


> +	int jack_plugin_state;
> +
> +	const struct macaudio_platform_cfg *cfg;
> +	bool has_speakers;
> +	bool has_sense;
> +	bool has_safety;
> +	unsigned int max_channels;
> +
> +	struct macaudio_link_props {
> +		/* frontend props */
> +		unsigned int bclk_ratio;
> +		bool is_sense;
> +
> +		/* backend props */
> +		bool is_speakers;
> +		bool is_headphones;
> +		unsigned int tdm_mask;
> +		struct ma_codec_idle *codecs;
> +	} *link_props;
> +
> +	int speaker_sample_rate;
> +	struct snd_kcontrol *speaker_sample_rate_kctl;
> +
> +	struct mutex be_link_mutex;
> +
> +	struct mutex volume_lock_mutex;
> +	bool speaker_volume_unlocked;
> +	bool speaker_volume_was_locked;
> +	struct snd_kcontrol *speaker_lock_kctl;
> +	u64 bes_active;
> +	bool speaker_lock_timeout_enabled;
> +	ktime_t speaker_lock_timeout;
> +	ktime_t speaker_lock_remain;
> +	struct delayed_work lock_timeout_work;
> +	struct work_struct lock_update_work;
> +
> +};

> +static int macaudio_be_trigger(struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
> +	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
> +
> +	guard(mutex)(&ma->be_link_mutex);

As already pointed out by Ajay, there is no 'nonatomic' flag set and
without such, you will hit a problem, eventually.

> +	if (props->is_speakers && substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		switch (cmd) {
> +		case SNDRV_PCM_TRIGGER_START:
> +		case SNDRV_PCM_TRIGGER_RESUME:
> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +			ma->bes_active |= BIT(rtd->dai_link->id);
> +			break;
> +		case SNDRV_PCM_TRIGGER_SUSPEND:
> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		case SNDRV_PCM_TRIGGER_STOP:
> +			ma->bes_active &= ~BIT(rtd->dai_link->id);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		schedule_work(&ma->lock_update_work);

trigger() should enable DMA work and/or signal other components
participating in the streaming to start their tasks too.

Please correct me if I'm wrong but it seems the scheduled work does
speaker-volume operations only. Moreover, it seems that
->lock_update_work may schedule a follow up work in form of
->lock_timeout_work. Are you sure trigger() is the right place to do
volume-control in delayed manner?

Once we clear the mist around the main structure and the trigger()
callback, I can happily review the "easier" parts of the patch.

> +	}
> +
> +	return 0;
> +}
