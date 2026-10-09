Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F67D39185A;
	Fri,  9 Oct 2026 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534456; cv=fail; b=W7d1vpu4CMR6npQdQ1PdgcqzLbA47zlnny8kRJtUbDh4OVs17oFeyLdp6f/ydDdhAAlt3BwgQ84njdiL/O9cz6T19Hq/gGkzDAGFU+2V7aSzcg+pXN+FKEzulKRjbYA65ShQ6HiRKqZ1VCV6KkJbp9ae2QVodeIysiFbARO39uM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534456; c=relaxed/simple;
	bh=L2bHCmJ7kVKCnsQb0xr7b6Efz7P+JsSKFXbJVKWhFM0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WVgdZd3RRN28zccNiUpMEiZ4irq72xh47PHXGK7+W9yOubgexrzR2UzYdJJpRSymx68o76eDs8SdwwCYLcNbFnZi1ijzmjZNVta7a1C3TJ0WntuHGwadfFIPjRMC9WOmWUlGGSnvjGOUhtRw+aCHzt4sTZ7FvtZQDeLOaTAJ8j4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lp0XsswE; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lp0XsswE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791534456; x=1823070456;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L2bHCmJ7kVKCnsQb0xr7b6Efz7P+JsSKFXbJVKWhFM0=;
  b=lp0XsswEpNQL69kxRrdMJmhaxFcp0HGgDFf/Hk9i7kv5K74ngzlPNz95
   xibPFAlFVHQ7Deps/GmvX4l3dYDIg0mkWNGrjnzY/4wlWj0M4H55qqIxl
   tUqpqdMd4sYgKN7gV2ZJ7QNSdv9gGItYfF8ShnjuyG/YZ0/67d7FTQ7SF
   57FO2Bm5sf13pAD+A2ES2pcGApnpHZqtXF18BeiOUGXQ8fUgNFv5bk3GO
   oGxk2U9MNuQThzvCWunW+404sgmvTclKaxanE2hMtjuJvOKfgWyjbwXvi
   sf9I+VKt1aOPdq/1YP9PG2scwSxnJUVc9iFBj1tgGAHL4o2IQG9AFCj7z
   A==;
X-CSE-ConnectionGUID: THs8aTr3QyCq0G0YbGkgVQ==
X-CSE-MsgGUID: oQkgrhTgTLOoqXga6PMJjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="335378"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="335378"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:27:35 -0700
X-CSE-ConnectionGUID: cYC2/OKeT8q7ZWo3rGKhkg==
X-CSE-MsgGUID: ORkWkIpkTVaUfoV1GYLAZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="250881"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:27:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 01:27:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 9 Oct 2026 01:27:33 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 9 Oct 2026 01:27:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HlleQCU6sZ1K+ln4m5zrdaZhwH9WwcYvuu0SesQ6iNZg32H7WbU9UMjOZHmuKx/InyPmZbncSynq8zLgd5XhSYaTkL7rd8usVnr48h++FFCyevxsR8KfrvdNT4qhv2URwlXfd0Hiww6SnaQ6tzItD6r18I5kZabX2J1dRLAu76DADwSY1kVXaYv5LiVc7LJmv5hInwQ9vyanJN0ar298dc1Lck6ao2EzWtROmUY/fBrNj4+j5BGYNydT0hgk16pa+/pbA4NH8Z4OIOaTAwM6O0TSNTKFrefwkbqSmnFHZzc8uRxx2ToZVpj1SDQmkgd8yPECvCD7Tbrg6Db27W4xHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuFFLmEf7awupKgp7ZiqAJ2JpB41ZMsTdfiLTF/VzAU=;
 b=est8EbF0fXB4p1qWWQcw5THXoJdnIS1aAjHcA513s4ZWT5/tYBstiuXzGG4pDsA44lQY5cGoFHAqJH48S4jypJLgTsE7rnNIUZqKNqfWjsbHDBV2LuXuAA/Ruxb9DULzeuY+JsWZ1e6mbm12XNPz9JMtXFiSTf33RCSb8rfON+wHzVB0IE8eRvxLyv0LZt/WicNSSY4NvpG2IyH52PQOm5EtVMPhwR9GSQKqA0mmsm/JEiYE4rxzCtUPlqdpwvsDxTVrgAVUt9bqEd0sx8AMcStt11/6pbXx8yyCmuiTgrdEgsjvykzA1e4zbeByi7ykLBpiRewYBjbZ8v5vOHTQ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Fri, 9 Oct
 2026 08:27:31 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 08:27:31 +0000
