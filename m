Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF632931F0;
	Sat, 26 Sep 2026 08:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790409785; cv=none; b=kHDkH+nooVUiVOSipLaLuHZSjPcMRyIr064Qpod6JCJNBKZ8p214y/pI7QN6kBLxoKb1nO64M40xCcQZo/9g4k0VY/mASIyaTJAP4xbPIWIa8yWEm3tUS0ihiTf4Ult7kkMRdAAO50ixeZwJZQI9qOgpIRG60eFMoViBCsYgSPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790409785; c=relaxed/simple;
	bh=meX05x/qb+aTrfX8PdfJ8kPS9GwY7+R4mHjgfNEduQo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jQ9GKQC8Hdup/s/dz6vSgO71eBR3QNOzEIBxFBcNsgGRDYEbK8COlWGL+A4kGu8PylR7VF7a0NEANUWrXQ3lPZ5323I0aC51qgSSa8bMGqsuobCL4O3+krLyl85f0JtEmTXiWX1mRDkcDr8a/TXuAlRYcQVrLuThLFVOc/Cf/FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=lXCQQ4e6; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="lXCQQ4e6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790409772; x=1790668972;
	bh=y3QtTJM5zi6YAYgx277/9ll1wtOMyFdmMR3MXGN0KcA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lXCQQ4e6cC1QFio+E23dIfyBIgtWC2/NhT2mmsafgIuxNqgWW0fIcucV+R/lAQBz7
	 XzgqqRSpKCF5WPezO3U4mOsAxSMobi2bNRuV9lAxmzZniLTDCWZ80eFSxjWRmY3Z2W
	 5twDfL5xPxXx1FJxQ1hwRZ/Q8V8LbUAF+RJoSaSzuOx3gH8gRQfixXbyXXqrFVWtEz
	 /+Usf1rh8e1YxZnBLBKmB3PXCWU9EJw83vUFlIGB3FGiqT8J8i1r4jW+Lqq4o90gtA
	 PNuQFFP47YE3E0XkA+MvzBIeyLP2yMVVCJWNx5b+BK/OTo7+BCanPfZvyDv2zPY1WX
	 ZwdeDnHsVJVWA==
Date: Sat, 26 Sep 2026 08:02:48 +0000
To: linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v3] media: i2c: ov13858: add horizontal and vertical flip controls
Message-ID: <20260926080242.93628-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: b1c0ea2ed939e8f532f28fd12e143d7e0664dc13
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The driver programs OV13858_REG_FORMAT1 (0x3820) from its mode tables and
never exposes the readout direction, so a module mounted rotated cannot be
corrected.

The Microsoft Surface Pro 11 for Business (Intel) mounts this sensor upside
down, and ipu-bridge now says so - commit b238116ccd4b ("media: ipu-bridge:
Add upside-down quirk for Surface Pro 11"). libcamera reads that rotation
and tries to compensate with sensor flips, finds neither control, and falls
back to Rot0, so with the quirk alone the picture stays upside down in any
application that does not rotate it itself.

In 0x3820, BIT(4) set flips vertically and BIT(3) cleared mirrors - the
mirror is active low, which is ordinary for the family. There is no public
datasheet, so the bits were found by experiment: every bit of 0x3820
through 0x3823 written singly mid-stream, and exactly two move the image.
Two existing drivers agree. Intel's out-of-tree ov13858 declares 0x3820 as
a bitfield with "hflip: 0 enable, 1 disable" at BIT(3) and "vflip: 0
disable, 1 enable" at BIT(4), and writes !ctrl->val for the mirror;
ov13b10 clears BIT(3) and sets BIT(4) of the same register in tree.

Both controls were checked by eye, one static scene in all four states:
unflipped the image is upside down, vflip alone stands it up, hflip alone
mirrors it, and the two together give the view this machine needs. The
Bayer order at the output is the same in all four, so unlike imx219 and
imx258, whose flips select a different media bus code, these controls do
not need V4L2_CTRL_FLAG_MODIFY_LAYOUT.

Every mode table already sets the mirror bit, so the defaults write back
what the mode list just wrote. __v4l2_ctrl_handler_setup() runs after that
list and before MODE_SELECT, so the read-modify-write here sees the value
the mode just programmed.

The two are clustered, so a combined S_EXT_CTRLS costs one register
read-modify-write rather than two, and grabbed while streaming: nothing
here documents a mid-stream flip as safe, and imx290 and imx219 grab
theirs because on those parts it is not.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
Tested-by: German Pablo Lindo <germanpapulindez@gmail.com>
---
v3, commit message only:

 - Cites b238116ccd4b in the "commit <sha> (...)" form checkpatch asks
   for; the Media CI flagged v2 for it.
 - v2 said the quirk on its own "names a rotation nothing can undo".
   Snapshot and Firefox do undo it - they rotate the picture themselves -
   and qcam, which does not, shows it upside down. The sentence now says
   that.
 - Tested-by from German Pablo Lindo, on a second Surface Pro 11: qcam
   upright with this patch, Snapshot and Firefox unchanged.

The code is v2's, byte for byte. Sakari's set_selection() point is
answered in v2's notes, and nothing here changes it.

v2: https://lore.kernel.org/all/20260921124444.79396-1-lsa.uz@pm.me/
v1: https://lore.kernel.org/all/20260921082609.30830-1-lsa.uz@pm.me/

 drivers/media/i2c/ov13858.c | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index de2b79a9a0e..d870d2edb4f 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -76,6 +76,14 @@
 #define OV13858_DGTL_GAIN_DEFAULT=091024=09/* Default gain =3D 1 X */
 #define OV13858_DGTL_GAIN_STEP=09=091=09/* Each step =3D 1/1024 */
=20
+/*
+ * Readout direction. The mirror bit is active low, and the value every mo=
de
+ * table programs already has it set.
+ */
+#define OV13858_REG_FORMAT1=09=090x3820
+#define OV13858_FORMAT1_VFLIP=09=09BIT(4)
+#define OV13858_FORMAT1_HFLIP_N=09=09BIT(3)
+
 /* Test Pattern Control */
 #define OV13858_REG_TEST_PATTERN=090x4503
 #define OV13858_TEST_PATTERN_ENABLE=09BIT(7)
@@ -1042,6 +1050,8 @@ struct ov13858 {
 =09struct v4l2_ctrl *vblank;
 =09struct v4l2_ctrl *hblank;
 =09struct v4l2_ctrl *exposure;
+=09struct v4l2_ctrl *hflip;
+=09struct v4l2_ctrl *vflip;
=20
 =09/* Current mode */
 =09const struct ov13858_mode *cur_mode;
@@ -1208,6 +1218,31 @@ static int ov13858_enable_test_pattern(struct ov1385=
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
@@ -1254,6 +1289,10 @@ static int ov13858_set_ctrl(struct v4l2_ctrl *ctrl)
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
@@ -1481,6 +1520,13 @@ static int ov13858_set_stream(struct v4l2_subdev *sd=
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
@@ -1619,6 +1665,12 @@ static int ov13858_init_controls(struct ov13858 *ov1=
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


