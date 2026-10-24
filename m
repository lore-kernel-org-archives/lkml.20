Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792823453;
	b=xDVRtiHlZjcTNCZ0hL5NMFyIGQi4LT5L1MEijjWRqcpkk30NTBCiXPPqvewMNAS3qiDb
	 Z8Txx7z2adHaMsXu5mhR6nlkTbPUkmZYBKL7MajXUyl6Y7o6lu8ZwGrR6HA80smjuUjYG
	 VN5WjGGa7e5itEZF9CGEWkNbFmAW6BwoLPH4yv35E9gO/EFm9/dEvveyp76t3vGcvgspg
	 YmWfQmuCcRcR+CNCXYr82yp/mEJpyVHyZUONnFsS5PKYwLHvCpT0HwcJfuSp4HyuY7yrR
	 UdnNuiUUxMUAt/wiQjPsczqPBvqtgkmlHFKMI9il8ulAwZvAP6EPrRLPpXFua6v0IUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792823453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8XnB2OVJgiBpL6wU+5GDlzriSRdUj0PHVJ7bca8MKzE=;
	b=ZkhxD49b0KWlTqam0PuxhBHHA0jXI3OWiFLlNinw1zvEKqq2xq0vGKGJzc/gOIGi2sPE
	 yX+hunHQcenPKB1WGcne05skrv6yXPv1C8YIummy/LVMVRGW3ZS41ShllMzCsyD+d+h5U
	 OmAQoDUMFpwIjzG5njAJQQQtaZdFeBVV85f+Yi2N7oc0rjs9dvpOLq1AvtNEl5+q0gI04
	 H6IWl+++RzBpgxPTtmpl7bJYV9NGdQB+iwd9Sv9gBvZMEnUiNXwEexDIxGspIjWHTzGrN
	 tKlwSVUqL7TtzmGAtctnW+Dgx9ZSNIdBeKJrC2SxZkQSHwnrvVIm+tfZIF3YfPz5z7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rytgpuSP;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA587606A31B
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 06:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA587606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rytgpuSP
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2dd76b1361dso8495905ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792823452; x=1793428252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8XnB2OVJgiBpL6wU+5GDlzriSRdUj0PHVJ7bca8MKzE=;
        b=rytgpuSPZUdP2+yGhpFrDujRy1hZigr5iK0kUty7cwQ5Uu08nlSFjj19B5EweoBvVF
         2UuZwzSBEoaKyBoCQ0BKQ7tDHgpHYSugOWIIg9H+vjdmuLlzhgjCTVvBTyoJGxsoPV7Q
         nrQ673rm1rvR8Za9DZbCjmM1377C1s7x1P4dnb4jXzBw/eRx3c6UKYw+HDbdjLKss1Rt
         nXxqkhEn5VireNBeDMgeJNchCPEUGwX8IVuMHh4tRu1TUVYGCS2v+oUalhJMG8DeVjh7
         oSPdlddVXzQZNZLN9fFk0wWaUOvtwUpXN9+xctdLkbtkVKQnp0s3h1okx4RGzWlHIYsT
         0jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792823452; x=1793428252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XnB2OVJgiBpL6wU+5GDlzriSRdUj0PHVJ7bca8MKzE=;
        b=ugOs9xvFE/zxj+O1es4hfvJoQslWIH6aN437ctF4f04/z22hUCEwyJkIn3nRWA2GwU
         mc2NPhMPLfHN9f2/PIbE7N5qER1dAaC5RGVlDl1o/SbpBrLVCdRjtqKKumjS6Xd3xlSs
         ZY9/aZm9FoYh7cySoaOgtE07U4VgXoyXp9ng0nULdrS5ijQkjXAG4kOx3RE3fdrR34vO
         HvEVqT8conwieaU+dCL7rSMo60OemO7Dv1FofhXIkWnFERMdjMs0oMc1uX1GYeiA2Kqa
         rln+zsA+IGBaRXUrM3Jx1JNxfoui/Tu2ik39VfkrqwxRIbu7Ob+FZ4jE0ll8nhUksUu0
         ddWA==
