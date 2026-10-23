Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792794708;
	b=vYN0j31kQcrEK9DjfvWF1knSsWotQ7RvVS4AhjxcsEMeKUGXJEoet62yBVgACbTyvH1x
	 B1g569uPS7lAP1Ju6okr75QotVYpUvXeMyhT8uhaBRuQTstpSszLJzGM7YtLzHHXqDy9X
	 IueV9p5Xvo2+7pUahh4UlV/0pxG9jXnSOHEttKtIf/UqV6tMgJXEt/pf+znCuUTmRLbam
	 dYlrAsXRZdTM0Jm5h3dzbPJjOjaop8UnSFt2iyfS4q9cvyabBKM+MpK3qSi+XasONU44e
	 wofsoKIP9SblFsIKIUkNRbxGcai8N9prkR65Qmu0ac+k8EwHTfp0kUGRwBF0m+KP1lw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794708;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l1hLfNmJm6Tp07iYdqWR4eMFaTYBny+F5j2RVqR8uzs=;
	b=nyWzXKfcP0fVoSXv6jW41wFg8g7zmRAs0/RZAcfvl76w3SIL5FaZs0ik3pZO9W8OxoSQ
	 G7/jn3uq2jDLd55Gp22y58FYLHr/b7sCrcGzEWkyIl9vRLqh5lnh/JT1bglP9A9XI0J+8
	 AbuiNc5EopnM2SmEuu5TDhUM6M+FrGi33BK34RMmo1bQH4AEIJcnDaFTCjcALbLlgLKra
	 imSWjh2nOjqMvsI3O5xO5h/zGQhUiZWkdb9KpMph+Wb4GmXqrBoDm0BwkFXj1hxbOirfb
	 KCrpswlSQLBWGzK5XkBK05MqJoFRtUmr7FqUwIe7gBVlyo/Y7ddnIKM/c2LHbN9SfOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l52pk1dG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899F3606A31D;
	Fri, 23 Oct 2026 22:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=l52pk1dG
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792794708;
	b=Q/jlTaToqpPf0FUsxiB3cir/g0Vg00xuf+PX7W/v+Cj79J5PUxv+aALpiaw+4kL1A2EA
	 uqzYRgAYQ3rJRV8gauynHJyns67GdFhwcyKEZzUo45L1eH34671idAuePkh6DMDTKJF3H
	 mnTX9p9XDCkXwML9HQ9oRAeFAxAcIEq8QnpQFlqAnTPzVKyC6y6r5+NsSfOW9/x9py3U/
	 kRQNJS0XsWspN5P5ECP+xO6LpKATuNB3Z7sbZtTFJbzqhv5K4MoTpn4qxq3+Pgn23TJ52
	 h5uMxF5lzwhM0A51tLpJGgj/813PFHg4Hh2yuTvZ/ETtQc6h/08hA+hEL7j2UO5HTcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792794708;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l1hLfNmJm6Tp07iYdqWR4eMFaTYBny+F5j2RVqR8uzs=;
	b=ZBjban3nPBn30dwy7kMxPjgoxCbuR8RNTNcZQc0a7K7phSBG6hD1CJydwjC0ECyISwH4
	 iKo72hUCuuuoo3KTVTeePRb4sPE90YLwcs8MVIUDBIZ71s0Rw/hmTa2FLmV0EjDoWI4fD
	 /yir+7e0HovABJdcCYb8XSUz1V23JXXTfA90X6hnctfhyc6AQ5Q/R64wNMvCU8AUoeH0f
	 mkG38/VsQMJoXSIyo2RMxCrU1x7pfz/5WCVLyFhewxigt4VIwgf0d6xQewBxG0tzudOaT
	 jquMTaAOzz3SmJJxbxLRmBKYrRvcAd8OQdradd+wHrbNhDREu6Z5Xt99EL0ZacjmsFg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81B061F01825;
	Fri, 23 Oct 2026 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794708;
	bh=l1hLfNmJm6Tp07iYdqWR4eMFaTYBny+F5j2RVqR8uzs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=l52pk1dGqCk7vnqoRBzX/U5LPsK26TXEgiVje5uRUpnWU0HkPy8CujFYruuJ6KpDO
	 r2I4sQMGAcuAHbByXrkxL/ccE6KPyCUm7DMpzrSn+gF9ZV9BP94bhy8F1C8d7OM/av
	 O0VM0z4BiEsmiPnJS+TJbqd1gd4JO/4bq4feEkPWr+fR1ZpluFc6ec8hXZBVDQd9xD
	 /4YDKR6PT4Z/mg98or3b3EMSKVupB8G4M4pabM91kX4Vv98/Dx7HMKI56Ge7raVNQs
	 nwSfHeMtvZ3rveLX1n+NnQ2ifHYKIsYFf11yoI8bxEIbZEGL7yGeZ816abanlP5Tdj
	 FZvwifqyrxHEw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EB20944659;
	Fri, 23 Oct 2026 22:31:46 +0000 (UTC)
