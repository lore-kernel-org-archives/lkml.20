Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792794709;
	b=spOoexol8K4jHMCTsJKApc0tse3F7u+PChW6oEqR0qOvxtTTt39hGx9uHt6b1sWjgu6S
	 fuvnu3MK34xUxJt+RC3oe4zDuBwVIROXBIdrXeDk/duNjmUd3nq+b3V2OXo5+vGWcQLc1
	 qH+ppzZbVFD5eI7lh/AQVS/fabZ4XwfwKfnnxw0J5Hqkmz2nyU8CXSko/tXfzhGTMdcXf
	 xh0ENmf5odbHj73X7vTZXGVReLlWhJgg/AXk9+7+v4xxU443ZLOmyvrlNQBVHt8EXk5LZ
	 XAybiLCcMmT9P6EyR6G1vrr22vKbQozw7Myl9lueBCdfttlWuagHxgC62SNoOMOrO2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792794709;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YQBOc/CM354sSqrkphJzRZWH7Zi2IGtop00U9K950TU=;
	b=h9TBRku6pSa0o0pMZdPbWMFkqQfUtqVOS+pBKmo28yvx9QLhYaB1h4nXndDJ9NVRxPwg
	 hj1QMvOOblXA9y3WotuvA7AfCgZMDuBWxh/ZHfwcpnXKdC37+otynZ/l94AWiZWJtz/SR
	 2h4pqdQQY9D6BFbeHL+AdoyksQ0mhNDWXKXEoFxCrCdspvQfZ5ZM5YA46HgmeG76G3tR2
	 4h9YVkVdDNMFkAgh1waza+qPJ/0vCFA/8KD0WNeJcTBl0/N2GRVyVDxTsfPNA4S4FgOr9
	 Gjcrx3VBk1oy5o04v1uFcJzp9J8DXI4Dof/9jAtNz1gXAA7stoehla00Llu6PkPduJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MGet/0ig";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5F606A31A;
	Fri, 23 Oct 2026 22:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MGet/0ig
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792794708;
	b=XGar0sTNo61qyypLPAVRuxQJB8qeniWhX/jgZYhPGOvzOhR812ggNpRFVELTdCCj3+wI
	 Yta2hp3sjcZJaw6h2qqlQgqgzVe8ncdFYF7+nTUHa6FFgi7J9IlU4HwxYV2QFBTuSfvWz
	 dKk8k2iW2YhpjFJnWnEGWeVGB00vDTk5BCFvVRlKj6WRO77D2yKCmxbnScNSMhqKWUdD5
	 72SDcsAtf738A0gU8wPuPDNG0yNxm+ERJk4wHyeU1qgPKWMSKFcsuLBjj8twMR82UT2fG
	 +M5olLvFrQJCRpiJwZJlLRRlympG2uuzhoQImIknkFWezsOcnaxHdOCVsRcaq8QHXWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792794708;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YQBOc/CM354sSqrkphJzRZWH7Zi2IGtop00U9K950TU=;
	b=nivISNwaRrjEEERngXZw5mr+JWMAK806NcwSuyLv5T4z38nOIq6Kk9DQUp6C27emjbFw
	 aeKi7nyzowi7toG1vpZIt60IX5zgI0pJqfJ29P6aJ7/mYCRoEjZ/QgyCUkpSEjty0/qjW
	 JOSu+rOsD5dvyD/c65Djr2RLD+kc+maefRnR/4aecbUgNH2dQ5nFfaL/UsnwUPMZDBFDI
	 nFOyUN0iMkkqtrfNiUV07XyRy77JO3Tmv/qofEBW9mzlmK9wkyD8kbqHrbPlC5JtjL6fw
	 Iu4SNhwoI1/+0uHwbdCweTCNT5kb1NWibuhXJ90XAs79oAA3cYI+Taw0axSES/hheAQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82C1E1F01829;
	Fri, 23 Oct 2026 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792794708;
	bh=YQBOc/CM354sSqrkphJzRZWH7Zi2IGtop00U9K950TU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MGet/0igxrsipMBpX5Q0BR+Z1n5w1MgqqFP4HNKjHfSz0dw7aP7f88kh5bM9Aot8/
	 N0j506dPFykzYU9z8k7QeZ7E8tpaD2InHrdVTuM2iXMzuhhjPtiZdw73ssNPbcbcbf
	 bPsGVDLIMFlsPt088i5cOfeHVnFQWMRy9utSWh32EumqugIMpgbx0xpjttOCngThFg
	 cEfd3aTCIWP4EnUHoj6327DlFxQOpE/xXxPYMEua7DuDaVXffo6sdluncLVANLzw4Y
	 QVI9JBblbncph/jfd8gcas4q9v9XqhYnTndae/OuBls1yADULBiXptIrZXU7JNPTKm
	 4idSOM1v3QKZw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 09F4A44661;
	Fri, 23 Oct 2026 22:31:47 +0000 (UTC)
