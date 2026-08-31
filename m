Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A272DF719;
	Mon, 31 Aug 2026 11:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175895; cv=fail; b=XgKTH2z++ovGU/bUlnRAl/p7YT+RG+YQ9qX7JNgeYvdfzImgGQE25G3+yCvuFUlMAF4gHIOloqDn2aZFWwd+dGVv3nkLqL638baaxXUhOQ89mjzQ00DFuvp9ZaBVI6uRdQYViCAfgHbHbvFynd0tL/tLLnMPhJ0BSlN34/fElYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175895; c=relaxed/simple;
	bh=5siRdqd8fMqa/tA/cZh+6folhHi0Un7j6prfazq3ddU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mda21CjSIKsEHkGA0Na6/0QMqLtEczupolTToR4+AOQ8E1X/p3J8kzRC3zxh4cNFZIuLJJRmwypXBI1fK3tLTfY3MbH1LV7Ul/nX+Ww5e5VR38CGOPTaR2FlNFCgDaKJPNLh5OPnVy/FlOjRMphNdA0RWeiybT7TDqvFrR13zkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=N0ixawzG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=AsY+Z2wM; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="N0ixawzG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="AsY+Z2wM"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V5RRGx1516251;
	Mon, 31 Aug 2026 06:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=0IAvIequYYb/jK4e
	QogfXqQZ4tC57b1elP3vmUndbM4=; b=N0ixawzGxFiVmst/57HgHuvzvn5iaedq
	VTDVNIyhACyw8bC7CJ1vMo0vbJiIVLEVH4QBfmAdL1KKi+UlHlmxKEIC7KIIJQ/I
	mDeU38SjR5e3GynbKplkltiE9MchCc6sXyuMNFnDpzoVFCtYgwqbm3X9uLG71vVZ
	ZvSOWYz0mTcmtn/4BfYju/Yp7Isgc94vUKYryREY0NyDZmZjNJQZ71bmKlJgmqn7
	TvcmhohT6FHUwztfDfNyjr5fhL5/3Hnu5TyMj+wJT02Wy14LRMcH57jRfaPIt9zX
	C8w1LE0CrttvoVAO1Cb7xCpeiz1MF02+4WPm3BPR1t6hGXlXdpbQaQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022073.outbound.protection.outlook.com [52.101.48.73])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gbvtysxf9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 06:30:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyCd2TO9c/7DsOhSiUNr/yb3GljCBAIzukH4x0tdL2v5etsULJgcD6CwHop39RD00eEWj9PJR+6Wscfb2ZJExkSbRgyvJRi8u0o8u9uO/9Ll6unFep6U4NYxwTqX/REQGQQ5L1uiRbclV2DlUUzy2L+c4313VEWqlhrVITSjjg1skTJAGIlmGRKmkQyoHCpQVWKHw0u1WQBVN0pT4MzEM9Ql7BCWDmHly5QrsJINV7/Ib5lLeNFHQffD6iObh8m7vDmJjKAPaC6QOi1Y+LtP1t3lg3qnjcOO36JrB7yA2eseJYFKGTpDj17Sq48YRuBpLOZMJGvc05hD9167j3Z9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IAvIequYYb/jK4eQogfXqQZ4tC57b1elP3vmUndbM4=;
 b=lZfizS0yWNHBHM34NNMWNyUDxOKqQDkPK7sW6Al4PD8Wii/vMq7eRwgjvzanqgLb2azSI/Ryjq3OY0T1P/4b4baRSSSkf38pND7kmzjuDuSSNSOlzVwQRu4uAI1p3ouoNWjFspDmkmvYwXJesRRWo32PiSBat4R0MoW+e/MTQHfjIxElvpU6pUokCS9SNiH3I+5pU+wHzIr+FGb7j6c2Tay1fGEFFPvwB43v0hCkIaogZ4z17egSS0es0lpGsAmsTw68mCTaVg2E3XdPspQgnC5B9VlMAugi9CZ+lETBJlIWKPd6LTw5tewU4QB9yRShrPtseHh6YPoYPbDCMvnkhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IAvIequYYb/jK4eQogfXqQZ4tC57b1elP3vmUndbM4=;
 b=AsY+Z2wMlXhzZtg7HHxabn16K37BP7EKY/rMRwpfkaTX4R8jdprdL31EXByMKvVngdPs9hPcHZaQj4RQNpgS6MjeyZAt3JT1JRH2X7UsK60gaylORFquJ6F6J5SlKRDKzEk9HQLMfjJWUq2k7QIhyBZjT+3Wtw9ematJPQKloeE=
