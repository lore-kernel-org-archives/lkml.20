Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391788;
	b=LNJXDSIN6OJYB4VaDl4AfVRIyM0QlQNUGrejm+tVNf+6t6CheuWQgHL/9OK77kvnXf8q
	 l9jpM/UO2ziyz+XHxgpXJARuQ2NjqC3vTvpTIjQTWInJOdlspYGTRIZ6K5Z/QzBqnA2ua
	 zkE9+xfq0x19WsgYCabJVmHu4VGNVju5LVFXXM+XD2YjEVG9hKSPseFXY/bCWnAaR3gzw
	 kMYPtLfpIWqyc8qmmu2CWFCf7weSd4NKFJ4dLzqWtumgaH/p5Z36PD43khRzEoBhNica9
	 EOIiF2M9A9xpzxlYRUHC3TOI9B9JZ/rSwfVtJgz+CtpyKBKkOP27K7QxGuF7audxfKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=yP8LUV7oQ2QnWZcMn4c2h1Fuc/wYBouEPrqAcg2WnpY=;
	b=o4STSFNuTnd/4bOH7SCfLgqSfFFbe5fDW1Ldn8s+Ba/jJU83prlOy/H8943oRWWlqsL0
	 7DvEuR+XcLuX+VIVAWorM5wRpUw3ETGfHGUUCZjGdrPaoev8QQxLWMR0S7A3GwOBv8YKx
	 mcPqkc4M0BV7PSQW4ZbrCeq6kFQMk3kzxBBJnUPmUpQG+f1259MLm6yi5SjUbDeSUBqSl
	 ZNNqFuSnei1mdAT00z+QulIJ4kn17ZrR3LQdIlUJKi2/U1qzzeU23RmNvwo5KdlexXgHF
	 Rt9Ru/XbUmtZsoW93qpf9a0QEOAiNGLDeLZBT9QDW+WKNHwbya/Gpb2PntCo9VE5+xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c+35jECA;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C129606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C129606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=c+35jECA
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so30884315e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391785; x=1794996585; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yP8LUV7oQ2QnWZcMn4c2h1Fuc/wYBouEPrqAcg2WnpY=;
        b=c+35jECAYTBuNyviqkigdMISH/Y79Y9H7OCFszECn9H2WyoDpEFRgthhMD1vLKHtnB
         7yGfy1S3DNiihcXAnUX+rwY4RcQlNlF/+BBaUuelxL7Ba/AAMurMjFCyMjjmm6vLZb0X
         TXP9MILw5+mQgNGLdBTaPHCd37UZ7kRKFn05zMnrT02USn0glMSqzx1EPGrPk+7YF/Dv
         sUCwBVoGOwUnfUmNxFWIQAXtquG1+i/A6Lz2vZ9pwdPQmEknxK+HZ2EWXgLEl8MUu9eU
         Y2lVXdxgq0rZXa8hi80dz1cuKHb+cEpygknPKG4sC80wtpMIUcygFNXCj6uYumAGQNTk
         zmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391785; x=1794996585;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yP8LUV7oQ2QnWZcMn4c2h1Fuc/wYBouEPrqAcg2WnpY=;
        b=E7oaW3vYLZALJ5MKP3Yaf3rtK4ggy0i4CGb2kVtsAlgaRj2YDEU1a78u3Hij5rN6Z2
         /2GahVrFvtcwnhPgDKKvuDt5o+JdLdeb7jlXQxYYeGWbrkRhyVR7KADXMVDdxKrPs4/K
         l2J/6aNkgIRNhBN14KRf/Tq3MLXliYtn1U0+FrVB2j+fkrDkWwK3kooPk9Bwf7FulNs1
         95Eqnyf79GcKAr69gauCgCbaq4YTjCzE6RqTJDm1GwMt+p7h+UEpQXWKNxO/wrMNTYZt
         JVMAnQVf0Z6DcRliNKxQzCMbnMFucGIVsLGBdZhVlFLub3/3A8efYKG/3lrkPG68pNEy
         lRWQ==
X-Forwarded-Encrypted: i=1; AL+hErE9/fpUNd1Z4kgNPlJzdgk00f8I5NGXo+XgqjeoNxO6+IdVbEJHybGs49IeBbXUJ+WmrmRUz12hB5Nlj0Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MO23YN28fQ3A3vrIMqLJTz1Ri51kGpzCXaEY5Ew9eV06OFCAr
	/OqSgRZOGGimRtWO54Yc9LRYcRcUzc0iFq30ezZP+eRP04UEbSx3ax8U+oP8CfiUXXc=
