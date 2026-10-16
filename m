Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0517395AE9;
	Fri, 16 Oct 2026 06:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131894; cv=fail; b=a0tCK8n4zBATTS8G8cknXvogy7iJYrxyrVJlomaZNJNWgMDfy7g9GU2M6Z4u92F8ZccP1xfa3FgSNfm2ZPRRFv3eqgosFvFIYosYs4ToDFi1CCYWUrBk1VvA2Jp8iZBGetI0yeQu2QRb88vbGDgwsoiID6Ffd94lXm1c7lYWRgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131894; c=relaxed/simple;
	bh=GXg67KKcIV8vQXmVGUZ/aicdluBwYKpFTc5E/01Zm4Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gfoWbQLm8ujCUO0entazLh5Z9gC2pe1sMNpsck0tK1V8uoKpLS2ewMXJagzSnoXZReAGcPBiqqGD1REDdtzQPESUQsATIQrnHhR2lsIX6woGoXpUJ+HJciv+v8qaaqwH/Vc+CSwi0rftpibnx6jx1DHxuTgO8EyX6cfTNS+Bbkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=YPbHqsI2; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=qtSb75Al; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YPbHqsI2";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="qtSb75Al"
X-UUID: 48105958c92a11f18dc8c9802ae25ab1-20261016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=GXg67KKcIV8vQXmVGUZ/aicdluBwYKpFTc5E/01Zm4Y=;
	b=YPbHqsI2gP1PVaw46+h1KbORnxL21RnIWw03rhUlCZeFjGtGRhoWPyg8qx845MW9wU+rjUaAyqAFo9bSq6MODmmzuZKukpwKw6oUBOQMDCdlqSoyd7Qp53HN0pNTtiHFF6xY3JW0dZF6fcG9cnFYDGDEb5zBCo5YOT9ZInmEBnk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:65a1325b-d3b2-4739-bf00-6b85b646bf2f,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:291e20b,CLOUDID:24750b88-1743-44a5-9688-a8e601827335,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:4|15|50|99,EDM:-3,IP:nil,URL:99|80|1,File:130,RT:0,Bulk:nil,QS:nil
	,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_ULS,TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 48105958c92a11f18dc8c9802ae25ab1-20261016
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1580206549; Fri, 16 Oct 2026 14:24:46 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Oct 2026 14:24:44 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Oct 2026 14:24:44 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/LCMqUBygqw/61PM2L8VW8fIqfNWjDyN2eVMp9MSIXj/Y7L9o5/fPb4NQRkVYsbLs2C/uloo0zJ0sDIX/wlduH2aqTMJ0F15y5nz99NNOCw5iQna9KTWPXWc984xYOoa/C/SxXwG8J4e18q5J9IdwLns44+eSHp8Fyzjop/BNBmGf79AyD0NxN/v8wiwoWh1P4xJbtc4fzVVduRquzz90dicTLR41EwMAxlfEYfpNvb2u9XgfLzxT6z0ovwTl7+fGA0u7THqG3bB/a4nCJ84fgLHkUpyHphKK6T2gon8Xq+ZtdUL6QVY36GCjnlc3hD3CA8lxrOscgpC07DyxcxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GXg67KKcIV8vQXmVGUZ/aicdluBwYKpFTc5E/01Zm4Y=;
 b=f+dFaj0GM9E0DEMTc0JoOYhEFfq4GS0gf/RfkSw2ZUJESD0Va/GYucYzsplNEkCZ8XAPZJm2MZZRf2g3aLBbTmWYSeRnkUo/G+rdggvqhcspQwAno6GiD2JuDuhWqCnOXzCvS0CE92pKt2SwuHKY2ZiNzP/HSFIJcJhuLN9rHUEYNxJE0tVqmJvamYuH4+1tf+5VhlFxBakVqeBcMM62YFEPL2qTGQHdnyzS7kVTJLQ7D1sbFSmTnrCz95XVPotoLV+C30+Dz0nOAG3rGsLafx1z4vWKnt0YTEOXxD0ZiDAHoMgMwM7VdzyMtAAmMpVHDcNGD3MWyUPAGySxQPSs1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GXg67KKcIV8vQXmVGUZ/aicdluBwYKpFTc5E/01Zm4Y=;
 b=qtSb75Al31Z8thUA7Sv6+r1KdNPwOtAA6xwsHRo3mcPR3xVNzksSsI8F36tXT3D/HdcxthkWUl1/jMs/KcwKOUth1dnimpIZ2dnVRdvkHGFQSYsjUROXZIhqRk7RNSs8imDhUImwrm1I/+j8YukEZN1ECxJ4ghE//KwpgeztXm0=
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com (2603:1096:301:a3::12)
 by SEZPR03MB8471.apcprd03.prod.outlook.com (2603:1096:101:21f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 06:23:37 +0000
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1]) by PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1%3]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 06:23:36 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "hverkuil@kernel.org"
	<hverkuil@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, =?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?=
	<Irui.Wang@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v18 09/13] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Thread-Topic: [PATCH v18 09/13] media: dt-bindings: mediatek,jpeg: Add
 mediatek, mt8196-jpgdec compatible
