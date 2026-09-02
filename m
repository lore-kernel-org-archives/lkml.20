Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A2049B1F4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788359049; cv=none; b=iiXjcAmS6ELe1AwDKJ8ou/OxiwErHHGfiRybn6dqX9QkbRJwNljfuouSD2NI1TxFIqvzXKKgXpKBwW7jMFDxheuguHHCp3SwyXI98eq88ABN0fRaGhBX76GxkP/MtVLYnDkruR+KlRApTGuGrI85zvz2g82nbxXJlMXjB5rgXn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788359049; c=relaxed/simple;
	bh=9jRqscV2vyiWLZHtQQYToWuhN2milvu8Wk+kEmi486I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=snoAU40ViCQVyssQNktSynVLTwkE2PIms6zb7FC7i8FzcqHKX5f11OLQ5yJcqokQswlmlG1ETerYR7v+kriwVoRgDdfIkTMTR4L4+kjS7k3gi49eu+PPbkuyn9163Q8j1S8p8rMzxEQIUQej7NTex6Uy1T3LPgxWWcFekDUXZLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lni6eBnf; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lni6eBnf"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b8687630fso8813275e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788359045; x=1788963845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YZlYUa5vZ3YMWYevs3vCXgZ9Ntr1YXdsetznlF67liY=;
        b=Lni6eBnfjFt94GjymdnjUCTmBhSAxnxj++MyJIWl6SU8HDHkTNFm35vXDPef7yUO+x
         RfpEUf6bshR0Lj4n4Os6O7OoE266c6W2AtXpditgtAJhMcX2O0r8Ghk1yElRCJrHuR/v
         H7oOQLDXMhmzubr06GO4CTwQSeGWU0a7gpOXLxxygLebz4TAEAhoPZ41El89IlUBqhWs
         96csFPVbAsrfl4ZrB1ZEE0qLzdf5iGSa+P8NGfuiT5FTqZU7UPKaQstE/YGGk7lVT+mz
         rUtA1sidt5XzgcQjBE7lv4mnC4GYT9MYr235ZjhDm6tKxj9j70Uarw1PbZ5sgWzSy7pN
         rx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788359045; x=1788963845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YZlYUa5vZ3YMWYevs3vCXgZ9Ntr1YXdsetznlF67liY=;
        b=Sig6x+Iff/JW0qalTYPPo466prw5Y9WbER2L9Pxyxn7WZC3DG/s2vllWRKdr4rjdQg
         BfRGgbve2ZESvlexuLX9o7S7KpAl61PdZQxCGAqm75ob66iz8hLfyVjHw1fQ0FZfTS8T
         sXZyJsPvKHb1b+t3a6fr6cclWdTSCbdkpJ6qEzYZ99hpLUWc/XYJ1/CKhuxMJOKiQ1Jq
         HYBFtE71YFWbgRfTXQamvPJgHx3w1ccfJQV/Z2R5885Mq2ixcbXSZny7UuB9iuiXWq5D
         2FpHp8qn1Oy+z2Eiu1/57oXaCw3tsgxBHjeUn9SmsrESTpJK7W1UynI2kXPsYQ+P16Oh
         RNQA==
X-Forwarded-Encrypted: i=1; AHgh+RrU5dysISsZfxv0UepmT9omwrzLnJslP4jV7ajHQJNcrsbrfft61wv48seRKnKtw1GabIQ6V16YswQAIoY=@vger.kernel.org
X-Gm-Message-State: AFuF++kJ8rJJ9VyyfuT7NCrOWOK9kIVEjLw547B3umnzcsQAiI77+s/D
	LpwYR4lbaOX00VA/sDSKyzbkNRNIqI3qseG20mqpTe2vQi6WDp6fo+Gc
X-Gm-Gg: AR+sD12VaruSpmIees/UR9/maEo8EJPvizQgAWU2IVkbVbUXYpIhY7g3qvGxbhc3I7j
	lV251IVVjczOYIUQ8EjZaM2A71YzMNTdw1kACvHHQgHinvmONEU+nEwl/62RVICuWOK1r+1p4gx
	4axI7Sf/2QALzv65BDpoC9618rlzbIUn9SHSGBPQETkP+Toj9y9Q9pLjjG0URDCW6UMiMhT0F9m
	oSBxYc+nibUcYkMIVyIrTlj0MQR2aCWncu6Pt0refVJOQVV3sm98qVHCjJwSLpzZr3mPbVBRKb/
	mfxv+tY5WA1hDQkYz4icbrpnApl3oTjDGg0U+gQBIOEVAtJw7lVVs6hyHSAYAwtvhhJ74Fb8n4Z
	TzliXUrCyS8jDusGswpGcJv+6XvJhJi5BRtiexe7KnD/xingNSkbu58+uyWsgQ6HSJNpp23T5t8
	+5iGWofBfksSOutZiiHLVxKoDvx3HCwCIeFKKdWGfthhSaAYCdT3Q95OTkOt2XPPyeD7v6bx/cE
	364Ti+v7ZIfuQqhOXu+uS1bcqc+KaN9fGii5HT9KI6XaupvkyTrKtyRH5k=
