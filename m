Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793758482;
	b=yz33sAN+mAJnSSkkWokmsIYOVuIevxrlDdpri0WaClv4kU1Y+XVf5bJS1uIPtqarNwzD
	 s5oMWyOTkL7lHtEKTlFVFM5eLVHhXqVBUXbRGwahyKoLM7ePbNO+VA5etfkoA3/8rkbDM
	 t4VE4hIvnneOfIRHSVv1VUSeD4Ap50MBjmr2OcP5IQ/tIfWtFmeuQ8Z8uyvYe5MTfhX7o
	 ByHHrtUYXUu8Tsf4KcwIA+TH4EoUekyoT6C6aWTJnhLhzsL9Uua57WcDahdW3nLks3oVB
	 tNUSG6OF7FNJYZhiv80ctelK7zMqMX2bN3y8yLWm6UjmF/Xu9yLMLCn1XBF8WjTLfAw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758482;
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
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V6LZBw5pdnRGnKNmJ/RVTkuw9fXbhZYMD7GwEqlZzgw=;
	b=2b9ugVUUMeXJyENYL4WGSiqxXcDoLGoJfpBMTG+XhKku8dSVWO8EVkE0SR2Sfwh/RZ6R
	 WqruSQyBwFvGR2O7CU2/LFHuIHLXsurBRaApxiXu5wmjdkUpvAN4f/i/ef5XpE8AjKNLZ
	 riCNG+m2f4IlQ4N6KppY6SYQBV/X18VRDZdnIMNIK4WsmNg2ZAUmwo7IIURQdeC6u24J7
	 xXZRbPo1HFpDnxN1Th+k56mCfK2oU/Ji1L8vzY61CpvEV7m7rcuLBmPMgFWT895/ipbHo
	 cdgJdOEX0J6TwF9ypXTRS0B5HM8YyJaI44vPmnh5EMwoP3pm+F0Q03vl2LVep7XVfLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=VEE32DfM;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=KYxizYcG;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=lHwqLINm;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC992606A31B;
	Wed,  4 Nov 2026 02:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC992606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=VEE32DfM;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=KYxizYcG;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=lHwqLINm
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40S8iZ253580;
	Tue, 3 Nov 2026 18:14:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=V6LZBw5pdnRGnKNmJ/RVTkuw9fXbhZYMD7GwEqlZzgw=; b=
	VEE32DfMVmjLdM60ioWN8ffpeqSDtqdWHzqAPIGO97mHv7j7lKUlE/YjkPNE8vLp
	9TAJfwP8vl6VNnRGjaoMw1cxEsyKCo5lJtf3EPh+SqX3wwUi70u4Wdpgd1UyXY30
	LKqX5FMiIJXPq3LFjsxa6UMpEgtg4/qa3SUFeLlV7jU/jn5ySwKxeUHye2I0HOg9
	mH6rnz4On4CgFr8lBe40t3w22wFIQdL4kPUtdY9J8UrNwMha8JzBP+lBT3UwAlAn
	g3voS4nWtUeb1CbohITw6FepVASUh40U6sc4QQ0YCzNhbV/ik92b4H4NwVmmixab
	eSe4/5fxJXFiAvQFseekrA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hq5af3udh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 18:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793758467; bh=V6LZBw5pdnRGnKNmJ/RVTkuw9fXbhZYMD7GwEqlZzgw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=KYxizYcGd2eBtWNaREvVZUV5xXOspPnQKXhCH/53faFsrGH5TN/V/zQWl6S6Yeer8
	 d7I8gVml8tGaJGE1Hu7wVQ5NTIEdcbp6Qvbc7yc4bG24oRS2jIFfynX2Md2iZSK9H7
	 uZXN5KwSYoxhwP0qKatBnlLOPxjuFBkVUMHHGPr5oGDTuu2lwF6jsBo999PFgsHmrh
	 YKcbRiEJVkcZ3ZSEMazfXOMuQNVGd8AkCeIu7cFqlMTZQvJ23L7ZOBSDWBz3inX4oZ
	 RyP1s95mtLl+i+KQrm/MRuf22lAn+HxPQRpcjYvXDGHGaPyavuQXTWc7qwACMmVZi0
	 zGOCB0e8rXSyw==
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1346C4048B;
	Wed,  4 Nov 2026 02:14:27 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id BB93FA023E;
	Wed,  4 Nov 2026 02:14:26 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=lHwqLINm;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00102.outbound.protection.outlook.com [40.93.13.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5D51140140;
	Wed,  4 Nov 2026 02:14:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXJ7edu27kSIMG5yk2XkxU2LKgS8A/3y9frbEg7DP3FcNGVXrLpC9Ik0TVxgl3FUVfuZMvmFxf83BO7WND3BjTHtJXppMx376nFpcdAoGG8p4BktvkH8Hgh3ATFqp/igBx7L1PPAjkaMIoY+LvqfelOimT5pZQIyFlzjymo5v/k/VAidZf/ha1dkPFLJrWYmxqIoQa7NTBjAB0QIgzjACI0yHyGI3XR54tAOoehKOt6po/1wmiAWLeNMrDo+AIamh2qImCfFP/tMIzQm5XPggRw8jc3yOphSI91yJKVlROC3UnZfvXqKULlYqKqQopQi8Z/u6qcDDwQ1mGn/h9pfMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6LZBw5pdnRGnKNmJ/RVTkuw9fXbhZYMD7GwEqlZzgw=;
 b=HnjUb1VORgOUvwvJMWzCDnylEnOfi5AxsoigV/lXQ2jzpcWEeCs+4C1ab5Q3G1I1TcfZ9diyfM6O4IKFasAulxR6B8EHGGA3i7atGAHnRyiPCSXvuLLY9iSkOTW3QLGE26Pt9xg2Yayi6Lo65ecdM3DMI1XyPJ/J5RTOcYY9eSQoxzhUX/k4L9FUVUeQS5I6TyP99il/0x5EEjhUg3Xqu+HAeVq4crsGdDSqBKaJh9e4p995ja5nedfjMuhT6o8aG5vtJAE6SmMHij4gR0MdvStp+tWtS23nnlt95xIV6EAvqmxmqa/ltbOEdkZ4GJBD/HNjK82dICDNU2NViu4XRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6LZBw5pdnRGnKNmJ/RVTkuw9fXbhZYMD7GwEqlZzgw=;
 b=lHwqLINm8tUW2jMInUWimo+t05Pa+TKXERx0WgAP8Rv8Oqt6WpQCB6VZd1CS7Gz1D1JaA3dUVSlDGuAZn/jB8mfPNLfNuNHLQwbVXvADQW4qpBEdrddpw6+GuluEM4eMPJ7C8OPJ5NdmyyIEPjEcC6//47WCEdPBJGjLf1mzNCA=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by MN0PR12MB6079.namprd12.prod.outlook.com (2603:10b6:208:3c9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 02:14:21 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 02:14:20 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH v3] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
Thread-Topic: [PATCH v3] usb: dwc3: qcom: check for hcd in
 dwc3_qcom_read_usb2_speed
Thread-Index: AQHdYeXgns+l+gxbPE+sphlEecKUcLcdQH+A
Date: Wed, 4 Nov 2026 02:14:20 +0000
Message-ID: <auqUaK406nZJNIzX@vbox>
References: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
In-Reply-To: <20261022052602.2335652-1-prashanth.k@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|MN0PR12MB6079:EE_
x-ms-office365-filtering-correlation-id: bfaae84a-9cb6-43fe-15a7-08df3a195641
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|261022105027099003|38070700021|11063799006|56012099006|261009223027099003|261028144727099003|261022075727099003|261026140227099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 wUAZPBdhZfP37kM1MRr5mI9yjf65tejh7aBmzxyWPak9Tu0fu/LtMVlm0uan1P5rr4tDmbm8ZW6+U6cSxjsVIL0X/cTQb5PsiZwB02bRog7MdxuavonuKhi9q2qVrMdHFHaM831kQ6ocjUhOhzW/uNvxh5DQhNXAPku6W2a3+zQ0dXSB7B2VWsS46k1zV+qkUKqB8hTVPBDhwdUAAgYLDIsyfg7se5hmrvavEb3fpsCOkKGg6ub1+rah+NKLZv+pRx2T7pnBPXTo/4TjCrAggRwqmNix6s74lWp2xTGPIMAGDJUnHW51wvEmROmUERejXSI8tzIgMVaI2PRbhy9B2ADay4QoeiBPCvQ2i1Yt9lel35DmQiMxDh5OfX24l9sGMoCl0bm9QlY6FFQMk7U9OPAegisEBhXjFYklknTYbwmkPbij7Jv62XqYa6xLq/KQ/j3qtNCN0f7eqYW24Egyhj7AcEDsq7bHQx9pTg9+Zlj/+BhuNmL1Em+gCD0E4lDpCs5Moqh6Pd3iaXYyo3N75CU8QTvqzDuuP3b7ovHddetcEo0OmbLLHhQTPVKZ8cy60Gme5C9DrP2VeHO3tdYbGVADy9PNal9Ipsho5g9IBubNwVYotlvdxuHn6mdImKKwMxPEUbCkgSriytphppBzhF3DT7Yp0i9eM+h80uKirp3QRXUEjMn/YLzRfT+7x5TI/clNF69r7jnNIzFdAyzjh/1T+BaLiOjgOJq7AO6Zl1Y=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261022105027099003)(38070700021)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261022075727099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SnR1aUIzVzlDNjJkTFVzVW4yYWI1bUdBREwxeWtZY2VoaUpHRnN2QXhGTFdO?=
 =?utf-8?B?M3JSZm12V3lrTSsxb0IxNHdnZEN5VXF1SW1YbFgwRWpNL0ZEcGZrZDBqZkIx?=
 =?utf-8?B?TWFGSXJLeVM3Y0pJcGlldDBTcmdpT1ZNc1NQaWFCNGswSHA2ZnNNNHdCS1Rk?=
 =?utf-8?B?WlQ1K0I1dU02aFJwM1BDQjAvNkJSMVJ2MngxcDNKdHZsQ1ppbk9iSFBoZnFZ?=
 =?utf-8?B?OWpMODBBRWJLL1NveWpIOWQvV0F6Wmd2ZzBVV25SYTJadlovQm8xZnpERURm?=
 =?utf-8?B?MVlhNFJQejFyMGdjd2YybEJuOXhVSndRY1ZSOFNMcEVBYzdZdTFQQW9xN3lB?=
 =?utf-8?B?NzB2TEVvb1NjSWhOaXRZTnNYTDZSbTZPbnE5Z0hPa1RIdXk3NVRLRGVHRWVU?=
 =?utf-8?B?dlFmZEVySjg2RHVtTXE1RUlYcFZoZEhWdlo2Z1UzNm12RWNoRGpMODd5d21o?=
 =?utf-8?B?VFBXTWlzbm9ZRlJDcFNrTXJiZmM0aVFxYVNhOWpNNWRVRmhuK05zQXR6SE1x?=
 =?utf-8?B?TXVkUjlWb3BiNmxURFdxOERLNW9GVnRmaEZjY3k0bmZjRExoVjhSV1NodkJn?=
 =?utf-8?B?RkUvNC9GdHZCRXdRUVVRa3p2ay9VTHZWRmRBZGRMSG5RR0hRM0tXUVB4QkVY?=
 =?utf-8?B?azJJOFo0NHQvZ2Q3QUxoK21ISVJvVFA4aEF4d2owRjhWaFBJQ2NYNkYwWis5?=
 =?utf-8?B?UzE0dUVhMm5KZ1FDL3NFcm1mckx4Q1F3S1VyTUhLdXBHZkdDU3diUHRFTGRS?=
 =?utf-8?B?YmFWaW5tVTVVZlQwUjlYUlRiMlI2UGZ5Z05ybWRMWXl5SmhZc0t1QlRhWTEy?=
 =?utf-8?B?Z3RLaW1CMUJ1RVQvRDlwUkJTZStvMFNtWDhicEhjbTQrZXdtSlMxSnQ4NEtZ?=
 =?utf-8?B?ZTdsRFJwRzZ3V3J4QXFQSUVSYjRhR3BGbWI0QXlhdWp3REVLY2ZiZ2JTd2g1?=
 =?utf-8?B?YVIwSzVmR0FidFVscHRkSUVyRzNtT3FabFVJN2lRUU1kMEF0YjNKSG5sYmE4?=
 =?utf-8?B?dFJzL0huNjBlWnBGei94K2ZJT0g2RC9NaTJLRW5jVzVlVTdEVDVKZ05Za3BC?=
 =?utf-8?B?bnovdDBFOVpUUVdmSnRtOHh6RThTT2tubDNqWURWQTdVWk9WeDV5dDBEdWQ2?=
 =?utf-8?B?OHVkc3ZPNVltMTIvQUYvU2pCTmxxeG9RVlJXSFZhZ213Qm1CeVQ2YVVSRHZF?=
 =?utf-8?B?TmlFTVVaV2NGTFpTV0oyN2Qzb1dST1FSNWU3SUxRM0ZSaDlKYk5nYmQ1b1Z1?=
 =?utf-8?B?bUpEQ2FXUlp3d29uYU5PSkZab1hvVDlrckg3bERPL25XNGZia2wwZStTUS9r?=
 =?utf-8?B?UXBaejdXYk8vSGhOdWRGcFUyL1kxUitSRDduaHlmOUNVY1hmNnU3TlVHdDBu?=
 =?utf-8?B?K1BUZzQ3cHBDTURoMFpYL0JmSisvNTVLL3BOeWtHUklrOHpKUGJBS0xDMXZG?=
 =?utf-8?B?SFo2d2d0QjNla1dyY25jYzBkcUtyelZJWmpBNEFGdnA5dFBEZDhwcWlWK3Qw?=
 =?utf-8?B?UkxRYk5YaXA4Z0lGQWVLbUlMbVgzN3EvSjkrd1REdEd6NVNBbWlwU1p6cWxK?=
 =?utf-8?B?R01GcUhFb1BTb0kvVXUyMkc0R3BlSGp0d0ZpQ1REMEVxV29tNEF5Wndyazhu?=
 =?utf-8?B?MGQxaGtxU051aTdGY0RWa2FoajlZY3Y0WkNyREJnR1VtRWU5N1g0aWsrVXpO?=
 =?utf-8?B?TGJ2enNpclU5WUI4dy9ncEt6NXVZMHZzUmV5N3o3d2Q0MWZHaGpOejhncmk0?=
 =?utf-8?B?NHVVRFVUcnlMMW8zeE1oaGtMazFvYW9mZDQ0cFpHNlZtcGtqVllIK0J1T1R5?=
 =?utf-8?B?MmJ4OXYzcE5UU0s2UEhBTlNYcUtuMytGekt0VDU0VWkxOVZBT1B2eUR4d2h3?=
 =?utf-8?B?ZDdiU0VMVEpsUUZUR01JckdqeDBzL3g3ZmpsdW44UHNrMGlYc3FqRlpIUy9T?=
 =?utf-8?B?L1AvKzVZc1I0V2tFVmNvRzEzK01MZ2piUFp0ckY0cy95UWJGbjh2WUxIVVJm?=
 =?utf-8?B?azJnMklqdTVubU9CbGtET1gyKzRpakkyN2FVbGxiYlQ2NVM0VEJNOEZGRXpF?=
 =?utf-8?B?eWpONmVKNGNxbWVIeG83OEZ2WHpOeTFiaHk2c0tmckp4dVdjNmhLbnJidFo2?=
 =?utf-8?B?ejEwLzlic2lXL2o4NndaNXFIZVdYRWpXNnM3ZlorUUorUjc2amtZOCtzeUdR?=
 =?utf-8?B?eDVybmhqQXhEbjZaenR1MFlyVnBkZzZkdkw2MkNiRG4yeUJIakQ0VUIyc3hr?=
 =?utf-8?B?cmZZekZPVXZNWUVLc2NqMzQ0L2NRb05GWDFYbzBZSm81a0JTamhxbko4WGo2?=
 =?utf-8?B?MUdhU0Q4OTUrc29MTy9TeU4wWGQ1UFVSWFR2YU1pYWZkeU9MU2VzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A33782B8CD45A74EB91B950BEE785146@namprd12.prod.outlook.com>
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
	IRxiRNDHlaeVqERKwqMwDxYDJyeX16beTDyQrNebztIZGLAMWjcUpTNCz1kWgWoRil7lhN4E4G1Gy7LEnvKbSsxaoI1Xqx/VXsJUJR1sj++vDOaQpXSRS+KJUi1vn5RC/2RIRyqnS5biRndupZ4dzUJYTIofm44i7aIXkkGsXpQEsN8bXeZ6+EOrRBPgJBUmRriQgea3QFZ3/SDiIpFY2aoXXz4qAE5gaTylYQlnYxJBbaCkOBfc7tDlnubsBHGdwajJj8P23wlACkOM8aQqzRfqmq/dafiv0bRRf3Uymc4wyEUFx5CId9RyTIqsoQ5FoGTBFRUlwR3DBUTG7TJ3BA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	oRt4ADVc7hgUbKgAGFDcBGhY5/eM/IgsFdIKK09i9xw7m01qKZFoEGrUTk6S6DoKWcAQ1MEXYIrb3OJJ41DNhLyNQEKtHXGRSybrCJds2jym7ek/OOeonujLqLF0pOy8BakhMFGGrW3oK7/VCGodBIAfyT5lgs6YCRfvfr42kkuEva/txLtNNnBouxsPMdGfxeRUIBue9DGQn47JAEh2u4RfpDqlxG0KFvtzc2t2hO52Fdbii/BPyXTmPjmu1tE/UGh01ZcerO48co2GD1nSf5N4hsZwCneOYqwWih+ZESbaqnt9F+wy8uxRlZXqjVfd/KBb8Ici+59PnLVvTrWbBvx40fijQaEcSKOGcwEqO6awC2NqTC2R+FjQmG+MysO98TqsqjRIXjzU8gCBmdYjDsi2v5r76nWPWWUVdY4deWRQx5y5ILRtrgxPsPNHbQrleVSKqqCoURpAD9Mr8iXzUbffFSatqDFQCawt0dU1Wvrhr4T2E6O4iUbhVHuIEaG6GNh6qh6cN+NzyhvzfueO5Q9dPbDcV3a8NHUQEhWyDNIq3GwrDAeNlHMdo3c3YMmzm3G5NsgLbgbFMP5Mh64XTvZ6SeuXzpqAIBJhbZE01gOVU/bT3LW0NDmZi77qNi/gPTs/51VGOibsTPfNUzs3qA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfaae84a-9cb6-43fe-15a7-08df3a195641
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 02:14:20.5554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MEua6uw6Qt5vPS+wxjksUaxp73rDUn4KOeb5sR6lzQQDIFtPuq7qW2T2/K9Crdo3P6Hf646fHRn0j5f06FA2OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6079
X-Authority-Analysis: v=2.4 cv=XN2l2ghE c=1 sm=1 tr=0 ts=6aea950b cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=EUspDBNiAAAA:8 a=jIQo8A4GAAAA:8 a=FKn2FxsCPcm1xtbU9okA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwOCBTYWx0ZWRfX1wy2VVAi7T/v
 bXgAnszsem1RUnHTw1m1ymP44XUtnbckPJeIqPu+rv/3hP+Mdco8BZwS/tydQtuJmDSzyzIUyfH
 bgLy5QUuS9Xt9y0RGp99f+WLrJxnXMg=
