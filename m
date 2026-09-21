Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66244A7C9E;
	Mon, 21 Sep 2026 13:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998340; cv=fail; b=CBfZjcjFpNpxOGRWcB2GdPt/4mN4UhYDRFZaJqrASIvI5QAMS6mtPPuq5iOW54PHBYFxuhwFeOm0Tj/3x1DgUJ75/GPoY7Dz+3FvBjWTS42gP8d7eBEEFn8sQ6PotTrqOM0QmseDAPu7ihI2ObO+aqMBMX0ni0Xjo98FZNcvMlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998340; c=relaxed/simple;
	bh=HQf0Pg03Kk+rc1Ji4ujYw2k38c2eucUtkXfLX14/NOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mom8+qUzTFW7ya+LiMTpmT7ZBEVAG0xA8tW3OhPdlm9TujtfN1vgQgncMBmmoyJlnfkLs0ybUZsKOakx0dhC0b4kVZCvGmCxgRHD7ybes4MTdIxVnZw5yimWG6QKzvQFPUulYPa1lyndox5JAop/TdSRVckpLpCPBuUI86ISou8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=qCk+keFE; arc=fail smtp.client-ip=52.101.125.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="qCk+keFE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSzHZcQVMB8TgSATT5Z+vv7nEhHbUlCaD0fer317U162yUqJqr4NFnR5aeNzCn8c4UGasKCt0I46rICrNrGT8AdP8M/YgC4jFZ9pdmPElqKirnYEfH+x76gMc3B5+LOCCeDkb2z8fRZzsVCKLQ2NUe8G058djUo05GxIRNRFZWnnHKJt5zotBMjEljvwsb5Fo/HHuY6yd1SpzEtwztgKCRBIQFwAvgRhg5ZvQRuMdQ42TLGyfHgW/ZHM6H2fqFzrh01jth9tg1YmWQzYwqF3fbPfFK/Davc9QGqpEieUmYtlBlVA7ceaUIsV4j8yGYXoZQzLa8rF8yD3UpMakCUD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFVtvqwn3sOLzcbTBBJwtWGZN7+R9+lx65eUt11k1Jo=;
 b=BlO0abLzVoYZsFP2k+mPUvhj7vKAEOfX6rTSi7tBETk/9nIMhozs6NTDrUn0KYozJC6EmZm1k4dIWxrCSIaaHuG+/zYxqM0rkgoaGXnFWNcuvJpV1M1ebNOPbjrZei4LxpAlHcQKrWkg7ifSxkABN1PEUs/b6tEsUvDvFOYheHKE9iVCf5sjbzbEZ+4+n3gtg+IjzacWQT99lNv3BQufSji0MtSC4tLaJJFkY4e3CuvcYr2Ki104E6nKcaOON6K7viOlI2wERApAuyZosRaJJ+MNmpzlpFGC/mII7QWlOLzwJzPUS7QlxCs+amNEBve0RqHQOKNbc19BbRzhtcG+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFVtvqwn3sOLzcbTBBJwtWGZN7+R9+lx65eUt11k1Jo=;
 b=qCk+keFEgXiHbFvSp9ln6gyO+wx90SVeAdIQSaVb2bELuKX/S/1QFiJOf184BFPufPXkdnWaWahOizQ5ZNfXoTUL4XFJw4f1c7yIgUJCyN4/OmAuVRY/m8+oB35SoMtgXSu7Mt3XDBGJEH8LZQS+tmKYiiLU/Lp0MNk80Nun7K8=
