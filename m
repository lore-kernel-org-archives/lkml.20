Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794013820;
	b=Na97VdWPyIwZgx5EQ86se+GnKesowTTXc4wkz/KZsemIh4sTkmn0V0SSGcuu9gqFg+E5
	 xZOXBYyfihxNnLrGs7Fr7+6LI2Su8gLYSXDCI+vSy1Qllb/XoXfTGux5Gz99oCAfzUSZx
	 bhlwLFfZTn24XOcuh1DBd6S8CSM9ith0hHLB8HmZUiTMHYTROWl6kpCNpVPyFX1caQ9tz
	 EALve3vxDfqYhsCXCJ9QpTYoKAyGQi0HQ6veyuIKdmAlT9vEbd/Of9Yniq1+hfXLFM97F
	 JYxy8Q/EFXMt80LG/riEDAN4KiaQU/hqmpx1Dn2/6qheBX91Zgz2U8G915aIQf/PJhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013820;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=sdXFT9W9Wyc62fL8WwLK3bZAHiberLn+3ZtXwWxtjc4=;
	b=yKiWv8COc0stkhcWuwYWEwXCntp4s2prONsLfB2nbONFJjLRnfUQjHg0gKpfQszk+Rqr
	 c7G4f3oVtiNpZvEUZ4vAw0s8wELTMQWcYLB+n/z/jkVtPSZpXz8Wd+6icLa2L8nSqY+c5
	 gl0BOCPz0j7fxFJNTXb08xx1grYe1KnOqEKtkYNaCXTs5pJg45FaelmgHdoeOPRbTeZu4
	 FaAxKdehwHRmTRcjr9FqIoYsx94ZDx1zXBtz5GoroyhJ+i6mtacyqtuHHspbVx1hkNelb
	 c5jidOUxo6TihDsOUo9aJIYzcH/mp8Oo5VZ8yjNNJlYPGTxikPUdlR01Vc3Fk2wrjFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.112
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022112.outbound.protection.outlook.com [52.101.126.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FDC606A326;
	Sat,  7 Nov 2026 01:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3DZ6AicCSXgjEjULNMel3dl3RiwQR+TeVNttBPyMWpWfiGOGCO1UqhBl/8auKg4My7qT/fQAHAnxJieo/dMKtuCc/egjs0HCZ8QTKPjXSfPB8Qex+o7IW3LTjZxMzDGoYdbON9GY20vhfbXWRWLVg8JdFVMArq4QepSJGj42f4hTM7439gPBQsHUD4teMSJflYF0AA5V5CZuKLh6uzjHi5+LljTh0PBfnBYL7I3SB1OJ5uRInpQTmxhD2leFdIv+fk7Sb9VRTe+UHvw7eEptjIeJ/f0GpnIDhsK8emuHIHkOLC9GERAnfhhaN0Pauo3PKKfSz0wKUM2+amB88kAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sdXFT9W9Wyc62fL8WwLK3bZAHiberLn+3ZtXwWxtjc4=;
 b=mpZBZVzp2So6mN/f71puE6sL517/OVU0z0Oxe7hCk+XvoEiFkhAr8zVnnyn10neZoN5PYmC504EdtiDEJg8Mtayumja524VoYiTMjhNxgY5z7Iaq6WHCVV1nKSbM8scLa2YsX3dWDACfnMDLC2RQThhEImrCXEZ2iv+PEUqnuZNe7PzIbzdlCRicUiiXicvDPkQaSAVPies+TOILe8fttul9UpD5Ta/QKKXMC9mG6bfkSfcayf4lrNzlH4jDF3UBkbc2JEh7PqWcHScJthstXKyqK2/tGL7PnKQgq5mQs8Z36Q2aAxjI1JlOid2wjmdI2Y6A47+ndJ9SZHu796Bv+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) by SE3PR06MB8642.apcprd06.prod.outlook.com
 (2603:1096:101:334::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.5; Sat, 7 Nov 2026
 01:10:14 +0000
Received: from OSA0EPF000000C8.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::72) by SI2PR01CA0047.outlook.office365.com
 (2603:1096:4:193::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 01:10:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C8.mail.protection.outlook.com (10.167.240.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 01:10:13 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.55])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id E40814102E61;
	Sat,  7 Nov 2026 09:10:12 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	gary.yang@cixtech.com
