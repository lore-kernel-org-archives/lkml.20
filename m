Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021101.outbound.protection.outlook.com [40.107.130.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BCF24676D;
	Sun, 20 Sep 2026 08:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789894109; cv=fail; b=iTsVbghzESv3bIBUnsXDGCKu5JdXMiHRt6ujcoZ9y7gB3JgglFJqKToRzL15rrAyHup9DQNpp/He+PSeD70aky0GWukdsct9KiDCszEzf8qNt7tslxQKcnvuDqoJdl/jD1ltIO4eF/Ug+4J1txxn/0OAbzqRkQJ6TF3SA3U16PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789894109; c=relaxed/simple;
	bh=KycW+S0je6ztNN4DIuKhDISuBjalvrhoO56pusErCj0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iHDhj9fNfl80b9CCiIz17XdNF5aH1QumMIiU28KPjtc9hf8PFdw5RMkcxu8r+pwC/eAluyJI8fT+lSlKb8jorkfCUAF0ZuPliJvUOnLHJlKueSqE6BPtp2unDKHmHWigxy9fqdbzMAFke5NMfnG7Ht1+tOIoRKByHbPGSQUxpaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it; spf=pass smtp.mailfrom=studio.unibo.it; dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b=f7X2Pgtr; arc=fail smtp.client-ip=40.107.130.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b="f7X2Pgtr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1R78s1q3F6vFjpyc2YMGo9XPW5mbAeuiSpR934SbWHuj7a9gUAI+0IEZuUK4HSbVoDkiBgkycjn4x9ZWY+d/B14/mMnCFqyD2o1TIVPcoVJm5TgUDumYG5GdNWMVPH06jcrDzwzWY60b3RihQBOapD0+g58WeVppdTSXznVp9Oy+f3L6xxkctUfy9ziarzZyefUHwtPt2h4R/9whlCmbPnznPdFTfn9bg0QbUXtrPSsNIZ9dC+nlN2b4aMAMW+4H87q5vrjVwF0zgHgfkHK4zqFLRYAMbnm+S6kmvSkOkegB4MEEqY4UEnrkPorfAxbu7HF6AWeNV9Lu4hiiYskRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy3DF58Vm2mdgoMOT66kYOhfj8/zD2R2O2PPzgK1V7g=;
 b=FjMe6cRVSNkWqkSDULT1TKJQthecMq4cBdoh4t4neh8YUFyTPb+YBnSbXf2u5sj3/VCWd2TSY+OxQQwFNer4qXzQ8mYj0ZBe2NbotHg4hs+u0O3YhzFVWKn2ONcUs/GhIsHrwOkvcDXhvXVcDMjJfGHDx+ki+FMSB/2kkyFuZi/++GXyTdrk4okwKM0zrVtq8v1TGgv9W4VQXouV9lWDSvPQEvkeJi0HcgStPltF7BsiMpk1SC14VH/7NsIQYcRGT3MoSbpcazrQlTwOQFLa1OELaN2q5HWjp4KP4tVox/7kVAsk+qUCiv3g2Qt2XvsmHL2lqPKSQpXBGWqS1v0mMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studio.unibo.it; dmarc=pass action=none
 header.from=studio.unibo.it; dkim=pass header.d=studio.unibo.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio.unibo.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy3DF58Vm2mdgoMOT66kYOhfj8/zD2R2O2PPzgK1V7g=;
 b=f7X2PgtrXKl6Tt2OL1qWPk35L17rBzyF+uPhOpxByWAaEhOHZbL4vM/6BQwsOOV28wMXQ3swKKT9h7S35eYsHemkVi1qdu9+bl5F1sZXZ7ZBW6TEXIkzNkUcK8FinByCtWcfvVl4n/86Ra7FSd/0wL5c0+VJzup4yZn9nkv0mBZa+2REnfm/AeZzC3DH1Kr9h+LhhxW3lWtZOzpFQ5+6U2WAhQQliC2dBQL5nSm5aCQvm7uKvRkJtVkzYgomAYCTFjchY1ZvhxM5FmcDYoxdeYQID7AO/NHMjF0HybM6mFbkBvw2drr1RJ/H9Loku0yN58SSjXAHkc0u0EwWUvTMpA==
Received: from DU4PR01MB12163.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:620::18) by AMBPR01MB12153.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:6ef::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 08:48:21 +0000
Received: from DU4PR01MB12163.eurprd01.prod.exchangelabs.com
 ([fe80::bffd:753f:fbcc:c402]) by
 DU4PR01MB12163.eurprd01.prod.exchangelabs.com ([fe80::bffd:753f:fbcc:c402%6])
 with mapi id 15.21.0428.015; Sun, 20 Sep 2026 08:48:20 +0000
