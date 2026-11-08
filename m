Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170251;
	b=lKq8xoNxORoHToVD0WnDqHOVOE3e5nzcyw/rm1eBQFLH2TFTMOQG7ap7JpOQaBIAHcP3
	 sDdtNkIQxvUr4Yx8kLB+wd3StNqcA0ZXTAqfDN3Tqhee16MTO3yi+N3oBU4pHJsd8Z58H
	 0tC90T287qydKa+zwJj7HREAtQ+P3nN6+JFohBUC9h60wSy/bHDACxc7SEu4k2ViRiQK6
	 GAaoN34gZ+xuCOVlpbnxHilB7oFee1ulqtpGQy7v6pwGDDwQV2dfnKGwjTw1cM/G+C5rb
	 y8GTsICMEZm6+47mZwxQs+361OOdwc/ok2Vk+X5vp38isjFfU1neEXj+0w1K+OgbKKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PKtqM0lKSDw1R6nZxeofGNfXJYXQE3Or9TXWomGfKyI=;
	b=trDtLEiuLd1Hf/X4sSooOeSyhWDPfXMc/pQVAlRnOeySv1MfOecyKLuccN+rd0pDSsIR
	 Ig1Kb94GC6FGQbjWW9ze8C1X/ecJTKuKL+i8T0x0/sHt6cIocXriFcD0jd5NsWyl2lSLa
	 Vj5aqj9tc8lUNsX9c/zOZ+2q4bJYkbU0vnlV41gE37KwqAUFv7c7eTZDiTyl+ez2PWILC
	 3PlB9f5Q2ZgbasuZfQypd440+rrG/cq2NFaXvcRMaFdzvcCyv4lDEv5DYz3umazGcbTsD
	 XoLpMklXt83fS7adKXqJ4BAG/8fUwPEF5hG6Z/zt8rZIMcCwwWtzhJ7rBWtgHPiT2uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWivARwK;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9F606A9C0
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:37:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA9F606A9C0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MWivARwK
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso109242a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794170250; x=1794775050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PKtqM0lKSDw1R6nZxeofGNfXJYXQE3Or9TXWomGfKyI=;
        b=MWivARwKsNq+6QEsTWJ1HacIfAB9KHWf+dMnYRSHzE/YABHD2UzbcFhNnB1WPJW0sa
         i+FIY7vKbCeBZzfTySGJHHfB0yWEbqpvGpnkGR2vacETy3l0NFlRKl0mhr1GIa/aVaqP
         zt9OUip3pe3KrBNZR5uFkkVqHZnGioszvVgAQrkZVGCasNsgMRFNSoynUq5CgkdAXRVp
         4q615C9b2PYeO+zLh1KWVrAtg+zDtUSHw+r7e4CPa7E+tQBoVdiNO5jzf1f38mpRXBVB
         Va3vrPv6ScYyBPHnpdoE5pn8zsheYHmPghYhkAWwrb4AMDflVaGwmgBiOh1jszIPN816
         tk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794170250; x=1794775050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PKtqM0lKSDw1R6nZxeofGNfXJYXQE3Or9TXWomGfKyI=;
        b=mGCUY3aVfOa8Qj3Vc0E9cc7H5cUBEVm0lzu5QcJNPWPTnXcpfaxhboYMkhj8HAobAP
         vfQqIehGn9YxO0SHb3b8/Fg8XaOO222j1Z+ln97qdDM0eRyPpBEjy4OHFIPQniKnRJY8
         76UnZ0oTmKAFhmGXCHCg2lIVdJujEpPWwqGe7k6uyc4RVfA43+r8x2M1QlwurFySNudo
         /5NIDda4R1S5lsD3JCsc4jwj0pKbmcu38jTlXz/k7EUs+XhV5jEbiORDfw0Zefh4QtkU
         BI+PQmE8bWhODnFxTSs3ZGgE+RIwmaHwi9urxzWV10AbMkYt0oBxILAEx7fiW8USlulW
         sLfw==
X-Forwarded-Encrypted: i=1; AL+hErF4jkiYISlSqxuzkk9qRIV/GE1Qg4jVkSpHsnsWHZmJCnPSgi46iBRRC8jOyoaZRNDuaBlfS8MiSIUjwIc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/V4lCHm8hTNk3l76IEWS8tlAAiEwnjazZLrnoNrHjOYmVJHx4z
	LhZfOcqJ2UxP5sEbwi6g+6H+K218DB8fw73TWHabxOQmyW87avhA0XwUaNe17A==
