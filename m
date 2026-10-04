Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331B03F0AA7
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 22:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791152951; cv=none; b=HlHlr7ToOPucTcm2mbQy30OJGSmrtdQr4E8TexbjFCKSg89e1ntWM3EIgPbA009xKsu38+3orse81OS2NrwLTL2TsDW1X5zSk9CwMsG9xG77pIZQld7UXlFexHv2GvosYBKD05uuSie/3VSEhZkB3nQJIz5meyqdMNZmnHo5yMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791152951; c=relaxed/simple;
	bh=Aesyo/XDVIJFxKR36YrAJDFjzW6U69fG6Hh+FvEej9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q1xtDsmdmL8k4JuX4fdpi41ddeuq6oiUMorxHNuTFlxfHD2ecQHdfa06c6gux8bTqaTL3pFbkuQEnN1JaPz4WtztMf0oRWoY+uMEZW0Tg34EhchWITCQyXY0TuP6/DZa7Oa1jn0uMGpY1S+3TlDK3vbERH/beug1ztYL92TWWZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lPs7toGF; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lPs7toGF"
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-8807e5b8fa9so594495b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 15:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791152949; x=1791757749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kvv70F+iiRq14pIcsIa/NBOXEYCFn2M6VVXOkr13wi8=;
        b=lPs7toGFhI/3eOg4eeEK6mikGFQ8KPgRJGwf/kQT4AurgWKO6WfyUQQ3+cWac5eQEV
         BYTamT4L5rLSGmXfs2FM/SidLfDVoSI07KQW2+NijMokNyE5MEUrcYdKbMimfrwmUo5Q
         ezxz8j7ITf/hDDoN+DYAjhZTuiEQJpfcvtQQMWsrlkhRNKm5k0x05UI486JvgEHRHXQk
         nrHNj3pPwKXRZRxTNNN1XAmt9JiCVVy01ZJxOkHUI/sk868Y7AWuu2gNCnw5RVbN6s9F
         gI0/qbNausuoiDCCeO7n816PFh+4JUbrtzBIt/DEPA5g6QsPb2b1Me5uh9tJhQfZ0E3h
         oJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791152949; x=1791757749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kvv70F+iiRq14pIcsIa/NBOXEYCFn2M6VVXOkr13wi8=;
        b=EI37RyoecyHXQvFbFO6B9EuIz0UiVDe4RGTQNQ9O1sz29VskihyMtpojK9DrPzeT4/
         SjlmpPWkhFiC4MsRo+/HCVx9kDeTnYqG+B09NiFhMXlQrM/25PYXKRnWKNd/q8txSj3y
         bLzD82M/m7TlDwvEt82Tt0wW2cIVHIaoaQf8DD74fzqjer29TpNj29a9/SS8ZP+a3Gpl
         674zZ5ADz0bzYLFjUdNlt8JLPKiBuuriArkUiFnRmEzsOBG+q/GDnu0/F4AGahoAq/l2
         FlUmM0mFpSUGPa4XmPdOQLw43SNgE53t50TdmS05My3TA1pcjm2zpXBXtoV1Ar01luH4
         WPbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHk1m7+V9TNqWoH8cM1wzZCg1plQJEFSxjvZ9JuwxhN54sRH6Lue6SWzHRX5A+NxMEAJzj3Obs2yib9Gc=@vger.kernel.org
X-Gm-Message-State: AFuF++lDbtQdIoT/uVnZxnCiYE5pv3xcOaKfbSv/gC7NTgGT26zShE+v
	rZ8Gr6Q1zkOYdQ/v1SU+NgIC8u0xCPGruhhQZVVfebnOFOWzi9zPuJDl
X-Gm-Gg: AYBFou1WGwl1buQlLvqoWzPpZ/xQzPRBhhulQmQKnVrFCihdB2NwGF3WSFlOr+RDx/P
	iuxDMncekug7LNDHIEVyL/5uotgOgxzULI6ya2t757dDLKpA8cgHrgUcb2G8qg8BZE1UdYU22U3
	q7xZ3JXczNzCiOlEotuyGNyDID5rGwj8gO5mzem/0x+FSb0gwBePD7TEaPTg4ydEEp4KFmN/pAV
	vywn6lUlQhKABUKGfleVJBaZ4sHK3Bb4UcE/GKIkbZxaO53zuhOWaBQYOMIq5miqlbD5En5uRid
	mEN5Ofg1qc1k5W5U0a9y29AwoaoIvQ2Ov1LmOLBdbMRNPh0Eeow6Mdb5IjU3u00Y3OXz/+yhLNr
	raX03Gjrt+zIzq8RyS8geAGPlG0BXyj68cbNhfSmBTXyENyAblZYrWmnlTdu4cSysZWK8wgAW7B
	B1NIrR9tuPEQyXKlNErBHVWVYMBdd08weOrSjDJnrzNjG84FGHds7ygSz+4ia4FB10A77Qf4vC5
	beY40gm/sVsOjjak1LrPSYeRuFuWG5kWQJcLu1gYUehIbA1vUsLSkZOpl5trGJsG2ucDnJNdZSv
	x4+UYlf0Va9cUjrXexaz+Csyi62bVLf+MkDV497yvYQBsWBY
