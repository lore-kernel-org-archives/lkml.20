Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D813033E6
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943699; cv=none; b=ABRvs3x6vcGkYh4kfonXV0iXriKk2n65Zd8J1IwK75RJBnUoemvtDY4BnoZvt5ujb6UkRagW3WcSXQK2hZppRcCF4q6A8ovUKP2AXz2vnsN5cwVH8g5lN3UNMmeKB2Z0UKXK23+KdUEDxp7U24ppdMQy+t3WzSWGPB5SGu+lK1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943699; c=relaxed/simple;
	bh=fztX0WZeE8mFS148QRpdBMYp/aS421RjFwxd2+o+52M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fCZLq4urPLKeeaYB2ATIZ9YMyCo8OdXJ6bEisgxGIkibuSqAd3TTvxKGGZHPI3KcfuwsV3cAlZDtvOgSI8NsgqNkn4nQLFsATK1qDNDFvqRQd/qUxS2h+QGC1E6wOyC2N7O+Dod4tRDSwdmFsXwy0StFJOJoio+wdYv4ttTcM6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=xeyxf4iX; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="xeyxf4iX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 17F1A1A10DF;
	Fri,  2 Oct 2026 12:21:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1E6C603DC;
	Fri,  2 Oct 2026 12:21:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0F70B103281D0;
	Fri,  2 Oct 2026 14:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943695; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3rH+xtaEE72c/dMWl13TrWCqgtJCjAS6ZGNblkbLQAU=;
	b=xeyxf4iXt3nbfBRYOCbX/iRVRaF/v7G6Bxr2i5BWBr3kzeJ5/Ung5uhGWmtg8PWpKr8DHF
	T6t146fG/nQJTpQrzNJ4BdNhf0UGZNSFhxsA90ipGhzewvBBGk5FbGhoW9nKDaP6vc71W6
	8M0FECULZp+y7+eTYeORGeZXFId/U6d987BHFIY7d6OjnJitcBz/9ZydkA4b1uy/wnAx97
	3CzIog4kf5JYQ+LU4bUEVspjPoobIXie2g4EmaAJ7DBBRjQGIHbmFs9qRWuMKLlntLhJmb
	UJVFX4pWgOY+sJDEsVc3qHYug4iFR8SvK55dZ4sm7BP3pH8t4cMSJIR5LZHwYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:15 +0200
Subject: [PATCH 02/15] mtd: spi-nor: Fix spacing between arguments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-2-a22a2f95c26e@bootlin.com>
References: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
In-Reply-To: <20261002-winbond-master-spi-nor-w35t-v1-0-a22a2f95c26e@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

A spurious tab got inserted there.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 9c61ff4b93c3..4b9e0410f2f5 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -773,7 +773,7 @@ int spi_nor_read_sr_ll(struct spi_nor *nor, u8 opcode, u8 *sr,
  *
  * Return: 0 on success, -errno otherwise.
  */
-static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode,	const u8 *sr,
+static int spi_nor_write_sr_ll(struct spi_nor *nor, u8 opcode, const u8 *sr,
 			       unsigned int len)
 {
 	int ret, i;

-- 
2.55.0

