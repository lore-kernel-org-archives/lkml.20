Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432476;
	b=dCOg/PSn80ZDgaH035OUF3afaBHfilWSOeK61bmGZscSQz2+1s2se8Q2iCwh96JnZiAX
	 qDQrzB5DIsLOcvglc3j/iJ9vu7df4DFPgQ22XXq9ImAcjTzL6l3e2jbLCraZpQ1aA6SX0
	 ko60RDolOLMbrEGe07XaBog23N5Swj7CY4M7U61BMBZXEDaSeqrWIgEvotywmlb0pdF3U
	 qVSeGVs67ZfRe/2ITro9NndHgaE8Ly4gKiOkKObGMw28NsgfZfXU/44c4aQ0oCiA7K9nS
	 z8shSMDaPqiEFAF44D0QvhYKU9VaXiLDTS/IPkx9e21HS3VuD8AhfbZYMGV5iL+8O4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bNlqELENpjqfUnGABPu3IfjplZkGaehiACydkTInEus=;
	b=aK6BCC/3OesgvVwV2bryBzLYFPU1MFUgC5rxmeuquhNVsZPPgIFwFok7MbC4KbOedhKc
	 D5MuZKUb7ZLBEeD+XPc6RSsODlyx7I8f/vdI0gUPHHiffpU0rZN4WbS6MXQ9vpZYdtTNm
	 Mk0+3qqXXJiK1I8Lz9PIguEm14gs+Reb606eHvqEMqKgZR4JcThmEgBeFit569stUDpm3
	 6gt0++TAF9PJCk7wmtvCpCCRNhrc5tyjyamo25hMGJyn6P36kQQ4RwAy8WMKTNZ1oMYBJ
	 ce69691rPf41HZitqf7/g00SGdxV5znCU3qUL0cyh1J5uOPqBUIe9PWYFm7uj4fYzuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XmVWPp9S;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C74606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9C74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XmVWPp9S
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2652116eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792432475; x=1793037275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bNlqELENpjqfUnGABPu3IfjplZkGaehiACydkTInEus=;
        b=XmVWPp9Sj6Iq4PTz5vDZsdg+lrm/cdC+wbDvv9m8pxyVbfksfLxewypjjJ/cNtDqf5
         dIYuV3+pDhIJG28PKytnTELHwoeAH7Wy+qEDR6AAb2rkkzsM+vP0Najd2M6zKVNlEOEn
         lsyMHWqFmmAZBaFe4wYeq9QaXkKtpgDj+CVeyC5uWe1SEpoR362hJqgH6MtdwG1xFgQf
         OLxmi0TElqsHp0KX8K6PbNinuC1asdIlvTnRp4IRmAhTGXrlBjRur5qEkI59BB4I3JAH
         LT7vFZKrSO8o5tbBgh7HKptEqLHGn/g+uM4myDMq8vWf1LN/IHqvzBF7PjT7lzW9LexP
         qs+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432475; x=1793037275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bNlqELENpjqfUnGABPu3IfjplZkGaehiACydkTInEus=;
        b=LYLAcMnzhtL+s5MiQww1qjNF5dMDdIaVbSxyVoLufhBrr0HTh3psO6Lj20h06FXoIQ
         XmMjrlaG8e9iwjRU26M5+2BjQzHpJu8aI1MYpryqhYYs/zmNVf6x3gaSzlF8LXX/o40Z
         cYts7/1EAaHTDLPV31y120JSKHci1YAYrq7rLl+ailjxtqyYGpRwXHGtfERxb4cvg9pE
         ye1biltPZ6wzfYgyCIUi2mSDmdlkc+GrG/O9hWz7bnCM6itDNdkPCo5mMt50bl+bBtD9
         LELBNsy1IdkH8dkOzbHoAeo2AcwnHlsktIXG3RS0zX5gLcBmxSLrCk35os7Bw1aVsS0H
         cJ2A==
