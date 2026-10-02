Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0800F45041C;
	Fri,  2 Oct 2026 11:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790940812; cv=fail; b=bnt0mdQsKjoHomZZUpVPDwf2n4FEeqFVaKLkNjeSMHV6g1q1i2gkDLFeAQdLOKv3BtGVMK/6uQMGcE3Fm8UnSOUr4dSJkKv5c4zuoggyX6vD8udaTJ+b2x/9ThKhLWwx4UoNKYQwDlhFByQC+szPqzz17trobOZNrV5vAPRacDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790940812; c=relaxed/simple;
	bh=h8mavkQELnRRHH1AQhUGeUNnqTZGJw5gtJEKq23FV/o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rq1r8/tfnTltGPHlqffZhguSrAapegD7WegUqXphByRBwzBWaiDXDOd3woYLruZbFTHb4ByBWcerCsqDYo8X8IuJMbrQTPjronRiAYth4+dlSPtotwxvBoNpP1ikNNxqHSOaXd8M/VPv2juR4a8k/NT6sa/mNvp+Wr3SzLQxxv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=sIDw9RMz; arc=fail smtp.client-ip=52.101.201.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="sIDw9RMz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uw7FC5eBw+EwzAKA/b0fv+wCtyFEq+1wom/fL/ZVc9SdnduYU5febHmq91PwLd/l+Qhbo/Tnc70x7HY39Ikbt2YDNWQxtdYdyLjG9HUYD66iWlxrTgYWIrIQdYKB2EQeqYd4IHx6noCzo3QJvosabhVXeTW0O0daA8Fun6GiqKK5tX+FLfMgDTz5Mvyn9fnSqaKHzreQQWApmC0H1+Xo4uUCAi7cy5Wer4Dq0e5D5JJGZ9ASTk/4qW5bhh0LzsBOo9c4/3I6fxRgiTkpgMXqjYSyd0eigg7NV9lhP7JKtJRYhMj60ospWB/CCtxtGAbfAI/s3RfRpE/F6TIxLBJhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P+neAz8ui9/+9MBAtsz1yqHkBag3pLiNtYJX53LRWWY=;
 b=pwMM9yqyN5FpXLvA0bKB9h42ZYD5puJFmoqa7IpZ2yx9sT3tU/FOg/8Nn60FJZqWNYL89oFA15W5DXFBqK96f8hCC9GXchy8oQC+SXDno6ohnoV5gAJOdQ1Pu5RmeAEOVn5Js8Zp1HXcVu+wBhx02d+Yc12QwJic+6fT7652+vZvxEQFu2dTIvna3o529bF0QBRCG5fzS8FzZi1ZrZy31zIFyPNEeQ+MDTMeWZgMawaH5d6VbcLX1cTSZc5aNgt5VhfDV3uc1YHjKARkAreS97bWEY0vk3uubFLe9Ri8Xcd627B9tpzjeIYhSGUgR9/Mvv1vZsfc1T06eKcfbyWxPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P+neAz8ui9/+9MBAtsz1yqHkBag3pLiNtYJX53LRWWY=;
 b=sIDw9RMz1P03B9ddzdsTAhrztqimFrY8NiCcnOGvTofepXlHkaODnUp76lq7hy7kGim7Ecy+fB1UO+OC+ZWRjVnPGHmDLhL890MrAoStoWoSEBJkMQgKuCTewknaTAPC4Wjmh3pGA0oBJkneyJ+hoKt+Uc9Y9FC1KsZu+etGCbs=
