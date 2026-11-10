Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296724;
	b=lq3imi2ymI+SAZrxeIx57tNaMautrKUb0+WNshGx0IMrLg3ZDn3wTRUWdZuLRGTpgvum
	 WMzanpE06MTp8OFECB9K1HaoZTwCr+S1X8XRceF4NA1amFdDAuLuhukDbktAH6Gu2z+P4
	 J1oXUmuy8IIWuq+0aFoWJYI+wEsWaZ2A9Ra2+lQ2zKJOmrl7K8rUS6bGZ/UoLO1V03HdQ
	 dX7LoY2KxpT07t60oQ3iW9KgPoKqPqxYaMpWRetmUaNb/khT0AituIS30oXIngOQMCL8Z
	 OFosxVs+k+fCmgQQHVWZdjrAi1SbEoYcaq4zv1KrmPtRpe+D/haH6fGAZnnOlJAcrgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pwUJjWsLv0sbZcwY6lQaaStciK0Yii7zkSEUupy4QzQ=;
	b=x9iAB5C1W3GjizqLOetFPyuU35zx81MVCX/ObeVGbeLRB2WnzQguTvt5GEzZ5wLuMhZI
	 EZJizBosCF3VgA5WXY0HQng4IDxZ173uMlxcruhI7JsSR9C1fPErgCmLNpKiyF3wAC51l
	 K3UYzJeG/mT55rjz+vbAqC8B0S04cm4moZY6s/RBt/BDeAUossZDcsF9lxhol3ZOj2jXs
	 UP17SR7U589fFkXBi+NJlOdRQ8VZlD+lT2gOdmUF1+ZWNJYshZ72GNw69yFNpz/KExQ+u
	 UY4masrjI3/INUmBVzWv/pUqoMxS8nNDoup138kR1Xyrn2aA91Qpgn07hDamYrc7YzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmZJMrsu;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC14607557C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BC14607557C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zmZJMrsu
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-53a448f86e0so908239b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296723; x=1794901523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pwUJjWsLv0sbZcwY6lQaaStciK0Yii7zkSEUupy4QzQ=;
        b=zmZJMrsulkM1iK40g5RR7U1JFbdjmyf4Vl1KDC/9Ls4AF/WXqz2yEl0xDk8uusxpSv
         NlXtUDZEWx8g30eVfdd2chWHhqRu8s39qWJl2QHLalmS19GFoweAJjxH2uKltJpD9d9r
         skp9H89d1vpHhCXNcaM2j4Ihs4Jl+Fn5d/94ln0pmO3uFcVXBsbv+FeH0zM9tr4SqURB
         yg+NQ307C1UUjw8WOrIGk+zpOck28FB8qQ0kNKHrE6/19nlODVlWUzaV/OODgyfLZvGT
         Jaj0cnlLsTL9lTn/7Y3FCERpW5zsUfufjESgSEAzfohURDyJlYE1p2Ld4xVRrUjX4AMh
         ek9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296723; x=1794901523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwUJjWsLv0sbZcwY6lQaaStciK0Yii7zkSEUupy4QzQ=;
        b=DE3dSaY1mnVAf6HGVhAejOzToWvac239vDEOvkiMRarHqxafkeJ560vg4d4Jv8JAem
         5dTAr4BEYEOUd5RpwAogbFC0PY8ueUNAVxzubjDh2iU+kQVmx+JR7G7TTcZzc+AW8c0b
         cMopOYVbF2jm8XDXZjIRL/6O5+M/YbWfwe/1jx6oZvkcXgs/jwlq00nUZuSgWg9X3gF8
         ha/57VcspF4dxZi597xipzuwHpIciAE7bk/9eAOVQ0cnu0kY0cyMjv37Z/QxUG/OP6o3
         BcFPEU7eyoQ4ZiIO+NQJyL7bh+Dnqm2Io/CILU0QtqoRMpE9FN+Anj6K4vAAKSX7uzqy
         /lmA==
