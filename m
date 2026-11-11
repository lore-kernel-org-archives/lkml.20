Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794422027;
	b=OoeX0yH9bwHMIZ4ITg6qFPuZzgDZG9nGFz40pnFdvl1xNS1w/F3s6F6ZoDglF19tgvdO
	 Aqaj0Y/+unU3thYTCDRM430JM86kYiRBtkymGQFqwMX3ftZ50UC6ldrt0VMwVl2x3iKRc
	 8ndrurfPSoN88ol/iVRYW0JsxR7CJ1QBgX4E7Z4trOPsa579LTMGWL/Cps4jxm/B3ADCv
	 JTAMbDTx+SBKC0z0vromR3v7sk+Eu2dbt5OCHBnr0E1FZEqobqarusGDL5k4qQSQMRajU
	 RnrWIQQXjQsz5uWsK9Z2jFh9sFfB0P2OpPgygY73lheN/KW5kQ/csfaqLnCIMX2+N3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422027;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Received:
	 Received:Received:Received:Message-ID:Date:User-Agent:Subject:To:
	 References:From:Content-Language:In-Reply-To:Content-Type:
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
	bh=taCcAiAtr6cOBBFM1Ci3Wrnl2pqF+lvz13qUfByBeDQ=;
	b=2hK8Jpj5ocK7iU/Yj4njJyKF2OKRf0dWrnzL7M5sggPX1vd0DdqYnjwpEY8hoXi2EEuo
	 NSAYL7GrY7WW0pla2syRshnS71T8z1D8ieXtbCp3O62QQQUeCKcoU8WIAKQ8WiQcE8jbv
	 NGGJD0IExV3ZZv+NHvf8En9EWl7Zvw0gZgWD9A5+iq3cY529KWDVKQfBq1i7+gCaB+XsZ
	 w/TEOphTkCib2RLIO8sEOupb/h1pQorO5jK5765xMUaF62+o/lPix6Dw1bIOxsPM5aPNE
	 LnIvoFRu4d1AVDNS6nk7tm3+ipfY6BT7jIq1BiT5e4LLkh4ZvU6zlssShIml/V8OZdQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="GiOV/MvR";
	arc=fail smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35120606A327;
	Wed, 11 Nov 2026 18:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35120606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GiOV/MvR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794422027; x=1825958027;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=EwIUwtMRLNrCVtZyGzlWvsDHbQhnb1b22/rcbI9wl68=;
  b=GiOV/MvR5WYKobE+IFsJKx/NFZ0OWErMD81vC4DgUNBxs7lt0pDt2DDZ
   tdfujMTe2T+RWbkcudQgxjrmqjoOB+aPiT/rIvIv5d3DTwFh5QLY+DS7N
   FolU3cbGcRBQEU05bK3z96M9aBoCjPT86eBdI/6d+BKAyQkZORfyWebyy
   0/h5bVmVbxLrkrU0Rwch/7L4AzANQwM24h74mNof2+aI730iIinMfdV3R
   MXPJTEf5lRmimDXLxsbMtJUDDQsEu8dhMJHdi1QXkxzDiJ9QN4ADyqRfV
   NQMd+jQynJNqbnWcBfocqdB38Hhmd6nyvTii4QGgYjLs3CLY3Z91jF4f+
   g==;
