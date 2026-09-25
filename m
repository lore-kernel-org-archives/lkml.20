Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0E21E3DDE;
	Fri, 25 Sep 2026 02:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790304914; cv=fail; b=bcArgqFRQJyjytPvIhX4r4BdlQ+TUQf7Ro0qrwxyUsLIUExnidI0yHB+9/VQGyEQZAZC0oVbiHY7E8qPQIlcjJfdyGuGXr9p1r99N6LQng3J5/Muq1zpUxkWrIuJbYHEtqwvvF7XhcCv1bkqjt481iBMQNorKOOEwZG0g3p7DTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790304914; c=relaxed/simple;
	bh=Lvc4nLZJom4ISCtdmFhZ8MiNxwvUScwCESdp+kedAr8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dsHGiUIlUWfjjUi5UQKFKoVTWUA0+kUwyxKAyPK/zWz62u5bmjQ3EUOPJ/zw1Ioq+bM6rMJk2yt8mdKVwISzQdE8VzFdwtaPJTH4fCgl0q8Rmxu+YDjZpBFU7QStxM1QuhGgCfv08meiFFYlUzfwMZeQSklmY5g3wYYK6g0tHkg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhIaHHzvvA3XHsZAZkqdRvXBD72XHIebEV5MXJkIx/gugZWqeYQDJbKEjna069vxxVdMQFWscpNUXWcDBpzMi6z+g5YrVy4HXgdppBh1hg1FcKGimByqaNp7PPfCqCx8MjD61YhPw9Zk50EEviw109ihj0ZKmm37usi3pkBVo3HQ4s0zJC5Npp1jZJSyLXnPla93lRQtBWoA11zbBp1ULcYV1sSKkdmLH0AU/5MjyeX4lwDTnL9u5ieA5XfyZAZZgWC8lJEIfAysjHohmsCWM7Tt4oBqmZZBe3WEvm4iuTBdDnHEtVRQjGG3UptxL+HRoT+hksG6DvR3sdvuBFXaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uiximgws1gLOxeiaGn1oDaNHBOBDVaRoRUb6V6Ve3g=;
 b=cpFTEdhScyXSe9HVawDIWClEl6i2Bg7E5oXV8XGEU5mnR34V9HMEdGgjfapRB6F8A3bnou3RRSIdL5FAkhLXMucveKKpbHuIa0mHtm7OFKICKo6/W1lZtH8CKy6ak6tUEz+e7uEsA+yS1tVYPkNuoR1eJLSU1ojg1zpeiSQ0hpB0NQczK0eOjFqbNzV5EUbLl0xDV99z94nNlT9iDUVs6rEh6V7c+CJ8mCaikIOd0/uIWCwQWMt07DIyLzg8jLFwxkS0vGkFhRqKogMi2lNWEtVTAMMmMfa79jouPyy7tHyvMk3fMAiEzVi/j/b2wP7IEKDO+bbQzJqFJeDtovERoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0666.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:22::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 02:21:51 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::435e:52b5:c524:459c]) by
 SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn ([fe80::435e:52b5:c524:459c%3])
 with mapi id 15.21.0451.014; Fri, 25 Sep 2026 02:21:51 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "rahul@summations.net"
	<rahul@summations.net>, "anup@brainfault.org" <anup@brainfault.org>,
	"lftan.linux@gmail.com" <lftan.linux@gmail.com>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "pjw@kernel.org"
	<pjw@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "alex@ghiti.fr"
	<alex@ghiti.fr>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Thread-Topic: [PATCH v2 1/3] dt-bindings: regulator: Add RPMI voltage service
 bindings
Thread-Index: AQHdSylV/+AHvSJ/TkisWFCqzwhgHrbcn7gAgAGZTwCAAFYf0A==
Date: Fri, 25 Sep 2026 02:21:51 +0000
Message-ID:
 <SH0PR01MB08411AA7F403A71D2D7470A6F9802@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20260923070014.1340761-1-joshua.yeong@starfivetech.com>
 <20260923070014.1340761-2-joshua.yeong@starfivetech.com>
 <9c0ae39b-d214-40f5-b010-cdea14ccc774@kernel.org>
 <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
