Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=18.199.210.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794841795;
	b=jTD8N7K5Q8J+XfxKaFHIZLznxm1gxYFqeQ+2x1tmKfBHHEUKIirJyb54pbgIuYREbhcJ
	 /vCdHAlPa2xeTFzlvnrVLcgxY60K59HAKn/0r53XVvmEJu3jT6vj18NWEKSHJjWV1Upmg
	 T/BXIv4K6/6XGI1RuvyExlyf41DbiTXu5vyzc6FgMATw/M3N7q5q20Ge3yq8gzNV57g1K
	 kikia7yKEnuywP/s9tGnikKWUW2w0CczpZPJlacPLu92W+JRNfVeSkzZWohECeSJ8tqS4
	 eWvdFLY+Gc4VITYpI2gPWgajtuINzCt8KhV/+PyNZxhlZDj7A6vr82oDl93jth/JKYg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841795;
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
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
	bh=pe5SDj+q5JLN5G0/p5iZDUoREgXDcEOSEQDSx0g92qo=;
	b=kRP3V0X0b0zJ7OQd4d1YZ1wc72uQREcb1/wTGpSV1uONZ3lAaLUcy7XU/40VZRCwNv/s
	 JeQxITrCGzU9zdNeIJmPFs5jvPgwFQsRkvJZXGSp9sfqr3jX/9B3jrjHwvOTPPFMtGS9s
	 AlcEBkptJcgZh6FnwLQZ4PxZuJJpGC5Xa5YzyHWchimk9UkeJJIJRKvR5xK8Nb3zm5yl4
	 CxonLDkuk7umzRDxKKrl+U/Hd79h5YlwGLmEbdvzFw5LCOdjVeEGUUQ6FXUHKfQ44qzPt
	 euSBOlmxpq4HlOIh7iEr+ESd2pQqV8QRm9npe18FDC8swHJN2CqxE1NFRnFZHk5F2Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.de;
	spf=pass smtp.mailfrom=amazon.de;
	dkim=pass header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=lHL4Xwqq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=18.199.210.3
Received: from fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com (fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com [18.199.210.3])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A977606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A977606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.de header.i=@amazon.de header.a=rsa-sha256 header.s=amazoncorp2 header.b=lHL4Xwqq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1794841794; x=1826377794;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pe5SDj+q5JLN5G0/p5iZDUoREgXDcEOSEQDSx0g92qo=;
  b=lHL4XwqqSDlDycUAPFXf1ne8apxZFiHiBFXlTY6rr/0BaHXkR+1pEuba
   p8GPai8cOjzv3v4/RMBplEUIednZ81yyJY8dcCr/Vee1qmCYDFcZR7eVy
   jNh9V4GMJvl9ouSQG1HFeCPBI2hPaBZMcNlm9XM1wS9fIWjy1Fk5ucotE
   02EALmLSt5mQ9ax8AleHsxwtv+V+LBQ2b5wO+jRPoq9Fr+RlAgmeBwyup
   2rnLRLjIHOBzTk4GTTAdPe2Y1XSNDL/lqZNcmnd64A2UPyP5hspKTMbRa
   h5q45sbOr5e4b2TarIfxDCNYCbZXFpiwoJowcpklaZoFI2mOfumAt37xW
   Q==;
X-CSE-ConnectionGUID: XsMfDalOQhO4EaSbsOyQ/w==
X-CSE-MsgGUID: PegITcPiRCKPasDQgKGnNg==
X-IronPort-AV: E=Sophos;i="6.27,216,1787011200"; 
   d="scan'208";a="22872861"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-014.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 15:09:49 +0000
Received: from EX19MTAEUA002.ant.amazon.com [54.240.197.232:22363]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.23.156:2525] with esmtp (Farcaster)
 id 3c0300c2-96c1-4df4-8a17-064cf47012ad; Mon, 16 Nov 2026 15:09:49 +0000 (UTC)
X-Farcaster-Flow-ID: 3c0300c2-96c1-4df4-8a17-064cf47012ad
Received: from EX19EXOEUA001.ant.amazon.com (10.252.50.110) by
 EX19MTAEUA002.ant.amazon.com (10.252.50.126) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Mon, 16 Nov 2026 15:09:48 +0000
