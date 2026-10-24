Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792844079;
	b=rGNWQ6t8Yew9RD0VfwX64AAlr+DQR1X5fouRuB4rU+RGJOj922iognv24eBBOL3iSQg5
	 JKzYpjP3qyt4Kg/MK+MTFhpD5AXFhjkBW/V1fN7HBi+XEN58HRHURHaInxfLI9erNUzKC
	 dpgEBUqvg8c6Ob7UDos1ThZRKyWk6rQEYv6WOPERSx8qUYZ5XUNUpBHzjI/tgKI/J0WLf
	 iCF5xIgxAbEfl8/zqoK6C+VDzwGhIjQhrHJxXR/93jrUYlHaqHvWqUfoQG9Ncp1qwLLOg
	 gigMyn4YlLgbMYMaASK+KMa8lYkG1Q81HxYqa9YPCJ5PpHmDku6CtooUlF2OnesvDCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792844079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H5L2oywAexEgARcVCe03Pw/60ikOC7LjYePVBuVC6U4=;
	b=O1BixBkKDoTon08uyAssifCwgIGWqkTzS0X3jJWefLw0DzvHBQ9z+2gXhjTEEC7Qm11Y
	 y8GforOe3WwljUsSkm4N+vuxMCMKPzUOTpGwtUWi4qPCDVhhC9FGF/huEMqTe/a8QKxGi
	 dC9wMt+swlKdmCEn8AXSByDI7iesNJ/Lbu3U8vq3Le69eb3nsdS8gMFFR5/d4RXUU2w5q
	 pP5l89tlEPXh4g7MBH84RzLTIa5++vK4P57tsGAepgZTmiWzruh3tJEyW+PcCHxid4W2N
	 OADNpGU2B5z6bKUI1DINnbscCo/GRx9I0j/Wbcia+mbKjUU+anaccICs+Mp/Vrvz5Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kk9QGqNq;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853A7606A329
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 12:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 853A7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kk9QGqNq
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso932567f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792844078; x=1793448878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5L2oywAexEgARcVCe03Pw/60ikOC7LjYePVBuVC6U4=;
        b=kk9QGqNqPm0wSvRaXOTRIxpQRw2ERMl1qZCUO1hO1D+r1xDHcZc2tncdiKL0G8a9G9
         pOG4h3w37r6iZfPL2AbgLa03L1aO3NeHF2MxT2VGkzme1TIqteUykHCx201tydvmr0js
         5I2cWOVMqxg97ks2kG4FDJvHY5RDgM/H3I+7Ws7ywsMSPGgFmMlwaJ6cIRfBWxcYT/Sk
         HqMXi7lZUVOeVJor4jBX6tV1IrtYCS1kKxVlOzHsb1gZ6vB8sRQ21Y9QzvIME9JrNNdx
         WIp6N1mUwBdNyqJzgurUpZtdapDi9wF/qSeD+fhAiGpp1aggcaYmxG6HRTbmuNkuNVRg
         IDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792844078; x=1793448878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H5L2oywAexEgARcVCe03Pw/60ikOC7LjYePVBuVC6U4=;
        b=IjKxYrz+MEwP56rmTZqqglAVKhiDpuUBxVqkk2QFQ+wnsdbPV6zs7/ZDxsbzyvLhMo
         P8VYDOYrjK0NxbEVqf3TI34KpGFCA/ho8keshsMUlfbqqtXPPeZNcNNgnUbPrT2F6dN5
         m9DNqxn8aG1t9dNXKtlSyIZwGoZH3OrzmR7mUJlQ/Piw2wV56jNwb8rH2mfka24Imy2h
         MTxYat7kl94TUjEQxF5CiPiO2GnSuE4MRIp7I9Q54D2CJIZNzysIey6D9lacWdh5z+BR
         26LZkvjg7P8RBGP5C0eBnk+MLHBg+oau4N0iV9NO0ltMJKEEKHtAr6WFflaYLG2rdpMD
         LFFw==
X-Forwarded-Encrypted: i=1; AKwUvBzsgV4MMk0fUWmi370UKetwABAdYpqdSLT6/gtWyy82rwIvDAVrkUIZ57DHv6xHGg20Tl8BBb/grFI8Eng=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDsdd7CHeSSVmmHxPw4WY0rvrwPpG4T9/9Jzq1UoV+tUojKJM8
	Ulqwf7p5DZqXZZAk70FORn32orQFlMjfOtEyvOLGnIqi2p5TzOw8M3pM
