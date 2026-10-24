Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792842084;
	b=ro3+PmAJpUYS7vfvYPICYSDnG9Xp8fYBcMDQ5TZMe+OSlbwpM4PiyQG+UgHLC14s5yHB
	 0McAA3MrDnPL5qtR0ZgJZC/5fnPtctPw3TeBKHtcA9jDH5MPmJOcBUQ7XtRvjjzb03BHQ
	 YEsmduHv3byGGmUIeMelf6/khfG0EpoNC1TMTdwFrvcWgNyUA5Pc+zO2R56N1MHKHbT2B
	 1+z5dn3c4U/v19i2+IcS6RwnBnQhupoRGcUEtxSUlSlzLcOVa4PX3eCpH/645iW1X4m2D
	 LXIfvOUTjUQBcTGWVzwoa91IZxkGBfJ6HiBKGwXX2H8G51oDgaL2RnMK04hSh7hoL5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792842084;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nUL6W0Nan8tO+oDd4RvDtN/T8g9yBmsnWSek2hObBhw=;
	b=wQ1zGPK7afoJVvcONMhjIWq68U9xh1djU0qqoaqK1JxeTZw/lXAibtagaDD2hGakwKuR
	 9+MYxuKonN1pigN5L7tmzyIGaantFzqhWx9IvCgxOqHfRM6MK0LxsChPzsmKPg1ImstC8
	 L+i6RLA8pVNwx5JRrtiaazRdDjIHwOGoYxu7XXWYOCK4elltscwfPpJNbVqAi/Be075Cv
	 Kw2UXJzcWAXHsg+KRW8Q+slqejqS3nJ9ZgjGAYGt9StL623dRRFcJANP6bXwthLPM4toZ
	 tfOuApPJfjCTQb8LunwFAK4Rtwnodlwjg/X+so0rNAhP5vvjtkwW5ApzToe5j9Rp1Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ul7mAQjR;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54288606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54288606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ul7mAQjR
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9d1114320so12391755ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792842084; x=1793446884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nUL6W0Nan8tO+oDd4RvDtN/T8g9yBmsnWSek2hObBhw=;
        b=Ul7mAQjR/aGU9E+NkyyFecLFKA7/Laz7UuE1FiMSJFvx4gkI00/WS0f6IgkKUr7orG
         4ISiqwF2rDLYwVvDl68T4u3Qdwi8dQTWXlhd2AONAKMS72qeSp45RsXvU7s8WvftUWEz
         UKsFaR7PGVyttoarVnZUBQidAFPiRThmSOz9ou+Mf0UsYDKj/BrRJwa6CJxMjDWlAr9H
         pToY1Po3jMAq5f5nqFGOHj4JLQALVfdBoX+rQr3mRJOfHH7GDTV3gHT4SE7UZUYYOZ+a
         H+xYUd+926+LRbT/jXqefi3+0EWrfedyl3zWibh7LUx+f2w24Sr0HLhkOqUIALk2Iq9m
         MwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792842084; x=1793446884;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUL6W0Nan8tO+oDd4RvDtN/T8g9yBmsnWSek2hObBhw=;
        b=afJSZi5FXaUKzKqNMghSngCiAMOIDkooSuA+Um1icMBJbpYQnst0KR979OSd+Zybqa
         u9pzUiGi+8WDzXCperCKUKVCOQKvHACnS7dsrrB6shKzJqD0swdBGuFZPWBg4+9cvt0w
         AGRnPAioU3aifK4BX345PvIO5iIxdCto+VI8Rjgd48q/2GB7Fn4v0AQLUXQZ/90aP1n/
         FKWCLpMzu3gDN0DyFiXz4fnPD0ZHQudYaiDTtxsaYjpMB6ffmSMIQweoNiv1kJ+rKkMd
         Rm+6xB+APdEeZjXZ5bJ5dHtmdaTj1Ispap6C/By/B7PXJ5VKcVSQZZIOOl6y6xvax7ve
         UA4A==
