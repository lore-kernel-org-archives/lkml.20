Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812603E49DD
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909274; cv=none; b=Y1LFkqOrTearD0CliCFLdXdbi+XtJmQaxilTfLp2q3ZjxcY4TDV5mDc1tkdc/rjGCsjZvuejfPbeQj47XAl4jkMrBzPimxVTqWLhkq7+EdEuHNVe9WsBRR3uX6Jyadox1EyQnvsxFVOdkGx3rm7chtvHjY9K5LG4DJ+JGfJe3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909274; c=relaxed/simple;
	bh=mOR/8vq5PanhOMFHiF8f797bNn0Parfd7mTvVZfAB5E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HK/9gk3dRDZ4GP7RpxaeweCGjE/kl3O/jh0v7LnKyhD+ZjxuvcsX1hGIYfMFrybvg4Yqxdv/0YSSdaQ2pbxwc0lnftyFzTgQD1yCIFBaFeNZRe8cbqKSF7aOLWuZvY8oHUvlTPDyjlaqBjj7URKeIKlNE602Artb3JYuihqvABE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fdj06cGT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fdj06cGT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E67D04E411FB;
	Tue, 13 Oct 2026 16:34:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B24FB60362;
	Tue, 13 Oct 2026 16:34:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 760BC11D7180D;
	Tue, 13 Oct 2026 18:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909265; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=X1mfwLlo25XYbvE4wLEXA72Z7W9FUyzbZTg3CqofoW4=;
	b=Fdj06cGT/kH00yLrzofFuv2FOS4Ot0dOXs8ZAlDydb2hySTyEKRB7GGg267kbmS6CD5px1
	DivsrYYLjJOieARh2SuZHwSU2GL142McxWv5hPP+llOUCqQINn0eDWTrQcvgC2qUU2ZUH4
	/fXLPEdvX8/FyDz4ewYvbGX+p8cJOAge69n40Rc4dGWa3lAKiKftOVkxDiHEhXsrXR+Wmu
	/p/q6xpb6NQq98e7JKItYRB8yfjpygwQeKo8hr9zpg3DY9lSwv9ifZL7zmvlIxGYT/Xje0
	2jR4AZsBuSqe7FC0LKHvz1kBI0KetXSAznnBtvcKArYls0gRhYD9ADeSECoQYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 00/17] mtd: spi-nor: winbond: Add support for the
 W35TxxNW family
Date: Tue, 13 Oct 2026 18:33:50 +0200
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-0-6dde1d513df8@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auYrh3TTgVSV97DuChQZBJpSdsUD
 eHuFhIT3bD83+J7MwvGkwnscpiZN4kCOZtDHg+s6bV9GKA2N0OOpeBcwES2draFQYdoPISRwDo
 PkywioKiUklyhaQXLwuhNR69Nv91z9xSi8+/tLIl1/bq46yYBHDSixk4VDZbmWjsXn2RPjRvYK
 if81c77GmatUNhJybmuePevLcvyAf2QY7YWAQAA
X-Change-ID: 20261001-winbond-master-spi-nor-w35t-217993092ed1
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

First patches are misc fixes.

Then there are core enhancements to support ODTR chips.

Last set of patches is Winbond specific, where I add the bulk of the
changes for supporting the new Winbond Octal-DTR SPI NOR chips in the
winbond manufacturer driver, and then sparkle the ID table with the new
IDs and their respective testing logs.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v3:
- Drop all Flag Register mentions, which are unused (I added them for
  debugging purposes, but then removed the associated helpers).
- Bail early in the sr1_and_sr2 write_sr_ll case with ODTR chips: we
  should never face this issue at all. Add a comment to explain why.
- Move a comment fix earlier in the series.
- Link to v2: https://lore.kernel.org/r/20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com

Changes in v2:
- Fix the _careful() read helper in swp.c to make sure the buffer is
  initialized (zeroed).
- Fix the location of spi_nor_set_dummy() in order to be called at
  resume. This solves numerous problems reported by Sashiko.
- I am on purpose ignoring two comments from Sashiko, for which I have
  answered over the mailing list. Let me know if someone disagrees.
- Link to v1: https://lore.kernel.org/r/20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com

---
Miquel Raynal (17):
      mtd: spi-nor: Only switch to ODTR if the chip has a callback for it
      mtd: spi-nor: swp: Fix SR2 initialization
      mtd: spi-nor: Fix spacing between arguments
      mtd: spi-nor: Fix comment indentation to clarify the intent
      mtd: spi-nor: sfdp: Enhance a comment
      mtd: spi-nor: Fix the meaning of a comment
      mtd: spi-nor: Drop stale values
      mtd: spi-nor: Fix WRSR with ODTR chips
      mtd: spi-nor: Allow configuring the actual number of dummy cycles
      mtd: spi-nor: Fix SWP for octal DTR chips
      mtd: spi-nor: winbond: Prepare the introduction of W35TxxNW parts
      mtd: spi-nor: winbond: Add support for W35T64NW-C
      mtd: spi-nor: winbond: Add support for W35T12NW-C
      mtd: spi-nor: winbond: Add support for W35T25NW-C/E
      mtd: spi-nor: winbond: Add support for W35T51NW-C/E
      mtd: spi-nor: winbond: Add support for W35T01NW-C/E
      mtd: spi-nor: winbond: Add support for W35T02NW-C/E

 drivers/mtd/spi-nor/core.c    |  58 ++++++++++++++++----
 drivers/mtd/spi-nor/core.h    |   3 ++
 drivers/mtd/spi-nor/sfdp.c    |   4 +-
 drivers/mtd/spi-nor/swp.c     |  25 +++++++--
 drivers/mtd/spi-nor/winbond.c | 122 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |   4 --
 6 files changed, 197 insertions(+), 19 deletions(-)
---
base-commit: c1775ba88cd08853e3f401d725b2ad94e783c5ec
change-id: 20261001-winbond-master-spi-nor-w35t-217993092ed1

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

