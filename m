Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769626C385;
	Fri, 16 Oct 2026 06:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792133059; cv=fail; b=uhbbhS9EUeMPsXbvCLKki1ug/jxiBcFPeMglnXTDWi3jUJPK7T6IBWjhXtnP68H4+Ncl447UzHRIW7xhQ0iNCCtUswb9PAt1xe3DNPfTlcWtI0XZRJDw/XGLWjj/vM1U5dE9d9Hx/W4PV5QhGCY7ujq2IhC4wEwPNNi5s0uaitc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792133059; c=relaxed/simple;
	bh=PHTntBnOMSwTh7VIHukB8lPaE2jc+ya+wtsk+GqabFk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PF8BUwKDAPs7qTmrqq1EdsXJPxSZG8WB2DkjV2A5jIRAef4lGtYwag609DKlFdN0mSc8j4VdUoL9zkzQuywkfQclGg7quCT1uPXVtXswgX9YJRGbETb0MWEmYkiny0aTTIamIodqQF3h1Mhbue9bS6kHzkR3pK7Q/U5AA8tEVBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=fjSZlYAJ; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=t9fr3nuI; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fjSZlYAJ";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="t9fr3nuI"
X-UUID: fd64e83ac92c11f1b1788b6acf885367-20261016
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From; bh=PHTntBnOMSwTh7VIHukB8lPaE2jc+ya+wtsk+GqabFk=;
	b=fjSZlYAJJJK/u7eN6d9yw7R/pJjZLO+RPZatkpmrLvMMIV+x6NsV/3oRTHD5ciQEukIlc0nkqJ67S7+uUqZnUwGNQB/SvCGs7HM066mCjtMcgD/ZbEoWSIePnKZ87CTaXsNGjSTcDzOzzd0bUYmgophgcsI3pTlXuc96402gsaM=;
X-CID-CACHE: Type:Local,Time:202610161444+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:72ecdbec-3014-4d84-a34f-39e2e99efcdd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:45796a95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: fd64e83ac92c11f1b1788b6acf885367-20261016
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 21328683; Fri, 16 Oct 2026 14:44:09 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Oct 2026 14:44:08 +0800
Received: from SG2PR04CU009.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 16 Oct 2026 14:44:07 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZDPGT/HvNh1xrP4F0BfDw+PQh3LkKrso9nn3iOHZoB8IyT8+pk8gybIdteu2zmA5f9d2rKWEGcC56B0r4WQWcHuVEMIP4fnaPqYgpx4PyDELC7jF526wQVoOhRBvVKNg+iYRmxJPfv/Pi/xCbLJpIiCT62/SZ/8woUoHKfrgI1Rot02aCX16Wzut+4/bQeFk74KRpHh5DHfzZb0b1rvtagE9fPyz/VTH5M0OukxjkCNL9xFCzHroMQYKhgu5eoz61vR+FCrgx+XwhDsEJQIISfhhb3ASuPo7DmKnl9eFdFlfHlKQ7ZSayuvUojvDC6U8BHQBcnRcVqmB2Ca2djGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PHTntBnOMSwTh7VIHukB8lPaE2jc+ya+wtsk+GqabFk=;
 b=ZRX81IudaifKEjTZ3eVlq0XNI1S5O2M4LqBYni12esJViFL2jEOy2pyXHRkm9+imm6A/ln9cm4toy8IbcwtsEICwZS+Z5zKwuL074tXV1b/c/n+j/Fu3JRTTqrXhkiTdnq3qzYWYNZMHk8IhO7R1Wbjx/9JDMYt0fyDRDbpmPjaByoRNa4/1okfDcdsJGw3iMzi+Vsmcct345KShNtJZmMx3P9vKNwGsSP5fF8PItT+A22ayKmZ5BQu6t3fuSEdCDXJmDKbD/xKK835QMzVfRHlVYCZFWv/cbTuplSJG4+VSNtGBF+1UtZw/I+dU9jPVshnG0cmBFIqhuh3JjD52Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PHTntBnOMSwTh7VIHukB8lPaE2jc+ya+wtsk+GqabFk=;
 b=t9fr3nuIHz4EUJqfq0bpUKqzd8zkuI7JV+0xg28CppIVxnMmwg4qo8unVCNID6OqLIk3puilFYR1znmkrH6oHHu/EEPVLoQle/mrEFy9jWQ9ZUVo0JUxqumi4l6HLuKLzDKqrxEuf9YOZUghCunM37LZKnXB68PLfcq+ECOQgrA=
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com (2603:1096:301:a3::12)
 by TY0PR03MB6725.apcprd03.prod.outlook.com (2603:1096:400:213::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Fri, 16 Oct
 2026 06:44:03 +0000
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1]) by PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1%3]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 06:44:03 +0000
From: =?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>
To: "krzk@kernel.org" <krzk@kernel.org>
CC: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	=?utf-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
	"ribalda@chromium.org" <ribalda@chromium.org>, "robh@kernel.org"
	<robh@kernel.org>, "fanwu01@zju.edu.cn" <fanwu01@zju.edu.cn>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"haoxiang_li2024@163.com" <haoxiang_li2024@163.com>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	=?utf-8?B?QW5kcmV3LUNUIENoZW4gKOmZs+aZuui/qik=?=
	<Andrew-CT.Chen@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	=?utf-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
	=?utf-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
	"rongqianfeng@vivo.com" <rongqianfeng@vivo.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"fshao@chromium.org" <fshao@chromium.org>, "kees@kernel.org"
	<kees@kernel.org>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"laurent.pinchart+renesas@ideasonboard.com"
	<laurent.pinchart+renesas@ideasonboard.com>, "tfiga@chromium.org"
	<tfiga@chromium.org>, "wenst@chromium.org" <wenst@chromium.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "hverkuil+cisco@kernel.org"
	<hverkuil+cisco@kernel.org>, "jacopo.mondi@ideasonboard.com"
	<jacopo.mondi@ideasonboard.com>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
