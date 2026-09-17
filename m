Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310694E73A8;
	Thu, 17 Sep 2026 15:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657657; cv=fail; b=SWznsSy+Ys05E3NQ+fRh273kTZm1BhTqpsc4VonKPjBIXXaXDuYaHArKmMaxwSjWa6Jwot2EJQMUj1uwlwMTx71TgiuDql7qsr1iG60dz8K7EWpxa6MApvYx/Mf1RQ8c/pUuatIQyuRzF4KCTQT28YKHifXRlTlt8+COpXnZ7ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657657; c=relaxed/simple;
	bh=AqdBWmJc6PKn2ajon+ElrUMakM8Qpv/FlDOiFvEqm4c=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=meOOQ4qYPGEbv8BiDNL/F+bwgPit/oFnCQ4Sn/xv0pRy4P5HUPY/yrVPXKv+l/23mKBsFTHq8OyrRJlFdZi+a8H87I7f145UAcGqjESeGZvjKJMP0AzGvxGEIPPUH5X08gPHo9t0hfa2svPXFZYcJ2N5xostOXHfew9RaHKQUwQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlxUPR90; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlxUPR90"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789657646; x=1821193646;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AqdBWmJc6PKn2ajon+ElrUMakM8Qpv/FlDOiFvEqm4c=;
  b=YlxUPR90r1vrfnqQ9eFaThHNvVYaSsV2isfuEcNQiuSuXAgKnuFNyG5X
   pAtKptwS4cwG78nw0gqjEfm9wq7j2SfdZU3H9Hyf9mm25+ci3ENf7kYX+
   /aG8SR2op5AFvGdEHFZQ0qgm1fg8/pkT1RaEpfJCbjuMCwIVA3ABiEnh4
   qkOTblNDQOaRktaX7qfmCwh3ys1lNGDFG8HyEZddehhlgDQ3Bg5+SjL3r
   T6SMz4alRp7Pl5mktW+khQjbBr/9XH+4TIO0xD91v05za4nhaUNeqCRB8
   fJ80L1L+KgTsOsz6K6aWw5p5oBMonfUW57hm3DfJFpXbBr83J+TgZYVQQ
   w==;
X-CSE-ConnectionGUID: /zvyoyF8QO6ZwFB8hwvr3w==
X-CSE-MsgGUID: QVJEkkrSQjy+LqlJ13/lkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100685358"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100685358"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:05:01 -0700
X-CSE-ConnectionGUID: O3nb1kpUSkejP4vnUdN/ZQ==
X-CSE-MsgGUID: 5aMJRiyPRFeoXsrHL9bOLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270172702"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 08:04:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:04:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 08:04:53 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.44)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:04:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSCIv5q+s52YVqyDKvRKBvX3yuNyfXjbUIGtrrwhONMi1NqxK9OeO58+R8/hUD+XZJ1mz09UedGYIyMxXasTtOKepzbIxQyZ1fW2oWGBeXhrXt9NUyAHvpqyAUf/H3Q2qdy5dN4CfGI0UIxe2YTFYNh+2ACCnxUPQNa8+OtDyKF5z2vj396ZPDbFpT2rODRorbkr5bDBPX1caGkXVIzsO2WafA6zZTmczsQh827s1ijWQF9VnXPFH7So5ouu8w3Pn8M7nYKqgdr7kaX/is03I7vMlQOjYL2/d5rqeQAQtQ18qhHBz2VDhqDeVoMJvSWBE68OdJYXUKqy7uzxqrqnuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ea9ViYeucIedZiDpxwDV6GhmgpWokkrufJOPwmNZF2k=;
 b=pBXBSeTGG23IPjYESqTo0xXJH9Qm3A++rKKEUFAgZmGwzV3qTwTrS4T3XO0xtITPsezpIH97EiBprp2elHVEX8mKhSOfsHw2RIWn7zrhu2ma2KK8YhRTX+2vsR5hqei4wnLdv/GPyhQw2u0Q0dDTwBVmzzBA8vcadjPa5U9nYU/A+IbaXop0K+3d9mRttfWjImqzvfiFH8NHFm2uE/olAMuSIkrPrnuqDfnsWh9Nrbs2owALeQoDt3t+w4wSUyAN90aknjrjlToOIp29IrByb7xsd02Pc2oa7XLRPKFRsaLmIm8duY0VMIxpdIkK4mmLeu24Uc19bklCJIPVvfShKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by LV2PR11MB237639.namprd11.prod.outlook.com (2603:10b6:408:412::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 15:04:49 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 15:04:48 +0000
Message-ID: <75120223-ed93-478d-924a-12507a1fb3c6@intel.com>
Date: Thu, 17 Sep 2026 08:04:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] x86/cpufeatures: Support Privilege Level Zero
 Association (PLZA)
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
 <1e7f4c3b0cb570f6e501a01d361745b180271f30.1787772750.git.babu.moger@amd.com>
 <0b4f2242-c22f-4557-99cc-ff622be9ee2c@intel.com>
 <d528fe23-3c1d-4eab-99ba-567983dd805d@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <d528fe23-3c1d-4eab-99ba-567983dd805d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|LV2PR11MB237639:EE_
