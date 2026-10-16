Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A409419FC5;
	Fri, 16 Oct 2026 07:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137123; cv=fail; b=Gx4ff8xDHDDnywVSkEQ480XE64bP6BDNXWtngfwSpgZYDBN8fxRWttH7VxM4UxYg8D54CckTIIEwq11v1ks8y9XnunQP382xz6BwF+oMm/fgqxhygzJHYPD7ay4rJTh3slMBxJT0lvvsD+gPApAJCXM/5FnTFnnN7YFtE7C+zIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137123; c=relaxed/simple;
	bh=4Ot1ymqmzZDlFJUuy2/YvvN1N4S7YjOxkhrBojbd/uY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z+AJvRNhXM33juQX69Hf/Gewl3S0FKG0CLRgc5HD6D97+DNgDVVxghgTF7cXM+7v4qHugeL1eq7w7h/IpAYW2LV99t1hGbrYmdK17EGQd4ymlmb8NbLJBI9i7vDJbUEnFuxCU/bTra+pElWI4N8Ts4TejIrc0K4hMs5IP4361G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DxjZNpYA; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DxjZNpYA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792137122; x=1823673122;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4Ot1ymqmzZDlFJUuy2/YvvN1N4S7YjOxkhrBojbd/uY=;
  b=DxjZNpYARCPkZYsFjA67JNdZ6bssls8j9trRX9hPktAzs81A8cogoFpH
   DJ1ZydLsqZNiNYyPcgkIZO+DDF8HoeYH9aFIVu5v/BPl29NWnirqNRkx0
   q7DlZVbTx0LdP/KRaC1MKkd+3QDeiUTcGui5wanbCfHB5+LJO4LR7MjM/
   GoCVGavX+UJXZGIumDz3cjdPJ5whqphrE/e6mNTK0eQsFjRZc/xJLdbXy
   1ZJWr9EhjtjxNok+kh6B7QeN6cC94ArVqqJYknxerFAkB4S57eP9IHFM/
   FKu0Z8+UTLq93wV3HRS8yrManQ+RU5LZurXCuCmvdEl5GfhzmxQIwvwuP
   A==;
X-CSE-ConnectionGUID: WliFvbG3TMewOv5eajX1ew==
X-CSE-MsgGUID: dihryvhBSIqE1hfMyWzVtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="808111"
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="808111"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 00:52:02 -0700
X-CSE-ConnectionGUID: hopu+f5fTp6hBorYjbVCdA==
X-CSE-MsgGUID: kEGn2NOTSh6oMqX7rcMyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,161,1787036400"; 
   d="scan'208";a="3635597"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2026 00:51:59 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 00:51:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 00:51:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 00:51:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMYPKIKJgro1mdr05GTZhJb1qASkSCqo/aBBCgp9iyjNIpTR7pGfgKMmBHwLreePylMiaCROcKDE9fCksTt7pBjGyPQsLYQHFeQ7Pd01L3l8jDNJkfwEdEMBXOFPVy5jXKIPccTjVEC4Nz82isEIc5qYKf3G1H23OxYQx4OpbUiKuKVtRedtZamuobp/GLB6TJLEkgfuqXZeD3rdfME7FGBCGID0tOR9CHbD5Y8Xxlg0Fp0OAlbst32zx/p+oW220l7ICrqXf2CwdzKSZw43lqvnobngznMFeHTqGG4tSlFHUvQIO7F/oKj1Y35scGuqqsfE3UuHDPy3vdED8rCK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fAcbej5FOq+nWgdNJ5pcBqzH2eQwpV5q2hjhH1EuYUo=;
 b=FAoUwlZG8mDs9MEmzYy7vpYA6F3CjU61cVw8ykf+Xd9pef7dnX9ytnVlYoikL7Pv7wN73NJZ/Uwm5O9/5pcRnOFWGrkZQjMqMjCABzsiiPwhZYjrN4qw7JRP9llkcIB6t8i5VMR9cN67chpX6U6ARNOs5Tyv63X/aNURnHGuNn/WLj/PlxAKp6FVBGxff6mV8fRNeosqG7SUJDG6ZnVTomRyGNwpEelXXSoi9uncQyk48/xHNcubpHRM52IghYPmiAjOa8L53NKEscu9f6PwpQBhhsbdpSTJS2nHCln6cOLbdxUVX/1Ntts/HxbAdWiU1kseAaw/0HJtTCI8gQLLeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by IA3PR11MB9184.namprd11.prod.outlook.com (2603:10b6:208:570::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 07:51:51 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%6]) with mapi id 15.21.0496.021; Fri, 16 Oct 2026
 07:51:51 +0000
