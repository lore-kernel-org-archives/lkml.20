Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607A145563F;
	Wed,  9 Sep 2026 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788942758; cv=fail; b=RDWg5F2yGaeDre5BpipNhr2CRtR2bCRWvaYTdmVDjlv1//xa97BmwAiaAESctqISsuzQwigxHWFy5WHuQBO4SNpmSiQ0toj7PwqYRSqVHYsQSu9uXXr4uxwoPYpUeIhJXVt1Ci+xcFPv+BhCbPhWQFmtyz4iH6yoac7pZquzFWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788942758; c=relaxed/simple;
	bh=imI9GQEHNO5ak//TdXiQhWZx6OvysK0i6t2aerU2n20=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TlyV3hQTNfSaJxPchXxQ/FTUB40U7xwfbNGIagzEwzaf8ABgAu1ShN9HxPvbHNkFnVNeqP0/H1Vc1R1NGocbS1e9IsWEZf9i+XgUN/f7t59nkHTICBBoI/B79HXav0GbJAiAI4owTKZrv9rxR66lP4jUn1yio3t/QckvXMdkJmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Lm2ZXRx9; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Lm2ZXRx9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6FYUX46ETtS+Mzvklt2wl5S+okjzLtgkV/6GT+AthYxn1clvFUEXMdWrblAW2oUN7nprY2CAg+tplyHbKEJl0At1U2w3tkOGk3/ZFkevdjKO9qgmT6V6cNxc9ghFYb87ywbH70KgLa3fE0LM8+ivgdlS+l42oiw6kNr2V3/WaOx2KAqwfSvxjmf5l4PS+d8rC+IG1lVomNdp2WlBuX61U2PF8fjgTHqggV+WGIvjYeqoRMJEgj5GHvm8WsNGQ7ZDHZXj56m1+W04tqn31MfwUK7EAALlYBHGVfl1aeyY8gjckDMFYBOgmgdYX61dRIx1RjwMXPLiATU7saL68iKFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imI9GQEHNO5ak//TdXiQhWZx6OvysK0i6t2aerU2n20=;
 b=KeaZVHWi+cwoTBq8rARF/DBy4GOGLB0ySQqigoQIp2d3yWScjc4emL24rPPgZ03bzCbHV+KClzrLACjbqiwFmdtVmMsTU87ceB9FjzF0ajsobhJMD33gZ32tmj2Hf89LQkkDQ9qWqe8lPHYdmeB+XNUncaDOlQMguGH1mliJIXDRlXCz6CGuTzHIbZmJm8OEVqKFVHFalba1tqf3q1AwDnpuUGhypQwuED1CEYVcnvaTHmAfhsklAt0oQtcnI8RxGWqrqtwBYlhWW9FKY9kYeiIOTe8iewAE1KNu7RhFs+CSGeQoEmgXCkYstUjpcSGFlna+qDSqgkrxMffScyctQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imI9GQEHNO5ak//TdXiQhWZx6OvysK0i6t2aerU2n20=;
 b=Lm2ZXRx9yhrtjvU6xeFYkAHyWNHMxeeBnU478ikKJ7jcrztNGdhKhfhjkheOSghwsDnOWOP5YG5Dth5mTy2QvvD+noYAHOyQfTpghNWkuY/6cmaNtC8GbAO4eoDAK9Jk6pZmJYE+eW7uPfyD5mfeLUe9tgEiJc+7Rxj9hxggEDQ9Bf729OKNSAv0iWU+lnXkK+B/lhkXl4Rep+rKzQiOOAWHCd5s6aA5+wUg3CuzBwrUaRUvZVgqIueY1ZDjvbFOMiK2E/rOi4bznZZsMV29KxfJBG5OVTr+Q4y+x5F//uRsGCge+UJrQ/PyVnAQdbdz5hfzNW6URqZxDxDizJ+LuA==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by PAXPR04MB8304.eurprd04.prod.outlook.com (2603:10a6:102:1bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 08:32:33 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:32:32 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v18 3/8] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Topic: [EXT] Re: [PATCH v18 3/8] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Index: AQHdO2x0AO2+wF04XEe0sNATnkYckrbFzByAgAAQBwCAAALZAIAAFO0Q
