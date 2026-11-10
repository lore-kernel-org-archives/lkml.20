Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279973;
	b=0RC52/UetJbGpvfAFHe0E2LnnkTmEDDKqfd+6YJaNHFkqe+plav1aRjByc05a1ssBwBA
	 rDEljoyi89dweIPhzVFNCz+KgajQLR383rjHHKnCvuSyfn99QjKSo38+zPXXow4ACfx6k
	 AtqfVULTM0/oAlqdDwdwcv1O00O9EyJf69VI6SSoi/r7UWScLKsRp0mDH6aUXiQaxvtAk
	 ogHKe/28nmAiqac5xhb6rknrGhNxXQE/Ah2dKxea2GLWCdYs/0H2Yusr3EFkAKlifZZNq
	 x32k3lQ6pTN7O4acJN5laVu6gt0uv89TagbhjEjId7LHEnllmtUi+hWTES9VM4z1kjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tQLRzDw4bvXr9ZRnrhDdzQH9SFs0wSZAanziz/iGjrs=;
	b=ie2t/6H9t5smVX4SLsTRbFLvPEW9afGHOd8tZdlQyTh+GeP4HqRHlnZ0EFYxiXSKN+G/
	 4RD7GUpazuyj1qvXo1fdNDDD4i8dbS5Lr12UFBI2oCti3r+AX9OTpe07jkTz+MzaYImiO
	 OfJYgC+69FHlQfFm1NL3ZaG4qOqNUqp+YvaJaL235McNNYLXJ7z0Ir+7hTK/FB06sIXbP
	 Mt6oWWXuORhWu5DAwviqd6wudwVjaVsCE9d5nIiklZ0pYn6nSTvr7fimoX6wj5cqUmJED
	 rcncJY85TExloln4H8N7UiG8+D9D3SycJTV56bLQnQF4wmvLQBAXyqWjpyQzs1Cg0og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QF6Cop8L;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680C560A2604
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 680C560A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QF6Cop8L
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4a77dcc4ca0so1018407fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279971; x=1794884771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tQLRzDw4bvXr9ZRnrhDdzQH9SFs0wSZAanziz/iGjrs=;
        b=QF6Cop8LNly7XYUHJuMhHwcfiT7U9lwvwQt0TcT+ptRcGB5T9VPK6WriONXxboB4Ht
         WX7lmBFZak799sF9mbU7e8zlZu9ZNVAIONWV22NewD7d1tl2fLniikx439Ou31GpzJ4E
         ATYeedgm1TtVXc9iA3/9QsNmbCTDJXzuLYVcBTm03rNbXJo4Yy4NA9j/Eczc4QfWpaJo
         59vRgWFoh5F5z+vbqXwNdWGz2a0RxZiKUrF095A9ox/a0WMxFfvnHCb7epxy0EN7IEku
         0ZQTWxByb0WIMa0XWvYkHFG4bCIViWlb6qiVq9x3kCskxgwOiys23uf5VMcOCQFo2tVe
         MsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279971; x=1794884771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tQLRzDw4bvXr9ZRnrhDdzQH9SFs0wSZAanziz/iGjrs=;
        b=QCIlYB+Da7sXc82p6nJRThEzkQBN+YT6Io54yvC+q42j5YDzo4jfPKeUNoUuP/5zrj
         VAtmlIPD6Ye9w14L5Qi+jJhq9zQ87BxRjsC5zCm643VopWHQMj2jDNYlQVgBDXQ7SUeH
         c6voo4t6CPLlwBhqhfIRnORJitOlvLWG+ABtIgqgVpanIzxNAtry/k2Po9B5JYTU62Ut
         XHt12czMgmbRuafOq0wV7cq//7H3tppBEvwuFfMfQ2M0CiD0elbAzmoSQTtiMJSa751J
         SypYnjLeMDgbsXKYBz/AMe89kPRIH3Hut3n5WZN34Ze57uoYcaJ3BwhUX3KoQvKyBQkP
         pO8Q==
X-Forwarded-Encrypted: i=1; AL+hErFghb636CpRc3TVlX76WjgL2FPvEq7mqd/VvaXIye6goYOfbShK00fLsKL7BorFmsukXSsK5wwaRjhQp0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OK1CEpskhp1kL0hdxghEpX9KKOQQ6w+OarlY7iHW/2Ivici/6
	6OsgVMMudWIg9VOHW+bxIB0X4cjYr6U14eoi+gLJ3AyJvuX6ArP0S5dN
X-Gm-Gg: AYBFou0cpNfSusiArpmANfl0Aqkb0U8BnbUdkagwk+0B76XYW3M3zjH7MDtlIvY+OA7
	2391wdujLpl/xbJ2V/KPjGPDL/da2pQ8bgdk9RYKL4+uT3ICneLbfqcGbBhnLbg1jMnwYxcRAXx
	CV37CcqKhDvWo9AJQhjHI1y/l8DpXLN5UImoYTU8s/O/JbIssIugWN8SW7F8LAVtDr2EW81/NXv
	/+4e+iVBT4mQxRQWexcS7vIO8rYyKN6f5KBMKg2GGfy7p0wH7ISnhf0aFmG/YrWD63FjHPNzK4i
	QKnRIR+X1A2EmWJpChlp5yEI+sVK7bCtU1c+l2oi00fQCHCtkjZ7z9m7BtcNXLaYsfryCfGlwQ0
	SRxuRREMDFZOK/KdU0nXdUzM8A5Dh12zpmrp60Jy47ycR/Q72dF8MRdV3r4dt3RG8LLIzc9ZuNc
	EOlWNJLh/atmUelChH5cotFNQY8JcsmqCr9FIwrTM0/EfwVaaPmySxC3PSwwkXfl+AUSpdLBwUK
	HzA8eBAAZ9grsp2yGMlWIiwaFzvtvXMaBP2KxAX6wDGfIeQlZlL3NNMp9lX7mNgC0+cQ78GTSNf
	x82IA+nipt29+I3BfXNE0GDAXt6RpkcGMKzpABXzj1Tb1yWx51hjIMMTaXn4VKFG5huAsVgL3Y+
	GKgQFy6yxJwh6YcyLAf6TubbUufgjaGfS6mjG0JW3+ovbmJ6qIc1AcrA/ZEUXmqa34N/aQnI2sr
	TsWfI8DuvdWLRstOLSpggTsXtbRNYXeI1hszBW4AsPHNrukutX3XSo
X-Received: by 2002:a05:6870:b3d4:b0:448:a3d6:c2d2 with SMTP id 586e51a60fabf-4ae225894aemr852134fac.10.1794279971434;
        Mon, 09 Nov 2026 19:06:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fcdc93sm683389fac.10.2026.11.09.19.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:06:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:06:01 -0700
Subject: [PATCH v2 2/3] dmaengine: dw-axi-dmac: retain descriptors when
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
Message-Id: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-2-64adc48df793@gmail.com>
References: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
In-Reply-To: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
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
index 457ab9c47ceb..281d7c79246e 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1187,21 +1187,24 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 	int ret;
 	LIST_HEAD(head);
 
+	spin_lock_irqsave(&chan->vc.lock, flags);
+
 	axi_chan_disable(chan);
 
 	ret = readx_poll_timeout_atomic(axi_chan_is_hw_enable, chan, enabled, !enabled,
 				       1 * USEC_PER_MSEC, 50 * USEC_PER_MSEC);
-	if (ret == -ETIMEDOUT)
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
 
 	chan->cyclic = false;

-- 
2.53.0

