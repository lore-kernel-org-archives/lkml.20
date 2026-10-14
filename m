Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011053.outbound.protection.outlook.com [40.107.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756A4D37A3;
	Wed, 14 Oct 2026 08:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968271; cv=fail; b=lpO6Dq/Vqxg4GE124j1V+9Bq2iGBRS+nRR3vItZbqyd1rP1D5eDDWDyF8tZp6uwkJwxRhMqNqDlLHGHrfcmmM5HsPUZhGlG/VbaZxnkOO/IeSDl7tyqpL2g4qousbeO9nM1vgzKLGZXHlZBrkyZFaxT6DvNy0qkuQwFlWFk0V7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968271; c=relaxed/simple;
	bh=TUk/j8+U4U3yuYfidk8RQ9ntlC8kH9utPm2JDYsDgpU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BEUgBQwGlPoGbPvZP2wHPwc1kRriXjE26DTM2uGhRE2cJ/+C8y3qMCE8ORgOpmd2bNVhzBwMx1wywKWiVlFMtkmHVe3b5crWYxakWbL/MfP/KRE13je9WvNHGNfcUWIq/hg1cxEiDhuGgjVzAz6/ATnq7pPOcYnczzyVIBdtEQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=HmUkH2XV; arc=fail smtp.client-ip=40.107.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="HmUkH2XV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBr/ZcBuVX3EAap2ggqLk+jjcgTf77CLSrerUVMnY5DfNI4EA+xopZ/430aJnk2nw+EqLDi/M5wqaT3eltB2UDD6+s4JX8TOKZ2wrLt7A+D2eJxGdY8IrFiSi8iSzODkiEpdp+Nh0r1E4QT1XgxGh1k52x70hKsIQvAnQtyDb4WuA5/m9s5+blzDTgljwZYSvkroeTAjf7GJ02wWTbLFSk95tML58Q+Cnl6sy+i13vX4bX4xoG5V20lOEuBeUOZ8GBbCWa55ufvl6vrNWvY4wiRjrhXCI3s31FUDjSRECRtgXxxQKHYezGHXQsRvpUmSsm/PXxvtBNarFwaU557+Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMjwT1Gp6t3G+xaseimkqESc46mnuX22Q0sbCVRb+Nc=;
 b=Z3atM7MNvncixO5ZeBenm6PMgxBrRULQeq3YUdSVeVOqmSQJut1ALwErrLFhdfd2AYcnizWXw5Y+sE3S/jeN4mouaAOTJHEDpJfL0Ul58uqPl4s09rJThAHHegM0oNz3hUgwNKXWJJHYBBOoNlqUMvHNHKjRmcljVZZaCRShM3OX+3rKDygB+Ifh8MdWBr8MEs6nmH1qGHLCBieauPzXPBXpekV/3BqADxCpueqmaSc2kIkbOrj1vsxB0QW0C4O76yRHhaMZBaZ/hyOqlSb1XjzkJBJ9K8jvO1zMmeyUvoe6S1I7BJANCFxRHFbQim7FkokvlaAuoVLFlyGoqRS7xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMjwT1Gp6t3G+xaseimkqESc46mnuX22Q0sbCVRb+Nc=;
 b=HmUkH2XVg10gd2bw9/D1AuxZ3su0O2SSBUVQgdXzKy2zt1+Ij0iDjyjIiLSI2DMgmOsT8Jyonaz2DOsEdyNMtO93SN7vmQuaE5zIwJDKF70BacBXQXnr7L7GPtdCCA+rzCGR48lFWjwyfngYWGubnQHS3rsruhYf/yN+VzyG5OQ=
Received: from SJ0PR03CA0265.namprd03.prod.outlook.com (2603:10b6:a03:3a0::30)
 by DM6PR12MB4188.namprd12.prod.outlook.com (2603:10b6:5:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 08:57:45 +0000
Received: from BY1PEPF0001AE19.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::4f) by SJ0PR03CA0265.outlook.office365.com
 (2603:10b6:a03:3a0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Wed, 14
 Oct 2026 08:57:45 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE19.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 08:57:44 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 03:57:36 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH 2/2] EDAC/amd64: Add support for Family 1Ah models 0x88 ... 0x8f
Date: Wed, 14 Oct 2026 14:27:20 +0530
Message-ID: <20261014085720.1471993-3-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014085720.1471993-1-Vishal.Badole@amd.com>
References: <20261014085720.1471993-1-Vishal.Badole@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE19:EE_|DM6PR12MB4188:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7abd19-5744-4221-43e7-08df29d13694
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uAoGln2RGYFiJhGckeO8iQ4LAygfVbuhYO+ZU/oMu2VQsypWAHhQjN2+gZuOc1ta2fhK0H1LJTGONrnIHWws9YE4IeZvCFMKbWPUpqm1lkDQJz4QKOtzl0JRN4w0QjtPuRNVGsTr+aRcR3K27BdIwrf8vieZmzDIPRGP/BWqgJkXv35Nx7fq0KO/9ZFsJl04wnEpBqWDtHpGf3SiIA3nnpa88IsfqiM4raLBw724df1tCdg4iYTGMt6CBSzFbEw8hapfI9uwKDtuwMfq5rxFcwS5Cib0UrzWtx2JCoP52UkMY7/WjsfOPxslwkZP/V8diEdkgkd3txhC3I0Q9S+tLQWB5WgCu/hIo9+bM9IvUP/Hk8NfIyMa7SsRZ1mV16AulQYMXMhq9tgL3MN94gvngwnxjNrkolBVy3ruvE3oAeML2C9nQDGSNR6qWDyPIMDFf6xVSl6zMsfTZ3yEdPCjG7htKO0rQCaC0Me0nucnUXiPHnSdMZOT7RxDWU45FLZ3bq+T5Z+RNBxTlP1eBz8AG6399eeeMH8tMJ3IUFwmG+f5zIFplouJ8qkGRU8Z8BOw1b6aIYdaRxMmcBxBY+nz4bnvIEdtqRBZAL5m2VO+c/a//Z7NGprtySFL+8eQWMranc72uOzR7OiphJxEm4TpJiHKED1mSs5u8lBuB6bVAHHnkuPlGiTw5Cu8OG14wIcLvZ5goFM/8vpg29IhUcuRaA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NR8QzdDxisN3YzvOIeNpGbt15/LCH3xuKg66WfOccG3qCA4zDZN888Mxjbe7CAxE7w4+qGVZrA34LdWbidrYEPCoaN/7ohpk0MoJeSmWzvmhiqUAwFG5LuyIWrpg9HvPTCSLExN2W+5rIlxKiksNB6MtSNO6S6oOZ6QsqpST/8vZaSfCFBRO4S16Wx0mf39rUQLqgEuWZwaMFKUxQ535Q6y5yVZ1QPWoa8qI9MGKOlS1J0aKAIg4WVhUfBm5XibfHop4wcqk+kg06r5O0DvRYpiB9bhWlJjmtg7xcQb2GWAE+CAnmyo3sJPuPUcJTv8id9+FZQsXZZ2dtn7MHvRn1ni/7xGY4TfspOCR24hxgPZ+B1sr8d7BqIPkiNCVHFe48bjkce5Z2HdbQ02wNbMbwS0WpLgrJUVE4VDAZRUQ3FRbq244JtqRpB2eZCINXmdw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 08:57:44.9223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7abd19-5744-4221-43e7-08df29d13694
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE19.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4188

Family 1Ah models 0x88 ... 0x8f use the default settings for the 1Ah
family: 2 UMCs using the 'v2' register layout.

Add these models to the supported list so the module can decode and
report memory errors on them.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
---
 drivers/edac/amd64_edac.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 7ba347bfd9a0..21ce1caa7151 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3894,6 +3894,7 @@ static int per_family_init(struct amd64_pvt *pvt)
 			pvt->max_mcs            = 12;
 			break;
 		case 0x40 ... 0x4f:
+		case 0x88 ... 0x8f:
 			break;
 		case 0x50 ... 0x57:
 		case 0xc0 ... 0xc7:
-- 
2.34.1

