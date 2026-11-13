Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580164;
	b=ybaDaDeEfve2641v8tC/8MmkZAqSuEZo/kOKG6Ql28Ne4sGmQehlyMeUIV57BP7h3RIe
	 s00NOi4kfFzdx//2RKo0XJKea0F4Jw3QRDGRYYzM0M8gKhPjKTccQjmJsSzfOJ6YVSyMw
	 3BEekxSBWwFxCIuz4QrfqpTpiwuqmEdQq/rQTaNDrz6THvOI3Lqg4ECoC4luRJNepvj6a
	 5ynFLMH3/v67a/ecsnRiyfmqFo0+rJbzx2FbiJRZx3Hht4F9VXwVk8N1oepsDIxduk1yg
	 VsF8EEmzvxLZPWIJUCOTtR7EzDmWcwdGvaO+tC8Evbo21YSSkhZfvJAzIcnUJUEIypg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580164;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=I+VroZ2GYNA2jcrSiuQoC4x3Pm5mFGOG4aOL1GzjSEM=;
	b=A8kLY4C2TeIdrXC88HcPswlLFwjARHimYE1TwI0hu15KRw7iT3gWfhLMvDv907fJVNAP
	 Nu44llSaRgGWJdhcMNkgg+RIeZhEpZwQ1pJNkhLUIGkB5Oqg46zEBz+hn+XNWf20X+NyJ
	 7x9F+ZBw+gyBvK5eaGOS95rjhgOHbhQgQWdTV9Z1kNMW2Ef3dLYeo6GVO9syRT6O7+JcL
	 0C7vSYUzMGpNeQotrYa29CocplzhZxzAz/DJuGWj7CgWeg+SofdjF5WA2nRXxfsacXhZg
	 szZmYREJKUFdG8lqUbNdQUrUBboD59wT2bLP1on/BAkL0GkD1w8+4h3cQywnbAeov2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=biTSeqiQ;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B04606A8A8
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B04606A8A8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=biTSeqiQ
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a17741243eso5286865e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794580163; x=1795184963; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I+VroZ2GYNA2jcrSiuQoC4x3Pm5mFGOG4aOL1GzjSEM=;
        b=biTSeqiQbBJ9B1EnH0cCc9/h/4WnkrIYihcjZY/l7DQKyamyrhfrlZwlRRN0JLKVI5
         CvRW0KxYbsiyo/eFsF3HQSO8WLeZs46qCCVkRQb06tzy+WPiBEiEu5z3pclkziw24EZu
         lunh0szUsqLMwAVK4ZOW+O+3ANDu65bR3JtR8s9yn4aVfw2jTWajbYlKZxgfc/+fztwk
         +7ss1wYwDbb0r5rU5XU3t3lo2DoSM+hu51C1cw/iKHMQo+uaWcLHdLMi9SPyxjE9FRDE
         IR9QpS6OHUkFw2Y9AIdcV519cbfv+h1eMv5zZzdE38PsK8+DqmHQrebkv2qAU+VfXbEX
         TD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580163; x=1795184963;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+VroZ2GYNA2jcrSiuQoC4x3Pm5mFGOG4aOL1GzjSEM=;
        b=fD5dStED8Yux2hu/Y9JK1DjTmd1OXOzqdTprDBWjYCLQb6LCjylisXsBZ7grPpx8w9
         WPswg0iB4kCHaOtXtPb5KyXNl+ZdKzJKLgzlclxs59ThxfLLu6lp0qLoFmSTVkcnjl7A
         ats7kh+1Q7XeduvIxzsHI4sCGqaWadKGDENHIqBoFsMIWMzeZ7B80f2ANRHEZEOeOvA7
         iF6FLp7r9jnAhGIXNxWNeFGxrheRaHO5viyqOcpPmKSZdMyXpTXZYrd0nKeyJ+4OKB+a
         oao3E2vf8jeG5PfjqemdV583xLcAdgAYvIWAiLANQJvjwnM47A0jaDjcDoklBntThkvZ
         puVA==
X-Gm-Message-State: APuU4Z/7dz/Htch/AjAhwH3DbR41LtlsygarBo2kn+4FkMmZZo7OTifn
	3D/yOUMPhSk3G/g3GmK8+dVybxM/2DC/eQqSzfxEw27Hsvq5l7LscqnjjlMDoy4+J1ragY618sf
	GOycMLKpvX+goqpX3J/MlxySR7JmSygh8qrVEXCMV70ZzTWBDF4pQRTmYfBNwJmnQIEgOCjBt88
	cmZ31bO+F9d6hVPF1WNgKfgFr3ifoyDCgodMMd14RHCpW9nSJ/fkWSrU8=
X-Received: from wmbgx4.prod.google.com ([2002:a05:600c:8584:b0:4a1:cf4b:72c2])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f96:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4bb55a4f43fmr57729485e9.16.1794580162603;
 Fri, 13 Nov 2026 06:29:22 -0800 (PST)
Date: Fri, 13 Nov 2026 14:29:10 +0000
In-Reply-To: <20261113142910.3477757-1-smostafa@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113142910.3477757-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113142910.3477757-3-smostafa@google.com>
Subject: [PATCH v3 2/2] dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>, 
	Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Unbinding the crypto BAM through sysfs on X1P42100 resets the board.
bam_dma_remove() clears BAM_IRQ_SRCS_MSK_EE unconditionally. For a BAM
that is controlled or powered remotely the register may not be
accessible: the clock and power of the block belong to the remote side
or to the consumer of the BAM, which is why bam_init() already avoids
every register access for such a BAM when the DT provides num-channels
and qcom,num-ees.

The write is also unnecessary. On a remotely controlled BAM the driver
only ever sets per channel bits in the EE mask, in bam_chan_init_hw(),
and bam_free_chan() clears them again. Both run on behalf of a
consumer, which keeps the block clocked while they do.

Skip the write for both kinds of remotely managed BAM, using the same
condition as bam_init().

Fixes: 5172c9eb89d4 ("dmaengine: qcom: bam_dma: add controlled-remotely dt property")
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8a1f4e5d24d1..e01f0fec1599 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1407,8 +1407,15 @@ static void bam_dma_remove(struct platform_device *pdev)
 	dma_async_device_unregister(&bdev->common);
 
 	pm_runtime_get_sync(&pdev->dev);
-	/* mask all interrupts for this execution environment */
-	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
+
+	/*
+	 * Mask all interrupts for this execution environment. A remotely
+	 * controlled or powered BAM is left alone: it may be unclocked, and
+	 * the only bits this driver sets in its mask are the per channel
+	 * ones that bam_free_chan() cleared.
+	 */
+	if (!bdev->controlled_remotely && !bdev->powered_remotely)
+		writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
 	free_irq(bdev->irq, bdev);
 
-- 
2.56.0.611.g1030f0b940-goog

