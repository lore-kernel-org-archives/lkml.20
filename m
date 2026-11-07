Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794066524;
	b=Wa8vem1j/IjIBh0lxa48+wWDfj2IYOhTCoMTvU7D2gZmQtt9Lkh1IFj2z+KuxUlykEw2
	 SX8YWqJ4PQE1G4kSYNb8N/CbZEUoG8155Y3aTPKInqQdLDntprQm6gLYJfdIMedrx9zLX
	 o7fl1dMatPvubi076xZJJN3BBBog/8buPTZ5ppuo4pxiCQ1RdFqvoBNQoGYLUZ09Qlh9H
	 NdYNqWPSZRZtOryh/Y7s4GG2Zvya8wjQrfXUwz/gP+PBXG6XDAlwppY8xYbHdCCns19Oc
	 EmrKpISy7gxslZc/BxTrI72tm15Z/WaehWet5Ugqh41lxlsN/oRneM+eJlnh8SvxwTw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066524;
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
	bh=Etvduq8AYvwkI8WD1YUNm2mGgk0dI0B/qcF/FTUh5W4=;
	b=rEMSohfrA86Kg7WZisFHDoKoa4LASFyXUnKG8F/uYSKVOorKhrBnROe1gJQnsY0mhal3
	 7Q64oDjn3PqMGfgd86SNLfeN/cnCEIpz32hNFazSwPL4yMJtyS2OnczstzfB6gAQA87Jf
	 UYNfi/nONFzzT2ehgy/B2a/9f59aFwh6DzmPezqHnsatR0vNLDimPmfG2rwI3r27YxdlW
	 xP5n5vNnQ4mSudvu5w4wGWuSH99SyGUKx+pR5uS9XrKfi0jTeotuWckIDccKLrnUkgFp4
	 KT8+ZXaSsCJoVBs7/444yyMuAhmc9U0mz5K9HXQToMwF2bV+pDMHSyfrI4jyHSQ2CCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="r0XkoN/N";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.59
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE2A606D814;
	Sat,  7 Nov 2026 15:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BE2A606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=r0XkoN/N
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay3qMULwVbqKtBjyqHLS8TwyaJevQJ78QMNU+3A/RwIhpd6qexjOLL60oZZlpZcds19tVoJi3TkNkIhjw0nrNDNfSNOo6etPCEgg+S9f0nRS+bqU0exD+TxjNgBJlt8H/eR+4/0XVYqy7sBTyz0o69LqMYBwsf3xCFurovp1qgAAONVPiBbxFm+kK5GiMNdgHVP+R9dHQkbNVAbVaZ/PsjGK7O2mkaebAvFo+ajQ9Tpmz3qglDbgbu5JRcaVZvKuwgLJx84jQsEI4OpKvacGkc807Xglc0jSBLI+c5WiI50JFz0YUyDquSRiLTB+FsN9N3uoa8N6V6/tNqgefUfoig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Etvduq8AYvwkI8WD1YUNm2mGgk0dI0B/qcF/FTUh5W4=;
 b=E4oenqiYVi9SfisDXPVM0mfYTvocXcoXbNkFy5v7M4UQOaEruVnMq67LZRvNxJF8Bt88LLcjHiA9ClteMjvhN0KLEVQOnHQNR9+zW2Wy4bp39C1tF624zFqLC46EACrsS3IaUa6bMKf1NehmIIZjcksPUozS913mfuKtRFj3gwnwovli4htDSO2zsLV4oNUsD6ziLpi0nzdLyG+LOzA8VebY3EvAOTA2smb3oOHrNyUdiXjcOGhYyUhpCBR+4tHTZekBH1zSzc4wPqgDgHDKlhqDiwN1oUbp8kXVCITM0tMSO91Iex5Pr+ELUsoTVaP4dU6S5Q1UraPFRobgRCpa0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Etvduq8AYvwkI8WD1YUNm2mGgk0dI0B/qcF/FTUh5W4=;
 b=r0XkoN/Nq7NNXFdbrX3Gol6S0rVZOG9BRjpj6bdHQLFDKHBjJG2uaDiXsQzhI6fwhCo/2CKmvcEbY4Jdno1jdk07QJAp2zqDMY84coT5/cHZpMlzzd0lYz6ZfYtsRicduOb0aGPfsSS1JpfVMfaVOXpSIK745FCEVMFSF5jldHI=
Received: from PH7P222CA0025.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::19)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Sat, 7 Nov
 2026 15:48:40 +0000
