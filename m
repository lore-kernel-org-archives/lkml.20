Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE9E392C2C
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789438310; cv=none; b=ueqsOtdYHHreG/Kr3T3b7J53jZt/ly9hXMazS6upqeY8juSlyKEmLGqZ5dOhfSzRyt1B9539HhDIGWBx8dKj0ZCo43V9lcSHq3okfNSkMUL7OP0I5xSV65+pace+jk4LV1kyYoNlLsJc8xtl94t9XIJ+0JUmqaHiP2xgw70M7AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789438310; c=relaxed/simple;
	bh=J6gXL9OWqIRNkG/24diPjt+VhU9zpgZR6oysBIkYEog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dts+oA/qUojzaicEdD/Q1hfCwbYXMSkoQtJybQvmlHb9qNl8KXgVcy0+7+JjkYyFXvHjIVvPhM2+d5xpyZpQooV20+ej8ODNAkL3Qfekka6bNGgma2toX83AcSkvjfZBViUgp25CsJg7s5BqP8XODE0Y4xrhl4g/tjDVWRS4RpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A9ye8nFb; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A9ye8nFb"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99ddso24821697b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789438308; x=1790043108; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uTIQQjABQDHUENfcTBLfCjdS86IJNh9pkbH6nAS/n2s=;
        b=A9ye8nFb1bFdwRrk68rEIiLOmo8FoU8P0rI1ARtAV3j7DnC8WieVYpDGnpDm7pQ6KD
         QIlFw/88j1SeM38UL8p9Iq43ZHaxCLIDDaVS0J2wXz3aXp4s7FbTB5VoAin7m+iPCdZP
         moywid/NBznJzjWffofB7P/6opxZz+TBwfhlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789438308; x=1790043108;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uTIQQjABQDHUENfcTBLfCjdS86IJNh9pkbH6nAS/n2s=;
        b=yI3gOQObo8i05DgreTqHIscb8+m71nWkUerPutUstYrHPHkp/qIsxjYEwHCBnOZga+
         mphUIhh/YHiW/eOp34pTFKgrSMAOr44AcsIXZ0rsMbuTjMmOAoCodCztFbE0OhX5Z3ZP
         nXPUu5QHxEYelvya+cv3jLXaGb8bCpIwo/Qj3ws04WtyQfFJTr2tQAjJN3ZplewODGTl
         H6KE8whf/EYIppl3NazamqGo1Rsby5cXf/x+DArVqNgMR8C3GEaHYRGnfD3N0SZ7M7x0
         FyjHuzn7gmfoCAteETIYHPsZAG7ViXkEn5bohDQyOO4dV9OevKF1RNkcMt6sDb5W+DU9
         O7pw==
X-Forwarded-Encrypted: i=1; AKwUvBx9oqeVPTdb8lFH/JeKMuAoY//T9wYK5ILf9+WJZ07RCQ8GvtPaU7qe9XH7EVWl3thZQYNa2oKKaasnPDk=@vger.kernel.org
X-Gm-Message-State: AFuF++lWZK6nxl2MRKgJ9S9lcWw+n+xEMBcux1xhBvax/PT0krKqD5b9
	g17KNW99eKaJ6SYps5bpQEP8GpKXkFHWyn282uL3+ntsM6/jEf4x5UbmnoGDTaOsJ+XRZyiyFtL
	t24Ccig==
X-Gm-Gg: AYBFou3RYOhgP6VZZWt9TS+FLCZ86xi5+lNZtDLEknxXIAeMqeIIw5ABIxcDspeOYiC
	W/ZSmNvOWk7/BVBKIXi94XFi+Ym0cs++y+3pwhPZy0j81/avLYh1l8QbtPszAnjjrXAB3Omo3bH
	z8Xhs+KxCKnbtI5zUMg5XAJBFW71QUefDZuB8+GEWJZ1NXiruK3r0/HpaoEOUE7LALtpxyFt+4/
	Gxf8eA0Y/yEJxM0MfuH/vstbpY61k6mry7zmwrWeCCB/cAukg8xJu972tvXjbpnr02Iso//g3gF
	W3pruCjSpAx7hkerJNb1kMt+aeHLdLJc6AiL70T7WdCRkc294h/Yy9au9v/jpoqMaOrQq6vhDAG
	3k55ajIqQAbzxumZp74OI04V7iFyXbn+jrJ6apMnhbBtwyxDRkgAr6eIOnKZkIL/Fy7XKgBUB9V
	mC02Svh8TwXzR3hobMx8M76gtIeRyra9bfgNOAsI1OMcakbMzRjK0BtGBquBgzNyUiH4OvQvyZ/
	qlK5e+pXklDB9jur3BGb+tYUcoBoo63rqLdUNiUAzDwdD38TFHzRDS87kUF
