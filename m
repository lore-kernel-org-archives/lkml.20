Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794093789;
	b=5LRMCCWL7CgyfLwYbzgpQXREYLdZDoOiRgA044eOhsowlvlaZ4shQDYMc36h5siIiqev
	 Z+LEeef5kCH3jAaHiIydD1UioQW6p1ktKliIo3U9mrkv7cGsxqxxzkpZqVRFcjWrXOof3
	 sfVdoBAwsTwChDMgqSE8I62ESp7IuUHuPUnh1LlMZWjc/aqi7vRPJN7NbuSvTC3dKR8h4
	 JqMWuFYtPRxY+oydLWjz/VzcRDic7lNN8J5CZKkvVtDT6+8EWLMwp0FX89pkqJkZkVvSq
	 NoDcwwEusLW/2rLnvQCwjBXAHj1WnrnTATWmW3DjDo3cIXgMIGYEdPJs8OGnRHNF3VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794093789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=moLlKHwkdn7UQ53+LKg66hlQ5XXQ9TPFyz5LXsquMhc=;
	b=ebyV+nMGnHkN00roSIj+FVMh00DJ/AnUFXyRVg5mxA7OB+XhK45BbuxbpXEd9bdyPzgw
	 EoD26cwbclbKRWjzO3YU4HoUAqIl6ftOLYxwmCAji/CbSARCOqxfzxcWkp8tjCDmQs2Ea
	 +2GX3U+9gvqUEGcR/XzNzG8aTjObTbWLklwgoBbA4Xla4WMW0BWXsxGf4WxosoGeI5X/V
	 10ttzU4sZoYY5T4WuokEqFtd5HZHzlhCa9QG3/egimWSVvQwAgXDdYhBlsFo6asg43WMr
	 NcO2uZ2L+jaemPnDMgK4USW2pli92MLPp0IrUWaM3zbwC2rKycS4l/AVoK3pvld9mbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt7qzFlM;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAF5606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 23:23:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCAF5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gt7qzFlM
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7f84a55e31aso30276a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 15:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794093788; x=1794698588; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=moLlKHwkdn7UQ53+LKg66hlQ5XXQ9TPFyz5LXsquMhc=;
        b=gt7qzFlMpqoYZvEiX1Ybh8HkLCv49AvDKm3uDsTFbK1E0fHQFWlB3O4Q+eZeu+2Lpd
         uyoNawZvBIAeqwNm6tRgLHJlBLxoUomnV+BFRmgGhCxVImQUo90BBWGuAERxrwTy+YgR
         CsAIyka1dDQ4itmAXF1ZqPDU7J3/ERnNL6G+9uvL2lhI6exgrfOtUO7S2XwfT0m/1rAo
         ioSpV1NWFvDFrKZOY0Is+lZ4NTD4g0wQId8fBNVJSxdFTvw6Dreq+RW0oG/6IHlhkma+
         Xtg/ozAeL3dqovvHy2tsAZO0bM19XiEJf3yst2TatGWuTJbSOgkYCy39c/Yy+rfCTQE1
         aKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794093788; x=1794698588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=moLlKHwkdn7UQ53+LKg66hlQ5XXQ9TPFyz5LXsquMhc=;
        b=VXFQ4IyE2FFJ7oiourWT/YHTB3ve6lnZPSMj0FdfnVc5nxDCwGdNrZsHY/FaQeHhdw
         4NCNvh6TF+76QRbKpN2BT09fWrHtGjCvlX7Y8lPcURlK5jmXtsAC2ag3qwoYnu8AYiBl
         2n/G0QsGaMky5EgDgsWYR9tNtiVlfEQI5HK3e/1J+52C4umAjRgIWMgWprIE1m3zkRha
         SpABdu7lgBXLH6dm1/T1UXRTfdTfFMcfIwdffI0JwVfBGafUyK2Lw9oIj9N4CxG/8sQ4
         ots/lkNrPHvSoYQjfCpN6kwU6TMzFXYuija3yis6IquwheXWg52n0N739z6UpDx+AUDR
         qeug==
X-Forwarded-Encrypted: i=1; AKwUvBzWEosm5FJCh2yuiqO8eNqGesEnekaMkE6JB23eziRRyQELVYZHgAmD6bUiRB+fV8ID/HKtY3dtShpMcGs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vbi4EEowMP1y9l0fwP8xwNmoHPSrKg5TYbFMfMmfHsq3vp6rv
	31OJrCEn18xW4J9dv3zn7zz397vh/Gy9zPMgsQZb8UlLyNHwEcyVH9vF
