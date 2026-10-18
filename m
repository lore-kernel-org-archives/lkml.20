Received: from mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8FB3D5227
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792353653; cv=none; b=rYRLr+HyO6b3Ic1FlVlh5k+GeSapVdGUBoDX3TOo19lU+WYLdG8z82pFOuDCODCFWOBN/thnj9j6REh+Ko/Z4FsWp/c5P/uDjZWVtLSfN0dcAu2w+HwEfO00+nR/Nex8Fl26rgLH7f0ewszKA/eFRfFUPz8ngI894F1NVCc6TgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792353653; c=relaxed/simple;
	bh=4aItiQSQYYnvXfaipYf57ulgatmHVXLdjvSUIgWTu/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+Q/+yTwjBsQepgTQux/sI4CuIUrGjyy12jNRhUjgdCaqilhtA8AVr7KUbiZWVMiV2MJKuuDgvVwozSFTTb4Vfqvo4tsJNVmyYwJ2ZnmTeYZE3oPHB1O6GFs0MOWhBF2QApCAHJFlWeql0zwstjHFMb+iI/8O1yuUFV9wF1yVyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IBziNFAy; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IBziNFAy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4aItiQSQYYnvXfaipYf57ulgatmHVXLdjvSUIgWTu/A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792353649; v=1; x=1792958449;
 b=IBziNFAyDToYcVpyLzpfb+9ER4XdyCTTJtPHneFCultl2h5RTcfdTpTaQOBCX5cncikLSvvW
 GUCudqP0kO92+tXAey2OzZzan1VclAhicBDAAtXI1E1OkUKPw1KZ+zP+AX6Ggmwvl52FD2ltB3y
 OS5j6T/AKdB1lNPYIac8dSOI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fa61837c5cf8c2cc;
	Sun, 18 Oct 2026 20:00:48 +0000
X-Mizu-Trace-ID: fa61837c5cf8c2cc
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Lee Mann <leepaulmann@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andrey Golovko <andrey.golovko@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ASoC: tas2783-sdw: keep the volume settings across resets
Date: Sun, 18 Oct 2026 13:00:06 -0700
Message-ID: <20261018200009.1493438-2-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register cache is dropped when the amp attaches uninitialized and
again after the firmware download, so the Amp Volume and Speaker Volume
registers are not cached while the amp is runtime suspended, and every
read or write of those controls fails with -EBUSY. On a platform that
powers the SoundWire link off when idle, such as the ASUS ROG Xbox Ally
X20, the amp is also reset and initialized again on every wake, so a
volume set while it was awake is lost the next time the link idles.

Keep both settings in the driver, as the cache has to be dropped
whenever the reset and the firmware download change registers behind
it. Reads return the kept value, a write reaches the device only while
it is runtime active and initialized, and the settings are programmed
again after every init and resume. Until userspace sets a control, the
value the firmware leaves after each init is adopted instead, so its
tuning stays in effect. Waking the amp for a control access would
instead cost a full init of both X20 amps, about 0.2 s each.

Fixes: b627da430357 ("ASoC: tas2783-sdw: drop stale regcache on uninitialized re-attach")
Reported-by: Lee Mann <leepaulmann@gmail.com>
Link: https://lore.kernel.org/r/20261016102846.22908-1-leepaulmann@gmail.com
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/codecs/tas2783-sdw.c | 159 +++++++++++++++++++++++++++++++--
 1 file changed, 151 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index a57230e01f75..ebb52efc1edf 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -12,6 +12,7 @@
 // Author: Baojun Xu <baojun.xu@ti.com>
 // Author: Kevin Lu <kevin-lu@ti.com>
 
