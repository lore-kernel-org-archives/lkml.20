Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296683;
	b=FXkxYSOB92YIVmuVDfVzdgupvxEA4rfk9FufGkXgqzxloDsKowl0Xoaga7++b22q5oQl
	 FHoABq7OxYpH9a6KnN8ApudaVsM0hsQIzB0iSob9gX9+mE6TeaZuHU72k/LhFA2ZOTVMv
	 QE53d9/KNXbt1kOmOso57bWcJyRvzNPjlNEhIbwCPTfW8k9n28tFhGiOvsITY8gb1wtRA
	 lWJipLRDq9b3tO+X2SAUe+RpHAmgtbo64kSLGApom6oOfePZQc1Zy9fQ2CBbl4rXv94jS
	 ccLmaI7DY8bkZdtbWnIK9IRwmdZ9MgDkTCMeS+Be/Zc1W53dXD8CCrMW8G2SgqpNFhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=BYcNZCkRPtVfRqMJzvhmikC22qG2Rhi28NS8s3/0dd8=;
	b=BAOtFeu4NzPIBqEcAT6xi5mDrP3mtgT9VkRnI/BtDyORmNYcnOeMcwe9YIwf/6oZ5Mn+
	 hJ7cjdtUc0e6ZyYi3C1Bqb/xvtbLWgLqOSsFvuSs9GzDrT4QlbGheO8H+gdNg79b62kDB
	 QtLJcET0afYEzdzWS3zbCnr1xHWF9oeoiskNAbs3oEqCwifxdXZSySbFgWBG+RdD0Fntx
	 HusjB7HUKYBBoB6j+8q0DjX94+9ubBMo9v651jYGTZzQVhobty/Y4rtsP4t23pO3UClY1
	 NBgreUsRA1xXw6mKNVNN7+CCj1i9UkLXfakpANfszw2wo/awEszaNkHGfBD2ZEz6khA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJi7t30H;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26E2606DF56
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B26E2606DF56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJi7t30H
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7f84a55cc06so996437a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296682; x=1794901482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYcNZCkRPtVfRqMJzvhmikC22qG2Rhi28NS8s3/0dd8=;
        b=OJi7t30HcVySy92j9BdbUIkbCg6aAELp58lH6DHuxcxoFLZOjyNgRmz15ekal0jFMa
         mMpJioZOLvs5eTcOFnNb4KuMlNDKXaB2lBSY3qXwQ1R4S660Wqa4kEh8kbrdWi4aKzZo
         aiwk9Ieo6ydc5ADiIzhJnPSUaPyqC7B8zNjb4IttAXQEYsoUbGzfurA/s7utmjNfSuvT
         2CgkgpABp5e8KkEP018S+jJB6Ew2rGm3Wo/LlMCgOZkdbVQA6Pi4xYhqC2e1ZdZbsMe4
         xGjyHgl29yEidY7AL7hwubnH0UNRsw7hUAI5GgtB/YymQIhJSF38/aBwKg+KZhdsdR9b
         cXeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296682; x=1794901482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYcNZCkRPtVfRqMJzvhmikC22qG2Rhi28NS8s3/0dd8=;
        b=D73sC/k7tKo+C5O3NQUkokxBPCYY0Dndx3TWUrDu8vo+dAGVUSDHJifTb066+gailU
         A/IN2lKWFXvghbcQ/6VuilulB6N7BB9uqQptmFgUANfO8kJGSHvCmk2p/E6IaGnent8S
         ox6yMuVbkKKKDJIsN6dO4lFTFuNpGifGbADCthd3EL+GTl5JrRNVB+5/A4WVqEHDL/GE
         KB1taTDTvBTZOYWbC0hpPHIJUTQTsd+/5TA9m5AyN6GJmJ8ekStFpXwe9BKZwhktSqVI
         pjULaPIMW6tYf49Y+z9krGQccwo9pCM+HaF4Q++E34PgkZTXyqDXteWEaTOmCMF0AKJn
         7PNw==
X-Forwarded-Encrypted: i=1; AL+hErEFaiuNNu+LwhlvhxzF85e+CvGFGZwEFo2JtYpI3MNzy5+PXADmTyrd6QqN4hwDTD3FtixxrZ7AfzLv1sU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NZKTPdnb+1SQTEClAovhQhesmOUTEfW1XTeyPF8zTRt+DVf/k
	T4Hne+xfeYDsN1kV6rnU6/xqpMfMkBXaWhu93dfVg1fA51Ka6Iwo2ywEhaD3T5gI
