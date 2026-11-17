Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794895691;
	b=truhoclhqJh+THkHV5zlYCIPw+buB/SYCeAwn3owhkZyun5+HScTqcttb7+b7yzzJq9u
	 GMWM8C5F/a3aaHSLNHTnTdRAsWCyJfGNsLWThCtJ6pV2QzGCIiJXDyGfXI6IH/5F9IGkN
	 43478Dk/XCgk8wQwc8Fx9LjJzJA4ZpoeVJfIgKhWqmDyN05dytdAndoHmRVdHzm4rvdqF
	 X62hip5kswERSuWEnVxmVbwmN7wdjLdQzHMZr1mOll6O5wKeeCU03F8Y8d9Z0lBUk5XdU
	 3W8ALik4LC7OuI5SI5vGtbgQSjYTgPAssFtL7GV6QHH69HZPV4wOMBcLS3LzaOMbr+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895691;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=JArB0TCLvqTQwIZiFlW3YcOZsEHdtxAA3sZK2WkEo00=;
	b=YSUA7sYjRmosfbomd4ku9/JA/wVFELk65d5aRrym5WmVr0f9y9qb7wZw6lyhRZ+L2mYJ
	 0HaYo37WbfYHE5XhKKWycFr9VI/1jvFyfjuAkYWcODtddt/fFLDDWAFBHn4etu1HErM9s
	 aaApICOVX3FnKipP02f1d/pNz7nDWqnCTYXE+L4x1NFuUTHwkFCy26gCbi+7nFwIo7aOK
	 jgDyKF30K8dAxc5SADg0n2E7nufmaTL4nfSgv9nbIDYsTNJBefknTnZ0yG6GuyQsZnTlM
	 yyxh4toWvUDM9FpBJ///nDxnyQ/+D5mrxTXpa9ypTWWvtPEUSBxcaOoQFHDrRtJTaIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ouQxdoCf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.49
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF99606A31C;
	Tue, 17 Nov 2026 06:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AF99606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ouQxdoCf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBLT+HU5RnQC0CzoaCfNGmGHtyLwKlRomDbnBM3t/5ThvJnj6rwyfuYVY/t0wUKxKRDp6SEZ+vvUlBx4rfm+WpylCIFJRezXtImASANe/K8OnPV1kna5JtbVVST+AgRD/7I1OB0HoRWF63pCQZh0HNrDh/31S1khhapU/Hk0PBG7nhgmPVcq9IGKC/xv07yNmoSC5sGsyNrjy/DofN76WwTbp+l2m3cYhOSbLmsARugKmXcnAiMzpLtLg4ID2LQsBgXIZ9e0urCXjqYA4u6fM24Jtph10GYQJizwqtvxEq+zKmdzm6mVufoIkMr09ymNmAgWQr23KDfBDgP/zTZXDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JArB0TCLvqTQwIZiFlW3YcOZsEHdtxAA3sZK2WkEo00=;
 b=sS8DzTStvbRKY1Cyv/zR+9X5ELLeOQLCGHq/Cthi1F4sFK9vs9zGDSs7hOTT1Jb6O1CgDMj2u+I+sHkdP4eWfhClsu4VReDGSvaUGhU5Mbc3wHW/adBXvUZC0swsswVx0X7Tu6Ko0yGy76/ceGrrRPAN53xAPCR1Yw4bxlMlEmfu3ktMm4YJ3RCa7v9bYf6ScckOtAGDXrLmT1bSUjpirRauxtJb3pxmPpbzW/sQmWQAKZ5xZU3AZ/2FZRYU1dcwUpeSb4XuRgKsy31AEKH8daOnjT9MwP5OmQxuCj+MpZgxvTksQBzoqk+DCxIR3zJfxBL7C+6s6Ttbm2Zo8XSIKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lunn.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JArB0TCLvqTQwIZiFlW3YcOZsEHdtxAA3sZK2WkEo00=;
 b=ouQxdoCf+EKbDSxpHAiPLLZdUL5CSG9l3Fc9x6CjfLPBjlQyWQhBMLeozGvtJ3Amb0hVtxVrECordo5FoZeG52mM8HXFGgShJkw5L+hKsJuGCxrUIZUSh0YJj/majqkZ/THc/0CKkwaglNEUABdLlXfBD9H8wZ9As8eZE24MYSc=
