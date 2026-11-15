Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=35.83.148.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794725074;
	b=MSIqrS1g7HSL8XA05SnB2UXwFsumMFOIADrworX+mUUXanNw1ecWOnxk2JWmkRaH/YhF
	 mt5a64QbTSivbOtLhEa0Fa9qRuKKUVzRv8VqpzqibtAzzh+QNFaogrxnS0mD0zGMC5Jml
	 DTDS8Kb8i7wlIprchoXfLlYH+aSJkIYZnKy1FUFdC+dv1+3+MLBIK+0ezJdOg5GkxQx1I
	 vUJD7txk5wTkGi2cN92DDG2sZa/cYc7wGEERTYSAeiCKXKt3tqTJFOrwOZmAdLqsITULi
	 WoNOdbr12H9Rav/47Zq/YC9RELnzmBHCCfQdxaVjF+751jfKiWcbwFp+3LRfR1HUP9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794725074;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 Received:Received:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=TqAmFZhw5TdBDOEreyI8Il3K0CkQfJ/0HmqdlBC9Qzo=;
	b=HRwXZQWhrXZUhTfF7y3K3a9vgPP7fEsJN0Ecg6apwNv/65oYbJ0cPVMJXWhukWr5Hpoq
	 GUa8CfGePBgBLqCZXLNkQ35z7Iw5by7cQFuKwZS8ZScoAsi/7FYiLCu6+HNPB52wKgO7Q
	 tzdeTVkHI+ORzhZ1r5XIJleHMPgnvTU0dWY5cP+nLpTZMirqPzYaRBTTXoQl1IrZibx1C
	 yhCMa80GPmqKJO/DuFjf4Rt6Y6K2O91ynAqIS/wyo/KnLdjHhZRVaTNCCJfMvn+66OR5F
	 gwAzKz5o01+y+dKCES+I4mwJqiuc6SHZIfN9MkDoIKXdmq4kUKOiyLWFDh+TOdxcfQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=NEwwLdlW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=35.83.148.184
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94325606A32F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94325606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=NEwwLdlW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794725073; x=1826261073;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TqAmFZhw5TdBDOEreyI8Il3K0CkQfJ/0HmqdlBC9Qzo=;
  b=NEwwLdlWVjuLxYcMxKaBCZ2c0+7ApPjShnTVTcj5qPI1+IIZOMwmRhPX
   1t4gf86RkvzGQGbc9Cq+qHts3Xcz6IOWbIxt+H5oGHQRdGIPNBTeF3gtL
   PpwBBJfpvkpPTN/P7HlV9qyIBd+6aCAS1y7chSnqgf5tJMqTFQNTUMnuD
   cf4Nm+2AbD3kvJTOfJeQycNeMtn694ut32rQ+pXTZLZ6kMMaumPQcdz9X
   pZk0P0ZQSVZk7loZjmgkShMYuPfCQBVULpA52p/XUYA3IXszRKfw9oyAH
   0k1QTBJpS5GDknCBGAhVMJ2whYSyje4o5202NDyg0NgSihmRDzN93Ise1
   A==;
X-CSE-ConnectionGUID: uI0fMPR+S+2BmTBt8tSsjA==
X-CSE-MsgGUID: BrauEixEQ56cIuWL1EVgJw==
X-IronPort-AV: E=Sophos;i="6.27,214,1787011200"; 
   d="scan'208";a="33821826"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 06:44:30 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.53:11640]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.12.127:2525] with esmtp (Farcaster)
 id 0b5fb190-9e8f-438f-8391-fe6cb359243a; Sun, 15 Nov 2026 06:44:30 +0000 (UTC)
