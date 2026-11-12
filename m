Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446938;
	b=ieJ+RZdxqUHtra3NB2s6lJvqh/FXAHUyBqY9U3KhTuBfIr/WUQpcx6V+dSZjBAFBFkjh
	 TUhSTgnapH4LLNzf0mmD+Csp892BYmGuHmhCVXwhYXcqvPNXupRp3qLPx/lJegA+kfL6A
	 f4q3tNXI1hmhUbbgEC2pb5IaoJRkR+gi51nEg2OCextRSmL01GX6hoV+mD6TFxYYRaknM
	 3sjtPEezWp5LFqFTacr0CHexs9xxxxDHSEgP7l9ePdyr/EOxP9B/pEGCVG2FcAmTHZxqs
	 9s5vwyjrIK4gAfhK3JzpnktnX31ypL6MWPHb7V4mtzZ+u84Avkde0wg7J0qAzYqoLcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
	b=VkyDZfeZpCOF6JVFUq3EQxR0N4SNm3h/+q0XrLhrnylgFBu/OKq/ZeOfzjq6DdJ4z/Iz
	 a9z7ROiR7BbwhsllBmK4WpiGnDZfQnPSHVmJCbPoNEL9d0fJK11fqXLjaNFRi1k9BByeG
	 lAAmHHwrowraBNjQbTisWjKtVwRK1FjJTM/m4NOb/4nQct+/37DoAl7oBlvbT9VHXz1pn
	 HQQTElNaqyIqieg+BQJeyg2tgDq0ChPCpep4ixnXoQhXyNyyRezVAOlkxhPg96fV3Iqbk
	 3ueeCMJEHMpVZYN01+4bGEJ4r2DzCd2d78fkeFXnBTalf/vLG97hTy0HZQ7hhf3rY5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NwQY5QLA;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ED4606B3A7
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2ED4606B3A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NwQY5QLA
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-55e0090c580so1223177b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446936; x=1795051736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=NwQY5QLAd3qlPA9uR7DnQKsUEvpKdJ4VZmfZyPbO22Er+cYp6TRPE+8d6nOOHFdtK2
         hh0KVRciGCrFMvr2vVeIWTKzF54AKpQTjo6+npPD6dEbTQWSOC0W1rB9YdMVZMNb60sA
         C28Rdyx21Hg4Sx30m0XwcLPtmwgHWFcEMEFaBoIngRdurGwNeNH4mXSWLiVb0H2xncOK
         tRfPbIxJkjYcIgeEvYc6lTGNMNPvQR1iG0fVXyUOCatok8l+xNKm7kAzMCin2j9r6RlJ
         Y5LacC6lJi2zw1onQ/kObP0woDdF/8zTB907N2lzEh28s2XgB+WOnNXSynOdx3eEs0ps
         1Osg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446936; x=1795051736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=PElcm92ToVbzLhp0BoGk9hl5t2+5h3+0VUahpR9M+AqFKDO28hv9FOj3eoK3rRliRw
         /C67/qE4IJTI57a0A6mVRA1+zTZ4+uCnIZM8XWeH/ml1QUwbwnkmOi8GxU7H/oQ4oPBs
         r/heFivljBwRSAUDNd3KlAdTbyKZuj3NffQYSlRxpzqqjhZ13mvZKgEaLq77oob/zpcx
         9zdxCAfDwuAnN0MUKHQj8CF8kDreq9K0rB9ZGcoyC/FLJoFPwb3/7iflNYQkoAoR5tfF
         I8bO1mK0CXQIbWIpRddFK80chFKhHRRV0PJkLf3uAVmwu06JmKuClQ6qozHQihrjBBrO
         wezg==
