Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562605;
	b=33m+sxhTVsZqs45TitfU3l4Axktqo0oHc9SL5AiqDE65TtJHBtE7ln1J6Cf7FYAMeYpW
	 AlFo12zCqnYh5q/UjaDk1talbvseBAY5Ce07Lb5nZCHbGFoxfbR/8m8dqxS11v5WGjdKj
	 nQ2l+cjVzk48/TogRqUa60UgAGbFU2QMff/BbmXGCZMuGngtlPqBoB1WrLAjTofdj9hoi
	 eWlblZI/BBJCupaO4GTQxszKQph3ZaoP7SBb3TJlNNwXKOCe8nvH1SHAz6aY4aqWIyBNI
	 g/ecBNyquOjEbm6l6CRIpRst9/GgE8zFOzVcbbenaKxCGFtDTvbzGCwqfTMwyTzvuYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
	b=VstC+VQE/tUFIayjUpFY0cyGqBGvfaEHd7/KSdd0p8/A6hubnTDbGQ7JiXmhrU4KBdeC
	 tcMa2isVtOLLt6BTGsSb3GzpMfyZX+le/xkW/nO8Q8znGVJzEL8g6VhMXz9FlLBUsLzha
	 lQTvo8lxxLbKZl3oVKxWWycQ6iY6ga0XCg2CVxEsbIFc2HKD0ZGXcFtHXHXypAi7zjg/n
	 psDWkvVe4hW85CZNYfrG1ONxEd9O8REs3zBIZnfy28gSPnz36QfyXQY/LGVwVeSWC84MO
	 mur8THxIEywO3hJoVNYG6LlKSA7kBaMJmDou3YtII+PUugSgG1wuNSSI9bF09HINDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBGbxXzE;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7D660A261B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D7D660A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wBGbxXzE
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-43bf9548df4so1400593fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562604; x=1795167404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=wBGbxXzE04sjmZWmBOamp1sP2/bnvrpmUJxEQhd4poKnqPWXnGr5oxTsQ8j5b2+Rlw
         efDtVYPZqbQRQHV317K6I/pwUEbqn81VLAgPkcUazleN+r5jEBy/9P1qp5gEfUgeylux
         G2jwD+QHqBcZDva13cnVqG+xKOLamw/0uAv8hXI6mRAjVDwWfeygIfhsRYs38addGBfu
         N1XhKlv6IWDdEtgJKLppw5Wxn+9QG/pPRcH5dMqkaQOQgvqEJ79oAfixCAOUXzilIbdR
         d5PfZXQqv7FJXXqRRqoX8mJK5q9DGbUjceQb0SEDSK7rRK7OSPoSBfLIe83b5myJLqzd
         6M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562604; x=1795167404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=jLhRz1eTX/GrIhh+46PtyK+cskHfrKAibwJPqTPPKJw9iadex2iRRn5vW28yzSJzo4
         A3LddaealxIzZx4jkrYXBxTqxxw8YTEE5Kddhwdy5qrvBuN/u/NlAnFwpZ01iD8zWyre
         bH3iGrF8JGteBiOcfMi20CtaY5yeTkQZZSAR/KXkQrgsjVUG88zbk31goJZ5NXz4HebK
         rx7zyf3Yy4rqcAGy+1UQRVfuIrhbcriju5/PEcLZDuLYjjEfG/1rHZ0dzkXSJYQG6/1U
         GF9vRyxY6keKbu0N+8PxwJhD6oiYHrInBHuEAYdivaZOZDxOU+wK12FTuURpiQi3kqWg
         Gz8w==
X-Forwarded-Encrypted: i=1; AL+hErFD2HU5h/LSaS+7EWyEHpu/2MNTec7Ya4XoKJJz0sMRpD9GnCvhDCEJWwGaYcM2qA/KSwzNJ5LWdr6CKkk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ePFhpKkirg7oKhFV+GfudQRb7SN9P8SVvUoLOE0GZt8HOI3W4
	cft4yf8Ii4lrO9MF1+zXb+q7DO8raRwz2ToCfOXLYyaC9PmRh7IeLYxS
