Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794468302;
	b=sberF9kt6wrS6VEBBGzAmEBx0AmQNWm7tcMOsOB+dA0+6FJgT4875SfifxpKdIYrqcXG
	 eEWHF0Ls2lt1IGGvpbhzksFQ3eBCy+fzjm2suVwQWi/sA3684psy+6XRnPllV0J5Nw+HE
	 qXV578XbiZ9MEceVuMAerbcWuoJdmJ9LyxYbDVrflmzGOmTieLOZXQIbmpy76pdbe0C+R
	 f4FVslUeNXVzN4+r3ptBFlHj7Q8rX15p+70qGEx5i3wfyv9QLiXPrqwE12MP+ADljCNXZ
	 9XS2mqaxm4ml4Yq0VWhxAd1PaAJ6LJriuy7Y+kXV0OOpzuY7ilq43J0OmCMTY/xjZEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468302;
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
	bh=7hsWjVCfXoquEAVvzLx6xtdURoMh551sVGMJqUklHUo=;
	b=pSXoy1/nNiaTQ8d7jxYNe2RERe4HNgP/L3YRjaQTLWq/yc0hXnnb+8/E4ciuqde9UIcq
	 YNBiPi45CQEq25mKp8OQfAfmbtqp627E95kIaEuO+owOkaHVFD9/7Bj93XIfwkQlbqAdT
	 mXXUGoyAyUjjeWKmqrLt2tX8JrRsIDmhMGBXeWtM0KF6HTun6Wz6ZWohFUp1RvgDw9mkQ
	 O/8xXOcj5xyCR7e1C41JQ6Iq2wkij2GUlsrr1at9OAA3yjyYjdS1vPOJb/6GIc6oLIK3j
	 zyrzMtkRNd19BJBW3OyB1DxL8Gsg2xaMmUmX3Pya2rwfYXAdPdso99fg/M9qRRqeSnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mediatek.com;
	spf=pass smtp.mailfrom=mediatek.com;
	dkim=pass header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MkYzIZW+;
	dkim=pass header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=cPFWW7eN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=60.244.123.138
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4EE606A31C;
	Thu, 12 Nov 2026 07:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA4EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=MkYzIZW+;
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-mediateko365-onmicrosoft-com header.b=cPFWW7eN
X-UUID: 28afaaa0de6a11f1b1788b6acf885367-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=7hsWjVCfXoquEAVvzLx6xtdURoMh551sVGMJqUklHUo=;
	b=MkYzIZW+GwJ4eISLOjvw7sSQt8JiS7GeL81Kki6MMNDiCEyQ0xuuzrz2zDbhutguWDO10oQmkL+dXdYiK/zO5WxTMvk9YdYgrjg6lhiq2EsWpy4VWywZl5I7Ae3h8bNfCg2Ey8LlD+z9rIv+IBD6lJEmzqLUOrEDPUc92mSTJkY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f812ae7c-037c-4d64-81de-3775e1e63118,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:feb13066-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|51|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 28afaaa0de6a11f1b1788b6acf885367-20261112
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1761699749; Thu, 12 Nov 2026 15:24:55 +0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:24:54 +0800
Received: from SI4PR04CU002.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:24:54 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJ1Pd+Z3/grvqUzOOQ6kR/nYrhZPu1TPuCO85C+2qURLmssOnxP46rceGi72GtBwU/UDpNH3B7l/S30gO4nVW0ddpimiH/QOIF+lMF5oIvpUMl3GOlaIXjHPppVxlEoQZXjzIZjn/uQ8nxK2teNOlUFiKNsU4QeYcLdyHZIlCqhe/12DHByOJUlhkvxGZgNfejsHBZZFfLhr9irqMJY1FNrRWCyS4sCO2pM/M2B4TBtZ/AP3JV4Ff3Hci+TdvGbwezS9M9PVwRGvLUfUG4a/5acPpWn1/jEjObt6KpGJgEAPfJNY4P6gRxUYCWmojhvqyamLCiUI+QWJKfQBj9OUKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hsWjVCfXoquEAVvzLx6xtdURoMh551sVGMJqUklHUo=;
 b=cMSSVDIIPs7Sk30ZnTr67svotBO7jL0Xq8yPwqD/8589pKvc00tfMOCOlq7njYweNOJ3I7q4J49coNPTC6jNEEKSUpHePVUWSng8Ko59nfK1xuO77CnjoMH7klGPicskQzrM/jJZOc/nobswrCemQ00+Vc+K6NzfGjaXAyASFvSweeyScTpZm5Hez3V8CYVnwuw/dWveVuZpJnerm32LvDmeYijZnh/7pbHHCdE34AtO9qW0ln3DczVRIIHd9sMOtI2v0G7nRBUdlVqBU6eVTx9YDm4Q/F+rMP5ZXGh3RSoKg33y+qIVZZyRAS/mC4ymHjheHP3ND1+tixdkSABQRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hsWjVCfXoquEAVvzLx6xtdURoMh551sVGMJqUklHUo=;
 b=cPFWW7eNVpU+1Wkv09DDFInYNMXMH1WcW0Ns0janIPm6EkZAjGu8CSwwgvPCWwxqNx/hTdr1vXiB2u9mErpldkZmhmp4KznUgJTBCubv+DphEZ6d0bWzj3tblB4sfN/nTv3ssX3+l6ZBgRP1lhc3nsPrDPui7CBFULb5KqRhYEo=
