Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDE54CE66D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790363195; cv=none; b=umfjkH1fGIT4xcCX4Zd3EsX0trXrjbc6jnNpzGPhEMD+ZJwabNHlBjQf8v6CrJQVRsvmmV8VjlOn4lSpTIBS95mxl7jSEC8uQlL4Sch3894fksqCCKO15bSPZllR1+khbyvKZkTEy9EGafDZ+SgphYIcAlE1xT34Vgw9ZEimXOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790363195; c=relaxed/simple;
	bh=M9XAQoKHNT++eljy95R+Wekl96QexZqHjSEdesdLFFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kkpZyxM7R0P3eAgE2LmxdYDLaeuMfFax9TxB8vVIl7v7xl4o+iBcvUuc/u6+TUKxLAq2WnZGGweL5jVnyNpUnDSkrngUJLtW1DUmYV/MIL2DCCD6vGhwp7tIqPxD3vCuWlb9Ul/PuA8p1sMyHEAXXrdADb6J8O/31HcLmXBmwio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlQAv+Wo; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlQAv+Wo"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so13681945e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363192; x=1790967992; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RylOsdWttuJv0zUKYqfOnUuW8XaXL0HCgCqarZWQL6Y=;
        b=hlQAv+WoBr3NJZYm5wPBLUz5f/5Toun7bJiBQxDuchxJ1vnnNzmPt8qOLRzbhMLSwa
         SytR0YHGwEVbBpqnvDr4kiVzempH3nXmWeyMvH5Jtko8NjcUHkMYg32hpNDYTBgqztXn
         xByVoiiyKUc2NeGqfMyrFK07udHm2WE60V2PCXlFH/HgQPosBhF+hWhqpwfUvX54p2kT
         IJ4y2A8eyHKBtUZopVLvWw+Ux/vP9IoxjxwZmQL1AUhGhV/ObWMepSPs4hb71FP9Nnsf
         4Exl97/DGuBxYEOifL86+BMDwgkHMia0xwMoMVlDWfHvuxqLXblHfBcNpj82s9EjRvM2
         cgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363192; x=1790967992;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RylOsdWttuJv0zUKYqfOnUuW8XaXL0HCgCqarZWQL6Y=;
        b=1CEU3vH1sGUOiGXhjzTb5dXrBsqmS9tiXJn+Fmy1aIbUOtGTl7A8D+MzqW8mTKVgIJ
         gCMB7OuzeZ2wdu794xp0naZkgpsesC8m67FKQUkYptfda1nigSMXC+bnXl1ge5TxZ2r3
         sLo/GQONKgx1W9lZwYqDvtMvP6lFhloN0LoNsITHaWOHs8eQFkj6sM0/UuIlPnaw2b8J
         o3WqAb+RAYXk23yy3gaoJNtYJ4BGr5b6TdQY95a1wgW+1p7eShljon4RprZrI99YZQZP
         X2M6JcxB61HLsTQw3lLseyUxo6vanjQbul1RKUQh0zcyE06jNDeGaVYX5zCvykyRJ2qa
         1oZw==
X-Forwarded-Encrypted: i=1; AKwUvBw8l1GJGvnrPvq3J3gH9u1rTKbMOj6ds+Waowpy3WjtFEhed5QKdHSeGVSVv4Er4oFwXZQ+h1x0QAtBWYU=@vger.kernel.org
X-Gm-Message-State: AFuF++k+dLLjDJ+xR+JdRUJjfEp+5lZSWic8jtUWLfVjbkpGZlfL8LA7
	v5qiLTS4g8hYUfmwYuDg82LZ718XesEVDM1wHn8l9oY/qtOFc8VuwJvf
X-Gm-Gg: AYBFou22UiwtCD6jjx68CKsqZRUoJMuYZnlxd3xnterxnYHArtae2erHtrw3N6vw9xk
	FdP/H9ZroayRbBuX0ASaFhz9+q1IA1u0MzA3nI60aqgNvI0vjLDSdACTPs68muunHlbOUWgZ7dm
	j3BOVungeZ97pDIY7+yl/HchSsylA/l1/cNsNEbqjNE52hhXgZZAx7t5El5Q56PVbANfoJjz3zq
	ERedLwHLBduiP/UHcsvmvHHD7kI3ftd3K31iLUSWTZiwsdHSKGEJcsToC4oSYSXUT2H5GQJl4wn
	vJLuVf1MjYYRNUtwCH8MILMDSIwhEfZZz1T8HtZU1VF2xrQ+XLul1Q534jUrNYTTpEAAV39629i
	C2510CSHdBxR4B29y2q9Xqnc/nOoB7zYJnYb8bEwW/+I34JFWcvtuAo8mzRUlcTHGn9h9FV0xrb
	+mkTCmEHuDlVmEpZs04TWZJmX7FKKfK8LCAevPH5B4WfpYo+lcwbl1CwA93Fhb43hLGEtlUgSmS
	LJwMtYaJrUCpQzpu5m8y8OUqaKYNhw69B1CBg==
X-Received: by 2002:a05:600c:4f12:b0:49f:e194:a062 with SMTP id 5b1f17b1804b1-49fe66fc6b7mr139981575e9.32.1790363191708;
        Fri, 25 Sep 2026 12:06:31 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:31 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:14 +0200
Subject: [PATCH v2 5/8] mtd: rawnand: qcom: make nandc_set_read_loc_first()
 more generic
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-qcom_nandc-share-more-code-v2-5-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
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
use a 'qcom_nandc' prefix.

No functional changes intended. This is in preparation of moving
the function into the 'qpic_common' code to allow reusing it from
the 'spi-qpic-snand' driver.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Replace 'qpic_nandc' to 'qcom_nandc' in the commit message to match
    the actual code (spotted by sashiko-bot)
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

