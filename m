Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846201;
	b=n0QLg15WD/KD8WGrQXkERMnFIvKvTHehPM9XaUT6xdGfLed7dxZWyj3RLaT/0TsbG9a4
	 DqQOi2IRo2cjqYUDAXwOED/WDY07DgE9N2Lr7hP+WWiiI+DoY8XHLCgYtPZITWRfMlQ0u
	 gL8CGTMyEBQ6cYAQ1kk65C7I7ILMYYKC99o2q7RawEdkXLNV9/WrszpkzD3wsgMudWJYI
	 FrkajohgdabYHI7fq01bWoRcI7s6NZ1vpOqSunq9YBJwB6rvHmRgVtBF72bFa9SEkw9Bk
	 RS9HV9LjeU6Y1D/oJouO1NfVzypRFXShAD4qs+PQarHL/7NNc6reI08yxLxVcuBEP8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+HwM2ydTAe0mqCYJlylzv+eL8gchpaX9yJamjudWToY=;
	b=ljF3/kLfD1TOrmiOlLaM4FVFShsrVApyIlaUWzTxKoNPN5RtjPK1CXdL1EEcsEKhtHv+
	 Mu9sagslKL1fGzFMlEsQFIwZKbgzNibNk9NJtc12b2TYEJgxUxMZaLps76eH5nwtCaf8e
	 t6cL/8g2PG30szo6CXy5qaxHOeJxLCOtMpstUVA1o89FkWN3nd/ZcAdhPLhxXTGFvYA1J
	 gVNd2VKwpo4p9i9BBSiEZsmiXaOPzJU7x5cCW3W1GiYDAWQslByL+fo+O/19aDMFPnCjT
	 JLBtPMaDwnDjgwT44t4LNINepwK+bRiwOykXQPK3wOaw+fktUpmXO1Ib6hWMrbEfTjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZkBJbft;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7941B606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7941B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZkBJbft
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso1605274b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794846200; x=1795451000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HwM2ydTAe0mqCYJlylzv+eL8gchpaX9yJamjudWToY=;
        b=nZkBJbftcYhGeAUaJJQG9CM7N3cgcUvM5jD44V3Q2I9KiE73lmbPeys+Q1uy/eyUxU
         veGafFmO63CH3IgGisZpyEK0KcM4rj/nkRYo0QbjGKB60EjuAMtYH0uuUZtDBjGWuxf1
         O4Dq8M5IhOR0phT09SlxyNIJg4BCEBwxbAIlkY4XhgbuZPf2R/7zKSI9eTmhbEXjeomc
         ZnrsEEPzVhEpQ5XOpjaGfAb37dndfxFHrROnrtpOdCLbayIOSQCBgyrKKq8/aeCoNGWl
         52WimKzNUGlv0B2zmknVgvq8T1tx/g/Y2IIGDCVSn0hTeQWAq/yl0DofRAcH2pOg2CNv
         YiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846200; x=1795451000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HwM2ydTAe0mqCYJlylzv+eL8gchpaX9yJamjudWToY=;
        b=PaL4TsPNDeSn09Av1zGm8C0NHqCynNndfYZOHA9hWxzfQPSyvcDBgpCZ/9rFlWsQ4v
         M12OrwqyG0Yv1SLg9MXAcxF9M1B/UHlIsjbDB9QD1bXThzYqLlmZmQ6HzmkHaCwka0bv
         VObJTcuI4FehXiEDRxqkOg77POe9Bs3u23Gm4IU7Q64IlFMjO5wW3y8IQAVHg0BClfu4
         6GLOAQkrLzJEz3ipenJU/5ddj4tit2KV8U4L7Z8PfsXBpMBU5BuPZKapqq1y66vHzQ0L
         ItdhaGtsmet16vr+2VI1OAW6GOXJU7V6zhCSAZos53kYVYdXvZPU1W0hf1Tzsu1vmbt7
         ocOA==
X-Forwarded-Encrypted: i=1; AL+hErHkR9JFcidDmunRl/XZ/G/pPNgPjizYAz4meB9s37PmmIWagRkLr6d9gM8boIgDXyVbCVdzG/ymSm1qlSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8veii0PLv6xSozU2f1tZOL9totFD4ueAoqE5546qlSHEvAoPKZ
	JJcIk75516klzeHn0daLDyG7QEwuYa2amfW4nzqotHZSvg++zCXT/jW1
X-Gm-Gg: AYBFou1dKy5Zx5YAPNcJTXPkCk3ua7ZUXVomwW076jIoQBwCgDP9Tr3kmYcFX75woLG
	R6H7qgyvKpRl1+pyR5Aou9a5B3qfk1+UQGpI2rWsnT0Linj81CDrNjmuL1BguhANyWjT1j9uCe1
	/zSlPVTX93WUBxOwydLOud7FFnQjN5b3O3b6NTY/w7Zb4XIQK1EeoTL6clPM6RjsNr2OvA+65xZ
	aQwBie72EITDgIOeSPm1nvbYmBytmEAX6OUgkPouow+waIS2FjaLulMpN0c9KgixE8i+sGUoGIl
	vueM6YWnbYSh/WcTwsR0lCoAUl5q0mpEnJ2c+0CXVnpF55pXgFYTyQfi61XT4dfKd859Gzc+veV
	KfENOuVquK7e7YxvCyxs8hRBGcTO/p43lHGBPpY+cSBacIgxaHpiSvToWoy5UUAvOszxo0hOkkZ
	Oos8viw2hwb8xxpnjWy/qQI/zcjcgwpduus0gR2ImnmXk6urD3fwJHBzDzMnHbBoo6bZflW2vm+
	5Ln1qB+4RgapsWjjslFw4tQyeAIsZX1QTeh3URK1dvwbHpXehoLN8+VBIzC1G+8ZDZl3gAlV/nK
	FxP3YxrqKVFH8d3M+VMXBwFyxGx9ZggCkMgho+BpfkX4p9sL66A1ky4=
