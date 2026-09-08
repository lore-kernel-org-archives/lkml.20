Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8E451D53E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861788; cv=fail; b=VhAzBx2cr7x7Ob7df1E6L4A2aaOUQJVWYs6xU4/rekdRSYKD6xXCOsp9DLCamVbmHiUTZBj9ORKeJkK91MmDeUCf24C98Heh/rlVKw7r8wMjgKvC/rFKM6K8QfWu1JUjRU9LfvkTMKQpcUV1qFloKqc2bvbV771mcdk+CVAnOsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861788; c=relaxed/simple;
	bh=Z7Fbars+gIZ0g2YvUDV/3I7jmKVzROOkFhsHscLZX/E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=R6p7YnrwlkQXtJqStmg57GQ/OiIpICLpJpZX50JM8wQcned+LVJN7TqA6uxPhNWFlOt6/T4D0rNVCkA/HrcozVLBKIF+lL89oqKqZTZSlIyfuccjtwQMCHWGW/BlJE4eohUbGkqoHkkKeTnzNyvu2TYl635TIMaoj8n4MRoZTmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fjuh+XO/; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fjuh+XO/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788861786; x=1820397786;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Z7Fbars+gIZ0g2YvUDV/3I7jmKVzROOkFhsHscLZX/E=;
  b=Fjuh+XO/8POWh86dk+bgIcgQvKpvwqN+7FX8EnXp7YK+0levd/KEi4DK
   Lsv2cwTOrGa/jxXPAGX8y0ytwMUVC52RWCdw+aZus5Qtw5yT/OEdg5QiD
   YFaHVhqgBK5N8/w0hN05kt6zW+bcm7i/LpwPdeDttMW+mxXbg/IedrY2F
   Ynh6ODZJb1VGw1ibtwOrGEMKzJHsayWSbutlBBEJlm7V7dfnxgIHo2Cb5
   1nz1/ZZ79BQV3RSfjO81gYR0dNqRT8L8mr0eENfhsK0BxO4r2mlN0Ona7
   d+Gxp9DpKIQvnHjbA5el8hZ7DjCLfeIOVduA57TrhH58oD7NWBD3fyvOO
   w==;
X-CSE-ConnectionGUID: eMVIWP0bRXuQCfwPxePj8w==
X-CSE-MsgGUID: 09Fz9zFFQdqVpqCMr3PVnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="89133254"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="89133254"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:03:05 -0700
X-CSE-ConnectionGUID: HFP3hkeOS8iSLYqoHDap4A==
X-CSE-MsgGUID: g1FRUwE7TYiiFFdFuaiMNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="275082198"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 03:03:04 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:03:03 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 8 Sep 2026 03:03:03 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 8 Sep 2026 03:02:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FakOtKuITPodxh8hjWXkYTEtXDRHOFdv3IQTJqUQ3e/xjR1srSAzA4XMCC+A9VqI6GakcQq9Co14Cxa/r9l7vkXLD73YahbTuZavqXl1mp5WVs1FOPpY/o2zLJEuzKwwwEQtJqqXmFPRtRyUSvyW40aBzmY1YoaTEr/d4Bz1MZXuPstxVIwYTWeVBIfVsM7c6Ht4znbkL+nAn9LxqppMp37iofOfxH2muKoPNcZmjMSigAd30IRD7M/VjXYR/iot+zxWLgKHBJ7wOTAo2BIlK2a+ciZQbbpByhP7sAgwkU9YSXZSRu5xGVgKSAmsoOYQ05ljZE4HCJykoRUwdDOCFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SkGJp+MzJU5kY0kTHwu77lwv7JdSQ5U5HfV+HT4AWRI=;
 b=I7rECUS0hDUpvQdprZusSUSt0pzezDjii7s4tlWorbFRsdXwP+tdzAjNP6KeZMvyNKOT07W5AvSkEyffQ9eEDcqHht07oAEz0WTQ9Cpf3IOrFyp5CPj3FqWcQkWRh80xGiiv9ueEQMeooAdSzskGRaJ6Dmq/zqfLHU1GQwb6EER7mQq0/ZLy7HySjnKU00QB4Wqoa0IVRoRyr/t1eEjfVcu2ARGzVRLaGQ2vp0nBn+7RDA/otrzHcQw2CsX5f7GsaxuJ95zxJ0Exm3nEvHVjvKbPoMIW93O75jG1a971BCmnhNSTCvCNCrNqXs1te3blJDGAZ/VYBe3RwjU5D27m7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 IA1PR11MB6171.namprd11.prod.outlook.com (2603:10b6:208:3e9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 10:02:36 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%4]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 10:02:36 +0000
