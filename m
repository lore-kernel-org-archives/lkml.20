Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723083;
	b=KjU6D6eBwDvck08/d2F9kaL/E3CYDBj2t1j9ajdiNV205EcxGrQzBHoHRswd/1PKPVJe
	 X3x2t0U/q+EXLYL7B6JJ3601o2SGTK26+tQsvqh9mpgDLtXWRuy1wzy6dtoaGa8UnqoP+
	 ltNA2PtubVogkujbk16WQjFoOGoIY/gXtu7LrlhBQJD5zKMUtWWQXuo2TyJ2+Fq3XPF6g
	 BvjHOGm2Uw20QMkRC+bcwR4e/uiTCOLsUUjeVIIq39Ymoa0dw0C0RobiLrnl3A8Zcw2zi
	 nOFcpjqYOXaZWodgoDET2ooSgYOs2g7SShjU2xhVol6pVYtO2fNa6e1mbyImmYMJwJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
	b=nOYQ3zeUUItiUfkER6mLszqZwObs81ShM5MWIkFvdVlBQY5QioSNPQ6SrNRoWRGCFZYb
	 FCwqi3ilTLReoz+E3dRpz2LYlDiyB2pKW8+8D+e5rbbaQU6/Jdsct0b4IZS7vI68N8oBO
	 pUrZpKeL/x1EbDf1o4sXH3mZ+X2SUZMuUH3zRC7lOVBnboia9H9SV54IHumJfBAMyVme3
	 +1whkmgUYpzZTh4b8A0Jlz8rgTzALeTyidQCeesDJeDe8UURrvytUU9cRZQuVdiAWTYMp
	 aJ0f+yppUvOUymLdrBe1fsfRGAisDLDWzLf4nBhp+XptdOFrx8q9dJ+iopzm5yoTdVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlTlGXIO;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94439606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94439606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlTlGXIO
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18552725e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 22:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723082; x=1795327882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=vlTlGXIOH7WEwDuXuI73oMjpDY1y+4bmEoL2DDdSjoaX/Gq2J+q7U/y1GObo0M41PN
         89Ps3BWtI76Eh3BSaGuOi4Bm8huVoWM7uEN/jfuSOS+8vuWNT7WpZ0VyUJQrwxjvHIAx
         AmZkh+X6uU7UQN+pj6Sjsv0thdeqR++v4H/sdHwEZyvpZ6gx3exJsEuzduW5PHaW0XtM
         B2xW7jTtfigZ4hVLLYhAUtxSjHg3hkVExtqqJAEmWC5KTwgzW/y2OoP3gf5ZmGGLQmRL
         cr5hyWG1lHEa8F/PrQ+sx9nUci3em/EVQDCtaPj0Lizy5Z87MCdAgHlXyCcUcDvpzenZ
         lAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723082; x=1795327882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=eQ1z9bRnC981yMP564ceFhl+Q6asP2a3dqTootaXCSX9JvQR0Vf77Fhee8Tkx8mBLD
         XOQGcdsdsBMhOfb055BFCo0/6a9rdbgG1lxcZThMhGTH/dBUp1R1N/MKRFcIEkLjjTX0
         VEXljfn6IoVacDMgUO0BuBp1gML33gawvkeS3W2wHqC9dJOty0kkZhEmM2Qqqmr/0OpV
         QfHpQMbaZA7HKE1lEWUsxAjC5GjWsaDaH+MqEk2AQW+1E3/OS9JIYm2AdUvawjfyOMy+
         jXKjNKOiuRHj1VpE9s/tTm10buONo/F5G1K3Vm7qfDok1w7kDDvkojMEVhhEMxihpoue
         op8w==
X-Forwarded-Encrypted: i=1; AL+hErFoZF9VLb5BqwXJkUdYprnGlZvW1I14p22b2Uz8998upvn8jhH86Yv4KwfOHAOThil9B9FGsoHGMiuHiUw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wHP8HrO9pSlqRTEqUTXO1zJfKzKnTv61mQ2ok+Pj/aob1nqCE
	C8o75fWflqDRdIkckNPGakFHTIqczSe+s+dwGZcrdJ8AoumlI6RVS7ey
