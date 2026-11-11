Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794421663;
	b=Gy/x6QK7Kl0lkeGZaCi//46s6XAcoteGe0J7pDtbH2Bf23mfeFJ1Pe2CdMSrYd3yYKUO
	 x+jcyKuZVWg3vO73CauUFg45MaZb3tnF79ErTVLWDyz33o7aJ2SZbIAxrMmT0oX3MSZhi
	 hXgLrGMlss87oQJMGdKdGXjW+eQw9U1KEJiQNXEUlh7FLjBCFvx851EDh6ZwIa0ZsqrTw
	 Ycjzd/4kCMXlxTB6p1Qob5i9LXB+R/8YH6kC26gB0T1iwpv6rubZ3kurRaEp6bXreXg0v
	 6pN+cf+VkYymei3NZLM1+bY6lDgpZ2LznnuLf5jehf6Oct0LLUK7udsICgR4QN68Bqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421663;
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
	bh=WzKh9e2NtsRlWxuOrWzshgD0sSWT28WzCSHeEcE00K4=;
	b=hikdz8+TAqdf0zApZat5+KV5w5WbgJ/gMWhpqIDBkGOvroZm7VjX8yAYFl0qDfWzssW4
	 rriDQNDL+t7lf17TYYhB6Eq4BQhEXFp59cFCwXNkaFU8fmIO03YnSvg0TtGZS/z1YF+u+
	 +3afHzACjmuBEwFSVZ0hAs7uf7Kt7GbRx75utw5iCqFsQXVeu2g4YXxF+QLq4HkZh/if8
	 7+XDqB3iFFqhneGp31KLWguFKWBamVEVTt8MruxeSay1b5/yS0QbiQfUtZ+1tmCXFjlXI
	 XOY3pyzKnVqKcSygH2xnW21cjYtzI1+m6DVMXdbfnSLk3FFjpfNrMMdY0ZoCPnPo5ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1w36Dnz;
	arc=fail smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E347606A321;
	Wed, 11 Nov 2026 18:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E347606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E1w36Dnz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794421663; x=1825957663;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=rLzbSOIuF00AcOh03F4GHiYlJmKevHM2ngKZ8FlDnck=;
  b=E1w36DnzdzuF67HgeJzJ/ZiL30YGgdwrNNZCYcdXqwc2voUQMyJPDTcK
   9MyMyuUXDC7CzuONGsMnpTR/6pj8Huh903VFjek3WPGC1xPQbQ8aRtMuU
   uW/DVfgsoSsdP4bDpke5Ec1cTvW2Lo36oSNH100+C9HZ0Av9HofKgzPwO
   dTSZLwzpbfF3snmVtPRUrYsO5MkKwyrsJCmtdQj/7wDoOlxdbr4nfDtrm
   gupdpunneG91tt7biC5I9VgXzF8mhxifYZQpL0WNktm7o3PcFXLjBTW1J
   i6mLa2Sff+s2ahOLDBtIdctV4366rg6W0AQnIUViN2Op2Q5L2PKVLcuIe
   w==;
