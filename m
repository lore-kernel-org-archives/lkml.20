Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316549;
	b=Fzg2ObdT7kXiwLfhG8kd/ZlRO5q0piheS5kwdSKIV+N+BHfFbPRP7vHiel/MhWPlz6nJ
	 R7rEjhQ2q4DU8u5yZa2x0srTn+uZIwb5s+kJOIWE7c7pgoPTLmjVB1mSRAr0PH7WooeBk
	 88IYwJSFzsbgUuSavVnNy4IOtdTSDuy3ciAn9I3H/LlTlg5l+5iGHlCk4A6KY5yYTOcNA
	 XZ9vm+MNQ3mr1hFMo+QNSkPeoFhq+xA1LUWata8WoYYt24Kzq7c6kW81+fshXleFy4fLC
	 hwqGkQfPaCKaa+JiPCuM31MOJ5XOo5Gba6GN3nJJJVeTv3d2vk33MDOoD0D0AfcRZAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
	b=LxlrpayATPLP7zWEHREltTx11w49vZ4DmfF4/vTHOU9uDP9YkjU6nZCV4KbiN5MzQO2N
	 9NvllMpNV1DVz1I5aSM+dvr9PBSkdBEYKx/jL2ztZyUK74kwpmtLLNWHbDfkIpmAeoFg9
	 jG5Plzvnqg1dCU58KVMwSFR+nflyiAuOiOTwO8H0i7AGAs5E0vkhTTEETOz1hRwhwmEK2
	 1bwMVWf6Y6bNSg6mPoD6YFYfbjzEH0s31fGEIbVy4o0DvXNwYkkkIA9Qkkjnp76EBBAGL
	 Djs7WYZZGVTa4TaesPMLQmkRNFdl9dpM+P9dAZkRIc6uDKBrKfwYjovdDEDMlxtBYNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PLgT/NgP";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CEC606E47F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11CEC606E47F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PLgT/NgP
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso1487663a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316548; x=1794921348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
        b=PLgT/NgPPcQZ7blFNaWoQ/9tiP04afaZP19I1opsbDSYxDRswCp0tnw7aF6hB+LVW/
         1MCELUCgW+aAZZyyPSJenCWHlYOUXIiqbNF41aUEf2fH8mgzv+4/32Xe6KpT3ZoyMc4f
         vjitGOfSUL9e8FGZptXqU1VAEdJRPW57UhrFdxvnTzBWf0SprZY1eBkLj7b25mk+DCu+
         a0CWFJW8vEQrsPFrrWAgzlStkkky/5EMXO2wDpau2Wm/X2v+QLecVJoqFTfsDbYSbNRu
         pn7j0lpf4WVPxy6Bak6M1oNKV3us+g94qKw5PFFOJQCWiomJiqvBATVU8KweFuS8CCY6
         lCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316548; x=1794921348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
        b=AC3zChtOPKumVtUuL/lBwNZQliblKzOVDduX0HJDCYlp3FNorGeupPBVrSgF+D3+Ua
         89MWwA6DUvcuMBVIrlHmfjiCmznUXVNZlHnfvTM7WTVO3Yn8K4YSN89EBbdh6fLtIBM8
         DbjNMvPZSCdmtsWmU2ll0pOgAqp1H1B2oZHzjPLqjHhcBrDljB+hSG24s3cPs2qf0tmd
         9pf1TP29k0skLN1r+I7tNfKcO0AFI1NSrE7ytVMR497oudK7EBEyWgAw+v0mDzabSEc2
         +Yz7PC4OYxFB3FMwqeMC1WaJ4ZZOXl5DkZlkmdTHcHwtsQjNqhX7wvGxI7Y8mIPBupl6
         MEkA==
X-Forwarded-Encrypted: i=1; AL+hErHCwRQAHzJEpzuRPXwjBCd8yi1TOtqPZLlmjSquMVlNjM+VEuoKVpQ9zCMUcCGm9wa6jAlhGhGngCtATw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MEtek8WVXaxs23lS+qLrAkKAMreFSIDvlrikajHsbpShqZdrr
	TgOnWO4edXq94zBMoTMpXh8SQAA0ddUhanAeLF7xoHAhwFyfkYX89IBx
X-Gm-Gg: AYBFou1AggOaX1Rlbt+i5qwNBZamzA0jU4pR765jAuf7JPYuWxQqu4XpstAiEwR/ifK
	/CviVrWITrHPxCEJ65NX5aQbE2tuAaulPqJQP0fwmjio1gWpXFUoTHTERYy0XNlBSsuR0JBtz6Z
	NZmo9iN2MQ+kIh7ve+/cmVw/gcIIEV6NqpQkCBHjnwpagL3DO8ZVShZnSazhHNVHxgElx6Ld1EF
	tG3xUKn1Jybpdjpb0mIW30Sx2B1hfDhQ2XWrAvDwdMW3YwK6pBmfcY5ZtYhDWqIo41VBOyhplpr
	+qnOEQ2FE4+q+g33yt7g/uZQsPdsTDPQXPYQ/Oa5B0Ox9TyQho+H/pQJsVKDirSdD0Q0nJ/vkA1
	QG1xsmklQmqvcx2Ouz1vEx2c85AgyCPww6PYSlGybehy2lhcsTcU2GdfS4wJ7xNbW8T14ujNA7K
	dZNV4V8oJum6g0cahzCoXHtuUw5VuY6gTw5A1zRIVWlNIpApSBrFGDIAvdG5UoXNvhfGyHmDJdR
	OX8nnSFiygw0cxFpG51VauBbQNnIbKLDLea5Rw6e1xE6ccO10JQOWse8th1HAHa34QXZf41cvb1
	h1hv6FXckUC5vA8MuAnlEYwvlKBa1irF
X-Received: by 2002:a17:90a:d450:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b166cdd823mr2893205a91.30.1794316548329;
        Tue, 10 Nov 2026 05:15:48 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:48 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 03/33] dmaengine: apple-admac: use dmaengine BH callback
Date: Tue, 10 Nov 2026 05:13:03 -0800
Message-ID: <c1c55434e01772a1ecd12044feffe220f06cd72e.1794315350.git.allen.lkml@gmail.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 4531a301c018..2eb863d1bb58 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -97,7 +97,6 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
 
 	u32 carveout;
 
@@ -530,10 +529,7 @@ static int admac_terminate_all(struct dma_chan *chan)
 		list_add_tail(&adchan->current_tx->node, &adchan->to_free);
 		adchan->current_tx = NULL;
 	}
-	/*
-	 * Descriptors can only be freed after the tasklet
-	 * has been killed (in admac_synchronize).
-	 */
+	/* Descriptors are released once the BH is flushed in admac_synchronize */
 	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
 	list_splice_tail_init(&adchan->issued, &adchan->to_free);
 	spin_unlock_irqrestore(&adchan->lock, flags);
@@ -552,7 +548,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	dmaengine_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -671,7 +667,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dmaengine_schedule_bh(&adchan->chan);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -721,9 +717,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static void admac_chan_tasklet(struct tasklet_struct *t)
+static void admac_chan_bh(struct dma_chan *chan)
 {
-	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
+	struct admac_chan *adchan = to_admac_chan(chan);
 	struct admac_tx *adtx;
 	struct dmaengine_desc_callback cb;
 	struct dmaengine_result tx_result;
@@ -909,7 +905,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		dmaengine_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0

