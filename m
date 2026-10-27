Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087413;
	b=JOTjS14ivixI9apjFsoXylfNnSKwyABOHahN84yJTGeel+oVaEayRLHnVOXBFLquSc4F
	 rs3QTSEF2Q//BER1syUmFsMoC7eCvTvpi/MlHTur/C/n+87Le0D7UCxeP4UHUlfPLQfyF
	 1gB+kUqOwewaFgE5yBOOO9cIaTMxHuzYynwlqCX8sR8Vha36V8aznWoOjJzIeCNmbsLlv
	 l2D0cPpENK9T/rVcFwsN3RwIveLKkozmbSUEjjVwgcJ2SOJAsLcb0s+C+CKWuEe4/f2dZ
	 BZ8naIvEOO46uMunPoKtjYskBLKIyI96HYyMZimf2hIkURxDiHJkVyYogPY20dHGARw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087413;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=J1K9Lnr0ZDZpcUFQrfPuwDzXU/r1MJuH+CNu9zrCW+g=;
	b=SjfWAxPa0pmJiLUFY0lrckYoB87iKHYjkcVT/dqZB4qL7lAG/SBusCA1yM6I2oTetxst
	 pkvWwea8jbobW7TAMCVB5EkEOMl2zls9Q9Oa+FhCqyz9YuAd2L7dL4/18Ohye6MxEtwxM
	 gx5W0Mp3QQMtJjPwPlKOHHVnYwAtZQBzlSqtfJy9goaefRn9thvoeDbu795rn6jXu7nKx
	 4spfgDMBwjr8vLdDg1a7RbhCGzcR+E7Ul87c7Lr/QFknxK2HcR8zeEEHDU1sZ/+nc9Mpt
	 fCU8WNWXOk6LWcrXKnuHNDVhes1OvtJd7Vs3NdtamHx3UgA+9rINaiYvxN9BBmy/cVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=2pyek6gay5fdlgv37qu4itmfwm.protonmail2 header.b=sDJnZgQt;
	arc=none smtp.remote-ip=185.70.43.103
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E66C606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E66C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=2pyek6gay5fdlgv37qu4itmfwm.protonmail2 header.b=sDJnZgQt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=2pyek6gay5fdlgv37qu4itmfwm.protonmail2; t=1793087408;
	x=1793346608; bh=J1K9Lnr0ZDZpcUFQrfPuwDzXU/r1MJuH+CNu9zrCW+g=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=sDJnZgQt7BOkzyepiCTw6xuWWtCZMQLP+seEjwYvGT4Uzq6b9CmoE95EK1EWlu3E2
	 Wq6SwQYeDh0FxbWkgkOc/z+YCP0Hhk0cTbQSrdEGZPtHmgJ1/42jWjrNOdQ+8WFbSZ
	 iJXHTp1WaAkKaAkvCA6ijZ0ZipC2xzuvYEmYKSndAgBbYor22Tk1I91WSYSC5Ajx0E
	 nBDxprGbvvyypRZ0Bo5jmcc+ZgO7Yj7sSr/bWh+swbY0ZrNaYnc4GFCW414uX/ml2d
	 XqmJLMg0rxKxUj9sYMXT6b6X0Sg0ChuCn8v4mapaF94jJ/Hs/oEzn4lfe1ywrdSQcd
	 PT2c3mRUWghVQ==
Date: Tue, 27 Oct 2026 07:50:02 +0000
To: Daniel Scally <dan.scally@ideasonboard.com>
From: Simon Kruse <simon0x+git@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Fernando Rimoli <fernandorimoli11@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5693: Use sub-device active state
Message-ID: <20261027074933.21921-1-simon0x+git@proton.me>
Feedback-ID: 50827409:user:proton
X-Pm-Message-ID: 6c7811330073cffd131f0f3ba6a71a9556c12684
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Store the active format and crop rectangle in the sub-device state
instead of the driver's own ov5693_mode structure, and use the control
handler's lock as the state lock in place of the driver mutex.

The sensor mode registers are now programmed from the active state when
streaming starts, rather than from runtime resume. Binning and the
subsampling increments are derived from the format and crop rectangle
at that point, and the default vertical timing is computed where it is
needed.

get_fmt is replaced by v4l2_subdev_get_fmt(), which also makes
VIDIOC_SUBDEV_G_FMT return the try format for V4L2_SUBDEV_FORMAT_TRY
instead of the active one.

