Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792860599;
	b=PX8yuUFhNWivRD1wBp1ALBbYN4TRmvb/yikdzQRFPbgiqUPx5Lc4UqpQSmd9VzAz2wqR
	 JqXTeqkgSpSe3tZ2VR/zpIMbh7txiFCftBcx+VoeyWLl2Gyda/cxSIL1yvYQZjMnGXJtL
	 Ag7pI66w99oYnfyUt6U62CiWpvj7/xP6yxufxtSSk98lGcaSYv8AuNZ27gU6crejOZ0Sh
	 t49UY3D/vC7KdxXKEzz0Xn9QWDo2p0ZDkSLGmDVaqpwnpFueHyFDT8vFw5/azvodhiTMY
	 Gq0IwgujRukenH4tomVk1tSX18QqJ3o++t4RQlm5lxP1rkTfs3AMRkeuRW1sPV3rUkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792860599;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U2EAEd0xDowYBfsMG0PSIzCfbB2zi7AiM6l3QORkrxw=;
	b=i9ybEbziSQHErKMHdGFfFzDw6N8eZi9Fr4pLA/EfF/X3OafIOET4UkGS0JUaI6NzpfLp
	 fw+73QctYk94vQeqiAaZoqnOj/30/iRNz9Fj6rBuXCBu9xgJnGqp/xDObAN3WJVNXj9Bk
	 O37RKe3ax+OtjtpbHgLDV4RV6ZDqFWJGxspUXGXTHEpAsFObHtS6W3hpXx9RIfZU+7ZTe
	 zwUI6cxS+6ejPaMh+Bu6MCd9L5CBIMPZb1j4GvGyvY9/sDgbLFcZPuWAFIt/Lpb9B+acT
	 2IePs9ypNmPcuq4NxKizEJYB7ZVHoE89gAVBtUX/sfiwTI9BCruy+zJx8maJe5yyA4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtdDmhsl;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC0C606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 16:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FC0C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=FtdDmhsl
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1107129a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792860598; x=1793465398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U2EAEd0xDowYBfsMG0PSIzCfbB2zi7AiM6l3QORkrxw=;
        b=FtdDmhslOYMNt98YhhVrVws1C9k6r+uXUQQlXAyYt3Rj34WmK1xUzy1nE+1bCXbNq/
         7g6jjt26TLklFmxdlapjbcgydhv8BV31zD7X+xQ5+Q7Sin2z58W+zn2iWIOOTQDpgjCl
         cqaXL8BxRh5l6stkUGpJDPON52YpbtMdsaEI8rJRf2KeAEYg2w29FXYmQ1iEL2r/UGub
         J+wGgmZCQ/Ygq2bQamkszY7rK0Vmc4rju2GyNwLkgmmoyk+7ftV2y6pYc+wIP1k5JrW3
         3fp0ta4BAUiIb0lhL8Z5Nvk3Ju/9QLm/q963IyNESXBcvCsEgj15JGh1bcJffgOi1FAX
         qn3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792860598; x=1793465398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U2EAEd0xDowYBfsMG0PSIzCfbB2zi7AiM6l3QORkrxw=;
        b=s2tZ3p3R1YO4HEngAICvOjsvQ/HDOmTYXc3PGIia8azfhfxPq7COJghQdbjYDnTF75
         WzY/jUj3DMitS9XanFvK0QOqi2vK3hQR2ROs6RG5W3KMTDK4moMgCCEwid+Iq67uPkMY
         A5ZPW0ajzWVtdboZ6CJ3aJkx/z+xWZPRIRWIGxPmt4SdbFKa/6di8C36AOwF74Q109So
         ulZAcbyA4LOYci42rS+oajk3cDIof8t7D6pWVib+fnSP9XnfI5beMZGsL8kqWDRCP6hw
         aYZMZCfZt31KhetCUBc31mZ16/VUDx9f0bimlLRdValTf2TlnSR/GbmRD40L4gRYsxZ7
         t0IA==
