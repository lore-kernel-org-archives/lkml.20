Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793751185;
	b=WPPSdKVlSVUP90l8qM+a+dJQAFwcfBhI5fwXZx+YyLb7lbOjwaUpi3oBFbk8uoFeaLCA
	 4P56J9tJyQ4w810GazFot+BvXqBiFS21NRnOS9Sdk4aG8G3sg1F1KlJvU1/quOZiI71KY
	 dLZ2tEy17jjndRpgiGal3kGimEee8j68Cxrv9ueYEtG2IO8VYti2/6MtHfzLWGGqIkGPc
	 uqdy6vf+jA4z+pLLRezQ642cyTgamhH7m3KPY7/1rZ6uASayBCyhwvq2gJ5VucKNIJPIe
	 AyGefj7L09LQ4EMZEGZQvuOjDGAxvzhNDuFaarHQHaRAz9XaUzyhmNFJzaCqkM9Husw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751185;
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
	bh=hkc4D9hIox4D1JOax8BU77sr6V9Pz7ffdkrNzEYIFhw=;
	b=TQHe2DPG1Yi7qIxsjhE2AApdqOdzxqPGMT2G8+knC4oF6C7TVB+tNUgULQMa5PYzWox5
	 vW75UZMelM5aYj08twQDqghS1qGDuA4D6742/zzcLCFL5z6+wwERs4bbnb18Qaele19ua
	 8weeLwTzQObvibzsbAep92dZ1uzcC8lBNkwVemtVkWUGv8ZJRTEXuYxz5vf8dMPq8Es9G
	 31dImvtNYOQxg74pQjWqkj+RqJgIHbIGxIuWTR68m6Nxouxr4MDolQ0I49kFB/hCHJdbg
	 MWuPZfUBt8xzXMmg/aaktZNyB3TS/DFPWqLVFnsJAT+rgLaP02a3UUYjkX8izmbmftA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=psVMsXV9;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=aNIeKgab;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=m6lVtMDH;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D286606A31B;
	Wed,  4 Nov 2026 00:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D286606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=psVMsXV9;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=aNIeKgab;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=m6lVtMDH
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3NPjxB1246830;
	Tue, 3 Nov 2026 16:13:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=hkc4D9hIox4D1JOax8BU77sr6V9Pz7ffdkrNzEYIFhw=; b=
	psVMsXV9kQ/katSAn2q/9VGWkHyUClME7GZ6AOBVWnb9M48ZvJ94Jy1EjNehkDx7
	+sHDGyCa+iPWkyjJ9ssUc9q9oq7NuQBDUsl/A82YuLALqZAumgVoI3LgBbGFu80c
	ltYF0NEPKae67E//Cd5KNF9pXtYxjOdgsCMpqthdxVY9czUKH0XB1IzP5hDPLbdq
	SBb0s4S1dw8nGw6sODRZNDcsUhJ7An9PtEksUQSgPtqX5g6hhUAmrEYLU8wCVEe+
	0lrjj7zVc2JNIEr/2b8mj7PjdAMyz7oWFyx1xSaXrJgJvsCqTJ+SFL7b0DPYlAod
	/CvuyXEZohFjLl1QqD/ITg==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hqctvyb2v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 16:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793751180; bh=hkc4D9hIox4D1JOax8BU77sr6V9Pz7ffdkrNzEYIFhw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aNIeKgabrIB7qMRoI21I+RkBtCPadrrZQhqqPe5NuetTGaj/q92wM9WeGPvxjAZZZ
	 1M906Caf2SDrDCaEQciPgopb9F2kFQqFesYk22rzaOEajZLqxD+U2avQV6IsoVPuO1
	 W3mnO0W51gDur1upA99nOY+wLRc+fp3pumKiYzNEsUqmjMLKtg3tbnEvZNUtJHMftD
	 5mV8SnnxksUBlPEIAcH4FFMXbghhb/kPxWi0EMDqnSm4MULieeNv+PbDJRbFHm3/9g
	 96imdQzKanbFKXx6NkXo1UI5FpbEIUFSRwfrZWDe6/i78B3L9D6g4qpYWmsVLf8ArY
	 mQnGk5b59WoWA==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 137AE40117;
	Wed,  4 Nov 2026 00:12:59 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BEDBEA07F8;
	Wed,  4 Nov 2026 00:12:59 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=m6lVtMDH;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00101.outbound.protection.outlook.com [40.93.1.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 1EF252200C1;
	Wed,  4 Nov 2026 00:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qXythj4VplZWJRGwVlLRG0SLLCMiIFLF4pPHYXBY35HxxBC3HigVnDQS1IB2EpQpzDAze9J6xT6bxJOoadHdcg4eTaLfkrPhS6sotPfVc+fIc0Kzspi54aSnyErkRGl+xxUPQubJur24l7lTOITzflwQN8Chq1WK9rMwMAn6EJQJZGXqFjdTQsM8FtYoiFzxsCQ8RUZbAueNcxCmW5R5XYO1yqmBeObla2vn4MJ6BdlIFOIAhFL3PUZgy4CLACRmIqTgeXejLdtqQPNUHbFl6f8Om/+DMOJ4d2BWdDSFaWlkubP71LKqauC4Ps29c2G/GL1OKLhmV+8Tn0QNhCdkXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkc4D9hIox4D1JOax8BU77sr6V9Pz7ffdkrNzEYIFhw=;
 b=ABxFLO9mLy+OHHJ/Aw8RnItRxmZntJpyGAmdTywV/0WURA1RpRL2ldAKF/iq6rjHNRSsCgex+oFE6S21xr6dpREp+KLvCw2H5EwA4wl34xV/HcXMUQJZmgg+sgYTTnOVCWpRfWElAyw1IJGif6Wv37CLfnLB2yCY9ILbBRsI1OunJZvkaIS7DyJXJ3aKTik2w/vLwsuAPOCgSMl2xlj/42wFDOob9q27nHJsgBe6pvf0bvCNr3MXmsu9D9SmVoCRjcb0HwsNZccJMdUW0bczZx/tzv6OKSJxiTN9Th84Tmcz/axVfwM578Mcjgqp7rrrUo2WI2yxZTey9VS0sKt/WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkc4D9hIox4D1JOax8BU77sr6V9Pz7ffdkrNzEYIFhw=;
 b=m6lVtMDHiDzurKFTL+Kl3oCGU2lSIqe7yWn5otNUvzwxkzaHiamjf1TVF5XmQS2XxzSu0YVhnuDn9Ryr++tpZ3BVSpZDvIrRkR+IasjzKSL1FEyBkh8ASo1S0X49I/vxx44cwJx34vM/qVQqYj7lKSmr6641h7TeNnlbRO6zUQA=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.12; Wed, 4 Nov 2026 00:12:54 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 00:12:54 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: Use the correct PHY mode for USB3 PHY
Thread-Topic: [PATCH] usb: dwc3: Use the correct PHY mode for USB3 PHY
Thread-Index: AQHdWi1Hj98mYIgc2k+6vNVhcoWRaLcdLgCA
Date: Wed, 4 Nov 2026 00:12:53 +0000
Message-ID: <aup282PqM5c7ks4J@vbox>
References: <20261012093704.2762263-1-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20261012093704.2762263-1-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|DM4PR12MB6110:EE_
x-ms-office365-filtering-correlation-id: 2f8b134e-0c40-4e23-5d9d-08df3a085f19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10067099003|261102123227099003|18002099003|22082099003|38070700021|56012099006|261021121427099003|261022105027099003|261009223027099003|261028144727099003|261026140227099003|11063799006|261021123027099003;
x-microsoft-antispam-message-info:
 195Gl4+Jt9IH0Tq1dL9ppCJNQX9qzlzLAvNW4WzD29OK6ysLNeYhVlnBVaFZbBUzuGF+AIWu6Xs93rOvjr9QlsrNbwds6uu2wJ1J/Ae8SdJqQspKN16Zs8pH/509iPwJ1aynfYaKQuKAE/AHV4OV7KRRXBa1PYhaVLoFaGG4pR4rpq2ne4MKEfOe/xDHtvncrGPzY6vHHgecbMi8CtYuELRopfX2Sx02pBfEvNYN897s1gNoR3K0L2FA2DRp9jklX3qPz6E2LmzlKGlOU9mWKgCCmBTHFq50GDgFG6GE8NCPZ8aXmqahNq8xd+/Y3Jk0XNRjtcXQGCwrXNtiI8Z5auTbuZUenYOZ/gTp2cj0gd7LiqVslc1Y1lKrjxNc7DoSB23vwhTSHJTzjCgix2swaXzeHYilqx++NPmNB8mtIXPglvDEo6h1ag39ijaCH92uRuevVN3JJN/QJmgKJulcyfl4yPJ8dmJhhBTTvkiOA90nimiHCaGuoKWyy7MRdUIXmumZuXRnHLLoMH0gbcYKK3UZbqCzpo6DcjuVvixOYhSq7vzvXoxd1xPeOjwiR89iPhe4sEKSV8dIHo7cUikL1G6eErlOAh9ewDgjo6NLu2JJ2xO4Gj+cr8WY9MrbHa29IAKwkqJ9rsO0g/odPD0SOl3ifREFrtrtMs3zwwe/FeetbGPe4l2fTjUAdQZQGJfF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(261102123227099003)(18002099003)(22082099003)(38070700021)(56012099006)(261021121427099003)(261022105027099003)(261009223027099003)(261028144727099003)(261026140227099003)(11063799006)(261021123027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aTEzTStTZUFqQ3EzbTNwYXhzbXlwaGNhUUxDRjNqZ3IvVW44azdjSlJHc2NO?=
 =?utf-8?B?dkdMZ05XcnludmFCaUFuQmdtTlA1RDI1dG5naFlUeEtjVzgwaFc3V0VrdFlj?=
 =?utf-8?B?eGtCcE5INnl6N1BJZGNNMllZTWduQzNXMUpVUmI3dEYzNXduVVd1SEpNVTE2?=
 =?utf-8?B?UjhIdThpdktWOWl4SHM2OFJYYVBPVzVwdjBYT2twUGVWald4NVJtaXZSZjAz?=
 =?utf-8?B?M1l2WmVCQzhzZUY3NjhLcjUwWVREemVZdUpFdDhIWWk5MUxEUUZjelphMFV1?=
 =?utf-8?B?bDNWMmNkUHFzc0srM0FyWGVKNVpaeWRUcUZkYUlGRFdCbEU3SXVkSU1nWi95?=
 =?utf-8?B?azY5b0pobDNsWnRDSS8zM05XREgzRjVBY2JZUkZ2cFJtNVArS2RQOU1iVjYw?=
 =?utf-8?B?d2NDaGo0SUpkNFNvYks3NzArTDhEb1BpNUFaVVZObmZETnZtM0J1eU9LMHl1?=
 =?utf-8?B?YWtaMXFRVEh0TXlOUUVabnlpZGNQUGlrejNhVm9rMVplRjR2ZzNrOW85WUpX?=
 =?utf-8?B?UHdFemxMQ091bGxreXBYbWhQa0E1VXl3dnhETkkzbHRaenJxM2p1M01Tak8w?=
 =?utf-8?B?aERKb25WZTFnU1RSQmNoMlhwN0ZTYUd5VlpsZ2ZGVVlOM3FRUmdHUGJlc3pj?=
 =?utf-8?B?U0xiMDgvMElQWEswaTdYK2t6RkNlQnJoTWllZ1dkYUhFYnFETTE4VjMwd21a?=
 =?utf-8?B?cFpVVzAyN0RPM3NQS1dOa3pZamlNSGUrWDB5OWRvaFN0RUtyRGtMZzFRNWxy?=
 =?utf-8?B?RmFOK1VhSEFteENVV1VYS3kzOURHVWx1WHY0UGdKMWhuR0gxcVhLRSt0WmRG?=
 =?utf-8?B?RHlBay80M2owSk1uZjkvQ0NVY2Q3dllyd1QzbkxvVUZETUQwbXRKdVJpelUw?=
 =?utf-8?B?dVRxRHJ1TVpoV2RJNXFMa2IxQkZhcXo1WCtMYXJCcEV3OWhYd1pzYitjcW16?=
 =?utf-8?B?Mjk0RVlUdThCTDNXYzNuMHg0NjBOL1h6NW1UTGV2eThJRTZvNURaQWlCMzBJ?=
 =?utf-8?B?Q0FTMWQ3bU42VHFiZWlGTmt6SmJhQ0FDSGNpQUk0eHdzcTRNekRqSlhwbkFZ?=
 =?utf-8?B?NGsvbW82NUdSN295VzljNmExVHVrVTBlL201M0lUNkZDYmZZd1RTTEpRYy9m?=
 =?utf-8?B?MFNNaGc3d0Y3UmxYWHdSN2o5M1VBMVlUSTNqT3MzR0s3Q0tETSsyOWdSMVpk?=
 =?utf-8?B?VHhoR1ltTlMrUkFNYWM2NXc2VXdRcjlhNWdFU1pab3Raak14M1AzVDVGdzM2?=
 =?utf-8?B?UERrSGhMcTVLcjJuSjZhK2F2TDBXbU1iYk1WNE90eWdqQnNJL05TbWNrbTZI?=
 =?utf-8?B?QzZmMHRyZ3hJVTFxZi9FcnFWV0NlOHN1OXQ2ZG53cHRwS2JFdGRibm54MmlW?=
 =?utf-8?B?ZGFpQ0l1eW1PSFhicFpSaEFHQXdJL09qc0trVU9aclhnbjhSam00TkxKSjFM?=
 =?utf-8?B?YzZkQ1lmWFhDYWRlRWk0dkI3eW9hUEhDVDVTQ0R1Umk2VzdQNkNPYjNHZ3E5?=
 =?utf-8?B?b2VOU0ErNVdnSUtYcDZLbm8rUmJEZzQ5V1VSVUdjczlKTStjTnMvTDlSN05W?=
 =?utf-8?B?M2lvNkFvQ0xRdEhBNDl3RUludENKTlBNWG9CSTNqZzk4U3JEUDB4WnZ3b2VR?=
 =?utf-8?B?T3RXTmJrVEtVYjltYU1SVWcyMnpLc0tsZEU3WHRYV3FqZnpjeFoyTkU1VWVO?=
 =?utf-8?B?YjhnYWVZalBpSkR3eDQ2UDZKVVRoeTFhSElqMUYwZ2NoVTdEU2hMdjRYdDlT?=
 =?utf-8?B?VjU4THhaS2h5VG1QTTJxODgvbGxXZ1RNeGd5WmFXcUxlTUM0SVlGVmdPZkQ1?=
 =?utf-8?B?cDVQdjdFdzNJcDJSbTVudHdmU253SmZ2d0NmRk13bXJIa00yS1ZNaVExZzN1?=
 =?utf-8?B?b2M5dEZKSDBKSXJ0bjQ5N0xvampaYWxUc1dOdHkrcWN3SENMUG9vQjJ5NmtO?=
 =?utf-8?B?L0JLVytCNTQ1cG1mTlBvcldEa0JuOWwyeGw0VlJoZFdRSXJlWWFjQktSQm8w?=
 =?utf-8?B?eDdraGJvLzRtL1BwaEpOa2hBN21GSnNWcFVXMU9vaG5YNzVEbzZrSnk5OEZM?=
 =?utf-8?B?NS9WSUVNMzdmZ3Z3YW9CQXNRdjJEL1NWZ3Yxbjl5bWRuTmNnYVBSRVRIYXJN?=
 =?utf-8?B?YmhnUEdSQ2NjWDZ1akhuWUxobGpiN3QraWJicmV5UitkK0YvOUxVdzVQNXNh?=
 =?utf-8?B?N0FxL01OdDZlcEtWQTZ3R2xyWk03bjZqSVJFSWRJYmNVYk1KMGhabWRYL1d3?=
 =?utf-8?B?ODFWUlVkeVJ3SGNSckwyNExkcEsvTDRnK1h2T1RCZmxTZ05FWjZJaEdPclNB?=
 =?utf-8?B?bVhxWWttRExRREVTZkxNMGcrOGZYM3NoZDBPWENIcVI1WW9oOEVodz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5FC5A8EF3CB6B84FAF2C33864D07764F@namprd12.prod.outlook.com>
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
	LHd8NF2z/6Vfev7iUbVGdrcFlkRoIUg6kFZJHgc0l3AXzBqJwoJbUywvViooinOlgYFQEkjtMvy7elhhKvwYP8TCtRR3/JDlI+3xN849+R4HUjhU6eCTkZ3xT0wJybRsMwANn3mE1PqfqN80Ncir0O9q34o5C57Nn5qdxV+COzWi1PQwy7GoIUoPSSKupagfa6dCOiDbARo3FvKCa522uW6rZIDYHbbTN80TT6srpzOV3hFpsAJs3E97661YrhRJWvRjon85qQzbjK09JqduZZNQOAsUolz1HeKJaHyMG+trBKvrrxFnS/cTNSsyOT+JzjEglAjmPndRd0dVE5hyFw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zK27YWQiA5tFMT9I4uglfGAHu9jXNcvyG83LQHzmTgWiNOVxb2Qknvcm+wFkx1A+iq88zHFUnAfDTLdT9Vw8Ies034GRuH9gRIoyXMCKYK5M+EJJE3nYcWYm8HT8nGdBoglBeSXbdETHIbrk2R+a+P61T6o5HAMrBk2IEl3PDwcpsIJyjf6o05W1ylWhJCq/BCGl2BFQDaIs/a+DFIbMJVQkZdbeKkCcxt9Wtb1xl9GIQm+MKC5NQmzV5d9DZF0DefiWCkuhd/zHCMcQvWBDKy5ELMHGxCq6zVh1WWHZIiMSAhUgI/Zd3CrGAozhjcBH7nQB5FXZYJoGRxBhYw282rHTMOUmyHW1otVcBNHNkZzNcnzXyFnyKQCG0EMA53OMAa9iJx7cqZCJudJpXDJKOnaxBQcd012kYF28urQyE8nBXpkDYcsELPwxcWuE94CjC2XzANcVO9KQS2RK2nNEq9Zvj+XJsdXMryO/RwSisiboapsFZpqVPRS0BkS2iQX2ieNoBW6JzWfKPu17HMCZsBHctm06SQ6kJO+3oNa7fbIHLj98lJTRYok+qNGsq3KLfE2ZHEKFzRDb6XZYQhOlLunj6TTAPT61UA4ZqhpWEk1BkQNXn56dQAi/3yoIN8hpDhwd8FRJ1ZT2z40fgrq+rw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8b134e-0c40-4e23-5d9d-08df3a085f19
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 00:12:53.9212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ss7RMzL192wwokIRyewtG3a5EY7gylWgnlETOR3nT/k3e3nKj9YC330FkMK4fFnY0lfJMnFksSkkQqMQQIN0BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110
X-Proofpoint-GUID: u9sHNSoqi4esrtWBOIGXjKpJIcOLJisY
X-Proofpoint-ORIG-GUID: u9sHNSoqi4esrtWBOIGXjKpJIcOLJisY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwMCBTYWx0ZWRfX7z2wh71mdnpr
 XuddbJxTE0CZhdbDQ99kK4cbc3SWexJD1WnAAsJSJMd9Yq4o6EFot5I2sK1+Th6xg5Gx862ttL+
 Z1b0BvGWR8ELdk8kV1YsFaM7T+t8jbkslwalTiMN4OevANqTVJURCyCpEFmSfyJsYkfv2PzsiIE
 X/qM22gj11ZcFe9WNR+L87VNPEg+OW3kKbPB3tKy4zORMn0XhH05IuVQ6potCf06SxTPBqXrjGW
 nqz/SOxwk2CqEd5gnIFTeSGpQptpvqWtaY0S2QTZNY9aVc0VbqVrepn1doBfXaGWWR0AI/waX/N
 cby9ruXRTF4SLMCp3xOH3/J+7JeoLALYGUGjSbxgySPlX7l+tB7rZTPz0XukSfAeaa7K0xU2Olv
 rVSYp9WZXMHbxCPOeOicsNfAjfmk+09tlG4N3vhfcOB8abxJrZr0dGoKWOY3Sd87KFvlJpvzQUY
 I/E3yNLcP4CLXNaRD8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwMCBTYWx0ZWRfXxp9xS/nc+DSK
 pPmlK6qois+T5bEccCO51vB0YqIOhwCHe+XwAXyLot9OpYx0UYQ3NMBQXeQnw1sYk0TjO0VQJGr
 wXUQWNHotm1sE2yweEXZL++TvaLOIN8=
X-Authority-Analysis: v=2.4 cv=ce5HPXDM c=1 sm=1 tr=0 ts=6aea788c cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xjVrz2psbMUDobTJqgAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611040000

SGksDQoNCk9uIE1vbiwgT2N0IDEyLCAyMDI2LCBQcmFzaGFudGggSyB3cm90ZToNCj4gRFdDMyBj
dXJyZW50bHkgY29uZmlndXJlcyBVU0IzIFBIWXMgd2l0aCBQSFlfTU9ERV9VU0JfSE9TVCB3aGVu
DQo+IHN3aXRjaGluZyB0aGUgY29udHJvbGxlciB0byBob3N0IG1vZGUuIEV2ZW4gdGhvdWdoIHVz
Yl9hZGRfaGNkKCkNCj4gc2V0cyB0aGUgZmxhZyBjb3JycmVjdGx5LCBpdCBnZXRzIG92ZXJ3cml0
dGVuIGluIERXQzMgbGF5ZXIuDQo+IA0KPiBTb21lIFBIWSBkcml2ZXJzIGRpc3Rpbmd1aXNoIGJl
dHdlZW4gVVNCMiBhbmQgU1MgaG9zdCBtb2RlcyBhbmQNCj4gZXhwZWN0IFVTQjMgUEhZcyB0byBi
ZSBjb25maWd1cmVkIHdpdGggUEhZX01PREVfVVNCX0hPU1RfU1MuIFVzaW5nDQo+IFBIWV9NT0RF
X1VTQl9IT1NUIG1heSByZXN1bHQgaW4gaW5jb3JyZWN0IFBIWSBwcm9ncmFtbWluZy4gRml4IHRo
aXMNCj4gYnkgdXNpbmcgUEhZX01PREVfVVNCX0hPU1RfU1MgZm9yIFVTQjMgUEhZcy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFByYXNoYW50aCBLIDxwcmFzaGFudGgua0Bvc3MucXVhbGNvbW0uY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwgNCArKy0tDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4g
aW5kZXggZmQ1YzJjZDM2YzU5Li4xYmI4N2EzNzA3MjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
dXNiL2R3YzMvY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0y
NTEsNyArMjUxLDcgQEAgc3RhdGljIHZvaWQgX19kd2MzX3NldF9tb2RlKHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yaykNCj4gIAkJCWZvciAoaSA9IDA7IGkgPCBkd2MtPm51bV91c2IyX3BvcnRzOyBp
KyspDQo+ICAJCQkJcGh5X3NldF9tb2RlKGR3Yy0+dXNiMl9nZW5lcmljX3BoeVtpXSwgUEhZX01P
REVfVVNCX0hPU1QpOw0KPiAgCQkJZm9yIChpID0gMDsgaSA8IGR3Yy0+bnVtX3VzYjNfcG9ydHM7
IGkrKykNCj4gLQkJCQlwaHlfc2V0X21vZGUoZHdjLT51c2IzX2dlbmVyaWNfcGh5W2ldLCBQSFlf
TU9ERV9VU0JfSE9TVCk7DQo+ICsJCQkJcGh5X3NldF9tb2RlKGR3Yy0+dXNiM19nZW5lcmljX3Bo
eVtpXSwgUEhZX01PREVfVVNCX0hPU1RfU1MpOw0KPiAgDQo+ICAJCQlpZiAoZHdjLT5kaXNfc3Bs
aXRfcXVpcmspIHsNCj4gIAkJCQlyZWcgPSBkd2MzX3JlYWRsKGR3YywgRFdDM19HVUNUTDMpOw0K
PiBAQCAtMTY0Myw3ICsxNjQzLDcgQEAgc3RhdGljIGludCBkd2MzX2NvcmVfaW5pdF9tb2RlKHN0
cnVjdCBkd2MzICpkd2MpDQo+ICAJCWZvciAoaSA9IDA7IGkgPCBkd2MtPm51bV91c2IyX3BvcnRz
OyBpKyspDQo+ICAJCQlwaHlfc2V0X21vZGUoZHdjLT51c2IyX2dlbmVyaWNfcGh5W2ldLCBQSFlf
TU9ERV9VU0JfSE9TVCk7DQo+ICAJCWZvciAoaSA9IDA7IGkgPCBkd2MtPm51bV91c2IzX3BvcnRz
OyBpKyspDQo+IC0JCQlwaHlfc2V0X21vZGUoZHdjLT51c2IzX2dlbmVyaWNfcGh5W2ldLCBQSFlf
TU9ERV9VU0JfSE9TVCk7DQo+ICsJCQlwaHlfc2V0X21vZGUoZHdjLT51c2IzX2dlbmVyaWNfcGh5
W2ldLCBQSFlfTU9ERV9VU0JfSE9TVF9TUyk7DQo+ICANCj4gIAkJcmV0ID0gZHdjM19ob3N0X2lu
aXQoZHdjKTsNCj4gIAkJaWYgKHJldCkNCj4gLS0gDQo+IDIuMzQuMQ0KPiANCg0KQ2FuIHlvdSB0
YWtlIGEgbG9vayBhdCBTYXNoaWtvJ3MgcmV2aWV3IGNvbW1lbnRzPyBJIHRoaW5rIHRoZSBwb2lu
dHMNCnJhaXNlZCB0aGVyZSBhcmUgdmFsaWQgYW5kIHNob3VsZCBiZSBhZGRyZXNzZWQ6DQoNCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi9zYXNoaWtvLW91dGJveC0xNjc5MDZAa2Vy
bmVsLm9yZy8NCg0KVGhhbmtzLA0KVGhpbmg=
