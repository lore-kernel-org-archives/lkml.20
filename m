Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792794528;
	b=v5lZtVkse4bCTEhddS7NwRz8xxXlHrE52XLg6UJUkwQd/dYPKslNO4WbFiBxZNDuPkne
	 BYcMRAhqb1WUBEOlc+1jR8nxwDgI3LN9J53VIpLrOchALIOFj2rIsdEZX1lOYYqJLEOej
	 OzRf9WaXO+kg0owLEW/XM/hjEOSw/Mf157LeKkJHegGp9k8ZlKtEVQl8YwKlHWKULAr7V
	 ho/o8J4tydp93NPWq+IfV3CjfF+HFsKmZEG5jlAzJenQnKzqwwGWX18pTVdJx06bNE53g
	 MpqlPGwe2ZBN5QKUQG2wyWiyqovgVzxZKOw868oOyngi5u80Yo6N9BBvp4KxVjqIBVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794528;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 msip_labels:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ld-processed:
	 x-ms-exchange-senderadcheck:x-ms-exchange-antispam-relay:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wdFk9NNRyZFOcFIMWpHQR1F6XInuxFlekcQdqCxL6RI=;
	b=D1/m8RgJPtmLKYLhz/4HGVy5kOceDeXPkDxLYviOHm6RuUdM8MyhNjnwMcVUA7BSK0g9
	 z5+5XEgo8cpA0Lj3cKfYgijjSayAwL9B25NpFtR2JZ9ttctXZSvzTZ1ar+v6pZBfkXJR3
	 hjA2iMgxAFUYx1VgKR7PjE9Zw9nkTGeXzJuXjZAQTRu70+9uP0ZPvgrjpkKDDtNfCdzlk
	 D9mVU+QT4IMa3wbcMdGQrQr/4rRhqPRr6w1QRyWbhPZIYFlZU6f6SJ8Jqoi0okTQ0AmNC
	 96+J+tVe87anzJazW8eIGWRlR9oxFmbaVNjQMDm0iTJAIKWdRcr14vm7ESUNcnPmmdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leica-geosystems.com;
	spf=fail smtp.mailfrom=leica-geosystems.com;
	dkim=pass header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=jrmuAi64;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.53
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011053.outbound.protection.outlook.com [52.101.70.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F212C606A31A;
	Fri, 23 Oct 2026 22:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F212C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.a=rsa-sha256 header.s=selector1 header.b=jrmuAi64
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=en23i8pdhxPpHQbJ4b5KS5UdBoWtwO0e8RidzPQRDKJX+fbM17Zwn5RwhO5MBaCn+w1JKvqNjRABhVgVWM1XMfn2R4OWvThz0oC9XORzU9aZpoBZVAvgvpCSUHqsdNlFfVCzrx30v7oiNQ1PSQksqRCbCe+U55U9GWX/8PKFVF8t+DaEUgyUeG6TXk/aTG1ZLhSKg8KPOYD3ed76MVXGLP438tWx34dm6rGW/l3j+OeByoeBSaTBYAS405pdTcJhMnh7w5Xdcn4lrsupeSoXkVLTX/fZi0H1OWI00fmEAM1h+SLhLQMr6PQt6A5AL1wcDpnhHvzu+I6ZQxWIvAJ7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdFk9NNRyZFOcFIMWpHQR1F6XInuxFlekcQdqCxL6RI=;
 b=Xb4smd4bia9HrHEFbcX8ff1HNJwPiJK6zoxVzyYz4atMhkHXP5sll/HXfXb4t5z11HoCXXTA/PbKaMhp3iCPRjzD5EnvV9IQSM8vDSkPM83UOPLYw+zaEoV4nkp5WXpqblqcVS3RIAqqDZnyTVPY8p1Q6FqYY2Gspqn5ydJQcxhjpKrFo4fxJmEfoUl7z+3/GB/4C8Qa0tW/N5eNmShXQm0K/uNEJ+cdsJx6h/WnpnGLoY8mcjbeaKk+dfLkoyBR5qEbfPSPueI4VMrps/Jf+iRvL6uDSd0B1fnsAWloBzmtxvvjzBct853rRfqIg1Tc5VNCoEo1UdYokv0qP/dyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdFk9NNRyZFOcFIMWpHQR1F6XInuxFlekcQdqCxL6RI=;
 b=jrmuAi64gSYLCrK5hOLUQy0leyIiOY/EduW88sF30eDtyoayr4imMZo+v2E7Po0oC10rud83ghxrunfBwix4/B5bpQQECb7BkoDUKapc1Il/qFTuOxF4iaQh9UG76S2Lf9KMOBVKpbYOUpmLm8WsM2QpMrVye3vfHJcUzDmpQ4s=
Received: from GV1PR06MB8369.eurprd06.prod.outlook.com (2603:10a6:150:20::14)
 by AMBPR06MB10889.eurprd06.prod.outlook.com (2603:10a6:20b:759::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.18; Fri, 23 Oct
 2026 22:28:45 +0000
Received: from GV1PR06MB8369.eurprd06.prod.outlook.com
 ([fe80::fd32:c33a:c0db:65d0]) by GV1PR06MB8369.eurprd06.prod.outlook.com
 ([fe80::fd32:c33a:c0db:65d0%6]) with mapi id 15.21.0546.017; Fri, 23 Oct 2026
 22:28:45 +0000
From: BRETSCHNEIDER Max <max.bretschneider@leica-geosystems.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: ov08d10: add get_selection support
Thread-Topic: [PATCH] media: i2c: ov08d10: add get_selection support
Thread-Index: AQHdWbp97kJFwSosak2iR6ujkOIPEbb5rewAgBH8Ve4=
Date: Fri, 23 Oct 2026 22:28:45 +0000
Message-ID:
 <GV1PR06MB83698BCD22508BA5DF19A0A1D3642@GV1PR06MB8369.eurprd06.prod.outlook.com>
References:
 <20261011-ov08d10-get-selection-v1-1-5debe6436765@leica-geosystems.com>
 <asywCh3X0yJVcxRd@kekkonen.localdomain>
In-Reply-To: <asywCh3X0yJVcxRd@kekkonen.localdomain>
Accept-Language: en-CH, en-US
Content-Language: aa
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR06MB8369:EE_|AMBPR06MB10889:EE_
x-ms-office365-filtering-correlation-id: 48ae583e-e129-4eeb-2af2-08df3154fff3
x-ld-processed: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|10070799003|366016|6133799003|18002099003|22082099003|38070700021|11063799006|56012099006|10067099003|4143699003|261022075727099003|261022113327099003|261022105027099003|261021135927099003|261021121427099003|261009223027099003;
x-microsoft-antispam-message-info:
 /WD0m9KkSMWv8+NOaLCVLT13B+BUbOmQYJEK05r8aqxvPcpmZ6C7vW06jUJDYKVgDzI3kt2xo6wKcJuwb4jmA4www121o0THprWhdFhnn4p2plShP3VULW5iFQxN6GW9dL2XsQ8lhuAa2TQg4PD29R+iVX8Q5dceouz7KV+9yWIL/cLIPtXwvceTKtPTQjZUkQBVlvP+FfubM8i4IVfBcL8AMox92plr5g9bTPkUPJSfY44IDlGeU0+EXgwmfDXMtzR1TFJuk4fvlZFRR5issAGuaJy6j3NLjA0rqVrBSyHvRmo473pg0CzhaGRKWDijrfM3BAylkiTxx76Hsy2lvvwhtGpYS35kCwTljm20vt7VMTRRcyCbZMI6Jx2Q4udA1l8CUIGVrQyuntvsG2jnl3kGpZQ+w2iiT8IAi8Zf9Mt6vi7hrN4XNEZRephnC1oTNDrV4axfH9dNieZkQwUjxSYLx0sroyInCMoPI59cz8IcmRCKH7IsaJA3MoBRGC8dmn1RnjnFUGfy7ErhA5WS6QTQRJ4FhYIwCyvOUYpz/eHTrysVDMMW9TVmVKMoIM6Iw6K+TKm38j1n8djUnWx3keXTNcAyvtS+xBm6MVxYl044XKSKfKBVt9c+b/xpx8ud0nGGwHk/K15ZLGifuHKpNhgnsisUqSQ5tW56T9nN5FlyGe0GrOiraPYi/q4NdfO4iAUMySb1tNrHUWnY0T916k7+AMEICRUWttwyfN+TI0A=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR06MB8369.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(10070799003)(366016)(6133799003)(18002099003)(22082099003)(38070700021)(11063799006)(56012099006)(10067099003)(4143699003)(261022075727099003)(261022113327099003)(261022105027099003)(261021135927099003)(261021121427099003)(261009223027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?VI6oHfloNmUIGv9i/CxIwF09Okm77iUh5u8F+bP/5K3aRWa4SGFL5QHU9EYV?=
 =?us-ascii?Q?l/jlNTcy0Z2y8Wy/epGAEv2e3sgwz38tLyeR74wj5n4pyIJG7ripE7xIOz5S?=
 =?us-ascii?Q?g8N+YPtpazbQ8UgDaf6V/ghEXOUJD4C05r53aVYYYNw9wBMPpzTZL3JJWK08?=
 =?us-ascii?Q?Oyh2TXD5gcIo32nhURV/UqHAPXuyN1M5VPws2h/1dc4Mty+/CqCzeomCoTO2?=
 =?us-ascii?Q?iZyBNfvWVl3ZtdUGGQ+an81xFrNMacNBOnE3MYual2dwg/MP++Ljjme0AXVm?=
 =?us-ascii?Q?jR7eO2mtsX8w5+N2RTscugXOh9JaWuX66HkSuZo2w71mT322lR4msyksPFJV?=
 =?us-ascii?Q?vd1qyNx1fMFwxlF2lJmaMyQgMY2lhrNTsUkBozL3a3u5u0WfOXhXMZel+uAA?=
 =?us-ascii?Q?s6n2hvnaAw/B1SMMac1zJEXTlAc19F4aZNavNoe4FwF+kSXs7xLwwd66l9tx?=
 =?us-ascii?Q?r+AYDAZtnLfVOjKEgVvuQoX0fw6iGHRJq9uhZc6PXuF34eraeqMn08PbFxT2?=
 =?us-ascii?Q?tYvlwB/8lCkLzbUym3oZHyk+YQ/7op3JcWJyqS5TX0z9ThdcpEZSaPL8Ia4f?=
 =?us-ascii?Q?/FX+fQ+27FeNXJqdvuykO4wa+0v6vkd2WJnoS+n8KKHUrIXaXhxHseHZRz2V?=
 =?us-ascii?Q?TqkCIsfZlRF0tNezfv/zH3E86N7l7EsKNoG8HLzbL/NwXn5DByOqF3OoWLON?=
 =?us-ascii?Q?8NhYMC79VOwALjYawlwcl6358HiV1zbJtL/v2VA96B6nRWgn3JAH5Wbb4/0Y?=
 =?us-ascii?Q?99ZUD7+91clL2o9+VB4gotwaJj5uNIpMMdythG6DZueEtOPCIC8xESTUi6pz?=
 =?us-ascii?Q?TjHgZACUYtq2DZ9TReKfAzCmAOhFvwJN6LfUH0wVc414fVrvDTkPSTAfrTzG?=
 =?us-ascii?Q?sA+mf0aCUrMlbjTB0HfibavAubcnuhCWnEVAxO2aL/bWXBhfNNDsxzaauPET?=
 =?us-ascii?Q?dwoYnD5BnXaHQf6T3R1NuCVTruoEg2+3YojI6gyBjAyAGk9tSbxC3qDRnnLD?=
 =?us-ascii?Q?tv2V9H7MjOWvI/2w9xaWYbApTYS33patB6awaNU9cUexrANrbAd2Bc2INmyo?=
 =?us-ascii?Q?WJi5zeTUz86H0mxF9TAXe7fFecM5UzBWsWWGyLK+BIkYuZi06zHCIGh9IFI9?=
 =?us-ascii?Q?ImVof8oI2TZK4ELIST8z8El5hd48sEhZovqs2xY75UNbV5tTxPDKe1WOzBJf?=
 =?us-ascii?Q?vFheb0DhekXI/2Rbfl6dlpeosBMVOLLhYZme5E58vLQF1jppV8yGYFNPLLS8?=
 =?us-ascii?Q?xFGX2DjzHNnih8B8Q84tPd61Rbac86Cn2OoLgSDBr3BUa86ebSXVPEarQ3ag?=
 =?us-ascii?Q?h8GnhYoXsO2SnU/BJXmbJQM6jnQ9Arx7hqkJ5fWAEyN1xn+L/cI6M1iBwarn?=
 =?us-ascii?Q?oankRYmV9csofgOQvlKP08hXjZk9EarGWj+9VhOrjv1w3TT5fFSCJ9vFk12t?=
 =?us-ascii?Q?y7Hijjl+PpeJnC7yrlzzHe86dqdEj1Fw7KK8rGWY4nsMgMQxJBkAae17mM80?=
 =?us-ascii?Q?aqhzicTWtwVIGAjSercR3Jr8SWczdT183t5bi4tQahan1sLgYXrk14X+oLRa?=
 =?us-ascii?Q?qZU6L6pHJQ8DxyBt9rd7yAtoKkUDqF+ZFFE7Em8Ei9g9rbI5Gr0k1kh7q9Sf?=
 =?us-ascii?Q?Um3y1svG4wEp5ZPhDnEiOk8U3/b9O/tiWt8ScewfAnP8yNBfzgpBvprg1186?=
 =?us-ascii?Q?7fl6EB6xFTXUZ4343Uq2pFLxuIdpmxIYqYYgLLbdVWIoouhrP+Nacv/4/2sC?=
 =?us-ascii?Q?xaAQbW/VsIxbbiMTicQ9VdnKzIi27dQdyD4Vk+kOjLWtDlyBcFBibF7XU/1P?=
x-ms-exchange-antispam-messagedata-1:
 KvTj6oZH7ULOYvpRXTgT6NC+Na03E7STmvLnsy4QhuNRxP9XHb1QRLnj
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR06MB8369.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ae583e-e129-4eeb-2af2-08df3154fff3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 22:28:45.0910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /eMWbtPU1ktEeT2mCY/GgV0/D/LJ49nzzSzpJFHWae4FnTtL6JNkN5yQvkyhffxwtqERxksPv3O26Pv9gkFSSw3JBSjt7J20nVs328De3LPVXhw4gkLKdrNEr5wAHkEX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR06MB10889

Hi Sakari, =0A=
=0A=
thank you for the review! Sorry it took me a while to get through this. v2 =
follows.=0A=
=0A=
> > Tested on a Hexagon/Leica CS50 (i.MX8MP, rkisp1) running 6.16.12 with t=
he=0A=
> > equivalent of this patch applied, where it fixes configuration of the 2=
x2=0A=
> > binned 1632x1224 mode with libcamera's rkisp1 CAC algorithm enabled.=0A=
> > Compile-tested against media/next.=0A=
>=0A=
> Can you test on a newer kernel? That being said, there are unlikely to be=
=0A=
> issues without that, but it's better to be sure.=0A=
=0A=
Yes I will test this on a newer kernel as well but my hardware access is cu=
rrently =0A=
a bit limited, so it will probably take me a week or two. =0A=
=0A=
> > +     .get_selection =3D ov08d10_get_selection,=0A=
>=0A=
> It'd be nice to have the same ordering as in the driver (and also not pla=
ce=0A=
> the get_selection callback in the middle of control handling).=0A=
=0A=
Moved it out of the control handling section so it now sits with the other=
=0A=
pad op implementations. With that the struct order already matches the =0A=
order in the driver, so I have left the struct itself alone (apart from add=
ing=0A=
the get_selection entry)=0A=
=0A=
> > +     ret =3D v4l2_subdev_init_finalize(&ov08d10->sd);=0A=
>=0A=
> Can you convert this driver to fully utilise sub-device state, as you're=
=0A=
> initialising it here?=0A=
>=0A=
> There's probably not much to do, but in particular the active format shou=
ld=0A=
> be stored in sub-device state and the control handler's lock be used as t=
he=0A=
> state lock. Also storing the active mode in the context struct would be=
=0A=
> nice to avoid. These should constitute a separate patch (that also includ=
es=0A=
> init_finalize()/cleanup() calls) before this one.=0A=
=0A=
Done, but I stumbled on some things which is why this grew into a small ser=
ies. v2 is:=0A=
1. A fix for a NULL pointer dereference in ov08d10_get_hwcfg(), which logs =
=0A=
ov08d10->cur_mode->data_lanes before cur_mode is assigned in probe(). I fou=
nd this =0A=
while doing patch #3. It is tagged for stable and patch 3 does depend on it=
, but of=0A=
 course I am happy to send that seperately if you would prefer this.=0A=
2. Conversion to the subdev active state.=0A=
3. Dropping the (now-redundant) cached mode pointer and recovering the mode=
 =0A=
now from the state (like imx{214,355} do).=0A=
4. get_selection, as in v1.=0A=
=0A=
One thing about patch 2 I was unsure about and wanted to mention: it replac=
es the=0A=
 driver's get_fmt() with v4l2_subdev_get_fmt(). The old get_fmt() recompute=
d the media=0A=
 bus code from the flip controls on every call. The new version in patch 2 =
now refreshes =0A=
the stored code in set_ctrl() instead. There are other ways to deal with th=
is which I found, =0A=
for example ov02c10, where the readout window is shifted when flipping to a=
void a Bayer=0A=
 order mismatch entirely. I am not fully certain but maybe this would be an=
 option on the =0A=
ov08d10 too, although whether it would be the better option I don't know. =
=0A=
=0A=
Also I thought it'd now make sense to split patches 2 and 3 mainly so that =
the media bus=0A=
code refresh part in patch 2 can be reviewed on its own. Of course I'd also=
 be happy to =0A=
squash them if you would prefer that.=0A=
=0A=
--=0A=
Thanks again and best regards,=0A=
Max=
