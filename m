Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370756;
	b=qL+lpsiPGVc6zKmjBRE1/DAyFpeACGRjV6+ZQfJvErf3OtgM8gvniVDRM/rXkiHDChSG
	 FekZUf4IDk3OZXQlCZc/se2+QDFHo0A1IoGJ5FThffhaqGegU6OqutDdjqNHIGC1p3U+1
	 hm/oVKpHCXawGu9kOTQOYugLPBxG1oZxv6jMh04a+NFaCzskZRBZMwcmlV8xqIbGhdpyx
	 kjuv9XOwu9jxbQltkRARiLuNo1I+YW1EdZ/MHUa+UXptpfoStI1/AuWkH0whcBt7vs2X7
	 Vzt+i+/5PvR6Hqxn+tERyQSr/W+57hsJE+jX3iZnjxeHs/24sTuIJT+9b3u470NP6OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tioxKfo0r6ymDmT2sdreesWQ9Kk6NZ3UAliEfKE+GeE=;
	b=N1VXOqKiS5Mzbw6PyG55TTgIeQk9YfU04UvLDsiEUHniErcKyxkkhrU1iBQAxLiiq3dS
	 q6CAF/mw9gFvmVWao6lMRtVWQTYmidoslP/he1QhVj95SR4I/3bojCTocIbLeZ9Fajmpx
	 h0sPs5NO0lsJB/cE6osVXAFbUz57ylyMji7J7sdHZdIuvnXLoW8gNv7XtGXWahZky8NYI
	 SnCOc9XT91BZymla4RJrI9XcFXYtxu6Cz6ty96qrJ4hdMRTT/kBAL5/EpBCcxDS1k+fBz
	 p8cKJ2BICM6Ac+qKI7hsBJbxFlaem/T4KAXYPv/cxJTtEp5+40JY2pAb4ewZd2M/jRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxdSpsSH;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7102B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7102B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mxdSpsSH
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a315ed211so3095018eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794370755; x=1794975555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tioxKfo0r6ymDmT2sdreesWQ9Kk6NZ3UAliEfKE+GeE=;
        b=mxdSpsSH6+mr7crxIK8lbMW88P9Aekvjbv2subpODZ62WB5uVpeytOGowg6t5QATYR
         M24Mdfg3i8/ukpLW/FuLj3DaVfbtV7PbkDrOQppUMi3xxOmqRSDTKBYvaSGLBh7gAphS
         lJGwuOBLRhutjzOsq2KMfk3tBFn4pf+k2Bz+FjxqrECQ8j39QULw8qduwL6lofdLjxxd
         IfhIMSrkYPFZPOXqx0fudF8/PuVZzIW6SCjroA1mXtUz/pUZMDukHwgQtBoHJ3dUeukW
         ATrk5LPOtw7f0P535hNwihOg3WYw4AWabKjwElzpBB6n/QRUbS0hTT5v/rzKm4tlsyOw
         4mSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370755; x=1794975555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tioxKfo0r6ymDmT2sdreesWQ9Kk6NZ3UAliEfKE+GeE=;
        b=lsakoZVRG1cwlDOb8g6XVZrzDZlMv8hA7AbbM7Ql+jszlPx/EFYn4gEDenJ4sb+hK2
         4STdl3GmGKNkXkUmpVdFFUbdk7flCEZ4ZCeJDtJOMg38YYar45tOmLU78k7f+9yh5MUP
         /aI3XE8HY+e0g2/bXtbd1Se3PfDxLme1WfRakcWtUYZ//RmXSD1i3U/IGy6w6HB9svvW
         Cmb/d5cxLyx0ztYImabgMJ+rKroLxJWpmgsW1q4L1D9iDVKMoS/dzZpdJ1syWx3GT3aZ
         u1RnPEgWO1tDbnnxazJjBb3Hzd2fiPCylDC9bOlA3mjuFvrNt9zHOUdhuTws2xqm5qJp
         JFgQ==
