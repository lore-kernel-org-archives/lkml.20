Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706540;
	b=SdeCnpeBpS9dhnxwmqkkEkCPLK8XOn1VgckLwekCimxe195cx6PJAvnxdSSnXzxEZAFt
	 2lX37EPMS4Bn1+YbOVJVFOSFiz8MblphKi47tuVfZQIj9z8lgonFBYxDzPc2Dc2LDBwh+
	 QVjzC966GTut7kd5UldYMetQ3NhV0+cIW7p+QjCOqUxe+gtiGA16rYTeY32G9jU74FyBn
	 FyzEvdnXwVI9GxNEMgQmOA6EqcOhp05X1XhAZcaLEnq/EZxKTaWtYkLydueov6Fw37XdU
	 YIty9DWsk+w7p4ukAFW7mi61KKzOgu5nXURwFvuiOBHq5TmSAsBjl12l/w1A6ZV/78Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706540;
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
	bh=q3MLGlASNURJinrGMbeueE2BwD1HdPJmSDG1uQeT7x8=;
	b=sUIlmTrk29cNqGJRNcBgxUGu9dfFbHBqmkHsjLDvG1nwXLNPg4lKVaggRrJIf37zr2Rc
	 tu75sD2ZnJV67mKlhh54h7SOMuR8P+WJuLJVVc/SF11kkjs3rX97DCXjPkaRhbnyDzwU6
	 qB2+5H20XVcFXKj5o1WUm4kIUSuovkoC/5ZPs8gm4iha+IiKI4EGlmYpvhNDnCGFeX4Ce
	 PSTax5hFTB4uaApUmUiTHT6okjmYxefJBgql6Q9GuTtoU4b0S/0ABYcFGTGyCus+P4Osa
	 /UDcB8dRmgQuOUwrccnL+mv74Jle7hHQyBkvZuJ4SV4bx1Hsin8hoqZ4/hca9ev/H9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YRtHXdjp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.59
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DFF606A329;
	Tue,  3 Nov 2026 11:48:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DFF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=YRtHXdjp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qJBAhPEdsrxUgEvb1bXobVJgc5DNiL+uaqSlw7xwXvfBjlgMTjPRf8YIRcB27uIHRLnJcVVtiE3sWJoA7xOP7ovi240km4fbEVZL3O9AFlrIow7rFpVD5EvmCTz/6rn0LuBBXnzxv0Xvs709PKw4AjIqj6MJ6oVaCWlXyDxnH6tcy5i+9haYaUYb3HyqM/wKo/3FWeaFCP2X9H7I4XxIefOLZk5hIbHlsGH8TrXEbsdbbzAn75IElNWk8LFcSoSAQXDYc37ic5Hl60uU3LKGDETWjw54s1da9pYEDzSN2vdD7ZQ0Bx8rHwouXgiuIQwQrjQCt9ECz0J3CChNxuIOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3MLGlASNURJinrGMbeueE2BwD1HdPJmSDG1uQeT7x8=;
 b=iiz52hHVHVZ8sO8Tps7ZeaQVDfDw4sBdYOZ3ekakKHJe8HwWz1njQolL0CrNu2Cc1wg0CEt6ZQYQ79HP7nZXJC+rdE1sZ+1oS1DkMKTlhb7HjIAL3R5zLsVExXI9enpDhcprqMb2XyECqs35dfkM0nxaJAyfU1gUJozVHj0QtrCPjHtCwkzI2iS2iVsUbqXVk4wIPhhYbi2mgEKjigw3OZsb7QombZL2hCqukn+sn7S8C6ls4kh4iIN+0pqd67dTrPf3njJOqRfBjAhQGg0vbmG+fJP2Ot3k1tQsWHp76FV1KEXq4FXebBph6cElfbo5UbdyrWzL/r+Pxubj9EX8tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3MLGlASNURJinrGMbeueE2BwD1HdPJmSDG1uQeT7x8=;
 b=YRtHXdjp7BwBil7Q50ZAqiO6kVpgp1OgQ56+1m5bmTfgpkrE7s0aNZSd2UI62rW/ifJ7DMAFsF0Iec2+SsgeSfkopYUb77BT6rupkbB3hGapo8WkJ1ZwVXNhO9XTtSHZmGFl0Us0Y8x07sxHorImGxyWp6p5s07v5qpW6+MXwh2FEK3S7JbnYPySH2U+Ph/nphU0bqBPsLoFCfFNnOiMfRNy64qBKg1v0Jlzv2ptmJymb98i2V6VtvgEXbDcp/Zf+i4iHybbDb5E5TE4z6BOE6ZQZw8yHwLY2H3/3N8FeNwWfd2cb4bqVjVxQa4ouHls417b7pmw20+NdjxexsV18Q==
