Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296698;
	b=GfNFCid/KT7DlrwWNZWpFKiCxhEgdpy3rhJsHaQKtdaagtUEztL3qtY8mq3kf4cdOnhV
	 oyBaElu2mlgVkriI70a4Q9QSBhFWvkF1KutxJ8fWPWC7vBO0lY0FwQ9k/msIzGQeB2RoY
	 aosaMx9B6A3ir2i8gZvGQeiG/OGrwzXIUWFpbO9UyWOniisKJcpgm7niTf6X1QMa+01Ti
	 VDspAbz6k5C3J1Wz32RtOGQLsIxlD99vGHYVfk1UTDngt3qA4avO3yyJWePYuYC4T6qx8
	 stXGF1cdrvYd9kkXidZHtg4GPp55XD7fQ7B7o+VqoqTebrxnR+vzwFMm9tY5suGYuWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9ndynNB7A1QLb3sbkkLOkw0hbY7VB6UW33KXzWEUKxo=;
	b=GPmzNxYiQVGOuOkmMIY65eoK/wn8Er2WZlfj1hevCm2K4vq5TDBHk/4j76WfyCCVtWAG
	 m+fkQChpX0clLd6kRBd9HENw2QBaatvhX+IynXsyETqsQIER1DgQkQZUB3ipK0pM1Ticj
	 n8qrV/N7/KVNNc0AAXa2Er4NFJWAtedOTYdgvlXY6gZXvFoQAVjLbFGisHPU2LDnJq92S
	 N1YTnOMvAITxotJeOXQDBQvi4KLY6w/Wxx0CU62UAqcQW2kFEpHK0KkdM6Cv0Z1SnWimU
	 Un3fGn3qTQCv7rHPSNVKhuEtR3mCW6rT8V5VUpME0LOTY1mVHcmKp3dLfnk/hESca7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hP4AHnvp;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7C2606D281
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7C2606D281
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hP4AHnvp
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-70b875f6f1fso1293912eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296697; x=1794901497; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ndynNB7A1QLb3sbkkLOkw0hbY7VB6UW33KXzWEUKxo=;
        b=hP4AHnvpvjT9PUQBOjNbTh9kJPO5z9pJ6/ucH0FcSiAbKbdp1MhaM67+njZ1Ab1hza
         BMo+4DnCyT0Eo7076e+kcJnya9IeSQ5IAu3VoSqZ7iQLA6iEaYThDKuAPglh1/81Q1/a
         P0ICv0TNNdIkiaqdTraZOyFZNyKgxZqTvr7k0W5OwbuAvFr2apm88KEoLqCRzy00PDlt
         orOwKNpv+pRuaIbQr94EHUp+vlIr8ThRpmfmwLsoeyQpg5VxDAyixiBaAQWVNPiff+Oh
         sZanSPjnSzR0rVsS5zHjwykGd60RSSqoOCJBcpGImQghRVA4AsGkpJoQufTdRw++2qKm
         /jWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296697; x=1794901497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ndynNB7A1QLb3sbkkLOkw0hbY7VB6UW33KXzWEUKxo=;
        b=LHyj7REHA+xXqF7DeNgimjgs4aQS+VrBX2l+kxop6ckTdBFl18Qz3eC5JudVdb2s6e
         DLgZcUYUJdiPkuH+N3+qL4nunyzflqirzKvEHcnyevqXdx1X3kz3uEjavt3AA/EXvnAF
         iAqeyjFXChzfO0lZjHKoVX80BOFA0H3AiT33yMIGy2SddGp2T/0UH/Cyc5apEPKisy2H
         Fems2/m0s+hV3vkSVg7V/q3wNauxuLKoApzlmV4LHtU6A4GyzYsHlHypmyULc+BWpQ6d
         lg+inPqtpI6TgTf8yT2WJ/hg3E0SSUlRFYfO+SQ3L8ERw1VTC8eJW+RZBeOMesdeLpBT
         HWIA==
X-Forwarded-Encrypted: i=1; AL+hErEO9JItVqpxFb9Qc2rT4vscA0VAvJpioJD5sFarogyKyOyF7Hyf/hhznVJus4PmntVtIUqTe3zIvdGktg0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dSal6Br1zm0+kl270D1g+yycgbRepYSoYX+G3I1FiHfnoRGbI
	wiA0jTd3+G+ZowRuZG4wERkyeNUmOaEHUP0EJt7ec9pJrSrkfNBUQWXlejOrmTga
