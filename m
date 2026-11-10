Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296684;
	b=dsAAjMHjAc1rPdkRKc7rjVYqPwTtZ7xgN3Xcc3XOYCs3mKB1HrCGuzff3r72WSr+xbqt
	 3Q5Qsjo39E8wLlwaHkpLJ1MkBVTih/boCSXLnO6115CM9hmAZs2yaOxmrvwn42PcJVRiP
	 nnrWM1b9IpUC07qTKo5CrlLg6cXw/c56iOkFFF79Tx2AZ4TnNNcXIYSn+CNSooK+sVVZB
	 VqM7RuIMTgWaQiT9L8mCX5KuttAygVYLO8jSCXGQb1y33SvDcLbbPZdH4brROcUz10SpR
	 cr9Zzdw+Lpx33Y4YQpoj7te/oQ58wOdYV5jlBvf6vOCGFjJ6AFzQ255bpMNWYpDAawA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=gbLemVA0S81lePI8F7OzuvibNjd2gN3A4gCLsbuFnGc=;
	b=QQ/a7nq+4JaORI25s9wuAE4EJN68JIZlzOpQEtumNIW5Q4T8f3oVDvlIQ5T5HW+5GSZX
	 JOpUbs4vMbGnFMCPScDHQDl4Bg8EiYI5AYQdx7LLp9w6+ONwHkKnxnoEepcZRZUIMWrgl
	 1QT7/G+/FNaI5mfTNADD4637uptMlNf65dGrc1BAUslyoiRybKifthU9LhsxmVkVFdPaH
	 yDakpYVnZ0xKApCQCIQ+wvyQPRVd0YHK43abYKnablgEOvPpe3g0LIVcikBfW9Qwky28Q
	 SMrYhs0v2kRjtwkgk27NymchtVUwmCrXa7JS7KW0b0+6cxd7rRKb+U7ygSgZ6hByiqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QUR7u92j;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E00606DF64
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5E00606DF64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QUR7u92j
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4f55a53898cso800662b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296683; x=1794901483; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbLemVA0S81lePI8F7OzuvibNjd2gN3A4gCLsbuFnGc=;
        b=QUR7u92jOVHx5PSDow1c2Npr+o8rccBJ37FuQKL6Vp5JWaeWj/MuS4XMvYPEWCbs18
         d0Pyes1y9tuNnPRhaTNlsPpx5d+sLdzK8pgVlyPZXnVvZhp5jhOFIdX9kkr1MHJzFfYg
         cYMQ3cZh7GM9pKAr4kp5a2ND8ynLBKoIREniiu8/vmF80TclbxEZTSl+Rxctv8m6NESU
         2foqrMSw5Wvncjx0r2C0vWKW+nz6O+pl8CzOhbNaGrld0tYbPJvPI6vP/WeLf8qO+g7e
         Z/GdGjKHmN0XED7dZ6ywbmibbt0tJhRJXFdbncmGcH0eBiLMj6r+rAPiYokHRShlzpul
         bBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296683; x=1794901483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbLemVA0S81lePI8F7OzuvibNjd2gN3A4gCLsbuFnGc=;
        b=QaXl0BLD3NhqkihFB8sdqe1pIp0AACSK2TAL6MVde8D8HRN+oOQXLCBY0vyk8eVzRM
         9lVvt/U21QECVwhMz/ZN3x1mk9oO5bopMRnWJcuBtWOn7QJMn+MnoyT15xB4478ydZWp
         PNk9Hskk1vSV8XlUPQN1SfH/eXDlkapE/SHaYBFGeDlVwl2ld2Jh8N7kvcXJSmmqlPNn
         sBaA0XN7DgdY+lZ9x2NPqE0JwPs1rtdrYOmHQG0lRk/ZVtnuJ9jaycYxlDYPTXGPVPHj
         5ka6XS4aas96IPdGIhaATIdtKVOEfeO21NJDjtZAi9DwlaqZTBJPfASRLW3uY6ko9zRi
         X6CA==
X-Forwarded-Encrypted: i=1; AL+hErEy/8iyPCe6kADV7s4JE+2Y2fLeeGnM2lpteGRkuJMHRsRA9WXdd91ZcxM1qkPoG696jtROQhJFxT9c9pA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Sf+wB2WNNX3CscgLNrlwSQ6rwU/UOWyXT+k0Fi1e+qSO2adg
	9pgYMeORs01GIQJ1amA6dDQQt+KX3ZKZkTTanY2H8pw1czQo4rKSbzJCo8ejuOya