Received: from OS7PR01CA0170.jpnprd01.prod.outlook.com (2603:1096:604:24c::15)
 by OS9PR01MB15830.jpnprd01.prod.outlook.com (2603:1096:604:3ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:45:34 +0000
Received: from OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:24c:cafe::2d) by OS7PR01CA0170.outlook.office365.com
 (2603:1096:604:24c::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:45:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D216.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:45:34 +0000
Received: from laptop.adwin.renesas.com (GBR-5CG34119KX.adwin.renesas.com [10.226.37.103])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 6A3D13000279;
	Mon, 21 Sep 2026 22:45:30 +0900 (JST)
From: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 8/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC main board support
Date: Mon, 21 Sep 2026 13:44:28 +0000
Message-ID: <20260921134432.50338-9-ayman.chaudhry.kc@renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D216:EE_|OS9PR01MB15830:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 72cfe7f1-38a4-4db9-122b-08df17e69c50
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|22082099003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	5faUcBzP2NCpRn9VjwiYqaEYYOzbFzpk30XXw5aGnGHBQEXSZMrYG4+bckegU4FFYb3ODtgaobgRbBsRYbL73gYi5q1iRce2azOn06v+rkDYHnHE+bEPeDfrFgGCqzyC/MA8bkKCv9s0LjJHiXsWhzxPTJenhrEdsbI4O0+8H6IvzUVssfPlMSkfY2Mh0N3B89X7tQN/70gpG08vT81JL6DYp+2qgnPywczRQoZlkXT+Tap1nBh9YX+7OBRA8Hej4rs9qoASCnbNkXkNoceA6k3Mlc7VRQRs81C3xZfpU4RjRxxkpYaKXAOPFqzp15qVYSSwvFsRJ+clihjOKKhtpqxkgsQzbea9faP2THyl4nXerijrNBzw1OOsdEV5VYir73vPWG0aGZgx5fI4PqclSU3K/7boDprhq0CbHVTvu1R3H8uMOjSCgEjG68j+UefKMXYA79nhih6mHe1crTBet9v9nbqyLPjMtQf14HYl9VcYR4E6n87NAOD+bqpnncqHobs28VZ3SuEaFCDGjJkLgbxgnUAFjrAQvmGBiJQ7kJBfVmnJGh+G0yhvjQca288R6xfUx7i4pFpazluPYL8kL0MjYOdfwUzZ5MLpB3hMsCIo+J1Z+chb4O6ZBcRC3xiqryXKdesDC8twQfp78gc/fY8QDjnqrMnqeMUPcrpkYcky6B+LGisWL5y1jqI0jbix+jOq3+aAF5QVCAAtTDfiQw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xOBmofB94ULI6AMv4PqU772OeDGSr8K9hsmHZxIdHQZlequjZFBowxOOwbK82xZrLNYybOPFdHJO6zaYbFRsswSzfI0rG6gKAfsAE+0RUeE3fqkTfTm2SUF6AZSWGF1MKqgvBDISL3+Op2hNqv0Bx+d9x1uo8JJlcn+2txjGh6uG9UiX+ziPN0MVIimk/tnRwDnFGUzYojx84+oiWwbMb+fchBEfol7lo0CAb0r7WlnVdJBbHafXHTG77fhpLqADRaCkN8P1Mspy7n4b53XgCjEYOcpNEZLtSPD769UUVY2WzM8Qaq9Fej8LPD3lKsYHiV8/UncnlhimrU/YI5rF6NNNHzuwe0QEyy9C40RKgZ2WlCPpn9HTxMqdyVVMiJEPKXomlkkHIBpv0wh3GQbpdefmi5TxF9NvkiBFWMeA7+fPtDuD71NRgFl1uKuUZrBY
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:45:34.1672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cfe7f1-38a4-4db9-122b-08df17e69c50
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D216.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15830

Add support for the HiHope RZ/G2M v3.0 (a.k.a. R8A774A3) SoC main
board.

The RZ/G2M v3.0 SoC main board is similar to the RZ/G2M v1.3 SoC main
board, so there are already DTSI files available in the kernel. These
DTSI files will be included once additional support (e.g. I2C, GPIO
and sound) is added for the RZ/G2M v3.0 SoC.

Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
---
v1->v2:
- Dropped bootargs from chosen.
- Updated licensing to "GPL-2.0-only OR BSD-2-Clause"

 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../dts/renesas/r8a774a3-hihope-rzg2m.dts     | 49 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b742baf509a1..9817f3ada6f9 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
 
+dtb-$(CONFIG_ARCH_R8A774A3) += r8a774a3-hihope-rzg2m.dtb
+
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-beacon-rzg2n-kit.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
new file mode 100644
index 000000000000..cd46af2a924a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m.dts
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Device Tree Source for the HiHope RZ/G2M v3.0 SoC main board
+ *
+ *Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a774a3.dtsi"
+
+/ {
+	model = "HopeRun HiHope RZ/G2M v3.0 main board based on r8a774a3";
+	compatible = "hoperun,hihope-rzg2m", "renesas,r8a774a3";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* First 128MiB is reserved for secure area */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x80000000>;
+	};
+
+	aliases {
+		serial0 = &scif2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&scif2 {
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
-- 
2.34.1

