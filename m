Received: from mail-qk2-f40.google.com (mail-qk2-f40.google.com [74.125.230.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD82517BAE
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972433; cv=none; b=pXM3KXyje9NcSZLMg8GBTNwkdD4ud8lPJpecFgfiZWUFbJ0gdEq0zNiSVymrIQcpoFD4I5/PCPaYZjCTXm6AP75IepQB72V2p5cxoLyUlUJCppPz580Ha/wjkf44SVVvv/+x1NUqGrP9q1cqaP7CA5tmbw7RW4Ew5TZuOk9p2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972433; c=relaxed/simple;
	bh=tuvymnvqWK7QHKbCU6yufXj617WJPFKk/7YJcRL7A4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LF3n2zSrOPjwwwWAT8vZwgjoS5Wb78WC54r/NI/bp7RN4Gq0eu3eb3HrxDHnUzOYHOZ3kKixNgk0pq6z8O1dTXJY/qG+HzMLP3MfS7CDk6w2CCldi6A+YvGO2ljoDk76NGGFYZ9poPqs25VooFx7M9ezwn5PDbpQGOv9xLX1t4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdGR0gam; arc=none smtp.client-ip=74.125.230.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdGR0gam"
Received: by mail-qk2-f40.google.com with SMTP id af79cd13be357-93c5d67aa05so809291285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790972431; x=1791577231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yX/9xC1BB29XKcsi1gHnIwdtNtc2m1SRNjsZRYQWmUk=;
        b=LdGR0gamH1sQUnnwYXEukQYfKTw8AfBhy7UwafVWN2llNSG6Z4WliznK9blf/pTwJg
         8cqHdDDoN4LHlqS0dOIc2VjSZ+w7gyIF6ijZgQY2FmRBlZrMMBF26lWco9kqxCGNIOCE
         qtRl9sr+ykRsAhWKpRyPv8huxsGx5kS/tmooyX5FuPsB+N6LGBoQn21iQ+pSc0X2XJMz
         JZ3JFc2yf38RVFtMuX1Ly+fp28Y147Soo7MNj9KPZPV8FgPIrmIJm3sGm4ZvchK38EtG
         ZJWw/uVUER/5lc053fJbua37SGug/PDHBd0rGEUiwakEH500KRYn+X1XzDABz7Q+Rdta
         Vwtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790972431; x=1791577231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yX/9xC1BB29XKcsi1gHnIwdtNtc2m1SRNjsZRYQWmUk=;
        b=ZrEwyiI0ly2LtF9cO9L8PnUEytdh9xOoTJG+NfupcPPjH0Jsddgg2mrLjYtNvhTQo9
         NT15glcXeCaQWAfwOBjGXQcrYK7ueUtMO0e0+Aw3vL6BoUshGdJ3yx83OOPnbwq3+3jt
         mRt9OI37yJeCE+tMCA9ceKCcjaToOaYu1n+jvEprH5m6tLnOmvV+ixriPeriJYv4vpRg
         Klc8gj3yF9Pqx3myovbtT0TCBSMgGbqX+nyQuS+nnnkPMt2mY+5AqpYy5RK+YKJvK1IA
         vzbVAIrClxU08km0ojs3kDX4h3LOnGPwhg65VGYqXrn92AV7LfPHdvb/jnh02jKBrKR/
         ZpyQ==
X-Gm-Message-State: AFuF++mj0jTBt1z6pGyjHbhzDUMrnOFRpBvCov+cdXjIlkQHjUF0/k3M
	f1XqDCJiTITva9Njv6p0lnrnZdJsE8FlWykewYQvjAr4yrrKpZchIkI=
X-Gm-Gg: AYBFou1cKKZOJhO1n9VREuwT6s+3PN8gq/H1PW+p/s/pSEDPXxhAsGeu+A9M1dhKeAM
	bQ9qPxgqK+cCuzxBjeN0K1IKl01zTU+JFTclRpZage0eZWz0KW9Wi2J01bw9vyqpuovHEddVeIZ
	A+SBfhnSmN1rZ3DL6jm04IMbPS7qY7Y5JjALQp1+i4Imz/Z1Ge94RuOEJINAgzmmL++ztYE1nwG
	2br7waPKbUiPwZSYFGgzCSJ658DelepCjyXOshhMGbg0iH1ORuivbTorFiqiOoAHwon1QI8hU/B
	tn9gxMz+tlhQALSTGSey0MLehEtNAspQ30EubnjJBHs9HnVyVI2dsccpI5WR5qEa5GGlBlyDVqi
	87sOJUHUsADBesu/ySrij6FpjecUV8bPxHL/dkvQiYXQSVXVL7x0fCKhFsy2QDjzKfBrFEK435M
	aLdY5LiBNrLcFYYh16zpV27tVh6Ilrf/+3lMisNRgYLSpOwFerEzWQngkfm1puApcrXibYH90YD
	ou3Jo5gozYC9wiOP/y2GOYHIcg/IcnDyB8wvzBKOHqHD3udmAlqYAucxAQnNBjI+lQMOMutRI5U
	c6bKPErcKAaEwwC0+UPXihyOu3C+
X-Received: by 2002:a05:620a:649a:b0:93c:c405:3215 with SMTP id af79cd13be357-93cf17580abmr702882185a.44.1790972430750;
        Fri, 02 Oct 2026 13:20:30 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca1a63d8sm305025585a.12.2026.10.02.13.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:20:30 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] soc: mediatek: mtk-devapc: release IRQ before unmapping registers
Date: Fri,  2 Oct 2026 16:20:28 -0400
Message-ID: <20261002202028.420575-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The managed IRQ remains registered until devres cleanup after remove
returns, but remove explicitly unmaps the registers used by its handler.

An interrupt handler already in flight when stop_devapc() is called can
continue accessing ctx->infra_base after iounmap().

Release and synchronize the IRQ before unmapping the register region.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: c9c0036c1990 ("soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove")
Assisted-by: LLM
Cc: stable@vger.kernel.org
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/soc/mediatek/mtk-devapc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
index f54c966138b5b8bda32c383d179a57c78172bf52..57ffe49c99eeb9b0989bd5eefa557a0a7dddbf18 100644
--- a/drivers/soc/mediatek/mtk-devapc.c
+++ b/drivers/soc/mediatek/mtk-devapc.c
@@ -54,6 +54,7 @@ struct mtk_devapc_context {
 	void __iomem *infra_base;
 	struct clk *infra_clk;
 	const struct mtk_devapc_data *data;
+	unsigned int irq;
 };
 
 static void clear_vio_status(struct mtk_devapc_context *ctx)
@@ -289,6 +290,7 @@ static int mtk_devapc_probe(struct platform_device *pdev)
 	if (ret)
 		goto err;
 
+	ctx->irq = devapc_irq;
 	platform_set_drvdata(pdev, ctx);
 
 	start_devapc(ctx);
@@ -305,6 +307,7 @@ static void mtk_devapc_remove(struct platform_device *pdev)
 	struct mtk_devapc_context *ctx = platform_get_drvdata(pdev);
 
 	stop_devapc(ctx);
+	devm_free_irq(&pdev->dev, ctx->irq, ctx);
 	iounmap(ctx->infra_base);
 }
 
