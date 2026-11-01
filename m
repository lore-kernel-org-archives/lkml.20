Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543804;
	b=0NydNMg/Hot0JF26lJ8GB3o6EqO0M4XtMJVUd8DHVsbLwx8xvER9qDRhVgJIW1ntrQtO
	 hLPFff+JpwhMkPZ7saO6boX7uxi9HKq1poz0tER0R3lpeFRXwNdqukjBNGIN+2fYCMvsk
	 07iMHFkoenJAZQcqMmcALyrMVzYkTbvJwXpyJarxisHmqjtozPeF01dkctDcKGh5mB0dq
	 Gt6z51AYNzlFAbJXJbnXjfnJLjOyJCltmM1n+oDgpm/XZ832kIrIjwClHDb0v2qHEmITD
	 OTXwj0Rk+dhwY6dtij7obqns2wsGtq0u+968Q8TnTGIhfM677ZVMhfaXDNcWWmlKdOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yj7uHm+i6moRPp1T/k/KtCZpjWPn8bcWSFuA0A8wuVI=;
	b=xw6mfccewVxsoKa38KRmNL5lqALMnGXiDb4/dmcheB1ZE9jdQbjNEQF+IaK4q06rugSe
	 P30VFtm4Md31EaOlpHztdT3mKhOhErY4AB/hje4qbqmbOIoIWi/Yu+3NFpW22s9CEK/Va
	 zb7kbiFIH4UTx1xkFUO0LlOXx2tFzOuKpVPF6MO9y9C4UxZpDaA1wrwURjZHXBEuDixut
	 xxJzsIGWsZUZcPpGXoU5UPHBMJtlRmHUmM93Z2vOVeJzvXTt4l4GO7BPGxo6AgdNxx/5/
	 Kz4KLQ4pXeMxhVDxMDZyN08DyWtgTmkWULIG4ogiS0RsnCsZAxtoCfuwNMEzJB50RVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0dBltV3;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641AE606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 14:36:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641AE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m0dBltV3
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1adbf62dd31so2154687c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 06:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543803; x=1794148603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yj7uHm+i6moRPp1T/k/KtCZpjWPn8bcWSFuA0A8wuVI=;
        b=m0dBltV3vJzXUNWsa1DfRCJw8phMt3MlnKGrA5AjUdoxS5DMqjm6RTPgZU+reJeN8w
         xDgc9D8vvpaskFxICzOeYp/O18Nb1ItZp17271KELGsIhHsW36WmiDAbZqipXS0RHS5O
         lM93r356hj3JFkD/0EEbOb49BUrInTiprSpYFuJ4QKf/+IAonPeEJRXue6KK5IHoU2Ul
         cX66W+8ta4zF7LCbYzpxGRvS0PC769whdGLMCgbbTeKMeUKAp+rKsN6fK47q7Y75AyWc
         HoAglxnqxq3Db0UQt8Z8xZfoA2oCxYSxx687l6DxuO9S+F5+xyRGgcy2KpNo4SBQfpYR
         GHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543803; x=1794148603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj7uHm+i6moRPp1T/k/KtCZpjWPn8bcWSFuA0A8wuVI=;
        b=ntK90WlpJxcqVisYzvMylMK2L8jDBK9TwIkd40Eke9uTotwrFifL1KDJdSP/p3dSSP
         hl0c6Wrq1nx4rGbZrttrS0O//VqGQHzq3d425Ho812KHYMHhoHpLZ39zoqZJXIhyJ3Qx
         Hv+WeVXy/jT+o02I10QaTrQQIy2xWhbNEd5HO11VrlohZgvJDrXAJL0Dlc9j4rExERIv
         e1II4b+XgHTzbj/jl6qklQdE0x2HXUFeedYHsMil/RDxxwXN8/OIZ1uuE3Gb2A/8YlpD
         M5LKSlfMHCO7Bmyhd8ZP5RqBT/k0RJ2cb/BAPpA+WZ1bv/DrW4cz171lNcuiGZhUwX7E
         NAgw==
