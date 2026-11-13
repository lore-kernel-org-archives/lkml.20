Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578206;
	b=jgtfYogD/iHZ0sRsTLrj/RMzpcFz3FpDZ7Sm9oxTJR7lF8b5kOVuHn9/erfr6IlCLMWe
	 eOMZSJcprcZD7AWxZM1kU9o9srRo03/IKSyjxWgx3W1NAi42E3hrX6JWuEBBmiop5hPK8
	 u7jg1mG883UYPOQH6U4kz9FIiHYnNLL/2+o0Ih4reiWcHGQ/NrAd8l9B/SaQZWDJaPgBc
	 CtOpTEpgJp3Zt7SXYUWX/z6n3iitb3gItGaq8AgcugVI533tFAv5DyuNlh6h42QGYIB4O
	 aglgAQi9SqyIObOMXFE+uONsLTU5bcnsDckVS2FV2NgwLNAFR3OdMcico6Ws7xBWP5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578206;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OBZlMLfPsVQIpOJpXajuH7DlrD4e9+7gm2lISPcBfUk=;
	b=ge7HlTDLWI8I9rNnoA7fY1u7LLCrqc8sgC+ljdancHPds8XRS8Jz4eSAKzqMB1bB787l
	 nGxlrM/cCSCPG1GH2bJDZbTD5UX0YJGh3QY51dRP+WZhdsJ0WlToKyIqwJpvX7f+fjROi
	 tZkMYrZeRucg00doi41f7KxjPXoVyBgyn+Aezy9OQq9eajwUHXuTI9ggAklCnbRPsQlAL
	 CqYnl+TLNAwY0148bJnCjbjGgDxu9XPhONrjppTDEhYSL1TepyMWQJhv0rFbj+jybBMLv
	 9/CwCol4yuZqXTmteL4HZeuglQHjny4VSU1ISZ63xuie9D/5FdX6LHmVpx0CMv1TaKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="JdB/b9SI";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C62606A887
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C62606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=JdB/b9SI
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1377990f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794578203; x=1795183003; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OBZlMLfPsVQIpOJpXajuH7DlrD4e9+7gm2lISPcBfUk=;
        b=JdB/b9SI/CROIyJHCy0lJHwrDpPDapsRqUypDQCUAHyUyV7DnANg0i1VESfMP/0Dlx
         f4b9a/xwBJ90XvVvr8jxfBb7o6b++VeHlMqNDRdmmhDMB0HY2WXqj3UOkIID9LyQos8o
         vEqOD157NNkJPgHjvlWEE8f75LpG0vOpS4OjYwyqFCwoPFuF/vwSUy5OydSaRA3AXKqy
         3HNGrHnpKPYViL7AP5x2KYKPPEilpenEn/DjoDDwUEZHvKiKmBjPCE4GHw6R2k1zmztn
         hB5UVSADnW2CeTPQxHNt4VjkgsOUp66fMYmJflbNI5QSs6XrLNGPeNK+0BTWjtgg1NDF
         ZphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578203; x=1795183003;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OBZlMLfPsVQIpOJpXajuH7DlrD4e9+7gm2lISPcBfUk=;
        b=LOSCDPleaVE/KZgrM3N5SkBUSDVy2ZuCj+HIQQLdVgYJyNahzCCDzGWekLQ/11L53z
         TR/AWoA25jSwfYjx2arQoLIXk4xqZMraKgYfK99+iIuB24Ah5y1DC4eWBheW8UyfDT2w
         GD0SQg1fhqhsAC3UcphIdV2r0P3Z6ZaIdECaKnAefWtILd7d+nNsK4eu/hoOhFoulRz1
         GcmP+LGDfQUfDjjIdF6KTtG7sULYU1N4FpCiBK5Rn/gnk1negJTqxaPDdP3lhl9Aoz6u
         Qki4A/UeUHqYonE8ahNWbd37EqIfu0n5ogkRDuVHAziE27V5LKUTpXKOeVcE1X58n8/+
         IyqQ==
X-Forwarded-Encrypted: i=1; AL+hErE43PeQzH2t6kOlnZxZaGckVwOs3LHjl80ym9yy9Z86pewJvvSpTKtKzsbzVWKKTitzxYGg9Jm6bMOsD3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/4RboCvLAFMIRlGa/gsnZnuwJ989FM7S8wHWvYQ2MSDVjB0UaY
	3MQ35TcH6XFGMTF3cC6FTosEw/gpv+InCCM3pWVB7gn3uX5jsboNdM2TGzVbIYhaC+j0KgafikG
	mblI9v9rDnA==
