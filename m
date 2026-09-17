Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690B381EBB;
	Thu, 17 Sep 2026 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669878; cv=fail; b=YhYHxJKW4GFvWrjXz3sLIPiCCR4vNe05oIWoTYvC1c22j8pS+4eGNWkFvhVyywdxnMaKzQQdrQr+kjzWfmlGG2v3ZVZE2RxtTCJ2acxijA50/8rxzwT8+QZE/fst4NPelvN9S41bIIDFkz38GFjlKRMvV3euXgGQD3LSXp96k1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669878; c=relaxed/simple;
	bh=ENWWrsnBYl+LeVCL2OPYZpa5kw1NCFAKlMH26OmlGO4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bT6gOlLwoRHdkO5Yik/cFrtG7xDIrU0swyrRVVAz62XxkXiQL+X5kdN+VhLd5FvP77iazeKRZbZTjoF5gLGn6jJJKIK+0m9Gyk6PgYbIOxyV/GgNpH0YJWw5cZjFvposOzwDrFE73rIKxekOmhifyeIAQxYArlYlA6I77CzfrAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lr1+eHpE; arc=fail smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lr1+eHpE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789669877; x=1821205877;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ENWWrsnBYl+LeVCL2OPYZpa5kw1NCFAKlMH26OmlGO4=;
  b=lr1+eHpEfyQ/7111dxyUPXTHKn8o8XlGHooVhG6D/wIaW5KbSCV6DP5A
   s83wFEZxFUOEROsxQpDfs+4xGPEyNU39MvfD0no/MbrakFhRG8OYmmb6J
   R3186fPfVEYDme28DBgw/gudajEFEHtUFlXhv9whB8CwIKLo0WC8p2Yuf
   mtJtaPwe85ghDmLGG9ySmLIgJxXP9P83zSGJQFTiJK/V5tztdmI/AwbnZ
   sCLH25Uue8BDO/8pZDXsb4Vr8WH6eAOhCQR+/Nd30PQp9Dl2s5u5w8g/l
   uJ49n5VfT+Kyhs4i9z48Bou8emMmNeAxgj0Qh1y2CFS6WNJqEJkQxxP7o
   w==;
X-CSE-ConnectionGUID: nYaIKDIBSgGNN2nDnf+h+w==
X-CSE-MsgGUID: Ed10z/TYRzipCMcXFyxeVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="635498"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="635498"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 11:31:14 -0700
X-CSE-ConnectionGUID: BMayU4sTQ3ypuHDLrsLCOg==
X-CSE-MsgGUID: MXXZLTWiRMaw7XX52874xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="271304262"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 11:31:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 11:31:13 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 11:31:13 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.28)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 11:31:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z87DgnmZ/oZvaMcCAbr5RAS25tcFXS24ZQwPWvPjP4wGor+gpa0IIicpl9ElrIvOGBnDBjzZisxxR+Ya/rEOhaB0u6XqqS+kIfUssbL7hnToB9IVRBUaj5m4bQbRKofircYoNmY32FDTg6/zkfY2KS6XVobPDYiVxJCOGga9rtp8jgYjz4SnBY1671P1/gEnpBLNEyF66eWTHSu8X4kY9IUh68BnegmZ4iJHGnOW09vyg9FTfuypNHFhYq0qq95TWXc2MKxtdJ96SnfPmff1kF3l9Kq67bpLKV30sNDj8qtU0c7gyjRSHp0w0DpTtoDcib3VEk1XoAcUHF+12wMPrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R4bTuuOTlWFPy5Fs6h3s5kfAg0yp7zOKjT2V3cv/QUk=;
 b=N/ilKoxMlftV4L9asthPHL8sRI69+aBWqx1MOrsI6zv9TR1acblOSq9x/6r93W177LTF1/dCxFXfBln8y0669+e7bG1lMPAeSuXkIDBijcK1ilSHgd0CSVVVwfpFpV6V1zSKjmJ10Iw/bjS5ppfqTS6NNYUt3iuDIaLxzB5bkTqLsdIrYOCqA3hfl7qCWF1UGNRt0iZXT7W+Us8wgAUQ+x1p8iQmBfDd3jGsCNgfy5O4dRfMUy23L/qWr3Q/seTH93arnqgfwxH5f+ML2EkXjRI3baTsf62AQEyH3EZAcNm+vAjl8/fN6HF3gSfVaImczf4/ote+PBRCHp532R5WeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BL4PR11MB8800.namprd11.prod.outlook.com (2603:10b6:208:5a7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 18:31:09 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 18:31:09 +0000
Message-ID: <e88c02c7-5dbe-4dc0-91b8-ab8231c50d50@intel.com>
Date: Thu, 17 Sep 2026 11:31:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/16] fs/resctrl: Add support for hidden resource
 group files
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <bp@alien8.de>,
	<ben.horgan@arm.com>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <fenghuay@nvidia.com>, <akpm@linux-foundation.org>,
	<rppt@kernel.org>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<jlayton@kernel.org>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <seanjc@google.com>, <peterz@infradead.org>,
	<chao.gao@intel.com>, <jmattson@google.com>, <naveen@kernel.org>,
	<ricardo.neri-calderon@linux.intel.com>, <tiala@microsoft.com>,
	<chang.seok.bae@intel.com>, <prathyushi.nangia@amd.com>,
	<kim.phillips@amd.com>, <elena.reshetova@intel.com>, <darwi@linutronix.de>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>
