Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594395;
	b=IDv1xw+aGmsASOrQYXx7GqZL1t4CS8Md9i1HGZ7bNu96laFjd2XPUvsqUluFgg8uwXDA
	 HV+MYysn67N/SlyD/pH7bXs3NSNN9D2C5Kv88oOh673vQdNpaODpmPgBtbu8Pl+wkX+tu
	 vyu8o4XxoKmkf+kwLN15qy2M6VewYh3Iy0/y56gXH0qwoQI1vp/vhynV9/fvJRB4l8c7v
	 uVdSj9AdwEj5GYO4TPpoDx9F+ebdbR9/PXztAk0glR7HN/N4LgIdpBeSWfWOsfPUUweKE
	 gfMvvNOhbApVuvJwBVJnc248hWR/eXY9iLEk/2PTxFQz+9pbrB+sPz+Ds6mrWfBPE0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
	b=HyuzNTCd75Hecjwqanwi4zRC/HVyEc6/66b6fZsKk1ZSm0/RZTaXSaQA36APz8l4haFF
	 sJWjtFu55Ozp45Cey5PJzX9tWYO2mzoAsKOtZdrf/+g1ZfMVrtHek/hNWEhEVoxuXr6Vw
	 qD8njEMQVzK32wsAHZRZVhACRIOp18DDeL6deZyjymISMdyBL/dIvuTKrgP8O3MOYuTer
	 +mtAYa+CI6nxVmlaQbo5PSYe4FVuYVLgOIskjzyQTITJoNzDE57FRr+xVVpa2iRkrYdqP
	 rD80eQMH9JOckwSc2HbUo6ctcNQUoEaII+VKcEb4+I17Z2WFestrXwgcaYtF/Q7lJQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEt9rr4s;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06314606AD97
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06314606AD97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bEt9rr4s
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6f74f6b46abso1443057eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594393; x=1795199193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=bEt9rr4s9+1pFVCWKck9U/VBTHae0g86b7ek/BR//euruD4rhYGzgDezYaeZ9lCGBn
         LCOicyhyJtlqTEE2HnwTWxnrqLR/xRUEyyhl3207M9aHdL/4xqB7YV+J6cABSqh8IIic
         QD08Jr8AILx6P6tCIVIhc0CRyOh4p2lNUQI9MRPiOxTRIS8MAo2wbh9p/0fwtCu2OT8J
         gmujB+LQzwKOwRbL1xybMvaBzMmuPTrXV/KFmRsTIBQ7NGUXn4M7D9pAHzvAJS10g3ES
         G57UVFJkYkn3tG7yYdmvMgnunvO2TkfZHALy1NZZ8ODH3mILTv5ttYBgVEC2y2fBmyyM
         Pb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594393; x=1795199193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=vLONmlllDZtqK0YsBNXY0pg6oMGyckA0Xn/CqmEDsg1yCJrt5OJJcpGCZMZTLrGbvs
         yE/pfquooRy1iv22wgCEV8g1M5E20/P3xXeP42aqMsJaK4D8frXyasBoaCWvzVKY+mQU
         Gje7HDYBdBPD9GMDlWryzvRfHXVryFu7JT+Uu5MCJ9kVAeXoSYOLOiMBsPSYEzShTNga
         HS0wTg6/fKD6ielOHzQ7RXbBwZbT6rXj+xt2RtMrEpzuKMFg6V6kkQIfIRsjEgWRxAxN
         mf/auU0UaVcKKDhcb5UVJDV3JmvKUxw05g8V5DXIVoT0U3ZbV5koEM9vbQXcGtcXNaAX
         jpdw==
X-Forwarded-Encrypted: i=1; AL+hErHOBAjZQ+sM12//RKHvUvPvr9eOQmqPOOVzIKEaxBZQeNUaE8aZF83SAEqqsIjVq+sT6OP04m/LEFecbik=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KiOWqzkLjAbkdN82AikeCA3P6M0sWhU4TaEUTnVzRBfJD/Ds5
	6ElGLaur24K5ELKQ0I0amAgkNNBa27kesz0eA12p87ge0TZa3TXe/rU1
