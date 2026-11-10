Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328751;
	b=oToJ68PSyrOW6K2xO55o3itT96sUpLJKXJcR0zucAeSqwsccvkvjvdcf55Dllhyb8V2U
	 PRQ6JUyaGcD9SYHvM0WTfZ6N0EJAG1VXzpbfwwS9xHSKfXnzqItzdvqDzLlBFzzz21ngu
	 KcFXfzBR2Li+T7ao3CBGEkywCGoSNUN6lmm7ativfuE6yb3uqK43JEb0tenLBhUM7w4qC
	 YwEDJJFxnFqEVoJQXx6uNeO5iUSN8o4rfPUQv5YsGOEOL+viaXRP2mNI60IQN4hB6+30Y
	 AjH3ehyQ9+/jVzixMEhAzS79k+IjpAIagDYTMuUCEWtYZzxQdnOdJPnWWJINv30UrEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
	b=xlCEMMjKLoMIRGATW9glCX92Tgm3wA3Eah/o96cj0c6ry4d97CCP95U6AqILDa8CMS4v
	 iz6gt23OsPzTgy3nAprm35F/5t1dscK1wc4rrW4BBQ9Kdm9ER+Kc/YRWFlYLOjdSjVkmX
	 0mQEPPeoxpWOfrKl1Xni+lfoOb9JwixUg+u075kPk52BY3sywlBU/h0BERAEjGTf0MiYW
	 ZZvrYHbtXh9TGK2/4jah9optZZl4twb2YV0vAleffprz8CRx4+XCGAsz52zlbSzazr7MC
	 LVT2YRE8CUesY1PBbN9sSicgdCOnj8U9+rJM7MSwdSOp6f4aENeReAIn6+WWnfvN2LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="FXU//d8p";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB66606A201
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB66606A201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FXU//d8p
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so1931906f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328749; x=1794933549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
        b=FXU//d8pOsy9podTaNS7TxAN7NZ0x1Auiy+e17xXsQGRXxy70dAmQtboqPh9IKHxo5
         15uk7fvsXCDiKnhpoZa0okUmtr2CrrECoKCwiwsqL54mnPOvDSDxBxJb2dYMz2LRS550
         tv9NxPZqoXGPgh/BYyMLWhveLCzPhw1zxFOvoXF9iy+QMGW421ddmikeIJrINJ8AW+jn
         rHCfy+JDFNvlY/X78nOJdFchweEOC17mF3RSvJR78sCjIfmENxETapXbEacIy0RZcjEc
         WBuN8YfovMPJ4tRnM/Wb9s3d0utdl1TKih7wUZkeh/93JXaRZnjWup5qAZbfK8R3Xs8d
         phaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328749; x=1794933549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GnMoHkTM6iQtkpAgle+3oy1uhVcPxUIIpLVPaorm1V0=;
        b=v48AiWRxj9lnj10Q3EwOHWu7cokCDDB6EYAzK793+Vl+u9/7rGx5mG4sgI4xnvnQAT
         N2gVVUZlH+NLME7Q/aIld+oHdK/eSuNPuOAUCcqLghnCjX6d3Mo5JtAQ3dzL7Y1lU+cu
         w/IUkEdcZCNADWC7MiBeaV0VcHtpSj/H8DkN2PK8dLB4C+f2tamqm30go/k7myMR0tV0
         C8/1MP653Khbr4cnIvbvL+gYAHPDKGcAsJ+k/3xrLpMCx0nkRIdNk+iPcOfocgITBvYj
         spHxHZ3+/huzDyutXwEkU7O0lYUWbPBcCXZOsD2BuC5yrzIp/EI6+i8aZ+IQNxERYZaj
         GsTA==
X-Forwarded-Encrypted: i=1; AL+hErF4PvREfGJfKkg6uUv0wVtMC/rdQDlcJyKACjHzSsBOE242AOIvzpAvf4Bh4LlM5X8ZtJgLTYUuaTDui3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+z/D+B8y7tQQrfgqQce1pNg/Ccx1pXwX88llyEe+80KgSvoE96
	CTNWBQyoxxxIacjFiBVElpmqUL7TiVBY3/awYkKE9kTp0wTDYggCuA1E
