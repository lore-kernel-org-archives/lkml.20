Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794594401;
	b=cBukjYmkGQzBqidGqQcrfT6SMpksqyi6I+k4DpfISWRj+dCBNpV8fWcTB4tHX2ajpIvW
	 BgOjScOPWg++Eia1eNsqmhjjJPN57glld6ioWThCLljc+Vk7H3GstrtNdDGEydCKn0QOM
	 sij4M9/s0s/+jaTwKFnx3unQI8IMOrV74PGzz4qkjnDH9BR1mI0vTNbxKe6pXT3m3rvd8
	 EXZettcZqwD/55KEWNNrFy5vtCjodtPZl1KMA2/Bd1V7TRolPZycUqPcII3fmYkEU2OaD
	 6f5x8iXON/TN6gegLpBi41R7Zwgo5qUsjzQlNgip34thJNtfo7mywauXU/8v7NFeURA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794594401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
	b=XDmKBV0yA+AnUw8R5G0IBWjfpgI+tqIpSn4mXz47EZqFDc8bnMzqDkudorKFjQFYym8p
	 JtxqW/A0SS3Q/qiNXsE3OpkGueHmOoJiGlZdgIUBn/Z8qtTODH5z4csh4yLRCEP+zNxG5
	 E2BlxLLvDduvTQj1MAjp6XAv/WSWpRVvJ6SijJ/Dj2E0n0e/DEmh5gwGkt8NCiGyfBkgC
	 O0S3zMd8hh2bzEZ754ltx/5wXlFBeG1o6qVk0Ywcd3lYyPcCLfVjyN4U5pl2meaNeOyKX
	 1V6kZ7tg49u42CIpP2jDEsJJR6vH4Cg3bSEme2wajEx51cGozaAoQRzwgnWJh8t5dww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X4NECe8D;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC167606D643
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC167606D643
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X4NECe8D
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4ad4072943dso399500fac.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794594400; x=1795199200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=X4NECe8DDJPRAAgFAQE2lMNWKqY745sXoPMzdFparALFE2hR2VTHY0hAx7uLUrMn5j
         2OnQLZClae5nhlyZElvvMsvooIBziFy/R29dnTw0g3/lcMfVHs8J/5258Ve0P64AqX1J
         WqvmNAEpQoVgoypB6pSuRZb2+ClGmCDwU17ZAZ0FqJ96LNxyX/0DLbNL/HyXpWzBY+Wi
         mgTnoz7qS77Wtp917c2mDOER+Q55gxO3DBpxFYlAz+cz2U67qXPaSbwyAQ9lWKIqsRNg
         75FXEfNwfJpPo6x1Xu52UsOFzYqMdTjSRAS04g7EOzana3gnrWDNVbMVlSOFqWnkQY2o
         Qing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794594400; x=1795199200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TgpmpZ4pfdhPSQN8Lt2sCe99k1YkMabGCeM8pnp6dxQ=;
        b=JxZzdpQWl9NOOLNwQENYBHWLJAcMYL6NeVB4rYX/0hgeWlpmOIfXljim3NqY60peMm
         spTe2NmXAhcPxSFogI74UH6iCxCCECIhJkxiN+z9IIbX3aqewk4XKlGnlQUnIwLlKq0I
         TPu76XWYVv1yNfXw+x38ZswN1GMioUjNlMeau+6VcFkKdKyJAetueG9neu/I8i83rOzp
         P7TiwGLmE6mzDW/vAMgXCYUPy/eWwOZOHPAZwSCfyfo8ayB09p9SIVWmlTMzC/TDMfiD
         f2PJOLm6KCtuRFrSZh5WsEDirnMGNkRlGNQSFubalQSDURKc1NU7YdjQQZsNQbBmZHBc
         n0PA==
X-Forwarded-Encrypted: i=1; AL+hErGYNuRAA8GWn7UDY9y2FL+2GLqeROGVSMB0n4TkcNRDJQr+V9l7BBZpjNxXY7Gcj741W1cieoeRzdNKuNo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8pvBXVpC6/uK2NY/vgLC83dxeDDxjssqUOtsyViYnFDTSLXng/
	Dq9xtqr/OC6w0B533v7+E//qZMQ0mCAx+b8f+Cg+LuJUOUox8u2NQXI7
X-Gm-Gg: AYBFou09+Ag7mg4p6sa02OEjtpMozf5HLnf42j1YErVtkhwYI1YpWNgw131TjUy8cLH
	qqFrE1mjZeib/4ujGoUPPFMQ+qEce6eROHatbl++x4ips/aRX6ZnPeaYmvBKu+ZYshZ/F4pHTmq
	ErZEOUDKCnazRexOsDvLk3bbSEM4RDsQ3qXEzYsHwIGVIRE7S3e5WXfiNZw+nxpIZ/gA3A/26Sf
	4lgmxRAicJy+o3kmf2CK6sAW5dMZbu023JY9/YmFnbjcyK//HsloCbVv5An6EDhWabeei+NVzmK
	px7iYGTv9ySU98QNZrETGUxa9zwdbwmdlKDi+9CNm4xgZZNxTsmzMJyqyxV59TTLI+bLtINPuj8
	ciInfgKq1B1c40RdKHzxFKe3LAgyyTV5MQ+PNDluaqknrkprT0vnmgPC7SR9powEGPQJYdJqwCk
	m6pi8TbqG5NdJjLM5Umwwhx4/U4/JWzKY72i0Hlj092/5N1je7au5iLG4Y68Dtz5fJMpIwJRLUZ
	xXCHi4vfipaALwgyzfcQph+jMi4JN07ZcvjAlbx32eHBws4itBRYI1qcqJzpmvF+QU8ifAYNcQp
	2ECAdhzS9AnA7EtXLqO9v2Z3HpJlSnbovtSmFhGonylJAShE7i8ro+ufF98Cy3b5Pk40pXATkju
	9RuwxGcum8xLDpBAJsSylJzRj5vLBThs9esIdGALBU9gNE9U7EQGngEc944Sf6N9e8w4oVpPi1F
	2WzD6F1gAeO6gbGWLoys5sw5v7Ku0n1xCmrg/2Ddaxmir6MVsN20Q=
X-Received: by 2002:a05:6871:c91a:b0:483:b752:633f with SMTP id 586e51a60fabf-4afdf450f19mr3178899fac.36.1794594399654;
        Fri, 13 Nov 2026 10:26:39 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2011c25sm1887061fac.2.2026.11.13.10.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:26:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:15:14 -0700
Subject: [PATCH v4 58/58] mtd: rawnand: diskonchip: retain chip state
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
Message-ID: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-58-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

