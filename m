Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898C341E6DC
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959572; cv=none; b=GPtkBmnqHApjQ40/049Azj8mKyKVKf5X8+XARE5uPm3N7LdPnMqu4zGDXxuk1WFmVxuGkMXLHC3LtMECXgs/uq71BYAx2ohh/5SRnp3B1X0TL+gthmilBDwnPA7MBa5+gsLUQ3xKbFZlI6Xu2nypoWdd7/yGATbfr8D7j6h8Cdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959572; c=relaxed/simple;
	bh=ZbHKo6p6vHoGYZ7aFY/8EMx5pvZqBn9CREyLa80JF0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OwRJW4F48SHBw3cj8orPzeLX3w09pL+Dgk5MiuSjOC646HNdsOLO0PlHRB7k8/GjuTb01zS6G5zHZpWMGZDMIMZ78l0wDr29cT/iumc4Y1ALQU2kynGYuXNR4TVKk5quZ0euBz0n0/B4WG7shPL/sScTPrFPmbdlUkwoKUyRx24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJrfSQo8; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJrfSQo8"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38759bcd877so2304157a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959565; x=1792564365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ysKN40C6ry6pqGOkJN7oQoGDbadfMse/W21xEe5fzHU=;
        b=MJrfSQo8SYPr9aEO8pUL4EOOf9jZFwHIordcIijqOmc13RmEoJaCimyK1zsiYS0Rb0
         PueXwgsQz2GPFw3G++56zo6kvoyEPtIus2ZndNtFlrP7B1Nx8Q7AJSM5wkBZSh/ksE0J
         4aC70Vc5PiHyjUKlNC8QgHRXAYgVPBV+oz0SRONcp4b2mQJoRIbaJY1zMGDgqvCznylB
         pXSa+I3zm827FZzt1f2yVnBQnVshIjJUm7rJI23F2STOHStuUOE1rfhXeRNkjQqCj6Uu
         ZJwC7COIhCedKTKT7Mrm0PxJpLOkT8/ywyWai/wmTqiBzhQR0qzzDL1iGRi/VoEduyAM
         4ehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959565; x=1792564365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysKN40C6ry6pqGOkJN7oQoGDbadfMse/W21xEe5fzHU=;
        b=Ll9QkMDUyY51H5MQvfJs/kl+JmyjRvLuG9p7gTIejAEWPVrUXECMmoCoDQcgry/0Ps
         njd298XKclsSsQ8FcNVH/nrDhD7CB8psudCWKpEdxDD39N4VYWslzDqzWvwt5dZtB6VZ
         VodoVTigskLSqTfC5hjuZsc6PL7/SeW6pEGLUbbbMHXymTc2oa09aJx9xeJFhqcCcKle
         fxAbPLi82Mppmmv06qULQWq5fTrRgV5iLLUFgvl1xV0YtMeVj6ZCXNdg+DKaY45su3aX
         IUH9ZC+U0EvezYiPdniebOkDJC6lITxHoWYDJ+iH2RP6UlnrR0HH4NmRn2LAbpz/qDL3
         2uMA==
X-Forwarded-Encrypted: i=1; AKwUvBwm2s7LsFY3/Sb5siEf0q0NoU94ovM0HuQuPoD4X4j3F41uFh4LV8e+vrUyVFvV2NX14tTYlArS9Gj/Z6g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVN9gMiOKPaFOYf1PUQ1P0eOl6/sPrmkzJaQEUECfYz/jR31ce
	nY9M169Vg63voxpyxWcb7nsW0E4Zt5ZA9ansjahb/jDSdMGb3Dw8XcZ7
