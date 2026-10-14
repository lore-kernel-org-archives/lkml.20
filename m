Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013027.outbound.protection.outlook.com [40.93.201.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCAE4D09E3;
	Wed, 14 Oct 2026 08:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968269; cv=fail; b=YP6BkSvD5VsywdCyS9O9aYReek2PHnTDU+BGe/nSOpv5O0ZCqe6l7EJnMIFuJ1hsMztWJt3j9pRXmb7IypFUZv//1mqOYkgwzvWmYaK3omrqferlYfHuGKpaM+0X4LXNdDaQa44L4C24TyR5dx3nHqlKZnwoIIok0KvaAaEUnC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968269; c=relaxed/simple;
	bh=4vC1cfYYyp9NSKuKJE+2IwBcLkS1KLepFabY9vodIOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAZQaagnPnzHwe+6ivLMkgqWhn31+t1vOIyoKhHKsyjiW3Ebqw/6z7qYh7Xr/VmD1ehcqc3IdPpL/7XuCpkGe1AkdIS698FSI97XOrgVh/xGMXKt63+AoIlaApD4rKfnJcFdPpZ3hCEzwcZsgIBG/bvMJLrxZMQS5Ca7h0gJE3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e0qxP/1k; arc=fail smtp.client-ip=40.93.201.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e0qxP/1k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ydewp9RB2WmjzYmABUs+UmKw87XuoR9WYTcRhim7q0hM5bQhWgz5Og/XvSMaGXVrFlkOJr72ztygmBKP08GEziA/enWFDflii8a2XQjOhSvvraW38TM1H8wXQ+WlpiBAnrEXLo3zwqPoU82Rsv7kHjD+LVC+mXhYd57uZanYzOgLJMD881P+XT/nTbLKeIrh7tbVB/Tg7i78YscCgxBQ2UD+XjI7cZnVrk0cblmiNk71NITWzPXiWSPHZUxEiXwGEkzxTYLo9pW1akegyjT0+WieTsqboUnX//FJQ/JEffJB74wqC0M8oAXAZ8gyCuZIze/XmHKBTKpsCC4h6Eijaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMOhv971hmE2MLdJdG+8Nrw81JF8N0DItXUtI9g+RXo=;
 b=gev0gbi4DFJF6xNMCdNZwWS2erm+C4a5TfFTvYuJa0dJzhhrJEkLc85Sx+NsPtY4MsKiNeL8bC3s6bloS2Bf3VdC/WBvOyjaYNioKhTnKMOo0FAPS/6UUjBAAYRL7fsipnnqxDdUdrYpHl8BfuyuPMs2dqeLj+PBKesicK/1OAnlPFU27SR/yNVyDEzvTSJuWP9MnZ5zR7G7H+xENRRjuFcYw11dVZPsjBAvWIz/C5oVpE+rX1SU2Fpdzh8t6plf/srwu4t+fIn1RU6ukzvVyrG89JRoziCllHUfNAjMSRJuqTzbjcHq15Mi55qbDw0WihtuMEMW/rlWaoxTF4L5Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMOhv971hmE2MLdJdG+8Nrw81JF8N0DItXUtI9g+RXo=;
 b=e0qxP/1kUBv6SfjbZ/9tq2aOlyt0Tv2CgS+L/tXxLFTV4quaOOnUNtId/BF7wbLT4wfTfE13y8DkEf4Ag8IarESPXd05S35soZS6h6eMKFZ81CjbuYEjy1RBfFQq7pYKqZESf5Ava0WkuUJteNgLnVtd30TDmuOlzpCPjA/1UNk=
Received: from SJ0PR05CA0184.namprd05.prod.outlook.com (2603:10b6:a03:330::9)
 by DS0PR12MB6463.namprd12.prod.outlook.com (2603:10b6:8:c5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Wed, 14 Oct
 2026 08:57:43 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:330:cafe::5e) by SJ0PR05CA0184.outlook.office365.com
 (2603:10b6:a03:330::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 14
 Oct 2026 08:57:42 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Wed, 14 Oct 2026 08:57:42 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 14 Oct
 2026 03:57:33 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH 1/2] EDAC/amd64: Consolidate Family 1Ah model setup
Date: Wed, 14 Oct 2026 14:27:19 +0530
Message-ID: <20261014085720.1471993-2-Vishal.Badole@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|DS0PR12MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 9392789f-ae1d-4fa3-dd36-08df29d13520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|10067099003|18002099003|22082099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	x81Sjw7UJnc5/RVFZiIY6bWhbaeu0Abz8U/bPp8qq+kyTS7hYCekpKHkDtOTqChDSLwNmul/DXkQiA7IOkSOnibFOfAD2DqeAy7nkM9OOLAGzLcZLz4KP1E30/3FZ3kPXrP6s4vI6a+boxfvmShIgs95/cW56qAhDRc+qFa0YV7zGY4XO02Vi2pA93uN5lo5itm280L8ZoVG/TnJ27FXSWKxWNkGp1UQXMH1gtJDRcVzIw53BGNO+1aGMbD+w3sx45vgHPiyh530jNFhoPh9BxKCW9x3EwuN+V+hsIytTdenaCLL1uYGRBEpDqoBZwUGiT6LebyqqElmHujFN+7AMs4K+aEC8a+J7VePBChkJDzRQFJ1/yLaYBbwiUqRm542AECgNFFx7nSqeXpBbVeQktu1Y0KHIN23eVnY4zxnZnA9IBcNCEPQLd9YpFnDI8vc5xIxljsY8WCrBlVUvQ1P3jtJWrDVnbUqzFA68f1n9GBcauXQbLZFtmHn7pcYVOlix7VJnx/JeNAhLy0jk1VTA3UB8HavzqTkLXqJv2dpKK4T6LbloMP8Oq32sfsGdB1HOTtJK04yY2jjuqh6v1nW+KX1zr/kvnJk7T9IeQ1GGo0G3VHXdFY/gLd9kRLnR8knzRWf5+/8HfvhNt0uEKa8AkmRH2vd2XzIHXj5OsBES3nEEqk9rA7usrYjbqfjre9vIjBi1MUMh2FU3Mg+jqNjng==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(10067099003)(18002099003)(22082099003)(11063799006)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	686EHUDG5vF7v5y1l/sDMhsyeUqvO3djldxKWQC0pI6t1Zd5zMUmp4ONTbOzL5fcULjF0j10q7cBRTXp+3qRjXWYsBtVq1qipcZ/5piTG2hRHGvSFeR8zDmEFP87z65kS0ON30j1bh2TCUvmkwvJHDe6yd9r0cShXWdjLD32in+x/u9y3ZmTizJmR5mC32q/acgQnbawEqI6ZVB+trl4qIH2knPOJ5N44mAGIS109mPJ+uPNiMH3KlY3cFLqxctLg7OjD/2oVqYVbuEBOd4QmRbGlUlgY6BSogmkxtHQvzXW8nB2gmr97DeUUWagYgPYBVMdVuyaQYWtsJRV8oETZYNMbIUP280YfciqFs1mKizWG4m03lgPcB8P+6DLQuS9637gddInSuvzZ3CdYcuiRxeYCmykIms/qXpU7uA5s/Tuedcl+QeyWjD98+/N4KHS
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 08:57:42.4871
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9392789f-ae1d-4fa3-dd36-08df29d13520
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6463

Every Family 1Ah model uses the v2 UMC register layout, and the driver
must select it to decode memory errors correctly.

So far each model had to select this itself. That is easy to forget when
a new model is added, and a single missed flag quietly breaks error
decoding. The driver also had no check for unknown models, so it would
load on parts that were never tested and look supported when they are
not.

Handle the layout once for the whole family so no model can miss it, and
do not load on models that are not known to work.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
---
 drivers/edac/amd64_edac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 0c0d11c72925..7ba347bfd9a0 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3887,24 +3887,24 @@ static int per_family_init(struct amd64_pvt *pvt)
 		break;
 
 	case 0x1A:
+		pvt->flags.zn_regs_v2   = 1;
+
 		switch (pvt->model) {
 		case 0x00 ... 0x1f:
 			pvt->max_mcs            = 12;
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		case 0x40 ... 0x4f:
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		case 0x50 ... 0x57:
 		case 0xc0 ... 0xc7:
 			pvt->max_mcs            = 16;
-			pvt->flags.zn_regs_v2   = 1;
 			break;
 		case 0x90 ... 0x9f:
 		case 0xa0 ... 0xaf:
 			pvt->max_mcs            = 8;
-			pvt->flags.zn_regs_v2   = 1;
 			break;
+		default:
+			return -ENODEV;
 		}
 		break;
 
-- 
2.34.1