Thread-Index: AQHdWI5qu82kgU5XD0Wxp7jvADMzoLb5qFAAgAYUAYA=
Date: Fri, 16 Oct 2026 06:23:36 +0000
Message-ID: <4210b852f7d592b6bb7d85cd62580f0678ae2368.camel@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
	 <016a61397c01b8745622ff54f1e27b5209b3f34d.1791614327.git.kyrie.wu@mediatek.com>
	 <20261012-original-visionary-gharial-ee41cc@quoll>
In-Reply-To: <20261012-original-visionary-gharial-ee41cc@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6396:EE_|SEZPR03MB8471:EE_
x-ms-office365-filtering-correlation-id: 26c59a57-afe8-476d-e618-08df2b4e02c6
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|10067099003|4133799003|38070700021|4143699003|11063799006|261009223027099003|56012099006;
x-microsoft-antispam-message-info: 1aG//MBtq84CIIKCIUas07hzIXVBmJIJPXx7ajMVMZCsByscz2Ylwa1BHd4/gHd8g1G+UEG+EHgOKNyT/TDV1/Gjrz14D4mYdYjusf2lPUCwMBM+xEA5ZXmD6yiUvcmBWWIFN8qzAt2WoOZznIPwj3p8jH3h1DoFOoIvtL7+s0NkVbgYS1YMeg2V4+A8ft6znHao1qyXkNwhP9twpZN11nSgwdgQsFV5yXCQLfbM4qT+mI5P9t4GF8bMbQRXqu+XWPOJeBbjwLboKanG3gU8U07bQmCsNpgfDvm4pETHOBOJB6fjiWvVKHWud7ESwyTeowwuPOnEbVe3JI7ZuUH0NRHZWSgg5PF469eEJjNfEm+MZrS0rBPJeIKFC5lnR2jaTPfd9dTQLxElln8Y0dQpmVmpu28koOjJ1JdfXi4mt241s6xyBAdimjSfvxo9cO7CtMTXjyLEO/7ZIMiBvbHtm6i2LFatuKoNij++1Mijcw7r/PdKz3HILHQCy6fc8dTVfjtjQKI5Jnv48Fk95NwgeiGN6d6q8x7zLsxFQ7kxg31B2mxqpzxo+v+cgd1fpFKJ5j8/Axv2o41T3M7bY51QHXdvfFNAAvy9W2iunQG50xzQEWkm87ag32Y+IikQ/q4jSRVe4JIKQ+oqcu+saJk7bhPbz5Y/OjDd/fAhtyxubYg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6396.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(10067099003)(4133799003)(38070700021)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aG9ISjh5cnU1RXNjdHptZFVETUJheFhQb29rTmIwMWVYdUZhNEY2UFZhRStw?=
 =?utf-8?B?Rk1CN1UyZFZ2MjdJV3FRRkZ6Nk5lQmVOdkQ1RSs3Z3NEWHoyZTJnSE1rc3hn?=
 =?utf-8?B?eExsUGdCVHVMRlh6Z1pWZUlUZlJrTFJxSTZyd3F0Q0lOQmxuNWptQWRtWFhx?=
 =?utf-8?B?cjJFV0VaVTZJZzFuM0YyMndVRkpaMFZOUTVNb0xRbHRXZGhkZHlZUHppbWl1?=
 =?utf-8?B?UGVLMnJRTUk0TzhQZVBrb3AvN2xsTGlOVXlTenA0T2E1L2hmYTN3WmFiL1VP?=
 =?utf-8?B?QytxSnlIeG1XOGJyMFdtbzliY0xhQ1A2TkxMNUlqZEQ5L2NvbHlTcTQ2eUZW?=
 =?utf-8?B?QzJjckhocGZYWUxKc1dxbUxuOW5yTlZvUFljTUtuMURTa2dUVHhoR1hnc2FX?=
 =?utf-8?B?Rm1zYTd1NS9jMEFWbWZHQ0lYZmo3ZExqQnJmZXNGK1A3TE9YaEJ6b3N3enB2?=
 =?utf-8?B?UXFWelYwUkNlMXdjVnRBcXU5VHJmRzk2K21XMkM2VlhZVTB6Kzl0cTRuL2d5?=
 =?utf-8?B?cUQrc0hlUHp4T1VVR0lmeUgyRE5ZdE5TNm5PeVJSaXpZbU0wWnZTVFIrazl6?=
 =?utf-8?B?Sk53aWVsNG5kSGF5TVp6eXM0L01nOWpJdGJlSXQ3VmJSQk5mL1VwMVBCSUNE?=
 =?utf-8?B?NDgwMDc4eDJDM1VDU2QxUWluUjRuLzRTb212ZEVSZnllRC83aGVkbmUyUk5z?=
 =?utf-8?B?TS85aFBFN0NVdFkvd0doa0JIdThvOWZBRGtNRWlFaHdlNkt3NU5ZVzBkWVpV?=
 =?utf-8?B?V0ZZeDM3NDhUU0V6V0RMWEsvSG1KeHVXYzhnYmIrWUV4cVVuSEYrS3RyWnBr?=
 =?utf-8?B?TFlZOWE4REREVmtEcElwR0YzaHdjbjNSVHdZZU8zV09CM2tBZGQxaW1wcU52?=
 =?utf-8?B?SW5Tbk0xVjdTemJVV3lEeGw1dXUyRk14c24zM2ljOHcva3FhUWlwQkRUQVdp?=
 =?utf-8?B?V085YjBELzZLRGV4MDI4QlhDRGVRcEd3QmhHM2RkOVF5Qis1NUVoTWgyOHBI?=
 =?utf-8?B?S1paZ1RNTG95V2V6MjlzVXEzbDFvelVRNEdKTjNYeGtTUEl0RG10VmhVMm93?=
 =?utf-8?B?Mk1PWDlQRUtlVlRPZ3J4TkEvTTdRQk5SWEJSSXluMUVRM0NpNXZzZ05kWFR2?=
 =?utf-8?B?VFJaM0h0Zm8rRngvZllFays1OFR5dGd0Y1ZzM1dVc2Y2UFltVCswdXZCUHZ2?=
 =?utf-8?B?aFZZTCt4eGYzMGtvN2kzVGtPWDh0eDNmL2dSNm9sVW5UM2VCNXA4bzg2Z2pB?=
 =?utf-8?B?WkxiVng1K2ppVUNKbFQ3STFzZjlLTVNmTHB1Q0Fad1RSM2FnZWtQenR1dklK?=
 =?utf-8?B?YlFGZ2RPKzA2N2VwaEJ6WmRob1ZnMWVkYmdoOVdwbHJGYnFqRDcrS0NWSmR1?=
 =?utf-8?B?a2NsTkxjcG1GWFdtcHlPTkVBeGtpNTZSUU9qN0RWaDJqeEM2VnBnTkRabGxM?=
 =?utf-8?B?c2xZajFRSUJSWDdUeFZqVHpKSW1iUUpCeFB5RFdPSEhqYmEzenphQndsR0Ni?=
 =?utf-8?B?UkQ4a1ZqbWlzY241Z0RWQ0UyRHdpWnAyZWl4TDBMalR0WGMzMFErS0NLOXJ3?=
 =?utf-8?B?TVVHeWZvYklGSlp1MDJ4aTZISjhPcEtRZ2U3RHhnVEM1YXowZ1hBLy9XMTVJ?=
 =?utf-8?B?ZXpjNjc2RzJpV0lGUHJTQ3Njc1hzZkJwSTd5VVBtOXdwMVI0YlRDNUQ1a0Vy?=
 =?utf-8?B?V1NTVHRZN3oycjZzK0x1OXdFSzRSREsvNnl4WXNYdG1GcVpvTWlNbmlucGs1?=
 =?utf-8?B?R2p2YmlMclBMT0dPVVlTckY2SXpJcFNMNFpvb2RLRng2dldrY0lCS1NaeVhY?=
 =?utf-8?B?K1prQkk0TE45MFBjWGxpaFVDbm5uU2ZNUWgrREZaOGo1ekN2N0l3amZaMk02?=
 =?utf-8?B?Nk1QRjM4T0g3MDhOS0FwbWx3YVZMTWVGdVN2NUR1aXp3UDhpbTNhVGZ5SE9n?=
 =?utf-8?B?R01wVE1tbDNTZjQ2dWtPaWJyQ1J5WnAzUjZ2OTZoN043N1RGVGxjVmUySGlT?=
 =?utf-8?B?Q2laZlhTYnF1cDJZY3JwRzdnSjhWYjhQZmM1Q1Y0elJDS0s0M2FzbzlxTTV2?=
 =?utf-8?B?dGNBbVdtZmtPWWFxNm1Ra3kxZGhpYmRZNDI0eS9UYTF5dDVVWGN2K2dsMS9D?=
 =?utf-8?B?bkN4VEZ5ZERHbzdlMUNBUU5WUGFXdjBsQ2taM2lja0JmVldmUHZKejVmeVFP?=
 =?utf-8?B?U09vQ3NDbHNnMjhJMUFwdUlZaEZxTSswS0NTNTlxMmJOclFZVW1NeU05b3VZ?=
 =?utf-8?B?RXNqM0VrMjJQM3hOK2N0RzJ6bzFmaERaSWpjdUpNZyt2NjU2VFc2RHZlTzJr?=
 =?utf-8?B?RUc5VXZQdUU3UHpsVU5wMkVSL0RnMUYzdGxpR3N0amM0Wk96NzVUQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EBFC7F80A129AA4FBFA8B3C8E0F3486F@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KPNnkQBewfcugpp+DXr0JItPtjuaNaYP6m+SO5GIcufv4dkKTEbMpmI0PX52y8bjRMtd8WfkyoKdAuP5TkhMCJFgZmMccRRqR37eeJtAzFmmixFI7cT5YFMknRBCzBbXayAJ0323h1ZLQ7NQ0+Wen//PoELpU38y9sb17SAiZ0dQnDRO/PkW1EUowaUFyeVQQrbLQLwmL1NUSG2TLyXgEW0FDNndVNjDsXOAc4DiDtAr6xB5e/oK+7/My55O528ZzOYGPrrcEMVwu1G4WD2c4xyPkDPzDKPdhKLV4JXSkhTR+VHO0fHsy4F05fntpY4hXxEU6VPjEXHYrPBsMBtBwg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6396.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26c59a57-afe8-476d-e618-08df2b4e02c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 06:23:36.3467
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /lLnMu9adw4kdF6TzSlbTr3AZZhT+JYzN4cK3vCZnfXkBZp3ovcHm2alyspnVDckDCV1aJoepQ2ZtBC+hUY4XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8471
X-MTK: N

