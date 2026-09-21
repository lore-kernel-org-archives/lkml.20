Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1371C695
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973025; cv=none; b=BlXLztH/UnhxFNi90bd9koZOKTLKNh47fFT0DGW+R7c/VPyRbwJrHr4OdrdjbSsDdZ1viLiY2TtPlFI1QiKIIenGWB8qU+7oq+ulo6gCN5QFwQq/LmfFxmezMwSIM9KdDW6ZyYkwSTzhZzVMUTPNcSMLICHw5ahGRrD9ckrnwvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973025; c=relaxed/simple;
	bh=or+OWl10I9B/tLMuVHTcmnXXtf2fey3/U/2Nl/9W1YU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T9Z6dqI11vpR/xPIbmV+qz45IbcNZiaOMPmeCWBIIAW7nsR8reqddgNP+nWkhb/qPcYTogFLuzY8yip8W3oE82DaPLnVtSYQzKdFncAQUJdILQ/mp0gGlwaDemy7whZjALTMqI/YwCPiMrtUnSc0G4MbX4wu2MHGz9GpK/CDLaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Ejl3XGf8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Ejl3XGf8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7BD50C8F47E;
	Mon, 21 Sep 2026 06:44:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 77CA260339;
	Mon, 21 Sep 2026 06:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02BA0103290D5;
	Mon, 21 Sep 2026 08:43:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973020; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tm6Jr0pHkzuql2HODrAWfDwmqdzokVLmqYPn0PTbu2A=;
	b=Ejl3XGf838+zrMRCwgQ4noetUcbngq0zps8nhVXmpfgno7A3NhERzzo8jS0HFb3eTbdsJ8
	fO4PEOEGG/4vKoD3IL8pxpBXc2k8tJVQShCU6RFOC2kQGA0npLxZgMtWf2F9By3/Xd1Q2Q
	xK5KOqmv+Fj26IabFCvr+gXkAjii8rnxCNkms2uiMuRx3mECUULFDX37jrV/SPB0q+HAqV
	vYQtBlAa66I0/rK3C6LsYLXmVfounFG+QwNVn4ttmSjerLaaBES0MkmZoy5r2Cpw7yu8J4
	HkvkCV624eZz/gBGLMZad/rbiyrw+JoAeKA6MurlLiXADf+TwlOVTFmDsaQgiw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:32 +0200
Subject: [PATCH v3 01/25] mtd: spi-nor: winbond: W25Q32xW-Q/N: Enhance
 identification of the chips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-1-38eef3b6a7db@bootlin.com>
References: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
In-Reply-To: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-0-38eef3b6a7db@bootlin.com>
To: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The EF 60 16 ID has been reused for:
- DW-P/G (no SFDP support, but CMP and quad capable)
- FW-G/Q (SFDP, CMP and quad capable)
- JW-Q/N (SFDP, CMP and quad capable)
Add a comment to flag these chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index f6321c1dc7dc..55c55e41ec92 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -322,6 +322,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.flags = SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB,
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 	}, {
+		/* W25Q32DW-P/G, W25Q32FW-G/Q, W25Q32JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x16),
 		.name = "w25q32dw",
 		.size = SZ_4M,

-- 
2.55.0

