Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9053333B970;
	Fri,  2 Oct 2026 03:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790911208; cv=fail; b=OvoGHUE59XwZczZORnWDL49pycSgu/rvq3nkO+uhdXMd0GjkIkEhceAf98XWXvdQD73sgG/IzADURaSFLxZvq8/PTzMG9ZxALybn8SXvtZya5OrUypQslLohNfD+B2IxNAAvQ9DGvcD2q9mb13EPqtFJWjWGiJrcBqIhOirhfRU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790911208; c=relaxed/simple;
	bh=ykkjbZOahk1ElhIQ3/b5PSJ8CYk8AntNNA1+KosjB8U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PFSxwX0A1bKcRSDsULI2MFLSzcZojeDyof+RO/SBF9IaSbhTpsKGK2z0odQap8P0x5MjsqYC2fTayvXpfFvX/yMUvf2/8Fm+usaInge5dyyWDDtAb7s4DAriQJeM07lh2SQu63qw/r/5ac68fmmJdHLErMO4LfH6gwwG8saTDuI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=npNWdoGA; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ay6RRv0Q; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TDjOooeB reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="npNWdoGA";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ay6RRv0Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TDjOooeB"
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6922KnDt2754603;
	Thu, 1 Oct 2026 20:19:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=ykkjbZOahk1ElhIQ3/b5PSJ8CYk8AntNNA1+KosjB8U=; b=
	npNWdoGADfqUcagdO3AjfEZShjLDF2/q1wY44YJNsk5GDPiX50rZndiPU0ZMeQma
	J4bcYugJEUDVZ8xEDR0SmQD2rONoEoBYG7uhI0KdxVK9Ajtb5TGHSjFSCOayWnVP
	cVTGu6Rt6xe9HR647+JtkSm5BZK6TIcJ2bAOmJroGyGcSfaRWcOBqcPDZgAOipx1
	JKfYqgvraxQ6VeHozGC3pcwDMytA2uTN514bzcNl0hsdgrRgDUG+MAVwagTY9uoU
	iAYW4XsirhZVvRxbiLDC5Bet0ACvq7iCeBxVrpVCub9ZUwoS0wpkHNAWf+yoM6pg
	vG0cVsIcGTpUSI78FlJekQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4h1f3j8vm9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 20:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790911192; bh=ykkjbZOahk1ElhIQ3/b5PSJ8CYk8AntNNA1+KosjB8U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ay6RRv0QmkJ6t1o8vRG5ULzZ2ekb/OKpka09lNPaOSRct9J0D6s3WWDR6tQJRjv+9
	 B2Gk0c/92lRy3ZQ+3WzEAMr2W+oirrAIFgh2QeINFu5kobx8jA8HO92gX5sNHj864s
	 mwXzsYAjpNuwVYiyzOD8jsNlpjFUai9N7Kxi5LxPKg5G5jzZq8S4tyz5vHNe8Zpwbl
	 +1kvIgYM3HkZKRybUw0rxCbligF71Ums17fFMlZByw5f7MECCIOZsfUyW0GO6RJAh/
	 9UxcZ04CuEkX7sSGcZHCQHwuQLhUj7g2ThiUylBA9qGHYElI4lMkFtfhP56Rzmz9vm
	 ggX2u1n9HRPrA==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id B07F640125;
	Fri,  2 Oct 2026 03:19:50 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id ACE5BA0070;
	Fri,  2 Oct 2026 03:19:49 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=TDjOooeB;
	dkim-atps=neutral
