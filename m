Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.24
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794074101;
	b=jlMWm5oF154gJy8ZkVLc1BX2HFpVIGAEeXXNyOHCOpvtPJxzVh7/QLij2dn6cmvW+0Fc
	 BKDaH8sTtYASGGSCIVFkI73aO5NSW2sbUd44kqiYUyfcgrLgrSmA121Zwkd6jF5Ihcrtk
	 M1r9qxbn+5N5RcALJWvuXakdQhkJvLXDetODHi4mIp7+VHgURBKUmDWOEjdcpE/bgvt5S
	 vZfkq6SmUwmmhreJDjUVFi8BXHeA85Xuh/q6ruO5Bo0PF9jfSA3+qlDbjgBW400aBzBNj
	 TChZUXWSf3Ac0KeKETYH4zsbjJe3KJwQjUL2eDsztFD2DKdnm2mnb/qWFSqhbvaRJOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794074101;
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
	bh=uLk6WzP+oooVciuTGjJhwvI1+pev14ZMXUGuyjwG/zY=;
	b=Bcs9JMepHtkVsaR62MbqLFPwKXnbbRCUydp6SVWxKWSNqZx5n1Dovg8L3z1VB3cyC0nw
	 6VJfZYeIc6WB181fT7Kg0Gw0Kz4jq7oJbhlEWRcVkUMSTRjVM2xN0ggFdj73WFw/J835p
	 LT8kRySxjOsqJYjrrSb4qLLhBS4Y31IPT0wXd5fGlYr5OaG1zVKLmRawOyksjVL7+wjV+
	 6uyiItSerWzz7f7HyDfq8jEctnTegzIcDpX/82herLo5XrdcMkqYcWy8yaMS2Lm0GTu0+
	 tnznNu8J/84YvDRtOQjVaXNK4t/VSdNOn6y8D9uUFGPhOSXPYZa07scOKgJHZIpKxLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZPQ8bKY0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.24
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE445606A32E;
	Sat,  7 Nov 2026 17:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE445606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ZPQ8bKY0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hSYNalEWaLn+YjdqqAJlc2VRqUOZdhJZNvDXVvO9NwXm4FcmgLMtOexjCyMm4o15wmRHg/R8Qj3mZ+p/saoX63WWaFsUee2Mg8Y3NgjrKB9RjXiyasqHlZPMT9mey0Wy6ZdS72DoNcsdMODdtkPWNMqfO2hCwF63X02BUA0/XOOt8Pc0EC7HTr9DeqbSvk4RzwOIbhRE33O3SQCoLG9hnMf5qDkaP/27SgUrJKHwuhaj8Y0Ejhr1GyQYw2/bc/BSqfklxPBf1qDLGOFMOQxN+UJeoFMRQNuotXdwPdUilG2QBpArEg9dGVKx+aSAY9lY4V2tBgNPSZ+CRbLQ06LbUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uLk6WzP+oooVciuTGjJhwvI1+pev14ZMXUGuyjwG/zY=;
 b=Ie6d8J8GuDTHIcHmCyPHbaWh77xyrwWF4opKQHbd+FUJb1QLV98bXl4UVmwcnIb5hi61AlZARbpb2bgT8jQpe0ernEWsedlvuByug2/z6mqSip/tgkz0loPinto/N6QPE0AuEVf8puf3O6w984A+JnzKrwRY34pYe5kCmEnM0T4t0OjE3yVNurQV0UmmVONtYZK0VX2WCMBFEGb1XrGrURvzwHW/QDXOHuAvE2mi1b1BN5U9jyR7S5P49Q4IAyUE50gNW/Ky3bknXTyDA2R1tT68eSlDvLeAVXQ/+RG4jioCgXwMixbDa9JBmyv12vPPXasfDgFhoYvSFq44gsg0Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uLk6WzP+oooVciuTGjJhwvI1+pev14ZMXUGuyjwG/zY=;
 b=ZPQ8bKY0g+DF4vADQ5UO+2cOFelOZkQBnrd8kg2BXZhxHVUH9hTwIzaoi1Sst2i+36s95p5eW6HUt1ZN4kACpUGUvHE38veEpQWeJm9nlDEKBvcAAkmHksK7Q21pJWbilMTKDpvHBx7KJ6Qe8lAaDj33I1sxcZwXntYUrq7YySY=