X-Forwarded-Encrypted: i=1; AL+hErE3byHDnHQVDagdRB8JahL+VRtl3JbntZoQUKKvd+XRq0S411677FLfCyepTZX1ACx2H3et2QswCafc0ms=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PCe3fDA5MFSl59+08wV1dWWXulcBx3dApNWzyF7wMFONKigRF
	NHgpANqZwKpL25BfDOTSIgD7uoAfQmTiwi0R6BwOD/Cm29h3EOL6bOHy
X-Gm-Gg: AYBFou1T9zNgHYHcpni9gza4LhHGuGwxdw9QAcFu6q9pfhwtKT2Qh6nJgyRN2us0xdR
	GntCO16lXmr9mynYSBoCmaSJYEZo1n5NCHlelsDN+HuTFeHEqB8WpxcMtI6x5IMfDXrMIsJKNhX
	lO8HCO/9Yu1PSF7GLtHeJRvxVjyHTapOMqIsTPiX+sTnvrlKw8hhYO3GELelon4fahHR0qQZ8Vu
	YVqFxrCQMgdieuJEuTfyxCJbIyV3azNt4xIDBR8fO0QVhB+MuT4lDKWr8pv2f0/IF1qlPITyzFq
	jAUmKznk0e2e9cjh5J2rSWRH2sYdS//EuHHux5/PSgiJhIcPapPiCmpKHV0Hq6N3tSW6sUUQWR4
	0UIn7gaBx1W9A2wU/Te0jiE5Vt+/RyrdDIAz9cMDikngUpdAo8EMXKTBN88RF0OSttLS4Hi/bjM
	u1ZLZXHnARDBhu3TamexLRqQnC7aOBxSEogNfE8jyA9lWUifx3QMv10iJcibcD8b7FqpfKBIh6r
	R4nJUvyc9lZEtp5JWneM6PE1SZ9dfNzpkit6UNY7tw0WntM9UrAAuIeZNwtuA0ihk/9vmWmP74s
	FPyhT7tfR5DzD4rozr2fhMDlXuYoF1qG8wYU3ShKo+fXsgnNkqpCsaVwAMhPTUmE4YgO2T6hy/q
	hupHQumcVAOMGqqwShtBNOeeNV5u3sPWe4yuVbt0SSjJYfLFTp95M5ZdT+TfdpUBs7JJBAwGa
X-Received: by 2002:a05:7301:488a:b0:36d:be15:2dd6 with SMTP id 5a478bee46e88-37686b42aabmr1877422eec.11.1794370754436;
        Tue, 10 Nov 2026 20:19:14 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3752060c4b6sm11820704eec.15.2026.11.10.20.19.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 20:19:13 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Tue, 10 Nov 2026 20:19:01 -0800
Message-ID: <20261111041904.48916-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111041904.48916-1-ahmadexp@gmail.com>
References: <20261111041904.48916-1-ahmadexp@gmail.com>
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
index ba560462d..d13cfb012 100644
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
+static inline void xiic_setreg32(struct xiic_i2c *i2c, int reg, int value)
 {
 	if (i2c->endianness == LITTLE)
-		iowrite8(value, i2c->base + reg);
+		iowrite32(value, i2c->base + reg);
 	else
-		iowrite8(value, i2c->base + reg + 3);
+		iowrite32be(value, i2c->base + reg);
 }
 
-static inline u8 xiic_getreg8(struct xiic_i2c *i2c, int reg)
+static inline int xiic_getreg32(struct xiic_i2c *i2c, int reg)
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
+static inline void xiic_setreg8(struct xiic_i2c *i2c, int reg, u8 value)
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
+static inline u8 xiic_getreg8(struct xiic_i2c *i2c, int reg)
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
+static inline void xiic_setreg16(struct xiic_i2c *i2c, int reg, u16 value)
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
index 2e3683c23..df1aeb42c 100644
--- a/include/linux/platform_data/i2c-xiic.h
+++ b/include/linux/platform_data/i2c-xiic.h
@@ -16,6 +16,8 @@
  * @num_devices:	Number of devices that shall be added when the driver
  *			is probed.
  * @devices:		The actuall devices to add.
+ * @force_32bit_access:	Use aligned 32-bit accesses for all registers, including
+ *			byte and halfword payloads, on bridges without subword I/O.
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