X-Received: by 2002:a05:6a21:670b:b0:3d8:5a37:549c with SMTP id adf61e73a8af0-3e0bc9f8ccdmr9151189637.7.1791152949454;
        Sun, 04 Oct 2026 15:29:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c599e7asm2820705b3a.34.2026.10.04.15.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 15:29:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] rtc: mpc5121: request IRQs after allocating the RTC device
Date: Sun,  4 Oct 2026 15:29:07 -0700
Message-ID: <20261004222907.437878-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Probe requests both IRQs with devm_request_irq() before
devm_rtc_allocate_device(). Devres releases resources in reverse order,
so on unbind or probe failure the RTC device is put before the IRQs
are freed. A handler running in that window passes the stale rtc->rtc
to rtc_update_irq(), which schedules work on the freed device.

On unbind, remove() first disables the alarm and update interrupts, so
only a handler already running on another CPU is affected. On a probe
failure after the IRQs are requested, remove() does not run, and an
alarm left pending, for example a wake alarm from before a reboot, can
fire in that window.

Request the IRQs after the RTC device is allocated and set up, right
before registering it, so devres frees them and waits for running
handlers before releasing the device. An interrupt arriving before
registration is harmless, as rtc_update_irq() only schedules work on
an allocated device.

Fixes: d53d4ae981d0 ("rtc: mpc5121: simplify probe")
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/rtc/rtc-mpc5121.c | 48 ++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 23 deletions(-)

diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index b90f8337a7e6..4a03c5280a24 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -307,30 +307,9 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 
 	platform_set_drvdata(op, rtc);
 
-	rtc->irq = irq_of_parse_and_map(op->dev.of_node, 1);
-	err = devm_request_irq(&op->dev, rtc->irq, mpc5121_rtc_handler, 0,
-			       "mpc5121-rtc", &op->dev);
-	if (err) {
-		dev_err(&op->dev, "%s: could not request irq: %i\n",
-							__func__, rtc->irq);
-		goto out_dispose;
-	}
-
-	rtc->irq_periodic = irq_of_parse_and_map(op->dev.of_node, 0);
-	err = devm_request_irq(&op->dev, rtc->irq_periodic,
-			       mpc5121_rtc_handler_upd, 0, "mpc5121-rtc_upd",
-			       &op->dev);
-	if (err) {
-		dev_err(&op->dev, "%s: could not request irq: %i\n",
-						__func__, rtc->irq_periodic);
-		goto out_dispose2;
-	}
-
 	rtc->rtc = devm_rtc_allocate_device(&op->dev);
-	if (IS_ERR(rtc->rtc)) {
-		err = PTR_ERR(rtc->rtc);
-		goto out_dispose2;
-	}
+	if (IS_ERR(rtc->rtc))
+		return PTR_ERR(rtc->rtc);
 
 	rtc->rtc->ops = &mpc5200_rtc_ops;
 	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rtc->rtc->features);
@@ -356,6 +335,29 @@ static int mpc5121_rtc_probe(struct platform_device *op)
 		rtc->rtc->range_max = U32_MAX;
 	}
 
+	/*
+	 * Request the IRQs after allocating the RTC device, so devres frees
+	 * them, and waits for running handlers, before releasing it.
+	 */
+	rtc->irq = irq_of_parse_and_map(op->dev.of_node, 1);
+	err = devm_request_irq(&op->dev, rtc->irq, mpc5121_rtc_handler, 0,
+			       "mpc5121-rtc", &op->dev);
+	if (err) {
+		dev_err(&op->dev, "%s: could not request irq: %i\n",
+							__func__, rtc->irq);
+		goto out_dispose;
+	}
+
+	rtc->irq_periodic = irq_of_parse_and_map(op->dev.of_node, 0);
+	err = devm_request_irq(&op->dev, rtc->irq_periodic,
+			       mpc5121_rtc_handler_upd, 0, "mpc5121-rtc_upd",
+			       &op->dev);
+	if (err) {
+		dev_err(&op->dev, "%s: could not request irq: %i\n",
+						__func__, rtc->irq_periodic);
+		goto out_dispose2;
+	}
+
 	err = devm_rtc_register_device(rtc->rtc);
 	if (err)
 		goto out_dispose2;
-- 
2.56.0

