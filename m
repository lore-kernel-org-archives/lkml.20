Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793838437;
	b=X+95/cT27sModAAPWPNlpM4d1FSBZr9hF/9ksE6cfauFfcV/lWac6FW7sgWQuNP+uRnq
	 URm5pfIGGZFc7VwEtVZ9S09QkyGe/P5vyBvTGAYAtXaLHlWrbLEoxJzDH4A21rBAHh2tK
	 T/A5jTaerBS/xlEihNNg0ZZF83jGLrRV6eSbkco0oEGJlzMhSwFlBp9EHRnqDunyCfrbZ
	 VT8s1mBcpWE7rKQBaNvSDy3G3hhsGgrOsrdR2hD7JA3NW9qr3mJzFe4Os1DXsUgXeaQd2
	 PtBmQXf/D67sGsxV5u0/EAWX/NPrOK5PFv7f7L1n/XWL/AAbFuxbv6wv8aupF5yy37g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838437;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:Received:DKIM-Signature:Received:Received:
	 X-SNPS-Relay:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
	 Message-ID:References:In-Reply-To:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j0jgfFFerWlj7J4LjDDytRHpUZ1h363vHEyXbJEt28k=;
	b=H7n68uPyw1nLWj1XKhEMbpqscrr0HjIpumiMBXB+VJbMtosh0kr7vy0/z8S61Jhz+GoV
	 Z6G6l4kaiXA+5EXtteEQPg1u2+I0ezhqnaVm6Q4PImT0Ef3bce1F6paasd43g0NPhFsEW
	 WqaiqQff3tJPGFAL1gv+aWT3efpycdRIagXioW3qsMH2GguzQ01iGxokNJEkCuRwhyql8
	 3elXDZeRG5f/kSLy/MSEDNQ591/ng6Mk22wFkdDWy0NnhFedyb5hFN8dk8mn/DsUmo2NT
	 Qb75JUfWg5Er2dLmzRRC8687fM4QyRr0GavCLYO5CbHY6FG2oqMRvrN/49+uWtkJz7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=DHgVOIot;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b="aS02o/Ff";
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OXzEzS+6;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295FD606A326;
	Thu,  5 Nov 2026 00:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 295FD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=DHgVOIot;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=aS02o/Ff;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OXzEzS+6
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4NPNcG092717;
	Wed, 4 Nov 2026 16:27:13 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=j0jgfFFerWlj7J4LjDDytRHpUZ1h363vHEyXbJEt28k=; b=
	DHgVOIothTLHtjbBNX6MQocn+tE1EPk3YbeFraxdoZFj2Qr8IyaDUXdl63JLuDOi
	X6KQG0EphLBJA3+rKjRUPM5DMyaA0nr5nMuuFeItvwMuAhKk6ps+04V63jjwi2dB
	WqM9bhC0BnJUVqS/Id71Gw8a1Thrlrh4bj0KVO7dlYx4eI2wOX0zNzEroEX4GhPa
	TJRTmr1igKdm1YzMCAJdvXo/FCMK4m+l8+g5v01ERhH/Zckayx0XbsCkXHUX9TqS
	h4bm095hUv9ynmVFsrWeBjeodrFvHUR1ozAepNbMOomGJuS75KFDQoY9P1lF+sbg
	vq6OkTPGtoyuGHlFUO+l/w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hr2dsfnbw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 16:27:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793838432; bh=j0jgfFFerWlj7J4LjDDytRHpUZ1h363vHEyXbJEt28k=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aS02o/FfiAJDZ6dUJvWtEFQrSwM/ZikQeI/mwpc3RnWI2BpWm3t1enJwIOLVo2hHP
	 fucZeUyVplN0zJul2T7wnDnIIvHicHZ+clL1AX+EI6VHc+xJprxH67Bg5pQOLzHRd3
	 LVPq8/wU/U6pIBeN5YAEM+W0T07tqEj1jJbzB/9uGhs5h5e/FJlLgj8jloF2T/CI3u
	 XS9vuQe9QNuppU7yr7n90Gez6IvoR1lhK06od5VetSTZtLiQcVsb4gAX01AN3SaQXf
	 4rw1fms9dqxxjwqgszsjxQXVUyq/LyR0/Fa3WNmHfMxiXlZVVBiCIaiuwzwC1C6bIw
	 i2dNN6UNOxjDA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 554D64017C;
	Thu,  5 Nov 2026 00:27:12 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 14857A02CD;
	Thu,  5 Nov 2026 00:27:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=OXzEzS+6;
	dkim-atps=neutral
