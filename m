Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536542EDD58;
	Mon, 31 Aug 2026 09:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169568; cv=fail; b=aA33Fiy+ae/hqD2YUH81OvvRlY9xxXTF0yaAgjCSEmg650ekSK28AmDJy/sMNkVqL+6gdys5GB9ixba2VoWpZocbyueoPMOExFf4P5Rojsyxpyk+sBpkqgpr9MKD2Ep9bWuu8GvOg5WwQlT1hU4xiGks549jVAdUGabqiC4sqTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169568; c=relaxed/simple;
	bh=gJAqsWhvLFw0j3xZ5ESofqUjL9+v6ksxg98JKhBVDVk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Bfg9PcfmVUEo1kyN2VsY0vnXcdaG1BWCRIG76G2/YYowECpHyAskM4m0prFS7IJdh/JYZI/IEKG/mvh28c/91U2YpnA4NjW3BYrVuIuZjJYXCHpvublTMgdCRON4LztsQbGw+D6N4WTpadGLyad1ausQOXY3yHqeWZp1SLHoTtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNXiQYoB; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNXiQYoB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169568; x=1819705568;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gJAqsWhvLFw0j3xZ5ESofqUjL9+v6ksxg98JKhBVDVk=;
  b=kNXiQYoB8K91csjTv8NsLy0fWH7D6K2L8eiNVZksTkDWDrwnGvTSRFvH
   3X7vDUiIoWrQhjfe3hYPRVG+0xlQnyl2qD7fKTv8BKYOlppz8B3PSztTI
   jKTewobwPoRQvUgRqlSPZAYCP52Zc7kjS7QtQinVvtO3q2iRi04zCfjof
   P5lN0MYQPpH9Jx+XGN1/eYV40cVazu8xWn9NizHrVAbn133ArRkU97NYv
   cGmkBqMPondppHsIYYwZVjTYV2RiWsZwvhqeycb9cv4ayNTVqxBu6MVvm
   EH5tZz5r3VdFZrgh/CsOjQfeMVNmWiXFGRMwcxLe0lAxBaKochovy1o+D
   g==;
