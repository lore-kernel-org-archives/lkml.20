Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B484B4BE451
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006799; cv=fail; b=PJObcPmuEScT4LJ9DGVUGxEtpzQ2gFaix9z2zDV9nvL96ltkqpRZkFSqq77vF93VwNfzpqGJvSDSxFqkd5d8592AO49+kEghtaVcGHNdSc58nWe7CTj7ES1Ya0lgGx/TBTPxexQfi4IJ10pDpwvivhNHajfMcrkrXbNNngM9Mws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006799; c=relaxed/simple;
	bh=Nd4TSLUjdt8vNl3RDrtEysL50z7uVDUDbpyEbRkXSoQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TPrJEQd/Jg/4z5XzMMTimd6ZrobWLvPcnRvBPhQY3nOnzwEDaucnRfRxbQNUzx9c64fkje/9aBZdKZ5jxlc3nL41yUhv6MpP0pcHgnZ+9r5uXKOqwhEJIJ4IkgUhQBzFyK0yuoEUoH/2hyIvdjrTX2opNsA3v+SOsZmmSXArJ1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WFeCMZFq; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WFeCMZFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790006798; x=1821542798;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Nd4TSLUjdt8vNl3RDrtEysL50z7uVDUDbpyEbRkXSoQ=;
  b=WFeCMZFqmk4RJvHUl+lBZjc2WP/Sr3tqsoirIEdnWlSEfZdBhhH3El6S
   43wZIfUJomPiIaHFzFt2/fDmzvuuWsTQB/cVli2a87mMZu7jTih7Jkg8D
   79Dku91gpeK//pZnhwsRc60af6WBYvB9j03he007gTWS5diu9iDb8Y11p
   6kaHrcdctvBGRudLoP00BoT3zeB0u2InZPmoSKg+xHdFl2/fRgVcnKHDX
   kNdrW6IOHse/uVZ6gXWYyB41yR9LueKTrl4uwsXEATAVBa9yNM6PkkAJN
   HbSiJ4Hvw/UXkdI60ApINnKnzUYVe82zNikczytqMUv2q+lvl0u87xjAw
   Q==;
X-CSE-ConnectionGUID: d6jA1XEeSGq4/SWrOD3wxw==
X-CSE-MsgGUID: gwbcF7qPSWOzb030PjUwZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90556382"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="90556382"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 09:06:29 -0700
X-CSE-ConnectionGUID: STbF4FqBQ0SRD3LhdTt0wg==
X-CSE-MsgGUID: 6Nv2HOaUQbWMt5SpeP9NOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="272881829"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 09:06:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 09:06:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 09:06:28 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 09:06:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CrJ0+6RWvdy4EAbfmvVtMbPO5lfnz2DmWsAlW6Xx8cCXR2GGxtxgCUq4fJbx8x5qlNx6tq4NiYVc9Y22buZpuezU7Jyc40399no9rsl+vrNpaVTqqU8++01Q0w9P2vUgBnfw+Q9rQuM0AStKrMHzUKX1TK4s4tvHodVoSW4gXqs3L0aYZMzACGTnpedf1QdaMSFGlinYRPx9etCUtztguAt7srD+6In/BWcCYDXoelubBp4mBxC/6EgOgRC3GFYcvhZ7BjwLyc4YrkFujRktpzKEkmAdi3x/esc81xXe0ScoJYgUTdI4MKes154AL8CyS9qSj4M12tCDto3/ceRoDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOG+NMkEnbkBZTpYjysAbE9osvorXyRDyghh70XH3UU=;
 b=oWmu+PQPObnTDeD9pLyMXJfnJSF53du1q5hEy0sOjGSD5IddHypoxxoI454dGLNCKOVlaHErkmopePUZ6KW5twcQ7SulGNcYB8a16Uvngebe5atk7aVOP0k8MPaXouuKBCu2Hj6wk7QJL6WDKqVxd8iZUCZBTz5NdxevugO8DqyYa60Z8+LNyiBUGi/qxZ33jJZNFHLuTnc8m7xdCVlz5gCk1pWiJb2oGoaZ2MbRpymTlsyT8rBZMG6RcNS0yTacq4MQGtP6Ri5+mz69KoWrtegSPy4cQ7dex0pSMsjiHl5VoBKKUV3uSNTrd0NCoLBYLYKR/89RMjTB6JZ20q7P0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:06:24 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:06:24 +0000
