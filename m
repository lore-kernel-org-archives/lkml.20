Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793915740;
	b=U7aBa5HeVFB845F2fDdFHX2wWJ0El0jKllvy1kypT7JdTC22N3+j9vX478nACUruWoOK
	 xO8eyoXxtTRL7R2U6c8XB2GpT9sN5vSkL0DqEs1FJECF3JW9ll9/X8cl3us5Ke/FwkgXB
	 f9YkAgCAjOFQJx1N0Zck7awcWI50KOUx96BAu4D5gW6o1X9xo18vubb8/IA9+908MZJaA
	 MfIYunJ7HypQ2VKf0FwKcgcvBRwAonS2DZo7Iqay2LNoq6m93s15WrFNyvfvm7MaZCUVJ
	 Ck3/9ZqYGPZIp0JAhMz26uj36z4aAIvkxK3NqTt7huxcczRYOG7JNuSF9dsPpAd9Vlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-HPE-SCL:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LO4xhcL6US3RgbQj4QaT0KdS2J0RA+tRGfcdnnw+QwQ=;
	b=Y/Ze409NndJZS2zRfwVc+NPPhaYhAqq8Zb5y7O7ZmqltDwdb58QsamCzZ5PzD7q619c/
	 AHNwfk62pYLcVUEeeLr2zlJCIzH0wG0E1ZLCDTWczPSCD5pWhXH2zVhEV7XAj8yLyypAG
	 bBB6E3S4xZvhZCSgLu9xfmlHvFfd3PT/YgT03Mg7s5sbMXU2mxto6GPwvTfZl5desOveN
	 M+0WNcXix8jKGv3HnpY7008sbXIT2jyENN8XtImdsARuS6w9XhdnzkIu4IafYes5wMzKn
	 9h0W2W+XxVI5elVtYccP7fR1LJUa1WTI6F3peE0mOLFXXeT+7GTf8B+7zEr9+Xjx3sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hpe.com;
	spf=pass smtp.mailfrom=hpe.com;
	dkim=pass header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=oGQShREp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.143.35
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E3D606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5E3D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hpe.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hpe.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=oGQShREp
Received: from pps.filterd (m0148664.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L8i0s1072808;
	Thu, 5 Nov 2026 21:55:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps0720; bh=LO4xhcL6US3RgbQj4QaT0KdS
	2J0RA+tRGfcdnnw+QwQ=; b=oGQShREpUMF87tnMB01AKdpNbvEmxxSF39qDcRJ1
	aZsCNci5V3dI39dAjZgYXrGkt/sNhfWIB6NpMYkHWzWzbg6+CBGBvdALFsFs3wta
	LY2iZvHTPT8s9HBjv12OCa22tXy869tkGymH9l82VGOJ5EzQZLtm2WzZ4b12zMBf
	DPDVvXcLZJ6gRdOvLE7iu3EN3hDMEo+VA9WaWiZo5VKukThcItQ6hP5cueI2JZ2S
	SuTyYvQ8nGnBaYm7joIRLekq0zhb/wzLHxcOS1qPHUMue/TjuBW7PJeQwJfNRnKU
	ve3j8LdbxKCvz/OfR/jg4KclS/64DDKCYkfU2CvbRd/E2g==
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 4hs0cyh9kn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 21:55:04 +0000 (GMT)
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 7A94480019D;
	Thu,  5 Nov 2026 21:55:02 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 5 Nov 2026 09:54:42 -1200
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 5 Nov 2026 09:54:42 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 5 Nov 2026 09:54:42 -1200
Received: from BL0PR07CU001.outbound.protection.outlook.com (192.58.206.38) by
 edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 5 Nov
 2026 21:54:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMmtcnV7EPLHPxQTcTdokuOoNhK9Pf6zg3jT1PjL0ZfU4sMXPT1TfSsu8ORjgDADIOMt7vejnlnRytArHSiX/x2gQFdVanv3R0LaOo/RZBQroinaUjhuWJ6tVa2XdJmVdXU5Bc7dxW5731H3H73cqM19z2WenZTQmS2fe5nUkCgkiUKqFD3KyKuXkzaFpVGFDgxyMJhT9ingpdwAFAJo/HHPO+iVhtQSGVNOsRD7e/7yslU1ZTlvXgG1QujPKp8gFXNVQmmQfXiK6choQkKO22kt5Iz0C4gbK0leVHI4NJ3FbAOi9kVtWejBGLBiNh1SWEGPtitkzBrVPcRg4l5P0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LO4xhcL6US3RgbQj4QaT0KdS2J0RA+tRGfcdnnw+QwQ=;
 b=QkLcyhL2rzZDS8pfs7nbOIrhR6YFVqCY/znBMBX8NTPX/BxQI0DRQYcCKgpLo8Q0+4Rqkp3EPtG99vmg+BV0CMUv4myIhERVgqZwxY3gr8HU7fA++tV3qr1UiNhRlfeIibpC/r91o0D9HIa8whprgBMml9mnVlFPQy5GS4f7JRSSLoJqQtl8TQ1RP4NIUxJJRiy9e3Igs/xZG4/f2jv2LhXm+FdMyyjeJJ86OEDKN75gC1ZtNrfp7m9xthrEBOKb/ve6UcsUcR42FrPUlFAvpXmG2ddaPEjYm1rrIsgfSZUFK7ZBCj+8QpXOHw9HtJa4OL5uDwBQ6l/v6CDYJ6jZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:49::15) by
 LV8PR84MB3584.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:408:1eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 21:54:39 +0000
