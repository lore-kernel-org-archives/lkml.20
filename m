Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991808;
	b=uGMp7aCXGm/RnUr/W48vJ2DUc+ysNwNU7Hifth4l6jvSepqOsmfRnunbOSjrazZATgY3
	 7uIhRm6Q2pnYUujY9n5gKrL66QdyqGS3Pso0SvulHDaw9I1ATcgSzN7oOcfNVsB7ZKKqJ
	 2HVmmtOyWqWLHIhKsiVxesgni48grnjgXSzi5nbE4Cseya1Cyk64v2OMO5G1jimIXs51l
	 x21fythvW9upqSJ3zgBNoqdS7ZFv8K07fvAEgxTdTmfI1pndK8jopqZ6m5DFuin+vR0Zf
	 4XOPnFQiOPdT5eAj3atnSoDyFQGwoTR2KVuC0iEqSDqIRt/6QuHm6Ji37iqcxgMUWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=KoIWhNtJmxZBVyIenQ/WCpX88ezjIaOb5DLauh7L2NM=;
	b=zT90Z1Q2uBGHPsTkJ95+tKrb97F8KNpuG/taENM+Z7LrXwIyldR4ZyutjWsMH/W/0P4s
	 8XeOSM2Zu+ryUNMyGihqteE5xly8g8Uu3FUeuT9lB8zI4dEjOJzjloPAOqx9mf+g/eI0a
	 zy52Qs2mMt8PDwp/eeouD4LE93k7ah1HOHiG/iR07b2wa4gOdMhy0zLsWU/uqS4sC4088
	 9UIu+iEEzdMoKEY95twMls4k53L8NfNiqUWJYFrc+kpRxr/YkWzn8twFt4O63ZMJVr9jt
	 LctGFRrTiQVFccJw+cRjId9VqCwciWmobNwqetY6BKEypymeeNkN0EjEMNdZvTJxt1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emcxuYq3;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97092606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97092606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=emcxuYq3
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4b467581b98so8130815e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793991806; x=1794596606; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KoIWhNtJmxZBVyIenQ/WCpX88ezjIaOb5DLauh7L2NM=;
        b=emcxuYq3c/RZcZ41az/ZF1XcFdIxhiuhFsnxtHxbY+j+qByR+FlmXP79e57+oBkz99
         TSGPlX7YXkZD+Q8I+61BD8vtNd5m2vaf00VOqViCcjheFUoKLvhrfinNOwWO8ej73L4g
         O7VcOjbcqth7e5CRkrEB3Hijgx93FXLoDMmNtHH8LYfCppnH7hp1ekn1O2Rw5F/YRzBu
         rV2dEs7yEht92ByaUkGUfRZT8OjE6rpy1t8WtAVJEsqfFMdHbK1aG8uSw+FTJjBN5FJu
         aV8LR9TicW4swgJZKdbU/cZiijxZwjvd3jdFoP+qh0+FB7n1JL8DMjKbJrgextb9TocW
         Y7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991806; x=1794596606;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KoIWhNtJmxZBVyIenQ/WCpX88ezjIaOb5DLauh7L2NM=;
        b=zRCZt0xai9xoWc2UxGOaTAV5oeiFsexI+4JrBJCfuiNptKqykkeBS2S74FLUjVx9mM
         PmXU6Q/Zz/6/rUXEjrW0DOqeWIWM9Q48eXN1xLj7L1exd8oWZN4qihFhhgaw1StAzI27
         asolkm8ngLHmRsS/2vB4blxKlbYdmSIyk+4k5uFMF88sZ7AzlUYRXMjUDamHV7njbbw6
         M3rz1aPmI0hGQOVbMcPFaoY3u8UDicbVzJ9HHuQMf1tHHE4XUbNMHTlPXDxdUR5aQRPq
         ax0fchd+BPja8slkUevD4+BC58GF/Zc1mpgp0DjLa1rz18oBumIaMwA2i7uYU+QvIiKk
         GnxA==
X-Forwarded-Encrypted: i=1; AKwUvByjj33eHU1wZBegP22CacGAMPDuZ906drYgJzgpm4tSfxjoCTmSaaFsMEBJC95GzJWdXiukSnB/BoaFXuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qmHavfvMS23BqlSUhByxIM2GGfRxzcRpuFmCSU3eOY7eMJLu4
	oJoab2l5IqU1ao/AyEIOhc8Ew77IxzELPTtujBgZGNGQ2U1cgfT9vRbVhzoXfw==
