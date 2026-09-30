Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08A03D9667
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753600; cv=none; b=eQq/vsYICpPgQ6OLGKNKZEHLYUmdLdDD1xcgifrd9E7rHJ9TWCquhZX/N9OCFV2A0Oad9Whr0zToVKDjvnedFik5wK3twHIrbUda/emB6Xn3l8cFFVU3ZI8tmsAg5prgpds/xJvfPBTVaA7ozq9pST+BjqRyYMEptLlZZTKyMTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753600; c=relaxed/simple;
	bh=rNrXyo3I6zRnxdvJdP3a/vp6Yxq3muePsGScf0r0uH4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QFdDnwqk5itBE9Ixx8stbVobwUhip/YPor2Xr7X9hSfCFlsdAlzblHUSJ9KpFXw2yENvQ0zPdHOyX2scJBdz3NDSnfJHYLUA/k5asCrOVisGpc46OJLxxyTJ8zGa3JoE58PNadfuNYuucL7pg8Evj9Cna+I4dBq5loGpEPaxvrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DpN/sP0F; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DpN/sP0F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790753596; x=1791012796;
	bh=SPrLrPGlq1dg57chpsJRSqrarxdfRdSY2VEL6IQUkno=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=DpN/sP0FLxS8UbuIEIcJKYqx2aOI4az8Uez6vSp39Iab0E469Cjlxpcnly8w/Rh3E
	 TcbXBYclGh/LAskI1TTlIrQ2mi+66ZOBROkDzmnhHGpiw1aox1fdEr92ZYRq1nzdn8
	 Kgj2hACnSJBLHS5PiphsiCt+qBraZfXSLSGfdwZMwOboQuS8XT7R+MBzacynXgYMWz
	 vZ9DA/EkuunbIP6ls6yto8juIENJBPTUwfluTs7b6dumGGteRbfYPc7EAEEiiE7hsC
	 6pcoAko6jRN9xuI4pSDg6kAXefOO4H1dbyz+TOrCGzwhcfjpbL85JLSY+rQUtEsRC9
	 Tt8K64jS3tYxw==
Date: Wed, 30 Sep 2026 07:33:12 +0000
To: linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v4] media: i2c: ov13858: add horizontal and vertical flip controls
Message-ID: <20260930073308.56811-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 07993aa082c165e676c74e3cfe26a62e56624603
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Microsoft Surface Pro 11 for Business (Intel) mounts this sensor
upside down, as commit b238116ccd4b ("media: ipu-bridge: Add upside-down
quirk for Surface Pro 11") records, and the driver has no flip controls
to compensate.

Add V4L2_CID_HFLIP and V4L2_CID_VFLIP on bits 3 and 4 of register 0x3820.
The mirror bit is active low, as in Intel's out-of-tree ov13858 driver.
The Bayer order does not change with either flip, so the controls do not
set V4L2_CTRL_FLAG_MODIFY_LAYOUT. They are clustered, and grabbed while
streaming.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
---
v4:
 - The comment on 0x3820 now sits on the horizontal flip bit, the only
   one it is true of. (Sakari)
 - Commit message rewritten shorter. (Sakari)
 - Assisted-by added, per Documentation/process/coding-assistants.rst.

Only a comment changed in the code, so German's Tested-by is kept.

v3: https://lore.kernel.org/all/20260926080242.93628-1-lsa.uz@pm.me/
v2: https://lore.kernel.org/all/20260921124444.79396-1-lsa.uz@pm.me/
v1: https://lore.kernel.org/all/20260921082609.30830-1-lsa.uz@pm.me/

 drivers/media/i2c/ov13858.c | 50 +++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index de2b79a9a0e..5a49fa0ec02 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -76,6 +76,12 @@
 #define OV13858_DGTL_GAIN_DEFAULT=091024=09/* Default gain =3D 1 X */
 #define OV13858_DGTL_GAIN_STEP=09=091=09/* Each step =3D 1/1024 */
=20
+/* Readout direction */
+#define OV13858_REG_FORMAT1=09=090x3820
+#define OV13858_FORMAT1_VFLIP=09=09BIT(4)
+/* Horizontal flip, active low: every mode table sets this bit */
+#define OV13858_FORMAT1_HFLIP_N=09=09BIT(3)
+
 /* Test Pattern Control */
 #define OV13858_REG_TEST_PATTERN=090x4503
 #define OV13858_TEST_PATTERN_ENABLE=09BIT(7)
@@ -1042,6 +1048,8 @@ struct ov13858 {
 =09struct v4l2_ctrl *vblank;
 =09struct v4l2_ctrl *hblank;
 =09struct v4l2_ctrl *exposure;
+=09struct v4l2_ctrl *hflip;
+=09struct v4l2_ctrl *vflip;
=20
 =09/* Current mode */
 =09const struct ov13858_mode *cur_mode;
@@ -1208,6 +1216,31 @@ static int ov13858_enable_test_pattern(struct ov1385=
8 *ov13858, u32 pattern)
 =09=09=09=09 OV13858_REG_VALUE_08BIT, val);
 }