X-Gm-Gg: AYBFou0XKZzgVhNDvUJ6mvwQODkROtWI1bswaAxnlga8GZvNepWOyMwXe0955uVwO2J
	guR/1pZQvjq8xc22CcJy3v9gv7oNnlFdvFYyP5TA8X7qdyaWyrvc132eiFNkDUAI4tPt9AoDDhx
	Zy+jdAYtRY/rhxSFTbY8tiT2GqZwtArTv3lv7iRE+8SS8C2TIB/89Q5BD+A0XiBM86IAfGGSJcK
	Jxj1F3OJdoutdoyqacr/ATuDRlcuhtNB+b7a7wT1QB32nGtwuXsgduFNuY/76DrQ6BEsXXjJEQV
	2vrx0W3sQXX8Sg+bINUPr9z6kzRgnLXD/V31PdLepnlxuceqIsYjUbgsCRueVY+WHmqZ0fZzSbR
	I3d4opCrkFDpnfPaJW0/lQEoXqkepEZZ/2qkakg3lOqIB+tKrYBMvvBljj8U8a7TWCSduooch0o
	pYnSFTZnsa7NF2QYr8n9TRmL2ZBsoVGxldgMkkxdeXntCvlbSi+Jw5+T8sDqziGfJ7KRXEEPihe
	PQb0asGTlJNm1oSs6jQv9khaZs7SjD8iszTXJ8+wekOmt/jPyma/usg1FL+r9UUD6UuIg/Qu5dv
	Wqrnw6Eg76OZdBYOxzCqpLTyPuId+FPJX1DIZy8Hu4WcLr4yMNNtlL9kpvuFXb3GdMIuV1ltBPM
	y5cMKFeBJwGIdaYrKTYUuLABRrXwBvR162WRqaW4xz5TRijsEBAgLjFAgrjM3Yk2YDM1GFAZyRH
	R6G+fhQkEfYP1pSMYmyEXFo8Y=
X-Received: by 2002:a17:90b:3890:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b12d5b4cbbmr1975130a91.52.1794170250281;
        Sun, 08 Nov 2026 12:37:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278cb8d5sm4762368a91.10.2026.11.08.12.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:37:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Mauro Lima <mauro.lima@eclypsium.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] spi: intel: only check locked opmenu for SW sequencer operations
Date: Sun,  8 Nov 2026 12:37:28 -0800
Message-ID: <20261108203728.25735-1-rosenp@gmail.com>
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

On controllers that use the software sequencer for register access (LPT
and BYT), intel_spi_supports_mem_op() rejects any operation whose opcode
is not in the BIOS-locked OPMENU. However the check is applied to every
operation, including normal data reads and writes which are always
executed by the hardware sequencer and never consult the OPMENU.

On a Dell Precision M4800 (Lynx Point) the BIOS locks OPMENU to
{02, 3b, 20, 05, 9f, 9f, 00, 00}, which lacks both READ (0x03) and
FAST_READ (0x0b). As a result every read op is rejected and spi-nor
fails to probe both flash components:

  intel-spi intel-spi: 0x3 not supported
  intel-spi intel-spi: 0xb not supported
  spi-nor spi0.0: can't select read settings supported by both the SPI controller and memory.
  spi-nor spi0.0: probe with driver spi-nor failed with error -22

Only enforce the OPMENU check for operations that actually go through
the software sequencer: register reads/writes when swseq_reg is set and
erase when swseq_erase is set.

Write Enable (0x06) and Write Disable (0x04) are excluded as well, even
though they are register writes. WREN is never issued from the OPMENU:
intel_spi_write_reg() verifies it is in PREOP_OPTYPE and uses it as the
atomic preopcode of the next cycle. WRDI is not sent to the flash at
all. Rejecting them whenever they are missing from the OPMENU, as on the
M4800 where 0x06 is only in PREOP_OPTYPE, makes every program and erase
fail with -EOPNOTSUPP.

With this both flash chips (W25Q64 and W25Q32) probe and read back
correctly.

Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: exclude SPINOR_OP_WREN and SPINOR_OP_WRDI
 drivers/spi/spi-intel.c | 28 ++++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-intel.c b/drivers/spi/spi-intel.c
index 7494b921a743..391e79fa4678 100644
--- a/drivers/spi/spi-intel.c
+++ b/drivers/spi/spi-intel.c
@@ -754,6 +754,28 @@ intel_spi_match_mem_op(struct intel_spi *ispi, const struct spi_mem_op *op)
 	return NULL;
 }
 
+static bool intel_spi_op_uses_opmenu(const struct intel_spi *ispi,
+				     const struct intel_spi_mem_op *iop,
+				     const struct spi_mem_op *op)
+{
+	if (iop->exec_op == intel_spi_read_reg)
+		return ispi->swseq_reg;
+	if (iop->exec_op == intel_spi_write_reg) {
+		/*
+		 * WREN is issued through PREOP_OPTYPE as an atomic
+		 * preopcode and WRDI is a no-op, so neither uses the opmenu.
+		 */
+		if (op->cmd.opcode == SPINOR_OP_WREN ||
+		    op->cmd.opcode == SPINOR_OP_WRDI)
+			return false;
+		return ispi->swseq_reg;
+	}
+	if (iop->exec_op == intel_spi_erase)
+		return ispi->swseq_erase;
+	/* Data reads and writes always use the HW sequencer */
+	return false;
+}
+
 static bool intel_spi_supports_mem_op(struct spi_mem *mem,
 				      const struct spi_mem_op *op)
 {
@@ -768,9 +790,11 @@ static bool intel_spi_supports_mem_op(struct spi_mem *mem,
 
 	/*
 	 * For software sequencer check that the opcode is actually
-	 * present in the opmenu if it is locked.
+	 * present in the opmenu if it is locked. Operations executed by
+	 * the hardware sequencer, as well as WREN and WRDI, do not use the
+	 * opmenu so skip the check for them.
 	 */
-	if (ispi->swseq_reg && ispi->locked) {
+	if (ispi->locked && intel_spi_op_uses_opmenu(ispi, iop, op)) {
 		int i;
 
 		/* Check if it is in the locked opcodes list */
-- 
2.56.0

