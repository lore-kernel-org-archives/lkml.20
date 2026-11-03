Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793675519;
	b=xgwFwxZjQEIus+bC299VpwVzzJjnNgBnBVz/AZLlovy02M02jBCF9WSVefRK8npwGnGu
	 oIDP9EgRjEntXw1rvl7N9Kg/Eiy19dssOWxDX+2igrPHT5dQUd6S+8QaxUEEVkt4+u16F
	 PNyMohlHiQOE7FD4n9GYTH6aOBm4jV7yktheZThvMV+4uCIIWVM7/ivraDPNHtRUSNJ03
	 gApQSl5clmHNOuyTnGZR4ivukO/nNs0nL32FRP6+ERJplwvbscuHheww1XMK14UdNXbMS
	 4bxzK9qHnnMHhCmiOs5MiKsmwuGMX05HLcmPyCRoOtqbC35oLSYPyznDPbCpdZzJ+Cw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793675519;
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
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vs+y6WSeAwgVUy4JOg46Jzslk5480PvolmoALJf4suY=;
	b=KrKbcYCMkamORgTkabwYICRcV8HwYfq1Yanz53Ipx77ZvZ0J0npYFpGieI2IuA7/I1+h
	 n677lKF74BLGSpQaKnfQ6xhROZ+y6Qf1eoxFfcMzJw6fJ3y2ZX2ao3ts53XxXOVEc8eSv
	 OgBC1m6xc3GhGDz7yfCxlO0KPNQUWX0taCK8IGaQ/QWI3hGhi2wd4pyX3Rawh4J8uvQZx
	 dqGDHOVZBSd3mUVNIdPbZR5xnUkgVUg8DFLgLFngFlHxIqi/2OrEnVR2rOEZtjU1Gg5Kh
	 IkNxeDDOb2PXWzKsuJMfUOaAd7kePjyLskWaZ4n0afMrM0d+FdlOabEgTQ2crxbVC1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=MPLzXjac;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=F8A8huYz;
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=H7HO+pmo;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB8B606A324;
	Tue,  3 Nov 2026 03:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBB8B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=MPLzXjac;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=F8A8huYz;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=H7HO+pmo
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31gth12676847;
	Mon, 2 Nov 2026 19:11:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=vs+y6WSeAwgVUy4JOg46Jzslk5480PvolmoALJf4suY=; b=
	MPLzXjacJFrx40NvofQNtXA99zMDJL2+j14cvrmuDxsTF03JSyVwsBCEKjoj+a9P
	PSfTanS2YfcgnSsCMsl85EGnbcGk6ZiGYp3DAN9VjH9/MHHszugr/hJ/XPfPEN7N
	Lb4RltYOPmx6uDENt+bVkwkgNb/eromIYUN49W4x4PWIZ72DFxSsvho9eWzv7n3m
	g2kJnjk+nF6LxvnYCUyyXbKGycUHSsxaDgdGnyIiWDqbesPnm4Hm1uhHaOeLwTwY
	Q7ICjsFSJ6Ac0I2R+Vr+epiDhmG4aIFDezdYQtHkL+yD9h5jmG88dwDVsIqXPbHV
	cj7gIcgDcE/5SfrSWS1Usw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hpu8kxjem-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Nov 2026 19:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793675484; bh=vs+y6WSeAwgVUy4JOg46Jzslk5480PvolmoALJf4suY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=F8A8huYzlYOwlo50Gi3+apfCO/30czV1JJg8YCF/DO84VmOmFskaKDpkWYz+ZftLK
	 XpTBDZ78yT4tzxglOvm+9+9EnirMUnVNLpOTG2MRQ5ltEsPSr/rpNeJ/UMI7Udds3I
	 33WzI1bv7j3OccrrRIK+C6AKE3GXE7TxiLa8GkdUJiozd6hXZY9MGMA1Tn/jbQp43F
	 5iNeoZNuBBANBDCZeSyayWFABfY1o+5QpaKf9dKWlIticE5gfpFeyBXdR4owFZufpO
	 Y3+wcVkKKWXz99/E3M89N9dHzmXT3FIgHlzidsYogyeZ3OIWh7etSq+6KVVZmcc9Av
	 U+sqeK8KyB5PQ==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9EC3D404AC;
	Tue,  3 Nov 2026 03:11:24 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 44118A0068;
	Tue,  3 Nov 2026 03:11:24 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=H7HO+pmo;
	dkim-atps=neutral
