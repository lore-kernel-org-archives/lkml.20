Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810633;
	b=Frvta8g6kWG7XE9KaejGuBwMONvvNhbZPUoKGwTbYdCFDBmkOmvdbMRm51s78bh/P0r7
	 GNG3WgKr2MEODrNAiA4J7GqGhD3WDq64N1K1VdDdEejqm8Xy+feR28C5oh9oavblvzste
	 m6N3ol1Imyh7KtlWG21JNOgsIudb0RgSNQU3BHwN1NYnSDqTmrbpXBej7e8wJ85XxwOZd
	 z36VVgXZ+dzPxzg8c2pYeCgo2onZ2YLaDbHkJDIdObnOZtLFP+mSkcWfvEtwvBPvQvJbx
	 U3F4MswQQPTP36RvoIBM7cE6KH0OC83VdhHMoqxdNO0mqc4GpSU8zzLVSheHR6mKWIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
	b=aX1r//uku4Ktv+ilgCwcaXthFNHfheqPDWIJ9vuxpG3kA5qo844X28y0GWKb3x0sCg4a
	 Lq4z2+4q+y62Hm8f/vdnYGWXQcVdRjP3stBtkqkhvXw9wtKspZMhTd0JTvta4d7bm1NIk
	 IBkq3vXD9RHPJIdOiFHteV4SZQhUdNJpZvOwPpJ8O/E0svDQ4ajoZke2g0EnhlNesUGzl
	 E/Mmok87zFHfVnYPKjOzCoVsyF4dS+PgHfq8suGx7iZ8dc5hmcjP4rkYDnz7dMEz8VHPL
	 Z/pnezxyd1yxkEnH7PXzz1gX++4MoeKmNeC6crpGOI/dFRyRu8pEEWb7bI3gQEEHoIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5u2se6m;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673A060A3821
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 673A060A3821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g5u2se6m
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b1afdf5196so1046786eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810632; x=1795415432; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=g5u2se6mGOqYicgoE0t0LqMyklsOlVatrrVdo8UJW79p1WUmEWOCV46zFSX3T2vsL4
         xYiulXSFSWcrNJH1Q3/EzOBOqDPsK8sNZW0zNK9oHoWki2TEd1nc+w9I8I7Kzgah7pC8
         163s+zE9rjysNgIvpKkugA3mUISDdGgQCKuobSjRTP3k84nwanXbK/46QLkMEJ8WbxGg
         jsPeh7mWDFp5LF97EBxxRPiztz1DYu1hDwSkRNQgc2fShvCrX57ujg1o2E4jEUjw+BCr
         0kAz+MP4TCgfk7fY94+7w267VAM6+KTeHximdUAQd0ayFaersm0x3FljMe1pZboKXd/O
         F66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810632; x=1795415432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=nyI2tQ3jx5Nfmrprf7u7yPeY5Edo8G44hJdipAjkGSia3LaS0mBCzGKP8ahm2f/kz0
         JG+Qn0BdX/NOfpFflyhaEM0CizFXe+HwLJ3ewyBBoTLIY1NoyVojwqduYTtP1qKip6Rx
         9JDPTlgjRwVxvgMWVlUY0JF6bkryMcI4cfx2vq4+CqW86Ys6qJdHkTzMB8WsPCwm7tHn
         9bBkgtNndXBzZ4GbRtebGNiAwPJVfKSB5I8xnT9PYB3GfDHQryVu0/WcUn3EDHz133fu
         Iv3kZuhdV3BOoOlWflQJ7T/9AFTSlEqQ1e8f2We4uOMjlaHaJMv5lZMivKnfEAXVPXcr
         osQg==
X-Forwarded-Encrypted: i=1; AL+hErEDghy969MuEhyzo1QC21OvGYgsTZJHPILWXf3tjkQiRxHEF4uKaCaKnX7bahGZUupTsJ/vd8PINWgRvTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5ph8QvwFiGZ8BHJ7koODlbpKj8gGh+hwVBKZMg9hPLfB8nUyy
	EddPCTdMVef/3Lce9fVyaR6iI0xiGP6D65YxSvcneO5Kvj6Wgqtwf39s
