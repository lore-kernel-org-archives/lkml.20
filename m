Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CD03CB56D;
	Wed, 14 Oct 2026 03:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948334; cv=none; b=TTQ/gbfo50zfxiRQUpe9+QJ14uX+sgE4XI024qAaCYauyumbnMkKYehwmfu20mtVtvW+CnFMvtRG9QhumPyrDKFgZUUTKNgQep7+11tcdEbAIIzSP7MHy72S5BzPEOGFpgV2tcm68NkkmdXh5r+mdgr+YrwMkUk4d8UA3ofDPqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948334; c=relaxed/simple;
	bh=JO90CH7Q46Li+EH1Aao9Npj0KiUl9XChQz8Z3w38Y6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRc6QbPPDMoRnttyLDfuFV2ACTNeRWRWlwI1bs1wMHdL/Mue6GK37889ZUvdAoy5biqdyBWgXotsT7ywe6UH8qBSIF/3gBv39pMAEuQWJ5TsV406ShkW/O3VRvUJqHm28vlOeLu/IkxqR9VugsW+vewPV+4W1p4Cc1+/hh7IPlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=BOewSsr6; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="BOewSsr6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=ZZ
	jqsTDDAq0mwg6TAnTcIcLIDtFWhoLN+vUTQh+IT/U=; b=BOewSsr6+8kw+CE13c
	UK9UeqvIoA/QWskJ6YZMJe+nIQ7wA6UYauOpexxZTJLdxmUDJwzvVegitemxMpVL
	qUfLLYPo4F0Uy85UyXpvlV70RF2WDHIts76p3AcbF6nKmZMMxjGFwurlMRJ6H5OZ
	gWf2kj03IrdQoOTPv+81lOCWA=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3v88G9s5quKBFEQ--.27196S11;
	Wed, 14 Oct 2026 11:25:01 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 9/9] ASoC: rt5677: restore safe state after resume errors
Date: Wed, 14 Oct 2026 11:24:52 +0800
Message-ID: <20261014032452.13456-10-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261014032452.13456-1-hppiscas@163.com>
References: <20261014032452.13456-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v88G9s5quKBFEQ--.27196S11
X-Coremail-Antispam: 1Uf129KBjvJXoW3AF1rKrWDCFyrKry5XF15CFg_yoW7try8pr
	Z0gFZYyrW8Xr47uFW5tr48ZFyrtrWftF43Aws2ga4akrn8Cr1fW3WkJr1UZFyqgr4DX3Zr
	ZF4UZ3yDuw1UWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piF1v-UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7g0P12rO9g269AAA3q

rt5677_resume() ignores regcache_sync() failure before continuing
dependent resume operations. Restore cache-only mode, leave the cache
dirty, and return the replay error before those operations.

First return physical regmap write errors from the normal-mode write
wrapper, which currently discards them, so cache replay can observe bus
failures. Restore reset and the optional LDO GPIO on replay failure.
Remember that cache restoration is still pending independently of the
requested DSP VAD mode: DAPM or controls can change that mode after
failed resume. Suppress DSP work while restoration is pending and
require replay on the next resume even if VAD has since been requested.
After successful replay, preserve the existing MCLK settling delay
before restarting requested DSP work. The already-running, retained VAD
path and DSP-mode transport are unchanged.

ASoC still marks the component resumed when the callback reports failure.
Track the suspend-owned IRQ disable so another suspend does not increment
the disable depth again after a failed resume. A later successful resume
releases that one disable reference. This does not add automatic retry or
change the framework's best-effort card resume policy.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 0e826e867264 ("ASoC: add RT5677 CODEC driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1:
- restore cache-only mode and dirty state on replay failure
- keep suspend-owned IRQ disables balanced across failed resume cycles
- propagate the normal-mode transport write result to cache replay
- preserve pending cache restoration across changes to the VAD request
- keep DSP work paused until replay succeeds, retaining the MCLK delay
- send as one correctly threaded series, as Mark requested

Previous series:
https://lore.kernel.org/all/20260906034321.86080-1-hppiscas@163.com/

 sound/soc/codecs/rt5677.c |   37 ++++++++++++++++++++++++++++++++-----
 sound/soc/codecs/rt5677.h |    2 ++
 2 files changed, 34 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 7b80922236e5818e846d9ecc6e23793e6ae40714..fd1f840d6794ea95b47d803ba4977fdb81e184a9 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -885,6 +885,9 @@ static void rt5677_dsp_work(struct work_struct *work)
 	bool enable = rt5677->dsp_vad_en;
 	int i, val;
 
