Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911102;
	b=naxXZJ53EF639TuNxokApaGeeBi+xLgF0zaXrlIMf/f+QkrTrpvS3XpA4C+P33AZJYqu
	 hj77bauPlnuHPrz+NobW8iTCF5hB9ktDF3eS0K4V0gAxH5xzX+qJq8h0yRtOIcrOrMrTh
	 EWmjGIRTw9cWjjfc/2LoRIRXq6aLCRw+rkMLjVmwJRM1EIvcpZzgp4GatJYV8Oq0rmdIT
	 ykibtexCARwgE5TDPel5+z0nWElS9RULFvEUnUQMYwL9S8ssQIJ9UHKCjmZLcY7MVmgA9
	 YtNejiGxi7L3BHpYRtGuHvSm25BsBueIkDXqVQsvpz2BG/EfcW92148SkcnqUDn0aIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EBvELyKu2dMwI8vyGLt+92VXSFlR51MbGColCfpUNIs=;
	b=47kGiXFx22hLLzfpk+c8212rTKGgRSQoyrGW5bjxEfvfrV0HkjOCn7XBn3Lh5lFhxmXs
	 9PBvdHNsuk6W73xeXJU2RYJwSYxpGy1kPVc76lbAQkY/LpGUZUE3zQmQS05SGboVU7hYz
	 uWhIoT/SbSgy7/DzkzyMNlr6Ujmxe5vw9vCkBa+QExxLammCsE8D6LIdrZwwCgq3pqhKE
	 8O19DNtprPPg1w7CO/bBnCOgq30ljIOKJcR9h5VE35s1Q9Z8JqAV2ofEMqsR9RVmdEQNn
	 2oVBqsL+a/BpKLzifFdjc3IWczqSQo1SFdJl3/PNMrckuhm9dPTActfcseSKBm07JBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGz7yOXY;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBA9606EE8A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BBA9606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wGz7yOXY
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1288380a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911100; x=1794515900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBvELyKu2dMwI8vyGLt+92VXSFlR51MbGColCfpUNIs=;
        b=wGz7yOXYTbTPQTGuouS5JXBEKQqR4OvR4Qa36lMmmpw11gaXXKrVrVGX7BuX0tq8LR
         c0hTSIdQNe/4pgvwd5H0yzZ7QPUKQnltABUbI+BrSoltMYzRm1vpO3lcQ+Hd3stwPykV
         JE27qqJk8pOI3nD0s53Jnyh5Ga0/PIptzEJinAbOThcRAMWJP+pkxrdlgSbK9x0lT/L7
         ikTXEXqAw+H8Mm0GkljIZPpBHP8Pg2w8dlIF6YwHG1Yyc5LHorfz7deyK4paGmlZjr49
         8Gf12yD4UQ9kSXYJuXZVMXCYC7h6bc9JlMLNmW8HVLtCLgToHyMBBAuuVV5uRas/Hnrw
         jFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911100; x=1794515900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBvELyKu2dMwI8vyGLt+92VXSFlR51MbGColCfpUNIs=;
        b=Nc+RyNKbvwWFFRBGXxk33vPu7sQtXz16Hs2NKREzsKMwcAXuLRsUTDongptUDNHQ2F
         Hk25RdRJZeU99xMGMuPpyr4kPKGhXnr1fg3q6QLeuA+PgwsBoBjQ0HfXb9/lWB+pGUiN
         zRlagAfYOvScQ/JJuWZ/JU7hfUbiCBaSXIZZ5HQyld96y2CHJVmvhwSuzZ1PnfDNuPYb
         iLRr+vEsUtuoXUY1slEDPSWiwrlI/J6YcJ2RRf2mQRydzZEXV4xhqiZaRPBP+e83jA7K
         5xx4UxcqT75hf6VQYAdiSG0KvFoXsyk+t9y5c/7IFhr+VA8hgohRsE+zEUl0FAwHbRil
         CALw==
X-Forwarded-Encrypted: i=1; AKwUvBx0NcTpU4sJvCMRSW3pIRFLu9ir0hbuMfpP5qchhd5Gqz7MTDHgaGAT1dCtGYBHpceM7HJW+oVZKN8kdhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tzm8RS+n/uYqC3vpeXfCtr5C9/CkObqXfPdITrV5cM2MobAS2
	4/8PVw/Ok9HKRh6xAIEsYvxiB5EfJAU2SusosZ15r5E8TthwyecNXQllYAXY4P8iVtE=