X-Gm-Gg: AYBFou1YbEaheK+eGK59Cm3cM08+EGcbXLRPCnAP0HisV5EVqOcUnbl+s8MqDi70WoA
	pK2IKA9bQQEZSvJngVdM6LXe4Qk3d0yN8W65SOb9puZrwv3cquvTG30il2cfyS8nrwYJdFi9Gme
	QiXXTja3rIEBh7d0iWxT7tqOpTZOAz3obnNmx0mFPGb3ppdcaLmdde1rEsyx9Y11da2jgyN4Oy/
	A2uzJ5qIeqhaSyv6DwJTq6ieVQXcDonpZlBQFK+JLmWfZYBrNR8OoSkLn2nWDwL1seAZZbfe4U5
	A1rNdZJsG/BJ3ArDRU3NftY2/vdSBqqM93C0WGaZvkX3piJPnyGIjiPC0d1UV63+9X7I3GmfG88
	+Q/rOs/B/z6NNIEOL5v1jWIif/P4ORdJz99FUVYDPacKtHRLO730fjansELKq8L9+QjATBLc7/h
	Qt56Lw6DzgZmveOQir+nOfxun3igcRVSerSx/2BMFzoeWurC3mMu7LcsY1dNn6g0U0mymzgZDIK
	cQsbzVYVkLflZoj1lict4KGz7ZzeOhSDWts+KME3N/dxM+WkfI9odExYk1PGChSNazx9PL91jtF
	GyfNmbJ5DAe4kEapBiVLm5vGhDgJWS905nioFi+lvOHHlq1aeriULIVE+vUNNTzPN+ezKFOJgHV
	3Snztc5xIxzrBnqOad8E/lzFh0atBCRDvIE7hl7cmXqL9wm7mcT1/F984HegqojjNyNEmxhAm6w
	LfAuoZtEXJ4GbE3xIoPPzF8Dp+3PK1EH1eRW+hsHdNvWmm4b7o+W4ImOetJiWWpyx20MAszJaoy
	FQjYAae/XseL4op9AYVM8HqM+viLEbCZUE=
X-Received: by 2002:a05:600c:4752:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb55ab2b89mr152010325e9.22.1794723081993;
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sun, 15 Nov 2026 07:10:55 +0100
Message-ID: <20261115061102.229680-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

Positions of clocks and resets changed when version 3.3 was introduced.
However, old positions still work, just by luck.

Note that DE 3.3 actually has only one bus clock, which is shared among
all cores, even though it is named BUS_MIXER0.

Fix Display Engine 3.3 resets and clocks according vendor driver.

Fixes: be0e9a372787 ("clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 39 +++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..6ec6c0dc4c26 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -36,6 +36,13 @@ static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
 static SUNXI_CCU_GATE(rot_clk,		"rot",		"rot-div",
 		      0x00, BIT(3), CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(mixer0_h616_clk,	"mixer0",	"de",
+		      0x04, BIT(0), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(mixer1_h616_clk,	"mixer1",	"de",
+		      0x04, BIT(1), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(wb_h616_clk,	"wb",		"de",
+		      0x04, BIT(4), CLK_SET_RATE_PARENT);
+
 static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
@@ -54,6 +61,9 @@ static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
 		   CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(bus_mixer0_h616_clk, "bus-mixer0", "bus-de",
+		      0x08, BIT(0), 0);
+
 static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer0_clk.common,
 	&mixer1_clk.common,
@@ -74,6 +84,12 @@ static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer1_div_a83_clk.common,
 	&wb_div_a83_clk.common,
 	&rot_div_a83_clk.common,
+
+	&mixer0_h616_clk.common,
+	&mixer1_h616_clk.common,
+	&wb_h616_clk.common,
+
+	&bus_mixer0_h616_clk.common
 };
 
 static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks = {
@@ -147,6 +163,17 @@ static struct clk_hw_onecell_data sun50i_a64_de2_hw_clks = {
 	.num	= CLK_NUMBER_WITH_ROT,
 };
 
+static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_h616_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_h616_clk.common.hw,
+		[CLK_WB]		= &wb_h616_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_h616_clk.common.hw,
+	},
+	.num	= CLK_NUMBER_WITHOUT_ROT,
+};
+
 static const struct ccu_reset_map sun8i_a83t_de2_resets[] = {
 	[RST_MIXER0]	= { 0x08, BIT(0) },
 	/*
@@ -180,6 +207,12 @@ static const struct ccu_reset_map sun50i_h5_de2_resets[] = {
 	[RST_WB]	= { 0x08, BIT(2) },
 };
 
+static const struct ccu_reset_map sun50i_h616_de33_resets[] = {
+	[RST_MIXER0]	= { 0x00, BIT(0) },
+	[RST_MIXER1]	= { 0x00, BIT(1) },
+	[RST_WB]	= { 0x00, BIT(4) },
+};
+
 static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
@@ -244,10 +277,10 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
 
-	.hw_clks	= &sun8i_h3_de2_hw_clks,
+	.hw_clks	= &sun50i_h616_de33_hw_clks,
 
-	.resets		= sun50i_h5_de2_resets,
-	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+	.resets		= sun50i_h616_de33_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
-- 
2.43.0