Message-ID: <8c3e7800-798c-428e-92a4-25ef01a724e6@intel.com>
Date: Fri, 16 Oct 2026 09:51:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: Intel: avs: Unprepare a stream when recovery
 occurs
To: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?= <amade@asmblr.net>
CC: <broonie@kernel.org>, <linux-sound@vger.kernel.org>, <tiwai@suse.com>,
	<perex@perex.cz>, <linux-kernel@vger.kernel.org>
References: <20261015190240.729793-1-cezary.rojewski@intel.com>
 <20261015190240.729793-2-cezary.rojewski@intel.com>
 <20261015212502.6280c705@milkyway>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20261015212502.6280c705@milkyway>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR07CA0258.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::25) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|IA3PR11MB9184:EE_
X-MS-Office365-Filtering-Correlation-Id: 728d6e20-ecbe-4a7d-4e83-08df2b5a568a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|6133799003|22082099003|18002099003|10067099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: /NNmUauDdPJv1wXPOjtF7WgFLYk5hW9JCEx5ELdvqkBzRU+BufFN1aYpWjANu3Xx+Xr/tv0MZdHShmx2wwXtQkh6GSP6wpbS7D0TaZnwjF/C4csBMScgOOZaBAhQVkvgXJt/cwMbxESyKKT/nwPVIe1nn56/DME+UoHS61N8WrW5iNJICXy6xHFm36EVwRBGUAgZK3uIa2ht/kzeoN2QzbfiJq5vfxoqNix5+k3LxrZ3NPOFyZOkxEpVjMsdRpG79/sWImI0bzdhWQ+XcX27P2DCFRJ+vomJu3qHokYmO9R9WitzCsL05KjJpnxvsYdaBHlTMaRZkZohlhP/VAci07rE3EFOAvNoYAifPqbvjTYl0nfxPyyrYiwsBJpN7V73mKhfllxuYCObkNs9JKClqy9uizEJcAxTrRBep0VINIJ4EJLAJFII4KKhKIjlj5Nwzuz6JhAuRhJyo1AAChQkEjBm52gVqKP0oDE/m/hbAOBqfJ1SK6ZSBNnFFnbr4wJ6j2UymjP1dDjlmu3WnbGTyYbCuPOdRyKoOFjmE2panp4qHBt59uT7liBm7riRXOQ2OKI1jHtUEy2dS2IY/rodjzRqsxD+BleCzuZy+6ibinI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qy9lcGFJQUVUVVpFejZKUTBGdTlFRzdleHJDRkxRc3hma2NESjZkbEFDVVdB?=
 =?utf-8?B?RklkbFRuRnd2VXFCVmUzUy9wVXVVc0xOT2dqclcydmtNSjkrUDlCTXFQTjFu?=
 =?utf-8?B?QWFIRHVPRTNndDlqNkNneHZsRUEwc3Z4WWNCZEFBNEJNWWNNdTYycGZsUUtH?=
 =?utf-8?B?MXlmSXV6QXVzZk9UZnN6NW5ocGNWVDFXWW40R0RFNjI1RlJOajdrTEV4VjNa?=
 =?utf-8?B?VThjRStjeDN6d0ZUa2lQQUNydGNJb01obm1wQmNwd2RWdHREUmhhd2lqVk1R?=
 =?utf-8?B?MzZWUGNDYzA0bHI1Y0JOYnBRbU5NUi9aVnNXM05uaDdCSG83YjlZMGdNcGI0?=
 =?utf-8?B?RVNLV2YzNjlMZGRXVkZaMWQ3UVY5LzcwK0JaWnNoelc0SlFYTkttaVVpWnFV?=
 =?utf-8?B?WGpFMHB3S0p4cElWZk5LbWhDb2xpUzNTdGxkT3BIdTF2bmpKLzg5c25WamZK?=
 =?utf-8?B?VXh0L0hPM3VXSVY2OHdlaU1wRFdBQkNFTnltaE8zYmxQVGY2YzJzRzBYRHor?=
 =?utf-8?B?Y3ZIdDl0aUNVbkdzNUphZ3VDVzdBWlUyc2FubVp6bWFBNDJ3RGZZOUliaFZV?=
 =?utf-8?B?UzRsVVJybTlBcnBKQjY5QVlqMjluSmU4aDdENVhjdTBYQnlYYzNJS3ZMTVB3?=
 =?utf-8?B?SkxUaGU0VG5YM2NiSXp5MnFrem9ZTmV2Q2puSmZFMHNlWlc3Q3JKaUQ1V0J0?=
 =?utf-8?B?UGJQaE85MWJLb1BTL3ViMkVBN3JQVjRBcUp2NVhmM0lRSm1ZeURRMk5lb2Jn?=
 =?utf-8?B?SDJuYTI2MHZxb3NKRkNPazF0UlhPV0QxalNIVmYxMEFmbUdSYTRlR04rNGYy?=
 =?utf-8?B?a0FRQjA5Nml0RVdMOEhlUWVNUldtNVJ4bE9nK3EzZWo0RlBhZUtuL20xandI?=
 =?utf-8?B?L1BsZ3gzcXAzWlNSd2JUTThMamdzRGdESDdGUzg5QWN5cVJNWk92c20ya2Fr?=
 =?utf-8?B?M0w2Q2d2Z1NHdm5XR252aUx3N1QxU3kyZ3NLWFNUaGhQOThSaEhXTEE2QnRs?=
 =?utf-8?B?elpJc1dZNm9iSWYwdENTakkrSjNrWkd3dXBtTlJDTDg2dkxkcHQvTGpMeFp4?=
 =?utf-8?B?WmhidW9kTHVyemVwQnQwOG1XQ1FBeFN1TU5GZ2ZzY0tnRnoyYVBKMFZOZk9U?=
 =?utf-8?B?T29NbUVXNkJ5akh0N2FFM1VHbEZRdnpNaUZSTXZxcU1RdWFxWFVNemlGcFV0?=
 =?utf-8?B?MHIyYUxaeGl4SDQ2aGYrcy9mbjFnL1FNd2dONWVZckJTRzhrMWdZVlQvRm1v?=
 =?utf-8?B?cnIrQ1UwcGZQM0VSU08yekVQWndxUHBpZWNtREJBeVhVSVpDVTJXQUtmTWdP?=
 =?utf-8?B?WEFJZU1kbmFIdHViU1JrdFVIVXlCeFh6ZkNFczVNSHZqSGtmNkdlS1pCNjd3?=
 =?utf-8?B?MWxsQ09ueGk4MnNxREc3QlRBbVNOOE9qcDFsM1E3elh0K3RSVjA4THNtdzJV?=
 =?utf-8?B?UVpXSWdadHQ1SlF0TWt5cU4wdmY3Q3ZNakJlVHlJd0V0UWozM2tPakRIb0h3?=
 =?utf-8?B?Z0toVHBzWjkvS2llRjdIUC9LN0xnbFRCRDRaNUhBTHh3a2Z1Q2xPM0ZzVWtC?=
 =?utf-8?B?YWdIcWp6VDVoU0FCa1MyMFB6Sm56aXdTRk1KZUpzTmJlYzlnRE80dCtEK0VG?=
 =?utf-8?B?K3NUTUp4bGdESnA0UG9WRUMvZEl5T1A4N3RJdkhhQThvV0VmSUxjb1VhMGR6?=
 =?utf-8?B?RW9GZkpIRFlxczVOK3J2bVkvbWFSQWJhUVkyRk5qbjdHelg3ck4zd1pibG9E?=
 =?utf-8?B?L1NXL0Zhd281bEJoT1JJVGgrNlZtcGpUajE0NGY4OEJZd0s5OWJWSjNKVjVt?=
 =?utf-8?B?VHpaajFNSDNHSTF4MDR4Z0pJMm1xeXlvTVRnWWw0aXlvTjBLNy9qWEpGNkRZ?=
 =?utf-8?B?b0dyV0RvR1hKYTRyMC9YYjlENUljMnVNZHJwbjBjdkQ4cTFOb29WVjdnT09O?=
 =?utf-8?B?cVFWMWN1Wk5BKzZqekx3RDkwV3VmTzQvR0hVS0JGYy9DbWxoNmdrejBYdlFp?=
 =?utf-8?B?VDI1Z05NZmxaamVhYXlaMDZpSlpBSUZBSlB6TERxZFFVWG56VVpmU3NlNmVo?=
 =?utf-8?B?eXpsY3dWaTJMSm5RMld5N0ErQVprcXNoRzB0MkdKcGcveWdaYm9qQ3ZWd0xW?=
 =?utf-8?B?RkEvejEvK09lRUNBY2dkcGp6Y0JETHNKQzltcEFrQnUvWWJ3eUNzVTJaMURl?=
 =?utf-8?B?VXViYVRMY29KcUdpQjJBdmlOZmYzTUVpVjJFa2RIYy9hdU5EUXRzUnBxc1Vj?=
 =?utf-8?B?YlhMdC9oQm1Gd0F6UkNNTUF2cUlOQjFuekg3NGwrcmNvR05kMzhQS2xaOGFl?=
 =?utf-8?B?RVdNejJTSmhSUjhXQVRqQm95RFhUb1N4bGtTd0R0Sk9uU1ZuR084cWR2dmRI?=
 =?utf-8?Q?rLkg8AhZgfCH/dx8=3D?=
