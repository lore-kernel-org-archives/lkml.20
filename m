Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6813DB997;
	Fri, 16 Oct 2026 06:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.61.82.184
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133424; cv=fail; b=XFwuQNjZV7F6aSFXQU1lyczrO4RWtVaPD3iA/XzQW5uc+SaF+QUTDmtX4CvKJYc8F08n5hQMy5vR8Qrzqof15Z0aczNTyPStx7MKddqk1bJOExJnlhP8bAndfqwBw7f3yhhrg5In4vQzejPp/IwAwOHwTGKPZGe3hKpPz/VuXL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133424; c=relaxed/simple;
	bh=n4wqDmG+DpRLBS9nlztOTKyvfRpo91PMApsxRmmqCx0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p26GwdZwqGxOGTtIYT+WS1EA188o8H81bwaUakzwAJD+sJiNNBBlS2XWA3HPJKfIj6zvAI7qQcCq7KICw/WbioWEtGQbJW+GG8LEGx8x6r0XB7Lc5+9zwl31ZzbyKQg6ryYzcwTDhjnjN8g9O/DjoLzhaIV70PUeHlXILVA0DAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=Utez7dy8; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=KCTz7nt/; arc=fail smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Utez7dy8";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="KCTz7nt/"
X-UUID: bb7258c8c92b11f18dc8c9802ae25ab1-20261016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=n4wqDmG+DpRLBS9nlztOTKyvfRpo91PMApsxRmmqCx0=;
	b=Utez7dy8lEKi7kQ99YXt4L5zrAyI7ZyGxul6yXfrgp++kHW6+FvQG/WCk8VMBCPeteyW9KqiTh3b92GrcXplBHMyzaweUeYIQjnBGDgGq7MdpeLrFsrTAIvP8baEpab1Rtao3c1S4Gi60bDMJ8F0eLxmR8YQWahZK5aAP7m++qc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:aa5735c7-2245-423f-b8d1-05a9536f14be,IP:0,U
	RL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:2
X-CID-META: VersionHash:291e20b,CLOUDID:42802033-28bf-468e-8c18-4418212bb3b6,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:4|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bb7258c8c92b11f18dc8c9802ae25ab1-20261016
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1239524327; Fri, 16 Oct 2026 14:35:09 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Oct 2026 14:35:08 +0800
Received: from SG2PR04CU010.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Oct 2026 14:35:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSGlKlIbMpfct6OwDMit8Kkdhep0kHlsstqEuh2xTbyjw8H+9UCIDIBC7aAEMcbet9ZAH4BvOb/KTHJO8n2bpOTpe4FqPGxflwN5M5rYPZJfxvb0yyqhxPo4rNraWScu4TsyIqZJNB/TXDEUZkO+hcnU40w8IjZd2TpY5d9WsrT0h0U64G8HqC6pqVSlcA3BndUWM60u9COA1l8TZQSQ2M5RQ9FKjOncShiGzSkfvtMUnqzLbb2awT3GTHIWIuiNV4tVxQM/hxtfnbDmp7sCN6SOz0GX2Is9JvYc9A/kt8HN4zXP8ikDhWL6I370yvU1HJ5rJLoxs1GGenl6tGRo1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n4wqDmG+DpRLBS9nlztOTKyvfRpo91PMApsxRmmqCx0=;
 b=g+SmvJWeHSxEkK0pbNEPc3I3hfKa8Nsqb5MP14fakn8xHuUsH+J/Pdns4oOx8v5up+HQFcojlZ1I7eFubTsP48dUDknpie5vs9UOr9k0PoI8B2FdAsxyFOBXBsa9f3FYeIqILi44fSP2HJ0nrPB7aIk6SHWhTPxvSc8ZkI2pm5LE1xmpomhOAwHWCDzmSCywSnzXxfuDmpySvMHUdkddsbIQsUA129K/0i5ZDdXzJdAvTjEgXg7GITSbzew2uaSQxt3xh7/3h0kCZwmw9yaiL14OGOPhmbBFy8sJ3IIOJiOaQHgzguhxKX7YR7zaX4cwLZyEPGUxu0q7Ypt8q5J6KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4wqDmG+DpRLBS9nlztOTKyvfRpo91PMApsxRmmqCx0=;
 b=KCTz7nt/eWY4+R00oXFAbaZvGKvGfgnQl8gckAMnWku6AccwsOUvnTtxTMouSBBp/SyKh3onq7TdrO1qhnMaUNPqW89RePkshgOdHIXnFgVrHkSY8O+V5uciZmpfvbZf1C8riGyq2aJW2xCU/GL+jvQPUBqlFPz3YMFI9W/n3VQ=
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com (2603:1096:301:a3::12)
 by OSNPR03MB10470.apcprd03.prod.outlook.com (2603:1096:604:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 06:35:05 +0000
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1]) by PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1%3]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 06:35:05 +0000
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
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v18 12/13] dt-bindings: mediatek: Add MT8196 JPEG SMMU
 bindings
