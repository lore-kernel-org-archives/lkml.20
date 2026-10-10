Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023112.outbound.protection.outlook.com [52.101.127.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227E33F5A7;
	Sat, 10 Oct 2026 23:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791674926; cv=fail; b=Frhe24+gyR3msLfEWAgMpkf5FchYTYVMqFtd7bxvVcAPLNLjfw5666MLSAjWLGYzUDZ/8l2+K1hc56q9YBk9rXRNX9HS3XMso8BxyiPabgtwZ6FeotEp2fw4Mr9FLEHmQNcmFhfTqk62MycukRIV0ccQxivSXcSD/uQP2o6vvGU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791674926; c=relaxed/simple;
	bh=XaG6Jf1eUvEPUjWWzaShCJlNnrSw81lcbiyUztw5Xuo=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=oKAeQue+vQPVRfklI+YErrgW++wAhr9B+kFihQBmfuyB2/FJkueQUSR66vIMNP+qiHDO6qfr0Pfgdo7KAozk6OWzpm1lwsIkAdQiWSVzI/291l8sDKzZ1mubIhML+NhpqDBcvLbjhVGf6fkCcGtUFXS4Bwn4Qs9/vt3KNz05d+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=Fo1zKFtm; arc=fail smtp.client-ip=52.101.127.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="Fo1zKFtm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHIl4P11GEA56yAxL5cvMLhW62nmTlflTDNceRYftPSnPas/2+Cna1hyMelrOTAUsxKjGxIqh4pFcJ4l7rNblc0NHf2s1GUX0oVwkPmliIspnsZKA5bf8A1IAiYIoNxo6kQns0i4BASXNPBhgFqtdnn5EDeTrMVTzyvEf66vahh1zckAnSJ3u05c2vSTPAOL0VRhegQ+GsP1F47ofJfvhIRF5H8FCo8s+PCYoG2n8FivtT7HW6LEqAyKVyT51fWI+3N5xcuCE8lmRxdUlOETCP3cws6ljqEc3LtHozbt/R7vXqYxshxgcX6H30IIJ/sfiA/2mdUmrI+bY/KpH7S3bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5w2+3E0LWKhkHtBOpTmp09HwNU2ruLty6O+9U+KOg48=;
 b=Riv0J+b/LPyDT2wXIU+MnUEz3eBfsU/qAR8qY8kO/4YBNPjhhP8PjmpmyzAxiFVw8NERZBM8HMMz5V4GlaCv9G5eqfekmLt+br0A28Xmv5+vDLJRHXN7DpoRTzLW4eOpAlysW0IKEY6uBsozIyzdN/bMpYxc7svKuKjCmoIwnzRXtrYqbnTH8bVQl9aIC29sRUTf1Acm4Shd/lZT2ARW4SUn5NjZ9ce9FAx3v5nrTD8+2dEgke329TsedcGZHIGsdtPDXtWulXZv0ESWkHYZvyJ3HZGu8OaEZD84auxpZi45Gt80ws9Af8AX1+WpX/Vi1lBrrdzJcsXs6MWa673J5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5w2+3E0LWKhkHtBOpTmp09HwNU2ruLty6O+9U+KOg48=;
 b=Fo1zKFtm4WI8kHBCJt/HZkqcC01AO8UMw9zTvRuCJ0vHKY0oet4vb5z0chkfXKcy+U8o79jhb8rhWBY+exYot76MPFwYdjucFRdNjVtQ0rJNco2Du0QAD31i2O3XZ0bujYOyzuaPvXesLz0XR0u5lxPgrvoye1GWIzPxBzegn3Frl8RfLnV+FQfyt4xff0kgMlHwjrMo+sIrLP5WUZ4t5WitXQSx2c5Vcdm2cFjLIYhVOrgMagXBdyOE/44UjoqEoBhzw+UyjS5BP/GhAeUFIHXLLyjs4+mi8IpQT7L9KV4VfHPaV6K0eKZOZcSCEO2AQ9y/z2kgWLXY6j0w75+DtA==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by TYZPR01MB4380.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1d0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 23:28:38 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0496.018; Sat, 10 Oct 2026
 23:28:36 +0000
From: Miotsuki Mizuno <founder@crepuse.com>
To: "heiko@sntech.de" <heiko@sntech.de>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>
Subject: [PATCH] arm64: dts: rockchip: Enable I2C2 on UNIHIKER M10 V1.2
Thread-Topic: [PATCH] arm64: dts: rockchip: Enable I2C2 on UNIHIKER M10 V1.2
Thread-Index: AQHdWQ8S6NFvl3NnmEOFOP1prRtbVw==
Date: Sat, 10 Oct 2026 23:28:35 +0000
Message-ID: <20261010232831.26908-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|TYZPR01MB4380:EE_
x-ms-office365-filtering-correlation-id: cdb96898-2b7d-40a2-6a86-08df272634e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|261009223027099003|38070700021|6133799003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 Dvu6yhKq7ALTExyN/hXbG2Bs+TgnNFl2KtzSgyZJnNRcypq/FNkkbWbWzEknkcTRCESRLvGJdbexjnmJWAk7s77QkNWT9KXkE2t1qEH4DOM8D311LPESEq5+uNNAauRd6wn/SgnOrGcyPag2NAG7hy5nidNzSySTmgH5m+yTRbO1rEJ+aXB0Rl9Ehqh8lrjxy46+1A9IPqb6bnKzxwlHeB05LWXI8J65B/FFyBYptCJGp2aNVf29OLBOSi2RccjFGMNr5NvC3vFmaCNMQqemgmZgNJMchUPm6Kxhr8AXznJFuAlpCV3kDJy7jkvaOOejc2aL+5Nq5a4VI5vLkvAgCU75ZLqe3EUlHo6T007a9uQLnZqlnBGJm3WKHNLpRObgxa0An6D8zmii3c/aZDkgdYF0qOLtVPKNkgLbcoWGDat48f0w49d2M0YWusX8I5CV5NH+TaVu1va5jhnMrujrq2MToxWc7lGO+ui7LCDBe/O5XmPJB6gjwu+P4/r2vwluyEDyb79ywd1Ww4FM4e9zD0vz6A1pzzAnBqoXWE/OKs8vcgI/UcCWviIXQuuJEEtXHbo38U3u6V9lg5Sr3fI+hTjw+c4csYq0cZ7thjdmKR0moP1NdI1KPIDfAQ9bdYcCsD390rVRyF8KK7aKqStOyTvshAoHytrE2nXd1FT3IXlrRHqVMVwZzHNTTII9zkjMhfy9foqoy9yH2TOE/BbVcg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(261009223027099003)(38070700021)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?3xCTyZ0mTJ4j46Aar6lQbpuapu1dm03C+9HbV16Y1Ml+4s7yscR0Eideid?=
 =?iso-8859-1?Q?S4FQgsGEsgmNk/AG8VRCw16xI/eOyIMWVk8yk0Cx7WjgeEkyACRYUreops?=
 =?iso-8859-1?Q?0zf/pIVIRka+zUXqOLqEVb7Ee2Bd3/jGi1phtNdQE6DK+anTYSOMq6ld1F?=
 =?iso-8859-1?Q?ZZuRojeZ3sq7xgzltKU9oDL52uMudsXPjihzdroT0T4zIYRuMQjOHDaeVM?=
 =?iso-8859-1?Q?C4zAsB6Zi/5hFl9uaZTOOiyEtyrCao7rCBML3sFD8Q0u2J1rmLoD5AR54e?=
 =?iso-8859-1?Q?cun8tU4Vzwu6/SQ8GyW/H8MuwrwoeQ9mipxDRFeBqwvUXAKozTXDdhe7J2?=
 =?iso-8859-1?Q?7GeJ+Da8krf8h13F/RMs0YMpRmVbBeOKzt9KapLolFU53YgxS3Ta53Vhhz?=
 =?iso-8859-1?Q?bOIhUpXBoeBPwUg9kn5CvvangnEBfw7HS+a1tC5R1s3PISL3MvmtVJjxaR?=
 =?iso-8859-1?Q?UiWKtNuafXRiDv2mKrQD75swVYKRMGRdAUS9tZsrYAWKPnj4Gw5S2qvbA/?=
 =?iso-8859-1?Q?QeNxTfjTcUlpgmovpdUxwmgka+56KmEV6+11xOftxpsdCFD6Kfh6x4AQd1?=
 =?iso-8859-1?Q?DmeNrpkZa3busaHm9R4ngOLeyZGHPay6PiszhBeIDSyp7vjQmscyPFiAMX?=
 =?iso-8859-1?Q?6bBHZJCmFty3XvvTw3MipPL3N3xSEGLquA9SaBIiC1OXAjd1Vnb+np88tr?=
 =?iso-8859-1?Q?ETmf1OtjI+76s91rySZtKkz7UVSjiZH767KaJtlzBd9G59Etnujx2AZPVZ?=
 =?iso-8859-1?Q?XbPpHgtgpBDhFgAndmh+r75FYAhynbp4W2RZY5NY+MnOqi3mrKvdQFxT7l?=
 =?iso-8859-1?Q?lK2cNvMDqxizS4x3DIwnPE4sm4XYtbqQ5rf9VayokHOgoTNORwTbzftKmC?=
 =?iso-8859-1?Q?SZSOQobCpwCMt5aQnha8CXNPuqYycE6JFq5sNGDA0T1fTFwMY1XtSZ3Cy3?=
 =?iso-8859-1?Q?oeuUcf/uyP/K1eP/2/tqmA6VcZIDPInrgvFevhJbCtgOMoJhwD0LT/Q6xb?=
 =?iso-8859-1?Q?kouyrNANeqib1RMVvoyHpm3LmqfomM90YXlJP490N0RMfihFLfqSSFIPfm?=
 =?iso-8859-1?Q?/wxuUYI1h9xCLGi+HXiksyJtUVgnpF+BROkSbSUlJov3qukc2IIzri69Pr?=
 =?iso-8859-1?Q?ijy4210iqtEcyYSMI4KRvQmyGStn0wa8i7de6hf2eYxtzeo1ytPUPfW9GU?=
 =?iso-8859-1?Q?Qci3MtMtaFtS8Zp/o1MRC0WR5Vw7QUUT/fEXCVDOEZxcJa1ciCrwWKgr3k?=
 =?iso-8859-1?Q?1DkOyQ7KinXo3/W+wljhsH1n0Tx2o6Gu1FOR6uFX4GyK9Om5onpootqe29?=
 =?iso-8859-1?Q?2HU+7cHyJwbxhnQbcm+UW+9MV8LppQA1PMq0TkBSnB9/cTJ3K2SwMYu7q3?=
 =?iso-8859-1?Q?M+QIOrN8m8/YvvyyRPh8t73mmAdVojneDso5bc1P00Vz6mlXhD1GRaAHvq?=
 =?iso-8859-1?Q?Wtt9lheLbCRqRBnCSMmckOr6eAbggNXxi9PqquJzZhkU1xK0ji+EXj3wmR?=
 =?iso-8859-1?Q?0aFbl1WRKsdXoalqRgHp4QBGTz9c7pSRsKvM0l6V1JA4I3aNPthZqm8F61?=
 =?iso-8859-1?Q?M6AJQIxs2DTbA7uitVVacAO+BGFCrjzHv80J/4aRpRfmsvhONOHHe49tmU?=
 =?iso-8859-1?Q?1NavT9nxiJTUi1y2NxfYSfUgDBKfVwMJf1+RhStsTJUg14AN3UsmKNYHnM?=
 =?iso-8859-1?Q?55KNygHdDGNA/IAz7nbcJtY0o15dBCh/HbPYKVJp9eBY7Flp8esHGt4G5P?=
 =?iso-8859-1?Q?4iWeOOLGJBK7a++FNcQ5TzLSsVVbRvMOL8fQt3sgOugb2l?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb96898-2b7d-40a2-6a86-08df272634e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 23:28:35.9009
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uuOTeHFVUgqm2x1Mq4mVcjOicLUi+9jBegPIJhFE+HNOvmi2QD62L2nT9o/06yEXiRKUM+ffAH+OFICI2RpQug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4380

The onboard resistive touchscreen controller is connected to I2C2.=0A=
Enable the controller at the tested 400 kHz bus frequency. Its GPIO2_A2=0A=
and GPIO2_A3 pinmux is provided by rk3308.dtsi.=0A=
=0A=
Keep the bus enablement separate from the touchscreen device node so=0A=
it can be reviewed without depending on the pending NS2009 binding=0A=
and driver. The controller-only configuration was booted on M10 V1.2=0A=
with no NS2009 device instantiated.=0A=
=0A=
Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>=0A=
---=0A=
 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 5 +++++=0A=
 1 file changed, 5 insertions(+)=0A=
=0A=
diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
index 270ea970c95a..0c03f118378a 100644=0A=
--- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
@@ -131,6 +131,11 @@ &emmc {=0A=
 	status =3D "okay";=0A=
 };=0A=
 =0A=
+&i2c2 {=0A=
+	clock-frequency =3D <400000>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
 &io_domains {=0A=
 	vccio0-supply =3D <&vcc_io>;=0A=
 	vccio1-supply =3D <&vcc_io>;=0A=
=0A=
base-commit: ae965b9856f033145e292b0c29082a26bcc45efd=0A=
-- =0A=
2.56.0=0A=
=0A=