Message-ID: <46e62f37-37f0-4d8e-b869-b83a61cb611b@intel.com>
Date: Mon, 21 Sep 2026 09:06:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2] arm,x86,fs/resctrl: Generic schema description Proof of
 Concept
To: Ben Horgan <ben.horgan@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, "Tony
 Luck" <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Dave Martin
	<Dave.Martin@arm.com>, Babu Moger <babu.moger@amd.com>, Drew Fustini
	<fustini@kernel.org>, Chen Yu <yu.c.chen@intel.com>
CC: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	"Dave Hansen" <dave.hansen@linux.intel.com>, Peter Newman
	<peternewman@google.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <eed6d913-c01e-46d4-b249-68d2e7f5b616@nvidia.com>
 <6cf3efa5-697f-476d-9f8b-0c97bebd706b@intel.com>
 <3f39918f-91c0-4411-88d2-1ab1db3f12d8@arm.com>
 <94cb1f7b-0b78-4aec-8d57-7ae7e547cf36@intel.com>
 <7ff818b9-77b9-4ac8-9132-98fec40ab0ac@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <7ff818b9-77b9-4ac8-9132-98fec40ab0ac@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:303:b5::16) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SN7PR11MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ed6509-beb0-49c5-5f8b-08df17fa48a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|13003099007|3023799007|6133799003|10067099003|5023799004|11063799006|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: dyX8ZDQCeLs3Unz6D3+4wTTjLzDx2dhp1U4r3j8/cDli2rjTbHxFui1IBepbHqzbGUCt/KskRpKXwJDKwqi62woDMfXaoH/kLtmjYbczaeVYhBBw4bYlpY0X7TaM3crbuwbCBdLD6+7sufF/6UmSTBguLk4CIfrb8n3iLlOIMNUVkDU6ha232JpGq58zDrm+b1IejKxh0X2BtLNV2BhFGw5usBzgr4+ft3GEyY+K3fNEsVzfjKWMv4ExBjZeassREUmbPaSGd+sdvFqZZxDsjR/B9uydPmuRMuP928a3N72fSKfX26GrJYYoLuioyTJkpWfE7UBgSbmJtniVyo4C+AVURiVHqb4mVF59XMebd0NGbQDV35MRT/nk1Ti+qCHv4P1F7BkginyxLSK5DkeSMjZFbIB62Suh+yyPVXGbdY7QfJ7C/BTtHUiq75AnzDtJsduuw17Ci+vRCcg8RoGMUksd5+BrOczcSHDSlDnYbpvu87yxo/0/kv2Nv67q4y6V2IV4ddq7UMYeSMCpY9l7w+MPXO8yHsIZVbptIYC9QKkhzr5HrANVUbeJg1y7fkU0vt1/uL01ADKiM33Qimzdqy2dgysj5NM5oB6mnPjIxV47Pc/2pUp3s+bSfqCAOl7Q
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(13003099007)(3023799007)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?anRobFArWXJXOS9UTWY2MUVaOGdXQXRvWXFwN0Yvc29heGhDS2lORWd6WGdS?=
 =?utf-8?B?aGFsMWhEUHF5SmVLbDlaVzdFWlBRaHM5MGZPcm9KK1FKNE5uMHBDSGdzVlF2?=
 =?utf-8?B?aEVkOW1EdzRyTVF6RlR6RFRwa1ZsTUQyaGhCMitpV2Y2R1lpR29jT0FsWVFK?=
 =?utf-8?B?UU43ZEllM1Iybzg5bEk1Tzh5emdOQ2JuQVgwQnZuQXBQczhIaDI2Y2NzQkMz?=
 =?utf-8?B?dUJzQXlGK24xNlZRZGh6WDh5S0tidVR2cXJkdEtJZEh3K00wbGZick95OUFI?=
 =?utf-8?B?U0N2dlRnNEdPYUVwUEh3cnQzcktzZVBPa3dCZ0xNMFp0UklPSktONm95MVhy?=
 =?utf-8?B?Q2c3dUFVb0plR1E0dXBFeXhwOE83K0J2R2Jlby8rdUhMc1ZlanhEdGs2Myt0?=
 =?utf-8?B?a2hJYllQVkJ3aUdmZjBpQTVzU1psTWI0THRlZjJKM2x6b0ozRTZUdmpyS05H?=
 =?utf-8?B?bnBmdTBTRldzb0krNW10eUZ2NW9wOFJQQ082SlhJSEZTTEVCZThXWk1saXQx?=
 =?utf-8?B?OUE1M1Y5bzZhcHU5L1BoTi8vRjVPdklNZ3U2S2M5aExSVWZqVW5YbmNHMlNk?=
 =?utf-8?B?cXpERER5OFBXOEpLMUtqeUVOMjd1akhyTzlKVzFlMU5qeGtPaWdEdlFzOEtU?=
 =?utf-8?B?dGNEZGpZbGpuZmVobVRuTjBLQ1VuZkpHUDVCWTRha2cyN3BQeXpyVUNzbFFp?=
 =?utf-8?B?MGpUVjRNWTlDZkdGbUxiUmUvbFV3MC9CSkY4VkQveUdyN2t4SXlCZ3hBWFB4?=
 =?utf-8?B?cnA2Zy9GQkNiZEFwTnpRczZySHMvT0xiL0hlT1lDYUsxZ3F5Z0dRcy9qWUpt?=
 =?utf-8?B?cVVHdFBwNHl4V1FXS1JmK3RCNDdIMnNLeXIvdlBINnlOdE1kWGFOa2dXUGdI?=
 =?utf-8?B?dVhheWZ1VWpueEJVdE9LL0VaZU1sdlZ4bWpHNWR4Z3FOM3MyQURyYVBwaUk3?=
 =?utf-8?B?aGtSVUtDTWhQVkYwdGpwUjBIeTRQenR3YWp3bXNsZ1BWZ1dNeXFkbUYzUTh2?=
 =?utf-8?B?U3dzOEZGUUJVR2xsanNBTDBSdXozT25iYldWcHc4d0laZFZiOW5kK1hnWmhD?=
 =?utf-8?B?MzZ6azVQVFp4b2F0eDUzN3pzaWlrcm00NmcyeEI1NVdYcVFaS0ZUVXpMUjJu?=
 =?utf-8?B?Z0dVeW1FVzlNd3FiY3JBNERpZGI2K1hRVm5oTHgxVDFETmp0clFsYURxWnhn?=
 =?utf-8?B?L2szNFlXWFllQ0dIS2JPOWVKUmg2M2I3YzhXYWpydkd0UXN0K0FyK0VoZEox?=
 =?utf-8?B?OTUrc2Zjc2pqR3d6THdaY3pwOUFQNU54WWhXVVc4OUU1UUZOb3ZsdVovMHh0?=
 =?utf-8?B?VG11Z0FLWEhFNnJOK3VGM2VHSSt6eXZDdXNKTGNhS2oyaFdBTm5aZUdXVmpU?=
 =?utf-8?B?dENocnZHZVpTVGYxT0cxczlsYjAyV3lJS0tIdVpGbitLTkI2SXdaTGlRQXUz?=
 =?utf-8?B?UXlGQ0JpbFB6Qlovd2JncTVYd0VicDFRa0dwQ29keFV2ZHB0cmI3akRHUGkw?=
 =?utf-8?B?dEpBUFZoN3RQdmhYcWVYQ3FpY2VpSlhFd21ocWFVcy9lWjU1RDVFMi9OU0x3?=
 =?utf-8?B?dCt1dTFHeXNGZ0l3QkJFcFVQVnlTWFZ4UTF0Y3F5dXNsbkhNZTQ3N2lqYXQr?=
 =?utf-8?B?c1VES0FldVpkMzZuSDB5cnUvSSs0TGhZNHVoclRNNy9kdGs5L21RdUJlUnd4?=
 =?utf-8?B?ZldzcSsvV2lyVVpwV2xFWjExZVR3VlQ2ckcyUnNpcE5kSXdJQXlSVXh6K1Vu?=
 =?utf-8?B?cHB5RmxuUVNtWllsVmFLOUJSSFlSVytvWk5tL1VUQXE5Vkp3NWJiZmxMYUdE?=
 =?utf-8?B?WVZtc3lXcldoZnhMZUw4NDFJOFRpMXFLd0pwTlY2YzRESGkvR2pFYTkwMmJa?=
 =?utf-8?B?WGNzT013VEl2ZGVvcDUrTGVjMGdEdC9nbzJkVHphZ3Q0M1R0U2JlSEUrazN6?=
 =?utf-8?B?bFpJbEFnV1NiUTIrYm5hbmFOZGF1d1QwYm5sVm9PZ2N2WE82OEY1bFQyWkpj?=
 =?utf-8?B?TzRXdGdVUHZoaHNjNFh0cFEzZXlQczVjdEo4T242QXZEWFI3WVUwQ1VZZXJk?=
 =?utf-8?B?L09MdElDaTRjVm8vMmVycjZkUFgrNTZYU3VDUWI4VlRiWHRDZFVGTy9mMUVC?=
 =?utf-8?B?TllCbXJtOElWOXdwbFYrVnV5cE9BTXZqUzJrSnhMclpDUERWRDZnU2dqc3ZQ?=
 =?utf-8?B?TlJvekpmRDNTSEMzMTVodXBqTjdzRnF4TGhXb3hER0F0cWkyaStxQk84UVV5?=
 =?utf-8?B?TktHMnh3aTA2SGhMdWd4Y1ViYlgvQmJqUmtxQTZSOW5SRGVZMG14eTZrTTBI?=
 =?utf-8?B?QVFFWUkwYkVVRFhpelBnZDhRSzMzblNSUkxiYVNqYTdISERWOFFReG5UbE05?=
 =?utf-8?Q?uKxxVVO0+5Imp/JU=3D?=
