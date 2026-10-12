Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023075.outbound.protection.outlook.com [40.107.44.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C67B48A8C9;
	Mon, 12 Oct 2026 12:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807452; cv=fail; b=Yvg/VMGeXwJOfKeq4QT1J+EU4p75LHNNO/g4ZA6UsIAGCgSKVCBDC6bc914244FY7S7eS51aFslsOtqQKAAyciGI0cmOfhPRJFtliksXk7wVYy6ilQhC0AtJj3kD9DXZjKPJl+GmtW7gby5WPc8tSsqW2gOIqNYFv1B04jZKAak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807452; c=relaxed/simple;
	bh=8vaeCwhccaTCtUtn6nA52XXqnCyoC2ag9jk6I1/3NJU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=derxj29BKl/sPeNvuLLcLc/hns9qDPB6YdTXGINd9AeKYu+GaEOHWGFynrbbBloab8jroqhruZefU1ECd9TNNI6PJkexo/GelZd5x6NuAv+tmrS6fjFh4uxS1U7GLkXagLEVPaHpj+mcViphbXcBr5cSA4thRI9UH5hR0086RTQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=KElH6W5i; arc=fail smtp.client-ip=40.107.44.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="KElH6W5i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DsjvfT3N7UJSOEZdo74wlQBbxgJ7TatUsoPx+q+gS7CIlOhIrz5MaaZ+M5UCFaACMR4xjxbpwj5CTfOYqj/beeBVSQEjS8731BLfd4bN5eHmvS129wD7SsTuLZijyuRbfH8ChpeXHClB1CvKRUIX9Ium9T+92rdH3gW1K8AYtleRLwjUc/181G50u0krYhbwAHPFwP7GhJq1+38iAkI0f8Ys+Z+7PfL0KDn92dDFkPr4XQHHMpA2SoFajJWn8L43XuFcJtH1MAi8QdKDRr4gwi8ownS+RHkkGa7rjizTJcHbm4c8UvnZo5RPIqrQBmhzlo8Zp3xsJu8LQqa5ErW9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lfDb4cmFaPQ+TZkOhtazB5ZscWXVho18cCpB48aRixo=;
 b=P0ZW31wf4dlUxYei2/N1enmCs2rwLR6fsHiJln38+ohFAV/Ta3yyCtpIy5Ko+E5XdZzPkKb8e6HRcbIAGwB47lVnpvDIfBf3fT2qGIwJN47Nl07aFyHSZ0WpnPN3PFMSj+RCWhpaaMQKQJCF1kVawpm1t1GrmrzGQdTmHX2c5d68bqAdCie4oKUc+atSZNNp52RFooTpc5sgzPB/hcnI3ULIv94K9vFFK5zClwojzI0zSZHtKjm3QBshMQwN1pV4Oup7ABSCYSD5kRlXH2NtDDIMbwMDcWixcZaYS3z3k/h1I8/VV3H/VPoTNEDJCsM7/BRvm3iaodpDggR/Meiorg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lfDb4cmFaPQ+TZkOhtazB5ZscWXVho18cCpB48aRixo=;
 b=KElH6W5iMTg0KrWl2TLd32fghHej8RKzipeDYUPMFH0A3q7AO+FViJ5hYGN+vyhXH8irGjPk3W56xclp7kgm8sl6ZA7B5zlu6UZb1GarlxEOsCynoH94RSmzMLyUtwUZmWnrXlS3SQQ6n+mpoat64ZTSkwTYbNcbY5sFVLGicU9tdwGD2POXgzc7C1o+X6snbeIqHJ3dP9d5dMoZtJH2+H0JsV0YlEC2kNqrDS7g8z/9xgu8pQBk5rAXfzzdBaw+FCrY3VbjHt5JjnmWxLhztRoR2akfi33GSXsOMRTTaa6OviRD6McN86KMPQ4XazYJgaxwjgxBwv7rEZWZJhAh3Q==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by SEZPR01MB5629.apcprd01.prod.exchangelabs.com
 (2603:1096:101:136::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:17:25 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:17:25 +0000
From: Miotsuki Mizuno <founder@crepuse.com>
To: "heiko@sntech.de" <heiko@sntech.de>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "robh@kernel.org" <robh@kernel.org>
Subject: [PATCH v2 1/1] arm64: dts: rockchip: Enable touchscreen on UNIHIKER
 M10 V1.2
Thread-Topic: [PATCH v2 1/1] arm64: dts: rockchip: Enable touchscreen on
 UNIHIKER M10 V1.2
Thread-Index: AQHdWkOko9C/6H5gOkqN98S07Cj6qw==
Date: Mon, 12 Oct 2026 12:17:25 +0000
Message-ID: <20261012121723.53521-2-founder@crepuse.com>
References: <20261012121723.53521-1-founder@crepuse.com>
In-Reply-To: <20261012121723.53521-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|SEZPR01MB5629:EE_
x-ms-office365-filtering-correlation-id: 43691a69-c2d5-4e27-fc19-08df285ac6e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|56012099006|261009223027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 31KIKT9duT8PHuCASJeSqt2VoIymSllpNhJBBLjWq6tBgnZ/QGnavKqyaGXc21cdlF8fLla69EpZ7p0n/HqWvazpDfjO9AaFLZdEfz8o6f2+vBKtF4t4AouVQEe2tpVmes26UOhpU3rnAMVCVha/nnPxJVzv9WBb8uq3i6LUu+7b/09l+GUBp28FDRtyksHh0bHSLXT9/xP6eQa8e+CngdtORmD8Sa/OMDJqV+6ebF8zySkFrlpokfQugHhJetE79NLknylIcQPL15288fYRhlPQrtJv8o2a655J8dODYUPKavhcbknvb/9n0PRoev4BuI5wKBNMyHIjD06mDV6AJKpshB8AMzMoNkQ0mRcdRpDUTwyonvJJJx1iwzMA2bBkonvLRUT2rHpgrG1EJrsu1SYz+K1rVgSu7jkhIfGzgs39NR+WAPO8E7M7hXnZZSt3cAbQO/yIi6a0AlHuuToHpdJvsFDRfxcGnEuoSxvAjN3SDZYu53QaSI/m/ins5gWpijYOwN/1HWAjw9+0BTvNlAYCpNT9oxtoOpsSPpiOEivkjZEQv5E+4PKK+JgTba7pxYZhSzz5BCrZG/J4C94C5BN/GALcBQ6I+pr5Y0TcQ/lkw/AThKrLDksL4hCBPTwSO8G8zXEoalEsyZ5F0XdMulbOGWdEM5aEp7Ag+w8KHE+beSd2fbXeEiXfocmR0CtuQEZHaMzu2xxov4hWViEQWdJ3tbiXd9hebBLvYpI0A0E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?amga8kJ/s7fSKW7lVAD2cC326Oh0D6mrhnGrpCa2DdqXkBW3cEW1OSfEbn?=
 =?iso-8859-1?Q?1lty1I7WsU40evUDzfGRof6ygwMj3TMC9YzxZLpv9PbS3DIlISbNKY1AK+?=
 =?iso-8859-1?Q?/gWVmRQ9P/zTzx8tpWawSlfeTyodA9uQyAawKw+YWA8QpmBb/47tlDfuco?=
 =?iso-8859-1?Q?sWhlN5FhtBBj8ZtLi63QIl6z2gGIXg+s1pGBOSyHeu3Gc33IoysCXR3TjB?=
 =?iso-8859-1?Q?gWtIwzSoTx7xEXqbamkHrHlJsmh1wgkjRih+3bo6quW+JkGIW9OB0AvlZY?=
 =?iso-8859-1?Q?mrnqYMPFN4bMN4Z2asEKoR3YlsJWo6wh8hYA0QmoVTwDobiU4wirM1QYnQ?=
 =?iso-8859-1?Q?Aw1IpH/oG4hTDyXNojN7+spsNW/b7MTTL7SEs3SwflAwBoWUk8+k/+KfEt?=
 =?iso-8859-1?Q?t0KOZeRDXJQB0dmR6fcRSnuYxQxZlFE9p1vBND2KOh8H+WESPyoxYvolhO?=
 =?iso-8859-1?Q?afK5+TJsUcMlxm4edVgBRtFiL6mZzK4UjrPTYx4+cf+TLqyB9k57bs+PkX?=
 =?iso-8859-1?Q?qh9eKElmIfLnHDdD4WqgvEQ3TeZ2dSbYRxLe8WkZwqij37g0vR9CoPa5qG?=
 =?iso-8859-1?Q?t3vYwnUvidjJjgCYDzJgOwYwUrL5JsV4yAItfZpHP1OkW4X6kRrEN+GgX1?=
 =?iso-8859-1?Q?1/HPo/tlEpoe/TwI0nRRCg4LySr+VWnl71alUoaHyMFTzwZOIu6U7Tmzw9?=
 =?iso-8859-1?Q?LmWzFCuygdbuMFNkbodkm0oi61jAPmSgByHj/ziAEUVxKqq7CHwB1dW1LR?=
 =?iso-8859-1?Q?P7eIRFwl2ZDmmo+ncK/ZHC8YKqwOrhSSOA4ZoBJTD5zojiIo+d9V+hFp41?=
 =?iso-8859-1?Q?HzHn2bksUidnBTr8b+adP72JTPAI5n2FTKDrXp7FanRVCFo0SE2B6Lk9AF?=
 =?iso-8859-1?Q?9QSiGoDLHyzWMD+f7xgwvxzT44cbmxK+6OC4xxnBVBTHN/mr1EuDGP0aPH?=
 =?iso-8859-1?Q?hpJGjxQQTN2sMlS+7XmRfB+eLHnV15YedGV5/HSGWUg9uB6BbsoTj9HfSi?=
 =?iso-8859-1?Q?wPrEVKC9gFZliudZnsbXZ66l4epypQHse8Qk/UWbNv6jSD5djk0Ew4fXZf?=
 =?iso-8859-1?Q?3IWQ9cGrBSvvulmgMOlj1x0aEsgpN4fUHK74HBdmkB1LXBcvoGJ3B+BnRu?=
 =?iso-8859-1?Q?46P6bsCkpSdxFl7rOhgnYl53O5j2yaaHN1F1pf8XpGap7XLVrvqrsF1AxO?=
 =?iso-8859-1?Q?LNAu/T5Dyl87ciNI2qGt2CUUm7P2KRtGtQMy7oZ3Rw4BNleFFNyrItpXgb?=
 =?iso-8859-1?Q?6iqRFjgZqmBJQ7ocFL5KqU+bCMjMMELNokkHeb8Rx2lpp8+cwA09/jQK/H?=
 =?iso-8859-1?Q?U5E25ureCeqrPK9D974O3Pk2EVenHl4gwCclNUGQdMX8ZIlM4u8Wvg1crK?=
 =?iso-8859-1?Q?F2uy9qS4eMwKCU6ShjaKbubPyiMxSrI48c6+omiKu68KT1DjKgRXJkrbuQ?=
 =?iso-8859-1?Q?F9dJY92Bmdl5DKIV8J7+JI4icJYqTYkIbhYKVIZSSRyAKYV4soe5jx8Pvl?=
 =?iso-8859-1?Q?mMxFEvQf/1vJT1XqPnck2Ek01RgZInizk9WsvayEO5psSqXfWR+F6V7SlW?=
 =?iso-8859-1?Q?sdSslb3lOuv35QGdNonXg5gXGb+lSCph2zUSTEcBD9lbyVn73Q3Ryefphw?=
 =?iso-8859-1?Q?5e/5JOh2KdGZ5iJ0P+5LKIJfZW9DSI2dwZNjGfwIa4kd9tgedGejJbrLlT?=
 =?iso-8859-1?Q?RvzoPIqaJVb4j/Q4pa5boUWuDFtPIiAL9dUyjlOh/f6zS7/jSxCyqFsaGo?=
 =?iso-8859-1?Q?XlLtTTo1r9LT951mKyCW7MZ9gTjFJCpBMpD89W7tnepCAq?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 43691a69-c2d5-4e27-fc19-08df285ac6e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 12:17:25.8795
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SqfZMc+YWFCxfX/Evyn9Eacj45CCq1PaUUroA+rDnkWcxPQBNi+r31uE7CVgSebyDxhP11LSnikJE8mrfO1Y6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB5629

From: Mizuno Miotsuki <founder@crepuse.com>=0A=
=0A=
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
=0A=
Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>=0A=
---=0A=
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
-- =0A=
2.56.0=0A=
=0A=
