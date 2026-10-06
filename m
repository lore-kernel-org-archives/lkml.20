Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29BA32A3C9;
	Tue,  6 Oct 2026 10:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791283469; cv=fail; b=uyaqSPjGzABoVFS/JtA7gOijQZmefq5pxKu/133qhrosmR3bB5b8OWaCI3lmTti5tNHU//KtqBSIQ2ZhWmNz0jeX9E69YvCMGN58gKxwJYYQT2s9R33RkaNpRUfCvWhHoVHDItESmvLDg5AafgUj6rELDTAg8I1kA4tDHq1BCVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791283469; c=relaxed/simple;
	bh=Mqd/W1jJkqK/xyBupOYjwvSHbXc6Bjp0SWmVHU+7iRQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=aIjRSaID1KIc9KBzYGsqVxZfo2P8o9sz5lPIqo+GTH6ENjzdfKUupVNJ6CAoGSxOMNU2MBUXee7hSh7nhDaOwMgDVEroJPOdxExrSIVBNj2wqUwi3uyGTPk/yCYcDtKQqk3rAAsP+v/RFd60dqtTltFhdtS/YYyX+zUy6SEHooQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFis9rIh; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFis9rIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791283468; x=1822819468;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Mqd/W1jJkqK/xyBupOYjwvSHbXc6Bjp0SWmVHU+7iRQ=;
  b=lFis9rIh2M+0olTJYrlltwFv86yyOO6iQInY++rCWK4I6RF9lIGmefSz
   RMrNLQBr6KTWlj9TVnaJq0HMR8bscAnJjmru78yN0wCIumHHDqSW4+FFU
   ARhet7CZ2MlsMefQUW/QMXed+sDwNPWjlQHYVpS2HEXjq9CUr6GEobe+9
   NoJgvhhe22Wxjdh+ClxJCQtN5gDa0hqJ87AlK6ekhXY9Fvz6N3TAVsmUB
   hwqSuIm0Jk4gNEeAU3V4ThxUbXJdGnbArnnt8cVx+4rqbpYbJbc/L5VbJ
   NlaNr+zGSB87r26IfwtaE27tRmUSJ6HhUKyQp1UfpEQ5od+EupZqCGsKC
   w==;
