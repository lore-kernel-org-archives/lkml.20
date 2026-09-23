Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF55B28D8D0;
	Wed, 23 Sep 2026 01:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128627; cv=fail; b=gXO6CzAECX3e/2nFOfA7cs97zKcGOwXtaWrFNUg/9Wiak4GxkSsvswAcQWJi0zFnVCPqTkSaLX/ZF8SiVQGZHmt4H0zLOK4Gmuno83+17YCTIr+Y3Rg/eG/R2x0R+3fzSC/C4wUV06sRBTA7l8Rgc2yycO1JsWqjh0Wmg/k0/Tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128627; c=relaxed/simple;
	bh=m0vqqZfJxqaQUARmHf1eyGfrbu8/M+t/y9P1ac3ks6M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E/D07NMXo6sLcpTlNx0M1cQbZegjgQI0bXw2z/Dl4VveuANV2Kfon8VvfoMAJvyfd3D/JICJvQw/MLcUo2E60pC+Qp8UObB/TqrLW4LgjFG4a1c5YkaSkql5hTnJh87T+8yZ4GiIGaSWNyokk1OQU2PnY64QeeIyequZE5plbWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=USfGHAO+; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=SWW8LI37; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=D16/YwAe reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="USfGHAO+";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="SWW8LI37";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="D16/YwAe"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MK8nhx404927;
	Tue, 22 Sep 2026 18:56:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=m0vqqZfJxqaQUARmHf1eyGfrbu8/M+t/y9P1ac3ks6M=; b=
	USfGHAO+t/vfZFXJ69f7OiLkyip7zm4IwNlxZF5zJBS2b8By8Y4krbl7aufyRsTc
	i0lnHo25lQb0SFzDADZhkWno0m1/hhWR6wUbqcvvFVgMlmHAJcqusg447m1Y7pLR
	IIjwjVLLvBhtPz1ke576YU0xcLZgasAlrUZp97pG3sI10uwlRu5Q9Bv5967maQ5y
	cSnu1Jz8HTV0Oh1BCLY7mNseqTHbAoWS0iHyhJx0QXWSvz9eLAdox2fBRFwSZc29
	TzFI8yUxVHV2sKNJOaTHWM/VnixRtI2A2ypGuWGryhS+8/opXHJ/1KUVVSye9fZ5
	FCwps73krQtYpLCJcF6Xzw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4guw564028-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 18:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790128592; bh=m0vqqZfJxqaQUARmHf1eyGfrbu8/M+t/y9P1ac3ks6M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SWW8LI379NXMBYyYwAo4XXZH7RkYRVbEQVd/YLJ4c4ENqxtnBKtiITVun9o85UZ+O
	 44BolcyKWmqUrtqmri1O+na1Gews+vdBnpmB80/qUq3siiZLdC9MGQnvED/w/z8xlR
	 Zdyfl8xNUJi6P2h4W5sHZYQ5kYO0EuleAe0lmy83Q+X/v5vv+1q9wUzghnoEg6l6og
	 rjhEpsHHsrulzyXeHVEJc8lbgvbE4quVwOmApebExNYc533z0aPya5AuIgVf1A3DmF
	 XVk9ucsGRBI51kLoFBbWmlqpSpRL1KV6//V0sWOWRM6sTYO6C7qDI0ARs9Pyexq1Sr
	 TIdpWjHiUq9mQ==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 4E5E8401B7;
	Wed, 23 Sep 2026 01:56:32 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id D6C1CA0267;
	Wed, 23 Sep 2026 01:56:31 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=D16/YwAe;
	dkim-atps=neutral