Message-ID: <8b0a2ba8-d50b-409a-ae7a-86aa5032c131@intel.com>
Date: Fri, 9 Oct 2026 10:27:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] ASoC: ops: Introduce 'soc_set_enum_kctl'
To: James Calligeros <jcalligeros99@gmail.com>
CC: <asahi@lists.linux.dev>, <linux-sound@vger.kernel.org>,
	<patches@opensource.cirrus.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
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
 <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261004-macaudio-v2-7-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI4PEPF0000013E.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:808:1::888) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH0PR11MB5190:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba04fe4-4aa5-4254-6e10-08df25df291d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|10067099003|11063799006|56012099006|3023799007|7136999003|4143699003|22082099003|11062099010|18002099003;
X-Microsoft-Antispam-Message-Info: okXV9Qy735Omi+YpQ1ArhkxDExWT3YZ9lKWHy0XjWYdYHGIrCeNrEgR84eaF2/TvGutVsEub+NuVl9dzZNozo2XbE5dY163R7KumHSLInM/jdKPhpIW90DYIIp29XlfgGH327m3/GPwAGU64RD8+hgz2JYvxfdosmvQ4f1OfV8hUGcFaShgAOfRWm9Epd2vm0d+0vhMJhb3bZovpNyDe5XGefhGjXgcIJNR/v1WzVo0Aoh+efNy4GSVGHcwYGr5GUtEDi4cF/J+VVIR2t6tFriJp2jR3Xu2E2hBqdzNk4g8hlW069Dj2nWRzkvEvwGHtp/mVKKaLS0xt/t3G47BBgrqzjLD9jIra+xjwcfX9nkRA8w9kqpRrvpOziQPIyMcgu4ityL8YvEavFHVtEwbLpBEanDTQlVAOCLPk0TByo0EeR6mvVV9UpZEGQuwk4g4Nebwzv6v7Z2Ps1zL4yJ9DUoac1E3z4gmR9LjjSHJnmP7UKFiVNpKejEM3TTXVoH0eU/eZap5FfCYpbYX7u75oQCZqupGL1AzRzaVmOn9QUYvhStVlWR7ultzfLSCkj6Vc5ItABcviZP4bU4mVl0FrZvG11XcCsHDoLy2h4/3AD/1HZLQhZ0JtN7BQIhXJDx8icj/vkdSGNF7jxae2m8NeWdkHDg0bXVFlSCy0iDKe8kM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(10067099003)(11063799006)(56012099006)(3023799007)(7136999003)(4143699003)(22082099003)(11062099010)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REJ4SkNoSmc0Rk5vRk5JTXBGRnBYaXdHd2xYMjdIYVZhWVpqNHVMMjlaRS91?=
 =?utf-8?B?Yjk5MkxXVmVBTW1JUCtRUjV1Q3phdnRSZHRhTUQ3S0E2NEUrenNQV0ZadjJF?=
 =?utf-8?B?M09jOWJyYnliR21MY1V6UE5lekZvdU5OVVUrZlQxeXBPcUU4ZWhpK2RvSkla?=
 =?utf-8?B?bnBKckpVMitDdVNJZU1rMCtBbTZTaE5OU2hPRGFac3hmaVZRSHB4L1phZE9R?=
 =?utf-8?B?UFI2RVVDaWdkNWZrTlVIQXFaTlpoREVoUGJlOVpPdHlsLzhCNnRuZHM5VTR0?=
 =?utf-8?B?Mm1yMkNJSDlya3ZGOVFlQ3IvR0dVZC9PaEkxTGdhYTJUVEhGcXlNdkdGYXd2?=
 =?utf-8?B?T2xOTmp4N2VnL0t2RkdFY0M3UjVVdlluV1lMTFF5R1kwN1k5NWhQVVRKWnl4?=
 =?utf-8?B?ZHYyWW4xVE5NTEpMRk5uNWp5WE1ZNDlYM2NQdnhLMStKSkV2cnZnSUQzMURZ?=
 =?utf-8?B?WEFlZ3o5encya2lmMlpFZFYzTms2TzZOYzJ3N2QwU3hzMWRod01EZTlqTExj?=
 =?utf-8?B?VncwUldaWVBYRUZHY3lmUmNhRkJXR0lPeWs5aHlLT2dmVDVzU2ZWQW44Ump4?=
 =?utf-8?B?eWg1bmVpdlYyUFBHbyttenh4QlAxaUNqYzJ4R0ZRSTN6bjArcFZPRHlwOE9C?=
 =?utf-8?B?QlY5aWF1WVJuZlhrUnZKMCt3V3AyWStVa2FTb01XLzVoSDZvcExZQ0IrTHBD?=
 =?utf-8?B?eEpZOUw2VENkRWpCL2VYWEVsNHRQZDh3Y29TNmRtWVZLazFxR2lsT1BVYTBk?=
 =?utf-8?B?ZkI3S2hoNEhVQllReE1GaFhxSGdUeDVRRUhyK0lUOGhPZlVZdVY3WS9nL2dX?=
 =?utf-8?B?bHVqV0JLUS8rdTRiYjZIYUozWWFRMmpIUDhEY2orOEN4TktZUGp0T21KeW1C?=
 =?utf-8?B?RDFmLzB4clN1Nmt0UzljQy9pb0J0ay9jelgra2JXazRqK285Wmhwd1dzUzVP?=
 =?utf-8?B?bzdkYlN4a0tGTkIxaXczbk9USWNWdVFKZ1BYOVJpK0J2ZFFlcENvSmVRS2ZI?=
 =?utf-8?B?UDdtY3FEb1IzaFcwZzUzUS9sektGMmFXL2Z2MlFZeHM2MGV4MFR2cWFFb00z?=
 =?utf-8?B?dDUxYUh1L2t4VUdLQkdLMUlxRndWcU5qOWtxZUxoU0M0MjlNRnRmSTJxNVQ0?=
 =?utf-8?B?YXNVazdvc1hVRk5wY2cyYVU1MWN2amdqV1RXMDBHcDNlTmdCN25BZWRmZ0kr?=
 =?utf-8?B?ZEg2YndtYlBHZURHRERFZmw0cTFkeklVcWNrb0tBbE00MU1hQkUzTXFZSE1H?=
 =?utf-8?B?MXVSb3pUV1dmOTBlN2ZVelZEUFpvejFuMXVMR0ZNdXpDdUUxMThhbWFYbVpC?=
 =?utf-8?B?ZEttR2RLb3VZSFV4WXFhWVRXRndyZGQxSVVyQmZ4eVBxaEZpM2JLcU9ScGJp?=
 =?utf-8?B?YWU0V1h0UlA4ZTlLQm40YzRnSktJL1c5bnYwa0Q3Wmd1VjkrTElhY2x0bk0x?=
 =?utf-8?B?N25aQ20xK0U1UVNkRG1SOE43YkN3clVBTDV1bUEwelM0RUFaS3VvNnJ4RGJz?=
 =?utf-8?B?Z1lZbHZQRFVlNjZTbjRvNWNIaDg1Sy9sSHA0ZE4reit1c3ZMVmY2ejExMmFw?=
 =?utf-8?B?QmlESlQxWGZYcGR4MmgvTnhnMk1ZMkFlRHJkblhBNCtjUjRLcVJIdllna2dW?=
 =?utf-8?B?MDQrK2VMRDd5bFJsYkNNN281V1B0SVlmZTF1V2dSdnNLSVRlaUswb0NuTmRX?=
 =?utf-8?B?Znk3UEszRWF4Q2VlZmdVYjhCVVl1K1RSQUdNanFMYUc4SW9wdVVtUUxJek44?=
 =?utf-8?B?Zy81cUVzdmV2UlJOUWVQRVQ2N3hmM0hTN1pEWmxZai9sUXJycEVHNThTd09D?=
 =?utf-8?B?MEN0bTJZVWQ3VFRQY01yRkZyWHIwbzlraElWdmljRWZ3L2tud1lwd3UzS0Q2?=
 =?utf-8?B?V3B1Y0RwMlpIVGwvMVQxeTdRditTdkhxeFJFSTV0NHlBUzRZMmJkZXpzWFNz?=
 =?utf-8?B?d3BEOHBCSGdpZmZMYlJhMFZJRXpROU1uVW5GaDBDWW9OSi9wMnlaa1BtaGJu?=
 =?utf-8?B?d2VtUnpsS3ZrZW9vYnlWYVNnUU02eVc1QUg3ZmhVUSs5UFJkYlVDemdxc2I1?=
 =?utf-8?B?UUZ1Z3ZKbDV2QXNWK1NVd2NSWG1Od0xzTmVKWE1vU002SXVSdlFDQUxCYnBp?=
 =?utf-8?B?NVRRS2RERERTSWdQbnhvRXJpSnlWSnJicTRISWQ1Tk9NV2NHK3g3cml6NGVn?=
 =?utf-8?B?M2lxbklxVXduMjVTeUY4VlZQNkZVNUlsaVlVU1NsTVYwdzU2TlNNdG5sbTY4?=
 =?utf-8?B?bjhBbWM5bWdMYUVZbExLV25Xd1MrMWc4N3ViMDdsK1FDNVZ5MitHOXJ2SmRT?=
 =?utf-8?B?cHh6NzZxYkQ5dDQyMkhhVVUrQzI1YzhvWFlnb2JMTUQvTmo3Z2dwd1ZxclZj?=
 =?utf-8?Q?IgnGvvP13RrxUZJo=3D?=
