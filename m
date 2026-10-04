Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E004C35F5EA
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791097884; cv=none; b=t9zRe+iLydpqh6EE70IG+YYCBAu7hHXgDwXYy/Hy4EJldwOOzRX/QRQaTUbfZZ0/BVBewjoi5SXl2HLFVc6q7lROQPkhbPmpRSZnU+HMnN5Hid4r2RrUXa3ynac4DGtpFwvv1651ut80nS++PX5ZNhHjaqJ0ZtAZj9XYoUyNBLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791097884; c=relaxed/simple;
	bh=lLLDfF/AamNmWwJC2yvJCvQe71O8cjuMC3ddkYxWWGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=stSqmcuDXGEMcOtEGdO5V9foTz63dXZp8up0tSWFtyABQ+BNEU3TspMWCQ0+tgUYL6tcakNMyncY/RO8Taw8jXgPEVs5vmoIFUPusiU7+P9KQy48ArZZ5oQv4g8czYCPDYC9UYS4ssX9d6useoKJRhcoATjAssC7H4GWOOrLzlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/xsRRo1; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/xsRRo1"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so291161f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 00:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791097881; x=1791702681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2D6QjoTaBCt2jh1EB0BpFFMcn92myTfBG8HvdrcaiOM=;
        b=b/xsRRo1WTYd/U8RkR1MkYfT9ez3NURzRe+H3EEoBIPXaH7oYDYnnZSpdWk9pJEq1O
         qA94kQkEe1sGbieWQjK9HC4QVrd8dV1R/DPEs4xss5wPkFbdQI+ZYognAsE+0vbsdmf5
         zQU1KfxScrn3XZ4RjbHAEl7T8RotV+GIy4Y1/pG5yuUN/PWcTYwOziiqCZulHdc8zMVS
         ziYqGnixF+lqf46xSNNPbL3pjugBXNsP3KM7mYdmXHA48HzxCnTm/zZBT3DgHBZbRet1
         E8ox7h0lANadHqTmBb4LSi37iJn3TpeUOSiWChqaKaCZjNPydIFGqxRurP+V0YuykJEs
         drKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791097881; x=1791702681;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2D6QjoTaBCt2jh1EB0BpFFMcn92myTfBG8HvdrcaiOM=;
        b=VLiXzvB77uNax/p9b9bmIv19yDdFBKeS2kX0OzcrbZs2y2nbfwJd0U9OKESPOs5ONe
         hwM8GOJNpit4HREL3J9x15cW94x5AgEONQjwzpajN/yRihWTGdUFeWY3Lr8MKjEZrywH
         5UNDmFMneLXiRdk9ysJj/RAL7dcsiuGXuSgssCo8Hb5Iz43zaJwlfrJYtYuY4dN42TUh
         BDLEuO+oPZgLgQ2XslN0MHuWi8m9bucIXSARyJy5HFDVpsgc8XrPNv0cwMZ+zvMD21eX
         Gkf9crDmcmLMhFaHd2iohKujE+PT41Ekl6bBFLymG05hk2WJPKE2PcR53rvt9eKAjuxQ
         MX8A==
X-Forwarded-Encrypted: i=1; AKwUvBzgtfuu7Jd5hHn8vBcNLGLH9F1Mx0JomfuRJxlkljsTg+eYXFPAyCZr8fdCnT2zMsQH1V40dV3V09h9H54=@vger.kernel.org
X-Gm-Message-State: AFq9FYIlQWZBA9rwMTzn4+NXsE9nwjbhT8YNVl9WULRoxMjypmMMu7KW
	wq2Il/NwVkCi+Tr+64OIuxWHmbrx3kNfUsPv2r/HaQZsBZXGaCjXTqQ=
