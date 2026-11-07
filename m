Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066538;
	b=ac28YYR6rT6lIcLYyNmRTyQ6vWL00bohEXhquBnJeN0FgOj0YuOhJcWfmhqcqInL0GSt
	 mmI5q48XU5mvBVmMPkc2YffYIUb89r5UPik3GoCOIhQOqpa0rH6JZHIFZ/f9cwa56TyGx
	 ctpuUIVg+2xf4yg4gRXHW9Sq1tht6KVQMuyOPbhLJnTVG+3cTiIWBBv2PY3pxUeFN8ez3
	 uoHHSo5li4f7D6af/1Si6x5IRXJ07WE8l6Pl1Nl8EJa4eEcFGjkGvNOgAgVWUE5WvAQzi
	 KR20y7ZGXUPhBCMhPJ4+T9oSDweR51sYF3DkQHo59BltsPrcPRRGEP81R1KUdSaeLWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066538;
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
	bh=kRMnOBFfyyNnPhnuBRRKqaqJF3UWN5yNH2gy+qri5+M=;
	b=evKgacINDB8B1HjJNEOSfxo21Z/O4j9OLA3Wfwk70cMa37fkgtruVe1O37jKwxE4pvGQ
	 jnTVBEh57nqAhzeV7Ks3vGtEl8sS5/TjVlsWgJUxWu1RjerzsOOiD/67ftSRKVR5VTS+H
	 JxSAefK5wtnIH30gjefaYf6rXrkTsflHtCOFElBp9X4Q118veGSQLxfzClaKm0EmIC/tr
	 VWEcsgoDXjXnoXj2SRzM8oTUW2OGhHsV9VKEDLyyAlt31d30qE4DofK4K1kk2+S4XPH0i
	 UPTgS7ajTuhi6YuY2e0NZyjDbGs/x7wcCIOWN+9Ka7AvnYKbU5blcgyVWQ73ock6YFA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yukLRwQE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.53.28
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012028.outbound.protection.outlook.com [52.101.53.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8889606EE8F;
	Sat,  7 Nov 2026 15:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8889606EE8F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=yukLRwQE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yRePPGoPtdt/C0SBY2diHim4ZJnTIBC/+okEUv4cWmAcwumqdRN5Zahh/wyb/6KIemGru4m8U3UnGqOVfEsFfw97LUr7gsCeBONzI9r1xzPR2/5ZKBKVLRXN1NQrsCsRIw2OAgrQy2W5leNI8rZw5NVNy3X1YeO0HfhgeHd7rAxXrxf8d26C6s1qNssiTLc3SLeLCpbuNsGm6oebiW9D1bLeZ/6qoMS57qcg2wwnmPcPFEjLxxezDjO4oTD7DL7UuChokC76TiBhURZR27w2c/CoRTjt6hRxLs4Vij27AYUcGUqU+/i6PNsIWGxdR47RFkG/lPMDpSg2mQun9NkcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRMnOBFfyyNnPhnuBRRKqaqJF3UWN5yNH2gy+qri5+M=;
 b=VBdMVyfcOMAFUGx7ktxbiV2kZkEemkox/9HmhIwYJp3tJVBw/xhYlA+3OlfU6Ab8TtNnCr5Uhe1hOqkmlIOFZP/Rgr4QGzI3TOFp3d67SHDGf6eVqGLB3MFqI/xSKOkfMuIElZVyeb/CJ4dj6SAF1quKIO+/OQ+wLhlL/hZYvTQHRXclKiHRjzup7hI/F+8Ggl1tuMg45ICG38Yq76ytfB2jtLASnROzBSpF3n4snn0y2vuM2OttLs+O2UpeaTBql8cF8O/DwHE3QIYE3nyLycURC0uj846d1ksFiCATBoY9zhs3kZfa128mePQjsFmR7vPLFg3gUzSne30Cg/YZNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRMnOBFfyyNnPhnuBRRKqaqJF3UWN5yNH2gy+qri5+M=;
 b=yukLRwQEst9bNqv94pgtKExiIcn4/9uJCGmUuLlEcVvxcmIxCrW5n88wLFwgrUEMdWOuBgMYYWNyqqKaAQ5y6G2zJAYjkBng6rb2tY7B7JjntpOAJF4iOb6ZBc/ufB9sU2x8JQ2qj8pZvROtbWO4raDJoMyLctpl/rQk76FADw0=
Received: from MW4P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::33)
 by BL1PR12MB5850.namprd12.prod.outlook.com (2603:10b6:208:395::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:48:53 +0000
Received: from BY1PEPF00026966.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::5a) by MW4P223CA0028.outlook.office365.com
 (2603:10b6:303:80::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:48:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026966.mail.protection.outlook.com (10.167.244.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:51 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:47 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 11/25] soundwire: amd: clarify bad-state guard poll omission in IMM_RES_VALID path
Date: Sat, 7 Nov 2026 21:15:20 +0530
Message-ID: <20261107154659.3358223-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
References: <20261107154659.3358223-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026966:EE_|BL1PR12MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 75078b7b-4714-46a4-c3c4-08df3ce69f8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|11063799006|261022075727099003|56012099006|261022105027099003|261021121427099003|261009223027099003|261028144727099003|261102123227099003|261026140227099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	0LSO9HhkLudgGBz+WwZXT0XXDGCHyUdY97UFM+6Eqdj5hTqbq3Ss94qrCyL+YOaUtE1roBYcaMj2rBPSaTA+rufypsl6OnwZpG7D2Jg0wCLcnpqbULcYljVV9F+A/BVqCLtavl4Ma6I/J3qx5VRunksZAwpu/dsfkNiIpzReQ2leK+Lc+0tXgugcFMLjOlWFbZvPfx/XhXVdhSmJyiSnH3zS366C/+gd6ZkidqetfgCeTqYZpaM2dpS+VN7QjAAaLXUZWWmM71c3xTi3I6CKrdKWNUGcgZG08HHM2wa1w53xd8+YvW7mYfktuj7br2kS41LrP5BiPFpsxpQv1DnZ+hLa4CLgy07KNLC3kXZbvSSae0KbB0KHIY3RpyfyuAv3sy1+dR3IDP6XDxLPQ7iKQPwbkaatE4ZCmlraFyN1JotKHD92A0UrVwUZWaRcQnDJ68Dkz3rlE5oQrBTuN89vITc39PxkMoCEsYdtmTkMfCyv+YIBNDT6BnJfXKFTt2IMUP9ZTEdgMpbPH9umh9ZWJ1VgUPihVpxDKuLdWoGnXk+JGId4SpKWWUJDyz73nakyC2a4d+Rin+qoFgABlPVnAFfIBObB1MlbzLdmilMW+fp3iTtOjZMsxlQqlHbHY1OPdsB+ha5WshBgXTg3d2JjUQe4JD0icT7TUCP+Fm+3uXlB62uTrMKJCRHuNVJKdcdcvFMMu80sNg6VV8d0CBleKg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(11063799006)(261022075727099003)(56012099006)(261022105027099003)(261021121427099003)(261009223027099003)(261028144727099003)(261102123227099003)(261026140227099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Pxh+6Ef2ExwEG3rhq87Bvoqk+Sq7bow4TFWfeSuyVwPSb3tAf7ZCW7kTt7F7gnk6wafoas1GZ5PWjYIdqU69GiV62KdLv9IbaOLKg7hmLliMXDMGOuJYHOMZ/Ks2fq3/oIG9SycZesj63ObH/FKXZo9rDqBegdQlgmkVNbjERmpFG1ZDN5vWivZ3JFdo3saHp8BYk6Swntt1r+rh8oReQDTQuuZqJvD6mutlVGXORidnf+DMucqkWV4MyIVuhvhiF6bzrH+aCjb24HpKmSF7hJDAVkQmjxs1JBGuIH7WeEc9w1gc0Jjv/RrnWrYfBtFNBPOAecQ1VGkutyQhqnXj5NG14OTNyjfOIQquOPKS0sCSAOEyxOptkQgeZCznlGplSim1rjtl1Nc/vLDVmj/CuuJo/kCmNQ3mbdP9qkgJvK/Y+eDJL5gOrGUARrwAJYfj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:52.5452
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75078b7b-4714-46a4-c3c4-08df3ce69f8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026966.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5850

The bad-state guard clears IMM_RES_VALID with a single write without
polling for the bit to clear before issuing the next command. Add a
comment to explain that the poll is skipped as an optimistic recovery
step: the driver proceeds to issue a fresh command regardless, which
will itself produce a new IMM_RES_VALID event.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 579b12946c0c..d8b533875b9a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -365,6 +365,10 @@ static int amd_sdw_send_cmd_get_resp(struct amd_sdw_manager *amd_manager, u32 lo
 
 	if (sts & AMD_SDW_IMM_RES_VALID) {
 		dev_err(amd_manager->dev, "SDW%x manager is in bad state\n", amd_manager->instance);
+		/*
+		 * Skip poll: proceed regardless; the next command will
+		 * generate a fresh IMM_RES_VALID event.
+		 */
 		writel(AMD_SDW_IMM_RES_VALID, amd_manager->mmio + ACP_SW_IMM_CMD_STS);
 	}
 	writel(upper_data, amd_manager->mmio + ACP_SW_IMM_CMD_UPPER_WORD);
-- 
2.53.0