X-Farcaster-Flow-ID: 0b5fb190-9e8f-438f-8391-fe6cb359243a
Received: from EX19EXOUWA001.ant.amazon.com (10.250.64.209) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Sun, 15 Nov 2026 06:44:29 +0000
Received: from PH0PR07CU006.outbound.protection.outlook.com (10.250.64.238) by
 EX19EXOUWA001.ant.amazon.com (10.250.64.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Sun, 15 Nov 2026 06:44:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7EBnjmawMUM6LYJqcBdkaczEfZXtDkIFX3LDopBsyKFirL4R+ImlXZl3fLVyzA6CL8cYoEITFkWaN6mQCqahRsjCMT15RN0dpVLEiyHE5b3wFR+2Y7F2MmSRWgs7TI8nucH6JSUuN0hx1gvS/EiVJisNJj+H6V7oHDzytdDmeu60QNAEkgOR8pkvUw0slG5efwjUDy2va3G8fmdpAO1gkmJGqNPueZwT3wmRcmvJ6QSQOFZllcXdlUC74skChmNJtpcmBZTF/FKHK2YFqHzaIQNX3Fex3Xd6t29NKHJj62yqw9CMDLNuQ5Gv4jD5YPzspfx/y7jdafC/CR5VtxavA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TqAmFZhw5TdBDOEreyI8Il3K0CkQfJ/0HmqdlBC9Qzo=;
 b=xFd0X5hw1C6CzxxMP9sg3IWCUqRht5VnnlGGBH3mgFuFFI3/dervYbJW1AAfhnHLc/Ie2j5jq3GatwsmwtUmVp8MxgUcQ2iAaeCC/eGH6wfoYinjrig5WxktWmcrVlaMP1zbe8qciMy4I7NnIrVMElt57jQ4+kdVerpCOAYqKkp1Zc4rHHboyeo4/qvFbcHxGTnHaJ4YaBbySU9NQFppLxPmsxazWzGikKnVYhf3VuSllHCbQu025RKJehKTytLc6Czy/LiiysqMctRVKIeuZHn1hwJZ5suKk7hWS5c0ERGyxzEpenysmT41sH7XVbpwIZHPocBnF/KPTZsnnUDNZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by PH7PR18MB5060.namprd18.prod.outlook.com (2603:10b6:510:15f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 06:44:26 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0615.013; Sun, 15 Nov 2026
 06:44:26 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn
	<jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/4] mm: add vmf_insert_pfn_order() and vmf_pfn_order_ok()
 helpers
Thread-Topic: [PATCH 2/4] mm: add vmf_insert_pfn_order() and
 vmf_pfn_order_ok() helpers
Thread-Index: AQHddMzBx6iciwaQbUGBLSRNq/OSkQ==
Date: Sun, 15 Nov 2026 06:44:26 +0000
Message-ID: <BY3PR18MB4722713137ADE7A59A1EB81BC67D2@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20261111113045.35368-1-farbere@amazon.com>
 <20261111113045.35368-3-farbere@amazon.com>
 <a242ede8-71c2-4f75-b5e5-dcfa98ab25d3@kernel.org>
 <BY3PR18MB47227EB15146F8F16E1C005BC6702@BY3PR18MB4722.namprd18.prod.outlook.com>
 <29bf5516-36bf-490e-ac35-d89893fa61b3@kernel.org>
In-Reply-To: <29bf5516-36bf-490e-ac35-d89893fa61b3@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|PH7PR18MB5060:EE_
x-ms-office365-filtering-correlation-id: 7759828f-5fe1-46e9-e1e9-08df42e3e418
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|1800799024|38070700021|10067099003|4143699003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261022075727099003|261009223027099003|18002099003|22082099003;
x-microsoft-antispam-message-info: 2MPWOHW2c9VucJVZapa+F49WEDX3qvXt7eljZ/Ye/tvQBS88V/H5Eoi2p+bMCghacojthcaQlfw1hbPVyW1ZW6gIcCve/3rYJZqvZWPdFKnrcOj5H9yGcYuA6fgal2+XnH0YkCsKUupqrbwEZMrkEoaxVwoHp3XKFjP3h9W8F+5NpltrzgvMGeDXeIqm53jeQjB/6/zg9sch+O7LiCND+kSeNyMfk+ZjEwNf9+eOPAbeBPoAxjT9KDJPXXKLc1JsE6X4pQODLbwJLGFQJLRHsPABJEDbnO2MF6+8UYzHHC9hK5pLa6LEK9+Zc79dCnY2Jn/iWOqV8ZcD+WLOi3jCrUcBs3TLgO/PAUw0AGsvKH8zWg5UR/lm6MMYnJTEBupMydtGEIncJDa6qd1e3lPBM8nOLO1uAj4iQWHW1IX3wURvBs+vw5byI6DQOc4/InW9MFB1yh879rHaasE0gQLL4w02LPhMCMSbrKiyNfh9hSDR1+1jwACUht0xHgz25uRRv3av5FAsD90ZDUU1vH5dj2fNLRDIHtrBrMNEBYpLzHzN/YT+fSArK4/TjNosfynfUfaqBBgCVP929WgqPfC5aDdgUfuGfSXJh+Wwr3bvSv8UaSvf7W+z1ccVWSyjpBNvJ+8KYtRzqUP9DO7uMGHIza+Xw2W7wqltliaOBNs8oPL4mtNTSoEhfoQN+QX8TbNQsitYmEvVNscAm0Nx3Qw4I0hkBGe2tc2hoH+bOLC+XMg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(1800799024)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261022075727099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MktoSm4xaWhkYkFkeENWL2Y3Vk40Z29Xc0I4RlZUVDUvMHJ1ZEMzeWdjcERl?=
 =?utf-8?B?OFFkUVZJR1BxWkhQQnVWeW1sZm12RzF3ZGMwUGtibTJrUStZMDNPZW5rOGd0?=
 =?utf-8?B?UFdoNTJwTGdkSldFR1p4bFR3ZFpGV0laNW1IelJjS0NCZ0hnaFRFZElPczV5?=
 =?utf-8?B?cDNkQW95ZDRkVUFsZy83N0FnQ0ttdlFOSnhsMFVZSjFQSjRTMnFjenUrMTRz?=
 =?utf-8?B?akc4NkVRTVczc2JMbTcvQlNIcEtjWW1CZGYvZGZzQTB6OXo2VXpzbW9ma3FV?=
 =?utf-8?B?SlEzandJbUVJemFDdmZ6UGdabitiM2NQSldONXl1cVNVSXlxUjhTbHcvMG5D?=
 =?utf-8?B?aUxJVFV2dDdVdThWYjRlNXZlbjB2bnoxaE8vZjBUQTdKUzJMVXR6SVlBVDR6?=
 =?utf-8?B?bGtyODVPNXRQblhYV1dmK3JDdGg5Tm9VdHdETTExdU1MYXJLVHI0YXRjMkhH?=
 =?utf-8?B?MkIxTDgwZjBFbjY0VGhadFZRYTc4N3JzaUJCZkhIRlRFZTdBOCt6OXdQbkdM?=
 =?utf-8?B?WFNJZExiRTlEclN4SzdtNlY5UkVMSCtVb1Bkc3JoaHRBV0RSby9abkVhbldw?=
 =?utf-8?B?VW14L2I4N0VPZGpRTG5pVEUzbVI3SkVFc2RCSjVjdm05UmxrTjVCWDlaaGFR?=
 =?utf-8?B?UGphK2ROWExsNlo2TTIyQ1pjM0Z5cDBYVlExK0xmdjVWVlhLOFZiTURmTHZy?=
 =?utf-8?B?VlR2Ym92emEvcEJYcVFOdmVMcE8yQlprbmVFNFJXdXlCcUxmem00M1BUU3BH?=
 =?utf-8?B?VkxYYWlleHNoTDlNOG1NVkdxZFc0YVJSTzNLZE41RjE3ZkYzbTFYTFN2cXFF?=
 =?utf-8?B?SXJpZTBCaU5XZzdLRGIrRWEwNGh2VWZLcHViVWYvWEhMdFlySnYyZkdFT2hz?=
 =?utf-8?B?V0czMUJqWGFqcTVKZE5lcFowOHQ1ZGo1bFF1Q0t0Y3g2S3EwYTl5c2s2WlFt?=
 =?utf-8?B?V0F1bjd5SXREMm1WdzI5R3lRUGJPclNYYnlieU9IRGxaM3A4QTdHMWt6TGdk?=
 =?utf-8?B?ZTFqVkhJMGFVMFU1MUQyTk5pTzJJWmpUMElGZ0J1c2hvTjJtQmpOUW1haDhV?=
 =?utf-8?B?L0U2OEZNMStSSWF2K2p1RkVPVzAyUG1pOHdabldSNFZaVUhzSGFlMkNZKzdw?=
 =?utf-8?B?Yk5MeisydUpXNWNJTEZXVGRCS1VDY2JJc0lFb1VQY0Exc2NrSEptbUNtYWhQ?=
 =?utf-8?B?VnJVZ3YrN0JJM1VyQXU2TXRwY1NTc1orMjY2Smc4KzU5aTVQYm1KaWJLdDBp?=
 =?utf-8?B?RGEycW5scy9nbEtxbzlaM0cwNUM2cFcxNldDR3RXTk9hdTY0R2tvT2Ezdmtw?=
 =?utf-8?B?VmE3VWU2V2hLZmpNeTZoQmFXYWV2MU51YWpvWTJGbjdMRGJUTkpud2RjNng0?=
 =?utf-8?B?ZTQvcTVwZFFnOXRlTGQ0VVZsUjZ6bHpuRkxLbmkySzRtaXdRVjhCYUIzYTEx?=
 =?utf-8?B?NllZYnYzV2RCaFQ0Qm5FYkdKR3ViNzhmNGdCUVpsd1ZTcWpJVGtmaU8wSDZ5?=
 =?utf-8?B?UlVvSFE5bHRBd2dPenhoRW1Cck4wTlN2dWhNOWZ6S2xCbk1zTUhOV1BCdTc0?=
 =?utf-8?B?NnJPTjhwa0gwVzI3NkVjVm9PTWcwVWg1MDZic1pnN0x5ejFNM2Q3cUx0WWVu?=
 =?utf-8?B?OG8wUHplcG40S2svK2RkSUxFQk1za09EZWc4ZTNsK2dYY2lSdDNBaDhFZ3Mv?=
 =?utf-8?B?NG5BWUs5VTVnTksrcWNvUkkwcWI5a3U1WWZlMkJWOXdhS0MwMjFsNlRZWXNB?=
 =?utf-8?B?dHI1UEdXa2F2QmZoOFVDY1ZnRzdyV0ZqdmpKN1VwZjcyeGFMSFhRME5jOGl1?=
 =?utf-8?B?OWt2UTlrV3l1QXhtekIwWG5BdzZqUS8wVWloNWFVMnh0RkhHakljcEJtUlFa?=
 =?utf-8?B?djBJTFVsalpJcDJ1cWFpWTJDQzBkckFPWTRJNDhZUkY1TUlDN2dyeXVqdU1T?=
 =?utf-8?B?eU51WW02QWJHMjZKRkdOc0cyVnlrS2ZXeExTdVF1RHhsbTNpNFpHWVhySkFv?=
 =?utf-8?B?N0JJV3FsTGgzTmpvTW1CZDRWOTJLeE03NWI1Ym56OHdXOW94N2VnRlQ3NGNo?=
 =?utf-8?B?OVptUFNkcTZQOC83S3JHNVNVSkZweVg1czNkTDFFcWN4MmxhUDZlNzl2UnF1?=
 =?utf-8?B?bGQ0a1drYW8vL2ljRGtaWC93NERDUkNYMmUvWFJDSW56bnhaS0YxM1ZObXNk?=
 =?utf-8?B?WWdyaVJ0cFlPWm42cGZqMmlTSEh0THIzUjdtQ3pacWJPZUY1MzFZR3NVRkxz?=
 =?utf-8?B?SFZYZk1iN3NUd2pzcGJ1dkJxV1NKamNJbU84M2xHZUZXVEZEVWdwK1NoaW9C?=
 =?utf-8?Q?GpHFWSRdEiem/T1fuP?=
Content-Type: text/plain; charset="utf-8"
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
X-Exchange-RoutingPolicyChecked: Ty8RI9d1s41prJt9NS5np80zqlteNbdCI+Fp46L0l29h48EAkvTgXzdWKQG5782IgInclXQIk7562UuvpcHV41fWFfuxd/UTGnWzW+eNG/71fui1Elkl6o7BbXbADMZ+wJizUUk0lCLZiIMgMdFgqw1D/C2lx+umrTQLR+OENK/+ELlrBqEpbt/TMMkoi0QZfyEgH7vlz/PYlPwdNzhGKXZFxzwj9Mf58rSY+FfVrB0vDKpyAMe309KAWgzGFz+AgXhp1sm6H8PJJ9hCySOR1dLYtLV27l5BA5ljNBuB9MHDdpqUctmeK9EdIb3780VaU7Rqa9GTjVgR2x5o0XdlmA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7759828f-5fe1-46e9-e1e9-08df42e3e418
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2026 06:44:26.1200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PuRPurz5mbtQzISlK1JOQQoGild3hqEEZoz7aIXX4LdIbFoMEukDeviS/PQeFC6cX3oMr12Ln4/QcEexjF0tjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR18MB5060
X-OriginatorOrg: amazon.com

T24gMTEvMTMvMjYgMTE6MzksIERhdmlkIEhpbGRlbmJyYW5kIChBcm0pIHdyb3RlOg0KPiBPbiAx
MS8xMi8yNiAxNjo1NSwgRmFyYmVyLCBFbGlhdiB3cm90ZToNCj4+IFdlIGNyb3NzZWQgaW4gZmxp
Z2h0OiB2MiB3ZW50IG91dCBhYm91dCBzaXggbWludXRlcyBiZWZvcmUgeW91ciBtYWlsLCBzbw0K
Pj4geW91IHdlcmUgcmVhZGluZyB2MS4gSSBwb3N0ZWQgaXQgdG8gYWRkcmVzcyBzYXNoaWtvLWJv
dCdzIHJldmlldyBvZiB2MSwNCj4NCj4gRmlyc3QsIHdhaXQgZm9yIGh1bWFuIHJldmlldy4gQWx3
YXlzLg0KPg0KPiBTZWNvbmQsIHJlYWQgRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmct
cGF0Y2hlcy5yc3QNCj4NCj4gIldhaXQgZm9yIGEgbWluaW11bSBvZiBvbmUgd2VlayBiZWZvcmUg
cmVzdWJtaXR0aW5nIG9yIHBpbmdpbmcgcmV2aWV3ZXJzDQo+IC0gcG9zc2libHkgbG9uZ2VyIGR1
cmluZyBidXN5IHRpbWVzIGxpa2UgbWVyZ2Ugd2luZG93cy4iDQo+DQo+IEJlY2F1c2Ugd2UgaGF2
ZSBtdWNoIG90aGVyIHByaW9yaXRpZXMgcmlnaHQgbm93IDopDQoNClVuZGVyc3Rvb2QsIHNvcnJ5
IGFib3V0IHRoYXQuIEkgd29uJ3QgcG9zdCBhIG5ldyB2ZXJzaW9uIGJlZm9yZSBJIGdldA0KaHVt
YW4gcmV2aWV3LCBhbmQgbm90IGJlZm9yZSBhIHdlZWsgaGFzIHBhc3NlZC4NCg0KPiBCZWZvcmUg
SSByZXBseSB0byBhbnl0aGluZyBpbiBoZXJlOiBkaWQgYW4gTExNIGNvbXBvc2UgbW9zdCBvZiB0
aGVzZSB3YWxscyBvZg0KPiB0ZXh0PyA6KQ0KDQpZZXMsIHBhcnRseS4gSSB1c2VkIGFuIExMTSB3
aGlsZSB3b3JraW5nIG9uIHRoaXMgc2VyaWVzLCB0byBoZWxwIHdpdGgNCnRoZSBjb2RlIGFuZCB0
byBmaW5kIGJ1Z3MsIG1vc3RseSBmb3IgdGVzdGluZy4gSSBhbHNvIHVzZWQgaXQgdG8gd3JpdGUN
CnRoZSB0ZXh0LCBhbmQgdGhhdCBpcyB3aHkgbXkgcmVwbGllcyBjYW1lIG91dCBzbyBsb25nLiBJ
IHNob3VsZCBoYXZlDQprZXB0IHRoZW0gc2hvcnQsIHNvcnJ5Lg0KDQpUaGFua3MsDQpFbGlhdg0K
