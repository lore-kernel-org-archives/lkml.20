Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=192.198.163.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792600805;
	b=Y7l9+nlE5cCw5v2eku73qTiz5pvRB8nUhC22cFuhWIQ14Y+kQSYPUdAPZtQyWbpk7BZp
	 5rEFBq6DEHDdPixgrz2x8ZAaEtRvr+jY4Twa9cFFVaMCXwMQ2mhyCW1qdEb0Wpqwx1Sqc
	 Kg+jCBRIQq14fg/3LBs56Ca1vwrjNQpOor3oJL3RnrYceBIvG5da8by0rkuOpp9UFFTJe
	 wX3GT0I7NZPZpxfXuyMlNs17PwzNY7+8/o/zKg47QTEc1IUTkAj8gYC8Vv4Inp4lH10cT
	 BxSncsHHNJpH/3Nc+LPPNzQ1qpmy3v+2TCQUyyQ320Z25HJESLqUdBxjiHgiNJkr7RA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600805;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Date:From:To:CC:Subject:Message-ID:
	 References:Content-Type:Content-Disposition:In-Reply-To:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=Q5HhK3gQiqaNLK1kRD2Bqkw1hKgdgNY/pOGHKECQOQ0=;
	b=sYq10AmRvPCuqYBPyA2EssfW7mgdiV0hbksB7uhLqh+Wn33+TlM9X+vPUCfSwNkraW0/
	 rXTphIJwyTM+MTIxD9FbhDuq/xwcmMETi4I2xoQERbzfQLgTjlIliGTckq+/L5ZrJvR/O
	 dKEAwCx2afDaj266N1Wb4QAUxIIog/6P1faDcGznXhRYwHGFGACs8FGMiAX+ZYrSOj7Ge
	 sDoPpvH1NPteKN2Wt7JsBww+ocK9nyYKKootXlFx2ZJ4el84q5K8cTDwg36ApUTY+c72G
	 fB/oWVNlMl73jlLxNLK4ZkFMU17gsAdAFsH+aV/18s+v/88arVGAwro+qcAGVOkmqFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aGXA9L85;
	arc=fail smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E8B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 16:40:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12E8B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aGXA9L85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792600805; x=1824136805;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=fSnAJCXO2pM4sS1V9dp1vgIe6uvQPieDI5sJvSJr9y8=;
  b=aGXA9L850lsJeeDzrCVcOw34WC4R303JmOf/IjAjXJ9Lh3vbnvg+wpiu
   YmBYerQ5pvmPN/Q6QmwpUn5d6l1JpOnGavuqUA1lNkzEN9Pkh2RbIORJZ
   URx0WB8TLPseCSv8lYp1npPF3zzkwZl5YcN6nKhmvMgZV6GiJ85MFgxcI
   m9vHSv3dTeGRO25T+ACayTCPZ1ymvulkYb/fHhe17JmAvN6IvdOpzUda3
   GgB7LQc/EU74moE7gLhBwHp/k2afKNNqZSsDLIkR8W7EpwtAXeqY5dRYw
   dpP09doHz6mTxk4kosnSI0sQrSu9Zd6N8OnDSkuZERR0B+UzXD2/7ALxM
   A==;
