Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593779;
	b=oCK1OdbBv9kKixkT6pwmau5ZuZtO4rN5JVBwXw9vWlXOixohOqZx1CJAR7AcOYaqQdJb
	 4gLzw3jaYjU92Njw9uTkyZi5+jSDF9ARchX7a3U5HygAa+K5A/EI/j2NkNKyPYqYuayGY
	 hLOoNLqzWChLtuOeNcRkfdkDTet0oJPS6dkSylcwyFk7Qol2e+YVyQPpaqfd4MoaaNLsv
	 TMhL2zUYa8XSWS4RlhQePgjM/DVV8TZmIii5sX+Db4qhjFDdL8QwAY+01w+IOOoLWn6ee
	 Yxqga6CWM4brqZiT1SeghkaNaKgfMaqcpYpoAi5Fsbd/ncU9S/tF4jsZldjDoiH9OTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593779;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
	b=dRKceDR+bsJuPYo6qr4+2jnz7o7aYnpd1I5uVYxe+MgiaL/pV+8WJuuH69467+LsWVeH
	 3ZDXnKxb+caK0WmtnnAwnYMzyyD9cmjDN9ZyI7DwOmQ5DKAk3gFEhBQGekZ5a+oFqKCCZ
	 tRJwfMWQlHT9Aro5PvSNlBS3laGuRmBAkcWe/Vcqe/0nIC9idNx+W4xRf3LgoPFIJi6qc
	 I2qSSEoV5RRaQwqPmGR7IkIooRDCPOVBUrn6RztATW4GCGennlGB24UI3bH+AJTZHS1fA
	 NskUZPXr30VreHyA05AGv3vdD4lQrf3ON2jJFy4G7HouLIG3vppiqHhiEF2nPPfbdTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hpTQFnSS;
	arc=none smtp.remote-ip=209.85.161.52
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226B1606A6CD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 226B1606A6CD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hpTQFnSS
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b19e291cc6so2162988eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593778; x=1795198578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=hpTQFnSSsys4+gKwNxNAEqsUFWtWc2CeO+0l901zuYw8LqQc3+K+2XM9JA7BBNrtUr
         X875UYhGX50TK2HuEVnzq2gSfWmySh7EW40lnxfvtqeFXxbdJxFOoZ+GjL1LiES2HhFz
         r5Ms1y8iiEwBvSQy2I5J8FKWUXAr1ejakjkWagE+pdQue4A9F9dyG25uPMAzUzoXwqvR
         WS1dDtG/FeFj+K/jF/g5yNDDbOVM+4zQrXfaxVDKofOBQgLGpgCG5e2Xh84Vw/demFuy
         oGq5kgD32kw7Po1lc03S1PMXXzCQHisYJ3ApabD/qhV/dp98DoNdM64Ne2j1hhzaQOBK
         8igA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593778; x=1795198578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w0CBWoRUKQoxAvLDuyn0+mUpGEFdmi9TjYpfcXlB7Mw=;
        b=D+JWD9vjLsNToAKVCiPl6DY9LMBSix8gssF+kSsqS1/ueiFCXn9lCTETK+tiIrjkqF
         AfP4AwA5xhE5eye9RLtI4q4n6QtTBTe+gvVagNNW7EyXG6M+j8Eoh1fPBwLIBcko93K7
         +WPp+LX66Rszs7WtiBem7BedZXAbNJGjc7UyNG0qrQg5g5ZV/4IkUW5jnFYmSi3Dj5PW
         q7Uj1TYlOkvj+c1Cwyx2kjxH1Ck4FJtnWX9w5MMduVb7c8OYEo1wJQ4xYuMmHISx7mJR
         23dtt2+wgAYCgydlFjKNrh98hbevoiNQQj03lhbIkF34uzhzIO1VpMXgDU5ttJYhirmR
         t18g==
X-Forwarded-Encrypted: i=1; AL+hErHjSmhGosqJRReVjq1E0y6rZeOYBZRAwqPnrpO4ygcSIjMQltEiM8Zf5eqfW367X8yC9Tc1nA7iPzedvLQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N35Sowx4tiRxNWnBKcSRLOtfa2rH97GeXOjgizPdH04t4Y8sr
	IqosuXbMW7HnvH5keJu3qaM/IRWr9X3/YmPCyZb689X/73GndH9NVXeIREwp1eZx
