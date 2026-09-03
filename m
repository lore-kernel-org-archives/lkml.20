Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11020120.outbound.protection.outlook.com [52.101.201.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3FF31E858
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419887; cv=fail; b=F2l/dfNGvitUpQgdSau9FnI5nyS/61D+JoCLFQoUEPhx4+A4GRciORrxzeFLhjRjSKLJ8NN2bhnJJ6HU7cKWMJrdppSsodqQjC9VD0BUxsqYPRP2JYMsvBYiw8TQzJcXXt34IZVcSPPFLln5pf60DEnAmCTR3FyxkwwAt6GF9mA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419887; c=relaxed/simple;
	bh=OzmvMEaPNupmiK8rOFM2AXPUVD5Amto3/+uOipy5Um8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eRl4XUK/0ETHd6Z9TBdpDQpgL1n7wkJzMvHCpa7e5OuJ5qzib2dvGGjtV+K6hiXZTWm84KyUzLRuaNneR1vYSYTQXFdIqvHw2OaDQIfXu4RUcsQJUpGAGmYk92Ly5wYJJet60u7dgmbu7F6GP1GFRFc5NEUuzbW1cd0/jSr+xBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=PnFGj9ER; arc=fail smtp.client-ip=52.101.201.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="PnFGj9ER"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IoiMIKW53n2T2nrJb0swy6HI6kY1Rp7sFTv1RIN0/cb/eBsOUtqnYcFL/SFtEA2KySMYqVaQcCIzw+Tirxs517ViC9hqmmf3+35V0j+Pyqz6Lb2eUkTBM8jqeuOi3U4Q2MrI8DrvzvzGp9uffVWusSq4rqTI24DJADF1HvhqJi36xEqGebzFyyhe5d65/1tEsUmRbkGDvVWg8iNF6dqXoGndhsZFEkHdhbPyAvY85XcPV6A0mCrsFZ4dH2Z5HpORktghsEfhb/NR2hnW6odySXdGVFaASptgXYrVfoq4adwNyQUkbL838EuT32puBSqx3gkjZL9J2Q3BtqbUTDYKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmheS9HNDhzg5lWWVQxnTYnpBh4yyvng1wy68Nvv6RM=;
 b=GQxjS95m0+OeEQ0Im5XKjBOGR7va3ejo/b3+xY62P/DO7mlDMScI8RQNR45UUSazapkla6Qzl+aRtZDiRj2sg9qWd4/BR8ytLzHKFbtv34tIBD8OXm1LZhknJHHHPvbyw4IHAA20XdLxQmxeyEgtlil5w1CQQt9GqF6zLHUj0ghlBxCj+iHrLx9DCT9+vb/BcpfGFCQJH9i/KbRoKb2smaJvJ2ETgjA1KprgofweRwHi32rpZ8MEa1ssKS8TACGuNBPcbHu4ihS9BqLYTmDcIIafZNVXTaddjsbXqnuJHzImkM1s4XbT/kU9Ax5G63569niK7qL41K8GLRTUYrstCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmheS9HNDhzg5lWWVQxnTYnpBh4yyvng1wy68Nvv6RM=;
 b=PnFGj9ERl84ZSXdCyzlQ2TcaNJdB3bOiBk4zyT9CN3FMarqMKNmOFNFUsakwM2Or0DjGq/96W5RdhWZHuwM/MqQpPyS/g4323PkHcZWNo5JGqMtitVPy7HLG0lok2Jq10GF0AF1VKM+7HMraSM0WWcWLUof64JiFE/9YEhKgASSh8KrzzYp9ipui6TsiYWnZXkqPVGqyOKRb0aNTIKvhckryZ+ULGEVdKsAbb/m2OPCxjd20avJ1wzl3DItdMzmCfAWhzmbOLQnGImv+VEOu3+Wpk+jbUEvO8A815sxlisSLJMmtOy3+ajcm84v96BaAXj2LjjHROcJB3Nx5FOXFuA==
Received: from BN9P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::19)
 by LV8PR18MB5782.namprd18.prod.outlook.com (2603:10b6:408:1f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 07:17:54 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10b:cafe::6a) by BN9P223CA0014.outlook.office365.com
 (2603:10b6:408:10b::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 07:17:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Thu, 3 Sep 2026 07:17:54 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id B9EBF4186B5D;
	Thu,  3 Sep 2026 00:17:53 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Thu, 03 Sep 2026 00:17:52 -0700
Subject: [PATCH 1/2] mailbox: axiado: fix RX frame draining and error
 handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-axiado-mailbox-fixes-v1-v1-1-f44cba251254@axiado.com>
References: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
In-Reply-To: <20260903-axiado-mailbox-fixes-v1-v1-0-f44cba251254@axiado.com>
To: Krishnakumar Kesavan <kkesavan@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Tzu-Hao Wei <twei@axiado.com>, 
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=9185; i=syang@axiado.com;
 h=from:subject:message-id; bh=OzmvMEaPNupmiK8rOFM2AXPUVD5Amto3/+uOipy5Um8=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqyZ8op13/9rvVngMv/yx/0aZ6xPLK4SlF/MbHRsz/nnJ
 asM63e+6ShlYRDjYJAVU2T5qvMt/2Su9r3OvStLYeawMoEMYeDiFICJHKhl+B/L+NjNJXqf6asC
 p5w6Dq2SQF7WJr/HP/13f7hhu2njWidGhoMbO/k/p0zI+jjXy8uUyfXG0TaVi933s2Wbxac9P7U
 zgB8A
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|LV8PR18MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: c3d1ac84-528e-42ab-25aa-08df098b7906
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|10067099003|6133799003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6r9ZyQ/cwaeJntWnfZhs9rLhGJ4LyJnEOrTb7kBwz8E/MlIToCyzXg9Tr+Svv+sjjj2Y4APX4j2f7KnSRtCIGPoB4XfUHif2dUVbgZ2PtVm4GY9oXiGUWGGRy/Kj9pPfE1Yp62ImrKOPe3Iz+OMLg3uLcnc3Mr020rbh64bk9686vBPc+a1kx3qoCDz1RijrVz7sL1oWh7KvZhIZ5bUNZNTA0N767tNe24GVQ6hukWt6wU9MGRzLfdBUb5vRuVKBZSVXiZR18/e9HNg4qGCgR/QzZ7lodyVXXNb2TYDqCqx59PbTyMSABWSYR/CvkuJuMAhqdAvV2HnglYGN785autAlnP/mI68DsC2wUG3jEacopaiyLxZMct76uIvdxd3Mv2a9FU/8yfLgnJfrOjekjn3sn3iCdtI2TsqIiZhCFoAqqdcDG/3tQw1nUX7cfKTaXgPsxsMMDYxNInLRSrO+c1JK3twBKloJ46s/x2Le9+E4t5DQs5b7T8NJGRF8Z6b8VK7Qu6v5Ex0RG52jfI+jprbZxbKk1IMrZ2wg0uwiMwedJHfYKc9cqxEbsMGCW2MY+6h7C71/V4c10ij8IXYBIfdirlggrF8UCezryxdAG9ye6zIF0PaxNET0q6UO1SmexdHFTfbkUQTMKb9pP24w2bA12JVKBQDzBTzt/D4qkZTWbnURu3bTUM0lqk9J9FnGljiy1zQ7p85quJ9YpWL9TA==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(10067099003)(6133799003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EeSbuLjjQmw1279+127zy/zVu7fFOnRhXBQAiggiqtsXWmkt3oaW+YAGRaZ5D6kSgC3bFgFnkkXdhmUuvSw+hEkirIC6A3iBIzRxl+uiNY53z2YxvSTrlJ662oy6xLD0GnVSI9+/o8lTQJNNMKjo6wJrt726/Z5gJHjura3pHhauehoNNEqVaU+wyUjy8BTwFjl7GDTf/ogQhqrlhH74dp2PH3QPec2BCSPSNRuSgzTtmUYGw9zx4zW0zaYqVSNidwPBrgWk0IJKYbORJua0liAU3m7Opc4o+C6Qo9OMp+mc5/xqeHs8fbevujrCSEL9D/DK9EovUHW/r8DpYgiHIKSUtaPa++95b2vmHwwwtHGP+e1LpgsaiyZ1Hrdbol1PfsJBDPSJ4/2H9jno/C2U1mFw4uMFr2nvL8jPZ8xxvE9+shS8LQiyD+7QKUJ268Hi
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 07:17:54.3786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3d1ac84-528e-42ab-25aa-08df098b7906
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB5782

Two RX-path bugs found during bring-up:

1. axiado_rx_thread() previously consumed only one frame per
   invocation. Multiple frames can accumulate in the FIFO while the
   threaded handler is running. Split the single-frame handling into
   axiado_mbox_receive_one_frame() and drain all currently queued
   frames before returning from the handler. A cond_resched() in the
   drain loop prevents a continuously-fed channel from monopolizing
   the CPU.

2. readl_poll_timeout() waiting for the remainder of a frame can
   return success either because the required FIFO level was reached
   or because a FIFO error appeared -- it does not distinguish the
   two. The old code did not check for that case and could therefore
   enter the read loop without enough words actually being present.
   Explicitly inspect the error status after the poll: if an error
   occurs while waiting for the remainder of an already-started
   frame, treat that frame as unusable and flush the FIFO to
   resynchronize, rather than risk delivering incomplete or garbage
   data to the client.

While here:

 - Track whether the handler actually serviced a hardware condition,
   such as clearing a FIFO error or consuming frame data. Return
   IRQ_HANDLED whenever something was serviced, even if the FIFO is
   empty afterward, instead of reporting IRQ_NONE after handling a
   hardware condition.

 - Use readsl() for the RX FIFO payload. The destination is the
   driver-owned rx_buffer allocated by devm_kzalloc(), so it has
   suitable alignment for the stream accessor. readsl() is
   appropriate for copying a sequence of words from the FIFO into
   that buffer. The TX path intentionally stays on
   get_unaligned_le32()/writel(): its buffer is supplied by an
   external mailbox client, the mailbox API gives no guarantee that
   buffer is naturally aligned, and the TX path also explicitly
   handles a partial final word.

mbox_free_channel() invokes ->shutdown() before chan->cl is cleared,
and axiado_mbox_shutdown() calls disable_irq(), which waits for the
in-flight threaded handler to complete, so no functional change is
needed for that path.

Verified: builds clean with the aarch64 cross-compiler, passes
checkpatch.pl, and was regression-tested with live mailbox traffic on
AX3005.

Fixes: 14af7a96afa3 ("mailbox: add Axiado AX3005 mailbox driver")
Signed-off-by: Swark Yang <syang@axiado.com>
---
 drivers/mailbox/axiado-mailbox.c | 114 ++++++++++++++++++++++++++++++---------
 1 file changed, 89 insertions(+), 25 deletions(-)

diff --git a/drivers/mailbox/axiado-mailbox.c b/drivers/mailbox/axiado-mailbox.c
index 3a3cf7421863..aa1dcc1b267d 100644
--- a/drivers/mailbox/axiado-mailbox.c
+++ b/drivers/mailbox/axiado-mailbox.c
@@ -15,6 +15,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/unaligned.h>
 
@@ -36,6 +37,12 @@
 #define AXIADO_MBOX_CSR_ERRORS		(AXIADO_MBOX_CSR_OVERFLOW | \
 					 AXIADO_MBOX_CSR_UNDERFLOW)
 
+enum axiado_mbox_frame_result {
+	AXIADO_MBOX_FRAME_EMPTY,
+	AXIADO_MBOX_FRAME_OK,
+	AXIADO_MBOX_FRAME_BAD,		/* malformed/incomplete; FIFO flushed */
+};
+
 struct axiado_mbox_data {
 	u8 num_chans;
 	u16 msg_size;
@@ -116,6 +123,13 @@ static int axiado_mbox_send_data(struct mbox_chan *chan, void *data)
 		return -EBUSY;
 	}
 
+	/*
+	 * Per-word get_unaligned_le32()/writel(), not writesl(): @data is
+	 * supplied by whatever client calls mbox_send_message(), and
+	 * mbox_chan_ops.send_data(void *data) makes no alignment guarantee
+	 * for that buffer. writesl() dereferences it as a native u32 *,
+	 * which is unsafe unless alignment is known.
+	 */
 	for (offset = 0; offset + sizeof(u32) <= msg_len;
 	     offset += sizeof(u32))
 		writel(get_unaligned_le32(buf + offset), priv->mbox_reg);
@@ -131,31 +145,42 @@ static int axiado_mbox_send_data(struct mbox_chan *chan, void *data)
 	return 0;
 }
 