Received: from BY1PEPF00026967.namprd05.prod.outlook.com
 (2603:10b6:510:33a:cafe::5b) by PH7P222CA0025.outlook.office365.com
 (2603:10b6:510:33a::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 15:48:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026967.mail.protection.outlook.com (10.167.244.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 15:48:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 09:48:38 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 09:48:34 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <broonie@kernel.org>, <yung-chuan.liao@linux.intel.com>,
	<pierre-louis.bossart@linux.dev>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <venkataprasad.potturu@amd.com>,
	<Syed.SabaKareem@amd.com>, <Mario.Limonciello@amd.com>,
	<Richard.Gong@amd.com>, <lee@kernel.org>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v5 08/25] soundwire: amd: fix missing wake interrupt for ACP6.3 in POWER_OFF suspend
Date: Sat, 7 Nov 2026 21:15:17 +0530
Message-ID: <20261107154659.3358223-9-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF00026967:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: b207f11f-4343-4f77-9288-08df3ce69825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|261028144727099003|261021121427099003|261021123027099003|261026140227099003|261022105027099003|261009223027099003|11063799006|261026121527099003|10067099003|261102123227099003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	U5i1m8WGvFudgSHx7v8o9jZwRkfW4IBGdt10EgprEmr2gXrvSXWifSLn2M+imFaNxSEQSuzjqXjcPIAnaWjnoNy598Zwqk1RaQqOalRrSIe5Qvq75mNYwRQxPL5RrBlYzglth44qxjvqPjX5tEDctnpu2cHbuMFI8U+PJz2a81kQ4LYE/hS2E57DVUld59x6A4cg6bt59sygGREuGpUUWHKeYdxHSNl+jGBVeo9PyRdBnDAW5S8ZKrvNaKQD5ExsbfcFJ3zpoV15OKhev/3X0rf7sqA/hX+uAvHTlacV4XNOKpE/mdAfK3fpCiKW1Cd2IFPFVf1hjHAzh9JdKQEcARFXrlkRK48QmR9IoOnlmA5Dg7d4VqyQXf2akUx6kcYo/+jKC20lhIrIRofzeWD6pKNfSHqqSTe3Cw3Oc36DAu1C3VGcPjWlMLnLIb6QtmnXfBTUIVRs5UO8BWSlPUIcYoX5epBkd3R9HtLq1xfAy8XooFrGPYcHwYYagg/MkkFkYOARXAmfwRlKUOAkbSAarKpIGB4AKY7bQp8b2AERovGMcV+wt8hGSn3D6LUMNL+Nb9VKgh9LTNT2zR6CL4hH+FGtDYu0+6hQmgpZyti6aeQi30gEj7XlB0ncc+fMXgd9B8ILbT6dXqfUN4f6RgtGVe/Q/liHeoxhKLnywc1wL0IqF6IO2z0UiiGJz5BPN6vtLXds6/KvcJGVDmxDgNDLeA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(261028144727099003)(261021121427099003)(261021123027099003)(261026140227099003)(261022105027099003)(261009223027099003)(11063799006)(261026121527099003)(10067099003)(261102123227099003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p3vgHYSkpn5CD6dkbfsIrWkeKfUcHu9wMlvDs8Gqe0x/Qq1djvO2VUQR+RvemzOuBsZbVjAmhnUpn3BovONuCS+ZR9kRM0/q4t9MH3qCKG2PInyE3jqbMQdLu0OJfVOmpZf7hDhYZzWmvt2LavU9VdzreIUCo13nKJc917zljeGr/Gy9thTp5vV5Ljqks/3pgsiVJvrUpSKqy3VKWvIbqQvdRtTLLQiqcgeuXN2kkzxc4yQnUiesDezOyDlkZvF4KKft0D/anxiaAV5UdN6CGJLzkUVLsgSvoIJaBEjGmKOJkp0Hwb9Nt1KemgXpyG/UAB+/pYR6xYlWXqSVmh9beQViBn4La4BcL4RWnAzia0+bIoxQ+v+BMcqtnzDVE8pmT6EQUZdz42H4HakT9Atc2nVyS6x5ZvNqvWfT5wf0mwr+Y1/rwHr3k8HZkM79c+14
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 15:48:40.1355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b207f11f-4343-4f77-9288-08df3ce69825
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026967.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141

On some OEM platforms based on ACP 6.3, with a SoundWire topology
where the UAJ peripheral is on one instance and the speaker peripheral
is on the other, wake events from the UAJ instance are silently lost
every time it enters POWER_OFF runtime suspend (D3) while speaker
playback keeps ACP in D0.

On ACP6.3, unlike ACP7.0/7.1/7.2, there is no dedicated host wake
interrupt path (no ACP_EXTERNAL_INTR_CNTL1 host wake mask bits and no
PME wake mechanism). The wake event from a suspended SoundWire instance
is delivered solely through the standard SoundWire interrupt bit in
ACP_EXTERNAL_INTR_CNTL.

In the POWER_OFF_MODE runtime suspend path, amd_deinit_sdw_manager()
calls amd_disable_sdw_interrupts() which clears the SoundWire instance
bit in ACP_EXTERNAL_INTR_CNTL. After this, the wake interrupt has no
delivery path to the CPU.

Fix this by re-enabling the SoundWire instance bit in
ACP_EXTERNAL_INTR_CNTL after amd_deinit_sdw_manager() and
amd_sdw_wake_enable() complete, when acp_rev is ACP63_PCI_REV_ID and
wake_en_mask is set. The acp_sdw_lock mutex is held around the
read-modify-write to prevent a race when both instances suspend or
resume concurrently.

Fixes: 86a4371b7697 ("soundwire: amd: fix for handling slave alerts after link is down")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 438cf52a212c..3f3fffbd529a 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -1467,6 +1467,13 @@ static int __maybe_unused amd_suspend_runtime(struct device *dev)
 			ret = amd_sdw_host_wake_enable(amd_manager, true);
 			if (ret)
 				return ret;
+		} else if ((amd_manager->acp_rev == ACP63_PCI_REV_ID) &&
+			   amd_manager->wake_en_mask) {
+			mutex_lock(amd_manager->acp_sdw_lock);
+			val = sdw_manager_reg_mask_array[amd_manager->instance];
+			amd_updatel(amd_manager->acp_mmio,
+				    ACP_EXTERNAL_INTR_CNTL(amd_manager->instance), val, val);
+			mutex_unlock(amd_manager->acp_sdw_lock);
 		}
 		/*
 		 * For ACP 7.0/7.1/7.2: disable OE only; keeper and schmen remain
-- 
2.53.0