X-Forwarded-Encrypted: i=1; AKwUvBzACUbn0aD5YBSz0EWjsG+0DI79hDRfzshCmpmcocHQbmJdy3gQasQsdVP8D+b36TaKhffZMhEMZN1rGPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYITWCuqWcYghSWgal9QDknVSiQMSYO/R82qjnotYxgtI/II7gUu
	u7AsAEdxFKN8qGB4zLQQSWUn9UMfzthlII2hYGESb4GH5580NWQGWpLN7sZO8Mi2
X-Gm-Gg: AYBFou0qmrnhd4WyMcopeU5sKljwevcX8hTlUt5zieZ9XhkkpbUCXE0TBz3XxKYinqw
	qc6YKcvSJ0/2IDlrRxDeIldnAyShypbdiw3F4RFq8VzUqpjn3gqHhxIB/+JYM8OEfPo5KZIeNHm
	fvjHoK8WcWCrJ/q/Bp1yypXIZ+uK3lciZln3q1/fp1T+3AyoF4NMB8ESRvOvXqmvwPvUqpWvHRO
	V7Hy15eCqoiyxbTQbD0mmiIf3G569IAwLYdzMOCDzmnRHcifDrsJC6I2wFxa3Gr6+qwuTHo5Ueh
	veWZOAvUF/tWPQtmTmXVUaQOLMSO9WZxeB0buOUY4fmDAKTInlZUMG6zJm60FdP9qoOaYkT5/qD
	Yaz5+RPDNSD3+FTRn215JH4bXlpnjUDbQ5ICUfHXkNv8ouPFspeESUF/oW5Hch13jX0EgePm+7w
	SVkVHKjj/rPMFi1JU6QbR5PHqOGLBFmlfr3VGwsWQ52XNVTSmtnE3i73NRgq8kRrMzQ46L5neL/
	yoizuVAt1rqSz+cl/osisLeaCdoupLzhbvriyQ=
X-Received: by 2002:a05:701b:464a:b0:14c:8461:b3ef with SMTP id a92af1059eb24-18513e7c64dmr10593192c88.24.1792432474641;
        Mon, 19 Oct 2026 10:54:34 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm31837697c88.22.2026.10.19.10.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:54:32 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: henryzhang62@gmail.com,
	Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/vc4: dsi: Make failed reads visible and recoverable
Date: Mon, 19 Oct 2026 10:49:27 -0700
Message-ID: <20261019174930.7237-1-henryzhang62@gmail.com>
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
  (patch 2).

Patch 3 serializes host transfers, so that the recovery cannot reset
the block under a concurrent transfer.

These patches do not prevent the timeouts. With video running, vc4
does not keep commands within vertical blanking, so a read can still
collide with active video and time out. That is a separate issue; this
series makes such failures visible to the caller and recoverable
without a modeset.

Tested on a Raspberry Pi 4 with a 2-lane video mode panel at 120 Hz,
using a backport of this series to the Raspberry Pi 6.18 kernel and a
panel driver that retries failed reads up to 8 times: 499 of 500 reads
with video running and 1000 of 1000 with video stopped returned the
expected data, with no lock-up. Without the series, the first timeout
left DSI unusable.

Compile-tested on drm-misc-next (arm64 defconfig, DRM_VC4=m, W=1), each
patch on its own.

Changes in v2:
- Patch 2: restore the registers in the same order as pre_enable, and
  call synchronize_irq() before the reset (Sashiko review)
- Patch 3: new, serialize host transfers (Sashiko review)
- Link to v1: https://lore.kernel.org/r/20261012190249.3167-1-henryzhang62@gmail.com

Henry Zhang (3):
  drm/vc4: dsi: Don't return error reports as read data
  drm/vc4: dsi: Recover from a timed-out transfer
  drm/vc4: dsi: Serialize host transfers

 drivers/gpu/drm/vc4/vc4_dsi.c | 145 ++++++++++++++++++++++++++++++++--
 1 file changed, 138 insertions(+), 7 deletions(-)


base-commit: e6bb593b800813788dc16179d1305747ff974d00
-- 
2.47.3