From: Max Bretschneider via B4 Relay <devnull+max.bretschneider.leica-geosystems.com@kernel.org>
Date: Sat, 24 Oct 2026 00:28:54 +0200
Subject: [PATCH v2 4/4] media: i2c: ov08d10: add get_selection support
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
Message-Id: <20261024-ov08d10-get-selection-v2-4-f8c49972ca18@leica-geosystems.com>
References: <20261024-ov08d10-get-selection-v2-0-f8c49972ca18@leica-geosystems.com>
In-Reply-To: <20261024-ov08d10-get-selection-v2-0-f8c49972ca18@leica-geosystems.com>
To: Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Max Bretschneider <max.bretschneider@leica-geosystems.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792794706; l=4916;
 i=max.bretschneider@leica-geosystems.com; s=20260501;
 h=from:subject:message-id;
 bh=pSPbfW/+rQXIuQoU/4hrAg5l2fsycIgBp7w9O8RjxoE=;
 b=zoQokf57qmjGEky4VZ/Z/6RraDLuWEPTwXHwQplZUWcK/7SQxcfb41UenzEFp2UzWJzx8rMWn
 npE8Fr5YQBOCEo6VMB+YifxjKIyb+vzktfm86Dzi462BmqNBx34pRxP
X-Developer-Key: i=max.bretschneider@leica-geosystems.com; a=ed25519;
 pk=jf4ba33jrWlsOdGemi2InMtJAngoJVZU8Moetp0ixik=
X-Endpoint-Received: by B4 Relay for
 max.bretschneider@leica-geosystems.com/20260501 with auth_id=1161
X-Original-From: Max Bretschneider <max.bretschneider@leica-geosystems.com>
Reply-To: max.bretschneider@leica-geosystems.com
Content-Transfer-Encoding: 7bit

From: Max Bretschneider <max.bretschneider@leica-geosystems.com>

The driver does not implement .get_selection, so it never reports the
analogue crop rectangle of the active mode. Userspace has no way to learn
which region of the pixel array a given mode reads out, and cannot assume
a fixed one, because the modes differ: the full mode reads 3280x2460 at
offset (4,8), while the 3264x2448 and the 2x2 binned 1632x1224 modes read
3264x2448 at offset (12,16).

Consumers that derive the sensor scale from the analogue crop and the
output size therefore compute a wrong result for the cropped and binned
modes, and may reject those configurations.

Track the analogue crop rectangle per mode, store it in the subdev state
when the format is set, and report it through .get_selection. Also report
V4L2_SEL_TGT_CROP_DEFAULT, V4L2_SEL_TGT_CROP_BOUNDS and
V4L2_SEL_TGT_NATIVE_SIZE from the pixel array geometry.

The pixel array geometry and the per-mode offsets are taken from the
sensor datasheet and the recommended reference register sets.

Signed-off-by: Max Bretschneider <max.bretschneider@leica-geosystems.com>
---
 drivers/media/i2c/ov08d10.c | 50 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov08d10.c b/drivers/media/i2c/ov08d10.c
index 4b503ddfa042..2e5ae8c49067 100644
--- a/drivers/media/i2c/ov08d10.c
+++ b/drivers/media/i2c/ov08d10.c
@@ -65,6 +65,14 @@
 #define OV08D10_REG_FLIP_OPT			0x32
 #define OV08D10_REG_FLIP_MASK			0x3
 