X-Gm-Gg: AYBFou2yLv/Qau/6wW8LmYtwMpuUgnDo5TLPpGQvvldU3i6Zmwe4A3qDOLVsz67AGXz
	ks26M4AdSLx20Jd1Ntt3UX2tuWVNBOL+Vh7U0MYP7s/T8f1A65VzwtAftBznSNo9i05TkOosWvf
	Tno94OMnXHdCb4+nt4FdHQdlw6HmeZ5Cv12E8S6ryQ3XHYqnoqag8D4oKFRioVnfI0sPJ5bEBuF
	FnZeehW/pAg7XxrAp6W9AJNEWll9S1qoHz3Hf2ErVxaH5e51BDKky4xLv3uqEM7waxUynEfiYlu
	HVQJk3L7ceVYw/4/RD98eQgLh5sZGnrcVp0K/NsRb5JZbsV1Ig3eK/ps+UqlVITzywzjeItDHIu
	2OM3bVTjnnBARzgLTirDTPMZBwf9V0pH2eMCvkh8967WVniBaRTsctEZt422d3k39wUZ4HcS0Q6
	zNsEURcKLacBjU0+W9ZT8smLOvAuHmY3/m1oQVmYf2RUhwkBppS4Ka3PYf/rA38EzsbihvgY0YU
	GXBafl9yrcw5EgmpJQlo6Pq6KWNnjPKZJmGhBg3d1mSKHprJYPTxQQ3o6onlUvNsFiJM27T8wsM
	0ppwXTp9yPE=
X-Received: by 2002:a05:6830:270a:b0:81d:2120:d5bb with SMTP id 46e09a7af769-85f508a875amr183178a34.30.1794093787683;
        Sat, 07 Nov 2026 15:23:07 -0800 (PST)
Received: from huawei-d14 ([2806:104e:25:7de8::2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f4f2df8dfsm329315a34.0.2026.11.07.15.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 15:23:07 -0800 (PST)
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
Subject: [PATCH v2 2/2] ASoC: amd: acp: es83xx: Enable speaker amplifier after the codec output
Date: Sat,  7 Nov 2026 17:22:25 -0600
Message-ID: <20261107232225.3838-3-samuelslg03idk@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107232225.3838-1-samuelslg03idk@gmail.com>
References: <20261107232225.3838-1-samuelslg03idk@gmail.com>
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

The speaker amplifier GPIO is driven from a SUPPLY widget. DAPM powers
supplies before the rest of the path, so the amplifier is enabled while
the ES8316 headphone driver and charge pump, which also feed the
speakers, are still powering up. This results in an audible pop every
time the speaker output is powered on.

Move the speaker GPIO handling to the Speaker endpoint widget, which
DAPM powers up last and powers down first, and give the codec output a
short time to settle before enabling the amplifier.

The headphone path is left unchanged: the Headphone endpoint widget
shares its power-up rank with the codec output drivers, so moving it
would not guarantee the same ordering, and it could not be tested.

Fixes: 54fcd9dd44b2 ("ASoC: amd: acp: Add machine driver that enables sound for systems with a ES8336 codec")
Signed-off-by: Samuel Leyva <samuelslg03idk@gmail.com>
---
 sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c b/sound/soc/amd/acp/acp3x-es83xx/acp3x-es83xx.c
index fb675774f..66b0b3ffa 100644
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
@@ -114,7 +117,7 @@ static struct snd_soc_jack_pin es83xx_jack_pins[] = {
 };
 
 static const struct snd_soc_dapm_widget acp3x_es83xx_widgets[] = {
-	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_SPK("Speaker", acp3x_es83xx_speaker_power_event),
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 	SND_SOC_DAPM_MIC("Internal Mic", NULL),
@@ -122,9 +125,6 @@ static const struct snd_soc_dapm_widget acp3x_es83xx_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("Headphone Power", SND_SOC_NOPM, 0, 0,
 			    acp3x_es83xx_headphone_power_event,
 			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
-	SND_SOC_DAPM_SUPPLY("Speaker Power", SND_SOC_NOPM, 0, 0,
-			    acp3x_es83xx_speaker_power_event,
-			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
 };
 
 static const struct snd_soc_dapm_route acp3x_es83xx_audio_map[] = {
@@ -138,7 +138,6 @@ static const struct snd_soc_dapm_route acp3x_es83xx_audio_map[] = {
 	 */
 	{"Speaker", NULL, "HPOL"},
 	{"Speaker", NULL, "HPOR"},
-	{"Speaker", NULL, "Speaker Power"},
 };
 
 
@@ -186,10 +185,13 @@ static int acp3x_es83xx_speaker_power_event(struct snd_soc_dapm_widget *w,
 	struct acp3x_es83xx_private *priv = get_mach_priv(card);
 
 	dev_dbg(priv->codec_dev, "speaker power event: %d\n", event);
-	if (SND_SOC_DAPM_EVENT_ON(event))
+	if (SND_SOC_DAPM_EVENT_ON(event)) {
+		/* Let the codec output settle before enabling the amplifier */
+		msleep(ES83XX_AMP_ON_DELAY_MS);
 		priv->speaker_on = true;
-	else
+	} else {
 		priv->speaker_on = false;
+	}
 
 	gpiod_set_value_cansleep(priv->gpio_speakers, priv->speaker_on);
 	gpiod_set_value_cansleep(priv->gpio_headphone, priv->headphone_on);
-- 
2.56.0