As v4l2_subdev_init_finalize() sets V4L2_SUBDEV_FL_HAS_EVENTS for
sub-devices with a control handler, control events are now supported,
fixing the v4l2-compliance failure:

  fail: v4l2-test-controls.cpp(1128): subscribe event for control 'User Con=
trols' failed
  test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Simon Kruse <simon0x+git@proton.me>
---
This replaces "[PATCH] media: i2c: ov5693: Support control events",
following Sakari's review:
https://lore.kernel.org/all/20261010142042.23253-1-simon0x+git@proton.me/

Fernando, your Tested-by was for that patch and does not carry over to
this rewrite. Could you test this one on your Surface Pro 9 as well?

Tested on a Microsoft Surface Pro 9 (Intel Alder Lake, IPU6, OVTI5693)
with media-committers next at d7e7bca71 and CONFIG_PROVE_LOCKING=3Dy:
- v4l2-compliance 1.32.0 on the sensor subdev node: 46/46
- raw captures at 2592x1944 and 1296x972, with flips, with a crop set
  via set_selection, and right after runtime resume: same results as
  without the patch
- libcamera 0.7 cam: 28.6 fps
- no lockdep reports from ov5693. Lockdep does warn on every stream
  start at ipu6-isys-queue.c:203 (ipu6_isys_buffer_list_get() called
  from ipu6_isys_csi2_enable_streams() without stream->mutex). That is
  in the IPU6 driver, not in ov5693, and I will report it separately.

 drivers/media/i2c/ov5693.c | 236 +++++++++++++++----------------------
 1 file changed, 95 insertions(+), 141 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 56599f9ca..b1cbe2a2f 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -141,9 +141,6 @@ struct ov5693_device {
 =09struct device *dev;
 =09struct regmap *regmap;
=20
-=09/* Protect against concurrent changes to controls */
-=09struct mutex lock;
-
 =09struct gpio_desc *reset;
 =09struct gpio_desc *powerdown;
 =09struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
@@ -152,16 +149,6 @@ struct ov5693_device {
 =09/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
 =09bool clock_ncont;
=20
-=09struct ov5693_mode {
-=09=09struct v4l2_rect crop;
-=09=09struct v4l2_mbus_framefmt format;
-=09=09bool binning_x;
-=09=09bool binning_y;
-=09=09unsigned int inc_x_odd;
-=09=09unsigned int inc_y_odd;
-=09=09unsigned int vts;
-=09} mode;
-
 =09struct v4l2_subdev sd;
 =09struct media_pad pad;
=20
@@ -459,9 +446,10 @@ static int ov5693_analog_gain_configure(struct ov5693_=
device *ov5693, u32 gain)
 =09return ret;
 }
=20
-static int ov5693_vts_configure(struct ov5693_device *ov5693, u32 vblank)
+static int ov5693_vts_configure(struct ov5693_device *ov5693, u32 height,
+=09=09=09=09u32 vblank)
 {
-=09u16 vts =3D ov5693->mode.format.height + vblank;
+=09u16 vts =3D height + vblank;
 =09int ret =3D 0;
=20
 =09cci_write(ov5693->regmap, OV5693_TIMING_VTS_REG, vts, &ret);
@@ -483,13 +471,18 @@ static int ov5693_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 =09struct ov5693_device *ov5693 =3D
 =09    container_of(ctrl->handler, struct ov5693_device, ctrls.handler);
+=09const struct v4l2_mbus_framefmt *format;
+=09struct v4l2_subdev_state *state;
 =09int ret =3D 0;
=20
+=09state =3D v4l2_subdev_get_locked_active_state(&ov5693->sd);
+=09format =3D v4l2_subdev_state_get_format(state, 0);
+
 =09/* If VBLANK is altered we need to update exposure to compensate */
 =09if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
 =09=09int exposure_max;
=20
-=09=09exposure_max =3D ov5693->mode.format.height + ctrl->val -
+=09=09exposure_max =3D format->height + ctrl->val -
 =09=09=09       OV5693_INTEGRATION_TIME_MARGIN;
 =09=09__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
 =09=09=09=09=09 ov5693->ctrls.exposure->minimum,
@@ -520,7 +513,7 @@ static int ov5693_s_ctrl(struct v4l2_ctrl *ctrl)
 =09=09ret =3D ov5693_flip_vert_configure(ov5693, !!ctrl->val);
 =09=09break;
 =09case V4L2_CID_VBLANK:
-=09=09ret =3D ov5693_vts_configure(ov5693, ctrl->val);
+=09=09ret =3D ov5693_vts_configure(ov5693, format->height, ctrl->val);
 =09=09break;
 =09case V4L2_CID_TEST_PATTERN:
 =09=09ret =3D ov5693_test_pattern_configure(ov5693, ctrl->val);
@@ -557,60 +550,70 @@ static const struct v4l2_ctrl_ops ov5693_ctrl_ops =3D=
 {
=20
 /* System Control Functions */
=20
-static int ov5693_mode_configure(struct ov5693_device *ov5693)
+static int ov5693_mode_configure(struct ov5693_device *ov5693,
+=09=09=09=09 struct v4l2_subdev_state *state)
 {
-=09const struct ov5693_mode *mode =3D &ov5693->mode;
+=09const struct v4l2_mbus_framefmt *format;
+=09const struct v4l2_rect *crop;
+=09unsigned int inc_x_odd, inc_y_odd;
+=09bool binning_x, binning_y;
 =09int ret =3D 0;
=20
+=09format =3D v4l2_subdev_state_get_format(state, 0);
+=09crop =3D v4l2_subdev_state_get_crop(state, 0);
+
+=09binning_x =3D format->width < crop->width;
+=09binning_y =3D format->height < crop->height;
+=09inc_x_odd =3D binning_x ? 3 : 1;
+=09inc_y_odd =3D binning_y ? 3 : 1;
+
 =09/* Crop Start X */
-=09cci_write(ov5693->regmap, OV5693_CROP_START_X_REG, mode->crop.left,
-=09=09  &ret);
+=09cci_write(ov5693->regmap, OV5693_CROP_START_X_REG, crop->left, &ret);
=20
 =09/* Offset X */
 =09cci_write(ov5693->regmap, OV5693_OFFSET_START_X_REG, 0, &ret);
=20
 =09/* Output Size X */
-=09cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_X_REG, mode->format.width,
+=09cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_X_REG, format->width,
 =09=09  &ret);
=20
 =09/* Crop End X */
 =09cci_write(ov5693->regmap, OV5693_CROP_END_X_REG,
-=09=09  mode->crop.left + mode->crop.width, &ret);
+=09=09  crop->left + crop->width, &ret);
=20
 =09/* Horizontal Total Size */
 =09cci_write(ov5693->regmap, OV5693_TIMING_HTS_REG, OV5693_FIXED_PPL,
 =09=09  &ret);
=20
 =09/* Crop Start Y */
-=09cci_write(ov5693->regmap, OV5693_CROP_START_Y_REG, mode->crop.top,
-=09=09  &ret);
+=09cci_write(ov5693->regmap, OV5693_CROP_START_Y_REG, crop->top, &ret);
=20
 =09/* Offset Y */
 =09cci_write(ov5693->regmap, OV5693_OFFSET_START_Y_REG, 0, &ret);
=20
 =09/* Output Size Y */
-=09cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_Y_REG, mode->format.height=
,
+=09cci_write(ov5693->regmap, OV5693_OUTPUT_SIZE_Y_REG, format->height,
 =09=09  &ret);
=20
 =09/* Crop End Y */
 =09cci_write(ov5693->regmap, OV5693_CROP_END_Y_REG,
-=09=09  mode->crop.top + mode->crop.height, &ret);
+=09=09  crop->top + crop->height, &ret);
=20
 =09/* Subsample X increase */
 =09cci_write(ov5693->regmap, OV5693_SUB_INC_X_REG,
-=09=09  ((mode->inc_x_odd << 4) & 0xf0) | 0x01, &ret);
+=09=09  ((inc_x_odd << 4) & 0xf0) | 0x01, &ret);
 =09/* Subsample Y increase */
 =09cci_write(ov5693->regmap, OV5693_SUB_INC_Y_REG,
-=09=09  ((mode->inc_y_odd << 4) & 0xf0) | 0x01, &ret);
+=09=09  ((inc_y_odd << 4) & 0xf0) | 0x01, &ret);
=20
 =09/* Binning */
 =09cci_update_bits(ov5693->regmap, OV5693_FORMAT1_REG,
 =09=09=09OV5693_FORMAT1_VBIN_EN,
-=09=09=09mode->binning_y ? OV5693_FORMAT1_VBIN_EN : 0, &ret);
+=09=09=09binning_y ? OV5693_FORMAT1_VBIN_EN : 0, &ret);
=20
 =09cci_update_bits(ov5693->regmap, OV5693_FORMAT2_REG,
 =09=09=09OV5693_FORMAT2_HBIN_EN,
-=09=09=09mode->binning_x ? OV5693_FORMAT2_HBIN_EN : 0, &ret);
+=09=09=09binning_x ? OV5693_FORMAT2_HBIN_EN : 0, &ret);
=20
 =09return ret;
 }
