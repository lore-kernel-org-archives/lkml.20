Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020140.outbound.protection.outlook.com [52.101.84.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026632DECBA;
	Sun, 20 Sep 2026 19:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789931276; cv=fail; b=NPYV/mQbCw/BSf6l5qLA0L0f7aGJbDKZviXTybCH8TKzd9OnMFHCX0GAMXOvU5MCOoqGI4D/Cv4bb+atebvznrTh8iR0eVLRdGspmr0svsMl1y3orXyrrxXfkUCVhuInjeElMW1MTVbUXf989hm4TlxmPHGRoeZMenbHB5FqyNM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789931276; c=relaxed/simple;
	bh=JyGVsDyYuWSAKMTgyDbJ6Dz+4yL7WpqTwgSHcxPbywA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=R66JGmh05/85497r5dWtdT4gwtsEg+3NE4aMOAAGEYw5UKsI8sK4Hpr3dscyKw9xDB4FK+s23x1H89T+voH6D+77gdKVzQ+au2qDS/b6TqAMlpmE2u1IuITqLPe2nTBPIznNAgeERdmPfmyc+gSj0YEw32m3kc+ea6fVtFjuJf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it; spf=pass smtp.mailfrom=studio.unibo.it; dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b=M0B5qNaP; arc=fail smtp.client-ip=52.101.84.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=studio.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=studio.unibo.it header.i=@studio.unibo.it header.b="M0B5qNaP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuZfwC0KshWZgNuRHB8ec0Cmm8E5fpgnRsTv3lP0mkXiK8fapBxDY17oAT2B97WLJdYn/KxKmCJ+ECGmKOj1BIQCL8D0NiR6sW+n2OOyFF2iCUwj+QOoWvn9i3IMZkLvIE9Ol3C5HoJ7swk8QTSV0X8m+oroy3qNCeibdMMgQ4iBh6oqlXjgZJw1DNjg8afM48wF/2Yj8bP/8ND/J2U8skkaEWXFqbK77j0fgVmxs5DboMt7yWxsPl19eon109PUizEMACzZ1XG+tIDsIN24fdPfqkJq3Q+Mzeu0Lhja8gQIJb7Aix6RRmFnFTkdN6/BihWergAtOWWfPRJzgBUVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2pmys/vkC7E9zTegeHhdMZNiG8DvnQEwv9DkKRcGF0=;
 b=TGItW5/q1w7XC5Zeo17sDjJ7bAtFqOIPADvVOCWlTF4+9uNG2CgMK/tPbJ5ft41xKrobsdVj+zxuamDBWbo5LnDHS6iH2KAcyoEQ5X+j9bd353OoYcPHxY+5BfETsF3EHt+hJVYPkXyknUg+ndXxwcU+Htxx+a4uK3ZZAK3xSapMw0GPzV9UVI08vkJK2DSWly9hitSq5mSaztNZLRolnIbLX5sMqv/sfIdkwpgiNhk+rCgwAJp1h4aI+ZzlMegxPtEq6kBFkQ3i/mdGov876BeHZD31p58fkRNlnERkmhATo87jGx3Jz+G0yOQsGKPAd07bZGp6XzlLmGfRbH05QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=studio.unibo.it; dmarc=pass action=none
 header.from=studio.unibo.it; dkim=pass header.d=studio.unibo.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=studio.unibo.it;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2pmys/vkC7E9zTegeHhdMZNiG8DvnQEwv9DkKRcGF0=;
 b=M0B5qNaPHbzQ5vHou6BISJ0zeAxsvsrcgJVlKbXQ8ML6sjkfDwNiKbTwfpBQ7bMjNsCI/NcNY/xZDCFUIertp5tmlBKizO3goKZb5EWPuMQp30psOBiJTx+irT7XTCGiddQlrDVfjiMlaztSnzH/HruqbX5FlSzJg+T8csMQXBikSpHW9t46gfydWJ/RHw8L/OuOIa8osD+w07BH1Z/RBdTq7Dw8lUbT70FltvfsXj3kdnVUZn7fMdT37gPd0OBUNfPXkD5VWke/dobCcB35F95VBZGQ5oSP6Kt1oJ3VlSjQvYw+XJXiVaphclFYrxJlK3lnyd831Pb7i1FjlOethw==
Received: from DU4PR01MB12163.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:620::18) by PA4PR01MB7183.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:f6::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 19:07:51 +0000
Received: from DU4PR01MB12163.eurprd01.prod.exchangelabs.com
 ([fe80::bffd:753f:fbcc:c402]) by
 DU4PR01MB12163.eurprd01.prod.exchangelabs.com ([fe80::bffd:753f:fbcc:c402%6])
 with mapi id 15.21.0428.015; Sun, 20 Sep 2026 19:07:51 +0000
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
Subject: R: R: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Thread-Topic: R: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU
 board
