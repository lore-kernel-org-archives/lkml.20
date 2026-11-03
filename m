Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793706553;
	b=Dep0mz4J6afkPAUKlsQ+gUvJnlqvQGOfV1JQlxMxzcGy6pEI3ZfdjUV4VmSZcCVBMX1A
	 gKk2gEIINo9k6j+VEcGTCWwozQyIHIJrASf/AfHDu60Uvelebvh4LHW2s8FgHMa2hmFoM
	 4q1J4EsFdn8vIR23Xz+YqDqmzhqzoIFBAh1FaUpY+7+1WCHtZzTwm/PTWVPtnn4jrpRzx
	 bDrPMfxmP2YkXB5WjumgGWnozKdvqGUvrhYGErhJE0dnLtFXQDkjOtenMJaQnxMyQdJlW
	 8Nh2TrZ11hOuUVNkTBgYkrjAtuXngt5UTjtwFBEo5zih2bX/6UhT329cf5sjbuqafkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706553;
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
	bh=m+6NSoBtSa1CPqPfwgCDegOu2B7TuiUuL9/1rVDivZs=;
	b=jL4hlMFXmtB3STvTXTzSH+mY/dX6OchRmCgdMECfTI32xmZ28VKkydNwmRFbGlRSo7Iz
	 2IgrsOCdohGcxVEmlH/IQBUAL9JIMkMGofl1U2jI6BU37s7XAx+IFP8dNcOmX0CqBs+2V
	 y8gUnBubfTnizGJu/EtDYZp6QGJS0OAO2Cd1pCmoWPbUEngiAWcUslce/u8Palunbk7BI
	 G8Q6ul5t0YN/Q9JoQplr9PlWVjKrfdnu4lOf2jl/HvvcvrmgNdX7pco1Rjw/frlCoL1YK
	 jWXYgzTzrHJMkRNsZv2XtRMHhv3+eC95Ca7fX9dHaxid/Q7biWZTVDjnOEJv2cA9ODA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PVXU7Zhr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.22
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010022.outbound.protection.outlook.com [52.101.56.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E9D606D823;
	Tue,  3 Nov 2026 11:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E9D606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PVXU7Zhr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRLBwIM8WKVs/Wzpxkv96ntyo6Sk9dZWW7eQHSUd5yllvy/IBdUja1CmsEUEv0rUG00Y9p5QYjCBgVyQXPhhtQccJWBtHMeaxB4KEnqEC41ksnTK96MV+n+TsUBa6Ch4m0DOW/AuLU/h3vqnCf/pgPtbM5EKLQehjn8whZ4RNfmzMdCXN7x3tQ/KPvCLWelzHEECJf1Qb2+0CgGpD4Bjy6eXAb9/SUwHNA0lFbCstm/oOlAx1YTRcVLicg5KV9tI7ksF58FEqBDy+k84NsHHoaZAW67ifWp01QATCM3HxMhRfpkaYx+dw2vTOyLiUStttOKIkwyywJ807Dp79YgGOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+6NSoBtSa1CPqPfwgCDegOu2B7TuiUuL9/1rVDivZs=;
 b=ucQp7hyXfnoLnblrB1h1E2GhzPeqPvMaCmLc7MkgX00GvOFrtkvi2AbXrkHe9a4Ztir/p/NeKUEeDjl7vngLhNlElW4lw6pOPxSFZhmC/ek8TBW3MBmtJrnrK00w2A47BsGceUvl64gWK/yNebdOy7vzOXXKMqo9s8a28AV7R9r5NqpGknnOL5v0clp7d//F/lnIyfhm3TWcll6326DBhbev4+xnsIxEwY/lvtrGddP6WoMTocvYqwYU0YsqRzqULPH/NRGwPd6GygYwa2GWUSmdu2X9fRBfayfgYDtVyFI2Hxp8LbA1zD4t4V5Cu++s3dhOkyENqyh8+m21dkoREA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=codeconstruct.com.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+6NSoBtSa1CPqPfwgCDegOu2B7TuiUuL9/1rVDivZs=;
 b=PVXU7ZhrU3nIs8yYHPZrgBdYKN+baAh0rcivLdIoPigsL0KyTyat4Ni97lZwlxN20hqRUCl9+6eiGXlZpOY8P46kzV6wwxW7lAcXthj/BOf/LS2TUhxFKmcBx426pL2Zie1T53+xzQFHQQ4TK4XfYY4E4X64Q1pRX59y3aZFWYdJLUhjfpRV6iev/ruuph4YUyIv3kYXJ4tZoOwghj3xGVM6m5R/BaW0KNnZTwsacchAfUlFBwutFblA6HjPjoBOaHTYCsLACUxJ0D+T66NZSUc/JJDNOohpUvxOT/eCkR1nGWB68wMXSksQUjxBw3VsmktLMMeQmNaU3pf2HYABPw==
Received: from PH0PR07CA0025.namprd07.prod.outlook.com (2603:10b6:510:5::30)
 by IA1PR12MB6578.namprd12.prod.outlook.com (2603:10b6:208:3a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 11:48:50 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:510:5:cafe::9f) by PH0PR07CA0025.outlook.office365.com
 (2603:10b6:510:5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.8 via Frontend Transport; Tue, 3
 Nov 2026 11:48:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Tue, 3 Nov 2026 11:48:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 03:48:35 -0800
Received: from nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 03:48:33 -0800
From: Jacky Huang <jackyhuang@nvidia.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley
	<joel@jms.id.au>
CC: Jacky Huang <jackyhuang@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>,
	<devicetree@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>
Subject: [PATCH v2 0/2] ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC support
Date: Tue, 3 Nov 2026 20:47:51 +0900
Message-ID: <cover.1793705210.git.jackyhuang@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|IA1PR12MB6578:EE_
X-MS-Office365-Filtering-Correlation-Id: b96e204c-b642-4560-61ea-08df39a06ce1
X-LD-Processed: 43083d15-7273-40c1-b7db-39efd9ccc17a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|23010399003|260925022911599003|260925021311599003|260925021911599003|261102123227099003|18002099003|56012099006|13003099007|261009223027099003|261022075727099003|261021121427099003|11063799006|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
 NBUhTeVqn9q3SF5049DRMyYGlqtNZ0+hp2RbPeJw3Wl6Q1r9iufkspPxQ1z3USDJzIPb7ZLGJvlmK0lUjdX+U+Q2wAPMmLBfVQ8o9kt5y6zukBfnSKu42N4ViimSktm+2/M6bpbKWjo2VIZCDSS7+EGUux4RK5DhC5EtdY4yxXpEFQE+6XVQV9+/+U53p5BmfaWxRjIJoir6ZhLtNtNgnT5mpDwEbFK4ZGmvJziu15L6scFBTrGGEPGvJcPG4yCTKtd+yNjMHXqVgO822z8+DTH4kW16pPVqLOyofijiv7w8w1tCbLXDqdRM1dTTieuWwZ8yMur4T4c48BHaVeJ4MEB+Eaz5WBF8U++SrvSAeEDIB3H2Oz8Ne7GpqoJZbRFds5WM7ntWtsa4FBJiq5qbaOEW3ugtwEKaSvKYSISRjRds82FNDvsZGJgFzve7oP3Y3zV2bl1v2DH2TXSroh38G1NE38c0ZdIzFL/M64M3G2tQogpgmRPmrUSo1BiuzM8JLl0bNL9v6YsRjjoQsxVGAvbiiHbCgLlf6kXd7SobxcbZbvH0ShgN4JF3fAPR5Br6ZWHbm8lW+LGCgjwTlTIJD5VtjVXwGa/MtD5eo1rKVtqyBTOx9cY3v+VXHR1V2G16uCHeKNN1mGkLtedD8+edWX4AnpS5n1wfpC2ZdxeyzNMZ0uO2Jb+MKcO0yLJ0Z6T76GaU/QjeAyQvf4qR8UeibQ==
X-Forefront-Antispam-Report:
 CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(23010399003)(260925022911599003)(260925021311599003)(260925021911599003)(261102123227099003)(18002099003)(56012099006)(13003099007)(261009223027099003)(261022075727099003)(261021121427099003)(11063799006)(10067099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 mBVQsRvj6+6MzWaqwN7KTYN5+YZLpSN8yhepBvP6b2n3FVqK6PVFFGLpTO00G3AJA6/AedXw1SVBAfoI9Beb1XIi0nz7Z9drpy/96aXp22/baYtoI+1cTN1AbHB13OP6Y8pCD2zWsDnf7xCUprFp5w92YjI5G8V64iAjv8p3HiZ/BIZJYCbX+RiFfuNQrV2pKBWpafErwL7seGuiEJ8hZD8xwPTdBLTqFJPny21269FSRzySQBjFJoty1WO1N/m/SVguX5anoJ4qqSOO4Pn/VAu2KefaH5V7eW1qha86FmCj+oyshhcX9IbA1SkoEVrj524GDNZnWI1F9t4dLfqT9nfogzp77+bUfWvaBa2J1NUUg4QYQFsXh1rsJ/Jzl5sCBl1bPrBKePBEYp4XnLvg/bVh9ceKG2NXerD8wectyynoQfdOTDv3vFwWdOaKeWUY
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 11:48:49.3915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b96e204c-b642-4560-61ea-08df39a06ce1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6578

This series adds support for the NVIDIA MGX Vera C2 BMC,
which is based on the ASPEED AST2600.

The board declares its boot-flash properties explicitly, allowing the
same DTS to work before and after the flash-node cleanup [1].

The board DTS was checked with dt-check-style --mode=strict.

Changes in v2:
- Add Krzysztof Kozlowski's Acked-by to the board compatible patch.
- Use stdout-path for the console and baud rate.
- Use generic node names and fix gpio-line-names indentation.
- Remove duplicate GPIO line names.

v1: https://lore.kernel.org/all/cover.1793243187.git.jackyhuang@nvidia.com/

[1] https://lore.kernel.org/all/cover.1793179064.git.jackyhuang@nvidia.com/

Jacky Huang (2):
  dt-bindings: arm: aspeed: Add NVIDIA MGX Vera C2 BMC
  ARM: dts: aspeed: Add NVIDIA MGX Vera C2 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts    | 1275 +++++++++++++++++
 3 files changed, 1277 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-c2-bmc.dts


base-commit: ba3f2c447203166c640e40dc8e9b4b91fc613aa5
-- 
2.43.0

