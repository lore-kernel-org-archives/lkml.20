Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B01F8723;
	Sat, 19 Sep 2026 01:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789782721; cv=fail; b=oP7wmeqzLaLHRowSu43+sjoPIh5bmnKsiYiKEySqfZIs75gIg5wXyWWHKLLPT8DTi2AjotRRU0ln8y+wHGhVO3UW9WuBkA1z91v9GCMhCWAD2mGIOV49opHuQpu++4Ywt2rGC6pZzR9J2NZQNO6TXk25iS/OobBXHhflRV0QoPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789782721; c=relaxed/simple;
	bh=tMKifcZa6BfgDnS7lFklQIJRvm4d0pfr7GR7is36w4Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=il6vaorGvFSvWbc4d9Eb0SdKvljZa+zFP8C4sf0lzT6ZsGJNlzkDqKbEQYyrkf5jpvHf1m4Q5ifTPUDgHriKamrlLtn+mmIhzLL78eKnG3LsiPNFsS+8wUs/7p0vMBw3vcbdDtk4FCAg8kCWyzJXJReJ2QnSEFJTvLqzq3BE44Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Kzs1mUbx; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=Cpf6UgjA; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=a9f1uKDN reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Kzs1mUbx";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Cpf6UgjA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="a9f1uKDN"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68INueSt2558886;
	Fri, 18 Sep 2026 18:51:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=tMKifcZa6BfgDnS7lFklQIJRvm4d0pfr7GR7is36w4Q=; b=
	Kzs1mUbxZfa8BxaF841tEGYXJdkTIWs62xmU9zS2DmcrEoXi0ulkOoyGNCPiLevc
	B41DWOERXIgN2jCJVHoF0hD8aSVUZEl0ZlqbNsLE+JLJhgecLxU4KSGUDAAQDCLS
	kKDt31rGaNWO6A7A+ec9Qgaqr10DcxgLJrg4imYgkssII/cHoXn897UtxVndX/xm
	heJYiMtYTiD0+K7mmN1i8L32REGe5WYg1Jc8vEQUaFe6xzooAjSzuwBeaVGU20Hg
	1e5iben44O5lmdrHK7yWGwJ8U5hgYSIBGaZuzOgP19nmFwETiDvuDmZ+dfETaFUC
	rA20lkJuShU7hYqr9g9dXA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4gs3e9n7rt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 18:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1789782691; bh=tMKifcZa6BfgDnS7lFklQIJRvm4d0pfr7GR7is36w4Q=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Cpf6UgjAUSAvWCikjLO36plBFjTI+fwML/OZFxuBeEWTZGhTdoHU3Elj556ZY+Js2
	 AM9rwUVuE+mr60ziQohkcLDUX8Q/TCjLmSqvyUmwRXAJ8ku5j1yuUkUMEOiK49qH6Z
	 pY+OvQYbHQCwxSbI2Wgu752V4olj6ciBS7LyMkZ+Vx3lCnTUxoHcKIFNG4lOZNka3e
	 SWt4yK/JjHi7qtxWW/1lt7+vAvGpdwTvVzJNds61Cm5Jae2gdpODfTT/tO6Ge50qS+
	 pncyx357uyhXfzBaqCEkAcOWE/Re67C+MGt7vhXicEI8m3938qPW6QQ8RfjmEN63iz
	 O1hiStHdM6JaA==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0BDBA4012A;
	Sat, 19 Sep 2026 01:51:29 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 6431EA02C0;
	Sat, 19 Sep 2026 01:51:29 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=a9f1uKDN;
	dkim-atps=neutral