-static irqreturn_t axiado_rx_thread(int irq, void *dev_id)
+/*
+ * Read and, if valid, deliver exactly one length-prefixed frame currently
+ * at the head of the RX FIFO. Does not loop -- the caller decides whether
+ * to call this again. May clear a pending FIFO error at several points
+ * below, wherever a new one could plausibly have appeared since the last
+ * check; each check is a cheap readl() when nothing is pending.
+ */
+static enum axiado_mbox_frame_result axiado_mbox_receive_one_frame(struct axiado_channel_data *priv,
+								    bool *serviced)
 {
-	struct axiado_channel_data *priv = dev_id;
 	struct mbox_chan *chan = priv->chan;
 	struct axiado_mbox *mb = dev_get_drvdata(chan->mbox->dev);
 	u8 *buf = priv->rx_buffer;
 	unsigned int num_words;
 	unsigned int remaining;
-	unsigned int i;
 	u32 msg_len;
 	u32 word;
 	u32 csr;
 	int ret;
 
 	/*
-	 * Clear and log/count any pending errors, but don't discard data
-	 * on their account alone: a rejected overflow write doesn't
-	 * corrupt what was already safely queued ahead of it, so let the
-	 * length-based read below decide whether what's here is usable.
+	 * Don't discard data on a cleared error's account alone: a rejected
+	 * overflow write doesn't corrupt what was already safely queued
+	 * ahead of it, so let the length-based read below decide whether
+	 * what's here is usable. Count clearing a real error as @serviced
+	 * so the handler reports IRQ_HANDLED whenever it actually handled
+	 * a hardware condition.
 	 */
-	axiado_mbox_clear_fifo_errors(priv);
+	if (axiado_mbox_clear_fifo_errors(priv))
+		*serviced = true;
 
 	csr = readl(priv->csr_reg);
 	if (csr & AXIADO_MBOX_CSR_EMPTY)
-		return IRQ_NONE;
+		return AXIADO_MBOX_FRAME_EMPTY;
+
+	*serviced = true;
 
 	/*
 	 * The first word contains the total message length in bytes,
@@ -165,8 +190,12 @@ static irqreturn_t axiado_rx_thread(int irq, void *dev_id)
 	msg_len = word;
 	put_unaligned_le32(word, buf);
 
-	if (msg_len < sizeof(u32) || msg_len > mb->drv_data->msg_size)
-		goto invalid_message;
+	if (msg_len < sizeof(u32) || msg_len > mb->drv_data->msg_size) {
+		dev_warn_ratelimited(chan->mbox->dev,
+				     "Channel %u invalid frame length %u (max %u)\n",
+				     priv->channel_num, msg_len, mb->drv_data->msg_size);
+		goto bad_frame;
+	}
 
 	num_words = DIV_ROUND_UP(msg_len, sizeof(u32));
 	remaining = num_words - 1;
@@ -182,33 +211,68 @@ static irqreturn_t axiado_rx_thread(int irq, void *dev_id)
 					  remaining,
 					  AXIADO_MBOX_RX_POLL_US,
 					  AXIADO_MBOX_RX_TIMEOUT_US);
-		if (ret)
-			goto incomplete_message;
+		/*
+		 * The wait condition above is satisfied by EITHER the
+		 * expected word count landing OR a FIFO error appearing.
+		 * ret == 0 only means "didn't time out" - it does not mean
+		 * the words are actually there. Check @csr for the error
+		 * bit explicitly; otherwise an underflow can present as
+		 * "success" and the read loop below pulls words that were
+		 * never pushed, handing the client garbage.
+		 */
+		if (ret || (csr & AXIADO_MBOX_CSR_ERRORS)) {
+			dev_warn_ratelimited(chan->mbox->dev,
+					     "Channel %u incomplete frame: got %lu/%u words (%s)\n",
+					     priv->channel_num,
+					     FIELD_GET(AXIADO_MBOX_CSR_LEVEL, csr),
+					     num_words,
+					     (csr & AXIADO_MBOX_CSR_ERRORS) ?
+					     "FIFO error" : "timed out");
+			goto bad_frame;
+		}
 
 		axiado_mbox_clear_fifo_errors(priv);
 	}
 
