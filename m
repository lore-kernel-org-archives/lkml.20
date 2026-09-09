Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E841314B8F;
	Wed,  9 Sep 2026 06:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934610; cv=fail; b=MHxi94rQR54oUGzNyfrTUro/+z4GyOSyhU6hez+p4yzlPV2JcklD+9W2i8gfcud0DHrKDPaAAxjNw3jy8q+RU5/ff3PXuD/7aB6Xx3d1ly8r86DUFzWFfRuIodIu47+ZxAj1PYhpCgdYwZx74PqQUguLGHdllpt0gJVATYRgZBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934610; c=relaxed/simple;
	bh=t7/dCfxNJRvWHhtV0pq4mJPMTtGBRxNXo1El/nz3lNQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Mmf6O6WnRf9B9RhMKH0Bgkblu3VSPR9kxnXkuovEfcmz7O6ehFlXNMTM6AOpcoZ/UOIe9MRFoNG+GCtVEZZcxjI4fZJdu+Hm9alfQciKqYe6SQb3LNXlhR9VpijdqAi3NqJ4Pg6/eKcaA4PnJhtQRtOllJu6W5o50WAMhDr5rAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dcR7tgdA; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=MwlbN/NK; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dcR7tgdA";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="MwlbN/NK"
X-UUID: 02f5a28cac1611f1b1788b6acf885367-20260909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=t7/dCfxNJRvWHhtV0pq4mJPMTtGBRxNXo1El/nz3lNQ=;
	b=dcR7tgdA3MLCGgC33R1Ik031yhDBppquQPhaI2tusSkBAb4wFMKddJkGsUNt4BUpw33WUnBXTAcm3DKEBE7KniCVAp9d5dxV29Xx6GYyb+exZ0d6D0dwF8fhmuZzSz/C+2HvcREMVqwtrn6OsZWkAJNHEZPT2dwziwAtn+zYfgE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ac83bf51-c8b4-43a1-9311-909ba71c2f7d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:95101428-9ebf-4787-bb42-3cd26eee85aa,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|136|836|865|888|898,TC
	:-5,Content:0|15|50|99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:
	nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC
	:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 02f5a28cac1611f1b1788b6acf885367-20260909
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1932070337; Wed, 09 Sep 2026 14:16:36 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 9 Sep 2026 14:16:35 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 9 Sep 2026 14:16:35 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vOw10F618WPjV1Db+Atb8ePlSd4s8um+fSa9JsLOgK1DyKPt/FhdQXaz9v8d6wElaeOkYzetKAw971wiPgdvckyneFNqcaFtbLbyR4eHhTA25tyFUgfLkUHtmJwIsKsQaaoFXoZnY7HvLG98JQUA7NfSLDjvovJgTyHpBZ4avERHypZRJqv/ZkuTxiYelvYK2I+oIvWxqvl+uMAF/4gCQAZxVpqcsVmCFEZXYfn2atGgDdMe7i50Q4smeJl9fzu9EECJ+hyvmlDtK74e5n4ch/hDsNP6nvHnP8JbSliYOjdr5x06Qz0C/GgiA9+NpKpAYRqG2e7eS4v+d2YrvnXYHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7/dCfxNJRvWHhtV0pq4mJPMTtGBRxNXo1El/nz3lNQ=;
 b=FDTF8jktMrOFFaRduJJBlxqeqJuIdXIFlE6nGL4WyQoC47Qimf/PTU1NQSHfnCadZx2kWOj/ZDbr0jyKE4+NbOmTX6kHPEfJfN3NsK+O+3kURukg/MkvCaxbCaVA2A4d3QBRz4E43oFubEDKi3QKn4iufbfpLGYE9hlxv9FE/BV34cNJZTYkUgB3SfVtzSIw5LldLx7hZDZzMmw6aj0Sh8g/aJEJC8FXUBDcyLuZ+v/yg2bpmcblGGEpcUlckfAQ0KSj/WyBFWrX1dMWSEGkayr6EPma9Awiy59WooJ/wvrtG9BL9WBK5Smkh06phKoFEjqAh07dZ9WagDey4o1tAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7/dCfxNJRvWHhtV0pq4mJPMTtGBRxNXo1El/nz3lNQ=;
 b=MwlbN/NKO3n27qJUVrgj20o5EfAEjYOXEGZqqFvyBpErO2NerayNWkdOcaQWlZtToIX1kthCAmHVp9ba7HvXcmehJIwgWa8YEgzRKv94kVg78W2fyrpverHH/io54yhbXf8SkbPCBjX1GwigiEFIB0LiG6Jdh31n2OKhccvWv1w=
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com (2603:1096:4:142::7) by
 SE3PR03MB9436.apcprd03.prod.outlook.com (2603:1096:101:2e8::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.7; Wed, 9 Sep 2026 06:16:32 +0000
Received: from SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dee:7e1:7d2:c310]) by SI2PR03MB5885.apcprd03.prod.outlook.com
 ([fe80::3dee:7e1:7d2:c310%6]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 06:16:32 +0000
From: =?utf-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>
To: "robh@kernel.org" <robh@kernel.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?utf-8?B?Q29uZ2NvbmcgWWFvICjlp5rogarogaop?= <Congcong.Yao@mediatek.com>,
	"krzk@kernel.org" <krzk@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WmhlbmduYW4gQ2hlbiAo6ZmI5b6B5Y2XKQ==?=
	<Zhengnan.Chen@mediatek.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 2/2] memory: mtk-smi: Add MT8189 support
