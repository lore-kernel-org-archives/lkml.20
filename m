Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB66344036
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.230
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790637388; cv=none; b=d53D8kWE6SdZlrB2zkRqzIRQW2Hct/A59WyGu6jTkETjsAolZo+kqZd0eW0LkjKiiszpgdxasKoqnZ/deDU47R+bLZp3SCDaAJBZhDuzb+oHm94LpBGFt1xmPfvJGnQEZtmISljJNJ6gsO0q/nqr4XmPrrQzh3Go0lQy816196I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790637388; c=relaxed/simple;
	bh=ZwE7ChO19MfgAKXBU8zu7lNy1ZbWO7zCUyzdgA+jEjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MWfyCTfj2bVW0w/KX45i5wnWrVZvFxCQmQAPjhsAorKR+VwcryKRoL8h9kzsuSk8f20z16nJwjFDFH+2hTcUKxzLTx9jemetL9AtMGsSsq/EJkb9FtSs9/h5lW05mHEaUXNMl8o5jkoLwHkyOIyVg1e+TsT7d1kzLM5YzdFe7bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxiIy4P7; arc=none smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxiIy4P7"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-53336049862so17643911cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790637386; x=1791242186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUQQZM+w0Mla9x5m+1e/QoZaEV04VnH4RUSmoTvL0h8=;
        b=CxiIy4P7KuJVTL19GmGTgnRT1FuAZdiKZYLVXmx0lsXLYEz9bH8Z84GrUtY6aSTd0m
         qUBixQTKKHrF2BYEXMSw2wG+t4xztuX+/AJ1DUz879ruTKFpaGmVFunRNKHtaJnXeAiR
         JH+ZNL2UL1F7dLySyVD3bXP9CIPGIxWZO9+bQcS8M53BEcP9WJp7y34vnjoYam+pP1rV
         FNguUIAevhkxUkipUB40Ft4Maflsm44LuJYq1qn7581PGzScM7xgxpk6kM/Btx9VyKPz
         hc3OgzaXdhyVeh7Fyha+w6xfCEbiKGYjVrDFiLuPdbC4+0sKhzUqNSX12Z2zp17s4thq
         U9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637386; x=1791242186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUQQZM+w0Mla9x5m+1e/QoZaEV04VnH4RUSmoTvL0h8=;
        b=HSiJ7YX5q5bsS1aWwHu5I3Ei9F3Olj4pJn9XB/MLE9QrY7iHpg2u8IPcV2K/hBS+bd
         OrZZ1TxUkJlyu5rju+Zby1UfHql6j5jufQTNxguoTYaFve3SEK3WE2DPzSabLZclTmlu
         mtiN35t4nO51EhHlfWeQv5sBIceorrwdDi0N8Ld6fyu3tIx08dBaUWabwCrgju48DMiM
         hTSBs92lf6dHQQzdyyzG5xGtXR3IbmFrayOfip9bZ60xCnRIIgEK4d13HI8YbWxRdtjB
         XnWrfWtxBs8EyJ3liq+m6YqYRlfoIDHLQnuWNGZtmiy98aGRcXND/1QpOy2GwlKxwINF
         gCFA==
X-Forwarded-Encrypted: i=1; AKwUvBxALDIjZlw2CdGqW0Ahue8AtdNj5kBjsomnXnTo2Aye/Q3oqZWqcoRe5LXZBAyUW30XsvkMi/F0qv168dY=@vger.kernel.org
X-Gm-Message-State: AFuF++l/fWd/D+uxTZmkCAKaTxWKWTL12kzGKZCa87Lxg8mAK1mD/oO9
	2trYn/gRaQtwKjrjXzQTmTMa0Tf6dQoDNhnqPvsaunY0XMz23I+m9J5z
