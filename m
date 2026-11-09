Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794203464;
	b=mcbGY74laga9ll9jH2KFZLc/UrCgk8sKRPuDjoJ8mVtx3ifx9WimNxOAUw9WyJccME+h
	 6NjzygOFhdQjAKoT2wg9TTDe1yOfWagtCZJj9XhO19m4+BC9koiR43vk+H4ytDvOB4Kfa
	 vyrjMyLyXVz5p2ozIUtuWh7kfjTmAoKcpLXXaIT53zdKHCGb3tmInyLuZQGy0lXHc2dUJ
	 zAtfLTaVlmFgfu92HaNxN50m+x58C8yDEtcyi6Gti8lZoJxwnc0tbb0QfE3n+oTijictK
	 NC0dbw8NHAa9fYo/3QXzmVZwHxrHdtjINmHT4XTvcKhFIHYl/tm8RLUDqYoFdwqa2UA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203464;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=B6FE9v+ArxeM06h/Ix65lYRL5DVFqgEJKKu544I1jIg=;
	b=Z8SrrA/PyIMZeCZpY8ttfqSD2/UkO3H5c2fZGu4lndZvTe6HUogMnw5ZQTqRQk4nfNBk
	 c6JcT5mcjPgy43PPOwYV6XSuCvXWSbgM9V2ovzmiaWWfqbESCxHRWotno9LgFSW3bWqIk
	 8JOImVbKD+x++hwRFHwK5HsaC00vDfGkiJAXQdGBtNYe9i3a5b3mBgbtd85RdTz9X/Htb
	 4dAuTsESpX+HG/Cw/e834AupcxPZWBHjwHEQEfS9bb7djsLjG7H/mhEz0NHXW99ltxYor
	 KnELdk86AY1u1t1pU7fhdo546CpW1TnMkZYqafGw6Kbie2Zwr60EeD8bO4+YdS50LFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cq5+ncoo;
	arc=fail smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A166D606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 05:51:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A166D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Cq5+ncoo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794203461; x=1825739461;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=B6FE9v+ArxeM06h/Ix65lYRL5DVFqgEJKKu544I1jIg=;
  b=Cq5+ncooojjGdcx8EOqipQPjXG9HvYTqvvfozNsoaLLSOtrjuJt+EviM
   BK6+FXLyGByP1EQHhYzNjO8AgupEuPhsGVGx+rIGDH+iZH8OzzydpyFRq
   oi4HpLeV694Qu26rp7lo+lOEQUIv0on1H6cSigOjJvuYOeS2PovURTBED
   Dn9XfJ+EmOLp5XNVwn0Q9o03r5SflIQqbXayXXQBofrrEocbjecbSeW86
   yhcrUyy+y0WplHj6DZsfYF/Vs1go0MhcJHhQbevyS2znwfWf3ApwaP2t/
   V1SGuTVdXVvk+FQIOec1d2O1lUnZxMlKMMUmw+gTN+BMvsnZhG5pGhsXH
   A==;