X-Gm-Gg: AYBFou29HH3cfEUrxzS66SViQLIWl0b8r3UPe47OmAEsRNjftQuHaezbIYSRIo0+SZX
	ryAUZwiHgqDTel4ujng7nxjQXr/fUlZ4goMck/y+HgqzRxsX54dHr3XPuHeuEcb/DAvKLzg3pPH
	DJwrcsq4CFb1t8PPR2vkEI93TWxwdzm0CqEvcl2dEDuj6RT0onQ4CFPIKE6mcDBR9gAPCKxVrNo
	ensNMQXDYm/0qMrQJzhbVFcUhHHxKxgRezdM/eDS2Gp/VugICFafB5etIl518IJnTF5Ex+K/ZKg
	WyMSCQu9dAUBuvR6T/SNua1W9f29d7ccDUpeyPirePv9lnAHIKVHhi2jidnUMwKbo1R5f2AnfOy
	XKD7DsoOk/f00keqaTLvl2p9WKE1SNfiGwN4bLUdCcX0Pm9ZqXEf7qEQpf6wHkbpLbgatqCR39z
	BKvFt7h95ofG9fsOCJr/LuHm/uCpXi7pMioQI30YumzHiMefmWEZupf4+3RZnVOSmfkqv/yIsNY
	uZxj8JksJ38W3eNPSocUgzNkXCtpp0teOoKFvMOc2qgS2UUXu1BG4Uu72O64Dc/2mB1KBCrJCLh
	9pbluGQ1bnyu1EFnq0pe7pc0C7QYfJ5OAD40MOlorwOJoOn7Gs8bsEw+YWVeuf1PkQ3AP9NlcME
	UXQ6fZOtOVZ/uSxHBw4c2YuXugCYyJe1evQtomS6wgRY6/hqkZ6ihjzkhBwY14cOL/pAxU++5B7
	/vIxjx6D5zPfIvESUSaMXNSBB363drXn6zVgwLkunbG8YAiVSo78k=
X-Received: by 2002:a05:6820:1607:b0:703:38e7:c3e7 with SMTP id 006d021491bc7-71ace4db572mr144272eaf.44.1794594393456;
        Fri, 13 Nov 2026 10:26:33 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:30 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:12 -0700
Subject: [PATCH v4 56/58] mtd: rawnand: nandsim: retain chip state across
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-56-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

A failed registration or subsequent debugfs initialization can unwind
after MTD handles have been acquired. Disconnect before freeing the
simulated media, and retain chip metadata until the final MTD put. Use
the shared lifetime cleanup for both initialization rollback and module
removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 6716eafb4b00..dd000c766ed3 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2263,6 +2263,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2317,8 +2318,6 @@ static int __init ns_init_module(void)
 		chip->options |= NAND_BUSWIDTH_16;
 	}
 
-	nsmtd->owner = THIS_MODULE;
-
 	ret = ns_parse_weakblocks();
 	if (ret)
 		goto free_ns_struct;
@@ -2377,6 +2376,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_lifetime(chip, nand_get_controller_data(chip));
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2392,11 +2395,16 @@ static int __init ns_init_module(void)
 unregister_mtd:
 	WARN_ON(mtd_device_unregister(nsmtd));
 free_ns_object:
+	if (retained)
+		nand_disconnect(chip);
 	ns_free(ns);
 free_ebw:
 	kfree(erase_block_wear);
 cleanup_nand:
-	nand_cleanup(chip);
+	if (retained)
+		mtd_put_master(nsmtd);
+	else
+		nand_cleanup(chip);
 free_gp_list:
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2413,7 +2421,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2431,9 +2440,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2450,7 +2459,7 @@ static void __exit ns_cleanup_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 
-	kfree(ns);
+	mtd_put_master(nsmtd);
 }
 
 module_exit(ns_cleanup_module);

-- 
2.53.0