Received: from KUXPR03MB9665.apcprd03.prod.outlook.com (2603:1096:d10:5b::5)
 by JH0PR03MB7448.apcprd03.prod.outlook.com (2603:1096:990:13::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 07:24:49 +0000
Received: from KUXPR03MB9665.apcprd03.prod.outlook.com
 ([fe80::8ca:d69a:ceac:a9ea]) by KUXPR03MB9665.apcprd03.prod.outlook.com
 ([fe80::8ca:d69a:ceac:a9ea%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 07:24:48 +0000
From: =?utf-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "westeri@kernel.org"
	<westeri@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "YehezkelShB@gmail.com"
	<YehezkelShB@gmail.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "sven@kernel.org" <sven@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "andreas.noever@gmail.com"
	<andreas.noever@gmail.com>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v2 5/7] thunderbolt: increase the lane adapter link-up
 timeout value
Thread-Topic: [PATCH v2 5/7] thunderbolt: increase the lane adapter link-up
 timeout value
Thread-Index: AQHdcQmeP7m5Fr2tyUeh+E2qDSEwvLcnYIaAgAKrMYA=
Date: Thu, 12 Nov 2026 07:24:48 +0000
Message-ID: <38328263f2308341b9026219a1e6c4925307407e.camel@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
	 <20261110114925.722014-6-chunfeng.yun@mediatek.com>
	 <20261110143933.GD259790@black.igk.intel.com>
In-Reply-To: <20261110143933.GD259790@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUXPR03MB9665:EE_|JH0PR03MB7448:EE_
x-ms-office365-filtering-correlation-id: 7c4a293d-5fdf-4774-72fe-08df408e08d8
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|23010399003|38070700021|261026140227099003|56012099006|261022105027099003|11063799006|4143699003|261021123027099003|10067099003|261022075727099003|261026121527099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: JZiUayX4IQT36teXV64vv53t+p7Mh6TWxNZ8QTzjg2orb8Uco+RvUtPvhh0gz7E9MZ2fXinlwq5MSRTBCCcCXrldcy6b/5an85UGvz9tP+MwKp3HQbHpsSM1QFfDKqQPmtSfw0B/bVNTj8aP4mYpvO8TyMVfpFCisY9Fo4pEKmH/iKtkGlgk7tyyzVP6+LTugCEPhB/dzj3TCadPbGjKL26VcFF50ZjeudBHefILDOmH625GQM22IQEwSpm0Un5v1AFrCn6ovXaMjSXtfgK39++jn2dDQbMZfAdM98/TQ6xDTfSkxjFyijjLDNZlAPVPvE4I1VSbuzaKyskj/Zv+bCfWn+muVcdbz38VjxcgwXz/tM5Nl2/dzGkty9+3Xlkcwm1UI6DL1FJhDZaVTwljzlSaLqqi2K5vl+AjI1UzNIR2O7D4XeetixHe8MGC/qOP0JqgZ+XBmRRJqFAAd+wIHIjAcEoro+YAZPLKUDZyH9dJVLdJyuyv8bqNWmwxDaVaF3PwQSHWKUp2FbfmszP2e7dcsWYrJU1PGdKw1R/uIfn0B75jewSrc+zAQZji93UKqqiCaNse/tQgdfdExGktkPZWf/3xHHEPHJIDqjKQUZQGniws4+bWuAVocK9D7M82BhNEUt3bH2xxUByK8QV1sBplw9OPI7pMaDQuFv5GAe6anhZYobxdpYjlv7Xpsl8rssmIqncLoGnOxTVz7bc5ip9qZSnWHhJgX0A7YNCLnwA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR03MB9665.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(38070700021)(261026140227099003)(56012099006)(261022105027099003)(11063799006)(4143699003)(261021123027099003)(10067099003)(261022075727099003)(261026121527099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWZPeWt6d1AxN0pIZjFwcGZLS0pHSUt1YzRnQmpNekJxUk8rTWNjNHlqRG1B?=
 =?utf-8?B?c2VaZzFqRysxMHVRbU94a1p3QnpUU1V5TWNWK2J0UXNrcTMyRFJGZlpsclFV?=
 =?utf-8?B?WWZ6TXJUcnBJRVhYbHBDV3VOdmw2azdpeDNCVEVjZnI1bmFHejBpYi9xY2hl?=
 =?utf-8?B?RGQySzVjS0p5T2w5bW1rMjFHQnd0bE1ES2w0T2NDOStFeE4yc0loYmJyZG9h?=
 =?utf-8?B?RFYyMkg5MDgwWWhKSnNVQzVISE5EQnAyUm5WMFZseE1SQmlJNmNtM0ZnbGw3?=
 =?utf-8?B?UmU1MlhUejY2WTBJS0Ewd1JsNHRxYTRuQmpKeU5XVkxEOGsvV2srWlN5bVFp?=
 =?utf-8?B?QldBZlluNEZJYXJOckdxcVowOUNySGIrUVFVM1QvUFNUZit6dW5hQnd0b09C?=
 =?utf-8?B?SDdlVDdkWjVKNitnN1dCeXV2cWQxYXdjU3hZQW9iOW5qMU9Xdkl4MlVRbnpC?=
 =?utf-8?B?OWU4dVJINUJXTC9sUHIzTWo2aS9VMURFMHVlUVJzeVhpWmVuZ1hKdnNNdm16?=
 =?utf-8?B?Y1FqeU0zcUkwT2x2MHJUWm5oV003aG9NUERHR0EzOVRvV0ZWc2NRWnFnTFVB?=
 =?utf-8?B?SFpTdlVNNnFyOXZoZC93MS95K3B1ZElUOG1oTHdRL3poTHA3bkpEZFpEUlBl?=
 =?utf-8?B?eDY2ekZ1aWZESUlwSmJxNS9RWXFSa0dXbWEwV3BuOGFXcFRLQnFSWjQxZ0U5?=
 =?utf-8?B?NmJEcEUycHBvWmRtSHVESzlWRnJiMHRKRzBQdGQ4VFFkYVVzUTZ5empkZkN2?=
 =?utf-8?B?czgzZXFicVpQSnhGeXdVcVErUXRKZWh1MkczdjE1b2NYcnpPUS9hb281UlJP?=
 =?utf-8?B?QTdGM1MwWXo4Myt5UGt1M3ZGY1Q1TDBzR2M3UENVbUNpdUhwcDRwS3pXL0s5?=
 =?utf-8?B?N1pLLzJXUjEyWU5uR1BpYTJiRW9ObStDY05WaTA5U3g0Qk5SN0VPdm1zamVG?=
 =?utf-8?B?SHRYN09QdmtwaUl6TWJyYWVxN2R6TW9NRjhXeHJPWGcyc25TYkQ1K0psZnBh?=
 =?utf-8?B?V3VBaFBBeVN4ZGwxdzg3bkZ1MG80ZWt0ZEtjaFk3U1JRTzJUUlM2TGMva0ZP?=
 =?utf-8?B?NkNKR3pEN3hTdTVLNHlxdTk5a3BLME1sSVF6aUVuS0NUVkdlYmF6R1hPTDh2?=
 =?utf-8?B?ZlF0VTV3T2srWHloY2NqYUlmVlliLzNzV2JTMEVhd3E5c2VCTnZlU0NuaGxq?=
 =?utf-8?B?K2xIN2s5SXZjYjJOSURvZkVQbEUzbVQrOE5MRGJIRFRLTjVJaE5qRjlUNTds?=
 =?utf-8?B?VmMwMDJnQWRTaFBVM0ZsazFycE9oZTF1N0JvQUU1bmNpdTNidGdRaTZwWmpa?=
 =?utf-8?B?a1BjZVBXcExQTjNZSktvOVorOFpFd3pnbys3WEJsMHVLY1Ezd2Z2aEd0YU5z?=
 =?utf-8?B?cXlWd0xrRlE0elB3N0l6WEFUNW5JQ0ZHY2EvR09RRENDcW9SeDQxSStNWXFE?=
 =?utf-8?B?TUYwS0xJN2NmaWRsU0JzbEprU0ZrRlpCTXc2MXk0UGl1OXVQa21aRW5NdXg3?=
 =?utf-8?B?aFlGL01ySnJIV1ZCOFl4UG82dCtzbS9ZRUNTMkhuR2MzQng2bWY2TWxJL0lk?=
 =?utf-8?B?dS9iN00zUkJBSmxrRW0xeHFhQ0l5QWNxdXBtd3MzTXBOZExRNmJuYVp0aEhj?=
 =?utf-8?B?WDJkb2lMZnZ2SVhUMDN3bjduaHdFQWZKVWtQa3JiL0NJeWhUVlBWUjFZZlJU?=
 =?utf-8?B?Q20rMmU5OEJkQWc3QTNGbXYzRUtCc04vSWtlYVh0Y2JISWZpSE1iby9hMTlQ?=
 =?utf-8?B?ek5zUENQMEpYa21WMWZtZUF6dWpWYVo4Yk52Qmk4aDhicU5OQldZcmlzeElF?=
 =?utf-8?B?ZDZSRWw4WVhqcXA3VXovYjhTenIxc3M2RUJKREZ6b25qbXlrb2w4NDV3eXhB?=
 =?utf-8?B?dHJaSEE5ZmVXYUgwYTlNQ3BZVkEwQVJPK3F3TEp3L1BrN1RUcGV6RmtueFBr?=
 =?utf-8?B?ejlWcGpscTNub3BZVXdnZlRFQ3NqeXJoUG0yQzJFczFwRWt1MEVCTnVtd2or?=
 =?utf-8?B?dFJVTTNHWlVzSkpobkJ3bi9Na2JGdzZRa1lYZW5lOGFzMldBbXRjZll6SFBq?=
 =?utf-8?B?MDhNNEtFSThKWGdsSGNZUXM4SnFheXJzTjUxVUl3andDWjNrWUxxYXhGekF0?=
 =?utf-8?B?OUlyMUxEVENsTHJtNUNWQ1kyenQ5N1FQRmpKZGVMNm1mT0tHZVBUZHpkMUp4?=
 =?utf-8?B?NlpERU5JamJiR2xSMldUZlY1bXc2YURpOTZUNkhXRGxzQmVZWHc1NDhUTlRz?=
 =?utf-8?B?Uk1HVE1SM0haN2RHWjEwMW8yLzgxVDkwWjc5a0w2KzAxcko1SlovN2xxSytu?=
 =?utf-8?B?ZHl5OU8yNzMzcmh5OE9qZXFDMi9KWFF4Q01nOG41U0dWTHF0YUpzZnBIZmtu?=
 =?utf-8?Q?SKwGYmE0gyG0apos=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63C58EBE11ABED499DADC1495B89B1DC@apcprd03.prod.outlook.com>
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
X-Exchange-RoutingPolicyChecked: lWNv9HAtIBY2URbLI3e+gI7rJS+gyzCdhzMLVKsNonsoxvGx4dI9qBgw2DqpbwQz5+5fDIB30wXRF3I00x3tVjsByCMt/RrJz+ZhSd8rnB4aEenwPCNzqTL6dS9rQMxvZnFZ2muL7+/f97gzA2bWo99A6vKMPm8Y+sdLvpfHXA6iQGsPpKr1CY9I77H0xF/uJGxKi+OJnKXeLFjGguhC+iTqnYeE4SMc3VrZq+r3DVCv+Yv1laIni8Aqzi/xNpsXP8AFixQ92A1450uLWoXH9JMe8e4M2pm/ZydwF0QpaSWmOJ/D8p+K9QgJuDtkQ1mx85oc6JEGFiP7DUvVh5//kQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUXPR03MB9665.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4a293d-5fdf-4774-72fe-08df408e08d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2026 07:24:48.7008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v/hVOOV+6qIV6JCJsxwJek2YAX6/tkkHL0vFPT3F8zZ53HACHyDh1tB2WLQzFZgXd2emKCJxZnr5038db56aE/XupXrba84KPzDN6FAXrQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7448
X-MTK: N

T24g5LqMLCAyMDI2LTExLTEwIGF0IDE1OjM5ICswMTAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
DQo+IE9uIFR1ZSwgTm92IDEwLCAyMDI2IGF0IDA3OjQ4OjUzUE0gKzA4MDAsIENodW5mZW5nIFl1
biB3cm90ZToNCj4gPiB3aGVuIHBsdWcgaW50byBhIFVTQjMgZGV2aWNlIGludG8gVVNCNCBodWIn
cyBkb3duc3RyZWFtIGZhY2luZyBwb3J0DQo+ID4gdG8gdHJpZ2dlciB1c2I0IGRyaXZlciB3YWtl
dXAsIGVuY291bnRlciB0aGUgbGFuZSBsaW5rIHVwIHRpbWVvdXQNCj4gDQo+IFVTQjQNCkFDSw0K
PiANCj4gPiBpc3N1ZSwgdGhlbiBjYXVzZSB1c2IzIGh1YiBkaXNjb25uZWN0Og0KPiANCj4gVVNC
Mw0KPiANCj4gRXZlcnl3aGVyZS4NCk9LDQo+IA0KPiA+IA0KPiA+IHVzYjRfaGkgTlZEQTgxMDA6
MDA6IDA6MTogZmFpbGVkIHRvIHJlYWNoIHN0YXRlIFRCX1BPUlRfVVAuDQo+ID4gSWdub3Jpbmcg
cG9ydC4uLg0KPiANCj4gV2hhdCdzIHVzYjRfaGk/DQpTb3JyeSwgZm9yZ2V0IHVwZGF0ZSBsb2dz
LCBpdCBpcyB0aGUgbG9nIGZyb20gdGhlIGRyYWZ0IHVzYjQgcGxhdGZvcm0NCmRyaXZlciB0byB0
ZXN0IGZ1bmN0aW9ucyB3aGljaCBjaGFuZ2UgdGhlIGRyaXZlciBuYW1lIGFzICd1c2I0X2hpJywN
Ckkgd2lsbCByZXByb2R1Y2UgaXQgYW5kIGdldCBuZXcgbG9ncy4NCg0KVGhhbmtzDQo+IA0KPiA+
IHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6MTogbG9zdCBkdXJpbmcgc3VzcGVuZCwgZGlzY29ubmVj
dGluZw0KPiA+IHVzYjRfaGkgTlZEQTgxMDA6MDA6IDA6NCA8LT4gMToyMCAoVVNCMyk6IGRlYWN0
aXZhdGluZw0KPiA+IHVzYjRfaGkgTlZEQTgxMDA6MDA6IGRlYWN0aXZhdGluZyBVU0IzIERvd24g
cGF0aCBmcm9tIDA6NCB0byAxOjIwDQo+ID4gdXNiNF9oaSBOVkRBODEwMDowMDogZGVhY3RpdmF0
aW5nIFVTQjMgVXAgcGF0aCBmcm9tIDE6MjAgdG8gMDo0DQo+ID4gLi4uDQo+ID4gdGh1bmRlcmJv
bHQgMC0xOiBkZXZpY2UgZGlzY29ubmVjdGVkDQo+ID4gdXNiIDItMTogVVNCIGRpc2Nvbm5lY3Qs
IGRldmljZSBudW1iZXIgMTANCj4gPiANCj4gPiBDb21wbGV0ZXMgbGluayB0cmFpbmluZyBhdCB+
MS40OHMgKHdpdGggdHdvIHJldGltZXIpIGFuZA0KPiA+IHRyYW5zaXRpb25zDQo+ID4gdG8gVEJf
UE9SVF9VUCBhZnRlciBjaGFuZ2UgdGhlIHRpbWVvdXQgdG8gMnM7DQo+ID4gDQo+ID4gSW4gdGhl
IFVTQjQgc3BlYywgUGhhc2UgNSAoTGluayBFcXVhbGl6YXRpb24pIGFsb25lIGlzIGFsbG93ZWQg
dXANCj4gPiB0bw0KPiA+IDEwMDAgbXMuIFdoZW4gYWRkIHRQaGFzZTJ+NCAoMjAwIG1zKSwgYW5k
IHJldGltZXIgdHJhbnNhY3Rpb24NCj4gPiBkZWxheXMNCj4gPiAodENtZFJlc3BvbnNlID0gNTAg
bXMpLCB0aGUgcGh5c2ljYWwgbGluayBpcyBhbGxvd2VkIGJ5IHNwZWMgdG8NCj4gPiB0YWtlDQo+
ID4gMTIwMCBtcyB0byAxNTAwIG1zKyB0byBjb21wbGV0ZSBpbml0aWFsaXphdGlvbi4NCj4gDQo+
IE9rYXkgdGhhdCBtYWtlcyBzZW5zZS4NCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogQ2h1bmZlbmcg
WXVuIDxjaHVuZmVuZy55dW5AbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IHYyOiBjaGFuZ2Ug
dGltZW91dCBmcm9tIDIuNXMgdG8gMnMNCj4gPiAtLS0NCj4gPiDCoGRyaXZlcnMvdGh1bmRlcmJv
bHQvc3dpdGNoLmMgfCA0ICsrLS0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdGh1bmRl
cmJvbHQvc3dpdGNoLmMNCj4gPiBiL2RyaXZlcnMvdGh1bmRlcmJvbHQvc3dpdGNoLmMNCj4gPiBp
bmRleCA3ZmYzZGE3OWRhNzYuLjdkYWVlODNjN2VkOCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L3RodW5kZXJib2x0L3N3aXRjaC5jDQo+ID4gKysrIGIvZHJpdmVycy90aHVuZGVyYm9sdC9zd2l0
Y2guYw0KPiA+IEBAIC00ODYsNyArNDg2LDcgQEAgaW50IHRiX3BvcnRfc3RhdGUoc3RydWN0IHRi
X3BvcnQgKnBvcnQpDQo+ID4gwqAgKiBAcG9ydDogUG9ydCB0byB3YWl0DQo+ID4gwqAgKiBAd2Fp
dF9pZl91bnBsdWdnZWQ6IFdhaXQgYWxzbyB3aGVuIHBvcnQgaXMgdW5wbHVnZ2VkDQo+ID4gwqAg
Kg0KPiA+IC0gKiBXYWl0IHVwIHRvIDEgc2Vjb25kIGZvciBhIHBvcnQgdG8gcmVhY2ggc3RhdGUg
VEJfUE9SVF9VUC4gSWYNCj4gPiArICogV2FpdCB1cCB0byAyIHNlY29uZHMgZm9yIGEgcG9ydCB0
byByZWFjaCBzdGF0ZSBUQl9QT1JUX1VQLiBJZg0KPiA+IMKgICogd2FpdF9pZl91bnBsdWdnZWQg
aXMgc2V0IHRoZW4gd2UgYWxzbyB3YWl0IGlmIHRoZSBwb3J0IGlzIGluDQo+ID4gc3RhdGUNCj4g
PiDCoCAqIFRCX1BPUlRfVU5QTFVHR0VEIChpdCB0YWtlcyBhIHdoaWxlIGZvciB0aGUgZGV2aWNl
IHRvIGJlDQo+ID4gcmVnaXN0ZXJlZCBhZnRlcg0KPiA+IMKgICogc3dpdGNoIHJlc3VtZSkuIE90
aGVyd2lzZSB3ZSBvbmx5IHdhaXQgaWYgYSBkZXZpY2UgaXMNCj4gPiByZWdpc3RlcmVkIGJ1dCB0
aGUgbGluaw0KPiA+IEBAIC01MDAsNyArNTAwLDcgQEAgaW50IHRiX3BvcnRfc3RhdGUoc3RydWN0
IHRiX3BvcnQgKnBvcnQpDQo+ID4gwqAgKi8NCj4gPiDCoGludCB0Yl93YWl0X2Zvcl9wb3J0KHN0
cnVjdCB0Yl9wb3J0ICpwb3J0LCBib29sIHdhaXRfaWZfdW5wbHVnZ2VkKQ0KPiA+IMKgew0KPiA+
IC0JaW50IHJldHJpZXMgPSAxMDsNCj4gPiArCWludCByZXRyaWVzID0gMjA7DQo+ID4gwqAJaW50
IHN0YXRlOw0KPiA+IMKgCWlmICghcG9ydC0+Y2FwX3BoeSkgew0KPiA+IMKgCQl0Yl9wb3J0X1dB
Uk4ocG9ydCwgImRvZXMgbm90IGhhdmUgUEhZXG4iKTsNCj4gPiAtLSANCj4gPiAyLjQ1LjINCg0K