X-Gm-Gg: AYBFou2q0g8LQ1tpbrlA0+HERl1Hj4B3QpqbJdxgHrWMs4copVjsPvsCB+XuRR+8Slj
	WsDf1JlW4wc+Zao7VuBAih4KVQzsBm5gjN5aJAOxbrwHMmmtpFuq1e2TqsKY5WwIWrfZzWdwKSG
	uiLbcBPEEyh4YjPupWyizLeISmRju/GZPW47gm0GZOIJedFvAfq3+Dk/2hJNVpMwQuTD6oTluoK
	tvunyrxil8XCqLh3f/a8NyNALhEyegxR/Afx/C94I73gJ33V/h7ID9oRvs42Yewugb6QyEI6H7r
	xLiuY1IABwyjF4u+NMZmBi5SJKzNDaqfe4RpgwtoBxF22dBdNyrXt19pe4+MdcIqKNmY5/Vxc51
	tOBHtIlzEHeG4LyowGDDHnNZ5/eUEmJ6ZS/sX3mvMLIqFYs/r2dy64rXgCwxF0QMlvRKgaiwq0K
	4iHH1z0r89fHSFmRxYX9n1kCe+o0qtz8p2iYTe0UAeKkKNfqzLjUXHHnoMoJe0w59J+OVn1sYdi
	y7yiqVDixNLhFqdcNtGBXywTH+9rT2Ojfi5dWe6YIblyOT/BSmyHgZpTfvuBoroNTJ1zCRW4jKb
	7SDVwwus3a+RCEmd45qMoJYKWZyOfVzdCpoegB73hiB0KaxlpuZjS/HIbbEy+R1T+ZmyhbONtxZ
	RiFs1sMpC5FVP0Pbg1JfZSJT3ujwV8J6cL+QsmVyV1TCOYLconNctFcRTwPYnmPP0V+0x/yqJX+
	YMgryfI++0iMZ9aGlO1QsaAzbEkn0VHzBBA+ocXBVlAMK+KAMncPw=
X-Received: by 2002:a05:6820:1381:b0:71a:e932:8688 with SMTP id 006d021491bc7-71ae93289demr2085637eaf.41.1794810632331;
        Sun, 15 Nov 2026 22:30:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:53 -0700
Subject: [PATCH v5 38/58] mtd: rawnand: cadence: retain open-handle state
 on removal
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-38-cbc49c5c5e74@gmail.com>
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