X-Proofpoint-GUID: d8YjZ-fWFc_JP7NsYMqqrCq3rDaEeyC0
X-Proofpoint-ORIG-GUID: d8YjZ-fWFc_JP7NsYMqqrCq3rDaEeyC0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwOCBTYWx0ZWRfX9SqQ/1LMkw8h
 +NdUkmnSZH6ovTlqFHv7kM2NckS1MeoYYjST8Eo5rlEeizUQYckVfwTHfY2Vgyd6p+IRnd5DCRb
 rgD4Lzx0X6zS56uDBKNvhAaZTnuwt/hl6++6ymQZZFZqhrhnr9s2H/0/mgs5iqdRIROkOPDhB4k
 bi7Xcol8VK+GPa0mRohY+50hZoOEtaZG2hWI/sqirZ1jXy/k3G8rNJ+pAy72jydfmlkPZ4gU+KK
 tHqmsGEQ9jzAsh3DP6ovnOe6H1y182KihEKteB98dkbquUNRsaTiPFKuc29FxeCr8k448vwJUs7
 kJWG+ISItWzOaupAwm/goJyX3E1LWpawIguhCnCqfunwr2GDv4+KxejZzbU0NdYdaLkIizNXTuM
 ondlGTxLPvbwEejnvUVMvK66pa53t7YcgM+PTG0HRjZfkhCAt6NfeN0r57/idGalVg772w5/0De
 X4UiXRc+trJeTjWSw0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 clxscore=1015 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611040008

