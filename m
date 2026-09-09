Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7858568FA3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967548; cv=none; b=cyL8DO0hcg7hMf4cySX6tXB7J4+mBjQx0vlahn29vZtvi//HIUNFO8aJogTP/GnW/2YLt0GTDYYxdhulqrVt1hAoKCh8f0rIW9WafJyycohAFYCPaqkaeMXf5DFk0cMAFxusV/YsPjawV7rm22kvOT8UZIZLTqqgCdjcweWai8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967548; c=relaxed/simple;
	bh=wF3BelC3fQbE50LcH0Wozkm3LosMdn9MD0O1Zl+nCQo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=N0Q6ofy6fKO4Zjro0RYB7xArB/o4eOWajyGW9aXjiOHIz/kINJQMLAnEcwhPNaaNo0axVTFzzVtX5HiCgN6eWQyvDiJtUKs6nDsMGRvOoI2p/b4y9gvEpJX3c6VHdE7eOJb1dP56X+Pp+lQP1+LIz6mIlIp3niwcPT9MaF/NHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ogFH0pXI; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ogFH0pXI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 410B14E41592;
	Wed,  9 Sep 2026 15:25:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1527A60448;
	Wed,  9 Sep 2026 15:25:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA7F211C7AF57;
	Wed,  9 Sep 2026 17:25:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788967543; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=T95E4GAuXTPY8HSzjhtUtKCCAYBOzAsqRYeg4LelSjw=;
	b=ogFH0pXIB1GSItIDUyyXqn6rIQdcFAn9ErAUrOBGobEXh51w0AF3JNYogwbKuu8JQsOR/U
	x+sQVLE3aV/6/JNs3xDJD1CTTKohVcbECHH5UaqXXTYBPNAhqYc1vJETvXDPje1Qe5whmR
	dhLhTMfBLQzqWfaIEaAnQGFGVCcRwLY8QvIoL9ou4ejH6flN1/jIY2BnyysSpJHpfNXz3m
	PuBBxY5X2z31T1Iici04D3e3uEHuCukv23DjwlZK1drXRSVx7FWdhz3OZtR4/SpffWccyl
	zqX+fuwjy4fuu3s0w8ek0rm7OIkpWUIdeEvuMKWuXnqjCtVpuMf/TsJOtYeRgQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
Date: Wed, 09 Sep 2026 17:25:31 +0200
Message-Id: <20260909-winbond-master-spi-nor-jw-cleanup-pw-addition-v1-0-c1b20c39dd1f@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3NwQrCMAyA4VcZORvYqi3TV5Ed6ho1omlJphXG3
 t3i8b98/wpGymRw6lZQ+rBxlhbDroP5HuVGyKk1uN6FPriAleWSJeEr2kKKVhglKz4qzk+K8i5
 YKsaUeGkSDp7i3h9GH44jNLMoXfn7/52nbfsBa/8aUn8AAAA=
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

