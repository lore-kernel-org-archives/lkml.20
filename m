Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80BC53DEFF0;
	Mon, 31 Aug 2026 09:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169468; cv=fail; b=a8VLPgf6MvW7gUF85IwGSEesUgvpqfYguvd/gZrT+ka6roSy+kCh2MibVpHZuadQC2M9yFw5bVXtcMJLSchsc1S5R3RXEAA4guVTm4SgsG4BZqTFVQgJTQabKDazZxrqiPmVeAlvaWQb0SCYNwryzV9FOw/YN5XCaWR7I29Lj2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169468; c=relaxed/simple;
	bh=egmqcQoDrpBR12xWvuVFuVOgxZloyDOiMwuFVRKVJqY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ssiGMIpcSrpDuKXZsnP8It16qJXssjCa6+SbflLa0qAIZicR/DFudG6m7bLQMdg2AqmrnuH0SQmb1PQAJ1rlaywcW6VyoD0bKQBvuf9JjCd2u080bX4XRn6+okwjUzorRJngJhFAXJZs253eYgC6+UmLUn/fCpa0K62jpiyX8eI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BobYzbO6; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BobYzbO6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788169467; x=1819705467;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=egmqcQoDrpBR12xWvuVFuVOgxZloyDOiMwuFVRKVJqY=;
  b=BobYzbO6xNTFF6/JFJxevI3OOYgJpGfEuYZwqwt2PvX2qiGhcdR5nfqx
   iqAoBZssyrFIZ/NrZVlPVFZsYun1ipW8ZFTd/O9ElC8RFhFn86/PixSxM
   NKx1Hqc8f9VOoEQSoxtJywaxCbJaBz7CqJjB+yetJyOZ0vVHnkixDagA2
   0eZ2zaELJ4H4LS0LTQigdz/yxhIK5Zk1zr1OfI18YeFp6n1/FlBppLcmq
   0VnVzDh7DnftU23G7fTLT/gRPYFrzH4YCSZGiSr9y73TD9Eaglv1yrJT9
   2+Rcs4C7BJOcz8kNsSvIDXu3SMbb6HN3RlClGLZaAUM5McXK3hfFiaB00
   A==;
