Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794446628;
	b=0BqmH9NJ6bpBUCVHXeUCssEnuEyRVrRDDtqIWztM/xJuSANZSLbGQPeWa4wMrCoxU4Mz
	 knwz01bsTOwUHfWS/LU0eByWYepyQP28RV1jrLbK9mRzVX2m8CoTcj8CDuXsNVY11GXzQ
	 E1hKTA30uAjG0ay2xT7E4rb9erwKUjANCRhXwNq+OlhHScD/Wc6t3rmji1m+BsxQbwWdn
	 C7OjjA/HEMdumK7npYVTplql7oG9EuzQzfmcCXuu7k+fffHdN0tOypSMaxbJWqmpFaC1O
	 qY25W9lhh+zJ086nlYoaJEFVAGCzqYkNWXi9/FdNphtHo0jTfJZL02Kfe99CJtg+KDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446628;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zAFU2yfIOtjz4A0PeeORFLE2LwmRq/lCrsrPG0TmI7o=;
	b=o/slaL5aaOc51kw5XRXw/x8EikuCxUA1Rkq7AsN53MiX+qghAvafGCHzdMzCvfGK6+jn
	 gjiFvDAF93cSfyqstrf3K9OFX/qgqpBzquRhStqqdP/oC6dvS9MzmmcwOYMKMiategfYv
	 MSdLJoI9RYE00TNj41y/CWV6FocCrc00xALpMwEfHbB1eUbfVPS3fisjpKa8l8sqgbQ7/
	 ZUZEuVINXWf+4/JWIWaW/KNEVGV8hIJDvYtMwGpCu0RAGVf1STqFcR62w4n4jedqB/IHU
	 KvxiHWBOFlDff6gKTk6fJX3Rqql4DFYVlTskYZQyZimo90BLAVDnHdPWDIFlMXU+8ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=gtG+kZ9O;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=W+8BnNU6;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=uYzSVROl;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05113606A31C;
	Thu, 12 Nov 2026 01:23:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05113606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=gtG+kZ9O;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=W+8BnNU6;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=uYzSVROl
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMbw1V1629430;
	Wed, 11 Nov 2026 17:23:37 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=zAFU2yfIOtjz4A0PeeORFLE2LwmRq/lCrsrPG0TmI7o=; b=
	gtG+kZ9OA1Tt2GoPGgvIivNf8WcIrcubCwNwCAYjghohKNrA+pdvGb4c7vkTiHUC
	KS9pZ/J+GNN7s5CgR4rikACLe/8o+PQVqSZkUCCEfcnR9Xj6JCO/InzAMEgtaZIf
	R7DSVAhQ8ZwkWiHA4hfDy66T84Zdi4yuorqGTh9pmFvWAmWN1Oks6z0eRReBUGRL
	J0KClqAHSsONaDRRaGVktMZRAXgoe3/LlLsiFXYHO2M0uEEQDyof70wC1SI92cAa
	dOjJJMnwO4NAj9n7YGImlTnbEYO1IMZpmX9uRmQC+r3rMIQCoBqQzPGmcCETwX3F
	J9cargcdTCf4OBEp3/Yyug==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4hvv7x36hm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 17:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794446616; bh=zAFU2yfIOtjz4A0PeeORFLE2LwmRq/lCrsrPG0TmI7o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=W+8BnNU67WzkiXDkr790Sb5JnANnXH6KiRGMN7PJKp9NgrCeg347fIVD5wQKg88BL
	 dkmQ/36Vh7OBhjsa61rDLPjsNN6n3mkKKM7pA5ecPYqOzbi+Akf8mO68JyNuRsL3ME
	 ZQPSBwQwSaa1ujyCmWlFd6mEdzOCabikMXNQxK5YntLMS9BUVNWpUukPbMRMbOu4Za
	 e5y0cSx6/v4+ereRqUSOJGXClOvBl9yNVNZtxT0BDv18BuUAXdiqU0FI9+N28bdT0N
	 do92qIhUTMx8jnvY4W5XsbUhL/h9DW8NbF5QwUFEFFNfPKwgVZgavEkpxTvRnxmY5V
	 MkOSSaX9ZKqPw==
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1350F40050;
	Thu, 12 Nov 2026 01:23:36 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id A157CA006F;
	Thu, 12 Nov 2026 01:23:35 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=uYzSVROl;
	dkim-atps=neutral
