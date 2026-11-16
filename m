Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853252;
	b=otnlsSNoTr14pvqkKOG3YOChR+fzsYyQZ9G2fHORao3J181yu1qOEJJ3p2acnEuzkwj9
	 EZUmqCaOiiWbdr8fD3c1PnepnzuoVccASPFZqZPltvYTRp7aLhS7KLN+LVp9eLaH0ehA2
	 oJC0kQzR8Djt9iykcWkmL5BqnfMS2tn4BSyBBDjhswv2gnzqaQmGuNFe4KnrG0bXxNO8a
	 cwATgPCiHI4AkaM158R3vNFD1lWtMO8o9msuhyb1p3Ty8hmXPG74N1b+WwnLYj1q6q9HI
	 o35pUFwGhIGih7ajSh0JK6Ien7ggS8DLDNbKd6xcEdiMDGeFAEI4/Hcb4sYDOW1sFwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3MZjUptPvV0NGm+NQGrttciOr9poGpV6qt5fO1NBMdQ=;
	b=dt/TA/qezT2TQn2ykE10QhuQQnt3eUkJ2Z8J8vVKN1ELh027K9ljpRawWY80ffO/PN5+
	 LMa+bnfquSVoAbgg7uG4/MGNPZCHitYezorrNBzCs6E765h3GIECFKV+azBV6vN7aBEBO
	 Wjj5sBTFBBNpBl8glZbbFjsIs4+LcCU1B3dXmzHljjifXSRZEtdxeUYdi/JPuXX/poikO
	 NoaOLPRk83hUTNRPt+nbRn2ogiH+XJGDxIhJA7+72+0fvIPQury61zR/iRKNBMnKr3gjP
	 Gqdhotya24TsxrVHVE6jSpW+cXLRyPikA88Sg/OxssH73MXrsG8R9pqacMESRt0AerA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VmbakR/S";
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D082606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:20:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D082606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VmbakR/S
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e98798cbddso19921795ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853251; x=1795458051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MZjUptPvV0NGm+NQGrttciOr9poGpV6qt5fO1NBMdQ=;
        b=VmbakR/SHyzoPhLhcM9UuvsRvLhgSwYKV9nnxC3HMUbGYMsGe3lwu49KkFJPI6m4OI
         Q2f5mszG4YBbwit0zb6a8n22fJG0a3oSHoSC00vmfjC7AxpwwxPwP8IhJ6aa/OCtdWrt
         54TmUzbO5YhwR61nAuV7IdKUSk5oaVSWES47giGWZRibmOXd0CXI+7zugGzHFEQbSIBL
         ZUJtMQrFraNl341kA0m1y1FWR2u2qM9asVfcKuYZxYwqhuL4Kpy6vnHD5HqwpFXtsdZN
         WMbNRLndJxzn3jk4yBWk9eyetaTnYJ8aSSogVkunriZCSTnAr7J308+r8z06Rc008hP5
         fiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853251; x=1795458051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MZjUptPvV0NGm+NQGrttciOr9poGpV6qt5fO1NBMdQ=;
        b=zCr3xmA1hasTfueTPMqBGmGJygozYlz534Zf49rxWuegrg2G01AFYbXmGd4n4uswNF
         UvVtRuqusZxxQsV//BmUteISMW4HlAaBpqETmjr28RlFdsE/uQahRGzUx1OYgWiXGR3I
         zXqNB651pfctsOowPnfx3h0JZe1WuQrzME9xCxO9Ri35sjOSI7XKRBO3b480o3ZlQQhK
         hLGPSxgr4LA4ChrYESIGRzWNI6XVesWNNGlD6OKUvYpXksUsMaQH2GljvjuRAjOfcDIg
         muvR4JzU80xdgvpPh9hVjBlZaAehnEypK5dCnD6M4mPQjQqXzgmhcBkqN1ZulwrL+MTZ
         S1pA==
X-Forwarded-Encrypted: i=1; AL+hErGJRzii813n2SFxUc2tRnivd7senPoGg0QdP27CideQ/1dLjMizZdrP9txSfM7hsaip0QBr/6DehrR/x2w=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+V1VQAMaJVLyrYAwDFQruwCy7zBkMJ20Du/6x62W72NtSHDMM
	R5rcYA5WjENchSM3MpZdB/cg5JEpornOFvvjazSUKn0P7uQpgDZ7Oibd
