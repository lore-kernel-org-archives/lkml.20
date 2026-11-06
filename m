Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=198.175.65.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794005560;
	b=XPk+uNvyVbnQkwTymkKpGOKVJ3OG50q3Dta3EJMotG1b1TadfjpQ7E0tXXHT1gA9TLIj
	 61ESUEriPUaSLVHArDhQqz8cTncuoqAYgntwDzxHRkN8TkjNa662u/4qoqf9HD9+KN141
	 pKEhontmIW1WAwtaEUqEYlf7ufrsPN/8+BRFvJ47O+xIgvIAq1CRBDN6Q2W2Wb7Uqodo1
	 2pf3DMRNxDOZHRIaSQcUEwzNmoKfDcmfoBsf+UuuSbAQdejPEtKCY9F0slm0FoGuJqW1E
	 wd1rDXg2qhA4kCpStiwsiR3lVKkYYNBFQaoN4rDiqitTtyG8gGluvT8K6/Fji/z3Pfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794005560;
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
	bh=z1LvNae+iaE09DpkE3EKwErQBAQ15pt4jnhhaMTcqws=;
	b=Bsb3vMn29eU9J3jGlWDdP7/uc5oqf8IMwUTe1cRswcea7Q1DGQZctfkIdFIL4edGAs4o
	 hlyTqLLi0UT/BRNJA7OV+hCTduYHQjklurpdBsDF0cO5ZO8WUbRq55y8siW4zDw/l45Yf
	 6pgc0WVMBoaDQNOaNliG3231OOYZY5OAEPh2ngC/AxHsQxsNCjRVkXVRxfDA2wRNg+ILO
	 nWUiz7JvivFgVyBa6mAppE/x4pAoI5l1wwrIvDnQlvL+9etCwW1xczzEY6E780sA305a+
	 2oMo1Sj8cymwnW54S6SRhR2zDJKQZExQZpKOdqBrRhwCxKGN9J3gUuJH05wDJm+Eu5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dgqmJfLQ;
	arc=fail smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386C5606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386C5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dgqmJfLQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794005557; x=1825541557;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=/esPdmgI7IdioXHUogYW/ThFQf60HDD8Vj3DQj0QsPs=;
  b=dgqmJfLQM109qg1Zmt6bq0MVeMGCE9d5TOfDYIEzNx7Lnsk4JTmvCuRK
   q+9wkQfIXJOVEIrSYyix6NuN6I7qmApds9qyziDVQqakw8gglFeq7m0iM
   hAXTx0zunBwb3ZdtLYr+rOs2J9BxieLMTfYYKd7bjDtKaVsWGVDeQA8uF
   o06bdzXyG+yINSqjBrNf56KLLcR4sHT/gbtZwcd57me0nhffD/GCL3zm1
   nHHRLr5ECIbxLOHyS/mexpfUd524LUvzRcHU/GounLiwfBjPfUdTTTkxp
   U0FASRS4D4tZcSbVWLs/+kUv8izGYNGtJh+ud5CIo+pzyGXNQuv40dusn
   w==;
