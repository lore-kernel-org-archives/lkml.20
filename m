Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793042218;
	b=Z61pMuHcq1lehjFNpfGjdXk4LG/ATAGyGsRNk2asGhFgLxhGQH1Kw2ceWBLBAMN0irsE
	 PAY8jZ/qEgi8e7t7x+GIHr8zJxHPhzUdWYaivoGcTqnkGEkaBSWXGNYUbVtnBkqFgUE1n
	 H/ZLKbrTSX6eMrr3XFlxfz1y2TAZRh5uHPMZ3hFzyrW/oK+FF9rEpdGXgmRrZRPipi9/w
	 FEH/k0bJy0AuKXegHg8/ASy928MT/vovs0rD6+X51lptUAQLqb/emNMDoeo9F4dC9V1L7
	 svaCi6SeIfezSwyA+MvwGH0K+WSbhXAA7h3Kxn8kqhrSvR01KNPoRrv1BYHQllWGDNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZmT2nATq+bZ29K53UZMGVTr9REnvo4iJdWh63MeUqzM=;
	b=kNDAhmN+jAWbOm0AxRDNnL54hENrc6xF94rgw2vTqmrPiMqoeV5FgAhu+re+DCK7jy81
	 YlD9M69QaXLTj35OMRsayoLfccuqECSNo2zDy47yULb6gVYI/JKjgI4o0HlNZn8Lp9f1z
	 4ftfLMGmQRdUP9dKA+e1dficfy6ygLrj8YdVGKrLEptlHroTlgJmMszwwYlCUnplr1iB+
	 Qg6OjV4n2dN8KEH3OTdDDNHlBnqi8oTMGB+HQ5wVktR/SZsZNOoZJ4Ccz0bWxOWimP//r
	 g6XF5lj5RR6Jmza2pUR2PjxvOPQe6asdKr1OZHk584mVmSmd0x6XCVGR0UekPyYqkuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=niQW91uo;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2890606A334
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2890606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=niQW91uo
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-19305bcb72cso2486610c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042217; x=1793647017; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZmT2nATq+bZ29K53UZMGVTr9REnvo4iJdWh63MeUqzM=;
        b=niQW91uogOXmDUmt/TVR97QiE+ou1Dp7Dsm0nmpEDkvwwZ+fX8/wUUccMknO3X5vI0
         Zkui/rKZYxuXgrPMP4hiAZXW5gC33bUzV2zKQies+0cubpzN1aCsyYMdaZcNUW4f1zKY
         6WMOFZ+F0SLv9UvoEcH//7rqI/zbgzQfvbzsLJtZBdrGFTKWH97pBMDHBmh4HyXJWp7A
         gMG+3yk3nfmylfj4jwvn8uDwyRXYHPaOiYQ9gidFyROPJx5v6abMJkLjWVm3YSgPmAs9
         bCEgLG5nA1glxIycuDuRIUMkg8XCNJAvifB6QH7wx+KYeoG0Vr6ahapCjuPVa1AXPtQT
         7Hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042217; x=1793647017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZmT2nATq+bZ29K53UZMGVTr9REnvo4iJdWh63MeUqzM=;
        b=EJ+7o0sFyjy9OUmCpBg8LsgWQphV7DsPBrS297lKN5kXlbNeexjSWyTB7Di9Bosw+Y
         HW6/1+YuL4dNmdmeLEujP7KlQYsFUvPDTz0GFqXXUa9nepwRqgewLvQ/psoZ7RblfcI0
         6oCJqqJj4j2nXcraA6qfyRwBWSE4cg6zC6uoQCiaveIsLma+X74GsMXGP7e0e3495IJG
         vBjDM8dCkjjaawjtiX5bCs390P1y2QV5wJGQrI5jeJDfrCTL3t0Lw7R0JvELm5V/ZJl3
         NnBCsnax5UCIL0NX6sS8M3Sl1y2kdtxg4EPd0tHl7GRPgWeEN2IppM7rQDb+cCXzXkrB
         ebdw==
X-Forwarded-Encrypted: i=1; AKwUvBxqfr0550Hw+N+qCaIMD2zzA0gphctYgAbvAJgFL7eanN+bpWlC8heLZwOc1Dv8rYs6LQff9NSLLoyDoRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZABx3Ee3d1b6KwRSTt0gaGAVxRHE9sV6qYXpTG0j/O+VpKhvu
	9xKilYyFBnjd9WnWlufTWSbp91rwX6N60K2CVWCrJxyd6Ik9Bd5VMUDX