+/* OV08D10 native and active pixel array size */
+#define OV08D10_NATIVE_WIDTH			3288
+#define OV08D10_NATIVE_HEIGHT			2476
+#define OV08D10_PIXEL_ARRAY_LEFT		4
+#define OV08D10_PIXEL_ARRAY_TOP			8
+#define OV08D10_PIXEL_ARRAY_WIDTH		3280
+#define OV08D10_PIXEL_ARRAY_HEIGHT		2464
+
 #define to_ov08d10(_sd)		container_of(_sd, struct ov08d10, sd)
 
 struct ov08d10_reg {
@@ -110,6 +118,9 @@ struct ov08d10_mode {
 
 	/* Number of data lanes */
 	u8 data_lanes;
+
+	/* Analogue crop rectangle, in native sensor coordinates */
+	struct v4l2_rect crop;
 };
 
 /* 3280x2460, 3264x2448 need 720Mbps/lane, 2 lanes - 19.2 MHz */
@@ -624,6 +635,7 @@ static const struct ov08d10_lane_cfg lane_cfg_2 = {
 		},
 		.link_freq_index = 0,
 		.data_lanes = 2,
+		.crop = { .left =  4, .top =  8, .width = 3280, .height = 2460 },
 	},
 	{
 		.width = 3264,
@@ -637,6 +649,7 @@ static const struct ov08d10_lane_cfg lane_cfg_2 = {
 		},
 		.link_freq_index = 0,
 		.data_lanes = 2,
+		.crop = { .left = 12, .top = 16, .width = 3264, .height = 2448 },
 	},
 	{
 		.width = 1632,
@@ -650,6 +663,7 @@ static const struct ov08d10_lane_cfg lane_cfg_2 = {
 		},
 		.link_freq_index = 1,
 		.data_lanes = 2,
+		.crop = { .left = 12, .top = 16, .width = 3264, .height = 2448 },
 	}}
 };
 
@@ -1209,6 +1223,7 @@ static int ov08d10_set_format(struct v4l2_subdev *sd,
 
 	ov08d10_update_pad_format(ov08d10, mode, &fmt->format);
 	*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+	*v4l2_subdev_state_get_crop(sd_state, fmt->pad) = mode->crop;
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		__v4l2_ctrl_s_ctrl(ov08d10->link_freq, mode->link_freq_index);
@@ -1270,13 +1285,45 @@ static int ov08d10_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov08d10_get_selection(struct v4l2_subdev *sd,
+				 const struct v4l2_subdev_client_info *ci,
+				 struct v4l2_subdev_state *sd_state,
+				 struct v4l2_subdev_selection *sel)
+{
+	switch (sel->target) {
+	case V4L2_SEL_TGT_CROP:
+		sel->r = *v4l2_subdev_state_get_crop(sd_state, sel->pad);
+		return 0;
+
+	case V4L2_SEL_TGT_NATIVE_SIZE:
+		sel->r.left = 0;
+		sel->r.top = 0;
+		sel->r.width = OV08D10_NATIVE_WIDTH;
+		sel->r.height = OV08D10_NATIVE_HEIGHT;
+		return 0;
+
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+		sel->r.left = OV08D10_PIXEL_ARRAY_LEFT;
+		sel->r.top = OV08D10_PIXEL_ARRAY_TOP;
+		sel->r.width = OV08D10_PIXEL_ARRAY_WIDTH;
+		sel->r.height = OV08D10_PIXEL_ARRAY_HEIGHT;
+		return 0;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 static int ov08d10_init_state(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_state *sd_state)
 {
 	struct ov08d10 *ov08d10 = to_ov08d10(sd);
+	const struct ov08d10_mode *mode = &ov08d10->priv_lane->sp_modes[0];
 
-	ov08d10_update_pad_format(ov08d10, &ov08d10->priv_lane->sp_modes[0],
+	ov08d10_update_pad_format(ov08d10, mode,
 				  v4l2_subdev_state_get_format(sd_state, 0));
+	*v4l2_subdev_state_get_crop(sd_state, 0) = mode->crop;
 
 	return 0;
 }
@@ -1290,6 +1337,7 @@ static const struct v4l2_subdev_pad_ops ov08d10_pad_ops = {
 	.get_fmt = v4l2_subdev_get_fmt,
 	.enum_mbus_code = ov08d10_enum_mbus_code,
 	.enum_frame_size = ov08d10_enum_frame_size,
+	.get_selection = ov08d10_get_selection,
 };
 
 static const struct v4l2_subdev_ops ov08d10_subdev_ops = {

-- 
2.43.0


