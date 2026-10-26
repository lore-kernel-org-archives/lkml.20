Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792986637;
	b=TXClDY+kj4PGj3thnkRT9+Hh2vs5b8q1309JWhDDrRXC/jQycscyOdY9fYNywiQ2/WeH
	 33yijRjAAKEONuswfHi4R8J9wnTlecdZjypxV308nBSyBl1iwKBurf8sUPdFzyo1bT7hM
	 anZUXj9UPfe3IRb3QDxlyxHuI4fxlNAjdUpkX56n0BZrxmCg7//3NKYDukaicwR8jz+/e
	 42akv5nJU1fPWsy9pOURFI5GKMoesN/2O26HwbX1FiWoJGIRDFPvVwS5JAcYiJMgZsey1
	 eoxshqBabpv4JhRPLjKb9eTz+EVuA4otDljwxOsWr9iS0ld6DKq8QZ4pmVMuDnnCbNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792986637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NQncVEPmnNz32FIFinnox9ir5Kh2ylomR5ZJ0q/9P+g=;
	b=nta1w3V/gH4GDHdjXjQnggAFS/3jNa0kRtSBuWI+DYBk1mBynYlm23jvVmkREAzJ0Au7
	 3vwmuUlfmSjepk68ZiIabXPoyNTlZRv6DLdt/+TYfHEIMwzetmgeffdq9B5FKqcHpaAgo
	 4ZTKDI1iqZjSDu3ES/xZrPDFxZ7/QGUO395O6oEjlcG8Q0t9KS79QB7dt58mpNOLc5x3M
	 ix/XtteKDf/SFFzpi1juk8LbpJxW5nWKpYhKui7Vb3uyX1bd2Q6EZ9MG7CD4ObSGF8EvW
	 x8CddOdzoROLKeUEhlvCu5/p9WqEEH2cUnedkeAjd0DePAdxgESn3z698YqU+Drq7DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="N/+XxAlC";
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF9A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:50:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=N/+XxAlC
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-990703f817fso1460639241.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792986636; x=1793591436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQncVEPmnNz32FIFinnox9ir5Kh2ylomR5ZJ0q/9P+g=;
        b=N/+XxAlCkr/DupY183z5OY/62AX2X2kBt/wE0R22Ex5wf7zZ5BqPvkyzyQLz//bfXr
         0pilUYEvYZOQS3idILJXR3g8K6N7hS/H5K0IqT96dHvsXq+ZsXFF0iFGyD2cavSuGLDm
         f0IaLPUrc00VMfKBDVYfysAryEjnws+D4JHalqoOXH4R8qBB3jm3dSMf0rTUuifd/qVV
         fqp3DVm+8yWCl1b+4z7UAdKA+d8j5mA+aCJnWGv6Y6lMnVjj8uaQoU4Ozn94xfmtdBpx
         uNwiEvAZcVfIJs+8unspRJanAr9Gsr7k4oBRLcdV8AEy4ZNWDUpamX3La+0owqqIGTru
         mfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792986636; x=1793591436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NQncVEPmnNz32FIFinnox9ir5Kh2ylomR5ZJ0q/9P+g=;
        b=1CueEYbT5p6dzJNeBX+nWIiaHmJfMtMphX0vITYCtughJZqC/bV8hQRzN8ApTO8P/N
         4z5Rt9m2o/VBzL8wt1tf0hf8rT+lQRz0QTvwTugOwK7GHu64PkDOS8F7xt+4iSv0YuAo
         SyOdXVvhq7TNSLLOi1OUTm13UkYFEbD4ouCBdEjuyqjENOI6lvDLu91fZLoAFiFctbl6
         /rdb60PjRWQ1NJM/vZ15KpOUN9uXCiHD9m0rwggKANotEUD99x5NoX4uQsLXcbyQlYgv
         rK8PBhAleALnIqS7Yf3tAWOb89rC0mCvY1zqs+e0rfu40O4xJ3bPzcSBTDbvEyW7vBpe
         JfPA==
