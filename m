Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E344E1411
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449796; cv=none; b=uYuyJ2u8vYGqkvWaM5WTxXpzq42CJkeLgfG42nZHBNW4ro6BUx7Rquuyme0fwfA9X4+mdhK0GkvezSEh5K0ab7BbRH0JgnjE0dH3Un/rYL8aWiOvBAXz3wzr26UqHUH5IjHQNGGH+yYLQU5e6DHHJcuvklXsbIBAo5uZeQ4OQM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449796; c=relaxed/simple;
	bh=Y4N5n3dWF43z5fnhzSjvS2JctFJVZQSgkRXuPz00tj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hI5r0MeEy2eTTocNPcBMXRE5iqndh5ihrlhYXJEP6GxkJiBVh6Jsd1dUtUMlVmBSFurDPgU8rmgBqfwceZ2AKplcknjCLZ2aVI6VrQCbm9g3a2JH+b6BhWnxxIJxEyWNP4ExqcZnPe6LL751IO73Gwvl4PI3Ypt//EIJQdUYraA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcKC2slh; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcKC2slh"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cdc81f40eso18373445e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449793; x=1789054593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HxVPdMsVHdS0kk+CtMD8XqvKLESkGAfNVL5qV8f2BIs=;
        b=XcKC2slhhxO/9v0o3/hAySnngt2tHiRC8VLBEiR5/b5ZFYERL796+2Gt/mIEvyJadv
         zdNozbMPLfn0jtGrUxR1/C01FgoR+ULTKHuZEfXX1TK/sFsEh2IO7OI9HBE2rXzyXK9S
         Xf5YIS9fWvwbeRb0G92SMZ2h19jkW56Bsfh7vr9qxzd2Z19amz9I3OjdLSCi3CbA2kl1
         WOB3YY2eFFMIvFBX8tvuwljRjfpPOhNX/s/WpR+ssj5SMAynIEm1+XPKedaxiMIj1XGc
         NF9jyOrL4ymTC5u0nzgwBMCv2qsFyaJTzysL9F6lH4QxN/E0ytnPUh4xY/3Fo6GIMCGD
         hf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449793; x=1789054593;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HxVPdMsVHdS0kk+CtMD8XqvKLESkGAfNVL5qV8f2BIs=;
        b=XK9to0iTLQw2EueivG8wEeHV436o/GdZnKY5GqM1jZ5kTe0rKU+YH3K6yr5Q/M4yY6
         e37RtWvhHrJRK64ybjP5IG3vSERluhJGEWQjhDezqrqrndYDw3ujw4nDhg6TodVpgQ7U
         vj1HClBJP9b9lasIxQk3QYgNsUZ7VHah921ZONl03nipaXv/v5nIdMtTbV9A/0sPk1Rz
         AZVFl2bRp7nzG1Lxtlv8XXRrot+1ZJ+9OFgGFeyCs9lnGh+pUth6HYP8szW6cgbMDSIQ
         5/hdjZYtHXi3FTxA8L8LkvHwe/tHznSqAJkV5RBWYEFF/0kkdQ7qFteVrssZ9m0gUdzU
         uFbQ==
X-Gm-Message-State: AFuF++mHHCsifrc8OXV71UtX+GKjHwSBOyVUXXG6anKf+E4JuFGYiVNj
	gr4yQCvPzTYo5HU2M30iRiegQuqRtkDqKT+9D+zgcb21WEPcCOWBjB0=
X-Gm-Gg: AYBFou2HEWXKit64WgUGsHexRQ7owyuRxtJHl4fzs+VY0dRT9ZucRILcPIoPHjhpNvj
	yUEyKXY+FgQ8R9awrbCbR+tjwQKWyzlnC1Mc7ycEP0DC3KTcSuMBBA8cYKvMhVO9nWMDsZ2An8G
	Rxw/IT5GN8VHgE3OlC5zb3sOFAFM5892DJ6kNdMvJySmv8BtrQj03m4FXyzo4UCFtzy+AK73Dfp
	9MwvQPkaMvtTyZ6k+fAHXmlK38+XTK41NVehcIRsUxT3kFVH4qSPjG7mg8u3LxQgGbDOECI1Es9
	zmYCKRBARO39/FtaVjtsx1KC0En/9JTYQOnLwbFhMIgCG0RRLBNEX1NlceNZLIvXh64+vwCgc+z
	p4SRT+bgwx5MLzQNk/oBFp76g4YvCua9gjEUqKjmepTXPlkweQUJ7O8CiWNzLkeY6FV4hMtViQb
	jcSc1Xnyov5hSsH41LbzgzytLntI1TYZGBqIVwXIs/7t+GaKsdKisaM0HSqE3XYxMmhJUsclNHv
	bPlHGcZSaeOCZTch6SCTrQF7J1S3dt+tLQt30BqZ+gPNv+EUoPcWBKPSHSU9Uvsspl26sbJwfC0
	FZH6nE4UhXIvFQg=
X-Received: by 2002:a05:600c:4684:b0:49c:f617:7cf with SMTP id 5b1f17b1804b1-49cf61707efmr7854075e9.0.1788449793027;
        Thu, 03 Sep 2026 08:36:33 -0700 (PDT)
