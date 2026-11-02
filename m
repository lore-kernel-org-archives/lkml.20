Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660246;
	b=2TIndhAKZFPV9DFM3gkZcAd4181/UZKYFnwciAH0d6qMLyo0ncw0zOoWoM+auSr16TeE
	 POk07GSP5Y98dGQRbnCcWxLMuN4DuMPc+DS71tzEfXN2lDhNBqZKgPOCB3Cma3ba8YuU/
	 3aJFC8ixsPRY+UEtw4+kxV5GNLOkTfaVy7M5lv8LGLmvD09M9Q52YwTznk7lTH3DnZWQW
	 BAFVHcZmDAl353aAy0qTBRBRUpqz9tcUimio09Kmp4oLO7j0S6OE0kH9bDgllXZV0xsaJ
	 Vz9ZEfxdlhivANTxwS0VTht9p4k9JmPYEERjG5MBRXYsCTnSDziu1NBX7oSCfI+dcTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ehloXEJ0Qoh+w2FzLa78Fer7qun1eUOwSzteJlwSAOc=;
	b=jXlu0u2X3sUTII+VA3G59gi8n2T1w6XbW1/Ajg7o1gowJW+8pXjqMQIj0STCBLAMNuYz
	 F5nKhb/0Oji0/7bpWvh0So2YlqMPMwmFjqfaZkdMxzTDuofis1vUjLgNWy4AgaPgVDQYX
	 Ym/bCR53i4OC/Cw5iEHFF4wF1/0zSA4rj4+yyDMpvGycgXXFyvWwcyQXoMWx3Uj8FH2tN
	 s5W8iGspZi2P/6Rg0hh1ogL0RtrxTGEv/6rophcCscBCAIe0UFdqgMDaONXVibKaNBRS9
	 A6XxvOz2FI20Xgp/FYDpMp8ADcGYN8WPE/pZSykdb0lLuYujSEOdaXojL113jGWrOkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gexdigital.net;
	spf=none smtp.mailfrom=gexdigital.net;
	dkim=pass header.d=gexdigital-net.20260707.gappssmtp.com header.i=@gexdigital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="g3eNE/OC";
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B84F606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B84F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gexdigital.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=gexdigital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gexdigital-net.20260707.gappssmtp.com header.i=@gexdigital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=g3eNE/OC
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-563a0462094so1992315b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gexdigital-net.20260707.gappssmtp.com; s=20260707; t=1793660245; x=1794265045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ehloXEJ0Qoh+w2FzLa78Fer7qun1eUOwSzteJlwSAOc=;
        b=g3eNE/OCzfuAHnvIt5Ry8mWaAJOlvsHmB4hFIab5F+k0kpIoJ2AqjqQyhksnm4U+tC
         1FT5xOPD6ivTBI7TKxuEyN0rQc4fB+mJtFGu95WJav4iEYvi4cT7cH337XSb/qgTg/a2
         ETPySw/70O2Iy037O50e3ylDffYzf47GWPiXrth7eT4Wb2dJ5EMjI7loBJ8jhWaVga7+
         OoF3xqWNjsV82Ba9aYH7KKsWa3/kV4coyv1jhR2HOyi0Li8jUDuGGEJhv0B0su3+E8B/
         30A1t6ms38BWSJEEPEfnMXnKyTmNzKBt2QjCNi5JRkSU+wZ2X5bOvNTYo7jUeR7V/fcU
         RjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793660245; x=1794265045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehloXEJ0Qoh+w2FzLa78Fer7qun1eUOwSzteJlwSAOc=;
        b=VK3drTeJjoOfLTVtP0K74o8/VK0CCtIrVLWv+Cqdy/ijDFYf0MFZuXPWxZW4rgdFOK
         MORyKyG71IDvBSILfm+Pm2J45dGbjwxA7XiM9UnstvXIAN/WKZouwLfE7iu24DTMnZeg
         OhDO64nc2QwEmbTp9C9ksceXhAQz4Sb0PKVyaNYFc7TvhcYLJKAtyhtidoNkIbIVaoy9
         UjV2ISHsCRDh7JfaCT03d6MrisVL2SgSLypA+sSHaKzxYMkJFulwsq9WCJ/BirqFVMFu
         /1sty8Q2FaB09/BN2XmR31j8q3xZBahy13hcvGspSX8xTEn2kIFruGeUQrcNiMnJb5o7
         VDZw==