X-Forwarded-Encrypted: i=1; AKwUvBxVYpRdzvAthAWKbs2nikT0XoIzQwF7BfmJ9YpAYHaDLHRDQxtDOq/qmTaD/48bK45BnJzpDpU5G6lgl2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHbC61G9iQMeJMnSlgDlTecf0FCFpT2RgufPhD3ARAL9fhH8UC
	RaUAOSQMX9VVjLbHGqQiXjwNdmfoWu8VdQONZFN6tt9v9yCwDUgjS9DI
X-Gm-Gg: AYBFou1hpc3afM+w/gby/o8LvN+m44rVdXxZW2FWT60v780tFn4B9YBqMevYAdfCQh8
	5/YLXMTqzOy9AmWQkwu5ndxqPLRtS+Rzk0iDPtfRDS83IWe6SdKBGrdL6nRhiCuOzOGpDK62ntD
	8qf2zdMsTvJbrpdC19UMQEU4v/sRWvIscPGpQJwmRQleEBy+UMGnvEVEa2D3VnzFasBvTjBOW/l
	Ox/3P3aL5zXQUnk9bd0o4XIS8vLnuugkLo7+f/QtmAoSXJxrc0/WcbMb4LJI2459CSnyyH8aaXl
	YYTA5elTiBgXB5pVH5g7OBRvp7wGmDgvLviDPSA44jsVTV33D26UzHe0PsbsUoTrT7O1iUkhbik
	ksy4xvk2L1c70NihvSO8Vm2SIq8JnqO0wCEyQ0Rm4lC8riSlY7YGc//8UWnOykah19vRErooeKQ
	khB3cQ4n9tSnaFSP8kVtBZrvlSq2lmst59XuWKFd6oY7rnfna/4F57QqdNW5d0OYrL6d5NvdGfF
	UKIeHFovwYr6LabHxNFVAQit51NMbCdPxYw8ElQTnxeMl3EVRlXlZMUnwQWG4kCNB3/TqRE47N+
	3CkSAcb10mfldyVkC87m3pIxvfYyDZYM1kMSMiyYPCQp44PalvFYtgTC4aw453XsDxexAsfHt7X
	DHpgWzZuhti0WJz9TpQq0zIhsJi/PfMKX
X-Received: by 2002:a05:7022:29c:10b0:14a:8df8:56b1 with SMTP id a92af1059eb24-1ac5cb1870cmr11278522c88.22.1793543803297;
        Sun, 01 Nov 2026 06:36:43 -0800 (PST)
Received: from puter ([49.207.217.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1abcf67csm25620869c88.21.2026.11.01.06.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:36:42 -0800 (PST)
From: Shivam Madlani <shivammadlani5@gmail.com>
To: perex@perex.cz,
	taiwai@suse.com
Cc: linux-sound@veger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shivam Madlani <shivammadlani5@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP OmniBook 7
Date: Sun,  1 Nov 2026 20:06:32 +0530
Message-ID: <20261101143632.17511-1-shivammadlani5@gmail.com>
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

The HP OmniBook 7 Laptop 14-fr0xxx (PCI SSID 103c:8e3b) uses an ALC245
codec with CS35L41 amplifiers. The existing quirk
ALC287_FIXUP_CS35L41_I2C_2 does not configure the speaker mute or
mic-mute LEDs, leaving them non-functional.

Switch to ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED, which controls
the speaker mute LED via COEF index 0x0b, the mic-mute LED via GPIO
0x04, and chains to the CS35L41 amplifier setup. Also update the model
name from the internal board codename ("HP Agusta") to the retail
product name.

Signed-off-by: Shivam Madlani <shivammadlani5@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 23329d5887a5..b040cea9c268 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8067,7 +8067,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e36, "HP 14 Enstrom OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
-	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP OmniBook 7", ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e43, "HP Laptop 15-fd2xxx", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	HDA_CODEC_QUIRK(0x103c, 0x84ee, "HP Pavilion AiO 24", ALC225_FIXUP_HP_AIO_SPK),
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP OmniBook 7 Laptop 16-bh0xxx", ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED),
-- 
2.56.0

