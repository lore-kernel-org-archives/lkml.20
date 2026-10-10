Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9838E8A1;
	Sat, 10 Oct 2026 06:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613819; cv=fail; b=VzESN+zMs/dWAsOUW7iBlcZwu8Y63vEvpBY3nq1OOw5XFQRNRTwPr6ie2tVskD3q/XTsJNYPVpnFJeP035AQlJxMBPB3+htHFgplFNwkFLaUAQDHzfYcrAr0LQA5+Xm2+8UUhJ4Rhwx/H+yoseo4oFcj5XuiKJ/Sd38MGGUdU/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613819; c=relaxed/simple;
	bh=meAPCKNbBJ8yYVsm68jqbQdyJfPreCLFq0Y55rmq8cE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dM5ebDC0nml0POnV5OGyjB4Rf50ziuJwXpMdhSbW8DUQP/xHbCVET8YwKuOaO4rwDgtCy4KiYdUvA2xnqvlZMWTQc7t2ikRRmOvIBzre5yiT86grR5LO6OjpCztK2ZP25UYt4MJ/7snZV247A7BNA+Lj4SxO5QrqYg4ZX88lZtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=nWlTf5Bv; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=VSip2gpY; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nWlTf5Bv";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="VSip2gpY"
X-UUID: 0bbcdc02c47411f1b1788b6acf885367-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=meAPCKNbBJ8yYVsm68jqbQdyJfPreCLFq0Y55rmq8cE=;
	b=nWlTf5BvKvNhvvLR489nmwbgEugpt6E5XpGk4s99r62jREgPNlUAWYXjWm4OBrZarxNCogvcI0in8O5ERFr8hfXvENRe4CZUxGuLWdntQw/KOKVHlZnRrD/Xzgn13feeTLkD3bKUTKpaihYCPqVPYZbSPIwnksOHsau4RbEZlj8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:a70b915e-c951-4933-a370-ac5a877111d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:fff32d95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 0bbcdc02c47411f1b1788b6acf885367-20261010
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1706474426; Sat, 10 Oct 2026 14:30:11 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 14:30:10 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 14:30:10 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=olKqRy+vz7xB6+KzzRxn3HQuRZX6I9OrEzvB8iI4s2ReahMtEGfrn0mCXhFgMhuODR6BZHVKueAgkKiUATGD6LtlI6Ean+IUcafjQpT8y82H2vjy6tu2AJ2OB3T7hD/2vqaovbUPKI4XuTTHznGv/1b9uClCfcVvGmDJdWvGcPECR2U/+CTMFjqs1IKS7dvhwpsj8s3K0wsk4mY+E4RiJuY1uBz7zAUjaJqym7NKtDi4IVwGWjh+4ai3TFvdmYH1eOA5hD4SHKQekb/Qb+UIPEKQi/Net7Ju1kNo9SKLCheLVi1ex8UMUSZ0Y23Uor1KnF/rsjpEIhqQ/eSlgkJ4Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meAPCKNbBJ8yYVsm68jqbQdyJfPreCLFq0Y55rmq8cE=;
 b=a1S1Y94Qbd/69KxoxYZwZZOl5yVIV2CwvD9LQGE5rZH7Axm9mx9Qg0hcnxGH4Ti5SEduC9VU2dmCGpDpGggeXhhiFokKPeN1/+KP8UdaG3G4SZ4pegsvTWtmNm4RpaxRStezQZEslpczUmQdgcYlrz9nakLrwcu6K09dVklkVjswVUU6Q85WMjxaA4G+vmqXkR6rI/7b+7b4WjGLJoMt+X4FLGo1HES4TNOEHECl3Fmv2/bChNk46fiXgCv9uYhHjRVjPP1Snuj3wslfPpyivRuzKSdAQBBNWmN2DPrsIGVlPwkhsW/h1/Sq940NhY9X/U+H5jFfrNjy1xDjYz7aIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meAPCKNbBJ8yYVsm68jqbQdyJfPreCLFq0Y55rmq8cE=;
 b=VSip2gpYGrq1mYfscz9lhdgLdTMlwY8+9CsXqhbqmiFvPgjo0+m3W9jYH+ACWEIIrd2JO11/dZk2TY0pL0a/OGCD2+21ulY0d9ufGINvoNYIKPXOXnEPZnJMQnWZVaoAIcnWmEdsY++afksA6QywHsFHA6px6FfDbn/Ge/FkoSg=
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com (2603:1096:301:a3::12)
 by SE3PR03MB10390.apcprd03.prod.outlook.com (2603:1096:101:31f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Sat, 10 Oct
 2026 06:30:04 +0000
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1]) by PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1%3]) with mapi id 15.21.0496.018; Sat, 10 Oct 2026
 06:30:04 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "nicolas.dufresne@collabora.com"
	<nicolas.dufresne@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?QmluIExpdSAo5YiY5b2sKQ==?= <bin.liu@mediatek.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"hverkuil@kernel.org" <hverkuil@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v17 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
