Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040813DE43B;
	Sat, 10 Oct 2026 06:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=60.244.123.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791613694; cv=fail; b=fcyFjdlC3s9HB/riG2wIYbC1cx32iOADQgHh0mS6fBgD8UC4Lr3n78Zub0dMNi7pQKOOUys/zBIH+uXzHDMEd4sKtO5EBnKIgAlN3g6kR03APRpUtZnr7Z6DGA9Yt2Wsgc83pOpQFmiWLuwtGGANGKsBSnN8HSo3SIglXT207YU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791613694; c=relaxed/simple;
	bh=CeYvMId7psCxcioouuL3p27VVSigA/mwJ5pGErR09jM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mqWfeO7Mb5G2llO/uwssl95qWfog6ArOnZk7GKLXFGDo/nqTqE2aaXZNAO1J6djg9IKy3ULEV37w0eRiKigBT+GrBdlh916n9nKMLXv6uCioRcfKWkP6IhtvfyOHiBB5IG2Xc5sdUpcOj+6IYM1TCyFu35STe6Jf6Gv5V0chRXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=bYPToxFp; dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b=mWByxOVm; arc=fail smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bYPToxFp";
	dkim=pass (1024-bit key) header.d=mediateko365.onmicrosoft.com header.i=@mediateko365.onmicrosoft.com header.b="mWByxOVm"
X-UUID: bb6e047ec47311f1b1788b6acf885367-20261010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:To:From; bh=CeYvMId7psCxcioouuL3p27VVSigA/mwJ5pGErR09jM=;
	b=bYPToxFpbMcXpInXBv5M4Zlo7YKBrcRvd0osxx/q0SQjIkXuNIkoiYiK5+MO7iCRq61FMNrwdCfCL7dORcCgv4h0WA17ZV+yxurLsGNjweduFIypC6iaZdEC+mrePadahhUr9b0or2fBxzqDsVKmDUGsmR8KUM4GHLEpAauJMBA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:2021a521-1f0b-4bc9-9eda-56153a2cc4cd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:291e20b,CLOUDID:e1f02d95-3103-4fdb-b79c-08de0e281a5d,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-
	1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bb6e047ec47311f1b1788b6acf885367-20261010
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 260575892; Sat, 10 Oct 2026 14:27:57 +0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 10 Oct 2026 14:27:56 +0800
Received: from SI4PR04CU001.outbound.protection.outlook.com (172.21.101.237)
 by mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Sat, 10 Oct 2026 14:27:56 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W63jxruZuvHyH73NuQQtUBXOyBOls0l+0peXjL749tBfzQDZ/FvIHoagyiOKPd+cT+XWzrHiwNrOtar0IlOBEkDai6vEFEWKeaD9nhMNQ+sArRIuChMoL/PSNlXbuKf4mZGp11whiJ/UqLQNUI9nbGI2OfoRljTfj5hvI85Z28K6zRQtjQrfhwzD9My/SPd4tMjW0XwgqLsEFvTGncIQnxyOMCk/EDF7wcTZbq99qaWP8l7yj3QLLpu38q7Rl+5JWwjjGEFxKPqjWX5pUuAxTIqkJWV1Mhq9noAFvNaegZZP3pT+LicRtVc01u7DKZfMLuEgbXH52owFlDCUFWsjlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CeYvMId7psCxcioouuL3p27VVSigA/mwJ5pGErR09jM=;
 b=HaCzWuhX26CVcOzeMXyHVmQgOvonS7B7ZZqPStxf1A0MWiUGVePcR6RokGAorh6yhMy2Nh6gD3F9ONcZDQNlkJ+9PpAfyZtDxhbqs1MvSROMLEtAEZfEGtpcPPhoswmbiyoTR0G0NFFUa5KexMPmnrTgZPFc8Krx0TCtn/UUNW45l5R/FRRyRAApopi0GFl8v4mpRVippnvrljRXiY+uSnMxAAnksxgErBWxYsBLOOaZSOveYkjuR/Me3jpqJB/+WigHWn/LoKvq5Dys2VDENVynri9+ALWrjz9sGS8xk6seuBEahgJgBiBxkmiSqtf/TzYtH6p/bWTZS/6UiCUuYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mediatek.com; dmarc=pass action=none header.from=mediatek.com;
 dkim=pass header.d=mediatek.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mediateko365.onmicrosoft.com; s=selector2-mediateko365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CeYvMId7psCxcioouuL3p27VVSigA/mwJ5pGErR09jM=;
 b=mWByxOVmqUE2XZ23yT2/zLTHJ0768kDkHAxX8vvX4CN9FPH6o8YU1eCuBF9iesRP8Q5zix5Xoh73I42PILBQ3XjUZyu4u3qZRcmhkh7JVin2NOX4v2GSr6KPyh/m5mvxgKsWtTO9JCqOSNw9XycdLFtoE9odM7i5TOv8c3KRwqg=
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com (2603:1096:301:a3::12)
 by SEYPR03MB6723.apcprd03.prod.outlook.com (2603:1096:101:69::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 10 Oct
 2026 06:27:51 +0000
Received: from PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1]) by PSAPR03MB6396.apcprd03.prod.outlook.com
 ([fe80::dba:9b76:9fde:3ab1%3]) with mapi id 15.21.0496.018; Sat, 10 Oct 2026
 06:27:50 +0000
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
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	=?utf-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "kyrie.wu@mediatek.corp-partner.google.com"
	<kyrie.wu@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v17 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Thread-Topic: [PATCH v17 05/12] media: mediatek: jpeg: Fix multi-core clk
 suspend and resume setting
