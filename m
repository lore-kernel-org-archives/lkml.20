Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6183D4EF126
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014691; cv=none; b=IGDMcl4pwIxeNuMDcLEjlxIhxKwnSJPJmAfwHE2lCprdx1rt0b3fScm2t6s+fC6nc5tEOUpQ7x4RjAFCXWXyqFFhkq6jmmYTf73NrUPGcSHwgQtAvxYYhQJ/v10bQZeMBUxJKfyVIBMyFaxewC++sGqQeEMy1pCkfJ+yh9Z1wwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014691; c=relaxed/simple;
	bh=ohYHDByr63mq2w127BbroFdh1YTyjJmc5GrT/NjLTW4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ALweyl7wZKIk5Gi9l0POiZWyBu6EeQsNOrfT4qGlj/mMskprm5rANHUI7britHQQ4KJhyzgREnysaCtaljS7C/NXtAB/MCcJdb522k5xWfXh2SNIk99p6XQiYqj59ipFE5q3lXN3OO0Zsj+vAUXd7dTe5nj49zG3j8BCK2+Ihj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJQPjBJv; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJQPjBJv"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso16194315e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790014687; x=1790619487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsxOL19hMW7EQtC7VpFSa5vo6iszWm6pjBLLvFrMpHg=;
        b=PJQPjBJvKCQU5/Kwo+upHzCqM/HxKMnJ9pbHNaC7CJKg1CKTxoV7oAC7n+PVb1HBkS
         55pUEft77+17h8zu3OAqevStSUQ5dzUuK01FQLjTINjp50QKb7IDy+5kxw7ZoQtiedSl
         4yL2YnRf+vnqfctl3bEHZeILpyq5Uz7w1dU3lLwZ71y8z5WwhYw5c0iLei0elNGUi2QM
         ndtdOMDlo+V0X3SD+np3wMi+P3s8WbsQPXOeHjwPfTbyzISef/4KG/JCR/FjWtaAniH0
         hkYoECbkazByyt44Y4ITeD1RXjSMoukHB+d93QI6y7etoJ0tJdOJt7jLX7BSDjrYrI6p
         5ZFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014687; x=1790619487;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsxOL19hMW7EQtC7VpFSa5vo6iszWm6pjBLLvFrMpHg=;
        b=zssY2bjrD8w8beoA1/J/uP9q6wkma1LLv0lNrOFRtv7Bsy05Msv9AowSbqq+xQqYbq
         vMu/zhFm8+k3rgHwdSfoHWxp6YqMi0RGrwS81QvMyIpCKtaoa+dtGDGsy+1I2u26CvTD
         FGpH21GimXghSloWNctlluBzQN1KWOJATc8nbnh9AK9gb20bUc50AMgd6C8xLqrOP+NG
         8G4EhW4jGEme0BsOQYfLjbYoWburVfFLf4DJx1MzQNci+1AqUrJfnZLmcWHEh5+geSrr
         IdgORluKn0aFbrW7LXAMqxs4aG1QpZY2YVZPtzgrmGNkt9KBqHypqGccJAxzTS/qhiHu
         QQ7Q==
X-Forwarded-Encrypted: i=1; AKwUvByZGBMluOhF12xWvBERNeUGSzUaOf2jCBuj4cH9fRkYIWi2vAN1uXAh/QUvdvWGp/MIxE0euPyfJ+pYT6w=@vger.kernel.org
X-Gm-Message-State: AFuF++kF+IS6xBxdzbtjv+q3OktEXpmevFzrx3L0MP5VzZhWP6+Xd8PK
	o6us+e51Irw+lS0IThYwvZF6c8o/rX60XBnqba9fcD6U849bBTl9K68=
