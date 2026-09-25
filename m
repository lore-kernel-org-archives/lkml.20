Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD844519BB;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790322451; cv=none; b=lcVxG7lU3D5y7UCshD3L+gvz2bhHK6+pmKYIlquGDV8/tWwkfJSrw+cRYL6kZQUF+O3bhg8gQCO0922gcmBPeStnAAmx/Smnox4+x6EBzhtxrQDpo4nbkcLexFFl4N7N+F1E7LohxDNS+5gk9DM99kZqiGNTeQdDFxgC5Pjtb4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790322451; c=relaxed/simple;
	bh=wRQj1jGdJpPogEyBWPzlxR2QbDgoPw+HOw6mei+3EjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ff3PXrqBkWHBuDzspHzS1JC+wuAXkMt25hA/JPMhSzfzAWGH73miVvKAgvtsBs1LKfUtRq5HieHTjZGqU7bEnVLeJyViW9SpegCWV1nIXQqJ9d1HRDR7Z7HWn3cwa2V8km8dROkgw9PvNWzOnVc34m+ocrzSrWcHo8RkgJM5+AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/nNUmyf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/nNUmyf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19662C2BCFD;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790322451;
	bh=wRQj1jGdJpPogEyBWPzlxR2QbDgoPw+HOw6mei+3EjI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=l/nNUmyf41ND1QX1T/jQ9STX7kClXUBmVQMOWrzo0k3+c8xbXN7m/3l05Xys78bG6
	 z+JnjW9RoySDWERpuwIPrsZ6oH+DLCI1EzcyAXkXytu8DdjQc+BF8tBENwyBuqE/gx
	 RzmypuX77IOtUXVJA7gKIwZZvsIrkix/Tf6lv0Vy6PeRzMEfpDbfmfXNJTP0wUo3x+
	 EWfhfx6mPlK4wex8iU9riPaiXwTRUSlomYQtzbxtJMLjoxoXA1XOyvgJO3NmBu9ajK
	 eKI5G8T3hcxwxU8F9jkxrpZycaYXmHWWJAHfcogbZhT8s/3fKH7Al/lbrL47zR2iU3
	 TYi0EUYGKVXQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F0DC98326;
	Fri, 25 Sep 2026 07:47:31 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Fri, 25 Sep 2026 02:47:32 -0500
Subject: [PATCH 4/6] ASoC: codecs: aw88166: remove fade in/out on
 start/stop
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-aw88166-cleanup-v1-4-11f74cb5fe28@gmail.com>
References: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
In-Reply-To: <20260925-aw88166-cleanup-v1-0-11f74cb5fe28@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Val Packett <val@packett.cool>, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790322449; l=7814;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=KMVJyBO5ts0AVLaE2Gkn9rHugXaRsqSgphCz6QG+Aco=;
 b=+Cn3xExpi9StFSctBQMLvjxPVTSb91Yjf9QzNveFoLPcYKSVlgVmD1GLYAbv1A0N5nj3Cx46/
 mGrH6aMXVs1CzoTifv7bG3mCWa7BM3uXn8PpKAI6UbZXiHpV0SY+2yN
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com

From: Aaron Kling <webgeek1234@gmail.com>

This "feature" was copied from downstream, but it does not belong in
the kernel at all. Remove it to simplify the driver.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 sound/soc/codecs/aw88166.c | 157 +--------------------------------------------
 sound/soc/codecs/aw88166.h |   2 -
 2 files changed, 2 insertions(+), 157 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index c8b8c70aaf356..ab7af3eaceb28 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -668,59 +668,16 @@ static int aw_dev_set_volume(struct aw_device *aw_dev, unsigned int value)
 	return ret;
 }
 
