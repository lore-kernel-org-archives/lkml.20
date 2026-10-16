Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB90450917
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144663; cv=none; b=M+A3iPWpttIcnF799dzJQynawV64LpeIZRMi3rkSpv5nh35aJT1noneoSkJpdOYp8MWX0U15LeLBFh7jqU7IZhHsRTP88Sfr4M3P52M5Nf3Z9sKtQx/737WsFtwQ8isKF9LR13ADKUZolk63JZNhWlIaLnfNOryV2rFPJRTPcs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144663; c=relaxed/simple;
	bh=+BflU2elRp/oOOYEKmuuC9afcLHCdlAbti/foe89B7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y21CCqfEwETJm1mlhD5u4vtQ6xqT78WF9bAnfkn9qcCpAPF6EQ2KBbUOqQD+PAJsNR3TW9jwpbtA8QxYJqPaztkpWNJGRPyo3Zgi7nGT6x0BxAxX1qFSFewAU41zKogKKyLTALVoL8wTsskkmj1rsZyeI3T4bk3uXM8aQ3wExCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UE4aUDQm; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UE4aUDQm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso4027675e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792144659; x=1792749459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DiJVS7Kj+4kCtaotoRvvsXd8ocn4YftmsuQb/0Cmybk=;
        b=UE4aUDQmsvk9jIXoSuIlSdMWRsCCxYfprVH6HwykuX434TusKQ7hNgBElJc8nNqk36
         xUxEH1IGglpkxYB8AXV0GG9kllnyy9XC6tURn+QgJV89FFP73Gm8dC3K+k9nL0rDkXa5
         bYmy1GWtI+8kNjRWfxMGMoHsmOjdaLTt1H1ErVlhRO/kOdALDIY4VgepDWcAwWW85MuW
         IHKON4bd2YQun5UIEKFPqHVetm0Eyox5L+fMUGwV3LRqablJ1jQ8CSOHdGwUWkssJC2v
         0mpoRocrX+7a6++2ptGWbFMR/xl5Xgc+Yz9V5nMpc3NGBMHijuDtaPTKQMUrNMPPO16h
         hfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144659; x=1792749459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DiJVS7Kj+4kCtaotoRvvsXd8ocn4YftmsuQb/0Cmybk=;
        b=0Y9/O6POR33BGDDhkWJjXAG5HnZyDBqKtEUuJxS+KsPuAtVrfb9sqsQEIg0XpYL2pH
         PldNLfMEVqbHfgrWj9PdYHP+gH2Ndi20LVuoIRalBvxNkP7Rq2SzHG8nP7nMn1aNW/Q1
         J2zkj9dbXVgEjEljQGSTI9uP3DHQK20i56aSs74qTTHL0zTKXETq3VSpZf+54hESe5IC
         LlLiWITL1kWYJhaNAxnEYCHMUzvk8hFHW7ZuTekhvFGYojIQFX4/yYOcf7jm2sO+myTe
         ALibmrPDfp7NLg8G5C3UR1oGZGzN8ypFVmTQT4VO/p2ADctjVkwc+S1BDIWZ/l4MDDa7
         r9Cg==
X-Forwarded-Encrypted: i=1; AKwUvBxX8pCG5oq/OlebEgQH/CxhwHygSVtWN+g6LHw9mKl++d3aW/WGtCctNBBml2bk2aZn94VcqHOA+vb4SPQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIo809+f6l2rNNmG7iLtZMn4WPcCZNXBDnBLv83z5/fGiXdSFxG
	r5Nrm/dqDp+IjTNY3Tn5+qNjpxkbP/zPS3QnF4IPMzoJRkbFDu3XgFAZVZG0VF410J8=