X-Gm-Gg: AYBFou0CKEu2nRmjkM1qCyeKDwmW9dKuzRFZATNTA8FEyDUVATQJEQHz8LavvbmdbHj
	tXnJHCegp+3dZYbPx5/T++gxqKpRp+3oEfkmKzmOTDXolL/nYq+GgWH3+KTY/UROIYYHxPFZihm
	JuSJsGw5UroGpx0WlxxtlItjO3C/shCuEuPYRREocxw7O+xkfF+gomqvbocHdpfSe1XN2bId83d
	EB7SgD0FLMcgNuz0wmuVcYfw+c1ooVoMq5BO5iXe7o9Jb37G5nbCvFfdgZTQpnR6FAdw/5qlP9h
	lAmbtNulgJVDIflmHV6pVuQ6alsbxKriUMyowEzFlQ1ZrN9CxuvkD28fVLqRCCea84kL9wJobmN
	ITrknhe8568YZVkpYrCxIuLyRPIpWPpN4OjH4aBvY7cBB7G2tOsIYOnhZAAKj18KB3dINnB+vQr
	lWTo+QrhA22UQCpJUNJHu0K78Yg/HyuZNKOnLOtJtwN/appu/hJ+uG6wBclYCpYZoKPsM4U/oTP
	tdvvOUJrZb9wtwNyzyWiR4GXrMWaGOii92laORfNU6YDiXi2dBUBN2787pj88Tu
X-Received: by 2002:a05:6000:1846:b0:48b:1bf:ffb1 with SMTP id ffacd0b85a97d-48b12775c61mr14876646f8f.54.1791097880928;
        Sun, 04 Oct 2026 00:11:20 -0700 (PDT)
Received: from yoga.fritz.box (p200300f3cf01bb00103cf82222a83fe3.dip0.t-ipconnect.de. [2003:f3:cf01:bb00:103c:f822:22a8:3fe3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm18004720f8f.37.2026.10.04.00.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 00:11:20 -0700 (PDT)
From: Georg Wenzel <g.wenzel@gmail.com>
To: tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georg Wenzel <g.wenzel@gmail.com>
Subject: [PATCH v2] ALSA: hda/tas2781: Enable bass speakers support
Date: Sun,  4 Oct 2026 09:12:00 +0200
Message-ID: <20261004071202.89116-1-g.wenzel@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87cxtw2y8b.wl-tiwai@suse.de>
References: <87cxtw2y8b.wl-tiwai@suse.de>
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
v2:
  - Rebased onto sound/for-next (Takashi Iwai).
  - Removed non-ASCII characters in comments (Takashi Iwai).
  
 include/sound/tas2781.h                       | 12 +++
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  | 98 +++++++++++++++++++
 2 files changed, 110 insertions(+)

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
index 5e5f46c9fb6b..cef33159eba4 100644
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
@@ -172,6 +249,13 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 		pm_runtime_get_sync(dev);
 		scoped_guard(mutex, &tas_hda->priv->codec_lock) {
 			tasdevice_tuning_switch(tas_hda->priv, 0, false);
+			/* Re-apply ASI configuration for TAS2563 after
+			 * tuning switch - DSP firmware loading can
+			 * overwrite ASI registers.
+			 */
+			if (tas_hda->priv->chip_id == TAS2563)
+				tas2563_post_fw_init(tas_hda->priv);
+
 			tas_hda->priv->playback_started = true;
 		}
 		break;
@@ -475,6 +559,12 @@ static void tasdevice_dspfw_init(void *context)
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
@@ -659,6 +749,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 		 */
 		device_name = "INT8866";
 		hda_priv->hda_chip_id = HDA_TAS2563;
+		tas_hda->priv->chip_id = TAS2563;
 		hda_priv->save_calibration = tas2563_save_calibration;
 		tas_hda->priv->global_addr = TAS2563_GLOBAL_ADDR;
 	} else if (strstarts(dev_name(&clt->dev), "i2c-TXNW5825")) {
@@ -782,6 +873,13 @@ static int tas2781_system_resume(struct device *dev)
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
 		tasdevice_tuning_switch(tas_hda->priv, 0, false);
 
-- 
2.55.0

