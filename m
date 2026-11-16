Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810621;
	b=spCIbk5jO9qlho0L3sUDimGJXRZ9aYnhmKF286Pbym4SdljNFVyuUGMFAVhT0fj6Kiug
	 X0n5rq45tvcEykZl4o3Y1zx9m1iVmY6MBX2sYjV9FU3anb2FZzgj4xbj7Du0UiR44DojT
	 9h6gD+FLgRXMa1gFs/vtUitxkk6IMgTqJvCzpYHv7xzv5Ul1nfEIFMSa99ihCK2Z61OqA
	 l8hMpbdyp/JZMuzRVwPG0bpmB+Qtd2RJQsQlwZLhKq3bqSls5ywp0uGW3q3YkfZPj4c8p
	 6piky26ug/huMWBjY1y9pc+KGuYyo/JiPPgLCKv5dEPAje/GLbS+Ev5g4RCmcHXvMsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=C1J2czhvyPsoZVgP5LJ2w4r8ErFurOPxYzAJup69IfI=;
	b=kNBTUrRyAv72SbVtO4jHzBgjr1rBwnnzzW26X+MWuKjffAdZXaaI0mBIvjEumSVIR0eJ
	 XqNwRcN2HwLIgYN7OGnsxWDX7cJpML3OL8+tdZ648IbfmFESa81s6+tk6CSEIbIyKuhmT
	 D1DLKVHqfx02ncDMycyQcBF//VtwWRGglrXLJPuN9pUIeTxedH4PJ/X8ylAhyYj6pdseV
	 jJApaCWNKULNw+cRLOsrh+4ZcLNL76PPfFz1oEqIojC9x+hEWtX7LOdPGjsbf+WCmjz+B
	 SQnWIr0f8rVM0Axz2xDpWWuD2cEHWm+UyoeKwpDnkEU49GGpkCsAjjFCmSFIgX1wiAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FajID9nN;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD95A60A2606
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD95A60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FajID9nN
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6d290b10a35so1088470eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810620; x=1795415420; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1J2czhvyPsoZVgP5LJ2w4r8ErFurOPxYzAJup69IfI=;
        b=FajID9nNrwbcWJDMa4ruzZBweZyKNfILCvUgMODuzspGsPrTWotI1bHI32PM0SA1DG
         Lbq2YZZ1iMoJf1+n1g5wAnCrG25ZrIwLlcuJjyPqL1WsOfxLBHzJAc002PYMzhhG8hbV
         ZSb5GmZ3jY2f1LQGDYgSmyfFl5dhT8agsJ+oAta2yX3jocaej8MbD4RQx63/TN8gVA39
         GELGTr6CfIMAkNdscn3Rgz/vvZcsEBK8+dvcGJevrsVFt7LLjSCj9PS+GbWX85Zb3aDH
         y3LNQ7uWyA3AHKoA8Rzn7yiYyJRctBTdr5AfXkj3qKgaLzlLYtlLGpArYatQLDVruPcI
         7ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810620; x=1795415420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1J2czhvyPsoZVgP5LJ2w4r8ErFurOPxYzAJup69IfI=;
        b=UlubNsHkCUVFDfWmqCx6A98MvOrvhtFxLN1aC8+kuMLZVWbXdOGkXpeL5FKTkaqzWG
         JgdWcZU7WiemwYlpoT9igixVMKVdSGrCybWRA0TLgFNN/HkF8NEOUtIEC+VznqMd9BZ8
         09Nn3BTkbKwrDq4TNSHplGXeAqwthBuGLtS0wyRyZwEUgH4OaD/pjBNl4Q78DzRIwUOl
         K53498Cdx/+jdzl5Di41nXYx0HVTSZPnKPuMhuIPbMVAhiz4Cp3Xj5NG1OUV7wR8tYZL
         qNXBJfni/8JTLamwoxKF5BnZo5UyjvRWDbonjJe52WsPEZmn3qSO7/9qto5W17SEz80L
         80TQ==
