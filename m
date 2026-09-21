Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E0230E838
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789958450; cv=none; b=Tdcw4NTciAKgisRiKuYL6CwxLBu4UhAdZCVHXxzt7k4J8FiIawSFTVHIG5Tsa06nG3Ss6cLEFwEQTUSZo/oa6ESCo4EMnSzk36SJsidB25AZv3a7libe1HTwN+77DFGX93kqvsErSw8fBKDXiCcGLm7jz50RvK881wxozZif+ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789958450; c=relaxed/simple;
	bh=dnn167SjliHZ3+2HgYfhJm06KJ5BUtAwQ74yJR2gUu4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjdzKf092sgPsWipuvkXnO5zcg/pyYkjOa7z3bTeLwsZFpSYb7M5MoQ/y8MMNxM67oC0hwjBtf64H6eC/1H7nUDcyKbnWilUfcNpjPcdzDGkZh8gHQAr9bAJH3kzzSagrAT4iVPmhVfhETxMIVDkVgCn/mN/k94F8gh3+tMxZfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyL4y2RX; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyL4y2RX"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfc6db0bso22615746d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789958448; x=1790563248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1OyDavOh5ODDbB86rDKnFpt0r7GVlU1nYGe54SQyoqs=;
        b=iyL4y2RXD7Mc9ymCiHyBNS6N9oskbZFmTOTyZL3PDpste2oJ2u7io+QOUUf5nYh8oe
         cNpb0mqPLCcBfuhm4Ntv1uEELvSQlIZyHIapjmXYJMcVZBjdsraSespQFrhcvZBnwTKT
         ktH7hG8JzumEqjR8Z3c7enkeMI+YqDvSQI39AkCH1GncC7hG+vdydEGYaxwnhR7bNEp6
         pl2D5RrUQ8TgdtCmimdzrdvBx1I040WRGZgC7Trdokl8kFEQpSQPuPVQbZ+3VISqex4/
         1cI+cgDepzYqcEpxpzb9zsK4gQMbhmg+lyaua/c7O9Qc696t/6TksIrbo4OrmegNxIu9
         Kdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789958448; x=1790563248;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1OyDavOh5ODDbB86rDKnFpt0r7GVlU1nYGe54SQyoqs=;
        b=q0ZduO9QdlvlhSfq0jDYeCN2J5y5I0fZflN/fyo17yDE7fiKCH/6TQgHfM/vt9yPXw
         XkeLy60iizxzti65JjDTaN+mhJiaH2u9cIixgIwsZjBnB5vbXwXauBZmCDDi1GB4pGtD
         wrz89mLV46pvCTtJG8xm/ZlftrCeTbtKsfgBvncLqZLhuuyx9ECDxjDk81gqghZDqeSK
         FGRPwEEEP6uM4jvAVBVBvG+rriRyTR3Bn3QQNg9V/tRuZn83TxrOPMLD3QBgpnCnQ2i5
         AbJiELFy0yDBu3W2tyF1pJI3Qck0HRXSwGLpMhXlcPQVdvpac0r8Ooov339VahalmQnv
         ODYw==
X-Forwarded-Encrypted: i=1; AKwUvBwMnG5JlMd622E/t9hzxSeHdQg/McQb06mdgVNOHYbhN1tJonhIQM8Lg/OJxlwiA+GVijViqGSOAxs8+5o=@vger.kernel.org
X-Gm-Message-State: AFuF++mximKOoCmYYVrTvWz8Z6ORvHRW+qeKowroXqJxa7fkQw5DII8t
	ns/U+gCuj27qZlBi0jkEsV1rMRNjRIz2jVLXSq0Tkx075aP7bRhoyHER
X-Gm-Gg: AYBFou2KztvGp6Kf/Vg4rpoL3cObJhnPomiMrTnEsDGTJPeJR6T8gQcjZaWdAb8n6Pb
	koiVDaOiRDu5DdHFjuCRRRqBvoLQbummP0K3pCMdjUG2hw8s0izr+goRTm82qYcacNlIm74Xkaz
	EHkZhUVuvX7cFlPsn4BLrEO9gTZdMelNXyoYIErNNODLz7TXbWtrhDgqK2RNnzuvtSsg9ZalCgz
	88/POuA7xdnWq82tPlwK+Ai048NmsVH6CnVUsdZuktH01DNGZVKqZUd5xCOUwScfKNNGykmGk2h
	LT1ZQsZ3Iq9jtxSIhd4zi45/pQjJtTezw2dYLtgSncVe3dwsvmofDhDLIUWF94ckYg59iHCQi/c
	0GpINkq0+BWwPQbmywxngPn5NVxiBDG9oTIooB0x4a0mhbGj7uFFUTynCPbU8PnM2YixWPPQ9AW
	/zXOWo/yYhB0XgsOY8/RL8i5wnmh6yLQUBLqHHyWfTi6Q+dg7W9/lKIWpide4CLUoUsnQLA8UMn
	WT8T5cXR7TQUBnF0Qc=