X-Gm-Gg: AYBFou3v+e4KPBfPAgi5bssIqVOzzx4glAI4dWlaC4VbJ3zpXjQxR9DFG6UlJ3bTqJF
	HIwFWBza7D6MiMG34K6rRiERtldKTF09gfUxDskn15Wo3tN6EF/cK1dFzuzFjWcdkhlCVdJ2N/E
	GEQYkya+MRfP3WXfnBFCQ2prNP24V6eUNkEAKtAUETuYJqw0V/8tRiW9oGXnJXDJlMdUlHUBA17
	3sNC4T1cCwP8MiurIkgmytKvscXJTb2jUWy5i4QrQpbfE50IHV+uJRyPVYLc8vTCond8TJHv9Oe
	SFMztYDVNIoFBdvd3yj7PZjRj+MiUXBwijY5jUG05sU1N43RBPimox7m/kpv32y4j8ZRsZpI0Hi
	Frg+RdjikPWvM7hWp/9Y4IXsmVLT4rbTGEhEbn+mHxIMMun91WaGMpgjQvx3fl4QIxHbLo9Xhbk
	CVezq3lAhM/a14t3m1alpt1BjmfHX+Zs+HtS4V3mGiOe9KAZTYlnWQpO3nPijcA3LtNXDZiGvNg
	Py4ECfXTldLch+lUhJN6id/7DT8ALpP/NuLtpLsm5QVH9pXaXfzltOmjbxKUVQ=
X-Received: by 2002:a05:600c:83c8:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49fc5851e92mr153913555e9.30.1790014687244;
        Mon, 21 Sep 2026 11:18:07 -0700 (PDT)
