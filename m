Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBA536728D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973025; cv=none; b=H9gym/zbdgKTQZru3p8IwjNA/FR3KKXd1tC9Y6ARsOB7QzxVWF4/az2e4Lepviw8p4pGQn+tO7gN9Sb2t/jnxl0suiQ5hRpHj4nkhAEq1XeOARC1uXRrOx28v5y0KByJtoWPiDnX6ybxI247faBVgWgKH2ZfvBj2V1eAwGfHOPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973025; c=relaxed/simple;
	bh=TiCo3J5cWfYccKXszuJeEyD66hZkLrWFTaz56ZW3C8c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mSJuGCnbOaX4xMWkEYoI3fxtovvhCWUxcKOueL51DM80iUUDP1wLTZkulH/axVKaweOrgpeGRqn606zbrt4VoP3UK7lrkRDMrqWz7XfLx1sTt0NGJHcFsUSv0r5F7Yb4GmEH3+rVBtCwivgu0il7Ka74dHeuBP9NywKx1poFtDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xJh5bLR+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xJh5bLR+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AC5BEC8F47D;
	Mon, 21 Sep 2026 06:44:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1C3D60339;
	Mon, 21 Sep 2026 06:43:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2860103290D2;
	Mon, 21 Sep 2026 08:43:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973018; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nq2N5CNQkEOykHaLoOBsM4AN5HE/XlIcHsQWDjLbxYs=;
	b=xJh5bLR+/WVPS3S1qEIL2gkW0PAlU/t8QXa62tUq6eIMK93YPMMfTPq9mKOnV54Qe+f7aN
	vGlvZ11GI5pEG1Zqd+ksA8Xft5QUyC/3ALBU3h/WV00b01RalQGIeBBMdg/b/YFw/LfPUh
	OzHNFM4da2BJpMUho17BqnMddxehN1ey80jSeQ2qm2jRlTQ4jujmrewymJjw0i6Y8kEtMx
	3u9GxPmgZmNvntUfGmgMPtPE1mKyue/1n8J+Km4qXzNrTu5oPeuu9CLJBLdd+KbpXgcvg/
	zHr1EiWvDyMz9lmPE4KSZs5vtOHvKrsov3FncvRrU8L0MSoMb33swhhXnNStRw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
Date: Mon, 21 Sep 2026 08:43:31 +0200
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNwRKCIBSF4VdpWHcbwCRp1Xs0LRAwb6PggGmN4
 7uHtqmly3MW3z+RaAPaSM67iQQ7YETv0sj2O6Jr5e4W0KRNOOWCCi5gRFd6Z6BVsbcBYofgfID
 HCLqxyj076EZQxmCfJGC5VVl+LHIhC5LMLtgKX2vveku7xtj78F7zA1veb0lSubE0MKCgWcmpz
 qQxrLqU3vcNuoP2LVlaA//xOd3q8+SrUmopisLQE/v353n+AFfaI5tMAQAA
X-Change-ID: 20260626-winbond-master-spi-nor-jw-cleanup-pw-addition-15ea35485698
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Compared to the previous ones, this series is super straightforward
since it leverages all the core changes that have already been done for
the JV/RV families. Like the former JV/RV series, it first cleans up the
table for JW chips. As I have access to a lot of devices, I made test
runs with almost all of them. This way I could extract the SFDP data,
the capabilities of the chips, proof that they passed all the tests,
etc. I then add support for the PW parts, also showing a full test run
in each case.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
Changes in v3:
- The 33PW chips do not have ECC support. Now that this was properly
  explained in a comment, Sashiko raised that the commit logs were wrong
  because they were still mentioning the capability. Fix the commit
  logs.
- Link to v2: https://lore.kernel.org/r/20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com

Changes in v2:
- Fix comment pointed out by Michael.
- Resend the series, hopefully all patches will go through this time.
- Link to v1: https://lore.kernel.org/r/20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com

---
Miquel Raynal (25):
      mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance identification of the chips
      mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance identification of the chips
      mtd: spi-nor: winbond: W25Q32xW-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q64xW-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q128JW-Q/N: Fill locking information
      mtd: spi-nor: winbond: W25Q32JW-M: Fill locking information
      mtd: spi-nor: winbond: W25Q64JW-M: Fill locking information
      mtd: spi-nor: winbond: W25Q128JW-M: Fill locking information
      mtd: spi-nor: winbond: W25Q256JW-Q/N/M: Fill locking information
      mtd: spi-nor: winbond: W25Q32JW-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JW-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JW-Q/N: Add quad page program capability
      mtd: spi-nor: winbond: W25Q32JW-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q64JW-M: Add quad page program capability
      mtd: spi-nor: winbond: W25Q128JW-M: Add quad page program capability
      mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-Q/N parts
      mtd: spi-nor: winbond: Add support for W25Q33PW-Q/N
      mtd: spi-nor: winbond: Add support for W25Q64PW-Q/N
      mtd: spi-nor: winbond: Add support for W25Q12PW-Q/N
      mtd: spi-nor: winbond: Add support for W25Q25PW-Q/N
      mtd: spi-nor: winbond: Prepare introduction of W25QxxPW-M parts
      mtd: spi-nor: winbond: Add support for W25Q33PW-M
      mtd: spi-nor: winbond: Add support for W25Q64PW-M
      mtd: spi-nor: winbond: Add support for W25Q12PW-M
      mtd: spi-nor: winbond: Add support for W25Q25PW-M

 drivers/mtd/spi-nor/winbond.c | 91 ++++++++++++++++++++++++++++++++++++-------
 1 file changed, 77 insertions(+), 14 deletions(-)
---
base-commit: 21373f9588a0df4fd2ad7bbd120b04fccfaf0677
change-id: 20260626-winbond-master-spi-nor-jw-cleanup-pw-addition-15ea35485698

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

