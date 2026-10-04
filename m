Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA23921F6
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 22:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791152012; cv=none; b=fvEgS8wT+6NGkAy8B1ncIVPXe5IJ5H5An9lvHemvS9FdcYUn0gAPJWCdTFefEAcVfVc6UG29giL9J3ebt6OOpl43+WdHlKlm73OAZVGVYsxIdz5KUGjKsuLOJoiXwtWQF7DW9RClCpNcz1I+L/iuKOpD4fy7gJtPVaSKEnadnl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791152012; c=relaxed/simple;
	bh=Se8Ax4+TIBiCq3yGIY0Rj1lMt8PKeNTEx1PQrZt26lc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VHBUjHuDSfno/QFlMFnJb+OW/oQtpcIKZFZIjC0JAZ0RZaAEbL3sa1Z4dRR4dKJb01MhmzOA48WnhhKj9MAScggHT8A/odrK26G3z2UjPnwX7vnWWrTO5Kig17BbjP3KotII2GXAFXaNsK/OsqcV/c1hcdmQ7WF823VRlU3eDHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJyGsCJm; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJyGsCJm"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-35118a5991dso608258eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 15:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791152009; x=1791756809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qol00xKd0T0+apHbVQX4zHawmYMyVklpl08y4ubxCGE=;
        b=VJyGsCJmAY/BCKN4B0x3Dq7iQEg416pRnlTbpTNiPacNbpgBANQLItH9DvA6G3DAMe
         BD/nG061rQ0IwDvo1rynA9YedxI2QrciTeN9g9vL04JNPlVwXx/whUn08JEUgxKJs4Yd
         L8g5y6/sAi2QUhJ/odf3HxxupJtC+KH+M8pdZKP7t75O/399dj2dxlT9qE+tCbaffGoO
         ObYTFkmZZd/FRFUPNem9yJY3IQUYzNnQXvXQT7WY0c1hQfHEdOWkcIcqKhs8toQ7o0Ez
         Uu2dbVNRby1qkQ95cZc8jqRt6TBRhu9ma6rUeoULKbLAq/FXtaVRYXfJkcgR17k1wI1Q
         /96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791152009; x=1791756809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qol00xKd0T0+apHbVQX4zHawmYMyVklpl08y4ubxCGE=;
        b=gZyIdd3BpwOfq+kBL0NjmUdUXU0oZhsEwX2axZjf/afLO+ySd84/eK62TDvoPwcILy
         YqtVRvneIG1SGS4s67ws4RtCH9Rp+28g+iAOPf4eEcs11UIaAi7CYqLe5xxXywDgE3uA
         tDEuQXR3o1CfsFX6hgfOL5sAWVfnzact0HJLbo7pf6nmyQftqF7UnSGby+dy5QCLkX52
         tv62H0710PGtjvjPBs5Qieh5Vu4KCv5rFDIIX6aFwFSEKibGjDwQRqFgFWb4jO/glbJr
         0I0hlL881yaiy2i8qR9rBeXCBnaeBthGMzoXh4HFA6qdlYp3s0LqDImErwrGmHodfVJo
         ImDg==
X-Forwarded-Encrypted: i=1; AKwUvBzCNJEKV5t/KP5xQZYdhLanOwRk2n8gI0q443bC+sbmgGTNk2DLN+1u3fQyZZzqTZrVe8OKTI3KA3iTsLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2NWyh13dehhu+nFbq56mxGG8URPeGiViSAi6azslmVl0xnHk8
	qiHnSVd1XAisPY4ICnTOaJV/zPALZufWcTeghE3ZnHMmpCD7d1PQtq6Z
X-Gm-Gg: AYBFou27aJ7oyoTXp68bupp2GcS6qOzSbU/vEX6xgJMYChuKru78iXRSmrZEskg4X/3
	i4Dq2dUud8d6JhB+yyoIzTwu7RHTpqiEOEA1026y+JrqVQCRE89BRlxm2H1ZNLXpi+pYAA9aAPD
	nWaHax/oIBcj2TKi2qv4/J3wNZhQbX487pgCsLwjs/7ygQ7Ve/g+jbVrMkmzTlbFGVmbucz5au/
	V2isGgw9s8TvQlhUDQ7D/vxNQmg4CGORO0ccqjDhBibG5hQffJVH2K/cEoSie7//ixz4/JGWhKk
	3uDMB7nCNwxNHbfGKRjdALLp149wDvqQq+QGZ93v9UztlQPBk0GHM19ZmWnxAEj49OvFGM2g/R5
	TDyTF3DTXaUIBdFQ0qzGfLPztyManlIZD8Wcve0Xl7M4pMPT4oUVS9m0ddY9OINuD56tShGPNV5
	kdDe4cW3G8qkVKupM/Ujcpdp9T8zybjOn5Mo95ZtoM7sMTCBnIijv8XQT7buYI2zXe9fTda7ai8
	ZILkKtDI8FaC0Vikfchu+MBpaq8bmt89g/6hqT05a7wVPbLG2+Zl9Xh6ZVzfWZifQBNX//CvseA
	iLOdrALViYtli1stND/+OROMdFfmCDIGJe+FuU/nFFokKt6Z
