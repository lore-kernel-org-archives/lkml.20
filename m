Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C837756B
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943704; cv=none; b=t62y+aA7kyFUQCiQ3loMan6GZI5xAHT015JW31JgASX6c1OYXcsL/BNiaQQwFZswfj418Lp9MtjgHkT8rVlTQi4SW0VckqztJP2IRrI8HaCIR3l9dRlhuRgVZRsBWSoFNLOUnjKSYwgud6ncwBUHy4AGshxRm90EEcKrNOvp3Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943704; c=relaxed/simple;
	bh=ks1s9uCqto7Lqve/BjLdcGtkzfISPmYXHcTZS0ODYlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2+ZZ9v4wFmDVjK8oa0fySvRmPtG3fRqeOYO44R35xuHR47PvWRDDEK9RaGY7uwacdyOnsWxiuoaaIoaDdxs3G6trSHjrFaq4EQzQarEQt3K4VUvJfEovlXSjoTrRaaP06v2s6K3aikXhjpT2DppiiY3zH4UQ/uIo5scau0XAQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=e6KGYanl; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="e6KGYanl"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 149BD4E4110F;
	Fri,  2 Oct 2026 12:21:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCEFC603DC;
	Fri,  2 Oct 2026 12:21:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDCFA103281E3;
	Fri,  2 Oct 2026 14:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790943698; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lKU3bfFA3TBWByBniXLhckIqiCwee1j7ncswMHgAQeQ=;
	b=e6KGYanlIDFTY8WB/bUgBsQWMbLQfreIEBpim5uy9g2NcG9kpHip1tY2P1qFomYC/vdqTR
	utOpzqekHybyv3pmxD+zZ+vPCopUGqdFKA3e7ZkT/TGEKj0ZhAPzPcgVPAf7ntLokJdfnL
	kL6l35PXvQIPzfQsubb1HufFkylYyPppae4pZ2UUWLb50YpDHGCyhPskXaDpS5vymTc1Hy
	bkgvsfCnNuJtEC5n7TEkXOjY7aQNml8uZdYfbqHthDkw0SiTVdLKnJpCV0843xek3t8fkJ
	igFRb/oAvcDYBLow2AO1TqA4bv2vfe9NoaBRjdGXCbNoU0PVP+w66odMX872wA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 02 Oct 2026 14:21:17 +0200
Subject: [PATCH 04/15] mtd: spi-nor: sfdp: Enhance a comment
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-winbond-master-spi-nor-w35t-v1-4-a22a2f95c26e@bootlin.com>
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

While working in spi_nor_parse_sccr_mc(), the actual meaning of the
comment was not obvious to me. Not sure my proposal greatly improves it,
but at a first glane it feels clearer to me.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/sfdp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index c21a6953db96..9d5c0bbb53ae 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -1417,8 +1417,8 @@ static int spi_nor_parse_sccr_mc(struct spi_nor *nor,
 	le32_to_cpu_array(dwords, sccr_mc_header->length);
 
 	/*
-	 * Pair of DOWRDs (volatile and non-volatile register offsets) per
-	 * additional die. Hence, length = 2 * (number of additional dice).
+	 * There is a pair of DWORDs (volatile and non-volatile register offsets)
+	 * per additional die. Hence, length = 2 * (number of additional dice).
 	 */
 	n_dice = 1 + sccr_mc_header->length / 2;
 

-- 
2.55.0