X-Forwarded-Encrypted: i=1; AL+hErFy2letW+FgxNkkvLUUjT9f2is/GUfhVdlB/2M9WcYS+X1iHDWCER+2Z/yjrj37uap0bt+aFH1cyBzD1c8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ImSUbiYul+P3LBzdSvJNOJn4m+W78Cw1MDYrqE3dzhpEtqwp9
	BWsIgmxBIigNxiUmtwf79iuML0apat2/EvTNmv5LogagNATeZv5ABbCDMIt3zaNr
X-Gm-Gg: AYBFou2cg2d8LPjyP4BoMEgYnS8orkEjDThzNbRHB6oZSt3pdx9PyQ+G04Y3fM/U8dl
	WCf4vov6NScAvG5Fq+u9tfKG6qVTAoPoP3oISbTJLj7WZat78SYe4f1arn0j6Sm+K+bTHf2sFCW
	VJqge+ZAw49i27O4AF6FU5a09ANre7W0AltGdQmWLt/km/nbzNbdZC6bQFUkqnVMBObmeH8FGbD
	Gp1CTYD9mmBPgkfY3HvmbmwQlngo6xaVqRWrN4ap+TiJ67jO/08UYMRDtcaWBD2FWxbLwdLeZZV
	wJWtvuK0in2+nK+b/vjmF9/JUSDAMECZNLlQ7D74LpFClsborux4ynzbNHHwS743HWUONiJweke
	0ePRZMbCea4ZP8szvZLcdEttN63qw24jWXbDXdJrl7YuYV+bj/51R8e1QzRTjb4Exzma/EL8Aft
	mkCWp3EAj0fZCBGOWqK5ooyUxNEfKjNyFYFTFhkiLX8mocAQ6PGyi+niL8zYH/o8aVF/Rz/yzf7
	akEvMjDr1R4xYW3Sc1VZi8wdHs1TwG6wuh6z/w2EBT6Hvmd7C9+8dkWYCUCK9me+eohQTWUvwxE
	MaElBMcu9W6yE4+yF3xTITVLVQzi8gXQk8jnslYp36Duy6um4VnjxoccJ+wZ7TaCybNJY02SS3a
	pqQjhz68wmNF6c8CEvWilJVIO580vYs/qgCpMN1pItmZO4DkJo+IphmyZzQ+jrU7hDgAySJ35A3
	SpO/k8gY8Qif7kItQ8TiSJJimjeKE3t1UIJaIgtE7sSjlbee9BZCM=
X-Received: by 2002:a05:6808:4f5f:b0:4b9:e5fa:8903 with SMTP id 5614622812f47-5683cbf9608mr1759067b6e.22.1794296723223;
        Mon, 09 Nov 2026 23:45:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:59 -0700
Subject: [PATCH v2 56/58] mtd: rawnand: nandsim: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-56-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

MTD device references can outlive device unregistration even when no
open file pins the simulator module. Disconnect before freeing the
simulated media, and retain the chip metadata until the final MTD put.
The lifetime core waits for remaining device references during module
unload.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 6716eafb4b00..0c8c741b2b85 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2254,6 +2254,11 @@ static const struct nand_controller_ops ns_controller_ops = {
 	.exec_op = ns_exec_op,
 };
 
+static void ns_chip_release(struct nand_chip *chip)
+{
+	kfree(nand_get_controller_data(chip));
+}
+
 /*
  * Module initialization function
  */
@@ -2263,6 +2268,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2377,6 +2383,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_release(chip, ns_chip_release);
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2392,11 +2402,16 @@ static int __init ns_init_module(void)
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
@@ -2413,7 +2428,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2431,9 +2447,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2450,7 +2466,7 @@ static void __exit ns_cleanup_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 
-	kfree(ns);
+	mtd_put_master(nsmtd);
 }
 
 module_exit(ns_cleanup_module);

-- 
2.53.0

