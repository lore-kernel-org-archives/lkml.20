Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780971;
	b=HHWETb8ArIQw3gXKLvRzGwRmUJJf8TXL1I6n6Y3IrjkGQE0LZWtVWplSzvMXgAGXmqlM
	 qN/4tyknYdOwoEriGXhzE0LhULtczw/L+KHJcIAqHxG41a6Sy8ro5HdPJSLThY2qtVjYZ
	 AT7vdMPE5PH5nyyY6CSVbYQe55tFT3/tcNxgFiqMhPDyNr539rV0xeXxklHzYg6fgLi9o
	 NNkkF2CLiamGsl8mzwVJSNCoc8vk169Gwl94/kCaGGiHmqAFhFmftRr7U2whafjrnijbg
	 PVx5nCAxkAf8etCmXiJ9IOTsu5SyYuPKIBYbshu7hN/zIB8MhjyCBFviGD0NmfctzZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
	b=stn/mq8mL9swh+9IEnXRV2x5md9axKRyqu9Nat1oNLQ/SAYgbsP2WygH08wXRGNWYnJY
	 lo9PbZQIjBFvMecJPLwVYqhmro1efb1O7d1ia4lssLdQkYqeRWJ/TG5EaHy3f02JhvxgM
	 FFezHMMUDEnJL1TWX4/EBPoY929XJVT+6oErmU8pNbUm7l//hZQk59ie79OaIt/Hc3zec
	 nYYvy0iAyNiAfcpJ3HxiHcaWLLhnqENFEBb3wtqCk8zh2Dz63kEfozFZ+V+Bj2rR63Jf4
	 HCmR4VjOdDzwZWHzR8XuRqhFsb5j/QYfWLh2fmgvgIrFhPg4PJcUEeWSMtJWF7cvt+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=knisfSwf;
	arc=none smtp.remote-ip=209.85.167.182
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B6F606A329
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:42:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02B6F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=knisfSwf
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4d198f1a591so634857b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780970; x=1793385770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
        b=knisfSwfxDsnp3oHxTmjHdcfSgAs9YwUwr68Enk70VCy4ct3tRGZaa1NiLFgplBG++
         sAw3zrh3JcpNSnBI4n3ZxZkQORfmAPrJ/u86sXN3hqEqFFsM9Y9BQhliayYO4QHiOIEx
         dA7IrpAaCZv27PG2NWrHKIIgEBxOtfgFW2CuXNyOvhfnedpLntVP5d6cndmc6NrVTKtC
         Ru+3v8/8eFvZ6IGNCTq8k3F/vXf3p1Msfyve1JDQg0VKAYYcdTO5/eMTBovrvVkRg9/7
         fsD1CnVzxSXFYh1c/GcnSIz56rOVxAkv6EDcfEEjFxzu94+oY3yyKwlJ4SicNSZMnMsG
         adLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780970; x=1793385770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1IqYW+doNQQMcUHP4l8j+5MQVcguml9gPI+cwHAG8g=;
        b=GNxIRchClfzv2AXy3vjpZroW8eLgrO5l50Ru23H3YgYf2rGaqiRjII3T4Uq9bE8eJK
         0S2fQqPj1JRfnAV026oIoC+C+MLCxRu6jt71nyVrZjVNchjEiyfgNNn7eht19IPKqGVA
         f86mgu11roUwLa28l4l2FAJUkMbFsn5cdBrgE0dtXivlXCAcUWt0PXjJm2wjV4vtnpe4
         QV7UvbC4xavFVnrWam2N3amw1kz84bUsztgY3eODgjmc7fMiBdbxhKCP9lQz5ubcVB22
         RLyQmQR4btgTXUJ2to2A/yjYUIEiVs/mQJTGyTsHLHiUcgSUhvcUueBUlYnDg+iBrwC5
         4Lsg==
X-Forwarded-Encrypted: i=1; AKwUvBxizwJYHb0Tgyo4C2NSeeiiOUPzX2Tdy76T8QdoQ7MGsg1KUqd5/uxJhPUtyI8bK15mxVzc35Q0j1rSUQY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKYDAiFid6SAFSCBr90PDHe3QQJLEMZc/vSixq7tf7GN74RCKO
	bbO3IGsZBzzByG7m24FuBRLsb7gZxxtM4MT1Lsw0aGoL8PYgDOxiBvNu
