Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088054;
	b=jq/MkjlrtBdZi908MhdsooFcl6401/4A/vegOnoc236XA13nphJSct7eFzgv9czljRCr
	 B5/iPUgUFTmiZuPwGY4ZaHus8FUStawarWxP4gF9XAW0uc6F5k/mHa7u9Qk/ZcrqEoqWv
	 rswO8UI2boaT8h0H1EMr0gqI0rv0Vsio6duDe4LFHupnqK7GhVZ70omHNgGxee8wGlLKA
	 aZqrCyXeHR4YGvQ6ag9um939wD5DEH2JDvWJMEayZCGf353/TDBabxpnPPtl7DylQ3rUF
	 K6f1dotxqVa0VW2/wczk636ISfyaOHQVEPwiQ7XpZRqXbbrApPHci324DhJyPWp/iTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NGMljU8i0CzYubSHwRnXU3KUoCyXo07gCimyz3WL1DY=;
	b=W6zvYjQ9xuzt8cH2Fp4gGWoVo4XxZs3d9oOVmK4GKiq0YwnFMwBV4zKNpKmtRDy82g+t
	 xn3PV7aruZHIoLQZx83yb85UN+dj+8ZHydREk8N9fBNfPATj6D59EwMwfdZwYiFyMfEFv
	 ZTwJKEEZcjzpqa2830yDJHE2c41pPjH/h3Jd1uuY4xAnvSGdOTcIcnycywtN7oZpgxVpY
	 i7htCezG4Dczqvg3shJfDxhfFGC2VJJGni606feTFYpOLo34FtgKSB4nCxaxY9GMOgUax
	 s//7TyzUWMTWpnNubrsqqr9615gQ+RVdDnA8z6U+DEnq0FkJ93HLjBtp4IZ4Z837AZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaE+tugZ;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32661606A33F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 21:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32661606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JaE+tugZ
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-8470d7d430fso9275a34.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 13:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794088053; x=1794692853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGMljU8i0CzYubSHwRnXU3KUoCyXo07gCimyz3WL1DY=;
        b=JaE+tugZEwYWESR2YltaSzM776q8Mp/prLUPtxqZcvdj6KivQM5IEVRFZFE6PB+iB5
         n5PDUJcoEtyJUPF56dg24Bk7U5u+poNJwgbTvxzK00VZNkQxQBsp+kJblQVhFdLGtZgV
         cQJeT2XIC9tCcTEbWJQKKcyHdHNOz5MFYfhpZcIdpK4w13BunjCluNkRFT9YtE55trt8
         9rYbdTBkGLIImY9iBlpKRUqvfqg0lzDdDq8htF7BKJq+ezirKXZCbolcVOrnE0n72hyD
         OYTi2fkkpyeJQMG2VvuoqMjhEb3xo+PWCvlxIzxgcNpKztM8z2GvshphqR/8sVDMFns5
         C+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794088053; x=1794692853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NGMljU8i0CzYubSHwRnXU3KUoCyXo07gCimyz3WL1DY=;
        b=yXc6G7VwvkQeoXN33bqLlrKSEZD4IWzre3JHHuuYbzBjcMxAZTFCr4T4fOW69S26X9
         qUm9vemss+rIf2lssfw4uvWSdzFGJtadSdqyyKgR+35HhRDiYKiBTOZEA0HFBO33Y3QC
         1Qc9m7XxQZLJ0bZOyv0a2aIGnl3pV1HldC5je4cpe41dGKYCvF7qN++XQWs0uA7/qO25
         CqBDZ75PTpX+MiWYinPus8Q4yvP200/fYZgtX361IwUKPbwfeHHMPr3peKOb8CLN+EoX
         XikvtCL3rJGfxUgJL5nIeR0+4NPzCvfQcDUL4vetntQDc2eXdDxtEfi1D87Qu7C+ezAX
         Br1g==
X-Forwarded-Encrypted: i=1; AKwUvBy7jMr2mnNcpsi5u93g0yxYU5XigPbF/dHA+9dtSQ44NcHeea6qn1bBH4vQp+yd4rSFcDC/t9dwDcKi7m0=@vger.kernel.org
X-Gm-Message-State: APuU4Z++6gA183L3AL6Jm5Nebrv+nokTStEoFjFPpPICHkWaJjTnukwT
	k7duXIYtvfa8DAe1Mw3JMCdZOAZakMA0h2ydoRhPz+4pb3QjJYFDu+Xs
X-Gm-Gg: AYBFou0sQNKpwjfiFg1GPo+5g58KcVxEWmyCSdETEqe3NgjCWpl4VMhbqmi0Bge9+Q+
	w2AToxqw/1Y3m+QH18QAC3y2DWbO+/0l5o+HsETLIzzlooMrbWmn9o+cREvWjgVqoN0JByX47/l
	uUtIcfS/OLlVDlT8bKKezJxO4gULvs/iwBCVvMIL5m8VyQHDo6IJ4cVfUQwj/s6+U3mR+n1L4Ws
	98EUN0G2syzXZR6dbe6TtmmaFC3WP1Oal3AC3aXxLIvPPqWy+zJXIK8NNZOqGOt8iOFwzx0jRC/
	cangabtkPdbeUnI3ojNMCEomjJPcTqMv6M2B9BSykxOvkrdF0ceIKArurAkIl7W33w+mAEbAaGH
	niwUMsy3F3PqV0ZSTroIH3s7eKErmmgypqH4tYMBDAQwXi37xsGxx6Vx0807JefiDlarlNDsV0x
	gk5j82IcWm3NSI9Dl0nEim6dCdQRfEp/tv2evlWfj0HzHhRvY9WbAvbF+A8Z25tF+0QmYl9+5MO
	s7ygDDJEDS0fOmIpmffdyTaoXeZlTwcTgGIWn/6Rc4Hm6Rf9deIuV/ymCuLcwonVPifEyjUC+zL
	HQNR3XuUZ5M=
