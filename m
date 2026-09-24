Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1176D352C34;
	Thu, 24 Sep 2026 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251542; cv=fail; b=LsYJqcxoXDCAaqjVkBs3EFKJbOferNblwL2IxJkd9QrT2nrPui3Jab6yc7TLc7FU9+WIfEZNKTnGkrIQO4JJ3UNKtkikavsJpzttThj0g7x6uwGF1+KMyKZhzrqedozD5vFGIAtKCXlladYowOBE7n32YruVTOjc2WW8Wy95zWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251542; c=relaxed/simple;
	bh=btp0ahAy6LBIoB3XVOo5n17adhIJSN8wNB4xFTiVqQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fu7/QnXzyNU5yv8oEwPYuY9KSKJX0s35ml+MW7zSOhKtkkSW1xhqK71pO5leZz8L4UCPIYJaSC3ziPN1b+09bjYmIFaPkkvCsUWadrRa3MHAFsnW1eWt15rgp9FvzUJCkvB0Eu8YNIoigtpvOWubSd41SpsASwfI6saOuopmbD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YtxZYAMh; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=R/lPwsOF; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YtxZYAMh";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="R/lPwsOF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O4v8cF3450717;
	Thu, 24 Sep 2026 07:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2MP9lre9Pb04H+V3gZwq6IdZdBTNP8erNlmQW/4KYcU=; b=
	YtxZYAMhTxO+XNBlqupNO8vFoMrjpZscA/GfSNPiaFFSTdNBptUnJne06iZ7gWcS
	Y+hWf7bBgy9wrYa1OJM2fG90c5bCm5kgBUPErYz4OvUsyH68UhA+7KhDQzhJxF/S
	bqBZhs0FCje1+Ox0km7I0OE5JvVuGuWF2HfkB876DLxZNOxgDZHOsxy2BnOOWufo
	wohMbkamTzALBj1kz5Tvaj+csqWNnMAT0wyokcxKrpAgAhMwd0eObTOtfXE/Q92O
	3SjohyYjVVCrJ9wUoIXLo3nbZMMztD0Vz9979YJeIIcosIK6I2XLtQHCjZ+yBJX0
	1zL+j4mVJv26DzAUIASgZQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023120.outbound.protection.outlook.com [40.107.201.120])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gvkc599qn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 07:05:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FfRFUpltq/VSMZLqaozu4NFy21Hpv+OkU9I+1KtzZXncN1qHONMAce8W48eU0h27/hZMkMwbygiGdz87ZV8t8cZng/0alUHlYh4o+VvS7CcwPaNnAJDN2OX+VikaXkBXRMSP+Ot9AbvhYfGgK1ZKVFoJ0dbAho1Tox8h9k+d8Zf6zlOGmEOAFZPFtTxlqrvHdPsayQgn8PCHH/1DR4qzXy4vj9HnWvg1tGrR8jTkzAfHNJKP0aq91QealTWAcbHGIGbKz3xL2aMzPNk8JwMv1nmG3/9zkGjWpj569N9tOX6kAf11A+TIIf7l044o/IRol0aitWTjyC7jk/BibBbjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2MP9lre9Pb04H+V3gZwq6IdZdBTNP8erNlmQW/4KYcU=;
 b=yR9Lo9Ln09ixU5FJpkthmnXV/l2h1Aa0gHiUtH1G+sarBh6p/8VC6VnNGgh5BtlCszzaUPbm9I7OUeo/v1icf73/0dozWe3H+1Tc/auL2AtZdUrP8+q8P1vk08fLlOmRQ+nUxC9CpeALAOclqtIzwROyn+SGkXVJ6Q/DvQTIMwUrI1jV3RAmlBZcJIHeGqAqr8IS83MF/I14XrBIWFhTVu+T3uGyJW2CTCw6DcAMIS0umXoAT/MJafoRYAg5miFt0Ho512kp5F7DjE7d68nuUMW0JLZCtfahnlFpRNfkY+GdAUDp+TinILaZ3YzpnQaOox2vRuCDAJal2re6IeF4HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2MP9lre9Pb04H+V3gZwq6IdZdBTNP8erNlmQW/4KYcU=;
 b=R/lPwsOFBHHT6sSfbPiEHXbriE5HHcDzyh/F+I2aIfInjvehMn+UGwWkXMkK2ZQ91Gl/oZR5Mi2lq9/jvptdYaDSi54tt0J1IZGUXHR6UK9b8YF8/LoRPRu7UZxKCsXyXCN4kwPBXnky6oj0+sgX3vHk2AxPdk+i/FkJHKfAPsY=
