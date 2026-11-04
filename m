Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=148.163.158.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793755751;
	b=oAQX3FZKAidPJF4t6kpAdtKJkCYoztWFa86KrE82E4Wx/NK5VbMEkWHL+6LHJ6dbY0rv
	 RU7KnjOhrrggM5XS8OrgrffnnJ+/NLVbdIGHpxDca9VyaOwk7MfUorK4wGGkzkCum2XpF
	 wPxLImlKZ48KOIH3w3HB49QeR9/ec1zsDbodt/TRnIApWfXXvMyL/xKFk9yxpBZ3gO4E4
	 DZuhx4OGzhlhem/gNPe6/gCLTef5WRAGrvsdHXLZ0JPfXhxruwE7HzbiZGNrRdPbDxaWG
	 RQnbtPWUzGwxlf7+9bh/dAVsT1inimz3QZ+xehoYefkCwGT6hBJCjwDcyE4unEPrLrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755751;
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
	bh=qxb5B2RwGaw2/Po1LjrvItnsJ8SXh7uA6Wah/T0eKp8=;
	b=JJ0Q2WGVXS404iB0e7EQbXVVEjo1EImTVlKNKeXB2sJDbTZK4zNqdsN0n2mSLi26iBvf
	 Sa8xD8YB/G99miBdn4I1pNg+wyG7kNEMdM+x5MgbxSah6KAoBtg5qL5E2dL6bQDsP/KyX
	 aDIGMbf+i0iWnLsTxDyt7/pSecvAriZpZIpB4j3+HxGnq8nd5XfrzvHyNf9YsAoNEKwDj
	 Bp7BqdD3VDOx+hHMGUvbrNoqSbVmPFXsuCmFqqkyPED50vbW4x7qUbPGtOMqh85UDJMll
	 r3aLEnc0DcUOAtGzpf9K8r+mR3WGa9aTY9r3dgtWNXjXcL6Hn74jzL1HZKvbDUk+UMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=synopsys.com;
	spf=pass smtp.mailfrom=synopsys.com;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=CUCPu9JU;
	dkim=pass header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b="SI/X9Vj5";
	dkim=fail reason="signature verification failed" header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KloHPapH;
	arc=fail smtp.remote-ip=148.163.158.9
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DE8606A326;
	Wed,  4 Nov 2026 01:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DE8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=CUCPu9JU;
	dkim=pass (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=SI/X9Vj5;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KloHPapH
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40SW9R1377443;
	Tue, 3 Nov 2026 17:29:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=qxb5B2RwGaw2/Po1LjrvItnsJ8SXh7uA6Wah/T0eKp8=; b=
	CUCPu9JU91NfcQAd6jkJdCE29X/NguP9OKEusMC5kzZZW9lg1+FtrSB6FjtX8coo
	OWgl2mNKw5Pc/TgXqgqZCnpoEY56u/CJgI39Jouh8wQ59FczwUbYZjFvBEOq0yYR
	FVZuEYU/nAnoEKCeRcDbATKu3KsNYI9d5H/K11SoBEi7O01ck3EcG/FDne7HRyYH
	yG+gQkkmF/PvfI0990E0Q7K8rL1Wz/7ps2y9FDRV+okLMVxcsRNxUP8Jz3IZ3ayc
	4aAYnvkxWpcFQZQiTkY20BO4f14tvKRkATeTSoiW6vZ/KRCiudmoErE2jeUYHt3k
	e16BUr6Ot+cVwzFTTxwzRQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4hqctvyvhd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 17:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1793755744; bh=qxb5B2RwGaw2/Po1LjrvItnsJ8SXh7uA6Wah/T0eKp8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SI/X9Vj5nc0AdGcvWgYpRjc9eFgLT/DaoU/+u68OQmoxDtu7Us/LIIh6+gnRBhh1U
	 hClmr4xnNPdsn79SLNBJDUySKV/xZxm957VFmzXlFmB15JPtogZshwyLQcfAEETCbH
	 AQyaNamXk0/0m1XveyKX3BogEXPybsRUAB7OBWfxjgP6Y8bD8OrV4AHpWVK7FeU98x
	 BPe/u6MJF5vH3zIltSh1WSNkrYfTAQNErLuYMh6keXwWTaxukJBa+kOr7/BGXWsm0s
	 FjT1D+fmNmwK0DaPwglBCG0MsQyGbx/dbEZIkaYf72vsSZ36ZKEPVt5IYAn6//1KHC
	 nNZ6vZruJJDGg==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CEE0040298;
	Wed,  4 Nov 2026 01:29:03 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 891CAA0296;
	Wed,  4 Nov 2026 01:29:03 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=KloHPapH;
	dkim-atps=neutral
Received: from BN1PR07CU003.outbound.protection.outlook.com (mail-bn1pr07cu00300.outbound.protection.outlook.com [40.93.12.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id EA60240112;
	Wed,  4 Nov 2026 01:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oV7N9gFC1C77qfV8E3Z5z1s4U3naKms/x/FHjZNgzwO6NLVK08xlC4FSTLop8mAiiJX62j1mjM2bD7f6r32s87zsUgcXTAOopk5CD/W2J8VPg8M3cBpVeMJHpau7kfyClmJilcXFiKPDSjKmfnwi4+MNadVfFZctHHLLmqlibBc8fS+If0npf2WX5BiRh2MtU4rfWOsmeNqarHeiTWgnM3RHtggQ1REUwO7PRnvYKzBiBtA4AgNvVHkKNaoWPWgf6UEevkr+AxNDndwMf6/FzKkiFF2NrFdtfYRUzmZRXvWLcnM4m/abTg33joEV/Ud4GZwRXue4SGoRAK1MeFnQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxb5B2RwGaw2/Po1LjrvItnsJ8SXh7uA6Wah/T0eKp8=;
 b=xwCej26/bf71gsys8WxY5Eo+sfbAzEmLb6pltK9DWaLN4knsFh6oc1L5skJoZVwoM72btBBooH28O/itT+Mh7HkU18ZV/Z85KMzLWhdh89bOwuji61JnUO4koswMwZ+oDq/ACWUmeGO9rN96zglbR4SLPzUljXIqm8klkCXGsz2A3rHmpVG1tNoMX1EdWl/CKwtdtq5fxSu4SUu7nlKk4rQWSNAayoJM3Cl35ibKj82IhPmEiz5ICdGGZwVT45EXQVYjiH2L93g3J1us5ahqr66vW7y92qbMY883uLn3Ecu4FpP3bBIIGRhdcK3MJpt0PxEhS5MQxaef5OKe1cejxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxb5B2RwGaw2/Po1LjrvItnsJ8SXh7uA6Wah/T0eKp8=;
 b=KloHPapHnN3fmdz4udZ3OO4JVUGh3JIivl/492+xrQVS5estopg836I5h4ByTvc0TUKHUmkC36j8Fxk1w29pCPRvCpqJ1s9vgpf8QjoJfaQSITLHEstGAVfhARKHD4v2qZHYA3OWGKQkpR8wSZJmLwyeHtGmjI0wnOr8d5zsK0w=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA4PR12MB406293.namprd12.prod.outlook.com (2603:10b6:207:12d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 01:29:00 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%5]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 01:28:59 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: wa for isoc packet tx fifo flush at periodic
 frame boundary
Thread-Topic: [PATCH] usb: dwc2: wa for isoc packet tx fifo flush at periodic
 frame boundary
Thread-Index: AQHdW8D0Ok9Q3K5XUkeyGQlrnXGa57cdQB0A
Date: Wed, 4 Nov 2026 01:28:59 +0000
Message-ID: <auqF48Lk6EEyF2mV@vbox>
References: <20261014-dwc2-fix-wa-isoc-v1-1-f261ce0852bd@foss.st.com>
In-Reply-To: <20261014-dwc2-fix-wa-isoc-v1-1-f261ce0852bd@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA4PR12MB406293:EE_
x-ms-office365-filtering-correlation-id: 1ef8168e-ccf4-47be-8718-08df3a13009d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|6133799003|10067099003|22082099003|18002099003|38070700021|56012099006|11063799006|261021121427099003|261102123227099003|261009223027099003;
x-microsoft-antispam-message-info:
 JxrdEuzWsIKJpn5ImfLGz4YQ7FbXSKyWHfzbxZ1WKLnywoNVxZsIO8AvV0ICp87Kx8LL50B+lRbmLP+jw0CvyRCYfopPG3eNKMeq5+m7AP9vOh6K6nHwW7qFMHnXwWPGSy0+dEstgTg2+yV60L7z3Nl6gntVbXHjIINJ8P0cZ5UJV1fBvKAvT9SEqxmdFKv7P7TyUEd8dLNYJ4aSwFoHsSeBMOdEunkyvEzuIoPJHv49CFxVI4VanZcYEq1OkWLd3+R5CmoMIkkYU45Zq4OmDfJ6L9iLzNUmbTR9HNJQFdm6fUHQMPwCTmRX0zdG2SLepZNFVFiJd404xc1he1La9zEeqgOHJfKQ8jcxX+4a0JzmV+WEQ/dc+qxsf6LU21u8V/mmzCF52ndHRu5HTEBrCciWK6aKjDumVPsyhHw938HE1MlCG9IpznlMwwpqvNA9y4p718gVaeI+963L8E3qRlAvWnxSEz0xH05lL9A/BD37ilV3xGZ9BFDqqoYrInkLiP1t/XISeIZonGJHjHS4/Z3V8TDXyA/FOe/vi8x92wrj9T1zMjbSplxb2leD67z2FbK0jiTdTbcSq8zQhZIKY+0XKRGqho4DkyJ3aJi0qOh6uZ1+bnEy9hDudobj2X6rWy2kBvz5fcTCmfUYC+P49aJq1/OTESmRCpygEeBTUhVscvy/rg30MTTnV/wgnnG3EqBwL80hFR9GH4ZR11pX6PNzRjdOW6GzrpwoFu0aXf8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(6133799003)(10067099003)(22082099003)(18002099003)(38070700021)(56012099006)(11063799006)(261021121427099003)(261102123227099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlJqZVMwblFkR0IwQmNEMGxkUllFYjdOaVhXNEJnOW5Bem1wYUtpS2VyQmZU?=
 =?utf-8?B?ZTZqWVBDSDUwbnV6Rmk3SEIrVlJtdytYeThkZ0g1OFQzZ3ZPWGdSaEgyUXJI?=
 =?utf-8?B?TUdUcjhTcU9TdkgrTnpQYktjRjh5RHFwM2ZZUGNMSE1aNzhyL3YvMitrQUQ2?=
 =?utf-8?B?bDN2UzZod1dibjFBS2RMTW81N0NPbjNDVUVSem9yd0t0OXY0MHIvMXRhc25B?=
 =?utf-8?B?bGhTUGt2cUowdnREUDgzNFVqSFFPajFBckpHVXI5a1pXK3lsRXNZeUJPcUdU?=
 =?utf-8?B?ZzlTd2dMb0R6VTk1K3hUclhwREJHYjdOTW9vVUpqbkR1TUxqaTg3aG1sdzNn?=
 =?utf-8?B?MWljT3RSTTRnTnVSQ095VVdqcVc1M0NpeXNRSjE4ZC82RkR5RWJPS1BWaE9R?=
 =?utf-8?B?Z0FSK0VsQ1pkK2hnSVZXaG5oMVZMbC8wUG9qeXAybGpUcENmVEZ1SHB0U21F?=
 =?utf-8?B?YUcvbFV0Z01rQkNNOVgyWnUveE9uNkdvcWJxc281dTB1UFptR2dSUWN5ZldY?=
 =?utf-8?B?UjNnSE1UdmV4WXpNMWM4QThPRW5OTzU3bDZTSlhBNUtqcmZoUHBGMjh5ZUx2?=
 =?utf-8?B?aE9yRXZNQkd2ekZXMyszV0llQmUwbmlMbWlIYWlNN3N6Z3ArV1RMYXp1V2dX?=
 =?utf-8?B?WEFUNFgvaFdGM2pvUzBwcW9wUEcydHBYS3BNRWlPNjBLL2QxMVQ2bHFCWU9m?=
 =?utf-8?B?SzhPNEkvWmRNQitSalpySkFudnZqSWcyS0N5akxGZEZ1cTdBSEZGVTJEaXFx?=
 =?utf-8?B?bUVBZkROdTlHdkZjaGQxaHhyVnJHOU9Xanhva1d3dG8wTVlobmxYZ09MaUdT?=
 =?utf-8?B?eEFBMDVsTWZ2eUxGbTJTK01qZG55cTFmNE5hVm0vR21iUjluc0lwRjdaWHNO?=
 =?utf-8?B?ajFQVldMeGI3bEI1eHBUMCtXTlVkSlpJWVhDUjZudTRva2o0cE5FcWNOeWsy?=
 =?utf-8?B?YW5pV3h6OTMvbkE4dFp3a0tIOUJySldlQkJwUVFGTGtzQ1BEdDB2aCtwVFZO?=
 =?utf-8?B?djFvNG1yK2RYaUt3dkR1S0x0cXJVMDhSOFh3aUxHM1BCRHV3bzYxWStEZ1ZB?=
 =?utf-8?B?WDJsZ1lITlV5SGk3TitpK2pBejVZV01MV2dxeFZORWtQeXhyY1JvTEVzWFRK?=
 =?utf-8?B?bzl3NXJCR0VSM21OMkhnT2l1UStvdERScWtiSFBzeVFzdGtOT1lSTzhRaEFx?=
 =?utf-8?B?Tmpqc1BreGRtang0Q3ZZckpTT0I0S1p0Wm5ENzVtUTdBQm5ab1JjS1pNdlBm?=
 =?utf-8?B?THVlZzlsRG9iVldBZmtodHZ3aVZ5WVZUb3dXaEZacERFVERZVWdndzl5d083?=
 =?utf-8?B?YTlkOUhpcVEzQkJEQndkK0xUUzRJOU9qNVFKYXdVYWVlWHBsZTlXRnZKbVpG?=
 =?utf-8?B?cEJlRjFpZjQrSlI5YXQreG1kdW53VENMaFFHUHU3WXVSeTQ3N1EzK0tKOERF?=
 =?utf-8?B?Rms0Vm82bmlydFZ4S3lSSVN4UjNWVG9HZ0JtWVhWMHI0aUFaU3gwQUdIVkVq?=
 =?utf-8?B?SXQ2V0Q0WEZrOUxIbHZEakdTVU5lS00xTVIrNzFFUkt1UVdDN3ZyTUNWR2Mr?=
 =?utf-8?B?QlhzY09FR1JZNklhZ3IwZGpwSDQrK1c4cHk2aEFYLy9uVHdxdldJeDRQUVRI?=
 =?utf-8?B?MjVsYVFPUVpmZFNvUm5LRUs0ckRmcWFjaFdReDUxbXRUbHdDcmVYbTdrOXht?=
 =?utf-8?B?YjBDZkVmM1E3czlJNnpFTy9td0xuRmNpYUxvejBNMi9nMUVhRDdpRkdxcVNx?=
 =?utf-8?B?QW9EL1FULzFKZStaOC9qbXYwVFp4a203YjZhRFNxOSt1TzlaMDRRc283ZGFN?=
 =?utf-8?B?VU9yek9MZmRld0plNVVBbFRhUm9PNFF0UEgvWkRINGZHN2swZFdEMmdQSHht?=
 =?utf-8?B?dElhbGtmQTBtZ1ZLTmVmR1VZSWZuVWZ4V1ZleVJhWTl0WXJYbHpSOEVMQmxo?=
 =?utf-8?B?TWdiUHlHeHdIbHpncWVldXZzdjg5YWg5OWhycXA4d24vbllMQzZGUzZuNjlC?=
 =?utf-8?B?OTl0R0dBVzdLVVZnWjRvYzVnY1ZUOHFjdFN1NVV3ZFhWZ2NPVituQm1YUWVi?=
 =?utf-8?B?eDlodFVCei8zazhIYVQrdnY5SW5TZXZRTk5DOXhvd2FzUSt4YnZsTEdvaWFF?=
 =?utf-8?B?ZGZ3aCtLTkZTZUV5STY4dW9IK1FMWEpmWm15cTdzYlR4eWtpU3dhaVBVKzhv?=
 =?utf-8?B?bGMrei84bXZ5aWhDYlFrM1NVV2x2V0JhaTVSV0g3azRFRzdlejNMdFN3bmtW?=
 =?utf-8?B?dTJ2MEt1ZTg3Z3JjcWFRNWhia1c3U0oxUUpTVVUvNHZxOHRnVjdZem42Zzhs?=
 =?utf-8?B?dVQwb0NKVEhEQlFadjA3MG9ZR01JWG1sMkhvV24zK1paZzZUaVdwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B84AC69ACD6CB34E9EE8DE36DEB21B73@namprd12.prod.outlook.com>
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
	298FgzO9J+k4nRWNwYA9/MwxhT3KpheYnLC0WFnjsk8Mjf7b/hw18x5SEAnoY5mcXw+6IGCjA+CHR9XaODQLrdg+79EEOdIMgDGjd3nlsk06EqAq9Ub0JYY7AZUK7XCDZX8jhW1oBHum5EP7/HarBYZe5egEAery6VB8v2b5lwo9VLFZMlk8ZAT7vg1tEV3421ALA/BV17+OdDFrs5Mvx5yRsWqP8FB4yCFlqVjekmFzzHTECgafqRvW+jp2dVGWj3fbaZ+sPjII0bT0Ho4dJdJJ7MwBOc4G1MLQlNumV54Q91dwmiZenDAo4HpT/3qGcih6JDRp4T8vx2lLgnI4Ng==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	ZnTfY+TBG/HSRcHnGKxTR5I9DnHL+llmSGAcLQXgkudNtpra1oXq/ukulNjBlSAaAyl1M8dqEP+dVMehAsMNcpFiqgpUT1fE7uPPhFiFWlJt8EkIppjC/Kn0UDPEn974n+HTU6yecxquU2eT3Ky6jholkiYeLfqcqrTnJza2mztghIL7YNyFSf6EnK9sgQKs6bNaN/RyTD8m4VIbJeB6dMkMHz52MoJ1GMvDLrYZ9WL0+yBLaSPNMmmjyBxNYgjcD5YiqjjbEAiFBA7ddmuY/l14HfZUON+n+xbXyxsrM/QN/CFTvD3/kNU5nznhhFyOMbIlu9/Uw0Tp3Elgv44hEy5AJPJBDsfYQTS86g+s/sT/vY2lnwyu/f/1wX84L14tmdA1MXQSc+QHYTN/tNDUIsaYXC/VNivUeVF1UfgSNFZNLwTRW5Mz3AAtTpR/jGOf1fW+hCWrMX+qRp2nlG/DUR4FwGkdbzRqXr06d7QMWqd6RtPeRfzyQqcuqKnm+ZME9hd18iDNsmbMFdZdUqF7eMqzRuDEEoUnZhqOmosN3DTJdF6vYQw/MwuGuqWdLVY0j246/nILNMjFuHh0zfVjmtsT84p0BtK/DQq0MzdPMWaSytvzT00iSIzp/2cukyypQPj4Ixmi9uMxkYRdZjDRsg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef8168e-ccf4-47be-8718-08df3a13009d
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 01:28:59.8375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WxCg5F26R7uEHQSREbMAUhgxVC7E9v85d5dqs1JCpwOiysoOMC2cyM99kj0TaqQRM20TPbxnCBB2iGykqoEOfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB406293
X-Proofpoint-GUID: qOx5FI4yYHcn8ff2D7ANJ-erolw7XrqP
X-Proofpoint-ORIG-GUID: qOx5FI4yYHcn8ff2D7ANJ-erolw7XrqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNSBTYWx0ZWRfXzExCPgPsbWnz
 p3WYQ7IkF+u4MUlm1yzVqwWtL12ANi7khYkOvmRB14ZTGCAticML5nocDQJmDOEhyntRt+Ze7lL
 mLlDmrWaetcIb8oxtepim28Su1rZ0UgGhUxqN0IHyJ9ti1tFnBEkw7E31Ysd1GDJ5qhS6crmGgF
 3Dht7yOUvY1JJv0zh4EGZAIoSaVppMmiteD3AemtK6hHjPXb68OaYsTJu/SqUQgSS8txrOF8tjS
 hQopRpANSMM4eFE9NnEZNFCfIQbnArJgEHN7ruN3bXhGWUIdCVIePDkZjqKv7ndDV5VzrdCYV7Q
 JQeVxTkXJnIacaovRf47aG7Dq83OzRQNX3Z9iXzC3kLaq+UeJtEiEv7fulFe+d9rLpznGoHFK4b
 WxVNE6osDnPKx6PxBdcdO4u8RStNIjn9Lf3uVIHtXDBey+ZPjAYbtdP2HdjhVPImamrcS/UJImN
 P12MJQcfGrhyHvA6oyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNSBTYWx0ZWRfX3SOMJYX4hu8e
 aCRgZ0t+Ai05YqACea94hGVcnTLcsDWHABME20H0M0ylgGyIsutSgxBdmQp1PdIQlTbKWZkST3b
 jQqBF2wpm9fbuWUtuEAOIk0PBgN0lqg=
X-Authority-Analysis: v=2.4 cv=ce5HPXDM c=1 sm=1 tr=0 ts=6aea8a61 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=HvI6M7qh1IcBVyPCDk8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 phishscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2610300000 definitions=main-2611040005

T24gV2VkLCBPY3QgMTQsIDIwMjYsIEZhYnJpY2UgR2FzbmllciB3cm90ZToNCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9kd2MyL2dhZGdldC5j
DQo+IGluZGV4IDEwMjE2OWI0MDQxOS4uOWYwMjA3NWJhMTViIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3VzYi9kd2MyL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzIvZ2FkZ2V0LmMN
Cj4gQEAgLTM0NDksNiArMzQ0OSwxOSBAQCB2b2lkIGR3YzJfaHNvdGdfY29yZV9pbml0X2Rpc2Nv
bm5lY3RlZChzdHJ1Y3QgZHdjMl9oc290ZyAqaHNvdGcsDQo+ICAJaWYgKGhzb3RnLT5wYXJhbXMu
aXBnX2lzb2NfZW4pDQo+ICAJCWRjZmcgfD0gRENGR19JUEdfSVNPQ19TVVBQT1JERUQ7DQo+ICAN
Cj4gKwkvKg0KPiArCSAqIFdBIGZvciBEZXZpY2UgRmx1c2hlcyBPbmdvaW5nIElTT0MgSU4gUGFj
a2V0IGF0IEVuZC1vZi1QZXJpb2RpYy1GcmFtZSBCb3VuZGFyeS4NCj4gKwkgKiBPbmNlIHBhc3Nl
ZCB0aGUgZW5kIG9mIHBlcmlvZGljIGZyYW1lLCBhbmQgdGhlIGNvbnRyb2xsZXIgaXMgdHJhbnNt
aXR0aW5nIGFuDQo+ICsJICogSVNPQyBJTiBwYWNrZXQsIHRoZSBkZXZpY2UgZnVsc2hlcyB0aGUg
dHJhbnNtaXQgRklGTy4gVHVuZSBwZXJpb2RpYyBmcmFtZQ0KDQpzL2Z1bHNoZXMvZmx1c2hlcy8N
Cg0KPiArCSAqIGludGVydmFsIHRvIDk1JSBpbnN0ZWFkIG9mIDgwJSB0byBhdm9pZCBpdC4NCj4g
KwkgKi8NCj4gKwlpZiAodXNpbmdfZGVzY19kbWEoaHNvdGcpICYmDQo+ICsJICAgIChoc290Zy0+
aHdfcGFyYW1zLnNucHNpZCA+PSBEV0MyX0NPUkVfUkVWXzJfNzBhICYmDQo+ICsJICAgICBoc290
Zy0+aHdfcGFyYW1zLnNucHNpZCA8PSBEV0MyX0NPUkVfUkVWXzRfMDBhKSkgew0KDQpUaGlzIGFs
c28gYWZmZWN0cyB0aGUgSFMgYW5kIEZTIElPVCBjb3JlcyAxLjAwYS4gUGxlYXNlIGFkZA0KRFdD
Ml9IU19JT1RfUkVWXzFfMDBhIGFuZCBEV0MyX0ZTX0lPVF9SRVZfMV8wMGEgaGVyZS4NCg0KPiAr
CQlkY2ZnICY9IH5EQ0ZHX1BFUkZSSU5UX01BU0s7DQo+ICsJCWRjZmcgfD0gKChEQ0ZHX1BFUkZS
SU5UX0xJTUlUIDw8IERDRkdfUEVSRlJJTlRfU0hJRlQpICYgRENGR19QRVJGUklOVF9NQVNLKTsN
Cg0KVGhpcyBjYW4ganVzdCBiZToNCgkJZGNmZyB8PSBEQ0ZHX1BFUkZSSU5UKERDRkdfUEVSRlJJ
TlRfTElNSVQpOw0KDQpUaGlzIGNvbmZsaWN0cyB3aXRoIHlvdXIgIltQQVRIXSBkd2MyOiBmaXgg
ZmlmbyByZWluaXQgaW4NCmR3YzJfaHNvdGdfY29yZV9pbml0X2Rpc2Nvbm5lY3RlZCIuIFBsZWFz
ZSBzZW5kIGJvdGggYXMgYSBzZXJpZXMgYW5kIGFkZA0KQ2Mgc3RhYmxlLg0KDQpUaGFua3MsDQpU
aGluaA==
