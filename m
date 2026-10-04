Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9A43F1066
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 21:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791149491; cv=none; b=I1x9UDvKe/pMgcvS8tWnjGC9rtfJHycboq2RSXKGunfM3gEGuPlmIcXTax6xTDl8ORLFBpCL67I5zIWmGMgzarcFSx4LbXqs0BOP2BvYq8uVESboNZTposkWr3DixV8a/iKBaVlS/iG8VdajthK+nnZkFSVQIZ9mYPLYO18+7dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791149491; c=relaxed/simple;
	bh=cM3mpgDjy2TbhuZWFF755YBjGqNcUfbCnQLW6nLC71s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=It+MNOEdMDGLIEMEGUoi1TT19QqWaKCfsyOQiFSDroOYW9tK0egBh2zKTyXTi5L+wJtZ/J49QC7gyB3ezNd/JQ0bwjyIDGrlizcJkR9sZaS4BxPj+FhmrBQPzCInf0SurvcwiHZ0GcLUySHqVw2VU+bg4RKts5Ikw/VI9rzJU8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dvoQ4dS/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dvoQ4dS/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E53314E41169;
	Sun,  4 Oct 2026 21:31:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B66B2604FE;
	Sun,  4 Oct 2026 21:31:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 52842103283EB;
	Sun,  4 Oct 2026 23:31:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791149485; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=/K1byAs4VG3cDSQTISVjiCosUfEDZD4lfEHkeBgebIk=;
	b=dvoQ4dS/o1hPIG8Lp+Hr5v71GdHnlzhLeGeLEV9dFHYRD4R+Ourh3FCe7hIjD4QC2ZZHoH
	Nf2j/0BrbMkE+QZJYI2uHS6gV1tIeSnZrnSW73P84lfBeDBfjPDrDR6a6mv/17DOOYUiTI
	thaHI/6TkqCrjtxVMGWkHeykXs6UCuj4NZgCdtLde3reUU82IJLL+ohwUMJBjEMJMswcL4
	MOdiWyLD3Xl1WQtfiMoK3w0kILjWmntTBSqyQ4lKbG8u7tbXS+wMR4GQDpEDtC0nr/tuqQ
	sGJMY6aC/nI7su4wkVeguDh+Pvrfhz/mEVSnk0/0wQAyG0C6eC7cwS8kYFVgoQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/17] mtd: spi-nor: winbond: Add support for the
 W35TxxNW family
Date: Sun, 04 Oct 2026 23:31:14 +0200
Message-Id: <20261004-winbond-master-spi-nor-w35t-v2-0-592f3300a70f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBCF4auQrh3TDgFTV97DsCgwyCTSIW0DG
 sLdrSRuXf5v8b1NRQpMUV2LTQVaOLL4HHgqVDc6/yDgPrdCjbXR2sDKvhXfw+RiogBxZvASYC2
 rBGgu1pbaIvVGZWEONPDr0O9N7pFjkvA+zhbzXX8u/nUXAxocosPBVh3WdGtF0pP9uZNJNfu+f
 wAICk+ayAAAAA==
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
      mtd: spi-nor: Fix the meaning of a comment

 drivers/mtd/spi-nor/core.c    |  58 +++++++++++++++++---
 drivers/mtd/spi-nor/core.h    |   3 +
 drivers/mtd/spi-nor/sfdp.c    |   4 +-
 drivers/mtd/spi-nor/swp.c     |  25 ++++++++-
 drivers/mtd/spi-nor/winbond.c | 124 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |   4 --
 6 files changed, 200 insertions(+), 18 deletions(-)
---
base-commit: c1775ba88cd08853e3f401d725b2ad94e783c5ec
change-id: 20261001-winbond-master-spi-nor-w35t-217993092ed1

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