X-CSE-ConnectionGUID: AkCvUfkaSmOhZrTIDc++fA==
X-CSE-MsgGUID: uoK/svrLQUenATr8AHp06g==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92437887"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92437887"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:46:00 -0700
X-CSE-ConnectionGUID: dNF8gi91Q0iVmd4IPAdf3A==
X-CSE-MsgGUID: JLodLumpSnqTEPbMsY5dVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="270677853"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:45:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:45:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 02:45:58 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.49) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:45:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g4lTw2Ezu4elMbYUVg+pWVmRD7NxRCvZNYLwqwxUr/3b5nC1Nz3Kqz4eqocv3rXS8OSbjUFDfAM/T39rI/Dx11lQQ4xuFAThXxhFBasuG9YiuH6kOhvK9gZCz9iZqMyB6C0g2860UG2EscjONvbr1TdMt9nx+ZARm0yCFDTzPP/HcGUaL2FekCeMrGRczNv8ztRodGMTJORx8FLmZErs1DakZujs4w5IbP1yS/2gMDqiMUFTP0tpKmPX/GoCvNL+ZhZR/ski1z5PG7u4Y+5+2+nILgScdM9AlQCPytfLDKoWy8P2VBf6NjYGyfOKhqa1Jm33daVeAKI7pACUo2wETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HYIRzrH136TZUtrPBoXDo/3AvIjluitWPYJppDNoEKA=;
 b=cUgymGBpgDSXb1BXAUye8Hf6hSIC/FI3QAg6pRwse0mMSI05yGoBG2zekf/nwityjNw0RC6gsVSVZW6LSoiWCflUoUBXvFR0+k9KvwliFqlwrCk+xfsuSdorvBEh9VoVwTp3pOrjTbZODxVvQ2OOfrIgg1FEJ+BuRDHgYquNGSaQgb0dS8k10NR249R1vvdlJ0+FiG6grledAinCiGFQ/hr9pkzqDjzuzzRzqpm+ZV/STXYQ1Fz901lDXHN0tM/FqcGsaOCqiuepdoElLuSRSdxfUFaulOvC47enUTXlrwtIRPza7cJHNl9U2MRde+ESkf3BTNJtGqA/nsHC6BSkcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CHXPR11MB9625.namprd11.prod.outlook.com (2603:10b6:610:2fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:45:54 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:45:54 +0000
Message-ID: <12a20880-3531-4553-bc7a-b68a79ca46b7@intel.com>
Date: Mon, 31 Aug 2026 11:45:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] ASoC: mediatek: mt8183: Fix APLL enable error
 handling
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
 <20260828050526.590761-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260828050526.590761-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF00000916.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::935) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CHXPR11MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: 93f84861-6365-4c2c-07a6-08df0744a6a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|6133799003|22082099003|56012099006|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: sWhg/VEOsRZYalFZ/J5IdeLbRz5yM3j/P+MroQmU50/1Co6OZ6n8aZghHZOW4U1kefSt64y7ix26zZvBGwk7araqqlx3Kni6lEqBK2XZTR2PJRtB0xWqeF1WAajLGNYd/lEPqNs1368E78YOziRVphnphVciPjSl+VnZy2GDvtK9VOtLFvfRaPrIBv3ffJ2k2ZmAYcqbYFD7ydjVrI82GO3JhGu8Ipc5VDgT9/ntEhOSQ6Ac4yEv0+wijuPZ6cvFXsV0UFX66R60YCW00WMJZ5l34phPzRvqS6Bp1ECM6tMnis5/fYls5qkV0AOWcBunqwmaZlolIsqIZhGvhq4uE7I4Aq614uvhrgHZFsymY84dm5z55H78s/sHebcIQcDWNikpBWIoSKx9wX4630XcxkkqNUYvjy7vYgfGJz/eBHTc5iINAhd6ADFWAXDXGPYnYhLVAZh/AU2HRh83fNuOMnK7s7Mc7tkA1N8wJrHuiF10pGYxtB5A3dbd3fBa96tMOWwvyVHCHYTezNgUBKKQEamco8GDpk5JaE2/VyJ9G/qJctkPuK8XNcgyiCJVcVkBiLTMAO4I1XykdxGcCvfbGzHoeb8OrnJMx3rYbnGjKrGtV2KfeTxRU8MzYESvExxDcQ4IoRswzzyisifqN3sTMFUzMztTklnCaC/hwNd3K0g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(6133799003)(22082099003)(56012099006)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUVuSXBBbkliUTRTVzdRYU12NVZpZ1lvaTk2RFRBZW41MzZyMlVxTERQcTcr?=
 =?utf-8?B?anYvOWpJMGgwcldNYUdXMlBtbkhkN1NuWlBONDI5enlsTGtsZkVnYXhiMnpV?=
 =?utf-8?B?M1lyVU9LTG9TUmI3bU1OWms2azh0c2FqVmVNbzlsWnNtK3lCZTR1ZTZvckdx?=
 =?utf-8?B?Qlc0RXFTUGFNNi9ZczcydE8rMVhPdEFrUjRqN3V6akc0a2Vma3Z1YjRPdUJO?=
 =?utf-8?B?VXdTdVdXaUloMzQ4VjhoRTRtSlZtelJ2RjhKRllmMjlLUVlXNzNrVnJnWS85?=
 =?utf-8?B?Y1hkZWt0R2RjYWVmOFNFMjUzeS81bG1OSlNuczFVRFNmK1VQRVFEdlJZMkxN?=
 =?utf-8?B?R3AxZ2dPdXN3cXJBZEdmZWREYWlnRXZRRVJMN2l5ZjZOWU9VZU13bUpkY2RO?=
 =?utf-8?B?QXV6V3BDcS9FZ0xhMEhYTWJLc3lkcXBEa0lScFFWaEx4Z0I3bGliZVFDZS91?=
 =?utf-8?B?TFVjZlQwWno5dGNnMVl6Nk9SS2k3QVhhQXk2UitVMlZoRzg5L0wzbWp1UGUw?=
 =?utf-8?B?eGowek5XSnlpTHBGSkJiOEJZc3ovK3o1SVhiL25aVjdBWVNaaGdEc0J0Y00w?=
 =?utf-8?B?QjIwSXlzRUduRDhnRFVhdFFLTnJtVXRTN1hCQlVMVWc4OHE0dXZacmF5QXU1?=
 =?utf-8?B?VHdJMzJOdm9JVEhjcUg5SnlRREp3eHZGR0JldFhKbWNvMkRoY2tQWnB5R2Ev?=
 =?utf-8?B?Z0VRWUVmMmFRQ2oralFZRjd0aXMrTU9vdmN2MXhMMEx5VElkbWlPakFyb3NT?=
 =?utf-8?B?cWcyVjExdkpoS0p1Tm5rZ2NubThVcTBWS3h0c0IrN01rbzBMUUVnaVNPRTNZ?=
 =?utf-8?B?WU9CS2NPczhrMTlZTTlVWFBPZ3didStDcGFwdUxFS1BPajZ0UnVJd0pUQTF5?=
 =?utf-8?B?Q0pUTm9qY1dWZisrcDFOMjJKL3Nma2pZWVQyVFh0Y2RZVUVlZjMwQjZsQ21Q?=
 =?utf-8?B?bTRETVlMNjRpeVF0Z1dlNWxSb3lCZThEeW54SzJxZzdndWZkK0tUYmNLeVda?=
 =?utf-8?B?TE43TlNLaXVqcU1UeWV4eC9FVHltMHpKU1dSaUgreFlpQXhkVUpTSDlpQ0dB?=
 =?utf-8?B?bVk3K3FuRkRPWGZ4OG5MVStiZkdSZ1ozdjBWYTRydTI5ZU11RmhPSWVPSndu?=
 =?utf-8?B?QkxmakN2R2ROSG9YWU5JTDF3N2huME5pZ0x2b0o0MGd3VExVSGpNWmRZVVl1?=
 =?utf-8?B?anlZTWtSaUFqSEpGSXlzTUJ3REl1aGhvdERnQnNvTXZNcm8wYm1vNmtEbXVQ?=
 =?utf-8?B?Qmtoc1NYSjZyOVBZWGtXQW5FWU83YXl5UmcwajZvYWcycDZKQ0txczB4ZXpj?=
 =?utf-8?B?VkJoMG0vZW5SK3hNclgzcDlEc2tubkJWVEt5Z1ZpWXFEYmRpUkJnVjcwS3pK?=
 =?utf-8?B?Ulg0VXd0YnM1dk9ER282dWlSTDl5Sm5aam1pSEk4Q0RrNUx0NjVvUjRjdmUv?=
 =?utf-8?B?VU8wZTRlUy8xMEljd1dlUVFUWGlQaWZROWw2RlhqT2ZEN2hXaGViOXhUZWUw?=
 =?utf-8?B?UmVsdERTQTE1WWdObG5HZ0ZKS29IRDdQQy9aV1o0M0p2WG4rQ0t6N05KNSt4?=
 =?utf-8?B?MHNXQ2grODZ4MUs1VFRnN2MvTTdaL2F2L3dxZ3dVbnNkdHVUTGdLLzNpT2JT?=
 =?utf-8?B?SmVZdHNVeE50L1VRM1FSbWwxUDV1Z3BIaEdsNGdjQWtmTDFDbWNORHpQT2ZQ?=
 =?utf-8?B?blpPYUJPWjV1akpDVXhWUmhySTJ0SWJQTU9MaS9CRTBTbThTMU5Ta1F2cFBV?=
 =?utf-8?B?TW1venE0b3pUUHZ4K2g0NzNYK0N0TXpvRzM0UUh4MklldUNUd2dRQTBUNFRC?=
 =?utf-8?B?eUo0ZjNoeENWUW5MNXcyQkNJMk9MRUozdTFvMVdhVG1qaHQwNjd5MHFEMlNk?=
 =?utf-8?B?YlFvQjRjS0RiOHVlSXpIMWRDWmlLWmp1NUVsbHMvOXRndnFXTXo5Uk9TWjcw?=
 =?utf-8?B?V0tybkQzb0NzSTNFZUFUQUtIeW83TlR3QktQNGpGcTUyM1VTcW5tT1QrWVQr?=
 =?utf-8?B?aTRJUnpHbWhzakZ2c1BqZHc0RjNFS1I5MG9uUWpRRm5IK1F6OWJ2cjVZMDE3?=
 =?utf-8?B?ZEs0Wk1oOXhWbWE2RmdVcVUyVFFkUzJiYUFtZGlmVTFRc0tkZHk0NjBwMWdi?=
 =?utf-8?B?VzlKaEErVEVjQjdCNHNLNEdHcS84MXBDUnRmL1NGeTZDOS9oaUVXUjQ1MzE2?=
 =?utf-8?B?bWVtd2FTc21vbjVLQUlPUFpMNWt2SXlac0ZXbDhtb09ISzRzVUx2dm45V3Yv?=
 =?utf-8?B?cXVaWk95bGhqTHVlenlDUldNcWx1MFozWnBzeTJKV296RUUrdlc4WU5HQnJy?=
 =?utf-8?B?Q0MzVHRNZ0s2UVRONThGZllOeks5a01ObEZiRDk4QWNFRW1zQWdlVTFtYUY0?=
 =?utf-8?Q?EJo1N3TdvWp6L58k=3D?=
