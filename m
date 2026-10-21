Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619533;
	b=B6zQlq2flCqGT2z41vUHqFC6NabSPoTo4TiNI47F5txOTvGiXA4LJMjLv6EnS9QO/v/I
	 UTk1Z+ZCDl62xUcDoQjhlHW+i600FmpJ+vFCkCPsQEAuaYnKf4YTfqqwmfv1KlLu13il3
	 H9FVwKDjA3mnVObIcM5FV6TEsCTzT/SOEJxuiR+J8blclymE3QjHM1eeepF6eVvVj3KC0
	 0UlgoMPTHhe2n/RDi2x7zF0TDHb9UOOKhFlIDGqu0IEtlhDRvQ7JTAmY/rBJLpGnAhH7Y
	 nDa4jmDtlBARprJLEDff+kO3vInUIkNS9fazLqJdIiXRYrDwDP16B0uYh4I6qm60MVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+e9kTl0gTJdhkEEUdGkZ8+xd5uH94iYTy0NqVjeDG4Q=;
	b=hlFat1B2J7zlJEMUGHom0volCcBJz5r5V0XD/S/xtUthR3F8EZxJMaMHLDriwaL/BKlC
	 8ngRm8hMe3xV9qZq8elBa5ey6wxIBqHtRnh68X+tXD3ivfjabYNw9Vfrie9+drb6ISrTj
	 hWCuVem/UMNMQ8Z8avMAZrZHdWlrlHaL2ukD3aJ7qW9wtmn3ZPM7fZzKYufEiT1OGPqbx
	 qqGpX0wZy78HPN3aURPNavsgSdN8EXM3ic7H7AD3t196vhzouQtuE2VVK+fRxbmYeafZa
	 nuwADZ/tpptUMrMLpL7TDmBJ1NG0WFV3xQq7car/j+UAnIgZ7pb7UgYtwhi24Stz5HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AdxdjyxL;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBFF606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DBFF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AdxdjyxL
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so3211925e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 14:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792619529; x=1793224329; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+e9kTl0gTJdhkEEUdGkZ8+xd5uH94iYTy0NqVjeDG4Q=;
        b=AdxdjyxLeSlf+obyDYfEbqunpkqqNzl6wbQgc5/AbXmc9cKvrsqHRlaqfIfkpRXNGC
         /JouS00lBfXcqOhxHlHy7L8sdkyHEHG4mab+2fxMEghgKxmTGGjrxySU1KGMN4wnanUj
         gKWSVSjMzVpR/Mp6OR9f5T994jDvJ+g7pcZfJBdYuHZd6PvgyLSkwOD4azX6lKwn7alJ
         xfrfySHpSLt4iUQR+bNt5qf6WHuaW6yUtf3lOPkrFXLjpt1Z0o/8W9flYj6gEcVkx4aF
         NzEDdo7Q6ghv/7P2vOmSjLVtCXeamrUzToeoc2elWeqMwNwYJnfhQp1YdOt2VGaeUMm2
         TLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619529; x=1793224329;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+e9kTl0gTJdhkEEUdGkZ8+xd5uH94iYTy0NqVjeDG4Q=;
        b=aomlu4K7WF2c+uiNILIoegXEw4fegnet09iBFegx6A4JbJ8xXmVWdC7QSbV5EQwMRF
         B1V3VqPUlMg0CZ/YG9V5of1iAT1hgtjQlFaCyWAIOFlP7m30ljzjVwMaXzrcHxWEAil4
         loJVTraKwrZMoVdEVgahlO/W2jCRVoOcj0plmTzblzQFq3Y4JtQhQoWHbw9wsn3o1qZL
         BJSM5ARuSQiUQt+HSDLGCTb6J4v0RtQZ4NNqlR1TychpiFZ7HHm4FDHzX9gsQ6KA6Ul4
         LCMwqXsFw2kzExJHdfu7AYq/DGWvuNbN09Gh2VUjhCBLVPGpUM1FXnRgEZsTeBtycPof
         nVPg==
X-Forwarded-Encrypted: i=1; AKwUvByIP9SAUJlwcrWjwQ67y2MdumAswChDs4CiYxp5Z3QA17BAqF4Pcyz97br1IJaYt6yefboj3Qgn2hAgHGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7S8xPRPh5ReRhkVJ7BJzwD/qVn2ipz2VFAAq5/qoF0XGMzcYE
	C39VuILmxbHGBKBSPmeXR58Wge9gmN/AA7FcgiaQg6kqdarhFY3vY1upuRJfOzGf5XQ=