X-CSE-ConnectionGUID: Rs32pb3VQeaD6x/ZwyCpWw==
X-CSE-MsgGUID: WKtrrfi6QmChpP1/hyLYMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3283421"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3283421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:33:46 -0800
X-CSE-ConnectionGUID: oUuXWVyPTyKhE4SQBhATZw==
X-CSE-MsgGUID: +2ut/oyiRfKKn7q03CLXAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8477345"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:33:46 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:33:45 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 10:33:45 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.26) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:33:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/cOW9dQpQ+ilIuHcxBEHH/Ic58SQVL+M+z6iSkzfxLLI2cGmeoIfMng6EpzeEZZu6bmvoicuiJO7ykaFjYRDU/t0YuqMwq02oe12g4lWJCPpywbWuUGBSwz/198FNEGxdn9F+Tr+VJdfwd0V3XyeTRnGOsCCfEu8HdYgOmT8of4SIjX6Mj+LcY2lK1G/XZ86V7Trsiume4vZm9wjNbqv5skSye8Sx3sSBVbh139dC7blGbr3NRMRpTlzvC6X1Ymo+bKfOOtIPEb5W3uK4pHvouIT0ucSh/fCVo6jKaj/CSOzN18tL9hrXdKRhaT2iTaMcEzNPiWOFiWmmIpJCSAVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taCcAiAtr6cOBBFM1Ci3Wrnl2pqF+lvz13qUfByBeDQ=;
 b=yHTUurr591Jr4T4Ehauwa/ocVfO+o9p2O9W3JSs25OWggLqMNhUH+2Nj/Q1kYZ+mwsMDABLfnS9ujcK+HCJ5iMm9T35PEEJFL9YpMZyIbPNpKdmhZI4Py47xfGyT8qmV3PG6QIbWZTThGbgHb7algTqohPl7lUBFiExRgBE/KYEe1QO9rNoPTKwLJRE9dtXEMvcoJlLcAPZvqSiQJXeR6gNlJB9Cmcenutv2RBDek4XmLKYALYloU2sdro6mjklSknohdPnDjfW6qQzuZzWnzxFRsEiZWqtGAcsdWI24nIXvEcwq2cBe+IbRxlDpkFumd3P1KtrXNsQCT5X+aZb1IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by EA3PR11MB771531.namprd11.prod.outlook.com (2603:10b6:303:2eb::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 18:33:42 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 18:33:42 +0000
Message-ID: <74200427-7255-491f-a146-6f5e5cec6e0a@intel.com>
Date: Wed, 11 Nov 2026 10:33:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 6/7] fs/resctrl: Disallow monitor group move
 when the RMID index changes
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <ben.horgan@arm.com>,
	<fenghuay@nvidia.com>, <tan.shaopeng@fujitsu.com>, <will@kernel.org>,
	<gshan@redhat.com>, <zengheng4@huawei.com>, <jic23@kernel.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20261110133938.3768632-1-ruanjinjie@huawei.com>
 <20261110133938.3768632-7-ruanjinjie@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20261110133938.3768632-7-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0128.namprd04.prod.outlook.com
 (2603:10b6:303:84::13) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|EA3PR11MB771531:EE_