Received: from BN0PR04CA0173.namprd04.prod.outlook.com (2603:10b6:408:eb::28)
 by SA1PR19MB4864.namprd19.prod.outlook.com (2603:10b6:806:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 24 Sep
 2026 12:05:26 +0000
Received: from BN3PEPF00022BD1.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::70) by BN0PR04CA0173.outlook.office365.com
 (2603:10b6:408:eb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 12:05:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF00022BD1.mail.protection.outlook.com (10.167.248.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Thu, 24 Sep 2026 12:05:26 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A2867406541;
	Thu, 24 Sep 2026 12:05:24 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9111182024B;
	Thu, 24 Sep 2026 12:05:24 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 RESEND 1/2] soundwire: Add a helper function to indicate a device will detach
Date: Thu, 24 Sep 2026 13:05:19 +0100
Message-ID: <20260924120520.2511081-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
References: <20260924120520.2511081-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD1:EE_|SA1PR19MB4864:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8900d29e-0bc4-42b3-2195-08df1a341e85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|23010399003|36860700016|11063799006|6133799003|10067099003|56012099006|18002099003|22082099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	gMZKdkMg7fRil49wZsuIwHw5LBtmgJj31IVPBq1H52+x636jlNrHjfbxxmetBFtPlS8gcYliP0uiBD8X9QSNUbCrkoorDnxGSWmfweo8fqGlT2UYKJteaYoO0ri6or4A1ALybyPnqrtBawkpDDtxhATgnYiAUrWFqD7PmwInPH7EYy0LZ9Kwdel+dJtra3UlLQdktfEVJbyHWSENuS9kgF8fkY6ZIoYceGYvzMqEhLdNGD6w+lKjPy9lljRysBQX40DCOBSjYKSzfvntpu8EITnSrUdeistaZ2SwzmqzQGD2o/vdyZjE+lo4Xtu4erfH5oWYv0X6nRdBWZG7nC82vNNzJGnULLQAHzx0ShIHL5nMODUkFTFPPGWD5i5wEp+SoW1P88MPevfPV2YSwuw3QmJafQYMxPhsjoBZJNPLpDhcfyoQtosnfY4MMdVqpmEyHw0qLaEBp+rJGhWtE0Z9EZqqS4KeOol1KugU27vIGICHPBQdUozgGpE5OdrpS1LHxazcxWE9ZXIblJMvfhA1gLvim/H1sj4ejaYLpy7PFmR6nnacoSB80LeTDOdMZcoZnzbt1ryVcC2CUZvuYEKfCwg3C+y0QWzlHjUFT9x3QFdlkw29fPQjEDjnrmtKLfquWrCt4PlgBKdOWG7mZmvZyfjCdjHycdxaDeGyGIGEhPw2zLriHp96OAVLfynyAoClmrRNtyIc2G6dcMl2NC1qZQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(23010399003)(36860700016)(11063799006)(6133799003)(10067099003)(56012099006)(18002099003)(22082099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m9VEzJiJNdTPCD1lKLxw+bO2x/Mblf4Ico8ozupmKv/KLEiHL8Wqy3N+srIM41nqrCtLWpPTLfko68YJXxcXp+bohNyBqfTK7q2F/c3h5XcQVABR8lb+CPiJfZ3q/v6jGVwCUZ6swuiYiYXud+Jmg6rLdXL5iIrBk1TucVS789VMSk4S71rKzp7PUW61ZhQhbps9nztuDIXI8NchP5Gq15SRunyg7PQM9DyQ5aQ6dXW4tzkogb3NzyhYdtaBypK2zSmIp2yqBI7J1aXL2yzGmoNamVRftiH+/J5zQxGbY8tRSZ5xZgWH8FJryAf4xtOyMHvqwAQh4bVKo2HbG0XLs6/j8QHD0ANYFcoaPlKDjsYhl2ysmkS7kgjTIHxpdyPro5uZLiaaUbc1jrnNtbehdNN5bCog0raqK27ATtV0NxHHxk7UgA+0xkotmpt21dsB
X-Exchange-RoutingPolicyChecked:
	IrNWlloRGyTVWQe+K1HGp7CuUmXvH1PsUd66qB/IkR88ZaV7pOOzo+dtkQ+0rJ/tifLh5v8Iu6memo35rI+HraOVwT5jHlwWOtIVP8XIkyOaKJnGIFaT1qPl2B83FxRXrDFa+62Vm9Y4r2HGzdjskKTx4Sr7jNgtF13yH/uFIosPCULUEMX5Eb5cDtxVFXfJY5dHPdowUHGvuNKQUfsV5OIAZPrYuVjrznrjTTV31A9rgP6jOcH3yJ3pgOMXSqhj85r5usEscpYJOd3ja3FmeySQM2SyuCzWbD0sZDAxMUsn8OYvne+Ip39o1v0fAWBJQumHV0IHIHzJBKPUcj0rWg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 12:05:26.0423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8900d29e-0bc4-42b3-2195-08df1a341e85
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF00022BD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB4864
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0OSBTYWx0ZWRfXzc0tcjPMrQIv
 SqXaK6UZpPBzSCUfUOMNNW+XJQlq08j2xYH3r0+nOLDLkmuH62cbGjOo13B57Kv4JtTbM1d3wEq
 6rKL1Zg5g7GUvgHnotjlzO6Cj4kDzMzx3KSbofRK56kuzUH4OXqabFf6TR3SeGhCn9jAZss0v7t
 1YOsJMkc6qBVO/grqi1vD+cRcZQLLqB+UC83ztiQGpGIafGQMXrbxqokEmJq3ZGuzNUqJHj50fz
 eGCWOj9gY2NQn48v4YBcAlkeUuer3l2n6cZyAtUusDnWwc2rtvH8k4Bwyuss8wL1Oxq+fJQDIhz
 ZyXOJRZ0Jt6LW6w3HHPCAON7dcUZB/xC9ARN1ZF6oPOec6Vlao5syKYbviGmgxC1cUB4Ky7MXWF
 MDk2WCSidIbBrBkvV76encrAWvPFCQSKJO8tDj5hoPfUEccxgGb11Lq4qSHceObfwOzcEYwuIZu
 OAE7+P4NxTWdx2SEh2A==
X-Authority-Analysis: v=2.4 cv=ZcyIpcVA c=1 sm=1 tr=0 ts=6ab51209 cx=c_pps
 a=l4k2vjVpr9fnFs3jNJfJ4g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=8GfHkCRbLTLxf0Ih6UUA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0OSBTYWx0ZWRfX+ihb/ZH5r7OG
 pMHih/mbX1W6OV5cJkQ2QdpfvRtnizFzWbuHVGbK36HwfUO7mcpIUU8os/iQaYgqlYhvDvHS3OT
 vaTyT4CJkn2btFwbOK4VLTcBV2HEerM=
X-Proofpoint-GUID: BW1x86cbs4th2sLeZGTeNTn-i0O-DkWu
X-Proofpoint-ORIG-GUID: BW1x86cbs4th2sLeZGTeNTn-i0O-DkWu
X-Proofpoint-Spam-Reason: safe

SoundWire devices will sometimes need to reset themselves,
typical times might include when taking over the device to ensure
a consistent state or after downloading a firmware update to boot
into the new version. Often such a reset will also result in the
device detaching from the SoundWire bus, in this case the driver
has to be careful. Naively calling sdw_slave_wait_for_init()
after doing the reset could immediately succeed if the bus hasn't
seen the detach yet, causing the driver to proceed attempting
to communicate with the device whilst it is detached.

Add a helper function that a driver can call to indicate it is
about to initiate an action that will cause the device to detach
from the bus. This will reinit the completions in the peripheral
for device attach, ensuring that the next sdw_slave_wait_for_init()
will not complete before the detach has been seen by the core.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/bus.h       |  6 ------
 include/linux/soundwire/sdw.h | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/soundwire/bus.h b/drivers/soundwire/bus.h
index 44e4f51939176..59b6aee0ea6eb 100644
--- a/drivers/soundwire/bus.h
+++ b/drivers/soundwire/bus.h
@@ -231,12 +231,6 @@ static inline void sdw_fill_port_params(struct sdw_port_params *params,
 int sdw_bread_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr);
 int sdw_bwrite_no_pm_unlocked(struct sdw_bus *bus, u16 dev_num, u32 addr, u8 value);
 
-/*
- * At the moment we only track Master-initiated hw_reset.
- * Additional fields can be added as needed
- */
-#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
-
 void sdw_clear_slave_status(struct sdw_bus *bus, u32 request);
 int sdw_slave_modalias(const struct sdw_slave *slave, char *buf, size_t size);
 void sdw_compute_slave_ports(struct sdw_master_runtime *m_rt,
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index f710e5932b4b2..4937d1a2f24f7 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -25,6 +25,13 @@ struct device_node;
 struct sdw_bus;
 struct sdw_slave;
 
+/*
+ * At the moment we only track Master-initiated/Slave-initiated hw_reset.
+ * Additional fields can be added as needed
+ */
+#define SDW_UNATTACH_REQUEST_MASTER_RESET	BIT(0)
+#define SDW_UNATTACH_REQUEST_SLAVE_RESET	BIT(1)
+
 /* SDW spec defines and enums, as defined by MIPI 1.1. Spec */
 
 /* SDW Broadcast Device Number */
@@ -1218,6 +1225,25 @@ static inline int sdw_update_no_pm(struct sdw_slave *slave, u32 addr, u8 mask, u
 
 #endif /* CONFIG_SOUNDWIRE */
 
+/**
+ * sdw_slave_signal_unattach - Signal that the peripheral is about to detach
+ * @slave: Pointer to the SoundWire peripheral.
+ *
+ * Inform the core that the peripheral is about to detach from the bus, this
+ * is usually due to some implementation defined reset mechanism. After this
+ * sdw_slave_wait_for_init() should be called to wait for the device to
+ * return.
+ */
+static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
+{
+	if (!slave)
+		return;
+
+	slave->unattach_request = SDW_UNATTACH_REQUEST_SLAVE_RESET;
+	reinit_completion(&slave->enumeration_complete);
+	reinit_completion(&slave->initialization_complete);
+}
+
 /**
  * sdw_slave_wait_for_init - Wait for device initialisation
  * @slave: Pointer to the SoundWire peripheral.
-- 
2.47.3

