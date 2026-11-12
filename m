Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446978;
	b=Mr878DHe16LFax1lgIeb7cJWhRM1zItx3E5FnywWcub+uD+5CuyfuFpHOjilLLRVI4Fx
	 tfon8K+GMSNBryI4ax2tLUVQgrDJmreJzQzkgzAK7eWYfWQ5ANJbcHLfSOJY1laqkHI8+
	 TBUlAqWIbOt6b0wj7/KAtMKup6gKWep3wqmBdq1zP4WnEvmHAdaSV+LbL0JM4MlRx+Zzz
	 QQYnFatjquqHXTxLMKiCkcam+qWHnx6Y44lr9ivxlr/zGs3MIyeypLXbvdsPL43gZtNWO
	 s1OSdG+4FXTHJCxaBFG0uBfyIpzrH6d7J/PNSrYrAbvx9jcqDMcGf/24NlpqSlz1BsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
	b=zU982PlFIs2cRIX7Uxf4dy3/BB7dW6BZZoICPITAYQeMbCn6DhJIDHkXPC8l5rGMLMD5
	 kVUbaiaUO8MeBxmy/hrawSLnrZeTk5kE6m6WCxBwt0cPS0mUy11d/SUo14v8907rWRzGN
	 IG1rgV+RCUIReE/2ckxD06sH0qTZoyynjWZFAHR80x4DpyYiccmFB3e9i8tyD/3tVsrK3
	 97p/uYezZ6sA/e45CzUmobIUcMPmlz/Fn8MIqn74hYr7qLlHApb3LpqitnZVqTtkO2DWj
	 UskQi28CI5Y8Zg+nojqdnIFLit7n/gs5nTPOsvMixAHSFcM+OdRrYqqaGrY7yEBCpew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA2otSCU;
	arc=none smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93AF60A380C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B93AF60A380C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jA2otSCU
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-539a57a0b1fso1481576b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446977; x=1795051777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=jA2otSCUXJl/6HrZoBjT/x33YiEFvH4oZ/GMPTJNJoGRHHSTn+c8U/c4gl+WM7e//5
         Sx6QR15+u8oWKTgChIn/ygoiN60g431gw6Bu9yrhdwuDNFCO85DgdCCrwisBdKBg0x75
         UXowm+QWBOIHk+cNHq8U3p6wNyuT4e8b8NLg2p3gLJSN4sKUdwHMYdAm0mCsUqzScJfo
         1geyxjOP+AnqeQX0ui17cwDp58PnyYEFko/YmAsgtZAhBDOVtDN95ykGICSr0IVE0MDG
         M3mDh3REq9HaXFBLhwX76pk/n/BmyVbPSZmY+Fg0oSQS6EqV7x1NAY6+Ncs6Ud4kjTLl
         1lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446977; x=1795051777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=TDC6u5Euqo11HnXidJWp/Sql5o2SPtWqZsf2UizMwXfRdKUd3XrqAEYWq3oJW0fgRx
         Z8/WH6ng9SNdY76IhmQb6KQ9/Pkm1TiGKzoPPatCGP5gCYT6PLjgLAcrrcPnhPC3GY/8
         pdhw0d466FmYghDg4DTV2GdAXQx1UFXRmlqsz/dy2ey9Dse12YqufBugXeOrVzODCb+o
         NjyDwYn/CCq3j8vHWjVzqss3ct7QW33Bpqumt6Ezo9e/mDa7c/jFUE58J7xruD89UvEY
         gWPpk02f4Gm29UZjemN5B0LYBgCMtyQpkruKzHEh4M4qEtCFQ1+zrZ7aRSPLKP4Nf3be
         LqNA==
X-Forwarded-Encrypted: i=1; AL+hErEzvW9icyg0B2pr7EjKnKpIx+x5Kk0wVme7fEAmFEH5zCMvZOJ35PI03KbvemHYm6qywwU41/r06gV5/D8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88mF7TLOKpVCTWn6acLyXWrEVN0t1bt4ekCZPxKGU+Jhv3WC7Q
	gX5dM6W+mfPyFwdQMlYpV9s3tYHxDqrTJUiOMk3PpWn94V+gss+O+IuC
