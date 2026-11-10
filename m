Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296711;
	b=o6UcDGU3aYgX/pCLOdQ3f+ZXpKP8HZiXmEKP0cWaSjfmuYBOh4KsR0QirfPQOPuXjoQ6
	 ttGd/MwqObNfnMXcHuBF+5JQdubCDVXMLon1PagMLP3qysYFN2FqbeuhLjKJwfNG/4+ab
	 IR2jp2SFDu0IwIpSoNdTGuS3oeDH3lcgpBJpKmpgi6ETA4Kteo2i0cYjWvf7dgT9Pt2Of
	 tLuSkCmecqfXpg02lV4cit/L1rsPGZPjdWo1YZQZWb1ovE7uz+IdCq4zh8rxa5o916zEG
	 6Y9/8dScHIQL394P5AAgBz2KbjVcUwGprXSOtgb4POyV8AkNo/KNRDOI+eJlvL9q1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
	b=K8ruQUeZMFJQ+8630p8L1MBUHlFbhMC/Fm1QazsyvyoyRiGFv37aOtTmRWao6PSZu5PT
	 1tTadj1epMlzXtk1S746cFsHdc17F259l46mA7STBqvz31tf0ofS7iBy9pnY5NKpabg7y
	 5pjVwiIJrdwFQGRWvcppDkXomlq1SWSUF7R+9Ivn4BMEpA1OjQAfpgC4VzbAJJzfyCv/C
	 TT8+NC3sO3V2Jkh1LxjpSKpIQ36HBq60VU27AvLRqkoOqFsEAnNRtcO3o+Z/p+0WhfXgo
	 /sjYIpCfoO7A8BoiJRhEqMtH4mRwX5osu0AGc2sFBaACWF9P4Wjo4c4r0uvZYzYTmUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+LDMvzT;
	arc=none smtp.remote-ip=209.85.160.43
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE9360711EC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE9360711EC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e+LDMvzT
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4ada9579947so1005404fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296710; x=1794901510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
        b=e+LDMvzTPy5VFI/0JR4mKFmHltA4yaje2Ss6Y7jfrIEFGmhWuhMQ+yTQg5JirtisPZ
         CFFxJmn7kTxpWhyqrnvdIW/jLE3Bbu9EhLYjzBwqaQ+E0X99ZG/OiQPUzxto3gPdfANo
         mOIw1pLeTd0Wxf59ploaqoAUE5jQUNmgIY0HvSj2eRXk9wqjL0wpcoj5hT35xuYYKKlt
         p4sqxpEt6CzwN1xukvA92kf0kq9nGucmtyCSIpHf78b/hzYHQtDq2Wo1cyfuGeuy3ntJ
         poPW5SB4czduiVV8I4Vds5ylGH3vaw1TKuil12+Ym5DmK7nFseKA9BLtNqnCO3ieqRWZ
         W99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296710; x=1794901510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ORfgQ1dv5y4O+I8/uTd8VN7JdvvEiftmkqcbIimalQM=;
        b=bDoZj7uDZCbu+vDmSuurJs0BCWOHX9o8L3JLRgBbGA4Yx/XzKUbHctBNko4hrC3CnQ
         7HbtNsTIGcqpGwSUDRVgOIBiQlQXneAFANngvkwUtj1yAXr5EB9goXw3TGRH2VHsPd1I
         dp0d3tqf9yFzodLRccHhuIkgcne4wiS/i6EfElD7nsZAEbZPI1VQ9HYpixWa9Wm+a7ks
         bQnKWB0cuRz/49jOcX1g1J8cRvBoyrgsZ//odPuZi6i04RDMg2urEur3wbT5geZjat92
         KK6Z8vsHIbO6r00cmHuMf+ZhUdVXxQX8HR9z603YQHouyhX1bKDGGVzMo2Hem9FvVPDm
         x4cA==
X-Forwarded-Encrypted: i=1; AL+hErG8LpNc6kavcXiTPChRppnWbR4tPwzxnTi9I+27qpR/48wG6GGwPe2i9rkMSC42p4Ahh7+ECZvOqlovuEo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ElRpfs2S4wR5iRBH8CStaOPsFuFfrdWSQKxJkvUoL4VN/qMZe
	RSqh2OvWKio95CqZCfmtnrH/2JggnmlemGSYw/YcIYnJOjibsrTg+s/TMozXVqg5