X-Gm-Gg: AYBFou03J110rjeRac+ewfHKpfnuHbzLT+zgXEJr25Gv9oa3Cup8GRfmujo1K39l9DG
	DMZ+OfqEfG6LBrgsVMs5NS5nlrXX9pOh3crV/LO3mOrlJvNu43nN3aBonazqhKrhIHioHpKjiSW
	BiaVcXf/RwJf1P0rz/8EcjbaAtf4Whgss6SETEwGW0IFKoUpgzUdOPwt41jRDObGmD53gwJYjeZ
	bZVXNpSfuDtZzOi4IJQI4Nj4cSYLN6r9bsILfXJB0DajS0Gj6Bbicv1PV+Nk7R1YOPa5D79lgMO
	uewEcrWlqu/ojrqbFcSBQ2vaLNF7+EEOOe9rnoDj5n+iU/7FcU9Mz8mYUogCgfYQu+z1KzyBC0v
	CYoTlEUdO0wlX6nbPzhu7OhEL0ZcmOlk9+wGvPKGyMxpF1dJZKXLlylw2aawm2g3Gt3WKXEDI4W
	kChNitJyCypxEuZoc2OO72r5SxgsVIj/nIo/kdUypafKiZHeCSxTejZOwoVbY0QVHXwL918edRj
	JToE87xHHOzxgnSnMWv7kgpU0g1QeF6pg7lnEuxBImY2a0MfjHgowz8vEGiYyJiCF8LS0KkxSy5
	fNS9V723LEzutPdZQmYF4r+RFyu3jI4u7XQYdlWtXw78hHIE8uFwWxduBap3EG3McoECRRxSe1o
	qeIQoivhV5eq56AbNe0XcuAYu7Y5Q6F+du3O7Nr08Kek3laaHlm4XOWfkLUUiwiKpx0oLuU+dX3
	OtVUpjbiHUj+oc3OdNzFqr5U2N3+AOmXfWVZj4Lec6eFrWLVbVBl0L
X-Received: by 2002:a05:6808:680a:b0:4a3:fefb:899b with SMTP id 5614622812f47-5683c8acbecmr1566196b6e.7.1794296681650;
        Mon, 09 Nov 2026 23:44:41 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:41 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:22 -0700
Subject: [PATCH v2 19/58] mtd: rawnand: orion: retain open-handle state on
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-19-9137d08f05df@gmail.com>
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

Retain the embedded chip and its copied name through the shared
allocation.

Fixes: 2a1dba2931dc ("[MTD] [NAND] Marvell Orion device bus NAND controller")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/orion_nand.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/orion_nand.c b/drivers/mtd/nand/raw/orion_nand.c
index 47e80d5e58c5..aae054e47db5 100644
--- a/drivers/mtd/nand/raw/orion_nand.c
+++ b/drivers/mtd/nand/raw/orion_nand.c
@@ -96,6 +96,11 @@ static const struct nand_controller_ops orion_nand_ops = {
 	.attach_chip = orion_nand_attach_chip,
 };
 
+static void orion_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct orion_nand_info, controller));
+}
+
 static int __init orion_nand_probe(struct platform_device *pdev)
 {
 	struct orion_nand_info *info;
@@ -106,15 +111,15 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 	int ret = 0;
 	u32 val = 0;
 
-	info = devm_kzalloc(&pdev->dev,
-			sizeof(struct orion_nand_info),
-			GFP_KERNEL);
+	info = kzalloc_obj(*info);
 	if (!info)
 		return -ENOMEM;
+	ret = devm_nand_controller_init(&pdev->dev, &info->controller, orion_nand_release);
+	if (ret)
+		return ret;
 	nc = &info->chip;
 	mtd = nand_to_mtd(nc);
 
-	nand_controller_init(&info->controller);
 	info->controller.ops = &orion_nand_ops;
 	nc->controller = &info->controller;
 
@@ -186,9 +191,16 @@ static int __init orion_nand_probe(struct platform_device *pdev)
 		return ret;
 
 	mtd->name = "orion_nand";
-	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
-	if (ret)
+	ret = nand_set_release(nc, NULL);
+	if (ret) {
 		nand_cleanup(nc);
+		return ret;
+	}
+	ret = mtd_device_register(mtd, board->parts, board->nr_parts);
+	if (ret) {
+		nand_disconnect(nc);
+		mtd_put_master(mtd);
+	}
 
 	return ret;
 }
@@ -202,7 +214,8 @@ static void orion_nand_remove(struct platform_device *pdev)
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
 
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 #ifdef CONFIG_OF

-- 
2.53.0