Thread-Topic: [PATCH v17 12/12] media: mediatek: jpeg: add jpeg smmu sid
 setting
Thread-Index: AQHdSnMLijBgO3M5gE+SE6ocKYvSrbbaeUKAgBvzaIA=
Date: Sat, 10 Oct 2026 06:30:04 +0000
Message-ID: <90b0c464dce264b71f1a94fa2f5ea025a8a35c56.camel@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
	 <20260922091530.241762-13-kyrie.wu@mediatek.com>
	 <32d02591-406b-4460-9a87-ec1f883f3b2c@collabora.com>
In-Reply-To: <32d02591-406b-4460-9a87-ec1f883f3b2c@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6396:EE_|SE3PR03MB10390:EE_
x-ms-office365-filtering-correlation-id: 5d894202-e4ee-45a8-c081-08df2697eb99
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|366016|1800799024|261009223027099003|921020|38070700021|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info: 77MHJzIqL8RMWbiUIbXjQr342yOhdZLN1qLxB4u0z6lgaCXM/sru/2kCddKfCdznGeZVFH6vu42wPojF8TITcocQaAQzOvIc02K+coRrvuUptXQzNwJi/sErLtJtKdaqVMv/f7Q025z9LEsYQMJ3xPzqlkaOEt9A3knFGGmErdNXb0qosM1MPhRGzOkBx4BLUct+QIh/wdQ4NG12kdpivXUkAeA4zM3Cw+itIFRO2xm1e4aquN28QhqeeLgMDx3kJA1giy2AtckYgI7M48DxFP7RpUbvUs/gPdDxpkxaquyYP1JxJJgUnEkcTV4a89l2w8NqGYSiBcVJslRgWoOVjKt8hGCTqJwYF3wy5sNM19ibAyNk8b50cGZsjUU/inG4sVOmb3HIERxlQpiaspN8FMKb1WRaQCTYq2Bm98hqjViEQ1Xt3AfkdrCOLcHZtsQZLfH3JCXUFQwleAQ9WaRfg6z9EHN1aXR9S93Iq5eDv9hvgC2RI/w3sZjQ14fAB4wtCrP4Bab6LYIqpkVxE6/U2mQUooeQNp5bF1OG1JtauzNjfJZyk0AC5F+EkRWb4GCePhqjk9hiLc7O54J9MZh+FzZpKQe4sBTAF13sf+T4ikCNXlhAfI/tF47agIJq5jooXB+Kw4WAhPLnYGBq0xCgSGIZSN2+v47HaHbmd/UOUmA5ky8rmddfy56jdcYxa6VoPII9xUIAp8fdDuYpzNbH2wDBfEJuiKwUub1S33SNO27UOc9a0EXtzky8nXme1v58
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6396.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(366016)(1800799024)(261009223027099003)(921020)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c2V5anUxQnB4dnNPbi81Vlo5YmNKdkJZVzZSUlk1N2IyYkt4cnQzb00zbmVV?=
 =?utf-8?B?VVUwdWF3cDdXM0xML0JwNE00ZlBIajRlWHZuL3A2NVg1N3BTY0R5WitWVTF2?=
 =?utf-8?B?OFFCVGh3SVV5YksvTnVCc3I3VTIveHdlbHlBU0NSdzgxZDUxbnhTZUF3TWph?=
 =?utf-8?B?cHl0NFJHSTFqYUJSRUNMM2w1MDNWNnlzbEJZYzh4Y0YzWEJjSkZRaGlFZW81?=
 =?utf-8?B?SkhVd1FKdXRBUHJsVDl6NnVqa1pKeVVMcGlRcndjeERkVjNCUkQySHhoWEtV?=
 =?utf-8?B?SW5DeFNhK0tpM0JjWTJkT1paRXFBOXYxV0M3ejdwRk9FQ1VPQ0h4LzJQVGgy?=
 =?utf-8?B?NFErT1lMMDJrak5ncHZlcEtZZkYzRFAzZnUzR0ZFWWVWbWgrb1ZlM3NzUnRE?=
 =?utf-8?B?cG1pcmVITUdYTVRXRUpXVUQ4MTZkZERjYUFNUVBKcHJaMENDK0M5Z0hkUFJv?=
 =?utf-8?B?L1lLZmJiMktCT25XZ1JyV0s5SDhPUFY5cVVscnA1QWhWUVpJSFVDM2djcVhS?=
 =?utf-8?B?MXJyekVuS0dTaVp2RDhiOGxoMEtrQkMvekgwaUt1eDFLVVExbWNYV2R5dGpL?=
 =?utf-8?B?dlhnOG9mUzR3ZDkvSzJ0bzJTcGh1RGRLNU81Ui9CSks1amZ3MnIxbnpaUFQx?=
 =?utf-8?B?U2J4a20xbkc1SFdlTlhIOWdxY29rd2VqNnY3QlArZkdFNXI5alhjczBPaEhk?=
 =?utf-8?B?MmZOVU9OQnowTmFxVE9hcThxbTZpbEMxUXhod2ZyMG8wR1JFZ3czdkw1OVRL?=
 =?utf-8?B?a2cvSVdFand5WVl2Q095Tmg3cGVCc0tJZlgvcnExdzNYWnVkNnNHSXBNeWg5?=
 =?utf-8?B?QkR6bUNBTnEwNGU2MmdtMkd5UFBYK1h3cVJPYWwyUDM5YlQyeFFZVUZsL1l5?=
 =?utf-8?B?bXhLNjJQODFRUFZBc2kxK012R096bDgvUWRYQVpRNWkxVG4zSStnWGNqMlUx?=
 =?utf-8?B?RUgvUkovN0hEanlUSEM0Q0wweFRkQ3NjQzF0UjJ3YlpCVXhXczRaRzdpSWRN?=
 =?utf-8?B?VGdiUEV4Y3c3d2xTbTBzTkFYOHduMlJoejlCSVNta1o3K1VHbHpwbk1iaC9m?=
 =?utf-8?B?c0g0aktVbWtOVTdVTHhReWtpWjhRTFhSMkh6OThyYnVrMXYreFdyVjdGS3d0?=
 =?utf-8?B?WnEzcDZuc2hiNFlsWW4wQnV4NVh3YnZKN1FmRC9oS3lxeFVpSjhNS0p5N0Z0?=
 =?utf-8?B?Q1JqazhNU3NyVnAvdWNNT0FaZkhIRGY2L0FkeUczVERibnB5WGd0S0MxNThk?=
 =?utf-8?B?QzJobWxvRGVHMDkxUTZFUzBJSEtlVmRLeGhEaGpxT1VrMFZUUkhFN2VCRmFG?=
 =?utf-8?B?dlhnK0huc251WE1iU2VLenpmcjQwajNLVmpndWQrOTZYVWpaQmNlcjlFamdu?=
 =?utf-8?B?NXlUbXZSU3ZZNWx6UXdGSG9xTmR0a2h0OS9IaGlxcGNnZnlKODFBSTN5T2ha?=
 =?utf-8?B?VVBiRXBDMXpNcmJwYjlGUFdYanNrMjZ3Q05yOEVpTXhuUVQwcTkxWkw3VDNx?=
 =?utf-8?B?aWFmYWZvckpTNXhyL0MwN0ZON1lvV09WOEFLM1VMek8wVGpKZVZ4c0hOeW4w?=
 =?utf-8?B?YmZ0dEw1QzdnNHZWeEcxaGtKVHhWdC85WXRSUnhaalZ2UWxRV1psSHF4enNo?=
 =?utf-8?B?Q1VGbnNrenhmc3lSZ0xoUnNKcmozSW90S2RPZU9QREsyd1l4Qit6N3FHbDFn?=
 =?utf-8?B?N1BLUjVScVlpajJOdzhTaGI2Y3hQR2o0ZlFCMmkyY25tZDByQWtVbHJGbGxZ?=
 =?utf-8?B?YVg2YWNDc1BSekNLWHVKQlp6d1VmNFRNa05DVENJUld1S2VyTlNXL1pjVEVW?=
 =?utf-8?B?N0tnZ3hDWnd3QmViL2Q2Z2V6bU1ET1k0UWxiTXc1VkRQdmhHUXEvNGt3a3VV?=
 =?utf-8?B?OGVSclFxNGlSaG5hWkNneUE2ZTlES1ZEUGI5eVl2MHFrTFhEN1NNa3FKdzBv?=
 =?utf-8?B?UWlqWFlEK0NmUjBYTG5IcEZ6YkJXU1pyRW5NaitIOFQrSHVJNCtuZHNFaStP?=
 =?utf-8?B?WngxWWdWdWZZSWxUTk1WUmpwdGFGcUFZRjR3TXRjdUU5VFFOWTlzVXFSZEc2?=
 =?utf-8?B?Y2JnclNRcmJSQzQ4RmZpRjRFZlZIZW5HZ2RlUUtUTUdWMXF2SEVXcWhlRGhK?=
 =?utf-8?B?eEhpOUhFVit3RkM3Rnl4Y3Q2bFNIZmt2dW9CWmxoMTZuK3VCeG5oNFVWMWVM?=
 =?utf-8?B?U0hJUE9COTJsU3FZUDIzaFJqUFBlN2h0SjB4WUFDNkw5M0FoT1B5N0MvUFJ3?=
 =?utf-8?B?VVhvQld0ZjBMUGhUcjF1WXNvYTNNNHVQSnZBOUxDNmVSdis3Q1NtSklzMEZT?=
 =?utf-8?B?VjAyVE1YNFhXcG13OHlNcWtUa0E1Mm5zcjFMZllSWnpRVXlPSEx4dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59926A1F9FF3BE4485F1F1572D1776DC@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: rnGDobTDcyF0YP7lqe48qUj6jok9ZgyYRa8kLwnUSb0MEQ51eDES4gYHLbIom++DcecxYmBFUhpVdSampnWmxGF7CdlbakCLXA9pbT3tSK0dzGdiXmW2kB+ezt3O9QBKE42qsRByAwC7+esxdrGJYkBlSlN8rjsu3lFtRdH252nTcCjdERPUdkNA7qd/Uar+dDWEJLsJoLaeD88l6OhvBu+5Dtxdb6feBU/VLwLhAYOh1Pu6b3Eqw7GYP+9cc8yfMnpQ476ZU5aTACrNaZCMPIjw4/41dvGG7B4/YVoDFj5PM/OMV9WLZ390RmFB4hKY1u8SGE++GZHWcmQw6I/6KQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6396.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d894202-e4ee-45a8-c081-08df2697eb99
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 06:30:04.4296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sYWricFA6E/2mGzHrEF3chR+zu+b0cAwN/Mp6eZIkHbkNx1z5fieK4I3uwwmfGb/XB3StsqD6sxpIickYyTjkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB10390
X-MTK: N

