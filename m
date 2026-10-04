Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97B43B71D2
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 03:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791085183; cv=none; b=CzufZi+cxXaxVm8IS0dT7dp6oKH+43eH8BvgqbLDYKQoN5301vu59c767DGGh0eCFdB4Lbq3oOUA5CVHyf+5nPArbGKyMC00oeD9F/NQ+TUqSu8L8ela7srWEzHIHl8igrBnL3LVnLz+TjmAiUGFtRRXNg0RA+otGdJAmvjDwmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791085183; c=relaxed/simple;
	bh=z95tIApCMgMzMQtaz0iwv8U5sDTYv5+wpk5hvmgAC+0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NmA+iX8oo6UfKYYuUk1yyEgZEUMNjkkNghV0h5R4YmIcS+OmTgBi+bnVkTwTQnKDTRgeMISHKCp4gv7eI+sNMtpC7FPDYxrGfEB1/wT2/ek7Msp4fDhw3tgNxhkXcVzphlTjAk2JpHsAxwadz+D1z1YEHx2eeXNxYhKpSUzFBgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSoyEAOu; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSoyEAOu"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-9142e83204aso9896176d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 20:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791085180; x=1791689980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zhk8BTSKwUwdy5UN+oAwyMBlhIqn2OVRwoj4KbDLpxI=;
        b=HSoyEAOuPl8WAW+P/95zsfIYZ3QPgejpHgdl3FnvsIaX9xccc+H2Liuo2hTPqlbxSX
         erv2zjQKSjPsx2W3npxOPkuJwJdanzKtDf+mKT99REO1XZSnfHmYhx8uhQD/H6jbI+uc
         +26FudofiA5xK7wMsQNp10fpjPZT/MLA1BlJIW3b7V+LKIX5106JcM4EVqJ1Xmfgtbui
         jbZP6Nb7XwaLOG0vWgQbqYWDah00rMWY+m1WgkF/XIFTlHkARJIH0LfnQGkL728B1LT4
         kWmWtw6QZrdDEUodtkNBfrXUgnB7g2/Ejwu5N+lU94Mx7cB3Hy7Zsas2tORjhlkeQclw
         Sw0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791085180; x=1791689980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zhk8BTSKwUwdy5UN+oAwyMBlhIqn2OVRwoj4KbDLpxI=;
        b=g/4ZQOqCCgfkAIQf/+PdeAs5YVLUlLRnqOu3K5ZAqzdcIy4XGayN4AhQ+CSkdK0lQE
         qSOBtOebh19WI2nC0OzGkJOwAWCbJrb3YI7A2TX17OsGQ/GTUFgjD/tI+vP0Sk0x6u2X
         McwJYgncf/kLDtQxXu/sHsBmP91crUHu2UgQ5AZnYxoJmoFq2llLi3qA4/Xz8ID8Ou3/
         sVHOTG0kzAuGvXofmBH9js6EJF3wWJd1/nen27spVHDki55ZdhEIDmYhFy8yJYaO9G5a
         8pllZeTOtZy6qhblnJRSgMwsm9FWU3OnSJeJa5wcCoW+VOyF4eox16UCXpMls+aP7ATi
         d9OA==
X-Forwarded-Encrypted: i=1; AKwUvBzVNfG3YVQPEvyQn3xyHDxe6vV6w88/cZdsTk/ItIqhAy5pEpBcM1eZkLshy3XVax0MLwpvkWB1nDs1qTk=@vger.kernel.org
X-Gm-Message-State: AFuF++nHyddvng4Ce+49cIjyw5V/h8ivN+1/oLJiZceaVQt9KAhtyIe8
	noIDe/ynlgV1Q8TLyFHAfKnwyucggmTGllrEEWAwy1OiWMgpKe2LT6E=
X-Gm-Gg: AYBFou3g4mmMetakSCfC2liKyGZ0OFGBYnFUUBzcju5b08Y6r0v7XfZ4zuykL7q05MH
	HcGMiwVdDqEy4P2MVB/MPOP61EN0EdPlhzc4V2cZcIuj8KD8OgxRYDz3uKXqj3yapO5tF+qMyAp
	zapfVp5kiCSd2HkGDO4fBgBxrF14N1XCsehxNEvTgh8HpA6DOWNPfBgJ/dD/oGd/U7Lcl03cbZM
	mbH/L7v2zHAzT6xiyph7AlWDwy8s2B8MLyvxnLzSBOHYMlbX8zHxFdR50MLQOvPZxbZjo+aSEL/
	WrOoAj73GKNLSPIn76ujOUtiKVXHnVZGFtegpZarGTpDtBCHR/03qKH4ovs2pRwX+28HCPU7mF+
	5QkVUnZxyxGAqal3QOLqHEukPcZpbU2qkaY/jyqi9bpNSb1q3YKBp7T9IoOQ5iEbZs+7bh3Q3Zn
	zt4fd4qzYAIRsPnYu7ZoCQ/VuMXlz0Gn68iguNtuZUX/Tlv9QEG2+agzd8/fifWUCloTOYkH4KN
	FH+54IH2LAjEfm1dQQEZWHRxCz3GrikEHLbXqRnedhm/pfG4iMMDny8+HQrLeta4FpCXd5dvQ58
	6Yb1r0co91cS+XYxB5Y8kbGmjQ/w