Received: from DS2PR08CU001.outbound.protection.outlook.com (mail-ds2pr08cu00101.outbound.protection.outlook.com [40.93.13.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 9E5A9220138;
	Wed, 23 Sep 2026 01:56:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjokqHxEKMUl4aK/WkWycfWiDLc9tX6YDFKfgkydL5KjYUh43waltYMhWJSAZ8zIG5gu/AEu3OQD3MP24U8duayXcXttqkBQ973h5oy0dYRnDe04K+XAxarBvhUVuLRMSQI3XaOBIyBp8yZWeSUs1Wz8c9VYeAxaAY/YkkZlpgIsdWY0TyxjV1ipo0OjAWmdFzGuNYGCtbvF3JeZ2Jq/YtJqtmwS9Bv1wGqNM0ASOiUr0ppvTfP0Snr+d/dQ/tzoXEj5n9mjcBwUyVqF+zwPW0oKNeQ+c8baqpwqGXd3NZwe3l9cbJuRWe0JkH8P8Dl3+Vl1g9vxBlcaYXoboekr+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0vqqZfJxqaQUARmHf1eyGfrbu8/M+t/y9P1ac3ks6M=;
 b=QfVtmj2wfnDunXveUur7iwRRZak5CoM/MRj1u0wQm7oldhRAE0Hs4QfUORFR9Hv3j4ROv8nxXjasQnIe0fewolHCz00Ryz4yGGC9YNx4wpSIfklrgpeah+lD/DjPIedFc3p0pIKS74LSf6QPq2/S4TJehcqUPALd4NLgEcJUCO9dpUZud15aDhPfutLCLsOyQzQNyIh+Lh/e1P2aqvoQ9OvyN309v/AnbicK3df0DXKaj/hxXubcRVHjQs3RDupYbckXef/rNVOp7ejBZW4IUjWXHp9KcCuNS7afcZk4dFdH3J2dm76eG7InWb9Gy5LMVvXDGLCsu03iAAssjVYVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0vqqZfJxqaQUARmHf1eyGfrbu8/M+t/y9P1ac3ks6M=;
 b=D16/YwAeCKrNjNwpYzCsgLeQYp4wTnH0urVj7IioAPjm3s4YJL4l4vcvUof2SoUlkba45rCsXuk25kWmod4sEAFNBrDAHLevPyD4KQ5uVqnvof4+3GaK4G5bJH3sjXC0tkSphm3t/utxqn6RbBFMmRHkann2iXoFEAAUHAp85AY=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 01:56:21 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 01:56:21 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH 4/5] usb: dwc3: rockchip: support PHY reset notifications
Thread-Topic: [PATCH 4/5] usb: dwc3: rockchip: support PHY reset notifications
Thread-Index: AQHdRSVxWsV0viMGSES0d4yDSehnObbbcyaA
Date: Wed, 23 Sep 2026 01:56:20 +0000
Message-ID: <arMxuCdD2oiTFoS1@vbox>
References:
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-4-763bb546824e@collabora.com>
In-Reply-To:
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-4-763bb546824e@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|CY5PR12MB6405:EE_
x-ms-office365-filtering-correlation-id: d2b16fbd-e291-49c6-ae12-08df1915dd46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|38070700021|6133799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 cAcsI+F5zfMPc1mBHREUYVqMSpokawJ6Z8KKFpy0D9ySC1r3CnNQXkPbvE9LcsxkPZUS99KoxBkFMcL3K3EkqBEJAe2/veOnUfqzheFSQMIBA9CfgDSGo1vHqNS4MdhWJF8g7cojBavgIvHH7lWsW5OhQSf2f2zcNPi+mHOjQzcQlkyhMx5S4MDxKd76qMaiWvaQK6kO0SSo1bZpvYKjtq0NGNyNDYwTRHkLiRcUkPqc/ZI1VuuATlO0c2+/4UOodnymkurDFGRrX9vyMptDM7nAj03Ju4lcoyHaBdQ2kCiriwLtMCFlKVZcW/qg3dteIrKuwABaxYCIjYtGld2gRelLul/Rf+FyUNuEsJtH48Xz3u8XAps85b/T3rGP+haVgsE39jzXfI9G6OJUKiLm9A87kcSxOunB0bzZfgsO9/UvPiW1nlWblr7+eBgCy80S8pbTCcDdrwpoiCtaFs5X60jBK2JoN7CGVkRuDxH2CoQ+Pjk1+VzPM9uZ024/r5dzcPlfxRhXoqfOB1Gvq5gAkvuArbe5pe8ByTd5JHv49JTtbQPopzF6vIr7ve9O6BQb+CrZssjjjUZ2+f88kcaQ87Qpn5usx++kCfs7gfc0MQJSMSIZmc6UZu8mNbhzdIq2j8E5wS186bHs+PqU51vKeRcQfll66O7kp3p0Q/wNp40ZgmoQlYecuIXYmIj6tYsuAC61Dglv6GNaLYVb/oUTNAcf+kyc/THtPE+Epqoyuh8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(38070700021)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWJBSG9JdDhoUzFWK3JvanNHN05zMFl5UFEzS0Mvb3J2d3ZmbUpiVzJ3d3hH?=
 =?utf-8?B?azlEM05WeGZTTCtUMEFkaC9vcDgrQWd2aEpSL1FhL3B5YkZKdUlrWE0yOCt5?=
 =?utf-8?B?cWRhMlZJaUdiWENqOENaZUREalpIclVxellvOU16eXBHNUluVC9oMGRIcCtl?=
 =?utf-8?B?QXMvUE10Wkh5WjRNa0ZRWXQrNVJlYmJGWVJVT2RCQWh0ZXdRNlF2WEtWbHFo?=
 =?utf-8?B?clNpZXdqSnJMRTk3aFcyc1RkNGZSUlMwdWduam9HZGtaZGNoanlNd09OWnhl?=
 =?utf-8?B?VjZYQWc0Q25pZk1yVTNoa3M0NjdrVVVkZDl3bXlEYmMyUGYzWGgvWjFpampk?=
 =?utf-8?B?ZE5xcWNIbUtBYjVwOEFQVnQvTVdJU3dtOHllZmxaVUUvQmpGVktzbGVraWEw?=
 =?utf-8?B?VnBBZGttOVVNUm5COE5EQ29Kc3hmdkE0b1ZQTmtEUjM5TzIxbnBCRDZYbjVt?=
 =?utf-8?B?d3M4cWxRRHF1SXVwUXJmVmlrYjdqNHhwYTFzYWdWNUZUYXNMMGhnSTFuVWJP?=
 =?utf-8?B?b0RMNUFlNUNIUDVydjdpeHV6TWhDdHZ3V0MyeHQwVDJhLytLTUhGK0ZRRmp5?=
 =?utf-8?B?RVBlcFJvUnlEWjZxa3hWY3VVc0l2aDYzdHA2bUJRME81NUhhUGxEV2hOdVlp?=
 =?utf-8?B?Y05ZK3ZrUXF2VXpTMExJQmVKYWU0SkYzS3FnSUJtZjlCb3NHSVlxYVFLcEgv?=
 =?utf-8?B?ZFBGTjBaOXBSL2NMZ3NFaWVVaFgzOEZjVTAvdVVoWk5jR0drb0VDdFBySVYy?=
 =?utf-8?B?aVpIeTkwNVZsODlEUzJBKzVOaHNSMFdjOTJtZ0xJeW5Ed0VpS1Q5bFU0bzZl?=
 =?utf-8?B?VTRmbEorcWRQd0NUeG56R3A5d0NKdytRa0hUQk5ocVZ0YTFqT2QvRkZlT3o2?=
 =?utf-8?B?eFBKSWtQcnBKWVhxdGNUTDJoN0RZT0cxakFjTXpVS0EwOVB2NGlVcWdSVjI2?=
 =?utf-8?B?L2VHNUQxc3MraERLTFZVMXZQeTFRMW9QbHplK3pDSDRHeEdKTFIyZm91OGxI?=
 =?utf-8?B?SjlUZ0Rjdm12ZWxoSHY0WldMcTdyVzlIRnAxMnhtcXd1K08rWDZ3Zll6WlV1?=
 =?utf-8?B?ZjgyMGRVR0pXeVJtTUJsczhxb2RBSHFDb1AxVTV3ZUozSGNhd0JOZTZpVEZo?=
 =?utf-8?B?amZremcxbUZ3RGV4dHlBLzJTMmt6OEFZVVc3VTdHTzZYWG52ZEh6T1J4N0JZ?=
 =?utf-8?B?eFlPVE9jeFRmcFZHWE5BeW5xTjNaT3g2WkZiTTRNcUhXeDQzSGZnZjE5OWQ0?=
 =?utf-8?B?L3BERFhDQkpFc3J3bDZ5QXRVajFXQmwxZkVyeVUzSHBIVWlHTm9acDFTd2V4?=
 =?utf-8?B?RmhDbXZPOEtxVUZkU0ZKK1RRSGNjRGRYR1RwbGhsN01kWUh1WmlTR3BLRHY3?=
 =?utf-8?B?ZzZXWjRyMjY1cExrNGtua1FDd3hadmJuTFpCdVFBWjNwQzlMeFBYV3NXWjFY?=
 =?utf-8?B?SmZlVktKVDF5N1YwRG05U3YvTXhURGFDdFRlaExuUEhmV1kydHBWRS9ncW9T?=
 =?utf-8?B?TjRCUldncCtJSHAzRFVvREpMMW1OOFlLcVlVVElhbllwTkpUTGNYbElUWTJa?=
 =?utf-8?B?ZmVQbTlVSEVYQmZOeCtIYm1NSU5VQVk5dkwvVVZpcE9TMUZIZjlJMllaMGhQ?=
 =?utf-8?B?YTdzc1lQV290UnVzYkwrUFZRQlE3SFlMN3d6TDBtd24wWHU1azQzM3NERDdZ?=
 =?utf-8?B?V3ppaGhSK1pSUmprNzZLYWNWT1NUK0w4aTBVTnFEcFB1M2pFZXJSVm9RNkhz?=
 =?utf-8?B?YUJjT2dIWUlnSXRnTy9EbjVreVhORHFpeDlYVXBhekFHOXBpcmJ4R251VVZx?=
 =?utf-8?B?czVHdHhCNnVSOWlteTlWQ2VPaXZ1amV3VUloRzRhYmFMTzVhUC9za280MTkv?=
 =?utf-8?B?YUlnTFl0ZldrMjZybnpCdUM4V3gzUEFOVkNER1pJUmpsUU9OK0FwN1V3aDJ2?=
 =?utf-8?B?OUQ4TXYvSGliZTNRbTFMOXhqR1d2dnhvTzcvQVNyQkUyZDRzaFBuMVNnUHdk?=
 =?utf-8?B?eU43Tk45T3NjdkhtSFZ0VHNUU2ZyMmpEMkYxT2R4ajVzWVNEY2pDTzNFMVB2?=
 =?utf-8?B?QUphMXNtYkdMcHJXM2hvTk9DK0Qxdm12WE9hU0NsS0dhV3YwbnQzcldpS3d0?=
 =?utf-8?B?VnVSaTBUTHd0MWRGSHo3RTRmZk1vaGpFazRmLzFlUnU3cjhldTk2VmFVNGtK?=
 =?utf-8?B?eFUybEs0ZTA2dEticWVOK2VoWWZLOTZHOTFqUjJBMVczVGlDOXVHMUtldkhK?=
 =?utf-8?B?dUMxbHNLN3lacUFSc0tmNDVFZC84QlhOdzh1L2d4d2ltWFphNFRhSmlNNlZp?=
 =?utf-8?B?RTQwR0QvZVcwSWlKQkhzRkZIdDNSYW83NThUbzdQejZHRHl5TzJRUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D37E4B4E5CB76847915B1C88718CFA77@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	1K6PB4BonT5uOx7Z7EFk8ubIEVbKqgsOSKoDL3Iwz+HC1f2453IsdeaF3yxjBXAH+YOIRhU/4xWDuchycTkFUvhpPbLVhhO79eG1YjDaU1Ebf30LaII4pQbusThXClZzP2VmtT4ha3G3Q755OMAzVwA2sF6wY7YsN71CM5OU4AQqf6c3gZbYUceVXv+GZkchfPrXLxwBGRAjb0C9LGbNVIpL1zt1f0n2rUOMtlUKSFmuLz2CiH1iTfH3msXfLj2wi0oAboicm5ZFTh0bBO8eQDTmO7T4vOrx4aSOTc5wXP0MinKtOuko1W8iAnUanaqjZC5HI3LGwtnGSVInJI7n5A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Osa8EsVuOLhrVGUIN8NDl8G4wlbEfKAbfIfh0kx9kPiDcLkHwLMtLiNqnJdycplYoQeZECzzTN1vjt5pNlkqeuUXGOfev40MlEgm/LU8zG4Z8pXz5Y38wXJtlIwtwiTM+s4ek7N+oHISGt96wdeG9R4nmIVRJEzUbWx6eZUWMYZMCs6n/pWzoO71eXvAm6zqJtzcsIJ8vgZTmzFkT7CDzSqvicmzWqVsJrsrLxn0Snfy/QiyHLsvZ7xxX1E8Vd761eOgOCLUDK6saMCHi1QmdjeXZ6QNZiPBeu2fqGU2PXw3I21Cr9YQfgv2hMrWxrL7Vs4fCZLKSc68t4zIYqkJ9nJo0L37UwnFUh6Dtw9fsvyhySJXbq2FzM+6iWG2qtuH4sS7QQI+93KfOkLXTxszykNYkWR9rJdZCKO96xrjLnup6/OBn00cLtMPbznXNdmzZQ26GYsGyz14iaxkeN+ljLhD2QFaokGwHLCLKTrUIcKunNscLpZx7ew/AwyeQzrP92+B7jSOIpoqJ48G/RE9jFmdCgHqf/ycNsvv93UOoK5v0IchpAa4LFcLj4O/GGr9pmowjV8WhbzXpc5pZ9uwsocLUSAq46AstwtVgjBlwzft6rX8DbO55iAFxFPRyJvum+fr+5B3pqydDovF+OyEew==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b16fbd-e291-49c6-ae12-08df1915dd46
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 01:56:20.6863
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fd1Nb1KNRZWgpkyp9Luf7pvRXCNynLpivT7nrlosQ3T5qwau1VOxR4kyNWF5mNBReZcDAl0wM65bFV5LJWJ8NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6405
X-Proofpoint-ORIG-GUID: KU6R-QFz4yj8PAiG5Eve-0Pn_xwyQ_ph
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNyBTYWx0ZWRfX/u8WULk6vwIY
 JAOV+D5jICFK6rqmosej27fe8kcHAcTzuPa8YuAtXA2+f2OeD06b9tmpKl/KoXaadFSz9J7RJEm
 U5c8ZRj9VSe/0olN6t5PDyvbWKkv7cSB/N3K7TyQVdYf1gjznlFOQTIKNVl4RkQgPuBu7znwQ1K
 xcZsQHgiiRJoBq84d6Vozc+DieBCHJNbQUpPnZUG5ou8o/N9N5QustbjlJOeUGOlUhicViVz20c
 syPhK0uSaUKJnoD5weixiqqMnVMbRgjzJASrv9bm+/hXjMc854W225qiZ1hzpyIfQ9SN8tGsPNN
 gyngrl56936Qi52qrOMXdQUwYo/uKLGlZL1rGgaQVhr4CfCsi5yXvGd1QLNulLZwPKEeDVL5BgC
 ZkbSPb1ghGlHson9yF/5Z7S64MwTIGzoKgz8K8Ph+U/+99s580hpXel8mEP1TPqxIU8SgPs8xyJ
 +sOCAyFmoYzzP0WKv1g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNyBTYWx0ZWRfXyW8c8I3E2R44
 pzqRGEtkekAjkv5mGW/kALwE8mButduXlcXM9zKEAacIIeDn18yYC7j2sSI4jPk8bnw0FqZ9t+Q
 pgLdRuhhZv1JoFWyIXx5nZ6t0fTn9l0=
X-Proofpoint-GUID: KU6R-QFz4yj8PAiG5Eve-0Pn_xwyQ_ph
X-Authority-Analysis: v=2.4 cv=Mb/5KJ/f c=1 sm=1 tr=0 ts=6ab331d1 cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=jIQo8A4GAAAA:8 a=W2M8NIFbcosXO9OoIpIA:9
 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609230007

T24gVHVlLCBTZXAgMTUsIDIwMjYsIFNlYmFzdGlhbiBSZWljaGVsIHdyb3RlOg0KPiBPbiByZWNl
bnQgUm9ja2NoaXAgcGxhdGZvcm1zIChhdCBsZWFzdCBSSzM1ODggJiBSSzM1NzYpLCBEV0MzIElQ
IGlzIHVzZWQNCj4gd2l0aCBhIFVTQkRQIFBIWSBwcm92aWRpbmcgVVNCMyBhbmQgRFAuIFRoaXMg
UEhZIG5lZWRzIHRvIGJlIHJlc2V0IHdoZW4NCj4gdGhlIG1vZGUgY2hhbmdlcywgd2hpY2ggbWF5
IGhhcHBlbiB3aGVuIHBsdWdnaW5nIGluIGRpZmZlcmVudCBVU0ItQw0KPiBkZXZpY2VzLg0KPiAN
Cj4gSWYgdGhlIFVTQkRQIFBIWSByZXNldHMgd2l0aCB0aGUgRFdDMyBJUCBydW5uaW5nLCBpdHMg
aW50ZXJuYWwgc3RhdGUNCj4gY29ycnVwdHMgcmVzdWx0aW5nIGluIHRoZSBVU0JEUCBQSFkgbm90
IGJlaW5nIGFibGUgdG8gbG9jayBzb21lIFBMTA0KPiBjbG9ja3MsIHdoaWNoIGVmZmVjdGl2ZWx5
IHJlbmRlcnMgVVNCMyB1bnVzYWJsZS4NCj4gDQo+IFRvIGZpeCB0aGUgaXNzdWUgdGhpcyBhZGRz
IGhhbmRsaW5nIGZvciB0aGUgbmV3IFBIWSBmcmFtZXdvcmsgcmVzZXQNCj4gbm90aWZpY2F0aW9u
cywgd2hpY2ggd2lsbCBhc3NlcnQgUEhZU09GVFJTVCBiZWZvcmUgdGhlIGFjdHVhbCBQSFkNCj4g
aXMgZGlzYWJsZWQgYW5kIHdpbGwgZGVhc3NlcnQgaXQgb25jZSB0aGUgUEhZIHJldHVybnMuDQo+
IA0KPiBUZXN0ZWQtYnk6IElnb3IgUGF1bm92aWMgPHJveWFsbmV0MDI2QGdtYWlsLmNvbT4gIyBP
cmFuZ2UgUGkgNSBQbHVzDQo+IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBSZWljaGVsIDxzZWJh
c3RpYW4ucmVpY2hlbEBjb2xsYWJvcmEuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1yb2NrY2hpcC5jIHwgMTI3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQ0KPiAgZHJpdmVycy91c2IvZHdjMy90cmFjZS5jICAgICAgICAgfCAgIDMgKw0KPiAgMiBm
aWxlcyBjaGFuZ2VkLCAxMjkgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1yb2NrY2hpcC5jIGIvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLXJvY2tjaGlwLmMNCj4gaW5kZXggNjJmMmEwM2IwOGEyLi43YmRkNmUyZWIyMmQg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1yb2NrY2hpcC5jDQo+ICsrKyBi
L2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1yb2NrY2hpcC5jDQo+IEBAIC0yLDExICsyLDEzNiBAQA0K
PiAgLyogQ29weXJpZ2h0IChjKSAyMDI2LCBDb2xsYWJvcmEgTHRkLiAqLw0KPiAgI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L3BsYXRmb3JtX2RldmljZS5oPg0K
PiArI2luY2x1ZGUgPGxpbnV4L3BoeS9waHkuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9wbV9ydW50
aW1lLmg+DQo+ICAjaW5jbHVkZSAiZ2x1ZS5oIg0KPiArI2luY2x1ZGUgImlvLmgiDQo+ICsNCj4g
K3N0cnVjdCBkd2MzX3JvY2tjaGlwOw0KPiArDQo+ICsvKioNCj4gKyAqIHN0cnVjdCBkd2MzX3Jr
X3BoeV9uYiAtIHdyYXBwZXIgZm9yIFBIWSBub3RpZmllciBibG9jaw0KPiArICogQG5iOiBub3Rp
ZmllciBibG9jaw0KPiArICogQGR3YzogYmFjay1wb2ludGVyIHRvIHRoZSBEV0MzIGNvbnRyb2xs
ZXINCj4gKyAqIEBwb3J0X2luZGV4OiBVU0IzIHBvcnQgaW5kZXggdGhpcyBub3RpZmllciBpcyBy
ZWdpc3RlcmVkIGZvcg0KPiArICovDQo+ICtzdHJ1Y3QgZHdjM19ya19waHlfbmIgew0KPiArCXN0
cnVjdCBub3RpZmllcl9ibG9jawluYjsNCj4gKwlzdHJ1Y3QgZHdjM19yb2NrY2hpcAkqZHdjX3Jr
Ow0KPiArCXU4CQkJcG9ydF9pbmRleDsNCj4gK307DQo+ICANCj4gIHN0cnVjdCBkd2MzX3JvY2tj
aGlwIHsNCj4gIAlzdHJ1Y3QgZHdjMwkJZHdjOw0KPiArCXN0cnVjdCBkd2MzX3JrX3BoeV9uYgl1
c2IzX3BoeV9uYltEV0MzX1VTQjNfTUFYX1BPUlRTXTsNCj4gKwl1OAkJCXBoeV9yZXNldF9hY3Rp
dmU7DQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNfdXNiM19waHlfbm90aWZ5KHN0cnVj
dCBub3RpZmllcl9ibG9jayAqbmIsDQo+ICsJCQkJdW5zaWduZWQgbG9uZyBhY3Rpb24sIHZvaWQg
KmRhdGEpDQo+ICt7DQo+ICsJc3RydWN0IGR3YzNfcmtfcGh5X25iICpwbmIgPSBjb250YWluZXJf
b2YobmIsIHN0cnVjdCBkd2MzX3JrX3BoeV9uYiwgbmIpOw0KPiArCXN0cnVjdCBkd2MzX3JvY2tj
aGlwICpkd2NfcmsgPSBwbmItPmR3Y19yazsNCj4gKwlzdHJ1Y3QgZHdjMyAqZHdjID0gJmR3Y19y
ay0+ZHdjOw0KPiArCWludCBwb3J0ID0gcG5iLT5wb3J0X2luZGV4Ow0KPiArCXVuc2lnbmVkIGxv
bmcgZmxhZ3M7DQo+ICsJdTMyIHJlZzsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJc3dpdGNoIChh
Y3Rpb24pIHsNCj4gKwljYXNlIFBIWV9OT1RJRllfUFJFX1JFU0VUOg0KPiArCQkvKg0KPiArCQkg
KiBJZiBhbHJlYWR5IHN1c3BlbmRlZCwgdGhlIHJlc3VtZSBwYXRoIHdpbGwgcmVpbml0IEdVU0Iz
UElQRUNUTA0KPiArCQkgKiB2aWEgZHdjM19jb3JlX2luaXQoKS4gQSBmb3JjZWQgcmVzdW1lIGlz
IG5vdCBwb3NzaWJsZSBhcyB0aGF0DQo+ICsJCSAqIHdvdWxkIGNhbGwgcGh5X2luaXQoKSByZXN1
bHRpbmcgaW4gYSBkZWFkbG9jay4gRHVlIHRvIHRoZQ0KPiArCQkgKiBwaHlfaW5pdCgpIGluIHRo
ZSByZXN1bWUgcGF0aCB0aGVyZSBpcyBhbHNvIG5vIG5lZWQgdG8gYmxvY2sNCj4gKwkJICogYXN5
bmMgUlBNIHJlc3VtZSBvbiBvdXIgc2lkZSwgc2luY2UgdGhlIFBIWSBzeW5jaHJvbml6ZXMgaXQN
Cj4gKwkJICogZm9yIHVzLg0KPiArCQkgKg0KPiArCQkgKiBwbV9ydW50aW1lX2dldF9pZl9hY3Rp
dmUoKSByZXR1cm5zIDAgd2hlbiBzdXNwZW5kZWQgKHNraXApLA0KPiArCQkgKiAxIHdoZW4gYWN0
aXZlIChyZWYgaGVsZCksIG9yIC1FSU5WQUwgd2hlbiBQTSBpcyBkaXNhYmxlZA0KPiArCQkgKiAo
ZGV2aWNlIGFsd2F5cyBhY3RpdmUpLiBJbiB0aGUgLUVJTlZBTCBjYXNlIFBNIHJlZiBjb3VudGlu
Zw0KPiArCQkgKiBpcyBhIG5vLW9wLCBzbyB0aGUgdW5jb25kaXRpb25hbCBwdXQgaW4gUE9TVF9S
RVNFVCBpcyBzYWZlLg0KPiArCQkgKi8NCj4gKwkJcmV0ID0gcG1fcnVudGltZV9nZXRfaWZfYWN0
aXZlKGR3Yy0+ZGV2KTsNCj4gKwkJaWYgKCFyZXQpDQo+ICsJCQlyZXR1cm4gTk9USUZZX09LOw0K
PiArDQo+ICsJCS8qDQo+ICsJCSAqIEFzc2VydCBVU0IzIFBIWSBzb2Z0IHJlc2V0IHdpdGhpbiBE
V0MzIGJlZm9yZSB0aGUgZXh0ZXJuYWwNCj4gKwkJICogUEhZIHJlc2V0cy4gVGhpcyBkaXNjb25u
ZWN0cyB0aGUgUElQRSBpbnRlcmZhY2UsIHByZXZlbnRpbmcNCj4gKwkJICogdGhlIERXQzMgZnJv
bSBpbnRlcmZlcmluZyB3aXRoIFBIWSByZWluaXRpYWxpemF0aW9uIGFuZA0KPiArCQkgKiBhdm9p
ZGluZyBMQ1BMTCBsb2NrIGZhaWx1cmVzLg0KPiArCQkgKi8NCj4gKwkJc3Bpbl9sb2NrX2lycXNh
dmUoJmR3Yy0+bG9jaywgZmxhZ3MpOw0KPiArCQlkd2NfcmstPnBoeV9yZXNldF9hY3RpdmUgfD0g
QklUKHBvcnQpOw0KPiArCQlyZWcgPSBkd2MzX3JlYWRsKGR3YywgRFdDM19HVVNCM1BJUEVDVEwo
cG9ydCkpOw0KPiArCQlyZWcgfD0gRFdDM19HVVNCM1BJUEVDVExfUEhZU09GVFJTVDsNCj4gKwkJ
ZHdjM193cml0ZWwoZHdjLCBEV0MzX0dVU0IzUElQRUNUTChwb3J0KSwgcmVnKTsNCj4gKwkJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsJCWJyZWFrOw0KPiAr
DQo+ICsJY2FzZSBQSFlfTk9USUZZX1BPU1RfUkVTRVQ6DQo+ICsJCXNwaW5fbG9ja19pcnFzYXZl
KCZkd2MtPmxvY2ssIGZsYWdzKTsNCj4gKwkJaWYgKCEoZHdjX3JrLT5waHlfcmVzZXRfYWN0aXZl
ICYgQklUKHBvcnQpKSkgew0KPiArCQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmZHdjLT5sb2Nr
LCBmbGFncyk7DQo+ICsJCQlyZXR1cm4gTk9USUZZX09LOw0KPiArCQl9DQo+ICsNCj4gKwkJZHdj
X3JrLT5waHlfcmVzZXRfYWN0aXZlICY9IH5CSVQocG9ydCk7DQo+ICsNCj4gKwkJLyoNCj4gKwkJ
ICogRGVhc3NlcnQgUEhZIHNvZnQgcmVzZXQgdG8gcmVjb25uZWN0IHRoZSBQSVBFIGludGVyZmFj
ZQ0KPiArCQkgKiBhZnRlciBQSFkgcmVpbml0aWFsaXphdGlvbi4NCj4gKwkJICovDQo+ICsJCXJl
ZyA9IGR3YzNfcmVhZGwoZHdjLCBEV0MzX0dVU0IzUElQRUNUTChwb3J0KSk7DQo+ICsJCXJlZyAm
PSB+RFdDM19HVVNCM1BJUEVDVExfUEhZU09GVFJTVDsNCj4gKwkJZHdjM193cml0ZWwoZHdjLCBE
V0MzX0dVU0IzUElQRUNUTChwb3J0KSwgcmVnKTsNCj4gKwkJc3Bpbl91bmxvY2tfaXJxcmVzdG9y
ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsNCj4gKwkJcG1fcnVudGltZV9wdXRfYXV0b3N1c3Bl
bmQoZHdjLT5kZXYpOw0KPiArCQlicmVhazsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gTk9USUZZ
X09LOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgdm9pZCBkd2MzX3JrX3BoeV91bnJlZ2lzdGVyX25v
dGlmaWVycyh2b2lkICpkYXRhKQ0KPiArew0KPiArCXN0cnVjdCBkd2MzX3JvY2tjaGlwICpkd2Nf
cmsgPSBkYXRhOw0KPiArCXN0cnVjdCBkd2MzICpkd2MgPSAmZHdjX3JrLT5kd2M7DQo+ICsJaW50
IGk7DQo+ICsNCj4gKwlmb3IgKGkgPSAwOyBpIDwgZHdjLT5udW1fdXNiM19wb3J0czsgaSsrKQ0K
PiArCQlwaHlfdW5yZWdpc3Rlcl9ub3RpZmllcihkd2MtPnVzYjNfZ2VuZXJpY19waHlbaV0sDQo+
ICsJCQkJCSZkd2NfcmstPnVzYjNfcGh5X25iW2ldLm5iKTsNCj4gKw0KPiArCS8qIFJlbGVhc2Ug
YW55IFBNIHJlZmVyZW5jZXMgZnJvbSBpbi1mbGlnaHQgcmVzZXRzICovDQo+ICsJZm9yIChpID0g
MDsgaSA8IGR3Yy0+bnVtX3VzYjNfcG9ydHM7IGkrKykgew0KPiArCQlpZiAoZHdjX3JrLT5waHlf
cmVzZXRfYWN0aXZlICYgQklUKGkpKQ0KPiArCQkJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQo
ZHdjLT5kZXYpOw0KPiArCX0NCj4gKwlkd2NfcmstPnBoeV9yZXNldF9hY3RpdmUgPSAwOw0KPiAr
fQ0KPiArDQo+ICtzdGF0aWMgaW50IGR3YzNfcmtfcGh5X3JlZ2lzdGVyX25vdGlmaWVycyhzdHJ1
Y3QgZHdjMyAqZHdjKQ0KPiArew0KPiArCXN0cnVjdCBkd2MzX3JvY2tjaGlwICpkd2NfcmsgPSBj
b250YWluZXJfb2YoZHdjLCBzdHJ1Y3QgZHdjM19yb2NrY2hpcCwgZHdjKTsNCj4gKwlpbnQgaTsN
Cj4gKw0KPiArCWZvciAoaSA9IDA7IGkgPCBkd2MtPm51bV91c2IzX3BvcnRzOyBpKyspIHsNCj4g
KwkJZHdjX3JrLT51c2IzX3BoeV9uYltpXS5uYi5ub3RpZmllcl9jYWxsID0gZHdjM191c2IzX3Bo
eV9ub3RpZnk7DQo+ICsJCWR3Y19yay0+dXNiM19waHlfbmJbaV0uZHdjX3JrID0gZHdjX3JrOw0K
PiArCQlkd2NfcmstPnVzYjNfcGh5X25iW2ldLnBvcnRfaW5kZXggPSBpOw0KPiArCQlwaHlfcmVn
aXN0ZXJfbm90aWZpZXIoZHdjLT51c2IzX2dlbmVyaWNfcGh5W2ldLA0KPiArCQkJCSAgICAgICZk
d2NfcmstPnVzYjNfcGh5X25iW2ldLm5iKTsNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KGR3Yy0+ZGV2LCBkd2MzX3JrX3BoeV91bnJlZ2lzdGVyX25vdGlm
aWVycywgZHdjX3JrKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHN0cnVjdCBkd2MzX2dsdWVfb3Bz
IGR3YzNfcm9ja2NoaXBfZ2x1ZV9vcHMgPSB7DQo+ICsJLnBvc3RfcGh5X3JlZ2lzdHJhdGlvbiA9
IGR3YzNfcmtfcGh5X3JlZ2lzdGVyX25vdGlmaWVycywNCj4gIH07DQo+ICANCj4gIHN0YXRpYyBp
bnQgZHdjM19yb2NrY2hpcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiBA
QCAtMjYsNyArMTUxLDcgQEAgc3RhdGljIGludCBkd2MzX3JvY2tjaGlwX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAJCXJldHVybiAtRU5PTUVNOw0KPiAgDQo+ICAJZHdj
X3JrLT5kd2MuZGV2ID0gJnBkZXYtPmRldjsNCj4gLQlkd2NfcmstPmR3Yy5nbHVlX29wcyA9IE5V
TEw7DQo+ICsJZHdjX3JrLT5kd2MuZ2x1ZV9vcHMgPSAmZHdjM19yb2NrY2hpcF9nbHVlX29wczsN
Cj4gIA0KPiAgCXByb2JlX2RhdGEuZHdjID0gJmR3Y19yay0+ZHdjOw0KPiAgCXByb2JlX2RhdGEu
cmVzID0gcmVzOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy90cmFjZS5jIGIvZHJp
dmVycy91c2IvZHdjMy90cmFjZS5jDQo+IGluZGV4IDA4ODk5NTg4NTY3OC4uOGM0ZTJhN2IxNDJl
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL3RyYWNlLmMNCj4gKysrIGIvZHJpdmVy
cy91c2IvZHdjMy90cmFjZS5jDQo+IEBAIC05LDMgKzksNiBAQA0KPiAgDQo+ICAjZGVmaW5lIENS
RUFURV9UUkFDRV9QT0lOVFMNCj4gICNpbmNsdWRlICJ0cmFjZS5oIg0KPiArDQo+ICtFWFBPUlRf
VFJBQ0VQT0lOVF9TWU1CT0xfR1BMKGR3YzNfcmVhZGwpOw0KPiArRVhQT1JUX1RSQUNFUE9JTlRf
U1lNQk9MX0dQTChkd2MzX3dyaXRlbCk7DQo+IA0KPiAtLSANCj4gMi41My4wDQo+IA0KDQpBY2tl
ZC1ieTogVGhpbmggTmd1eWVuIDxUaGluaC5OZ3V5ZW5Ac3lub3BzeXMuY29tPg0KDQpUaGFua3Ms
DQpUaGluaA==
