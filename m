Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793930329;
	b=5VbZhfR9iTZFTGjFJp+AMmNTijs/s0yknCHi6XmS3Dozb6wG3YTATthJXLpB4Iue3COp
	 Ol/qTflfdlquy6vYR3bmiILQ3+8vf6NfZqqGdZMzf8elJfkmGxDbENe/Xu4xGC1ZVJQSg
	 f02dsJyxnP6Pf45ob4zJxuKohe8YOOPubNdyY0jUqGA/OPTcK8PLpJyV+dk8NL3gGjU5Q
	 zKqas5fhFMpwvP65rrS3JaffDidRrONddtFCMJT69tgTkYN2+bwq31pa+fMcPBLq3zb6t
	 zjx4/IDMeD6EJv95VKnh8+xP6VFM3uRCFEQ+amDMCWvTu3z9Fv+M/2s33RtYxep3jWg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930329;
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
	bh=sLC9qBHeOztV5GXiFFjS3hm+l1np66rxOInBt5vljzg=;
	b=r7xl7H5aua4Ddb5kqty7smUiiP0calt/U8c5bHn8A6I6xUufaGxjVUzZCdhqm/dujgG+
	 mGylw1GXtLJWKvnWW2S1XsXH10nC7fddPpImGhOu3+yuPQ8hqk7wNf1q/agtchWeTFumk
	 kHJFrVLmFUtbZxtweV/34NNaj1pH7zBXKl982ZN4V3rowhvRi1dGLkqnUUe1zz31P7MeW
	 Fk+is/g6hv4r8mDI3fRIzfffgZEQ9vOQaHjrLgt1VIVXHCqA71BzNoOx4/uTIFQk0nP5l
	 U2nR3gWzF3VpmTNRDSFApCewoK8oLG9eZBlz7sfogjeXSgv2oFyKZ3lZvIr72sq0e2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="nwVB/dYD";
	arc=fail smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D629606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 01:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D629606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nwVB/dYD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793930329; x=1825466329;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=18bGgkmlER6AvivU5MF8sB45tDGDFnAsSAzZE5qXPzc=;
  b=nwVB/dYDY7UAkMk1nbHI13yn3GZTWznq3wypDr4BTu92hm6IvtApVfXu
   6mMwslzF0V4VBNiIlsERKFnxFIlLtoLwUL/AwcwO31amvddnSHpDypNzM
   wE3JHiXnf3b6VAGIalUnIjfPPlcmo2h8jMLKL6LQbTw7vVeS2K8t+YUMQ
   iViewb97LpEKE5JFmie/OU76kRWhIxH61gnQs5E/pwKhmXrsGjuMquL2M
   VWOUCvVRkBK7UXAz8aX5kv9yKZDeK8zBrPrGYHsswg532RRN7mtXBNx8k
   os5m4sR4YRvIpdQJPCqym5weTEbrbLnwyZhXLmCFCSSDs2RGtjBi3Vgo+
   Q==;