X-Gm-Gg: AYBFou3AJm5NyncUscRMwQI0y5WiBBxatxUAtRt2fW/fn2jPS1CG3XAfsNQ4VXbXymD
	u1GCRHK431hP1H0z8RQSXgjSTjk3bG26+TZHbG2t8qJY/E9wIVWFmbZdDO7ONwn+DOGbcdXaakd
	clOWIlRy7Z0PZTUTJOKSWLwz7b1HvyZB0m0F1Urm+uAp479bbbjYgSwfUE06TBecPc6hC89Qjn9
	2ypi+fSrkr0a0A398T5g5QMnVdNaGo7Kol1pwr+czuUScwC0jYidNQhmCDTKVm7Fe7qTNYAy0oT
	cdXg7POHg/P2nKEf+fHgEQg8BdGH0UkxJwywXuntyRUgKhI+QJH5o1c0g46Zii4zLY4dxow8SBn
	t7v3t2JfnoDTaWvD3bE8sbjPKTzsJ4lAXuEfnSre+tqcLkpYxYzpwQgcKndH2lrNMdIhWf9Gs42
	bAzHeZ9O6O4yT4TU2euX49hBLTopQgY1Gj4hFl6GEsnHdwhaIhXDDO0BEYvzTSxk/5UdH6U7MyF
	5sUx8jztnet/ke/8kFYj/Cmad2Pb0yygTYLC2b75zraJKFWMq30wiwBJHRS9f3lyMIRaMl3eiXl
	0e3SCMOyqctxRhem8C19OPmPH3/dPXaa5/ApLpdjsBzkeB/SrwJ6NCwOl8GVLBHckndY/MRkKkW
	RJaInhUknYVQJ9m9Y49wJe+6kasY38TIvWTS+PNdt7jVlw7R89C+2UNkKw+AOJs2hURQyYGNoSU
	UwuiU+XtLBqgVjRG/yDMQ3IJNy873db3kwZ++t8o2Tb99MymUHRlvj
X-Received: by 2002:a05:6820:f007:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-71ab4cd8533mr2096480eaf.13.1794593778031;
        Fri, 13 Nov 2026 10:16:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:56 -0700
Subject: [PATCH v4 40/58] mtd: rawnand: cafe: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-40-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Free DMA memory in the synchronous NAND detach callback while the PCI
resources are available.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cafe_nand.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/cafe_nand.c b/drivers/mtd/nand/raw/cafe_nand.c
index e936c9807bf8..be29e78d6408 100644
--- a/drivers/mtd/nand/raw/cafe_nand.c
+++ b/drivers/mtd/nand/raw/cafe_nand.c
@@ -683,6 +683,10 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 		err = -ENOMEM;
 		goto out_disable_device;
 	}
+	cafe->nand.controller = &cafe->nand.legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, cafe->nand.controller, cafe);
+	if (err)
+		goto out_disable_device;
 
 	mtd = nand_to_mtd(&cafe->nand);
 	mtd->parent_dev = &pdev->dev;
@@ -693,7 +697,7 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	if (!cafe->mmio) {
 		dev_warn(&pdev->dev, "failed to iomap\n");
 		err = -ENOMEM;
-		goto out_free_mtd;
+		goto out_disable_device;
 	}
 
 	cafe->rs = init_rs_non_canonical(12, &cafe_mul, 0, 1, 8);
@@ -785,9 +789,15 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, mtd);
 
 	mtd->name = "cafe_nand";
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(&cafe->nand, NULL);
 	if (err)
 		goto out_cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&cafe->nand);
+		mtd_put_master(mtd);
+		goto out_irq;
+	}
 
 	goto out;
 
@@ -801,8 +811,6 @@ static int cafe_nand_probe(struct pci_dev *pdev,
 	free_rs(cafe->rs);
  out_ior:
 	pci_iounmap(pdev, cafe->mmio);
- out_free_mtd:
-	kfree(cafe);
  out_disable_device:
 	pci_disable_device(pdev);
  out:
@@ -816,17 +824,16 @@ static void cafe_nand_remove(struct pci_dev *pdev)
 	struct cafe_priv *cafe = nand_get_controller_data(chip);
 	int ret;
 
+	ret = mtd_device_unregister(mtd);
+	WARN_ON(ret);
+	nand_disconnect(chip);
 	/* Disable NAND IRQ in global IRQ mask register */
 	cafe_writel(cafe, ~1 & cafe_readl(cafe, GLOBAL_IRQ_MASK), GLOBAL_IRQ_MASK);
 	free_irq(pdev->irq, mtd);
-	ret = mtd_device_unregister(mtd);
-	WARN_ON(ret);
-	nand_cleanup(chip);
 	free_rs(cafe->rs);
 	pci_iounmap(pdev, cafe->mmio);
-	dma_free_coherent(&cafe->pdev->dev, 2112, cafe->dmabuf, cafe->dmaaddr);
-	kfree(cafe);
 	pci_disable_device(pdev);
+	mtd_put_master(mtd);
 }
 
 static const struct pci_device_id cafe_nand_tbl[] = {

-- 
2.53.0