-static void aw_dev_fade_in(struct aw_device *aw_dev)
-{
-	struct aw_volume_desc *desc = &aw_dev->volume_desc;
-	u16 fade_in_vol = desc->ctl_volume;
-	int fade_step = aw_dev->fade_step;
-	int i;
-
-	if (fade_step == 0 || aw_dev->fade_in_time == 0) {
-		aw_dev_set_volume(aw_dev, fade_in_vol);
-		return;
-	}
-
-	for (i = AW88166_MUTE_VOL; i >= fade_in_vol; i -= fade_step) {
-		aw_dev_set_volume(aw_dev, i);
-		usleep_range(aw_dev->fade_in_time, aw_dev->fade_in_time + 10);
-	}
-
-	if (i != fade_in_vol)
-		aw_dev_set_volume(aw_dev, fade_in_vol);
-}
-
-static void aw_dev_fade_out(struct aw_device *aw_dev)
-{
-	struct aw_volume_desc *desc = &aw_dev->volume_desc;
-	int fade_step = aw_dev->fade_step;
-	int i;
-
-	if (fade_step == 0 || aw_dev->fade_out_time == 0) {
-		aw_dev_set_volume(aw_dev, AW88166_MUTE_VOL);
-		return;
-	}
-
-	for (i = desc->ctl_volume; i <= AW88166_MUTE_VOL; i += fade_step) {
-		aw_dev_set_volume(aw_dev, i);
-		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
-	}
-
-	if (i != AW88166_MUTE_VOL) {
-		aw_dev_set_volume(aw_dev, AW88166_MUTE_VOL);
-		usleep_range(aw_dev->fade_out_time, aw_dev->fade_out_time + 10);
-	}
-}
-
 static void aw88166_dev_mute(struct aw_device *aw_dev, bool is_mute)
 {
 	if (is_mute) {
-		aw_dev_fade_out(aw_dev);
+		aw_dev_set_volume(aw_dev, AW88166_MUTE_VOL);
 		regmap_update_bits(aw_dev->regmap, AW88166_SYSCTRL_REG,
 				~AW88166_HMUTE_MASK, AW88166_HMUTE_ENABLE_VALUE);
 	} else {
 		regmap_update_bits(aw_dev->regmap, AW88166_SYSCTRL_REG,
 				~AW88166_HMUTE_MASK, AW88166_HMUTE_DISABLE_VALUE);
-		aw_dev_fade_in(aw_dev);
+		aw_dev_set_volume(aw_dev, aw_dev->volume_desc.ctl_volume);
 	}
 }
 
@@ -1515,75 +1472,6 @@ static struct snd_soc_dai_driver aw88166_dai[] = {
 	},
 };
 
