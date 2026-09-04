Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3189E385D72
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526338; cv=none; b=Vp7tJyeOisqPHZGm7GkdjEc8ycYrwsOcSevOZqbg9+f+CJF2yppkUlFqRuHfDvKJSaAmrRWFHQD4uI9o3Yhvw+ZvGvlTjRjtbWH11Mf1TgEYtC77xIGMK0Ycqx3kvAKTuKHP76XYXMI50/dPYdsMbgOsI+YT9YJnB0+cGgJfcn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526338; c=relaxed/simple;
	bh=sokDvgJXj5WharIosRIU+sz3oSNd7WZxEo2k/p/DzCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PXyJMAE3G5lSxlr3G+kDEq2IW3BTpXaBwnFbd7rEUhjnUVld7/QYPJVF9GtzKv/Z9XZWLgNAWaB/suG/yXy/QYkvlQj80Sys/nsNjqEKosmFwiQL76R0EFJ9NW8Z3r9U4fbCnD0q+ZIp9rVujKRk3p7oQ9W4aZmAW5sTCbGbZIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by5T/PdC; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by5T/PdC"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso900036a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526336; x=1789131136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCG99e+5QxRQXSuO8zd59u52whzEDFO7RhFXyu9E9Gk=;
        b=by5T/PdC2QRwNxKeaeALtg7rJm77RSfCfOF0keajM2SQwJip8M9HXKxstfsfHDM4rB
         Qew3n5W6rZpFITnvjnoivcJDGdQbmHl5jcV5xgiWWLaBs0he4sXQ9xKMPD2R2j4TNivc
         A6Z0jPk4veiFv0ujoc4Fn46T5aAY3Spud16iu14BTcASlDO5FNTrfEOkurPLS0EcPL93
         gQJrjBiX+qY97yOM9QHo51AF2nj1bbOFvsIf5MdQfAYPufrnEzzOes6e3MaWq5Zwsi7s
         /hDbTqQOF4vhP0e5uV6iH+KLExRqC16bqjPOSN4a5bDHOoTroAiQLScJxiCBX4XuDGNo
         HRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526336; x=1789131136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yCG99e+5QxRQXSuO8zd59u52whzEDFO7RhFXyu9E9Gk=;
        b=puF1X8d6Se2OuoBFr5HaOhQ+HaVm54kbjgLK/m157XceNgO0s+Xyi7lZf4+1gFLl9z
         YeCr/8vM800Xde3u1gQSHPH86slPuAaQvbkLBTqNAX/co2QPW1aefQtF6TtDwy+ASrvj
         b6L4GMA1cXkfKq6K5SSTSJp1OgQRUn859YDmv5iEVKlYY87zhn92aQxpfg54bFpgnEUo
         JogwAnDeAvaVUxay1GixQjT+HE1NdI/V6wnsOBa4RUgwI2ENky35EzYPrvITnWlFyb1h
         25AOJI+u/SV5vWn/pUykFkz87ULZ82AzWXAw6LAY2HbxxgG36Kh4iFpWY0PFSAcEzw+N
         IijQ==
X-Gm-Message-State: AFuF++khN8uneVj5AYlQZLDsS5nqK1Upwj3oO6sbdt/sxd+a2sMc/bxO
	OH+xwVnDhypwlXRKgM0QgTQ5hvHDdhk/2Fb3UVMJ708hg55ujub771pq
X-Gm-Gg: AYBFou0yem+DDchtNroMIaPp10zCrj7wRQJ1tJnoHefDJodAk84MyRdpcr784+0lSxQ
	FyfKT0w5L0f68UeAdNUZsG8g2uEbavpdDs0OMemc9pAdLQYQ57rjEQgIIkJnnH8Q84NpO55X5Lr
	WN8/UfkRH2WAXAbGufAKPI7PeOLwtE2MfIcXz47RpExLlPLY6/bSDfT1A1E2t2qBNCWkRRZXtes
	h9WotNP13YCLiAjWweGYTXdciffkNKDixQlX5TIVRdHoUrWqOiKyXzfE3jL52skGIFFzMI3qHXM
	j43BRB4iY9JowRz4dXbluL4z6LXlmO7wYg/iQsf0ogdbce/BBmjWDto2xJOJXB/0+BXS4h3qsi4
	fNm09EKHvdqKXNCqaufVEswxAD6+2ipDiy8kNIi7eMvgYhXvWldiGZvJyE0qBdlhwobYW4ArTej
	hPvf1dtath+OUF7t4zG6eI3mtziVHEIZtzANFbBMrrx7ltx+pJtaZjoPa7u5pnsDk+qdUGPx6tX
	cks6dVYOfP2CXg=