X-Received: by 2002:a05:6a20:a11c:b0:3e2:729c:9bcb with SMTP id adf61e73a8af0-3f7a8cd7b2dmr11277756637.65.1794846199588;
        Mon, 16 Nov 2026 08:23:19 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:6e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18cabc9sm4580926a12.30.2026.11.16.08.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:23:18 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: dsa: motorcomm: Resync SMI slave before register access
Date: Tue, 17 Nov 2026 00:23:00 +0800
Message-ID: <20261116162303.1368472-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A register access over MDIO is 4 frames: 2 address writes followed by
2 data reads or writes. The SMI slave tracks the phase in a state
machine, so an access interrupted between frames, e.g. on an MDIO bus
error, leaves the machine in an unknown state, and every following
access fails or acts on a stale address until the machine is realigned.

The driver has so far assumed every access succeeds, and relied on
manual resetting when the state machine wedged. However, without a
dedicated reset line, the reset itself goes through the same SMI
interface, causing a chicken-and-egg problem.

Realign the machine once at reset, before the first register access.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
v2:
 - only reset once at setup
v1: https://lore.kernel.org/r/20261111163954.1132921-1-mmyangfl@gmail.com
 drivers/net/dsa/motorcomm/chip.c | 101 +++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 35e70b322608..5d6390abd7cb 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -98,6 +98,103 @@ struct yt921x_reg_mdio {
 
 /* TODO: SPI/I2C */
 
+/* Realign the SMI state machine _on a best-effort basis_ - see below.
+ *
+ * An SMI register access is 4 MDIO frames. An interrupted access leaves the
+ * machine in an unknown state, and every following access fails or acts on a
+ * stale address.
+ *
+ * The driver used to assume every access succeeds, and relied on manual
+ * resetting when the state machine wedged. However, without a dedicated reset
+ * line, the reset itself goes through the same SMI interface, causing a
+ * chicken-and-egg problem. Furthermore, the driver verifies the chip id before
+ * firing the reset, so the reset can never be triggered reliably.
+ *
+ * (A/D: address/data, H/L: hi/lo byte, r/w: read/write, ?: the same flag within
+ * a rule)
+ *
+ * State Input Next Comment
+ * ----- ----- ---- -------
+ * AH    aw?   AL?  step #1
+ * AL?   aw?   DH?  step #2
+ * DH?   d?    DL?  step #3
+ * DL?   d?    AH   step #4
+ * A?    dr    A?   `0xdead` sentinel
+ * ALw   awr   ALw  ignored
+ * D?r   awr   AH   abort, frame discarded
+ * DHw   awr   AH   abort, frame discarded
+ * DHw   dr    DHw  `0xdead` sentinel
+ * DLr   dw    ?    `0xdead` on following drs; next state undetermined
+ * DLw   awr   ALr  abort, frame consumed as next access's addr-hi
+ * DLw   dr    ?    `0xdead` sentinel; next state undetermined
+ *
+ * Any other REGAD/op combination is not characterized and never sent.
+ *
+ * The reset sequence is awr, dr, dr, awr, awr, dr, dr, plus one more dr
+ * as a heuristic sanity check. The `0xdead` sentinel cannot distinguish between
+ * AH, AL, or D?w, but when this happens, it should be classified as a model or
+ * hardware error - in either case, there is no use to do more check.
+ *
+ * This is bus-related, but I'm not sure whether it should go to
+ * yt921x_reg_ops - decide it later when we do have a second bus type.
+ */
+static int yt921x_reg_mdio_reset(void *context)
+{
+	struct yt921x_reg_mdio *mdio = context;
+	struct mii_bus *bus = mdio->bus;
+	int addr = mdio->addr;
+	u32 reg_addr;
+	u32 reg_data;
+	int res;
+
+	mutex_lock_nested(&bus->mdio_lock, MDIO_MUTEX_NESTED);
+
+	reg_addr = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_ADDR |
+		   YT921X_SMI_READ;
+	reg_data = YT921X_SMI_SWITCHID(mdio->switchid) | YT921X_SMI_DATA |
+		   YT921X_SMI_READ;
+
+	/* awr */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* awr */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* awr */
+	res = __mdiobus_write(bus, addr, reg_addr, 0);
+	if (res)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	/* dr */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+
+	/* Heuristic sanity check: expect AH + dr -> AH `0xdead` sentinel. */
+	res = __mdiobus_read(bus, addr, reg_data);
+	if (res < 0)
+		goto end;
+	res = res != 0xdead ? -EIO : 0;
+
+end:
+	mutex_unlock(&bus->mdio_lock);
+
+	return res;
+}
+
 static int yt921x_reg_mdio_read(void *context, u32 reg, u32 *valp)
 {
 	struct yt921x_reg_mdio *mdio = context;
@@ -2225,6 +2322,10 @@ static int yt921x_chip_reset(struct yt921x_priv *priv)
 	u32 val;
 	int res;
 
+	res = yt921x_reg_mdio_reset(priv->reg_ctx);
+	if (res)
+		return res;
+
 	res = yt921x_chip_detect(priv);
 	if (res)
 		return res;
-- 
2.53.0

