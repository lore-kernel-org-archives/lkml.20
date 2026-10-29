Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793249954;
	b=AT7clD/tgKPgK+jxyOuR7jAZHU65/eZAzT4QRe2YH6IvTEvk3cyGfKPxseREzKBxEJ5g
	 bDCjw2FiZRiqPKOROMg/Sa6lLIr0nZob57Xa3NoF5VrwWurAuLKk9lb8vGKqnkHCeD/0M
	 zzlOnME7BNEHmVaqmlk7mM8/pWYRWrhxkwmtRS6SXV6VKc2/Mc9AUaUVTF8cNa50KdSc+
	 A3RH1ZCevN7diqmz//iKXQWU3zARfKraMkW6NzoummFzNHH9OtNAn2KgmiNR2SO+4zoQD
	 8UfLZCEcJJppciKqf1Xie9LJA1gy3b948VMIkUVTy7WCqtfD2MUfmKD4ZRyddo/6Rhg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793249954;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
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
	bh=9+DRNTb+Iccr7cg3IFlbMKMsq0jQF/LIYCAo0v5lp2M=;
	b=x6p1vApsY9ynJ/dO48nbWIPAWPby+umkXj9HoFXSacBsxmYfjWZzeZHAuxBVznEY3WLm
	 bfAhkGzLZZGzpJnKQWseFkF1/tVrXXjBl270wSTlQKb5OABkwmg6V+hQbTgYAE0QWEm2z
	 YOOYLcncDr3zfx4TGVMVvLlL2BqSF8mAwA0mN+glJNMhj5c2fs03iENc7e/i2ZiKmSgPO
	 6Nyz/aM11dirV3LPd1djX82/r3wBdvgPdp669vNv6B7dxlB2zX/QUvwNYwYaL2ePF3nrW
	 MFreQc2c9kBKQLwwDUe9IeHFyzxjQdEPJ0Ue8TWVFDmxR4iTuS0/8YHALNP+RVUlg4Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IpvrMtRm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.27
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12A7606A32A;
	Thu, 29 Oct 2026 04:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D12A7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IpvrMtRm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQeYs+NpXDlI0V7Q/wh2KHShlw+JsNceIQlc7Nfmx5zwPCGOs/RpKFr3/PRfyrtEWWFFg0ZpE0EOKqdYNyjgR9OKy1WdPTsLuQJFC4vr+hzFkeE8IGwQRLLZsDa/P2DwsrLQlijRc9lu0RqOQr4aTVJ69o1APu0WH6FZFNe+bcJlQ5TcZPqSST4pnxwuwb0i2q18eJPCSwhcrd2QhLXmjlqgd/2PgiAXZx1xGfozG0TdAA1FhA6c/Zok47/Zw2pvs78dSfUcE7jj58Sb8kBuTGFnveIyzZeZ5CZOB5cfNaZgZEzK4KaBGzDAzJ/kmtCv9bLjnJTsooKBpBG4LXeF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+DRNTb+Iccr7cg3IFlbMKMsq0jQF/LIYCAo0v5lp2M=;
 b=QWpo+PyfcryS42nLC0Dd8HieUO7wtbASu2zs5sak5V/dqHeasdu28MQirct5cdAkDxzcCn8IM2o21oRBA59yy/CNMJhTaVQurjWO7rcKzpkCgsvWbbuwiaJQx3RkkWaVviQr1ICNUKZQ1KbZbgKV//BTW2LC0ZZHETqhO5Ia4Bbf2YXxA5ycUMU3WkpTTvJC/RAg569IXMNMGrwAYrCnElesckZV20RhYow25o/FGuqDee2T/uZZhOwApEzF6Mv5Nk6ol2X5UHvjEexcLG0fgel3cyix+RfWTlBUhpL/NlnCcUJQJ1VOZzl6XnPOFmm3Ay/mANIbgWK3wuKnxs6mOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+DRNTb+Iccr7cg3IFlbMKMsq0jQF/LIYCAo0v5lp2M=;
 b=IpvrMtRmqHmVFaGTQE4vXZDBWEwcbpOP5lXCzC/9dtX8pEmjXDWMWR75g0qu/WtwNHGpmZjlWMACrb5ITwjl+2Ggv7CYx5BK13RFgnhZVWvBv2ONCU5dWl6AvrP8ysZMn6T1I2bY6MfocRI9sVQQ3pfNugnlbBqACdGwAjTDg4dbKxxyf4DYoJwoP6I9ka6PxrOZfXCIIZAFRyG9SDghLQvPKl/er4ncmu72j7BaxLKKZVs/yoGTCyNR1+WZcSndiIQVw9kjGvIakCO5ZdrN5RR+JO/rDoNBaEGTObNOz21f5Mr+gsCOJ5Vw4q0Y+K48uGu68n+q0Y+6MbE50M1uSw==