From: =?iso-8859-1?Q?Nicol=F2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo=2E?=
 =?iso-8859-1?Q?it?= <nicolo.giuliani6@studio.unibo.it>
To: Andrew Lunn <andrew@lunn.ch>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Gregory Clement
	<gregory.clement@bootlin.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: R: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Thread-Topic: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Thread-Index: AQHdSG9FPSJli8/cuky5AOQ9f1roMbbWeggAgACufWQ=
Date: Sun, 20 Sep 2026 08:48:20 +0000
Message-ID:
 <DU4PR01MB12163AE447B65B21A7D585A0D80852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
 <6b935e31-169a-4cd1-b385-62dc659c1256@lunn.ch>
In-Reply-To: <6b935e31-169a-4cd1-b385-62dc659c1256@lunn.ch>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=studio.unibo.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU4PR01MB12163:EE_|AMBPR01MB12153:EE_
x-ms-office365-filtering-correlation-id: 2b3a6371-9988-4c86-b3e1-08df16f3ec1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|786006|23010399003|366016|1800799024|6133799003|22082099003|18002099003|38070700021|56012099006|5023799004|11063799006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 4eVt1WOHi0M3jJExvKZLvA+Em100e4aOaSjc55A6pI53txLHJeBH5GjBuxXqRRTTBna723NOADelHQcGEu8xeDkZ+ohqHNervsiigAy3V29zz5jp9k0nCPxb80oMTkqH39vyi+H9d0/EsMfjNKVngiO8uK6qe+WsnU7ME9p1z/A/OAi31LjKsn9NVv32Q/gjJHPgk4noVnVq92o1g95j4H2oDjKOuSTrmAAo5R2+Ryz2LRY8plhyFZOojpkh2ProMtywYrVedyDCNk/ulGg8/wFcBY/CrlAb/ITXIN6DWTI/HH9GQqHsOJAazMyKD8Vjm8MHgjrF+djg8Ilm/3OnAlWSOtZ5E7jPouOLYig6jQZjvy4v7YB0g9GQZoaUy4pijz4WkRQYx0iOIGSYEaPwAcEJl9xWvgctD/+G2Z9auZSv1G8EWcf3STT7pMUTpeDNlKn8XWFdypf8AEJ+SGscH0CsqPXyOahdD7Hlzk+H/uLAl5qZaHrbpB1itmDslQzD3wgYl0QmyXcv9ctzVlV5e+th4jKTbjZjG86HRqgcKnXESkrYW+phQ+dQWb3FR6JRBVySRlPv+UsiUJ13+eqHWswPdul/ZRLlKeqYClGVU2m+LNdhPmcktrY/iZvl8pJeQ3Amn7OcB9RCh10qgOFjem5PJ6jMuWwW1hte3y42WpkIKS+TVR5NSNW9KqKAr8yP2Ro2hdWRG/1Zdr1kKIG7EC4sPKT3XXoVWjS5Wr4Ichw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR01MB12163.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(786006)(23010399003)(366016)(1800799024)(6133799003)(22082099003)(18002099003)(38070700021)(56012099006)(5023799004)(11063799006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KuavYImgQnaOpypktvTvIy24BoWVYg/iN2l7o8YCzseCyHFrl57aKuRJen?=
 =?iso-8859-1?Q?AqYhPgw5LXMBSvvKRFvztFJLPQcWbyus2rkcRv33huR5Q8mEqlO8GiaItN?=
 =?iso-8859-1?Q?HB0T2uy+3uKOs9RbUY2dDmBF0HcJXnvlsEMf6u1TpxJkpjFEj4FORnVwPz?=
 =?iso-8859-1?Q?YKXNczf5wjW5JQLtvVs4zj55RzgTI0m2ajTjFg30sJXj+v+x4WMfOVHCbI?=
 =?iso-8859-1?Q?NaealeZwzqvNfy0ZNl4laZ/fljtrzRifbSIAJAKJ680cBo0Ayv4FIIbtkd?=
 =?iso-8859-1?Q?Rpw4WHv6WfV7spi4h1ROZRk2pfmFXEvgcPj+b1vZaTEUYpPWjmOIm9uZE1?=
 =?iso-8859-1?Q?bbVBQmVo5q+XP2GN7saxZg+MA9ocege0YjeG+KSJ8XuOFmpEMTTARUINXw?=
 =?iso-8859-1?Q?Mq6xt6NLTDVyGI/W4+UN3y3+YYZG/hK/19dXKVy0NUQY0NyGEmXD5abaQH?=
 =?iso-8859-1?Q?f2unLLmaPieFlLu/k1SVnqHcSERvIiQd1AN6JFyv8UROqkoaLxnJOoVOGU?=
 =?iso-8859-1?Q?tPXFSoRPgJJSZU3E2mS0aS0jKqxcSfohCIhnJviZeKynIw8s9LC+tlO84I?=
 =?iso-8859-1?Q?PqZiitgJ2Xmlu+7k/fufnbZMNlfmoZEr2e6veJ9uIrja2o7F9CEi9t4TwH?=
 =?iso-8859-1?Q?42hAZ4yvv3rt1Kn1xyQNwbSrqWsSc/ORrE2qp0jvFdhoAxYVD/ay/4xiYC?=
 =?iso-8859-1?Q?UnpaRIMQgoe+Nwgbk9eEETedpdo0hH4x+hqrHJEOOZ3qA6VS1Monj6Ir6B?=
 =?iso-8859-1?Q?Tg/3dzauS852b8v/Xzyc24SzrDx0fRu7s1ihgffSmGVo0u78vorMUsvCyO?=
 =?iso-8859-1?Q?iLthlbIk4Tdtx7ip03mvd6G8bEZszB7+w3wikLft9OwgPDFmqLAbLR+Hfd?=
 =?iso-8859-1?Q?sIFReRYkvliOUHxbIYoRVUMFfoOiRMVboKB4RZxbGVEBTqGDF6D64kOqAK?=
 =?iso-8859-1?Q?ruwxwzbPmm5g49HsQPvLrim92XK6SIsdlfloNTV6ZJDSNQGh9rcpZ2lZ/Z?=
 =?iso-8859-1?Q?311Hwv8+RyoDucM7ChZQGmRoNDx2yT3IYphiDlIxXV2Yy5XVYA6G4B5+cj?=
 =?iso-8859-1?Q?fjiAehbKOpc7ohqrLKJVGBPLFQTvXlxDD4xkyh9qitOn0Pj+Plq3SNzTTP?=
 =?iso-8859-1?Q?VdOVVjrbl6eeG4fJpNhbVvcv8vRAfMzH/QbMYRa0qTbrXgmsllWD9GRP7z?=
 =?iso-8859-1?Q?mTja4GdOHl+4a9oVPJIrb1j8iwvoTu0cldAsW9xaXGwXz5yhF32PDTFiBW?=
 =?iso-8859-1?Q?eEoI8LHxMM1IAEvZG4ubdFHuv/xuq8jbSFJkYDoU/MQt3DqLz7VnMmiZs0?=
 =?iso-8859-1?Q?iW+pW6swNjqg26hXQ1saNdgdTDBJ6cM3Opcs2oi68hnP6eZn+dy4mRr6HG?=
 =?iso-8859-1?Q?ef/OeQB5wkZaFQPjByT9xgXV1z+/WjjWOnIMkjK6Lkpj/7z5HUow6WPJqH?=
 =?iso-8859-1?Q?dvr1dke0LRj87j83skXTtwC4fDDJf9IucqbZBvN8K4XbrrseMIbO2KrBVE?=
 =?iso-8859-1?Q?1LIAjRk+exxfyAZs1wBGDz7/F6kTDUJsLr1MqcQ46uAEVyT3B25+/Ik/Cr?=
 =?iso-8859-1?Q?jEuThHuxZEODxX7vdEHUf7SMlrrJJoyWa64pGQyoNyTwJP9b1Sk0ActCi2?=
 =?iso-8859-1?Q?6FdhP374vRy8le9OFb1wOpZ/eADbjtddb9F30J0xZ+VUm8uoUEt0Gc1aie?=
 =?iso-8859-1?Q?YAaxgrvtjxO6gK9FiDyK4s94QS6nceqYdRQfdQvRXtpleYsujJBtFkDH8T?=
 =?iso-8859-1?Q?Hxe43khWfuwqizJ8T37dOqMPdBLOqexh09P+x+WgwfGyhyuyruEDvYg/CR?=
 =?iso-8859-1?Q?E6FoJnQLEoqdenqBDVNcbFwTOApDLkc=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: studio.unibo.it
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU4PR01MB12163.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3a6371-9988-4c86-b3e1-08df16f3ec1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2026 08:48:20.3311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UJokIN7qkjO3wHtwBdvSOz2Tcgc6crdwuSVuQILRKL2Cj553OzpMmnFnlc7gCnZoTzI6M1r4YImGpbEPJA6Sqbi9gfSnp3JxLRvW65xnEi3JcZgERUxUFus7Du5M8HiO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR01MB12153

Hi Andrew,

Thanks for the review.

> The reset line of the switch (CP GPIO2 pin 17) is deliberately not given
> to the mv88e6xxx driver as reset-gpios. The 88E6193X needs about two
> seconds after a reset before it can be used, much longer than the driver
> waits, so the probe would time out.
>
> The obvious question is, why is your 88E6193X special?

I don't think it is. I saw the probe time out when I started the kernel wit=
h kexec from the vendor Linux, so nothing had reset the switch before the d=
river did. When the boot loader resets the switch first, which is how the b=
oard normally boots, probing with reset-gpios works on this board (Linux 6.=
18). I have not been able to test a driver-only reset yet, because the boot=
 loader always resets the switch first, so I cannot say what made the diffe=
rence. I have not checked whether an EEPROM is attached. v2 describes reset=
-gpios and drops the comment.

> +&cp0_i2c0 {
> [...]
> +     gpio@20 {
>
> Which port?

It is the LED expander of the eight RJ45 ports (two pins per port). Nothing=
 uses it yet, so I dropped the node from v2. It can come back together with=
 the LED nodes.

> +&cp0_i2c1 {
> +     /* SFP EEPROM (0x50/0x51) */
>
> The addresses are not that simple. When a copper module is inserted,
> other addresses are used. The SFP driver assumes it has access to all
> addresses on the bus.

Thanks, I had not considered copper modules. I removed the comment; the nod=
e now only enables the I2C bus of the SFP cage.

I will send v2 as a new thread after more feedback.

Thanks,
Nicolo Giuliani

________________________________________
Da: Andrew Lunn <andrew@lunn.ch>
Inviato: domenica 20 settembre 2026 00:23
A: Nicol=F2 Giuliani - nicolo.giuliani6@studio.unibo.it
Cc: Rob Herring; Krzysztof Kozlowski; Conor Dooley; Gregory Clement; Sebast=
ian Hesselbarth; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; =
linux-arm-kernel@lists.infradead.org
Oggetto: Re: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board

> The reset line of the switch (CP GPIO2 pin 17) is deliberately not given
> to the mv88e6xxx driver as reset-gpios. The 88E6193X needs about two
> seconds after a reset before it can be used, much longer than the driver
> waits, so the probe would time out.

The obvious question is, why is your 88E6193X special?

I've seen issues when there is an EEPROM attached and it has a lot of
content to setup the switch. But that goes against using DSA, where
you want Linux to control the switch, not a fixed configuration.

> +&cp0_i2c0 {
> +     clock-frequency =3D <100000>;
> +     status =3D "okay";
> +
> +     /* Drives the port speed LEDs, which are not described yet */
> +     gpio@20 {

Which port?

> +&cp0_i2c1 {
> +     /* SFP EEPROM (0x50/0x51) */

The addresses are not that simple. When a copper module is inserted,
other addresses are used. The SFP driver assumes it has access to all
addresses on the bus.


  Andrew