Date: Wed, 9 Sep 2026 08:32:32 +0000
Message-ID:
 <AS4PR04MB93623E44246D2F29684491D6FBB02@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-4-lakshay.piplani@nxp.com>
 <f33ff763-136e-4c10-bd77-d40bb4baf02c@kernel.org>
 <AS4PR04MB9362BEAE2ADA8087F00DADFEFBB02@AS4PR04MB9362.eurprd04.prod.outlook.com>
 <624665dc-8f5a-4818-8786-c1c2356e58e4@kernel.org>
In-Reply-To: <624665dc-8f5a-4818-8786-c1c2356e58e4@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-09-09T08:29:55.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|PAXPR04MB8304:EE_
x-ms-office365-filtering-correlation-id: 771ec93e-592e-4484-ca64-08df0e4ce4c7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|7416014|1800799024|19092799006|38070700021|921020|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 BDmEs+0iXONFkJZBc2fQH10PZX12CURLay+Y+WQsfVuvQNGYwHigPLc0AUxB+VO3XCKunMEJc45r+699YO4esX8Bh318N/hO3TkHROiq6AbcUfp3ThqGfCi3dnuMmVzxRpey8AiqPaqE6R+NZXPNbXorUcnpB88Xe5vAVDIgIf1MPdr8et4wYtYpO78ip/Z8YGHAJyvdRkmGljSpu+2MT44B8f+abBrNh2r2vXC8iVat52tNYsuuTaGnJR49vLcyngrI3SoUHdNctG37I+aJ921OGHC56gzJmkNkSHOD7cr9dJznLDf6O8ooR0RP7URSRI088rFrPxkvY5DhdBbKTGeFL07ucZv5clB41cGF/V4DYUykxbswuXpsqVLQ2PrHrbiiZArSOQAoEkaCJxYal0Km7KorjpI4xhC/Ht1staN1lv29PC3zDQHVfKXBAUX9aFkxEp/Iic6HGSOGJlv7ZedxlY//NKDthJQGMmdoIpDxr5bHF3GwO43eRZ2dh8K5244KPi32os/0Cb0K+DAX305FQ4QKjxd2PEbwcZ5NVwWHQHez/KxflRtT2Bz4qgEvFIG/sjUCtS+RugLbVU2rhi3l2hkO/2ZTg4RHUvF2CAEyYlEZV/eUmP+31AVxS/cfwXTm6QQ8LAZ+urlir6/veS4VNuLvV2jyTH1aWvT12IcVPiGqLfISa76vCOoj7Hzps+oSYTQ8J4N9i/81qUEZuJiclBois9UETFeFinaRUyuEY/pRw1N5vi2rM00PXjO2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(7416014)(1800799024)(19092799006)(38070700021)(921020)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzZvSjNCcjdPSDNxaFdMTm9BQ0piZUZDYktpb0QyZzFlbCtZaUR1cis1ODcv?=
 =?utf-8?B?MCtQKzNEcXRWT1FvajAzcGhDQ2lYQnRkekhQMzQyZzlFcWtZbG43OVZmRzU3?=
 =?utf-8?B?QS9NNTBIbVozWC8vaTNrc084L212T2dRVmM1WFcvaVFUajhYd0w5aUp6VUlD?=
 =?utf-8?B?U0JQdldXNG15cVljSDVDRzl1NmZGK0ZSaXpRYjkyL2wxTUVGMjBtSUlSTktq?=
 =?utf-8?B?QkdScitJbmk3dkNNZEl2OC9aZmZlNi9oSndXTWFMSHdaQUV3NUE0emlUWURn?=
 =?utf-8?B?OXZvcUMzdDRmZzVIOUtQcHNmbGExU0F6Z0RGY01GdkI1M2lvek9GTHNtcm9o?=
 =?utf-8?B?TXEwaERnMWQxbERzZGNwVFNVcjU0bTMwWEczUUdLYmt1TDdQdmZKai94Z2F1?=
 =?utf-8?B?OVcxQ0N6L0xmZUI3VkNhbU9OcVVwODJjejZrV2ZmSFVrekliM0dvYnpuTXcv?=
 =?utf-8?B?bGtHUld6RmNFV0wvbWxZSzg4SG1lWTQ4NDRjTG51WHg3OXVJMnpyVlhuZDhI?=
 =?utf-8?B?U09uM1RNckF3NnBEeGhyVTVEZHlTa0liSXFSbVB5cmNzMkx4SDJUUkU5dm1R?=
 =?utf-8?B?TFVFbGN4WEJKUTFEZE1ZeEdsNTlIWXRSRWp2Y3ZBTGlldENaQUhHQ21KU25Y?=
 =?utf-8?B?cUR1aHEvLzE2clJlTGhVWjI2S3VoN2lnV2pMRjBoajBSM2tNOGhUZlpzQUlV?=
 =?utf-8?B?bXNISk9VUXpveEl6ZEhHaCtaZUdjdzNVUjc0ZldHQlA1NDAxQWEwcmxmdWp4?=
 =?utf-8?B?bDJkNW5tU2RVU0hjMHBwVWZ4ZTgzK1laVmtQbHBBN2tZS0hhU2o4NjU2OHJG?=
 =?utf-8?B?bTMyWjM0ekRPdWRpSjJZSHNxaHVpd1BTaXN6NDNHVzM2cG91eGZPR2lQdERF?=
 =?utf-8?B?dHgzM1lZakZnS1VHSG9hMnBnQnhpUHNSNENDRGU4L0NtM0ptNDVXWUFmdU03?=
 =?utf-8?B?ZDZWWUJER2Q1Q2JRLytpQ09laklMYXMxT3Z6aEZPek5kV1FsdkxrMFR4UHhP?=
 =?utf-8?B?cUdqQmV1dExMVTBWVWhzUkRrQzJDTjdFenRBRGFRSFVzT2NLM1dqYzNzb0Qw?=
 =?utf-8?B?VStSQ29rVmZzVXBnK3VYcjFyMXp0S1RUS3BSRVllRW9najV3VktTZllHTkF6?=
 =?utf-8?B?UHFEK1gvZ2hxNjhjSUFtVndwekJzZ2RwNVhxa0J0d0JOY3NpM1h1eEYrbDhn?=
 =?utf-8?B?STRqRmVML0pmbGh1R3FJZHh0OHhHZklHWkhnL3lJRi83UUxOY2JlbU5LcGkx?=
 =?utf-8?B?L2JxMGxrN3ZSNGhKc2ZMaTFPMG94U0YrM2kvdUoydjg1d2hKTXF4dFNRYlg2?=
 =?utf-8?B?cWtsU2xyNEY1YmcwWC9ScFVBeHMyMFJZYlNSaS9EWGdoUEg1eTBMWnJOK1Bi?=
 =?utf-8?B?U1c4b3QySThPKzRaYVZsbjJ5L01EemMzVlhvei91ZHhCaVZ2am5VTXBmUHdq?=
 =?utf-8?B?QWdJWUZoeUhjb0hCeFFsZ3gxNXlwQTlFc08yTVJuU29NaStiNXZFWHN6SDZF?=
 =?utf-8?B?dXRRc1RmeVRSNDlBV1ZPQzNSNmhmbmN4NHQwUWVUVmE0SThJNlptK2xOUFJu?=
 =?utf-8?B?SStWN08rMnZ4SE8vd21iM3laREMwTmVoT0ozU0FrNEJTSElnZXpLamU5dU5n?=
 =?utf-8?B?N0JNbU91SlQvQi9SWTNxdjQ0TlN0SmNhM2lQclRzemZtNFJUMUZOV2Z6bkFH?=
 =?utf-8?B?N1BIdUw3amQwc0JEdkJQbWJSMjhmZUZEWEhNQmtTYXl1K1hBcDdpNW52bUty?=
 =?utf-8?B?QjE5TVA3eXpqVnNmSUhITThGTlJleTFNampFdmtMWFJiOHdBaXJ0anFUalNQ?=
 =?utf-8?B?dXJ4NTF4TU90OWliTCt2ckY0S2Y2eU1YSGdVRitmaHF1NmNFcTk3MzBVZHE0?=
 =?utf-8?B?MXFvREJtRTZ3c0VFZk9NUzArWkVjN2ZpV1pOS0xtVExtdjZ4TzN4eENRTHpL?=
 =?utf-8?B?dW9kMHAzTndKLytEYVdGdmlQTVFiTVNVOFdsTzVYR2drVkZtRVdKNmVEZXEw?=
 =?utf-8?B?RDJEcmk4bHNEemRlNjJQaEtYOCtEamh0eXZYSXdVSG9GV0IzditNdkVFQzBK?=
 =?utf-8?B?QUozNDZmUFRSUXZMdUpyUk1zaFd1VWRqai9FQkV0SSs3cmhES3JrRDdJT1pj?=
 =?utf-8?B?cUVRODVYdzNMTHpMZzNqQkZRemVQRWp6RHE0RUdFOE5DYXBxZFREY2IrSE45?=
 =?utf-8?B?cTJKUGYyMFdlUEJ3Tnl5THlUdXBmZE9MOFNIWURmaDRETG45UEN0WEc0QXov?=
 =?utf-8?B?cjdGa0xqUVJNV0dOb3BLMThPVFpEdm54RzM0NGNuQ09DdjM3aHZFK2xZZ2lr?=
 =?utf-8?B?dzJHU3JmNy96ZWYwdnQ5enFiQk1ia2NoT1RYeEZ1dDhaQWVLaWJhZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771ec93e-592e-4484-ca64-08df0e4ce4c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 08:32:32.8091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iS7ZTJW3WXgxoiksWIMVHlMIFtmUiC9ip8D9Ms8itr9VKPZQ0Dmju+829kYxz3KYgOYYwc/z5/yXPenfdO1zcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8304

