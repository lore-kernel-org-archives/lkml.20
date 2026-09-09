Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA4849AA3A;
	Wed,  9 Sep 2026 08:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944151; cv=fail; b=Cq220c3Hsjl588jbLkXa/l1l0VtpBG7xvUmSNHyWiPvBYrIHEGmD4f+wzgSHpmrSYU6fwXRPa83rYJbFIh3b47rH/XcAqaeruf0PCkhpjlkMF9R8bAhVTRfNcNRqkqbrS+B7Dkc6smwUJEFlKgwPpvESknye3ZLNz6HAEbiEeMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944151; c=relaxed/simple;
	bh=lHh83InQyBa2Gfh6T8LGURC+AVI2gWze6xfuR+88CtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jXxHzqhhc+11dEv2JX7Ta8SnS+EOWUFzzUh3R683FgeE3xlyZpQZ6PAwoM3uGXyIj0iQty/quOawnx4oJzuMyKgzQJ+7laBJG7u8a3sI4Pu53XLMtjlUtcQ1yRHDRrkskw6HxxQAunzrRV5+GepFimNujnP1VjiOsndNdd8Jbv4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=RYz56vxp; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RYz56vxp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZOHjvn26rWMAURBfhyz+pD/DTPkrqoWiIlCCUe3qPGEF5TrQSHiddQ2V3wR1Tbq9QPVzGgiRTOvj6VNpabpGwETp7TyCOfH9mTQJp2upcRZ1MeinSK4XeyQhRNvQbBmrbfdqFrsr1Xv6lEYN4Jhz6BVhccd/4/2YFCEbBYjgVJoMkg+Lt7UnsKuRJrjoUwG/XsvR4Rx5i0/txh8jYARrsYPRZOCqZUa5iqqhIBg6Qi+f+yVX806gUG0WxB9auEtKE0mTnybaTTt7og0QHZFx71+6L1/q/4FRI5Vz+fyxBCL5iagYaZlFpqwNvxHvgtbabVS0tVR1DzEx07u5s3PIng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vsKK2mrxHrOqju3KXsvPXvMbpV2HHofnwprsr1IRQpA=;
 b=wzZ2G5JHgASai0SjldekliZvfNpO7XypJKR3FUzkqQDdblwP5+ky7b/uwd2N6gGF4f5S6AbldV1AzsbZqmcTmsa/jR48cS/nKILttjRyuWAoMtdbETy8DllLlPSjA7rxvHETAyLAQyL99mg7SuoogCOXNsW6zNGt+XMogzPXEAV7Hytv1ZvQO2bygVaNcyb8oN34rIiDuaM9WqNk+y16SWd1rrLb7Y8/w7IU9MF0MXXSD5PxjTsX/9PlTcTG65cmL6O8NjZsVouw9JmqNAx9koHIlTvYnbGIv/t5u0Egw7qvIZUcsEE8eaqMlIoPt3JJiz6XemoaYe1jlQYipoGIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vsKK2mrxHrOqju3KXsvPXvMbpV2HHofnwprsr1IRQpA=;
 b=RYz56vxpIiaOFET88iMj/veJRS/KykpY1vEqe2Aj7J8dWsZnP7hYRKaZCa7bPU8ajDMMbujB8B0IOYsyOToPoWOvxgtIKJHtU+081003ZuTyibFfbeaQ6hG8XBKlOvqLqbJf/83z31hrLoz3tcQuMCmu8J1qjhQJOYVV+OM6U3s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by OSCPR01MB14425.jpnprd01.prod.outlook.com (2603:1096:604:39e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 08:55:47 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 08:55:47 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
Date: Wed,  9 Sep 2026 10:55:01 +0200
Message-ID: <34a6d23e309aab5fbf369132d75794222097396d.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::9) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|OSCPR01MB14425:EE_
X-MS-Office365-Filtering-Correlation-Id: eac81346-724f-4018-4c83-08df0e5023b8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|52116014|10067099003|18002099003|22082099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	JNlnUhHGXTM8aigbQfPGMweu6Vw6btQEWd3r9LtUy7Jcr0KmWW7F9vlT4eK0dU/c0Qas915CKq1Mh1RteyU4A7MVNCZwSi+n2XxH0RAfCBb1hCJplBW14mwQ59qJVrkR2uvFdlcKeZ6SFK2pvT442BzeCX6T03EZ+eFpaOsNpTG0F1lItMwMVk6Bk8D1IYumgeLhKVU2QJqWzgZbOFGUiWTKYX4rVy+9KAOwxsp4+4IrT72yZvFNN5xLKbOWMVb8xRzynQghTVnEHHT+XeMz1G+qyPCSYsQCCl6Fi5YkqyPyEjPWQ3iVyaQxNJLMI1wwPcV4zj0u7UGwMDL2SdGbQ+sybnSvvKdGeZl7tNEvjFeNoT8TXVQKo4Yr23iQlWv5d331pwAhNt0CXib6gQc4f4GSAcisrLonrcDWLG8rbQiq++v8X6pEnKsxPW8fNzn4ZPaL8NI7inGKyCYbjAk5pTFr2EojquiZno5z71MObp7ZevT8XKDQjWJlifm45MLtDF9PwZPXpfIInwGLJ3i6CIAx++HBE2rh38wbq/mxEQUvAAMre6iK2wazr7N5DQb2QSYdmt/pAKyRBkgrc0YlTdUDakdqyAoZI3yRfk/EhulwytSpu0fSx11Zq9sv97XuoS/kCkp3rGvuNW4Xjva2920cizJq0GyafesC6WELAr5rro0p/G40cY6nu6dWL0mXFr+KFwfW3yaXra2Fp/k/Mt+v+p55FvzdFZ6TN/yATyE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(52116014)(10067099003)(18002099003)(22082099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mLPS8FyFDuWYCXodmpNIZS6uT/N7Kw0oblKDopjMn5wgxtu8sMg2JVXHoyhI?=
 =?us-ascii?Q?toTdTYG18ITWs8a0S33Ugk+ihMpczZqjcGQJ4CASXt3zO6ikWPE1jQm67z/V?=
 =?us-ascii?Q?ngz8m2HhWacyt50KgPoJdsndZZkmU7g7oNL8P4UMXJ7tJIyUMDTppwKd4VL1?=
 =?us-ascii?Q?UA6SwmhrpxJxlB5JaleBxOtyQJqS1JmeGAGrmCPEOyQONm+Vr1mrmzyt8rZa?=
 =?us-ascii?Q?2RQ8ygOLokI1pPzp80tKtf4H5LGOX2bqej55dc2F9XlrRGuXfkS6bDBL80XB?=
 =?us-ascii?Q?j8jGP8QhNtr0Vc93ZBITnIQFCvhXmGEMRfjTeJzrm+h+iC1E8rlMMIp1bQZJ?=
 =?us-ascii?Q?eFB3g3x1bVnEKomdmjKeYgIw3FB7II/fLu8WLxLC5j74KTqJikDCoJqs0Rp9?=
 =?us-ascii?Q?/pT+E5YJory/APWVVdvbuY/PDO+rFse8PNgX9GRcSj/81K1OEDzIM/v88q93?=
 =?us-ascii?Q?eLom/MAsAcDYvHn0/4D8d68TmWce4jjwjbAJl2CV2Pw7c0U2UfHPAPO/6pF0?=
 =?us-ascii?Q?oBaEjOGCn4EHdh9Yl/kw4PTlHGpYXEb1DVQYeSCF+pYqcOh3VyncOTg+Y23Q?=
 =?us-ascii?Q?jH0QTnFRvAVmp/G3pmRu6B+/qaQKg8fu240vZnF336nLN7/iAuokv3ynPaNV?=
 =?us-ascii?Q?KnTdUdXK8x9Jb0mGm05nM/WYf02shlG8TRINhzS6KiKZmzkvvNr+fWYxj2QY?=
 =?us-ascii?Q?xYv2Apl1vajU6s7Fppcohi7H3b+Lpnib2p8roJN9EaMwSM75kHbqaytEosSp?=
 =?us-ascii?Q?0u/wVuJMPjsTSKzsb6YTzjXdojALoAYFQJEdlTz9RR6qxH4xYNHta4ajqDqo?=
 =?us-ascii?Q?HOoFEIeh23CBMKAxggg7/MPwq1Ql9mtV8dVUT0e4X22jNOYnDEfbTNzuiDyM?=
 =?us-ascii?Q?c7T8Xcm0oUG7kBP/+y4B5CKuvmEZ9KbJA50NY87Kmk2B9yJWElvd0y9d1u/E?=
 =?us-ascii?Q?JnyDd+Gr+6KhXsuBRPIWYSSvq11P6JDTrrWlK0wsIXD2yTaNL6JqInCX8Uqs?=
 =?us-ascii?Q?Gpp3NgISY990i4b2NtEVqMEuT5gg9JQ/oQb7NdyAYeXVT1ki7XaM4EACBcxZ?=
 =?us-ascii?Q?ByexTp1JgFd2yOWWE2UuKxxiC3RWGbKVHCFVA/9DdjpqAL2G9X0m654SvGZG?=
 =?us-ascii?Q?dlfL96axhCf4u9t9NVDXjROJnmRL1NIq/9t5Axtxzj+p4P7qe8BxDJLhyHqw?=
 =?us-ascii?Q?QTwwT1J0PAN87fyEyeLARX2vrd4u2QzXz5UleicnUMWcnLRj6eczXFP2fxX8?=
 =?us-ascii?Q?70eopu6q7RJW4j/fEcgVRnbZ1lBqiXhi8rjnW90gQZSesq2kpFaKuhJWoKIX?=
 =?us-ascii?Q?Gwzo2FAHkjB7FtY+GLn6h+g82Q8m5z1aiDpk02w+XhfLnEZDGlIpTBdYeoUc?=
 =?us-ascii?Q?26D+TfXnQrxlo6MrdVO3mOnKB/gqHRWfNpqm/jnsRbnpuhG2E1M5WAvAZ9Va?=
 =?us-ascii?Q?9CP1CXr63PfGsa1F8p4ds6oKFpRSORatNLL6jq3ShRIgUzheprjXNtTYkqwx?=
 =?us-ascii?Q?ZCRMMn42C78E0uwzVUj/INvgvTh6sHc4Cotpa+fURrSkXSgT7GkVW3uPZSfD?=
 =?us-ascii?Q?vPm8hfLp7Ryd67DFko/cFy835TXcSaQ6Z4/HPz1cOXkpQJeh5e8ewW1LqxmV?=
 =?us-ascii?Q?bsdiC1rvKa9fTwYtuZ6nehCY87XUOPTAJwpdUeJXe5dZncOSzE9oRkfjvhj7?=
 =?us-ascii?Q?BkqGFQc1FlJxYvBQPrCpKjJH13X48fLR5x3c/shl0YYuIzBOdzuae0yJisFR?=
 =?us-ascii?Q?XNRTct8hAFQi4j+Qe5GdE/X/rnR6L+lgEtuAbmaTlQQQH1t8D/Wo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eac81346-724f-4018-4c83-08df0e5023b8
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 08:55:47.2839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKmNPrF3hwCXA37PCogYomnb+Gc8dArrzYQhcNJPQS9scbzlcwZZ+hTJ/9SVc1MFA3EL35AI+oEwy1gs2Y+2mvKk39QiF3K+Yy/n6I1+RbOVZrPAZmCSImN62yj8sNzp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14425

Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
USB5_4_HOST connectors support host operation only, while USB0_OTG
supports both host and peripheral operation.

renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
EVK, so disable the common USB2.0 nodes in its board DTS until proper
support is added.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v2->v3:
 - No changes just rebased on top of next-20260908.

v1->v2:
 - Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts in this way
   we can drop placeholder patch.
 - Update commit body.
 - Improved usb20_pins, usb21_pins comments.

 .../boot/dts/renesas/r9a08g046l48-smarc.dts   | 20 +++++++++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 45 +++++++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 25 +++++++++++
 3 files changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
index 5289efd1a430..ccd6e6394532 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
@@ -71,6 +71,18 @@ codec_dai: codec {
 #endif
 };
 
+&ehci0 {
+	status = "disabled";
+};
+
+&ehci1 {
+	status = "disabled";
+};
+
+&hsusb0 {
+	status = "disabled";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -122,6 +134,14 @@ &keys {
 #endif
 };
 
+&ohci0 {
+	status = "disabled";
+};
+
+&ohci1 {
+	status = "disabled";
+};
+
 &pinctrl {
 	audio_clk_pins: audio-clock {
 		pinmux = <RZG3L_PORT_PINMUX(H, 4, 6)>, /* AUDIO_CLK_B */
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
index 469a6282b2a3..36482357c2fc 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -298,6 +298,28 @@ sd1-data {
 		};
 	};
 
+	usb20_pins: usb20 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(0, 0, 12)>; /* USB20_OVRCURN */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(0, 1, 12)>; /* USB20_VBUSEN */
+		};
+	};
+
+	usb21_pins: usb21 {
+		ovc {
+			pinmux = <RZG3E_PORT_PINMUX(G, 6, 12)>; /* USB21_OVRCURN */
+			bias-pull-up;
+		};
+
+		vbus {
+			pinmux = <RZG3E_PORT_PINMUX(K, 3, 12)>; /* USB21_VBUSEN */
+		};
+	};
+
 	usb3_pins: usb3 {
 		pinmux = <RZG3E_PORT_PINMUX(4, 1, 12)>, /* USB30_VBUSEN */
 			 <RZG3E_PORT_PINMUX(4, 0, 12)>; /* USB30_OVRCURN */
@@ -394,6 +416,29 @@ &ssi4 {
 	shared-pin;
 };
 
+&usb20phyrst {
+	status = "okay";
+};
+
+&usb21phyrst {
+	status = "okay";
+};
+
+&usb2_phy0 {
+	pinctrl-0 = <&usb20_pins>;
+	pinctrl-names = "default";
+
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy1 {
+	pinctrl-0 = <&usb21_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &usb3_phy {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
index 696a933af808..e07fd9396adb 100644
--- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -91,11 +91,36 @@ &canfd {
 	status = "okay";
 };
 
+&ehci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ehci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&hsusb0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 	clock-frequency = <400000>;
 };
 
+&ohci0 {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&ohci1 {
+	dr_mode = "host";
+	status = "okay";
+};
+
 &pcie {
 	status = "okay";
 };
-- 
2.54.0

