Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95D247142E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 19:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141689; cv=none; b=HFzvXa36FuOjtk+dUnON6VUHO3GH2zF/Uwui5nnfUVuSeM63t8R0nC4EUwEOY/rnhkyfrNQGBpj8jglUiCsG61RuJj7eGEBZ/zv9h/7wsW2P6FE1MlNCJYhQIY9kOsZGP4essGYPVxafyCLqWfkP6b1+rkT2Yvq18i7O8582n+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141689; c=relaxed/simple;
	bh=YCAodK/FAz1rIBCK4IS9rFfjuQJLSzopv/TZu5DO01Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=grshacashvYDKaQrAE5JtRNXELX9DGUC/rL6IIKt5p4UdZVk/B7VyRg0UxofXCF5aXFreXV5fymobWm8L9+rw2e067t0ebA2lI2YHbSiBnVTqCgZZfbb9DwLLM18f/bHd1WyJLnJZ2I446TBzvO2QwJD75n2yPoczRDfXW1/t3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=skYjMbMw; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="skYjMbMw"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b9d8056d2so551001f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 12:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791141686; x=1791746486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSQsqc7OQj6X9qWeXJjPEqGWCcpu1RKTa9c8Z4J+GXA=;
        b=skYjMbMwqCXyBd5CLkGJhtX95csnZ7htu9vL2tWD4ZgwTTpVLzb9PUS2TxwWy60N5H
         /mmDjPwtan6Y1oYks4i1d1hcb9yrx6S8aWG0dkYHfxzntzzV9MDuHo8gfzBR7n7v1x50
         6MQbSCebDK07QIdoBDbLk85lLLjVJamet7snD2FARbHlR7RY2RADhjb9g6+XaKW8hUNv
         X2XtpsyZsP093PUTMkL7Scc+MHLZHO6OCkXTAZX7CETQ4Xu5BqNcMbATokQcSXV+3csb
         t8z+luiUiIIrNoFsyuVkbTTvsf+T5ld+4jCERXYeZfZWCZcVwwJ3NbFSZ/5bebbph1Cl
         u3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141686; x=1791746486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSQsqc7OQj6X9qWeXJjPEqGWCcpu1RKTa9c8Z4J+GXA=;
        b=OrLLYWkQk0626W5f5sBrafeVQILuugEm+OBcDlG6Xbnqw+0H0u7/IAhULG9N7hxfsj
         CO5G2WOIZ11Pq44D90ccKxMQMWk5BvzcQELM6u5CBHKLpfr6bDSpmKgteaabmFfIriT6
         1GPSeDX9gcXxncwgRBmZeG93bIVBA2zf7EmRXWDtQZ2LWY7bsHhR3xcCr1hE68Mwzs4H
         72NxIYV5aqZ43oGA4jFFxyIiY6RIMbCnBOGKpPH5H/lkXf79EUXk90p/2vSTfOICqUzX
         Y8al1gIOUYQHi80wyCvz7K0bcNO8zzoBEZEwwE+VAlbxOI0KrxAJ+j+DKWDzbPWd0pW4
         j8sA==
X-Forwarded-Encrypted: i=1; AKwUvBwfBWefIhnlAej7DS4ExOkhYa69ll0gvWfCTK2WhxVPaTHO8WTDMsiGVa46BmYly1dwxrYDq72UptN8TSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRN3QdVa3EWJlqdO81AymEMJ+HG9HVJxAJ/c+HdyvCQX7ppFQv
	Eo0qkIia3uh5NAa9ZF3ydseHKxUU/Ci5Plrpn7n7pAcNlDTES4YnnyP/