X-Forwarded-Encrypted: i=1; AL+hErHtSGa6ghLDS9T+o3lZITeeIWmkG3m3S6EYT49+HSH9pZBLdHzZn1B4muRD9cqMAHgzekXraaExbQU4tZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pJLR2xwY4x+TWeK7EobWfz9uTOnLOZENYxKZ3LvasRIvp+KTZ
	bxQC9wfsDoH2dBLiCBgy/KO6OQ+LrMwHllmsHlbfAhfgAtC88IH++7bQkYASg2a3
X-Gm-Gg: AYBFou3PPpAVoYExUgIA8mCus7EuL2VP1Bc9cfbFcK7/bqXMuiWVBX5JEexYPc8QzUA
	BnXoFFeJecFXMi4MBfw78AdkvmgCixgMcxsrW4Yb3iYqP6HJPn/B4+aN/HBzLmFzUOgXkhKgKgw
	zNzkwXh+KeW31acuTYtoL5k1kWHx3ufw+zrB3NBBNWD9HMXC3qSUbwvwNREzfNolBjYcKnOs/9V
	lJcpCSdj3GgUXj3S2+M7eTqIt10PlrY01VJRtAhSlFTIt22DwdzgA+c/Tn8SUa5z5U4AxKvl3US
	m0AVPY2ss6oiSVkZaGvuJ+KY8tKLHO+E9rCBN1RQPyyI7AXiBwp73yKEKBzxvFYf6hsBBhUIzhF
	vG+h257VB9RRINGKPyOKoE1tCUvu9N1VpExWCzrkzcYZjm6ldghWBcxbrdOusWqTP4VbFDaYE1b
	9CyAV5LWjAixa6HEtUMNdU4sSZFSHRfNRApXJFUrjX+o9sE7KAp3/fEVC6Vu6I7P1XM/POFP5El
	ujb/Xugui08vEgR2WJX7CLnhn+tcL34hfDqQNhCZE8r+ywRnTIeQs/jqtXMVZNqOdkicDPRHc23
	tgyMdryCocx5xWA5pi59RRJqrGXcMuxTQEFwCsJ8hlDgDdxFsjaRRBmhq+8GC7TnLSLWvxkrR5j
	qcs5EP2brr6TN6LJoO3g2lJSYt5SUFl3FugW7QtgvtqJNJyaX3p9Wf1DTgokxl4GdlRLqUUzgTm
	1Z6bOaTHmd9DkOzBNsDUwzwLu6RZYlhz/8H1LVkCbfMwwdqK6HGk4=
X-Received: by 2002:a05:6820:1518:b0:71a:fbc6:6a9d with SMTP id 006d021491bc7-71afbc68301mr179623eaf.41.1794810619676;
        Sun, 15 Nov 2026 22:30:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:42 -0700
Subject: [PATCH v5 27/58] mtd: rawnand: technologic: retain open-handle
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-27-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Transfer flash-node ownership to the retained-chip helper. Balance the
probe's child-node reference rather than putting the unreferenced
controller node during removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Fixes: 853034c7d8c0 ("mtd: rawnand: add support for ts72xx")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/technologic-nand-controller.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/technologic-nand-controller.c b/drivers/mtd/nand/raw/technologic-nand-controller.c
index a4de53f954e5..98cf91136d0b 100644
--- a/drivers/mtd/nand/raw/technologic-nand-controller.c
+++ b/drivers/mtd/nand/raw/technologic-nand-controller.c
@@ -139,11 +139,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	struct mtd_info *mtd;
 	int err;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
+	data = kzalloc_obj(*data);
 	if (!data)
 		return -ENOMEM;
 
-	nand_controller_init(&data->controller);
+	err = devm_nand_controller_init(&pdev->dev, &data->controller, data);
+	if (err)
+		return err;
 	data->controller.ops = &ts72xx_nand_ops;
 	data->chip.controller = &data->controller;
 
@@ -175,10 +177,17 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
 	if (err)
 		goto err_handle_put;
 
-	err = mtd_device_parse_register(mtd, NULL, NULL, NULL, 0);
+	err = nand_set_lifetime(&data->chip, NULL);
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
@@ -191,14 +200,13 @@ static int ts72xx_nand_probe(struct platform_device *pdev)
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