X-Received: by 2002:a17:90b:1dc3:b0:398:d6f4:c61a with SMTP id 98e67ed59e1d1-39b26207ee4mr9145959a91.17.1788526335895;
        Fri, 04 Sep 2026 05:52:15 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm9816370eec.16.2026.09.04.05.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:52:15 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Han Xu <han.xu@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mtd: fix typos in comments
Date: Fri,  4 Sep 2026 18:22:03 +0530
Message-ID: <20260904125208.12099-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/mtd/devices/docg3.c                | 4 ++--
 drivers/mtd/nand/onenand/onenand_base.c    | 2 +-
 drivers/mtd/nand/raw/fsmc_nand.c           | 2 +-
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 2 +-
 drivers/mtd/nand/raw/mtk_nand.c            | 2 +-
 drivers/mtd/nand/raw/nand_base.c           | 2 +-
 drivers/mtd/nand/raw/nand_legacy.c         | 4 ++--
 drivers/mtd/spi-nor/otp.c                  | 2 +-
 include/linux/mtd/bbm.h                    | 2 +-
 include/linux/mtd/rawnand.h                | 2 +-
 include/linux/mtd/sh_flctl.h               | 4 ++--
 11 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 603fd0efc2ea..84566997d665 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1884,7 +1884,7 @@ static void doc_release_device(struct mtd_info *mtd)
 
 /**
  * docg3_resume - Awakens docg3 floor
- * @pdev: platfrom device
+ * @pdev: platform device
  *
  * Returns 0 (always successful)
  */
@@ -1963,7 +1963,7 @@ static int docg3_suspend(struct platform_device *pdev, pm_message_t state)
  * @pdev: platform device
  *
  * Probes for a G3 chip at the specified IO space in the platform data
- * ressources. The floor 0 must be available.
+ * resources. The floor 0 must be available.
  *
  * Returns 0 on success, -ENOMEM, -ENXIO on error
  */
diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index d08aeac86f9f..bca5a3bebd41 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -3279,7 +3279,7 @@ static void onenand_check_features(struct mtd_info *mtd)
 			 *
 			 * Now it has as following
 			 * KFM4G16Q4M has NOP 4 with version ID 0x0131
-			 * KFM4G16Q5M has NOP 1 with versoin ID 0x013e
+			 * KFM4G16Q5M has NOP 1 with version ID 0x013e
 			 */
 			if ((this->version_id & 0xf) == 0xe)
 				this->options |= ONENAND_HAS_NOP_1;
diff --git a/drivers/mtd/nand/raw/fsmc_nand.c b/drivers/mtd/nand/raw/fsmc_nand.c
index b13b2b0c3f30..08ef4425559c 100644
--- a/drivers/mtd/nand/raw/fsmc_nand.c
+++ b/drivers/mtd/nand/raw/fsmc_nand.c
@@ -461,7 +461,7 @@ static int fsmc_correct_ecc1(struct nand_chip *chip,
 				      chip->ecc.size, sm_order);
 }
 
