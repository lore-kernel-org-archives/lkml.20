Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604271;
	b=V0EXA67Rkw2svFQLXzeVcGEDmVApmr2Wc5+xijlqIRT9TaS33TIOqxCZqVl8WaU5lJ0f
	 TbVsiD9XDeTd40yPdQAaJZf4mTGpzEUF6bNW6iDpnnF1uJQnObddQNcstsrKOk50oguum
	 IbRw5/9sDncsQ+oBtkluvQ50eZrU+gmgss6tTKjt0YS9N5PiDFVixPzhl7iZ9x732C2Kl
	 bfe9qxYXPDAvLtmiU0KxUHTwNPnJZFkGvGQROI9K3jlrTlZ3O5j5/xFOl6mrWI/QHHHdZ
	 CME1QII99fWizJa4ckRnHEN1F43+vvWBpuNnv+ZIh+tYG+p8EJc1G83b8UsBDJp6BvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=syr2zQi3P5/X/MdyWfs8bAH3/tIBu7dhoU7d8aGI8vY=;
	b=QYlHn3BOXgso/LU6vc3xtq+fseBtrZJ6/TpRNz1k1zkCbgXMLAfL7Px7SMfatrmzkYYQ
	 PtY+mtmhH5gXH3pj6QwjE+cvrhBkKglj+dQMvwr07oTu4H9xnIgLRN1Am8XZlHiQKUq+L
	 n1qQTMXiZXR8gDwfeN9JI8yrAKV7E7PKBuMxRl7aKBQ9+EH81is4z4vTifNu1ChSSfqSI
	 SgdiQRwH9eDlRoGYqJ0vohppaaEuIFbcAJpjmzDviIu6ZpwUhRkWhGtmHcCxnFxLn8b6r
	 ubcJCsDFgJSbKYGPYoyPD52Q2rPBOk2sq2yQ2MhezHA5PIo5OAKYwo8UXJWTtEhylKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPI+pwhg;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F39606A89E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F39606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hPI+pwhg
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-84e8a9fae57so581879a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794604268; x=1795209068; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=syr2zQi3P5/X/MdyWfs8bAH3/tIBu7dhoU7d8aGI8vY=;
        b=hPI+pwhgZkI+aHsBRmfp7v/HxQGf0QciGR7PeTntDZ6fFyMCqodfb/S5DYonAWufFL
         743v28a9Np9nARzZQSS4/ZKKweEFtGk3L7hdd4uMIVrLCam11CRkXlJ2tX4ij60V048b
         LZZ2sLGxE+S/4np57UgzBxAoMFyQaw4FFVbzCkXkZYTR9S1Kate65uFRZ4evllUfSJWO
         rWT3KNZDB/qZwGiRIPMxvjcpFlGs3kAcDvg/aP2/IV3AwuwZLPH8ayuh9JIV5HadsP5L
         Kzycskp5o4zecX36lNmySymS9Y6mXqeDltFwFAhYwISb6yA2wX1CJNl0v27F45erFdDI
         +udw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604268; x=1795209068;
        h=content-disposition:content-type:mime-version:subject:cc:to:from
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=syr2zQi3P5/X/MdyWfs8bAH3/tIBu7dhoU7d8aGI8vY=;
        b=nSHO5z17q01p7NJyCbHFBOzKpPYnlsjQvTltie3XZ/F8w+jXC93ljiRrGrYob4OujH
         f49dShHQh+3PvpWDK6B6+iz+jbvop60aW4BjTDH2Z82TZpDT+27+OzdHylw3ejsa6fWO
         wnMLCfo0I0WlrYOW155s73ZTpRC+o4Z77uqveQdcyt/ikTc6AQf3evuZF/wbEvilqm58
         hio2P94rfHEa9Kn15lPiMHfIGfDeWG81nY9wKc++AAoluhSMjTjVznekEuci9ugQJQ3G
         AKuaFLaTTWmHSqHsic5W1eZxyaM3GfkE/91Zyfnz36YHXaAcLzmQ90PA4xE6TafIwDlt
         ccPg==
