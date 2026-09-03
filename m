Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD2B42A154;
	Thu,  3 Sep 2026 11:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433271; cv=fail; b=Ib11mue/50mc5/ArlC3ZsqJcNXnJW38pO4313jUwBojlNJthzg0j6TpTDemp6z1q7dWnWqq5ORRZSbyGOfQrYyQw+d5Tx5/ndcdZ7OdwwkskvlKKAcMgBnW0FZJ2e+uMiQIoMDz8w4sMNxuXmhJ0w7zEmQ0E9ZFYNXi7oJkDPYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433271; c=relaxed/simple;
	bh=08JIu0XRXv8SrrjucGWPyzL0zTFf3DW45zDM/kQp4xQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=phv01dP0FNjR4W8LSPdeDg5y/gxDi8o9PzDBTs23a3Mjw/PwDL4qtp5QFq555R6tv1RudSPWeIH/0TNvNZBSfgamjC7Qc2U9Vm5B32vKQIMw2nxCi6Uq6kKNneA27HnZ39SLGykN/teIhdHRwpcJjJXnQpoHS7QplFi1EtO/EF4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZ+uHNRV; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZ+uHNRV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788433269; x=1819969269;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=08JIu0XRXv8SrrjucGWPyzL0zTFf3DW45zDM/kQp4xQ=;
  b=QZ+uHNRVATK5YI35rTKHwlloIMpsMg/JuXQtNGEcyc9z/msaHF0Q/6XG
   IyWeXGlV7IVLSxftCaE1yPKQCFujMKnEf+L/qBhRza1QKI7D2CX/GK4Si
   lZEUYcYw1aGW0ZL+fIeAJ6mcVfKT37LBE++srkQge56JfZHqdxnsZupge
   UDFESHBJsjPN6cYvWeGmaoRzC978tzIJPZY7R58itJoMv29LlSKBTS1EA
   /x6a9tgN363kyD0FqenZ2fX0wqrv0HBQ385UjvLc1Ccg6SX3FCgVegATd
   poroKmREKe1+h3VfbMzzaS4MhAKgOmE2+b8avW6DPVjiwnmQ7VLZ73MvM
   g==;
