Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793222893;
	b=47mIy8IV+w5Pe1sU06Qnnmk1bFSCInxAbw/kdIB8kLD5nlL8Jfy8VNGpCNPs22/jW4+z
	 YCLQjmxWMQAR8rRpZaiuT39DufCKbY0bvNm8Wl3MMb0W9izPAfRDyecFCG/SoY0ZxESja
	 l9oeGkFMvxaCWQ/dapYZAUtoK7jCWMwjRgbKRSjL6zXsHHYN4CuxLR0ImnSeXuWbA0zUw
	 2yjKlNLQtoEFzZxab/MfTEPDxjFESR4bXr8IGJoukofRxyCr4RpjC/yFFC97mHbG19RDg
	 z85kraOYYdHP4JRG3JR4z2Sf2N3LPaJ+PIWzBl/oJxcosp5GR6cUECuk6zLCOiUUa0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793222893;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
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
	bh=mdobU5tNA3Un4aSm2enqWEqLPc5rR37deOQUhOynldg=;
	b=OLxUAx38D9eHJi95cKZFhgz4VGv2w38atzaMh7NoOrXNDPY8yBpRRrDVjNTW1vE0GyRn
	 9STGPhDeHo9D6yMfPATZAFIyM9RBOOYNzSGYHaCaGvkjPvqtcMV5opWEn6o87cczMAkw/
	 u5/dM1jqp2owo4Gd8QDtO2t8lFqMUUTqmcFYSw/3QYGl/uga4w2UdakwWiAVYgBE3/iAf
	 mdvwNYqtnibtNMyh2EUA0qHzD2eL+II96ZKgQGiGgHHGLmu5QuDGqpTWoNQrabeWb5Ieu
	 Molq/O48YshI3OzwgpVzXw/2TOZoZIPt34KR5E0XHpI4ZdRHu7iWsp96CVAN/bhBLGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UdFsdnzP;
	arc=fail smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB9606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AB9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UdFsdnzP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793222893; x=1824758893;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=jTEYc1nPDLaUN948AYgAQF77syHKAUIhwjDOgE0zXH8=;
  b=UdFsdnzPxBVoz6WUDF9yYY9XE2j8cizOHWjSenWYT66yfHksuhQjHVLI
   yfnpCEtHINCK7vkMLzZNIBw5t5IrOWtbFNEhlaKZD5ucpqWYmd6SF48JS
   lxkZsLNHgWjxTAc/5DV41NxT8GfBAOoRG6Cxfm+xoMOxOK3zdpQy6svYA
   4abVTnTqBdDiUuQ6EdCcCuvRmGL7Jag6hb4lio6rnzsbZPvZ+ZkIt4cE5
   v7XaAhFAzp/Q85CoPLe46AcsJCU6ANrAZtj4SrdxpniyG6eQxhHCLaD2Z
   IQYm6w2ZyW5WsFEUG8eCfgT5/TUbnPsnBu5pluWjG4eXquVbIAkp/KSMO
   w==;
X-CSE-ConnectionGUID: 9AhLPDd+QRqpO+1MvhxuSQ==
X-CSE-MsgGUID: t7P7rr2VSoiUsRzIrHFUJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1841153"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1841153"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 14:28:12 -0700
X-CSE-ConnectionGUID: TlDomzAxS/qS+qfRws5/jg==
X-CSE-MsgGUID: 7IDcqWsjS2+IKLnnw2+YLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="6717949"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 14:28:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 14:28:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 14:28:10 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 14:28:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7yMiIjtuv9YNSsWHlx81YGFF3gseqN6qBE8Fi0e4pC/o6g3cG3BVgdPWyAtxsSRueIMRusxn5jyhCDFyUilyoNzWazCf1McCAO00Q2Nc1kPuPfHsspl6jr/i7GiSBh5cCN08i1flNezI+na803JmtRQ4eTUXrzYdFi64W1FY4tlY+PNxT3ecmgRUiOGw9HDHPQVi6+XE+wSG1wa8kqJouJc8Og1HY18moNQrKVKyCcT3Vij8cEZpdavWbf2keqaDq6LCHoHZkcke8zyMOj0nBYfviR8JwXuXQZ169AxNByrbPJ4ZjD3QtM0+d/I7L3+ZziWMz3Ou3ca5W6D17pDbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdobU5tNA3Un4aSm2enqWEqLPc5rR37deOQUhOynldg=;
 b=aMoqs+/eqKsv/xQ3mQo6N7zTzTO9y5XjeTuJpw1rQ9f1AGVVEYAnAneZNiJS4IaOBxCpQlDXHADpw8FYHeBblEYgzUg3f7e7Ufrhpx2jRUXRfr826CG/fp3l7LZlc5nzBl5g5tIIcg2vE+cKxfIGhlUUfyXGdNOtFM4pnddiT71lcVH9QYs+xxEVX43rVf6GI5KqI3X6EnKvL/4ITMqOQtjgDdq+YLxAcbW0tIAsrTNa+7OshgiTXyD4KcH7MnfOvTR02pxpVO0SU7fYFJX4Z6OIvobEvgoQm98gCTB8X6a+jz7IOXMw+E7uH0Q+TeleJc3T2/4GL9BvNBNoA2yvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM4PR11MB6120.namprd11.prod.outlook.com (2603:10b6:8:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 21:28:07 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%6]) with mapi id 15.21.0546.016; Wed, 28 Oct 2026
 21:28:07 +0000