X-Gm-Gg: AYBFou3D9IV9vPIJW3FMUukM34smwhuQklkyVsVUmUfxAzeAuT0eJILmUJ7zbukvYB0
	KXCcntvAFyClGGfXF2eOnwno8FE8TK1MwK0vp03Bz5JzelStnnsR7Nf2O8/ebAgD2bjr2LMUzS0
	fz1IwYDNKmNB1HrfaJz60x/0aGV5QpBNpA2YKQDwOw3Tu46O5GXM0GOAWpMpCBIQYD9IYLLZsGl
	kcPhRNCBtMPo1nHe6xOzLby+ansNNDQvckH7mDbGYBfBSP6c+vSvzQwZwB5uh4/pTg9nCgxDgD4
	c2M4HtAMLhf3o+sxdAPm1qXIvHcYrkQBB7SpNrDmoBFDxRYZJ7BtFGq5UYqerzyq60id/t9vTFv
	7BwQ3JmoCpTvjXapyu/j7roZ3aAx2lC2um56yTFBYH5HKX8vr6loQAEd2Cl01/B5dkiuHSIzupL
	rFW3CXocMDwd9O67JtAsCzLmrF1VuK1waZpymlcgGRLxVIFTMziYkVwKBLfkHKsQsiJEOQFjFZq
	tIw6YBg3iYp3eSXC6xnpYdpq5NSWRyCLP6inOy2ldixl0H5lHz8UuTp5wlMFmch5lTZiOO9Hbzf
	y5/G
X-Received: by 2002:a5d:5f05:0:b0:48a:f592:fb63 with SMTP id ffacd0b85a97d-48b126f5423mr15762115f8f.1.1791141685838;
        Sun, 04 Oct 2026 12:21:25 -0700 (PDT)
Received: from jjj-x570pro4 ([2a01:e0a:9d5:4a60:d60f:fd1a:fad6:a587])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104e07sm18771733f8f.31.2026.10.04.12.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:21:25 -0700 (PDT)
From: Justin Bacle <justin.bacle@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Justin Bacle <justin.bacle@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: add sample-rate quirk for Yamaha 01V96i
Date: Sun,  4 Oct 2026 21:20:50 +0200
Message-ID: <20261004192102.59312-1-justin.bacle@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yamaha 01V96i exposes its audio streaming interfaces as
vendor-specific USB class 0xff and ships no class-specific endpoint
descriptor.  parse_uac_endpoint_attributes() therefore returns no
attributes for the device, and without UAC_EP_CS_ATTR_SAMPLE_RATE the
driver never issues the SET_CUR sampling-frequency request the hardware
needs to start its USB audio stream.  The playback and capture PCMs are
reported as RUNNING and their pointers advance, but the mixer passes no
audio in either direction.

The vendor (Yamaha Steinberg) driver on Windows sends this request at
startup; the generic driver does not.  Add the 01V96i to
snd_usb_audioformat_attributes_quirk() to force the attribute on, so the
stream is initialised the same way.

Confirmed against a usbmon capture of the Windows vendor driver: SET_CUR
CS_SAMPLING_FREQ_CONTROL to endpoints 0x07 and 0x86 is the only
non-standard control transfer it issues that completes successfully.

Verified on a mainline 7.2.9 kernel with a loopback test: playing a
440 Hz tone on USB channels 1/2 and recording USB channels 9/10 returns
the tone unchanged at 44100, 48000, 88200 and 96000 Hz.

Tested-by: Justin Bacle <justin.bacle@gmail.com>
Signed-off-by: Justin Bacle <justin.bacle@gmail.com>
---
Changes in v2:
- Describe the change and its verification.

 sound/usb/quirks.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6176acc04..9a5ea295e 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2332,6 +2332,21 @@ void snd_usb_audioformat_attributes_quirk(struct snd_usb_audio *chip,
 					  int stream)
 {
 	switch (chip->usb_id) {
+	case USB_ID(0x0499, 0x5500): /* Yamaha 01V96i */
+		/*
+		 * The 01V96i declares its audio streaming interfaces as
+		 * vendor-specific (class 0xff) and provides no class-specific
+		 * endpoint descriptor.  parse_uac_endpoint_attributes() therefore
+		 * returns no attributes, and the driver never issues the SET_CUR
+		 * sampling-frequency request the hardware needs to engage its USB
+		 * stream: playback and capture PCMs report RUNNING, but the desk
+		 * passes no audio.
+		 *
+		 * Force the attribute on so the stream is initialised the same way
+		 * the Windows driver does it.
+		 */
+		fp->attributes |= UAC_EP_CS_ATTR_SAMPLE_RATE;
+		break;
 	case USB_ID(0x0a92, 0x0053): /* AudioTrak Optoplay */
 		/* Optoplay sets the sample rate attribute although
 		 * it seems not supporting it in fact.
-- 
2.53.0

