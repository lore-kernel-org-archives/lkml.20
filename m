Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58713537E0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789912832; cv=none; b=SCDPZihJGlx1fn1Jz5PpIRkHlHx0jS3ALNTcqptb0Ij8qWHYqFUSf82H7wyFq7UgaH8T/e6WWBiOHhoccOoIcB2F91HPeUFPYKzef6xGv8aCDLrrx2YGAU0gRGc3gg5GmP/VmhgE52cEZrXrde5KSa1ucBc7l+rOxW1Sbnmcdm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789912832; c=relaxed/simple;
	bh=z+PEHZeMb517IE+OMAE2FGU6jnKyfQMwxOUsjPkJ7Q4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iPYa6aPpOl5SqVvcUCpGE2BB3O6NpW8az/c6nSyzWnYNz5Hi5bkm7gpchKj2tYTzFNS2CItFsxkb3wAOcAyUOG33QSl20xlvk2Ii2b7VPbhA4fn8bwKkOvqiEe4cdlkzHQwsV0JeitYo1TdXCeyJRS9lGEcBOY0/QqFyjb9DAJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ayd7A2Dq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ayd7A2Dq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E86B11A0991;
	Sun, 20 Sep 2026 14:00:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B642C6033F;
	Sun, 20 Sep 2026 14:00:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8581C103286A4;
	Sun, 20 Sep 2026 16:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789912819; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Ub5pYOQhzCNVrg9D9Bp6x2yHYSO8UuaD7loIAlMzECc=;
	b=ayd7A2DqIbopnLFZGBjcRvpvLl9TzLmWUCaCI0ID68lZMV4ZWsGvWcjBvkrHVXMIyiw2q8
	POlYtuKwqu/uS4yDgn4QORuY87+GLDSyXnW3r5PKLlI+A2+x8Yl1bGR+6pVRjt0mB5qsll
	3ZXPdxiraBDN/qx4f4Q9Uy8Kh7Va2ER3185JZX/XN51Oaqakl7I1pJhaM0uzsLB7XZ9tMe
	6SLxGznr8YDei8tsKLLR2TN9MxFhfj3OkV3L0JVRrkr31md1OGaGxOnzd0y32QTeN5Jlei
	/cCD2+obH4eRv6z2b7oWEd1C7FdTwi/1mrqj3PcbwTNudR8S6U/oKsOZ08EP0A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 00/25] mtd: spi-nor: winbond: Cleanup JW family, add
 support for PW chips
Date: Sun, 20 Sep 2026 16:00:09 +0200
Message-Id: <20260920-winbond-master-spi-nor-jw-cleanup-pw-addition-v2-0-ab9c9688d071@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5XNQQ7CIBRF0a00jP0GqCXFkfswHVBA+00LBLDVN
 N27WFfg8L7BOytJNqJN5FytJNoZE3pXgh8qogfl7hbQlCacckEFF7Cg670zMKmUbYQUEJyP8Fh
 Aj1a5Z4CwgDIGc3kC1lhVN6e2EbIl5TNEe8PX7l270gOm7ON752f2XX+SpPJPaWZAQbOeU11LY
 9jt0nufR3RH7SfSbdv2AVj1wDfsAAAA
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

