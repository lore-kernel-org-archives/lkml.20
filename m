Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21162499F0B;
	Mon, 21 Sep 2026 12:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789994708; cv=none; b=kBZTyiXPdSmowfHIq//GfvDkGxTxlHcYvoI+TPpEYvRXQnV6kMzwEMN1h8O1KrElz8MNbaMgAcHXQ7U8de+lV0Pr/9GRBt/D/WrOeqDBLRda3+qSLZQYnBXH7wMQZmGZpSRi6+eJ2SgD+ETnHq6v93K6tU5S08LdPShw5XuJDoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789994708; c=relaxed/simple;
	bh=IyHygcK9PRS90ceGwijeot2qscfG7au+wdie58SLxLY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lxAmNF1blU2Ry1jdHlG409utrfSdQ7DoPGHe4RDNsUQ/SzVCX4HY6dmq76CE/fHmGZXMStMwaooXXNXa1NyjFDLt/zbgiuHjUDYL6uGK0tjWtg94+g1dAiQUyKd0rkLx4YwKH0D6lqjPkMVPNHOcSFi0WVAFVJO1e0JKcX3RDSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=N1JHWwgi; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="N1JHWwgi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789994696; x=1790253896;
	bh=jtKb1NDGIMieF2lCujAV/8unN8yUqPuBdPFwECY95Gw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=N1JHWwgiMTjXIXSd+mR9KB5f5/eiuEwP6CvSp3Yl8Mx98CmsNu4DOYgMGWveaQZtR
	 CyvJWpBOA/GSSLdgQ8mHmtpH4u+aT6y9vZVR3dwH6df5gzKPwffGN3neeNqtTOeuGB
	 sOTt3lckAFtPb+bAzWFglGnyzFtSRT2ttLlDAboY5KwClRk+5uw+vRvk0wAxHmJU7e
	 zISIwIsZu6gYQBSJmM9YG6TW3ZbTQo7Jyg9QR8SeUxjawc63DmhYUKyWN/08NFgiSm
	 AD5VQosxEebhO53EXPpFnngNA3GJd+PFRHwcPvK87/bokJXcXicyILUAwdB8xiHIi1
	 vwgiZysSb50TA==
Date: Mon, 21 Sep 2026 12:44:50 +0000
To: linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: i2c: ov13858: add horizontal and vertical flip controls
Message-ID: <20260921124444.79396-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: ed0a79dfa6653de95908dd082cdbc6df73963457
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
---
Thank you, all three - three reviews in one morning, and this is a better
patch than the one I sent at the start of it.

Everything Kieran and Dave raised is in v2. Sakari's is the one point it
does not act on, and the reason is at the end rather than buried here.

The register bits and the logic are v1's; what moved is how the controls
are registered, when they can be set, and what the message claims.

Code:

 - Clustered the two controls, so a combined S_EXT_CTRLS costs one
   read-modify-write instead of two. (Dave)
 - Grabbed them while streaming. Nothing here documents a mid-stream flip
   as safe, and libcamera sets them before streaming anyway. (Dave)
 - "The mirror bit is active low" now sits beside the line that clears it,
   which is where the question was asked. (Kieran)

Message:

 - v1 said ov13b10's bit assignments do not carry over. They carry over
   exactly - v1 argued against its own best evidence. Intel's out-of-tree
   ov13858 is cited too: same part, 0x3820 as a bitfield with hflip at
   BIT(3), "0 enable, 1 disable". Thank you for the pointer. (Dave)
 - Dropped the window-offset sentence. (Dave)
 - Dropped the correlation coefficients and the "0.2 counts in 70" with
   them; they were the search, not the evidence. The sweep is still
   described, because "exactly two bits move the image" rests on it.
   (Kieran)
 - Says the controls were checked by eye in all four states, which v1
   never mentioned. The contact sheet went to Kieran off-list; glad to
   send it to anyone else who wants it.

Sakari, on selecting the crop rectangle through set_selection(): v2 does
not do that, and I do not think it can as the driver stands. ov13858 has
no get_selection or set_selection at all, so there is no crop rectangle
for the flips to move - and ov13b10, which does compensate, writes the
window offset registers and exposes none either. Whether this part shifts
its readout window internally I cannot say without a datasheet; what
userspace sees is that the Bayer order at the output does not change
across the four states.

If you would like selection support here I am glad to write it, as its own
patch rather than folded into this one - and glad to revise this one
further if any of the above is wrong.

v1: https://lore.kernel.org/all/20260921082609.30830-1-lsa.uz@pm.me/

 drivers/media/i2c/ov13858.c | 52 +++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index de2b79a9a0..d870d2edb4 100644
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


