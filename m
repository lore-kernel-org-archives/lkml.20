Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713179;
	b=km/bcII03BhpyKs06Y5+pjw/YnCgwnu0HRw493YqgBMAPoB3bsbqCu9EnzVR1t7KNQmN
	 88fgtFQN+lfMiZti8wjpXxQXXT5lfnBPX6BuOS5C/msXS3FFp9tre4Vwk+1imp3AHaARf
	 mEc/X/Ba181futhQuwJyRFGst74Wc1Kkd7qgB26U6qUX7LEghfjwX1SMCRTrVLnS0RWbT
	 xtmxDlZBpG3bxj50AYybHJ5UWZvgiyuEZUGeIGMDzadTKPdtIKjj52qr46cinq1fNU+8/
	 nHVcUeIG6FCxATtMWj3CDpgcd08dLgPExxYQHx5IOFmGnv/neit/1iOK8KGcO7ZRunQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
	b=fcKSP7pPRcJoJfnQvthoF9M71pG8S/Z4TELM3UXPBhM09cNJFMoyp68HEIR0k/M1KSzM
	 gVeGPKl6z5cJqHcdMzuolQ3exAw1uJNIW2/pJv+4Cgo/5KwACytL//vs+OtH1tFjD6tR6
	 PmY+g1qXVph07ZO+AUTyDe8B9tQre/96Q/nwuDTWBKDYbvHe5pOVECxni+45YwH/u6JBk
	 NCKxz9M9WC5GrKSmKlHl85lqftcIk4VNaN0jBjXLTEl/35UdCrmvI1vY/xtORzBLBI8gy
	 VtF9+hmeYlcx2PXvNqbA12V5q2EqDNCCFainS6JWa9hhECM0Q7o0+MDqY9LaFajxrTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCXvPlcq;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CBC606A333
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92CBC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MCXvPlcq
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so31663995e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793713177; x=1794317977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=MCXvPlcqdVs7tTpKypMadM0mmxEQaagyVJ/B+2LiOkKeFDrHSiXXO2Mb0CD9yzFBMk
         76PpMH3k45jbVFkZow4UasPjMK31Q4IScz85juHliolZdaW3KpLFTXGtCgDO9k78Q7Xy
         Aa+jw/50DXZ7HsmfstIAvPAYZjooV112Tc2IeAHYQZ33E3qdVTGXgrayRPxiDad49DwZ
         OebleavsRlHAuVH1mGTsB4FH3SdtXmN5SygEFibHQS1P2R/MzDuoWSX3RcdhjDqgPwuf
         bfA3HdEaTNTCBPashow2hlvVhw8G/cHSUnA6o7wrBeOrrTQFgLpACDo+JYYYC4Sw8+rb
         sOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713177; x=1794317977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XG0hirTIOU4ZJDEKh5lv1WUM1lIXvG44FvkqV/nZoA4=;
        b=JHrcWKFPALpyNdlJUDyLqeRswEPhNOfjke5iJaq+i9sSbis77wVFGDGF2DJPdmGkIV
         7MOty88qCPWQq8Sh9V8hMaOln8z/T1eO5UPVxbuQVmawLE7DOylA90mCAdYVlJk7b6yg
         lUlFKFjvW3nZJkYUi8yy4lvk+Bs/MGhLzqX7hgFMZCEtIxLQ9x86XtCpLvxM5asotQqB
         PoIcP7nGMC+T7QS503UBUFcfeu0e5I0t5gdq1rC5j/H7+ekSD/HjXcxbEZww9AgOXjcd
         RzPggXBFK6hRa/lvBgxOV316qJ3unZ5gXJ1rxcrT+iF6R9UuBtsOUtDTTr9e+CN6Kb2q
         pl+g==
X-Forwarded-Encrypted: i=1; AKwUvBxdQT1cNu96RwGO1X4ssEh4bqTlq6C/ZPgm1c1fbP//ymWgUGeV3uh/E1jOMfc068skJSWUEJpuGgEK2t8=@vger.kernel.org
X-Gm-Message-State: APuU4Z91Oe0ZB0pDuRMq6Ap7V82q/Wkacaiz2VHNYhgUTWU5j+qVXwWv
	BCgauZm4MDrZ3br0itwMR2a+nNLurEamU8bzFh6j3rNjebtyduzc08Da
X-Gm-Gg: AYBFou22gsnK073QdMr7ulD1o2i11eq8PyxI8ieAlJHgQRjZvDxPsJNI5m+7b9ZE7Cx
	PUnCnmdXeU+G4wuHStvxauPLIHRTDw34VyEjv2E+FXltFi0K5UK3XeWUKiToPpvkMz3HVzySxL9
	GVe2Qu4Y2P6HHcDJK3c6IgV53y/QddMxv2UDBF51tTkng4n3NInesDojmnPRGyeBCOrv7g1qh4i
	MwkpLZSW4msFad6WTTNyNduXVMhNBQvtVa+KMVwv4UBUD3MGHhQT+jugMDQMKu28QOx91ZEznIB
	EAQNtjf3Tha3PqQxv9sAqpm/X1kEbaZ8QgjZEuCC3T6t9hWlLS2RhGxHQ73ajcXm+rVl0pdG+7J
	8F2HW1SPVcsX3SE9tC3gQD/0IhX+7ZiFlw17bLvP7nbI69VfdDrmSJZGdE5oPYuhGlH9C5CnfXK
	6AE1uoy+jhHot8kZ0BnGSm4xssB2cd9dRfMoMmdzud4/0lUNNUYObmLGqYx6wn5BpjQMHvuvajW
	eThxeMOAD6TdZib86xyGw8aC+a8PjPXW+i+EmmkQAq9LBwi7p01rgHV3RVH+O7XNPKV10kXMw0T
	Sl2RRL+QDDlkySOnVg0SHm8GM0zLEgsUUHWx+eHF4nHWNavSz9AqKI8Evbu4/ZiPaPL2OTZVhTS
	rnqRHhFFc+d/AGaljFxEQbFN+0nXMmSIQDT1j5vEXOaZqAg==
