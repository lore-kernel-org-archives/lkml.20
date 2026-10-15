Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010058.outbound.protection.outlook.com [52.101.69.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AB63EC685;
	Thu, 15 Oct 2026 03:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035120; cv=fail; b=BPr1pWKr1ktBWlq1qe3RJeKxRboi6Fo0ncgGaTYoTju8hL0kB6XXMSfjFa0G8D43UC2SjYh0MElQkzHgv4MA7LQkOsuQqk/2dOviSbGq03pNAnnSy+Hzc6t8+5XBTdUsOoaBQwOBtK5B+5ghdsYpy7bZRkrwWCVRXp7c8/RlB6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035120; c=relaxed/simple;
	bh=yq4mu/SwMzEkQUHVrOWTv9moZ7UucLPTX4CZilit1E8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qux0JFOSNyvwRCQzBCvicDTn1dVY1B1dyQYr4k39DaOLFKdRfgPACzZ6Ja2LBrKSUXmodXe3wFbMr40q4d2B5rLrhhalBpvX+RcwhjWvk9LLi5qzCYfJ7HCm9A+hAdGYz7Dwnz8xzALRHZHc8YZ/5WoYTA19+T97HXgI8v8f4cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=u2yuNF9K; arc=fail smtp.client-ip=52.101.69.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="u2yuNF9K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWi0gcxIwr5yR01r0C+WQAvESJXFWWckkAgTSgtvp1R3W1MPeI9aPdm3qUSlgES5biZpXhRshS1QATjjVchuAgGO90HTDvJp1Yea65clSdMhND1PGhNP4m4u+BXJ0Etxeqn9fkefbAr7g0Qc0tyxrT4J8SNgQs6jX0aUS4lVM+d5KCayz65gXYtD3HWx1dG5ZPH7ai0VwxhSqXqPX1DJhMiHyNhGZ5PZbow4Gz7wterkfUhD4+d9NtUWU375F3jBC7UjSa7CU5sP6fs8O214sczjSUEKb63Bi2zhEtpsQxuivseYycnzKSlfGnm8jC1sUBet/R/uRXUxTkJ55WreIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq4mu/SwMzEkQUHVrOWTv9moZ7UucLPTX4CZilit1E8=;
 b=tjRlbcrC084yUCwxOp+sYFXtkxyMszEgj7VRr96PkJJcllmQ4AfRb/0Q5+wiPwwA2Jtkb86e6XPszyIresTZTXvUqafZY32vPqD6fmIrQTuVqKK1aQIN4sHNm95hdQnjQy5QiBPcf6H/ENEX3cqfFrwb87PbrTBhZZPgARgzHMJo/B7DBfbFEvoSPwKLdE2MYPG7JyGUixRDpzzLMgIPKXET8pZ53IitqFJsNX9s0o12C2WDqu6/m4uisLrlErXKG2vUKT3teWEORxI/jdKJbGMEO7zgOlQ1+aU2WRgT4qEdFWnaAm+Wwyu+cdkZYxmtauYHqaie/ZaKzT0aMy6TeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yq4mu/SwMzEkQUHVrOWTv9moZ7UucLPTX4CZilit1E8=;
 b=u2yuNF9KSHBbSoFB75sfNcomqEbxeWjfRV7amktj9AQUhGYraQWCsVVXUudKCioM1FbEilbnL+kGNuH2hj6LBgcce6bo06GvAG56Re3ahc13yTWd3F+yjztx8F/6lAVQZh3kq6NXYiO68ndxEQ1Jx9fnv6t5arvcjefovy9i2m6dXA+OpMVz+ik4ynRvIjeJoir5q5CFYFLGr9didCXjCW/c1lwlp36A2vUI2y1EBxpJG1k+Oz3tXyQDlg2IO6dTFgQC1YKCofruXGFOcYe8T5lJgrOOzfO/9H/jOhpV9fgHxpOLnRVP234uQ7hohHT6Kr+IFy3IkaBsqO6+UETgxw==
Received: from AMBPR04MB335523.eurprd04.prod.outlook.com
 (2603:10a6:20b:7db::5) by MA9PR04MB492009.eurprd04.prod.outlook.com
 (2603:10a6:250:104::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 03:31:53 +0000
Received: from AMBPR04MB335523.eurprd04.prod.outlook.com
 ([fe80::de1e:8baa:a70f:1813]) by AMBPR04MB335523.eurprd04.prod.outlook.com
 ([fe80::de1e:8baa:a70f:1813%2]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 03:31:53 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Frank Li <frank.li@nxp.com>, Martin Kepplinger-Novakovic
	<martink@posteo.de>, Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team
	<kernel@puri.sm>, Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Alice Yuan <alice.yuan@nxp.com>
Subject: RE: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Thread-Topic: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Thread-Index: AQHdV9yFnPszN6D9yUivM5Ri/oliiLb9necAgABdSuA=
Date: Thu, 15 Oct 2026 03:31:53 +0000
Message-ID:
 <AMBPR04MB3355230D320B45E39F65B74126FA9C2@AMBPR04MB335523.eurprd04.prod.outlook.com>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
 <20261014215606.GB283442@killaraus.ideasonboard.com>
In-Reply-To: <20261014215606.GB283442@killaraus.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-10-15T03:29:59.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR04MB335523:EE_|MA9PR04MB492009:EE_
x-ms-office365-filtering-correlation-id: 24ae074e-ecaa-48af-01cb-08df2a6cdb75
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|1800799024|366016|22082099003|18002099003|10067099003|3023799007|38070700021|4143699003|11063799006|261009223027099003|56012099006;
x-microsoft-antispam-message-info:
 7A4yIMFsqzmTT3wVq7ITybRaeZj9NdB1vaTcRfm+0NQaN7vjgxQ9C7hCNwoR9xvagoC3/udYMhHX3VfjhpJytpDSdaLfiFrQSZG2FRI3IQTNoNQh1ou4aD2gYvhfi6/XCJ77G9J72ZI6cyeRWKCYFjF+okoYkn56balCKM6Djj3GjwBJjep60iRH7Em4apI9CtlB+eb9c5RToue+NcMwoEXaPA+YoRUtknNkmV1F158dzHdpGUE9+fu7GdUVBuO990yIuPrXmqO5RLE9oWLQ/We1QLoR2soMRkr9X56J+uEBvaLxR04KMfHouDX248+KT+9sIENGalX7pj5gqIs9NxqOxsJjfQyhGCRxJsBHXD+7re2sldcW0gkQOmPVSEPdVhZSmAco91xvIjTpIMNr41/vCUn4fTUG0oWvmiBuwHTOYb6vJkuzhOxEfp53rYFkjD4MHnmusUdzx3w+1m+DkbJc5quZxnzPsSN/dDw3jck5PQJVC8+xQ4ICplQJ50Y6SMBpnacY6Lsdow9prueyrFkAnX2eW8v/sEsGS4mFHwWinW2vhFah0IURHZwOOg8tTc81Da3qsowrRZEJjQ400VWTmLuke794b+2HbIX4JSUL8FsMU+MhDm9yhGJRUcaORSOUTe22dwCUn+Lv/9wllgMDH10WXuD27OOxqEqE9QQU6egMyCf68Joypt0E4BFvQxA4QKngT0AY8duQFxV/g2pgACxeoWUwRtb6v8N2oh4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR04MB335523.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(1800799024)(366016)(22082099003)(18002099003)(10067099003)(3023799007)(38070700021)(4143699003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZnVYYjUxRVRpVExoZ0lTRnF6WlBtMUQ2cXhqSUdYQVg2QXcvM25sVDVJRVJy?=
 =?utf-8?B?SFliTHhlUWo5SWI4akZTR3dIbklHMEpnekpBZEJ1c0duV014NkVNNjZtTy9L?=
 =?utf-8?B?K0hlRzhPOTB0TEUvNStDZWFVR1NpcjkxejQrOWFLNG5SdmtTSG51MzJXSDda?=
 =?utf-8?B?Tk5jYloyZWoxckszS1Bjd21nVGRjN3UrM3dGY1d6RndlRG5yY1ZFRmJQeURY?=
 =?utf-8?B?SHZ5bVd1S1BHY2ZTOVphMlhvdTRiNkJ1dWtJaXZWS2xnQVNYaHJoNzdCcC9G?=
 =?utf-8?B?VVYyNEtzcHhkY0IrbXd3djlVY1N4cW9uc3lubG91SHBmWWhXY0plQW5sbVZI?=
 =?utf-8?B?UWVITmptYWw4OE9lSFlPMWpaT1l5RHlzNFhNbHoxY2pQcWtDMGlaaVNueSs1?=
 =?utf-8?B?Wi9zSWo1V2hTaVBNWUh4VWRYUU4rcmdTU1A2M0gyZksxOFpHVUZ3RmFabk5h?=
 =?utf-8?B?d3JnVzBSclpiLzBYTVNqMUd3K1lrS0Vqa0FsYmdzOEFWamlzOUJxK2JLek4z?=
 =?utf-8?B?bDJ3N0kwci9OT011azcxOE0rdnMyOENsSGRTakw2UnMyWXd1OHpGdk42MnNN?=
 =?utf-8?B?UTlhUTlpT1l1UmkyQ1RKVTVqL09IMEdsMk1ZZVZBZDlScm5kalBoWm8rK1ZO?=
 =?utf-8?B?dFVIR1ZFTTcrWFhtbTJNcmxLQkFKMnJ3L0VseXZldDViQmJVV0xJR1pRYnJU?=
 =?utf-8?B?U0dPbkloUnpUajh0TXRMcjUrdzloYnhTUlFWR24rNmVhNzBUWjQ1ZjV5UUVh?=
 =?utf-8?B?Z0d5VElWV0g3R2ZPbkppTXlnZVR1VXd4a0NnUjZiUUdTQmx4a2M5TmtVdFly?=
 =?utf-8?B?RXVpREZPaWFQWnlTVHM2Q21jcjZnN21iUHptblorUkwwall1TDhuK3ducTVF?=
 =?utf-8?B?L1k1SmUwU2JxN25CTmxLejlPUHJvV2ZvTUpPQk1KbWlLSUQ2N213RThyUkZm?=
 =?utf-8?B?cC9pTzBtMFRNaVJrWEVCSXZNVWxpRTB6UzFld096YUxubVdQdk5NaGhZVzha?=
 =?utf-8?B?RU5HbitRY0FwUjFLWS9wbVlha3RERE4xeHN1OTRkRDhadUlJVi9QR3BvVnRa?=
 =?utf-8?B?b2FSaERuTEVnZkE4NDNrUHpGSkpCY2RvTmRxZmgwVzA1YlBaaTVaMGU3aktm?=
 =?utf-8?B?ZjRtNVVSNklMZFVNZ0xxekw4aFNUNjMyb0RPQ21lVG1xcGRWVktKYTY5TVZ0?=
 =?utf-8?B?TjdJR3dJM09LRkFib2xzL1hHamZkVFJMVk1BejJJUlF6akd0bUYxYXkyUE9w?=
 =?utf-8?B?NVMvN0s5a2VBK2xBZFdYelZja1pWOFZpY0ZSVzFmSjdTeE9xQ1JobTFDMHNK?=
 =?utf-8?B?K1R1QVhLZEhVTU55Y0hxalJpY3pHWEJLdHJpNnBiekdxOEtPdnNrek8rbSsx?=
 =?utf-8?B?ZWxsRi9VdGduY21Ec0NhYU5NZlJEbjVDSlczVkh3QmJlRTZtTHB4SFNucG82?=
 =?utf-8?B?Z1NyeGFaWEY1cjdLNXkxTGZVVHZzOGhzVkM5UlM4UXU3SzduL1BhUS9PNGo0?=
 =?utf-8?B?NlREZ2NkZVVNQndwbTA0ZFhmcUZjSmZzampLU3NjVnE4TDFoRG9Ibml5R1lN?=
 =?utf-8?B?RU9wVk42VVVRRngyUFZZK055cld2cnhiMzF3OHJ0N25idkdoM1dNMURzdito?=
 =?utf-8?B?S3c1dmVxZUpHK2E4L0J5ODFvZWNGRUtYNDNqdEZtUUpLSnVlYXllWTA4aUFZ?=
 =?utf-8?B?VzdkTmpqN1oxU1VJY25VUnZVcm1oNEw4aXNPWWk0a2dTWG5aUzdqOGZVTmtP?=
 =?utf-8?B?cUdDa21meERacytKajdDaU5aS0d4eHhLVDQvRUNSbzdyRENMelg5QjVjbUxS?=
 =?utf-8?B?UE4rNkxCaCtXNTFUWmJxbUJVY3BhMGNyYm5rcnlEc04zdDJacDJVYWFvWktE?=
 =?utf-8?B?YnRFaTN6cTAvZXVuK2FlSDBOTHFKK1ZIOG4zZFJaRFhjcUNxWkNhZGpBL21Z?=
 =?utf-8?B?N3NScUpxbjcxenMvaW1FREU2MU1sRW84V2srbDY0a29iK1BqREQ3MnhtT1k3?=
 =?utf-8?B?cklhd2hlV0s5eXQ3RkdrbXJtb2QxZjdldlZQb3FQZ1B3cWh5M3pjam4yOVo3?=
 =?utf-8?B?bTIzTnVLM2NOOTdIZDVmOEFaZWlUaGpjK0tzekZsdk9TYStYVnMwaks0bGRK?=
 =?utf-8?B?bEFpWWNhTzFkMERZK0RxMU9xSzZzMVlrcGt3bU90RWU1QzJGcWVXZVNEWVpZ?=
 =?utf-8?B?ZVVIN1RLckxmOEZsbHpONS9lOEZrVTc5UU93eURrNjlTQXRLQ2d3KzN1cmFY?=
 =?utf-8?B?aWtGTEpFSkxVYkMxQ1dvdmJvajlERzhMdUZ3elJmckU2ajlQVWVPdENuUGtL?=
 =?utf-8?Q?Nl0eLsrFp9+w60dbsb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR04MB335523.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ae074e-ecaa-48af-01cb-08df2a6cdb75
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2026 03:31:53.6254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hhOvnr3nShKily2c6NZPB36yaGR1qkv85hoFbIGRuCn841DMpGTcbkbaOiuEs0IG0gpo1NGHLOSRp51maBEh9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA9PR04MB492009

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KDQpOWFAgQ29uZmlkZW50
aWFsDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IExhdXJlbnQgUGluY2hh
cnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogVGh1cnNkYXks
IE9jdG9iZXIgMTUsIDIwMjYgNTo1NiBBTQ0KPiBUbzogRy5OLiBaaG91IChPU1MpIDxndW9uaXUu
emhvdUBvc3MubnhwLmNvbT4NCj4gQ2M6IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29tPjsgTWFy
dGluIEtlcHBsaW5nZXItTm92YWtvdmljDQo+IDxtYXJ0aW5rQHBvc3Rlby5kZT47IFJ1aSBNaWd1
ZWwgU2lsdmEgPHJtZnJmc0BnbWFpbC5jb20+OyBQdXJpc20gS2VybmVsDQo+IFRlYW0gPGtlcm5l
bEBwdXJpLnNtPjsgQnJ5YW4gTydEb25vZ2h1ZSA8Ym9kQGtlcm5lbC5vcmc+OyBNYXVybw0KPiBD
YXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz47IFNhc2NoYSBIYXVlcg0KPiA8cy5o
YXVlckBwZW5ndXRyb25peC5kZT47IFBlbmd1dHJvbml4IEtlcm5lbCBUZWFtDQo+IDxrZXJuZWxA
cGVuZ3V0cm9uaXguZGU+OyBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Ow0KPiBp
bXhAbGlzdHMubGludXguZGV2OyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFy
bS0NCj4ga2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IEFsaWNlIFl1YW4NCj4gPGFsaWNlLnl1YW5AbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gbWVkaWE6IGlteC1taXBpLWNzaXM6IGFkZCBzdXBwb3J0IGZvcg0KPiBNRURJQV9C
VVNfRk1UX1lVWVY4XzFYMTYNCj4NCj4gSGVsbG8gR3Vvbml1LA0KPg0KPiBUaGFuayB5b3UgZm9y
IHRoZSBwYXRjaC4NCj4NCj4gT24gRnJpLCBPY3QgMDksIDIwMjYgYXQgMDY6NTg6NDFQTSArMDgw
MCwgZ3Vvbml1Lnpob3VAb3NzLm54cC5jb20gd3JvdGU6DQo+ID4gRnJvbTogQWxpY2UgWXVhbiA8
YWxpY2UueXVhbkBueHAuY29tPg0KPiA+DQo+ID4gQWRkIE1FRElBX0JVU19GTVRfWVVZVjhfMVgx
NiB0byB0aGUgbGlzdCBvZiBzdXBwb3J0ZWQgYnVzIGZvcm1hdHMuDQo+ID4NCj4gPiBUaGUgZm9y
bWF0IHVzZXMgdGhlIHNhbWUgQ1NJLTIgWVVWNDIyIDgtYml0IGRhdGEgdHlwZSBhbmQgMTYtYml0
DQo+ID4gcGFyYWxsZWwgYnVzIHdpZHRoIGFzIE1FRElBX0JVU19GTVRfVVlWWThfMVgxNiwgYnV0
IHdpdGggYSBkaWZmZXJlbnQNCj4gPiBjb21wb25lbnQgb3JkZXJpbmcuIFN1cHBvcnRpbmcgWVVZ
ViBhbGxvd3Mgc2Vuc29ycyBhbmQgYnJpZGdlIGRldmljZXMNCj4gPiB0aGF0IG91dHB1dCBZVVlW
IGZvcm1hdHRlZCBZVVY0MjIgZGF0YSB0byBiZSB1c2VkIHdpdGggdGhlIGkuTVggTUlQSQ0KPiA+
IENTSVMgZHJpdmVyIHdpdGhvdXQgcmVxdWlyaW5nIGZvcm1hdCBjb252ZXJzaW9uLg0KPg0KPiBX
aGF0IHNlbnNvcihzKSBkbyB5b3UgaGF2ZSBpbiBtaW5kID8gQ1NJLTIgZG9lcyBub3Qgc3VwcG9y
dCBvdGhlciBjb21wb25lbnQNCj4gb3JkZXJpbmdzLCB0aGUgWVVWNDIyMl84QiBkYXRhIHR5cGUg
c3BlY2lmaWVzIHRoZSBvcmRlcmluZyBvbiB0aGUgYnVzIGFzIFtVMSwNCj4gWTEsIFYxLCBZMl0s
IGFuZCBWNEwyIG1hcHMgdGhhdCB0byBNRURJQV9CVVNfRk1UX1VZVlk4XzFYMTYuDQoNClRoZSBz
ZW5zb3IgaXMgdGhlIE9WNTY0MC4gSXRzIGRyaXZlciBhbHJlYWR5IGFkdmVydGlzZXMgTUVESUFf
QlVTX0ZNVF9ZVVlWOF8xWDE2DQpmb3IgQ1NJLTIgbW9kZSBpbiBtYWlubGluZSAob3Y1NjQwLmMs
IG92NTY0MF9jc2kyX2Zvcm1hdHNbXSkuIEFjY29yZGluZyB0byBkYXRhc2hlZXQsDQpvdjU2NDAg
SVNQIHJlb3JkZXJzIFlVViBjb21wb25lbnRzIHZpYSByZWdpc3RlciAweDQzMDAgYmVmb3JlIHRy
YW5zbWl0dGluZyBvdmVyIHRoZQ0KQ1NJLTIgbGluayB1c2luZyB0aGUgWVVWNDIyXzhCIGRhdGEg
dHlwZS4gVGhlIENTSVMgaXRzZWxmIGlzIGEgcGFzcy10aHJvdWdoIOKAlCBpdCBkb2VzIG5vdA0K
aW50ZXJwcmV0IG9yIHJlb3JkZXIgcGl4ZWwgZGF0YSwgaXQganVzdCBmb3J3YXJkcyB3aGF0ZXZl
ciB0aGUgc2Vuc29yIHNlbmRzLiBXaXRob3V0DQpZVVlWOF8xWDE2IGluIHRoZSBDU0lTIGZvcm1h
dCB0YWJsZSwgbWVkaWEgbGluayB2YWxpZGF0aW9uIGZhaWxzIHdoZW4gdXNpbmcgdGhlIE9WNTY0
MA0KaW4gWVVZViBtb2RlLg0KDQpCZXN0IFJlZ2FyZHMNCkcuTiBaaG91DQoNCg0KPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IEFsaWNlIFl1YW4gPGFsaWNlLnl1YW5AbnhwLmNvbT4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VAb3NzLm54cC5jb20+DQo+ID4gLS0tDQo+
ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteC1taXBpLWNzaXMuYyB8IDUgKysrKysN
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteC1taXBpLWNzaXMuYw0KPiA+IGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14LW1pcGktY3Npcy5jDQo+ID4gaW5kZXggNWY5Njkx
ZDc2NDM0Li4xNGEwMGI5ZmNlZGYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9ueHAvaW14LW1pcGktY3Npcy5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9ueHAvaW14LW1pcGktY3Npcy5jDQo+ID4gQEAgLTM4Miw2ICszODIsMTEgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBjc2lzX3BpeF9mb3JtYXQNCj4gbWlwaV9jc2lzX2Zvcm1hdHNbXSA9IHsNCj4g
PiAgICAgICAgICAgICAub3V0cHV0ID0gTUVESUFfQlVTX0ZNVF9VWVZZOF8xWDE2LA0KPiA+ICAg
ICAgICAgICAgIC5kYXRhX3R5cGUgPSBNSVBJX0NTSTJfRFRfWVVWNDIyXzhCLA0KPiA+ICAgICAg
ICAgICAgIC53aWR0aCA9IDE2LA0KPiA+ICsgICB9LCB7DQo+ID4gKyAgICAgICAgICAgLmNvZGUg
PSBNRURJQV9CVVNfRk1UX1lVWVY4XzFYMTYsDQo+ID4gKyAgICAgICAgICAgLm91dHB1dCA9IE1F
RElBX0JVU19GTVRfWVVZVjhfMVgxNiwNCj4gPiArICAgICAgICAgICAuZGF0YV90eXBlID0gTUlQ
SV9DU0kyX0RUX1lVVjQyMl84QiwNCj4gPiArICAgICAgICAgICAud2lkdGggPSAxNiwNCj4gPiAg
ICAgfSwNCj4gPiAgICAgLyogUkdCIGZvcm1hdHMuICovDQo+ID4gICAgIHsNCj4gPg0KPiA+IC0t
LQ0KPiA+IGJhc2UtY29tbWl0OiBiMzhkMDZhZDFlMTNjMzI5NzBkNTgwMzljMTU0ZjAwOWI4MWEz
MzY4DQo+ID4gY2hhbmdlLWlkOiAyMDI2MTAwOS1jc2lzX3NhbS1jNWMxMGVkMTIzMjINCj4NCj4g
LS0NCj4gUmVnYXJkcywNCj4NCj4gTGF1cmVudCBQaW5jaGFydA0K
