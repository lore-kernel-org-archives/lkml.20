Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=54.211.126.101
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794459509;
	b=BGPiLiNLxu3w5IxA+UEKsFnqrFp6kBxTwpvcku8p1HDjBPlp6V7wnvnOSK5y+W+GnCof
	 Xx3LMTTzGRiEV6yHro27wWrehEQITT6cujkmAPYL21YwJ3IHQDGlG/swj+Kbe2izlIlKO
	 +FF66EDybjnFW0xNhtpqZDWFWmbm0WxqUzvIxJOpIzRSlX2jFyyQ0T1q17jBkVDPGgZ3U
	 tNztPofW3jn4/pUjpzxs9nNIHG2HufqtMU/DaKU0GvTdGr/sYKX1dryXdlxdebKcYzmpR
	 2fAUwhM+VXftzeUUIU0dkQgD6TvUCZVBCMDanbdh1bX1UD7Y6KSyFY1vqbzj3FS5qHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459509;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
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
	bh=zasZMfYNsTWpPANn91IKNSeSpGR3YYhnfco+yI8xjqM=;
	b=nsb9OCeODxRyKyxNT37SprILlz+shrrxdAWmjayJWSk6tAx7T4Cp78291L4uTHGBf3JU
	 oh9marlQs292Fu4xsy2Lsa4o8529i6/KLM9FZobys/fIJ/IqktI5n5XTkPzhijb6S3sYA
	 oY282caiq76TBEjQK4nyI1pz0U3QTajvQgLqxLV+/bGTdPN+IS2gxd2sCotf20EiTvwhK
	 a87QNFkcFpvVkdKqq8Welc4+W9qK/1u4iik4Hbaek7cF0rQCToJsVNpaNiBu5Cd/hvh1v
	 g8ZxHWfLACStVEBtAjF5Xj8fOW9bU7R2PYeW3+SbEDU30Al3ULHn60L9fvNXHccrk1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=MKSrBppv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=54.211.126.101
Received: from iad-out-011.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-011.esa.us-east-1.outbound.mail-perimeter.amazon.com [54.211.126.101])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFD9606A324
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFD9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=MKSrBppv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794459508; x=1825995508;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zasZMfYNsTWpPANn91IKNSeSpGR3YYhnfco+yI8xjqM=;
  b=MKSrBppvjD6FQvppYz+lx0VRwKwSC0ujt2IYpfkfXrd+gKA2WkIYMdL0
   gc5WqcPp38YoGC7jtsfXfFgbSzcXKujHdBb23MaPlr0DyQNL97I6Wrq90
   2dLLNK0Ncxp56dZhvmWWxYAeJLZL/ep/yxNY9gszLlgHVuJ8Jsq68E/A8
   E3mT0uVg9aiUFT4ev1oto5yvorsobRGkNwsyJr8OlktRqCWKMy4ZfokU0
   UeOlPqZ5vUJGFZtft63zef/y3aP3IvlI73JExCqMh4x3QNrdf3MR/Vb2N
   qwHHFLiaL9AvmE5yPdzTA6lGGKISJOEM7HcEhoB5XPcZdrY7w/P3o5IRr
   w==;
X-CSE-ConnectionGUID: cU9KumNdS7SGifmqbVu2Yw==
X-CSE-MsgGUID: Hb3zYdLyR5CfkbWfGmol7g==
X-IronPort-AV: E=Sophos;i="6.27,209,1787011200"; 
   d="scan'208";a="31609533"
Received: from ip-10-4-7-229.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.7.229])
  by internal-iad-out-011.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 04:58:25 +0000
Received: from EX19MTAUEA002.ant.amazon.com [72.21.196.65:30651]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.18.132:2525] with esmtp (Farcaster)
 id 27812c00-fc59-4c11-b03a-8e3ef874e704; Thu, 12 Nov 2026 04:58:24 +0000 (UTC)
X-Farcaster-Flow-ID: 27812c00-fc59-4c11-b03a-8e3ef874e704
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 04:58:24 +0000
Received: from EX19EXOUEB002.ant.amazon.com (10.252.135.74) by
 EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Thu, 12 Nov 2026 04:58:24 +0000