X-CSE-ConnectionGUID: 2guV0DDoSZKtHqbUrVGdNw==
X-CSE-MsgGUID: 36kfMwjfRAqFhSL47+a5VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2820377"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2820377"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 21:51:01 -0800
X-CSE-ConnectionGUID: 3XG5d/YCTUC4BYxGWXD7MA==
X-CSE-MsgGUID: DtKCBbCPT+SJP0bzNRcNwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7925737"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 21:51:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 21:51:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 8 Nov 2026 21:51:00 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.15) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 8 Nov 2026 21:51:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyQtlJqdC+4QV+lg3UlWP2BIKDE53wC+yWluvDgb42+9Y1nsWE6bvyVAcHCWacvdv524sMR+b+cXoDoh5k47hCWn+3kQcfEKBLgrEihNy2fSteceh0oXybVqlvLjbqhOwuzVTIt8MGW/UD06F1wbo49cjvuhi8Z6gK2kC4VYfK3uO0ikcHeGCFY2u6rH9VSycklpHhOSbXhq5MoiouuhAomt789gtXRnaGGtryClg7vOLzOellxxVv0pOJNKfJv7aGstukiBfoOeaRbTGtdLQoqKyJDGek/swvJPsdKiabP6FwK65srJQlu7OkXSmr2+TxBGUAWwYRcnfuiXw7HoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B6FE9v+ArxeM06h/Ix65lYRL5DVFqgEJKKu544I1jIg=;
 b=r32wiffVWJ/0pDDsesQzsM6zy8iP5uHwVHJ6fe4yrRPzOOObynQnrjDbP+je1U3NUDS6VBL+sTgAA1nubPjeDH4m3t41JHF428+TYkMgg9N3BSPzPy7VJzk8nNGnQZfjN99nAEOwrIuK1ZaDgIHeqXDEvn2a7OzEjJ7eYt93OTYpMJ08RMGJ9nOm88pSNfYBBUWMi5j8hfBglb/zpXTEIbgbbkHn9QUPcM9LOH+nde8BYCCC1HWHiw40VigsC3zJ1eZvmPCbS+hbEZ9e4aMevQkDUzQshPlSGSN+VmRK1qfmkZfQgx5eRHNoArz+dDcCJwYfgTM0HoilbbxSBMgREw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPFC295640A5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::852) by PH7PR11MB5914.namprd11.prod.outlook.com
 (2603:10b6:510:138::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Mon, 9 Nov
 2026 05:50:58 +0000
Received: from SJ5PPFC295640A5.namprd11.prod.outlook.com
 ([fe80::1142:e767:1e8:d9d3]) by SJ5PPFC295640A5.namprd11.prod.outlook.com
 ([fe80::1142:e767:1e8:d9d3%8]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 05:50:58 +0000
Message-ID: <cea56196-29dc-4cc3-8e69-a31b4116ad6a@intel.com>
Date: Mon, 9 Nov 2026 13:50:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] timekeeping: Reduce magnitude of ntp_error
To: David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
CC: Stephen Boyd <sboyd@kernel.org>, Miroslav Lichvar <mlichvar@redhat.com>,
	Rodolfo Giometti <giometti@enneenne.com>, Richard Cochran
	<richardcochran@gmail.com>, Jie Wang <jie.wang@intel.com>, Ryan Luu
	<rluu@amazon.com>, Julien Ridoux <ridouxj@amazon.com>,
	<linux-kernel@vger.kernel.org>, <nh-open-source@amazon.com>
References: <20261106030856.2538039-1-dwmw2@infradead.org>
Content-Language: en-US
From: "Wang, Yuan1" <yuan1.wang@intel.com>
In-Reply-To: <20261106030856.2538039-1-dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI3PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:295::15) To SJ5PPFC295640A5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::852)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPFC295640A5:EE_|PH7PR11MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: d799241d-40f8-47ab-c14b-08df3e256d4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|22082099003|10067099003|18002099003|56012099006|11063799006|5023799004|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021135927099003|261021121427099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: tZYajfy131/NgGUvSzGDWiL9kU8cv2Hle34iEftv4pTv0ZyiqP/qTSY1B48hbtyaGJxiLYywqJA1DT/llu5Mz4+G0hFC2wfrxYxA54fOzoEhOwqs41cdGaTurOI+paunstVDQaReVkLBuyj2FCZhf0e/LtdAQwoduTtw5TEvLOxJu76UsM71tus9VarOBvgFQSKhIRVvtL5AmeKMakfp0/bFnb5fQVht/t0P0rp4vPNGwPhf2IgzRGtLZJcc/NuDShdSRvuiSytM0/xzj8LzARmS+mdtQZ5RfQWnekys2Ep6giyA1sGX8hgu2GIZ5qLOFlvNO+Ctln3wtmuiYW4vjIh/uaoh5C0K/3nZG41RFJFN6yH0mUnrp96dP+4FbtGSOVv2AnEleXNy24xzzG4dk/xs/psvgtFrhS6AIzwy8UTOBp2Igv9LEBfUYaq3n8WVM1K5V2XH4R9sCpH57se0Z32SyGyoHNFELoERXe+nm8batIW1MWj9c0jz9wqQJcbJnnhCjIr7zyLS0jkETxfn9ODuoMCL8Og4hwUy/WkIs6oU526l/LA9vb15ROBRjaT4YMkNu+YUddKOLqJp7QREEbfjKgCdh4nCGDzbkO7uTUcC9qNECtpc2z1EVf74yAgk9hYamvgFKbH6J9V2s3vcmRgSOdCMNFZQDQghq+79yz8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPFC295640A5.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(10067099003)(18002099003)(56012099006)(11063799006)(5023799004)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021135927099003)(261021121427099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlJQN3NVZ2EvYlRRa1VUcXZrNjJRbXhPVHIzSHRwcnlIbWJkS2ozNzY1NktZ?=
 =?utf-8?B?UTBGdjZiN21LdkJ0aFhjUXRkejFROW9tZ0o1MDRkMnZwek9aUE1TS3RyTk5K?=
 =?utf-8?B?Wmk3M3dpK1FScHJLWlRVU0FlNFk2OTBxdElMTzN0a2RvejQ0eFJVRlJHVW5M?=
 =?utf-8?B?dWk2ZWlWQ2JkamNDN2RwUmF4WlpCVDJyVDFmNFA0dmpyVEZPQTRZTnU1TjVn?=
 =?utf-8?B?QjZka293VzV2c2t2dkRBemFVQWRYTGhUM1FYaXIxbUU3V2tVQm5rd0pGaUVk?=
 =?utf-8?B?WE9uVWFsbGVkS1pTdVFrVzFkVHdXZVNzNXR2NmZFMjBNdTRtVENMYlRxVGpG?=
 =?utf-8?B?OTVPekVrb1lkWUZlU1pXUXVjT3Z3eXA1L1VHaUxhVWhlTW53ZnlWL2NIL1cw?=
 =?utf-8?B?b0QxZHNNS3VKckk1V3NDaHZmdGtYRTF2V052QU5iL2huOHNqV29rZFVrb2xM?=
 =?utf-8?B?cVM1NzVldzZIeFVsL2ZIS1FZREY4OC9ueEVOUG9QWVNMc1l6SDlUYlE3Qk5i?=
 =?utf-8?B?NTF1OFN2N09zRW12WUx5V1BBbVhaSnJaZVJ6dm5UMTdnWHRYSGIzeGVRellW?=
 =?utf-8?B?a1dyZ2N1VjkwMHc4OGxFbFF1Qm05S0hpMnFneTdVYmVFRUtGaHhPeUZLK2NH?=
 =?utf-8?B?WnI3QUFrZUxGdFYyVTRkTDFMR1lKdVZnc2Z1ZGZpaE5mUGZuMFBvZTlWT2pF?=
 =?utf-8?B?NG9mZ3Qwcjc5cTFnVFRHb3Njd1Q3V2ZmZDBzOG00bk9BTEhLcFY5VUpkVUlq?=
 =?utf-8?B?Y0ozdEFPMVYzdis3bzExdTlzTVNzSzNSM09tUldrcStRYVpyNEpQY2t1K1RC?=
 =?utf-8?B?RU92YnZ1Q1hmckRhajR1N3RJS2kyZGYvL0d0M215V2kwY2c2SExIOFRDaWlh?=
 =?utf-8?B?R0tJSjhGUHVhR0lrL1FYNXNMNFl1TjcrRWhzSWZHTVRTUkhXN3ZDLzg1eWY1?=
 =?utf-8?B?U3htTThTaXp3VXlyZUZua1o1OTMydGtmL0J4dlJqWDBhZHBvYWpiTHN3c2h3?=
 =?utf-8?B?ZjhZNlk2eWlMZFl0WFN3TXByVEFwVHQ1bENwZUxDNXNsZUxxajRxRUdBRys4?=
 =?utf-8?B?Y1lIbVRXVWRhZExrSTlFcmpqS3FEakJoZDlwbWlsTG5vOGZxQjhNeWFaNWlO?=
 =?utf-8?B?QXZtbUl4L1VIREJZRzR5TG01ZVBBS2h6S08wbVF4U3pyMEJuRksreTVsaTRz?=
 =?utf-8?B?VXBqWWlxNm5FZlFRZU1PdkdudzBCMkRNSE5WNkNoUS9DUlk5K3Y1TVk4eTly?=
 =?utf-8?B?WHIxUmFJZEM2bjlZYndRRTU3bjRVWFp6dmFxM0dUeCs2MHlKWU9XU1ZXcXAx?=
 =?utf-8?B?S0VUMXhjWmh1eTZiTFdPTFhON3AvdldXWVpVRHA0RmN0K1ZIeEFsSDB3aVlQ?=
 =?utf-8?B?UkN5bTJ6VzZjNVRQQUlTVkNnYTVCMnJZU2pmb0tkcC9hTkJhcEdGY1lWM2E2?=
 =?utf-8?B?RlpHSE9WN2ZzVXd1NHZvU1ZGTVczdFBtZVk0RWJRS3JZV2dSZEpsRjZkR2tD?=
 =?utf-8?B?cUdLZFk5U3FYdjFPZWZpMGhGUUw4MUZyZ3VwMnVheCtERVZOaEdtZlNJTmtK?=
 =?utf-8?B?OXZZLzMwMUNIWnhadzdyRUdRTXM1M09MbmxkdWM0cnhzbFN3WHJaZXRKcjVS?=
 =?utf-8?B?OE1RWDRsRTk0Rkxnc1NyekVObzZXVDBQWVpUSE5JZFplczIwZG5OSmRRaG93?=
 =?utf-8?B?aDhRTzk3NUhKZHduZXloeVBCeFJncFNFeDVWNFMxN0RxdWVLb3VOMVJXU3k3?=
 =?utf-8?B?YnJueFBiek9IOS8xaFRaVnFsNTNOZmNWVllJSS9ZTlg5T2dOVm8zL0p5ZWRJ?=
 =?utf-8?B?RGtIa1p0Z3JSNDV5a3BPOTNzOHVRVFRjdTEvOWV1d0MzT28rU2hhSGd3WTUz?=
 =?utf-8?B?d0RQQ2tJVDJKQWg5ZUJoNUdHUEF2Q0Nyb2JFTkdYNC9QZEg5OGpsdVdLMWZR?=
 =?utf-8?B?Z2RYS2RIazl2L0NXU0R5eW5EOXVwTEhXbCtvcjhYV05NZm1raEFLVy95ejY0?=
 =?utf-8?B?UEN4L1IxSzBjUjJvYkg3SGVBNmg3OW56UHpjZ3plWHI0TG0vSmVsTkNqcFE0?=
 =?utf-8?B?bzluQXZPZlFiY2J6UU5ZZm5MNmhQZnhkSVJrd21ZcEtoUXMyQUxBQUR4WXc0?=
 =?utf-8?B?V0VXWGsrbS8zZFJHN0RsR1FxQXJ0NFNucWQ1RWIxdmpydTdjN3daSVNJOUFN?=
 =?utf-8?B?NGRUMXJ3V0VmdTA5Q3JNbDNObHhGU1dWeUZZaU9iK284RTVJK3Z6M3lyclFK?=
 =?utf-8?B?eVQrZFR3M0IrOGVyZFdHTHUxTjFpRkF0TEdtRDBFYWxxbzduNG16RjRaU05o?=
 =?utf-8?B?MDIycXY0ZVhETzZPNWJrU1luMEhMZVNBUStHOHdtRVBWTUpSd3Ewdz09?=
X-Exchange-RoutingPolicyChecked: rgpSLkUMRaq1y+KWihGTt/PD6z2ESUH8F560C55TJKB4fLRNOu1uMAnaWm4Laocs3ZwsLAHDLUy8l94AhoSJ/yuTAuUVkhbZEtWwatgWqocFXf7nyyS09SGzkyjT3DdAycBpbMq1lt1htXXq9LdrEUS28ZsbAbKk01qIck4P7TbZ09lYlaiNHP4K5PExVb7EHa+ic10MtOR5+mKojR1BIV10m7zuxtV6sMNRSq7PGogjgzaOwKVewgVWQLXbMmc8GF540Z5/YxJefPNYI9bXUQZPr08/DdgrZW/4vpt1GrMMvVjzjos0083JmIvYNf4JHoLBRwmgzc6OgsLJxql5wA==
X-MS-Exchange-CrossTenant-Network-Message-Id: d799241d-40f8-47ab-c14b-08df3e256d4b
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFC295640A5.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 05:50:58.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEs8z0OVJuKt3W3w7iWkDaeEmPTyxAJSd+YxzDZf0xDzFtlK5OdHcZHogU4qXx1dbIQQxPMxefIX9va8bW/xOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5914
X-OriginatorOrg: intel.com

On 11/6/2026 11:08 AM, David Woodhouse wrote:

> From: David Woodhouse <dwmw@amazon.co.uk>
>
>
> This turns out not to be theoretical: Jie Wang reports¹ that since the
> v7.3 accounting fixes, phc2sys takes minutes instead of seconds to
> settle CLOCK_REALTIME after a step of the PHC it follows, because its
> large frequency corrections are charged to ntp_error and repaid only
> through the dithering. Patch 1 of this series is the fix for that:
> Yuan Wang has measured it restoring their gPTP settling times (back to
> 32s from 200-400s or more) and withdrawn the RFC posted in that thread
> in its favour.

I tested v2 on top of v7.3 (Intel mainline-tracking v7.3; kernel/time
is identical to upstream v7.3), both the whole series and patch 1 on
its own.

Setup: two Intel i226 NICs back to back with gPTP (ptp4l + phc2sys on
each end), PREEMPT_RT, NO_HZ_FULL, HZ=1000, TSC. phc2sys reads the PHC
with PTP_SYS_OFFSET_PRECISE, so patch 6 is in the path. The
grandmaster's PHC is stepped by +1s three times, 400s apart. The
numbers are the time until the offset stays below 100ns:

                                  GM phc2sys               slave phc2sys    slave ptp4l
  v7.3                        207/>361/>413s       114/79/293s     34-35s
  v7.3 + v2 1/6         32/32/32s                  40/41/41s         34-35s
  v7.3 + v2 1-6/6     32/32/32s                  41/41/40s          34-35s

">" means it had not settled before the next step.

With either kernel, the steady-state phc2sys lock is unchanged:
7-9ns rms and below 35ns peak on both ends, before the steps and in
the second half of each 400s window. There were no warnings in dmesg
and no ioctl errors from phc2sys.

I also ran adjtime(+5ms) with nothing else adjusting the clock and
measured the phase error left once the slew has finished. With patch
1 alone it was +1.5 to +8.4us over four runs. With the whole series it
was +0.47 and +0.61us over two runs, so patches 2-3 visibly help there
too.

For the whole series:

Tested-by: Yuan Wang <yuan1.wang@intel.com>

Thanks,
Yuan

