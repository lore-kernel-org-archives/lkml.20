Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14683514766;
	Wed, 16 Sep 2026 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572696; cv=fail; b=s+agk6sCKkC3p6ij1EXankaiQRvyIu85V65yZR+Xx3aGQLvWu/YHMuSjVawQLeUKEUba8L3/+UTGgqc8X/oL7gn8O3OUZqcUKVbMEabGx/zDchOqrIrI1NOeN8qVFnQA4z8u5AR/SN2UauIl8RyOodviuLtToQHtpW/enLIP6wE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572696; c=relaxed/simple;
	bh=7ec1GjxzH5Z+sq+oIhfmm1Fg3TWkqRtlXsO0JTzPpfI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mriwVzUeyh/EYf1dm+yEUoQ7Z/e2oqC8yOxKsGpqo0JTyIQS49gafzFcH5NCPbR5dg/Vp1rvi754xem82yxcu9H6w1pFy1WbB5LOyc7hiF3AzxRBhNiNrvYLf3Tfp3P9xr/KfxcU6iqXfBGXvnKMQ1k2V7E8fAklxVBIt0teahU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dNgOafmh; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dNgOafmh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789572692; x=1821108692;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7ec1GjxzH5Z+sq+oIhfmm1Fg3TWkqRtlXsO0JTzPpfI=;
  b=dNgOafmh6thwdvv12hPcN6lxDPOuROxDjaqJ2y4pTXqACDuNZfFpHGSj
   mNuzQfUs1LN/yPcVYqT6wnjuJAQKAdwmHlkccbO3ippheqjT7WDOtsx6t
   RAQx5T8His+vYEpSWucR7jDIqPYhZLVuvzQ0t8utNORbFzTkdUIfyS1/A
   ngjQh1S2f9pKAuLMzY21vLa4HSAqeE0Yr4IxwycwG7/e+PCkMbwIeHeif
   joxakrKQpWzrvQFBxN1wntVCdGPeRZ/tL/uy3v6LKMtDhdP58fay+FCOL
   qxvYl7q2KtD6kzciXBDJOAkFala7r4Q/hw29GgfNgLcK66hQrydFJTpfx
   Q==;
X-CSE-ConnectionGUID: uY+V1UQWRX2RC5d9w72BVg==
X-CSE-MsgGUID: MDL9WjIXSzGSy0y9WmUp6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93824500"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93824500"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:31:27 -0700
X-CSE-ConnectionGUID: qDkMKsXyQoaz3JAX79cj1w==
X-CSE-MsgGUID: XpePFi9DSIOGuuyW/PYgnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="303264446"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 08:31:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:31:27 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 08:31:27 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.1) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 08:31:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A79EDm59bQzpmCyOQTAnkbKarGm0IAHQ4vTqu/u3XH0qWXDpzt9WgjVpfounYCeCjc8Y3qhwEyV6VYtg57mZ3pPMme9o74UUHIIwHhgpzpVr2hyswX8YZPZdH7O5BPPqW/gaz2gVXsiwfAJ7W7fGvMJObcPoPfiqh6ywcX0V+3CtTiYQg+b3rEoSV6zk/dV2ibZzK8BfYrTY0oiiO9ILXUVBG12Oeek++LSkICU0VrGeYwNUpGpjbqhhRlZtF2xExNiusnus+p+5csChNuHC/sE5saDCUbEDH4anNSGkn8AFCdqoRP9m/SnVEev3/BI/b4qbuwPNZVENKp1IBkwvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ec1GjxzH5Z+sq+oIhfmm1Fg3TWkqRtlXsO0JTzPpfI=;
 b=s/8HoFLHhe+if1j7ejFWBYgydgEAlvo7I3nBecg9TshzuBthpkFlhsd7ZXkMKpxAhN5+B72HB5OBYXuCRid80bfZtaXmrhaNKs7YX+Ifo+RhIOFlCmL189s5xagtwtPWfxBC+xrl7dDioS3GC7ETxj3Ez+YiV76bm+sVhOmBHwPpZkKhKMO8XzGzT3lcnq/fVFHpVE1WccUP0kQp9B4fYc4OLKq9YnFZUGkXmJIeWxLIXAA1oLRkFj+nuGVRVQZiCUkwFTX1Bz69GPRER1QI5YtWDm5bK+azvNElq5XMtjAxo72pZGWM4KL6pCZ8pMCaaz+x5NL42tqgDMnOenJDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SJ5PPF37792A6D2.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::820) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 15:31:19 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 15:31:19 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Myeonghun Pak <mhun512@gmail.com>, "linux-edac@vger.kernel.org"
	<linux-edac@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] EDAC/e752x: Use managed PCI device enablement