X-Gm-Gg: AYBFou3lyXYTk3vo5vmJpf/28+oCV7cMwAJLu0DJSCfiaB8bXZ42LMso/ZlmywkqCVj
	6BDD3GQ+zMzu/S1XvSd6D05R/I4FG77CQm+MG6eSWBtx4CkUZXemw1QloT8jutMnzd9Aoqg2WwV
	y5blVDxkVNuAKKZ7EzJyAntSbIUUEhm6vLQ0IIlLfKAPdl6JOav4NYaSCnADSE2MV4UZmjPqk2Q
	Qz8n5isD30TVqGLgC5c5PCFHLgZ+55nIlOLbFMANykIqsZhtAfv0X1KRTIhDCBASAgW010EPYby
	WwJHLKx/O27h4BvVHPibVnTlHX6w/5x2R9GTAsFqGFSafj0YZJ6n6/zNIWCG89SuPozAwZGsNN3
	hk4aeG6bMLELc4bn8a/ZGZaX6zX6U+GuKdfA4sxjKtJsKCn6EPsWxbxO9MfeaIaP6121yE94Kpc
	mA3EnsGvO8QMKRqHb52ozPJLpv7MhivYsmChe4gfez3S0RqXBCPcFyDwbaQb78w94fSSU6Cy/8z
	neE9o7HxcnngUDX5ttAMjMQZ5/7bZjPEWa33OUK+WnRDvEBlBGQdl0Z+J2qIOaUfjxW6wR2I8gB
	I1ktLd3M/5M9g8kZhFoFg12YhZ+7KajI3zxJwLiaD37j2HcGoFQTgw8X7UFmbYRv8pRdfOmouXR
	Uws0PzGU6fNyD13kJguv/8uA972JLjn3fWek/Jfkkei1gPH58Iea0lZB2RtAbJy3E5p+9FG7XGn
	aZRTzRj3PrkFyg7JEdFIarH3A1BYiRHhjkdk+7DTklwRUjSOeZxEE0
X-Received: by 2002:a05:6808:10cf:b0:563:e8b6:c5d5 with SMTP id 5614622812f47-56e64cf4cb6mr1678912b6e.44.1794562604104;
        Fri, 13 Nov 2026 01:36:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc42a8asm1627607b6e.3.2026.11.13.01.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:36:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:36:37 -0700
Subject: [PATCH v5 4/5] dmaengine: dw-axi-dmac: use atomic polling for
 suspend acknowledgment
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-4-8523a27b5788@gmail.com>
References: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
In-Reply-To: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

The pause loop delays after its final status read, so an acknowledgment
that arrives during that delay is cleared without being observed and
the caller receives -EAGAIN.

Use readx_poll_timeout_atomic() to check the status after the final delay.
Keep the two-microsecond polling interval, 40-microsecond timeout and
-EAGAIN return value when suspension is not acknowledged.

Fixes: 1fe20f1b8454 ("dmaengine: Introduce DW AXI DMAC driver")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 040c12d07db2..1a53fbc951a9 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1219,7 +1219,8 @@ static int dma_chan_pause(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
 	unsigned long flags;
-	unsigned int timeout = 20; /* timeout iterations */
+	u32 status;
+	int ret;
 	u64 val;
 
 	spin_lock_irqsave(&chan->vc.lock, flags);
@@ -1250,12 +1251,9 @@ static int dma_chan_pause(struct dma_chan *dchan)
 		}
 	}
 
-	do  {
-		if (axi_chan_irq_read(chan) & DWAXIDMAC_IRQ_SUSPENDED)
-			break;
-
-		udelay(2);
-	} while (--timeout);
+	ret = readx_poll_timeout_atomic(axi_chan_irq_read, chan,
+					status, status & DWAXIDMAC_IRQ_SUSPENDED,
+					2, 40);
 
 	axi_chan_irq_clear(chan, DWAXIDMAC_IRQ_SUSPENDED);
 
@@ -1263,7 +1261,7 @@ static int dma_chan_pause(struct dma_chan *dchan)
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
-	return timeout ? 0 : -EAGAIN;
+	return ret ? -EAGAIN : 0;
 }
 
 /* Called in chan locked context */

-- 
2.53.0

