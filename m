Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E16F383310;
	Wed, 26 Aug 2026 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769087; cv=fail; b=Aj4DulJJ7gs/osLeJZuWX1vRCLJ+DaILoE3xn8QwzOuVqbtiNBuh9m0Ee75ZI/VWQ2B6DmLo7wNxpjhpojh0DxjOCW5A0gRpfI8TyvRYLzLbtU6ZuJPbucoDagV8CKq4avHI1JJRyV5Sffm9MH6TnykWIzjoPPDyimlZLXE4LKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769087; c=relaxed/simple;
	bh=2czOpWYc4IF/MYXYX9yWUXc64MldrRN2LKWPJDu/YNY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nxKEwAqIKAU4ISvV7/oUDhtTbqQge+QL3wnzh1zIlEHfzqJvDIw2FU/TO8NyaumJun/zksCCLH5VLQcjhfbPbGK7PzP/jnPcx5KlrblPFVRm/DMs7RS97DKKwT/lIdnnraBkwJs1y16fLp1JW13+pi55UvAN9dIdGf5BFZ4EjAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Btzd4134; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Btzd4134"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787769079; x=1819305079;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=2czOpWYc4IF/MYXYX9yWUXc64MldrRN2LKWPJDu/YNY=;
  b=Btzd4134NaVf+aL8oXneX+6rWazAz18aIWd1Du06J4TlxyMFltY7azD7
   Y0NNQ+2mHCL7HFGRE4yypihV5UwLUtIgxI3SYcFK/8/okmhD7mZRAkNML
   2sINSKRaSbbVQxXqyyYX+KfE0+z5KsjmdxG/8IGF6cc5gpnG7PuHsQak1
   nlLWpsQqz2Nqit07PG8KT7gP3V1oF+ZZF8Flk8tMGhUNAVk6LQbBfjuRv
   aHR29NlXjwCjijr+CPP4hdOrvFjyhPsxbvfrU22FJYOODHsPMzY+vZRFY
   TIjCa/QMlsvCcRM0srtWqAjbk0HyqbEUyvghxBAVQRYdAyyxA24+8neuT
   w==;
