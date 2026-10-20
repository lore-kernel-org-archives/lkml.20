Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792520355;
	b=teTpSMrN8VHkb25JexgIKZTVysrbkSfnhi2ZIweaRbBhMYiGlx5ps2VQa/7lg9hOYt9F
	 2QVrms4uZtpXd0KTEILrcMCAPxL+z99+FhSppZ0R8oGEi5LwdT2RFDMEAcgEq0Vu2eJZB
	 diCXvlJeuYnSIRC3VyxS+vtEiabS8LlLkwE1Wt6LoOaza+lmGOnRwdfzf1EEl8JuLkM97
	 jugHpm9S7t7OBTxGk+cJdw7oFJyjKWEk30Op0BBSEKcPOcChQNejWKQ7WZSIgkQxLpXOT
	 CCq5jDj/O3fZL42/Ba9FXTZjnfTI8G2vkVqEQLVy8KEePzagbSgWSRfC9wLYr+Fvnyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792520355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=8ImmY1A1gNWSeQw3sHZE62qy/18d4XJL1KnxNgP6u2k=;
	b=CQc9KnXixT83gumbZa4h2oRSJCgwHr+3SDeiUMo5LRnpH6Td0ivNhry5uQWCXda4hmn4
	 6PTUGuHbDoYtO8cji9lxQoeGDMKl98skeyvenXgzotU4h405ovf6mwZ3vi40k76G7fuXf
	 cOoczMsizWpEycEKG+LP+fcnz0s459w7heITVNl0vDmrnyuD0DQgLA4IzO9GswvM72cYQ
	 Nl7uRcV1qo0UcDQC5BhxmdnqLT9VIqfPTPyXWkVJ4qGT03az46L89wD2JhnmuFm6kLNEz
	 Nw62z1lPIc/Po6+ySWQ+rzFDOE2Xhl6y2NHkwrlwOUmFkAIe6ZuPbENMShPMRDzlu4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="Jl/ktade";
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC80360A2620
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC80360A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Jl/ktade
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a0228f4a1bso20775875e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792520352; x=1793125152; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ImmY1A1gNWSeQw3sHZE62qy/18d4XJL1KnxNgP6u2k=;
        b=Jl/ktadec/H3O9gByQZ1sspJMj09kc09nFjExTNa/XMy0Wtn56UC2pHBeov8wUdBbr
         /3AFhZSPyEquwX3TC49ypzEDjRkfQ6T1gBDXfwFk3aKSFNFhOSk8qL4TQugDRY7xpRgX
         h2VULTIHp/qFM7/u/F0Bk2p4PCngsuaZAqjMua44bwWJakYkx8JJ8TWQywl45PD3sifB
         9F6ouwV+saw+lwb0lf+slIdddT2QGnqG8sYg54YzJsmURaDZqB1BvQvt4yi4TW3KkKjy
         0POaLQinsg2rC1R9AOZ7DkgYbV2Np5zcuQk/cj84AQA2i67IFK7yXS4d2/ymj112Y3Pv
         1KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792520352; x=1793125152;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ImmY1A1gNWSeQw3sHZE62qy/18d4XJL1KnxNgP6u2k=;
        b=MJ4PHdluG/75oPRmcyeIKbchQR0TmjNVGBaXsC7pcbIvf4hWiYOuwVmKEi8aKfYjnl
         JOmABHqcScvwxITtmfuE8QtMdmxbBGW7PMvsO4uqg3GpbXq6gSlmMTW4YpLR1yUHYgoQ
         uSut9Yd4no0NYLvv8RNrHZ2bsWuF7gLPut9sz7M4a+UDFfeXCsoXFvyhFffk3oyExzQt
         QV+lmtWzbQi4VC+apYJV5rfevgLpkuSmsaK9UyHNg8YuO7ZDC2EgL56JXMXrKyWq4kuT
         oevfFtwX0d4EcD9ZAby2ETdNwYicOEfFxr0Ttbb3MtBthm38KIqX85fYUjM0xuWKLKsj
         s3Rw==
X-Gm-Message-State: AFq9FYLtMJMkqUudleTWOclhLVUtIHMRuRcjwq1rQQvMxBofcPwN2IRE
	WdHn4Viz7JVR8b3u5b+L1u2+1AcXt2wF/GiRQAcuUYF34b/JZqvBkozstZW+Gv94Tj/mWQA3DnE
	pT3yk0F1IeoW9c9to67R4Reze5vrJdwaOVVuqE1CvOcS0TDvU63uLe+2GvwaxzZTNI42KIvs3p0
	0tIHyCVgdWf5cUxjF1HgiljPax3P+IF54xdhuGMHOfhIR81CcBxANolII=
X-Received: from wmc24.prod.google.com ([2002:a05:600c:6018:b0:4a1:e348:29f1])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820e:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a1d761637amr244812425e9.28.1792520352280;
 Tue, 20 Oct 2026 11:19:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:08:03 +0000
In-Reply-To: <20261020180804.140766-1-smostafa@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020180804.140766-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020180804.140766-3-smostafa@google.com>
Subject: [PATCH 2/2] dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, pramod.gurav@linaro.org, 
	andy.gross@linaro.org, Mostafa Saleh <smostafa@google.com>
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
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/dma/qcom/bam_dma.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index bd583f78e0c1..d818fa1dba57 100644
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
2.56.0.212.g129ede20d9-goog

