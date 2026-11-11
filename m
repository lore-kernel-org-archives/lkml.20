Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794410492;
	b=uZAC2JGLd5fKDW/HXPMif9BxI0M5wMfhUVSbrDaFGZNvG8tqhBbqLZ96wm0sEyPA9hZ4
	 klUlwpnVuWUADy1Tz3+HlYLZ0jTYqmJIIKpGClxPrGdS/ouaCNXHeQzHr8s5wxE0DluSh
	 0osdwGaMfkBOwzuKNWOF7jcev+nDN1xJp4o5fvbdDtpxg1M+TJUyS80+ug3ULT1PuhSgz
	 0bbNHmv39W7savad9vumJZadOi9Yuoezqei9nH9kuJtVF4EmJWPv9vytVnp8ocR9dn+A9
	 6lLQJw9BS0QgnrADbCnOvnzzIXav9Vi+c94JFTevl1snVxNK8dT+g0uyUPDk7fMcygw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vcM1XHbJaDYY1o8UTgUvOJULrKbAVAkgtgj4pxKK5cM=;
	b=1rZsIiwBU3gyGb8wKry0CrsaYNuXAXSYodXF/QfbeXxQUpp7+WZf2Pf99L0Zy8kZ1/9O
	 rpyMfKXUXwoGmi5bJO6xR/FPD9eKMuFlVO9DRD5wnAdXJ78CVsXvi9FqJPNiTyc5NrC+F
	 ADmPvM83LJDFp6wz0+zdMoMgExBoWx5Xz81ipB+vPPVjj3q5OgaxhDJn1n/x5YRRy1f0T
	 oehB9TP2lALRAw26E3t1ZHAaH376gvyq56qRRhYwgxPKI4FOKKRIeIdHRAQI0xCPZ7xpg
	 yNpT013ICtVa3trJBR6ImE9f9nXuerZEvOySWI1Gfy8DyDZHIh8MZPZwvclyVfGX2Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=c9a2pXRo;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965E606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6965E606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=c9a2pXRo
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37071c0f42aso5655980eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794410491; x=1795015291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vcM1XHbJaDYY1o8UTgUvOJULrKbAVAkgtgj4pxKK5cM=;
        b=c9a2pXRoSpRqO3bXGLwqqb8axR2+UHb4wbIBY354YfVFEXjJr9YptH50ahUaY4G2qa
         j86tV/Z/9fqn9fPjDmgAa5O1O3/klg7egDlCPN/2VfJ30BKg9ejyl9639joAKTLaLSNm
         vtII1RP8Y4G3c2Gy6008L7L6G3NeowGmgvrCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410491; x=1795015291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vcM1XHbJaDYY1o8UTgUvOJULrKbAVAkgtgj4pxKK5cM=;
        b=HyovwA+oSsNG4pvCcNp+NG7BhMxdgtUo19feORo+FmO54WR/x/bS1sq8In2hoy1Ieo
         16O64k+f3Z1PZS7IRiVcjtLXCfbqh0KUDHo5NyQRZyyB5sJRBkPcdF+tJB9pYLdXRoDW
         gWDdaPcIgiTiQF6557OqbKzWTJE71zoimpRxn2YQAI51smP3OZE3L4vxTKR2PemrRP38
         0jJdldE1DmdbwLrhn4RQyFxVIaes9c/NzT0rxvHYoYUeDjhX74UdK64VQyfx3eAuo6mo
         VO1E7UgIuV5SurAPomRCr6NSJ/eu+k1ehkB+ZT5GS++yhrtGqlb0pj4AQFXbSQPQTvW5
         JefQ==
X-Forwarded-Encrypted: i=1; AL+hErEW+v1l3Vj/+K4Fi2rE61KoFAu0zrzh/RG+voOE0IctkHj9DphSyCSCKwBCKdb66KCkQmP2JsnTCYp89oQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wu18wMnypSyikZl7ohBLccU/JGmg9DA8m3rbH500BhGceWKTP
	jmD4Dk3Hq6IYDq1rUp46Zrn4T7yjZt95YMUhVTmEk+uPX66mP5/1KZe2GTMe+DHfgX0=
X-Gm-Gg: AYBFou2IeO3//8d3riV4EMpgrzF/tJZGeB+7JxFf6k93GcM8TuHLxBQUXfnvpe/4KQn
	lGa5qeUCDtt1D/rWpptIOJbz+F2gMVWe/M6eCbhHBXwaIzHf2/znSrTraA9jo1Ocv8gAwMX+ZEW
	KmscAk9JiN8KLn8ahM3f62BzaIuEKme99H4Xya/75obibnJYRICB8sudkIn3Q570WEdCkBWmWIu
	a7b1xQxV3dJahGbotnLMBfAMgz/ueqFqLf0QnspHJLhbhf9XF6KRiTbEf1L9GqIuj9g4frM7/xI
	o9Cpy94jY4GHphqo0EPoSCWgUL1HBzBOQky5lo6LCT+r3i2leC/uHNMB4/XH7KkSQ8W6BuAX/ra
	YOh25aFH0kY472aYYBUlDQsH5v3NmhLSqUYgEVJnYTZC7Ob/96a7s8V/SAN7OHVrGzBMhecoOm+
	wR0qi5maNA3VXomXYz6ekbUnZtL2xTDERrlniYq4hxPzWxyP292ssFg+wuvVu8StMsSuEH+khi/
	/7xZMlmtOStAQYT9MSMj8bVQj4RA7XAT+DMHVMBCypJ7wQMug5c8p4BLqWuNELyf8I12ggHvtYa
	TBOSB+S1LTj9mfIXw/JKxcyhAvBXmXqMBuHtw9r8NHa9Gr0dnFbx6egCMrK+QZevsvcoQoYcF7e
	Z4viYPykMiBZMKJUAPBkjM1jutW9gZyEbsxEIPLU=
