Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B334250EC1A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542355; cv=none; b=AYdFGov8lQfBG66xl2IKabE9PysAQJZYnuPJsePYnbTXLxWHNMdWEPpRkqsYrNQWXSb/HikLP2Hx/FID4snCAUesIxqozs62ruEpdPNhYbNWOAWGECMDwJBrLRL2osQvzySknf1Q9+yebBizxXbVaRfZe63dNjr3eHeywt7puao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542355; c=relaxed/simple;
	bh=l4EUZkxE/phyxV0ZGiiVXhKWISEFsieM1HEjE9i0nas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbV7FrVc/aYzTL1WJky41zP14mvq9KRGUIfvudEz9gJOSwHwoOLVFii3AVsJZ7Up/aOGUNq82F6JG8LBuEHbZs0YuucoKDqSN0mnDIkjMuXtICZkLKCQ+vuKRcwXzIKd0AuXbQ7nbnXDZJMLtqsuB18xnEOoscX6KvGvDXM6qUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=W+ZPbzJT; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="W+ZPbzJT"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8167F4E41515;
	Fri,  4 Sep 2026 17:19:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 505F06057F;
	Fri,  4 Sep 2026 17:19:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6431011C787BD;
	Fri,  4 Sep 2026 19:19:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542346; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GXnm7bwfu9pffhkTj2o9xxxkiDXBKvThIky7UViamJI=;
	b=W+ZPbzJTIDoRAQJNYdLLvhAxt5W3mjwahG15HAkhYtNR+8gRYiSYZUOdrL+lQboSmflBq+
	Nm2si9ZSBgJ+3rCmJd4NtvjXQG7yerogTtRf7hW3dEC5by9cwW6ChebohSzoBXldPLJY4A
	Ojx+KcxNQX34mlKBef9QH4IwA4yNmGbD8vXBEBbCJVBo2jRKhASl63Ewsum5fdFEHn5/XU
	+NkAFQCFPeR5twLg6xBGyWbmwY0goZ1k6IATb3/30jCR3VTX7nC8b36qw+C4d7uH7CBn8q
	TW1tgMVsb6bHAL64gKE4be6wUBjydzWpbg6/uhZJ/Udc6S6HZto7/E+v8ta/3A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:54 +0200
Subject: [PATCH v6 01/26] mtd: spi-nor: Fix spacing in function call
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-1-bdb282f42a47@bootlin.com>
References: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
In-Reply-To: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-0-bdb282f42a47@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Remove the double space.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index 2a1ed17fcc62..cc403ae97a83 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -484,7 +484,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
 		    bfpt_header->length * sizeof(u32));
 	addr = SFDP_PARAM_HEADER_PTP(bfpt_header);
 	memset(&bfpt, 0, sizeof(bfpt));
-	err = spi_nor_read_sfdp_dma_unsafe(nor,  addr, len, &bfpt);
+	err = spi_nor_read_sfdp_dma_unsafe(nor, addr, len, &bfpt);
 	if (err < 0)
 		return err;
 

-- 
2.54.0

