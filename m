Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=139.219.17.94
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793790834;
	b=Ep7j1u7V1oM0c3NPv+LVCDnjDJL9x2MVMts0SD1sqxhNVQv2iwfN6q3JXVA5xGbkpJlH
	 JWuqy5CE1pNoJBstKjc071y3XnUTr3ukuHh2wBilhcxA2oVFdKrLcqlnmBEqxSktlB0Y1
	 CyFpRg1HBtOVfoKjSu+VijxSoukxZixDNng8L7qk50V9FpChcUnyGjlDLcOhcDX/uB7N2
	 I3HZul4pZLVfjpx6Ni7C8FmHKj238VO57zufEI6Oy8JYz7hi2WGbuED0PeEVhcLAnEH36
	 R1r8MHgKfQ4tAUbP2dsXVrA2hE8GkvbGRe/eNX/nZUNi2WHNqa7HLRYOMccthvA0yhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790834;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=kJOhfzdtZe+Oj4JHxXgMZEah2/px0FwAWGZJSAs6+wg=;
	b=CBG5MruSqHOrqVVNxT9BAPgL/t8evLsXLWJo2nUXq5zkYZzbR7Rxj8zYAC9oRxdAfQ+S
	 zjTFwc2h4V3BA9u2mvCApV1Fl1LBsTgg5yrBi7XPIWpl3CXyIwdFEfdiSUflqG4e5I1yd
	 2qzs2bOWF49m/zb+lvbPq7OeV5VDVP3g66S4pFX/kVyyAJ7Aw0afLbJ3FYgL2LwSHyDeC
	 7zCILUA0TROa556oQYPYP3EQDzUmS0OFusbThmoQqTL9cKX6GnE7dZak2xO35aiRcAMpC
	 qOJmLgJia8IID3Ywvuw9GuOxctNDTXpyLMUByd/FuaGJWj2veNhvckSWt6lMVr9xDAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=fail smtp.remote-ip=139.219.17.94
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E2C606A326;
	Wed,  4 Nov 2026 11:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E2C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TIYa0kQ6gxMLBB1Df9mcHHxUbDgKCSOS6/MdMcwwv5TtjlHXA8Ts3j1w8cbDRdAk0AhVcl0Z1smYwf8Rwq9SjldiyQ9eo7wS0Cdv2Qz1md55qyad67Oxq4NYnILEWwC8d93GVSB59QqVZjl6PaRjo9gfsO0dgyJmLOcx2tbHwaV/t2rbQLhXDVDiGb/vPjjqL+wpxY7kmIVYIEBoWWO0/0jq1RO7XaKSJ17fiwVs06PsZeAS7fkQnURJhAmQt5BeUemu7J0momYg7tzRl1Wj76qK08Dy0HSZL3T2j3hX3896Zy7qENHOZ3O3S6qIdB6NoMlnP412tuB+jnYNB5RRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJOhfzdtZe+Oj4JHxXgMZEah2/px0FwAWGZJSAs6+wg=;
 b=GALzYfhN0uuLEiOeM6VL+Moem4WEtiEK4wcXIJIeQsOsdSOzyRXifA8Ba0HYhyGY9D1E51NVdxsSrnfjlYG0y94YcTCZgp6E0GrhAVG21tpmnrE6u/KROcVnBwn4xExd9kWRH5DtGh11+Vhlq7RXVBbomxvmETRFV/3bFReM1MYSo82Tu0atu9f2olvCtEwZHKWrBnP/Uh4bg9lDLI8zJQuHhG6FFScZP3fZKt5dsc1n8IWX1GrQaCgbyaaCMEMokpFD5WOl2cPPut3Vj/Z42jqIXZUw1rJegiQDXiw45VSC6YWnw+AJa+cRyv5peMRNyeyXw5Wpo84OhcvCpEwEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB1096.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 4 Nov
 2026 11:13:38 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%6])
 with mapi id 15.21.0592.009; Wed, 4 Nov 2026 11:13:38 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen
	<Thinh.Nguyen@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: starfive,jhb100-dwc3: Add
 adapter register region
Thread-Topic: [PATCH v2 1/3] dt-bindings: usb: starfive,jhb100-dwc3: Add
 adapter register region
