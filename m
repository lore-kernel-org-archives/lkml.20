Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5354A4839
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156102; cv=none; b=UI3sf5db+LmeuLb6/sehoCNwW8HnTm9x2k5teK8UyU9qxhRohc8YLkVqr1piWdqN1uAL2C7taohCFIoS0z4DDE+fiHoSJOQND292G26NimYRJg/as4sZE6k3rOS9YZ6GxeL0F6ihvWj7vOLRdeTF7j1zoSlWrrSnQ+ErpWG1cwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156102; c=relaxed/simple;
	bh=Z9vuHvIs5djMkOSj7qyB+HFnspgEuOMY5kkZwLyT16k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/HDjkuWFbiOC5SdKnUteMFHMtI2x+sm1fEVlfoyd+MYgSVrgdKT3ayUStMm8wQy0ITZGfcE3It4J2Ajgr3rUoxvTHbVvuSxoCim/+4asKltAq7SYJImmlvqeiWnsOlj8Ut08nmqIdp3Fh9mb4Vd/txOic+hxh0VdPmxQqcgvew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSgi7qmO; arc=none smtp.client-ip=74.125.227.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSgi7qmO"
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3ac144119e4so2327904a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792156099; x=1792760899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8EDc8rZac4RsFY8nAVqxYalOxuPA5SriPQpdHsNWSs=;
        b=eSgi7qmOKPkfXZpFupCKl7bwQdQtDIMJQ+wzNSDn8iPUSpbNo6TXLum2nG1CgZYp0w
         WkCOKZFTpIvi93/mp+AjQsl3PPviap2pGDWpZIMkqs5Jxsw4ub1UliIHTfoVMJfWHTyq
         eFfH0iZMdWU9uKDuqrMSJtaQZUDZZpr4ORZES1qjgcktsekBsq21v1tG7KRXvTi1oBEW
         xACJm8LEMZQlfTlAM/UmDJHRJFM48o0hb1kjtc/hJKc21+qTNmbdjtYKkIES6Tvvo50C
         LOh2CokvxZD3S8bl6LHnjZKt1N7O17JJWTjHVH+B16yjBOtzIx0xeb2jILgri0y94Sqb
         9vMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792156100; x=1792760900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8EDc8rZac4RsFY8nAVqxYalOxuPA5SriPQpdHsNWSs=;
        b=J+S6ZDVrLlomrI8vKzGyKphnm0zqE83Q8E2ZdnN0RRB3ijYQ0esbTcuPnZjeTqcFuO
         C/gk1zJtbKngNSa4QIEOJjnJNlQMvHUchwwp6iJI/R0tc4Pnk7//td3FrDAyICfn5DeN
         Wguvg/4HW8Pyf9pMyHhlfLNs9dTs96WQGzhWm879TNsKxyeqiFo8IJZ20WpDIRTcsUdx
         OyamJf4t5o6yUT/34H3FOqlBpMr3gnbBzq+jBDz5X1Y3DU0yUq898nbl3wxAY9ttLjvB
         mZaVp36tHpTAHK5liZ+c6RNcCU0TlurWn/RU70TNCRWjz3ag+TzEQilKAdw6xaGD4Z/o
         7vmg==
X-Forwarded-Encrypted: i=1; AKwUvByoRn4l3II38e29T7YkNgdWYMa03m97iQDowECg8JasIDnHthLP78bKxZ0RqmJG49Hkd95qeNDAZo6ok1s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWAK80nhZ2nUqzyqqZXSVleU5opCC7Tnp2DNMWi676TN5CPRiz
	BeKpqE+mPt3J/uBn7+wEcR4nN73aM9LubNpCpz4/6B2PT9svpIntni1N
X-Gm-Gg: AYBFou35d1iFs//3njhZxaym6t+h6EVRblnS12quRyKut5YeNZpgrlLy2jGUlNSBeEQ
	XvSgeDGHX7jClHnYKc9csX+SlP/sx5pZO7ooYUI0eA++wEDD7gwrKgxX3WmbWH6g2jrKLfg5vlb
	c1qewi9TOr7k6TLfhM5XRruhqhpMqBtRvBy2b0aN3bvC309QE5e+OEmIvAZeT/P2w6dUF7GIZMh
	2t5naTo57lFTgxJIn3utpNC3DnaHO5i+tk3ZRTKRncxPVSrcs2M2My8qmOGh5xMRKaMernlFbbh
	IySNt+3IFpsOfNkbfXkZ/Blc0LpGSKKw4YXly9hGyhhJ2h1atyqCwU3tmnnR0Y93nf+lzN5KHQD
	XFXmirMg83WpWpIz6mvlAYts9VlLdmUvse3sEjEqy6Jye0crFg4uUCa9lNUGlFDB5HadIsa8QUG
	2YWrRcMMygaqmnm6JFSHEk7tkq/N5tUc5UGAaMjeLnOJpv/W7Ly+iABrt28bbo34aq7CDXno/fK
	5ljFReu2cw90OLy61kT