X-Exchange-RoutingPolicyChecked: T03CacAsH4+plcmojIiMuw5KPK8MGLff/lwtbjnkxKnwkaETMv+0HHat3fhZhRZNLEZ1ZwDW3DPS6GHeRLNFZpJCiX/ngJ+UZm/hb0f98H06g2ysY2xlQ6vWCjhOhLLv6luTbxGcd232Lx1vGCYHE1VeVvuueeeTijlWP1fCuqChrsFIBAmfLKYNkn648gdbq5ZT8iPq23iYCDVzl5nzMBztkVfErlRU0xBqUAdvKrxELhZ2VvgCa4FH52/Ts9cAu/P3uQu1R7xiaEsf1udM+H9tbFjHKLT42ooUmU3gCdkabmJ5Uv3enYTt3bWyYoK3YDkBj73An0Mdvcu3O8O2Lg==
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ed6509-beb0-49c5-5f8b-08df17fa48a9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:06:24.0507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEoOv0zxyK/bCqWFpL0bgk2eixrrSw6qmBy1qDx7mjz08vVn9lodfgt9gXcH51Y0RsyRPRSOa2gmCpaSKGCnITuxO8WgazlBXSHW4y2J7jE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
X-OriginatorOrg: intel.com

Hi Ben,

On 9/21/26 3:22 AM, Ben Horgan wrote:
> Hi Reinette,
> 
> On 18/09/2026 23:47, Reinette Chatre wrote:
>> Hi Ben,
>>
>> On 9/11/26 3:09 AM, Ben Horgan wrote:
>>> Hi Reinette, Fenghua,
>>>
>>> A couple more thoughts on emulation.
>>>
>>> On 10/08/2026 16:53, Reinette Chatre wrote:
>>>> On 8/9/26 7:55 PM, Fenghua Yu wrote:
>>>>> On 8/3/26 22:26, Reinette Chatre wrote:

