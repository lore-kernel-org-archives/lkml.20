Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748994;
	b=k5S6Mcr/dCpyARj556NkrGFP6811xx+O7RdQ3+sziK4pmk+1JFC3RU94/MfWbXPEhFYQ
	 8+6b8iV2NnH7f3k8+d9Aoduq4MetzaJh95MFgkNfFKjFv8GdER2B+DzM2c6G13GuQ6+7L
	 dIx2+1xL/0iOmxHU2O+nC+dLAxdjy40HieHdwN/BVctBQJFP3KUy6azNL2X7/zn/nDjEY
	 Fw6GonqcUf4GqA70POoX7yusc3u74PFtV+c/Ox861gr1+kYk3pRvf78RiAKScJb6URlXt
	 x333wAf/l6xqV/Iw8zgGJJ/PktYk/HqLgnefTtVxlWN2TIfeoVetqASskvda5PoDRwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748994;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CjqQPNhZow+JJGKg1R+gp2dO325Gr8fRFWJtkgK9zaE=;
	b=Oz/kfyzYIqAPj9B4lF26Tw0q0MIzF+4egTrshuXiV8zJaRyudjSAda3Ya22THLFj5q5z
	 P6N/RbpIWGKBf8T8OQYyTmA5gX/LJlU7nH/RRSDMI2kvmpU2z2Fl9ixnLGGnZpzyGA7WH
	 CWyfqUhGNxdVDJdqCr14nnSp3G+EF0ksifbmnj8iM+lXVxcbwCy2bFym5OLXqCUjqeNjb
	 lldRQ+FSwjbnYOENcvWVR8GebXo8gOioLXGIrA/Upc3qfpY+/Frt0cdMkmNrDdwHfgChI
	 nflSE/7DZiY0LU66PSbfzmgmptQicuMzlllO0sklaOcFReJkPkH5Kuts4HqhgQeTZsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=sung-woo.kim;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6691606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6691606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so2251361c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:23:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748993; x=1795353793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjqQPNhZow+JJGKg1R+gp2dO325Gr8fRFWJtkgK9zaE=;
        b=ZoIutP4AmnsFdZgpEuBJhaVcEsJ16yjfp23zoOw15NFesH5t6YpeEkOIhkk56dakNH
         ZJ9Qv3oSQh5Su8zton29bK+OZLrvm6A+UAicWIBvtBCyUkZL3QMJK8f2q0V+GhpgMwCv
         gdkp6fDllsGRIpJ6HBT/p0Hq9IY/PF4DRypLTIyHBAHVwl3DXVYpCRxIof0SQ/6jWhZq
         fyes/MQ/Cb0wnjgBVNKSXVpf/ELRxwEMIOCzoR74ANv9tr6f+DaCB5BMJU9PYXpaWKLP
         2mfIQloFg0T6ei/rXggsdzR4822WGl78g6k72zOFrsrKudJq1vdPk3y3bnxb6Vub0Kbv
         FLMw==
X-Forwarded-Encrypted: i=1; AL+hErGIk7G2L4JqNHNfg+Df3JPcqS2qdI0rozgTXdQizuZGkDxBGhp663MI0Ux1Rj+ii6pkvtAn2T+npadncd4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RPHhhOuwlb0VuPC36c8hUCBixd3I5HZUrqhXIbyX4l77F6QrN
	Xz0RekfdQSjgmY74BiHlFASgvrLYkmugrQB4wwItxMgFw47OOhKw5tXR
X-Gm-Gg: AYBFou16glFGFIQAJFwiTSSwn7/Wz/5zU7GCapQSvTCML6rtG8Ern3adYSSItfx1/4N
	QxSt6yYDByvAc4/oSJtNJm0esJvh/VMlTWU8MWMW/hNhMG4mdPAdkUebk/ej7+1UYO5AJ5PSRQP
	O1Mbu/Q6BEekiywjSY7gwyosXq5P2KihHG8DiWdKmK8fxcdi3S/gTXekYJI8B7nW/YTkF0K7vU7
	raC6AtbgoUpcXvI2PRk7FEtLFElCmWNR+O6c4XDnuW4xnP928VkVunqN3YHq/X3+/uZBqGR03jU
	6zVMPE73HHgJWkwQJnJbwfblrADTV0ZFJDgvt8Q7+NvWT5zXMNduZ8+OJFaD0bOPATknQTPzI4y
	CDBF/PrU6tmZT12fcRt0lQn3NupTUTW5fTdUX/bZ97/kuky0LIMhjqg/Sb0ZeE2jUmBCr2giwIP
	b8Vo4dvGCGtt0ZNcRbjLLaRifxDDoaiD63CGG5pTP27pGDhrso9JTgPjKJ/DrhnO43WvRYaIXMw
	+SNf/O7bRLmRNamHj0EDwBunc8kogWJCUADVMSiMbhatds7Vz+EVId3DOG/AWwIhZKxQppi8ceG
	Kl2HmUwbh/vUu3sRylmCxO46L5zKrLqPkchS4jKFNFp2+K7CpBJhgWBB7NUT0RoUhW8wMg==
X-Received: by 2002:a05:701b:2415:b0:169:9f67:a91b with SMTP id a92af1059eb24-1b5030e74d1mr6757528c88.12.1794748992847;
        Sun, 15 Nov 2026 05:23:12 -0800 (PST)
Received: from tofu.taila6b446.ts.net ([128.210.0.165])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm21263584c88.7.2026.11.15.05.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:23:12 -0800 (PST)
From: Sungwoo Kim <iam@sung-woo.kim>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Dave Tian <daveti@purdue.edu>,
	Sungwoo Kim <iam@sung-woo.kim>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] ALSA: hda/realtek: fix missing chained flag in fixup
Date: Sun, 15 Nov 2026 08:22:15 -0500
Message-ID: <20261115132215.4084031-2-iam@sung-woo.kim>
X-Mailer: git-send-email 2.47.3
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

The fixup specifies a chain_id but does not set the chained flag,
which prevents the chained fixup from being executed.

Should chained be set to true here?

This was identified through static analysis and has not been tested
on actual hardware.

Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
---
 sound/hda/codecs/realtek/alc269.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 96fa8c2782bb..1be2e609c28d 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6431,6 +6431,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1e, 0x411111f0 },
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_CZC_TMI] = {
@@ -6449,6 +6450,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x20, 0x8000ffff },
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_CZC_L101] = {
@@ -6467,6 +6469,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1e, 0x411111f0 },
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_LEMOTE_A1802] = {
@@ -6485,6 +6488,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x21, 0x03214020 },
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_LEMOTE_A190X] = {
@@ -6497,6 +6501,7 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1b, 0x0201401f }, /* front lineout */
 			{ }
 		},
+		.chained = true,
 		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC256_FIXUP_INTEL_NUC8_RUGGED] = {
-- 
2.47.3

