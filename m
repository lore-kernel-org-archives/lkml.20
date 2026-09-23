Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C849BD78;
	Wed, 23 Sep 2026 11:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162438; cv=fail; b=e9G69Ft+APex2Aspt0mWQh0rWErXMxUIs+0nLX/GbRwme7NIkPLJEKFny4GCbY2TDpe1fKwI5dVGV4F6B+JG6Wd66B+h8ePGiWliIZrfRC0G5W8zCSzKbIFoAD6H5N0p5jvnQlD+TIGlVXi6jsXdJT6G7aYCBZ8O6kYrSaqL2PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162438; c=relaxed/simple;
	bh=qeGxbHHxNnUiP53eq9frnSBG0RSYOG5hYM4XN3qoYAg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dzpOVkEtakHsp7hP9dI2sIb47/wHnzaeP0hOWExc7+6fX1oOdIvuHSXc1/Iz0MHbphPdwPQ1QaOLLyHJZExF2D3JBb5JDP7/TFme02vbZKGl2uPmnNt8HfArfJ/ECq42xOXVvwDAZtgzsPQw4t3HC1aKr186U6MURP9glzs98zA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=XTeFhSkl; arc=fail smtp.client-ip=52.101.43.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XTeFhSkl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Okj9+X2laXa+ZQ7yVa9efuD2PExU5KjE+oq/dQ446zbUkI23tHLXSiXR6jpBddcF9Q+pGbNaryrSFfeSENyghyhzGhqR3SYIbvanWNJV2dz5f3mxYvF1Iy6LUjpJ3DtpY4IZfy9jOJOokTcm1WVPEaRQol9w7nxMW6QaW4jxRROyZJdDTfHBjHz1etDeNNLYeTGlmsPr9y/ua/XlXKDr+Y88dz+vzEHfYZt5dbbZjlxSplQQEnAdkpKxRNQ1cDyyk8b76TTaxPb+Drin1LeHw1SiIKzGX9TNGgzdpqYYa6wUxJ+R8PpLMSrQJYxL+/eSZZBYagfxTWCt92USs6HNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejPA5+ubjs92tOymWfWuLq9XG4mQaRoYMA015as5XCY=;
 b=KmxwBy8neWmhkOXDhwMqNbqQtLE5cTYvrtVSAawJmnA9ftB13xcgWDPbotSH4gnpcPIcrlZ33b/kUid77u3PUcmQYNC0DJaE8JSh229uVy+6QCTM7BlzRO86Zz2Q2DZBFZrcLULDd983eEVViaVxbttqJG1DclEJsTj3wAjhof2S7VyawapO656WghyJT8GuLrH2I/OG6x5CPdADEjfHJQMLxRKZ+DFwq8csepNQ2glZlZEXZxJYAYYf22QXEfWxPzo8wDVBz4oLx5jAhfkKvKQ+VGrLw8e4UnEvJJ5BmYHVLqzr58rbgWIapiJrJLHpNSyV2eeOtqAr2+1sTnGWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejPA5+ubjs92tOymWfWuLq9XG4mQaRoYMA015as5XCY=;
 b=XTeFhSklxC24bTNc6shv4vNv81B81zqZVC792DQKbHojVya+6mjGSN7wqCrVyZgE8sWqn8Ym2Y6ahem/wETAM207lysSWDKm2D4CK1DqySG/58vEY6+vSgTae9j/uZ7h3OhVJOAV/9j9yPEDpe5rflxhvKDJ7ba3ATNVKc9lju4=
Received: from BN0PR04CA0109.namprd04.prod.outlook.com (2603:10b6:408:ec::24)
 by CH1PPFDB1826343.namprd12.prod.outlook.com (2603:10b6:61f:fc00::628) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 11:20:25 +0000
