Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06EC459AE9
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 19:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792094320; cv=none; b=sDOnAa5Jr6O1Qh/mzycA24xWcqp3Ur/GSoYYwSSW1gfWtiL+dpDvChmYur08YhQA4rNco7vDUNLdJRtVSnnnNs/gOe6XwAxTwcXTaSNADW9+AGp3hxiFYiJalWPzgkpSo1vYl9glpb3SyDoDDhfx8fzXmilJqEtVSvZsWL6Nnk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792094320; c=relaxed/simple;
	bh=oi0NFD2sxeVLggbxOBd/VjtlvLSmQTyJFOiBqgC2sGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sEEXfT+0/OfjCyylonLGyZj1y4C35bFFa88QP4Qxc/aL15pQ2sWo/94Qp3F98L57LFT2nOF/GpQEFy/xEPullX5e8qR6NtwULXpTz54jURk2m4/AaBcaDNFkPCuasGdCFg4PNADxoqNq9trM6toMQgcV/PCOZmGUc3/JbaMKkhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaJRLXO/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaJRLXO/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so30521625e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792094317; x=1792699117; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=krDwWoIc/Tok4StKGZ30+wtmqm7bSRyzfVvLkgkAXg4=;
        b=qaJRLXO/UvLfXNY/+XrQWSpbG7sdbbliL3y4T7f3rYf9kITvBJalo3up79Tvz4ITyW
         J8frvaU+gyVduwI2UHwF/DhjXZzbtQ7YtXp1dUadUhKF/qmspQWWvgJHxXCufyhzCpCa
         BoyhJkscne/Bge7xgcizF5Rmi97Y3x6O7MeoF08DivLKF+5NUkP4zRPruRqm3lFhgYTO
         b+RJd0v1Q/vz6w0VE0ZKSPsZfFCv9URB+6gq4Te7kU4bTa+lXr38FQ7TGwtqsQXjTEBi
         at+42C14v/m8VvasMUo7J6zSmCTaG/1s14P/FapaVfbIIk7tQ7qKYohIpDCBw8QBos6M
         ePRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792094317; x=1792699117;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=krDwWoIc/Tok4StKGZ30+wtmqm7bSRyzfVvLkgkAXg4=;
        b=dVf1Kp37a64DVFPNCFRdVBhYgFRmC3jNQ4JTyhSDizOx106M26gXPf0OSUJmhzg7l7
         jrAu0KQrWcIVPeyYhzQGbqvRHO+z3P4d+S28XFG8EmzLqoOG5F5r91jfMaujNXsVVbOH
         ib4aLy2Pl5ervRGThUTyHSdkHpZNqs81tZGwE4Cjg8hxryXvpPHaDPgbkUPZWMge2Nb6
         6b21qCX7gsw0bFkoseP7sIw3Ox7MgebwwOMPkPlOoVoxmRPKkqADB8suHsaz1Dxtk3I7
         eVRHjpH0Tggz0/bBTDNZPUbB7Fx2E6uAsXMLXLC+4GjPW044yVAgswI2A+W7WP3zQBeT
         oITg==
X-Forwarded-Encrypted: i=1; AKwUvBzITDOnNd8kfpNJhj6dMR4Lgz+R6DOHoyGUtMbz995FHUUBIm6TRlC0Ki20sD38aX01eDNpvpudHTJqNbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVI4dDR81uSox0uNbVdO/+HVj4VgN2Wi+zCwnAEGIq8FxGtcAW
	Buudy3xrke0GjUAUzWvuS004JDq88nb5hpYQyUbTRgUhp3CeTM/kx8Al