Message-ID: <a89a2aef-f374-4fd6-aafe-ca21d21c980d@intel.com>
Date: Tue, 8 Sep 2026 18:02:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] sched/numa: Drive NUMA task tick from execution
 context
To: Peter Zijlstra <peterz@infradead.org>, Hui Su <sh_def@163.com>
CC: <mingo@redhat.com>, <tim.c.chen@linux.intel.com>,
	<kprateek.nayak@amd.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <dietmar.eggemann@arm.com>,
	<rostedt@goodmis.org>, <bsegall@google.com>, <mgorman@suse.de>,
	<vschneid@redhat.com>, <connoro@google.com>, <jstultz@google.com>,
	<linux-kernel@vger.kernel.org>, <arighi@nvidia.com>
References: <20260904085244.799276-1-sh_def@163.com>
 <20260904085244.799276-2-sh_def@163.com>
 <20260908083545.GM4121339@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <20260908083545.GM4121339@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI3PR01CA0001.apcprd01.prod.exchangelabs.com
 (2603:1096:4:296::17) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|IA1PR11MB6171:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6a8761-95d1-47df-621f-08df0d904f44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: uM1iObVG/wvO5SiG8wAK37dMVl5sA/na0X9YCP2rYCuW6URNYSgo99MFRZ29w6m6bCUljRiLlpkYwqOnerKOjWH7iWZhTeyUFmpbbcMYSyUEP1wx8EGq8HWoHhBFAsZqiDFvrVAYGEzi4lKkAIx2VUPOcQYNtHYTwA9cVfhAgtlr6PJsexFlDRGCs/JENF05Ppp/Yn1MG9FB5LTCQ/gaIgdbtMG74d6F0uKh9TQWsSn6aDPYG9kWORKzdgFwsDbPSmwfcjFwB9PNQz6cqvHLyXd0ZW0LaHUF2cwjNKumL/ZlbUkKKEJPcwdLacn/fAx6jk4ErrIA6CbsRKEqHZXZYOD+LnyErjCTOYELz/mtrz3lOosO5ogTVdTOyGjZvjVGQRwVpFTUufNjYJsEbp3MVca6D7qL5MjamLFwy3Pelo0TRvKFsdwkaquuElNigxjpw1sf3lc5HcSzPtPMJTMPxjN0A7Ea/Km/E3bAJ2olAanH+bW4xJHb7AXsea6soBOuqB2N1kMRBOWr4H2GUJKwBQGumsbX/pmOl3ASY1PMKsY4w/0AyC4H/aS2hwYSvphfbD3p4+ynx7l6f8f5Yzkyoorv0XkaKtcks/xBiZ6j4r/sENVRclzOpfuvx5z+bTD4vBMqWs/vN41O2dxWUnB9FaOLd2w7SZBkd8/tjeiAqo4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWp2OTdOQURLcXZkNkNzVUl2RkpGNk1xbm8wSjhTSkZNN25wRnZQVWN5dGFo?=
 =?utf-8?B?TkkxVXEvejVjYXJtemlWZC95czBtT29iVTdFRFpLMUNvK3B2MVNTWktSQ1M1?=
 =?utf-8?B?Z0NTNEhrNVpRNVRWQWpHY3FlVEVmSnBlU3E1bGN0dFNGQmFFYlFkdnRwVmFY?=
 =?utf-8?B?Q3F3NnAxeVRaTmlQSUpXLzFydkt6WTR4MlZ6Yzdtcjh2WVVtUDI0N250TjZu?=
 =?utf-8?B?NDlIQ1VKckRlK0pkUTZ4bFJVWTlIZDRpMlExRzc2N1lGTG9OSFNKSkdMVEh3?=
 =?utf-8?B?RFdjdHFEMDVJMGhDN053cWg4WWpnUUtjbEFBcXYyMHgybERUeTZyc2xrOVU5?=
 =?utf-8?B?Sy84WmU1Ym5yTEg0cFR3MDdNQnhFcXkyUjJPbllHWFkwbkpSVlBqdVVEeG5O?=
 =?utf-8?B?VmRxbzhYbnVwVzNsc2pkeUVOcWRobWlWVkNidnkyT0FWQ3NiSU1KUDN2VHRy?=
 =?utf-8?B?M0w1V2lYdkZ1V0hCdTM3NWNDYmtxVXBuUzRqc21wZUp1cnNlTzI3SEh5U0Vz?=
 =?utf-8?B?Ymw1VklSRzdtU0RHYzlYZDNidGxDbkxQMzdHcWxEMm9yaW56QjdmQXlCWHBX?=
 =?utf-8?B?U0RHMGdZUTM1RFQxaHcyTm45czJqWWdOczJQQnhuRjVSMWFtUUlWLysvamdZ?=
 =?utf-8?B?V0ZVZXorVG96c1lrUXZuQVp3bUQzREsyV3BJM0xScGNHdnlKbEwzNWEwTHQ2?=
 =?utf-8?B?OWFJWUlCbmYwQVQyOVdRZlpoUS8xRytUdFlYanZ1bWM1aG5uTTJzT01ZNmNq?=
 =?utf-8?B?Z1hnam1NL0pmTXpWRUxxSzN0VGlhNFZjSGxjTFFURnFBVHZlbmVZR1E4dVlk?=
 =?utf-8?B?bzZCY3lZci9yYUptRDBRaEJBYjVScmJwNTRvRi9NTngxZkhhZzJpdXc1YmN1?=
 =?utf-8?B?eFJWdGhXaER4cElISXN3YU84ZFRZRDhWVzZFR09qdDVPY2xueGU0SkJvY2NW?=
 =?utf-8?B?WnJRTmk1WFpxYmkxY2NHZWxleDNDMmVtOFFKYml3RTA4TFQ2Y2RkQmI2Skc0?=
 =?utf-8?B?YnhkZEQvVW1nZEQ4S0hScUNUeVNaRGFZTlQ1OTVORllMRGQ3R2t5VWpMTHdG?=
 =?utf-8?B?Nm0xWUJubkRJa3hGTUE2TmNvcDJQVkozblltVDV1TmRzQUpMalhHU211R1Nn?=
 =?utf-8?B?b1NpV0FTSnl4NndxeEcweERqWWhnSUR4MjF3eGJkeER6aXNNOHV5ZjM1TUV1?=
 =?utf-8?B?dXpXc1hCQm5xR1hUK3ZLQXNoYnM0ZEZzamZWSkRrRndwOGVaYWFZWHJINzVI?=
 =?utf-8?B?d2hhdnFNeUhKZnlKU1pFMW9vM2dKVll6dDlxRUluRUx6cWR3REdXOEV4aWdS?=
 =?utf-8?B?TDFyWUZjZGhaV2M4SVZqdlpjVHA2VVQ0ZlZRaXJ4NTlFYkdBZFNHMmlOWkNq?=
 =?utf-8?B?N0t1R1ZUMjJKTlJLaU40dE11OE1YZzVPck0vRDVrOGRESVMxa0JNMUhiV251?=
 =?utf-8?B?QmVxajNLMHhKYW41UW9Mc202cWxqVnlDREt4aFV2akhuanExQjcwVEVSWVJv?=
 =?utf-8?B?NDBYOW1iZUEvMCtxT2p6K3NFK2FwRWc0SEtjekNtSnBoQ0s1TlVFUW1yeHhl?=
 =?utf-8?B?QzBIeThCcHFIbnBic3FNS0Q0UU1qOHdyQy9LNXpGZjVKTmF2Q3BqU2t3SENB?=
 =?utf-8?B?UUF5NGp5TlVra2t3bVFXTXk2UkJEeCszQkNrZVFqbkRxMGZMVzlucDVHdmlY?=
 =?utf-8?B?eHV6NFRxVzN4eTQ5blZ1MkgvaXFyVnhUVVE3a1BHSWw4ZC9Ib0JrMHpSRzlR?=
 =?utf-8?B?Z3J3RFVqMkVPSGhlRkhlQkhZaDFQRFpxdDZhZi9KeVl3aTBnV2FUdzJHeVVW?=
 =?utf-8?B?NWl1Mlp5bFpnenNCOW1sZGJQR040RS9CY0FxQVp0dHhsaTZXem5sRXNPVDdW?=
 =?utf-8?B?czNWSXpldElpRjVjZlZ2TWtJMUl5UlNwdVRsY25HQmJkb0htdjFyUWs1bXBv?=
 =?utf-8?B?cmtMUmxZWFY5L1pkUmc4K1p4UE1CQWhsR0FIU1pRS1FIZXVRMEV3eGV6L2pM?=
 =?utf-8?B?UWh0YmwyWWxqOFdORjU0OC83UHl6NS9EMElqYUpUSlhxazFpa0JBZW9LZXJX?=
 =?utf-8?B?emlhMlRZcGpEdkwzWk1PYmVITkZJV28zckM1YVB3MXpwNHZqaWFDVzV1cW9t?=
 =?utf-8?B?Y3NCTVdFZEpKMmdDd1NmOVJFbm1MR04yRmF5VGphVjNQV2thU2huWExLeFdh?=
 =?utf-8?B?UDdHUXl4MDNJS3hjMHN1YkdxK1FQeUgwa2p2b3p0ZmlWdDlyaWFVQ2hJVFlD?=
 =?utf-8?B?aWJJRVBTc3pWbXlibUFhM052RDZGSXAzT1RWWDFuYUVKTXBRN05URjVGYzJv?=
 =?utf-8?B?UkFqWGp2SzJpWjhkeUFYTkdvVWFmTnk2c0NqcDIzNTFQRWdaWDE1QT09?=