X-CSE-ConnectionGUID: C4oxvfSMRSSxZ/I06DfJbg==
X-CSE-MsgGUID: 1xOevVSvShCCbQckK999bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3282902"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3282902"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:27:42 -0800
X-CSE-ConnectionGUID: 5PDxZa5XQ/+eyIvdjB+n7Q==
X-CSE-MsgGUID: a3xvDLV+Ry6xHGzi6N6LsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8566831"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 10:27:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:27:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 11 Nov 2026 10:27:41 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 11 Nov 2026 10:27:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJM5Pefm84lxGBgFHy8/5qsB3RBK5KhvV8f51H9Dgk4N4zNgkW31j9u+Jwiv1NLEJHu1MCCZEmuoDuu6RV0VCiAWNKhAOkD0kQjdYm5KCwQNc56WqMj3i+cCzNlOBXZk42Ly4MSHqPVmU0m3ypZb3ncA5b3Ozf2YRPEIadEbZEnWd//lbZtfhqgs0L/LBBPu/8pcFCitmAr4QV4zaCdmnxgIFuM0mIp+gmIG30XnfsmfG4geeqILKEgdNw4IENZTApdvpvDUXEXCkZIqbhsMaqEes01qiLqvFHfRkNBX417wWB8CjE/KH8Nyk8+mGD2nHuCsQLVeM0L9A/0Al9rBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzKh9e2NtsRlWxuOrWzshgD0sSWT28WzCSHeEcE00K4=;
 b=LPyfer3g8nO3634GSdAQ37i6gayYD15MRxWxspjPHXvXkNBx40XzPkPhglx9wPtFZDDozJw70ERliWtpZy4PFlPhfQMlCA8GA6CcmFjgpg5Mg2pxaF1cB355q/wtxNQHYjqEUxo8F6cXMenN9S6L7vTeYV5/0DU1I2MYJG4bxi7JPdESjH824bNu4eyHO5clpLxbXd3bj3X7lqT11n/i8HPAMBe9tq1N5Tt70I8qwZGqSN19RMzajw15uIcdl6stioKFiKhNJiqF++7wv5cNah274BNl1pYgXT4kUUWZhrysovbxYKvUPuZ0FNWk7HIxR56IgQnCTimDK7jXd9DHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by CO1PR11MB4929.namprd11.prod.outlook.com (2603:10b6:303:6d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Wed, 11 Nov
 2026 18:27:39 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 18:27:37 +0000
Message-ID: <ad702ee1-ef91-412a-99ad-e425325e21a4@intel.com>
Date: Wed, 11 Nov 2026 10:27:33 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 RESEND 3/7] fs/resctrl: Clear the CDP state after the
 cleanup
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
 <20261110133938.3768632-4-ruanjinjie@huawei.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20261110133938.3768632-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0144.namprd04.prod.outlook.com
 (2603:10b6:303:84::29) To IA0PR11MB8379.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|CO1PR11MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: c6cea4d0-4f46-4f03-def6-08df40217670
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|261028144727099003|261026121527099003|261026140227099003|261102123227099003|261021121427099003|261022105027099003|261022075727099003|921020|11063799006|4143699003|56012099006|10067099003|22082099003|261009223027099003|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: AFxm31WvI51fIO9Tfw7e01/T0bRNRrR05xXtUVFb83TvMdVWDX6t7WFvZ/pFeejxVxEcqtGxinudZ4sBVUU8D3uU54Es0gY+vvmhNaeVJMGov0YonO7pEaSQCCPo2YkLb007DMCC5I624k1y5l94AvIloC24jn989EElFMf7TrJWqrDx4JDzd8hbI89gdWACX9VTkEis8xPc7Ql7I2pBFnTSGKudiCQkEnh+9MZXveJjBxieNvAnTxX32qiBV3ZEypPCOoHxKFrbCM7XdRQQIA9Bx8X8Es1xgccVNvLAO6faO7faPyqtSzlhn22E0RECNqDGaIdIT4xuehGCS1sFRlH2Ndx3eWPgNpAuoJ5NT5tGqCkWg5GsTxC7EQvV7JrOjJKyp/znL7J8TkOuI2I4PryNLwBzJxeFvfTHEekTw948WgQvXnAmfK2s1BkLhLf/lMlCw6Ak7HdjyKhZQe6gGiK0xFxsDDnbhzyF3Qj4kmKah13Hgoc+KDoREYpAPgsqHaD6H61EnZSRVH3k4qoIhESeau/IV6wMxaQ20lKWyjqk8OFtHg+Ye4BuvCuY2ucgAJYfqKvj9CRLxxc1YH4B8P7FeMjBHnIATwSqC/w8PXqYIP9Jd6xty8Ec81J6es8iqQKnRU1aizp22hURI1lVYn0KilqX+TGZuy3+fNUl/GQzkOgXsjyDc8nBc7mJ5vEvUmL6Zw7EYYb4pz2roQ2jDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(261028144727099003)(261026121527099003)(261026140227099003)(261102123227099003)(261021121427099003)(261022105027099003)(261022075727099003)(921020)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(261009223027099003)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2VaUm5nUnVnMFBHN214NEdlS05TaWx4aFU2T25DWWd4NDlrY3JKR2FxeEpF?=
 =?utf-8?B?QjdvQXE5SlNraWIzZGdCOVBsWEV5aGkvYVZGODRYMTVRYW1MSGdheU5TanVH?=
 =?utf-8?B?cFdJcUZlYWdYTSt5R0lwR1lOcjJyelJZcEVEU3hHVnJoak1XUjFqT0xxdWw0?=
 =?utf-8?B?UjZ5Q05tYXZrUVhrNlNzb3EraW1Wc1YrcE15N2JZV3NPTzJYYlVXZ0oydGE3?=
 =?utf-8?B?SlBZaG95T1IrckhHblNRdzJpS3laZXNVNTZuRkl1Szc2dm5FK0g0S1l2emZk?=
 =?utf-8?B?VmxJQm5iUkxXU2tlSE5PWGdmUWZxYXQ2MVVZSEpUeDFtbEREUUxlSCthM0hZ?=
 =?utf-8?B?cXQzUjdiMVFicXIyRG96N2pqdHNrOURzZmFqRTUwM3Qrc25hQlZKNk9RUWUy?=
 =?utf-8?B?ZjdoY3VGTk1TcHlIaWpqcXFpWWMxSXc3TmU0Uko0TW1oYzFUSjhUdFA3SGJo?=
 =?utf-8?B?V1g5M043aW9BQ3RDR0lKZXl3SDlocmdsREpHQmIxdVZST1pVNk9WZ0xYYTdK?=
 =?utf-8?B?Q0RkSXY4RlFJQVVETmx5VWlRSWdtQzRHZTFZK3VCN0NnSlBtcWVCQ0JDSXlv?=
 =?utf-8?B?Q2FLTFFpcVBhVGxBNjFxTENxK3BTR1VxR2xoMStLR0NNUEpKTXlxd2taQ0cw?=
 =?utf-8?B?ZXhmZ0JrVXdUTTZJdDZ0WXhxS0VHVTlIV0JQYnllakJBR0JSTmljRlVhR2lm?=
 =?utf-8?B?bWdVMlRXeDkrUHNnL1BtMjlUaGNZenVrQ1JqL2xsSk44YmFqbTdCekZkNkpK?=
 =?utf-8?B?VFNyNllLaXpzU3F1VUd4OFYvc1FvWWlGaEZCY0pzRE12M0NZZERuUXZMaXc5?=
 =?utf-8?B?N3orOThVNHdMZG4rOU0zRzVwWjR2NU5QWUdkckc4OUdERllJSUtTbm9ROTdD?=
 =?utf-8?B?N0dib2Z6TC9QY1BYbVRLUFA4a0ZJa3UzNlFBZzkzeWpsR3dJSnVqUTVaMHRE?=
 =?utf-8?B?TTFYZU1PYjVzTWw1NU1Hdk0rZkV3L3lQTlpYbldTaVlOY1RJaHF2Vnc1R1hK?=
 =?utf-8?B?WlB2U29WblRhR3pNSjVuS1F1QUgwMVdWRVZEWU8zQmR5TW1ueUxFbWpxUmRT?=
 =?utf-8?B?Z09TdVNvNWtVQzFxY0VXWjc5U0tpdXFQVFZWQ00wUXZCQmJQYjdnRHY0NW5J?=
 =?utf-8?B?Z3BlSFFRcVRzd1JNWDBKcU11dXJyMmRNYS9oeGVSd2dBbWRxTlowOTZZTUsr?=
 =?utf-8?B?VnRGaVdVaEVyRVBvWFlkVGtrK3pNWDJQcUFkQWViRUFZd1hkOHJDMU91b1FY?=
 =?utf-8?B?UDVyM1ZDYmF4dUlMZDRLR2M2enhYa2pCYy9FM1RPa3JzaHorVVFDcGgydzBm?=
 =?utf-8?B?MGdLemxnZnpaQTQ0LzI4VDcxZituUjRjY3c3NGhiWGZuRWdNTHAyajIrcDZu?=
 =?utf-8?B?TE5pQWF1UC9lYjdWcUE5UE1NTDBVbEJXTUo4N3VnNkh0bFgrckNhV1UzQWFR?=
 =?utf-8?B?cmJ3cU5ZL2hWUXduMm8yZFpOQVlWOUtTbmJLTlpsVXl4UFExeHhmMVA4YmZE?=
 =?utf-8?B?VDI0M0NNbEFtZGIxZXhpWEJnL2hMcGhIYkgzYWltaEFsenovM0lQeE91WGM4?=
 =?utf-8?B?QVhhblpacmlvRFFxSG9LanRUWmlLZzFJOGhkZHlrK0R3VGZOOXgycjlOYmwr?=
 =?utf-8?B?OUswcDVkYzJLZEliYzBBZnRyOXRyR1JhRWRwZDBpRS9jUC8vcXA4Wm1IVXZV?=
 =?utf-8?B?eWhKQmdwQS9yVTFqdnpLakxxbjhrZ1U2MkJHbU9NZEJsc0NlR0ZFenVTOVo0?=
 =?utf-8?B?d2Y0VUJOSGxRRlN2Z050bzI2MlozQU1HZWFBYlNpZHZhU3NnVklNL25URmhK?=
 =?utf-8?B?KzB2NG9qNXpHZVYxWFYxb1FYUkdiMDZ0WWhKR1RQMTdjeTVIaUE5RTc1QXZK?=
 =?utf-8?B?dXVkQnpUczVzaGNxc0xCVmZJV1pvYytuTXIrQzdkUnZORmtIUi9KWVZINk5y?=
 =?utf-8?B?T1ZFQ2o0eENpMS83THpueW1lZnlwOVVQbDZqY2owTHJ6RlFPMFkxUVJ4S1pn?=
 =?utf-8?B?KzAyUUpLUFJZT3Vtc2MrV2RZTW5Ia3kzYzJ0T1dPbTlRQUFjWWRqb2NLMHN0?=
 =?utf-8?B?cmQxR0hLaENZWDQyNnZJbWdPRzRUZnVmemZzY1BLK091d0VpMTRQZVV4UTFn?=
 =?utf-8?B?TU5VNWxLbmtWUlBIZklJRTdTcWZKQUlBVE9jYUc2UjdackV6MHFKRHZ4UHZ1?=
 =?utf-8?B?enNST3BUS2xnaHV3R0pWVTdZR0J4dUczd1RIS3JaN0x6cUdFelVjY0JOdFFn?=
 =?utf-8?B?VVViK2ZMRENxMmZ6aU9OVkNUZDFicVpqcmJWZHYvSGVIM2FzWnNCSjMrVUdO?=
 =?utf-8?B?bExDWWhWdVRVVTRRcjdYUnFqQW04bXVYbDIxa0ZMSTN0WXdJRGZ1Y2hvc3RI?=
 =?utf-8?Q?7nldpFqg1w58Eufw=3D?=
