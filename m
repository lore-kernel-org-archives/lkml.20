Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABB0439F75;
	Wed, 26 Aug 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787753515; cv=fail; b=hz6AWIUN3dtqNzieEoH2oMEg6TqCV5xl7nKCkz3H9bUVu61bzK9jrL9aKJcKwsWNzulTDdtbvWA4ux56KgQyDvkeFLnGKTraX1Jo/5pGWG2juo9azl6491myp0VdcPUulFhm6GgZ4iBpuNqtuQqhpM/mBESc01sIar7C7pVxXdQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787753515; c=relaxed/simple;
	bh=7GOHBFrdj6ETSJ6iii2UOPC4VzwGn4gQuUusdadxc3Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ihfhNE5Ias/ZSIgyRYYZjS3Jr62xuY8ElP94XHoHaiJ//3O/7HmvG+/j5OK7OdVE0ADkG3AQRjW1N/4YzOadVmBUh3CaykeTse/Vsph3IPP3NjAIjsQzuPyuFtZgD2jWoyio3l7bfQ4OL4W3pDgpcw2ryqeUXmMkFmI6llBnqE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1ZZThs/; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1ZZThs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787753511; x=1819289511;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7GOHBFrdj6ETSJ6iii2UOPC4VzwGn4gQuUusdadxc3Q=;
  b=F1ZZThs/PN06ZBGdxpAI44ZWjCFQVQCwo+lUvBAw5yV66RWQDYdJ73QQ
   fx8RFFLpPiJJgRvvbuyeiltU5nRpFJIL5mSWiIaYApjKVusrPxMv0riFR
   mnxyK5qA7I2Kow3RWCTnEwr680prpCfImGvNloZ0v5+HZ2JtODtP/T8Gb
   ZQ1dJs50sNTvf+uIibQL0rPwihntqubJIkF8c3Q3yL3E1rJG1O+jIC9CY
   zRZ5t47LOUAz7k6jE805I260HELzLFg8/T9Cap/0DB51HeYQJiPNSG28Y
   6ngliFkiW2eIuAb0AyG36jKZcI4p8qcRKKvI6lwV2rEoJ/3drvc1F2do7
   A==;
X-CSE-ConnectionGUID: QPBlbSHjR0i7TBg8vBRZ7Q==
X-CSE-MsgGUID: 3xjsX7hpTcG8+aClkIIXPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="88290500"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="88290500"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:11:45 -0700
X-CSE-ConnectionGUID: 8xVY5W9qScOdK7bDJ7KjiA==
X-CSE-MsgGUID: Hi+sT/vvRMuJ83tr53xAVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; 
   d="scan'208";a="305819194"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 07:11:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 07:11:44 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 07:11:44 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 26 Aug 2026 07:11:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7lDiedvzTrIBCSdgiFy6UrgE9pEefoeiQMTXbWeqmkFrQNxS7+b25MoPutra3GgOfa+vRdjzZkdU1+Hh6eOSn4CdDYMiMjFYVVOpQ/D0fksQDCyLIkv3P7BTmiUD4nWpeymKCiOcJp5uQxc6T8zehTy2twjdGZ+qpYRN/izthI2Fjtffz4k2iIJn7/VUg/Q2nu6ZRBuvT/93hg4lRroZwqhAo0wZJsNNhpT6D6tl5P6IqW/DbPsBsBAHUibssUpHtJbAqp2RIg3R8rlXfAz8Z+utlQaVfIbmqve2BeMAiqF9MAd2qrySLkEyFrhXPJXytIviQVkfMWVWttldq+KzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g0WlWZQyFP9/AXpvQhMO3o4pwJPGJRv+SH+cEIlDMY0=;
 b=HFz1r88HTX12QoQLQqug40KOZvsTRBBwqlOnvCyJ1i1jZwPu9Abce5RWdkxK8DlN3PPdxMg/J8UlBv6HcDaPfVzdxwpgTaunV1zgkPs98KqgGgjCm+935XF8f9l+dTK8UNwC0/ZTWiKX8kTl47Ru/NJCIhQJIkvFhDCDwasIP4vEBzt/zyB73i0+x/N4oy9hLSSrDCOAo3eIWviCe6nu1fNvjyJiB7tR3W2oDHVCv2YG7oCqySZTTDPbRCyUhujxbtT08MaeHwM357TuznM7ZiByFgVFQvMz056bISTtS7ABGGFq6KUdGa/18Hv5WOxyenFure/M7NP6LzV9AW2FJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 by LV2PR11MB422163.namprd11.prod.outlook.com (2603:10b6:408:3a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.9; Wed, 26 Aug
 2026 14:11:40 +0000
Received: from PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd]) by PH7PR11MB6006.namprd11.prod.outlook.com
 ([fe80::4e2d:28f0:ede9:73bd%5]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 14:11:40 +0000
Message-ID: <538bbc27-8796-416e-a10c-3033d6168bcd@intel.com>
Date: Wed, 26 Aug 2026 16:11:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] ASoC: Intel: Add Lenovo Yoga Book RT5677 support
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
CC: Liam Girdwood <liam.r.girdwood@linux.intel.com>, Peter Ujfalusi
	<peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Kai Vehmanen
	<kai.vehmanen@linux.intel.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