Received: from DM5PR08CU004.outbound.protection.outlook.com (mail-dm5pr08cu00402.outbound.protection.outlook.com [40.93.13.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 188B54048F;
	Sat, 19 Sep 2026 01:51:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5YHCKEm9YfMejv8oGlPRmQaDDogC1J6BueOvKnc1wKCyXkqrRAnt6dG0ELercX7As7blziKrXNSj+GFzaUYTqr3UFQ8rKouUqv+GddCv/oppNRRLdPYje/wBHFlb+mhEr6Kn3S99+oSXK3Tq2BPzPwsTj7bmvy+d8mwdHRJ683ISl+2xJ0nPNqHHh0R/lHRMJiKmwfDgbmAy3SN9+e78n4QNNSInkZnS5ddzg/646nnoKWI9O9whT5n9Jl1aX4YJhktTzMaRSHm6b3pInNKF0ILR8pN2jaIsLtYeWM0eQaNXU+mjoHI8AQ+ei+IeS5ID33hiG4VvQL8Ym7uUAUSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMKifcZa6BfgDnS7lFklQIJRvm4d0pfr7GR7is36w4Q=;
 b=bodu7gSPPAlJAuMcj5OFmDWf2vv7lUi3Y1oqnV82IB8JYDNeI2t7ZFAyiU7+CRJyMtHpioj4qufU0BFu/+MQpszCq4eqxM4IEfuPSnPlbU4R2Rbhcw0UyBGFmf9j9BE0U6WOiYCicPniPteHqrXSvzeWWjDHmO1YBu8nojgRmLLKZ9NGUwA76r1WZqo8TX6siAZeeZc5ZviCLWjBVc/2UnslqMx3jxl0xwZNKvuBzq1Yj1+anHCxjZY7D/AuzYHi59jk7v4y6HTSya9XVUGU1ISwPfNO9a9Lv4RwMS7zvALU/enBZO7RraRfO0kW0MH81xGITdoBWtU3bxVRPI5clw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMKifcZa6BfgDnS7lFklQIJRvm4d0pfr7GR7is36w4Q=;
 b=a9f1uKDNAJDWNv9nBeB1T8e3AqbRfotETcU7oGW0EniOInsVLscb+OUxsCA5WyR+WIUMmaK2pTG1U1rOmZO5sLcwOwvSX3/iQ1HcdF2O1A46+eatm8fkXJMnGu2/swPpISF5OLOadtNkanNdRdNHj+3bpz5biIj53rPJndzjlT4=
Received: from PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 by SN7PR12MB6862.namprd12.prod.outlook.com (2603:10b6:806:265::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Sat, 19 Sep
 2026 01:51:21 +0000
Received: from PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109]) by PH0PR12MB7486.namprd12.prod.outlook.com
 ([fe80::7df9:b25e:9216:f109%6]) with mapi id 15.21.0406.007; Sat, 19 Sep 2026
 01:51:15 +0000
X-SNPS-Relay: synopsys.com
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: Junzhong Pan <panjunzhong@linux.spacemit.com>
CC: Troy Mitchell <troy.mitchell@linux.dev>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "spacemit@lists.linux.dev" <spacemit@lists.linux.dev>
Subject: Re: [PATCH v2] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Thread-Topic: [PATCH v2] usb: dwc3: core: resume xHCI child on runtime resume
 in host mode
Thread-Index: AQHdP5wR5i4XzjNomUGCZHDevdq/7rbEujAAgAF0JICADi/sAIAA1R6A
Date: Sat, 19 Sep 2026 01:51:15 +0000
Message-ID: <aq3kF_zdTPwkOuZI@vbox>
References: <20260908-resume-xhci-v1-1-aca107602e9c@linux.spacemit.com>
 <DL9ZZ8F7HTZT.1IUMD1ECSOZXL@linux.dev>
 <566DD22E9074C793+eaef8bb4-9602-4f76-8915-6e322387c7aa@linux.spacemit.com>
 <768D38E96246550E+b63978f5-b8e9-4d3d-883c-f36d79c5da12@linux.spacemit.com>
In-Reply-To:
 <768D38E96246550E+b63978f5-b8e9-4d3d-883c-f36d79c5da12@linux.spacemit.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR12MB7486:EE_|SN7PR12MB6862:EE_
x-ms-office365-filtering-correlation-id: 48a89868-ccde-43e3-4fbb-08df15f07de8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|22082099003|18002099003|4133799003|3023799007|4143699003|38070700021|10067099003|5023799004|56012099006|11063799006|6133799003;
x-microsoft-antispam-message-info:
 3KNyVPFmo/urotoaCXn2Jzwo/E09yolB6tqMVjenNv64QsWhcYWS9T9bIo1p2gPEnH9muflbH0GU8cMzPpAUnOZ+ACkIvEUQiL0jbFYuaYny8ZuctJDrmvlapB4rAIpm+HA18HKQqG30GvctlMVmBqDwaJFsyfTg3ZgEz/9gST9Mx7bLlUlXJHCuGU4QYMufBk/ZnUPZdDkWJonWHTLFunAwnONCTDN8goZwBzEF75jdd/lTv22EDLm+/PQANFzJLx0C10cL4Pj7gs5vz6yyFnpZUb6xZvVIOVXUADzbxVjvL81sg7RT02ssexvC8wXNGaTgU0h9QmvzZYStxmBhfGV0uSr1OyDPGJUZvUI/lzsCaliC7q42m8A3FZOFZowukvITcHIyZC1C4BFuePd5b7noV/GNYu8JGdav5bABZh7Yjrz+XoiEb3fPlGkPKYDXu783NNaQZX+9dg6FS7JCL2VHBZWjORx3O7z2iuytzyNkdBeqXgaakjUKuDq/Mit3ueEjCgZboJSGJr3tl2cOQCX4wBhogLJSZTcceP2LW/Gy6kBW6cKh8HsyGi/3FNwSHWKuvLyDr3wmfJo5TEPXm2fey1xVZySbt8Jojvlse6kde///NjVMY35BltbEqyCPxGjkJ0TgqfsfXKtffIsI1cNeMaJ5zy7cgqGl1TWXkQjDdFfMso5iKcba36fqeJ5jjIZxqcRbR+mPxF+XzAd4WLHH9OJ11ofZydOB1MCApH8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7486.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(22082099003)(18002099003)(4133799003)(3023799007)(4143699003)(38070700021)(10067099003)(5023799004)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?R3JvSGFTdmZoa3NzZm9CZWp5cEFiUTRIQ2J0QUF1akw0UHZtenYzVHFOUi9J?=
 =?utf-8?B?UHQzUUEwMDV5MzQ1T3pocXVSanZUTDRLd0hGYXROMFBlZ0tiRzdSUjA5RDNm?=
 =?utf-8?B?K1JVVVBxNHRSNHB2ZEo2RGJndFJPbVg0dGZ4cjVUSGhCQWo5VFdLWkE1WDVy?=
 =?utf-8?B?UFNzcllITG5FekRSVTZhdGtTcXZlRlRTSlBnTGNxSTJtNTdXTllVbGsrakh1?=
 =?utf-8?B?V0diYWpjVWNIVmxHVUlJTUJGYWNaM3BOajliS2E5TTZxaDgxYkp0V0xRYnQ5?=
 =?utf-8?B?amhtTGpUQ1VPV3p5aDNERk5RdzlTbU4xYTFhakFJOUFLUFdnREo0WGc1SE5n?=
 =?utf-8?B?b3pBZlpTRVF2MUdsMzZQeW8ybzFNV1JsSDljUDVsYlhnUEFhTWRpTmNHQVYz?=
 =?utf-8?B?eW8wUXRzaTFzeTVpMFI4U2RMTEU2eDBjRUFLUGNuRDREN3h6M0wwSWFOYXZS?=
 =?utf-8?B?bWxNM1ZhWUY4V3dNbEQySGJjTHhnSVh6ZUc1ejJSdFcxeEVrcHBLamNqQXR2?=
 =?utf-8?B?ZlJjRUFrRXI2SXN6anNpQWRXWjdpNVpza2U5V2VqMDhzMG5BTW82dUFTWGhR?=
 =?utf-8?B?MUd4WDNsRUtJMTNZZXdIK0t3MnhrSnJpME5CanVvaXVFTzIrejJBOGNXOFM4?=
 =?utf-8?B?UVhmZGhGVXFIVzI5eDQxWG1UUkVkRCsrMHZzKyswZFVpZ2FZcC9rbng0Zmhx?=
 =?utf-8?B?V0JJSE1keUYxbGVXb2piak1LcUtYdFBSbGhsTWd6Wi9XZWl4UFkyaWFPRVJk?=
 =?utf-8?B?WWZ0YjlOdXFFSFVBYXRDN3RtaEdRVTRYNko3cnlIOW5zMlNQUm1kYWVVVWto?=
 =?utf-8?B?YjRmc1JRUXRrSklEYmwwbnFoOFFjWUhqa0poU3NVdEppT04zUFJYZE8vdWlU?=
 =?utf-8?B?ay9kcFNtblpwQ3NJWFBwMmxVaUNtZVY4aVBqUUxEUmlHb1ErS0VJYVdxUnZi?=
 =?utf-8?B?M1JRenNrZS9MMTNKTmhJZ0hEeDBRVGdTbEJjVlZCcXZqWFp2elNjTGorTTJT?=
 =?utf-8?B?MmFIQUJWVjBEWml1TW0wVnJ2Y0tGOSthRTBjeE16K3dHY0FvbjFyTVlMMnZJ?=
 =?utf-8?B?RytmUFFURzhTOGs1eTA2S29XTEluSFBmS2xVZ3lTVDFXYkxUMGFLcE1ITEkr?=
 =?utf-8?B?OEtRcEE3bkxXNHNPcU5OOWxPTnhRa0RhS2Vob0kyZW45Mm1MSXpBeWFSRWJR?=
 =?utf-8?B?cXJubDRkUGc2cDFscXFPUG9VNmVPdnlqRmJ4K2wzbldqS2taUXd3cGl3Sklu?=
 =?utf-8?B?STE4MlVhRkZrRjZRd1FuQUNkbURwODIrSStHcUowWTRJWVVUWTliYmE3aFdt?=
 =?utf-8?B?WkhzUzMxZStocm56aTQyWTd1SFBVMGhiZmxKckNGTEM4bzJUSVBvNVdTRjNm?=
 =?utf-8?B?UU8rYmVwdGpjWXFjenJGTHRLZmZvZXJKc3kwM00rV1NHeWh5RENSeWd1U3BS?=
 =?utf-8?B?MHlURU1MQ0J0bW8vbDNvQXN2ZisvT25CVUpCMVVJTEVOaVVoUGpHUWpJKzRE?=
 =?utf-8?B?Vy9LRXJMRjBzSmVXb05uV1ZwZUZjOVluU2xZQ0diY29SMDBoU2Y3K0lVNmRw?=
 =?utf-8?B?VG80R0ZjNHJyYk4xTGltWkVDWXowOWNDOEd1bWNXR3B2M1JYVEFieExZTCt1?=
 =?utf-8?B?cTBMNUtpejI5dUhHS1R1THlRbkk1cG1iWEo4ZzFNQ1J3dXF5Z2dYRmRGOU1a?=
 =?utf-8?B?aTFzQkxUaWNGQnJHdWpsakFqL214bU1uNlFnT0ozemRJUUFsaC9KYTBnOWEr?=
 =?utf-8?B?eG1BY1FzeXFYUWdVZG5weHJuZkg2ZytHVUxQWm9uREpyQldBc3V1ZFM2TGY4?=
 =?utf-8?B?L3dKVlFTMUM2b21nS0xSM01HNUNNMWFpWmpqMDJkUWZHYjRYK1kxelh5U3NQ?=
 =?utf-8?B?RWM4aGczdDdlRGEwSThRNGVybCttN2g4UGVTa1dtOHRLUkZ6eWZ3bDBTQjFE?=
 =?utf-8?B?Uno0R1hFWnNEUW1iS2c0dHlDdnJXWDV2d2J5NExtcm9SSXFYNjFWcDJxTVNz?=
 =?utf-8?B?djRYZ3FqMDJnY3d0d0hOcHpJeG9zSXRXWUk2SWJRNU1WRDNiUXhQS0M5NHZ1?=
 =?utf-8?B?VVVaaU0vcGxzYjNURGJlRDVsclNia3o0TktyYTQyM2d0MkdtL1hxbmNaL0hv?=
 =?utf-8?B?cndKdnl0RVYzaG5VaXJraTh6RzN3VmphdUtGMzZxN0RFQ3RWNlQ1RkFEaHoz?=
 =?utf-8?B?SmZrWFBwVGlDMCtETzY0Tm9Ycmd3V2lEUWtyWHRHR3BmamVpYTNqWjI3ZTQ1?=
 =?utf-8?B?RFhPVjk5YVFGVmxqM3VjdGZoRGM0TmYwaGswL3FNRDFMZUkzcWFkVnQ2L3Y1?=
 =?utf-8?B?eWg0dHlVT2lOZ2dUcGpqcE8zM2pVUnViQi9IYVNsUDREREx3VVpuZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9C899A1AC92FF44B7FFE98C13D72AFC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	GAnNDongAG2XC3SvxbJoyGts76BUtPQkiDqzdKcmh7Q+QhE0aeVKuMoti75ImmrlEEhMSwRwSCTTzzXBif3l4iPU5uXDO64k4W3mOOhsp9XGfD9M9v1W3ae5//0xbtItnQ1dlxYKWNAKLI0bT7bi8HJ3VdlHETuGfxdvQ2a5aIr+k5VMjR2wxhI6GQpA6kxdP89u5iwSs7byolTNgkynAjgpE232Jh3qhBRZRMUTvnieWmkdbZmXO94NJn6ZkoCARfczAPCZ8aBxM8+VhFQxENCDSVsJpAbcVX4HAkSd8M5PKRZaqIkwuGNZjyOUfMWjTV987WOCk2uz2nn7LufRnw==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1MUeETdJmVRs1IhYb4Gyu9yAL7sYraaQa/PnspYfRk64oiuh+J7OfNCEWtDnf9RGeP6QdgKrao+vLQI0FGMOAcuCWj6BmjsqiHx9QohBij0Y8GuAeIBigR2dv+DrG8S7/Fv/0pQGySMqTxUH/LYFAwHzCJzMWVMzYjOOL45xeMMq8ZLio7Yj5KPmP73K5chUW5PtT23LaWjiNfL6nGFP0cGM9F/yy4BAwymsXfMqKTLjj3+xQZqIjeU8X+/kufysZiuI4C8lg9SJesX7ybZqmWD6EfqKI+wjj2qmrXeeyisM3CffpqtzGRUKPHRtEFJtP1h7vYcOqM9Y2MtNDUhJobGEP4nqk4FTcW1WWfX60l2qG+QeKM4u09qbSMp3m3IMljXna6Z3IbmV2eo2O4urD+IvjHv56zBBE0YTsy28UAzBMfeaxlDf3M5qwOfM/n8PQpTjAKiv3oD7YvPUqYAAGO2+S9LQzCCObxHq984Gocrqtbm90MMPUSNQ8yxuQgrBYe7qr6i3k1/zaxvv8IxifVfj8BxRLcLnugyQv2o744A4WxayOaK8mPVn/qk8qMAaMnzXk7WljgkGYGW5cga1F9F+X9tvRxP139cdzgQ28G2GlcHr0nfF7EbYq3/GyXnTuACjOx1JDDe3jXsftODI0Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48a89868-ccde-43e3-4fbb-08df15f07de8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 01:51:15.8447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F53O/6zp5eeHURVwiDoU73F3pgKBDIXP/aQ3/slJZi6yb7h1P55vxlnbNXoiK75/ZvUs9E8Aflv86uEaT/SZCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6862
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDAyMyBTYWx0ZWRfXxzqA+dWCM6VO
 zGHITLyf4BgIutHXxxYRauWaWKTvJLuRaFLoXnS6f/MFokGj81Q1orEJjn9e6uZkpe74fn9PQN+
 P3t1x10JhfbsvxGrVO+mi7rSCOwWGgg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDAyMyBTYWx0ZWRfX7xGgwro1KNhN
 1Mcto2/PCgYYP3LEh6DUFwkeBBW4SkECw9FLoE+wBoKRP4A/EdjUGeR13pA5Bj2Gp3zf3aZbfzH
 VK+rO9i1DojNJAsMAhOqHZtbq4EqgLmTegtyat5ZhHAqZcwvjPXO8q9ZnvPfeghV3/HvgINK7hm
 HGoOkHrFWzNAg4eMqz3CC98ayOW7KvMvSo0jo8wJIcm00vQu3dxC0rdZL1pXNRo7vyRQM1RDvmr
 tl1fIMhRp+A8Oy3tvdoJili+s6vqi9SLJBvjUaTdI6d6PG34qb7gCahID34Lop6vdsGmXR/rRCf
 3IPq/BnZ4LZll4cIWNQ8j/XS3ELpkgt2IJz0+nXezG19AehBWZUEhB+Jv4FdDas9diJK8qBaP0x
 JYH7XtBrBqxATon45d0tPaPxAUY7jaMYp10EyAfzjUmVjj4VpZGR9PRmdT6TG1D0hJ4Er2wPVKi
 kZKsGlvSOH/uXtqfCZA==
X-Proofpoint-ORIG-GUID: eGFm2TAPQL4NnBJa-tbuh7jURw6jk_3C
X-Proofpoint-GUID: eGFm2TAPQL4NnBJa-tbuh7jURw6jk_3C
X-Authority-Analysis: v=2.4 cv=LMPz05W9 c=1 sm=1 tr=0 ts=6aadeaa4 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=VwQbUJbxAAAA:8 a=lv0vYI88AAAA:8 a=jIQo8A4GAAAA:8 a=Q7Aj4OoUTh9diu3GbJYA:9
 a=QEXdDO2ut3YA:10 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_07,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609190023

T24gRnJpLCBTZXAgMTgsIDIwMjYsIEp1bnpob25nIFBhbiB3cm90ZToNCj4gT24gOS85LzIwMjYg
ODoyOCBQTSwgSnVuemhvbmcgUGFuIHdyb3RlOg0KPiA+IE9uIDkvOC8yMDI2IDEwOjE2IFBNLCBU
cm95IE1pdGNoZWxsIHdyb3RlOg0KPiA+PiBPbiBUdWUgU2VwIDgsIDIwMjYgYXQgMTA6MDEgUE0g
KzA4LCBKdW56aG9uZyBQYW4gd3JvdGU6DQo+ID4+PiBVU0IgY29udHJvbGxlciBydW50aW1lIHN1
c3BlbmQgaGFsdHMgdGhlIGNvbnRyb2xsZXIgb24gZGlzY29ubmVjdGlvbi4NCj4gPj4+IEl0IHJl
bGllcyBvbiBwbGF0Zm9ybXMgd2l0aCBjdXN0b20gY29ubmVjdGlvbiBub3RpZmljYXRpb24gdG8g
c3RhcnQNCj4gPj4+IHRoZSBjb250cm9sbGVyIGFnYWluLg0KPiA+Pj4NCj4gPj4+IFRoZSBob3N0
IGJyYW5jaCBvZiBkd2MzX3J1bnRpbWVfcmVzdW1lKCkgZG9lcyBub3RoaW5nIGN1cnJlbnRseS4g
VGhlcmUNCj4gPj4+IGFyZSB0d28gcGF0aHMgdGhhdCBjYW4gdHJpZ2dlciBhIHJ1bnRpbWUgcmVz
dW1lIG9mIHRoZSBkd2MzIGNvcmUgaW4NCj4gPj4+IGhvc3QgbW9kZToNCj4gPj4+DQo+ID4+PiAo
YSkgV2FrZSBsYW5kcyBvbiB0aGUgeEhDSSBjaGlsZCAoRFQgcGxhdGZvcm1zLCBlLmcuIFF1YWxj
b21tLCBpLk1YOE1QKQ0KPiA+Pj4gICAgIEEgcGxhdGZvcm0gd2FrZXVwIElSUSBmaXJlcyBhbmQg
dGhlIGdsdWUgaGFuZGxlciBjYWxscw0KPiA+Pj4gICAgIHBtX3J1bnRpbWVfcmVzdW1lKCZ4aGNp
LT5kZXYpLiBSdW50aW1lIFBNIHdhbGtzIHVwd2FyZCwgcmVzdW1lcw0KPiA+Pj4gICAgIHRoZSBk
d2MzIHBhcmVudCBmaXJzdCwgdGhlbiByZXN1bWVzIHhIQ0kuIEJvdGggd2FrZSBjb3JyZWN0bHku
DQo+ID4+Pg0KPiA+Pj4gKGIpIFdha2UgbGFuZHMgb24gdGhlIGR3YzMgcGFyZW50IChBQ1BJIHBs
YXRmb3JtcykNCj4gPj4+ICAgICBXaGVuIGFuIEFDUEkgTm90aWZ5KEFDUElfTk9USUZZX0RFVklD
RV9XQUtFKSB0YXJnZXRzIHRoZSBkd2MzDQo+ID4+PiAgICAgcGFyZW50IGRldmljZSAtLSBmb3Ig
ZXhhbXBsZSB2aWEgYSBHZW5lcmljIEV2ZW50IERldmljZSBvbiBhDQo+ID4+PiAgICAgaGFyZHdh
cmUtcmVkdWNlZCBwbGF0Zm9ybSB3aGVyZSBkd2MzIGlzIGVudW1lcmF0ZWQgYXMgYW4gQUNQSQ0K
PiA+Pj4gICAgIGRldmljZSB3aXRob3V0IGEgZ2x1ZSBkcml2ZXIgLS0gdGhlIEFDUEkgY29yZSB0
dXJucyB0aGlzIGludG8NCj4gPj4+ICAgICBwbV9yZXF1ZXN0X3Jlc3VtZShkd2MzX2RldikuIFJ1
bnRpbWUgUE0gZG9lcyBub3QgcHJvcGFnYXRlIHJlc3VtZQ0KPiA+Pj4gICAgIGRvd253YXJkLCBz
byB0aGUgeEhDSSBjaGlsZCBzdGF5cyBzdXNwZW5kZWQuIFJvb3QgaHViIHBvbGxpbmcgaXMNCj4g
Pj4+ICAgICBuZXZlciByZS1hcm1lZCwgYW5kIGEgZGV2aWNlIHBsdWdnZWQgaW4gd2hpbGUgc3Vz
cGVuZGVkIGlzIHNpbGVudGx5DQo+ID4+PiAgICAgZHJvcHBlZC4NCj4gPj4+DQo+ID4+PiBUaGlz
IHBhdGNoIGZpbGxzIGluIHRoZSBob3N0IGJyYW5jaCB0byBjb3ZlciBjYXNlIChiKSBieSByZXF1
ZXN0aW5nIGFuDQo+ID4+PiBhc3luYyByZXN1bWUgb2YgdGhlIHhIQ0kgY2hpbGQgc28geGhjaV9y
ZXN1bWUoKSBjYW4gcmVzdG9yZSB0aGUgcG9ydA0KPiA+Pj4gc3RhdGUgbWFjaGluZSBhbmQgcmUt
YXJtIHJvb3QgaHViIHBvbGxpbmcuIEdsdWUgZHJpdmVycyBpbiBjYXNlIChhKQ0KPiA+Pj4gcmVz
dW1lIHhIQ0kgZGlyZWN0bHksIGFuIGV4dHJhIGNhbGwgaW50cm9kdWNlZCBieSB0aGlzIGNoYW5n
ZSwgYnV0DQo+ID4+PiBydW50aW1lIFBNIGNhbiBzZXJpYWxpemUgdGhvc2UgcmVxdWVzdHMgYW5k
IHNraXAgZGV2aWNlIGFscmVhZHkgYWN0aXZlLA0KPiA+Pj4gc28gdGhlIGV4dHJhIHJlc3VtZSBj
YWxsIGlzIHNhZmUuIFRob3NlIGNhbGxzIGNhbiBiZSByZXBsYWNlZCB3aXRoDQo+ID4+PiByZXN1
bWUgY2FsbHMgdG8gZHdjMyBkZXZpY2UgbGF0ZXIuDQo+ID4+Pg0KPiA+Pj4gVGVzdGVkIG9uIFNw
YWNlbWlUIEszIFBpY28tSVRYLCBjb3ZlcmluZyBib3RoIHdha2V1cCBwYXRoczogYW4gQUNQSQ0K
PiA+Pj4gYm9vdCB3aXRoIGEgR0VEIGRldmljZSBub3RpZnlpbmcgdGhlIGR3YzMgbm9kZSAoSElE
IDgwODYyMkI3KSwgYW5kIGENCj4gPj4+IERUIGJvb3Qgd2l0aCBhIG1vZGlmaWVkIGR3YzMtZ2Vu
ZXJpYy1wbGF0IGRyaXZlciBleHBvc2luZyBhIHdha2V1cCBJUlENCj4gPj4+IHNpbWlsYXIgdG8g
ZHdjMy1xY29tLmMgYW5kIGR3YzMtaW14OG1wLmMuIFRoaXMgaXMgbm90IHZhbGlkYXRpb24gb24N
Cj4gPj4+IGFjdHVhbCBRdWFsY29tbSBvciBpLk1YOE1QIGhhcmR3YXJlLCBjaGFuZ2luZyB0aG9z
ZSBkcml2ZXJzIHdvdWxkIHN0aWxsDQo+ID4+PiBuZWVkIHBsYXRmb3JtLXNwZWNpZmljIHRlc3Rp
bmcuDQo+ID4+Pg0KPiA+Pj4gQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmguTmd1eWVuQHN5
bm9wc3lzLmNvbT4NCj4gPj4+IEFzc2lzdGVkLWJ5OiBPcGVuY29kZTpjbGF1ZGUtb3B1cy01DQo+
ID4+PiBTaWduZWQtb2ZmLWJ5OiBKdW56aG9uZyBQYW4gPHBhbmp1bnpob25nQGxpbnV4LnNwYWNl
bWl0LmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gQ2hhbmdlcyBzaW5jZSBSRkM6DQo+ID4+PiAtIGFk
ZCBBc3Npc3RlZC1CeSB0YWcgYW5kIGNvbGxlY3QgdGFnDQo+ID4+PiAtIHJlZmluZSB0aGUgY29t
bWl0IG1lc3NhZ2UgYW5kIGNvbW1lbnRzIGFzIHN1Z2dlc3RlZA0KPiA+Pj4NCj4gPj4+IExpbmsg
dG8gUkZDOiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtdXNiLzIwMjYwODExMDkwODE3LjEwOTM1MC0xLXBhbmp1bnpob25nQGxpbnV4LnNw
YWNlbWl0LmNvbS9fXzshIUE0RjJSOUdfcGchZkc4QmhPYUFpVzNLc0pCZ21kY21PSUt2WUFGa05x
WUdHbW9abjBrdGRxcDU1VTRxNGtPMXdLTkZlQUo3WWFHS29FV3B3enlaQVdZdHlwY0ZUUjZkb3o3
TnkxSDZMUVMyJCANCj4gPj4+IC0tLQ0KPiA+Pj4gIGRyaXZlcnMvdXNiL2R3YzMvY29yZS5jIHwg
MTIgKysrKysrKysrKysrDQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykN
Cj4gPj4+DQo+ID4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMgYi9kcml2
ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+Pj4gaW5kZXggZmQ1YzJjZDM2YzU5Li43Njg4M2RjNjE4
NGMgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiA+Pj4gKysr
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gPj4+IEBAIC0yNzM5LDYgKzI3MzksMTggQEAg
aW50IGR3YzNfcnVudGltZV9yZXN1bWUoc3RydWN0IGR3YzMgKmR3YykNCj4gPj4+ICAJCX0NCj4g
Pj4+ICAJCWJyZWFrOw0KPiA+Pj4gIAljYXNlIERXQzNfR0NUTF9QUlRDQVBfSE9TVDoNCj4gPj4+
ICsJCS8qDQo+ID4+PiArCQkgKiBPbmx5IHRoZSB4SENJIGNoaWxkJ3MgcmVzdW1lIHJlLWFybXMg
cm9vdCBodWIgcG9sbGluZywgd2hpY2gNCj4gPj4+ICsJCSAqIGlzIHdoYXQgcmVkaXNjb3ZlcnMg
YSBkZXZpY2UgcGx1Z2dlZCBpbiB3aGlsZSBzdXNwZW5kZWQuDQo+ID4+PiArCQkgKiBSdW50aW1l
IFBNIGRvZXNuJ3QgcmVzdW1lIGNoaWxkcmVuLCBzbyByZXF1ZXN0IGl0IGhlcmUuDQo+ID4+PiAr
CQkgKiBLZWVwIGl0IGFzeW5jaHJvbm91cyB0byBhdm9pZCB3YWl0aW5nIGZvciB0aGUgcGFyZW50
J3MgcmVzdW1lDQo+ID4+PiArCQkgKiBjYWxsYmFjayB0byBmaW5pc2ggZnJvbSBpbnNpZGUgaXQu
IEdsdWUgZHJpdmVycyBtYXkgYWxzbw0KPiA+Pj4gKwkJICogcmVzdW1lIHhIQ0kgZGlyZWN0bHks
IGJ1dCBydW50aW1lIFBNIHdpbGwgc2VyaWFsaXplIHRob3NlDQo+ID4+PiArCQkgKiByZXF1ZXN0
cyBhbmQgc2tpcHMgYW4gYWxyZWFkeS1hY3RpdmUgZGV2aWNlLg0KPiA+Pj4gKwkJICovDQo+ID4+
PiArCQlpZiAoZHdjLT54aGNpKQ0KPiA+Pj4gKwkJCXBtX3JlcXVlc3RfcmVzdW1lKCZkd2MtPnho
Y2ktPmRldik7DQo+ID4+PiArCQlicmVhazsNCj4gPj4gQ291bGQgd2UgYWxzbyBjaGVjayBhIHBh
cmVudC1vbmx5IHJlc3VtZSB3aXRoIG5vIFVTQiB3YWtlIGV2ZW50PyBGb3INCj4gPj4gZXhhbXBs
ZSwgcmVhZGluZyB0aGUgRFdDMyBkZWJ1Z2ZzIGxzcF9kdW1wIGZpbGUgY2FsbHMNCj4gPj4gcG1f
cnVudGltZV9yZXN1bWVfYW5kX2dldChkd2MtPmRldikuIFdpdGggYm90aCBkZXZpY2VzIHN1c3Bl
bmRlZCwgdGhpcw0KPiA+PiBjaGFuZ2Ugd291bGQgd2FrZSB4SENJIHRvby4NCj4gPj4NCj4gPiAN
Cj4gPiBUaGFua3MgZm9yIHBvaW50aW5nIG91dCwgSSBkaWQgbWlzc2VkIHRob3NlIHBhdGhzIGJl
Zm9yZSwgSSB3aWxsIGRvIHNvbWUNCj4gPiBpbnZlc3RpZ2F0aW9uIGFuZCB0ZXN0aW5nIG9uIHRo
ZSB0d28gbm9uLXdha2V1cCBwYXRoOmRlYnVnZnMgYXR0ciBhY2Nlc3MNCj4gPiBhbmQgdGhlIGR3
YzNfc2V0X21vZGUoKSBwYXRoIHRoZW4gcmVwb3J0IGJhY2suDQo+ID4gDQo+IA0KPiBJIGxvb2tl
ZCBpbnRvIHRoaXMgb24gcmVhbCBoYXJkd2FyZS4gVGhlcmUgYXJlIHR3byBwYXRocyB3aGVyZSB0
aGUNCj4gcmVzdW1lIGlzIHVubmVjZXNzYXJ5Og0KPiANCj4gKDEpIGRlYnVnZnMgcmVhZDogaXQg
YnJpZWZseSByZXN1bWVzIHhoY2ksIHRoZW4gYm90aCBkZXZpY2VzIGdvIGJhY2sNCj4gdG8gYXV0
b3N1c3BlbmQuIEhhcm1sZXNzLCB0aG91Z2ggdW5uZWNlc3NhcnkuDQo+IA0KPiAoMikgX19kd2Mz
X3NldF9tb2RlKCkgd2hpbGUgc3VzcGVuZGVkIGluIGhvc3QgbW9kZTogd2hlbiBhIERSRA0KPiBj
b250cm9sbGVyIGlzIHN1c3BlbmRlZCBpbiBob3N0IG1vZGUgYW5kIHVzZXIgb3IgYSByb2xlLXN3
aXRjaCBjb25zdW1lcg0KPiBjYWxscyBzZXRfbW9kZSgpLCBkd2MzIGlzIHJlc3VtZWQgZmlyc3Qg
YW5kIHRoZSB4aGNpIHJlbW92YWwgZm9sbG93cy4NCj4gQnV0IHBtX3JlcXVlc3RfcmVzdW1lKCkg
b25seSBxdWV1ZXMgd29yaywgYW5kIHRoZSB1bnJlZ2lzdGVyIHBhdGgNCj4gY2FsbHMgY2FuY2Vs
X3dvcmtfc3luYygpIGJlZm9yZSBmcmVlaW5nIHRoZSBkZXZpY2UsIHNvIHRoZSByZXF1ZXN0DQo+
IGlzIGVpdGhlciBjYW5jZWxsZWQgb3IgY29tcGxldGVzIGJlZm9yZWhhbmQuIEluIG15IHRlc3Rp
bmcsIHRoZSBQTQ0KPiBjb3JlIHNpbXBseSBiYWlscyBvdXQgd2l0aCAtRUlOVkFMIG9uIHBtX3Jl
cXVlc3RfcmVzdW1lKCZkd2MtPnhoY2ktPmRldiksDQo+IGFuZCB0aGUgcmVtb3ZhbCBjb21wbGV0
ZXMgZmluZS4NCj4gDQo+IEkgdGhpbmsgeWVzIHRoZXJlIHdpbGwgYmUgbW9yZSBleHRyYSBjYWxs
cyBoZXJlIGJ1dCB0aGV5IGRvbid0IGJyZWFrDQo+IHRoaW5ncywgSSBkaWRuJ3QgcmVwcm9kdWNl
IGFueSBmYWlsdXJlLiBJdCBzZWVtcyBkaWZmaWN1bHQgdG8gZ2V0IHJpZA0KPiBvZiB0aGVtIHNp
bmNlIHRoZXJlIGFyZSBubyBnb29kIGNvbmRpdGlvbnMgdG8ganVkZ2UuDQo+IA0KPiBJZiB3ZSB3
YW50IHRvIGF2b2lkIHRoZXNlIG1vcmUgZXh0cmFzLCBtYXliZSB0aG9zZSBwbGF0Zm9ybSB3aG8g
bmVlZA0KPiB0aGlzIGZlYXR1cmUgY2FuIGp1c3QgbGV0IGdsdWUgZHJpdmVyIChkd2MzLWdlbmVy
aWMtcGxhdC5jIG9yIGFub3RoZXIpDQo+IGhhbmRsZSB0aGUgQUNQSSBwcm9iZSBhbmQgdGhlIHdh
a2V1cCAobGlrZSBxY29tL2lteDhtcCkgdG9nZXRoZXIgZm9yDQo+IHRoZSBjYXNlKGEpIHBsYXRm
b3JtIG1lbnRpb25lZCBiZWZvcmUgaW5zdGVhZCBvZiByZXVzaW5nIHRoZSBjdXJyZW50DQo+IDgw
ODA6MjJCNyBBQ1BJIHByb2JlIHBhdGggaW4gZHdjMy9jb3JlLmMgLg0KPiANCj4gVGhpbmgsIGRv
IHlvdSBoYXZlIGFueSB0aG91Z2h0IG9uIHRoYXQ/ICBJJ20gZmluZSB3aXRoIGVpdGhlciBhcHBy
b2FjaC4NCj4gDQoNClRyb3kgYnJvdWdodCB1cCBhIGdvb2QgcG9pbnQuIEl0IG1heSBiZSAiaGFy
bWxlc3MiIGluIHRoZSBzZW5zZSB0aGF0IGl0DQpkb2Vzbid0IHByZXZlbnQgdGhlIGRldmljZSBm
cm9tIGZ1bmN0aW9uaW5nLCBidXQgaXQgdW5uZWNlc3NhcmlseQ0KcmVzdW1lcyB4aGNpIGZvciBv
dGhlciBkd2MzIHJ1bnRpbWUgcmVzdW1lIHBhdGhzLiBXZSBzaG91bGRuJ3QgYXBwbHkNCnRoaXMg
Z2VuZXJpY2FsbHkgdG8gYWxsIHBsYXRmb3Jtcy4NCg0KUGxlYXNlIGRyb3AgbXkgQWNrZWQtYnkg
Zm9yIG5vdyB1bnRpbCB3ZSBmaW5kIGEgYmV0dGVyIHNvbHV0aW9uLg0KDQpJIHRoaW5rIGhhbmRs
aW5nIHRoZSB3YWtldXAgdGhyb3VnaCBhIGdsdWUgZHJpdmVyIGxpa2UgcWNvbSBhcyB5b3UNCnN1
Z2dlc3RlZCBtYXkgYmUgYSBiZXR0ZXIgYXBwcm9hY2guDQoNClRoYW5rcywNClRoaW5o
