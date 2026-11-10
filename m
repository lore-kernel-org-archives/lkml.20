Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287296;
	b=fiXxXndekybQFs128DzmRlE8J1ad3fXv9n6cUi1uxugL1nVwxtAJev2R3AgMH4h39KpF
	 QvXqfs9lpWthpJjqYVG81L7VwIV4poSbatMXicIJq+9xwwYFG/EKgG3iZUEL2fBttSVcf
	 E+ynBn5kjAM+72Ba+WfV/rnRL65vTFK7eQmDy6RMuk25CIBZS12Lx99YtpEEoOwlfxKRt
	 viGWjqtV8223nfVMHmjSg5HlDH4qHOmDDvOJOdvbegE9AHZVFkI1FwL7KnIAvte6mFprN
	 9ami5+tBMtZM0wuFJwz2VimsC3Bt/FEeAqudfr5kf7a1m1zb/9/VRO4+m2IffMaO5cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uqjEjkaxes0qicdPDD9LDyvBW4T968M1FfYrP68rAAE=;
	b=vXkltQauWgWco00jpbj4atlu3CGO2poa/X8F/WRIt4TqmVdp2ljMn/VCVzvvvW9mggx4
	 LL7VESKfmtoDCO02obwJRP3F90jj5ucSdkF0M1cQ4B2pD/96xMEu1GWMiK5l+CiF3TY08
	 E6PGRCRoaaPUiJx/iOUAzW7hhXxw+6GtJBh+S+50UMuEFjjFEkWWDymGx+hPUMyEzXIy7
	 /NumBopPtIxJ87UhiGwmCXMBodSwiNWOlzKOvJA8j4QrP11WdmUWdSz2eAGx6Ludf3I9q
	 WVkjU6x/CsEY+Pm1qho8fJf25LKOzxxqdl7Y/KAPwPmM/7PqnoIcyRnsGykj5uAZ0jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM2jeGhl;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CE9606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CE9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM2jeGhl
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91e9309f171so14348416d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 21:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794287295; x=1794892095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqjEjkaxes0qicdPDD9LDyvBW4T968M1FfYrP68rAAE=;
        b=LM2jeGhly9EsTrZhPdy9KYDsv7PKM1mEJcgHQAmE8psDhCbkRIYe+q8dXoEoaZV0Wd
         YOkB4gEHGfwYa8wGjFmKQrcnVeetXxHPJO0kbq0e6rLl8DTcgcs0mv1dXkxP40XFtYML
         ux9LEU2Iml+vGvU7ITB7dJMl6Bz9ks2Fa4cBtCCSOpx4Yiwu9VyxF2h9Loy8aiAI5egY
         HNGjvk1W3qFCVijBP+VcrCHkKOf+1RVZKmDm9HlGuxbU/xbsG24DHYtkRIZt3rv6MXyD
         baWqKMVU+5yCdjReo0Ju3TLshoEMT6ZREpoHogh8QL8Afpe+8KLBZtlkTmu7TEDp9aCc
         h6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287295; x=1794892095;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqjEjkaxes0qicdPDD9LDyvBW4T968M1FfYrP68rAAE=;
        b=nIllGbVmuVk1Or6yPtNs2TCxXu4RWvB4YAjcOKDGr8DiPIL/6z8suaYnPO9VpAUOzz
         WjPe/xBdKiWzKonwXzSunT/s5tqDC1MT4T9YNFmsrM8KdTehmD/nnOLXevAbOr98MfGH
         9RwVC1K8ONysBtMFhQRawkRLQV8AONkHtOu47xSPdLQP+JZV/UWOJtLOLV+kgqvOnfrb
         n6aoXK870b4Bm7j5BpMckcGruYCpx038jZ6r7/h4UzkIH6C6pDrWod6UuF8D4z9bJM+i
         L2mtKWSCcgwKAiMslv1qAz8S+YlndgBni6/y+Y3T3t/BMowONEIKBLhee8uaVs5yBMGT
         DsUA==
X-Forwarded-Encrypted: i=1; AL+hErEy2Na3eJWh82jUxxQo9smOw3pMm8UOJY9WcTdg4hgWc5GHrjJxNrgZ/o4enVB186ZSHEAoNQZ/ZSodRaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oKwVDHlhYAEv5CKs/ka5D19fPV9rKaMl0u1kZk6Dfi5enXrZ2
	KItNfP7usWK4yQXXw1i8nVDQRLgIl7jypfr17dli7786nurDeyxWlI4=
