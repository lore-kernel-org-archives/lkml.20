Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593734;
	b=SmoHbYEfrgAfU7qq1cffy0Y9U8/CyQPRiSDMmvqOJAJHViJyGDZ0R6Yvd89EhEDTGPrl
	 x0u1bGNiHd7W2n2q2/FbFThgkm+DvytuGnOZzae+RR68KdwqrD9dvkzal0Gp8ZHImxuIf
	 67NAuCXWM7EA3k1QZgjYZhysoUEk+74dWUlMkPuDluPAm/ZYWuAmtJEN2gFEGHLpS3G7B
	 azgUQfFDzztREpDX6FlRvOBTjweUTkB1R/1LRXeewNGW0PkVJZZDJ/5Dgnw9IvppvVa0F
	 pfSd/tGxQKUJs721UIb5anoXlM/e9w59oV7hBbVT8szTtSP/onlnmPI6CUoRzT4lG3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
	b=TArIJRUGF4o3JzED8tYIp5o7v0vpgB/InQlnNeqI/aVqk9ekggGPBgf2sTWjXX+VUB5l
	 HHRu2MqcrGDKFZiBguxcJ/MF8B860cHeVuonvcIUTiMP9ynH5apdbABQgBCZSqVU790b/
	 WyHg11iVGFdaJP0X+ztO0lUaXAJ9qbJoeZnLske3sRrtTuJ5uDlitnMMmF6euE6MKLAnC
	 GzSbBBpAHXb8RcF7gTrZo9O8MfwnmI5Djk/IG16oAvCEq35zkAVrBWOksTkPlI3EKQDvS
	 dtRXrmCSB6TJmA/Tz1qjDujnfZkQQxFPyxsd+biB238qAgLGZuI59O2sUR2qCZn/reA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCynAlZJ;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD9460A5BDE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAD9460A5BDE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCynAlZJ
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-716b58a4365so1380819eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593733; x=1795198533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=aCynAlZJx22fGdV12lR0sxKvDbAN8YseMslQ0sVOjLofiWvKXdnTqlZsbT6nB2Icxq
         J+Och5Jf0gJPgG71cqeHInvfxF3bVno6Bwfis+rQf4YdtCYSC2jpjsSZcc1ofJ6A5kOq
         H1mpGEUiDAc9mtWXRBep84z5DPo6LIkukOfvDu3Nz4JBbiyWMndbwP57VyoWp4Yh2QkS
         vQe0l4iQIZnuGecgqeIZBhNShWHSfc5fTl7o8QR7yYpSRZ+2JV9m1NRKlXq/XsuaOf+G
         j0MblKU/XAtF9lYGeHUU3b1sOgM5V3d9USPRU9DSh2PPrbBlzOBUXUtLjHpKPCIqbjSw
         pXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593733; x=1795198533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eTeuHhgcUZaM9gs7XgXp1+b9XZi8CAzKYwVU1LGn4gk=;
        b=VFLMvtBehgiN4f+I16YB4PAnEzjIWZvUs8ELryh+LzcFuqzzRyttDQS6/4b3iDfMXs
         +Kz3J2cxZFsOIfSVYZ0xO6qvz4l+Dsg4CAaTbPIRXHI4Rj8x/KhaaGPvLiKaHJP7E7/Q
         kyvwzPi2feC0hEY5BYKZLnX30wS2Me0wa50/IaeHztfthLpYO3lcWzYhG2ZC18Mqs9BV
         bcahGhg4DdXDrCNqrrMebto87gF0rJfK0/OtPRSZi674BGgAZK+sO3O8H7h9/OTay+0l
         /Kr62lsN9Zw8hSIJMH5FPbs9sOvFr/4+jSZD8ia9yi3MEPMP9SaKs5R61czyQaHSZiEu
         coUg==
X-Forwarded-Encrypted: i=1; AL+hErEGyN8bYWXHMJNqJ/gbJN+1ZxqfEcWKd0KZ+zt9CAuKfLXIwcC+C4W8JXR54M6WZLeKxfM1hBYFV9Al1BE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WeQ1reh+fljCvgtlXwpxyAMo1W8Oi0rO8kELxJj1DsQgsdu+r
	0SzU6QQSc0EdVKIIQ7a8mJ8LR5DlVniagaFR9mqlcnbiNTdQPLpGdmBHhilITM6H
X-Gm-Gg: AYBFou0/KcXxgOKXrr0UB+ilGzHQCWDcQQt8pCMG5t3rm+RiMfe89ReYAoeMhcNNetu
	SWjHJfX1QZ1ALVdvsFB1zgHUQf208aeYquoAiEO2VBeKYkMWQvLxKy8by10PkYCbAZG6rcJu46W
	MJv/Dm5pLTdDyw4/7wChPOrfvrHADKpTRpfM9TWJF0GxjVFpPR/j8NDmu/pBbTWEByagsqIz8RL
	ZypUAq+CvuU4YuVFq10vStpjbfN8D024y1qrenWJ0laMGQJOHwYnczzcVsQj54FSRfjuF3y0mTb
	NQyilRb3BNHkgBC/EdQK58+rWhHe3r79AuJ/537h3Xoggr3sZ+ymaIfZPOkvWM9IW+pKaTvN9oX
	DlxyEOnu9sz8j95c345I1abACXs6yZBrLX9yCT8goxY6/1ZOpp0EtZDjkcQLRnnoRRDGrZm6Qbn
	iTRKWFsahn9CwOZZ1VN5I1IFPPgE6ttEmNL6vz0tOq4vkwa6apQ1+XDqaNY/UGp8uGsE+WQ9qrI
	FZiYXwpVscxwHUIlSzvqpR3KB+ZMlvT0y2RKJjQRlh9kmb3iDAeDOcQqFKM2n7vkP8hH3I+ZPyc
	HOfVjhbmtlB8+J+F2aIfA2uw1cLJu55GOjvqf+qwvPSA1xiT0pSdFxrEYiBmqhszsPSJwvCjvJS
	e6/bHSSDgobRvNlWY3nNxP5rB8bvgQsdeE9F3gwoKOzgZzh4FJElia13qfC1JFQTetlMgnr9tnP
	/rVvsKJnytbdBo6TeSV+k8zYLvwtEM/rk1SEC/sVj6HgceytM4jy8=
X-Received: by 2002:a05:6820:16ac:b0:707:5453:73c5 with SMTP id 006d021491bc7-71ab4cf319amr2073260eaf.2.1794593732830;
        Fri, 13 Nov 2026 10:15:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:30 -0700
Subject: [PATCH v4 14/58] mtd: rawnand: intel: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-14-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: b4 0.15.2

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index d8071180cc0d..42a1d85b1cd4 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -585,12 +585,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_host);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +694,16 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_nand;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		ebu_nand_disable(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -717,9 +726,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0

