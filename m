Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794114973;
	b=VEEugvMYahaHO70h4cv3jnziT8ktyN4FDogYOL4BNNGFohRM1Ixd2KadxnGDpW+i/Fk2
	 59XsorgC4c+1DoO47fF9GXmdh1kHcvKwDy0r9/C6cm2ajB5c/IXd3vgv+rSNKdIxIjYg6
	 DhEu/Ps8hrZbj1bm577cQd6N/hRG6nWmevBN87lgmROFUPuPJ7WEglejZc7ARCTg07wFB
	 +DA3n45+4QOf+exDFMk3mvAlZCJJ615O2ae0dDJcsXX1PORfzG1EpNI7VzMhl84MM2kU8
	 3JGKCZ3dmEKFR5YIlIy5uTEeaO9dRC8TZ/M2LjSL9d8nUurnoLuGns+5fQ5NfrIhc4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794114973;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=GaJ0kJ7iGwr4NJdNnl3p/qA/RRPtTceFFlBooGp8kRY=;
	b=Xz66yJtOiQzCVYhtxVebiFtauBHgWpqjJGKa9UBOEQpo0cceuE0+VLNWaxHTvoHmMC2p
	 +1RL7lOwjx7Jzs0AO58FMxp/fmZ+OJWrdYZJO2GOMTv79wp+0YCmvDkxHMUfS6FnQFKQf
	 +8sM5M8kXpniEYzzMXOc9XXgDE+oZszsbhGRqFdKspvW51mFJcAdF62XxsgJTsAJtLbx/
	 giMUDUqu/OWB3QDXf1oAeI0aJqeyyVBp02nRWioT7hsVeiPhjV4BXvOnCbRT5FGhoYlB1
	 ybbIJHwf5VH41xz/IJaZolq9eT/taKNcYx0roOQ941qz7FfkYvbvnx471xNOz6mqvLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ee7vqJqb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5996C606A31A;
	Sun,  8 Nov 2026 05:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ee7vqJqb
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794114972;
	b=oL0FJ9NN6kD2oz6KZ7Te742CtBSLQavRBod0mI3N1fe0f/Duc/E62roypS2UWZQ1Vap7
	 r7lH0bWSNTyTGWptPK3sEBNPmTzXCHsnSn82e3RvXqKZXGrp137+EGlXXnY1PUuCTAlbv
	 UsVngdUQ+wEX4uciZcnkz+UonWYb6Tt0/HncZIwTGj2bcXtt7cQToH2aAjVlTbowk16b2
	 jg/pCwy0GTeMD8EZwJ21ZMjWfw/MEmDAL0Pyvgni4T8mPAs+4G9VfpJ+pY0y1K2VPaZmx
	 eTkd7QDUhKEd8RaHqBX4huFeHYG6AoO/mw6yT1qhYpkwQC2PqLg3JZRwI1V2Otg+jLg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794114972;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=GaJ0kJ7iGwr4NJdNnl3p/qA/RRPtTceFFlBooGp8kRY=;
	b=dI08UNewVADlCq7KxMnXpkgJXsUspY8ZOuSKzIRiAO6P71L2SC8/cKMGV7jdR/R6ytUV
	 OIfdSu6dvH+GkT8Z3WcAY0lDL7uNPj3EhMI5CooIUrA94TiIVCPwky6eDRL0mTJUDbLlJ
	 6SbjxxAAK/qikYHSYwkUFO+CmPsYlPtTr965sqT8PEfXaMh8JsvpudaTUQCutsMOBnkmt
	 a4x7AQG7dLpQuJnzG/0ZBv1/yLRJR9Ab287JTrNDuY7jFE/R9xcT26SBnaeKs7nLcVVsY
	 hXAtaDKoJVhFCZVo2WPmMCpOpy80fUt//QNLlPYEE7MC/2NQ9aSEUMFnny3IZRYvJ1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D85BE1F0089F;
	Sun,  8 Nov 2026 05:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794114972;
	bh=GaJ0kJ7iGwr4NJdNnl3p/qA/RRPtTceFFlBooGp8kRY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=ee7vqJqbfoVpzwntvymbHhBetWeh4SBmLaPCjXyh4JvGWODgkrXTJmSmT8PAafYF7
	 SRDZ6W6lAsjVFAvODwDe6cUcDx0eAZJjj7XoTzX0o8puqeUkFYBKGiYklIX1sjGIEG
	 PcCmKcUUeYyZf64OCTxT13xtCj3d85Tpp74O/hhpsYAwFHAhW4ERWIRIDEH+U5/QqV
	 91JRePqZJV/wO8iDMfUdbqmaZ3Vk33dVoaZnG6KRxiJRBQuGX1owO5Gfh3XPfMbuH/
	 B7vrUW4+Aw11CkxEp74UlcC092+aJyCIJsvOdS2HrOFz6TVLui53uWB2deay4dD/SK
	 fkBJMuwqx/n5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 539F447DF7;
	Sun,  8 Nov 2026 05:16:11 +0000 (UTC)
