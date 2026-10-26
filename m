Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.143
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792996796;
	b=tNzKzZPFRcIEXkoX+IDbT/8NCqdf+JxTO3fOxOwcubg2fHLIj+xIzZUb2jwTi8RG9iX0
	 S5vhq3k+eWolOxxl1pI53hjxWOm8yw3aXKODMki+tOELzAqmucHdyi7JpGM5R+9cCilL7
	 06uhRNBMjMZ++acw3/jgBemykMltyfNCeysuNZzEpuEKXpEjyNIJBYvNdB1BtQ2boi4L4
	 B0yY89gMwaDttQjc3nl0pHj+jzLD4RzRxYyhe3Cm6krmrNeUEXsyx7UeB20Z4UhJLIxhl
	 BQOI2F+T5WMkaKOzcIQPvnXWhKbeeoovl0ZIOWZAh8jYfvNY12pkaLNnjXI9H25Tb0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792996796;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=QuTAB/WvGRyPfcIPuN+3aV/aND7R5Ds7Z45qXwbKMgI=;
	b=s2ed0zbnpT5pp9VKl6UfILsBbO7Q/uvwKa2XBfTYwI0RZZ1pVBe1T3Zlbv7w58p18JT6
	 f2c5Iqllna4Lpdpt8cdDUIUzIu+J+4S1lvBBNPDHBI0EWB45/0itVdK8TukyD0oSkTjoh
	 8lTKdkL9SEWkrc3TuIjPsX7qyK6BeCiChBN6cEgiDuBzkN+EgOJHFSO6c4Q4ao1EEH/WK
	 3Id44IKJU9bxzKz38Wp8riHoCLCPKYxjx1DBuGn4yQ44aInQvJ3+eFzkMSEptkQRmt1y0
	 6ZQwA7UvZkGr3DX5ifZcmfWHZwm4a/+2H4350KAKlxT42uurmWzdEUsBg5rUnR8wlTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valinux.co.jp;
	spf=pass smtp.mailfrom=valinux.co.jp;
	dkim=pass header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=VvpldK2P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.143
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020143.outbound.protection.outlook.com [52.101.229.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DEA606A31A;
	Mon, 26 Oct 2026 06:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DEA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=VvpldK2P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Foe8TpA7Gt2LdX7rN1Kw+gtGQ6ZO+rdPQzYgdxsgm+aKqYLjXb07I5SNSUM3C5SY0CLhNsugYSjkdydEn3TDf8bmiMuZNrUCPN3gEIdkkkvzeP808erIhXK64P+10TllxLBjfjqSgdfSAAeyaXm2VsPtb//zizX30lP2S4808GTSxnjbfgWqxG5OOG8EInKjbUroMD1dTiseWZT1iQUbqzweK0rMHAypjDl5j35QAMm+/pVHRUx3E45dMuZHxWfIXK0n9kOqXTK1m1jeTZ/bMqDHWhdw1zrU/X5mhvjCJPg4+dAaCHUgFMK2701ajyfi8D/s3Zl0Rjob+X4bCqreLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuTAB/WvGRyPfcIPuN+3aV/aND7R5Ds7Z45qXwbKMgI=;
 b=DyD0ZzAluC5Q8HO1R66xNyEC0h8V2njf89GBZ2TKDvsGM0k5JtcnBPtnI+zI31k4e3etEAu5zyFeh/Dmh8vrUhEdAjJs6g0Pzi+h25DTRSpwE7+eWcrDEZP9nt9UW/n9jx4u9yB2hGpuY5GkfnpYtKYV1MVmf5kQsZjT8FZCNAM5Uf9YyxssuNDhK05HESk6tduC/rP4O7iyhFWcWlQh+xYfBxHdcPaiId176yJyFxJ3wmKHZvK+kdnd7RiM/MZZ5gE3AZ+XcqTyJu18tPabpCl6SpMecU5zyh8Os9tgCCMayRIzIpKaA2RR6tdmrxyCp5M5wqo8rLyuvWTo3k8vkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuTAB/WvGRyPfcIPuN+3aV/aND7R5Ds7Z45qXwbKMgI=;
 b=VvpldK2PVHhds9cYPHOZWSqAvl4NPhgzV2zg96fwwdFEpqe68GplpyUllgVrR4VCzfoVNLxFtFXzByF8DnZxc+uBQgrK0aBybqsjXUCPeG/Ua3gCZAPPicjDDm2ahShS5ch8M31Utft714aZLBlIiqA2f0vRh31G3A+tqGaJiFQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by TY1P286MB3373.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:2e2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 06:39:50 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 06:39:50 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: spider: Add overlay for PCIe ch0 endpoint mode
Date: Mon, 26 Oct 2026 15:39:41 +0900
Message-ID: <20261026063942.3173469-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.54.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0228.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::7) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|TY1P286MB3373:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0ce2d1-914c-48eb-6fcd-08df332bef67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|23010399003|366016|1800799024|56012099006|261021121427099003|261021135927099003|261022075727099003|261009223027099003|260925021911599003|260925021311599003|260925022911599003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	EmLdNP+oKqj9gduDNkGe8+K4GkgF4IXc77VUP7jfQ2cBUzpFb7fqDIJ31rtMPSC3HH3mARkE0J7gIu9WyCp0hrQYNRnTBKIG16O6scHAuiYo/bzzVWlZrYuqxLf0q1DWV41sLuFMwTJB7suX6AXaFx820d5q0rtOOLAmU007B+XeI6kRGiTKcoWik7vUHM4Z7mh1EKDEq93nl1fl8RAKM6OCvWPgiOAFrVaiv6kH//DAg0NTEs/kwYciuGW3TN6p/9v8WAPKG+Uz5iGSj00sTW9KbB/JllJVHrp4vCTrS5MYMk4sl7BkoZw3nFNYjUbE+P+not9SYCEcUIz+injENTkntTNgvkdwPOKoZCV+NMjM4EGECBuGQt+snkUOG8IZBsyNRER3AWnk+QMbOxvEcVj/CD4rvsIid6e6BLIYQxfSvH5XdlY4ASMLTp0RokLOqMLLTXbHKmveHWkomxFOH1IImhXushR434of/QGX+ly0y4BcnuO27KsP4AgRqctOvkFQKfsIHxWqNnxX2PDU+eLNIFfGS0bAY/EQDlHK0nip0sAJjla0JUeuaUOkcHyxeNwxMVZPVFWAfIzidIjxdcS07kBAyN87fBQk3AsgBZ0p/MCoBxvZ0PGZTmc1+GwA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(23010399003)(366016)(1800799024)(56012099006)(261021121427099003)(261021135927099003)(261022075727099003)(261009223027099003)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fqreoWvBHc7l61boAhABLcr8KBvoxmSJET0w6rA05TK6MXbBS+zl+D2fBb+o?=
 =?us-ascii?Q?l01DWqplFBXM0tVIzCPdHac6tp8/6M7RqPnwqUrM/93zgtZBndq7YivEBjlb?=
 =?us-ascii?Q?FtNAoxkWxdeWUMbnwAkJuUeYQ0oRL267EPRvcVBiRlUOcB+XPeCDPzo8F1r9?=
 =?us-ascii?Q?8xBPfMX1tYTkpZf+DuQNWRkzqU//zatDNb2nyhpYzdiJdKjrqGl6lNpaCp+l?=
 =?us-ascii?Q?lqX1DTei85D0I1XZvvIY50eQhJKyK/E7AzJjwO5oxD0w9haIQjZGQ67TfIN8?=
 =?us-ascii?Q?812ye8EmJbUY2DzpgYov0GXlzQ7+Lxobr7R3RxPokkXvv0GnEx4oAK0KR4GW?=
 =?us-ascii?Q?1VJjIivXSkaa3CRHpZyL0G0Eko6yL0Ddc1kObiUbwqXuiI56AiH+PnOtVoYI?=
 =?us-ascii?Q?Iakne8swpp1YYfgwY5hwMCDPl8q7FhMqJbXxvp9wa8Ujj3jFE93hFwxaxdda?=
 =?us-ascii?Q?XnDZcv5VawFK1vkg35RHz/KdeQSW6k6tcgvnbBzj5+kyrgL0tp4E4crRAiDI?=
 =?us-ascii?Q?fmIKkxGPyk9RWWIQP9ZN8TPsvQLjfzwyF7hUfsaWmjJsssyfvb7Y1vhAX99y?=
 =?us-ascii?Q?vpB4ErzkW/66EdtDf3oQduSJ65AN7Hzq95ajYZWOy5cl9KpynY8lMbnUmVwi?=
 =?us-ascii?Q?fv3NC58pP2/M3oqtnsrREloEHvsJ2k7ewir9kFi1ajDKc2I2eXBdviNQqh6R?=
 =?us-ascii?Q?McN3yytdWX5M72N609wVjcQuhyeZH4eA1DV240MeB+x+htWISj9I/BsMIoh/?=
 =?us-ascii?Q?6Zd/8zGw3XfzhPXyunjldg0qgnXhIANFjhR+CCT9e9MFHhPTF9tX+6Z4mvgR?=
 =?us-ascii?Q?ZxvgzR2zsNQyf3ShNjBrO0oP5B2ki62wLVG9T/zCOkEXHpTyvZFg5SjldEHb?=
 =?us-ascii?Q?CSOKqPyEtV9gTMBddRhg4X/pyJTsLeSs+QolMnnmSfnCMrW7era27nF4VFVi?=
 =?us-ascii?Q?GQR2Y3KlcYCDG7mM8/tVgJ6a1YxACL5pSl+3+2iuI0thPNaatIcPOq48PcaZ?=
 =?us-ascii?Q?ntQCC0ubDRXuZE8SJO8lJwxD7gSE3izmqwqoky0BB7n5ueOlI98khLmXgVPj?=
 =?us-ascii?Q?J1MRsESetP9QpvBXNFB9wKDL0WfRvpMsUQvPu7ArpQRZOuhlmsNutwBuNB2A?=
 =?us-ascii?Q?SKVXKd+NkdTBREqArgqqP8QerXBZ1WaJL8k9Amuf3rvVtuXmtCp8wFJJQgvE?=
 =?us-ascii?Q?Jctbp6zGDAzWAgVIlE2PiPta1iaGKa7otsHuhyPHAucIyFP9nWsnNVjnw8Uw?=
 =?us-ascii?Q?0o5IwKOnJ+qosf/G5SicheciRhHTYsQAWcUTuS9r3gu26xOWjcF6/6ISfWmu?=
 =?us-ascii?Q?4uLi3Qipbre7Ha0KK81zFxM9ZzOQVewZgKasnH3iuFRv/ZWo5J8mvq6i9iek?=
 =?us-ascii?Q?PS1+V2VwGYHvXaImddnXig8STJPK4+nmyoiio/UP7RsXq5RepBiNeu8pwnyJ?=
 =?us-ascii?Q?zw/s1AugqGsf2NNhghKPspVI+syJRShtFU+ClLXscVr6+oAP44dd0hxo/dl3?=
 =?us-ascii?Q?ggfghh2MdAVnvz4R64wn11U4wPLVkHk5j/iBtIjHLhZ6sHJRRMjUKz+7A4UA?=
 =?us-ascii?Q?rES/eRAbGnj4AMJ2imQka1oXEXPaqDeN9q/XeYCHtaALU6eSrUQoMxNrVyiZ?=
 =?us-ascii?Q?shDeYf5fiQsvqteuRBHyQ/xkJX0ArahCErBxZ8eNIjdZEX7WSHfCQsXX6tvE?=
 =?us-ascii?Q?IjlbZHwH+W8MIQEiwHicUETgrGcnCO3oztPsYT3klTrL97N3ObjTn/O2Yy1f?=
 =?us-ascii?Q?V+rm+jelwGiiEew2CNZqVZ/V1tkz2XO+TSoLtaqwmLDa16q3jiui?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0ce2d1-914c-48eb-6fcd-08df332bef67
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 06:39:50.4389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dlScNdHS10sEWG648sER5gnm2f4AnbQSEPhYkVYz4/NSy3nizs39B/dLvP6mkO4TL+RJsV+UMqaxb+y11KC9fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1P286MB3373