From: Max Bretschneider via B4 Relay <devnull+max.bretschneider.leica-geosystems.com@kernel.org>
Date: Sat, 24 Oct 2026 00:28:52 +0200
Subject: [PATCH v2 2/4] media: i2c: ov08d10: use the subdev active state
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261024-ov08d10-get-selection-v2-2-f8c49972ca18@leica-geosystems.com>
References: <20261024-ov08d10-get-selection-v2-0-f8c49972ca18@leica-geosystems.com>
In-Reply-To: <20261024-ov08d10-get-selection-v2-0-f8c49972ca18@leica-geosystems.com>
To: Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Max Bretschneider <max.bretschneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792794706; l=8528;
 i=max.bretschneider@leica-geosystems.com; s=20260501;
 h=from:subject:message-id;
 bh=UO43Xv2+J6Y1h2wiVWCTdjZyFn23oU70HMAlGwInR+0=;
 b=Cm565KJjeQj4HmyAW7kcM147NrU7IdNINN4aQt8pOCZ746tCnJBZHzRzrTXqTzqiF3MjxoovV
 NiSzQuwvenUCth1ncGAQFC3zMpzWpHwun+vJ6wXpCmN/CgBn4i3pE39
X-Developer-Key: i=max.bretschneider@leica-geosystems.com; a=ed25519;
 pk=jf4ba33jrWlsOdGemi2InMtJAngoJVZU8Moetp0ixik=
X-Endpoint-Received: by B4 Relay for
 max.bretschneider@leica-geosystems.com/20260501 with auth_id=1161
X-Original-From: Max Bretschneider <max.bretschneider@leica-geosystems.com>
Reply-To: max.bretschneider@leica-geosystems.com
Content-Transfer-Encoding: 7bit

From: Max Bretschneider <max.bretschneider@leica-geosystems.com>

Port the driver to the subdev active state. This simplifies locking,
replacing the driver's own mutex with the control handler lock, which is
also used as the state lock, and allows the driver's get_fmt
implementation to be replaced by v4l2_subdev_get_fmt().

Sharing those two locks means the state is held whenever set_ctrl() runs,
so the control callbacks can access the stored format directly, and the
__v4l2_ctrl_*() helpers can be called from the pad operations.

The driver's get_fmt() recomputed the media bus code from the flip controls
on every call, and so always reported the Bayer order matching the current
flip settings. v4l2_subdev_get_fmt() returns the stored format instead, so
the code is now refreshed in set_ctrl() when the flips change. The flip
controls carry V4L2_CTRL_FLAG_MODIFY_LAYOUT, which tells userspace that
changing them may modify the media bus format on the source pad.

Signed-off-by: Max Bretschneider <max.bretschneider@leica-geosystems.com>
---
 drivers/media/i2c/ov08d10.c | 84 ++++++++++++++++++---------------------------
 1 file changed, 34 insertions(+), 50 deletions(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 4dc68ff89eda..f19c056608ea 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -571,9 +571,6 @@ struct ov08d10 {
 	/* Current mode */
 	const struct ov08d10_mode *cur_mode;
 
-	/* To serialize asynchronous callbacks */
-	struct mutex mutex;
-
 	/* lanes index */
 	u8 nlanes;
 
@@ -913,6 +910,15 @@ static int ov08d10_set_ctrl(struct v4l2_ctrl *ctrl)
 					 exposure_max);
 	}
 
