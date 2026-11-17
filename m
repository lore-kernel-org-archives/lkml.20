Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899461;
	b=I8x/dIGxpa9r+U31h7Ig8Z1wYkg2QYV0Vh+x3/shMvFs7nlEycLKhw6e6mEirwww4Q/p
	 j3dXx0ZoJ0XZ8BYU8UmxcfRJB9EXjodiN+q3OB2EZisKDhjZh+EBuVpQJx3jcUy0ICpm2
	 asxuzi4MOfZXDXeWnj9Tfl2OyHC8iq0ZhPP5oDP3vHAWjt330ZNB5cpUEh/AR6jHj5kSX
	 KR24Qt6cu6CQYvyZMoQ9TTTHw2LtEVMPHzoUnvtbxDY8lhf7Cm94sLUe4JDDo8k6F1Jex
	 vij1ZKsO2eC+fzu3N9ptt6EDfYXLcDUkTSM4vCtgBoRdGy41ERmVZrF4u3PoJriMvmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899461;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
	b=rk7euUwgtXn4oCeDq0ND2wQUe1xzOTBnsyknkoq6Ao2YLCDT7AzZBxz62gekpcX3pv7/
	 gfOxyOwFehG9FS+JpjJt9cidqTjVegO8lzQMTsTOOv/5MXNPx8gOwCh0xDQ1J8NKS7Oqu
	 3VKQZBjN3gDNRPS8M5nLx9tnfechRFY8cy87fKdxtqrckIs+2nKjLTgcEowjNfpp5kBWk
	 IbQtF8r5krxdCX59Ec5oy0b8Z9l0zWThY4XMuU9pe2wJTH0fuzu/VpNmXA4aPSk8Seb7a
	 tDwZP5icnOk7eyzg6yiENHvSS675RWLvACgo08+L1NsoPzk2j/7OGCtE2B8rZZmMcBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gxtPVm9X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.23
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011023.outbound.protection.outlook.com [40.93.194.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E6A606A332;
	Tue, 17 Nov 2026 07:11:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E6A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=gxtPVm9X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HOaF8fFiLICVgezp+sa0K6FGotuGROebYDO8qLPP+yQuInGPXzmE96eRTvX9DAF5oN0t4CRNuMPU7TiEznKngBWVlP800M2vBcvJuGuEPQHSa3LAvmvfEd1rIWK3gVJg/qb+m/zM3ox4IN5zEDtgDbolXkihqib46DNSRDDOmBpH/rE0HrX5ZUGqZacyLsLuIuH8yvCEkLVK4JBJ701Vz/3Sg8Wmxrs4NOD/pkFo+NMTP+9jRO2DB3XneyX5eV1T+ehLHDuF//zfyJlUe8MiZ9lUlOBV5fWraYb6WGXQ0rKcpSudlyqn5uVyP2NfqaHINjv7/Vffdk8RJ6B28L9jIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
 b=eNl5MuVBRnj3HQwxoLmbFBFjOF55W0r2Tb2l/q4J3sW9QgmqnHt8ZMZCkDi36SavzfwkJxhpcF5/b+7Cix5tDLHKnkrSh0bC645YlppP5lno3q2k4EvievKD2uS8z6YeFU36sBXz0PmOFqgO14wTX8tbiqRM+dKlMjAhdFslqb/CB2FZ4OgZb+J9sZZ+9wln7wcf7ld2bIZTQ6YXcHMUyPJeWMKV4kbwkZNwrHMfmm2auYomHvyJ5CPxqd1rBdyQi/0aUOSPU5nS0AdkMwUu3jolu39WChVuBXq8Z+WfHV0MMnorTUjcxhjyNf1oSQElwrs2fZg82JlcASqedAmXPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AL7G4V6RNKC3iDTwyfysmZ7mMSDhnqZKRqQUFVlBuU=;
 b=gxtPVm9XksMouwdPluDWZQikAXYFunLVPBxF41Nur5YcZyjm/qkErEaKg49E2l+tUYQLgluTbt4Q9RWN1+VNyqi9htWVdlZKxD6/AaG+KrHzkf//c8pYYohFuD4T22h+X9FHtDjGwxMKFwT1n4382EwvXansy0pQ4cHz9oYUvEA=
Received: from CH0PR03CA0253.namprd03.prod.outlook.com (2603:10b6:610:e5::18)
 by SJ0PR12MB6991.namprd12.prod.outlook.com (2603:10b6:a03:47c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:10:57 +0000
Received: from CH3PEPF0002457D.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::5e) by CH0PR03CA0253.outlook.office365.com
 (2603:10b6:610:e5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Tue,
 17 Nov 2026 07:10:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0002457D.mail.protection.outlook.com (10.167.252.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:10:57 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:55 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:10:55 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:10:51 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 08/23] soundwire: amd: fix missing wake interrupt for ACP6.3 in POWER_OFF suspend
Date: Tue, 17 Nov 2026 12:35:43 +0530
Message-ID: <20261117070906.803139-9-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457D:EE_|SJ0PR12MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: 6312eef8-675d-4725-3407-08df4479ed67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|36860700016|82310400026|11063799006|56012099006|261026140227099003|261028144727099003|10067099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	KG2jc4TZytFjUpfoIyP70LbfetepW5LIuqEn00JTN33Hf7h2LRtlQyxxUdRo4T3L8/qhsGLGARTrSPwOjAB7xk2mUTFv1IQGGY5LCJx7h0XBUiygrnJoLgC1iWiZF5+YNMvaHuPUFS8rQ5zJim578LMz3vI8WEl5gt1e5OGgHY9FDQ1O9V9AjlCVOkNUPsClf0zfRRb0cJA78uJK58xNhlDZ6Z7zVbW42IiKodHZfZJDc0OYoxBAeCX8xSUkjYd6oBsFlmvWq4+qkqBxo6U5IhpzkwP0HgzEWi7Oacjhi1CPGUVleZhFyRshrgzWdjForkyXgSeC6PK/qBKty309xrWulkRaMKSW2/FMxwZ/KBrqXohj9BjtPgNrdNWiF7VVeG7upog+pJhwf7lZ9EazoYPXtvQm+xyvWnj55WEXGgs1DFWKVDJeCkVo8NF78a2Yg0OuJ6eipns2ZvwHPz/jQxq59xhNEsMx4zszl2RLym/3l+kHkVYHrAuvIinN2xXLoCmtAo/QERU1wAT5z5yKqlsJbGHCFxL+tQI+JCMdUQveQw7vUmok9aSOi0nHUQEoA/q8qBqCglX4doETWoczSndxAvD6fyjGDe5hF2nZOlJFpWCDAfWYyMgzSugPD+A0Gj+tIJP0x9/9VLXc/y+4byxY9pwnKOZ+9MLCXwnPPwCdUctwwjWwIwa7X1bn++m6NSPW9jRKrHixDsa+uAH5Mg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(36860700016)(82310400026)(11063799006)(56012099006)(261026140227099003)(261028144727099003)(10067099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	AzO1R4iD8SeD6HKXbv9WN6KLId5tsBl4ZGwHFb6nAtGKOFZHTIUhuwx5aM+LonSwF2fya0ljdu08rq6XoomTziHbdM0c6Sox81m9WO/wOgz6caSHzB6VNCMNW8Uu5Kj/wqNlG/rttTB/xsnDiBPNQEJkphEcXnHJvddo5j6hOzMrdJyFuunlFVrTRVtpnl6NMUJgNd9rW2caxA5glR8tiXW7yiQULBPpA/drToUwRRviz18GL7PE81En9VfpyW/aQ5JlWWKcFJbPelXbGVN6lv43DSCkZNIcm/vcCj+3VdXS1uH1WBXMC+rgpIYlhcPs9AhbYNAMfN1oBHrP7IQx5y4uSpjcyBS23fLzt9BdDO2ipzG1souc1qV8D9QYq1U+47sZBsnSCXFqqPMpHYSPxBtzQEEdkRZS3wcbquCG46fKU4yuoxeNiS6+MzMI4qoF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:10:57.4280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6312eef8-675d-4725-3407-08df4479ed67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0002457D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6991

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

Fixes: dcc48a73eae7 ("soundwire: amd: change the soundwire wake enable/disable sequence")
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