X-Gm-Gg: AYBFou0Bp4PRuBjT0p1gHurkkgu0TMjcdUR25UyMSFQOTsgMPtBtZnrZefsMjdAxwhU
	nGXOK+KOXvI1BJk4Bu3q8TKSIe0Sfm+tjCmrG3UdPc8s5jiIe1zDjLhqBkG8288kJVKOcCYn6Ph
	qEfum0e34B+1MVBDz8sRLI9e4kI0/Bps7mszp0i4DYT03pRmEZceSgzP/LcJOsxfGXhLClXkf5/
	wwBmdVzaamgU73p8+EUTyqpZ4IU7etyXQXQQJ7i4+9GCjLtyO5ZaJzlJQ7UaAukoQAOoZQi9Dqp
	y7rdrBmi9Gwg7lBh2z5grc2kUI3G8lkzteN68YG6tqjtURYWLPkoe2ecSzNRoZANrR09kTPCbjG
	G1Q+Kxs2obyBvA7Jqrk13RxtYkl5s15Q+oRq2BiY2UWdWjZs883uwxlRstWshbVHLQqkNLJ3S8i
	DxXee2dv8GOa/V413dY5HJvzq4l3mQC4Ye45HewawbupFB+q3kstoBrUPRnmEPifjA09698MEB+
	+3NBFZNIblTtCYWRG2A5gxf7fF9zduffaViUxmN1txWuw0w7V5f38PAEKZtli4H51y2xfUSeA/S
	rRg0nTlEFOqlD52TvqXea1TvoYRESj4kkOMirUU7c7LseXH2
X-Received: by 2002:a05:600c:8589:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4ba38a9863fmr17830915e9.12.1794391785442;
        Wed, 11 Nov 2026 02:09:45 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe9357sm152780285e9.9.2026.11.11.02.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:09:44 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 11 Nov 2026 11:09:12 +0100
Subject: [PATCH] ASoC: meson: aiu-fifo: prevent sleeping when spinlock is
 held
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
Message-Id: <20261111-aiu-fifo-fix-sleep-on-spinlock-v1-1-dc9ee401a7cf@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAMc+9GoC/yWNwQrCQAxEf6XkbKAtUqq/Ih626bRGy+6ysSKU/
 rtR5zDwYHizkaEojM7VRgUvNU3RoTlUJLcQZ7COztTWbdd4OOjKk07J6822AJlTZMsalyQPriG
 QfuyO4TSQS3KBD38Hl+ufbR3ukOfXSvv+AQ5qGu6CAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7613; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=dQoT8hjh+AUyid6qjr91Zz8IW3/y9GFeueotEzb2A1s=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7F4c/2kaP99383eGK5EKm2otMm2Ef699NG1+3Lu8G
 6VcZcFVHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIBBDvivq7zSJFjtstkuO/
 hvEUqZi3v8+ntx485Xx1jrh04XYrhv+lplkaZ94Y/X+64sXNFRES8ffOaxu2aJ9lb5z9KcIi5gc
 bAA==
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

Fixes: e8712315c44d ("ASoC: soc-component: use io_mutex correctly")
Fixes: 6b59c53c8adc ("ASoC: meson: aiu: fifo-spdif: soft reset the S/PDIF datapath on start/stop")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
I found this issue while working on [1].
This patch is independent of [1] and they can go in in any order. They
are fixing the same problem in different modules.

[1]: https://lore.kernel.org/all/20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com/
---
 sound/soc/meson/aiu-fifo-i2s.c   | 15 ++++++++++++---
 sound/soc/meson/aiu-fifo-spdif.c | 14 ++++++++++----
 sound/soc/meson/aiu-fifo.c       |  6 +++++-
 3 files changed, 27 insertions(+), 8 deletions(-)

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
index 8b54f9681d00c..f3cdcce1ebfe3 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -5,6 +5,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/regmap.h>
 #include <linux/dma-mapping.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
@@ -37,8 +38,11 @@ snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
 	struct aiu_fifo *fifo = snd_soc_dai_dma_data_get_playback(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	unsigned int addr;
+	int ret;
 
-	addr = snd_soc_component_read(component, fifo->mem_offset + AIU_MEM_RD);
+	ret = regmap_read(component->regmap, fifo->mem_offset + AIU_MEM_RD, &addr);
+	if (ret < 0)
+		return snd_soc_ret(component->dev, ret, "Failed to read FIFO pointer");
 
 	return bytes_to_frames(runtime, addr - (unsigned int)runtime->dma_addr);
 }

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261111-aiu-fifo-fix-sleep-on-spinlock-0ecec8d64a9b

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

