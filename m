Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7096353A69;
	Wed, 16 Sep 2026 05:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789535585; cv=fail; b=EcSPRO+658NnhmX5VC0Wn2V2JzDi3ipVSAfIWd9RpxPq+QXfPtviLOH3R7kg59o8SwNBnCqVov+9OtVN6SSBPgu3BYY8Y71wNkJfwIkHc7Hx6QpcSu/8Weico36CLs4+qZkXaVgvZOzHr5OBvK1M9hgfJXQNRi0agLadDKPsbUQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789535585; c=relaxed/simple;
	bh=KhV6szxmctGOR57zzDY9ZoLCB8KTpG6j3GQqbahu8TY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ptk9cVTAmOAkbDAqkD3MHEuELwzk/fZzlKOtxzTfssbwCqiWgaFXG0JHIvBHjd481io4BEYsp0InrutOUiMWfDhUsqrcALg+HBwb8Q+eFRJZdJRVwpoFZcVxFrzBQbmCKdV7riHjzIQrnPHnokdvhtfDPtRC9tGRVzcICc/tsB8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiqjaRs2; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiqjaRs2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789535584; x=1821071584;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KhV6szxmctGOR57zzDY9ZoLCB8KTpG6j3GQqbahu8TY=;
  b=iiqjaRs2yiLX/GeG+Vhbz4/AACK2czitTlHfXuyCBnbeuCc1Nk9l6sNy
   de2/5/VGDdczfvlthdAAEqvQOMPGBEdDHB5T9xfhv1wgWH7JDCsICiswM
   akpYXtUryhVynyMj1YVDhZkue8bGtBpr8cGFXASeUE/HMJ2OI76LHHUBf
   NznDVODjPYL8bnd6AlOOavWRJYZadKtc1iuO/B+N6+MwbBpXrPIWLBDBJ
   h2i7D2eYSStTJv/75hriUbHx3vIPJRI+3NFlKbo23mvqb/Zj1yXi+XHOv
   DuULA6Viauiy9atwhoEdpw9ChqxM0AfH2oTj9pip6iKMVEvyD7wfQYMAo
   Q==;