X-Exchange-RoutingPolicyChecked: Hq3RSJtj4bBBIc1xQH6A8wRnyQE3JosoXjkc6qeTV72sX5CAvupD7hL1gjabc9lKiyaNZlwhA6yt1ss6xpSle6Vm9GX94XLn6uJpSS8QRHWz98VfS+TmTIFUX6aiGjIhv/g2fKp23lQh+q5au8RZJvQqMw4KGoNk7QCH0OT0qIkqbss5Kkc7Jcyj8uj3W2WtaE8QpY0gupvtbKteGmZtcQe9Hj9/1fB3yYhJiGynawCPF/5qfVDNQAU1vnQsHOJVw9lNvVxSUj5yfLtein3Guk4jQ2wGLnnEoKhZv/hs0fQ9e5Qxu61atm84+UNm0Kz6L3Iu16nQJ+zLKJme9VVqSA==
X-MS-Exchange-CrossTenant-Network-Message-Id: c6cea4d0-4f46-4f03-def6-08df40217670
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 18:27:37.6894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a9OW0GRguDYSaL45mf1iRf/wMs9PLO7BwdO0s1H086TWJ49YXcYlnCdxYNY6ncXOYyToQbizMQ6WNmz0Qwv/YRfNigv+GkP3iLz9EZoMrn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4929
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/10/26 5:39 AM, Jinjie Ruan wrote:
> On MPAM a CLOSID is translated into the PARTIDs that the hardware
> configuration uses. Without CDP, CLOSID c is PARTID c; with CDP it is
> PARTIDs 2c and 2c+1. resctrl_unmount() clears the CDP state with
> rdt_disable_ctx() before resctrl_fs_teardown() removes the groups, so
> the teardown translates the CLOSIDs differently from when the groups
> were set up.