X-Gm-Gg: AYBFou1GObagZOIavoRWayhEJWlick3GlqCAWiSxwpI+SLiAe3nvcFCUMjBJo1gZAjL
	0IpCp1QrFkX8axePIFhh2pgJ9tI8A6BphnGMj6Jwx1t8/b5SFLrERmEEw1LDDqODj6MSXPKunRY
	xgUgqGLXPMEEOD+uZDcYGfPZo54O9vnoEiau+5sd++C5ONjjL0nQgGE3fg0JeMWf6UQ5MIyIgrr
	e0whtLntMmtuh29fXQxVGr83mgWHdnlx/ysnK8dJ2VDk91gzxCS/CuwWv0vDQgVWaGfr7sRjUXu
	hHayG7QQcOizmIXPVKOfgFn/lvQn+4IRgx6ax9mFHj9qifffFBogQJUeTyKoGlCRR5fGIfKoXbn
	+Q2KJia4SdF/PnSSvrf2Sb5w2kgutboaA2Nzp/0LeJ56GbrNhHbdjMx1wxSFoLxtB5RGKtsvuyq
	mZmHWn6ea/X50P7jjyo1Zt3lDPpc4fngqfB0KMTraEHqDUSLAnhwk/LhPeUnld/g4tp24nmPira
	cqWlkLbWrQNJlMsFqQoB4OP1Eu3j/TMGnJxCQPAVQ4RZ6leJM9mkd2onb9dEXdwpqC/o47VPQe9
	oRPpbKKuTqdr
X-Received: by 2002:a05:6000:2c04:b0:48e:3b53:e100 with SMTP id ffacd0b85a97d-49c73164e37mr5793896f8f.56.1794578203223;
        Fri, 13 Nov 2026 05:56:43 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c608d10b2sm8233202f8f.44.2026.11.13.05.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:56:42 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Fri, 13 Nov 2026 14:56:34 +0100
Subject: [PATCH v2] ASoC: meson: aiu-fifo: prevent sleeping when spinlock
 is held
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-aiu-fifo-fix-sleep-on-spinlock-v2-1-f72015c933bf@baylibre.com>
X-B4-Tracking: v=1; b=H4sIABEX92oC/42OQQqDMBBFryJZd4oRsbWr3kNcJONYp7WJZFQq4
 t0b7QU6iw8PHv/PqoQCk6hbsqpAMwt7FyE7JQo74x4E3ERWWZoVOh4YnqDl1sf4gPREA3gHMrD
 rPb4gJSS8NkVuSqtiyRAoisdAVf9YJvskHPfW3ehYRh+W44NZ797fY7MGDQ2WRHmqzQXbuzVLz
 zbQGf1b1du2fQEYrvXP4QAAAA==
X-Change-ID: 20261111-aiu-fifo-fix-sleep-on-spinlock-0ecec8d64a9b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8520; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=1fTo+4uyzOmAFYCXX+UpHdSokP50b/OzdEc4+14QE3g=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFnfxcWni/3fFB9qK6qqP5GFWSD57ZtNzeVSj3Jctm7Z+
 HXF41jJjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkrx8jw9XD8btX35RcsIjj
 wlFj+btzlsZ8aH3vJRZ89LjY5zD9jXKMDO+urbGo4BPd/mbbo49PJRUetDQ7/eWwWG2udfKiwIr
 UE+wA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

dai_links in the gx-card are atomic which means that the DAI trigger
callback is called with the spinlock held. This means that usage of
potentially sleeping functions (e.g. mutexes) is not allowed here.

'snd_soc_component_write'/'snd_soc_component_read' take the component's
io_mutex on entry.

Replace usage of these functions in:
- 'aiu_fifo_i2s_trigger'
- 'fifo_spdif_trigger'
- 'aiu_fifo_pointer'

