Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841050AC0E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788542362; cv=none; b=urX4SgrBt30j7alUBFiT5wq4WxpF9/I20E7R4ukcU2jmipq8adI3j7mJ03his5YjbQUYUJK+Wv/5F6q61yb611aB4CRLM+wj65AGfBJ3sR8sOWs/JbbWp8ckbpJAgNogawbeg+gABDXpQ5JPRYbHbg/S2yUE8zIuqnNuMrUCIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788542362; c=relaxed/simple;
	bh=yrwWRTPG7aSRZDHGRv0NG7gz51xSvQCfHmobpKab6Ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sy/H8ztFmVow2OY3X5cSslzEK5iZ9wFL1rbVaPP87mf9P1tp+6b09iJgpfY2VnpW+2s1M//IGQxYyNl1LEttl57cHY4dwG2/u2mrFWWlXsP9G+Au2qB3tjTjI7kOSZSXjBbGXq6bw6p9/ETu2jBHJbAJdgGx1dHNPogjyqRDy8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N/nY2YBw; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N/nY2YBw"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AF2AA1A19B0;
	Fri,  4 Sep 2026 17:19:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 840B56057F;
	Fri,  4 Sep 2026 17:19:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 398E311C783E9;
	Fri,  4 Sep 2026 19:19:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788542357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xTQcDpPMuDinI2Tj7TOvylmqU2iIXxdrXUnFujqV36o=;
	b=N/nY2YBwl9DE6SeG+YFEEvBs/yEVJsbuEvSkCDTJsfg4UbXlvsD0fPC3MkVewN6rm3gXlK
	Up0XvGzaOW+ByrzsDyMkpePIr6yk3033anQ1fDIBaAtVExagmnEKGSRZcFi7I94KIviw+W
	WdGU2M0YtX1X2/clZnQPe39RP+NzMXqY9trzjXZ5ZNTt5PMGCBSteTDXYS4u/MCv0OaRNa
	ZcXsBKLiqCrBelqsbeQz6L82f65VVZyCK5Jag+nGIBfdefLPuI0DlizmMXVYuj5m4VkPDe
	zBeV6QQrxuK7bK5ZJgKSkWZT77TqXfyKaucRtIt1baR9vVdZm8rhz7hq7as2zw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 04 Sep 2026 19:18:56 +0200
Subject: [PATCH v6 03/26] mtd: spi-nor: Init flags before manufacturer
 late_init() hooks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260904-winbond-v7-1-spi-nor-jv-cleanup-v6-3-bdb282f42a47@bootlin.com>
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

Current init order is:
- The manufacturer-wide late_init() hook is called.
- The core initializes some chip flags
- The chip specific late_init() hook is called.

This does not seem very consistent since both late_init() may need to
touch flags, which is then not working as expected since the order is a
bit inconsistent. Moving spi_nor_init_flags() earlier, right before the
manufacturer late_init() call, ensures the hook sees the flags after
their initialization, and can therefore apply changes to them.

Since spi_nor_init_flags() only reads ->info->flags and DT properties,
it does not depend on anything a late_init() hook produces. On the other
hand, no manufacturer late_init() hook currently touches any output of
spi_nor_init_flags() either. Reordering seems safe™.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index fca0d65a6f06..d9821620f59b 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3007,6 +3007,9 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 	struct spi_nor_flash_parameter *params = nor->params;
 	int ret;
 
+	/* Needed by some late_init hooks */
+	spi_nor_init_flags(nor);
+
 	if (nor->manufacturer && nor->manufacturer->fixups &&
 	    nor->manufacturer->fixups->late_init) {
 		ret = nor->manufacturer->fixups->late_init(nor);
@@ -3014,9 +3017,6 @@ static int spi_nor_late_init_params(struct spi_nor *nor)
 			return ret;
 	}
 
-	/* Needed by some flashes late_init hooks. */
-	spi_nor_init_flags(nor);
-
 	if (nor->info->fixups && nor->info->fixups->late_init) {
 		ret = nor->info->fixups->late_init(nor);
 		if (ret)

-- 
2.54.0

