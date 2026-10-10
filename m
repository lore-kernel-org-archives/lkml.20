Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023084.outbound.protection.outlook.com [52.101.127.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5603EDE6C;
	Sat, 10 Oct 2026 23:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791674954; cv=fail; b=Ww2qXU+v8wSxXCInASXzNMbJ8t0wgSCqg4Zv/GzD2BLrgfCCvm18lHnfFrxu9RwYccB/SPv8OGTQoRTdg22L/QQUULhzYydjntXs+aj23YVHReb7bQPT12PkmXHVyC37Dfmxs+rVXJf6yL59SBAGCVqts6VNCZ2e1mvc5cOsSSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791674954; c=relaxed/simple;
	bh=ZaRyYM4LH+2TEa9FNHVzSocUwGYotPyelV+Pe1OZZdw=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=V2h0pJmSxdiIP97zFgDD2rBYbQNmOraFQoP7tq6xZsJdAaQuwiXluYcJa/+FEWOKyP7kQFakHjjH6NsjGNo4xK987f35QG/n4V+4SSohJObnK/M1LqayMPzIl3e9gK+pUXxfv/71CCdXrO7XssDzy+1McuyMMI4vv2K1/IMCabw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=RV/YMVe7; arc=fail smtp.client-ip=52.101.127.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="RV/YMVe7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vnrNR9iTQbIlWKTld4SCX+YAbVGU0RLSLf5npnFerhtnHCrA1zYJ0xidBxQjIsZNQuFb3/kGMM88u1ultJ1hmZ6BgtrlFv3P02mwyJwfAVOG0Hsb5UQ34ymB2VDygJbe1CHDuAXuZ4e+KOE16cf6wvvtUdSrL4Ja3cj1Nl+mfkA+fUH+8Ov8bTZPUL6Lq03lTfF0Svq6qvJOXPKrlKrcc2qEoK4IUFIMLsSZuficRHGhfGb3LlvRtA0kiq4z84SHS7Qm5fAINnL3fXlkk8VJ0HCG77WSD+1G8gFKcacA0drKxUVKhckVDUaCCVrkwXYIGxUv9jNqPXOVxbciReeCIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3nib+XQhHn46elPT55aySIvy1nFy+5k86DfpGBdSRo4=;
 b=vwqq/JPKaVU+UIuac4eG7ceg7MxirOUxbUuRxg0C/ZeJhAaCNBEKaBGDPJWPGV39+oWJMG8tbc4ipYoHVGMt48yZDmf3p1/9h+7j1bd0gAN1ZeBlnYSFHF1uA/R9DldS90INZUM/ISYdWZD/bL7nOYhUoMikY2CtPCgukyFD67V12KEwLoVUbhaN1zhaI8xuNCuaDlNIfmtQ2rJv5alg8VSVlB8Oq4OsZnIRo9zGBeAsZiRr2rgiQ9dSrNHX2ajFZqh+Ta6yV6SefLN9F1xfZjeFQ+sD79hkG1zMAULhs6Ak9OveaukFs7Nkx97E6usDDYAqbxSPMEjzzqRpHSHj2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3nib+XQhHn46elPT55aySIvy1nFy+5k86DfpGBdSRo4=;
 b=RV/YMVe7rhO6z3aWBotymcNznhZKGqOZaaKPZ869qK2AMOhIVzMVBfymem1DX8ziOVRTBK7uOTxwZB6qaeqyT8qYw+72ovjugrJ0fMJQB2vwHWM3Bewn2/aCCE5na0sFFc721Ur2T8qEEWncatFewktNaI8R9T6kMlFdUp4Nx8cksT6yskK5WO71SjwfaqLsVMqHU+3wdPIjU/TreHyY7i/5ZMYiiIFKgNsIsLnM7AmId9xc1Mun9KxYA0icT4mgt5q1cehc4sKgiAzMuCcQpDXmU0LBhugwFZPsaW0zz+X62gXzieXLElcVyey6f8r3NuYabPqjkVcRtKY4i0z8xA==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by TYZPR01MB4380.apcprd01.prod.exchangelabs.com
 (2603:1096:400:1d0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.20; Sat, 10 Oct
 2026 23:29:10 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0496.018; Sat, 10 Oct 2026
 23:29:10 +0000
From: Miotsuki Mizuno <founder@crepuse.com>
To: "heiko@sntech.de" <heiko@sntech.de>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>
Subject: [PATCH] arm64: dts: rockchip: Enable touchscreen on UNIHIKER M10 V1.2
Thread-Topic: [PATCH] arm64: dts: rockchip: Enable touchscreen on UNIHIKER M10
 V1.2
Thread-Index: AQHdWQ8miAWIfw64yEyob26Vhs9d7A==
Date: Sat, 10 Oct 2026 23:29:10 +0000
Message-ID: <20261010232908.26968-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|TYZPR01MB4380:EE_
x-ms-office365-filtering-correlation-id: 3b2778aa-d255-4a8d-e7d7-08df27264962
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|10067099003|261009223027099003|38070700021|6133799003|18002099003|56012099006;
x-microsoft-antispam-message-info:
 Qzc2of2vcb6Xiu9S/PG5d+IINRRHILJD918OcqMZEdFFwSeloiINDuNgEibInSdhcEldE7uX6gD1LMRYSVZJwkwQZfSW1dAR7zKo6k9eip7oi4QH8JlKiLZFwSKcrQ8sKobZavJLI2UYLVltVsQSaPdf7gZmwV9d2dZOMLVcOTJhSv46wWJvvAJ0Wc1I80RGz3nHAcT/evJT9S+31E66KC5OYv8CVcZGbte/fyJS/xzuCqWhVNIl2P4i2oBTRtGTL3S5xowblA+m0gDQYUsu4Gegeleiyl021hcYcMQTHQWNcMMRzVdyzXxP7SivPDgIfQFCyWUdacZlRtHvkSGZzSv51jqCG3lzb21D8mxOT7rMyXN68+5prXHE9VwMRfHXfogNul8G40vJgat7b8CzKQoaCPvKwZDl7USCSjVDZlNxWv+Op/OrCdRbUmsxhoK9s1sB5cnSnrK7O0wcM10OtwSOHjYmIed/BpC+0iVDFiB98CcxLVcoNGsJIOm5Nr7rFSDx3+EJ8fWSkBeSOQNirmxiHJR62AuWqY9haHvo3dOUw0hnrHxQl+mpKCkOKCUL0mGfTRiqZ/gagVCcxIRVEEwvhPVBA8iIIbPDLdIBrIYzr9c2QbkvARj5WnYGjsrRnBtlNqOg8pOgUOi3J5NuJRezErKkxfNoz974fKmSPWuOWrlyB0+n4ryF9bg4hOf9M9m9WI9g6n0L/4HKual9b4tOLv4oOzKMoVFAbKm4yMg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(261009223027099003)(38070700021)(6133799003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?mt6ezFpoAbDKiJa1kxpLaFLWZFXBtzLX1gRpAXTH0EnV2sAh+6HCyikv7h?=
 =?iso-8859-1?Q?aIsR3oATre9WmoKmBWwexluMvdIRruzZRXa7wloLps1Hz/DVDQirFPhY9d?=
 =?iso-8859-1?Q?QvlGbRSe2laVtcB4FlnwTYdKoqqR/vf7q9Qh8dUfwtzhQquPnXkSQgXF7E?=
 =?iso-8859-1?Q?JVbxcvWylMY3oMecod8N4EIY2YGxzl9iNTBcPXlyt3UMWejO9UYRcGXF6K?=
 =?iso-8859-1?Q?uoPgByvMwY9eS+4mcqCq7QD3dmkJAwDuNFk2Agz13I5wU+1ZC/xP/R7nJV?=
 =?iso-8859-1?Q?BqNcmx1sF3VqttknzaycsrdhP7eW7Da+3WGqEYgKB7lrycB39E0K6QHyo0?=
 =?iso-8859-1?Q?KSUwdKB89kZj8VxHvO02AxSRzOu4TXJgQ1IdTFSpsfplngY7ekA1B+agN2?=
 =?iso-8859-1?Q?BS4xnsE3f3Bk+ht8RHV/LskhnQvpvngEFiYq7gRzi2fOmlUp3++34Iou+j?=
 =?iso-8859-1?Q?tDs0sokGtYrjlxHIaQXKufpmdxfSC2J2uspwfUyHVX3mzHlpaZcADZhMmT?=
 =?iso-8859-1?Q?iStHtM2kVYQ3YpFqqAtpV4XTxZgIP2/Q9qCixo7OUlusQ64V2xtV8UnDwH?=
 =?iso-8859-1?Q?NmD25+fFQ53kOBCEs+34y2t4zqXH6WAXZS/bw37acLlBPs8gFWROq2FTLr?=
 =?iso-8859-1?Q?BBwF93spM15CGqfkIUcpQpZ72HsjFaPDCdcT1w1bz5qrrdkJeilpWorvjl?=
 =?iso-8859-1?Q?EEvEVU2RPmhh+YnslRxqjscFl8jm0L4AmHnXrRN2JPsbveDQ60qE3GGHjp?=
 =?iso-8859-1?Q?X3kpPOm6UgpR5rnpcXlblt3BWofNtgk/PnHtE33tPDrc06VeNKmA7CxG0g?=
 =?iso-8859-1?Q?zgAss3hNgNDsZt4YsDDj/T2xsvAbUP6HC6mO+HNcubXnbHgVFqQdAPOrVT?=
 =?iso-8859-1?Q?0Bie0cP4TVtKMMh/qcUz6QPqlZDONzruIYsOPUPyVmrcioub/wvv06Fww3?=
 =?iso-8859-1?Q?gJoJr7QYmD2gcy0+u/VY6G2ybezu5j79NnWl98OPXVa+9f4PfihV6dk1SP?=
 =?iso-8859-1?Q?r9STq54701wN89Qb//LN86Gq8i+Lnl7Zoz8ru4kJwDpF8q83goOYfd+2EQ?=
 =?iso-8859-1?Q?P9k0oP7PxmBN9RF0wj5KcnQVperBu2fgt/wwTxxKR1K+Jx2/a+tlXiuucr?=
 =?iso-8859-1?Q?1kUAbYJmy39YdokbuycsY4cLudUh/JhLohR3pEffbBHi7Ge0NkHeMF8AKq?=
 =?iso-8859-1?Q?QS5ER/sx1ImXhLEuXvsx+rtMZ6FGnUAtd2mQB+o9mnoKiH+9FXAd1Icgdw?=
 =?iso-8859-1?Q?jMbrUUuYxciIpIykZqrYHROMAdhMcmO3KJS4RkfxgCBG7wduuZ8IgIEbp2?=
 =?iso-8859-1?Q?g5R0Z0H4tjPe1lz/vLD7WvxcbNmEaBnu1C30OfQ/37bD5xX04y2ECxluiv?=
 =?iso-8859-1?Q?d1nBAihmM7uY09QfmyuS9x/PtF74dQvX3Ou484pk/1lGwv7MPws8G3kXCd?=
 =?iso-8859-1?Q?fmEIr+DnQJm4CTsJNGuaHamWPXXSM1OU2D+Tzm2xWPr1XC/p9Bk6yD6Nnp?=
 =?iso-8859-1?Q?AT7iq2H8YcVtAGRKK3TkT8E3g1K25dfJswVLIe846vkNsDsq1Q3aBNQJiO?=
 =?iso-8859-1?Q?agBxNxYlPvlIxlZVS/1JD/3fr7hg0FN/nT9j87f/PXzlm2dTGMdI3im2MI?=
 =?iso-8859-1?Q?uf4DzyBGOUcQGT93Sk5L0sHSzjhF84tkRsh0xgICewMKcfzt897hSX/+81?=
 =?iso-8859-1?Q?HEpdkgQN8OELwlKXdOgalipAJccNpvWSYf+jMa0b9Y2v8KopMEzT2A+MMU?=
 =?iso-8859-1?Q?J3U6RDwrc4YwjyDQVE1ujOZL/0k4x7iI/xhsla4kraKk6E?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2778aa-d255-4a8d-e7d7-08df27264962
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2026 23:29:10.2375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omVew64FUv/0zARFU2EYQUbXqUHt0Kpdh0RKH/l2FoiVhlMkxQH4P8p+fk4yH8MkzYJwFzwfSeutUpZ9J68z6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4380

Describe the onboard NS2009 resistive touchscreen at I2C2 address 0x48.=0A=
Use the tested inverted Y direction and raw Z1 contact threshold of 150.=0A=
Retain the native 12-bit ADC coordinate range.=0A=
=0A=
The I2C2 controller is enabled by a separate board preparation patch.=0A=
This device node is independent of the display binding and DTS changes,=0A=
and depends on the separately submitted NS2009 binding and driver.=0A=
=0A=
Link: https://lore.kernel.org/r/20261009144729.85832-1-founder@crepuse.com=
=0A=
Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>=0A=
---=0A=
=0A=
This board patch depends on the common I2C2 preparation commit and the=0A=
separately submitted NS2009 vendor-prefix/binding series. Those NS2009=0A=
dependencies are not in the pinned Rockchip tree; only the validation=0A=
branch imports them unchanged. The display series has no such dependency.=
=0A=
The prerequisite I2C2 board patch was submitted separately:=0A=
https://lore.kernel.org/r/20261010232831.26908-1-founder@crepuse.com=0A=
=0A=
Validation: native DTS build passed, but native dt-validate -m reports=0A=
an unmatched NS2009 compatible. With submitted dependencies, target=0A=
CHECK_DTBS=3Dy, direct dt-validate and binding example checks passed.=0A=
The exact combined DTB booted normally; the tester confirmed touch=0A=
direction and operation. Capture: nine down/up pairs, 208 frames, no=0A=
SYN_DROPPED, final released. One E0 ff ff invalid sample (-EIO) was=0A=
recorded; this is disclosed for review of the pending NS2009 support.=0A=
Deep suspend and calibrated five-point coverage are not claimed.=0A=
=0A=
 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 7 +++++++=0A=
 1 file changed, 7 insertions(+)=0A=
=0A=
diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
index 0c03f118378a..7ae3cc8a86e0 100644=0A=
--- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
@@ -134,6 +134,13 @@ &emmc {=0A=
 &i2c2 {=0A=
 	clock-frequency =3D <400000>;=0A=
 	status =3D "okay";=0A=
+=0A=
+	touchscreen@48 {=0A=
+		compatible =3D "nsiway,ns2009";=0A=
+		reg =3D <0x48>;=0A=
+		touchscreen-min-pressure =3D <150>;=0A=
+		touchscreen-inverted-y;=0A=
+	};=0A=
 };=0A=
 =0A=
 &io_domains {=0A=
=0A=
base-commit: f4f7ecd2e0e8debcbab4789717cc79d570d665e3=0A=
-- =0A=
2.56.0=0A=
=0A=
