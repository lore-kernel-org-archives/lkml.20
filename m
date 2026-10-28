Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193431;
	b=xa8igzh4yUCU1IbqxLf7Guuld9MOIiZVaBwZoIHWGvnAputEStVMeDb6XXNbSPR3BspM
	 wPErpHaZgnIAp8ziiBaOwWzL/CxeOgB+Fj74XmeI0NZkfr88jc3eHKbVB8109SpoTb8Od
	 LJk+4QI5246LuIOezp5fNezcvtW1eUSRhm6OyeoRO4qYWizC9w3VJAqwsFUIjQTLVGeDS
	 KMrEY33eaUIvsSz6HXewpaZtH6aLcl5KEd8qM2k0CQfrVDg4FTWFf4F0+EMm7lCIcai+R
	 F72GOTDPlDxL3xemnZ3UuHpG52p9r/hGQ4G1eZcBI0LrJ4O5TFlqqE7Os3U9vE7U8xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193431;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=3j2eYR4antN667sJZSWGK9AUNaz39VbmQuGfmYqknq4=;
	b=oEULnqOOVastY0ih6ODx0FU18yJ6CqTAr1EHwe3oMqDTTrjNeHUotijFJS8YtCaefDgc
	 Z/KLGjZR6YnoJI4jLybbtn0ZVrQsBwv+I/MHj8GBAitrQ3y+U8AeSUZAszEU1Hw+uLhWO
	 zQw161cAqxuxfs5Y2/DAj1AAfsx7mJIgKybLVEd/3BNTtZvGfypABPg2WcdjBeW9go+F5
	 qvxt854N4P2MwxvcoZEZvSHjZouvLcIOQylKibjpdcWUo9TtnpSKbEHFHExdnHGnK/h8L
	 0t47nx3PqkQWm5Pkc2ON0EPLIbJ01MdwMRHwbPesW8nrhyqixwrdELoNi/e/dekzJOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kKpCmgIY;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD097606A31A;
	Wed, 28 Oct 2026 13:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD097606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=kKpCmgIY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3j
	2eYR4antN667sJZSWGK9AUNaz39VbmQuGfmYqknq4=; b=kKpCmgIYAXQakkASeD
	WnFa7OnwLC0l62VrDfq/0/QNMwgQtHL3ohvE1YoHEj5MSt2H1/iFKVLvuTbauCsp
	kEzSR/AgQVzfCbow0vP/GSVlFSVN9RrgCUvTcuXPjrN23SnWM1ADCSKLIcXIFz4K
	yTZiUjohICtso7ueFE+DMZKkM=
Received: from flipped.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD313u_9eFq01krDQ--.42072S2;
	Wed, 28 Oct 2026 21:16:48 +0800 (CST)
From: Sicong Huang <congei42@163.com>
To: linux-media@vger.kernel.org
Cc: jean-christophe.trotin@foss.st.com,
	mchehab@kernel.org,
	linux-kernel@vger.kernel.org,
	Sicong Huang <congei42@163.com>
Subject: [PATCH] media: st-hva: fix encoder use-after-free on release
Date: Wed, 28 Oct 2026 21:16:46 +0800
Message-Id: <20261028131646.2957101-1-congei42@163.com>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:_____wD313u_9eFq01krDQ--.42072S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFWruF1rJFWxKFy3Ww45Wrg_yoW5ZF1xpF
	WrWw45KrWUJF1kAF97tw48ZFyS9w1ftFZ8Jr1093WSyrZxZrn8tFyjvw10vF4DJrZ3Zr1Y
	qa1Dtry3uayqvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piIeHrUUUUU=
X-CM-SenderInfo: 5frqwvrlusqiywtou0bp/xtbC9QDAs2rh9cBeXwAA35

The st-hva driver encodes frames asynchronously. Its V4L2 mem2mem
.device_run callback, hva_device_run(), queues ctx->run_work to
execute hva_run_work(). For H.264, the worker calls encoder operations
that access the private encoder context in ctx->priv and its DMA
buffers.

During release, hva_release() closes the encoder and clears ctx->enc
before calling v4l2_m2m_ctx_release() to cancel outstanding jobs.
hva_h264_close() frees the private encoder context and its DMA buffers.
However, the V4L2 core does not stop streaming before invoking
hva_release(), so ctx->run_work may still be queued or running.
The release path does not synchronize with the worker: hva_release()
does not take ctx->lock, and hva_run_work() reads ctx->enc before
acquiring that lock. As a result, the worker may access freed encoder
state or dereference NULL through enc->encode() if ctx->enc has
already been cleared.

One possible interleaving is:

  CPU0 (release)                    CPU1 (worker)
                                    hva_run_work()
                                      enc = ctx->enc
                                      hva_h264_encode()
                                        ctx = pctx->priv
  hva_release()
    hva_h264_close()
      devm_kfree(dev, ctx)
    ctx->enc = NULL
                                        task = ctx->task->vaddr /* UAF */
    v4l2_m2m_ctx_release()
      /* Waits for the job too late. */

Here, ctx in the H.264 functions refers to struct hva_h264_ctx.

Move v4l2_m2m_ctx_release() before closing the encoder. It prevents
further scheduling for the instance, removes jobs waiting in the mem2mem
queue, and waits for an active job to finish.

Recheck ctx->enc after v4l2_m2m_ctx_release(), as releasing the vb2
queues may invoke hva_stop_streaming(), which closes the encoder and
clears ctx->enc. This avoids closing the encoder twice and accessing
already-freed resources.

Found by code inspection.
Fixes: 57b2c0628b60 ("[media] st-hva: multi-format video encoder V4L2 driver")
Signed-off-by: Sicong Huang <congei42@163.com>
---
 drivers/media/platform/st/sti/hva/hva-v4l2.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/st/sti/hva/hva-v4l2.c b/drivers/media/platform/st/sti/hva/hva-v4l2.c
index 33b768774e20..feca81eaeffa 100644
--- a/drivers/media/platform/st/sti/hva/hva-v4l2.c
+++ b/drivers/media/platform/st/sti/hva/hva-v4l2.c
@@ -1229,8 +1229,13 @@ static int hva_release(struct file *file)
 	struct hva_ctx *ctx = file_to_ctx(file);
 	struct hva_dev *hva = ctx_to_hdev(ctx);
 	struct device *dev = ctx_to_dev(ctx);
-	const struct hva_enc *enc = ctx->enc;
+	const struct hva_enc *enc;
+
+	/* Stop encoding before closing the encoder. */
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 
+	/* Queue release may have already closed the encoder. */
+	enc = ctx->enc;
 	if (enc) {
 		dev_dbg(dev, "%s %s encoder closed\n", ctx->name, enc->name);
 		enc->close(ctx);
@@ -1244,8 +1249,6 @@ static int hva_release(struct file *file)
 	/* trace a summary of instance before closing (debug purpose) */
 	hva_dbg_summary(ctx);
 
-	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
-
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
 
 	v4l2_fh_del(&ctx->fh, file);

base-commit: 27285b099fbc5cb2ae3aef20f3bbd7b3c88b3005
-- 
2.34.1

