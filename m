Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296686;
	b=q1s3Er0EA/zy8D2jaK+bPSHXu4JEOhR9MM0GnaeTqN+GmKkjWZmkRC0uVV7B0GiTmnJx
	 +nJjdSYwoPFZS2UgQbAwO9cYt2LVqXs6UptmLzjUZEyeQ9MFi9y9C1n7XNw3J/r1ZqTUq
	 vnYpWLhFeU4wdemzvcUNoPp3aPvJtUcdaI52hUvwZONx1Yh2WGGSxlPu94WKGA32d3wBn
	 cvUep1ZrQmV8aP5BcBhiskIHosqQbQHRcjfIy2cMuLJDR2R1rnIqVfG7Btsl1Sf2Z6bnF
	 TB+4oEqxufQSHgBP5AoltiuGHVqsBrmqwwwcYTTyR/IL04Iv4+t6IDtXmQx7kLkTKDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
	b=D9gilvjeI230e7gXAVSbHe8EUl1U6/vhPWXqJQV1fAJA/9b0bjsfuiccFs/86LQVHu+n
	 bwujJEGXFPXk/a1q2RPSNQy+zvpe5sMpaVjsIWSOo9eDJZwRxosx4azDKdlwpd+uey06z
	 id03qt0zfhP67JlzxcMwk1bUvuGTwQHWmfSVku7N1MULoLauyKy+EessaR5BECsdv7hRQ
	 2MxbQhRuls+Pc41k2WzvajDGoi40AY08xiFpWxX9Z/Jc+cl++BgE2YTABYW3JpQRoOXa3
	 K9XkfXOfBmq2oUKhgXqEOPd4BmoOXrS0ECEtdRnCBVNuC6BAnJx6+SvNghb4mkWKPQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MH4N+qxU;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5696606A947
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5696606A947
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MH4N+qxU
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-70b875f6f13so1343979eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296685; x=1794901485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=MH4N+qxULzl+yA0yZwG3ZQIez8wSFkJzQOuftbwNV+xeMnP7Lo3dcDbHZ7ypyk/15c
         n6moiUyZBwDJllMP86C5prtsfowzuWTu62LTi+WVqoIvC8StQ4zScSojPYDdf9yyoLjL
         ge4W8y6jn7R6aubkWG2yGv46+MefCryz4171EQJRfBF+h7cwBw6iBXCd+lLyYToRwoLs
         8elZLd/eZGp+BkmnX64weK1fFxE0o6AtmR56YAxn92Sd30a+V/dKz3yhGTStWo7rdble
         wfAOeMALYJLhfL2uhw7BWTMBQo0RMIOY6q+wKWAJwim+ighx1LqrVQofZRb/z8XxUXNk
         oQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296685; x=1794901485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiM3FdgX/n0U5FfSnJDnohTAFRzhZZoozip4F2zbWJU=;
        b=mFSVOuKjOiySlSMkcYdX0u2zFMn8a92+PaloWndti/plDglhMOBZGhz6ccqFqw06uB
         EXxU+R0zMhYjL8GLjw2HMRW6uSsFRa7T4iSe6zqlCTbeC2yz/UGE+F/DXKeMaH3odsBh
         FWoHpRaNJyv1NaVanhIZNxBGELm0CNPxUZo9+UVhBZXaG9B0+BedrIB3NNWRTPCgxGRe
         4N2HasMO5Kl6zaoQGYwt3qfSd8aTwXfgAcOaT3wIUAqU2LDvsrkPWVppV/bqIhDISBFQ
         QBfykfGN80LK4Jgut3thjoeXoJjOueK9JU6Jp4CFKJzjCPtjfwNTcsWLu61CUh1/1LPG
         7+xA==
X-Forwarded-Encrypted: i=1; AL+hErFvO0KBE/Qq7x9ZigRfSjlTNo7ljgB9iKx69XaX26fBSxuDRSUNwMFM0jx9m+Ce97Uf1blQQxSHw+oyzCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qnIW6rf2mDrOelX1y95d+oAfdDnbAC0v5gly9pPyEzKP7Wa0o
	wMRk3i+DjGs+aDH2jb3WouvQ/b0sUIYgINuxVNUr/GqV+kruQ9hIzMOv64L6mfHZ
