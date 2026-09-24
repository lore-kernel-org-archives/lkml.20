Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF13D6478
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790219453; cv=none; b=Utt/zWJhsLP7l38Zm9XohkQ9uU+RQC7YZ/PoXB4KM5LcwBlLLXaHW8/q5ftwQ95Ln6wGt9RkGjZbVpoaMcQU8WIa3CBCvqp48wQ13k1pzGY5gSC268nztMDqUq38Y4AL+/OYqL7lrzKBxsWpsxku3ZWv7acEcu3ekAfu1H1ghU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790219453; c=relaxed/simple;
	bh=Wv/Q/eibR9/8UNWYWEXMi5HVbkom6Ngkl4aD5jL1RW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nUBql/RqaL4vBWvQnYV5Jua9DGnba6GbPLqCk/aC+AKLqTAsslCRZOsNSoJ7XvfVT5bKCanoQWFYRXvximfX+jRvIASYYfFIZDyfqHXsbFuKkSn+2xQ/fTmxvb5jsOJhMxVCUKWCLWc/BcK8+hP8FBb7ePrAmQR+QfxC0Z/8XoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AMtTSHHa; arc=none smtp.client-ip=74.125.231.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMtTSHHa"
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4bfec71901fso687209b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790219450; x=1790824250; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=weznhsdlOq6RIl6RLEBM2onzEOR0sehn1VqOBbe70/Q=;
        b=AMtTSHHanAtlihvBFZRy4nae8dcfP2WXjv4X5kKeD5YKBpWq8162AwR0UkZsLX11v+
         MCG/EpsKOOccoSvy71DmJU2UBK/0vyCS89W8nlEOmK3SyCdpCV9k6ydhoJaHdck263Bu
         pVpceuTwi1OJPxzN9FQ/5exlqjkESk3VUPXOnU0wNQAdr1Touf+bhZFzKNiNCDnSqalo
         vIg8VlgLixqgEr0scuvXOqCGgs7YETBm/Jlxe5jr6BEvaUO3MXKcCRR+TTvVK8Yot1Vb
         xo5BcjMtEzJtX5rLNmcDJsOcEy3ldKgcjYBH1Ify6zzPqIJE3Zty2WBvjI4j8ZLwvWM+
         scXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790219450; x=1790824250;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=weznhsdlOq6RIl6RLEBM2onzEOR0sehn1VqOBbe70/Q=;
        b=QdnUVTnNKTCYRS3C6yi2vAC3/BRFpK/igwUb1UnaXEzGgjtb5QaBVMXlSZlFjYLY3x
         N8LGcs6GLreCvbNJWCcFOzeH9zEqAI3VCb+RQeXttQcAxiaD/Elm+Cl9TY8yIhWSt5GM
         NGyG86chbohYXpkGfApiSAQ3LCjp4XBk1ARBWXovlfSNWm+76RFPh21pGeWc3hUrhwOK
         wGThvzWskEn8bwvBLIChSVngRGj9JcU61y44ntGBqgr0FYHXZImxCa3xMTwQ+fDR9mO5
         GXNFQgCScnDSaLJwGzc5JgqH+iwFBukXojVQY7csjeRI+9OYk6OKVzEzzBzK1T+eP20n
         Y2Tw==
X-Forwarded-Encrypted: i=1; AKwUvBwDBDjlxEn2l2cEXcrsznDAKAVP7CS68c4Pl0DDM/ERcYMC/XWuijrXjIDYm3JU/QTuhnjvqqTKlQWi/mk=@vger.kernel.org
X-Gm-Message-State: AFuF++kA9q/hUK8VwqR4ei4LhK45twRQTc0Ez9M/e/8fMi4f5bAinlbR
	OMV63Kijo9K2vmy/K++Jc9TALoc1Cv5wbjv5TFa8l11lI67iVnHLkQsbVp9fIdoiKZA0/Q==
X-Gm-Gg: AYBFou1AU9pZe/WjHh0o7owCdu5jHHiCML8t0YKFuUkG4LF0MZyEQfrsiarq6qlH1nd
	mdpYPWEXQG96Ak6gnLMtkO3fTX2lGVW4alhhR3gAjPzrRz8Kgj2YKEv14mXFzCqjbG1y6FZd9Ti
	nxA5XuITVI2gIKP9R09+BxB86Cc7P1wZNMJLyumMF3uC0S6l2jGcha9sdVMcO9gVoIGKREH1VS4
	2iF57wIvtpxWNMSpVHZlGb9KbTcbexvxIx2uipZLEhGFoQX3wLgtHOmqvGTTQX4NL+34cF6J7Uf
	3iJ06EsKr8rM/HmzaOGlkhUNcgj7s+qMKvWcrXJS2HRXuprZjqNBCbfpzu367q9UOxS8kRJkDUK
	B68z+WBY6PFNZT9SukxoHWTeU6akY15LeMUPF56U2B3dEdyn82+2EXzCGKOCwfXpGMOSOcpEe6Z
	d+xS2rmtec9/TfCZ5BjLrzTpP8e3iaw/FGmkKNWUc4wuob4uNSTTJHz+NDixY16BFDlA==