X-MS-Office365-Filtering-Correlation-Id: c34ff1bd-b642-43fd-cb99-08df14cd0475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|56012099006|4143699003|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rj4tMptQI7M4yAIP7VFK6A2A8+IAlDnePfAlTvJAL3WJU8O8J8tVzF4ds2A0bq94nThXi5cnZk5lnL2/OKD2iooW87m3Y4cD3PSa+xyKJOqSgab1ExjXX+z/M/otasmOFFX74ZuoRRYYaA53YFEXF6WGVp1LaphpnxAe+7tH7LaOtHClzy8x7VvhBhWG/zjCU7j18+k8+HtIMqUymk4X1Y8h0aDD7ZqTj9Klp5XClbjfb4AAsxU0n9lbpyO5uiUE7MD6M4l+QNksdNJuTNVjDcF8MhUhabbeRjtmcq2aA6NdyCHLXIvSn182KbhFedLJ+5kYpkboXnPCiOCkzvXF87SozvperoFP0slD46bZQ+cY8fnMBanc6G15ZfvjS7FxrSYfALnbOrgfqubqAnk3qk58tfG8UXT0vUlrZYGylY5YP2sjUguRydUrKDFU90Fm8+hlb0V0hthEz7RNCaT1OGJyFhgoj9Dq1cvOP+5ORK3CTDD/sXAqIvxDPgAr9/uUaIXKUiKMV/X3K1L/1zGlQj/XR5XlWe51FzdJ4cZHA/a4M0e1steE9LfXp3XaWN5kY3U8G1rmp7W+d59Be8t6/nwRnB1AgpfcpOGO+Ov86qvd9G/3c4E1vKOE+Vmp2DtYQSYfTnmLVhG2mRrz4aYEaBr8jRedfrpCjeR8iUHPe3o=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(56012099006)(4143699003)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW0rTm9LQlJxZndWQzU5ZkNvbUNMZ1hYTS9IMThGcXpTZjdUbnFRSG12aVhR?=
 =?utf-8?B?MmRUQm55Wkd4Tjh3dDN5Y1ZUMVFoMy9FV1BoYXR2NDUrY3NQVGpzMWRkeXlQ?=
 =?utf-8?B?YTNPZzVLU0JwR0xJRVhKTENaUkV2R0RVRUt2UFZjbm9QczM5WXZrb2FCR01Z?=
 =?utf-8?B?Um9jQkNOYStnTGQxNlRPYlpuckY0c1JvK1Q4dlU5MFFuaE9zUTY1dGppNDJ3?=
 =?utf-8?B?bmcyaGgycFR5N3lPS1JPcGoxQndtblR4ZElQVlNobjRjYklLUzBxekU4QU1o?=
 =?utf-8?B?TnNBZmU5UnZVRUlmaXlRQ053WDJHUlpYWkpCR2Z2TjFHY3I5USs2KzBEcGVD?=
 =?utf-8?B?b01MV1JCZDF2THlmYWVPMlhLNDNhVzhHcmNIdkxreUtOeThEWTU5OXYxUDZO?=
 =?utf-8?B?aWlQc1BaTnN0WEViczZjYUZ6NGx2UlFsbUJTWWJrOU9BNUJZM0R2ZTJ5c2V4?=
 =?utf-8?B?amJYTUNpbmcvZzBkOWZ6SHBjMjdDS1FFdlVWd1Y3d0o3VE5SSTgwL0NseFZx?=
 =?utf-8?B?amRTbkxabnNzWnlPd29uZ05zbTcwckRyQUh3d21pNCtISzFhMzJHdG1jcXFE?=
 =?utf-8?B?SXNtMTVpYjRWTXF6SHQzYkxPTFJ6bitkZTB0MStaRkExUkpXaDNkN1M5bDFp?=
 =?utf-8?B?NTdIYUl0V2ZlNlB5d1h0L0R6V0t1cUFGMHcvUUQrTEdiUGJCZVVkSHhvaElL?=
 =?utf-8?B?RloxMWVielRaL1pUZllYMWR0NFBxQUZXR2JFWFZFRXladEFCSnlocXZ0VlJZ?=
 =?utf-8?B?RUEzV0pUeTBDaDV6bkFjV001WUVrMTBlRmNKZ3hpWUtwY1lPclpRVnB5Nmd3?=
 =?utf-8?B?WUtid1VlcEpaR0J0SisrUnBkV0V4WElraWkyUmMxV0dyNVAyeTgyTzNuRkp4?=
 =?utf-8?B?ejE5RDdPVk5ZMExDYjJHQWFrUmJ3TGVsZkE5UFZiVTdKTVhnb3FNNWRHaFVa?=
 =?utf-8?B?bzB4K0V3Y1dRYmcxY0xRQjV5NCs4TU93ZzNXNU5rNUVnQ2Y0S1JHZlMvSGc3?=
 =?utf-8?B?VktLVHNJYno4T0ZNMk5sYzhXdWcvRXNHOExNRlVYL0RhYm5SdG9qalJMWFd2?=
 =?utf-8?B?NVBDR1dpRmhlL3VBenoxTFloUkZzNmVMRzNZSFpJbmtLVVRkUy9TRzk4NDZh?=
 =?utf-8?B?TlBMUEJhalZGVG4vSVdscFN5cUxyazAyUHhzSFZQbVpkbVVaQ21tSFVQY21J?=
 =?utf-8?B?cnhyTkdrbGt6bGpxOE1ndTZmUDNJcDRvdEMwYWd1R3EyWGNmc3RNcTkyNG1M?=
 =?utf-8?B?emNicFFyL01QOFBDYWZNYXZPRUF3RXA3STduTFN2OVNTRmRUUzdPTGk4a01U?=
 =?utf-8?B?dTk5VDRvYVFtYmJld1JCalBEaDVyVUVLeHhCQTJJWStUU2xrSjdJYi9sOFR2?=
 =?utf-8?B?M2t0bTE1WXF4V21xU3JqQll2eE1iM0N2NUdJakc3M2RCUWZuV0wvVDZHeFk1?=
 =?utf-8?B?SHlCR0ZIMWMxamhlMm1jM2d5ZVdCSGZjM2dxcDVsTUxwVGNkcFF5czJLdWhC?=
 =?utf-8?B?S1JlS0hPQlR2a3dCcnAzdVp1c1VQaWJoNE9LK2xra1hjdXRsQWtlSkM2V001?=
 =?utf-8?B?TXl5NGx2M3hmdWZRTlczK1pLU2RtUEtUczE2dFFaeGM2RFR4TGdBS1RyZjd2?=
 =?utf-8?B?QkJSeVJwQkwxNUc0M3hpV01OanRMUkFlcHVkdUFNS2VXMXJRMzVjRmozbzdv?=
 =?utf-8?B?VmlDcWc5eTVHVC9FZXhYemU1OTZlRXdlZ3lET3V6ZG1rNjliVmFFZ211N3FS?=
 =?utf-8?B?N3pWK0ZGeDlBR29qQmt0NklwNzR2MWtxdW5XZkxRT2JBZGlOQlRVeXhaUGVE?=
 =?utf-8?B?dFA3MUtKNnpyb2YweGlHK01KUmU1TlZQZzFFU0l5MHhtMFg4YUNQMHBVdHV4?=
 =?utf-8?B?VWRMRlBoVzIyMkdxNkI0eDU4bFR0b2Jsb284MmMrU3BYeHBmRTVnTU56MVNp?=
 =?utf-8?B?SkVkaUJsQTRYOVJ5M00xZlZsdDkyd1V6eEljSi9NNHBTWVhXampMRkpBc2hB?=
 =?utf-8?B?YklOKzBNUWhMTVZuWEd4Y29CaU82ZzhWRkxndERza05jTmtQSHBhYXJveGww?=
 =?utf-8?B?OFVFTm92VTJUZXNkTDlpNExzL0xvRFYzbEREMHhyQTV4RXFnUTF3UFZSelBX?=
 =?utf-8?B?Tzk2eWRyN3BIa2IzanBDK055ZTlqZ1MyMG1lcG01SHJJcWVhMlRtSG5CZW9X?=
 =?utf-8?B?Q0ltVGFpZWUvcWtZQVBXNUU4MkF4NXB3Y0k0RkM5bXpreFN3NUdwTWtuS1JF?=
 =?utf-8?B?NTVvVStwbDFJYUpwMm5kU0RQRDZLdFVLZFBZeVpKVWN5b2p4MXFFd2pTRFVi?=
 =?utf-8?B?cDRRUWtKWU1PY20zNW5UZC9ESlR0QjNPdVc0S0VYR3BzcW9ockxnVy9YOFNN?=
 =?utf-8?Q?Vp4Sb6AlhxaFOuZA=3D?=
