Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794115042;
	b=g74igoqny6wb5slLo6NQtV0zy7AIIJ0TPuGkvrQJaJYZ6OLdgJAhh1OJtzzR2DalKb2L
	 7nhwOxNNvNsbzADY5sS8/6DRGZfoNc2RpQ2olQvzUE7UPa+bQaNdMYDnVE7gKx2wkei5X
	 7VnB2HY0/mKPZNjcNvG0rpX5m8UWFiFMc5astMEMamzNsfZZWWdSrKBB2nWxMOuF3sObf
	 FYesXAGiy1A02VegpeoLTcL/7sXnR41qE8YskzQZR9fv7WqFBkQdt5PoCP76DCXrbU0LF
	 HJxYpiVKU3Y67/QWVRfqhGUHcs0EZ+rhnzDW49gVTWqxqyR7dohrma1Bn6AXLBokZSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115042;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jcRlgwbaeCWN8RyyDDQL9tJxHF6EIJ8eLZHyMDZk2Sw=;
	b=fX2bAIudfZPMd0My7vBLdozwVKFuSIwDepI+wbWxGTzAJu/sdXVU2szmPSkdlWtHrMgS
	 fL1eCRmqN9Hiza5aqOipYVkdhPfBiiGc+lLJ0mSey2vRpTLsDcf/a5t2eKCyLpryG38p4
	 bqlFzEkRcwHOrtXqBc8LBbguhrXGfg4VDKP4mf2IIqtojHZXwJfANVIOuuidcjPvtPUW8
	 XDwffCIIvNAjaol+5UjAuG9zCBILWU64skiAGZErmeKTZoiTJGAS7zFOExZEw6dgqcWqy
	 KyRj/6bbXW8z+e/UatWOzDEb19/CuzHxDl+wroQY1lcRPWJXh6xm5BtSelJZdcTN1SA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2LwJS6Y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CB3606A31E;
	Sun,  8 Nov 2026 05:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2LwJS6Y
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794115041;
	b=qJRx+Lme/bCduvppugh57TSLujs4f4/yNAMMoIHwnRJHyxxqnaxHjuPZz+5YuwZwGWRH
	 7q43XMthUIDYC7EdVw7OkgQlmxlEOKnLMGNdiL6pVgmo2n+U7cCYZliJ7dcbqbgDzrsS7
	 lhfjQiTJBK003Bi4EGM0pLhyIHUeJIxFoGISH948mcIJ+4T2x1lEcFLjPt0jWxjO80BlX
	 Ag1+zFeWl0cfmFWe7ldZj1bHRsPwLKnV8/z49UIm6ZPig/O1qc3iZtDQ6Xvb4vQbfXVwd
	 eDkJ4M8DJp5V6t/nqVQ06CoiSsAHBPwUWlEG8OLX5Q1L9hqHDb6KKl+pzM92z60NbQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794115041;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jcRlgwbaeCWN8RyyDDQL9tJxHF6EIJ8eLZHyMDZk2Sw=;
	b=pWfak7dST7CldP4S4ihACmGv6EG298gvDMBUXo3ClqGYCioMXwsi0xFbjFpW6AckF49d
	 zjq77cHUbHQp4jXgDoVtk+x6jMSp2d2sBr3ljx+ZNDTn/zkdpuYbpQc+PCn/Jc05k71yU
	 TJbpn2gqkS3rCEbe/L6O+Hx06XRTgYSoYIITCsDNz6tXTMghVEqrMrPoOiJLaqUThGD53
	 JarvT85v8jnLtn3+WKPDSl4X2RgdjSpylY1AVl43pUHT65qc6WPMNl44mfJqNsGtqq83E
	 Pg7hatNOqktAxGwXU1/CvGKzicseQJ1vjJ6QA6CqfkAcjO7QllYAt1D897adBGv0cfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A34571F0089F;
	Sun,  8 Nov 2026 05:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794115041;
	bh=jcRlgwbaeCWN8RyyDDQL9tJxHF6EIJ8eLZHyMDZk2Sw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Q2LwJS6YRVSA7H5rAo4pGDLu3sIVFCllungGR5JvDwrBDLy4rh5u0niImuajTMVxa
	 EF2V5fU+zsUOW/C9AAyJvKpPEi+SNfyzJnKFzRymyQxKIVfSTxPao2Fkr0SVL9lnbn
	 0DAyJgm1BgM2zMcWeT4ZmQzYf7kYang4utw5nLSjRwy7SVd/UNAZhaz+WyDHibZn01
	 YhDXBAjkb9Uu1DbpXguz1GOI5bp0SNgohsrVcA76eWcCP7iWDxMKxvnTEa44+NpmX/
	 iT9A2GBalHLxasAmmZTojj7j38+jJ6bXhHDFLd4tRKi4q46abvzG2ugVQXvVPiE3yy
	 IhMajjFVyPU6Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3624247DF7;
	Sun,  8 Nov 2026 05:17:20 +0000 (UTC)