Thread-Index: AQHdSG9FPSJli8/cuky5AOQ9f1roMbbWeggAgACufWSAAGwuAIAAQPf8
Date: Sun, 20 Sep 2026 19:07:51 +0000
Message-ID:
 <DU4PR01MB12163D969969533F125288B3880852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
 <6b935e31-169a-4cd1-b385-62dc659c1256@lunn.ch>
 <DU4PR01MB12163AE447B65B21A7D585A0D80852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>
 <feea5596-f4ef-42af-b9f7-6bf170620532@lunn.ch>
In-Reply-To: <feea5596-f4ef-42af-b9f7-6bf170620532@lunn.ch>
Accept-Language: it-IT, en-US
Content-Language: it-IT
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=studio.unibo.it;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU4PR01MB12163:EE_|PA4PR01MB7183:EE_
x-ms-office365-filtering-correlation-id: 8bce61c2-83bc-4903-cadd-08df174a77ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|786006|376014|23010399003|10067099003|5023799004|11063799006|22082099003|18002099003|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 Xtt2TZwQ3HurI3JNJPYi6gVQE2UCBHXXEURBKMBsB9m0HqO46FdnsFS0irG80+RH9QMSxI8U/2mszSM8ixppFYT6gn2efWJulY6lnhD9u3SV+FlQuQtPXvk0TU+emTj5jyxxscv4JomHvnz2bBcWJD82ojCaf+gl7MZJoM9zDAy/AmYTL55Jov9zJvpgZB5mE5VuSAhJls7yMfOzCBzn/Exrxk9RQSy8nRdj297/+apA5O3c2cDoDCI9emAFjDvUaLjLryeQLgGHc1CzdqVT5eYYExwqPdMjlQ7yFIkvAlVRFBjRCdWpGaWh44c/14twcH0Kv2Jfy0A2N3Eh8+NDWbvZm4eW7EAZpCthC6+95FQzaS23VvAjzgt/NGD5IPa5iYcLpGSjQj95lheqxr+oPPwj3mOHbapO3hQp7SsSTo5behLnxcpAxtEO3roJwQxDwhhOZh89VjGIyJmw4suXgZlVngonpmNzcN4o6LmNLEkgCVxed5BTjXS584FmqWsxQ8edeZBY4gmxYJcbWsC+DGABstyrtSBhg1oOgQnOz1cVJUj1hULjhhBs8puUO1VqpfpFT5DI5jkbYbw/pXJIAhsJ1j70Rt7N1+APFe0bPihXFA8FP0mnIusi2it9AXVF6rG/PGWiOPFnntqyRwhxHtN5SNHOA8Higg4Zisk3MYbE3hOBiFrx9txIXMK1bvb2/whc1zvT6KZAZE6qMXuMv6IX1seGMUZfbDJ8LUV+aWo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR01MB12163.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(786006)(376014)(23010399003)(10067099003)(5023799004)(11063799006)(22082099003)(18002099003)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?F1n1f3zFCl0Or+Y6oz2o077fPq0lsbzEJVY/J2xlMjEHjsE6qktp1PO5wp?=
 =?iso-8859-1?Q?8jvHeBoHFE/lgpRw+GcYycQ4t2gKimTWLGAAds1NzcviM/4hVHuZRhMKIb?=
 =?iso-8859-1?Q?2MGNsSSPUqemV29OvHeeZUce+LhMYlemF3aHtggFtTRMhWNw9Y/0YesJin?=
 =?iso-8859-1?Q?S3EbdqYsmn8RrhIr1Lwe6lSBL1qKHVMZQQN/RWNEUkkQ108NK+ymVLUCQG?=
 =?iso-8859-1?Q?ZDnL6XR94YtABzH/cdRliWm6HusBVI6QhE4zt2oBrrJwXy17Ux70ohweXC?=
 =?iso-8859-1?Q?8J2QgFWnjqhNozolxU5+fUXjIMKfsUUvrYfPniKmj6X4ObgcdrMS1OaKPw?=
 =?iso-8859-1?Q?b0V2bwXiIaK8ejS0nXOO2aYLQMiDarM6KW+wcvBus+DbfwacHHi+3ZJavp?=
 =?iso-8859-1?Q?sZM/MJgGRSD+02ZGM1d5o0L978iB7DkiyJLbI7RCdGOs8AAX7lx2qcADmI?=
 =?iso-8859-1?Q?s+T4mpGbKS96o3PUvTPzW75pUU3j29aUxugG95/eZgA6Q0lZ+N8363mhB/?=
 =?iso-8859-1?Q?IU1lDDLsyQ1G0OeXUglARa2smC993H0/aWQeJlz/MkFkldcMGZIHUxnOwU?=
 =?iso-8859-1?Q?QpT3JhBDlGUSfBUbZcOiqOAO2RxAFVqtx1Dm4NL2+bW42z7xFiyASgQWWY?=
 =?iso-8859-1?Q?cgLeFgjW1HmNsczZSPCB9x1y1h1JxuZAF/Br2inPnELcsDjcEaZN7QmEEY?=
 =?iso-8859-1?Q?pEdbr96g8Zod44LZmr6CmhbOpPm7/EzKqxpEYog7Ym3BJ8bN74+4rQFn6n?=
 =?iso-8859-1?Q?zCyrFSwv6Yk7y+baw/7Mm49TLCEjjA3Jh0fzAPbn7pZOxDgol5PNSM/kOP?=
 =?iso-8859-1?Q?OfQc/de6E62eafMPbKIm30NFFFugGabBJvRHTAoB2eMMHcQJZpaCGGM2bb?=
 =?iso-8859-1?Q?ASqEg+6ugV5XxTiifZZmdPMmc0p3QZi+7NfPbZOzIAkAim2jAzWrV2DHFi?=
 =?iso-8859-1?Q?rRrSnjVuRn17r0yIWNscYyPtLnXPVFb9QJrBsuoA3XP39r5WmX2jWsh7cB?=
 =?iso-8859-1?Q?p0c61orKLbv/VDFMtG9mx/kK9EGm1zqq43j9FyeOjEa82cv6BzbcjcaJBj?=
 =?iso-8859-1?Q?L3Q9YiuSFypCz7XzwumS8jP42g3hwUjOwznosVVM3mAmTntvpwpn5J67kk?=
 =?iso-8859-1?Q?QOhlybyr7a3cRrDG5NHwQeUEB4MZHpnlm8XPzRDwE9fi8IRi25DClXgAxE?=
 =?iso-8859-1?Q?y5hrr5usc4eocu9FwFJJRuPId0sosLFjHNsmD2EnPU2exfZ5CNMEzyjd9e?=
 =?iso-8859-1?Q?pZ4YRoiRWORBcihRD9kYiVIAe3EIN7iGgkatntWWiQEgxW/8Rwkk77Tf70?=
 =?iso-8859-1?Q?k2IR4+Rv/LM3OzfYl4CfZfS9P/9Lcv+AhoXrFTQMAxWz4kAUMSzgtBUanQ?=
 =?iso-8859-1?Q?t8c4PQdIz67o8v/PfGz1+kCVfDRXi2suF7+EYNysVaPKlw0c/vtUfslDMs?=
 =?iso-8859-1?Q?66p3isVxGAQkqsByyUKvypYIu8WfR0kjBoCyxG9LLHwPCEPM5WWul4xaGS?=
 =?iso-8859-1?Q?4PddGbFPlL0ksLNbO1ByDiWhLaAQ4HNZto74LVIIv/JDGDRIMoATOu07C8?=
 =?iso-8859-1?Q?OEMZs3VjBD70BDmxSgeHUA9yegtUgu3CdZHjwORJYJHDhwJWLGNoZRw8Zp?=
 =?iso-8859-1?Q?F3h2s28nuLmx/bpCxcLxrjXv2SGroJKSFnklCc4dqCxQAxPE/YNqNK6qyB?=
 =?iso-8859-1?Q?lyQhFm+S+ph6IpwK5gnGEXfsrj+kMHZLTjgg0R3ll/keVMrjaZ0YUCIZJc?=
 =?iso-8859-1?Q?WNkA8xSwHZ1b8wQuxFurmOUzzPsWKeDlgFAOA8bUClgXSzkUjq6dvyGp4k?=
 =?iso-8859-1?Q?AzZHbo62Nw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bce61c2-83bc-4903-cadd-08df174a77ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2026 19:07:51.2524
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e99647dc-1b08-454a-bf8c-699181b389ab
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ku40VaYmfX+NxnV8Uzih3c4fstXr0PTdVLCEq2K8OmwkRlNH/DlWeyj08sHS0ah/ehSutYWp+sDGH4Hw1T3o7cBIl1rur+Djs41Av0TqjJ/u96wKT+G+FCgCszG2o16U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR01MB7183


