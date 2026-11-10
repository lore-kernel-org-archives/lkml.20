Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296719;
	b=RqVq4qWMF7eBGTkSiYoqbV+rstDBvT4kN/YXVzritldbR4JnCiPuWa8/KKvUNTJTnj8L
	 1cM4jZ2vg/VJtdBlgUhtNDQ1fUjU+uXN3XUcIb4w2UGvpOj+4LVcMnv1jjh2qapLoq2SQ
	 7CFyE1J4spAYVBrHbjgs/34V0Cf6xvFRuFEIF5BxAkq2vzYXEL3V7zCuUxx4uo2ZHh2lE
	 BPIZbSO+6FZbxsbTWdzFGS1RH8SAakr+oxI1dGpWod0Zlupcx/ryBN4YPX3NS5TXfZmEH
	 D6+YNYuRiYb2wYixvqkFAMHhLeeRn+hWpHFeRjkU6GgMdfTP4ji495kV412W3XYDP4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4gqrRTSfkd4qUlgHqzykH7Su9/kkdmS/joWQRvX1nxI=;
	b=10fAoxkblHf0STfe/azfZLk/PVbSiuWU6KRMNrfGROFvVf3aoqMbHcT+cXZdL1Y+vyHo
	 b1AYhyRn8EMcSwEZiTVba+Z7XKeSH0P7jGh9bH8Dpa7VAU4u84+EPXsplVJHuuH0v1jhd
	 To+bYvQ/g+PFuNiMJDyoFRDXn7i+FA6hEkhnYJmaA4iPi0Nm2bHczEqOt7OYuzAv/uSF6
	 jo39hKlRSmBhhCm5a1zK2YT5oi1HMQahHwhTSv6bLnD4/yHKbCtPEyjOnBI4rcFQ3I8Ix
	 JvQsCgs/Nvnu0r7jh0Rp1e/xyPckYpbDpYsMR+Tbwf8c1WpcfHyZiofbQU1NVXhLWRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RcsfUR5n;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E522F60742DC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E522F60742DC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RcsfUR5n
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-70059e4dab6so941542eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296718; x=1794901518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4gqrRTSfkd4qUlgHqzykH7Su9/kkdmS/joWQRvX1nxI=;
        b=RcsfUR5nH1/51TD82QGz+wcZffAG+E/26DPgtSMCpzQjki0jF+BaKJn8IkHHGvL/uQ
         ZyaJy1OewMi1qSZWL9XxG0+zfPZnjXDB/n2307azVaeHdxmPQ8NUPYQ1UgfZ+2gZrTwr
         jKsmb5YnNfJoAie2hMr3bNJ3N3OAEKn4ijxkNRN6n7ot2K8PZiDKjXa8t93LXxZXxiHz
         UYCvimBQbtCdLEodV6RL3jatr4BcgOKRWZwrYKAwMoe5eKwEmedJs5saGHo9dLL6QWyx
         389JEe/gogIJC/movcWtf2icq7Gf/ORUyc7Xdkr18qeAAFOVpmFzKYtPUPtZKtvxlp5M
         JoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296718; x=1794901518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4gqrRTSfkd4qUlgHqzykH7Su9/kkdmS/joWQRvX1nxI=;
        b=vG4Ezh9YkR/blxdQzyGWCMT2RiU+myvSnv0ZbMLpnHzgeFYWECbeXqayNYr60DV7P7
         xcx7frBHHER76j25uxA5CV2RGGB7W4tAjej0dFDtltzFcWalNOaM1TOIk90TJqKsuPIH
         gVkJvXXLbRixGMIMNMkapk8c14ZEidLsjGd1XPQpQN6uS4bHIZNoFLIdpklE4WVtaGee
         v3VtG0zCBffCJ1q7+x4LUZMikS4UQyzdy+ddsgFqyHD3cxHWspnRSsXpKKZh684f/Rw0
         mMhyxK0HOc5S1a16KHqSujGIBfAlNL66GmHgXFuQDOrjXY/sBnYChqDyV83WwEt7m2PA
         p7Vw==
X-Forwarded-Encrypted: i=1; AL+hErHRt5s8DGFh3df6ZV2C4JzOOExRLjbLsQmZiDn/bRwE6G+ZRfiRuY8gEdiw0RZbarCa6Ox7IaNGGflStkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/McAFIiyxFQU1GWn2XhJ3cGnDVvJa3EdwLLHcOK2og4UYNOErk
	mGDjUHx+f/QKh/x0570bV+L5hETUbJilo+llocCORfGxMGqndSr9pbBLO19nQteK