X-Gm-Gg: AYBFou34jaF9FmNKxwgGwIkYYzlKylMVL2IvykVs+tk093dxZjkHZR/jn0uO6zcJojn
	TnSzHt/zCQmSFCg8CCJt8ewBa0aWOc2NHGfUbZRlCHdFcQhtLsfEOa944Xm0aSxQsytfH4zGo3+
	yTnyeh79IDnr31JZi+h6QS2gheUAPVJG60rmCrG44zA7XJqFefrDTeXq6FrtLziiH9cae26mF25
	EoM63pLeRdWgoV5fpM2KebiNGMX+1NN6A+KlJDArYuoaiTDS4WHg6J2K5CJyqEDWkR4GOlXkzdP
	yErZG7Tw9WtSKSNGOJo6ueHDpzsmwpivP3Jvvs5rrA0Zv4HyFSE9KqhAegcPQs4lBcqT8MRzE3L
	wmO01u0jJdXlAVVecIDURsOzgqYKw9Vqr00kH0hnJZjTE6q7nr9J4bw96+0tmXkwSM8fR1ibvOz
	j4KI9yOaTjGrw/YtJ+27OjfMjel8/qkfnn8cZ0uN3oH5Zsn8GTOVyTy8Fi2HlotlbC6t77NSPD8
	oEeO8XN/KcZSQSB+XVzV5HnVsrRZFOLBDW0H+1nA66P9bfOTsMuocDfSlE=
X-Received: by 2002:a05:622a:6f16:20b0:533:3868:1f6d with SMTP id d75a77b69052e-53338682227mr82710961cf.59.1790637385846;
        Mon, 28 Sep 2026 16:16:25 -0700 (PDT)
Received: from PrestonsLaptop.rh.psu.edu ([75.102.77.182])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53322132f3dsm74161621cf.8.2026.09.28.16.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:16:25 -0700 (PDT)
From: Preston Lam <plamlam99@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Preston Lam <plamlam99@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Laptop 15-fd2xxx
Date: Mon, 28 Sep 2026 19:16:21 -0400
Message-ID: <20260928231621.1672704-1-plamlam99@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Laptop 15-fd2xxx (PCI SSID 103c:8e43, Realtek ALC236) has a
speaker mute LED on the F5 key and a microphone mute LED on the F8 key.
Neither lights up, because the model has no quirk entry and only the
generic HP vendor fallback (ALC269_FIXUP_HP_MUTE_LED) is applied.

Probing the codec with hda-verb showed how the LEDs are wired:

 - mute LED: COEF index 0x07, bit 0, on NID 0x20 (set = LED on)
 - mic mute LED: codec GPIO0, active low (driven low = LED on)

Driving GPIO1 and GPIO2 did not light the mute LED. This wiring is
exactly what the existing ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO fixup
implements (COEF 0x07 bit 0 for the mute LED, GPIO0 with inverted
polarity for the micmute LED), so use it for this model. The sibling
HP Laptop 15-fd0xxx (103c:8dd7) already uses the same fixup.

Tested on this machine running Ubuntu 7.0.0-34-generic (SOF driver, the
quirk built into snd-hda-codec-alc269 from Ubuntu's 7.0.0-34.34 source
tree): the hda::mute and hda::micmute LEDs are created, follow the
Master mute state and the Dmic0 capture switch respectively, and the
F5 and F8 keys toggle them correctly. Muting the microphone also
silences the capture stream. The LEDs also kept the correct state across
an s2idle suspend/resume cycle (speaker muted in one run, microphone in
another) and still responded to mute changes afterwards; long suspends
were not tested. The desktop session was SwayFX (wlroots) with PipeWire,
which only changes the mute state through the normal mixer controls; no
other desktop was tried. Not tested on a mainline kernel tree directly;
the change is only the quirk table entry.

AI assistance: this patch, the hardware analysis behind it (probing the
codec with hda-verb and choosing the existing fixup) and this commit
message were written by Claude Code (Anthropic, model claude-sonnet-5-5).
The submitter ran the privileged commands and reboots and reported the
LED behavior; Claude Code ran the tests and read the kernel logs.

Assisted-by: Claude:claude-sonnet-5-5
Signed-off-by: Preston Lam <plamlam99@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 13bc74190..caf1b801f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7847,6 +7847,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8e37, "HP 16 Piston OmniBook X", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e3a, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e3b, "HP Agusta", ALC287_FIXUP_CS35L41_I2C_2),
+	SND_PCI_QUIRK(0x103c, 0x8e43, "HP Laptop 15-fd2xxx", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_GPIO),
 	SND_PCI_QUIRK(0x103c, 0x8e60, "HP OmniBook 7 Laptop 16-bh0xxx", ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8e61, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8e62, "HP Trekker ", ALC287_FIXUP_CS35L41_I2C_2),
-- 
2.53.0