X-Gm-Gg: AYBFou3lGPH53/67xeczik1bGo177LtcirqntXP3ksUD8Hbbr8HMeCrYkUNEKp4hc1y
	JXIuZjRkrSFaUNCRzfEzyaQFvI4+yWZTAN3VojihatZ2zxfdEmDa1ptwufEqqgTE9iwbxnx88cV
	ZZBeVt5yqSNsANXo+RjePXeVFrEbGud6kTSCAYVX0LI7DsI4KyOZyy7cUVTo0ZquKVa4qvP2Xz6
	AcfSeBBbXmUGosPhpfUwRDI3hvGWDbF9eNW1h2HgGJDtoSSDdSWb/bbQLgKJjW9cEYsZlnqrMKb
	0ZbCjAquvvH4iRctpRTfnp19opGqrJpNZ8nqsvFqITU8EHD4W7hUIgXY01PsD48aPYCFVLdXt8H
	3Qz0vscrpFsyMzyZl89yFDsqtdplT9LSys+DLHCE5QZrCBGbl/ZUNkZP3TTwRGaHBzYqSEHsNjA
	xNQaYfQyz1sweS7JMe8bGvZOwn9JNxYdPLKqQs2ebuDiRR7ws1BlGwr64xD/YBxjyOT3Y7WI90f
	tlyFEn4F42yfofVV/je2a30mJ/4nHZBxycwRndYazB0qzhwPNKf/ITdNNhS7sxgEmlRmEewxQ/N
	DOQyL3ZeF0FKruWmRualN1l2AZO5SdeAHZjK/AdH+2hyK96Lv6uG5QbZdLSGU799MEf2Pqjl28f
	K8H3yNw6fHBeALhN9Aq839EmcErsF6RGhfobL0Dunt1O0KD1fL353AzgYoLYzh0wlz8sAg2vIMf
	sZyi96op/fPKNW9Ke6/AC4IXYQeD6VNFlj1kkva9VpwwDPO91iQbAI5oZXwez5ikFB1wry
X-Received: by 2002:a05:6402:2111:b0:6b4:95cf:24f with SMTP id 4fb4d7f45d1cf-6b5977ed8f8mr277799a12.19.1793911099648;
        Thu, 05 Nov 2026 12:38:19 -0800 (PST)
Received: from mb-HP-ZBook-Power-16-inch-G11-Mobile-Workstation-PC.dynamic.ziggo.nl (2001-1c00-1106-0900-938c-4ed8-a3bb-093f.cable.dynamic.v6.ziggo.nl. [2001:1c00:1106:900:938c:4ed8:a3bb:93f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b57feb668bsm886834a12.13.2026.11.05.12.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:38:19 -0800 (PST)
From: Mario Behn <mario.behn@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mario Behn <mario.behn@gmail.com>
Subject: [PATCH v1 1/2] spi: zynq-qspi: read flash above 16 MiB via the extended address register
Date: Thu,  5 Nov 2026 21:37:33 +0100
Message-ID: <20261105203734.979168-2-mario.behn@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105203734.979168-1-mario.behn@gmail.com>
References: <20261105203734.979168-1-mario.behn@gmail.com>
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


The Zynq QSPI controller sends at most 3 address bytes, and spi-nor needs
4-byte addresses for a flash larger than 16 MiB (W25Q256 on the Pluto+), so
the probe failed with -22 and no /dev/mtd* appeared.

Keep the flash in 3-byte mode and handle a 4-byte-address operation
inside the controller driver: write enable, Write Extended Address
Register with addr >> 24, the operation with the 3-byte opcode and the
low 24 address bits, then the register back to 0, so that U-Boot and the
BootROM find bank 0 after a reset. adjust_op_size keeps one read inside
a 16 MiB bank. EN4B and EX4B are swallowed so that the flash never
leaves 3-byte mode.

Also stop writing the address bytes through xqspi->txbuf into the
spi_mem_op structure; use a local buffer.

This stage is READ ONLY: every operation that does not read data (write
enable, program, erase, status register write) is refused with -EROFS.
Verified on the Pluto+ (W25Q256, ef4019): the md5 of all four partitions
equals the one read on 6.12, including the 30 MiB partition that crosses
the bank boundary.

Signed-off-by: Mario Behn <mario.behn@gmail.com>
---
 drivers/spi/spi-zynq-qspi.c | 152 +++++++++++++++++++++++++++++++++---
 1 file changed, 142 insertions(+), 10 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index d762aaf452af..e20019a03964 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -16,6 +16,7 @@
 #include <linux/spi/spi.h>
 #include <linux/workqueue.h>
 #include <linux/spi/spi-mem.h>
+#include <linux/mtd/spi-nor.h>
 
 /* Register offset definitions */
 #define ZYNQ_QSPI_CONFIG_OFFSET		0x00 /* Configuration  Register, RW */
@@ -222,21 +223,69 @@ static void zynq_qspi_init_hw(struct zynq_qspi *xqspi, unsigned int num_cs)
 			ZYNQ_QSPI_ENABLE_ENABLE_MASK);
 }
 
