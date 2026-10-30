Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379865;
	b=MVIo2Fu02dzBf8LdsKv0+9kFRvEQooecqm5uZUvskzTqmh3CcWtuhToyD3DCAInLyEwe
	 6xfVQfI5TOa904MEWb3VpYlMciMmEz3xgTVeuBokLSdmFNOIChWLWdg0KtSLc2eUCLU95
	 YHdV1/GDw3BhyIU3KWfPECJARWoofTsORjAyn8Q2W0h9JNUsSCPtoJbYH2GPVYkOGu315
	 7JglC73vcMTk6agnNYu5kM1xSYbn+625N9atpEldr/wOh+22TJUFnMZPOLXQL95cTvrRo
	 1bQyi+n/zSsxJFltzg94btW82Ao0y+VqX4/yZ707HJfyH8ZNBhqYNNnlzMrkWlSXRnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=E4R8h7MFcdwbDDqOfCHR8zbDow4VH7LIlDFzvboffvI=;
	b=HpY7m1MnS/9JRsDuZq7pOWPLeYa+jHrsBfceyFp1ssPuU925YngkQa5GxQHdOpjAg7Yf
	 m85WI7o3fZFffBWqTF+lwZR0bFvElz6OcL3iypA+/goYSiJ5z7hgHKHoDvZwebS/KWrGq
	 4wTUXYAv7W5UpADzGEgRDuMNfvC9PukH6lN3UX8SNCnYVLNav/3c9E2iHDW1ve08K/5bG
	 z7rSb4v2HfhW2ZQVZ0q0YIKeVDbWDYIwFFM0LzprwBbOBo5Z5YYf9o9Ol782eQIx+WT/l
	 0jR+GEwFNrhXaiQBGgiB77p+sKGxAD9opkrUW8lVfBdcFa1QbmH8w9HtkLeyeSE8fyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vmFpJkl7;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE09606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 17:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AE09606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vmFpJkl7
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6f5a0893610so710622eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379864; x=1793984664; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4R8h7MFcdwbDDqOfCHR8zbDow4VH7LIlDFzvboffvI=;
        b=vmFpJkl7EBNCYxDVYDJYKFjF4bIhiWR6Y9qfGSDu2HtVycSWM/UJQ7qwbN3W+6RrMy
         UiiN72XyOoTobOprNNaufTysF8RjSXj2Qp0ywU2Y5YG5YctI8Rb1PpKqQ8bLatBK7Nv9
         yN5CT03COYYOORcEy9hW8ii6N6gVvPp1btreb06r06BqE9bGdSHv+Idh0RVHJB64FHmq
         fYmAKFxjkmxxMpIg9pKDJM7FQKIrGbOnFGgVqgbPeXLexNcL7thz0V8GJkDlkpFv2vQT
         M1dvfVvh7RUlO20ykEWU/ftkF1erTjruOyL6KjaBqYneP8xxK5tzS6BNqAItE5MD+Rw7
         evAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379864; x=1793984664;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4R8h7MFcdwbDDqOfCHR8zbDow4VH7LIlDFzvboffvI=;
        b=IHbC0EL3/DKKIRV3JUg/SoFYQzj+O9jNbtjBYl8mCj6BOzCOwJXMfjMJDJpp4Z0LPe
         bbrcrYS3yOKmT9ZFRjf6i58OX9TA1EwukeCLHk+3DiVllTw65QFuRrKSapdPQ9zgpHKb
         fxDyjl+3hIAHETx0dubWlZHDthGK8LDHx80unb5lmpXPB+zZSgBrrSbBLDnAMntLiPfu
         nVDrO7QwTTG9EU7k+esC8sVwLQGNiUHbW/q8/hW9l3WhQuP4YkkyhN81krRtcCCYmYM4
         nqP0CLqSQIpQJkWLQgW0PJwgCmIYm5dVOHXNfedumJrA8+c9pBOOi35o/aXk6InBWlkh
         anAA==
X-Forwarded-Encrypted: i=1; AKwUvBwltnBM4GIyvXj24nDEjYjt1xvtZshVA3xcSODrDlZmSRKyNNmDnFcflHtM12zfYVWs74otInp7CkTCyV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAdyKKi+6hWPavvxuWBCw6g1BPfTqutoV/Y7eV8aPzUMT57TDa
	mEcBBR79kGarGq86yYrJCenfVzS/atPtqLKg8MCKRj9+B+pIq11B1JTI