+	/* DAPM may request VAD even after component resume has failed. */
+	if (READ_ONCE(rt5677->cache_restore_pending))
+		return;
 
 	dev_info(rt5677->component->dev, "DSP VAD: enable=%d, activity=%d\n",
 			enable, activity);
@@ -4939,10 +4942,14 @@ static int rt5677_suspend(struct snd_soc_component *component)
 
 	if (rt5677->irq) {
 		cancel_delayed_work_sync(&rt5677->resume_irq_check);
-		disable_irq(rt5677->irq);
+		if (!rt5677->suspend_irq_disabled) {
+			disable_irq(rt5677->irq);
+			rt5677->suspend_irq_disabled = true;
+		}
 	}
 
 	if (!rt5677->dsp_vad_en) {
+		WRITE_ONCE(rt5677->cache_restore_pending, true);
 		regcache_cache_only(rt5677->regmap, true);
 		regcache_mark_dirty(rt5677->regmap);
 
@@ -4956,8 +4963,11 @@ static int rt5677_suspend(struct snd_soc_component *component)
 static int rt5677_resume(struct snd_soc_component *component)
 {
 	struct rt5677_priv *rt5677 = snd_soc_component_get_drvdata(component);
+	bool restore_cache = !rt5677->dsp_vad_en ||
+			     READ_ONCE(rt5677->cache_restore_pending);
+	int ret;
 
-	if (!rt5677->dsp_vad_en) {
+	if (restore_cache) {
 		rt5677->pll_src = 0;
 		rt5677->pll_in = 0;
 		rt5677->pll_out = 0;
@@ -4967,11 +4977,28 @@ static int rt5677_resume(struct snd_soc_component *component)
 			msleep(10);
 
 		regcache_cache_only(rt5677->regmap, false);
-		regcache_sync(rt5677->regmap);
+		ret = regcache_sync(rt5677->regmap);
+		if (ret) {
+			WRITE_ONCE(rt5677->cache_restore_pending, true);
+			regcache_cache_only(rt5677->regmap, true);
+			regcache_mark_dirty(rt5677->regmap);
+			gpiod_set_value_cansleep(rt5677->reset_pin, 1);
+			gpiod_set_value_cansleep(rt5677->pow_ldo2, 0);
+			return ret;
+		}
+		WRITE_ONCE(rt5677->cache_restore_pending, false);
+		if (rt5677->dsp_vad_en) {
+			/* Allow MCLK to settle, as when leaving bias OFF. */
+			schedule_delayed_work(&rt5677->dsp_work,
+					     msecs_to_jiffies(1000));
+		}
 	}
 
 	if (rt5677->irq) {
-		enable_irq(rt5677->irq);
+		if (rt5677->suspend_irq_disabled) {
+			rt5677->suspend_irq_disabled = false;
+			enable_irq(rt5677->irq);
+		}
 		schedule_delayed_work(&rt5677->resume_irq_check, 0);
 	}
 
@@ -5021,7 +5048,7 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
 			rt5677_dsp_mode_i2c_write(rt5677, reg, val);
 		}
 	} else {
-		regmap_write(rt5677->regmap_physical, reg, val);
+		return regmap_write(rt5677->regmap_physical, reg, val);
 	}
 
 	return 0;
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 876f7674015c2c0a5421feb25a8c80313b18310a..e6e915453f2efbe78c9d2dd3e909397d9ad715ca 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1788,6 +1788,7 @@ struct rt5677_priv {
 #endif
 	bool dsp_vad_en_request; /* DSP VAD enable/disable request */
 	bool dsp_vad_en; /* dsp_work parameter */
+	bool cache_restore_pending;
 	bool is_dsp_mode;
 	bool is_vref_slow;
 	struct delayed_work dsp_work;
@@ -1798,6 +1799,7 @@ struct rt5677_priv {
 	unsigned int irq_en;
 	struct delayed_work resume_irq_check;
 	int irq;
+	bool suspend_irq_disabled;
 
 	int (*set_dsp_vad)(struct snd_soc_component *component, bool on);
 };

base-commit: 8ef28aef33f2d5da6959ad6b579ec3cfccc009f6

