Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373532;
	b=XrhdUZeJrNDBUxPlyO/T7iZGhZ9qIi9yM+BViurIRL5DKbrLXVytCRNMTcKwxFkSBLpU
	 huQXGncrL9A5tePaF7s93ewNx4ec7JzJBi9cR77MY3YsLWgmGeZTaq4A/eRXbVspFGp4B
	 ovdyuxI3xO5vlfwqni/scz9N6tE2Y8HaDQwerA/UHI3LnK5lrzz+XLHo55DJYbOAxAVSX
	 516iabbczCBIVlQ+yobCfY77qMbEA4JvG2hQ6xadC3TIx8bDCVZWv1N+2riN+maBSxZtd
	 tT6l6i9IJCjRJ4eNDGDIbSzs31MPCaoX1NWA0naI+9flZfknCuQDy1GsrLcZGXOr8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6MjztBnlV5pomChElSlFxYSq9kFZVSiTPi38g4YWVXI=;
	b=jvDmptnQ9/mGocWI83wK/2DM2cubywICXA7WV0jNwJh8tajcJN2gy4D4ZwSuDGqwQLUI
	 YKNDqehUvYHWTpg94Hg3Fw63QYQdPUkM9dQtzhYIE69tlHab/rm41Zl6NlPzDJtJZLgBR
	 Zv/gWHUa2T7662x9b9wv2CsK87326eorzWuIFi+yCz+JssQm4TH1BzpQnwBHhABAn8nhp
	 itDg/ESYiXJ2kbiQJ7io87985IrC8sdDyfHQ/WVErdVcTYq7bPjDJtnmFwSbq+o7y2nV3
	 iKeKRD61RFe9SwdQ0dwG9Clkz5olhJy3qVG6RZKpDbPCzcaQP9CLR1pnZBxh8mW9q7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKqr8cXk;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B5606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 15:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED6B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qKqr8cXk
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso380188a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793373531; x=1793978331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6MjztBnlV5pomChElSlFxYSq9kFZVSiTPi38g4YWVXI=;
        b=qKqr8cXkiP4P3IOT3QWCMvEX8Lf8P1/85rxLaVIl8n/ZJDzqpnLAOWby52WMyYMEgT
         EBXnrQPU7e7bFTAP97pkZPad307/c0UbWziOgXJncHTSXXZjaJiARvIjpcfCjV68Odxe
         H5g//MjxmO//9M3kRc7F/zw/rxbquILKyuncwcCY6Vy6LmDhLJ5Z0PERmrIpmq4PJEKc
         7srU7F/WXUlj3bNrd/v39uHuHnW2f6VrhPghKZ+hLmdrPATiDo7JfN///oZYLj5xO1P4
         4Y5sNN76Vhh7ENkQJtK6KoCXibOQkDQ6RKjvpYDnjj6Ay8AjNFpSUrt/yY9FvIy6yc0E
         BnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373531; x=1793978331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6MjztBnlV5pomChElSlFxYSq9kFZVSiTPi38g4YWVXI=;
        b=GLW6BzPyIgu8mNeMtKFztZbWh2CKIuD9foWHyW3KKELzx9T97rToNQ6Rg2HNmKKOgl
         f1QrieYzAJgq6HbAShIU3ZNp6q0GPRGI4dtFBwADvWKbTJOW6HHgckA/9gCrsW41NE2E
         tadz9iNDG2oCJT4LRqlfpDcxhwbaej61m234ZCqck8EEN5kmiP9J8Q8wAJINsGBmLQ4z
         uXHBC06fIGWy8OVLCyUOGcxtHGP+EK57jqZ31TRoRsVvGp5qpLV0R8b2qZuP6XjEiP5d
         /vh8zo6jeGD5TzCC8TGEoD5IOSEhEGjzQABc2FB1w4Zi7mbb0oKbhv2swyVmeWUHVAU7
         iOUw==
X-Forwarded-Encrypted: i=1; AKwUvBwRkIE7YbvoBbXUcU7DYMpMnyaWW3NnSpYBPt51tQohRPoJy+adxjE5tH8CuyLz49/hpH9JHspBVw/dnSg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXl12aIZGcalvk/Xoyao6a7BjvLEhHIUG50YAulbVwv/29OwtE
	HJti8G6LGyWaG388AMFgp2Ko6TOZ/5tKJknnpvDUkKCgOqr7mWgw/T65