Received: from BN9PR03CA0438.namprd03.prod.outlook.com (2603:10b6:408:113::23)
 by DM4PR12MB7624.namprd12.prod.outlook.com (2603:10b6:8:107::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 17:54:56 +0000
Received: from BN6PEPF00000076.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::68) by BN9PR03CA0438.outlook.office365.com
 (2603:10b6:408:113::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Sat, 7
 Nov 2026 17:54:56 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN6PEPF00000076.mail.protection.outlook.com (10.167.248.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 7 Nov 2026 17:54:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sat, 7 Nov
 2026 11:54:55 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Sat, 7 Nov 2026 11:54:51 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>
CC: <vkoul@kernel.org>, <alsa-devel@alsa-project.org>, <lgirdwood@gmail.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <yung-chuan.liao@linux.intel.com>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <Vijendar.Mukunda@amd.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sound-open-firmware@alsa-project.org>
Subject: [PATCH 1/4] ASoC: amd: ps: guard adata->sdw dereferences with NULL check in IRQ handler
Date: Sat, 7 Nov 2026 23:22:26 +0530
Message-ID: <20261107175339.3547918-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
References: <20261107175339.3547918-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN6PEPF00000076:EE_|DM4PR12MB7624:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c8bf229-24cb-4dfb-8bcf-08df3cf83bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|23010399003|376014|7416014|18002099003|22082099003|10067099003|11063799006|56012099006|261102123227099003|261022075727099003|261021123027099003|261021121427099003|261026121527099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	OPprSX370DQxiqIeWH7IC1i8t8hvWoba80Ksk3bQx7enNEp3JYMJf+Q57wFxTPR9sh8tr6GpG5HPzIqIHfH9nXxdWWdazvwK+gwkFaLLqzbEb3fufPPbrAK2KQ7cja/tbQwsT6xJiyz8+yJ9MHHcpcDabv5vOXZPdymGi+y+wtwsbKugsvEn+5bWnv7epqo8wnS4eaV+/J/fa1p1104QhG4/05lj+2BolKhs+N+8V4GTGomA9mePbPadBWgmmzoPBufnL9A5+Fms65jHf0RTC22RcW8zr1ksklfpCWEp52wgKhRoPaR9gT0OPkMzGXuQ5YDrg2mx2vyzB0ZoKcspnFHlOWV95uIhMAr0LSACMwJA6pwwuM1dM4Gp+s9Kak3enS3LPuZLpxPECKw1lqNcrgofplTjkBF0uUZzheGwMQO6+cT5R20trOgu5VgM+xZwjJQDBiHaFG/qgBjrvFqNHppXR0k/x5+cILSE1GMd7bd5GEym0sUpYYmJFnXoDdFniNCMbzqj4yAvUql70aT5FxuocNddGU2JxsCt4IsvwU2QnYhd3LR5xlhkcWsXO4VJ9Z3J95nitj8SBtAEToHtfzQuBoiO5Ms64Goafwr2C/igw6LI1qsLMWi049ODJnGP5QR2wTRNy3U9M0J39pEUOgAAh6DarYcwLPgEdp+BYP+STtgArhphGzwhqf4Zbtn2uKMFxjlL9qL/L1x5FcYYvg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(23010399003)(376014)(7416014)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261022075727099003)(261021123027099003)(261021121427099003)(261026121527099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	c96yYs9DEEnYRAumf2s2Lajt9l/J3bPj9ahZI9Q6zkvltxc8Hm0vy1fx95WjltjC9Vz5h68zYryhsYjI2LvIh9GBnggwfcyX2ybn/qJ8u4WyeGJrqPr1FVma6H9TvW2j4DDpyB6ccLfPoi37460B/3KI/DdGzNHua8ca5OaxP6HyjS6jIHu7RmoQZKv+QbZxw+Xm3bOrKwmfxgRz+ukwcZkB6sDiGTewhMGpMRoMs1VcTc3OEhPK+bnf1RMlGhMVFrG0J8iYk5G1Ky8xqKK3GX1baun+vMP0R5ldkMtYQoxOpr/8QL1Q4E1idJZDEeScrCi3NsdhBWudfkrYKP7Q4cOIhPNx4UIJnRadXO0Wjw+v3XWfjyv7vNUuLcLgx/yY5vg6R5eheda5tPD3IlEHXjkihu5BvwaGqq85lhTou3l3ZBftIQmjGnCZ/OzgYlYe
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 17:54:56.3471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c8bf229-24cb-4dfb-8bcf-08df3cf83bde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000076.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7624

The ACP external IRQ handler is registered before sdw_amd_probe() assigns
adata->sdw, so a stray interrupt in the probe window could reach the
adata->sdw->pdev[i] dereference with adata->sdw still NULL.

The same window exists on the teardown side: after sdw_amd_exit() frees
the context but before adata->sdw is cleared by the caller.

Add NULL checks for adata->sdw in acp63_irq_handler() before dereferencing
->pdev[0] and ->pdev[1], and in handle_acp70_sdw_wake_event() for the same
reason.  The interrupt-status register write that acknowledges the IRQ is
kept outside the guard so the hardware bit is always cleared regardless of
whether the SoundWire context is live.

Fixes: e1cb350610ce ("ASoC: amd: ps: handle SoundWire interrupts in acp pci driver")
Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/pci-ps.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index b604db4942dd..d0b66df10157 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -26,16 +26,20 @@ static void handle_acp70_sdw_wake_event(struct acp63_dev_data *adata)
 	struct amd_sdw_manager *amd_manager;
 
 	if (adata->acp70_sdw0_wake_event) {
-		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
-		if (amd_manager)
-			pm_request_resume(amd_manager->dev);
+		if (adata->sdw) {
+			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
+			if (amd_manager)
+				pm_request_resume(amd_manager->dev);
+		}
 		adata->acp70_sdw0_wake_event = 0;
 	}
 
 	if (adata->acp70_sdw1_wake_event) {
-		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
-		if (amd_manager)
-			pm_request_resume(amd_manager->dev);
+		if (adata->sdw) {
+			amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
+			if (amd_manager)
+				pm_request_resume(amd_manager->dev);
+		}
 		adata->acp70_sdw1_wake_event = 0;
 	}
 }
@@ -209,18 +213,22 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 	ext_intr_stat = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
 	if (ext_intr_stat & ACP_SDW0_STAT) {
 		writel(ACP_SDW0_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
-		amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
-		if (amd_manager)
-			schedule_work(&amd_manager->amd_sdw_irq_thread);
+		if (adata->sdw) {
+			amd_manager = dev_get_drvdata(&adata->sdw->pdev[0]->dev);
+			if (amd_manager)
+				schedule_work(&amd_manager->amd_sdw_irq_thread);
+		}
 		irq_flag = 1;
 	}
 
 	ext_intr_stat1 = readl(adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
 	if (ext_intr_stat1 & ACP_SDW1_STAT) {
 		writel(ACP_SDW1_STAT, adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
-		amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
-		if (amd_manager)
-			schedule_work(&amd_manager->amd_sdw_irq_thread);
+		if (adata->sdw) {
+			amd_manager = dev_get_drvdata(&adata->sdw->pdev[1]->dev);
+			if (amd_manager)
+				schedule_work(&amd_manager->amd_sdw_irq_thread);
+		}
 		irq_flag = 1;
 	}
 
-- 
2.53.0

