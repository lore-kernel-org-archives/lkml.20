Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE9A38F935;
	Tue,  6 Oct 2026 10:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283218; cv=fail; b=hSTP431T5k7SOntu9E6rZWk65ohLOHSgBcB6D7GXucVHDoDJ1EU33XXCHcKpD883sTdDdEZ+opavlOAv4dbAcILapt50L1Wwxw21FDtjQb2XpYdzYvty0PT6/8GiNckHt92/3IylZ9xU5LBqwksvrzZkaeH45UqowGX1HcX3nBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283218; c=relaxed/simple;
	bh=EKO0JQqEtG97bcvWJx7kmV0ei9TJdRx014QKKP8UVrk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EUHj29nLvcMskeWDvQBGTescdrAIFRYUEQXhnqYN3aLILlzrbWCMLwNniYhfog5B7tDCMQHhzNcegyhChNn0K4OXR5+nR0XqKu9S6YMYjE/9TbaUjuqHnncg6TdNW8+T3QIsvvMUlVYFkjmSy8gGanDs33NSFdNKZ2R5vNwEpSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YOFFIHsM; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOFFIHsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791283215; x=1822819215;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EKO0JQqEtG97bcvWJx7kmV0ei9TJdRx014QKKP8UVrk=;
  b=YOFFIHsMeHcs8jjnYzG4GdtcmEY9SgT/u4ToQ07c2Mp0E8UKk/xApC2b
   2gaWjEKiuHN76uBUE4W93weJV5KM1+5VqPTfLpL6CbPSDO7awbOlWQs8l
   Ujgj0hlCtKewh5YTS24r+1D45qcKd2H4TKBYxQwo1YY7X95Xa2p2ha1Te
   v1mjzw4jrsrKS8D0T4m1/vRmu9gevOe1/EWUkiAJDngA3yb0JA7S2tmsA
   czrNnUqCFezM+lejhZ6tXejMazgjxMiYK4shQIr0bMnoGfknVNFS+jIAB
   8lhB4oMqbD9aHPdO+iyoevwB97fWHpMoGnCTxCD1sJnlPLYTkP9o4aSVB
   A==;