Thread-Topic: [PATCH 1/3] EDAC/e752x: Use managed PCI device enablement
Thread-Index: AQHdRLVSFTFdHm8OAEy6mNy/dKtMabbQacgAgADtQOA=
Date: Wed, 16 Sep 2026 15:31:18 +0000
Message-ID: <SJ1PR11MB6083DD32E4D2ECAB3209D7FCFCB92@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <20260915015519.83833-1-mhun512@gmail.com>
 <20260915015519.83833-2-mhun512@gmail.com>
 <20260916012046.GDaqnu7sIhsWbtLCOG@fat_crate.local>
In-Reply-To: <20260916012046.GDaqnu7sIhsWbtLCOG@fat_crate.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|SJ5PPF37792A6D2:EE_
x-ms-office365-filtering-correlation-id: d028dadb-f7fc-41e0-a0da-08df14078e0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|38070700021|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info: 88IKMfVHtPAFhRRWaowKXUOxXlWbM1QqfK4abePRNAzsTJVm6KhTeDsxiZOadj0VT0FeBx6bv3vvfxKqfnwMS22cLXXvzvwWhWX506TglUSz9flGg8si8Q5XFImLM6viOd6DUiSIo7v0wWGYzoVvG/IH0WtDsit9xqmxog2ALiqGscuvq/vag+pL9hJ7MG+GRecPzlhkQ/0SwuC6cNSzIyNVuHINEzHYDnmmktSvgiXOgvOKIZYchsQ2vLV0c9uP/bRd05Aqubk9MF7Y8+PEIk7lLOxKeLp8263hH7kjbbM/mwNbNkK5DNEj4jBNVKrXnzHe7tWUUq0GGvxvonwGlzHECUnI/axVfFK7KKs4K/pd7AzIlyHcrMx4t03MaF/2DZVAYUG29vlubmnddre6o0xhSOSizn1RPU1beYDGiuBHnlXcouFQioJ0TqozgFIAqbMa/B6H6cnlJ40FzvAp5JWH9b+/+F2BBc4whMU6wbUXYGkk7BWnRIDHg8+IYXAubxgVn4WWD7R7GQScT6nBZYvxLlVIK21MkkRHBAarLrTE/ULamdlgEvmzNQ2S+TqWTZIhEf4ZGoPfPujNn/UlDHx476wLFkTaWHWeCYsi1qc9vhGYa7ikGmoMG+EBMM71elX2fmyQOQ2w6pyZIsLin07hwvmiu5ECZTs6aI0fdkEfmYBWAgTRj2kaDyOOwc/nnZeWnpGOpLeo5mZLeaAqsuyAj7Vi6BAfU2vxTLAq5ts=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(38070700021)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akF6TjRYS21BWGZKQnVXYitsVWdoY0YzdmRKT0ZHWVNOZnRpK3Y3WThKVWxS?=
 =?utf-8?B?WjVZSU1Rb3QyUmpGWmJwM2dHdTV5R0FpSjhTSnJveWF4b2hhbHRTcHVzaGRU?=
 =?utf-8?B?SEhFRHlrdVNxL3drejJYT2RlaWJBZldnTmthMjN0MUZDanBCWEc0Y1JTck82?=
 =?utf-8?B?M2x4cGx3ZlRTcnZHYUZlbE5xMElEVnlVRzVEMVI0Y3dYZmNJSGNCWlczbnFx?=
 =?utf-8?B?anZlT1psZW8vdVQ1SU9uVW5TVUhXNWhCTkYvMTFUZ2hSQkpzZnFldFgyYjJE?=
 =?utf-8?B?UlQ0NENxc3dFZU11eGdBMmtjSEZKbmxUekxkQ0w2eVI1UFlQTFBpam05L1Zp?=
 =?utf-8?B?ZGdRUnlZWjNoV1NqNFRZNVV2MU5oSEI4bEtLVGFqZEdkYk81R3lZNDkyMllQ?=
 =?utf-8?B?L3kxamxYTGRtVmVKRTVGc0lDM3VSQ0RQVVQ1b1k2TlQ4TWVwR2ZpbUduYWZL?=
 =?utf-8?B?SWQrMWRENGdSL2pacUVSdk9HOUg0M0Qwdk0yaWUxdGpLc2NHOUFneCsxN1Fw?=
 =?utf-8?B?ZEhHSlJrOWV3cG12ZUg1YnVrUmVPM1ZJT2JPNWtYemxrRDcrazdLeTFuN3E3?=
 =?utf-8?B?OEtFYmU4Q3BkSmZHMXN2Z0xnSlJ3dDZhNGc2S2ZVLzdpUjNMRGRRY1F3elRl?=
 =?utf-8?B?WFNMdE1uYk1rOUdkaXFvYjJqdFdySjdrMnl4NThKWnJtSzlvTi9BdStXR0pm?=
 =?utf-8?B?aTl1L0U3TDBZdFphOS9WVzRGa3pCQkV6N25yQy82ZWNrbmQ5TEdBdTY0V0xz?=
 =?utf-8?B?ZVJLaVVkbk1aTDhoWEh1azZ6RDZhWWJKY2pEMG4ybVhqTWdIby9uQ1pObjFs?=
 =?utf-8?B?LzFsc3JiODhCTzBHb1hTLzNEdiswaFlSNHhpVm5qdW5yeGYyNksvdDIrWExu?=
 =?utf-8?B?emI1V3h0TGUrOXg5U3g5SFZubWk3Ynk2QWZMU3pQaTRFM0NtQklyTVV5TWdS?=
 =?utf-8?B?YUhUMVpoQmpOclEwZDVjTm1FMzkyOFY4MTBVSW83R25yL1RKcFp1Y1FzK2lt?=
 =?utf-8?B?VytuNVhtV1hyVk9wdnFSOGpXQi9GZVhGRmFZMStYR1lBL043U0tubDdoMGNB?=
 =?utf-8?B?aFYxTWg1YnNNY21pK04vRXJRdG5PcXpCMGM2VjdLOC93L0FoNTNMRHNtT2I5?=
 =?utf-8?B?YWJWMzc1N1BySUdyWHZqYlN6WkVRS2xzdzNyRXZkRFQ0eEZxZmE2WFlsczVI?=
 =?utf-8?B?Y3U0dWZYdkx6blVwSTlWODR4MnJCL0VYditybi9pT00vUGZGMVFESzhGL1dO?=
 =?utf-8?B?VHJMdmNubnFob3RlTms3d2E4WHVRRWczN29lakowU1BJQlFybDQ4UlR4U1d6?=
 =?utf-8?B?OFRYVnQ1ejdqVDRBYkVSbm5XSWRieHBBOGRoSStoZURMZXBDMGtuOU0yWStr?=
 =?utf-8?B?SGI1SXM4R2JCVXJJTnVkRkRHQTdpSTgrTkpITTJpVHBRUGk0c1JYRlRkZkF0?=
 =?utf-8?B?R04yR29RMlRTUi9NZmEwQUQyNzNvZjFSd0xYY0hoL1RhUHNQMGQzcE9zNEgy?=
 =?utf-8?B?blZVWjQ5ek9kTjFWcTRkMmR6TlVCMjlvRHROaHQvS2N1a2sxN1ltN2oxV0tk?=
 =?utf-8?B?WG9sWlhBVmdUR01BeTRxNjRmWFpzWVZDdktSdkpSdnFPSkVzQzR5Q2RNK0pn?=
 =?utf-8?B?THhkSFpBWTVMdEdKYW1uSm4xekZ4emlwYWdMQmZyTFQ2WHBubm5waWd0anJ2?=
 =?utf-8?B?c001WHVKL2VxQXFZcU1UbzZMZVYvaWtMSWwzeGFiQmkwNE52ZWE4NDdGd245?=
 =?utf-8?B?NUpKZDh3cStFaURmWmNJUXlIMUQ4bm9TWkMxTkdnU0JKT2JwQkUrNXFTWXZ5?=
 =?utf-8?B?emM1dW9aL2JXVklkbVNScFplRmpGT1p1cGRUaWF5RVY1bjlyTENoYmNUTTBH?=
 =?utf-8?B?VWQvblJpUWlUdUFCb1BjNHlWWjJ6cUt1Sk91UjNXL2FIZ2pjZGdqYXhmVFZa?=
 =?utf-8?B?VkwzcW9iaktiS1Q5MUFMRlcyTG1QT1kyT2tEeGtyYUpyVEswZ052Rzk4L0pu?=
 =?utf-8?B?cUF4VVVQR2V0RGlyaEFzUjNyVmJtYTJHVy9DSi9uTHBRNDVIY2NRY0ljWkFw?=
 =?utf-8?B?RkJVaGNFcWxrelltMjlsZFY2Z3l1S1Y4UGN4czFCYlRtUU5MT0JFUkplUTI5?=
 =?utf-8?B?Y0o0V2cvRUdEUWZTQzR3ZzFaM1ViNC84UmJOVmxyb21tZlJCaVl0OEN5Z05B?=
 =?utf-8?B?eDVrMThpckR6L0FHUHkwMFVZQW1jRUxRTWpUSzFIREl3ZEZGRmlXdERjcmFn?=
 =?utf-8?B?dUQ1UlJsbS9nMGh3VzBFOE5MUDVQZFN2T0JGUFpGS2ZEY25MTm9Sb24yOVE5?=
 =?utf-8?Q?Zch112XflaOWtO8kto?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: g02lPiArd6hp374wepqKSsbv+Zpx7/9Y18w10T1EqYZP2k2XuzDQa25bathO1IrSuZq0r/rhKaIVo/i5VZbfVSmo7NUh/GbfShf+qKo5ZS3G9bDah/6XTrghJvpICVoKSLOHQHIUOUusq0vIMg59H7kkgZkFqJXCpy5SHIB7iDeQDLClCGw01VJ1iHJ0/O2NTSX1c+Mo6Z2D0jOEAnZNi9nlSqxNPnPFjVxvl/n9VVduhONPVqvPOynR4wzmav4NXmHlbYjJNGP2X3FEtFSANWyKGX3wXQG6EYyFa5vzzrogaGOR7eR47UJkDuy1k5h2PRi4BUk91wOk1rK6SmfgXw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d028dadb-f7fc-41e0-a0da-08df14078e0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2026 15:31:19.0277
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bldyD62VbrnKWOwqp5p7aR5fkIq9Flr0om/RS2c0zEEWklXSOEYladcXGP1ZnAmlCa+0CMq8sAZeaVdtQoTbig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF37792A6D2
X-OriginatorOrg: intel.com

PiBUaGlzIG9uZSB0b28/DQo+DQo+IElmIG5vIG9iamVjdGlvbnMsIEknZCBvcnBoYW4gdGhlbSBh
bGwgYW5kIHN0b3AgdGFraW5nIHBhdGNoZXMgZm9yIHRoZW0uDQoNCkFncmVlZC4gRXZlbiBpZiBz
b21lb25lIGlzIHN0aWxsIHVzaW5nIHRoZXNlIG9sZCBzeXN0ZW1zLCB0aGV5IGFyZW4ndCBnb2lu
ZyB0byBiZSBydW5uaW5nIHY3Lngga2VybmVscyBvbiB0aGVtLg0KDQotVG9ueQ0K
