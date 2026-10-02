Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13321499F0D;
	Fri,  2 Oct 2026 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790948646; cv=fail; b=YT5CcABoGnmMvaIQFjug/1Uo2PVR2HIsnwTW+F5+6EE+mJQFgbriWogIbU65oB8zky7QWgC9Tf/R7VQBgsY6gkKXo5hmiPuv6RJcjEHOj1c9q0wsE3AXKw/99uwD6zTRDmCJMra5jaBXWHvaTjhGvyRxy0wHQyi2N6c0KuKGrc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790948646; c=relaxed/simple;
	bh=6/qMDtxbwokBmXcOsei0n6gsomodPiQXqjGUYrLXWsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=IYvCXBDPyTOig9WW6azlMJxSnqTyEVCzqL0sbq3uCnueUHN0dI8Q3Q7npyb+jbWxAJW7+bGJLlQhZrTVb6A7+ewJkiYZ/QlKobyxGvrJrbMai68wC77KY1pD7UQ61aR9yaek2SpZouD6NSBelAwnmsk+99KGxKr74hs1imEvq8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=LazbPZs4; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="LazbPZs4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LdUOn5Tn1ho99mmMZrPNjmMx0f3zJZ2wPvA/LNXMi2CWlE8Y05gYP2UMrdQ4aWgMPKnY5aIP1txd0hNyJbS5cGj7c9S7A7UEiINfTbo7Nlapt9CTaa91xv4b4+yKrDYlbjlbcOjmveOYBr8FO53TlxE40EbsbpwYDKz4BfJRbtAVrvSFLbTPOULs82zFqbw0AobS+AKmFTC/tIQzBCnqTlUZZzdZ/Oon/sCNGdbasAK1ezXDgSeBqMdQS0dc8IvP+kjB9lhJhoV/vKZz7pr4v2qKzmo/a8GbK45n9VvZo23RfEiOqi3beDD09z4HaeO1+jpoaV9Jdif4l0Q1zH1F8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hycESPHhD+6X7WyaYvoi85CWJHJEGRHA5g1m39bWUhI=;
 b=lZnsfGh7mDP7FSjYBIqXGvRPSxhGApW9btnjKBwv/21ykQqB54a6Ud34W2F/Vr6u9X3VmH9i33K0QVvOuFM64CM0dAIt+HMXc9fRNxpZFWb2AWqRq8HRloX8hl3J5GIZb2TUfoL4r33/jwOyrtygFK1AKPkY5auGE8XrAw0x0CF2tpUoBcZ9ypKB7TmAnNDoJJwje2iOtKM/nuOl9QtGG8zmcP1Ms7QQzcxD2dpeHfZ0qeZY2vTphQih9ekVPiPZvOy5bBaRStu+5rsxKMnTMcX5RInOys3GceZd4mYdja733CxmcCWac66p9iLgZJYWdHUr7hlGnehAd8GH8tCHzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=dabbelt.com smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hycESPHhD+6X7WyaYvoi85CWJHJEGRHA5g1m39bWUhI=;
 b=LazbPZs4f4fRsRypFdXRsSRKdyrdcODO7WxkChrnSLfE4m0ELJ3GFzZDClQPT5lKXHE76s6Iq8IkFd3QTWD9XpeQrG0Bdyo9zYeopLnwCsMnegEmGRjQYj25r4OiWjNF2j9chonQo0khUdlRm/4DeUY54mqrwyrm4BwfOgFArYI=