@@ -663,11 +666,6 @@ static int ov5693_sensor_init(struct ov5693_device *ov=
5693)
 =09=09return dev_err_probe(ov5693->dev, ret,
 =09=09=09=09     "global settings error\n");
=20
-=09ret =3D ov5693_mode_configure(ov5693);
-=09if (ret)
-=09=09return dev_err_probe(ov5693->dev, ret,
-=09=09=09=09     "mode configure error\n");
-
 =09ret =3D ov5693_enable_streaming(ov5693, false);
 =09if (ret)
 =09=09dev_err(ov5693->dev, "stop streaming error\n");
@@ -732,24 +730,16 @@ static int __maybe_unused ov5693_sensor_resume(struct=
 device *dev)
 =09struct ov5693_device *ov5693 =3D to_ov5693_sensor(sd);
 =09int ret;
=20
-=09mutex_lock(&ov5693->lock);
-
 =09ret =3D ov5693_sensor_powerup(ov5693);
 =09if (ret)
-=09=09goto out_unlock;
+=09=09return ret;
=20
 =09ret =3D ov5693_sensor_init(ov5693);
 =09if (ret) {
 =09=09dev_err(dev, "ov5693 sensor init failure\n");
-=09=09goto err_power;
+=09=09ov5693_sensor_powerdown(ov5693);
 =09}
