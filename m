Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066629;
	b=ER4kjhbOFYX8HbUw3BsGei7V03ddO/8AaNXbrsyJWYVMfdTX4rtD0yO5cIoMS65iM8GL
	 2mJ3F9+gFCTvOlwToZIey+6c/9Ah5URb1ZKsqC/PaQRyOBbucIqzL2jCzD4xCP0ON4Q/3
	 VoNEYtUss7MCNpi5eS/3Q1lgqTp+/fGyAhkEtGZuzb8SVELtdPCMIMkOMJZcHLu2SV0HH
	 9dl9UEld5HzNR48watqSVtBzsx1TuEAambKLq44plqnrrvwyRioV2dyrirc+7iL3ZewA8
	 HkV3NCtlNe3y9XoUAgNiEdqcweEuKo/qZ4rxuGNFc2RpZ/HhxOQu4rwjHTUzWR3SZUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066629;
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
	bh=aHDu0VZ9yuZ+JP9jxBVrsIpKiWFqeWiZ7OE+p7TQJOo=;
	b=iRcXPzSPlJGLArhueUhpxAItYk6X3T2vRvsVG2vaSHydiX5jjmPZGTbQQ6gMinqbTsDO
	 xDw1uq7gcqPQNNlG9S+7LqA4q0C/+ZSJ/1V+0DZa5FjYp4BuZeSJwFHMmNFkhbv6k1BsZ
	 RqM/trzLVxQhsuUax7gH2AXv26L+jm9dYESQzFaaMreSjNw3vpI6ulx3VYEQAKnEqV5NH
	 pZFHzYb/fZ5NcjNnzf4ZqpmqRUIn9yNx/iUKOH0ifNVHxpBoTok3UCbSMIQCOpDSfu2Wc
	 8Qfv98dPJGhJM06EfSuAJJALZFQu6viyQ9kNa8OwOxSyahYvd9T4u8vp5TBNQTOxmtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DgvbgCrI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.59
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29B5608360B;
	Sat,  7 Nov 2026 15:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C29B5608360B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DgvbgCrI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tq420eOmK/EU2BZTvq3Iu0EYIB4GPqUctJj/ZqLqQgyuT9B0CQLHdzY80puu0dcA+w5vGxhLsxQHbLttcM/jwgLyQePc9PuKax2rkLHahfQZ5deCKUMsdC/wHZVBS8l2HdOuM3/6bqRHWQ0/9HDVqgRd2+STINRB2W05Wi2sI0cM9t+TK9e7m304r1IM/0uHfZRgCn0vzv5y8JKjp6vAOGMd6HBB+puHzr4ihmTz272NUtZxj/iKdnqM+eKSz2exROlsTMuHLSfBGoYtDGLofyWyaFwuUBXjUBiyy5ZHw5uIr/3F6PQyMg7LbrBpqIE4Shs6OO/V0xDngoGrmjkQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aHDu0VZ9yuZ+JP9jxBVrsIpKiWFqeWiZ7OE+p7TQJOo=;
 b=aA6YfCJ5FtxHblbPMB9NC7iTX2n9bWrMuYIZrellq6GvTGTMgGIKSO/NTLI798H3pCU5ABgP39NnA1LKEA2v7mib2ATQm0uGy4uLSF3PuTt7X5bEczmwuoec4171IA8ZqB6Z1lfIy00DFDPmA7BYgPO/ktktsz+7Dk7cpWsY1qbrcV6zzDAzU5opVQ3XTKbm2Lc9AnuTcSVrRO6OPBDXhORC1sRRP+qG/8YGz7m7u1D7qmfiWQwNkHUB5wQJjZ0OPLR0iLdt97zcPgJLKKbA5CyTEPz5Sqb7lZRDcOlLE3Zu9W/+gS1bS1ylc3lP6MNeuMOQafdy2LdojhUd1tpCrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aHDu0VZ9yuZ+JP9jxBVrsIpKiWFqeWiZ7OE+p7TQJOo=;
 b=DgvbgCrIFFqKLVGv91m+g9rQ9sCcpp0MPwiLZA74Xc94eLEZ8aY4EGu3OT14f5ThZX/OSju/PXi3TIIykowwAEgv1KhaNWX7iL6xRp3YXi0jv+MvrmpALz3okhjDctYeTcBfkaWCZMxZJLuw67ICqAjytq2tR8RIkLGYN23zGqg=
