Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904942;
	b=TTdosCmSsyUoo0EhDctXglGmRKedVuwmE5TYTYt3Ji9QiAgIhFgNSk0KJqCUv9NP++9U
	 bQDp3tAHn8H55XU7X4HXoARiPXbm9U0GOJayUeE2dxRnhERG6RkNNApPOLJb2pWIQ9Lem
	 7bfYF8Hhe8EUfn/BgksDlP7BvmjdNgj7ANpwpzdQN+vCbJkWfaTCazqQ0VYQK9KzBZzp9
	 OicmCogod18nwY9q+QRkKfhf1hCPq58xTPOkmCtv1jruA0rCHkGnO3VC11rIvN6/HTLG2
	 wLQcI5kwnJ6AcH1EJzruL8sFs6q4n1UHgQ6Px39gmXLnWaLcfhhv7XIomSNWXs6aHog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904942;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qc1K6dw8YZ5zOMaIssAlpVtWAd8Vswo/yLcW5TaoQ6c=;
	b=GENopU3f1GxjuVVKbs7cQTjBVHT6VwPq0LePEpc9cVcwUe41pc9bnG9a4vMHvjw4ZBsL
	 MesmoUaFQhZZh4idbKS7/caPjr/+Yma6aiXJki87MNC6hw4aFmm8u0yGbEgdPvbT2W3bJ
	 D74MQXSpR18SHobdDvSATDqpC8ZJ8bj4QDBraa2UtAn6QHy55QxSir7WlHizesKkqoc6j
	 2Ra3umhIHAB1bmbt+zuHQuZbZVP3UaL78qNl2ZXE5N9bZ0kzvAgXSo71NDOJA5zKmqSB9
	 WXpk2o2atfvu3qeB1Q59nXQo3MuIAntJO10iBiUH988xXkj7QmYuFYCTH2V1u57A8vA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYN6pCpQ;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28617606A33A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28617606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cYN6pCpQ
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-705cb6cedd5so593195eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904941; x=1794509741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qc1K6dw8YZ5zOMaIssAlpVtWAd8Vswo/yLcW5TaoQ6c=;
        b=cYN6pCpQyXI9xpgacWIy6XWXXuRHOV6s5pQHVUs44BfWUcZ36ztIypGi91ioP19J0I
         vQW0jUABQoJQMAlfxX59DgFLtLWDSHgqWVu8fqqqOVcyiiCCWkzXJJQJU2Jim6hkMUe/
         5BtCoouQE3t8HXgPp2FkgSHeArzB0GAGv795VL6cCnMgjgjOpOPQUEMkoK8rqD544H56
         7FKKjMq6oIvRMDUJbIE4Vz4LY7aYOB+a3WiT1fHRtVmH/FKm0hPUvRVSiI+q16wMwGya
         nfkp7alVrjE0NuP41QMC3R2GMM9lfs0ShlGc7KMXxziKk5j0pWLRtNPUd+xCL/ToCzln
         DqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904941; x=1794509741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qc1K6dw8YZ5zOMaIssAlpVtWAd8Vswo/yLcW5TaoQ6c=;
        b=ac5pFx6JeQON4CzerR8jpFIZWc9Ith2wVXUe6Q0sgd7/IS2Vx/VbnN5LgvZuMhiUNZ
         oNm1WEJZ4yYqVvkufCnCu3q9r2LfGpe08I73ThAQdiT5YGtcd23GzG2rCd93ldpefGzP
         qKUcv+8Q6CpwjgN/PKi9XWXwvj2ctlw2UazVlQI+ToXMN8es2GH9+IYh05Ngy5A+BbLN
         XhuZzy33/cqERjK4JZfh15acMyqBE3JzrL/pBqcPR+TNfZ14waHGg2q41q5x7gYF2gJZ
         WFa0PnyIf/jPqheUAilFFo6Gg1UWtbO03QbIyozZ08ZLAy3ZJo7IxnPk8jof3davPoGX
         6tJg==