X-Gm-Gg: AZFdTZcuKDsZNnj5EdWxLURxzj88ks6QXAM24jbJWERAn5kU1R6XR6ct7ehOZ6rHM+R
	6gzwYo0+zKu6AwlVXlEHmDqRkRXVK7XLqH58wSNZ6gg9WbWGGXlcI9gfsDWR83zMB7XUaN3vNY/
	CkwXRtUMmCmNRDnDwsLUBY6GveReLQs5qj1r/J+wtjez1fkQ6QIqqDgqCEA117eqDGEfEHA3ttF
	C4lIPJ5Zb2Tf5IRNwf54OgKpD/sLvC0cReYSgMqmNqDAF3gT4t9qtrYcIC8+rg6o2NeXNIuUEFg
	nNuGjQiQ+TVKTmzSHojCJZ8uPeqVOCsGa8SfDmv/0tpKacPnpqrTWprUnimbNbEjcJMr1v4ejZA
	eDHmAh8ZZwKzqInWNAJYPG8uQ3jfbKzX+FqBDYlLqang/U8EpjFYuGm7tRLgeFhoTaiDKlJLc8n
	fvPZXE5VY9P2P0MabmU4i3szcKVcI4wpy8vSzTWLhPuiiCGCREYLU1IM4Yd8hpcn5Uny+sKIn7q
	0aRzlrOchrJE3/VCahImQzgCMu9n3ztefuHQi2Gzwxq+pQCYu9ilzeR0MsR4YMZsya5mHsilVm1
	asVFFQAiBj+a6X7pVRT5YMLBW2VbTah8bGcbRyfhn0V8KoEDKI8S9/92nUcgOOub4e9hv11k7+x
	Lu84Znk8IWXvQ79NSZ/OvfVu3WfsWpp0q/Kc39YLG2rct8ZS2rOk/V8Vtcg==
X-Received: by 2002:a17:903:3886:b0:2e9:9263:a6b with SMTP id d9443c01a7336-2ee0dfb0832mr95471945ad.40.1794853251181;
        Mon, 16 Nov 2026 10:20:51 -0800 (PST)
Received: from localhost.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a5877bsm2871775ad.48.2026.11.16.10.20.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 16 Nov 2026 10:20:50 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.simek@amd.com,
	richardcochran@gmail.com
