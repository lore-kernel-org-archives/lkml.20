Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296726;
	b=JdUT69H9OqwB+bn4RFT9Vb8lUruLT2JtWEc+++o0vN9Va4pLyABuhD1PJnutGz+/E011
	 JOqbrKhEup51JgK9DtPnbQjfFUqJ8+fpYLvRdI66ESkXffaRB0oxuew1XGwoGrnftQWxq
	 M+FIEmLdFuMO2yFcl1crDxZKr5su2d5uGBV7T2mlfI/JzGj9v6XDyvl+2uV3k0TZsr1Ki
	 dALCJKqNa8XE0u0xuC6q3hLcUGMhK5cXr8bvq67xTflG14d5vSZUPAVRl4EBBZQLxspZL
	 1wnHk7jzg9rlE+4zw14pBy9thhXfAEoRVr+quY0iCIRX10hQ7h1uaMIV/snzGrkw+XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296726;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
	b=rMUVlaP5Gmdo7LgRd7teQ/rBtSj/cFx7pY19SDPDIIHEMNsOvF+PJaVWS7SYTqsXXcTr
	 w4GMVvGA96DsQXRG7G3S5l7tG5h+h0WUtWTzbhAQZU6T6izxsvHBgv018qMqFGioAMu5/
	 7lCWIn7YgqwQExDdcMXUuzjm/ZK7yviJVbst3srEt9kkwz9VV8IiRmdGfS0ZwLPwAIRGk
	 4g41XccYY65JqYns9yWWwE2mits5+nFyTFiMKjcPmaDDeHK0yePtamttdx5iPDlj63Yg/
	 UNwlCiCdIyI35q5+qc8D2PKbyRFQMRTPHz9BTLWQL/YjSa0xhm/hWTTr04kUqTRNVCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIPL1AVr;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC70607620A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CC70607620A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AIPL1AVr
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4ad4072943dso605127fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296725; x=1794901525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
        b=AIPL1AVr6ix3Hap5lhNIJosluN/s9gCJb2MTF5Z92cXTmjyR0QijX2St+ZJEKdIzq7
         pOi5RP39LZcei1/un3R8Ucjc4wnoWTzGcL7QDpPvjHt7U6CozTBreeTNA2f9V8TLCDQy
         cy7fTdMnOhejbMVJMdEbBnAW782EXM+AF2e/0Lx0ffA6gh/4VsD1+eOo1Rp5tXGgoUm5
         I2SYNZVCrTcoEAs3PwWDWB42lKu+tFnihGHchwPB5ZZkA/5JtwlXzxDzb6noHZZqn3ad
         Z35dav2fgTSIUrk/FgUwLOV9jKeLTNPizHckpG5F2SW00wb6puspTu3lE6vDW8udF0Oc
         H7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296725; x=1794901525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxRoCKaLFTMBGcFqcbl1lD4jLUh8waiooh35vSxr5ng=;
        b=2FrD1pKnq3Sho4WBVTGU2ZeK09xdiSSLhSN/lDvRTGUrgKjANRFHTt5htfJEHqv+fr
         6CbS0fu2yoG/ukLKgGEtXhSZt/THhVf84qods3GRhcjmOZujvVYSbwqESVPJFMZxnMg0
         oQ+zTTSjjkDMsFeG2GjSG/qV3gg5jKCim1ESSpKcunBTYbuJqdyHnlQt0Ir3OiSPx3Sz
         Z0o8111hWHeDm82zS81uoWIiKhGNpVW+SteAXcovJQyx3fS2hdpu1ELiEtBoDukogWKX
         wcSJB2M2nFbGU/qAY1SUNWW9I9UwUfAmTdBisx+gEI/7sg75KSZTYBC8iy7DFxzFUNSW
         yJBg==
