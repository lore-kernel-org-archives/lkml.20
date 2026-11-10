Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296715;
	b=Kua2ltZBWDzjprrKiXhYMxjgJ+py9S3vYEPSEJ9awhpCg3J6C9M7FqfEBmXo1YRVPb9I
	 Bddb4h3xk3k+vCqGUpC0Wjs27WJJqD6fBqxTk9xJZVBsmgqbkeJ3mUj15oLuU4UU67Idr
	 xYxQ3IobezWc9BCaMkjRSkWINRdqISkeig2dhGuTPnlv7rBBH577gIKM6kX5eMiMiKha2
	 13OG2Hk70uqBX+8A5wkkR9qlMmFgslsZnekbOHH+1v5GdLtq4mlB7bHsIpIf+lNvdjmoz
	 Y0dtNjPnVayBWiXK2oaaZqTvo/1vCvkXc18dwyBBfDUSWgpduO6IjkYhH5sQYJO9G0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
	b=tPjp+8ZF0+L6m68V84XXLUmoFxWtVCKscAn48S6bk4Pmix0HCKlqRzbKUApQ89UKQmZJ
	 QuksmM+oNRCkLRad2hnRzelL3A2QW9cx02Hh7u19W/CkRnnAlnNR67R1HvW1JbphvSFo5
	 bGGj0oGMSh5GnKQIp2IrBON42VjR/kjjl9vwENg0hH8PJV9DLis1NKwhbnsbHvE3nyqns
	 82kWZeX7PXC+ouPDuChWTNCdUM0iYsnAdBoAtu15bBYexOFv4/jPYUxXxgR7SK+K6Ss/n
	 aUajB3GR9gSUJ69X7GK1sHIdombd+EeYMul9wc4hFdFOTUqgEPazAsRyZmrUpxrxW+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsZHcIfx;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE876073C45
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BE876073C45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsZHcIfx
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4f55a53898cso800795b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296714; x=1794901514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
        b=rsZHcIfxfaoEtMZI/zQBSuCio8gL+LQfY0xYaCbkRmGGh+lUWbgxYft00SXuTv7oFi
         MijNb9/wt8QS9q3vB6JY3yFX29AuDAAn4E1IIFhOnNVpJXg7cZ8J3XOF5w9odStw6SDH
         X9Q9riITzXvc/cMD5UaeyR/ysxMv4rVL+8GkXwr8hty/chNHG6cKBqBgtTx5DXr9Fk+2
         I8PcgAIe8/X/C+Ylv2X5LNg4AtwDYW3Ivz7zIub3co0MFT0aZeOSuL30cpYm+pZRHuRw
         w1geb+PwosfncxTLbUaIT/RDdXaqeyTNUfyTH2NEu5sDivZMG841wqB1os+WPQzigySI
         lT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296714; x=1794901514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qoIL+h3VRnDc2UQ+UqSvvQ4SKOAi/m0jcVk5/5iZOfM=;
        b=rYPI1hnyf91HOwm1mumk5r2B9Ce63Hb2sJNpDNbBRoWC0QD7EEriBiwROtq9pNxZ/A
         59mP5xbyaFEEXX9Y5ccfbb9inGRAMLg4/iigrjB1Bjg1aeYqNQU55KfGX41NmnespXxr
         iIcwLK3uzSzDTY2utaMWpFPnu+vR2tw4k2fVqUDA44sHjxlf3HdFI33cQ6l0EKrCuTu7
         PpVkptw7v8zT5l2mcL7MgosIKGWcknKifqmlJrUIIGOW/yq6CPj7xT07VEs7XzYMIu5q
         4n2wEmA6wUXjy58/xzHdqFoLSmXenqs+3kN0OKgIKJ16WW3mR1huSFAVl3nTu8aZJOi0
         JuTQ==
X-Forwarded-Encrypted: i=1; AL+hErFGFNRaHLapJJnUCbCihuMzBXX4gbpIZ1qAH52Dlr2GrryCxSvXIX6DodExiJN+ZF/WMP6AibitVlbiAWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rIaE8LVzT/XmZT4PxqyfGiWOglYKDgL/3UWo1s3Zymy6UxK4+
	okxvfq+CJ6HE+9iFo0e08RvOoM3wfRI30wGY6tUmjn+l0JXLUF6ONACC0uPiQm16