X-Gm-Gg: AYBFou1lRdvdQyPCXX0QXu/QuZZ1wRbZ0hL1zBeTluGwbibo6AzxfJX1EndkRYDvg49
	IVJdBiUx2b7yTo6EXKb4/p9Df3mBdIiTFubWDr6eKkuU0ZWS+fJbEYAVvfPS6diccLN9fLQHjES
	sOkTNN30dD6UBIQ4sdmWIPdjlICt4PAezhWSmFgN1ufl9AILecBKBo7+6h4htI1DfchKaN5ZW+I
	PuxnCJWz7sLv++MHJVOgQ2/J5zWsCLBYvF0lFBn1SlClTra9wjqtfOxr0uFqm6XQc4ab9XNU9vI
	vmfzM47stz1Ykpeg0iZyHXAxQ80/G9QdMgSeSZvc4mqaKihmusK+DgbLV0RMxyHnLa+5V8hE2L7
	bL5A3S19oj0rZ9pr2Y0HuwwwUpVw18l6P+x+nRF1FFktsw8Qf9nt50AT/Y5xqRZoyL9WuxFZbOT
	P4ysTLy3EdlgTnWv+rYBrJ5mFAt0QPtqetkiqMd3zTR3ZTu3rHSgXVx7MQcpo3Xk/AQhkrTD1ZU
	ZGqO48VnZzs0KGF0/LzNCfZxnCdqEfywsT/MAmSk3lf/gKA59rem8IKAHTKtt/sr0BLyLNhonEf
	caFWny8DlqS+6uaeASzwPQMNlJJZdyMd7DJv/T82mEJcXTWY7OgeuPcZvvaZ2RICHVU8SG9s817
	+FUBiipl0SfRUqOrqoxo77g9ksod0vOPJtuP4YQLbor2UZJ/F454/kZMCkBwAc6JZS4aYRyDjM1
	5EW5d27TiBajfsbEVDGhXVcc8GZnnosy3ZA/GhUaI20842i5+Bc6Vea8nOSORMiMjxY64aIAZg0
	Q==
X-Received: by 2002:a05:6808:c232:b0:539:c292:8b04 with SMTP id 5614622812f47-5683c9dfddcmr1448284b6e.8.1794296696889;
        Mon, 09 Nov 2026 23:44:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:36 -0700
Subject: [PATCH v2 33/58] mtd: rawnand: gpmi: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-33-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Han Xu <han.xu@nxp.com>, 
 imx@lists.linux.dev
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep geometry available after removal while releasing DMA and clocks.

Cc: Han Xu <han.xu@nxp.com>
Cc: imx@lists.linux.dev
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 527165ccc839..cda3bbdca928 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2744,7 +2744,6 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		return ret;
 
-	nand_controller_init(&this->base);
 	this->base.ops = &gpmi_nand_controller_ops;
 	chip->controller = &this->base;
 
@@ -2759,9 +2758,15 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 	if (ret)
 		goto err_nand_cleanup;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret)
 		goto err_nand_cleanup;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+		goto err_out;
+	}
 	return 0;
 
 err_nand_cleanup:
@@ -2782,14 +2787,22 @@ static const struct of_device_id gpmi_nand_id_table[] = {
 };
 MODULE_DEVICE_TABLE(of, gpmi_nand_id_table);
 
+static void gpmi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct gpmi_nand_data, base));
+}
+
 static int gpmi_nand_probe(struct platform_device *pdev)
 {
 	struct gpmi_nand_data *this;
 	int ret;
 
-	this = devm_kzalloc(&pdev->dev, sizeof(*this), GFP_KERNEL);
+	this = kzalloc_obj(*this);
 	if (!this)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &this->base, gpmi_nand_release);
+	if (ret)
+		return ret;
 
 	this->devdata = of_device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, this);
@@ -2838,7 +2851,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	gpmi_free_dma_buffer(this);
 	release_resources(this);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -2846,6 +2859,7 @@ static void gpmi_nand_remove(struct platform_device *pdev)
 #ifndef CONFIG_PM
 	gpmi_disable_clk(this);
 #endif
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static int gpmi_pm_suspend(struct device *dev)

-- 
2.53.0

