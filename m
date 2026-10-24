Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792850947;
	b=kuh1IyGvn1GKqSrD/enPoSnkaRorfpwPi4QKHsMDw4JXhxbr/1hrwCtBJdhC6lGglZBd
	 ghm7lH4BNXSDg8+bngeG2YOqiWS+vDvgWUQgLkg3IOpBiECV0ZrQa0dhPi9aT5Rr8JEaF
	 j7KjdGl2X5Rg9OCAW1hL+/WNjFUcP32Hxmxxegqzaevv/sOqVpOmJkE6HqZ18xvzTbu/+
	 yYu6uunLZ3DTlrAWpeqEUCOJEGsTPRoQxOVel7YCzmLeHKvyx0TS7ktGhFCdGJ++X1Fjn
	 usMhc6vYllZIzDXgcnDrJ649nUkdu1moqIlEsgcquPmxZk9wXOprCmBtvG2KYgCS7dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792850947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LWiD1yjT+YEVwaexWWeTMFMBt0QDUN6UoMpULATc+5Y=;
	b=F7+Pg9kCGHmi+VIIcJE6a1Rjy7gAqLQYOHE5Yw7ozLN5vfOMYgCZgjbBUGYF/pKnOI+W
	 jnE7b+KLbmHZNJOfBY3eMskGziIkUR4/W8lwPkUvG5k/QoEmoWylR9INlYg9m3kjpHfaJ
	 zNLbFXDHLhN0q1oX74S37EVrDUeZltrZGzCgPxKRMqGSOgEF9PRvXnbkL+0NA4ozVPVG0
	 WIDLyakm1bnMSrVGFLJ2ghJIznftY3jMwpRc5CYYGva87SM5WV828cUKYdeAqhYJSn350
	 ojYKQC8BBy/kgPeAuLCgvr1zVbB+GpRy9BR7lSTjFT/km8NRGbJPtDFG5Gd6jV5jPFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OoM4KrtO;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D7F606A321
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 14:09:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D7F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OoM4KrtO
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so3770285e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792850945; x=1793455745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWiD1yjT+YEVwaexWWeTMFMBt0QDUN6UoMpULATc+5Y=;
        b=OoM4KrtOF29pHVx3Socm2Hh3G06RinOowrkG3/SkZ7hsqoyd5Xgz/HptTMy8rBPmoZ
         rlO8mc7eVj7f9LXbTkUCQCHKf6HeorxWqcXF9TBoNeB1O6Yq2PmYefkrCqQQzfcUjdvM
         5E42iec1lyHTBeyCuBvX2qIIcTZfSykOSWgUyz+Lc3yAzbFttjIbhlE9PHiQx4/f/U/i
         lEGUUj5ozRi8TlqAlnxZH8YU7DOo+4gFken2kCd6QRryc2W/Tpt1ca8ozGn7fY/BvIKv
         XY41BsCyN7qiOT/kcvMiGpE+dgC5lzV6743gOusiwvD4iQbF+ROHUU6TgpEplAeY2FZa
         7oEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792850945; x=1793455745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWiD1yjT+YEVwaexWWeTMFMBt0QDUN6UoMpULATc+5Y=;
        b=oT12NsELQkIYbFlNcTljrr5y/w8aid5QJVZE765BrA+ijrS7ZvRgAM/EH9jwAr3LDX
         JkLY5gbho66Fn4lopCyQ4b+t+fiv1BUdlu3zOVTkSvu/vK5zsWML9A3MpGPnafDmujKu
         P+zeqVyCUp1C2Dtjrhp1nBXb6rb6X/RikpHnIy55sEdSYNwbEccYI80lYZyvVz1TjpQF
         xx30EB8UGPpYQNRB+0rJkV5ln9zNptPQGZieGjU1n5ZYIX8fHEuBjllZQ1B1P3qEBX+W
         +j9Veys7nq8b90GPnaFDuBrrB2+3ttpwTjTalDpGngN2+YdzgMJ0o1wxCGFCBTeDspgn
         tGRg==
X-Forwarded-Encrypted: i=1; AKwUvBwr8tBm6o8nT1pcbjDdO8NLKkp4pa4cgnnlKKYAg7pG4KlRskldy9ftodj+IDat01tyhKjyaYouyVdrkSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYbDZrxNUzjUbZpnf7y5Xy815uWG6RXEoNjbRD1f1CAce4xTm8
	tJBnQ7q7kYKl/GbeedEjGn2KK+zn5ihpcDKcjwp8tWXuE6iLoYCV2rGD
X-Gm-Gg: AYBFou2b6GWiOgoF0lfnJAEbCbiqq4sXx4VI6bnr7MLU6agCEHBB5djaV8oTFiH7vtO
	WB462DBth6i5IybylWMeQIngqS4luHSioS2Kcqbxbf43TZosdItqm2GcNX14sfxntUACMRixnD4
	MQi9LAocb0pa3eycwnEcwLqWoqCk0XOEh0lH+rMfQJgNgNr3oZaHoczFU0PXXbqW6L5zahUhgqm
	2WpCPjcosHgRfHfcJ250G78lbOSjgh7X5G6eiVMDMXcyB1qdopEL4jnmgmBlinT9y1FOMA2D8DJ
	H5q/Nky2PfVbICjOYeYKSfh1a/17n6RUXWXx4PhWKvwBZ2HGhWyP4iEDsi67gkUA4i8k7/K2qws
	uUw4x12Iv6Yi9BZ6NtZW1L6hfGy6f+7N5BBT9hyUF3PKpOCjbvPopiYY2Y1u5LLrws4k+goofcp
	S1VF87zbUZD8BbNl0OJP84TzSuXdl5l1UbaMFSBNtEmcItg8D+uANLKeMx8iTGrWeeH609YLRXh
	LPQbUkEDVGTHCg2Y/OQJ1lGvAFwH+0Jis/7RC+ybkwqoJw+v5aEk25NvwORkhYlAsmqbw/el2HU
X-Received: by 2002:a05:600c:8286:b0:4a2:bef:ae5f with SMTP id 5b1f17b1804b1-4a35ace0b88mr26302695e9.29.1792850945354;
        Sat, 24 Oct 2026 07:09:05 -0700 (PDT)
Received: from NB-6746.. ([178.66.130.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08643dsm46716525e9.4.2026.10.24.07.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 07:09:05 -0700 (PDT)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: linux@roeck-us.net,
	p.zabel@pengutronix.de,
	Sergey.Semin@baikalelectronics.ru,
	mika.westerberg@linux.intel.com,
	andi.shyti@kernel.org,
	iav@iav.lv,
	tzungbi@kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	wim@linux-watchdog.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] watchdog: dw_wdt: manage reset line during system suspend/resume
Date: Sat, 24 Oct 2026 17:08:51 +0300
Message-ID: <20261024140854.25664-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261024140854.25664-1-a.shimko.dev@gmail.com>
References: <20261024140854.25664-1-a.shimko.dev@gmail.com>
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
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/watchdog/dw_wdt.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index ebd27ee684d1..684e0cb104c3 100644
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

