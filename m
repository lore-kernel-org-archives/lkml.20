Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793563397;
	b=Q0v8PVQjDk/24Dz/umq/FRkfEkhc9E1pinfwOwTSDBd7M24L5Zx0XU6eoyWI4T5nntcR
	 0iIEtsHCXP6PUrBUtMicKjicvmFHSK0LYR5grNG8cma7vcsfdHlG04TXtNnPlKxa7A/1T
	 eCoMYHRnHLoXYcqXNUex/XBxgYvRT/7LwQYKg82rVXtW0xOZ7LLCgEsCOd6TPL20RsgLg
	 YZETXiXMP0GNBC7nULBcZaKvbIhMrpiUssbqqTbo/OU4+KCVXAmXv1HXCv5v/oPL7Jrzx
	 hoxYYDCjjF3TOJ0JnpixiWh0G9U4DAz//Qk7IQ2+R5cv52rZTL988v/KLvRyzWj4ZNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ACe0xGAoqmUry5IzCbHuAC/BxWutmA5j1wpS/cDhhFQ=;
	b=V/N7bU8FChGSL1JDM87sB2QSKTgAn3Eq2Kq4nJe69MAcSIODkzSG9yT7kvC6Bp2ADT1p
	 TW/FTD9KJm7T3v09ukwsZ5dCjhzPYhCGGXrwNTy+HICbzmS0tQX/PEYR4edf6VYu35w7t
	 S1BEzFNgG9RAKzIHS8gHzOs1iZroEG2bR1og7lhpSIgq8SPw1HxNzX20NaidcEjVvjbA3
	 eNuS9+Qv8Ts+RRKcWLQZt1KrDqoU4pF/5BpXvIlmQVBgNhSydXYBimZPFXQMJ1JK32nnv
	 OSKotHvaUFOZCpEczOi1vau8N2CSmUH7cs9McRKkU/GXXLN+h7bp3fa184xkwvFQO1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wNHQlq2B;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6515E606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 20:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6515E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wNHQlq2B
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a18fc7a38so3608420eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 12:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563396; x=1794168196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ACe0xGAoqmUry5IzCbHuAC/BxWutmA5j1wpS/cDhhFQ=;
        b=wNHQlq2BYYC5qwhf1AQwGywFzLEAyyFQx/xW7ITVUaDfdpYpxwuY8CI5vHxwvRSI4T
         PpFBWUDnlXIR56YCLQcGDaqUYROxPlxm4VKlFD1QD457HbEuuyc4GS3/uqGpPLZYspb0
         R/+qO+jZhQaSRHsGeMUwvt5N9S1TMVEoflfzTudgmlmyAl5cCREtKxM5+ODvJIOluEpH
         sej2O9Ws4GiwSB+mlcYicY7UKw0Yo0FLsJbteMPLN/sOsOOl1yPDnyX3VVhflf0lTPjz
         vsJ/ZRALr9t3zKFVxBwWGL7EHZw8erTt2mvLLfnw25+iUldSh8u92aDt4Yn6LZkEZwhe
         po6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563396; x=1794168196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACe0xGAoqmUry5IzCbHuAC/BxWutmA5j1wpS/cDhhFQ=;
        b=SAo/lI0oTEew/a5FfoZZDySVDXXtI0myCSsJGlSRs4hGP4JMU7xuZ5fNRP7haUT1+v
         U2gZUT5AswVnuFhH49VyNOtAzk9rJrXUINPQHn9rarTgKvcyn6q9E4cNquURxJtJpYdc
         H7XrC0IceptEFjruvX18woLBVLRwC6mEQ8bfm8YE/SRusQPa/Hz2cK6kzQ6HdHed7uPC
         5MgFHOqWUTwDiLjS0L00liIpzVNJHUZU94DGIgkh34UARbnpetcZgfhnJ1XRBoag88+S
         eWkWV8cWdqhoEHUFAtAyMTpTtFzAVt/JluZ6EIQAUv2wkRB898mjtdngyJZGLEKQikFe
         Yi6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzv7wRY91Iz6tXxomUvXWxWRhzuCLqvggy4i5S102w6XsoPdbKdcTerT/dtQsaOlfC3VRjyh4ZzU9M6QTI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9z6AXUNeMWBMKesbjurVW9ThlcCbrinpjDFeCUd4TyMuW/cWRk
	r3KnHv8bYT0AKgisNquU1jVNrUiRB8CUa642Hh1Af4sSf184jfnPdgMNx9A32w==