X-Received: by 2002:a05:6214:4a92:b0:912:517b:842 with SMTP id 6a1803df08f44-912a803dd5dmr92522456d6.38.1789958448163;
        Sun, 20 Sep 2026 19:40:48 -0700 (PDT)
Received: from matthewjaybarr-png.lan ([199.79.241.62])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a30d13sm58291716d6.11.2026.09.20.19.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 19:40:45 -0700 (PDT)
From: Matt Barr <matthewjaybarr@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matt Barr <matthewjaybarr@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Match Yoga Pro 9 16IAH10 quirk by codec SSID
Date: Sun, 20 Sep 2026 22:40:11 -0400
Message-ID: <20260921024011.2115055-1-matthewjaybarr@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCI SSID quirk added for the Lenovo Yoga Pro 9 16IAH10 (PCI SSID
17aa:3846, codec SSID 17aa:3920) also matches every other machine that
shares PCI SSID 17aa:3846. snd_hda_pick_fixup() tries all PCI SSID entries
before it falls back to the codec SSID, so those machines now get
ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1 and never reach their own
codec-SSID quirk.

The Lenovo Legion Pro 7 16IRX8H (product 82WQ) is one such machine: PCI
SSID 17aa:3846, codec SSID 17aa:3884. Before this quirk it picked
ALC287_FIXUP_TAS2781_I2C via the 17aa:3884 codec SSID fallback and bound
its TAS2781 amplifier. With it, the codec never binds the amplifier and
the internal speakers are silent:

  snd_hda_codec_alc269 hdaudioC0D0: ALC287: picked fixup  for PCI SSID 17aa:3846

versus, on a kernel without the quirk:

  snd_hda_codec_alc269 hdaudioC0D0: ALC287: picked fixup  for codec SSID 17aa:3884
  snd_hda_codec_alc269 hdaudioC0D0: bound i2c-TIAS2781:00 (ops tas2781_hda_comp_ops ...)

Match the Yoga Pro 9 16IAH10 by its codec SSID instead, as was done for
the Yoga Pro 7 14IMH9 / Legion 7 16ACHG6 and Yoga Slim 7 14AKP10 / Legion
Slim 7 16IRH8 collisions. The Yoga Pro 9 16IAH10 still matches, through
codec SSID 17aa:3920. That codec SSID is also used by the Yoga S990-16
entry further down, which will now get the same DAC routing fix. That
looks like the same product, but I could not verify it.

Fixes: 41d60cbfde10 ("ALSA: hda/realtek: Fix bass speaker DAC routing for Lenovo Yoga Pro 9 16IAH10")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=220540
Signed-off-by: Matt Barr <matthewjaybarr@gmail.com>
---
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8164,7 +8164,10 @@
 	SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", ALC287_FIXUP_YOGA7_14ITL_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_LEGION_Y9000X_SPEAKERS),
 	SND_PCI_QUIRK(0x17aa, 0x3843, "Lenovo Yoga 9i / Yoga Book 9i", ALC287_FIXUP_LENOVO_YOGA_BOOK_9I),
-	SND_PCI_QUIRK(0x17aa, 0x3846, "Lenovo Yoga Pro 9 16IAH10", ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1),
+	/* Legion Pro 7 16IRX8H shares PCI SSID 17aa:3846 with Yoga Pro 9 16IAH10;
+	 * use codec SSID to distinguish them
+	 */
+	HDA_CODEC_QUIRK(0x17aa, 0x3920, "Lenovo Yoga Pro 9 16IAH10", ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1),
 	/* Yoga Pro 7 14IMH9 shares PCI SSID 17aa:3847 with Legion 7 16ACHG6;
 	 * use codec SSID to distinguish them
 	 */