X-Gm-Gg: AYBFou1i4X1grKqlNXsszM3HzidL5fBte7OiKPh1Bubs+Jv4Mh7B2IqFPS8D0EI5oPZ
	Gol9JEFFZQMYMNMC9md1KC9GY7oSCGeL/rXOLrM5QWeJTKtpFOdPwjQMY0i0uy67WJSDT+cE0m+
	r17UCFyjNiIKqUs04V76p5ZXMNU+Zc02W45kDGxHipNeKyZaCZ0EQOy9tuUBJPJmtOIjZzDGAr/
	6iW61xj+DGg+jiFkSr/v7r5TUwl62t5ngcYXaP0VXIf7Clz3KbE0TSD5vavvUWEc0PIO27ZmN6Y
	cOuuh9OTBNujMrxPqBvAZVNnWak0aTFfkIrIpOQPUbVXAoYanLA1aKrlrUKEKviQ23rHQ/dJmBq
	5xzPtYuFUYV92ug3h/ui6DcwFH07a3/ukkocUrK+VWE2XQxjs+mX/cLyDgUCa+0KS7WermKUZNX
	FgDPp6MxCzcdTjjdyM232aGf//aLceHql8x//uyRt8ynGe2//FrxDd6/EHmAR0SzhtvLMYYi+ew
	gcWA1MC6nfeTWkdAt/VPsNrm+qcy7MuXzkqYHsq831+him3qfAIhZvXpmutwWPFPQQ91xs23/b1
	9xrD5yb4JsNl2Ka9dsfwhZrKL60avSq8TN2lQhE+vH5qj1m7StZRJhkqBBoZOwZf5lN/f7r6NtY
	nsj1F0MI7xD0yIF8G4sSieFLmOG2FYObf5jNZQMWvdj8DufTaOlaxoCTCeN1DhHwlUP9VpSZWDe
	CXqgs=
X-Received: by 2002:a05:6808:4f6b:b0:4f5:eaac:5173 with SMTP id 5614622812f47-55c002c7d48mr52342b6e.57.1792780969992;
        Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55bfe199544sm336682b6e.13.2026.10.23.11.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:42:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 12:42:39 -0600
Subject: [PATCH v2 5/6] dmaengine: sun6i: synchronize callbacks before
 releasing channel resources
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-5-c9e07cc44bf8@gmail.com>
References: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
In-Reply-To: <20261023-submit-sun6i-dma-lifetime-next-v1-v2-0-c9e07cc44bf8@gmail.com>
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

The driver has no device_synchronize callback. dmaengine_terminate_sync()
therefore returns after stopping the channel without waiting for the
virtual-channel tasklet. That tasklet may already have removed completed
descriptors from the shared list and be executing their callbacks. For
example, serial8250_release_dma() frees the RX buffer and unmaps the TX
buffer immediately after terminate_sync(), while those callbacks can
still access them.

Use vchan_dma_synchronize() for device_synchronize. Channel termination
excludes the interrupt handler and allocator before detaching the channel,
so they cannot schedule another completion for that transfer. Also stop
the channel and synchronize when freeing its resources.

Keep terminated cyclic descriptors on desc_terminated until synchronization
finishes. vchan_complete() may retain that descriptor outside vc.lock.
Ordinary active descriptors have not published a callback and can still be
freed by terminate_all(). This avoids accumulating descriptors on each
8250 partial-RX flush, which uses the atomic termination API.

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 157746c9423d..c244ef572492 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -996,12 +996,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc) {
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
-		vchan_terminate_vdesc(vd);
+		/* A cyclic callback may still hold this descriptor outside vc.lock. */
+		if (vchan->cyclic)
+			vchan_terminate_vdesc(vd);
+		else
+			list_add_tail(&vd->node, &head);
 	}
 
 	vchan->cyclic = false;
 	vchan->paused = false;
-	vchan_get_all_descriptors(&vchan->vc, &head);
+	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
+	list_splice_tail_init(&vchan->vc.desc_allocated, &head);
+	list_splice_tail_init(&vchan->vc.desc_submitted, &head);
+	list_splice_tail_init(&vchan->vc.desc_issued, &head);
+	list_splice_tail_init(&vchan->vc.desc_completed, &head);
 
 	if (pchan) {
 		writel(DMA_CHAN_ENABLE_STOP, pchan->base + DMA_CHAN_ENABLE);
@@ -1100,14 +1108,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)
 {
-	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	unsigned long flags;
-
-	spin_lock_irqsave(&sdev->lock, flags);
-	list_del_init(&vchan->node);
-	spin_unlock_irqrestore(&sdev->lock, flags);
 
+	sun6i_dma_terminate_all(chan);
+	vchan_dma_synchronize(chan);
 	vchan_free_chan_resources(&vchan->vc);
 }
 
@@ -1480,6 +1484,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

