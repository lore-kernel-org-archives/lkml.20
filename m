Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023135.outbound.protection.outlook.com [40.107.44.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AB237F337;
	Tue, 22 Sep 2026 03:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790048107; cv=fail; b=TG8h0zhWi1hquLuIi+EaVILCGH/6jb4roaS1QqptM1jEYnX1aYF2CuehDddEM8xB2PjJOVonHoPeO4WsdPgsEFqGBn8SZC3KhOQ7DGMIYONbI9j1l0R13Z8aAwLumfNZZXWEH0mw98uhG2DfttZSHJ+V3ceZY9I79uWVt2NUjYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790048107; c=relaxed/simple;
	bh=pzwV7Rhi18YzPW0ZX3P8rBVNDYR3FSnysMgQ27SNFow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FEvkMAbH1WtZn6AZsW/OqRcWsiOvNb/QGKfNh9mkawuGaSO3YwInnFx/Pd5nXCRWG8aWPt+1rxBOZOTMJXI2Zk+fojLF9fxKK/QNed/DLpuu+NAzCX3C0kW9M3F6hnABI91lLoiW+/QSKy5a5/muIIcG8isTcck32BwL3LKglJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NtmNHhPANa0LMzgRrbrTFxD6lYNOdGxB4y4Uslpmw8TaGrrwW9qnMwmVdVo14CcqEu4MVLkuA0OfsaKkknp8FLSwtkx2YhBUGK39QukRKABoYUBUk/7M6O7qqbWYW1GUgaxSPtNLIQnV2wh02FB6Rl1+KBidywvHE3EJOkiG+45l/U5MevF8gZzMwfmIukUXf1VhZeIQjghbBFIJJKt7rMnrxgd9mxnyGUrcWscJeHcOK0Zueo7q37DyWoyiKyzid5ZjtR8tR9G8EyYNh7XIDR8PsNjfUAHTcTN4d3mBt0REedvV25JkfngCyJidSWfufwPctZJ5LxmSODlKAG93TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NpbqVr5HyIk2SCyabfYXcZ+TYBkN2qY6yuK+RIjHt/o=;
 b=NyUCREbnuwiqPtd8QNMkFW3wXnc3YSXeT+QFj0qopK/zwIKYgIbmzHAj9dcvyAWtQXuaisinr2+SxyzmWUjFNp5uKEBfhAUSXFLD4JJ2eBoKDwGNZSP8nl2ZeGv+VZDyRqOt1mlQ1RVAItvlU6SCiDzm0LjLbGF40CLes9zYGl2R57tw1lL0cbddo+bZMoXj+7tfEuzu7c4my0jX9t6EBJtzb67JC1A4bmyeJIcaMJmmHH4XEzd/mBsNfNkvfPXprPlq+Ibz/QJHXFyOoerBtmgVX/NWW8sknKMJBDS2NnTYzuuCgla9nTpQRGr0Pfbl72sdc6twkbdmB0zujoNN7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) by SEZPR06MB5558.apcprd06.prod.outlook.com
 (2603:1096:101:cc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 03:34:52 +0000
Received: from SG1PEPF000082E8.apcprd02.prod.outlook.com
 (2603:1096:4:192:cafe::99) by SI2PR01CA0025.outlook.office365.com
 (2603:1096:4:192::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Tue,
 22 Sep 2026 03:34:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E8.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 03:34:50 +0000
Received: from jfliu-System-Product-Name (unknown [172.20.64.65])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id D4FF8427F202;
	Tue, 22 Sep 2026 11:34:48 +0800 (CST)
From: Jianfeng Liu <Jianfeng.Liu@cixtech.com>
To: cix-kernel-upstream@cixtech.com
Cc: Jianfeng Liu <Jianfeng.Liu@cixtech.com>,
	"Fugang.duan" <fugang.duan@cixtech.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Gary Yang <gary.yang@cixtech.com>,
	Hans Zhang <hans.zhang@cixtech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Peter Chen <peter.chen@cixtech.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: cix: sky1: fix RCSU strap/status reg of pcie_x2_rc node
Date: Tue, 22 Sep 2026 11:34:28 +0800
Message-ID: <20260922033448.1094694-1-Jianfeng.Liu@cixtech.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E8:EE_|SEZPR06MB5558:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0f9bd60b-8546-4ed0-06c2-08df185a753e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	nlszQRPnuojlXLfyRmay4O+I8okyLIe0um2T4NEvrkBMsQVoV1DSqbNOXpVLT9SOC2QK6jcsvWDh6kCrYF2No4ajJhNiSTJr6o5RX3MEI8cSViK9yX+52YNu0qLiP2bW6oBVWBRmoM9OX6aJ35GoBehdjrBucz8rkcLc/LHAWTbK6bRj4G0iO4rV9K6BUGkfq8LtnBAMwS+nAgwZLKAx/jAooKS/TMRMfRZL/hMCmHjpIGG79+x1onwx1kBYUQQJ0rDLwD/aj6LZeJ3MmTvRsh0zQSHTXXdiqDMNm9ZlO6ambtWgvjfZwD2xNsi79eUvNQESRSpkMxj1b5wENE9PgZ73G45mt+nK8ue+xeg2m9N3IHkxjSG7qdRkubtq0OWL3SKJ0TijFFmc1nqOFR9BXW85B4MIITUEisglCxnw/0aYRx7xB1/nJqA34+KiD+yu908nmGVCOklN5VFaNZPYWtvH/4ELblxZvcTz0fLpR7Ivm0ZWyYCOksrAxtosE6EPIYI9cbymgyeV28mG3ZQEbZ8t97f7oH4tdX7C9D7nRG1V44xhXx7EE/sUqwFDiluWrQCzaM9/I+n3JqUEewZ+bzByEYcxuBjMVg3FffPRaN9XvrNIZMF5JhP8d1qB+CxJVf0BBBqsE+WcKMggTyVyZqv/oAXbJZcEmANKLe7iWqpHve8hUkgMJ8KMeyzfQJTQzYZv1mXxYdRyDMIVwj7/ng==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dfoyqmlLjY0X1zhQ9NYqVHrldc9MWKlGNPDmPXhrnI5hANk8xWaRY5izzF5+rz0l2pHeNEczcgeWE0hfBkFZmdYNDlZ4GJvNisQqzjJH4E56V+wByTaW9wfwV3DWtrJQFqNadrZo+Uy0lsZgHYRI7MqTVxsdzVe9aHwCVhtgWY3/bRj8IySDJ7rDZCgVvdr6KuQekjCefCGa41dG1zqOEJ0CHQzqRf/5JdbBMwKXlF9C/HLXJqh1BiJ/TBIG2peE51nkYcs0PYU5VdVoWwXqevtNSW2RrJhclyhrxmf0/Opa4guQknKVOWhtNVCAivfai2a/o0ZRVyOAc/AuinVrYjImoPcuVVrxlsaTu7JTHCyDcJmqi6d7JMWT+Lpv5MXFvd6hFbGXXCEy1MGhwzAQdknh0+D1w3+DRQDRolm1ssObNJcSb4blD3bwidj5Z12Q
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 03:34:50.0842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9bd60b-8546-4ed0-06c2-08df185a753e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E8.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5558

The "rcsu_strap" and "rcsu_status" reg entries of the pcie_x2_rc node
contain a spurious "0", yielding 9-digit addresses 0x0a0600340 and
0x0a0600440 instead of 0x0a060340 and 0x0a060440.

The other Sky1 PCIe controllers use a 0x20 stride within the 0x0a060000
RCSU block:

	pcie_x8_rc:   0x0a060300 / 0x0a060400
	pcie_x2_rc:   0x0a060340 / 0x0a060440  (fixed)
	pcie_x1_0_rc: 0x0a060360 / 0x0a060460
	pcie_x1_1_rc: 0x0a060380 / 0x0a060480

With the typo the driver reads the strap/status registers 0x1000 bytes
off, landing in the neighbouring controller's RCSU bank. Fix the
addresses so the correct registers are accessed.

Fixes: 0b014cd8f15e ("arm64: dts: cix: Add PCIe Root Complex on sky1")
Signed-off-by: Jianfeng Liu <Jianfeng.Liu@cixtech.com>
Reviewed-by: Fugang.duan <fugang.duan@cixtech.com>
---

 arch/arm64/boot/dts/cix/sky1.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
index 0a820f45feb9..d64cd935970e 100644
--- a/arch/arm64/boot/dts/cix/sky1.dtsi
+++ b/arch/arm64/boot/dts/cix/sky1.dtsi
@@ -661,8 +661,8 @@ pcie_x2_rc: pcie@a0c0000 {
 			compatible = "cix,sky1-pcie-host";
 			reg = <0x00 0x0a0c0000 0x00 0x10000>,
 			      <0x00 0x26000000 0x00 0x3000000>,
-			      <0x00 0x0a0600340 0x00 0x20>,
-			      <0x00 0x0a0600440 0x00 0x20>,
+			      <0x00 0x0a060340 0x00 0x20>,
+			      <0x00 0x0a060440 0x00 0x20>,
 			      <0x00 0x40000000 0x00 0x00100000>;
 			reg-names = "reg", "cfg", "rcsu_strap", "rcsu_status", "msg";
 			ranges = <0x01000000 0x0 0x40100000 0x0 0x40100000 0x0 0x00100000>,
---
base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
branch: fix-mainline-pcie-x2

-- 
2.55.0

