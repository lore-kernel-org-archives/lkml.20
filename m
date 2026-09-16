Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABB654A7E7;
	Wed, 16 Sep 2026 14:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569754; cv=fail; b=LIExn7oIZoJcTAAsC2dCPzKKJUX8uWfGDI5T6GZKpej3ZoKBNhml9WcdyKKSuduZlP7GqD3GaftD/CstcMauroSJMk/lw0pzyO//LsjfQE/AB8D8s7w7lVI6zS88vYZ90n7XSIQLWP2xYHwEYKM0pX9NFWld2VV0/UOoA1ttm7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569754; c=relaxed/simple;
	bh=9dmWElhd9aP4uiDu+l1cDkbujHv1zoo4zA/M84iP8OM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=svb3rkB5UJHSfePv2Zioa++9QcIYOuykOhQ9b84Uk8AtXUqvhMPtb9ko25Ox4gU++kwvMzUBdPCG7q0eEYmwoq2RELxax9J7x/vQF4SkwpIo5FGZtz7MBnX63kbAUu84wBCvbjVWtytpSepcv5iYw/Qg9UsdZ/87YZy9T97ptkA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT+AZB7D; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT+AZB7D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789569753; x=1821105753;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9dmWElhd9aP4uiDu+l1cDkbujHv1zoo4zA/M84iP8OM=;
  b=jT+AZB7DBO0HFtt0UIYEabd7/fD7pqqP8BFNhx1jMmzEpoTwhrcNVW6a
   KA1C+VzjxnbFS1BEipyWbZb2K7CvRrXoyHtuHST1hpxs+B/eXe16r6ynw
   f0s0RZ75evB7zYMlwGS0il75dzaJs33p51QiAv/2xWTLMpiJDgPt1Ow1i
   bfDFTIRA45ABvsgAlYwXoZIhJxVASTT08cuQ5lcz9E/4eBJLRd7B0/MIO
   EWfqB+r/XF2TJjXXfiKkYiSTQ2bu3VFLsZN0zPLV7KwV1V3rT/MAxNIgX
   gjPGNku2e90S3nL5jVKSjTEo4U4XT3ZQA2yZikaoSvWbH/+e+0Oxukuyb
   Q==;
