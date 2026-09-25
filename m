Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0518425B0A5
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790300735; cv=none; b=EwYMu/reXBvFmg9r77SzWGFrlATx+m7QbFc29x1PsYt1/d559RISmr+epJ598H/Y+Xu4yYx2/FPUgLAbhNvhzfLPHv3Q8O+bYlgvvhcW5G2fJxumQFM4QicNT/A/oeGHIYwNXz/qhDKX6BYB2sNc8CkLCqVHRfBLlif8BpOQ/IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790300735; c=relaxed/simple;
	bh=NoXIhd8j0XWnFfFP/6Ye/3DE0ZNhV0fYynZfIU9Vel4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T13X4nKY/G05pxmX8TeFsia86oXGN6EX+UmSrpTNL6CHgC5h0OmoMkm6FqPfcw9PEr/Si+NKQshR+LnQ2rxll7LazNQ4uPneiF31KSG0X8kREz/1hYsn0O8t+IRU5YInn1x6/Czs4/ke/h59tIwD5bJi3jeXkt2rCvDq6saQXB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=EvbmGIWP; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="EvbmGIWP"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAEE610495D;
	Fri, 25 Sep 2026 03:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790300725; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=BD/AF9Sm+bwlBW9JU/mCnYE3T0vi2WViCuvybTGiHTY=;
	b=EvbmGIWPnJ/g0bWpdBsb2eubwJm5wckNIUXSuvSA2efM8C4Q33xLIQ4QCpJd4BjdeZ+43B
	PHUPEP7ydvZnVRUzRgl50JYvmBiSbZjKX43k7FdpNJB8Wl0feXj7AU/i1a7bjXfleoIdeH
	21J+TVYJ1FUZrQbKpasjfvhBEDbCfCbHMqmmQo3IKHl2CrMgqJ/UUh6x1PAeE1ulMeiPJn
	A4mMgCYBiT9f7kd2oZZN43I5Q//qYlTbL9KDkH8I1e5CYB4401o+fBogG9Sr+M01ydxLJq
	xTL9CN3S+IBrF/WJAsqyx3ergdyNczqOnxBDZTwVvx8wiSsFIAA0FCxpa3kR8g==
From: Marek Vasut <marex@nabladev.com>
To: linux-mtd@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Cheng Ming Lin <chengminglin@mxic.com.tw>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: spi-nor: Describe locking support for MX25L51245G
Date: Fri, 25 Sep 2026 03:44:44 +0200
Message-ID: <20260925014517.174496-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The MX25L51245G part has the same 4-BP locking mechanism as MX25L12805D.
Describe the locking support.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Cheng Ming Lin <chengminglin@mxic.com.tw>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>
Cc: Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/spi-nor/macronix.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index b3fdb4b2fa1ca..4de1b490b16b6 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -165,6 +165,7 @@ static const struct flash_info macronix_nor_parts[] = {
 	}, {
 		/* MX25L51245G, MX25L51273G, MX66L51235F */
 		.id = SNOR_ID(0xc2, 0x20, 0x1a),
+		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP,
 	}, {
 		/* MX66L1G45G */
 		.id = SNOR_ID(0xc2, 0x20, 0x1b),
-- 
2.53.0