+	/* The flips change the Bayer order, refresh it even while powered off */
+	if (ctrl->id == V4L2_CID_HFLIP || ctrl->id == V4L2_CID_VFLIP) {
+		struct v4l2_subdev_state *state =
+			v4l2_subdev_get_locked_active_state(&ov08d10->sd);
+
+		v4l2_subdev_state_get_format(state, 0)->code =
+			ov08d10_get_format_code(ov08d10);
+	}
+
 	/* V4L2 control values will be applied only when power is already up */
 	if (!pm_runtime_get_if_in_use(ov08d10->dev))
 		return 0;
@@ -976,7 +982,6 @@ static int ov08d10_init_controls(struct ov08d10 *ov08d10)
 	if (ret)
 		return ret;
 
-	ctrl_hdlr->lock = &ov08d10->mutex;
 	link_freq_size = ARRAY_SIZE(ov08d10->priv_lane->link_freq_menu);
 	ov08d10->link_freq =
 		v4l2_ctrl_new_int_menu(ctrl_hdlr, &ov08d10_ctrl_ops,
@@ -1147,13 +1152,14 @@ static void ov08d10_stop_streaming(struct ov08d10 *ov08d10)
 static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct ov08d10 *ov08d10 = to_ov08d10(sd);
+	struct v4l2_subdev_state *state;
 	int ret = 0;
 
-	mutex_lock(&ov08d10->mutex);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 	if (enable) {
 		ret = pm_runtime_resume_and_get(ov08d10->dev);
 		if (ret < 0) {
-			mutex_unlock(&ov08d10->mutex);
+			v4l2_subdev_unlock_state(state);
 			return ret;
 		}
 
@@ -1172,7 +1178,7 @@ static int ov08d10_set_stream(struct v4l2_subdev *sd, int enable)
 	__v4l2_ctrl_grab(ov08d10->vflip, enable);
 	__v4l2_ctrl_grab(ov08d10->hflip, enable);
 
-	mutex_unlock(&ov08d10->mutex);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1192,12 +1198,10 @@ static int ov08d10_set_format(struct v4l2_subdev *sd,
 				      width, height, fmt->format.width,
 				      fmt->format.height);
 
-	mutex_lock(&ov08d10->mutex);
 	ov08d10_update_pad_format(ov08d10, mode, &fmt->format);
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
-		*v4l2_subdev_state_get_format(sd_state, fmt->pad) =
-								fmt->format;
-	} else {
+	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ov08d10->cur_mode = mode;
 		__v4l2_ctrl_s_ctrl(ov08d10->link_freq, mode->link_freq_index);
 		pixel_rate = to_rate(ov08d10->priv_lane->link_freq_menu,
@@ -1221,27 +1225,6 @@ static int ov08d10_set_format(struct v4l2_subdev *sd,
 					 h_blank);
 	}
 
-	mutex_unlock(&ov08d10->mutex);
-
-	return 0;
-}
-
-static int ov08d10_get_format(struct v4l2_subdev *sd,
-			      struct v4l2_subdev_state *sd_state,
-			      struct v4l2_subdev_format *fmt)
-{
-	struct ov08d10 *ov08d10 = to_ov08d10(sd);
-
-	mutex_lock(&ov08d10->mutex);
-	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
-		fmt->format = *v4l2_subdev_state_get_format(sd_state,
-							    fmt->pad);
-	else
-		ov08d10_update_pad_format(ov08d10, ov08d10->cur_mode,
-					  &fmt->format);
-
-	mutex_unlock(&ov08d10->mutex);
-
 	return 0;
 }
 
@@ -1254,9 +1237,7 @@ static int ov08d10_enum_mbus_code(struct v4l2_subdev *sd,
 	if (code->index > 0)
 		return -EINVAL;
 
-	mutex_lock(&ov08d10->mutex);
 	code->code = ov08d10_get_format_code(ov08d10);
-	mutex_unlock(&ov08d10->mutex);
 
 	return 0;
 }
@@ -1270,12 +1251,8 @@ static int ov08d10_enum_frame_size(struct v4l2_subdev *sd,
 	if (fse->index >= ov08d10->modes_size)
 		return -EINVAL;
 
-	mutex_lock(&ov08d10->mutex);
-	if (fse->code != ov08d10_get_format_code(ov08d10)) {
-		mutex_unlock(&ov08d10->mutex);
+	if (fse->code != ov08d10_get_format_code(ov08d10))
 		return -EINVAL;
-	}
-	mutex_unlock(&ov08d10->mutex);
 
 	fse->min_width = ov08d10->priv_lane->sp_modes[fse->index].width;
 	fse->max_width = fse->min_width;
@@ -1285,14 +1262,13 @@ static int ov08d10_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int ov08d10_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+static int ov08d10_init_state(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *sd_state)
 {
 	struct ov08d10 *ov08d10 = to_ov08d10(sd);
 
-	mutex_lock(&ov08d10->mutex);
 	ov08d10_update_pad_format(ov08d10, &ov08d10->priv_lane->sp_modes[0],
-				  v4l2_subdev_state_get_format(fh->state, 0));
-	mutex_unlock(&ov08d10->mutex);
+				  v4l2_subdev_state_get_format(sd_state, 0));
 
 	return 0;
 }
@@ -1303,7 +1279,7 @@ static const struct v4l2_subdev_video_ops ov08d10_video_ops = {
 
 static const struct v4l2_subdev_pad_ops ov08d10_pad_ops = {
 	.set_fmt = ov08d10_set_format,
-	.get_fmt = ov08d10_get_format,
+	.get_fmt = v4l2_subdev_get_fmt,
 	.enum_mbus_code = ov08d10_enum_mbus_code,
 	.enum_frame_size = ov08d10_enum_frame_size,
 };
@@ -1314,7 +1290,7 @@ static const struct v4l2_subdev_ops ov08d10_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops ov08d10_internal_ops = {
-	.open = ov08d10_open,
+	.init_state = ov08d10_init_state,
 };
 
 static int ov08d10_power_off(struct device *dev)
@@ -1471,6 +1447,7 @@ static void ov08d10_remove(struct i2c_client *client)
 	struct ov08d10 *ov08d10 = to_ov08d10(sd);
 
 	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(sd->ctrl_handler);
 	pm_runtime_disable(ov08d10->dev);
@@ -1478,7 +1455,6 @@ static void ov08d10_remove(struct i2c_client *client)
 		ov08d10_power_off(ov08d10->dev);
 		pm_runtime_set_suspended(ov08d10->dev);
 	}
-	mutex_destroy(&ov08d10->mutex);
 }
 
 static int ov08d10_probe(struct i2c_client *client)