T24gVHVlLCAyMDI2LTA5LTIyIGF0IDEzOjM5ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gT24gOS8yMi8yNiAxMToxNSwgS3lyaWUgV3Ugd3JvdGU6DQo+ID4gQWRk
IGEgY29uZmlndXJhdGlvbiB0byBzZXQganBlZyBkZWMgJiBlbmMgc21tdSBzaWQNCj4gPiANCj4g
PiBTaWduZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IFJl
dmlld2VkLWJ5OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1ZnJlc25lQGNvbGxhYm9yYS5j
b20+DQo+ID4gLS0tDQo+ID4gwqAgLi4uL3BsYXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdf
Y29yZS5jwqDCoMKgIHwgMjkNCj4gPiArKysrKysrKysrKysrKysrKysrDQo+ID4gwqAgLi4uL3Bs
YXRmb3JtL21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfY29yZS5owqDCoMKgIHwgMTUgKysrKysrKysr
Kw0KPiA+IMKgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2RlY19ody5jwqAg
fCAyMw0KPiA+ICsrKysrKysrKysrKysrKw0KPiA+IMKgIC4uLi9wbGF0Zm9ybS9tZWRpYXRlay9q
cGVnL210a19qcGVnX2VuY19ody5jwqAgfCAyMw0KPiA+ICsrKysrKysrKysrKysrKw0KPiA+IMKg
IDQgZmlsZXMgY2hhbmdlZCwgOTAgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiANCj4gLi5zbmlwLi4N
Cj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBl
Zy9tdGtfanBlZ19kZWNfaHcuYw0KPiA+IGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay9qcGVnL210a19qcGVnX2RlY19ody5jDQo+ID4gaW5kZXggMDc0NTIyNDliLi4zMDU4ZmRmNGYg
MTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210
a19qcGVnX2RlY19ody5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRpYXRl
ay9qcGVnL210a19qcGVnX2RlY19ody5jDQo+ID4gQEAgLTYxMyw2ICs2MTMsMjUgQEAgc3RhdGlj
IGludCBtdGtfanBlZ2RlY19od19pbml0X2lycShzdHJ1Y3QNCj4gPiBtdGtfanBlZ2RlY19jb21w
X2RldiAqZGV2KQ0KPiA+IMKgwqAJcmV0dXJuIDA7DQo+ID4gwqAgfQ0KPiA+IMKgIA0KPiA+ICtz
dGF0aWMgaW50IG10a19qcGVnZGVjX3NtbXVfaW5pdChzdHJ1Y3QgbXRrX2pwZWdkZWNfY29tcF9k
ZXYgKmRldikNCj4gPiArew0KPiA+ICsJc3RydWN0IG10a19qcGVnX2RldiAqbWFzdGVyX2RldiA9
IGRldi0+bWFzdGVyX2RldjsNCj4gPiArDQo+ID4gKwlpZiAoIW1hc3Rlcl9kZXYtPnZhcmlhbnQt
PnN1cHBvcnRfc21tdSkNCj4gPiArCQlyZXR1cm4gMDsNCj4gPiArDQo+ID4gKwlkZXYtPnNtbXVf
cmVnbWFwID0NCj4gPiArCQlzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKGRldi0+cGxh
dF9kZXYtDQo+ID4gPmRldi5vZl9ub2RlLA0KPiA+ICsJCQkJCQkibWVkaWF0ZWssc21tdS0NCj4g
PiBjb25maWciKTsNCj4gDQo+IFdoZXJlIGlzIHRoaXMgcHJvcGVydHkgYmVpbmcgaW50cm9kdWNl
ZD8gSSBkb24ndCBzZWUgYW55IGJpbmRpbmcNCj4gY2hhbmdlIGZvciB0aGlzLg0KPiANCj4gQmVz
aWRlcywgaXMgc21tdS1jb25maWcgaW4gdGhlIG11bHRpbWVkaWEgc21tdSBpb3NwYWNlPw0KPiBU
aGF0J2QgYmUgd3JvbmcgYW5kIHdvdWxkbid0IHJlYWxseSB3b3JrLg0KPiANCj4gQ2hlZXJzLA0K
PiBBbmdlbG8NCg0KRGVhciBBbmdlbG8sDQoNClRoYW5rcyBmb3IgdGhlIHF1ZXN0aW9uLiBJbiB0
aGUgTVQ4MTk2IERUUywgdGhlIEpQRUcgZGVjb2RlciBhbmQNCmVuY29kZXIgSFcgbm9kZXMgc2V0
IG1lZGlhdGVrLHNtbXUtY29uZmlnIHRvICZqcGVnX3NtbXVYLg0KVGhhdCBsYWJlbCByZWZlcnMg
dG8gYSBzeXNjb24gY29tcGF0aWJsZSB3aXRoIG1lZGlhdGVrLG10ODE5Ni1qcGVnLXNtbXUNCmF0
IDB4MzhkMDAwMCAoc2l6ZSA+IDB4MTAwMCkuDQpUaGUgSlBFRyBpb21tdXMgZW50cmllcyBzZXBh
cmF0ZWx5IHBvaW50IHRvICZtbV9zbW11LCBzbyB0aGUgR1VTRVJfSUQNCndyaXRlcyB0YXJnZXQg
dGhlIGRlZGljYXRlZCBKUEVHIFNNTVUgY29uZmlndXJhdGlvbiByZWdpc3RlcnMsDQpub3QgdGhl
IG11bHRpbWVkaWEgU01NVSBJL08gc3BhY2UuIEkgd2lsbCBhZGQgdGhlIG1pc3NpbmcgcHJvcGVy
dHkgYW5kDQpzeXNjb24gYmluZGluZ3MuDQoNClJlYWdyZHMsDQpLeXJpZQ0KDQo+IA0KPiA+ICsJ
aWYgKElTX0VSUihkZXYtPnNtbXVfcmVnbWFwKSkgew0KPiA+ICsJCXJldHVybiBkZXZfZXJyX3By
b2JlKGRldi0+ZGV2LCBQVFJfRVJSKGRldi0NCj4gPiA+c21tdV9yZWdtYXApLA0KPiA+ICsJCQkJ
wqDCoMKgwqAgIm1tYXAgc21tdV9iYXNlDQo+ID4gZmFpbGVkKCVwZSlcbiIsDQo+ID4gKwkJCQnC
oMKgwqDCoCBkZXYtPnNtbXVfcmVnbWFwKTsNCj4gPiArCX0NCj4gPiArDQo+ID4gKwlyZXR1cm4g
MDsNCj4gPiArfQ0KPiA+ICsNCj4gPiDCoCBzdGF0aWMgaW50IG10a19qcGVnZGVjX2h3X3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gwqAgew0KPiA+IMKgwqAJc3RydWN0
IG10a19qcGVnZGVjX2NsayAqanBlZ2RlY19jbGs7DQo+ID4gQEAgLTY2NSw2ICs2ODQsMTAgQEAg
c3RhdGljIGludCBtdGtfanBlZ2RlY19od19wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpDQo+ID4gwqDCoAltYXN0ZXJfZGV2LT5yZWdfZGVjYmFzZVtpXSA9IGRldi0+cmVn
X2Jhc2U7DQo+ID4gwqDCoAlkZXYtPm1hc3Rlcl9kZXYgPSBtYXN0ZXJfZGV2Ow0KPiA+IMKgIA0K
PiA+ICsJcmV0ID0gbXRrX2pwZWdkZWNfc21tdV9pbml0KGRldik7DQo+ID4gKwlpZiAocmV0KQ0K
PiA+ICsJCXJldHVybiByZXQ7DQo+ID4gKw0KPiA+IMKgwqAJcGxhdGZvcm1fc2V0X2RydmRhdGEo
cGRldiwgZGV2KTsNCj4gPiDCoMKgCXBtX3J1bnRpbWVfZW5hYmxlKCZwZGV2LT5kZXYpOw0KPiA+
IMKgIA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL2pw
ZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19lbmNfaHcuYw0KPiA+IGluZGV4IGM3OTU0YWYwZS4uNTA2YTQ5ZDFh
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9t
dGtfanBlZ19lbmNfaHcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVkaWF0
ZWsvanBlZy9tdGtfanBlZ19lbmNfaHcuYw0KPiA+IEBAIC0zMzgsNiArMzM4LDI1IEBAIHN0YXRp
YyBpbnQgbXRrX2pwZWdlbmNfaHdfaW5pdF9pcnEoc3RydWN0DQo+ID4gbXRrX2pwZWdlbmNfY29t
cF9kZXYgKmRldikNCj4gPiDCoMKgCXJldHVybiAwOw0KPiA+IMKgIH0NCj4gPiDCoCANCj4gPiAr
c3RhdGljIGludCBtdGtfanBlZ2VuY19zbW11X2luaXQoc3RydWN0IG10a19qcGVnZW5jX2NvbXBf
ZGV2ICpkZXYpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfanBlZ19kZXYgKm1hc3Rlcl9kZXYg
PSBkZXYtPm1hc3Rlcl9kZXY7DQo+ID4gKw0KPiA+ICsJaWYgKCFtYXN0ZXJfZGV2LT52YXJpYW50
LT5zdXBwb3J0X3NtbXUpDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsJZGV2LT5zbW11
X3JlZ21hcCA9DQo+ID4gKwkJc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfcGhhbmRsZShkZXYtPnBs
YXRfZGV2LQ0KPiA+ID5kZXYub2Zfbm9kZSwNCj4gPiArCQkJCQkJIm1lZGlhdGVrLHNtbXUtDQo+
ID4gY29uZmlnIik7DQo+ID4gKwlpZiAoSVNfRVJSKGRldi0+c21tdV9yZWdtYXApKSB7DQo+ID4g
KwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LT5kZXYsIFBUUl9FUlIoZGV2LQ0KPiA+ID5zbW11
X3JlZ21hcCksDQo+ID4gKwkJCQnCoMKgwqDCoCAibW1hcCBzbW11X2Jhc2UNCj4gPiBmYWlsZWQo
JXBlKVxuIiwNCj4gPiArCQkJCcKgwqDCoMKgIGRldi0+c21tdV9yZWdtYXApOw0KPiA+ICsJfQ0K
PiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+IMKgIHN0YXRpYyBpbnQg
bXRrX2pwZWdlbmNfaHdfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiDC
oCB7DQo+ID4gwqDCoAlzdHJ1Y3QgbXRrX2pwZWdlbmNfY2xrICpqcGVnZW5jX2NsazsNCj4gPiBA
QCAtMzg4LDYgKzQwNywxMCBAQCBzdGF0aWMgaW50IG10a19qcGVnZW5jX2h3X3Byb2JlKHN0cnVj
dA0KPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiDCoMKgCW1hc3Rlcl9kZXYtPnJlZ19l
bmNiYXNlW2ldID0gZGV2LT5yZWdfYmFzZTsNCj4gPiDCoMKgCWRldi0+bWFzdGVyX2RldiA9IG1h
c3Rlcl9kZXY7DQo+ID4gwqAgDQo+ID4gKwlyZXQgPSBtdGtfanBlZ2VuY19zbW11X2luaXQoZGV2
KTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gwqDCoAlw
bGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBkZXYpOw0KPiA+IMKgwqAJcG1fcnVudGltZV9lbmFi
bGUoJnBkZXYtPmRldik7DQo+ID4gwqAgDQoNCg==
