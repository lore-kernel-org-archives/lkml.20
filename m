Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446975;
	b=OMPYfpSoetT03yJn1A4vLXANy1cITHbLDZVU/dZTSwDzRxqy5n449Gq7Q4ruDVlRBQv/
	 t/rWBi66gKs1HGpH2c8Q+1tMrO8sxhUFWmzrXmf9KjH49jTCx1eE9xo0WVSAgSMN8D+kt
	 Kd3uUmq0vPa7TUlELo0KdNBUFUhWJCAee+2KPK2atvIPYV3lh6A49RmhpcRLT3zav/6CI
	 +r+zxZRsrZ7z54uHzto8E9m/MsVlkUpYpnUZ7TQTbSp12FbQZcmvBLTEU8cw6gl+YdmQi
	 cUj1MrE83xxozWgk3uSA4fp0HJB8rbEjoQVSJ1/vjHaKiHJmh3ydcwqyAQCFCwhLWtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
	b=L9uJrWsc+Dy3PtdlFh2KHzKQ66zYsvpYPlUOF1hKJrtwEEeNtkwC1o9l2+3X9bQ+w1Go
	 ENQxHrDRwfH4/8J4bBxoxyhcclTS2i3nxdSZF3yzLSMTx6UVT0n5QTRA8F4+qFhUwLQ8/
	 OLqWld+FKJ06aNSLB2Y+hy5YhW0E782pQOxmTO9hthLsvbFDkajioOfIYN7b4Vb04ENVM
	 YZ023HdSPkNXkzQ55jjpKHDRW/u2ccBbG97yXNfbP0j0yHQ/hscFgS2lv2lF0Scyz59F1
	 q0RUn8d/ieYtIB9yxfLUGcuwui9FgwTj4xqccpCELYqvb24p35jrG+V3lBK/5hg2FVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8XyaAEC;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873166073FCD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 873166073FCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v8XyaAEC
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4f48d91ba7dso2069073b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446974; x=1795051774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=v8XyaAECX9u+a4nqqBsMy015fXt5eBWZ4VTGTTqzS/Jz9isKtalOuaEYi1tQwq4odS
         UBlbWGsUYw1sTegiNpi6Vv/AG/1qpkWbUgtMycB/DOV0PlMld1FCSh7t/9kAOaeoMk/w
         xcuHx394oBO45DXdEWba31nxau44exCGCHdLLJhEiIrmFqe8dB4RaAQObXYHFAmwnD3W
         TTrAsjTkYHmkq7gPh8bMOMlBqrDhyvJT5wP3qcCZffVg6pHx1FzH7oPzPoPcOMcPUwOv
         JSoYOacdAxXZstFRnSVRkDTwXJCURxFInBV5kVrgYME4gxgf3vUDrJtda8Bxbul3g489
         C0JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446974; x=1795051774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=Hex+6rh/UpaSPuOG8YSlwv7O5qTt2IpyrQHQZzV8wz2PkDA6CvFswKqUFNaH1Bon7W
         YIy7dDfm8y96vO3tCnDL/Mf+X3QdUJzQm5ma5mBq2+GwZ2qkikwKGcaMYitNg5tYrjZq
         wMLpb6DNjjkYKiFgsng2eWeERo7mvW8yRsN7k8r+E8nr6N9arQJb6IH84RD/2/JgVXpR
         X8cepQJY397gOrZZERuWFVM5z4K3wndhSQ72QquPc9mAsUG+ujONV25RtSH3/o3ThG5C
         8XuUGWMnFM15ZvhHQFG9GfnT2/fp2iapTalTpPETioK51+Dyv/Gf8jTvlXNyDRLOU4ZI
         unjQ==
X-Forwarded-Encrypted: i=1; AL+hErHa+3VimckRYUtxG+ozFkuFO97SzlHwbrriDE6BxfD6lHrxS6oWDLxsglQ8YcnLwb5kX3gc9jCM6w/KG9E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uejgIpexkiaaa8KGIhey+yHK3TbQY6q/OLOO/r2pPGGWYa61n
	nYz47+6za6zDmXBuy/micVa91+WoQVLvydMoioetYBUXsgMZkelYcBUz
X-Gm-Gg: AYBFou3dmsEHVVe8/yYdTjYUkKLI1n1FOths0Lf4TItLnkTei+eTXyNhoXibigwhJS0
	Tk8LLJvfzPuyEo1vRx+WXOeJ8h797wpG3X/N5Ii0oYeKx5d62m9J31OrC1PSh10PznqRLnKaEl2
	Ugsl1KhLJ24LOE+Tw7aCmf58t3vzRZ+e04zqHDi/WMClEzO4cwPYOz3qf/JZXhjrvLDlyWEVnG8
	ioyDGmEZwULL4bpdzqWClVbTxNec5nfMNxClAOZHzl4dfA8vAdQ1EVSwM8nXKItl/vZDI5XdRYb
	IMjPP/wsABfK/CGp+9AzzSeF8QnSssDgxBxPdYCvUfMv+f3TXvZuK7L5ZwXk3y7hPSQPjEidTtF
	gyrVD6gGJDrvF1InNztTUlfaOKesgYAtmbUUD12GEhTQB1R/mlGg14J44DsaonHSxsITcUj42pl
	HVUz1YxIbiTuUA5v2weibIPc8qmp6Q2TY14049sW/OJYZjPWB3Dc8MC08VzxQquB9BGhtSK+XQX
	dGngGKWYoMTGhjRlrUXYeL64lWn/blMlzUnwvrJtmDsvZcEuiz/F4T48aN6MyfuzIhdMPsUS9N3
	mFZI+/s5Nb5tOjVmynym2bBBtdSF9yyntXheNP1UsR1qBIq1IyQYRpR56FYzZPUrPaiPSFg/WKr
	MSJrjGRhI3J1LnHYphfwvgK2acpjNvCo/Y9UFIJ7g6zXcQmhWEqVnLtrgSlUQdcYCCM/RA7Ozze
	OmlTmQe42rRlmIcgyULU9qW/cHRjfDsc/xu/sKM2+g5uufxs/7ijZv
X-Received: by 2002:a05:6808:150d:b0:4ea:686e:fe86 with SMTP id 5614622812f47-56b98227486mr4063488b6e.63.1794446969874;
        Wed, 11 Nov 2026 17:29:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:35 -0700
Subject: [PATCH v3 56/58] mtd: rawnand: nandsim: retain chip state across
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-56-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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