X-Received: by 2002:a17:90b:258f:b0:3a6:dc51:cce9 with SMTP id 98e67ed59e1d1-3ab3a96634dmr18516390a91.57.1792156099489;
        Fri, 16 Oct 2026 06:08:19 -0700 (PDT)
Received: from AERO17.taila7786d.ts.net ([156.231.115.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc46ee274sm4190467a91.4.2026.10.16.06.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 06:08:18 -0700 (PDT)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] spi: zynq-qspi: fix address buffer corruption and support 4-byte address
Date: Fri, 16 Oct 2026 21:08:12 +0800
Message-ID: <20261016130812.282624-1-cyan2254650260@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In zynq_qspi_exec_mem_op(), when transmitting address bytes, the driver
iterates over op->addr.nbytes and populates xqspi->txbuf[i]. However,
xqspi->txbuf is never re-assigned before populating the address, meaning
it still points to (u8 *)&op->cmd.opcode from the command phase.

This causes two severe issues:
1. Memory corruption: Writing into xqspi->txbuf writes past the opcode
   buffer on the stack (which was passed as const struct spi_mem_op *).
   If opcode is zero, xqspi->txbuf is uninitialized.
2. In zynq_qspi_supports_op(), operations with op->addr.nbytes > 3 are
   rejected. When paired with SPI NOR flashes larger than 16MB (such as
   Winbond W25Q256), spi_nor_spimem_check_read_pp_op() tests 4-byte address
   support, which fails and causes spi_nor_select_read() to drop all read
   capabilities, failing probe with -EINVAL (-22).

The Zynq-7000 QSPI controller hardware in manual I/O mode natively supports
transmitting 1 to 4 address bytes via its TXD FIFO registers
(ZYNQ_QSPI_TXD_00_00_OFFSET).

Fix this by introducing a local opaddr[4] buffer in zynq_qspi_exec_mem_op()
and explicitly setting xqspi->txbuf = opaddr before populating address
bytes. Also allow up to 4 address bytes in zynq_qspi_supports_op().

Fixes: 67dca5e580f1 ("spi: spi-mem: Add support for Zynq QSPI controller")
Cc: stable@vger.kernel.org
Signed-off-by: Pufan Jin <cyan2254650260@gmail.com>
---
 drivers/spi/spi-zynq-qspi.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-zynq-qspi.c b/drivers/spi/spi-zynq-qspi.c
index d762aaf45..bfcbcfe85 100644
--- a/drivers/spi/spi-zynq-qspi.c
+++ b/drivers/spi/spi-zynq-qspi.c
@@ -229,11 +229,10 @@ static bool zynq_qspi_supports_op(struct spi_mem *mem,
 		return false;
 
 	/*
-	 * The number of address bytes should be equal to or less than 3 bytes.
+	 * The number of address bytes should be equal to or less than 4 bytes.
 	 */
-	if (op->addr.nbytes > 3)
+	if (op->addr.nbytes > 4)
 		return false;
-
 	return true;
 }
 
@@ -526,6 +525,7 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 				 const struct spi_mem_op *op)
 {
 	struct zynq_qspi *xqspi = spi_controller_get_devdata(mem->spi->controller);
+	u8 opaddr[4] __aligned(4);
 	int err = 0, i;
 	u8 *tmpbuf;
 
@@ -547,12 +547,13 @@ static int zynq_qspi_exec_mem_op(struct spi_mem *mem,
 	}
 
 	if (op->addr.nbytes) {
-		for (i = 0; i < op->addr.nbytes; i++) {
-			xqspi->txbuf[i] = op->addr.val >>
+		for (i = 0; i < op->addr.nbytes; i++)
+			opaddr[i] = op->addr.val >>
 					(8 * (op->addr.nbytes - i - 1));
-		}
 
 		reinit_completion(&xqspi->data_completion);
+		xqspi->txbuf = opaddr;
+
 		xqspi->rxbuf = NULL;
 		xqspi->tx_bytes = op->addr.nbytes;
 		xqspi->rx_bytes = op->addr.nbytes;
-- 
2.56.0

