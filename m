Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE7D4A3F38;
	Thu,  1 Oct 2026 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859341; cv=none; b=JJqsqdP1Os+wwTakavWKjYBoALRQOWKIshalVIF3K/Wlus4MD50MQLc3JQXoK1NDL6hvAgbnybqA0OCj1G/yN7ZA2CL+QYN9FLy/tr2Knt15xBJdmvTaddNNx5Z94OGtx7A52S1gUjH139oFmL7bjZLVUZ7QaLHjyO2xB+/WImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859341; c=relaxed/simple;
	bh=RjhIMmo8dvFdFYEWM72R4jNwENr4t0SVb9SFpKhna0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WjU6AiCU8lHNoRuC0EdKjsJOOHnwdKUXixmK1X19pcgN5q/7TMK4XFQ1u6OtKcgg270gUeYs/xe5i+CsJgDfseJ8kIgapx7tTVqbfZexIFn9kysm4CVS/RuOuW3CcTvrZYBowNQaF4UhoUdJ0P38mIRY6Y36dOmXSNp7kdrLb9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2YQNC0G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2YQNC0G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53311F0089A;
	Thu,  1 Oct 2026 12:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790859340;
	bh=tUQjTr1Ie+FoUtTi5iop0KqcZhhEcIDVIEz0Dku5Ew4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=J2YQNC0G0Ho5My+iMkJ+WjPugZLpuEP0yYuKx9k7iY3FjjPm+ybNs45XuxBo847iN
	 ha0dOqaA1Cj7OVurkNHAvYrq7F+dZGof3Izc8eXr/dtTRLUX/kF/lt8UEf4VStSg33
	 2pkNlhbRfB40jVZZ0lXu2JWI+O1eBO22Ck0FOUoibTTD2iSkHwuoBLVKeXn0AlTzij
	 MWpcRk0wMib5M0RnM54BUcjf4oy0JpIVK/2+SfSaMldfiE2+TSN7Val0sBF+1BadIE
	 Noag6Mc1702WON/F32w2Md6XR4jWv+pMUniYY56TEd2Pr3a9P9Mm6jmshgyU7499ny
	 qraRw6mewXcXw==
From: Mattijs Korpershoek <mkorpershoek@kernel.org>
Date: Thu, 01 Oct 2026 14:55:22 +0200
Subject: [PATCH RFC 4/5] media: imx219: Implement .detect() sensor
 operation
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-v4l2-sensor-detect-v1-4-a45993be17b8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2285;
 i=mkorpershoek@kernel.org; h=from:subject:message-id;
 bh=RjhIMmo8dvFdFYEWM72R4jNwENr4t0SVb9SFpKhna0I=;
 b=owEBbQGS/pANAwAKARkNHbRmThk1AcsmYgBqvlg/VixL1iMosQqYD4n92xL0f34C6sook8ksG
 5nvsz1U3ZyJATMEAAEKAB0WIQQu6UKnth9qvlMTrQAZDR20Zk4ZNQUCar5YPwAKCRAZDR20Zk4Z
 NVk1B/962/t1SAPuvyU5ZXxqqzLDOZSxn8/RkqlOk4jQRkhS6AFafZIe6H/PFEinBYFRj6RzaMp
 dMg014McPalfNm4bf5aL/vUEwSoJiQkhXmbMSMpbv2yCphxd3Uuak9J9XEnV7FLeCWeibPscIvf
 EhUbDjkcjFbehma+2shDsAP9+rzQpGirLMuUbUjx3j76PZpMDxIzXwSwvRhsdJEYFJ42TEA3pAU
 q4alLTtXcvybLAQLg8EdKfZAShp2CMgoayXJ27tfpsDzjkrBG6q3rxyqm5/jVXYn9n5xOa7Ci01
 7TWLBbZ38yUGnpkEoc4zyc89W8tpttLfHn2fNECDt4255klq
X-Developer-Key: i=mkorpershoek@kernel.org; a=openpgp;
 fpr=8234A35B45C0D26B31C1A2DA570338B018144F28

Now that the driver can probe() with a missing sensor, userspace should
be able to query the sensor connection state from the v4l2-subdev.

Implement the .detect() sensor operation so that userspace can do that
using the VIDIOC_SUBDEV_G_CONNECTION_STATUS ioctl.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@kernel.org>
---
 drivers/media/i2c/imx219.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index aeac70123b9b..e198d3fe99c6 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -28,6 +28,7 @@
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-mediabus.h>
+#include <media/v4l2-subdev.h>
 
 /* Chip ID */
 #define IMX219_REG_CHIP_ID		CCI_REG16(0x0000)
@@ -1023,6 +1024,35 @@ static int imx219_identify_module(struct imx219 *imx219)
 	return 0;
 }
 
+static int imx219_detect(struct v4l2_subdev *sd,
+			 struct v4l2_subdev_connected_status *status)
+{
+	struct imx219 *imx219 = to_imx219(sd);
+	struct i2c_client *client = v4l2_get_subdevdata(&imx219->sd);
+	struct device *dev = &client->dev;
+	int ret;
+
+	/*
+	 * The sensor must be powered for imx219_identify_module()
+	 * to be able to read the CHIP_ID register
+	 */
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret) {
+		status->status = V4L2_SUBDEV_STATUS_UNKNOWN;
+		return ret;
+	}
+
+	ret = imx219_identify_module(imx219);
+	if (ret)
+		status->status = V4L2_SUBDEV_STATUS_DISCONNECTED;
+	else
+		status->status = V4L2_SUBDEV_STATUS_CONNECTED;
+
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
+}
+
 static const struct v4l2_subdev_video_ops imx219_video_ops = {
 	.s_stream = v4l2_subdev_s_stream_helper,
 };
@@ -1037,9 +1067,14 @@ static const struct v4l2_subdev_pad_ops imx219_pad_ops = {
 	.disable_streams = imx219_disable_streams,
 };
 
+static const struct v4l2_subdev_sensor_ops imx219_sensor_ops = {
+	.detect = imx219_detect,
+};
+
 static const struct v4l2_subdev_ops imx219_subdev_ops = {
 	.video = &imx219_video_ops,
 	.pad = &imx219_pad_ops,
+	.sensor = &imx219_sensor_ops,
 };
 
 static const struct v4l2_subdev_internal_ops imx219_internal_ops = {

-- 
2.55.0