Received: from SN1PR07CU001.outbound.protection.outlook.com (mail-sn1pr07cu00101.outbound.protection.outlook.com [40.93.14.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 5D2A840235;
	Fri,  2 Oct 2026 03:19:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AYcK6jz+suquk/XhiERS0LnQoSuHqzqyuBzh5adIhHrq+o55sI3ikVPncla4DiGhf9+M6aQXtKjbsBS45crEEIKJPVocE4XNhxXkxDuIlSYXtVi5gR2xE8vsWCUyjYXu+ziPzkUfij+88OB8/ytbnHncwsmjiXR0AFD9EWt9TCkVy4jxhMrq3hEnBVOmunVqMIC+v9lZsWZrRyAVTE9ggcFX4eQ17c6XQHCp/FOgJ1BDinYvydbk2e5hF6AU7EuI+ieL1tnog5TXHrCF4fBYjxcGxsQMckZDGMb9R1UE5jDNO7eb9buoopIJ86vqrVX8kGkjcc5N1Lw6JUI4KM5Pkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ykkjbZOahk1ElhIQ3/b5PSJ8CYk8AntNNA1+KosjB8U=;
 b=jZHRZh3RGXhqd4SMJmztXwN2S3LvTeuJHREMcH5xk/1Sx6YK9dTedXsMSKh+V5KGf+Q56zA/EmNsTNJEpzbp2sbvX6Eynzv0neicGD4gZkXooGfnA6zu0Fgid1OqaMWBxQHQ19aS8OBbbRgWKUEjgot2N2vGHgmwFdXFrhW3VuUalD3fLUuD0wIMhbykzlkAUa5qADWqTHfSrOnm0Rlzh0NrCQnXlOsgLnh/mwTCEnGkmJlb+t9KHSxHv5DZCKc3q/QcemKPRLxsSWHEEc4hN2GqXPmC3ymB2+iBaFmQgL57JPcoyrxbrwL3IcOUW1P4+ytD25Pvl9fzJZjeFo+3NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykkjbZOahk1ElhIQ3/b5PSJ8CYk8AntNNA1+KosjB8U=;
 b=TDjOooeBbBbNSJXovggulQMbYB/VeXGHkaf/EHY5tnylaXYAfSsxK248DNqTUDa39c9Pl29ZfjL9LiwN7PpVb1sxpkR/BamFQUFPDkHPCHHuqPkW31DMjm0vHyuN117BLiEwNMAeU4kUTt12XeYMNy0Ab6dSuMwexQu1wEJkNKQ=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by IA0PR12MB8327.namprd12.prod.outlook.com (2603:10b6:208:40e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 03:18:38 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0451.026; Fri, 2 Oct 2026
 03:18:38 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
CC: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
        "khilman@baylibre.com" <khilman@baylibre.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
        "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
        "felipe.balbi@linux.intel.com" <felipe.balbi@linux.intel.com>
Subject: Re: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Thread-Topic: [PATCH] usb: dwc3: meson-g12a: disable VBUS regulator on remove
Thread-Index: AQHdTBSBrY/eWidA/UeuDfRugteRWLbpoSOA
Date: Fri, 2 Oct 2026 03:18:38 +0000
Message-ID: <ar8iVIgFdBpIbCsl@vbox>
References: <20260924110429.1557653-1-lgs201920130244@gmail.com>
In-Reply-To: <20260924110429.1557653-1-lgs201920130244@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|IA0PR12MB8327:EE_
x-ms-office365-filtering-correlation-id: c3e72e32-ab5e-4616-9dd0-08df2033da32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10067099003|56012099006|11063799006|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 6UzGDZTCvnjECMR6K6yY8BXxBzW6hP/z0/6hEbzBj+WS+0arw7GJx1p+nnmr3Jvy6xA84WhOI1AVj4jua7Q5dwzWEg15yztUaiienrInvTItuWVpaiKArm+WTSe6jZryWdSEUaIz8/V2iabsoWDIaqNdgqmp2QSRhgPkkpRn5DMOM0D3epzPWBoPnVLBxgjLplzvhDwMCIizRpCqmYcrcrJKbmbxRtSdvXZF7h/1IfBlZ3so5w7EDiCMq0mg4ShfBMWcKgEYzkGid1GbqvqriRk+qxLJRih34WjsjR6bFsjxdKF/HvWV2HM8ewHRAc8LJzQb1/2fVD8sONIKSTSjOLqCGSO85H14cvBLH7R3KxKncTYa3zXyDojIfhZLVB4W3DihF3zPDKCug6PavLuoG7GzaccUGV5NOJCqRaJTfaUsUVTXl4PNyerwOnaF5c07uu60KcQmQNqxPIPOr1Gq3KGOwHSKlF/8EDyxg0bt0ZK3c+GL2uHzCZDE/qR+7+GjA66dfYTliTwg3129GsyhGU1uNxd9hKCT2YH7TRX1L9Y6ElE6ep1jf7d5BfOWtXhz52EDenYLLMZ/AXIAjBIjs+wQB1zbbXPSf+pivoFS5rITjaxp6Ztf3KPG8kt01wRxdgYMu+sHZsdsuSQ8+HcsalcSTGLLSiAOiNPjSS9ACRYQ2FGp4Nfdoe0kzaN7ywvBCM1nIbjcHjXBRnJ2hBhe12XWMymbsUBonIecrvQkJzg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ci9ES3NEOWVsbkU4c2VWSnV0Zk5xSzRHcS9ab0FacVV4YzhrVmtGT3NPNk80?=
 =?utf-8?B?dlB1ckVoQndraUd0cytqQ2FXM1JOZ1U0N3NrVUJMVDBVZ1NLSEZFVTdTR2d2?=
 =?utf-8?B?MWlMbFY3d3FjcE9OcVdVblp4R3ovY2h3U2tjeURod0Q0NU9HNUpWb2FPSE9i?=
 =?utf-8?B?cWxKeVBVc0padXhYOWg5RStrNXRvdUoyWitmM1kyalh3VDArRm5tR1dsYTd2?=
 =?utf-8?B?cEgyZFVBbWpib1d6UlAwK3FaZHRheEU3ZktkQVpqWCtOMzFraGJlek9YZkJR?=
 =?utf-8?B?RTdVeEpIRmdKRGZVaUhBOWtPUDBBaHZnYUlTdjNZaUVuMGNkektkaEZ5RzJF?=
 =?utf-8?B?OU12ZGlmRFMvSzdRWVRNTnYyVUZ1bjJyQk9Tc0h3V2g0dVpFRFcvWmtja0RX?=
 =?utf-8?B?RU9nYnpXWWUrdzd6TFRzSmdBeHVwUEZ5V0xFWHBmSzJOVjBQeitVY2tJQXlI?=
 =?utf-8?B?bUtpWHpMQnBNSWpFUWJMUlA0TFhtTzdNWkU2QXlRZ09zNHU1b3NEZnBhcStF?=
 =?utf-8?B?WGxabTduVWN6eWpieDEvQ0dtUGpmQUMrajB5Z3hwTE9Cd1BHaWZQcEFoZWdm?=
 =?utf-8?B?a2lFNHUxZ2hzRmc0TXhDNThuVStHVlVzZFYvVGRrQzJYdEdZZGtlOGVMVHNX?=
 =?utf-8?B?VUpGM08yOENKRWlrTG9XVjZNcVRvMU5BQXZoYllaRXRTVVNLQW9IUFJzdXZP?=
 =?utf-8?B?bXg0Sk5QRjFOK1NSOW9iZ29DLy9IQWpYM1VEcjhtVkhnZ2UwWUFyMkFkUWRw?=
 =?utf-8?B?Wkg0b3FLL0ZFK2FoRjNBV1IybjVQcTFsdUxXL0NUSUd1T21JQ2JyRkhWYjEy?=
 =?utf-8?B?YjNHcHhieGNIbXE4UjBjcGdhYTdzcnpHb2RjYmZsTEVaSEROUUdVazBDMWVS?=
 =?utf-8?B?eitvOEJJY2R2OVBXZ2l5dnZnakpjTkpGb3NaaXk3UnlTcHRsV25TbDZVeHZX?=
 =?utf-8?B?NmlkSzE4d3d6YzlBcXp0Z09Wc0l6YzcycllRMVJFc2pHT0NpTmNYRFdlRDhS?=
 =?utf-8?B?eDRpQWl0K0pUcmNiRHBDa0pRNU1KaVdMKzJibTNPWGlYbk12Z2QvcWtBdThh?=
 =?utf-8?B?R1NrYjdPeld4QnV1TWV0TDVGWEdmb2hlT2FkZVljMHZpUkk3Z1VMRGFwc1Y1?=
 =?utf-8?B?V0xqSloxbWZQcVFWc0ZLUzFjMDdUNHpWUCtIRk9IUkhhZ2JpSEwvS0RxT3hP?=
 =?utf-8?B?elFXNXVBRHVJcSs4aTRNWmJpWDZVSURFUFh5Y1gxaWQvSDduM2dNdEwxZlNS?=
 =?utf-8?B?QVQ1UDNPOEFuTjRzVmtwejN4Y1NUVXVzalk4UWNKbTZzUG9sSTgvOHZPWXBU?=
 =?utf-8?B?eGptcFlubWgrek9EMkF4bXdiT3ovTkhsUWVzekxlSmN4bklQRjV0Vm5vQk51?=
 =?utf-8?B?WnV6bFl5VUx6NzJpTDRvOW1iZGhmNEZyN1Eyc3NleVY2Z3AwaWZZZk9zWXR6?=
 =?utf-8?B?TjBIdksrbXhvV2NZOHM2OWhwVHpHVzlKbDJRUytPaTBDVzlMejZheVBiZk9Y?=
 =?utf-8?B?VmoxOTVNUko2cGhwaGxCMDhpQkZ0eVF6bVB0Z2wzVEhHemEycy8xcFhnbUwr?=
 =?utf-8?B?TlllUGdZMWtZeU1jSktHSEVDUlRlNS8wb3pobDRTMUtuRnZEVjc0czd3VmEy?=
 =?utf-8?B?cS9yeFdoaWNFL1pOVnpxV2FxaTFlR0EzcHV0eCtXMXplM24xaHJEWjNsOGlt?=
 =?utf-8?B?OTF6UE5BNkxMd3dRSzlWUXdxQUxrdk5XeGkvblFFUzNHMmY2S2UzOGE3bjdX?=
 =?utf-8?B?a0VaS3l1Ukkrdys5N0RqcVl3YXRWYUsxU01yUUJWUktkUG5RQmZSR1kvRVQ2?=
 =?utf-8?B?RTk4ejBjd25qdWROZ3JkbDlWVy9RRkN1T0xzRVpsaVZFQ1V1VThxMUJKZUdI?=
 =?utf-8?B?MzltS0Npd0Q4SmJOV21kN0M2UFhQYlBQMVNGQ0NNTCtIUmJCZFBkcWcrQU9x?=
 =?utf-8?B?QXVtaUhtdU9Gc2cyOFBuM2RGNUE2S3JjU0ZMQnEzcFY4RFlZTC9lOUV2aWxo?=
 =?utf-8?B?RmZWK3NQZng0VjU1UXg4cEdUSzVUZ1dXNzJoMjlmcjc4Nm9pdENTeGxkNUlr?=
 =?utf-8?B?SGl2ckQ5UlBRNnlSeVUranZzZlNPZ2JpZWFzd21HU1lzZkNqMmxWTlkycjFC?=
 =?utf-8?B?Y1ByT0pUaERLTDl6RFF3c3Q3aDVHb3c2SC85RlNNSnZ6TkY4ekxEakppOXpn?=
 =?utf-8?B?ZFdNeEU4ME5xVmtLVFlMWThvZXhzWFdDZnFoRmZaYzk3eHNrcnZERHpvOTlo?=
 =?utf-8?B?L21vR09BWUV4a1ZNVDJkZk94bGlhd1F3cG9iM0w4T0hCVDR2dkVOaW1LWTB1?=
 =?utf-8?B?MFRac1JRdFNuaFFETHdyRTdrY2lsK29CS0RTaTNqR2ZSK2lWYmNJdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A98C2C9328FEDE4C9F5491D6B005FDD8@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	OqCPucTcbbSrfffNpzmtqOAJKPLeAJUjXiBDIy4yoateF0pBEOwSZbqkd9gti3UmQ1llvqM6VPibLYRxYYnASjCLbpY0anyt1SZjBbYSiFujdshDNnPSD4fZRku2U6ybaM/qfRBvFrMMCFrfTL2OCRqKFhNrW1yndluF7acsE7h/I6z0ShEVfONqCw3/Nt1f/0hR3g9+3WGInM2Vk0lufm5VA9thCTvQSGIMKC5cAEiaVyTyJllahmtTTTjpMTlCHS1G3lkqm4C509moQgUB2i8LmruLJIh0Ofz1lRT3WdRq9UK2TwmVq89EHYU3R7+M57Pawu/+WhTGL6zErzhmwA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	woLoYJz0HIqqELkzZ+de7wLZUFbQodCxC57dp0Hjtx4qkulKoBVLi6u97QrwGK18kRBBmyTpHcX7BG7f5HsljCRX14nrRvjlBr7LEVGPMNfgVRa/b8+nYb74Er2ot0mOensBPj/TL2ymx2PlDwXuFPGLMQA9mK8cOzP/J/tggzPD9wq2W7UfOl3pBfz4nFlpi1VhPXlJbVL9ccrstZunniWOYZc4hgopaK5v52j1BRQaDhTmW/DkW4Sc4jT94bWw23i0wsFtij5wwGVnGf5yhlZxBt/gHXBVHvr1pt/KQ3j74J+1rwq31fTzkWYaHU1YTH+M038Rnv3lshK6DGgSB/WVDP4ywgc9yH/00VxSvo8N05dQNzsnA+FpXL7sSDJd0xVWj3bTlLxYSCHOrEVxCj5wgGkaeDQasm13xyN4BZryiAPiRDjDBqt2orzNS2H/WRRlN4+baggWv35VWmTVxQ/dZ7UbkCtchKvYCWAzxDbBU9FXl7lSe4KJoFMdj7JY2ZsJ4ORitrawTVD7rUWgs6KZ/xplzzwaUuEky7GcURc8vKOkoG+GTY4umckNFyZaaSlGtalwGSYIAQqjohuxNy+np35G4oaI26qE2GsmcD+fQOI3STTjl+Cv3DvUuCh/NAKqzdHDVNM1yqcydhKCZQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3e72e32-ab5e-4616-9dd0-08df2033da32
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 03:18:38.4997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wJ4vjxscSpNcrOLZqfDHvo2LwrtU0JsBt2hPFDFZz5AOhHmvqSWl90PX2Id0B+7DLuPP5+2IUCViIrYat/XGCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8327
X-Proofpoint-ORIG-GUID: iqWdFSv81OIvGIbjtJ9YH8k1_0tml1GY
X-Authority-Analysis: v=2.4 cv=AfkkjHXG c=1 sm=1 tr=0 ts=6abf22d9 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=jIQo8A4GAAAA:8 a=pGLkceISAAAA:8 a=72uI1cjrjyrFHIxJcXQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: iqWdFSv81OIvGIbjtJ9YH8k1_0tml1GY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAxMiBTYWx0ZWRfX+Aw/aPAwAkSb
 GuYCqvDox5IvU3wMg4exYZ4Da/LpmARRCEVhXibs6GvthJiUvF3gohxVZIK0A32AzrXhd2Un1up
 X/7JRyjijgarvbkHXal0VbRrXJEeaJOhIv0iRS6EKgpO7OoTZ/u7N5QRGW5QEm74nyT8raf6sS9
 YpysqoVV9O1lj6sxVi/4ZDoZNIlT7ThxAuDjHgIYYItCP/v70fAdYwn9+nUQtMa+p8rQ0wl4QFh
 FIOkV1IbEAENAAL6Nk9lR2QGaVzUwWysUzmK8Gh6436w+ic0+8zmNSIiILrePYVYWdSPJoNFgaW
 pHFnRwJz4GHUMdVRP7SVOf5+elb1UTsIjeiSwEtudGTkeQVCPQ1QTKsUP32hnRCzPjcu6AmvT8n
 jzOFWKiZ1cLeMij4RHR7z1qZ4O4ySyI08IkrTzeCwEKM8WVREB5gT+LGRFYkLCH3HE6OkJfzcsv
 Guu3DVO8e9e99V0uW5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAxMiBTYWx0ZWRfX/6sUmJshjUWH
 xgEoCfRcadbXIQxvS/riO75BIZTYj09nuxwFbn2mE/wQNV0AjvryvmAGpmcJvkbduov5kCjpm2E
 dRmtjg5jqqQ7pYVtNXQxoA7YTsbIYMw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_01,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 priorityscore=1501 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2610020012

T24gVGh1LCBTZXAgMjQsIDIwMjYsIEd1YW5nc2h1byBMaSB3cm90ZToNCj4gZHdjM19tZXNvbl9n
MTJhX3Byb2JlKCkgZW5hYmxlcyBwcml2LT52YnVzIHdoZW4gdGhlIG9wdGlvbmFsIHJlZ3VsYXRv
ciBpcw0KPiBwcmVzZW50LCBidXQgZHdjM19tZXNvbl9nMTJhX3JlbW92ZSgpIGRvZXMgbm90IHBl
cmZvcm0gdGhlIG1hdGNoaW5nDQo+IHJlZ3VsYXRvcl9kaXNhYmxlKCkuIFRoZSBwcm9iZSBlcnJv
ciBwYXRoIGFscmVhZHkgZGlzYWJsZXMgdGhlIHJlZ3VsYXRvcg0KPiBiZWZvcmUgcmVhcm1pbmcg
dGhlIHJlc2V0IGNvbnRyb2wuDQo+IA0KPiBEaXNhYmxlIHByaXYtPnZidXMgaW4gdGhlIHJlbW92
ZSBwYXRoIGJlZm9yZSByZXNldF9jb250cm9sX3JlYXJtKCkgdG8NCj4gbWF0Y2ggdGhlIGNsZWFu
dXAgcGVyZm9ybWVkIGJ5IHRoZSBwcm9iZSBlcnJvciBwYXRoLg0KPiANCj4gRml4ZXM6IGM5OTk5
MzM3NmY3MiAoInVzYjogZHdjMzogQWRkIEFtbG9naWMgRzEyQSBEV0MzIGdsdWUiKQ0KDQpXZSBz
aG91bGQgYWxzbyBpbmNsdWRlIENjIHN0YWJsZS4NCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8
VGhpbmguTmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmgNCg0KPiBTaWduZWQt
b2ZmLWJ5OiBHdWFuZ3NodW8gTGkgPGxnczIwMTkyMDEzMDI0NEBnbWFpbC5jb20+DQo+IC0tLQ0K
PiAgZHJpdmVycy91c2IvZHdjMy9kd2MzLW1lc29uLWcxMmEuYyB8IDMgKysrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2Iv
ZHdjMy9kd2MzLW1lc29uLWcxMmEuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJh
LmMNCj4gaW5kZXggNGQ2MTFjMDhlOGE0Li43Y2E2ZmI4OTAyN2YgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1tZXNvbi1nMTJhLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZHdj
My9kd2MzLW1lc29uLWcxMmEuYw0KPiBAQCAtODUxLDYgKzg1MSw5IEBAIHN0YXRpYyB2b2lkIGR3
YzNfbWVzb25fZzEyYV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlw
bV9ydW50aW1lX3B1dF9ub2lkbGUoZGV2KTsNCj4gIAlwbV9ydW50aW1lX3NldF9zdXNwZW5kZWQo
ZGV2KTsNCj4gIA0KPiArCWlmIChwcml2LT52YnVzKQ0KPiArCQlyZWd1bGF0b3JfZGlzYWJsZShw
cml2LT52YnVzKTsNCj4gKw0KPiAgCXJlc2V0X2NvbnRyb2xfcmVhcm0ocHJpdi0+cmVzZXQpOw0K
PiAgDQo+ICAJY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+ZHJ2ZGF0YS0+bnVtX2Ns
a3MsDQo+IA0KPiBiYXNlLWNvbW1pdDogZjAzYzM5ZGUzYTEzMDczNzFhNDAzMjc1N2NkMTczMmU5
MTA4N2M3ZA0KPiAtLSANCj4gMi40My4wDQo+IA0KDQo=
