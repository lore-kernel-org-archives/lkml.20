Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CB21F936
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231276; cv=none; b=JnG25LWiKTdOx4PiEAGW4/enNKMZdRoNWs60jyiYZrv2acg6cQLTLMDL1UOrIycrxCmeW3Bv2fDFpTrgFu/+zwVrFrLWuUDQJGHgbDqBamyzSXsY5ghm7E3IfTIkaFQB5gIhcGtoP6tj1/dmrsi7dDbciVuFDHdTF7GTg2kyb2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231276; c=relaxed/simple;
	bh=LVhunIGi+1kymI40gl1s+wmjtCY7K/lv3AXeNGSKWKs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EiA/5N6fgXEIEiRCggJ5agCKPo87OEG9L4QlCuhnzKEU5Etq7xlaDwY9VYl/0YmfAPU0SAJZMemvtQnU6TgOeSFC63fmbuFfJ65NULvEzeLYmHcher0dmke2FCDvJNDbY5ShBCnBWIEioDeFqPR6O8MlxuzRb+K11VWhwhhWxMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ML4bog11; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ML4bog11"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48dee593f18so401997f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792231273; x=1792836073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AEW+uW8P27My+8CTtMqBOat+Y6bq8IsOAnfriF6HTc0=;
        b=ML4bog11GkKrVujiJwAhrHBmy0XJjlgaikuRyBOSOUHazkzz1e79LbP8L9ajslFm5v
         tGfg6tmwzPfY3d5yJZUk7sZchyAwSqMSTMJb60X+ClzGgaQB4Stvu+g5sshWO+m+WEOR
         pPJLSUeocatNmdhqQfnOp71j3nzsiJUC01c49ZQLNjVREUNZpA44VUysOrCrVhYQAm7C
         o4ZZSq7mG7LuOa+rz/g3gkdbkadbwUD5VnGn2oeocre+SZOHGvjMcrWZQ6HaDWdwUApy
         X84+/viveKuKeMdcB7NKVEMYVWU+PUSrnlBzH4/pzvr6IUlxj1kymVao4jwUcRWO0PaS
         9KvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792231273; x=1792836073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AEW+uW8P27My+8CTtMqBOat+Y6bq8IsOAnfriF6HTc0=;
        b=t8+n/WgSKm7AkrQ+mqIZ4FCSs//IsekAHt79fC/IwUyXxXh80qRzKyJ0V3jnOfScur
         353GWGMvDEx+vQoDeoQiGI1yEolRGjV4oEBLxK4HLVpP5IMdYvN2QXGeL8t6/IUoXdyn
         73ZL/hc9zvQQYZkFm8ncWhkRETv5nktvYceFJtuSzD47594TzOr/QM1gaOSNg3ENU6y0
         j1cIya2aX/0CnbtX++/5cswg4vbks/B/zI9gj9y/WUJ8fL/ZCds0fuQpI2gZtwG3EYBD
         18r0n82OEl6ENHGCCDyRC1uzT/mirybWAhe3mKA8FgnjtJZMprDBY7bx2aWAd2vUdv5X
         2jSA==
X-Forwarded-Encrypted: i=1; AKwUvBwLS7KaFIzyG8bP5JNcm4YEuNmA29l9jIa/fjEzxZMeLjzQGAtMEwUOTH+ZPYE/BkeRnZQey0eW+ZK2IsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzMOBjxRmKGMV/s8IT1f0u9SRJ595bZCmqavJum8sExZ1Bg69t
	eb5luOTuAw1OCLi/e07qepAa+okspiWHaoUW/d/loVk1mwfU8j5pwgIW