@@ -1545,7 +1521,6 @@ static int ov08d10_probe(struct i2c_client *client)
 		goto probe_error_power_off;
 	}
 
-	mutex_init(&ov08d10->mutex);
 	ov08d10->cur_mode = &ov08d10->priv_lane->sp_modes[0];
 	ret = ov08d10_init_controls(ov08d10);
 	if (ret) {
@@ -1566,17 +1541,27 @@ static int ov08d10_probe(struct i2c_client *client)
 	pm_runtime_set_active(ov08d10->dev);
 	pm_runtime_enable(ov08d10->dev);
 
+	ov08d10->sd.state_lock = ov08d10->ctrl_handler.lock;
+	ret = v4l2_subdev_init_finalize(&ov08d10->sd);
+	if (ret) {
+		dev_err(ov08d10->dev, "failed to init subdev state: %d\n", ret);
+		goto probe_error_media_entity_cleanup;
+	}
+
 	ret = v4l2_async_register_subdev_sensor(&ov08d10->sd);
 	if (ret < 0) {
 		dev_err(ov08d10->dev, "failed to register V4L2 subdev: %d\n",
 			ret);
-		goto probe_error_media_entity_cleanup;
+		goto probe_error_subdev_cleanup;
 	}
 
 	pm_runtime_idle(ov08d10->dev);
 
 	return 0;
 
+probe_error_subdev_cleanup:
+	v4l2_subdev_cleanup(&ov08d10->sd);
+
 probe_error_media_entity_cleanup:
 	pm_runtime_disable(ov08d10->dev);
 	pm_runtime_set_suspended(ov08d10->dev);
@@ -1584,7 +1569,6 @@ static int ov08d10_probe(struct i2c_client *client)
 
 probe_error_v4l2_ctrl_handler_free:
 	v4l2_ctrl_handler_free(ov08d10->sd.ctrl_handler);
-	mutex_destroy(&ov08d10->mutex);
 
 probe_error_power_off:
 	ov08d10_power_off(ov08d10->dev);

-- 
2.43.0


