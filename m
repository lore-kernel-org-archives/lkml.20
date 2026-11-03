Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.133
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793692165;
	b=YwAt/3ezV+7lWCCvJUYyagwGsFGzBjTbSIx70fpYrf2A+1qwfiJRizuhHLPdDcAFG6F0
	 kyYU4pAjZQh1cT2rz+tB5a7qvrhMZ+kJt/zEMdVubYox0oLY0Z0BMedjWcezhs9GqJrjh
	 HLitQISOEcpSwiagM8ePlHALyYm9D3gGxswHaLyvcuJAjuKuiPIe8AK9142pmI6QpioI7
	 zaNsQywEtOd6R7hke9KIFaT6pWm1gtdDvJoRPpe5sk41Gmtbu3evOyb9b6S3tdcdnibAD
	 O51In8ipEGh0Tzy0nFVjasTZHyMAqtUMh32U4aaWFn7x0cHlZgj7BvnDmAIeJxn7Q4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793692165;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:Accept-Language:Content-Language:
	 X-MS-Has-Attach:X-MS-TNEF-Correlator:x-ms-publictraffictype:
	 x-ms-traffictypediagnostic:x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8Sdb3Oh83ke8g4NDq3WeYH4ZIe9aL6Of7p5TxejTa4g=;
	b=HyU8s8qo6Gqm2fZpus9UNgwTO3gtaRY8AHp3qGF5sSHZgHhqneOIqToyBN/h19kUTP8U
	 0jRmM3s6w7lb90i5RDRvQj6+fdmsvYdMKDfi6OS5Gnk5jMKBYDtVHI4hrnr4WxnD76/iI
	 uc5aBAHEJ8O5vA77v6/B2C94ZV8TUVHF8pQu2MmQ+4T3Dj7IOSfdLCouYyOz0yGzmHTdV
	 dVGZdC/vMHSDWeZ+oAtNe7ZrzEG4pQYDIa9dJrZbnQsp5qZ+9WI8kwrLvEqUzBGTzRn2t
	 XnMpq2MZ6oT88ySigqsHniIUWxhRx8dspllL5na6fbGk+MyKjTgGUJPlxtU78jTl5ZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.133
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022133.outbound.protection.outlook.com [40.107.75.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 604A7606A324;
	Tue,  3 Nov 2026 07:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 604A7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzvkOa3yTuqCt9z1F/cB2qPjsKxDFf+TICeS1YtJlmAyuXoyYBt6sblKyy72zwMdN0EsZla2oKkvrHycHDKQWXZOOXyjQr/9PBjDC1+snUfTOuKRnOjHHreeg2B2WzRplNEwx0QHpI+jG5njeBEaqxTSb9ykFL4QjtaxMQwfg7WcVe0AFHAxGkB5sGyFPcg+6VyaaCSZMam2iTLS7DhBZLpjO3p7m5lJPM8esMQAY1cna/F1yqxZFG/J+/pmaJoHvMgngSsiSA2+ZruFECBp21NG4aZv4+XuumKRm5inTMAudmM/ooRsNqBrmkmxuQ6jyA4JkYBfZsUx62VoTuu53w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Sdb3Oh83ke8g4NDq3WeYH4ZIe9aL6Of7p5TxejTa4g=;
 b=wDwS7hOZWZkmJksDMrB7GLHtIg7qy0d6Q8Yb+e0+gR/AIg4t8C2MS54tW3oqATVGNlaCsE0U/NCGO1ZE71yea/20fxyUkECFY6jZ6dDIqLAna8N44Lp0EHWBmf1XUayv4eWtiH2HlwetJ2qglU22bFtl24erJoh5osl3gVCGxr49l5uP5nGlW/4HEyZ5fvCkPdQyAci2oJ9wtR4Cl1Ib8ELk67AIkVCwyj5LmY5j14PlsWyfM+8ey66g1FTSrorxZ5uHFQQn8wxpdaGhDShE52o9Hti+eHPI3UVQBwfGeGMGAfBT8m2WmhBgSQor1Fjjh1V8ljLLaCMK9jnScaqM1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com (2603:1096:301:80::7)
 by KUZPR06MB8941.apcprd06.prod.outlook.com (2603:1096:d10:86::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 07:49:19 +0000
Received: from PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac]) by PSAPR06MB4439.apcprd06.prod.outlook.com
 ([fe80::c772:e1f:2c48:f9ac%3]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 07:49:18 +0000
From: =?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?=
	<hongliang.yang@cixtech.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?utf-8?B?R2FyeSBZYW5nICjmnajmlrDkvJ8p?= <Gary.Yang@cixtech.com>,
	=?utf-8?B?RnVnYW5nIER1YW4gKOauteWvjOWImik=?= <fugang.duan@cixtech.com>
CC: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>,
	=?utf-8?B?SG9uZ2xpYW5nIFlhbmcgKOadqOWuj+S6rik=?= <hongliang.yang@cixtech.com>
Subject: [PATCH v5 0/3] phy: Add CIX Sky1 USB3 PHY support
Thread-Topic: [PATCH v5 0/3] phy: Add CIX Sky1 USB3 PHY support
Thread-Index: AQHda2fUEIC+2qfBzU6J0hJFrTBzHQ==
Date: Tue, 3 Nov 2026 07:49:17 +0000
Message-ID: <20261103074913.1971025-1-hongliang.yang@cixtech.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR06MB4439:EE_|KUZPR06MB8941:EE_
x-ms-office365-filtering-correlation-id: cf94f365-4824-453b-59fe-08df397ef6dc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|38070700021|261102124527099003|56012099006|261009223027099003|261028144727099003|261026121527099003|261022075727099003|261022105027099003|261026140227099003|261021121427099003|10067099003|18002099003|261102123227099003|6133799003|3023799007;
x-microsoft-antispam-message-info:
 mGrU2mxEqTaIoDmWBSZrhV1H4YHEJ1Eo5wP6ghR7oS27R9onRFDZbQUQO8vu//GeREQlcK6gpK3oZ50v03xvj5+699OCZ2Gjlc35SaSqCfWovSm1XFt7EUdKGY4tQ9xSI7FOHPuurx4gW+y3eTd8mjkwvPY3R0A1IZm/8pRUx6Z4penEoWFvRx4RQqaJeO8lJcyg6IFW5Tf1/1ZJUYwTqS2Frug9ywgFz+UykBWVUBr2i6VVLTc39bxXRh3KuJxIjw6jsoHMYiY0udFAeEq3udRSGWnDZraYr/xHwa3TF5XOxuw/7t//G0oUYShKZFElGBvr4TJdMM06MmQTi2+b7Ki1uHzLU96wxephj1FMzHZq0QGEuDewtRTx6Fz6U7QuhHVGMskPSWcsOsLtG8+S36ecAhzDNS3TGe7YhVeRsMRPj/KxYddPhtHmizPfOnAkH9P9yGFIFInlEF+0V/kStVoM0NPgy1/uiypN6IbwXJRbxvBmAWjVFtEPOvUwW2OUji8oz1vtBTkRuV1xbzpWBPD2YMDo44boJNMtEB8TKnZYba+l0jQUc/hq5TuVOtdqRUAz4+7nVbUGdvxe097vmemA/IAGBCh5FW70TlpEUlwxmQHEpIohHKj3yzuECB3cJnXR2qVltOzcyyvlE1Rh2e41p3Q7a1Hq88yGj7nYM5BLfayJgzocEgbsj3+Qe3KvBWg5vv2wKR7klmpbQFlJC26D4+qcTvVXlC5oUMkH0g8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR06MB4439.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(38070700021)(261102124527099003)(56012099006)(261009223027099003)(261028144727099003)(261026121527099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021121427099003)(10067099003)(18002099003)(261102123227099003)(6133799003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWM3cGFGNGorVzFPdzRrNWd4VzBidVFLd2JJeEUvZ1lwaXRjWVYrc2t2Y2JE?=
 =?utf-8?B?OGFCbWR3MU5aRExWS1FVQkpXcVJRamc1Vk9NS0wvSHU3bVdDRlB2UXVDQmsr?=
 =?utf-8?B?dVJYUlJDOUxucUhZcWU5NFZocytTWE1kM0VUb3lIT01FZW1INCs1cmtGY0ti?=
 =?utf-8?B?Y3h4V1Y0cHVrMjV4ZGF3SEdnUXhkOVFsZGt6RXpUcVRQeVB5NUNCZUFIekxG?=
 =?utf-8?B?UlMxQ2VISEpHVGNjcnUrNEtWeW1oZzRhSkQ1dThZM2U3NWJIclFzOFlTUnhL?=
 =?utf-8?B?cHFERTJIMmZzTTNTNWt4RlFKSGxTV0svMGlQRHdPUXg4NTZSbzd6TVF6REc1?=
 =?utf-8?B?OUQ4Q3ErN2pyRFMwejVadWNLaEhoWjB0SHFMalN3NGg1ZnF5SUtpdlplZjlV?=
 =?utf-8?B?VFJIQkxhaFdWZFUrcDBCZE9oQnFkdE84Y2xWVlA0TGJJQnlhcVoxOVRtMTBj?=
 =?utf-8?B?MTFjS3lsK1hnWHN3UEhxbkNHbmYrUXBWS2Z2aWxwTVp2WDhaRVIxY01xWlJ6?=
 =?utf-8?B?UDVLUWVWVWtyMWtZanMxOWF5dUJuWTlvU3E2UXlMaGdBREg5WFRhMStjYnVq?=
 =?utf-8?B?ZUNsTkM1cVh6bVFnbkNWVi90Z04wYjJWcm83VFhwVW9sQ3UydU5IZno2a3VO?=
 =?utf-8?B?WDljK281MFZDM3hrWGhWNGE4bFZTY2pOOUUrbkVFR3ZLNzE4REFnVU5tckhu?=
 =?utf-8?B?bjlKL2N6VGtEcDhiRFBkSlBxaSsyVUk2SjRoTDRSdmI2ck9YSlI3bWgwb3JZ?=
 =?utf-8?B?ejJ2czd5WUdhb1ZaQklWaFZQNGV1RThlN1FjeTBSYkZwTmhsZEo2SytjMUh2?=
 =?utf-8?B?WUpOc1ltZFd0YVlyYmtTYURULzZjUjZvK3R6ckJQRnZnY2RxUEczL3ZVYUVi?=
 =?utf-8?B?R1orZVZndTNxZmNqMk1CMHdiQ3NKTDVYejNJNTFWODc5YjduQnBXZW1WWCtr?=
 =?utf-8?B?U2dwVDgyeWFqaEVzbXZtaGNYSXV1UU1ZUmpvYzhXUlFDdHlHVUo1aVhDRGFT?=
 =?utf-8?B?UUpmdEFicHN1RmZneUVzNmxCNXhrNDBSY0JSdEdzN2hVbnIwRmZFMEpMYWpi?=
 =?utf-8?B?WWN6akdnR2FnZ2NsajA2dHJxZFdESFllclZFRGpWVThBWGxyUFFFRlRPek5r?=
 =?utf-8?B?b21Oemo5V1J0RVF3VGU1MGgwTVBCaXY1UERLaC9McXMvcGo4ekdIUU5CaHcv?=
 =?utf-8?B?WFZBU0tFbXNrUHN4SDhRUXpRcWRVRGZ3NXhnNS9qeXhITHU5MmRxTkdwMXVj?=
 =?utf-8?B?Q0N5R2FSTVN1VkY5RkE3UDZvekpkRFd5cE9rSGtRVUdnRFVyQVNBQVJSeHp1?=
 =?utf-8?B?aisvU3pFSnJVT2h5Ny9Sa3pTOWZySWlnamhIeXVrbnNsMzIzWWpOeFBXU3FK?=
 =?utf-8?B?c2VKK1hqcGVQKzl4RkJmWENKNnlGeXlUOXlndS9yR05jN1k2UFcrTk0wcXBW?=
 =?utf-8?B?a1FSRFBnekQyZUROdU1HN21MRTV4RU1tTHpxalVjK0s5Sml1dFhSUnYvYkR0?=
 =?utf-8?B?Q0NDb0RldGVIUnZQYzg5N1ZoeXlWTTR6Y0xUUTROWlcvS0s4bGtvLzhhMFQv?=
 =?utf-8?B?WnJKZ2tKR2xpaUU4K21pSGdrbWJKaHpGVlR4dUUwYVJNOHFPcXoycnZpRTMr?=
 =?utf-8?B?Sk9RdDgvVStZYU9GdkNuRmp2THRpc01jZWNDaWRnU3BlZzY0VXhTQml5RXVr?=
 =?utf-8?B?Yk5YcVZaMEk3amZIYkJVS2EvaXQ4NFVMUWtxUU0rM3BsR1NheHdEaEVCR2Vp?=
 =?utf-8?B?czNHcW94MEhCT1lEVXpGajNxbkdGREVVaDN0NEluM29ndWxwVnVHNHkwWHI1?=
 =?utf-8?B?U0xxK3A3MkxpbHBIYjdnNUxKTVhoTGRIZHdVMXBGTW1jK1I2TFl4UGN6S2xY?=
 =?utf-8?B?S0wzSUl4VFdMQWhSWDJvZG02Ny9qdUN3T3hkMkFualU5Nk5RUVA0b1hLZE5T?=
 =?utf-8?B?SHBuZ2VIRVdVdFdCQzcrU2w2SVBFK1lHUTJGOFEvZGJsTlc3OWNXd1NzWUZT?=
 =?utf-8?B?WWlvL3hLSDhrNkx6NkF5RW5JRkVDN3JJOE9GNmxPREhaMzFNc0VkdXJKeVB0?=
 =?utf-8?B?UkQzTnJVcVVhbmZUQitvb3pPZ2R3dTZ5bWxpWWRqYktmaWhxOTJuTkFwRGRM?=
 =?utf-8?B?MXRhWUpKS0VWa041YWhXK3RDK29KTCs1SkZqcjhrZ0lLb1hCaEVHZGJGMUVu?=
 =?utf-8?B?WTVXd2tjbUJ3anR4Um5yQ1lvYmEvVnU1cmhZM3k3d3VGSDFPZGxtTDZVUnVR?=
 =?utf-8?B?Nk12VWhNRUxnWXN5NndHTXQySFlRcnFVNzRnN0V1ak9pWkt6VG13WWh0cHZQ?=
 =?utf-8?B?anVBaEJOWVhzNTI0dUFuM0RWa2VHVDdqemJEMk10VmZLU3VhMG93bUNrdWMv?=
 =?utf-8?Q?9Bq0z0os0+ATg6/U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4106413FE51994CA832D241C9644777@apcprd06.prod.outlook.com>
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
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4439.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf94f365-4824-453b-59fe-08df397ef6dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2026 07:49:17.9734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u4nD5cCdMmUCUW2ov9/PQBivN9q7NHKkrSxZizyBmFzZtjV/8VjibLYkk+yiMNbXRgdx+LY1km6ty1ZIm0Kl4P1Fsf3PKmyTz0fqn/It5Iw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8941

VGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciB0aGUgVVNCMyBQSFkgaW50ZWdyYXRlZCBpbiB0
aGUgQ0lYIFNreTENClNvQy4NCg0KUGF0Y2ggMSBhZGRzIHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5n
LCBwYXRjaCAyIHRoZSBQSFkgZHJpdmVyLCBhbmQNCnBhdGNoIDMgdGhlIFNvQyBub2RlIHBsdXMg
dGhlIGJvYXJkIGVuYWJsZW1lbnQuDQoNClRoZSBQSFkgcHJvdmlkZXMgdGhlIFN1cGVyU3BlZWQg
bGFuZXMgZm9yIHRoZSBDYWRlbmNlIFVTQlNTUA0KY29udHJvbGxlcnMgb2YgdGhlIFNvQy4gVGhl
IGJsb2NrIGlzIG11bHRpLXBvcnQ6IG9uZSBpbnN0YW5jZSBpcw0KZXhwb3NlZCBwZXIgY29udHJv
bGxlciBwb3J0LCBhbmQgZWFjaCBpbnN0YW5jZSBoYW5kbGVzIGl0cyBvd24gcmVzZXQNCmFuZCBj
bG9jayBtYW5hZ2VtZW50IGFuZCB0aGUgUElQRS9QTEwgaW5pdGlhbGlzYXRpb24gc2VxdWVuY2Uu
DQoNClRlc3RlZCBvbiBSYWR4YSBPcmlvbiBPNiAoU2t5MSkgdG9nZXRoZXIgd2l0aCB0aGUgVVNC
U1NQIGNvbnRyb2xsZXINCnNlcmllczogdGhlIFBIWSBwcm9iZXMgZm9yIGJvdGggcG9ydHMgYW5k
IFVTQiAzLnggZGV2aWNlcyBlbnVtZXJhdGUgYXQNClN1cGVyU3BlZWQuDQoNClRoZSBjb250cm9s
bGVyIGRldmljZSB0cmVlIG5vZGVzIHVzZSB0aGUgUEhZIHBoYW5kbGVzIGFkZGVkIGhlcmU7IHRo
ZQ0KVVNCU1NQIGNvbnRyb2xsZXIgc2VyaWVzIGlzIHBvc3RlZCBzZXBhcmF0ZWx5Lg0KDQpUaGUg
c2VyaWVzIGFwcGxpZXMgb24gdG9wIG9mIHY3LjQtcmMxLg0KDQpDaGFuZ2VzIHNpbmNlIHY0Og0K
LSBBZGRlZCB0aGUgTUFJTlRBSU5FUlMgZW50cmllcyBmb3IgdGhlIGJpbmRpbmcgYW5kIHRoZSBk
cml2ZXINCiAgZGlyZWN0b3J5Lg0KLSBEb2N1bWVudGVkIHRoZSBvcmlnaW4gb2YgdGhlIFBIWSBp
bml0aWFsaXphdGlvbiBzZXF1ZW5jZS4NCi0gUmV0dXJuIC1FTk9ERVYgaW5zdGVhZCBvZiAtRUlO
VkFMIHdoZW4gdGhlIE9GIG1hdGNoIGRhdGEgaXMgbWlzc2luZy4NCi0gVXNlIGRldl9lcnJfcHJv
YmUoKSB3aGVuIGNyZWF0aW5nIHRoZSBjaGlsZCBQSFlzLg0KLSBEcm9wcGVkIHRoZSB1bnVzZWQg
ZGV2X3NldF9kcnZkYXRhKCkgY2FsbC4NCi0gR3VhcmRlZCBhZ2FpbnN0IHVuZGVyZmxvdyBpbiBz
a3kxX3UzcGh5X2V4aXQoKS4NCi0gRml4ZWQgdGhlICNzaXplLWNlbGxzIHByb3BlcnR5IG9yZGVy
IGFuZCByZW1vdmVkIHRoZSB1bnVzZWQgcGh5LmgNCiAgaW5jbHVkZSBhbmQgdGhlIHJlZHVuZGFu
dCBzdGF0dXMgcHJvcGVydGllcyBvZiB0aGUgUEhZIHBvcnQgbm9kZXMuDQoNCkhvbmdsaWFuZyBZ
YW5nICgzKToNCiAgZHQtYmluZGluZ3M6IHBoeTogQWRkIENJWCBTa3kxIFVTQjMgUEhZDQogIHBo
eTogY2l4OiBBZGQgQ0lYIFNreTEgVVNCMyBQSFkgZHJpdmVyDQogIGFybTY0OiBkdHM6IGNpeDog
QWRkIFVTQjMgUEhZIG5vZGVzIGZvciBTa3kxDQoNCiAuLi4vYmluZGluZ3MvcGh5L2NpeCxza3kx
LXVzYjMtcGh5LnlhbWwgICAgICAgfCAxMDcgKysrKysNCiBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvY2l4
L3NreTEtb3Jpb24tbzYuZHRzICAgICB8ICAgNCArDQogYXJjaC9hcm02NC9ib290L2R0cy9jaXgv
c2t5MS5kdHNpICAgICAgICAgICAgIHwgIDI1ICsrDQogZHJpdmVycy9waHkvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCiBkcml2ZXJzL3BoeS9NYWtlZmlsZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KIGRyaXZlcnMvcGh5L2NpeC9LY29uZmlnICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyMCArDQogZHJpdmVycy9waHkvY2l4L01ha2VmaWxlICAg
ICAgICAgICAgICAgICAgICAgIHwgICA2ICsNCiBkcml2ZXJzL3BoeS9jaXgvcGh5LWNpeC11c2Iz
LmMgICAgICAgICAgICAgICAgfCA0MTggKysrKysrKysrKysrKysrKysrDQogZHJpdmVycy9waHkv
Y2l4L3BoeS1jaXgtdXNiZHAuaCAgICAgICAgICAgICAgIHwgMjg5ICsrKysrKysrKysrKw0KIDEw
IGZpbGVzIGNoYW5nZWQsIDg3MyBpbnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvY2l4LHNreTEtdXNiMy1waHkueWFt
bA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3BoeS9jaXgvS2NvbmZpZw0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL3BoeS9jaXgvTWFrZWZpbGUNCiBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9waHkvY2l4L3BoeS1jaXgtdXNiMy5jDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvcGh5L2NpeC9waHktY2l4LXVzYmRwLmgNCg0KDQpiYXNlLWNvbW1pdDogNjYyOGU3ZDRjNmIy
NWM4ZDE4ZjEzNDVlM2EyMGQyMTgyOWFhZTdlNA0KLS0gDQoyLjU0LjA=