X-Forwarded-Encrypted: i=1; AKwUvBzYcbtIGBTqSwgYP2nTGa3r9HWbTPq6JrbxtBAtW4M+kwFy8TCc4f4cCzyf0mv0+vk/c4tq53FX2l53tpg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7lWQKvWHLwvPAbEqswFvdK7/B7nBFdep1R0aZdEJZTMEQk3DC
	Uz2qJ+ygshVTBkVaaBawW4HRk2aMMel+1LwZ7EG40q3A0VVDZ61KVl/VaMwOoMMKkd+wyNqEuKS
	CF8/9HKWB8qFA
X-Gm-Gg: AYBFou0kqGAviDM0X1be7oILhf27nvzA0CC2vvLW6PiHXHi7SrJAn+IwrqOTQYLG6P6
	YhlegvBrAUoY9YjGjFqcOId592PkxMrn6xtTrkp4y44dgdiVguOboDVWLDLAxK1D2LEg8sPp3LM
	KwNrkQI4A4tSQHqd/fjpQDOTegHrIlcPhz72racUE3BhIWg7dkyerF0u3AnED+f4Y2ZLPU9dw2+
	kncUa5BCaM84gemC0Vg4CZN1M5rVRm2xZutgvARowZwGVhrKb6Gbrt/ELoP8t3/k49j3qCPwxch
	t9+qN9llh5z7HUjvH/rQRsXANKzKInpA07Cuh/TLGeV/sJfC7peFZ95ramEc86Wrk4CzMZs1Xdf
	F65P0MLzTnsnn2ifV/XSbSuUQlNYLoDA/B/l8v6tmgGjITz2tAnKrGLfzczfRuy6JUTperCVx1s
	fLpIajs4uNqsGsi218DFXrxx5bGtS7eLkQz6QrmlQ1fQQLvAZ+DaF1O7KPNn0xY8EsdSbrU9YJW
	JCY+9FHVklYTV5pwisH0duurTSd2QUQOA1Vx6boENAFexcEDi79hbqqm6eW9jRbvPiq6ufp4Cl5
	Y2YGKOg1aGg/G/Y=
X-Received: by 2002:a05:6808:13c9:b0:4f6:5279:5c89 with SMTP id 5614622812f47-5640de30ddamr7627805b6e.47.1793660244993;
        Mon, 02 Nov 2026 14:57:24 -0800 (PST)