X-Forwarded-Encrypted: i=1; AKwUvBz77u+9MBRTYz2QFYRvQUfKyYS0KahyQJBx8Mtt5Fh8RXn+Kl7UWHvCvtu/egAP+fYOGmih3MPXQYHC7FI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oiDP9e/wAxoaiCUscNsyQzUefL6A49is4hFxBeCwjbaCaKjQS
	m8yaAUu74+0PS863jnmYyT6HI0n2TER1FQQfjuHXpcrcv08OXKexgfcS4VFu4U3t
X-Gm-Gg: AYBFou1zS3hORWbwZ8FCgizdvqHx6YxUKkpyMky26i6mgYbkUZmW9ANvVdWsfCFMgFF
	qh6Mw7obM9p7Mf/c2536Xy9/uyldPRO4LlnC0dbFQ39ldzjwjA1iCcCnY6L4irMkewD5Si5iFaB
	zFbF3FNMjKVir9XOLmqQyACUsWXYsdoGs2dDPe2BixD/sspQe9HIRaYgT0XxlVEA4+ZqnLs0Ga3
	l4rsHBo76YpE7nbkqyml0Usc/139jvVykulI6fTq6SkQV/qWXcrfT3QCeb278Jk9PlXHOzE4rLw
	HZzjeSXw/xkd/oxBazyjI35c4iDcCt9gqbpFzCEe5T9xdXCQaWkWMSI7xa3Sx7ZJ2HZ0E1wVzoc
	pRyq2o82vd9WPf11ordB7SI8SacOFoVlSMY7w+4l9OL4UoBC3iWfSEykrRYPrL6U9pAnM127kuJ
	X1BbpnknMPdIpnsTcphvc0ygRl/HcYoKo0CHk4EAyCv8IhS70WymKrnt9ZIXBQLCTk2Fujgcr2Z
	zfRT/tG9K+mYKUkhBZjC3YWkZKfmH9xEAz3JmnS4o17A9BWrZvtrQPhbkM315wsP1y3MsT24NxL
	3LE7KimejzLw0qRULu8aKQpo506PQz7Et//RKCUs37AlVNTjra+UbR0yLCPDolv3psKR8Mg51GC
	LEx6tPvBibqlPQgVjwqtyCcFTk5EWIZ6qW3KSIC+LBuQX8ScghisGre69t2qz932Wl+KQGp7QAP
	1lwpEK6q67HQCHYhZyDDxfWeNQvJc4Qq4N4xwLdk2ONU1xECkeitdu
X-Received: by 2002:a05:6820:c5ce:10b0:716:b936:7cf6 with SMTP id 006d021491bc7-716e73763e0mr260411eaf.4.1793904941072;
        Thu, 05 Nov 2026 10:55:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:55:39 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:22 -0700
Subject: [PATCH v10 06/26] mtd: rawnand: sunxi: propagate page-setup and
 erased-check errors
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-6-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The ECC read callbacks ignore nand_read_page_op() failures. A command or
ready timeout can therefore leave the requested page unselected, yet the
driver continues with data transfers and can report success for stale
data. Return the setup error before starting PIO or DMA.

After an ECC error, the driver rereads the physical data and OOB with
randomization disabled to distinguish an erased chunk from corrupt data.
Those rereads can also fail. Do not pass stale buffers to
nand_check_erased_ecc_chunk() or count a transport failure as an ECC
result: return the reread error instead. Successful erased checks retain
their existing statistics and correction-count behavior.

Route PIO read errors through ECC disable. DMA has already released its
transfer resources before interpreting the results, and its caller
retries a failed read in PIO. Restore the corrected/failed counters from
before that DMA attempt so earlier steps are not counted again by the
retry; leave bad-block counters unchanged.

These unchecked returns were found by inspecting the read callbacks and
their NAND-operation helpers.

Fixes: 97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 56 ++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index ae18a7fbca77..9a7b365e998e 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1043,7 +1043,10 @@ static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
 	}
 }
 
-/* Return whether the chunk is erased, and account for its ECC result. */
+/*
+ * Return 1 for an erased chunk or 0 for an uncorrectable chunk, with ECC
+ * statistics updated in either case. Negative values report transport errors.
+ */
 static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 				       u8 *data, int data_off,
 				       u8 *oob, int oob_off,