X-Gm-Gg: AYBFou29/oKycfmfK+3PCfeVPN/Y6ZKfXj0i9GdmA/1594chKaWKCROJ07eGtHunjZC
	xJ6GAXKO7OV462F6qY+yDsWYUDXuvVVD2WfNROHSsXMvWFLsPz2za26it9u80Qtpeo4X/D00Urx
	wFXJ6xKd3rRI/u0QgAdeiQpBuWTC5yCKJYzOwSvxhekpli+WCvtXRwlzpsWZgW/NeKWoNaGhHC2
	0ZmjNbxg4JiBWjAJtAkOqnd3I2jbb4pqXmm2/gmNTed76TMs9KF4Apfkmzg0tSqKbTE7R8nE4lb
	HN4k0XuLdsk5J+C95eWCQMsR+3vDrRSyiBRCj7ErkMtok7oInuO6u2FOEYmaJJqjSQnLl1xG5/n
	4ivi+HRor7s4woHa+0RSX5nJ0nl/qag43x3IAB+8rWcxN/6pIzYKI+s0TUVzWmrh4E8oU7dqm7Q
	6OXBu2HfrInoAGq4WYyulg2j/USew2Q9t/DiXDILhgK6kz+KJlEzzW5Z7dE6EgxcXDErs5WBQ4Z
	BXfPIw1qQZYXD/80MUwVOIhIjJJHM+DjTmXkJnXrcJSuRxaHROBDhE+kDKzqRTpB8lYKbcF1cB8
	sXvOeDXXSJ3+6ZsciOo5uj0PckMI7o7lS7lkDUlT7W+66T11bngGtA3d6vgjds2WMB5IqD4ik9s
	DAAQNHWGhU60fJwUJ3RmkoENYQn72X+YtEGNdgtLKzIMrYYrkOQmFR6xK3LjfNiVBQiN/okIJqG
	VMicaRB21ibWAja6xcZlDTw502tXWhoTXXNiOmr49hfYkYr5MUvGsNsBxUg0GbxHFi8kSq89UR
X-Received: by 2002:a05:6808:67c3:b0:4f4:d914:8603 with SMTP id 5614622812f47-5683c946635mr1510202b6e.15.1794296717893;
        Mon, 09 Nov 2026 23:45:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:45:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:54 -0700
Subject: [PATCH v2 51/58] mtd: rawnand: mpc5121: retain chip state across
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-51-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Drain NAND access before unmapping the external chip-select registers.
Keep the embedded chip and controller alive until the final MTD
reference, and unwind scanned NAND state on unsupported geometry and
publication failure.

Fixes: bb315f749f8c ("mtd: nand: Add MPC5121 NAND Flash Controller driver")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mpc5121_nfc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/mpc5121_nfc.c b/drivers/mtd/nand/raw/mpc5121_nfc.c
index e6594548b7e0..1618f46f69df 100644
--- a/drivers/mtd/nand/raw/mpc5121_nfc.c
+++ b/drivers/mtd/nand/raw/mpc5121_nfc.c
@@ -611,6 +611,11 @@ static const struct nand_controller_ops mpc5121_nfc_ops = {
 	.attach_chip = mpc5121_nfc_attach_chip,
 };
 
+static void mpc5121_nfc_release(struct nand_controller *controller)
+{
+	kfree(container_of(controller, struct mpc5121_nfc_prv, controller));
+}
+
 static int mpc5121_nfc_probe(struct platform_device *op)
 {
 	struct device_node *dn = op->dev.of_node;
@@ -636,6 +641,13 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 		return -ENXIO;
 	}
 
+	prv = kzalloc_obj(*prv);
+	if (!prv)
+		return -ENOMEM;
+	retval = devm_nand_controller_init(dev, &prv->controller, mpc5121_nfc_release);
+	if (retval)
+		return retval;
+
 	regs = devm_platform_ioremap_resource(op, 0);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -644,14 +656,9 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	if (irq < 0)
 		return irq;
 
-	prv = devm_kzalloc(dev, sizeof(*prv), GFP_KERNEL);
-	if (!prv)
-		return -ENOMEM;
-
 	chip = &prv->chip;
 	mtd = nand_to_mtd(chip);
 
-	nand_controller_init(&prv->controller);
 	prv->controller.ops = &mpc5121_nfc_ops;
 	chip->controller = &prv->controller;
 
@@ -782,19 +789,26 @@ static int mpc5121_nfc_probe(struct platform_device *op)
 	default:
 		dev_err(dev, "Unsupported NAND flash!\n");
 		retval = -ENXIO;
-		goto error;
+		goto cleanup_nand;
 	}
 
 	dev_set_drvdata(dev, mtd);
 
 	/* Register device in MTD */
+	retval = nand_set_release(chip, NULL);
+	if (retval)
+		goto cleanup_nand;
 	retval = mtd_device_register(mtd, NULL, 0);
 	if (retval) {
 		dev_err(dev, "Error adding MTD device!\n");
+		nand_disconnect(chip);
+		mtd_put_master(mtd);
 		goto error;
 	}
 
 	return 0;
+cleanup_nand:
+	nand_cleanup(chip);
 error:
 	mpc5121_nfc_free(dev, mtd);
 	return retval;
@@ -808,8 +822,9 @@ static void mpc5121_nfc_remove(struct platform_device *op)
 
 	ret = mtd_device_unregister(mtd);
 	WARN_ON(ret);
-	nand_cleanup(mtd_to_nand(mtd));
+	nand_disconnect(mtd_to_nand(mtd));
 	mpc5121_nfc_free(dev, mtd);
+	mtd_put_master(mtd);
 }
 
 static const struct of_device_id mpc5121_nfc_match[] = {

-- 
2.53.0