X-Forwarded-Encrypted: i=1; AL+hErFKadxZlYY0qWdSQFdyXc87VYcoFKI4WTsh32eX8CzaEOp+ABcKXpi6TPXJXxJuLZMbVWUiYz+SYN2+0i8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DyUE/68nAmKpQ/FUUpK1Uj85XbatqFshgd0lUPYYMm9CqX9gJ
	eWqZMtfhEmfZ8bA92ICw3xzNxepfNpO7HU78V3PZ7D1RCExCX1o4xJXwBabgS/11
X-Gm-Gg: AYBFou0JfzdwF1AZpOW9Jxc+2r0N/Nbw6KAVPFfyTLo11lx/5hPg0kscLFY8LMLw8qx
	yDo1lWVmJq2Hnuc73cBf9T5k+878orZ4FBHSrkb8myIyUcyPHyXvkRJ5B29pn53BVXEUh5sgYYv
	xiGQS4UkgCkmUzSNUGcRrlsg3KMWhvGqJVvlvmu1eMzUWqzZ4wP2tbAzI+eRwWdhdT3MXqjI666
	64hOYuk0kHf9nWzUQ35IDH0pqquY/faKIOjai8yLtYzOoMSIri+l0nMuub/xQW+EhoaWrdRMd4j
	PP21nzOyGrWHD+0wduGPk0RR8HH12JI8D9SnoYV34PjjgzH9W//TAGEqRNKS17ywLelAaobGl1s
	W9jFZ7j5yFMgEw/hRuBsHN5b5NK0hnxCHFwFAZ7Ln420+jjxEpz8lK7wRI8LIOHnXdmAroZsVSJ
	IGf+JsDZCWb9ikvR5lb1tp/2zqWsB9Mc74K4Mb1qUnR0MWaJ50/O3EOWHS2KXVxBh3r+3d9JsC4
	FMGXD4DawqP7GjrmJa0DzQiXQiWMcIO1ySusQFvLBdNfuJ5+7nKfCAUQMdtV/T2ImvFdx6yRpNT
	HkA01TELCV+L1k7jLUDJ/+JHznHTqE+JsSKtB83zBeDoiVYdLW+5qZEmTogh67fsaDOYEfQ7XFS
	2bqc/b6PkSvqRnCZ7td7BDem8eC7jeY/es9kBrhEdRL4HQfVKzSeGEMJUu3r204cSnPMfy4EdiW
	zeur9L7AeLhw4gENuUo8y3+b5yFS+L82k7a3l/5UNFB/g+63jjPyUbyFSGSPaTWTA9J5jSUJXy
X-Received: by 2002:a05:6808:1527:b0:4f3:e98f:fa19 with SMTP id 5614622812f47-5683cb83119mr1326842b6e.61.1794296725316;
        Mon, 09 Nov 2026 23:45:25 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:45:01 -0700
Subject: [PATCH v2 58/58] mtd: rawnand: diskonchip: retain chip state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-58-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

MTD device references may outlive unregistration during module removal.
Disconnect before unmapping the device and freeing the hardware ECC
codec, while retaining chip metadata until the final MTD reference is
released. Install lifetime ownership before the late initializer
publishes partitions.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/diskonchip.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/diskonchip.c b/drivers/mtd/nand/raw/diskonchip.c
index 540b6baf8bb1..a4338b51b49d 100644
--- a/drivers/mtd/nand/raw/diskonchip.c
+++ b/drivers/mtd/nand/raw/diskonchip.c
@@ -1296,6 +1296,11 @@ static const struct nand_controller_ops doc2001plus_ops = {
 	.attach_chip = doc200x_attach_chip,
 };
 
+static void doc_chip_release(struct nand_chip *chip)
+{
+	kfree(chip);
+}
+
 static int __init doc_probe(unsigned long physadr)
 {
 	struct nand_chip *nand = NULL;
@@ -1494,13 +1499,21 @@ static int __init doc_probe(unsigned long physadr)
 	ret = nand_scan(nand, numchips);
 	if (ret)
 		goto fail;
-
-	ret = doc->late_init(mtd);
+	ret = nand_set_release(nand, doc_chip_release);
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
@@ -1535,11 +1548,11 @@ static void release_nanddoc(void)
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

