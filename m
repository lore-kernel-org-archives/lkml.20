Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296699;
	b=PwdrI6kTZfpUrlh7OaKTJKObisIBXXwrmAyjBwatGJEeisllMXx0ZSZuQgQJALP0H0DY
	 DI6TX836BcJncdxRcb31fClHseRp5UXqzbLkXievyZwea367RwAz3kolU/SW9LB8Ke5/n
	 3z6guy0gn1ZMOETSNWICYXV5QRYZlcu83Zpez+JLZKQkdWB16AQCnLTgBR50lYIb2keIs
	 exZRhEst+KJxRUp7qbgU5IquJOMb/vNIp/OvBR2zzJzuDONxznvCQ4dqNJ0tN6q3rNHAQ
	 qn49Pps6NX11Vn+LY/lUbEG5ui8PAeD314T1dK9acHga+jpGtLI1sOQvbeq+Wnls76w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296699;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
	b=EW2+r77908aRyasHrIWcQPKL1ZLg6CXYTf989yLJLZtN/PWZDz19TT4IQD0JVd41e79Z
	 eP+NDovN4+CnadcUFPhTSVt1yixuj51ogEyeJS9/e352EcEsb/P9Vpatc4oweHZ6oJ/AQ
	 X9/fPIgY689O54ThW4Wc1u4C+4IvRfdVFNgnvsch/b4lyP3n0Ow6XgH+dkkYVXyu2CWwW
	 /liSDg4AQ+HD9ELo/uN1zaOqTnnylYpuv+nB6tJd9JVWRbiZRwxPmWX192ekc1N5uCrJ4
	 +knOOK3QeTZEy5QYHzhbHhuyILI+2Nl/ICjZ7kNuCAyME9X31XY71sfTzWwhkEKAalQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKxOirHU;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65423606D296
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65423606D296
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKxOirHU
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4a71d0c4233so705746fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296698; x=1794901498; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
        b=zKxOirHUVO5miuYqx0O/fisJyiKKtaf0KhzyuEO4PB4O62LOxCcGsZz6janfaxW+1R
         89228v8y6E/zKCLzeFTbeaTo74rzxF2miixxLiksyyeMWXUcfQ6mvvQhnV8AVIJBrD4z
         zXjf0xPmLnt0aZyik+Nr/sajiyN8IWS1bb+w1jgw44EvgcZkokOk67Hgfl7xRz+p4gki
         Cfr6h9lHJnkKm3TEHMndfoUHuS8EuRkzHKBjE4B3K4NYr9cqtdjUULquuh4XKHmljnKr
         VCHl4BSW3G17H36GegQt0eT1nCPApvNA0MwYQNV/FRzavYmjRqNdpC5VZMgZYYKvTpo9
         QPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296698; x=1794901498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4/Oq4wk36wTCL/qJN9660jECjYdA2Mdyi8GAjYIaGs=;
        b=yXvRqzCGoFwMljBNcO5a+NQ98e/uE50UgNWowd2QwCt1tU4ygGqEsR9YT+zdWhaglw
         lHrgj8lHcOIgwW5HiN6Ff/KeZ6otyNISO6Z1NWmz1zhLskEIwfPWPx5RntbO+Z/mewRi
         IwG5ZiucE5GXqO6J5kBFuuq6CwAvyTKRo2y29D0rg8z0Olbxt7NMqmwLCwxsWFjjWKtk
         cBgcKYIpZkD9PIHU26yuTcE2ywnTMgTuNuCBnR4i3Dgm/FWlp0OEiYRYy5BK+1a444DR
         tfB/jq2Sks7EdzNZMyydu8402cMbICpl06XIAoditSlL0yxItWFxUofUt6j+Ayli+y9X
         dldw==
