Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296677;
	b=eNtOF3kP4JDqYoD15/qIUFUQ0aKHqHVFpxgmnBpxWscIEndghpKsyJiX7Vo+mVzaHVFQ
	 AysDrxWWJmWaJT0DcTnrewu7OEFBfc1lAKzajFGWrsbDDkBjwEwiRt8nT5oZdNZEok15i
	 GwqpINLXoLRZp4SsAjzvyFPWFf9DSDMNcMft5wxTMromfRYxFet/MXY9TLvWHyZKViOMd
	 SfrUtwjSgZOqPheWGzOPQoeqUtE8P1FwwsH6A7um7Z48mIqX2LkZkNngcoHe+U45wKMfp
	 rCeQJQO5M+fJyf7A6dy1/SWKuyrm4X8fPuZnbIxjU7qejABqSpqOCsfoeoIljnytzHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=xYF0DhRIR3VwPKze9/QOypbcYJrT40MxOfLP8gHW2m8=;
	b=y35wxTtuclXK7Epeq8Rwrz3+SWsBpp8XfAhFIAks+F0J+voGGY3PRCjK8dLgB+9NAPGE
	 EsT2TWHunVjrnI8t3DLDeRWEFhsSshL0U+oBBm46jcsfSRD68+vs4iz0+fn6pFWq+cCml
	 ckb9KX26TOZP4OgN9wWiRwG1qaQ/1+zSwb62EVZH8IrtaO+BjMS295EQLepXEl54MGJO6
	 +lsEzw03FZljDs8/v81Dyp2+f/HmPhK/mi10NBExkoxrxkET8ID6blhskordluVy/xNWm
	 mXkDrA3+wN2/rD5MSh2snP4uh5eaGszd4vtMiVuhlnZPogOlCMlThMUmtFUCQky482g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuhDCZ0K;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F9860A5BD4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F9860A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AuhDCZ0K
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4d198f1a591so936890b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296676; x=1794901476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xYF0DhRIR3VwPKze9/QOypbcYJrT40MxOfLP8gHW2m8=;
        b=AuhDCZ0KehKf3NdtuoUubDj/Cx4yV0r28r/4YS5kpTKlPvUBMEwt3wYgLJlbUxhk2t
         /9XF7YUVncw5pqk3jVALdsHoAtWAkX7lc4Uh74eJh8TiI1c4o69fNJcunwC7LRkvkWQy
         OFMJ3htgEG289Nuh5m7EFQXGaB+X+XN9OJ2qca2WFjU+72VBg1HSS8XkuCS4VrKD1lBv
         g8ggqvU6UpwxIqrND3dCamJ4zuU3OlAE+pmXL9lyay17iKMj5Dme3K+Qu0G93MeGhJFM
         +Qp0D6qTO56DiZ1yYiDip9WrNXmM4ngbCChJfdVr+MWFiSHWZsO9q+hru2mEHYKrFO7D
         kgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296676; x=1794901476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xYF0DhRIR3VwPKze9/QOypbcYJrT40MxOfLP8gHW2m8=;
        b=dwvZT/DHnoskVEfBjE8ZWASLVM8DsDSRJSYLMH6mSc2neu7Z93wA+Mi6CmNhm6iyfq
         fpNDU0U9kwS64DF3SUqxzqgw1T1MQ6nGtOB62mPLSYw61VRu1Jsg74dlranSG5vYK8d0
         ajCC/DM9okgDneebQ3XLvBLCkspyhglFJ5IoPryhYmjotR566VqGp7fVvNV3l8E4yhVe
         d0oU1d/cP79O0/p1I6lVuqWo6acjDJwoiqWX93zAJ8rnZjfpKEkbrgTJnPCSMNKXSXev
         1GTMOb2EOROfk0P505DLQKjfwA8cT600LK/kBKYwNzlwDNsDrx2MzR4dybYhUbnd9lKa
         3eFw==
X-Forwarded-Encrypted: i=1; AL+hErG12PJ5S4G3IQ/Nbl9bRxfjBqlpVKbYM5T+fGTkaLtoKwFAFiR/HwgqGym8apykCsp5pwhqXmhwk65ZO+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9R45utU40Y0RqgAvR3Tif5m4DBUk2k1JkKdpt0TFrpVi++HSyj
	IzWDojIZ0oBiH2pBxgx6s4L6HOLrszXYBFFX65z4a3nnzv7RW9JeXnscPgvLjFC7