X-Received: by 2002:a05:600c:1d89:b0:49c:ed8f:d094 with SMTP id 5b1f17b1804b1-49ced8fd250mr33251625e9.10.1788359039726;
        Wed, 02 Sep 2026 07:23:59 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net (mob-83-225-30-215.net.vodafone.it. [83.225.30.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm58999265e9.1.2026.09.02.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:23:55 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	dan.scally@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>,
	Arsalan Naeem <naeemarsalan@gmail.com>,
	Jakob Berg Jespersen <dev@berg.pm>,
	Fil Dunsky <filipp.dunsky@gmail.com>,
	Lucas Lis <lucaseze.lis@gmail.com>,
	Kengo Oki <dev.kengo.fugu0141@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v5 4/7] media: i2c: ov5693: Gate the MIPI clock lane for non-continuous clock
Date: Wed,  2 Sep 2026 16:23:18 +0200
Message-ID: <20260902142322.73523-5-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902142322.73523-1-fernandorimoli11@gmail.com>
References: <20260831181858.325109-1-fernandorimoli11@gmail.com>
 <20260902142322.73523-1-fernandorimoli11@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ov5693 never programs MIPI_CTRL00 (0x4800), leaving it at its 0x00
power-on default, which lets the MIPI clock run freely. The IPU3 CSI-2
receiver tolerates this, but the IPU6 receiver (e.g. on Microsoft
Surface Pro 7+, Pro 8, Pro 9 and Surface Go 4) fails to lock onto the
link, so the sensor streams but capture times out with "stream stop
time out". On most affected machines no frames arrive at all; on some
the failure is intermittent.

Gate the clock lane while idle at stream on when the endpoint requests a
non-continuous clock.

Only the gate bit is touched, so platforms that do not request it are
unaffected. No counterpart is needed at stream off, as the link is down
by then and the register returns to its default when the sensor is
powered off.

The property is supplied by the ipu-bridge in a subsequent patch.

Link: https://github.com/linux-surface/linux-surface/pull/2171
Co-developed-by: Arsalan Naeem <naeemarsalan@gmail.com>
Signed-off-by: Arsalan Naeem <naeemarsalan@gmail.com>
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, IPU6 Tiger Lake
Tested-by: Fil Dunsky <filipp.dunsky@gmail.com> # Surface Pro 8, IPU6 Tiger Lake (8086:9a19)
Tested-by: Lucas Lis <lucaseze.lis@gmail.com> # Surface Pro 7+, IPU6 Tiger Lake (0x9a19)
Tested-by: Kengo Oki <dev.kengo.fugu0141@gmail.com> # Surface Go 4, IPU6 Alder Lake-N 8086:462e
---
 drivers/media/i2c/ov5693.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 02236f3db..cedc6ea03 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -35,6 +35,11 @@
 #define OV5693_STOP_STREAMING			0x00
 #define OV5693_SW_RESET				0x01
 
+/* MIPI transmitter control */
+#define OV5693_MIPI_CTRL00_REG			CCI_REG8(0x4800)
+/* Gate the clock lane when there is no packet to transmit */
+#define OV5693_MIPI_CTRL00_CLOCK_LANE_GATE	BIT(5)
+
 #define OV5693_REG_CHIP_ID			CCI_REG16(0x300a)
 /* Yes, this is right. The datasheet for the OV5693 gives its ID as 0x5690 */
 #define OV5693_CHIP_ID				0x5690
@@ -144,6 +149,9 @@ struct ov5693_device {
 	struct regulator_bulk_data supplies[OV5693_NUM_SUPPLIES];
 	struct clk *xvclk;
 
+	/* Gate the MIPI clock lane when idle (CSI-2 non-continuous clock) */
+	bool clock_ncont;
+
 	struct ov5693_mode {
 		struct v4l2_rect crop;
 		struct v4l2_mbus_framefmt format;
@@ -611,6 +619,19 @@ static int ov5693_enable_streaming(struct ov5693_device *ov5693, bool enable)
 {
 	int ret = 0;
 
+	/*
+	 * Gate the MIPI clock lane while idle if the CSI-2 link is configured
+	 * for a non-continuous clock. Only that bit is touched, and only in
+	 * that case, so the register keeps whatever the platform left in it
+	 * and the clock stays free-running as before everywhere else. It
+	 * needs no counterpart at stream off: the link is down by then, and
+	 * the register returns to its default when the sensor is powered off.
+	 */
+	if (enable && ov5693->clock_ncont)
+		cci_update_bits(ov5693->regmap, OV5693_MIPI_CTRL00_REG,
+				OV5693_MIPI_CTRL00_CLOCK_LANE_GATE,
+				OV5693_MIPI_CTRL00_CLOCK_LANE_GATE, &ret);
+
 	cci_write(ov5693->regmap, OV5693_SW_STREAM_REG,
 		  enable ? OV5693_START_STREAMING : OV5693_STOP_STREAMING,
 		  &ret);
@@ -1259,6 +1280,9 @@ static int ov5693_check_hwcfg(struct ov5693_device *ov5693)
 		goto out_free_bus_cfg;
 	}
 
+	ov5693->clock_ncont = bus_cfg.bus.mipi_csi2.flags &
+			      V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
 out_free_bus_cfg:
 	v4l2_fwnode_endpoint_free(&bus_cfg);
 
-- 
2.43.0