X-Gm-Gg: AYBFou2ohCs3HF0l33I2jGrgPvY5zOblWKYxpNI3PQHNgaR7dKB4RcJlUEghKCVPeaB
	h3ucpAYr3mjc8/j6uslawaMMLBx0h6lu5PM1dHfHptzy01hP041eTHcC7H3NlQesxTJmKIQP42X
	J3c3Yx4ANEqvoD/e4v3J9b5IWjtIvQY5Dr6iRNEJFWl4ZwR+lcBkMojI106J4C4URzm5GVoFq98
	/eRNkyJwkWh6MkYk+fqUnxE7kSzhDb9wQKwRHKg7sM4XOU6BRvuRKC3WDziWpb+gR3oxrMg6TEw
	9SuHeKIBXhr4z7TF3VjODqdhChIqXBrIBKoHCf7AVM7ItfQKGEhPQ2YQ31lsNFEOosFYz1skfVq
	Ztx+9rFy6tWX7S8OiBAD4vZc0NhBhbws9DlEYCnc8+Av7tkDkIU9Abve+MS9DAQVVdhLHGSvyNa
	othPctmhYAaSJBsEF2r3haVGsGeTumxkpc9DImgfzADg8rbcF5RI3vUHe2OxcFaH5qXLcNjFrJK
	jH1/dQUa3ENJyxAPLlz1CqjdZTiZaeC6i/+rB7EkvRLNZmAn95hFw7AbDe6ElWX5hKlyCgnS1uE
	j3maGIGO+JkTR2H/j+QtZk91h3w/aPb82OQHsIEsj+tA2k77cLVtD38KcYewoVrDLL9/xXrRtJq
	eOnojRbi7DgoWg93Txo92RlTFPwNr1mqBGmzfO2qsz2MnD2maaGr2ant0huU1BlKvEfWgXPmrFp
	SW53KluwL6a3E8OmMcSV/fK80Hhn36eX+uyraO3NCP3aB1VnoTZPGUclAKZc9OAoRNchs+PSNYC
	A==
X-Received: by 2002:a05:6808:1991:b0:4cb:f21b:6f91 with SMTP id 5614622812f47-5683cdec02amr1507985b6e.36.1794296682645;
        Mon, 09 Nov 2026 23:44:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:23 -0700
Subject: [PATCH v2 20/58] mtd: rawnand: socrates: retain open-handle state
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-20-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Drain operations before unmapping the FPGA registers.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/socrates_nand.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/socrates_nand.c b/drivers/mtd/nand/raw/socrates_nand.c
index 668584683ce5..f2e82f2b0fd3 100644
--- a/drivers/mtd/nand/raw/socrates_nand.c
+++ b/drivers/mtd/nand/raw/socrates_nand.c
@@ -131,6 +131,11 @@ static const struct nand_controller_ops socrates_ops = {
 	.attach_chip = socrates_attach_chip,
 };
 
+static void socrates_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct socrates_nand_host, controller));
+}
+
 /*
  * Probe for the NAND device.
  */
@@ -142,9 +147,12 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	int res;
 
 	/* Allocate memory for the device structure (and zero it) */
-	host = devm_kzalloc(&ofdev->dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	res = devm_nand_controller_init(&ofdev->dev, &host->controller, socrates_nand_release);
+	if (res)
+		return res;
 
 	host->io_base = of_iomap(ofdev->dev.of_node, 0);
 	if (host->io_base == NULL) {
@@ -156,7 +164,6 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	mtd = nand_to_mtd(nand_chip);
 	host->dev = &ofdev->dev;
 
-	nand_controller_init(&host->controller);
 	host->controller.ops = &socrates_ops;
 	nand_chip->controller = &host->controller;
 
@@ -188,11 +195,17 @@ static int socrates_nand_probe(struct platform_device *ofdev)
 	if (res)
 		goto out;
 
+	res = nand_set_release(nand_chip, NULL);
+	if (res) {
+		nand_cleanup(nand_chip);
+		goto out;
+	}
 	res = mtd_device_register(mtd, NULL, 0);
 	if (!res)
 		return res;
 
-	nand_cleanup(nand_chip);
+	nand_disconnect(nand_chip);
+	mtd_put_master(mtd);
 
 out:
 	iounmap(host->io_base);
@@ -210,9 +223,10 @@ static void socrates_nand_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	iounmap(host->io_base);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id socrates_nand_match[] =

-- 
2.53.0