X-CSE-ConnectionGUID: HGL/l82YSquIk5YtlyEIIw==
X-CSE-MsgGUID: fti+21CaQaClgPI26QErIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1346887"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1346887"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 09:40:04 -0700
X-CSE-ConnectionGUID: J7DkgDVYR4y7hLcybPbpMw==
X-CSE-MsgGUID: iqw/2qjsSiKksk2YByTZzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3246599"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 09:40:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 09:40:02 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 09:40:02 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 09:40:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X+Jos1RTUvp/Srku3gD99DCSiNmWjLL6tMMtePYXlqch/qeSp0IIt0T2S56heBDS3Qpjc8nCrI0MXjvJFXbC/VMl6l6WU5HnBWfrLUMdgqtahVITWKmEwDCbOhpQLIqRzGFo/EY3QzkaM+it1rwiIMI1FwiYWHKJW4hX3p28Dh/pszUFHJjjoxzBMPrR8GwzOtuuQ4B1EK8B1Mv7tJ1imNCzU0mMiF55QWj/y8HlvZi6JEpx1Q5R7OoStSnEVyrg4MY4Uuch9mKyrXPF9g6piHjfqJSx9GI66a4eSYSNIratQ9Gd8N7NmOOSUgImHH2Bcyk+cPor5ZUK/f9NkiPtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q5HhK3gQiqaNLK1kRD2Bqkw1hKgdgNY/pOGHKECQOQ0=;
 b=cjxqOzt0acAWGbm7lHR0/tfAdQYek6LC/Ue3GTE+CplyO11XVVKkDB8gz+uI/NCB5y1zvUUD7WSZVfWdYE5Z5YZS6lSzQBCQ9N0IsKZRBqhzbt2+rMK4jYdv1UefBCRz0FG5PV52dbL6IZr+u65wYpvrBnhOhFqlBG2cUYudv2ScvHnMTsH4WmPdTGSiXB8k7AsZpPPfpEySTl/dD4/khkPXbn5vjq0KMuemBtPkZqa+z3fWz/j3ltHXPk593Pxv2r40cFOQF4k7nYnZKycTr6+xYgDywJxzNTpj2KQRZhLEXo40QNmXxQbGqqj/6Ustj9H5czzFYERIXVRq2sh17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN6PR11MB8101.namprd11.prod.outlook.com (2603:10b6:208:46e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 16:39:48 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::3058:1480:e4ac:5765%3]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 16:39:48 +0000
Date: Thu, 22 Oct 2026 00:26:50 +0800
From: Chen Yu <yu.c.chen@intel.com>
To: Luo Gengkun <luogengkun@huaweicloud.com>
CC: <peterz@infradead.org>, <mingo@redhat.com>, <juri.lelli@redhat.com>,
	<vincent.guittot@linaro.org>, <tim.c.chen@linux.intel.com>,
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>,
	<mgorman@suse.de>, <vschneid@redhat.com>, <kprateek.nayak@amd.com>,
	<linux-kernel@vger.kernel.org>, <chen.yu@linux.dev>
Subject: Re: [PATCH v10 1/2] sched/cache: Reduce the overhead of
 task_cache_work by only scan the visisted cpus
