Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9933F7872
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787746445; cv=none; b=K3kfQxcF2d9tWgzoJeHZHoQ4ywRROyrOEaODWm945OBcBR2OtIVsHk607ZVMLW5TDWO14jA8PnwpmSZD7BXGOgPuDKnPXIlsN753p3mm4vQnB3E59TL26e1wbvj1wMrs4b7ww5mzcRR+6ecfZPE3C3zBCtj+c5Sl4hqJvsReGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787746445; c=relaxed/simple;
	bh=Ij08AF/uUNQD0SjuYvWUHV6gWDNDc1VQNaoScfXxwmk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SJh6rbxgAqjUtkmMtaK8EvssFDIhfV38kE5uGWIqrppt763H43nZ/hEefEA1gZ4Ej0vM6dktlubjdt8xgubVDkdX024DFYTRfiesSpfhqRXFjAqdafCj+ZF80HjHubg2Iii8cB30vb0Z4ssm0ssBVAG3PZwWkeaVOwugNyo3qAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=breiti.cc; spf=pass smtp.mailfrom=breiti.cc; dkim=temperror (0-bit key) header.d=breiti.cc header.i=@breiti.cc header.b=CTUAWBSY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=breiti.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=breiti.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=breiti.cc header.i=@breiti.cc header.b="CTUAWBSY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c252c7270faso58832066b.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=breiti.cc; s=google; t=1787746442; x=1788351242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e31qJYeAbxR584eu4jjxUYEy/aZxuhgj5H27N/W3IXI=;
        b=CTUAWBSYUO7GJavjId7HEQ/H9lLHfGbqS20HOFNSmHpmHNT4jQtOl0rEzE9yqHpqPF
         ikejV/8B/n2dC/ZD0+6re9c3/8LiTCOZAzaWYahMylIoxRnOvNPIB3nWEFklLC4pE15/
         Qck542K0HmNAnG52SeThuvWr2BHedyQBVct58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787746442; x=1788351242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e31qJYeAbxR584eu4jjxUYEy/aZxuhgj5H27N/W3IXI=;
        b=dYY3+8M/jqEMluUi6iqliaXnImL19SJxiXim4UgsoSVL0IF7RoaJUE7wnXdaW1+xMc
         4GWAjMaOuJWjkZgczef+LWnK1grfShymVu+ywMuPA3MDg/xq8Tm/w9WalTUdBu7AVZhX
         fQQaHTkQUSELlgExy0wyOguyCbeU84BeU49+/2oh6JJmboGcHBmT//gnC63dq9GcAiUK
         STeewyNYHfAckz5vqpRHATrcoVPyKd5810EHo7M1ql3aXX4RKgv3FdgVxEVJ3/Joqd3h
         Bwi+gxCzTmol4o+OiWloCjOVQCDQVQV8tS3phbbZPK3uv93i9NzXpjf06I/oPef84ZcO
         h3Hw==
X-Forwarded-Encrypted: i=1; AHgh+RpE+W4nvcakQE8axjk/L/ugkryS67h37gfpPZOblO6goAjrKSPv43KD6g7m2e2oBFadBQ6/TOgeW6qm/ww=@vger.kernel.org
X-Gm-Message-State: AFuF++kbYBxYVIktclUwjNUj6bZJlXT3+xuitKRnk9nuy8N/HV0jUlMC
	SJZ0zEVwuYduzY6/ZUL+Ucmz1dzvDPzpVZvkkPO/OFthHQC8U6hYhnM1kLhiz3HixATMIeBC3nr
	DyniM7xVvDac=
X-Gm-Gg: AR+sD11ExdrE006OkN2PLELC4hlVdhg+01dpFQ67tdsyoC9J+lDtoYUv82s7RVVjWQJ
	J3k4eM2jEfRpg+2UgYGRcGEFQ/xAOhu7ttVzLPrWD9nzHEs1kSns0Lq5vYCbi/6bCAYh+7b6tPl
	sK9PnPGz2wwJsg2no7aZitC4EMN3m0JeftvruyDyPLKG7qNCC2mfec2YF6Jh1r9iMxzYmuaSp2t
	jX3+Dxzc1iloxuSLqdo/FLhL9oachE7XaVg/isTs9CwvPJjhe3j4UX19f0XGLLRmzt20JyzaV9D
	qjf6orP8Ci/eteau6QEJT/3hAM6UljQpzRckRjcHn1bVA1UsP28AXYuwqMa0HX5Jaki+DDnkGRl
	3ZvzhcnrS9HjJqWsQeV8lrPG0OCpaU7K1Ixue+p+LA/9pndVpOiUbCXRv1O5SVkvoNWjoecG4ez
	H7itVZ+PGRCc5V2XGsaHermTQSP8i2MoVxGu+eFr4yMVl5FZHVH746apxcD95vuSUeJqBSXntKz
	/sH
X-Received: by 2002:a17:907:998d:b0:c1a:5d49:f99d with SMTP id a640c23a62f3a-c250baffb5bmr889064566b.7.1787746441892;
        Wed, 26 Aug 2026 05:14:01 -0700 (PDT)
Received: from framework ([2.57.48.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25185b4d97sm319801666b.34.2026.08.26.05.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:14:00 -0700 (PDT)
From: Markus Breitenberger <bre@breiti.cc>
To: srini@kernel.org
Cc: alexander.sverdlin@siemens.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Markus Breitenberger <bre@keba.com>,
	stable@vger.kernel.org
Subject: [PATCH] eeprom: at25: fix read_poll_timeout argument order
Date: Wed, 26 Aug 2026 14:13:34 +0200
Message-ID: <20260826121334.122881-1-bre@breiti.cc>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Markus Breitenberger <bre@keba.com>

Commit 8ad6249c51d0 ("eeprom: at25: convert to spi-mem API") passes
the arguments to read_poll_timeout() in the wrong order. It supplies false
as sleep_us, USEC_PER_MSEC as timeout_us, and USEC_PER_MSEC * EE_TIMEOUT
as sleep_before_read.

Consequently, at25_wait_ready() busy-polls with a timeout of only 1 ms
instead of sleeping between polls and timing out after 25 ms. EEPROMs which
keep the write-in-progress bit set for longer than 1 ms are reported as
timed out, although the page may still be programmed after the driver
returns. A multi-page write is then aborted after the first page, leaving a
partial write.

This was reproduced with a 25LC080: a 32-byte write spanning two 16-byte
pages returned -ETIMEDOUT after programming only the first page.

Pass the polling interval, timeout, and sleep_before_read argument in their
proper positions.

Fixes: 8ad6249c51d0 ("eeprom: at25: convert to spi-mem API")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Breitenberger <bre@keba.com>
---
 drivers/nvmem/at25.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/at25.c b/drivers/nvmem/at25.c
index bc2cfb75d9bb4..9e71c6a859471 100644
--- a/drivers/nvmem/at25.c
+++ b/drivers/nvmem/at25.c
@@ -224,8 +224,8 @@ static int at25_wait_ready(struct at25_data *at25)
 					   SPI_MEM_OP_DATA_IN(1, bounce, 1));
 
 	read_poll_timeout(spi_mem_exec_op, status,
-			  status || !(bounce[0] & AT25_SR_nRDY), false,
-			  USEC_PER_MSEC, USEC_PER_MSEC * EE_TIMEOUT,
+			  status || !(bounce[0] & AT25_SR_nRDY),
+			  USEC_PER_MSEC, USEC_PER_MSEC * EE_TIMEOUT, false,
 			  at25->spimem, &op);
 	if (status < 0)
 		return status;
-- 
2.47.3