Received: from yoga.fritz.box (p200300f3cf01bb00103cf82222a83fe3.dip0.t-ipconnect.de. [2003:f3:cf01:bb00:103c:f822:22a8:3fe3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cd5214sm8957605e9.9.2026.09.21.11.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:18:06 -0700 (PDT)
From: Georg Wenzel <g.wenzel@gmail.com>
To: shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	sen@ti.com
Cc: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georg Wenzel <g.wenzel@gmail.com>
Subject: [PATCH] ALSA: hda/tas2781: Enable bass speakers support
Date: Mon, 21 Sep 2026 20:18:44 +0200
Message-ID: <20260921181845.17923-1-g.wenzel@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Configure the driver to correctly initialize and enable the bass speakers
on devices utilizing the TAS2781 amplifier. Without this change, only the
tweeters or main speakers are active, leading to thin audio output.

Set up the required register sequences and routing to ensure the bass
channels are properly powered and mixed into the audio stream.

Signed-off-by: Georg Wenzel <g.wenzel@gmail.com>
---
 include/sound/tas2781.h                       | 12 +++
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  | 97 +++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index b763da613769..ccc0142fbad5 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -91,6 +91,18 @@
 /* prm_TE_1_Beta1 */
 #define TAS2563_TE_DT_REG		TASDEVICE_REG(0x00, 0x0f, 0x70)
 
+/* TAS2563 ASI (Audio Serial Interface) Register Definitions */
+#define TAS2563_ASI_CFG_REG			TASDEVICE_REG(0x00, 0x00, 0x06)
+#define TAS2563_ASI_SR_REG			TASDEVICE_REG(0x00, 0x00, 0x07)
+#define TAS2563_ASI_FS_REG			TASDEVICE_REG(0x00, 0x00, 0x08)
+#define TAS2563_ASI_DA_REG			TASDEVICE_REG(0x00, 0x00, 0x0a)
+#define TAS2563_ASI_TDM_REG			TASDEVICE_REG(0x00, 0x00, 0x0b)
+#define TAS2563_ASI_DL_REG			TASDEVICE_REG(0x00, 0x00, 0x0c)
+#define TAS2563_ASI_SLOT_REG		TASDEVICE_REG(0x00, 0x00, 0x30)
+
+/* TAS2563 ASI Apply Register (triggers configuration update) */
+#define TAS2563_ASI_APPLY_REG			TASDEVICE_REG(0x00, 0x00, 0x02)
+
 #define TAS2781_PRM_INT_MASK_REG	TASDEVICE_REG(0x00, 0x00, 0x3b)
 #define TAS2781_PRM_CLK_CFG_REG		TASDEVICE_REG(0x00, 0x00, 0x5c)
 #define TAS2781_PRM_RSVD_REG		TASDEVICE_REG(0x00, 0x01, 0x19)
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 624db967f17b..101d6cee6da2 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -46,6 +46,83 @@
 #define TAS2563_CAL_TLIM		TASDEVICE_REG(0, 0x10, 0x14)
 #define TAS2563_CAL_R0			TASDEVICE_REG(0, 0x0f, 0x34)
 
+/*
+ * TAS2563 Post-Firmware ASI Configuration.
+ *
+ * The DSP firmware loading can overwrite the ASI (Audio Serial Interface)
+ * registers that configure the I2S/TDM audio path to the amplifier.
+ * This function re-applies the correct ASI configuration after firmware load,
+ * matching the reference initialization sequence used by the vendor script:
+ *   - Software reset
+ *   - ASI_CFG  = 0x09 (I2S mode, master/slave config)
+ *   - ASI_SR   = 0x02 (sample rate divider for 48 kHz)
+ *   - ASI_DA   = 0xf1 (data alignment / slot assignment)
+ *   - ASI_TDM  = 0x02 (TDM mode select)
+ *   - ASI_DL   = 0x00 (delay line off)
+ *   - ASI_SLOT = 0x99 (slot enable mask for 2-channel stereo)
+ *   - CHNL_0   = 0x02 (channel mapping)
+ *   - ASI_FS   = 0x1e or 0x2e (frame sync, device-specific: bit4 selects
+ *                which of the two devices is the "primary" for FS generation)
+ *   - ASI_APPLY= 0x00 (trigger configuration update)
+ */
+static void tas2563_post_fw_init(struct tasdevice_priv *tas_priv)
+{
+	int i, ret;
+
+	dev_info(tas_priv->dev, "%s: ndev=%d, chip_id=%d\n",
+		 __func__, tas_priv->ndev, tas_priv->chip_id);
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		struct tasdevice *tasdev = &tas_priv->tasdevice[i];
+		u8 fs_val;
+
+		dev_info(tas_priv->dev,
+			 "%s: device[%d] dev_addr=0x%02x\n",
+			 __func__, i, tasdev->dev_addr);
+
+		/* Step 1: Software reset (matches script: 0x01 = 0x01) */
+		ret = tasdevice_dev_write(tas_priv, i, TASDEVICE_REG_SWRESET,
+					  TASDEVICE_REG_SWRESET_RESET);
+		dev_info(tas_priv->dev,
+			 "%s: chn=%d SWRESET ret=%d\n", __func__, i, ret);
+		usleep_range(1000, 2000);
+
+		/* Step 2: ASI configuration registers */
+		ret = tasdevice_dev_write(tas_priv, i, TAS2563_ASI_CFG_REG, 0x09);
+		dev_info(tas_priv->dev, "%s: chn=%d ASI_CFG=0x09 ret=%d\n", __func__, i, ret);
+
+		ret = tasdevice_dev_write(tas_priv, i, TAS2563_ASI_SR_REG, 0x02);
+		dev_info(tas_priv->dev, "%s: chn=%d ASI_SR=0x02 ret=%d\n", __func__, i, ret);
+
+		ret = tasdevice_dev_write(tas_priv, i, TAS2563_ASI_DA_REG, 0xf1);
+		dev_info(tas_priv->dev, "%s: chn=%d ASI_DA=0xf1 ret=%d\n", __func__, i, ret);
+
+		ret = tasdevice_dev_write(tas_priv, i, TAS2563_ASI_TDM_REG, 0x02);
+		dev_info(tas_priv->dev, "%s: chn=%d ASI_TDM=0x02 ret=%d\n", __func__, i, ret);
+
+		ret = tasdevice_dev_write(tas_priv, i, TAS2563_ASI_DL_REG, 0x00);
+		dev_info(tas_priv->dev, "%s: chn=%d ASI_DL=0x00 ret=%d\n", __func__, i, ret);
+
+		ret = tasdevice_dev_write(tas_priv, i, TAS2563_ASI_SLOT_REG, 0x99);
+		dev_info(tas_priv->dev, "%s: chn=%d ASI_SLOT=0x99 ret=%d\n", __func__, i, ret);
+
+		ret = tasdevice_dev_write(tas_priv, i, TAS2781_PRM_CHNL_0_REG, 0x02);
+		dev_info(tas_priv->dev, "%s: chn=%d CHNL_0=0x02 ret=%d\n", __func__, i, ret);
+
+		/* Step 3: Device-specific frame sync (0x1e for dev0, 0x2e for dev1) */
+		fs_val = 0x1e | ((i & 0x01) << 4);
+		ret = tasdevice_dev_write(tas_priv, i, TAS2563_ASI_FS_REG, fs_val);
+		dev_info(tas_priv->dev, "%s: chn=%d ASI_FS=0x%02x ret=%d\n",
+				__func__, i, fs_val, ret);
+
+		/* Step 4: Apply ASI configuration */
+		ret = tasdevice_dev_write(tas_priv, i, TAS2563_ASI_APPLY_REG, 0x00);
+		dev_info(tas_priv->dev, "%s: chn=%d ASI_APPLY ret=%d\n", __func__, i, ret);
+
+		usleep_range(1000, 2000);
+	}
+}
+
 enum device_chip_id {
 	HDA_TAS2563,
 	HDA_TAS2770,
@@ -174,6 +251,12 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 		pm_runtime_get_sync(dev);
 		scoped_guard(mutex, &tas_hda->priv->codec_lock) {
 			tasdevice_tuning_switch(tas_hda->priv, 0);
+			/* Re-apply ASI configuration for TAS2563 after
+			 * tuning switch — DSP firmware loading can
+			 * overwrite ASI registers.
+			 */
+			if (tas_hda->priv->chip_id == TAS2563)
+				tas2563_post_fw_init(tas_hda->priv);
 			tas_hda->priv->playback_started = true;
 		}
 		break;
@@ -477,6 +560,12 @@ static void tasdevice_dspfw_init(void *context)
 			tas_priv->rcabin.init_profile_id,
 			TASDEVICE_BIN_BLK_PRE_POWER_UP);
 
+	/* Apply ASI configuration for TAS2563 after firmware load.
+	 * DSP firmware loading can overwrite ASI registers.
+	 */
+	if (tas_hda->priv->chip_id == TAS2563)
+		tas2563_post_fw_init(tas_hda->priv);
+
 	/* If calibrated data occurs error, dsp will still works with default
 	 * calibrated data inside algo.
 	 */
@@ -661,6 +750,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 		 */
 		device_name = "INT8866";
 		hda_priv->hda_chip_id = HDA_TAS2563;
+		tas_hda->priv->chip_id = TAS2563;
 		hda_priv->save_calibration = tas2563_save_calibration;
 		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
 	} else if (strstarts(dev_name(&clt->dev), "i2c-TXNW5825")) {
@@ -784,6 +874,13 @@ static int tas2781_system_resume(struct device *dev)
 			tas_hda->priv->rcabin.init_profile_id,
 			TASDEVICE_BIN_BLK_PRE_POWER_UP);
 
+	/* Re-apply ASI configuration for TAS2563 after system sleep
+	 * resume — amplifiers may lose their register state during
+	 * suspend-to-ram or suspend-to-disk regardless of playback state.
+	 */
+	if (tas_hda->priv->chip_id == TAS2563)
+		tas2563_post_fw_init(tas_hda->priv);
+
 	if (tas_hda->priv->playback_started)
 		tasdevice_tuning_switch(tas_hda->priv, 0);
 
-- 
2.55.0

