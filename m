Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F3D39CCF5;
	Wed, 26 Aug 2026 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769172; cv=fail; b=il97bKtcbpfh/lzvvHTBBWLTWwJDbsDCp+dWgmw2PpaP5Xws/rHmhKDu+q8SKdRnHoI2cCmBYziw3YwG6DDtMgq39HCWTOhknMHBBXloCnNpUEuWK3pju/2PDLsA3Mt9ze1cMCF273Wvz9HDGage5KQFDbllzeAA3dq2qz3bGFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769172; c=relaxed/simple;
	bh=GF0Ip+KB/Gj87NtDYDqGuDE9dJvd9RSj8HixU1KGtwE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Xpm1tc6G7Yz3azf337vQDei1+OHZap23ZkCccG+nomD+t1lbKP9A4fUlNcEyfqARd0XrsCaFzbY9wXTpMjnCCzfGKv6w/6//wVWT/wyik5PQmyiUhRkzBMAvB4+5n1wOwFPt+GI7XHewYO7jkYyZsJniLR3H9yjWmr/ryRbNlpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WI+uQfPO; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WI+uQfPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787769161; x=1819305161;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GF0Ip+KB/Gj87NtDYDqGuDE9dJvd9RSj8HixU1KGtwE=;
  b=WI+uQfPOwStFpWXiUgbipQeHecGf0h/jbYp9P7ykee1uHPi1N8U4uue/
   iMG2bLc1y/z0kJLvAnL5j9Agm8m+9li/azPzIvIkKCGyCQrUfbeFRBo2S
   z6UDJ07xB3SJmCcUYcR8A2v/EwyhCj7h6PrExdH0B+BwGc5u2nc+0jOoZ
   /A9FWtAdIr/mTCEqOegiien8wmxgtfT/fMOd8DZ4nid2arDWPn3MgXrPm
   cnyZd8PRgolKX+vb3Cvz+mPlMOwLc5LB0zdN7zNw2j0A5hnsinORuO7UL
   /+vo21gtacrC/kQ6Kc1SOMr6D297sjRzDUoro3fMFo/uf1yZhtXXHwvCM
   A==;
