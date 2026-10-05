Received: from iad-out-015.esa.us-east-1.outbound.mail-perimeter.amazon.com (iad-out-015.esa.us-east-1.outbound.mail-perimeter.amazon.com [44.210.169.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761B04078E8;
	Mon,  5 Oct 2026 11:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=44.210.169.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791199253; cv=fail; b=FNwRppWfe3CdwT7CkGyWHAgeIwUD8zcepKVGulAmGFFktOkHUFRSIbtvTEi4JH0a9sAzsyq6lAi2gueFTQt/KWDw1jeH0FY+E/MM74F3Ej1DDlUxMSU/vzBjIOA4zbNWz5VNYe8oAlstwhcfjPqKgJpnhIaTElDNiXc44bxHjmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791199253; c=relaxed/simple;
	bh=jKEdl6J7QnVH9N3ueO8d6/7s7yUZzbOu+mMiQM23d5Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V/tcHvjGBBRkZ3jhWevMpFJAUkg7N0ZBle+B/1sQh6N4CfbK572nGsGwC6FpYFPQEgokUF+FrEoKNrhNRQ46biyVHaW+0yJluj6t+tUxQTrq6Q+AwhnZO2uHOBl/6JvsPLNREwTydnQEfXI6j1LB2a+VrSoA5ZgFGoBgaKj5g2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=phN9XyLe; arc=fail smtp.client-ip=44.210.169.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="phN9XyLe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1791199252; x=1822735252;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=jKEdl6J7QnVH9N3ueO8d6/7s7yUZzbOu+mMiQM23d5Y=;
  b=phN9XyLeyt3xJyi4ZWDbINWCYtFPDf46IgqmviOab4PchbIX3i4smShR
   y9qMtBzZq8q1ScyIEpj/tw2CqmfQNv/nID1FT3nOHMbYnKsNXtu5P28nE
   mwZsqsXVlsj9ONxmrryT7PIh8DtyV5reDSDGe8cjxXk0tYkNlfE5TRGV3
   xZWX6Gu+xwi9zCdeHQgpK+DGUg6u9R5euC7uvHVlYS/UT0riwdEFK2yGJ
   PG4xqPq8dnALBFHQVuCEnp+lJ9ne8bGKv66jTUO++hXPpm9NpMtpaYJVo
   7l7Y4N4N9DKo3dPWdzLelQWNsQz3e4FkIwp5unWzzE+y4xWdfwh0bnc+Y
   A==;
X-CSE-ConnectionGUID: svYSn+yiSzGXzGqvgl+Fww==
X-CSE-MsgGUID: IlffhollRtGw8hGLf/tpnA==
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="28317530"
Received: from ip-10-4-7-229.ec2.internal (HELO smtpout.naws.us-east-1.prod.farcaster.email.amazon.dev) ([10.4.7.229])
  by internal-iad-out-015.esa.us-east-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:20:49 +0000
Received: from EX19MTAUEC002.ant.amazon.com [52.94.133.130:12764]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.14.71:2525] with esmtp (Farcaster)
 id bbc7d5c7-622b-4e52-98fa-f312a25fc472; Mon, 5 Oct 2026 11:20:48 +0000 (UTC)
X-Farcaster-Flow-ID: bbc7d5c7-622b-4e52-98fa-f312a25fc472
Received: from EX19EXOUEA002.ant.amazon.com (10.252.134.207) by
 EX19MTAUEC002.ant.amazon.com (10.252.135.253) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:20:48 +0000
Received: from EX19EXOUEB001.ant.amazon.com (10.252.135.46) by
 EX19EXOUEA002.ant.amazon.com (10.252.134.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49;
 Mon, 5 Oct 2026 11:20:48 +0000
Received: from DM5PR08CU004.outbound.protection.outlook.com (10.252.135.199)
 by EX19EXOUEB001.ant.amazon.com (10.252.135.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.49
 via Frontend Transport; Mon, 5 Oct 2026 11:20:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nkDnb8fuJwXpqgYLeEFYsrjekPZo8Cib96K+7yvZ5I+x3HLc/oj2p2sC+I9+Y+VE1CKRm2GTzHzcrnB8bdXIvSFQItprwSpw7LOjOsPPUAFACXK9ygU2gBI6XSHETwxytdQPW7x8v1NlUyXvk/eMQX8mh/STaUmum5mblYkzLzxoSNQZTpen7i37JK+m1A7H3omrmrjN/WQSEs2zcNPuAuXLXSIQ7iduBHKttibDZv3u9oY2dMTnSXjH+RLfKEoXiYfr09LQLCjaq40mDpfz/ptYoEwdUUAZo7SoZxNCenGkeqMP4p1u/D07o3b0/knC3F+pUsuetQE1zlzhBqMC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKEdl6J7QnVH9N3ueO8d6/7s7yUZzbOu+mMiQM23d5Y=;
 b=e9M6Q8NWkQSe9cbqYCgaAYsIGk+jXu6BN+qEG9RaJLVdRJtQNu2FD3JOq8OE5uk23w9D9UgpVecNDlZLi+qpv8b6XYZZLtQwGSQZPDFt65SJ6zm+Pd6gIJfnhB1q/FLnFdnH0Ko1Ms/NJ/9iyD5Ct+R6mHEf9POTltbczbBOhojjrAPst3jCdo6Ln5ZqlP8JI+hV2TcTgHEQxvsnBYFC1pWqnPvpBAL7lnT89q1mGyVhoO8+qzoKfohjy/BsX4kGYF3tH43ZVLTWt59BKeRkYuumLP4A2U7oaBPO+KizI7wQOj8JJ1wbl/8U+IRXs4sFC9BhbBMN1sP8KkbMi73xxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.com; dmarc=pass action=none header.from=amazon.com;
 dkim=pass header.d=amazon.com; arc=none
Received: from BY3PR18MB4722.namprd18.prod.outlook.com (2603:10b6:a03:3c9::19)
 by DM3PPFA08CB310A.namprd18.prod.outlook.com (2603:10b6:f:fc00::6ba) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 11:20:43 +0000
Received: from BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219]) by BY3PR18MB4722.namprd18.prod.outlook.com
 ([fe80::e307:5f61:2694:b219%4]) with mapi id 15.21.0451.022; Mon, 5 Oct 2026
 11:20:43 +0000
From: "Farber, Eliav" <farbere@amazon.com>
To: Radu Rendec <radu@rendec.net>, Thomas Gleixner <tglx@kernel.org>,
	"Shenhar, Talel" <talel@amazon.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 8/8] irqchip/al-fic: add irq_set_affinity callback
