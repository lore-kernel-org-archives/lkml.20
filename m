Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377271;
	b=VTjecVd5ZUEprSR4Ra+zf03qaUVVGSPj3EPhfREyRMog1GxRuOb/qtmgZ2TBOnCQ7Kb1
	 qk5l71ZQp3KDXOgJ5rNKvui6T2gIQrUy3HuZnTjDQJj/3vE4zmeGKVybVWu/DcYQ2AqEy
	 SVjGSjQwUbQAugrVI/BfPg0GHtriSZEOFokBqYjWQ6DIpf1oOCtgkWsTfovg9pXCdofop
	 y7s32DMu39C6TiBLH+TqWrhP24jIc1oNtVz0yIrF9+on2vptfzoq/R0tgcz6Cx1RIUuUQ
	 Q+Vu3K1i6Io43L2Mn6XH4yeup1+ZqAue22zcljt4y9N6RkpjmVzLlH3c/TZKatsRZwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
	b=MPthI04ZveEpXBkETt8sYQ6w0qENOpjb97PdUqzlD8pV/0vC0e3DU7p3Ref8tanKK0+I
	 SQuyeW8Ugtsysri9XtplYqONzK29YHde4ufwb4jM3mDlSD9W8oHnrStuNi4kNTwdavDn8
	 akCNHLhqVFCY6folRdOw2gz52151eLNVdHO7TvzsYyz/cjiz9tpjrKUeXVp4+Rje8h3so
	 gqgAFDSfHASj1Ki9Ei/WZUejSTyfVXaG3NOmqWiePrDB6Ol6BAkIVW+rQjx61rZWmtz6W
	 Y9sETdWWn4YIERK1g2zZDvpMDE0deim5VgHyVEtyHHRK++ACijZ6sUeBzqCNgUzm7MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tAevl8Y+;
	arc=none smtp.remote-ip=209.85.160.49
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F000606A339
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F000606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tAevl8Y+
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-4a89b4a59a1so1777379fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377270; x=1793982070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=tAevl8Y+5DrICexIk5cjnG2iKmtgb0MM1HxmwMduH30mPH5r2hIJWjSoii84r/jQUI
         V1rGi991IrBGJt88WHX1H9a2vcOCv47S1x4oXEgqV77SSnh+BfG1ekpj22ViyvjukgkF
         kUK6T7NwJXkHWmNNpc+qc5cVRhYrutEdvSJe6HvsgC5/lllKwS9SvErtr5o5fqC+uR1v
         Fsrp7l/p8ba5DHF4UXOLtOPiM0alHjw4jDCm00yCC42zEFCRNnQpPjp5jSjcrflVqIU0
         ZOBWNy2B556H8GeJzGXgfPA61u8hWu5mcYKC16nvtn8XbtfgB8i5JZWcdE/2TGZgKnYm
         mJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377270; x=1793982070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLRD/nhwFUuDTpwXog0Q7Wc+ALgde2fM6C+mADcBMYM=;
        b=bF1gRlTRFDQ9p9ya7xACmQpWn9hmKrj8Q6ukMlPEoZNyZiL2oP+fEfay9rho/FbsDV
         H/R+cff/+PW9bOu2RUTDGczj31USb99fHOc5GkzzyWVfsHjgx1z7MFqWEiSTRf+O2G/0
         5M4FbsMOZtUUod//YnKKYJrmVywLr1dN8/SVUHR24nlA6wz8VuDdTIeS14UMuoWgKOkN
         lLS0zh670mPUS6R1jc2hBcmt9KsVixBUDZGVBi1f0ha/5nX0AyBN38xeH5MY6sq5LM6W
         Fckw+R2ksrfDq8H9FOJwrbuHqznocIwXgst9V0c31DnxUJdnh+HaqkXtk7LPLqv+tszS
         C0QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpB9zFc8R97pptRwdq1m8SOLpQ3DJKve6QjZPngv1x/Sfmv2vgVFfbyY7KDQXSYIjcK30Ym+bLdJq81Lk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMIZSiROnarutbWnImXxWt7HrigHvDxIwrukd06wngxr6Kdd3T
	4iZt4kkZwydla2o+7ukhzKiR/vPtnHpjKXnw4R5Kku04uYiSG3kOrb2G
X-Gm-Gg: AYBFou2hYSt1PNAz6RL2l1E29wLi4b47WKB5pygmQLFmMq7nZhk/cMCzqh/FJlmbZp7
	9FkFd89cTRXMakqVl8usmh58nkWYa2t5sUZ3bpmUmmT19P8k3q86VMoSJ6ydQFA+JlsmmXgcoAa
	fW1Ko71v73h7kOWs/5ECsn6/5/+MvVPVC2DsXHaDp4+mjj5fOJB0gyauBoruPpIvZ1j2wgJ2KlK
	OY6B63Nu75UyuKHU7oFxJUCEuK651LT92+QhF7SyaPUwZ2AmOqYg9DJYf33fbJX4H1J3+1w9WUF
	KDHIVR4J2cIwrlUrLg+5zLvbjntbI0etS65Y5jpWruiWGRHYZBJyDebcTap6Nw8eoHRxkidLF9o
	iCrT0/gvFTJf/Ys4lVAumb/hiOy5J7aSh7mFL0cdaG3JS7U2XiTrx0xjsCmmWGXpD5yDAVV48Z2
	GAKziaFvP2e+lPaiUWxKQEO1lVvqKsAAC0aV7+rXE3OXyL4bCChbjIdjLP0JCqM9xobWNqSpeHt
	FHDd8e5Qnl86GSS/aseEw31eZSZP4ED8AX9nTzPpX7rtSYpN94nZ0hutiu53xoewGiWc/XMFOjv
	CvvR1r0rfr8eWj+fjSbnyewlW2Rb7lelVJh9oACHg8cMWbw/8/EVrJHODKBnW7ZKG8gPTHyzv/2
	NTwfCRmbpUO8D8vi8ktxQUhccADM08XZWJOy87AKs9ZVUf/SQgf0+CidQprQASyU5DqTLy9R8Ty
	yQ/4FgtOeeYSr/vOy6
X-Received: by 2002:a05:6871:5224:b0:470:e96b:43e6 with SMTP id 586e51a60fabf-4a90775db3amr1316890fac.18.1793377269740;
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:09 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 3/6] mtd: rawnand: stm32_fmc2: retire data DMA before unmapping on errors
Date: Fri, 30 Oct 2026 16:20:38 +0000
Message-Id: <20261030162041.2998170-4-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
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
 drivers/mtd/nand/raw/stm32_fmc2_nand.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/stm32_fmc2_nand.c b/drivers/mtd/nand/raw/stm32_fmc2_nand.c
index c08d6b176..82d630106 100644
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
-- 
2.34.1

