Received: from adishatz.org (ns314768.ip-37-187-26.eu [37.187.26.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D026E4A49B3;
	Tue, 22 Sep 2026 19:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.187.26.192
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106487; cv=none; b=YrbVZpaK/nL8g/0qN7HVxeRIjsv9jPKcpnnWxPrxAfJ7tNhparreoBnlmphsIthTzpWoZKkNrlzGzl/gzAhlgswtcOB1UNLpdJw0eMiBQ2LxBOwZqOXoBwNZ7Z3bzwBr+6EBrUGyE6Z5In6bfbH2+/hQxZTG+DFzeSIBP7JuC2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106487; c=relaxed/simple;
	bh=2GUkSs5ZTpTYdJEpouNGeYCwn+yt9cJWKo+yGU386i0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tX6nEa4rRpd3AhHIeUp5+4HJLyt5mphsNl6Zurb5GxTWuC47yLY8g45eZSC7z53q8KnRan3IR/vr4hhugN4MgIEdAYueNcZKGbdgy9LzgxIoNVf77r26ILYJGXYAwCw8OxRv+m8xo8xXHp6LSNn+rfCuOZ9KkOC3tk6AL+Rr0wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org; spf=pass smtp.mailfrom=adishatz.org; dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b=iFncfHsn; arc=none smtp.client-ip=37.187.26.192
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=adishatz.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adishatz.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adishatz.org header.i=@adishatz.org header.b="iFncfHsn"
Received: from [192.168.1.197] (88-165-227-194.subs.proxad.net [88.165.227.194])
	by adishatz.org (Postfix) with ESMTPSA id B6BB14C022F;
	Tue, 22 Sep 2026 21:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adishatz.org;
	s=mail; t=1790105977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LGPIgJER122xCLLQSaDkRENXxVHfnMixSv9onUzEXmk=;
	b=iFncfHsnOQE6Nzy9cVrk0NEcaV0RfZdx35/lAGdRHWhUX1k5LgDCvHSf/ksD1e1RqlSWp9
	2jsHHbrhnDAXvUJJdrwcBHb9m+G+RnzfXP3/B74a99CKLZkUR0XKjYlOy+06uhwlla6+/5
	ttLCTLb0bTbtGqMs8edIHc+mlPXQX3lggly3ltHe0wkG4EBPm/YPD87LnICqYCMRFtyen0
	N+zcUFyglZ0IO0s2joDyIrXbJ9OYgqknvZZoT2mwBDE/yxiqYTjQgosmgSXni7ngpiznYg
	MFa6MJQqIRhIeGOCmGO3kL9F6JuDo7ya6GCyJOkaweaL1b5NPMNob2dW2WPycg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=cedric.bellegarde smtp.mailfrom=cedric.bellegarde@adishatz.org
From: =?utf-8?q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
Date: Tue, 22 Sep 2026 21:39:12 +0200
Subject: [PATCH] media: v4l2-async: link ancillary device runtime PM to the
 sensor's
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260922-sensors_pm-v1-1-05adf2098b5e@adishatz.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ND3eLUvOL8ouL4glxdcwvz1MRkA8PEREMLJaCGgqLUtMwKsGHRsbW
 1ANsznoJcAAAA
X-Change-ID: 20260911-sensors_pm-787eac01aa18
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, kieran.bingham@ideasonboard.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, 
 =?utf-8?q?C=C3=A9dric_Bellegarde?= <cedric.bellegarde@adishatz.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790105969; l=3415;
 i=cedric.bellegarde@adishatz.org; s=20260922; h=from:subject:message-id;
 bh=2GUkSs5ZTpTYdJEpouNGeYCwn+yt9cJWKo+yGU386i0=;
 b=WCy/B5n3sfbfaG/fqSdZ9GTd0X+RU7kwc006pEqyONRU6BA3RIoWIDSV3Z1GXNUADxRXilAXD
 qtS0CFI1ebnAODHAbNxapam03am7W1ElfQhdJdtgkR3NQ20fGLO5cpj
X-Developer-Key: i=cedric.bellegarde@adishatz.org; a=ed25519;
 pk=CV2g510IJ+UwW/Jd9MIio7NF2st3gLrxcN5YzVnMuMA=

When a sensor's fwnode references an ancillary lens or flash device
(e.g. via the "lens-focus" or "flash-leds" properties),
v4l2_async_create_ancillary_links() already creates a media controller
link between the two entities, but their runtime PM states remain
independent.

This is a problem for devices such as VCM lens actuators, which are
typically spring-loaded: holding a position away from the spring's
rest point requires continuous power, and the position is not retained
once power is cut. If such an actuator is allowed to runtime-suspend
independently of the sensor, the lens can drift back to its rest
position during an otherwise active capture session.

Add V4L2_SUBDEV_FL_PM_LINK to allow an ancillary subdevice to request
that its runtime PM state be linked to the associated sensor.

Signed-off-by: Cédric Bellegarde <cedric.bellegarde@adishatz.org>
---
Link runtime PM of ancillary devices such as lens actuators to their associated sensor,
while allowing actuators to autosuspend when idle.

Example usage:
https://gitlab.com/gnumdk/linux/-/commit/82b2d71415a1d95b2170e19ce025afc8bbdcf145
---
 drivers/media/v4l2-core/v4l2-async.c | 18 ++++++++++++++----
 include/media/v4l2-subdev.h          |  7 +++++++
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 460bf3dbbb88..22df627153b8 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -318,6 +318,7 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 {
 #if IS_ENABLED(CONFIG_MEDIA_CONTROLLER)
 	struct media_link *link;
+	struct device_link *devlink;
 
 	if (sd->entity.function != MEDIA_ENT_F_LENS &&
 	    sd->entity.function != MEDIA_ENT_F_FLASH)
@@ -331,11 +332,20 @@ static int v4l2_async_create_ancillary_links(struct v4l2_async_notifier *n,
 	}
 
 	link = media_create_ancillary_link(&n->sd->entity, &sd->entity);
-
-	return IS_ERR(link) ? PTR_ERR(link) : 0;
-#else
-	return 0;
+	if (IS_ERR(link))
+		return PTR_ERR(link);
+
+	if (sd->flags & V4L2_SUBDEV_FL_PM_LINK) {
+		devlink = device_link_add(n->sd->dev, sd->dev,
+					  DL_FLAG_PM_RUNTIME |
+					  DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!devlink)
+			dev_warn(notifier_dev(n),
+				 "failed to link power management of %s to %s\n",
+				 dev_name(sd->dev), dev_name(n->sd->dev));
+	}
 #endif
+	return 0;
 }
 
 static int v4l2_async_match_notify(struct v4l2_async_notifier *notifier,
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index d256b7ec8f84..9f64b10afd10 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -972,6 +972,13 @@ struct v4l2_subdev_internal_ops {
  * - Multiple streams per pad are supported
  */
 #define V4L2_SUBDEV_FL_STREAMS			(1U << 4)
+/*
+ * Set this flag to keep the subdevice active while its associated sensor is active.
+ *
+ * This is intended for ancillary devices, such as lens actuators, whose
+ * hardware state or physical position cannot be retained while powered off.
+ */
+#define V4L2_SUBDEV_FL_PM_LINK          (1U << 5)
 
 struct regulator_bulk_data;
 

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260911-sensors_pm-787eac01aa18

Best regards,
-- 
Cédric Bellegarde <cedric.bellegarde@adishatz.org>