-static int aw88166_get_fade_in_time(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
-	struct aw_device *aw_dev = aw88166->aw_pa;
-
-	ucontrol->value.integer.value[0] = aw_dev->fade_in_time;
-
-	return 0;
-}
-
-static int aw88166_set_fade_in_time(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-	struct aw_device *aw_dev = aw88166->aw_pa;
-	int time;
-
-	time = ucontrol->value.integer.value[0];
-
-	if (time < mc->min || time > mc->max)
-		return -EINVAL;
-
-	if (time != aw_dev->fade_in_time) {
-		aw_dev->fade_in_time = time;
-		return 1;
-	}
-
-	return 0;
-}
-
-static int aw88166_get_fade_out_time(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
-	struct aw_device *aw_dev = aw88166->aw_pa;
-
-	ucontrol->value.integer.value[0] = aw_dev->fade_out_time;
-
-	return 0;
-}
-
-static int aw88166_set_fade_out_time(struct snd_kcontrol *kcontrol,
-	struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
-	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-	struct aw_device *aw_dev = aw88166->aw_pa;
-	int time;
-
-	time = ucontrol->value.integer.value[0];
-	if (time < mc->min || time > mc->max)
-		return -EINVAL;
-
-	if (time != aw_dev->fade_out_time) {
-		aw_dev->fade_out_time = time;
-		return 1;
-	}
-
-	return 0;
-}
-
 static int aw88166_dev_set_profile_index(struct aw_device *aw_dev, int index)
 {
 	/* check the index whether is valid */
@@ -1704,38 +1592,6 @@ static int aw88166_volume_set(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int aw88166_get_fade_step(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
-	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
-
-	ucontrol->value.integer.value[0] = aw88166->aw_pa->fade_step;
-
-	return 0;
-}
-
-static int aw88166_set_fade_step(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
-	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
-	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;
-	int value;
-
-	value = ucontrol->value.integer.value[0];
-	if (value < mc->min || value > mc->max)
-		return -EINVAL;
-
-	if (aw88166->aw_pa->fade_step != value) {
-		aw88166->aw_pa->fade_step = value;
-		return 1;
-	}
-
-	return 0;
-}
-
 static int aw88166_re_get(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
@@ -1780,8 +1636,6 @@ static int aw88166_dev_init(struct aw88166 *aw88166, struct aw_container *aw_cfg
 		dev_err(aw_dev->dev, "aw_dev acf parse failed\n");
 		return -EINVAL;
 	}
-	aw_dev->fade_in_time = AW88166_1000_US / 10;
-	aw_dev->fade_out_time = AW88166_1000_US >> 1;
 	aw_dev->prof_cur = aw_dev->prof_info.prof_desc[0].id;
 	aw_dev->prof_index = aw_dev->prof_info.prof_desc[0].id;
 
@@ -1856,12 +1710,6 @@ static const struct snd_kcontrol_new aw88166_controls[] = {
 	SOC_SINGLE_EXT("PCM Playback Volume", AW88166_SYSCTRL2_REG,
 		6, AW88166_MUTE_VOL, 0, aw88166_volume_get,
 		aw88166_volume_set),
-	SOC_SINGLE_EXT("Fade Step", 0, 0, AW88166_MUTE_VOL, 0,
-		aw88166_get_fade_step, aw88166_set_fade_step),
-	SOC_SINGLE_EXT("Volume Ramp Up Step", 0, 0, FADE_TIME_MAX, FADE_TIME_MIN,
-		aw88166_get_fade_in_time, aw88166_set_fade_in_time),
-	SOC_SINGLE_EXT("Volume Ramp Down Step", 0, 0, FADE_TIME_MAX, FADE_TIME_MIN,
-		aw88166_get_fade_out_time, aw88166_set_fade_out_time),
 	SOC_SINGLE_EXT("Calib", 0, 0, AW88166_CALI_RE_MAX, 0,
 		aw88166_re_get, aw88166_re_set),
 	AW88166_PROFILE_EXT("AW88166 Profile Set", aw88166_profile_info,
@@ -1989,7 +1837,6 @@ static int aw88166_init(struct aw88166 *aw88166, struct i2c_client *i2c, struct
 	aw_dev->channel = AW88166_DEV_DEFAULT_CH;
 	aw_dev->fw_status = AW88166_DEV_FW_FAILED;
 
-	aw_dev->fade_step = AW88166_VOLUME_STEP_DB;
 	aw_dev->volume_desc.ctl_volume = AW88166_VOL_DEFAULT_VALUE;
 
 	aw88166_parse_channel_dt(aw88166);
diff --git a/sound/soc/codecs/aw88166.h b/sound/soc/codecs/aw88166.h
index 377a733447e70..1a61e56f607c9 100644
--- a/sound/soc/codecs/aw88166.h
+++ b/sound/soc/codecs/aw88166.h
@@ -607,8 +607,6 @@
 #define AW88166_DEV_SYSST_CHECK_MAX		(10)
 #define AW88166_START_RETRIES			(5)
 #define AW88166_START_WORK_DELAY_MS		(0)
-#define FADE_TIME_MAX				100000
-#define FADE_TIME_MIN				0
 #define AW88166_CHIP_ID			(0x2066)
 #define AW88166_I2C_NAME			"aw88166"
 #define AW88166_ACF_FILE			"aw88166_acf.bin"

-- 
2.54.0