Received: from BEUP281CU002.outbound.protection.outlook.com (10.252.51.199) by
 EX19EXOEUA001.ant.amazon.com (10.252.50.110) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56
 via Frontend Transport; Mon, 16 Nov 2026 15:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfyo+R1xyuJ6ragWq/zqCk84hSIZSw9MC9rJg3+B4BWlWek4a/OehDbJ9vkoRZafSHyOobQOHCv0y41shv8MqtmDsOm61VMfIQ20FEnwyyIa2yscwAFZ6f70kmXl9dyEbIYaw+nN1jTaWqOgXcVMDSZrm2oe/DieEiWsIz21xEvaZSysa1FcZ0wVjhMiUzTo9S2HVV/fS6C6RRBJDGn0iZihuNN07gotRyp24DGs/4gv3mrqi7EqfpU8KrqR0VnoW6MU6xKnNdyMTJLo0Tx0oVJTsZkHLir7pxjJnBl3pqMnui8wwUq4syfIkZW3h2C8udHF9EZnIOdlMuFiBIQXPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pe5SDj+q5JLN5G0/p5iZDUoREgXDcEOSEQDSx0g92qo=;
 b=JaiH8Q724AW7EhLr6fPBOc3wY54ULZCOR3Dzv2DhNfxmP/h57hWVG/IRbMU4TfC7h0ESV1ldlu00EuX7JWPhDlqQbQMWCnKagYmJeEaEsrGeNlQDR1612mnDzU0UubIle6qvmVKTQcV/i82EHb4I0DcapDu6ogYKCU5K9aviQLAUCD/ICIL5RR/g7AO5AE1eWMliC0Z2nM9i+ttzYZSv/W3YCylrS4AqCeEMrlNtHIOSc2iJm3Za6KQkot0jtCfxlPOwDXMYs0hm/66v8UbrEjx4JIgMo7lfwu5nSWmWrdykNHfNGUm/h452KXoysm7+kwK2fLlSLbL3ihh1EM+5mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amazon.de; dmarc=pass action=none header.from=amazon.de;
 dkim=pass header.d=amazon.de; arc=none