This behavior is not unique to MPAM. Above makes this sound like
architecture specific behavior that makes one wonder why this needs
to be fixed in resctrl filesystem

> 
> For example, rdtgroup_unassign_cntrs() unassigns and resets the MBM
> counters of each group through resctrl_arch_config_cntr(). On MPAM that
> helper maps a counter to a monitor with the index
> resctrl_get_config_index() returns for the CDP state. A counter assigned

Please take care not to narrate the code. Instead just describe the flow
on a high level to help understand the change without needing reader to
refer to the code much.

> while CDP was enabled is mapped to the monitor for PARTIDs 2c and 2c+1.
> With CDP cleared, MPAM removes the mapping of PARTID c and resets the
> monitor for PARTID c instead, so the mappings of PARTIDs 2c and 2c+1 are
> left behind. The helper had an empty body on MPAM until the ABMC support
> implemented it, which is when the teardown started to program the
> mapping with the cleared state.
> 
> Clear the CDP state after resctrl_fs_teardown(), so the teardown runs
> with the CDP state the configuration was created under.
> 
> x86 is not affected as its RMIDs and counters do not depend on the
> CLOSID.

I think x86 is lucky here to not have encountered this issue and this fix
applies to it just as much, adding to motivation for this needing to be
included in the filesystem. Below is an example of a changelog that aims
to capture all the comments, you need not use verbatim and are welcome to
improve (and please correct) it:

	To support CDP, resctrl halves the number of CLOSIDs available to
	resource groups and gives each remaining CLOSID two hardware
	configurations instead of one, distinguished by index: 2 * CLOSID for
	data and 2 * CLOSID + 1 for code. Without CDP a CLOSID has a single
	configuration, at index CLOSID. Every architecture computes these
	indices the same way.

	Unmounting clears the CDP state before it undoes what the groups were
	given, so the cleanup computes index CLOSID where the group was set up
	with 2 * CLOSID and 2 * CLOSID + 1. The group's two configurations are
	left in place and index CLOSID is cleared instead, which with CDP
	enabled is a configuration of a different CLOSID. The architecture may
	keep this state for as long as the resource exists.

	Only MPAM can reach this today. Of everything the cleanup has to undo,
	MPAM addresses only the MBM counter assignment by the translated CLOSID,
	and it only began doing so when it implemented assignable counters. x86
	addresses its counters by RMID alone.

	Clear the CDP state after the cleanup, so that the cleanup runs with the
	CDP state the groups were set up under.

> 
> Fixes: 6e0e538a75ce ("arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.3+

Looks like 6e0e538a75ce landed in 7.3 so the stable constraint looks unnecessary?

> ---
Patch looks good to me.

Thank you very much.

Reinette