X-Gm-Gg: AYBFou341bgQrshjC+AM8W2jiz7B0VbSFqBUCgFboMZY1wWVui5g+hqnIgEiUSO0EoN
	A4rIs8bh4mHN/58UG25aaqo5IgxAuvZX6QRwWmo/11r5mcRz2EHawM++/5iHWKo2S0mMTjpfUS0
	hPSt6d6IMOVcErJrJRxHNrJER65f8aCLnRUQmsHJDRVZPQntkBjqTyWI3rilHhZJHoJOeSDY8nq
	i9TlIB0aTrSBiHid65VD4R31Tn/VjHFqmdz9oz5ckwiZHjIGf/h/CD4+JkVqTEClH1bawRiWLrd
	txAlqW27UsEc3As3tX+cdKtNiw9G82QFIaY1K9HRpYO8wZ8hvKRxVNSlJLna1giBNFSuiMBriQj
	LrMKuUvrblsBQcgXQ5n0U9vLjQlbk7UTgbrHeB+CCi1Odm8vNF3AfINXQYIz3WJIzjICvjkv4tP
	/nxYkXPsqQlbaFAi/i4FnDmb2Pw4p2ihEnZfoKyTSW7hI2fVFu+1pHhnyc1tN0E711wN3e3Vfb1
	dfnGcWIrXBtXjyYmXVwd1j47FU7Pb7zU0OiSGpqoxBGfJn4UkR+5zMqyqXqIi1rDG3wTsa/YYZO
	FYLKZruNdQ==
X-Received: by 2002:a17:90b:1dc1:b0:39e:4c7f:7304 with SMTP id 98e67ed59e1d1-3ab3ac9f622mr10629302a91.27.1791959564784;
        Tue, 13 Oct 2026 23:32:44 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac600a0619sm3384495a91.7.2026.10.13.23.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:32:44 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	ckeepax@opensource.cirrus.com,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/13] ASoC: codecs: Fix Wolfson control definitions that write another control's bits
Date: Wed, 14 Oct 2026 15:32:27 +0900
Message-ID: <cover.1791959026.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These are more fixes found by the overlap scan from the first series
[1]. In each driver a control writes bits that belong to another
control, or writes the left channel bits for a right channel control.

[1] https://lore.kernel.org/all/20261008130953.2446692-1-sammiee5311@gmail.com/


HyeongJun An (13):
  ASoC: codecs: wm8990: Fix definition of right input PGA controls
  ASoC: codecs: wm8990: Fix definition of LOMIX AINLMUX Bypass Volume
    control
  ASoC: codecs: wm8991: Fix definition of right input PGA controls
  ASoC: codecs: wm8991: Fix definition of LOMIX AINLMUX Bypass Volume
    control
  ASoC: codecs: wm8983: Fix definition of ADC 128x Oversampling control
  ASoC: codecs: wm8985: Fix definition of ADC 128x Oversampling control
  ASoC: codecs: wm8994: Fix definition of WM8958 noise gate hold time
    controls
  ASoC: codecs: wm8955: Fix definition of Treble Cutoff control
  ASoC: codecs: wm_hubs: Fix definition of MIXINR to MIXOUTR volume
    control
  ASoC: codecs: wm8737: Fix definition of zero cross switches
  ASoC: codecs: wm5100: Fix definition of EQ3 Band 1 Volume control
  ASoC: codecs: wm8750: Fix definition of ALC Capture NG Type control
  ASoC: codecs: wm8510: Fix definition of ADC Inversion Switch control

 sound/soc/codecs/wm5100.c  |  2 +-
 sound/soc/codecs/wm8510.c  |  2 +-
 sound/soc/codecs/wm8737.c  |  8 ++++----
 sound/soc/codecs/wm8750.c  |  2 +-
 sound/soc/codecs/wm8955.c  |  2 +-
 sound/soc/codecs/wm8983.c  |  2 +-
 sound/soc/codecs/wm8985.c  |  2 +-
 sound/soc/codecs/wm8990.c  | 10 +++++-----
 sound/soc/codecs/wm8991.c  | 10 +++++-----
 sound/soc/codecs/wm8994.c  |  6 +++---
 sound/soc/codecs/wm_hubs.c |  2 +-
 11 files changed, 24 insertions(+), 24 deletions(-)

-- 
2.43.0