X-Gm-Gg: AYBFou0+WLgZ6qYG9pv/Xu4cCi/xCsGig+B0lKkAKHWBio/J6XpaI/fq0TKGJ0sycSe
	EBzLG9NoILPMohJdDk7xTnpYNmMW8GTGlu3IBjUg2YjdTsXBw159etOtVokzLk40E2/wpHpRkP0
	Se3dF2aoOGO0Ks9iL8DqFt52MB8Zp3jeXtABQVjhpx5zAXNMjgC9CJlkWienpeDooRplKLcb8GV
	wEWOvrLGeL8enwJRmf3q/rmLi/Dzg2jkTIu9XcbRoFAGfjTvLhFeKCTGXV/hQclUF6/g7+JdRpC
	Q4kKmU3R74wVMRGPv6MSWYS863z9ZwvGre+lTlVyGEtVoNNwa9UlVfYmvSY7JbjhuvDCXOSCTU9
	HaH73Vmb/GfmCSOl/KEEFs3zIksYFfI2GZuQn0UvUilzIIuXnLedgQeus5FcVYjNmkSZAN6Mn25
	wZa+qvPGx1qxjUfkVQFCi3+NZGxaP6QSWl8Hy+mu/ZheoQxEVRjmtJL50lx9rufYV7auayKd8ec
	wxASyle6PlSH2CDe+rsgDKQW3pnRz4V5t5lFUrIdeuvFlgkZkEf3Zpr0R79jyh5APTRVwV0cgVW
	VuQfkB1sorbufnfwitiu
X-Received: by 2002:a05:7022:6283:b0:143:7001:7645 with SMTP id a92af1059eb24-19937022b7amr15370847c88.47.1793042216791;
        Mon, 26 Oct 2026 12:16:56 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm25348449eec.21.2026.10.26.12.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:16:56 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Henry Zhang <henryzhang62@gmail.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] drm/vc4: dsi: Make failed reads visible and recoverable
Date: Mon, 26 Oct 2026 12:14:54 -0700
Message-ID: <20261026191618.9430-1-henryzhang62@gmail.com>
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

DSI reads on the Raspberry Pi 4 (vc4, DSI1) can fail in two ways that
the caller cannot handle:

- A peripheral that detected an error answers a read with an
  Acknowledge and Error Report. vc4 copies its two bytes into the
  caller's buffer and returns success, so the error bits look like
  register contents (patch 1).

- After a read whose bus turnaround times out, every following DSI
  transfer times out as well, until the display is switched off and on
  (patch 4).

Patch 2 rate-limits the error interrupt messages, which patch 4 would
otherwise turn into an interrupt storm. Patch 3 serializes host
transfers against each other and against the bridge callbacks, so that
the recovery cannot reset the block under a transfer or while it is
being configured.

These patches do not prevent the timeouts. With video running, vc4
does not keep commands within vertical blanking, so a command can still
collide with active video and time out. That is a separate issue; this
series makes such failures visible to the caller and recoverable
without a modeset.

Tested on a Raspberry Pi 4 (DSI1, 2-lane video mode panel) with the
same changes backported to the Raspberry Pi 6.18 kernel:

- 5 minutes of generic long writes from 4 extra threads with video
  running: 40394 writes, 583 timed out; each timeout was followed by a
  reset and restore, and the following writes went through. The DSI
  interrupt rate stayed at 131/s, with one error message logged.
- 50 display off/on cycles with 2 writer threads running (the case that
  locked up v2): no lock-up, no warning.
- 250 display off/on cycles without extra traffic: 248 panel inits
  succeeded; 2 failed because the data lanes did not reach LP-11 after
  power-up, which this series does not address.

Reads were tested with these patches plus a change, not part of this
series, that stops video while a command is sent: 2000 of 2000 reads
returned the expected data.

Compile-tested on drm-misc-next (arm64 defconfig, DRM_VC4=m, W=1), each
patch on its own.

Changes in v3:
- v2 is not safe; please don't apply it. Its recovery keeps the block
  usable after a timeout, and a peripheral that leaves the data lanes in
  a bad state then raises the "data lane 0 sequence" error interrupt
  tens of thousands of times per second. Printing each one starved a
  Raspberry Pi 4 until it had to be reset.
- Patch 2: new, rate-limit the error interrupt messages.
- Patch 3 (was 3/3): moved before the recovery, and also taken in the
  bridge pre_enable, enable, disable and post_disable callbacks.
- Patch 4 (was 2/3): only recover while the block is enabled, and mask
  the interrupts while the block and its AFE are in reset.
- Link to v2: https://lore.kernel.org/r/20261019174930.7237-1-henryzhang62@gmail.com

Changes in v2:
- Patch 2: restore the registers in the same order as pre_enable, and
  call synchronize_irq() before the reset (Sashiko review)
- Patch 3: new, serialize host transfers (Sashiko review)
- Link to v1: https://lore.kernel.org/r/20261012190249.3167-1-henryzhang62@gmail.com

Henry Zhang (4):
  drm/vc4: dsi: Don't return error reports as read data
  drm/vc4: dsi: Rate-limit error interrupt messages
  drm/vc4: dsi: Serialize host transfers
  drm/vc4: dsi: Recover from a timed-out transfer

 drivers/gpu/drm/vc4/vc4_dsi.c | 172 ++++++++++++++++++++++++++++++++--
 1 file changed, 163 insertions(+), 9 deletions(-)


base-commit: 650385a0fd0ea6475a17d39a20ec90470c7a4c67
-- 
2.47.3