X-Exchange-RoutingPolicyChecked: V938PDJegBHeX0sn7pzibTE3Fl3toIzsmV+ohsTkb5AZFQBBYgh9pGO08XoQ1T8gLsRZav+NX5HoZv4/rlHX9+OjlZNkM4xHuXnMntA+0tuO2gxtCfBlceYPAV2Qs835bXnyt1zYwMluTazpuGBRe6TdIeJOLcLKhPDbdGAnbcJhIesrn3gnFpePG+O8DtOOnLLrCj6exDdRpJSRH1INq21E1C22h3ntfWjzgI4ZG4bb8Jo7/qPHFHE6XaytCBR6NK3eJeLQREQsGB0G1cLpqjQAND5YjoStzuxjNznOS38xFSM1F1z3M9Kx8R63FejLYNawuB4awgeYBH3yCr/+PA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba04fe4-4aa5-4254-6e10-08df25df291d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 08:27:30.9879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrdD5+j6IBJOf/Me1pSED49WvjMEIj1fM7HGyUd1Nz2jPpGLBMssJFxGm0AQUNNbDevvmc+DvqeyLfjJwzmqVw9aPJ4qLgodseRvUQC7Ajk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
X-OriginatorOrg: intel.com

On 10/4/2026 8:03 AM, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> The new function is to be used to set enumerated controls to desired
> values. It is something a machine driver may call in fixup_controls.