Received: from DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::7426:5f6c:e7ca:66c9]) by DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::7426:5f6c:e7ca:66c9%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 21:54:39 +0000
From: "Smith, Kyle" <kyles@hpe.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
        "Keith
 Busch" <kbusch@kernel.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>, "hch@lst.de"
	<hch@lst.de>,
        "sagi@grimberg.me" <sagi@grimberg.me>
Subject: [PATCH] nvme: Fix potential gendisk leak in nvme_alloc_ns
Thread-Topic: [PATCH] nvme: Fix potential gendisk leak in nvme_alloc_ns
Thread-Index: Ad1tVsAD8tyX7fKjQb2NR8RbS5R6Qg==
Date: Thu, 5 Nov 2026 21:54:38 +0000
Message-ID: <DM4PR84MB1590C08CB556D28CBA707E74A0772@DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR84MB1590:EE_|LV8PR84MB3584:EE_
x-ms-office365-filtering-correlation-id: 92ec68ff-dced-4db1-a4c3-08df3b8763be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|261021135927099003|261028144727099003|261021123027099003|261102123227099003|261026121527099003|56012099006|261009223027099003|261021121427099003|261022105027099003|261026140227099003|10067099003|18002099003|6133799003;
x-microsoft-antispam-message-info: ZsDirq8jw+rJJYkuPdOHB4XYbtqAxZuqzw8k9n2Z/EKMR1NIN4GsP7OnmQ528tNiZ2j3s2+DiBfNWAJuiLXALeGGVSRHRENMYup/j/yucqC/SSGYPqcwvNhlpvhS9LQiS77Jy/PzKUcxHK8U4q1kNhwHiLbWdAGFTM2sQs/ix/5xy949zBhJSFX7HYPjUPImundHSHeXnPpOKgNo92/Vqm7YbwC5r4RRvuIx7H0O22P+5V+4ZImQtRDD+gsMnZ4XVygmteyU7A1VnzERyPM5gO7YkizLOgF4feoAOf3Z5xuXIb7y8wJSfDPIQpO+/yE8PULRqgsequZOk1ColYgqOQd/J+oSN9hBvl1ZAB2q8/SNh5qwjSPGEMrn0WnY0JSEzuP3ch6+3jMsEh2mW/qYVmuWwAtwoz+BvkGwCh/N8NVOQewng1lX12RUduxflBlZWCxRf13C4xMU+QXz5gd3+RpOrXuejSHQZAX+q4eAJq/Vmt9hnZQ3c8kGgFnd3D6YyxNP0BeGhxazpzGEaTUKjiWg4/tvCCPFj0J94KO2Km8uicG2CiJyOdNH0NmpqnaWQsZk8pcXJFmMEbFJC92cO554k8nen3dwBP+pydC9gAV2r4rV6H9tqB8pKnbRryGhSt5Jue59SirYPoku86ecl9CKNcLVHI1GnrflHbeYIB7LpQtnzObeK/HXbIUtRFobNQAPAtHrXqjbMWWB2Qb92hc4AVqFwSnLSLbGkdNxr4E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(261021135927099003)(261028144727099003)(261021123027099003)(261102123227099003)(261026121527099003)(56012099006)(261009223027099003)(261021121427099003)(261022105027099003)(261026140227099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Pe5jvKG/To0Io7fd6DTsoIXTQLliQvPGkRcZFj6PU6VR8gXBW1nZuvVSHdAm?=
 =?us-ascii?Q?Bt5SAoeWYDUK3/vmkoHr+drxEqZqULo/HxzBfSrePhmyUosNiSuOlsBNcJxc?=
 =?us-ascii?Q?e82oGGRezcGcqXOpaMGB1DeRaB7/4H7lOYNLqN8cqMpKosCrvkP+TQuO4/Cs?=
 =?us-ascii?Q?h32i9Kt5nVrgHbZHkc3WybOxT/mnG04331aVT+cdoskvsACBDSPCKRTvzP94?=
 =?us-ascii?Q?+32CUTgPthX/9QKNfF7wFpEbI8ce79k73oyCfeVkAD5gjRCz0aSF7whhwHf4?=
 =?us-ascii?Q?nWAcYciVABQW4yeRAcKD8efDeKbh7WAdPazJYTkpLz/e2b5MQgv4ZAt2coog?=
 =?us-ascii?Q?QSQArusNoIJOSnspcrejQbj0VvOgFWgRLJhTp99B3xIBhbAdfKtFbl4peZ1U?=
 =?us-ascii?Q?68mud9vdi315BufVkZIBLwCoG33JTxY9HRNkihpjANIQ7diSj3IzQyHbZSNs?=
 =?us-ascii?Q?cC+4MFgVgg2tKZyqbyHmF4hFRdsfymt3JjfzpGK6z8KQQ7bRZ4HxuE0CjZNO?=
 =?us-ascii?Q?NL7eWp2DFLh5Y3Rasr6wgUlHpg/do1GDc3ECpZllR3oLF//fYnBbpaWpLs0M?=
 =?us-ascii?Q?vE5NvFn4TZFnn6hJFigtQB9QzWhprwAV99o3X9AgV3T0a81ufp/rc4fCpWQF?=
 =?us-ascii?Q?xxkD0Tzmr8xEJYGrCmU/11Z8XCCilY5YsrRy/ix+LPaNWKbarrvmidLzgKTS?=
 =?us-ascii?Q?qoFEfnjAnWJPqvZG5oVfZJIWSmRtjeCQY91ZXyeKf3x/s3x3QtX+m3J8supV?=
 =?us-ascii?Q?1bC56LWUoltzSYTxOmgM78smQUS3zewyZqO7EGXgRGosRx7M6+hnW/mXTv2i?=
 =?us-ascii?Q?Glc3T2mCbqTiF6EgktRNAtD8wZdRcyxAHBf0PGyeMfZP0O+3o08IShsSGeed?=
 =?us-ascii?Q?IFBZJHE2xQdrKcwdmDvPUkfH4qaXo6omluN2J8+8uxyXb6OqX1+VzFVY5P0/?=
 =?us-ascii?Q?m5v71tL0OXppdk+mc545ozqg/d274D4cdv1P7/1fnUwZaAaGVXMnoFOmyU9v?=
 =?us-ascii?Q?66ovLMQ5XAmLEOc4i96wknirc8e1ZF+fSB/AdMqjw/rp2eq0j1kP2kURVb3x?=
 =?us-ascii?Q?NObSzvSa7GBqBPCj3Yg704GZi/emrm2hBLwKLG+FeGCTHJk6YAyfKQEERjQm?=
 =?us-ascii?Q?K0GsVzjYSZcfCWMOISQqrXscuQlfQJNHxLWOVl5w3JMw6A3oxLK1WaPA+6Nn?=
 =?us-ascii?Q?wT6mLN4ZAL9l6hdhQwtafF8Slf5mWtfDSCwAz5UDz9DsvSDUq6Dxi2r3zJ6W?=
 =?us-ascii?Q?/AN88r7d4qb3M5NboDLFW/xUe9UWUS8PutFflS41cYMCt+JewE25UuL7IMWr?=
 =?us-ascii?Q?8t76cg+1lrfRJV8gKCL5To7VRQuIcaZE10UqYdjsW3aROWEvrYSi2MoDNXC0?=
 =?us-ascii?Q?PV0x1Rrj3tiBg384eS8T5uim+IoThiB+V/LfEuDgABohVNyk6hgtP74M+gRQ?=
 =?us-ascii?Q?EIdVzURnJbSVMuoJY9fN46jlFHJLrE1UNHTPhtApDkFi70currlw38K2fPds?=
 =?us-ascii?Q?/tTzKBi7F45VhNqv1GyUWXhHBPv3BafIdhn+mx7/K/v039xrkbschtJnn6fQ?=
 =?us-ascii?Q?BPlz9TfxVRRfeBKpjJHaSlTPy4NDE13SvV+u1sRkHnErLnNqADP6dKZSZCPX?=
 =?us-ascii?Q?ZTgC9KKAAvKwqjx6YhG88Z02ccz3tHd18nHwUjCwJVnF7yYv6YBiVVwsbkME?=
 =?us-ascii?Q?RrRtDFKmdmCJ/uQ/AtGQvkrODoSXI6xL9a8939tV4EVnUnJS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 2pleJM8hcFbun/j1P2c0nKZzhuPxDZ64IyAC0nhRRH5bBLl7xgsqivgKloJizYD8pVFBubsb5C6Zw9+VI3jVpwx3S8Nffe5ns89f7Z3e6yUmXKz6mVkJYR68Z4Ss8gw35J/Ur288VFiVnFFr9Js0NMESJA1yzCRv7ZipE/6boCtwfOw69ZZrsE7912gtLgMiKG0UMLGYTtX4uGRJtynJ/ib6z7UpPgxfFD8+M5cbZMxhKelpYt0gIrtpWTFSB5X3yP5m5lRmv35yihSQ76rXwYkMaVzlr2PYjPYZC+Y5XgIXgRmv1cujp992PgN2lDiHPg3i7nZv3Hi1YCnbxvDChQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1590.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ec68ff-dced-4db1-a4c3-08df3b8763be
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 21:54:38.9500
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8TBNDelOHGD1sPKVbtvuU9rzfTiAgBHbhyn3ltDSwRR8XWDl0E1KemLCnhtMNGTc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR84MB3584
X-OriginatorOrg: hpe.com
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfX8NkcIj8yCjjs
 SfV8Fk256HjzZlNJk47DxwOv/LapDQr3FL3O7pwdgFRifuOLB+lbl3mZXx4N8EPMnbma9YeROb3
 aN+FE/Fqz/cRz4paI9zm5arDqzifOHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfX5ZmHu0LbV0AR
 n+VEqnGeQ6YAFfkwmgunZ1cWofPuTdVvdy4y1f91v1nZ1vHGd9DJJHNv3brdxaBREwf7L+EmwEU
 YMUonxj9tG+I4BkvLQ1p8Lg638ajizZJEcdGqcSl8fgWKGfrv7rAauXoS5Y+1wYLZdI8gKuxDp9
 kwyTSRhxUwISK3F9sotwUz4aAgMu9UKQy3XCOqXxRPycLWSV63TAGaoA7ULFFeo8YtOMN0h/7L3
 g0hLmXCyKWY0q11024PX4rF5MzUx+AyMm5iINsnWLqcoZAXfey+kMGQEtiPO7eHKCAe0s+gPP7n
 i9y0zWB0bmx26CXSWmQMZXl5pgqHu6tR3aBAYgfaf8n5/i1KpvGDFRZXKTl/N2h9EECtjYQN+F8
 RCE0P8r+Ljbe+D4nbRuzynmYFzNvALMXDRIHddLPBWFuxPTkK+YToo0TGgsLi6NRTu8aB45c4up
 1e9YU+qHxR0hY9wNQuw==
X-Authority-Analysis: v=2.4 cv=QN791QLL c=1 sm=1 tr=0 ts=6aecfb38 cx=c_pps
 a=A+SOMQ4XYIH4HgQ50p3F5Q==:117 a=A+SOMQ4XYIH4HgQ50p3F5Q==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=gQcMVamqm3wCPoSYhaRC:22 a=NCWKwCw8Xy9Og0ibBRsL:22
 a=MvuuwTCpAAAA:8 a=vlVqF7lKmlFNZKkLtSAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: hcWt-P5DqLJOPCOrdy1njJUCHPkwPwIn
X-Proofpoint-ORIG-GUID: hcWt-P5DqLJOPCOrdy1njJUCHPkwPwIn
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050087

Multiple BUGs were seen after the following sequence:
1) ctrl A in subsys A allocs ns nvmeAcAn1 and ns_head nvmeAn1 and sets
   both as live
