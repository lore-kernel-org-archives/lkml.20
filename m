Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296692;
	b=qH87k/kq5J8PbyQRB3M0phvFFuvhgBWH8QGGOC4SOAZ64Rcd3dgkojoPVS0Qs4ZxcvMg
	 XIRdSFnhoSTJYS1aF9PzzqCZzFcDv+mKncvXRmPPB9ccDHILkXefNv6UfEQ0tvGKpXbO6
	 2n0ZyDsocNddtMrLLsCqFoI/nEsOGTTHb2783XBIWwcgOBHKUzujRL5yAeQiagq+3XMbw
	 pV0c5OEeI/eiPL2aqxjh9Ba2cxQ+Zhu7rF0f2mJTmwcA9H4UDOv0WFXGzwk9ZB+YogLaI
	 Cd6Ywt1st6SiMtypK0cGAlFkDWByHTN4KWfZE2ag97sk/xvpTGTvFRIjemiCLTYkGEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=AyY1jP1oMEYFE/M/Qd6YTaMB/MnEzyz+OC+KFI8MPuM=;
	b=cXRy799tYHt3jeFeqGevle4QpAbSDXLv/MOkI2aSJkcV9ghj06upoZ5AJx7onvXjX14w
	 3w1TtRiXxcj+FU9DZHoEibOaqs0jsbL9tq1YbPXrrAsH64P1PzGrsmCRanpNg5kQ2V59J
	 gHPBTyBWb30vx4XzT9DwZDDEwMRIKHXYEjbsFRsfd4LPDGZqf3P06Wka7oCPjjhXPdfpp
	 YcEFYirQrxpJ8RKJvHX9zh+WKFKFoRywrqoJ9qsXEcKEt3QurhYi9l2stySUGe1kJb3Zy
	 xo55VTlJgUQraNHk+WdaeaHPpiB3ebikhLz4OE73G9cbk7JTosRAcihtzNayy6TnaIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omrms+AZ;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62681606C622
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62681606C622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Omrms+AZ
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-51f2e9e6987so1035575b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296691; x=1794901491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyY1jP1oMEYFE/M/Qd6YTaMB/MnEzyz+OC+KFI8MPuM=;
        b=Omrms+AZUV6FVhb/wSHXJ6p0IGxEiqkzAXZu+LW5Xf57h1bEkTnQP58Do3WSfEdFqi
         pKGg4Vj2PCyJThCKx6MXeokDA1YaNQxMHu8ESWQFwiJifezWfVfIwbPGEss+hjlQPUie
         Nm5h5arqGKfHqNNeS2EnES3MAddApX0QkXGEKmM2XxeZv0sAtnrfWA2f2X9sO8ZUTyjw
         /8qmhSv/T0skd51e0gW8DSAtCZeZVLFV6aYqfqR69lxWgFKkprKXAbiwiVmdjK5BrkPP
         8TNT2xeYC9EVBJJpDgHwbpvJVEsCN+e/lSk6IpTDk3e5FcFLmXou7O627f74fhk22k9n
         zk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296691; x=1794901491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyY1jP1oMEYFE/M/Qd6YTaMB/MnEzyz+OC+KFI8MPuM=;
        b=ciTHoy/njaAufSaVZ+F+Hqu3lM99KY0/LKVaIaNHMXegg+q6d/Hl9u7Xuf3cksrd4B
         vy5+PlhyuZOdC2MQbn7adWpUz0riLejA0Hm4pjtUvjbmLD8DnoPPaIVQnbL265ObHHrX
         di46F+rqi0Rpbb+Wxgrweq5WKSIg3dJRfaIxaRdf+wr/6pScxm4+x1NLkMkK2V5D1HRE
         zjXg0Nn7xCTjfaQZQTQ9brUfnuTonoRfrLAZV3fIHMdSQAgTYjI7scb8i15eW2IJ6wdG
         650V5YJA4Z3OYednZZvyzXRtThulegDjgwImJC1LNC2WbXp1IiYIbgiOHhQOpbNDGv1B
         XCeQ==