X-Received: by 2002:a05:7301:782:b0:351:1e72:735d with SMTP id 5a478bee46e88-3511e7277b6mr5112361eec.19.1791152009426;
        Sun, 04 Oct 2026 15:13:29 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3512718a18esm8976988eec.17.2026.10.04.15.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 15:13:28 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3] rtc: stmp3xxx: use devm_platform_ioremap_resource()
Date: Sun,  4 Oct 2026 15:13:27 -0700
Message-ID: <20261004221327.416323-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with a single devm_platform_ioremap_resource() call, which folds
the resource lookup and mapping into one step and returns an ERR_PTR on
failure, checked with IS_ERR() and propagated via PTR_ERR().

Move the mapping ahead of the devm_kzalloc() so that an error or deferred
probe is handled before the rtc_data allocation, avoiding needless work.

The fsl,stmp3xxx-rtc nodes in imx23.dtsi (reg = <0x8005c000 0x2000>) and
imx28.dtsi (reg = <0x80056000 0x2000>) each provide a single
non-overlapping IORESOURCE_MEM window, so the region reservation now
performed by devm_platform_ioremap_resource() introduces no conflict.

Keep the alarm IRQ in a local, as it is only used in probe, and fail
probe on a platform_get_irq() error instead of passing it to
devm_request_irq(). Drop the open-coded error messages, as
devm_platform_ioremap_resource() and devm_request_irq() already
report failures.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: fix compilation.
 v2: add platform_get_irq error check
 drivers/rtc/rtc-stmp3xxx.c | 35 ++++++++++++++---------------------
 1 file changed, 14 insertions(+), 21 deletions(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index 7afcd14aeee5..9ddb4c0e39c5 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -56,7 +56,6 @@
 struct stmp3xxx_rtc_data {
 	struct rtc_device *rtc;
 	void __iomem *io;
-	int irq_alarm;
 };
 
 #if IS_ENABLED(CONFIG_STMP3XXX_RTC_WATCHDOG)
@@ -245,29 +244,26 @@ static void stmp3xxx_rtc_remove(struct platform_device *pdev)
 static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 {
 	struct stmp3xxx_rtc_data *rtc_data;
-	struct resource *r;
+	void __iomem *io;
 	u32 rtc_stat;
 	u32 pers0_set, pers0_clr;
 	u32 crystalfreq = 0;
+	int irq_alarm;
 	int err;
 
+	irq_alarm = platform_get_irq(pdev, 0);
+	if (irq_alarm < 0)
+		return irq_alarm;
+
+	io = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(io))
+		return PTR_ERR(io);
+
 	rtc_data = devm_kzalloc(&pdev->dev, sizeof(*rtc_data), GFP_KERNEL);
 	if (!rtc_data)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r) {
-		dev_err(&pdev->dev, "failed to get resource\n");
-		return -ENXIO;
-	}
-
-	rtc_data->io = devm_ioremap(&pdev->dev, r->start, resource_size(r));
-	if (!rtc_data->io) {
-		dev_err(&pdev->dev, "ioremap failed\n");
-		return -EIO;
-	}
-
-	rtc_data->irq_alarm = platform_get_irq(pdev, 0);
+	rtc_data->io = io;
 
 	rtc_stat = readl(rtc_data->io + STMP3XXX_RTC_STAT);
 	if (!(rtc_stat & STMP3XXX_RTC_STAT_RTC_PRESENT)) {
@@ -354,13 +350,10 @@ static int stmp3xxx_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc_data->rtc))
 		return PTR_ERR(rtc_data->rtc);
 
-	err = devm_request_irq(&pdev->dev, rtc_data->irq_alarm,
-			stmp3xxx_rtc_interrupt, 0, "RTC alarm", &pdev->dev);
-	if (err) {
-		dev_err(&pdev->dev, "Cannot claim IRQ%d\n",
-			rtc_data->irq_alarm);
+	err = devm_request_irq(&pdev->dev, irq_alarm, stmp3xxx_rtc_interrupt,
+			       0, "RTC alarm", &pdev->dev);
+	if (err)
 		return err;
-	}
 
 	rtc_data->rtc->ops = &stmp3xxx_rtc_ops;
 	rtc_data->rtc->range_max = U32_MAX;
-- 
2.56.0

