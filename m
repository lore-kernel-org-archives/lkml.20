Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023075.outbound.protection.outlook.com [40.107.44.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EE1489869;
	Mon, 12 Oct 2026 12:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807448; cv=fail; b=dhrumU4pkKAz06IOxQA0HaKL7EuFx57lwTK9XcmJQGeZxo9PKWu2lkUr1pRiPPFoCTNxTmu/BdTkPxcKUaJFM2D8h7p+QJYywYiEgVAbvAd8Jd6Wv/omYqIM0fuA85+rVF7r6+tiI/oTZ/YPSbCFH/BXU5mtD3SKuqqf94helHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807448; c=relaxed/simple;
	bh=VGPDsXLOUrGmpUHtlNYPXj4B+HPhPSyAmCOe8pBczjc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iw82PbqR6dfLwSGDDqy7fKJfgdbyA3SalJ/HEy0XuBOw1aydlyDXvba3fwemLssokRgi7Y1a1JVvP5cy5xxoOxJyC+KxjRzW5uUHCneqegse4Wd7L/OdDgKwNBEdTZy8y1hNC1GafCLPDg6jBC1awC91dJogQL6e/sbxS/Pm6Bs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=ZbrZ0lFW; arc=fail smtp.client-ip=40.107.44.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="ZbrZ0lFW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrifI/0ghAiQzHkIxSNTurik0uGUxohI77Z0i/Reeu84HZ8oOr/A0sHN0tixrfoCJ/nZvSwwHyI7K1Ic+qImES15AbhAGZ8bB6j+s79vAIYyRZW+CzPtYkNzGKWXWJHLHIWaBA49Rm//RFnkax8i+RJuu4i4lnJabHwkum9Tv+7AcwJmeps4B+l0MzB+ZTF3D3hu8rhmOUKdXyZ2YGlFenj2aSOP5wM67aF7utCk+Xuab7wEwy6lZ/DNvnc14Q/gImlVuMeIR3gEvBzOJrP3mcAhyEr85rGjOEe7ZJ8tV+Rxa4Q9X2i613OlFGtehLO+rhR/SLYjBfsK+JmDHHQRfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mp/ezOhkHiLlOfU1wHjxIAlCklFjwsjzEmyXlFHR7m8=;
 b=UqphgBHV82eZsU+0vzmsSuYelLydaBKg9RnbtFEOrpJgkC35diAOdci1l8PAljHXQ1OegxsiiBNtEbGRYptyGTRqClfUqjqnoKFoCv1qYjHjVWwm7Ujb0ibuqXkr3fRT7lOtuOnorStc12DLtRZTVscDoJUUN5Tpo+jIW22XYTkVP+iBaXMs1DD5EOMNtlx1kFEryNqVbTHG4x/9j4wmZoGdP2sizK7AbxvdsCDXXBgez+CBOuOt63Pg9FonT2VHTQJQelEbIX1+z02lAq83RY8cjog461DPMF9/UrjxtMan9FpJM7L2U90ozaMRnFibtVFdW4dUUl53gqvLTyASWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mp/ezOhkHiLlOfU1wHjxIAlCklFjwsjzEmyXlFHR7m8=;
 b=ZbrZ0lFW22/JIG209RqoedbIJd2aqXUBlVkBdlTNzsUg/c4mDwy8x8wIFBQ3LOVRfPjdxzr5lZfYtjFq/2x1LQBMn+OdL5gApuWPI06FiFPl70O1SVup1kNpBMvzvGKtLEe+gLt1f7ePhmfm4DUKP6wI3MendInmgY5C107v7kFexCFPFM7f7lZ9XWkhs9LFxt6p8lJKC7SpXgiNdNs+7i7i/uacyqimzITIiHHLVphyyoNfyhVR38QPzUHFDWiS5hJTEpf5XSShdFGiY6joAkAcrbzYFk5HcKrdCoAVTdwVgvcfwFWlAtm2awaqASE2zzO0+CzGOYOUpNc5hXgJ6A==
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:8d::16) by SEZPR01MB5629.apcprd01.prod.exchangelabs.com
 (2603:1096:101:136::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:17:18 +0000
Received: from KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a]) by KUYPR01MB8186.apcprd01.prod.exchangelabs.com
 ([fe80::fe2d:77d4:b78a:358a%4]) with mapi id 15.21.0496.020; Mon, 12 Oct 2026
 12:17:18 +0000
