Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793488425;
	b=kJPlz/HGIwkVPJ0by7Rys88CN2YE/pT3mPh26LlQ5RXtfcDxYdGUxvH3qL8fHnfMtNUx
	 D+c+U2i8U2W1vAOhrsrQR9VJE28U06Cy6WdRiYT/VHCGAjGMST8TvWjIX7n4XYaS/0ysj
	 Nk6SYUMse56yUtou4q8a072gQFYsYsrUB6B4PKZh0btPt0+FePRKNgwg21iDicoN3ZNXq
	 n3P/FpWW+cxsTrzKlLO7t8VF/93OL3RnRLX/LdRgholYbf1RZ8/4TXX1h1X/8wGnbJUXx
	 kQBwWIvDl6VtH5wTmNKtIdjbn20gc0ksXLSpCjcU86/cHntI5//yWzodsXJy4swptuA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793488425;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Qmribg3bV0bQcjMMz/i7Cv7QfU1uD6qVWb0ul9iW3Dw=;
	b=5EWgacMGI1UQjESNaQAPk5nskI/XmnR7hm1fXV3qPx3FHjw/Jrax6dovQ/FyU5bRTt29
	 QSPgDZ0ueH0C3TLnmjl+76qntg+NsCUmRt+1oesUjfFYvc/vlMIVxxaoGyohjp6ZtnMOm
	 v4wRPOmgK6koneI5s6m4zATV4N42QuXCu+1S4app6xhXlBeAIPUShdTzyVrPXfndvycA0
	 /tki/qD0ydxbbzQUOM/euAALpzutXMy/GfkYAWC4ggfvF0p5xElZmDY7WyKMArSSCd4Lc
	 tEiyiX/xDC1PA54cIE9nb9FCoJ3LHvFNxse4tSUOkC30btogsHBngnk+YgJEeND0APw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKJK1n3L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D181606A31A;
	Sat, 31 Oct 2026 23:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OKJK1n3L
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793488424;
	b=yYLxLaj1K8/6ruP4R0RKU56ZsequuXt2H0ukAEf6NkH/Q/xgZe7Nfk6TqI8Lmcx/YTqV
	 va5swpvU3byVrqisliFGBcmc+ibObza6MXfOmlMMgOcffHgYYP8B63zddQjk/T/O3GzF1
	 9wcsGIwysbZyfkpbav8dFjVkCWa7aOZJxtnFIABAP5mc/wzrvqraV7ImuV8wt/IWfgMEk
	 gih5Ojck56QgWqszwtuDHThKOkRjssZb1T79V6zqO6sDQM/MQKmdvJ0VRsqzu7pyMDsSt
	 CofHekRUJGLQ/uVBBtdEPgEnAJOT9T+A8eFvucp6wn8K5xT4Vm9m7H0HYc1Fp6Tktpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793488424;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Qmribg3bV0bQcjMMz/i7Cv7QfU1uD6qVWb0ul9iW3Dw=;
	b=KDYzHzlCyIGLdpwIl9CRMrSISBMlqms06nHN8vVY7gFKIou6mcl/TjMOKw432cX6DOGK
	 vVkjttp4XZbC1hp9vYfErAa7gTVcB9jtpzxq8wsb7OaeBGgAgNlQt2j5y/gm+cabblrnG
	 0CGVQQ2+RnS0LAw2cAY71WrEp/jzVCbDgl9Cv9i514GwPNsx7oK9Nj1EhtzsoOKdkVeDk
	 U0KZt2fi+3TeEwzhdlTEBSu4oOY4yGx7/9vdqoJ3DXrd7kpeIRM50A50R73kP1hMw/Lw1
	 eIBcMcdlgJfZofrE8YsF1Q+32KwWTmp+z0W9Et+fU0Am+drZTN3JSpMV+lqCplOmd+g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A336A1F000C1;
	Sat, 31 Oct 2026 23:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793488424;
	bh=Qmribg3bV0bQcjMMz/i7Cv7QfU1uD6qVWb0ul9iW3Dw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=OKJK1n3LV4MA3s3xcy+Yqun5ERw21e9ztEq/KBS1IOgEF+odLKLxesSihyOmjweWi
	 mmlpwt/OkHMQC8cDAxbt8YIcGTngpCvlzgsvVzN38e7EReF8cY6hycZsCnC6vYppWh
	 LKHavseYOwRuuXsaww+30/ogsPvx4uWDpKca8799vin6vC/+jhoUD5T0APEXtcpsIB
	 caJq8SNCTRsV1R4vmIMEWPxkmbK2lN54m0kmU4HHLZWiVypA6z35/tBYg5E1UI9xLn
	 R+FSTfiQ1VNP1ClYCIQmqRRrAMyCKCHDsG0ph6xw6jD9w9ZBH2z6IFBY17G9+3p2EG
	 uiyMO8HNOkXbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3728646000;
	Sat, 31 Oct 2026 23:13:43 +0000 (UTC)
