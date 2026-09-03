Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823B343305A
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788455859; cv=none; b=OW0nv+GFMAHegXudxZ2BpzI65FN0ZagTq2v6lN7+54oz9zek7QEZjXdK+c7zEjmJvCL8jh0GOWTz53KToinrtjVddgSWcJH9j82o/+4bCTmH+JPq/X/m8UIm0tJvly5y1t5c8kQ6BlrcI5ZA3y6uYhd3YjXz/EihK+wIQT+tq44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788455859; c=relaxed/simple;
	bh=s13LO4jmhqa32TTsrgNB+snIxVM0c2Gb5dUrD5UQwEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ojnek6+CMrXIkmoWvs+hOi1A39ixArCV5soNnQc3ZFi2utA5w2i7t4JWDL0PV7YASbewBD5THw4nY2SRZ2HWkAbrzZU7jnj1CBRwAKGvX6I9CxT+urARkWLulhHkGGeackVOygovFEERwk2byi06FzoFfwkdRkCamUGA8LB/lnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7wq80Rf; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7wq80Rf"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8518b3ff3e9so21128b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788455858; x=1789060658; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4OW8N4LOmIMt30hc5K4M99zY33Wer7M4hf+pik4VRUs=;
        b=s7wq80RfVgg7w87WJwTLXfheHdV+X9bvoQpCN+sLH6lc6d70vKi8TwujfdX/xgqfen
         gAmnO98HGKpRCa0a1JQxNcLCofLnkMwtpKiSjB3SAcVY1l4fuqkYej1+Nwh7uu/YDtE/
         w1fvkMoxtgU5Wxpt76jQaTjwnR6GRH9Nn5MAY1nXHx/0olEz/0mqDrpGRy7APp1gqM2D
         wNdkAHqKncqMqK0q6oVJY71eUK4WjnGm6WZUlxDvb22rWY2MAkyHSQwGysWpS8XTu8lB
         kmh+qOMk6fqBy9TE/mJp7ZQa5xikWCzyGnSBhBSjRMoQceho3U9T8IGrNtxUM/F1qduu
         ZpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788455858; x=1789060658;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4OW8N4LOmIMt30hc5K4M99zY33Wer7M4hf+pik4VRUs=;
        b=gTZKnstOAq0n1g8XAfN5aRWYwhXxt4Z+feFYIZToE7FEE/ofjIa7NN1PQMeT0xMO7s
         4NL377RgxXn6vhjPhNKmJQXkcTXXPvCL2Zvi3aPTT+gocjiPQHMqapPhyd16RvDnxgKo
         pH26khYL2D1fJRcHBdldywDans1y2m/YOhy5HEiFy5A9CnePgZjQyqky+cCxnl/RcncH
         o6PcK0Wh7bgtN1rbizt1QscEB/yzmfJgIgBzoomUdaSsXNiU7EGa8Wc+l9xmiQ1XN5Gt
         7fMLGPAAuIkKOr/x+Xwm8/eWsJBAwvNSZ4gnOgd3s/TNGtXXIbykIs8yKUpBXqs25Qgj
         fZyg==
X-Forwarded-Encrypted: i=1; AKwUvBwZvvPgPfNLusRhExy54B/5OMLKfS/uhmjoBrzA5pDQHRCt0ECay+tcTj5dqRLRmDwd/rrZr1tiEM3uq9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kofRshIpP+vRXbExLg/UxosIgcnTVVKurA8c0ouO8Q7YnzKryt
	BrYWRcWARBliEJoqyhgZp6nCjS1E1ftaVOs7s/R4+qHNH2MgbX1P2o8n
X-Gm-Gg: AYBFou2OJwmb9S2gS/oJi6maxFU2XFbQoip0Oqb4hn91z1iuPntVaWq/N4z0EuBfRCt
	o95ahBUexdyoKhBALeguqtFmaP6ACB9t3S+Z7Ym48OJ+p1tZ3Ts5m0nZcLPXEFrf+42UPenRs0N
	4pIf/9Sy/zOIb0vCZi7PMIrfawi0KpYd/3apsi5dDzpkGzMpoArVSF7EqjD+wyEELecwCXzLIm/
	EC3lx/RrGwWT7Mw/HRUOXQ+kM94s77g3irfPaSxf07qOSK2rQ1LrPkIr8qWTwdeT64feQrMegj8
	XpDQE9EUgnFv3ZKWLnRfqAqbnxOIXSGKg2cisGlTuwNu4PsEhS+QIkPnHEbBRCbJG3tOSMQ6PDX
	NJLR1r7FNZhyRxcNJvVKGuh3/Cbb8TfX/jDjHVT3d9uxKP3uzt/yT7YtbN7hnUkaqqgfQUSbuza
	dKSKHMxReyiq/Kz0Z+/lzHI9sDkuKSsQp6dzRJ+i50YW40KLJKoVFf9A3+WRhShldDz5AhkcWxN
	BJbwDZiU51zhc4xvZI=
X-Received: by 2002:a05:6a00:2d24:b0:846:22ea:e171 with SMTP id d2e1a72fcca58-8616809b0ddmr723389b3a.3.1788455857667;
        Thu, 03 Sep 2026 10:17:37 -0700 (PDT)
Received: from [127.0.0.1] ([2407:cdc0:f001::1020])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153e3ac5fsm199982b3a.54.2026.09.03.10.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:17:37 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 04 Sep 2026 01:17:33 +0800
Subject: [PATCH] spi: ingenic: release tx DMA channel when rx request fails
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-ingenic-v1-1-06218181a4f8@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKyrmWoC/yXMwQ5AMBAE0F+RPWuymmrwK+JAbVmHkhaRSP9dc
 XyTmbkhkGcK0GQ3eDo58OoSijwDM/duIsFjMkiUGmtUglPm2Iiq1HbQiKpCCam9ebJ8fU9t9zs
 cw0Jmf+cQ4wNk5AvcawAAAA==
X-Change-ID: 20260904-ingenic-856fb6004802
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788455855; l=1071;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=s13LO4jmhqa32TTsrgNB+snIxVM0c2Gb5dUrD5UQwEo=;
 b=CvuQZtJv09/+3m1XgKCPQLRl50ZrhSOh37pRY3C1QwUN7kEfl8b5Gk5RrcmUK3KqIkH6kyHr/
 TnTs0S8WRidAhvb8SIc6mX2Cmdsx1JWIb5ViaSf94ZLqxR6EwL9sY1c
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

When the rx channel request fails, the driver carries on without DMA
but the tx channel it already acquired stayed claimed until devm
teardown.

Release it on the error path so it goes straight back to the DMA
engine for other users.

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-ingenic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-ingenic.c b/drivers/spi/spi-ingenic.c
index adcf85bccbcc..7ce4fe965cac 100644
--- a/drivers/spi/spi-ingenic.c
+++ b/drivers/spi/spi-ingenic.c
@@ -354,8 +354,11 @@ static int spi_ingenic_request_dma(struct spi_controller *ctlr,
 	ctlr->dma_tx = chan;
 
 	chan = dma_request_chan(dev, "rx");
-	if (IS_ERR(chan))
+	if (IS_ERR(chan)) {
+		dma_release_channel(ctlr->dma_tx);
+		ctlr->dma_tx = NULL;
 		return PTR_ERR(chan);
+	}
 	ctlr->dma_rx = chan;
 
 	ctlr->can_dma = spi_ingenic_can_dma;

---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260904-ingenic-856fb6004802

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