X-CSE-ConnectionGUID: ZCYF6fb4R4eUw7AgQfNxZg==
X-CSE-MsgGUID: RFAWRI/qSFSu2vCl06AH7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2779020"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2779020"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:58:49 -0800
X-CSE-ConnectionGUID: Yh7GLMbfQZWLtZeYDU9DIw==
X-CSE-MsgGUID: bVcgxWnuSGu3uilHbsmAeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8916674"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 17:58:49 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 17:58:48 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 17:58:48 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 17:58:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkm+4blnSVd86qGQka15cCrpNcYDMJFrMd6OtInGL+yajShD2sbwrI9b7UkTw0MZ4SuH2yS+TBcUQozrSYM5mMbSmwA8x3a2kQGj8/6b3ouYqDXjhllmgmGSiZ148dcDytwB+UXShAjekRP5Y7ChFOJ2+r6mVXOcSVufqIn74dsDMWvxm7pMyC+TUUPqj0xBy0WCs863+N+0GW4GanBnp9is54cUyFy6Pk98r30dBob+UY1xaJya6xSqLrBG4Q+31gfWXoS9N5soZc5bVwvuN9IbBsennMbu9lxckus25TjvpDlbff1ogCpoOsI2knKvBEKCgIigqhacA5QA1BcFAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sLC9qBHeOztV5GXiFFjS3hm+l1np66rxOInBt5vljzg=;
 b=flYL8IECRtnTvqDXN0qfL0qZbjyD/TEXyAJ2AdURUnvdmz2FCYEv7TD3hdiQ8oIsNmWGIPnwmiODI/mwy5WLH4ZII50Wwi5gQ7ozC8hq0uuM4bLvKCe2xHqDR3u0wm1zUgvpaC3CasgqzSdquZjzdpkANe3frg3kntqMZQ7HdFJaSBeOlxPjNr0MQdHFz0+zoRP27/15PXMOtzVvlkxTTH5HDg8Uk2MiHREfgGfx4YTv+sU+TNmfxA8+WUryojQ21Nz5kdZcsy1X3JNWmYhAMw3LiNEil4SDy+rDMOCiPzbzTwuglV95a0NtW8jDxxnxsBUHhNI95fR2vwPw6RgB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPFC295640A5.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::852) by PH7PR11MB7572.namprd11.prod.outlook.com
 (2603:10b6:510:27b::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 01:58:40 +0000
Received: from SJ5PPFC295640A5.namprd11.prod.outlook.com
 ([fe80::1142:e767:1e8:d9d3]) by SJ5PPFC295640A5.namprd11.prod.outlook.com
 ([fe80::1142:e767:1e8:d9d3%8]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 01:58:40 +0000
Message-ID: <f8eb574d-8dcb-444d-a26d-0b42edd9cad8@intel.com>
Date: Fri, 6 Nov 2026 09:58:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/1] timekeeping: Don't charge NTP frequency changes
 to ntp_error
To: David Woodhouse <dwmw2@infradead.org>, Miroslav Lichvar
	<mlichvar@redhat.com>, John Stultz <jstultz@google.com>, Thomas Gleixner
	<tglx@kernel.org>
CC: <jie.wang@intel.com>, <yifan2.li@intel.com>, <junxiao.chang@intel.com>,
	Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
	<linux-kernel@vger.kernel.org>
References: <20261105032150.1763572-1-yuan1.wang@intel.com>
 <cd23df8dde221a908233b5dfde548383991b4537.camel@amazon.co.uk>
 <d0fc242d799bf0165b6dd83ce2808acea14b4d32.camel@infradead.org>
Content-Language: en-US
From: "Wang, Yuan1" <yuan1.wang@intel.com>
In-Reply-To: <d0fc242d799bf0165b6dd83ce2808acea14b4d32.camel@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR06CA0001.apcprd06.prod.outlook.com
 (2603:1096:990:77::29) To SJ5PPFC295640A5.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: SJ5PPFC295640A5:EE_|PH7PR11MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: c71c3ebf-5b77-4779-8463-08df3ba97ab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|261026121527099003|56012099006|11063799006|4143699003|261026140227099003|261022075727099003|261009223027099003|261021135927099003|261022105027099003|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: dn9fuz0O+eVQEAJ5Diiokmbhm9qAOQUa+j0uTTl4NdnF/QfXfMFOtDWaUqNqOWXlWN58swRfxDDWMrbU9idlW56148/sRr5p0EHO/Iti/9pRjpkG3n5k9t+G6T+g2L7hqIQ7bj7CjRkn/1W4mUzclDb/V6fIqrYwS2uN3ZxCoTRiIa+QbUIWb5E8wOs9QzzI+xKzb7X4yU0eGDlFr0cnLOeAXBHljCQx1/BoHOKTqF+J96Ybq0wBm+GP6ar7pcedyYGD2+jxAQukMsiEhzuBfppi70xejyB2Ho3+IiGdsn/nM88beRBjjNsIKQhXSMdazKe33zsetFF/ksW8VfDs5vbTslIsNNl1goJyGqAufEkK8Y7pP+RkOC6ln1UIvLW2BVG++0HX1LAt7SYZ/B34JC9b49xmX3kWYQIjhF1fOIMGXJDOJs6sqXR7d/kGZTldK3S2gR547Abrxnv1WibbjrufM+qjanbxT8OOr9mLxUxU2LHZTj1Y8Oz6vOBuprttA0WTiwLFIbXWnDNgcPUJic2hhhFRAxanYJ/7jiV5xOpDyp72vQWv7iPBOyfLEIGIxoTiLv4OVFQg6ct4BYbGRk6CusEoK2HywdIh4ifiFImO8T3vBEM8ZLp59BSlhYEn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ5PPFC295640A5.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(261026121527099003)(56012099006)(11063799006)(4143699003)(261026140227099003)(261022075727099003)(261009223027099003)(261021135927099003)(261022105027099003)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2pIYXRMQllvTVIzZzdGTXl2YllrSFN4eERFd1FlME9nTU9UeXRvSllRdEY3?=
 =?utf-8?B?cWd2bnl4dG1jTDlDSGgvL3Y4MXBKa2wrRnZYRXlpYUZpWWFpbUNJRGxwOVI2?=
 =?utf-8?B?NUxjbTkyREx5WGt6eU1VMHJuazNraDk0TkJQemxUNkI1SmJlbDFlc0pvVGNN?=
 =?utf-8?B?bVc4blFJZllQZFlaZDBKSlFPRGJyK3hSM3BDSG9sSngvdXNKSFMvamN1SVRO?=
 =?utf-8?B?eFMrS2tCQlhKVVdGTHhnSlVlcTByZ2s3cU42Q0hWWlBoZFFCWWd4SGxNOVFH?=
 =?utf-8?B?TUViZTE0LzNHWk8vTldGWGRCdkNMVDlzQVRBRERTS0FnNFJFTnBlN1ZCdmhy?=
 =?utf-8?B?TzFRSXBhK3hrR3B5QnIvVHpKdEhhVzlFMEpxMVh4OUtYZGZ4OWhaQVdXL2Fh?=
 =?utf-8?B?VWtjVFhOMm9KSVc1em5QY2QvczRaNytQSXMrY3h6YWN3dklXTzllQzdQeG53?=
 =?utf-8?B?VndtUzRZUnlSRlBldXRLU2hTUm5jSkRRb3JHT3Q1a3YwelI3OEkyL2JLUE1w?=
 =?utf-8?B?UjE0djhCQURlWlVINEp5TFdsanF2NzNXSjI3Q1UzaVdpNWJEcnRqcE5oOERM?=
 =?utf-8?B?Nm1PS0VyTTRHeFFtcTFPZWtzUGJJQXlyM3hBSmMyME5mMk4wUEt5cFpKeFcz?=
 =?utf-8?B?Wkh3bjNBa0dpRXZSeEhmdlBHVXdRZCtIakM3R0JCLzZ3VHVPZlMxNkxKV05H?=
 =?utf-8?B?a0NUK1BWVHBUd29zRnRzeHAxZ0l2dkhBZjRIZFEzQTc4OU01MSthL2VOUlph?=
 =?utf-8?B?cDljeTNWMkdUa0ZkZlF1VEkvcDJBNzF2aFZIVWpBQlNVUnQwU2JIaDRkdzF6?=
 =?utf-8?B?U1J3TVY5bWV1OSs3Tmh3UnZBL1BRSy9ERGMxUTN0bnloSlBQQnJTN3hac3Bq?=
 =?utf-8?B?cGh1RURTY0ZaTEJNc0JGRCtTeHRqNnBKRmVuQzcwU3JNNEZNdVRiOWMxNklV?=
 =?utf-8?B?RHNSNFFZV2x3VjRWUGJsOG9kd25FUERmU0gwaXo2UDUwTnZqUGM3Y0xJdlBI?=
 =?utf-8?B?VjBycG42L3o0dmh2V0FkWlFxa08wcGZLRGZ3d0ZFbndUb0w4THd6NXphZEVI?=
 =?utf-8?B?UExiTWtFMFJQd0hVN21QR1N2SzMvZ3pIR3ZQeUNEaHFDSWkyeko1R1N4ZFdp?=
 =?utf-8?B?VmJLUFdDWlVzZUlnUjE2b3d5OTlIdGdKOXN3Unlad1Njenl6QStnMEttcGRk?=
 =?utf-8?B?WmE1KytBb1hVdFlRcnJHSzFIQXErZ3UxdkJjWDhvL3kreHByNWlGVHJ1Vjhz?=
 =?utf-8?B?OFdxeE82WFM1OXlIelJQZlFFcVJQdXBTOEQ2S2E4dDRERTR5VVp2VEUyLzFH?=
 =?utf-8?B?RklhcjdseHZrcURjUFVhYy9vR0xReVFLYVU1NDFoR1VlZklieHAzL0h3cnJy?=
 =?utf-8?B?ZDR4b1BhU0ZUMWhZdmYwS0NqSnNJRlA2TDlESjM2NmRaeDlHV3pOeHgraHpy?=
 =?utf-8?B?d3ZrbG5wUE9JN2NUc2hnc01oOUkrM044SGNGQUEyVUpVb1VTZkF6WldWMjFa?=
 =?utf-8?B?R2wvWmg4WFVMTXVpV3R1SHMvMHdWdTg1TXNVaEY5MXViSnRSTG9ONWUybUNP?=
 =?utf-8?B?OU5SbDR0d2VTY3FZRXc2LzRVNW9HZXJEa2lhYmtuT040dFI3T2VBbXhGMit6?=
 =?utf-8?B?Z0VGQXFiZTg1R0pUcm1pcGtRbllVcVRhSVd0R0VySjArRmJHY3NNVXFPRHFo?=
 =?utf-8?B?NGVBUENVUjEvR0ZLTW5HSWRDQmh6QjE1dVphc05xakZvUGVOekg2akhSc3FG?=
 =?utf-8?B?dTYxTERWOW1DQ2RLd2ZFNHRERFlvQUNEdkNwQUJMT3FFYTFDZldlcUR1WEFh?=
 =?utf-8?B?OHZ2eEtHS0krejZFQmppMHlwUWcyaW1HZVJKZ2lPTTczMnVFaVNhVy96M25K?=
 =?utf-8?B?SGdTZmVWZEVzNXJlQnZpcTBqVWw1aExRdWh4VDE2Wm9nTVFKSHJRZ1dISUV3?=
 =?utf-8?B?dVd5Uk1qOTBQSGVsRE5abTNBRXc0aFBVWWpyMlA2QU1KOVdmL2xKOGZ5Y3du?=
 =?utf-8?B?YURLRWN2bkNOQ3RoNmNrYllnbFd6bjNaS1VSMnhnSDBhUDJ0bTZyWkVaVWtp?=
 =?utf-8?B?eExpY1R2MENqaml4VVF2cTdKUHlEMU1IUFl2U3FLUDArQnRyV2R0YU5ZM2Vn?=
 =?utf-8?B?UTdNMlpteER2V3VLdzVrUDhsWmVyOHJYMlhUSmNzczlFaHVxWjdsRDFrZzl0?=
 =?utf-8?B?WUtKbENvaGZDa3p4VkVLaEp6VG9HM0VNRFFuZzZ4N3RPZy9ydDljSEZwelBz?=
 =?utf-8?B?UHVkNjBwTjRJQlZXN08vWk9IbFpzT2pjZGRTMnhWSXEzL0E1K29lenVxb1Ba?=
 =?utf-8?B?UU11d0tXbXBvdVRpMHF0UmpUN2NhVnozV0ZLZ3AvcjBWaDQ4eU5TZz09?=
X-Exchange-RoutingPolicyChecked: zXKS4FbrmHJJ9t/ywNz1McogT3LWLFdsEiv96N12TXMFrxD6CADiidReygo+hEuW6jKcVISb9qF/otp1FKlVVE4V8jK54pvtkt+PDkrhQY4QR/5Un4tUCyTgtBMCtCdo97tMq/x1lUevHLSYZdOzQFJCem3D4N6Tw2g9zy58Z8O2bDj4j6oXUQTwAaJrgbV5Qt1ZkWlyclsNsGhbcITk7lwZfgTRyxmfixiLeHjiYNTM4XpQjbSTY87Ch0JLwGw46PpNdMVcvUxbnWm9eCnthLmqqNauk9jyW2y8nA21qM5CiEuy3KkRqomS5fDHrVPygz1P95p3g2ArdxLQaQTk6w==
X-MS-Exchange-CrossTenant-Network-Message-Id: c71c3ebf-5b77-4779-8463-08df3ba97ab5
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPFC295640A5.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:58:40.5470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1w704ekM4kY07GfNmOAocc2xRX8ET8sdsiGRhS7vKMczoEy1UsA8EXww87QCdjf3e5ITyCQWj4+ytsnAoUNTWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7572
X-OriginatorOrg: intel.com


On 11/6/2026 12:29 AM, David Woodhouse wrote:
>> Yeah, timekeeping_set_reference() doesn't care. It's going to reset
>> ntp_error *after* changing the tick_length anyway.
>>
>> I think your patch is functionally identical to the one I've already
>> posted in 
>> https://lore.kernel.org/all/20261001202134.33929-2-dwmw2@infradead.org/ ?
> Not *quite* functionally identical; I think your version misses the
> ntp_error updates that we *should* be doing, when tick_length changes
> while a skew is active? Mine compensates only for the tick_length part,
> which I think is correct?
Yes, you're right. When tick_length and the skew change in the same
update, mine skips charging the skew change as well, but it should
still be accounted. Yours only compensates for the tick_length part,
which is correct. Please drop my RFC.
> I'm due to send v2 of that series; please could you test that, and I'll
> add the appropriate Fixes: and Cc: stable with your Tested-by:.
Sure, I'll test v2 when it's out and reply there.

In the meantime, here are the results for patch 1 of v1 on its own, on
top of v7.3 (Intel mainline-tracking v7.3; kernel/time is identical to
upstream v7.3). The setup is the same as in my RFC: two Intel i226
NICs back to back with gPTP (ptp4l + phc2sys on each end),
PREEMPT_RT, HZ=1000, TSC. The grandmaster's PHC is stepped by +1s three
times, 400s apart. The numbers are the time until the phc2sys offset
stays below 100ns:

                                        GM phc2sys          slave phc2sys     slave ptp4l
  v7.3                              207/>361/>413s  114/79/293s      34-35s
  v7.3 + my RFC             32/32/32s             41/40/40s          34-35s
  v7.3 + your v1 1/5     32/32/32s             40/41/41s           34-35s

">" means it had not settled before the next step.

Before the steps, phc2sys holds about 8ns rms on both ends, the same

as without the patch.

Thanks

Yuan

