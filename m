Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593777;
	b=XQ4SDXAst3u6VC0R+lbtd0PsNe/v369NWWc5iE1lD29YE2OUQ9TFdedbHUw65OJ9ya79
	 /3mLNlWIEIfAXczBZTRAE1fWiFd0CeKu55USef+kh4LypQlaPf7hkySZX0xzDKQ4kPQqV
	 A2Qj5jfVlFWf8ehV1OQ2hhQDYZDkPaAH4+zT4l/7607DQglUcmaQR00binYJ4xy4EC/20
	 3IiCRVjqbq4Ga6HiGe7Ligz2ft3h0CpDY/2KT8Vcvs3skdBh4YqxcV/qhw5npsCrU5hje
	 s4LR2c/KVRPOHlIdndeaRhrSui1EnkeI6cyiT/bivJBh13N8urKvn56HgMXL99y/cWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
	b=baz/TlgUipNfBRPQdG6mH5/5CIK3IjhGm6As4GFkfytrQUm2ka/PcL+MURm03dxhHUhD
	 LxJ38BFBHD+gB0z/gfdi5xWGYQMn08CWunUN7myEOKcZn7pIvXke03QiLSAIloovrBBPL
	 3lgguAJDc1tIc/sQvtiHwL0CDm2tjqPTgfx8ouhQ9mLV79FiZBeqcA50tcEpQYv2eLSBu
	 wJZ/2rdLvIosABI6njtLEYs5w9MnBzbEJD4v9MXZmjVH+gNMfaLJIm+xNNX/pSQTIXo/3
	 p4dwLsVX1R7GcWawdgrYmZUBCZZ/MyyO4kPHSJ0YBZ0xaI0ZK8+O5t4GhWpkfaQAwZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vtC85Qm2;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09A7606B215
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D09A7606B215
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vtC85Qm2
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f84a55e31aso1525607a34.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593776; x=1795198576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=vtC85Qm25IvqoBjggaz85x36ZUzSV16SHAFuQnmXSfm5IRWjVD5USRHu4M9G450kAV
         wGG/jyR2FozGoP/U7VTRGLHSHySBz/61zUsTAJ+nLrmFEX0DRjAw4s8B5qn1YOJLWzlL
         SUYVcRqcRE1/Un0764pIrNndYq5jYvJA4tRxx7vTDc1f2OWBiJnvYd/umX0YmuVBxONa
         SIeYRVLrRQVLjxh7tZ8Y0MMhLPBs8VzpcIVbOTR/e2L7mVkllFCJYKCLS/Y29NyT7g9e
         1JMA/H9X456+XoUvn99OhYxoqOhYTGoDF8Li1xUmXRJATwtUW9cI7LoZrDaCv7snrBKP
         7bOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593776; x=1795198576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RbITScvmyfE/Fkxqbl633jAaoI3LnbBlJcMHpQ8T4s=;
        b=hOcwMEfoD0ZcJTolj19LvtZko6TMPP76d+3Qlgs9NpMKpl1V1nopcVH9i8MjnnUVTZ
         has89/9PfXulBq9JAqPMEAb/LoepWWHyXRvRZmCFWDBtTaZChHtmQBGlE8dkAZ9HfW81
         3pBhGNX9nX/1CIXopyxXHK2lLdafvMa5WykwJHi2RFmwJlJJ4ONf8z3yemLAG5+PtZ9O
         4IyBVd5JeWFP0+ox36wEeUAl0zheMQhSdXK2lrSLBuywUYCbSjbMbgXKtAcMuDAAev5z
         W0TzqDg/btAxzCQUcNHffrMm9ndRclEdrBpTwdfQGJM2OxAtQwK8xWqEszmiYnH7zxgm
         F/cg==
X-Forwarded-Encrypted: i=1; AL+hErEajQqCx4RIXqF647QcMruF6b85+LeuTC6oZzxYQiKqlgsr3WJRt61PLabezzvDeYeTq3SKT7+RiIY+PjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lZVRZl8ZifbB7e5H9S4NeLr6o5sWmUI4jsg3TwWoF7rIRPrZ4
	DftdyF/hSLOuRJJW06YbcbzD6FXZrj5GF293zO1ytpgKumes/jtULnXY79JrDaqV
X-Gm-Gg: AYBFou3XAa+Q5pcfAcEIuMEzdqEPDHeQhXLf4BSPCwqxtW0Nni/7QOH111X7TiFxPWr
	5EVEVPZNgpH0ndmSNd26pkrz8exMDJL+jfRyGW0Zpf6dTPc+td7UNOM7pmTlwtWLGdpp1/bWhkz
	jWmlR1bul+nijENf5WgWSyChtZaMxIf02XZ0xQAyfp6iXPJdR7AVAZBV5yaCP76IhKUnaFF5PTF
	tm2FMCCRdmIWwiYsD9u/UVjmVHY+u+3OfMiHgXZCSBhauwD2RUUEZaLj4wNHLtPNVqFGEW2kdpD
	CH0Zmpj6fMKo8ZyWXBX6FiSDn2wQ8/VnFOQsRokeQW1AB8prPbVMwkvDq4UMOuYjeGnAgF1MDEe
	ClkgA0WGZFKRKBrz8AbEFZOE80jDbdn5Ke3yKooveEX3MSje9rPtcq+HGfY8cHrUknG/Pr4Ulg0
	UASB93W6EtH9C1MTMiu8y7CxkSmN3Sz2Ln21qbDuAFXzeRWgu67HIRXZGbbqHei//zLbO9W+CKk
	ubRoJ5EEwoct0D9fygrmhrJ2TM/ZL6zDuIrlNagEhvbJXYvIFP/9F1DHRxCPe95CGEVPxwhOd/F
	pGAdUIJxRU7Sf1mCuC261ovsmEGuLcsXoGvK50Hi5Vj/PqwIySv863o8tSe3/wbY/xY38ueTD4d
	IvYjbw1+G6b4vAMa0dIMec3q7pG9I/tAgtYyi+7RZ9ImOQWiYjH9dxtw5AnDS0175+6EvAnkfUU
	3jHQmUGuZG+bqnBLB+k6c2zbIWao93KgT8lEyZFw/3TJieGMFYeaA=
X-Received: by 2002:a05:6830:640e:b0:82a:bf47:a080 with SMTP id 46e09a7af769-862898b702cmr3155900a34.27.1794593775898;
        Fri, 13 Nov 2026 10:16:15 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:54 -0700
Subject: [PATCH v4 38/58] mtd: rawnand: cadence: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-38-556b1d7c6221@gmail.com>
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