Message-ID: <atjnyuXpcvFZ0xpz@chenyu-dev>
References: <20261009032943.95091-1-luogengkun@huaweicloud.com>
 <20261009032943.95091-2-luogengkun@huaweicloud.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261009032943.95091-2-luogengkun@huaweicloud.com>
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To DM4PR11MB6020.namprd11.prod.outlook.com
 (2603:10b6:8:61::19)
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN6PR11MB8101:EE_
X-MS-Office365-Filtering-Correlation-Id: eae01c31-3b1a-4e0f-ad4f-08df2f91eb8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|23010399003|18002099003|22082099003|10067099003|4143699003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: LS0p+8zHs5WMk5kEGCtOYPesTbkEOu///G5xeC24MFczwbvp5za7T9gQoPK5ieibjHadT45V/5UsZxY2HWqsKnl5kCXuWqeNB5yNK/D+WqSRhgqldIA+duuw9IQ0lXP4QJEEXQiqcf6YglJEQCwouCXPjF7+oUBff3T/5NGUON8LowqSAn2noByWd+3+pQBwLwMBHqjZsAqrtFugqAkyrb2pMhOow30Zn5KOs5IRhYJYGcFgcZXWDlcSBYV8fQ3dHcyLbtIkrZLl+dyoN3x+sWe3pwTm5huxAnMG998+veAJ4slzAkuWI9OWp+IegiRmPymF3Mla9ZJUtArmFBJvAiDoIAptOwDRKj2Zk0CNoinhH7phLkFnOLO579dWzwA6nV8KML2iKwiZkvo7+5GycmltXI0X49ma7aJj54EZkMvMF3eUWwA3p9R5R7ONHnRX+BjVbuM72Y82mFlk/kq0UphIy5EG5MT2Wz8Ck0xxteFnu8bqYlcoF742/KuCiucpGrPeRLZU90OOqFUHRt3xIuNaeLy5oIf0GAKQuntuJOCt68Hg+UN5azTJVuY5694gD9+898kucB/54svb0Y29v9WKjHoBML7Qz73ch3u34d5pIMxbPaTpvBZEZbmNtmth59D4DC+UKsPHSsTl19A1UmWpt1wXjMBa6LzPLS9HIKk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(23010399003)(18002099003)(22082099003)(10067099003)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vDPgzEhq6cyGzrqqDkDsVHKMVZeDeSGFfAcYncXajGzHSEgNymthcNjCwz5Z?=
 =?us-ascii?Q?/WQl1Cu2X6j9Mqg42P856h5LX2qz8T3WrAT16U5qcYnxZWmvpLJvMq8zoFAn?=
 =?us-ascii?Q?YrPbPf5N9v9UDbeaIPTyC9YVcVjxgInSNNRMj+r2C7v7WN3VCL5mWj5HvmVF?=
 =?us-ascii?Q?7UvG6r3ddCIfaLlKr3btwJoJ+RVqGHDforM8V3vN6DsvTGIT2vB7z+wi7MHa?=
 =?us-ascii?Q?Qtmk2QaANwDuc+2zuGjnaoObD3562aw5Wmj/CUON6dPdpVFfjo/M/tK48bPO?=
 =?us-ascii?Q?5c1EXvTh7TZXmwtENznUCVkkh3DnOhE7+MAKBARUxzsSnCTv9zxWNNMs8Rgd?=
 =?us-ascii?Q?hJSqI2+dGjI5Rhl/QLtnN9oDWEk28RCMANC4cXACWGhyA7sn6dEWsHmmiIFZ?=
 =?us-ascii?Q?NA6HXNGX4YiEjE9Ph0wh5Ax9xvXXAImn7fFHmsy4YbNICJoqWAS51e0qGzFf?=
 =?us-ascii?Q?oGbjOFR8ANO1RCKgcZU6ApGPXRptOi3uxLjsGF4+kaq4scRA6SlJiW7v9Bw1?=
 =?us-ascii?Q?UlUM8+Quu1Q8CYn3FmSYelDoBBVs+yuy+Bfg6vDl9/6dN1RLY5GQiiKwE5AS?=
 =?us-ascii?Q?bJ5ECTjoYOJYIehyILULVXc81+yTwkUKdyUOYvQ2RbneaAt6qJbmTxFzXmSX?=
 =?us-ascii?Q?sHJmjqm6qUAvUvxAmLgbAfHKIZN9wVycfIQGlAyJ8/Som54wm4ybmx/nEB5W?=
 =?us-ascii?Q?c8Zu453u4nuS6F/3IvMLAmv8o8ICWfcLLD8AtVuPJX27R7LPjkHFfDcWeNaB?=
 =?us-ascii?Q?kXNJJHYuJTRwc8K7wOk7GAgEDYSNn6x3n6tJkTNdqVNAb26Ou+bxq5jXDwij?=
 =?us-ascii?Q?LyLRvSoXNz+iMYInHnJ8BNT5Jw396QVuHiXAC7e6same2q8R3vhbH4FyAdc9?=
 =?us-ascii?Q?PjvCMCV6nQNG0DjxY3mDIs5gYjopBAEsthhCqHXRAuWyV7UqaGdjYm1BBUjC?=
 =?us-ascii?Q?o0jlW0u7NfVLwJ2sgMHgYPImEtwgZwjzf6CxQuR4eN6iDtdWjg99kF1ZmznR?=
 =?us-ascii?Q?RCymtC9+XBAB1ojbleDTjZeY1HgFAL8AlcBqVWAJwtidtcB0O2aBiL/Tuy+4?=
 =?us-ascii?Q?bWoIv/8MELGlKRMP9OoXjTUNcXiBgrmrl0Wybk0+iMTyfQEMIFJgVGNnH5c1?=
 =?us-ascii?Q?aGrs2RHF9GeF4I5OCHIjBSCleg1CZqLxt+IY95NG/hhFyvPieEywJ/3VXeN7?=
 =?us-ascii?Q?11I4QfmFN8eAw/K71f5cvoU9v8QTdnBs/ARzPPBCuR7YVdE2Qly/dngWDZpr?=
 =?us-ascii?Q?btac0ylwe5fOd20eLUw4eRzV8hgSSZ1AJPpYOjXsWXWtp70xjxCSlK4WrdC4?=
 =?us-ascii?Q?bmcsouXpXF45FMWpxPhWjK8JJF+Cgf+zDHxQk4dwJiODklDP/cpuR6/m4ATT?=
 =?us-ascii?Q?sPHysDac10jX65YQwqiHx67VvrWT7j2IMqiJ+uRzlRRbeu/rjDEjIROt/ocf?=
 =?us-ascii?Q?7qppPQ1TI1rIaTN7gW4Ae5IX1lPYX6r5ev5+QPa4+MwUiwhNC0xTaU4bjcoW?=
 =?us-ascii?Q?iEgw/z9R7a/06fcHZjFv3sAURP2XkSyYu3VENAhAGFbgy4kAQiHs4+kMKi0t?=
 =?us-ascii?Q?BwHWp9YxSaPm1eVHZQBh9uElhQLkF+Tccg470YY0m3zt75C9xrmlkon3o+Hy?=
 =?us-ascii?Q?GM9V20yauM0LD3mZ2g08pEv0NTqLlrGBNnQYGpTA02WX8JhQrQK+aKF/dzjx?=
 =?us-ascii?Q?4gtt3m6n/M9pekA8b2FFCienQYP65vU+hXDaowL8X7nlO69C31Sw1V1pQSbF?=
 =?us-ascii?Q?8jovq0cYWw=3D=3D?=