Subject: [PATCH 0/4] usb: typec: add CIX Type-C PD controller driver
Date: Sat,  7 Nov 2026 09:10:08 +0800
Message-ID: <20261107011012.3655873-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.50.1
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C8:EE_|SE3PR06MB8642:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 56f66ecf-3ca6-4d50-07fd-08df3c6be0cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|10067099003|18002099003|56012099006|261026121527099003|261022105027099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261026140227099003|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	G6EeKiXGxW8ggpaMZeCPdeLBP548wH+/j8aNIPx6eExsuSqgp0H10luVqhQfRDzEYTAGPilFmqnCtCjPLKtXKirj+hNfFr94Nklhoafzode8c/oqqLcT2ojYHwsKDnIym4eHOPz+sCxO55rUW54XPJsZUmFwuPHda7iLcu73QIKwGa1Mv5V2AK1R2oVYAMrBVl1SP20tJY1kKiU44pNJzzZjHvUhrVet6khjnvxJMzVvUXMjsXhfVOXLB8xz8DdPq6VfmrcTlPDETRCgD/vqbEvQJtga1G5JQIURVGCuipSu9CASIeI/QVrVRkjxbAjGvpf97Im20ppp5iftP0uwetHVxQPgZxkBH5OCh1JjwToeV3gp0iwLLiq9ZV6s32siXalfFLn6y5y6Tq8x7bGfsAFHsH5LqevkjBJdKdCCPn7J2wQnKei/4BVtFG7DjHIxbc6CBuCJaiQ2eKlZC0zIlgZ9Yl8RFZeiMdoBb3WypVnzfpcSIGojcXRDtqWM5r92YcDvaqUaf6rpf+41M1FvqgYEsrHkoyOWDZs1PU8CKyuE7diGyylawxlmOhe1cKEQuWtGqgtX7u2KoLdh4ZrCvgqDEqQjDZc8hRmukRev1BB9kyGFSHgrHHC4/NKQ1c2DG44rxnNkGmbRB0PivGQCseAYlOjKAHgcM+xbnurcUJwYqm+Veb95GogeO5Z1dBafjQ9UWqe/Y29HI92ozghJdg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(10067099003)(18002099003)(56012099006)(261026121527099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022075727099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gXjgvXYVqh9frnAy350uhioGpHfHMyqI7afi/HqU47Tnu41sCyZCUbgI5ygKBlEqCcJE1d9/sbRq3UKTvu8aGz4BJZ4G7uJGNbsVe8QTPk2Y2++L2OOGue7L9qb6Hw8SSsWv4JOQdvRiyc9drgtUFZpW5/3DMK8kIgTELexjqVobClOLCf/IkYaMlMa2JgbPvUQqOO3Mz/TsaT9S8zJ7wGluTepyzVbrL9V4YPUhEmtxwGjPUYmIgEp+tBhAz1j7GPvhIpG9mRZ/oaz35YOyIkMp/HuuPRamnyFvIYEhx4HVsLvMQ+5w2vPaDr5rW9R6IILtnS2aQUFSOkgxADIbEuV3MOo8ZF5Se0cQB67ZFrvAztZGfktkzJ3mHr6KYSwGfsbUyRGhaxdrVx02kx94FtofZGmBoTswKfG7RvpKiqclDB5IVRXZl2M9FoiBMuBZ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 01:10:13.8171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f66ecf-3ca6-4d50-07fd-08df3c6be0cc
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE3PR06MB8642

This series adds a Type-C PD controller driver for CIX platforms and
enables it on the Radxa Orion O6.

The first supported controller is the Realtek RTS5453H, a stand-alone
port controller: the CC and USB Power Delivery state machines run in
its firmware and are configured through vendor registers rather than
the TCPC register interface, so it cannot be driven by the tcpm
framework. The driver translates the controller status registers into
Type-C class notifications and drives the platform PHY's orientation
switch and mode mux.

The driver is named after the CIX platform integration rather than the
RTS5453H so that further register-compatible PD controllers can be
supported without renaming it.

Patch 1 adds the devicetree binding, patch 2 adds the driver and its
MAINTAINERS entry, patch 3 fixes the I2C bus #address-cells/#size-cells
on Sky1 so that child devices can be described on the buses, and patch 4
adds the two controllers and the I2C1 pinmux to the Orion O6 board.

Orientation switching and USB/DisplayPort lane muxing are performed
by the platform combo PHY. That PHY driver is not upstream yet, so
the DTS does not link the connector to it in this series; the ports
are still registered and their state is reported through the Type-C
class.

Tested on a Radxa Orion O6 (Sky1): attach/detach, USB-only and DP-only
alt modes, cable orientation detection and HPD reporting all work.

Gary Yang (4):
  dt-bindings: usb: add Realtek RTS5453H Type-C port controller
  usb: typec: add CIX Type-C PD controller driver
  arm64: dts: cix: fix I2C bus address and size cells on Sky1
  arm64: dts: cix: add RTS5453 PD controllers to Orion O6

 .../bindings/usb/realtek,rts5453h.yaml        | 126 +++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/cix/sky1-orion-o6.dts     |  51 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  16 +
 drivers/usb/typec/Kconfig                     |  11 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/cix_pd.c                    | 777 ++++++++++++++++++
 7 files changed, 989 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/realtek,rts5453h.yaml
 create mode 100644 drivers/usb/typec/cix_pd.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.50.1