X-Exchange-RoutingPolicyChecked: gGud2k68LomM38swz5hbOgz2wOMpqZhdG0VwftE1SMhNxVngzGjosU04GsexLw8aHIvQJyw6WD6SN9VdctAu9/QjkY6Ek/LwKS+QbeU7n9cfl2kTYl9stl8te/Hd05dBTnnZ3jCZVfUMKOp6MGFyxJdAJIlAWv7g2h6MKnOAH5AWhB6+dAMhUA0IIhA26/LS84LywyT88Y1QvycFlbe/O725f+QIrU5ZFuVu4ZTEQxdLPFx3kNedQKr5JUnI2c6lVHA31X/ZGXQhgTItOhJZwutDc3PJb6RkvPrfSXuN6n6vReStWhdtp6vHQkgcRigBVlAlzgEY85u3cJTDJKjo5w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6a8761-95d1-47df-621f-08df0d904f44
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:02:36.7404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ggz+r+E4XEuglAl7qn2Vic3jZ7CEVGfOIDLYbbo6g0GwRn4dmjYwNHwPoWtYzcdPTOw14S4CEfcYjHvrJT/9tA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6171
X-OriginatorOrg: intel.com

On 9/8/2026 4:35 PM, Peter Zijlstra wrote:
> What about something like so?
> 

