Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793209046;
	b=vh+sRqQSDI+PmN8Gc2PvMntN/CEXbSJxe+yWoIKVcJnFdZX1A0AkySAZFQkL2rNihHlg
	 Prxiv6NtlGSio0lJbjYTq4qm4ygjLxD1abw4u8+6MgXfDan4tBHlPrd7ecOYYfw9z9Qyt
	 v3LNy2qVWut07TygVhcyaai4cxhRRSPg0CCKXu3n+M9DWSsMyHMokN7rXyvc6j/+jkb69
	 u62VYHcZw/bhr1yb3y3pg4rSaa5h611uRPOlRiuhxCrgy1iy6nwLtx9L4Y9cXUapzMfRZ
	 UyHtfj4iXoLHrxoA/Xsn+pc43HbMNk+qBJYTThJaM23SrwkPgqVb10Sq/kjZS4ubdVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793209046;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jQPjyMxE4aI5K2SVIiHC4NJdpOVcO5BrbttscpFRlKw=;
	b=kc49XRKh3rgRdoUcnvA1NXvYSuDj/edpbPvmjkQAi35bmU+XuRyrMw2l9s6kjuIAeQ4u
	 Ew2J9YH6C5xDERw96Uetp3A7xB7y+OYAeVJzMjuS+CzmvPhoSEyXg2esK5KpHRHcR6xnJ
	 UcoFV2UvCz/9CEjdJewaTuT4/DS3TU3MD8ec6qaSb41DuO75GWoDmUKkR8sFTPNoHRxhs
	 KZ02AkyiSrBpjOjgtL2m0vTe+HomlSNiE3ERfQGzCjj0G6l/zkFkSqdpLiCWfBcnlGiHf
	 G7XxBY4oEeOCDbAKua8YVkTAdqC8MHAz05xZmAoa9h6aOQR70iaA9Jcs8xXPyjRoOVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TF0wk2Qa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.209.64
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012064.outbound.protection.outlook.com [40.107.209.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3C160A2604;
	Wed, 28 Oct 2026 17:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA3C160A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TF0wk2Qa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPwwm4Jmw9kTUy7NEb+zxW5Gwx0tGkUp0MPsKzOU23qUMcmWpD+U0hHE9DvUArQp1rGnSjBdqoEgNFHSsZWZciMQPJFQKzB0blaAwjSb9R93THer+071h6sUo6NuBVfY7b1RpqsvJzideSr5fJCS+jtavBqeGd855XWcKWrfDsVWihPgaUSIn3KRZGkawEdDU84q70qlc76xPYlPqRq3FPch+I0WtbC9G1QkoJQCd0rkn+onNv8/PWWhAGZyeKzfkgp81MeIkODxeG2LoEVi3H3E1Rf3v3N6DdM5R1PO/WKeOknkuPcHDi+C625CGi0vTiUFVq6YrpU3ROCRR7qhgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQPjyMxE4aI5K2SVIiHC4NJdpOVcO5BrbttscpFRlKw=;
 b=rmZ9yo8LpzqznksCB0kMA9+w9Xx27azmKkAPMp40zohwRP5y9daPoNgnAmLhCWngKTaWmbucCeDW6ypGtxgTz8Ien2L9vUqu8pQWDkgeIaMAsi6boDfMh9XXE1scJsyXYEtciYCQtlLm8mJL2BBX3uGRJQye9gkid/fJRdN/oZWVhMPPJ9+8bKWrzRpnuSXARtkV1ncEuMQ4i5BPFETMUKzPGap8HauZhLBdEd3lJ9gXcjz506ksgnBFtBVjcKZGSukZHDDH+ldLFby5Ch5y2fq1gBxh38ogw8NL+PKQi/9S7gptHy++5rcnIdXunHBptBBQcQq0XVqvMeNp0mMQsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQPjyMxE4aI5K2SVIiHC4NJdpOVcO5BrbttscpFRlKw=;
 b=TF0wk2Qaa3MWRytYZfdRUbT7t616HFobuxllcaYSLGzNLwE2XTf6pslWzqxgrVmzQjpyFkKlXuP3JgpPBwwdANGhqWnYrIBt2XiANTi8pK3GgSQ+gC20QAk96YFlzkj12stdR0HvEmPZ0b5Dt0zjbMuSzifnGdmC66WWKmfabJzuSjMwEiN0SQDx/nkr20AByWyiOw4mf00l7s+9vNm3vlB0nAqf9EpP7SrLFDhRABK7lquNAwiSbj5JrBf221QcohiQYvTgt8oW1TujhyTNdfop4P0DLr778diDWQeb7TiL3lIOqiE8sLW5T6+/nIn/VVYbZnJQrX1VV/s/QITWYw==
Received: from DS7PR03CA0036.namprd03.prod.outlook.com (2603:10b6:5:3b5::11)
 by DS0PR12MB7873.namprd12.prod.outlook.com (2603:10b6:8:142::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 17:37:13 +0000
Received: from SN1PEPF000397AE.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::ae) by DS7PR03CA0036.outlook.office365.com
 (2603:10b6:5:3b5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 17:37:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000397AE.mail.protection.outlook.com (10.167.248.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 17:37:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:48 -0700
Received: from nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 10:36:46 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
Subject: [PATCH v2 5/8] ARM: dts: aspeed: asus: Declare SPI NOR flashes on boards
Date: Thu, 29 Oct 2026 02:36:12 +0900
Message-ID: <70e9eaea437a1b1f79de020d443dc4629b18a1b1.1793179064.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793179064.git.jackyhuang@nvidia.com>
References: <cover.1793179064.git.jackyhuang@nvidia.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AE:EE_|DS0PR12MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cf36abe-ceba-44b8-59cd-08df351a19ad
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|36860700016|82310400026|11063799006|56012099006|261009223027099003|261026121527099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 9t8XNkc6KbtlWIAmaKoBF9aiGSQtwsSjbWD9ty+V5VUcn8AXNh9VW3gJgw+/edxCRTBgNAF99mhybbtmaHWD/IkXMmc8j0hRuRw87y2m/NxMK4f0rkYSh/qlEG7w2K3WiCz4Iknn/qxhVeS8Hlq7glKMQqntCdRIksgwqrlzjto/4RdctN5xH4AbMp+KXKmxVD9oz3Iv9YxqtjnHxtLrxCTAIQBtM3LRbVtByKFMv+UfY16JdlW7wgEmSzIOLJL/OUv+JBmuajwIukRMCOmnoalTxTD56fFL6wvoQQORD0CaIYHpfOoP+hFOVpTVmijMK5ZbRGT0tzuhi7EBsZouaHjz+jlZIWGroR26Ze8KaZzpIyxsU2dmfP/govxZGnW/Z7M6tgvv979ocb1dynIPTVGIlvGodmg1tDGyHkPpUfYX5s6xto2pPGwf/nI5mithwHafERgPialwb5CDAx7cnqMAu9909F/CVW8cfW0YVtQsiqcnD7Wg+87BkQmPO+LIbS2Jq5yfdTPe0OjpU6xU3d+8+nMnqNw4l24DpKEl7kBIwIlMSjVkfr1svLx1fzho8ILPxiDH7rob1BXBDyGFZ5M2XaweQnBS232JFhuZmA4jT7boJ4KVjK5i9qf5pKJ2e3AVaQc8gUKcaft7VxbkBHPdTxruK4v9oiUYea4LaO7zWh62TPeQI3/+EXD548NaZ7V09SWrMrcGQ9clJU+94Q==
X-Forefront-Antispam-Report:
 CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 XdLi4hbeSF7FAq8Vjr+viJLlWZGJG637tkJ3mwiiHROO9yKs90dyuVRC9Tjgtni4Sz5F/inf1IGfX7XOOew0myHPoJH7OzKl6bnokBM5co4br4L96myLPppGkTVLmyV0jrORjbNQlgocYyP10Vzx8RUjnZVVS48LmgdYp19qLX5/jfWtZhSmDlerS3WFtQToiPTPzFqB6CSGo6pN9E1VugVsEHCA1iBHwAHGL2FPn/6JEcAEOZOxvavmZDveciKSGzxBVlVE+o0Vg/2ZGkpLC4EeUOLwSRhx+stKyZTCV1ovYG8ZcPpmU8FtndUEtkdzw+/2SVxg45wpfzn1auetGEIKv06hzbaqJma/wy4D4gr33HGJjsrmwAr9EF6zVWIRX39hSMTZzvsffP7chilSrmU2nTgyYUhiEa5HS+mHsmjqsoHEcDzdblNvrChKv3bi
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:37:12.4703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf36abe-ceba-44b8-59cd-08df351a19ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000397AE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7873

Declare jedec,spi-nor flash nodes with the properties previously
inherited from aspeed-g6.dtsi stubs. Keep status = "okay" so these
boards stay enabled while the SoC stubs still exist.

Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
 .../boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts  | 3 +++
 arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts           | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
index e0f7d92ef..8e45e3928 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-kommando-ipmi-card.dts
@@ -60,10 +60,13 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
 };
diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
index 64f4ed07c..e024391a0 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dts
@@ -120,10 +120,13 @@ &fmc {
 	status = "okay";
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		m25p,fast-read;
 		label = "bmc";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 #include "openbmc-flash-layout-64.dtsi"
 	};
 };
@@ -134,9 +137,12 @@ &spi1 {
 	pinctrl-0 = <&pinctrl_spi1_default>;
 
 	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
 		status = "okay";
 		label = "bios";
 		spi-max-frequency = <50000000>;
+		spi-rx-bus-width = <2>;
 	};
 };
 
-- 
2.43.0