From: DelaySystem via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Sat, 07 Nov 2026 21:17:20 -0800
Subject: [PATCH] staging: media: imx: ic-prpencvf: add FORMAT_TRY frame
 interval support
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
Message-Id: <20261107-batch1-m2-prpencvf-try-v1-1-76bd9f505710@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDvgRIixVyldaBx1hKZhkkqLe
 PemdfkW/++QWIUTXKsdlDdJ8gwFdKnAL32YGWUsBlMbS1S3OPTZL4QPg1EjB79NmPWDDTlyjW2
 dHTsocVSe5P0f3+6n02tY2effDY7jC/Ai2gZ6AAAA
X-Change-ID: 20261107-batch1-m2-prpencvf-try-3181836786d9
To: slongerbeam@gmail.com
Cc: linux-media@vger.kernel.org, gregkh@linuxfoundation.org, 
 mchehab@kernel.org, linux-kernel@vger.kernel.org, p.zabel@pengutronix.de, 
 linux-staging@lists.linux.dev, imx@lists.linux.dev, 
 DelaySystem <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5259;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=5HNjdHC/xxY5VCXD5VgvsdQGoGczC6JvCiyidff7vH4=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFkfWO+bm21Jdir2dl3r5mT283n1slhX+49NaznbKiuDp
 yt+SbDtKGVhEONgkBVTZBGT4Xlff18nztpqzgmYOaxMIEMYuDgFYCKz7Rn+qR3wzs4N4qv+x5Bv
 vWum/q38jm/cj0VaVf5qie5/X+n2mOE3a/aGyn3Lp6+2lJY2nuqtvU/sR6tdjcV6J4UXsyf88zB
 gBwA=
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: DelaySystem <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: DelaySystem <DelaySystem@tubot.lat>

Implement frame interval handling for V4L2_SUBDEV_FORMAT_TRY
by storing and retrieving per-pad intervals from the subdev state,
following the same pattern the driver already uses for TRY formats:
ACTIVE intervals stay in priv->frame_interval while TRY intervals live
in the subdev state.  Add a PRPENCVF-specific init_state callback to
initialize TRY intervals from the active default, and move default
interval initialization to prp_init(), which runs before any state can
be initialized.

Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
Compile-tested only: x86_64, VIDEO_IMX_MEDIA=m via COMPILE_TEST, zero
warnings. No i.MX hardware here for runtime testing; hardware testing
by others is welcome.
---
 drivers/staging/media/imx/imx-ic-prpencvf.c | 87 +++++++++++++++++++++--------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 3430ddeac356..fd70c9a36f7e 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -795,6 +795,18 @@ __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
 		return &priv->format_mbus[pad];
 }
 