Received: from PH7P222CA0024.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::24)
 by LV8PR12MB9183.namprd12.prod.outlook.com (2603:10b6:408:193::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 15:49:42 +0000
Received: from BY1PEPF00026967.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::5a) by PH7P222CA0024.outlook.office365.com
 (2603:10b6:510:33a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:49:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026967.mail.protection.outlook.com (10.167.244.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:49:35 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:49:35 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:49:31 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 21/25] soundwire: amd: replace >= ACP70 with explicit switch/case in PM paths
Date: Sat, 7 Nov 2026 21:15:30 +0530
Message-ID: <20261107154659.3358223-22-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026967:EE_|LV8PR12MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: ab9d0c5a-17c8-43df-18bd-08df3ce6b96d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|82310400026|36860700016|261026140227099003|5023799004|11063799006|261022075727099003|261009223027099003|56012099006|261022105027099003|261021121427099003|261021123027099003|261102123227099003|261026121527099003|261028144727099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xvw7k2ylG9FhGH0CGsgL9BuXlJI7bnTyyrOTHYe4k8RLM+K7XZqgjdP2XBxw7h+V8iJnPSpDUG9Duj4Bmc7oRtsVBhd6BIkp7GUAtZdtTaBTnHIQqrbfGx1iePDIY4l5pKrvVJplTIHmacRWwzPE/NYEQL/T6gi5Egows90tEQYsa/krPA4O9xnb7LqZQuTBouZg6/bBVS6XIXIIBTsQ19JTlcZVd938ewAKngYXUgpHLHbzeLRH+PGFj4nEuKGtHex+nFhZxUEWrsEjkr95ThNpD1fbN48OPx8tYvrIv5yhlwd/LPXhLeD9Flt3nTnNJgfaRGm9umw8XAewzmM3SMIsgvDANhphZuiIRtqvQL/Wp4YizASs0eblkcXVrn4NHTN4xHWyVIb/bI+JxeHG8WyEru9Esybn89LhMxuX66MDkQpYOMztD74Glzgj0DE0DsJnLVYtxxIaWU8oxuWuQubnKwYwPmJJAj7HAXNaj93MWcaaFh49ZgUAh3/kPN6zdiICFFv99rCOW3JrpfPYUIFVCVozS5a018b83VNvbuMgwL5TGBf+ExDeWcRqP6uBPphbiAmLb4aP1MQh397lS4jr0h6+29BYqogYBmcN7K3eUg/12ENeB5rVzR0HYyiv2ncuVEcqvo4N/Y4w7n4zaC6okwdG3+U9uR5RS2fhgqbDs7CHlTwx80frDDWwZaXvmWSImE230Jk1520wUg7J2g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(261026140227099003)(5023799004)(11063799006)(261022075727099003)(261009223027099003)(56012099006)(261022105027099003)(261021121427099003)(261021123027099003)(261102123227099003)(261026121527099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9RTcXHaQvg0IVYU2Xxgi5tiD4IGMFqEwQdCmVbTYIuVhRq88GodNfW7chxeyw0T7hAe2WthOP6MKh6sCSq3Kr24XOrF1TDIik0rthCu3b43ySmn1mZOD1SsUPNZFRWilQvvKohm1rUcSMRWTG6DSsGxyFpWMdjHW70uL+8Q/xt+CAK6vfKPrj2JdyyYxEunH32zQbE/LIBGM1Zh5QSMprljrhgUdPd/Npo4vehKDDACDTremqdhgLdo4FWpR7JGME3/J2Fhjae5OacN8rF7+dQQ5WRANyhmNw9sIKmDKNktYU0tp9BnqdABhFzyycXO2cxQHl2z1Q/pSzXcyrHC00lvzCeQZ8DeLfFUBWqIFvaY/RuBlEtbFQYCVwEE7Q2g1vwVRtKQagow1GD0dRmrBFI2hUy/j+XCBRJdncx1Yc4KWacuT/foh/1W6gmLb4GqJ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:49:35.9710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9d0c5a-17c8-43df-18bd-08df3ce6b96d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026967.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9183

Replace open-ended acp_rev >= ACP70_PCI_REV_ID comparisons in
amd_suspend(), amd_suspend_runtime(), and amd_resume_runtime() with
explicit per-revision handling enumerating ACP63, ACP70, ACP71, and
ACP72, so that every supported revision is handled explicitly.

The host wake enable step is guarded by acp_rev at six PM call sites.
Factor that repeated block into amd_sdw_host_wake_enable_by_rev() to
avoid duplicating the switch/case at every site. The remaining device
state transitions keep an inline switch/case as one of them carries
additional PME handling.

An unrecognised revision cannot reach these PM callbacks because
amd_sdw_manager_probe() already validates acp_rev with the same switch
and fails registration for anything unknown. The switch default therefore
emits dev_err() and returns -EINVAL to make the unexpected case visible
while keeping the error path consistent across all PM operations.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 100 +++++++++++++++++++++-----------
 1 file changed, 66 insertions(+), 34 deletions(-)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index b6aa05f5f6c0..2b38b9bf97f5 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1407,6 +1407,23 @@ static int __maybe_unused amd_pm_prepare(struct device *dev)
 	return 0;
 }
 
+static int __maybe_unused amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager *amd_manager,
+							  bool enable)
+{
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
+		return amd_sdw_host_wake_enable(amd_manager, enable);
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int __maybe_unused amd_suspend(struct device *dev)
 {
 	struct amd_sdw_manager *amd_manager = dev_get_drvdata(dev);
@@ -1422,22 +1439,18 @@ static int __maybe_unused amd_suspend(struct device *dev)
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		cancel_work_sync(&amd_manager->amd_sdw_work);
 		amd_sdw_wake_enable(amd_manager, false);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		/*
 		 * As per hardware programming sequence on AMD platforms,
 		 * clock stop should be invoked first before powering-off
@@ -1455,10 +1468,19 @@ static int __maybe_unused amd_suspend(struct device *dev)
 			amd_manager->pad_fully_torn_down = true;
 		}
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
@@ -1477,11 +1499,9 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 	}
 	if (amd_manager->power_mode_mask & AMD_SDW_CLK_STOP_MODE) {
 		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
 		ret = amd_sdw_clock_stop(amd_manager);
 		if (ret)
 			return ret;
@@ -1494,12 +1514,10 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		if (ret)
 			return ret;
 		amd_sdw_wake_enable(amd_manager, true);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, true);
-			if (ret)
-				return ret;
-		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
-			   amd_manager->wake_en_mask) {
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, true);
+		if (ret)
+			return ret;
+		if (amd_manager->acp_rev == ACP63_PCI_REV_ID && amd_manager->wake_en_mask) {
 			mutex_lock(amd_manager->acp_sdw_lock);
 			val = sdw_manager_reg_mask_array[amd_manager->instance];
 			amd_updatel(amd_manager->acp_mmio,
@@ -1514,7 +1532,12 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 		 */
 		amd_sdw_oe_ctrl(amd_manager, false);
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D3);
 		if (ret)
 			return ret;
@@ -1526,6 +1549,10 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 				dev_dbg(amd_manager->dev, "ACP_PME_EN:0x%x\n", val);
 			}
 		}
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
@@ -1547,11 +1574,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		ret = amd_sdw_clock_stop_exit(amd_manager);
 		if (ret)
 			return ret;
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 	} else if (amd_manager->power_mode_mask & AMD_SDW_POWER_OFF_MODE) {
 		if (amd_manager->pad_fully_torn_down) {
 			amd_sdw_pad_ctrl(amd_manager, true);
@@ -1571,11 +1596,9 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 		mutex_lock(&amd_manager->bus.msg_lock);
 		amd_manager->ping_slave_stat = U32_MAX;
 		mutex_unlock(&amd_manager->bus.msg_lock);
-		if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
-			ret = amd_sdw_host_wake_enable(amd_manager, false);
-			if (ret)
-				return ret;
-		}
+		ret = amd_sdw_host_wake_enable_by_rev(amd_manager, false);
+		if (ret)
+			return ret;
 		val = readl(amd_manager->mmio + ACP_SW_CLK_RESUME_CTRL);
 		if (val) {
 			val |= AMD_SDW_CLK_RESUME_REQ;
@@ -1601,10 +1624,19 @@ static int __maybe_unused amd_resume_runtime(struct device *dev)
 			return ret;
 		amd_sdw_set_frameshape(amd_manager);
 	}
-	if (amd_manager->acp_rev >= ACP70_PCI_REV_ID) {
+	switch (amd_manager->acp_rev) {
+	case ACP63_PCI_REV_ID:
+		break;
+	case ACP70_PCI_REV_ID:
+	case ACP71_PCI_REV_ID:
+	case ACP72_PCI_REV_ID:
 		ret = amd_sdw_set_device_state(amd_manager, AMD_SDW_DEVICE_STATE_D0);
 		if (ret)
 			return ret;
+		break;
+	default:
+		dev_err(amd_manager->dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+		return -EINVAL;
 	}
 	return 0;
 }
-- 
2.53.0