Received: from BL2PR08CU001.outbound.protection.outlook.com (10.252.135.42) by
 EX19EXOUEB002.ant.amazon.com (10.252.135.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Thu, 12 Nov 2026 04:58:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q0dZs3X5XAfMchQHAYeEgf80sc9aIr/r3d04rUFZOZLCYVCmBhSKBnccuCaH35LFvXGweGfZoBwm7CebRTVaECxzi8ajsUowTe7luo6ZTyGxv+Oe+Zw6ys/68BHJnl5XDEd4XqqMu64KpIab+bPqet7odoWbUXnBjC+an+RVGxROySP8G5BHkadVWDzqOBrSIrIsm27SkZT5oiWcYREqqgTIa9g2kOc86XRK1Fj2YX2lakiycjdWdRb4/LWPLbRBtAxIwidIN+CAxYmu6+FuaDG1mBJkxkjc+vUPJa6vSCRWTXX1YjQ3dtmmwqRBLgZ0URpEVtm2ges/AC+M2GbLmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zasZMfYNsTWpPANn91IKNSeSpGR3YYhnfco+yI8xjqM=;
 b=CqGHS6X2lMItA4DYmBkhUIPSJxocJ6wZXKfk2c8txpa7aDKGaVkrVA7wpeTvLaVAk1lo0bUbdBsf33zBKVEPoVGsQRDBAH/nzQuDrf59CtheYLnE2o/kYUpaV9hA5i//Ock4DqX3B0AxA+yHY5UzaAwzd412MOaHB613PDzfDm5sGJsLVehFqAlgKvv8bWXA55BN9ri7jQNY2Sb9zzeuvjsOdMhKrbzLLwrVoT8mQfEhyF7uHsaE2RGpeT0b8Mxaz/6dHsW1JSx/s+4JbU8lj3ASD2DuLGc0tdzEYDrbHRJNPaMrABNUkU3g5Iw18cTJjKmspMYlFZd2u5U6e1RHXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by MW5PR18MB5068.namprd18.prod.outlook.com (2603:10b6:303:1cf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 04:58:07 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0592.009; Thu, 12 Nov 2026
 04:58:07 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, "Ryan
 Roberts" <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song
	<baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif
	<usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin"
	<hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, William Kucharski
	<william.kucharski@linux.dev>, Vishal Moola <vishal.moola@gmail.com>, "Alex
 Williamson" <alex@shazbot.org>, Peter Xu <peterx@redhat.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 4/4] mm/huge_memory: use the large-page PAT encoding for
 huge pfn mappings
Thread-Topic: [PATCH 4/4] mm/huge_memory: use the large-page PAT encoding for
 huge pfn mappings
Thread-Index: AQHdcmJoXcZZsP6Jtk6RNI0rE+R5kw==
Date: Thu, 12 Nov 2026 04:58:07 +0000
Message-ID: <BY3PR18MB47223FC764D8F207D0B4B21BC6702@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20261111140655.34281-1-farbere@amazon.com>
 <20261111140655.34281-5-farbere@amazon.com>
 <8c221ebf-ccc0-4541-bdc7-ae216d149dae@gmail.com>
In-Reply-To: <8c221ebf-ccc0-4541-bdc7-ae216d149dae@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|MW5PR18MB5068:EE_
x-ms-office365-filtering-correlation-id: e815098f-e143-4d08-e51e-08df40798ac7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|1800799024|366016|38070700021|10067099003|11063799006|4143699003|5023799004|261021121427099003|261009223027099003|261102123227099003|56012099006|261022075727099003|22082099003|18002099003;
x-microsoft-antispam-message-info: NFpbjkzHBpOl4ntw5Dc6CGTZL96JcsqJutLCRT/F4tuiCxK/EZbrZF/h8A7kIHo37gQVtzPtPgNK6RzR1PbmJF6a+e3NhWxCnGUh3FnsycEdqQ/IPXbcTVp+4TSTmPzXlzfA9UgaZGor1TEsEJ498ePPT+xIW3gwLzn15iQ2N3KOxHyASov7e86Lg22KPaxy9Zb8EQiPBD4HYArljGnpiJ0EHyk3xzYOWN37sUyZLAUIoyH3TV2uFRSfr6Odud1xE60jOCTc435NQmLIYX2vKoD/1xA8p9LAjMbI7+WSrJ8t6/SCi9+ZjFCgwQ+BWdyTDvOjZidxC1zfRAaxGvmn363b6fViNdSd8WiAjwAdklspX/AwjOOCiC+MjMDyHmH/NO5yld1UrFiW85dI/sQVEo7BqHafjZOCaIZwEzh21bQyK1YlJruaaGRJXcomt5rGneFwLELuoEGW384MFNeYKkO/2yieFRQ+YEqw5k7sXPrK3UZq0SahBEh0hiiRjSIVEZeD+q4Ti54P07jwAOMu51Fcx7Gxx3IGNCRgKW6uGHqyqb+WGiDy6LwUw/YqUqrgfH8pvr74YPdaviILhvaSclyxNlJ/R7jVpxqkI7uGgztP110HMXJNTlqcRTQAG5KLvzThwcGUqKbcqeXqMM0oE5znHOABAnHpCiv08tw+7YJbzg5oKDMN48VY8rUsuWpB6wHSR0lpUv84bc4B3ec1pzjeDtLAgnVCr/SXiFyqZ2I=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(1800799024)(366016)(38070700021)(10067099003)(11063799006)(4143699003)(5023799004)(261021121427099003)(261009223027099003)(261102123227099003)(56012099006)(261022075727099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFJlK1JhNjAwR2YrYkx2ZjNyUGFkS1VaRlZubWJSbWhLMnNoWEZRTW5kcStr?=
 =?utf-8?B?aVRLcHEyNGxIbUpoQ0V5bi9BTStZb0ZaYS80cFQ4Zno4UDdZdmYzU0p5SVB6?=
 =?utf-8?B?U0dzVjZnc0lRQysxTmZXaWdGanlMSW1kOXV3MEx0eVZRaVVrcTR0aUtlRVBn?=
 =?utf-8?B?a2ZNcE5KbnJYUGVTT0hVQmRSblhwTWlPSjJWaFVtU1hTSWp4RDJScGRrSVBK?=
 =?utf-8?B?T2Q3RnQ1Vk12c2dlRzNoVVM5MENvU2NTRFFnTEFXb3YzQnVvU0UxZTlTaTJP?=
 =?utf-8?B?eEdjWTJaQXF0MTdDWnZyWFNmeVA4NFlrRTlyQ2NrbVBmYkhLdkxIaFpzVE9M?=
 =?utf-8?B?bUJkb3M0K3AxMG1jTjJPbldJOXZKQzFPczkrTUR1MjQySXRPbkpyV0hqeTY2?=
 =?utf-8?B?T1N1V1kzWFArck8rNFN2TWFBcmdGdjVmcHZsQlRnNlkyZ3l1M2dRMzBFM2xh?=
 =?utf-8?B?VEdXM3VCWnVBZTN2OG1JaFo2Wnk5VEd6ZGZ3MjhPbjJBbm1ROXVRYmhxMmpl?=
 =?utf-8?B?R29zUFY1WEtqb0FzS1ZMYVowUWJoc0piVE0yVG8reDF6REFMVmVpRzJiY1ZX?=
 =?utf-8?B?VExDc1o2U202ayt2TUdDWWtQV3ljd0VzaHhHSEJjNXptRGtCQTNwVU9rSWNG?=
 =?utf-8?B?ZGtienBSMnpkYUxaSTdqMnNzZ2x6cE15REhQRUZxZUtjNGkzYklXTElFaU5p?=
 =?utf-8?B?Mk5IN3BvTzBldzVSMUlKemNXQ084WFlrbWhrNDFuWnFraTg1WDhpTDdVdWdi?=
 =?utf-8?B?eVByMSs2QW8xRDN1ajRUNDFYMkdWUDE1MmFhbzB5TE5OMkZ3RDdLbmpUcndY?=
 =?utf-8?B?L20yUHEvNU5xN2FDcDZBV3F2bU4yVktPMk5kTEdDS2hpUXNKWUdXaE5RVFdG?=
 =?utf-8?B?N3kzbEdZM0haRkJqK2k0Qm0xY2wwVThCTWdUUDJGNW5OVWNLd1NucGtTZmVo?=
 =?utf-8?B?UzAvaVppSDc2ZE9QVkNSOHNOYUc3WXVHbGJaYVFuVG05WVBzcjBUQTg0NmtU?=
 =?utf-8?B?QTJudkJqa2wrVVlMQjAvUUVzeTNkRTFXdjgzS0ZNNVZCWVljQVNvV3lLSHlP?=
 =?utf-8?B?OEN6dXR4ajA1RWxaVFoyd1pQc1E0MnB3czhZSytaT1JZYTFoS0Vxd1UrbUpU?=
 =?utf-8?B?d3V2RHZ2ZGhhN0loZnZualU5emJsNFVLU1RmYmpuRzNPK0RQU2xjZzhlT2RN?=
 =?utf-8?B?Q0tzMGZTTXNBZTVLZXZaZnlvaFlIaU50NHV1L3ZZUEgweEhQWEJhR1BvdVRz?=
 =?utf-8?B?YWF5YjNMOGRFUm85L2dSOFo4emJLV0YrdE55N1JMODdGV2EyWWtOOUtlNDdO?=
 =?utf-8?B?c084MDMvQ0dJMkJ3WTlCc096WXFWcUtVS09sRWR3TEticEZUckEwRm12bHVl?=
 =?utf-8?B?ajFXTFZZVmxhQmJ3WGVUV0R6clArNSs2WU80Y1pKdFlMUmw5Y2JnYkpZY1NJ?=
 =?utf-8?B?T0ZCU2dPSkEwUzZzS3pqbHBjNHZKeDhFRTZxaGlCaEl2TWU5M3ljWGhldTUy?=
 =?utf-8?B?aklrSWJrL2JHVkxzdnRGOFIzbU9seU0zMkVTMXQ1b3o1UE96NEZHN2Y0Qnh5?=
 =?utf-8?B?aC82Uyt4RXFlUG45UjdrRjQ1TElqcUJNa0Q0OHljSUg3ZUF2OENMUlY2OHNn?=
 =?utf-8?B?YWlpYkV3d21ucWRZdTYzcU1Bc1hLaWRLL3crTy90SXhraTJWQURWZVhaKzNQ?=
 =?utf-8?B?cHRHdko4aGVhemswM2xyVFhsRUxaSGVWTGtRNzRQVWVMTVJWU3hLYXhwZGUr?=
 =?utf-8?B?R3VMaDRsV1FwMlhpa256N3ZDZkpBS2FyczUyUVZqTHlYNEZZb3EzZ3BZWm5s?=
 =?utf-8?B?cDI0L3c2cDByeVQxT0w0OXYzWVAxS1grc1JzNGxMSEx4N09mRkg1L0UweG9M?=
 =?utf-8?B?RE9WRjZ0dVU0NnRYbEd6RkF5ZlN5SGFuTEw4RWljL3JuRUwrWHdKN2JDMEtz?=
 =?utf-8?B?K25OQ2s1dzlKTjhMNmZVY1hIZGpsYWtuRzRTdmZqdzQzcHhWdm1ENHhNNkJa?=
 =?utf-8?B?Zm96L1dNTVM0TlFuWUNhcUtQQnZzeEdBQXJvWkxqTjIyUitzSUR2aFZYbDRO?=
 =?utf-8?B?bFBOVXVDRk5ZakZLU1pmUm9Tcit4OWJ0RlJVMFAwVVI2YVRvRDlrS1ZGdk9W?=
 =?utf-8?B?aEl2Nkx2VG9MTGlQOEdKZjhFc0dJZVN3THY3Z1plRzdOeUtHOS9uQUk5eEZZ?=
 =?utf-8?B?KzRYY0RaWVNoeXRkUC9SYi9vQ2VkNVAzWEpPditEMm9paGhpWE5XT3ZKVE5Q?=
 =?utf-8?B?Z0U0dlpWYU9FSmd1L2ZRNlQ2SFIrWEpnQXhnSm1vWEp2WVpWcW9ieDdtQkRI?=
 =?utf-8?Q?JrO2Tcl9cAnewyv5Z+?=
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
X-Exchange-RoutingPolicyChecked: p3S1QKf8XOEVVYWpDzLYfV6ZnK4liuOXfxYBEkL+fL+n+UMTYh5bdg4uXBOCarcOcEsRnh7VWqMhmHYnP8W2dIURtmedidZEtWEAwUscI6X9qfWcdzHLbNWPp5YRCvEGHqETfceucinsYU6lLLkKKn1W0CVFxyGz16UJq22KTuH46Trmjn6FFhpxiz9SxfdJTkQ7osmtqd2Z47t6WvRic1mEQL5yxsW9rE8b5OZosWzgQ843R44o0EkkqnD9u4f2zEUx+O76i4NDlmQRujKUaHQ/dFS+1Sq5/YnuhN1YcbcsRwZC502nOve4R1ciR+zVRJGx8xxi5L9tHTY1mGhNtQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e815098f-e143-4d08-e51e-08df40798ac7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 04:58:07.2452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +avQFXJ+3XAxFptJ/U/NpY5jDn6h0BfATDsNb5QyEZXYI7ymjAaQXbTya2L830cUIb+CPgdKj823VNP0eFVqVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR18MB5068
X-OriginatorOrg: amazon.com

T24gMTEvMTEvMjYgNDo1NCBQTSwgSm9zZSBBLiBQZXJleiBkZSBBenBpbGxhZ2Egd3JvdGU6DQo+
IE9uIDExLzExLzI2IDM6MDYgUE0sIEVsaWF2IEZhcmJlciB3cm90ZToNCj4+IEEgbWVtdHlwZSB0
aGF0IG5lZWRzIHRoYXQgYml0LCB3cml0ZS10aHJvdWdoIG9yIHdyaXRlLXByb3RlY3RlZCwgbG9z
ZXMNCj4+IGl0OiB0aGUgY2FjaGUgbW9kZSBpbmRleCBvZiB0aGUgaHVnZSBlbnRyeSBkcm9wcyBm
cm9tIDQtNyB0byAwLTMsIHNvIGENCj4+IHdyaXRlLXRocm91Z2ggcmFuZ2UgaXMgbWFwcGVkIHdy
aXRlLWJhY2suDQo+IA0KPiBoZXJlIGNvbnRyYWRpY3RzIHRoZSBjb3ZlciBsZXR0ZXIsIHNob3Vs
ZG4ndCBpdCBzYXkgdGhlIHNhbWUgYXMgdGhlDQo+IGNvdmVyIGxldHRlciBzaW5jZSBpdHMgdGhl
IG9uZSByaWdodD8NCg0KVGhlIGNvdmVyIGxldHRlciBpcyB0aGUgY29ycmVjdCBvbmUsIHRoZSBj
b21taXQgbWVzc2FnZSBpcyB3cm9uZy4NCnBhdF9icF9pbml0KCkgcHV0cyBXVCBpbiBQQVQgc2xv
dCA3IGFuZCBXUCBpbiBzbG90IDUNCihhcmNoL3g4Ni9tbS9wYXQvbWVtdHlwZS5jKSwgc28gbG9z
aW5nIHRoZSBoaWdoIFBBVCBiaXQgZ2l2ZXMgNyAtPiAzLA0Kd2hpY2ggaXMgVUMsIGFuZCA1IC0+
IDEsIHdoaWNoIGlzIFdDLiBXcml0ZS1iYWNrIHdvdWxkIG5lZWQgc2xvdCA0LCB3aGljaA0Kbm90
aGluZyBhbGxvY2F0ZXMuIHYyIHNheXMgVUMgYW5kIFdDLg0KDQo+PiBGaXhlczogNjg1N2JlNWZl
Y2FlICgibW06IGludHJvZHVjZSBBUkNIX1NVUFBPUlRTX0hVR0VfUEZOTUFQIGFuZCBzcGVjaWFs
IGJpdHMgdG8gcG1kL3B1ZCIpDQo+IA0KPiBJIHRoaW5rIHRoYXQgNWNhZDQ2NWQ3ZmE2ICgibW06
IGFkZCB2bWZfaW5zZXJ0X3Bmbl9wbWQoKSIpIHdvdWxkIGZpdA0KPiBiZXR0ZXIsIElNSE8uDQoN
CkFncmVlZC4gVGhhdCBjb21taXQgYWxyZWFkeSBjYWxsZWQgdHJhY2tfcGZuX2luc2VydCgpIGFu
ZCB0aGVuIGJ1aWx0IHRoZQ0KZW50cnkgd2l0aCBwbWRfbWtodWdlKHBmbl9wbWQocGZuLCBwcm90
KSkgd2l0aG91dCBjb252ZXJ0aW5nIHRoZSBwZ3Byb3QsDQpzbyB0aGUgZGVmZWN0IHN0YXJ0cyB0
aGVyZS4gNjg1N2JlNWZlY2FlIG9ubHkgYWRkZWQgdGhlDQpBUkNIX1NVUFBPUlRTX0hVR0VfUEZO
TUFQIHBsdW1iaW5nLiB2MiB1c2VzIDVjYWQ0NjVkN2ZhNi4NCg0KLS0NClRoYW5rcywNCkVsaWF2
DQo=