X-CSE-ConnectionGUID: hoZegrYqR4STPm54Oj9tiQ==
X-CSE-MsgGUID: wpw92yCgR/W9ogJcHIV+fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="7432"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="7432"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:40:14 -0700
X-CSE-ConnectionGUID: 3fadKZGoR4WBYr5nA8QHEA==
X-CSE-MsgGUID: vPp0K6FYSV2cYgTdO63ozg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="305045434"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:40:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 03:40:13 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 03:40:13 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 03:40:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRNZCtnp2E7oSDlZWTSPLCPRFX164K+W6uy5zBoe9tQV6NyeLPHSa6w5J4FHDXZ0DtaqpRy2c9HoJtckHknfvACQr0G/scIMj+flbOBfjo8M+EaFrAiFsP8g6I8c1KbRGYltiXr+pUnetSmCGzYQyY0/KpdVCr6t0Ww9Uu5JpbTok4AwoX+PvyS9aU8h7r6Z30i0OtN3p0vztio83E/jkM7qIkaS7W2/i1csA4zwLnc9WZ2jE1/AjYTNmqrDYzH6kxJbHDCckcLAAruSgSc71wzRt9SsOBPFqXGcCyJfEMj9PPWE1z3ayG/OO0P1V6NsDgsPqUdeBOnhl+eyn0i3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q9nTKfSsOxbQxKdKRjqA/VJR+xVVnYxW0OF21GscBQY=;
 b=q9iyGhD6bfx9LABNaodTvSCbxws6pYxPQAlRrv0sXh9YUn6A1XqKmOVMOzRdqGE0n2bPpySeJHqxIZIrrfdYB5jl6OvMcCuRSB/2VvT+8x2S+SB0XQp6PQvwlnUFvGQtlhjhEKkDBaR59EiX+L8uEBiyx2CEMuV7aZvRLgBNYe7oNc3GiLYiKMLNp3dJ4BqF88L2j47RuEFib1uV0QHBhOZfdN3HHM+gHekxJc8RE02UKavXjZynEeIZDHgvX9YGi0U6YdBqsmW90ipn3yjotFybtxrTzZdTDnIZeGrc3x4Z7N/Av7zENZN2xM2pfBbAM5w9WI4OWGGKFdlH8C/qIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by IA4PR11MB9394.namprd11.prod.outlook.com (2603:10b6:208:563::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 10:40:04 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 10:40:04 +0000
Message-ID: <633be718-a5c5-4e67-b9e1-5d4422944f2a@intel.com>
Date: Tue, 6 Oct 2026 12:39:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] ASoC: mediatek: mt8188: return 0 from
 mt8188_afe_fe_startup() on success
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
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
 <20261006101606.54079-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261006101606.54079-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0099.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::16) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|IA4PR11MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7fc7db-eb38-4552-1a12-08df23962e30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 0n+lPrIe+VL7BfeTxDaqjwuSg+hXtl3zrDe2eOND8jKcj1KOIOuY07DTHdSbPwX7Ajbgy4/xgaT3eZ/AJUw0NEAzqTsGjG/hhhosmqb9BxdD3UGpKJBczMsPXLHvh4rUvj7FverzWOwFz9slXqWrRcAsUj/TszykK2MwyGbbInR9qEEww+fIQDZ2HkerVbFcMJxasrSeKYLsAMQfZPmhOfDdpjpV5Fy7IenH8FoJyLwS5sOYsvHJ3b3gymQIWVyzUTKu7gXl15ISCgDkionjNzzZ2FZPLmuHbYwBKjaqRcsRwcOLP5hkmQ6qUZfPE0i21g81BEwEgGnWHyWDSIK0SXg3nrZybx4ZzklwX0izlQ3K93104zgvucicROQ+MMgmjcLAr+qVDCQRVYw6K8rgAnpEhDjwRht7qafTR3CO89q0eSLBqG94DWX/2xte55F7zAB6qAhQdcy3m75xRxagUrBgSCwXmR8BLL/du6MZlxSJsLQwKabJyRhZpVvMRtZY0z8dob4DSzbwd6iSARSiCoqHLLS04NohClG2OnaVOAn34bH/Wak+5s+jniMiBFNeZKxjm3zEDqdhfTON1MEWVjWhIuk19YGLlycWA/nfNKlXdPTXfelgFMNPSCTUceHZ/NHTZH2W8Us2g89RB3VwMeptdffHI3g0SHVOjDnVU/c=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0J4bFZnNVdNaERVR3B2ZWtZK2NPNFh5QnBZVXFvRENubDZxVXlFUUM1aUdD?=
 =?utf-8?B?RFY1R3dpSzZYMGVpNXhkRmhhWTFuSy81UGlxTDRTWW9yUzFzZjBWK2Fmb3Va?=
 =?utf-8?B?NkZEbVRRNnpwdmJPL3NUSnhhVFNReVgvM1JWT3RmSEROUXZOQjZaVlFidHp1?=
 =?utf-8?B?UTdxb3AyTlppdERTNS9yc0JBa3dibjVhSC9DRUl6RzNmenFrOHJ4bkdOb2xZ?=
 =?utf-8?B?L3lNbHNhYUFjT1pSTEdkbGdlZTFvMkN5MHpGeDFialc3L1lGeUFCaDZEV3NJ?=
 =?utf-8?B?eVJ3dVpJc3o0aG1zQVBuQWVkOEtNOVE4bG5FYit2OFJERmdvWWRZdWtCZ1M3?=
 =?utf-8?B?M09lRkhOMTl3Q3VRd25NL1hlWDJJZkJVMFpuZUR6NElXMWtjaFVvVjh1a0Za?=
 =?utf-8?B?OVV5SmQxYTZvdXIxMnQ0SE45WC94VVR6UEhUZG9wK0VqejY0bTdXUUxjMjFr?=
 =?utf-8?B?VEFudzNGVXZBSnNtZnF3S0t0R0RVdGZpUG9XS3l5VFlEWGk4RE5RUXNhYlJp?=
 =?utf-8?B?WTdsV3IzWjVLcmhIdjV2eXdzc1JobVNoYUVvZFpzL2tLdUhIT0MwSmxyVW5m?=
 =?utf-8?B?U1oreHpMTUJRUzNiNFRDRW9IY1A4SG9YdjJ3ZmVBVFBPK2FwY1crbWVrS2lT?=
 =?utf-8?B?VEJLbWlrRnhOZjJrcDNEcExTejZpNHdrdHd5MkF5U0dheExzSWtwNW1TZ2xk?=
 =?utf-8?B?UE1RRTQ2QW0reVBzZWNNZWx3MXpwWVRwRG96SHZGaHkzK0NMUU4wcGt6L2lE?=
 =?utf-8?B?eHFXRFlFNFhQcDJMa3N2clJ1SnEzVFltOTFGMGRhTXFPU3FrdTBMeUFtRW9G?=
 =?utf-8?B?M21xMis5MlZlZ21XV25uQ1ZFZWNUV3phQjlYYmpGSUJPT2tOSEpiOUQwc3Jv?=
 =?utf-8?B?akp1VFpSd2tKY1ZNQlc4ZEJPRmdYcFFETVdxRTg1MHlqREVHOCtaT3JNQ0hl?=
 =?utf-8?B?WTI0amE0TkNmMU9ubUxPaEcyRkV3MVdDWGdEUGRBc0RabW5VZlNrZUJVbGFk?=
 =?utf-8?B?bmFnS1Yxa3hDbVMxYkVXdDg3RVRSOVhyMmd1dmZQVEk4Z3Nydjl5R0xvaWFw?=
 =?utf-8?B?RFIrMWVxUDkvdDl1c01nSTVFd0oxRUtRMEkrczc5YnJzbC93bVJxSzZiSUQ1?=
 =?utf-8?B?aXpLY2ZrVWFUOGc4VVM0WEduWCtEYnhrV2lJRXo4djJZSU1kaUgrYUFjQ2d4?=
 =?utf-8?B?UGF6T3M0bFUvLzYwdjN1aXNIRkppMEJINzY2NnFRandncFRlZHZ2bG41Mm42?=
 =?utf-8?B?YjcxenFxQW1nQnRuMFNQUm9aSHhoRVpJQTMwVG5YUkNUTm1icWJMVHhwUTFD?=
 =?utf-8?B?ZlN2TTlYanltT1hVekRQNzA4ZlVzZFlLYVJIdzBTN2ljNG1FTU96SGpoV0Nz?=
 =?utf-8?B?c2tNRTVnUFlIUjQzNUY3M2daemlXeEFjd3p3N2JRbEt2dkIxQUcxNm9TbHRz?=
 =?utf-8?B?YXlQVENGSE9UK3RWVTNCQjIveU5NSVAxNzJvRDV3eSt2RENjYloyUGVUUEk4?=
 =?utf-8?B?aGlveFpUNS9xREJkMEd1Y1VnVlc4ZFZVdjlkVE9NZTZ3R0R4cnBnSVRFNVhz?=
 =?utf-8?B?ZUJPbEdzNE1JK2J0dE0xaWRZYUxOQnJod2M3WHBhOHQ2d09LRkVNTndINExV?=
 =?utf-8?B?VzlMMXhNWXptNmZ4eEVMcVhLZEg4bDNKUXQrcjlvNnRvUW5senhXcDJQdzVK?=
 =?utf-8?B?bDJUWnFRSkIrS1FObHFsenY3Y29DYmVXbEFNdmZndDFSZzRHMzVJRXVKckJZ?=
 =?utf-8?B?V0xKMitSNzZYNTlQNit4SEJnMTFEY0Q0R0M0a2F0U1IzVDNUdXJaYW1vTXpT?=
 =?utf-8?B?cVB5WXRpWGR3cXNmeWhuUnFCblplZnVRMGdzRS9ZbjRtQUxkK0c3SHgyRG9y?=
 =?utf-8?B?QUlnMEdpQmVHc2NGUHl3K1NqOGN2WUFLZXk3Rk1nY0prR2JyQ0ZqbGx4SGFi?=
 =?utf-8?B?YnFFV2FQQmNIMytMZ2Faa3hJK0JQS2ZUSEtCcHFZNXdYSlc2aEdmbmx6ekVv?=
 =?utf-8?B?THMva3BsNmIrazF6RWdSajBzT1g5THpmOFZVcVFta25uN3NrVU96U0gwYnNG?=
 =?utf-8?B?N3Rld2VsRUVUbUdQUzNxdG15em5tNGR4VVRmeWxFV2JjaVZQV2lJUTNGWUVL?=
 =?utf-8?B?aWd2NTRUbG53RzQ5RStXUHVScnhxNUpyanVxc3ZFSU51S0ZIK2JsckVKbDJw?=
 =?utf-8?B?bzlndktOVS9YYW1KUVcrN0p4UmMrblNKaVhZZDZZV3dWeXJ2NU5BdkFLY010?=
 =?utf-8?B?UTNKaElqMG1ha0dsNktaUVNBYTRTem81QmlCdkNNU25TdFFVK2pPWUNaSjUr?=
 =?utf-8?B?RmJLVXZ1TVVacFZMOU9aNXB2WUxORzZuTFFpSXBGdjNvYVNyc2lxbmo0ckJm?=
 =?utf-8?Q?wznMhR7cxfp2Ehx0=3D?=