X-Received: by 2002:a05:7300:e9c8:20b0:376:49a8:a87e with SMTP id 5a478bee46e88-3768579fb42mr3477954eec.6.1794410490223;
        Wed, 11 Nov 2026 07:21:30 -0800 (PST)
Received: from furiosa-sungho.nest.netbird.furiosa.in ([119.196.190.183])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751dae6377sm15806266eec.3.2026.11.11.07.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:21:27 -0800 (PST)
From: Sungho Kim <sungho.kim@furiosa.ai>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sungho Kim <sungho.kim@furiosa.ai>
Subject: [PATCH] dmaengine: pl330: report a failed transfer through callback_result
Date: Thu, 12 Nov 2026 00:21:08 +0900
Message-ID: <20261111152109.1551738-1-sungho.kim@furiosa.ai>
X-Mailer: git-send-email 2.53.0
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

A channel fault still completes the descriptor as a success, and the
callback is invoked with a NULL result. Record the outcome and pass
DMA_TRANS_ABORTED to callback_result on a fault, an abort or a rejected
request, reporting it on the last descriptor of the transaction.

Signed-off-by: Sungho Kim <sungho.kim@furiosa.ai>
---
 drivers/dma/pl330.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index c2d0b473b..d479d73cb 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -458,6 +458,12 @@ struct dma_pl330_chan {
 	/* for cyclic capability */
 	bool cyclic;
 
+	/*
+	 * First failure among the completed descriptors of a transaction,
+	 * reported once its last descriptor completes.
+	 */
+	enum dmaengine_tx_result result;
+
 	/* for runtime pm tracking */
 	bool active;
 };
@@ -534,6 +540,8 @@ struct dma_pl330_desc {
 	struct pl330_reqcfg rqcfg;
 
 	enum desc_status status;
+	/* How the transfer of this descriptor ended */
+	enum dmaengine_tx_result result;
 
 	int bytes_requested;
 	bool last;
@@ -1572,6 +1580,8 @@ static void dma_pl330_rqcb(struct dma_pl330_desc *desc, enum pl330_op_err err)
 	spin_lock_irqsave(&pch->lock, flags);
 
 	desc->status = DONE;
+	if (err != PL330_ERR_NONE)
+		desc->result = DMA_TRANS_ABORTED;
 
 	spin_unlock_irqrestore(&pch->lock, flags);
 
@@ -2059,6 +2069,7 @@ static inline void fill_queue(struct dma_pl330_chan *pch)
 		} else {
 			/* Unacceptable request */
 			desc->status = DONE;
+			desc->result = DMA_TRANS_ABORTED;
 			dev_err(pch->dmac->ddma.dev, "%s:%d Bad Desc(%d)\n",
 					__func__, __LINE__, desc->txd.cookie);
 			tasklet_schedule(&pch->task);
@@ -2101,12 +2112,26 @@ static void pl330_tasklet(struct tasklet_struct *t)
 
 	while (!list_empty(&pch->completed_list)) {
 		struct dmaengine_desc_callback cb;
+		struct dmaengine_result res = { .residue = 0 };
 
 		desc = list_first_entry(&pch->completed_list,
 					struct dma_pl330_desc, node);
 
 		dmaengine_desc_get_callback(&desc->txd, &cb);
 
+		/*
+		 * callback_result is only on the last descriptor of a transaction
+		 * (tx_submit copies just callback to the periods of a cyclic
+		 * one), so a failure of an earlier descriptor is held on the
+		 * channel until the last one completes.
+		 */
+		if (pch->result == DMA_TRANS_NOERROR)
+			pch->result = desc->result;
+		res.result = pch->result;
+		if (desc->last)
+			pch->result = DMA_TRANS_NOERROR;
+		desc->result = DMA_TRANS_NOERROR;
+
 		if (pch->cyclic) {
 			desc->status = PREP;
 			list_move_tail(&desc->node, &pch->work_list);
@@ -2126,7 +2151,7 @@ static void pl330_tasklet(struct tasklet_struct *t)
 
 		if (dmaengine_desc_callback_valid(&cb)) {
 			spin_unlock_irqrestore(&pch->lock, flags);
-			dmaengine_desc_callback_invoke(&cb, NULL);
+			dmaengine_desc_callback_invoke(&cb, &res);
 			spin_lock_irqsave(&pch->lock, flags);
 		}
 	}
@@ -2167,6 +2192,7 @@ static int pl330_alloc_chan_resources(struct dma_chan *chan)
 
 	dma_cookie_init(chan);
 	pch->cyclic = false;
+	pch->result = DMA_TRANS_NOERROR;
 
 	pch->thread = pl330_request_channel(pl330);
 	if (!pch->thread) {
@@ -2295,6 +2321,7 @@ static int pl330_terminate_all(struct dma_chan *chan)
 
 	power_down = pch->active;
 	pch->active = false;
+	pch->result = DMA_TRANS_NOERROR;
 
 	/* Mark all desc done */
 	list_for_each_entry(desc, &pch->submitted_list, node) {
@@ -2579,6 +2606,7 @@ static struct dma_pl330_desc *pluck_desc(struct list_head *pool,
 		list_del_init(&desc->node);
 
 		desc->status = PREP;
+		desc->result = DMA_TRANS_NOERROR;
 		desc->txd.callback = NULL;
 		desc->txd.callback_result = NULL;
 	}
-- 
2.53.0

