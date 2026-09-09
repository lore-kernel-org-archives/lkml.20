Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF3B54DAE9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 12:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788955713; cv=none; b=JNsASXhrip9ya2v2u38vXZi3BMS9iI7tRhyHXZNhx3P9aByfnPViitIFCTQezDT6F3ADX1hWB4/tcHoMe4TQ/6RnyBhZE1/PE9BDkc3loFBJyBYO0KQnsIZV57j/N6ejOKWHcNAcCTIjw/Lqkbt7IKus+4KUDTkj9Hoq4HJrioM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788955713; c=relaxed/simple;
	bh=FEYAAO6pCKqj2A+BD1FimNGZyov3kVMVDmohN6P/W5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JvKXM7GizPwIK86RAG8FO7aZ13RC8f5iNrLITN01x6UYcWV630XKUGYr5TOMM+TdBSLYCqtOom3xMdQb1yj1ldTgdi3k8z/t0Z9puJn0zWYf8JrB48YovEMl1bYw1LnKvqTWbJOWSQt8W1j1cgL+U6/D1/4WZJ0Eh//iONbc9Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVBcCjiA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVBcCjiA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so46135875e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 05:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788955710; x=1789560510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TprgLdwsI5e3Seg1jFebtv2HCsPpBUoE0nDTX9l+dok=;
        b=VVBcCjiAqjS/1LWiJC5dg1P510ZN0S0rMfaFKRdU8HeB1f75234AH1B/XxR5lb0WR5
         LXyomIR1dSqnNu8VVICuqcDGV3+a7w1QDmcGcOwLMi26JYigGGeTu2x8Hj0FD9VAITe3
         dVP3qbTiiBgnPwa0z+oBRF6mpkVX++fDx0mSzJpfxci3z04SAOrigfudPxrpFByt/ri0
         2S2fmWinIqqo3xhSqa+KXDtPtBOENpxYMMnAsr3LP4HfVjl92k2zSnupWwg8g9yO+fUQ
         z8u8aAsic0C4C5Slok+RCWkjS/3GlUJnfZt1OtysCIMUTOQBDf9hS4/Z++JAD2prDztA
         202w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788955710; x=1789560510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TprgLdwsI5e3Seg1jFebtv2HCsPpBUoE0nDTX9l+dok=;
        b=PhnLmt9p16Pva8oFJl5OerrNyAIcjF9LSt+1/ENlVKfuaBb0SbiWOGGyKmZ/gaY97r
         w4wQjT1C5rTKZgqVm3NlGWCy52IeCYHlBoxImGr2WPCHlUkh46b8p/hhyCqvv9bjovXR
         /DJy8J5adHBrOfKImPk/Pp8mncz1r4nNPDi50T2X2nDciiNLN4RwxEOsR65DNnuRznjl
         oFWjnSbqLPLaHJcham/m2jv2oWtuoXOhI4pVgtHJyrEGBIN4KD+l1/YWfgmbU+oyAgX5
         tijaJGuRw5WiPPXAJ1MpIwiBg3EI7flSabaTGvU7SH/Daxt9Z3wmp3O9U9x1SVH3HaFc
         Hbzw==
X-Forwarded-Encrypted: i=1; AKwUvBx1hpqQ1wHb14opsPm4ieIb1sODccM3KzhQXcaPMmvQ+VF7+BmQXMon8kohVe2jxjUF6QRpqNDJ7yjsUn4=@vger.kernel.org
X-Gm-Message-State: AFuF++l2ObyzP3llPv+aK6vEx6GNVUAXaEPWeIzp5lpw6kBrKH30Vpeo
	oepemgSAtIM+X3weMeSpYetmtGJG+GcwdjqHohtdGho5yxB7Z1cfDJ8X
X-Gm-Gg: AYBFou0VIVqr7u4oP4vtuA6vqleqpB5jsnePaf2lsxmItnUNHkFVmp3eQy8ouTEQvXi
	9t/oCzEUGo4pfNfWH8pHsNwtk8iiOZ5Z7FJSZps3b+jgipOPnAjb5v76cs/DccDCsq3rLGaCY5V
	LE2qXZtvOxfl/WRdaZrQ23JW+dnVYhXnfIwroWqc886yYqIhO+IfZqxb5zBIdgmFwyIbLXU34Jl
	i0t7qrwqMnhg5dl1HhGscyP2DX/tKgvzrOTXbsn4sVJYzO6La51XJNJomAK0Ao84U8dL9bjhCAq
	yX2sv/sQwxDQCN6y1YMx/v4YECWBG1dTmGk8C+98gbEeCaxQ+cCF5sJe+zCpldgQQdt9v9mYdf5
	Si6VtPiPa/YJat7BBooO/ytlITKuxdd0q720FozKYCQFoI3inXurievCscfEO60wmq/aBwz5oWu
	YWBkPh3pRDIqt38qS7/EE33W9o5lExZ+/hHZHqSJchfBkS3j3ib8ez1E2mIhsWcgB5sJzE4c36J
	5HlHjVYH8zJ7meLlxZ7mw==