Hi Andrew,

As promised, the measurement of a driver-only reset.

On a running board (Linux 6.18) I unbound and re-bound the mv88e6xxx driver=
 with reset-gpios (CP GPIO2 pin 17) in the device tree, so the only reset b=
efore the probe was the one done by the driver, with no boot loader reset i=
n front of it. The switch was detected again and probed with all its ports =
in about one second, well within what the driver waits. So the 88E6193X is =
not slower than the other devices, and I will not send a driver patch. What=
 I wrote in v1 (two seconds) was wrong.

I still do not know why the probe timed out when I booted through kexec fro=
m the vendor Linux, where nothing had reset the switch before the driver. I=
 could not reproduce that failure with a reset done by the driver. v2 has r=
eset-gpios and no comment about a boot loader reset.

The other points of your review are addressed in v2: no LED expander node, =
no comment about the SFP EEPROM addresses. I will send v2 as a new thread a=
fter the 24 hours have passed.

Thanks,
Nicolo Giuliani

________________________________________
Da: Andrew Lunn <andrew@lunn.ch>
Inviato: domenica 20 settembre 2026 17:14
A: Nicol=F2 Giuliani - nicolo.giuliani6@studio.unibo.it
Cc: Rob Herring; Krzysztof Kozlowski; Conor Dooley; Gregory Clement; Sebast=
ian Hesselbarth; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; =
linux-arm-kernel@lists.infradead.org
Oggetto: Re: R: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU bo=
ard