X-Gm-Gg: AYBFou2g7DSNmlUcoAyX7I377BiTo9rjTgd5Qd2+YaJI+YKMdm3vm6nvjSdN4nYNVS4
	2x/mNGirNDgeaDRAd/QHL7otwVealt8oMXqn7rB+guqdzlCJ3mB1Dkf8kAtrhSI2Y9c+fSQgeOM
	Wjt4NasgYpnNeZKyAm+I0tRYz+pPojaCW26tOOGvFcevadduXM2Epe0yOsQngERpbphsmbXFqoG
	9WPP5rtfwYRwzTGGR1PfKob8e/YI1ythj4OnagEV9tVQojuO55/+uGaPW9qRGNepimOqD1eqRIv
	4cR/368TcNlHrm5aUh5Ey52C6Ajdgt+ZKkUZN1OwOkqs7PosNUSBCXy3Rw7nzEsdKo9A58qQo/g
	S+7kHkpkDtATAg6JJuwXUSmybo7SFz7frObYr3ECMl2vCDBoeDlCPPAtdMOqk0tGVT6H1DH62fI
	/beFMGvCb0nkY1JnP/+n0o0d1YU6oMuVysM9kieGBd1FgtZIbp/GGglcpipAeQEUgpKZLi7QF5N
	Fr+rpOQZVguqNG3eQqU/dRe7EyHJVtfFUJVYG6wpRIwypF+39RzPvo=
X-Received: by 2002:adf:f5ce:0:b0:487:930:8acc with SMTP id ffacd0b85a97d-48e3eb83fb7mr2248305f8f.16.1792844077924;
        Sat, 24 Oct 2026 05:14:37 -0700 (PDT)
Received: from NB-6746.. ([178.66.130.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ece5e4asm3860411f8f.59.2026.10.24.05.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 05:14:37 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: tzungbi@kernel.org,
	linux@roeck-us.net,
	p.zabel@pengutronix.de,
	Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com,
	andi.shyti@kernel.org,
	iav@iav.lv
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] watchdog: dw_wdt: manage reset line during system suspend/resume
Date: Sat, 24 Oct 2026 15:14:24 +0300
Message-ID: <20261024121428.18862-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024121428.18862-1-a.shimko.dev@gmail.com>
References: <y>
 <20261024121428.18862-1-a.shimko.dev@gmail.com>
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

The watchdog controller reset line is not currently managed during system
suspend/resume. This can lead to an inconsistent hardware state when
resuming from suspend, as the controller may not be properly reinitialized.

Assert the reset line before disabling clocks during suspend to ensure
the controller is held in reset while power is gated. During resume,
deassert the reset after clocks are enabled and before restoring register
state to guarantee the controller is properly initialized.

Tested-by: Igor Velkov <iav@iav.lv>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/watchdog/dw_wdt.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index 2cffe337b4ea..844a5f7738b6 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -378,10 +378,15 @@ static irqreturn_t dw_wdt_irq(int irq, void *devid)
 static int dw_wdt_suspend(struct device *dev)
 {
 	struct dw_wdt *dw_wdt = dev_get_drvdata(dev);
+	int err;
 
 	dw_wdt->control = readl(dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
 	dw_wdt->timeout = readl(dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 
+	err = reset_control_assert(dw_wdt->rst);
+	if (err)
+		return err;
+
 	clk_disable_unprepare(dw_wdt->pclk);
 	clk_disable_unprepare(dw_wdt->clk);
 
@@ -391,16 +396,19 @@ static int dw_wdt_suspend(struct device *dev)
 static int dw_wdt_resume(struct device *dev)
 {
 	struct dw_wdt *dw_wdt = dev_get_drvdata(dev);
-	int err = clk_prepare_enable(dw_wdt->clk);
+	int err;
 
+	err = clk_prepare_enable(dw_wdt->clk);
 	if (err)
 		return err;
 
 	err = clk_prepare_enable(dw_wdt->pclk);
-	if (err) {
-		clk_disable_unprepare(dw_wdt->clk);
-		return err;
-	}
+	if (err)
+		goto unprepare_clk;
+
+	err = reset_control_deassert(dw_wdt->rst);
+	if (err)
+		goto unprepare_pclk;
 
 	writel(dw_wdt->timeout, dw_wdt->regs + WDOG_TIMEOUT_RANGE_REG_OFFSET);
 	writel(dw_wdt->control, dw_wdt->regs + WDOG_CONTROL_REG_OFFSET);
@@ -408,6 +416,13 @@ static int dw_wdt_resume(struct device *dev)
 	dw_wdt_ping(&dw_wdt->wdd);
 
 	return 0;
+
+unprepare_pclk:
+	clk_disable_unprepare(dw_wdt->pclk);
+unprepare_clk:
+	clk_disable_unprepare(dw_wdt->clk);
+
+	return err;
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(dw_wdt_pm_ops, dw_wdt_suspend, dw_wdt_resume);
-- 
2.43.0

