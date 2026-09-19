Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022085.outbound.protection.outlook.com [52.101.126.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C832331A48;
	Sat, 19 Sep 2026 13:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789825301; cv=fail; b=n3kTop1SsMEd1mpMa2vkPRuT0okAGKPe+nwNYTGLSrVVMzl9Ozr4/cfBmLxkS/EkaXTzTafYY9sD0eSsvS46Dfi5jbD0rY14gBEO8RvR3NgEQ12G26gVFj7Fk4Xxz80yvgKtjnsTHWk81P8gRTwSJIa5n/bLcL5TvgaF0yoIY/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789825301; c=relaxed/simple;
	bh=32LOZrozlh1CcsAU+tNuk873HkN8EjV/lTPbB2Udsvc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kdb9ADkCNdz+M0wHnG2wZI5VUvZtFba+Fpl9vEuI7m/3W6coCUxY63sQ75U8GNsuq3Qpx2lLgIG90yeDTsLPp6Jxo6uEAv+S1B/4FMgTJ7fMGiXr14Ip1qcAnoTa/uhLvM2c9WJfmtXOM/Ow3Fv4C6vchmZDUxC5PGJxdEvb8wI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crepuse.com; spf=pass smtp.mailfrom=crepuse.com; dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b=peFCZ804; arc=fail smtp.client-ip=52.101.126.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crepuse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crepuse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=crepuse.com header.i=@crepuse.com header.b="peFCZ804"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkdZUIhtaFFB9D+PzMEx0zmzvaiRSRmdvHL+OCRVyHXWrKF68lwWbzJev+3hwKH6+JgtnY0Bgr3VQbBQaNInYcCfgQxbXKkpUmhq8t20PLbVhhilsNJl3PTi05E8h8JhHIhja5h/Lfj8VDOBPLnjcFf5qD1sbT5V2bUFdhTViOh1GtcaU0RULSzrAWv9KHGf2adjNghTdUli6s+Si5D50dYWgDdTQdk6wfHvIrGrOCBWwBrzzqjNng06AfcH/kuuxypLpXcqYQOnvyHTJYlCuy3f0NirOwi3EtVUjDadb/7sfYpo8Oqj6ZiCvgv4tuMIKx/l3Qvr5/w4VoRVlLYlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIl0wL0tvq09HW6ObRqXQ70T3C1MrWZ/U5O6rMrOZYI=;
 b=MRqIn48IXd0ItXwP2nL3pb2QIoX8FEHIoFTKxZtVIt9ULk1kgILKOwQ2+UyUS18kmUFhcuDo0evy2QxdeApF5SjsUSE91TEaXGD2J6BNXDK/OlCegFaVQeib+n8Zs9i9XobU6daY+X83/OW+gxe5jJ74b6Ox1DoeU75W38zFhK07VXZJdX3joKRjuOiCfr/NpcQscNlT/6iEILSYno9UhKl+uPnVkpeTSOu6aj/PXSxhTNj1hQGhFLWY0NdHP0SfItYMW5bqgvwUJQyDKexO6Zg8WTKVIERPx2rSIwanvtd78cAT4UOiwdtJqyZdxdIlMQFNVV4ho6Bngrb6DhIUFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=crepuse.com; dmarc=pass action=none header.from=crepuse.com;
 dkim=pass header.d=crepuse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crepuse.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIl0wL0tvq09HW6ObRqXQ70T3C1MrWZ/U5O6rMrOZYI=;
 b=peFCZ804tdQZOigkRNbCwig6mEmYiDxbHtQX0+pRS12+OnTNoBo6lVF7MW4pSodkjFKh/rMQx0tDM4Yssw0gNgPH8JJJ9IiBBU9lCuYe8UC0+OT4N6C6A8RQGFg9+ZYq16ImqJXqbw9b18LKEC2CEC+0ZytvRLboVdXh+rEg97gDLnLdcYre/0RPipwyZlO3Ub/1yG9qOmIY35xVRKiUM7m8n8qxQoWQEiSKjVKDh/VhMuFD92TCqcWY8hab3ErcKlXHwTCp1us5jvxb7r1l4GeHY2w67D2iYYg0fGXLM22u2KinW36VJciWg98AWWlRZJwUzZiDjTxXY8xdMTNGvg==
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com (2603:1096:308::253)
 by JH0PR06MB6581.apcprd06.prod.outlook.com (2603:1096:990:33::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 13:41:32 +0000
Received: from PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf]) by PS1PPF6469DE8C6.apcprd06.prod.outlook.com
 ([fe80::e60a:2617:6895:a0cf%6]) with mapi id 15.21.0406.007; Sat, 19 Sep 2026
 13:41:32 +0000