...>>>>>  * @emulated_by:List of controls that emulate this control. When set the containing
>>>>>  *              struct resctrl_ctrl is likely a legacy control and @emulated_by
>>>>>  *              are the finer grained hardware controls used to back the legacy
>>>>>  *              control. This emulation is hidden from user in schemata file when
>>>>>  *              rdt_resource::ctrl_mode is RESCTRL_CTRL_MODE_LEGACY and
>>>>>  *              exposed when rdt_resource::ctrl_mode is
>>>>>  *              RESCTRL_CTRL_MODE_NATIVE.
>>>>>  */
>>>>> struct resctrl_ctrl {
>>>>> ...
>>>>>         struct list_head        emulated_by;
>>>>> };
>>>>>
>>>>> Does this mean a legacy resctrl control can be emulated by a few
>>>>> resctrl controls (which is stored in the list)?
>>>>>
>>>>> e.g. legacy MB control can be emulated by a few controls? I thought
>>>>> "MB:" line is emulated by only one native control. e.g. "MB:" line
>>>>> is emulated by "MB_NODE:" line.
>>>>
>>>> As Chenyu highlighted this is to support region-aware. 
>>>>
>>>> While I did originally suggest MB_NODE to emulate MB I learned from Ben just
>>>> how troublesome this can be. I am still trying to untangle how MPAM MSC and
>>>> AMD GLBE can be supported in this new interface. Could you please consider the
>>>> most recent message on this topic:
>>>> https://lore.kernel.org/lkml/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
>>>
>>> For the emulation of MB. I think in the case where the MPAM driver currently uses the memory class
>>> to back it (single L3/single NUMA node) then it would be most correct for the MB control to become
>>> MB_NODE_MAX when switching from legacy to native. As previously discussed, in the other case when MB
>>> is backed by a cache class then I don't think it makes sense for MB_NODE to emulate MB.
>>>
>>> I'm wondering if it would be best to make the legacy/native switch a mount option (--native). By not
>>> being resource specific it allows controls to move between resources where that is appropriate. A
>>
>> In the current design switching between legacy and native only involves changing which controls belonging
>> to a resource are exposed to user space. No matter if legacy or native is active the controls remain
>> associated with the same resource without ever changing the relationship between control and resource, nor
>> changing the relationship between controls. Practically speaking: the info file hierarchy does not change.
>>
>> Moving controls between resources sounds like something entirely different and a significant new change.
>>
>> So far the model has been for the architecture driver to own and "build" the resources, their associated
>> controls, and their control and monitoring domains. After the architecture establishes these relationships
>> the data is shared with resctrl fs but architecture driver always owns it. Letting resctrl fs make adjustments
>> to any of these relationships is unexpected to me. More so when this can change from mount to mount.
>>
>> Changing the "shape" of a system seems to be something that the architecture should own?
>>
>> Are you instead saying that resctrl should expose a node scoped control as that of a L3 scope control?
> 
> The problem is that this already happens, for MPAM, in the degenerate case. This is the consequence
> of allowing memory MSC to pretend to be L3 scoped MSC and so represented by the MB resource. This
> only happens when there is a single L3 and a single NUMA node with no caches in between so that the
> traffic at either end of the path is effectively equivalent and the scope for both is global as you
> can't turn off the last CPU or the only NUMA node. In want of a better term, let's call this "L3 is
> NUMA". These shenanigans are what lead to the complexity of having more that one MPAM class backing
> a resource which we discuss at [1]. The need for the association is that, where possible, the memory
> allocation and memory bandwidth counters are exposed to the user using the existing resctrl
> interface and, as such, existing software will continue to work.
> 
> What I was suggesting, is that in "native" mode we do away with any pretending. That is, memory MSC
> always back resources with NODE scope even in the degenerate "L3 is NUMA" case. One benefit of this
> is that the resctrl hierarchy can be more correct. I was about to write that a second benefit was
> that if there is a L3 cache MPAM class and a memory MPAM class which both provide memory allocation
> they could both be displayed in resctrl, MB and MB_NODE. The same consideration applies for memory
> bandwidth counters. However, as the MPAM driver in the "L3 is NUMA" case, always chooses the L3 MPAM
> class to back MB over other classes, the MPAM driver can just be extended to back MB_NODE with the
> memory class that was not chosen. In this way it will works the same way as in the non-degenerate
> cases and the same mechanism is in place for memory bandwidth counters.
> 
> Hence, the only benefit would be a slightly closer description of the hardware in resctrl in the "L3
> is NUMA" case. In performing this exercise of laying out my reasons for allowing the native/legacy
> control to move things across resources  I see it is unnecessary and so the native/legacy switch
> should, as per your proposal, *not* move controls between resources. Thank you for your patience.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/0b0eef2d-ce3b-48c8-af08-5889e7396e4f@arm.com/