-/* Count the number of 0's in buff upto a max of max_bits */
+/* Count the number of 0's in buff up to a max of max_bits */
 static int count_written_bits(u8 *buff, int size, int max_bits)
 {
 	int k, written_bits = 0;
diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..c61f3983a713 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2271,7 +2271,7 @@ static int nand_boot_init(struct gpmi_nand_data  *this)
 {
 	nand_boot_set_geometry(this);
 
-	/* This is ROM arch-specific initilization before the BBT scanning. */
+	/* This is ROM arch-specific initialization before the BBT scanning. */
 	if (GPMI_IS_MX23(this))
 		return mx23_boot_init(this);
 	return 0;
diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
index 21c7e1102746..c439b7814ebb 100644
--- a/drivers/mtd/nand/raw/mtk_nand.c
+++ b/drivers/mtd/nand/raw/mtk_nand.c
@@ -42,7 +42,7 @@
 #define		CON_BRD			BIT(8)  /* burst  read */
 #define		CON_BWR			BIT(9)	/* burst  write */
 #define		CON_SEC_SHIFT		(12)
-/* Timming control register */
+/* Timing control register */
 #define NFI_ACCCON		(0x0C)
 #define NFI_INTR_EN		(0x10)
 #define		INTR_AHB_DONE_EN	BIT(6)
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index a5b278ab9384..a225b10f8145 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -6205,7 +6205,7 @@ static int nand_scan_tail(struct nand_chip *chip)
 	/*
 	 * FIXME: some NAND manufacturer drivers expect the first die to be
 	 * selected when manufacturer->init() is called. They should be fixed
-	 * to explictly select the relevant die when interacting with the NAND
+	 * to explicitly select the relevant die when interacting with the NAND
 	 * chip.
 	 */
 	nand_select_target(chip, 0);
diff --git a/drivers/mtd/nand/raw/nand_legacy.c b/drivers/mtd/nand/raw/nand_legacy.c
index 97700f80d5b8..94d5c7723c5a 100644
--- a/drivers/mtd/nand/raw/nand_legacy.c
+++ b/drivers/mtd/nand/raw/nand_legacy.c
@@ -319,7 +319,7 @@ static void nand_command(struct nand_chip *chip, unsigned int command,
 				      NAND_CTRL_CLE | NAND_CTRL_CHANGE);
 		chip->legacy.cmd_ctrl(chip, NAND_CMD_NONE,
 				      NAND_NCE | NAND_CTRL_CHANGE);
-		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
+		/* EZ-NAND can take up to 250ms as per ONFi v4.0 */
 		nand_wait_status_ready(chip, 250);
 		return;
 
@@ -459,7 +459,7 @@ static void nand_command_lp(struct nand_chip *chip, unsigned int command,
 				      NAND_NCE | NAND_CLE | NAND_CTRL_CHANGE);
 		chip->legacy.cmd_ctrl(chip, NAND_CMD_NONE,
 				      NAND_NCE | NAND_CTRL_CHANGE);
-		/* EZ-NAND can take upto 250ms as per ONFi v4.0 */
+		/* EZ-NAND can take up to 250ms as per ONFi v4.0 */
 		nand_wait_status_ready(chip, 250);
 		return;
 
diff --git a/drivers/mtd/spi-nor/otp.c b/drivers/mtd/spi-nor/otp.c
index 7d0b145d78d8..61c55227e15d 100644
--- a/drivers/mtd/spi-nor/otp.c
+++ b/drivers/mtd/spi-nor/otp.c
@@ -25,7 +25,7 @@
  * Read a security register by using the SPINOR_OP_RSECR commands.
  *
  * In Winbond/GigaDevice datasheets the term "security register" stands for
- * an one-time-programmable memory area, consisting of multiple bytes (usually
+ * a one-time-programmable memory area, consisting of multiple bytes (usually
  * 256). Thus one "security register" maps to one OTP region.
  *
  * This method is used on GigaDevice and Winbond flashes.
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index d890805f5494..67929fdf2dff 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -75,7 +75,7 @@ struct nand_bbt_descr {
  * with NAND_BBT_CREATE.
  */
 #define NAND_BBT_CREATE_EMPTY	0x00000400
-/* Write bbt if neccecary */
+/* Write bbt if necessary */
 #define NAND_BBT_WRITE		0x00002000
 /* Read and write back block contents when writing bbt */
 #define NAND_BBT_SAVECONTENT	0x00004000
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5c70e7bd3ed5..43fefff02025 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1592,7 +1592,7 @@ void nand_wait_ready(struct nand_chip *chip);
 
 /*
  * Free resources held by the NAND device, must be called on error after a
- * sucessful nand_scan().
+ * successful nand_scan().
  */
 void nand_cleanup(struct nand_chip *chip);
 
diff --git a/include/linux/mtd/sh_flctl.h b/include/linux/mtd/sh_flctl.h
index 78fc2d4218c8..15adf2474fa0 100644
--- a/include/linux/mtd/sh_flctl.h
+++ b/include/linux/mtd/sh_flctl.h
@@ -60,8 +60,8 @@
  * Some hardware uses bits called PULSEx instead of FCKSEL_E and QTSEL_E
  * to control the clock divider used between the High-Speed Peripheral Clock
  * and the FLCTL internal clock. If so, use CLK_8_BIT_xxx for connecting 8 bit
- * and CLK_16_BIT_xxx for connecting 16 bit bus bandwith NAND chips. For the 16
- * bit version the divider is seperate for the pulse width of high and low
+ * and CLK_16_BIT_xxx for connecting 16 bit bus bandwidth NAND chips. For the 16
+ * bit version the divider is separate for the pulse width of high and low
  * signals.
  */
 #define PULSE3	(0x1 << 27)
-- 
2.48.1