Received: from SJ0PR08CU001.outbound.protection.outlook.com (mail-sj0pr08cu00105.outbound.protection.outlook.com [40.93.1.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 7F6B440140;
	Tue,  3 Nov 2026 03:11:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X3USv3iZAWwLxLLkc1/oS40ZNgIT2+iqadnFPPZy+h4LSE6wZSOELKzoESR0l5eC0AnzeYvyjMYGNxOco1j3/VbBgPUb4nhRpF1apb7urGBDEkKu0HBAEE6I9/meZr28ZbYYJvkkWoA4ghpqvNJH2R3H6ecZ1hFEl1uqH6/ryIZXlgO1ENop3bwvYTw/qoSZ/gRMQQkL4zIXkDaZwRuf7PiF1AnzvKurDHMvH187FBE4Vrcgh4JjeeC8mYp6AvW20Y0ugy3bfzFifxxY6pN7RR7EqyJQsbPzPWoYR9fTGqnZWFHbvEmOQDy96vFxQ9bhXb0mn7/2plJr6SKTP+y2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vs+y6WSeAwgVUy4JOg46Jzslk5480PvolmoALJf4suY=;
 b=ZGHcS2q7cDXf9Yktge3MQlafhs6hf0JMsS22zZ02SJtCXqBF4ttyQkbHyhqfB2KOlIZZEV30oOe6EjxIMIUgrIxqzds2w0iEQClqDRMottMdtP/NdLtovyqatuTTLtjCtvdc/osvl/kik/eT5EH2PkXYWMcIqi5BLRUUpwSWLaO7iPNoZS2L4+P5FLHW8vbsNGse6lJAGug68X+nneTJrWmXFwCGSvG9MjaIiJAZux0z/+Vv8Hcie7bU05/4jNYrm8IxSjKBLN4ofNCPxOgL0LHehTRVz2Tg/y3rRRF7bD/YxUyPRJKz6FRfvtMaBYU1+tkeDLWu+9UPMSCw9UEy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vs+y6WSeAwgVUy4JOg46Jzslk5480PvolmoALJf4suY=;
 b=H7HO+pmo1Rm5pU237ZJqNSde1qFmtIJtqazuVDG5UgpbJ3N9R1JhJGcRb3oqkg3sx5oU9XGqXlPnUYO97oeeMcxHO0NbIzDLE8VSLaGfDqwoyCyYm1qROL4hYjPqguU5CuChDEWvDfAAsfD+Y/FXynciP9Nv1o+BofQd7Sy7/qY=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA1PR12MB6553.namprd12.prod.outlook.com (2603:10b6:208:3a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 03:11:18 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 03:11:18 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
Thread-Topic: [PATCH v3] usb: dwc3: core: Fix RAM interface getting stuck
 during enumeration
Thread-Index:
 AQHdT9IiBPnGUogw2kOy03ybke34C7b7PVSAgAEeJQCAAJqmAIAA/0WAgAASi4CACVh8gIAMAHkAgAiBbIA=
Date: Tue, 3 Nov 2026 03:11:17 +0000
Message-ID: <auksxKbHVZzUd4G5@vbox>
References:
 <20260929-ram-interface-stuck-v3-v3-1-0d1a54db233c@oss.qualcomm.com>
 <d45f758a-8d00-4f76-aef9-7364156f4ce3@oss.qualcomm.com>
 <as7c1LHrOsqAA4Nx@vbox>
 <94c4056d-7f7e-46ef-97cd-dd12621260bd@oss.qualcomm.com>
 <atAuSs9VTveGwzpy@vbox>
 <526b4857-4a4e-4ebc-a367-bdcf9a9c9a53@oss.qualcomm.com>
 <atgaF8VoapljDa2f@vbox>
 <138abb5c-b1cb-44e5-a103-dccb022f3102@oss.qualcomm.com>
In-Reply-To: <138abb5c-b1cb-44e5-a103-dccb022f3102@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA1PR12MB6553:EE_
x-ms-office365-filtering-correlation-id: ceba513e-e23c-4791-4ad6-08df395820ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|22082099003|18002099003|56012099006|261102123227099003|261022105027099003|261021123027099003|38070700021|261021121427099003|261022075727099003|11063799006|5023799004|4143699003|10067099003|261028144727099003|261026121527099003|261026140227099003;
x-microsoft-antispam-message-info:
 esEipTBInOSr3TkBGXt35LeP80t8zvSr9J9s/9iX3eEnTncBRSRW+pm0bAnoxg311XPNM8O+XuzP8ZIKyHNjD3qabrt2HxVBU1NzyUroMvhHbJkdjsK/+fcoDs+o38FXSOeJhoLLJ28nQnQvcEpLHDDB0PHTECvUERInuCObLoGa6n23JcmkVdwaOetefbRvCoj3ag5IrGt0sqCNDbgOrTQf1pZqx8RqcFJs0GFLUVi/E64e1gpDqRX2ZGTm2ALrbBuLudKe3jig+XWDuRBsRx0Pi/z1eHwoBEAUdGHXsvZ172r0ls4KkoYmJy3z23EixCz5kQ+oDuhg1mx6RU3UHmVUeMsRZaUNb6+vj65DVIKcoD/AmaYkn5m3UnaiFj7n5EfFaHTR9n0Rm8OfGlMVzPaXnZ37Fpio3DABe4UPImpmNoqDCjkTuPYEO3dMJG1c5ilxMUb3aPGX7YBvHNbbPdS1il8i0Ni549tbmw7hb3NEo05ShbEMfpyCuRLRmTjwH4wwu6KnfS4fXfU4HzINPm3EuuHo9SZs3HKAvWlbqwhNB0sNvcysbgcMAELFnAIyA2enuQ17aA2/f32i6xjur1dgCEICgNIQJkrfwXeoEWP8L3eyW+3otLMlDqFtNmDFri+Yi2+FD5HH5eqH3d57BwR5+ac9ViI3vY9LJ68hkXVp4JTicB+4DpawTEXIgcj41lTn+EABhwqFbnVLd7jNeUxz4zwSIwlGlSgaDp8F8y8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(22082099003)(18002099003)(56012099006)(261102123227099003)(261022105027099003)(261021123027099003)(38070700021)(261021121427099003)(261022075727099003)(11063799006)(5023799004)(4143699003)(10067099003)(261028144727099003)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ckhZQk1sZFR5SnBFNlJMRkk5dlBDa0dXSXZlNTFpZ0JvZC82S0J5SXFNRTln?=
 =?utf-8?B?cWhFYTlNS0tZM3cvSmFoRzl1Uk9QVmtzV1BSSGM1ZGd1ZVhSS1NCTnhPSm1u?=
 =?utf-8?B?S0JMSHR6U1JNMDZ6SUpRbkRkekJlL1p6WGlMUnRJTVlrcVJ4bU5Sc2tlOFdJ?=
 =?utf-8?B?ekEvbjljM29xYjYvUjVUcG1rS0lsM3VYNlc3emViTjZnSXFEeTF6STZydFlU?=
 =?utf-8?B?UGpQT1ZJVnROKzhnQjNmdE9vdHJYL0ZBV1FHL0loYmlzaUhxbXVaMUVoOEFT?=
 =?utf-8?B?dlJtaWhTa09VRmVVdkk1V0RYQkNiTy9rUjBxbXFBMndaa3Z5aENnNHVwQTNF?=
 =?utf-8?B?dUFtcDRNVzI4K0h0eVAvWmpQbWUyV2F4WkFuUDV2R2huckZXZG9icGNIZy96?=
 =?utf-8?B?QWNCQ25aSkx3NDB0WlN4SnBOZzhOaTNQTkEwcjIrMkV1eEZOU3d4OXd6YzRL?=
 =?utf-8?B?S3J2RXN6SUg1SERKTUo1VWlsQncwcmdkMTQzbWUySU9xS0wzOU50ZXkzbDNI?=
 =?utf-8?B?VE5SS2phbzNmbDEvZit4NGZyNkwxbWd5bFVOUm9uOUZRdHdaNFNuRWZweXo3?=
 =?utf-8?B?SjQwRHY1WXNXMFY3RkVIUlBoK3BrbFMzcVFiZ0F0QzRlbGFYTXA4M1o2MHUy?=
 =?utf-8?B?T21IK3JMWDhRS1gvaGM1b2JUb28yODJYYXJrYk9nM0tnREFaeFQwODhEcGwr?=
 =?utf-8?B?L1Uxa0t6MXR0R1JpT245SFN2MXJ3MzN3UU1VWWVmVk1aYWRoV29NMFY1WS8z?=
 =?utf-8?B?ME82dnBzQjRlNTN6dUpORy9obVdLTFJFRHhyVVNhVmJBZnRxYWtPWkJSVmx2?=
 =?utf-8?B?WnJSMk9YUW45ZWxYd0NUcTlqMmNmd2loVEpoNDRQNWtVMHVFZGtJdDExNWtt?=
 =?utf-8?B?b3Z1OWx4NG1iSXdCL3p6R3NHSXY5Vi84VWZzanJRTis3aElOODMrVUlDS0NJ?=
 =?utf-8?B?MDUrM2xDSVo1alA0NzRXejcxV0Y4RXA4OW9maEFwSDZFTCsyRW54azkvdkFl?=
 =?utf-8?B?UkR2YVNPUHl1Z05hY01NVW94U29tRUY1bXMvdmxoV1Nvc0h4Y04wcDVMNTFB?=
 =?utf-8?B?cU10dVczalZXTGxPZjlEZld1cVVoRjg0UEh4MTFmRVlweHJLbmIwa1VmV3lj?=
 =?utf-8?B?aEpkTzFZdXQ3YVZySE1OUUt2NW9DUXZqd29LaC82bDQ2cmdad2l0NFJ3VnFh?=
 =?utf-8?B?eFhVREl4R29yMzBDblpDTkJSbjVwZ0kwOEs2QWtxQjdQdzgxbS9uanNEV1Ju?=
 =?utf-8?B?Z3J5QkorRjJnemJKb3dYTUU2WVdFelovRnNCQWJHRWhxcyttZHc2cFlSeDZH?=
 =?utf-8?B?alorNlI4dERqR0c3ZUttbVMrbWUrdHAxRlppc3Jmdk8yZTZyYTl5U3pBSTEx?=
 =?utf-8?B?eVJjNmtQWmcvNUxLcDdPMkxVRG9oMmtBZk5jZU5tL0FmTlZNUFU1Y3hFZXpi?=
 =?utf-8?B?Qy9vemhlTUhvM09LRE5qU3lZY2dmSjJXS01OY2xSQTZBTTBodFlSckRhM0VI?=
 =?utf-8?B?RFRJMW53cnY1WDF0NmpOTWxyTEVJVGorNXd0Rngzb3p0TE82bE5Jd3pseHNl?=
 =?utf-8?B?TisrbkRLWUpwMHJ4bTNiMjhMUHBmMU9xZ2pvTHM0RFprQlBnWnJ1SzRJVW1F?=
 =?utf-8?B?M1FGeUNuTE11cHVBREVBMVFnMzVNR0Q4V21ZaVRQRUxtRVJZaUhqbXFGVGdo?=
 =?utf-8?B?c29WYXBhaW43aWIvejh6YUhubTZxd0NPcVB1bUhuUXE3YlNaeCtwOWhoU2Rm?=
 =?utf-8?B?aGg3bFhETlQ0QVZCNE56bDBDZFp5bElwNG8vaXc4TkcyOHRLTVNUY0IyeG5G?=
 =?utf-8?B?dEp6VklxdU1jVDM5ZGtKS0FkOVhXMkhDOWpacFJqdFEzSkhXRWpGMjdma3gr?=
 =?utf-8?B?U093WjF2dnlZS05TRHlHTWdtMjdMcUUxM1lYdDdiVjNmYWpMM3g0dzdRQkpU?=
 =?utf-8?B?NmJIMG12WjEyNlN4a2pxVWdJZXMwY1NWR1NXNzloZkFJNk9CQlhYS3hGaEor?=
 =?utf-8?B?VDhuK1pWb0NMc21KdWpqcmtoWmlhd1NHUHFCYkxJUEpLdGRQTi9iZXkwSEw1?=
 =?utf-8?B?am80YmhjNHdreXFCaTd2eEVJSnFrSHoxU3F6SUdQcHZzZmRBd3pLMjFPbld3?=
 =?utf-8?B?dlFrSmJjL2M5YytIaDFRODNzUDlYNXVCVFpiZ2FMYThIakFoVE54bmh5UGp6?=
 =?utf-8?B?SjcrOHJiNlJvQVhiTkQ4VGVrUTNpOE9nUXdhRWV1SnF3QmtFeGw2STdGblZj?=
 =?utf-8?B?N205THRyMk50Z1BjeDBlQWRKREJ4RHcrdExaK1doYW0wM1dPZFVVSW5CbFJX?=
 =?utf-8?B?KzBpT2d2azFCSnY5cE0vbXBpTzFHbzFJOGpDb084OEZHQ3h4Q2x5UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A44C0F24315B76488B2A5C4A08AF2A6E@namprd12.prod.outlook.com>
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
	Nu6Lku9qW4E9HDM8WniHSiDiFwsRuCTpIg2mStpFrQFaGJQdladynqUhHdZNPnp0PMLd7hQBbr4JIBOsfp99IfYaHB1OQKs5SKUhJMskMjAeLd92QQeuMDUu8IlT+ewFpAWSoTHLfHyck3naLGJF3u+wOIDxmKZnQUjpMvZCa8gteSh80jBlrhr8YWI6PqY86Ni20ziKaScjU5CcAwAfAMrJO8JRRjukc2OFDj9hB+A7LUjD78ZrZvzqTEr4UajtmGSgd1A0G78vQk3wrGOXmkflQr/5MOXKr1yFOaMtbuqlLjZE+bekgk86z6KzGmtlJj5GdjXhUP9L/jl/kUAiBQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	8QmB3jtqURegsBYCDZaXOSWfrIUt49WoSXUdyVSf0BON4FtFYOku9pjwHtpcIFs3IQ5uBRvqQUfM5dXVCvhZqm6eWJeSvu/8ekKCywTmSO2uNX0WOXFERMfSNnFbx5ayWNMjQ+g0h/ADZ4sN8h++NbfNxEQEB6hn4xW35xEMDTK1btNyb7nK4+AwwmMhGxhvPyJv9uJKRcawy0aC/hpbpOF2tN0iSumBM4ixgzw2SEgBW4E9C6VkRSlOMimbOaC9LqRuakgjFztgt0ExvMTzropg+uvvT+J6ZbBwBwdxh8QVRb8l+yfGBDM0GN59szPvbT9Io3x+nhZ3YQP2PSfZRFotLasbdCq5ZECzEhp+X7/GQiTinm+nB0oJ1ktUSCqLaxApxh5wZR1OrpOzKotvlz70qA2XH8Nh5yT+DPYd1Tr/Bl5Rfw2VNNEGF/qIDWqxfs+UJbYtXWtXzoy3qifLnUHE1Xws2fiYLoXySSBbkXOlLPuCgf+2CwadBA134oTrW0SIRXOSEkl1cmAn6xFPltXe9M2lI3ztX5wdtcvPHW0AeqCf0qEos9vOzsacjARMqkT6+rmadCGnYet3ZTHdTG9wIeARRbgtje6Ea1kFw1hEGDGWsNAW41PcW7dQ60YX8Wmpka60kyLYKbVJCekTYA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceba513e-e23c-4791-4ad6-08df395820ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 03:11:17.7861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Yigs9IOyPh1/kV71kzzUjJxo25Joc5FiJVQjtVII0yTgDNPxtOPIEgRjjSgwF6chLp209e9xZRqYGv9MvELrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6553
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxMSBTYWx0ZWRfX/gk8FGZCZFuc
 Y7wVwSbQif6KJlHzxw+fkWSHa6wjIAbkY7POHqNu9R6x9tUqgTM47avn5OEY3FkLLM/3sGcY+tW
 QpZ73cH0Mo2mrUa3kw6Wf3SKSrbb18h6lnBnEHIyzTqknZV6bKH14gp7ZhCuxh2fZkZ4yU02L3o
 jqioLctQHg3AYDhX3kzHBm1QgXiNOOV0Y7/mAesRB2IDEhBywtdauAYsiSp7YiT3YjUXRbVXH/j
 96DyKlSwyn0GdM4TVh9re0B2WL3nxOdL+yUbQwJWVF8krCnizgbdgYkXebDtUpUuRNJW5BOzZcd
 /y4Sh+szQojNAvoMvAvJM074NpLmLydL/en+Qgy2jPeXS979BL/Vva4PXJHRmOeXFC4YZV0BEaP
 N0ruE954MeeZiR5s+L8bcuiNcOB8wbRV5xuPI5/BvzP3t5OKls0tEbLqV1fVsmOtkKpmAqUHoRG
 Zf0bjSqUshhEV4ATMKw==
X-Authority-Analysis: v=2.4 cv=dtNOmFg4 c=1 sm=1 tr=0 ts=6ae950f3 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=27X8ndOF5gFKqcEIrhgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: MbUiqKTWfVPCC0IlXHSU5cBtr6TRZRzZ
X-Proofpoint-GUID: MbUiqKTWfVPCC0IlXHSU5cBtr6TRZRzZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxMSBTYWx0ZWRfX9FM1GXVGRGLq
 v5z4wKYmGxlR90jDhBeqYvQwJc+g+cQt2PgbYBGj9TiWpjE96K+lVKM67Nh6qGbhzcIV3naTLq/
 lr1/SqfrKxPK8jz+wX5Nk6EUc25bEgs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 malwarescore=0 suspectscore=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030011

SGksDQoNClNvcnJ5IGZvciB0aGUgZGVsYXksIEkgd2FzIG91dCBvZiBvZmZpY2UuDQoNCk9uIFdl
ZCwgT2N0IDI4LCAyMDI2LCBLcmlzaG5hIEt1cmFwYXRpIHdyb3RlOg0KPiANCj4gT24gMTAvMjEv
MjAyNiA3OjMxIEFNLCBUaGluaCBOZ3V5ZW4gd3JvdGU6DQo+ID4gDQo+ID4gSSdkIHJhdGhlciBu
b3QgdGFrZSB0aGlzIHdpdGhvdXQgdGVzdGluZy4gVGhlIGNoZWNrIGFkZHMgYSByZWdpc3RlciBy
ZWFkDQo+ID4gdG8gZXZlcnkgZW5kcG9pbnQgY29tbWFuZCBhbmQgaW1wbGllcyB0aGF0IENTUiB0
aW1lb3V0IGlzIGV4cGVjdGVkDQo+ID4gZHVyaW5nIGNvbW1hbmQgc2VuZGluZywgd2hpY2ggaXQg
c2hvdWxkbid0IGJlLiBXaXRob3V0IGNvbmZpcm1hdGlvbiB0aGF0DQo+ID4gaXQgY2F0Y2hlcyB0
aGUgaXNzdWUgYW5kIHRoYXQgcmVjb3Zlcnkgd29ya3MsIHRoYXQgY29zdCBpcyBub3QNCj4gPiBq
dXN0aWZpZWQuDQo+ID4gDQo+IA0KPiBJIHdvbid0IGJlIGFibGUgdG8gdGVzdCB0aGlzIGluIG15
IGVudmlyb25tZW50LiBUaGUgb25seSBQSVBPIHRlc3QgdGhhdA0KPiBlYXNpbHkgcmVwcm9kdWNl
ZCBpdCBlYXNpbHkgd2FzIHdpdGggb25lIGZhdWx0eSBjYWJsZSBmcm9tIChJSVJDIFhpYW9taSkg
YW5kDQo+IENEUCBwb3J0IG9mIEFNRCBiYXNlZCBMZW5vdm8gbGFwdG9wICh0aGVyZSB3YXMgYSBw
YXJ0aWN1bGFyIHZhcmlhbnQsIEkgd2lsbA0KPiBmaW5kIG91dCkuIEkgZG9uJ3QgaGF2ZSB0aGF0
IGZhdWx0eSBjYWJsZSBmb3Igbm93LCBidXQgdGhpcyBpc3N1ZSB3YXMNCj4gcmVwb3J0ZWQgZXZl
biBvbiBLYWFuYXBhbGkgYXMgd2VsbCBvbiA2LjEyIEtlcm5lbCAobW9iaWxlIGJ1aWxkKS4gTm90
IHN1cmUNCj4gaWYgSSBjYW4gcHJvdmlkZSB0aGlzIHNlcmllcyBhbG9uZyB3aXRoIGVycl9yZWNv
dmVyeV93b3JrIHRvIE9FTSBhbmQgZ2V0IHRoZQ0KPiByZXN1bHRzIHNpbmNlIHRoaXMgaXMgcmVw
cm9kdWNpYmxlIHdpdGggdmVyeSBkaWZmaWN1bHR5IG9uIHRoZWlyIGVuZCB0b28uDQo+IA0KPiBI
b3cgYWJvdXQgd2UgYWRkIHRoZSBEZXBjbWQgY2hlY2sgYW5kIHRoZW4gdGhlIEdTVFMgY2hlY2sg
aW5zaWRlIGl0ID8gVG8NCj4gYXZvaWQgY2hlY2tpbmcgR1NUUyBhbHdheXMuDQoNCllvdXIgcmVw
b3J0IHNob3dzIEVORFhGRVIgdGltaW5nIG91dCB3aXRoIENNREFDVCBzdGlsbCBzZXQsIHNvIHRo
ZQ0KREVQQ01EIHJlYWQgYmFjayBtYXkgbm90IHNob3cgYSBtaXNtYXRjaCwgYW5kIEdTVFMgd291
bGQgbmV2ZXIgYmUNCmNoZWNrZWQuIFRvIGF2b2lkIHJlYWRpbmcgR1NUUyBvbiBldmVyeSBjb21t
YW5kLCB3ZSBjb3VsZCBjaGVjayBpdA0Kb25seSB3aGVuIHRoZSBjb21tYW5kIHRpbWVzIG91dCBp
bnN0ZWFkLg0KDQpJJ20gZmluZSB3aXRoIHRoaXMgYXBwcm9hY2guIFNpbmNlIGl0J3MgaGFyZCB0
byByZXByb2R1Y2UsIHBsZWFzZSBub3RlDQppbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCBpdCdz
IHVudGVzdGVkIGFnYWluc3QgdGhlIGZhaWx1cmUsIGFuZCBhZGQNCmEgZGV2X2VyciB3aGVuIGl0
IHRyaWdnZXJzIHNvIHdlIGNhbiBjb25maXJtIGl0IHdoZW4gaXQgZG9lcyBoYXBwZW4uDQoNCj4g
DQo+ID4gQWxzbywgbG9va2luZyBhdCB0aGUgb3JpZ2luYWwgcmVwb3J0IGFnYWluLCB0aGUgc3R1
Y2sgc3RhdGUgY291bGQgc3RhcnQNCj4gPiB3aXRob3V0IGFuIGVuZHBvaW50IGNvbW1hbmQgYmVp
bmcgaXNzdWVkLiBVbnBsdWdnaW5nIHRoZSBjYWJsZSB0aGVuIGdhdmUNCj4gPiBubyBkaXNjb25u
ZWN0IGV2ZW50LCB3aGljaCBibG9ja2VkIHN1c3BlbmQuIEEgY2hlY2sgb25seSBpbg0KPiA+IGR3
YzNfc2VuZF9nYWRnZXRfZXBfY21kKCkgd291bGRuJ3QgY2F0Y2ggdGhhdC4NCj4gPiANCj4gDQo+
IEN1cnJlbnRseSBvbiBkb3duc3RyZWFtLCB0aGUgd2F5IHdlIHdvcmsgaXMgdGhhdCBpZiB3ZSB1
bnBsdWcgdGhlIGNhYmxlIHdlDQo+IGV4cGVjdCB0aGUgY29udHJvbGxlciBlbnRlciBydW50aW1l
IHN1c3BlbmQuIElmIHRoYXQgZG9lc24ndCBoYXBwZW4gYW5kIHRoZQ0KPiBjb250cm9sbGVyIGlz
IHN0dWNrLCB3ZSBkbyBhICJ1c2JfZ2FkZ2V0X2Rpc2Nvbm5lY3QoZHdjLT5nYWRnZXQpIiBhbmQg
dGhlbg0KPiB1cG9uIHJlLWNvbm5lY3Qgd2UgZG8gYSAidXNiX2dhZGdldF9jb25uZWN0KGR3Yy0+
Z2FkZ2V0KSIuIFNvLCBpZiB1cG9uIGFueQ0KPiBwbHVnLWluLCBpZiBlbnVtZXJhdGlvbiBmYWls
cyBhbmQgaWYgd2UgZW5jb3VudGVyIHRoaXMgc2NlbmFyaW8sIHdlIGFyZSBub3QNCj4gaGFuZGxp
bmcgdGhpcyB1bnRpbCBwbHVnIG91dCBpcyBkb25lLg0KPiANCg0KSG93IGRvIHlvdSBkZXRlY3Qg
dGhhdCBpdCdzIHN0dWNrPyBTb2Z0LWNvbm5lY3QgYWxyZWFkeSBkb2VzIGEgY29yZSBzb2Z0DQpy
ZXNldCwgc28geW91IGNvdWxkIGNhbGwgdXNiX2dhZGdldF9jb25uZWN0KCkgcmlnaHQgYXdheSBp
bnN0ZWFkIG9mDQp3YWl0aW5nIGZvciByZS1jb25uZWN0Lg0KDQpXb3VsZCBiZSBncmVhdCBpZiB5
b3UgaGF2ZSBsb2dzIHNob3dpbmcgYSBjb25zaXN0ZW50IHN5bXB0b20gKEdTVFMsDQpEU1RTLCBE
RVBDTUQgcmVhZCBiYWNrKSB0aGF0IHdlIGNhbiBjaGVjayBmb3IuDQoNCkJSLA0KVGhpbmg=