PCIe channel 0 on the R-Car S4-8 Spider board can work either as a Root
Complex (the default) or as an Endpoint. Add an overlay that disables
the RC node and enables the EP node, to let it work in EP mode.

Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes in v2:
  - Polish the header (Marek)
  - Link to v1: https://lore.kernel.org/r/20261022082113.3163666-1-den@valinux.co.jp/

 arch/arm64/boot/dts/renesas/Makefile          |  3 +++
 .../dts/renesas/r8a779f0-spider-pcie0-ep.dtso | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index c6f3718cd19f..2b0012118287 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -86,6 +86,9 @@ dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak-panel-aa104xd12.dtb
 dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
 
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider.dtb
+dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider-pcie0-ep.dtbo
+r8a779f0-spider-pcie0-ep-dtbs := r8a779f0-spider.dtb r8a779f0-spider-pcie0-ep.dtbo
+dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider-pcie0-ep.dtb
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f4-s4sk.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso b/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso
new file mode 100644
index 000000000000..cdfc898e44f6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-pcie0-ep.dtso
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * DT Overlay for enabling PCIe channel 0 in Endpoint Configuration with the
+ * R-Car S4-8 Spider board.
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ *
+ * For example, follow the standard configfs steps for pci-epf-test documented
+ * in Documentation/PCI/endpoint/pci-test-howto.rst to set the endpoint up.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&pciec0 {
+	status = "disabled";
+};
+
+&pciec0_ep {
+	status = "okay";
+};

base-commit: d99e991749f3b12a3a8b23224725dbc1ca15f6bf
-- 
2.54.0