X-CSE-ConnectionGUID: wwQlNN/GRLitufhzcE1sUw==
X-CSE-MsgGUID: h3WGyIdSR2CbOSzn6r9vWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2817960"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2817960"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 14:52:37 -0800
X-CSE-ConnectionGUID: VLItUj0CRbacM4C0xpnfTw==
X-CSE-MsgGUID: j06Z/UpETX+CL2MG/ryPMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7738427"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 14:52:37 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 14:52:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 14:52:36 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 14:52:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IXpbHlA1v9i6LuB3H2x7vYFwOs0cOVAnDJjPnfaM6NGEDRI4na/xbSRUjAyX7j7A3qEPDEDqZbf/Qa0puqjySLe9egZV8OHYlP0b9B+eBpDvEHymlGw8iplauC/vkh04MFYvfiMCQko5RYHMuj4DSptnhNnxGsm+CicnBjr5J6/YGHDQgKIAMi/++tXZDJx6cyzCqpdGuE9VAF/BAEKHQ8TnXCqse5RrqmIq+6ZuTSVwqyYZANU5w03dWSKyXuM6CPpX3Qw+OFz3twqx+mqpJyry9AuHOqwjHq2XNZZhWbyqKLgjCucv9T6swArtBzjz1YxJV0OdcvQV/Kzf9WjFAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1LvNae+iaE09DpkE3EKwErQBAQ15pt4jnhhaMTcqws=;
 b=yy5dp5k0iRG1OEy8ejzugbGIzvKCKMSAIjpBMMcw30I6PvvKQg7fA/Z7bkDxH800Q/ppk+2vmuajKAarAkn1k1JBr+W1EpqmGZMXVxkbOCMypSp/ZHonWFkq8DlKzF7kyNvcQSkudnOtLuUEOgGxHmZA/Ok93yXLovTFZr6rZWfEF7t1z4nitzY4hf2OWAhyK/1BCnkEonp5dnCwL2XwERHtcuU/e8q+IBi0uI5hQECiOD7ROI1nbgKBjyaCEG1IvABXuH76n13TXVShET/upM5j3ghRuRRIoCEoY5uMWOef89i49Smk1kPdbj6JiR+54lwpxemaKmNvB4gGlYJT1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by PH8PR11MB6681.namprd11.prod.outlook.com (2603:10b6:510:1c4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 22:52:34 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0592.007; Fri, 6 Nov 2026
 22:52:33 +0000
Message-ID: <7163c46a-2abf-42d2-842a-8a43dafecaa3@intel.com>
Date: Fri, 6 Nov 2026 14:52:30 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] fs/resctrl: Unmount resctrl with the CDP state it
 was mounted with
To: Jinjie Ruan <ruanjinjie@huawei.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<bp@alien8.de>, <tan.shaopeng@fujitsu.com>, <zengheng4@huawei.com>,
	<gshan@redhat.com>, <jic23@kernel.org>, <ben.horgan@arm.com>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261105070934.2258613-1-ruanjinjie@huawei.com>
 <20261105070934.2258613-4-ruanjinjie@huawei.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20261105070934.2258613-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0003.namprd02.prod.outlook.com
 (2603:10b6:303:16d::30) To IA0PR11MB8379.namprd11.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|PH8PR11MB6681:EE_