X-Exchange-RoutingPolicyChecked: AQRtA2fbAXVkY3IEeEF9HMgKCyd5sS3XpwXuaYVMR5KFSpTnKvYEtl04wSnlMzquDS/3nwrr1IiSxCf0+Et+5yDyaDx5wuszc+oZ/co5QTr+VEtV1SPRKLR9Py2gGnXrxMdxN7kRy1UwzPaB8H/Wupv1RuB2v9COolsTrZ3CGu24AXp0/yc4//JESIOVbE1lZbjXV4QcM4G+WLR3FlVgkxt64mGtYHphbT+iUMRnNfk0ptwNbJQNeAEdeVB5Ix/twHej1tS5W72PsdbpOvPCVnKePOnf+LzZjDeU7Qdw4Dqcvs70Io0oF7tpWfw9twKbdJF3t+5smUaDvrnu4qsypA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 93f84861-6365-4c2c-07a6-08df0744a6a2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:45:54.6824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyrPo1/TjVcxvYGAQz84WKsnrJ/mnpdLClayrHld3lKc19jiL1rl+lhCr0LpYL7MmMkEMjj0J3gwRHgpMsxerlVndCNrxWD8vWyCf2xivMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9625
X-OriginatorOrg: intel.com

On 8/28/2026 7:05 AM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
> but do not check its return value to handle failures.
> 
> In addition, the cleanup paths of mt8183_apll*_enable() do not call
> mux_setting(afe, false) when the enable operation fails, while the
> mt8183_apll*_disable() functions do.
> 
> Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
> in the cleanup paths when mt8183_apll*_enable() fails.
> 
> Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
