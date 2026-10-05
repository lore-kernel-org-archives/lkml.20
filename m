Received: from pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.1.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914CF3C0A13;
	Mon,  5 Oct 2026 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=44.246.1.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199048; cv=fail; b=SrJYaMctlQCjWaHH7s1+ZVKopBflmQPNdYs9kteoNc4RSaw4ErRUFrGoxYMrNFJp6VCjIWKmq6Qs/v0MWhRwYge4vyetcwIy/MXhjX1DdY9A9zLvdNAKdYAX1ksnnrWsNI5CMgxMPUDNEQM8nmzKMhpaSej8i84nCxA4JnB2F5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199048; c=relaxed/simple;
	bh=reGe6pVXLXvWG30d7ujt09hphqiGfI92MGUzCX93m3w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NjQq4/Eq45NeXjXR83KnN2S5UryBXPE+tHziKevxxlyO1yA1dCXgcK182SsY7e1VXvthtPNI3VVvCTs01ADyBLfA1p2S0H62/w/cwjeMJE+qgHyG/xL/6HwoWIll+hETDyEpaX4TnbFb0U0PjdrtK8BmcSRghQKzZiKVrubwALM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=pCqWn0cC; arc=fail smtp.client-ip=44.246.1.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="pCqWn0cC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199047; x=1822735047;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=reGe6pVXLXvWG30d7ujt09hphqiGfI92MGUzCX93m3w=;
  b=pCqWn0cC7dNx0rhtWVrEJ1WidS+uFmih3FOXzw7yKKD98jabdCdtsXqh
   O9h3ZFoRRoewiy8IluVqgYoz6rTsIRA3+IcAm9w3IOLUnkkHhuri0hkan
   eLSPHA4qn/4oegMrP11VuDCYCmvgXrHDPelYkbGdd7uOKqA64LgfQgUKz
   Jz6a/4WRcSaCp8Cv+mDemEWQGZjz6a4cYAJSoLRQRP5EItEIcGXThMsdr
   lnRvScZgspLJeSZMSjPbaoYv8H7VaLZM4uGi0ShiZ4jvoT3czlzrNXRm4
   n8R56XPbJElJV2rAump0Tln2s+V1s5C4yijIA3q68rA29xvJapYJp205x
   A==;
X-CSE-ConnectionGUID: NYVUSmDhSSCIBPCV91Onyw==
X-CSE-MsgGUID: ojHGjVxWRn6VhxkKcl2J7Q==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="30425026"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-002.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:17:24 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:5039]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.24.164:2525] with esmtp (Farcaster)
 id b7082918-dc67-41f5-afc9-3efa114db6cc; Mon, 5 Oct 2026 11:17:24 +0000 (UTC)