X-MS-Office365-Filtering-Correlation-Id: 92cfa19d-3ad4-42c2-91c0-08df3c58a513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|22082099003|18002099003|6133799003|10067099003|921020|4143699003|261026140227099003|5023799004|11063799006|261102123227099003|261026121527099003|261028144727099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|56012099006|261009223027099003|261009221727099003|261009221227099003|261009223327099003|261009220027099003;
X-Microsoft-Antispam-Message-Info: N/bnIl+7SvpSy3IIwuJebvmetCQtQUl159Rp3Zg6yaqjspWvEtfRoAUE5Ek6PIg2BQC1V8lUM/u/tET+VML+DoxU7PNTtEJ7LLQUsl/JG97l+raZ3YdYrAB7mhldS7tcdUL0WFoWQ0L/VqEzIrw7aRvcS1a6Ne/9H0h5xgXmZnUcqnX4k4zH4CYI/1SfUWztH445WCK3+L/lhNPk2VmLWs3xn/jKiK148PE4zeHs8jBIUCd+DxmXrpzgutwKE6aQ8f2ST0xIiC7Wt8VoKmS/vGhE95bNZAw16IQ8F+Ho1d0v9xAs6aSD6VlXKxxXUE1my/XPY344lO3YrykVZ8ZJfYsDXHlZyVX/hY1M2aX2AD1XCYp1Z8G7zNjsZjgF9UPvqtHGm4a7HW1pbp1VagGcCdsjfsJM3/rH0N9Kjv4A8oWkBk3TeSPrCTP+LkswxqdTZdLekQMXrGOMcjL5qC9eBiL4R72tOxRTwXrWbT4wxi+gDdZaNzVf6ldfDsVUquuGE0yM+dPxm25nHqc04k2bYlW7DyF+gu4ANmrm1o/Y2n9HQzehWw9xOF2YcuPyozo5D00Wt+oNimTy9HHGZ0xPve9BBhPnwaLRT0OL7kozjjWxuiVh05k9UrpfsyzZF9+vZYKGuhQSPBAYGa0ghrIEfg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(921020)(4143699003)(261026140227099003)(5023799004)(11063799006)(261102123227099003)(261026121527099003)(261028144727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(56012099006)(261009223027099003)(261009221727099003)(261009221227099003)(261009223327099003)(261009220027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azdNOWFoWXBOejRsT1RQS1gzY3I2V1luUFVkbVM5U0VwMHN0Nnc4Y29ZSGtG?=
 =?utf-8?B?R2VZSk4rQVNLenpxVk15K2pqMlF5KzdSaHEzWUFZOXo0c3VTYjU0aC94VU5Z?=
 =?utf-8?B?cENUaUMzM282L2Jtb2oweVEzQUNVOGFJOG40L3JmdWNMaW5jeE9PTmFtMENq?=
 =?utf-8?B?aDk4TGw0dFJ5Nk9HZVc1cTI0WFJZRTc2ZnpQaHI1YUdsWDNjbUcwT0NoekJE?=
 =?utf-8?B?bVVoWm52NU9tUkVsMHduVjl5b0psVitzbCs0NFFpSXVsQzliSE1kdXl3Njhr?=
 =?utf-8?B?OC9USk4yNjBYZnQ1Y0tRbmxCdm1BV1JZZ0RJSUM3VGhpbXUvRER2dHZQTmo5?=
 =?utf-8?B?QktsSWtnd2Y3VFNzWFhNOTJZelI5UzhXbUo3UTlicnJ5alVOQlhRQUpWNEll?=
 =?utf-8?B?OVA5eHNNeFlBa0tOZTVyUlo5dFVaNEhsUDFEWW55a0VWdnVrVU53QUowMmFU?=
 =?utf-8?B?ek9KMGdldWZrS0d0eFFNckFydTN3SE1RM3R6eWNwL1UzTTdGZ2tyemJzZEtq?=
 =?utf-8?B?SW1BQlUrc0t5QUNVaHlOVkxCT3ExeER6djUvbjljUnRSZDNWN3VocWFBZUU1?=
 =?utf-8?B?ajVYc0I1cmlaNm1HNEk2YWsvUStrbVdEQjM3dkdZTERZUjk0dytaYUFSVk4w?=
 =?utf-8?B?RG9UdmVZTnMxc3hDdzlpeFdEdC9RclF6Z0thdENkcVo1L2cvNmZzVFFKTXlH?=
 =?utf-8?B?MjRRd0txdENRU0hjV1haMk5QQzhkT0NCTFpRU2cwNmxXY1cwK3BVYXJtNXVI?=
 =?utf-8?B?ZHMwa3BhNVl3bG1tQklGbFk4TEthV2ZoVGFKOHh3dXk1bWo4SmRTVjJwQ1VX?=
 =?utf-8?B?ZFkvMG5iUXpiYTVKbnM3bDdtajhrWU56SURSUzU3OU1hOTJOM1BhQjNjVE9S?=
 =?utf-8?B?ckhxSE5mYysrQ1ZvM0xwckx1Z3BzNmdXZmZabDVmc3FUZitURjB3V1dFck9F?=
 =?utf-8?B?RjltN1dhK2tBM3ZMMzZlOXJFaWJQUGVIMWZKVDNZeWxFekZuU2c3MlpBMlFU?=
 =?utf-8?B?R0U3TGtsazczRjc0cVpnbC9aMjFTTzIyanIvdTIwaUx1cVJvc0dLY1ZrdEtY?=
 =?utf-8?B?OGVIY2tQQWZDd21UWC9tdnlGVU5sTkV5TGcvbzlyUXJ3Si8zN1AvTGFCQTZj?=
 =?utf-8?B?emNtcHhRbllOZU41cWFaYlhNK21UZG1TMzFUOGUweHQzbW9ZcjVrWnN5aHF3?=
 =?utf-8?B?Um1nR05ybEtHc2ZFZHQyY0ZkdjI3WWhlb2xaYWZWbTZqZGRITnRwWmRLZlcy?=
 =?utf-8?B?cWtmNGlkZytoRWJFK2xHUitGcW94VFQ5MnpSTTFKbzJoZXRZVXh4TjNhdlJz?=
 =?utf-8?B?Q3Y3emhVSEg4aFAvUUprNW9GRjNkbmZNNkZ5Tm5MUXREQ1ZaRVZyN0tiQ2xl?=
 =?utf-8?B?UkJnNXBIbTYwK1pSVTE1MEwrNmlISEl6VTFRS25TazV0c0FZMlE5YkJCM3Nr?=
 =?utf-8?B?ZUtDMmU2dktIQnRiREhQWDJpbFJSeUZlK1Q4WFh2MlU5TElsVTl0aXdjNkxm?=
 =?utf-8?B?NDNueDFaKzQ3R3p0RHlLMm5GZGNLMlpsQWVORkNEeFF2QnV6QW9kUmRxUVBp?=
 =?utf-8?B?MFlkWkxnL214RlB6RjEvOFNvdEw1eHgydUtPcDYzT3NGa25QUitmekpzZlYr?=
 =?utf-8?B?dFBvUXNDM3dOUkVHNkx5UHl3TnBMWmRYYVZ2OHRxeU8yRGs0RDl4TEJBNXBO?=
 =?utf-8?B?OTFOUXRVOGdkWnNQME16bHhEdC9uUDlBbm9UeUg3RlpLOThja0kycnpjRWZR?=
 =?utf-8?B?b2Q0MUxXYURRbHhnb1lWR3ZXNXFiY3RlcEk2U2JYRmV6STVnMmdTdG9ZR2VS?=
 =?utf-8?B?azkxSm9ON2I4OW5kck5HQVVuOEtiUzVQSHRlcXZBR29xUlpyU1lRc1R1cVdU?=
 =?utf-8?B?SmFJV2RyRGFSRGFGZEpwdmZ0K1pFK0JFNVVEVWJpMWhmU0NUS1NHUUtmT0xs?=
 =?utf-8?B?a2dNa2Qwd3NrZFZIeFdFTFo0Z3RQUXNaSGdKRjF0djZpUjU1bnZ5MVNIVDBs?=
 =?utf-8?B?eGJWV2lCUi9SMXNzaGNEMnNrQzlCc3h2OU92cWYvNjRnbE1FMEFWQUVUeml5?=
 =?utf-8?B?Tk1LSjZGMGlEY1NWVHRnY240ZlBRU2l6aHRqd2N6OGNWZzZmZzdUY05iZGhw?=
 =?utf-8?B?U0YyblpJdmlxQUJKNFcwa3B3MUZKK0FJU1VhSURaSXU1cThKQWVaOGFVUTk1?=
 =?utf-8?B?VkZya3h5eUNaV2lBT0dWYVZJKzhMNGsyeG5hVzRhWGttWnpONFJwNDlqQ21K?=
 =?utf-8?B?K3RCTGQ3YVVrVXA1MGV2TUlvMHJmblpWL3IrWTQ0clhWWTJjOWVlcEFocG1n?=
 =?utf-8?B?cmpXbklzODlRVGZUbEVVTG1uRDhFbHV4a2hhK1RuZk5odVFYQVRGQXNmQ1JG?=
 =?utf-8?Q?hbFcofmhK93hAniQ=3D?=
X-Exchange-RoutingPolicyChecked: K14dZJVmQ15HR4KwopjETmgfUSAm3FhBd/JMfx6egHRkFnqI7nXHby1I+S/477YnJLYxrKKVm2Y/UMw44hxx1iFNennlsel+MzGOhQhPFMJabE+KZy1weILxBvlY0oTy9+kKxc3Dn2RB5/mD4HD6fDDj4tWao5gB9ykZ5uBpaWZMzAUgXH2cRI1AcxsHb/AqvG1Jo18WHsAI24eI1jY59na64PdQrIM33pmIwLH5K/I+v47mnKVVqCvutT6L53rz/wguWbI5NvNh5dz0qc6a8UNQZQkEF7pR1yzCM4EB69FkBNrrDFP8rhWXYtf+hyk1HexWDK7xDoovfsxLxTHlfQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 92cfa19d-3ad4-42c2-91c0-08df3c58a513
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 22:52:33.6185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVkNvLpCWiS0T6LneWftzc9OxIZHZ/dywOqE82hgchsNePfI8EPeRGnbK2npDT3M+xSIkAuL94zntfTzet80KzeOGws7sMK5A0ACUdoVdsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6681
X-OriginatorOrg: intel.com

Hi Jinjie,

On 11/4/26 11:09 PM, Jinjie Ruan wrote:
> resctrl can be mounted without CDP, unmounted, and mounted again with
> CDP enabled. A group's RMID is not returned to the free list when the
> group is removed: it stays in limbo until the cache lines tagged with it
> are evicted, and a limbo worker reads its occupancy counter in the
> meantime. When resctrl is mounted again, the worker reads the RMIDs of
> the groups removed by the unmount.
> 
> On MPAM the counter is selected by the PARTID of the CLOSID that owned
> the RMID. Without CDP, CLOSID c is PARTID c; with CDP it is PARTIDs 2c
> and 2c+1. resctrl_unmount() clears the CDP state before it removes the
> groups, so their monitor configuration is also removed with a different
> CLOSID to PARTID mapping. With 5 PARTIDs:
> 
>   mount                  CDP off, CLOSID c -> PARTID c
>   mkdir g1..g4           CLOSIDs 1..4
>   umount
>     rdt_disable_ctx()    clear CDP
>     remove g1..g4        RMIDs enter limbo with CLOSIDs 1..4
>   mount -o cdp           CDP on, CLOSID c -> PARTIDs 2c, 2c+1
>   limbo worker           reads CLOSID 2 as PARTID 5 > PARTID_MAX 4
>                          MSC error interrupt, mpam_disable()

As I understand this issue goes both ways. If resctrl is first mounted
with CDP the issue may even be worse since there is no error interrupt that
draws attention to the problem that the wrong (albeit in range) RMID entries
are tested. In such opposite scenario CDP is disabled on unmount causing
the limbo handler that keeps running to immediately use the wrong index
before resctrl is mounted again.

> 
> The groups are removed after rdt_disable_ctx() clears CDP, so their
> monitor configuration is cleared with a CLOSID to PARTID mapping that
> differs from the one used to set it up.

hmmm .. this paragraph seems out of place after the limbo handler introduction.
This looks to be a (very) high level description of counter reconfiguration done
on unmount where MPAM also needs to translate a CLOSID into PARTID. This brief snippet
seems to be what is connected to the patch subject, not the limbo handler, and
describes the portion of the patch that moves rdt_disable_ctx() to be after
resctrl_fs_teardown()? 

As I see it it the move of rdt_disable_ctx() has nothing to do with the limbo handler.
In the spirit of separating logical changes, could you please separate this fix into
its own patch? 

> 
> Clear the CDP state after the groups are removed. While resctrl is
> unmounted, don't read the RMIDs in limbo. When resctrl is mounted,
> return the RMIDs freed under the other CDP state to the free list
> without reading their counters, then restart the limbo worker unless it
> is already queued. The RMIDs stay in limbo across the unmount so that a
> quick remount does not give a new group an RMID that cache lines from
> the removed group still carry.
> 
> Only MPAM with CDP enabled through the cdp or cdpl2 mount option is

It is unexpected that a mount with cdpl2 impacts the limbo handler that
only taked the L3 resource into account. (more later)

> affected; CDP depends on CONFIG_EXPERT. x86 is not affected as its RMID
> does not depend on the CLOSID.
> 
> Reproduced on QEMU with the sequence above:
> 
> 	mpam:__mpam_irq_handler: error irq from msc:1 'MSMONCFG_ID_RANGE', partid:5, pmg: 0, ris: 0
> 	mpam:mpam_disable: MPAM disabled due to hardware error interrupt
> 
> With the change the sequence completes without an error.
> 

...> ---
>  fs/resctrl/internal.h |  1 +
>  fs/resctrl/monitor.c  | 71 ++++++++++++++++++++++++++++++++++++++-----
>  fs/resctrl/rdtgroup.c |  7 +++--
>  3 files changed, 70 insertions(+), 9 deletions(-)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 1c85e06f09bf..c95fa6ce62e6 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -373,6 +373,7 @@ void closid_free(int closid);
>  int setup_rmid_lru_list(void);
>  
>  void free_rmid_lru_list(void);
> +void resctrl_limbo_resume(void);
>  
>  int alloc_rmid(u32 closid);
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index ae9ddd380515..717c3888c2b5 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -70,6 +70,11 @@ static u32 *closid_num_dirty_rmid;
>   */
>  static unsigned int rmid_limbo_count;
>  
> +/*
> + * @limbo_cdp - The CDP state under which the RMIDs in limbo were freed.
> + */
> +static bool limbo_cdp;

The variable is described as "The CDP state ..." but its type is a boolean.
What does "true" mean? Could this be renamed limbo_cdp_enabled?

Looks like this is only set if CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is set,
please mention that in the comments.

> +
>  /*
>   * @rmid_entry - The entry in the limbo and free lists.
>   */
> @@ -852,6 +857,10 @@ void cqm_handle_limbo(struct work_struct *work)
>  	 */
>  	mutex_lock(&rdtgroup_mutex);
>  
> +	/* Don't read the RMIDs in limbo until a mount sets up the CDP state. */
> +	if (IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) && !resctrl_mounted)
> +		goto out_unlock;
> +

Is this IS_ENABLED() check needed? There are several flows managing the limbo handler
yet just cqm_handle_limbo() and resctrl_limbo_resume() use this IS_ENABLED() check to manage
the lifecycle in a unique way that I am concerned will trip people up in the future when
trying to untangle the limbo worker lifecycle.

I understand that the IS_ENABLED() check is added to support MPAM specifically here but
I think we should aim for as much as possible similar behavior across all architectures.
To that end I do not see why limbo handler should not run on MPAM when resctrl fs is unmounted
while on x86 it should. 

Having the limbo handler only depend on resctrl_mounted here will make the behavior consistent
across architectures while also matching the overflow handler. Keeping these behaviors similar
just makes the code easier to understand and reason about. Having resctrl filesystem provide
consistent flows across all architectures ensures the same flows are always tested.

Yes, x86 would lose the ability to drain RMIDs across an unmount, but nothing needs these
RMIDs while resctrl is unmounted. This work ensures that the RMIDs are freed shortly
after a mount when they will be needed.

Could you please separate out a patch that _only_ changes the limbo handler lifetime
independent of architecture? This patch can introduce resctrl_limbo_resume() but not release
any RMIDs from it. Splitting the limbo worker lifecycle change that impacts both
architectures from the MPAM specific change that releases RMIDs on mount would make
the impact easier to describe to reviewers.

>  	/*
>  	 * Ensure the worker is dedicated to a CPU as intended and not
>  	 * relocated by workqueue subsystem as part of CPU going offline.
> @@ -868,10 +877,12 @@ void cqm_handle_limbo(struct work_struct *work)
>  	__check_limbo(d);
>  
>  	if (has_busy_rmid(d)) {
> -		d->cqm_work_cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
> -							   RESCTRL_PICK_ANY_CPU);
> -		schedule_delayed_work_on(d->cqm_work_cpu, &d->cqm_limbo,
> -					 delay);
> +		int cpu;
> +
> +		cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask,
> +					       RESCTRL_PICK_ANY_CPU);
> +		if (schedule_delayed_work_on(cpu, &d->cqm_limbo, delay))
> +			d->cqm_work_cpu = cpu;
>  	}
>  
>  out_unlock:
> @@ -893,10 +904,13 @@ void cqm_setup_limbo_handler(struct rdt_l3_mon_domain *dom, unsigned long delay_
>  	int cpu;
>  
>  	cpu = cpumask_any_housekeeping(&dom->hdr.cpu_mask, exclude_cpu);
> -	dom->cqm_work_cpu = cpu;
> +	if (cpu >= nr_cpu_ids) {
> +		dom->cqm_work_cpu = cpu;
> +		return;
> +	}
>  
> -	if (cpu < nr_cpu_ids)
> -		schedule_delayed_work_on(cpu, &dom->cqm_limbo, delay);
> +	if (schedule_delayed_work_on(cpu, &dom->cqm_limbo, delay))
> +		dom->cqm_work_cpu = cpu;
>  }

hmmm ... this cqm_work_cpu wrangling is a concern and surely looks like something that
we will trip over later. Making it worse is that there is no justification or explanation
for why this is needed. I *assume* that it is done with anticipation that
schedule_delayed_work_on() may fail since limbo handler is already pending, but please
also keep in mind that the worker my already be running and blocked on rdtgroup_mutex.
We just had to fix a similar issues in this area recently so I would like to avoid any new
issues here.

Looks like sashiko also uncovered a few issues in this area:
	https://sashiko.dev/#/patchset/20261105070934.2258613-1-ruanjinjie%40huawei.com

Could this implementation not instead just ensure that the worker is not pending and then
the above two hunks can be dropped? (more later)

>  
>  void mbm_handle_overflow(struct work_struct *work)
> @@ -1033,6 +1047,49 @@ int setup_rmid_lru_list(void)
>  	return 0;
>  }
>  
> +/**
> + * resctrl_limbo_resume() - Resume RMID limbo handling after a mount.
> + *
> + * Release the RMIDs that were freed under another CDP state without
> + * reading them, and restart the limbo handler.
> + */
> +void resctrl_limbo_resume(void)
> +{
> +	struct rdt_l3_mon_domain *d;
> +	struct rdt_resource *r;
> +	bool cdp;
> +
> +	if (!IS_ENABLED(CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID) ||

Please drop this check from the core limbo handler resume code that
should be done for all architectures. Instead just use it to gate whether
release_limbo_rmids() is called or not.

> +	    !resctrl_arch_mon_capable())
> +		return;
> +
> +	lockdep_assert_held(&rdtgroup_mutex);

Please move to beginning of function. How about lockdep_assert_cpus_held()?

> +
> +	r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +
> +	cdp = resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L2) ||
> +	      resctrl_arch_get_cdp_enabled(RDT_RESOURCE_L3);

This is unexpected and looks to be leaking an MPAM quirk into
the filesystem? I see there is a global "cdp_enabled" that guides
MPAM internals but on the filesystem side it does not look right for
the L2 CDP state to impact the limbo handler that only operates on
L3 resource.

> +
> +	if (cdp != limbo_cdp) {
> +		list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
> +					lockdep_is_cpus_held()) {
> +			if (d->rmid_busy_llc && has_busy_rmid(d))

How about calling cancel_delayed_work(&d->cqm_limbo) here? Could doing
so eliminate the need for all that cqm_work_cpu wrangling?

> +				release_limbo_rmids(d);
> +		}
> +	}
> +	limbo_cdp = cdp;
> +
> +	if (!resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID))
> +		return;

