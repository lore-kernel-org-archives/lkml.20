Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B614A37F312
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334825; cv=none; b=C5KO8jxAVf4A+iIu0rPB3kODpOq6JO0qdpw2L6df+BWOg6TJ4Of+ReejxPyaGIzn9+D2mlwKyK+TSn9AUFrHwI3plFofysBfDascjCUQoxuOkVAZC6MWK6bdaGwOJrULym6tGrsAjLCfSd9+BmWv7ZiOP0gwQtiFiuMAfSw5ats=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334825; c=relaxed/simple;
	bh=hEbiDWALcEk6t+gh196c648EmC91vs4qbEzAk60h8pw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IL3dUlOV/PO45EZrZmssC1Zv+e5bL0ACumUHKrrEuH0hONXx+K18jIaWpR7QPj4PM+j4SzjNHzjoLMZDnHTdQx6ON+hBXYMwkVp8+Ta5CXmSowoFNBZ8qd9UnGxIAl1NHaiHIyqzoSW2gAxW1f+mQt5kYFIu3BeMKDOMDo5h4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfjiNquN; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfjiNquN"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1006379a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334824; x=1788939624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXcpK8x3d/kSx5MzpGpR7YXF+3TtZnzr1snN5gFSm2I=;
        b=TfjiNquNVd8vlmz9Tssg+fLYvZ6osrkU53RWPYsEg7xSWmhsk3iwCf+TP+1RyLJGkn
         MjSpfqQh1dCKDcgoLgcnxgy+EGMDyKqFMBx3wCwaSM36CcJ/JpKRs0/f5LTKFeXIN2Ad
         qeoCCZCZ5hzGS+lD7FklDwh/CeVzvBqzwRdw2VyXs3XTYqZ9dFv7Z91ccmBIcNG21SRe
         1jMUPQLoNBQnp0UqvPcrFty2oZLO64D+yXHrMgs8sgeIL2Xc6RtNRJ37D0WwO6rwB21+
         08Q6UDFxyqVBO/NaAPpRN/dz1JEABxRTYdtGbO6JlkIFhm8qJWTaVquakp+Gx5SgQwN+
         UlXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334824; x=1788939624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXcpK8x3d/kSx5MzpGpR7YXF+3TtZnzr1snN5gFSm2I=;
        b=W7waiWxAIqq0TlvuSLwnqVLPd6Bv0StbTKop+32IjHXn/K5+GYYCNpsDHAT/6/PYHo
         /lg+U8JJJU2r2wYVsFzcoO56FBZwm80EI6BQsNtMC/naaoRjSHI/MWCrqjEP3mg7Yyog
         zbEOKmSiO7AhK3LPEnxqeA23zmh3DWtOjcIS21PGvv15StxIiT5dp/AQNGj+izCkECy1
         bBP2ZVShBKnsLwP0gr8bBx57VyND0kaB03pzrT9x83OexUXSrJeOEvpvMxhDyxya0W2j
         jL2NID6aAq2qUkZvaluxmJQlNl+KA31gzwJyzlqLqrLOXIxBNKxo26EEOEOjg53tQMsk
         92ow==
X-Gm-Message-State: AFuF++nD0CrochwKIJ+hb+TH0SV2lBpTC3aGBFSynB+v6caYDQu6mLKt
	e6UeSpUfDGYyQEGoBsY2GTR+8+VS52MbPJH4+2t2DWstQ5U4Nn0O0oZY
X-Gm-Gg: AYBFou0YzVm8UCFy0I36UmTS3D9O2iFGlwhPSzfbxiMw3XPMtVocJG9f+13c+WQlkoQ
	dYhU3wP9lZdxFBtAl0KmaaBYGv78vnsef1X23/FuET7wgEhthdj+WcMIyAJnZG7VdIwzjFPs84G
	B0DW1lvYMutA2EwQb/I23Pi0F8B3AZwablEjp1qbBX0SaHF23AqFUxNeZQcfr6vDAUG5RtSyVqC
	hBPZ1W61ApFdFrUUzfW86DBJekAJsPDamRmWoU74cHJ9jZ0hTfiXDQVjgayYp067qOOYB/r0q9h
	sQBDxnfT1N9wh635cwK/Lr2I608un4KtzgURhOazT5+hpsEZZtlnBVHIyUKG1is469zKN23cCBq
	iZrXwY77NDA7QBxhu9ov6OwdRcnQq0FedGZa9F2YhXcO907WA3u3Meo91j1CQ6ASpKmEbqSRJhh
	x1dZJZW4W5Z6qsRG0YqFbfcau1tuJhyPlaI7brLyqlDSbmG0T3c+q9NuBUeP/n
X-Received: by 2002:a17:90b:3805:b0:398:d843:cad9 with SMTP id 98e67ed59e1d1-39aee1c74a6mr3430385a91.19.1788334823792;
        Wed, 02 Sep 2026 00:40:23 -0700 (PDT)
Received: from cqian-s2.. ([175.159.214.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae3c6e8d7sm4336775a91.15.2026.09.02.00.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:40:23 -0700 (PDT)
From: Qingyu Zhang <usupergate@gmail.com>
To: perex@perex.cz,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH] ALSA: ump: do not touch legacy_rmidi before it exists
Date: Wed,  2 Sep 2026 15:39:18 +0800
Message-Id: <20260902073918.880245-1-usupergate@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_ump_parse_endpoint() sets ump->parsed on every exit, including
error, before the caller attaches the legacy rawmidi device.
ump_handle_ep_name_msg() then treats parsed as "legacy_rmidi is live"
and calls ump_legacy_set_rawmidi_name(), which snprintf()s into
ump->legacy_rmidi->name. If a UMP packet arrives in that window
(IRQ path from snd_ump_receive), legacy_rmidi is still NULL
(KASAN null-ptr-deref in snprintf).

Guard the legacy helpers. parsed only means endpoint info was
parsed, not that legacy_rmidi exists.

Fixes: 37e0e14128e0 ("ALSA: ump: Support UMP Endpoint and Function Block parsing")
Signed-off-by: Qingyu Zhang <usupergate@gmail.com>
---
diff --git a/sound/core/ump.c b/sound/core/ump.c
index d183c8a000bd..3d1a2ed3b476 100644
--- a/sound/core/ump.c
+++ b/sound/core/ump.c
@@ -1335,6 +1335,8 @@ static void update_legacy_names(struct snd_ump_endpoint *ump)
 {
 	struct snd_rawmidi *rmidi = ump->legacy_rmidi;
 
+	if (!rmidi)
+		return;
 	update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
 	update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
 }
@@ -1343,6 +1345,8 @@ static void ump_legacy_set_rawmidi_name(struct snd_ump_endpoint *ump)
 {
 	struct snd_rawmidi *rmidi = ump->legacy_rmidi;
 
+	if (!rmidi)
+		return;
 	snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
 		 ump->core.name);
 }