+/*
+ * The controller sends at most 3 address bytes. A flash larger than 16 MiB
+ * is therefore kept in 3-byte mode and reached through the Extended Address
+ * Register (EAR): an operation with a 4-byte address is turned into
+ * WREN + WREAR(addr >> 24) + the 3-byte form of the operation, and the EAR is
+ * set back to 0 afterwards, so that U-Boot and the BootROM find the flash in
+ * bank 0 after a reset (the same scheme as the ADI 6.12 spi-nor code, but in
+ * the controller driver instead of the spi-nor core).
+ */
+#define ZYNQ_QSPI_BANK_SIZE		0x1000000U
+#define ZYNQ_QSPI_OP_WREAR		0xc5	/* Write Extended Address Register */
+
 static bool zynq_qspi_supports_op(struct spi_mem *mem,
 				  const struct spi_mem_op *op)
 {
-	if (!spi_mem_default_supports_op(mem, op))
+	struct spi_mem_op nop = *op;
+
+	/* check the shape of the operation as if the address had 3 bytes */
+	if (nop.addr.nbytes == 4)
+		nop.addr.nbytes = 3;
+	if (!spi_mem_default_supports_op(mem, &nop))
 		return false;
 
-	/*
-	 * The number of address bytes should be equal to or less than 3 bytes.
-	 */
-	if (op->addr.nbytes > 3)
+	if (op->addr.nbytes > 4)
 		return false;
 
 	return true;
 }
 
+static int zynq_qspi_adjust_op_size(struct spi_mem *mem,
+				    struct spi_mem_op *op)
+{
+	if (op->addr.nbytes == 4 && op->data.nbytes) {
+		u32 room = ZYNQ_QSPI_BANK_SIZE - (op->addr.val & (ZYNQ_QSPI_BANK_SIZE - 1));
+
+		/* one operation must not cross a 16 MiB bank */
+		if (op->data.nbytes > room)
+			op->data.nbytes = room;
+	}
+
+	return 0;
+}
+
+/* opcode with a 4-byte address -> the same opcode with a 3-byte address */
+static u8 zynq_qspi_opcode_3b(u8 opcode)
+{
+	switch (opcode) {
+	case SPINOR_OP_READ_4B:		return SPINOR_OP_READ;
+	case SPINOR_OP_READ_FAST_4B:	return SPINOR_OP_READ_FAST;
+	case SPINOR_OP_READ_1_1_2_4B:	return SPINOR_OP_READ_1_1_2;
+	case SPINOR_OP_READ_1_2_2_4B:	return SPINOR_OP_READ_1_2_2;
+	case SPINOR_OP_READ_1_1_4_4B:	return SPINOR_OP_READ_1_1_4;
+	case SPINOR_OP_READ_1_4_4_4B:	return SPINOR_OP_READ_1_4_4;
+	case SPINOR_OP_PP_4B:		return SPINOR_OP_PP;
+	case SPINOR_OP_PP_1_1_4_4B:	return SPINOR_OP_PP_1_1_4;
+	case SPINOR_OP_PP_1_4_4_4B:	return SPINOR_OP_PP_1_4_4;
+	case SPINOR_OP_BE_4K_4B:	return SPINOR_OP_BE_4K;
+	case SPINOR_OP_BE_32K_4B:	return SPINOR_OP_BE_32K;
+	case SPINOR_OP_SE_4B:		return SPINOR_OP_SE;
+	default:			return opcode;	/* already a 3-byte opcode */
+	}
+}
+
 /**
  * zynq_qspi_rxfifo_op - Read 1..4 bytes from RxFIFO to RX buffer
  * @xqspi:	Pointer to the zynq_qspi structure
@@ -522,12 +571,13 @@ static irqreturn_t zynq_qspi_irq(int irq, void *dev_id)
  *
  * Return: 0 in case of success, a negative error code otherwise.
  */
-static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
-				 const struct spi_mem_op *op)
+static int zynq_qspi_exec_plain_op(struct spi_mem *mem,
+				   const struct spi_mem_op *op)
 {
 	struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->controller);
 	int err = 0, i;
 	u8 *tmpbuf;