Subject: [PATCH net-next v3 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Mon, 16 Nov 2026 10:20:48 -0800
Message-ID: <20261116-wiwi-v3-87afa10a8-1-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
References: <20261116-wiwi-v3-87afa10a8-0-ahmadexp@gmail.com>
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

The LitePCIe bridge in the WiWi Time Card production image cannot safely
service subword MMIO accesses. Bringing up its AXI IIC controller with the
existing byte accessors caused a fatal machine check. Two crash dumps
placed the faulting access in ioread8(), called by xiic_clear_rx_fifo()
during xiic_reinit(). The affected register was the IIC status register.

Add a platform-data flag to use aligned 32-bit accesses for registers
carrying byte or halfword values. Keep the detected register endianness
and use a single transaction, not read-modify-write, for FIFO accesses.
Platforms that do not request this mode retain their existing accessors.
The WiWi ptp_ocp change later in this series is the first user: it sets
the flag in the platform data for the card's XIIC child.

With these accessors on a WiWi card, the controller probed and at24
registered the board and MAC EEPROMs. Repeated EEPROM reads and I2C
interrupt delivery were tested separately on an earlier Ubuntu port.

Tool-origin disclosure, as required by generated-content.rst: Codex was
used to analyze the supplied crash evidence, implement the accessors,
prepare tests and draft this changelog. The request was to support the
WiWi card while retaining the existing behavior on other platforms.

Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/i2c/busses/i2c-xiic.c          | 56 +++++++++++++++++---------
 include/linux/platform_data/i2c-xiic.h |  3 ++
 2 files changed, 41 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index ab7916745..edb5e271c 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -66,6 +66,7 @@ enum i2c_scl_freq {
  * @rx_msg: Current RX message
  * @rx_pos: Position within current RX message
  * @endianness: big/little-endian byte order
+ * @force_32bit_access: Bridge requires aligned 32-bit register accesses
  * @clk: Pointer to AXI4-lite input clock
  * @irq: Interrupt number
  * @state: See STATE_
@@ -95,6 +96,7 @@ struct xiic_i2c {
 	struct i2c_msg *rx_msg;
 	int rx_pos;
 	enum xiic_endian endianness;
+	bool force_32bit_access;
 	struct clk *clk;
 	int irq;
 	enum xilinx_i2c_state state;
@@ -282,52 +284,68 @@ static int xiic_i2c_runtime_resume(struct device *dev)
  * Only the least significant byte [doublet] of the register are ever
  * accessed. This requires an offset of 3 [2] from the base address for
  * big-endian systems.
+ * Some bridges only support aligned 32-bit accesses. For these, access the
+ * entire register in its detected byte order, without a read-modify-write:
+ * reading or writing a FIFO register must perform exactly one transaction.
  */
 
-static inline void xiic_setreg8(struct xiic_i2c *i2c, int reg, u8 value)
+static void xiic_setreg32(struct xiic_i2c *i2c, int reg, int value)
 {
 	if (i2c->endianness == LITTLE)
-		iowrite8(value, i2c->base + reg);
+		iowrite32(value, i2c->base + reg);
 	else
-		iowrite8(value, i2c->base + reg + 3);
+		iowrite32be(value, i2c->base + reg);
 }
 
-static inline u8 xiic_getreg8(struct xiic_i2c *i2c, int reg)
+static int xiic_getreg32(struct xiic_i2c *i2c, int reg)
 {
-	u8 ret;
+	u32 ret;
 
 	if (i2c->endianness == LITTLE)
-		ret = ioread8(i2c->base + reg);
+		ret = ioread32(i2c->base + reg);
 	else
-		ret = ioread8(i2c->base + reg + 3);
+		ret = ioread32be(i2c->base + reg);
 	return ret;
 }
 
-static inline void xiic_setreg16(struct xiic_i2c *i2c, int reg, u16 value)
+static void xiic_setreg8(struct xiic_i2c *i2c, int reg, u8 value)
 {
+	if (i2c->force_32bit_access) {
+		xiic_setreg32(i2c, reg, value);
+		return;
+	}
+
 	if (i2c->endianness == LITTLE)
-		iowrite16(value, i2c->base + reg);
+		iowrite8(value, i2c->base + reg);
 	else
-		iowrite16be(value, i2c->base + reg + 2);
+		iowrite8(value, i2c->base + reg + 3);
 }
 
-static inline void xiic_setreg32(struct xiic_i2c *i2c, int reg, int value)
+static u8 xiic_getreg8(struct xiic_i2c *i2c, int reg)
 {
+	u8 ret;
+
+	if (i2c->force_32bit_access)
+		return xiic_getreg32(i2c, reg);
+
 	if (i2c->endianness == LITTLE)
-		iowrite32(value, i2c->base + reg);
+		ret = ioread8(i2c->base + reg);
 	else
-		iowrite32be(value, i2c->base + reg);
+		ret = ioread8(i2c->base + reg + 3);
+	return ret;
 }
 
-static inline int xiic_getreg32(struct xiic_i2c *i2c, int reg)
+static void xiic_setreg16(struct xiic_i2c *i2c, int reg, u16 value)
 {
-	u32 ret;
+	if (i2c->force_32bit_access) {
+		xiic_setreg32(i2c, reg, value);
+		return;
+	}
 
 	if (i2c->endianness == LITTLE)
-		ret = ioread32(i2c->base + reg);
+		iowrite16(value, i2c->base + reg);
 	else
-		ret = ioread32be(i2c->base + reg);
-	return ret;
+		iowrite16be(value, i2c->base + reg + 2);
 }
 
 static inline void xiic_irq_dis(struct xiic_i2c *i2c, u32 mask)
@@ -1480,6 +1498,8 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		return irq;
 
 	pdata = dev_get_platdata(dev);
+	if (pdata)
+		i2c->force_32bit_access = pdata->force_32bit_access;
 
 	/* hook up driver to tree */
 	platform_set_drvdata(pdev, i2c);
diff --git a/include/linux/platform_data/i2c-xiic.h b/include/linux/platform_data/i2c-xiic.h
index 2e3683c23..afad9a49c 100644
--- a/include/linux/platform_data/i2c-xiic.h
+++ b/include/linux/platform_data/i2c-xiic.h
@@ -16,6 +16,8 @@
  * @num_devices:	Number of devices that shall be added when the driver
  *			is probed.
  * @devices:		The actuall devices to add.
+ * @force_32bit_access:	Use aligned 32-bit accesses even for byte and
+ *			halfword payloads on bridges without subword I/O.
  *
  * This purpose of this platform data struct is to be able to provide a number
  * of devices that should be added to the I2C bus. The reason is that sometimes
@@ -26,6 +28,7 @@
 struct xiic_i2c_platform_data {
 	u8				num_devices;
 	struct i2c_board_info const	*devices;
+	bool				force_32bit_access;
 };
 
 #endif /* _LINUX_I2C_XIIC_H */