X-MS-Office365-Filtering-Correlation-Id: c744abe4-bf44-4508-0236-08df40224fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|366016|261009223027099003|10067099003|261028144727099003|261026121527099003|261026140227099003|261022105027099003|56012099006|4143699003|11063799006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info: AA4k50dzfI/Jl3iXdM9zlhlpuJvRww1rlhctP8/ifFXjGbGCfEU10Ab6hJjdljMhBp0JiES6PmQiUPVUkggoeT/TXp4ThNcRkYKIV6+lZjvRQSZwhFL0gn+a37j6pC/pxLuXBeI8A64YXrUNMie5HJ0v0q0CGFbCSA/UCR1jU3VFbepKDczb9p8s08IdaSBAthhloK1hZ4gfnwFlArjliHTcgPhJFpDbv0deQefQJ4HXSvI/bMrZ3dBe2HRfngDNXacZHCz+zl+7pq9o7ufJ0lJTZrKKzmwqFY0QNjknwxfyYMk41uH5gItro4gK9p2N2h6wp9nQHPo7ECRz4gDs9Hg3RyT/5Eg7VQwwPwKGy3nxQWHawiuWBlJXImA3a2tCdzwq7of20z2IzFcZ0RNzcxYcc5tvX3XnmTqCsD34PNjH0QJO4Vo19sG3ILfe3Eab8tCEZ/oBX1LWxSZYz6LL8QFbeT3V0OkW33XbmGYwzCQBIGXvkzbgDthHZr9AKbKsJi4h/K/hsnl5FgavKbDbB4YV9p5Y2iGxxk6sIKAwZwpjiNHmK6rs5eQpuJS3nxvZR9q09VBoFRz/9pNJqmEPE5qjKrNgFLOldQW3L2AFq9+UyAb23rpo25GUDhDnyiZW+1Yh391ivf8ZX1dSedVGN0s4eMJK7USFJxl8cZc/fYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(366016)(261009223027099003)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003)(261022105027099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MExGTHN0a0w4QlJNTVFLUXJCQXdvTHpyRTAwUDhHWnJ2NnhyYVFnZUZlNDEr?=
 =?utf-8?B?Y2FDc3lSbjlRdDI3MmMvZzNjWC9hYkNGWGt5YmM3MldKdGIwa20xNE43OWk4?=
 =?utf-8?B?ZkNyZXpwSDNIRUM2bk14dlg1QlloVnk2WmRVNzdQcGFSS281UGRUV3VVVE1p?=
 =?utf-8?B?N1FURnFoMUllNStnWmtHVmN3ZkZpWEhoNmt4OE5IaElpSzR1K21VSm1uZjlv?=
 =?utf-8?B?WDNqMDNIc0VUaWRpWFVIU2VuS2lJeGxZb1BaUGRiYVVUZkxXUDhiR0RoRzdl?=
 =?utf-8?B?Njg2aEsvcWpXYkorN3pSaUd4TW9FOXM5STY0dXhpQkw2WTBueWdEM01oTnlH?=
 =?utf-8?B?NTVLMlI2RnN3UWFKYXdaZlA0RzBiRlB4TTdGN1FxTTBMTE91NTQ3TFFyWUlN?=
 =?utf-8?B?OEtXZXROSmlqaWdaWEtCNWpCajkvakk1c2V1dVdlRmROSzg2cVlCSmdGRllH?=
 =?utf-8?B?V3A3M0pRL2Jnd29nSXNlVWFORHNOcHY5VTNuejE2Slh4VTA5ZXJhY3IyMzlM?=
 =?utf-8?B?NUdxYkRucmlKWHVtZjNPQ2lPOWUzbHRHbGhzVW5TR0tOZk1pRVZ5QXhBbjdp?=
 =?utf-8?B?am5vWmw3elBMRHBwaDFpR0FlS293Sm5BQ0FHRHZuQ3JXVCt2RURMYTdycWc2?=
 =?utf-8?B?ZFdiZEIxSTd5TlhPcFU1WEwwZys2aU9hQy90dVJtc2t4VCs2bkJwSTlpQW1B?=
 =?utf-8?B?T1EvZzA4bVptUUlqSDhWS2YzV0N6dXFjVHdWL2dYcFpZWEo0bm1rZlQwMDQ3?=
 =?utf-8?B?YXp3Nmh0RzZPbnJYY0g5UG1SNWUyVU16Zm1rMXRHYUpjRzVHRUhmK21pdmdZ?=
 =?utf-8?B?OEt3ZzY0U09wR3o2dFJKYjRQbndzMTFJVHRMWGl4TGMwd2hUeURUSStoY24z?=
 =?utf-8?B?Y1BvcG8xU1BzUzdtbDJhNFo2azVYbDAyM2hQaERIZllsd0EzSVMraTBIY3FB?=
 =?utf-8?B?aHlTVXdqbldHd1lCYkdLd3JRZ2Q5akU4eVhnc1IzZFBPb1pMb3pmTzdqWWQ4?=
 =?utf-8?B?b3I3S0d3RkJwb202cGt3NzlDa2EwcGdyN0Y3THJ5dE9tVTdGdFZGNFBsenJj?=
 =?utf-8?B?elVnSDdnNTR4WGk3eGZHZkFXbkdKa2dwS2tLZHQxaVhvaXMxb2dVV3lJOEVx?=
 =?utf-8?B?S1FmSlV0Sk1Pajd0RWhuVWhheFNjeEgyRkRScGRzSWlqSEZHeE5RODFkTTNR?=
 =?utf-8?B?TldYa2owT3VTYldBamxDNFZydkxqWmd6NHFMUXY1bGVHejBUM0hpelNsRmJI?=
 =?utf-8?B?MUdHLzhrKzdrU2JEVG5lMUY4ZkhpelZlMm5HNWIyZkNDTE5OQjF0V1RRV1dn?=
 =?utf-8?B?SU55VDlJcy9CZ0ZlQUhTSHhTWkM2Y0ROOHlQRmwxUFVLWWFhNGJ6OUFhdXZs?=
 =?utf-8?B?RkhGY05UNnRMUGR4ZTlHZjhVMDVmQmwvTjRIelZaNHBXOEFPQ09HK3ZXZHls?=
 =?utf-8?B?UjErSy9wTE5ndC9VVG03TG9maVl4U2ZYVmdVaXkrWHdwV0ozT3V6WVRzNWRG?=
 =?utf-8?B?Sk5nYXczU1A3UENCdnExTGVjUjBvVGJsMjNJWDNSdmVtSENkRE8zeHB5NzJm?=
 =?utf-8?B?bmt6WTVPdFBhQ3dwdVFPVU1FSXdnNFY1M3JWSzVxK3hrcUJnSVNNUDJ1S3g1?=
 =?utf-8?B?ZHhxSGVUNlVKQlVvL3FKVStNZzJCeUYyWkhraG1DeGx6NjBUSnRiV0dNZmNS?=
 =?utf-8?B?cmpMRmpvWW9icC9uSms4N3V0VFRTMnVXU29qMXVmeGpPZm12YlVodWZBMEpH?=
 =?utf-8?B?TDdSb2JSUFpxd2djV3dvY2x1dWRpTGt0SkNGWnY2c1JuZklMUk1TN2dxeU5n?=
 =?utf-8?B?YmZEdk9aMG1oUDRRZFlEQWFnaXJKdlFjbTRRR2pPWWQ1RDE1aE9wN29kNWpC?=
 =?utf-8?B?em9MRm92dFlDVVpPbXAycXRsUnNoeFFqcThkbTBWYXNPMXg5bktEY292K1FL?=
 =?utf-8?B?YUszNVpIK215NlpCaHBJRzNsb0VxY2tVRjlGS2l1RS9kTmZRbzkxYms2SmZx?=
 =?utf-8?B?SGFONUI4UkdJNFBxR29vcXhnRzF2MitOM1BSaUZnSllNWTNSNUFpZTJIdnFH?=
 =?utf-8?B?VzNqOWo3U0FWbHdoN0xXV1IyQ09kWlFsRDFVTmE1WnlFc1lmM2hCRU9lTWpU?=
 =?utf-8?B?My94ejVjWGVyampNdlM0MjFYS1NlR01kczNpSk5FYWIrbjNnTnlIQkJrbVFT?=
 =?utf-8?B?Yk1NbGlRQ21DeWcrbHFQd0ZXSitEdlhwT1FvdU5UWUVPeEUzWStVcEJwc3g2?=
 =?utf-8?B?NzdRYWZpeUZtd1RwQnU5THlub1hscHhIeEQyUUlGZnJFK2hwWjdQaVRlTlNl?=
 =?utf-8?B?c0JTQ0dkN2VjZ0RoUWoyaU1kUmJVL1c0MzBkV0xvZGJ0YW5oaGt4SUp6TEtS?=
 =?utf-8?Q?R+lZsE5H2E3eczMA=3D?=
X-Exchange-RoutingPolicyChecked: X1WMYPAAHSKmvD8bTAQ44eSpcmUSPTexwdxWnhZCtIgpr75vO+OGowdVk14ATBgtAPnR+pxP5a0FlmhrV5gAbFqVS5E1Dt2CiPHCQa6/9SEmzjPvTpxF0oR5+Z6ewKTQ+YVK3fezSSrQGLaj/deJdcCxgKjTt71/ka7Isa2cGqSO6Q/QIMYwI6r9VxT+UW3q0AUVKxzY+RnaY1hPQaU8rg8UE3/ZME9W8+N6ypmD0PZ7Ax30Dn0bmPbZgY6Fwbrk1Eb8G2Qoq225/ikExJrmSycor9PnDymEMXrIhTHOkOm/61FL4hixb6Yfie35Myo5ElwogbqFFBQc6sS5Y7vHuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c744abe4-bf44-4508-0236-08df40224fec
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 18:33:42.4766
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nfj4T5TDGh8SK5k9p/EIDytAby7c02AMWHeSyer07BlxhjQ63SUzQMeVydrjnEOe2HdA75Rsff/xkRj4TIWOFuTeaztSrfMhAg4ei1VFBeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA3PR11MB771531
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/10/26 5:39 AM, Jinjie Ruan wrote:
> From: Peter Newman <peternewman@google.com>
> 
> A MON group can be moved into the mon_groups directory of another
> CTRL_MON group to move its tasks to that group's allocation while
> keeping their monitoring data. Where the RMID is only meaningful
> together with the CLOSID, as on arm64 MPAM where the RMID is a PMG that
> extends the PARTID, the move changes the RMID index of the group. The
> move succeeds, but:
> 
> - The group's monitoring data is reset. Its counters are identified by
>   the CLOSID and RMID together, so after the move the group reads the
>   counters of the new CLOSID instead of the ones its tasks used.
> 
> - The group uses an RMID index that was never allocated to it. When
>   the group is removed, free_rmid() puts an RMID index of the new CLOSID
>   into limbo without checking that the group owns it. If another group
>   of that CLOSID holds the index, the limbo handler tests and frees an
>   RMID that is still in use, while the RMID index allocated to the
>   moved group is never freed.

It may also be that the new RMID index is not used by another group ...
the RMID thus being used while considered free for allocation.

> 
> - The tasks are not moved. mongrp_reparent() sets the new parent and
>   CLOSID of the group before rdt_move_group_tasks() looks for the tasks
>   to update, and the search then matches on the new CLOSID, which none
>   of the tasks carries yet. The tasks keep the old CLOSID and the old
>   CTRL_MON group's allocation, and the group does not count them.
> 
> Fixing the task move does not make the move work. The RMID index is the
> hardware ID the counters count for, so a group whose CLOSID changes
> cannot keep its monitoring data, and it would need a new RMID index
> allocated for the new CLOSID, which fails when every RMID index of that
> CLOSID is in use. The documentation promises that a move keeps the
> monitoring data, so the move cannot be supported, as decided in the
> thread at the Link tag.
> 
> Reject the move with -EOPNOTSUPP when it changes the RMID index of the
> group, and document that a move is not allowed when the monitoring data
> or assigned tasks would be impacted.


Below stops being imperative halfway. 

 Where the RMID does not depend on
> the CLOSID, such as on x86, the move keeps the same RMID index and is
> still allowed. Renaming a MON group within the same CTRL_MON group keeps
> the CLOSID and is still allowed everywhere.

How about:
	Leave the move allowed where the RMID does not depend on the CLOSID,
	such as on x86, and leave renaming within the same CTRL_MON group
	allowed everywhere; neither changes the RMID index.

> 
> Fixes: 3e9b35823aab ("arm_mpam: resctrl: Add rmid index helpers")
> Signed-off-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org>
> Link: https://lore.kernel.org/lkml/3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com/
> ---

| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