X-Gm-Gg: AYBFou0kg+8NEymjDnkNeO5MBlArreE1afH7fwiVs/KVDYO/PvAyv3gm1rMjrOJvHOC
	LWqgrMg32Jq5cOieZA89CjO+1OJskFjTsov1GrRGRfpgJWGkT+/ydIn22AG6ocz0Uh4lk+oPago
	0s9cZg1bSLehNBZMCBdK/dPrhS1LbCduOEA2S04RKwGDTliRDf8YpVFDgZHSn1C5cPjr5inMsfp
	QOjK54nbzHoVkyJYIl6I4kEn2l6onl8TiwYw/CQc+t+GOv/GQ1d2cQ96iZzgdDbXkGCvvSGxXMA
	XfUkEJVZDk5ImF/oIIb6jiuVm6t40IsOy7bc/auA0EbcgViHUB9PoljmeweEJwWIjmHHjPULIgi
	tFIA8aHaXQi4d7pFRU2OxzlhMfghO1wMwtNuW2jzxOosO5lwQhbG3UGaz20xKcaFY51IWX/Nsu0
	5eL2IPiiXHf0rlOZ95XUfqtK9Hhg1gTHgGxyve0O09RbXtn8otenKfa/Aqa3B+hPH/mOUPwRZOf
	03LDRncTFn953EoyEUc/BZcTw==
X-Received: by 2002:a05:6000:298d:20b0:48c:43a4:37f2 with SMTP id ffacd0b85a97d-48e07bbe81fmr2929017f8f.17.1792231272677;
        Sat, 17 Oct 2026 03:01:12 -0700 (PDT)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471a64sm11176218f8f.6.2026.10.17.03.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:01:12 -0700 (PDT)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Val Packett <val@packett.cool>,
	Federico Amedeo Izzo <federico@izzo.pro>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Vladyslav Tymoshchuk <tvlad744@gmail.com>
Subject: [PATCH v2] ASoC: codecs: aw88261: complete the start at trigger time
Date: Sat, 17 Oct 2026 13:00:40 +0300
Message-ID: <20261016120000.aw88261-trigger-v2-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The amplifier is started from the PRE_PMU event of its AIF widget, that
is from DAPM in prepare. aw88261_dev_start() waits up to 20 ms there for
the PLL to lock to the bit clock and powers the amplifier down again if
it does not.