In-Reply-To: <c2c57bf0-e610-4353-93a4-84edfd08e767@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0666:EE_
x-ms-office365-filtering-correlation-id: 769d094f-1499-4ec5-480a-08df1aabc27c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|38070700021|10067099003|4143699003|56012099006|22082099003|18002099003;
x-microsoft-antispam-message-info:
 tQJHYnjxFi2gxlOK4WSYcHT9uZA7Qek9wrEZWJ1g0cZ9GQs34SQAUDR9PCGS/HmY79sGmiGHgxpxVZEcFEOUZ7Fk9aN7l6bxXDWINevUQ2C+tvXOActGQ2yNW2qnwSuq3YRQBcsYSRziOd/PAYzY9eKGCG9t+zpgMoNOXpvjkd8PPAEVwFP6O+9Nf4JFgmWcVM/Bw6a7NJ2u+Hv/agTD35hni+dOFuHwjrt5mY0tR0uV8mEaRGYp7sJPfp618ku6/Bo91kMjGyIDQCi+vgJT4BJdRx7pCp8u3x46EKFcKogDkeOcTLDHc7LyZCgalTY34bsWSe2xHz9h/g0X2kkvd7oZy5yBTBxiPFEsaHYczcQf4cPScn4PfkamiBcXOUogvOymIZIpLOtQT/nnztjxwNiMzoCnG6tbCocQKPE9L74Xrto1Sf/3C54gQuY+JUl1L3dnwmrcEjFZ+QWqtH9CwgQ0VQEIxkcfYMVsS2JSfBdXmEvGhp+x9FGl202tUsUMvqD4/kjEQRRSQVdXAl1IgJmujyJFQt8erL41bqOIACgNyOVka6zWkRWefx33Cdnc
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(38070700021)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ebKSccny6PdqCgJGObgtxavUfnx4if/lwqr2MK/JEw3tfwurpOEf7a7dgNHW?=
 =?us-ascii?Q?/ixEta+Xk9Yb5wPsj/o+ioqxjmS0kx/A7drlkCFgwU8OWhYMCqPh+jxA2Jj9?=
 =?us-ascii?Q?KlVKqYLqYVxbzfTSxwH7rvGevpPu3bKxC722sXGyywzYaq/zSUZ8qT4I/Wfm?=
 =?us-ascii?Q?jdnMEvlG915OAXe2tSxN8Pn0gyTymWecKs3VKMf6kuj86JvlM+WMQHD25Jrw?=
 =?us-ascii?Q?+FdLNFZXnSc5R4I9YsZEVKRUrAOAtrtleP7j9SKASsbE6hsnWMn7mR/YxBaU?=
 =?us-ascii?Q?dJBAkl6/ocUaqaPBiGCwlDz8lYdThqliOvSq1dmpHHGNMjlPkxaDmAr2Xb3N?=
 =?us-ascii?Q?Smn/d+1/VXIciaG9doQMEWyOPjVXa+eoPamIfoQ04B9DFcLZVZEalcO3tIge?=
 =?us-ascii?Q?sPsh4E0XTqUGrr92E/BPxvHt6atoB0QnNHp0dxEgSUYXP0CLvWJe/bkpPM9o?=
 =?us-ascii?Q?m1wfQ4LMPw3e9IneeVyRsflzOozsWxwiDJPhzLzbE9APz+6YB8DTN7QarM0I?=
 =?us-ascii?Q?ugcC0WAUDZOhSeAg5xPuPKtcOK17bKPfXspLNhMJ7RE+so/hv727cVJ0pFDQ?=
 =?us-ascii?Q?FeO59Sp1hgirrGcZS0fd1GWKeEaBhfIai45eEjicnicR//zSVS4O2U2o05xB?=
 =?us-ascii?Q?3e/bvHN1TQyyH6qeyDCB9qJEnLIiuv8fEK3RjaNF2GET2pNdd3GrLtlp0Vnl?=
 =?us-ascii?Q?O13srul6ysWK8iIq43hjOACN8MQbqnf1LqwgiSz/Ua5Jcp4lAsxkilfZLvd4?=
 =?us-ascii?Q?MHmmaSkVua2fs3m1FLX05xaFbZPUlyVEk43GYdSKsNzthPLP8dVjDMV5hJdQ?=
 =?us-ascii?Q?t5amLHHZVag4gY1eu2RxftFw17UtB+UFs4qMeSJNwug7NGO4dMvri0c6CLB9?=
 =?us-ascii?Q?DLCRYzKw0QmIeNMdSd8XNiYPmLDX01old6n2Q7GZgxOlk/KQjY/2XTF/xb0w?=
 =?us-ascii?Q?UIGkhCZL8MD/hCLkxqOyxFBJ0XmALn/CNNGqNY6pdDVtKaSyEvLBFuYaUDC8?=
 =?us-ascii?Q?UuFhmC8u6DnKA217g5CLQXqIEuvyuipayrOw4+dOUSlaElTcN2/cSPEql9gE?=
 =?us-ascii?Q?4109ZJs20Cs+qrV7I5nu+K7A8Ts8klLFP++k0Q/Uu7ZYbQtW0P8Hq5e0RKgi?=
 =?us-ascii?Q?3xZiaJQTfN44nwTRKdHQD8Oey4fGGlvABut8YQH66bRQ/a5+gZ5gdo8uYpZJ?=
 =?us-ascii?Q?Pn7Uyb7k3299T68WXL2xei+TazPZQ3wp/Yfvk9tm8AVFVsYKzokfjZn1P4pE?=
 =?us-ascii?Q?rzvFZZaHl14yVTfz0HfELXcMJ5yaX7zrs5UPZPUCkLW32h3M2NNKME12NM7J?=
 =?us-ascii?Q?rnszQ2Qa9pUNPi1icMWdgh55d+mk76eD5sZjPiC1QSTk0S+G+VWJVH5dZH3z?=
 =?us-ascii?Q?0qE5V/Esnn6avIyKES7vGRZmzB/yjaX27jBgyWty1DjIl4ukGzQZ09BKJXI1?=
 =?us-ascii?Q?Lv2zu1Sr17TIRPSVErIe/Kgngg2PM5QLT352SgeiYUr9WK23gPVUfrz+XIKU?=
 =?us-ascii?Q?V+PmZY/NlWuhfQGY9frIorTN4b3BUaUlpfnmQJlP2UG81HDLa3/ndlW1syOK?=
 =?us-ascii?Q?MNSqtmjNh7BrMXEISNUrmiCSARVpQt0plv8mHHKhWHR7DXQJI3W3t5ItwIFF?=
 =?us-ascii?Q?W1nF8NSPCaQ3Q0+JE11fvll0cX55gLl+TF01ZbLfSH+b2cccYiRxOEF2SuLY?=
 =?us-ascii?Q?alapdYq3kQ22p6tM2aj9UNA+z1EusJFk3EBOzwC9zh69UyAZlgQ/FDNIzJ5Q?=
 =?us-ascii?Q?UZ8GEMd247Kx9aSsWXwZ4ZxwQdXorb4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 769d094f-1499-4ec5-480a-08df1aabc27c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2026 02:21:51.4016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rI11qP/eziGvhyyyv9MGTh8bMIg1/vR1LDlL8hlUJ8SB7Hqi6K6MF5MHTxYgNsWnLMKiB3OznI/gSskLKd4uvPO39Q50uCZKsoBXubtp4Q4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0666

