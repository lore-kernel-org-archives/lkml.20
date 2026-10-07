Received: from mail.fris.de (mail.fris.de [116.203.77.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68CE64A5EA1
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 12:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.77.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791376812; cv=none; b=FY/Vlk55rxSjK7vTgW7try/Vo5HlvR3MtpRVDQWDxirBB7FoTBwWl+4aPycF/87pr5u7iKq8ic50codUKji6hoc4SU7LlU5QD6E65TpzfAaxuXKN6h6ahLKWxhxAv8nrfMBCjf0xu3ARiTn8be0Hy3Z1eN/nClLxaXYthplMAd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791376812; c=relaxed/simple;
	bh=m9+u0d9Xazs/df5fkpdv5Sw4ZwcWGpSF9sWm0loWmfc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=n0OakiAZjjIjxm7aYXYzq79MXtk50PrwUXcXQqnVFO2WDV2iQMjdOhXHBVrwOHsYUQvU2thQFwobxMCaBrg1qUPAt+Xh5+vIYWRQvhlt1dFC710lI7VYpZcuqbobpsp5y+B2vwMAPL5np+daR06huKekMlXvHEU4o7b4rkw3bP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de; spf=pass smtp.mailfrom=fris.de; dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b=Tvks570H; arc=none smtp.client-ip=116.203.77.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fris.de header.i=@fris.de header.b="Tvks570H"
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1791376208;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WHMsdtMcyk+8Q+f7Ua8bIT0rYNbiiZ8R6YG0j+dFBSk=;
	b=Tvks570HmrX/sOyHn2IezEuj4Eqk9Bce38YRQJWwnkCY11jA1euIfHUOCakHoMdeLgCXDW
	rHokY57wex0pRoY8qZ+8XZ5srNc7OLYFckVZK/65Nb+bRVjGOuVTHpH8G81wGHMv6T5sIP
	zkMVd4yT/j4LGDkBoEzO1LjW0+4/Q31Yzfu6Sq5rkcxj5gMPZCQzE4L9wJVw3DNXsuHdQZ
	w3hAKEQ4oan9lvWE75XiZSn+PjRSbVvj2WBsDznPmuMBC+bIA0AfP4/oaZ7KRFoE2wSd10
	pEDgOxyDOMVoce1HFQcyFW55kNOj8nKhH4Wh2vVogMqiUqR4eT/WQTPpqMS77A==
Date: Wed, 07 Oct 2026 14:29:56 +0200
Subject: [PATCH] mtd: spinand: Do not re-enable continuous reads vetoed
 during variant selection
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-spinand-cont-read-supported-v1-1-411facc04d99@kontron.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAyA4VcZORvoilPwVcRD16YaD2lJOhHG3
 t1uHr//8K9gpEwGt2EFpQ8bF+kYTwPEV5AnIadu8M5fRueuaJUlSMJYpKFSSGhLrUUb9ZZC9lN
 2cz5P0A9VKfP3uN8ff9syvym2fQnb9gMFs2NdfwAAAA==
X-Change-ID: 20261007-spinand-cont-read-supported-cdaf25f0bf45
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=4434;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=AGtlnWnwwn/wJDdwmj4K1iSV5CIBncvnLXETXmWNH1w=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIeuYtX994fLAgrWfdZXiHF07m3It1vyX/yb84WvowVIFF
 k2Ny+EdpSwMYlwMsmKKLFL8Fq9tzWJ95I9VR8HMYWUCGcLAxSkAE1nHxPCH61dd9uyJToYeqVNO
 T2RnSri1i7Hd7VeTxb0XBsfmJDquZPifZaOpwWBgaGTxhrnww7kjT11zjpeUuvxpFprP5Dtx3iU
 2AA==
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216

From: Frieder Schrempf <frieder.schrempf@kontron.de>

spinand_match_and_init() clears cont_read_possible when the fastest
continuous read variant is slower than the fastest read from cache
variant, or when no SSDR/ODTR continuous read variant is supported by
the controller. However, at that point cont_read_possible has not been
set yet, and spinand_cont_read_init(), which runs later during
spinand_init(), unconditionally sets it to true for any chip
implementing ->set_cont_read().

As a result, continuous reads end up being used while
op_templates->cont_read_cache is NULL. spinand_create_dirmap() then does
not provide a secondary template and spinand_read_from_cache_op() falls
back to the regular read from cache operation while the chip is in
continuous read mode. On Winbond chips, which do not expect the column
address in this mode, this misaligns the data returned.

Track the decision in a dedicated cont_read_unsupported flag and check it
in spinand_cont_read_init() before enabling continuous reads.

Fixes: 6eb7c193e751 ("mtd: spinand: Use secondary ops for continuous reads")
Assisted-by: LLM
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
I was using an LLM to check sync patches for U-Boot and the LLM reported
a bug in the upstream kernel code. To me it looks like this is indeed a
bug and the fix also looks correct to me, but I would like to mention, that
this is purely LLM-generated and theoretical. I didn't verify the bug and
the fix on actual hardware.

@Miquel: Do you have a hardware setup that would be affected by this? Do
you think there is a better fix?
---
 drivers/mtd/nand/spi/core.c | 9 +++++----
 include/linux/mtd/spinand.h | 5 +++++
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 95353777d7f7..e83341290ec3 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -995,7 +995,8 @@ static void spinand_cont_read_init(struct spinand_device *spinand)
 
 		if ((engine_type == NAND_ECC_ENGINE_TYPE_ON_DIE ||
 		     engine_type == NAND_ECC_ENGINE_TYPE_NONE) &&
-		    !spi_mem_controller_is_capable(ctlr, no_cs_assertion))
+		    !spi_mem_controller_is_capable(ctlr, no_cs_assertion) &&
+		    !spinand->cont_read_unsupported)
 			spinand->cont_read_possible = true;
 	}
 }