From: Mizuno Miotsuki <founder@crepuse.com>
To: Heiko Stuebner <heiko@sntech.de>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-rockchip@lists.infradead.org"
	<linux-rockchip@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2
Thread-Topic: [PATCH 2/2] arm64: dts: rockchip: Add DFRobot UNIHIKER M10 V1.2
Thread-Index: AQHdSDyUoUvij9D5qUSYvSUSAiH2NA==
Date: Sat, 19 Sep 2026 13:41:32 +0000
Message-ID: <20260919134125.59419-3-founder@crepuse.com>
References: <20260919134125.59419-1-founder@crepuse.com>
In-Reply-To: <20260919134125.59419-1-founder@crepuse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=crepuse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PS1PPF6469DE8C6:EE_|JH0PR06MB6581:EE_
x-ms-office365-filtering-correlation-id: 0c57455d-bcd2-4fc2-15e6-08df1653b74b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|38070700021|56012099006|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 DqwO4kOzWheBVh4DQO0IIWSRWvDa7SiwisLX2MnQVdXDNUzDy5RNNKk7TJcXd3rCC+CG/jWRHegPwgV5TPq7pdHP5HbIKvV3CugKeklSBZK1oqsiTb7drLLN7Ary2s/+bA2HpnDTAR0JuPOLfVVJC1TXDyeAi7WNiJnbhzvPezpJ7rwPrA5P676mYRyp+mcyjBW1K8/UDTJM9Ii4v8rr/b2yJdGZDa8QBa0AP7tX6/e+M8zfUQTiyiZf5tjVrwsN8f5oJZGRKPDPyq/jsNnHabWmAFjXvM6IIauh/VjyfRI/p9F+JHQMFGZ8Tj144z50DEDMIz2AXnXonIQY8kFGUSOuPkMzp3n4eQrEF+xJt4ryE+vvoMXxpH8QROPqPfHT2Twxt8i4rOut0ImP9OwiNvxHzn+XT9d3ZLrcG+ZkTCqQJGdtdDLWWv+LqM6e4l44sQPOnZdDPE6196UTZjvCbFMq4Zh5vM26gPJo7lIsXC9tJVtknQ+DtMC5E4ELMFzFri9oLG4j5nkf6iXqgYf+578OjMGYWc/mU/1z07PbEtuOaXm0cIqIILp/7atRGGncQteBHPLNscuJIIerA2rDGS4ELA9jPB7CAk5Zp3Rc1zHXglNKx6oA6gG/kYOUrowQ06/UUJ/G+mNm2A5h5PKNwxLGKtDe6J4Nc98JoU96Ul7AVMhjHcK7HH8duxfOFtKJYeBYh3yKIPnVBsxZVNuALPW420IIqmqwYUe3iHCp/K0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PS1PPF6469DE8C6.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(38070700021)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pw5DnXQ5mthrMyyBoAL3BqZuHg12URHMPqDKuTOfo1IA/MdlEZvCDFIASo?=
 =?iso-8859-1?Q?LNRw/Aw3KtmhkqQdo5Bjxmpns12zD5CVmjC9KBz0n71jJKxeUSABv6pcX/?=
 =?iso-8859-1?Q?tQf0GXTtj+K5zLcjVAJbg8ibJrv0XhcM7I1yzPf1N9kasgynNlRa+EGIN4?=
 =?iso-8859-1?Q?eA1eWJOnXXiPSFowkHJelz7+1VquTzjBiF2zpCfACKdbqHtW6uh3AilmgY?=
 =?iso-8859-1?Q?3w8q9FOWhu6sB0O8hAAzNFQA9YFyMBf7UxIiBwiatA30b+IbZ2tCADSrAg?=
 =?iso-8859-1?Q?6BjE2QI5eHNRHCCYaAxLnwg1SjG7JVWhSXPf6kslNC4FapkztEJjIYjjhs?=
 =?iso-8859-1?Q?zXDju4b4pLtPhYzwuIpSkxj3Bh1buqkwZ5EmlFR0/vc/etrBq/iFQgJ7Xt?=
 =?iso-8859-1?Q?Ylwl5j+XGu8dDr9zbmzBah3pYt9wJ76bLQI7dFet1LO0wMpNBu6nfiSGPC?=
 =?iso-8859-1?Q?9JF7n2+PO76719H+K+FzEK/z7zDPJ3XJPZUYkWZe9VXg60Fznn5V5jt0ac?=
 =?iso-8859-1?Q?uI3tPvoIlCvB12Gj56t+XSbcSdUyn/thexu3DDC7i3zlpX7mCTemnbTjgp?=
 =?iso-8859-1?Q?j5Mb089CcWbYsu5N7cUG7QByZoOIalnKkAZ2Eoqj+RUS3fMRwnGXMoUx8l?=
 =?iso-8859-1?Q?3xFOnIC+omk+e3w2troysxHzu9ckcd4LxNvXFH9rtE7W1P0bdvJLqzLaz4?=
 =?iso-8859-1?Q?E7XW257PvohQfDJ6t/9wR76ILLg0uWKfoslY03PznKsnhzehl2VFJE29c/?=
 =?iso-8859-1?Q?7v6Adp5mRZoL0JI2AqT0FVeHMNJ8gfHHzEpHO2ClzFNzTwTrQcCzXBYNra?=
 =?iso-8859-1?Q?6RwTzqkR3Apn6uYQDSaF5jVLWIKH5HXiD9HEEtbuz6jToFX4NQypufEoo5?=
 =?iso-8859-1?Q?Bt2o2W+qxKI16iZKXe1QZnqRmsLuIafsjfPnal+4m21Y5U1d0hmDH8Klyf?=
 =?iso-8859-1?Q?bf/P3bTYPcslnybtBnqklrW0FSxk1/v1gp43rUdtLykaL/CqL7FCngV3WI?=
 =?iso-8859-1?Q?q3wdSmutjgUmepRoL9Ic9OwdhHUCvTUXkNFA03kNnZ/CvXlU4vALE83W9g?=
 =?iso-8859-1?Q?0uMkRKkxENbBaNWiVEgvSQxVSLViFgj10XyZ0hPJcT37XzlHjgN/TovXGQ?=
 =?iso-8859-1?Q?7V1nj7Yg7HPg8XHcfhDW3v4PnyHEnSXnksi4noc2rSem6Icqe/Oxbqu0uM?=
 =?iso-8859-1?Q?Cqd3sBBZqfR7kunJqQP5R/csQtkryLmvtVZbERudocU7nfEgp6lE4S4zEc?=
 =?iso-8859-1?Q?7PIeUvOtDJiYfF+SEx612Re7KdL0QWcr8cexoKkQnbJCy/9MIillQ1g2bF?=
 =?iso-8859-1?Q?WoZlDbKpIF6K5b1vp8QfWWSyuVLWZx5zxbbsFe0WrZ3q41JjGo6V+2AfXK?=
 =?iso-8859-1?Q?ovtmZjaTjdOlOFTkLVAOEhRiv+hbnqVyknaciBueJ8I9uvyVbmf4i1qAdn?=
 =?iso-8859-1?Q?A5JGP30A9iFiE1l0zbM7TVLY9J/wTqkYzlU/LvXcIx2vEch46aYRP1fJ94?=
 =?iso-8859-1?Q?e4ooAkLOTAOEkIZDP+PDupbfPGvOZGTW1E5+YjX9hRui5c0R/qpz8nxNyN?=
 =?iso-8859-1?Q?r4AG07xrWiaYGpBKLPTsmLPmxPEuOfNn8SVQ/NJjy1D0kdPPLoEMGcRl82?=
 =?iso-8859-1?Q?Mwpfh8QwKZW8M1amZ+q7Kh8PzwqHlPURvGWZKMBxYS0pLl6gz1xyDhwo8+?=
 =?iso-8859-1?Q?Z/BSE9N+Ic8lEo2pBv08IZarMgvGWe4wHE7V0bZ1vmaWTGPwGwIOfhvnEI?=
 =?iso-8859-1?Q?AzCENatg7k6/el/hWfhxU3wT/2NvPwP0eWzBfLPaZS66J2?=
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
X-MS-Exchange-CrossTenant-AuthSource: PS1PPF6469DE8C6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c57455d-bcd2-4fc2-15e6-08df1653b74b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 13:41:32.2492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1d352272-7d70-4a91-9c85-0db444db1bc9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mdW7bC6k/bTQU4yn+kqtLBYXk3z0y/Q1u984+7T5CNXZsOcS0ilADw+B3eeYiyfVhMpOjRDP7Bt9yaXzID+xCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6581

