Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20B43C3432;
	Wed,  7 Oct 2026 14:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381819; cv=fail; b=s0dbA00WD6awAJhyP3HCbf00lzcXtVg6sjuHOuv2i5fLs+EwcTZ+pSt9d5p+mGzRq8+8sNYi0lPxjx7pQ1wU4920mbLysKPkBsq6JSJOF1XbDruD14eFuGQJKyOuM3Iw1RMY6Sl29e93F+oeF2Roj1YOqHRMPb4yuYX9KzBoLEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381819; c=relaxed/simple;
	bh=lruYiW0uBRs3Qb+ISAnc3bg66XCAEI8Fxt7qhfUbxLo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aLmjxmsOv+t+BsHvfPDrz0nfJKhzcVPqqGqJCWV5PEge4QpN+c22MwcDESk3YnRF1Lvbo4q1EMDjnz3GcVFaJAOWSgWWskEYm7lTeOpp+UbreqkC/vJdSJv+XqLm5TL6E+Vd/lDKse7zjdUDIocjq2vnJIjbUD8XKVyaC/pWpC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UTzMVaLM; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UTzMVaLM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791381813; x=1822917813;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lruYiW0uBRs3Qb+ISAnc3bg66XCAEI8Fxt7qhfUbxLo=;
  b=UTzMVaLMIM2c+/QUoyFLasvb8fqSp8Nda2JOKzHsEzk4B6PyE/66y+WD
   CqJ3jS/nuJnh44mrGZ45egFVkTLFaG/T7/RYjg8V866lEBqKgomrksU8U
   lVUxh0I2yDokdLaLJaKiDf2sGzF4vVWv4rhskwAdH0ySLpTSqScSk6Rsb
   lFC35evKd6fdOnUIUaFwHXvg1sSNAoJvShdI+LSK/DYoJzBugWYOs13UW
   tslBnbw5SWSRKjEUnOvvwoy/ZJWP8NP3lX8gdkryv9tALnAPOMCuquDNG
   OWX+2H4eRmcso0Xt7w/+PZIKP3gG6yszaZa4UOwjJmyN/B0miO12RLFiL
   A==;
