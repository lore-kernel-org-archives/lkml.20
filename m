Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725306;
	b=cxbKQkKhnjEjVBWkvv6uJ41leIgWuOfJxGFrXHEd7sPG5/jmquUSDLnhcdKHgUsuZBut
	 oYtmLdRtf9gbOExJd85zVU26EQl5H3J5pFiFGZswiGSIOV0rUzmIIf6oKIUId275za9gf
	 eHTiqLc5eJx9uQoDGmFLPgIlVAl23w0FXsO1XscvCzWbP+DLmynC6G4ij4C4pZy8qx+kB
	 ASTnFWuW0WGmpZxrANTo4Hg1e5KHJzx7Ijk3rmVVQ6Qsw6OQpyh2M1NHm0NiV02lROYyd
	 EViDbavXkBbGTHsYI3oWQouDZH7C5xP4xDsVahNkZHCUP+8fg+3IgZOGzAz+EjII6Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725306;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
	b=qA1q0T7CI5k9CcTWF1Jdjv6iiflFHjgdOGRud9Ou/Rsp4WO8SRvU/aRcVP1w5lT1A7AB
	 jZpgpLSDKD4vsQMiLwTV1/pkdPSqlPxn0ENOlN1iw/xKzQD/7hiWkzhRvBXa+6kJ+DjnD
	 a2nCM1wbqi5RGOS1q4crvp8zv5SWMijq2glFroquDA4FcDT42wr5OwqoDxmWjFnFgd3wb
	 l2qrwuS2/WIRMgvGxKw6UxOYtvp0Y4jcrNmcjCG37P22yCysEHI5ENdfW9zwutyyxkRyQ
	 GdqPEGcA0xpU9wmdTqoOdPK9J8Q1JwzMLhfzAjg3KK/ldKRr2sFnFvm4hpyy1mLlCDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DCh3Kx8k;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E19606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30E19606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DCh3Kx8k
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-846566246e8so313283a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725305; x=1793330105; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
        b=DCh3Kx8kAXP9w0efAz0DaTGb5BLYPczn6E58xUYEA2vQi55c6eQJw+AJrIKAyDn9wx
         bmipdJp0p3yLCsDzJT6aTfvl6Qa/uFp09zu8CSBziXPKWPcpHGqqxrYOc6ULZ4MoPAdM
         2IiBiemqBCezqQY0rBGM5zDtDLBUG37XPzq9BQfFU9YveAxs+w7k2GsOg/Abk236TBrG
         elUROuwdK/eqfOtpEdqdsvtid+GVYYlS8z752pML24PokKJeePGJCYoS++dhK48tXDO4
         yYi9EuSlR+MRub2k+7ccjUPw3nA7j7U1EPxeJ5WF6zIUw9v6gsU79vLs1O2bQbwl4viR
         P0/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725305; x=1793330105;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx8akCh1b2SJodc1FWp75y3A6YsSjEhFlzNdHqoUtLI=;
        b=xytRHpyCAGE0J/tulMUuEtDkUGYATI3oSgiB7WbGvTZSBCWTMsmw5NsMAzjqUVQjIk
         T+yZaPllLzh3ltEsV2eR1Dnh23GHmj7EYBcLpHi/JNt+QBdgrm2hUXjF1n+jrGuxgGNl
         QxHxfAu6vE+fFlkb7wt4Bq4CFqxioZgGdOnL40vDUc7e1Aa17+aqifYbJcSM0KKd0wwp
         svdMxRHOwb55pdccy45h5+Ydb6z2u+Vp50cUcSrovBErcFvQaqfthsjKP6X848sydtmx
         CTLtViQB2NK4cTVci41Zd7HGGHkn//G2FGZVqJzuS6C9sFm+UjloqFQdNo38g+0QPPPn
         T2XQ==
X-Forwarded-Encrypted: i=1; AKwUvByNFlys0hhaVgQnAXr4yfVuwRfs7LgGc1TUbdZk64jF5WgqJuYB47X9hqn+bNr8x9+k2y4qScyGH8heiAc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrMHJe0+goALRjqMzyy9u3GYirx1HMVscwNF2Y16kKkzPZcRpK
	IK0dgAYwuLvURbL5JkdeD+BILYKvN7RnTjXQ3F5yIzcU+VxsDbMQGWsg
X-Gm-Gg: AYBFou3q3ga/tKJXPhBJLFzIm+jVs9aU6eb7iZoL6EEvy1auhwlkqgy2wfLxi0COaKF
	gn0ukTDx0GeyRbpuaUaVgmQlVEDt6XObs/21DSrb5Dv5DFasoacN7p7dTTK2UmfIanOoRObTHDa
	WSnwrxK8ikHbY07O6sbji1mOPd59b33wDh6GizicU4TYI+NCFxBuy8ubXemC9ame89exMLBsoCI
	d8MS7oO14RymYezQ5k60YUFiFyo+guuHrcTFxt/UTgIwofBqx+QsqFQVbz28fpwZOCEnq7OrMpR
	VL9B8TLcsN9T56ruN9td5bhoVs1ne24NLqgPED1Oti6b0CtF0Jt4+Ojn/6iYXGgit9We049gG0/
	COrMkXQuw3zz+QQH5JUoG1UZOwJWxMO3cpaksJJPNLBVBYAy9D0JZB9DTnTD+Qr5jjFeJcoAd6I
	pyuL8hC+5XEzK8lZeuzo9pDNR2SxY0Fgr4lIYm/B4xo8rTM7R73u9ELf/mn37zvjoeGTF/haM2W
	C2BTv1pfQBcFTD0uJoTLU7c/0q0fCwlOZFpB0HOpsnCcpwKeHddQHSCY6sqQGaGKLb+q4lMNvhf
	NMC+iBUz6CYMXhdl4qT3oMraVjTxXLoLqdIoPhSMelyz5W4zVoYKWARWMPX2O9Ye/CS5zxiIFkp
	f6+HM/yVFGh/WOTuTxbIQcHwwS0thYYnZgBY8aDoxifzkwC9CH7OtNtlaCf/4YnDq8PCA3T6Szx
	C29Uk=
X-Received: by 2002:a05:6830:a185:10b0:839:c62a:1661 with SMTP id 46e09a7af769-84e32d0adcdmr1665921a34.7.1792725305092;
        Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:56 -0600
Subject: [PATCH 5/6] dmaengine: sun6i: synchronize callbacks before
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-5-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
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
index 7ac6693a041e..f807d9386939 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -994,12 +994,20 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 	if (pchan && pchan->desc && pchan->desc != pchan->done) {
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
@@ -1099,14 +1107,10 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 
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
 
@@ -1479,6 +1483,7 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	sdc->slave.device_pause			= sun6i_dma_pause;
 	sdc->slave.device_resume		= sun6i_dma_resume;
 	sdc->slave.device_terminate_all		= sun6i_dma_terminate_all;
+	sdc->slave.device_synchronize		= vchan_dma_synchronize;
 	sdc->slave.src_addr_widths		= sdc->cfg->src_addr_widths;
 	sdc->slave.dst_addr_widths		= sdc->cfg->dst_addr_widths;
 	sdc->slave.directions			= BIT(DMA_DEV_TO_MEM) |

-- 
2.53.0

