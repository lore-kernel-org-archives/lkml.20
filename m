Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794442973;
	b=Uk2R6X1ekojwpkrVGZ1P9ia5fKWOv/pjpEWlxyH60QGQXjP8cXyHoCUHvq2pHSZCO7PC
	 Dka1crDv8SfYzBdykJgnk3QJbNTzNr2oeeFcTcTSIh3j4UeW6zbNyp3GXirQ+L8pVPXif
	 XaTUULLWnl6Q5mviiNBMVP6hwYE4x1XR8HtuN4ZWnOgimTslX50cwDMtihoPub22HfDFe
	 GSNwZn1FDEYn7qbGKhoVylh9s+129NfhMyoOPYa5iyHSr23OSm8y1PUATiufpPVi6hh49
	 ODDWkQCQdb1Y+GEeIxO0ck7wj5YYIJqnOSbA9MqQ6vaN3cclvwSSGCky03tVafutB3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794442973;
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
	bh=K5nOGCws0utlYgFQ7XA/tXtyIRcvB2rcmUbXCbJtvTQ=;
	b=HFGTuLplMbed8swA6e02dCvFyV9vSbosj5diq4PCvftv4cAqzlEoEDz8J2QNk8PjhR1D
	 8CsWtjtRoZ9QTC8J7qt/amoVmoLhgvNTJbd/lPTW1uO6NcpyJylCyhtP7Ex1GdptgiD55
	 bhzWWFFgc0/JwBO5FrqYMf4S0liKRMwoHFpYW37QCRs4N9fb3iAoheiuTXJ/DMPjm+iXZ
	 ijGbGMm07TyBUiVV3Gej8Sh6J3XjC5GqMo1+JCwBxiKm1FecH7pipYsx9Q412VaMZaayR
	 FXgO/E9f+dPD5U43mJJ0rdEJpIWhhFU2D4LrbfDe5ecRbHsAXN2kNo4tc4LEYJQ8khQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=LiyQBrjH;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=Is9Ut6P2;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dkS5gAXD;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446A8606A32E;
	Thu, 12 Nov 2026 00:22:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446A8606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=LiyQBrjH;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=Is9Ut6P2;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dkS5gAXD
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABMbm3R2518831;
	Wed, 11 Nov 2026 16:22:49 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=K5nOGCws0utlYgFQ7XA/tXtyIRcvB2rcmUbXCbJtvTQ=; b=
	LiyQBrjHnQD8ttSWyuftwIQFNPJwtcFp94eb8Bb+DHbRvJk8N4MyiVobHFe0vMg3
	2BBxlObn25CzG/Byie7Loxs3wvST/FtnlWY/H472EnhwKJVVyXc8Ybj/JkGFjYVS
	DJec1WsdkSUJyzgjLlgwvHBXkZXbE1sOCq/o5dBBYht5gfV1x5wQibdel0aohG6u
	3Y9sXrJkdJTp7Q34mxjX/ezMmoxcv3CZ+JKvJq9UEb2ks2+1YExABufcZPYFilUM
	frDU1isOWlL8cPvZRJ+r9Al1XKkZcNnZzmuw5v9Q4/p3hufmc2OII0WWhl+meOcW
	e4aPf4eAqP2QQ2ujtHkD8w==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hvvaytwb9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 16:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1794442968; bh=K5nOGCws0utlYgFQ7XA/tXtyIRcvB2rcmUbXCbJtvTQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Is9Ut6P2ceSRW5vZF9HvJjjvhXmmMDdrTSt84GE/ePZrPmcJkC1J7AHKdwiZzrpcc
	 oZy3lAWvSyt1bG5z9xwZJv/ZKS0JcQdffxfBtpZr/5abI2UPkxKB1u9PMLdA1LebRd
	 t/pvDyJnhw4ht1XQl5/TtFZaSDE8Rto1lpZqPaLKePO5cYuFD9sG2xhAMfxs75ncKN
	 ENmhKDZEsLH/Ak1jzKPXvho5ICy+EGlYYPAArMZHnORkxZfr5AV7Spjzznzn3IcihJ
	 qQzuneiCsC7WSMVrJpCuJeApSjuqMdQEpb8Ruc4wEHQt88cPIUKMuD96c640t+aIbs
	 JZgZNnFZt3uLw==
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id C139B405B4;
	Thu, 12 Nov 2026 00:22:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 5957DA0899;
	Thu, 12 Nov 2026 00:22:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=dkS5gAXD;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00105.outbound.protection.outlook.com [40.93.13.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7F2EF2208AE;
	Thu, 12 Nov 2026 00:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J8cu5bAxl4rwIaIiBfC1896dFpBDKF+Piimn3ES62FLvedZ+jO1RHqYlXva/NSsBs1+kLPXaIGSuA9O4QAjbniznLqnMr+hLudNJswJSOV5E2DyCy9wpoEhlsxlgLozt83DDVtXQtxXZq8CFzr8yDlqHvdXAarYNFEqt/H8E16Hav4lxncvVAKPMtxS1D1O5m4pXZuP+UBlFeuRrlXw+bO4eNjPAG+rxd7zY0yEouqK7gmrAQbl+nr/o95OOOQYyDQXlWQ+unKNXq8Rfok5cnxkmu4pYnwe0udkR3KC2ExWc/t/rJQWdn/o3T/E3nNMBPK7sfFVsahSBMR5fUw+S7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5nOGCws0utlYgFQ7XA/tXtyIRcvB2rcmUbXCbJtvTQ=;
 b=jtCj/oh1w2QLLKNbHRv/djQoGcwE2FI036S+YZyB7oI3dA3iqB2rL8UYUbzRTcmVEMwb2QGTWpgacB789LOfTOniI65wzTalwS40xdI4E8jeo4pPCMjQNnxxga7O+NVBFJZDbmHrpjYOkbBpRT6wGi2P2vrAUnmtS0ygYpIduk5Dn3osENjjNsNy2I2LSaFH4GGgUEVJvcB9zVQhdD+j++gQsdgyq/k0Q13eK5tlJNXKNQKLusLP7KWh/pf58Rb0wmlqYQjizg2sEDMGFntoDb8OEn2NtNkzNZdWIkL3aDzDOC933Yk/Bb4yBK8gFvIKUFQCiE5nvhh8QPhtRgVFdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5nOGCws0utlYgFQ7XA/tXtyIRcvB2rcmUbXCbJtvTQ=;
 b=dkS5gAXDFQdQ6GXOJMd/LxmFqELTU3edkU0YE6Y8/2IxtRlmcFoS5GPkw4Pv6/MRFK1GgQcu7jSFD8dBhZ5f+PCTTATZbXyUd82EuQnwFkIqNAsg1OXO041SQl/E8AuSrjoMtpSxDUJBuciuqQ6n7UiqPOvQF5qv3PP1raGem4I=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by DS2PR12MB9712.namprd12.prod.outlook.com (2603:10b6:8:275::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Thu, 12 Nov
 2026 00:22:36 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:22:36 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Uttkarsh Aggarwal <uttkarsh.aggarwal@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] usb: dwc3: wait for USB2 PHY clock recovery during
 role switch
Thread-Topic: [RFC PATCH] usb: dwc3: wait for USB2 PHY clock recovery during
 role switch
Thread-Index: AQHdaDd17Bzy7/zfo0KvmaNZFXsN+bcpp2WA
Date: Thu, 12 Nov 2026 00:22:36 +0000
Message-ID: <avUBz_JfXLIqK5yj@vbox>
References: <20261030062509.3475322-1-uttkarsh.aggarwal@oss.qualcomm.com>
In-Reply-To: <20261030062509.3475322-1-uttkarsh.aggarwal@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|DS2PR12MB9712:EE_
x-ms-office365-filtering-correlation-id: 86141729-d4f1-4df0-d089-08df40530db0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|38070700021|261021121427099003|261021123027099003|261022075727099003|261022113327099003|261022105027099003|261028144727099003|56012099006|5023799004|261026121527099003|261026140227099003|11063799006|261102123227099003|10067099003|22082099003|6133799003|18002099003;
x-microsoft-antispam-message-info:
 I+SUZJtPrhrykMc75929tUbg6zrEZNgdB7XqSFYSd7dvRrQ8AmjRHaLbbAwcVGYlWoxpiHThIbA6ZsDREX/UHnOBWXCbHfkLIuFzU/DlWLgqTD+2kEutkiz58ukU6e8MCvYEpZiKJCTFHS+8y8Mo0aRocDM1F28JPjkqixla45w/YI91a6ZVhHCmMbynK0ErzEamdZAqjOC2ONBlmKbhj/mmIIW9dukT+nNatwePhuW+Enf6f6bmR3zI2wBlQZOchpO1pPycjYRchRQBdscHrLIirGVlIYPHrk0A00izjlVidaSXQQvQhtxa4Us/Tvn/QLV7LyYwEmyhnd6VV98+Ytf4F3vBdL/mkMw91syM0KyLqKkz7vSZkY6l1FT/QMFy0dXJmJEzsELTnYzbpkgHw63FX3Dr0+DNz25hJzaSRAUmYA5I0ihHkD7Qw9VYloU21TGsJvssbiOlkcWcwSlCcWqX+BrkLuVTHmswokA4L3mWM4ja4QSZzWWVGES6oP6Ph25YqGS8GpbGlaASkVdhQf1wvVErDzKcxlEhZWMwuGssfXE7n7jyRt+sC/CKIaXRkNBs63GlE7lMcIHzndYNggI+QlvJrh5FajsBG9uto6M6fASf58JqETEJ6ly7kf67tAl2KnjoChCmi+8GwLleDZo4rBoyBhxnNmdXTpT/t4eIgmvvTQCtGqLYHqEvSLDB9+EYjbLkJtaSb9LXmrDgIc8/HG4dbAwcgdIW9jkfUlg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(38070700021)(261021121427099003)(261021123027099003)(261022075727099003)(261022113327099003)(261022105027099003)(261028144727099003)(56012099006)(5023799004)(261026121527099003)(261026140227099003)(11063799006)(261102123227099003)(10067099003)(22082099003)(6133799003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NFptbUhOUkRFc3d6cUVRN21sbCtnNGN5N2ovUUw2SHpSTVlQYTNKdjV3VWxK?=
 =?utf-8?B?YTVFZi9wQStUSmJZWlVMcVU5S1VmUHh1QjI1aXY1RjJnaHBkdDVMYkJvS3Va?=
 =?utf-8?B?OWN1SlZteWRqMFZzZ0tGMWVaalVkS0x2M3ViT2I3R3VCQ2pmeE9kYzhwd2lZ?=
 =?utf-8?B?Vk5OSVJ0MW9Qc2tkUktEOGc3d0xJTERKSjB3WEhUR2w1b2N3VnJPUFRzMWJn?=
 =?utf-8?B?cFVRREExM0o1R0huMEsyL2dMRXRKRU5RT0FPbXRyZXpTZHF2alVFMWRhckdr?=
 =?utf-8?B?UnV6eFdCMm0ydFd3bFdjUm9hLytET0tubnFJVGVuamlYaHZlRjFncEZTai9m?=
 =?utf-8?B?OXRmYnRjK0pFZ0JnYllJZjJXaEVzYkVETmNlU3ZYZmNoNjJnSVB2cUR1bkJG?=
 =?utf-8?B?YU1sTktWbkptYXNqcVkzOENhcVQ5Y2RvVjE5amR2V09TemQzV0pKYUNtQktF?=
 =?utf-8?B?YUlYMzZFUGkrV3hoVGNGT0hBbjZwR3RaYzlTVXZiZ25BeHJva3hDNjEybzJj?=
 =?utf-8?B?RW81eXc0a1c5TldNVVdJVXVWVHdjVjZ3NG1NRzhQVHZlR1lBM0VoZ0dId3Qr?=
 =?utf-8?B?Q2RCaXNmNDdkTDNxY0tVTm95MGlIcENBbU5iaUdkZlltOThkaVoycHpIKzFj?=
 =?utf-8?B?MTczK3d3QXR0cTVOaWtIT3FJZ1RYRko5em95WGI0ejdCZDFJVE1NaU1sLzV6?=
 =?utf-8?B?WllTTit6MlRPNjY5Zk1iSDlDN2dveVI5R0pRQ0VhTWhMVkdNOGxzc2ZGaUFH?=
 =?utf-8?B?TlpnQmVuTUZwNC9kVENJemdqSjAxWmpYVmhWZjFwTjVXS29yd2xWM0lodncx?=
 =?utf-8?B?R3o4U2VGRFRGQjc0YlA4QlRueTJDTVRSUk9GVGxuN2pSU1FMSVJEUmxvVmp2?=
 =?utf-8?B?WGhYSzVvZzZ5RnYvOGQxZkZIMHh1Tm1aZ2ZWUTJ0VW5UK3RDWTBuUzFqV294?=
 =?utf-8?B?U2RXcm5QZ29xNHZDM2tZbFlLMVdlNFVwdkwzWW5YbS9pUyt6V3ZIOTE0czVZ?=
 =?utf-8?B?UlN1MzJEOW1ZbW9nQ3VlWEN0RWdjSmlzdHpERXIyR3EvTmh1eTRkai9NaDJv?=
 =?utf-8?B?ZGxySEhuckFMekM3Ykc0R2dMMnBnU2wrU3FVRnJQWUJzUGtWdXBBQVovSSsv?=
 =?utf-8?B?Y3dFaTVPL3hmZ1JjV3Z4YzRtdmpDbVF5dmVaZTE5OGlXaE5zSlQyYnJ6ZnBz?=
 =?utf-8?B?dmZWQ2dDZ3VHSFhmRHBuMy84bHdKUzhwZlZKNG9IaXE4b2hkLzZ6MXdYOU9a?=
 =?utf-8?B?NW4yeFZ3Z0l6OHk2NHR5Q0U4eFJUQVRTUTRxTmlYb2poT3RVS1dLZDRyekpx?=
 =?utf-8?B?MEtrV1JVMDlwQmoyRVpkVFVSWnVlb3UwZ2hSczl1V2NqblFkOVBJRkhrNHAz?=
 =?utf-8?B?OGVyTnJSVENqNE5haVBmVkxDcDNQTmtKWnhiNTFBSTNUYksybWtDUk13MW52?=
 =?utf-8?B?T2tBVXBFUFd4VW54bUptdTUvNmROeUMva1RMR1hYYVhQMmN1ZmI3L1VTT2s0?=
 =?utf-8?B?ZDVjSTlTTmNrLzdqV0txLzZJZktBbzh0MHBJSjdDWXlBYTNRb2cxMkpBeFpT?=
 =?utf-8?B?ZVcyT1BhRzdCY05oSmJDM1l3NTBnUTIxcFJURGxXQmpGN2FMOVhsbTIzbnZn?=
 =?utf-8?B?NElBTUVrOEdLSXpxU3FTZXdJRGQrQ1c5eVMyRHB2QUduQ3VMYTlRUlVKdDFh?=
 =?utf-8?B?V3RjeUw4dTdacUJVUUtuTGRyWlBlTmUvZXAyTkNHTEJpYzhKVHhJbTFwMXZD?=
 =?utf-8?B?TW5Ba1lBL2tBb3ZlSFhxRXJyenZqRDRhQU5yNlplZW9MWFZ4RWwya05uTmdv?=
 =?utf-8?B?Z0dVK1dCVk5ZRWEwVVMzNEl6Vm9HWTRVNUFkTkZ0RnNQaG5SY2Q3bUdhUDQ3?=
 =?utf-8?B?ZUpyWTRaMGdEaEJOdEk2bjFkK255VG5DSmNWQlRJejVZUU5GYWswQjZvQTFQ?=
 =?utf-8?B?VXJGdjI5dkNBZVJWaGs2RzdMY2JlUjRzbWkwTFNNaWU0b0lkZTNNSTdqUkNa?=
 =?utf-8?B?VUpVajIyenNDaDEwL2hXWlYrV1NhT25acTNTMmJ1dndSbUxWQ2J4L3RzVUZx?=
 =?utf-8?B?dWFlenZMT2hDblZwZGhvSCtyTFl0YzlTNlRuSVFlcTRFUTh3UTNrN29mRlN6?=
 =?utf-8?B?ZEVPZGFkOE42Q2JSQnVycUh4VVR1dytvN0QybUtzcVUxb1Y2M0QzVU8wMzhh?=
 =?utf-8?B?aHBmdDcxcDBMVjF3Y1NBZWx5cGV2aFlZZ2FIKy9iV0k0bVJDQU94VDRBVFVs?=
 =?utf-8?B?SGtGeEZ6Q3NoR1RVa2YxdmJIa2JocDRyQ0lya2FSa1k3aERhdXpJaDY3dDZH?=
 =?utf-8?B?cFFzUytmck13L2dFU3lvNHg5bUY3UFhJL1owaGtZejA2bFdQaHlhdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <572DEA6F2825AE4DBDDB7943D15144AF@namprd12.prod.outlook.com>
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
	nsZPg2d9+GQlr9VcTSckGqVYDL8AtaOKAy1QscV0J9bFiE3jZ7SVboRehy5gb44fGStJTVolO1Q636ltHXCverXx0754GMJfuk5GIQvJYf1V0k2vn+okqjSA9aCpvZK2kJKogq/VTI8V0Wepqq5RyTrsGOIBqc095uwi84BMtRb7z+wLsoj+rGvuoYR9Aq5j/czQHgi6dqoVs++HjQl3fMo7jEK8ThhwlPEd0BMVPk0jClHIWJPXAPCykj7e4zbou0MD50n+q/n49un7+B09iziNGNf6bW7KgHdTu+yxCqHIlqyeVJrG28yfs/S+2VWhiLSwIAsMFAAHQsMKu1ssMA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8hXCAIYpfoPZL6ek/ixuY6RfeADbRSL4ZyMBPrr3NN5rL2mm/hUiq1sZ9AKjLBAz42MrPm5p7+BMUY19hwFWM4o4s9UKhVBIT/qYdJRElsMzCqPcPBJEn6MoWrPytPkUyvnaZ9WxFiLWb/O2VoXnbhNsxsnz8vXdveSHY4fFdNm3Xg5FzKr6UO7M0AsYfal+CwVHpwygaVuAbSsJ+tXgjyW2obKq/JOemLIO/69+6oBz7Vv4JoGKK0gB5Zl4uDNih1dErTW2iO+cV0ujkoOcY22t/MKXLJfiTjcRZUZzguV1YQs1WH0vJersG7/grlRUMkTwKRVgropM9AzhADdgDSS4AUMWpBfrnc3DlnegPf4LgJzki10yW5x7JGiKz/MxffDTWfsWQfCnFMacR8YvqmCyMvNPhK31gybLqaZeArz/Goo2AqfTluK2XRtX27q2IQusB6QEsdmhS/VKASSZLJo/OY0kO+pBq03lcli/uHqGhECMyB56LN6o7q6dAiDxPu/kAbXaBnFjEz1ljC1XW3+GLyu5bpcynWCnpXhTPpq36gmH1gzmXXyFPP44eRZLTHLU/scjxirSZjFdkG9Pq79Z8yqKyxTjlVdUbNTp0mY0ZlTqPeC6nngOZB8kVZj8Zy8ptcH8rtdHtlJdtdvwVQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86141729-d4f1-4df0-d089-08df40530db0
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 00:22:36.5588
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fhAbCZgok5DVB8DtdhP6nYWocXHf1QzSEcXrPxLaWKinoNf9weO62zE8S+VTzNBPEG/e+1xbLHdHEJ0ZxzHT9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9712
X-Proofpoint-GUID: KnuUC5lBnAZUsgYzoz5Oh0FsnPPMmJQq
X-Proofpoint-ORIG-GUID: KnuUC5lBnAZUsgYzoz5Oh0FsnPPMmJQq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAwMSBTYWx0ZWRfX5IWZMNvgJFtq
 36+nEd9MSNLbcVlLExry7AgfXg7cDNv1AzJjLDlluOhw9nWcV2WPFnOZnqiaEI61EblBzbyYPng
 SAtg1cc9DfkmpCLLJTaAaBbEVPE0cA1Nhr/AvlKMFNhp4+M3i5jFR9Q/VI3H3kfLfqMwSwGH18e
 L7EZhh6D3rSI6372+oBzXYwDncXRWufUxksZ4fDAbkarHscd0Q9JNeMOe0B+xSkbDhV45j/H56p
 tDL3MfEVpG3qYr2RlPmdci50Q3RZOWomP+/Asq+Lupfw9fyBmkmtEGFf6tfGUFgkp3HfrbFP57V
 mBmsTzUhXq5TDPfI/hMBIIhc+iKVEGHFk/hTbtkIPRiKpUHVsWe3aWMLis3/5oXjEbyWiD1wR/a
 SqorMwExov2wDeusM+vUf8uRLf49loXAUxjPCiWcu7MfDuHRKBbj1nBiZkqlH5u5ao9z3BBg1yi
 3q9xMF7ZEUgaCyhaoIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAwMSBTYWx0ZWRfX6gfBefhJVWgu
 kWUw44HHjLJCrvtK+kf/JnfZqSggDKCeho1wcDOBEBr6mmdES/cRsBtCZRIKrSKhIslaTgECo1n
 wg8F5FouGBGQY+hfVrc0D99NqVLo/mQ=
X-Authority-Analysis: v=2.4 cv=VNdIDNPX c=1 sm=1 tr=0 ts=6af506d8 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=EUspDBNiAAAA:8 a=oUALdR2W8bb3cd-rQ0cA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611120001

SGksDQoNCk9uIEZyaSwgT2N0IDMwLCAyMDI2LCBVdHRrYXJzaCBBZ2dhcndhbCB3cm90ZToNCj4g
RHVyaW5nIGEgZGV2aWNlLXRvLWhvc3Qgcm9sZSBzd2l0Y2gsIHRoZSBVU0IyIFBIWSBtYXkgc3Rp
bGwgYmUNCj4gc3VzcGVuZGVkIGZyb20gdGhlIHByZXZpb3VzIGdhZGdldCBzZXNzaW9uLiBBZnRl
ciBjbGVhcmluZyBTVVNQSFksDQo+IHRoZSBQSFkgcmVxdWlyZXMgdXAgdG8gMS41IG1zIGJlZm9y
ZSB0aGUgVVRNSSBjbG9jayBpcyBzdGFibGUuDQo+IFRoaXMgd2FzIG9ic2VydmVkIGR1cmluZyBh
IGRldmljZS10by1ob3N0IHJvbGUgc3dpdGNoIHdpdGgNCj4gYSBVU0IgZWFycGhvbmUgYXR0YWNo
ZWQuIFRyYWNlcyBzaG93ZWQgdGhhdCBTVVNQSFkgcmVtYWluZWQgYXNzZXJ0ZWQNCj4gdW50aWwg
X19kd2MzX3NldF9tb2RlKCkgY2xlYXJlZCBpdCwgYWZ0ZXIgd2hpY2ggaG9zdCBpbml0aWFsaXph
dGlvbg0KPiBpbW1lZGlhdGVseSBzdGFydGVkIGFjY2Vzc2luZyB0aGUgeEhDSSBQT1JUU0MgcmVn
aXN0ZXJzLg0KPiBUaGUgVVNCMiBQSFkgc3BlY2lmaWNhdGlvbiByZXF1aXJlcyB1cCB0byAxLjUg
bXMgZm9yIGNsb2NrIHJlY292ZXJ5DQoNCldoaWNoIHNwZWMgaXMgdGhpcz8gVVRNSSBhbGxvd3Mg
dXAgdG8gNS42bXMgZm9yIHRoZSBmaXJzdCBjbG9jaw0KdHJhbnNpdGlvbiBhZnRlciBTdXNwZW5k
TSBpcyByZWxlYXNlZC4gVGhlIDEuNW1zIGxvb2tzIGxpa2UgaXQncw0Kc3BlY2lmaWMgdG8gdGhp
cyBwYXJ0aWN1bGFyIHBoeS4NCg0KVGhlIGNvbnRyb2xsZXIgYXNzdW1lcyB0aGF0IHV0bWlfY2xr
IGlzIGJhY2sgd2l0aGluIDk5MHVzIGFmdGVyIGl0DQpkZWFzc2VydHMgdXRtaV9zdXNwZW5kX24u
IFRoYXQncyBzdHJpY3RlciB0aGFuIHRoZSBVVE1JIHNwZWMsIGJ1dCBpdCdzDQp0aGUgY29udHJv
bGxlcidzIGludGVncmF0aW9uIHJlcXVpcmVtZW50LiBBIHBoeSB0aGF0IHRha2VzIH4xLjVtcyBp
cw0KVVRNSSBjb21wbGlhbnQgYnV0IGRvZXNuJ3QgbWVldCB0aGlzIHJlcXVpcmVtZW50Lg0KDQpU
aGVyZSB3aWxsIGJlIHByb2JsZW1zIHdpdGggZml4aW5nIHRoaXMgd2l0aCBkZWxheXMgaW4gdGhl
IGRyaXZlci4gV2hlbg0KU1VTUEhZIGlzIHNldCwgdGhlIGNvbnRyb2xsZXIgYWxzbyB3YWtlcyB0
aGUgcGh5IG9uIGl0cyBvd24gKGUuZy4gb24NCmNvbm5lY3QsIHJlc3VtZSwgYW5kIHBvcnQgcmVz
ZXQgZHVyaW5nIHJvb3QgaHViIGVudW1lcmF0aW9uKSB3aXRob3V0IGFueQ0KU1cgaW52b2x2ZW1l
bnQuIEEgZGVsYXkgaGVyZSBvbmx5IGNvdmVycyB0aGUgU1cgaW5pdGlhdGVkIHBhdGguIE90aGVy
DQpwYXRocyBzdWNoIGFzIHJvb3RodWIgZW51bWVyYXRpb24sIHJ1bnRpbWUgcmVzdW1lLCBhbmQg
ZGlzY29ubmVjdCBpbiBMMg0Kd291bGQgc3RpbGwgYmUgZXhwb3NlZC4NCg0KPiBhZnRlciBleGl0
aW5nIHN1c3BlbmQuIEFjY2Vzc2luZyB0aGUgY29udHJvbGxlciBiZWZvcmUgdGhlIFVUTUkgY2xv
Y2sgaGFzDQo+IHN0YWJpbGl6ZWQgY2FuIHRoZXJlZm9yZSBvY2N1ciBkdXJpbmcgdGhpcyByZWNv
dmVyeSBpbnRlcnZhbC4NCj4gV2FpdCBmb3IgdGhlIFBIWSBjbG9jayByZWNvdmVyeSB3aGVuIFNV
U1BIWSB3YXMgc2V0IGJlZm9yZSBzd2l0Y2hpbmcNCj4gdG8gaG9zdCBtb2RlLiBBdm9pZCB0aGUg
ZGVsYXkgd2hlbiB0aGUgUEhZIHdhcyBhbHJlYWR5IGFjdGl2ZS4NCj4gVGhpcyBjaGFuZ2UgaXMg
bGltaXRlZCB0byB0aGUgcm9sZS1zd2l0Y2ggcGF0aC4gUnVudGltZSBzdXNwZW5kDQo+IHJlcXVp
cmVzIHNlcGFyYXRlIGhhbmRsaW5nDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVdHRrYXJzaCBBZ2dh
cndhbCA8dXR0a2Fyc2guYWdnYXJ3YWxAb3NzLnF1YWxjb21tLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3VzYi9kd2MzL2NvcmUuYyB8IDE0ICsrKysrKysrKysrKysrDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
Y29yZS5jIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gaW5kZXggZmQ1YzJjZDM2YzU5Li44
ODViYjkzMDE4NjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+ICsr
KyBiL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5jDQo+IEBAIC0yMzMsNiArMjMzLDIwIEBAIHN0YXRp
YyB2b2lkIF9fZHdjM19zZXRfbW9kZShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspDQo+ICAJCWR3
YzNfd3JpdGVsKGR3YywgRFdDM19HQ1RMLCByZWcpOw0KPiAgCX0NCj4gIA0KPiArCS8qDQo+ICsJ
ICogSWYgdGhlIFVTQjIgUEhZIHdhcyBsZWZ0IHN1c3BlbmRlZCAoZS5nLiBieQ0KPiArCSAqIGR3
YzNfZ2FkZ2V0X3J1bl9zdG9wKCkvZHdjM19nYWRnZXRfZXhpdCgpIGR1cmluZyBhIGRldmljZS0+
aG9zdA0KPiArCSAqIHN3aXRjaCksIGl0cyBVVE1JIGNsb2NrIG5lZWRzIHRpbWUgdG8gYmVjb21l
IHZhbGlkIGFnYWluIGJlZm9yZQ0KPiArCSAqIGR3YzNfc2V0X3BydGNhcCgpIGZsaXBzIEdDVEwu
UFJUQ0FQIGFuZCB0aGUgbmV3IHJvbGUgc3RhcnRzDQo+ICsJICogZHJpdmluZyBmdXJ0aGVyIHJl
Z2lzdGVyIGFjY2Vzc2VzIG9uIGl0IChlLmcuIGhvc3Qgcm9vdCBodWINCj4gKwkgKiBQT1JUU0Mg
d3JpdGVzIGluIGR3YzNfaG9zdF9pbml0KCkpLg0KPiArCSAqLw0KPiArCXJlZyA9IGR3YzNfcmVh
ZGwoZHdjLCBEV0MzX0dVU0IyUEhZQ0ZHKDApKTsNCj4gKwlpZiAocmVnICYgRFdDM19HVVNCMlBI
WUNGR19TVVNQSFkpIHsNCj4gKwkJZHdjM19lbmFibGVfc3VzcGh5KGR3YywgZmFsc2UpOw0KPiAr
CQl1c2xlZXBfcmFuZ2UoMTUwMCwgMjAwMCk7DQoNCkFsc28gbm90ZSB0aGF0IHRoaXMgYXBwbGll
cyB0byBldmVyeSByb2xlIHN3aXRjaCwgbm90IGp1c3QNCmRldmljZS10by1ob3N0LCBhbmQgaXQg
b25seSBjaGVja3MgcG9ydCAwIHdoaWxlIGR3YzNfZW5hYmxlX3N1c3BoeSgpDQpjbGVhcnMgYWxs
IHBvcnRzLg0KDQpJZiB0aGUgUEhZIGNhbid0IGJlIGNvbmZpZ3VyZWQgdG8gcmVzdG9yZSBpdHMg
Y2xvY2sgd2l0aGluIDk5MHVzLA0KcGxlYXNlIGtlZXAgc25wcyxkaXNfdTJfc3VzcGh5X3F1aXJr
IGZvciB0aGVzZSBwbGF0Zm9ybXMuDQoNClRoYW5rcywNClRoaW5o