T24gVGh1LCBPY3QgMjIsIDIwMjYsIFByYXNoYW50aCBLIHdyb3RlOg0KPiBDdXJyZW50bHkgZHdj
LT54aGNpIGlzIG5vdCBjbGVhcmVkIGlmIHhoY2lfcGxhdF9wcm9iZSgpIGZhaWxzLiBEdXJpbmcN
Cj4gc3lzdGVtIHN1c3BlbmQsIGR3YzNfcWNvbV9yZWFkX3VzYjJfc3BlZWQoKSBjaGVja3MgZHdj
LT54aGNpIGFuZCBhc3N1bWVzDQo+IHhoY2kgaXMgaW5pdGlhbGlzZWQuIFNpbmNlIHRoZSBwcm9i
ZSBmYWlsZWQsIGhjZCB3aWxsIGJlIG51bGwsIGFuZCB0aGUNCj4gc3Vic2VxdWVudCBhY2Nlc3Mg
cmVzdWx0cyBpbiBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZQ0KPiANCj4gVW5hYmxlIHRvIGhh
bmRsZSBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlIGF0DQo+IHZpcnR1YWwgYWRkcmVz
cyAwMDAwMDAwMDAwMDAwMDU4DQo+IA0KPiBDYWxsIHRyYWNlOg0KPiAgIGR3YzNfcWNvbV9wbV9z
dXNwZW5kDQo+ICAgZHBtX3J1bl9jYWxsYmFjaw0KPiAgIGRldmljZV9zdXNwZW5kDQo+ICAgZHBt
X3N1c3BlbmQNCj4gICBkcG1fc3VzcGVuZF9zdGFydA0KPiAgIHN1c3BlbmRfZGV2aWNlc19hbmRf
ZW50ZXINCj4gICBwbV9zdXNwZW5kDQo+IA0KPiBFeHBsaWNpdGx5IGNoZWNrIHRoZSBoY2QgcG9p
bnRlciBpbiBkd2MzX3Fjb21fcmVhZF91c2IyX3NwZWVkDQo+IGJlZm9yZSBhY2Nlc3NpbmcgaXQu
DQo+IA0KPiBGaXhlczogNjg5NWVhNTVjMzg1ICgidXNiOiBkd2MzOiBxY29tOiBDb25maWd1cmUg
d2FrZXVwIGludGVycnVwdHMgZHVyaW5nIHN1c3BlbmQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBQcmFz
aGFudGggSyA8cHJhc2hhbnRoLmtAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQoNCkNhbiB3ZSBh
ZGQgQ2Mgc3RhYmxlPw0KDQpBY2tlZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lu
b3BzeXMuY29tPg0KDQpUaGFua3MsDQpUaGluaA==