X-CSE-ConnectionGUID: iQFnz6N5RMyMzM8H0BCSRg==
X-CSE-MsgGUID: cBU/aCiiSD6wEb4LggB7nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="105786203"
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="105786203"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:31:11 -0700
X-CSE-ConnectionGUID: WIEfaVjOTbCCRHNR7D7puQ==
X-CSE-MsgGUID: 0/gXwiLyTYCZZjuuCtf35A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,245,1779174000"; 
   d="scan'208";a="263887807"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 11:31:11 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 11:31:10 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 11:31:10 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 11:31:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOqHdBjTVS4haZqMxX7Dlml+zv1jexS25UhghacnYfgPJBbzJft/zT/SledeVZSH8Gyw4ivFHIDy/MKOmXNdWs/7r0KCJPDTnIK6NE/ZugFPes/jJSPYH6p3qdAKz8gBEcak6vBFQ7b8EdHRz4Tj7A0jUQwRlUPoN8MVWzF9xDykKsSUoYkZs183bMizA6jF7x+J2WtC0iZOL5vK1WRFWadih9ViS8c7+uBgp6TGcQMLJAobHCl7Z0sd4xHxDDjDN44PlJoeCOFMrNu5TNxcGCLphIdmZyw9EMpX6oHXS/k6ml6VggerpYOGaWC/nffGGADdQVEdYAn4ChylHUcG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TZW9qhW2yfvu4fedvSbYO/OZ9q1+QcjPTx02afQ/O8w=;
 b=qrzFUDJ3r6lwId38rTKkBLTj/oZXjte495QNC31FuqfOqyCQk6pks5meLk5g5OGJfVE2KAA0OpaSq8MC+B9AHj6lgo/WjZCZqzHEW7n36AAz0zTv6uzmunEDGEtumaUDZnlKeTreswR1Q9p6Zk1KjXcNh9owTev85lIk/wj/Aw4QZmXMDVwhbWTKmhoOjkNWLev9lMHkjODeYIA2WdmZOwCcghSfxPVhq4AVve2jkWgBaWm8qzQ4c6NrjXdxiTc7wjA3xYLbyCpE1PIreLJw7qP1UsptEAkZnO55VLmsp9WkL11S87Jun6TjDBD2UDFHmHuawayWMawUE6OBghYtgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by IA1PR11MB7296.namprd11.prod.outlook.com (2603:10b6:208:427::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Wed, 26 Aug
 2026 18:31:07 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 18:31:07 +0000
Message-ID: <47c14ad6-0311-467b-907c-517ff5044438@intel.com>
Date: Wed, 26 Aug 2026 20:31:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error
 handling
To: <phucduc.bui@gmail.com>
CC: Liam Girdwood <lgirdwood@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
 <20260821122928.41343-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260821122928.41343-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIUP296CA0049.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:34b::8) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|IA1PR11MB7296:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d054a16-c816-4e87-c935-08df03a031aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|4143699003|11063799006|56012099006|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: iqHJBe8bz4W3cdkgvbY6TFkJIDwiybtGoAeKSdYYCH3P5tq5YNO9UHzdwDv0IlYW3ZeCsRRK5IZ6s2+3IdGqBycTEUEUI2KN+ybk7AQMWo7r3afZuMwRcFvYM7srIGEXqeu7WJbPwTl0JyD34PySmtlYd+50gVqJmr0OSuWRqqCMMfZ7ECMuPJVITl1wAHVg8Ai+9c4xDLqzR0ac+EPFZuPACUXzu9Bi6KgLRwSYY6dJK/q976BfhrN5Ps1ZZ4avQVtsb9q2t0wn8pq63OIYmmqGCrF3JvQ8Ab4Rbh58sEKHlDQt3Nq6jmWbuBhpKDtIUyVcGB0zsndKzI24zBYVCBYI7uTEe6p2y0VDY2pZ+t52LOk9RU0Dq800EgQRlFXsEjtxysN1tnEbqB3ENNhnJxiOIHAteNukTxP4p/rYgNvSaWVSvSFK/mUA2bGNvlM7BjnG3+73y+Do1BAvE5uKMl+X1dwqeNkT8Hosm5KNip8o4gDD4dQ28+ECBOC3O4IpsdvJhGwjwrrwzIz4jd600aRxSXig85ENc2cErwBNS9r+z2BQQthnBjxM0zu3U3lbVhk5WHC6tiIHxmHnSJeVXW13t8CD4NSGllPZq0ym+cAPko54f47w5VkMsKXQ6GW6y8huk3JMIQG5xF4XCuS2iRRwjqVq1EJdavYoBEbkH+w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(4143699003)(11063799006)(56012099006)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjVuMi8vQnREVjdKZnVrY0k5dXBtWHppVERXU0MyN2pBWHNFSmdUbFZSOXE5?=
 =?utf-8?B?RXl0TkI5am9hZDdzR0VGWGtERENKdGVabHNxVENuVzRxMU9hYjRoMEk0dEgr?=
 =?utf-8?B?bWxndFhiZUp0VTlyMTNUZldHcVBZVGNyRkFzQ1hDcERJaDJlMUxWeXkrd0pM?=
 =?utf-8?B?eU9VVEkwKzhKdmlyQjU3SFJuUm5aSVgxanZ4VXczRmRLSWRHNEpJblhqQlh0?=
 =?utf-8?B?R1U2bzM3L3czcVFralEvb2d3OTh0WmpLUStCeDdwUUMyaEtWMUlRSUF2Ymor?=
 =?utf-8?B?T0xvckVvb093K3RNUE1mK0FRTEpndFNON3JsWExReFZGY2VwQjNsZFRkS0E4?=
 =?utf-8?B?TXhjRno3Rm1jaHJsQUc1SWppMGlYdHZrdDNXNWhYL0FaZmZ2YU9BS05pdTJ5?=
 =?utf-8?B?d2UyYVdXZjNzWUFYUld0Vk5aSnhHcGI3UGV6TWFQbWZwWGJTa1R1REhwdXpN?=
 =?utf-8?B?ME9lTXRYS1hjSlJWV1dMcGUwVWV0eW5Vc010NkxWQTBoSmtPQ0VNSUZFOGtD?=
 =?utf-8?B?ZmNlUkpLcDBSRGJSQThEK1V1NTdSWnpoVVB6cXJEclRkOWtyN2YrMGt1SkFa?=
 =?utf-8?B?T1NFTFgzTWxlK3pEbXFGQlBRQXdaZ0ZSNnl3ajg0NkdYYmlUNlREeGN0Z0tC?=
 =?utf-8?B?dmptOWpsRVZLd1ZINzdiQXFHWkhTai82TmFWQmJha0FkYnlLT1I4b1NwcThJ?=
 =?utf-8?B?S2F5Y1JrNTIwWURMSXVQN0E4UXJTalZUK1dmQ3lUdFJZZUlCVnE3ZlNaVVRT?=
 =?utf-8?B?Ym9yRXJjdndhSUJTR2w5a0ZhdlE1SmZ4OUd5WG5iYTNmMmV4SlNnanFjeHd2?=
 =?utf-8?B?QWZFNjMvMW00UWxoLzNGUTBHYWt5bWU2T20vaFFsL3ZRRHowZnlmeHVOYWhS?=
 =?utf-8?B?QzkyY0V0YlV2QUtrVXJxeWxqMU0xWlN4Y1p4Nnk3ak54eVI2UEZ6WHMzc0Rk?=
 =?utf-8?B?TlJsaU1EbE56Snh5amk0TXFXTm54WWs5VDZkcVVITkdIcjlzLzc4M1pySG9v?=
 =?utf-8?B?V3R2VUJRZDdwbGhURm0xdU1hK2RHdVlnbExNaGRnK1diNFFmd1ZVcThHZEJx?=
 =?utf-8?B?WU5lRWxOY2xaRjBlMVdla1ZzQXgyb0ZlSVQ3TXk5QVZjamM5RnpFb1QvMnFG?=
 =?utf-8?B?RndybWRJY3lCT0FGVzl1bG5FWmdKNEd2K1g5YURWMXVuUjI3NDdtbk5VSWJD?=
 =?utf-8?B?dUlHNG1vN1VtUmYzVWwrUUE1dEFMeXpNN29tejdLYUtPdVR3dG1oR1NqOVk5?=
 =?utf-8?B?L0JTRzkrekVTc3FPcURBMkNvbHVIMmk3aUp6WHZobkxGZ2JVVmJrOWdpUHRE?=
 =?utf-8?B?cU1udHpCT2N3c3ZoRytsVGlsaTBaZzF1WEw5RGp2UWlVZjZvVnBRTHhlVllK?=
 =?utf-8?B?OVV5am4rMXZmSGNwYVc1UStBcGl4UVFIRUU2K2FqcmUrM2xsaEJTRmRwYThM?=
 =?utf-8?B?a2lwRzIrODFETHVuWi9QeVZ5Nm9SMHRLYml4bEd6N2Nwd2I3VFZ6Nzd6V2Vy?=
 =?utf-8?B?R0E5TnMyMHFmRU5zamorY1Fld3puRVUyWHlwRWNGSHBHV1ByZ1V4cXJUSzBP?=
 =?utf-8?B?aTh4dUVmUXN1ZlphTmpDQzFFQ3VrMkYvSGNyNzVFc1FBc2dSaTB6UzlMdnox?=
 =?utf-8?B?WW0rNUFTWmdpS1AzODhmMVFQc2tCSUcwcWdmUjJiQ2hJbEo1REpic0owUEs4?=
 =?utf-8?B?ekVsRlRSWWh2a2VDOHVxMjB0Z2k0RnQxay9sdERFMHhEUi85UG1MNVhWUVVh?=
 =?utf-8?B?UTVDM3FtTVFJbklqSGhnUFZGM0R3YnlRenRUdGVpL0d6bUNXZzRhNjNTM29I?=
 =?utf-8?B?KzRDWnZ0UXNyS3BDekdla25xSUs3bHRWVmpWVzFybkRSdVRPeFU5dnI2aVMr?=
 =?utf-8?B?Z1pTM0NVeDB6Mk10eFFhREU3NzNRRlZlRkh0NUVaOHFCUzk4VlE4cEJuemhE?=
 =?utf-8?B?WmJyc2FzUUYyVUVjR25GL2NEb2tSUEo2eXZ4K1pWNUZOMFg2MURDRzRBY2xH?=
 =?utf-8?B?N1ZicDFmT2M0bmljZkg1NDJkNU5sYng2UTZHZGowMVdnZFhFelViVTNsL3Ey?=
 =?utf-8?B?WDNSbityU0oxdUVka0JKNjUrWHJ6eEE1ZFdkV3hIY25YUWVUOEp3QWRoemF6?=
 =?utf-8?B?eUZMM1dOek1neGVKSmR0ZXp1ZnRxVXlNeStqY1lRWXBaZXlIUWV5NEdySHp6?=
 =?utf-8?B?MmZOMitlelBSRWhOSFpUQTNjR1M2ZHYycGFTSHA3ZlFxL3VUM2Z5YlBNNFNC?=
 =?utf-8?B?TlhQZ1gyVWJmVFBib1NqY3NLMGZ3UXpOTEtMNU5rTEZsWlFVSWprYS95U250?=
 =?utf-8?B?Sk5PQ2djTVNIN2lielpSREtZVEJIMWY2RThhR0d5TlN0akFTajhoMGRleTRG?=
 =?utf-8?Q?1Cbso3PlY79wJbfQ=3D?=