X-Forwarded-Encrypted: i=1; AKwUvBx4TBG9u54HQHwpAf60CaxYLLFHnThhGZawy1OR/m0iRq0LZdA/lLzVS5Q++ggejRGyzlTvuZzhtYuHbAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ68hlG3w6llWoV9kBozKRkKJP1QCsUMNDG4ncoV3jypHMVsMpj
	pyjZ+qBGLgEi4YVmO/vyyvrgc/doyegUasCuj+FPIBVwMzpMCyDHBsFf
X-Gm-Gg: AYBFou2kWZcZ8mpBdbX1xTt5skEZdVnHQF3RtHm3OI4jcUZCP0xKia+L3Ownky27uFt
	OHYp243m8oOpp1iM5uF6FfTbjlSUhD1zPKeS+XuZhXAenIAoIo5zNLEn0gM9SwGRKKxd5DCYint
	R83acDmbdpQsiW8YGU+IslgYhU0yGKWbhcvtuU69xUXGvqUSQtaLDoF73B9H3ZE/sSz+/45uM0K
	g4hLzChsDGfx7K6IzclxIAe3g9t+rOLB7NF2vtM3v4xXzLHC4OK0hBF7rtygkDCYJxoB+iiP8Dm
	srqDdI8DUw6WnIS5l4oKvuTqJN8pno94JmU5Pkv0ptmHWr/rzRKuXMXxkLjKIeWNx9SVp8N4GOD
	OHeC+0ptHI8Pnu7WA2/AvSMInrLd7rub9uQnDxxUh2bQuH/WzGujLCPZzVm5yguJEjTi6SCeTIc
	KhrP2nM7RxoH80B3q/JTD0G3zvXTSSFiMaokEWc7tAJqaJmrBo6VeqHSI08mIg5HUJT5Wt2N9Pg
	KfBQxopq6xHiHaHzOzXzrBRlO17/9ebgeLNEpMvFy4qqTEmSTMm1QT/6qqYG5+49ud+uIDsPwFF
	U0jV5Jiqxwc+DidIV7H8
X-Received: by 2002:a05:6102:a4a:b0:7c3:c0b9:9028 with SMTP id ada2fe7eead31-7ce5cde1f1amr1608754137.24.1792986635938;
        Sun, 25 Oct 2026 20:50:35 -0700 (PDT)