This is meant to resolve the following runtime bug found while starting I2S
playback on an OdroidC2 device where the kernel was built enabling
CONFIG_DEBUG_ATOMIC_SLEEP and CONFIG_PROVE_LOCKING:

  Playback device is hw:0,0
  Stream parameters are 44100Hz, S16_LE, 2 channels
  Sine wave rate is 1000.0000Hz
  Rate set to 44100Hz (requested 44100Hz)
  Buffer size range from 128 to 262144
  Period size range from 64 [   21.012074] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:623
  [   21.018009] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 267, name: speaker-test
  [   21.026184] preempt_count: 1, expected: 0
  [   21.030151] RCU nest depth: 0, expected: 0
  [   21.034205] locks held by speaker-test/267: 1, last CPU#3:
  [   21.039638]  #0: ffff000003dbd910 (&group->lock#2){....}-{3:3}, at: snd_pcm_stream_lock_irq+0x40/0x60
  [   21.048782] irq event stamp: 5274
  [   21.052059] hardirqs last  enabled at (5273): [<ffff800081494240>] _raw_spin_unlock_irq+0x38/0x80
  [   21.060856] hardirqs last disabled at (5274): [<ffff8000814935c8>] _raw_spin_lock_irq+0x80/0x90
  [   21.069481] softirqs last  enabled at (5238): [<ffff8000800f9aec>] handle_softirqs+0x584/0x5e0
  [   21.078020] softirqs last disabled at (5231): [<ffff800080010324>] __do_softirq+0x1c/0x28
  [   21.086133] CPU: 3 UID: 0 PID: 267 Comm: speaker-test Not tainted 7.3.0 #2 PREEMPT
  [   21.086141] Hardware name: Hardkernel ODROID-C2 (DT)
  [   21.086145] Call trace:
  [   21.086149]  show_stack+0x20/0x40 (C)
  [   21.086160]  dump_stack_lvl+0x6c/0x98
  [   21.086171]  dump_stack+0x18/0x24
  [   21.086179]  __might_resched+0x160/0x230
  [   21.086189]  __might_sleep+0x50/0x90
  [   21.086197]  __mutex_lock+0x64/0x8a0
  [   21.086206]  mutex_lock_nested+0x2c/0x40
  [   21.086215]  snd_soc_component_write+0x38/0x80
  [   21.086227]  aiu_fifo_i2s_trigger+0x74/0x90
  [   21.086237]  soc_dai_trigger.part.0+0x44/0x90
  [   21.086246]  snd_soc_pcm_dai_trigger+0x174/0x280
  [   21.086255]  soc_pcm_trigger+0xe4/0x1f0
  [   21.086265]  dpcm_dai_trigger_fe_be+0x30/0xb0
  [   21.086276]  dpcm_fe_dai_do_trigger+0x11c/0x1a0
  [   21.086287]  dpcm_fe_dai_trigger+0x40/0x60
  [   21.086296]  snd_pcm_do_start+0x4c/0x80
  [   21.086307]  snd_pcm_action_single+0x50/0xc0
  [   21.086316]  snd_pcm_action+0x88/0xb0
  [   21.086325]  snd_pcm_start+0x2c/0x40
  [   21.086335]  __snd_pcm_lib_xfer+0x660/0x810
  [   21.086345]  snd_pcm_common_ioctl+0xa20/0x17e0
  [   21.086356]  snd_pcm_ioctl+0x3c/0x60
  [   21.086366]  __arm64_sys_ioctl+0xac/0x110
  [   21.086376]  invoke_syscall+0x5c/0x120
  [   21.086386]  el0_svc_common.constprop.0+0x48/0xf0
  [   21.086395]  do_el0_svc+0x24/0x40
  [   21.086404]  el0_svc+0x54/0x3b0
  [   21.086414]  el0t_64_sync_handler+0xa0/0xf0
  [   21.086424]  el0t_64_sync+0x198/0x1a0

Note: the return value of 'regmap_read' in 'aiu_fifo_pointer' is
intentionally ignored. Regmap is MMIO here and read failures shouldn't
happen. Also 'axg-fifo.c' is doing the same in its 'axg_fifo_pcm_pointer'.

Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
I found this issue while working on [1].
This patch is independent of [1] and they can go in in any order. They
are fixing the same problem in different modules.

[1]: https://lore.kernel.org/all/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com/
---
Changes in v2:
- Removed handling of 'regmap_read' failures in 'aiu_fifo_pointer'. Since
  ragmap is MMIO here, read failures cannot happen. [Martin]
- Link to v1: https://patch.msgid.link/20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com

To: Jerome Brunet <jbrunet@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/meson/aiu-fifo-i2s.c   | 15 ++++++++++++---
 sound/soc/meson/aiu-fifo-spdif.c | 14 ++++++++++----
 sound/soc/meson/aiu-fifo.c       |  3 ++-
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index eccbc16b293ad..8f785241585df 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/regmap.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -48,14 +49,22 @@ static int aiu_fifo_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 				struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
+	unsigned int val;
+	int ret;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_soc_component_write(component, AIU_RST_SOFT,
-					AIU_RST_SOFT_I2S_FAST);
-		snd_soc_component_read(component, AIU_I2S_SYNC);
+		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_I2S_FAST);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to write register on trigger");
+
+		ret = regmap_read(component->regmap, AIU_I2S_SYNC, &val);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to read register on trigger");
 		break;
 	}
 
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index a9861c5d66374..297834bce1c7a 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -69,15 +69,21 @@ static int fifo_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		snd_soc_component_write(component, AIU_RST_SOFT,
-					AIU_RST_SOFT_958_FAST);
+		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_958_FAST);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to write register on trigger");
+
 		fifo_spdif_dcu_enable(component, true);
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_STOP:
-		snd_soc_component_write(component, AIU_RST_SOFT,
-					AIU_RST_SOFT_958_FAST);
+		ret = regmap_write(component->regmap, AIU_RST_SOFT, AIU_RST_SOFT_958_FAST);
+		if (ret < 0)
+			return snd_soc_ret(component->dev, ret,
+					   "Failed to write register on trigger");
+
 		fifo_spdif_dcu_enable(component, false);
 		break;
 	default:
diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 8b54f9681d00c..edb47095c059d 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/regmap.h>
 #include <linux/dma-mapping.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -38,7 +39,7 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int addr;
 
-	addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
+	regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
 
 	return bytes_to_frames(runtime, addr - (unsigned int)runtime->dma_addr);
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-aiu-fifo-fix-sleep-on-spinlock-0ecec8d64a9b

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