=20
+static int ov13858_update_flips(struct ov13858 *ov13858)
+{
+=09u32 val;
+=09int ret;
+
+=09ret =3D ov13858_read_reg(ov13858, OV13858_REG_FORMAT1,
+=09=09=09       OV13858_REG_VALUE_08BIT, &val);
+=09if (ret)
+=09=09return ret;
+
+=09if (ov13858->vflip->val)
+=09=09val |=3D OV13858_FORMAT1_VFLIP;
+=09else
+=09=09val &=3D ~OV13858_FORMAT1_VFLIP;
+
+=09/* The mirror bit is active low, as it is on ov13b10. */
+=09if (ov13858->hflip->val)
+=09=09val &=3D ~OV13858_FORMAT1_HFLIP_N;
+=09else
+=09=09val |=3D OV13858_FORMAT1_HFLIP_N;
+
+=09return ov13858_write_reg(ov13858, OV13858_REG_FORMAT1,
+=09=09=09=09 OV13858_REG_VALUE_08BIT, val);
+}
+
 static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 =09struct ov13858 *ov13858 =3D container_of(ctrl->handler,
@@ -1254,6 +1287,10 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
 =09=09=09=09=09ov13858->cur_mode->height
 =09=09=09=09=09  + ctrl->val);
 =09=09break;
+=09case V4L2_CID_HFLIP:
+=09case V4L2_CID_VFLIP:
+=09=09ret =3D ov13858_update_flips(ov13858);
+=09=09break;
 =09case V4L2_CID_TEST_PATTERN:
 =09=09ret =3D ov13858_enable_test_pattern(ov13858, ctrl->val);
 =09=09break;
@@ -1481,6 +1518,13 @@ static int ov13858_set_stream(struct v4l2_subdev *sd=
, int enable)
 =09=09pm_runtime_put(ov13858->dev);
 =09}
=20
+=09/*
+=09 * Do not let the flips change while streaming. ov13858->mutex is the
+=09 * control handler's own lock and is held here, hence the __ form.
+=09 */
+=09__v4l2_ctrl_grab(ov13858->hflip, enable);
+=09__v4l2_ctrl_grab(ov13858->vflip, enable);
+
 =09mutex_unlock(&ov13858->mutex);
=20
 =09return ret;
@@ -1619,6 +1663,12 @@ static int ov13858_init_controls(struct ov13858 *ov1=
3858)
 =09=09=09  OV13858_DGTL_GAIN_MIN, OV13858_DGTL_GAIN_MAX,
 =09=09=09  OV13858_DGTL_GAIN_STEP, OV13858_DGTL_GAIN_DEFAULT);
=20
+=09ov13858->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
+=09=09=09=09=09   V4L2_CID_HFLIP, 0, 1, 1, 0);
+=09ov13858->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
+=09=09=09=09=09   V4L2_CID_VFLIP, 0, 1, 1, 0);
+=09v4l2_ctrl_cluster(2, &ov13858->hflip);
+
 =09v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov13858_ctrl_ops,
 =09=09=09=09     V4L2_CID_TEST_PATTERN,
 =09=09=09=09     ARRAY_SIZE(ov13858_test_pattern_menu) - 1,
--=20
2.54.0 (Apple Git-157)


