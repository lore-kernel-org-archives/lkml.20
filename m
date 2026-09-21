Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011060.outbound.protection.outlook.com [52.101.125.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470284A205B;
	Mon, 21 Sep 2026 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998346; cv=fail; b=plalH9FLKRPJYv8LujLcUOPludqqUQg1Adizh4zgICLqjBmUv8V2NdH8+J8ml0W+WeXyV3/oHdS6uqumrcvWZtLyUTY2Zo5Jzh8aPXywF1RxPgGgbMwl6mTHwGCIJXWmLOCkICOW5tOSELTTnBwbASitso8WutH84cheu5BgfvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998346; c=relaxed/simple;
	bh=Q8AnuxNnUYEfHEd2XUtCsH9GqBNjwJRXjkJL/cVW+YA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Qu9BZN3djykIFNqh5xPJ3V4Yvlayh76A/PZks5T4tUF8PY+fzPa4peg3DJ3Z1UNfWceXVK08wvVx7oO1RrAr5DezM5sGMlawmfLtH9ev0kHOe/lAo3mlxrbUROZrbpeI+lyUtEuvDTYYykUxxnHQxQTLvesWaktRuPc40xbGmsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IW1a33N/; arc=fail smtp.client-ip=52.101.125.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IW1a33N/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8jcRzLT5Shjk5R8pCNQFF6SDtFg5h1yl7sM18C7ipQydwjP7ciYTFvga9Vc4TFfxwLFSVquq5vMUAlJTuyY4SjQohWjCcFp0M6VATeE5kiKEJMoX8ytBi4rmEWCf+oI+ufd2k50DlO8Lv01+cXyPUhoPtMyX3JDqXsIueaxc9D6Wv95Mt1b0F5GFcwmuxx4LBmeZAMut2MeL17XpVIl5DDTbq7kx7S2QDScV2FthtvkrPbLCh8pQwkkz4m3G6zv4i/9rR/tjkdbpENnsaT/JNroGjLg3CleMlhuQOk7KTBXZMPaMMWhxrzQhrxvLFXvhUGaISewNOkC+IEA2E08qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsIUf/RWsFhX0fdGjc2/G459QQ7r9BgEHjrpEZOgJnM=;
 b=AnELFUHqCSSHsIUPV/rRBi3IyyBd1rWxOGUqzN2AUElK53x8H39DKS8Wxio/1t8Kw4+z8V7JgevCntzIKKSuK+pu15+sOBy/75cG2E4e7HzJzdqWzvNnlUSIlkhVTKojtIjBbJaIP+I2qZxj2xvuFzCN1sH9KWsXifETdc/+CPt7GWUj/iE4J1g+wHOt8VtQn2Ykef2CATtrNiVoO9UDrI30u2PrfaXofMpVN7T4taytq7IGxQ5QToPplCiGHG4U8EDQ0+22JtxQT+HNc8qPxusn0Xx6asNKvkF42uIm17rfxqi1s06zGuDATP6x4C2Nf0R4ix84wKO3aKsO77tovQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsIUf/RWsFhX0fdGjc2/G459QQ7r9BgEHjrpEZOgJnM=;
 b=IW1a33N/un4uyEHTV+0ixn2adebeevf3IxYzXWWESHgWvx2lXnqSclkKIvAiZ5ktpr7jZyTeMq4GG24A0YGcI+qom8dd2FPNNyup1r1A8yGZc8PcZ3bgSowJV0g57j4B2IuWzuqNagb6kgl/LIdQrFxDgSiXvGTp7eb+nzYd+oE=
Received: from TYCPR01CA0188.jpnprd01.prod.outlook.com (2603:1096:400:2b0::20)
 by TY4PR01MB14588.jpnprd01.prod.outlook.com (2603:1096:405:238::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 13:45:38 +0000
Received: from TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b0:cafe::ac) by TYCPR01CA0188.outlook.office365.com
 (2603:1096:400:2b0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 13:45:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BADA.mail.protection.outlook.com (10.167.240.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 13:45:38 +0000
Received: from laptop.adwin.renesas.com (GBR-5CG34119KX.adwin.renesas.com [10.226.37.103])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 8C8CD300027E;
	Mon, 21 Sep 2026 22:45:34 +0900 (JST)
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
Subject: [PATCH v2 9/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC sub board support
Date: Mon, 21 Sep 2026 13:44:29 +0000
Message-ID: <20260921134432.50338-10-ayman.chaudhry.kc@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BADA:EE_|TY4PR01MB14588:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d2281467-ae97-456f-6d66-08df17e69ebb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	vpwfMEjlutVJ/+o4xotIf2wEXeCuuI6FrH44q3e8EIILQv73ksvFTIvAH6JU3Lj6a1KIdLCB7uKxBdJugbQDGw0eD9cdolD3M2mgSYFxpei1+Loh1fep3fyxjkMVQDtyAkLVCCKey6LU4AaWbFAsWnhn3ltQJp+iX/IDSAPx5zCg2lXVHLVfh/5o8NcoODJwbLhbc5QkWQWWnDH/T8SbDfTHv5mn6dExk0vxiCvZkve3Ky1SbY+7HZ9tS4yBbXvHAw3z0uOM3aE+UMiPITE0H0z4bzFB1u87+LjQDWx0YiqnuRde7QFw6r/OQCFAnWk6RfU8Ip/GoAhm58ds+nFhRm5YbmRL1lNauOaLU+JGFwjcB0Kf2vLBXKljzHBnLwMrYfK9zJP95d46RV6VV4RjCBfoOICN8K/k/oaGqZy1eWINtWj0iWlp2VV4lylwplpe5u5UN5MZl3X3W+aDyuniL9Wh96qOj6Bv1/Afg+nCJHdaJRdQEw5DmNUdPxTHebXO6yUqedE8Rs0LtIHw3SnQ4EK9PyT2y6d0B7rGJwLGP0wYyCU4OVDOdKQy7lo+Q0DdN2qi4AzgBpeG2To4QKJokViv0PAeRJQu8WSIebppGigP7HTQFg0MiemxSHUc7eEILaz9ZcCie3SoH9e+saFxNCBnOFqMelpJLixJq5uON3bABAlePG+cdi+JU100pZ+9BSJpITAM3ZcOFPIXpUNOEQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PLVThB42gP6zgoYdyhhXXg365PaU8jx+eH2HA92ETTtn3N+AvfJozv5SHfiRCrB/N258z+U6GHbPwH6w7GNOr+L4zTndGkwCwB8PslwDtaK01V5iIbVdjJyLP6gUufjDf93l9MQuNbrGUFLvVr/uGnmiqWQWCvgPwoaPhVW7IAXOiFuI1tB89m7JAhNsrWwd9YFOQWcYeYqAkmf0FFp//bU/bcbhLAhT+cSiUQbUDpcyabR1JtuNV2FtT2m3CvVHAZqaT2YPDz3c+QyLqdN3htdtPr3x5HMf445XiqVK2wVXX/vTyQ0Rwvp/lURRF+IuCSKDywl00z0g3VzlwfDtJeePBXgapythfD61xIoEaK88Zw8Fz5bLqEiIDdYEDL20NKjT+P1DH77X5ZDARTuk1oIORcuxb1jMI9PB6AdOWnkDsKawP6XNxQEkbiL1Bp6g
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 13:45:38.2401
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2281467-ae97-456f-6d66-08df17e69ebb
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BADA.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14588

The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M v3.0
(a.k.a. R8A774A3) SoC main board.

The RZ/G2M v3.0 SoC sub board is similar to the RZ/G2M v1.3 SoC sub
board, so there are already DTSI files available in the kernel. These
DTSI files will be included once additional support (e.g. CAN, PCIe
and ethernet) is added for the RZ/G2M v3.0 SoC.

Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
---
v1->v2:
- Corrected indentation
- Updated licensing to "GPL-2.0-only OR BSD-2-Clause"

 arch/arm64/boot/dts/renesas/Makefile               |  1 +
 .../boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts  | 14 ++++++++++++++
 2 files changed, 15 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 9817f3ada6f9..10a138216221 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
 
 dtb-$(CONFIG_ARCH_R8A774A3) += r8a774a3-hihope-rzg2m.dtb
+dtb-$(CONFIG_ARCH_R8A774A3) += r8a774a3-hihope-rzg2m-ex.dtb
 
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-beacon-rzg2n-kit.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts
new file mode 100644
index 000000000000..d346a4009ec8
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774a3-hihope-rzg2m-ex.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Device Tree Source for the HiHope RZ/G2M v3.0 SoC sub board
+ *
+ * Copyright (C) 2026 Renesas Electronics Corp.
+ */
+
+#include "r8a774a3-hihope-rzg2m.dts"
+
+/ {
+	model = "HopeRun HiHope RZ/G2M v3.0 with sub board";
+	compatible = "hoperun,hihope-rzg2-ex", "hoperun,hihope-rzg2m",
+		     "renesas,r8a774a3";
+};
-- 
2.34.1