X-Forwarded-Encrypted: i=1; AL+hErEERUxaBW58E0Vu/V/mRAtyuWct6XAP/Tr3U0lTnF4dsDug5ZPH6Kl15hmsCFG0QBwKNhOIbtAWhqgDHr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+RZmrRb+pO6J43cFDnBfKXtLA4jP+BKE4XQFTd58lnm3wSgtNa
	gvqhUbf4M+bA2nXPP7fzDHzI/P36Qj6821EN/mCuK2KD5Rolm7X2a5cPILxidwqk
X-Gm-Gg: AYBFou3h0lLkQNuBne9wR/ZnblvLiiXqzYEEuKWtZpyZrP0iEJWM3bnSEjBxrN8mEnk
	fKSZL5Fear06gRBbtuE4WTLxRvKy7H93+kzDOqXunXrPXcj/gUvmM2x3TPcVSfvkerF4FCE93mJ
	zNhEPJzKojqCgKJGjPbHqfbDQw92UTWhOqGeHPLrc7u8xRfkEX5vy8XLzrtLDnGiCYoeAmVK+5F
	zeDf4y2tu21Rvv1M3/voR2VKesjl3Bl4uSeQt7nI3g6VEzei4eAkcetIxDCBm0TwU1z5pLLZdWO
	EXR/mOSg/PhpnY8W6q0ZJKii4MQuss6HNbXk6tQM/C4mX+mp5FyBz5BnrkTdgJA+Vce6WvVJWOm
	W4Ynb+ms+Y+YOPKJF3R+BkDBNpOJzjZssJLRGrAP88tsSu14CqazGe7BD10xiiT4q/DM/zg9Xgx
	skw7kTN8dyWAWz9nm7W3MRel3tS6kly6JN6DpDTUaQwcLB6auegM+X+81ffGS3ZaAWGhJ1bryNc
	DKUcLJogRSrMKdgTSBMLTXThE6u0sfdolQS8El88QvTU2SVxeqeLHawN4A+nJ08xZ+kjrPeQX3U
	RCfQgDJ02fTraET8x17Y5bF6C+BfwlMdcLhZ2+nrEPqsztn0e73J2asUPwrQtqboklvwGnqGYFH
	wjJD/ZB8Hw6AHBkMP4x4n9uOvy+QTzTfgbJmzUflCemAeBIowd82R5AZMrd0CSvMTCsZbBUAte8
	cD++uQUXhaGGZ+m1pCWB+rGag5nKygfnrm2OodVtOQYCqRot3RlfNEAPrVCh3XIYcSiNstoAKs
X-Received: by 2002:a05:6808:1822:b0:496:976:acad with SMTP id 5614622812f47-56872834d04mr830298b6e.1.1794296691244;
        Mon, 09 Nov 2026 23:44:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:31 -0700
Subject: [PATCH v2 28/58] mtd: rawnand: loongson: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-28-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>, linux-mips@vger.kernel.org
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Disconnect the chip before DMA resource cleanup.

Cc: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/loongson-nand-controller.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/loongson-nand-controller.c b/drivers/mtd/nand/raw/loongson-nand-controller.c
index 8490412d5be1..49938c7b9453 100644
--- a/drivers/mtd/nand/raw/loongson-nand-controller.c
+++ b/drivers/mtd/nand/raw/loongson-nand-controller.c
@@ -869,15 +869,26 @@ static int loongson_nand_chip_init(struct loongson_nand_host *host)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to scan NAND chip\n");
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(chip, NULL);
 	if (ret) {
 		nand_cleanup(chip);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return dev_err_probe(dev, ret, "failed to register MTD device\n");
 	}
 
 	return 0;
 }
 
+static void loongson_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct loongson_nand_host, controller));
+}
+
 static int loongson_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -890,9 +901,12 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENODEV;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &host->controller, loongson_nand_release);
+	if (ret)
+		return ret;
 
 	host->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->reg_base))
@@ -911,8 +925,6 @@ static int loongson_nand_probe(struct platform_device *pdev)
 	host->data = data;
 	host->controller.ops = &loongson_nand_controller_ops;
 
-	nand_controller_init(&host->controller);
-
 	ret = loongson_nand_controller_init(host);
 	if (ret)
 		goto err;
@@ -938,8 +950,9 @@ static void loongson_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	loongson_nand_controller_cleanup(host);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct loongson_nand_data ls1b_nand_data = {

-- 
2.53.0