Thread-Topic: [PATCH v4 2/2] memory: mtk-smi: Add MT8189 support
Thread-Index: AQHdORVOS4wXb4yeqke3OIiD/MSeb7bF01iA
Date: Wed, 9 Sep 2026 06:16:32 +0000
Message-ID: <e7f1eef29e6ce08f87b9bc82389a4a51f5d2e9ae.camel@mediatek.com>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
	 <20260831-8189-smi-support-v4-2-8ae66dd3eeed@mediatek.com>
In-Reply-To: <20260831-8189-smi-support-v4-2-8ae66dd3eeed@mediatek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR03MB5885:EE_|SE3PR03MB9436:EE_
x-ms-office365-filtering-correlation-id: c3f68a59-2338-4f6a-cf58-08df0e39e4a5
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|4143699003|56012099006|11063799006|38070700021|10067099003|6133799003|22082099003|18002099003;
x-microsoft-antispam-message-info: drFAgMFlS1zWOmBzxHr8fDNmjoYoPpKzc5Wc3gAjq8oADdFnbxf2n9xU8bmNV3i7EZoG2B1+z0NPa8mcC9QsBbgE0GunM1lJYsblHBhgh5LKHbQwyBqIfSoqc48fOJaI8soqFVpSfgbuWFiMW3KxRfnKt/NK2b5WpM9H9jtOSTKRejzyvWqrBaVR9Om+QqrS0yUXZJGY65oTezD5BE+jD51Yth3RFR4c47gu5MhiFThm0kOke7DPObhE3XWyZiBUBTHFpPdSxXnxR/3cTkLEivW0v/h2XhGkTxON4bhA//WCMNZ7PjTSIMJWG35Pz41iCZkSjHzHgZWaZbNG+QK+XiZ7lq5TbkjJOtTh0296TSFDXWEEZEeU3WPJ6xWZ4Hznq7p2dLn1Pv1pg7/71F8qLwzalCscft5ZAE22PFjJAy83nyPMmEUR3IazEDgwcnTojC3CaOcPEcL9XRq1LYiS5tWsWyA7mJYgZNsiY+c29lo/PC+qMB1BHrwIRYfbTt/ZNFqtSS3qS/eY52jB9dPuVF4JGOLI0nlpSs0Fwdap56A5qfDSwyYypttlPnIKF2WRJRqXNUqPD+ZoPMII/l8Jtp6Lc15wzDx/Q1L4irvsajn51VNmUOZ/1ioAQjiqdStGQU2wWPiC/0n8NhopfdNDjuzpa8ini/F3vkg6RyvcHV3Ru6H5Rw5DI4d3oT3ZUzKAP9iQWmd7vRQ2BQ9Qu/FlAuh4kQ5NUSO19V1vExwUwz8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR03MB5885.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(38070700021)(10067099003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0JpU2RqQ3BuY1NUVG91RXVsTkh3Y3F1bGwvWU1rK2toRXgvVVVJcXpZZUVB?=
 =?utf-8?B?a1d5MWFDU25NKzluU2thcm93OXF2ZmJtbjdiZDdkK1Q3OXJXdWdubHVHU20x?=
 =?utf-8?B?VVV3cDdxc25CNUpZOUVHbmJVTUJQWi9WQTdvdVhLZ0YrNFFrbWNrNHRxOFhT?=
 =?utf-8?B?d09waUdKRUJZc2VqMURQcjJ0ODYwSE9nYlpMOWN6YThUamtEcUdHelAzZWEz?=
 =?utf-8?B?SUpmZW9oY2FVU0pxKzJySEMzNGlsU1N3TUowclhzaTNlbXpkVTIyQ3ZvTHlr?=
 =?utf-8?B?VHVEQS9YdW5tb3RmNDJpc3NCVXRwNzZzMlNvbUhkK0pLUzlEODFtQUxkVDhD?=
 =?utf-8?B?TFFSKzI5NGhjR1AxMDU0SzAyZ3N1YWV4VFRDM3RnNENyZ3RralBGdkx6TjVn?=
 =?utf-8?B?LzZFZm84Qi9EM01wcVFEWkhZVGl3ZHRDR1R5dC85MXZvR2VmWkxnZkFEak50?=
 =?utf-8?B?NVhxeDJoYXhvY3NJc1dWeXpRQUo2MnRTR25zeHYrYlJsQ2dxejlnRkYyOEg1?=
 =?utf-8?B?ZGlTT3pXeVFNT2NEMU9HRDZrc2Mrclgza1ozeENERCt3dEdlNDg4MHB5UEs1?=
 =?utf-8?B?TkFVbVNJcHBBVFA0M1RWSis2K3Y1NWNBZlRaVFp6TU0rUHh2V2owM3djTTZ3?=
 =?utf-8?B?TjN0NTBUNzQ0K1BhMGNINDBuTVlNUHdEUk1uVVRQOSs4eWltcDVXVWNlN1Yz?=
 =?utf-8?B?NitQTVlvQW9nc2pKR2M4a2Z3YmozT1FxeXkydStadzlUa3VMdmhJejZ4b3VB?=
 =?utf-8?B?bEdHT1ArdlJ6QXZTUDhDY29qMkQwQUtKeDNZSVVXQ2x5ZXVNQzJPUXBMNHA1?=
 =?utf-8?B?NmhOc1dZN1doT2d3eldGQ2tSUjJtdU9obzVWTzF6b0VLeGZ0bnhldkEzN2h2?=
 =?utf-8?B?Rnl2eE81a2ZhdTVCaGwwZnJCYjhCRmhhYmVxc1MvbURsVGc2a0NKY01GdmdW?=
 =?utf-8?B?cDJFT2JyTDJwUXZYcUd3UUJPN3lBZWoyUTJuRFFFbXFRY0kwb2ZqQmJXc1VK?=
 =?utf-8?B?VldwYTJaVklkandKT0ZlcjBGb2FJYXVtajJNa3A5cmh1dnZDTHVkWnFXNStY?=
 =?utf-8?B?cFhEbUVtc2Izck9kM1UrKzJtOEowODN0YjlpUVhDbkVMTFJkcGd0T3hkcXU4?=
 =?utf-8?B?WFprUmx3bTdMK1ZadDhxZ1ZQRnA4WlVVR095NjhTK1dWUVYrbVFwQmV0ai9k?=
 =?utf-8?B?SFh3WTRVOTR0WkFoTFRPMTdYSDRYNFJ1QkQ5WE5xemtidmJacEc0b2RhZEd1?=
 =?utf-8?B?WE9aTXNDTm54b1BiQjdMZSt2ZHl0U2tYNkdRNUVBckkwWTQrY05IcU05UFRs?=
 =?utf-8?B?N0UxK3QvS0d2dlNOOWZJL0tTTWtXendDL1NZbFE3YitJSWE5MzdaQkpRRm9E?=
 =?utf-8?B?Nk9idWNiTG1uVUp2R1pzUjgwTXlnWlpZWWtLV2ZuRk4xTjFaZmVLMk9yRXh5?=
 =?utf-8?B?bHQ3NmQvZTluL0JzQU1yKzExWjJhQ3FHWnpLUFBVbFNGaU1RdGJYNS8vMEtt?=
 =?utf-8?B?N2ZQN1RpVUxRQ05maU5UUks0MWVvY0svV0h4RW1ScHlySXZiQTNQYXhHSis4?=
 =?utf-8?B?VkpabXJjTkloQlVwYllqelRxT094NW4xRTZTbWlPTmRrL0t4dXo1a3RSQXow?=
 =?utf-8?B?dXBOLzNIZUtnTHl1a05nRFVERDhwTERIT1YrMzRJMWNBUm4rOVp3aE9ZQlE2?=
 =?utf-8?B?QWROU2xvTHhOQkNsbDhMbEQxVy9GT1hoSkJqV1FWZ0Vpd3VmOHFJOTZXbnVq?=
 =?utf-8?B?M3JDc0hoc2tsZEFLWFU0a0dLOFl3aXBYV2FFV21pTkFiWlhnOVB5eXliTGZu?=
 =?utf-8?B?Zno1b0NsR3NpaGgwaUFMUVFBaHFDcFBOZHB0SElUR0RYN2RSM240TVBNTTY5?=
 =?utf-8?B?Rks2MzB0T1FPNjBJVUxONlRMYWtsMkZQSjc1dzRXL2RzZVFpRUhQVG1na25p?=
 =?utf-8?B?ZGswN1piYXBweEdZVHFqSU1wSDVIaTdCc1RZNVVHWHByTFBzNU1WaytGZWZD?=
 =?utf-8?B?NUU1Qm16WTdhcHJiQkswSnYvVHV5SmZNanlJVGFQK3JWdFF4dEFsblk3K3A3?=
 =?utf-8?B?aUJWd0oxdUFleTVCMTNpeEYxaHdvcVhJTEExQld5ZW5YR3FEdUZBdC9JZzFC?=
 =?utf-8?B?ckpCSFU0aVRZamk1RGdxcEQxYkUrcnF3eml2VTRXQmFUYWxJT0FpeVpzSit6?=
 =?utf-8?B?ay9KczBxSitabTBNTzlyc3FORW5JdGQ3QlE2dnRuSVdKY0FybEFZMjdGUEVk?=
 =?utf-8?B?bVpKT1I2c3FsN3pkUzY3V29xRGRmS1pzL0Q4NGJESUhkMzZPOW5HeTlrVmox?=
 =?utf-8?B?T1Nkb09sY2paNjNtY21HU2RpMjdNMmF3NkJRbGhMNDV5aDJEOHdidz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DB65B51765A28469202A2890C3C1220@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 0YXgRZIMAjMNf/ME8fONRY0NNtuZHgCUJgOBnuAh1cvLY5NYtrX4Q5fXB7TZQ18quzopToWFocbFgzLQZPO3c5+J00gXTPZroVwGgLabGE9QZMJYnVXb1P5Tj8rXlocNsGiwYw6/QhVAeJH7x5r3KEAuwwJWzS+AfAKrEfDxsAq3nq9rYHEYyuplHfD2I587fEHm5/570fng3aEQu1s0bf7Z9XEHT4cK7S4vjZ1NHGMUhupESURIHi0svLMZx4UD1uOgv89tAzrNWjibGvE3jVNU4gqGoI5p630XV2IRBehiNrQ26RNHF+ItpibjIjh10lnrGKKk5DO34mBe2IkkGA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR03MB5885.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f68a59-2338-4f6a-cf58-08df0e39e4a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 06:16:32.1343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hIwmZD51OG/6OMgscwpZMYbhL13D4z1f4Tam/x7Y5/lSQqGtphVLGBpad3GZwNP2cw8HlQ0EkjhauLIgFeQcng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR03MB9436