X-CSE-ConnectionGUID: dwQlH9DBRWup1aowrisbLQ==
X-CSE-MsgGUID: 1PaIIAQKQVafFaB7l+ANSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102639941"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102639941"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:44:27 -0700
X-CSE-ConnectionGUID: fWZ0wrUwRrW+VyIFSRXZTw==
X-CSE-MsgGUID: 3VKAvrhaQLWmLUvh0oAg5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="315139945"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 03:44:26 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 03:44:26 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 03:44:26 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.19)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 03:44:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEGjJ7xh0ooMapJNpyYPgB/bEgiRbTw65+52hl1hsRHqk0L5ONxAdhnYbZXFOx3Z9hGsd2IuheHDV5UsvP8xdnZ9CBl34VUb/lr+SvgJYd2nesuKxtp82gPHs2CBoYhXOXNYJJKDsfq2RRjdpWRVqTBC/1hlgoYvp3rSF1eNJ0Ipsf47oGpA01vNPD2ui9+93DwhNmOpVAL1YyaucSIAABNNjZiH1zYLoVcRC5r7Ak6m66jKXCKSCSFH3sSL8ukcAKxdVumbwYD/cXKlTrBA4V0A5r7eTb3OXt1NEQaALiWEoLcyodXVI9nUEtcTrntAtJSWTiOfSfTEgPdZoY7y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FljVSAbCHnNAWHGdooB3xR113U0yUrgbpAakZ7U+icI=;
 b=XjgQrmcqhMFWgQL0XPFYslTEspDVuDc9XTnqRsFkL70wyHTL4WEujwQfwbvwjgLQDbdqN+qEouNVxx6G9aEXw1s/Hw4aPx73ANwwyNVETAQzuPkyACjW2c1GrI77ujegI4HhTOP7MbG+CZ4sAc+7Kg/I96QZiktNe5v6/QtzAm0kFpUVNUrF5XhHrd0xuTVwnzO9PYBJl8mU43OFaXUdfehCeTMfWg3of2D95Jv5myV54K9UB38DxSbozsKghPzrYskcEaFLGWwwEcoz2q3diYEQ8EIo/O3RgZ/jcv1z0VQRYR86cZqdFEp5KUvtYIEGqKP9n0LTT6EtATs2O4eG6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by IA4PR11MB9394.namprd11.prod.outlook.com (2603:10b6:208:563::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 10:44:18 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0472.015; Tue, 6 Oct 2026
 10:44:18 +0000
Message-ID: <fa9642c4-7117-4d34-928b-f0937becc593@intel.com>
Date: Tue, 6 Oct 2026 12:44:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ASoC: mediatek: mt8189:return 0 from
 mt8189_fe_startup() on success
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
 <20261006101606.54079-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261006101606.54079-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIVP296CA0108.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:355::8) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|IA4PR11MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 209d9d09-f339-4e1f-e94d-08df2396c5cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|5023799004|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 1aDUFMABYxE3Ojfud0dKN4AAOuLw3+58cty7tyfHsUGxKqOeeKJT2mjYdCgKsQmjqnbkhrvgWeL5QkC8MDo503s1j2oUahe33zG1KbDq/0ysfMORrWZ5Xjy/f/EzQv/o+S+QjtE7gUjTahBS7vl1kogj4NbTZIRqx4MkDzS/2t4y74ArWzEM+C0JpI8yfjhZTRtacFT+eXS9wsYfJ1qyXMV+dLmTEza0YCEeGwiMzGSvZRKp3YC7kCpR6Zy5AT4LWayOML1izRIUm7TWZfeF+FDfDOFoviWmLLd3VfSqyDzCFmDfH+Q3FgdmVRRlgps0T9Ua//bvIE14NklGB3lkaLaEbraRW5sb6Zx1jwW9SSkM9rL3QsGT0PdN13uuxUUj3jkT9H7oXB+V4+jxoh5/CFXaD5MNgdErR5qp5aKQEPctws86isHxflKULtk02QWoQOXUKOg3Lwl+V3vDwQ+CEvr+BsKAplZBWbqSueAPZygGSI3EuWdlJQ6ntshH2wNsbnV8xQKXlY7fddaDZZWnaR7gxoNcD64pWwIEhfe+lQW8gsCkimvnVHv/DNKUC9ekA8V7DUsIhE0ckNneIInHkwoTe8hLywsSqIUXwYXxUqs1x6iIuALxxbmdg4enXDjHlWQIpaDUZYh+6WcWdkGfZy/5kegekfD4tKW8QNuWB8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(5023799004)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHFIZ25QeDBYTnhoazYyczVObEljRWdaZkl2UzhSY1pzQzJlMVllRmRNNnlK?=
 =?utf-8?B?YXJSbldaMnJJVzJST0doUmMrcmNPMEo1TXZmQmhoeWk1VmtnRlBEQWVxTWJJ?=
 =?utf-8?B?Vm9NVXQ3bFlzRUxMUmlwbjNCTU9GZGtpYUhHYkdGWElVeEg5TEpzdVhIRkRj?=
 =?utf-8?B?Q2FMSFVnNk1HSmtMZTlkQjlqWnUzS3I3ak4xWGs4WkRoTTFrR081T2hYRkJW?=
 =?utf-8?B?OGxXZFlGNWVwOTNPOHFvRXMzYSttVm1yeS85OWJmdGV3UnNiUW12Q2Z3QXhy?=
 =?utf-8?B?ZVZYK25YUVNLenhNUUNWS3ZMaUpPcHF1ZWIzem5kc1diK2lmMDJwZGxVRk1o?=
 =?utf-8?B?WGw0QUdBUDQreHhOTllvY056eG8xOGxLc0xRSGwzQ20zOTcwcy9mYzVZa2VJ?=
 =?utf-8?B?aW9QSVcrbkMzUnNuQi9mQlpvcm83MG8wNEE4NmJYaHUxWGJHMFR2aUMwSEFZ?=
 =?utf-8?B?cjdsUWV6ZWNVWHpka1FQdjMvSG1PbHkvOUVHOVNRSzJKUzhsSmt5eFJBT3Ba?=
 =?utf-8?B?UDZZV1lUaVhqNHRCbFFzbUx3ODRNaGFZU2hFeHZvUXZWNS83d3hlMTN3MlpN?=
 =?utf-8?B?d1pRbHl5SDRrNDlZbzRYcEQzOEo2UkFlb1htd29GNUVXMUsyNTU3VGwzWFlX?=
 =?utf-8?B?V2xlUEZidzdldWMvSmdOQnRocmdvQ2ppZStraWlrZ2h6RENhL0xETWVsTHpt?=
 =?utf-8?B?SG5IUmZCQ3pDVFBLUmxYRkVDdzdXaWZKOUkrTGw1aklVZ0kwYjdKQnlmQWVp?=
 =?utf-8?B?OEgvNldpbHVlWjVyblMvTGthYVFZVzJjVFR2U0Z6YlY1WmZxc0FQdEpJMGlL?=
 =?utf-8?B?YTVPZzBmY0JYNVVqN29zdU1HWjJLQXFQY3NCMGtNSTkyT3lwd0FVUWFEQkF5?=
 =?utf-8?B?V3gwSHhlVlUzdmVEc0hWMVRDcUt2ZHRuSlFSNURPcXcyZ0xSSzUvUExZRVFl?=
 =?utf-8?B?Vlk1ejhTYmpMbjVZMS84Mzk0OFl6U2JqbDhBUTlGQzV6NHJwSm43RUdBZnds?=
 =?utf-8?B?a2ZPdUZoTE9Oa0ZvNHlsbERlSWZNYlJvSjBxSW4vbjhDN1VjZXROaHk3OGVU?=
 =?utf-8?B?bUdsOHFIY1Y3cjZpeUk3NUcyVk56REQ4L1ptTDFaalZ1KzhNQkNCSkxoc2lT?=
 =?utf-8?B?bDJPWmIzbnpSQ0xvVVhRMFNtaDU3RUlaYVRZK3VsSytFaHFTTVRoMXN2OTJq?=
 =?utf-8?B?VDFYd3JlcFdlSnc2NFVZUnRJKzhPR281elRPYUxnRkU4RW5sRUFuMklEU0ZE?=
 =?utf-8?B?Qi9rSXFjeG5kZlJDQTBPVk5Ba2FrYk9WVVZOMUZYUmdIbk0wM3YxNXRZa1pN?=
 =?utf-8?B?WGJhRkNNdE14Rk9pMjI2WGpmMENPV3FTSmRGaGJRK2JNMHFiNnFBUm1kaW1n?=
 =?utf-8?B?WlhSSGx0SWRZcWlqeGJEeDhNVHBXakxWTWt2OVBYU29tWkpzNkQ4N0VJeVFj?=
 =?utf-8?B?MkZjTlZJU2pVSlJTczh3VnFoTjlybEx5blg5VUFWenVTYXpsRE8xdWw2SkpQ?=
 =?utf-8?B?MmxjempIa2FsOCtNazNRcnFCSnZQbUhadUhOVzRiMHltd1RDRFlwcnd3Tmpu?=
 =?utf-8?B?ZkRNRzNzUzN6dmw3UWxZRjNPdzFNZlpGMS8rekJmcnQ5RDVWeWNMNW5uZ2RX?=
 =?utf-8?B?S1JQNWR6cVQwdStLSkZkWU9TK2VDem9wOTRnZlpFMmhjTGh4bjZUMzQvYm9h?=
 =?utf-8?B?S0hMcVgzYjFxejc3QUhIN0VUbTlLRWRJSjUvc0F2bU0ycVZNQ1g0THRxQkp2?=
 =?utf-8?B?NWp0YU5uMW1Ud29YRVN1V1dVbFkrMjBUVXovOU05UjZVdFRsZjJpQTRQaStr?=
 =?utf-8?B?M3cyRFZWVnJ0NWhaR0NIdzNGTXRTU2o3bDdJVnNGZzRtVmdHR2srMHJGcVhS?=
 =?utf-8?B?MFpicU0xbmtDVnRGR1RxYzJ2cE1iWFFGV3plc3l5OXFqUVBtT1Q2VEZSL0VC?=
 =?utf-8?B?UkhRVFQ5WjRXQkc2cWsxNCtXbmd5cWFsaWw0b2pQY01DV1BNakZyOW82UTRu?=
 =?utf-8?B?TDJrM3AvRHJnV3BGL0IrdGNGWkswZ0ZpM0pSeGpLWGtaUGtUVkZtY1dqMlp1?=
 =?utf-8?B?UjZxeHlsaUJvOWxtNC9hbjhLbnRJL0pjUkpkNDcraGFHSEpjbk1CejExLzZB?=
 =?utf-8?B?QkVDUHFIMVRMd0VRRVBoSTFhNkdWNndIZUM5clFBbVVsKy8yVXlNOUg4bnd6?=
 =?utf-8?B?eGFzTHo2SzF0ZHA4QURzNTUyMjVwVE5nVmpJZkRDQ3BaK25ZWVlOMTRLM3pH?=
 =?utf-8?B?clFIREFTYVM4UE9BYVhvY05WU3pkZXNhT0ZvVk5yaHRMTTlnWUdENi9sazkx?=
 =?utf-8?B?RjV6aDZYczFReU9sWVBNVTB3NUdPaHVOd3drSDlIaTh6c0Z1Sko1NUNrVkcx?=
 =?utf-8?Q?hUGY8Q9finNRlf1A=3D?=