X-Gm-Gg: AYBFou36qOYwYQLjOCy4tlHJ57jrgp6qJTtTG2QZWJ/1mEi7iT5UUv5/EqpUkiUJZMg
	s3nTbymznRXLzx2W4UCYRfRqqXGyawNSUUXOD8OVJyPAaPVSAOQwTqUrvtYRxVc37s/EI1qPHlM
	Jk5ia65KWAqggjF4hI0wbnOMokg9AwYn7BLE0Si3aO6RHqjHqi82TEYiYweBtkH4xQO7PoTNMef
	cxhEcfalJKudq26yAFFIoWW8yC519QWXj8Y/joH4MJpofwQ7SS1n7YGzKBHkojimCe6S6LVSrp6
	WRIgOmFyOOS8GWmAPKAm7sgmnnJn1ehEzGckQBaeo5HKhaB7pxARxMQ/g6k7PeUFHNj0IInOQN3
	J6IklYEj2I6SKlYvF2/sPTPKpuPHn1XosgJBSBz3x4W3zCb+kH2ntdwBWzjB5GElHdUf+5FT952
	h9zxxA9JEpwthOfZOMKum12Ao+DYcyMPjtgpWBBhOK789Jn43yM0c/6C6Xez97oHZx35ZlqApHk
	Gvh5CW/TApmdraDIMMeXExp2e7XS3y/sGYvJC/cgu3o0BRWicWFSuBw7LRsQdVTuLz+Tn+Wxh/4
	TwlhS42fJly2p1SjK4wCLjUU+mUUZ7DcbS6DTsi3m3oEuEVrf+VJj1uFZBcgJydX0gbic2VinTu
	ma+rF4u8HOARrXxiVzyvjcSu70wjH8oZD/Kl8FT+zbGp3WddqBKnVxOsqJnggxvg1lJ3SIjXfOU
	mgDTIP1/fTkXIegsd1plZGRriFXNUzDyk7mDMU8rZw4tkAuozCHmgA3TH+gvHv7KUcFzHWSCbxx
	NyauG46UUXn/78UkYWVs5qMCgB5Nd8n5U/g1f03Cw==
X-Received: by 2002:a05:6000:25f7:b0:492:4156:b8f2 with SMTP id ffacd0b85a97d-498318fccdcmr5748430f8f.54.1794328749233;
        Tue, 10 Nov 2026 08:39:09 -0800 (PST)
Received: from jernej-laptop (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm5888355f8f.10.2026.11.10.08.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:39:08 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Icenowy Zheng <icenowy@aosc.io>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] clk: sunxi-ng: h6: Keep both parents running while switching VP9 clock
Date: Tue, 10 Nov 2026 17:39:04 +0100
Message-ID: <20261110163904.1098187-1-jernej.skrabec@gmail.com>
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

The VP9 clock mux only switches while both parents are running. Its
reset default parent is pll-ve, which is off at boot. When the Hantro
driver sets the clock rate to 300 MHz, the clock gets reparented to
pll-periph0-2x, but the mux doesn't actually switch until pll-ve is
enabled for the video engine. Until then, the VP9 decoder has no clock
and every frame times out.

Set CLK_OPS_PARENT_ENABLE, so both parents are enabled during the
switch.

Fixes: 524353ea480b ("clk: sunxi-ng: add support for the Allwinner H6 CCU")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index 7fccda96d444..a10f0502c5c1 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -336,12 +336,17 @@ static SUNXI_CCU_MP_WITH_MUX_GATE(emce_clk, "emce", ce_parents, 0x6b0,
 static SUNXI_CCU_GATE(bus_emce_clk, "bus-emce", "psi-ahb1-ahb2",
 		      0x6bc, BIT(0), 0);
 
+/*
+ * The mux only switches while both parents run. pll-ve is off at boot, so
+ * moving the clock away from it would otherwise leave the VP9 decoder
+ * without a clock until pll-ve gets enabled for the video engine.
+ */
 static const char * const vp9_parents[] = { "pll-ve", "pll-periph0-2x" };
 static SUNXI_CCU_M_WITH_MUX_GATE(vp9_clk, "vp9", vp9_parents, 0x6c0,
 				       0, 3,	/* M */
 				       24, 1,	/* mux */
 				       BIT(31),	/* gate */
-				       0);
+				       CLK_OPS_PARENT_ENABLE);
 
 static SUNXI_CCU_GATE(bus_vp9_clk, "bus-vp9", "psi-ahb1-ahb2",
 		      0x6cc, BIT(0), 0);
-- 
2.43.0

