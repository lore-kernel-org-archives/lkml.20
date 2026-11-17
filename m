Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794900094;
	b=Ld4i8aXhQixUG084NT/rRq1jheyKPooGqA9+fx02d99c8tdZowg7FhK2Cr3azU5RrGA/
	 U3TVmnFkmi3Xep3l16tkD5QhlvkyOQrHLWFzguVxz8mkHVIOi+YE6Qy66DVwH4KMrQUWk
	 kZZpOLJwzUDlHZWA0vFWmO8HV16oac2pJe+z0ifaV3t/sbz+fLjQRTbgroPbH64fIylG6
	 966eeDzmdc8lsBgKm4fjE/+5DCxWYDYifGtFIO5k8P9RXn0lid89qQ2b5eM/x9BPVuh49
	 z42ZlSykiJLkskLMbTAltVT2yjbEvFyUQyW9lgydjDXaD57u7LJ5wKyJu9Gy31m+bGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794900094;
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
	bh=xfZbxvW1XTwBdfdaBtldaruk9UcgNsD+1GIudHbnoys=;
	b=URFZAnKVIaaBbBwnmAaiVb/uxaHqc6k5GkbtnRyjq1T/VDm+wrKVU1Z/OnNZR3uBII+q
	 5pEedIhwKH0/WEyq3qp0Uj7TZIYh/Sd+rChLHMaqqjHs+vyJVW498gzPNErNE14qnLD5P
	 f5lAPJ72JHv5+utxKByI2tmNrpDAkYyjH6F3GWChGf9jDsTSjPR7CRjV0/wJP59nrUt6s
	 NO7MlTaZldaQag3nlgryb+5uhTxlTTpT8w6T1bCCievAHzq0KOSWf0SJ3jbu576zNKSEe
	 kBNFBe5s4aVlUq4GJMeknaRo2bf6gK86s2q7h+L/PAp+5RdQRJ6EA78QAgtlfRCQyrw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LpVglUIH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.193.63
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010063.outbound.protection.outlook.com [52.101.193.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005F0606A32F;
	Tue, 17 Nov 2026 07:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005F0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=LpVglUIH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxFo/omNuBr17ty/O+pvohrNA1pf/KyLdqntUnKjB8H1HljWoC4fozA5qqK8DasSWxdtjSMfeyoE41pRZb0heOgQF6M1YWbaBq0is3jLBO81Z0eZi6orYbsFt1kHBzqiznUTau0OUVknrlDz6uHG0nWYgSZd/2S6c4c/QyBagnyGJtNWEwl+q9n3QzwAK/t6NDCOF9dLBJoi4cNYY+TY/vWh7LEDfIJo0n08c7wlW0Y4jZuOnUcKD2dc+fVGFRQG64j2sLh+K9dqlThhkXqKHgToxWrl+vJzZINtFd4bG8Jd0n0kCZuMzmqpHZbGBmnNLkxUnAL4LLdJTz/wB/LO2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xfZbxvW1XTwBdfdaBtldaruk9UcgNsD+1GIudHbnoys=;
 b=VvPO7xank8O1nX0zLeLGrLvjSlP0lHOKXszAnfBGdAR+MT6kTQiViaTTUHMVD6clh/peqrCpuNPwsth8UaTv3q+CESj4lKpOXeyNAX8BKeqQQvV0dQPRV9B7sYZrLt8od6/ROoBw8oyPPOwn0MQFtEIJ4jFu0LRbzI/0yLCRT6+7NQLoXOPP4qyTTQmwaxGX+i/Q4BRxoY6SXWrQRb8ZgtkSyYNqsgHxeO3XZTG7oU0Vujwmcm1bZUO8WYDxgkL0bNpDaOe60np1mljM0M1MaQyajbrZGd+igY2/QGABO/lo+DeUo+vZOdiTjRk1HSUg+dkGIeB7nH2QC/oKxtb1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xfZbxvW1XTwBdfdaBtldaruk9UcgNsD+1GIudHbnoys=;
 b=LpVglUIHZ8wXO2O62sDItK3Y87FJrqc0PafEl0lUyhVHce6FqobeZ8gds2euHiGEpyYhz3N6SycfCmToURGIS+7WiqXc98iYd6rDo1bI0ytVm1WS+uLiAaXF46lcff8C9zDwr6CSFAJvqPBAfrjC1Hl7pFClhXl5uhAATay54IQ=
Received: from CH0PR13CA0032.namprd13.prod.outlook.com (2603:10b6:610:b2::7)
 by DS0PR12MB7926.namprd12.prod.outlook.com (2603:10b6:8:14a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 07:21:30 +0000
Received: from BN2PEPF0000A802.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::3f) by CH0PR13CA0032.outlook.office365.com
 (2603:10b6:610:b2::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Tue, 17
 Nov 2026 07:21:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF0000A802.mail.protection.outlook.com (10.167.245.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 07:21:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:28 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:21:28 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:21:24 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Vijendar
 Mukunda" <Vijendar.Mukunda@amd.com>
Subject: [PATCH v4 10/11] soundwire: amd: guard DAI PCM caps by acp_rev in register_dais()
Date: Tue, 17 Nov 2026 12:48:19 +0530
Message-ID: <20261117071927.830373-11-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
References: <20261117071927.830373-1-Vijendar.Mukunda@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A802:EE_|DS0PR12MB7926:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ef494f-8730-432a-0ef1-08df447b65bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|261022105027099003|11063799006|56012099006|261021123027099003|261021121427099003|10067099003|261102123227099003|261026140227099003|261009223027099003|261028144727099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	UYTQTjG6uQWhoMn5yRDIXiGuFdbnT7RxIGkuE4X5RNuxfmF178UgAaXCA3Tg8S6ciRwGFh8NOPSgG5ynQEDigTQ+cFdy+W1aKUnw7U/Y79Alt257aoRbxcsjmPQKsneHcLjPqw0wdB1dY8RwjeUrCxct9Ts77FfpKe+DUsOf/3WVNzsP+KkfNBxyRH2g9b2OAwUqV8lTlfTNXVCJHkSKDfp/E251IkZyRdIs7wfGXS3d6p/qr8Bf7q+gG5cdNKQFfvfTe/mjiqTLoRG1OY5+MaMpNy/wxLs1bJ5FJPYbiqdb5+uJ7A3brCwcfeUEpoKPXu3I8JK7lE2vHetvGs1LsKiJgeAbjCN8rxgNzJktpJXybUZq3NgBNr3yq39Yz0jHBz2pH2AXg1FK927QvdT+xPw6ToLHMqvaGPUES4dqoL53LZy7wioHWyeOWDeP9x2z54dNRWH1eB3Wsny6zrvqJPdDcfohFaNF+GhwqoAxJzdzvtjfKCQomjfADF3b5UMiyC87CLJHttJeKS8RnN703asyzfFqj6/TKCeA3BXA/arjGmzLsz1ajCCIX3s37ezodSgAmrKlimtD9Lv8whmh++Vh/5mdsEbit98aUtsKe25u0GrFKqh7zf6kTdg4//qA4CEJYfiMT+FqYQUktm/7cN1Utmq2FAAUZfmtI1j6pKrWneMgBsxP/w4215ljiVUoEX+L5FJJ/wGKG6FDXMXFhw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(10067099003)(261102123227099003)(261026140227099003)(261009223027099003)(261028144727099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/Doby8hjYeGRZeKoHluP+TpexA+69l5DIsdDHPjZyeX9Rj4IDwnBdz35xB+lk+HpUtI7tfqb/f+4WxGGX+M0QvX2n+HF7O9bhAgajeo+VbfVTJ3LT1+3a1EtHoLv/QCFO93BHckRPgSjtOr0rHwy6UjD2ccjOM6Oq9I9hkIabU/7CBbJvR5qTqeb7nUCh7l09cyM0l0PkSJEoYc2XU9hEgt7zYYwaaFQ7ZGCQzXMgzGbiILTdhl9JhjThxsqQg1YnqWr0WOVlj3H2vAJ22OPeTn89l4rF5aa2DNb7n8qi3qfebVuJz+rP0v91WFem571J6B/Uv8Uko4lqcRGpCKjPfDdXjbxEiaGLgKsUYV9e0NTZf21g6+FvrD9IEIMpaTSc5bnHzz+nFW58Q5vicasi1q/b8DMCiqvctNaoygULayR14VWR5UErtL2nodmnWke
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:21:28.7894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ef494f-8730-432a-0ef1-08df447b65bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A802.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7926

Replace the bare stream->rates and stream->formats assignments in
amd_sdw_register_dais() with an explicit switch/case on acp_rev
covering ACP63, ACP70, ACP71, and ACP72. An unrecognised revision
now returns -EINVAL at DAI registration time rather than silently
inheriting capabilities that may not apply to future hardware.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager_common.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/amd_manager_common.c b/drivers/soundwire/amd_manager_common.c
index 149122cc3f90..987283d06cb9 100644
--- a/drivers/soundwire/amd_manager_common.c
+++ b/drivers/soundwire/amd_manager_common.c
@@ -403,8 +403,18 @@ static int amd_sdw_register_dais(struct amd_sdw_manager *amd_manager)
 
 		stream->channels_min = 2;
 		stream->channels_max = 2;
-		stream->rates = SNDRV_PCM_RATE_48000;
-		stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
+		switch (amd_manager->acp_rev) {
+		case ACP63_PCI_REV_ID:
+		case ACP70_PCI_REV_ID:
+		case ACP71_PCI_REV_ID:
+		case ACP72_PCI_REV_ID:
+			stream->rates = SNDRV_PCM_RATE_48000;
+			stream->formats = SNDRV_PCM_FMTBIT_S16_LE;
+			break;
+		default:
+			dev_err(dev, "unexpected acp_rev 0x%x\n", amd_manager->acp_rev);
+			return -EINVAL;
+		}
 
 		dais[i].ops = &amd_sdw_dai_ops;
 		dais[i].id = i;
-- 
2.53.0