X-Received: by 2002:a05:6830:4c16:b0:7fa:ab72:9e01 with SMTP id 46e09a7af769-85f508d8e9cmr63578a34.25.1794088053214;
        Sat, 07 Nov 2026 13:47:33 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:b43e::1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4fb70ab1sm159512a34.14.2026.11.07.13.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:47:32 -0800 (PST)
From: Samuel Leyva <samuelslg03idk@gmail.com>
To: broonie@kernel.org
Cc: Vijendar.Mukunda@amd.com,
	venkataprasad.potturu@amd.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Samuel Leyva <samuelslg03idk@gmail.com>
Subject: [PATCH 2/2] ASoC: amd: acp: es83xx: Enable amplifiers after the codec output
Date: Sat,  7 Nov 2026 15:47:14 -0600
Message-ID: <20261107214714.11392-3-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107214714.11392-1-samuelslg03idk@gmail.com>
References: <20261107214714.11392-1-samuelslg03idk@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The speaker and headphone amplifier GPIOs are driven from SUPPLY
widgets. DAPM powers supplies before the rest of the path, so the
amplifiers are enabled while the ES8316 headphone driver and charge
pump are still powering up, which results in an audible pop every
time the output is powered on.

Move the GPIO handling to the Speaker and Headphone endpoint widgets,
which DAPM powers up last and powers down first, and give the codec
output a short time to settle before enabling the amplifier.

Tested on a Huawei MateBook D 14 (NBM-WXX9).

Signed-off-by: Samuel Leyva <samuelslg03idk@gmail.com>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index fb675774f..0a05f1f08 100644
--- a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
+++ b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
@@ -18,6 +18,7 @@
 #include <linux/input.h>
 #include <linux/io.h>
 #include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/string_choices.h>
 #include "../acp-mach.h"
@@ -60,6 +61,8 @@ static const struct snd_pcm_hw_constraint_list constraints_channels = {
 #define ES83xx_12288_KHZ_MCLK_FREQ   (48000 * 256)
 #define ES83xx_48_MHZ_MCLK_FREQ      (48000 * 1000)
 
+#define ES83XX_AMP_ON_DELAY_MS	50
+
 static int acp3x_es83xx_headphone_power_event(struct snd_soc_dapm_widget *w,
 					    struct snd_kcontrol *kcontrol, int event);
 static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
@@ -114,23 +117,15 @@ static struct snd_soc_jack_pin es83xx_jack_pins[] = {
 };
 
 static const struct snd_soc_dapm_widget acp3x_es83xx_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
-	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_SPK("Speaker", acp3x_es83xx_speaker_power_event),
+	SND_SOC_DAPM_HP("Headphone", acp3x_es83xx_headphone_power_event),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Internal Mic", NULL),
-
-	SND_SOC_DAPM_SUPPLY("Headphone Power", SND_SOC_NOPM, 0, 0,
-			    acp3x_es83xx_headphone_power_event,
-			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
-	SND_SOC_DAPM_SUPPLY("Speaker Power", SND_SOC_NOPM, 0, 0,
-			    acp3x_es83xx_speaker_power_event,
-			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
 };
 
 static const struct snd_soc_dapm_route acp3x_es83xx_audio_map[] = {
 	{"Headphone", NULL, "HPOL"},
 	{"Headphone", NULL, "HPOR"},
-	{"Headphone", NULL, "Headphone Power"},
 
 	/*
 	 * There is no separate speaker output instead the speakers are muxed to
@@ -138,7 +133,6 @@ static const struct snd_soc_dapm_route acp3x_es83xx_audio_map[] = {
 	 */
 	{"Speaker", NULL, "HPOL"},
 	{"Speaker", NULL, "HPOR"},
-	{"Speaker", NULL, "Speaker Power"},
 };
 
 
@@ -168,8 +162,11 @@ static int acp3x_es83xx_headphone_power_event(struct snd_soc_dapm_widget *w,
 	struct acp3x_es83xx_private *priv = get_mach_priv(card);
 
 	dev_dbg(priv->codec_dev, "headphone power event = %d\n", event);
-	if (SND_SOC_DAPM_EVENT_ON(event))
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Let the codec output settle before enabling the amplifier */
+		msleep(ES83XX_AMP_ON_DELAY_MS);
 		priv->headphone_on = true;
+	}
 	else
 		priv->headphone_on = false;
 
@@ -186,8 +183,11 @@ static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
 	struct acp3x_es83xx_private *priv = get_mach_priv(card);
 
 	dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
-	if (SND_SOC_DAPM_EVENT_ON(event))
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Let the codec output settle before enabling the amplifier */
+		msleep(ES83XX_AMP_ON_DELAY_MS);
 		priv->speaker_on = true;
+	}
 	else
 		priv->speaker_on = false;
 
-- 
2.56.0