Received: from FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:20d::13) by BEZP281MB2040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:5b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:09:47 +0000
Received: from FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7b1c:7a5d:c405:6c4d]) by FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
 ([fe80::7b1c:7a5d:c405:6c4d%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 15:09:47 +0000
From: "Graf (AWS), Alexander" <graf@amazon.de>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, "nh-open-source@amazon.com"
	<nh-open-source@amazon.com>, The AWS Nitro Enclaves Team
	<aws-nitro-enclaves-devel@amazon.com>
Subject: Re: [PATCH 00/19] nitro_enclaves: Fix enclave release, command
 retries and the CPU pool
Thread-Topic: [PATCH 00/19] nitro_enclaves: Fix enclave release, command
 retries and the CPU pool
Thread-Index: AQHdcePMUGB56zngVkijUsKb7u3v27cw1T+A
Date: Mon, 16 Nov 2026 15:09:46 +0000
Message-ID: <f6904070-0cae-4e90-9b45-90b54b388f28@amazon.com>
References: <cover.1794300000.git.graf@amazon.com>
In-Reply-To: <cover.1794300000.git.graf@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amazon.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRVP281MB744463:EE_|BEZP281MB2040:EE_
x-ms-office365-filtering-correlation-id: 1bd04cbc-9e1b-4dd5-ea4d-08df43f3a722
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|22082099003|18002099003|261009223027099003|3023799007|11063799006|56012099006|261028144727099003|261102124227099003|261102123227099003|261026140227099003|261026121527099003|261022105027099003|261021123027099003|261021121427099003|38070700021|10067099003;
x-microsoft-antispam-message-info: cFVBJvvbS7pyaP/DyFCX3e87UC9mC1qgxOeKgD0qLHbftFqsXa6cR+bQkISZWgRV2KmM76+Mn/S5HrqFohbXvUJXNMKIgmUukKwR6OBzcbSRyXZwS4uPMyUu0dlBTvnHAXpiehS0KNzR/UCBBzs1joBcGW/V9zeOWlK1WECBr4VkSYj0pjJrlCGowObelL3Jr7ymBA4rZDW57DP+YRtLZVRGoVaIasY8/Uq5LhE1+QFB7Nb0Kq80ex+hlNVtS2MDaVipokDYU0WGsby9lYejrWzzBMEwyTqqkwIf8xSN7dRoDYsdilJFiUOHLBXYT3uoE2yF+rHT6LlGzPh7kGP4/QI+WF9yAdd/tUB9rFwS9Bb6C2T/g/HjEqTWTWKk6xVq0hIOWtZEfIp87Swz/3JE9WgRTW2d0q2BQwApQyjE8ny/EFfzrNltB04f53FV82o4hOtF7l0yuScn1BkE4r8A1nVf79pYptAWDwwIuLw5JfsIb3v15/PXhfLhdQ+oscH70isBnkr4I5euxV2FDqnj33QLtgF2Z1mQyo/j6KNsyoRyrGXKp5R3lGJXTzTccHjBqviVVJogikdjwqD0zUpPK9gGjGV9SEObIm8kkmf4h7u8OGqU5Er7wIn7jEOjSnc3jBN/bKeZUDoOge1E4eH94AJc5IGSbXzIDo9SqE/PcJV7jM7XZWxftb4CCpUPEuDaGJFcc4eD6DX5kZaWE1tz2AirISYq1FFu43o+KUYpYok=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(22082099003)(18002099003)(261009223027099003)(3023799007)(11063799006)(56012099006)(261028144727099003)(261102124227099003)(261102123227099003)(261026140227099003)(261026121527099003)(261022105027099003)(261021123027099003)(261021121427099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eXFCaGQ4aXYyWDNDVEFoVkIyZVYwTnFQU0RTL0ZQSDl1VWNWdk9GdUdUeTVP?=
 =?utf-8?B?NktVd2xvOWxsbnZEZGJYWnhJYVBmVUJlU1dVQTlFZUFUekxvdFNCWE1FMzlw?=
 =?utf-8?B?NTlCN0tEV055MFJ3Z2RqWjBUS0sxSGdhekUrSXlhUjBYZVlFVFpxU2F6NmFp?=
 =?utf-8?B?OFduYThTU0RXT0FYcmxFQ2FlRVpCSW5iVDlDSWJBVG5ZWlo4U3Axbno4V2R4?=
 =?utf-8?B?ZTZWSGx0L2V3VmdUMWd1YTBkM2pwOG0zSStwUFQ4MUZCSW1DSnUvV2RCOFZi?=
 =?utf-8?B?cEtZQy9MeTFQYTcyaUJTM2swdDFNUGdYMjhBTnV5Qk5wVUs3d0x2aitkdzZR?=
 =?utf-8?B?L0xWZEE5eWJIVmlabUdhRGpQSFpsaEFEMzNYOG9iQ2pJb1lFZllzZ2xSVnRt?=
 =?utf-8?B?SmRBVVQwSWRUQ1lmNXZRelBVR0k4WWhXdmxGT1h5U1hCQVdVUHVSUHorelFC?=
 =?utf-8?B?MVFISXV1VGR1Skl2VmlUaHJXc2h3NlVCa1VGWkVmdGY3cXRaUWRoTitSUlMx?=
 =?utf-8?B?eVZIVWJFaGxwRlM0RnQrblZFQUZyYm5CeXByV1U0QnovYzNwZ1FGbGZVaEFG?=
 =?utf-8?B?cEdGekxrLzA5VU1WN3A1Mmx2U2NmdWNwRVFsMjRZTjJMMnEyOS9YWmJLZkFs?=
 =?utf-8?B?dUFwU1dMZ1lKUXVscUdkakZ3NmFDZUw5U0VpMUNmVVNjSThSOE1yc2JSUTVB?=
 =?utf-8?B?MjIrNzZXQjR1UHFKdzNzWHpMV1NLWEVLUnREbUE4Yk9YZWlpV3JiMUpxSGhO?=
 =?utf-8?B?OWhxUUk3cGdxTVlQZ2Q1N2s4ck9sYzkzK1VaU3Q5TDR5QWFtYkVwTXI0bFQv?=
 =?utf-8?B?WW5jL1czSDVjNkg1dk1mQnphbndhNmNvbVBhR3ZIUHlja0hacXI3M2lqOWd4?=
 =?utf-8?B?ZE9TOURhdTZqZHlWMkRTTzc2VGZvcWZrTWYvaFAwME9EOS92MG5ETG9VZVRr?=
 =?utf-8?B?SEhGN1lFYjh4MU42bXkydkFteitkazRoSDdKdFhDeHhFa2liRncvWUptZmVB?=
 =?utf-8?B?Q0I5ajk1dXJpSURPMjBwSEEraWtYNlJiTXdWazdWU2xGeHhQZzBCY0xyN2RG?=
 =?utf-8?B?UjRseFljbVlYTTJXZVlaeXZJWGVyRSthZUxDYlY2MW5CY1pUMnBoN2VteUdv?=
 =?utf-8?B?UDN6MjhuSUZVZXgrQVltQmdGQ1BYK0ptWHFDN1RsTER2VTBDeDJEc2E4dnJ0?=
 =?utf-8?B?amhocGRTUkZ4WUFtM0NJZVN3WXFiYTNvR3NoTU5KZ2FzTnJDZFlnaEJjMzZJ?=
 =?utf-8?B?Zmk2TExjY1poMkRKSHFrQ2VsaGZNTzdrb0VWZzM2ZjdpSnNqNXIxekdsNlhS?=
 =?utf-8?B?WWlHcEtCSm9RQkpJODRSVHo5bjNGMjFLVHVRSWlkTlhLUzlPVWlkSUY4aXhu?=
 =?utf-8?B?dHZpZktqUEJNRXBXTkZlYWhmbU1ibW4yY3VIVkZZYjlyZGt3dDhJMHp4K3JB?=
 =?utf-8?B?S1U4akQzdmJEUWJBblpHcUlEOWFwa0t0R3NNaUcxK2MyTzhmUHdpbWJIM0Vs?=
 =?utf-8?B?c0pYdWxyUDdSR3FsOUlsYTJNeXhRRVVWUmpPMW4vK1JvQ2g4dFlKTk8wdThr?=
 =?utf-8?B?ZWlHTTVKUG1KNk84SlE0aDNVRVBWQnJFUGgrSjh6d3hEQWpSN2JsNzJpNDAz?=
 =?utf-8?B?b3liWjdqZERqVGFYbVIwYWdFQzhmM2t1WStFa3VibEQ2NE9ONHZVR1NOM0xM?=
 =?utf-8?B?WHFYRFRRVUJJZ212cU0vTWMvYUdqTWhPNzJPSUJTdUZmUTBXL01rc1ZPaENS?=
 =?utf-8?B?WDVPanVlbE04VVk3MmtnNkhnSW1TNzhtUjdJQkFWYk9lNitoR1FCMm1waks1?=
 =?utf-8?B?aERRdnViVG1VZTcyNXZEcUFmNVh1MjNEMHIyNVQvYmVmNGloWE5McmpLR2xm?=
 =?utf-8?B?bTMrSXB6emlPcnBOMzNmOEJHSWJWUlBISmFaTjFnTTZNWVg0cDBvVVhHajhl?=
 =?utf-8?B?elpyREVGdkZ3NWdyaWp0WGVXbDV3YzBVck1BcllUM09Mb3d1SGFnR21XS3Zz?=
 =?utf-8?B?bi9uZ2NMenROYndXd0NMZVlsQnBoSTRLTGRyc0NZb1o0NWh5R1NDb1o3cHc0?=
 =?utf-8?B?aGhxR1JDVGtjTlp4QnJPWlFJWjdDeHorSlorREpkb0NwaXRIZEJTMUk0T242?=
 =?utf-8?B?T3ZOalh1a3ZUVFlZZjRRQ2xEdFMxNjVkUi9JRkJmWlVhMTVsRDdwb2N0Lzkz?=
 =?utf-8?B?NFNlZW5sSzgrNFhRUUsybWdVbzhLSy9BcUpLRGVSSHdSWERHd2ZsL1lrcWtP?=
 =?utf-8?B?QkZtazQ3OVJVS1NqYjZaRi8wZkFLaXo2WWpTQWs0OU9EUnU5YnVxcU10MkIy?=
 =?utf-8?Q?xm1GZn0lDNz1rQoBi1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <09C86CA386D23E43BE1CAB4857D260F0@DEUP281.PROD.OUTLOOK.COM>
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
X-Exchange-RoutingPolicyChecked: 34I+ZwWtAHPR8mwBMeXu6YosMg+ZEY53t01Bvnt5wWDB9ll/2heZNa/ZvhPqjKXqEPN9fqv9y3QTvy8Axo6ChDng4HBs6nZAJr2JK7ZNdbx0HlhnFeQpNhpnOyUAwyLHM5yQYVpK3wpTe+yCDd7Zz6oV335YmHoFNl6Ooxht/E9kiO3zr5Kb93wK/Q6x7x/UTqdjQjg3vqGzvJ5whujbkKqU6zAH7/TsTcLb4ov56UX8hQ9PFv99AhwQGeH8riX3F6WuBZM8a8kqFfYvN/ALyONW/O3i6X4WVK31SWmZmM9b00vyjQB+bKP5KOAWvNK6/RbH9uDBVCeot1WeaCTAKA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FRVP281MB744463.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bd04cbc-9e1b-4dd5-ea4d-08df43f3a722
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2026 15:09:46.9271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5280104a-472d-4538-9ccf-1e1d0efe8b1b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ciGJ8IJo42eEJwmMW/T34PkdOeRjXb9e7zZOZSRNlv97ri4tEMWb9VgVkwk6J3Jg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB2040
X-OriginatorOrg: amazon.de

DQpPbiAxMS4xMS4yNiAxNDo0OSwgQWxleGFuZGVyIEdyYWYgd3JvdGU6DQo+IFdoaWxlIHdvcmtp
bmcgd2l0aCBBSSBvbiB0aGUgbml0cm9fZW5jbGF2ZXMgZHJpdmVyLCBpdCBzdHVtYmxlZCBvdmVy
IGEgZmV3DQo+IGlzc3VlcyBpbiB0aGUgY29kZS4gTm9uZSBvZiB0aGVtIGFyZSBvdXQgb2YgdGhl
IG9yZGluYXJ5LCBidXQgdGhleSBhbGwgZml4DQo+IGxlZ2l0IGNvcm5lciBjYXNlcyB0aGF0IGFy
ZSBiZXR0ZXIgdG8gaGF2ZSBmaXhlZCB1cHN0cmVhbS4NCj4NCj4gV2hpbGUgYXQgaXQsIEkgYWxz
byByZWFsaXplZCB0aGF0IHRoZSBNQUlOVEFJTkVSUyBmaWxlIGlzIG91dGRhdGVkLg0KPiBBbGV4
YW5kcnUgQ2lvYm90YXJ1IG5vIGxvbmdlciB3b3JrcyBvbiBOaXRybyBFbmNsYXZlcy4gSSdtIHRh
a2luZyBvdmVyDQo+IHRoZSBtYWludGFpbmVyIHJvbGUgaW5zdGVhZC4NCg0KDQpHcmVnLA0KDQpB
cmUgeW91IGdvaW5nIHRvIHRha2UgdGhlc2UgZml4ZXMgdGhyb3VnaCB5b3VyIG1pc2MgdHJlZT8N
Cg0KDQpUaGFua3MhDQoNCkFsZXgNCg0KDQo+DQo+IEFsZXgNCj4NCj4gQWxleGFuZGVyIEdyYWYg
KDE5KToNCj4gICAgbml0cm9fZW5jbGF2ZXM6IFJlbGVhc2UgdGhlIHJlZmVyZW5jZSBvbiBhIHJl
amVjdGVkIHJlZ2lvbiBwYWdlDQo+ICAgIG5pdHJvX2VuY2xhdmVzOiBTcGxpdCBmcmVlaW5nIHRo
ZSBzbG90IGZyb20gZnJlZWluZyB0aGUgZW5jbGF2ZQ0KPiAgICBuaXRyb19lbmNsYXZlczogSWdu
b3JlIHRoZSByZXBseSBvZiBhIGZhaWxlZCBzbG90IGluZm8gY29tbWFuZA0KPiAgICBuaXRyb19l
bmNsYXZlczogUmV0cnkgYSBjb21tYW5kIHRoZSBkZXZpY2UgYXNrcyB1cyB0byByZXRyeQ0KPiAg
ICBuaXRyb19lbmNsYXZlczogU3RvcCBzZW5kaW5nIGNvbW1hbmRzIHRvIGEgYnJva2VuIGRldmlj
ZQ0KPiAgICBuaXRyb19lbmNsYXZlczogU2V0IHVwIHRoZSBkZXZpY2Ugc3RhdGUgYmVmb3JlIHJl
cXVlc3RpbmcgaXRzDQo+ICAgICAgaW50ZXJydXB0cw0KPiAgICBuaXRyb19lbmNsYXZlczogV2Fp
dCBmb3IgZmlsZSBvcGVyYXRpb25zIGJlZm9yZSB1bmJpbmRpbmcgdGhlIFBDSQ0KPiAgICAgIGRl
dmljZQ0KPiAgICBuaXRyb19lbmNsYXZlczogTGV0IHRoZSByZWdpb24gdHJhY2tpbmcgYXJyYXlz
IGZhbGwgYmFjayB0byB2bWFsbG9jDQo+ICAgIG5pdHJvX2VuY2xhdmVzOiBEbyBub3QgcmV0dXJu
IGVuY2xhdmUgdGhyZWFkcyB0byBhIHJlcGxhY2VkIENQVSBwb29sDQo+ICAgIG5pdHJvX2VuY2xh
dmVzOiBEbyBub3QgcmVwb3J0IGEgdG9ybiBkb3duIENQVSBwb29sIGFzIHNldA0KPiAgICBuaXRy
b19lbmNsYXZlczogS2VlcCB0aGUgQ1BVIHBvb2wgd2hlbiB0aGUgbmV3IENQVSBsaXN0IGRvZXMg
bm90IHBhcnNlDQo+ICAgIG5pdHJvX2VuY2xhdmVzOiBQdXQgdGhlIENQVSBwb29sIGJhY2sgd2hl
biB0aGUgbmV3IENQVSBsaXN0IGlzIHJlZnVzZWQNCj4gICAgbml0cm9fZW5jbGF2ZXM6IEluaXRp
YWxpc2UgdGhlIENQVSBwb29sIG11dGV4IHN0YXRpY2FsbHkNCj4gICAgbml0cm9fZW5jbGF2ZXM6
IEJ1aWxkIHRoZSBib290LXRpbWUgQ1BVIHBvb2wgb25jZSB0aGUgQ1BVcyBhcmUgb25saW5lDQo+
ICAgIG5pdHJvX2VuY2xhdmVzOiBTZXQgdXAgdGhlIENQVSBwb29sIHVuZGVyIHRoZSBDUFUgaG90
cGx1ZyByZWFkIGxvY2sNCj4gICAgbml0cm9fZW5jbGF2ZXM6IExldCAzMi1iaXQgcHJvY2Vzc2Vz
IHVzZSB0aGUgaW9jdGwgaW50ZXJmYWNlDQo+ICAgIG5pdHJvX2VuY2xhdmVzOiBJbmRleCBDUFUg
cG9vbCBjb3JlcyBieSBzaWJsaW5nIG1hc2sNCj4gICAgbml0cm9fZW5jbGF2ZXM6IFRpbWUgdGhl
IHdhaXQgZm9yIHRoZSBkZXZpY2UgdG8gdHVybiBvZmYgYnkgdGhlIGNsb2NrDQo+ICAgIE1BSU5U
QUlORVJTOiBUYWtlIG92ZXIgdGhlIE5pdHJvIEVuY2xhdmVzIGRyaXZlcg0KPg0KPiAgIE1BSU5U
QUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstDQo+ICAgZHJpdmVy
cy92aXJ0L25pdHJvX2VuY2xhdmVzL25lX21pc2NfZGV2LmMgfCA2NTggKysrKysrKysrKysrKysr
LS0tLS0tLQ0KPiAgIGRyaXZlcnMvdmlydC9uaXRyb19lbmNsYXZlcy9uZV9taXNjX2Rldi5oIHwg
IDI0ICstDQo+ICAgZHJpdmVycy92aXJ0L25pdHJvX2VuY2xhdmVzL25lX3BjaV9kZXYuYyAgfCAy
MzYgKysrKysrKy0NCj4gICBkcml2ZXJzL3ZpcnQvbml0cm9fZW5jbGF2ZXMvbmVfcGNpX2Rldi5o
ICB8ICAgNCArDQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCA2ODggaW5zZXJ0aW9ucygrKSwgMjM2IGRl
bGV0aW9ucygtKQ0KPg0KPg0KPiBiYXNlLWNvbW1pdDogNjYyOGU3ZDRjNmIyNWM4ZDE4ZjEzNDVl
M2EyMGQyMTgyOWFhZTdlNA==