Received: from nn ([2001:1ab8:1003:0:5454:f357:ba89:4e22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce831af89sm75568425e9.1.2026.09.03.08.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:36:31 -0700 (PDT)
Sender: N B <gen.benner@gmail.com>
From: =?UTF-8?q?Nerijus=20Bend=C5=BEi=C5=ABnas?= <nerijus.bendziunas@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	linux-wireless@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] wifi: ath9k: cut USB round trips on channel changes
Date: Thu,  3 Sep 2026 18:36:12 +0300
Message-ID: <20260903153617.990995-1-nerijus.bendziunas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Every register access on the ath9k_htc devices is a synchronous WMI round
trip, so a channel change that is nearly free on PCI costs tens of
milliseconds over USB. These patches take round trips out of that
path without changing what the hardware is asked to do.

Patch 1 writes down the eight-register limit on REG_READ_MULTI() that
ath9k_multi_regread() has always had and never stated. Patch 2 makes a
multi-read that times out over USB return all ones, the way a single
read already does, instead of the stack contents it copies out today.
Patch 3 replaces the ten-queue ath9k_hw_numtxpending() poll in
ath9k_hw_channel_change() with two multi-reads, and needs patch 2 so
that a timed-out read still counts as frames pending. Patch 4 wraps the
read-modify-write runs in ar5008_hw_set_delta_slope() and
ath9k_hw_start_nfcal() in the RMW buffer. Patch 5 drops the departing
channel's noise-floor readout on a fast channel change over USB.

Patches 3 and 4 sit in code that PCI runs too, but there the multi-read
is a loop of ordinary reads and the RMW buffer callbacks are not
installed, so the register traffic is unchanged. Patch 5 is gated on
ATH_USB.

Measured on an AR9271 (0cf3:9271), counting WMI commands with a debug
counter added locally around the driver's channel change:

  full reset, unpatched            182 commands   ~92 ms
  channel change with 1-5           44 commands   ~31 ms

The queue poll alone was around twenty reads per change, and the two
read-modify-write runs another ten commands.

The second row also needs two changes that are not in this series:
taking the fast channel-change path on same-band retunes, which mainline
does only for off-channel scan hops, and a mac80211 fix so a monitor
retune performs one driver channel change instead of two. Both are
separate, and I am not asking for them here. What this series
contributes on its own is the round-trip reduction that those then
benefit from; mainline as it stands sees it on scan hops.

One note on how this was checked, because it changed the series. Two
further patches that also cut round trips, skipping the PCU
re-initialisation and the WMI_SET_MODE on a fast change, measured about
twice as fast again on a channel-switch latency benchmark. They also left
the receiver dead: ath9k_host_rx_init() is what clears AR_DIAG_RX_DIS and
AR_DIAG_RX_ABORT, and without it the radio retunes correctly and hears
nothing. The latency benchmark could not see that, since it only timed
the tuning. What caught it was two AR9271s coupled over coax, one
injecting raw frames and the other capturing. Those two patches are
therefore not here. With patches 1-5 in place, the fast path delivered
90-97% of injected frames on the standard 2.4 GHz channels across
repeated runs, against 95-97% for a full reset on the same build. The
spread is the rig, not the patches: the same binary can read differently
minutes apart, and the fast path shows that drift first because it does
not recalibrate, which is the reason mainline limits it to scan hops.
Those numbers are from cards on root ports. With the receiving card two
USB hub tiers deep, fast-path reception was unreliable with and without
these patches while full resets were unaffected, so that is a property
of the fast path on this hardware rather than of the series.

Changes in v2:
- New patch 2. While tracing a different WMI timeout I found that
  ath9k_multi_regread() copies an uninitialised buffer out when the
  command fails. In v1 that turned the fail-safe queue check (every
  single read returns -1 on timeout, which reads as pending) into a
  coin toss, and it also affects the existing ANI, EEPROM and register
  array callers, so it is fixed on its own with a Fixes tag.
- Patch 3 gained a comment sentence saying why a failed read is safe.
- Patches 1, 4 and 5 are unchanged.

Nerijus Bendžiūnas (5):
  wifi: ath9k: name the register multi-read limit
  wifi: ath9k_htc: report a failed multi-read as all ones
  wifi: ath9k: check all tx queues with one multi-read
  wifi: ath9k: batch the read-modify-writes of a channel change
  wifi: ath9k: skip the departing channel's noise floor on USB fast
    changes

 drivers/net/wireless/ath/ath9k/ar5008_phy.c   |  2 +
 drivers/net/wireless/ath/ath9k/calib.c        |  2 +
 drivers/net/wireless/ath/ath9k/htc_drv_init.c | 10 ++++-
 drivers/net/wireless/ath/ath9k/hw.c           | 21 ++++++----
 drivers/net/wireless/ath/ath9k/hw.h           |  7 ++++
 drivers/net/wireless/ath/ath9k/mac.c          | 38 +++++++++++++++++++
 drivers/net/wireless/ath/ath9k/mac.h          |  1 +
 7 files changed, 71 insertions(+), 10 deletions(-)


base-commit: ca800a9302764c445de0da0e84d2252400a770ee
-- 
2.55.0