Received: from BL1P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::10)
 by SJ0PR12MB6854.namprd12.prod.outlook.com (2603:10b6:a03:47c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 06:08:02 +0000
Received: from BN3PEPF0000B36D.namprd21.prod.outlook.com
 (2603:10b6:208:2c7:cafe::68) by BL1P222CA0005.outlook.office365.com
 (2603:10b6:208:2c7::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 06:08:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B36D.mail.protection.outlook.com (10.167.243.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Tue, 17 Nov 2026 06:08:01 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 00:08:01 -0600
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 17 Nov 2026 00:07:58 -0600
From: Srinivas Neeli <srinivas.neeli@amd.com>
To: <radhey.shyam.pandey@amd.com>, <andrew+netdev@lunn.ch>,
	<davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
	<pabeni@redhat.com>, <michal.simek@amd.com>, <netdev@vger.kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND net-next] net: xilinx: axienet: Derive RX frame length from residue in dmaengine path
Date: Tue, 17 Nov 2026 11:37:57 +0530
Message-ID: <20261117060757.1767493-1-srinivas.neeli@amd.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36D:EE_|SJ0PR12MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 88d9e906-2848-4a2a-95e1-08df44712304
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|1800799024|376014|18002099003|6133799003|261009223027099003|3023799007|13003099007|260925021311599003|260925021911599003|260925022911599003|56012099006|11063799006|261102123227099003|261026121527099003|261021121427099003|261028144727099003|261026140227099003|261022075727099003|261022113327099003|261022105027099003|261021123027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	xiGnKlUCq59qk8JronjL3qgC7SIlosn71Bgo/xKb/vALOZGSVfBPuCbTu6+TYEW5qKOd4hcUL+gd6xBXargZwDK0741CgD5To32LfKEFfe258MNk0LeQic7l0+VZ6Ud94Mfd9SxWjDTTX085EaPE9ihA0mVurHhZWa93OiQZ6Z/TLvbvi/wVgK0oQmYzQctfsRT7v2z7NzlwKJ+lIH6AId2Xg2YnblQwAN2WaIPwVRaYsqqu90vU1mrNen2QxOHWKV7pqBV1xK1SXeDSYp/n770+WfWbfkJ0Sr50K9YsZccRHdV31vQ1n4FJxPYzU408zw6Pn0IHKvLPxyINoME6ND4ttk1KJFPpZbsYKf2MPJ15NK9zyjyQ9R2Uhbpd2POLwJXycc7GiRUklkNPvQAks56kNQw/XoXi+Yhlwq6Rr6ZAMeEfna7qy51gIxeeS30gpq2NN2zKPkwTeH/yI9WW/WlwhScihSCxyjAKt8hzr+mdzj9emRMgHybEnfkybnLms8oqV3atVqYTujq+B5rEkey9INwKUMm1CtRJpBX47b8qMp/e7WZqA0shMhfW/RjLPXFN7zFLh1fpd7SxiHvlpUu3PP95pQV1dfBQQpLqJM/RimiSTyqsq8cvb0cU5R2LQ9fKXuqCPV5fT7cLgni8Nw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(18002099003)(6133799003)(261009223027099003)(3023799007)(13003099007)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(11063799006)(261102123227099003)(261026121527099003)(261021121427099003)(261028144727099003)(261026140227099003)(261022075727099003)(261022113327099003)(261022105027099003)(261021123027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	xvA6ofmo0yiIzM11tQL8tpRxqDHHPQPdn39Ywc20BdRtCh77cEaN6LcVgyOAuU2AQrp/F1IRNDJAkIXWvOqK5J6eXCJywf1QCMGyN0GDKP6+nFyUu/mbF4r8TKdOSMYF62AGbev9l4GVb5lH8+QhNX1FpXEQ1hVtE0j6kXSrqMgJOgfu5xdFn1fuKe3D1fkTyuxJ4FjEgi/HfcbPJu8hQhr8fANs/fgMHtR0qJSyNx/nnNF8eIeo02hSE/oMdtk8mqNASBwvgYH7cvKWaZ76rFRJqZZcmJRf3b/zC3638lBcg9HrjVnvdGVvqYzT/PKo45OcfdnrjNTnfpI8qebB1BnvMvvCnf2Rzgd3B1xmMOaKeByIBl3mM852Aa0Ewy0czfYUnMcRZ6Cr+33Oe4gAM2n3kXdMAU12X8cJ0Gqoqe0OwLbTjbv1Ud0lLe+I4UNK
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 06:08:01.8986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d9e906-2848-4a2a-95e1-08df44712304
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6854

The dmaengine RX path derived the received frame length from the descriptor
APP metadata. That only works when the optional AXI4-Stream status/control
interface is present, because the hardware populates the APP fields solely
when that interface is enabled. On designs without it the length read back
is invalid.

The AXI DMA engine already reports how many bytes it wrote into the buffer
through the standard dmaengine residue mechanism. Compute the RX frame
length as the posted buffer length minus result->residue, which is
independent of the status/control interface and correct across all designs,
including multi-descriptor frames where the residue is summed over the
chain.

Drop the descriptor metadata lookup, which was only used for this purpose.
Detect a failed transfer from dmaengine_result.result instead of the
metadata pointer return value, and remove the now unused LEN_APP macro.

The transmit path is unaffected. It still passes APP metadata for checksum
offload and derives its length from the skb.

Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: Srinivas Neeli <srinivas.neeli@amd.com>
---
This patch was originally posted as part of the MCDMA series:
https://lore.kernel.org/lkml/20260818174151.1608971-4-srinivas.neeli@amd.com

It is independent of the other patches in that series and uses
existing AXI DMA residue reporting to calculate the RX frame length.
Since it only modifies the AXI Ethernet driver, it is being submitted
separately to net-next.

The previous standalone submission is available at:
https://lore.kernel.org/lkml/20260929081316.803997-1-srinivas.neeli@amd.com/

I responded to the netdev bot feedback, but accidentally included
the "pw-bot: cr" tag in my reply, marking the patch as Changes
Requested. I am resending the patch for maintainer review.
No code changes since the previous submission.
---
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 782f903d318f..e7490650482b 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -53,7 +53,6 @@
 #define TX_BD_NUM_MAX			4096
 #define RX_BD_NUM_MAX			4096
 #define DMA_NUM_APP_WORDS		5
-#define LEN_APP				4
 #define RX_BUF_NUM_DEFAULT		128
 
 /* Must be shorter than length of ethtool_drvinfo.driver field to fit */
@@ -1159,29 +1158,26 @@ axienet_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 static void axienet_dma_rx_cb(void *data, const struct dmaengine_result *result)
 {
 	struct skbuf_dma_descriptor *skbuf_dma;
-	size_t meta_len, meta_max_len, rx_len;
 	struct axienet_local *lp = data;
 	struct sk_buff *skb;
-	u32 *app_metadata;
+	size_t rx_len;
 	int i;
 
 	skbuf_dma = axienet_get_rx_desc(lp, lp->rx_ring_tail++);
 	skb = skbuf_dma->skb;
-	app_metadata = dmaengine_desc_get_metadata_ptr(skbuf_dma->desc, &meta_len,
-						       &meta_max_len);
 	dma_unmap_single(lp->dev, skbuf_dma->dma_address, lp->max_frm_size,
 			 DMA_FROM_DEVICE);
 
-	if (IS_ERR(app_metadata)) {
+	if (result->result != DMA_TRANS_NOERROR) {
 		if (net_ratelimit())
-			netdev_err(lp->ndev, "Failed to get RX metadata pointer\n");
+			netdev_err(lp->ndev, "RX DMA transfer failed\n");
 		dev_kfree_skb_any(skb);
 		lp->ndev->stats.rx_dropped++;
 		goto rx_submit;
 	}
 
-	/* TODO: Derive app word index programmatically */
-	rx_len = (app_metadata[LEN_APP] & 0xFFFF);
+	/* Actual length = posted buffer length - residue. */
+	rx_len = lp->max_frm_size - result->residue;
 	skb_put(skb, rx_len);
 	skb->protocol = eth_type_trans(skb, lp->ndev);
 	skb->ip_summed = CHECKSUM_NONE;
-- 
2.43.0