X-Exchange-RoutingPolicyChecked: eX028YJzXi6RsDf6mC/Tx2OYSd11OqSAbS8d7tYiEtIP1TcxM1I66L3EdMKf+1oLOVxUQLG2/N4oIou1DCYZhgSxaOLJh3Y8SBOmlqPN8KbFwzexXF25BqLNn/l6MDLy7CU1r/Tmxu84+r/whwgSZDwrOlNywqdzLBUH68Qzg517AFhqmY7F9141SQkkg4fUbtPVSxVCRtCZA76qKMK8d6doF6XmA9SSyXiHgbp3vfhjC/vOtl5M/VQkULPSfLJSmIPhWymaZAs6Q+trTWJLsShhLDtqPZKvE4dLdN1hW0qOT9SHKe+F4VGlE7rjF7LcIm9XdcA5dhWE7z6lUKNpVQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d054a16-c816-4e87-c935-08df03a031aa
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 18:31:07.4032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGWXf1fXonN7te2+OjgWWUmrieluBMkcDZsV0n23eB3hAuXy/dXe3dgMTOVMsdGbg0gE1Uc2Fcpk70RnmwC7WLaRAw3P4oNimeTYt31SCNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7296
X-OriginatorOrg: intel.com

On 8/21/2026 2:29 PM, phucduc.bui@gmail.com wrote:
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


I have mixed feelings about appl*_mux_setting().  Take a look at its 
disable-path: if clk_set_parent() fails the follow up 
clk_disable_unprepare() is skipped possibly leaving one of the clks 
hanging.  I'd expect error paths of callers (of said mux_setting() 
function) to ensure all the clks are disabled and unprepared 
unconditionally.

> Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
> index 6ab0734ad136..0790d8123179 100644
> --- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
> +++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
> @@ -382,7 +382,9 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
>   	int ret;
>   
>   	/* setting for APLL */
> -	apll1_mux_setting(afe, true);
> +	ret = apll1_mux_setting(afe, true);
> +	if (ret)
> +		goto ERR_APLL1_MUX_SETTING;

Why goto? The check is valid but the label in my opinion is unnecessary.

>   
>   	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
>   	if (ret) {
> @@ -411,6 +413,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
>   ERR_CLK_APLL1_TUNER:
>   	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
>   ERR_CLK_APLL22M:
> +	apll1_mux_setting(afe, false);
> +ERR_APLL1_MUX_SETTING:

While UPPER case for goto-labels is not part of the coding style I see 
why you did it - to be cohesive with the rest of the file.