+	u8 addrbuf[3];
 
 	zynq_qspi_chipselect(mem->spi, true);
 	zynq_qspi_config_op(xqspi, mem->spi, op);
@@ -547,10 +597,10 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 	}
 
 	if (op->addr.nbytes) {
-		for (i = 0; i < op->addr.nbytes; i++) {
-			xqspi->txbuf[i] = op->addr.val >>
+		for (i = 0; i < op->addr.nbytes; i++)
+			addrbuf[i] = op->addr.val >>
 					(8 * (op->addr.nbytes - i - 1));
-		}
+		xqspi->txbuf = addrbuf;
 
 		reinit_completion(&xqspi->data_completion);
 		xqspi->rxbuf = NULL;
@@ -611,9 +661,91 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 	return err;
 }
 
+/* Stage 2: the flash is read-only through this driver. */
+static bool zynq_qspi_op_is_read(const struct spi_mem_op *op)
+{
+	if (op->data.nbytes && op->data.dir == SPI_MEM_DATA_IN)
+		return true;
+	return false;
+}
+
+static int zynq_qspi_ear_cmds(struct spi_mem *mem, const struct spi_mem_op *like,
+			      u8 ear, bool wren_after)
+{
+	struct spi_mem_op wren = SPI_MEM_OP(SPI_MEM_OP_CMD(SPINOR_OP_WREN, 1),
+					    SPI_MEM_OP_NO_ADDR,
+					    SPI_MEM_OP_NO_DUMMY,
+					    SPI_MEM_OP_NO_DATA);
+	u8 *buf = kmalloc(1, GFP_KERNEL);
+	struct spi_mem_op wrear = SPI_MEM_OP(SPI_MEM_OP_CMD(ZYNQ_QSPI_OP_WREAR, 1),
+					     SPI_MEM_OP_NO_ADDR,
+					     SPI_MEM_OP_NO_DUMMY,
+					     SPI_MEM_OP_DATA_OUT(1, buf, 1));
+	int ret;
+
+	if (!buf)
+		return -ENOMEM;
+	*buf = ear;
+	wren.max_freq = like->max_freq;
+	wrear.max_freq = like->max_freq;
+
+	ret = zynq_qspi_exec_plain_op(mem, &wren);
+	if (!ret)
+		ret = zynq_qspi_exec_plain_op(mem, &wrear);
+	if (!ret && wren_after)
+		ret = zynq_qspi_exec_plain_op(mem, &wren);
+	kfree(buf);
+	return ret;
+}
+
+static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
+				 const struct spi_mem_op *op)
+{
+	struct spi_mem_op nop = *op;
+	u8 ear;
+	int ret, ret2;
+
+	/* Leaving 4-byte mode is not needed: the flash is never put in it. */
+	if (!op->addr.nbytes && !op->data.nbytes && !op->dummy.nbytes &&
+	    (op->cmd.opcode == SPINOR_OP_EN4B || op->cmd.opcode == SPINOR_OP_EX4B))
+		return 0;
+
+	/* read-only guard: only operations that read data from the flash */
+	if (!zynq_qspi_op_is_read(op)) {
+		dev_warn_ratelimited(&mem->spi->dev,
+				     "read-only: op %#x refused\n", op->cmd.opcode);
+		return -EROFS;
+	}
+
+	if (op->addr.nbytes != 4)
+		return zynq_qspi_exec_plain_op(mem, op);
+
+	ear = (op->addr.val >> 24) & 0xff;
+	nop.cmd.opcode = zynq_qspi_opcode_3b(op->cmd.opcode);
+	nop.addr.nbytes = 3;
+	nop.addr.val = op->addr.val & (ZYNQ_QSPI_BANK_SIZE - 1);
+
+	if (ear) {
+		ret = zynq_qspi_ear_cmds(mem, op, ear, false);
+		if (ret)
+			return ret;
+	}
+
+	ret = zynq_qspi_exec_plain_op(mem, &nop);
+
+	if (ear) {
+		ret2 = zynq_qspi_ear_cmds(mem, op, 0, false);
+		if (!ret)
+			ret = ret2;
+	}
+
+	return ret;
+}
+
 static const struct spi_controller_mem_ops zynq_qspi_mem_ops = {
 	.supports_op = zynq_qspi_supports_op,
 	.exec_op = zynq_qspi_exec_mem_op,
+	.adjust_op_size = zynq_qspi_adjust_op_size,
 };
 
 static const struct spi_controller_mem_caps zynq_qspi_mem_caps = {
-- 
2.53.0