X-Gm-Gg: AYBFou3y2BJ3rS2axb+eNCJLQZ+cUp5me82C+mcg0bAaef9xua52l1I8m8LjRmWt02R
	SUKrxhlzSK8nDmN4fp8UEUY5UVbK0NFh1Gxijk8gUXe5TCGjVlVaUkhi+kxXIGadCx9OJUSIALd
	LCRVVqYRc3Tc/JpNFZmiuUrFOWsYHDNaaDU0MnYuXPomvTz8byi3hmgsysTIKTNg1HQSSc93wyT
	ZcLS1hYCjIwduQQZMdaNYTC8++qTq6MQa+ROsEOMrdhfr+zXOEMRf1xdb0/sMwMWTw3I1Bomj+W
	oTSJZshu9RYUAcLCxUCJJ0fw0IIqlptBzVnmt0Y8Qm+P4GPBMtOMRsDCQ9YZEI0X0gBKoHa2+7P
	8JDWk9aUcz5CyPttpGHe0GvdF5xSEHbTDZPEEdVh7cy9v0k+13ZFQZGzSTH5DZc1YMWb68dGKPB
	/xT5699Bqiblw+uXykb33V2CUR67+togeBo0iKMjq9vm3cxMmiAzZG7fOfOBZlkn2CW8ng7z2LS
	dSrQ26l05z9LdDWpRLRB6RLIq0vAwoxMvz2dkMyG6Jin+ZHAC1uGV1oBoKHBEL66Nt9n/G7n86v
	zhiZTWysObnMWVES5pQrxMRirTTfTZqFeJ0NrSFZkC3kCfOvJ8XtHJR593XcEqFJ10YGUpsydP7
	Ei+SKNp5dhnjLPH3wayI6pUug9cCybhVqYxmRbZm3FSiCJ95w7ZZ3fCEaE8qurKjgLjyuBeIkt1
	GiMUW1qvsizddc09HMUuUiC61ypoqYunvm0WpLi7L2s9XGn8sLNBI=
X-Received: by 2002:a05:6808:13d5:b0:4f7:8bdd:b74 with SMTP id 5614622812f47-5683cd1aeddmr1579138b6e.51.1794296710142;
        Mon, 09 Nov 2026 23:45:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:47 -0700
Subject: [PATCH v2 44/58] mtd: rawnand: davinci: retain chip state across
 removal
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-44-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Disconnect the chip before releasing the shared four-bit ECC engine.
Retain the chip and controller while MTD references remain, with final
NAND cleanup independent of the device-managed hardware resources.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/davinci_nand.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/davinci_nand.c b/drivers/mtd/nand/raw/davinci_nand.c
index 3986553881d0..2231e6a45114 100644
--- a/drivers/mtd/nand/raw/davinci_nand.c
+++ b/drivers/mtd/nand/raw/davinci_nand.c
@@ -895,6 +895,11 @@ static const struct nand_controller_ops davinci_nand_controller_ops = {
 	.setup_interface = davinci_nand_setup_interface,
 };
 
+static void nand_davinci_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct davinci_nand_info, controller));
+}
+
 static int nand_davinci_probe(struct platform_device *pdev)
 {
 	struct davinci_nand_pdata	*pdata;
@@ -919,9 +924,12 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	if (pdata->core_chipsel > 3)
 		return -ENODEV;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, nand_davinci_release);
+	if (ret)
+		return ret;
 
 	platform_set_drvdata(pdev, info);
 
@@ -986,7 +994,6 @@ static int nand_davinci_probe(struct platform_device *pdev)
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	nand_controller_init(&info->controller);
 	info->controller.ops = &davinci_nand_controller_ops;
 	info->chip.controller = &info->controller;
 	ret = nand_scan(&info->chip, pdata->mask_chipsel ? 2 : 1);
@@ -995,12 +1002,18 @@ static int nand_davinci_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = nand_set_release(&info->chip, NULL);
+	if (ret)
+		goto err_cleanup_nand;
 	if (pdata->parts)
 		ret = mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
 		ret = mtd_device_register(mtd, NULL, 0);
-	if (ret < 0)
-		goto err_cleanup_nand;
+	if (ret < 0) {
+		nand_disconnect(&info->chip);
+		mtd_put_master(mtd);
+		return ret;
+	}
 
 	val = davinci_nand_readl(info, NRCSR_OFFSET);
 	dev_info(&pdev->dev, "controller rev. %d.%d\n",
@@ -1020,14 +1033,16 @@ static void nand_davinci_remove(struct platform_device *pdev)
 	struct nand_chip *chip = &info->chip;
 	int ret;
 
+	ret = mtd_device_unregister(nand_to_mtd(chip));
+	WARN_ON(ret);
+	nand_disconnect(chip);
+
 	spin_lock_irq(&davinci_nand_lock);
 	if (chip->ecc.placement == NAND_ECC_PLACEMENT_INTERLEAVED)
 		ecc4_busy = false;
 	spin_unlock_irq(&davinci_nand_lock);
 
-	ret = mtd_device_unregister(nand_to_mtd(chip));
-	WARN_ON(ret);
-	nand_cleanup(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver nand_davinci_driver = {

-- 
2.53.0