+#include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/crc32.h>
@@ -89,6 +90,15 @@ struct tas2783_prv {
 	struct mutex calib_lock;
 	/* pde and firmware download */
 	struct mutex pde_lock;
+	/* volume settings, kept across resets */
+	struct mutex vol_lock;
+	unsigned int amp_level;
+	unsigned int dvc_level;
+	/* set by userspace, so program it instead of adopting it */
+	bool amp_set;
+	bool dvc_set;
+	/* runtime active, so volume writes reach the device */
+	bool vol_live;
 	struct regmap *regmap;
 	struct device *dev;
 	struct class *class;
@@ -530,36 +540,151 @@ static const struct regmap_sdw_mbq_cfg tas2783_mbq_cfg = {
 	.mbq_size = tas2783_sdca_mbq_size,
 };
 
+#define TAS2783_AMP_LEVEL_MAX	20
+#define TAS2783_DVC_LVL_MAX	200
+
+/* forced, as a failed write leaves the new value in the cache */
+static s32 tas2783_write_amp_level(struct tas2783_prv *tas_dev,
+				   unsigned int level)
+{
+	return regmap_write_bits(tas_dev->regmap, TAS2783_AMP_LEVEL,
+				 TAS2783_AMP_LEVEL_MASK,
+				 FIELD_PREP(TAS2783_AMP_LEVEL_MASK, level));
+}
+
+static s32 tas2783_write_dvc_level(struct tas2783_prv *tas_dev,
+				   unsigned int level)
+{
+	return regmap_write(tas_dev->regmap, TAS2783_DVC_LVL,
+			    TAS2783_DVC_LVL_MAX - level);
+}
+
+/* program the volume settings userspace set, adopt the firmware ones */
+static s32 tas2783_sync_volume(struct tas2783_prv *tas_dev)
+{
+	unsigned int val;
+	s32 ret;
+
+	lockdep_assert_held(&tas_dev->vol_lock);
+
+	if (tas_dev->amp_set) {
+		ret = tas2783_write_amp_level(tas_dev, tas_dev->amp_level);
+	} else {
+		ret = regmap_read(tas_dev->regmap, TAS2783_AMP_LEVEL, &val);
+		if (!ret) {
+			val = FIELD_GET(TAS2783_AMP_LEVEL_MASK, val);
+			tas_dev->amp_level = umin(val, TAS2783_AMP_LEVEL_MAX);
+		}
+	}
+	if (ret)
+		return ret;
+
+	if (tas_dev->dvc_set)
+		return tas2783_write_dvc_level(tas_dev, tas_dev->dvc_level);
+
+	ret = regmap_read(tas_dev->regmap, TAS2783_DVC_LVL, &val);
+	if (!ret)
+		tas_dev->dvc_level = TAS2783_DVC_LVL_MAX -
+				     umin(val, TAS2783_DVC_LVL_MAX);
+
+	return ret;
+}
+
+static bool tas2783_vol_valid(struct snd_kcontrol *kcontrol, long val)
+{
+	struct soc_mixer_control *mc =
+		(struct soc_mixer_control *)kcontrol->private_value;
+
+	if (mc->platform_max && val > mc->platform_max)
+		return false;
+
+	return val >= 0 && val <= mc->max;
+}
+
 static s32 tas2783_digital_getvol(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	return snd_soc_get_volsw(kcontrol, ucontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
+
+	guard(mutex)(&tas_dev->vol_lock);
+	ucontrol->value.integer.value[0] = tas_dev->dvc_level;
+
+	return 0;
 }
 
 static s32 tas2783_digital_putvol(struct snd_kcontrol *kcontrol,
 				  struct snd_ctl_elem_value *ucontrol)
 {
-	return snd_soc_put_volsw(kcontrol, ucontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
+	long val = ucontrol->value.integer.value[0];
+	s32 ret;
+
+	if (!tas2783_vol_valid(kcontrol, val))
+		return -EINVAL;
+
+	guard(mutex)(&tas_dev->vol_lock);
+	if (tas_dev->vol_live && tas_dev->hw_init) {
+		ret = tas2783_write_dvc_level(tas_dev, val);
+		if (ret)
+			return ret;
+	}
+
+	tas_dev->dvc_set = true;
+	if (val == tas_dev->dvc_level)
+		return 0;
+
+	tas_dev->dvc_level = val;
+
+	return 1;
 }
 
 static s32 tas2783_amp_getvol(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	return snd_soc_get_volsw(kcontrol, ucontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
+
+	guard(mutex)(&tas_dev->vol_lock);
+	ucontrol->value.integer.value[0] = tas_dev->amp_level;
+
+	return 0;
 }
 
 static s32 tas2783_amp_putvol(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	return snd_soc_put_volsw(kcontrol, ucontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct tas2783_prv *tas_dev = snd_soc_component_get_drvdata(component);
+	long val = ucontrol->value.integer.value[0];
+	s32 ret;
+
+	if (!tas2783_vol_valid(kcontrol, val))
+		return -EINVAL;
+
+	guard(mutex)(&tas_dev->vol_lock);
+	if (tas_dev->vol_live && tas_dev->hw_init) {
+		ret = tas2783_write_amp_level(tas_dev, val);
+		if (ret)
+			return ret;
+	}
+
+	tas_dev->amp_set = true;
+	if (val == tas_dev->amp_level)
+		return 0;
+
+	tas_dev->amp_level = val;
+
+	return 1;
 }
 
 static const struct snd_kcontrol_new tas2783_snd_controls[] = {
 	SOC_SINGLE_RANGE_EXT_TLV("Amp Volume", TAS2783_AMP_LEVEL,
-				 1, 0, 20, 0, tas2783_amp_getvol,
+				 1, 0, TAS2783_AMP_LEVEL_MAX, 0, tas2783_amp_getvol,
 				 tas2783_amp_putvol, tas2781_amp_tlv),
 	SOC_SINGLE_RANGE_EXT_TLV("Speaker Volume", TAS2783_DVC_LVL,
-				 0, 0, 200, 1, tas2783_digital_getvol,
+				 0, 0, TAS2783_DVC_LVL_MAX, 1, tas2783_digital_getvol,
 				 tas2783_digital_putvol, tas2781_dvc_tlv),
 };
 
@@ -1116,6 +1241,9 @@ static s32 tas2783_sdca_dev_suspend(struct device *dev)
 {
 	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
 
+	scoped_guard(mutex, &tas_dev->vol_lock)
+		tas_dev->vol_live = false;
+
 	if (!tas_dev->hw_init)
 		return 0;
 
@@ -1148,6 +1276,14 @@ static s32 tas2783_sdca_dev_resume(struct device *dev)
 		return ret;
 	}
 
+	guard(mutex)(&tas_dev->vol_lock);
+	if (tas_dev->hw_init) {
+		ret = tas2783_sync_volume(tas_dev);
+		if (ret)
+			return ret;
+	}
+	tas_dev->vol_live = true;
+
 	return 0;
 }
 
@@ -1245,11 +1381,14 @@ static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
 
 		/* Re-active AMP after resume. */
 		regmap_write(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 2), 0);
+		if (!ret) {
+			guard(mutex)(&tas_dev->vol_lock);
+			ret = tas2783_sync_volume(tas_dev);
+			tas_dev->hw_init = !ret;
+		}
 		if (ret)
 			dev_err(tas_dev->dev,
 				"init writes failed, err=%d", ret);
-		else
-			tas_dev->hw_init = true;
 	}
 
 	return ret;
@@ -1427,6 +1566,9 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 	tas_dev->fw_version = 0;
 	mutex_init(&tas_dev->calib_lock);
 	mutex_init(&tas_dev->pde_lock);
+	mutex_init(&tas_dev->vol_lock);
+	tas_dev->amp_level = TAS2783_AMP_LEVEL_MAX;
+	tas_dev->dvc_level = TAS2783_DVC_LVL_MAX;
 
 	init_waitqueue_head(&tas_dev->fw_wait);
 	dev_set_drvdata(dev, tas_dev);
@@ -1452,6 +1594,7 @@ static void tas_sdw_remove(struct sdw_slave *peripheral)
 	tas_remove(tas_dev);
 	mutex_destroy(&tas_dev->calib_lock);
 	mutex_destroy(&tas_dev->pde_lock);
+	mutex_destroy(&tas_dev->vol_lock);
 	dev_set_drvdata(&peripheral->dev, NULL);
 }
 
-- 
2.56.0