From: Miotsuki Mizuno <founder@crepuse.com>
To: "heiko@sntech.de" <heiko@sntech.de>
CC: "broonie@kernel.org" <broonie@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "luca.ceresoli@bootlin.com"
	<luca.ceresoli@bootlin.com>, "robh@kernel.org" <robh@kernel.org>
Subject: [PATCH v2 1/1] arm64: dts: rockchip: Enable audio on DFRobot UNIHIKER
 M10 V1.2
Thread-Topic: [PATCH v2 1/1] arm64: dts: rockchip: Enable audio on DFRobot
 UNIHIKER M10 V1.2
Thread-Index: AQHdWkOfuON+cvO8jku1SFBdXSbE6Q==
Date: Mon, 12 Oct 2026 12:17:18 +0000
Message-ID: <20261012121709.53418-2-founder@crepuse.com>
References: <20261012121709.53418-1-founder@crepuse.com>
In-Reply-To: <20261012121709.53418-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUYPR01MB8186:EE_|SEZPR01MB5629:EE_
x-ms-office365-filtering-correlation-id: 450bb1db-0005-4fa0-d4b3-08df285ac278
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|38070700021|56012099006|261009223027099003|10067099003|22082099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 Iunb93hCgQ0890pBuEUl4yAFw0uKmgnfWCInvkrkalaaf9CKgKnRwyo6BC1Jsyue9K0Ryq1paIpEpr4NbIOrMWr3fFcVNmKmgbqig5DeC610kfCcFXcmflMwOlJRJmre4z9Az7oYWN+TVz0lSqpuzRwu+w7oxU582SgcARpek/2vCcpaIWO0Dt+tNmfeTiYd/CwCRHtp9g3hpB3HI0xShuTwqPouE+P3krpGFfHRd51agp8GTw5eWpVqsztg5ZBjZsyBAPcUwJKyC+/R+LF28KqcV/Qawvl7NOs+9nwAUSYFsMADEfUjEtZd2yOfRYcM3Dvu3y+v4z3A65uuywiDgKn0/uc0fzhoOe3Ja+/BM+KVOutg04bj5VwjCWSfFHShSq4fmHUhTQbBPth4hdCYWMfyZVqwulOfqrmZGhvwJkOExAYn23kd3F2kFpcIJVwjdYdUMQI/MzPTTuwi0FX1hnCnd+EKjQ0LaXb1R5SS+51CKsEevQZBqvk6HT3eCZ8FoSQk28ANAygo5lHzvi5L8t3Ih4a2mlZEY0Ss9oFv2yDUsjLoYUtc+e0z5N+An69OhBiJ27EO4NFmaTZW6ihpw4pOQEAknfvYoX/B4KxjYCOsrFgg5tc1cY5kMD40Y7B4qR4XXXYUwtc6SJ02lt/uWlsvZyVhi2jIvsNsPLZOoVmieT9+1j65IoFosKwKXY9+ixWPaBfpDdK9kCMRpI3bEA==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUYPR01MB8186.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(38070700021)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?83ODOT4DQ3JzsJ9Pqkajgzdv/jmrdiTPrqc9waqBJfvVM51+N3aHqOhZoR?=
 =?iso-8859-1?Q?IoDBr8jOCvTMfh5zrt92hJw7X7I0R04+/1UQEgMSp4cVA+YOLWyyP4Dy9B?=
 =?iso-8859-1?Q?L6uk2nhc6HhWWlQ2b38y29mdhoCY/JDDZ3fv7sM07IT0cD+YHxN1XED7ps?=
 =?iso-8859-1?Q?07W4Co4p3BZfq3bDjFjzdheziIZ4PHixuZYuWxUwKzjr2KQZ4iFXO2XzQN?=
 =?iso-8859-1?Q?cfBaw3IlFAJemCDrP/kWFYFTzX6ecxQ5YDnUXjHuZh5onKbVE3QWfFpiqF?=
 =?iso-8859-1?Q?IczuVrXp9iYxGkdOPD2SyekBZMHx0DFqPFRnczA9laDG0WZTYw8jlA9xjt?=
 =?iso-8859-1?Q?1OvMGmJGtJQNzrrzMCeHsY+dCX71r82BoS+qCMqHTeqFVyh189VBHJt1rz?=
 =?iso-8859-1?Q?5KZfk3/e8otSceyfNAu0QO3KdCabTlxpD8xRiRT1c/XSJ/YeWFdYEXvXw6?=
 =?iso-8859-1?Q?PzmCdgnFUKvycjLwjR/j26tt4RgQvfVsv94u1qyz5Mh5J4MCW9X59iFnYS?=
 =?iso-8859-1?Q?MbJvfC06r0TpFKlRDsfqEtLH70Jp4lEelqgx3iI0sCFeeyRYmFi9lT7O2o?=
 =?iso-8859-1?Q?Ke3MnAgqlba9ks4pSM7/j1QxiU/5QUP/0AEituPyuR8UI5N8ZHNp6N3zgO?=
 =?iso-8859-1?Q?gbgLvERiPiWJfl9ZZznsWg7vM0YkW7CqQnUOFaW+D2qM7SsTyVFC4aSkdU?=
 =?iso-8859-1?Q?6p2pFuQ0+u6aSpym1V53MWF+sLMalsFxUvo/SOtSn6aWkJAxH5f2PjhVrM?=
 =?iso-8859-1?Q?7ca1vktUL9YS7IuQtU1HWRlyIYwgHssv412RAH6ePKlzG60rN7I9wGW7cu?=
 =?iso-8859-1?Q?T0k3hbI6JLA5JFhM+44d94JHNHjS1L6Roq1gDEn0X3VaJjM0KQHiSWpT+x?=
 =?iso-8859-1?Q?PnwggkMJeCYllrMx4PCKZ6GlKcd67pIqfJH9r7AvD96EcrgVUMIw7JrYto?=
 =?iso-8859-1?Q?zPuVdMxm7mYDxmiM1V4dRAmK4Fy4VR07BrkJoUgKB087W9PQaytFDUk818?=
 =?iso-8859-1?Q?cg2F1j0GHMDJLazMsUJ9UeTKmy9ncDCkXJdoiGKBxKpRAaLh3t7DNTyvKX?=
 =?iso-8859-1?Q?Zb4veZ8686coJQ9dIeAfot3EuYB3OzOQ+Df7K6A4x5buvOkZDM25P1lZx/?=
 =?iso-8859-1?Q?zuW5Rc1AX3Nkti6bi/5mClLTir/ivElP09iyCgeaOQYInhgjT5IuPJ364h?=
 =?iso-8859-1?Q?BhgKzoZ7a8hEYXJ1f+sUPjeVsVNKDJhDZmu8i/8Q7cQj0Vp8EYUhJDxcK3?=
 =?iso-8859-1?Q?QH7qHzLWQje883bcRxdymcFXBPjq9X1Sjb0NKtaUPHkdnzeny74aPp5bIA?=
 =?iso-8859-1?Q?Z+zBwozppi5dQKQwzk7JbHCxnrG1Z67839llPkmmkYwiFy+BlwAbS6CpGY?=
 =?iso-8859-1?Q?06p8fqldGgGnd6LHe+T5OZ0aizfNAegZuFFIpG22m6tkKDRdnDMtTYlx98?=
 =?iso-8859-1?Q?+BAtBitb6rtNIS86rwW1mMOkzTB3ho5mC0X8BOsF5QTBP0uwU3rKVrxSDP?=
 =?iso-8859-1?Q?jvnO/0M+lIpDzfVJNOaRZc36sS6N3T8lQoj9WnBcqMAoHvH61+CbzVpcsc?=
 =?iso-8859-1?Q?GvBvzhN9t8rPqVCZAssYPMlyyoZ5SoBotCu6o++owjadCilK3FQejfL6VO?=
 =?iso-8859-1?Q?nVYfnImBn9RJkjHfglmRDavFFXdeq6YGbTeYl5iO/PAO0crjFOZRXNr82d?=
 =?iso-8859-1?Q?dRjgskEr0o7hDqhl9omnXb/fVYA6Vnlm7J7B6JNgkdn0KtCDkpOyE/r2Sh?=
 =?iso-8859-1?Q?ziuN7gq3gepsJgHJ6AIDf1QZJjNcVTFquX7ndIozM/IBt2?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 450bb1db-0005-4fa0-d4b3-08df285ac278
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2026 12:17:18.1704
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9e189589-0b8b-4283-80ca-b0157c0a04fa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6p9nHggbwHyXGaThkrplXKR5DeXLxiJsrrNUnIR+9Rb8LuIFqhMOyz7kaw4vO3WoDjxYKSz7xj0ixz4H/dBVfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB5629

