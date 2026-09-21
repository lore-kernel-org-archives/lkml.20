Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749B035E1AD
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973027; cv=none; b=f53ogF5SyiTLw/ySV9b909DcFbUqKN2+8fphFHmmPJkMwpx386/UE8d43WvU8yqZ0Tjb3/23GLwgCP+hhUReehzYct/IBgt0OC5coCK0wIX722Sl6GbZXKzR6LSoQVoL3GcYS46UIk2ddYlqDJoylH1mpglmB/HpvmC5klvbPkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973027; c=relaxed/simple;
	bh=Hwb4gPyYK+PDvVsAWwwCnOaLFxqwfB6a4i4L30iAx4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n4OWNjRDJUUbL8fy1Ln0G4ZXr1XTh5wdN3EZut8ldzCXgol2MyFF2FXoAAqiVhyerXWWtL280A4ZddblRHRg/rNi/yQotNrjTpng0DIw3MKlW6K939+KR6k1Vge8TkgvoS+R2yyE2grkJiW9OhupEwB0URdMUdoZ+zYY9KW/CoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Uf4Y4PwQ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Uf4Y4PwQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 720FA1A0DC9;
	Mon, 21 Sep 2026 06:43:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4699460339;
	Mon, 21 Sep 2026 06:43:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6740103290D6;
	Mon, 21 Sep 2026 08:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789973022; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mjZ2oI9B5HuAg88bgTdzdDSyjtF4SvsFSGrtzd8HZrc=;
	b=Uf4Y4PwQRq3R0MiZr2UiteaFxaKG48ejBcJOyOFoJjN7xUAWQjLmfO9IAZI3GJVWj9PW69
	cvw+yTHUOp8VWOuQIgxrAfY3uDP91TKNq4s1sSt9jf5GKOQYLLMXu0WFW9wbgoIhB5cyj1
	H1hS/tH+GBkTJbMvW7n2Op7Aa/PaidEpr85azjW0w+4FFylEOAnv30ftSlov4ae5J5m5Nl
	wEMxRp5jGiNL0iSpeKh4OVbasmuLFVxkL2wYuMLMztbsoLdumGOZTVVHLwgwFMwIizfI5f
	qr0meWgRt8maX5ZL6Ann4sd0DUo4AGyMAb3eKFDMywNQBhodsbvh9Z19SV7B5w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Mon, 21 Sep 2026 08:43:33 +0200
Subject: [PATCH v3 02/25] mtd: spi-nor: winbond: W25Q64xW-Q/N: Enhance
 identification of the chips
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-winbond-master-spi-nor-jw-cleanup-pw-addition-v3-2-38eef3b6a7db@bootlin.com>
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

The EF 60 17 ID has been reused for:
- DW-P/G (no SFDP support, but CMP and quad capable)
- FW-G/Q (SFDP, CMP and quad capable)
- JW-Q/N (SFDP, CMP and quad capable)
Add a comment to flag these chips.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/spi-nor/winbond.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.c
index 55c55e41ec92..5ce29987a13c 100644
--- a/drivers/mtd/spi-nor/winbond.c
+++ b/drivers/mtd/spi-nor/winbond.c
@@ -330,6 +330,7 @@ static const struct flash_info winbond_nor_parts[] = {
 		.no_sfdp_flags = SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
 		.otp = SNOR_OTP(256, 3, 0x1000, 0x1000),
 	}, {
+		/* W25Q64DW-P/G, W25Q64FW-G/Q, W25Q64JW-Q/N */
 		.id = SNOR_ID(0xef, 0x60, 0x17),
 		.name = "w25q64dw",
 		.size = SZ_8M,

-- 
2.55.0

