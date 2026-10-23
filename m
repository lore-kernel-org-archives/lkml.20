Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792798717;
	b=TTzsFZFdVtyZJ7FVcSsrFb+c6Y0ossbncNGuC3YZEypYVHaErxS0LsBrh5JytA9f2vbX
	 /kS1qnWNI1dsRza1pAefg7rOSw9hBVc4+/qPKM9orBFFlTAeXGy7lyDgjvVfXgPhLjrbS
	 R7Nn/JkcNkFC+m897O5C45hGgW0gxAb5C+SiBjoJitTcRRxyGXzvUFuF6xrIBukiba/KF
	 8AiERZHCfpKWvxcJvEo9Ia3m3JPyNdxzvqbcg5fiG0jyUYOJj4DLVMyrB5mQZzodjtgG4
	 agJLqsChiok2czo9nsQkitTmCdr4X9ERmBZE9+Ie0Ry18osl7R/9mHN2T+oYsnGUPaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792798717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
	b=GQfM7D9IA7Hpd86qZ/inUtzEBIUpHeHMsICAxTh6Kyxr94GC1Dz7XrwL50WQ0XrL6+ZP
	 DiL74JPVeFBBgg0gFSgzytBJNhFPQ/qNwzvOsZ+c0cUSw//okZD9+YG63sXoMu65/OeKC
	 2dp/pRtb0WkAMVzIUUR+YLV/OAScxSjT18Ul4Uf8LMES8Je/ujv1UNvpZwTZyrmcnnPdd
	 +sQLf76/khmOASAoXX7lAkzB65sCkMxOm6HSla7O89lV74h2eXaWSNa8b/9kFkgELPZgp
	 8GZ/7l7QHxj3TIkf/hT6yqE48s3CkWF0npiYd+K8ZRGgpETXvubZJ3MxTfUp0UFFo/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="MQby8fh/";
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1AD606A335
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F1AD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MQby8fh/
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48e9476e26aso563379fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792798716; x=1793403516; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
        b=MQby8fh//diF/BA4o/z2gQ07eeazA+mkmhYUXU+5xY+9MI6k3SDA3YtvItayMDaCUE
         uTdjfVQ2HENu+ogiwlIRtKa747fLdfhcyYOS8rkeMgYxVl+D+AxgJ7BFZvsaUdu9Jimy
         cDz6ZExZcuzurflDXmYwQgq4/8XAp7a9yJ6HphdP+26P7PNDTJIYltFSwh/y9oTfCcQX
         ww/IbBiSZSC9Ig6/ZvaWW+XePAl8tdmOl00NMPEistzfQQWJNqJeAEiMNAjhkPWVxCg4
         FD3fn4A7AuFd7HUOnZMyIAVSlYtExbMkWVv5/MGA2aD/j1VJ9nuoc6ahcJzf267Yhv1l
         5F0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792798716; x=1793403516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfW4t08Q03X/zUbnd8o9mtH6qAgwrZpASG2xurECUh0=;
        b=WLcXDIu6fQg9iExMK02f1vKzuvZwrjrofCeYcssj16nq6/3IN9CClyl3e7RF7LKrwj
         iuHJlX40pwbn/dHDgwF/emTTnHDWOuUnJgrEhJSKQVerfq1ix4n5eJ+S9nKIM+dKxjx1
         bWvQBiAP1yhUveyL/3macGQoNLiEptOyan9NNIcwsMPF8WnJNv6EwIDEymFmnNaU9AS1
         4BYrSzfc9yWd6meKTosvcKDROjFqLdcS7nVl0ocbpDjzYdOksrtazQGavBfDTeT6g7Zv
         rVLjahyRHpFSu2KVnWss1SlPf+MAM7wltKut1qvhWTjEOzt/45CI/En3sGE7ttnI1C3l
         r+6g==
X-Forwarded-Encrypted: i=1; AKwUvBzH7PGJyWY12QiUZbe8UTyQl00AVz0DK5irGNDM7jh6E5eolweT6FlfpQfOFfFDggQQYtSVItWeKb6zp50=@vger.kernel.org
X-Gm-Message-State: AFq9FYJq6j74vFOIC10go6KvPPvKz115Tj/Kf3mRyIJgZz/93tOrz5CA
	NnSYdLk+N/DamGfN+6ymNYFdYvOnV3iNWxMv7GDm5WD/XXaN5KM+Suvb
