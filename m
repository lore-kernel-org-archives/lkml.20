Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D448445349C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979183; cv=none; b=hOIPcGHsmNb1owzV0+jg06RIId/quAvXBj0wIF0048duKwMRAdIzP+5DqksTsNwbNjscxBqJk7ossTwFKjpuID4f//JYykE0hzFmR8N9bNHO4+EmIVx+L99ZPLqiApl4GkCu8zHHL/PyQKkHlFkTSCEV6w+QWT2LrGMfkLi+X6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979183; c=relaxed/simple;
	bh=wzcmtUfyeEuXc9BS6y2gBpkkwrs5XyOwnK8a1ltB08U=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nkOIvTdhdyyhOXP6YNlfkKL3MrHz9501wxauAD0dHQ161Ux4QDNAPK7jZnDOCrt4WUe+ZxLknvD32Fa5NjK29QdFslo469wp7hGaXdkLkolNaebZet2Bu0JHEPzK3J+Idh4VJ1oCjimIvC+xdD6G3JpG0ZNL/0wvN2CcJu6tqEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Wo62Jhse; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Wo62Jhse"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789979179; x=1790238379;
	bh=ete9+J/GkxRQyhzSkSmUxwkpgWOxVOXwPTe0aK7ytNQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Wo62Jhseh/p8wGX/Ta5WAPFyVUxUFB21Yk54oRShovNlDPZjx2UefroVLeciiqYiH
	 MdSTVknTBlK2hKw5C97v1LZtpO8JbiUF8vxf+iN5HpZcf+cGfAEgCn7RgHTyjx27rr
	 IM8f4a2uamxFFly4sxuehsvynwSu/IyeOZd1tOE9nygLVYZMahsRobo1mwnN32QTwW
	 LdpW6VfS749WI9qqrzkBOSOoWnTgo2ocb4jKPflHpvzkFPoasHkoj79TNK2K+rerui
	 ZZLu7G7+y3lFSUE53orE092GDCy9WuDBdDEkWVVuzyQIvUt3RUIWWy3JowrjsaV24f
	 IXmXrhyH0AMxg==
Date: Mon, 21 Sep 2026 08:26:14 +0000
To: linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov13858: add horizontal and vertical flip controls
Message-ID: <20260921082609.30830-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: eeb5249ba19618b7438e8d3b33b0d35f73af15be
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
down, and ipu-bridge now says so - b238116ccd4b ("media: ipu-bridge: Add
upside-down quirk for Surface Pro 11"). libcamera reads that rotation and
tries to compensate with sensor flips, finds neither control, and falls
back to Rot0, so the quirk on its own names a rotation nothing can undo.

ov13b10 has the same two controls, but it is a different part and its bit
assignments do not carry over. There is no public datasheet for this one,
so these were found by experiment on a single sample: single bits written
over i2c mid-stream, each captured frame correlated against the flipped
baseline. Of every bit in 0x3820 through 0x3823 exactly two move the
image: 0x3820 BIT(4) set flips vertically, and BIT(3) cleared mirrors
horizontally. 0x3821, where the mirror sits on several other OmniVision
parts, has no effect here.

Verified through the controls against a static scene, as correlation with
the flipped reference and, as a control, with the unflipped one:

  vflip  +0.994 / +0.629    hflip  +0.973 / -0.141    both  +0.975 / -0.178

The mirror bit is active low and every mode table already sets it, so the
defaults write back what the mode list just wrote.
__v4l2_ctrl_handler_setup() runs after that list and before MODE_SELECT,
so the read-modify-write here sees the value the mode just programmed.

The Bayer order at the output does not change with either flip: per-channel
means over the four states agree to 0.2 counts in 70, and all four frames
demosaic correctly against one fixed pattern. Unlike imx219 and imx258,
whose flips select a different media bus code, these controls therefore do
not need V4L2_CTRL_FLAG_MODIFY_LAYOUT.

Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/media/i2c/ov13858.c | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index de2b79a9a0..1bf21ffbc7 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -76,6 +76,15 @@
 #define OV13858_DGTL_GAIN_DEFAULT=091024=09/* Default gain =3D 1 X */
 #define OV13858_DGTL_GAIN_STEP=09=091=09/* Each step =3D 1/1024 */
=20
+/*
+ * Readout direction. Neither flip changes the Bayer order at the output, =
so
+ * no window offset compensation is needed. The mirror bit is active low: =
the
+ * value the mode tables program already has it set.
+ */
+#define OV13858_REG_FORMAT1=09=090x3820
+#define OV13858_FORMAT1_VFLIP=09=09BIT(4)
+#define OV13858_FORMAT1_HFLIP_N=09=09BIT(3)
+
 /* Test Pattern Control */
 #define OV13858_REG_TEST_PATTERN=090x4503
 #define OV13858_TEST_PATTERN_ENABLE=09BIT(7)
@@ -1042,6 +1051,8 @@ struct ov13858 {
 =09struct v4l2_ctrl *vblank;
 =09struct v4l2_ctrl *hblank;
 =09struct v4l2_ctrl *exposure;
+=09struct v4l2_ctrl *hflip;
+=09struct v4l2_ctrl *vflip;
=20
 =09/* Current mode */
 =09const struct ov13858_mode *cur_mode;
@@ -1208,6 +1219,30 @@ static int ov13858_enable_test_pattern(struct ov1385=
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
@@ -1619,6 +1658,11 @@ static int ov13858_init_controls(struct ov13858 *ov1=
3858)
 =09=09=09  OV13858_DGTL_GAIN_MIN, OV13858_DGTL_GAIN_MAX,
 =09=09=09  OV13858_DGTL_GAIN_STEP, OV13858_DGTL_GAIN_DEFAULT);
=20
+=09ov13858->hflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
+=09=09=09=09=09   V4L2_CID_HFLIP, 0, 1, 1, 0);
+=09ov13858->vflip =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov13858_ctrl_ops,
+=09=09=09=09=09   V4L2_CID_VFLIP, 0, 1, 1, 0);
+
 =09v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov13858_ctrl_ops,
 =09=09=09=09     V4L2_CID_TEST_PATTERN,
 =09=09=09=09     ARRAY_SIZE(ov13858_test_pattern_menu) - 1,
--=20
2.54.0 (Apple Git-157)


