Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316577;
	b=QDWhLeLfLEk7M5hKBeey8UaR8LlCm19XFUD/iTtT1lYefBWk3rgY+w/7sbe39ofuqmPZ
	 xa+VVIMibbUjllJPCWCnQYPdk7jFxff4mYjfB86OhPcG0fNF80iIgNyJhxIn4Q773tRTe
	 Dd445mGia4wesZYvq8HGZkfYiet0+HNKx2sPjDFJTubkFiO2+wwXQmKkvFWzMbUGhj7eF
	 9wXLxFqrVMffhfKolVYEs6gxi84VIe2gFnvda6OTXb3RFZvke20eKNJLIX8EpQsFBq7ck
	 gJ9EXtnMKO2wK+WSKfGO3JyfXaKhzDVwWyjYOm2IAbiz+BFkFU1DsEn+bmq2J66TmjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xwC9sqXF5mh2uTIdq7M8qAdiSSeBGCn6t06LEK6oyCI=;
	b=sbUk4q0s2CRpYaPuvl3m7P/qB+exNS08YWGT76DB+J6lMjaJuaSe7cmYGpzqMoApCntc
	 wFWYTmf2tZ482Ks3SvvjyYjTXs22Bb1Vp9dA7OoccmVLHg62Utc5DDcLSrTAxxBfyCVA4
	 rVqV9qww1PJ+8ove1C9Fr3CgcyiVMsg+o/VJtg7wvX7iuXSPiB0Sb0AgTppo5ViYt9uEx
	 S+m8NrqTnTknSlGt6bn6ldj5NY36vg+aV0uQTZr5htK+2Q71MQ02b7vWPzl/eVABVTtUk
	 4eWVrf7JBE8DO5KHOMoB5jvlMB7h6+fHsG5o6vn3CzQyO+cv73Ow3iB+kkAkBxXwRmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slYXGY7A;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4C8606BFE1
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A4C8606BFE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=slYXGY7A
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so910686a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316576; x=1794921376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwC9sqXF5mh2uTIdq7M8qAdiSSeBGCn6t06LEK6oyCI=;
        b=slYXGY7ASWEuctXx4XOIeuT6w5CHZs6EEJCudNCGQY7AotNNdk1jfY3ajKzoHDDsFE
         3XpneljvuXIivgxCR0L4Mc0FAzGiw3yM0ywKOcik20dB9xoEu8+OhgRRIuQfnRxHY2uG
         qKP/nzpthHzfpeKaJsZ/XI+cS9yyvVx2/qxYMPKw0aTji45tv8Vli7/1ov8ZfMERA4Fq
         NhoFVxJZUhIlkAkyPQ9SVPXHNrqok1LHMUBeE6DO0+sllViKViXS6G3XqEsYIrteMDvS
         e0Kz4SEo4h8T5aWm1m/uIBoUnKq1GJzznAf0wPFB3SWslQTrUrqzHulzThRq5npQNEtI
         tppA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316576; x=1794921376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwC9sqXF5mh2uTIdq7M8qAdiSSeBGCn6t06LEK6oyCI=;
        b=ESzmDgiHRAKk/xEHaon5sqadzwcAskEuwVLV1+1GeMo+FOMDEg+DnDWnvY6AiBUFRc
         8Yn0NsqDdcFCngcEyQzZfBFoEPRiLVdTDv4SsN9XSPwQmokPArpj5PH84cVkGF2PihUl
         hQARk50GXGjK/42kK6qqDPiNAlRQHKbj6JwdSFJwIdTZQbUm8rgMa/MbQ1zimnqCXPnx
         RlP+OX+vt6sVc28twLDpztlUfaDbMkQ4VJ7cFCF1D+gSRx/YveYjy4KVRDItaSpslMKr
         e9lSAGKgpkC3VNpopaKJNY3s8pPcj0O2CjpFdb5VKdNSj2Xn1T/qR3xIHv+KxekYwmAu
         FoOA==
X-Forwarded-Encrypted: i=1; AL+hErGXusYnvsmQQohaOZI3RdwjVh/H4aiEt98TYVKW/WGRkm3rMFi7z7YYj0LkRZYTlIc7S+xZwegph/q2b8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sxo3+N5DJ4ySWv02owkFX7pexxSih4k6kJh+B3EHExBdjrSG7
	/AHELSne7r0cq66T5GUDLHw8PtIdfRFk28BV/niv05Qy6tF6w8jTqFrv
X-Gm-Gg: AYBFou2BCmezbi541Fq/pHEZdcp3FmMnARmIE5o3wfJKD2EpCTAhmMwWKBcAWTKMPQW
	yMYSs4uCxv5/VyRLHEdrSdGXR/Ucd4KG+GiDYylGI/Ha7j6woDrbbCm6+F4nokUAVyGOKRn/oQF
	+zmOxKioyjOpsainIo+3kFf3/XT+46/EqsCTy2FQw6hldWGTF9rreHwlAlZuflJSnAuRrLSkXVm
	PtEOis2JsD59If6Y/jIYPDpLiYd+9X9mi62iKwbTBQMEjHj6Oix/+mclOAIb24ILuR9QmuUW0v4
	UDyjAJZHzcE857T+QlMJ+M5mojrw6MCfULHX2W9t9SAocIvLxFtVcEebiYn4g3ysHmv1/v+zCqQ
	keMMr8SVebl4MMIDUETms7FuAo98+fdJHGxPNv8EZ6aUchikrBKG8RPqRDWYZ3LepcrL1ZaZGhK
	PKChRMxaefKeGyDb7GEqJKBMyYCqON/yFO/fBvC8IU5c4YttLvs+dp/CAIySpVqZm1qaqrC3s6X
	mRa2QfiSIDN9gfMzHFJG+p9VpOmMYfaT5aP20akQHUjspbxLluIWxD/6TWYG9YiSoG369IGNaNC
	CF8OU/0Pa9KID2Y1n9IQiwOSShni3zc=
