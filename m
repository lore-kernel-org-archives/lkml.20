Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFF03E9C05
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789116944; cv=none; b=fe+6PZ7ZK1B6chmjWAHx5SzKtvBN7fPn9GWXsmd3b62owM9dioOaCV+aqB7gC4GcxF8sNK7AqTttFWN3uO1/gsVdBCxvxEWsKe9s7gQgl7sm0vWDXNodfTg8XvD9R5L3VHBwMVYFYwOx96hKH2bULv22Q0YN5bVjZMmz+JPPD38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789116944; c=relaxed/simple;
	bh=T+xP1TFexY0v8QIy6TBFsxe7D+n59YX7Joam+1iRzq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=I1i8MfuIU5QlBr0HP91l9XZ7o7nSUIn4C3xEopIL50LQEi91Lpwj0MJFGgRncH1DW4KguJcdOR8wBX1odGJBM4z9OzUj5J+Mgi+6m+RuLlMHe2Ad83CxqglTuYQUYg4XlcBhjhQedvSW5mHapAN5u+EMyi8bb1bpaG9tqStMv+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FcwwU6FB; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FcwwU6FB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id CF585C653FA;
	Fri, 11 Sep 2026 08:56:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1A8CA601DE;
	Fri, 11 Sep 2026 08:55:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 823EF11C7AFA0;
	Fri, 11 Sep 2026 10:55:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789116936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=kkhMf+HVfBqPHLHRY3DS0z3ZcaxJJxytx6vWDhyBIRA=;
	b=FcwwU6FBl4R1YrHe7j1PqJLYspUCd5fqct5/Zpmkom9q20gFpgF+ibcvGnekXcIj8z9CKk
	JRmF2ehAbSCawFQMPnJsP3Xvh2auFn3XhkBIscZ9Mqr+GroNsDEI2vJ5M0v1dK3VCMRBg4
	yrNHQ1bYjDxfHOfUIecyrH0NVjp1KR0pPsk2Au6Di6iHXwrZRJl4sdglCXLy/eqDlC2lg/
	VWgRwgcfOqONba/LN+ZrGpQLSS3xZqmmh/gLEJVwSFCoIGO4ekIzDZcRZOoV+jd5rrEttm
	bMDim/FN+YMJNK/ij92lGkcWqF6NeKWYnwv8FBo0y47ugA+zUMAT1pY2dt5bGw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 11 Sep 2026 10:55:25 +0200
Subject: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit in
 SR1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MSQqAMAwAvyI5G2jqAvoV8SAaNQfbmoAI4t8tH
 gdm5gFjFTboiweULzGJIQOVBcz7FDZGWTKDd751HREmVou4yo2WBENUPBmPW2ZcXEMVd2tde4L
 cJ+Ws/e9hfN8PR2jLHmsAAAA=
X-Change-ID: 20260911-perso-fix-spi-nor-qe-mxic-d0513e9f4421
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Jon Hunter <jonathanh@nvidia.com>, Steam Lin <STLin2@winbond.com>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
means they do not have an SR2 to read from/write to. The new generic QE
helper was supposed to accommodate this situation but in the last version
that got merged, parts of that specific handling has been moved to a
more contained location, swp.c (which needed most of the extra code),
yet the Macronix case has been forgotten about in that generic QE
handling helper. Booting with such flashes will always fail probing.

Fix the situation by making sure we do not attempt to read SR2 if the QE
bit is in SR1.

Reported-by: Jon Hunter <jonathanh@nvidia.com>
Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.14451625037676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status support")
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index e2b6efafdd8d..ac909dfb9657 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -985,7 +985,10 @@ static int spi_nor_generic_quad_enable(struct spi_nor *nor)
 	if (!qe_mask[0] && !qe_mask[1])
 		return 0;
 
-	ret = spi_nor_read_sr1_and_sr2(nor, sr);
+	if (qe_mask[0])
+		ret = spi_nor_read_sr1(nor, sr);
+	else
+		ret = spi_nor_read_sr1_and_sr2(nor, sr);
 	if (ret)
 		return ret;
 

---
base-commit: 700bf34058ca7cd792236b1ba5caad3770d66208
change-id: 20260911-perso-fix-spi-nor-qe-mxic-d0513e9f4421

Best regards,
-- 
Miquel Raynal <miquel.raynal@bootlin.com>

