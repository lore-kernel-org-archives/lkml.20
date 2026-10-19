Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428462;
	b=Ek4aw4fFwcz44saKyHyD1KEYfhMmjHMLJOm5QdYiIhwJoJVVVmh4JawqyHXHzsWXKrgZ
	 ErQuX3SrsnQuXeCmO76MDXltButGr1F5813VB04IVTIn3Fnzm8fnAylF0pnflyusqEYcw
	 YpjSLIaljlSd1rhdR1MsknKPNBywoPD8RvbEYLHDWrTIL7TtnvlTLbu8t/fWUNJMH7wcN
	 dhc+wu/9gyNbWwE4z+HPwuQq4vJ7KoZ45P+vlBslzpt9+72QtBvS7wFn7J8ItHNOWJCdn
	 cZF0qs92gswTBmKSvNwuLGuvLCkS/dTNay1siM01MK7/U+/3tIGtJpvNhnp+ivJJ6zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NRcVb+O+pECu2ajDpIzLFAB7kkIJQuyCwpHAH8+x8cQ=;
	b=sivLYjws+B5KlyzYUV5nM/ASajseJq9zJUF9bCWDSTq4S9H3Tgu/qxUFhcwh0Mm8oTrC
	 yGqWOQHIJY93ZbXEPkl9zVtVh505e4bLeO3uzUCHvmRkuMRSFTn3XuDYDvtIM9RIFre5k
	 d7hyjUdM6ZoMY+iuVX/6j4202aVlvFXbwikm6ch5UZnUVa8a+j5geXinhO465gJPz1h6+
	 34U1jDmMnzoRHIQCp7ohqM0oVaMsuzEuncjIKwXfv0f/IY2EmC1n2kPd/yerGagj7xVER
	 Y5CwphIV0iIgSCigMVPqLofazVt8wRAq9vgQ9eJhha1tggd/EJaaLgWo29pcYWual5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xpvnq2HT;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD07C606A326
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD07C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Xpvnq2HT
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a01933b584so16743095e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792428460; x=1793033260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NRcVb+O+pECu2ajDpIzLFAB7kkIJQuyCwpHAH8+x8cQ=;
        b=Xpvnq2HTrnUk4hfzuZpMjcV2xCKd8TMLNEMgvfv+0DdzmU9FRnIA4dWNYg69XCDL6J
         YbMZV54UxalWCqLi4+G8u3P97REwiwaO3Wlcyhs6QMPIgNZ29JuUVfrx6tjkOM2DxaXA
         Za3THjryVwJ7rnbNkooWYnHn3fNfKcAjy7pGarKen/Nkq0XTqOJWs+Tzz4O7MEZnjqcq
         NREp7xn2NDTrlq3U4LuPglxt6ysNeB9fiWA6tTIHA0i1TC5d7TC+Z1atAp1xaQBWKSb5
         o1Eekqhuw2qh8f6qHiXKO0tK1zXniROhG4iMJtWDlaaOGK0HYhS1stelGqzy99R9OZUJ
         lIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428460; x=1793033260;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NRcVb+O+pECu2ajDpIzLFAB7kkIJQuyCwpHAH8+x8cQ=;
        b=MJ/RNrmcm5B6Bi4umM85r1lNyi8MP4WHeHFq/mfLIK1HAVWK8VIgF+XHI1r8tLwqER
         g0xc82FNLyfGVdr43i/W72RUV7sjoIiuUmebce+vlA+qpAlXmWZxeX306MOGZLXBlvW2
         yEsLVQgkIwyu0jCP5UcLuvJe4Lqe4PvE2yOa5Wox6h1m8Qt/kzMIeqp4fUoe8LFWzV+s
         xruq3i6yESXQSpO5wXuVRsx6VL95wzXQvCqOtAW3ycMsoENg5wtq/+Qm5ClnJMFcpYxD
         GPUSEk+RR+nZ0TkLEngbFK3i/M4CZlcmdXwt2hFiPYC22s/+fK6S+dIXstqoBgy1mn/f
         WtBg==
X-Forwarded-Encrypted: i=1; AKwUvBz8GAysfi1I5uxA6xuSvftD3wFW1qcofkviGh+2rlkQKNgOm5N82Ep4y99dRwENk4HECL0igm1MHgiNXv4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK84iVxA5QEVArd/JaRHfMPB6m58H5UWn29/pFJRlDVaf0gLe8P
	nJRwurrkKbZj8njGicA06/rngfywIUs7SP9MYhfHuAVT1JIEsTRVg55W
X-Gm-Gg: AYBFou3o6DnqN9V+t21UkfGDJsgU0vwc/8Iq6xYhZ4xyNEckTf5Fr6Lsv4C9iWNIMUn
	chb10ckokw6W9ou0ti8SLuBnirCjV1f4icVtbU2e8H35cwFM1F/0eVMOeN0hJTS79ZN0BPduq2I
	xe7mcz4tInr6NkqnYuEmeiurrWb5uRql+yBjDDw4ODCP7tOBXv/RBsz8JewF5id/wcikcKznWRG
	qx2K7FVSvKSCwTFYKLhot+ypl5xICWRQ1bv0vIa/rd3r7C9HKjhVRxO9bvyG+VzGSI7wh1e4Yn2
	1yTyMQnWwWCCVQuJAfrMTCeQkjU+VhBXV+SSpN26cAOMndZ0bwjoGhHDLDzlYd6g2jOWiJvi41w
	AGceJ868E6SoGa7LRt+XbLZsbPNnli2En2aLbyBDhe0UGyZf6d2LtUm7AYjB6y4AyA4wNGD3nfy
	JQZ/HbhBz2Y0vtVjK4PTIov94GnFTGbevTmQNncA4YHblfgE2eGmaXfIONq25gPjCeuZmq
X-Received: by 2002:a05:600c:5492:b0:4a1:e4c4:f6a9 with SMTP id 5b1f17b1804b1-4a1e4c4f8a8mr90899505e9.23.1792428459935;
        Mon, 19 Oct 2026 09:47:39 -0700 (PDT)
Received: from fedora ([185.212.237.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1ce02d619sm193400685e9.3.2026.10.19.09.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:47:39 -0700 (PDT)
From: Moroz Tymofii <moroztymofii@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Moroz Tymofii <moroztymofii@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Enable mute LED on HP Pavilion 15-eg2xxx
Date: Mon, 19 Oct 2026 19:47:25 +0300
Message-ID: <20261019164725.10666-1-moroztymofii@gmail.com>
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

The HP Pavilion 15-eg2xxx (103c:89f6) uses GPIO bit 4
for its speaker mute LED.

Enable the existing ALC287 GPIO LED fixup for this system.

Tested on Linux 7.3-rc7 without an hda_model override.
The F5 LED follows speaker mute/unmute correctly, and
audio playback works normally.

Signed-off-by: Moroz Tymofii <moroztymofii@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 1623cf926..b3ce4c238 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7550,6 +7550,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89d3, "HP EliteBook 645 G9 (MB 89D2)", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
 	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89f6, "HP Pavilion 15-eg2xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a05, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0e, "HP Pavilion Laptop 15-eh2xxx", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.56.0