X-Forwarded-Encrypted: i=1; AL+hErHa/zmVvEHDGVK7HM7iOKkbkiVnttcPKgk9lDMsyFNkRXdiC2sUBGmK72qxwTF0jgiu5LXWQSmLMjSyjDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rct8PYzKJwvgMYREUl6pjHRGZ8LiYI2MM75TtAMtiIzCFNteg
	SO6Qharrhf40ufCyV/f+fS9o0J0/isrqc7alN0n3kVMXT7H7wIxM9H6kDw8IHlgg
X-Gm-Gg: AYBFou2SHYJ8QnrsVQcpNDj3Wj6JO0iOLAVrVz0AqB0BEu/2/JbbKbm1840ETiCVAIu
	RXZmvuqRW5p97QgVHuAVtAc+jLSuC4DW8nopNbqdS1y5LaGJXFTGx33D98YdKF/Foi/PntbiYDb
	IXgN2rmuJLC2ELAKDN4reNsqbd68u+9N7hMVz5CLfyLdpuyEedCJeYGftN2wLWovcNiG5IoRT07
	8ys7rG+G1tlxFntcBxhOe5tyFPeqkJNVAbQePuqgB8qT6H1boPd0qy7JvgX/iuSB4Vv+otgDVfW
	rUkQYKhHTtaoysLW65tTd3LtgbOCyYqduwF+u7F9UUcE0Jy3u/qE8xWoMhAlmL7gEyjduAj2HVX
	Nl7vXdH5aH/Qy+hlEPZ3pIw8eWAee+6g4tuNN4y3hZ6YmHi9BqtixaqIChXSdEY8hhZ+9edg/RZ
	JvjUz0vC3T/s3EcA1ZG5Pt7fkNV7AN3tre/7h3O4XHSJLDlKPhV86EzcvbJeOZOwmZIQrjhExcH
	JIRyHSik4mnwVfx970lrEefzWU9IacXJgtmemKx/rnUrZjS0AJNFi9Nj4CZg+fPmfXxiHV4poIR
	4tatOFIwqIalmB4eGGSQUSZGZO6NfLVbCIEvZFA3J66eckKAYZpxgA1AUldtjE94SISGIS8EpWt
	F6flQCIaNusK1qxTcAHv7PYWDdhIIxEKKngtnswaU6NU9Cd60pue/Uw9juo7gQtJ1CIf1PxsfYT
	jabMr//yHlE7GPNgcRTWqj+xsG5FGgLERKXTMuwHRsLug3jZkxQBBm7rI/YjyXv0Jc43rV8zJCk
	w==
X-Received: by 2002:a05:6808:13c4:b0:55c:6aa:14f7 with SMTP id 5614622812f47-56b962977e9mr3910659b6e.21.1794446936603;
        Wed, 11 Nov 2026 17:28:56 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:04 -0700
Subject: [PATCH v3 25/58] mtd: rawnand: hisi504: retain open-handle state
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
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-25-ce537999741d@gmail.com>
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

Retain the host through its embedded legacy controller.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/hisi504_nand.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/hisi504_nand.c b/drivers/mtd/nand/raw/hisi504_nand.c
index ccc21d21c3e0..a9e6ed2d4c4b 100644
--- a/drivers/mtd/nand/raw/hisi504_nand.c
+++ b/drivers/mtd/nand/raw/hisi504_nand.c
@@ -740,9 +740,14 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	struct mtd_info   *mtd;
 	struct device_node *np = dev->of_node;
 
-	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	chip = &host->chip;
+	chip->controller = &chip->legacy.dummy_controller;
+	ret = devm_nand_controller_init(dev, chip->controller, host);
+	if (ret)
+		return ret;
 	host->dev = dev;
 
 	platform_set_drvdata(pdev, host);
@@ -788,10 +793,16 @@ static int hisi_nfc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = nand_set_lifetime(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		return ret;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
 	if (ret) {
 		dev_err(dev, "Err MTD partition=%d\n", ret);
-		nand_cleanup(chip);
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		return ret;
 	}
 
@@ -806,7 +817,8 @@ static void hisi_nfc_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_PM_SLEEP

-- 
2.53.0