X-Forwarded-Encrypted: i=1; AKwUvByYds3IGkf2UV1Utcu3f2Qv+V9R/crmTzvl+1K39TgsYvVuo/soz4SSqzOTQ2fwJ9fv5nV957KdVr7bg5Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLD+J4gg5RvYc4p+edjZtdhEqWqOVMt+zWgS3Ql20I6lG716mMJ
	0mvzvL6tsKTtFaOKaofI+iIqWT4BNH/Zt8VUEpzUe6uk2jgzKNHHQFB3
X-Gm-Gg: AYBFou2HCtZHUCZRs4r9xnxhS0JMoHErEs8MAf1KoVvmrlH7YsWpVf/MxO+CM7JHQpa
	ZGyljzkoz2V8Bb14gz0+qWZ3qk0GuxTcRz3U9cjfuOuLsEuvQTHqhVd/wD6JrBdQsZBLL44eXqR
	Fq/WdEJSX7pSYeRBDrF4Igf7yzOqOlsvWiH72hWVMl0OrG67lx0V1ayJr5+NvgeduB9M3ArjMVB
	8AP0CiJThlKyB6uMSiYJETWktvlUZQXO5zKvfsTIL3Ksxef1iMU/Nxp/hbkBG5RatDie/6vSkGX
	diIYCFcloijc6Pl1TfM8/JCf1qwM+7PKQArS5vBISlj4/4BEZ9/96lcdCOx0O7qdwgal+Ksejum
	hd9giJWnViv26dHOolKf/y9L8S0iTIj/CFQ1FQhdUx77dfURkVGOqvMoR7FBc4HTIC7tc5ZXFtU
	I1ZltRgpl6KuHMOPE4v9AlwW2RN1Ca7tccIPkZI/F+glnysT/L0wQ/3lUm/Gol5/aFA3y2v4Y+e
	lbCLNBcWi5DNOFcmx7UJsn5n4fH+KtUeeKCQVWR/GhintKBTjA=
X-Received: by 2002:a17:90b:1652:b0:3ad:68f7:dbcd with SMTP id 98e67ed59e1d1-3adeae80c3fmr1131132a91.55.1792823452016;
        Fri, 23 Oct 2026 23:30:52 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebad6306sm1248371a91.2.2026.10.23.23.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 23:30:51 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH v3 0/3] ALSA: opl3: Fix sequencer timer and channel lifetimes
Date: Sat, 24 Oct 2026 14:30:42 +0800
Message-Id: <pm-pmb-4552c4e605507d8d9b16-v8-8b61497d9bd754defcda-0@gmail.com>
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

The first two patches address existing initialization and rebind issues
identified by Sashiko. The third closes the shared timer lifetime after
all sequencer ports have been drained.

---
Cen Zhang (3):
  ALSA: opl3: Initialize the timer before publishing a sequencer port
  ALSA: opl3: Clear voice channels before freeing their sets
  ALSA: opl3: Shut down the timer after draining sequencer ports

 sound/drivers/opl3/opl3_midi.c  | 14 ++++++++++++++
 sound/drivers/opl3/opl3_oss.c   |  1 +
 sound/drivers/opl3/opl3_seq.c   | 13 ++++++++-----
 sound/drivers/opl3/opl3_voice.h |  1 +
 4 files changed, 24 insertions(+), 5 deletions(-)

Changes in v3:
- Key off active hardware voices before retiring channel pointers and
  delayed-note state in patch 2, addressing the Sashiko review.
- Move the voice cleanup helper beside snd_opl3_kill_voice() and reuse its
  existing two- and four-operator note handling under voice_lock.
- Keep the code in patches 1 and 3 unchanged.

Link to v1: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v4-213af356c0046331c8ff@gmail.com
Link to v2: https://lore.kernel.org/r/pm-pmb-4552c4e605507d8d9b16-v6-f3fa18aca2c7d18be670-0@gmail.com