> +++ b/sound/soc/soc-ops.c
> @@ -505,6 +505,75 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
>  
> +static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
> +{
> +	struct snd_ctl_elem_value evalue = { 0 };
> +	struct snd_ctl_elem_info info = { 0 };
> +	int sel, i, ret;
> +
> +	ret = kctl->info(kctl, &info);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
> +		return -EINVAL;
> +
> +	for (sel = 0; sel < info.value.enumerated.items; sel++) {
> +		info.value.enumerated.item = sel;
> +		ret = kctl->info(kctl, &info);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (!strcmp(value, info.value.enumerated.name))
> +			break;
> +	}
> +
> +	if (sel == info.value.enumerated.items)
> +		return -EINVAL;

ENOENT may be a better candidate.

> +
> +	for (i = 0; i < info.count; i++)
> +		evalue.value.enumerated.item[i] = sel;
> +
> +	if (kctl->put)
> +		return kctl->put(kctl, &evalue);
> +	else
> +		return -EINVAL;

The if-else statement is redundant here, drop the 'else' part. If fact,
it would be better to check for ->put() upfront rather than when all of
this iterating is done.

> +}
> +
> +/**
> + * snd_soc_set_enum_kctl - Set enumerated control matching a name
> + *
> + * @card: where to look for the controls
> + * @name: name
> + * @value: string value to set the controls to
> + *
> + * Return 0 on success, else error.
> + */
> +int snd_soc_set_enum_kctl(struct snd_soc_card *card,
> +	const char *name, const char *value)
> +{
> +	struct snd_kcontrol *kctl;
> +	int ret = -EINVAL;
> +
> +	/* Sanity check for name */
> +	if (unlikely(!name))
> +		return -EINVAL;

I'd leave the validation job to snd_soc_card_get_kcontrol().

> +
> +	kctl = snd_soc_card_get_kcontrol(card, name);
> +
> +	if (kctl) {
> +		ret = soc_set_enum_kctl(kctl, value);
> +		if (ret)
> +			return ret;

The if-statement is redundant.

> +	} else {
> +		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n",
> +			name, value);

One line.

Maybe just refactor the entire block:

	kctl = snd_soc_card_get_kcontrol(..)
	if (!kctl) {
		dev_dbg(...);
		return -EINVAL;
	}

	return snd_set_enum_kctl(...);

With that, drop the assignment for 'ret' in the declaration block.

> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
> +
>  int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
>  		       struct snd_ctl_elem_info *uinfo)
>  {
> 