Received: from BN6PEPF00000073.namprd03.prod.outlook.com
 (2603:10b6:408:ec:cafe::84) by BN0PR04CA0109.outlook.office365.com
 (2603:10b6:408:ec::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 11:20:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF00000073.mail.protection.outlook.com (10.167.248.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 11:20:24 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 06:20:21 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH Intenal 0/2] EDAC/amd64: Add Family 1Ah Model 80h-8Fh support and fix csrow decode
Date: Wed, 23 Sep 2026 16:50:01 +0530
Message-ID: <20260923112003.3677719-1-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000073:EE_|CH1PPFDB1826343:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc00c49-efb4-4e83-b2e5-08df1964a9cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	Afg4Ho8rO45RhPy0BqMb6XjYBo4fAaTI3IM9ssmB/Rntuczi/sTQCl510e9srVbJIzc+IRDiSpg4hdbZ51Qmvypt9/eEBHliOj5ApShZxcsiIRysPGzMztZLXAAL8nGaZBT1wmQgQc5hHVnGIYxndh8JkJnRPLnaGfj8MERe1aKahZI9SV9kcgpRGN2UjJjHqINZ3sZK1PEWXsagvBMSoJN5T6N4gvX2w1FEm3sZAwJejOjo+K2W0uyy8zFDsr4y8bpsHH4kP9sSBJ3mw3T4Emp/4836tOD6xSlGJFgoRZf8CaHHgHW18bLYgYkqU/iHS/UF7NQfK7+P2Vpq+qNzkJ0pb52vpHaJ/zNT70MyAmVDMP0aKf/3s8fjt+zlG4cFgTUMyV2eFjMhl+OKLQKHBj+tx4b158Db5jPUZSeqqPHK2WzAP46aZ8lJMe/Ckj3thstaVLvI8Uggs19cSXpVsAbB3ZU+DnZ+oocaWi5QX0i7AZ9+N8udSPj62k2lCsD4h6/pGkKq7o+inQIsr3q9QRMh7KpSQQK8OzgSieC6HwpYREc70YswChNTYe7RodQwx9mImUTgy/s3zLOWCnmsmTykBnUdC8OIk8vsmEpNVCNJFXRJ8ZAWYkNypL++LBoBwGc9d4XLRBv8O+vpG40/gl4oSsUIVqBEeiGrvB9ikZFjiNTVuCNFE9XRiryX5lzKGT5K3nOVaB9IKTDLIZGTzg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(10067099003)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W5GSvGyIpYO4uTnCt5gziHKqGgfI7nUHKN4tI9ziXJ0ElHnCrX0xmhfs7y4S+nnnvJz7OFb+5se58FIbFruqrRh4mP25mDBQRmevUPNef6V7VvlVgHAHdvUSdCLhmrWgMlO7epFhl93sYWIeXcseeSQEUi0iAGVei4Pn69OI8EXOraGCjvWPdx0DWMLJOtvxFH5y937un+gIQ0u+OLizZhm7s+f0c2C2fEQyHl56NuVN8pQK24/0ZJV0D2ReF4pDb98vHYU3nzGqu4yG4Kdu6C3xVf1Y+4XqA+S/KNl0z2t0r+vo7rvZoav3lGKzBwsrnooYbhUq08bwD3Kwti/6kvwTJSboHZBNydKF1ilxL71BhY2z359uXK+mrHd0Qghuh4XwOybJ88SfLvSkOSCJg5LPF/b1qN83l3hHHRK6BVXy17rdNEdDzQe+SLcbXDr4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 11:20:24.5600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc00c49-efb4-4e83-b2e5-08df1964a9cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFDB1826343

This series adds AMD Family 1Ah Model 80h-8Fh support to the amd64_edac
driver and fixes a UMC csrow decode issue seen on that part.

Patch 1 adds support for Family 1Ah Model 80h-8Fh.

Patch 2 fixes the chip select decode for DRAM ECC errors. The syndrome
field was masked assuming eight chip selects while the controller
implements four, producing an out-of-range csrow and an error reported
against "unknown memory". Mask with the number of chip selects the
controller actually implements.

Tested on a Family 1Ah Model 88h board with injected ECC errors.

Vishal Badole (2):
  EDAC/amd64: Add support for AMD family 1Ah models 80h-8Fh
  EDAC/amd64: Limit UMC csrow decode to the implemented chip selects

 drivers/edac/amd64_edac.c | 17 +++++++++++------
 drivers/edac/amd64_edac.h |  2 +-
 2 files changed, 12 insertions(+), 7 deletions(-)

-- 
2.34.1

