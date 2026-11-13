Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794562604;
	b=mBA5Yvs9pe2PkxkE5cibH6LBQk3zuT28M7e0kmFEnnsM0fDmhyNVvnQmKry9zB8cd7H9
	 4V41CetKQmvp6eJ+L2fVaGX19d5FcjS9kEUknOQvljDt8osSgdcwyrRrlK3azbi/CIePo
	 iexed/yK0mn9v3ugu048eR6TC4SuIoTnPlUrIPTzNzjrpSbnxOUnaYPHgmJiLVsLz+2Sw
	 EC8umymybY38q0vr18/GJfjmDlkDPfy2cPm3v9J5IDJge3uSCOXwVIfk3mA3mXoNPWat9
	 UDYhRWHqhD4WXARBSc92YjX0i4zRT50zDft6ka1ShxBQ3bApxK0Hs03W5xPJnEUtVmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794562604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
	b=gRJu1opXQc9L5DUnk6hGQtk7Vugu0mQzLt+ijqYmYHdsTjjAk0VnkvNlEtAl0g18fCUD
	 EiZbIW5a2c5sQuZWnwE5OXX+mrsky0OUVam6zxaTiahWF3msZxV4raFAGilcezjQdtNRP
	 E9UQa3swLI4PjTqrI6A+8YcAuirrQV8DXhze/oVlS8q2tG4XFxPWwa/1iAy1QbvoSUFGn
	 vuCnlEQvtJyIR/bTxrnnCY8Izb1ACFwY0JZe/6j0suhFTWMJiFGDxvZVciqEFvhrpCXgw
	 9TCpwAPn4w5B7slxXdBxAzTorU4vfdL+QQ9eXanSx8AQLKK+w1Q5/EZVKkjZ/KhEPQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFsdNnnA;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48D860A2606
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48D860A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BFsdNnnA
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-705cb6ceebaso1163189eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794562602; x=1795167402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=BFsdNnnAw50iv/2tI17cER+y/Qt1fRUQBLRsCpXwAdoxuI0H5AiXutsT3RUW8Izuiu
         vkb6AQj84uUK7iYWj0QhFelllh0w3wTUnrm4QEaBe3lXU3nlpag3vjaZhAEuaoiy2XAh
         uZf8d+owfYDmZv30Yg8O3nuL/HjaGEPMwj7brszhTxyUTqAx/+zph90Kb98Dp+v7PMV2
         fAHoSESvSG7YhOFcrCcLbm7UBK04M5xe+WjjTlTVcB+d4D0h99altWAUAwkf1bPDcXQA
         1WBvxhWITRjpZm/GBNfBTbq415akf80peMST7mumMxcgDytMUs+fab4uwgut18iBmakD
         YeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794562602; x=1795167402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO4lonZbzonXjGudrUdKykQEm0Ub0u8cq6ZIlxF4Esc=;
        b=xDsSPM3AvcQc6sGYVxKOHQ824XCOybzzBhN0346MQP+5YgoCQ3r0IoouTObbGjhMIr
         0ZTKT0JWLsg+npzCNxhrbs0WP6YGTb8PFD88uIb/EnbT2FDUhAl81+drRGdfq2VHX3rL
         ZYPrqz01rRB/umliRc51y/uaTR4ZOp0gcsA5FYxZUz+tL5RiznmuL0c43D+FiF6bgpN3
         t4Q+Gfetxn6EcaG5cXcrk/uwLLMcPZfp+mnI+Xb1dFOev51abcG7J0n0/xyL26LaCfpB
         t8L9jgkI58xkCywnHCVuhq8/9bCR6W3t2dthCcotjgLk+BRj09CANRaRe9P7//kbhtHN
         128g==
X-Forwarded-Encrypted: i=1; AL+hErGFKs89v42U1qLADrvVitYmfFomWXd6a3X1N7xfMIzGGY8mt0mDFYo0lNQOrAjV2xIrjPG9odck+wMQ1fA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oazTSO3aPB2vogFzvAgPVELmO2DIp2pbzV1Uq9MF7RQQIPOvr
	5aMtjA/HjT8tEdgppllk0EL54StiaL/osfQHUiscYEENKdamfbwV27lI