Add a minimal device tree for revision 1.2 of the DFRobot UNIHIKER=0A=
M10. Enable the CPU regulator, eMMC, SD, SDIO Wi-Fi, serial console,=0A=
USB host and peripheral ports, GPIO keys, and watchdog.=0A=
=0A=
Audio, display, touchscreen, Bluetooth, IMU, and companion MCU support=0A=
remain disabled until their dependencies and board wiring are ready for=0A=
upstream.=0A=
=0A=
Signed-off-by: Mizuno Miotsuki <founder@crepuse.com>=0A=
---=0A=
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +=0A=
 .../dts/rockchip/rk3308-unihiker-m10-v1.2.dts | 248 ++++++++++++++++++=0A=
 2 files changed, 249 insertions(+)=0A=
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.d=
ts=0A=
=0A=
diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/ro=
ckchip/Makefile=0A=
index e7936a21c118..6e520a5e3c61 100644=0A=
--- a/arch/arm64/boot/dts/rockchip/Makefile=0A=
+++ b/arch/arm64/boot/dts/rockchip/Makefile=0A=
@@ -19,6 +19,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3308-roc-cc.dtb=0A=
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3308-rock-pi-s.dtb=0A=
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3308-rock-s0.dtb=0A=
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3308-sakurapi-rk3308b.dtb=0A=
+dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3308-unihiker-m10-v1.2.dtb=0A=
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3318-a95x-z2.dtb=0A=
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3326-anbernic-rg351m.dtb=0A=
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3326-anbernic-rg351v.dtb=0A=
diff --git a/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts b/ar=
ch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
new file mode 100644=0A=
index 000000000000..270ea970c95a=0A=
--- /dev/null=0A=
+++ b/arch/arm64/boot/dts/rockchip/rk3308-unihiker-m10-v1.2.dts=0A=
@@ -0,0 +1,248 @@=0A=
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)=0A=
+/*=0A=
+ * Copyright (c) 2026 Mizuno Miotsuki <founder@crepuse.com>=0A=
+ */=0A=
+=0A=
+/dts-v1/;=0A=
+=0A=
+#include <dt-bindings/input/input.h>=0A=
+#include "rk3308.dtsi"=0A=
+=0A=
+/ {=0A=
+	model =3D "DFRobot UNIHIKER M10 V1.2";=0A=
+	compatible =3D "dfrobot,unihiker-m10-v1.2", "rockchip,rk3308";=0A=
+=0A=
+	aliases {=0A=
+		mmc0 =3D &emmc;=0A=
+		mmc1 =3D &sdmmc;=0A=
+		mmc2 =3D &sdio;=0A=
+	};=0A=
+=0A=
+	chosen {=0A=
+		stdout-path =3D "serial0:1500000n8";=0A=
+	};=0A=
+=0A=
+	keys {=0A=
+		compatible =3D "gpio-keys";=0A=
+=0A=
+		key-a {=0A=
+			debounce-interval =3D <20>;=0A=
+			gpios =3D <&gpio0 RK_PC1 GPIO_ACTIVE_LOW>;=0A=
+			label =3D "A";=0A=
+			linux,code =3D <KEY_A>;=0A=
+		};=0A=
+=0A=
+		key-b {=0A=
+			debounce-interval =3D <20>;=0A=
+			gpios =3D <&gpio0 RK_PC2 GPIO_ACTIVE_LOW>;=0A=
+			label =3D "B";=0A=
+			linux,code =3D <KEY_B>;=0A=
+		};=0A=
+=0A=
+		key-home {=0A=
+			debounce-interval =3D <20>;=0A=
+			gpios =3D <&gpio1 RK_PA0 GPIO_ACTIVE_LOW>;=0A=
+			label =3D "Home";=0A=
+			linux,code =3D <KEY_HOME>;=0A=
+		};=0A=
+	};=0A=
+=0A=
+	sdio_pwrseq: sdio-pwrseq {=0A=
+		compatible =3D "mmc-pwrseq-simple";=0A=
+		pinctrl-names =3D "default";=0A=
+		pinctrl-0 =3D <&wifi_enable_h>;=0A=
+		reset-gpios =3D <&gpio0 RK_PA2 GPIO_ACTIVE_LOW>;=0A=
+	};=0A=
+=0A=
+	vcc_1v8: regulator-vcc-1v8 {=0A=
+		compatible =3D "regulator-fixed";=0A=
+		regulator-name =3D "vcc_1v8";=0A=
+		regulator-always-on;=0A=
+		regulator-boot-on;=0A=
+		regulator-min-microvolt =3D <1800000>;=0A=
+		regulator-max-microvolt =3D <1800000>;=0A=
+		vin-supply =3D <&vcc_io>;=0A=
+	};=0A=
+=0A=
+	vcc_io: regulator-vcc-io {=0A=
+		compatible =3D "regulator-fixed";=0A=
+		regulator-name =3D "vcc_io";=0A=
+		regulator-always-on;=0A=
+		regulator-boot-on;=0A=
+		regulator-min-microvolt =3D <3300000>;=0A=
+		regulator-max-microvolt =3D <3300000>;=0A=
+		vin-supply =3D <&vcc5v0_sys>;=0A=
+	};=0A=
+=0A=
+	vcc_sd: regulator-vcc-sd {=0A=
+		compatible =3D "regulator-fixed";=0A=
+		gpios =3D <&gpio4 RK_PD6 GPIO_ACTIVE_LOW>;=0A=
+		pinctrl-names =3D "default";=0A=
+		pinctrl-0 =3D <&sd_vcc_en>;=0A=
+		regulator-name =3D "vcc_sd";=0A=
+		regulator-min-microvolt =3D <3300000>;=0A=
+		regulator-max-microvolt =3D <3300000>;=0A=
+	};=0A=
+=0A=
+	vcc5v0_sys: regulator-vcc5v0-sys {=0A=
+		compatible =3D "regulator-fixed";=0A=
+		regulator-name =3D "vcc5v0_sys";=0A=
+		regulator-always-on;=0A=
+		regulator-boot-on;=0A=
+		regulator-min-microvolt =3D <5000000>;=0A=
+		regulator-max-microvolt =3D <5000000>;=0A=
+	};=0A=
+=0A=
+	vcc5v0_usb_host: regulator-vcc5v0-usb-host {=0A=
+		compatible =3D "regulator-fixed";=0A=
+		enable-active-high;=0A=
+		gpios =3D <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;=0A=
+		pinctrl-names =3D "default";=0A=
+		pinctrl-0 =3D <&usb_host_vbus_en>;=0A=
+		regulator-name =3D "vcc5v0_usb_host";=0A=
+		regulator-min-microvolt =3D <5000000>;=0A=
+		regulator-max-microvolt =3D <5000000>;=0A=
+		vin-supply =3D <&vcc5v0_sys>;=0A=
+	};=0A=
+=0A=
+	vdd_core: regulator-vdd-core {=0A=
+		compatible =3D "pwm-regulator";=0A=
+		pwms =3D <&pwm0 0 5000 1>;=0A=
+		regulator-name =3D "vdd_core";=0A=
+		regulator-always-on;=0A=
+		regulator-boot-on;=0A=
+		regulator-min-microvolt =3D <827000>;=0A=
+		regulator-max-microvolt =3D <1340000>;=0A=
+		regulator-settling-time-up-us =3D <250>;=0A=
+	};=0A=
+};=0A=
+=0A=
+&cpu0 {=0A=
+	cpu-supply =3D <&vdd_core>;=0A=
+};=0A=
+=0A=
+&emmc {=0A=
+	cap-mmc-highspeed;=0A=
+	no-1-8-v;=0A=
+	non-removable;=0A=
+	pinctrl-names =3D "default";=0A=
+	pinctrl-0 =3D <&emmc_bus8 &emmc_clk &emmc_cmd>;=0A=
+	vmmc-supply =3D <&vcc_io>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&io_domains {=0A=
+	vccio0-supply =3D <&vcc_io>;=0A=
+	vccio1-supply =3D <&vcc_io>;=0A=
+	vccio2-supply =3D <&vcc_io>;=0A=
+	vccio3-supply =3D <&vcc_io>;=0A=
+	vccio4-supply =3D <&vcc_1v8>;=0A=
+	vccio5-supply =3D <&vcc_io>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&otp {=0A=
+	status =3D "disabled";=0A=
+};=0A=
+=0A=
+&pinctrl {=0A=
+	pinctrl-names =3D "default";=0A=
+	pinctrl-0 =3D <&rtc_32k>;=0A=
+=0A=
+	sdmmc {=0A=
+		sd_vcc_en: sd-vcc-en {=0A=
+			rockchip,pins =3D <4 RK_PD6 RK_FUNC_GPIO &pcfg_pull_none>;=0A=
+		};=0A=
+	};=0A=
+=0A=
+	usb {=0A=
+		usb_host_vbus_en: usb-host-vbus-en {=0A=
+			rockchip,pins =3D <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_none>;=0A=
+		};=0A=
+	};=0A=
+=0A=
+	wifi {=0A=
+		wifi_enable_h: wifi-enable-h {=0A=
+			rockchip,pins =3D <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;=0A=
+		};=0A=
+=0A=
+		wifi_host_wake: wifi-host-wake {=0A=
+			rockchip,pins =3D <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;=0A=
+		};=0A=
+	};=0A=
+};=0A=
+=0A=
+&pwm0 {=0A=
+	pinctrl-names =3D "default";=0A=
+	pinctrl-0 =3D <&pwm0_pin_pull_down>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&sdio {=0A=
+	#address-cells =3D <1>;=0A=
+	#size-cells =3D <0>;=0A=
+	cap-sd-highspeed;=0A=
+	cap-sdio-irq;=0A=
+	keep-power-in-suspend;=0A=
+	mmc-pwrseq =3D <&sdio_pwrseq>;=0A=
+	no-mmc;=0A=
+	no-sd;=0A=
+	non-removable;=0A=
+	vmmc-supply =3D <&vcc_io>;=0A=
+	vqmmc-supply =3D <&vcc_1v8>;=0A=
+	status =3D "okay";=0A=
+=0A=
+	wifi@1 {=0A=
+		reg =3D <1>;=0A=
+		interrupt-parent =3D <&gpio0>;=0A=
+		interrupts =3D <RK_PA0 IRQ_TYPE_LEVEL_HIGH>;=0A=
+		interrupt-names =3D "host-wake";=0A=
+		pinctrl-names =3D "default";=0A=
+		pinctrl-0 =3D <&wifi_host_wake>;=0A=
+	};=0A=
+};=0A=
+=0A=
+&sdmmc {=0A=
+	cap-sd-highspeed;=0A=
+	disable-wp;=0A=
+	no-1-8-v;=0A=
+	vmmc-supply =3D <&vcc_sd>;=0A=
+	vqmmc-supply =3D <&vcc_io>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&u2phy {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&u2phy_host {=0A=
+	phy-supply =3D <&vcc5v0_usb_host>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&u2phy_otg {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&uart0 {=0A=
+	pinctrl-names =3D "default";=0A=
+	pinctrl-0 =3D <&uart0_xfer>;=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&usb20_otg {=0A=
+	dr_mode =3D "peripheral";=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&usb_host_ehci {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&usb_host_ohci {=0A=
+	status =3D "okay";=0A=
+};=0A=
+=0A=
+&wdt {=0A=
+	status =3D "okay";=0A=
+};=0A=
-- =0A=
2.55.0=0A=
=0A=