+static struct v4l2_fract *
+__prp_get_frame_interval(struct prp_priv *priv,
+			 struct v4l2_subdev_state *sd_state,
+			 unsigned int pad,
+			 enum v4l2_subdev_format_whence which)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY)
+		return v4l2_subdev_state_get_interval(sd_state, pad);
+
+	return &priv->frame_interval;
+}
+
 /*
  * Applies IC resizer and IDMAC alignment restrictions to output
  * rectangle given the input rectangle, and depending on given
@@ -1208,22 +1220,25 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
-
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	struct v4l2_fract *interval;
+	int ret = 0;
 
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
 	mutex_lock(&priv->lock);
-	fi->interval = priv->frame_interval;
+	interval = __prp_get_frame_interval(priv, sd_state, fi->pad,
+					    fi->which);
+	if (!interval) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	fi->interval = *interval;
+out:
 	mutex_unlock(&priv->lock);
 
-	return 0;
+	return ret;
 }
 
 static int prp_set_frame_interval(struct v4l2_subdev *sd,
@@ -1231,24 +1246,50 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
 				  struct v4l2_subdev_frame_interval *fi)
 {
 	struct prp_priv *priv = sd_to_priv(sd);
-
-	/*
-	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
-	 * subdev active state API.
-	 */
-	if (fi->which != V4L2_SUBDEV_FORMAT_ACTIVE)
-		return -EINVAL;
+	struct v4l2_fract *interval;
+	int ret = 0;
 
 	if (fi->pad >= PRPENCVF_NUM_PADS)
 		return -EINVAL;
 
 	mutex_lock(&priv->lock);
+	interval = __prp_get_frame_interval(priv, sd_state, fi->pad,
+					    fi->which);
+	if (!interval) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	/* No limits on valid frame intervals */
 	if (fi->interval.numerator == 0 || fi->interval.denominator == 0)
-		fi->interval = priv->frame_interval;
+		fi->interval = *interval;
 	else
-		priv->frame_interval = fi->interval;
+		*interval = fi->interval;
+out:
+	mutex_unlock(&priv->lock);
+
+	return ret;
+}
+
+static int prp_init_state(struct v4l2_subdev *sd,
+			  struct v4l2_subdev_state *sd_state)
+{
+	struct prp_priv *priv = sd_to_priv(sd);
+	struct v4l2_fract *interval;
+	unsigned int pad;
+	int ret;
+
+	ret = imx_media_init_state(sd, sd_state);
+	if (ret)
+		return ret;
+
+	mutex_lock(&priv->lock);
+
+	for (pad = 0; pad < PRPENCVF_NUM_PADS; pad++) {
+		interval = v4l2_subdev_state_get_interval(sd_state, pad);
+		if (interval)
+			*interval = priv->frame_interval;
+	}
 
 	mutex_unlock(&priv->lock);
 
@@ -1274,10 +1315,6 @@ static int prp_registered(struct v4l2_subdev *sd)
 			return ret;
 	}
 
-	/* init default frame interval */
-	priv->frame_interval.numerator = 1;
-	priv->frame_interval.denominator = 30;
-
 	priv->vdev = imx_media_capture_device_init(ic_priv->ipu_dev,
 						   &ic_priv->sd,
 						   PRPENCVF_SRC_PAD, true);
@@ -1335,7 +1372,7 @@ static const struct v4l2_subdev_ops prp_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops prp_internal_ops = {
-	.init_state = imx_media_init_state,
+	.init_state = prp_init_state,
 	.registered = prp_registered,
 	.unregistered = prp_unregistered,
 };
@@ -1352,6 +1389,10 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 	ic_priv->task_priv = priv;
 	priv->ic_priv = ic_priv;
 
+	/* init default frame interval */
+	priv->frame_interval.numerator = 1;
+	priv->frame_interval.denominator = 30;
+
 	spin_lock_init(&priv->irqlock);
 	timer_setup(&priv->eof_timeout_timer, prp_eof_timeout, 0);
 

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261107-batch1-m2-prpencvf-try-3181836786d9

Best regards,
--  
DelaySystem <DelaySystem@tubot.lat>


