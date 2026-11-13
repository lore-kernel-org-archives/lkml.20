Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546496;
	b=XX4+mcDFJW5GxoTmCwgUt9ne/NlOxoL2lUDSQGKeSh0tFYsDxZDbQoeC4+fR9tAPi5us
	 ZyuR9mU1J+xJ3QF6jzeFFRAeIhM0MN65BhCnEK3dhfX3C676OODvGLSZoJ3vtHMQcADPP
	 PCDqwC9VLLTJjFa5Q59b3jLHROc//+0k6OTXfhes7oAOXg6QvHuQHYCGumIHHVJdLyoRL
	 4AES2KqoCVMjjK2wNv22jjlyhy992jig8AafUuwfD8P/eKqJPMOVXWZZANvIrMpHgrmxb
	 PWpFj/KQtKx3VtWAOi9CZsjqkTI+hmBPRsWB6FmwEBR4c/JE9lPvEgA2Pa3ay9QZH/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
	b=xY9UixZ9e2ISqRKs/6s5tyjucfDnh0ltG0l/Yz3w0XtHK/02m9vRQOi7L49TbwYFPp5P
	 M6MDKeJiiNzMmuyO9dWK+kQDG4ICuCF6Ny8OKMihQ5a4gmp+LlhOTiOLb2GBQyEgbe4oS
	 KHcZvbhmf0AZERi099PIKxnyesUDilHbuuZtOh5n+x34sQFmRhpnvERM8764k571bSW7F
	 dJn8Tizicc9C/H02zN5hRccIVSEoAb86cQ7giDdOTH8Z5C8UGP7Ot1NWD6R3eTz+XxpnT
	 HLU7/aM1y24GRVVp1ZTMnU0HMR5r6gL5lr0bhaUrJF53A+nqqUzpZxHZlW6o6eCt1nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ozhh4yE4;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B7B606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B7B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ozhh4yE4
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso230218a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546495; x=1795151295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
        b=Ozhh4yE4xo7QHwq1nFhvF+f0cR3+WjSSDcswjfCng7uQevZwAR0znFcEb28kxS2o54
         JgH6EOUfmsFox6PIk3HAJVes16+DxKw9uthpB3za9j+RMbzvV0jalEfEWSemx9n98Ehv
         0xYgK2KjW2QgEA+63yQRVnn54xz2JSr2GnDhIqsM4By9nvQlriljnYxz636146S9kgwV
         oVptKl9GMCHpDmIStbVX3DIwQ/LRcUFX4K9HnX+Crq88gNAHLdz+WEWnDGf2rKiGXcOe
         QcFwGeUOjJz9OEgn8Wj8igvOm21sCCSB2jmF63EEov4YFtg9A5mCwoNur//+ybN+w53A
         q/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546495; x=1795151295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
        b=DSQOk+KbW0I9R1vSi8ApEf4+qgEmnShXTQaR3KeF6OgMAUyCMmTVhnukpXF0LIcngh
         f48YVjix1Fp3Qn2yeL2o5w1aTCdDPx3etwI/vThxmrjMpj6oZJTv7JUMszH4inRofx3b
         9iEdPQYlxgczsZv22+CmOpQabt600tuaXTH7hrGNSW8RfM+AC2C25g0gz3yusOWI5p9z
         y+RgE0zHwewRW/F7bq0jxcwKzYPREKMX1+Wlr2fwkPU58qrY8T2TbvDPwZzxO2l+3cMJ
         vf/hmJ9Doa6ESLHrsbQDnbvu0TE1xq4h7YHsj/8Z8MRE4GkPn/1mtOqXKTN+8bR2tWRO
         d2Cw==
X-Forwarded-Encrypted: i=1; AL+hErGRpS0PaO7J7N3w5fvLxvRolpQp/69SIvh4F2VZnOOm1JFyp6niKa/rZnS1GgpQLRfRBp303C7sijQ5e5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PRdC27x6gpDsNvRC0IsTCpdkCtNVCJtjfEQZzixhTcDRul/0z
	EsJnCio7Fal/ljka8yMvIuG/ivahYK6k5IZqx7xmqScvv0eNgOL/43Mx
X-Gm-Gg: AYBFou0F/H+oGCEIPOpvoZj6sqUwqA+q4ngo91CAXQT0JDUDwlRJOChZlnsY3X/v9l1
	JoitcpsATdlHl8XOZErvjk3LkzC0x2Q5Xf7gdHDyzOJIKotP1EKyII1fZPz13TXrU3TkjZDzxUR
	4woQu5oylsqP8a73th+9bxMvZo3Vruj2cDC6m6LrXIximiZfIs6B/FwPwlmyGKR2gaHO+ShjQnE
	n1Uhvq8s3jbdeiIQf7KFx76WU5XrjbJd1NtuyzT+EonT3YC2eE8QBuapwRietf62SrbmnuiKjYB
	odS0ASUMHzrjib0QMflokXU7/HuZREHMWly9idChgp1zYOlkuqL2COkOB4d51oEIYtBFMYc1ITs
	56HOok82BXQ7Shfa1mnlpsfSTwG653z1UtO/bSrrqq6ecd9rnFT6eOmKbuDZbQ8iF7gPQI66xtY
	NeXYdl3ADg/SHrGZDWPDSHvwjjXutWnycmOA06/VTaNI7G0Z+ctms6aFL28js32gw3NmaVTu3ey
	mVwXQxjfuwpvPc14V14EfmL8IylMmvAJ7LRbnfG2zeiU4AV/8A9HNWIRU0Ef1FAYSP/tiEC9k+/
	iL3c2Uut/a+jjt8jEPob8yrc3PECDzZf8IJii+h2Ia3S8zlcGvaS3EHUAP5v5OXM7ZAw6TgERTC
	5U8+DXjVLbc/S/W5jyQOXoLBFdkfNzuYmYPBiVyarPrCu
X-Received: by 2002:a17:90b:3f8c:b0:39e:59a0:46b5 with SMTP id 98e67ed59e1d1-3b1b0b48069mr1373982a91.24.1794546494954;
        Thu, 12 Nov 2026 21:08:14 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:14 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/6] ASoC: fsl_asrc: Request the IRQ after the device is initialized
Date: Fri, 13 Nov 2026 12:07:25 +0700
Message-ID: <20261113050727.14053-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
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

Request the IRQ after fsl_asrc_init(), while the device is still
runtime active, so that the interrupt handler cannot run before
the device is initialized.

If requesting the IRQ fails, balance the runtime PM usage count
before proceeding with cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index f7ac60724c6c..c97f814d7358 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1299,11 +1299,6 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
-			       dev_name(&pdev->dev), asrc);
-	if (ret)
-		return ret;
-
 	asrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
 	if (IS_ERR(asrc->mem_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->mem_clk),
@@ -1436,6 +1431,14 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		goto err_pm_get_sync;
 	}
 
+	/* Request the IRQ only once the device is initialized */
+	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
+			       dev_name(&pdev->dev), asrc);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto err_pm_get_sync;
+	}
+
 	ret = pm_runtime_put_sync(&pdev->dev);
 	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
-- 
2.43.0