Received: from PH0PR07CA0022.namprd07.prod.outlook.com (2603:10b6:510:5::27)
 by MN0PR12MB5715.namprd12.prod.outlook.com (2603:10b6:208:372::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 11:48:53 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:510:5:cafe::8a) by PH0PR07CA0022.outlook.office365.com
 (2603:10b6:510:5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 11:48:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 11:48:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 03:48:37 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 03:48:35 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: Jacky Huang <jackyhuang@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add NVIDIA MGX Vera C2 BMC
Date: Tue, 3 Nov 2026 20:47:52 +0900
Message-ID: <7a3f142b8142b7c067182799d30b33b026e74221.1793705210.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793705210.git.jackyhuang@nvidia.com>
References: <cover.1793705210.git.jackyhuang@nvidia.com>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|MN0PR12MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: bbefca3c-d0cc-41db-72a5-08df39a06ea4
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|82310400026|1800799024|376014|36860700016|23010399003|18002099003|22082099003|56012099006|261102123227099003|10067099003|261009223027099003|261021121427099003|11063799006|261026121527099003;
X-Microsoft-Antispam-Message-Info:
 mu7YEoK49OHKrnLTJ/yW7u7+nrC4RCuQSZBjnkfXX/KeFrOJFMBoHvttAQDoFkiGaHMzaFB6o0tftJPVy+mJ9K5TF/nGXwlq/2TZO3L3Cn3mAkUk7uYB8NFyExJ4ZKKhPNu0oby4eNNv8Jpc4/jM318ekHl/TxAc76kfAmt5cqhK/59gn037mDpwUXeYNGdcS7+hmKWThu35HdlKmnBzpy9skINT3L0TAQMhVvL/fW4PpI7GWATE7O/R6TP8/E8TFiYE/eNQpxaIzBOe3uAPcCnhQSyOEyyjy9gdQo1Y7sAqVREpU14cteSvsM8dG4tpa9dCK0ph7ybfj9kkd/PydO3KsPK2aT5/3dV+Is6OeTQtnaW0roDSwvgF3d1/kD7H2ILfqPFyoh98Ej88VeTST4Y2o7exagygmq1s85uHTjPRIqsMu3jzq6gcvxPPqOd+9rBwvlIosY/3Vv9UtyNXgDyraZEI2cwIYr3j9/xd/sRKD6pv7jW+iH2ITw64C8nYBqL9OefV6krNbJgglSjaQTZb6vVdgkXVC89JpFcgU+tRVI+jpSh4rm+528n6Y7ccxsh1EwC23oyxnVQTXVuG9Pg5Pao8x0SQ95ME/PJmbfYUgpmOgf4NTpOsHVVRRmLOvgE+JYy9Owi8ikIEgrtjoJcRKhD99aoQGyY6IX8Cf6F4RK+f558LySJPtpmo6DVvs57aAi1z63JohbvsXEzqCg==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(56012099006)(261102123227099003)(10067099003)(261009223027099003)(261021121427099003)(11063799006)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 3b+bbEAfZZYkeppPBWVUMmDJuAb8U1meHPJoJ8rqaim0eXA/xFh69hoN32soVskgP3Ho0u4D2WiiZcfwTOcpXJGBlIw0zW5unvwEq9Usu9lKYtauyrbSyxCDOZ7icMT+foKTmRg/1/xN4D7q4urLpWZdzYA9TXLuk8WR3ohbn8nm94wW04YeNhwEVDPg7yaXtWbTzpD17SnPmSRETOKsHLcMGKSX+6BuHZHOKuRGvSDRxVE5kK9qPpsqvCaOehjr5JxB+/Q3N0VDMNJgO8W5r3KUDagqNKdd+ehk0D85iTz0efRCEDKVdQQl6PTmD/V8fhNFY/Uu/vd1w1J+iXluk1q9JlLdY9oO3/DvsOqZ/xD8k/rZSJRQSpXoYUReYEpNJa9/6n+yh4Nw6GmW8rgV9acjSZgI3vBnUFevAOtyhP4/etTOedAvBZOnNiWDBa8d
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 11:48:52.2453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbefca3c-d0cc-41db-72a5-08df39a06ea4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5715

Add the board compatible for the NVIDIA MGX Vera C2 BMC, which is
based on the ASPEED AST2600 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
---
Changes in v2:
- Add Krzysztof Kozlowski's Acked-by.

 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index b7e70868e..92127d7c4 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -115,6 +115,7 @@ properties:
               - jabil,rbp-bmc
               - nvidia,gb200nvl-bmc
               - nvidia,msx4-bmc
+              - nvidia,vr-c2-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
               - ufispace,ncplite-bmc
-- 
2.43.0