X-Gm-Gg: AYBFou0CGSc8QFXoePqFImfBiHuKtu9abFcqFI77aGqon/tMknw1d/rE6wZ0LnS56SS
	5zdNh3rI3VHE8pxqBHhq1IZ7B4N1oFSTPAYbnuR3Vj8pXwZHAdaIia5hGKEIfxx0pkvAPDjzZo7
	GIMIiuurDRXq5PN07qyfO+cmxUpVgcHZ9KHcckj0nQq7mTMfVwgweSVqK7Fg4NKBDZ0dGFQw/jr
	lVigYGb/lEVkfJc5ntvwqszr4ztjvWGgC7rpj3M1oEORMqACpe5vJo2hpXdzqJpApHVJS9MnOLR
	6ws7gOQGihpRW9Qo1PvOJg8xL7J57fIbHJT7lYj42eiYOhBgf1YAdIVUgnUIXPepscMWfh9Av1i
	ixV2IXB8Yf4rrTFsN6z28vQFm1GhiKbb4I9o50ExOsaAJsxrTwh5X1V6892Aqi4x8Y9SXb+88Dc
	SATkeXLjIBT+Go5Y9ME678WZEb1lZFmZqo9C240TXGh4C5oxqscm0vWxy8hkmp8c7FppDqH4e91
	/z2MluWAoKuQm8Xl3S3q5Of2LB1bOkpm7oPE8ruCE3fhokGo2nV17Akn/hy6bfew57Rw1ipnyza
	4VD5MY+VL9HdRHhMWXqeUt3Y+19C1EeW/H0aKwtYH6yYc0aF7MnRRpj6aDxh5wnza3dkRWTJg0n
	MJVl6sdd0iNP9pHy+3QSyM+pPff0aUN4dy9FZJpNEq83CKemD9dPCIngyoelEN8NtLbEbQrFdSU
	8inA==
X-Received: by 2002:a05:693c:409c:b0:36a:30b:5dce with SMTP id 5a478bee46e88-36a423a3232mr14502972eec.19.1793563396376;
        Sun, 01 Nov 2026 12:03:16 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm10561680eec.17.2026.11.01.12.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:03:15 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Mauro Lima <mauro.lima@eclypsium.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] spi: intel: only check locked opmenu for SW sequencer operations
Date: Sun,  1 Nov 2026 12:03:13 -0800
Message-ID: <20261101200313.16411-1-rosenp@gmail.com>
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
erase when swseq_erase is set. With this both flash chips (W25Q64 and
W25Q32) probe and read back correctly.

Fixes: e23e5a05d1fd ("mtd: spi-nor: intel-spi: Convert to SPI MEM")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/spi/spi-intel.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-intel.c b/drivers/spi/spi-intel.c
index 7494b921a743..6f1414b199e6 100644
--- a/drivers/spi/spi-intel.c
+++ b/drivers/spi/spi-intel.c
@@ -754,6 +754,18 @@ intel_spi_match_mem_op(struct intel_spi *ispi, const struct spi_mem_op *op)
 	return NULL;
 }
 
+static bool intel_spi_op_uses_swseq(const struct intel_spi *ispi,
+				    const struct intel_spi_mem_op *iop)
+{
+	if (iop->exec_op == intel_spi_read_reg ||
+	    iop->exec_op == intel_spi_write_reg)
+		return ispi->swseq_reg;
+	if (iop->exec_op == intel_spi_erase)
+		return ispi->swseq_erase;
+	/* Data reads and writes always use the HW sequencer */
+	return false;
+}
+
 static bool intel_spi_supports_mem_op(struct spi_mem *mem,
 				      const struct spi_mem_op *op)
 {
@@ -768,9 +780,11 @@ static bool intel_spi_supports_mem_op(struct spi_mem *mem,
 
 	/*
 	 * For software sequencer check that the opcode is actually
-	 * present in the opmenu if it is locked.
+	 * present in the opmenu if it is locked. Operations executed by
+	 * the hardware sequencer do not use the opmenu so skip the check
+	 * for them.
 	 */
-	if (ispi->swseq_reg && ispi->locked) {
+	if (ispi->locked && intel_spi_op_uses_swseq(ispi, iop)) {
 		int i;
 
 		/* Check if it is in the locked opcodes list */
-- 
2.56.0