Thanks Peter for taking a look at this. I think this version achieves 
better decoupling
since the logic is added per scheduling class, rather than inserting 
random hooks into
the core scheduler.

> -static void task_tick_scx(struct rq *rq, struct task_struct *curr, int queued)
> +static void task_tick_scx(struct rq *rq, int queued)
>   {
> +	struct task_struct *curr = rq->donor;

struct task_struct *donor = rq->donor

>   	struct scx_sched *sch = scx_task_sched(curr);
>   
> +	if (donor->sched_class != &ext_sched_class)
> +		return;
> +
>   	update_curr_scx(rq);
>   
>   	/*

[ ... ]

> -static void task_tick_fair(struct rq *rq, struct task_struct *curr, int queued)
> +static void task_tick_fair(struct rq *rq, int queued)
>   {
> -	struct sched_entity *se = &curr->se;
> +	struct task_struct *curr = rq->curr, *donor = rq->donor;
>   
> -	if (se->on_rq) {
> -		unsigned long weight = NICE_0_LOAD;
> -		struct cfs_rq *cfs_rq;
> +	if (donor->sched_class == &fair_sched_class) {
> +		struct sched_entity *se = &donor->se;
>   
> -		for_each_sched_entity(se) {
> -			cfs_rq = cfs_rq_of(se);
> -			entity_tick(cfs_rq, se, queued);
> +		if (se->on_rq) {
> +			unsigned long weight = NICE_0_LOAD;
> +			struct cfs_rq *cfs_rq;
>   
> -			weight = __calc_prop_weight(cfs_rq, se, weight);
> +			for_each_sched_entity(se) {
> +				cfs_rq = cfs_rq_of(se);
> +				entity_tick(cfs_rq, se, queued);
> +
> +				weight = __calc_prop_weight(cfs_rq, se, weight);
> +			}
> +
> +			se = &donor->se;
> +			reweight_eevdf(cfs_rq, se, weight, se->on_rq);
>   		}
>   
> -		se = &curr->se;
> -		reweight_eevdf(cfs_rq, se, weight, se->on_rq);
> +		if (queued)
> +			return;
> +
> +		update_misfit_status(donor, rq);
> +		check_update_overutilized_status(task_rq(donor));
> +
> +		task_tick_core(rq, donor);
>   	}
>   
> -	if (queued)
> -		return;

The queued check might still be needed: if donor is not a fair task, we 
still
want to skip the numa balancing/sched_cache for hrtick event?
thanks,
Chenyu