From: Mizuno Miotsuki <founder@crepuse.com>=0A=
=0A=
Enable the internal RK3308 codec and its I2S2 interface, and add a=0A=
simple-audio-card. Route the onboard microphone to MIC1 and supply it=0A=
from MICBIAS1, with the bias set to 85 percent of AVDD as used during=0A=
board bring-up.=0A=
=0A=
The board does not expose a speaker interface, so no speaker routing=0A=
is added.=0A=
=0A=
The board uses codec revision B. Support has been accepted in the ASoC=0A=
for-7.4 branch as commit 157f7cba77a9 ("ASoC: codecs: rk3308: add support=
=0A=
for codec revision B"). This is a runtime dependency; the DTS uses the=0A=
existing codec compatible and bindings.=0A=
=0A=
Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>=0A=
---=0A=
 .../dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 30 +++++++++++++++++++=0A=
 1 file changed, 30 insertions(+)=0A=
=0A=
diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
index 270ea970c95a..7adef454ea89 100644=0A=
--- a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
@@ -54,6 +54,26 @@ sdio_pwrseq: sdio-pwrseq {=0A=
 		reset-gpios =3D <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;=0A=
 	};=0A=
 =0A=
+	sound {=0A=
+		compatible =3D "simple-audio-card";=0A=
+		simple-audio-card,name =3D "UNIHIKER M10 RK3308 codec";=0A=
+		simple-audio-card,format =3D "i2s";=0A=
+		simple-audio-card,mclk-fs =3D <256>;=0A=
+		simple-audio-card,widgets =3D=0A=
+			"Microphone", "Internal Microphone";=0A=
+		simple-audio-card,routing =3D=0A=
+			"Internal Microphone", "MICBIAS1",=0A=
+			"MIC1", "Internal Microphone";=0A=
+=0A=
+		simple-audio-card,cpu {=0A=
+			sound-dai =3D <&i2s_8ch_2>;=0A=
+		};=0A=
+=0A=
+		simple-audio-card,codec {=0A=
+			sound-dai =3D <&codec>;=0A=
+		};=0A=
+	};=0A=
+=0A=
 	vcc_1v8: regulator-vcc-1v8 {=0A=
 		compatible =3D "regulator-fixed";=0A=
 		regulator-name =3D "vcc_1v8";=0A=
@@ -117,6 +137,11 @@ vdd_core: regulator-vdd-core {=0A=
 	};=0A=
 };=0A=
 =0A=
+&codec {=0A=
+	rockchip,micbias-avdd-percent =3D <85>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
 &cpu0 {=0A=
 	cpu-supply =3D <&vdd_core>;=0A=
 };=0A=
@@ -131,6 +156,11 @@ &emmc {=0A=
 	status =3D "okay";=0A=
 };=0A=
 =0A=
+&i2s_8ch_2 {=0A=
+	#sound-dai-cells =3D <0>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
 &io_domains {=0A=
 	vccio0-supply =3D <&vcc_io>;=0A=
 	vccio1-supply =3D <&vcc_io>;=0A=
-- =0A=
2.56.0=0A=
=0A=
