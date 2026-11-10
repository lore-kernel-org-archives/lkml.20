Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296691;
	b=yB2CWSPIbgmoWKPyMsJPWXaTLOlXfWRhOZNcISWQEEAHifT2dKMj80+yuBT5WoWpF9Gv
	 X4hLRVHVTXV3ilMEi6lttNOBjTGc5dH4l1eJU4Li0QpYyCvs+x/rR/u9MUeR/wa/f8fS0
	 w8TeX/u5btpwm/GP83LrQuZk3fWujCvxUTLHCGm8v3/QhHgDx1oSucxbZS3JA40Ae5WRC
	 Aui3KoJXQQtgl0H6ovf6CyR4xrETTsvT4Zc6SNQQ1Emz9BMErKxERjRhu2WveiHj8mGt+
	 mYNKIz3vCQiHLH6hsryVIWVWdwqkpW1+6XuVVQERZNnTWG/SDI7IFaU2llIqfO/FdzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=0NNmQES/+1JXrHeJNaKSoCC/3wqUoF1IkOWxzblHBjM=;
	b=KlqRdun2MoM+9w1Tez8WncELQXApYcwliIp5QSbIEe5Q4iJgTlalfj1ZuVIqMFTt3rUO
	 BjamgvGL6Z0sOmI7pcZi63COZLSNGcEBG6ihU2H6TYnyc5uisXviZJDGS6S7PCqcgpWxL
	 hF3qJqYehFn1CbvbRVEnl7FzIsTqYFyytCh1w7qK5TwqprfAOfoNKOrTx6gw6NPyv1rVX
	 RsImpNzsHPRZoEwKLHvvcJgkMZLm8wfz/W+DGSiPOZ/lb26zOjbJmpQJW4eJD3BFmVvqR
	 Oe4J+6AXVfpxlTAke+K10n7sgwAbd5OwjHH7/OaZdkjIqbCJC5U3KeO2IZog4m47cLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ln0pmH2e;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E74D60A2639
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E74D60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ln0pmH2e
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f84a55cc06so996494a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296690; x=1794901490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0NNmQES/+1JXrHeJNaKSoCC/3wqUoF1IkOWxzblHBjM=;
        b=Ln0pmH2ewli5FQHiD9ZNa5jplsh2NVvlFlIg/S8P7k8c8dU6PLbUnSaoKB0qbc1sB6
         95B3in1GojtS595DgWtu3d2Oj+EqYqQt6ELXO0usT54+9LZJcAh+t/e0N9tpmgc1OGtD
         8uU6mxtOSJp9RRjDEQlwwCB/9WSzp2eUIrOV95d1ME9yT7sD0afV8LqIHe1uRiK3bKAi
         Ko69woY1SpGleQwsX+QzTVMx2mqghDDOAdfZkPKs6UIA/cIdNPMCLgY68/hBHRqrFzF+
         Jo2XYnoGi3DAyoLtpervgHnsbgkvx/HjmQnk3UD7Yc9HdY/cMYA746KPFRevT02xg86Y
         3O8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296690; x=1794901490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0NNmQES/+1JXrHeJNaKSoCC/3wqUoF1IkOWxzblHBjM=;
        b=A7i6ZSnq6KUZiRKNV85oRZrAsETs6n7uns+4wuMm1z9lpQS3zSJcHF0ony/NLt1nfw
         lg3aF3dVLHN7G9N5KrIj8NZsklojsND3YlpxIwoxQ9fYuYOSsgoHx8pACc1JZ4CpvbPn
         v3W2kUHRnHwEDKzRA4x6jeudKtPGFQdzDPf8AVBXGEs669BYfyAPJZUgQl8eTTNFDynP
         PwViz2sIzF+03FQ49uug5GZRP2gW0zmzspUob1z1jInF920HGnm1RJYWBFGjnHRkHYeP
         1BqMzhdMun8hqcyNAnIkGafhl+OOSabARAax++Eo9dEFJ8fk6xZJbySZB+pB0PgVx9yb
         22Pg==