X-Gm-Gg: AYBFou25TH7jKnOWx4mUYWjYS78/nWu4SuBf7fVjTZGeIzSuI7I3FZezjeG9DdlKpX0
	PeCyJ5ygguBVZDNkgfldcguevxMxCG1tCrS8eEF4dXxIAwZ00+9ouYDnBH1IQmyakoazm3oMD09
	/wYPVPL4oS5g0XeyAMHRw4Sd5yC/7tpuvnaWm7YU13R/Nz+W1ykg8LgowDy8RDfM2G004ECSwYg
	TA3AOKg8LETkgJrHVyGe8bKsGtFJmCOKJPIVrhQniBOF2e4d1zaSp9cY4WN/2V4cErHBZePJUl8
	/CkbQcHNEroa6UqxZA0W+9rAnTBudbhHE/FxLQv0yN8bzg5OtbJFenaeusH6srutEvplM30p55b
	O4jkGBORqYhHhqcI/KD46a7z6XluLA3cBZ7GVI66Ew1IqCodV4DSTlGmjSpTvtqX3cQYa+einQf
	RahEopay+I1uMynVewYDLm8B2Rn+xSeXds07bZrvFqdSOQQIFpjFlsukMj3DZgFbASbJPMMy5Gz
	xAhVWoozYMEiPC/xmOuaWx0QWRdnu5GkWu7sUFt6OUTZIB+Z+/6rw==
X-Received: by 2002:a05:600c:84ce:b0:4a1:e84e:e38b with SMTP id 5b1f17b1804b1-4a204beaabemr9343955e9.11.1792619529563;
        Wed, 21 Oct 2026 14:52:09 -0700 (PDT)