X-Gm-Gg: AYBFou3HSR51ZsXLesSst8EgdU4EFDYiC4ADjZJLTVfgrF1HHs62HSGDieHQzBvEHoK
	qD3eS5pUCK83Sko5iWys5qXBgNVfYBeN93Cs6XsrArywQCKXaMFwarzghtV5dJVx3o5jPHALKCx
	Vi34mXUktSO0UCh1Y2A0rJ+CwUC1acNwcdDMaFxEtBAgH/3Dm7GN19ntzYm4ifQ5pI+swtfSPo5
	1uCZqG1wVUA8bu0FRbpiZmDqZJSjAx9QNonT04zUDHdjOEKLobsDZ3LFxQ3zrRleQ1Pq1/wSOTc
	11+IwR7rglaB/CY/ztN6wInC+VGWIZR0ebCzvoSmlR1xTSvXyU2fENJrBL9aPA+Wc+S98csFbzS
	5E/J0svS8hZIDRZhCe6Tph3cUMFsVXzvLTvM6CQadFkZpFgZScGlHaQVMGAmYHUNustlGNOL/W/
	JrF+C9WDq0tGoZmYzutcUyyVZPDGjN75NDRSUZmhmZPZ5UlYZRjvTE0OrGxxuipe5XX9a4pzLPi
	tSzW2RuVyKt8oeNyTBFCo9iK+Zz0cVmZOb+JdUjYT3MCrEpWkmPwqLx87evfL8a3e+OtoupXej2
	mVbWR8wjJ8d1vkzBscyTHmfIXzZeBeGPxWCCr0YKLEpTU644m2018JhYv3Gt6lpELECKFuzg592
	CGbw=
X-Received: by 2002:a05:600c:529a:b0:4a1:d675:b031 with SMTP id 5b1f17b1804b1-4b6ddee3235mr55014455e9.6.1793991805836;
        Fri, 06 Nov 2026 11:03:25 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b7e327a6d8sm977005e9.9.2026.11.06.11.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:03:25 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 06 Nov 2026 20:01:54 +0100
Subject: [PATCH v2] spi: spi-qpic-snand: fix various errors in
 qcom_spi_config_single_cw_page_read()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-qpic-snand-fix-singlecw-readloc-v2-1-18de8226fe15@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0K6dgwtlYAr72FY1OkUJoEWWoMaw
 t2tnMDl+/l5bxOJIlMS12ITkVZOHHwGdSoEDsb3BGwzC1WqumyVgmVmhOSNt+D4DYl9PxK+IJK
 xY0BAjU370FXduovIljlS/h2Fe5d54PQM8XMEV/lb/3evEiRo6WxTaSNLR7d+MjyeMUyi2/f9C
 yW6ggfOAAAA
X-Change-ID: 20260922-qpic-snand-fix-singlecw-readloc-c4c89b4369f5
To: Mark Brown <broonie@kernel.org>, 
 Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

The qcom_spi_config_single_cw_page_read() function has several errors.

  * When the cw parameter equals with the last codeword, the function
    configures the read location last registers. However it completely
    misses configuring the regular read location registers for other
    codewords.

  * The 'use_ecc' parameter of the function is not handled in the code
    at all.

  * The last qcom_read_reg_dma() call which is supposed to read the
    NAND_FLASH_STATUS register does not use the NAND_BAM_NEXT_SGL flag.
    Due to this, the respective command element never sent to the hardware
    so it never executes the read of the NAND_FLASH_STATUS register.

After fixing these issues we would end up with an open coded
version of the qcom_spi_config_cw_read() function, so drop the
current code and call the existing function instead.

Fixes: 7304d1909080 ("spi: spi-qpic: add driver for QCOM SPI NAND flash Interface")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - Rebase on tip of spi/for-7.5
  - Improve the patch to also fix two concerns raised by Sashiko in the
	review of the previous version [1].
  - Rephrase subject and commit message according to the changes
  - Link: https://sashiko.dev/#/map/177852 # [1]
  - Link to v1: https://lore.kernel.org/r/20260922-qpic-snand-fix-singlecw-readloc-v1-1-41fd834a10fe@gmail.com
---
 drivers/spi/spi-qpic-snand.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index c90c2001ee8d..41685a286e38 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -588,19 +588,8 @@ static int qcom_spi_block_erase(struct qcom_nand_controller *snandc)
 static void qcom_spi_config_single_cw_page_read(struct qcom_nand_controller *snandc,
 						bool use_ecc, int cw)
 {
-	__le32 *reg = &snandc->regs->read_location0;
-	int num_cw = snandc->qspi->num_cw;
-
 	qcom_spi_config_page_read(snandc);
-
-	if (cw == (num_cw - 1)) {
-		reg = &snandc->regs->read_location_last0;
-		qcom_write_reg_dma(snandc, reg, NAND_READ_LOCATION_LAST_CW_0, 4, NAND_BAM_NEXT_SGL);
-	}
-	qcom_write_reg_dma(snandc, &snandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
-	qcom_write_reg_dma(snandc, &snandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
-
-	qcom_read_reg_dma(snandc, NAND_FLASH_STATUS, 1, 0);
+	qcom_spi_config_cw_read(snandc, use_ecc, cw);
 }
 
 static int qcom_spi_check_raw_flash_errors(struct qcom_nand_controller *snandc, int cw_cnt)

---
base-commit: 4a8faaea975be15cb636646c0d4c6ff1c2110baa
change-id: 20260922-qpic-snand-fix-singlecw-readloc-c4c89b4369f5

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