Received: from CH4PR07CU001.outbound.protection.outlook.com (mail-ch4pr07cu00107.outbound.protection.outlook.com [40.93.20.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C12A5401A6;
	Thu,  5 Nov 2026 00:27:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPqClYohujwBUE2pDOg2YgkGLebu84e+1dlYtKwtMXVKnue6k1Pfx7xXyvdOvbhD87FtWbtFeu5G8+X4k64P0AfpU6HROl/DGDyd/T9NASCJXQdbjhhMmhjWcaM29l/oANtF8qLvBtbm+AABpjPyYDsks6mQ3HpWlE2QXPToZJI6tc87N/JJZEd2Zpzii5VrUEfsV4xQ7XRcH9vuoNN+FXdtabi3iwNU3OS5ehEKVD5Kghe6RrvRlPmDAracG4rdx/3NCAKjRJKDd/vEtpXla/eoAJJQtGaDUErTeUBLX1AtZV5F7KCH88hDb7icSht6Wq1vECKFXBLiEIiJiDts+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j0jgfFFerWlj7J4LjDDytRHpUZ1h363vHEyXbJEt28k=;
 b=DnPW85+iiUCOZTUr6IfOUul37NOdL/6rCqdi7S9+oJz9E5+sX+NZLfNJSjxN7OxawYiSg74XCzNDw3kWWJVuq09ObgEQhRD9OBxJv4Ou3ga6oLhDQddplVjnkZRB5uJQwmvIUSReAneQLO63WE3L+9BvrcS+zYFB+cl1SNRr6BqxIIEdyZFj2lE6Gud92EHnTkhY8JNhqVWaYeSJH3tq7MrAPjmD7BjGzej01svM5R4w2s8yOr4+fCBiw3mX/yutn0BEGU1CzzrJOgIxCLcdACNbhC/N7g8GM72QPQK+uZUkpzYbOhSBSUuPWenetEgJBhSbKD0egjGdfGRVXM9PqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j0jgfFFerWlj7J4LjDDytRHpUZ1h363vHEyXbJEt28k=;
 b=OXzEzS+6bclbstc2f0lxQBqsmDAZUFPfqy31iDt8hmOGZrvUB7Hv96gMXFJdFGa5oabO0Lj/upfNvAefY/CnS3Z2TVi8dq8YGTfa27lbF0owTv43OYu2XDusSNrgsFCAtMZ4mWkLtfHirzg0AQ4QvlygT4oq04uiVBrNIaiWw7M=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB5844.namprd12.prod.outlook.com (2603:10b6:8:67::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 00:26:49 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 00:26:49 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
CC: Minas Harutyunyan <hminas@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Inochi Amaoto <inochiama@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: Disable gadget descriptor DMA for Sophgo
 CV18XX/SG200X
Thread-Topic: [PATCH] usb: dwc2: Disable gadget descriptor DMA for Sophgo
 CV18XX/SG200X
Thread-Index: AQHdY64yLHEaNEcNNE2Z0SEZlr7ReLcesSCA
Date: Thu, 5 Nov 2026 00:26:48 +0000
Message-ID: <auvNEv6Xyd1HadZM@vbox>
References: <20261024115220.823159-1-chenyou910331@gmail.com>
In-Reply-To: <20261024115220.823159-1-chenyou910331@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB5844:EE_
x-ms-office365-filtering-correlation-id: da5a812e-b6ff-4590-aa0c-08df3ad37b45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261009223027099003|261102123227099003|261022075727099003|261021121427099003|56012099006|3023799007|11063799006|6133799003|10067099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 81RafEnnZwW9uEm1uaKz9iyOli/YPQndU/6rXraPyC5042GHPg4wvvBUpQyK/kF0nP30d4FDDDOyGMNcxA9m8ZGcjcUAPp0PX1AcZBgooSqPXQGdFaGIadjU9PFcV5vcJzkiP3CT/SWVALWB0tsmuq7FkGUNaMPHStCZQOEqe7fyNHq1E0m9SwlJYXnXmUU9KQq1u1ch8T7Q85Z4vDc10Y1VH1kjAz0aNag7rMGWM3Ylul+bT6qoVpNYqfARL0jsi7GKxkrw+RxOYfAshOKDFbUCbVR++LGMF+I/gIxxBF/1s34ThKsi8nafVwHRxXlNnPDpgZDse6dZViCtLk7m3peehN9xpmp9RpxWOIvXuepBH6pQp378T9Iy8eB6VFJED2CFv2jdbYlGiOpgLWwZwBaXs5V1BpeqV5y6pGarxoBKtgTEzlH97ute6r2MIiwExJsbvTE270VG3HySe84HOme9c358OsrhD2/B+FxHGPs5rvO3Rh6BHLT8aqlRLMAKeExPi3spZsRioASHdnBGb2G4aEyIvjTDH2FrZk82jS4Js3GgI7G+L84Hv8vF/SRUl+FoFmL7hfpugSnGGoGlg65cGJRvhxuBem3rdWuj7VCpdKhddKHv11yTvYFIL7apHI6Ew7McGlTy/QP0D//s90dDJx7iNP7UE6HrDbeIiv3A2HrgfhvhsZubFYVELtPSsQ3p/gLhKuFzITP4U1B9yOVoAVXcRHp3SCWidIbK/no=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261009223027099003)(261102123227099003)(261022075727099003)(261021121427099003)(56012099006)(3023799007)(11063799006)(6133799003)(10067099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S1FsYjRaZERYUkRHRS9SMU16V3FmRTZIWjFtejYvdHZSZlVpZWVTckgxck9Y?=
 =?utf-8?B?SjlQeUNDNWFRSWFrdmF2ams0dS9zMkw3MEY4MlZlTTVnemhIbWtmdDl2OHh5?=
 =?utf-8?B?MVBMVTR1RVFMUTkvbUNjakk1NlJCQk1XbWJ6cGh5Qnl3SGtLWjRmalJ2U3l0?=
 =?utf-8?B?OEYxOTNma094ZXZFNE1FOU1ReGhCSlZqZ1VLb2VuTzM2VWd2U3FRR2JYcnJh?=
 =?utf-8?B?c1R6c1l0YWd1eStMUTdOOFBYN3hDZWZpYU9WL1o1MnV5UEh6TlNMT3JUVXVS?=
 =?utf-8?B?WHFuWm5iQlFXT0ZKbVVJTWpQUHhrYVREZ3ZZVVQ2WG1Hc1RMS0Q4a0hnTmNV?=
 =?utf-8?B?ZDB0aVZaKytHdEpqVXR6QVNEbWZHK0MzYndvRnJFVy9rV3NwelkyU1A5VG5N?=
 =?utf-8?B?RzIwcXZ2MkEwbTZyanpSK0szdktZUEVOWXM0R3ZOQU5WQzdieWJ6MDF5R0xw?=
 =?utf-8?B?aURicWptb2FyMTVlQ1lCaDE2QkFpTm5JblkzbTFmVnVoZ09iWXVtVnpnK0Ny?=
 =?utf-8?B?eHYrZUkvTFJmQmxCbGE1N0N3bm9RczJ0WGhZQUQ0Nm1IUWtSaktOZld1K0Yz?=
 =?utf-8?B?RTVyMlNtRTJjVUE4QmdXQi8wWjFtSkRrUGhVakVNb2VjS2dIUkJpYTlNQVFH?=
 =?utf-8?B?Zml1d3ZhMkJxMjhtY2tBWmJTNElFaVZpYUdjQTdKV3RYUzk5cWV6azNhdElM?=
 =?utf-8?B?UU9JaWNDK09tZnNzbkNrSWJSbGhoWlhuc1Y2Lzhoa1k2U255b2lnc3ZGMDQz?=
 =?utf-8?B?MmcyUE00cTVpbFF6VGtNUm4wWEJvVmE5d3BIenJ1SURjeHhsbTJBOWk0VTZ6?=
 =?utf-8?B?czcwM0E1TmVldGFiWXF0blR1R1RPcW9zRkVscmlqUU51SjllcUt5VEkxNjhB?=
 =?utf-8?B?d2pNYW52RFZVb1Y4UysrOXdyT3ZVMTI1U3hvbk1TRllheU5jY3NnTDF5NVpj?=
 =?utf-8?B?bmJYUTUxaG1FMnhMOUl2UnNONldvNUExWE91T0k3VDdkelFRa3RScFJ0aDdq?=
 =?utf-8?B?b1ppN1JzWTJGaVlHeTZVRVVwQmFwaUhCdHBhRXFRVDdzcGQ3Rll1OWtYOU5L?=
 =?utf-8?B?VW5aNW5jOG9nV2Z3UkNSZE5GSjBoUlJGOVRibktsUHNGaDZpNzJqU0hMaC8w?=
 =?utf-8?B?ODUyTnRSUUpRcVFXU29ERTl4a05zdWx4MjdQbzhYZWQxUDFKQWRIaWlJcEVU?=
 =?utf-8?B?dTFPeHpTMUx4ZnJGUnpVV2FLZE1jY2RpNmdFdHJ3L3prb2d4YnRUYzV5STJ6?=
 =?utf-8?B?MWdnL0ZVMDdqR2ZpeWFmbHRuVXdwQXhuSk9jQm5obVROZDgrbDc0NEVXUnh3?=
 =?utf-8?B?MUdkVG5KM2hCSXNhOHBzSmNOQU5laTMzUVFXNG01NFc3ZU4yeXhCNkxvSFFZ?=
 =?utf-8?B?UTA1TTM4WitPOEpCc0VtSlhXSWt3bUYzM3F6WWppNUhkL1FHUjA2WVMxdGll?=
 =?utf-8?B?eUFUNU9UZmdnbW0zSExJUEJRamh6Tk4zVFdoekZ6WlE0NzJSV084ZjRSTGV6?=
 =?utf-8?B?NXdlbFBaWmpiNGduZG1MbjltMjNxV09nbzdmZDE1cjVHKzBJazF5T1AwaGpp?=
 =?utf-8?B?RFNzNXdVOFRvdnNsUHVuZ2plMWVVd3BJb09uRFM2QzVVNkNSM29GRU56N2R5?=
 =?utf-8?B?d0M4b01xTjB1Nk1YNlZCT1dDUVBSMUZDN1BDOEZ5T2N5c3FHTXkxWjRlMVVy?=
 =?utf-8?B?VjZFY1FnS3k2bU9CdjhObFFkcVhSSnRaZmpBNEk4TVB1VnZFdk9vdFdLZ1h4?=
 =?utf-8?B?NURaS0JBb3QrUHNKZHArdUY0bktXSGlad2VZWXVuM0JuS1pUUUg0Zkp4d3ZF?=
 =?utf-8?B?UTVMYTVNRHpTdXg0QTFaYWtBZHVWSU5aRE5aVitMYWt3R1I4alMyN1JFMktt?=
 =?utf-8?B?WVpiTTJPUEdiWjIxK3BvdUxnd2Q3Z21GUDdzS0s4cWxWRk1MZm13YTBYSk1l?=
 =?utf-8?B?N2tGakl3MUc5d1lsdUpzVWtoRldvUTZvL0lEb2IrVWtBN0ZYNVBtOG13eENa?=
 =?utf-8?B?VXozdEdOQ3RQS0Z5c3dsZW5PUE96MXgrTnM2SzRmZWY0R1o3Q2NZd1dubnpR?=
 =?utf-8?B?Y3BaQ2tJUzRmc1E2RitwWDlDblZ0bVRLTFlUK0dVRkNZMGZ6b21DY3kvaDhQ?=
 =?utf-8?B?UzIvaUNselB2RUd1aHJ5alo0WXpRRERLL1Y3Yno0Tk8wL1VtZ3ppZFdTdVBW?=
 =?utf-8?B?NkdpaXhLMDJrazZuWi9nQm1CLyttYjNkemRyYWlYakdkMVZERXNZMzF0aVJm?=
 =?utf-8?B?Q08vZ0lsTzZxOTlKUmorQVNsVUJ1QkZlSVFIYUsxVmpRblphSk1xZ1RkVTFa?=
 =?utf-8?B?dnRXNDBNSmFIc082YUpPZUM0VWJJVExJVktuVVJpYUtMSjZWWkp5dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC044B9810C63948BC6AF45520A1CC5E@namprd12.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked:
	EPJzU2bbKeEiRH7FXUZGr/dQI9ORIOYSYDNNKcpGXkq6W4iL4faWKTvTyjmsx+jeCTdPpxqNV3GTbDm7XtI+cE9r1osDEL4Pk5OxQpYdNOalJ8EYw19XEnuxTWj/ABkdii1WhmtS/L5PGBoSY2CttRGxsGqQTn8tqVz2DRuXREjCddsz6Fw/dE/YQ1cAlepMFT7i3JB1ZL+doK69Gi978GSYnvruUXkfHSJxKajzmEaY7v8rJ5FnOmjfcbfaypYJjRrjEwYXpyhPSjTqBNQlhgIS6IOE+U8qirYhN37SkCXyZ+jaopD6kbkqdsLrf0fPvXTJNhSk6AzZF6cDRcY4Ug==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hm1gwRg2f7E7rjjnYHY3SMc305dWnZe1LQlaeLFIzi7K8+3Al/NO0mirovzxcoofHReqvdiLR0USwTxoSpeMUq83lVlCW64kJ9nFgIFfWS8RIaYZB14cuhd8oRpmQqgE/8QsvcLnd22eFC+vt6QVUG08bUe3scEEW4sl9NhrFtGwMakaYZhp4/BxCoBE358QfZq1GD7IYS1vyL6HMDE7SCu6qjzRRS3WM7gTyA7RCz5uJashkZH+82YkkvWaWs8STwLgbzqHPnY9I/dTAawJ8V++QRAGntyp/OuOVUbTeD2CMEWk3/8GhKc55EIxcNrAfkZTvxoBwRZjx7NWAXNWTDAuCR9200n5LOwfZrwLuuTQfntUe8d4VfN1r+F4ks6dzIJ+euy8wTaj8XdJQSS/FnoKqTlxL9WXbpUgenOievjmksp9ZkJd+g8p8G9aREcNWRKK733Y0AB1ekCq6f6UiuxS9mGK204iZo+T6P3HBsh15OlL+5Gy7iLkrnSzNLlDzt4Q+x1S/nQ7Y2OhMhF/cxXOrKm2SOSiwbgJjgPJlCMrZvFMlHNxNlYXVSu55IUNEYxE0XaQpb6LMgcHwy6cf2uJcdU0G9olQZVCBj83l0jekuJjBk3t4o8oLfWGn0EW5ljcu22VtiXIvX6XJNyH3Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da5a812e-b6ff-4590-aa0c-08df3ad37b45
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 00:26:48.9938
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y4VPmk1uucNCuKDwr40lUGPcCykvMPVnhMf5U18qqNdApGuQAhDwbxAR98bhMqa0ETvWhmYheXWTOwGJc06/Jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5844
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwMSBTYWx0ZWRfXwEo/BxUQtaQc
 gLZds8S5za8Y9x+cxz4gCFhUUt8h6Wth77PgNVD6NT6oc4fxKD5K9sPDZVQmj8IdKNaq8/CoYwS
 kv266MQScRT5/K24TuXY+j1DOKaM0ixl3XAE0C8/J0AeccyYcm7pymCMX1042QaLW7dT3/z00C8
 5aC+xTpijDvJJ6D1hZb68bseETwVIo5CRVnZUilKkFyFSU665OLxgvpt1SmquthcnKEVFU7dumo
 fuTOwx6+OgD3rJfjjuiYW9rixs+NcyK8OEl4W0bnlEiKvUNmbaAiHKHio5O9JeDXaKXF83BclXU
 90/CRsX/wf4ZvA7AAxqc25SSSQKsdCTJy8D47spAX5lGXqkz+tRSx4Peunl89kArTO5uQwg+pZX
 uAymhhy3M9moJpElZfPppvSuyR/dhd6aknvPFwl6IJNb0rU1vo5qhVVFlm2AywDmC/64WykcKYo
 z398xduyEpFlQEM/n1Q==
X-Proofpoint-ORIG-GUID: 07c6phEO47AUE77I9TYeZtVMoV3aC1yM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwMSBTYWx0ZWRfX1B6dUluSveaW
 iZXYqQ2Q+I5mMG93ms/9NxBy7q+abi4jUl77WrS1Zsl1wk5JCXXz4Y6CHuC3q+V1mTEwrvENSb6
 1MHlu/pWjJk6CTZz+nzi82P8tgpdamw=
X-Authority-Analysis: v=2.4 cv=cb5HPXDM c=1 sm=1 tr=0 ts=6aebcd61 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=pGLkceISAAAA:8 a=jIQo8A4GAAAA:8 a=z4IzzyP2PvsNErM8pWIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 07c6phEO47AUE77I9TYeZtVMoV3aC1yM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 spamscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050001

T24gU2F0LCBPY3QgMjQsIDIwMjYsIENoZW4tWXUgWWVoIHdyb3RlOg0KPiBkd2MyX3NldF9jdjE4
MDBfcGFyYW1zKCkgZGlzYWJsZXMgZ2FkZ2V0IERNQSAoZ19kbWEpIGJ1dCBsZWF2ZXMNCj4gZ19k
bWFfZGVzYyBhdCBpdHMgZGVmYXVsdCwgd2hpY2ggZHdjMl9zZXRfZGVmYXVsdF9wYXJhbXMoKSB0
YWtlcyBmcm9tDQo+IHRoZSBoYXJkd2FyZSBjYXBhYmlsaXR5LiBEZXNjcmlwdG9yIERNQSByZXF1
aXJlcyBnX2RtYSwgc28NCj4gZHdjMl9jaGVja19wYXJhbXMoKSByZWplY3RzIHRoZSBjb21iaW5h
dGlvbiBhdCBwcm9iZSB0aW1lOg0KPiANCj4gICBkd2MyIDQzNDAwMDAudXNiOiBkd2MyX2NoZWNr
X3BhcmFtczogSW52YWxpZCBwYXJhbWV0ZXIgZ19kbWFfZGVzYz0xDQo+IA0KPiBUaGUgY2hlY2sg
dGhlbiBjbGVhcnMgZ19kbWFfZGVzYywgc28gdGhlIGZpbmFsIGNvbmZpZ3VyYXRpb24gaXMNCj4g
YWxyZWFkeSBjb3JyZWN0IGFuZCBvbmx5IHRoZSB3YXJuaW5nIGlzIHNwdXJpb3VzLiBEaXNhYmxl
IGdfZG1hX2Rlc2MNCj4gdG9nZXRoZXIgd2l0aCBnX2RtYSBpbiB0aGUgcGxhdGZvcm0gcGFyYW1l
dGVycyBpbnN0ZWFkLg0KPiANCj4gVGhlIGdhZGdldCBwYXJhbWV0ZXJzIGFyZSBvbmx5IHNldCB1
cCB3aGVuIGRyX21vZGUgaXMgInBlcmlwaGVyYWwiIG9yDQo+ICJvdGciLiBBbGwgaW4tdHJlZSBD
VjE4WFgvU0cyMDBYIGJvYXJkcyB1c2UgImhvc3QiLCB3aGljaCBpcyB3aHkgdGhpcw0KPiBoYXMg
Z29uZSB1bm5vdGljZWQuDQo+IA0KPiBUZXN0ZWQgb24gTWlsay1WIER1byAyNTZNIChTRzIwMDIp
IHdpdGggQ09ORklHX1VTQl9EV0MyX0RVQUxfUk9MRT15IGFuZA0KPiBkcl9tb2RlID0gInBlcmlw
aGVyYWwiOiB0aGUgd2FybmluZyBpcyBnb25lLg0KPiANCj4gRml4ZXM6IDYzYWE3YWI5NTVlNyAo
InVzYjogZHdjMjogYWRkIHN1cHBvcnQgZm9yIFNvcGhnbyBDVjE4WFgvU0cyMDBYIHNlcmllcyBT
b0MiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuLVl1IFllaCA8Y2hlbnlvdTkxMDMzMUBnbWFpbC5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYyB8IDEgKw0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMi9wYXJhbXMuYyBiL2RyaXZlcnMvdXNiL2R3YzIvcGFyYW1zLmMNCj4gaW5kZXggMDkxYmZj
ZmVmNzUzLi42OTQxNzA1ZTQyNmQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzIvcGFy
YW1zLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMi9wYXJhbXMuYw0KPiBAQCAtMjI2LDYgKzIy
Niw3IEBAIHN0YXRpYyB2b2lkIGR3YzJfc2V0X2N2MTgwMF9wYXJhbXMoc3RydWN0IGR3YzJfaHNv
dGcgKmhzb3RnKQ0KPiAgCXAtPm90Z19jYXBzLnNycF9zdXBwb3J0ID0gZmFsc2U7DQo+ICAJcC0+
aG9zdF9kbWEgPSBmYWxzZTsNCj4gIAlwLT5nX2RtYSA9IGZhbHNlOw0KPiArCXAtPmdfZG1hX2Rl
c2MgPSBmYWxzZTsNCj4gIAlwLT5zcGVlZCA9IERXQzJfU1BFRURfUEFSQU1fSElHSDsNCj4gIAlw
LT5waHlfdHlwZSA9IERXQzJfUEhZX1RZUEVfUEFSQU1fVVRNSTsNCj4gIAlwLT5waHlfdXRtaV93
aWR0aCA9IDE2Ow0KPiAtLSANCj4gMi40My4wDQo+IA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5n
dXllbiA8VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