Thread-Topic: [PATCH v18 12/13] dt-bindings: mediatek: Add MT8196 JPEG SMMU
 bindings
Thread-Index: AQHdWI5s0HaGaVmBtk+0gKIhXSm9tbb5p+uAgAYX64A=
Date: Fri, 16 Oct 2026 06:35:05 +0000
Message-ID: <111e3f34a0e6fcb8070ec4698460a83f6381b7a9.camel@mediatek.com>
References: <cover.1791614327.git.kyrie.wu@mediatek.com>
	 <77ae5bfdedb1240420fd1aced446c9dfee38283e.1791614327.git.kyrie.wu@mediatek.com>
	 <20261012-determined-magenta-camel-ff2ca8@quoll>
In-Reply-To: <20261012-determined-magenta-camel-ff2ca8@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6396:EE_|OSNPR03MB10470:EE_
x-ms-office365-filtering-correlation-id: 65f682bd-b541-4152-21f7-08df2b4f9d64
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|23010399003|376014|1800799024|6133799003|22082099003|10067099003|18002099003|3023799007|11063799006|4143699003|261009223027099003|38070700021|56012099006;
x-microsoft-antispam-message-info: 2EQcetuJUpiCuDsDW0iCefIfoyxntTnkG/GNypvqCJKNUBL9+xp2sizX5Qin/yOKsgCFpsTIbTeZyZPDS/VGHQJXTv3nVBNPNoyNA1eXdGQPKlt0dvURnDOK90ZXcz4dIFXoMC6AJseGBJ4QqBcI/vPOAmehHLZ1TqP1e8N76rIdlnz58A3ib9DMFXquXhMnWFZYaCvnVV1airxefNgNixVxlcIF9GbYm0CQERm02UQuklRmgtEa+qaKo0fYR4zCkk4siBSm4HgAgA0QyITpyJWRM3k3CfI/lJMtBFV1MBJM397L9shPWSlEvNf0p7uKXC7u/tnSGekjnJHuM22mUiNhAZRmfo1FG3Q1m3yk4yodyI1JdfacwNPpHrTZdE37NUtjwcebnwuFDM66iBPdCdMotnkve6xBZ47CZR3Y4yUSGL0W+auCKIOrh0sK6lrs3whmYLImjTqqsqpt+ONIoNKV2DwBapxRLYeBhq/13uCwnm6LD9aXsyUyXz2iX9j2gDgeVVdJUUapr3kWabFxlr5uE+oOLUT3dWlIhYmj2XWeFthd107WuCqDPgIvOczagGQOBd9Qo3v7fpgVfUAO2stk5QKs8c14AIKpcJlfU/5D5SLyLUCSsAnzb37mmtYpbPoKlL/X8XiBZ+uAzr6BKARHhBZiT+4JuiFaqjqzG8M6/dArY7UsCp/lj/T9ziue48hEQPftY7xawB0XAtbBJw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6396.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(23010399003)(376014)(1800799024)(6133799003)(22082099003)(10067099003)(18002099003)(3023799007)(11063799006)(4143699003)(261009223027099003)(38070700021)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEdjallGTTQzeXJoOGNpUVlOSlFiZzZxWTNSdjdRVlJoQXREWE0xMmF5VWpm?=
 =?utf-8?B?djVxTFFab000Ty96Ykt4WmdIVk5zb3pOZk9uWVJkUHRLblgvWFhIVUhiM21w?=
 =?utf-8?B?TDlQUWUyd3QyNU1Ba3psWGFhdlI2WGdLb3VOWXRlTnpQR2kxbmRMcW5zbHZH?=
 =?utf-8?B?VFo4VHlNbGc1am91V3JCNEMxd1VTTHNYYktjRUJhejY4enRWVHFQSytIR1FK?=
 =?utf-8?B?dmFIb1ExMlZyUUR0dUhoQnNnd2EzNkVraUlKSHhYMHR1QUY2TUh2M2VlV0cy?=
 =?utf-8?B?WE40aUxJdjhMNHB1bkk1MG9oS3JuNkxhOTVWd3psRmFGWlA2VDJrRzFJNENm?=
 =?utf-8?B?aDM4anNsKzZMUUF3VjIrV2k2Mk9BKzZmaFZPT0IvZUFFaWRuSlY4NW1QU3pR?=
 =?utf-8?B?d2llMm8yRUdURVpCNGZaMUc2N0I4U3pvNjJhMSsxZkRTYnFCM3pQaGxwV1RD?=
 =?utf-8?B?aHA5Z3VpZlBjTTdBWTRJTDNKbkZ3QTEvdUo4RTZCTnkrdDFXbU93K3JWL3FO?=
 =?utf-8?B?UkJyK296VUJwTjlka2JYNXNLODgvL0d5RVFMT2xYc1RndzlZR1F3YmpoL0pl?=
 =?utf-8?B?YWtpVXlWSjY0SXQ2cTdGVGxJemhYOTRIOVRnR3VuUGhESjFRLy8yMEtTeDg5?=
 =?utf-8?B?RGtacHVYR3Z6QTZxSUYzeUNpUUNjM2NidFdLalYzaUg5MStJYVZvK0ZFWTdD?=
 =?utf-8?B?OUNNVjVlREZHcFJXT3kwQm1xNDQ5Wi9TWXZRYzh5cVVycjExV09QSW9DU1Uv?=
 =?utf-8?B?V0ZML3VrcXNKZHJIVVh5aFlESE9TVm5YM3Z4a05pS04wQ0FlRWVBa1BtWEFu?=
 =?utf-8?B?R1VhVDBpbEJrbDNlSWoyWE9IUXdSZGx6VTZleG1rTkllVFZKSTNzVy9xRkho?=
 =?utf-8?B?eXJBcmY0ZEJKTkpDekxhVHkwTjlyQkRNaW43Y1M1TGdCTWRBYXBnOUZmSmwx?=
 =?utf-8?B?NWU4N0ZOek4wa21aMHREVFUyR3V1cFRmdEtGT1RtUDZ3Zng3R0dSb1RmT1dC?=
 =?utf-8?B?R2s0YUNGNmV1OUphbEtZZEt2NFYvYjRFVy9TcWRSek5UQjhjTnlEUWdTRWg5?=
 =?utf-8?B?c0hhcC9Tb3JsNEN0TGs1ek9CeVJkaDJXZG5Gbm9iWXVXaWZTNDhPRXRhcFlR?=
 =?utf-8?B?dXlINzRoWk1pdnJZQzAxdzJYd3JsRkNUZmExRXV6R0IwTEpPQkVxY1NyM3lv?=
 =?utf-8?B?WDc5aWZibmhHVTMxdDgzVlh3RjNwNFRDRzVRQjRYWk1MY0dkYmd5OTJTR0dI?=
 =?utf-8?B?Ry90VzhMUEgrbUV4cWp4VG9QR0pYQ3hKVE40bWJ6WTdPZVhwdWJCeW9vVk4v?=
 =?utf-8?B?TjBFT2d3YW83bWp3V1B5dnpDVTA3NEpnYzJ0V0JWUm9BRXhGZ1VKTTRPaXdi?=
 =?utf-8?B?dDdnelBsL0JLR2R0c3JwR3E2ZGsyQTR6WERNMWVnUURhNXBMditKeVdvSFdX?=
 =?utf-8?B?UW0rc0VzR0I2WksyaFZadVgxczhpR3FLVlBnOUdTOWhYeFRoRUxTa1JzcTE4?=
 =?utf-8?B?OVN5M1ZCQ0N6ZmlSamRONkphTXZmVktMZnZiZWFET0JySnM3TEVqeDJscWpV?=
 =?utf-8?B?dWRjNlllb0FtbzJCSHlSbi9CRVFneXN4Y3VEcXVxaU5rYkgrNFhvSWJOWWRu?=
 =?utf-8?B?VjRQeGhiemJ0UDhzZ1g0TUtwVVZnUEJSUUNwSDBaSSszMVRRbWlwMmNHR2tD?=
 =?utf-8?B?RnY4YTYxdU5CMjJOMHZWUGZ6aEN1cXE0TVE5RzZJQlNxTEs1NEtTOGRLbit3?=
 =?utf-8?B?RE52b2hvTG5lR2YrN3ZXaVUwK2kwUFpuQzMzUSt6VTNvM2dlK0hxN3VEVVVL?=
 =?utf-8?B?dEdKeEhyd1Fuc3JmUkRNNDVpTzBpTUJVek9IeW51YVQ2OVhiNG9QblNJckxx?=
 =?utf-8?B?VDcxeWc4ZHIxTCtyMGFoMnlOSkgyL2E2RmhEMDZTbkVKRjVubExRM1JGUllr?=
 =?utf-8?B?cnBSekUrSm5YNkdubGFWeENLUEhQQ3ZySFVYSHlQQ1lQWkl3NEFhdUsxdTZa?=
 =?utf-8?B?SDdBVU50Y2lNSThySHFLK2xHUVQ5NlBOelN6Y2pZQnYrWDNwVlQ5MjI4NUY5?=
 =?utf-8?B?KzZLcHlrZ2FLNXkrS0hJZFFXNXpFUGhwS1VxTnorYlJ2OUVMM2F1b0ZRWFEr?=
 =?utf-8?B?dzFIY2c4Z0MvK2Zmc2pEOHg4S1NpSHJ5VEJJYzU5UHI3M0lnNXMvbWR1Rk1i?=
 =?utf-8?B?Q3l1ZERtdnBEd0lXY2l0ODZ3aWpJRUpOQVlaUWpCczdJMC85OC9wREpWRjl0?=
 =?utf-8?B?Y2M2SXJyQlU4OTFGd1ZoeDllOHhVT1hhU1pCRmNycFl2QXoySHl2S0JKMytu?=
 =?utf-8?B?bnV5ZE1LZDhsbEZ5dlRYQlJtT2ErN3ZnRW5ITkt5a2hkY3FBMXQ5QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <616BB1AED8A9864A8D64F0445CA0D547@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Ol9GscKrZxGRFemAZFboQH4OPeP7BwglsOSM6INyTgnlD0xdt1tMX/uyjBiju/enSnXP80YgyTqak9FRWL1+bKI06Zd7+Fj9udObY56oFtPVASZkYldco3AUl0V2uD1rZOFybi1KYO9gVGW3WsDtuDPJ94K1rha/2tuvM7KQyzLCPSIM2KPDK7jBdw5FAcUwMpO0BWHL+05YnJ/BP+i4wBfPZSeA+FyvZcJqqwIkSx3r9mOd36Iw+jTowJ93ZD6WhPfUue9DBevmlhnIfT/Okm3MKRJLEk0NGgU+3nGC7OOjGVRVHsA0iLdupqsQTvi0xuUwm4vzwyBOPqdM1t12BA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6396.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f682bd-b541-4152-21f7-08df2b4f9d64
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 06:35:05.2617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PvmT4UcVUO8aqtrarnDxxrwlbdePz7iZXA8+nH25bfje/zKYp7HPbvrYHSbKYDE5xBL0UUIAzUGNxXknS3N1Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR03MB10470
X-MTK: N

