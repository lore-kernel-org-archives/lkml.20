Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1053EAC80
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907230; cv=none; b=Uh7yoOPk0Wkw5fmf2UQRYwopcEBciZV5JZyXbTcU5KBdz/w4dK/OOwjywrMWGIO3SjnYuZb31JvO/7imP0ElEhBzK8mgVyNnkC12d+Vp0YL95DTLIOrXNOU32iyO/xjEGmbgYEflN/XeSCesRImV36O9494T9090OHHIcupGUSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907230; c=relaxed/simple;
	bh=Z9430CyQTEqrQUL4r0IT9Joy+Ab3XORYawSelEkd14s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AKT7+WKpbIRcegRuIdCBv6yck5zigN6vTZe19WH8IGBPRB9HiSE4IIQNWfglighC6xToShWUSq/NtWmwinLZ9xTcsxZDfNCYIgxYHZwIj12rzoBN4GnDE4qT7lUlG5NEl74tc0d0FJT7IBvcuLTQksC0VdaLxsp4egekHokcY60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szuO+sHK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szuO+sHK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49800c6a846so7509835e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787907223; x=1788512023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhmXMGSEBsCnlvTzh8T6ufA5k4c6HxTFoY+6zbiHuaU=;
        b=szuO+sHK77GM7muvXGmeoQt1BXvKVZGxvSBUgVZ+g5C/N8lpqJB/tPyhagKJysrDsh
         iROcn4Kz3Fz3cQRLR01XoR7bzQpIb9WFDQhfakRUEXJBgVYG4MJVFyxJGaUf8U7KLpwa
         dcV2bmQ9X9Kq0Va8txfyIAIkr2uasPLlhRhxTaMVmih+DG7DZ+8951kB9fACuFKp3zAR
         2mY7RFQ6iI6XfLGeWZsTBczMP5jRQoz06Mi07ywGCPsVmTiPXtEkooloUYa7NQlHawra
         BP7Pe5wDUoCrHDIGIQSvLoE5vn6sNlCK+R7qvtHn8MAL5lAcmLOg0p0Sk+0V5a5hDtBh
         4IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907223; x=1788512023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhmXMGSEBsCnlvTzh8T6ufA5k4c6HxTFoY+6zbiHuaU=;
        b=XDpDyqehNBHqCeX4We1dkEkGIU0agPMZcflyPSsPLkHJlJpB3uVogRVzTPrFB7qBW6
         g0usNpcVE69aW9lnUAE1rdn7UkyN5ilOcrVi4VY1fSkdtD8gtlH036HG/n+cvcFd57Ru
         1x/Fx+O9vB94uAa+gXgo4FuvguoOM6Egqo4ZsorGNE7AbboHsVSyq6jbMsRMrMs9VOfe
         m/9WClwFEXKhsVFDOfln43JhG0CqXRKB6Q47UbBD+R760veuuXkFsvi7mmIC2lqBSEsB
         KnSqwzOzWb+xSwy2g583wfyuaCrOvE6lBYafAAuGcvhLmqZk88Ym0QMbMfYleIRtr9s1
         hiGw==
X-Forwarded-Encrypted: i=1; AHgh+RpsCRO9+3M7ZQMqsY1O4CjYODyoWqa4MV6CL6t0gRVMPn84bYKj/Ei7XNykCWRTnIyhlFpqyquGrVMD9es=@vger.kernel.org
X-Gm-Message-State: AFuF++mCl87tEVhGFYnLxY7Ify2Y87aol+YuOd/k56V1qT7A4ec2KOt0
	PH1f8tS3ouX8ya15Xa1T1oeV5kc2HyKb5jRlr6e2wj+5Jv+cIQ5olEZN
X-Gm-Gg: AR+sD13S9u60qv/qzKORsfNbFoBRNBB0l3CUMAppgLXnvcQnjUHkxVumR1kigEqi/MM
	PF0JvRbajYZhPwMMlFTQt/8YAxJQRuTn/OvS0wDqLdLrsF4OcGbOwmut+UtgYlWn1ea97I2eLtN
	VlXiRlcnE01E7QPAvCwh919UM6DIjFVYFvSSvwUW2hbSHwOiORlJMopyDMp6Jn0YqvkepIVVHWj
	wBZKeu8ecFLv29WlWU1r8mBgm8cr3vouekF3JjWAqOk/TdiyYnnS2n4ni05pIAl5mMe4P+VK8e3
	WA4QMugEI60U04mvWzTf4GcHGB+3pCTN0r8e2ZpFfA0a35iM1J2d59zoS3rtQM/VkRp1CPHIxxn
	xU3Y0gnPyuFxD3LrgjwsLUHXwNCGdq2Eo8iSk1FhQ3MF+RErLHfk4fp/qr330Ycs2UlqMeJ+99t
	Bjlg1Uxi0gDzudlZVIYyY/2aNXeIwyv+jeKBnIaKPy7C6XAwzx2TSJWse9UcfGuAXS8A==
X-Received: by 2002:a05:600c:c0cf:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49b91c51e62mr67153615e9.14.1787907222695;
        Fri, 28 Aug 2026 01:53:42 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm43155175e9.4.2026.08.28.01.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:53:42 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Bill Pringlemeir <bpringlemeir@nbsps.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] mtd: rawnand: vf610_nfc: write the OOB bytes on page writes
Date: Fri, 28 Aug 2026 10:53:39 +0200
Message-ID: <20260828085340.3916239-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260828085340.3916239-1-mehmet.fide@gmail.com>
References: <20260828085340.3916239-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The ECC page write transfers writesize plus the spare area from the
controller SRAM, but only the data half of the SRAM buffer is filled:
the conversion to ->exec_op() dropped the vf610_nfc_write_buf() call
that used to copy chip->oob_poi, so whatever the previous transfer left
in the spare region of the buffer is programmed into the OOB of every
written page. User OOB data is silently lost and the free OOB bytes of
a freshly written page read back as leftovers of an earlier page.

Copy the spare bytes into the SRAM buffer before starting the program
operation. The copy is unconditional: the NAND core fills chip->oob_poi
with 0xff when the caller writes no OOB, and the ECC engine overwrites
the parity region on its way to the flash, so this also stops the
stale-buffer leak into the free bytes.

Fixes: 1cbe30b0ddc7 ("mtd: rawnand: vf610_nfc: make use of ->exec_op()")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index ffcf66f96c7f..f831780d6fff 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -633,6 +633,9 @@ static int vf610_nfc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	 */
 	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0), buf,
 			     mtd->writesize, false);
+	/* Fill the spare area too; oob_poi is 0xff when the caller writes no OOB */
+	vf610_nfc_wr_to_sram(nfc->regs + NFC_MAIN_AREA(0) + mtd->writesize,
+			     chip->oob_poi, vf610_nfc_spare_size(mtd), false);
 
 	code |= COMMAND_RB_HANDSHAKE;
 	cmd2 |= code << CMD_CODE_SHIFT;
-- 
2.54.0

