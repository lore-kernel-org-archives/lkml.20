Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E0F50E588
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 15:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746878; cv=none; b=HHnfca6gXtFAG4YUph1uQLI3pVUgBU+yDUPPLTmdL2Fr3bXNAOIj1WICFyaYGjowFgWQ/5hTFdZVF1yKhnlyyANyHOoG5V+zBPr8mtBmx2s8cEEBCG8ivTUyt1AVzwWUS2KQrJ6qDhd79f4uKDewvLzMkFg1usTpgLdFKAs7G2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746878; c=relaxed/simple;
	bh=vnibq2jyCCC3IOg4Uxm2dHT0eG7ETbRhFgTe5l/Ddz4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MhsSlQdkmnIqGWCOn7G8f3JrrJBTVB1MsAnYO8PMHBFjOAHbcIBdyAHDsRWN9YQ8jETC8uLpIb9BNG21uzDFTdF94oXIUBDJ+ganU4O0kVJo2KwUK/S743kP1wfU+KQsD8KFoxvcRxpm3VqAvF/30CDBEsW5gQiT/LUEpI0cPSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJHQjUHr; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJHQjUHr"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25187so592202b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789746877; x=1790351677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gkZT5+6MT1neXTSrRW8cuNq+wdvBlgmd5gXT5DoC4rY=;
        b=tJHQjUHr7pyNE4WRiDsGg8HFr5ZwPDVMTrBjC0Edwp3rcuNkagHNCpK/MwcQgOn+a+
         eKs0BI1QlhyivqSA+dW2AbGMcKZbfg4TEvWt4Ky0HDJ1VroauXxYt+2N3JP3io9oJkrc
         Kyphdstvc+ifrvBwGMVJQdnDai/FLBfznW/cd270E4yidBEDa/KZqTXk//S64Lg5ozHt
         axLM8Gac1vJyKivFcd0iS4/V2oq0rvJZc5ncKnEm32UYzlakwZFR53rpHY24YcSy8oSX
         iHjX+bXNTWVM9AW12qvxAB7JJiis4RAbaPak2NcF5zGHsEM/rxi2NYkglz+od+8bRbVp
         YVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789746877; x=1790351677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gkZT5+6MT1neXTSrRW8cuNq+wdvBlgmd5gXT5DoC4rY=;
        b=p1cHVSk6CdsBK04tdXywUb5gnt8OsEW/ysULkuBea/ga/rVecXIInC1xUfz2YfekAM
         cQwpgGlc/vqTZJS5bi6ueLLpzztk8TTJkFLwN9+zaXiXpfyFJGIzxxqJrWkW2xRC+bAA
         o6iXUZu9665JzcE1h1uvkmejGMKJQKxfXBY5GgxM7XEhj3Ji4zRq5w1flPAz8XEJtBWz
         YT7Wzx2wgDLcttTxctegjtEMPfBuI3e8F8hF7ZJl+4JHmsvyPPr6of+ABGlklCCeTsZ2
         JUfAhIJ9gckSDRxQ+D7ShEABv65esOYQONjVLlaRCRxxUHDCyl9wRDlC0PFQ8YhUqVQy
         qxPg==
X-Forwarded-Encrypted: i=1; AKwUvBztdckLK9+1LgRQViKa4TbNv3UbnJRl1bWb/mLjPC0OqcIIrTFxd0R9JQQ4zrI4AzZpzcTn69EuX7OLLN0=@vger.kernel.org
X-Gm-Message-State: AFuF++m5SEYNbnqseGK3TbFf8GQruuoGRCk8d1cuXNiqqMe3+KJBDou7
	AftAe9mvLZ9D8/Bf6nc2SyLe8OnJXsgWNHsI0gQ3W5Ibr6wZHQrDaaAu
X-Gm-Gg: AYBFou1fnECTGxW9eKAsHFPSMA4tbi0EHeWwULYh19zPjxKCQGuVNgiwsAuRV1AmO3i
	7WKjL0bjxW2rZQZHbtGfW2r7T6exVxCeIuZq2cbooN7EucZX6UEFeTuJ41AoE7AgTwLWjBN7wAM
	/jNt8N5e7QIUpcfG1ViN7G+ApGpJ3d3gOXqC5hDxhEABnLC8z8WOwrQhNphdLUTTss6nPBKPV2/
	Z65A5NcO63AO7+4y9u4wV5V/vYCmqxHNH9MbqivgFrPmjlV8i2rzViWA5lTUGRTgXSdEVphbp8l
	mgPjbTeo7rD86bJlBRQrL3T+OEPcCdbeSp9bR3wEPUeDgWdOgeAFgUmfp+1iGI49y2Ih48HU4/w
	WpVCdllr8CPKfnDiJoRi45d2b1AT3yOS8zKPc6zYU3v00WlxdEr7YCHldKlj397CzK5d+98Yk/L
	rVwCVvwmP1HU0cIAJ8G9qVijtDy8q0R2VsnUAskmjbzOoVw2qonfi7ks2KEYC6O1CK3FjY5gJ80
	r8I9WfwD+UdElhq
X-Received: by 2002:a05:6a00:90a9:b0:874:705d:f64a with SMTP id d2e1a72fcca58-874decf71f5mr5476461b3a.44.1789746876763;
        Fri, 18 Sep 2026 08:54:36 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dd8dfa1csm1091058b3a.46.2026.09.18.08.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:54:36 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-rtc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: mxc_v2: fix wake IRQ leak on probe failure and remove()
Date: Fri, 18 Sep 2026 22:54:29 +0700
Message-Id: <20260918155429.2549137-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dev_pm_set_wake_irq() in probe has no matching dev_pm_clear_wake_irq()
anywhere -- not on later probe-failure paths, not in remove(). Switch
to devm_pm_set_wake_irq(), which registers the clear automatically on
every exit path.

Fixes: fbc5ee9a6955 ("rtc: mxc_v2: use dev_pm_set_wake_irq() to simplify code")
Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260914134826.EC26D1F000FF@smtp.kernel.org
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-mxc_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mxc_v2.c b/drivers/rtc/rtc-mxc_v2.c
index a07acbbcfaeb..7080aaf9ffa0 100644
--- a/drivers/rtc/rtc-mxc_v2.c
+++ b/drivers/rtc/rtc-mxc_v2.c
@@ -302,7 +302,7 @@ static int mxc_rtc_probe(struct platform_device *pdev)
 		return pdata->irq;
 
 	device_init_wakeup(&pdev->dev, true);
-	ret = dev_pm_set_wake_irq(&pdev->dev, pdata->irq);
+	ret = devm_pm_set_wake_irq(&pdev->dev, pdata->irq);
 	if (ret)
 		dev_err(&pdev->dev, "failed to enable irq wake\n");
 
-- 
2.25.1