X-Gm-Gg: AYBFou1Q81PtLDuet4mWq6DnYm/+EXlz1TfGrXMEIGFIO5a+Gxnem6vX4ZyC+3tF0IE
	y67iBc490pxzS1dfaVieJ44KFyhXEa8H7611u6PVyaW/9rRSRTppzHZ7XAG5bf6XptR3cU5p9cv
	37YwmPnOsZZp5+0amsuD4hG54KPztucUPi+byljfXE4q1FvyD+g81wXRjruswEA7qyvOiq5Pg+Q
	JSXqAVom/0LRo0U5K+zt1gr4wq86Yaa1G9z0uqmmvOQnoXLyQnc2uwWIATKqUt53jvl1Po9zFW/
	PYZRDHhJ9EnIo4ubie90SatOStuleywVOoSXNp2v37POhpoP/kLLkj5LII+qqLEphFHg5SZr+LK
	/QduMJr4NeSYUbPMRS8ieSTtgInF1nO4joEwx5ThL5YsJIEo5bexs7pd4HXOEZZr5VLb5dvDaEi
	7lp8Tfd9YiP/CAtdHvcmqyAYVsxHcQT+7buQ6vEcGOHAJjHFxovQ9iXCEYPy3MqbWXsHcNv6E1i
	5e4HA/S1AliDcZwqG0cB3Hy0fSC3ZTFi3d19QqZcNnn+ASPwMMcOll7iQPh6Kwrb0YGsvjmWS8a
	xVZyb4HlwVJjS6f5JiK4n+y9NefCUE9ouKww6tS/Zs96Gyfw52b6CvyqhpJW/hLsKQzzAetFKe5
	NZQEgrSMEAGRYt+7RlOMs+7Qtd7WV+1UP2Ps=
X-Received: by 2002:a05:600c:4e4a:b0:4a1:ac66:6ac8 with SMTP id 5b1f17b1804b1-4a1c7fa065fmr11679165e9.4.1792094316874;
        Thu, 15 Oct 2026 12:58:36 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503862sm166375f8f.46.2026.10.15.12.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:58:36 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Thu, 15 Oct 2026 21:58:35 +0200
Subject: [PATCH v2] iio: gyro: mpu3050: add missing trigger cleanup on
 remove
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-mpu3050-fix-v2-1-53f73581e62c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQ6CMBAAv0L27JpuoaKe/Ifh0NICm1ggrTYa0
 r9bOXucSWY2iC6wi3CtNgguceRlLiAPFfSTnkeHbAuDFPJEggj9+qqFEjjwG6lRum2tkvJioBR
 rcEXvt3tXeOL4XMJnnyf62f+fREg4KGWEpfpsXHMbvebHsV88dDnnL0Ln0/2mAAAA
X-Change-ID: 20261011-mpu3050-fix-145a77d5229b
To: Linus Walleij <linusw@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dingisoul <dingiso.kernel@gmail.com>, stable@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792094316; l=3915;
 i=joshua.crofts1@gmail.com; s=20261015; h=from:subject:message-id;
 bh=oi0NFD2sxeVLggbxOBd/VjtlvLSmQTyJFOiBqgC2sGw=;
 b=Z4KruJHYUtO7JqxO7hB8a8rCHcUK7BTCPb2J4xJNlIyIT0R3zvqV2nMdEqKRoBJjEsykJ9esK
 JPo7XAOv3n+B401Hv8tDAQGRL8HVvUBtEC3nRDywsoN/1QuM6dgWbNx
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

The mpu3050_trigger_probe() function registers a trigger but
mpu3050_common_remove() and error paths in mpu3050_common_probe() forget
to clean it up, causing a use-after-free bug.

Add the missing iio_trigger_unregister() function. Additionally, change
the mpu3050_trigger_probe() function to assign trig only after it is
registered successfully to prevent a null pointer dereference using a
local struct iio_trigger.

Reported-by: Dingisoul <dingiso.kernel@gmail.com>
Closes: https://lore.kernel.org/all/20261010203601.1686148-1-dingiso.kernel@gmail.com/
Fixes: 3904b28efb2c ("iio: gyro: Add driver for the MPU-3050 gyroscope")
Cc: stable@vger.kernel.org
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
Changes in v2:
- Add a local struct iio_trigger and assign it to the data struct only
  after a successful IRQ request to prevent a null pointer deref as
  pointed out by Sashiko