X-Exchange-RoutingPolicyChecked: Tdae+odw6oDsy1r0aKPY7CzIspIO5GQVmMUVdzWqmpEDAmmpfDyLifKz/RuNkLCZfd37rxyR/+VFOoN5QyOlq9pp0L+a66z6xghehQgtaM8vqhL5uEaPShJzQ7mwJ4nacPqsfVfVnsb7+IbSQByN27YOp+2qngwNrD2qLJLnsyOJTMtTrZuWlX/tPjmKBsGdavTl8tjITaOmdoV9gvLyjRvXiESoAZQpongQIeWMl0uzRqPDNkGswWOkKcrSdtQP0jZJ0IfrtUKBzEvshaOVZtp5E7ef6w2a9uhieGhUSjdfdE+OvHF9/P9FHEpMFti727TLwRzVUbb4gDiG5AyHFQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: eae01c31-3b1a-4e0f-ad4f-08df2f91eb8d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:39:48.2441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7X01HfPhqE0ws0HkugX0X9V2SXFKpi2Ecrjc5ufbNfKkkWJchUdB6gf9z5g8TLlslHS6fWWGVUq1GLPw1KJvbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8101
X-OriginatorOrg: intel.com

On Fri, Oct 09, 2026 at 03:29:42AM +0000, Luo Gengkun wrote:
> The overhead of task_cache_work() is high, especially in multi-NUMA systems.
> Currently, task_cache_work() tries to find the pref_llc by scanning all CPUs
> in the system. However, most of these scans are meaningless, such as those
> for CPUs that have never been visited or were accessed a long time ago.
> 
> To address this problem, introduce visited_cpus to track the visited CPUs
> and evict them once they have not been accessed for a duration exceeding
> llc_epoch_affinity_timeout.
> 
> Now that we know exactly which CPUs to scan from visited_cpus, we can remove
> get_scan_cpumasks().
> 
> Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
>

Thanks Prateek for popping this patch up, and thanks Gengkun for the continuous
optimization on this. I asked AI to launch a full hackbench test on a Xeon with
4 LLCs per node, especially to test the case where the LLC is saturated, under
which scenario the contention for the visit_cpu mask is high. The test shows no
regression. So from a code design point of view, this change is a good optimization
to reduce the potential overhead, and also paves the way for the multiple preferred
LLC/node work that Jianyong is doing IMO,

Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Tested-by: Chen Yu <yu.c.chen@intel.com>

thanks,
Chenyu

=========================================
Hackbench comparison
BASE: cas_on_base
TEST: cas_on_visit
=========================================
MODE     G  FD |         BASE(s) |         TEST(s) |   DIFF% | RESULT
------- -- ----+-----------------+-----------------+---------+----------
process  1   4 |     0.329/16.1% |     0.302/27.8% |   8.21% | IMPROVED
threads  2  16 |    222.206/2.3% |    215.147/0.9% |   3.18% | IMPROVED
threads  2  20 |    26.031/14.3% |     24.097/7.4% |   7.43% | IMPROVED
threads  4   8 |     4.338/26.6% |     3.965/31.5% |   8.60% | IMPROVED
