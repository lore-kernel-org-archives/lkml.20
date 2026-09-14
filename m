Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B63846EF62
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392565; cv=none; b=ee5wKJfRSaHzbSVQQ8QWOGbyNqsMQ12tYIhggBvyJaXcWTbfy0rjBGMM06DLL8jcADHIWaK9YZc/rPYmn0HJxdBGsa1wid4nxUAi8IIeKTsTNOP6Tc6X9moeeAii4ZBGAcrcWidzJYk9hbtdkymhVbRAkBdNTPOT07DKqAKVSrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392565; c=relaxed/simple;
	bh=EI/Mvo4q8jidfDbAOATfJ+esW46iCyZBUp07YscHpPo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=haB/DIz29FrVdZ/ESpXL9bxydrkUBx0cs2caCYKQVnvcVp9neORxBZ4MNdPkwfLY4ps5dhX1dDr1WbYI8tW+uakikQk8cs/8F/4nMc5TFNs1Qf9FodykCIz6SAbQf1LB0qg0l06nN0lg0H1cMWJNg8l4lcFw/vtbeCjGVvl3lWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar7Vhw9V; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar7Vhw9V"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8692a856865so2403944b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392563; x=1789997363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fc4eltycEplIA/0aLYJ4l4ExpzLKApvTuVgrIn6Z/9o=;
        b=ar7Vhw9VkhaBQIPjID/ZZkLqAbJ/1qOwR2JnB1aVLtKR1nEfxS2fTm5uzNS4PGY1xL
         OYiZV3i0nHjGPDn5XUBjTje73GXN7iXAFagATCAnlwYaoDRaZ2kx/p7olkMFTqPonlFG
         qaqQ5HxbE27VY8DXuKGep/44lb+w5c90q9106NmNZ3BCajgcKgaIV2PpCz5sx8QhDHVR
         sLY2a3zVf/QLB+0qha9bKCMIysC//2nGzRDMGFyTTjbRji1R++sgpgrHOQjq8T0t6Zoy
         xbb3+qgC4ddqCIzWWZxenZ4ytIm8HMvG9sOEnbTSZ6WeAoDuWSAHK3Mg6fSdnI0Q169d
         lksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392563; x=1789997363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc4eltycEplIA/0aLYJ4l4ExpzLKApvTuVgrIn6Z/9o=;
        b=SXbwrJrlv+oD6C1VHrrgy3QA2QPjHjCbSLphRlFwq59G/8stxw+Mmcf2Jgi1Hi7TyC
         HfD+6GQyE5NaoxQEdvxJj0o4zllTb5cfXH7FQwK2mavj3TbtSavD8gGfolbafD3tWUob
         didWTbJHowL9dHS4Y+aGWVIKgH4hrbqLYdZguLSI1ENRkJUIvO44xScF1MnilJkNAaPD
         5F1+OLQ+Nm+F86P7oZAvm0jLGH9JI9URLJcrQRAGde8z/IKAytO8JVYrkeFUpAP7I2b4
         zWqTRlmGmxPFGYzs2ZX23qjxfW4qZcCpNb+MvfB9UNkZjM3IXbIywoWbbaUOI2sVsTtE
         x7cg==
X-Forwarded-Encrypted: i=1; AKwUvByhNdExJuxoBrXbYH8htW5qURM8ENArGCuioFfj+U8iiqQphzaA/QB71mk6eJwEDsVCqDyhzGWZtx2TATM=@vger.kernel.org
X-Gm-Message-State: AFuF++mGpZTA5lKHFgkuCvs2KMaq1ea6I1nfDoLUZT/QaycWGZbqH+Gq
	D4JIHxlalKhHxbtRKqOgZV8FmcmnNmdNifSe8hRMme4hP5amuyRzuypB
X-Gm-Gg: AYBFou2gprYkmTOgd5xhKC6U+RSjSIrhyBRpgOo0pIEEfTLb/Z+M3hWcTjqZJCsxOtX
	3dmYvYu3zymnuY24jmMP9/F0U3mR0hZBfQMLcSxLEhEmXweZbBlNy5uJnk1vX7C6Dwtu0QvRk9P
	e2g26toP43RsbpJRxzpzecwmPvcj2xnV0zji414KGnajMdu2UZuHRXM1WXXhwkCL60d5Zj1MRk3
	XQv0/jmNUQxENcFdeXIGnN55RdLTvFMG+XDZsZq6iisfxAU0WJmhL6YHClsEDoJ7iJP5ws/z8kS
	Oit7/UDdlJzI8F1w43TCblgzODKcziUlZilpH47rwgU/FN6nhFKXsT/7qStrwUJPyR0n+jNquIy
	Qpf6kWp+crwcjkLdPQRI9XstO+jEiqM3osYUuwC1cib0Xi2plrS9+POizRcrq7Ar9aHkic+URwz
	uDrA2jE/7t88cnZfmGM40162DTAfheDktVKbXqGLQ1Q7b21lHkNAN2yTHlTKPZ8XWkWHS5R/76s
	DXrlS1dPOBq0ewg
X-Received: by 2002:a05:6a00:f08:b0:86c:bf42:fa44 with SMTP id d2e1a72fcca58-86f83543227mr5924981b3a.6.1789392562587;
        Mon, 14 Sep 2026 06:29:22 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a6bbec8sm4597643b3a.60.2026.09.14.06.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:29:21 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Valentin Caron <valentin.caron@foss.st.com>,
	linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: stm32: fix clock leak on pinctrl probe failure
Date: Mon, 14 Sep 2026 20:29:14 +0700
Message-Id: <20260914132914.2371788-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

stm32_rtc_probe() enables rtc_ck/pclk early and unwinds them through
the err: label on every later failure -- except a failing
devm_pinctrl_register_and_init() or pinctrl_enable(), which both
return directly, leaking both clocks. -EPROBE_DEFER is a routine
outcome from pinctrl lookups during boot, so each deferred retry
leaks another reference.

Route both through the existing err: label, matching every other
post-enable failure path in this function.

Fixes: 16ad2bc09efb ("rtc: stm32: add pinctrl and pinmux interfaces")
Assisted-by: Claude:claude-opus-4
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/rtc/rtc-stm32.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index d4ebf3eb54aa..e7a942f6c190 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -1175,12 +1175,16 @@ static int stm32_rtc_probe(struct platform_device *pdev)
 	stm32_rtc_clean_outs(rtc);
 
 	ret = devm_pinctrl_register_and_init(&pdev->dev, &stm32_rtc_pdesc, rtc, &pctl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "pinctrl register failed");
+		goto err;
+	}
 
 	ret = pinctrl_enable(pctl);
-	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "pinctrl enable failed");
+		goto err;
+	}
 
 	/*
 	 * If INITS flag is reset (calendar year field set to 0x00), calendar
-- 
2.25.1