X-Received: by 2002:a05:690c:dc2:b0:873:5bd1:98bf with SMTP id 00721157ae682-88d23993093mr16879117b3.49.1789438307806;
        Mon, 14 Sep 2026 19:11:47 -0700 (PDT)
Received: from ripwilburliny.c.googlers.com (160.117.86.34.bc.googleusercontent.com. [34.86.117.160])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88ccbcdf4e3sm14139787b3.42.2026.09.14.19.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 19:11:47 -0700 (PDT)
From: Steven 'Steve' Kendall <skend@chromium.org>
Date: Tue, 15 Sep 2026 02:11:38 +0000
Subject: [PATCH v3] ALSA: hda/cs8409: Fix for Dell Cirrus audio jack detect
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-fix-headphone-plug-cirrus-dell-v3-1-6dc555b00f61@chromium.org>
X-B4-Tracking: v=1; b=H4sIAFmpqGoC/4XNQQqDMBCF4auUrDvFJEZtV71H6cImoxlQI0kNL
 eLdG4VC6cblPzDfm1lATxjY5TAzj5ECuSGFPB6YtvXQIpBJzUQmiqzkGTT0Aou1Ga0bEMZuakG
 T91MAg10HCuUjP5taNUqwhIwe08c2cLunthSezr+3vcjX65eWe3TkwEFqxVWpTa60uWrrXU9Tf
 3K+Zasexa9Y7YoiiU1VcZHMzBTiT1yW5QMf68ZWIQEAAA==
X-Change-ID: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Steven 'Steve' Kendall <skend@chromium.org>
X-Mailer: b4 0.15.2

On some models like the Dell Inspiron 15 3520, jack
detection does not work. This patch switches to
delayed work to fix jack plug on Chrome OS.

Assisted-by: LLM
Signed-off-by: Steven 'Steve' Kendall <skend@chromium.org>
---
Changes in v3:
- Unified sleep time for both cases.
- Removed some superfluous logic after some additional testing.
- Link to v2: https://patch.msgid.link/20260718-fix-headphone-plug-cirrus-dell-v2-1-f88121570d62@chromium.org

Changes in v2:
- Changes from v1 have been removed.
- New approach uses delayed work and also solves the issue on this machine.
- I'm now using the latest release of b4. Hopefully this addresses the formatting issues I was having!
- Link to v1: https://lore.kernel.org/r/20260713-fix-headphone-plug-cirrus-dell-v1-1-3c5157cd45cd@chromium.org
---
 sound/hda/codecs/cirrus/cs8409.c | 43 +++++++++++++++++++++++++++++++++++++---
 sound/hda/codecs/cirrus/cs8409.h |  2 ++
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/sound/hda/codecs/cirrus/cs8409.c b/sound/hda/codecs/cirrus/cs8409.c
index c43ff3ef75b6e..1300571e4b6ae 100644
--- a/sound/hda/codecs/cirrus/cs8409.c
+++ b/sound/hda/codecs/cirrus/cs8409.c
@@ -56,6 +56,10 @@ static int cs8409_parse_auto_config(struct hda_codec *codec)
 }
 
 static void cs8409_disable_i2c_clock_worker(struct work_struct *work);
+static void cs8409_jack_detect_worker(struct work_struct *work);
+static void cs42l42_run_jack_detect(struct sub_codec *cs42l42);
+static int cs8409_i2c_read(struct sub_codec *scodec, unsigned int addr);
+static int cs8409_i2c_write(struct sub_codec *scodec, unsigned int addr, unsigned int value);
 
 static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 {
@@ -69,6 +73,7 @@ static struct cs8409_spec *cs8409_alloc_spec(struct hda_codec *codec)
 	codec->power_save_node = 1;
 	mutex_init(&spec->i2c_mux);
 	INIT_DELAYED_WORK(&spec->i2c_clk_work, cs8409_disable_i2c_clock_worker);
+	INIT_DELAYED_WORK(&spec->jack_detect_work, cs8409_jack_detect_worker);
 	snd_hda_gen_spec_init(&spec->gen);
 
 	return spec;
@@ -115,6 +120,28 @@ static void cs8409_disable_i2c_clock_worker(struct work_struct *work)
 	cs8409_disable_i2c_clock(spec->codec);
 }
 
