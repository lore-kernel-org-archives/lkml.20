Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023119.outbound.protection.outlook.com [40.107.44.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13347ACD9;
	Mon, 12 Oct 2026 12:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807434; cv=fail; b=B0FBfsuUr6PFdj7aqezhoBs2kiWuCzMQbrPaeOUZQuwYY5YzOZ0HJ99KuWrBHbZBdJN4MC9/kJBgw+nzFxhxaMMOE2BAOCg3gU6iRmmHACuDK05SMmYi6Ssje5XwvWrKUVUmELtsawZGw1Me+3KghmSOdwDPxyv+nfs5q0edKJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807434; c=relaxed/simple;
	bh=iyUlvC7GTGbvdjjqjy5oxp2+EO4tnyglAycjddZHdCs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=bBjbFBoT1a0Wxoj4uAIOxcKuQ/Fb/Rv7RFeJqtpIql8XZRZRf8SfXvMUhIcF7fqrO3d8WYSZVIDTyiHOdIrk9XaKjYhy3aHkaYg/RqUlP1D1ekc1YWCs7JZFbG4lA+Wf1o/YPQ2AV6SnlEA+t/NTJAW1Z57WAJCuyjB7YS9xPhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=Hx3pRy3d; arc=fail smtp.client-ip=40.107.44.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="Hx3pRy3d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1ocQk/WLQZMhDRsG00mgmtaa4HCSHhtzHQSYsxOoOQAXuLYEPUotp+H0g8JAcaGlaDcq3atp2tmMss2+gEjgZ31P2TDCYiuAtSGSGiugjveuVrcSX9ECE9rqhk6DlcXO8RXWXycsROoiL1qh0eJYiMALcLxZ+HLKgC3zDLjV4DXT5+tw0uvwGjj33pvuI/mJWZNpb47B1tzlt5SHb7sR+AslkhyZE6WO4XrgC0wGZdXmbSvBUrukLF/uCK96PwjsbCusjP+DvCTRiMXj6VZVLnaShRH78l1hKbJzKwdewpi5YtL72OgjqCT9A0YV2rizPkBSGa72AE5AaTgTt7u+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNgYlCRkbcE9Cmhx9HPPzAgfY0g90N2dZXzf2gNB+1g=;
 b=QKckujfNkZSWbhjz31sH63HK9rmeu+FyL/W+TyzboaUiBaxQHV3hBzT+sV0eSyx9TupzkANodHMfM2eMSV/vTtwCMlF2DmC6Rc/cbbKNenlFMeVkE0zUlT8gFWhhxJpOsNbl/3bnMgyqxDfsV3j+SIxckuXXuMdFSevCsxOncksDxWdVudmkCOzOJXXcqNSmGGDOOGKGdgP/E5EbrpeKGDwdsubaCXcIIsRGiMm4jmvoKdDIQ0Himq836F9h52fAc8fRtFassCrkQJyr21wTs8O6/isBxhv88uQFRiMYrEFWxDofdj0nTVN/D+OEkiYVKiSXmsNb0wYB+WQjTl/CAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNgYlCRkbcE9Cmhx9HPPzAgfY0g90N2dZXzf2gNB+1g=;
 b=Hx3pRy3d1Hz8Sd2uSEN/aDWBhCjrbeFrGhdtZl0AvL6eTJjpUjWAKHyepWn0lDrzP6fUt+8JZVJs2o+MMm/BDs+aC7B2avZiua++6A0EFORz19yaI/JITf2S0z5Ox3MWB5hEqv5FQe3P2yn4LnpfLxmGH+mxGXqv6Sxw0QLESzZYZPgNhRJdjdQjCxiCBvBhPLjXXooM7cquouDEQM1NqA2EpLd/16EihZ42KHT5wkx7WPjiZ4P11qk7i13q/EovzGzwvclzkKhQUkp23grfFw9IWUa9qh9okDxA2sNTWEeoDVs4yU5W0c14oHHBTyWPI0Jl3TtSMneCzub8uuPKxA==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by TY2PPF1753F85B8.apcprd01.prod.exchangelabs.com
 (2603:1096:408::389) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:17:04 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:17:04 +0000
From: Miotsuki Mizuno <founder@crepuse.com>
To: "heiko@sntech.de" <heiko@sntech.de>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>
Subject: [PATCH v2 0/1] Enable I2C2 on UNIHIKER M10 V1.2
Thread-Topic: [PATCH v2 0/1] Enable I2C2 on UNIHIKER M10 V1.2
Thread-Index: AQHdWkOXlVbh5l/6wUaqSYWUinuFAQ==
Date: Mon, 12 Oct 2026 12:17:04 +0000
Message-ID: <20261012121701.53360-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|TY2PPF1753F85B8:EE_
x-ms-office365-filtering-correlation-id: 90ac3da5-545d-4b9f-21b5-08df285aba11
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|38070700021|56012099006|261009223027099003|10067099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 rICh8tMo2y5GX7qJ6vijlOsF4maBNJOjwvWs4jD2eVqUE72mLS/V9wvSt4GFjz8wDDh4s7wlzJsPXfWzm+e6MliykPfGNn7hFlS4E7XNNO6r1Tm+Eg3r/ibVqX2Go71bE81rW+SFjk6VIQhiBsHeweQeuBSyMKtKidmSRRd8xFkzk6ATcbetHaNL83Lvme1dQ36xA+tsCu+t+AnHOJ3E9LB3kIg9gE/GJEHzj2x9pFVLdtAR5F8oKypz531N+yeZ/kUwRfOlANlVjP/JP4Y/A+MoWkXtpG5d/KnBNXTFSr0TB8R3988ik1ppcbncqeoaGXexe6SD2yD1JW0auzUuLghQ9X2UvJt5/T/1AzGs6CpLVZyhEvoBPfA4RDUUHSy9FigItmMfXAicS2eLwBllZnadeisGv2SogiEqYMRjbVjoQtqqIklhqBH0PcCt7+WKN10/kZCjoKBXQSIlWY6JSFI9KMxsAp1Zf2zyWKsL0m0WZXHfBpeYEI9sgtAu0ZiEuOsDPTep9lzD1IO1/lVq+54AmKq7Q3Y/FeYRnFBEmIRIII5i7k66ixFPxXpNr/F+zGVXZdAs6BeTIkGVBaDHJvSXXvmRQtxRs6iJcS+WKciUsghIQLZsX2LyXT9FAn9l/w38xrSWLmLGfL+SRUoaK1GqXrkvrZE3OTczGogM8xIPKZ8taJYLrajxcamM7mY5d4RjVx//AcU1h+2JCI1N7ztEoDDkympG2TBJ+0DnBck=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(38070700021)(56012099006)(261009223027099003)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IhWFsx4lcKl82ZrIlQ4d8O5cOwQ2XXjwtVl/7UPDBFkkdPUJJKiUqK6dbq?=
 =?iso-8859-1?Q?llC6AZJ1hhxqEcXbC/9SQe0qfijiExfNym8F1GA4l2sHrolPK2Oh0yM3ju?=
 =?iso-8859-1?Q?DB0DWIHxY8jSoZduf1ZoXknHsXHluvEcFU6++9pAkd1dQU0d8nDQsdRKWB?=
 =?iso-8859-1?Q?vw1Dagxy+axjYaegg/BtbD6sCmrOoalprmBcQbK6KRpBpp6KehgwdkMJU0?=
 =?iso-8859-1?Q?TWszzt7gZJO876wVNDuM7pbofF8ANXs8uDegQBmC/jAqPLcPr8lDo5RpPz?=
 =?iso-8859-1?Q?Dgqs8ggrtkbIfKuSb2w9Y1gfCkhiq8YeBa4+qlKqy+pVhgrMY2w7SgGTvC?=
 =?iso-8859-1?Q?T8UyvaLzaZdUfY8gbbUMBBRlMewfV9OPLB2vDEOmY1OzxMf3xF3fv5W+BN?=
 =?iso-8859-1?Q?xMdG7iEHdkL/oZofmWgPfmmFPMXICaDRoCAULIYAhO+zI0ut/zHVDuTBtZ?=
 =?iso-8859-1?Q?VrynVxY6v50S2DH0VIXufOm1hILU+XI4vvvchTkmzZiz7XuatxDW4LRZr7?=
 =?iso-8859-1?Q?4eSedcprouVDWOUdWpqJD0cFlGhVi61ivxvmsiJFOBMWJObkaaFeU4nQwS?=
 =?iso-8859-1?Q?SzFCvUNHE3u4AZmEKLaTkssVS89Rgsjm9B7GADPmk4quq4oOxCgOr/CHSj?=
 =?iso-8859-1?Q?8viQq64Ma1nSWHrR9MDiiHO4jK2D+APPf0V3zK1Ja7CRvBPBayJzv1Txlh?=
 =?iso-8859-1?Q?RABoKP6lgOKxTMzLV/Eux3Rs1QOCT2T5fxA6jg5+2Uj8EQGITemiKqPbs1?=
 =?iso-8859-1?Q?5qhTo4HMJQMMYOacttYZxC54d3qSSI9QjdhaBfzV/fKm9bsMFu1932it+2?=
 =?iso-8859-1?Q?nwqCqeoi58DTtY1inAdTzmAXTBVM1KZLZ63su8TsUiW1Hw+VHq+ap3GX1f?=
 =?iso-8859-1?Q?a1pwtv2Tf/IwOKQfArJDpMrMsSyroTSPkPsmx+65pDS47qGouMwZDTnPUr?=
 =?iso-8859-1?Q?cs+SfJ9HlmXlLMsYDPifYMWylFVrOCcs5koRkLCg98lcBMP9YqCGqVTnme?=
 =?iso-8859-1?Q?7+gH85SQM1DocHhG3hgMICRqfwnjFAdm2mc0wZ6NIm0azRU2KOQ41Wogas?=
 =?iso-8859-1?Q?IssuM88KBlr5iGl099iedObzD01ocJRaPrXegoVrrON+uwQe1mf2YdlNLX?=
 =?iso-8859-1?Q?QmYmm1/7Lylosvno84Ai5Ygid2JGs+AoGxY6XekScFtUkGOO85pUDp8S4y?=
 =?iso-8859-1?Q?f1kL77hm02vfUgVwp2XAwWerVfy8LYosD3hm9wtybyBWhI/fHj+U+SSa+Y?=
 =?iso-8859-1?Q?vG2uP/InZ9cgBPF3MWAiDU9eCtGT/BQsVD98STc+cM9ari3pU9cUxSGYwy?=
 =?iso-8859-1?Q?geKiwKsThlgkBENeT97VDTJOVO9mjZNYsUvcZA9AwH/otXQIfjFbMHyYFX?=
 =?iso-8859-1?Q?Wjo0nI93qe8rEhEnjTk1xqrs0AN1YlIb4gEBeUlyLHYqD35PHiPsWl9558?=
 =?iso-8859-1?Q?in/uvnadmcu35mKcmVwMH8kshNQ2YDLbpM7zVVAugybKsfGf+T3DC0ugMJ?=
 =?iso-8859-1?Q?5H7V3BbBTXXUI1U+iQ2midUARNuUFY1838cZVJKzryVqexxCsC7xFff3LU?=
 =?iso-8859-1?Q?ZdQdK6DJgpIrw93P1oM+i9OaTR8PziR4JUs3ed7a4C4aAptdaeeb/JBp/L?=
 =?iso-8859-1?Q?+qosB6mw7ePe3qjyyjFgdvH8FR5dRGPq9LQ+5AjUDzjKlJg1YIrseQH8me?=
 =?iso-8859-1?Q?nvlhuYZq85BcpNBQoG8P/l39Hy23fIN27si3WWCNG1aVg2DkyDW8yBZ0gd?=
 =?iso-8859-1?Q?gkb9WZ65rN+VCv+kDGiYYBBpoi908GHgPhnekBpBiz7ty4?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: crepuse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUYPR01MB8186.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ac3da5-545d-4b9f-21b5-08df285aba11
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 12:17:04.3413
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lsNHzQ5aq1LZl8WNcjUTJtU8HZQiT63hqFhpyhtyrqSS3SL79GJ+W63KDzlHpheQEXB4b7bFKZqhwyEh5kbvcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF1753F85B8

Enable the onboard I2C2 controller at 400 kHz. The rk3308.dtsi pinmux=0A=
provides GPIO2_A2/A3. This common board preparation is independent of=0A=
the pending touchscreen device binding and driver.=0A=
=0A=
Changes since v1:=0A=
- Normalize author/sender identity and preserve it in the patch body.=0A=
- Recheck ordinary and strict checkpatch and the DTS schemas.=0A=
=0A=
Mizuno Miotsuki (1):=0A=
  arm64: dts: rockchip: Enable I2C2 on UNIHIKER M10 V1.2=0A=
=0A=
 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 5 +++++=0A=
 1 file changed, 5 insertions(+)=0A=
=0A=
=0A=
base-commit: ae965b9856f033145e292b0c29082a26bcc45efd=0A=
-- =0A=
2.56.0=0A=
=0A=
