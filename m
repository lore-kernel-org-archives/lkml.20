Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C4033C518;
	Wed, 23 Sep 2026 01:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.158.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790128165; cv=fail; b=OtD9XnAzVJvgFWoRknyjUqvjryIQNZYbpxtO6crk4ficHeCOgf5Al9qKI/xwn0mXgQDIqcIbqaaEwIUtvNQrO0CkSpBljyxRzKxroBXo3V7ugxuuwdCdxcu9uHv0oEuOFlPKSs5cG4F1gRALBxEbzs2SeZga9JHcFvQWbswsh5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790128165; c=relaxed/simple;
	bh=UcjalYy2+fjQQUsRzL+XLqYA0HVcXO/MgcZwFOIkME0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BETHt275lnUm91iAkF9uRfER5Iy0ayrl7uBtDfAmGyJJ/TLzJD6nQwNuT+IcYzZyGFzJE/5u+OHlPI4h4lm+lmLG+V/RxPirNMpqMM/bckvplnZgciUSmOzdpOBqmrlyBeevpK6SsyPEEzi85zwoE0ai6V7UJXb94arOZxSI0Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=LVpVot9N; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ZfwfzUqy; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=DFdbLbdY reason="signature verification failed"; arc=fail smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="LVpVot9N";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ZfwfzUqy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DFdbLbdY"
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MK8nAR404920;
	Tue, 22 Sep 2026 18:48:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	pfptdkimsnps; bh=UcjalYy2+fjQQUsRzL+XLqYA0HVcXO/MgcZwFOIkME0=; b=
	LVpVot9NdaJVwlC8S6JRm/v0dD3BJz2a+h5yMtmLWmC8w1YuYsij/UiiVFD8S6jf
	/+o+l2IE3MstXIlBma/pcVXIS3oN8vHFniMfCTuIylUg0RR1p5mE5XHtp3qV2RpD
	3pKKTC7+B1cIieU4FUKp6yr/EdRLNwSmYZy6ax6JzWYlchnF3U4TCgOG/8mDEpJ+
	8rKhPmAV6pbCjK1WzP+bCm+CcgMLPn7FFeAVvS6Gy7WOLvyyhEQbhHu8sqCGY7E+
	bd+HSgh8nB7+jVP2mIUYUrNqGouvid9O0c9c8V+AkMmseNCOpW0LchzNErh6x/vN
	qklHkGjMI/IFImo6kOXyaQ==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 4guw563xwy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 18:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1790128130; bh=UcjalYy2+fjQQUsRzL+XLqYA0HVcXO/MgcZwFOIkME0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ZfwfzUqy0fT+cKA6SSkIpBb26ZYrb8CYzU4jmk895QdwVxzsu95nwQn7KlMgqIkiA
	 mR3fEPCYALXkHCPcf+NzVgR6HptgS7fLESm++9Ej4MLay4XscPIxl8vI6KdS4Plw5c
	 4v7/ZYkOUJHJgtPEjfbAQlrB1wzxzX83gohJMj/pZUi+e61XJgVKziZeqjoKRfN155
	 UXFw8iDSuQ8lZENhtB9QLiZpkehPdT9Pqmxw4s98kAg0xZyfXX7kYyvvNvXPlQNYho
	 oQ8Qnaqbp5nHxciwVkg8+mcFvhTks4TzRFGb2zP21uiw6JpxVJ+R2spvjhy4uj+HTL
	 HuxW9zC/2Yikg==
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6E4CD4029A;
	Wed, 23 Sep 2026 01:48:48 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id CB0DFA0070;
	Wed, 23 Sep 2026 01:48:47 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=DFdbLbdY;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00102.outbound.protection.outlook.com [40.93.13.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id C0257220138;
	Wed, 23 Sep 2026 01:48:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEYjGZrFSKP6H4ldx3+vbabK3k/QyIzqh2U6n/hXuE5gp9OE3jhq9rcHHQAwoeSFkAu8asigZT/ehTLzhub3n7PqT9b1uBDFwIgTSQsGYjcJkgpftV5t4nEmOAZXF7AMmZICKTaN0iv6WQIOfm8MZRrB7wWVb/Z0C7+HCTePwon4fQUq8KfGDgQiKYh0PV8BaNz1mRfjmnpMiFW3yyXta1mW15wadTBVygjkRBvuvACgiNRzz09+puazL5cqgr84WObVFwMx6QF7Npne0Qu47oqWTmnw6DxzWeIfB9Y173zaUeLMsb4GSFjb9SnVBk55wzJMrPuGbqHBJTaMIxNmZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcjalYy2+fjQQUsRzL+XLqYA0HVcXO/MgcZwFOIkME0=;
 b=oXTjpOn8J47XxJxIu5ZIo69iq55s0CCzFeh0JTTbO0DCebYKF1i7CTbU3Z5UgSqmepOdHtDPWUfODmTUkciMEmPcdPD8Nl75RfwwsC5BkbSnwhehsdQAfI8FcM57lD76IOWSgSn1FvADcKVn+osXUoxGbSPl+y/t4tFAQVXdo8ikifN11j1hVIuPG/m9wa6cA26/tiwgibMBn42drZo8OLV0EYodWfvPh85NddAbYKDiMaCyBjzNkmWfR6TeDNn14v+kNIZt9wClvP8Zuu5v8FQnmkfNtttjzOJBfoPimi9BHTwJwcLDYmRo2TvgCPyEBY/D0ZFS7dXsmeUvSugzJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcjalYy2+fjQQUsRzL+XLqYA0HVcXO/MgcZwFOIkME0=;
 b=DFdbLbdYrf2T9CTFDBch462Ujs3pD47fMy0Z+JghX25uX124BKSIAY+0dzTiUa76XwbYCCtywghH0ge/xWIAMzvKplbWafZQI/nRagrqNSs3WNgxNa7KE81VcHj4WcOxQkI2vo7hF4nTKdbDtNQBhVoSYGjgNw53D0mYXVLzmTI=
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 by CYYPR12MB8856.namprd12.prod.outlook.com (2603:10b6:930:c0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 01:48:32 +0000
Received: from SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7]) by SJ0PR12MB7473.namprd12.prod.outlook.com
 ([fe80::fd38:a665:ba4:95d7%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 01:48:32 +0000
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
Subject: Re: [PATCH 3/5] usb: dwc3: core: add post PHY registration hook for
 platform glue
Thread-Topic: [PATCH 3/5] usb: dwc3: core: add post PHY registration hook for
 platform glue
Thread-Index: AQHdRSWA1rLqr7QBT0WJU61nqebr8bbbcPqA
Date: Wed, 23 Sep 2026 01:48:32 +0000
Message-ID: <arMt7FhyfbX2COjZ@vbox>
References:
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com>
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-3-763bb546824e@collabora.com>
In-Reply-To:
 <20260915-b4-rockchip-dwc3-rockchip-glue-v1-3-763bb546824e@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB7473:EE_|CYYPR12MB8856:EE_
x-ms-office365-filtering-correlation-id: 724ce27f-7933-4704-7ecc-08df1914c654
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|23010399003|1800799024|376014|38070700021|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 qZ+6fVteWiUAFwoSss1fXpdVxeYlDFvW5UZzW7XeSWlIB4Eoa9bBYGudHIZc8VwNOjBEmyyyD6tGUZIar1d4c0FO1VFQM3NDHakz+rzXKDyQuGKPZ/XmB1ppJCxwLhvvVEQq/fseXGA3+a9FiVvl21dtWu8RF8i/8mWAUEy5OaXye0OUf/oz+DXR//AkElhPFvryeD0OFjf1UqD9XYZdixks+dfuObLTq0NGUizaT2xljxIYpzOU+4kJ92IIVlOvur9UAJfFKPwRXECSCJBeHArSjYjvpci/5aUbg/wywwWbgRWrWEnWUqawDVpLvGZuKfjcrSvTZXQoWto2iEunpvc//CaA5bfrOhUVwP/zN1EnbBIZcoTSvzHnNZd7aSfQ6FYKLA7/xKhlxLPSxVU7ENx3lK06gCm1fl0uZ/heMAWPXehnBGCyoBo/5gEQhsOiJwH/puSiRd71oyc/m1MxJoC6iITKsZzuuomltYqN1TKam2Y6qTJnx5zAM4ZdKdHc2YckC+PHtcQm3oXMyREUqWvbfhWNIH0e0yIFqLkD3uaLROUxlHSOTZfSv32GcdV6Av6+3vRpcG9R1PxaJELFs39Frq64T5kG+IrpipRY2qOi/coV+bjCfN8YEDZwmt9g2OdBZ3qVXLArSisDU9Sqndj9CjAf0FavK48lYm8cm7k5h8nm3qX7iz3sObCwDh53cbtJPkIKP69KBytAncAuE1DLwDt6zdfmojeEevcoODg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB7473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(23010399003)(1800799024)(376014)(38070700021)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WGxRVjNta0FtQmlKV0FiSnVuZm9HTlNtZFJ0dXlqTWttOUgrRHBTeXpEL09h?=
 =?utf-8?B?eUQwcVNOTXR5bVZhS0Y0bG83R2tvWUV4VERLNk8vNUY2NDdTbkxsM0t4REYr?=
 =?utf-8?B?R1RIOWxONUl4MU9KOUVYNE1QdVNxQU9kUmxRZEVDby90eUtnYWVRblloanF0?=
 =?utf-8?B?RUw0eHJ2bDRlVG16VElmY0pacVgrUGNnVy9ONlN3M1pBbjhSZjBMS3NrZmNH?=
 =?utf-8?B?ZHMwSXlRaWc3VTBWV0lQMmZlNzV0V0tRalFLQSs4NEwzU2VpMFBlVVVFSGlD?=
 =?utf-8?B?dndJNStzSGpvTjR5d0lnZkl0enlFUVJoS1QxTzJkUzdReHpVUEp3dGpoYUpx?=
 =?utf-8?B?M05LbUUyZUQzbHptQU83bDBtL3NQY0J1SzI1RHVYZnoveVh2UlVGQ1ROY2px?=
 =?utf-8?B?ZVQ3MGtwWjM1KzBtZmNocmRZSzBYMkQ3ZndQdEh5Vko4WnE2VDM5bEhaaW5m?=
 =?utf-8?B?ZlBWa0E1UysrRW8wWHBreGVEcnpUa3F2b09RZDVYUDFUeFdzVzhZZlh5WlBE?=
 =?utf-8?B?Q3dpa1lyRUpRTUZZbzI1ZWpmTFNiZjJ2WFJyZzA5cEdOUExlQXhXN2h5ZXBH?=
 =?utf-8?B?dVUyQWRScGF3WFJCQlZ3VWRmL3dqY1ludVgyOWcxaThRZDZrZktFeGpEbFgy?=
 =?utf-8?B?RzI5cTVDdkJkSitpL3BYUDU4c1MvcmJxamdFNXc1RWpuejNwdHRmNDRTZ0Zx?=
 =?utf-8?B?N05mZTRDakZVdzNUTUxnVnNtd0dpQnBwYm9FVi9IQ3gySWNicDVuZlJhK1FC?=
 =?utf-8?B?cERvcS9hQ3hUWkFZcm1QcCtNaExZWERJMkU1c3c0b0dqZ25XMWovSHRKOTdm?=
 =?utf-8?B?SkZpOStYdWN6YnR3SkhmdlBWekJPb0crQzlXZGJDTGZmczgzcmFhaDE0VjRq?=
 =?utf-8?B?V2ZmMjd0TGlPZkJhZlZBQWV3bWhqOTJDY3N3VStJVy9qM3QydWNZeW8yNGt5?=
 =?utf-8?B?NUI5eTZUVnBuZWY1d1JlU0VYL0oyQkdCTDNZL1dqeVZsN3BBZXZCUXEyblBk?=
 =?utf-8?B?SW8wNjdRQkM0R1BRZXZqVCtQL3U5VE54dXQ5VzZaanJ3QS9DbWlaUk9ucVdL?=
 =?utf-8?B?VWgyYW53Q2R1clE2VGxya1pvc3VwTncvRHlIbktGbVRnTWVPdVk0clNYNTR5?=
 =?utf-8?B?SkVPUm16TG1lOUZlU1hBdDczQ3pQYWRxSm1xeHpWdkxhUFE1U3NTaFdDQk9Y?=
 =?utf-8?B?OGpmc1pFcDU0c0hVZUVMUS9Hc2M5ck9FZW1ZZ0w3Y0JWK3VXa2xTWVhFbGwv?=
 =?utf-8?B?VVlBZFB1UDlWamp3endqdkoxeDJSeUt0aDRTS0p1engzZHpvTVlSaXRFNkln?=
 =?utf-8?B?S3NQdGRVQ0JWOFFKU1VEVGxST1lxMlFaWmxIZnlkTmdJV01BR3FJOUZVRmZ4?=
 =?utf-8?B?dlhUS3RUZ3hWcWlUN0Fma0k2eTVDaThWbU9qeHpadENoWVZ6bFBvNUJPWkhl?=
 =?utf-8?B?NzBuNnZYNGJjMWJFdXU0cnRGa1B3aU5mcnQrOXV2aTd1V2pSeWpaT080M1VU?=
 =?utf-8?B?VXpRdzJDYTJSSFpERUFwVGZkNk1HZitvQmY5cDhVNnhFbE5iRE1kVEFETy9l?=
 =?utf-8?B?ZlhyekcyQWttNVJLVVk4Sk9uSDBNTmZiUWNPZExXbnBaeGZoY1R6NGUzTXo4?=
 =?utf-8?B?T09TVzRKdU5VSjVRVWtCVjFaM0hiQkljdVYrMDNnUzZYeElqMkZKWFRwQUhR?=
 =?utf-8?B?Q08yeGdPUm0zaWd0VG9sMVJwMExja29yWmFpdXNTRmRqaEwxRUIvYVQ5QmI4?=
 =?utf-8?B?UmNXME15VW02UGwzTGYvc3BFUlQrUUdKbGlUUEJReElIUGJpNmVwY2d6aXlv?=
 =?utf-8?B?N0Q4UlYyelNJUEJDSDJXdXdNMnZBUnlpSGxRRitabk9OcmRiamZHT1dZQi8v?=
 =?utf-8?B?QmRjWFRudHA5YTZXYmNPUEtvamwyZnpRTjdTTUhPUnFSMjBPRE9QdWNSOWlF?=
 =?utf-8?B?eWZtMnhYTGc4TlY2SVo2Q3Z2MHJsdEdWTW50WVRmdEVnSmNOZ1YrQWViMTlK?=
 =?utf-8?B?WHNSOVh0QlY5SUxMTWIvTThEL29yT0hIRU5yT0NHZ1ZpRzZpSlFoM1hOMHd4?=
 =?utf-8?B?ZHhkZzJUYnNEZzlUVHRPS2VJa1lnTmIrdVRiUFNsUHZxRXNjYUdvN1Q2MHR3?=
 =?utf-8?B?WFI0Q1dDaW1QOUJ6b3k3SXQzbk1Demd1NkxRcDdJbjJBS0F0VmM4UkVpRFpT?=
 =?utf-8?B?TkFOa1VHMVdvL3ZrcFMzbEttU3ZRclFseWx0NDc3NGFKc1lyRXpOMDd6eVlq?=
 =?utf-8?B?dlNlcWthZXBYQUhlbVNOUThuTWZzTGJaMnJ1N0N1Q1Zpc2wrRkMvRDJmM1VB?=
 =?utf-8?B?SlRLMmx2cCtGZHNGUHNXVzVEMEtVTk43S0JmUkZGRjhhYkV2ejFUUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5CF7D2D86E00214A8676E5C5A92B6BF5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	5ZIhsl+3ZPZPfkME3c0G50DfgpUN1quUk3D2h/dON04ZJaVXFH4G3TEG8GlhEagNl2mGIN1xA9D+yn7m4T67g8NJaKzppROFUGklKPzZZth2iD/AqS5w3pJqIJufbjoMiC00gM2Zni2qXNO/wE3WdJQF+GQtGIK2mc6i5ZO3oacTjTEPM07+7zw13XiLNo10E3AQtPBQn2SgxKPeFc1kyhVRjbly371pt7ElKJTfIY+XeiETnmk0TwHzpfZTYaXLiBX3cSavL499qJgKQLwff8LlTnZDVub5HccjeAVOp1g8Jk7RtboYRUZiZFJQLiDWp7V8+C1jaaOZ4hVixTqpvA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	p6HXarB/GeIMdqHS4IvmdBiFwIN+YGoG2fI3Bg26e4xUAw1Ld8jSKHLbrmkDMhuj0uw9F2CN5PpNADpfXGzvJb+chOOxe+zpW9arska2WZzNMxvIxXZUe4L9lzAeijQgVDIF5aUpJIj6fM9mtUSxzcVUX/oyj8vHNxw9N0YFW4b77Fz/mt2BMDDoJAhw/46Yt01fap68gQ2GQZLJjjpjDCEv+hspSd4hF3SFTuj6UETu5lxrvovjT15JKHEp4mDpt1F6yvq2mAUKptjaVl5MjP5b2Z/fLHU5CGc6Z0nbkRSDGzWflXAQAa/U1cCTpX9xeOVYOItcek7Qm/cepvcVMYyJaLEnwnh0wshGd2+/sI4Je/ExFcPmxWuffcYHTMZ8zIjVPHW1CAtJUvGMyYYIC4zxTB3KJXo/c0aeBE7PDil1YW12qUHFYC4i/wHXPDJvCLKf+I6E2ECPvtauDeA42xrAZEMO41KrnCIrMa0Qvgu38KL9U6mQ243LLHiq+49diDivkS8Fqs9ruQnciWQicU4zo1OeDo8wlInUxwdgQxRpeoFETZJs4AOwitR2Jd0q7b5+T7ccKdtT4B4ykWHJ7K+KIbpSSB4kt1pQrt4r/ilbv+ePW2hSIWsTL21D0ofWbEQfczkICooWpRO6r+8bUw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724ce27f-7933-4704-7ecc-08df1914c654
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2026 01:48:32.7046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ytuW6aDqSPxo5avt/KbCPO1P3d8uHuc7W54LhyHsjS9b96B+ML8yjqwG5sPa4wj7kXQFPBCgMKefCeCdz8RtJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8856
X-Proofpoint-ORIG-GUID: 63-RO3C-wtoUDA6M4l4CTR2hqQeo2qgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNiBTYWx0ZWRfX5CBHPm8qAd/K
 7yJ5ClxeF5o0IF69L8ovxWcqrfj8T4Kbc+1cz1txWHORUGu6W0hhrtT7DLK6XGuRGs1kfHJxm8A
 AizJcg7h3COv1SQDZJwSEfyW+YG3yP2PGhpWMLLQ2QPTaFdyqVmVjJvKO1MXpkitMdOGm13KaHA
 MF+hUyByQ+AB7/L1XqfRarG4PCJkORXrv+/b2jCkA2+V0YFB/yy5GbuUb2aOSD+LXips6LDgAz0
 rYkoNcxKUaaagpa3nFl+0rgAYKFhMAvcIUI+1gX/VHYGzcoGqVvNO65sX3GUJsJiYXqUnuGIJ6W
 KhFcVbh7r1CkkdSL/iJo/Sl6RAEbRS0qOd7/kmORGTUmAYA441CpQGVQW/JfvMHKFJpzIWUQCN2
 JvStUQh9zaaaknhxRD1lsgvhY7ksLCMSu4Fww030L4ihbQBl9lkmMWySzmosymbVc3COrX1GWjF
 4zCnLYw+9FKSg8RRQ3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNiBTYWx0ZWRfX9PiXDW2AOaXk
 lYOT9cNvJEKZsZXFDOb6XIqun/4q10jcFvXsRKBC0W7iJiRrwWMNfH7Hp+z/dCTkX/9kQrYCmr4
 25OMMZP8sRySSfPhJP1f3Iutn/3cqnA=
X-Proofpoint-GUID: 63-RO3C-wtoUDA6M4l4CTR2hqQeo2qgu
X-Authority-Analysis: v=2.4 cv=Mb/5KJ/f c=1 sm=1 tr=0 ts=6ab33003 cx=c_pps
 a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=-4-sGo8i1FcW4KD7_GeR:22
 a=pGLkceISAAAA:8 a=QX4gbG5DAAAA:8 a=jIQo8A4GAAAA:8 a=fFHpL_doKWamrhBxXOoA:9
 a=QEXdDO2ut3YA:10 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609230006

T24gVHVlLCBTZXAgMTUsIDIwMjYsIFNlYmFzdGlhbiBSZWljaGVsIHdyb3RlOg0KPiBBZGQgc3Vw
cG9ydCBmb3IgY3VzdG9tIFBIWSBoYW5kbGluZyBzdGVwcyBpbiBwbGF0Zm9ybSBnbHVlIGNvZGUN
Cj4gYnkgYWRkaW5nIGEgcG9zdCByZWdpc3RyYXRpb24gaG9vay4gVGhpcyB3aWxsIGJlIHVzZWQg
Zm9yIGhhbmRsaW5nDQo+IFBIWSByZXNldCBub3RpZmljYXRpb25zIG9uIHRoZSBSb2NrY2hpcCBw
bGF0Zm9ybS4NCj4gDQo+IFRlc3RlZC1ieTogSWdvciBQYXVub3ZpYyA8cm95YWxuZXQwMjZAZ21h
aWwuY29tPiAjIE9yYW5nZSBQaSA1IFBsdXMNCj4gU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIFJl
aWNoZWwgPHNlYmFzdGlhbi5yZWljaGVsQGNvbGxhYm9yYS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVy
cy91c2IvZHdjMy9jb3JlLmMgfCAyICstDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2NvcmUuaCB8IDkg
KysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYyBiL2RyaXZl
cnMvdXNiL2R3YzMvY29yZS5jDQo+IGluZGV4IDRiNzEzMjg4N2EwMy4uZGFmNWFlYzA3ZmJmIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiArKysgYi9kcml2ZXJzL3Vz
Yi9kd2MzL2NvcmUuYw0KPiBAQCAtMTYxMyw3ICsxNjEzLDcgQEAgc3RhdGljIGludCBkd2MzX2Nv
cmVfZ2V0X3BoeShzdHJ1Y3QgZHdjMyAqZHdjKQ0KPiAgCQl9DQo+ICAJfQ0KPiAgDQo+IC0JcmV0
dXJuIDA7DQo+ICsJcmV0dXJuIGR3YzNfcG9zdF9waHlfcmVnaXN0cmF0aW9uKGR3Yyk7DQo+ICB9
DQo+ICANCj4gIHN0YXRpYyBpbnQgZHdjM19jb3JlX2luaXRfbW9kZShzdHJ1Y3QgZHdjMyAqZHdj
KQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmggYi9kcml2ZXJzL3VzYi9k
d2MzL2NvcmUuaA0KPiBpbmRleCA2MDhkYWViN2VmMTAuLmU5ZDhkZjBhMjk4ZSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gKysrIGIvZHJpdmVycy91c2IvZHdjMy9j
b3JlLmgNCj4gQEAgLTk5NSwxMCArOTk1LDEyIEBAIHN0cnVjdCBkd2MzX3NjcmF0Y2hwYWRfYXJy
YXkgew0KPiAgICoJCQkJbmVlZCB0byBiZSBwYXNzZWQgb24gdG8gZ2x1ZSBsYXllcg0KPiAgICog
QHByZV9zZXRfcm9sZTogTm90aWZ5IGdsdWUgb2Ygcm9sZSBzd2l0Y2ggbm90aWZpY2F0aW9ucw0K
PiAgICogQHByZV9ydW5fc3RvcDogTm90aWZ5IHJ1biBzdG9wIGVuYWJsZS9kaXNhYmxlIGluZm9y
bWF0aW9uIHRvIGdsdWUNCj4gKyAqIEBwb3N0X3BoeV9yZWdpc3RyYXRpb246IENhbGxlZCBkaXJl
Y3RseSBhZnRlciBQSFkgZ290IHJlZ2lzdGVyZWQNCj4gICAqLw0KPiAgc3RydWN0IGR3YzNfZ2x1
ZV9vcHMgew0KPiAgCXZvaWQJKCpwcmVfc2V0X3JvbGUpKHN0cnVjdCBkd2MzICpkd2MsIGVudW0g
dXNiX3JvbGUgcm9sZSk7DQo+ICAJdm9pZAkoKnByZV9ydW5fc3RvcCkoc3RydWN0IGR3YzMgKmR3
YywgYm9vbCBpc19vbik7DQo+ICsJaW50CSgqcG9zdF9waHlfcmVnaXN0cmF0aW9uKShzdHJ1Y3Qg
ZHdjMyAqZHdjKTsNCj4gIH07DQo+ICANCj4gIC8qKg0KPiBAQCAtMTY1NSw2ICsxNjU3LDEzIEBA
IHN0YXRpYyBpbmxpbmUgdm9pZCBkd2MzX3ByZV9ydW5fc3RvcChzdHJ1Y3QgZHdjMyAqZHdjLCBi
b29sIGlzX29uKQ0KPiAgCQlkd2MtPmdsdWVfb3BzLT5wcmVfcnVuX3N0b3AoZHdjLCBpc19vbik7
DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbmxpbmUgaW50IGR3YzNfcG9zdF9waHlfcmVnaXN0cmF0
aW9uKHN0cnVjdCBkd2MzICpkd2MpDQo+ICt7DQo+ICsJaWYgKGR3Yy0+Z2x1ZV9vcHMgJiYgZHdj
LT5nbHVlX29wcy0+cG9zdF9waHlfcmVnaXN0cmF0aW9uKQ0KPiArCQlyZXR1cm4gZHdjLT5nbHVl
X29wcy0+cG9zdF9waHlfcmVnaXN0cmF0aW9uKGR3Yyk7DQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+
ICsNCj4gICNpZiBJU19FTkFCTEVEKENPTkZJR19VU0JfRFdDM19IT1NUKSB8fCBJU19FTkFCTEVE
KENPTkZJR19VU0JfRFdDM19EVUFMX1JPTEUpDQo+ICBpbnQgZHdjM19ob3N0X2luaXQoc3RydWN0
IGR3YzMgKmR3Yyk7DQo+ICB2b2lkIGR3YzNfaG9zdF9leGl0KHN0cnVjdCBkd2MzICpkd2MpOw0K
PiANCj4gLS0gDQo+IDIuNTMuMA0KPiANCg0KQWNrZWQtYnk6IFRoaW5oIE5ndXllbiA8VGhpbmgu
Tmd1eWVuQHN5bm9wc3lzLmNvbT4NCg0KVGhhbmtzLA0KVGhpbmg=