X-Received: by 2002:a05:600c:a05:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49cfc6ea772mr315974165e9.27.1788955709705;
        Wed, 09 Sep 2026 05:08:29 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:c51:e108:176f:2adf:3ca6:dc52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm41762835f8f.22.2026.09.09.05.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:08:29 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stanislaw Pal <kuncy7@gmail.com>
Subject: [PATCH net-next v3] net: dsa: realtek: rtl8365mb: wait out the full chip reset time
Date: Wed,  9 Sep 2026 14:08:25 +0200
Message-ID: <20260909120825.33350-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Realtek documentation gives the chip 1 second to reset, and the driver
says so in a comment, but it only sleeps 100 ms and then polls the reset
bit and continues as soon as that bit clears. The bit reports that the
register block is back, not that the chip has finished its internal
bring-up: Luiz notes that older parts such as the RTL8367R need
noticeable extra time after it clears, so a driver that keys off the bit
alone is relying on that margin being zero.

Sleep out the documented second before touching anything, then read the
bit once and fail with -ETIMEDOUT if the chip has not come out of reset.

Probe therefore takes 1 s on every chip the driver supports, not only on
the part this was found on.

Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
Changes in v3:
- Drop the deadline arithmetic around regmap_read_poll_timeout() in
  favour of a plain msleep() and a single read (Luiz, Alvin).
- Retarget at net-next and drop the Fixes tag and the stable Cc; see the
  note below.
- Link to v2: https://lore.kernel.org/all/20260908174403.420507-1-kuncy7@gmail.com/

I have deliberately not carried Linus's Reviewed-by from v2, since this
revision replaces the implementation he reviewed.

On the evidence, and why this is no longer posted as a fix:

v1 and v2 justified this with cold-boot failure counts from my Archer
AX55 v1. I no longer think those counts should carry the patch. It is a
single four-year-old board that has already had one confirmed power
supply fault, Johan cannot reproduce anything like it on an MR80X v2.20
with the same IPQ5018 and RTL8367S, and Luiz's own observation is that
family C parts should not need the extra time.

Alvin put the dilemma precisely: either the supplies are stable, in
which case a cold probe and an unbind/rebind should behave the same -
and on my board they do not - or they are not stable, in which case the
board is out of spec and its behaviour proves nothing about the driver.
I think the second branch is the likely one here. For what it is worth
my device tree describes no regulators for the switch at all, so there
is nothing for Oleksij's series to consume; I will follow that up
separately rather than hold this patch to it. The device tree you asked
about is not upstream yet - it is in the OpenWrt submission at
https://github.com/openwrt/openwrt/pull/24197, file
target/linux/qualcommax/dts/ipq5018-archer-ax55-v1.dts; the switch node
has a reset GPIO and no supplies.

What is left is narrow but, I think, still worth fixing: the driver
documents a 1 s reset time and does not wait for it. That argument does
not depend on my hardware. If you would rather this waited for someone
to reproduce a real failure on a healthy board, I have no objection to
it being dropped.

The companion patch, "let the SerDes PLL settle after the data-path
reset", is withdrawn - its evidence came from the same board and was
never isolated from this one.
---
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -136,6 +136,9 @@
 #define RTL8365MB_CHIP_RESET_SW_MASK	0x0002
 #define RTL8365MB_CHIP_RESET_HW_MASK	0x0001
 
+/* Time the chip needs to complete a reset, per Realtek documentation */
+#define RTL8365MB_CHIP_RESET_TIME_MS	1000
+
 /* Interrupt polarity register */
 #define RTL8365MB_INTR_POLARITY_REG	0x1100
 #define   RTL8365MB_INTR_POLARITY_MASK	0x0001
@@ -2981,17 +2984,27 @@
 static int rtl8365mb_reset_chip(struct realtek_priv *priv)
 {
 	u32 val;
+	int ret;
 
 	priv->write_reg_noack(priv, RTL8365MB_CHIP_RESET_REG,
 			      FIELD_PREP(RTL8365MB_CHIP_RESET_HW_MASK, 1));
 
-	/* Realtek documentation says the chip needs 1 second to reset. Sleep
-	 * for 100 ms before accessing any registers to prevent ACK timeouts.
+	/* Realtek documentation says the chip needs 1 second to reset. The
+	 * reset bit clears before that time is up, and it only reports that
+	 * the register block is back, not that the chip has finished its
+	 * internal bring-up, so wait out the documented time before touching
+	 * anything.
 	 */
-	msleep(100);
-	return regmap_read_poll_timeout(priv->map, RTL8365MB_CHIP_RESET_REG, val,
-					!(val & RTL8365MB_CHIP_RESET_HW_MASK),
-					20000, 1e6);
+	msleep(RTL8365MB_CHIP_RESET_TIME_MS);
+
+	ret = regmap_read(priv->map, RTL8365MB_CHIP_RESET_REG, &val);
+	if (ret)
+		return ret;
+
+	if (val & RTL8365MB_CHIP_RESET_HW_MASK)
+		return -ETIMEDOUT;
+
+	return 0;
 }
 
 static int rtl8365mb_setup(struct dsa_switch *ds)
