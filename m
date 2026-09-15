Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011000.outbound.protection.outlook.com [40.107.74.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A7A3F4829;
	Tue, 15 Sep 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465250; cv=fail; b=szHOKvwuyIRNJO1RnS6b410TkHObvTp6qT9WZJcTMstJPTAG25ttjcRcSYLlzLKpEnLukqBh9+jA/Q+4dTGPH81JHl6UFLICIpXWm6Q4/yyx3iM0BD54HDRv9VHEPAxJDsnfgNQhecjmaZX5YSAd+78W5XgHCAwXg/NY53LJMGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465250; c=relaxed/simple;
	bh=z49nVWI8RwpgpFZFUnpIVYnoi7/dlyPR3mRwlODpmXo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tl8dA1eDUV3wVGR7f5P5V+35sMvldascsbzPbj5vcuXrUWvtmLqPbG1p8tCzA5jdc+RmBIC6kKhFLPo4s0pSBaLjEASjkrjVZ+PsacwX5PsAqAMzut6TDIIhGcFu4gKL5270cyLSIfTxzUfw6kLPheBv6SgRWiTqOxv7mBB/IFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=QZ6TIkTQ; arc=fail smtp.client-ip=40.107.74.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="QZ6TIkTQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tonbe5IgzbuEfMnzMmVYKNJVkQhBscMX/vWN+S27/lGDdL88TKGFofXVUXO1hcg353xx21tIRa+Bv1Ci+rv6jBNiBpDl2jklSK4Egkx9q9+DBksFGCeg70388srz+bSDW4I/eFWA2DjHlj7SGUXlaHOFz9QlhfojCinkLvDd2G6QTghiO6fvl7q0jwepn3tD4KWXXmD1s0bFhcOR+cIgitU/SAT5Lex6PMOfArCBYjO0rJPw3HeJm80qYuG0nEtymvN2jptb6Wd02jfA0W4+InU//WgjVWCx/HHFkNbV1xUEgdX96B1EiT1THDs/AYz+xrCqb7d9jXyg8RMsJhsUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z49nVWI8RwpgpFZFUnpIVYnoi7/dlyPR3mRwlODpmXo=;
 b=ddJN0lm0aeLXgUI/cbRqz91mXtBWJ7LIq8+3od5fQwpneDvjZ3EGzUiXj/trUdziPse9QJWo5t2QHpL+loD5/dWv90FnMowbAkbVBFaFuJTBZ+9Hvx2euYVWuwopdj0ioOoj5sctC+LMuQzzWMx9SxId/Z6ICJgmDjcQbEooB9qTKG+DxBWFmE829fNb7CQe0al0VgdrGUI/MQ6JyHkzlBukqhy4shQrB7+xTcDNBRx10A7ciRWD6LIX5Q2NBrpHGgt2+ZWx32t9sH/vxZPD7zSqbtNlXdzprUOEb0IF9ihuu9AgiyddH9J+gOv5XiobnOK4c+/PXNWChXWNX6rWyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z49nVWI8RwpgpFZFUnpIVYnoi7/dlyPR3mRwlODpmXo=;
 b=QZ6TIkTQKWLIDq+0NdhrdRagV/2oYMfJjpDGLjmQogmnLlsKuOGyF45fscWrq0UiQFxP6xSAFji9X1CjhIrTG4aocND0QLPKDu+Y3+aoziOK+/yOHoeHJFHF+HCI3Q84B11gE11K/vH3X/U2phEz1qpsETYK9bKbDDY5EkkQSLU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB14873.jpnprd01.prod.outlook.com (2603:1096:405:261::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 09:40:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 09:40:44 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, Tommaso Merciai
	<tommaso.merciai.xr@bp.renesas.com>
CC: Tommaso Merciai <tomm.merciai@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/4] arm64: dts: renesas: r9a08g046: Add USB2.0
 host/phy device nodes
Thread-Topic: [PATCH v3 1/4] arm64: dts: renesas: r9a08g046: Add USB2.0
 host/phy device nodes
Thread-Index: AQHdQDj6l7Lj7N0ugkOWB76p/MObILbOXJoAgAEMjLA=
Date: Tue, 15 Sep 2026 09:40:43 +0000
Message-ID:
 <TY3PR01MB11346B14A399B17DF3B9A709B86BA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
 <0e2d1c3bfad30090784ca52a20f21b001b662527.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdUJ63Bdwx=+6M-4HhsJuY2sqodh5cpxSMZfWpoUAnEhHQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUJ63Bdwx=+6M-4HhsJuY2sqodh5cpxSMZfWpoUAnEhHQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB14873:EE_
x-ms-office365-filtering-correlation-id: 666d7e55-907b-4e01-cb3c-08df130d69c8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|18002099003|22082099003|56012099006|11063799006|38070700021;
x-microsoft-antispam-message-info:
 BbiR79AsKKIVEMLqUUpGFsOvkhlQ+y/ySm9FhB8+9/roVz5hUeKnuyytVDzGDG7iEgi31y+dsdheP3vippcq31yPQQqVlAwUlLfbX++h8iFBx3qzH4kNIJGnHL00rKCyCEY3s++kXCV2f7C1FbsYx06Me4B1P9tIozRCU1rMk3TRZLEbyT50nbYmDGaJ2Gierc4I9Xa4B2jM85AXZNK5nuQZcjVdE1pKGcLccWtEKsztsi+dkGign2bSddbwxkHPb1JlZnXXNx6uHkUIzrWPPXc6VUmSuruiHyfwqqNcx6SDpedd4YVO3gXQN5NMnibwAv2JHBSD9WCZKzyIapEErVkljJyXXduh3SGn1d6AqCSfTujL7bGYOshKaI09VfOOkNJ/cwM9+7CK9sK9Fsos6txWpTgbehu9bJxakqumiGGr96NTWdSUjYt+OWI/RVXjaPZxEnazzJbAix8shqJd/TOuWqBQz5cxNPXq2MNibIbJx+AFN2xQY/QfmdkKr9q+kWwsZTiZlj1Ql8cFM6ZIlbBNu7SvY6NkKSWcOxrtG19+ESmf5DaycPt74Z5AiuyHhZpfDPN0SJzrpLesbZ74yV0WmFUtn7atI9pPwPdU3HURMbNyT+8i/6pzelxWsGL+34x/mFZmQulCt7iZp+YrGYwwUTrHrq5QdBGYn0aVziATit38rSdFMz8tsRupeJKBQpFWCnc7L+4Z5XyEpT0R39DAWGvNRDDHaIoq/Ped3yQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?REdLMXNkQVJJM1NDSi8wbTVsZDJ1M1BHeFZtdUlBSEgyU0Q2QUNta28xVGFU?=
 =?utf-8?B?OUswczh5VlB5TXZQdDZCRE02ditjNHZ2Y0hjRE5HbGZuSFZ3b1dTdElHMnps?=
 =?utf-8?B?ZUFQUTZoTVpzNzZXMTdtN2NYYXc3a045dUZpaFRTSW9ERklFRUErUk5GTjFT?=
 =?utf-8?B?RWdBU1BRTnBEa1U5ckxwYUJnNWk3alArNGlLL2w4UGU1cHdlUkRLRjRMUUFL?=
 =?utf-8?B?TW9Ha2NVaVJ5Z3dudzljdG5vbU9XWFBZWFJ0bm5qRnluTnJTdXpKL2ZvMjNo?=
 =?utf-8?B?MllCNGozMThZYWRBcytMYjdwNzJkNjlBL2RuOFFxWjBRTnpHZG9ET25ub0Fu?=
 =?utf-8?B?TEdnSnRFQ0FlNEZQbHRBanZmdmFlVkdwUDlIOUZLMW90L0YvSzBNbUdHZmd2?=
 =?utf-8?B?TXJ1SlFuV2tNblZSSG5vTE1mVWUxSnB1cEw0TFJibE55WWtReTBvQUR6YlhH?=
 =?utf-8?B?KzZxc3daaHpLcUFWVlBWTWpaSXAxNGc2K1BDekJwVytQazNjYU8wYUJidkZs?=
 =?utf-8?B?OEtuMlJNdnpYdGRqTWZQZzJjT1RmYjNSeGRPTGhoeFBvMituR1lwYVpyYXcw?=
 =?utf-8?B?Q3h0cjlIT1dPendXRytCeU51RUs1OWRiWFRYQy9IVXRmSWthc0lpTkU1d1RS?=
 =?utf-8?B?Zm1XOURWYmpWdmw3S05yVm5Kb2ZpQ2UzbzJIc2JLMTJNMWhEWFlrU09kbFJG?=
 =?utf-8?B?RDRVYUVrZE5HUTE1NTFjYjdsTzVOOXBrTjZFRDY0U1VHTUlkbGp0SmtoTUJS?=
 =?utf-8?B?QzFzSUFDSHdMUXl2c2NsVUQ0NTdFTCswM3RLVFNNbW9MdkpVaVgyR0NtRXlL?=
 =?utf-8?B?VldXZjRWWWZLVUNmTDBEZ2gwN0IrRmVvajZKc3lQNzc4VEJua1JTaW5WdXZx?=
 =?utf-8?B?UUFlendqYnJvNnRoclpBaC9JL1k1ckVrejhGQ0xhbC9PSnhyOHMzQkt0a3BQ?=
 =?utf-8?B?elBlTXIxYU5HdnRIUlpldkpKd1lBaXZQU1lUQ0c3N0YzR3VNWHk3aU0yT1Fl?=
 =?utf-8?B?c3RMb1A0NDNGWDQ2bjZYU2lQelBOT25OMlRVWGVVNXdxNHJoMHlXMnZPWG5s?=
 =?utf-8?B?TGdtb04zTk9mY2kvd2g5ejFySXNmRnl2SFJGYWlsbmw2MlVTeDdvcDJnNDJG?=
 =?utf-8?B?aWM1ZEwwTCtzUlhpRnpLRndneTRFdnF2bmQvMCtkRHBCNTV4dkdTdkdkeWw1?=
 =?utf-8?B?T2toaFZvaEppVGE5RWJPaXR2dldieU1wdUJybU0xWVR3ditOSVc0Y0hGdW9M?=
 =?utf-8?B?VHJqTHR4SGRKdjFvN3E2ZzRDbldUejQvd01yZHlIMGUyQUs2eVZWb1JLMWdU?=
 =?utf-8?B?K2lpRkdaL1hqUUJvMHkwRDhtNDJLelpRdkhYeEJYUzU0ZW0vZGdKR1lEMldo?=
 =?utf-8?B?Z2d6Q2x1aTFkdzFkZkZPNlNta2tZbUlFNnlyenFZa0RndDkzcVFiLzZsNmZI?=
 =?utf-8?B?ZVNPNFBhWGh3QTVzSmtnaFlNT3BQc0EzdjdNcTFMMHBJNkFhMlFaK2pLQ2dH?=
 =?utf-8?B?dk5KQjl0UDdPdCtpdUVna1g2R0JLWWZDQlJSeU9iNUQyaHc4N2VMZldXUlVZ?=
 =?utf-8?B?N2oxTnB0eVBad1lRaGloeVNFRmdNTGJRYm5KaSs0dVRQZEtwcWo4Q1A1Z0U4?=
 =?utf-8?B?SUdPV1hOa3ZSems2VG1uak9acHhXOXlWT2ZqdWY3OVpxam81NnVCdTRHM1Fj?=
 =?utf-8?B?aStPZjFGQ2lLVi83L3ZnM3g2blZKNml5NjhERGpaZk1Mc0VKY1F1Q3c0SGFD?=
 =?utf-8?B?dHN4WS9kODVpSkswZk9EL0ZoK2dwdWpWZnh5eE82QWxVUkorRC95RUs5bWtR?=
 =?utf-8?B?YjVCcS9iaXJ3TWFsWW5mSWgrMmFZeFY2dE1sRkZHYWgyNS9pTkJEWnltRldr?=
 =?utf-8?B?SmRJMzZLQjdtNHprZjBOeUJBQmRHTWxvOTVDVTBSNllsaVEzNC92ZG8vU0VJ?=
 =?utf-8?B?ZGVVZUpuMjl1U2taMHNJQXYvNU53QjEwVzJYcC9PdlM4WlNPcVUxODVsUStS?=
 =?utf-8?B?eFU3YW5OcjhQWjVxb05ZZ2E5RGtxTnRKSzNITTZvNktxVzhFQThuUmtEQ0Ji?=
 =?utf-8?B?SGozak15SXJPa2Q2QngvYkNrL004UUlMQk43T3JiL1BPZ2RYNGRMaldRSitS?=
 =?utf-8?B?d1J1TFVEYkgxK2M4TUVYSGdwNHhqVGIrTmdralBra1FvV2d5ejdCWUZXRS9N?=
 =?utf-8?B?ZC9mMEhlMi8wOWRPUUJMak9ldjJkaVZTbk5ya242b2xxRW5XUFlUdng2Zjdq?=
 =?utf-8?B?OVNKcmNIaGdjQlhjK2J5NWZtS2czWkI4QjJWT2U2SHJWNnJJc2hPZWVJRkVo?=
 =?utf-8?B?YmFVVi91L21oUFZpUFUvVDV5NnIyUTBwMEdBMkFoSVYrTGp6Vkhhdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 666d7e55-907b-4e01-cb3c-08df130d69c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2026 09:40:44.0041
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JjpnMnRDzchOSg1GduDckizRgUA6RtgsDnljDFD7hsZrM0tb+6gSdyFuvRfrx7+VXQkr/YnhNfqCovZx4D25by5Rp8IhUoShUkPXTfIjx9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14873

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDE0IFNlcHRlbWJlciAyMDI2IDE4OjI5DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMS80XSBhcm02NDogZHRzOiByZW5lc2FzOiByOWEwOGcwNDY6IEFkZCBVU0IyLjAg
aG9zdC9waHkgZGV2aWNlIG5vZGVzDQo+IA0KPiBIaSBUb21tYXNvLCBCaWp1LA0KPiANCj4gT24g
V2VkLCA5IFNlcHQgMjAyNiBhdCAxMDo1NSwgVG9tbWFzbyBNZXJjaWFpIDx0b21tYXNvLm1lcmNp
YWkueHJAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPg0KPiA+IEFkZCBVU0IyLjAgZGV2aWNlIG5vZGVzIHRv
IHRoZSBSWi9HM0wgKHI5YTA4ZzA0NikgU29DIERUU0ksIGNvdmVyaW5nDQo+ID4gdGhlIFVTQiBQ
SFkgY29udHJvbGxlciwgT0hDSS9FSENJIGhvc3QgY29udHJvbGxlcnMsIGFuZCBVU0IyIFBIWXMg
Zm9yDQo+ID4gYm90aCBwb3J0cy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBUb21tYXNvIE1l
cmNpYWkgPHRvbW1hc28ubWVyY2lhaS54ckBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2Fz
L3I5YTA4ZzA0Ni5kdHNpDQo+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9yZW5lc2FzL3I5
YTA4ZzA0Ni5kdHNpDQo+IA0KPiA+ICsgICAgICAgICAgICAgICB1c2IyX3BoeTA6IHVzYi1waHlA
MTFlMTAyMDAgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVu
ZXNhcyx1c2IyLXBoeS1yOWEwOGcwNDYiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwwIDB4MTFlMTAyMDAgMCAweDcwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDxHSUNfU1BJIDExNiBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA4RzA0Nl9VU0Jf
UENMSz4sDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01P
RA0KPiA+ICsgUjlBMDhHMDQ2X1VTQl9VMkgwX0hDTEs+Ow0KPiANCj4gTm8gY2xvY2stbmFtZXMs
IHdoaWxlIG90aGVyIFNvQ3MgdXNpbmcgdGhlIHNhbWUgYmluZGluZ3MgZG8gaGF2ZSBpdD8NCg0K
T2ssIEkgc2VlIGNsb2NrIG5hbWVzIGZjayBhbmQgdXNiX3gxIGZvciBub24gUlovRzJMIFNvQ3Mu
DQoNClNoYWxsIHdlIGNyZWF0ZSBhIHBhdGNoIHdpdGggcGNsayBhbmQgaGNsayBmb3IgYWxsIFJa
L0cyTCBTb0NzIChiaW5kaW5nICsgU29DIERUU0kpPz8NCg0KPiANCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICByZXNldHMgPSA8JnBoeXJzdCAwPiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8JmNwZyBSOUEwOEcwNDZfVVNCX1UySDBfSFJFU0VUTj47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgI3BoeS1jZWxscyA9IDwxPjsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICBwb3dlci1kb21haW5zID0gPCZjcGc+Ow0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKyAgICAgICAgICAgICAgIH07DQo+ID4g
Kw0KPiA+ICsgICAgICAgICAgICAgICB1c2IyX3BoeTE6IHVzYi1waHlAMTFlOTAyMDAgew0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicmVuZXNhcyx1c2IyLXBoeS1y
OWEwOGcwNDYiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4MTFlOTAy
MDAgMCAweDcwMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxH
SUNfU1BJIDEyMSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBjbG9ja3MgPSA8JmNwZyBDUEdfTU9EIFI5QTA4RzA0Nl9VU0JfUENMSz4sDQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjcGcgQ1BHX01PRA0KPiA+ICsgUjlBMDhH
MDQ2X1VTQl9VMkgxX0hDTEs+Ow0KPiANCj4gTGlrZXdpc2UuDQo+IA0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJlc2V0cyA9IDwmcGh5cnN0IDE+LA0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIDwmY3BnIFI5QTA4RzA0Nl9VU0JfVTJIMV9IUkVTRVROPjsNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAjcGh5LWNlbGxzID0gPDE+Ow0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHBvd2VyLWRvbWFpbnMgPSA8JmNwZz47DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4g
PiArDQo+ID4gICAgICAgICAgICAgICAgIHBjaWU6IHBjaWVAMTFlNDAwMDAgew0KPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwIDB4MTFlNDAwMDAgMCAweDEwMDAwPjsNCj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICByYW5nZXMgPSA8MHgwMjAwMDAwMCAwIDB4MzAwMDAwMDAg
MCAweDMwMDAwMDAwDQo+ID4gMCAweDA4MDAwMDAwPjsNCj4gDQo+IExvb2tzIGxpa2UgVTJIWzAx
XV9JTlQgYW5kIFUySFswMV1fV0FLRU9OX0lOVCBhcmUgbWlzc2luZywgYnV0IHRoZXkgYXJlIGFs
c28gbm90IGxpc3RlZCBpbiB0aGUgRFQNCj4gYmluZGluZ3M/DQoNClRoZXNlIGludGVycnVwdHMg
YXJlIG5vdCBwYXJ0IG9mIFVDT00gbW9kdWxlLCB0aGF0IGlzIHRoZSByZWFzb24gaXQgaXMgbm90
IGxpc3RlZCBpbg0KRFQgYmluZGluZ3MuDQoNCkNoZWVycywNCkJpanUNCg==