X-CSE-ConnectionGUID: DirnLbaiRBCshB0bRnZmuw==
X-CSE-MsgGUID: yiPqTD38QzOiNXsoTyH2Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="98927524"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="98927524"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:32:33 -0700
X-CSE-ConnectionGUID: bAAj4vVJRbC4yuCYHMzynQ==
X-CSE-MsgGUID: nJWeODXmQZC01fHy9b6LSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="265054691"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:32:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 11:32:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 11:32:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 11:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSeoEPTH2lZlxEjZVzqawgi17gT2D1htXnIbeA13muKB8qPuc6QYL72rXiPEUxK9Uf1lkoz7Fv6RqKo2blHLsQuxf5ajIbfKjhhxY+K+zHYZrQNs9QR6AwvCBnPkUQO1Ji8eLTX9w/AtqhP6oJs5FXLYuvpo/XVyk5ovqr8aTnRfT2RBhMoVHkvRIZNgqxXFaevH926NUXwdiWPsZ3EcdW3HOlAASQwUxZ+DWqF1guS+dA8vJ9PK0gMFrREZa5nc+FbbT6paHikMqHWYS3ffGHjxiizL6/NlIGj+z9kqozuRuY8IsbN4CT0ZXixPVopv21cs8Wv3HzDiAJCNonkKlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VjyNDWZHqLRWbUIHomZUoFgr8KynbUbW14acMpwFgzM=;
 b=Fqms98bhQTK/0BI8l91Z/LslLh3JAxEbCn7XLUthKR0jupW6jsHo+p2nyOrO0z5KdkRtLp63dgeriGtGtA7pW3MoVhRYkKM7OG9Xy+iWRRIw0v1Pu+TuE0JOc1ue6BievM6Bg0b25jXTmebO1rIdAjgAKVG1dNaFmqk4rrPtmoTY1VDQTf41mbhAeBBCNLcE+fYgejX3rdv87X4LvZXV2O5mRYvJBufl+7ZMXcOnzTZUU4ILngrHKjPmgXxZTYS0dVmCyFeAUSkM9VUwd3slfGYwdzWVJJrpb1YSnQMsoZk8uZAAeRegvlI6VtcpTjMkyEY6I6L9M2IodGTU2JsKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by PH0PR11MB7424.namprd11.prod.outlook.com (2603:10b6:510:287::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Wed, 26 Aug
 2026 18:32:29 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 18:32:29 +0000
Message-ID: <422a6bde-21f4-490e-b789-14a98d1833fe@intel.com>
Date: Wed, 26 Aug 2026 20:32:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] ASoC: mediatek: mt8183: Use dev_err_probe() for
 error handling
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
 <20260821122928.41343-4-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260821122928.41343-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0054.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::16) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|PH0PR11MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a08842e-c3d9-4736-b65e-08df03a0629f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|7416014|10067099003|4143699003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: bEOG3ip3yLNEciHTh9CV+dQgnkmE4HGkrdLYj3Gtw+E02d0CJrur1qPAK+FBfq11Z4bvccpxfaiQMaQPn7BTZcZPG1nsi4ZD6rb7IGJyYtNtIBszFc1Y1MeAvmkY6eEd+lLbYht5L/98yd2sqMl94DnHKaeC7Ge4pF9oVvxwifEZJi4c8qwh1mWpTk5IJGCBHbVuLDMmWBMwK9WhuigIrDRQfNRkgFBagvKfupDR8nOllhYHer1dROYwQGZixXRXAap9tkp6VuCZ9VEV9MB8uEUXFO1eo6wl8bwKRN5xHdqNWQnzszzDxr4GD/fQj+QKde8pDZWQDR32AN8P67L3qCUsihXJZFDvpXVuW6e4dkEx4WvabBeM+JzXEIGliQggCnWkvvto83WqPhfKFTO2OBCQxRUcLFYfAAnI96N8JmGqICRJWP1uOcdiZY8gX5viuEJHeCoNfs7IPXDI+GaKdhaHrjiI1jbe+T28x0LX2wVKJXnnrZjNIBzBlTuJtzBjfJ8v66hlNprXB3Nfemr+5oMBLgv8Q1cEKajXYJhkBLvseYKKiuUWhr+O9b+aK1luM6lxqFjcL8ovLBKnd2KPn+kiwjXe2WFdOX+Pkjh3c/Li7DYSsP5VDkSKp/gUQ81m9QRR37sjyooaqVOnwWr0wwE+Zyr46y0vH7kCZyVSKzg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(7416014)(10067099003)(4143699003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjh6bUlLVXRzZzg3VE0zT2lDdHlBeHJ4ZmFUdGYyOXd1dU9GSlV2M1dwY1ZP?=
 =?utf-8?B?Z1lUVmEzNmxFVzlQV3VKZU40WElwVFFMQjhwQ21YSTBWeCtTUDllb1lkSzNZ?=
 =?utf-8?B?V2pUL2RJaXF2TFdWZTkrd2lCN0Nsb2IwenM1ZVJXd21nWmZNd0xWbVRlQVNi?=
 =?utf-8?B?VXphWFJVaUQwRDBsMHkyWHpocGExcXR1eGRwTWh5NVNZbG5hWEQveXl2bjAy?=
 =?utf-8?B?VDJkVkVubVQwVlZDc0ppQnhPaGZhTSsxclM5dnIwSVZnNHowUitXR1h2Qm9I?=
 =?utf-8?B?TzZ4QTUzdXNnTjZ4WFRRemp5MnZRUHRlbWZrYnJwSTlKT0RzZDd6S2Y5a21P?=
 =?utf-8?B?OUlVM2JGdTFiQ0RGZVU0bGRUdnZEZ0RvMnBtT2VJWTJaVHNlTEdwdDM1SWhp?=
 =?utf-8?B?aUZER0FZSGlzWWtUbWlFY2I4UkRHSGFzVDNGU1BSdEV6U3RjbmtSZmZHUzI3?=
 =?utf-8?B?ZWVuWlRtVFNlS3BQOFdWQVlCVnQzWG9MK1YwK2VwaHRUSHVLdFU1aGdsT2Vm?=
 =?utf-8?B?WDNlZGdnOWhqc1pYaEh4cTlDTHBpNm4xc3loZlo4LzhZaVNlZUFSTTNnTno1?=
 =?utf-8?B?TTlIMks2V3BRdm5qakxiSlgrZEE4VGEvNlNmaHRENVRBcjVJZVZuK0JCYVFO?=
 =?utf-8?B?Nm1XWmpQOFREdEMxb3NmZTR2NS9hNFpEUnZVQWZZb01CdDBFc08reGRwVmZM?=
 =?utf-8?B?Qk5EQm9yeVIySnVOem1WZmtrbWgrbzQxZmNXTmhnWmlrNWFzbUxOLzh6UXRT?=
 =?utf-8?B?RzZVdHZVdGQ4TUh6TzNoVFRRL1lJMStEd3EyWnlUWlhxK0IwdnZhU2g2d2dt?=
 =?utf-8?B?RGowaFc4RHcrM0dMVGRRcitPZUFsd0lFWFA0c3UzWHIyZ1B6eUNzUHFQUUtu?=
 =?utf-8?B?ajF1Vm92cGhoSncxNGxvWC9QczY3Sm1Cd0E3WXlGcC9uL01RZ0oveVlRYytw?=
 =?utf-8?B?MVBaeW1Zby9jN0RCMzl2d0h4YVBiQW53QXVHTS9YU3Y4N1VOSXRBWkcyTFZ2?=
 =?utf-8?B?TlMveDVVbFoxTGpDV2toS1RkTUI3ai9zS3U4Q1dla1JSYldTUE1WclRYZ0tx?=
 =?utf-8?B?a0tFYWpEMFhsVGN3UnFaekEwZGpLUlg1UCtnY2w2anNKVFhRd1JvalI0ZnZD?=
 =?utf-8?B?akVOSnBCMGgvMmM5T0JzdDcvVmxucURpZVhRV3VnRjl1R25VR0lFdGxObWMx?=
 =?utf-8?B?SU9HS3E1MytuTG8xR3d5VXlSd2ZvcmRnUHJ3enI2MzRYWExMQWIyOUd3V2cy?=
 =?utf-8?B?UEJyODF6YS8vakFjTGgrTkxGejVwZGxoZXgrRkRRdkY0YzlxTDRseE8yVlhm?=
 =?utf-8?B?Y2VWS2lFQmRRaEl6aDhFRmpVTXB4OHVjTHNoTVdjakloQUsvaXNJSmQ3VFZy?=
 =?utf-8?B?WFhvUS9ickIrZmIwU1FiWkh6b1FvZmI5STV2dWJjbmpySDAwMkFZckF3b0VF?=
 =?utf-8?B?STVmQzhUTURVc2VlclhMZ084Y2l3NFB1U2MrZXZpaGZFVHpnb21nSDYvTmp0?=
 =?utf-8?B?bXpISUYrNTBlTEsrMHdLQTZuR1p2ZG5jdjV4OEVzUWNEZjR4ZlRKSmNDNStm?=
 =?utf-8?B?MXIvOFRORlkwRkliSTVEN0pNYjRUd3FrYVFxeFJkT3YxRktBcmp3N3ZPUW9o?=
 =?utf-8?B?QmRhUzMvNjFpV21pZis4QkJqbGZnbi9zYzE2RVBsblFqT2FRVlp0NG9Zc0s1?=
 =?utf-8?B?cFFvRTRGRVRoeW00OGtOYzdxc3lTakdiYWlZblBGOHk4UmtUM3hLUHk2WS9G?=
 =?utf-8?B?WE5kbGdoODErQUNHdEY2Y2RNakViY1Y0UkZRbTM3Ti9VUmdtN2NGaVM5QTk1?=
 =?utf-8?B?NTFqMjFDQkhkbVcyK0lHaDZQVFF3ck9adzllMmhySTgrREUxNERMN2hHaUVk?=
 =?utf-8?B?TVhIUzRhMUEwZStBdkRQd2JsbEl6bmpYOCtOd2c1Qm43WWFrbG9NTk5lVnlv?=
 =?utf-8?B?WTJpZ2NTMXhRQTF4T0tieHQ3Yk1mS0RIdExNaUhES2tTS1hsREtxMi9HWlJx?=
 =?utf-8?B?Rm1qMXRaQ2JGTmJKSDRKeHZBWm52MFVrM0pNOEVrb05UeVRCOC9aMjNycll3?=
 =?utf-8?B?Tk9ocituY1BsK3VuM0pQeGVqTTJVWWdLd09ncTBPNUVHWGdNYTArU2M1UTZB?=
 =?utf-8?B?K3daMjhRNitkVlZLQmRCV2Z5b1VnTTd0TEtWTE92OEZaQkRDRWJaN0ZiVjJ3?=
 =?utf-8?B?YTJvdVUvVlJCcVY4NHlUUmF6eEZuZ1Q3ODF4dTVWZU92VXBoWGN6WDRsRFRD?=
 =?utf-8?B?Sy9JbFdIakRTeUU5eUxQYlo0Z0FYZEJNQUhubTZvOWpVdnp2dm9DS09rdTU5?=
 =?utf-8?B?VUJRc2h6dm9TV0dyODh2d2w2NncrM3dKUVViRlVjMXBtVmx6VGNWOGFiTFoy?=
 =?utf-8?Q?bwKWRpgpRyJMGkYs=3D?=
X-Exchange-RoutingPolicyChecked: GA+SY024HdvxRi3ozkjWOVVQPbvMILol9RwcEOJOeeBi/AvusuxBC+VmOMBMs50TuJfHvhgNBQMxUYVPls9o+r9Ha7yhnc3uhlQ9H5CJEVrn18vpV+RTIa2NWehHfdP9UaNCGpVfJKwtHE8dVdJlGt/a4fcC/vokC2QyZc+ItCkTpT4roFKtiixjXwVgjM/SoGveS1Y+U7FUZFjvsihCCs8KGl34QeVaiT5cz3Vimrllpqri4PnsrtqTkUEaYo8p7WvcHeWw/kFfRttBhalK922RK0c8Jpczd6BHfAZ41QXfJVOXaZl0wnCDKNEYWHWNnhNwJ9A92sheKzPNksWgbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a08842e-c3d9-4736-b65e-08df03a0629f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 18:32:29.5024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HmlFBxZ/pQiCmgUMLdtb11RAbfezPRM8Qy7q54Pv0I77byuX/yMYcEUnWMEDrPI0P//1dTXB6ZkjH5FmPIeLtybWmCG8Cq9N2HsUZmOa24s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7424
X-OriginatorOrg: intel.com

On 8/21/2026 2:29 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Replace dev_err() with dev_err_probe() to prevent log spam when probe
> returns -EPROBE_DEFER.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
> index 0790d8123179..46cab62220d9 100644
> --- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
> +++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
> @@ -101,12 +101,9 @@ int mt8183_init_clock(struct mtk_base_afe *afe)
>   
>   	for (i = 0; i < CLK_NUM; i++) {
>   		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
> -		if (IS_ERR(afe_priv->clk[i])) {
> -			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
> -				__func__, aud_clks[i],
> -				PTR_ERR(afe_priv->clk[i]));
> -			return PTR_ERR(afe_priv->clk[i]);
> -		}
> +		if (IS_ERR(afe_priv->clk[i]))
> +			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
> +					     "failed to get clock %s\n", aud_clks[i]);
>   	}
>   
>   	return 0;

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