@@ -1055,10 +1058,16 @@ static int sunxi_nfc_hw_ecc_read_error(struct nand_chip *nand,
 	int ret;
 
 	/* Check the physical representation for bitflips in erased pages. */
-	if (nand->options & NAND_NEED_SCRAMBLING)
-		nand_change_read_column_op(nand, data_off, data, ecc->size, false);
+	if (nand->options & NAND_NEED_SCRAMBLING) {
+		ret = nand_change_read_column_op(nand, data_off, data,
+						 ecc->size, false);
+		if (ret)
+			return ret;
+	}
 
-	nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	ret = nand_change_read_column_op(nand, oob_off, oob, oob_len, false);
+	if (ret)
+		return ret;
 
 	ret = nand_check_erased_ecc_chunk(data, ecc->size, oob, oob_len, NULL, 0,
 					  ecc->strength);
@@ -1322,6 +1331,7 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 {
 	struct sunxi_nand_chip *sunxi_nand = to_sunxi_nand(nand);
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
+	struct mtd_info *mtd = nand_to_mtd(nand);
 	struct nand_ecc_ctrl *ecc = &nand->ecc;
 	struct sunxi_nfc_ecc_read read = {
 		.buf = buf,
@@ -1329,6 +1339,8 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 		.oob_required = oob_required,
 		.dma = true,
 	};
+	unsigned int corrected = mtd->ecc_stats.corrected;
+	unsigned int failed = mtd->ecc_stats.failed;
 	struct scatterlist sg;
 	int ret, i;
 	u32 status, pattern_found, wait;
@@ -1380,9 +1392,19 @@ static int sunxi_nfc_hw_ecc_read_chunks_dma(struct nand_chip *nand, u8 *buf,
 	ret = sunxi_nand->oob_ops->read_batch(nand, &read, status, pattern_found,
 					    0, nchunks);
 	if (ret)
-		return ret;
+		goto err_stats;
+
+	ret = sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+	if (ret < 0)
+		goto err_stats;
+
+	return ret;
 
-	return sunxi_nand->oob_ops->finish_read(nand, &read, NULL);
+err_stats:
+	/* The caller retries the whole read in PIO mode. */
+	mtd->ecc_stats.corrected = corrected;
+	mtd->ecc_stats.failed = failed;
+	return ret;
 }
 
 static int sunxi_nfc_hw_ecc_write_chunk(struct nand_chip *nand,
@@ -1468,7 +1490,9 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	};
 	int ret, i, cur_off = 0;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1476,10 +1500,11 @@ static int sunxi_nfc_hw_ecc_read_page(struct nand_chip *nand, uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = sunxi_nand->oob_ops->finish_read(nand, &read, &cur_off);
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1490,7 +1515,9 @@ static int sunxi_nfc_hw_ecc_read_page_dma(struct nand_chip *nand, u8 *buf,
 {
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
 					       nand->ecc.steps);
@@ -1513,7 +1540,9 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	};
 	int ret, i, cur_off = 0;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	sunxi_nfc_hw_ecc_enable(nand);
 
@@ -1522,10 +1551,11 @@ static int sunxi_nfc_hw_ecc_read_subpage(struct nand_chip *nand,
 	     i < DIV_ROUND_UP(data_offs + readlen, ecc->size); i++) {
 		ret = sunxi_nfc_hw_ecc_read_chunk(nand, &read, i, &cur_off);
 		if (ret < 0)
-			return ret;
+			goto out;
 	}
 
 	ret = read.max_bitflips;
+out:
 	sunxi_nfc_hw_ecc_disable(nand);
 
 	return ret;
@@ -1538,7 +1568,9 @@ static int sunxi_nfc_hw_ecc_read_subpage_dma(struct nand_chip *nand,
 	int nchunks = DIV_ROUND_UP(data_offs + readlen, nand->ecc.size);
 	int ret;
 
-	nand_read_page_op(nand, page, 0, NULL, 0);
+	ret = nand_read_page_op(nand, page, 0, NULL, 0);
+	if (ret)
+		return ret;
 
 	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, false, page, nchunks);
 	if (ret >= 0)

-- 
2.53.0