X-CSE-ConnectionGUID: L9nagRNFTROlc1kHLRBj1w==
X-CSE-MsgGUID: U/gE2dCMQxS+F4Uqwwy/vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89033162"
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="89033162"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:01:08 -0700
X-CSE-ConnectionGUID: qspXhw6YSOK/SVKoyamO6w==
X-CSE-MsgGUID: WW0ZpeTRROqz78mvn2c1lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,259,1779174000"; 
   d="scan'208";a="273205772"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 04:01:07 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 04:01:06 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 3 Sep 2026 04:01:06 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 3 Sep 2026 04:01:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voP9H8rKD24ASf9HY+p0Ep920bYaVfszKDSHKFBfXfM3NW3vNT3L1edgMC8vXK/dtpB2dZN21gVDWos7Zj9a76ls2/lB8DSL+T6oqUMXC713/eaNSfFuBUq2uKqkF6s6/YzcIUaWYqolVK4PhjWRFNgx0KNmSjAs4WzIp2kLpOUNBwHpYNsjc8teP4aI/5ApXaTiRBBv1znzc6eopf3Aw7/ZDo/g4uDxGzuUCc6Hnm4sq8K1vcoVsotI72XgbpZayMJ4uzA/tOEXkv6P7qsf/v9C6sTNE0XS9t6BPVnvnZpuZJG8a/yTuJ9v3Fg4/Hku9AL6Yd8QCM833UQ9rld+SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utDHZsHt1UNw/meovJe59g8MjA70P2RUm5bcZet6Y2A=;
 b=VC8grKThA+v9oqvXs/ZTCEhOCkNblzIUHpTuiGIfG3hqwT2dKwU+wJRGr6aWKvgiqPi/GRZg38LjSG4GDHXyLECptcKQsXuHQ6OYCRgqTivt7HtQTta2OdQujVFkqmMP80u5DN+UEaxZRiqDBcQfscDG703l433Gk3riM/e6T+/F+Jy78SEipjd+glldyRYUeCYr5mX8Ml0p7LV8S/3+/WqfDLbCuhFH56Cy3Mna77De61K1a5w/52tt71E7GcpNEgftlBGMeyZdc9q+GKs5ZZvXASNdGf47+pPRVPjSTc65v+CmGGlYctEq1Vbo2DXQC0yWwwIMRdQxjltjhuF0Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by DM4PR11MB7278.namprd11.prod.outlook.com (2603:10b6:8:10a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 11:01:04 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Thu, 3 Sep 2026
 11:01:04 +0000
Message-ID: <63c61f29-5db7-4e90-8565-3d6c8a6d57b5@intel.com>
Date: Thu, 3 Sep 2026 13:00:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux
 disable path
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shunli Wang <shunli.wang@mediatek.com>,
	<cassiogabrielcontato@gmail.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
 <20260903045203.175337-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260903045203.175337-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0174.eurprd04.prod.outlook.com
 (2603:10a6:20b:331::29) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|DM4PR11MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: 66b3fda0-8817-4f05-f264-08df09aaa5ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|10067099003|11063799006|5023799004|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ISIdQJovZWiuB87MCIbPcSPvQdjBZW4ZmYcodHGZ2HRUUIQxJlTf1Pjsto8MfVA0AgntDlOYuKI/KtVdqQNQX0UJKse8+En8T6FHg2oMyjZTBvfW9ZmLG72EtPc56tX9SIlRAK1cw/eTksROsGDN5bATbSydxUgEiadXhcBeHDIk7Awr5cJNReK5uXn6tzE2VjDxrPi4k6gytGeCLE54czTwaax9bzbI0Nitd0Il+GgMIeBSgmQSyaVRv7bv/7Xh5ZixPnwJpCaB3En9mfEz5Boeg7g6L8tcAdWLb51fQZpHPplJMlCq8aRSweuDLFIMKmUyU+/R6Y54c2ebBdIpr53XMN9zoNOWmfc13gxTAg9aWVXdwN1Gry18HYh/1KliDoFXjXNgYeNDQfzliJJ14HX/81kw+YnxjwjBb4XDjba63TKtjxNuokzjun5N/gPNqR7kiSqH6ISwm8u2YFZSxsVdl+UrzZOCdUh5DhJNf3mwwV/Vvz5HwidfnoIL1MV8kb9kIs4kPzjf45M1qwrPkq0NKN86DuJ659szT4uhJzG685+GDXCwkbndATClSLR1//E3y3X+WRBgnmZkCZ0P6Q0+mC9XoOUpLIoFMba/vziKNUhzWmWoc7BiUcZM1QteG0r/oBrCnGKQw4V2AS/Dv53m2WeSkrkQ5yUE8L/Atwo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(10067099003)(11063799006)(5023799004)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGZkMlE5Wm85VTVKcktyb2Z4RGdJdHdvdzJ4OTVSaXE3ODQ3dkg4NFhzVHJJ?=
 =?utf-8?B?dXh2a1k2eWVucSt0STA2cnFYWGNCbnI1cDUzRWFXNlVIRGIrQkpOUXRTR0I2?=
 =?utf-8?B?Y1hRWUZtT3ZFOFZJbHZ3Y0RwNHNOVXo4TFd0U3dTdG1WdGl1VzhYNUZLUFlG?=
 =?utf-8?B?Vm1XRnNSQ0FZL3diN0NGb29kbUFFNjhHajV6L2J3ZUpqRUQ2U2JCM0tyaXdS?=
 =?utf-8?B?SDZMZjFwSXJzSGZLQ3doc2FHaEJnd1VxZG9qN2k3aGdxWVpTY3FQbW1XZGZU?=
 =?utf-8?B?YmlOUkltR1JpMzAvbkNEazNoayt5OE55bjNiN3JMMURyMXFQMTNiRi82eXVR?=
 =?utf-8?B?eTlLbEx6U2k4bDljTlJJOVcxYlprdUZpSEFGOXloL3Q2aEJERnppbkdlREhr?=
 =?utf-8?B?M0tZT0FXV0w5Z2RVTm1uMVJoNHhHdVZZT1lDQlZIa05FVE1QU2h4ZlFRaGht?=
 =?utf-8?B?eElCVUlqa3pNWWF0VXdIZmN6RGgwNW1pc0xGdnp6alJRU3pqeWVldS8zbXR0?=
 =?utf-8?B?N2dIWDRQYWFiRzlYeDFvRlJFd1Jrb0lCcUF0U3ZXalFVT0tWK1Z4NnVZNHAy?=
 =?utf-8?B?bktoajVnc3h1Z1l2NS9nRkwzSXRmNkNvNzJSWkxCbHJDUlpLS1QrZmxWRkYz?=
 =?utf-8?B?aldaQ2d2TVZTUHJScVg5S0pjcnk2dGhUcUt1NmgyNlF3dzUrSy9BNDZYT1dm?=
 =?utf-8?B?ZGdRbDU5bTdaUktLRkRidEk5b0gvQ293eUdtSW8za1FES0JnUEs5WXFaZksv?=
 =?utf-8?B?UzRRc2Y2QlNyMnRzajR3S3lBRG9UNDBoMmNudUxCZ2ZTZ3ZMYlVFemtGa202?=
 =?utf-8?B?d0Y4czJhWXJsTlpTTXZ6VGx0UCs0Z2cyOFdUV2VJdU9zZWR3QWFCN2E3SU02?=
 =?utf-8?B?bzRBU3l2TUtJeW9kd2EzRXpDT1BDVXRIZEk4a01xN29ra0ZJZUc3MmZJVita?=
 =?utf-8?B?OWFVNWN5bUNkSWw1cHNIb2xReXo2R2lVVTcwQzB1VTRqNDFSWkd0d0dBSVFw?=
 =?utf-8?B?T1c0YnIxQkswUXdmQVFVWWFjdC9rZ3RuaE9hRFY0WThTclZGb1ZVeUQwTmtY?=
 =?utf-8?B?Q0pvRXBlamtMNC9pL0dneDJPNXFubFpHUjFGSGZqanYxc3dwZXp1N3BsejNx?=
 =?utf-8?B?d1FTcWJ6REYrdnM2V2JWdkxFMk9ZL1N0eUkwdkVrSzdIVVRwcXNvWVVpNXpV?=
 =?utf-8?B?eUdHTW9BenpLelE2aFdhVTFaNlhsY2hDZUtlUy9NZFJvcVgxaGR0Znp5NWNj?=
 =?utf-8?B?eVhjcm5aSVhmOVJ3a3prRGNHWVg5Wjk5bWY4TTdrSzA4a2IwUnZ0WDNDeDI1?=
 =?utf-8?B?cE5jT1RiVVFvd2c3ZWFidVZKYm8vZFFqeUZiUVMyMWtFUkN5Rk1La3Rwamha?=
 =?utf-8?B?V2lKZGNNaGI4d2J5RVlDYW1odDVvWjA3dXJ1Z3dCbmxkS0NkRVk5S3hJVklI?=
 =?utf-8?B?elpTU3hJWkI5ZE4yMFJ0SmptRE90UjR5VmtiM2VkdnZQNHcxUnA4cThZc09l?=
 =?utf-8?B?MzZxM1ovZS91NStjVmI5dGRTd2drRllUSmRNUC9CQ3hjaEE2UnpPZGtzWkRF?=
 =?utf-8?B?SzZYVElJL2Q3K1VCK045SUtBR0pPRUNEaStJQ2JpTU9WbS9LZUJuVVBLWDFh?=
 =?utf-8?B?OXBGTFF0Q3ZZUTR5LzF6Zk9iZnVoZVJnVVA1VisyZVM5aDZId3A4eTJOMGkv?=
 =?utf-8?B?ZXNmVWxQL052cGNBRnplOFZrTXY1TU9ldUFBSXNiLzUvbTRjL0tVamsyME5M?=
 =?utf-8?B?cTNLUWlYRS9vSjFaMVNycXlRbkFqY2pOK3ZvOElkbHE0SVVNMWlkbXF6K2Jt?=
 =?utf-8?B?MDNnV2IydFlsSFF0aXlkck91YkhNQ2VzZVJhUVVZeVNwbVFLdFBhbkdPSFBw?=
 =?utf-8?B?TnJ5OVI5bjExZ1V0ZUtQcVFoN2FzdkRDbFZwVUMxczJTWUdITGdXTllzVnBi?=
 =?utf-8?B?TElKTmg3THBmWFduSGhYMlE2U29Zb0pINEk3eTZjSFBXWHZ4QkZlNVNqVmw5?=
 =?utf-8?B?cEUxVjV6L3piYWwyeEVFVUdRTVhIVVdkQXJEVldVSTNLZFVUUjBDS2YvQUpS?=
 =?utf-8?B?QnN3ZlgzN0ZLRlBvdjNkYmV5YnpBaFRUZEV6R1h6QTVpVXNSMEJEY2d2bFp2?=
 =?utf-8?B?OFcrZWNOYU5sMHlZMUoxa1NQR0hqME1jU1paWlEvWG9Rd3hxVHEwZGZTNng4?=
 =?utf-8?B?MVcxTnpyVmlhN3lkdDI4Um5PTjFaSEJDZE1DTnFUSzIxNmZDazV4bTJzLzFR?=
 =?utf-8?B?cXJrZlM3dk5kM1QyZ25JNjlWNlFIYWREdDVzNnNaa2tjMnJTdWh3YjRxZUFi?=
 =?utf-8?B?N0RXekdCVHU5akdOY2Fsc283cTBBV2xSMDMxT0tkK20vL0c5SCtBb3c2OUl2?=
 =?utf-8?Q?lYR/FiaDjCPEHI5A=3D?=
X-Exchange-RoutingPolicyChecked: PgUyL9Vu+qQxv4YxtrkO2xluRjCswqggXEoonHLtz59xZDvpcrgaaY90V+KPuFuI4BwqeAsQCllQeSQUkCDHsaD7N4MnxCKB2xLD8Eyt4wiYzRnO0EJ/gxoD5kIy/brg9xKRuANnIC6uXjwxrMyPe715gk3H1IsIYt4Vxa3dBznUVwmBK9tKJZulLrfl8f6HxjNX4bR9ZKw1dL4CWFJi9l1DLW76o1e1jgXe5wK0NTnAlNwaNBigX434oTtGPU3jrrfYfVOJB2Wv5VWdrNiscA9I0zohZSZqxLdk17t0gWyvJN2oqbivnnY8jpxagDPjyu5/xq4rKxbsBnXsM69qFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 66b3fda0-8817-4f05-f264-08df09aaa5ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 11:01:04.3856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xEzN2Di7jrDBsj25MWrtERxnbLilGE+KkWdljo1LOD3CxeIFDL7u3/ZoK15ghbugkbTfLU81EINEXUZYvubb2FFEiJ5jQWuSm2QxJZqNKck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7278
X-OriginatorOrg: intel.com

On 9/3/2026 6:52 AM, phucduc.bui@gmail.com wrote:

> Changes in v4:
>  - In the mux disable path, remove the goto labels so that all teardown
>    steps are attempted and any errors are only reported.
> 
>  sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 6 ------
>  1 file changed, 6 deletions(-)

> @@ -271,7 +271,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
>  			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
>  				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
>  				aud_clks[CLK_CLK26M], ret);
> -			goto EXIT;
>  		}
>  		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
>  
> @@ -281,7 +280,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
>  			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
>  				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
>  				aud_clks[CLK_CLK26M], ret);
> -			goto EXIT;
>  		}
>  		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
>  	}
> @@ -298,7 +296,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
>  		       afe_priv->clk[CLK_CLK26M]);
>  	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
>  ERR_ENABLE_CLK_TOP_MUX_AUD_1:
> -EXIT:
>  	return ret;
>  }
When looking at this again, I'd probably refactor the whole thing so we
have a permissive teardown path but still propagate the error code in
case there is a caller who does care about the result of the disable
scenario.  Alas, nothing in this file ever checks the results of
apll1/2_mux_setting() so the callers needed an update too.  Well, let's
just say that's a tale for a separate patchset..


TLDR: the patch is still an improvement and the (possible) refactor is a
outside of its scope.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>