Thread-Index: AQHdSnMVjEpZplO67ESjl+zzT3LEQ7baeUmAgBvyvIA=
Date: Sat, 10 Oct 2026 06:27:49 +0000
Message-ID: <7bd7a5c8592d37a1aba98e93c44d0d3d011ea3e8.camel@mediatek.com>
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
	 <20260922091530.241762-6-kyrie.wu@mediatek.com>
	 <8df54405-811e-47ac-94a2-7cf0873c066a@collabora.com>
In-Reply-To: <8df54405-811e-47ac-94a2-7cf0873c066a@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mediatek.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PSAPR03MB6396:EE_|SEYPR03MB6723:EE_
x-ms-office365-filtering-correlation-id: 78ae16eb-04ec-425c-48e0-08df26979b6b
x-ld-processed: a7687ede-7a6b-4ef6-bace-642f677fbe31,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|261009223027099003|38070700021|921020|11063799006|10067099003|56012099006|18002099003|22082099003|4143699003;
x-microsoft-antispam-message-info: aSwySDsse9kbDCS/Qv5H1/E0eVDyWYAy4AneInhNIdnb72OPUPu3cLSmzUBCwhfRVC5e/b93XyQkiH4+4q5Tu/IipFDZXH+lGrrr3iP7sWKGVhnVKOV1ClCYLDCOxk04epyk38BCSdNewzDvLX2jKXQE41T4UGjCnhy00cWhVgkv9oUxlaaslghKVUPFLjjcOVhMnC4cNXoaL/2yysVvy6CPkoyfzvhpKiHTqIkMZOrp9zLUMISZXXBaNW26EAfmGIcyLUiEIPti13XrsFgFFG6Dr/fyaiEn68ARu7roRKk1J54JUnu+mZe8n44RGQH+c9n7GFZZfTsMzmZi3m7DOl6H25arMbtA5UthswIUxqoRePCHQQOIrQtBgJcj1cDX1aIYghCvSe4zKVeLtWy5+oEuBGVj/l2M3S7pubR7qPgCyZEMMRly2oMbZEJiu+T2/k8ScgAkGe11GHd/8k99t0LRE/Z/TOMQ3IiU1uh6CwjnkMkaiK1vksRk6keTCbtKC55hTGHuk7Ibfc42CXc1hBjFTiR4o/1xGn+eRg/LVnW7bMivFQkDyaJZtZWyhd6M5gO7xBchHAOQmY4UtWRDEMIoGtrDlCrwSLaKENR8UBPcUtRjQ5XkT89ZnuwNcmGeHBx24YwzlSdoynt8MHu17oA/ws5jRtrQDAk6HvEpGVXguW8WQqZ23m5dufkD7jATjpp97LfBSQlEKF00u9lwVUtNINb79WkDPZl9/wxMNUwTP5XFjwcnATsWOoUelxtv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PSAPR03MB6396.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(261009223027099003)(38070700021)(921020)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnRJbTZOaSszQjlPd1BzTTd2TU1kcWIvem1tYmNxVXFPN3RQcUhvdDZZRVRi?=
 =?utf-8?B?NzFtd2IydlpmTG1Jd1VMUktxV294clhJRlN3OVArWUF3SzBPN1ZWR1I4eFVP?=
 =?utf-8?B?c29MWi90ZTNtQlZpUW9mbFhBTk5wYTdrdXIyNmhlVlJKbmZaZkRsaUgzR2FO?=
 =?utf-8?B?WlYwSDNZZG42cS9wOVo0SWNJaUhuTURIRmpTRkRNRFhlV2RhRnQvVEYzVDN3?=
 =?utf-8?B?NEJSY0l3Z0hSWVl6N1F6SStLVFJyekxmSDVKaWJZamhuNFdCams3Rm1oenFo?=
 =?utf-8?B?WS82cVNwK2V1bHU1aHdrbElOSG1EUU91L1VNN294YlJpVTl2emo3N093SE1U?=
 =?utf-8?B?SkFsaHVwMTVGbEtIQW9PU1RwdTFJcGlzVzhIaUp6ZnlaNUVNM2g2dE5NWlp6?=
 =?utf-8?B?QWwzMmhTelZvOGx4L2h2UnMzRXBLSFFwNEN6dktSaVNsbWUydnpHTGd2R1h4?=
 =?utf-8?B?VjN2M0pvdzJSTnp2dWdHSU16NDdxU2s3Zk5wNURIVTR0cm1MZlZXanpyU1Zt?=
 =?utf-8?B?ZTRsMjFERlZQOU1CWmVPVlV1NlZ0d1pKM2ptWlA3Q0czR3hEcGFNMFhDdXkr?=
 =?utf-8?B?ZWdIMjZJS3hmK3FlY0h3YWF6ajZjYzBVMmJJdjk5T0FGRHRZNVdPY3NISmhm?=
 =?utf-8?B?ZmhYdkdKZjVJaGxuN1BKZzdJSk0wbUN2dEUxaFNMQkkwZE0xc2F0V1Nrb2Za?=
 =?utf-8?B?SCthTktyT0NabWRncHhkbzdzZUI2bEpidFNFRTFFZXVyaWxKOE1XYW9ZRWpC?=
 =?utf-8?B?eVBCK0oxblZyVUx0SDU5UGZnZzBTNXhIbmd3ckZWcE91QmNQL1dBWDVjTDlH?=
 =?utf-8?B?RUNmYTZ0MW14a0dPK3ZNU3I0UTArSzFyYjBySUZOUU1qOU5VRk4xOExpZFpB?=
 =?utf-8?B?QjA0cUYzcHNBNk9razRUelZkdGxMeGVrcTBZb1ZVQzd2ajFneHZiS1BhM09Z?=
 =?utf-8?B?WjdpR0tuZzlUdXpTRWExL09EM25sdHAzdmdTL25sbnRJMlpNNWZDQm54VGh5?=
 =?utf-8?B?a2l3MWNZaXpWRnJlMGpTME9VeVIvMW5haUNDWTk5cnorTFNkcGpqeTFzZmlk?=
 =?utf-8?B?bjdmUm43RllSZjltM2hWalV0dnlYTFVtNGR3ZUdoaCt6MnRQZm1oOGhzTWhE?=
 =?utf-8?B?bEx1TTZJNnd5QSsySzk2Y1AyZEpaaklhUHRHK2ZJMVZGeVFmeDFMSnZmK2JY?=
 =?utf-8?B?UG9xaWl6MWo2RCt0dnhvZk9tbGgrZURvV0VLbWpYNStqRWZnbFVFYnhPNmJD?=
 =?utf-8?B?eUFQQVVUSzdwOG5iOVYwUXJDbHJWcUYrdWM3enMvY3JKRzhJaWcyZDZxOVpW?=
 =?utf-8?B?QUZ5RXNEUjZUdjVGSlhDRmdVeldPSWdDbCswR0FWYUtDSnJoNzM3MXdjUHFm?=
 =?utf-8?B?QjR1UzlmNC9aU05XekJSeDNCbjk3UjNQRUpJLytpSnFVay9lWkkxYzZvRkxI?=
 =?utf-8?B?TEFFV1J5MGU4OVBwR2I2WmdMSS9xZ0ptaUFiai84eVczNUFzbmNRT25CdUJ1?=
 =?utf-8?B?ZE03TlU1ekZVazlzRnZDa0tNc2pmYzl1MXdud21wZDJ1V2hsRDlmejFUSUg2?=
 =?utf-8?B?eWhFTGI5VVVUTG4wOXdJS0VxS0FUSWtFVDhiMGxkd0dkZnVvVUdIMnNab0Nr?=
 =?utf-8?B?bS8wcTBsbVZZR3JKdlF3WGhlenVwa0FoR1d0dlViVXBqMmV2TmRzQ3E0THdj?=
 =?utf-8?B?TURrdEhGRjVIZmUxdzRBMGQ0RDZYWkUvRk94R2dmVXFhK3NqWjZzNGxOVEdS?=
 =?utf-8?B?TVZCREpxWnFUYTFiYWlIM1JwcW0wK2Zsa3BvbWU0Z2NZak1MS0ZjdzYvTVdj?=
 =?utf-8?B?SjllU3lzaEgyK0ZWdG1NdHZUWElFNE5QSnpLU3hMcTJZc2prendQb1BkaFoz?=
 =?utf-8?B?ejNvd2dvZ0RUWWtBcDB1WFBGcFFtTWdVbkhyZE9DaWZiR3lGYWRqRlQwdHJL?=
 =?utf-8?B?RHhJNXVuZ3B2QUtSVkd2TWNITUxFcUJOb3ZzQ3Uva2F0RVYwN0pzV0ZwbHdm?=
 =?utf-8?B?T0NJZnF0ZFF1eFNUZ2UvYlNzd2tkVVIyV2NsWHFKd1dvbWZZTlFEdEd6ck5V?=
 =?utf-8?B?QlFwb3BGenhoeCtTNnVUZ1A3U0dUdkdlSEwrWGF6NGg5cS9kTjVFYlkrK1R5?=
 =?utf-8?B?Q1VFUWF0YTNTd0tVV1dTbG5qMlNYbU04dE4yR1d3bURLR2lYZThjUVJVc1J2?=
 =?utf-8?B?MkMrQjNGd1NPOGVwMXIzWTNZRG1YM0dRd0p1YTUxSnBaYTJvUHJtRG9pY0pm?=
 =?utf-8?B?cmZWMFM0M2JxQmt3K3lDSXo0b2k4RnA4dkhEemVDdytEWWl2RG9tQ0ZMYkwy?=
 =?utf-8?B?Rlp5NDJZM2dUNFJKZitZblVITm9adEdDZEtHSkRKelZKODZ5OEc1UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7856FD1DF8E36C4F9094F3B45FE3D913@apcprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: oH7qQe2b7KBk7547BqJnHwQ4EHwqEojlKV00dx1vYFE/MvGhv0rcEZrimll+/dy9s3mS1aF+TzkrjeL0A50ddSPxJgdAFq06DIHnTAT1rFj1Tc2uzSyy2WKtFwX9PnvtbsmlF3vkLOOWO8Z3WiTdTyR9rAP5g2zzKjaUjjY/iKPIsYJSz0L1nUJIZTlRqum8SL3OHVgopBZgBR761aKcGXep45jtE09uRHOwhM2ARiLRLWAgLE8zbccMrZvDo3nNB+rVXHuAa2mhpTxEmUzVmkn0YtqG/ZrsQJ4RFC//Bji4qSfGazzDTW7D/p1Ua8jO4dYdWnRuUkTvDx/IixN/hg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PSAPR03MB6396.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78ae16eb-04ec-425c-48e0-08df26979b6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 06:27:49.9091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a7687ede-7a6b-4ef6-bace-642f677fbe31
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8RH4DjYU5PsWhBbbNBeZO8i4cDj0bZSLIo7C+/c99choYfhwTryGVU0SodDin2AdlJ2mDlnrkmeRPs/p2N+XEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB6723
X-MTK: N