X-CSE-ConnectionGUID: 6Jmxa45nRG6aL7PRVzTUDA==
X-CSE-MsgGUID: 1fYSJr9UTd6zD+OjRf5ptQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="29608"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="29608"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 07:03:29 -0700
X-CSE-ConnectionGUID: zmTy/GKTS2GmXgdB4cVmoQ==
X-CSE-MsgGUID: d1TjUYqeSMuMFx3z1uSyAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="281209335"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 07:03:26 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 07:03:25 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 7 Oct 2026 07:03:25 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 7 Oct 2026 07:03:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PL5ymIeOLTsE2lvYsdlxp3bzcQOMpNk0qejlXxGlVD1CWw0FL7DZB8dQ25fmGuLTxErDSR5+fUwQUm5NM1KGV9kVyIKwaZIrJmemKUph5XaEnw1bkKhbv3NUowPFBk3cAto4Jt3xQituVDlmQJK13FeRldHCtF16xdBpq7M2uFAzuIAZlt3A2cI/3YJYqOmhsfRSVDJ8eD5IuV6dHJ12PNwEEG1XEM7PDFDEtxjLImMN+FbeDiJnhjzsE4i9srAF2rngl9+Uwf6vkHyJDXV6mKP3BqjUKpLr2ItzrKfd7NZd+1QwFCfWcf6AUqAy7nsKbYKxMCXwoVbh8HzCCWUQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JIAa6c1/ya6A1pR6VXnqS2q0OUKafY3Rm1R7x6BCEmI=;
 b=SpSWfuZ/ZeMj3aaCvI+D3Ejmz2oSxtTfeEoL/ndhp0jPD9cYm5jj7HQ3t7w7Jeze2rA5hhHQoAQxViJR3V2A8TLvAgJTXhYDxziIHnJ0upe2UiZmKaDW76z4NjFE82IHm8jCVNgJmwrjvqL0x3j73an9XaqIvc1w2206WOdzFzzbSyYwoxW1Y6vYUIZGXe/jG9y7YloeMdq7dmHJpURJIK6P9rp3CDQQZMaTBaZOBHCpypABoeNgJ5sMtvdRRlJW9Yh8/6C1H6CTbXRmdDOFexBV1ViMksAMLGtk6zRAteKsHSakwrcjR9p2YUq53Zf9afwV8ChRjUrFTNwH+ggq5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH7PR11MB6723.namprd11.prod.outlook.com (2603:10b6:510:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Wed, 7 Oct
 2026 14:03:21 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0472.015; Wed, 7 Oct 2026
 14:03:21 +0000
Message-ID: <d00880e3-01b6-476a-93f5-79ea6e536a1c@intel.com>
Date: Wed, 7 Oct 2026 16:03:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ASoC: mediatek: Handle constraint return value in
 FE startup
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	<cassiogabrielcontato@gmail.com>, Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>, Cyril Chao
	<Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, Rosen Penev
	<rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, "Alexandre
 Mergnat" <amergnat@baylibre.com>, Dan Carpenter <error27@gmail.com>,
	<linux-sound@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Mark
 Brown" <broonie@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Trevor Wu <trevor.wu@mediatek.com>
References: <20261007110858.509341-1-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261007110858.509341-1-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0035.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34d::14) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH7PR11MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c724bf8-2ed0-4a86-e488-08df247bbef2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|18002099003|11063799006|56012099006|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 0jMmbFu5pN1KqVHM4MXtGUpSS/GRa3ENfH+FYa+iXOg75tMXJI6CM8hk1LDWbsdUI9DIpH9mLEq1hKaVKajvn925tzApaJVVNFmf7QEAsolQ1G7pXpTaNL2WZht5EPFG4r7vSYfDW75F9zHF0FKf7eiz3trjF8SlVk/kU9odlmhqMZ30wGepEXprpeyheS9bp5v0GqjOhJoxMtXGAMlrVvzetgIb/C0Qb9J6XK73r/ZArLTbLnlBoki/loEVW+Sr6DZL1ewUkvcIC3FDYdXUztpCEsnIov26iVe2PCclSJE8n5/yO/1ysurZyrA79NSshi2a2KCp1U66C7U4gY2M3XBI2GV0G6gHknJ6jqSJijngkXFGVw3apTdla55VvNLKqBuU/f9pYP8TWG1EPyy7MqtRtJnBiALA+HiWikNJlfd3akGnesaJzQgLsFqMIJCabljxCDTY64WkiBo+uXwu2nJr0MoL2ZsRuPbm8N559ZRWn1LPZKUTRDWfb4Yu8Z2llYPoetnKLOSifBKVrfiO43zGC0ScpW+kL56I7SwEd3N8EiePoHUWb930mszag0wNY7fP+8/Ck5pItxD/jUJw0hJL9Eam9EB4eZDZqRH5ktXkxX84/gZeLoxAWqu1CL3Jj8p5KZiSJPC8M/NvIZcZEdDbqBWDO66ULk1FhnvS8VY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(18002099003)(11063799006)(56012099006)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjlObWdsalJIc21oU3p3czhRaVNQWkt0eTBzU1dFNXpDbmRydmFEK05vK1JJ?=
 =?utf-8?B?ZlYwTW9UdktJcENtZ0xqZzJVbXI5Q1hXK3REeHVlbjB0ZU01SXRCdUtDbXZ2?=
 =?utf-8?B?Rk9WUU1xQllQY0pjdnJzUGNaSm5DVmJ5UlVTNGttdGhtK1Yrd3ZrY29sS1RR?=
 =?utf-8?B?MVdVZ3BhakdYTmd2QTZFNHBDMnlvdGxoT1dmMnpIakFmbEJCTmh6UUdCdS9M?=
 =?utf-8?B?cmFsazRWTk5vR09FMWhrV2lDNTMyd2x3d2xkTmJzV202YWhsU2NEOEZTYkR6?=
 =?utf-8?B?ZmxPQmlRUkZQdVhWTVB4T09qY0tSeEZ6QzhQRyt1YWNFNVhhSGc3azFQZGxv?=
 =?utf-8?B?YjBUbjNURXhiZyt3eWVMbFZZWUNWSFlXMm5hZEk3bzJvR0hiREJyditmS3hK?=
 =?utf-8?B?aU1BN1gxTk0rNEJ2cStLS21rSXVmOW1JT0dLZEhjOFVoV3Rva1RBbS83a2Js?=
 =?utf-8?B?cnJjcGtVd3R1QlIrS1VVTnRGL1ZrejhuRXRoaU1WNlhlc2hCWlplQThqcHRN?=
 =?utf-8?B?MGFYcGx0WkgwRW4wSWp1bk9LeWlkZmNGYml2VzlpeVJRSG04N3lwTnYvbzVH?=
 =?utf-8?B?SGc1dGpYQlJkUm45MURjRStTcGJGelBON01WMTlWM2Y2S29tVlRZR3cyUWZu?=
 =?utf-8?B?MEJDdCt5aUVCVXhMeVRYaWNKOWVqNTN2RmRPZjRqSHdRZlB5d3MrS2VoR1dv?=
 =?utf-8?B?cFVDdUJqZllxbEJGbURiK2h1NGpyTi9qSFFhRkpvK3Q3eHFNQXl0bmRad3BO?=
 =?utf-8?B?TDZqZEt4MFB6Ukw0K2lFR3krUERwelI5MWhhT2M3d3NUREZTZC9mMUZxSmRm?=
 =?utf-8?B?Q1V3RnBIWmNLMWZQVGJmNHZIc1NLMEtUZHBZaUt3eCtlN3QxaXZrRjlZRWVV?=
 =?utf-8?B?WC80Tzl6OVprK3pzbnJLY3hyTitUWkJCTVFNS0dzT3FGaGQvY0VBVFNMbzZs?=
 =?utf-8?B?Tyt1ZzF0c09OOGk2eGl4aHA3TUhPdVArci9kY2dyRVlCQVlvUFJzZmgwdnBG?=
 =?utf-8?B?eHY3bmlVM2xsN3dTRDNjaVVBMXZBNzQ2dHZyd3hNMGh1RnE5cE9OTFBGVUdL?=
 =?utf-8?B?b0JpN0cxd2J3RWZOejhncnFTWjE4Q1JERUVQbFZJeGRQTnUxQUYwRFordElz?=
 =?utf-8?B?N1BKWVpCNnFVQkFuVHlXaWZvTkpnUUw0ejNFdVJJK3NVSnJBYTdVR3pNUHNx?=
 =?utf-8?B?Wm0rQ0R5ZytXRTMxUVlxRkFMbFZpVEpqNHlXSExackhQUkhDSDQ4YTNyOHJs?=
 =?utf-8?B?Ukxha1NINjllemlja3pNdzVtUC83cHNha1AwZFV5QVhidTBGbkc0a3lZWXg0?=
 =?utf-8?B?cTJ2dWplZXV0aFFoL2xmbkhOMGMyM1ovVE5vZGp0cnVkQWtTWllLYzJTZk1z?=
 =?utf-8?B?U0xkUzRLcTlOb205Z25wR24xRjVOdUtuYXBMMG1PM3A1dG5oSFRidmFOTWdz?=
 =?utf-8?B?eUREOHFJaFMrS2hFN05jaDdPWUVrMWpnRDBienhPYnNHMkc4ejl1aEZoZUR5?=
 =?utf-8?B?WU0xU1lFbENlZU81eGcrR1lwUVg3alNPa2pGYjRnZkE1VEgza2xucGw4REc3?=
 =?utf-8?B?dUVaZEtNTkZ3ZjN3SDN5eENaa3lHeDA2TE1BeHYwKzkvZ1BsZjYwaHB6QVNE?=
 =?utf-8?B?cDhJa2tKd1NKWXdjTUNzaXZLdFFYdTBlOHhBWkhVRk4vbXF3NVJJalpnV3pq?=
 =?utf-8?B?WGdRYnh6WGhaN01lTXJJZi9CQWFZbDJQelhSejlBVnVMek1Rc2FKZllLNXBy?=
 =?utf-8?B?M04yakZIeFRybis3MHRkc3ZsNWZMYUxFNHFpUkN2RmRWYTB2aElHRHBDb0Jh?=
 =?utf-8?B?UG44VDB3YncxTlBoZXc5S2kxNjJ0NmRhK3NpeVZxMEw4UVpuUzIxUE9QelVX?=
 =?utf-8?B?Yy9uY2t4Y1QwNnNveDdvaUwvT1RCWGp1aWxOUjZDRDJzeVJIUkVmQTE4Y2xq?=
 =?utf-8?B?TTl5S3ZwTHNuKzhMNXh5dmNoWENibG1nc2IxQlJqSGNYa0FXOEZ6eVd0SlY2?=
 =?utf-8?B?Z3hlWDRxQ3BFV0xHMzFkeG5XZnJkN2E4MGhxamdORHNwQkVRWS9zWUFySE1R?=
 =?utf-8?B?dmhndG9MdHl2UTVHaWU4UmZ3bC8wN1ZXM3dZQytVOWZQSlZXNjJDOEw4Y3Ft?=
 =?utf-8?B?ZEk5bnVlMXQrRCtqYkZnVFBhZEVtampmMlpVbEVVVnhtZHF2ZXVqblIwT0JJ?=
 =?utf-8?B?RUV3Rm9XWmpNK3VVVGRId2NOOEQ4VnBVSXVKUHUwL051QnBwVmRuamtqWjNw?=
 =?utf-8?B?c1lMREdPMTVRdThTSFpkR1NnVVNXMWhDcEdqc2hSUVgxTUFGa3R2SmEvZHM0?=
 =?utf-8?B?aDdiMXN6YnJWckVqZExXV29jejAxamt6RnRrS3pCYVJ2Si9mUHJ2Zz09?=