X-Gm-Gg: AYBFou3IO22Rsfvlp0ha1ZzKTHpyV579mRP8V6VlbsdMK3o6mh/qJgvs/qlu8Sa/qFY
	RuUjaTpH6NELht46L9s71Yn67u8hUb7xcMnslbE0tTbDGS56+lJ7qyI34wkJ+O+pNQJYLEBHVXw
	x7JtDnvJDtJj5ju6t74I4cUEVjpeQx8lvpnJ2DBvDAaCYfeXFyFjKFEhTPDja4/0nMlHC9bwRn1
	sfcLf7G9ZU9dlpuQPd63v2fke3LjEP7JUt9NfGcRd4E/wtzGVWvJaj3XFeiON/u37iyNfOi8Kti
	yVM1FOxRboyo3yAGNb/kx2kSRO7JFdNLCMcotNSXuv3Q7yxzoK+mqfXjh1KuPuHmypAd0pJTPAD
	j4+Ud7JrVoadehyn4qqtDS040+SLLVb/IJ09gNKStglykRih1KD1zAV9ZN9JYLqk7zAYGqbfD5j
	Psy/u6Y1+rIpR9qkrUn8g9EBxcZALipLL04qduZY8D+8HglyHUPANDTR1ZNDRQcis8Jss=
X-Received: by 2002:a05:600c:a4b:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4a1af68d397mr229417145e9.2.1792144659190;
        Fri, 16 Oct 2026 02:57:39 -0700 (PDT)
Received: from localhost ([2001:4090:a244:81d0:2c16:1c4d:8a04:e0bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm149819965e9.9.2026.10.16.02.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:57:38 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Fri, 16 Oct 2026 11:57:13 +0200
Subject: [PATCH v2 2/2] can: tcan4x5x: Add suspend error handling
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-v7-3-topic-mcan-suspend-fix-fix-v2-2-7efa2b172cce@baylibre.com>
References: <20261016-v7-3-topic-mcan-suspend-fix-fix-v2-0-7efa2b172cce@baylibre.com>
In-Reply-To: <20261016-v7-3-topic-mcan-suspend-fix-fix-v2-0-7efa2b172cce@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>, Sean Nyekjaer <sean@geanix.com>, 
 =?utf-8?q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: Kendall Willis <k-willis@ti.com>, linux-can@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265; i=msp@baylibre.com;
 h=from:subject:message-id; bh=+BflU2elRp/oOOYEKmuuC9afcLHCdlAbti/foe89B7E=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqyLXzk4oj5s2TF7h25KyL0daVGnWhaIdJ81/vBuf6yeR
 hBLtdy5jlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZgIXyjD//x7FjHLtyxbrP9k
 t56BdJjv/fbdHXO2MC8rP2D2s0Jw1TdGhl3faw75fZYTrIpn3P6ky0y2Jz3on/vVy023RVplvv7
 4zg0A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

m_can_class_suspend() may return errors. On error we should first
restore the previous state and then pass the error code on. Otherwise we
keep the device in a misconfigured state for the running state.

Fixes: b6b640c04446 ("can: tcan4x5x: support resuming from rx interrupt signal")
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/net/can/m_can/tcan4x5x-core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/m_can/tcan4x5x-core.c b/drivers/net/can/m_can/tcan4x5x-core.c
index a5b8829aa519..b69312413d62 100644
--- a/drivers/net/can/m_can/tcan4x5x-core.c
+++ b/drivers/net/can/m_can/tcan4x5x-core.c
@@ -575,11 +575,20 @@ static int __maybe_unused tcan4x5x_suspend(struct device *dev)
 {
 	struct m_can_classdev *cdev = dev_get_drvdata(dev);
 	struct spi_device *spi = to_spi_device(dev);
+	int ret;
 
 	if (cdev->pm_wake_source)
 		enable_irq_wake(spi->irq);
 
-	return m_can_class_suspend(dev);
+	ret = m_can_class_suspend(dev);
+	if (ret)
+		goto err_disable_irq;
+	return 0;
+
+err_disable_irq:
+	if (cdev->pm_wake_source)
+		disable_irq_wake(spi->irq);
+	return ret;
 }
 
 static int __maybe_unused tcan4x5x_resume(struct device *dev)

-- 
2.55.0