Received: from CH0PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:76::10)
 by MW3PR19MB4345.namprd19.prod.outlook.com (2603:10b6:303:49::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 11:29:42 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::8d) by CH0PR04CA0005.outlook.office365.com
 (2603:10b6:610:76::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Mon,
 31 Aug 2026 11:29:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Mon, 31 Aug 2026 11:29:41 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 2B591406544;
	Mon, 31 Aug 2026 11:29:40 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1383E820247;
	Mon, 31 Aug 2026 11:29:40 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: bus_type: Use devres to free slave IDA
Date: Mon, 31 Aug 2026 12:29:39 +0100
Message-ID: <20260831112939.126708-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|MW3PR19MB4345:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 417d0954-c5c8-4acd-ce9c-08df0753262f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|34020700016|61400799027|36860700016|23010399003|82310400026|10067099003|16102099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FVsytd9jBFy4OZOezb/m8EcLo+JGmzvf21CPGHO9/Mmuhw/NcZq++8/zhREI80F5xcrHPmzEGRcpuRlKrzefMSRYqrQfutkYQ7yVpoTZulXVwk4qY5OKVR5eJKMxgXkCTde10vrJG2eJkDB6t/XBTic72iXDjGxEZs39KB+aCZVY3BRwKJuhGpI8/oQAqYzWnAwGBIgMl3+gxMpK5sOd2Td0GhK09rI+ebXP35W0oXZreTzyeoGozO4Fefrt6wo9hE3EhzSXrqaXaxLDYWLA8XguMlQ//OJy+dVFPFkNfqhShD4n8Z2mxAWnrdChTchY4avpTXuPYZA+g1s1xEyvlI0MsiCfMyG+n25UUr0G8RbG7QNI82QbvN8rTYK98MzT8JPeDLCYgj7pFwZOgy9qYsQyJ4zf7BHbb05kQH4Aa+LCfmYWFSWsQhk5mfGRdmrS3sHCzvXp3EP1SDVOhyFrO9ut21IrMSOdPY17iD++rU0s96C111+XlV1FUkghyOVu+Oe6yGXoSGh3lUzFqewa2zkW1AOuoMq+JLuktnCb02BwqKBB/g8f96BRvFy/WYVpjT/Pe3zwD8RKEboggEmDc1rB3QEJtWWwilKO1eq9E6KRwXUYFNozqZYnF0mLU/VRdv08NdduWqKfPNbaOkCvxhfXJtDhA9GASEbj246SP+4057tgkNCi72X5WB2SNIWbeCfaGJpzvJsOMjkQJv9itQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(61400799027)(36860700016)(23010399003)(82310400026)(10067099003)(16102099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RBc0TpJx04UAFml+BsoP3zBJlOVcQl/TZ/qFBonolbd9WGFTxXjAXmFthIxRUIKlrZ/6ZCbYtV+b/upbwIbuBo3ndkQvy/9MP+Je6ltAP0uvWLS7coKWpixdYiye5HBAyNPWKZ/AKhCmiYdPMPsd7J2N3bOHnEVpNsPVS7FhpgtAPi7P2MRIHRUEIuNNp6J9in5zK7TIBdNoUfj0ZW58x8WAjL6g7QTcw61UzSxPoj918qvuVvtMuj2+qkof9YMltD4n2JCFbhmz10NW4i++coKyau7K6P3MoCwtoSZcDWfyjBt9C7l5lXmt7J/Vqy2hgZ8NIyHvMGbiuzpmUNcKuOzZUFS5VnVNYV3cNRxiC+bT4MThmWhBALkkZ3AuNGcmLzHnTtibLr73idXLZngYTCSkhPNL9kDQuUf4hofxQ6ztwKIa+bbW39+72lcMdUQI
X-Exchange-RoutingPolicyChecked:
	d58JI57raTPazFcJLH9lfPvvEiVmc1K/lkKIHTV3XshNIMXFLNixsFFKAGIE1DPexp2QeExRjnj62HDQjtr0Xij1DRicuMR4puSr1PdVEzI2NnbyC+F23DGSr4/7ITEfxFxOiAGolkZjOiDeTi1ZH3AJYzjzKlyRqFe8PSiS8caFmzQHiwupKxVzpzrqfvjskl3QXOWhopT1YMwAhYxdZBeAgfDozGQIFYAHTSTyStl3xitcr2szXznyuC24DpfYkXUYDKVrPYS9lFLSkXRxwcG21rZcVI5inMg3wAUZnAlpFA9Xyr5eODZsF6Fxl3IZsepU8lIcMqc8GPEFsDQLTg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 11:29:41.1865
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 417d0954-c5c8-4acd-ce9c-08df0753262f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4345
X-Proofpoint-GUID: YfCaqIf2BdHshIcfcdI9X7ej1itKjTT-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA5OSBTYWx0ZWRfX8P5Snen4rcJh
 wwNb7AvNY2qc0u5IQ6Fs+os0/OceMXCZvoyjOFy+2vlNZ+ob/Q31E86jyJ+FdNFzXQ/7SEzCV2c
 9YkEU3qtsjao4UrMkqAGnfmuUEdtA7k5N30VvaKn9bH0c2OMJ23UzzovsqLbDvDwYfjLMo2eJaT
 MeOZuh5PC5dWAI8qeXYpmFdzNkGmAzepHvNwyHvSRgK70peIkcPo/d4sjUNpergiZ2hz7xiIFTq
 avmWhaJwsYcw0pL4umdaMvXHFtudkmA6YEY7I8Lvh6k8iz6qRSgvKBQsX0cIVw+QLUEVHbCKFYL
 GVB7WrHzwMlhxZ6/MamWOnnXz1AHfYQgMF1ApYQcwHLmGpNB4sfV3D5uvsIV8B7Nx9SFA2wtreY
 sVDo1IXvXlHf9Sge2sJRzSU8FWf8T99CP5MdC8rcbFYZzHDosHSd0UvuJtYaZbbvfRxlbBN3i6L
 +1VC7HGBp+1aN1I/9IQ==
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a9565f2 cx=c_pps
 a=o5n9MpPAMAXLgzyrJXPTXg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=RrUWIrlwsjPz-q60CHAA:9
X-Proofpoint-ORIG-GUID: YfCaqIf2BdHshIcfcdI9X7ej1itKjTT-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA5OSBTYWx0ZWRfX1qtMe1CwwAzp
 5dcow3NvkYDeIpMSo4z0Z1BC3bl8Qi5keHUVmxQgno26JQuTVquzzpr63Z/sIr4zLK0WGvxApHl
 abK5IqkbB3mGiYULc0WTeeYF9bSGtKQ=
X-Proofpoint-Spam-Reason: safe

Create a devres cleanup action to call ida_free(). This ensures that it
is freed after anything that is cleaned up by devres and might have been
using the allocated ID. It also avoids mixing devres and manual cleanup
during sdw_bus_probe().

Fixes: aab12022b076f ("soundwire: bus: Add internal slave ID and use for IRQs")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/bus_type.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index d61a97c5b41ef..fea15107cd9b9 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -71,6 +71,13 @@ int sdw_slave_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	return 0;
 }
 
+static void sdw_slave_ida_free(void *data)
+{
+	struct sdw_slave *slave = data;
+
+	ida_free(&slave->bus->slave_ida, slave->index);
+}
+
 static int sdw_bus_probe(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
@@ -104,15 +111,16 @@ static int sdw_bus_probe(struct device *dev)
 		return ret;
 	}
 	slave->index = ret;
+	ret = devm_add_action_or_reset(dev, sdw_slave_ida_free, slave);
+	if (ret)
+		return ret;
 
 	/* Create IRQ mapping now so the driver can get it in probe() */
 	sdw_irq_create_mapping(slave);
 
 	ret = drv->probe(slave, id);
-	if (ret) {
-		ida_free(&slave->bus->slave_ida, slave->index);
+	if (ret)
 		return ret;
-	}
 
 	mutex_lock(&slave->sdw_dev_lock);
 
@@ -170,8 +178,6 @@ static void sdw_bus_remove(struct device *dev)
 
 	if (drv->remove)
 		drv->remove(slave);
-
-	ida_free(&slave->bus->slave_ida, slave->index);
 }
 
 static void sdw_bus_shutdown(struct device *dev)
-- 
2.47.3