Could this be moved to the top of the function? QOS_L3_OCCUP_EVENT_ID
state cannot change between mounts and this is the event that determines
whether limbo handler runs at all. Moving this check would also eliminate the 
need for the "d->rmid_busy_llc" check above.

> +
> +	list_for_each_entry_rcu(d, &r->mon_domains, hdr.list,
> +				lockdep_is_cpus_held()) {
> +		/* A queued worker will run, don't move its cqm_work_cpu. */
> +		if (has_busy_rmid(d) && !delayed_work_pending(&d->cqm_limbo))
> +			cqm_setup_limbo_handler(d, 0, RESCTRL_PICK_ANY_CPU);
> +	}
> +}
> +
>  void free_rmid_lru_list(void)
>  {
>  	if (!resctrl_arch_mon_capable())
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 5d0351453c2f..e6b64a5c9302 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -3150,13 +3150,14 @@ static void resctrl_unmount(void)
>  	cpus_read_lock();
>  	mutex_lock(&rdtgroup_mutex);
>  
> -	rdt_disable_ctx();
> -
>  	/* Put everything back to default values. */
>  	for_each_alloc_capable_rdt_resource(r)
>  		resctrl_arch_reset_all_ctrls(r);
>  
>  	resctrl_fs_teardown();
> +
> +	/* Remove the groups under the CDP state they were set up with. */

This comment looks out of place as it documents what happens _before_
rdt_disable_ctx(). It also only refers to removal of group while I believe
(when looking an MPAM's __config_cntr()) there is an issue with counter reset 
also?

How about something like:

	Clear the CDP state after the cleanup. The CDP state decides
	which hardware configuration a CLOSID refers to, so the teardown
	must run with the state the configuration was created under.

> +	rdt_disable_ctx();
>  	if (resctrl_arch_alloc_capable())
>  		resctrl_arch_disable_alloc();
>  	if (resctrl_arch_mon_capable())
> @@ -3261,6 +3262,8 @@ static int rdt_get_tree(struct fs_context *fc)
>  						   RESCTRL_PICK_ANY_CPU);
>  	}
>  
> +	resctrl_limbo_resume();
> +
>  	/*
>  	 * Ensure root remains accessible after mutex is unlocked so that
>  	 * kernfs_kill_sb() can run safely if called by kernfs_get_tree()'s

Reinette
