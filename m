Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793417001;
	b=hiLOQ+wCBuMLMU1y8sIDGtihjUb419Qv6WmjFnPRAbpB4A8bNFl/gzTeNbcBo1kK/sFL
	 +2Zob1PsIM6psW4MftbN4bIllLdK591ByAr27SJcedXhfIo1FqtFM94jsVcsWmSjcIUhd
	 CEeem9pZ5TrLCqc1b/cvX/CW1h8fORh4JrzgvtafC6oM9MEwgexrZ37BLmzdIUiXPqk+P
	 4/QmHF8ZkwJ4ZnTD3HZosvADXZAn3wiGowE+HS7EffU/5vEKU90kXux9iHGWWYBWMrWFr
	 DUVRJJeRXmyfJHZyVLT0moHL5nBJyYBxDCaep4wB/WIKoSbf1uWCkSiHmPm4Wq1K6Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793417001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4wOVj5BkuVqeNk0QZ1pVDwZxFHvve0w3swvsjOEFbZg=;
	b=D561CBljUe0rJbW17luLntZCvcOhDMkJDiHUIJIhDlJeG219OJKSPDaequ/xECvFBEQG
	 hvh1X4w8eoInjuK4urSUZ5qpI6wF5yQbIQZC/SKbWw40+jD3RccEiq8RrIfp7kKGLhjKf
	 Iu+CHnIBmBAsdQxVQQni0DOWPPa8XnCMxQJuiyggKE2RXrEwKQ/33zbprNLbaLa5xGHOG
	 Y6pXkUoh+QaagmAq4owkdKgSNyyi96BQq89ctIgFvt6H28NB77oAVQy5EOzDnNcQUDEjl
	 nHsZg0veYE/r8BZ2oceYg4Soiin9dk3t8ILH1FwDgamAjt+1357pEzXpmDunl547dhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3UnRd7Z;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036B1606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 036B1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x3UnRd7Z
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so1961341eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 20:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793417000; x=1794021800; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4wOVj5BkuVqeNk0QZ1pVDwZxFHvve0w3swvsjOEFbZg=;
        b=x3UnRd7ZY6hNbKR/Gv1xjuAGRmJfBE8SrMicwcbUrQYlw/vH6J91OiHDLGEEsE7q1v
         dGcTHVC5Jpdoq30kmksfq9dIwFxuQ7C6XKVJcaYOtzj5XkGRqQ7lF3DDki0L5Q1l6W9S
         2hzepL7hJ83MFbTcicJAdjKWwgw3NOJWrL73ZxEhwQ+KCeLZMjvHtoiPFz20IyUo4NhB
         H8I7NRPS4EQ4Qcrm/yPDvSjPaGtLgfuwO6Je04K8G/ayJEmnag8hzpnCQUHsMpnc+8QO
         YT9wuH/dM5xObZiYOAgezfCPnQJsLV3EyJBNgYQz8lFcqDLnJuqwlTJ3KOkFwa3nUpxT
         9bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793417000; x=1794021800;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4wOVj5BkuVqeNk0QZ1pVDwZxFHvve0w3swvsjOEFbZg=;
        b=TWEHoHpamhAcrKhBRb7CcP9r7CdBoG7ffDgU+qByHHHO0LQZXtGLOj/3a0QI3nQsBH
         MinqxT1OgVA9tP4lMsXcei5OROgPYV394hXqQhyC3pNwcrBiYx9Uok/9PkY5OQD43oUY
         FeRHAKya9n88a66zjhtfsaUjUQFz7B5oF7JM6CENZkOhfTQtAweg2DEEbguNhsraGST1
         W87aXblrlzbTYW/S55xtk0lN8+u61Le//CyX1w80EAjf2E4Vf8tGHubGph9S4Ed4+vzp
         yuO74Deb2yE8/7lCnX4E/dvvPC2dpD9aXdN1/HXnxmr2yjkGa/YHDi9GPRK/MXly6uvP
         wb9w==
X-Forwarded-Encrypted: i=1; AKwUvBw1l1ZgxqGq6ihP4lVS+iLuS3o1yCf/AeUPOL/GigvIjG/WWdudakBGfGonLXuB8QBuujDDYWKR/RBPqtA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLstyDynR3ulzvRtW24oZVOj+YGYyPXIP9fPOOkfswEi5b+Bil5
	+1ljF6kJc61m+kqAAFy/aR9AEU42wS2/QtVCFERbJ8LrD/8bMVjseYO+