X-Gm-Gg: AYBFou10HDXvXe45CCPl1p7vV8uaO5U1eYdXwBLgtk1j/4DqItGgU4nat9vsjzDjXrv
	sNJWb+3o2f+dajkGGZB3b/1cByekM/n2WTZ4ytmWmWkWdLMGhHYuQp7xVFfj4JD4iTvHeIkBb3B
	xZ3vtRh6cnOLnjLpryiZbrB+A7HdXs2+/WQ/MHVIirxCBORSsJQFE3VNvcw4lYj0RRVjGMLdjf8
	wM6biF2mmuGrCCDreXzqf7TJSfOXQLZC64mV4tTyxw+e3nSxV2HKgE9QDJcnvYMwzV7cWTOQozd
	OUGVOWVkE/k81yRQJ3Ks1uROSCwmCDcX1yscmHhpudrHN4hOexeE5+KYLfE6GYnxKRV+yR4AKvu
	GgNcidudk/fHpiNur8SraAUg2JX9aPXLQgfIRgwmGfaY3oNKKopfU7SEDB3HZDFmt19w2nnA4lR
	IylIYCupIT8kK3ow64nD+sMQBJ1ZrS8G30X5HG2q6lQYoTHh9IcZSrcTZOahCajn5ZFJXCInjw5
	c7h/qJwokTFT+w2GR7Vadh/1ZE6Ampps1CP9jcIRyLCDEo7guHtFWxC6jAohBIXkxNS34srHA4I
	5m1Ch7xvRCUqLttdv9rD0Fs5Tr7qWTh69DAOC2I=
X-Received: by 2002:a05:6820:8598:20b0:70b:638d:4b9f with SMTP id 006d021491bc7-714f29eed98mr1265557eaf.47.1793379864124;
        Fri, 30 Oct 2026 10:04:24 -0700 (PDT)
Received: from cachyos-UX582Z ([47.185.113.166])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-714f2a818b9sm2419780eaf.1.2026.10.30.10.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:04:23 -0700 (PDT)
From: Slaton Christie <slatonchristie@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	Slaton Christie <slatonchristie@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: hda: cs35l41: Add DSD properties for ASUS UX582Z (1043:1a8f)
Date: Fri, 30 Oct 2026 12:03:54 -0500
Message-ID: <20261030170354.7427-1-slatonchristie@gmail.com>
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

The ASUS Zenbook Pro Duo 15 UX582Z with PCI SSID 1043:1a8f has two
CS35L41 amplifiers on SPI (CSC3551), but its BIOS provides no _DSD
properties for them, so the amps fail to probe and the internal
speakers are silent:

  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: Failed property cirrus,dev-index: -22
  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: error -EINVAL: Platform not supported

The Realtek codec quirk for this SSID already exists
(ALC245_FIXUP_CS35L41_SPI_2), and linux-firmware already ships the
tuned cs35l41-dsp1-spk-prot-10431a8f-* files. Only the property table
entry is missing.

Add an entry using the same configuration as the sibling UX582ZS
(1043:12af): internal boost, CS/reset/speaker-ID GPIOs at indices
0/1/2, 1000nH inductor, 4500mA peak, 24uF capacitor.

Tested on a UX582Z running 7.3.0 (CachyOS) with the change built as a
DKMS module: both amps probe, load the spk-prot firmware, apply the
EFI calibration (R0=10611 / 10708) and the speakers play audio.

  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: Firmware Loaded - Type: spk-prot, Gain: 17
  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.0: CS35L41 Bound - SSID: 10431A8F, BST: 0, VSPK: 0, CH: L, FW EN: 1, SPKID: 0
  cs35l41-hda spi1-CSC3551:00-cs35l41-hda.1: CS35L41 Bound - SSID: 10431A8F, BST: 0, VSPK: 0, CH: R, FW EN: 1, SPKID: 0

The boost values are copied from the 1043:12af entry, not taken from
ASUS or Cirrus documentation; confirmation of the boost parameters by
Cirrus would be appreciated.

The diagnosis and the patch were prepared with the help of an AI
assistant (Claude, Anthropic), from the dmesg output above and the
existing 1043:12af table entry; testing was done on real hardware by
the submitter.

Cc: stable@vger.kernel.org
---
 sound/hda/codecs/side-codecs/cs35l41_hda_property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
index c50c7e6..d5a9e1d 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_property.c
@@ -107,6 +107,7 @@ static const struct cs35l41_config cs35l41_config_table[] = {
 	{ "10431863", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "104318D3", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 0, 0, 0 },
 	{ "10431A83", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 0, 1, -1, 1000, 4500, 24 },
+	{ "10431A8F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431B93", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431C9F", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
 	{ "10431CAF", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0 }, 1, 2, 0, 1000, 4500, 24 },
@@ -566,6 +567,7 @@ static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CSC3551", "104318D3", generic_dsd_config },
 	{ "CSC3551", "10431A63", missing_speaker_id_gpio2 },
 	{ "CSC3551", "10431A83", generic_dsd_config },
+	{ "CSC3551", "10431A8F", generic_dsd_config },
 	{ "CSC3551", "10431B93", generic_dsd_config },
 	{ "CSC3551", "10431C9F", generic_dsd_config },
 	{ "CSC3551", "10431CAF", generic_dsd_config },
-- 
2.43.0