X-Received: by 2002:a17:90b:4b03:b0:3b0:99f8:eba8 with SMTP id 98e67ed59e1d1-3b166cfd406mr2820964a91.66.1794316575604;
        Tue, 10 Nov 2026 05:16:15 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:15 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dave Jiang <dave.jiang@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: [PATCH v4 09/33] dmaengine: ioat: convert cleanup tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:09 -0800
Message-ID: <6736142ec0740f8d1bc2e26eca05732ec4752913.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Acked-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/ioat/dma.c  | 14 +++++++-------
 drivers/dma/ioat/dma.h  |  3 +--
 drivers/dma/ioat/init.c |  2 +-
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
index ee93b029f9e3..c7a63dbac6e2 100644
--- a/drivers/dma/ioat/dma.c
+++ b/drivers/dma/ioat/dma.c
@@ -110,7 +110,7 @@ irqreturn_t ioat_dma_do_interrupt(int irq, void *data)
 	for_each_set_bit(bit, &attnstatus, BITS_PER_LONG) {
 		ioat_chan = ioat_chan_by_index(instance, bit);
 		if (test_bit(IOAT_RUN, &ioat_chan->state))
-			tasklet_schedule(&ioat_chan->cleanup_task);
+			dmaengine_schedule_bh(&ioat_chan->dma_chan);
 	}
 
 	writeb(intrctrl, instance->reg_base + IOAT_INTRCTRL_OFFSET);
@@ -127,7 +127,7 @@ irqreturn_t ioat_dma_do_interrupt_msix(int irq, void *data)
 	struct ioatdma_chan *ioat_chan = data;
 
 	if (test_bit(IOAT_RUN, &ioat_chan->state))
-		tasklet_schedule(&ioat_chan->cleanup_task);
+		dmaengine_schedule_bh(&ioat_chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -161,11 +161,11 @@ void ioat_stop(struct ioatdma_chan *ioat_chan)
 	/* flush inflight timers */
 	timer_delete_sync(&ioat_chan->timer);
 
-	/* flush inflight tasklet runs */
-	tasklet_kill(&ioat_chan->cleanup_task);
+	/* flush inflight BH runs */
+	dmaengine_kill_bh(&ioat_chan->dma_chan);
 
 	/* final cleanup now that everything is quiesced and can't re-arm */
-	ioat_cleanup_event(&ioat_chan->cleanup_task);
+	ioat_cleanup_event(&ioat_chan->dma_chan);
 }
 
 static void __ioat_issue_pending(struct ioatdma_chan *ioat_chan)
@@ -690,9 +690,9 @@ static void ioat_cleanup(struct ioatdma_chan *ioat_chan)
 	spin_unlock_bh(&ioat_chan->cleanup_lock);
 }
 
-void ioat_cleanup_event(struct tasklet_struct *t)
+void ioat_cleanup_event(struct dma_chan *c)
 {
-	struct ioatdma_chan *ioat_chan = from_tasklet(ioat_chan, t, cleanup_task);
+	struct ioatdma_chan *ioat_chan = to_ioat_chan(c);
 
 	ioat_cleanup(ioat_chan);
 	if (!test_bit(IOAT_RUN, &ioat_chan->state))
diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
index e8a880f338c6..4bdb1ae937e4 100644
--- a/drivers/dma/ioat/dma.h
+++ b/drivers/dma/ioat/dma.h
@@ -111,7 +111,6 @@ struct ioatdma_chan {
 	struct ioatdma_device *ioat_dma;
 	dma_addr_t completion_dma;
 	u64 *completion;
-	struct tasklet_struct cleanup_task;
 	struct kobject kobj;
 
 /* ioat v2 / v3 channel attributes
@@ -385,7 +384,7 @@ int ioat_reset_hw(struct ioatdma_chan *ioat_chan);
 enum dma_status
 ioat_tx_status(struct dma_chan *c, dma_cookie_t cookie,
 		struct dma_tx_state *txstate);
-void ioat_cleanup_event(struct tasklet_struct *t);
+void ioat_cleanup_event(struct dma_chan *c);
 void ioat_timer_event(struct timer_list *t);
 int ioat_check_space_lock(struct ioatdma_chan *ioat_chan, int num_descs);
 void ioat_issue_pending(struct dma_chan *chan);
diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index a57024c4b066..ab5068d60110 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -765,7 +765,7 @@ ioat_init_channel(struct ioatdma_device *ioat_dma,
 	list_add_tail(&ioat_chan->dma_chan.device_node, &dma->channels);
 	ioat_dma->idx[idx] = ioat_chan;
 	timer_setup(&ioat_chan->timer, ioat_timer_event, 0);
-	tasklet_setup(&ioat_chan->cleanup_task, ioat_cleanup_event);
+	dmaengine_init_bh(&ioat_chan->dma_chan, ioat_cleanup_event);
 }
 
 #define IOAT_NUM_SRC_TEST 6 /* must be <= 8 */
-- 
2.43.0