X-Received: by 2002:a05:6214:85c5:10b0:917:a7a5:af08 with SMTP id 6a1803df08f44-917aa303f2amr145553496d6.25.1791085179220;
        Sat, 03 Oct 2026 20:39:39 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-917e0c11022sm57924096d6.41.2026.10.03.20.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 20:39:38 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Dipen Patel <dipenp@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	timestamp@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] hte: tegra194: stop IRQ before releasing provider state
Date: Sat,  3 Oct 2026 23:39:35 -0400
Message-ID: <20261004033935.1114168-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Devres unregisters the HTE chip before releasing the IRQ. Disabling
the controller does not wait for an already running FIFO handler,
which can still call hte_push_ts_ns() after chip->gdev has been freed.

Request the IRQ with IRQF_NO_AUTOEN after initializing its dependencies
and enable it after chip registration. Add managed actions to stop the
controller and disable and synchronize the IRQ before unregistering
the chip.

This builds on the linked slice-lock fix in the HTE maintainer tree.
The IRQ lifetime issue was found by static analysis.

Fixes: 09574cca6ad6 ("hte: Add Tegra194 HTE kernel provider")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/20260830161747.2719220-1-runyu.xiao@seu.edu.cn/
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Based on HTE for-next at 30167fadbf87. This IRQ-only patch requires
the slice-lock initialization fix:
  1329abe1bae4 ("hte: tegra194: Initialize slice locks before registering chip")
already applied to the HTE maintainer for-next tree. The same
prerequisite is required when backporting onto older trees. The
diff also preserves the earlier IRQ logging cleanup c21530a75b95;
older trees without that cleanup need its context applied/adapted.

 drivers/hte/hte-tegra194.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 189f7fcffbe2..9fb16b6be231 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -799,6 +799,13 @@ static void tegra_gte_disable(void *data)
 	tegra_hte_writel(gs, HTE_TECTRL, 0);
 }
 
+static void tegra_hte_disable_irq(void *data)
+{
+	struct tegra_hte_soc *gs = data;
+
+	disable_irq(gs->hte_irq);
+}
+
 static void tegra_hte_put_gpio_device(void *data)
 {
 	struct gpio_device *gdev = data;
@@ -854,10 +861,6 @@ static int tegra_hte_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 	hte_dev->hte_irq = ret;
-	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr, 0,
-			       dev_name(dev), hte_dev);
-	if (ret < 0)
-		return ret;
 
 	gc->nlines = nlines;
 	gc->ops = &g_ops;
@@ -913,21 +916,33 @@ static int tegra_hte_probe(struct platform_device *pdev)
 		spin_lock_init(&hte_dev->sl[i].s_lock);
 	}
 
+	tegra_hte_writel(hte_dev, HTE_TECTRL, 0);
+
+	ret = devm_request_irq(dev, hte_dev->hte_irq, tegra_hte_isr,
+			       IRQF_NO_AUTOEN, dev_name(dev), hte_dev);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_hte_register_chip(hte_dev->chip);
 	if (ret) {
 		dev_err(gc->dev, "hte chip register failed");
 		return ret;
 	}
 
+	enable_irq(hte_dev->hte_irq);
+	ret = devm_add_action_or_reset(dev, tegra_hte_disable_irq, hte_dev);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, tegra_gte_disable, pdev);
+	if (ret)
+		return ret;
+
 	val = HTE_TECTRL_ENABLE_ENABLE |
 	      (HTE_TECTRL_INTR_ENABLE << HTE_TECTRL_INTR_SHIFT) |
 	      (hte_dev->itr_thrshld << HTE_TECTRL_OCCU_SHIFT);
 	tegra_hte_writel(hte_dev, HTE_TECTRL, val);
 
-	ret = devm_add_action_or_reset(&pdev->dev, tegra_gte_disable, pdev);
-	if (ret)
-		return ret;
-
 	dev_dbg(gc->dev, "lines: %d, slices:%d", gc->nlines, slices);
 
 	return 0;