The Qualcomm AudioReach backends only start their graph, and with it
the I2S/TDM clocks, in trigger since commit b54a38af7138 ("ASoC: qcom:
q6apm-lpass-dai: move graph start to trigger"). There every start fails
with "start failure (-1)" and the speaker stays silent for the whole
stream, as seen with six AW88261 on a TDM link of SM8750.

Split the start at the first step that needs the bit clock, the PLL
lock check, whatever the host does:

 - PRE_PMU clears power down (PWDN), configures the I2S interface and
   the PLL and writes the boost settings of aw88261_reg_force_set().
   The amplifier stays powered down (AMPPD) and muted.
 - The unmute, called after the trigger of the CPU DAI with
   .mute_unmute_on_trigger, does the rest: it checks the PLL lock,
   clears AMPPD, checks SYSST, enables the feedback and unmutes. If the
   PLL does not lock, "start failure" is logged, the amplifier is left
   as PRE_PMU left it and the next trigger start tries again.
 - The mute in trigger undoes the unmute (mute, feedback off, AMPPD),
   and POST_PMD sets PWDN as before.

So only the steps that need the clock run in trigger: 14 register
accesses and 1 ms per amplifier for the unmute when the PLL has locked,
12 and 1 ms for the mute. The same steps run there on hosts that have
the clock running from prepare. aw88261_reg_force_set() only writes
boost settings and now runs before AMPPD is cleared rather than right
after.

wsa883x and wsa884x split their start the same way, with the
configuration in DAPM and GLOBAL_PA_EN in the trigger-time mute. The
vendor driver of this amplifier family (aw882xx) also starts the
amplifier from .mute_stream, with the same sequence.

The register accesses go over I2C and sleep, so they need a nonatomic
trigger, which the Qualcomm DPCM links using this codec have. On an
atomic PCM, as seen from substream->pcm->nonatomic in .startup, PRE_PMU
does the whole start as before and the mute callback does nothing.

POST_PMD can also run for an amplifier that was never powered up, as
seen when the card is registered, so make "already power off" a debug
message.

Assisted-by: LLM
Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>
---
Changes in v2:
- Do not move the whole start into trigger (Mark). PRE_PMU keeps what
  does not need the bit clock (PWDN, I2S and PLL setup, boost
  settings); only the PLL lock check, AMPPD, the SYSST check, TX and
  the unmute run at trigger, and the mute at trigger undoes them.
- Keep the old behaviour on atomic PCMs (Mark: "Are we *sure* there are
  no other users out there?"): the driver checks
  substream->pcm->nonatomic in .startup and then does the whole start in
  PRE_PMU and nothing in the trigger-time mute.
- One attempt at trigger, no retries there: if the PLL does not lock,
  "start failure" is logged, the amplifier stays powered up and muted
  and the next trigger start tries again. The retries of the register
  update stay in PRE_PMU.
- "already power off" is a dev_dbg as in v1, now for another reason:
  POST_PMD runs for amplifiers that were never powered up when the card
  is registered (six times at boot here).
- Rebased on sound/for-next with "ASoC: codecs: aw88261: expose
  hardware mute control"; the unmute honours its mute_st as before.
- v1: https://lore.kernel.org/r/20261014120000.aw88261-trigger-v1-1-tvlad744@gmail.com

On the users: in mainline, linux-next and sound/for-next the only one
is the Fairphone 5 (qcm6490-fairphone-fp5.dts, "fairphone,fp5-sndcard"
in sm8250.c), whose links qcom_snd_parse_of() makes nonatomic. Out of
tree I know of the Fairphone 6, motorola-dubai (Federico's patch) and
the OnePlus Pad 3, all Qualcomm. A user with an atomic link keeps the
current behaviour with this version.

The vendor driver (aw882xx, checked in the module shipped on the
OnePlus Pad 3) starts the amplifier from .mute_stream with the same
sequence (PWDN, PLL check, AMPPD, SYSST check, TX, unmute) and stops
it fully on mute; it does not set .mute_unmute_on_trigger, so there
the mute callbacks run from prepare and hw_free.

Tested on a OnePlus Pad 3 (SM8750, six AW88261 on two I2C buses, TDM
from the AudioReach DSP) with the same change on our v7.3-rc5 based
tree, with PipeWire and with a small ALSA test program. That tree also
has a battery monitor and a 10 ms sleep after the mute in the stop
sequence, which mainline does not have. Times were taken with ktime
around the work under the lock (test-only instrumentation); the six
amplifiers run one after the other.

 - Unmute at trigger: 4.3 to 7.3 ms per amplifier, 26 to 38 ms for
   all six (9 starts; an earlier series of 5 starts: 4.1 to 9.1 ms,
   25 to 46 ms).
 - Mute at trigger: 13.9 to 17.6 ms per amplifier, 88 to 101 ms for
   six (10 stops), including the local 10 ms sleep. Without it, as in
   this patch, that is about 4 to 7.5 ms per amplifier and 27 to 41 ms
   for six (not measured on its own).
 - Prepare part in PRE_PMU: 4.5 to 6.2 ms per amplifier, 28 to 35 ms
   for six (up to 8.7 and 47 ms when the device is reopened back to
   back). This is where every start failed before.
 - The write that starts the stream (graph start plus the six unmutes,
   test program, 3 runs): 28 to 36 ms, against 52 to 57 ms with v1 in
   the same test.
 - No "start failure" at all. SYSST reads 0x0311 on all six during
   playback, also after two PipeWire restarts. After a prepare without
   trigger all six are powered up with AMPPD and HMUTE set and SYSST
   reads 0x0000; after close they are off.
 - Listening: two series of six PipeWire playbacks of five 40 ms pips
   100 ms apart followed by a tone, nine of them started with the
   device closed and three with the PCM already running. All five pips
   were heard every time, and in the second series also found in a
   recording by a phone next to the tablet and by the tablet's own
   microphone, the first pip as long as the others. No clicks were
   heard; the tablet's microphone shows a short transient in the unmute
   window that the phone recording does not.

As with v1, a stream started with only one period of data can underrun
while the trigger runs: the test program, which starts on its first
10 ms period, got -EPIPE on its second write in 3 of 3 runs. The
trigger is shorter than with v1 but still longer than one period.
PipeWire, which fills the buffer before it starts, never underran.

The analysis, the change and this text were drafted with an AI
assistant (see Assisted-by); I reviewed them and ran the tests above.

 sound/soc/codecs/aw88261.c | 161 ++++++++++++++++++++++++++++---------
 sound/soc/codecs/aw88261.h |   4 +
 2 files changed, 126 insertions(+), 39 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 7303dc9eb4e0..0c4e3c54773c 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -187,12 +187,8 @@ static int aw88261_dev_configure_syspll(struct aw88261 *aw88261)
 		return ret;
 
 	/* The polarity of the bit clock (BCK) */
-	ret = regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
+	return regmap_update_bits(aw_dev->regmap, AW88261_SYSCTRL_REG,
 			~AW88261_BCKINV_MASK, aw88261->bck_inv_value);
-	if (ret)
-		return ret;
-
-	return aw88261_dev_check_pll(aw_dev);
 }
 
 static int aw88261_dev_check_sysst(struct aw_device *aw_dev)
@@ -497,24 +493,47 @@ static int aw88261_dev_fw_update(struct aw88261 *aw88261)
 	return ret;
 }
 
-static int aw88261_dev_start(struct aw88261 *aw88261)
+/*
+ * First part of the start, which does not need the bit clock: power up and
+ * configure the I2S interface and the PLL. The amplifier stays powered down
+ * (AMPPD) and muted.
+ */
+static int aw88261_dev_power_up(struct aw88261 *aw88261)
 {
 	struct aw_device *aw_dev = aw88261->aw_pa;
 	int ret;
 
-	if (aw_dev->status == AW88261_DEV_PW_ON) {
-		dev_dbg(aw_dev->dev, "already power on");
-		return 0;
-	}
-
 	/* power on */
 	aw88261_dev_pwd(aw_dev, false);
 	usleep_range(AW88261_2000_US, AW88261_2000_US + 10);
 
 	ret = aw88261_dev_configure_syspll(aw88261);
+	if (ret) {
+		aw88261_dev_pwd(aw_dev, true);
+		return ret;
+	}
+
+	aw88261_reg_force_set(aw88261);
+
+	aw_dev->status = AW88261_DEV_PW_READY;
+
+	return 0;
+}
+
+/*
+ * Second part of the start, which needs the bit clock as the PLL locks to
+ * it: check the lock, enable the amplifier and the feedback, and unmute.
+ * On failure the device is left as aw88261_dev_power_up() left it.
+ */
+static int aw88261_dev_enable(struct aw88261 *aw88261)
+{
+	struct aw_device *aw_dev = aw88261->aw_pa;
+	int ret;
+
+	ret = aw88261_dev_check_pll(aw_dev);
 	if (ret) {
 		dev_dbg(aw_dev->dev, "pll check failed");
-		goto pll_check_fail;
+		return ret;
 	}
 
 	/* amppd on */
@@ -525,7 +544,10 @@ static int aw88261_dev_start(struct aw88261 *aw88261)
 	ret = aw88261_dev_check_sysst(aw_dev);
 	if (ret) {
 		dev_dbg(aw_dev->dev, "sysst check failed");
-		goto sysst_check_fail;
+		aw88261_dev_i2s_tx_enable(aw_dev, false);
+		aw88261_dev_clear_int_status(aw_dev);
+		aw88261_dev_amppd(aw_dev, true);
+		return ret;
 	}
 
 	/* enable tx feedback */
@@ -534,8 +556,6 @@ static int aw88261_dev_start(struct aw88261 *aw88261)
 	if (aw88261->amppd_st)
 		aw88261_dev_amppd(aw_dev, true);
 
-	aw88261_reg_force_set(aw88261);
-
 	/* close uls mute */
 	aw88261_dev_uls_hmute(aw_dev, false);
 
@@ -548,26 +568,12 @@ static int aw88261_dev_start(struct aw88261 *aw88261)
 	aw_dev->status = AW88261_DEV_PW_ON;
 
 	return 0;
-
-sysst_check_fail:
-	aw88261_dev_i2s_tx_enable(aw_dev, false);
-	aw88261_dev_clear_int_status(aw_dev);
-	aw88261_dev_amppd(aw_dev, true);
-pll_check_fail:
-	aw88261_dev_pwd(aw_dev, true);
-	aw_dev->status = AW88261_DEV_PW_OFF;
-
-	return ret;
 }
 
-static int aw88261_dev_stop(struct aw_device *aw_dev)
+/* Undo aw88261_dev_enable() */
+static void aw88261_dev_disable(struct aw_device *aw_dev)
 {
-	if (aw_dev->status == AW88261_DEV_PW_OFF) {
-		dev_info(aw_dev->dev, "already power off");
-		return 0;
-	}
-
-	aw_dev->status = AW88261_DEV_PW_OFF;
+	aw_dev->status = AW88261_DEV_PW_READY;
 
 	/* clear inturrupt */
 	aw88261_dev_clear_int_status(aw_dev);
@@ -582,6 +588,37 @@ static int aw88261_dev_stop(struct aw_device *aw_dev)
 
 	/* enable amppd */
 	aw88261_dev_amppd(aw_dev, true);
+}
+
+static int aw88261_dev_start(struct aw88261 *aw88261, bool enable)
+{
+	struct aw_device *aw_dev = aw88261->aw_pa;
+	int ret;
+
+	ret = aw88261_dev_power_up(aw88261);
+	if (ret || !enable)
+		return ret;
+
+	ret = aw88261_dev_enable(aw88261);
+	if (ret) {
+		aw88261_dev_pwd(aw_dev, true);
+		aw_dev->status = AW88261_DEV_PW_OFF;
+	}
+
+	return ret;
+}
+
+static int aw88261_dev_stop(struct aw_device *aw_dev)
+{
+	if (aw_dev->status == AW88261_DEV_PW_OFF) {
+		dev_dbg(aw_dev->dev, "already power off");
+		return 0;
+	}
+
+	if (aw_dev->status == AW88261_DEV_PW_ON)
+		aw88261_dev_disable(aw_dev);
+
+	aw_dev->status = AW88261_DEV_PW_OFF;
 
 	/* set power down */
 	aw88261_dev_pwd(aw_dev, true);
@@ -618,7 +655,7 @@ static int aw88261_reg_update(struct aw88261 *aw88261, bool force)
 	return ret;
 }
 
-static void aw88261_start_pa(struct aw88261 *aw88261)
+static void aw88261_start_pa(struct aw88261 *aw88261, bool enable)
 {
 	int ret, i;
 
@@ -629,7 +666,7 @@ static void aw88261_start_pa(struct aw88261 *aw88261)
 				"aw88261_reg_update failed, cnt:%d, ret:%d\n", i, ret);
 			continue;
 		}