X-Exchange-RoutingPolicyChecked: wLrLoZfzBZEVFW5Fjk7IZzHzDiyjni6+ayqzlDHl/dQtpE5O3K7lRRQgskEdfz+Ugk3S0dHu2TJHsqR2aXaCmjoqS2ubevEgkYoBrF9uI77Yt8FAhN1fPlyziY5lBTxF1HKn0KctsItj540F3izhC6atGt3s13iiDEUMj4kTMUG1C5pjDSdK6f5ScoWOnmmTsbYR587xw6BVQQ6KXeIKIK2+OaFIRKkX7ylyENezZNy7+6kk3uGeBsTx4I3OPDlFnrd9j+ZEJTWehAMREP7rTVoq0/p48AnJVJ8mLlUlUfULCbM4UeE8/bCU0py7n9XKW//MVBamzYdycsaHGkwsLA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7fc7db-eb38-4552-1a12-08df23962e30
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:40:04.1354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FGOMbV+fEHHEe/4Qq2z7FJbuHv/DV6ABFT0s+RqHF34UFBxtPhup90VUDx+JIaFuFkNm7J2AxJzp1bKuFF6qWMmFnPY5fo4rj1dZgK7wvfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9394
X-OriginatorOrg: intel.com

On 10/6/2026 12:16 PM, phucduc.bui@gmail.com wrote:

> --- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
> @@ -318,8 +318,11 @@ static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
>  	ret = snd_pcm_hw_constraint_minmax(runtime,
>  					   SNDRV_PCM_HW_PARAM_PERIOD_SIZE, 1,
>  					   MT8188_MEMIF_DL7_MAX_PERIOD_SIZE);
> -	if (ret < 0)
> +	if (ret >= 0)
> +		ret = 0;
> +	else
>  		dev_dbg(afe->dev, "hw_constraint_minmax failed\n");


You can reduce the delta by leaving the original if-statement as-is and
following it up with:

	else
		ret = 0;

> +
>  out:
>  	return ret;
>  }