X-Forwarded-Encrypted: i=1; AL+hErG7Tg0D4aDMTEiniWhA5NOHlG0fI6vXxgRaLwG05CWvqQsR9KTPtF1DQUtmfZF9sZCE0i6IeZdqrrC5/ZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kJKMGemYVg3tyEvFDW3eZCmzRNmfTK7i5w2wuLfrFI0CB/Jtc
	fyVB4B8oSfzBhB/LJ+xFLpRoR48ONqMz+t01NpFEYVvVyGncC4lQaBMjfHOnLuKS
X-Gm-Gg: AYBFou0Hm12JreZRa0hb0InDIPDwp16hlsi3RFRQK3R9k/H4GVUyevgL29dMd0cz3a9
	TEcKYVjV7jZk57flqZugUbC+J4wNtR1bj0TteVAhtrtKqHGeTMLesD2HdP8rvarBa+BJiXRq6KA
	w979SKM/1AI5QUvG6QUmOAxaULkG5DYj+3rkqoMRh/gMXPJp0+KM7L0YUZD6htnkBlakAMv2YSR
	QQfkcb7vVksFKkzNwxECbW72I7Fh1asNNtcZgoHGuLcRjBR92VU72kf3PIgaUesdtNbPEPysZwL
	1984X7C7tz5fbIqMzcu8qGCqSIioUnjf1IphKuYTXpC0v07g0/qdQGQn6DfdsNjNaHMeiZ7WBPo
	NZNNADXgIUXc0dKvY17UodPgpzPTcdl0/Dase8qFMAgaJrgBbfZT+Z+SaL1KOsR7bSt4ARGeg+2
	1thpQS6ZvijswhNgHyzXFLeA5jSbe/p9HWVG4BHuOeXDwyaKNRSn8D7ZnWkKbiKXnIyOuz8b+rT
	H7wpWXNNJ04vxhxZtsy9Zv3lFs4JpH2IHRV1WTek9Ep0qqGSCX5F6XKXaih6hYxYc2SF/iN04oI
	Irdb3w55z81AEF+z9N97y0Y5llshF48BPV7KQcnfPNo1DgbGqIpZdb5g4VZo87Vd6b8kwmfE3IH
	FsopJQIDf3sQ5bmA4go7k+1k4DLWh9eA4FEJ76CbHYjzTNJleJfaqkaIiXAKKW/rAx4ZKNfoGmP
	cz5WEm8vpGzVxgH36LIaIAu9IWr0gnXn/kF140xoOk4hHhlK35iI8=
X-Received: by 2002:a05:6808:1992:b0:4f8:4a95:9969 with SMTP id 5614622812f47-5683cbf7943mr1568086b6e.15.1794296697944;
        Mon, 09 Nov 2026 23:44:57 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:37 -0700
Subject: [PATCH v2 34/58] mtd: rawnand: omap2: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-34-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Preserve the shared GPMC lock and separately retain each device's state.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 45 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 4909e62dc11e..9949d4d53299 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct kref			refcnt;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2208,6 +2209,24 @@ static const struct nand_controller_ops omap_nand_controller_ops = {
 static struct nand_controller omap_gpmc_controller;
 static bool omap_gpmc_controller_initialized;
 
+static void omap_nand_info_release(struct kref *ref)
+{
+	kfree(container_of(ref, struct omap_nand_info, refcnt));
+}
+
+static void omap_nand_info_put(void *data)
+{
+	struct omap_nand_info *info = data;
+
+	kref_put(&info->refcnt, omap_nand_info_release);
+}
+
+static void omap_nand_release(struct nand_chip *chip)
+{
+	rawnand_sw_bch_cleanup(chip);
+	omap_nand_info_put(mtd_to_omap(nand_to_mtd(chip)));
+}
+
 static int omap_nand_probe(struct platform_device *pdev)
 {
 	struct omap_nand_info		*info;
@@ -2218,10 +2237,13 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	kref_init(&info->refcnt);
+	err = devm_add_action_or_reset(dev, omap_nand_info_put, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2304,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_release(nand_chip, omap_nand_release);
 	if (err)
 		goto cleanup_nand;
+	kref_get(&info->refcnt);
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2323,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2337,12 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
-	rawnand_sw_bch_cleanup(nand_chip);
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0

