Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444767;
	b=zOPop/Z/Oo0hJi8eg3ISEvRsM/0jZMH3310ZpKLMpkCf51GO3Lse4ob7S6rvwbumHrPs
	 92C9DZeAEsVdril68g9fdfzMl9r65KrUpFWDoDHkcDICRzU6yoS4lWN+Q7vmbI9scxqTB
	 ok+QX2A+lilhhZvAXFoEW/hKzgz4NKAxIhmSgnOw43/V2LcDgmfw5ZUEa+QD/qdLTKUQU
	 IcQz1PTMBU0ksXEG+q30TIXlgdwrDtIHVtCEGAHbdqsjqEFPqs3sN5HyeUiK7jq9GYZlP
	 lxYSKSWdTu4oxP9a4A4QUVY6nbVqcLBbc/4QmPNd8e2wJ1Gkmtke1jblTtFdJY8M+9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444767;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=wNAq+21OcUbQpHXlhfVLWXEOjHxIoNjX4RhgZZq2i2Y=;
	b=gNxBVmq7o+HFIRtS67aQtULucWiQjLBpIcsOFldO7UDeugvBLCFeSI8d6b6QfV4nFKvn
	 d9DEe58y3isapDAyo1dmVUFMpCsyX0WPood/fKGU6oxHW8UWcHdw5rvmUEdfBhZwOu+Js
	 PLcomlvMiQQoZiKF2rfvfPo8iZOmibNFAFm+S7dH3vDCsDlhRtDw01rJ4x2boVd02i1FZ
	 NT3N975DSpg+5NPV6jBYWrD7547/sxJlqVm9B194IlFbE7jLg91UKTiIBztYWC5B9jhUT
	 EkD3Yh+y6yzvCFRTv/ggQSNLWRDlFlIF47vFaGtgZB+R19OnAixYxhHL8u8cWClBkNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bvY03MSE;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6EC606A324
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6EC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=bvY03MSE
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B951EC5CD5C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:20:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 831C760582;
	Mon, 19 Oct 2026 21:19:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B306D10328C22;
	Mon, 19 Oct 2026 23:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444761; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=wNAq+21OcUbQpHXlhfVLWXEOjHxIoNjX4RhgZZq2i2Y=;
	b=bvY03MSE6zkQ6mkkhRgn7HgR2Ab/wI65yq63M0dcdqVUG7fpgFcITckfrC59QFlqwuKiyZ
	O8C+Z/m9Q0FmQ7InB6vVR0YI0YKrJebzfpMDxHXTaGiLqt4VPpnUNgCDSx5DN0FQVSLgfe
	naubrtw2qI/unOhK2WqwYPYQAoVo9gJVEh6hcA0Zz4qNjPQCGaGWemm3LM5LF6mWtNbjjf
	diJGYalT/w+MiXApPILzMVeNqYBYHjsbN9t/Sb9t+aM4PJbLyoTuL9PsykraMsNZK3FyKR
	uTFi9eT54RAd5Vynxt6RNvTqQv3Mz39zbQKTHsS9iGFNpuK5qc/kOVcwMrVGMw==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/19] rtc: ds3232: use guard
Date: Mon, 19 Oct 2026 23:18:10 +0200
Message-ID: <20261019211827.126262-9-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
References: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use guard() to simplify error handling

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds3232.c | 50 ++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/rtc/rtc-ds3232.c b/drivers/rtc/rtc-ds3232.c
index d1ef9e0dad34..f6407c631d6d 100644
--- a/drivers/rtc/rtc-ds3232.c
+++ b/drivers/rtc/rtc-ds3232.c
@@ -389,45 +389,39 @@ static irqreturn_t ds3232_irq(int irq, void *dev_id)
 	int ret;
 	int stat, control;
 
-	rtc_lock(ds3232->rtc);
+	guard(rtc_ops)(ds3232->rtc);
 
 	ret = regmap_read(ds3232->regmap, DS3232_REG_SR, &stat);
 	if (ret)
-		goto unlock;
+		return IRQ_HANDLED;
 
 	if (stat & DS3232_REG_SR_A1F) {
 		ret = regmap_read(ds3232->regmap, DS3232_REG_CR, &control);
 		if (ret) {
 			dev_warn(ds3232->dev,
 				 "Read Control Register error %d\n", ret);
-		} else {
-			/* disable alarm1 interrupt */
-			control &= ~(DS3232_REG_CR_A1IE);
-			ret = regmap_write(ds3232->regmap, DS3232_REG_CR,
-					   control);
-			if (ret) {
-				dev_warn(ds3232->dev,
-					 "Write Control Register error %d\n",
-					 ret);
-				goto unlock;
-			}
-
-			/* clear the alarm pend flag */
-			stat &= ~DS3232_REG_SR_A1F;
-			ret = regmap_write(ds3232->regmap, DS3232_REG_SR, stat);
-			if (ret) {
-				dev_warn(ds3232->dev,
-					 "Write Status Register error %d\n",
-					 ret);
-				goto unlock;
-			}
-
-			rtc_update_irq(ds3232->rtc, 1, RTC_AF | RTC_IRQF);
+			return IRQ_HANDLED;
+		}
+		/* disable alarm1 interrupt */
+		control &= ~(DS3232_REG_CR_A1IE);
+		ret = regmap_write(ds3232->regmap, DS3232_REG_CR, control);
+		if (ret) {
+			dev_warn(ds3232->dev,
+				 "Write Control Register error %d\n", ret);
+			return IRQ_HANDLED;
 		}
-	}
 
-unlock:
-	rtc_unlock(ds3232->rtc);
+		/* clear the alarm pend flag */
+		stat &= ~DS3232_REG_SR_A1F;
+		ret = regmap_write(ds3232->regmap, DS3232_REG_SR, stat);
+		if (ret) {
+			dev_warn(ds3232->dev,
+				 "Write Status Register error %d\n", ret);
+			return IRQ_HANDLED;
+		}
+
+		rtc_update_irq(ds3232->rtc, 1, RTC_AF | RTC_IRQF);
+	}
 
 	return IRQ_HANDLED;
 }
-- 
2.56.0

