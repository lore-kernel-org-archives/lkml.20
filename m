Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C166C25F981
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943693; cv=none; b=fRQMQCfBffQndnquNqH7efr3CKH5IvYmKtk3C3JotMGUxxGjIs0Na/QI4CjPDIwYpQBMSGTyvVgY0UYe42ONn5ben70Vd2ICA1pq+exX2RED2B6TBLCzytz7Y2926LUIqQ7Zy00/0tSKDs3v1lJf72bP5Pb8w7Il+56u6ZLhgoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943693; c=relaxed/simple;
	bh=4vKYtsfmcbZylc2kSDjU7NrwUDTfd80+dVweQknK3gM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gElof0Dvy67L0jtqNuSJ5wztZQiazycjYeVDb+Dvh+Mzz0e9/9dFo20iQnoo9WgdkkbnqwmneOcISQZur6/Zb+Un5Mg6Kayqyye9JKurkpkJ+ryJ1xOY7T63Hph76ALBzIK00RSRBLiUvFRgSxpujLETLd9+zGn1/X/gYW44OJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=w4q/oLe6; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="w4q/oLe6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 040F91A10DF;
	Fri,  2 Oct 2026 12:21:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9BE6603DC;
	Fri,  2 Oct 2026 12:21:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 054B1103281D0;
	Fri,  2 Oct 2026 14:21:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943683; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=oqAlVFXfMAcdUZksGidzaO1rRwjv8lqW4cFPdVMa7m0=;
	b=w4q/oLe6rszrm1kh2kX4hGyJSmDE5ZeAjIWURuCgBg1Jmwu06LlcINHFxb7CbG6FyQHINo
	YO79Fx0AE2UnhRFYED/ttghwJzURTFfIBSKRJQt8kTrxo6iHGrnCMgabPI2jWdmwo4JGaC
	+hPUXAy9Igz+T9H/26UT5dg6t9/TcIGq5X2c3vBvxfYv4LTdv4WTi+K9ZcSVz5qpjcb5pV
	ewOyMZAEUrpjPv8Ds97wro6NiVPGbEkgEof2X+THOTbVJBp8yyMIStlzb188z6owi1KYAB
	LOad+PSLKfaw8lhUQZVjyaJtbFLWCt/maTL1I0nGDojWeCFvslWjWuYLdbHgZA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/15] mtd: spi-nor: winbond: Add support for the W35TxxNW
 family
Date: Fri, 02 Oct 2026 14:21:13 +0200
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQqDMAwA0F+RnBdoKk66Xxk76BpnDkslERXEf
 1/Z8V3eCc4m7PBoTjDexKVoBd0aeM+DfhglV0MM8U4hEO6iY9GM38FXNvRFUIvh3nYrRupTakO
 KnAnqsBhPcvz35+u6fjRwfP5tAAAA
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
Miquel Raynal (15):
      mtd: spi-nor: Only switch to ODTR if the chip has a callback for it
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

 drivers/mtd/spi-nor/core.c    |  46 +++++++++++++---
 drivers/mtd/spi-nor/core.h    |   3 +
 drivers/mtd/spi-nor/sfdp.c    |   4 +-
 drivers/mtd/spi-nor/swp.c     |  23 +++++++-
 drivers/mtd/spi-nor/winbond.c | 124 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spi-nor.h   |   4 --
 6 files changed, 187 insertions(+), 17 deletions(-)
---
base-commit: c1775ba88cd08853e3f401d725b2ad94e783c5ec
change-id: 20261001-winbond-master-spi-nor-w35t-217993092ed1

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