Received: from MM0P280CA0080.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:8::22) by
 GV4PR02MB11441.eurprd02.prod.outlook.com (2603:10a6:150:29e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 13:43:52 +0000
Received: from CPH1EPF0000051D.eurprd04.prod.outlook.com
 (2603:10a6:190:8:cafe::11) by MM0P280CA0080.outlook.office365.com
 (2603:10a6:190:8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 13:43:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 CPH1EPF0000051D.mail.protection.outlook.com (10.167.241.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 13:43:51 +0000
Received: from se-mail11w.axis.com (10.20.40.11) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 15:43:51 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail11w.axis.com
 (10.20.40.11) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Fri, 2 Oct 2026 15:43:51 +0200
Received: from pc66231-2602.sto.se.axis.com (pc66231-2602.sto.se.axis.com [10.133.4.42])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 1EED42A1F;
	Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
Received: by pc66231-2602.sto.se.axis.com (Postfix, from userid 21940)
	id 0CEF6305CE80; Fri,  2 Oct 2026 15:43:51 +0200 (CEST)
From: Kanak Shilledar <kanak.shilledar@axis.com>
Date: Fri, 2 Oct 2026 15:43:34 +0200
Subject: [PATCH 2/4] riscv: dts: thead: th1520: Cleanup with dt-check-style
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261002-fix-dts-th1520-v1-2-9a8810091d47@axis.com>
References: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
In-Reply-To: <20261002-fix-dts-th1520-v1-0-9a8810091d47@axis.com>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
CC: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kanak Shilledar <kanak.shilledar@axis.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=13553;
 i=kanak.shilledar@axis.com; h=from:subject:message-id;
 bh=6/qMDtxbwokBmXcOsei0n6gsomodPiQXqjGUYrLXWsU=;
 b=owGbwMvMwCV2JPnG7+2HZqUznlZLYsjav1Vs3mKB9LVrD086n3Kl8lfeWf2jJbJ7Vl7kbtp/t
 fFo1ZLZ6ztKWRjEuBhkxRRZzhltj96f/E93jrTTJZg5rEwgQxi4OAVgIp6FjAz7lrKveR82aTLv
 o4niD/yW/67iroptUbr4SWvutQtKZVcmMzI8s3txsI7/jmR/Qm1ggOzjao+mrR/+Zm8uffjx/CK
 G6yv4AQ==
X-Developer-Key: i=kanak.shilledar@axis.com; a=openpgp;
 fpr=CDB0F1C8EAD5B522C7B3A77928221FF065DB55F9
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF0000051D:EE_|GV4PR02MB11441:EE_
X-MS-Office365-Filtering-Correlation-Id: 292a8c95-7a06-4c28-02c5-08df208b3191
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|23010399003|36860700016|1800799024|10067099003|56012099006|11063799006|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	RBnNkStagRuzJ9/KXUfz8dngptp0ctm8YdEiriUOpKpLErGRsPROdZaXmkQRhTsYS4G6vuLaXTPs+u2Vho3fktr9y1fjiSyUzp/Ru8Sn6aX6hqnzTeBxo4HjnGeF/mzmnlkqqW7XOAWO5EmO5neYvBfZaXxwHEweDKrBdHZKdOj009mIXeUXU/pRzswg+wUGIhJDLDtNzJBFpk5Rp/Fhsznm+eCPeG9UkGxBlvBbCLy3BzH6ZZjSpJRyMiH77ABJf8KURGyURFGwwinyL4/OpK0co0tAz7Bj7oVzTfi7oiqRytTJWjot1SV+fyYONCPlT/D7ZHGnnpx0yeXiwVUykDxDSjNPBIEeZTcA2h3GoyFxt35UJ1BHqKueC8qbFoFwonS4vU0cgqL8tlIcCxtxT9ksbEoeaepxlBdffLLtvozuruThiOpFPWTcgaINEWiPwK9dcdE7Z2peVvP9yF0bG1TxDaYltqglSsEFc2xlfvVihIY/cs52UM5Q0/35bkLrK/WuElT4a2E8p8llDqr5KOPPGMtPNmxAjPi9jUSs2D4JDJq/qjDQsPP06oMGxh2u6cSEiRYaAVUK3wQPdaVWXL0GD/b9AUixYwzKptdn+uX1pFwQNKMz2rylRni+iZXeocA+jgd4apZ9yuMhv43Z2naNRcdckIxJCcTMAYJmyFCth2ouMenWBa/zZrYz3UUNIE30bNNpRZ5WWyeuV/FQTBaiCy2NTNbhxVMQucsS1dz6JXbPL9x/w13xy70LaWPb
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZpZob5yWpvog1ZvYMNbd8UfuHUh/6JWRyTDJ8gh0vKG545d63CW6NscVxIWpN3/UX7vh50hgyYzXoQPIEGxZgDPvuNUzg/XhWe4UNaOOa64Scxt+ycvx5dk3Oh2vDuInnAtpzE/IQQRp/fRCBVjrHeUe8d/XiZpdqwUMxQzeEXY8l4jfxeyhfxUvkp1J1A8Be0kZ+lFsqX7y5gsYaAWO6GUAn0qPvDyfgnKn4g4lLGDEPu1dpS24zZ2zgsoQGfAafX7yd2iqjSWc5Ne9mrusW2LzCwHNebLU7YE68TblDyGDt8ULxuBEVakASybiEL2GdfkllmTyFmZt8YyTeXCCxRFpI9KMwn648gwICjQ9AQo8DRoRd/VV9svkq2xlpnzrlMIdzd+qFJwIMaOnNklBArf0ZLmKdAbgGMbdAJoRkMPK9Xd26ruWbmVQptl3ona2
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 13:43:51.3879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 292a8c95-7a06-4c28-02c5-08df208b3191
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CPH1EPF0000051D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR02MB11441

Fix warnings related to "property-order" and "required-blank-lines"
reported from krzk's recent updates to dt-check-style tool. Leave
out reordering of the nodes as it creates a very bit diff. After this
patch only the following warnings remain which can be fixed in future
work:

	thead/th1520.dtsi:221: [child-name-order] child node 'oscillator' out of name order
	thead/th1520.dtsi:227: [child-name-order] child node '32k-oscillator' out of name order
	thead/th1520.dtsi:248: [property-name] property name "snps,wr_osr_lmt" is using discouraged style
	thead/th1520.dtsi:249: [property-name] property name "snps,rd_osr_lmt" is using discouraged style
	thead/th1520.dtsi:253: [child-name-order] child node 'aon' out of name order

Fix these warnings to make the file more readable and maintainable
along with that to make it more compliant with the devicetree
specifications.

Signed-off-by: Kanak Shilledar <kanak.shilledar@axis.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 108 ++++++++++++++++++++++------------
 1 file changed, 69 insertions(+), 39 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index b01a94785d870..aa6572b4af559 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -20,15 +20,8 @@ cpus: cpus {
 		timebase-frequency = <3000000>;
 
 		c910_0: cpu@0 {
-			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "zfh",
-					       "xtheadvector";
-			thead,vlenb = <16>;
+			compatible = "thead,c910", "riscv";
 			reg = <0>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -38,6 +31,13 @@ c910_0: cpu@0 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm", "zfh",
+					       "xtheadvector";
+			thead,vlenb = <16>;
 
 			cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -47,15 +47,8 @@ cpu0_intc: interrupt-controller {
 		};
 
 		c910_1: cpu@1 {
-			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "zfh",
-					       "xtheadvector";
-			thead,vlenb = <16>;
+			compatible = "thead,c910", "riscv";
 			reg = <1>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -65,6 +58,13 @@ c910_1: cpu@1 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm", "zfh",
+					       "xtheadvector";
+			thead,vlenb = <16>;
 
 			cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -74,15 +74,8 @@ cpu1_intc: interrupt-controller {
 		};
 
 		c910_2: cpu@2 {
-			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "zfh",
-					       "xtheadvector";
-			thead,vlenb = <16>;
+			compatible = "thead,c910", "riscv";
 			reg = <2>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -92,6 +85,13 @@ c910_2: cpu@2 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm", "zfh",
+					       "xtheadvector";
+			thead,vlenb = <16>;
 
 			cpu2_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -101,15 +101,8 @@ cpu2_intc: interrupt-controller {
 		};
 
 		c910_3: cpu@3 {
-			compatible = "thead,c910", "riscv";
 			device_type = "cpu";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
-					       "ziccrse", "zicntr", "zicsr",
-					       "zifencei", "zihpm", "zfh",
-					       "xtheadvector";
-			thead,vlenb = <16>;
+			compatible = "thead,c910", "riscv";
 			reg = <3>;
 			i-cache-block-size = <64>;
 			i-cache-size = <65536>;
@@ -119,6 +112,13 @@ c910_3: cpu@3 {
 			d-cache-sets = <512>;
 			next-level-cache = <&l2_cache>;
 			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c",
+					       "ziccrse", "zicntr", "zicsr",
+					       "zifencei", "zihpm", "zfh",
+					       "xtheadvector";
+			thead,vlenb = <16>;
 
 			cpu3_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
@@ -261,11 +261,11 @@ aon: aon {
 
 	soc {
 		compatible = "simple-bus";
+		ranges;
 		interrupt-parent = <&plic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		dma-noncoherent;
-		ranges;
 
 		plic: interrupt-controller@ffd8000000 {
 			compatible = "thead,th1520-plic", "thead,c900-plic";
@@ -302,6 +302,7 @@ spi0: spi@ffe700c000 {
 			clocks = <&clk CLK_SPI>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -313,6 +314,7 @@ uart0: serial@ffe7014000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+
 			status = "disabled";
 		};
 
@@ -330,6 +332,7 @@ gmac1: ethernet@ffe7060000 {
 			snps,multicast-filter-bins = <64>;
 			snps,perfect-filter-entries = <32>;
 			snps,axi-config = <&stmmac_axi_config>;
+
 			status = "disabled";
 
 			mdio1: mdio {
@@ -353,6 +356,7 @@ gmac0: ethernet@ffe7070000 {
 			snps,multicast-filter-bins = <64>;
 			snps,perfect-filter-entries = <32>;
 			snps,axi-config = <&stmmac_axi_config>;
+
 			status = "disabled";
 
 			mdio0: mdio {
@@ -368,6 +372,7 @@ emmc: mmc@ffe7080000 {
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
+
 			status = "disabled";
 		};
 
@@ -377,6 +382,7 @@ sdio0: mmc@ffe7090000 {
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
+
 			status = "disabled";
 		};
 
@@ -386,6 +392,7 @@ sdio1: mmc@ffe70a0000 {
 			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
+
 			status = "disabled";
 		};
 
@@ -397,6 +404,7 @@ uart1: serial@ffe7f00000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+
 			status = "disabled";
 		};
 
@@ -408,6 +416,7 @@ uart3: serial@ffe7f04000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+
 			status = "disabled";
 		};
 
@@ -418,6 +427,7 @@ i2c0: i2c@ffe7f20000 {
 			clocks = <&clk CLK_I2C0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -428,6 +438,7 @@ i2c1: i2c@ffe7f24000 {
 			clocks = <&clk CLK_I2C1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -438,6 +449,7 @@ i2c4: i2c@ffe7f28000 {
 			clocks = <&clk CLK_I2C4>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -451,11 +463,11 @@ gpio@ffe7f34000 {
 
 			gpio2: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
 				gpio-ranges = <&padctrl0_apsys 0 0 32>;
-				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
@@ -472,11 +484,11 @@ gpio@ffe7f38000 {
 
 			gpio3: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <23>;
 				gpio-ranges = <&padctrl0_apsys 0 32 23>;
-				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				interrupts = <59 IRQ_TYPE_LEVEL_HIGH>;
@@ -500,11 +512,11 @@ gpio@ffec005000 {
 
 			gpio0: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <32>;
 				gpio-ranges = <&padctrl1_apsys 0 0 32>;
-				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
@@ -521,11 +533,11 @@ gpio@ffec006000 {
 
 			gpio1: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <31>;
 				gpio-ranges = <&padctrl1_apsys 0 32 31>;
-				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
@@ -546,6 +558,7 @@ i2c2: i2c@ffec00c000 {
 			clocks = <&clk CLK_I2C2>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -557,6 +570,7 @@ uart2: serial@ffec010000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+
 			status = "disabled";
 		};
 
@@ -567,6 +581,7 @@ i2c3: i2c@ffec014000 {
 			clocks = <&clk CLK_I2C3>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -648,6 +663,7 @@ hdmi: hdmi@ffef540000 {
 			resets = <&rst TH1520_RESET_ID_HDMI>,
 				 <&rst TH1520_RESET_ID_HDMI_APB>;
 			reset-names = "main", "apb";
+
 			status = "disabled";
 
 			ports {
@@ -682,6 +698,7 @@ dpu: display@ffef600000 {
 				 <&rst TH1520_RESET_ID_DPU_AXI>,
 				 <&rst TH1520_RESET_ID_DPU_AHB>;
 			reset-names = "core", "axi", "ahb";
+
 			status = "disabled";
 
 			ports {
@@ -714,6 +731,7 @@ dmac0: dma-controller@ffefc00000 {
 			snps,dma-masters = <1>;
 			snps,data-width = <4>;
 			snps,axi-max-burst-len = <16>;
+
 			status = "disabled";
 		};
 
@@ -723,6 +741,7 @@ timer0: timer@ffefc32000 {
 			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+
 			status = "disabled";
 		};
 
@@ -732,6 +751,7 @@ timer1: timer@ffefc32014 {
 			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+
 			status = "disabled";
 		};
 
@@ -741,6 +761,7 @@ timer2: timer@ffefc32028 {
 			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
+
 			status = "disabled";
 		};
 
@@ -750,6 +771,7 @@ timer3: timer@ffefc3203c {
 			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
+
 			status = "disabled";
 		};
 
@@ -761,6 +783,7 @@ uart4: serial@fff7f08000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+
 			status = "disabled";
 		};
 
@@ -772,6 +795,7 @@ uart5: serial@fff7f0c000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+
 			status = "disabled";
 		};
 
@@ -782,6 +806,7 @@ i2c5: i2c@fff7f2c000 {
 			clocks = <&clk CLK_I2C5>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+
 			status = "disabled";
 		};
 
@@ -791,6 +816,7 @@ timer4: timer@ffffc33000 {
 			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+
 			status = "disabled";
 		};
 
@@ -800,6 +826,7 @@ timer5: timer@ffffc33014 {
 			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
+
 			status = "disabled";
 		};
 
@@ -809,6 +836,7 @@ timer6: timer@ffffc33028 {
 			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
+
 			status = "disabled";
 		};
 
@@ -818,6 +846,7 @@ timer7: timer@ffffc3303c {
 			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
+
 			status = "disabled";
 		};
 
@@ -845,11 +874,11 @@ gpio@fffff41000 {
 
 			aogpio: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <16>;
 				gpio-ranges = <&padctrl_aosys 0 9 16>;
-				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				interrupts = <76 IRQ_TYPE_LEVEL_HIGH>;
@@ -860,6 +889,7 @@ rst_ao: reset-controller@fffff44000 {
 			compatible = "thead,th1520-reset-ao";
 			reg = <0xff 0xfff44000 0x0 0x2000>;
 			#reset-cells = <1>;
+
 			status = "reserved";
 		};
 
@@ -893,11 +923,11 @@ gpio@fffff52000 {
 
 			gpio4: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
 				gpio-controller;
 				#gpio-cells = <2>;
 				ngpios = <23>;
 				gpio-ranges = <&padctrl_aosys 0 25 22>, <&padctrl_aosys 22 7 1>;
-				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
 				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.43.0