Subject: Re: [PATCH v8 08/14] dt-bindings: media:
 mediatek,vcodec-subdev-decoder: Add MT8196
Thread-Topic: [PATCH v8 08/14] dt-bindings: media:
 mediatek,vcodec-subdev-decoder: Add MT8196
Thread-Index: AQHdWJKEgU+hiI3QpUeOSN93ao31bbb5qgCAgAYYUAA=
Date: Fri, 16 Oct 2026 06:44:03 +0000
Message-ID: <d6a5a210c1de1106f474bf6ceb28aded123b4775.camel@mediatek.com>
References: <cover.1791619742.git.kyrie.wu@mediatek.com>
	 <e756699a4be5b530338e373842365e6698ed066b.1791619743.git.kyrie.wu@mediatek.com>
	 <20261012-inquisitive-scallop-of-business-baeb1e@quoll>
In-Reply-To: <20261012-inquisitive-scallop-of-business-baeb1e@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6396:EE_|TY0PR03MB6725:EE_
x-ms-office365-filtering-correlation-id: 8e70f90a-9d6d-466a-9267-08df2b50de49
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|22082099003|10067099003|3023799007|18002099003|38070700021|4143699003|261009223027099003|56012099006|11063799006;
x-microsoft-antispam-message-info: DpaW3AmA/IXEEIojHLgOxeKHo0DEYhY4nsLilLJbYQvc3eplVToth7j9cb0IzlSdV/3DImwyhHYM+2fDN4Rq0MiSZIg471VzSrXs8WOvmmvluN6eLXT4BmfUWvkUoiWAeC/e1k/hbHG1CD7i4uBtZ07+5x+dZ7w1JANRjS6Tv2VeMGFxJicZDIGomhzHQGkC04EHLmlDWgDwzsDVYYRBMI0Q75qCqi5eTAKR7KdyY9lTCktoFWEad2Y3azmzubTQsqdXz7w5xYgoDFXg4OHbqfWBWlsKSEIjQ5FXPAxOR69daOJo78wt6dX24i+i7E/w0JblrWf8BjSlglAG4EW98A5C5VdwkVEiJo0XlIHlap0cnMsmtR3miKwNHUjb2AwLyrGy5sDYbEvbtR0Xj1fjnos7iZGVP2IEybTuSa3CNdHGj/vzdxqQ0tfUKsfD9goFlXrh7UUJ5yUD1MXdv4oHghC8gH64VwcYrk8laYw9oLDQ316bKRsWK+g4D0tj5DjsCfKg5ycJu8Com7zNNM54pa0XusXSRGtOT7mu1MkVovKUxorc4aezEutY1MyCSfadMNCb0OvR/X0yMJUAdpKtZn5pT1IyI2vldOsdp+KvtSDAINt1tfL6pLQPEbinqm5rAOnOH8Hg4nMcBwTLofiy1IJHcPqZKwiUcdKtZrPAFCHpo9mf/FZgelvQ5HQsGZoOvv8ajLx1CbeDBK0jI2yg5ONRY+ZDZrAPZWoNoxtVHuY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6396.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(22082099003)(10067099003)(3023799007)(18002099003)(38070700021)(4143699003)(261009223027099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDlycHExZC9Tb3U0WHZUei9zL29nVkNQeG5qUk54UHVxdWZhMHlPSGwxeTZi?=
 =?utf-8?B?Y1h0N2tGbk9uaURXdi80RWNXTlFQbGg3elB4S0E0aHNDQXB4cXdBcDI2TFNL?=
 =?utf-8?B?V1JZWWlFcTJuMFdKbytiMmhwRm5Qa3FzUHkyWnV5UkdQbWNQVkVBVWcwSTJy?=
 =?utf-8?B?L284Z3Nha3NRVFRITk1zQmdKbmZWdzArN2ZXdTZJdVoyS3BscXZ3T0dNUWhu?=
 =?utf-8?B?RGlUdEFxWThoTkxzTFVWamw0ZTRKYjR3K2UydWkzTU91RCtDMFYvNTVzaHFS?=
 =?utf-8?B?VmVGVStVZnhRZHkyRXZFSlhNa0J0TnNnUjl1Szd0S1JNcHoyTWJoVHljblBm?=
 =?utf-8?B?eFpSaDVlcjBrUC9SbG1KUnR5cjYwOW5sTWRBZG1vbmgwRmRIWi9GL1VlOVBj?=
 =?utf-8?B?N0dqSnFTYzA0dnlDbzBDUHNGUkVqdVl6eitvUGdLSlFMME1PRDAxTEkySGs4?=
 =?utf-8?B?d1lvZE9ic1dsVkEwN0ZTVE9NREt0ekZDZGtQTzVpVmh6clJFY25SZUI3b3Bk?=
 =?utf-8?B?NThtbHdLcEdBcjFyQUwxRDlpNzFJMkR6Z2RlZDJFbWgrOGp6Rkg3T2ZoN0Fk?=
 =?utf-8?B?ZjNRT2xqWWtSY0FXbFl0M1J2NFNISmVjWlRPTW1qR01LMGNqNWVSWlVEdWRr?=
 =?utf-8?B?a1BINWd0OFI5V0tGZlhWK1hlTGQxakd2NzI5Vk9Uam51QVpaa3ZzN2YvTjRq?=
 =?utf-8?B?ZnU4UGdpdkZ0SEJZTHJIK1daek4zbkwzdUFnVEE4Snk1VkxKZ016amdqTVV4?=
 =?utf-8?B?TG10OW1NeGpSUy9PblJqTWQ4d3JHUFpUekFwaUFPUUZwYjN6ME1BYk14SUIw?=
 =?utf-8?B?NzFja2hUbSt5ODNrOWl2emtQeTd2bHFkSENoZ2ZKT1J3a3ZzTmlhRnZteWF1?=
 =?utf-8?B?SEZmWm9uSloxVHNWUU04ZzJCNWtleE40a1ZIVjR5QkZUVkEwdTBMN054TWpL?=
 =?utf-8?B?SzNsZ0RWdVkzQmZ5RDUrNlI4UElUakdac0x0NGNjQTFzZzZFbFFjQ2h4QzFz?=
 =?utf-8?B?QU1kd1hwK245RG9NejZwblJzeXgzTWRoelhWb1lvOGJSdFhDZjRURFZjNUZI?=
 =?utf-8?B?aWJpV3l0d1F6MW0yNlVva0Q2WFEzUlN6TWI2ZjlLRFJ0VW9GUllCcHhMSVpJ?=
 =?utf-8?B?NHZJZ2xZbmtqSHRSVTc1M1lGWFZsV1c1QUFUSktJTnArY3lyNjZvV3lIRWhO?=
 =?utf-8?B?Q3MxQjU0Mzh6RS9UbWUrWU9DZjZTV0dsNFd1UUdUaXlJdmVhZmkxd3A1c1Nu?=
 =?utf-8?B?azByalpDK2dFSWpWRElReDh6ekxteUlzM0J6aisxcWMweXpmVDhrSjhWU2Ew?=
 =?utf-8?B?cjNrZVRpNmtUK3VOSU9rVjFreDRpL2VxMGdYRFBmNmVxQVEyV29LNjhacUxk?=
 =?utf-8?B?SjJXNmFxcG54Q3pNei9iNVB5NWxwRCtmT3BFRW1kaUQxb29ubnRpbDlLUVBa?=
 =?utf-8?B?a2xZcDZIaEhMcS9VN2xWR0k0VHpEZXdEVGFKU0lvYmZLVGVUTTExZDNDZFRN?=
 =?utf-8?B?M1l5d0tuWm5peGtjVE84dTRGRTN0aE9sSWF6VUNCajlTaDFTN3Z3aTVzYTZl?=
 =?utf-8?B?cmNkU0dodlJ4UG5jVjFRWWlmZW5QQVZYQ1IxeG5ia1JxK25Vd0xpckpGVHpE?=
 =?utf-8?B?a1M3VmdZcVNGVWhNSXhjSXNXeVZ5T3RWMzFuY2NPakpCUkVGblRkb2RySGIy?=
 =?utf-8?B?cWE2Wm52bGlHVG53K0liRzBRa0VHTnpwUzhhUDE0Zit0NWhUR0wwbGVaMDI3?=
 =?utf-8?B?YjE1bWp2TmMyN09tVTR0Skh0emRCdW4wK2ZzU1NMZmNLb1VXSzNLRk1zWkJU?=
 =?utf-8?B?cWozSXByNzRFY1VVTGFINkFheS92OHhMV2JveVlmQXpoUE0vdGlYcmxFcGty?=
 =?utf-8?B?dkovRFRjSFVFYWh0Z0pVbXpXaE5hay9qellMNFdtOEI0S285L2s0L2dMdVN4?=
 =?utf-8?B?WWd2Z2VrV1E4S1pFK01SckRUcG85Y29aK2l1dWs1dGVjZUNST1lDRHpPbUhk?=
 =?utf-8?B?RWxxUFBBYzBxMGRXVDNUM1J0TGgvU3FQVWdsODYyUzlab0twdVJrdkZwOEpn?=
 =?utf-8?B?N3B3bk02N0dKQ0xZV2NLdjVzZHFQVitlRXd1aWIyV3NXZ0ZvWUVaZDBRMGFR?=
 =?utf-8?B?RjlsYlFsaHJBU0Y0OHltWnVvMm91QmtNajI1YVhsaHhEbm5DNlVmRURPZ0tr?=
 =?utf-8?B?UnhjQ0lFL3lVOU84OStCVW43WTluOXcvWjFxSFd1Z0lvQkhSbDhxWFhPVGIw?=
 =?utf-8?B?THhqdEFMdW1DNkhrS0VyNnlJN09XMzFLL1dCUzYwVEVzUUUyNTBFNmozTDMr?=
 =?utf-8?B?NnlZVXE0ODJhYXRGQ293aTBGMGFGS0hnSXlOQTFkeEdpUTdvd0E1Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <18D43B5EAEC2CF46ACD339FC9583D4AD@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: b4TxBmAemZQzPXxnEXc6Lr12Tn5aCYTd3cZeVdjhzfchBUx7WPb6bPteZiU6TW58QaRFxLGnAEnqTIDwcum0hJSo/UQ5DUUb+lg+bkMgUNsxQSVELUafl00ovUsWh2qfnuYbQUeIbRAB4AZWqG4mrMwXTs6F75TYlLNInPbH3XronhMEuEzuA8vgRXGu4ByAK7nVSgdkRtQe0/fHcMBJOHLW317vBQR70UXxPPmlPBH/3JJALeKHUQh9CsfPvu2n/Bc8wlVvGp3Gl5qkvPVYb9z6cI8Gb4Cvxye3ZCKPedcsCdE0lZhV8uxh3MqYNGlm6sGOidIwf+5T7TzMi/ciWQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6396.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e70f90a-9d6d-466a-9267-08df2b50de49
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2026 06:44:03.6569
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ow0Sj8ld3bFJqHMDoY7waoH8O+cBX3dB40jId0ItSUcNlffMEs2aRK4H6a29ynjoxTK+P3SLc401whKt2l8nKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB6725
X-MTK: N

T24gTW9uLCAyMDI2LTEwLTEyIGF0IDExOjM5ICswMjAwLCBLcnp5c3p0b2YgS296bG93c2tpIHdy
b3RlOg0KPiBPbiBTYXQsIE9jdCAxMCwgMjAyNiBhdCAwNDozNjowN1BNICswODAwLCBLeXJpZSBX
dSB3cm90ZToNCj4gPiBDb21wYXJlZCB0byBwcmV2aW91cyBJQ3MsIHRoZSBNVDgxOTYgc3VwcG9y
dHMgYSAxMC1iaXQgZGVjb2Rlcg0KPiA+IGFuZCBoYXMgYSBkZWNvZGluZyBjYXBhYmlsaXR5IG9m
IDRLQDEyMGZwcy4gSXQgYWxzbyBzdXBwb3J0cw0KPiA+IDM2LWJpdCBEUkFNIElPVkEgYWRkcmVz
cyBhbmQgVmlkZW8gUG93ZXIgQ29udHJvbCB0byBvcHRpbWl6ZQ0KPiA+IGJhbmR3aWR0aCBhbmQg
dm9sdGFnZSB1c2FnZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBLeXJpZSBXdSA8a3lyaWUu
d3VAbWVkaWF0ZWsuY29tPg0KPiA+IEFja2VkLWJ5OiBOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFz
LmR1ZnJlc25lQGNvbGxhYm9yYS5jb20+DQo+ID4gLS0tDQo+ID4gwqAuLi4vbWVkaWEvbWVkaWF0
ZWssdmNvZGVjLXN1YmRldi1kZWNvZGVyLnlhbWwgfCA0OQ0KPiA+ICsrKysrKysrKysrKysrKysr
Ky0NCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
DQo+IA0KPiANCj4gSG9uZXN0bHksIEkgc2VlIHJhbmRvbSBhcHByb2FjaCB5b3VyIHBhdGNoZXMg
dmlzaWJsZSBpbiBob3cNCj4gaW5jb25zaXN0ZW50bHkgeW91IHVzZSBzdWJqZWN0IHByZWZpeGVz
Lg0KPiANCj4gV2hlcmUgZGlkIHlvdSBkZXNjcmliZSBSRUFTT04gdG8gZHJvcCB0aGUgdGFnPw0K
PiANCj4gDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy1zdWJkZXYtDQo+ID4gZGVjb2Rlci55
YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0
ZWssdmNvZGVjLXN1YmRldi0NCj4gPiBkZWNvZGVyLnlhbWwNCj4gPiBpbmRleCBkMWQyMDljYi4u
ZDhmMjVjY2QgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL21lZGlhdGVrLHZjb2RlYy0NCj4gPiBzdWJkZXYtZGVjb2Rlci55YW1sDQo+ID4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLHZj
b2RlYy0NCj4gPiBzdWJkZXYtZGVjb2Rlci55YW1sDQo+ID4gQEAgLTc2LDYgKzc2LDcgQEAgcHJv
cGVydGllczoNCj4gPiDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayxtdDgxODYtdmNvZGVjLWRlYw0K
PiA+IMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ODE4OC12Y29kZWMtZGVjDQo+ID4gwqDCoMKg
wqDCoMKgIC0gbWVkaWF0ZWssbXQ4MTk1LXZjb2RlYy1kZWMNCj4gPiArwqDCoMKgwqDCoCAtIG1l
ZGlhdGVrLG10ODE5Ni12Y29kZWMtZGVjDQo+ID4gwqANCj4gPiDCoMKgIHJlZzoNCj4gPiDCoMKg
wqDCoCBtaW5JdGVtczogMQ0KPiA+IEBAIC05Niw2ICs5NywxMSBAQCBwcm9wZXJ0aWVzOg0KPiA+
IMKgwqDCoMKgwqDCoCBUaGUgbm9kZSBvZiBzeXN0ZW0gY29udHJvbCBwcm9jZXNzb3IgKFNDUCks
IHVzaW5nDQo+ID4gwqDCoMKgwqDCoMKgIHRoZSByZW1vdGVwcm9jICYgcnBtc2cgZnJhbWV3b3Jr
Lg0KPiA+IMKgDQo+ID4gK8KgIG1lZGlhdGVrLHZjcDoNCj4gPiArwqDCoMKgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUNCj4gPiArwqDCoMKgIGRlc2NyaXB0
aW9uOiBQaGFuZGxlIHRvIHRoZSBWaWRlbyBDb21wYW5pb24gUHJvY2Vzc29yIChWQ1ApDQo+ID4g
dGhhdCBydW5zIHRoZQ0KPiA+ICvCoMKgwqDCoMKgIHZpZGVvIGRlY29kZXIgZmlybXdhcmUuDQo+
ID4gKw0KPiA+IMKgwqAgIiNhZGRyZXNzLWNlbGxzIjoNCj4gPiDCoMKgwqDCoCBjb25zdDogMg0K
PiA+IMKgDQo+ID4gQEAgLTE2Myw3ICsxNjksNiBAQCByZXF1aXJlZDoNCj4gPiDCoMKgIC0gY29t
cGF0aWJsZQ0KPiA+IMKgwqAgLSByZWcNCj4gPiDCoMKgIC0gaW9tbXVzDQo+ID4gLcKgIC0gbWVk
aWF0ZWssc2NwDQo+ID4gwqDCoCAtIHJhbmdlcw0KPiA+IMKgDQo+ID4gwqBpZjoNCj4gPiBAQCAt
MTc5LDYgKzE4NCw0OCBAQCB0aGVuOg0KPiA+IMKgwqDCoMKgIC0gaW50ZXJydXB0cw0KPiA+IMKg
DQo+ID4gwqBhbGxPZjoNCj4gPiArwqAgLSBpZjoNCj4gPiArwqDCoMKgwqDCoCBwcm9wZXJ0aWVz
Og0KPiA+ICvCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlOg0KPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqAgY29udGFpbnM6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Q6IG1lZGlhdGVr
LG10ODE5Ni12Y29kZWMtZGVjDQo+ID4gKw0KPiA+ICvCoMKgwqAgdGhlbjoNCj4gPiArwqDCoMKg
wqDCoCByZXF1aXJlZDoNCj4gPiArwqDCoMKgwqDCoMKgwqAgLSBtZWRpYXRlayx2Y3ANCj4gPiAr
DQo+ID4gK8KgwqDCoMKgwqAgcHJvcGVydGllczoNCj4gPiArwqDCoMKgwqDCoMKgwqAgbWVkaWF0
ZWssc2NwOiBmYWxzZQ0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoCBwYXR0ZXJuUHJvcGVydGllczoN
Cj4gPiArwqDCoMKgwqDCoMKgwqAgJ152aWRlby1jb2RlY0BbMC05YS1mXSskJzoNCj4gPiArwqDC
oMKgwqDCoMKgwqDCoMKgIHByb3BlcnRpZXM6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Y29tcGF0aWJsZToNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZW51bToNCj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gbWVkaWF0ZWssbXRrLXZjb2RlYy1jb3Jl
DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIG1lZGlhdGVrLG10ay12Y29k
ZWMtbGF0DQo+ID4gKw0KPiANCj4gTWlzc2luZyBjb25zdHJhaW50cyBmb3IgY2xvY2tzDQo+IA0K
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsb2NrLW5hbWVzOg0KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpdGVtczoNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0gY29uc3Q6IHNlbA0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBj
b25zdDogdmRlYw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDog
bGF0DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiB0b3ANCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KSGkgS3J6eXN6dG9mLA0KDQpJIGRp
ZCBub3QgZXhwbGFpbiB3aHkgbWVkaWF0ZWssc2NwIHdhcyByZW1vdmVkIGZyb20gdGhlDQpjb21t
b24gcmVxdWlyZWQgbGlzdC4gTVQ4MTk2IHVzZXMgbWVkaWF0ZWssdmNwLCB3aGlsZSB0aGUgb2xk
ZXIgU29Dcw0Kc3RpbGwgcmVxdWlyZSBtZWRpYXRlayxzY3AuIEkgd2lsbCBkZXNjcmliZSB0aGlz
IGV4cGxpY2l0bHkgaW4gdGhlIHY5DQpjb21taXQgbWVzc2FnZS4NCg0KSSB3aWxsIGFsc28gY2hh
bmdlIHRoZSBzdWJqZWN0IHRvOg0KDQogIG1lZGlhOiBkdC1iaW5kaW5nczogbWVkaWF0ZWssdmNv
ZGVjLXN1YmRldi1kZWNvZGVyOiBBZGQgTVQ4MTk2DQoNCmFuZCBjb25zdHJhaW4gdGhlIE1UODE5
NiBjaGlsZC1ub2RlIGNsb2NrcyBhcnJheSB0byBleGFjdGx5IGZvdXINCmVudHJpZXMgYnkgYWRk
aW5nIG1heEl0ZW1zOiA0LCBtYXRjaGluZyB0aGUgZm91ciBjbG9jay1uYW1lcy4NCg0KVGhhbmsg
eW91IGZvciB0aGUgcmV2aWV3Lg0KDQpCZXN0IHJlZ2FyZHMsDQpLeXJpZQ0KDQo=
