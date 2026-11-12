Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501226;
	b=sgOabEEjHjfvkydGlIuP+LktVrPB5s9w12BSg8ESBlxcBjy4KYOJV0bCPGrESWlPer5b
	 m6v+aCaJV4PxXhHGGFoYoFx3nBVXDWNPkqaBTCgBw9mZqSjcB1aSMEiy15GN7KcUaotxZ
	 7DUPN86utoOPIzLa0l+OhbP+2n/H2wg7l8xZMw5ig4fEJEAxbQsfEKxnmJdmefOBfSbgN
	 s56WPnv69Geg1xxjwjbj8eM1VQ0am3oKT4PD9nyXphX8QO333zKbehAub24i9oWUNDsCx
	 /dCXR0u/myluUfduol9RLRQlxVGSzldHWxhawkmBGAMXvZseYiVfzgYfk89Bp20fB8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501226;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tbdfNX28L/i/5oHG446ychVES0ZdkWJVAEz8POMkBqY=;
	b=p1pzB7FPReiJ13Uv4RUD7VtHeqNRDjAf+f1Yhb2c00GrU8qWFTposp2pdGoOMHrI8fir
	 1zTBY9YpLfPSkpLBTXEJx1/l2ttAYQYfzmTSqT8TLB2Zwx7UjpjyRMnSM3tiYuqk8mAnx
	 CEIo6K7gDL6PAe8h/AxVQptkYCQ5XBJPVFYfTC4U8urkniuJCCQQ2XhvhJoxOWslsJyzQ
	 TrRiCc+eG4l1/Iv2XW3SflqdBG+DdIEdkVtF+A0R2ofsvBwp8R2yIetotlv4DOhcCy+mo
	 D/7I44syvuWGVSzbauJYOms2L2+AMCXr7LZ16tCLm6V+A6mGRt8klZ85/NcuwvhodUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2AaKfmQ;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A5660A3831
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A5660A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2AaKfmQ
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b244fb7fffso5611520c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794501224; x=1795106024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tbdfNX28L/i/5oHG446ychVES0ZdkWJVAEz8POMkBqY=;
        b=u2AaKfmQMcjkan1aCxxE9geaP+hEcpgc6e6VbKe6MHvKKvLl5OiquJ8t3OiCA8tFUH
         71+y/xp39lOCobqJzEV5TxPX+NqchZESmE3yrZxyDc523SbckeZIJVHZETvwg5rZxsyX
         Ieb2wrQzIQzHz5CXixJaeE1f8rCKTSGh0MqmL3z1tjwgA0FDBi8t1qjtT0+ekiZv99B2
         3P/zd+UE1ekNbsRYKBOo0gCY1CnxCgDdhopwG5uFfVqmkX4IaZD7ErEvvbiZSvxuYheU
         Jx1CA49JBenGJ7OH/cI1fyhrbxITDhiNtIcoXXi4bKeMAYCJGHtUGb2qTHAkSztKEj5h
         XULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501224; x=1795106024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tbdfNX28L/i/5oHG446ychVES0ZdkWJVAEz8POMkBqY=;
        b=duxFUa++Bf7vcAWECKjFgWTaIV3BcPiZKENr8gN5j29MhKZ9dE43zJbkvdpRpcYQ/y
         sPTq206Zw7sBdm745kfxI6K6xEvCTL/NkvXNA71/qahr9v1ZlkQJMv8N5F69AommADlQ
         POsjEs3gn/nnNh9icHMNfSTK4TuW/TdWVcfo3wGynV4XIDs4H/zEyGeDqqoIcYTfaiU8
         0KAH+TS8YgCl6LZ6NI8Q84eont8CoPK7yS5eZJlXkyn+b2k7twG8U4huTm2QqIDE/AMb
         8JF4hI2l8hK7z0kUL9tpAsUqzSAgOPLf7YgSTnIbi8YC//aRYjyRMByoquwBL3/0rPvA
         9scg==
X-Forwarded-Encrypted: i=1; AL+hErFFyabnV8zP9VeTXhcTOuEMKIRcuUfoD9Rp3mTdwjIK8jcekPnAr44v8bTnQhlqLMJkmCIg4eEeSqK5tJ8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pAkJSYJJTF36g1wEdfUMcU6OS21weYpOei8mv6zY4Kb/pZtIg
	3vkiT+kg4QWFWPc58qNAHZhnvZIeF8np3M/MSEAzrhhgFDgf4ayQJmuw
X-Gm-Gg: AYBFou04kwkUhT6++N++dAULh0ds+t4W15w/TqyrGnYo0sOOZ4MwiXLpiAUg+8gCdhI
	/qnHa0cE97SEyQncCEt6gehJEMce9JJ/pHkT1mm/DNiYLZL5jM/+6hcgOQ5iSQsVNcdNNOPqPU5
	oGinr9UMJ1pPBli5DDUvV8N2weqoEt4zpyEKC7ujE1KN2MDBuvsnNnURypaD/qt5ekkuCGL2EOB
	ro61YHxXOHEXCm7og7o591tOyM+/oBmtoJKOKaBw8j0VwnmOJZWubHF4fKP5EqBKwKQ/xNFbZr2
	1hkaZSED1RuzgalkP+NVYacdhMIuxjL3c710r/UWD2n0aPME0ralOEEalL3HLrP6t/E6YmfwdSq
	kQVwmcIPK2uWx64UnUOOf9ILgaQXutt6ScTtsWbd+vfH841E70YGORUP1dI73+fwkKBBKXmONBk
	CIG5PD8D5fwQfFB75+2HBI8gPIVZUjWcgLGTyxtzvZx2CZEPza7M4ikGpBXtbaleEM/ZfXpfPlH
	YsTOFdkWd3RsklC69fZt1gNf7x5MK4yDmAUSzpUuvnHf+GvJt8LHe7/31vKuQfRHnpGj/ILK3hn
	WAWYKrpdxHzHvQRy+5LJe9QGtVuN6i1jBFi9co3R/C4XZjh9h9SqOSaQmcaBsWkth8kMFxAx5dU
	nnqEec60qQMrUKJZgJFyI4vnPDe1IqmCqfe8qCwEcUhbew+jXo1fENxuL2+sAx6xSBc4On0/K
X-Received: by 2002:a05:7022:f20f:b0:1b3:b53e:b4cd with SMTP id a92af1059eb24-1b5031003e7mr96230c88.21.1794501224164;
        Thu, 12 Nov 2026 08:33:44 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm230248c88.0.2026.11.12.08.33.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 08:33:43 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	Michal Simek <michal.simek@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 1/3] i2c: xiic: allow platforms to require 32-bit register accesses
Date: Thu, 12 Nov 2026 08:33:30 -0800
Message-ID: <20261112163333.12523-2-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112163333.12523-1-ahmadexp@gmail.com>
References: <20261112163333.12523-1-ahmadexp@gmail.com>
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
index ba560462d..8425a540f 100644
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
