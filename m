Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177748;
	b=zIGmbxi1RPFbj20aqYDc7Yto31mrrSyimr7f4XsjEsEJUJ1Z6r2hARyU97z9kmaE9d9R
	 aLuBXdCpGtwenLOoafQcgLVnp3sj3kVr5id++Va3pgwZWA3C3KU763tuPZucVMtX9bfD5
	 gQb7IREEDbPq33pYR9UovcqXKCPwHE0jzo8br+kMgRijY85d2nsStdtsTJzv5AVjDwY7J
	 TEjT2DhWCZdlPUAiZ+VYTgFK4MBGZioKzU540rPYRg+nwUsNCYFih8R/OICXIFP4591ee
	 CGXHVwxkrjYZ9XynawWWD6Z1nmbHAmDiNK4FW3V3eF1RmVkIggomeII7QPWqxmzQPPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qzHeLZPhDy5sgZl2YeSaSSmwqxhMbI/xK+PxVybiOB4=;
	b=xQAHVMMjalZaQChZcHu5D5i8sqR9w7/ELvXshyBFvmt+jL1zcrsb8CjugDvZe/MqUYi+
	 QcA9NMkQdqK4C35eDt5dy2xkE5R+hF1a0FbnjK3pR7zYfW/QMnAWTZC2bUXEt6pKhM94h
	 +HqNhcpZN8Th1CBHOsIBf2McAm99ohwodF3Op3+Qq8HaM2chESi6sNzrRkk920mAek4Ft
	 VSsBPg9Y+vjZci/029Kfu3vc1Fbyw0LmplZPtLi0q0DJWZ0aZ9Yy4d6ikmmumWL7eVilh
	 rEuDOQ4ZPhVEGVDYEItWvRvmjaAQCfLGUsX5pvNDzSL/poYwuWtqf9FmNQZIODj1PXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hlj0fTXC;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9FF606D828
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C9FF606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hlj0fTXC
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4b28d9537bcso210396b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177746; x=1794782546; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qzHeLZPhDy5sgZl2YeSaSSmwqxhMbI/xK+PxVybiOB4=;
        b=Hlj0fTXCxV8yCmwJu4LjUB0Vf44qEZjv9f6NNP1IhwPrABj9WbrtEtvAgukZfSHY+w
         f5HN7SmaIRAD0bhEdfqrkxdhUi19dq8j684KV/LQfC7iix3CTY6KWixYQIGNXh8HEHRe
         j4P0KG8khsAveciJJb04vvPBlrdLxW+9kTQngCnNjb5Xqn70S9WMgb+q1zGlERTiRZ2+
         ua4AqZh1SCdJuFn2MupfyXvdW07UlJv8gm+5KyxXYUned/btGRK/S6xof4qsbIgsKuz0
         D/bjSfK4bYjoJ5kx7kdLI9NBtsWsvxeuCI10TBcklcce+M0iztRb1v9zbD8duP1JdPc9
         CelA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177746; x=1794782546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzHeLZPhDy5sgZl2YeSaSSmwqxhMbI/xK+PxVybiOB4=;
        b=XX2T3Pc/V9z+8DZMaGQ2WzE2L3p6spNx2N5K2Qqi3SlG+vBJqGalcCxHd+RW8tdJPw
         Who2jSsPeRn/f1/3J9mdqVAi2lF+4HX/eLBGDd0OYsM4gtc+sePcBL8EonwoUU1eXaub
         ZU2gxJ1p0ebp7DWogzqEieTPUiFlaAo/CFYj7akuPlqzYSNtZsuxmGUIYokM+8frAd4H
         JV3Asg7FkRm/Ge48cMc8gEfKpoAFuaHku+hsdK7ZszJNwgXTq0ZA04irmJW+bXN3vpNO
         0AUJgvmLVLs7zg4toA4wcs4Nn0qRjBGY1qACaWJ2RyCmB0sQf3M2j5bNAoVcOpxEBZin
         AH9Q==
X-Forwarded-Encrypted: i=1; AL+hErEWNooVAt8Y8QsveQAiY2oX918nPtIeS3RsSbJlGsKXSkjzZ8LnvpjxV4rBvQIl07N+0eJMN1u/LxkIjJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BfjC9j6YN3D/5iPX/GJw25p7MXxdchgcixaZzjxK39tvItuVV
	PJap3N5FGAva3fjep0TCgemol8NhHODYz6WZEhT8IAxdv4UXbdVufYrZ