T24gTW9uLCAyMDI2LTEwLTEyIGF0IDExOjMxICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiBTYXQsIE9jdCAxMCwgMjAyNiBhdCAwNDowNzoxNlBNICswODAwLCBLeXJpZSBX
dSB3cm90ZToNCj4gPiBEb2N1bWVudCB0aGUgZGVjb2RlciBhbmQgZW5jb2RlciBwaGFuZGxlcyBh
bmQgZGVzY3JpYmUgdGhlDQo+ID4gZGVkaWNhdGVkDQo+ID4gSlBFRyBTTU1VIGNvbmZpZ3VyYXRp
b24gc3lzY29uIGZvciBNVDgxOTYuDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTogS3lyaWUgV3Ug
PGt5cmllLnd1QG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLi9tZWRpYS9tZWRpYXRl
ayxtdDgxOTUtanBlZ2RlYy55YW1swqDCoMKgwqDCoMKgwqAgfCAxNiArKysrKysrKw0KPiA+IMKg
Li4uL21lZGlhL21lZGlhdGVrLG10ODE5NS1qcGVnZW5jLnlhbWzCoMKgwqDCoMKgwqDCoCB8IDE2
ICsrKysrKysrDQo+ID4gwqAuLi4vbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk2LWpwZWctc21tdS55
YW1swqDCoCB8IDQxDQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+IMKgTUFJTlRBSU5FUlPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMiArDQo+ID4gwqA0IGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMo
KykNCj4gPiDCoGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+IERvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2MvbWVkaWF0ZWsvbWVkaWF0ZWssbXQ4MTk2LQ0KPiA+IGpwZWctc21tdS55
YW1sDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLG10ODE5NS0NCj4gPiBqcGVnZGVjLnlhbWwNCj4gPiBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxOTUt
DQo+ID4ganBlZ2RlYy55YW1sDQo+ID4gaW5kZXggMjhhOWE5Yi4uYjFkY2NjMyAxMDA2NDQNCj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWss
bXQ4MTk1LQ0KPiA+IGpwZWdkZWMueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxtdDgxOTUtDQo+ID4ganBlZ2RlYy55YW1sDQo+
ID4gQEAgLTczLDYgKzczLDIyIEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOg0KPiA+IMKgwqDCoMKgwqDC
oCBwb3dlci1kb21haW5zOg0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgbWF4SXRlbXM6IDENCj4gPiDC
oA0KPiA+ICvCoMKgwqDCoMKgIG1lZGlhdGVrLHNtbXUtY29uZmlnOg0KPiA+ICvCoMKgwqDCoMKg
wqDCoCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+ID4g
K8KgwqDCoMKgwqDCoMKgIGRlc2NyaXB0aW9uOg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqAgUGhh
bmRsZSB0byB0aGUgTVQ4MTk2IEpQRUcgU01NVSBjb25maWd1cmF0aW9uIHN5c2Nvbg0KPiA+IHVz
ZWQgdG8NCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgIHByb2dyYW0gdGhpcyBkZWNvZGVyJ3MgR1VT
RVJfSUQgZmllbGRzLg0KPiA+ICsNCj4gPiArwqDCoMKgIGFsbE9mOg0KPiA+ICvCoMKgwqDCoMKg
IC0gaWY6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoCBwcm9wZXJ0aWVzOg0KPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGU6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnRhaW5zOg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6
IG1lZGlhdGVrLG10ODE5Ni1qcGdkZWMtaHcNCj4gPiArwqDCoMKgwqDCoMKgwqAgdGhlbjoNCj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgIHJlcXVpcmVkOg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0gbWVkaWF0ZWssc21tdS1jb25maWcNCj4gDQo+IFdoeSBhcmUgeW91IGFkZGluZyBpbmNv
bXBsZXRlIGhhcmR3YXJlIGluIG9uZSBwYXRjaCBhbmQgdGhlbg0KPiBpbW1lZGlhdGVseQ0KPiBm
aXhpbmcgaXQgbGF0ZXI/DQo+IA0KPiBQbGVhc2UgcmVhZCB3cml0aW5nIGJpbmRpbmdzIGRvYyAo
YW5kIHBhcnQgYWJvdXQgY29tcGxldGUgaGFyZHdhcmUNCj4gc3VwcG9ydCkuDQo+IA0KPiBCZXN0
IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPiANCkhpIEtyenlzenRvZiwNCg0KWW91IGFyZSByaWdo
dC4gVGhlIE1UODE5NiBkZWNvZGVyIGFuZCBlbmNvZGVyIGNvbXBhdGlibGVzIHNob3VsZCBub3Qg
YmUNCmludHJvZHVjZWQgYmVmb3JlIHRoZWlyIHNjaGVtYXMgY29udGFpbiBhbGwgcHJvcGVydGll
cyBhbmQgY29uc3RyYWludHMNCnJlcXVpcmVkIHRvIGRlc2NyaWJlIHRoZSBoYXJkd2FyZS4NCg0K
SW4gdjE5LCBJIHdpbGwgaW50cm9kdWNlIHRoZSBzaGFyZWQgSlBFRyBTTU1VIHN5c2NvbiBzY2hl
bWEgZmlyc3QuIEkNCndpbGwgdGhlbiBmb2xkIHRoZSBtZWRpYXRlayxzbW11LWNvbmZpZyBwcm9w
ZXJ0eSBhbmQgaXRzIHJlcXVpcmVkDQpjb25zdHJhaW50IGludG8gdGhlIGRlY29kZXItY29tcGF0
aWJsZSBwYXRjaCwgYW5kIGRvIHRoZSBzYW1lIGZvciB0aGUNCmVuY29kZXIgcGF0Y2guDQoNClRo
aXMgd2lsbCBtYWtlIGVhY2ggY29tcGF0aWJsZS1pbnRyb2R1Y3Rpb24gY29tbWl0IGNvbXBsZXRl
IG9uIGl0cyBvd24sDQppbnN0ZWFkIG9mIGZpeGluZyBhbiBpbmNvbXBsZXRlIGJpbmRpbmcgaW4g
YSBsYXRlciBwYXRjaC4NCg0KVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lg0KDQpCZXN0IHJlZ2Fy
ZHMsDQpLeXJpZQ0KDQo=
