Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD53371860;
	Fri, 11 Sep 2026 09:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789119118; cv=fail; b=sTWOyK6u4IIdlUaC/ZgxDt9e/LSpPKLAoaQTEk/089EY/3WN3nCp22yYIdM0GAsaVoCsW00E9e++MgPgrTCpft/cKyPc7re6963H+UcQFCfXTtAqoGhD51Nd88KBajXvYGdoindfbDqM5EX8NPGZKyu1YNY5KH5ITb1lBg1CCkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789119118; c=relaxed/simple;
	bh=dvkRtFiQXHvPhdL/HvpsSGO2y6XAa++TsbporI0BpvI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nsl4ntnuMDE6KD+Pp/KuA2oLUPypfymDE/EZWizP+lvtzlEG85lGpksHshHxoKvrEZOMgmIHSnqANvEJrrHzB/1KaOISDriqlOjcjMstnI8+Dq6gQTPH9R4aCXgIQdFXilSkRgEVkfSUxbslEG+WCxJ1IugCqKPgACNsqOmtGzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DM4a9g7K; arc=fail smtp.client-ip=52.101.66.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DM4a9g7K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPsSv+zihiu1YDaiJYeuL3bUQ4aZJYW/D021aw6oFiE8iabmy3yJFe4NvgGcK4U3pSt/k8dCBMmWAzbE+Y0IyHAE1u8Z/ChwbyjqOpEKCrWQp7g0Ox+BRgHyOeJsSh0cxFKlEtuaAlPHWMmmbgXKHXGzoFBPpegriAiZfr0XhKP0DhDn49Ndlm43zUIkX72b+d9zhuSDrrFHMQkEWVHm3YAZDK/q6EPVnm+3AnBn3shyOfYkUEPKNd/LZhM1uf3dtFvouu1PElwrZAdAh+IlwyUycgQXdv21TVaVUVXMZn1C7oOoKX/aPw4a9e3qxL3rTL8acJNBWfeP2T86PixD1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvkRtFiQXHvPhdL/HvpsSGO2y6XAa++TsbporI0BpvI=;
 b=oxlw3EK4vfbFYNHKCvmJnsvTQex2tPOKoT8BaB6nwuVSVgSwm5pUyqK8H45lHs0MfEvZ+n5y1T3GcOIVAbsvu41jSvGQVSWNGgj+lOpNF/vso/4705DRyUi1br2e/Ud70FdhB/G7mqSwqAMLOq0G3Ne/edvW41AF/MDy7srp6gP//OFqD0kIAK6prIfjTv/mApN5I4Whw9kMTRDsDW3qd15WrlEHDbsRoMxYNpaf3ETRvY3kBFZ0SmfWiB9JTEZg79J60oPLZ9s3LbaP35tuMFnJrrPSCjKeucVMyx3lUC5F3W7bCLoFhGh/FrjeQE3el65OwsnzGoDnYTeTHdA6Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvkRtFiQXHvPhdL/HvpsSGO2y6XAa++TsbporI0BpvI=;
 b=DM4a9g7K5MjvcbkNFk6WK6roNHx01/8VFSOcewG1gNLyXuy4uFfYpl+YsmAWTAALVrlGLyLP8CzU+qywOSXI/bx+B5pkqa+mJd4ojddaxOktCt/f7b0/Pi5zejyKZ+XecUXRT6wIfjLod+IvflZmZgJ5nYSM5kRc3Eqq6fNhkHbZzYzl/s19nBxeMpjHhwaTEqbaBM0C9cma9wRBRjPy76RZ1Cf7HwUeyXMb02AUuGBXweTmUA2Kd2CJEu99jYu1vQEqRQFloBHUgetsRElhJRNDbBVn/BAWzTt8dzeE4alOzs9TJK5LG6kbzIXvxMqjOt2TAizvaQrpQVKbd8h5cg==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by GVXPR04MB11692.eurprd04.prod.outlook.com (2603:10a6:150:2e5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:31:53 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:31:53 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>, "linux-kernel@vger.kernel.org"
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
Subject: RE: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Thread-Topic: [PATCH v18 4/8] mfd: p3h2x4x: Add driver for NXP P3H2x4x i3c hub
 and on-die regulator
Thread-Index: AQHdO2x1nNs0fs3RcE60iSGPwiIo0LbJKBqg
Date: Fri, 11 Sep 2026 09:31:52 +0000
Message-ID:
 <AS4PR04MB93625052401AF41C2ACC2D66FBBE2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-5-lakshay.piplani@nxp.com>
In-Reply-To: <20260903062108.2712296-5-lakshay.piplani@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-09-11T09:30:30.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|GVXPR04MB11692:EE_
x-ms-office365-filtering-correlation-id: 92d8f615-31f2-4529-4b4e-08df0fe783a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|376014|19092799006|921020|6133799003|18002099003|38070700021|4143699003|11063799006|56012099006|22082099003|10067099003;
x-microsoft-antispam-message-info:
 YaS8BMRSweQ/z5Vhff4uhAHWbYY9EDjN8m/r0MrdaUEYEBX46YM2V4JfH9gWdt74AzlIV5DUmYKEuxLo2n9y2ZzIoCxRcXAaJmfxZR9Ct7qcoKP3GbqOB8ul+q0dtf26ANgJZlk50RVJmPpI2eMsYIdtWeMWQRAs58Q1nfTYvR9sCdXYW9425CT4PQLAdMNw+ZyIdJJciUmxCR1fKNHCgAMbT6wBf6t3WSOz1IxRyj9ulxqFUI2K9ySnTP9+naJEpIf+PHkILFM9RsbiR0mIu6COOrfWtlCSHpPtGNg+eV94a/N2Z0pko5w58hfdxSkGGDj/BAmUuVskGQHBZ5lmF7pmnIZU+cdNGMMNEQBZSjw7UJm0mExIIgAo33ZU0/7KrbsFxsFgMePX16c1eP913f8lOEXvHSXOyc0l0oDj/d/HK7+K04DkT3fa3DuW57F8F+aytX5lQPBBLHt9uSn1HghS7gzjKHMCSQpOU/xfI0rM0KtfhcEYCpv7hMY+Q92qKSqnnWcCi9nPbTz0zei0N+50IhlmRW/q5DWVA/CA9Co4WYSKerJ9I3L4/16CPz27hywFFFmSlrqfArAUKmYccxbH72JzHfPueURtiy49r13KPIc70POwar2WmuCQkjP0S3p835OH3lYQPmJmI9hBa7Uyhomwu99MPChTAejox/L774NajVWxsz4QbyIK3Pkus2CE8z1ID2y/nK2Mr+WULF7vQSO/4PvQf4e2wvTBUDk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(376014)(19092799006)(921020)(6133799003)(18002099003)(38070700021)(4143699003)(11063799006)(56012099006)(22082099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXZLQ3JLSjhsVy9UbXZKZkFrVk9mcGFYRzJLand1RkRtM0xzZVF0ZlBBUkcx?=
 =?utf-8?B?Z3NYcS8zNTl0NmRrcW0vWWVDVHpDaXZLZS9ZWkJGc0tZbHpTOVhaTW1ua1ZP?=
 =?utf-8?B?Z0pXU2FSZmQ5ZFcxTUZtc3FEL0JiK29qQWszb0hsaGpjRFljZVRrQWg4VWIr?=
 =?utf-8?B?bGpTYnQ0MnBtOFVCR1p4UWZiamVzb3FJUXdJckVUNFZFVlNDaER6QmZKRDQ5?=
 =?utf-8?B?MVVQdVJxOWNUMVMxUHJYYWtXMUpvMDVxUzJLa0RIZEZjUnhJSWEyZEFtQmRl?=
 =?utf-8?B?WEVwOE9uZ3E2SVFESk9nZS8zdTZBeHFUeW5rY3VkL25LaXdtUmtqbm5WWDFu?=
 =?utf-8?B?VXpCQUp2STBJc2paaWlSM3dDQ1EraDl0NDBqZGlTdGozRnJmVGpHa2VBMWxT?=
 =?utf-8?B?Q2UzMlJYd05hMStGbUZSL0ZXWHUrZlhEVG5OUUZBMHo0Zm9MU0pUSWY0U1cy?=
 =?utf-8?B?NWVIZ2lsSWZRWVBhNUNVc1A0MVVMQnQ0ZWlpUjZudTNXYnAzb1lJb0lRSjZa?=
 =?utf-8?B?MDZHMmgwM25kbDFBRDQ0REJpUzl3OXZTSXgxWlkvdkJqTW96L3Fzc3A1clZN?=
 =?utf-8?B?bENrSTJDNEd4YW1vbDlKcGdWakVmS0lZU2NYbUFBd2xwR0VoSXh0c2FHcGx6?=
 =?utf-8?B?NDltb28zVDE3dnE4aHc2b0V6OEF3WkJCZUNISFpkRHBSbW1xUjdaQUVObkpx?=
 =?utf-8?B?TGtBUXg1bkRBTnpTNXBwcjRsN093ZVh6REgwWEZ4QjdJWXBqOExNcnppRFNJ?=
 =?utf-8?B?cVN2SzdwS3ZZUXVnd2JYbEpGaDNZdll0Z0xhdU9CbFNrL2d1NUpUb1orYlhp?=
 =?utf-8?B?dWEzbTY2UkVvZ2RmMXRrMjk5L3NRbU5HakEzRm03Tm1laWtMc0hoQ1Vjb0FC?=
 =?utf-8?B?M1dCT2d4U3FIZmtzeS9CNGpheUZNT3Q0ZlNkYjBIbFJwcjdUeHM0YlA2ZEcz?=
 =?utf-8?B?SVFuMkMvSHJzSnNSN1ErRmcxMVZ2OStaT2JLT2VDdnVvY3d4bGtNeWxqNWdk?=
 =?utf-8?B?blA4K2thWm9qRDQ5cWs0U1g3a2h3YTdqTXljNS8vaXRCRUNzaEpNMzZUOVJn?=
 =?utf-8?B?KzY2aUNQS29BdUhVeFRvOW54ZHNyL0p3QlZlUUt5Z1pWZU84NHRzQTJRVjEr?=
 =?utf-8?B?cnUrS01XT3BOelNnVWQvMEpYejZFVEFMaTM4d09RU0JYajFUdGJyNkxNV1Ri?=
 =?utf-8?B?RUxlRjUxUmJkSjZ3aXcwOUVCczlPVVZDbjJjUEN4bkFNQ2ZnTE1zOGZ1azIz?=
 =?utf-8?B?K042enU3OW9uK1gyKzFFZXdNamVZTDRwNWxaSm83Sm1PV0NxeHVuL0l3aTRv?=
 =?utf-8?B?ZjRqdHhZd3k1UG9lcTFROHoxK1FhMjB4dmtxVHFYZFRPSWxhMHFEMXp0cDFt?=
 =?utf-8?B?V3IyL0lia2NnME9nRHBsalN6UmV4TVdDQ3FBbURrclFCdW9haGVxdUFES0lp?=
 =?utf-8?B?RFpFMDFlUENpWHZxN2wyUllDeTNUdGt0Y0NidU5GQlBjeEJqa2VXRDBtMGpp?=
 =?utf-8?B?bjQzbGpZNFI4MERkSlVWcTljaFlLU2o1QTlqQ1NvODVYTmRzQXNKYzV0M210?=
 =?utf-8?B?OG1TbTg3bjUxSmIwRkVva3lLb2I3dzFoQS9yaXYxOTVidTJ5ZU94RTlldmpo?=
 =?utf-8?B?U0ZBRmhxRS8xUU5wTHNENVhRL3BHbjJhMkp1VGQyWFR6N3ZTTjBncmZBT05k?=
 =?utf-8?B?V2YvQjN2Qm5paWdFR1lnaUp5cS9iajdHT1l5MGRyVUdsV0hIbVpVYmpnakFv?=
 =?utf-8?B?TDlhVExFZWlsdGxiL1JvS01jTlNUWDJ0SzMvQ3FqNUk1bDcwQjVzbmg0Sloz?=
 =?utf-8?B?SllMQlhTWUlEK2p2dGR6MkpGVmdIeExQQ1JOT09vV3dIWEJJY0x5SXkzRkM2?=
 =?utf-8?B?Q1BCQTV3M05sdFdQYi9LWWx5VWltOGhvN0I4c0hMZkFrd24wYU41L3V0S2Vu?=
 =?utf-8?B?RUdTSlU3TDV5bXl6MElhYnY1Q1NZUFlsRmVXUVVBWVFQZWI4b1ZOc1oxaVRq?=
 =?utf-8?B?TTJiMHlQd0V6bW5yeGdrVjJneTJlV1p1RFcyVTdFZ1p3RGc3SWZ4UWVWT25I?=
 =?utf-8?B?TVA3Z2x5KzFoZjYvV2tvUTcrVWc2S2dnWis4Wml1S3IxWkVNT1pTVWNoNHB5?=
 =?utf-8?B?bFg2ZHlVK0RwUStab0tMWWprY1Ywc0FUdTNGcEdrUjZocnNYelJULzZjdzky?=
 =?utf-8?B?TXUzVWFKVDliaVdTcjRqb3FPZmxJMGpHcmlLLzVpdW9xVGZzTytJRU4xY0Ro?=
 =?utf-8?B?dnkwUUdnbllhS1R3SFBlS2RZTVE1amZkamJieC96Y25pQ0JaSXQzVjlsSXdK?=
 =?utf-8?B?SmRyRlNjSFZhVGhtS3ZiRExlN3FISXU4cU1sSk8vL0hiVW9xOUQ1UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 92d8f615-31f2-4529-4b4e-08df0fe783a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 09:31:52.6212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2AfotHN/cJybQGHkMwJOw5y1Sp+QLud2hTp0qO/NCJOoTXKVuZdlopF4ehLTzbODl0n8W/HBSBldDqp40VdcQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11692

DQpOWFAgUHVibGljDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExha3No
YXkgUGlwbGFuaSA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBT
ZXB0ZW1iZXIgMywgMjAyNiAxMTo1MSBBTQ0KPiBUbzogbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGFsZXhhbmRyZS5iZWxsb25p
QGJvb3RsaW4uY29tOyBrcnprK2R0QGtlcm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsNCj4gY29u
b3IrZHRAa2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGJyb29uaWVAa2Vy
bmVsLm9yZzsNCj4gbGVlQGtlcm5lbC5vcmc7IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsg
bGdpcmR3b29kQGdtYWlsLmNvbQ0KPiBDYzogVmlrYXNoIEJhbnNhbCA8dmlrYXNoLmJhbnNhbEBu
eHAuY29tPjsgUHJpeWFua2EgSmFpbg0KPiA8cHJpeWFua2EuamFpbkBueHAuY29tPjsgQW1hbiBL
dW1hciBQYW5kZXkNCj4gPGFtYW4ua3VtYXJwYW5kZXlAbnhwLmNvbT47IExha3NoYXkgUGlwbGFu
aSA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MTggNC84XSBt
ZmQ6IHAzaDJ4NHg6IEFkZCBkcml2ZXIgZm9yIE5YUCBQM0gyeDR4IGkzYyBodWINCj4gYW5kIG9u
LWRpZSByZWd1bGF0b3INCj4NCj4gRnJvbTogQW1hbiBLdW1hciBQYW5kZXkgPGFtYW4ua3VtYXJw
YW5kZXlAbnhwLmNvbT4NCj4NCj4gQWRkIGNvcmUgTUZEIHN1cHBvcnQgZm9yIHRoZSBOWFAgUDNI
Mng0eA0KPiAoUDNIMjQ0MC9QM0gyNDQxL1AzSDI4NDAvUDNIMjg0MSkgZmFtaWx5IG9mIG11bHRp
cG9ydCBJM0MgaHViIGRldmljZXMuDQo+IFRoZXNlIGRldmljZXMgY29ubmVjdCB0byBhIGhvc3Qg
dmlhIEkzQy9JMkMvU01CdXMgYW5kIGV4cG9zZSBtdWx0aXBsZQ0KPiBkb3duc3RyZWFtIHRhcmdl
dCBwb3J0cy4NCj4NCj4gQWxsIHZhcmlhbnRzIHNoYXJlIHRoZSBzYW1lIHJlZ2lzdGVyIGludGVy
ZmFjZS4gVGhlIGRyaXZlciByZWFkcyB0aGUgdGFyZ2V0LXBvcnQNCj4gY291bnQgZnJvbSBERVZf
Q0FQQUIgYW5kIGFwcGxpZXMgdGhlIERUIGNvbmZpZ3VyYXRpb24sIHNvIG5vIHBlci1jb21wYXRp
YmxlDQo+IGRyaXZlciBkYXRhIGlzIHJlcXVpcmVkLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBBbWFu
IEt1bWFyIFBhbmRleSA8YW1hbi5rdW1hcnBhbmRleUBueHAuY29tPg0KPiBTaWduZWQtb2ZmLWJ5
OiBWaWthc2ggQmFuc2FsIDx2aWthc2guYmFuc2FsQG54cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6
IExha3NoYXkgUGlwbGFuaSA8bGFrc2hheS5waXBsYW5pQG54cC5jb20+DQo+IFJldmlld2VkLWJ5
OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4NCg0KSGkgTGVlLA0KDQpBIGdlbnRsZSBmb2xs
b3ctdXAgb24gdGhpcyBNRkQgcGF0Y2guIENvdWxkIHlvdSBwbGVhc2UgcmV2aWV3IGl0IHdoZW4g
eW91IGhhdmUgYSBjaGFuY2U/DQoNClJlZ2FyZHMNCkxha3NoYXkNCg==