Thread-Index: AQHda19eEFN61G9rWEKBDTysSzdDwrccO7cAgAGInXA=
Date: Wed, 4 Nov 2026 11:13:38 +0000
Message-ID:
 <ZQ0PR01MB11110A2EF5257F9F495B8C38E6682@ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn>
References: <20261103064836.71059-1-minda.chen@starfivetech.com>
 <20261103064836.71059-2-minda.chen@starfivetech.com>
 <20261103-splendid-topaz-raptor-64a6fc@quoll>
In-Reply-To: <20261103-splendid-topaz-raptor-64a6fc@quoll>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1111:EE_|ZQ0PR01MB1096:EE_
x-ms-office365-filtering-correlation-id: b5c5935c-85d8-45fe-e8e6-08df3a64ad14
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|4143699003|56012099006|261022105027099003|261026121527099003|261028144727099003|261026140227099003|10067099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 +QORdmPukSiz4givAx2c0pevmQNahkxA4uSc1vFCbe6E/eJT5WqL7EXooa8wRBExOOGEZ+paMGBo3nclCTAEm70t5U1fV8D26b/0runVlaP5wAq4MO1kp4O4QDsiDErNJ3hlMpN3FwejlaJ+Ha7klz4Q4uqcIWFnIpEHkARIhzos040UkrkbE1pWG4Ak1sljzv7Ccx/yryI1bQtX7xu4Rx3YvxdU03SbasHY8rNuZ50i0yOtt/GS/4lAKKbAtYgkvvz7h+gT+nFf9ECkn07lYFVFRs9mEBlGPjPJ3XzHE/mO8IkMu45kHgS7fHEboLspKD97bTyAFZBl6odEBtdOVqIR902w5Is1wuiG2bRGsrTLp6Vw2YOpyOt16srlgDHTlACtFpUrCHlxke4OrGpUdD5T/aTKndX64vZ2/wUN6ywrYgw8aV9KPtKyJnGY0fufV0cw4qAMgV6c9nMc4q2YMpquN8UMxsfcwrRnfAFqyv3T6Gg0Q51nVHujXyivQpXK8CqU+3U1UjM7Bk5+Bv2j2/pbshS4zVqAg0TulteT3qcy3kzwuuPWjmWa7mqnGxSF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(4143699003)(56012099006)(261022105027099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDJZb0FiNDE4dVZ2YWUva1FiaWg1TVpTdlNTRDltWGtXcUdCOTFQc0VhSG4y?=
 =?utf-8?B?KzY1VkRwZWY5OXk5cUxoM1duR1Nvbk01a1FGTXNHZnIzV1NybmRGZUlEYVRM?=
 =?utf-8?B?bEdtUHoxNXJuTjRlbUdKcHZlbDBrSitpRkJTZmVWdVFhb3FCQ2s5dVJIT0J1?=
 =?utf-8?B?Q0NIdkFyRkdUTHl4MFNCb1Zqei9LSUhqUm9yMjlNdHhmM1RIaFVUZ2tEUjZu?=
 =?utf-8?B?VE44a1FkLytCRHFoZ09ydzRlRFp1Umozc1QzRk1zZ2VHQm91YS9sN0FVWkto?=
 =?utf-8?B?eW8rTG1SN05Ya1ozb042Vzk1b0J4c3FBK0MxVitYVTlTYzZFZzVUaXNqVk9a?=
 =?utf-8?B?akJwSWJ2cWpOOWdVTnBXWExGUUVpTFlMQjY0V3dTaC9uZDJNdVYweHNCYk1Y?=
 =?utf-8?B?YU5EZG1CczNJLzJhazZvei9ZMXpWOERXUEplMzF4VHpXN2F1bXdjZ25kbGoy?=
 =?utf-8?B?c3ppclBta0QrajJ0K2tzckZVekRUNUZYcTJZcERaR0VDQVBKVlhpcjJwV2Nh?=
 =?utf-8?B?U3dRN0VkdjEyekZ1d2wvTkM2akFzZ2tJdTFjOGVxK1ZKbm1HeEt3TzNNS3Vi?=
 =?utf-8?B?VXUzS0x6Q2pTSHhHcjEyVlFjVGd1eTl2Sml5ZjVQN3Z5QXNkYjlHQUZYbEdJ?=
 =?utf-8?B?NmlxZjFZOHRXcUphcGNVMXcxODVJUmYyT095U2VadjdtSHFIcG1jeDd2QVd5?=
 =?utf-8?B?c0xFOGpHVTg5UUNmSGtDcTVOQ1pnNkdXZFRSbXNuUUFpVk12Uzg2YlZTNlRu?=
 =?utf-8?B?bXRNRGZhb3luZDF4WlVzOXF4aXNQMHFZemlVVG9EOWRqVGpBYWk2SHJVTGhj?=
 =?utf-8?B?QktIQlBzVU9mYmhlRjM2Wm9ib1F3VDNRemFVdjM4WkpKNXRzd21pcWNsdG1j?=
 =?utf-8?B?NW14SlFzY01rbzZ3bGRYSXdRdEdtM0JBM1l4Ny9YSksyUHN4NmlNeUMxaDdo?=
 =?utf-8?B?QmNxR3ZvQnRsTWsrVEdiUytZK3M1OUpDb0g1bkJRTTZnUzNROHdaMEg5QXIx?=
 =?utf-8?B?cnN5bkNIZDNGR0taTmYwTjh4MFZzczFnbm9aekRnLzgxVjNQVVBrRFZFT0tk?=
 =?utf-8?B?TUcrUURQVHNkWld1T1U1cDFJclBhcDNnd1htdnF5RkR1WmdyKytIRFRmSnRq?=
 =?utf-8?B?dVBYOGV2aGE0MDVFMmQ1TTBBcTdkTm5PV2FsM25lNnlaZk10bm9INzlYbFVC?=
 =?utf-8?B?R1ZxV1c2cVhHNDhLam4zVCtiK2NmcGRXSDRuN0IyNlNGNXQ0d1hQY1oza1lH?=
 =?utf-8?B?TlQ4TE1ieDVWc0NYcFFLTytJOTRraDZ5TjVWcTFNaDY3WjEzV1h6MXF6TFBv?=
 =?utf-8?B?TjBkVDBNalR3L0w5MnJaUHpiVHhmZDBFazNOa2RCR0paczBTMTRvTHQvN3Zu?=
 =?utf-8?B?TnZSWlc2Q0s0N2FpOXIyOEFlai9YRmhBZFowc1huS2FDZG8yRUZub1hrdndP?=
 =?utf-8?B?RUN3amVuLzlVdVdmazFkNnlkN2lPd1ZiVnhPM1RRZzhUM3hjdnJHM1ZFVkdF?=
 =?utf-8?B?REdqQ1ZXeU5GaW5jZWxwaDdWbzF4RU5LU0drNHBCNUNqakFBR1EwM0FEa2ZU?=
 =?utf-8?B?VWQ5cUFiQzBlNzByTnRIUHpFcXh0akxhM081eG40L1c4NzBkU1Z3M2I3T0dm?=
 =?utf-8?B?RjVuZ1hlTFg2ZmxGdGlCeVc1Q1UvbTgzK0dlNXlBQk10R1huRVVmVHNESkdZ?=
 =?utf-8?B?UFpWMzRZdGRySG9TbGhGeUY1Z3NscmxjNGZ4OFNxWkNTM2ZGclI3TTRMa3JQ?=
 =?utf-8?B?Y1lLc0czS1BrVGZTRDJ4cExkd3J1Ri9tUWl0OEI1UXdBdTlNRDc3bzBYQ2l6?=
 =?utf-8?B?aHdWcE5xSGppd0RMeWZNVmNGdTBjQ2xObDd6TDRJekltMlZ6UlpOMVF1NDBQ?=
 =?utf-8?B?VWhPSEMraEhBcXU0NU01TnI5cFNPUVdSS3BQVXM1RXhEK1pEcFpPelBtMFV0?=
 =?utf-8?B?RnVtSUtDaTN4UmtIWVZ0UjFnQzRueHQxb3R2VFBOaDBlOHowSTdsOTdTTUQ3?=
 =?utf-8?B?Smxtekd3VndYOTI3cXpOZ24zVDVIdkg4SkV2THJqZ3Y2Zmx1K2JvN01zUVlY?=
 =?utf-8?B?K3VaM3ZYR0orL245K2ZiMUZjcnhUUUw5aWl3K0JFZ0dQYUkrN0ZjTHZTRm9F?=
 =?utf-8?B?OTNiNTZ2ZG0yOElETlVqbTVqT1picmRXcEtlcmVMeFNiQzFCam5hV0R0b2tJ?=
 =?utf-8?B?UzZGTE1kVDFvMHNrNG1CRjkxaTlPeG1kOFUxUHdBS1JyWC90OFFGVkJxQ2Ur?=
 =?utf-8?B?d2c5N2pCUW1QczRxYmkzMVlkUDBiVU5PbnpiODd1dHdJYmVlc0VMN1o2SW82?=
 =?utf-8?B?L2dMK1JrWkc0dlkxWEJzQ2ZSKzZuK0Myd056K0dTU2ozNThGNlBOZz09?=
Content-Type: text/plain; charset="utf-8"
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
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c5935c-85d8-45fe-e8e6-08df3a64ad14
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2026 11:13:38.4283
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ImtbtISsUOlVYFfc8zg5Y/u9DzNIqXGk4Ta5huSO5VDwcCvvlgNqJ5rixPxoNk0PnOjKvyDW87B/aG+yH7BvvB6XurTpEYXjqH165oFfE8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1096

DQoNCj4gDQo+IE9uIFR1ZSwgTm92IDAzLCAyMDI2IGF0IDAyOjQ4OjM0UE0gKzA4MDAsIE1pbmRh
IENoZW4gd3JvdGU6DQo+ID4gQWRkIGR0LWJpbmRpbmcgb2YgSkhCMTAwIHNlcnZlciBob3N0IGZp
ZWxkIFVTQiBkZXZpY2UgY29udHJvbGxlciwNCj4gDQo+IEkgZG8gbm90IHNlZSB3aGVyZSB5b3Ug
YWRkZWQgdGhpcyBiaW5kaW5nLg0KPiANCiJzdGFyZml2ZSxqaGIxMDAtZHdjMyIgY29tcGF0aWJs
ZSBhbmQgaXRzIGR0cyBleGFtcGxlIGlzIHVzYiBjb250cm9sbGVyIHdpdGggUEhZLg0KVGhlIHVz
YiBkZXZpY2UgY29udHJvbGxlciBhbHNvIGlzIGR3YzMgY29yZSBhbmQgc2hhcmUgd2l0aCB0aGUg
Y29tcGF0aWJsZQ0KSSBhbSBzb3JyeSBhYm91dCBpdCBpcyBub3QgY2xlYXIuDQoNCj4gPiB3aGlj
aCBzdGlsbCB1c2luZyBkd2MzIHVzYiBjb3JlIGFuZCBjb250YWlucyBhbiBleHRyYSBQSFkgYWRh
cHRlcg0KPiA+IHJlZ2lzdGVyIElPIHJlZ2lzdGVyIHJlZ2lvbi4gUmVxdWlyZSB0byBhZGQgSU8g
cmVnaXN0ZXIgZGVzY3JpcHRpb25zDQo+ID4gYW5kIHJlZ3MtbmFtZSBsaXN0Lg0KPiA+DQo+ID4g
VG8gY29tcGF0IHdpdGggbm9ybWFsIGJtYyB1c2IsIHdoaWNoIGNvbnRhaW5zIG9ubHkgMSBkd2Mz
IGNvcmUgSU8NCj4gDQo+IEJNQz8gVVNCPyBEV0MzPyBQbGVhc2UgdXNlIHByb3BlciBhY3Jvbnlt
cyB0byBtYWtlIGl0IHJlYWRhYmxlLg0KPiANCkkgYW0gc29ycnkgYWJvdXQgdGhpcy4gSSB3aWxs
IGFkZCBtb3JlIGNvbW1pdCBtZXNzYWdlIGFuZCBtYWtlIGl0IGNsZWFybHkNCmFuZCByZWFkYWJs
ZS4NCiANCj4gPiByZWdpc3RlciByZWdpb24sIGFkZCBtaW5pSXRlbSB0byAxLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogTWluZGEgQ2hlbiA8bWluZGEuY2hlbkBzdGFyZml2ZXRlY2guY29tPg0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