Received: from BL1PR13CA0202.namprd13.prod.outlook.com (2603:10b6:208:2be::27)
 by SA3PR12MB7923.namprd12.prod.outlook.com (2603:10b6:806:317::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 04:58:52 +0000
Received: from BN7PEPF0000009D.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::71) by BL1PR13CA0202.outlook.office365.com
 (2603:10b6:208:2be::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 29
 Oct 2026 04:58:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN7PEPF0000009D.mail.protection.outlook.com (10.167.248.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 04:58:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 21:58:34 -0700
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 21:58:31 -0700
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: <devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, Jacky Huang <jackyhuang@nvidia.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
	<billy_tsai@aspeedtech.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC support
Date: Thu, 29 Oct 2026 13:58:06 +0900
Message-ID: <cover.1793243187.git.jackyhuang@nvidia.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009D:EE_|SA3PR12MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c1ae17-5950-40ce-196a-08df3579533b
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|23010399003|18002099003|13003099007|56012099006|11063799006|261009223027099003|261021121427099003|260925021911599003|10067099003|260925022911599003|260925021311599003;
X-Microsoft-Antispam-Message-Info:
 aXzzfh71ooPWCyXn8KO/0mjMrTRNuLvu9ItAiauyNG1TS2gkJH2OEp4EWc52k3HHnL1g5bOWWr7HhuJvXFUz3PAdQ3cGzLyYQSBDHIO3lNWI5C4Qy6qTy+lXJSxUPjmdHPSf906QUb0yEoRkx3AM8eedwTETKLBRvBk48kfQJjnus8bD8gGStySkdAHgClbxKuu/jMKF3U4qcWqjX5OOQ4CXuAusqn0j4d0UfGmoxZGbPfrEfoVEiI86ibkJXjzKJant+IN7xVNwlbmH3Tm6YUrxJXKREAaEXoINMOUHDhmO6ZWcVPtxFaZ8lMDiY5JklK8TFMvDhgiL0/FLZ9O/xL5Hh5euVx2eHkJXHLQd3iGbBPry+ZIdAwIe6jFuXlY9X1NMXWTF7YhfuTU2L0IsBLsF4i77/L7OdtmyvL5i4HjgydZJ28Fe2TXj5sOqG8F+GNaEKAHrdHik+uR8Uykgmd5inydJt3roQhYpLTHFvkVR1ktyV/1r7P2wijoBxx++aSl5dlA4CzkSz5cKGO6/oZIPEZoLX+rvNcxtqTSmIQ1v4W3Slm9CviEM8PN6s+JItEKKyvr158ZzP7fqtYJf7RmSIYf8X44RTpIvQRYsU/U7iucFVps22Q6y1haqPVnI9obB2fs3K0Df1pCcAw3rO2djdaGFlu27HGAVLqmyT5PHW4H+yRGrAQupEkfD8EplyJ2NnFx3TRAoXStYPxaZkw==
X-Forefront-Antispam-Report:
 CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(23010399003)(18002099003)(13003099007)(56012099006)(11063799006)(261009223027099003)(261021121427099003)(260925021911599003)(10067099003)(260925022911599003)(260925021311599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 ksumgdySMnsHEMPobE2N9dOuASVKtlY814anmJefI0x/uJYBPlMfeDk81ihvMC8yiy5U1uH0TPd3ceg3GuhXKUqCor9wW7Qcrqe5TkQ4Zy6rXWJcuSNateXOsv0bIjnTCUTmd64Ppt5TxRJ/ZBdb6vfXJzGT+TVg4c8jhQmnTLXaJCnBMHQv/khHPY6H7g3ZBjh/Knhz770LQ3H2y3w5M30PAHvVryWi/Ji8ZgZ47rugkGMkHYUtzrmHHCbldDRXOh3Uo3gtxect9nxp/kReK5Y9F7Kkhh54D2V0gvOpmRwLan5cZJ2csUlyB1SrJzk33wXgmX5y2nRe+e5O1ENqb4yp1hOG2nWhI0xkB9iRDQ0p/VgPyk7mnXy2e9z01xbzmp2BsCDzSVOVOD+oq6bMq35LbKzKIAUJ4Bs13/BokSvmsuk5j/7vH6tEAlP2gD0l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 04:58:51.1759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c1ae17-5950-40ce-196a-08df3579533b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7PEPF0000009D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7923

This series adds support for the NVIDIA MGX Vera C2 BMC,
which is based on the ASPEED AST2600.

The board declares its boot-flash properties explicitly, allowing the
same DTS to work with aspeed-g6.dtsi both before and after the pending
flash-node cleanup [1].

The board DTS passes scripts/dtc/dt-check-style --mode=strict.

[1] https://lore.kernel.org/all/cover.1793179064.git.jackyhuang@nvidia.com/

Jacky Huang (2):
  dt-bindings: arm: aspeed: Add NVIDIA MGX Vera C2 BMC
  ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts    | 1321 +++++++++++++++++
 3 files changed, 1323 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts


base-commit: ba3f2c447203166c640e40dc8e9b4b91fc613aa5
-- 
2.43.0