X-Farcaster-Flow-ID: b7082918-dc67-41f5-afc9-3efa114db6cc
Received: from EX19EXOUWA001.ant.amazon.com (10.250.64.209) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:17:24 +0000
Received: from SJ0PR08CU001.outbound.protection.outlook.com (10.250.64.168) by
 EX19EXOUWA001.ant.amazon.com (10.250.64.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Mon, 5 Oct 2026 11:17:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5Bc1o8UZ5fpXy+5fZOnUhZ1yf2taXpd9oRvo9GtsIjKjhqep8axB4jFuy8UY+k3uA9ZJlm4piDqNv+GiCBq7fhb4f8PSMbnkAj7X9yH4TQQSbrISyt04NZv554yqVnxvVqub9eSbpNbMADsipk8f/y509ZZM9495x0iiIXApY+r/91+2Cj6FCfxywlouhbxNgZkDelHNfYRLcvhHu/IG/GsWgumS74DCWKWWaxExYiYF4YUyB4Tw00ohssyeFnrAcYF1fgXcrSzroCJRiU1pO7rD+vCOW1PxAbUKe8SMipEQGpybCygyO6ajtt4tfvRI8Ch5uUaHMKp38GTt1Xl7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reGe6pVXLXvWG30d7ujt09hphqiGfI92MGUzCX93m3w=;
 b=IvLBB4CEfdvz/iS/ckhrw5AhC2udbfVt98OfP5YN/xh9Hn3yQHKcyt92nBD64q5l78DD5Ro5N1KibGxAglEwUAz35XCMZ9xXRp4/rji/K38QrHRelMepbIrpgYufl/12RxOTS7OV9tn+NdEk9gpL7oKZu2arDd2euZoEPzu7rHcO9n/c6zzL1SwFUuTt9Ep/QkDDpZaj7FpRnee7BNhw4kARxG0TXZSJSf8HDM7QE6yCIVyGeBHjFoZLB89oz98slD6oNiHyu31pCNTr1BKQ2+Amewegrj7AiXGYVHhk7IwDL3VUu4IW8W5I7e48Ll3LGS83xmYuC6Rzr/neDVir0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by SA1PR18MB539011.namprd18.prod.outlook.com (2603:10b6:806:51d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Mon, 5 Oct
 2026 11:17:22 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 11:17:22 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>,
	"Shenhar, Talel" <talel@amazon.com>, Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 3/8] irqchip/al-fic: keep the device_node instead of a
 cached name string
Thread-Topic: [PATCH v2 3/8] irqchip/al-fic: keep the device_node instead of a
 cached name string
Thread-Index: AQHdVLsXHi+q4Q9P/0uvshio6LrdIw==
Date: Mon, 5 Oct 2026 11:17:22 +0000
Message-ID: <BY3PR18MB47221B1A895DF607B6480576C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-4-farbere@amazon.com>
 <9f281f3c922c1b64a7a74a91e178990c798840e7.camel@rendec.net>
In-Reply-To: <9f281f3c922c1b64a7a74a91e178990c798840e7.camel@rendec.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|SA1PR18MB539011:EE_
x-ms-office365-filtering-correlation-id: 30c8d7b7-0d3e-4eb9-cfaa-08df22d23a2d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|4143699003|5023799004|11063799006|22082099003|18002099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info: DaYmEZpanE9TRnXNH+NO2iydcqmCJhs0Ic2r/Xtp96+Lg6nAxDe2Y7BlKsDwEaOhGeYDhJgdJnUFQ0ZmKjOBPQ4YtW7gBQ2J1k5KYi5tnPdnMH8G6zwC/bWsP+uWiOb8mmjQZLdfOPNbuQ09cXBfv+BHeMHy1vKWdtwwTSolHOCAlJXbvZ6PkdKy18ZqjuwzOhBMeGSh9osTSJYXI7KROXMbminAmgI0j2hLVZ13NEOOCLREeb3UO9i6xD0lryxUtsYavplwm9R+dchIoCE4iDnh4f3ha4UH/j8ACYJeYrMWkMzbMY9Rj185WJDBSrHNMHmyVUyj6xNYH1xFnbIhm9OCCNCHPjfIfeL2dNEyA8fU46OJt+F8W6i/cI8M+M6tNtuzzMLUh4axgUrQv/w7vsvFTy1XxbQDLYrwaMWs2uxJe69oPoE/7rKj+gVgvfJmXN4Y4t/sFAKfFnLKrsb0Cl2MeEnUSWawvgUVhtg7V0il7OjRlzU5bez2ptjiyA1jalmFYUZr1PY17JgoZcL/mREqIIqSirxx5X4Zh7z7keXFiHZybEG0otd7eFr9pDkE+6MRyo335A/TNyQ6+gxNpqrMk3j7paXQ5+NQ1E1nZbWdr8CPTHd1XXpf/pMO5iq4IH2djuTHRKBDGA4w8XAmvniS3k8Hwq6D/kaWpivCIaRquIrHrf5Kt4kSKzRPw9FcvqbwOvyRrRML5m5bI8dUImBjZHmnbvVtCqvcl00K2Lc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d01EdEYvSWkxYzZxRklGK3NJVm9FWTRQSHAvYTdhQzdLVE9DUFlXYU1nTy9Q?=
 =?utf-8?B?RG9GbzRxeHhUa2tUaGxCY1MxQ01IQVpCTFB5bHQwQ3ZXNWJRUHBTQW9nMi9r?=
 =?utf-8?B?aytEVzRUTmNFM09GRDY3bVVrUExueGptZzkrbkVtLzd3UUZmK1BpdzViUjc0?=
 =?utf-8?B?REJkZzNScmpFdWVmeG5Fb2dJckRXRG9tVjZ1TTVJZFNYRFpxeWhLU0NYRGUz?=
 =?utf-8?B?c0RFVzkwY0JvUUZocklETlFXa3hiUjhZYk5QZlltMWpYckNiZndUWGYyMVQv?=
 =?utf-8?B?T0dWV0YzdThzMU9Nd1p4ZXQvcndqcENCTXJTdEVmOVVzRmNucTgyYkdLbmlK?=
 =?utf-8?B?UkhTT3BWQWt0eUd1Sm5WZlJ0TlBUdTVadWYvK3FXUXBLVm8rTkE5WEJpYUlj?=
 =?utf-8?B?Ris4Ymtic002OUxaakdhd2xHREpuUGdPb0plM1hKUzUyR3krOTg5Mml3a0w5?=
 =?utf-8?B?eDV4LzZWTWtCVUJRQk1ZQ2grcStpcjR5MEVFSHh5SlJQdlE1WWIwRGtkMXd1?=
 =?utf-8?B?Mm1NU2RlOWJ5bGVZa1R6UlZLSVVZeVBqVC9QajFmN0wwZUZlVSs5RzNqNlg3?=
 =?utf-8?B?aFJzMEVlUkYvenoxS2wwSHNLUjJLTk15bFp4VFpQMGVQZjVNNHY1Rityb1Fx?=
 =?utf-8?B?cmhpdVhQNW41ZGlMZVVoMml1N3NKMllEdkRQU3B0cUY3OGxmOG1WMmIxOG83?=
 =?utf-8?B?NFAyK3JadURvazFnSW9JQWo4ZlRCZXRkVldQeWxYOElhNnhjQWxRdmZKWllo?=
 =?utf-8?B?THYxWkY0aDcxVWcxcGZUZmhWOHJEQWxRUXdZQVIzMXRZNTZPR08rdzQ1Z3BB?=
 =?utf-8?B?VFgxaitzeENpOHFza25xQkNlQm9ZU29kaGNMeHIvMS9jenUrNXZmSWVVVlRJ?=
 =?utf-8?B?dEV2SWJNSGYwQWVnMVEwMnA5cEpLSjlNZG5Xb1U5QXhQeEJFdWszbXFIbnR2?=
 =?utf-8?B?aDV2Ynk5aFB5SmNxY01waVZsSkN3b3ZnSU1qVDN2cUdVZkRkNkMxVnp6L1pa?=
 =?utf-8?B?NlJCdFJENjQ1cGIzUEJSbXN1UXhjWUd0Zm1maGVmaThjekx1VVMwMldwa1JJ?=
 =?utf-8?B?NjhUb0psQ3FWUTFUSTFkbUYwNEExY1A5bEgwNnJuT21Rd1ZqWFFUcGJjR1Nk?=
 =?utf-8?B?TmxKVm1VTmY2T3hPOHdrV2JnM24rWStXcFdUM24vVWFRd09hZ01BRUFyUXZU?=
 =?utf-8?B?bG1aVWJiTGtjWEtCODdpOE1ScHY2a2ljZzBZMDZBblltbEhGNGNycUc3d3RH?=
 =?utf-8?B?WmpjV0Q4SVROWlVmVElSWU1WSUhMVlQvME1URTRWR1JUUW5zSU1ld3NMZjM3?=
 =?utf-8?B?T1BLNmwzdkdzNnVHN0ZNRzR5Q1FBU2RPMzhEYlBOQ2dRTldMU20yb0xBL2tM?=
 =?utf-8?B?QlNyR0k0ZktqMnV6QW9WQXBYbFZyVGFGWEFSTEhwQXBLSlRuMDYxT3lnTUpO?=
 =?utf-8?B?bC9IZXA5TTZsSHdRSExjWnlPZ1p4ZEk4MnRkSjRrQkcxd3dtcEY1SDU5SXpL?=
 =?utf-8?B?YS9EUmpyQ3M2a2tJalovanpwUGFZLytNdmNYK1lFRGluUEsvRFZUbHVTU0Jw?=
 =?utf-8?B?dXZlbW8xSVVGYTIrK2pVWTVCZS8vM3NKTld4TFhYVk5vU0hyRkpvanNIUGlL?=
 =?utf-8?B?TzMvTDQwYytBZENVYmpReFZLZlV3N1ZZa2VzMzNDcFVnRVVZTG9wZ1d3cFBy?=
 =?utf-8?B?Q2oySUwvRE53YklybHAvc3h0Q3lMV05iTVZHZy9PMkJ6QnVpN3FUZyt6MjNZ?=
 =?utf-8?B?Mk1yQzhhaHlSZUNYdDhacjRrY01VZEQ0NmNqdktYZFRaVWw3QXBkNnQ3WUd1?=
 =?utf-8?B?M29BY3dUUDJsZURVWnQvNnhuWlFERmpFS2IwYXFhMXp4Uk41aE54MktCWE0y?=
 =?utf-8?B?UlFJckkxTEhHUXBxTDdHbzhUbUJJUk5uY3NiUWdpbWRSVkVXeXBYZytibXd3?=
 =?utf-8?B?enhGa0V5eXJ1MitmNDNnOXFTWXhxbFp6UHhGUjJDc2pOd2g5VkV6UUJNcHZB?=
 =?utf-8?B?ZWN4RkVwUmhvb2w0cDNCWFkzUlpXdXQ4U2VqRGo1Z3dEMWtnR3h6bENmenZ2?=
 =?utf-8?B?dHdaSUNXM21NSkFaUTQrMGlLekUyWkFMbDVhVU5ya3haQmVhNkRTcEdUVXpJ?=
 =?utf-8?B?SDFvQlB5ZEVHanFQYVZPNGRmV1A1TE15a3VRNG1lR3B5Rk1VWlphMFBsUDhr?=
 =?utf-8?B?enZTdUlUeU4rOWFkeFJKYWVVUEZrdnExSTRtZ1dPRkNCUzNLRDMwNjh0M2lq?=
 =?utf-8?B?ZDJKWjN3b0RZTXIxVGg0Z2RPRUh3cjBqaEgrZ0RBSk5la0pnZmJ4bC83R1NK?=
 =?utf-8?Q?ZxT74ESHUDTFIcxshm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Y6yLXm79lnGzbyF5yWEu5d7k3f6uIRvj7F0J+3S4/WNpEskTpN2QInRJwoRd9wzawsHu41Egqz+7/kzy/IzLJjenRyATPaREdGP5WUgRhvYwbBa7nRCeT4HZDlOIdb4GJlIQ9tsKxorjksUlvF1KwfMb79F0BUutfsdO0Rcqyrc3OQTMVvzOcqIie+qsFN7bVvcbaQPveCP1bHxdX0/vwh60VC+AhK/xNp2ofYf/+dJB0C/RhEPpRKJkdMiLKcOGew1Y0KW82X4TAga78p3OYTlU0WYaIPX4t1LhPS6hMPIj4Za9jKJpnW515W24buy8ccwkr6oC0y6j9dyPGIZ73A==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c8d7b7-0d3e-4eb9-cfaa-08df22d23a2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 11:17:22.4343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yuyWe5Y7asUuxeKzXJgAQcJOfqEoymLZ1fnkHF+2ghyg4y+r8/2NdAz7SyuL22xH7rLWmWsRh0a5AyiF1QseYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR18MB539011
X-OriginatorOrg: amazon.com

T24gU3VuLCAyMDI2LTEwLTA0IGF0IDE3OjQwICswMDAwLCBSYWR1IFJlbmRlYyB3cm90ZToNCj4g
T24gU3VuLCAyMDI2LTA5LTI3IGF0IDA4OjA2ICswMDAwLCBFbGlhdiBGYXJiZXIgd3JvdGU6DQo+
ID4gc3RydWN0IGFsX2ZpYyBjYWNoZWQgYSAiY29uc3QgY2hhciAqbmFtZSIgdGhhdCBhbF9maWNf
d2lyZV9pbml0KCkgcmVjZWl2ZWQNCj4gPiBhcyBhIHNlcGFyYXRlIGFyZ3VtZW50IGFuZCBzZXQg
ZnJvbSBub2RlLT5uYW1lLiBUaGF0IHN0cmluZyB3YXMgbmV2ZXIgb3duZWQNCj4gPiBieSB0aGUg
ZHJpdmVyOiBpdCBhbGlhc2VkIHN0b3JhZ2UgaW5zaWRlIHRoZSBkZXZpY2Vfbm9kZSBhbmQgc3Rh
eWVkIHZhbGlkDQo+ID4gb25seSBhcyBsb25nIGFzIHRoZSBub2RlIGRpZCwgeWV0IG5vdGhpbmcg
aW4gdGhlIHN0cnVjdCBoZWxkIHRoZSBub2RlIHRvDQo+ID4gZXhwcmVzcyB0aGF0IGRlcGVuZGVu
Y3kuIEtlZXAgdGhlIGRldmljZV9ub2RlIGluIHRoZSBzdHJ1Y3QgaW5zdGVhZDogaXQNCj4gPiBo
b2xkcyB0aGUgb3duaW5nIG9iamVjdCByYXRoZXIgdGhhbiBhIGJhcmUgcG9pbnRlciBpbnRvIGl0
LCBsZXRzIGVhY2ggc2l0ZQ0KPiA+IGRlcml2ZSB0aGUgbmFtZSBvbiBkZW1hbmQsIGFuZCBnaXZl
cyB0aGUgZHJpdmVyIHRoZSBub2RlIGl0IG5lZWRzIGluIHRoZQ0KPiA+IG5leHQgY2hhbmdlLCB3
aGljaCByZXF1ZXN0cyB0aGUgcGFyZW50IGludGVycnVwdCBieSB0aGUgbm9kZSdzIGZ1bGxfbmFt
ZS4NCj4NCj4gVGhhdCBtYWtlcyBzZW5zZS4gQnV0IGtlZXBpbmcgYSBwb2ludGVyIHRvIHRoZSB3
aG9sZSBzdHJ1Y3R1cmUgaW5zdGVhZA0KPiBvZiBhbGlhc2luZyBhIHBvaW50ZXIgaW5zaWRlIHRo
ZSBzdHJ1Y3R1cmUgbWFrZXMgbm8gYWRkaXRpb25hbA0KPiBndWFyYW50ZWVzIHcuci50LiB0aGUg
bGlmZXRpbWUgb2YgdGhhdCBzdHJ1Y3R1cmUsIGl0IGp1c3QgbWFrZXMgdGhlDQo+IGludGVudGlv
biBtb3JlIG9idmlvdXMuDQo+DQo+IFdoYXQgcHJldmVudHMgdGhlICJzdHJ1Y3QgZGV2aWNlX25v
ZGUiIGZyb20gZ29pbmcgYXdheSBhZnRlciB0aGUgaW5pdA0KPiBmdW5jdGlvbiByZXR1cm5zPyBJ
dCBjYW5ub3QgZ28gYXdheSBiZWZvcmUgaXQgcmV0dXJucyBiZWNhdXNlIHRoZSBpbml0DQo+IGZ1
bmN0aW9uIGlzIGNhbGxlZCBhcyBkZXNjLT5pcnFfaW5pdF9jYigpIGZyb20gb2ZfaXJxX2luaXQo
KSwgd2hpbGUNCj4gaG9sZGluZyBhIHJlZmVyZW5jZSB0byB0aGUgbm9kZS4gSSAqdGhpbmsqIHRo
ZSBhc3N1bXB0aW9uIHRoYXQgaXQgY2FuDQo+IG5ldmVyIGdvIGF3YXkgKGV2ZW4gYWZ0ZXIgdGhl
IGluaXQgZnVuY3Rpb24gcmV0dXJucykgaXMgY29ycmVjdCBiZWNhdXNlDQo+IHRoZSBjb2RlIGlu
IG9mX2lycV9pbml0KCkgc2VlbXMgdG8gZGVsaWJlcmF0ZWx5ICJsZWFrIiBhIHJlZmVyZW5jZSB0
bw0KPiB0aGUgbm9kZS4gQnV0IHRoaXMgaXMgbm90IGRvY3VtZW50ZWQgYW55d2hlcmUuIFNvIHBl
cmhhcHMgaXQncyB3b3J0aA0KPiBjYWxsaW5nIGl0IG91dCBhdCBsZWFzdCBpbiB0aGUgY29tbWl0
IG1lc3NhZ2UuDQo+DQo+IFJvYiwgeW91J3JlIGEgbWFpbnRhaW5lciBmb3IgZHJpdmVycy9vZi9p
cnEuYyBhbmQgaXQgbG9va3MgbGlrZSB5b3UNCj4gbWVyZ2VkIG1vc3QgKG9yIGFsbD8pIG9mIHRo
ZSByZWNlbnQgcGF0Y2hlcyB0byBpdC4gUGVyaGFwcyB5b3UgY2FuIGhlbHANCj4gdXMgYW5kIGV4
cGxhaW4gaG93IHRoaXMgaXMgc3VwcG9zZWQgdG8gd29yaz8NCg0KWW91IHJlYWQgaXQgcmlnaHQu
IG9mX2lycV9pbml0KCkgdGFrZXMgYSByZWZlcmVuY2Ugd2l0aCBvZl9ub2RlX2dldCgpDQpiZWZv
cmUgY2FsbGluZyB0aGUgaW5pdCBjYWxsYmFjaywgYW5kIG9uIGEgc3VjY2Vzc2Z1bCBpbml0IHRo
YXQNCnJlZmVyZW5jZSBpcyBuZXZlciBwdXQgLSB0aGUgb2ZfaW50Y19kZXNjIGlzIGZyZWVkIGJ1
dCBkZXNjLT5kZXYgaXMgbGVmdA0KcGlubmVkLiBPbiBhIGZhaWxlZCBpbml0IGl0IGlzIHB1dC4g
U28gdGhlIG5vZGUgaXMga2VwdCBhbGl2ZSBmb3IgdGhlDQpsaWZlIG9mIHRoZSBzeXN0ZW0gb25j
ZSBwcm9iZSBzdWNjZWVkcywgc2FtZSBhcyB5b3UgZGVzY3JpYmVkLg0KDQpJJ3ZlIGFkZGVkIHRo
YXQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlLCBhbmQgbWFkZSBjbGVhciB0aGlzIHBhdGNoIGlzIG5v
dA0KY2xvc2luZyBhIGxpZmV0aW1lIGJ1ZyAtIG5vZGUtPm5hbWUgd2FzIG5ldmVyIGFjdHVhbGx5
IGF0IHJpc2sgb2YNCmRhbmdsaW5nLCBzaW5jZSB0aGUgc3RvcmFnZSBpdCBwb2ludHMgaW50byBp
cyBwaW5uZWQgdGhlIHNhbWUgd2F5LiBUaGUNCnZhbHVlIG9mIGtlZXBpbmcgdGhlIGRldmljZV9u
b2RlIGlzIG1ha2luZyB0aGF0IGRlcGVuZGVuY3kgZXhwbGljaXQNCnJhdGhlciB0aGFuIGZpeGlu
ZyBzb21ldGhpbmcgYnJva2VuLg0KDQpJJ2xsIGxlYXZlIHRoZSBxdWVzdGlvbiBvZiB3aGV0aGVy
IHRoaXMgb3VnaHQgdG8gYmUgZG9jdW1lbnRlZCBpbg0Kb2ZfaXJxX2luaXQoKSBpdHNlbGYgdG8g
Um9iLg0KDQo+ID4gaXJxX2FsbG9jX2RvbWFpbl9nZW5lcmljX2NoaXBzKCkga2VlcHMgdGhlIHBv
aW50ZXIgaXQgaXMgZ2l2ZW4sIHNvIGl0IG5vdw0KPiA+IHVzZXMgbm9kZS0+ZnVsbF9uYW1lLg0K
Pg0KPiBuaXQ6IHNob3VsZCB0aGlzIHVzZSBvZl9ub2RlX2Z1bGxfbmFtZSgpIGluc3RlYWQ/IE5v
dCB0aGF0IGZpYy0+bm9kZQ0KPiBjYW4gYmUgbnVsbCwgYnV0IGlmIHRoZXJlIGlzIGFuIGFjY2Vz
c29yLCB3aHkgbm90IHVzZSBpdD8NCg0KRG9uZSwgaGVyZSBhbmQgaW4gcGF0Y2ggNCdzIHJlcXVl
c3RfaXJxKCkgY2FsbC4NCg0KQm90aCBjaGFuZ2VzIGFyZSBpbiB2Mywgd2hpY2ggSSB3aWxsIHBv
c3Qgc2hvcnRseS4NCg0KVGhhbmtzLA0KRWxpYXYNCg==