X-CSE-ConnectionGUID: ZtsDty0HQW2/TSyv1rYDQg==
X-CSE-MsgGUID: 1joHVFz8Tpy8SGcq/m1LzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89950575"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89950575"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:13:03 -0700
X-CSE-ConnectionGUID: GTb9XmniQfmC89sGxA2Tzg==
X-CSE-MsgGUID: /w6+2/8VRWe+n5xGTmf+5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="272758410"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 22:13:03 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:13:02 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 15 Sep 2026 22:13:02 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.20)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 15 Sep 2026 22:13:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zg2nW5H8fg821lQXXm9TlrKSFrFLMzLh0kFT/vUuBJ3MUtpGfHsn9ELTeqNwoDtHOOjmze19rljcBOUjwrJJvZFiAGecmIyxXJbeJSbKfmwxh3aID4IEe4/Jk+P4i/5gsxHxpzh6wb6A/53PTxqwdD+6lan7ajfIw/OVgjCPJWB8Soitoy/hvj7jEmRrbUCzkgy/ds1VK6vnUdV34kFQuYhLGZBYgy2T0UsARbuMXliMGgNZDfTiFq0Eh4KRWSSOBWTTAGvf+4hFSAZAkSM/33ZEiHkRugwBbwj1XTvNKC9UN4NmE/96jCxs3lQ4cnPS0a+Q9PWnO0dHkZBOVr8c2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFPsNeQQZCx5b85jcbvUANsk3SibFTytoZrsYMWka3U=;
 b=Q0CJFZKPFUZlMDMGlowwitk2kCjgmBz1nAuqfYg/6VlisMIhaesnZ7AJ0O6kenOWdSHuAgHNH1oJuR8HUr1QiPsVDuvSzUe2JiOLtIdZIvxNfdFt7UFeKsk0TSzyeFsJoW6rN5gOMf6QV0Vl9g4zriefCFw3PzF7qfhaX2Qts6tIV3p5prHayQyqBpul1T5k2Af0Cn+i8nGT9Jbjzz28/x6rxFPAhruxS6lazQZ99vpgO4KaPSI6mXo7sH2TKnYgYTqhhWWnHj7F+AgyLYF8ZSpvY7WxYrtaQx4Nfitq1smSyUZMFq7p03eBE3Lrin1qZY9pyAfgg/9Tg8IKqOE/tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH9PR11MB106777.namprd11.prod.outlook.com (2603:10b6:510:415::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 05:12:53 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 05:12:53 +0000
Message-ID: <07d90b5d-d512-4059-898f-42531fc649a7@intel.com>
Date: Tue, 15 Sep 2026 22:12:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/16] x86/resctrl: Add PLZA support to command-line
 options
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
 <e669cb9aa6a2a4f4c1720d627278bb287cb20479.1787772750.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <e669cb9aa6a2a4f4c1720d627278bb287cb20479.1787772750.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0343.namprd03.prod.outlook.com
 (2603:10b6:303:dc::18) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH9PR11MB106777:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a334622-ee57-4ac5-9bc8-08df13b12918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: mWh1pvMstiL55bQT+xMov8r+oS6yTMZV4uVIxPOUJX/RVTXZjfqWE5uO3oujOcbupcj6IScg/81qcatBhh8616dgLpUtzRROINmL6CIFCl0s07Ts7gWL70CMJeIlozRwY7HE6KupiV3xD+CyI9nFFu06ywayqhK6VWap3t7CteJ8VNHmZahAN9qzV0kY4DeSKhbptNIVMz0i++M8ybt+nC0FK9WnvCqUXC15wSq20qayrxmjb272ICKa4gHwdLuSa2oLouAX2rN+oc5Ba2f/nE6OiXQQ1utemOibrgZ2MwoCIilvzKs896aQDVJmr/48K8Ti3ays92Mfe5s1GotjfSP/4+PouCJ0/LEluLywzHR89pryu3g6dlM45QmYPvJERMJbKK26ab52Rx1PorLXjGecCmDlDsTorKXdIQvep5y9EVfnckzpkDOJb81nAhdykrf0VdO7yjMVObdUUhglmA5Q9HdyO3x9Chm9RcMPdImHRUdU8li8Z40ch1dJZ3zOFOqq0VTBg9zZ3qUTHyWaUweJ0grD9ytRPM60JRjfmcrkQ1D8ZJxgPLxidFmjgk6KCEmvwFRRG8x8Ri2lpygItHixkXUB4nOG0IA4M03XZ2a95cPZ6rQ/vo4IMUQ1S57zFnoeQVJAYIe0ewnYJYCZDrS6gbvu7RRZmsi1fHohKzU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTlBcUJxNFpta29JMnFvVTBOdENkam9wWnVXTEp1cFNBQ2lKLzBKQVQ5L3J1?=
 =?utf-8?B?djd2N08ybGN1emJ1RS9xa1lyNStmWW5UdkZhRVVZaE5BWUZHZWJqV3dlS1Bi?=
 =?utf-8?B?b3g3S0ZDeGtNM0FuaHBERWRMamJYMXZ0WnVzOVltTndBcnJtSGJ6NUthYTJT?=
 =?utf-8?B?bGJGNm04REs1T1VOeVlLck1ObmxsWnR1M2daSTRuaE1tcHBLRmw1eGFsSWdH?=
 =?utf-8?B?OXg2T2hHdWJaY2lBclo2ZXhsQ0J4RTJvbUkwTVJUMVJwSlNpYVRmL0NuTFBO?=
 =?utf-8?B?Q2dsT0NhS29xTWYyaU4rRi9oWDFDd2ZMYWZ5RzNpMHV1YVQ4eFRXWmhRNGhL?=
 =?utf-8?B?aytTSVpiUk1aZWVHY3JEYmJBaWF5WDd2SGNyUndsdzNySTZIOTVRVUY0aUtl?=
 =?utf-8?B?MGlzUGlkRWZmQXdHTk5MazVWVHZraFFRbEFkRmdsbGp3eVBYZGlZUVpDY1Jm?=
 =?utf-8?B?eW53YnlVMWhmWERrWGhvTTZtOUROMUlEQTQrTzZuQ0pGZGZxSXNCeHdDcE5w?=
 =?utf-8?B?bXZUTlZnMVZUbWZCQUpKK3VRV3V5NjVLVFhzQk5rdk85ZFZEYStFRXZjOExC?=
 =?utf-8?B?Ukd0V2tVQzNScnNYUGZJbmpqVkJidTFaclZ4MWt4Qmt2eVlRMWdUU1VIOEk4?=
 =?utf-8?B?dUlKZDVZN3huN1cwU01YNEhOSUxQZmgwUGpRZ3A0cXVDSmE3VmpsbCtiNmti?=
 =?utf-8?B?T3ZsQXNUWUFJZlJicTJvYndpZytUelJWR2FnMEFtN3hLcjFkRmN6SkZMSzA3?=
 =?utf-8?B?SVYzYUpKd3BicDNNL2tGSlArSll4eHJYSmtwdkYwSDcwallZTFpqc1BsY0Vi?=
 =?utf-8?B?S05TZE5wM205eEhLdDdhOTNYZ3lGMEx1MTVUWmNxODh6V1pZY09CSjhtREN3?=
 =?utf-8?B?TmV6WENuclNCSmFmaGV4bVg3NXljcVJiQUhXVHFDV0hPUzArWmFzQ0dDNlFU?=
 =?utf-8?B?MXFRMUlHSURKNnhyUWhRM3h6bSt1SnRCNmNXN2ZpNGozYXBVZDlwdFZaZG96?=
 =?utf-8?B?bkY1ME9UaW0wM0NnOU1pN1ArR0o5ZERQRVVTQ2ZuWVdtekR5WGVaMXZxbnJS?=
 =?utf-8?B?a09jU0hza2s5ZUpibndxcWlqL0RtNTB4WC9ESFBxYks3dXhxck1WbVo5eXF2?=
 =?utf-8?B?aSthUDhET3d2ZjF3cTJ5cFkwWVl1MnpibDk0ZmZYY3MzMm1MdUtQWERwQ2lm?=
 =?utf-8?B?MjY4TG1obzlNOUhMQXVEUEo4RFhKNkd1UFlXYVhPMkN1VlRiWVl3aGd4LzFH?=
 =?utf-8?B?VFNkNlNVcjRlWkRFTXVOL0hxMXQ3WjhiNnVmUzVYb2JrcEVIYTUyL21aYStI?=
 =?utf-8?B?NmdmellMQVBTaU41QkUwd3o1Z2dXa0c4dmVrZXR5Tzd4Qk1rV1VONGR1TjFD?=
 =?utf-8?B?dHdoWFNpRVJrNG9JRytXaW9ad3I4ak13TUVNTWx4UlE0ZWkxZTJOTWFFUkZw?=
 =?utf-8?B?KzBOWlIvTWp6ajZKWWpZUWxGcm96R1ltL2RCWm5lRkpNbmJ1YzdtTWg2TWNT?=
 =?utf-8?B?TmphUTMrNGR3VFNJejQvUm5jSGxyRXFZTjFkY0I4Q0tuMng2OFFpdUF1Zk00?=
 =?utf-8?B?NG9LVE1aeThZL1Z2a3g2clk1Y29iTCswWEh6ZU1aZE1VODlVK0Z6WUFQOGZ3?=
 =?utf-8?B?OFU2TzdVTzlRSHVyQUVTZVFQTkVpZXcxTUdpbEJYUDJ2UWdZcDZmaEMrdkJw?=
 =?utf-8?B?OGUrUmhNd3lhMUlmOHBrNHZNRXNWT25mZ3Z0NFNFQnVQOWRrYUhyWVhHaldG?=
 =?utf-8?B?MkwzT2drN0t3L1dnTWdySS8yUGVpWGU1bGZYQmNUc3czVGpqcUtoMmdxTjlC?=
 =?utf-8?B?aC9hZjBKTENjMFU2Qmw3WjBKRmQzemxoWkNPT1BGcGZBUS9QYzF3Ym1CSU81?=
 =?utf-8?B?U29mN1F2cnpWdkpiWkZEYjR1RUcxdHhielJlN1UwdkNLVFIyN2hWbGVWSnFC?=
 =?utf-8?B?Ylk4OE9qb1BJSi95UUxTbHY3L0hPOGd6QjFOOStIWkFBd1A4UFNaYVpNYnY1?=
 =?utf-8?B?OVNKWGdHUDM5U0M1bDVWZHdiODdDdkJrMFRPMURkVlNJclFTcWlCVG56b1FW?=
 =?utf-8?B?N0JzNktpRDFmYzIzZ1hmbXVWUUI3N20wN3R4Tms2ZXkvUGRTN1VJbGR2NVZV?=
 =?utf-8?B?KzEvS0JENkpKZkVvb3hqclJOam5nQUJrOTBqZGJyUSs2UXIwcGNScG5GSWNw?=
 =?utf-8?B?WGVsNlgzeVFYSVZZK0czN1UxZWc5ZVQ0RW9xUFBXU1pGdVRGMUVYcXo5Qkg4?=
 =?utf-8?B?ZGt0dzQ2c1NCeFZYV2pIVFYzSzR6dkxON2JiUmc4SXVHZVFJTktEcDJvVmtD?=
 =?utf-8?B?Y01HTTZCUlFVQllDMno1a1VaK3lPanlVVm1DTGhlZzZDSlB0ZHJrczRiemZp?=
 =?utf-8?Q?wHU3fO3pkd46X9PY=3D?=