X-Gm-Gg: AYBFou1p48EGz2RVH4jj2kvHe7apaYS3UmwL00TGwYY1wroALHdc8hAOY84ukH7eTiL
	JCNmtKMwwpiPZ/hMM2JPpCv3JcYvefiEJNilQDhisQ2nJKQD23+o5a182KogkNbaOt2+wjZO/7K
	VoA4mrlsDXOipevPeHC9x4ScLA0YTji9G7B23ixaphZIPHbAoUglF4ag9w7ofZZ5FiK8oIG/mGl
	SoYOK15z41FQPEXO1MTRMg0gqiSW10AM5GIGI9TvZbfaRZhPHxzKeyQs+zaEtbUdFQ+keKBUu9A
	nEoCWrNdfCD+pMFwji5g1PnGLU8QoASYnO4FOZ4nWloHiiSolXKYTYjS29gTF7SnmNo+XJjiTk2
	OPCuxvqsBR8/r5GxngXdu6xBqlEagJQWfDnQBuY0VvNu3AvyrKL4UsNpnApxROjJwEGb64L1YIM
	/7YNZ1SrCmzPm9bZCk32uB3YJAOACKwPruALIPCgHe2aN+htE839txxRZUB0zUHAiKNRFJCyXqx
	JlkO+JFdUMUu201JnMR920FgvWQzARfJAx49W4vKvGZGJpw9yD/sHHCv5/Jv2dA8CUje8lc3LBb
	OX/rugSPKkjqjmeyRIpfGBw6+pmasvlbTsz/Nkb//Y6Ucr11egndTOhQrCnwjuyoNQLJho4j+Xe
	pwEZYve+hA3ETRE0qTbj1xVXjszP9EgFQFNZ2F+duRxVda9L0qC3GEXlBU/Kz2tVGfiE8xgnp3m
	HhTAuHoxmtmICfPOM=
X-Received: by 2002:a17:90a:e7c6:b0:3ac:929e:691 with SMTP id 98e67ed59e1d1-3ae897c8337mr2072805a91.17.1793373531260;
        Fri, 30 Oct 2026 08:18:51 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845aa27esm4299626a91.11.2026.10.30.08.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:18:50 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH] mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
Date: Fri, 30 Oct 2026 15:18:43 +0000
Message-Id: <20261030151843.2953269-1-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When ECC descriptor preparation or submission fails in
stm32_fmc2_nfc_xfer(), the driver unmaps the data scatterlist without
terminating the previously issued DMA descriptor. The descriptor may
remain queued and execute when the next page operation starts,
potentially writing into a buffer that has already been unmapped and
returned to the NAND core. The timeout paths have a similar issue, as
they use dmaengine_terminate_all(), which does not guarantee that DMA
has stopped before the buffer is unmapped.

Terminate the outstanding data descriptor on ECC error paths and use
dmaengine_terminate_sync() on timeout paths, ensuring that DMA has
stopped before the associated mapping is released.

Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware. The patch has
only been compile-tested on arm64 with W=1.

 drivers/mtd/nand/raw/stm32_fmc2_nand.c |   13 ++++++++-----
  1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b1..82d6301 100644
--- a/drivers/mtd/nand/raw/stm32_fmc2_nand.c
+++ b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
@@ -915,6 +915,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 						   DMA_PREP_INTERRUPT);
 		if (!desc_ecc) {
 			ret = -ENOMEM;
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
 		}
 
@@ -922,8 +923,10 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		desc_ecc->callback = stm32_fmc2_nfc_dma_callback;
 		desc_ecc->callback_param = &nfc->dma_ecc_complete;
 		ret = dma_submit_error(dmaengine_submit(desc_ecc));
-		if (ret)
+		if (ret) {
+			dmaengine_terminate_sync(dma_ch);
 			goto err_unmap_data;
+		}
 
 		dma_async_issue_pending(nfc->dma_ecc_ch);
 	}
@@ -939,9 +942,9 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	if (!wait_for_completion_timeout(&nfc->complete, timeout)) {
 		dev_err(nfc->dev, "seq timeout\n");
 		stm32_fmc2_nfc_disable_seq_irq(nfc);
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		if (!write_data && !raw)
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 		ret = -ETIMEDOUT;
 		goto err_unmap_data;
 	}
@@ -949,7 +952,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 	/* Wait DMA data transfer completion */
 	if (!wait_for_completion_timeout(&nfc->dma_data_complete, timeout)) {
 		dev_err(nfc->dev, "data DMA timeout\n");
-		dmaengine_terminate_all(dma_ch);
+		dmaengine_terminate_sync(dma_ch);
 		ret = -ETIMEDOUT;
 	}
 
@@ -958,7 +961,7 @@ static int stm32_fmc2_nfc_xfer(struct nand_chip *chip, const u8 *buf,
 		if (!wait_for_completion_timeout(&nfc->dma_ecc_complete,
 						 timeout)) {
 			dev_err(nfc->dev, "ECC DMA timeout\n");
-			dmaengine_terminate_all(nfc->dma_ecc_ch);
+			dmaengine_terminate_sync(nfc->dma_ecc_ch);
 			ret = -ETIMEDOUT;
 		}
 	}

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