X-Exchange-RoutingPolicyChecked: Nq0rcM6XC7vboOV+thY8MpBySVG40Ff6kZ/Kitbsg5g1nBc91e7E9DyONzq3ZcG1BO44xp1QSUa/ZiNdloWyrX5qB/La7/Bj9hvb+yEkxjT5eh1UnhalmJxCA+PgQuD1/p8plCs05PA8+KEH2IvOQRQc28E2U6g/7956/MVXcnu0ZRCBCx6sG9f8dkeuTwY8ZsUmZndUCiNVAsRpLmE9xcux2gAtB5HrIRgeZ9r8WWHmSMrmDdnjqVaadwPpCZxwAJo/x6IeR8Mcj7VukKWlFoSbzXCHRISlfRqmkDkhyDpa4Q0/RJSOfY2yb49YC1oRLZxKyQz/a37bLXg1heLOfw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 728d6e20-ecbe-4a7d-4e83-08df2b5a568a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 07:51:51.1340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JgNw/B18zQD73xG7pR0Gfc/nDzNaFc9r7L8fyTsBCow6E9NBQoE0ceKOuQtQyNTOzcywungNBmSZQ2hlw079t86G6VvM6jxDPbaXRObCJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9184
X-OriginatorOrg: intel.com

On 10/15/2026 9:25 PM, Amadeusz Sławiński wrote:
> On Thu, 15 Oct 2026 21:02:38 +0200
> Cezary Rojewski <cezary.rojewski@intel.com> wrote:
> 
>> Recovery on alsa-lib side is handled with either:
>> 1) snd_pcm_prepare(state=XRUN)
>> 2) snd_pcm_drop/drain() -> snd_pcm_prepare(state=SETUP)
>>
>> before starting the PCM anew. Relying solely on state=XRUN leaves 2)
>> unaccounted for. sound/core/pcm_native.c ensures correctness of the
>> state machine so plain state!=PREPARED check suffices.
>>
>> This is the BE equivalent of job done previously for FE side only with
>> commit cfca1637bc2b ("ASoC: Intel: avs: Unprepare a stream when XRUN
>> occurs") and its follow up titled: ("ASoC: Intel: avs: Reset the stream
>> unless it is already prepared").
>>
>> Link: https://lore.kernel.org/linux-sound/20261010103753.16969-1-stiraspo@gmail.com/T/
>> Fixes: d070002a20fc ("ASoC: Intel: avs: HDA PCM BE operations")
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
>>  sound/soc/intel/avs/pcm.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
>> index 3cf455e8b879..a0a0d645ea33 100644
>> --- a/sound/soc/intel/avs/pcm.c
>> +++ b/sound/soc/intel/avs/pcm.c
>> @@ -461,6 +461,8 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
>>  	link_stream = data->link_stream;
>>  	p = &be->dpcm[substream->stream].hw_params;
>>  
>> +	if (substream->runtime->state != SNDRV_PCM_STATE_PREPARED)
>> +		link_stream->link_prepared = false;
>>  	if (link_stream->link_prepared)
>>  		return 0;
>>  
> 
> It's bit late, so I can be wrong, but if you are going to execute whole
> function in most cases anyway, is link_prepared even needed? Why not just:
> 	if (substream->runtime->state == SNDRV_PCM_STATE_PREPARED)
> 		return 0;
> and remove link_prepared entirely?


I do agree that something is amiss here. As mentioned during a parallel
review [1] with these checks added, I doubt ->prepared and
->link_prepared are needed.

All of these is a separate investigation though and I've decided to go
with what has been touched, at least for now.


[1]:
https://lore.kernel.org/linux-sound/179182811090.390394.9718829794059346472.b4-ty@b4/T/#m72e50a5e55c45570926a88ebd260343e11847eaa