=20
-=09goto out_unlock;
-
-err_power:
-=09ov5693_sensor_powerdown(ov5693);
-out_unlock:
-=09mutex_unlock(&ov5693->lock);
 =09return ret;
 }
=20
@@ -786,47 +776,6 @@ static unsigned int __ov5693_calc_vts(u32 height)
 =09return ALIGN_DOWN(OV5693_PIXEL_RATE / OV5693_FIXED_PPL / tgt_fps, 2);
 }
=20
-static struct v4l2_mbus_framefmt *
-__ov5693_get_pad_format(struct ov5693_device *ov5693,
-=09=09=09struct v4l2_subdev_state *state,
-=09=09=09unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-=09switch (which) {
-=09case V4L2_SUBDEV_FORMAT_TRY:
-=09=09return v4l2_subdev_state_get_format(state, pad);
-=09case V4L2_SUBDEV_FORMAT_ACTIVE:
-=09=09return &ov5693->mode.format;
-=09default:
-=09=09return NULL;
-=09}
-}
-
-static struct v4l2_rect *
-__ov5693_get_pad_crop(struct ov5693_device *ov5693,
-=09=09      struct v4l2_subdev_state *state,
-=09=09      unsigned int pad, enum v4l2_subdev_format_whence which)
-{
-=09switch (which) {
-=09case V4L2_SUBDEV_FORMAT_TRY:
-=09=09return v4l2_subdev_state_get_crop(state, pad);
-=09case V4L2_SUBDEV_FORMAT_ACTIVE:
-=09=09return &ov5693->mode.crop;
-=09}
-
-=09return NULL;
-}
-
-static int ov5693_get_fmt(struct v4l2_subdev *sd,
-=09=09=09  struct v4l2_subdev_state *state,
-=09=09=09  struct v4l2_subdev_format *format)
-{
-=09struct ov5693_device *ov5693 =3D to_ov5693_sensor(sd);
-
-=09format->format =3D ov5693->mode.format;
-
-=09return 0;
-}
-
 static int ov5693_set_fmt(struct v4l2_subdev *sd,
 =09=09=09  const struct v4l2_subdev_client_info *ci,
 =09=09=09  struct v4l2_subdev_state *state,
@@ -838,9 +787,10 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 =09unsigned int hratio, vratio;
 =09unsigned int width, height;
 =09unsigned int hblank;
+=09unsigned int vts;
 =09int exposure_max;
=20
-=09crop =3D __ov5693_get_pad_crop(ov5693, state, format->pad, format->whic=
h);
+=09crop =3D v4l2_subdev_state_get_crop(state, format->pad);
=20
 =09/*
 =09 * Align to two to simplify the binning calculations below, and clamp
@@ -860,8 +810,7 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 =09vratio =3D clamp_t(unsigned int,
 =09=09=09 DIV_ROUND_CLOSEST(crop->height, height), 1, 2);
=20
-=09fmt =3D __ov5693_get_pad_format(ov5693, state, format->pad,
-=09=09=09=09      format->which);
+=09fmt =3D v4l2_subdev_state_get_format(state, format->pad);
=20
 =09fmt->width =3D crop->width / hratio;
 =09fmt->height =3D crop->height / vratio;
@@ -872,34 +821,25 @@ static int ov5693_set_fmt(struct v4l2_subdev *sd,
 =09if (format->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
 =09=09return 0;
=20
-=09mutex_lock(&ov5693->lock);
-
-=09ov5693->mode.binning_x =3D hratio > 1;
-=09ov5693->mode.inc_x_odd =3D hratio > 1 ? 3 : 1;
-=09ov5693->mode.binning_y =3D vratio > 1;
-=09ov5693->mode.inc_y_odd =3D vratio > 1 ? 3 : 1;
-
-=09ov5693->mode.vts =3D __ov5693_calc_vts(fmt->height);
+=09vts =3D __ov5693_calc_vts(fmt->height);
=20
 =09__v4l2_ctrl_modify_range(ov5693->ctrls.vblank,
 =09=09=09=09 OV5693_TIMING_MIN_VTS,
 =09=09=09=09 OV5693_TIMING_MAX_VTS - fmt->height,
-=09=09=09=09 1, ov5693->mode.vts - fmt->height);
-=09__v4l2_ctrl_s_ctrl(ov5693->ctrls.vblank,
-=09=09=09   ov5693->mode.vts - fmt->height);
+=09=09=09=09 1, vts - fmt->height);
+=09__v4l2_ctrl_s_ctrl(ov5693->ctrls.vblank, vts - fmt->height);
=20
 =09hblank =3D OV5693_FIXED_PPL - fmt->width;
 =09__v4l2_ctrl_modify_range(ov5693->ctrls.hblank, hblank, hblank, 1,
 =09=09=09=09 hblank);
=20
-=09exposure_max =3D ov5693->mode.vts - OV5693_INTEGRATION_TIME_MARGIN;
+=09exposure_max =3D vts - OV5693_INTEGRATION_TIME_MARGIN;
 =09__v4l2_ctrl_modify_range(ov5693->ctrls.exposure,
 =09=09=09=09 ov5693->ctrls.exposure->minimum, exposure_max,
 =09=09=09=09 ov5693->ctrls.exposure->step,
 =09=09=09=09 min(ov5693->ctrls.exposure->val,
 =09=09=09=09     exposure_max));
=20
-=09mutex_unlock(&ov5693->lock);
 =09return 0;
 }
=20
@@ -908,14 +848,9 @@ static int ov5693_get_selection(struct v4l2_subdev *sd=
,
 =09=09=09=09struct v4l2_subdev_state *state,
 =09=09=09=09struct v4l2_subdev_selection *sel)
 {
-=09struct ov5693_device *ov5693 =3D to_ov5693_sensor(sd);
-
 =09switch (sel->target) {
 =09case V4L2_SEL_TGT_CROP:
-=09=09mutex_lock(&ov5693->lock);
-=09=09sel->r =3D *__ov5693_get_pad_crop(ov5693, state, sel->pad,
-=09=09=09=09=09=09sel->which);
-=09=09mutex_unlock(&ov5693->lock);
+=09=09sel->r =3D *v4l2_subdev_state_get_crop(state, sel->pad);
 =09=09break;
 =09case V4L2_SEL_TGT_NATIVE_SIZE:
 =09=09sel->r.top =3D 0;
@@ -942,7 +877,6 @@ static int ov5693_set_selection(struct v4l2_subdev *sd,
 =09=09=09=09struct v4l2_subdev_state *state,
 =09=09=09=09struct v4l2_subdev_selection *sel)
 {
-=09struct ov5693_device *ov5693 =3D to_ov5693_sensor(sd);
 =09struct v4l2_mbus_framefmt *format;
 =09struct v4l2_rect *__crop;
 =09struct v4l2_rect rect;
@@ -970,15 +904,14 @@ static int ov5693_set_selection(struct v4l2_subdev *s=
d,
 =09rect.height =3D min_t(unsigned int, rect.height,
 =09=09=09    OV5693_NATIVE_HEIGHT - rect.top);
=20
-=09__crop =3D __ov5693_get_pad_crop(ov5693, state, sel->pad, sel->which);
+=09__crop =3D v4l2_subdev_state_get_crop(state, sel->pad);
=20
 =09if (rect.width !=3D __crop->width || rect.height !=3D __crop->height) {
 =09=09/*
 =09=09 * Reset the output image size if the crop rectangle size has
 =09=09 * been modified.
 =09=09 */
-=09=09format =3D __ov5693_get_pad_format(ov5693, state, sel->pad,
-=09=09=09=09=09=09 sel->which);
+=09=09format =3D v4l2_subdev_state_get_format(state, sel->pad);
 =09=09format->width =3D rect.width;
 =09=09format->height =3D rect.height;
 =09}
