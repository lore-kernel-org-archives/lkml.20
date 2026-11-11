Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391976;
	b=ilRbnTGt91okw/O4iXgNNVpL34L9lgSh1m1aMEOqijA2S9LbbkFsyYl/45xo8mz3ETKg
	 OLC2w+xq6LKpCgSFuErRvLQkJLZmoD7tNeQSrpNM0byj1tIpnjTIpqLpzwtweQMQz3g1S
	 spltsaZbAiXuKBkt46k/v9IVK9yImwsi70uCTJHLaWtmDyyGcosl/gMLm/suRCh8fYjLm
	 LHVFVxUyVQNl4PF44qGpig+Lz1EdhxJXBC0pveej17YO6k7xnKsl3xpFTySmbYX7Pn0lQ
	 76hFvRaCSwD1cdcJLZeAUo0Fdy6uIyxs7F5z5JdDn7HwHRh9FrDA11eV1clhTbBA+Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391976;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
	b=rQtBoFxSTX5Hn7jAoJQ8HUi3DSJL2cI7mmXHCFFKXNs/kI3vQyAKp8RDJeMeqS6Knn29
	 DRE5jp803o1fPB7CZv4w5M+VDUUhBdjwgIZUhnxpbmtnVr2n9A4IpDtUxN78fuq56d0BA
	 HxjfjFUt0EJwQrukK3/9aSWDaX5AXtrOOXmyEqo7gNLA0tphKRIjNtwYWRIzOHGmzTy3x
	 Buzk223MYQ8JEq6vF9PBgPkz8UkCeP5fg7krW/g7tdpqM3hSwyQ53A0MtAqEIkJBnSsNo
	 034WsWiOSNY+0fgv0y9GWIXkvVZUsChVnI4WEhP3ngDpGZ0394qYT046P/U+bVsBRww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W5pBskQy;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C8D606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C8D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=W5pBskQy
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so35537275e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391975; x=1794996775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
        b=W5pBskQyFgi5GqCuy+i2ozI+skZ24DZK7z7acKRm58KQ9eVXKzfa9GWqNP+Caz2c5e
         TEumgVvMeVYKxJBA/Be4pGa6hILpvjhqMMdFoMzDn7rGm3dxiTLJHB9h09f8UwRlZsQR
         4C2rK4wSnc0w0gyTC5VGzz2JZzSZfOVJ724/8ktaoeg39miuYrdSVUdVfrmOIouIFyUf
         XXJDVk1YVJMlh/sxxzvu//1DpkGCyAPRdOmvoV48o9UDxfAU5+s7AJh+25/RPkUF2lo1
         ThXxnX26bIQFUi4CqXLZry7UfWZOHz9aRKlLOXZ9S3UMv4t5867opROfBEdzQc9d9751
         21IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391975; x=1794996775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n3v1AgR+CHCMi0QrlArcix8UUVt6MgDpIHZcAPaGD/I=;
        b=hj3jRaayLUjm4J+aYF2mripMdXiF52883OBeclB68r5JZyaPRsJe20DZOKNz9C1QTt
         y1XD4U2e3TAQbpyaCA4bQx6w/B9APi/kUGA+vPIex7YV/eDFXXQoxWsgMVseOgtPZq08
         eXikMQfoGdbjOS/HyUhZqr974fWrpnTPv4GvXa5Cdifzgot6WduDNA5fAE0ZKFPRILtc
         1651Z0bF4AQZivy/Z9kC8RLn/HF6mOrMHIim/9wIdp6iTWjVUAz1ha9246zRsGe0Ug58
         aH8u6KG5ZZ+nxqWEk2ZCNSptUR9Xbe/ZPqqCufTGcrzO99waCVuyWRRJO+Jf2Co52lX0
         dnZA==
X-Forwarded-Encrypted: i=1; AL+hErEM8CLa8vKyETxyKvrjfnY6Tv1wd+JmY69g3eUJR+y2Am0CRJ2svlI9/D6tbRp/QnuaDhgwijxXSmy53Ws=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hyr2nQU1iqHwJFPgxHnE40btE1Qs/C3973p9XAurkbp7m0oS+
	fh63jdutGX3ZbpwIxuRXPD0UK3t63ilN8LmYKvYGAvm8EEwEkHvHSe0BGNrLilLKltkR3uNyDrl
	b6L4nxQ4=