X-Exchange-RoutingPolicyChecked: yKae8i82eGtcTB3CSXPxEj8i8EjT5wosuQC9jN5r24vtZ2o99FZr00Ov1oNfpVIco4Bbg9xIrbo/LB/EVwSca7epJicYwHn6al0a3smdZjZA3Ddj0rg6ikZC4uOstqIYFa4wx2Bb0IQj/hZ7ngknpZOOCI+G0UD68xz0xPO5wW6Bp+4+p3SEBEvmjdUv8bY9w6EVKv6YseevDBl5GAW1xGYk6WmbzD2vt6xoLPs0K+oY6aBB41mK5lCVuMuBtTN2AJi3iK5ciRjasUAFUstUKwFS5KohtAyJS/3ldwTxj86ejSZVyCfwyAm1k+WrWxfC6Jy9mFjbU6GaaYqdP1jzyg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a334622-ee57-4ac5-9bc8-08df13b12918
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:12:53.1179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVpvXdSo9iH1blK/PGrihswRpkVX2vAoxqUMKIU9pUgtaaCauYcTG/3pVQ2/axyTd/yOiXNm1rUUYYVmGAqoAXfZ1PX8WRbKQMCO6gY1cyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH9PR11MB106777
X-OriginatorOrg: intel.com

Hi Babu,

On 8/26/26 12:32 PM, Babu Moger wrote:
> Add a kernel command-line parameter to enable or disable the exposure of
> the PLZA (Privilege Level Zero Association) feature to resctrl.
> 
> This allows administrators to control PLZA visibility at boot time via the
> rdt= option (e.g. rdt=plza or rdt=!plza).
> 
> Resctrl exposes PLZA by default without requiring any explicit rdt= option
> if supported. The rdt=!plza parameter can be used to disable PLZA exposure
> to resctrl, while rdt=plza explicitly enables it.

There is a lot of repetition. How about something like:

	Add "plza" to the rdt= command-line parameter so PLZA exposure to resctrl
	can be enabled or disabled at boot. PLZA is exposed by default when
	supported; rdt=!plza suppresses it.

Patch looks good.

Reinette