If I understand correctly an "L3 is NUMA" would be presented to user space as:

info/
├── MB/
│   └── schemata/
│       ├── MB/
│       │   └── MB_L3_MAX/
│       └── MB_L3_MIN/
└── MB_NODE/
    └── schemata/
        ├── MB_NODE_MAX/
        └── MB_NODE_MIN/

with the "MB" resource backed by the "L3 cache MPAM class" and the "MB_NODE" resource backed
by the "memory MPAM class". Is this getting close?

It sounds to me as though both resources would be able to concurrently support monitoring so
resctrl can be expected to expose NODE scoped memory bandwidth monitoring events retrieved from
the "memory MPAM class" and L3 scoped memory bandwidth monitoring events retrieved from the
"L3 cache MPAM class"?

So far I've viewed support for monitoring events at different scope as "after multiple controls"
work that the "CPU-less NUMA nodes" depends on but looks like it is needed sooner.

>> I aimed to document how I understand the different scopes and how to communicate this to user space in: 
>> 	https://lore.kernel.org/lkml/bccb1249-e722-451a-9c75-8aa846713045@intel.com/
>>
>> Are you instead saying that MPAM plans to create a control that pretends to be for a node scoped resource
>> but placed under the L3 scoped resource like below?
>>
>> info/
>> └── MB/
>>     └── schemata/
>>         └── MB/
>>             └── MB_NODE_MAX/
>>
>> Something like above does not follow the relationships that the hierarchy aims to communicate, which
>> is that the resource has L3 scope.
> 
> No.. I wasn't thinking of that.
> 
>>
>> If you are already considering scenarios where user space would need new mount options, would you
>> perhaps consider instead some new command line parameter, similar to the existing "rdt=" ones that
>> adjust how resources are exposed? With something like this MPAM driver can control which "shape"
>> the system should have in resctrl.
> 
> 
> Luckily, we don't need these. Out of interest, why is that consider mount options the last resort?
In this case I asked about a command line parameter because I viewed the solution as needing MPAM driver to
change how it describes the "shape" of the system to resctrl. Since this is something that needs to happen
before resctrl fs is mounted a mount option did not seem practical to me. 

Speaking just in general about mount options I do think we need to take care how user space is expected
to interact with the filesystem. Previously user space could query /proc/cpuinfo to determine which
features are supported by the system and then mount resctrl fs based on that information. For example,
the user queries /proc/cpuinfo whether CDP is supported and then knows which CDP related mount options
can be used. New features no longer by default add flags to /proc/cpuinfo. The expectation is that
users can mount resctrl fs, discover which features are supported, and directly interact with those features.
Without knowing which features a system supports we should thus be careful that a new mount option does not
mean that the user needs to mount resctrl fs, query what is supported, and then remount resctrl fs with
mount options that enable the use of the new features. Please note that a mount fails when there is an
unrecognized mount option.

Reinette

