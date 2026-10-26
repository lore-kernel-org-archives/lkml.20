Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793017080;
	b=GlbMi+9/Nl2ocHGZdw9gdP0WY1dFDn0tvcKKjnf+qRDzX+w6kSUEx8YtROGDf7ZanE5C
	 2Hx9RVbR1GHzs7SpDTnoczYpxRlEPnKWRB+kQo5FCKiemRoBxVAgDzVY8U5J94FGEhX4l
	 OioItdIuzlsdtqRGzmnT4xTSeEjVf22j88LdGxESxSGJZj9UipX3lcFuYPFVhlWcDv44M
	 cUZfi7oUueCClruyT+466r6ndKUK3bWzxtGrqv2/EVT8bgRL8olG7Q1cym4insaOoxPug
	 PVqFp7CeaAJArWlxCqgBKnwmFNljzP8mBcGGBL5olbSJui5/oUCE3zcL5VeO3N6/fzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017080;
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
	bh=MHkaENpEmQVkkGXdFSJEkmkdfJFnWKSrQztwva5D25E=;
	b=4KLROM05HWHwnPpXP7ICVT1zZMQwbuvL07rSsgkn3COxoFLWTOhiPaF9Uq4GUYWJkAY8
	 zOQuHjoRzFoRQAVoDfsJuib6ptT206Wa5j5Le8gz49fqaQlGmlKCs0/iuKBSSAjI1oVQp
	 VsyhRspzl5OxEb9/Hwc3iND1wD8vihx5/fpdY/4kJsNVqAMGz4B/jHJT0TqHGVGw2W2xA
	 f/Dgk10Ctz/HOTSfGc/TFFY1hGQDPIZ2WflMfpFi7jnJc+1xg+aNyFublpJ85QhqXXSLm
	 y8CN7cx3G1bmIT1WSZJcRDTR1xxwk+I29LRID3pcb61QT+UbJVCMuMNtMdxUeQR4EFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rRIDbTs9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.41
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010041.outbound.protection.outlook.com [52.101.193.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E9E7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rRIDbTs9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHC2fWtLo+HrhX5zn/fJSLM/0XMyzjh7k1r26ys7V1okl5F16GvyUKgw+JtNYz1BXXrcj1gdAORlUKS6AzMyDR4J5qcSNnZ3sAghh/dSaZcfE74pRF61GqF5u4ToFYir93Z3Rqw4PfbhCfgQJzgFGSh06kMby70m9m44S8ZcvXWxhylRFZZO5LG8rA9f/VBc85Bdo+kbOGZjF4LXavrWwRyr1DSiGIY7n61rbzRRGIgcoXWiUZgm1zECUQdKZ772ENYcSPrjIdhzlFRaALRd8DSjX5H4XAnPykTjExXcNO+olAF7ZhpgfRHouM0BLFr3eFsaxq4ThQLZTtIdaEvknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MHkaENpEmQVkkGXdFSJEkmkdfJFnWKSrQztwva5D25E=;
 b=ny7JzwsF6PSONAj0E66SxowGVZhgO/BXgmmOjIHkDJU2m+RNXQuOYzkicYfSO4b4CcV7JVkzQjptIoQ4t3GJpjKxQf+T57qiOHFCl5kwgkqXAuKZla1Vr0RaEOIES5vMRomBV7nZFZRWThdR9Xr9TkJ7CE1UuWSb2VsgFv80vflGY43TzKFshjIM8qC6sb8nzUF/9kcrqZ/dOtXLyivUnWm89aIZZpp43X081y6ORDqwuAWcWntTghaVBDCy7Q0y6veYq9Bq4gh3spmCspKNxeHzVHCTSMScG85oqSi+KSGRNDS5RUJTwIGF/FMbQoqemIzGXM/OpU0vdfz4DGBlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHkaENpEmQVkkGXdFSJEkmkdfJFnWKSrQztwva5D25E=;
 b=rRIDbTs9n/1tS/JjcRM1RKa191aE9L8wB46wxX9o8TSQmPNUpEJlBsv8XwqS9PjfdPCGTqs30ySNakMOawLxK3uRWLzIr6q1DWO5WgbWfoRcmk875T+D2uNKbwGvYpAtfcWkq/WplQ1+LaDY1JWF8glVbJ0nLgGF5t67diGBEk0=
Received: from BN9PR12MB5259.namprd12.prod.outlook.com (2603:10b6:408:100::17)
 by LV2PR12MB5894.namprd12.prod.outlook.com (2603:10b6:408:174::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 12:17:56 +0000
Received: from BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed]) by BN9PR12MB5259.namprd12.prod.outlook.com
 ([fe80::122c:cca7:c2b3:90ed%2]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 12:17:56 +0000
From: "Garg, Shivank" <shivankg@amd.com>
To: "xiangzao@linux.alibaba.com" <xiangzao@linux.alibaba.com>,
	"ying.huang@linux.alibaba.com" <ying.huang@linux.alibaba.com>
CC: "rppt@kernel.org" <rppt@kernel.org>, "wangkefeng.wang@huawei.com"
	<wangkefeng.wang@huawei.com>, "chengkaitao@kylinos.cn"
	<chengkaitao@kylinos.cn>, "vbabka@kernel.org" <vbabka@kernel.org>,
	"david@kernel.org" <david@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "surenb@google.com" <surenb@google.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "muchun.song@linux.dev"
	<muchun.song@linux.dev>, "ziy@nvidia.com" <ziy@nvidia.com>,
	"nao.horiguchi@gmail.com" <nao.horiguchi@gmail.com>, "liam@infradead.org"
	<liam@infradead.org>, "linmiaohe@huawei.com" <linmiaohe@huawei.com>,
	"mhocko@suse.com" <mhocko@suse.com>, "kaitao.cheng@linux.dev"
	<kaitao.cheng@linux.dev>, "tujinjiang@huawei.com" <tujinjiang@huawei.com>,
	"mgorman@techsingularity.net" <mgorman@techsingularity.net>, "ljs@kernel.org"
	<ljs@kernel.org>
Subject: Re: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
Thread-Topic: [PATCH] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
Thread-Index: AQHdZUBdgE3FtTvk10qUkek5AMi/c7cPvY6A
Date: Mon, 26 Oct 2026 12:17:56 +0000
Message-ID: <2b2abc8718f1462f475d816437cdf65284698548.camel@amd.com>
References: <20261026025724.1430747-1-xiangzao@linux.alibaba.com>
	 <87pkww7lnl.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <87pkww7lnl.fsf@DESKTOP-5N7EMDA>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5259:EE_|LV2PR12MB5894:EE_
x-ms-office365-filtering-correlation-id: 8a87a763-e879-41f7-c1c7-08df335b2aeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|18002099003|22082099003|56012099006|4143699003|5023799004|11063799006|261021121427099003|10067099003|261009223027099003|261022105027099003|261022075727099003|261021135927099003|38070700021;
x-microsoft-antispam-message-info:
 GfZiHzLpvgS2zmd7U6KEFMiNE7etkDT4KXW5TbqDfIMmR+/4pupXo+BJRVI9AITwbtp2L1EUqsp2CSnTWhvPaWqSSRoufCxXbJ/4lsu6O1sqLl6LtonF56LvpHmjmOSwvgLC9qYK+v1EdDYdqYKFcrinmPqwqprA1H5IERypZ/9awSZSP79PEVmeuGj/Tm1f6Ki5EiCZ02pouGn9ZIgB529mdwM2Yft9FveTc1BG7uxnRwj5KApCXlqZ3r8HT5uwVICpaEz7zfs/wnTIJwSqG+TNBKgBVXVLP7NbEIb0iLjnubst5mjuUEeJ+M3mnRZILWniY5NaB4YbFq3Sb00BvMWQLb1lTewdBX8kt3DVD5OorxN9/5Qbc3pPEJgAEMlFSRHP0APg8jYUC9fHPYjN6KthWRclf8OET4A721krhO18EwImDdesmaqfHkEa6BLq5MqrbADs89b6mt5G5kys+utQLzQu+z/QKLceDA+xA2Xjv/ZpCQ6+8sprqFRe6ctI/CH1adlYWeEPZ8IPPllLkO9VmWxlRPXKqjF/OXNc2CJQKG0KUXXpOXGqdAlY78KTAHR5/X8fZKKHf58mJ4xJ3q0NiVKw05Jxbcxjq+N2mqkdIZuU4DAmSRFM0g9UidbdHtFz+g2j5qmael7Zv/6nOwfB9z3LNhU47aWbithzsbY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5259.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(18002099003)(22082099003)(56012099006)(4143699003)(5023799004)(11063799006)(261021121427099003)(10067099003)(261009223027099003)(261022105027099003)(261022075727099003)(261021135927099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXloY0tVWTVJbkdQNU9YYVlIUERaZkxIOG9MWEJTSVpUemVaNEtDTkpMdXV5?=
 =?utf-8?B?cG1vUEFwOUJQMm1GVTh2T0lWOVcyY0hBMDV0Z0ZGb3RNbzRvTmtmeGNzOEhs?=
 =?utf-8?B?ZVh2R291U3ArcUhOVFM0aWZFTEFaTmJlZFBnUjEyQUd1S0NoQkV2cUpOMlc2?=
 =?utf-8?B?QS9LUEhPTEhWRkVuYjA2WVkxcFkyc0V4SkRMRmhFaG1pMUhsUTUyeEVEU2dl?=
 =?utf-8?B?ZlpqZUdkd3kvV1pKRDRqUXRsMlVSQnlIM3BlNlBaeUxxZXlySlU0eElOMEsv?=
 =?utf-8?B?eTE1NTFiVml1emVCUTlIYU9jUmFXdHFOMDAvVDVySUZNVTRYUkpMcGFIUjlx?=
 =?utf-8?B?cXdEN1NGbjJHRC9UN3RVcTA2djBXU1BjaC9XMEt3Q0J4eE9YMEt4R1BVUEp6?=
 =?utf-8?B?TFdSN0FLVnFWS2ZReXJ4dkd6OElMTmNUR3N2L3hzaXA1dTQ0SXVEV0M4Q2Nv?=
 =?utf-8?B?b1dOd0lTY1l5WlllWlJIRWIvOWFRcWtsd0JJTlVqRXRCZTlyQnVud1dpNmNp?=
 =?utf-8?B?V01WRjQ1VmRFcnUxZnBwVTUvR0tTa1QwcFcxenNGMEE1Mzd6YzVaQVY4ZGM3?=
 =?utf-8?B?R2lJQ0xPYkN4empMeENGY05tdzlGWEYzU1YzcXRZV2p2bHNES05lTDZuNktH?=
 =?utf-8?B?emFTZGtuMzY2U2ZKTHo5alJ3ckxLajc2QVF2TndKcExFTC9nNDFRdlJBTWpP?=
 =?utf-8?B?Zk9FcnRabVVtR2l3SGVsM0dLQjkwcW1CN1ZpSThzU3g4dkxTVnhrNUcwUERU?=
 =?utf-8?B?dmMwZk8vTTBCclk5VFlNK0NjV0RiZVZ0U2FlbFh3WmtvK0hqT21POFl5azdv?=
 =?utf-8?B?akdCY3NxdVVNQXBNRkZVVVUyeUtkYnBrcnEyeDBIcEw3d0NBampXUU9qUW9l?=
 =?utf-8?B?OUd3Z2E4enNQUVBlY0UyS0Y2MHBuUjB4ZUxsK3VEZ1JXWXpUczVkOTkzOVVq?=
 =?utf-8?B?YXFMZHgzRXpxRnRDbmg5QWlGT1llZXRTbEpVK0xIeFh0aUtWekQ4ZERDSEtr?=
 =?utf-8?B?aDZxMTd5Yy8yM2Z6YkFFWVVDbnpnaGxZcHVxQmlIZlgyUXR0bU12bloxeU5h?=
 =?utf-8?B?eWFaOGY0NDgvYU9uRlhRYXNPaFFieGpDWjJ6aHRMQzI4S2dHWkxmYlptbVdM?=
 =?utf-8?B?ZTA1QW5lOEt0RHhLbTBwa2pQb25pdTcwa051U1VhaDloQkhHY1RRcXRzZVBW?=
 =?utf-8?B?QXZYRzV5ZXFMSlJpbGFTc1lCM1BKbzBQLzRIUTdVMmFkVmNYcXFCV25XZlZw?=
 =?utf-8?B?UEduNWpwMjFFSzJBY1dSSThOdUJJMktjYmFONm0wem53QkJKYWhuelA4bE8v?=
 =?utf-8?B?MjNucmJ2YmJNaXp6QWJ6dzdvcy9KYVhFQ0xzRnM0NWpsM0h2MGUva2dMMTE2?=
 =?utf-8?B?dm5scHlkV28rN3BxdGx5RG9yOWRaVVdoMHV1cWdneWNHRnpMQ3VWbnFHTFR4?=
 =?utf-8?B?MldqQ2F1NXBsWTBrdGhtNExjbXNkUENHOHl1ZFNWYzZSYWpuSXlOZlpCVm45?=
 =?utf-8?B?VUQ2L1VDRnZnd3E5ZWtvRlltU1JMZVVMblBwc1NYSmt6RTQySWJkeGJKVmRy?=
 =?utf-8?B?K01ScDJ2OFBuVFBCVjlmZlpSblpyOE1mMGVua29SejdhdnNzT2dJSUNxS1gr?=
 =?utf-8?B?eGkrK3pyVGlDU3UvKy95YWR4cDQwQWVlSmNjVW4xR2FIaGF1bXMvd0RDVjlJ?=
 =?utf-8?B?eXFFVWYvSTVLKzgrRVA2cjVERDlFTkF3ZWh6OHdySWVHU3UvbGFXaUhIRURZ?=
 =?utf-8?B?TXp4Z1FBbHJJQ0pqZjAyaDE1UUlFUTZGQkErZXRtaU1hMUFkdUQ4T0pHTXZa?=
 =?utf-8?B?S1hpUnlPeUd3ZEVMRDJ5RWhyTjlManBkanZLdXZ0alAzSEZaQzFKMDl3NWdI?=
 =?utf-8?B?Q2VZSlA5bnp4QTF5N245c2NuaEY3dE5lOHYwWEQ3VkpHeTcxcWhpdnNXenJv?=
 =?utf-8?B?RFc4dGIwZ0F6UzMzRHJ5QnNTcElkcVBpZ3J2RDlUcm5GWVRycGtrMDRLbE9k?=
 =?utf-8?B?NVB5bDZZa2pzdHlGSlVZMWFZNEw5U0dIOVZiamRSbFQxMnM0SmZpMXFSQ05V?=
 =?utf-8?B?U2E3bjhLdXhRN3VKYm9nUzNKSm5EUUY4cWhNNGVqbWlERUY3Q21TZHBPdGI1?=
 =?utf-8?B?UVFHUkdwdm9KdXhDbmNRSHczZXVwS0hyd2hvcHRGQlg0TUVsY3hlUFRTQita?=
 =?utf-8?B?eHp5L2pmWWZmcm81NzBxRjJpWW4yaVhzUTM3VFVIdkRXT2VYT0laTlVSbWZ5?=
 =?utf-8?B?Qnhhc001VWtPejFCay94SGJkcXV2Zzh0dlRobHpaK0RGSDVnamJDWnFWQm9T?=
 =?utf-8?B?TTl0N0Z2VTRFSklWUEhZZkVGdS94bzdMSmdWaGJ0a1FSRE9NNm1sZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <46E56608297CBB46A2E4C2053EBB493B@namprd12.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a87a763-e879-41f7-c1c7-08df335b2aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 12:17:56.4984
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qaLayAYWp0q0mOk+dzvFUdzx/G3Ux1giybg++VuhbBLM+M6dYaaANT3xsNKsG8+FW1LhkwKro07Cstmv8fresA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5894

T24gTW9uLCAyMDI2LTEwLTI2IGF0IDE5OjIxICswODAwLCBIdWFuZywgWWluZyB3cm90ZToNCj4g
WXVhbmhlIFNodSA8eGlhbmd6YW9AbGludXguYWxpYmFiYS5jb20+IHdyaXRlczoNCj4gDQo+ID4g
V2hlcmUgY29weV9tY190b19rZXJuZWwgaXMgZGVmaW5lZCwgY29weV9tY191c2VyX2hpZ2hwYWdl
KCkgYW5kDQo+ID4gY29weV9tY19oaWdocGFnZSgpIHN0b3AgYXQgYSBoYXJkd2FyZSBlcnJvciBk
dXJpbmcgdGhlIGNvcHksIHJlcG9ydA0KPiA+IHRoZSBub3QtY29waWVkIGJ5dGVzIGFuZCBxdWV1
ZSB0aGUgc291cmNlIHBhZ2UgZm9yIG1lbW9yeV9mYWlsdXJlKCkuDQo+ID4gVGhlICFjb3B5X21j
IGZhbGxiYWNrcyByZXR1cm4gMCBhZnRlciBhIHBsYWluIGNvcHkgaW5zdGVhZC4gIFdpdGgNCj4g
PiBQR19od3BvaXNvbiBzZXQgd2hpbGUgdGhlIGRhdGEgc3RheXMgcmVhZGFibGUgLSBzb2Z0d2Fy
ZS1pbmplY3RlZA0KPiA+IHBvaXNvbiAoTUFEVl9IV1BPSVNPTiwgdGhlIGRlYnVnZnMgY29ycnVw
dC1wZm4gaW5qZWN0b3IpIG9yIGENCj4gPiB0cmFuc2llbnQgaGFyZHdhcmUgZXJyb3IgLSB0aGVy
ZSBpcyBubyBmYXVsdCB0byByZWNvdmVyIGZyb206IHRoZQ0KPiA+IGNvcHkgY29tcGxldGVzLCB0
aGUgZGVzdGluYXRpb24gZm9saW8gY2FycmllcyBubyBwb2lzb24gbWFya2VyLCBhbmQNCj4gPiB0
aGUgcG9pc29uIGlzIGNvbnN1bWVkIHNpbGVudGx5LCB0aGUgc2FtZSBwb2lzb24gY29uc3VtcHRp
b24NCj4gPiBjb21taXQgODQxYThiZmNiYWQ5ICgibW06IHByZXZlbnQgcG9pc29uIGNvbnN1bXB0
aW9uIHdoZW4gc3BsaXR0aW5nDQo+ID4gVEhQIikgcmVmdXNlZCB0byByaXNrIG9uIHRoZSBzcGxp
dCBwYXRoLg0KPiANCj4gQXMgZmFyIGFzIEkga25vdywgc29mdHdhcmUtaW5qZWN0ZWQgcG9pc29u
IGlzIHVzZWQgZm9yIGRlYnVnZ2luZyBvbmx5ICwNCj4gc28gSSBkb24ndCB0aGluayBpdCdzIHRo
YXQgaW1wb3J0YW50LiAgSGFyZHdhcmUgcG9pc29uIHN0YXRlIGluIEREUiBpcw0KPiBzdGlja3k7
IHRoYXQgaXMsIGV2ZW4gYSB0cmFuc2llbnQgaGFyZHdhcmUgZXJyb3Igd2lsbCBjYXVzZSBhIHBl
cm1hbmVudA0KPiBoYXJkd2FyZSBwb2lzb24gc3RhdGUgdW50aWwgYSByZXNldC4NCj4gDQo+IFRo
ZXJlZm9yZSwgdGhlIHByaW1hcnkgdmFsdWUgb2YgdGhpcyBwYXRjaCBzaG91bGQgYmUgdG8gcmVk
dWNlIG1hY2hpbmUNCj4gY2hlY2tzIChhbmQgcGFuaWNzKSBkdXJpbmcgbWVtb3J5IGNvcGllcy4g
IElmIHNvLCB3ZSBzaG91bGQgcGxhY2UgdGhlDQo+IGNoZWNrIGNvZGUgYmVmb3JlIGNvcHlpbmcu
DQo+IA0KPiA+IENoZWNrIHRoZSBzb3VyY2UgZm9saW8gd2l0aCBmb2xpb19jb250YWluX2h3cG9p
c29uZWRfcGFnZSgpIGluIGJvdGgNCj4gPiBmYWxsYmFja3MgYW5kIHJldHVybiBQQUdFX1NJWkUs
IHRoZSBub3QtY29waWVkLWJ5dGVzIGNvbnZlbnRpb24gb2YNCj4gPiB0aGUgcmVhbCBjb3B5X21j
IHBhdGhzLCBzbyB0aGUgY2FsbGVycyB0YWtlIHRoZWlyIGV4aXN0aW5nIGVycm9yDQo+ID4gcGF0
aHM6IHRoZSBDT1cgYW5kIGZvcmsgcGF0aHMgZmFpbCB3aXRoIC1FSFdQT0lTT04sIEtTTSBhbmQN
Cj4gPiBraHVnZXBhZ2VkIGFib3J0LCBhbmQgZm9saW9fbWNfY29weSgpIHByb3BhZ2F0ZXMgdG8g
dGhlIG1pZ3JhdGlvbg0KPiA+IGNvcmUsIHdoZXJlIHRoaXMgY29tcG9zZXMgd2l0aCB0aGUgc2Vw
YXJhdGUgbWlncmF0aW9uLXNpZGUgY2hlY2tzLg0KPiA+IE9uIGFyY2hzIHdpdGggY29weV9tYyB0
aGlzIGNvZGUgZG9lcyBub3QgY29tcGlsZS4NCj4gPiANCj4gPiBUaGUgY2hlY2sgcnVucyBhZnRl
ciB0aGUgY29weTogYSBjaGVjayBiZWZvcmUgaXQgd291bGQgbGVhdmUgb3Blbg0KPiA+IHRoZSB3
aW5kb3cgYmV0d2VlbiBpdHNlbGYgYW5kIHRoZSBjb3B5LiAgQSBmbGFnIHNldCBiZWZvcmUgb3Ig
ZHVyaW5nDQo+ID4gdGhlIGNvcHkgaXMgY2F1Z2h0LCB3aGF0ZXZlciBzdGF0ZSB0aGUgZGF0YSBp
cyBpbi4gIEEgbGF0ZSBzb2Z0d2FyZQ0KPiA+IGluamVjdGlvbiBjYW5ub3QgaGF2ZSBjb3JydXB0
ZWQgdGhlIGNvbXBsZXRlZCBjb3B5LCBhbmQgYSBzeW5jaHJvbm91cw0KPiA+IGhhcmR3YXJlIGVy
cm9yIHRha2VzIGFuIGFyY2ggd2l0aG91dCBjb3B5X21jIGRvd24gYXQgdGhlIGFjY2VzczsgdGhl
DQo+ID4gcmVzaWR1ZSBubyBmbGFnIGNoZWNrLCBiZWZvcmUgb3IgYWZ0ZXIsIGNhbiBjYXRjaCBp
cyBjb3JydXB0aW9uIHdob3NlDQo+ID4gaGFyZHdhcmUgcmVwb3J0IGxhbmRzIGFmdGVyIHRoZSBs
YXN0IGNoZWNrLiAgQ2xvc2luZyB0aGF0IHdvdWxkIG5lZWQNCj4gPiBhcmNoaXRlY3R1cmUgc3Vw
cG9ydCwgYXMgZGlzY3Vzc2VkLg0KPiA+IA0KPiA+IFRoZSBmYWxsYmFja3MgZG8gbm90IHF1ZXVl
IG1lbW9yeV9mYWlsdXJlKCkgb24gcmVmdXNhbDogdGhlIGZsYWcgaXMNCj4gPiBhbHJlYWR5IHNl
dCwgYW5kIG1lbW9yeSBmYWlsdXJlIGVpdGhlciBrbm93cyBhYm91dCB0aGUgcGFnZSBvciBoYXMN
Cj4gPiBhYmFuZG9uZWQgaXQuDQo+ID4gDQo+ID4gU3VnZ2VzdGVkLWJ5OiAiSHVhbmcsIFlpbmci
IDx5aW5nLmh1YW5nQGxpbnV4LmFsaWJhYmEuY29tPg0KPiA+IFN1Z2dlc3RlZC1ieTogS2FpdGFv
IENoZW5nIDxrYWl0YW8uY2hlbmdAbGludXguZGV2Pg0KPiA+IEFzc2lzdGVkLWJ5OiBMTE0NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBZdWFuaGUgU2h1IDx4aWFuZ3phb0BsaW51eC5hbGliYWJhLmNvbT4N
Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzg3N2Jqb3dmOWkuZnNmQERFU0tU
T1AtNU43RU1EQS8NCj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9saW51eC9oaWdobWVtLmggfCA5ICsr
KysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaGlnaG1lbS5oIGIvaW5jbHVkZS9saW51eC9oaWdo
bWVtLmgNCj4gPiBpbmRleCBkN2FhYzlkZTFjOGEuLmY5MGYwYzYyMDRhNCAxMDA2NDQNCj4gPiAt
LS0gYS9pbmNsdWRlL2xpbnV4L2hpZ2htZW0uaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvaGln
aG1lbS5oDQo+ID4gQEAgLTQ3NCwxMiArNDc0LDIxIEBAIHN0YXRpYyBpbmxpbmUgaW50IGNvcHlf
bWNfdXNlcl9oaWdocGFnZShzdHJ1Y3QgcGFnZSAqdG8sIHN0cnVjdCBwYWdlICpmcm9tLA0KPiA+
ICAJCQkJCXVuc2lnbmVkIGxvbmcgdmFkZHIsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0K
PiA+ICB7DQo+ID4gIAljb3B5X3VzZXJfaGlnaHBhZ2UodG8sIGZyb20sIHZhZGRyLCB2bWEpOw0K
PiA+ICsJLyoNCj4gPiArCSAqIFRoZSBmbGFnIGNhbiBiZSBzZXQgd2hpbGUgdGhlIGNvcHkgcnVu
cywgc28gY2hlY2sgYWZ0ZXIgaXQ7DQo+ID4gKwkgKiBhIGZsYWcgbGFuZGluZyBsYXRlciBjYW4g
bm8gbG9uZ2VyIGhhdmUgY29ycnVwdGVkIHRoaXMgY29weS4NCj4gPiArCSAqLw0KPiA+ICsJaWYg
KGZvbGlvX2NvbnRhaW5faHdwb2lzb25lZF9wYWdlKHBhZ2VfZm9saW8oZnJvbSkpKQ0KPiA+ICsJ
CXJldHVybiBQQUdFX1NJWkU7DQo+IA0KPiBXaHkgbm90IGp1c3QgdXNlIFBhZ2VIV1BvaXNvbigp
Pw0KDQpUaGlzIHdpbGwgbWlzcyBvdXQgb24gaHVnZXRsYiBmb2xpb3MgSSB0aGluay4gaXNfcGFn
ZV9od3BvaXNvbigpIGlzIG1vcmUNCmFwcHJvcHJpYXRlIGFzIGl0IGNvdmVycyBodWdldGxiIGNh
c2VzIGFzIHdlbGwuDQoNClRoYW5rcywNClNoaXZhbmsNCg==
