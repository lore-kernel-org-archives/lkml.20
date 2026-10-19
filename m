Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792428521;
	b=4SSV9IeiJim3VA2FrxZQBtpO1Q/LhH1hWjgGS6+y7QeBwOr+Ntk2S4cr95FVA9bOYcfk
	 yuHYkvMsQ/a2r9pjXDSjszub4OvzClxJk/ZZ0CElH3v1j9m4ZlmflFWN1L/yTuk4QnfHY
	 mExhETj1VdxXVt+SrIRztV44LuW5arKSODq4N0RNgFVoVs7JOVf0d6Cu0RB4ZMIbXT2/O
	 WfnU7w/0Y0x1pDZ/TKm3+L5JLu/PzO391dGAR3YTw8BcDMgXITiOrUsMxtbUdCj8o08I3
	 tuz0PZqShKEuRrqSs9+Mz+GfHWWlu8TBmrvuQHI3ZoHkyq4I1CPXnPTh3mBYK8TLmRA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428521;
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
	bh=zcfekY3WGh4o9LfxFjdF+Vj3CeqhpCqtpH9DngobLUo=;
	b=rX+4epPGggyOSdC/difyMOOPqg9rNCA7ArTI7BKK7CNUuU6TBZIqzfDkkvIQDNqhEqWg
	 dVUChtLg7xJSQvAdF+cHUScaQJg7/PCBEw2Wj8sJ0Vg9dS3vCfKsWQdyJIN5xwRHQDuQz
	 00kg8gv/Xajv+7+QF7SLqgUuknjthd+poe9CI1Fl37eSUXtrerniEWkts9issBNQOEh4L
	 f7C6AgZE3sH1YA/uJ27LDVXwDb9caQmH7HWs3jdCCCkUD54bIw1x8qlDRymuGIPcdQg8Y
	 4yZnyEow6j7xuOEq6p42NgkTKsGHUV9r5I4dnIirG+yi2zpfO+QD5lw0aizs2ah9qMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="fjo/Gw7J";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.62.23
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011023.outbound.protection.outlook.com [52.101.62.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1E8606AEDF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA1E8606AEDF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=fjo/Gw7J
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ri1busj5h1yesG+CTqHn6QEwY8lRkzUbJzyqTzHhYQLS0jHg/QfPpDrq62frXFITBf+hv+ckwzu+JmQuXhJh2GS++psVUWTgGBEU+gu/DFG8cPwjVyqD7OeJJEgVAqwbamF3w4ZXILAm2GWGH9NQLh2fQa7y4Pn0kBSutNmGdrvYPMTtGTbchDblj8Y07cWYQBhdPYt676YhRcNS3aHXUXY0YLTmJZhYWmjTYg3LWuNlHr2AS4a5EzZZ8tYDcgyZgHK2em5K8nwTiIU069lZlfadS4/a2CqdPxGuAE+3N2FcOLKaSjrYN/V7qkSAd+yXAZ7exBeNcY59/1ax+AV37A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zcfekY3WGh4o9LfxFjdF+Vj3CeqhpCqtpH9DngobLUo=;
 b=PgqBxyHJ23Jln6dXl2wAxXud8r/9EuLeMbEomhfXT/jQ6aRMUtiyl05wo0EXMgSuhi2gNw/2phkA1f6BAf11HVTo/xHccWyEyTV/xlscBLUdusdtWA09FHfppb9YWRfqQU+MymZlLt9RdRHV6r0Zy8CUi4ZVzZdSQjnCOQimD04EL89e1wXmGHyaljThHeO9XG41XN787EbzNKh7zwhii6ulVz1LO3ORKkDLUbETfjxRjmE6qRach9w0FNTRYNTUqr6K5lIPbriT7wHt58XxWd/uHM3h5UT8fxB23scfF2cAbv6kFRg+XDgog25noe44wMqIlswaz3+kDxzofQ6O0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=quicinc.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zcfekY3WGh4o9LfxFjdF+Vj3CeqhpCqtpH9DngobLUo=;
 b=fjo/Gw7JV99nj7fKmq7PL0iQjxmJ/jFPBiCjr0Z5FLdjgQRd/YMR7rk04g3vsNAkms6d1G21bwvRAKkUff/gXSkUPVr0k+hieI3i8GKIBSD6IND/aef8vQEN9WjPUDJtCSf97j5639RqCKAzhwuxwPL9aQQSiG2tldhxbPOxK2c=
Received: from CH2PR18CA0060.namprd18.prod.outlook.com (2603:10b6:610:55::40)
 by MW9PR12MB999210.namprd12.prod.outlook.com (2603:10b6:303:301::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 16:47:59 +0000
Received: from DS4PEPF000001C3.namprd21.prod.outlook.com
 (2603:10b6:610:55:cafe::8a) by CH2PR18CA0060.outlook.office365.com
 (2603:10b6:610:55::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 16:47:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS4PEPF000001C3.mail.protection.outlook.com (10.167.23.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.0 via Frontend Transport; Mon, 19 Oct 2026 16:47:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 11:47:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 19 Oct
 2026 11:47:51 -0500
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 19 Oct 2026 11:47:50 -0500
From: David Zhang <yidong.zhang@amd.com>
To: <quic_jhugo@quicinc.com>, <karol.wachowski@linux.intel.com>,
	<max.zhen@amd.com>, <lizhi.hou@amd.com>, <ogabbay@kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
CC: David Zhang <yidong.zhang@amd.com>, <sonal.santan@amd.com>,
	<mario.limonciello@amd.com>, Wendy Liang <wendy.liang@amd.com>
Subject: [PATCH V5 11/19] accel/amdxdna: Decouple AIE4 doorbell and MSI-X notify transport hooks
Date: Mon, 19 Oct 2026 09:47:38 -0700
Message-ID: <20261019164746.827277-12-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019164746.827277-1-yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
 <20261019164746.827277-1-yidong.zhang@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS4PEPF000001C3:EE_|MW9PR12MB999210:EE_
X-MS-Office365-Filtering-Correlation-Id: 4472483f-8b81-4b04-993f-08df2e00bbbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|1800799024|36860700016|6133799003|18002099003|10067099003|22082099003|4143699003|261009223027099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	5lTqn/BTjibhpfYEv0Vi2H3oVUjaYvqqjPnDhfjigAY1G65stGn7L+WVPZrqu6KQIx5GwJo/GsTrp5nJ3t4dWhgoGGds7xipEi0ULHOInxl3VA25g6kl48NPYkbN3jv+5eDMDeB3eiE18TFn1bf6LkR9B2hkoGGb63K0Jssww0QYPKcn9duAu4lfZ/y4KvS8dbWGok0Z9UwUmFYxuBYUjBugCKyhnLVEOIRWY8wtvUSFhiPLcOaxF0F7w7tURYOW+DCr6pReKwTTA3WklOCMuGWkonEV547UgPhIyl1/Hd8HP/fVnys17JySBYaT5ty1fSldh+JJNZ+1xF8Bm5iT1gwpfag2DAyrbsqRsg7uXt2nHjCBNKBjlyoXlkI052LL5VE9znEpcTTe3leA0ziC0c/NvxRls+Bv9aqucVujsZeT+xng07vbz0lIWSVf1RQ7361b0k5KgoHx60zXNfiZnyTGKMuPPj86DA58z4LZyX1yN3VmDdviCYY6q1JLqS/C90TX6BJ0jA4n0+QIkaExthoxjHd6SxzdaBYzMZ4umF3vRgp4jVmrFB4l+xpiU+ontI3cFI6APemZc8Crx/lstQr60G1+WxHEYVCwLsLzoYtFci6PxYdbw8bWg4vEhdL/e/2O4ybT+4ZL/BlkqQRXrreFbs5E7yHrC9PqRFCj4+Q=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(1800799024)(36860700016)(6133799003)(18002099003)(10067099003)(22082099003)(4143699003)(261009223027099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D75Fo5bhLXT5xXUlaRAMMVLbapH3pZ3naysenzP9LlfND/xi1Hz6qd7UYctBknz93CIoW5dzgqh6w7j+Hw3LI5mhrJWRnTJN+dkOFD0RfeGxLs+lq8y3kW/nFahZlvYsYlwTnoj/+nakIWOw+wnPOTScL6k3GDNwIYGpJ0gTPJ2vGnRB3/I0LwIpuoEFktsGGXL+NZskJth4oAqyrmqGXegAjIsiPV3XIrsTXnoSnjRCz3+fT4dCowz5eNDUGPvlKZRqS+D3s28p4tcMQspD5k0OaKgsiYfHVemvmayIswhVWpCat/9hl5zmzRgYo7cuzw8ejrRLWnFLVgklThke6cS0RAVz16A5AI6wL7B6OoT7NdARl+rPPbd4Jl/m2saSRxq7Erf3ta3/idDZ7Rz3sPzivM3bWeh8pjqNx+dN12xaXnwCNLcePaINxmEzEQqF
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 16:47:59.3738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4472483f-8b81-4b04-993f-08df2e00bbbd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS4PEPF000001C3.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW9PR12MB999210

Separate PCI-specific doorbell and interrupt notification handling from
the transport-neutral context code.

The new transport functions are wired in later patches in this series.
Doorbell ringing is not invoked until full context setup and BAR
validation are done, so no NULL dereference or BAR boundary bypass can
occur.

Co-developed-by: Wendy Liang <wendy.liang@amd.com>
Signed-off-by: Wendy Liang <wendy.liang@amd.com>
Signed-off-by: David Zhang <yidong.zhang@amd.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie4_ctx.c    | 38 ++++++-----------
 drivers/accel/amdxdna/aie4_pci.c    | 66 +++++++++++++++++++++++++++++
 drivers/accel/amdxdna/aie4_pci.h    | 14 ++++++
 drivers/accel/amdxdna/amdxdna_ctx.h |  2 +
 4 files changed, 96 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/amdxdna/aie4_ctx.c b/drivers/accel/amdxdna/aie4_ctx.c
index 5eb918e1d58c..20b725de6ab7 100644
--- a/drivers/accel/amdxdna/aie4_ctx.c
+++ b/drivers/accel/amdxdna/aie4_ctx.c
@@ -22,63 +22,52 @@
 #include "amdxdna_mailbox_helper.h"
 #include "amdxdna_pci_drv.h"
 
-static irqreturn_t cert_comp_isr(int irq, void *p)
-{
-	struct cert_comp *cert_comp = p;
-
-	wake_up_all(&cert_comp->waitq);
-	return IRQ_HANDLED;
-}
-
 static struct cert_comp *aie4_lookup_cert_comp(struct amdxdna_dev_hdl *ndev, u32 msix_idx)
 {
 	struct amdxdna_dev *xdna = ndev->aie.xdna;
-	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
 	struct cert_comp *cert_comp;
 	int ret;
 
-	guard(mutex)(&ndev->cert_comp_lock);
-
+	mutex_lock(&ndev->cert_comp_lock);
 	cert_comp = xa_load(&ndev->cert_comp_xa, msix_idx);
 	if (cert_comp) {
 		kref_get(&cert_comp->kref);
+		mutex_unlock(&ndev->cert_comp_lock);
 		return cert_comp;
 	}
 
 	cert_comp = kzalloc_obj(*cert_comp);
 	if (!cert_comp)
-		return NULL;
+		goto unlock;
 
 	cert_comp->ndev = ndev;
 	cert_comp->msix_idx = msix_idx;
+	cert_comp->irq = -ENOENT;
 	init_waitqueue_head(&cert_comp->waitq);
 	kref_init(&cert_comp->kref);
 
-	ret = pci_irq_vector(pdev, cert_comp->msix_idx);
-	if (ret < 0) {
-		XDNA_ERR(xdna, "MSI-X idx %u is invalid, ret:%d", msix_idx, ret);
-		goto free_cert_comp;
-	}
-	cert_comp->irq = ret;
-
-	ret = request_irq(cert_comp->irq, cert_comp_isr, 0, "xdna_hsa", cert_comp);
+	/* Transport-specific: PCI wires an MSI-X irq, platform an IPI callback. */
+	ret = aie4_request_notification(cert_comp);
 	if (ret) {
-		XDNA_ERR(xdna, "request irq %d failed %d", cert_comp->irq, ret);
+		XDNA_ERR(xdna, "request notification for msix idx %u failed %d", msix_idx, ret);
 		goto free_cert_comp;
 	}
 
 	ret = xa_err(xa_store(&ndev->cert_comp_xa, msix_idx, cert_comp, GFP_KERNEL));
 	if (ret) {
-		XDNA_ERR(xdna, "store cert_comp for msix idx %d failed %d", msix_idx, ret);
+		XDNA_ERR(xdna, "store cert_comp for msix idx %u failed %d", msix_idx, ret);
 		goto free_irq;
 	}
+	mutex_unlock(&ndev->cert_comp_lock);
 
 	return cert_comp;
 
 free_irq:
-	free_irq(cert_comp->irq, cert_comp);
+	aie4_free_notification(cert_comp);
 free_cert_comp:
 	kfree(cert_comp);
+unlock:
+	mutex_unlock(&ndev->cert_comp_lock);
 	return NULL;
 }
 
@@ -90,7 +79,7 @@ static void cert_comp_release(struct kref *kref)
 	drm_WARN_ON(&ndev->aie.xdna->ddev, !mutex_is_locked(&ndev->cert_comp_lock));
 
 	xa_erase(&ndev->cert_comp_xa, cert_comp->msix_idx);
-	free_irq(cert_comp->irq, cert_comp);
+	aie4_free_notification(cert_comp);
 	kfree(cert_comp);
 }
 
@@ -100,6 +89,7 @@ static void aie4_put_cert_comp(struct cert_comp *cert_comp)
 
 	ndev = cert_comp->ndev;
 	guard(mutex)(&ndev->cert_comp_lock);
+
 	kref_put(&cert_comp->kref, cert_comp_release);
 }
 
diff --git a/drivers/accel/amdxdna/aie4_pci.c b/drivers/accel/amdxdna/aie4_pci.c
index 544a7d6a02eb..10645b193b40 100644
--- a/drivers/accel/amdxdna/aie4_pci.c
+++ b/drivers/accel/amdxdna/aie4_pci.c
@@ -15,6 +15,7 @@
 #include "aie.h"
 #include "aie4_msg_priv.h"
 #include "aie4_pci.h"
+#include "amdxdna_ctx.h"
 #include "amdxdna_error.h"
 #include "amdxdna_mailbox.h"
 #include "amdxdna_mailbox_helper.h"
@@ -111,6 +112,69 @@ static void aie4_mailbox_fini(struct amdxdna_dev_hdl *ndev)
 	ndev->mbox = NULL;
 }
 
+static irqreturn_t cert_comp_isr(int irq, void *p)
+{
+	struct cert_comp *cert_comp = p;
+
+	wake_up_all(&cert_comp->waitq);
+	return IRQ_HANDLED;
+}
+
+/* Wire per-cert completion notification interrupt. */
+int aie4_request_notification(struct cert_comp *comp)
+{
+	struct pci_dev *pdev = to_pci_dev(comp->ndev->aie.xdna->ddev.dev);
+	int ret;
+
+	ret = pci_irq_vector(pdev, comp->msix_idx);
+	if (ret < 0)
+		return ret;
+	comp->irq = ret;
+
+	ret = request_irq(comp->irq, cert_comp_isr, 0, "xdna_hsa", comp);
+	if (ret) {
+		comp->irq = -ENOENT;
+		return ret;
+	}
+
+	return 0;
+}
+
+/* Tear down per-cert completion notification interrupt. */
+void aie4_free_notification(struct cert_comp *comp)
+{
+	if (comp->irq >= 0)
+		free_irq(comp->irq, comp);
+}
+
+/* Validate and configure hardware context doorbell target. */
+int aie4_doorbell_setup(struct amdxdna_hwctx *hwctx,
+			const struct aie4_msg_create_hw_context_resp *resp)
+{
+	struct amdxdna_dev *xdna = hwctx->client->xdna;
+	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
+	struct amdxdna_hwctx_priv *priv = hwctx->priv;
+	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
+	u64 db_off = (u64)ndev->priv->doorbell_off + resp->doorbell_offset;
+
+	/* Validate doorbell offset against mapped BAR bounds. */
+	if (db_off + sizeof(u32) >
+	    pci_resource_len(pdev, xdna->dev_info->doorbell_bar)) {
+		XDNA_ERR(xdna, "doorbell offset 0x%llx out of BAR", db_off);
+		return -EINVAL;
+	}
+
+	priv->doorbell_addr = ndev->doorbell_base + ndev->priv->doorbell_off +
+			      resp->doorbell_offset;
+	return 0;
+}
+
+/* Ring context doorbell to notify CERT. */
+void aie4_doorbell_ring(struct amdxdna_hwctx *hwctx)
+{
+	writel(0, hwctx->priv->doorbell_addr);
+}
+
 static int aie4_irq_init(struct amdxdna_dev *xdna)
 {
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
@@ -629,6 +693,7 @@ static int aie4m_pcidev_init(struct amdxdna_dev *xdna)
 		set_bit(SMU_REG_BAR(ndev, i), &bars);
 	set_bit(xdna->dev_info->mbox_bar, &bars);
 	set_bit(xdna->dev_info->sram_bar, &bars);
+	set_bit(xdna->dev_info->doorbell_bar, &bars);
 
 	for (i = 0; i < PCI_NUM_RESOURCES; i++) {
 		if (!test_bit(i, &bars))
@@ -642,6 +707,7 @@ static int aie4m_pcidev_init(struct amdxdna_dev *xdna)
 
 	ndev->mbox_base = tbl[xdna->dev_info->mbox_bar];
 	ndev->rbuf_base = tbl[xdna->dev_info->sram_bar];
+	ndev->doorbell_base = tbl[xdna->dev_info->doorbell_bar];
 
 	pci_set_master(pdev);
 
diff --git a/drivers/accel/amdxdna/aie4_pci.h b/drivers/accel/amdxdna/aie4_pci.h
index 959ef3695813..9fcdfcc5a15f 100644
--- a/drivers/accel/amdxdna/aie4_pci.h
+++ b/drivers/accel/amdxdna/aie4_pci.h
@@ -32,6 +32,8 @@ struct amdxdna_hwctx_priv {
 
 	struct cert_comp                *cert_comp;
 	u32                             hw_ctx_id;
+
+	void                    __iomem *doorbell_addr;
 };
 
 struct amdxdna_dev_priv {
@@ -54,6 +56,7 @@ struct amdxdna_dev_hdl {
 	const struct amdxdna_dev_priv	*priv;
 	void			__iomem *mbox_base;
 	void			__iomem *rbuf_base;
+	void			__iomem *doorbell_base;
 
 	struct mailbox			*mbox;
 	u32				partition_id;
@@ -111,6 +114,17 @@ int aie4_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq, u32 timeout);
 /* aie4_pci.c */
 int aie4_restore_power_mode(struct amdxdna_dev_hdl *ndev);
 
+/*
+ * Transport hooks implemented by PCI backend. Doorbell hooks are wired during
+ * kernel queue creation and command submission in later patches in the series.
+ */
+struct aie4_msg_create_hw_context_resp;
+int aie4_doorbell_setup(struct amdxdna_hwctx *hwctx,
+			const struct aie4_msg_create_hw_context_resp *resp);
+void aie4_doorbell_ring(struct amdxdna_hwctx *hwctx);
+int aie4_request_notification(struct cert_comp *comp);
+void aie4_free_notification(struct cert_comp *comp);
+
 /* aie4_sriov.c */
 #if IS_ENABLED(CONFIG_PCI_IOV)
 int aie4_sriov_configure(struct amdxdna_dev *xdna, int num_vfs);
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index 6e78bab8a02c..9bbc3db4ebde 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -6,6 +6,8 @@
 #ifndef _AMDXDNA_CTX_H_
 #define _AMDXDNA_CTX_H_
 
+#include <drm/amdxdna_accel.h>
+#include <drm/gpu_scheduler.h>
 #include <linux/bitfield.h>
 
 #include "amdxdna_gem.h"
-- 
2.34.1