X-Received: by 2002:a05:600c:848c:b0:4a6:42cc:bf65 with SMTP id 5b1f17b1804b1-4ac1709b206mr319276755e9.17.1793713176492;
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:14ec:7986:30c8:6bc6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a1dsm24174999f8f.24.2026.11.03.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:39:36 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] ASoC: sun8i-codec-analog: Add the headphone inversion control
Date: Tue,  3 Nov 2026 14:39:35 +0100
Message-ID: <20261103133935.2892210-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Bits 1 and 0 of PAEN_HP_CTRL (analog register 0x07; LTRNMUTE, RTLNMUTE)
feed the inverted left output to the right one and the inverted right
output to the left one ("Left HPOUT Negative To Right HPOUT Mute" and
the reverse in the A23 and A33 user manuals and the V3s datasheet; 0 =
mute, the reset value). The driver defines them but nothing can set
them.

They are needed when a mono speaker amplifier is bridged across HPL and
HPR, as on the PocketGo S30 (A33): with the same signal on both outputs
the speaker gets almost nothing. With a mono mix on both DACs and the
inverted left added to the right output, HPL - HPR carries the signal.

Expose them as one enum, "Off", "Left to Right" or "Right to Left", so
that the two outputs are never fed with each other at the same time. It
defaults to "Off" (both muted), so nothing changes for existing boards.

Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig) and arm64
  (defconfig), SND_SUN8I_CODEC_ANALOG=m, no warnings. On a PocketGo S30
  (A33, mono speaker amplifier bridged across HPL and HPR), first with
  the bits written by hand while a 600 Hz tone played (same tone on both
  channels, AIF1 DA0 route "Mix Mono"): with PAEN_HP_CTRL = 0xf4 (HPCOM
  driven, no inversion) the speaker is much quieter than with 0xf6
  (bit 1 set) or 0xf5 (bit 0 set, the other output muted).
  Then on 7.3.1 with this patch, same tone through PipeWire: "Headphone
  Inversion Playback Route" = "Left to Right" sets bit 1 (0xf4 -> 0xf6)
  and the speaker is clearly louder than with "Off"; "Right to Left"
  sets bit 0 (0xf5).
- The A23 shares this code path; its user manual (v1.0, PAEN_HP_CTRL)
  documents the same two bits, with the same names and reset value.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to get the PocketGo S30 speaker working. It ran the register
  tests above while I listened, found the two unused bits in the A33
  manual and drafted the change and the message. I reviewed and
  understand the change and tested it as described above.

 sound/soc/sunxi/sun8i-codec-analog.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index 3335855c6311..7188b498fb08 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -314,6 +314,25 @@ static const struct snd_soc_dapm_route sun8i_codec_mixer_routes[] = {
 
 /* headphone specific controls, widgets, and routes */
 static const DECLARE_TLV_DB_SCALE(sun8i_codec_hp_vol_scale, -6300, 100, 1);
+
+/* For a speaker bridged across HPL and HPR: one direction at a time */
+static const char * const sun8i_codec_hp_inv_enum_text[] = {
+	"Off", "Left to Right", "Right to Left",
+};
+
+static const unsigned int sun8i_codec_hp_inv_enum_values[] = {
+	0,
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE),
+	BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(sun8i_codec_hp_inv_enum,
+				  SUN8I_ADDA_PAEN_HP_CTRL, 0,
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_LTRNMUTE) |
+				  BIT(SUN8I_ADDA_PAEN_HP_CTRL_RTLNMUTE),
+				  sun8i_codec_hp_inv_enum_text,
+				  sun8i_codec_hp_inv_enum_values);
+
 static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 	SOC_SINGLE_TLV("Headphone Playback Volume",
 		       SUN8I_ADDA_HP_VOLC,
@@ -323,6 +342,8 @@ static const struct snd_kcontrol_new sun8i_codec_headphone_controls[] = {
 		   SUN8I_ADDA_DAC_PA_SRC,
 		   SUN8I_ADDA_DAC_PA_SRC_LHPPAMUTE,
 		   SUN8I_ADDA_DAC_PA_SRC_RHPPAMUTE, 1, 0),
+	SOC_ENUM("Headphone Inversion Playback Route",
+		 sun8i_codec_hp_inv_enum),
 };
 
 static const char * const sun8i_codec_hp_src_enum_text[] = {

base-commit: aae83f3931bc3a5497bcc8351b5f954ad7ac895c
-- 
2.43.0