X-Forwarded-Encrypted: i=1; AKwUvBx5+LM+xeTUIoA+CLbOvdvDrDZpjHQjOI97MTcIJyYsz7XFfuDP6QdwJs3T5DulyMLhFQl2ZwbA3+ypqQk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6enKQHtowrvraMRzi75r3dY6YncQpRrrELrrF0q0jCq53p18G
	SlHvw2MtmSqNmAQTyBEotT8PZ2gF5eGJ7YC1sK1fP09Xx6S0VQFXq8gZ
X-Gm-Gg: AYBFou0k6CZ8HAMpcwMQzTARnk0yUAH65ZFbHDVdnFWIK9hRNYviv/wbDshmsUeLerb
	hlNwNwoo5K9Rkf3bgnUsUwiHfCqfv/fbN/OLVzPqGmTItS4A6hO+MUZUtaKB1KtvGPdt7jHiA2g
	PRTLrPVa28IcIOgLErNpTHYReFE5w9FvE2ahGMfKOsi+B1LkLgDcbtcBWlUh6uYExZGdfErfq26
	T1NQZL11OUSc76FwX+HE3ItyltFS4r6b1vlMMf4VkbE5qiZ23I0CjpeFaM1FYQ4N5aIcrVSFUcD
	EY/kgWqyV9iq2Zn5Vi6xaKv3ZgP8+5qEfV29lxnK6LlXVMrJFQbN41t/PKZAx0yO9jE872KBYd7
	FpjwLkx80P8vRRyAHWZrzGenqiGcBq/PR/APtmYumJYGoAdPKZQmfrEB9RSe5ERo5ierh/d3mUF
	mSJHb3idUOTVzROQXXlATj2muub+g0VyzqInFSS+HTfPnHDAXU/TLwW6c4waDILXo2Kez+yHSUh
	dcWH9Br22f+zV+y2IsOfWzfLSwEYveUU671pK/+Jy6WKzdlmnA=
X-Received: by 2002:a17:90b:1c12:b0:3a6:d2ac:74ce with SMTP id 98e67ed59e1d1-3adeb5a56cfmr1402058a91.19.1792860598526;
        Sat, 24 Oct 2026 09:49:58 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebfa4102sm3406683a91.12.2026.10.24.09.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 09:49:58 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v4 0/3] ALSA: opl3: Fix sequencer timer and channel lifetimes
Date: Sun, 25 Oct 2026 00:49:48 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v9-70247b8436e10e26d324-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

OPL3 can receive a fixed-duration note before its timer is initialized,
and the card-owned voice array can retain channel pointers after either
sequencer port has freed its channel set. The delayed-note timer can also
remain queued after the sequencer client has been deleted.

Initialize the timer before publishing ports, key off active voices and
clear their aliases before freeing each channel set, and shut down the
shared timer after client deletion has drained both event producers.
Retire higher-numbered partners before their 4-op primaries so no active
hardware KEYON is skipped when the primary changes its partner's state.

This series applies to tiwai/sound.git for-next at d74eb09af56b.

---
Cen Zhang (3):
  ALSA: opl3: Initialize the timer before publishing a sequencer port
  ALSA: opl3: Clear voice channels before freeing their sets
  ALSA: opl3: Shut down the timer after draining sequencer ports

 sound/drivers/opl3/opl3_midi.c  | 15 +++++++++++++++
 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   | 13 ++++++++-----
 sound/drivers/opl3/opl3_voice.h |  1 +
 4 files changed, 25 insertions(+), 5 deletions(-)

Changes in v4:
- Retire higher-numbered paired voices before 4-op primaries in patch 2 so
  primary cleanup cannot hide an independently active partner from hardware
  key-off.
- Explain the initial SYNTH-mode direct NOTEON/program-change sequence which
  can activate both members of a pair.
- Keep the code in patches 1 and 3 unchanged.

Link to v1: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com
Link to v3: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com