X-CSE-ConnectionGUID: MNTnYUnqRaCHBeKvxcpRdw==
X-CSE-MsgGUID: tn2xFFU9Ri2YFmy1GTK5XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="88334251"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="88334251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:44:23 -0700
X-CSE-ConnectionGUID: OK2L/KF1RiqHUdKcUWaneg==
X-CSE-MsgGUID: SgrWAXf1S+uiDLl7QmHqXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="274019453"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:44:23 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:44:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 02:44:22 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 02:44:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MKgmRvAi7WjAtxjF2Osmky8DpMSukPkDsojRzAUAq0Vi04QBx0BZTGxPyWRQQoI7chihhNNXsim+K0wsk3q4nOs1c+Q287B1Ofv7VQawoGHhsMn0n8ib7brxaZ6dQ3sSUzoEfl1sYirR0UEhxw8Kbu3Jurhn0jyOVteZrZEqlRRHv6AS6LcSLuXEXK3Y4aC6p7xmK/HViEIRjYylfETeqXFT475QBS3WicrWYtFrHVgVLczjKjlB8LyCZCX5+xS1ZDMneC9ZcN5VczjIUwafKo/7zCcz2UeADyMzxYoGHXyyp2R1duK4FXc46UucGMC1j1DxCQmCJbGmjaJLuBzcUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6mnVmlNFhsVDmPH+DJcWskvKINAzvoljOrdJo3OVNk=;
 b=Ee5Sia+ZkAJg/L1IxJQTjcPSvkyMw9GiOu3ztXRceon7YY2nilIneVCP6ebsfSrAfiMXfE4QCoUCbso3CafsYQkvDQd0VV5yohHbzUVV8WXmTwLAFJJlDE7fbyRiICm3nBqVCdWOaShIvkthO0cD57ZHH+X/Bk4Hr4H710KdcSE0+M7kKPRk52XWlIgao3cPaG74uW89dhKER3Y+70MFYlJHx4fIFr4kCixkt0ICJSh7wW2GlymfxzpH8DMPzcJRIHQlXdtM6vf66Gx5ungLVULrnCCKJZuAKAQ3pg/ukU6RgP5WpDID5F22/IVV0oVVCvC7xAa1R2tHw2VDQ2RbpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by CHXPR11MB9625.namprd11.prod.outlook.com (2603:10b6:610:2fd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 09:44:20 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 09:44:20 +0000
Message-ID: <d8d06f35-56bc-4cf7-be2e-c6a3acb725b6@intel.com>
Date: Mon, 31 Aug 2026 11:44:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux
 disable path
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
 <20260828050526.590761-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260828050526.590761-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI5PEPF00000913.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::937) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|CHXPR11MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: bbd06c16-aa37-4245-3da4-08df07446e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|376014|10067099003|6133799003|22082099003|56012099006|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: g3l6CUdeh/aqkjNUpgDZOOknhG9mIWbq5RUhNFMY7uVBnrkG21AX4NmPidjn0htgJkPk4JVDUo4YM3AhSgoprDHTsMyke0T887sgDrEpAkMwljetL8S/uTzjGL7mWBgAyCfedE5LVtm89Uke8QJ/6VRKWABRlxF98SkIjW+ffDEy9Pqb9OI6gBhCIa9glpzbx6juU6X+A61O3LprsZcavDp+46BwJkNYJg2zv5yLeJqsycsyigIh4mrOK8S+392VOJrrsO3MCBVShRHkQvbGATQMJltmGnTvlY4PeeRB61TpvnrnJEqPnbiOM8bUT3CuLqqXAflkTn+abkZjo6WuvNgocmY0I6DBZvWlwq6Yh5R7ye042F1Pm2L3ukJF3vOu35GsvXI/d4DYAC4pRTxN4uHx8gooJKTh6h4UJ6KSAguNzv1cvLqI4Ntnuv3dyq/xIcQBn302dJXXBEkhc8vic82DxwXzWuU+TNupioav3K3Xl7IHb5Nd45+HuLud6MEGs1PVnqYVTCJug3RUYkhETRodZvO0kMLyOEUYq2y+y0h0ORs1XNQ0S9JM3+S3GnHc02DYXRc08PGWP8T3FVj7j8v9A/TRJUYQizaIzeV4pLZzLHCbA6/t0rpja01DpIID069Om+C3EgusbkQRyfVoouJGgHMbD7yy4KF/k4CM5Us=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(6133799003)(22082099003)(56012099006)(11063799006)(4143699003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0FWazBYYnRjZHh2cit0L20rc21BbWxUL1NlbDlGaGY3bkVkblk5dlg3NEdY?=
 =?utf-8?B?N2xuL0xjaDRaY1pKckVJQkR6WTkwQ2paRmp1dFZNTWxUckZGTGpiUDNqaUpT?=
 =?utf-8?B?dlVTYVo5MW5GaTl1eU9pcFpMajA2aHArTFBDRlNaek8rcGJEa2JFbldEdndx?=
 =?utf-8?B?aU1SbWxBbC9iSnloVHpDUlhweXBSVS9Ga1czdmVrWlJqcnd0bWpEYTgrQTh1?=
 =?utf-8?B?OGlqQWJCdEFoSEVkR3ZYbm12bFcva3dyUXpSdEpzT0JYckdWaFJPUlorS1Jz?=
 =?utf-8?B?WWhuNkRXTDVJdVFOSkhnU1hpUTJLK1pxaGd5eE1XelkvbTJERXlFdldZSXJZ?=
 =?utf-8?B?aEZ0VGVRbGZxMzJMVkxrUTlxcXZkNGZhQzdZaWJmYzUrVnRJWGJaTUx3VCsw?=
 =?utf-8?B?YXZML0M0MTNLcHJoZHl2VVpCNjBxTnNZbEw0T0Zrblh2VlVOV1RsYUNhSk44?=
 =?utf-8?B?Y09ucW5CR1NpeFlkSlh5L2xOY0wvUFZlc1RlemRpMmJiKys2US8wYTZQYjZ6?=
 =?utf-8?B?VlhPV2p0a0psdzJDdG1YTWk3UGk2SFkrTnl4R215b1NnMnlzZzRTaTk1M0lH?=
 =?utf-8?B?d1J5M1ZXblUvMkN3WGI4YzQ3SlVNSEtDV21xYVI5RmRUbE5xMnI4S3Y1RnBH?=
 =?utf-8?B?ODNjVjlWMHdaRVg2UGpYWHBGbkhteUxnQTJiMFNnalUvUDZveER1MlhiQk44?=
 =?utf-8?B?dlU0Q2RnVkI4ZVk1cEVmdktQcVgvWjdZamFtVU5jL21id05BN1VQMFNNQmxv?=
 =?utf-8?B?MlN3K0o1VWE0N2NBRlY4QThUeHV3Yk13bEhSZ3FubEZ5Zm8yNC9QeE53TkQ5?=
 =?utf-8?B?RGkvZCtlR3ZtV1ZQSDdBYlJWQ0syQUV0WjBOSG9tOUNXemN0RUF2M1hrbVBr?=
 =?utf-8?B?SWVuSU1mK1R3QytyVmcxYitGNTdMSzJjZW56VWR4SkhHQzVFV29JZ2I3eHJB?=
 =?utf-8?B?YjNsSHVHZTlSQzY2M25MZFVTRTNlZVhCZ3VXejdLa21tK2FWcityNGVzc1BL?=
 =?utf-8?B?VWJBUUcrVFJjN2tkM0tIN2NrdG52ZHBad0xCYWlsRzRJWDFrSmhwbjl1eWdx?=
 =?utf-8?B?bTFoSXBlSjNhNEkxdmRkR3RRVkVMVHVPWEViK2ZZWDFTSllGOVgyWWRiZzZY?=
 =?utf-8?B?RU80aDZ4OGhnNUZKUUlPeno1eUNGNUNKc0lzSHZ6blVUaGZubXkzMHRMRVRh?=
 =?utf-8?B?djAzeFdMdGZnNnZRajFBcDUvYXBCZ3BrR1UzSkNWWTJiS3VNU1ZoNFBrWkdo?=
 =?utf-8?B?aXJVcVppWkVRaHM3OXVjZjBDcHB1ZWdjdktEN0JWRWhvZGxJTnk0OWhXMzEw?=
 =?utf-8?B?YXFQdk1KcWFxc1lhdGRTMTFUZXJoVmF6SFVDbmVyemIvYU9YViszKy9YVUo0?=
 =?utf-8?B?ci8xNGJiMTlkVEZuSWMrcmRRRTUzQlFsZ1BSUVhBNm1TNnlxb3ZLWGZEbTEv?=
 =?utf-8?B?OFdtaGtFeGpMVmQ2djJJd0hacmIxa1EvVFZ0WUV6THUvR29BaUNLRUNFb2ht?=
 =?utf-8?B?KzBtRkFzcHhaRTFOaWg2alMzNmhEckI0ZFc1YWFJS0RORGFEYWJOVUkxanlU?=
 =?utf-8?B?cElFSzJJNHc5WHo0aFNQL0xtUUlKVzZyamJ6ellCZXdiMWdxL2h6aWNBcE0y?=
 =?utf-8?B?SkpGM1l6WUs2dzFFV01jYUFhSlVINTljZldoczR5ZzAxUERHbVBJa01zWElw?=
 =?utf-8?B?d3ljQzRvZXk3Q1YxSmlEQmpVem1OanV0WVVLZXhGaFRkUVh2ckRzSUVWdGZE?=
 =?utf-8?B?QlhLWlg0TUdvanJkeUszYzJpdlFqTW4vYW0wQ00xQnFWU1JrWDRWNVVjVGVv?=
 =?utf-8?B?MlRpRG82QUdYUjVCVjRoUFVlM1BSVlUxUFp5M0huckp2Um1PZFhGdXpVSU1m?=
 =?utf-8?B?MktoV2lnMFpibmFaTUpzOVZITG5hMnpkNmRyc0Z4aW8zemRjOElSN0xzSS83?=
 =?utf-8?B?d2dGL01NdmRodFA4UmczN2l5eDlGbUFRVDZuNHpiSlM5cXJlc245TlEvZUtN?=
 =?utf-8?B?eUFBdVhwWHFMVkJpamJlaXdianhHV0doU09nV3hncHVBVDF4MC9Bd0NldjNk?=
 =?utf-8?B?Tm81c09Lbm56dmxxQUUvM1QyUWkxTkVHd2grVGI4T253eFdZMFFIdWFYU0Rw?=
 =?utf-8?B?OUlNRWxxS0FBeXYyVTFpekhWSWZTT3BYampDVFMwait0ZERLU0pOQ3I1Q3Rq?=
 =?utf-8?B?MmFOSk52NDdzL0pyZjU3dWNEUGRXdWl5NzEraS9yalRpWFZhMHBEWUtlNito?=
 =?utf-8?B?M2xSK2FicVp2UnRPRTJiQmFOOERQNldwVUVSb2N5eXNhZ2Mzd0NlQVJ1WTY0?=
 =?utf-8?B?N1ZiU1Y4ODFYMnlobWRJK2ptUDJ6a3lOczhGYzRQSkRtVDRrMDNtNmdrakky?=
 =?utf-8?Q?9XT/dIjIlVtyJHkw=3D?=
X-Exchange-RoutingPolicyChecked: NFT6jTd9jyMrccI3jZgx524eB+zQDAe9ZP7H9EIs7Gm+YvEuW8Sn6zKAHELr85NE9VGUfLy/88iwqckOuBVmOw+fMG/02mALxDTYkOl1TgRojAqdL+368k7mn2JzECffIXUOaQmFbOLs+RrVJkl+NO8InEqS6wCELoR09fDKBle4W2ptcRd5tui+6Y6VeE2+s36TRne7XNo1mOtOGVuzndSFKpR2muCcZS0XFKijjpSgM0uuGUQifq2yyWvFIdq6O/8JF3X6ky9wk3HYM/y1YGnAHqBxGm3pbO67/pdxf8mIyLwARfOiKjgGQdJjNrI5nCi5PzZi7P9p9/egopX7mA==
X-MS-Exchange-CrossTenant-Network-Message-Id: bbd06c16-aa37-4245-3da4-08df07446e38
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 09:44:20.0663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rXHvY6by7ZuUEOQ47nkM+xy6yMtP1n6NHKqN5h3qpjUEgEYJfDvhTasu6jO85yWeXThDt185Wx1gkHY9pHAvqEVXNPnG3qVTOQ7y7UzT4kE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR11MB9625
X-OriginatorOrg: intel.com

On 8/28/2026 7:05 AM, phucduc.bui@gmail.com wrote:

> @@ -339,25 +340,26 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
>   			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG2;
>   		}
>   	} else {
> -		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
> -				     afe_priv->clk[CLK_CLK26M]);
> -		if (ret) {
> -			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
> -				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
> -				aud_clks[CLK_CLK26M], ret);
> -			goto EXIT;
> -		}
>   		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
> -
> -		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
> -				     afe_priv->clk[CLK_CLK26M]);
> -		if (ret) {
> -			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
> -				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
> -				aud_clks[CLK_CLK26M], ret);
> -			goto EXIT;
> -		}
>   		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
> +
> +		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
> +				     afe_priv->clk[CLK_CLK26M]);
> +		if (ret) {
> +			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
> +				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
> +				aud_clks[CLK_CLK26M], ret);
> +			goto EXIT;
> +		}
> +
> +		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
> +				     afe_priv->clk[CLK_CLK26M]);
> +		if (ret) {
> +			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
> +				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
> +				aud_clks[CLK_CLK26M], ret);
> +			goto EXIT;
> +		}
>   	}
>   
>   	return 0;


I was thinking off a typical teardown procedure - everything is permissive:

// the disable path:
	ret = clk_set_parent(CLK_TOP_MUX_AUD_ENG2)
	if (ret)
		// just error reporting
	ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_ENG2)
	if (ret)
		// just error reporting
	ret = clk_set_parent(CLK_TOP_MUX_AUD_2)
	if (ret)
		// just error reporting
	ret = clk_disable_unprepare(CLK_TOP_MUX_AUD_2)
	if (ret)
		// just error reporting

or, if one wants to do this properly: split apll1/2_mux_setting() 
functions into:
	void apll1/2_mux_disable()
	int apll1/2_mux_enable()

You do not have to go for the split, the first option is just fine.
