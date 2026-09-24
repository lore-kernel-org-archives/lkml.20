Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091973C5523
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261212; cv=none; b=cX80enmW4voYBYJQhlQvu8OZkUUr9P5fNO41Y5B90yU2ceALgKBPFxy+sQ5PuCpo1mYTSex2pMZDCT7g5EJXi3ntdAX8N2r0TpZ9kFGZMlx2Al83RYQYdT5uktImGeK+B3Ie8iYiw32hT37iDYRj1vi7zD9uRGuKf+wU+vzzku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261212; c=relaxed/simple;
	bh=B+JoUJuIixBjDkxhNHcVdHhRksB6waDTN8P/UE6oveE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fn3ed2rZG27yGTjGfl7xvMLG9RUsojF5KUJE+dYw9gT7rxHywd91wfETsB2hFF0dB0ImIEM9AyWlp6RCcJ35yhd5PhYK7gSQBSAazLvwI4ajC2nGfSDQZFC6OshaDV3ay1uXoL9G3q2E9D7Z70HzoK/QVAHjWAgmlMc2mvpuxEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WZeHv3/+; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WZeHv3/+"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d90ba1d807so20427605ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790261208; x=1790866008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qvbp6E0aGuxVVQ2sKaEGsmFQZRaCvhSjNEbb/Y+XMg=;
        b=WZeHv3/+SDsc7pDhilGqCSm6FZZIN701KzX+vT1GKJRSfsjnHTOOGuC8siah6hhX39
         EePYD4F0yvXuuys08boYPrgVUO4v/V+FBAFUoBjw8sr1RiPJ/s1+BvXmIhTzUZAqn8QH
         jSYWgVZM2Yft7dLuiaT4qspXb8yhdwLT/LyFwGWGDEGp8mEf9aS/Lw5lUmx5KLMa+o9S
         P1lhVJELwYWy1ZhhyGCZCfthzkQi+gMSHSV/hJIhxFek+V/BxLzvCuIfQjlaU9Zl+Yyq
         OxTnvTMs/pg2QTEba5LrR9+MHOz7y6d+jQgumJ6SgUECcR0aEmnfjjZVrxQWRQUbwHDc
         swWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790261208; x=1790866008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qvbp6E0aGuxVVQ2sKaEGsmFQZRaCvhSjNEbb/Y+XMg=;
        b=jnrywCUr0uigmdLtm0Z3j5m6pgvLl0Qi951t4nsLVqxgLiaQvWlRi6JSUia7b/BveC
         fH2ZFh6viRlXNqKvNHcIE/d6mG4ifhjfVKhk0YId6YzdUdaOr4zhDSsNMkL+GV+/ChIR
         psyG/swVPMgRwfuwDJRtToQaTBUdxqYcp4hbWCVgfCbY4dZZe72SZw9C/5FYgRQTFg0W
         lOtX6Jo94TqhRyJIEOQdsRhbK/BAtfd1Yw85fK536uKKHbDXjl5va4ycuoZkF1oyQzQ6
         GOEzIYomGzUvpbKUeKglxtNgoH7uM54k4sHzxWpmrZuJySyHLcmfW+rTYTPXdGNCGPAX
         ZeMQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2HeGLX/FWu2NbLaEpG4F+V+yFoulrVSTyMDrOTlYmR/Vw/x2jWK1Sm+H9q1vibET2TyC7yQohHWdXmOs=@vger.kernel.org
X-Gm-Message-State: AFuF++l3BnfmcFMNf+kHJEy194ZOaBaYvE5cjIfpYhGGj6aKK0hm0yIf
	nVdXXad2M9WL2FFKodmtpIFZPZGP2JT3mcgeU+7xxXMVuMDA83BHPRzW
X-Gm-Gg: AYBFou00EL0NAAU86G9c68SepuWoJY9i42wukWIsgUmtw45/1pDUowYAuYSQSEFiivx
	Zr0eGQxy02OhxkmXXDck7ussBruFi4ZODQRt/BGRyYn+JUeYj6AqCc2OFRssQRZUejLVbDtfyr/
	9CX4v3E5Evb9x/kLZZ01HSVI2F3x9qyeYsf+d0o2bYX3GQDXw1//wzZ1C/t0bSGFhqLI0NEbcfM
	04b0F2N0BB+J6MY5R+WqxW8gZ6y0jYzXHd1nwO9KIcY13LI7vhKMWXI2fVDP18D4VOx0iU2AoqJ
	ZTWALTVFsS1tJh1a9jUeYMGcez/6Ja3wNtUAcuinBMPYmi88KFpSUjj5+8XqqjNQuTyzDSl7QgS
	01F2mJzHjpUiCl3nlM2kaBMQkwvU3roqiMOQpYkDusjCfs0slKbfcGIjODsQ6Qp4+ptcLvj/5A0
	6WwtBAQcFi0p2Id5haI5rl/tL/k6oGFZXl1RrChCNxBDtPNypx4VminXwSnQXlQcfj+BZsNm75O
	QlfdNHRoyKr5pJ6Ag==
