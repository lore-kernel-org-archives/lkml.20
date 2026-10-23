Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798727;
	b=DmOi3yl0YMmYd1CBxkammQoSxfRt9PN1qxu2hwVkQ3LvM1aenkuxt95F4ky3mHZ6X3es
	 tuIXE34vaqo0YiNV5rcRUUUNf5WpUrZTYqcLP5a5CR2lmjUm6DFm5gPhDtOi1zKxI/HqP
	 HLMJVFT0bU5w/W0ax74uilHfYpD/5tDkjrKsjjlIj7wbxkXY0jujIK345+TloyHxVb6Ym
	 6w2ctzUetlNHgzZkoytd5KZtPtN8khau6IaElEMDAavMk4XzYXgHkzKke2HUuQUJTOS88
	 vsS0F1xQOeYcLPIFrok0KJyZaBGy47tAEHSktCx4U2v04c0ofXY1Ojz0ek5gyVJJdtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
	b=DYFhilEopm9RweGGHbG3zTOeiou5nQm9fO8CNttxJl2xpC5hpGuuT+flryKBeuMH5UIW
	 jUv/5LAKL5hV5zkxfYfQXMUmpCcA0O7cwsU9ZpFC9vHihcUmoCeMk0hnFE/Z8bjzA5HY3
	 dvuhue7VeWwdcQ5IU7LQg0zsexKFyQ6CZh5xGZTxYXs8vGQWdF73Scj9T0+SMfx2tL9bs
	 qw2NG8I3GpLnx2A/YKg4Prcpxv+3zzrWBx+Adtw0Q2xrYdkDjjF2UxsMQphfL3NLyOzBI
	 pWi8n/4zhT9Y4Ndfln96AACYjLhaXAdmbkJBV4KC6CnZfCrKYra3mMecGySE7mWm1EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R0ReTaKq;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF8360A261D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF8360A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R0ReTaKq
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4a75171af39so512255fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798726; x=1793403526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
        b=R0ReTaKqekUuwEi+6yW5GTyiGAtsWaZu8oip2H2koa+c75HwnNpL8Ki87k9vxe98NN
         FyczHtfniscTlImnh6cs7MIyxIllCLXtHwEXHU4BDz3X1voHx8pxfl5w3FcspoNEsAar
         TvV0O1y3Zzpy8kSXMVC3gMIrF3aDeIZlk4eLfvy9mtXVx2qrFjgZGtLOvnxpcTLQ8PhO
         IkMb6FELV3XWkLQlKLVGJ8jHraWSroU8vR/6YOTFJAaTa1/zTSbOG+glYzgGvdcQhFws
         CQmRzPj1gud+Ev7KIl0yxRfT7w5YChxhS+XYgsp2N9l9mQiOiHReIF/s2AytgFKBGjGw
         GE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798726; x=1793403526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R5FazDKhThxOYInKBUow6UStlAet68U4bSmH8n3hkL8=;
        b=OGd64UjC6ninRFyUyuhZAvtwMzjjuPRMNE54klHWCGQKRnbZOXvffVE2vDBsWx+yEa
         3ptMUtHV+R+0C1I/YtKXEIV2Kn0FhMFLKzekAFQlHcQimj0rJZL76zh7s2iHNigD/aeo
         +Pr1Tyko7lIHuQHFywR3blJ9RV+dcs9lq1ezSn3rAI7frnWaXVSbxGzjUEoAuEN6vvQ4
         wNHZXMC7kA30mWIjp6//uPFt6BqgBcYhfeGqhO7q4+gu7p9/gR+c6YUR9DqXR4NRjgM7
         A8lBbdWKT2Empy6K7K2YjYzMVkx09D6Jk06mz0lCrXLn6NiKjDXGe6baiGJjQgOS/IMc
         Jzww==