Thread-Topic: [PATCH v2 8/8] irqchip/al-fic: add irq_set_affinity callback
Thread-Index: AQHdVLuPdJqLz0WHFk6i5z+MFtKgtg==
Date: Mon, 5 Oct 2026 11:20:43 +0000
Message-ID: <BY3PR18MB4722F4AFC8E300C4D01BE217C6962@BY3PR18MB4722.namprd18.prod.outlook.com>
References: <20260927080637.27285-1-farbere@amazon.com>
	 <20260927080637.27285-9-farbere@amazon.com>
 <c28806ad779b972c94b9dd89fb70ee64cefb63cc.camel@rendec.net>
In-Reply-To: <c28806ad779b972c94b9dd89fb70ee64cefb63cc.camel@rendec.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY3PR18MB4722:EE_|DM3PPFA08CB310A:EE_
x-ms-office365-filtering-correlation-id: 3fdc1240-9cce-400b-66e7-08df22d2b210
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|18002099003|22082099003|38070700021|4143699003|11063799006|10067099003|56012099006;
x-microsoft-antispam-message-info: 3fNX7X+z3mq/2OFJu8KyOl/yYjfmsFVOMrllMsuHlMzUJ/mLrFe4rt6kbfUjUq6DAi84/0g0w5rQq7nNcLkG8eVEQ5gEVnV3aZycDj3GZidtdYE4gihDW+SaEOGpf3dWOhxWv5kaUh0KfjgspeBpRq6OniYTlmmaEyQlf89hZM/F3X16e+q7uTKK1EaTKuSvy07oIpH4th9b7m0qTEGznfPHRQhQohdqpbRhyigpCxpLjmzQXgLJ9AXH35+v/C/Dye/6Fo1V7fvlnYjciuzmZvcL05Ml0Iw2LMkL9AY9eG96vko9yJi3kTdpW1ofQTpEZYLDakhLY9L/JSOnKFVvAGjN5nsi+zIP4iHEKGEsc32w6L1aMQv9da0yx1QdNuVi8/hpNwShDboevryoq2Osvs41BjkC1DRo/OqAlhOB3gJb4C5AUaFk9V/WEvPSBKhnAMWDcFxu0pUaEGetsLxsLdi/NjDLXb1EG2g/3Mc8MnI4L9hOQ1rqNLbM2a80zk8nkQ+amiz+PxCx/5eBhD2WabcZfIot4OfN4iKn++fNFLmHDauaPwgi8FjIqeFR7naZY6xmONMJwxBiN0COZj/KsJ3advv6OHXUrqp7WxD3R8x7ZikhXto46I8MNnzIaH4stwCm+0Kkaobie5bhcERP6HVQmmOgF6pruACRVA/HkbIxKaC8WwpAwz+HEWlPL8QagfoC8vZ6r2FgqIln0bhyntVBJkrZaJ/XSg2PrcH34hU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY3PR18MB4722.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(4143699003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VW9uNldaRmhEa1M5NDgrTVdSNE1DRjlVNHZZVGVMbXAyRmN2VEw3eXpHSWpE?=
 =?utf-8?B?d1RHMmpnN2ZuNXRUT3M0YmJPY2p1cVQxb2NWOU9tUW44ZDdEUDQ1WUZJdGVL?=
 =?utf-8?B?d0NUSURxZ1dFSUEwOVQ5VjRCUkZSclZ1SjNRdVA3Vzc5TmM2OXMrZWRHS1hi?=
 =?utf-8?B?bWZsdFB3VmpPbWhkd25UQS9MK0daU1NBS2ZZTnIzSXhRTGRjS01tRDh1VGs4?=
 =?utf-8?B?TExndHlhaUpJU0ZFZFp6dkIyUnM2MDdIam5hemFOL2o0OFNKNlgwTExwSVVL?=
 =?utf-8?B?ZEQ4Y1dWeTd4bU11Nk5KOHkwVW1yVnVNcVR4NHYrYjlGUVN1bXhtNWpScGdx?=
 =?utf-8?B?eDJES0sveGIyODJvUHh2OHB3eFBxVjh4ajcyaThxcDhzbmRuMWtWbmpKaEJu?=
 =?utf-8?B?SXBTTGFuZWExdUdRU0xMR0cvVmJvVFJreE1hbjFaTTA2Uy9DV0pkQWhXYWdt?=
 =?utf-8?B?eHpwUWg5OGoxUVJrUTh5NDNmMXhPQVhyS1JLUzkxamxqQmJkWlMwYzZwSmFo?=
 =?utf-8?B?bVFaVnB6Mlh0MVF0bUZOVVhFWERNenl2bXlGWCtFa2N4SkVySnhkZzhoek9t?=
 =?utf-8?B?dUVBUnJRZHkzai9EL2NLV2UxNkdjVDhXU2U4Z2JGdk5QMVJWWjR1NlgvRTRO?=
 =?utf-8?B?K3VpMko2ZGNLdFBGUzZraUZZSGJkVjVVbFp1NHhJeVRubWtpZ043RWNFemZt?=
 =?utf-8?B?eTZrcW5ZQVk2NmJkWDVWZTAzRVFxU2huaUxZTmN0VTloVXA3QmNrRXFlcnV0?=
 =?utf-8?B?Q3BDdTNkYTB1YkFLejlKd0d2ZGlBZ3kxRXFSeGR6cjB5aFJlQXZ1ZHU3R3dH?=
 =?utf-8?B?aEFqRjJQQ2R3U1RCMW5GZ2RZcmwzLzJjeGJLVFZJcThvVitMK0c5cDc5b3pS?=
 =?utf-8?B?cUc2bkVGMzJUVjFKQmRyVklmQlFna2pEQXBsaHlHMVF0ZlFNdDdmSEZvaDJr?=
 =?utf-8?B?Z1EyQ1Bza2pJUTRQVE92NGNJelQ4dHVETUNIanEzbVJhYWUwQTZiOFBXMHI1?=
 =?utf-8?B?dDdJU0xYSmx2TXl0VWJTcXNTMWFZbll0RE5OY1ZpS0xOVyt4dVZMZ00vSTFE?=
 =?utf-8?B?MEM1eDZjVWZqRU5qTGNRd3VEOUhMT1A4OXpyR0JHbXdOczYxQXlhaUlFK1dq?=
 =?utf-8?B?L3VERC9JSjNNd084UnpRS3dmNnFuaGxycXNXT2w4OEoxK0wzMnBSRVhyNTli?=
 =?utf-8?B?cXQvMmdTZnFlTUFNLzhvOW5WZzlXTUJsODd1UG50VXJBa2o5YUM1YWxjRDlo?=
 =?utf-8?B?ZE1NaVF2b25xR29Kc0hlS1lvZWpSYUdOYzZLV09WOWhtWFYyMzVVRGFYelZj?=
 =?utf-8?B?OW9tRHljOFRGSEE3QWZ6N3hRZSt2akhGcThBWXVQRFRNYmF4d1laZXhVY3Vm?=
 =?utf-8?B?U21HUUYxNkY2anZRVjluUC9KTHFrVHU4NnU4N3plbmloTU9pcEQ3NjJTVVJz?=
 =?utf-8?B?aThkYSsrUXZZSERIREsxNFNzQU11Z0NnY1dmVHJZbmQrVHVHdTFPbTJlT21T?=
 =?utf-8?B?YXFMbEc0U3FmbEJRd2JaeUlxUzJ1aXJPVXY2Y2JBMjJCYXJ2cnlTMXNjVnRz?=
 =?utf-8?B?bUxkdGxVZUhwZ3N0aksvbUJGUklmc2QxOFJrM2ViMTBwZElzZUtuZEVYMU9n?=
 =?utf-8?B?TnI5cG9OY2luc20rQm9TV1JrMWJuSlJFUklxZXprU25ZSEpvNzdLeHBEc05n?=
 =?utf-8?B?OE1GSEVLNjhLTjVtSXNhUW0wVjhYZkF2dEdDS1M5ZGg2TWI4ZFZOYTQ4VHRu?=
 =?utf-8?B?UGU1ZXVUN0lqamgyK3BCQmUvVG9VUy9qSlNvUUlLL0ZXaXFFQ3RGZWx3OXlt?=
 =?utf-8?B?SEh0cHdjN0xDUDh4b1B6Z2xhMzEwcUUxY0F3U0FJVkwvRmV6QW1ENGZ0aXNn?=
 =?utf-8?B?eHNHZnYrVTRJYnByUXlUYkpwT0tEUlE2dFdITjljUXRNcUo2Yk9maXdneno3?=
 =?utf-8?B?Tk4wMEI4NFJldnIzdm5kUzhOc1QzRFkxdzdNTlU5NXRzRXA5aHJLeHBLL0hq?=
 =?utf-8?B?bDlMVzFNWUVSZEs1YmZjR3B5VkdHQVNsaUhFQVN4eTE3RGRyWnpQTTJOclgy?=
 =?utf-8?B?anJCb1hoSnI2OUhOU3RUKyt2RWdPRUNQLzk3TkY1bFJBd0JJb09xMW00MFZX?=
 =?utf-8?B?ckxMT0tKNjNSemg4SmUzQ2lzUWQrT3hIUlU0YjB0YnFOQnVEeHlCeTZPbncx?=
 =?utf-8?B?WWFQYVE2aFZtdWpDVVlzeWN1UE8wT0xwcVJoUHJMSzVsWUlyZ25vRGVtMVFK?=
 =?utf-8?B?T2NZQ1ZwajFocjU2TDl5T0IyNjhLSVo4WHoyV2RBYjZDdWg4YStyd2FjbzF3?=
 =?utf-8?Q?T6CK97Bhr+FlczqAu5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: VDX5d2oPmU8cilBX1EkUB0WbuCBGhlFUN+M3vq6AQJHD83dfK9SI+8i+trDCO8CvY6Ll0+H+i9UY5dlK44E2nPBYIQQjm1g4C6S6V6fpwmo40llGgzyyESgsFYLCitQndvhzJamq5yIsD2Rqa7E+lj75cF97y+SM1jKjPRSJVFJrqRsydPdZH+JgbO01gUDBKFqQGPdV0JsX561y39XLl3y/T4S2RZCwcNLi4rUCzSMRtAGcLXq9cVaOCvImox7aSLJue/Yks7SAu49xuh1Jr9aBzz0K9QtejNp/Uyhb85aB3mxRINcC3+JwwbSyQkzMSj1o4yLBm8rE500bGiO2Xw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY3PR18MB4722.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fdc1240-9cce-400b-66e7-08df22d2b210
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 11:20:43.5237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3mgM74VKaLqqDjS1N5GmEH3M3vKbxfwfL/hXqDGwsue6xBdlFJRsCSZgciGE13mR+oe+QdwUAs5wbRuS4cxQ7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA08CB310A
X-OriginatorOrg: amazon.com

T24gU3VuLCAyMDI2LTEwLTA1IGF0IDAxOjI1ICswMDAwLCBSYWR1IFJlbmRlYyB3cm90ZToNCj4g
VGhpcyBpcyBhIGNvbW1vbiBwcm9ibGVtIHRvIGFsbCBtdWx0aXBsZXhpbmcgaXJxIGRyaXZlcnM7
IG5vdCBiZWNhdXNlDQo+IHRoZSBwYXJlbnQgaW50ZXJydXB0IGlzIHNoYXJlZCBidXQgYmVjYXVz
ZSBjaGFuZ2luZyB0aGUgYWZmaW5pdHkgb2Ygb25lDQo+IGNoaWxkIGludGVycnVwdCAoYnkgY2hh
bmdpbmcgdGhlIHBhcmVudCBpbnRlcnJ1cHQncyBhZmZpbml0eSB1bmRlciB0aGUNCj4gaG9vZCkg
d291bGQgaGF2ZSB0aGUgc2lkZSBlZmZlY3Qgb2YgY2hhbmdpbmcgdGhlIGFmZmluaXR5IG9mIGFs
bCBpdHMNCj4gc2libGluZ3MuDQo+DQo+IEkgdGhpbmsgdGhlIGNvcnJlY3QgYmVoYXZpb3IgaXMg
dG8gZmFpbCB3aXRoIC1FSU5WQUwgaW4gdGhpcyBjYXNlLg0KDQotRUlOVkFMIGlzIG5vdCB1c2Fi
bGUgaGVyZSBiZWNhdXNlIGl0IHJlc3RvcmVzIHRoZSBmYWlsdXJlIHRoaXMgcGF0Y2gNCmZpeGVz
LiBUaGUgY29uc3VtZXIgaXMgYXJtLWNtbi4gV2UgaGF2ZSBhIFNvQyB3aGVyZSBpdHMgaW50ZXJy
dXB0IGlzDQpyb3V0ZWQgdGhyb3VnaCBhIEZJQyBncm91cCBpbnN0ZWFkIG9mIGEgZGlyZWN0IEdJ
QyBTUEksIGFuZA0KZHJpdmVycy9wZXJmL2FybS1jbW4uYyBkb2VzDQoNCiAgICAgICAgZXJyID0g
aXJxX3NldF9hZmZpbml0eShpcnEsIGNwdW1hc2tfb2YoY21uLT5jcHUpKTsNCiAgICAgICAgaWYg
KGVycikNCiAgICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KDQphdCBwcm9iZSwgc28gd2l0aCBu
byAuaXJxX3NldF9hZmZpbml0eSBjYWxsYmFjayB0aGUgUE1VIGRvZXMgbm90IHByb2JlIGF0DQph
bGwuDQoNCj4gSWYgeW91IGluc2lzdCBvbiBoYXZpbmcgdGhlIGFiaWxpdHkgdG8gY2hhbmdlIHRo
ZSBjaGlsZCBpbnRlcnJ1cHRzJw0KPiBhZmZpbml0eSwgeW91IG1heSB3YW50IHRvIGxvb2sgYXQg
dGhpcyBwYXRjaCBhbmQgZG8gc29tZXRoaW5nIHNpbWlsYXI6DQo+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI1MTEyODIxMjA1NS4xNDA5MDkzLTQtcnJlbmRlY0ByZWRoYXQuY29tLw0K
DQpJIGltcGxlbWVudGVkIHRoYXQgZm9yIGFsLWZpYyBhbmQgdGVzdGVkIGl0IG9uIGhhcmR3YXJl
LiBJdCBzZWVtcyB0bw0Kd29yazogd2l0aCB0aGUgcGFyZW50IFNQSSBwaW5uZWQgdG8gb25lIENQ
VSBhbmQgdGhlIGNoaWxkJ3MgYWZmaW5pdHkgc2V0DQp0byBhbm90aGVyLCB0aGUgY2hpbGQgZGlz
cGF0Y2ggaXMgYWNjb3VudGVkIG9uIHRoZSB0YXJnZXQgQ1BVLCBvbmUNCmRpc3BhdGNoIHBlciBw
YXJlbnQgaW50ZXJydXB0LCBubyByZS1maXJlIHN0b3JtLg0KDQpXaGF0IHN0b3BzIG1lIGZyb20g
anVzdCBzZW5kaW5nIGl0IGlzIHRoYXQgaXQgY2hhbmdlcyB0aGUgaW50ZXJydXB0IHBhdGgNCmZv
ciBldmVyeSBjaGlsZCBvZiBldmVyeSBGSUMgaW5zdGFuY2UsIG5vdCBvbmx5IGZvciBhIGNoaWxk
IHRoYXQgYXNrcyBmb3INCmFmZmluaXR5LiAuaXJxX3ByZV9yZWRpcmVjdCBpcyBjYWxsZWQgYmVm
b3JlIHRoZSBhZmZpbml0eSBjaGVjaywgc28gaXQNCnJ1bnMgb24gZXZlcnkgZGlzcGF0Y2guIFRo
ZSBhY2sgdGhlcmVmb3JlIGhhcyB0byBsZWF2ZSB0aGUgZmxvdyBoYW5kbGVyDQphbmQgYmUgZG9u
ZSBpbiB0aGUgcGFyZW50IGNvbnRleHQgYWx3YXlzLCBhbmQgLmlycV9hY2sgaGFzIHRvIGJlY29t
ZSBhDQpub29wIHNvIGl0IGlzIG5vdCBkb25lIHR3aWNlLiBBIGxldmVsIGNvbmZpZ3VyZWQgZ3Jv
dXAgaGFzIHRvIGJlIG1hc2tlZA0KaW4gLmlycV9wcmVfcmVkaXJlY3QgYXMgd2VsbCwgYmVjYXVz
ZSB0aGUgRklDIHJlLWFzc2VydHMgdGhlIGNhdXNlIGJpdA0Kd2hpbGUgdGhlIHNvdXJjZSBpcyBz
dGlsbCBhc3NlcnRlZCwgc28gZm9yIHRob3NlIGdyb3VwcyB0aGUgbWFzayBtb3Zlcw0KaW50byB0
aGUgcGFyZW50IGNvbnRleHQgdG9vLiBUb2RheSBhbGwgb2YgdGhpcyBoYXBwZW5zIGluc2lkZQ0K
aGFuZGxlX2xldmVsX2lycSgpIGFuZCBoYW5kbGVfZWRnZV9pcnEoKSwgdW5kZXIgZGVzYy0+bG9j
ay4NCg0KRG8geW91IHN0aWxsIGNvbnNpZGVyIHRoYXQganVzdGlmaWVkIGZvciB0aGlzIGRyaXZl
ciwgZ2l2ZW4gdGhhdCB0aGUgb25seQ0KY2FsbGVyIG5lZWRpbmcgYW55dGhpbmcgaGVyZSBpcyBv
bmUgdGhhdCBqdXN0IG5lZWRzIHRoZSBjYWxsIG5vdCB0byBmYWlsPw0KDQpUaGFua3MsDQpFbGlh
dg0K