X-CSE-ConnectionGUID: 8dtj2/9vTnWu4MSDGEDw7g==
X-CSE-MsgGUID: u8sX0FCFSSOXYw3BxYlnbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112713593"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112713593"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:42:32 -0700
X-CSE-ConnectionGUID: VnQW+TCZSCyB7ANg6BH0wg==
X-CSE-MsgGUID: VvtH3AxARtO7FAGSk3VNDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273335029"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 07:42:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 07:42:30 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 07:42:30 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.8) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 07:42:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbEEX01scK37IMrNCNcYJ4ub+i0XggEem57z4PBHMnYkeHAenR4e058oNzz6bawQlvSBhgm+XXLQnOQnUxqrB5SEMsLEdwU+Rwck4RlkgQ1oGfl6cNOhFeiPIBiIn2O1L64fOd5NuIiD49PUWpzjeaTaG75r8ADud1GcHE/kJ0q0QxVxgz3cJa6yaFcmhql/weuBzlC1NDsJprR4O7gTzuNbqYa7iLbRxmj4NA7lWRC7xSDdVLW7ukDgZovwtkFqc6yQNIAiOUu3BKsz3Z5nQSjxmWgnpPUdQdRs25xB8DrYkNIgXtQTUjYhfef0ZTaJb8ok+sW/kqimbTODI9Fddw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tmg7XwPeVBaVcZtwpzXxPCHHHj93inpaZe1mmK8eqV0=;
 b=xAPfujNeBMcuC9UUX3sStxF5gOXIoLlyjQyBgzRqwasrNERfaEiExy+RvMt17ZhXfbRW4nS0o26vPzyyfJ6jN+D22SeuyjXsVLvWTh5Xs3InQRmWC35x4TXeMgqf+Kg+BuQNl1qVHiY/Xa7absSlvbFEkbBAUAmhP/INdVYN7zOjGqV/PFgPHKVgLubqVuJLb60iD7wgqEUbKlXe77klMvLL2Lxbljo6Voz3MDypDpmtB2q29mAMXgJjP1AIWiu1Ay/9Q4Vx1EWPNZpS1odBabuXJgcmOibafY4IghMpOa7OnShlXOKtFWMqk3y9Lyrn5scVAdvYOdism5gM99eolg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH0PR11MB7587.namprd11.prod.outlook.com (2603:10b6:510:26d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 14:42:19 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.008; Wed, 16 Sep 2026
 14:42:19 +0000
Message-ID: <6d89b319-f5e4-4314-9970-a7762d3f3bee@intel.com>
Date: Wed, 16 Sep 2026 07:42:16 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/resctrl: Keep mbm_assign_mode in default mode
 at boot
To: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	<tony.luck@intel.com>, <bp@alien8.de>
CC: <x86@kernel.org>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1788545152.git.babu.moger@amd.com>
 <176d53626058ae97c4003f77ff47371628da9f1f.1788545152.git.babu.moger@amd.com>
 <69044bcb-e606-4f7c-be83-2188169ddb51@intel.com>
 <e5d60b04-6bd4-49db-aee9-49983be17c71@amd.com>
 <5e8c02f6-4352-42e5-83a8-f6d589278568@intel.com>
 <02254e94-35de-406e-a40f-f2a566d1c4ec@amd.com>
 <2b2c5fed-0a4e-4549-977a-4eb9b6f27b70@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <2b2c5fed-0a4e-4549-977a-4eb9b6f27b70@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0060.namprd04.prod.outlook.com
 (2603:10b6:303:6a::35) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH0PR11MB7587:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b5b748-04f1-4e64-42b7-08df1400b5cd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|23010399003|366016|13003099007|3023799007|6133799003|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: m7ULyjbKSepiMidVpB+g1E4bS3S8Nvod0wp7jlsr/ckgw+9PXfLx9O7yTMqWp/m9N3bJmUg7gMLtZxhO0yptBmVuNnPeCu3ZoLUZq53l1moHh3dqIK+Pc4dXc8Nhyu0Rym5V/6hInuuj/ptJFTtnIt3tl5z5G4VBabQXUI0a1dMLWsYVLpR0R+9mVEHf4AGjAUuGfjFED1cak9SO7r+6NosRnGnTDAv+a7R+aCxGijUg+8J8pkxR/6ECuDJwIht/rJFSkC2+qM89gdAI3qNynjrXm577FTP5pk5kvKsuQyrHSFRrDNjwXe0AXsefO0FXT0q+W/YjqI5d/xeQlM7cxakf3wuJpOfUTzvanYeDDjlICefBxD5hl9LDIxWyuIDh0ma06lp7fbRHbZ0ZqfCr8sYZVPRmtSJqlaYSOodaje/Xxjim0CL2K0nPWKDy0Ttd4C5a98rfthUF6cHaBZCBCDgQNnPbuMMcipnovPCRiIpCMKU5VYOVt1NbC42hnizteYRYvIn2BtJ42w++eWsTbOqzZRhJQwiRSrO/AvmGOqE3rQUO1cZxI4AAaDZCNQ0Oe0BSC8imWKSaxz/Hij36HsWuuu1hV4LQA8Po/TfnGL8xfdzgml4HhKrD5Gf4P+2M5pzVQssJlhIPunisRoRxFKu/S730IGZU8Lc9BdT7RuE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(23010399003)(366016)(13003099007)(3023799007)(6133799003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OS9xOXN6eGMzaFNDSWppekwwN2YyRnBnM3FZUFNJODY2R3RZZGd6SWg5NmMr?=
 =?utf-8?B?YmVTKzJuUDRVV3c3ajRNS1o1aTludFVEVlpvOE5HTFc5SlFLMm1JcTdtQ1VN?=
 =?utf-8?B?QWRNbUFaSkNDRGVBNHFESE8yNWZBVGRzMkx2V1ltTkxLY2FHNGNTeHN1U0F0?=
 =?utf-8?B?SXcrcmdtNUV3Zm5jWEdZM3Rlb0pscXFYTVkzK1liMGNjeUl4cUszSVQ5a2FC?=
 =?utf-8?B?YjNwblBMQTRVWW5wVFhWZCtUdHNkYUx5YTVxRU9LN1Q1RGZsQk8wbURzd1h2?=
 =?utf-8?B?RGN1MzlTQlNWalFXakU5dFZOdkFGRFZWSTNXbWd1aElOMXJzUnhvS3lCeFd2?=
 =?utf-8?B?QTdvMjlZMldGZ1k3N2g2ZzRvL2swOHRDNjFvWm0rRE91ZGVXc1pPYlY2bjJT?=
 =?utf-8?B?T2N6eXYyc29XS2gveXNWVHJiS0oyYW1ER1l5MFpzdTBwbzcyY0ZwU1Q4SVAx?=
 =?utf-8?B?MlJSYmFLR2NxN3ZJZ1psd2x4Z0NJdTE5cFZRUkFnTG9vR1NQUGNSYVF6UDdH?=
 =?utf-8?B?TDJqd0tVWjdNL2dIdkMzRU1HbDVtSUltRG5YeDV2SUF2cmtXUmRLMWZKdTVw?=
 =?utf-8?B?blYzbTJrakdkRG5aUGYrMXZhUjBBQ2dLd0c3eDdoTEVyaVRnTkp3d2JHVUQv?=
 =?utf-8?B?UDNsRWFVL00rMENGc0NFbGg1NXllS0d1TU5oVHE1VzVkRllwaDdlYnBJVlhB?=
 =?utf-8?B?RE1VTVhTZVVYbzlGdGw3T25CNkQ4R3BDKzVUK0VkaDdsM2lGZU11WVBIY1J5?=
 =?utf-8?B?UTM1VVl0aytCTWphRzRBNDJrVzkybHZIejhJejJCaU1GbjJDVzlyK1Vtc0Jy?=
 =?utf-8?B?SERrdllySGtKbERPRjYxc1NvMHc2SU5tVzFJeDlySUQ2QjJjUGJ5bzZWK2xt?=
 =?utf-8?B?V0l1aG9KM09jbEhSYlpHWVJLU29tdG9kYW05YUhaTVZZOGxUQVlrSnFScGcy?=
 =?utf-8?B?MVNKdHRBemU4b2U2eWovRGpjTXFBTW5qUjZ2c3g3V1E3b1g0Z1Q3Mk9ISjFS?=
 =?utf-8?B?TFk3dmw4VVFjMVozaVJOWEI2dDZHc2Myb0FMS3kveGx1YW8vTFBzVzFwWCtx?=
 =?utf-8?B?a0pKS3QzYit2djRYcXRENUdQeXZRU2VRTkdCNmRjdDRYRHpOMjFjdWcwZ2VG?=
 =?utf-8?B?Y0svZ1RJWlpBVlZaMEtDSmpla1U5TmV3N3BDNTFtOWFJYlpFVFQwTGMzbitr?=
 =?utf-8?B?QUt3Z3NCZlpTMXp3UUR5OFZBdEFQR3pDK0cxaVlBUklLeTEyaUNVazNmQTMr?=
 =?utf-8?B?bFZMQVAvTTRsUkJNcy9vajdNSGFROW8wdXdQMy82Q0lZRUJuYmVqM3J4UnBp?=
 =?utf-8?B?MWVNU3lqcTRzN1RpRFpGc21RRVZkbVVKbm9jRkFKVnRLUWdYVTZZVjZROHZW?=
 =?utf-8?B?S294U0ZXaDAwNWlUTXJGWHJjU3N6T0xYNGQ5NXJxQnMyQ29TYVh0UzV1Si9o?=
 =?utf-8?B?T3hmVVBNU1FFLzF0SFRyME1NOGlUaUJ6UHd1ejZvZjNNSXlWcmVvRmYxUWNS?=
 =?utf-8?B?YnNCZ2szRmM3UGhUbUtpSWg0SFZuTGlyMnpwTU9pd09hcHRsMEZ4Tk9VT004?=
 =?utf-8?B?Uzh1UnRTdUFTQzZNS1B3eUk0YWh5ajBjVUFUcmlsNjFIeWxRQnB5WTliN0ZL?=
 =?utf-8?B?YXVNK0huekMxeWVhNTlMZ05SUEF6dmdFTnRRVTVucUpuQ0dpWjNXQVBnclBF?=
 =?utf-8?B?K0xteTZXWkp5NFA1djAzZGYxSzRDM21xeW5MOW1nbmJxM0k1SmxMZzJyMFRz?=
 =?utf-8?B?cUNTdHNuVTZRV0h6L3h5Vm9GRFNSRDQvMVZJWFVQV3RPQWMzc2FSNG1OVHEw?=
 =?utf-8?B?YXJScGpQWjdtWStDcTFOcXVBNHZ1RTVYaUx6VEJPQlVzM3hJeStub3BhdG5L?=
 =?utf-8?B?V2l3NnZyMmhBZDQvbDgzRGxEL3lYWTFFSGNhRmRYbUpXSCtNeUl0TzVEWUx4?=
 =?utf-8?B?UkVURHFpckwrU0FvZGFOOFYvSjRINk44QnBNZ1lVeXZ5TDFXUWpIS0EzSzFQ?=
 =?utf-8?B?MlAvNi9vQ2JLazZ2RU5adkgvZGtCbkwxTUlqVVdLTlhmc1Axa1EwOFRFbWM0?=
 =?utf-8?B?VGFtdGpFbXAxTEVma1c4b25HVm5lSzViU2QxNWY4V1lZcnEvWVVSMkFLTVFv?=
 =?utf-8?B?b2ludU5pN1czam5JUUcvQk9abjV0cHA4TUN1UXVpTS9EUnlzVjdBMFR5TFZO?=
 =?utf-8?B?OElONm9tMmRoWWtBSnY5ZFloSW9kRnIwbkdyYUlKSDQxSkVPSU93RU0yVEZN?=
 =?utf-8?B?N1BxR3d3MzlZckZpWGUwaHcwVCtKTjZOVXNGdm5hOTFIK2V6R1NKTjlmem5q?=
 =?utf-8?B?TVlwYkdvZ1NoN0tLbUVFTWxaVEdiZ1ZpYWpBTWVwT2J1S1V4TGJiTWg3TmUr?=
 =?utf-8?Q?Xj3zzxgNvjSA2CNo=3D?=
X-Exchange-RoutingPolicyChecked: MjfDo9xoXUhRJZY986wET3MxtQJzfU39eZTGb6gHmeAJVRCMbFO4x0YCgmZ+CFrMYvhR5GzO4sMk8QRztjUH1G+rwQDNrW2gu897NXueumdlYFbFtBScV560w6wtAo9bCh2QLYOAOzg2K2qCZu0CUDlKyN7nUyeuoMgXL4iQtsR+vSUbopB9U1M3/9drqyHym6yUYyYTd+84hPaT5qzPB0T1Zm8Rn6QutVSc3cQXzwHSfpQNTwxKTFLJPR2oH9LmYodBuGIFiL/10QxC3vHW0HQLbp9KCdpWKGMdlxTBgH87aaXCMXfzfLsUixH7alf339oMcXBrHsSV0mgnNavyVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b5b748-04f1-4e64-42b7-08df1400b5cd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 14:42:19.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZNQVFPIWS9S6d8ay8jrNbW099EDTld+fVQGYdE/WNu++0+8+azGPwd26S7nqfwagehmCYtFyWRoRLH4u0LABF4/jOimT030MfAKvmw35KQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7587
X-OriginatorOrg: intel.com

Hi Babu,

On 9/15/26 12:59 PM, Babu Moger wrote:
> On 9/14/26 20:11, Moger, Babu wrote:
>> On 9/14/2026 4:31 PM, Reinette Chatre wrote:
>>> On 9/14/26 1:45 PM, Babu Moger wrote:
>>>> On 9/11/26 17:25, Reinette Chatre wrote:
>>>>> On 9/4/26 11:06 AM, Babu Moger wrote:
>>>
>>> ...>>> systems with limited MBM counters and breaks existing userspace that
>>>>>> assumes the historical default mode, including the pqos tool from
>>>>>> intel-cmt-cat [1].
>>>>>
>>>>> There is no record of this breaking pqos. *you* created [1] *after* you
>>>>> submitted v1. What a strategy! I mentioned a couple of times that this is
>>>>
>>>> Agreed.
>>>>
>>>>> misleading. Since you insist on proclaiming "we cannot break pqos!" as
>>>>> motivation for this change you have to also disclose the consequence of
>>>>> this change on pqos followed by motivation why that is acceptable. Specifically:
>>>>>
>>>>>      https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5- c62b244d23cd@intel.com/
>>>>
>>>> I can provide output that demonstrates the issue, where the event counters report zeros. However, we won't observe the large counter values because the hardware resets the counters after reallocation.
>>>>
>>>> Will that be ok?
>>>
>>> No. This is not about hardware resetting the counters. This is about pqos not handling
>>> text return values, for example "Unavailable" and "Unassigned". This patch only
>>> focuses on pqos treating "Unassigned" as 0, but in "default" mode "Unavailable" will
>>> be encountered and pqos treating it as 0 is more severe.
>>>
>>> Consider a scenario where a counter is re-assigned. When user space reads the event
>>> value then it may see:
>>>
>>> <return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...
>>>
>>> "B" is computed by adding the new hardware counter value to A. As you indicate, hardware
>>> did reset the counter after re-allocation but that only means that "B" is no longer
>>> accurate. "B" is still returned and it is still larger than "A".
>>>
>>> Based on above, pqos sees:
>>> A, 0, B, 0, ...
>>>
>>> These jumps between bandwidth counts and zero is what pqos perceives as wraparound that is
>>> presented in the example:
>>>
>>>     https://lore.kernel.org/lkml/77f77d02-fae7-401d-9bb5- c62b244d23cd@intel.com/
>>
>> Got it. I can add the output of the issue. Something like this.
>>
>> TIME 2026-09-15 00:53:46
>> CORE     IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
>> 0        0.76         60k        32.0         0.0         0.0
>> 1        0.45          1k        32.0         0.0         0.0
>> 2        1.57        107k        64.0         0.0 17592186044184.9
>> 3        1.62        276k      4928.0         3.2         0.5
>> 4        0.53          1k       160.0         0.0         0.0
>> 5        0.63         39k      1664.0         0.2         0.0
>> 6        0.44          6k       128.0         0.0         0.0
>> 7        0.50          1k       320.0         0.0         0.0

This would demonstrate how the change impacts pqos. Since the spirit of the
changelog continues to be "resctrl should not break pqos" it should motivate
why incorrect wraparound like above is more acceptable than returning 0 MB/s
when counters are not assigned.

...

>>>>> Although, the earlier text is "up to 64" so above attempt at guidance may not
>>>>> be correct and there is no knowing how many monitoring groups are guaranteed
>>>>> to receive accurate counts?
>>>>
>>>> That is correct. We can get this count by assigning counters
>>>> iteratively until an "unavailable" response is returned. However,
>>>> the specification does not mention this behavior.
>>>
>>> This is about determining the "magic" number of RMIDs, not about counter assignment.
>>> User space does not do any counter assignment here. In this case user space can create
>>> monitoring groups up to the maximum number of RMIDs supported.
>>
>> Little bit confused here. How about we revisit this text again in v3?

Sure.

>>>
>>> This would only be useful if all hardware support the same number of magic RMID though.
>>
>> It
> 
> Sorry. Response cut short.
> 
> How about we revisit in v3?
Sure.

Reinette

