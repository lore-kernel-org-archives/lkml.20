Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.66
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794089451;
	b=PRl1ojsoQwOEHzubAH3K0ahF3QSBnCd5/jR0sQ2wPkAvvZIQ44V+PF26TOcuyelXwnzi
	 at9cQYbgyYIs32QUKSmtZQV/yI5Y/nC76RCEf91Tii4N9IyZiVRHCMBBWXsUt3SCuYesv
	 PPWFfXdMlD5QJ/4oEbGKc4OUWscpVOiywAPGlata6wNujp6bknWsyKr/+KU3Mc0LK+MTy
	 T/wPtF37U67VniiLzYkQ6rWPkI1j66cW7QMEZbSn8YjVBJZ6//CI1dqO/9amT4tRXV8zu
	 WFjy/CZMnNLDYt39aX4UED7FEYMGPItjshwEFR6ouDeB1JPQvRs5VfwIDBZlA9AY85w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794089451;
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
	bh=HjRHN8z5kzEctcY13nVZVeIlQ3Iz+PzQYEJw3hVkKWo=;
	b=iEpt9YrHuTK5xX/TpTj1U5UlZEoduV1momgodsPEalklgfhDRnaapyzhGSonhuoUN0fe
	 IbZ1k2jDz80mI1b5a/LQEEfNMMqLR2AszKjE8E3uYdAJfdWE65g6+/BgCc5Vn+nMPI1sj
	 4hJZwh0Ra0zRdcPKKWjw+mtHkM9iFqjK3h+AsNfgpVFmD8fLt/bEFtWmYQWnXEDZWaHMl
	 r4ZWvlBLakFykj7KNEZoLUUs9NGHAY6/NAY6o6Hr2Mn+X4HNTW+pUKQw5VUD+QQHC56cv
	 9zc1Jm8KbcxXfHJTKBckLnQ0NmOvZesUaJPloDF6gnAa+M0/bYbnatCikajoqV6N3iQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ld+ti68X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.66
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011066.outbound.protection.outlook.com [40.93.194.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD7B606A326;
	Sat,  7 Nov 2026 22:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BD7B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Ld+ti68X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZCBtCETNLRc+0+Eew15XhmQFow3p4h2H1sWYKRf1VhzuwNnHepJEEndIo5LZe8b1tAPxtz45OOCfu5lUyx/t+o36afBxeMxV9+Zj0DkZF2Fh2ATU2Z2BueqW3c/2L3JZWwVJEkgSYOUonRdDb4OX126ihq5GNdRRcyBIfEUrDvj0ED0RDLdoMno6z1luKcmxqMCI/ZMyU3KESIOx4xzPAyRqSPZWB5LdGyZ4EmViVXG3Ti0nzQmcEid0wYvR0yUhMrjTfPqMvkLWBD/s0e4h+2yNMmaJfwk0OjcnLxtMCCAz1x3e2j4opYo2APypQoiwrA8DDaNdcmU+WMV2V1Aeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjRHN8z5kzEctcY13nVZVeIlQ3Iz+PzQYEJw3hVkKWo=;
 b=IZktmG/cHaBATXNvJQ5UavXhw2ZzbuF1mSpsfOiYIHwzKRoTkvPLzDwu9jCtZvdUo/tGsEkjFqvLq0ZMOjBwOvHEDPB+NyRYEhTQ+BKBrGo8i+X6jZx5lZM9bghDbilPQT6YH9N2S6Dt2pFP/mxivgBOv+OoGfTwpJa+BIbgxg3O+aAJyQIcKPsIDe9fXs+sMYvbdIrzM99HOa2NIkeUgwAjn52CHWr6jYZC+9GtfvBhfnNJ+2pn1INcAVTUldKQcOM01+ib3AKOFDKzHnIF22ZVDbtkJjaj+Uk0dGnFrJbyt6Y7kvh4+PByKoe/WUJXoBT2RCKxLr3KsUhVIEKmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjRHN8z5kzEctcY13nVZVeIlQ3Iz+PzQYEJw3hVkKWo=;
 b=Ld+ti68XG8h+IN/PpWLdr7j/Zb9V0/e9AHwfR0MIPZa86sw18LdlFMxdE4YxCJTgn0gDAk6LdwsT6pr3nZLRdKITTxpgvqCsB92t5LI9VniJRtKyZw8WuQztz8eW/uGIEwegWoH6Kik8O0uGs5V6zdjN9mg2guwq22YtmLN8l2A=
Received: from CH0PR13CA0052.namprd13.prod.outlook.com (2603:10b6:610:b2::27)
 by CH3PR12MB8332.namprd12.prod.outlook.com (2603:10b6:610:131::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Sat, 7 Nov 2026
 22:10:46 +0000
Received: from CH2PEPF000166C9.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::45) by CH0PR13CA0052.outlook.office365.com
 (2603:10b6:610:b2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.6 via Frontend Transport; Sat, 7
 Nov 2026 22:10:46 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF000166C9.mail.protection.outlook.com (10.167.244.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 22:10:46 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 16:10:45 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 16:10:41 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>, <Poojitha.N@amd.com>,
	<sravisar@amd.com>, <Richard.Gong@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH 05/11] soundwire: amd: enable host wake support for ACP7B/7E/7F
Date: Sun, 8 Nov 2026 03:38:00 +0530
Message-ID: <20261107220913.4058072-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
References: <20261107220913.4058072-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C9:EE_|CH3PR12MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: b669de1f-b675-4794-14f3-08df3d1bf905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|56012099006|261102123227099003|261021121427099003|5023799004|11063799006|261009223027099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	RhxdDl4beZbgcHi2l4S6Yhoe5WIe37fliXQQR21hUbkVR8PmzgyGpHTHkc2Ewluhbkf4QZb3cI9p5zbynmmbYx4qLc8HdNOyZzbA04OU2yxi5hQWRoFhScx8JhrGbc+dzbIv9czciDeC458DJFmH8kyq85Q4j0acO32F2GppV5UF1uUZxpS3mMeNzPgi7Xqx1H0M4J+Z33a2rqhGtKMAsOIqNyiVfEL6tzriMQlHiR4kjFaF8mOixIoRwOya6CP2sX8Hi1Qi1SCC2UVlwjizPJ2GymqU6i98NIhoDxt9yHk8eLWu/3eEyci3RaJyFCWP6xfuWlgOvFTCg1XJBLpm7d+cP6Wq2Gvsl+CU5zXsU8+mEPNgpyWBG8JUDpZmyV6eRF8PngfEL7OMH30goTzEkDK/+oa/zj8bMrIC4Vs3e2Z2RYVadXoYrAjb9Q8GwPGOCcy9m0uUthJITUcKZBsg2M/FY/v165IgbCml/tdyqYNjFYvi5lRkEm9DsDhhfq8py5GunDDtkuIAmXiA1jdSLKsvvWKsQVFGnJwADRXN5Xz/ivzCNDsjT8gKiuOV337CUN1fKhRcylBBBCZsKdwsUt3dCFA7ng6OVmziy5gTkWoueIjg85miSv94yN95KQvv9eHc7/uQgPfe4Nfmsw4v/Ck+CPS8wKXuxd1we7JHNgHs8E8zvb2j8eDNrBErwcpCw/4OmRSO5h7BabmvBEv+oQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(56012099006)(261102123227099003)(261021121427099003)(5023799004)(11063799006)(261009223027099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JBTncJDaCV7qQGYz3DfVHf/TZiYxijZrbHLY9A77HiXqAHgKmMlcfHnyXGIHFHNRmH0sTsE8MHn7MRbFyySmDeBYPCBvvDHB2RVvinB4r4yldSFDAh1PUouFD/t/nwwva9ciuIXVi2RtyAOLrTU5Q6+rsDlK2ZxsxVnum1MVykocnuS9gkzyiuDdSZy/r9xhvn0uXlWX+E1nzGqCojO3bw01qNoAYutsrbN/xP8ihGOyWbUAMJMaYb1fLc3/mUDA4SlNFsQNPnYyuyLNYmxptr2xNecqy0sqbAiC2OCPTtbkUsAxQveIN/wZhEDtyp2wTGeSxWdexhSIWY4ADosFckBmAgx0L3BH9XHy7EQj+lkoUzGI4gBpGSaEL5qtJbYgnbOiXARibKsDB8wnWd4qMD/K//JvJW0iSdayQEp2qhD0Jl7g2YHhMTqGX5y7cDPI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 22:10:46.0830
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b669de1f-b675-4794-14f3-08df3d1bf905
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF000166C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8332

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
index b16fd5b032ec..1f0575c6942b 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -670,6 +670,9 @@ int amd_sdw_host_wake_enable_by_rev(struct amd_sdw_manager *amd_manager, bool en
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