PiA+Pj4gKw0KPiA+Pj4gK3Byb3BlcnRpZXM6DQo+ID4+PiArICBjb21wYXRpYmxlOg0KPiA+Pj4g
KyAgICBlbnVtOg0KPiA+Pj4gKyAgICAgIC0gbnhwLHAzaDI0NDANCj4gPj4+ICsgICAgICAtIG54
cCxwM2gyNDQxDQo+ID4+PiArICAgICAgLSBueHAscDNoMjg0MA0KPiA+Pj4gKyAgICAgIC0gbnhw
LHAzaDI4NDENCj4gPj4NCj4gPj4gSSBkb24ndCBzZWUgaW1wcm92ZW1lbnRzLg0KPiA+Pg0KPiA+
DQo+ID4gRm9yIHRoaXMgb25lLCBjb3VsZCB5b3UgbGV0IG1lIGtub3cgaW4gYSBsaXR0bGUgYml0
IG1vcmUgZGV0YWlsIHdoYXQgeW91IGhhdmUNCj4gaW4gbWluZD8NCj4NCj4gSSBxdWVzdGlvbmVk
IGlmIGRldmljZXMgYXJlIGNvbXBhdGlibGUuIEl0IHNlZW1zIHRoZSBhbnN3ZXIgd2FzIHRoYXQg
eWVzLiBTZWUNCj4gd3JpdGluZyBiaW5kaW5ncyBkb2MuIFRoZXJlIGlzIHBsZW50eSBvZiBleGFt
cGxlcyBzaG93aW5nIGhvdyB0byBleHByZXNzDQo+IGNvbXBhdGliaWxpdHksIGlmIHRoZXkgYXJl
IGNvbXBhdGlibGUuDQo+DQoNClRoYW5rcywgdW5kZXJzdG9vZC4NCg0KVGhlIHZhcmlhbnRzIHNo
YXJlIHRoZSBzYW1lIHByb2dyYW1taW5nIGludGVyZmFjZSwgc28gSSdsbCBleHByZXNzDQp0aGlz
IHRocm91Z2ggZmFsbGJhY2sgY29tcGF0aWJsZXMgd2l0aCBueHAscDNoMjg0MCBhcyB0aGUgYmFz
ZQ0KY29tcGF0aWJsZSwgZS5nLg0KY29tcGF0aWJsZSA9ICJueHAscDNoMjQ0MSIsICJueHAscDNo
Mjg0MCI7DQoNClRoaXMgZm9sbG93cyB0aGUgZmFsbGJhY2stY29tcGF0aWJsZSBwYXR0ZXJuIHVz
ZWQgaW4gb3RoZXIgdXBzdHJlYW0NCmJpbmRpbmdzLg0KDQpJcyB0aGlzIGZpbmU/DQoNCnByb3Bl
cnRpZXM6DQogIGNvbXBhdGlibGU6DQogICAgb25lT2Y6DQogICAgICAtIGNvbnN0OiBueHAscDNo
Mjg0MA0KICAgICAgLSBpdGVtczoNCiAgICAgICAgICAtIGVudW06DQogICAgICAgICAgICAgIC0g
bnhwLHAzaDI0NDANCiAgICAgICAgICAgICAgLSBueHAscDNoMjQ0MQ0KICAgICAgICAgICAgICAt
IG54cCxwM2gyODQxDQogICAgICAgICAgLSBjb25zdDogbnhwLHAzaDI4NDANCg0KUmVnYXJkcw0K
TGFrc2hheQ0KDQpOWFAgUHVibGljDQo=