X-Gm-Gg: AYBFou2iAiH8twT2JTNiimuIzZyAPzistSjmm/XkV74usEU7WaMuGmaz5gP+TYOLNhY
	8BQ6jmoZH6mf86dqfHr+77wIll/hXJMMtnmi0qr/yuxtVWZl8QOYCARCzxE4/CtfdI2i8ol1mbu
	vq5JPUaImD7PU+1cJh6xh4ASvjcZKTVZqTjWHUh++U+v7nTLDX8pGBqzr7HfsSaqvdeXDcSGN5C
	OePakJS+vtbNKAj1d0HnV4D64LbYQQ9RiGSBDyGJEseQ430DBGH1Iur/g0maoXSt+K6xFpSZ2aI
	eL/ue24C1eKrb3Sw5pw+CgKco9jZGkg5kFF3U8IQupfWYa20NKHQPWQFbxZeu7yafNlXks3/p5T
	7fDlIPR9qe68kNBZIecMqOGylW9NC0kp4H7HLxGeGTqb7PAs9JFPV2KW+7uAqU2m++bjRkW2okv
	96OBPd4xN0/5LWMzcyZBRc3d92w8VNQ7mwXIu/lJdoA0mhIGVGWSDCxu5vIKRzbQG7ZNr+YN+dK
	w7kvN0mK02WpTCc0Xz1nhVjCWyVQERv6/gT5IV92MGk2oeBQEakYKCqURT34vpBKMwfcLk4IONV
	WJB+x28mX17bFDjSk2iIIOg38bgQX/5CDpr3TpBLFsZezSoU1vS3SySe++/FeJzg9W1RXnPt7eK
	qpnhrt999pFQQh1e5QAg26TovMEfzPxN6LUfCzz8vQAqkr0iWRT6A9YY3di44Gwnu1XxFzueNpw
	wMjgVijodGTL4jdZDzAfmPEXwdLxCP1Leii/g34knTHJZmKSNr02Ka
X-Received: by 2002:a05:6808:181d:b0:53f:b2f9:1220 with SMTP id 5614622812f47-568144741edmr1029934b6e.5.1794177746301;
        Sun, 08 Nov 2026 14:42:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:11 -0700
Subject: [PATCH v2 4/4] mtd: rawnand: qcom: scan all chips before
 registering MTD devices
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
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-4-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

Each NAND child is registered before the next child is scanned. Once a
chip is published, its MTD operations can run concurrently with the next
nand_scan(), which does not hold the controller lock. Both paths use
controller-wide command buffers, and attaching another chip can replace
the BAM transaction underneath an active transfer.

Initialize and scan every child before registering any MTD devices. Track
which chips have been registered so probe failure unregisters only those
devices while cleaning up every successfully scanned chip.

Fixes: 6a3cec64f18c ("mtd: rawnand: qcom: convert driver to nand_scan()")
Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/r/sashiko-outbox-204074@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 14bb7f3d6c36..978fa84f051d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -89,6 +89,7 @@ struct qcom_op {
  * @use_ecc:			request the controller to use ECC for the
  *				upcoming read/write
  * @bch_enabled:		flag to tell whether BCH ECC mode is used
+ * @registered:		whether the MTD device has been registered
  */
 struct qcom_nand_host {
 	struct qcom_nand_boot_partition *boot_partitions;
@@ -118,6 +119,7 @@ struct qcom_nand_host {
 	bool codeword_fixup;
 	bool use_ecc;
 	bool bch_enabled;
+	bool registered;
 };
 
 static struct qcom_nand_host *to_qcom_nand_host(struct nand_chip *chip)
@@ -2008,9 +2010,9 @@ static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nan
 	return 0;
 }
 
-static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
-					    struct qcom_nand_host *host,
-					    struct device_node *dn)
+static int qcom_nand_host_init(struct qcom_nand_controller *nandc,
+			       struct qcom_nand_host *host,
+			       struct device_node *dn)
 {
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
@@ -2059,10 +2061,6 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 			goto err;
 	}
 
-	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
-	if (ret)
-		goto err;
-
 	return 0;
 
 err:
@@ -2082,7 +2080,7 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		if (!host)
 			return -ENOMEM;
 
-		ret = qcom_nand_host_init_and_register(nandc, host, child);
+		ret = qcom_nand_host_init(nandc, host, child);
 		if (ret) {
 			devm_kfree(dev, host);
 			return ret;
@@ -2091,6 +2089,14 @@ static int qcom_probe_nand_devices(struct qcom_nand_controller *nandc)
 		list_add_tail(&host->node, &nandc->host_list);
 	}
 
+	list_for_each_entry(host, &nandc->host_list, node) {
+		ret = mtd_device_parse_register(nand_to_mtd(&host->chip),
+						probes, NULL, NULL, 0);
+		if (ret)
+			return ret;
+		host->registered = true;
+	}
+
 	return ret;
 }
 
@@ -2100,8 +2106,10 @@ static void qcom_nandc_cleanup_chips(struct qcom_nand_controller *nandc)
 	int ret;
 
 	list_for_each_entry_safe(host, tmp, &nandc->host_list, node) {
-		ret = mtd_device_unregister(nand_to_mtd(&host->chip));
-		WARN_ON(ret);
+		if (host->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(&host->chip));
+			WARN_ON(ret);
+		}
 		nand_cleanup(&host->chip);
 		list_del(&host->node);
 	}

-- 
2.53.0