X-Forwarded-Encrypted: i=1; AKwUvBzHJR6OD7mvWklpnrwp9cFzFsfruJ+R9Ok9RmUitasHScLK7G1Gv2zriIX5nJL7wogPxeYP/SXEUEJfUyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTJpP4v05iZGepBozDX4+gGpNTroRLPGVawYOOmBNcb5CAZItp
	H+nGZK9A4f2zIm19EPdn4CusYdgWz8gDJlWKGU+6jJHvD4PjSAikrI4b
X-Gm-Gg: AYBFou2gHr9Lfd4Fs4XaS1n7kn95suXX2q7n8f8Xi3QXROmMTwlOwm9SDyKz0z0t8wJ
	Qv1ODeJIslRgQ4umVvuQzB5kmda8o1mZleQIjV6Ao5MFVqEhpDcVbDSPETH+UpVrGFTQKjsk3k+
	JZpdkf3NkIaDe79WVpAZcrijhF4dGZ1ymIEBAU/AZiw8vh4psrQcHhdOwlPwjAlsRbi5utzPbE3
	fmaPjsq7A3hmOcdRT+vizPLa0aZIekQvHJaix9PU4qfEAH8zW6nuqzAbuXF/TwuUXmu1BZFWxNp
	q7aVQbUhsPcmXNzygRAb8clieQSQajk3bFlBqAzqkg0ZRzZ/EVTPa3JWbQac0OYNpnVj4mIovqF
	KLLel4xnu1jv12NLHWj3CmmagYDNRMtFd/7s+X12K7wfIqg4FfvuhFbxVuFHG40kGcB+3WM2zTZ
	jU2PyUcnFtO/lRHQgK9t3j3BLZW9e0qFBQ0PdTof9oKOMBjMFYCdWV06WXDD7V+5zcb/728GeZo
	7Jst7ieYY4ivbJ1I8fFj+4++HR47u4Btsr82P1MkcUO99QLlnjPY9T0irgjYWl6ubUtQMNdSr4W
	LEoX2KS6A8nVgT+1BA3Ms4lWc1LvXF3uw3st0HbLg+q99euOy++Ge9EH+xRMyEcOXUfR1/IeNSF
	QnzUl8aK729ogpel7FfykPs31FMQZIWO9jMsLrBmdcxrmXKpWY6yk8e9POvc2UtTVPu0dunEKzt
	IaA6w=
X-Received: by 2002:a05:6870:8322:b0:4a7:5eb7:ab9c with SMTP id 586e51a60fabf-4a83f58e567mr601234fac.28.1792798725802;
        Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:28 -0600
Subject: [PATCH v3 9/9] dmaengine: sun6i: keep cyclic state with the
 prepared descriptor
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-9-ef1acb0be768@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-0-ef1acb0be768@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
submitted. A finite transfer on that channel can then select package
interrupts and take the cyclic callback path instead of completing its
cookie. Merely preparing an unrelated future transfer must not change
the active transfer or the meaning of queued descriptors.

Store the flag in sun6i_desc and consult the active descriptor when
selecting interrupts, completing a transfer and terminating it. Finite
descriptors retain their zero-initialized flag. This also makes callback
retirement depend on the descriptor whose lifetime is being ended.

The shared state was identified during the H616 cyclic UART RX review.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index b83138745bd1..2152979f72f2 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -207,7 +208,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -507,7 +507,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -610,7 +610,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			desc = pchan->desc;
 			if (vchan && desc && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (desc->cyclic) {
 					vchan_cyclic_callback(&desc->vd);
 				} else {
 					/* Completion transfers ownership to virt-dma. */
@@ -911,7 +911,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -1000,13 +1000,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		/* A cyclic callback may still hold this descriptor outside vc.lock. */
-		if (vchan->cyclic)
+		if (pchan->desc->cyclic)
 			vchan_terminate_vdesc(vd);
 		else
 			list_add_tail(&vd->node, &head);
 	}
 
-	vchan->cyclic = false;
 	vchan->paused = false;
 	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
 	list_splice_tail_init(&vchan->vc.desc_allocated, &head);

-- 
2.53.0