X-MTK: N

T24gTW9uLCAyMDI2LTA4LTMxIGF0IDE0OjUyICswODAwLCBDb25nY29uZyBZYW8gdmlhIEI0IFJl
bGF5IHdyb3RlOg0KPiBGcm9tOiBaaGVuZ25hbiBDaGVuIDx6aGVuZ25hbi5jaGVuQG1lZGlhdGVr
LmNvbT4NCj4gDQo+IEFkZCB0aGUgTVQ4MTg5IFNNSSBjb21tb24sIHN1Yi1jb21tb24gYW5kIExB
UkIgcGxhdGZvcm0gZGF0YS4NCj4gDQo+IEVuYWJsZSB0aGUgR0FMUyBjbG9jayBmb3IgdGhlIE1U
ODE4OSBTTUkgc3ViLWNvbW1vbi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpoZW5nbmFuIENoZW4g
PHpoZW5nbmFuLmNoZW5AbWVkaWF0ZWsuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBDb25nY29uZyBZ
YW8gPGNvbmdjb25nLnlhb0BtZWRpYXRlay5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZW1vcnkv
bXRrLXNtaS5jIHwgNDUNCj4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQ0KDQpSZXZpZXdlZC1i
eTogWW9uZyBXdSA8eW9uZy53dUBtZWRpYXRlay5jb20+DQoNCg0K
