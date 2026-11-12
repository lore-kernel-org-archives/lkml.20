Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471788;
	b=cVGtZSzgQGer/9WygiR+Yq3JKNaq1O4hSpj5GQVyNxIf1Q40X44flR+7ux/smAM4iDcK
	 HLuT01L6p79Z2EUv0IW/SWsC+G3CNVsGrPOzsVnYkXNdKI21PguFJxE8EHXOaZE6RM1wv
	 sSvzVhHYlHszQzUfwK5/G3pycUQ/IyANBlQudx2Vq4pKkJSrevgwY8wdmOOmXckWbsAR7
	 7beX37H1lTPPAYvcEnfUJrMh447Ur/CkXikPmfzPLmIxymyYFFkmWcwL647TOFd140h3m
	 Biv8b27cNcrRucpHLv3BGU0qbT644HKYiR3+XYgtreUjLgQrHdhQWngaPBklR69w5qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
	b=qoi/eK7Mg/LfQl4yrJyZEdF65HQhET7meEnpRmrcd7T0XcHidUiExuL6i9JXgHTiiVpH
	 pAnwDwVpzw2vjjOcrbOtgkzBdRtWDih/Z7izRl1RmTLSCM21q4/C2EeKUrKJXsz9IF9+z
	 3Q3fFZGTw5N2mK1ihiF7tiI7TjiY5Q3nOtmGlb2lvqdqtFlXmHaOPEqyA89NLrvS9lpSW
	 NU2JcyUSRzkYhowRFcL5aLPYjz7RukPQPrd65S4maG6RSAMtYulUw2REGuYu06WnuKXvz
	 L2HpY0QgNZryNuoYf9p1ekcorHqlMh9oCGbmWgGDkRVCbIS/d6S2X+jyyPEvlaoZhqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBmUcZD7;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A19C606A339
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A19C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eBmUcZD7
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4b28d9537bcso470715b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471787; x=1795076587; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=eBmUcZD7RDwL6scvKv2mhhFTSaZm6ZyosW7GYAoaRF6RB1wdDUoM8cIgPfMg4TXV9S
         Ikytfuzn/unSJuXRhUdnuDgVisjz+bQonw1KKn8tGfpannc6xNuWpQTjLYP1X0II/Bo3
         pAAhGIC3lgZztPUOsCjDjTHVqMr0j2BhkcK+aqHT7i8GPyrj4gZ/Rl6fUOEF0gq4Ggtj
         mztuY3LAVavof1KCg+9+KksseKmDp34z2BfRHET0v6yndglB8oy7gvmHLfCoeIoiU0v8
         DU6H5jJ2FkPveORLLboDtJJqagJBBbjB+r6I51eVmstDw44J8pEr+QPGcC/N6pDH48Wo
         RSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471787; x=1795076587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2k4jFluLeaP0eKylJ7J9HI4auhBjQtbrBm24Guvwz8=;
        b=zvtwvgF0wh3i9tHoJOSu0SamlMTpsZXPbhqSP6MHbO3zBdZqRG56SKBHz58tys7nJo
         LAd9ZxSqVyJ4onMQdt5ZbRswbnfGe2+BLwRATZqRVd9NsIkNPX4Nbk3p0Peyi5lMZbrN
         H4dnc8i9zRLaox2MMAHkrePPwNUvB1Jng3mSbXxVkpX8HLbjMjVtjt8lEYbYMdlEsqoC
         3k7jeynv8G5ujN34To88Nzc9pU0FI09ZngC0odV6o7HSAwQxmWOM0sJ14Mc3nJluvtsy
         a9gR/A73TGNWaDwVSeKcCe3nrOCcU1VRTi7qsKFc+EuqHBDmfWoqA1CHTSPtImF66e5i
         3I2w==
X-Forwarded-Encrypted: i=1; AL+hErHA6PfyENp61DbI52dn9+00rcEQA7Dk+PgJwcfG31mZVj8c0ie7+B8gN0T19Oh+rFAD4ri33/E6rJZ8Ha4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m8y9OdZ/60BaFyz/PlD7W6CCYxynKxnx5wQRSyyYjlgZ0WrdM
	TMCMTUQAMYthFW+Yj4vgzqKU13I7vIoJp56Q+zuvUAMmqhekY86/tnrQ
X-Gm-Gg: AYBFou1JqQKiTJC3ukj5Q03g+eJE+6xwQck7DPOTmu7Xyp22cc0xzPpNcz9R2uIENd2
	+AyBH2e06mhks/WJ/s5dN6XQahNoIkIvx6D/b/qW3PDcKAWjNzXnOPLIF82JNOT99mjTuR78ByF
	8THms7G3l70zNTXqF4E6PaQ1nXOKAt83aRBu9XrYhvs8m1+P+Edu8+ju00+ZCdw+1l0MpRRXEvw
	JZtZ2S72GBBDhWPaz6Bfl6nrr36mPfjB291n7ywthniCCyjqQN3reRRF4FHooL2O65AIdDQxPbG
	2qIET5fl9WAlF/DDfQSYJ8LL6/jCc/j5NBkHskcj8i0aGSPKffafXYNaEW3dqZiMim8Q562cuk7
	/pivkTdW5ggZSOTE0oO4+b9PEvAJJ/C8E+BjFT4LMFptLNNikKBFB93duXjQk2akFL5iB1qS0mm
	5nthbe78nI1uNG1df0d41fSnRjfk/ziDxU7bBbNHEiaPKkG3Q4dHnPOus5qduyPaktqYlYsWqOw
	Wp8ENwuqwoAhbxtzu1zMii9ftM9oYJXMCOoxNg87KWxkdIrlRZ539NaIpR8NjyKuUMPYHjuBdIS
	XeANrDZ9eJP9LTW1wWtjqmRWWvvo2rxZw9ii4Zhg3ZG9jL9FIX6eHpkmVvYJkE6e9oceLZxfgbe
	Up/X9pnRgJJpFmD9xJeT8+RrsRb8gT3/nitO+TIipUPE5mTVLQ6YUoBWNjxNwViXgvP58FjMR1N
	L9j6g3nYOggNxPbnjLb1NUPlq2AKKjktB7leoHqLBOYioEEdHnDra6
X-Received: by 2002:a05:6808:508f:b0:4d6:9133:cff1 with SMTP id 5614622812f47-56cd673ea55mr1534867b6e.24.1794471787562;
        Thu, 12 Nov 2026 00:23:07 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Nov 2026 01:22:53 -0700
Subject: [PATCH v4 4/5] dmaengine: dw-axi-dmac: use atomic polling for
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
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-4-3ebc24b243db@gmail.com>
References: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
In-Reply-To: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
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