Received: from localhost ([177.225.211.4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a9218ef39csm7415540fac.6.2026.11.02.14.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:57:24 -0800 (PST)
From: Rafael Medina <rafael@gexdigital.net>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Devin Christensen <dchristensen8@proton.me>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/ca0132: Restore AE-5 audio registers after LED strip send
Date: Mon,  2 Nov 2026 16:57:23 -0600
Message-ID: <20261102225723.123266-1-rafael@gexdigital.net>
X-Mailer: git-send-email 2.56.0
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


The AE-5 LED strip transport added by commit c3e35f355fad ("ALSA:
hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support")
reprograms the CA0113 audio serializer block in BAR2 to clock out the
WS2812 data, and at the end clears only the stream routing register.
The format and channel enable register at 0x100 is left at 0x3000ff8f
instead of the 0x00000700 it reads after a normal codec init, and the
analog outputs stay silent until the codec is initialised again.

The strip control is marked volatile, but alsactl still stores it, and
the udev rule runs "alsactl restore" for every card probe. The saved
state of a card that never had a strip attached contains "AE-5 LED
Strip" and "AE-5 LED Strip Count" with access "read write volatile".
ae5_strip_ctl_put() sent a frame even when the colors were unchanged,
so every boot of an AE-5 or AE-5 Plus ended with a silent card.

Save the registers that the transmit touches before programming them
and write them back at the end of ae5_strip_send_frame(), and do not
transmit from ae5_strip_ctl_put() when the colors did not change.

Fixes: c3e35f355fad ("ALSA: hda/ca0132: Add Sound BlasterX AE-5 external RGB LED strip support")
Cc: Devin Christensen <dchristensen8@proton.me>
Signed-off-by: Rafael Medina <rafael@gexdigital.net>
---
Tested on a Sound BlasterX AE-5 Plus (1102:0012, subsystem 1102:0191)
with v7.4-rc1:

 - Stock: after boot BAR2 0x100 reads 0x3000ff8f and there is no audio.
   Re-probing the card with the saved alsa state file moved aside gives
   0x00000700 and working audio.
 - Patched: BAR2 0x100 stays at 0x00000700 after "alsactl restore" and
   after writing a non-zero color to "AE-5 LED Strip", and audio works
   at boot.

No external LED strip is connected to the card, so I could not check the
strip output itself. The control write completed without error and the
audio registers were intact afterwards.

I did not try to find which of the restored registers is the one that
silences the outputs, so all of them are put back.

 sound/hda/codecs/ca0132.c | 43 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index 896091c11..b3e768be8 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -8416,6 +8416,10 @@ static int ae5_strip_send_frame(struct hda_codec *codec, const u32 *grb_colors,
 	struct hdac_stream *hstr = NULL;
 	unsigned int format, stream_tag;
 	u32 enc_words[4];
+	struct {
+		u32 r100, r104, r400, r408, r40c, r410, rc04;
+		u32 ser_base[4], ser_clk[4], ser_out[4];
+	} saved;
 	__le32 *dst;
 	int word_idx = 0;
 	int frame_words;
@@ -8501,6 +8505,24 @@ static int ae5_strip_send_frame(struct hda_codec *codec, const u32 *grb_colors,
 	/* Ensure DMA buffer writes are committed before triggering the HDA stream */
 	wmb();
 
+	/*
+	 * Save every BAR2 register the strip transport reprograms, so that the
+	 * audio serializer/clock/routing setup done at codec init can be put
+	 * back afterwards. Leaving them modified silences the analog outputs.
+	 */
+	saved.r100 = readl(spec->mem_base + 0x100);
+	saved.r104 = readl(spec->mem_base + 0x104);
+	saved.r400 = readl(spec->mem_base + 0x400);
+	saved.r408 = readl(spec->mem_base + 0x408);
+	saved.r40c = readl(spec->mem_base + 0x40c);
+	saved.r410 = readl(spec->mem_base + 0x410);
+	saved.rc04 = readl(spec->mem_base + 0xc04);
+	for (i = 0; i < 4; i++) {
+		saved.ser_base[i] = readl(CA0113_SERIALIZER_BASE(spec, i));
+		saved.ser_clk[i] = readl(CA0113_SERIALIZER_CLK(spec, i));
+		saved.ser_out[i] = readl(CA0113_SERIALIZER_OUT(spec, i));
+	}
+
 	/* 2. Configure CA0113 BAR2 hardware registers */
 	/* Power up clocks (CtxHdb 0x141b7 / 0x14210) */
 	writel(readl(spec->mem_base + 0xc04) | 0x7, spec->mem_base + 0xc04);
@@ -8559,8 +8581,19 @@ static int ae5_strip_send_frame(struct hda_codec *codec, const u32 *grb_colors,
 	snd_hdac_dsp_trigger(hstr, false);
 	codec_dbg(codec, "AE5 strip: trigger complete\n");
 
-	/* Teardown: clear 0x104 pin mux back to 0 */
-	writel(0x00000000, spec->mem_base + 0x104);
+	/* Teardown: put back the registers exactly as the audio path left them */
+	writel(saved.r104, spec->mem_base + 0x104);
+	for (i = 0; i < 4; i++) {
+		writel(saved.ser_out[i], CA0113_SERIALIZER_OUT(spec, i));
+		writel(saved.ser_clk[i], CA0113_SERIALIZER_CLK(spec, i));
+		writel(saved.ser_base[i], CA0113_SERIALIZER_BASE(spec, i));
+	}
+	writel(saved.r100, spec->mem_base + 0x100);
+	writel(saved.r410, spec->mem_base + 0x410);
+	writel(saved.r40c, spec->mem_base + 0x40c);
+	writel(saved.r408, spec->mem_base + 0x408);
+	writel(saved.r400, spec->mem_base + 0x400);
+	writel(saved.rc04, spec->mem_base + 0xc04);
 
 	snd_hdac_dsp_cleanup(hstr, &dmab);
 	scoped_guard(spinlock_irq, &bus->reg_lock)
@@ -8613,6 +8646,12 @@ static int ae5_strip_ctl_put(struct snd_kcontrol *kcontrol,
 	}
 	change = memcmp(spec->ae5_strip_cur_colors, colors,
 			sizeof(spec->ae5_strip_cur_colors)) != 0;
+	/*
+	 * alsactl restores this control at every card probe with the saved
+	 * values; do not run the whole transmit routine when nothing changed.
+	 */
+	if (!change)
+		return 0;
 	num_leds = spec->ae5_strip_cur_num_leds;
 	ret = ae5_strip_send_frame(codec, colors, num_leds);
 	if (ret < 0)
-- 
2.56.0

