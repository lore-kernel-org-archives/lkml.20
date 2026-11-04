Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793759855;
	b=VuLiSeq4SE0n/FVzlxIzUkpymmSr7epKopBtSnKlnyUj/vsca6SSbhPb6WeId1hhN9Zd
	 roouZR9Iv5fmp2lQ1ezKMGIzQtE+EeZj0+wCPycfHPFDZqYmPLsqfWK/viLDEhghiMqRr
	 C5xah3CLvcFzCDRth+BlroPaPWl8OPRHGb+ULj1E3Hi+xU7TNy23lAcmZ2XwAMxFBVyVj
	 e7sql6N5rr5oNJtco2SaM64qxu2btLvOBM5H5n71lvWcDBlRCPttjMr/c/60bBFaEc4XU
	 A2oCv+t6SiuwZDzb+wixm97YLT3bItDtOA1F7dC4RoHNCMfrzWN0UGNpPQrcXQhZBOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759855;
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
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IQZPwWfDufQaY0y0bMNCjKF4tGu6Aj1vpQMdzlW8a2o=;
	b=Dw/YhkOnM7HDOAZq2q41XPvgQHXNVbYuJSNsq3SNExYPlFYdscv8k6IAKSgzQwyAvixz
	 IoYvkct+NMWDUSXzmW/wFBaOK6S2qA1AeI+yvbOUeN4yvaqyhlNOxSsvvtrjow5oBi2Fp
	 +3MoHZLPWAyZkHxfHROty6VN6zIj7xLvG/5H0GlRrpkGGDSvyczCAnPwmJc6MgBSnnFXZ
	 J+T3xLGJyxjhb6KHSMuayWF4y1RW8gJg/45mYJ8MCDtuNq/iqSDU8QihXJnvSDw7eomZ2
	 7SSx5n/Duf//GSqW3kDgXpAc5kFQV14XMfFOBzY4Jmrsab7bD0lsGc9qD334DB/CCKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=ujh31bQW;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=kLa6H8T6;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=u5FHqm7c;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4C3606A328;
	Wed,  4 Nov 2026 02:37:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4C3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=ujh31bQW;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=kLa6H8T6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=u5FHqm7c
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40SWOs1377443;
	Tue, 3 Nov 2026 18:37:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=IQZPwWfDufQaY0y0bMNCjKF4tGu6Aj1vpQMdzlW8a2o=; b=
	ujh31bQW84yVMyc4t0A4yMI0m/3uwZrXULLqfwY0ZTXYENh3LP0lYhh5bnVaL3Tg
	7yADKY3iezvdlL5Gf3xmVkMDqUoa16SqntCLXETpptxy9/sqgWpK5unIZn8EXmsF
	yT94AIPfWtSSaFVeGM8NHCpuvGtD+z8/Puu8vfKw1LPdowezdLNxLgF7KevIQFUS
	/qE5B8V+wr4ZVVAFm5LaebY2y0lCmSb7RbuBCQmKJSRRd4SDBDYXacpaEEyl4C9L
	N5D4l4IxwNysstFmss5hV1V20LXXszU2WBzFFBz4DDjydXOusZnLyCyUX8DhAxaH
	Fk5662CFyZmy3QuEIzyEtg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hqctw0a3n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 18:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793759847; bh=IQZPwWfDufQaY0y0bMNCjKF4tGu6Aj1vpQMdzlW8a2o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kLa6H8T62IlbZTCURFsw/KRN/IF+VPTqZfpNeGqE7vrKI9BEFSo77BzTUlm+sIdXZ
	 LtxHk89orxMHuhQ7SaLLO9Sdg6hJ29HDwFX0SG91mgIZYqHkXqRounoEmoKp0V/dB9
	 Okwc5NhFj82cGKOkRUri7W2SQaN0QKZ3YQd4EpySx+XpVwuNQGw9S0PMz25Ejzo9xY
	 p5cbel4W6Y86sB/8aeRSV3TNI4ZsBruE7le/VJkMTJUUEbnds8LQUjUL/RdnKBlpuu
	 GiluppNDrnJWwEtiEoglR9aAtxfXS5315x7QOAjNjhlhuD55BGWCHzDVHJK0kGePVO
	 Fs5wuD1nZ6d7Q==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 81B33401F3;
	Wed,  4 Nov 2026 02:37:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 29651A0068;
	Wed,  4 Nov 2026 02:37:27 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=u5FHqm7c;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00305.outbound.protection.outlook.com [40.93.13.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9298F4010B;
	Wed,  4 Nov 2026 02:37:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARP7L8Xye5LFVk2vLm8SRyY+WsrG/pZOYqq4FGRbpt7GAEXcBVW3TidcJfCHpt0GimQjz96OaG9ieL4OGJplkE2IT3UbcXZu3hDTTF7O7mQpG28I0e22XV1rmuZqILIk6XHHDn2vXAMrQz5pz6aW/uYGpXLpyktCYJAhkAl20Ti/8BB5DizkaSPwvGwMKNkQ8v2xwmviKkW6x3W+/cJEOJQff6hQSBYzTdkRQ2dlcxb71U8SX2bLGXsv+kCSe7gRkAvJeNDtGm0BkW24ZPuksaDsMZSxkRa5j65RtSg/z/LiGiwMbDZMN/tv7l8Cfw2eCqogoh229xIYYK4gczJY1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQZPwWfDufQaY0y0bMNCjKF4tGu6Aj1vpQMdzlW8a2o=;
 b=OF/UgBBouRu35Zsm6yOuCQr9NEnTbYXItMaVC58NC/HbpNDMF6C/fgr+CC3lAc7/Ht6xzIe9jSvfLUDzp4iDK6MiUIC6kVfOdVmAwNKbvLKu0RdebS1Sai8NbPsc8HU9Jud/STNq2IyVGcay4WeQADPFdM7bac/HNxmu4nhohztPeokQe6w6/5eVhSiftWBxo51ylq9SoBmeO+Q5qujnGMoCLLVgwx8gGecNo9I5fjQB6dGNIq0CFbcLrXUiv5n7iBsKplDhflmtich2dzs+DoMNd0+auFjMUYyJ0aEdjzrerMXtcFPzsBnZ9ff1KSuYiRy9lcPs5sMITCQbI4PQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQZPwWfDufQaY0y0bMNCjKF4tGu6Aj1vpQMdzlW8a2o=;
 b=u5FHqm7cmGMR2RyD4BmcXu/uFSKK7Mg2LmAlsQOtPWZ9iFXNW157VEvhDlNalblhAOxlEOmcmU1TH/ryfQ1LjdrIoXsOpdBz+GEaMO2KxMTIe9JRxl6BA8iceTpzXjf3233XR1pTUTfN4RRXla/xI1XFuE+KL2kPLMVjWZp8kVI=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 02:37:20 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 02:37:19 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
Thread-Topic: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during
 system suspend
Thread-Index: AQHdYnan5UYfhcgHMUWgaIHS0yhDQrcdRcuA
Date: Wed, 4 Nov 2026 02:37:19 +0000
Message-ID: <auqXyUxc9cRIuYou@vbox>
References: <20261022224220.480-1-tvlad744@gmail.com>
In-Reply-To: <20261022224220.480-1-tvlad744@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|PH7PR12MB6657:EE_
x-ms-office365-filtering-correlation-id: b66a15b1-22a0-40b2-860f-08df3a1c8c64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|376014|366016|38070700021|11063799006|56012099006|261009223027099003|261102123227099003|261021121427099003|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 UQZPJuX3eVu0x49/MvRWjwUljYzAuFKsPr4ekMYA2rgojumcNM7N0jU7f7mD/pIGq01vK9tVlvP8IURL33N9qOUj+mEY9FDG6p/g4+gRdGn8TqC78U1Z8fDPDin6EvxHqn2A6vYqypg0ICs5nKHbIzaAiK/9rTU17oW1XIPKyOsk4ywqyo7UaFiOcN14+9l9CGqnyAS8Y2Y0ypY9w1xcUpWkjn68zWVXjrORudYG5MV121MvcaifWnyVUhGm1Lrn+qezcjFv7cyGnL/stB7egwn7/0uwSP8iNqIqe87r9ISnXLyzKQHORxu8xzrjSCKSCHsAO7+bfw4aOAAkxmvx+0270slc1LNiyYSe5ddvK6sQFmkyeMgTRMdqisR3O2n5+FjhbiA70sdBnYnV4vv9fYr4PtOWLrxoVpmiPRTSvkTmB85V9uLFjcUdsjJfUdhRE0ablfu2BLTTlN/KhPGLVeqKTw2DToaXOhbI1y9OlVPQrFug7FNHxWNmEVWJ127snM2c+8kUJf7tfr0fPshz+5IL9HjHPdcd2I8WbqOhU2NCIWoEFgjbbx8AIVkLF2+Ngr11F2wXE+humhKN/tT/LKSrMCliLWBqizxusFMY173RV/99zk96sA97RI1Qj75Re8G0F5w6fVuE3A22pEOJyiYyITKD7GJ4BlkAZJkiYcQJX07v7hEX4FjcBzVZA8OAIVeOZP++jNc6FGfV9iPrTMiqDegxeShi9oeKsQC+H0c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(38070700021)(11063799006)(56012099006)(261009223027099003)(261102123227099003)(261021121427099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eDhPckNYbElSNWp2UmxpNUdGdUMvdHBLRDVSWFZBcW5RU3VFZndLM1gvWW5w?=
 =?utf-8?B?RlJqVmR0M0pSWVhtYXZweGpZb0tuUjRSYWZlTHoxV0VYR1N5a1U4VFI5amth?=
 =?utf-8?B?VTQ0ZVVDMWpmTXRER0FycWRKZjV0cGJWdTFMYldRTTdhQVQ3bXFleWQrLzls?=
 =?utf-8?B?WXZkci9sVVIzdDFtVElxNmUvUldhbWlPekN3ajBYV2dwakNlVmk0cVlkM0hT?=
 =?utf-8?B?LzNleHBsUjFXU0JyeUlCb0xjMU1aZ0JTR0p1TUk3cm1BSGM5NitMa0E2aFhY?=
 =?utf-8?B?Q1Q0T0pFcW5BaWtCWU5VSFNFOERSVkVLZ0doNzRFVWRBMVRRWHdQTkY5ZE8w?=
 =?utf-8?B?eFlJT1BKZVRyOU9xa3hNZ1VuVUxBZXBCV2UwcDBBcERkWjhSRXNnZzNpcS9L?=
 =?utf-8?B?VUNiUHlHK1Rya1VUWi9KNEU3Z1l4N1ZNbE9KbkN1TS9qeWVKNDF1YTVYWHFy?=
 =?utf-8?B?ZThTZko0enNlNklTSUluTEFBOHB5aFg3ZnlsamF4amlQbW9kVUtiRndGTGVH?=
 =?utf-8?B?czRXVnA1SlNaTzJ4Z3pZRkJONEl0cXNrUHBXT1Ntem8vVTdaVVFLTldONWpx?=
 =?utf-8?B?YmNQRkJiTWN4cm1zRjJvT0xicjZKWmRObGNHZjZSN05lcjFIZzlKV0JvbW1w?=
 =?utf-8?B?R3g4c1IxVFJGYzNlR1JnaUV1WjBaLzVIUVZRZUpKSzA1THo4R3hHbTgvOVE3?=
 =?utf-8?B?Tk1zYXFGSWVocDRDb1Z6RE04d3hCTGt0dGNOY2JwQjNYWTQrNDZBRWRLdHhh?=
 =?utf-8?B?aFREOVJvOVAvYVNKUER4ZWZyQXpZaEdHVERDWUpPTktEekVnNnN1dUV6dzln?=
 =?utf-8?B?QXUyNUhvcXhveFBIUkxHZGlablNSL2FTODdKVG9MZnhBVlE3dzVWUUJhbFpv?=
 =?utf-8?B?enRvU2w4MisxczlSd2NWTHRHUzQvWU9FWHpQNHI1eWZGWlAxUkYweXBJaitQ?=
 =?utf-8?B?RW1BL0lQdGlSNmRkWU9qcEdnSG1RSm1mOExwWVdvRDBmMm1waFlEbUFkczJU?=
 =?utf-8?B?MVpNbjJTM1Fjekl0NHBwNFduS0ZRdTdxSURoUFlBSHNHTEVJY3kzYTFsZGN0?=
 =?utf-8?B?aHZnOVc4NzkwOUdTK2xQMGVhQzhYY2c0QzgvSGw5cktBVk1haTNXL0E1Uzdu?=
 =?utf-8?B?V3NVbUpJVmxhRHhrTm4zS2tPUFYydzZKL1pQc0lLMnlWaFFGS3NGL055QW5F?=
 =?utf-8?B?a0hkVEFPeEFpTWxMWFpRS0tqbzk4TzV5NzVHU1NIc1loSTc2TjVkaWF4ZS94?=
 =?utf-8?B?VUYwYlh1UmdwRUtUUGV4YmZSMGI0NTBwc0ZWVklWT0k4ZkQzSk9lVTg0eXZI?=
 =?utf-8?B?eWk2Mk5nSkE5OUFCNUt3Y2p4QjRMTjlhQmlxZm16SXJNTmlDd0JDelBDQWF0?=
 =?utf-8?B?MXIxTDhaREVBalNGSXMzY1k5M2xtTEM5ZFhKRHdzaUtoeFZpblQ0c2ZQSjl5?=
 =?utf-8?B?WnJKWkludldtMFBGNVZGUmExU1owNTd1R2JiTVR2QzRYMkZydnExdjJNUlB4?=
 =?utf-8?B?WUc4R3QrMEZ3a1YxYzMzM0hOdjNHQVhKdHNVWG1ONy9GaHE2YUxJUzZtWi9m?=
 =?utf-8?B?Mk1PNmloK2FRY1REQitXVkpnRi9BL3I2TzI5andLbC9Pd0dyUTd0ZDhaWUZW?=
 =?utf-8?B?WUdxK3YwZG5oeXQrRDcxYXlKTjkzemN3d2NCODZwTFpWRnp6ZDNzdFZzQ04w?=
 =?utf-8?B?OEZKSnV6ZFZhSE1Gd1FNSW1sZWpldXJvSks0ODM5SVZrMW9PRVNQOXN6bE1S?=
 =?utf-8?B?amtOekRQQ2lqYTVreDYzVEhxOWhJczlXUnFWMk1RNmUvNEhHNDdRMHdvdEpN?=
 =?utf-8?B?R21HU01mcWJ3dExBNGFUZzdDbTlzUmwyZ2lKZXN0MGVYaGV1aHdSdzlVMHh2?=
 =?utf-8?B?TnU0MmJvVCtpcEIraEZKaXdkdWZYejczQW1NMkhGNkdKRW41RlJ1SU5QeFBR?=
 =?utf-8?B?dEtrSUwxMTNRcVRCQkFDcVZleHdxZmw4bVVCaHdEcTBFbjJOUDA1cmdmb1N6?=
 =?utf-8?B?LzZveUxyWFFNZUppVmtFRk9RR28yMVpDbTh2YzZIUm1ndGdDT0ZaclVwZmpX?=
 =?utf-8?B?dWhCWGV4SVNReC9vczZBUlE3ejRsK1FmdDJDRXpYVGd2N1FPSEFxTU1ubUsr?=
 =?utf-8?B?cGpPK0NoNEFkdTc3QXpua1oxZlVLeXVacUV3WE4wYVpKUnZubG1PT1pMaStv?=
 =?utf-8?B?bFgrUklWSnljYXlnbjdVUnA2bzRCMlVFR2RtcXRFelhBYzFtVHpHUHBQT1Ez?=
 =?utf-8?B?bW43NTd2RlNsNVlmMjVjL1cvemplQXMyT0pkbUwzbXh0WXlUdkZScWVpd0hw?=
 =?utf-8?B?RmZzbkN3RFlQUmpDM2dSUStQbG1rc05IemdyOHpEUm96dGNRaUZRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB794033171C3D41B52AB2002B72CA8B@namprd12.prod.outlook.com>
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
	lOuoMF4h+DfCDDXPpmSUNqNfdT5vv38jSvNRp7ZRzf+AMkXiiRhXgBn2Fek3bgiBRMcWj2mcbBur4xYId9v3EVU4quwTHKIS3Xv10OykvMxO5VcWkrvrMmEYWJWcdIxVT+xH3NgZW97ywJoRdMjA5sfcmWu8jmJiuqswEh/RjIkeJ3PBkjMvva26jEzL5al6bK4kwE44LN1ZlgpnDccTnJrcSHTMclmDIaIN9rzkXzAsbOq3EjNQf7b/cu9oX6/3zgpeRn2+dI9AdNQHO8h+ELNeHLOuwo/UtRYfMx7VrkNCl4LTw3SFGIwobk/J9LbWENr9Me2WIdK999ISxT9Ojw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	x094EYSAcdR0e0sv3fxJ63NLjDiT7Aec6zDumXWjO+ZOszJQM10w6ydjU+BEgaoJhcr55HiLh5ADRgvFlfmeGU2d5AYawcPNsgcG3+7cuaL/+oVMQBTOdUnPFdUWFZ5NJ911k+NpdecrWMq/GKdR4BzAb7sSfNldvvTnFUhv1Fms5Og5Aj7NS3cTvCPgvGHAX2nxiq8H6rgZzJHt01toO/5edPnqtUqbAWLdr7syAiCyhcvlWuuhXRY4/HfMDv8Gtv/KiOV4zTEPbO9oLtcV25LKpk9I0/9bYyKHuByZdXIfRDfvnYXDo6HRDRL5C36rvCpmkuuj+LarSmVGVr2S9Jrj0RoeSjTtp0c3tEcfBqhSEY5qJoxK8psHRnrX3A1kQPEjuDYbfuYnNF0ZWzrhmyh+i8zLvjcX66VJ9bV0zecJWr+KcD1en+22n2f1wPvFK6dJKYi6OfHh3KPFuD8+pcUBzZyr60N6QS3XB1eLzsCD/bUgzADGm7Zx0WCFSAcnwSOfpWC0QtYWa22TCz/8iq3kfpihR48mzxOAuFIUzysept/C/3stvlFUrg4gc8XHHg9+NTowCN2g5gAa65vAB1yaeXG0TzLRNSGmQxFhm8MJ3w9Jw5Tu9rTRJDEgCYdAVC5ETDkRwV4CuSMgr9LRhw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66a15b1-22a0-40b2-860f-08df3a1c8c64
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 02:37:19.8489
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MsP6wzon/mrg/powh93wewDj9XNUOkcMMOjd1WeLdj90gISaSWD/UsGpPVXF8CFmH8bQFK/JkgR4V8AiqRKHuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657
X-Proofpoint-GUID: QcybXDg1v3BHxo6lbXGG27zOSkkcIFwt
X-Proofpoint-ORIG-GUID: QcybXDg1v3BHxo6lbXGG27zOSkkcIFwt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAxMCBTYWx0ZWRfXxLmoVjvZFNMo
 teXqzw6mCsHLz3xeewTqXHVuw3ZBPJc8sseFD79GrApYPZMlYW/RWxCTZH1o3y0xD6oHpwTLjGs
 Mx4tp0XZKS9dlJ39wlKQhsqdO2Z+8GC7atMrebnjuZm1qqfsv/4A+X4iJRORyS57yGuEG+rFxqy
 JgKTr0LXIHOsFIZGx61/3iyxChW97SXWGbbWtGUolH6bBjYpKUg0qP7RuDNoVtsteSMKbjtCY/E
 v6DLXmCLDbvp+08TUQElkSh08dTs/Gi3EzfPoHtJkvgyui9Y7sxDLwmLrMv6zsudqrUeu53xyqd
 OYfWHPT0XsC71ir1AbrPdJ4hS0FVZnngzluvEKKaNEx7Q4m1smI8ZXx/GyeInayg6yVYMGqv2ZG
 DA1oyyNU+UgEK++ldy1LLSiVGuLolK4/HLwtkZBUt1VkLorGjeparBE1hm20GJnkut3rbj1tatU
 sayEmARXF2Vrl9LCc7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAxMCBTYWx0ZWRfX0T8Zcg4kc/p8
 d1PjXEbraD9raeiDp7zxf6HQ6cgtkh6489Or+PaNVNrx62sLqjxSGYNufbC7iu+T9sq+x5Xpc9p
 HogEVDp523gGljl08jJLGcZhFd8P384=
X-Authority-Analysis: v=2.4 cv=ce5HPXDM c=1 sm=1 tr=0 ts=6aea9a68 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=8KMJXURVOQm1DdvX89kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611040010

T24gRnJpLCBPY3QgMjMsIDIwMjYsIFZsYWR5c2xhdiBUeW1vc2hjaHVrIHdyb3RlOg0KPiBkd2Mz
X3Fjb21fc2V0X3JvbGVfbm90aWZpZXIoKSB1cGRhdGVzIHRoZSBWQlVTIG92ZXJyaWRlIGluIFFT
Q1JBVENIDQo+IHN5bmNocm9ub3VzbHksIGZyb20gdGhlIGNvbnRleHQgb2YgdGhlIHVzYl9yb2xl
X3N3aXRjaF9zZXRfcm9sZSgpDQo+IGNhbGxlci4gVGhlIGdsdWUgYXNzdW1lcyB0aGF0IHJvbGUg
c3dpdGNoZXMgb25seSBoYXBwZW4gZnJvbSBhDQo+IGZyZWV6YWJsZSB3b3JrcXVldWUsIGJ1dCB0
aGF0IGhvbGRzIGZvciB0aGUgZHdjMyBjb3JlJ3MgbW9kZSBzd2l0Y2gsDQo+IG5vdCBmb3IgdGhp
cyBub3RpZmllcjogdGhlIFVDU0kgY29ubmVjdG9yIHdvcmssIGZvciBvbmUsIHJ1bnMgb24gdGhl
DQo+IG5vbi1mcmVlemFibGUgc3lzdGVtIHdvcmtxdWV1ZS4NCj4gDQoNCi4uLi4NCg0KR29vZCBj
YXRjaC4gSG93ZXZlciwgdGhpcyBzaG91bGQgYmUgZml4ZWQgaW4gdGhlIGR3YzMgY29yZS4gVGhl
DQpwcmVfc2V0X3JvbGUgbm90aWZpZXIgY2FuIGJlIGNhbGxlZCBmcm9tIHRoZSBmcmVlemFibGUg
X19kd2MzX3NldF9tb2RlKCkNCndvcmsgaW5zdGVhZCBvZiBmcm9tIHRoZSByb2xlIHN3aXRjaCBj
YWxsZXIuIFRoZW4gZ2x1ZSBkcml2ZXJzIHdvbid0IGJlDQpub3RpZmllZCB3aGlsZSBzdXNwZW5k
ZWQuIFRoaXMgaXMgc2ltcGxlciBhbmQgYXBwbGllcyB0byBhbGwgZ2x1ZQ0KZHJpdmVycy4NCg0K
V291bGQgeW91IGxpa2UgdG8gZ2l2ZSB0aGlzIGEgdHJ5IGFuZCBzZW5kIGEgdjM/DQoNClRoYW5r
cywNClRoaW5o