X-Gm-Gg: AYBFou3K8Du8nFfgpOw/6cekz5A4qT0Fd1jqUpL8ogMhZdKoHmlj4jJxDpTU4slPn1G
	1kjAkk2gHY/cn1w1ZPBFBq/r/uLg6RE4H1UnHpy9RBDBWMTAqbbOIVDxV7cZ6yX4I0NcIEWfJTu
	VwHyoo33hKf5E4DLyhAWuQ8op3O2EdR8f1eNt5xviVxPxp+F8XSZSSIVsR0HnUmo3Yn4JxRwweW
	X7FchdOawO0wyuoEeb2XX+T1vU+aqU+synKQXm67tNvuCuHXk5vpwKJSKkuBi60A1BsXbES+Kqx
	m6ZRx2B8A+/oIGfVs/6XfPEKopVInsCMIP+5LI0lm4y03+hLxEeb6irTYhGVA0FPilWeVLDT15o
	ltBulQGxC3Obd9BHxrtcPzcrPwIZwne/uUXCGfFMgjdYolz3UKds/BrkojLB6n4FxM2vgRtEllM
	mypPrgxDzcYcCxb/6GoFhPAehqGiujdRsqGLI3vZnPpA6OkcE6EnlrfzZhTDiN06O5sn4HowEyH
	SGBgB2qTTq2bZ56ffy71KLLXG/fW4PAbxbksPK32DQTm+Y7pWB0CuNxBq+9x6JCw72/SZuK+XjO
	i3+Y2qAPkjTeW2n2MYaZf+juN2KHtk45tTwZDZUlbJ4PpTC1lld7HfSMRPLdgsZ9AEXh3fmCjKu
	Oe8KRDl9Go4gPDLBZjmYXgRa4N5UZvsCqxwftswYbNiFrnJBmY9sKJYPsw3QHzcCzVakj09nVVl
	FYVA==
X-Received: by 2002:a05:7301:4242:b0:358:dfed:d0fe with SMTP id 5a478bee46e88-36a42219d4fmr6026478eec.5.1793416999929;
        Fri, 30 Oct 2026 20:23:19 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm13399064eec.22.2026.10.30.20.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 20:23:19 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 31 Oct 2026 13:23:03 +1000
Subject: [PATCH] ASoC: tas2770: Fix VISENSE at sample rates greater than 48
 kHz
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
Message-Id: <20261031-tas2770-sdout-clkedge-v1-1-5266daf35f4c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrA2MY2lsryIuTDLq2KIlE0tBv
 HvTuvzgvX8H5SiscC92iPwWlXXJqMoC/NQvIxsJ2UBI1wprNKlXshaNhnVLxj8fHPLIXbi+Bde
 QJYT8fUUe5PPvtt1p3dzMPv1icBxfMuDrOXkAAAA=
X-Change-ID: 20261030-tas2770-sdout-clkedge-b4e39db82720
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Frank Shi <shifu0704@thundersoft.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Neal Gompa <neal@gompa.dev>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2455;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fiqDQ9C11prPwEgLHZ2ImZCTzidS1bFS1JQKAWZHhfg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlP45Un2Zz1v3/148GPa+O+FO7/yBvMvOmeknM/z4ZFv
 M8jw4Svd0xkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKb6zxtGhk1XMrr2Jm66fXzW1WvSz7nuGPwp+h7YaGgQM/uRsl+eigTD/7Ti2lT
 bO2Xn5+a6X/k/63bjtZNdG6O0+n6oG0Ss8w8VZQUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

On reset, TAS2770 is configured to both transmit and receive on the
falling edge of the I2S clock. At sample rates higher than 48 kHz,
this causes strange artefacts in any transmitted VISENSE data which
manifest as corrupted/nonsensical readings for voltage and current
once decoded. Transmitting on the rising edge of the clock instead
results in correct VISENSE data at all sample rates.

Unconditionally configure the codec to transmit data on the rising
edge of the I2S clock when setting up VISENSE transmit.

Fixes: 1a476abc723e ("tas2770: add tas2770 smart PA kernel driver")
Fixes: 6553ee024b44 ("ASoC: tas2770: Factor out set_ivsense_slots")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 9 +++++++++
 sound/soc/codecs/tas2770.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 882e19857697..41e4fcf09c25 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -222,6 +222,15 @@ static int tas2770_set_ivsense_transmit(struct tas2770_priv *tas2770,
 	struct snd_soc_component *component = tas2770->component;
 	int ret;
 
+	/*
+	 * At sample rates >48 kHz, transmitting VISENSE on the same clock
+	 * edge as receiving seems to cause artefacts in the VISENSE data.
+	 * Send on the rising edge of the clock instead.
+	 */
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+					    TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING,
+					    TAS2770_TDM_CFG_REG4_TX_EDGE_RISING);
+
 	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG5,
 					    TAS2770_TDM_CFG_REG5_VSNS_MASK |
 					    TAS2770_TDM_CFG_REG5_50_MASK,
diff --git a/sound/soc/codecs/tas2770.h b/sound/soc/codecs/tas2770.h
index 102040b6bdf8..45bbd75fb09d 100644
--- a/sound/soc/codecs/tas2770.h
+++ b/sound/soc/codecs/tas2770.h
@@ -75,6 +75,7 @@
 #define TAS2770_TDM_CFG_REG4_TX_FILL BIT(4)
 #define TAS2770_TDM_CFG_REG4_TX_OFFSET_MASK GENMASK(3, 1)
 #define TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING BIT(0)
+#define TAS2770_TDM_CFG_REG4_TX_EDGE_RISING	0
     /* TDM Configuration Reg5 */
 #define TAS2770_TDM_CFG_REG5  TAS2770_REG(0X0, 0x0F)
 #define TAS2770_TDM_CFG_REG5_VSNS_MASK  BIT(6)

---
base-commit: 11ae63bd9030349a0136fb2edd1622a4a029edc8
change-id: 20261030-tas2770-sdout-clkedge-b4e39db82720

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

