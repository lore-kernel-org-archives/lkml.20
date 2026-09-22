Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015F6576EB2;
	Tue, 22 Sep 2026 16:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096281; cv=fail; b=MPyGSHZps3Easo4oeFXp6kbrT/hS+gRgxHTIBIq/D46+ylZk5GflQbYUPRKO7P/G3QlLj3+JaPrNcIl8OShNoqsIohYryb6hrxjGKmyNnLrtEYnEQNTu2tXk7A0D+CuQvqEtoqX1k/L1PmXetJHBvPvF5v0/Y7Rmy1LmO/kuohI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096281; c=relaxed/simple;
	bh=f/JDJEzW6GbEIqswFMKZVlUyY74dqSjbpcSTsBiOeyE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R5C4r/U2ae22poxe4rJPKqg9u7fd2FZyN1CLhj5KoSPVfuOqo6rSQ/GkSu8zyZ4s63ruNU5gFDITTHsCLs8m3thfLBy1qf1W9YW3KoZAB4gcuvi4VADIOh2WOhdp6bS6sr+w4Sabg5t1D68dpUF3hkxP8gVYGhUawKpwsIyuvrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=dyv8oR30; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rT6k/lj8; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="dyv8oR30";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rT6k/lj8"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MEjwwB2617396;
	Tue, 22 Sep 2026 11:57:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=dM8bHTDDGXf/S
	rCKnbpT5Kfh19nDU5UEcBbcWm4+Kr8=; b=dyv8oR30sqmSmEOrs1iTePz4Gtf2+
	/cHDzCdEJYInKXqjSK/oCx4Jg06afLn0KyasmjbZfdLG/5iPACHS5hIzT0EtFT2X
	++Jk1WM5utZ6L5xeAMALLx+mjH2JR98fJqDRUjAn84HrF6pxaVFfcmrBeU+ojmAj
	hjW6RET7j5KiSkZPMNk1/tcurGers9m0xgsVntgEbJrRX/VKFSp6NjCfEIfDzqia
	mvbIOkz8syxZIuRtUCLfZc3MLLaBWkFAwLfwN1aSiiGJDFFUGO38vYMuHdrL/4FC
	/2UBeW9PwI0uO/OMHOMCZu7PlQMCtl5vxsQDGBhYR54PZUKOJOFOP+FxQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011011.outbound.protection.outlook.com [40.93.194.11])
	by m0380145.ppops.net (PPS) with ESMTPS id 4guf4x5a32-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 11:57:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkwAu9Uu8r1iVhQQ9DgZ/UTw0NykRjaj6T3SZx6alMfL9PEfwD0vc/E/ec/bYAwqf5RCe/Tvpkx/EooBdKTbI2BLeXaQyge/MPazDQy6eLQX1nUlT0LETHvkwFLwJLjAFXmZxStOBT27qYotsNMI4+ZcIFqLIqzyt3APbYwhsabOufeqxuxQ0g7NZfP5RX36G2hgK3dxvDOulnCiivmF2Fh+twflkrrz3e93M+B6kAeTUtoQIvtM/OncblXXLMzcett/qj2wnu/vqGcTisGkhaMxpdYy4ZRlgEOeW3axyyO8Koy63PAbnofErrNTGar++dJkn3m9TclC0pK3+xegiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dM8bHTDDGXf/SrCKnbpT5Kfh19nDU5UEcBbcWm4+Kr8=;
 b=OC+lo6zwJECRd3S0vc2X/2lTypAK3y3tG9j/e88ZIkwS20MHjj331OBhNbB3fRvZ6IgM89pXIwu42aR0ysy2GpWeqPCkWvgCNhXhIYzhR0aaftKK8hMOgybkgqTJhpFcWpdh3wHXFbVx+13vwYf3FrmsUbU90PY8vxy/2J036MaJFj7YrSVOWXzZwXi4h9jRugNV0ssYpBUK67WxKlO6rjnsnjbPOMUP9iZnDjaeHoFqRJ/DqUFKocQOVph7VD/WjuIZ+xxXtcGXyQSqWJgvS8StoA3lvC78RlV60DkhMlHwdwMaN0RrZohEGwvgLpn8NQRBlQhv1pRcrhPez8nbcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dM8bHTDDGXf/SrCKnbpT5Kfh19nDU5UEcBbcWm4+Kr8=;
 b=rT6k/lj8BfkjKUw9TQeLQMCtnRp79M5eUigKf0j1BZeqJXC4bZACoo3exnRQnryvohpc1ROxOubyTqHDbS9dz0aPbAX9PdvH1MRyUa+xyF35fWQ2JzHbeuKo1cq7fbqwVXHbTK84PDQigyOfY3y4M5P9F5tCdZNJ+mYFWP+/Kag=