X-Received: by 2002:a17:903:390d:b0:2dd:c053:a6f6 with SMTP id d9443c01a7336-2df7dc49a92mr22097905ad.40.1790261208005;
        Thu, 24 Sep 2026 07:46:48 -0700 (PDT)
Received: from localhost.localdomain ([118.179.89.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f66b3sm28850275ad.73.2026.09.24.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:46:47 -0700 (PDT)
From: Muhtasham Nawr al-Mahmud <muhtaseem2005@gmail.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Kailang Yang <kailang@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhtasham Nawr al-Mahmud <muhtaseem2005@gmail.com>
Subject: [RFC PATCH] ALSA: hda/realtek: Fix speakers on ASUS PM3406CHA
Date: Thu, 24 Sep 2026 20:45:12 +0600
Message-ID: <20260924144512.3989-1-muhtaseem2005@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ExpertBook PM3406CHA uses an ALC256 codec with subsystem
ID 1043:1664. On Linux boot, the internal speakers are silent even
though playback is routed to the codec and the speaker pin is
configured for output.

The codec starts with coefficient 0x10 set to 0x1d20. Writing 0x7f20
to coefficient 0x10 immediately restores internal speaker output.

This was reproduced on the affected hardware from a fresh boot using
hda-verb. Reducing a larger initialization sequence showed that this
coefficient write alone is sufficient; no GPIO, EAPD, pin-control, or
other coefficient changes are required. After applying the coefficient
in userspace, speaker output also remains functional across suspend
and resume.

Add a machine-specific HDA fixup that writes the required coefficient.

The fixup has been compile-tested, but could not be boot-tested because
the affected hardware is no longer available.

Closes: https://bugs.launchpad.net/ubuntu/+source/alsa-driver/+bug/2162718
Signed-off-by: Muhtasham Nawr al-Mahmud <muhtaseem2005@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 5127a111c59c..89679ed73484 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4384,6 +4384,7 @@ enum {
 	ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET,
 	ALC285_LENOVO_DAC_RENAME,
 	ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
+	ALC256_FIXUP_ASUS_PM3406CHA,
 };
 
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -4481,6 +4482,14 @@ static const struct hda_fixup alc269_fixups[] = {
 			{}
 		}
 	},
+	[ALC256_FIXUP_ASUS_PM3406CHA] = {
+		.type = HDA_FIXUP_VERBS,
+		.v.verbs = (const struct hda_verb[]) {
+			{ 0x20, AC_VERB_SET_COEF_INDEX, 0x10 },
+			{ 0x20, AC_VERB_SET_PROC_COEF, 0x7f20 },
+			{}
+		}
+	},
 	[ALC269_FIXUP_SKU_IGNORE] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_sku_ignore,
@@ -7814,6 +7823,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x1652, "ASUS ROG Zephyrus Do 15 SE", ALC289_FIXUP_ASUS_ZEPHYRUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1662, "ASUS GV301QH", ALC294_FIXUP_ASUS_DUAL_SPK),
 	SND_PCI_QUIRK(0x1043, 0x1663, "ASUS GU603ZI/ZJ/ZQ/ZU/ZV", ALC285_FIXUP_ASUS_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1043, 0x1664, "ASUS ExpertBook PM3406CHA", ALC256_FIXUP_ASUS_PM3406CHA),
 	SND_PCI_QUIRK(0x1043, 0x1683, "ASUS UM3402YAR", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x16a3, "ASUS UX3402VA", ALC245_FIXUP_CS35L41_SPI_2),
 	SND_PCI_QUIRK(0x1043, 0x16b2, "ASUS GU603", ALC289_FIXUP_ASUS_GA401),

base-commit: f49a343b305c0b6c19a3b50c0bbf10bcd0e2e8fd
-- 
2.54.0

