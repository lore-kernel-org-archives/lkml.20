Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3D751AFD2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909282; cv=none; b=EaHKZC/Iqja1Hjhkdn6oI61D6+jdl1dE13G/fXIIhI1oVNJbylrSx2mRNshkAuNVxGrFC191Jm10K7DJcgY6fLGZmaZhycJ8a9cc7RQPmXkXuUoR+1ar7KfvDVczumMINxtCznV1gDSqMBVC/oNVjSSsxWXH4H2WwuT8GFpPpaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909282; c=relaxed/simple;
	bh=gY/RLdCXN0j3cIaYxdQtTQefvP+o8DVmELIy6OZC+60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QL9ETGNvR29OkBnMzGGb8EJUqLfOXAt6RVJGGxZhI+Cek++oY6F5arLK83WZrrIxiO2JhUi0hWqI1U98oh8RZqpqEu1bJ4gV4JXH7A6RG7K6D0thl8wIOdIZVavg/V0SFKQFttdFf4uv17f8Yvhle8jWFU4k8CWbdIRtYY5qIro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Un1ZGeDo; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Un1ZGeDo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1A62DC653F6;
	Tue, 13 Oct 2026 16:35:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8030A60362;
	Tue, 13 Oct 2026 16:34:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B684211D717D2;
	Tue, 13 Oct 2026 18:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791909278; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ear8Ahh2j2AUiHu3vy3cVps1i5/MTD54IMpodJAajE0=;
	b=Un1ZGeDo+v5uZvuZLUUztm0Ihm2gkmU4S+FyxfnYZASvaAMZKYrJ+4qZPXBeva0IrmmwY8
	cjo5/tlRmWNRcdYYuLAVzXtPoAgAwuQP/XC0P8Nq5xNMxiiSehRGHElc9ywrQe9PoXB9vc
	LY8Fi9b5qd2s8aRrWOFLgmx/ZThZB1OnX8+ei2nss9ogrSB4d/4wXEcb213QCfhfr0K2nF
	gsJdtG955CgiCh7YZijjgLCQRckmfZg4XhLe0SkVH7iWo8tJYa/kcdNOLC9MNj8itZdLT9
	x1izQ0rOmozphVi8593Du0VyaU/cJwY5DtUH+mVzbF6SNGRX7euNqJWsVbWNBg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 13 Oct 2026 18:33:54 +0200
Subject: [PATCH v3 04/17] mtd: spi-nor: Fix comment indentation to clarify
 the intent
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-winbond-master-spi-nor-w35t-v3-4-6dde1d513df8@bootlin.com>
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

The comment is misaligned with the content it describes and this kind of
bothered me when I first read that code. Move it to the correct
indentation level for the sake of clarity.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 4b9e0410f2f5..2bbec3feda39 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -2459,7 +2459,8 @@ spi_nor_select_uniform_erase(struct spi_nor_erase_map *map)
 		 */
 		if (!erase && tested_erase->size)
 			erase = tested_erase;
-			/* keep iterating to find the wanted_size */
+
+		/* keep iterating to find the wanted_size */
 	}
 
 	if (!erase)

-- 
2.55.0

