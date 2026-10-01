Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BC43B3DA;
	Thu,  1 Oct 2026 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859335; cv=none; b=IOdoNbMjbKmD4EXcaZOjp5zT2gMfUZmJcAmXEiI3DhJQHr3LXePLUzqmD7Yy+EW7TXKWAoD76SqfVdFE3g1CiKdt9+X5zZoacxFkMTzgg6oOp9/EJWjKYeAAXy6I7FXdh3HW7V3JkronLf/hCbQlGrqJ0HqS1g1nl2E6k/ronYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859335; c=relaxed/simple;
	bh=gINosgRoghcNXxlyfp9MdCuF0jgTn0VBcymjZRURfWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlz8EzxDavW1Di9CcIsJd/aAPiBowtuYMbsRqxpNo49Myj155A6J4wMgY095YvrC4btXHTA+AJZy2/fxWUlIqe4edSpfNt+0j4L3emZJAevDChvUrhzCHvRsTvevqzzPLpbEswDEv9dsyXOVhyeGHL/ntZATMW7LKJUUPwBzXF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwlMiI/2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwlMiI/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16FD1F00899;
	Thu,  1 Oct 2026 12:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859333;
	bh=5BAxBf/Dgd5ST9ziPCU4toBRaqSjzJd80hHEzMBZ058=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FwlMiI/2J5GvjxE2ac5WmmrYTzcRfMwR59XXt/cjKq+IH2UagtUNjAb+a+OesrYOV
	 7sBYIf7J4/nqcHtgXpPqxaLNeck2P47vbTCuzmM37EZfl7gqM8/0D+WYYNQtw7igjQ
	 tvNgd83mHbPi3WUBX63pQlZVh1Tg1yVPiJACJKLNN1HaOswMsPs4+4Phq7SS/ft+Pe
	 ByE/xeayddScN8tCfr5ou8PlqW1MNKEyhafgb05MSysjN5xpRP+jQn0INMTJqwQWVM
	 PQVl1etLuIhWMfwXuZle2nDnhOW9uoP5QQsA2zACg4mRsCHtAYFP7gUl/jGqR5VQro
	 o+yQfJ+3bDH2w==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 01 Oct 2026 14:55:19 +0200
Subject: [PATCH RFC 1/5] media: imx219: Move LP-11 state switch to
 power_on()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v4l2-sensor-detect-v1-1-a45993be17b8@kernel.org>
References: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
In-Reply-To: <20261001-v4l2-sensor-detect-v1-0-a45993be17b8@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2448;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=gINosgRoghcNXxlyfp9MdCuF0jgTn0VBcymjZRURfWY=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqvlg+SIbQvULgbR8KIdpAnC9nThodr/iJAcTPa
 SvMYO5MefuJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCar5YPgAKCRAZDR20Zk4Z
 Ndc9CACVAVnNDBmdujakehFRaiVxkpae0Zmo7w4sqbr7JqKvmiRmp/wRWu67ANk0gH2ztgfdwPK
 Qz2jZ2nFSFdisIgcBRuQnouFdqXbKMLjZ4Kh99Q2EoFXIFJLfk/Al4xZNCU9ZggqtLtChUWv65R
 CXZREBEuOtMF8IuHETc+I/vOBnou43jzBWdinfjkfYkgytPiH7xt2UzV3IKOmRlDDqaTkma9/NH
 XtZqRake3qgKGZx374GJjWD02/jgThXvqmhddX3NMI3Z2SyRe5hNhoDmzpQZOe0h5MQ8hDl5JcH
 XTWbIsU9udz5/nkaUFWA8Zulhe+5WzdZ62X5GlsmFcqM9Ta4
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

During probe(), we write the IMX219_MODE_STREAMING register to
transition from streaming -> standby to force LP-11 state.

This should be done at each power-up of the sensor, but is only
done *once* for the driver lifecycle (at probe).

Move the LP-11 sequence to power_on() to ensure that it's always put
into standby mode whenever the pm framework detects it's a power up.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 drivers/media/i2c/imx219.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 9571f3622d2d..7978fee5f4a2 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -1056,8 +1056,32 @@ static int imx219_power_on(struct device *dev)
 	usleep_range(IMX219_XCLR_MIN_DELAY_US,
 		     IMX219_XCLR_MIN_DELAY_US + IMX219_XCLR_DELAY_RANGE_US);
 
+	/*
+	 * Sensor doesn't enter LP-11 state upon power up until and unless
+	 * streaming is started, so upon power up switch the modes to:
+	 * streaming -> standby
+	 */
+	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
+			IMX219_MODE_STREAMING, NULL);
+	if (ret < 0)
+		goto gpio_off;
+
+	usleep_range(100, 110);
+
+	/* put sensor back to standby mode */
+	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
+			IMX219_MODE_STANDBY, NULL);
+	if (ret < 0)
+		goto gpio_off;
+
+	usleep_range(100, 110);
+
 	return 0;
 
+gpio_off:
+	gpiod_set_value_cansleep(imx219->reset_gpio, 0);
+	clk_disable_unprepare(imx219->xclk);
+
 reg_off:
 	regulator_bulk_disable(IMX219_NUM_SUPPLIES, imx219->supplies);
 
@@ -1240,26 +1264,6 @@ static int imx219_probe(struct i2c_client *client)
 	if (ret)
 		goto error_power_off;
 
-	/*
-	 * Sensor doesn't enter LP-11 state upon power up until and unless
-	 * streaming is started, so upon power up switch the modes to:
-	 * streaming -> standby
-	 */
-	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
-			IMX219_MODE_STREAMING, NULL);
-	if (ret < 0)
-		goto error_power_off;
-
-	usleep_range(100, 110);
-
-	/* put sensor back to standby mode */
-	ret = cci_write(imx219->regmap, IMX219_REG_MODE_SELECT,
-			IMX219_MODE_STANDBY, NULL);
-	if (ret < 0)
-		goto error_power_off;
-
-	usleep_range(100, 110);
-
 	ret = imx219_init_controls(imx219);
 	if (ret)
 		goto error_power_off;

-- 
2.55.0