Received: from archsung (187-126-110-245.user3p.vtal.net.br. [187.126.110.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5e2baf56sm6140100137.11.2026.10.25.20.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:50:34 -0700 (PDT)
From: Felipe Calliari <calliarifelipe@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Tomas Moro <tmorolias@gmail.com>,
	linux-kernel@vger.kernel.org,
	Felipe Calliari <calliarifelipe@gmail.com>
Subject: [PATCH v4 0/5] media: ov02c10: get_selection and 26 MHz clock support
Date: Mon, 26 Oct 2026 00:50:10 -0300
Message-ID: <20261026035015.110903-1-calliarifelipe@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260923234100.318151-1-calliarifelipe@gmail.com>
References: <20260923234100.318151-1-calliarifelipe@gmail.com>
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

Some Raptor Lake laptops, e.g. the Samsung Galaxy Book3 series, feed the
OV02C10 a 26 MHz external clock, which the driver rejects at probe
today. This series adds support for it, together with two small changes
found along the way.

Patches 1, 2 and 4 are unchanged from v3, apart from a rebase onto the
chip ID change in next. Patch 3 moves the PLL block of the per-lane
tables into a table tied to the link frequency, keeping every register
write. Patch 5 adds a 26 MHz PLL table as a second link frequency, and
picks the link frequency listed by the firmware that the external clock
can produce.

With the other PLL registers as set by the common mode table, the link
frequency is mclk * M / 19.2, M being the OP and VT PLL multipliers,
which are set to the same value. The 19.2 MHz table uses M = 400. At
26 MHz an exact 400 MHz would need M = 295.38, so patch 5 uses M = 295
(0x0127): 399.479167 MHz, advertised as such, with a pixel rate of
159.791666 MHz on two lanes. M = 296 would give 400.833333 MHz. Getting
exactly 400 MHz from 26 MHz needs a divider with a factor of 13. I have
no PLL documentation for this sensor. Sweeping 0x0301, 0x0303, 0x0313
and 0x031c around their table values only gave coarse steps, no output
or no change, so I don't think such a divider is available.

Tested on a Samsung Galaxy Book3 Ultra (Raptor Lake, two CSI-2 lanes,
26 MHz clock):

With v4, backported to the running 7.2.11 kernel:

 - The firmware lists both link frequencies. link_frequency reads
   399479167 (menu item 1) and pixel_rate 159791666.
 - The PLL registers read back while streaming are 0x0301 = 0x08,
   0x0303 = 0x05, 0x0304/0x0305 = 0x01/0x27, 0x0313 = 0x40,
   0x0315/0x0316 = 0x01/0x27 and 0x031c = 0x4f.
 - A 300 frame capture runs at 30.014 fps, with the same skipped
   sequence number 1 and single "Frame sync error" at stream start as
   v3.

With v3, which writes the same registers:

 - link_frequency reads 399479167 and pixel_rate 159791666.
 - I rewrote VTS over i2c while streaming and fitted the frame period,
   from buffer timestamps, against four VTS values from 2360 to 4600
   lines. That gives a line time of 14268.73 ns for an HTS of 2280,
   i.e. a pixel rate of 159.7899 MHz, 11 ppm below the advertised
   value. The intercept is -0.02 lines.
 - At the default VTS, a 60 s capture runs at 30.014 fps. No frames are
   dropped, apart from sequence number 1, which is skipped at every
   stream start with or without this series. 30.014 fps is below the
   30.105 fps that hblank, vblank and pixel_rate describe. The cause is
   not the PLL: with the exposure at its maximum (VTS - 8) the sensor
   stretches the frame to exposure + 15 lines. That is a separate issue,
   which I'll look at on its own.
 - A single CSI-2 "Frame sync error" is logged at stream start, as it is
   with the unmodified tables.

The 19.2 MHz path is untested, as I have no such hardware. It writes
the same values to the same registers as before. Only the per-lane
registers other than 0x3016 are now written after the PLL registers.

Changes in v4:
- Rebased onto next, which narrowed the chip ID check. Patch 2 had a
  context conflict there.
- Patch 3: tie the PLL table to the link frequency through a
  link_freq_configs[] array, not to the external clock (Sakari). Leave
  the common table alone, 0x0303 = 0x06 and 0x0305 = 0xe0 included,
  and only move the "plls" block of the per-lane tables (Sakari).
- Patch 5: record the external clock rate each link frequency needs in
  link_freq_configs[], and pick the link frequency from the firmware
  list and the clock rate. This replaces the external clock check in
  probe.

v3: https://lore.kernel.org/linux-media/20260923234100.318151-1-calliarifelipe@gmail.com/
v2: https://lore.kernel.org/linux-media/20260923144257.119076-1-calliarifelipe@gmail.com/
v1: https://lore.kernel.org/linux-media/20260905030732.39196-1-calliarifelipe@gmail.com/

Felipe Calliari (5):
  media: ov02c10: Drop duplicate register write
  media: ov02c10: Implement get_selection
  media: ov02c10: Split the PLL registers off the mode tables
  media: ipu-bridge: Add the OV02C10 26 MHz link frequency
  media: ov02c10: Add support for a 26 MHz external clock

 drivers/media/i2c/ov02c10.c          | 122 +++++++++++++++++++++++----
 drivers/media/pci/intel/ipu-bridge.c |   2 +-
 2 files changed, 105 insertions(+), 19 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.56.0