@@ -1700,11 +1701,11 @@ int spinand_match_and_init(struct spinand_device *spinand,
 				    (read_op->addr.dtr && !op->addr.dtr) ||
 				    read_op->data.buswidth > op->data.buswidth ||
 				    (read_op->data.dtr && !op->data.dtr))
-					spinand->cont_read_possible = false;
+					spinand->cont_read_unsupported = true;
 				else
 					spinand->ssdr_op_templates.cont_read_cache = op;
 			} else {
-				spinand->cont_read_possible = false;
+				spinand->cont_read_unsupported = true;
 			}
 		}
 
@@ -1736,7 +1737,7 @@ int spinand_match_and_init(struct spinand_device *spinand,
 			if (op)
 				spinand->odtr_op_templates.cont_read_cache = op;
 			else
-				spinand->cont_read_possible = false;
+				spinand->cont_read_unsupported = true;
 		}
 
 		return 0;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5f4c00ae72a7..2c90426c4000 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -772,6 +772,10 @@ struct spinand_mem_ops {
  *		suitable to use or not in general with this chip/configuration.
  *		A per-transfer check must of course be done to ensure it is
  *		actually relevant to enable this feature.
+ * @cont_read_unsupported: Set by the core during I/O variant selection when
+ *			   continuous reads cannot be used with the selected
+ *			   variants. Prevents @cont_read_possible from being
+ *			   set later on.
  * @set_cont_read: Enable/disable the continuous read feature
  * @priv: manufacturer private data
  * @fact_otp: SPI NAND factory OTP info.
@@ -810,6 +814,7 @@ struct spinand_device {
 	int (*configure_chip)(struct spinand_device *spinand,
 			      enum spinand_bus_interface iface);
 	bool cont_read_possible;
+	bool cont_read_unsupported;
 	int (*set_cont_read)(struct spinand_device *spinand,
 			     bool enable);
 	int (*set_randomizer)(struct spinand_device *spinand,

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261007-spinand-cont-read-supported-cdaf25f0bf45

Best regards,
--  
Frieder Schrempf <frieder.schrempf@kontron.de>

