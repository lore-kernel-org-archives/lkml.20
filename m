Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363226;
	b=5Ax/NQhX5NV1K7ayEKp9HnTowBf+QGmqudFwlbb+eiRQHeSr5S2FKLQwRnwXpj4S4qCO
	 nqBKPGwiUohk7wkA12z7UCRpPqLoNnl7TUhz+lo+o/MiMMCxNpqWBJrGD9jMg46bjvUBO
	 UB11XcYOO5pZKu5lwSUHYFOABbHnf8bPJkTks81AWVxuCGN8AWZzvTU0CQHTWqqxdWqRO
	 UU2qQtCQC4a7mhsP7yAzqjVHF8yC41MRqTxuKBmXmfFyf3dBHhkn/tuVgZAvSxirWihIi
	 uaCp3wgyBXZhYkSfKVLlehPgRqgasuNgdR96PD6qt5rDpSdGRkWO3z0ntnmslVZ84UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m9zGu7JWDnb8MFoKmM2zKF064vMXeNDalsytkgheG9s=;
	b=Gf8LeDXvp5mk1mWy/nnS87XymYVzLGrFqSwGa2Ah2AWaEYx2nkP/1wp8xmxD/BMnVMXM
	 HccLvONbI8oyqbP4+VsZ4706SKoqiSNvP0ceVaRLMgw7zPQLg6LUXUb60pmJmRMIbtVLY
	 wVCx2A1MB/kDtxomlrMxyAJTn0wmT98GcAZDQg/39BNIUkkJ6AmoNDsQ30Ukllz/Emg73
	 xAeEifWS1LUGftv4xkgzSVVuBtWCFtJJYAfZpRnY/ZJpsnVXtDnQZyh/ND4MBz3hKgmBo
	 cPyH0m9z1Oh/WInHrA5PyojKagczSNFAaic/ZuC6wxdPM8iC9q1g7ZuNdH06XlaSOhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyDxZ0uH;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7904A606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7904A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WyDxZ0uH
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1933961c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363225; x=1794968025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m9zGu7JWDnb8MFoKmM2zKF064vMXeNDalsytkgheG9s=;
        b=WyDxZ0uHg9iFXnk7VHIstHah8vmEOxvhVFf2+4Lh/EtpCt+qce6EHKFRNezI0KctR/
         HIOxS90EQzMXJ4/92o2qtdr8mP9HllyrrlreiBx7PKUtwPVOCrH1qiXmn5ew3y6UR7Ce
         YKEewN8FBr5HSNUOLuZhWYQmHr/Mu8CNKtJOD+6ts9WdWUvTcvBfyjYjQqtgPs1PhZkc
         0d0mtMiKvWYwxXXg/4a/t1swJPlrGAtWSgeQ59NxOMgwsRSxLONZjcqTYYeaVi3MiB/x
         uzgcEbh1BGPDs1MLPFEcBlJt2at3vjTymcGNJUwVr5ox+vaxuBTgEBhJIMQtEKu1MK04
         ARtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363225; x=1794968025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m9zGu7JWDnb8MFoKmM2zKF064vMXeNDalsytkgheG9s=;
        b=qA+xuEpaDWEcfnyhY95Ww1DFI4mmmtH2nT6DyObMcFF0Btozcmm99d9qpX3gKYZ6Ea
         orcTilc3WuprXruQdXJYu6R2zHjbwkP8WLo0QzrTC3fQLllXby5/NiEUUEahfI0ebfSI
         YsE1fmrrx4+Aak+Wvpm0hkXzNaR6d30YF6APx7DSwzasZMoKE24VkRvJx344bPeYbCC1
         LWgTg00KKgg6dqLNgoTPCtDeAIxDayfnkjdTEVFhV6NHRu0YTOciqpW1iLkgABAUiuiy
         lruSt/hY5k7wEsrOHbpsT/FEeB8VqmYCWUaLbXB17JRApSlFui4DOZ51BajIcrDMI1+N
         zhpA==
X-Forwarded-Encrypted: i=1; AL+hErGpMxKlyI0Qw0aYGqZCmi4GZlUU5x1WAwsp/99Cpy/dzquMfPe50Gx3ynFhhh1zYAv/O55cbE+8eme+I5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DVqAj3Y3ZH46FVSFGCgEBa8Ay+CnXgGC3Y2cYI+LvqzGxw+Ok
	U+gyFHfT1YKvtSgFAt3PQ0NxVq6fILvP4ehBhcjcBe2gOGJNxUxXD4N8
X-Gm-Gg: AYBFou0mYEza40xbdrSXHoQc5LzYiHjpL1JS/HDrUUc/a+0ht0/QZpjulijRSGuFIOe
	nOoXGJ1JbYtdNK8CjU5Au8Nx0LQpgllRNrhI8fda40Cu386FHF65sp5NEkqRV8A4XPhrm3GUYly
	qa1UNrC46c8o0sB73PK+l/cxY8/oy7+jImwoeY/nJ7j36hsaT4wL8aaEA2g30H9rujSSTplvi0Y
	0TAJWMoLd8V5F/Ky1m8EHljLNeBmLKBSriZBtTX6M81gtbOWRaoiAmqk1Adts6PVPJquZjjSq5c
	uXa8O60aHbrPOb1PTBeI1iZLXZoBpGm7znmIhG20VmUgXY/l8apGj5tQQcwk7O0E6zUrsPUrf7Z
	0KbdtscefVT8Znum6Sz1jYPkEnM4yu11n5O/EF41CctFXRobOcZboKN6Ba1MuvkWoC9jcJk5sG2
	gpsDwpKP8igWsC6sZxk2/Zyn50CmiCycBW+uxqteG63SousvmrZ1Lw7F1dPVekb2zGqAyacuohx
	UqwiZvAQeDVEfqZLMVFuMta+mz5jOzLqw0xFoGVQFvvEH5JK1bmWnu91xbdwop4+dxmG0cnyPU1
	Fl1I5KpQcvyEqf4o8dn6HGKb0QtWjTYw0GjUMEFcZGB13kRTPl0C
X-Received: by 2002:a05:7023:a42:b0:190:8f72:445e with SMTP id a92af1059eb24-1b3c02f3a2amr1110207c88.11.1794363225322;
        Tue, 10 Nov 2026 18:13:45 -0800 (PST)
Received: from cacher.tail88f0b9.ts.net ([103.36.14.70])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060899asm10708398eec.11.2026.11.10.18.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:13:44 -0800 (PST)
From: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: add micmute LED quirk for Acer Predator PHN16-72
Date: Wed, 11 Nov 2026 09:13:28 +0700
Message-ID: <20261111021328.16153-1-faiz.faadhillah@gmail.com>
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

fix micmute LED for Acer Predator PHN16-72.

Signed-off-by: Fa-Iz Faadhillah Ibrahim <faiz.faadhillah@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a756e0076021..fa78a36bba5f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7553,6 +7553,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1025, 0x170f, "Acer Predator PHN16-71", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x171e, "Acer Nitro ANV15-51", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x172c, "Acer Nitro ANV16-41", ALC2XX_FIXUP_HEADSET_MIC),
+	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x1731, "Acer Predator PHN16-72", ALC2XX_FIXUP_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1025, 0x173a, "Acer Swift SFG14-73", ALC245_FIXUP_ACER_MICMUTE_LED),
 	SND_PCI_QUIRK(0x1025, 0x173b, "Acer Swift SFG16-72", ALC245_FIXUP_ACER_MICMUTE_LED),
-- 
2.56.0