Allocate the final shared buffer before publishing any chip.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/cadence-nand-controller.c | 49 +++++++++++++++++---------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/raw/cadence-nand-controller.c b/drivers/mtd/nand/raw/cadence-nand-controller.c
index 05d0659e6527..4e365ffdf905 100644
--- a/drivers/mtd/nand/raw/cadence-nand-controller.c
+++ b/drivers/mtd/nand/raw/cadence-nand-controller.c
@@ -562,6 +562,7 @@ struct cdns_nand_chip {
 	struct cadence_nand_timings timings;
 	struct nand_chip chip;
 	u8 nsels;
+	bool registered;
 	struct list_head node;
 
 	/*
@@ -3007,9 +3008,7 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	}
 
 	/* Allocate the nand chip structure. */
-	cdns_chip = devm_kzalloc(cdns_ctrl->dev, sizeof(*cdns_chip) +
-				 (nsels * sizeof(u8)),
-				 GFP_KERNEL);
+	cdns_chip = kzalloc(struct_size(cdns_chip, cs, nsels), GFP_KERNEL);
 	if (!cdns_chip) {
 		dev_err(cdns_ctrl->dev, "could not allocate chip structure\n");
 		return -ENOMEM;
@@ -3024,20 +3023,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 			dev_err(cdns_ctrl->dev,
 				"could not retrieve reg property: %d\n",
 				ret);
-			return ret;
+			goto free_chip;
 		}
 
 		if (cs >= cdns_ctrl->caps2.max_banks) {
 			dev_err(cdns_ctrl->dev,
 				"invalid reg value: %u (max CS = %d)\n",
 				cs, cdns_ctrl->caps2.max_banks);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		if (test_and_set_bit(cs, &cdns_ctrl->assigned_cs)) {
 			dev_err(cdns_ctrl->dev,
 				"CS %d already assigned\n", cs);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_chip;
 		}
 
 		cdns_chip->cs[i] = cs;
@@ -3059,20 +3060,22 @@ static int cadence_nand_chip_init(struct cdns_nand_ctrl *cdns_ctrl,
 	ret = nand_scan(chip, cdns_chip->nsels);
 	if (ret) {
 		dev_err(cdns_ctrl->dev, "could not scan the nand chip\n");
-		return ret;
+		goto free_chip;
 	}
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_lifetime(chip, cdns_chip);
 	if (ret) {
-		dev_err(cdns_ctrl->dev,
-			"failed to register mtd device: %d\n", ret);
 		nand_cleanup(chip);
-		return ret;
+		goto free_chip;
 	}
 
 	list_add_tail(&cdns_chip->node, &cdns_ctrl->chips);
 
 	return 0;
+
+free_chip:
+	kfree(cdns_chip);
+	return ret;
 }
 
 static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
@@ -3083,10 +3086,13 @@ static void cadence_nand_chips_cleanup(struct cdns_nand_ctrl *cdns_ctrl)
 
 	list_for_each_entry_safe(entry, temp, &cdns_ctrl->chips, node) {
 		chip = &entry->chip;
-		ret = mtd_device_unregister(nand_to_mtd(chip));
-		WARN_ON(ret);
-		nand_cleanup(chip);
+		if (entry->registered) {
+			ret = mtd_device_unregister(nand_to_mtd(chip));
+			WARN_ON(ret);
+		}
+		nand_disconnect(chip);
 		list_del(&entry->node);
+		mtd_put_master(nand_to_mtd(chip));
 	}
 }
 
@@ -3127,6 +3133,7 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 {
 	dma_cap_mask_t mask;
 	struct dma_device *dma_dev;
+	struct cdns_nand_chip *entry;
 	int ret;
 
 	cdns_ctrl->cdma_desc = dma_alloc_coherent(cdns_ctrl->dev,
@@ -3181,7 +3188,6 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto dma_release_chnl;
 	}
 
-	nand_controller_init(&cdns_ctrl->controller);
 	INIT_LIST_HEAD(&cdns_ctrl->chips);
 
 	cdns_ctrl->controller.ops = &cadence_nand_controller_ops;
@@ -3201,9 +3207,17 @@ static int cadence_nand_init(struct cdns_nand_ctrl *cdns_ctrl)
 		goto unmap_dma_resource;
 	}
 
+	list_for_each_entry(entry, &cdns_ctrl->chips, node) {
+		ret = mtd_device_register(nand_to_mtd(&entry->chip), NULL, 0);
+		if (ret)
+			goto unmap_dma_resource;
+		entry->registered = true;
+	}
+
 	return 0;
 
 unmap_dma_resource:
+	cadence_nand_chips_cleanup(cdns_ctrl);
 	dma_unmap_resource(dma_dev->dev, cdns_ctrl->io.iova_dma,
 			   cdns_ctrl->io.size, DMA_BIDIRECTIONAL, 0);
 
@@ -3275,11 +3289,14 @@ static int cadence_nand_dt_probe(struct platform_device *ofdev)
 		return -ENOMEM;
 	}
 
-	dt = devm_kzalloc(&ofdev->dev, sizeof(*dt), GFP_KERNEL);
+	dt = kzalloc_obj(*dt);
 	if (!dt)
 		return -ENOMEM;
 
 	cdns_ctrl = &dt->cdns_ctrl;
+	ret = devm_nand_controller_init(&ofdev->dev, &cdns_ctrl->controller, dt);
+	if (ret)
+		return ret;
 	cdns_ctrl->caps1 = devdata;
 
 	cdns_ctrl->dev = &ofdev->dev;

-- 
2.53.0