Received: from BN0PR04CA0116.namprd04.prod.outlook.com (2603:10b6:408:ec::31)
 by CO6PR10MB5571.namprd10.prod.outlook.com (2603:10b6:303:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.9; Tue, 22 Sep
 2026 16:57:44 +0000
Received: from BN5PEPF00046987.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::19) by BN0PR04CA0116.outlook.office365.com
 (2603:10b6:408:ec::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 16:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN5PEPF00046987.mail.protection.outlook.com (10.167.245.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 16:57:42 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:57:15 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 11:57:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 11:57:14 -0500
Received: from hpz2.dhcp.ti.com (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MGvENS365511;
	Tue, 22 Sep 2026 11:57:14 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>
Subject: [PATCH v2] arm64: dts: ti: Add k3-am62p-wakeup.dtsi for AM62PX efuse GP_SW1
Date: Tue, 22 Sep 2026 11:57:14 -0500
Message-ID: <20260922165714.425576-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF00046987:EE_|CO6PR10MB5571:EE_
X-MS-Office365-Filtering-Correlation-Id: 4536f971-5ce5-436e-dc4c-08df18ca9e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|13003099007|3023799007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	7S/jKw4Ga7qjs3NjhvhTXgVZKPdpdgRZBZqnD0hFRvnkw2GbDWl1CrlC/xrE4Sb0JceG9QbZYn7dkbivTr+vqcsljtHRneVZWMXacy/euoSfY4mNVltGO9xbIehzoN8jTvYp7R+f36ijwY9HFgrX+7PHJw7RsGY1+0RPkD28e5H4kxp6o0Jad7wiGg66zKqIJ5AKiSqpJTYYiT2VF/wfwUMCjEVcUtOSRIC6pQKQS4PL6HMKOpk3hzPXqlDTDKJ8rXRHAcetvb8UsRIzJpWeCqrWUndRSQ/VzKsnVKJZh48j4Jzj96v2FnAQoR0RwRyKK/feIzZ5VAIgrmXsTBgKVHvfW2VpQFQrCYYS/V81+kUltFWOmbGVuRgIs77YvPUi4DL94ppL6hA3nuPv0p79karPvt7Cc/E8U+dDHig5/nFUvRugI20y8+zc2ln3S5Ti5cLssVgwrz7NHuUhGLfblwZoJyBDWJcfvL/IeiXgrJy+uM2Z3vbRd0PrIWiRSn6toNvqpz+d+uedQWZ4rZSUvMFLYz+cJ3oSvRrDwI/4kpNN0D2Uh2QAAjoDFhkel9eZV6LMiCZefHST+Lfqyw40f3v51odlqo9Ayxofjb1Zl7jVjUqmAo6yt5vnxiljs39nxRFy3ObERjzhdxB1hf0q1Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(13003099007)(3023799007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	N8y8UCZDLdU5vO1o92+uMiUIkb6VBJEM+7yPNID/Y+HDv5iojomBr0Y7UlQPbPLFvppr6GU6XRm+Z1Bw7n9MrbWw8UQ6XwxiLh67Bu0QmURDadxMRviCaaY4IrGIZXu6sPNVnFbKk66NOWIem7YX4cm4Xwa62DoLirYCPi+E9Q+kH4k0H5gcAuyHcW6mdUsa+8/U83WAltG7Q7T9YXABuYu+r9cuQrWt1M6+maP7BsHSByB4ejGpKtDkPbd2tvbB57V0EvWo9EjiWDmraOL9Zsy4pD4t3xsJEiSJYjS3nO5hFwckc4XcJ/KVX+dli93Krgybivp9U7LvXEu37GfVURpeR/GT6UCNEXk3JQN2A0Tls6slRvO76nIsGAjRfvzjict6v5GbeEckbh2foq4YG58z2zmPf89y0RXkOLgNsNWzEBzAlW4F7zW9Pp4yXDiG
X-Exchange-RoutingPolicyChecked:
	RD1kfUNodhsnAyuyqGHlyR/+JPsaPgvyFePgCK6U0ReFFutuurr0wvCPWWOjFJWf4mdg4PL5+UdfBc65mOoUSyiw+oIKNGev1k3ptN7uHzVtoHk1HFKgaFNG2lpKuenumnRmbyFWJxPDAbUo1OlqRW8ddoMiBhP4/MCUTveK2OR/jXiYTiH+0PhXq8ZSFAzPhMLFfMGP1la4Pa/OvfDbBEsqWNfNdhCS7m4CZMB9guvrV4zqXsBudY/+be2ScUuQ5xchp5sOxKDjWL9lYD5SGAZdwX331ixiRExg14lcAWfS7FaBcU16AAVFRbm8ctUOdhEDO8LtjTIMgtQhgU4b6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 16:57:42.9027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4536f971-5ce5-436e-dc4c-08df18ca9e6a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN5PEPF00046987.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5571
X-Proofpoint-ORIG-GUID: jlig4bmYL57Y-Cogbd_OPNPGJwqWMHe1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX7tmONBlA8QCZ
 yp+kqSfvP2SFtNWsy66n4A3LemWUweRWcYaN65rpk81u8SGN1j7IX9Hc1zwxxrN2Ln9dm9ZhJ3V
 LtcYu+z+TzcxNye54QwoynMgSMH+CobhVa/wqDEOPNJ9pvGCXuVXfrXOg5A43omcFBXsuZUKFi3
 wl81YDLoX9ap/DHaTnxac7LTXg4XNqrGASK0Awca+UfXOfXihTUHsYbBb+OYU+ebyd0/E4KcWro
 dKrktyupedVoWIGhMdu6ANW3yJ1ZrDbBh74HuXFaCchpHYTcM1NUT6kGIQfxCrMLfyX5MSTuLSg
 P2oRfZ/FpSNT1H3LhzBqNLfGuz41BXWNNM4E/BL2adIdtfvcNihQ4QBt1alwS64zU6iTq8t2m5M
 bTXNYrwqffO0WOdtDxknYA/+fVxcOVeSG/9fQnOIPKSXOgRtF34eWSr4xGbs7IcQdajbDlEwJNp
 bjgOMOvw3Z9JelMHlWA==
X-Proofpoint-GUID: jlig4bmYL57Y-Cogbd_OPNPGJwqWMHe1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI0NiBTYWx0ZWRfX7UvMATjQkbD+
 JFWeGNkZd2SCylGXF7eTFIiGvfORVRd1afqv18MW6DWLkmqDqY5Latt/6FriFn2Yh1DMbJ3CZtA
 IaZ4TZEEmRyuDTq4CAx/1ZPUD0xB8/E=
X-Authority-Analysis: v=2.4 cv=XYYcX455 c=1 sm=1 tr=0 ts=6ab2b38e cx=c_pps
 a=Rayal3q6byrlEF75E5QjMQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=7nNeI8YfNP2BuUZiRsgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220246

Create k3-am62p-wakeup.dtsi which includes AM62P-specific WAKEUP
domain nodes.

In k3-am62p-wakeup.dtsi, add the efuse node for GP_SW1 register at
offset 0x230. GP_SW1 will be used to determine AM62P silicon revision.

Signed-off-by: Judith Mendez <jm@ti.com>
---
This patch adds GP_SW1 efuse node for AM62PX only now that bindings [0]
are in place.

Changes since v1:
- Move gpsw_efuse from k3-am62p-j722s-common-wakeup.dtsi to the new
  k3-am62p-wakeup.dtsi [1] since GP_SW efuse registers are marked
  reserved for J722S.

[0] https://lore.kernel.org/all/178942274041.683176.599438200260103620.b4-ty@kernel.org/
[1] https://lore.kernel.org/all/5d4742fa-e26a-4b49-8eb4-b6291c402334@ti.com/#t

Link to v1:
https://lore.kernel.org/all/20260915001304.3781247-1-jm@ti.com/
---
 arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi | 25 +++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p.dtsi        |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
new file mode 100644
index 0000000000000..c56fb3890c983
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-wakeup.dtsi
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Device Tree file for the AM62P WAKEUP domain peripherals
+ *
+ * Copyright (C) 2026 Texas Instruments Incorporated - https://www.ti.com/
+ */
+
+&wkup_conf {
+	gpsw_efuse: efuse@230 {
+		compatible = "ti,am62p-efuse", "socionext,uniphier-efuse";
+		reg = <0x230 0x10>;
+		#address-cells = <1>;
+		bootph-all;
+		#size-cells = <1>;
+
+		gpsw1: gpsw1@4 {
+			reg = <0x4 0x4>;
+		};
+	};
+};
+
+&chipid {
+	nvmem-cells = <&gpsw1>;
+	nvmem-cell-names = "gpsw1";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 9d6266d6ddb82..058f264ee0646 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -154,3 +154,4 @@ cbass_wakeup: bus@b00000 {
 
 /* Include AM62P specific peripherals */
 #include "k3-am62p-main.dtsi"
+#include "k3-am62p-wakeup.dtsi"
-- 
2.34.1