Message-ID: <faf2f64a-ef40-4ec7-afcd-282885c09833@intel.com>
Date: Wed, 28 Oct 2026 14:28:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 RESEND 01/15] fs/resctrl: Return -EBUSY when
 per-CLOSID RMIDs are in limbo
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<jic23@kernel.org>, <gshan@redhat.com>, <catalin.marinas@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261020134239.3921377-1-ruanjinjie@huawei.com>
 <20261020134239.3921377-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261020134239.3921377-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0139.namprd04.prod.outlook.com
 (2603:10b6:303:84::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
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
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM4PR11MB6120:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ba46dd-ba45-4c41-0def-08df353a5b91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|7416014|921020|261026140227099003|11063799006|261009223027099003|56012099006|261022105027099003|261021121427099003|261028144727099003|261022075727099003|4143699003|10067099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: wz3xpqrt1lEmjO9UOjYBTE1ot2btrA9M1Xv23hHbaq/D5zz7HI2SVDI4VSEiN1g2iNAUX1Uc6rZjAF7OGrTvc/9VkvsrCbDrfgHkthoQNDvfqf5P7x5MXdKcuTKDcBMTS9CF5enEN02DZMnTBnfotABr+txkKPv26q7BiPtfgYmKVb8BbIAp5IWnOM9W90BDyOaEIddvMqQD352fJoP/0vikh1Wu0s+X7flc5NnFtHpmD0WuE0zFcqFcZ1qU+RfAJtV5orVh/2unh87Gs/UJbo3N//aaKxKKCp833BMHgX9/A5L3QZbrrWTOL/3tBWYyZtsLXw6sI5LrTUP6h1QRnit0kb+suuF2scBsS6T9SvBzQlCyTYC60f0Sq3cO9HttUiKtWs21lcjh0RwsDJFb392Qi/DXGKxzeq53X31IsiBFzToV98ks6Uy0bXMv7dLX6oqpES5IUNryJsuU9OzW8NOtBSvWaGppjTm7M4RVpVNBKf5Y/IwB9+AiSsWfJ1XsKjVMuX9K65gZyCy0Zz3LOT12lRAMgXYNoVw7gGoR+PmAkpOKJ3b/apASBbVJ37Ur9/rpxyin3lnYrd8O8CB2GyaJrvfeVsvyjbujOHqQN4BWVwJvjtNg7v5ulq4J4acEGTPqcUC7UC/KOSaY5dRl6d1PEvXa2UqtKan470hOLNGmOk1TfQ0oDctv3OZiyDDK42I2THDQaKOcCDrD+8rsVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(7416014)(921020)(261026140227099003)(11063799006)(261009223027099003)(56012099006)(261022105027099003)(261021121427099003)(261028144727099003)(261022075727099003)(4143699003)(10067099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3JGTTVCS3Zsam1EOVV4V2twaGVaUTV5OFpSbWRPM24yMnZ0SkJ4NW9Pd0lL?=
 =?utf-8?B?SE5rNnk1UzlSV081U2lwNi9QOTdsL1poZkcyUk40aGJabkd1NHZES2JWQnRw?=
 =?utf-8?B?REp2Sm5tcFBBMnB6ZFFESDdLa0Z2dzZKZW5UamhIWXhlMWlEWW95RlBNa3Uw?=
 =?utf-8?B?VC93eGF4NGdJOERWeGJrUXpRZkxWQ1lqaXYvNVNMZzQxZ0J0VXJEQlBmWTIz?=
 =?utf-8?B?UmZoRHhQTitlSTRjZVY1VHVINzIvRmRrS3dVWDE1SEQ4L0FubitDM0ZHQ00w?=
 =?utf-8?B?Z2hUTi93RnA5RnVVdXVWN25rTlFNb0h3Y28vSWtvb1FJRHR2RVR0VmlZQTZW?=
 =?utf-8?B?L0tsV2MxTkZuZkhsMlBxWW9GZXY4VUlTU1ZaUm9LUXIzK3BiRGsvZk1sNHc5?=
 =?utf-8?B?TmhXL1FiNHlVbitEa0pqaG5hWkxQQzd4eHFtTWcxYUpYMnk2cUtvRE9xSmVQ?=
 =?utf-8?B?RTJBSzQ0WGFEbDBRRDRlQ0hWd2x5aWwrWHRUWVByemQ1cFp3MThTVzA5ZWNU?=
 =?utf-8?B?M240TVo0UG9LbjQxMUp2QXkrVFhMSEdpZmY0TTBnTEE0T0V2bFY5dlVVT0c5?=
 =?utf-8?B?bkxNby9EczVobHFxUC8ralBDU1lDaXYzU25tUUhmUEphVXl5bmdEU0RzcWcr?=
 =?utf-8?B?Tm1MbVYrSkthbnhTMloxMEdBZlY2d2paa3puWWlJa1dIS21NODFRUFUrdGlC?=
 =?utf-8?B?VlcyZGtnN0tBWG9adWtmcGQvcVIrT25IZCt5SlRrVzhGRks5enFQV1h4RGFD?=
 =?utf-8?B?azdvaFRNMUpTUmtRaUZBMTBZWGU2ZHhCRks0VVNFVzdxdjAzcWYvWWpyMVhN?=
 =?utf-8?B?WWFNV1YrNHMvSVd0YXh3Vis0eVhVemh2cElZaXl4akJJbDNWeGJTbFdUa3ZJ?=
 =?utf-8?B?VnVGSDRsS3RaajM0UFovY21jbm5DcU5RZWNqZHN1bWRjU04wbVk4VDQ3UDB5?=
 =?utf-8?B?UnA0d01CZlFxY0FDNjY5dlUxNURadTdlaW44ZDU4QVozQXQ2Mng4RjRTYzlh?=
 =?utf-8?B?REUvYVEwYXMrTGFjV1NKNmtXc2pSdTRGVjVkb2ROemhKTzZRTU9DS3MwYjFX?=
 =?utf-8?B?dGxob2hVd1ZKWThhNEhrZXhkTWxOMGFKTENNTFZJYXZEVXpLeVp1YjV1aFg4?=
 =?utf-8?B?dGJHUE1lUVQxVWp3T2IxNmNLeTcyNjB5K2ZURmF5YTMrSzVQcUppSlRyU0kv?=
 =?utf-8?B?VzJTNDk0UXp6MEtlV281RzNFNnlhcjUxeTl4cXA1NGhXeU9DYjdhRjdLeitU?=
 =?utf-8?B?U2dJcmhRZFVtcHhOOVE0aC9MSFMxMmZmZkVwWHlyMm9HNnc3RllBYjVxME5I?=
 =?utf-8?B?TDN3c2pGd0VNZEI2RVZXeUxEOWZabG5VNGJjOGg5dVdxU2VldHBXNjJ5ZXY0?=
 =?utf-8?B?OWt3VVRUSit2dmRDYXc1VENqelNrY0JMUGhsZGU0VGt3QlVSVUEreU1DMGVm?=
 =?utf-8?B?OHM2bWdSenRvalNkaTZmeDNsT29IVkJsNCt1ZTV0UTViNFd0VnFqNlhGd2Q5?=
 =?utf-8?B?cEVYOGh2Mzk4b29kYjd2QWdVckY3RjM5UUdrRjZ1bm9SWlpKeVgxQWpVQWVr?=
 =?utf-8?B?a29uNkFIZkxEREtKL2lBOVFYTGcwMnA3eGRwd0JNcEVKTWF5LzFUSk11OWMz?=
 =?utf-8?B?ZnBtZkpXUVVidGZBNDV1NXd0RWdZZ1JtTStHUzlRM1owcTdnYm9Ma0VTQTlB?=
 =?utf-8?B?V3RkRGRqamdUWjF3R0JuNUp5MGNjMk16T0s2KytDc2o5VDJwUXNadGhwU3ZC?=
 =?utf-8?B?TllaUGZydGc4MXlLdmFwbmR0aHlaK3FtRXhqeHRkQzY3N2FjSURtWXQyT0Q5?=
 =?utf-8?B?bGpjRHJaR0VxcEcxdUtsRGRYZUNEY3pCbXkrK2hMeUNGcmttb1NUSTJNRkVW?=
 =?utf-8?B?YVNkLzk3VXg4Tk5XdVkxcHEwVmFsd0lXd0VwdHFldWJQYk1CNnJXSGliRm9i?=
 =?utf-8?B?UUUrY2FQeE1ySmxBZVJhWURjQ1M1MzZ3RWt1VUhnZlhCbU5XN0hFWWNwV1U5?=
 =?utf-8?B?UURPWTBBNTNST2V3TTlsQlJxQ2I3aXljcGRPWVNiVld1cmR1dXFLMCt1bnZ2?=
 =?utf-8?B?akhxZ29qWHE3OEwxSVhUZk9CbVNQaitQUVZGS2hyOU9GeUJlQVFsdlhsZnNa?=
 =?utf-8?B?MjBrbXFneFVzZ25sZVZTa0ZlTDF4eUM3YUNFakFnWXo2Q2cwWkIxSG9oMkxi?=
 =?utf-8?B?VmNuREZQVlRPelF5U0xDYXFQT25KYmJmMy80Vk1CcnUxYnRVR2xzbHliRHRD?=
 =?utf-8?B?dmdXOGlIR2RtamNWMkJiSW0zS0dsT2UrL1NQam1hNGlUMXVlZ3RJOWhRcHd5?=
 =?utf-8?B?bkVYYjl6MWhwZ3ZJRW9peXFScVhUZXNQYXpDVlhZbVBnTFNYblhPK1ZSRjFh?=
 =?utf-8?Q?Q1WzDfw+2Gz/8SQw=3D?=
X-Exchange-RoutingPolicyChecked: IFEvorlXLebjgW5lBK5VcrwNDab/oqhj32PWVqJLAWdiwCEXtya/8OZQgk7A4EWcaiuBbGShXnyqhJrBr5ML+rF+apUAvW025B/2imoZ1tG8UY9lFRDv77Nsnugu0fjTOaoYCtltLGKM8iCbMkYPcW90RM/SS7MCnKO4292uIoKaDtzguL2anDcOnB9ViI3Z8UDF9yN2RAbgEhjeoqF1tHYBqqmzBwp9XvIZUgE0Q2jgC769xAgKfNXhRrzDsoKqvnruO3dOSwdzPVD1v6WjaXt6PYWR21JvTZBLKr5LfYPjyFkVM+js0QuTegXkvgpefkUlihZnhuc8VWs/BVNulQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ba46dd-ba45-4c41-0def-08df353a5b91
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 21:28:07.1896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0eEUpOEuA8WZgbH2eymrr5dbTClObtMvW5F0Etb/ySztGWNka5OzNJ+4ZWN60iHUdT4t7jb0rshwqcPWj5S/GMOUpTLHghjoiEArHvjrjm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6120
X-OriginatorOrg: intel.com

Hi Jinjie,

On 10/20/26 6:42 AM, Jinjie Ruan wrote:
> resctrl_find_free_rmid() returns ERR_PTR(-ENOSPC) when no matching RMID
> is found in the free list. On systems where RMIDs depend on CLOSIDs
> (CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID), the target CLOSID may have RMIDs
> temporarily in limbo rather than permanently exhausted.
> 
> When userspace attempts to create a new monitoring group, a permanent
> -ENOSPC failure prevents retry even though the CLOSID's RMIDs may become
> available once the limbo handler completes.
> 
> Check closid_num_dirty_rmid[] before returning -ENOSPC. If the target
> CLOSID has dirty RMIDs, return -EBUSY to signal a retryable condition.
> 
> Fixes: c4c0376eefe1 ("x86/resctrl: Allow RMID allocation to be scoped by CLOSID")
> Cc: James Morse <james.morse@arm.com>
> Cc: Reinette Chatre <reinette.chatre@intel.com>
> Cc: Babu Moger <babu.moger@amd.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  fs/resctrl/monitor.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 73413cb128ea..da883adc3adc 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -225,6 +225,14 @@ static struct rmid_entry *resctrl_find_free_rmid(u32 closid)
>  			return itr;
>  	}
>  
> +	/*
> +	 * If this CLOSID has RMIDs in limbo, return -EBUSY so userspace can
> +	 * retry. Otherwise, the CLOSID is genuinely out of RMIDs.
> +	 */
> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) &&
> +	    closid_num_dirty_rmid[closid])
> +		return ERR_PTR(-EBUSY);
> +
>  	return ERR_PTR(-ENOSPC);
>  }
>  

Does this address all scenarios? Consider for example the first test of 
resctrl_find_free_rmid():

	if (list_empty(&rmid_free_lru))
		return rmid_limbo_count ? ERR_PTR(-EBUSY) : ERR_PTR(-ENOSPC);

If rmid_free_lru is empty but rmid_limbo_count > 0 then it will return -EBUSY
but it may be that closid_num_dirty_rmid[closid] is zero so no amount of
waiting on limbo handler will produce a usable RMID.

Reinette