From: DelaySystem via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Sat, 07 Nov 2026 21:16:11 -0800
Subject: [PATCH] staging: media: imx: ic-prp: add FORMAT_TRY frame interval
 support
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-batch1-m1-prp-try-v1-1-56a08f54791b@tubot.lat>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdukRYTEVzEetlGlJOLSDYIhv
 DtTj9/h/zdIYioJrtUGJosmfU8FfKogDG56CmpfDDXVLTN16F0OA+OLMVrEbB88d+ToQuKb3kP
 poslD19/zdv87zX6UkL8j2PcDkrMvbnUAAAA=
X-Change-ID: 20261107-batch1-m1-prp-try-370a050eb4db
To: slongerbeam@gmail.com
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
 vickramk.207@gmail.com, linux-staging@lists.linux.dev, 
 linux-media@vger.kernel.org, mchehab@kernel.org, imx@lists.linux.dev, 
 p.zabel@pengutronix.de, DelaySystem <DelaySystem@tubot.lat>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5034;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=WVwUtRUjTKbxdRiEtnEo30aSNjX2ZGooES481TnxQgg=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFkfWGd9fOqwyWtq5BOrH5nv1DU/vb/7omYJ/+TszM3r1
 mhZaXyX7ChlYRDjYJAVU2QRk+F5X39fJ87aas4JmDmsTCBDGLg4BWAij14yMmwO4DdmCFppdeZt
 3zWtkF+P/rv9OcNbaPl0Z+PTJUlKn34w/A94EjT/0BobpxkrN/Y+8Res3C9p1r7QOz2Rs/fG+YV
 1N5gB
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: DelaySystem <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat

From: Vickram Kapoor <vickramk.207@gmail.com>

Implement frame interval handling for V4L2_SUBDEV_FORMAT_TRY
by storing and retrieving per-pad intervals from the subdev state.
Also add a PRP-specific init_state callback to initialize TRY intervals
from the active default, and move default interval initialization to
prp_init().

Link: https://lore.kernel.org/all/20260426002659.119625-1-vickramk.207@gmail.com/
Signed-off-by: Vickram Kapoor <vickramk.207@gmail.com>
Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
Compile-tested only: x86_64, VIDEO_IMX_MEDIA=m via COMPILE_TEST, zero
warnings. No i.MX hardware here for runtime testing; hardware testing
by others is welcome.
---
 drivers/staging/media/imx/imx-ic-prp.c | 87 +++++++++++++++++++++++++---------
 1 file changed, 64 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
index b2c648149964..3f1690d22483 100644
--- a/drivers/staging/media/imx/imx-ic-prp.c
+++ b/drivers/staging/media/imx/imx-ic-prp.c
@@ -87,6 +87,18 @@ __prp_get_fmt(struct prp_priv *priv, struct v4l2_subdev_state *sd_state,
 		return &priv->format_mbus;
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
  * V4L2 subdev operations.
  */
@@ -398,22 +410,25 @@ static int prp_get_frame_interval(struct v4l2_subdev *sd,
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
 
 	if (fi->pad >= PRP_NUM_PADS)
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
@@ -421,24 +436,50 @@ static int prp_set_frame_interval(struct v4l2_subdev *sd,
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
 
 	if (fi->pad >= PRP_NUM_PADS)
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
+	for (pad = 0; pad < PRP_NUM_PADS; pad++) {
+		interval = v4l2_subdev_state_get_interval(sd_state, pad);
+		if (interval)
+			*interval = priv->frame_interval;
+	}
 
 	mutex_unlock(&priv->lock);
 
@@ -450,10 +491,6 @@ static int prp_registered(struct v4l2_subdev *sd)
 	struct prp_priv *priv = sd_to_priv(sd);
 	u32 code;
 
-	/* init default frame interval */
-	priv->frame_interval.numerator = 1;
-	priv->frame_interval.denominator = 30;
-
 	/* set a default mbus format  */
 	imx_media_enum_ipu_formats(&code, 0, PIXFMT_SEL_YUV);
 
@@ -487,7 +524,7 @@ static const struct v4l2_subdev_ops prp_subdev_ops = {
 };
 
 static const struct v4l2_subdev_internal_ops prp_internal_ops = {
-	.init_state = imx_media_init_state,
+	.init_state = prp_init_state,
 	.registered = prp_registered,
 };
 
@@ -504,6 +541,10 @@ static int prp_init(struct imx_ic_priv *ic_priv)
 	ic_priv->task_priv = priv;
 	priv->ic_priv = ic_priv;
 
+	/* init default frame interval */
+	priv->frame_interval.numerator = 1;
+	priv->frame_interval.denominator = 30;
+
 	for (i = 0; i < PRP_NUM_PADS; i++)
 		priv->pad[i].flags = (i == PRP_SINK_PAD) ?
 			MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;

---
base-commit: fa4ad798f6f681031775266044ba1b0cf3c670bd
change-id: 20261107-batch1-m1-prp-try-370a050eb4db

Best regards,
--  
DelaySystem <DelaySystem@tubot.lat>