X-Forwarded-Encrypted: i=1; AL+hErH7kofiegee+c4FJNKNeV0aRZ1iXU5EpgABA5zHrkJbx8fB2/+xz3lloEgdqXHDaZXXd5icNn8DgLkSWMI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J7lpblPYjbVaAIE/Ad7w+7pZlDFn6GH1qJKue+u/FXow/V/9P
	a7DWldov2vCBuq8PkdxyPN6GHfvUpkImtcH9tUaEWbKRagvPmv/MnVBR
X-Gm-Gg: AYBFou374srtRDOc3Njgl+PcVvfNmV4qVSyz1ZaRex3MxnfkPqisPn/dP7O4e46xZpD
	MHHSaU7nt1JllFWwxW3jIPo9XyDIVh02jBOdlmwsiRSQS3JqLkFhKLWdklmzHEh3gL8+ISGnAeQ
	kzRPWGwCDx1eLJsL4vTAUWKz8/+J2FY8BJ5CBgqIBK1SB36exDe1cKIiAW1XYTNHHNtLxg1ZdNP
	DifPhdTmqxzAOf4Sce9jE3mhVWl59zAQtqRVGKhYmEXeIeIphc9OrjTighdh31xhTfEsSIkg2vN
	XBHiCJiiJIuC6uYS5M9Ydno+SdRrTwBrsWjREAO/f2t2fxAcj7iOLVgbZnLcpR1GVfzViCXH5JG
	V2METvZ1+tQckZNbDSdGAliIiiEoWOPgsm/bZU7Bnd3xrigrnxvzIUaBJryeW5Nq6LrAgHGfHcO
	AhyVKjWLf7ZKllzvBWOMRwT/u8xkXBy13BoeWBEsdegaRLUnKvLZpQ/fW48+6/NTbh6fsd6Pov/
	18KmwK0+zlVe/mdtNIxO4xquIYguWTFbMv+aNBVNKlSPsKk1+EQNgeyDHe4nXr1qUTecPFzw01p
	xFdI2pHWITjShwss+Yocj9A=
X-Received: by 2002:a05:6830:a143:20b0:862:9ff6:53b6 with SMTP id 46e09a7af769-8629ff6580cmr496542a34.23.1794604268657;
        Fri, 13 Nov 2026 13:11:08 -0800 (PST)
Received: from kk-arrow ([2601:245:4581:6413::1ad8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862880a52basm3756471a34.4.2026.11.13.13.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:11:08 -0800 (PST)
Message-ID: <6af77cec.d7a53d1d.2ea921.e37a@mx.google.com>
X-Google-Original-Message-ID: <20261113150000-avd3DU1eQOhL4sRB.GA>
Date: Fri, 13 Nov 2026 15:11:03 -0600
From: Josh Klecka <joshklecka.dev@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	Zhang Heng <zhangheng@kylinos.cn>, Damien Dagorn <damien.dagorn29@gmail.com>, 
	Kailang Yang <kailang@realtek.com>, Eric Naim <dnaim@cachyos.org>, 
	Matej Sochan <matej.sochan@gmail.com>, Denis Yakovlev <mfthesun@vivaldi.net>, 
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: hda/realtek: Add mute LED support for HP Pavillion
 Aero 13-be1xxx
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The HP Pavillion Aero 13-be1xxx audio controller (103c:89fa) uses
the ALC287 chipset. This model is similar to the 13-be0xxx model
(which is already in the fixup table).

Adding this model to the fixup table using the ALC287_FIXUP_HP_GPIO_LED
quirk makes the mute led on the keyboard work.

It has been tested on the target model (HP Pavillion Aero 13 be1xxx),
and confirmed to operate correctly.

Signed-off-by: Josh Klecka <joshklecka.dev@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 96fa8c2782bb..ae7a46234355 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7864,6 +7864,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
 	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x89f6, "HP Pavilion 15-eg2xxx", ALC287_FIXUP_HP_GPIO_LED),
+	SND_PCI_QUIRK(0x103c, 0x89fa, "HP Pavilion Aero Laptop 13-be1xxx", ALC287_FIXUP_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a05, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a06, "HP Dragonfly Folio G3 2-in-1", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
 	SND_PCI_QUIRK(0x103c, 0x8a0e, "HP Pavilion Laptop 15-eh2xxx", ALC287_FIXUP_HP_GPIO_LED),
-- 
2.55.0