@@ -992,26 +925,27 @@ static int ov5693_set_selection(struct v4l2_subdev *s=
d,
 static int ov5693_s_stream(struct v4l2_subdev *sd, int enable)
 {
 =09struct ov5693_device *ov5693 =3D to_ov5693_sensor(sd);
+=09struct v4l2_subdev_state *state;
 =09int ret;
=20
+=09state =3D v4l2_subdev_lock_and_get_active_state(sd);
+
 =09if (enable) {
 =09=09ret =3D pm_runtime_resume_and_get(ov5693->dev);
 =09=09if (ret)
-=09=09=09return ret;
+=09=09=09goto unlock;
+
+=09=09ret =3D ov5693_mode_configure(ov5693, state);
+=09=09if (ret)
+=09=09=09goto err_power_down;
=20
-=09=09mutex_lock(&ov5693->lock);
 =09=09ret =3D __v4l2_ctrl_handler_setup(&ov5693->ctrls.handler);
-=09=09if (ret) {
-=09=09=09mutex_unlock(&ov5693->lock);
+=09=09if (ret)
 =09=09=09goto err_power_down;
-=09=09}
=20
 =09=09ret =3D ov5693_enable_streaming(ov5693, true);
-=09=09mutex_unlock(&ov5693->lock);
 =09} else {
-=09=09mutex_lock(&ov5693->lock);
 =09=09ret =3D ov5693_enable_streaming(ov5693, false);
-=09=09mutex_unlock(&ov5693->lock);
 =09}
 =09if (ret)
 =09=09goto err_power_down;
@@ -1019,9 +953,13 @@ static int ov5693_s_stream(struct v4l2_subdev *sd, in=
t enable)
 =09if (!enable)
 =09=09pm_runtime_put(ov5693->dev);
=20
+=09v4l2_subdev_unlock_state(state);
+
 =09return 0;
 err_power_down:
 =09pm_runtime_put_noidle(ov5693->dev);
+unlock:
+=09v4l2_subdev_unlock_state(state);
 =09return ret;
 }
=20
@@ -1030,7 +968,9 @@ static int ov5693_get_frame_interval(struct v4l2_subde=
v *sd,
 =09=09=09=09     struct v4l2_subdev_frame_interval *interval)
 {
 =09struct ov5693_device *ov5693 =3D to_ov5693_sensor(sd);
-=09unsigned int framesize =3D OV5693_FIXED_PPL * (ov5693->mode.format.heig=
ht +
+=09const struct v4l2_mbus_framefmt *format =3D
+=09=09v4l2_subdev_state_get_format(sd_state, 0);
+=09unsigned int framesize =3D OV5693_FIXED_PPL * (format->height +
 =09=09=09=09 ov5693->ctrls.vblank->val);
 =09unsigned int fps =3D DIV_ROUND_CLOSEST(OV5693_PIXEL_RATE, framesize);
=20
@@ -1063,15 +1003,12 @@ static int ov5693_enum_frame_size(struct v4l2_subde=
v *sd,
 =09=09=09=09  struct v4l2_subdev_state *state,
 =09=09=09=09  struct v4l2_subdev_frame_size_enum *fse)
 {
-=09struct ov5693_device *ov5693 =3D to_ov5693_sensor(sd);
 =09struct v4l2_rect *__crop;
=20
 =09if (fse->index > 1 || fse->code !=3D MEDIA_BUS_FMT_SBGGR10_1X10)
 =09=09return -EINVAL;
=20
-=09__crop =3D __ov5693_get_pad_crop(ov5693, state, fse->pad, fse->which);
-=09if (!__crop)
-=09=09return -EINVAL;
+=09__crop =3D v4l2_subdev_state_get_crop(state, fse->pad);
=20
 =09fse->min_width =3D __crop->width / (fse->index + 1);
 =09fse->min_height =3D __crop->height / (fse->index + 1);
@@ -1088,7 +1025,7 @@ static const struct v4l2_subdev_video_ops ov5693_vide=
o_ops =3D {
 static const struct v4l2_subdev_pad_ops ov5693_pad_ops =3D {
 =09.enum_mbus_code =3D ov5693_enum_mbus_code,
 =09.enum_frame_size =3D ov5693_enum_frame_size,
-=09.get_fmt =3D ov5693_get_fmt,
+=09.get_fmt =3D v4l2_subdev_get_fmt,
 =09.set_fmt =3D ov5693_set_fmt,
 =09.get_selection =3D ov5693_get_selection,
 =09.set_selection =3D ov5693_set_selection,
@@ -1100,6 +1037,19 @@ static const struct v4l2_subdev_ops ov5693_ops =3D {
 =09.pad =3D &ov5693_pad_ops,
 };
=20
+static int ov5693_init_state(struct v4l2_subdev *sd,
+=09=09=09     struct v4l2_subdev_state *state)
+{
+=09*v4l2_subdev_state_get_crop(state, 0) =3D ov5693_default_crop;
+=09*v4l2_subdev_state_get_format(state, 0) =3D ov5693_default_fmt;
+
+=09return 0;
+}
+
+static const struct v4l2_subdev_internal_ops ov5693_internal_ops =3D {
+=09.init_state =3D ov5693_init_state,
+};
+
 /* Sensor and Driver Configuration Functions */
=20
 static int ov5693_init_controls(struct ov5693_device *ov5693)
@@ -1107,11 +1057,15 @@ static int ov5693_init_controls(struct ov5693_devic=
e *ov5693)
 =09const struct v4l2_ctrl_ops *ops =3D &ov5693_ctrl_ops;
 =09struct ov5693_v4l2_ctrls *ctrls =3D &ov5693->ctrls;
 =09struct v4l2_fwnode_device_properties props;
+=09const struct v4l2_mbus_framefmt *format =3D &ov5693_default_fmt;
 =09int vblank_max, vblank_def;
 =09int exposure_max;
+=09unsigned int vts;
 =09int hblank;
 =09int ret;
=20
+=09vts =3D __ov5693_calc_vts(format->height);
+
 =09ret =3D v4l2_ctrl_handler_init(&ctrls->handler, 12);
 =09if (ret)
 =09=09return ret;
@@ -1130,7 +1084,7 @@ static int ov5693_init_controls(struct ov5693_device =
*ov5693)
 =09=09=09=09=09      OV5693_PIXEL_RATE);
=20
 =09/* Exposure */
-=09exposure_max =3D ov5693->mode.vts - OV5693_INTEGRATION_TIME_MARGIN;
+=09exposure_max =3D vts - OV5693_INTEGRATION_TIME_MARGIN;
 =09ctrls->exposure =3D v4l2_ctrl_new_std(&ctrls->handler, ops,
 =09=09=09=09=09    V4L2_CID_EXPOSURE,
 =09=09=09=09=09    OV5693_EXPOSURE_MIN, exposure_max,
@@ -1158,7 +1112,7 @@ static int ov5693_init_controls(struct ov5693_device =
*ov5693)
 =09ctrls->vflip =3D v4l2_ctrl_new_std(&ctrls->handler, ops,
 =09=09=09=09=09 V4L2_CID_VFLIP, 0, 1, 1, 0);
=20
-=09hblank =3D OV5693_FIXED_PPL - ov5693->mode.format.width;
+=09hblank =3D OV5693_FIXED_PPL - format->width;
 =09ctrls->hblank =3D v4l2_ctrl_new_std(&ctrls->handler, ops,
 =09=09=09=09=09  V4L2_CID_HBLANK, hblank,
 =09=09=09=09=09  hblank, 1, hblank);
@@ -1166,8 +1120,8 @@ static int ov5693_init_controls(struct ov5693_device =
*ov5693)
 =09if (ctrls->hblank)
 =09=09ctrls->hblank->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
=20
-=09vblank_max =3D OV5693_TIMING_MAX_VTS - ov5693->mode.format.height;
-=09vblank_def =3D ov5693->mode.vts - ov5693->mode.format.height;
+=09vblank_max =3D OV5693_TIMING_MAX_VTS - format->height;
+=09vblank_def =3D vts - format->height;
 =09ctrls->vblank =3D v4l2_ctrl_new_std(&ctrls->handler, ops,
 =09=09=09=09=09  V4L2_CID_VBLANK,
 =09=09=09=09=09  OV5693_TIMING_MIN_VTS,
@@ -1195,8 +1149,6 @@ static int ov5693_init_controls(struct ov5693_device =
*ov5693)
 =09if (ret)
 =09=09goto err_free_handler;
=20
-=09/* Use same lock for controls as for everything else. */
-=09ctrls->handler.lock =3D &ov5693->lock;
 =09ov5693->sd.ctrl_handler =3D &ctrls->handler;
=20
 =09return 0;
@@ -1312,9 +1264,8 @@ static int ov5693_probe(struct i2c_client *client)
 =09if (ret)
 =09=09return ret;
=20
-=09mutex_init(&ov5693->lock);
-
 =09v4l2_i2c_subdev_init(&ov5693->sd, client, &ov5693_ops);
+=09ov5693->sd.internal_ops =3D &ov5693_internal_ops;
=20
 =09ov5693->xvclk =3D devm_v4l2_sensor_clk_get(&client->dev, "xvclk");
 =09if (IS_ERR(ov5693->xvclk))
@@ -1340,10 +1291,6 @@ static int ov5693_probe(struct i2c_client *client)
 =09ov5693->pad.flags =3D MEDIA_PAD_FL_SOURCE;
 =09ov5693->sd.entity.function =3D MEDIA_ENT_F_CAM_SENSOR;
=20
-=09ov5693->mode.crop =3D ov5693_default_crop;
-=09ov5693->mode.format =3D ov5693_default_fmt;
-=09ov5693->mode.vts =3D __ov5693_calc_vts(ov5693->mode.format.height);
-
 =09ret =3D ov5693_init_controls(ov5693);
 =09if (ret)
 =09=09return ret;
@@ -1352,6 +1299,11 @@ static int ov5693_probe(struct i2c_client *client)
 =09if (ret)
 =09=09goto err_ctrl_handler_free;
=20
+=09ov5693->sd.state_lock =3D ov5693->ctrls.handler.lock;
+=09ret =3D v4l2_subdev_init_finalize(&ov5693->sd);
+=09if (ret)
+=09=09goto err_media_entity_cleanup;
+
 =09/*
 =09 * We need the driver to work in the event that pm runtime is disable i=
n
 =09 * the kernel, so power up and verify the chip now. In the event that
@@ -1361,7 +1313,7 @@ static int ov5693_probe(struct i2c_client *client)
=20
 =09ret =3D ov5693_sensor_powerup(ov5693);
 =09if (ret)
-=09=09goto err_media_entity_cleanup;
+=09=09goto err_subdev_cleanup;
=20
 =09ret =3D ov5693_detect(ov5693);
 =09if (ret)
@@ -1389,6 +1341,8 @@ static int ov5693_probe(struct i2c_client *client)
 =09pm_runtime_put_noidle(&client->dev);
 err_powerdown:
 =09ov5693_sensor_powerdown(ov5693);
+err_subdev_cleanup:
+=09v4l2_subdev_cleanup(&ov5693->sd);
 err_media_entity_cleanup:
 =09media_entity_cleanup(&ov5693->sd.entity);
 err_ctrl_handler_free:
@@ -1403,9 +1357,9 @@ static void ov5693_remove(struct i2c_client *client)
 =09struct ov5693_device *ov5693 =3D to_ov5693_sensor(sd);
=20
 =09v4l2_async_unregister_subdev(sd);
+=09v4l2_subdev_cleanup(sd);
 =09media_entity_cleanup(&ov5693->sd.entity);
 =09v4l2_ctrl_handler_free(&ov5693->ctrls.handler);
-=09mutex_destroy(&ov5693->lock);
=20
 =09/*
 =09 * Disable runtime PM. In case runtime PM is disabled in the kernel,

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
--=20
2.53.0


