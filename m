Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794403776;
	b=Pr183UewnZGFEyg0K5FTRvLga/u+Ry9h9hvntdAiRrRLr099wFU7ZiGS8+AQha4DuQI4
	 z7hYHlL/hmdWs7rf1iEjDhSqv+BhqVtNst6+pRTQ20100/ctOzMU/VzkHksnmo8zgE6Gz
	 dy96OliYydVbjcURFnwxa6+10nM65OzA1n6dTJRcoYyKTFaS39tgaihq+H/eN4G/wBrrj
	 P3NrtHsakhEIkf2AfB/R2p5PczmEr7UL7xhqHHmebvVgd972PoQGl/oaVcknGxKue+F+L
	 B4K57Pn/TjtPE+7aTfSTgK483gFpF9o2urE1ozffi/wX7Q6+ZFllQM0m+MpTaE6zPtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403776;
	h=DMARC-Filter:X-UUID:DKIM-Signature:X-CID-P-RULE:X-CID-O-INFO:
	 X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:
	 Received:Received:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:
	 X-Exchange-RoutingPolicyChecked:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-MTK;
	bh=Qhy9FdV5evwoBibJ8OuemTgs/rxJBvEyoBkgIMVwQgI=;
	b=WgiaD0JmmfK55LyjLrNRZbdcT09zEEtrVYN+AYrg1edtU2fzTwfeF0mGJVS8UtABNnj5
	 ma5mLhUu31KriZaYvW7RU+LurWd/NcEbdfWDNU+oyjHJIKzz3FnxxI+YtkuojnNHrXWEM
	 DsJ603K+uDo2iXPhUvKpCctuvcHSZuoc+00hNtrdbD5fCEIeHz15s3tRjRmqFv3JUVVLn
	 u5QLe4XyFCI1xAgEgddvfJVNbVBlyyoNrECkHEGBR9h5k2bP43WgGpWJKJatU1wChy9Ua
	 D0JGj/gR9ClPvxMk1BNNJgnueao8oMjcmASqdnJ6yPWbhk0J2223rsXQ4gpC6/u9Tag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=h3AfG2wO;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=LwgCM5sE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=210.61.82.184
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C9E606A324;
	Wed, 11 Nov 2026 13:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C9E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=h3AfG2wO;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=LwgCM5sE