Received: from DM2PR04CU003.outbound.protection.outlook.com (mail-dm2pr04cu00306.outbound.protection.outlook.com [40.93.13.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 61AAD40106;
	Thu, 12 Nov 2026 01:23:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CeIx+dWvMCBc9xH2EmtbqRlyN+38TkSKy9f9dNzPRp1fT9f+REmIGB5fzOvBjqRLkzbIRIEdph95HGdY2mnumuEDYV4xreOVBSVbtJnap3epRkIbXjTM0hlJSyP6DdjX0ZbfeWiNmwgiTE8siOr7yAUcH+A0WTTvLBMgcsfxO0dmg4xEyhzmziBrv0KQ0zJ/rwkJqs+ItIz8suNUazaqL+NlY2Jsqq1Dit8Ur/pqAZcwXThGb+vF7ZSl32hCZ5B3O+tpH6vNhfZWHWWvZP0/S+aKYkygq5to41fjFXyFKHqxxvAzGwNDkNyujuVLzw1er4VHRda+MnmwL6wsIPxl1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAFU2yfIOtjz4A0PeeORFLE2LwmRq/lCrsrPG0TmI7o=;
 b=IEkCPSnTRd0Uqu7uCbYLr4SfnI+Lv3NYY4/oYYenCAY4pz3I6kdSclVWX/fdQhGoBBipzFzwqdHud8ChvjV0FQPBB/Iid/DeZjBDWRQ0/hG1vT7UAw6aaa210kOOSKWr0Dd2gsbizOAtuAu0o/OxpTmUrqBOON9eSmArOcbFCM9viE233Uk63xHTprekJvOM9nNX1JeLmdpfgI+o/ZPSAbRynBgfLpETzD0eFWJnbEaGLRxmf3mMLoiHJwdKjwFwDTwMUdo2l7CXyKNoOSvi2zseCyrbr38CekTxZbMQVYV7j21fsmj9CK5ZayPMeuPucTgfY5vjbhjh6j8zB2/eOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAFU2yfIOtjz4A0PeeORFLE2LwmRq/lCrsrPG0TmI7o=;
 b=uYzSVROl1KiVyF4UW6PIoxK7JtV5iRIfBaahDuT8+PlYx0/fDtT+PGUhx/D2gw81V9TyWsNFXp6h9mi7m7QI+m1FrOGGfED2nM3YaDofpxg3Jh7AimAV4hF7QShaBAXFwhV+TEO1/Ha2suHXoA/teWBpJ3C7yEPyriIXJD/71XY=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by CHBPR12MB731189.namprd12.prod.outlook.com (2603:10b6:610:33d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 01:23:30 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 01:23:30 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Joonhoe Kim <26rote@gmail.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "andersson@kernel.org" <andersson@kernel.org>,
        "konradybcio@kernel.org" <konradybcio@kernel.org>,
        "abel.vesa@oss.qualcomm.com" <abel.vesa@oss.qualcomm.com>,
        "wesley.cheng@oss.qualcomm.com" <wesley.cheng@oss.qualcomm.com>,
        "krishna.kurapati@oss.qualcomm.com" <krishna.kurapati@oss.qualcomm.com>,
        "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
        "dmitry.baryshkov@oss.qualcomm.com" <dmitry.baryshkov@oss.qualcomm.com>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "val@packett.cool" <val@packett.cool>,
        "balaji.kalkonda@oss.qualcomm.com" <balaji.kalkonda@oss.qualcomm.com>,
        "tvlad744@gmail.com" <tvlad744@gmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in
 DisplayPort-only modes
Thread-Topic: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in
 DisplayPort-only modes
Thread-Index: AQHda5phCnqSESyCL0mplwV1pib5YbcpsaQA
Date: Thu, 12 Nov 2026 01:23:30 +0000
Message-ID: <avUU-99gu3YbNA0g@vbox>
References: <20261103135057.1682-1-26rote@gmail.com>
In-Reply-To: <20261103135057.1682-1-26rote@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|CHBPR12MB731189:EE_
x-ms-office365-filtering-correlation-id: 93cdc853-1419-49d0-b1ad-08df405b8fb5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|23010399003|22082099003|18002099003|261009223027099003|3023799007|4133799003|11063799006|56012099006|261028144727099003|261102123227099003|261026130827099003|261026121527099003|261026135527099003|261026140227099003|261021123027099003|261022115727099003|261022105027099003|261022075727099003|261022113327099003|261021130227099003|261021135927099003|261021133027099003|261021121427099003|38070700021|10067099003;
x-microsoft-antispam-message-info:
 iW6zwgCx9uDj7Cas/d0kwc54UOa+dMv1jxVz3JocawbUKsKf8fx5KE131i5U268w22iSyfJ7vKxJ9WSXyf/n2hkBW0YFA+bH/e1mXXVMYvckDTie+JLIV4EE0Tfz5dYK6Jdg0cPd8wKk4RmjW5thaWBIzqPm9VoNmSbZikZyAFw5OvNhf23o8jBxUI0Dpz4G4NDx6B5lh4QknFEHLdx7655lq74BZ63T08bFD+1DedfqELe0kdbIMks20xTyyFWgR9OqcVWh/DXSSdxvk2jRfQJIO6nW/oqQIYfMDQsb/a1utz/NxW9GfoB8oP8PbnVtNk+HqK/sj65H+Z0Fw3tRMPNMyD/u8LQC/GTYXDoMnsPqQ3EYxKUf41mzRlAbMVr5C0/8zB0IIkSnBaxdrUsbBD2CROO4jRvBF4Q/z2tL9eQIyxNW1FC2CybJRbWk9HrrG5+STRgPcSg1pE/vEoZIgE1roLgiyFMb2HVnnRDZsAX0r1LwPdhpucDwiXO1ZDVFhlHF+cBqeTGK1BFz28ArFcAvLgVZeeAnyl3zRMnoe53qP5YiwjNJcEKfIjvThVhUdAXf30+7CsYRoQKN+JbTw8doPaZgU80emSJG8z/gkeGSBH9g7wpKnoH/iTwsIX47QNLJuFkyf1qaXOh6DdImwTpoS7POaMhOkeHLXSQ4880=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(23010399003)(22082099003)(18002099003)(261009223027099003)(3023799007)(4133799003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026130827099003)(261026121527099003)(261026135527099003)(261026140227099003)(261021123027099003)(261022115727099003)(261022105027099003)(261022075727099003)(261022113327099003)(261021130227099003)(261021135927099003)(261021133027099003)(261021121427099003)(38070700021)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWNQSjdWQnpGSzRkSkZxTXpQWDMyZk9DOGhrMDdhNFVMSWN0ajFuTDdmTTVH?=
 =?utf-8?B?bS82OHJhMzJkMkp0Wnp3M09ZVCswTVp5WmVPZEZGSTFNc3dzZUVXK1BSdTE4?=
 =?utf-8?B?VERxd09UQytaZExFUlV2VzhXM3BaWks1RUkwNlM2K2o2YlZuNkZCSS9HUWVC?=
 =?utf-8?B?N1pnT2NYOXJNdEplaWZBRGFmOHQvTlkyTmdVazlCcjl2OXB1dFJvc0JxTGVh?=
 =?utf-8?B?NlNJUmtEVWV3UE1xQi9KQVk2Nko2NkROQndHOEpLQXFiYlZRNTJ6QytDeUxD?=
 =?utf-8?B?eVRBbXR5bGdSUXlFNjI0UXdZUnZIV1lpQWlvUmR3UFYvdmpiaHd4aHFsZ25I?=
 =?utf-8?B?RlNHdmRNNWhIQXdIVlJNZFZUa1JwYmd1MElPVEZrbElkWGRvS1A0aVpDU2tM?=
 =?utf-8?B?eGh6aDI5dU5qQ0k5TmF4Tzc3MXNJdWd4Z2pESE1MUHkvSFBRanlnbTNTNDZu?=
 =?utf-8?B?YWFsRFhLRVVyWGpvbXN5aVhrRmQwaDdhK2NMcmdrUWVjbVBkYjU0dWEwbVl1?=
 =?utf-8?B?bjdqcExqY3VlT2oxR1pXcDh6YzFFSTI0Q241TW5pRkJtRTl6SVpaQVRMVHU5?=
 =?utf-8?B?OW9hRVdvZ2R6dlp5dmtIVHpnWlBsOU9ub1NnS2Z2a2dUQ0lnY0Z4bll5STgx?=
 =?utf-8?B?TTNDK255S3JRNkEwNzUvT3MyRFZ5M1hYRnluNjNxdFRxS0o2RTN5WjZKSnRH?=
 =?utf-8?B?TGVXNjRsaTJVTjR2eDBQMjhyOFlsN2V0SFlBNEVQRHNHT2lZNkFNUXpxTmFO?=
 =?utf-8?B?QzBGWTFhTnNHd0h4dTc0THJRa3ZQQzA1NHR5WEhYNjlxTitpcEUwemQwT2FT?=
 =?utf-8?B?a3dQQzdydGZpOTdITDM1ejM5STY5STNKd0FXejNQNW5Vc1VOMy9UaGprR05K?=
 =?utf-8?B?NkdXNXVneStSNno4QVN6dm5DTVFieXZkUU81WXM4WU0vZkdKSVpkZkluaUdm?=
 =?utf-8?B?cXRTM01zYTVHaUgxOFA4N1JnY1gyaExvSFlxUFNxbnNLRnN0cHI0Mm9NU0hy?=
 =?utf-8?B?MjQ1YitpWkV4cTFVb2FyK0ZiRThEd1dQRVdOSDlKclRqVWFJOE1HTUg0aDZ4?=
 =?utf-8?B?SlNTbVY3OVIrMFJuMlM4SjBtb1cyY2V6V3F3NlY5eG1IRndBdm1IUXgrNmlL?=
 =?utf-8?B?SUF0UGR2WHBqUURyVGF5dTJ2eGhOOVZnYkthNVhYN01SRzhpZW1lMEdMbFpv?=
 =?utf-8?B?Zk94eitkdnZNVjN0SFJqVUQrWXFNd21sZTVHeEt6R3Q4NUdTSzBZYVVocFF1?=
 =?utf-8?B?RHR2dEhEU0Fwc3hTN2VHOEtlWjNYQ1ZVREo1RW03Z3g4Z0d5L2RISGt0QUwr?=
 =?utf-8?B?OVdYVjBQSE1hMUNLbEtBTGdSVUtuQk9QUVZWcEpTL2NSKzF5VU1wMVBLVFFT?=
 =?utf-8?B?cWlLSlBQUlF1dTVva3VpTWZVbmJRTGdRdzJIOXVtOVpqTVVicE9RcjlOMzRL?=
 =?utf-8?B?aW9ZeUpMalRyS1pTZzBNOEVKZ25JVUs4OGlnck1VU3BJamdwT0ZFVEhmeTl6?=
 =?utf-8?B?d2R4R0lOVXZlY0drYTBIM05DYU1QRFh0Zmh6VTBRRm9QbUdRRE54TnM5WU9C?=
 =?utf-8?B?bW51VTZxNW9IWXdrWlBwSEpJYlVQTHBNZzdaNnhGQzJldngrY3AvaS9xTUk5?=
 =?utf-8?B?N0tKSFdYaUhvU0pQWTZZckdETmlTYTRYU0MrUHlKaXlEREVPSzVtVUtzVlMz?=
 =?utf-8?B?UmU3VjI2MS90Z2E0UGJTR2M4KzhHMGNndmtYaVVrUXdEQm1WS1lvc1IyTENV?=
 =?utf-8?B?bmRBblJxTzVUc0VFdkpvTmlBbUVOYjRmVXJ2STg5cm9NazhyYVBUaStXRXhZ?=
 =?utf-8?B?QTBYRmMwKzNQb3R2dk9DSTFpenNJUFN1QUVIa01ORWpYRUhXTWpac1l0QlBD?=
 =?utf-8?B?dkZFZVlEbXVwZkxseElOTDRHUTkwaVFtZWl1R2l1THZYKzlhSTBLVncyWGlD?=
 =?utf-8?B?Wkx3MFJrbDlrQXFiVG9ITloyWDRTbUxrOXA2ZjM1WUFXSW03Ni80ZXZGMXp5?=
 =?utf-8?B?Z2RvbW00dzFGdDNlYXYvbEJKaStRemNzTHpvcTRTc1hRMWRZV1BsaWlpY1JI?=
 =?utf-8?B?cW1zSXdCMS96MW5ra094QzJkVTg4UXpOMTl2QzlCaTQ2QWFNTnhJLzVidWVD?=
 =?utf-8?B?TjdOSmZXaFRYaWU3RHVZQzB3RFhSa1pMTEpXNVpxWEhnNnJCdkdONC8rbTFS?=
 =?utf-8?B?QWNia2ZpUzJSZ0xlTVRnVTF5U3o2WmRIWkUwTEpEM3g1K2JtQkxWRHFPZzcv?=
 =?utf-8?B?NkM5cDFMWDJpNFZnV3RtK09yYnlTTE9NMmk5Ry92anlXbDNMc0hFcXRUTnZT?=
 =?utf-8?B?cVdDb3IyRFhEUG56b3pzU2ZvVnVrREp2U25OWkt4NENFZy85T1BJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C046C09405EE54591FB327E39EF4572@namprd12.prod.outlook.com>
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
	qDv4U8bLLWA271/otWvvpldZChLtlvYbBpzLjnGMp0uoFgNI7RPJQhv0DExeatr3pWO6kR3IMjAfYlf8ndCIARtq08d/pY2tfL+E9Wa5kGFRfzM8O5lt8LNHo87dyg0LGSTpEhvny2CmJCxCAlDS0eYbFwwY5KKfxRUzVAOXptgQMHQrXg3rpccCTivwZg2ibUbL9owN+1+WMMWv6+K2ts18Ri6BvTZlDBOnJkTvBO1Jp4IoVi5ehFcVYZzUz43Z/P4GXgJkbvqIgmpln0qMfCp/c+EPmfRBW7mOJztAW4Gzhpo+5tEpFtHfBICh5UM/iSs93Rfvv2iOtL1vf4yt/A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KeEfLPeweU/pzG9FUZR4IiSyI9UcgA0Rk5L2pnhMe5r949gGsOuM5hLai5XzXU+0B+jJDf/aDIugFGiqhZPIFN7ffkfjCMZLNjJKQwMCebjbNfTzTdSUxbShgElggHvB2/6eTLBBIRFVP0nlhSMiPQmaUSkrrFQiZkSRhGgN2krmZpukZl/97sPTjS+FWF1QXxidjg6D0ZL1WfWDmDxVIjzEXpWO/F7jpXWOulekSUOzdZE/I9+HAGK7p8ILkNuzdZe8Ezmsjf0wGyYtyRX53CS1QH2Xpver5TMjyupNUBF5XqjBhABhEyMWbnkH3J93hUj6cT4DqoP+j9uHWVjucducNVO/+3MULiKzXIub61Uh/ToD62iZextNd/TAy1HvaTJ0jN+qdEPQH7Y/thtnucX9AWEI4jVXlzDpruZeAElwogtdwdV6EmNrDgPSoI6drc8yLUhzRiF4c8teSk9HDt8ISBoptHJ8/j18PkgilJm1N0V7Y/ONudnGoDDuIOmUF/s2AytfvKsTadxRw+NJzxiLVQUyHdCW2ItYtjwoDYaP4ax6ul172cYLytEDNuXQrMw0l/1wxfYu75sv9PCYdNs5jZWbO8o3TdSR4/Hba0XvbOd9CInjPtH3nK1RS8Qe3OTQz962boxGZIxZf4VJCQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cdc853-1419-49d0-b1ad-08df405b8fb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 01:23:30.6805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4j92MnyZmFJvcMTgev/7dy3dbGoX/MeOD7maBsejOKQNZoMWzfTlo1gupVtZA6NqUWtWcyKSs3h6zb+lr6olGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHBPR12MB731189
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwNSBTYWx0ZWRfX29NWTMlIRHpW
 fvQwpXlu9QVlMg/P/KpGdlbKv+Jv72dNBma4GTo8DRze61F9l2CWciW/gsmwwi0Eg9PS+rDVTk4
 IC7vtKkd/8NwQp4u1lB6JAmI+B/DLBewasgI7JfcInQqqC37V9UssOYY3wgNk0GfiXvP1RW4Esu
 97ue8RZijmWtJQWSJx8YEEow26migR7Q8Avm6Wk3ml3te/vWKtT7R7WyxsAj8KO/1GIye9P2pCT
 FDymCeqUSkJancNGVcf8XWhXKb3PO0W5+tGZKMByKs4UF7eJoNAuk7sWjlvyCwi7k16p27pHTK/
 AwVytGuM8f8yK+pzCve6IzNvTWiUYil9vDtQnHcWVc3L6TlX5chjjha6zoURGum7OML7r3nyIKF
 odQOwaciKRbd6HrCx/QtODZmQsoOejizWKLQFct8oD2t6dw4ACfnHvIZQs3S2cN0FzWdPro6aZb
 Kls+xfkxSu4DmQeOdkQ==
X-Authority-Analysis: v=2.4 cv=IuaL47/g c=1 sm=1 tr=0 ts=6af51519 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=a_rLoJ_ekV4CP3trmKUA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: NIKoY8DFE0r5An1Sa6bsYhjKfSA3w3o1
X-Proofpoint-ORIG-GUID: NIKoY8DFE0r5An1Sa6bsYhjKfSA3w3o1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwNSBTYWx0ZWRfX3bF0tUCKXNEA
 tsqgxPKUHZ9cCWHKXr2X/SV2nc/W7w3oToiJ/x+6EXNlMon23/3eI8DfrSu7RQssw2BjRDfEG1Y
 YrLJpZ2aHdRAi/1Dn61cYOl1sZs1URs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611120005

T24gVHVlLCBOb3YgMDMsIDIwMjYsIEpvb25ob2UgS2ltIHdyb3RlOg0KPiBXaXRoIGEgVVNCLUMg
bW9uaXRvciBpbiBEaXNwbGF5UG9ydCBwaW4gYXNzaWdubWVudCBDIG9yIEUsIHRoZSBRTVANCj4g
VVNCMy1EUCBjb21ibyBQSFkgZ2l2ZXMgYWxsIGZvdXIgbGFuZXMgdG8gRGlzcGxheVBvcnQgYW5k
IGtlZXBzIGl0cyBVU0INCj4gUENTIHBvd2VyZWQgZG93bi4gVGhlIFVTQiAyLjAgcGFpciBzdGls
bCB3b3Jrcy4gU3VjaCBtb25pdG9ycyBvZnRlbg0KPiBoYXZlIGEgVVNCIDIuMCBodWIuIEJ1dCB0
aGUgZHdjMyBjb250cm9sbGVyIHN0aWxsIGRlcGVuZHMgb24gdGhlIFVTQjMNCj4gUElQRSBjbG9j
ay4gT24gS2FhbmFwYWxpIHRoZSBuZXh0IHhIQ0kgcmVzZXQgaW4gdGhpcyBzdGF0ZSB0aW1lcyBv
dXQNCj4gKCJIb3N0IGhhbHQgZmFpbGVkLCAtMTEwIikuIFVTQiBzdGF5cyBsb3N0IHVudGlsIHRo
ZSBjYWJsZSBpcyByZXBsdWdnZWQuDQo+IENvbW1pdCBmNTQ2OTEyYmNhYzYgKCJwaHk6IHFjb206
IHFtcC1jb21ibzogTW92ZSBwaXBlX2NsayBvbi9vZmYgdG8NCj4gY29tbW9uIikga2VlcHMgdGhl
IHBpcGUgY2xvY2sgYnJhbmNoIGVuYWJsZWQuIFRoYXQgaXMgbm90IGVub3VnaCBoZXJlLg0KPiAN
Cj4gVGhpcyBzZXJpZXMgbGV0cyB0aGUgY29udHJvbGxlciBiZSBhIFR5cGUtQyBtb2RlIHN3aXRj
aCBuZXh0IHRvIHRoZSBQSFkNCj4gYW5kIG1vdmVzIGl0IHRvIHRoZSBVVE1JIGNsb2NrLCB0aGUg
d2F5ICJxY29tLHNlbGVjdC11dG1pLWFzLXBpcGUtY2xrIg0KPiBkb2VzIHN0YXRpY2FsbHksIGJl
Zm9yZSB0aGUgUEhZIHN3aXRjaGVzIHRvIERQLW9ubHkgbW9kZS4NCj4gDQo+IE9uIEthYW5hcGFs
aSB0aGUgUEhZIGJlY29tZXMgYSBtb2RlIHN3aXRjaCB3aXRoIEJhbGFqaSBLYWxrb25kYSdzDQo+
IERpc3BsYXlQb3J0IHNlcmllcyBbMV07IHBhdGNoIDMgaXMgdGhlIGNvbnRyb2xsZXIgc2lkZSBm
b3IgdGhlIHNhbWUNCj4gU29DLiBPdGhlciBTb0NzIHdob3NlIFBIWSBpcyBhbHJlYWR5IGEgbW9k
ZSBzd2l0Y2ggKGUuZy4gU004NjUwLA0KPiBTTTg3NTApIG1heSBuZWVkIHRoZSBzYW1lIHByb3Bl
cnR5IG9uIHRoZWlyIGNvbnRyb2xsZXIgbm9kZSAobm90DQo+IHRlc3RlZCkuDQo+IA0KPiBSZWxh
dGVkIGZpeGVzIHNlbnQgc2VwYXJhdGVseTogInBoeTogcWNvbTogcW1wLWNvbWJvOiBMZWF2ZSB0
aGUgVVNCIFBDUw0KPiBhbG9uZSBpbiBEUC1vbmx5IG1vZGUiIChzdXNwZW5kIGluIERQLW9ubHkg
bW9kZSkgWzJdIGFuZCAidXNiOiB0eXBlYzoNCj4gbXV4OiBmc2E0NDgwOiBLZWVwIHRoZSBVU0Ig
Mi4wIHN3aXRjaCBvbiBpbiBEUC1vbmx5IG1vZGVzIiAoYm9hcmRzIHdpdGgNCj4gYW4gRlNBNDQ4
MCBvbiB0aGUgVVNCIDIuMCBwYWlyKSBbM10uDQo+IA0KPiBQYXRjaCAyIGNvbmZsaWN0cyB3aXRo
IFZsYWR5c2xhdiBUeW1vc2hjaHVrJ3MgInVzYjogZHdjMzogcWNvbTogRGVmZXINCj4gVkJVUyBv
dmVycmlkZSB1cGRhdGUgZHVyaW5nIHN5c3RlbSBzdXNwZW5kIiBbNF0gaW4NCj4gZHdjM19xY29t
X3BtX3N1c3BlbmQoKSBhbmQgZHdjM19xY29tX3BtX3Jlc3VtZSgpLiBCb3RoIGFkZCBhIGxvY2sN
Cj4gdGhlcmUuIExpa2UgWzRdLCB0aGUgbXV4IGNhbGxiYWNrIGRlZmVycyB0aGUgUVNDUkFUQ0gg
d3JpdGUgd2hpbGUgdGhlDQo+IGdsdWUgaXMgc3VzcGVuZGVkIGZvciBzeXN0ZW0gc2xlZXAuIE9u
IHRvcCBvZiBbNF0gdGhlIHR3byBsb2NrcyBjYW4NCj4gYmVjb21lIG9uZS4NCj4gDQo+IFBhdGNo
ZXMgMS0yIGFyZSBmb3IgdGhlIFVTQiB0cmVlLiBQYXRjaCAzIG11c3Qgbm90IGJlIGFwcGxpZWQg
YmVmb3JlDQo+IHBhdGNoIDI6IHdpdGggIm1vZGUtc3dpdGNoIiBvbiB0aGUgY29udHJvbGxlciBh
bmQgbm8gbXV4IHJlZ2lzdGVyZWQgYnkNCj4gZHdjMy1xY29tLCBwbWljX2dsaW5rX2FsdG1vZGUg
ZGVmZXJzIGl0cyBwcm9iZSBpbmRlZmluaXRlbHkuDQo+IA0KPiBUZXN0ZWQgb24gYSBMZW5vdm8g
WTcwMCBHZW4gNSAoVEIzMjNGVSwgS2FhbmFwYWxpKSB3aXRoIHRoZSBzZXJpZXMNCj4gYmFja3Bv
cnRlZCB0byB2Ny4zLCBwbHVzIFsyXSBhbmQgWzNdLiBBIFVTQi1DIG1vbml0b3IgcmFuIG92ZXIg
NC1sYW5lDQo+IEhCUjMuIEl0cyBVU0IgMi4wIGh1YiB3b3JrZWQgYWZ0ZXIgMTAgcmVwbHVncyBh
bmQgYWZ0ZXIgYSBwbHVnLWluIGR1cmluZw0KPiBzMmlkbGUuIEluIHRoZSBzMmlkbGUgY2FzZSB0
aGUgbXV4IHN0YXRlIGNhbWUgYWZ0ZXIgcmVzdW1lLCBzbyB0aGUNCj4gZGVmZXJyZWQgY2xvY2sg
c3dpdGNoIHdhcyBub3QgZXhlcmNpc2VkLiBXaXRoIHRoZSBtb25pdG9yDQo+IHVucGx1Z2dlZCwg
YSBVU0IgMyBzdGljayBlbnVtZXJhdGVkIGF0IFN1cGVyU3BlZWQuIFF1aWNrIHJlcGx1Z3MgKHVu
ZGVyDQo+IGEgc2Vjb25kKSB3b3JrZWQgOSB0aW1lcyBvdXQgb2YgMTAuIFRoZSBvdGhlciB0aW1l
IG5vIFBEIGNvbnRyYWN0IHdhcw0KPiBtYWRlLCBzbyBubyBhbHRlcm5hdGUgbW9kZSB3YXMgZW50
ZXJlZC4NCj4gDQo+IENoYW5nZXMgaW4gdjI6DQo+IC0gUGF0Y2ggMTogdXNlIHRoZSBjb21tb24g
dXNiLXN3aXRjaCBzY2hlbWENCj4gLSBQYXRjaCAyOiBzd2l0Y2ggYmFjayB0byB0aGUgUElQRSBj
bG9jayBpbiB0aGUgbXV4IGNhbGxiYWNrLCB3aGVuIGENCj4gICBVU0Igc3RhdGUgZm9sbG93cyB0
aGUgc2FmZSBzdGF0ZS4gdjEgd2FpdGVkIGZvciB0aGUgbmV4dCByb2xlIGNoYW5nZSwNCj4gICB3
aGljaCBjYW4gY29tZSBiZWZvcmUgdGhlIG11eCBzdGF0ZSAoU2FzaGlrbykNCj4gLSBQYXRjaCAy
OiBrZWVwIHRoZSBVVE1JIGNsb2NrIG9uIGEgY2hhbmdlIG9mIHBpbiBhc3NpZ25tZW50IHdoaWxl
DQo+ICAgRGlzcGxheVBvcnQgaXMgYWN0aXZlLCBhcyB0aGUgUEhZIGtlZXBzIGl0cyBtb2RlIHRo
ZW4NCj4gLSBQYXRjaCAyOiB3aGlsZSB0aGUgZ2x1ZSBpcyBzdXNwZW5kZWQgZm9yIHN5c3RlbSBz
bGVlcCwgb25seSByZWNvcmQNCj4gICB0aGUgbXV4IHN0YXRlIGFuZCBzZWxlY3QgdGhlIGNsb2Nr
IG9uIHJlc3VtZQ0KPiAtIFBhdGNoIDI6IGRlcGVuZCBvbiBUWVBFQyB8fCBUWVBFQz1uLiBTa2lw
IHRoZSBtdXggd2l0aG91dA0KPiAgIENPTkZJR19UWVBFQy4gVGhlIGFybTY0IGRlZmNvbmZpZyBo
YXMgVVNCX0RXQzNfUUNPTT15IGFuZCBUWVBFQz1tLA0KPiAgIHdoaWNoIGZhaWxlZCB0byBsaW5r
IChTYXNoaWtvKS4gSXQgbm93IGJ1aWxkcyB0aGUgZ2x1ZSBhcyBhIG1vZHVsZQ0KPiAtIFBhdGNo
IDI6IG5vIGNoYW5nZSB0byB0aGUgcm9sZSBub3RpZmllcg0KPiAtIFBhdGNoIDM6IG5vdGUgdGhl
IGRlcGVuZGVuY3kgb24gWzFdIGZvciB0aGUgUEhZJ3MgIm1vZGUtc3dpdGNoIg0KPiAtIFBhdGNo
IDM6IGFkZCBSZXZpZXdlZC1ieSBmcm9tIEFiZWwNCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL3Vy
bGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYxMTAyMjE1
MTIxLjczOC0xLTI2cm90ZUBnbWFpbC5jb20vX187ISFBNEYyUjlHX3BnIVlrc1R0OEdfZnFpV1VR
UV9Qd3NZQkdSWGRsNlZxcVREV2Qyd2lrZ29YOFNndmVud21WbEtXemxud2tkNnJUWm5URlltQnlZ
OEFOZ09rWVFqczFZJCANCj4gDQo+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYxMDIyLWthYW5hcGFsaV9kcC12My0wLWI1YWU4
ZTYwODNjM0Bvc3MucXVhbGNvbW0uY29tL19fOyEhQTRGMlI5R19wZyFZa3NUdDhHX2ZxaVdVUVFf
UHdzWUJHUlhkbDZWcXFURFdkMndpa2dvWDhTZ3ZlbndtVmxLV3psbndrZDZyVFpuVEZZbUJ5WThB
TmdPN2FlOWdwRSQgDQo+IFsyXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYxMDIzMTIzNTEyLjE5MTItMS0yNnJvdGVAZ21haWwuY29t
L19fOyEhQTRGMlI5R19wZyFZa3NUdDhHX2ZxaVdVUVFfUHdzWUJHUlhkbDZWcXFURFdkMndpa2dv
WDhTZ3ZlbndtVmxLV3psbndrZDZyVFpuVEZZbUJ5WThBTmdPQk9yaEV5VSQgDQo+IFszXSBodHRw
czovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYx
MDIyMTY1MTQzLjEzMjctMS0yNnJvdGVAZ21haWwuY29tL19fOyEhQTRGMlI5R19wZyFZa3NUdDhH
X2ZxaVdVUVFfUHdzWUJHUlhkbDZWcXFURFdkMndpa2dvWDhTZ3ZlbndtVmxLV3psbndrZDZyVFpu
VEZZbUJ5WThBTmdPRnhBUWpGNCQgDQo+IFs0XSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYxMDE4MTQzMTI2LjM5NzgtMS10dmxhZDc0
NEBnbWFpbC5jb20vX187ISFBNEYyUjlHX3BnIVlrc1R0OEdfZnFpV1VRUV9Qd3NZQkdSWGRsNlZx
cVREV2Qyd2lrZ29YOFNndmVud21WbEtXemxud2tkNnJUWm5URlltQnlZOEFOZ09QWWhnWEFjJCAN
Cj4gDQo+IEpvb25ob2UgS2ltICgzKToNCj4gICBkdC1iaW5kaW5nczogdXNiOiBxY29tLHNucHMt
ZHdjMzogQWRkIG1vZGUtc3dpdGNoDQo+ICAgdXNiOiBkd2MzOiBxY29tOiBVc2UgdGhlIFVUTUkg
Y2xvY2sgYXMgUElQRSBjbG9jayBpbiBEaXNwbGF5UG9ydC1vbmx5DQo+ICAgICBtb2Rlcw0KPiAg
IGFybTY0OiBkdHM6IHFjb206IGthYW5hcGFsaTogTWFyayB0aGUgVVNCIGNvbnRyb2xsZXIgYXMg
YSBUeXBlLUMgbW9kZQ0KPiAgICAgc3dpdGNoDQo+IA0KPiAgLi4uL2JpbmRpbmdzL3VzYi9xY29t
LHNucHMtZHdjMy55YW1sICAgICAgICAgIHwgICAzICsNCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMv
cWNvbS9rYWFuYXBhbGkuZHRzaSAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3VzYi9kd2MzL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgZHJpdmVycy91c2IvZHdjMy9k
d2MzLXFjb20uYyAgICAgICAgICAgICAgICAgIHwgMTAzICsrKysrKysrKysrKysrKy0tLQ0KPiAg
NCBmaWxlcyBjaGFuZ2VkLCA5NSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCj4gDQo+
IA0KPiBiYXNlLWNvbW1pdDogNzY0OWJhNzNmOWU3ZTFlMDRkMGI0NjIxM2UzOWM3OWFlMDlkZDU1
Yw0KPiAtLSANCj4gMi40My4wDQo+IA0KDQpDYW4geW91IGFkZHJlc3MgU2FzaGlrbydzIHJldmll
dyBjb21tZW50cz8NCg0KVGhhbmtzLA0KVGhpbmg=