X-Received: by 2002:a05:6808:c187:b0:4b9:e6ab:d07a with SMTP id 5614622812f47-4d72cb39b25mr1219299b6e.26.1790219449792;
        Wed, 23 Sep 2026 20:10:49 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c4bf8e14sm3893842b6e.14.2026.09.23.20.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 20:10:48 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 23 Sep 2026 22:10:41 -0500
Subject: [PATCH] watchdog: mediatek: Apply the driver's mode to a watchdog
 left running
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-v1-1-0970852315e4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NQQ6CMBBA0auQWTsJ1kipVzEsih1woi1kplUj4
 e42Lt/m/w2UhEnh0mwg9GLlJVUcDw3c7j7NhByqwbSma505oYxSCLXQF8uqWchHTjPG/MB3yBi
 Kf2JcAmFnzz3ZsbduclBzq9DEn//qOuz7D4S6ytZ6AAAA
X-Change-ID: 20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-6758e7b879f9
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "freddy.hsin" <freddy.hsin@mediatek.com>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790219446; l=4049;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=Wv/Q/eibR9/8UNWYWEXMi5HVbkom6Ngkl4aD5jL1RW8=;
 b=u/GAfKCmgfS6yqJtSJBYgi0CdZm5MqDZ1SAsZGK9ZcrBpAZEMAT3l9eouuHXlc8qWODTBEB1Q
 XFRXWn46T0VArMVB7GfAKkxDnqc11EQrfVB1wPFyafDxWf9KgzaTvYJ
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

When the bootloader leaves the watchdog enabled, probe only marks it
running and sets the timeout, so WDT_MODE keeps whatever the bootloader
wrote. The Amazon Fire HD 10 (2017) bootloader leaves dual mode with the
bark IRQ enabled, and no pretimeout is configured, so each timeout only
raises the IRQ and restarts the count: with the 20 s timeout systemd
sets, a hung system was reset after 37.95-39.76 s, and after 18.25-20.92 s
once IRQ_EN was cleared by hand.

Program the mode as mtk_wdt_start() does, which also applies
mediatek,disable-extrst and mediatek,reset-by-toprgu to a running
watchdog; read those two properties first.

Fixes: bbece05c0d3a ("watchdog: mtk_wdt: Remove mtk_wdt_stop() in probe() to prevent the system freeze and it doesn't reboot by watchdog problem")
Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found on an Amazon Fire HD 10 (2017), an MT8173 board that is not upstream
yet. Its watchdog node has no interrupt, so no pretimeout is set up. The
timings in the commit message were taken from the host side of the USB
link; with this patch a hung reboot resets after 18.35-18.45 s (n=3).

It is based on v7.3-rc4 but it also applies cleanly to watchdog-next,
where "watchdog: mediatek: acknowledge pretimeout interrupt" moves
spin_lock_init() ahead of mtk_wdt_init(), so calling mtk_wdt_start() from
there is safe on both.
---
 drivers/watchdog/mtk_wdt.c | 43 ++++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d9c30e4c80e3..b12ea113b63e 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -285,19 +285,6 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
 	return 0;
 }
 
-static void mtk_wdt_init(struct watchdog_device *wdt_dev)
-{
-	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
-	void __iomem *wdt_base;
-
-	wdt_base = mtk_wdt->wdt_base;
-
-	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
-		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
-		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
-	}
-}
-
 static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
@@ -338,6 +325,24 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 	return 0;
 }
 
+static void mtk_wdt_init(struct watchdog_device *wdt_dev)
+{
+	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
+	void __iomem *wdt_base;
+
+	wdt_base = mtk_wdt->wdt_base;
+
+	/*
+	 * The bootloader may have left it in dual mode, where a timeout only
+	 * raises the bark IRQ and the reset comes one timeout later. Apply
+	 * this driver's mode instead, as mtk_wdt_start() does.
+	 */
+	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
+		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
+		mtk_wdt_start(wdt_dev);
+	}
+}
+
 static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
 				  unsigned int timeout)
 {
@@ -440,6 +445,12 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 
 	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
 
+	mtk_wdt->disable_wdt_extrst =
+		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
+
+	mtk_wdt->reset_by_toprgu =
+		of_property_read_bool(dev->of_node, "mediatek,reset-by-toprgu");
+
 	mtk_wdt_init(&mtk_wdt->wdt_dev);
 
 	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
@@ -460,12 +471,6 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 		mtk_wdt->has_swsysrst_en = wdt_data->has_swsysrst_en;
 	}
 
-	mtk_wdt->disable_wdt_extrst =
-		of_property_read_bool(dev->of_node, "mediatek,disable-extrst");
-
-	mtk_wdt->reset_by_toprgu =
-		of_property_read_bool(dev->of_node, "mediatek,reset-by-toprgu");
-
 	return 0;
 }
 

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260923-rbrue-suez-upstreaming-mtk-wdt-dual-mode-6758e7b879f9

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>