X-UUID: ec0f1ec8ddd311f18dc8c9802ae25ab1-20261111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=Qhy9FdV5evwoBibJ8OuemTgs/rxJBvEyoBkgIMVwQgI=;
	b=h3AfG2wOzU+Sw8sExFNYqjV+FT9qTDLWSYXZHkcdJwm2U7ujf5YuNurGVvO07+mcqoAO6lArqvzwkODXLNAaRU64CD77PQEVBSNCqVL0PXV9FLgKe2jadn8EZdOnPjOb/gOdpqg79TB4tlkTGNIIUP+fdpt4TbBQhvWvkghSWC8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:905a69e4-e69a-49b8-8667-898ca4669b4c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:d5d7b530-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ec0f1ec8ddd311f18dc8c9802ae25ab1-20261111
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 257355840; Wed, 11 Nov 2026 21:29:29 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 11 Nov 2026 21:29:28 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 11 Nov 2026 21:29:28 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LftFGkzkv95FLc2BHO7mB4y5OG8NlZcHwg4XDNB3s0QBC6NXfHrsXyUhIHjc8+6fLdupc77z2JTTCLUi3JkRU8qi21fbIxRW3Xd6aPRlBa3r9C5kDglj7fYWiRQr7EYJZnvvq7GJ3nLA6AqNU+FNgf2qSPMyaw5bfqa05fbSxMY1u3AutczwgO2PLQu74CmKlMYC+KnRkkbNSMGDuRcbp6MxamKqpMoFTHq1uedTshQHvCUMX+IR4lZDiVHSSzeetZ5euBAHsrHG2nOmlKthrxYryXHzp+BU6D1nZwQVgZ7RYFBmKeiVU3U+3/ORIIsr1Q0spK2tl8BKgcA7F4/Ggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qhy9FdV5evwoBibJ8OuemTgs/rxJBvEyoBkgIMVwQgI=;
 b=BdmWhfNLNRhk4JukA4HOnMBOOj6r0/hnzb3iJJF+NNFBMa17YxtTjLXOQefXxFzSkMEfA5pUmGApjeVKfPN7Tr9RfTUMlE2epEuC9xo9LXzzaADwVTalNSxpcRWH805EO9X2fC61wUSStcYTQ0CLho0vBEZTq6Ba31kSrhavJMyKT8wL9jzZ3J3+/9EEEhl8/dYmvfLDuTLTCvfAHDv0DHRtNtK2PkxxIH1Xh9VqO6qp/YA0dSoEcBe6WeQcAO6UTAJ4TnUtxCTMvpiwvlpnkAJCtkQDMrktbIyV1p2LOn5rF66+u24TgjLtqlOVgbfy7pUgA9V5B8Psi17TI1eVLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qhy9FdV5evwoBibJ8OuemTgs/rxJBvEyoBkgIMVwQgI=;
 b=LwgCM5sEVbhMf04h1iVnZvrSpW923VlWJ6cSlsenxyTuMVxw5yC3Clmv0JXUX+kbhyIlN3Ku+cOfnIXgJKCC6hcmowxzM7B8oVuDGMtrPkrE+p0+Kw9rDMMKvQg5UcpnRMUSW7L8rIoumrUkDNSAYshh4GEMuash4ehJa+V7Y3w=
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com (2603:1096:604:471::11)
 by SEYPR03MB6721.apcprd03.prod.outlook.com (2603:1096:101:6b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 13:29:24 +0000
Received: from OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02]) by OSNPR03MB9677.apcprd03.prod.outlook.com
 ([fe80::5af1:6974:a8f7:dc02%5]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 13:29:24 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"westeri@kernel.org" <westeri@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Thread-Topic: [PATCH v2 4/7] thunderbolt: add platform NHI driver
Thread-Index: AQHdcQmVpPqBwBYaX0OmA8rjtdaWS7cnQDYAgAGfCoA=
Date: Wed, 11 Nov 2026 13:29:24 +0000
Message-ID: <b53bf99311bd999b9687666741e100051659ec33.camel@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
	 <20261110114925.722014-5-chunfeng.yun@mediatek.com>
	 <830a0984-8938-40f6-9400-5962dfbbf274@oss.qualcomm.com>
In-Reply-To: <830a0984-8938-40f6-9400-5962dfbbf274@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSNPR03MB9677:EE_|SEYPR03MB6721:EE_
x-ms-office365-filtering-correlation-id: bdf75930-6fce-4c67-6c52-08df3ff7cd56
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|18002099003|22082099003|6133799003|261009223027099003|56012099006|11063799006|10067099003|261028144727099003|261102123227099003|261026121527099003|261022075727099003|261022105027099003|261026140227099003|261021121427099003|38070700021|4143699003;
x-microsoft-antispam-message-info: lKIZJt7aJtLuu2TIcABM3LQQOXetH2OIoafyVwU9x1hZpw4Plkfw8xeT/MisMfHaU1kjdyCsZbHKBKE8EEOT6sr+NgtKL1lO+bwUCjztP2plp3npUskilVLB4PNzM/p5c2gYhTWijtimGh/SQHAYVwkxrqp60dI9Aq5aS/U5d3cAMf/TXrv0cpIA0UZCSjAI5TnTJQeZF0ZOChADO5NPigK+7YHTyx8Ee7QiTXmqh8UPqAZUIL46MFDBMw2fYdyt3ITBlhKK1DORDD8rlfyq92RffTWBXnLxgF9gm1x6dvEbvgx5uDMgLLr7g0ajYDxt62LdhY4oGNLvrZDIYFIX7wCSsWkJ3HXo/rXMl9EtegBG7exrWeF/7i9dGHne1GQcn+XuXJCeMRTPvLqy51EQ65dM44tJFarlLLmVZZXyAuJxp+p6WE/VYxa8vfd4oq7b3Ak1+KifG/6QXklQ/S4yp3bTM+TYilco3V2/63FllbRtVOtN6evpuwkG5Ic73C6YhoTySpHsYYNIfsmgUXBJHwBrPAJIipG1QO/VjYZeEYxxa8v8GgLOEMuYSH9SyKm8VcYi0+uuh9DI/VFmK70PauF3GTCN9ReASxOQASPHnntzZTimW1eVPi7M/6+3otzs0/YoTzAdmetC361ahQwe8nJU1GllWWpcRXuimxMWmLvOL7tCMN98L0Qma6YPN58X+lFYkXfpsaeM3ZBtRb4NtrrtW7NShmmr9QZg69uBopk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSNPR03MB9677.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(10067099003)(261028144727099003)(261102123227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261026140227099003)(261021121427099003)(38070700021)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q0tIMy9JRVlaeEp0bkY0SUt3TFNDTkMwOWxzZ3NmcytkYk41YkNlajVMK1Fh?=
 =?utf-8?B?NGt6WWFuMXRrZytiSVJEWUxKSkR3UVdvUjlxV2NNWTE0SjZTNnV1N1R6L1ZR?=
 =?utf-8?B?NGFncHZMU2wwNnZZZ3h2dDdIRGJNWU1aNVBLaER6cStVNUVkbTIzK1RyUGVu?=
 =?utf-8?B?ZGJEQzRSazJOUjV3aWQvTkIwb3JUOHovQ2lBSy9IOHp4Y25TdWs2TUJ3R2F4?=
 =?utf-8?B?MlNsNytWcG4vLzRhUlpTVFEvcjErZXVhQzBLOUNpQW0wNFJ4YkQzdHlGZWdO?=
 =?utf-8?B?RjdqQ21sNXV0aWVDVVd5bUM1UzRXMkxtR1N6U3FJeVVNcVVDSkRjWFIzckgw?=
 =?utf-8?B?VnhaSlZYVTQ5emNYU3NlSXRvQVowWUNnR3JhdXYrSG43UWJXRkUvMWZ3SWJw?=
 =?utf-8?B?cTBHNjlmYnd2eXhsakRBQTZHcnoxNExvZzBMS3N3V1NqSlVoUUV2ZGFtR1BP?=
 =?utf-8?B?blFDa0pmODZlRmNIVjZUUVBNRmd3OG81ZjBpZmd1a2Q1eUdEekcybUxWdVFi?=
 =?utf-8?B?dFEzR3FMeUFmNmhkeW9WNzVkU09kci9qMGdCanR5SVROT3hNeTJnL0d2MExy?=
 =?utf-8?B?QjBtc05EVVJKQXE2RGlMcWR5UDJwN0I1TGoyU0hqYm9LOWhTaGVoak9mdWRp?=
 =?utf-8?B?L0tKYk9BUm91S0hacVdBWlJqa1V2azdXNU9sWkw3bnQ2M2djYm5GRGVueWUz?=
 =?utf-8?B?QWZJL2EvT0U1bnN2dTR5N21YWExucHdiZVhtcW1MRzBQdmdhVFFYUmw0SlBv?=
 =?utf-8?B?bmY3QW1hTGZoNEtMczhIVmJVSHdOR2FIRnpXZ2d3OGdReThZaVF5UTlRM2VO?=
 =?utf-8?B?T2c4c2FoRVZHQmlMWUtqeXY0MzUwc1lsQkM0TVI3MzRXRkNDRlNLK05vV3hs?=
 =?utf-8?B?RFhIRi9UWkVWTURwV2RLTU1oVDFWeSt2N09iRytJYWFjVUpJalJwU2t1S1B5?=
 =?utf-8?B?SlpCemtjVWVCWTJVZUpBbGZyRzZoNVU0R1A5S2RmTVlJYy9jdU1NRWxwSTl3?=
 =?utf-8?B?b2xNRXhKbStKR0ViTE1TVHNGNjhNU3M0VCtRVlNXRUtDWGdRQS8wajZMRnRG?=
 =?utf-8?B?Y2xUNVUrZFFsbElXemhzbTBLU1QwS2NWYXo3RitQTDIrbEozN0xvcU5PaUx2?=
 =?utf-8?B?L1lqS1ViQzl4N3hvR0txeERJZlRBR2NsU1paYkJCV0RsSTdtN0gwM0NFV1M5?=
 =?utf-8?B?ektiWEZzZVN0bm1xQ1Z1RVZhY25ycTNPMjNUQ0ZMQkZIc09PbDFSaUdrQmt6?=
 =?utf-8?B?Q2lsOGpIbi9FRlcvVkxYOUFyeDBmc29CdC9RMUdLWHpvTWxtS1l0L2Nvd2RZ?=
 =?utf-8?B?TkUxQThsVVQrY0Y4aUFpMG94dGpzbis4Z2xDdUxaTkFxT1JlbkhQVHIwdUpX?=
 =?utf-8?B?STBTRDE2K2JHL3V1RmVmR0dGemVzMmJtV1NRZlFQbmtpY1RYMmdKcVFVUm45?=
 =?utf-8?B?Zy94Uk5DV2h0TUpyL3BXa25tanJkYlJ6blVyNS9wUkgxNWMzTWlCRzBnM1R5?=
 =?utf-8?B?VHVNKzUxNVNLREUzbjJMTzJ0RkdyZWdISFlNVzNyR3RwUHU0Y0w5SmtvWHlt?=
 =?utf-8?B?alBWMGYxL1AwSnJWamtVZGg4eWlIV2ZLQmY5Z3FaQWwxQlpNWlphR0g0empz?=
 =?utf-8?B?MEhZQzZjREVUZVFMajR5TE9NVVM1Vi8zMzZQbTlLSkxnUUZUSUR6WVBwSWll?=
 =?utf-8?B?Z0hadWZ4Q3I4RTllKzUreUw3Nnp0c1NTVlkrRkNMWURTVjNYbFZ0SUZrdlE1?=
 =?utf-8?B?VWdPWElHOVBHcTFDaUluNnUxSWNCTVBlUTVLVkVIVnUvdktmTmtJM1hQV2ty?=
 =?utf-8?B?TFJHc3RDSkREMEwxSkt4eXVWSVBER1ZZME5VOGpIczZqa0c4TjBma1A0MXFB?=
 =?utf-8?B?NmpqTHNRamRBWG14czlQelp0TC9lVzBmcW5GY21oZ2RncVduQWh0VGNQaUtF?=
 =?utf-8?B?UVM4dUxrM3NoT3ZBa0E0NHFEeS9lK0UyRmdWNTlWM3JwdCtobWNnYmV2a1Nx?=
 =?utf-8?B?UDVYZERQSmdTajRvcVlIaHFsbi9BTTlZc2ZhWFdadUhiMzJLQTJaM1NqNXo0?=
 =?utf-8?B?L0ZIR3MxNUt6TTlqY1R6MkVTMGUyazBDcUhTSWYwVkRhVS9Gc1VLeXU0c1pK?=
 =?utf-8?B?Z2VRU05xR0ZFV0Q1QVdOeXRvWVVzMzVsb29QdEpyTEUvcm14aHpRY3BXWHVU?=
 =?utf-8?B?TTludFlUUjNFNHFiOEgvaXEvcXlRWitxbHJLejh2U1p3RTBoQWY0MjRZVmRO?=
 =?utf-8?B?ejVZNnh3TnpTT2hoUnlnQ3RGRG55cXFZRDFmb3Y1MHIvVnlQMEV0ZzlyNWtY?=
 =?utf-8?B?bjI1ZkxneDRVK1Bsb081Zkt1cFFYMHBwYmpVSkEzMzFqdWhYcFZaQ1dBa3pS?=
 =?utf-8?Q?LloTc++/uCLUrwXk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <31B0CCEC891EB04C8F21EBF8CC33F449@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: lb3s/nJoeyNSP4ecwpAw8GILVTV+uyvsuBwXf0gu2PC+Mfqrgtw6nl05pFzC6RQyq/ap4MCAPh+Y9lFx3S1K8yS06Br8mk7LrBdsCq6TC40cd5ZHV9f8Eo4FkvOInTmCOd9be/yqema/GrTzw5qSdmm5QixDZHGW3D4Dw554/LYtgCPycuxbSKxq1Sr9D8aXlhPbmcMOYa3xANBC1U5E89BF6I8U3o+rJD9zHWaHmU87W8nmfMlpUSqAG5Hz0kg6CxHbdwfK+h8sPYri/iPka1/wnBE4TbyT3uEBFsWu0Kl0IFBusCKqEMpCDhM+0rXyzXfOPU0sH01oDFY7rqiVqg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSNPR03MB9677.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf75930-6fce-4c67-6c52-08df3ff7cd56
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2026 13:29:24.3976
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1DIyUZMPGVZX/Lq7oKirBozQXI5OslWY29nY8tEpdWen02t9WSZ2KkPJxfcCIYVMbxaxuh9aJWRBMMePEPfXQ5XxD3iK39vpgfVS4Of7sKc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6721
X-MTK: N

T24g5LqMLCAyMDI2LTExLTEwIGF0IDEzOjQzICswMTAwLCBLb25yYWQgRHliY2lvIHdyb3RlOg0K
PiANCj4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4g
YXR0YWNobWVudHMgdW50aWwNCj4geW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUg
Y29udGVudC4NCj4gDQo+IA0KPiBPbiAxMS8xMC8yNiAxMjo0OCBQTSwgQ2h1bmZlbmcgWXVuIHdy
b3RlOg0KPiA+IEhpc3RvcmljYWxseSwgdGhlIFRodW5kZXJib2x0L1VTQjQgTmF0aXZlIEhvc3Qg
SW50ZXJmYWNlIChOSEkpDQo+ID4gY29udHJvbGxlciBoYXMgYmVlbiBleHBvc2VkIGFzIGEgUENJ
IGRldmljZSBoYW5kbGVkIGJ5DQo+ID4gZHJpdmVycy90aHVuZGVyYm9sdC9wY2kuYy4gSG93ZXZl
ciwgc29tZSBTb0NzIChzdWNoIGFzIE1lZGlhVGVrDQo+ID4gbXQ4OTAxL210ODk5MikgaW50ZWdy
YXRlIHRoZSBOSEkgYXMgYSBtZW1vcnktbWFwcGVkIHBsYXRmb3JtIGRldmljZQ0KPiA+IGRlc2Ny
aWJlZCB2aWEgRGV2aWNlIFRyZWUgb3IgQUNQSS4NCj4gPiANCj4gPiBUbyBzdXBwb3J0IHBsYXRm
b3JtLWF0dGFjaGVkIE5ISSBjb250cm9sbGVyczoNCj4gPiANCj4gPiBJbnRyb2R1Y2UgcGxhdGZv
cm0uYyB0byByZWdpc3RlciBhIHBsYXRmb3JtIGRyaXZlciBtYXRjaGluZw0KPiA+ICJ1c2I0LW5o
aS1wbGF0Zm9ybSIgKE9GKSBhbmQgIkFDUEkwMDE1IiAoQUNQSSk7DQo+ID4gSW1wbGVtZW50IHBs
YXRmb3JtIHRiX25oaV9vcHMgaG9va3MgZm9yIHBtLCBpbnRlcnJ1cHRzIHJlbGF0ZWQ7DQo+ID4g
DQo+ID4gU3VwcG9ydCBhbiBvcHRpb25hbCBkZWRpY2F0ZWQgd2FrZSBpbnRlcnJ1cHQ6IG9uIGlu
dGVncmF0ZWQgU29DcywNCj4gPiB0aGUgTUFDL1BIWSByZXNpZGUgaW4gYSBwb3dlciBkb21haW4g
d2hvc2UgY2xvY2tzIGFuZCBwb3dlciBjYW4gYmUNCj4gPiBnYXRlZCBkdXJpbmcgc2xlZXAsIHBy
ZXZlbnRpbmcgdGhlIHByaW1hcnkgTkhJIGludGVycnVwdCBmcm9tDQo+ID4gYWN0aW5nIGFzIGEg
d2FrZXVwIHNvdXJjZTsgc28gYWRkIGFuIG9wdGlvbmFsIGRlZGljYXRlZCB3YWtldXANCj4gPiBp
bnRlcnJ1cHQgd2hpY2ggY29tZXMgZnJvbSB0aGUgYWx3YXlzLW9uIHBvd2VyIGRvbWFpbi4NCj4g
PiANCj4gPiBDbGVhbiB1cCB0aGUgdW51c2VkIG5oaV9lbmFibGVfaW50X3Rocm90dGxpbmcoKSBw
cm90b3R5cGUuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcgWXVuIDxjaHVuZmVu
Zy55dW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IHYyIGNoYW5nZXM6DQo+ID4gKiBBZGRl
ZCBDT05GSUdfVVNCNF9QTEFURk9STSB0byBidWlsZCB0aGUgcGxhdGZvcm0gZHJpdmVyIGFzIGEN
Cj4gPiBzZXBhcmF0ZQ0KPiA+IMKgIG1vZHVsZSAodGh1bmRlcmJvbHRfcGxhdGZvcm0ua28pLCBp
bnN0ZWFkIG9mIHN0YXRpY2FsbHkgZW1iZWRkaW5nDQo+ID4gaXQNCj4gPiDCoCBpbnRvIHRodW5k
ZXJib2x0Lm8uDQo+ID4gKiBSZW5hbWVkIHBsYXQuYyB0byBwbGF0Zm9ybS5jLCByZW5hbWVkIGlu
dGVybmFsIGZ1bmN0aW9ucyBmcm9tDQo+ID4gbmhpX3BsYXRfKg0KPiA+IMKgIHRvIG5oaV9wbGF0
Zm9ybV8qLCBhbmQgdXBkYXRlZCB0aGUgRGV2aWNlIFRyZWUgY29tcGF0aWJsZSBzdHJpbmcNCj4g
PiBmcm9tDQo+ID4gwqAgInRodW5kZXJib2x0LXBsYXRmb3JtIiB0byAidXNiNC1uaGktcGxhdGZv
cm0iLg0KPiANCj4gVGhlcmUgYXJlIHN0aWxsIG5vIGR0LWJpbmRpbmdzIGZvciB0aGlzIG1lYW5p
bmcgaXQgY2FuJ3QgYmUgbWVyZ2VkLg0KPiBZb3UgYWxzbyBoYXZlbid0IGFuc3dlcmVkIFN2ZW4g
YW5kIG1pbmUncyBjb25jZXJucyBhYm91dCB0aGlzIGJlaW5nDQo+IGFjdHVhbGx5IHVzZWQuDQpT
b3JyeSwgSSBtaXNzZWQgeW91ciBjb21tZW50cyBvbiB2MSBiZWZvcmUgc2VuZGluZyBvdXQgdjIs
IGFscmVhZHkNCmFuc3dlcmVkIHlvdXIgY29tbWVudHMuDQoNClRoYW5rcw0KDQo+IA0KPiBLb25y
YWQNCg0K