From: Roman Maidanovych via B4 Relay <devnull+devuarpd.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 01:13:33 +0200
Subject: [PATCH RFC] ALSA: hda/tas2781: Reload DSP program if the
 amplifiers lost it
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
Message-Id: <20261101-tas2781-reload-if-lost-v1-1-9d336120f1ba@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ77kI2BZVeC31Ar6WHmKx2i5iST
 UUQ/95UjzMws4JyEla4VCsknkUlTgXoVIF/uWlglFAYrLE1kSHMTm3TEiYeowsoPY5RM9bGc9d
 QCGdvoMSfxL0s+/gB99sVnofUb/dmn/9L2LYffAMkxX8AAAA=
X-Change-ID: 20261101-tas2781-reload-if-lost-60ceb71dd3c0
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Zhang Heng <zhangheng@kylinos.cn>, Roman Maidanovych <devuarpd@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793488422; l=5046;
 i=devuarpd@gmail.com; s=20261031; h=from:subject:message-id;
 bh=U3eUKsJ3k1zByfnW/ZQjAhCzAj8imME5Fgee+NKYgZQ=;
 b=iDFI1fjmT19xAOUDEALyRrlGXLPfty/bsYfGSS7Fbt6bluVcIo6zgi51kF34GPfVc7fYHt4Hs
 VvAEYS92AXEBoNvNKyqJqUQNCrIjO5vYtA1R8nGJGJCd8kGQpJbc9yh
X-Developer-Key: i=devuarpd@gmail.com; a=ed25519;
 pk=ZsD8owwKOCmpH4BZHKpMCGYO8OMSkY2CfHovVnNWJYc=
X-Endpoint-Received: by B4 Relay for devuarpd@gmail.com/20261031 with
 auth_id=1373
X-Original-From: Roman Maidanovych <devuarpd@gmail.com>
Reply-To: devuarpd@gmail.com
Content-Transfer-Encoding: 7bit

From: Roman Maidanovych <devuarpd@gmail.com>

On Lenovo Legion Pro 7 16ARX8H (ALC287 + two TAS2781 on I2C, codec SSID
17aa:38a7) the speakers go silent once the HDA codec has been runtime
suspended (power_save=1, e.g. after pausing playback for a few seconds).
Headphones are not affected. power_save=0 avoids it; a system
suspend/resume cycle or rebinding the driver recovers it.

The amplifiers lose their DSP program while the codec is runtime
suspended, but they are not reset: book 0 page 0 keeps its values (e.g.
CLK_CONFIG reads 0xd9, not the reset value 0x19 that tas2781_hda_spi.c
checks for). The driver still holds the cached cur_prog/cur_conf, so on
the next playback tasdevice_tuning_switch() reports "Unneeded loading dsp
conf 0" and skips the download. Forcing it with the "Speaker Force
Firmware Load" control restores the sound until the next codec suspend.

Invalidating only cur_book/cur_conf on runtime suspend, as
tas2781_hda_spi.c does, is not enough here: the program itself has to be
downloaded again. Doing that unconditionally on every runtime resume
works, but adds about 1.1 s of I2C firmware download before each
playback.