X-Gm-Gg: AYBFou2NLx7NTjFN8nPpaTOz8RY0nZ7jysuW+l28wRdPf5nXjeLNnbYFsbcZtAmuCQi
	lDiOOkkyd4OXJZ7xERA0JkuhTBL4MBKIyenG0W1xToaA4uQNwUUiq9hshpFSo+EsYJcbMP3tAmq
	Fly3YmQLZXnWR4csX4kUTn/bHnDP7nED6ismwv/+/NKjz4ryKgpoqSRCE5WOXsi1ScpnZSXaeCW
	+HFi0MfbCqzYTWYq8ymbQdfdV3YeZUn7A3I5Nr4E4jFxW4fS69czWzDTf0RfKoxljQ8IqBOD1B9
	wM5p/hoQlAYOfHCRnQeP0rXWZOunvDuKVzKtiFC+6Rx1ERhRTM+4bNsBh/RW7fyRuZXoMyPMzuM
	PtAyhH4L9y/3SOJz/n2fJvAHhn+MlZ65IFKfqo6VObAb3icaBpqLBszmCoHMfA+GvpHGLZXlfhp
	R6D3cHdjuU4pS4uMXfkpP1RV3oAA45XoDKMdvPiz/BpSUx3j2hOM4T/e1NlaEEurl+eCi3DRRoM
	CLPoYWbULSCPPc6GlAGD/CVhbk0XMX7l0gx74wvV4RqAPJ+oZjOdpkmRq8neE/vuLq7QZYzTBzb
	2fzndQhkLalMNGd1UAmXmfR85yqqAhntSq20gl5hGyR5VQiIA448JKqZR3Xjg57aJ5o04H0q9FX
	D5X1wBv74ujq9g9yntkAdN4qzTInkiNzgB7+BUFNKHT3RtVXTHSCYeipxXwxjdT8R6S77UNgR4R
	HAimvDizpgGwO59TqEn0DUzCd9z4mk2qwvNoPtMnpySpIzf3IH83URMrKWGRF+fCswosBHOZtBd
	A==
X-Received: by 2002:a05:6808:f13:b0:503:8f9d:f11b with SMTP id 5614622812f47-56e640cffffmr1509542b6e.43.1794562602641;
        Fri, 13 Nov 2026 01:36:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc42a8asm1627607b6e.3.2026.11.13.01.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:36:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 02:36:36 -0700
Subject: [PATCH v5 3/5] dmaengine: dw-axi-dmac: retain descriptors when
 termination times out
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
Message-Id: <20261113-submit-dw-axi-dma-stop-pause-v1-v5-3-8523a27b5788@gmail.com>
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

dma_chan_terminate_all() warns when the channel enable bit does not clear,
but then frees the descriptors and returns success. Its synchronize
callback only drains virtual-channel callbacks, so terminate_sync() can
also report success while hardware still accesses the transfer.

Return the polling error before detaching descriptors or changing the
peripheral routing. This keeps the transfer resources available while
the channel remains enabled and lets the caller retry termination without
treating the timeout as a successful stop.

Hold the channel lock across disabling, polling and descriptor detachment
so an interrupt handler cannot restart the channel between the stop check
and cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 405ab9a78955..040c12d07db2 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1185,22 +1185,25 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan,
 					enabled, !enabled,
 					1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret)
+	if (ret) {
+		spin_unlock_irqrestore(&chan->vc.lock, flags);
 		dev_warn(dmaengine_chan_dev(dchan),
 			 "%s failed to stop\n", axi_chan_name(chan));
+		return ret;
+	}
 
 	if (chan->direction != DMA_MEM_TO_MEM)
 		dw_axi_dma_set_hw_channel(chan, false);
 	if (chan->direction == DMA_MEM_TO_DEV)
 		dw_axi_dma_set_byte_halfword(chan, false);
 
-	spin_lock_irqsave(&chan->vc.lock, flags);
-
 	vchan_get_all_descriptors(&chan->vc, &head);
 
 	spin_unlock_irqrestore(&chan->vc.lock, flags);

-- 
2.53.0