X-Gm-Gg: AYBFou02hMD9e0L+78khiE8FHXEgLOkWT240jabiDwndV/tZ11/qofQutkZouCLl0ig
	FQhfM+cs+Jn9Fcl4hpHQU/qP7BjnAJQTB202UQ725AjpJq6uFeC8tvbFcky8GeGU+m7rEbsxsAj
	zV9PJRtjNUa0DVzwKJxJH6rsF6Rx6Jql5cpoDiP/JhrgE84zBEN63TpH/BfYJwdMw5NsuHc/xrc
	7lOXE5fr8JNN0u/k/PMmo+maleYZD3qLYY7niYn/I8ZULikqGrTUaFHWEEvFQDKo2NxthmTROPm
	IxdHhOOfi4jByXRv8KR23D0xhz5pYPdUekTvm5vVPztKtj09iQspvrNNXXAstJ5/YXEG54P0OKz
	/l8wFxheYLdIEz6p4Lbm4T20ydwnrDcpVaypVRUs1RJRtMiFmICZbJibH3hz9+2Sm2lvv7TqZH8
	X0LCrsV3Srd/gM9Xz/2ZXerO0kvrnC5TxYONSgLvZmWdI/XakiCoJkFYsHqHUDPxdSusM+s1nbq
	z5azKxsUzJZm+u8EFwLEqWJ+KCE6NRvprtMHl2IaZmH/YKQxpXmOc6n118yRdTcKKYJh0XNjJ9A
	Kb0PT/KfpIidIIOj8HENdraTwLMnoL5WcjLT2g/dtvItjBHWGaKWZcN5+FQ2PZi16SaHajlONiJ
	KFRtzl7Ru4b5ymuW1Z7U3ZqSNcifugDrmJiLwR/Hhxksd1DapOue+nyNs6IxIJ9VqV++tGTfyoR
	K4bfjepeSFAajoMz1ZhIgWuyKsAHOOVBBk5bXIjWDwVXyvTFPL++o=
X-Received: by 2002:a05:6808:6c85:b0:561:fa43:1b17 with SMTP id 5614622812f47-5683ce07f20mr1587672b6e.42.1794296714274;
        Mon, 09 Nov 2026 23:45:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:51 -0700
Subject: [PATCH v2 48/58] mtd: rawnand: ndfc: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-48-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Allocate controller state per binding instead of reusing the static
chip-select slots. A retained MTD handle must keep its original chip
state when the platform device is rebound. Disconnect the old chip
before device resources disappear and release its state at the final MTD
put.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/ndfc.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index d7b119028a71..50506ad87fd4 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -37,8 +37,6 @@ struct ndfc_controller {
 	struct nand_controller ndfc_control;
 };
 
-static struct ndfc_controller ndfc_ctrl[NDFC_MAX_CS];
-
 static void ndfc_select_chip(struct nand_chip *nchip, int chip)
 {
 	uint32_t ccr;
@@ -173,13 +171,27 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 	if (ret)
 		goto err;
 
+	ret = nand_set_release(chip, NULL);
+	if (ret) {
+		nand_cleanup(chip);
+		goto err;
+	}
 	ret = mtd_device_register(mtd, NULL, 0);
+	if (ret) {
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
+	}
 
 err:
 	of_node_put(flash_np);
 	return ret;
 }
 
+static void ndfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct ndfc_controller, ndfc_control));
+}
+
 static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
@@ -187,11 +199,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int len = 0;
-
-	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
-	if (IS_ERR(ndfcbase))
-		return PTR_ERR(ndfcbase);
+	int len = 0, ret;
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -206,10 +214,18 @@ static int ndfc_probe(struct platform_device *ofdev)
 		return -EINVAL;
 	}
 
-	ndfc = &ndfc_ctrl[cs];
+	ndfc = kzalloc_obj(*ndfc);
+	if (!ndfc)
+		return -ENOMEM;
+	ret = devm_nand_controller_init(&ofdev->dev, &ndfc->ndfc_control, ndfc_release);
+	if (ret)
+		return ret;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 	ndfc->chip_select = cs;
 
-	nand_controller_init(&ndfc->ndfc_control);
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
@@ -243,7 +259,8 @@ static void ndfc_remove(struct platform_device *ofdev)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id ndfc_match[] = {

-- 
2.53.0