X-Gm-Gg: AYBFou3vxEIadcTz7/K0A6yS7LbHou8q1yWyoVD0lWTU+zTCISzhfvU3FrmBZiEhM9q
	rB6TyiJCidiAl1NliJJUloB4J4/IuHupT74jOxWFEFKdDcXjRaQAJHrqgEu+danXgACuoHOzDIf
	MM+3pj9yV1kD/2XUQFO4XOb+2O+HDSk3w8qCzrajV3N7sFTLmU5fDlav3s/+5BynrV+dxUXqIe3
	4DprfwbXFBaxFK9nccH4Gt9DQ09TzIGaCryRVwgKwnv0OETa2GdGOQ0NJqBmNEa8rc1V3nT81fO
	S7DBzLczWBuEoxENlA/Fd7/2u8qZBY+7gT6BfhynMQrlwOjLdQIU9V4oAcK4owyFAszJcB14+gx
	YclhrgdCIpWDctvgBBM42Il97HLhHDx/9t/4UYrEkA7ENxMMpeKzG+WbIPOdhnga3JxQM3/nGVP
	k/BylQHV0ZVeGJaZIr0we9l5fSKUUDnB0RwvQp4b4xi+w9dLicxjLF11rmUSabDZhQTKgcYg1Ep
	xw9C4YGtIoD/A8FA/w2ugbkbslo+fZS3yFbJBVI2jj9lAUiZLTyu8OtLwB0+y2XbI2Lz9JskTWc
	dArRSFObLqsd8DaasWneUZYB0y6AnaP1fXDnz6PntPquCjWJsWYtdpWSa8CQh3bjHWdjhPk7zgY
	ZrgRn0dJdi/A2ZvZ/9Dg7S9KIp0moAZYAHWcErLOcYEXAXPz4TZKhBwcu12XXM4qFw5Eqetn6pJ
	wtLBrQN7Cy4YSRS4lLlRaP4Kv1sCosemuqY+/CHV4ZA3332tf+LAo=
X-Received: by 2002:a05:6808:150e:b0:4f8:4a95:9b3a with SMTP id 5614622812f47-5683ccd4f5cmr1370262b6e.11.1794296676070;
        Mon, 09 Nov 2026 23:44:36 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:17 -0700
Subject: [PATCH v2 14/58] mtd: rawnand: intel: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-14-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: b4 0.15.2

Disconnect NAND operations after unregistering MTD and before disabling
the controller or releasing DMA channels. Retain the embedded chip,
controller lock and NAND metadata until the last MTD reference is
released, including references obtained during a partially successful
probe.

Fixes: 0b1039f016e8 ("mtd: rawnand: Add NAND controller support on Intel LGM SoC")
Cc: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/intel-nand-controller.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/intel-nand-controller.c b/drivers/mtd/nand/raw/intel-nand-controller.c
index 97c82e9c1af2..19c54d3fc260 100644
--- a/drivers/mtd/nand/raw/intel-nand-controller.c
+++ b/drivers/mtd/nand/raw/intel-nand-controller.c
@@ -573,6 +573,11 @@ static void ebu_dma_cleanup(struct ebu_nand_controller *ebu_host)
 		dma_release_channel(ebu_host->dma_tx);
 }
 
+static void ebu_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ebu_nand_controller, controller));
+}
+
 static int ebu_nand_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -585,12 +590,14 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	int ret;
 	u32 cs;
 
-	ebu_host = devm_kzalloc(dev, sizeof(*ebu_host), GFP_KERNEL);
+	ebu_host = kzalloc_obj(*ebu_host);
 	if (!ebu_host)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(dev, &ebu_host->controller, ebu_nand_release);
+	if (ret)
+		return ret;
 
 	ebu_host->dev = dev;
-	nand_controller_init(&ebu_host->controller);
 
 	ebu_host->ebu = devm_platform_ioremap_resource_byname(pdev, "ebunand");
 	if (IS_ERR(ebu_host->ebu))
@@ -692,9 +699,16 @@ static int ebu_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_disable_nand;
 
-	ret = mtd_device_register(mtd, NULL, 0);
+	ret = nand_set_release(nand, NULL);
 	if (ret)
 		goto err_clean_nand;
+	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(nand);
+		ebu_nand_disable(nand);
+		mtd_put_master(mtd);
+		goto err_cleanup_dma;
+	}
 
 	return 0;
 
@@ -717,9 +731,10 @@ static void ebu_nand_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(&ebu_host->chip));
 	WARN_ON(ret);
-	nand_cleanup(&ebu_host->chip);
+	nand_disconnect(&ebu_host->chip);
 	ebu_nand_disable(&ebu_host->chip);
 	ebu_dma_cleanup(ebu_host);
+	mtd_put_master(nand_to_mtd(&ebu_host->chip));
 }
 
 static const struct of_device_id ebu_nand_match[] = {

-- 
2.53.0