References: <20260826132334.3344395-1-mauriziocasciano7@gmail.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260826132334.3344395-1-mauriziocasciano7@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2PEPF000008C2.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d8::690) To PH7PR11MB6006.namprd11.prod.outlook.com
 (2603:10b6:510:1e1::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6006:EE_|LV2PR11MB422163:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ded1b1b-c2b2-4eed-cea4-08df037bf2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10067099003|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 2NPHsqxPW6QVz0wu4uL8G3ce+s8LgcD8ELqTkFMrWRnOQ0zPaZiLdh8la9YbnsgTGuESKwGJVAnyMi0v31Mt6l668TmkBqZhWJ/sACJS6GABF1WbjJFyVZHdHQglcoBjO7xpqdNSb3v5ecUszD1nNSr5fPldW1HixrtS3yYadVMPJJhiNhdC46TXfhyUzcDYPhmssNlyvfeMzn3RL58OEmB+LJCRQUT60drI8vIEZbRHLK6sfUpd92ObUaw4wdmZ6tAEmI8w4xxo3QOXcRc41hdmt3h1QgYR6LfklEXAZUrhx1p9EY52KPNWefXYJWVSI3DnT0FmgWDYblETKBsZ0UXDrzCwTOd1IFGd9OtORkS8UFhPX8xYOgaQ5EjCt/7THRYJ1uAumKohJrnnPK9pUjzX9rqj+POMRss+eTdfohjTeEa/PLx+SO9cZ/tcE9IBbjBHVdk9ai0JY6Hwke4JMi3+nYB7hqMNc/O3NiLC45Soiwr5NyrLfSzGWTYs2PAXo7PfXvakSN7VsDCHDHxWUfx3vMovR55rxrVLMPxLb21JjkRiptIY7Fm7Q2bqU7cJBXLgF0QEFKWCJd5l5uwM9D3z4xH3lVa/AMR9EbRzfr0r8kvTb0WDdYfcnLHjHBa7RCPNuZUz4JO5C0o/gnx4YWYfYWYUNBcyWqnHI8PNSoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10067099003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDN3K294dEE1WFRzZ25nZWU4QXAyRlArMW1UWTQ1TVBHMEVwdXZNdnREY2RP?=
 =?utf-8?B?VkR2OU95ZGVDVVFKWGhGRytDbkIwY3E2Z25YamVLUHdoTGhlSmZrZDVzdEpr?=
 =?utf-8?B?QTZYMjkrc3pIcWs3MDlERkJqM0VYUm1EeXlWZlN5czRHVXM3WWZzblFNRjUy?=
 =?utf-8?B?dDZFRCthcmdlZUpCeWwzZ1ZONlJmVks0a0FkM0lGaEVLczd6cXZZSlBscnAr?=
 =?utf-8?B?SkphK0llV1czN3BtZTJIbTlWaGlCK0E4UTJwVm5idkhHUktWWlNLN0hWOU85?=
 =?utf-8?B?V3Y2Nk1ETU4rQ0RkaHBRYzNuZG9mQXZiTUlPWStJSklYRWxsZE5LK05tMDF0?=
 =?utf-8?B?SjB2ZCtHNUoxQ0I4Rm80K2d6cjBicFpvZVVqSytxc0FnamNvdkhDR01NOUNu?=
 =?utf-8?B?d3FIbTk1NkFsU3o2VjdzRExJNXJBdEcwSVRWR1hMYnhSWXJ6dVVVNFlVZ3d1?=
 =?utf-8?B?eHY2Rm8vSld6UGJZY1FoRXZ6bUt5WUF0djFIS1RQcm83bm4vT25CVER4NzBs?=
 =?utf-8?B?UmY0Z1hESkhXU1ZreC9XK0VFR0l1cXBPSGN2eUNKT3hrN0FHTWxMOXREd0pO?=
 =?utf-8?B?bzlNQ0p5eDZMNXlnVXdIRWFVNkZJM3o4RUU3VUFiajVBRHk1REFPYkhGdm5I?=
 =?utf-8?B?RktMSFowbnVEaXU5R1pBK3BwWWJLaXJ3VzRubGI1NXlLTGNhYnY0MmFXMU9p?=
 =?utf-8?B?Q2xiWmNZRUZTS0V5Nnd2SDhKaWRzK0l4aDQrUk1jNFY4YlpOQVZZcmovQmtu?=
 =?utf-8?B?R3IwOG5jbU4xVTRpTm5BSVRnNWIvL0V3dEtXU3p0NHB3azcySnJ3bVlqM2l4?=
 =?utf-8?B?M2xka3JkcW5EalJHK3d3azZSdEtxb1dwRVR3YjN1ZytEc1dBK09QMjhVdVFO?=
 =?utf-8?B?bytXSVhIWGJvamR2S2NFWDA5SFdiV2luZFhOSWFRVFU0Zi9WaDFLU1BobWc5?=
 =?utf-8?B?UzFjL2t4dHQrSVhsSGdmK2Q2dnJBb3dCS05QZjNCMFJJakNYcmUrSXY3TlRw?=
 =?utf-8?B?MGJweTFsQjRYN3A5TDJCd0dsem14N1BDN1A3bkFEWkd4MWZLUm9DakpyT01i?=
 =?utf-8?B?YUZQeXlBL1pZRExXdzZGeEVyMXpUZ2x4bmtNdmFwMXJ4VVkraUwrcDJwbC9U?=
 =?utf-8?B?L2JCK0ViNDlQOS9vUXlwenp2aHZtcytPS1ZrbERqaHRFQWRJT2VoMi9UUUxO?=
 =?utf-8?B?YTJZU2o3c0h6UHppeWl4dGZsMjBQZllzOU9HL3hlL3RKcGUyQlZqZ2UyVUZv?=
 =?utf-8?B?ZCs2OWJEMStobWRXbkQ1RExZYlFxY2tPSFIvVWRkTElhSGdtQ2xIbzllUDUw?=
 =?utf-8?B?aGp6SUpaY0E2Zlh5SHpzT0xycmhCSXpZVkxEbW9EN1ZRRnIvSmlMeGhaeUNt?=
 =?utf-8?B?dzlxdWJud0lXMUc5R1poVTY5MFAvcDRsNm84bUdRQUFuZlhMMWVYcGJHSjJW?=
 =?utf-8?B?cndOR1kzVXRRQnpndWkwVGx4U0Q2WW10MzdiRnc2SE9qZGlVK1VYa2s1WG9X?=
 =?utf-8?B?Z3h4UFpyTU1tcUZVdE1yTjgwS1dXR1RsTlB1K2Y2TlhLc0xKUk1MblcxcHFY?=
 =?utf-8?B?Qk8zZlo2dlY5bmFKeis2cFVzM3k4aGQ1SU82d3E1N0kzNHdmUDZ2L1p1bFB0?=
 =?utf-8?B?d3dOa01kaTExTGw5ZWs4Wit3ZzRqa2VVRlN0SW95dDB4YWpDaEdNVEg5S0hx?=
 =?utf-8?B?TDNvS2hUZ3hjb3NiZUxhSlV1bWhoMzRpSUV5K1BpNkljbVo0bzMvckpIaEZT?=
 =?utf-8?B?OU4xbVNabVBjNFJ5OFBhbXQzRFF5c2lucVlaRG5aQmg5czBzbGR0YnFsK0Jy?=
 =?utf-8?B?MUJ4OGp0Z2dxN3dYSjdKZFVmZmZUZVRJeEZaMHpFRytXLys0RmdCWVAxTFQ1?=
 =?utf-8?B?QTQxZXNTTlRZQnJNbkpvYVZ3WTl6Nko0TXhuNlBpODRwREtIcnB1WU1pQnY5?=
 =?utf-8?B?VnpZSWVBL1lrYmRFbmhpZk80WTh2WE4ycncxUlhRM00wV3p2U0M0VEdEV2NL?=
 =?utf-8?B?eExUMy9kblpUQlpqVDJyTk5QVW9OUCtCczV2UUN2MFBSa1JQazVqeFN4bkI0?=
 =?utf-8?B?ZFlsZ2FOMEw3N2tFVzVWcTRVNHBOeDk1d3RKb1ZTcnhTd3lUSk9qZy9acWZS?=
 =?utf-8?B?eStERmcxSXM0MVFwVDBXRllBemtCcDBKbUsyaEc5a041UW5KamdXQjJTZUlR?=
 =?utf-8?B?cE83MGs1Z3lBZTdwUElGR0U1dkN4QjJ1SUsrUEZyVWFpalFMQ0hGbm90VVp6?=
 =?utf-8?B?WnplSHVPTlVSM1JRdm9yakFZczRHQW05SWJkUUtBcldmZmd4citDNmJhbGh0?=
 =?utf-8?B?K21wL2d2cHpJeS9CVC9SOWFHMHRvRmd2b0JIeXl3TS9sbUxzdVB1TnR3b2th?=
 =?utf-8?Q?7yar785Eb0sOBlwE=3D?=
X-Exchange-RoutingPolicyChecked: nGqLy+HqqWapT8d8Vafw+/wyMw7bYfnusPRBFeYLNc4AAcycNjlHeZ+BX86C1awKB4UDWVQdt+3XPqhYjvSNaOxpJFy1HY65klu9MTXb2KNXfFJf/O6AeMr484pdazKpG9W5WdOKBhI5SWBgpl/X9NRz9o7pqClY84e7VXqWTt+7qNaJtu6D5f/5tfMO8hwVA7M6EC+oG4rmMlITwqfCSDnXdNQytyDqM6WfIe9k13XTsc525c0Mt3jlqs0I1rhKxY5eytj65gFwtej4BKYUI4WLCNNu4BUzgw/D18g5Tp5YqNZeSi8oLgiKlKbdI3bXCq6FUH0aYQslZS5fZda7Xg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ded1b1b-c2b2-4eed-cea4-08df037bf2e1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 14:11:40.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2AJtOpKt1MPnRhdL1Q2nCn/nPsWoeFHfehVLk6qEYGwXNG3X8heUOVf6y7YhOgJHr4+WXdrDuW1GMO0miuDHUQEDLNRbwmEP3fL2hY0Y8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB422163
X-OriginatorOrg: intel.com

On 8/26/2026 3:23 PM, Maurizio Casciano wrote:
> The Lenovo Yoga Book YB1-X91F/L uses a Cherry Trail SSP2 connection to
> an RT5677 codec, with board-specific amplifier, headphone and headset
> detector wiring.  Add the machine driver, the SST machine-table match,
> and the SOF topology filename used by the corresponding external SOF
> topology.
> 
> The companion platform/x86 series supplies the TS3A227E device and codec
> GPIO lookup entries.  The sof-cht-rt5677.tplg topology is maintained in
> the SOF project and must be merged and distributed separately.
> 
> With the matching topology installed, the Yoga Book reaches the SOF
> card-registration and stream setup path.  End-to-end playback and
> capture acceptance is not complete, so this is posted as an RFC.
> 
> Maurizio Casciano (3):
>    ASoC: Intel: Add Lenovo Yoga Book RT5677 machine driver
>    ASoC: Intel: cht: Match the Yoga Book RT5677 machine
>    ASoC: Intel: cht: Add Yoga Book SOF topology filename
Hello,

Unless I'm missing something, this looks like a resend of a patchset 
from earlier this year [1]. Previous owner of the subject, Yauhen 
Kharuzhy, is not even CC'ed here. I do not see any of the review points 
addressed here, moreover, I see a regression when compared to v3 from June.

Hiding behind RFC (not v4) is a weird move when viewed in context of 
CHT. The configuration is mature, CHT is over 12 years old. With basic 
playback/capture not enabled, does the review make sense?


[1]: 
https://lore.kernel.org/linux-sound/20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com/

Kind regards,
Czarek
