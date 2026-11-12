Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446947;
	b=1dJDeR7AxmCD1LQ9p0uOU7xJkGWGskTkf5qD6LATAZ2TmevuANl65uJeghBqo6aanv9b
	 /Wf8YQhmPJwGpk8BhYLhmhAK2vzgB7FzuAIx+R81+LYlxhV5qvWDE4RuyLztvA1VctcHD
	 yijj5jgicKwhRvKBYEwZZAjw2tGfnNh2faNTkgFiMciUbzlafucbj7lI7P/oVcIzfmK22
	 KjObgog5x1leoNu2KCrMfl8kax6NtbD5rkEVxiBu8jDI6rKH1ZGrFd+9DKvQ73E5fb0My
	 cMmp4IsUh/QXv6yanc160GAqLROpUDGv/z80RGSxG53fl2BJGxq9vOkK01AWLFikf+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
	b=LY9yjsIehqH0rtYgCExzlr/zpNll3bEcmP/UadRzRuy5LvW075glF5WIW6Ib1KFv5NLN
	 /HmCC4qk2nsAa6I62LnI/bxIwGCIivrk++XpOuGMQrxZwWB9S7+Oa2o0hqRBfv0JfjuRZ
	 AmilX554o3vuZspmW+uyP6ATh4mtrfaEIaweXlgQiCuTVM10DoPkzqzWmK03iAMv7WgnK
	 68v1n8QxmydqI4UPP+AHJkB0JP+nSys26Dwu7TDE+R8FRNBJ/3c+lKireFA7T3aLggCfh
	 4PqPD6XX0sAQY0XeN7CwWWpy3W0Gay58emrIwwTEsLIskNoo5ovb5c0lR72UMdlBCjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3zl7AdL;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED87606DDC4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:29:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED87606DDC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H3zl7AdL
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4adae3eb4d3so1586824fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446946; x=1795051746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=H3zl7AdLjwaYbFovFj/LwOqGzIIBcKr8b9NzyVFftnoIG1GuKnn8OySIzhfPf780BO
         UllJhaj0ejIVv8c5vGYPwH1kb67Fkl05sRatxsm5/lFlOTKzLskB/ktUwtpUuvbj5lX8
         szi3zQD8XgKkUvJ8NjiWy0/VYzORsMNDbW2c0xKL5FKufS0WMdIwGFnlHsZl0j5tsS91
         errEwskrA2l8kGeW28va6FGHkqafb/yVXSaC4JQzTpgCuinLVjUjqKOcTN7r5pUEEK7d
         T9mVYTRdtzB+wNiVYYy8Uwg7KkVEeoJ1NABq/1gXELBbX3sfkR2Sc0TYMkYDjouo9UST
         /3eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446946; x=1795051746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=go3DmRJz0ufN3WhmP9omN//0ezXGoCBxRhZGr7MYk8U=;
        b=fmenT3VRXP4UivA4JtlFSRkMPVwkg2I/GVfdXM/hAXi73lmmVRHJ3hNb1RXPdcItP+
         oHqr4b47xZFO1+PESVOnH6CyM/SuIZk5Ae5Q4RD55KX3n3pJ3ZcN70Pa37Zwl7sH4Il6
         bdcgjKNCHov/beaCaOq7dckuS6E0vSoi+HVBHtIfS/JYnwtUGSTRwD2DNv3NyhrHI9rO
         GfMyN6GFS/O+40rQs6npAw6s0klAh3AN1q5hZMeZGza6j7fbNAoc/EARSPa+VrQTCLoi
         Quc+i6jRIdg26Q+m63mVHxEJBhDkOlI8V57bl7R+g3iCyr4V9BF4xaK8bJ6QwSJaaJW7
         b8Rg==
X-Forwarded-Encrypted: i=1; AL+hErHcty1rgYNU6OLx/rJzFnk0R1NBo+eBzDHh5bhikR91U2wLdJF6wwPxyfX8XsLIUSwiw2pdby49ecThP2E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3sgSlEWMRlMlUFXinov6FIbOmPAfZvdlXwkrQGg1LgadixHdo
	KjnxyBsDZM7vu2YkMj7H08vxIwkYanBB21y2Blr8dXVvH+QoLUzNdaD6SQZFTY5Q