On Sun, Sep 20, 2026 at 08:48:20AM +0000, Nicol=F2 Giuliani - nicolo.giulia=
ni6@studio.unibo.it wrote:
> Hi Andrew,
>
> Thanks for the review.
>
> > The reset line of the switch (CP GPIO2 pin 17) is deliberately not give=
n
> > to the mv88e6xxx driver as reset-gpios. The 88E6193X needs about two
> > seconds after a reset before it can be used, much longer than the drive=
r
> > waits, so the probe would time out.
> >
> > The obvious question is, why is your 88E6193X special?
>
> I don't think it is.

So please fix the driver to accept that the 88E6193X is much slower
than any other Marvell device.


I saw the probe time out when I started the kernel with kexec from the vend=
or Linux, so nothing had reset the switch before the driver did. When the b=
oot loader resets the switch first, which is how the board normally boots, =
probing with reset-gpios works on this board (Linux 6.18). I have not been =
able to test a driver-only reset yet, because the boot loader always resets=
 the switch first, so I cannot say what made the difference. I have not che=
cked whether an EEPROM is attached. v2 describes reset-gpios and drops the =
comment.
>
> > +&cp0_i2c0 {
> > [...]
> > +     gpio@20 {
> >
> > Which port?
>
> It is the LED expander of the eight RJ45 ports (two pins per port). Nothi=
ng uses it yet, so I dropped the node from v2. It can come back together wi=
th the LED nodes.

Doesn't the 88E6193X have LED controllers of its own? Why do you need
additional LEDs?

        Andrew
