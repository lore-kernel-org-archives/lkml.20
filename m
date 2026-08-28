Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8220C3955F7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908593; cv=none; b=Vgn7i8sh6mhHo2yXy2KYNFaUGpSVh8D2VMRcXOpcrsExCA5ZaiWM50/lxQgwIi/K5K7HWyj9aTyeJrnmezBrUS+cFn9k6cnSCfc8xJGPaUUmP2aDRtHonekhKL9rCuBhSlxuSVhV2dMTqTXPZdQJOijmu+jhd9VJaUEC1NQvsFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908593; c=relaxed/simple;
	bh=flUUxagMMbbwFuTrQc7nygferYAal45fxbtXaeUEeAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Itc/XiViZhmumIEldeh55e6prc2Y84Ysyl0iS2UsIlj4A3esThuV76p0UJF4NqEWoF2MFeOKfh4NVukClZD8XWOOZIZI/WDt9Kg3FKdezMAphEmypvr4J2mcYmegR5YomjCgJTApYIW+/fO/QIMeJ/40yDFO+6zpLtTCDkpuF6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQyt4Z5B; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQyt4Z5B"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8487214ad2bso1182685b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908592; x=1788513392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=IQyt4Z5BZfGgIsKPakgqk4m4GTNyHtnNwEmg82REhTgn5vHycNbGqCV3dq5ASYcfIa
         XZ7pjZ1IR7FawuiTGRoSJFeEUohzvsk+oMOAS52yKEzDA8PJ92lkDIdg/ToqMnDI+MCo
         IWvo2Cmxeq0lTHgdyyUaQc1Hve89c0G3J3KH1KPRGhK0vCDHlnYvBI3Gxdxv0n76VYOH
         cxLwGX5FyIq2LcKfmVRKbkwhevBPTJBamUMezJVM+ALPqkQgVA0wInIDxSLABlLv9OAj
         WRb75zRicoP1iINAGbLdzXEKsRiissbJXcVJ4HohjAgEAbgupxjpYHXxJTNeR9+/Mzt/
         Qrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908592; x=1788513392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8NabRqeVDl6V/0Mf+sYcOuuE1n9qJZPVQBsEE5OZg0=;
        b=GDu69RUkMs6C8Uk/lndjgpHBw1ZtMMg1r9355/5JkwOaubtYSBxZ82d95frBUs6YvZ
         0keSARd0WBb8B78Ede6/D2zKBQsaRtO/N+vF8YZp0N0n+cn26wnGaBqGW0jOsnjOiCe6
         Xs3JOp/Frgt6XwIGP4WiIKiu9+nHDTfhB/MiaaeW7g7NrQS1WYps4O5CZUT3/nuf/IFZ
         keKb5FTCB3Ef19PN2ZGNqoiIquizFDJMI5nfe9BsCvAlTbZPqfXc/2bx1a3arv9batv9
         mHhQhWYx1o1RIj8GrvlPd3GWtohCQAgKecSDkTnRPX4HVUoAR7QBfklflaC0zacXnmjv
         ihBQ==
X-Forwarded-Encrypted: i=1; AHgh+RpF/iUe+xmkY7jgVaT619QCrNh6tyJxun8OvcSbfSpJtGXtmM+P/er4oEY9WexNi4DkKdvG5z+fHRjTfvM=@vger.kernel.org
X-Gm-Message-State: AFuF++nc8Eeu2Is6DQYMEly0mgnG7mgRCEptnRmw63Xew5V9TE0vAt1x
	TFPD5zNpGms+fPSm/9O/c/y5mDxzHEuRNK8Fbddi1t1rXmY83qP8VGK9
X-Gm-Gg: AR+sD11XYv35aolLIfA9KI93kIjDHbPm1ixo7KyVC/GttPqg78rZWPFd41CIQNRbDAK
	Lr/aJC9paBj6GhXwSqM5ay5W8S5eqY+bB8jRe9p784Y23N8dnRpLQoThnAHE8mYCboDSzSgugcI
	JQQERf82reKPGe0JZOIBgTNyx9Gv9TEP/M5IeUK0idBaeN5eo1sEGTlkA+9XmomrKZX3X5JjZ0L
	xCAY6WxvmWa/LLRO15NFnV6EB7wHQavb5gA40kKQOw14vstCNRwXmb5az/3OywTV1vU0J79BayY
	wjhGSaexnuoEuCphMIQvNcMU/95Dm9RIdqizQDjvmqL51IRsolOBMpO6bC8u224uSMitKeUbb0j
	tMVN1yuledvFQ2JCJjH48XMzqgnWtuUlL9QHCQYrBsTelwG6qrEUiH/NbgoGigy032zxXGDkomG
	eWafdBpp98/WVisFzDLTCQq25iLnw8bladEHUykjIUG/L45C34obBSrMgO0RdKzc0HkXpTIEKmH
	4hUVR+b69ep6zLSf8jEE5uTI0tIJ3JMBA5F5TE9y+TUhsvA4hTJMXGjMdcnJyMVBBcXxN/HzRww
	WcWtwLlEa0oDt/U=
X-Received: by 2002:a05:6a00:8019:b0:851:d12e:389b with SMTP id d2e1a72fcca58-8562a8d4291mr12413048b3a.14.1787908591962;
        Fri, 28 Aug 2026 02:16:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 8/8] ASoC: mediatek: mt8186: Drop redundant probe error messages
Date: Fri, 28 Aug 2026 16:15:32 +0700
Message-ID: <20260828091532.600047-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

platform_get_irq() returns a negative value on error and does not
return zero. Therefore, only check for a negative error code and
return it directly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index 143386c54dd7..4bf098657fb4 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -2852,10 +2852,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* init audio related clock */
 	ret = mt8186_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error, ret %d\n", ret);
+	if (ret)
 		return ret;
-	}
 
 	/* init memif */
 	afe->memif_32bit_supported = 0;
@@ -2885,15 +2883,14 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* request irq */
 	irq_id = platform_get_irq(pdev, 0);
-	if (irq_id <= 0)
-		return dev_err_probe(dev, irq_id < 0 ? irq_id : -ENXIO,
-				     "no irq found");
+	if (irq_id < 0)
+		return irq_id;
 
 	ret = devm_request_irq(dev, irq_id, mt8186_afe_irq_handler,
 			       IRQF_TRIGGER_NONE,
 			       "Afe_ISR_Handle", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+		return ret;
 
 	ret = enable_irq_wake(irq_id);
 	if (ret < 0)
@@ -2957,10 +2954,8 @@ static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
 					      &mt8186_afe_component,
 					      afe->dai_drivers,
 					      afe->num_dai_drivers);
-	if (ret) {
-		dev_err(dev, "err_dai_component\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	ret = pm_runtime_put_sync(dev);
 	if (ret) {
-- 
2.43.0