X-Exchange-RoutingPolicyChecked: Yht8v3FZ87wSfzD+FdE71Grqo2qNa5WXsrS1xsmxuhLpWD63YDjlZrLC3wKoV0t/j46XzqWMBGOgODNDUaEQAUQDrPsBBUcd+fxyjBqcAyJiTc9au4TuGldhGjnp+2RB8WJP+OaVdDf0+jgxd3mrPRFul6+tyuoGd5wlLRH/66fNyaMxzohMWs8+cq3M5A1la45e0e0dMolmKaqnJqAZm8W/JsMYQrxjU/EdxDC0I0q0BCKeVa7QizVaaEqz83O+FKl3lthpu2TaEw3auBwiNSVr67STsvcYeH836vKgX67cfAsbiz7ZHEl/St4FLPZs77spHAW6JZUkSPYUFgCiAA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c34ff1bd-b642-43fd-cb99-08df14cd0475
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:04:48.8726
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qvMqFT54k5URlaXcz4jco8+YzQlFinRDHEO+W3gHFOZqyzpPgn8w4Y1VMjPQmqmP08opHCoMdKM482UPQjfe5Qs8z/s+vkIG+qPV/LYVuJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB237639
X-OriginatorOrg: intel.com

Hi Babu,

On 9/16/26 1:45 PM, Babu Moger wrote:
> On 9/16/26 00:12, Reinette Chatre wrote:
>> On 8/26/26 12:32 PM, Babu Moger wrote:


...

> 
>>
>>>
>>> PLZA also applies to cache allocation and monitoring features and provides
>>> flexibility to manage allocation and monitoring associations independently.
>>
>> This reads like an afterthought. Are users expected to use cache allocation
>> while PLZA is enabled? Since only one resource group can be assigned I expect
>> there to be quite a few sharp corners when both are in use. Kernel work done
>> on behalf of high as well as low priority work will use the same cache allocations
>> and thus neither could actually get full benefit from having dedicated cache
>> portions?
> 
> The best-known use case today is to leave both cache allocation and
> memory bandwidth allocation at their default (maximum) settings and
> enable PLZA on all CPUs.

Interesting. This sounds like all kernel work can access the entire cache
and thus evict data from any user space tasks that may have used cache allocation
to avoid interference.

> 
> Users can, however, configure both cache allocation and memory bandwidth limits. In those cases, there can be corner-case behaviors and trade-offs.
> 
> If you think the current wording is misleading, I can drop that text and rephrase it along these lines to include both cache and memory.

No, the wording is not misleading. The description just focuses on memory bandwidth
allocation leaving impression that the feature only applies to that resource when it
applies to all resources.

> 
> "When cache and/or memory bandwidth associated with a CLOSID is
> aggressively throttled, and a task with that CLOSID moves into
> kernel mode, the kernel operations are also aggressively throttled.
> This can stall forward progress and eventually degrade overall
> system performance.
> 
> AMD hardware supports the Privilege Level Zero Association (PLZA)
> feature, which allows the CPU's CLOSID and/or RMID association to be
> changed during transitions from user mode to kernel mode. This
> enables the kernel to run with a different CLOSID and/or RMID than
> user space, improving system performance and/or allowing kernel work
> to be monitored separately."> 

I think what you have for memory bandwidth sounds good. I do not think
the cache allocation and memory bandwidth usage descriptions should be
mixed since the implications are so different. Could you please just
add a snippet that highlights since the feature assigns CLOSID/RMID to
kernel work it influences allocation and monitoring of all resources,
not just memory bandwidth?

Reinette