Received: from CH0PR03CA0337.namprd03.prod.outlook.com (2603:10b6:610:11a::27)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 11:33:27 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::1f) by CH0PR03CA0337.outlook.office365.com
 (2603:10b6:610:11a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 11:33:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 11:33:26 +0000
Received: from airavat.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Fri, 2 Oct
 2026 06:33:22 -0500
From: Vishal Badole <Vishal.Badole@amd.com>
To: <bp@alien8.de>, <yazen.ghannam@amd.com>, <tony.luck@intel.com>,
	<linux-edac@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Vishal Badole <Vishal.Badole@amd.com>
Subject: [PATCH v3 2/2] EDAC/amd64: Set zn_regs_v2 for all Family 1Ah models
Date: Fri, 2 Oct 2026 17:02:04 +0530
Message-ID: <20261002113204.3358815-3-Vishal.Badole@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002113204.3358815-1-Vishal.Badole@amd.com>
References: <20261002113204.3358815-1-Vishal.Badole@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 87d8b5a8-d757-46dd-5fe0-08df2078f9d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1FkhJ5ttzaXtFrL4A0TDhDb2DiCnuXIKQzNispsEvwkC6s1dliDAzS2CN7eNAxQfCatt4WweEheEjCfPlKbDhFTTfdk/4/jC4bbhFgseOE5LBv7ZnkgWJIdh8nUwOC+I/Hy0DPKay+mmRcwqBBr5FwXEdiSv5bqL7qJqyQVFsTeHqMPxMNtODEQJabikHKU/jrksZL3KlJdOtzgQQ0xeu5k8pxinaCYYSIB5jjkZ3ai52s1jntLjK6PGmyw+q9Fp7KWdxvn67ylQg5l6rLqomP3K07G5qXViVlzkQYYSCZVMLtMmbyljBN7dAy8Vg8zml8XUqmbTWelqdcQza1YesPBejrWvzyQLpWikgS+lTq8RbIK1eBhdKVT9dUW8osLRtaeSdLiX2k53f0cVqBSXrS7XKJSgfpDglDFo+1SD7OSig+Etmu9hx8f/83jFWRYwiO0jH0l0jQE6g/3FffjVO2mlckUtUb+JJAW5ksHHRmtTvTqtwhoTmVnbdngu6CKjsmE+cia/U+P0/G+5ArfVIFhbCrJa07bWmzl30/ZbIgVutyFVvXmMy/EXjpQBJqj0OuIgSKIo6k2vL9JT59kDOygw6it/lESHjq5Mvj0GFKgrJkkpxP6laT1EbhTumPb77iwufa1TjVXOFx7rIlbdtg/XK8CW8qzWccj1Ptqex1h5tcroBFCLmTMW2NnektZwcF+T3qDAAKia5vPlRhFlrg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NRSMeW89F32scxnW6pZuikoUZDcb+JdB0NMeEgCAMGSC9iZaUdf51Qdqe3ULdacu0HIMGRpY236helKdrt78KgTjXvllwCbNfDXxHcoHcWsl11DKXSM2XnXKPzQ8drj3SIxIHBCQZ0gQVoijEsIhYyrCLbo4lQHkZ6yG6A9UisLL82hfhgFwDwe7/Tvagwf+Y3g/9CLwMuQ7lCZCmEat9FRZ0+MXpZJgwBQ0/EDgKnp45y9hQvLrUaxK37tw5jd0s8B9Wtjf8A/sTVIJQM4c+4VxVLHA0f5fKh+dS/wt9QH5n9Mf4CGssmxeUSIbncJQBIN2aPZ1WdD6EJe1FFBRhqnZCpJMQj3jdiPqFkdUFdQMITrV9h+ml4cSNYheVVpAmi4dc6oCskfgGK4/dxrjCZ0TklnwLU2TmNyLjqYkJ1NEtuZ8hCyoilVek2ORmGZE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 11:33:26.8967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d8b5a8-d757-46dd-5fe0-08df2078f9d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323

All Family 1Ah models use the v2 register layout. Today zn_regs_v2 is
set in each model case. This works, but a new model could forget to set
it and read the UMC registers at the wrong offsets.

Set zn_regs_v2 once at the Family 1Ah level so it applies to all models
uniformly, and drop the per-model assignments.

No functional change intended.

Suggested-by: Yazen Ghannam <yazen.ghannam@amd.com>
Signed-off-by: Vishal Badole <Vishal.Badole@amd.com>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index 0c0d11c72925..708fc1b4a999 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -3887,23 +3887,19 @@ static int per_family_init(struct amd64_pvt *pvt)
 		break;
 
 	case 0x1A:
+		pvt->flags.zn_regs_v2   = 1;
+
 		switch (pvt->model) {
 		case 0x00 ... 0x1f:
 			pvt->max_mcs            = 12;
-			pvt->flags.zn_regs_v2   = 1;
-			break;
-		case 0x40 ... 0x4f:
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
 		}
 		break;
-- 
2.34.1