On Thu, Sep 24, 2026 at 10:00:06PM +0100, Mark Brown <broonie@kernel.org> w=
rote:
> On Wed, Sep 23, 2026 at 10:35:08PM +0200, Krzysztof Kozlowski wrote:
> > On 23/09/2026 09:00, Joshua Yeong wrote:
>
> > > +    voltage-service {
>
> > There is no such service. Don't invent names. See DT spec.
>
> Looks like it comes from the RPMI spec:
>
>   =20
> https://github.com/riscv-non-isa/riscv-rpmi/blob/main/src/srvgrp-volta
> ge.adoc
>
> > > +  "#voltage-domain-cells" on the provider, a consumer lists =20
> > > + "voltage-domains =3D <&provider DOMAIN_ID>" and names each entry=20
> > > + in  "voltage-domain-names", the way it names a voltage power=20
> > > + domain. Both  properties belong to the consumer, so a consumer=20
> > > + binding describes them
> > > +  itself:
>
> > And where do you explain what is that "voltage domain" and why it is=20
> > completely different than everything else we have?
>
> > No, don't come up with your own naming for standard things.
>
> That also looks like what the spec says (some of the description is=20
> copied pretty closely from the spec).

The RPMI specification uses the word voltage instead of 'regulator' in the=
=20
kernel here. We need something like power-domain-cells,
performance-domain-cells or clock-cells that isn't supported by regulator=20
framework. While I have no prior history on the regulator framework but=20
the RPMI voltage service drivers trying to upstream here need some=20
mechanism to map just the domain id to the RPMI services.

The driver would still work with the existing voltage device tree structure=
.
I understand other drivers may not use voltage-domain like RPMI
voltage service, so I only add the support for this on the RPMI
voltage driver and not on the framework side.