X-Exchange-RoutingPolicyChecked: H9wsAPB4hYx4KRffZsty95AhXRzLu1EMEDJprmVWjKUGUBrArlmqDhGGB+zl+q6vpyxCGYn+b+AjTa7cVLK92qjaXqL6bgjJ4v6v6OSNRvzeZHCWZWDdlHXGHRpugo4IDSIfbkWPCLxCzImYztWAvLGZS+hgbY9jMSy8MaE3Pbu2Bn0uwhjuWrbjw4QGKcsm3vNXvn9sd0CJWMJ9z/x8dN9R7NpeqVL735Z+Rd3OE641g5TJI2moq8NhDQd7ACMzL3/GOsXXF2H84R5TB9syCi/8O9Td71XnWo7bT/7S2kVVkgwhvGVJw8MwPrjco8VBEH2r1zazKs9W1cwqp71tHg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 209d9d09-f339-4e1f-e94d-08df2396c5cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 10:44:18.3146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +XuZfYQ/h9s8iOmUuVe44MpbPbRkAfXb6fBtXm4oizbd4jZrzIrEdh7uV2907DqMf/18F9pKaeX5CVYFLmtrO/+VlRMuwDWZhiN+dJ5Ym9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9394
X-OriginatorOrg: intel.com

On 10/6/2026 12:16 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_pcm_hw_constraint_integer() may return 1, which is then returned
> from mt8189_fe_startup(). ASoC only treats 0 as success when marking
> the DAI as started, so .shutdown() can be skipped on rollback.
Nothing major here, just the missing space between 'mt8189:return' in
the title.

IMHO the title could be made more explicit as you're in fact fixing how
the snd_pcm_hw_constraint_xxx() is handled by the driver. "Return 0 from
(...)" misses the point.

Kind regards,
Czarek
