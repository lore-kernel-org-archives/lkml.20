Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.25
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794902666;
	b=li4BLHlWy09XRVmhSMu8VwC1hzTxuByRc1sMYm1qlDuckUa1Bnw5qkX1pZAdKen1tr5O
	 +NsCCQJ4w+thlW2hw1Fkvs4JUukwYlcwX9AwI043i2nr1uv5twyWl6N3rStKrAc3i2lCo
	 qNUILE/owHRquwHfZlM0ja/EU04mPlfwFlPgpokZIZTYPX+MMAbk+ghoxW0MLE0445Kc2
	 1VjTlT25JJc9pC432Xh69+Fg5z+KC+stGG9VpXOmnsk/s6XsdUJkA9E5CO158uokYzXWt
	 94yryXXKNurbFiTuM+9BzRf35V0VP0WiwYPg8inLNSjrCWNZnw8vB8V6ycPOu4OhGZw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902666;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=ZDfSGLNEX4RC0SQh8jsCdWLwigrQhWpCvvgw+zCJ62Q=;
	b=Klhvfc4w2dYBot0UrNCJ4+Mymz2MIHywFS51DG9YLUdvDw0JEgkxcsDTY52q0d+MSH7n
	 3TTFPjhnZDTUaWmHVs0Uig/qTIu5tALuzE035XvpP4p2K0SKTkmi2yR8Y+eL5EZ17wTmC
	 R8DaCul5QRb+ZCNYGSuv9higmfxBFeoOmYYlz1BDgoP0XCfvnx96htyJYcy0KxB7LN2Mg
	 tyuHFCYzgllMAb5uR+2h29DRm3OdF7HHWCZ6MM6vldDyeiArwgOjLOHG9FWDVAnG5+tqT
	 1U3w59KklE8ZtQtl6kFYITurVL/yZhqa7Qonf2uAjS2e9VSxc8X4z3EgHF60z3Vj/oQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iGjmxDeF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.25
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013025.outbound.protection.outlook.com [40.93.196.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED9606A323;
	Tue, 17 Nov 2026 08:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4ED9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=iGjmxDeF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YpXb7OnMsatR+PCngKZLPpsslz91VsOWuG33wsxq/lrqBs3PDRdoFuaqobB57/SmAHa9tKoL1O1DU5P+STdfCQZdYFerfRi54wSUAbKMyA550Xi7GV61gPcesp0SagkjRJBCYBUwSFyTTu+iCd/KKlVNvaJABU6gFVLHgt+XlVmM6CZWwYKgguuaQFvsngS9JgsmOP/vlH+NlXYxf7uRR/W7DnAe9CsQfD8ZM09aUhJvkbjU2TxHTNi2U/St7e04oAKL0+CRwY23Imo/r2GsS4aiu20GY1vMBBOIIiCiDsjQP/bVjfg/l00Vx5CpZgz5tm+yO8y3IRkAj5OKx6PdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDfSGLNEX4RC0SQh8jsCdWLwigrQhWpCvvgw+zCJ62Q=;
 b=IH8u7em9/BdLXb9Why5adFh7q2EV7+jIRYfoTeDCFgBkpC0MCQrdFk7G7d2iCnq1wyIdFRgei34D49M97mMrZ/vkV/L8vCF4blH9SYl0MJ0gblt6Xw5efA9cVL3+G1y80d5E5ESZZc/E1DqhnOB79nopEVIjCoyR6pJUGMiIqIp1kmWHJZicNyhHjUnLXQBGLEBQl0COlbjS7luooZP+1ow7D/EF/OEOl3dELHArrX00G7ClyZUb87t74igWwa+09FFuXj7QHvuxzGW/jXUP17S7+wlQR4Wh4ABqNY3MW4c1gln5ZG9sMFVstCU1O5CLV4evZh9QBAHb5mgJFVtqLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDfSGLNEX4RC0SQh8jsCdWLwigrQhWpCvvgw+zCJ62Q=;
 b=iGjmxDeFfpd7bUqx0JUjDiP+qnVXYs+tBr+EzoF6AY1YyjhT1uEHDsXCipT6XTA4/8EaeOsDj4hIh+hgGXkBcBpqzfB7MVDo/fJoi4YtZqOucbU70Erefdjmvwc8ehJGpkErqCmkQVrEAPjNV7yi1vYJiDPtd6f65IOXBpDzwg0=
Received: from BN9PR03CA0063.namprd03.prod.outlook.com (2603:10b6:408:fc::8)
 by DM4PR12MB8452.namprd12.prod.outlook.com (2603:10b6:8:184::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 08:04:21 +0000
Received: from BN2PEPF0000A98D.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::3e) by BN9PR03CA0063.outlook.office365.com
 (2603:10b6:408:fc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 17 Nov 2026 08:04:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A98D.mail.protection.outlook.com (10.167.248.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 08:04:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 02:04:19 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 02:04:15 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v2 05/11] soundwire: amd: enable host wake support for ACP7B/7E/7F
Date: Tue, 17 Nov 2026 13:31:44 +0530
Message-ID: <20261117080239.918428-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
References: <20261117080239.918428-1-Vijendar.Mukunda@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A98D:EE_|DM4PR12MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d996b4e-5c03-460f-50a1-08df44816320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|5023799004|11063799006|56012099006|10067099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	To80jU+JMXN5schzTeE3zN1G06fMR3kMefyDxNo4fW6gFDOGVvPVGZpni81aPbrSRNphyEK93GMEnAPzDkqXr/EeyXjqkR3KJssplaSqqRZhOVDjea3bYM5p+Ua+xbplVuXNbru9coHyE6AjJpnAhluHZcSWcLyWCUl1xrUbldQGNfzNa8Ynu1r2BMF2SMi5DWDFGys7I07ypMPM/aoOQ5uMrB0MyJOfG5pPWjlirGmKXFf1v5YVSBpN5tBQkJEBYCleA1jpyEqEOBxIXJEQMxrL7Nie0L241dl83M+tu5ClAQgBrqEf/x+r8j2f78N5PHYy4qddocGo4b0KCwQRUZIN3xrJDiFeA8gqq+ZEcIkF6EA5ln4E696L2pYLRUIHU6eG8dmnTJWCLvX0cceVw3se55agyq6QeBiX7yqmUe+WEoLL7AOUK23809VOFwuLPbAzk0M1GbadImpTIbzhcPxDp/kYKdVF5eHv7UK7iFBFc8JnKLp4QGG85rgACFBB9IX0ho4ERXQPzDv6BvzlTLevs0jZS+c8gOK+1gIfR0UYARlteay7IMKm4RRioGot6B54x2VOGg1pKqGolbfP/KlRlJSDrr92NkOROMOPOJ5jzNHQRsWhjS1WoRkA7JJH4vN+k+JsVocUJHpYRBqJH6G7sgb2sH67tSyuRyV0uCtk1STbG3SwrylVHv80Ha1e/p6dL+bg/iujSqNT0iwgug==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(5023799004)(11063799006)(56012099006)(10067099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W6/vFVXHqLkdJRsiuBY7eywA5nAAjAD50IBVpsANqsMXth/IpqRcdhCITe+n3GMJJ4ZQPYCCSsAvIwu688/5ImJuJ/baFP7Y3ZyymZ+X7iy75l/QfEZYuhb+Jv2ZEwfcV0RPtZO5OGvVtOuS5u6o6cvb+6xNRDab2iuWq9G/D+O5C9n6wLz1yLPLps1mLaYmYYkfbnS3ZL7/kLkb1TkNT8g4Ms46A0hRO/xEdtauWDdJvT2UVyH67qQ6hg9XskMl++XKCZ4djdLVEnr3WwXQlP7vzCuDTiK/aUJMozAhKpTgFXJnS52X33eDuILrGyCSelKQ0V0yC/PZN29A9OCKbaapm939YOs8ew7o02Z2XCppm09skNKpmwt0sgKVNDsY/vZudfa4/xNV411JOCr2qa0mFNHSIPIC1M0lD2qi0udVp+cR+SrZpMhGqqpqUt+8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 08:04:21.4044
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d996b4e-5c03-460f-50a1-08df44816320
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A98D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8452

amd_sdw_host_wake_enable_by_rev() previously had no case for
ACP7B/7E/7F, so host wake enable/disable calls would fall through
to the default error path on those revisions.

Add ACP7B/7E/7F to the switch/case alongside ACP70/71/72 so that
acp_sdw_host_wake_enable() is invoked, which dispatches to the
per-revision hw_ops->host_wake_enable callback.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index f74ae24912e9..65eb17669d54 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -657,6 +657,9 @@ int amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager *amd_manager, bool en
 	case ACP70_PCI_REV_ID:
 	case ACP71_PCI_REV_ID:
 	case ACP72_PCI_REV_ID:
+	case ACP7B_PCI_REV_ID:
+	case ACP7E_PCI_REV_ID:
+	case ACP7F_PCI_REV_ID:
 		return acp_sdw_host_wake_enable(amd_manager, enable);
 	default:
 		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
-- 
2.53.0