+/*
+ * cs8409_jack_detect_worker - Perform initial jack detection once hardware is settled
+ *
+ * Defer initial jack detection. On ChromeOS and possibly other platforms this
+ * delay is required for jack detection to work as expected.
+ */
+static void cs8409_jack_detect_worker(struct work_struct *work)
+{
+	struct cs8409_spec *spec = container_of(work, struct cs8409_spec, jack_detect_work.work);
+	struct sub_codec *cs42l42 = spec->scodecs[CS8409_CODEC0];
+
+	if (spec->init_done && spec->build_ctrl_done && !cs42l42->hp_jack_in) {
+		int reg_ts_status = cs8409_i2c_read(cs42l42, CS42L42_TSRS_PLUG_STATUS);
+
+		/* error case */
+		if (reg_ts_status < 0)
+			return;
+
+		cs42l42_run_jack_detect(cs42l42);
+	}
+}
+
 /*
  * cs8409_enable_i2c_clock - Enable I2C clocks
  * @codec: the codec instance
@@ -954,6 +981,8 @@ static void cs8409_remove(struct hda_codec *codec)
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
 	cs8409_disable_i2c_clock(codec);
+	/* Also cancel jack detect work */
+	cancel_delayed_work_sync(&spec->jack_detect_work);
 
 	snd_hda_gen_remove(codec);
 }
@@ -1026,6 +1055,8 @@ static int cs8409_cs42l42_suspend(struct hda_codec *codec)
 	/* Cancel i2c clock disable timer, and disable clock if left enabled */
 	cancel_delayed_work_sync(&spec->i2c_clk_work);
 	cs8409_disable_i2c_clock(codec);
+	/* Also cancel jack detect work */
+	cancel_delayed_work_sync(&spec->jack_detect_work);
 
 	snd_hda_shutup_pins(codec);
 
@@ -1196,20 +1227,26 @@ void cs8409_cs42l42_fixups(struct hda_codec *codec, const struct hda_fixup *fix,
 	case HDA_FIXUP_ACT_INIT:
 		cs8409_cs42l42_hw_init(codec);
 		spec->init_done = 1;
+		/*
+		 * On resume, schedule delayed jack detect to allow the CS42L42
+		 * to settle after reset before running detection.
+		 */
 		if (spec->init_done && spec->build_ctrl_done
 			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
-			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+			schedule_delayed_work(&spec->jack_detect_work,
+					      msecs_to_jiffies(CS8409_JACK_DETECT_DELAY_MS));
 		break;
 	case HDA_FIXUP_ACT_BUILD:
 		spec->build_ctrl_done = 1;
-		/* Run jack auto detect first time on boot
+		/* Schedule jack auto detect first time on boot
 		 * after controls have been added, to check if jack has
 		 * been already plugged in.
 		 * Run immediately after init.
 		 */
 		if (spec->init_done && spec->build_ctrl_done
 			&& !spec->scodecs[CS8409_CODEC0]->hp_jack_in)
-			cs42l42_run_jack_detect(spec->scodecs[CS8409_CODEC0]);
+			schedule_delayed_work(&spec->jack_detect_work,
+					      msecs_to_jiffies(CS8409_JACK_DETECT_DELAY_MS));
 		break;
 	default:
 		break;
diff --git a/sound/hda/codecs/cirrus/cs8409.h b/sound/hda/codecs/cirrus/cs8409.h
index be1714a84fff4..dca9b31aeebfc 100644
--- a/sound/hda/codecs/cirrus/cs8409.h
+++ b/sound/hda/codecs/cirrus/cs8409.h
@@ -247,6 +247,7 @@ enum cs8409_coefficient_index_registers {
 #define CS8409_CS42L42_AMIC_PIN_NID		CS8409_PIN_ASP1_RECEIVER_A
 #define CS8409_CS42L42_DMIC_PIN_NID		CS8409_PIN_DMIC1_IN
 #define CS8409_CS42L42_DMIC_ADC_PIN_NID		CS8409_PIN_DMIC1
+#define CS8409_JACK_DETECT_DELAY_MS		100
 
 /* Dolphin */
 
@@ -339,6 +340,7 @@ struct cs8409_spec {
 	unsigned int i2c_clck_enabled;
 	unsigned int dev_addr;
 	struct delayed_work i2c_clk_work;
+	struct delayed_work jack_detect_work;
 
 	unsigned int playback_started:1;
 	unsigned int capture_started:1;

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260710-fix-headphone-plug-cirrus-dell-5e3b49da5f52

Best regards,
--  
Steven 'Steve' Kendall <skend@chromium.org>