2) ctrl B in subsys A allocs ns nvmeAcBn1 under ns_head nvmeAn1, but is
   interrupted or stalled between nvme_init_ns_head and healthy return
3) the namespace is removed from subsystem, triggering rescan
4) nvmeAcAn1 completes nvme_ns_remove
5) nvmeAcBn1 allocation returns through an error pathway in nvme_alloc_ns

In this sequence, when nvmeAcBn1 returns, it is the last path and has the
responsibility of shutting down the live ns_head, but does not call
nvme_mpath_shutdown_disk. Failure to call nvme_mpath_shutdown_disk leaves
the gendisk active in sysfs/devfs while components around it are freed.
The result is that a new nvme_ns_head with the same namespace number
cannot be created in sysfs and freed memory can be accessed through
remaining userspace files. Most observed panics were seen from paths
utilizing nvme_find_path, such as nuse_show or blkdev_ioctl, though
occasionally corruption of the dpm list was detected as well.

Fix here is to simply keep ns_head cleanup the same as nvme_ns_remove.
This ensures we don't break delayed removal and that we clean up the
gendisk when appropriate.

Signed-off-by: Kyle Smith <kyles@hpe.com>
---
In our setup, this was enabled by a time out of the namespace identify
command sent from nvme_update_ns_info_block in conjunction with a
faulty target device, though it should be possible with smaller
windows if interrupts catch things the wrong way.

 drivers/nvme/host/core.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index a7a4d09644c1..682b51118b30 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -4364,24 +4364,16 @@ static void nvme_alloc_ns(struct nvme_ctrl *ctrl, s=
truct nvme_ns_info *info)
 	mutex_lock(&ctrl->subsys->lock);
 	list_del_rcu(&ns->siblings);
 	if (list_empty(&ns->head->list)) {
-		list_del_init(&ns->head->entry);
-		/*
-		 * If multipath is not configured, we still create a namespace
-		 * head (nshead), but head->disk is not initialized in that
-		 * case.  As a result, only a single reference to nshead is held
-		 * (via kref_init()) when it is created. Therefore, ensure that
-		 * we do not release the reference to nshead twice if head->disk
-		 * is not present.
-		 */
-		if (ns->head->disk)
-			last_path =3D true;
+		if (!nvme_mpath_queue_if_no_path(ns->head))
+			list_del_init(&ns->head->entry);
+		last_path =3D true;
 	}
 	mutex_unlock(&ctrl->subsys->lock);
=20
 	/* guarantee not available in head->list */
 	synchronize_srcu(&ns->head->srcu);
 	if (last_path)
-		nvme_put_ns_head(ns->head);
+		nvme_mpath_remove_disk(ns->head);
 	nvme_put_ns_head(ns->head);
  out_cleanup_disk:
 	put_disk(disk);