T24gVHVlLCAyMDI2LTA5LTIyIGF0IDEzOjM5ICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gT24gOS8yMi8yNiAxMToxNSwgS3lyaWUgV3Ugd3JvdGU6DQo+ID4gVGhl
IHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrIGZ1bmN0aW9uIGlzIGRlZmluZWQgaW4gdGhlIGRldl9w
bV9vcHMNCj4gPiBzdHJ1Y3R1cmUsIHdoaWNoIGlzIGRlZmluZWQgaW4gcGxhdGZvcm1fZHJpdmVy
LiBGb3IgbXVsdGlwbGUtY29yZQ0KPiA+IGFyY2hpdGVjdHVyZSwgZWFjaCBoYXJkd2FyZSBkcml2
ZXIgd2lsbCByZWdpc3RlciBhIHBsYXRmb3JtX2RyaXZlcg0KPiA+IHN0cnVjdHVyZSwgc28gaXQg
aXMgbmVjZXNzYXJ5IHRvIGFkZCBhIHN1c3BlbmQvcmVzdW1lIGNhbGxiYWNrDQo+ID4gZnVuY3Rp
b24gZm9yIGVhY2ggaGFyZHdhcmUgdG8gc3VwcG9ydCB0aGlzIG9wZXJhdGlvbi4NCj4gPiANCj4g
PiBGaXhlczogOTM0ZThiY2NhYzk1ICgibXRrLWpwZWdlbmM6IHN1cHBvcnQganBlZ2VuYyBtdWx0
aS1oYXJkd2FyZSIpDQo+ID4gRml4ZXM6IDBmYTQ5ZGY0MjIyZiAoIm1lZGlhOiBtdGstanBlZ2Rl
Yzogc3VwcG9ydCBqcGVnZGVjIG11bHRpLQ0KPiA+IGhhcmR3YXJlIikNCj4gPiBTaWduZWQtb2Zm
LWJ5OiBLeXJpZSBXdSA8a3lyaWUud3VAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+IMKgIC4u
Li9wbGF0Zm9ybS9tZWRpYXRlay9qcGVnL210a19qcGVnX2NvcmUuY8KgwqDCoCB8IDI4ICsrKy0t
LS0tLS0NCj4gPiDCoCAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19kZWNfaHcu
Y8KgIHwgNTUNCj4gPiArKysrKysrKysrKysrKysrKy0tDQo+ID4gwqAgLi4uL3BsYXRmb3JtL21l
ZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmPCoCB8IDUzDQo+ID4gKysrKysrKysrKysrKysr
Ky0tDQo+ID4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAxMDcgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRp
b25zKC0pDQo+ID4gDQo+IA0KPiAuLnNuaXAuLg0KPiANCj4gPiBAQCAtNjczLDExICs2NjksNTgg
QEAgc3RhdGljIGludCBtdGtfanBlZ2RlY19od19wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ID4gwqDCoAlyZXR1cm4gMDsNCj4gPiDCoCB9DQo+ID4gwqAgDQo+ID4g
K3N0YXRpYyBpbnQgbXRrX2pwZWdkZWNfcG1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+
ID4gK3sNCj4gPiArCXN0cnVjdCBtdGtfanBlZ2RlY19jb21wX2RldiAqanBlZyA9IGRldl9nZXRf
ZHJ2ZGF0YShkZXYpOw0KPiA+ICsNCj4gPiArCWNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKGpw
ZWctPmpkZWNfY2xrLmNsa19udW0sDQo+ID4gKwkJCQnCoMKgIGpwZWctPmpkZWNfY2xrLmNsa3Mp
Ow0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50
IG10a19qcGVnZGVjX3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+ID4gK3sNCj4gPiAr
CXN0cnVjdCBtdGtfanBlZ2RlY19jb21wX2RldiAqanBlZyA9IGRldl9nZXRfZHJ2ZGF0YShkZXYp
Ow0KPiA+ICsNCj4gPiArCXJldHVybiBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShqcGVnLT5qZGVj
X2Nsay5jbGtfbnVtLA0KPiA+ICsJCQkJwqDCoMKgwqDCoMKgIGpwZWctPmpkZWNfY2xrLmNsa3Mp
Ow0KPiA+ICt9DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IG10a19qcGVnZGVjX3N1c3BlbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgbXRrX2pwZWdkZWNfY29tcF9k
ZXYgKmpwZWcgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArDQo+ID4gKwl2NGwyX20ybV9z
dXNwZW5kKGpwZWctPm1hc3Rlcl9kZXYtPm0ybV9kZXYpOw0KPiA+ICsNCj4gPiArCXJldHVybiBw
bV9ydW50aW1lX2ZvcmNlX3N1c3BlbmQoZGV2KTsNCj4gDQo+IFVobSwgYXJlIHlvdSB2YWxpZGF0
aW5nIHRoYXQgdGhlIEpQRUcgZGVjb2RlciBJUCBpcyBhY3R1YWxseSBpZGxlLCBvcg0KPiB0aGF0
DQo+IHRoZSBqb2IgYWN0dWFsbHkgc3RvcHBlZCwgYmVmb3JlIGZvcmNpbmcgY2xrLW9mZiBzdXNw
ZW5kPw0KPiANCj4gSSBkb24ndCBzZWUgdGhhdCBkb25lIGFueXdoZXJlLi4uIGFtIEkgbWlzc2lu
ZyBhbnl0aGluZz8NCj4gDQo+IEFsc28sIGNhbid0IHdlIHVuaWZ5IHNpbmdsZSBhbmQgbXVsdGlj
b3JlIHN1c3BlbmQgc3RyYXRlZ2llcz8NCj4gVGhhdCdkIGJlIG5pY2UgZm9yIG1haW50YWluYWJp
bGl0eS4NCj4gDQo+IENoZWVycywNCj4gQW5nZWxvDQo+IA0KRGVhciBBbmdlbG8sDQoNClRoZSBz
dXNwZW5kL3Jlc3VtZSBjYWxsYmFja3MgYWRkZWQgaGVyZSBhcmUgZm9yIHRoZSBtdWx0aS1odyBj
b21wb25lbnQNCmRldmljZXMuDQpFYWNoIEpQRUcgY29yZSBpcyBhIHNlcGFyYXRlIHBsYXRmb3Jt
IGRldmljZSBhbmQgb3ducyBpdHMgY2xvY2tzLCB3aGlsZQ0KdGhlIHNpbmdsZS1odyBjYWxsYmFj
a3MgcmVtYWluIG9uIHRoZSBtYXN0ZXIgZGV2aWNlLg0KRm9yIHRoYXQgcmVhc29uLCBJIHRoaW5r
IGtlZXBpbmcgdGhlc2UgY2FsbGJhY2tzIGluIHRoZSBjb21wb25lbnQNCmRyaXZlcnMgaXMgY2xl
YXJlci4NCg0KRm9yIHN5c3RlbSBzdXNwZW5kLCB2NGwyX20ybV9zdXNwZW5kKCkgc3RvcHMgbmV3
IGpvYnMgYW5kIHdhaXRzIGZvciB0aGUNCnJ1bm5pbmcgam9iIHRvDQpmaW5pc2ggYmVmb3JlIHBt
X3J1bnRpbWVfZm9yY2Vfc3VzcGVuZCgpIGNhbiBkaXNhYmxlIHRoZSBjb21wb25lbnQNCmNsb2Nr
cy4gRm9yIHJ1bnRpbWUgUE0sDQplYWNoIGFjdGl2ZSBqb2IgaG9sZHMgYSBydW50aW1lLVBNIHJl
ZmVyZW5jZSB1bnRpbCB0aGUgSVJRIG9yIHRpbWVvdXQNCnBhdGggbWFya3MgdGhlIGhhcmR3YXJl
IGlkbGUgYW5kIGRyb3BzIHRoZSByZWZlcmVuY2UuDQpTbyB0aGUgY2xvY2tzIGFyZSBub3QgZGlz
YWJsZWQgd2hpbGUgYSBqb2IgaXMgcnVubmluZy4NCg0KSeKAmWxsIGNsYXJpZnkgdGhpcyBvcmRl
cmluZyBpbiB0aGUgbmV4dCByZXZpc2lvbi4NCg0KUmVhZ3JkcywNCkt5cmllDQoNCj4gPiArfQ0K
PiA+ICsNCj4gPiArc3RhdGljIGludCBtdGtfanBlZ2RlY19yZXN1bWUoc3RydWN0IGRldmljZSAq
ZGV2KQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgbXRrX2pwZWdkZWNfY29tcF9kZXYgKmpwZWcgPSBk
ZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4gPiArCWludCByZXQ7DQo+ID4gKw0KPiA+ICsJcmV0ID0g
cG1fcnVudGltZV9mb3JjZV9yZXN1bWUoZGV2KTsNCj4gPiArCWlmIChyZXQgPCAwKQ0KPiA+ICsJ
CXJldHVybiByZXQ7DQo+ID4gKw0KPiA+ICsJdjRsMl9tMm1fcmVzdW1lKGpwZWctPm1hc3Rlcl9k
ZXYtPm0ybV9kZXYpOw0KPiA+ICsNCj4gPiArCXJldHVybiAwOw0KPiA+ICt9DQo+ID4gKw0KPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgbXRrX2pwZWdkZWNfcG1fb3BzID0gew0K
PiA+ICsJU1lTVEVNX1NMRUVQX1BNX09QUyhtdGtfanBlZ2RlY19zdXNwZW5kLA0KPiA+IG10a19q
cGVnZGVjX3Jlc3VtZSkNCj4gPiArCVJVTlRJTUVfUE1fT1BTKG10a19qcGVnZGVjX3BtX3N1c3Bl
bmQsDQo+ID4gbXRrX2pwZWdkZWNfcG1fcmVzdW1lLCBOVUxMKQ0KPiA+ICt9Ow0KPiA+ICsNCj4g
PiDCoCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBtdGtfanBlZ2RlY19od19kcml2ZXIg
PSB7DQo+ID4gwqDCoAkucHJvYmUgPSBtdGtfanBlZ2RlY19od19wcm9iZSwNCj4gPiDCoMKgCS5k
cml2ZXIgPSB7DQo+ID4gwqDCoAkJLm5hbWUgPSAibXRrLWpwZWdkZWMtaHciLA0KPiA+IMKgwqAJ
CS5vZl9tYXRjaF90YWJsZSA9IG10a19qcGVnZGVjX2h3X2lkcywNCj4gPiArCQkucG3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgPSAmbXRrX2pwZWdkZWNfcG1fb3BzLA0KPiA+IMKgwqAJfSwNCj4g
PiDCoCB9Ow0KPiA+IMKgIA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L21lZGlhdGVrL2pwZWcvbXRrX2pwZWdfZW5jX2h3LmMNCj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19lbmNfaHcuYw0KPiA+IGluZGV4IDQ0YTA2NGRj
Ny4uNGE4NTU5YzM1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvanBlZy9tdGtfanBlZ19lbmNfaHcuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vbWVkaWF0ZWsvanBlZy9tdGtfanBlZ19lbmNfaHcuYw0KPiA+IEBAIC0yNjMsMTMgKzI2
MywxMiBAQCBzdGF0aWMgdm9pZCBtdGtfanBlZ2VuY190aW1lb3V0X3dvcmsoc3RydWN0DQo+ID4g
d29ya19zdHJ1Y3QgKndvcmspDQo+ID4gwqDCoAl2NGwyX20ybV9idWZfY29weV9tZXRhZGF0YShz
cmNfYnVmLCBkc3RfYnVmKTsNCj4gPiDCoCANCj4gPiDCoMKgCW10a19qcGVnX2VuY19yZXNldChj
anBlZy0+cmVnX2Jhc2UpOw0KPiA+IC0JY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNqcGVnLT52ZW5j
X2Nsay5jbGtzLT5jbGspOw0KPiA+IC0JcG1fcnVudGltZV9wdXQoY2pwZWctPmRldik7DQo+ID4g
wqDCoAljanBlZy0+aHdfc3RhdGUgPSBNVEtfSlBFR19IV19JRExFOw0KPiA+IMKgwqAJYXRvbWlj
X2luYygmbWFzdGVyX2pwZWctPmh3X3JkeSk7DQo+ID4gwqDCoAl3YWtlX3VwKCZtYXN0ZXJfanBl
Zy0+aHdfd3EpOw0KPiA+IMKgwqAJdjRsMl9tMm1fYnVmX2RvbmUoc3JjX2J1ZiwgYnVmX3N0YXRl
KTsNCj4gPiDCoMKgCW10a19qcGVnZW5jX3B1dF9idWYoY2pwZWcpOw0KPiA+ICsJcG1fcnVudGlt
ZV9wdXQoY2pwZWctPmRldik7DQo+ID4gwqAgfQ0KPiA+IMKgIA0KPiA+IMKgIHN0YXRpYyBpcnFy
ZXR1cm5fdCBtdGtfanBlZ2VuY19od19pcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkDQo+ID4gKnBy
aXYpDQo+ID4gQEAgLTMwMywxMiArMzAyLDExIEBAIHN0YXRpYyBpcnFyZXR1cm5fdA0KPiA+IG10
a19qcGVnZW5jX2h3X2lycV9oYW5kbGVyKGludCBpcnEsIHZvaWQgKnByaXYpDQo+ID4gwqDCoAli
dWZfc3RhdGUgPSBWQjJfQlVGX1NUQVRFX0RPTkU7DQo+ID4gwqDCoAl2NGwyX20ybV9idWZfZG9u
ZShzcmNfYnVmLCBidWZfc3RhdGUpOw0KPiA+IMKgwqAJbXRrX2pwZWdlbmNfcHV0X2J1ZihqcGVn
KTsNCj4gPiAtCXBtX3J1bnRpbWVfcHV0KGN0eC0+anBlZy0+ZGV2KTsNCj4gPiAtCWNsa19kaXNh
YmxlX3VucHJlcGFyZShqcGVnLT52ZW5jX2Nsay5jbGtzLT5jbGspOw0KPiA+IMKgIA0KPiA+IMKg
wqAJanBlZy0+aHdfc3RhdGUgPSBNVEtfSlBFR19IV19JRExFOw0KPiA+IMKgwqAJd2FrZV91cCgm
bWFzdGVyX2pwZWctPmh3X3dxKTsNCj4gPiDCoMKgCWF0b21pY19pbmMoJm1hc3Rlcl9qcGVnLT5o
d19yZHkpOw0KPiA+ICsJcG1fcnVudGltZV9wdXQoanBlZy0+ZGV2KTsNCj4gPiDCoCANCj4gPiDC
oMKgCXJldHVybiBJUlFfSEFORExFRDsNCj4gPiDCoCB9DQo+ID4gQEAgLTM5NCwxMSArMzkyLDU4
IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdlbmNfaHdfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiA+IMKgwqAJcmV0dXJuIDA7DQo+ID4gwqAgfQ0KPiA+IMKgIA0KPiA+
ICtzdGF0aWMgaW50IG10a19qcGVnZW5jX3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiA+ICt7DQo+ID4gKwlzdHJ1Y3QgbXRrX2pwZWdlbmNfY29tcF9kZXYgKmpwZWcgPSBkZXZfZ2V0
X2RydmRhdGEoZGV2KTsNCj4gPiArDQo+ID4gKwljbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZShq
cGVnLT52ZW5jX2Nsay5jbGtfbnVtLA0KPiA+ICsJCQkJwqDCoCBqcGVnLT52ZW5jX2Nsay5jbGtz
KTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCBtdGtfanBlZ2VuY19wbV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0KPiA+ICt7DQo+ID4g
KwlzdHJ1Y3QgbXRrX2pwZWdlbmNfY29tcF9kZXYgKmpwZWcgPSBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoanBlZy0+dmVu
Y19jbGsuY2xrX251bSwNCj4gPiArCQkJCcKgwqDCoMKgwqDCoCBqcGVnLT52ZW5jX2Nsay5jbGtz
KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGludCBtdGtfanBlZ2VuY19zdXNwZW5kKHN0
cnVjdCBkZXZpY2UgKmRldikNCj4gPiArew0KPiA+ICsJc3RydWN0IG10a19qcGVnZW5jX2NvbXBf
ZGV2ICpqcGVnID0gZGV2X2dldF9kcnZkYXRhKGRldik7DQo+ID4gKw0KPiA+ICsJdjRsMl9tMm1f
c3VzcGVuZChqcGVnLT5tYXN0ZXJfZGV2LT5tMm1fZGV2KTsNCj4gPiArDQo+ID4gKwlyZXR1cm4g
cG1fcnVudGltZV9mb3JjZV9zdXNwZW5kKGRldik7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRp
YyBpbnQgbXRrX2pwZWdlbmNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikNCj4gPiArew0KPiA+
ICsJc3RydWN0IG10a19qcGVnZW5jX2NvbXBfZGV2ICpqcGVnID0gZGV2X2dldF9kcnZkYXRhKGRl
dik7DQo+ID4gKwlpbnQgcmV0Ow0KPiA+ICsNCj4gPiArCXJldCA9IHBtX3J1bnRpbWVfZm9yY2Vf
cmVzdW1lKGRldik7DQo+ID4gKwlpZiAocmV0IDwgMCkNCj4gPiArCQlyZXR1cm4gcmV0Ow0KPiA+
ICsNCj4gPiArCXY0bDJfbTJtX3Jlc3VtZShqcGVnLT5tYXN0ZXJfZGV2LT5tMm1fZGV2KTsNCj4g
PiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0
cnVjdCBkZXZfcG1fb3BzIG10a19qcGVnZW5jX3BtX29wcyA9IHsNCj4gPiArCVNZU1RFTV9TTEVF
UF9QTV9PUFMobXRrX2pwZWdlbmNfc3VzcGVuZCwNCj4gPiBtdGtfanBlZ2VuY19yZXN1bWUpDQo+
ID4gKwlSVU5USU1FX1BNX09QUyhtdGtfanBlZ2VuY19wbV9zdXNwZW5kLA0KPiA+IG10a19qcGVn
ZW5jX3BtX3Jlc3VtZSwgTlVMTCkNCj4gPiArfTsNCj4gPiArDQo+ID4gwqAgc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kcml2ZXIgbXRrX2pwZWdlbmNfaHdfZHJpdmVyID0gew0KPiA+IMKgwqAJLnBy
b2JlID0gbXRrX2pwZWdlbmNfaHdfcHJvYmUsDQo+ID4gwqDCoAkuZHJpdmVyID0gew0KPiA+IMKg
wqAJCS5uYW1lID0gIm10ay1qcGVnZW5jLWh3IiwNCj4gPiDCoMKgCQkub2ZfbWF0Y2hfdGFibGUg
PSBtdGtfanBlZ2VuY19kcnZfaWRzLA0KPiA+ICsJCS5wbSA9ICZtdGtfanBlZ2VuY19wbV9vcHMs
DQo+ID4gwqDCoAl9LA0KPiA+IMKgIH07DQo+ID4gwqAgDQoNCg==