X-Gm-Gg: AYBFou2TxVUtUFG5i4hHD0d5kjpg36AgJ/zB/UX6QL4ILJSSqOI3lyLqkbsS5X5sKkR
	VA863WQof7OsDkUp1PEjMtXIVkYXAIkjlCvSoH6R+4K+ku/vB95ww29DoMuRaBpKhp6Em9JwIpI
	CyLDywpIG0kyXBKif+LIbjjyqpACSfvYtYHfiJfm/sWaoctMULUfGFXiyFPzb45fizkbJoKYGGw
	T0g1WFY1bUlXowvDbLBu9/9XA3jj7lTypz8C1v3bFElhjcOlTw9mREg9nXmUU7juZbpCkdwgmq9
	h0yMuQN4ymU5nOtBspZsyDgW8QmjnjHI02+tzAKkOYR639YINpHJLOHef2OW7+qaY+4aLonhWOi
	uzLouTJaC3RYaKGKJ2li8lltJK0HfwcbE3U0fCz6wJGeQdXw77d69Gr5IDdhGVOu2t0WKdtkGb3
	3sQwUXKPnzJrE79cUmxIuzAYRyTF8uw1SVXq90Hv4+Y1gJBbxrsPQVZKMorzP23HxpmO8V5VU0p
	9GNamRL40BBO4GDgVD0cq0UbPufWky4beC0s9oI7E2Crp+Qgz0C4oMm35dDW/0oex/cfya1S4Nr
	hP9aWnVAUZuIc+oQZpMPqmh6w3w+PwdlEthjMO9Bj3RdxpRBXo92/BE3kEEiiKoOEewIhdpyt6m
	otYJ81rBwiiuQQi/f82anXgtjGEmxPPDMRNjomTwPXl1eUmVSGhb/J1Bfx5hRKyp0iQ5nhlP6p9
	dNjYaRNw5ddcnoZKM4x0H0tBoNpaRw11HdoyPzAe/whuuSs2Z6YI4=
X-Received: by 2002:a05:6808:1303:b0:55c:836:5955 with SMTP id 5614622812f47-5683ca2f716mr1624292b6e.44.1794296684728;
        Mon, 09 Nov 2026 23:44:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:25 -0700
Subject: [PATCH v2 22/58] mtd: rawnand: pasemi: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-22-9137d08f05df@gmail.com>
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

Release the LPC region and NAND mapping after disconnection.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/pasemi_nand.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/pasemi_nand.c b/drivers/mtd/nand/raw/pasemi_nand.c
index 09409b703d93..d00d57cbb0f1 100644
--- a/drivers/mtd/nand/raw/pasemi_nand.c
+++ b/drivers/mtd/nand/raw/pasemi_nand.c
@@ -93,6 +93,11 @@ static const struct nand_controller_ops pasemi_ops = {
 	.attach_chip = pasemi_attach_chip,
 };
 
+static void pasemi_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct pasemi_ddata, controller));
+}
+
 static int pasemi_nand_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
@@ -122,8 +127,10 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	chip = &ddata->chip;
 	controller = &ddata->controller;
 
+	err = devm_nand_controller_init(dev, controller, pasemi_nand_release);
+	if (err)
+		return err;
 	controller->ops = &pasemi_ops;
-	nand_controller_init(controller);
 	chip->controller = controller;
 
 	pasemi_nand_mtd = nand_to_mtd(chip);
@@ -136,7 +143,7 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 
 	if (!chip->legacy.IO_ADDR_R) {
 		err = -EIO;
-		goto out_mtd;
+		goto out;
 	}
 
 	pdev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa008, NULL);
@@ -174,10 +181,15 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	if (err)
 		goto out_lpc;
 
+	err = nand_set_release(chip, NULL);
+	if (err)
+		goto out_cleanup_nand;
 	if (mtd_device_register(pasemi_nand_mtd, NULL, 0)) {
 		dev_err(dev, "Unable to register MTD device\n");
 		err = -ENODEV;
-		goto out_cleanup_nand;
+		nand_disconnect(chip);
+		mtd_put_master(pasemi_nand_mtd);
+		goto out_lpc;
 	}
 
 	dev_info(dev, "PA Semi NAND flash at %pR, control at I/O %x\n", &res,
@@ -191,8 +203,6 @@ static int pasemi_nand_probe(struct platform_device *ofdev)
 	release_region(ddata->lpcctl, 4);
  out_ior:
 	iounmap(chip->legacy.IO_ADDR_R);
- out_mtd:
-	kfree(ddata);
  out:
 	return err;
 }
@@ -210,14 +220,13 @@ static void pasemi_nand_remove(struct platform_device *ofdev)
 	/* Release resources, unregister device */
 	ret = mtd_device_unregister(pasemi_nand_mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 
 	release_region(ddata->lpcctl, 4);
 
 	iounmap(chip->legacy.IO_ADDR_R);
 
-	/* Free the MTD device structure */
-	kfree(ddata);
+	mtd_put_master(pasemi_nand_mtd);
 }
 
 static const struct of_device_id pasemi_nand_match[] =

-- 
2.53.0