X-Gm-Gg: AYBFou2hTnUry8sLsFeSmD7wNbw5vmTzaQp1muGFwdv4LmJdYT5AsrboAvmjkvwGxjs
	4Khjxj0HNBLPjL7zUp8g2rN2aoHFg5nuYbxP/yOUa8TJMoQcqfQoBvwXvPvuMNoOIVs5YmuXBFm
	9wCY2uQiM0XzAMhyHLu7f/SPPlfSWj0QHzf7R3M4CHt4IxKIbpVtZ0Nq3piLAFU6RnRhaaG95eh
	KVdtwdhnqArwANYmJjhUv2ccgyq/fESmC3Tc1ZQnhWd49OtHmdk9gUvVvH0EbzldB+t0Y2SfHaS
	49ONHhjPpARJwE6Ol38a+xNQLD2NOsvr8wtaE2rQZ912tHcrEzix5/ltyz6fxHsy/3JXDBypBQE
	WEDqgyPSGinsElN5hcAFTJCTKUPM+4aNGswRJpA1ujqPkS63PZO1WMgr/Rv3CeCZmAF+y2mwOdx
	AtvsQfIFO2yZD5997yTlSqhbLp1iNLPvXA+FLy1nmX72KsHO342ngEGsTXotle4AOVc5ySPC0TL
	G2OLD/+IrMysjfhVFvhPQXGwCN1e1QTSTVgp2L57ggYpQLH6oiW7wggi3VgmgmLCukOIdAn97WK
	Pjw63rztMwjkMyW9dEfuroVTEsBsBq1tf2KNqHRNuP6xIoXEAo1h2E2XejUjsuu+LyGwHxUr9kR
	LiFO5BfEQmETchug/KQPBJYO3g0lIqGopJjWg7UHObd7LSsSPPRPLV68QIIwKtgfK5eFx51yxLs
	bL4k4q
X-Received: by 2002:a05:6871:878b:b0:4a7:443a:e6cd with SMTP id 586e51a60fabf-4a83f1d782amr611734fac.6.1792798716050;
        Fri, 23 Oct 2026 16:38:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843225d69sm284345fac.15.2026.10.23.16.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 16:38:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 17:38:22 -0600
Subject: [PATCH v3 3/9] dmaengine: sun6i: take the device lock before the
 virtual channel lock
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
Message-Id: <20261023-submit-sun6i-dma-lifetime-next-v1-v3-3-ef1acb0be768@gmail.com>
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

The pending queue is protected by sdev->lock, while virt-dma uses vc.lock
for descriptor lists and cookies. issue_pending() and resume() currently
take the device lock inside the virtual-channel lock when queueing work.

Take sdev->lock first in both paths, and inspect the physical-channel
assignment after acquiring the locks. This establishes the nesting order
needed to keep allocation and descriptor startup in one critical section.
virt-dma preparation, submission and callback processing continue to use
vc.lock independently.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 3a6525dd3d32..435d7daa1c0f 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -952,23 +952,24 @@ static int sun6i_dma_resume(struct dma_chan *chan)
 {
 	struct sun6i_dma_dev *sdev = to_sun6i_dma_dev(chan->device);
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
-	struct sun6i_pchan *pchan = vchan->phy;
+	struct sun6i_pchan *pchan;
 	unsigned long flags;
 
 	dev_dbg(dmaengine_chan_dev(chan), "vchan %p: resume\n", &vchan->vc);
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
+	pchan = vchan->phy;
 
 	if (pchan) {
 		writel(DMA_CHAN_PAUSE_RESUME,
 		       pchan->base + DMA_CHAN_PAUSE);
 	} else if (!list_empty(&vchan->vc.desc_issued)) {
-		spin_lock(&sdev->lock);
 		list_add_tail(&vchan->node, &sdev->pending);
-		spin_unlock(&sdev->lock);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 
 	return 0;
 }
@@ -1057,25 +1058,23 @@ static void sun6i_dma_issue_pending(struct dma_chan *chan)
 	struct sun6i_vchan *vchan = to_sun6i_vchan(chan);
 	unsigned long flags;
 
-	spin_lock_irqsave(&vchan->vc.lock, flags);
+	spin_lock_irqsave(&sdev->lock, flags);
+	spin_lock(&vchan->vc.lock);
 
 	if (vchan_issue_pending(&vchan->vc)) {
-		spin_lock(&sdev->lock);
-
 		if (!vchan->phy && list_empty(&vchan->node)) {
 			list_add_tail(&vchan->node, &sdev->pending);
 			tasklet_schedule(&sdev->task);
 			dev_dbg(dmaengine_chan_dev(chan), "vchan %p: issued\n",
 				&vchan->vc);
 		}
-
-		spin_unlock(&sdev->lock);
 	} else {
 		dev_dbg(dmaengine_chan_dev(chan), "vchan %p: nothing to issue\n",
 			&vchan->vc);
 	}
 
-	spin_unlock_irqrestore(&vchan->vc.lock, flags);
+	spin_unlock(&vchan->vc.lock);
+	spin_unlock_irqrestore(&sdev->lock, flags);
 }
 
 static void sun6i_dma_free_chan_resources(struct dma_chan *chan)

-- 
2.53.0