Received: from [127.0.1.1] ([37.103.126.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581eed3sm8840888f8f.12.2026.10.21.14.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 14:52:09 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 21 Oct 2026 23:52:04 +0200
Subject: [PATCH] ASoC: meson: gx-formatter: change stream lock from mutex
 to spinlock
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
Message-Id: <20261021-gx-formatter-use-spinlock-v1-1-71ebc9224c03@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAM02WoC/yXMTQ6CQAxA4auQrm3CVELUqxgXMHSw/syQdjAkh
 Lsz6vJbvLeCsQobXKoVlD9ikmKBO1Tg710cGWUoBqqpdTU5HBcMSd9dzqw4G6NNEl/JP5FO5/7
 IxE07BCj9pBxk+b2vt79t7h/s83cI27YDiy5IKX0AAAA=
X-Change-ID: 20261021-gx-formatter-use-spinlock-289b3e2e46df
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6431; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=JmRd5q70Ih5GAyDXoaeuH8rg99srkjjU5+Roj8RNuXY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFk3TVgrPsseYNlbFfzT5cq6NWnHI+9bpW4V0L7TcP+7/
 8Y9Oe4rO0pZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCR1ToM/6MM7+31tMsTVfht
 Xu6XyFvGbmLPEGt/YglTRfWuFSrOFQz/KzPaXc+fXLfW2v7plm9/O+9Vq/XPWGM6aU5grWH6qRY
 +dgA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

Currently a mutex is being used in 'struct gx_stream' to serialize
access to structure data. This was inherited from the AXG design. An
important difference though is that in axg-card dai_links are nonatomic
so callback functions like 'trigger' are allowed to sleep. In GX instead
dai_links are atomic.

For example, starting playback from userspace with
'CONFIG_DEBUG_ATOMIC_SLEEP=y' results in a warning message like:

[ ] BUG: sleeping function called from invalid context at kernel/locking/mutex.c:316
[ ] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 272, name: speaker-test
[ ] preempt_count: 1, expected: 0

due to the following call stack:

snd_pcm_do_start (called with spinlock taken)
  dpcm_fe_dai_trigger
    dpcm_fe_dai_do_trigger
      dpcm_dai_trigger_fe_be
        dpcm_be_dai_trigger
          soc_pcm_trigger
            snd_soc_pcm_dai_trigger
              soc_dai_trigger
                aiu_encoder_i2s_trigger
                  gx_stream_start (takes 'ts->lock')

Fix this by changing the lock type from mutex to spinlock. This is safe
on GX platform because all formatters' functions only perform MMIO regmap
calls that do not sleep.

'spin_lock_irqsave' is used in 'gx_stream_start'/'gx_stream_stop' because
trigger runs with IRQs already disabled and stop can also run in IRQ
context (e.g. in case of XRUN while executing 'aiu_fifo_isr').
'spin_lock_irq' is instead used in 'gx_formatter_attach'/
'gx_formatter_detach' in order to prevent IRQs on the same CPU that might
end up calling 'gx_stream_stop' and therefore deadlock.

Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
This fixes a pre-existing bug, present since v7.3, reported by Sashiko [1]
while reviewing the series adding I2S input support for Amlogic GX
SoCs [2].

[2] depends on this patch to address Sashiko's comment.

The commit message provides all the details of the fix.

[1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
[2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/
---
 sound/soc/meson/gx-formatter.c | 21 +++++++++++----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index 2d3218cce426..6b4155f9f05e 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -61,7 +61,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 	struct gx_stream *ts = formatter->stream;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 
 	/* Catch up if the stream is already running when we attach */
 	if (ts->ready) {
@@ -74,7 +74,7 @@ static int gx_formatter_attach(struct gx_formatter *formatter)
 
 	list_add_tail(&formatter->list, &ts->formatter_list);
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irq(&ts->lock);
 	return ret;
 }
 
@@ -85,9 +85,9 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
 	if (!ts)
 		return;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
+	spin_unlock_irq(&ts->lock);
 
 	gx_formatter_disable(formatter);
 }
@@ -212,9 +212,10 @@ EXPORT_SYMBOL_GPL(gx_formatter_create);
 int gx_stream_start(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 
 	/* Start all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
@@ -228,7 +229,7 @@ int gx_stream_start(struct gx_stream *ts)
 	ts->ready = true;
 
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gx_stream_start);
@@ -236,8 +237,9 @@ EXPORT_SYMBOL_GPL(gx_stream_start);
 void gx_stream_stop(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
@@ -245,7 +247,7 @@ void gx_stream_stop(struct gx_stream *ts)
 		gx_formatter_disable(formatter);
 	}
 
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 }
 EXPORT_SYMBOL_GPL(gx_stream_stop);
 
@@ -256,7 +258,7 @@ struct gx_stream *gx_stream_alloc(struct gx_iface *iface)
 	ts = kzalloc_obj(*ts);
 	if (ts) {
 		INIT_LIST_HEAD(&ts->formatter_list);
-		mutex_init(&ts->lock);
+		spin_lock_init(&ts->lock);
 		ts->iface = iface;
 	}
 
@@ -272,7 +274,6 @@ void gx_stream_free(struct gx_stream *ts)
 	 * are removing the TDM DAI. It should not be possible
 	 */
 	WARN_ON(!list_empty(&ts->formatter_list));
-	mutex_destroy(&ts->lock);
 	kfree(ts);
 }
 EXPORT_SYMBOL_GPL(gx_stream_free);
diff --git a/sound/soc/meson/gx-formatter.h b/sound/soc/meson/gx-formatter.h
index b90b1814d79b..9f5a1720481e 100644
--- a/sound/soc/meson/gx-formatter.h
+++ b/sound/soc/meson/gx-formatter.h
@@ -20,6 +20,10 @@ struct gx_formatter_hw {
 
 struct gx_formatter_ops {
 	struct gx_stream *(*get_stream)(struct snd_soc_dapm_widget *w);
+	/*
+	 * Following functions are called with gx_stream->lock held and local
+	 * IRQs disabled so they must not sleep.
+	 */
 	void (*enable)(struct regmap *map);
 	void (*disable)(struct regmap *map);
 	int (*prepare)(struct regmap *map,
diff --git a/sound/soc/meson/gx-interface.h b/sound/soc/meson/gx-interface.h
index 2a6207e393e8..a6a5cc9e7af0 100644
--- a/sound/soc/meson/gx-interface.h
+++ b/sound/soc/meson/gx-interface.h
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/regmap.h>
+#include <linux/spinlock.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
@@ -24,7 +25,7 @@ struct gx_iface {
 struct gx_stream {
 	struct gx_iface *iface;
 	struct list_head formatter_list;
-	struct mutex lock;
+	spinlock_t lock;
 	unsigned int channels;
 	unsigned int width;
 	unsigned int physical_width;

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261021-gx-formatter-use-spinlock-289b3e2e46df

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>

