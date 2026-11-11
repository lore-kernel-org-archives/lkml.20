Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417691;
	b=olXkmBGB59H5AKCBsgCWWfZjsX4aCgcVTSClU0THTzI8STEBjD96XyXjo4+/WZtMXJLh
	 7uGZjzfgUWt5OsX5WsCnB+h22yTOM5I+RFBkE9XEiKvN9LTCAg2hMYSnFRQl3FzAO6zdr
	 rAritzxWkkE02camVFU1z58EFK+gakbmT+x6+yMB2Hw7omUB1bKN8gNuS/9zUEW8AgnSS
	 w1TIT5Xczzs6vQKxoWz9k0Yi8hzIz1eLRnGHY2+dht47czcTC2/TZ3S1YqjQ4n9nRiEFi
	 7tA6GDlJSV5oDQfH36wyo8rigjoeByUTzvS2hIYJhHdRQUyLqv27gIiW6SDvPWvaTHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5gtMk1BaBbimjjhRzyGg/s0fNmYE7XAFuUTiS1DWag=;
	b=iW8lJqyx84qBiR8XTv4+PP07vgoqV0DF0sh/Vrc/kHUzQGcTMRbVksl4j3Pgkz84KkUR
	 85gIfoB+A8hQeRGITxldCNmVLUkmeM0RMq0S8o77ciEOiK3TQbXwAAfLcOKO7uxhZSE7C
	 Whw9W0s4neYfj45li3p4sYtvdCiNp6drdziWYWXyu2KZrtR2TFH5+iftmi5OFIJpvRFji
	 pwsHSv5zkHBj203kXZ6EpYK08HT3CTv9bvUkmdB8tmOqUZMVDoSBIim6VZSAnseX0DtG8
	 aV7nLaXLUKyOxDSnpJy0xR7bOqKfpeHvMpEd//rL81+br7Kb5ryLylaNyI+t5XTkTbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJUXtfic;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF3606A333
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7AF3606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DJUXtfic
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0d126f631so35689937b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794417690; x=1795022490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a5gtMk1BaBbimjjhRzyGg/s0fNmYE7XAFuUTiS1DWag=;
        b=DJUXtficeow3diFxT5wC3H0TK/XkcHWMt+5Je/TXWFWlsF9nScWyaeyJ27kg0OmaYz
         8e7+3oJ4HxReQNuowYXJQhFrTSR0+B6nT8AuJ5sXdtT3SdY77OQc/LwTrkPzzdZEQrtI
         yiPSc++MmEZJKKEUWHrvq7/X4tuA8ncU/ENBhSopGv0lQ+Hjzdu+vONojk3sojAmHnw4
         ovVaD3zOJWRGVW8u+OKPxiwrB2hZp4TThYuPjt/aVQfwuPFcoSexLtQV6Mj0AIpY4RAu
         6ljSVu+6MqqbsRcD67/u0V4V8XqZalbfyZ/ENmwL5JF0z7jeEwI7KNjbQa5eyq7vfQ1N
         SmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417690; x=1795022490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a5gtMk1BaBbimjjhRzyGg/s0fNmYE7XAFuUTiS1DWag=;
        b=Hle3k6vKzNMCFslp3nCA9/Cwju4Kud7hvOKxfMDzBegh8jHzqu5pb+IWWaX3yVUyQC
         XtGQVStrxxTQHEYP7A5wfL04ajDQsYM31qx50y0JavrtiPReSSQpqVUn0Xeal/7sV58B
         zRtuXaPZ7wJclbQRpvXJHvetpECUd0cqpgwRnEpRp+2K7bkNlMipG7mZYacbZfJLLFo6
         7SqoRMYN6Z04eNgFaC2IhR9wPK1Rn0LnDCPHOoG7WMIDZ5x6FSiSbTMvkZ9SSW7hY+Xw
         1atXAL4wwtYYIcLRp2dYu+UPj/9K+YkVdPj87dfzCyTx5dmzRTCDzgVANB0xIws7QZIE
         H1AA==
X-Forwarded-Encrypted: i=1; AL+hErEjYWEJAsdHM/owiw5R5whztd9Labth/I+XeELHz7KHzQmss66R/5+elX24Wibce0DB+b0NC3He4Rpki7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z82bk7v2yy7r3EUstdHQKaVkWPR3LtqcypUEKqP3oCgKD5G8lur
	HmlhVRD2cXQgkIDyeKitIrQ0nELLAGwyajXdh4Wi5yISCKWFi+2C2egs
X-Gm-Gg: AYBFou3JJF5LV02yMOR6nWhCZzijDN5orcD3lAo3JkHaSK2vUCAZcQBZ60HmqSTupUF
	ddOC6EUZw1jApILHC95olEZZutFq7ucjINBpKwldpP5/131KaOj6Yd/lsF8rFiaqLjQrzKKSVm+
	ifzHeOdREvAS/HdtJasJ77Wq9QQsjhRmqBOS2yXefaBeEPj3FVAzsXgAifKTBBdeW+k7QjgApYA
	E9Qy7w6iSW2SJizzV1iqXfV2f82Hyb/YKnwRyrNbxf/65cx/IiI8Szi2TrvlzOaEFR7KoLdS+u0
	2lKh19BFl6knyv2dJRzept+dW3NfN3rhoegGcNIoHVY3nrVvZHqab/59FHQIRjodntnIpd7TPwv
	NoxW0YM31x/EqQJxvMHARWKJt0ivx2daNvQVdkP0wjeVHZ2/S1nBqHw9hCfICATs5L6CZwHa4EJ
	thqfcBvbPZat7Z+Jyg6ZfI/WJWSkhhBfqejjai5cx8ZJy/W9nQux4lpPdwe94g/xal8cErhv6E7
	4QtVdQIt1oJkUt0ykk4WMpP5A65FfXDICcba4kZmykuyOvYYTwg31AzP4CXCgcFmPoPaVX6jgML
	JcjycdDQTbVZ+MyiIzwXVOOnHtmlUi6KSA==
X-Received: by 2002:a05:690c:f04:b0:8b3:5b24:f575 with SMTP id 00721157ae682-8b3a81171famr23018927b3.51.1794417689523;
        Wed, 11 Nov 2026 09:21:29 -0800 (PST)
Received: from cacher.lan ([111.94.230.110])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933c5a00sm49532107b3.16.2026.11.11.09.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:21:29 -0800 (PST)
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
Subject: [PATCH v2] ALSA: hda/realtek: Update quirk for Acer Predator PHN16-72
Date: Thu, 12 Nov 2026 00:21:08 +0700
Message-ID: <20261111172108.30011-1-faiz.faadhillah@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The Acer Predator PHN16-72 (1025:1731) uses the ALC245 codec, but its
mic-mute LED is not enabled by default. Replace the existing quirk with
ALC245_FIXUP_ACER_MICMUTE_LED quirk to enable the mic-mute LED chain the
existing ALC2XX_FIXUP_HEADSET_MIC quirk.

Fixes: 34e08ad3a8da ("ALSA: hda/realtek: Add quirk for Acer Predator PHN16-72")
Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
---
v2:
  - Replace the existing quirk instead of adding a new one
  - Update commit message

Tested on my own device; Headset mic still works and mic-mute led now
works fine.

 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a756e0076021..92c158e9d91d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7553,7 +7553,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
-	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173b, "Acer Swift SFG16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1758, "Acer Nitro ANV15-41", ALC245_FIXUP_ACER_MICMUTE_LED),
-- 
2.56.1

