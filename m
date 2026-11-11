Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794424031;
	b=qAKdiVB9AEYmQyBItsi+wDO0qFpk1vwj6y07GIq9ry65CrPM+EAJ6yrp6+wcbh+34oWN
	 HI/9UoBWlvoXzHssiGV04NKMVjiXrOysujvbV1IRNZnXLpkZQe7o7qYc7prsuQvBqc/b/
	 FdKDcBCVnTB3CxEl/dEqTl0YbVd6+t1GWrM83KFeGTMvVDFVbqNHPvsjcxPzCuloUMm58
	 XVwTTqJImRSAvr1t/PQmTccGkj1Xh3DDKrfr0r+DhKi0+ibgG3TwXPHTSB8ZZgMXvWUYX
	 MJOb09sqYKM7l3DaCeynrZ0lQ+BDlxBqP8oIewRxVOIoFak3eveKFpzpw9D54BbMjog==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424031;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QF8db7W+YbYRqJNdGVnAyMFZ98YJHwuO7grixfymQkY=;
	b=lJaNsD0TUSfxnAwRtMFSDV0Q6Q2xoagMHzBSTTIMHCLNk+8MvDFdfL22e6Nc2NLaMx30
	 WhLbbZY/dwp5Ljr6R185JeSXiRELuMw+C8RvHo7ck4BOXuhpFDr7msBY3V06z3MkWYv/V
	 YtKroPuozY8s9FyoEAFVl24O8MABBFL77gRobd0NHQcUn99Yo45Wtf9VLXAKLzJYwWQg6
	 wQ32uAV4nH4mDR+12w6VgBUw/ZmwIDM8erhyk80n4FHG+5RZUjjyRflgM/1YIaZKlUP/y
	 rBHZN1ngRQCvXAdvKbbc9qCJTNYWX0n0eG614msEEVtIl00eNxuHC9ugZArTqj5FfAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Kwk7Cczj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.26
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012026.outbound.protection.outlook.com [52.101.53.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFF4606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DFF4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Kwk7Cczj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M89n42IqPjtws0EMpBWpT3Ug+LAY0tgtjx+dtwXCYRu16VL6Xf/MW6rxEeotzurff24lCywq0dAmCJn2eP3wd6koBDMEnuqYF++CY/J+yiDcU0zFy6GhBWIPeaIEJQGflO0As3It0XdLdX9bYCmauQUhNbW8LI5kikIMcq3Bo4y4gzEhg4OZzm3PVyIS1YkYhAS5rqhag3eSZ3ni5QRaz6n75JPtGWZg7ZZeIFcBNSni+Fx/bpx2pn16t+DpKVY8e0krvwJuukkbG5ML8RHXTDi9TwuHqh/TRAfMVLwZ3MwrA4N0M2CHPK+WqAyYcnMkBgSKGErPLvgtn7NVffbUiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF8db7W+YbYRqJNdGVnAyMFZ98YJHwuO7grixfymQkY=;
 b=YQTwJsrvoC+AnuFJGpiT55q8xiBLyV/dxiLdzDtBhcMxzST516WuSkObdr1AwKOFX6K0LH3ADvDy0lPqFDmQMivEzVDmXLlH06FbTs8fb9Wq1L8R591xx+frLamGC8TNxLvSJrQLw2f5zH8/w+eBPpGf6jbMziNKdZ1wRSPCI2MFUuUVX264hfJhf65EgHRsKCXF8uEaS+aQUkxWqYwBed9PEDmO7u0oYqgXUpC3+kcD+s7KIf/+kTrqJUfCBTop4kTXx91nV3fnKaA5tFwfLw2DiiSdt08RJxDC0MwikGcGtE6qYPp2gx5NhKS98dY40RGeTWO0y0JZRUJsuZ12sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QF8db7W+YbYRqJNdGVnAyMFZ98YJHwuO7grixfymQkY=;
 b=Kwk7CczjtqDfgrlH9SxtERR+SDOA0gMd12TkyeGkrA7RMUqsAO0BaL+Kw5tbgB1C0yH43fryjL6phyXpk1S5aYzs3unq9qAL90EV/uCowyRLNAPUbFo3SWOviJMS5Hjzbbj8pP52c1hxjHopFlKKvYRHwzLUVArpVn2Yb69aisU=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by PH7PR12MB7818.namprd12.prod.outlook.com (2603:10b6:510:269::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 19:07:01 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0592.007; Wed, 11 Nov 2026
 19:07:01 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "peterz@infradead.org" <peterz@infradead.org>, "ljs@kernel.org"
	<ljs@kernel.org>
CC: "Rao, Bharata Bhasker" <bharata@amd.com>, "rppt@kernel.org"
	<rppt@kernel.org>, "ankur.a.arora@oracle.com" <ankur.a.arora@oracle.com>,
	"vbabka@kernel.org" <vbabka@kernel.org>, "david@kernel.org"
	<david@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"surenb@google.com" <surenb@google.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "Salunke, Hrushikesh" <Hrushikesh.Salunke@amd.com>,
	"liam@infradead.org" <liam@infradead.org>, "mhocko@suse.com"
	<mhocko@suse.com>, "bp@alien8.de" <bp@alien8.de>, "Nayak, K Prateek"
	<KPrateek.Nayak@amd.com>, "pfalcato@suse.de" <pfalcato@suse.de>,
	"x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Thread-Topic: [PATCH v3] mm/memory: drop PROCESS_PAGES_NON_PREEMPT_BATCH
Thread-Index: AQHdcH7OSO+J2tGPsk6kyOa+UPv/Dbco0pEAgAAI8QCAAAKCgIAAYKOA
Date: Wed, 11 Nov 2026 19:07:01 +0000
Message-ID: <261ef956af0843f414b4def58b13dae003c933ac.camel@amd.com>
References: <20261109-clear-pages-batch-v3-1-6693efe18dff@amd.com>
	 <20261111124006.GI2668564@noisy.programming.kicks-ass.net>
	 <avRnJiDLdGcbSW5d@gremlin>
	 <20261111132105.GJ2668564@noisy.programming.kicks-ass.net>
In-Reply-To: <20261111132105.GJ2668564@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|PH7PR12MB7818:EE_
x-ms-office365-filtering-correlation-id: c790d955-06e5-40b6-5515-08df4026f757
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|7416014|366016|10067099003|261026121527099003|56012099006|38070700021|4143699003|11063799006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 DzLa9YN6sl+wIJ0B5cwweJWELuOGh2/B8L30mwrZh64QOd28iJnr3+NKxoNISm1SYwtMzneA6diKUHrXS9OyG+NDiN8yIi5iQ6wUd7+VPYZDtsXob7JDZ63tGZmMNDcMtJ10/8UF5u4mA4gA9XkEi40Sxr8dCjMCkHiiRws8RTAw9oc4HRZeg5ME2h6hjiisYQH/7/lJVKsk0I9pjB3VEQNvw5OvktqPHTIyRG1c3cRHJIDyI9r3iBYUydGbLZ54iVs9FwSvWyE3fXw27k7a+9yDtGfjqQt7mXIz2qfd3JhvQHSKGUl319eFnUk6X22cGf4qDA5627rcbQlh/NjgRRHG5UlpPWABfxeaudfyK0UOWe4E61CiYmnW1xd6kEwZpk8TF1zQldc+a6k668z9/WW+5U7NCYCHPcTVzqDmawpmeS/W64tDukwT7ec6Cn2inZVmp0i2yuGeDzSl36XSJRnCZZ/vDIiHbNa4Mvwg7HE115i45qUL9PNioMtKI+OpApMkGf7FIufIH9ye8MMdTjRwyGHO+tsELeL96GFlS92USpdTv7Yr3znxZSW8o98WSHk2oRHvMcNZ7BmP1O+ghEIgao+JQHwKEF1+frK/MeDyqeqMY7UTP6NEl8TqgBXtbl2mk10bL0RZRKIv1UnGtaDZqIiXBsm3igM+yurIWtGIGd+7FxQ8A5dq9jJUnq5NyZP6i89mOM6ommu28NbL7D1EbZvmTFoHzSdK1T2oZQg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(7416014)(366016)(10067099003)(261026121527099003)(56012099006)(38070700021)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFQ2ZFhlMFlCVmpJRjJWMFJUMWdKQTF1SUtTTU5hZkdrSUVjaE9va2xCVlVG?=
 =?utf-8?B?NGZvTXBONThwcXgyMjVmNU1YVEw1am84cFBNaEVTY3lWTDkyeFMwb0N5Z21v?=
 =?utf-8?B?NGhMeUdBT2FCdlczZFNxL1BVa3RTUlR2VkFmUlN1aGJqalozNlVJaXhQaFR2?=
 =?utf-8?B?RDFJa2lHTExPbytVdW9zYjNXMUVIdXE5cWpGRlE1T0M0ajV2Rjc0eTJDelVt?=
 =?utf-8?B?cERJR2lIRVh0K2MyMVdhaGQ4ckZHN1c2bDBLWE9nQzR5VFVJblRjamp3U01P?=
 =?utf-8?B?QjVJRzRqQk81cW9RL0kveXNZNUx5dTc2cmlVaUpJTDJGa2JWay8xYmlvbnQw?=
 =?utf-8?B?MXd4bmswdTl5ODU5SlMxazI1a2F2MVZlc2tvR3p6WXd5c01Mc3Vidmd1S3Vk?=
 =?utf-8?B?OGtUdmxyWlZvOHF6UGFOTEViTlJCWFE5Wmord0VOM3U3d2ZYRFpRRXhZaG83?=
 =?utf-8?B?UDZPOXNMSUdNZjRKaVduZ0wzVE0ydFZLam9XT29mR2tIcEZ2OC9CSGVmWFYv?=
 =?utf-8?B?UzErN1JVU3I3aU5qNFlyaExUU3JhVnMxb2EwLy9OTXFTUFpwc1pyQThoOFBO?=
 =?utf-8?B?RW5ENVcwRDIyY0JneUQwS043Q3AraTZNNWxvdlMwK2FTRC9ac3hzOVAxOFBE?=
 =?utf-8?B?MllLejRPbDJPOG1aYzZCbUtHSGx5WlE4NytKakVhSEhXRlJDRGU4M2w1NFNr?=
 =?utf-8?B?Z0JHRHhiZTBzU2lrdDVhWkJRalFmRUE1TnZOWndSMWRGSFNqVkJQWDBPbUVX?=
 =?utf-8?B?R0J3RVE2ekJLMURPYlpTWWlPdzdpcDBhYkpJbERJVWh1OTZlbWpWVFVxbzdO?=
 =?utf-8?B?enp0MTJOUmlEZHpCS0hUZTdkMXltSE1GUTVNTDA3T2d6WTFETHVZQTBwTXNh?=
 =?utf-8?B?VXlFdFpocFFFSC91WDdRTU9XQ05HTGd1TVNxZENVdVloSnJBUGRkeSs2ZzIw?=
 =?utf-8?B?M2djT2l4UlFmdVRLREtkODg5dU1URkV0dHIyRkhVL0xSTEwrRUI3b1YwNHAz?=
 =?utf-8?B?Um9GdUJJdlZuMzVST2JERk1sMDUwME9ReVhWU1RBMEo3TWxVYlVmdExkUjBH?=
 =?utf-8?B?RElvQnlndlErK0ZtT29tdnR2MXlZRlZJWnJyRHZxaUlmWkR3N2E4RUt3blBu?=
 =?utf-8?B?RjNaRGJlVXN1VU1xb3Z2OENZdDkzV0tkc29SRUc2Vk56czRVdU9XekY5MEsx?=
 =?utf-8?B?Z1dSc1FmNm9MbzVkRW5jd1g5d1pVMTRvYVV0Vy8zSHd0ZGpPSWNRdlJWaXlo?=
 =?utf-8?B?MkJLVkcrNGRkS3ZjaHhqL3Nna1ExOVNMYURPVGNqOUowbnFQWis4aTZxQzJW?=
 =?utf-8?B?cXkycFJZWktWTmRobzFENkhwRlN0bC9XZjBNeW5tam50eHpBYTVFaldaaXRp?=
 =?utf-8?B?SFJoVUZIWkUycHE3RTQ0eDRRajlCOXEyMWcyZ3pNR3EyUUdWcXh3YlM2b2JR?=
 =?utf-8?B?NVFBcC9TTkViUFpHZjZ1VWMvMFR0TkRPeGZDS2pyUGNlYVBBRllCd2RhTWJu?=
 =?utf-8?B?RFIyYzErTFVFbkdrV0JPNG9HSEF5b0tDazhWcWlyNnFEcEMvZjJkc3lKQTFG?=
 =?utf-8?B?eXRhZFRUV25XWjFXM0dia3MzRXFQM0M2bXVGT1Z1Y0RWcDQ0SUoxVm9xL1hS?=
 =?utf-8?B?TVgyMkVocDVDak5jTjlPbEhybzQxb3p6UzJqL1Eyb0RPL2JaZndOYjhSSXZu?=
 =?utf-8?B?cy80Vm9IUWZ0TWFERUdGOTRiV0ZYSEtXZjBvUVpTZXdWMklEOVJQNjBSOGJD?=
 =?utf-8?B?UzlHQmxpeWJJaWFGWmJxZ0JCWU9sNUJjL05HQXlOejJFSk5vVXdvRGwyU0pQ?=
 =?utf-8?B?enhuV3oxUk00dVQ3aW1SR2ZCMG9vc2c1SUFtSGtrZ1pSdmh0S0g5QktIMWoy?=
 =?utf-8?B?SERvb2liS3JMVklqMFArN1VzTnlOZC9hTTBPTGZ3My8waXRqZStKYjlsL2F5?=
 =?utf-8?B?ekdZWXNZS0diQ1d2b2NSRDBKYnVCbVdYZUZFTnBtWCs2NmlNQUVoaGY0TEJH?=
 =?utf-8?B?TERaWGQ4V2toeGxXWTc0V3VZb1c0TUZ0UWlyNis4YkM3NHY0QVZ2YTgydEhS?=
 =?utf-8?B?NitIL1dLQWQrNzRSSkp3UUw4KzhOS3J5Tmp3ZDNERXV3MjJzOUJKRnAzb05x?=
 =?utf-8?B?b0RXUkFtK0paMGs1eEt6Uy9HTEVEUlhQdjRLMWJwcVYwNmZUUVRTSjlNY1My?=
 =?utf-8?B?SENLbkdBNW8wM25Wa29JYS9iLzQyNGNReExIOWtJQnZ0ZFdicHcrbytpKzZC?=
 =?utf-8?B?NTRORE5wNHdZSXpKdFplSEpaR3VLT1pBOTJ6L3FIblNxa0JleU85MldzblFs?=
 =?utf-8?B?ekNJcENwMVNseE9Ma1pRbndwbFZwUjF2WmhiTDNrcFZPbHd3RFJoUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BD8ECC47D54EE46A90F4EBA58D4209D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5259.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c790d955-06e5-40b6-5515-08df4026f757
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 19:07:01.2357
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /EIvcjcGN3rO8yLDR8ZcUCFBG8jLGP4dhsyMnYytTwx46awjGoQCJybWmEBvxHeJiW5ms9x8Eod+SLqV3z/ufQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7818

T24gV2VkLCAyMDI2LTExLTExIGF0IDE0OjIxICswMTAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToN
Cj4gT24gV2VkLCBOb3YgMTEsIDIwMjYgYXQgMDE6MTI6MDZQTSArMDAwMCwgTG9yZW56byBTdG9h
a2VzIChBUk0pIHdyb3RlOg0KPiA+IE9uIFdlZCwgTm92IDExLCAyMDI2IGF0IDAxOjQwOjA2UE0g
KzAxMDAsIFBldGVyIFppamxzdHJhIHdyb3RlOg0KPiA+ID4gRldJVyBvbmUgY291bGQgZG86DQo+
ID4gPiANCj4gPiA+IAlmb3IgKGludCBpID0gMDsgaSA8IG5yX3BhZ2VzOyBpKyspIHsNCj4gPiA+
IA0KPiA+ID4gYW5kIGZvcmdvIHRoZSBlYXJsaWVyIHZhcmlhYmxlIGRlY2xhcmF0aW9uLg0KPiA+
IA0KPiA+IEkgZ3Vlc3Mgd2UgYWxsIGdvdCB1c2VkIHRvIHRoZSBleGlzdGluZyBwYXR0ZXJucyBh
bmQgSSBmb3Igb25lIG9ubHkNCj4gPiByZWNlbnRseSBmb3VuZCBvdXQgKGRvaCkgdGhhdCB0aGlz
IHdhcyBsZWdhbCBpbiBrZXJuZWwgc3R5bGUgKGJlY2F1c2UgSSBzYXcNCj4gPiBpdCB1c2VkIGlu
IEtWTSkuLi4NCj4gDQo+IFJpZ2h0OyB3aGljaCBpcyB3aHkgSSBrZWVwIHJlbWluZGluZyBwZW9w
bGUgdGhpcyBpcyBub3cgJ2xlZ2FsJyA6LSkNCg0KDQpUaGFuayB5b3UsIFBldGVyLg0KR29vZCB0
byBrbm93IHRoaXMgYW5kIEknbGwga2VlcCBpbiBtaW5kIGZvciBuZXh0IHRpbWUuDQoNCmJ0dyB0
aGUgcGF0Y2ggaXMgYWxyZWFkeSBpbiBtbS9jb3JlLmdpdC4gSSBkb24ndCBoYXZlIGEgc3Ryb25n
DQpvcGluaW9uIG9uIHRoaXMsIGJ1dCBJJ20gaGFwcHkgdG8gc2VuZCBhIFY0IGlmIHlvdSdkIHBy
ZWZlci4NCg0KVGhhbmtzLA0KU2hpdmFuaw0K