X-Forwarded-Encrypted: i=1; AKwUvBxbq1GFo6xnNQ+lovbRqn5CVX4TksWkY1r1eqyXpssSLny8rNKERitpvdx3bIZ4S4uOrhY0ln/x993QS9A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeUrtXqNZvxH4ej5tzOEi9mOxPQvjz16BdNSNuHn/IFyaf6N4Y
	Ya8NcnUEZFAVSD5RXCM3gN0KxWDbHXhmuI9WOfhFDg/Wf2p7oDKzQ1vE
X-Gm-Gg: AYBFou3a+uFvcDnzt4mi1GfIs4eNLcvggE7RPLGxyUwIpNaMeFXhS+K4SlSChcOhGib
	LkCKOZbDpzDe1TtZ/54EVzcdPxxEKvFvkjsLXPgl4/BwEgAa89VMX+FHzaBM600kOjn7VbCsjMu
	yv9B+KckioHyIMBQfcX3GcOSflyjuvIYHCG4+nC3VtDkFRNFMbSmmF7450mYYrU4YUmINR79TMd
	Bl17tkyFZOYb2jg5H/6t3UURI07DHG9MPOxOAa+xIDX9wfH9Ok3vIj4mBHi63Y07MqqvisRy0jL
	t+DwUmM9O3XT6mVl98M9nVHSNXkbW2ZB4xWkEZtP6UHRQzJZDFv4D177MzE6fH7JSCxlmcVLWSp
	B5WYwY/78fVwLgrRJtxOX0uOj4m05kiieXSMRuy1+FULR6sAIRYQ6ob3Qxg3ScpjnyEFviCjUp4
	sOGSys3BYQwJQ8zvuNMlZRHEUgmKf5jMYjXtEJ3ai96DuxnOLqLvTBMWGDlf6uohyEQLs1HxTNE
	3RKV7C0YbubBkcXgo64LPEB91ZmIVlACpBVRKTybACr3x2GF5Q=
X-Received: by 2002:a17:903:3c50:b0:2e9:5b20:1c22 with SMTP id d9443c01a7336-2ea9c0fc9f4mr14713555ad.8.1792842083551;
        Sat, 24 Oct 2026 04:41:23 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b14c774sm4738515ad.38.2026.10.24.04.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:41:23 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v2 0/3] ALSA: pcm: Retain components across codec teardown
Date: Sat, 24 Oct 2026 19:41:13 +0800
Message-Id: <pm-pmb-a4703edca61d34aa679b-v9-c4f3df026f28aea10fd1-0@gmail.com>
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

A pending PCM opener can retain the card without retaining a PCM removed
by codec-only unbind. A late codec probe can also publish PCM devices
before a subsequent registration failure starts cleanup.

Retain native and OSS PCM lookups through file release, close admission
at component disconnect, and drain codec users before probe-error cleanup.
Keep the existing proc rundown outside open_mutex at disconnect, and wait
for PCM references in final cleanup after the lookup gate is closed.

---
Cen Zhang (3):
  ALSA: pcm: Retain components across native minor lookups
  ALSA: pcm: oss: Retain the PCM from minor lookup through release
  ALSA: hda: Drain PCM users before cleaning up a failed codec probe

 include/sound/pcm.h      | 11 ++++++
 sound/core/oss/pcm_oss.c | 20 +++++++----
 sound/core/pcm.c         | 74 ++++++++++++++++++++++++++++++++++++++--
 sound/core/pcm_native.c  | 44 ++++++++++++++++--------
 sound/hda/common/bind.c  |  3 ++
 5 files changed, 128 insertions(+), 24 deletions(-)

Changes in v2:
- Replace the setup-list-only fix with separate native PCM, OSS PCM and HDA
  probe-error lifetime fixes.
- Retain PCM references from minor lookup through file release and roll back
  partially registered minors.
- Rebase onto current for-next while preserving proc rundown outside
  open_mutex at device disconnect.
- Drain codec PCM users before probe-error cleanup removes driver state.
- Describe the native HDA codec sysfs-unbind and PCM cleanup sequence
  explicitly in the core patch.

Link to v1: https://lore.kernel.org/r/pm-pmb-a4703edca61d34aa679b-v6-680f350d78e44f9de7a7@gmail.com