X-Gm-Gg: AYBFou0sTyJJGTfMkL6OfQ3z7iJ4FWqhtNBVFScrnCryzS/euVcZU/o+22T13uB1xcB
	Zh/vTzzDtSlMPF4SHDIYEBijb8SAqLvxRbyFrnehCDKdRizJJkO3wf46Vv1z5uW8+A3gCXlZKYA
	h/oWD5D/3HPRwYFvNpf74mDheofeV/KFDb1wZQITGeyWnN6LyVKkGY78sGjFXU6dXlkplt5VAfl
	dVtV2ehyXS1M+GEFsvkvMXsXDnyAXoFz5U4a5RzwTkPIWk7B6nQcBfxgi1l/n//AmmIg9gNgK/P
	95NOSen0E3Zshzox0j4J/cpK8AfnihCbAxpHsRcY8EODmdmt/qH2KF5X+Aah9Z7quxcjG+AcIUu
	C2cHLGGra6jV5E4O8jLla1kqhPKPaQoy6rgOrQ3Fz3EIAvO0uOFqdOaMNhBcePw3+d7H1ySYlSL
	UF6Hdpkqfz8DEg/BFvGbW4LoVykKpjNTNgOPpOHIR3bAUtVc6/eAlk9xV8eRTAppqEhA52ut3mT
	XF3cpkH7a+2EXcPVft+0gDpD5s8pE+F0WOOh5QEuazaC/IXxuekMRuKbdnw5TlbfO7icu/Cgec1
	+ickN8OwrDuGWiIsmQPXAwQElZNSK1sRCDSdJEvSsOVSVIIBHAtq5PB+Igy4DGbsqrcYZ8HrfQM
	BVIuvdt0lwTRYaJR1YN+1Z1ySzGM/ObBk1LK09kjYihXTTy6D7Wcu6ogNt5SM5+kRwOay9rUb1y
	SmfFhCMZ16cA==
X-Received: by 2002:a05:6214:2b85:b0:91c:60e8:a8ab with SMTP id 6a1803df08f44-91eef81bda5mr29310036d6.37.1794287295004;
        Mon, 09 Nov 2026 21:08:15 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0547744sm12648546d6.44.2026.11.09.21.08.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 21:08:14 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6] ASoC: wm8962: stop microphone work before component removal
Date: Tue, 10 Nov 2026 00:08:12 -0500
Message-ID: <20261110-wm8962-v6-c78c17edd171@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The I2C-owned IRQ outlives the codec component. Cancelling mic_work during
component removal leaves its producer running, so another microphone event
can queue work for the old component and jack.

Mask microphone sources, synchronize the IRQ and drain mic_work before
changing the jack pointer, regardless of whether a jack was registered.
Disable microphone detection during cleanup only while holding an active
runtime-PM reference, because its control register is volatile. Keep
unrelated IRQ events available.

Run this cleanup unconditionally from codec removal and drop Tegra's late
card remove callback, which runs after component and PCM runtime teardown.

Fixes: 0512615db6db ("ASoC: wm8962: Convert interrupt handler to direct regmap usage")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v6:
- Mask microphone IRQs and drain the IRQ/work path even with no old jack.
- Run codec cleanup unconditionally from component removal.
- Retain the active runtime-PM guard and Tegra callback removal.

 sound/soc/codecs/wm8962.c      |   34 +++++++++++++++++++---------------
 sound/soc/tegra/tegra_wm8962.c |   13 -------------
 2 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3248,21 +3248,27 @@
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	int irq_mask, enable;
+	int mic_irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;
+
+	snd_soc_component_update_bits(component, WM8962_INTERRUPT_STATUS_2_MASK,
+				      mic_irq_mask, mic_irq_mask);
+	if (pm_runtime_get_if_active(component->dev) > 0) {
+		snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
+					      WM8962_MICDET_ENA, 0);
+		pm_runtime_put(component->dev);
+	}
+	if (wm8962->irq)
+		synchronize_irq(wm8962->irq);
+	cancel_delayed_work_sync(&wm8962->mic_work);
 
 	wm8962->jack = jack;
 	if (jack) {
-		irq_mask = 0;
-		enable = WM8962_MICDET_ENA;
-	} else {
-		irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;
-		enable = 0;
-	}
-
-	snd_soc_component_update_bits(component, WM8962_INTERRUPT_STATUS_2_MASK,
-			    WM8962_MICD_EINT | WM8962_MICSCD_EINT, irq_mask);
-	snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
-			    WM8962_MICDET_ENA, enable);
+		snd_soc_component_update_bits(component,
+					      WM8962_INTERRUPT_STATUS_2_MASK,
+					      mic_irq_mask, 0);
+		snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
+					      WM8962_MICDET_ENA, WM8962_MICDET_ENA);
+	}
 
 	/* Send an initial empty report */
 	snd_soc_jack_report(wm8962->jack, 0,
@@ -3592,9 +3598,7 @@
 
 static void wm8962_remove(struct snd_soc_component *component)
 {
-	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
-
-	cancel_delayed_work_sync(&wm8962->mic_work);
+	wm8962_mic_detect(component, NULL);
 
 	wm8962_free_gpio(component);
 	wm8962_free_beep(component);
diff --git a/sound/soc/tegra/tegra_wm8962.c b/sound/soc/tegra/tegra_wm8962.c
--- a/sound/soc/tegra/tegra_wm8962.c
+++ b/sound/soc/tegra/tegra_wm8962.c
@@ -97,18 +97,6 @@
 	return 0;
 }
 
-static int tegra_wm8962_remove(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link = &card->dai_link[0];
-	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-
-	snd_soc_component_set_jack(component, NULL, NULL);
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(wm8962_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
@@ -129,7 +117,6 @@
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8962_dai,
 	.num_links = 1,
-	.remove = tegra_wm8962_remove,
 	.fully_routed = true,
 };
 