References: <cover.1787772750.git.babu.moger@amd.com>
 <f7bcf19ac8113a1e3d9575739c1a6400c455ce6d.1787772750.git.babu.moger@amd.com>
 <34aa4824-810b-4c81-8188-f2f37e1dc277@intel.com>
 <948f5361-fc46-4d89-a1b1-cfbcb2ce0ff6@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <948f5361-fc46-4d89-a1b1-cfbcb2ce0ff6@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0205.namprd03.prod.outlook.com
 (2603:10b6:303:b8::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BL4PR11MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc4406a-7c7e-4e69-6eeb-08df14e9d7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|7416014|1800799024|56012099006|11063799006|5023799004|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: kMwYf+SpiwjDf2Pa6ZKyi/Hd9hib5EkQBgbhL6TZzuZxYRrcnBO0yJaUFuCGLR/LgXcdKdNeVOZmCCvlm7H33G6xV4DU0u+/h+nMwXoUt45+A0yokHKKxwR6XrEQotRS8yxZBzkSLOY5QOOcZBLE5ra+dQdWVBojXZaL3Ui4nOU6Ql7ut6JfQcCJVUr6bCce+YaUlmY7XKv1JNyulHJKjGhxVEf0e3DH7DxtAEMWaXT5KFH4npNrYj9XOoFheNPQhf2sghdWQv+LBkX+CJYAFAoM9kKka2flR3m8IMqqRlXVqj8uScHtv3GzE0OPiWmh6uX9qUEUikm69PBCd1Psl5is2rlReEl0AqgS7ythaWuRAGpXbPh8bGHuBpSzQZMmCZh82Z7Gc5P733XYJlRX9OLCHayb0oIswS8xhgfmjnrxBv2Dy+uMqBOIWAP9LkeIxxsHPETcc9jYpXXP8sMIAdpn0P36vEnBuj92LFBV9qUmStiYzFI5hLttPx/+zyg2Ny3dW5gPKAxYZqrtJMEX4XrFkdy+ZG9jHcriAZTSIFJLpAMdWfa3j4jxC8JaQQ+HMV57d/p+uYPPNUXl0Kjaa1PcAt7X6zhxCZ6lAacIQwWWB3DEw26pRwcozPlwrRD9jiczlKr7mEvMvb5D0K1vELyvXQa89YlmG+KLQf5etaE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(7416014)(1800799024)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2sxWlBwNTcvTWVmS0VlemJ0OXJCdUV5Zmh6MEp6eHQ2QnV3ZUdraDRUZUxx?=
 =?utf-8?B?MDJFOUlHRG0xSk5WcGh0WFEvNGtiaGZtYk92eEF2SXQ0N2JVSHQ5elRmdW0r?=
 =?utf-8?B?UXJaeHF4STNBOFRmWGRkTVJ0emFGNXo4S1lCWFZSTExpY2hGZmd3VldXZXZ2?=
 =?utf-8?B?b3MwRVd5QVpQcVFpWVZpRjdsemp0bXg5MTBWbFoxUzQ1bDlEb2Q1QTliaW9C?=
 =?utf-8?B?Z3BINE9HeG4vUDJXbEpZM09EUlZyWW00UGNpQkUvcUJuN0dIeThFdnlnTjVj?=
 =?utf-8?B?YXkxL3RJeDZNeG5mMmdPMlhLdkcwbjJuby9hMHZXN1ByWktzQUZoTVZhWEYv?=
 =?utf-8?B?VHZGdUQxSGVLU29saWhzNHdIcmxtaW9sRzZ6RFV0ZmllbldzTEJUME9XbTVK?=
 =?utf-8?B?cFlkRUpMVWxDblRwOEtKbUgvVlFhWndzOTdoS2h0NlMyUm0zb292SWpEdXlL?=
 =?utf-8?B?U3B0dEZscWpqRE1QaWVmQWovWEc0SjJCb2xObkFyMjBndUNmSGllVURNNnZs?=
 =?utf-8?B?Mm1yUmJtRm8reUROY2lGcllnQVdQUVh1OUd2V2ZreGRlU0xHbitXQzdEMTda?=
 =?utf-8?B?ZjRJblpOTUZ5UVQwS0xZWDk3Y3VEclJXY0JWTGx4UkRDSEQ4SktpY2VGMTU1?=
 =?utf-8?B?SVc4ZHl2ZUkvcEFuZWwyS1FnNHpqVldFU0xUaEUvb3dLeEFIZElxaU1idnNG?=
 =?utf-8?B?V284MGY2QmdINVJYRzJGTkpSNkQzemt1Q21rQWpwc3A5ZHd3UGFoYmQ4UWVE?=
 =?utf-8?B?dTNDOHg5cGQxcjlleTlxTjZteHZHaFczOEc5THo3VE43VUxaZEswVlhDVEtR?=
 =?utf-8?B?TVFWU3orNXk5V2JtNW96SjJDdDY5ZGNuaFNiWGExZGNkVENkQUgvNFp6YXVK?=
 =?utf-8?B?SU5OUnJjNmRobFk5UFdvZ09GSmRDOWZseVFkQTQyYnNHVjlONFRjRjZ2a1VQ?=
 =?utf-8?B?NHNVdTd2V200aW5FVURCKzB4Vy9ldmRYNjJLQWFvTURwUWVPVDhwcXhJdG9C?=
 =?utf-8?B?Yncvb2lyYzBwMkRUUHBsaEdBUFdtSVRyOE4wMkUvWFVzS3ZpSnB4QkF3endY?=
 =?utf-8?B?ODVEcVEraWhtbkVET3ArL1hMQ1FOTDdRL1p3KzRTZWFxbEpva0RHMDNwTGdM?=
 =?utf-8?B?ZVdSVzlobUtmN0ZqanR1MGs2b0NndkNsMzZESkIraWI3YmNZMS8rSzV4aHhK?=
 =?utf-8?B?Vzc5WW90RFNJckFKdkJ3cEREUzNDZnlpWCtlV1YwT253THlGSlM5cWxIak9H?=
 =?utf-8?B?T2lCSzVEQW5zTWp1bmtDY3owUjJpY2UrSnNweFJPQnl4Tm9zWDZZbVJUS3l6?=
 =?utf-8?B?aDlnYzBjNXgza1YvTCtOc3ZUNFN6QkxFaFZRM283V1AwNHdzOVlTNWJNWE8w?=
 =?utf-8?B?emtadUVmcTduYU1hSmoydVE5ZUVLa1RjVWF5VU83TnVzd1hrcGFnWHFJa0RD?=
 =?utf-8?B?b0ptL2lrZEtUZ3JLTDBrOStnSHFXZytpOUpLSlpXQ3FjVjF4ekdGaitOQkVp?=
 =?utf-8?B?dnIwRDNzem1QaXlwNkxkOUszNXFwYkY5SzMzNFhMTjZiNkZETlFQWXowMDdD?=
 =?utf-8?B?bU1JMnVHWXZzandMa3VVTWdqVzNobTVqa1ZwWFNFMHBxd3pXK1V3blEwbStH?=
 =?utf-8?B?QTZTdjFMbjYvaDRWVVI0Y1hnSUtHaHcrNm5jWEp3U0pxalQ2ZUg5WkRGZDlE?=
 =?utf-8?B?Ui9DNVExSjVsblVpL1lhb2gzaVNvWjNhNXdmLzBzWjNCek5UWGZsR2pQS20z?=
 =?utf-8?B?YVBObDBScTNVczRGRDZvTWtoUWQrL2lWY0h3M0owQUU0NjQzR1VOSEJaSzJD?=
 =?utf-8?B?QVJVYnVRdlhJVUNUU1M4Qmg5RVBDaERQQk5lVE1yTXdycERsaGRuaXJpQlFN?=
 =?utf-8?B?M1N4aFIzMTZnYzgxNUowcU5aUUFKYi9Yd1ExL1VWemYyNWJ2aFVhdEV2RnRB?=
 =?utf-8?B?QVhwbWgyc2cwaW12cU0yYWNUaGFMa1ZHL3QrOGxoTE1EbE5MOTdNVGw1bjJM?=
 =?utf-8?B?MjBNMmJLRi9helM1ZUVMR0pSekk5dzZKc0xrUFpLVE5JVFFyQnZvMEZCbnh4?=
 =?utf-8?B?Kzc1Y0dUb1lWWGNLMyt4MGJ1MDlpVUtOUVpJQURJV0dpN05vcFN3Q1orU1BV?=
 =?utf-8?B?UVpZbHJLaGdYTTJKb2ZsN1B2SnhhZXBWa2FIZmNPa2VJNTZ6cUNPK2ZpVUdl?=
 =?utf-8?B?c2lZcGFhVG1kbXc4OGd4UVQ4UmNwTndXcUlHMVRFT0JFZDUrUkRWdjNUallh?=
 =?utf-8?B?NFFidTZqdVlIeXJCUnUwUE9rZkF2Q1N1eTBwWVI1aExubFoxbTFjRFhSWUtO?=
 =?utf-8?B?aEpOejh3RXc2VURlT2VpdGg1Q1R3eVZsRUNwOWRjUU9IVzZKKzhGV3pzY1Nu?=
 =?utf-8?Q?NUfyQT8YupXish/Q=3D?=
X-Exchange-RoutingPolicyChecked: OlQSfXv8p1Ycu2sC2N5GTKh+EG4DqvC4Cfv0VgUUWS/vr+7wntogFuJ4OJ2Maf7NIlB2LPZnSzim/OqYas6oMq1IK4bdQ9UeORfCge0fgB1qN7LlmkU+21epMcieaciJycH1hpEXjNlI0NuK+PwYKtLFqfLL991+X0CIFsbSeoJAuos3hp48xOtRPK5oHlxiHMT5mmcJkVJn2ur2s3V9Ozx6Udi1dyEkfQ+UHVCkhIMO9SUd5hRn+mdNSDOV56kcXiaSlo4y+N2mEc8lW9xtlNfOEaDto1W1dpe9BIv5VVUmGPvmaiYW9dzOCA2rwV84IX05yP5dswNWG/YPjhVuow==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc4406a-7c7e-4e69-6eeb-08df14e9d7a3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:31:09.1255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGnG72SUo54wmogRT3axd7HSYPEFvJMGJdF/Qy4vgazwaCBsnaXdB1KDo0SsUxVFQTSHtbqdSWSj8RaatG9XyzZbsBLw9pBIn/9w1ijDuoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8800
X-OriginatorOrg: intel.com

Hi Babu,

On 9/17/26 10:26 AM, Babu Moger wrote:
> Hi Reinette,
> 
> 
> On 9/16/26 00:33, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 8/26/26 12:32 PM, Babu Moger wrote:
>>> @@ -2377,6 +2380,33 @@ static int rdtgroup_add_files(struct kernfs_node *kn, unsigned long fflags)
>>>       return ret;
>>>   }
>>>   +/*
>>> + * resctrl_hidden_files_set_visible() - Show or hide files marked hidden
>>> + * @kn: resource group kernfs_node
>>> + * @show: whether to show or hide
>>> + *
>>> + * Iterate res_common_files entries marked hidden and show or hide the
>>> + * corresponding file under @kn.
>>
>> As a generic helper this is not appropriate since it just blindly makes *all*
>> hidden files belonging to a resource group visible or invisible. This pretends to
>> be a generic function but then assumes that only kernel mode related files
>> are ever created with the hidden flag set because as the kernel mode changes
>> all hidden files belonging to the named parent changes visibility.
>>
> Are you suggesting that I update the code comments to be more
> specific about the group, or are you suggesting that the code itself
> should be changed?

Both.  The "hidden" flag is *only* about whether a file should be visible
at time of creation, whether it is by default "hidden". That is accomplished
without this function.

Whether a file is visible or not after initial creation is feature specific.
For example, as is done with resctrl_bmec_files_show(). There is no use
case for "make all hidden files visible".

resctrl_hidden_files_set_visible() is a hack because it pretends to introduce
a generic feature but the implementation only supports two specific files.
Consider the scenario when somebody tries to add another resource
group file that is by default hidden. Just setting the "hidden" flag will be
a reasonable thing to do, but that unrelated file will have its visibility
connected to the kernel mode feature!

Please replace resctrl_hidden_files_set_visible() with a kernel mode specific
function that only controls visibility of this feature's specific files. That
could even be in a separate patch.

Reinette
