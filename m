Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964640;
	b=UpfICMljzKBPhwjTRgvA6SgpZz3c4i9JcQMOj6cjmPNkyA8D5HQMkRJKVEl7QCXn2gwO
	 Y50p4O+RbE+2CTiWFSk1/rr0Ne7VW6E/+h00IzwNyBYoVRFADjCSQEA2opQyyjAhQm0by
	 g3WdzVAn1sjpwlfxl1xUfICqHokZwCCScstpO45+fxD8wNl60yV5cHNQaAL7SskxQNbya
	 K+QGLE3Wxim3v1CEVvrTMSktn8IFa/3F6IJ37UkNkfbiQQSRTlAntN+jajb1mbR3m1lGg
	 HU5Rskmx8uDk8AG7Zcppc2UxXB3BS+pnmvA460Nyq8OrclgRwRoav9SLOVuhAJFQegQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q7k3m5nz3BI1gRStNL0YWWjh2c3KEFQhqx9QCZVo4Kg=;
	b=JfniEVsOdg9QWjL1oH2aWXIPzcV0NPB3SC0vcS0GAtxrWJEPdTMub3UmKgP9zK+geEJ8
	 CBX8erONwOv+nmhs6M2WvwIKH6Tzjnv1oIkHr0y1N2GzwUqbHHzIXIXzugH9cZUtPmOwN
	 MkKmrY/IlAYOQtLdO6ibZwEPLF8QKJBN107PEfh2NwAE2jLNHL9UPUG32J7mg9rYANaY8
	 qLohnvDqAqgxBNEG4uF796MOonMm4ouq4TvQB4Z+6/NyGN8Cb8EY6QxERD1IObZYhOZdx
	 lcFKk3d1l+mdo7xeSI/VgCshynaddRG8+Q1XcKfVAxNn8BhJmHPLOlF1UBWrq5NvZ3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SaAPA1UZ;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DEC6083615
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13DEC6083615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SaAPA1UZ
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so229320b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964639; x=1794569439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7k3m5nz3BI1gRStNL0YWWjh2c3KEFQhqx9QCZVo4Kg=;
        b=SaAPA1UZ4yXIBFAk+CH3c9RwW3VMuZIHuUtioT1LOruEtWzloAKykACc+wHkyf5eet
         ktBtnVVLnfPHg1yrMwZkBzKyUO+WLie9JRmPXYtA6wCmPvj1LcFxUIWVogdzPi3NFk+6
         JPASrPbEmq+W3r3Hs3IhA6oIeRPEcCdFhaBY0RyZPwHFMHFJwc7YW3bnf1Ay9MmDRo2p
         p60vdZ5z9v7fp1p765Eu8ZMocXtFzDt4yA7/8fTwZQNVXu8Be3eUaTWQNosoNAWgCSZf
         LF2JNGIgdcIhbQ+w0MmnxGzgLuOdqkp6E9LI5MXz9gEMbOzgNw6H0TLJOYd8rYIQN8R5
         ubUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964639; x=1794569439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7k3m5nz3BI1gRStNL0YWWjh2c3KEFQhqx9QCZVo4Kg=;
        b=Qxb9stGh7RbayamrHQRGA6Tc5dGnALi/wgQ9ikuxA4fHVJBgZiQiC4DYtIuTQ/wnIT
         ERNemTnd8982B0VjTPdVW6sAmDSgBXOyaQllAFSwzmdWrrsRqSWnpTZxwb4lSWiCWxGd
         5wZitFs9d3MY1uKuL3XL4ZW945KYQ3/B5YiBLB6pkxrQhLZolzvjYCX+q5Q5n1vzrixy
         TH+PCHP1al7eoEmaiS//TE6QHVEt0Tr8tucwj36sJCdcQtyc4ysbdxKZNLktRPCarfdP
         skR6GjrDLg7Mgj6PI7aJW+iVUyTnjxp8XgMbwO0DBwyMXs4qmZ5wS1Phv5LLc13Zdlbm
         qHcw==
X-Forwarded-Encrypted: i=1; AKwUvByOnK6byOFJwbl7QH37hTgJlnvCb7TnWPq+1Yf+NEC3rGY9pdoAuYrw4qSn9Ee6Dur5FNXfCmWaxN0yPXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V1qkvMJw9Teg+CtO5Ug/5Vmq4tB5dkcIeAndBrK29tV0KDRWE
	gF1JYHNNNWCseUBliueHDTJFHzb+9JkD7jfzP4EXM2WxtnjsHQssQV7a
X-Gm-Gg: AYBFou2jHwmjJK4FDMmr48rgTnZKtTyKzv0MWx1znZlocfb4e3ZRpiKsnTRiKBmXp8l
	Q9YKzXpFVsQFMcW/kohLzuzQJAed4o8+nIqFf3prddz3aoP4H8W+NyKkOmhyU6PKkTGbnG96ufU
	HDzt31HThoLTHxpUNYMdaXH/9r5wvp9bVSBzWRar7fe/2rbnUr7FWEeyom9U6o0Ysr4NGg5S6sL
	k6sQVpbAI9JAMrxwTJbcZtspyXpNvQ2FnFmK2un648y/K79L49wLwLilV/NDsXCkzoVDDMF7gOh
	8QJhIXMzlYy/IALoOC863om5w2iKpcU0+Crqhrszd7CN9oSUxsBjp3zkS6jIC9nPa0x8H24HXC/
	FLG7/DAC5KuHtBhxXHwGH89l+Lgkre6EX1IG87dV/uAzj7mtJeZXiEqG5TxnzXLcSnbhusIJjWC
	HPt2lJ9qflN0Gxtr1+Lj0x9RL8M1Bx8V1RmD2CN9qrQ0sCdtVLl3K1RNzDP+L16zp1MXlz67MAA
	6xX2lBSCgn5QjWHGrUlYsondSkh3jy1xbdS2Kiv+UmNyMZdYxv7tVXBwhqOXDYx0uVPGR76LWT1
	m3KFYawcGqRfDC4wfM/UX3KocQHEACbmoz7nOQe4jUg6wAzGuuk49HYA4/STFiEC747iuQZqCd2
	3+kmR3DYCDIa4jHnicAlzh1s3typb/yl99Tiou/j449bp
X-Received: by 2002:a05:6a21:7742:b0:3e8:b7fd:6280 with SMTP id adf61e73a8af0-3ebb29e6af0mr2381417637.27.1793964639433;
        Fri, 06 Nov 2026 03:30:39 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:39 -0800 (PST)
From: phucduc.bui@gmail.com
To: Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/5] ASoC: dwc: Remove redundant error messages
Date: Fri,  6 Nov 2026 18:29:40 +0700
Message-ID: <20261106112940.53550-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106112940.53550-1-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The underlying functions already report these errors deeper in
the call chain, making the additional dev_err_probe() and
dev_err() calls unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 1ff5b6f8864d..87b47661e469 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -752,7 +752,7 @@ static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -830,7 +830,7 @@ static int jh7110_i2s_crg_slave_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -966,10 +966,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to request irq\n");
+		if (ret < 0)
 			goto err_assert_reset;
-		}
 	}
 
 	dev->i2s_reg_comp1 = I2S_COMP_PARAM_1;
@@ -1010,10 +1008,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, dev);
 	ret = devm_snd_soc_register_component(&pdev->dev, &dw_i2s_component,
 					 dw_i2s_dai, 1);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "not able to register dai\n");
+	if (ret)
 		goto err_assert_reset;
-	}
 
 	if (!pdata || dev->is_jh7110) {
 		if (irq >= 0) {
-- 
2.43.0