Bit 7 of register 0x44 in book 0 page 0 is set on both amplifiers exactly
when the DSP program has been lost, and clear when it is intact. Check it
when a PCM is opened and, if it is set, invalidate the cache and download
the program again; tasdevice_tuning_switch() then reloads the
configuration and calibration data as usual.

Tested on 7.3.1 with power_save=1: the speakers keep working across
repeated pauses and headphone plug/unplug cycles, and the program is
only downloaded when the bit is set.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=221735
Signed-off-by: Roman Maidanovych <devuarpd@gmail.com>
---
RFC because the meaning of B0_P0_R0x44 bit 7 is not documented in the
kernel; it was found by comparing register dumps of working and silent
cycles. Questions for TI:

1. What does bit 7 of B0_P0_R0x44 indicate, and is it a reliable way to
   detect that the DSP program needs to be downloaded again? Is there a
   better (documented) status register for this?
2. Why do the amplifiers lose the DSP program without being reset while
   the HDA codec is runtime suspended? On 6.18.x this only started after
   headphones had been plugged in once since boot; on 7.3.1 it happens
   from the first codec suspend.
3. If a status check is not wanted, would you prefer to clear cur_prog
   as well on runtime suspend (full download on every resume)?

Register dumps (book 0 page 0 of both amplifiers for working and silent
cycles) and dynamic-debug logs can be provided on request.
---
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 36 ++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 44855f593..177a2194a 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -46,6 +46,9 @@
 #define TAS2563_CAL_TLIM		TASDEVICE_REG(0, 0x10, 0x14)
 #define TAS2563_CAL_R0			TASDEVICE_REG(0, 0x0f, 0x34)
 
+#define TAS2781_REG_DSP_LOST		TASDEVICE_REG(0x0, 0x0, 0x44)
+#define TAS2781_DSP_LOST		BIT(7)
+
 enum device_chip_id {
 	HDA_TAS2563,
 	HDA_TAS2770,
@@ -162,6 +165,38 @@ err:
 	return ret;
 }
 
+/*
+ * The amplifiers can lose their DSP program while the HDA codec is runtime
+ * suspended, without the chip being reset. The cached program/configuration
+ * then makes tasdevice_tuning_switch() skip the download and the speakers
+ * stay silent. Bit 7 of B0_P0_R0x44 is set in that state: invalidate the
+ * cache and download the program again.
+ */
+static void tas2781_hda_reload_if_lost(struct tasdevice_priv *tas_priv)
+{
+	bool lost = false;
+	int i, ret, val;
+
+	if (tas_priv->chip_id != TAS2781)
+		return;
+
+	for (i = 0; i < tas_priv->ndev; i++) {
+		ret = tasdevice_dev_read(tas_priv, i, TAS2781_REG_DSP_LOST, &val);
+		if (ret || !(val & TAS2781_DSP_LOST))
+			continue;
+
+		tas_priv->tasdevice[i].cur_book = -1;
+		tas_priv->tasdevice[i].cur_prog = -1;
+		tas_priv->tasdevice[i].cur_conf = -1;
+		lost = true;
+	}
+
+	if (lost) {
+		dev_dbg(tas_priv->dev, "DSP program lost, reloading\n");
+		tasdevice_prmg_load(tas_priv, tas_priv->cur_prog);
+	}
+}
+
 static void tas2781_hda_playback_hook(struct device *dev, int action)
 {
 	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
@@ -171,6 +206,7 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 	case HDA_GEN_PCM_ACT_OPEN:
 		pm_runtime_get_sync(dev);
 		scoped_guard(mutex, &tas_hda->priv->codec_lock) {
+			tas2781_hda_reload_if_lost(tas_hda->priv);
 			tasdevice_tuning_switch(tas_hda->priv, 0, false);
 			tas_hda->priv->playback_started = true;
 		}

---
base-commit: 231efd8f68c950ad3b774ff51c6d15fdd0443a5b
change-id: 20261101-tas2781-reload-if-lost-60ceb71dd3c0

Best regards,
--  
Roman Maidanovych <devuarpd@gmail.com>


