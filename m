Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E8051CF54
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909287; cv=none; b=o2kRIYMge7mMdjq3QbZBEbNR84uIC6PEYb8OiTss7FG9OYKJKCgRECAZP4Z8YkuXIHgjWcDuj3rDJePZD1U2kyRCq0BEYKLvtUVojFTFrxyUtARIngotCH59v2uQn10cqei5QZrskZvHETs1wBoIkvO7I9fdkBQYIH32o/bRXa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909287; c=relaxed/simple;
	bh=Tpv6NiR8EjbK7Lgz6VBBQZAoGS1OqILUdrcTlWdYjd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IzAroFYn6VU2E2PjTFdEfKQj1H3Lw381Nki+3KqkyBZF0OxqAiTDGSa6JF+kr+G3MC1wBK1Yri60UhmIS8GyC1P5U4htRpLeiz4eLx3o9ITOn8+gSZsYXD8ChgZeHio+kkWJpIYQhMOIppwkEtWgLWdSqTJxotlMtk6AWlT5yZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=pP4fxmJk; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="pP4fxmJk"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF8C5C653F7;
	Tue, 13 Oct 2026 16:35:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FC8C60362;
	Tue, 13 Oct 2026 16:34:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9DEB411D7180F;
	Tue, 13 Oct 2026 18:34:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909282; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vOHz17WNePLEEE9OMB3edY/QK4xTISPUZ92W5KwmCK0=;
	b=pP4fxmJkjpoJRHJYc8F/oh3a2ZOORwxZEM5LjuQH7fpLyD5VvmWrwKB5cUaeImwoIlRzpA
	QpIloeZ+/wawspmPL8NiX44QXSYqaPsWxmo3my8cfuzNYwzcs/OeAm2Xq0pybObjhvVPog
	uLj6avMxMJptQsSJrnKv7M5Ln3EQpzBywITZ5utsNy7L47n+mu54lmjKXjBLUMUSdAzRoz
	9BHdGvxbO3pp1utze0uV5Z1o3YhtxblK/U7V3D8Pio2PfAhryIc0vZZd4lyo+Ik4kCqqFK
	0QxPuwurk/pra4UFfYkJdynoH2VhauLE6Oyntp17KwFvFY89qp6fBPYSndV+jw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:57 +0200
Subject: [PATCH v3 07/17] mtd: spi-nor: Drop stale values
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-7-6dde1d513df8@bootlin.com>
References: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
In-Reply-To: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

These apparently Micron-specific flash opcodes are used nowhere. They
are not exposed by a UAPI header either, so just drop them, they are
stale definitions.

I discovered them while working on Winbond VCR registers. For a
moment I thought VCR registers were wide spread (but, no).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/mtd/spi-nor.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index b3e3c6b10186..1a2f15d8426a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -89,10 +89,6 @@
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 
-/* Used for Micron flashes only. */
-#define SPINOR_OP_RD_EVCR      0x65    /* Read EVCR register */
-#define SPINOR_OP_WD_EVCR      0x61    /* Write EVCR register */
-
 /* Used for GigaDevices and Winbond flashes. */
 #define SPINOR_OP_ESECR		0x44	/* Erase Security registers */
 #define SPINOR_OP_PSECR		0x42	/* Program Security registers */

-- 
2.55.0

