Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810654;
	b=Z28ndtocAy9h2/nv3PIOI8R5dBnWLX13YvcmhQEMk0JHgsl5xuWNCOzTOnkDO+OBKfvn
	 LhKfffZD4MYWILgfnuvvFRJs+ATwTg2TcRNk1T7uIB8VTsf7uRUGgw5Nw7BB3r4ttG6ha
	 RXFmzCaJEFl9rXu17qkvpo5c2l7wJ6Eb5DjhvWOUf0cFVNSXu96sdqm/tfLRNqq4NjkRn
	 iO3JtlG1anyjJPQdJr9p1uQiCHVYYwzCCAcYj4U+DulDU6kNw2AaFS/P3qR4Gtpi7Wbw1
	 0rg6CsOqm6TOrCy1YA7SpSvlw1jXWuHsC/TBoZd407647ul38+e5+S0/aA8xBejyNBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
	b=TIzOdEuxBQtJUJaw21fOfEMz5mw7YreOqmrzfVDhzwC054hZo6As8dIy1VozKmfErxu5
	 +tyIx6OE/bMJ5hXrV0Gz74pfoLJ2J1qJHpr8mPUHHgc/fxJZRvjSgQ4p1VnFdUuXJ9czB
	 opfZE7i0hKS1q7JEXQjDUqTlJG3rx5sSr3biMuaaz2WG7nsoYRf9i+qUONFVycSX7d10Z
	 GKaNqUxbdvkEfiOEeQ6qY1lhlr98rz3Y3F6kXfKyc+svRdMahQ7fbG/UZYB0mnCkpduYU
	 ZCIV54cPYSvFOoeSBbUu9Wp8b/9CyFf+i+TwL/vkz8p8grs3/DRdJ9Iuu8wVWVt5JJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+qWLC1V;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A6A60A3839
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45A6A60A3839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y+qWLC1V
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-702dedeb70dso2564759eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810653; x=1795415453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=y+qWLC1V1YOKbqbYVM8g9jw+aNivcJnFwXZY7J669wNMkos8lqPfQqACptMBsevyZ3
         XTCChoCxVJJLs6jWoRxCZMfB7E6y8FN3+YJpJzZYLBED7O8USOvmn6qH6nQ7roiBB/TA
         eVmOZ005mqqqfhE3EdhWHufi42YGawCfvMFAHPJYy4UZRzDWzMArLc1XoKmf6Tc9dfJy
         agd1HF8R300NiBlxCcX5Si1LnvGSINYCoM04RyhdDJTFvX4Z9Ftwcw0pHNCA0ag/b9UE
         OchqF4dxXoHfU7Okh0YGEhF521Fy5k2H3ljdjKpHNs7shldm4Me/rIHmeg3Y2MdEgtlq
         kIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810653; x=1795415453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=qJnF0mT//9HmjBJ0EAj2I8skQBEWf47Qmo6YDAzOuIdK7WD+bu/Rm3RozXtREgZeMv
         ew6I3snf5/BfGWjtELR5oIQ16hi3+IQG/XpPUiWo6NoAEujymNLXN8FDTBVRrpEjbnAN
         pi7KeuBGGHR7/Fl48ytXIIt24iReqOwlpEuGJsp5innaHDsn9ccNc4cfCV6Kw+kTu57r
         ZhoYYb7VwUOWEiDrSXx2xBuoU8XYY179btLZgov+nnEFgaa5tOVqYopImESiTsIO/SK4
         Gww7uodkgReztYbuFHwxaAC1LuUiOMTOxBbJPc+Jqyl8L6dsj4NAUncYq/e1EpH/F1gH
         fFGg==
X-Forwarded-Encrypted: i=1; AL+hErF5MaD1/J4PRBzaOHy9yIBDjgjKbM+W24qzBRmrdTnTvnjNT2jYT6ytON1hSJOHSPPMLtzZ1b1TWosFKnU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8YUboEX9u9APG0PVK37H16HEapyhyDCjW4fHz0x4QNWVBdXyu1
	BlKctexu5Zx6PJGswTwhdg7WecBysKk9haYavNLhF7UFCbMt+lXH5eqv
X-Gm-Gg: AYBFou3yYia0lB45ArAr/aRahmeNKtq8vySQhCPKXHji5tfN/pGFuIpyY0DOYQYp5s/
	gQwn4DXilgnAY3rRv3qOTSp+ycSYczb4lSogBV28w6IXTCpCTDcbn7NKDjOMXU95W9rMnvE39xp
	SRwi1MrTeTS6SL2Vj2kbMKXvu5hlUa/blAmAqftRkyNOUtd53ppxKamC6vBYk1X/EL6EzSmpPX4
	5t2CcJNkjSC0udzzo98A4dnmycWBY1EmrEFAsdGETivQ563Hpeh8BGrbaMhOX5n7UXhvVpLFS3c
	k4mJk0X9qkGrXclAL22kivyf9I2RUan57sbZ62QMTRjwYCuxc5iwfibtPz9g4Pekg2WCBOzy28j
	XU7eEqjqxWrye0DTjpY2H/urnWbra9qODM/EYZXY8Bc/ETuXto67ZHpsFN37rxWL935obRbuTWK
	HmUrrtsbB0F4Eud6gtL3pg655ar6oMLWEwzYtOMwvTVLBqRIrduJH9bzi/Zkcm9/fpNwCWZCK2g
	vmowjz2InimWIwaFRpkCzzZrbNbxWxzqbBtD+CvRh6AS4Xx9Hex5fUku2LnpJ12oPGgbOD0AmL8
	ChPzRWp3KxatzAtEnKYlWqStywissv2RlQyMzh50ChmmQMy81JSGKLrPACdaF3MGYQTD1WfpQHw
	lAtCbKwKllLfwpBQy3J9TWS2F0FGZRe0jhJ/e3PD4TgdeVXn3mL0PwYR/woKeflSxpE49yyXzcY
	S+jaRrnJKVpfWe5ExUJ6DsZN6SJxJyxdR1Gb29cYvuoPCzDgM5mTE=
X-Received: by 2002:a05:6820:a09b:b0:71a:ea6a:4f64 with SMTP id 006d021491bc7-71aea6a57eemr2049976eaf.50.1794810653156;
        Sun, 15 Nov 2026 22:30:53 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:30:11 -0700
Subject: [PATCH v5 56/58] mtd: rawnand: nandsim: retain chip state across
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-56-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

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