-		ret = aw88261_dev_start(aw88261);
+		ret = aw88261_dev_start(aw88261, enable);
 		if (ret) {
 			dev_dbg(aw88261->aw_pa->dev,
 				"aw88261_dev_start failed, cnt:%d, ret:%d\n", i, ret);
@@ -643,15 +680,15 @@ static void aw88261_start_pa(struct aw88261 *aw88261)
 		dev_err(aw88261->aw_pa->dev, "start failure (%d)\n", ret);
 }
 
-static void aw88261_start(struct aw88261 *aw88261)
+static void aw88261_start(struct aw88261 *aw88261, bool enable)
 {
 	if (aw88261->aw_pa->fw_status != AW88261_DEV_FW_OK)
 		return;
 
-	if (aw88261->aw_pa->status == AW88261_DEV_PW_ON)
+	if (aw88261->aw_pa->status != AW88261_DEV_PW_OFF)
 		return;
 
-	aw88261_start_pa(aw88261);
+	aw88261_start_pa(aw88261, enable);
 }
 
 static int aw88261_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -865,10 +902,50 @@ static int aw88261_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+static int aw88261_startup(struct snd_pcm_substream *substream,
+			   struct snd_soc_dai *dai)
+{
+	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(dai->component);
+
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		aw88261->nonatomic = substream->pcm->nonatomic;
+
+	return 0;
+}
+
+static int aw88261_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
+{
+	struct aw88261 *aw88261 = snd_soc_component_get_drvdata(dai->component);
+	struct aw_device *aw_dev = aw88261->aw_pa;
+	int ret;
+
+	/* No I2C in an atomic trigger: the start was completed from DAPM */
+	if (!aw88261->nonatomic)
+		return 0;
+
+	guard(mutex)(&aw88261->lock);
+
+	if (mute) {
+		if (aw_dev->status == AW88261_DEV_PW_ON)
+			aw88261_dev_disable(aw_dev);
+	} else if (aw_dev->status == AW88261_DEV_PW_READY) {
+		ret = aw88261_dev_enable(aw88261);
+		if (ret)
+			dev_err(aw_dev->dev, "start failure (%d)\n", ret);
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops aw88261_dai_ops = {
+	.startup = aw88261_startup,
 	.set_fmt = aw88261_set_fmt,
 	.hw_params = aw88261_hw_params,
 	.set_tdm_slot = aw88261_set_tdm_slot,
+	.mute_stream = aw88261_mute_stream,
+	/* unmuted after the trigger of the CPU DAI, which may start the BCK */
+	.mute_unmute_on_trigger = true,
+	.no_capture_mute = 1,
 };
 
 static struct snd_soc_dai_driver aw88261_dai[] = {
@@ -969,8 +1046,10 @@ static int aw88261_profile_set(struct snd_kcontrol *kcontrol,
 	}
 
 	if (aw88261->aw_pa->status) {
+		bool enable = aw88261->aw_pa->status == AW88261_DEV_PW_ON;
+
 		aw88261_dev_stop(aw88261->aw_pa);
-		aw88261_start(aw88261);
+		aw88261_start(aw88261, enable);
 	}
 
 	return 1;
@@ -1068,7 +1147,11 @@ static int aw88261_playback_event(struct snd_soc_dapm_widget *w,
 	guard(mutex)(&aw88261->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		aw88261_start(aw88261);
+		/*
+		 * Some hosts only start the bit clock in their trigger: when
+		 * the trigger may sleep, the unmute completes the start there.
+		 */
+		aw88261_start(aw88261, !aw88261->nonatomic);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		aw88261_dev_stop(aw88261->aw_pa);
diff --git a/sound/soc/codecs/aw88261.h b/sound/soc/codecs/aw88261.h
index f16f9f8c40a2..eb366f1dde58 100644
--- a/sound/soc/codecs/aw88261.h
+++ b/sound/soc/codecs/aw88261.h
@@ -564,6 +564,8 @@ enum {
 enum {
 	AW88261_DEV_PW_OFF = 0,
 	AW88261_DEV_PW_ON,
+	/* powered up and configured, amplifier off: waits for the bit clock */
+	AW88261_DEV_PW_READY,
 };
 
 enum {
@@ -607,6 +609,8 @@ struct aw88261 {
 	unsigned int rxr_slotvld_mask;
 
 	bool phase_sync;
+	/* the trigger may sleep: the start is split between DAPM and unmute */
+	bool nonatomic;
 };
 
 #endif

base-commit: 0f8bc3b93b76d16682a4d4999f9559b1e18016f9
-- 
2.43.0