X-Gm-Gg: AYBFou0I3EH4n4KfKlv5eLet1uYJg0MlFyTN2C8fe/NAk//+vlCfq3aPexpv+V59bWS
	0EBmNgARw16K05zsE4bhhZ9izfHoHAhLNK+g5eCfNy7pKy9oOXwSewPv+ij8GszHJekDm+iR2eb
	IRyGmg099gZrXgX6wDho9dv5faqk55KSAX7KTRNk/mwph4Px9Tsbk6l+FudGVxNk9Mz4KHUN19S
	0i1p10hzJZRKyCLincEgSpBdGsUdBj4J4wnMcidFp3rg/yOrJh2YCsn7SH0MF2zfSKe7rxARftU
	KLVuZucebI8/EcvceoKwq3IqnjmlAGgKs21Jal70m3cbZ33SixcqKmnsXff3+CRlKkNsBPVQUIu
	IZehEAhu91FpBOfe3lzOC56udMq5gjMM1qqlb0iDsWugGVHdCRT81/qxur3I92FRizfTTqGtRvS
	oCQR4sDsj5RLpIlnbnPYqqMnyEMX/gegMML++UAag6b+FxLdZinAWfgZn4ZqpcYo992SYVwJqx/
	ZgZeTDzaBmMZ+WBQNkvwGFhZIlefyVWz/jSxOCzLJfCe2F92myz/nj+E+qaZRNIPtxPhBA4rVhT
	phy7WA8IFYHBdOfn0nUjYoe0lMfP+mFf+lSUm9ndwOz9rtqb6nXjsPBmF5gEy2HN+woMQUxcshT
	RzZMtx51dgNcWgJOnAhEr5Io/W3MXAJUV4ZdWcqVWLeVWnOCDEB7wJMEzY1G7lrEtrO9IdJFNKg
	f1Z9m98doLrGfrzf9eEbR6WAGDAuHQ6qRxdRjuo7w89nlY78ywGZkH
X-Received: by 2002:a05:6808:2384:b0:55c:a67:d111 with SMTP id 5614622812f47-56b962938femr3705666b6e.19.1794446972046;
        Wed, 11 Nov 2026 17:29:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:37 -0700
Subject: [PATCH v3 58/58] mtd: rawnand: diskonchip: retain chip state
 across removal
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-58-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

MTD references may outlive a partially published registration failure.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..2c6d0c0fdb2d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1466,7 +1466,6 @@ static int __init doc_probe(unsigned long physadr)
 	nand->bbt_td		= (struct nand_bbt_descr *) (doc + 1);
 	nand->bbt_md		= nand->bbt_td + 1;
 
-	mtd->owner		= THIS_MODULE;
 	mtd_set_ooblayout(mtd, &doc200x_ooblayout_ops);
 
 	nand->controller	= &doc->base;
@@ -1494,13 +1493,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_lifetime(nand, nand);
 	if (ret) {
 		nand_cleanup(nand);
 		goto fail;
 	}
 
+	ret = doc->late_init(mtd);
+	if (ret) {
+		nand_disconnect(nand);
+		free_rs(doc->rs_decoder);
+		iounmap(virtadr);
+		mtd_put_master(mtd);
+		goto error_ioremap;
+	}
+
 	/* Success! */
 	doclist = mtd;
 	return 0;
@@ -1535,11 +1542,11 @@ static void release_nanddoc(void)
 		nextmtd = doc->nextdoc;
 		ret = mtd_device_unregister(mtd);
 		WARN_ON(ret);
-		nand_cleanup(nand);
+		nand_disconnect(nand);
 		iounmap(doc->virtadr);
 		release_mem_region(doc->physadr, DOC_IOREMAP_LEN);
 		free_rs(doc->rs_decoder);
-		kfree(nand);
+		mtd_put_master(mtd);
 	}
 }
 

-- 
2.53.0