X-Gm-Gg: AYBFou3X3PQwEl8v7Zqw5idx7u3EcMl0Nzgk6YRYe2FIsbbk14smckhbl0di/6+LMJI
	34ARUkFn9j59N4V7f+PC2jiMUt95os+dL8YRai7DAesVu/n+h0vKl8b5rMUHY4gojMlPPZSGaSw
	hLp/vHzH+5u8Y5IlHcw4/mR9UEmmlgT/h3zehRzpoClullkLd/4HtPpXN1HCsChn7CzO+PwOYgA
	EIj2RC8W3ZSgpcua0mzqV6wOJEHysi2vKiwnsFYGBtNDW6wGo11o5KOKb4T2Sb7/8VvcIvOVTUM
	EPRVuEUH9gHVmAb/JEzqq6Bzy1Mmf+QiS5V+JNBNkG15aHzusXTbeV1hBsUXM9x0ioiJ9e054VO
	9xn1h3qYd3jXEiMrET9aPIU6I5rZYpmr4qWJg8Pla6zChCGlhy9uzzpASO1iHA+UPtb64qi06AK
	/oUkj8aWBiNmZ2+EK8abyOBQqXpekJaSSsL6c+ByVt82epbG6eoS6MBGnUliQNRPMTHdwxPwBHs
	YfN+2qWkLrWkWReVC0VqhnuPw27TsbOAGyHUiWibTyUPXVfVxO24kp8/2tsf9okasOZgvOQSyK9
	k8hYPCTD55IEs3auFW0X5nDvr4OAzIKS/fQtNwZCBLiTIL5GYUcqg3/udjmQPqB6wPuw25Kphk1
	S+4ROjs1l7rCjoZpZbRb1qM0JBH8gH6n9mkgPpdDzPWzfanJBo/WazCR1RJqxQ4axcjlKKPEfm6
	+83GBMfo92q5lbNhythE/nUWVBmwkHs/r/YC5wPhueeOh5ZJz9ROjx
X-Received: by 2002:a05:6808:c2b9:b0:552:9d62:f1b6 with SMTP id 5614622812f47-56b9803200emr3687194b6e.51.1794446946279;
        Wed, 11 Nov 2026 17:29:06 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:13 -0700
Subject: [PATCH v3 34/58] mtd: rawnand: omap2: retain open-handle state on
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-34-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Keep the shared GPMC lock for bound devices and separately retain each
device's allocation. Disconnected handles return before touching that
lock. Finish software BCH cleanup before releasing DMA and driver code.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/omap2.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index aee7df4d768f..12a978f5f724 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -142,6 +142,7 @@ static u_char bch8_vector[] = {0xf3, 0xdb, 0x14, 0x16, 0x8b, 0xd2, 0xbe, 0xcc,
 static u_char bch4_vector[] = {0x00, 0x6b, 0x31, 0xdd, 0x41, 0xbc, 0x10};
 
 struct omap_nand_info {
+	struct nand_storage		storage;
 	struct nand_chip		nand;
 	struct platform_device		*pdev;
 
@@ -2218,10 +2219,12 @@ static int omap_nand_probe(struct platform_device *pdev)
 	struct device			*dev = &pdev->dev;
 	void __iomem *vaddr;
 
-	info = devm_kzalloc(&pdev->dev, sizeof(struct omap_nand_info),
-				GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	err = devm_nand_storage_init(dev, &info->storage, info);
+	if (err)
+		return err;
 
 	info->pdev = pdev;
 
@@ -2282,9 +2285,16 @@ static int omap_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto return_error;
 
-	err = mtd_device_register(mtd, NULL, 0);
+	err = nand_set_shared_lifetime(nand_chip, &info->storage);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_register(mtd, NULL, 0);
+	if (err) {
+		nand_disconnect(nand_chip);
+		rawnand_sw_bch_cleanup(nand_chip);
+		mtd_put_master(mtd);
+		goto release_dma;
+	}
 
 	platform_set_drvdata(pdev, mtd);
 
@@ -2294,11 +2304,11 @@ static int omap_nand_probe(struct platform_device *pdev)
 	nand_cleanup(nand_chip);
 
 return_error:
+	rawnand_sw_bch_cleanup(nand_chip);
+release_dma:
 	if (!IS_ERR_OR_NULL(info->dma))
 		dma_release_channel(info->dma);
 
-	rawnand_sw_bch_cleanup(nand_chip);
-
 	return err;
 }
 
@@ -2308,12 +2318,13 @@ static void omap_nand_remove(struct platform_device *pdev)
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
 	struct omap_nand_info *info = mtd_to_omap(mtd);
 
+	WARN_ON(mtd_device_unregister(mtd));
+	nand_disconnect(nand_chip);
 	rawnand_sw_bch_cleanup(nand_chip);
 
 	if (info->dma)
 		dma_release_channel(info->dma);
-	WARN_ON(mtd_device_unregister(mtd));
-	nand_cleanup(nand_chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id omap_nand_ids[] = {

-- 
2.53.0