X-Gm-Gg: AYBFou1lzywgOF6JjUTE82mWHGGYXkoYVpndf3ftIaQwA9PA2DKvGKH5EOclinW1pVK
	FK3G38npdnbuLBEsBg6Qybg62TSX0AD/gmO8WlM9n2JsBU8bwKaVEvea0n3m6oMv4R2jYMLYaDN
	Avi+81ePPON0SDPJYk++Fe72A5vch+yOU0F+HYDsa943OTRexaaR9H2s5w5xpIkOTxOdsy5WdGm
	6ulv3n8VQqG2WNkygLjiFKsgtBTFdDH20qDVCkk1Nq5ID49c1iDWobjPY5WwUrfiPM/TGwa4ST2
	Jse9iARDk1yKrxML+NDwIucvXziwaDqOGkFjuvMzq46Z9X0Hvgpt8xGquggGvJvGdOMjuuYkHsx
	3RGnN3QDjTsMxj2sml4et6n8sEutKNBqbLtXwYLVoIaLiLuIrZ2utBasao1lWLT5LiNG2J4gBz1
	sFvLBMMjhv3527iywhjAgD4meV5m378HA2Z7p9d6wxKKHMFPpEHFf4uUfOXD9tO03m52Y5X1YAm
	aSSCkS0lEAZF1MJBnS8w+X9AbAiL/66jg+PZs1wUIUy964HnLzxOV8WUFYhJLUGl8QjZSGY4xcM
	NmwQwg/nlLmo2gMoYcJEhbjbqcPE
X-Received: by 2002:a05:600c:1c0c:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4ba091a5bcbmr39187675e9.0.1794391974882;
        Wed, 11 Nov 2026 02:12:54 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:54 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 11 Nov 2026 11:12:48 +0100
Subject: [PATCH v2 1/2] ASoC: meson: gx-formatter: change stream lock from
 mutex to spinlock
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
Message-Id: <20261111-gx-formatter-use-spinlock-v2-1-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6296; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=AM5clnX3PNR8b5jWnSWhqcd+0TC3ywf0Ls6D1xVD6fs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7JeIHVcOnz7ZzPIyH2f50x0x+8PPf/DoePR8k9ufw
 zLV7aJ8HaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIUTDD/1reef7JW5+1Bdr9
 i7g0jZvR+o6h2ivt1hsPzj076tSo+pThr2jr82DTQ63bXtSc8syJ1tBtc+AzO5/8lIvLXs8pYI4
 iIwA=
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

While at this also improve 'gx_formatter_detach()' by moving
'gx_formatter_disable()' under the spinlock guard. This makes it symmetric
to 'gx_formatter_attach()' and ensures that the prepare/enable/disable
formatter callbacks are called with spinlock held.

Fixes: a295be8d6210 ("ASoC: meson: gx: add gx-formatter and gx-interface")
Signed-off-by: Valerio Setti <vsetti@baylibre.com>

---

Changes in v2:
- Moved 'gx_formatter_disable()' under the spinlock guard in
  'gx_formatter_detach'. [Martin]
---
 sound/soc/meson/gx-formatter.c | 22 +++++++++++-----------
 sound/soc/meson/gx-formatter.h |  4 ++++
 sound/soc/meson/gx-interface.h |  3 ++-
 3 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index 2d3218cce426..d3bc0c6c81cd 100644
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
 
@@ -85,11 +85,10 @@ static void gx_formatter_detach(struct gx_formatter *formatter)
 	if (!ts)
 		return;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irq(&ts->lock);
 	list_del(&formatter->list);
-	mutex_unlock(&ts->lock);
-
 	gx_formatter_disable(formatter);
+	spin_unlock_irq(&ts->lock);
 }
 
 static int gx_formatter_power_up(struct gx_formatter *formatter,
@@ -212,9 +211,10 @@ EXPORT_SYMBOL_GPL(gx_formatter_create);
 int gx_stream_start(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 	int ret = 0;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 
 	/* Start all the formatters attached to the stream */
 	list_for_each_entry(formatter, &ts->formatter_list, list) {
@@ -228,7 +228,7 @@ int gx_stream_start(struct gx_stream *ts)
 	ts->ready = true;
 
 out:
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(gx_stream_start);
@@ -236,8 +236,9 @@ EXPORT_SYMBOL_GPL(gx_stream_start);
 void gx_stream_stop(struct gx_stream *ts)
 {
 	struct gx_formatter *formatter;
+	unsigned long irq_flags;
 
-	mutex_lock(&ts->lock);
+	spin_lock_irqsave(&ts->lock, irq_flags);
 	ts->ready = false;
 
 	/* Stop all the formatters attached to the stream */
@@ -245,7 +246,7 @@ void gx_stream_stop(struct gx_stream *ts)
 		gx_formatter_disable(formatter);
 	}
 
-	mutex_unlock(&ts->lock);
+	spin_unlock_irqrestore(&ts->lock, irq_flags);
 }
 EXPORT_SYMBOL_GPL(gx_stream_stop);
 
@@ -256,7 +257,7 @@ struct gx_stream *gx_stream_alloc(struct gx_iface *iface)
 	ts = kzalloc_obj(*ts);
 	if (ts) {
 		INIT_LIST_HEAD(&ts->formatter_list);
-		mutex_init(&ts->lock);
+		spin_lock_init(&ts->lock);
 		ts->iface = iface;
 	}
 
@@ -272,7 +273,6 @@ void gx_stream_free(struct gx_stream *ts)
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

-- 
2.47.3