-	for (i = 1; i < num_words; i++) {
-		word = readl(priv->mbox_reg);
-		put_unaligned_le32(word, buf + i * sizeof(u32));
-	}
+	/*
+	 * readsl() streams the payload words directly into rx_buffer, which
+	 * is allocated by this driver via devm_kzalloc() and therefore has
+	 * suitable alignment for a stream accessor.
+	 */
+	readsl(priv->mbox_reg, buf + sizeof(u32), remaining);
 
 	axiado_mbox_clear_fifo_errors(priv);
 
 	if (READ_ONCE(priv->active))
 		mbox_chan_received_data(chan, priv->rx_buffer);
 
-	return IRQ_HANDLED;
+	return AXIADO_MBOX_FRAME_OK;
 
-incomplete_message:
-	dev_warn_ratelimited(chan->mbox->dev,
-			     "Channel %u received an incomplete message\n",
-			     priv->channel_num);
-
-invalid_message:
+bad_frame:
+	axiado_mbox_clear_fifo_errors(priv);
 	writel(AXIADO_MBOX_CSR_FLUSH, priv->csr_reg);
 
-	return IRQ_HANDLED;
+	return AXIADO_MBOX_FRAME_BAD;
+}
+
+static irqreturn_t axiado_rx_thread(int irq, void *dev_id)
+{
+	struct axiado_channel_data *priv = dev_id;
+	enum axiado_mbox_frame_result result;
+	bool handled = false;
+
+	/*
+	 * Drain all frames currently queued in the FIFO before returning.
+	 * Multiple frames may accumulate while the threaded handler is
+	 * running. cond_resched() prevents a continuously-fed channel from
+	 * monopolizing the CPU.
+	 */
+	do {
+		result = axiado_mbox_receive_one_frame(priv, &handled);
+		cond_resched();
+	} while (result == AXIADO_MBOX_FRAME_OK);
+
+	return handled ? IRQ_HANDLED : IRQ_NONE;
 }
 
 static int axiado_mbox_startup(struct mbox_chan *chan)

-- 
2.34.1