T24gTW9uLCAyMDI2LTEwLTEyIGF0IDExOjMzICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiBTYXQsIE9jdCAxMCwgMjAyNiBhdCAwNDowNzoxM1BNICswODAwLCBLeXJpZSBX
dSB3cm90ZToNCj4gPiBDb21wYXJlZCB0byB0aGUgcHJldmlvdXMgZ2VuZXJhdGlvbiBJQywgdGhl
IE1UODE5NiB1c2VzIFNNTVUNCj4gPiBpbnN0ZWFkIG9mIElPTU1VIGFuZCBzdXBwb3J0cyBmZWF0
dXJlcyBzdWNoIGFzIGR5bmFtaWMgdm9sdGFnZQ0KPiA+IGFuZCBmcmVxdWVuY3kgc2NhbGluZy4g
VGhlcmVmb3JlLCBhZGQgIm1lZGlhdGVrLG10ODE5Ni1qcGdkZWMiDQo+ID4gY29tcGF0aWJsZSB0
byB0aGUgYmluZGluZyBkb2N1bWVudC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLeXJpZSBX
dSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+ID4gUmV2aWV3ZWQtYnk6
IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vDQo+ID4gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVn
bm9AY29sbGFib3JhLmNvbT4NCj4gDQo+IFNvIHRoaXMgaGFzIHN1YmplY3QgIm1lZGlhOiBkdC1i
aW5kaW5nczoiIGJ1dCBhIG5ldyBwYXRjaCB5b3UgYWRkZWQNCj4gaGVyZQ0KPiBoYXMgY29tcGxl
dGVseSBkaWZmZXJlbnQgc3ViamVjdCBwcmVmaXguIEluY2x1ZGluZyB0aGUgcmUtaW50cm9kdWNl
ZA0KPiBuaXQsIEkgYW0gc3VyZSBJIGFscmVhZHkgYXNrZWQgeW91Lg0KPiANCj4gQSBuaXQsIHN1
YmplY3Q6IGRyb3Agc2Vjb25kL2xhc3QsIHJlZHVuZGFudCAiYmluZGluZ3MiLiBUaGUNCj4gImR0
LWJpbmRpbmdzIiBwcmVmaXggaXMgYWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhlc2UgYXJlIGJpbmRp
bmdzLg0KPiBTZWUgYWxzbzoNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y3LjEtcmM3L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLnJzdCpMMjNfXztJdyEhQ1RSTktB
OXdNZzBBUmJ3IWhfZmtuemJQODc1M05GU19PMmU0Z3NzRjJPa3Ntc0dYOHdtVzdCQVNNNjFaSFpj
NGVkRXNnakVlMVB4SFdIcmlvOEtKakN6ZUhtU2c4dyQNCj4gwqANCj4gDQo+IFRoaXMgaXMgcmFu
ZG9tIHdheSBvZiBjb2RpbmcsIG5vdCBldmVuIGNoZWNraW5nIHlvdXIgZ2l0IGhpc3RvcnkNCj4g
YmVmb3JlDQo+IHNlbmRpbmcgdG8gbGlzdHMuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0KPiANCkhpIEtyenlzenRvZiwNCg0KWW91IGFyZSByaWdodC4gSSBtaXNzZWQgdGhlIGlu
Y29uc2lzdGVudCBzdWJqZWN0IHByZWZpeCBhbmQgcmVwZWF0ZWQNCnRoZQ0KcmVkdW5kYW50ICJi
aW5kaW5ncyIgd29yZGluZyB3aGVuIHByZXBhcmluZyB2MTguDQpJbiB2MTksIEkgd2lsbCBjaGFu
Z2UgdGhlIFNNTVUgcGF0Y2ggc3ViamVjdCB0bzoNCiAgZHQtYmluZGluZ3M6IHNvYzogbWVkaWF0
ZWs6IEFkZCBNVDgxOTYgSlBFRyBTTU1VDQpJIHdpbGwgYWxzbyByZWNoZWNrIHRoZSBkZWNvZGVy
IGFuZCBlbmNvZGVyIGJpbmRpbmcgc3ViamVjdHMgYWdhaW5zdA0Kc3VibWl0dGluZy1wYXRjaGVz
LnJzdCBmb3IgY29uc2lzdGVuY3kuDQpTb3JyeSBmb3IgdGhlIG92ZXJzaWdodCwgYW5kIHRoYW5r
IHlvdSBmb3IgcG9pbnRpbmcgaXQgb3V0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpLeXJpZQ0KDQo=
