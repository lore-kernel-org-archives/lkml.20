Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810615;
	b=dexTxApW1YxHXlMV37Edl/OOyONDtas5Fo6tDpdg8xnhKZbBrnnZl5PEvR1/huLdoJpi
	 DhtiCXeitJ8s+9ELa4m+ufMXBadl4mC0QUb2em0Hz6ufM7BMLq2QuFtAmU2gSyjhlbzCL
	 x8O4j6eMxXQYHIZ/bE/mPHhrqtMHygRsA42GYp74kvpw9HmjcS61aC8bU+J6vZAThVX+q
	 h7toToZLwj5y2ukRvJi9j5ZsJLwFCcgYHTvjmmxlR0mifwDo/AAuQCrlJIvGlD2CSwKkW
	 IaHktaidJ4016cTDhwRbFtapuu8l/5jyuWNpxf3IiGj/VAFwIGXqMeRHvOsRLvkQ98Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
	b=BzEXHlTUEJg1u1SwkoEZL3cuu13RwFN3fm2PwhqHcgard8t6OXeMO1s/gEpCp8FWH3r7
	 Z6N65VpqcHlGo//kO71+NtdB1AK/zeWRfphrtDb7qmFjBH1/E+by+I2za7S9PVkv9857A
	 yB/Qzs61NMo8jz6y+9AgZ3UNovCcTsC8uvr2cH8kPbI0ojum5GgahI3KG/01NX/Foatgq
	 Q5KwE92ZdiMLp1o38O5PcXI0ksnYrhXckfL+REvdydxzc2RBuIeqsGBKeBYmm0vydOtpI
	 FbWxrJxQR6sCaCipTBsvTMdxNJsiGH0fBRhGua8bYGdiwH+iG4KHriKCUdcsqXkhbnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NavmMLG3;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7B7606A8B4
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F7B7606A8B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NavmMLG3
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6b1afdf5196so1046736eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810614; x=1795415414; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=NavmMLG3nzy+gWtPCYrxGqTiAaXHWfymg9kFr6QvhXTwQBMcLoipqfgqw5iiQ9YKBq
         RjE7MHYZDtedmU3rCvu8hHCNWKAYU8smlxlSPxq0PtROp3ajAG5y+LhjUBpsGGkE9iL/
         U6KN6jKBCywRek/s+V51ABtd9fgUrDGa37ZiFcwl4INFy5qm6tExUXQenqRN3lR9dmjE
         P/w6JxoS/rlVp/Dk9ZELCzpuT3Rj1MPTF2NE+1oQScb8mi84OipPzkSWvSN0E9mjNFiA
         yAu3xWMHn9sGgKpiN7qLRuDtGL6wi32NGiygX6zBQTgp3rwUM3/YJLHcm7fwWAdQhk+y
         IRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810614; x=1795415414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOcp5PUW3iZJSNOaYwXsbQQhGYFmUNK81o+FfUFfPJw=;
        b=OXcHB3v/7KYJX2PtE/2d00Lz4Zo0B7Jr0uMFT6tsbMRLzArq3gEIBjjVzcQQdU6dp1
         9eZ1e9J+yCpvp1pZkN1hOP6ThnzYyY3NIFxOe3bdyfpOyru7JfchJZOwDl7hc3shKdxg
         2EjpG8mPHS3Qj2DZrDoemfP9qZ6jdCZspkmozOvM++CptnmcrC8yrOcrzDjzMUi7XEKM
         lK4c9QNZy4xYnAFSkXTKyKXbLWshvgyVd3vbVT3MN86kwfSQc42faqVWk7AA0oB2i6Ob
         65Fbj1kTQ5QDAr0vC7StrVIonzz7VfSt9V5ROToani3AZJkp96bAmO4HmcLaYgjvrrft
         iB/Q==
X-Forwarded-Encrypted: i=1; AL+hErFVFW4YGeehnyC14Wupu5uwy2Rbzv5XAOhCsbEZYtT8aTTivWw0NlbzYZ51qzaLZDi0SYrUp/cTnOR6gXw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jRtUiqW528iinssNCKPE3JomBC5B3h/hBDrwsMBIRYs0A/i/W
	kuEoiqJ2sdBpFFu8fpaa1BVL9tEeE9EZMmbhaXkHHBD2zgiQocloeECT
X-Gm-Gg: AYBFou36JxZEWdaEVe8d8NCHvz3rpBSFjdhznBtGCjli2UvqBWWvj1535qUO88xXiHs
	LjHgMDtg8MZkdtRKf+IhlDNi4lEqMFmz+l6pL1K/Yg0JYMT33c5T+7qss5lcjpfYZJlZtjHGVWx
	R4ZIEiUZk98NAbI/ywxLQmooL0rAvMdgsh4goxlwlak/hIRcSap/da0td9N2tIpSnG7tr/M5GIp
	ijgQCc9Ikx+8mYUMfYTI3/eySt8ZRsqkKK/7LzeTvOdsY0gwSfti47z077ojFXUWsGs193/UCdg
	IbmqSoA7FaDlL1k0/KlPiIQNAkVHiX0L1vkGG4K+cCcOa+OPSZ9rt7NdxPbHRBMpk/LbrJU4vqS
	7Q2AUlaZZy7Dz7Q2qBmlwq64coLoqvyaE/0TQzoymT6Y4cCmjgF5PI1tWCEe8rsGAZ6sSiXnvqb
	YnZIj7B+0dJEcFB3zXtJRL3iGZu+MSdqYjA0MuZvlTRDwQTLm2N9GpIMMsYW2ZoXiHgyDRqgTQD
	ELhKrCXtI+OvSSPqBrNJqjczI+GzHJjxm1axHz1sCqxUVsWqrey6FY9DU5la+lF9QslC9usZQPB
	D5p/AB+nSVzjKPh5f6R21Y+U3wswTHC7T6nDNLD8Grnpr53Ify8BLDqGb5nahAfXeB/BoaYnHcz
	N6tDnlXkw97rcLtVC1qoaCOmPC4rxNrIbH8GUBalmlZtebA57aKajlcMKFMzAhzSG0X/uAJPde2
	bhUi28P3+JZz4zze3fzt91zqU366oBucwroJ65wx2YrBJwXsLMjh7ioKDJukzTZ+RGILpjMC+c
X-Received: by 2002:a05:6820:2302:b0:717:da:ba2d with SMTP id 006d021491bc7-71ab510b260mr5669988eaf.42.1794810614091;
        Sun, 15 Nov 2026 22:30:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:37 -0700
Subject: [PATCH v5 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-22-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Release the LPC region and NAND mapping after disconnection.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index b497e84636c1..0a2d5e5bae07 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -122,8 +122,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, ddata);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +138,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +176,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_lifetime(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +198,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +215,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0

