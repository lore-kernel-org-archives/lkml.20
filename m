Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B014BD119
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790280286; cv=none; b=KhctJDoMEWlpjH2PXdICLuglJEORHFPtPw3IFVpdtZoMfId8JmEE1h/i3Tr23EOsLYzhGcPzt6ZMJdjf3M2ImSR5yNVX5fETAohWWynA4zn4EBmK8++JX6VVUQtNdgnHbn9gzAZ294DqM1RvC0vF9PPYaid9bE+B3g2XV0mRQCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790280286; c=relaxed/simple;
	bh=odBK4UCCD9BY1jsnyNGStrHSoP7q6qpovbp+9SsnObo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWZ80TcrSrlC58MWMTGyHUEWOj/tQc8AYWMdwn0WyDTg6S1jZjsoBXd4MuxG54HfAXaidXq3vLvAy3CmCB5s7zogqGuOtP3uInzE/aNjjAGRh7NI66BIcb7rS15ydNVw+Epym9g26nW0+LPgldSy9IY8zPFRav5gsyDgP+dkAd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxh+9FDD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxh+9FDD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-486e1a044c5so141974f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280282; x=1790885082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfE5jdaxQZ43i+myqwUtnFt8LRx/0Q0FXN2w5xiH2WY=;
        b=gxh+9FDDakNIWLzgImAtXhQIh3/qqfetCKsb5pem4tQyvmbGqfTJBz94X5PQ8/TkG3
         xVhkt18oWuQL5WfRZpKDehc69Ykgmmk7hZzksUFqt6Pnw7nNh6oNOkcHAok9FzBtTHgS
         OR8GbbIXA8E44xBnXCDQW34Ow33Ro0W1f1Vrm9xveCjTfB3n7N7jpLSg2mImJcjCgBlq
         ycTpNSj5wP0Ly8dFgpB9hfJMGygkNK0mjnJUwmF8iLCEFBiC3M3vJYUL58GO/cLNhjrw
         xNVXiR7hReBGpg/m3ZyGThv0YSL9eVpsWXhj24jsPN20W+PtacDypS0pQFfUpP5B4Tot
         jyhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280282; x=1790885082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MfE5jdaxQZ43i+myqwUtnFt8LRx/0Q0FXN2w5xiH2WY=;
        b=hblrGPkRFdLVh3JXSfIkFUq0X1njACfbryZEYyRse8u/8opjcr0TqCIADSAnYdfFPv
         NidUdebpIo9ljRvhRG8VG7zCogB/+k4kjSxOq6FOtiyN18sWnOzPsxTh/sbjp1RWAJJI
         zwPdsDm1zoELt5RAPFMSRY/omUyk/ZO5HNy4Q60BsAdUWYEDHLuldiGW91WN8VzNrg/0
         eDbrKTFQcD0SRwk0jZJ8fhQjz4YeFvYXRd57wuYxQO7XzluMVUTnuAL406POi3p8U7FI
         W+q8QHJXlCZyI8QMSJ8eFrAot8eDWimj0z3ZCm7alOZoDWRvE3/SiJnGKJTtaUjYYgRI
         8kGA==
X-Forwarded-Encrypted: i=1; AKwUvBx6tE4WnxtyNIqPZPrxG+fDdzCTGo33GmIV6F34xlI6sGfYryFz4suA1J+GHRqD1u9gG9ZQByi+J48IOgM=@vger.kernel.org
X-Gm-Message-State: AFuF++kvyDBmDhIXz/bFNLjMCfpuUAepsus2OUh144lQPlA4faKP6JFB
	tOiCHmAXGCRpe3JfMVYrpHK3L3OxrT1fkk6H3b4P3fc7EpRXZqMtjzRz
X-Gm-Gg: AYBFou2zYrFLTjr0xxhsZTmsvbo8c403cK/4xX4BzuPD/s2x4qt5vZbw60WfeJMOKRv
	QwOr/a1G9Mdz8fQOnVa0j3Hhi7FCJFbRlZ47dNbNlq6zRMQZ50Bh1UhTrzjuNxTIFte+nUpWL8t
	kWB2XaSltS+gSm7CrJWVtixUC8kPctZX1XgR2nV6x/z84a9/lOp3f6xAcAHYtw06G0PcOn0C+IT
	mDuuOPlq+qXu5TaDM4UMFMyR5RmZR2w8YYausEkv9sTkUKuVvhk0yprVeznVKKyZy5XMPlUXnZb
	Xsaan+U/WYk2V6w5+9p78TSGZqmjPZjHDXTQLpohg2tJO04xZ2dXvFZ4YNVeQoQ3ZoHInhjGsAz
	dXZzRJ4ynB8F46Obz5DKWVsPCkgd4hC/KrvwRDPBG991tClWll+hRrpbZlff/bzS69lBNBvjZHP
	tl/JZ66SMTXB12WSQPIm/T7fcm3W+2h+cseFbpX94nSLhZlQJ+BxW+pj03r0EqzPx76e1l7seNr
	53TGVuZ86YG2wRTivboukHKoFM=
X-Received: by 2002:a5d:5e03:0:b0:487:370:c511 with SMTP id ffacd0b85a97d-488717147e2mr6198660f8f.8.1790280281764;
        Thu, 24 Sep 2026 13:04:41 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:41 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:20 +0200
Subject: [PATCH 5/8] mtd: rawnand: qcom: make nandc_set_read_loc_first()
 more generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-qcom_nandc-share-more-code-v1-5-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The function gets a 'nand_chip' pointer as a parameter but it is
only used to extract a pointer to the nand controller's private
structure from that.

In order to make the function more generic, change the declaration
to get a 'qcom_nandc_controller' pointer directly, and update the
callers accordingly. While at it, also change the function name to
use a 'qpic_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 99fbf5458083..96a1a5a03de8 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -150,8 +150,8 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
 }
 
 /**
- * nandc_set_read_loc_first() - to set read location first register
- * @chip:		NAND Private Flash Chip Data
+ * qcom_nandc_set_read_loc_first() - to set read location first register
+ * @nandc:		NAND controller's private data
  * @reg_base:		location register base
  * @cw_offset:		code word offset
  * @read_size:		code word read length
@@ -159,11 +159,10 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
  *
  * This function will set location register value
  */
-static void nandc_set_read_loc_first(struct nand_chip *chip,
-				     int reg_base, u32 cw_offset,
-				     u32 read_size, u32 is_last_read_loc)
+static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
+					  int reg_base, u32 cw_offset,
+					  u32 read_size, u32 is_last_read_loc)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	__le32 locreg_val;
 	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
 		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
@@ -230,8 +229,9 @@ static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 		return nandc_set_read_loc_last(chip, reg_base, cw_offset,
 				read_size, is_last_read_loc);
 	else
-		return nandc_set_read_loc_first(chip, reg_base, cw_offset,
-				read_size, is_last_read_loc);
+		return qcom_nandc_set_read_loc_first(nandc, reg_base, cw_offset,
+						     read_size,
+						     is_last_read_loc);
 }
 
 /* helper to configure address register values */
@@ -1918,7 +1918,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	if (nandc->props->qpic_version2)
 		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
 	else
-		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
+		qcom_nandc_set_read_loc_first(nandc, reg_base, 0, len, 1);
 
 	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);

-- 
2.55.0