X-Exchange-RoutingPolicyChecked: 5SdafyU7x2CJ5vCNhAD9nOLt3Yx3D0IsnHZ4+6PqNTCrV6hTHQOYVIPZafjIT5JoM5JWmTEzOQ19KLjdTAKZLQ+JdVn7G65sHDHzz4iaOBEwP99Oh0r141VKv8B0O+1CFmO6eY3BJKtkDSlF1eIxV41XlgucJYAYHn5sVB9Up3cnZPVz37UjMWuiUsOGoYi6DxJnfoIaIKGug7k5rqVoR/swOVhjLwDiF2D0bPn6wt2NUd0qC/Wu+GFo4xRzYDYRPYKL2DQz73Ln3ksySBrVnHM0ZlgFEifxJrFF/JEZNIo6vnxNyPVwXJ0joeQzMTIwigvfLtNMeC/+f3qqrqtVFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c724bf8-2ed0-4a86-e488-08df247bbef2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 14:03:21.4317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LDwVwcFRDO2vEQI4op2cLMtfJGHWk8l7pvK2bbALjWMUnZzJabNaK3EhHZftNYHMXqzbjix6u5UUMSOPQ4Fo5UCHWqwWwk/Cgiz8Sv1runM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6723
X-OriginatorOrg: intel.com

On 10/7/2026 1:08 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Some FE startup callbacks may return a positive value from constraint 
> helpers, but ASoC expects 0 on success. This can cause .shutdown() to be 
> skipped during rollback.
> 
> Return 0 explicitly on success.
> 
> Compile-tested only.
> 
> Changes in v2:
>  - Rename the patch subject.
>  - Simplify the code change as suggested by Cezary. 
Thank you for the update. The snd_pcm_hw_constraint_xxx() finding is a
good catch.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