- Link to v1: https://lore.kernel.org/r/20261011-mpu3050-fix-v1-1-f55b0d138be4@gmail.com
---
 drivers/iio/gyro/mpu3050-core.c | 45 ++++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/gyro/mpu3050-core.c b/drivers/iio/gyro/mpu3050-core.c
index 07c0f9011c63..a887b65c0d18 100644
--- a/drivers/iio/gyro/mpu3050-core.c
+++ b/drivers/iio/gyro/mpu3050-core.c
@@ -1051,14 +1051,14 @@ static int mpu3050_trigger_probe(struct iio_dev *indio_dev, int irq)
 {
 	struct mpu3050 *mpu3050 = iio_priv(indio_dev);
 	struct device *dev = mpu3050->dev;
+	struct iio_trigger *trig;
 	unsigned long irq_trig;
 	int ret;
 
-	mpu3050->trig = devm_iio_trigger_alloc(&indio_dev->dev,
-					       "%s-dev%d",
-					       indio_dev->name,
-					       iio_device_id(indio_dev));
-	if (!mpu3050->trig)
+	trig = devm_iio_trigger_alloc(&indio_dev->dev, "%s-dev%d",
+				      indio_dev->name,
+				      iio_device_id(indio_dev));
+	if (!trig)
 		return -ENOMEM;
 
 	/* Check if IRQ is open drain */
@@ -1115,30 +1115,29 @@ static int mpu3050_trigger_probe(struct iio_dev *indio_dev, int irq)
 				   mpu3050_irq_handler,
 				   mpu3050_irq_thread,
 				   irq_trig,
-				   mpu3050->trig->name,
-				   mpu3050->trig);
+				   trig->name,
+				   trig);
 	if (ret) {
 		dev_err(dev, "can't get IRQ %d, error %d\n", irq, ret);
 		return ret;
 	}
 
+	trig->dev.parent = dev;
+	trig->ops = &mpu3050_trigger_ops;
+	iio_trigger_set_drvdata(trig, indio_dev);
+
+	ret = iio_trigger_register(trig);
+	if (ret) {
+		free_irq(irq, trig);
+		return ret;
+	}
+
+	mpu3050->trig = trig;
 	mpu3050->irq = irq;
-	mpu3050->trig->dev.parent = dev;
-	mpu3050->trig->ops = &mpu3050_trigger_ops;
-	iio_trigger_set_drvdata(mpu3050->trig, indio_dev);
 
-	ret = iio_trigger_register(mpu3050->trig);
-	if (ret)
-		goto err_iio_trigger;
-
-	indio_dev->trig = iio_trigger_get(mpu3050->trig);
+	indio_dev->trig = iio_trigger_get(trig);
 
 	return 0;
-
-err_iio_trigger:
-	free_irq(mpu3050->irq, mpu3050->trig);
-
-	return ret;
 }
 
 int mpu3050_common_probe(struct device *dev,
@@ -1260,7 +1259,9 @@ int mpu3050_common_probe(struct device *dev,
 	pm_runtime_get_sync(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
-	if (irq)
+	if (mpu3050->trig)
+		iio_trigger_unregister(mpu3050->trig);
+	if (mpu3050->irq)
 		free_irq(mpu3050->irq, mpu3050->trig);
 	iio_triggered_buffer_cleanup(indio_dev);
 err_power_down:
@@ -1278,6 +1279,8 @@ void mpu3050_common_remove(struct device *dev)
 	pm_runtime_get_sync(dev);
 	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
+	if (mpu3050->trig)
+		iio_trigger_unregister(mpu3050->trig);
 	if (mpu3050->irq)
 		free_irq(mpu3050->irq, mpu3050->trig);
 	iio_triggered_buffer_cleanup(indio_dev);

---
base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
change-id: 20261011-mpu3050-fix-145a77d5229b

Best regards,
-- 
Joshua Crofts