X-Forwarded-Encrypted: i=1; AL+hErH6i3ONJOWWYtgsHqUyL4lDEKvJYn391LZSDxE6eFKszMNPMAD489bz8fX6P3zxj1c7XtuJ0pQjKY5uHtk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dbZEOMZzK+iCDPYqdkROayCfwun9DS2RSP7mgopt7wulMhsPE
	Q9oKf0ZkNoeS+89Tjl9KfGzukc+c9gIB9jSCEaPujMYyo4HKgq/Ux8kFWp0guHgz
X-Gm-Gg: AYBFou1u/T8M633wqsDzLtdPlYUINRPOdwTQR0/NNYXDFM7vFycQg6sFScAiJ6NfNxK
	HiGLYurRLeYDlRwWcZWrxy5317U5uGOE5e7HrjaUgK9/J4Zv6O7BgW50EYfIl/yybPcJ9Fqc6N4
	dIYaJ2nck3KFBqJeTz5DJVD6uuHq8h/H6lxQcOttbwBZ0kDMcl08+I+6ztXfGYRs8qOBArQ+7O7
	kR6D6JtP4TIrSlTpA2Ozb7G5XSux6Fq+qJljqJ7/rfdMkoUVm22Pwv06h1s0gnOw18vs6pImdyA
	UdjRlBD8OT2vXDGuqNVviotMomUCI932WsZ/Mcuz7dGKoj0tF+W4/xxFE0oLxYk3ti3m59OwLiU
	SJ7dYUhKInztmJGpaKDJfz2Wz0L4OGTEX4+suMWkhSKrquYhWO1i0vxFxZOsCb6eCllm2me8bNh
	+Yues3Nmr+T49Eh8u+o0CRuiO7RZ5PMfXyu+A3PiBctvnXxLkIpCIeZtmFEQVOXVc0heblQCIZV
	RS3yPTHcIa1Gl8di0sGWrl9yPb/MYMxic0LBXEFRFXfE6e2SGi4LOEGckrZh4J1pujLtGZB5OGX
	xDswa4Anab4bYFxQjMCnRJjKrCdzSYdg6x5YKn+tHdY9u3erx/v1fQEMw1YuI/usmNgiCVsk+Cb
	o1c3hezjLupx/l2+bdYv82xSH/VkKcq7ZnAWDJPFmxTsCLUyif6NSsPvj9hGp6r+T2TE6UNeZI7
	CorCA/Em5gdvznLfHqBE5DhQBw9DiuXb7jVKTA4aBa6CqA8vaGVh7h
X-Received: by 2002:a05:6808:4441:b0:4f3:6c2b:5f22 with SMTP id 5614622812f47-5683cc44e4bmr1593904b6e.29.1794296690088;
        Mon, 09 Nov 2026 23:44:50 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:49 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:30 -0700
Subject: [PATCH v2 27/58] mtd: rawnand: technologic: retain open-handle
 state on removal
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-27-9137d08f05df@gmail.com>
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

Transfer flash-node ownership to the retained-chip helper.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/technologic-nand-controller.c | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a3294aaf43bd..a67f4d45f57b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -132,6 +132,11 @@ static const struct nand_controller_ops ts72xx_nand_ops = {
 	.exec_op = ts72xx_nand_exec_op,
 };
 
+static void ts72xx_nand_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ts72xx_nand_data, controller));
+}
+
 static int ts72xx_nand_probe(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data;
@@ -139,11 +144,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
-	nand_controller_init(&data->controller);
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, ts72xx_nand_release);
+	if (err)
+		return err;
 	data->controller.ops = &ts72xx_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -175,10 +182,17 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto err_handle_put;
 
-	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	err = nand_set_release(&data->chip, NULL);
 	if (err)
 		goto err_clean_nand;
+	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(&data->chip);
+		mtd_put_master(mtd);
+		goto err_handle_put;
+	}
 
+	fwnode_handle_put(child);
 	return 0;
 
 err_clean_nand:
@@ -191,14 +205,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 static void ts72xx_nand_remove(struct platform_device *pdev)
 {
 	struct ts72xx_nand_data *data = platform_get_drvdata(pdev);
-	struct fwnode_handle *fwnode = dev_fwnode(&pdev->dev);
 	struct nand_chip *chip = &data->chip;
 	int ret;
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
-	fwnode_handle_put(fwnode);
+	nand_disconnect(chip);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static const struct of_device_id ts72xx_id_table[] = {

-- 
2.53.0

