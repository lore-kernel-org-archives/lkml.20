Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810625;
	b=Ev6fvotqCwMaVli3vnkv6weu4dhkLVAFYsJSaMX8awB1vJppGF/B9kcj1uZooi2d4i7I
	 EUN7P+N8l2w/MNGf3hNKlx8PFhP9779FnxhpwybaZL/sM2NjUz9kvt4mX21yuqiUpcV6e
	 vZjtdxCX2rAYIpgoN8z4E+ZDq6EkcSihURdCr4sneQeI3tTX+yx48K0wj/cREw5DvHqLA
	 VYEpMPD0NB6cPHRpa+l+iRdJdy1bj1pPn8HaDUzLyNIpxFl/wXjhLoH46wB3CwQQ9T8+y
	 cMGdzA/hfvC9hpJgHzbvch1aG9meYzWSQgcTenIxs2bpCjDR7q6DiCXnvIAOYkGja/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
	b=TEqMB3LUz/HRsvuhpnb654pRxXSUaHLai3cQvBOmoyfWpkQxhueXyk38qC/DA1ujY3On
	 T2rtLCHTks4hNr6cYogcL3JzRPZeIjjq3Mlhv4k+hckRA/hEBmJ/eH4E9sRtCkj1BrtZr
	 lGC/TFiLEuWNtZsxH5Mlxyj+zG5Ia5/zxC2JRZr1dcanaZik3rqpqwr8H6mKcI2AIXEdg
	 yKoGTnrk7xf5RiXwgiv4s88tJTjvw+++b1XH3x5TNeQ3yeuyzqjNjF6EFLPP2sI4eFWnU
	 LNBNc+ncjgBAeQlOIv+XiKm4sBgASvRBV1dqfRfnKL9DnskFU45FrIPp/IiC7tk3iXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abwUxWrP;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E35960A2606
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:30:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E35960A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=abwUxWrP
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6df7f544919so2398723eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810624; x=1795415424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=abwUxWrPksbRZAObUB+BMR12fptD4awNthNpXH12EBI8po4wPUVudA1i++FCoFXKgM
         YRkm5JW1wIGSyUZsoaa3xArm9rfUVbYuBgy6OO9Qgtl/jYLx61gyKBIt4rYcExQ+w3aV
         1ihMABpNQbIWMXnjKPq0G54ArrJsYLFV3Goqav3dfUmqtJhzy/ODyWyuLWKkLp4b4KZJ
         JFxPvDwCaxgU0XLcnGmsNn6BfNFQuI5beUHIVvahNwkeETfSGWJnDYLdy9rqYu9vt4b5
         ydWYeQqxchtqJmgPPTn7MvHrT6W+gm9vAk2jHqifIPkPuTLNkGADr11AheEnSDLG72ka
         vPcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810624; x=1795415424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=SEfE1G1nHjKwFbW0iOK8uXCnEyz9/wqs05LnLHJ5AAoHoB+LNLcIyKDweYbhy3YaZa
         G+Lf6BLQfC6ZnSxW7qpgP3ckF9uDK8yCyPw+B6D35L7l3ueBg9UfH56Ytc66J2aHKHft
         /NXj3KZPu/U3TXdN0ylF2KAnYpuvwIRlEyxZGitbgKAfx0aR03GfSfbnZAkLBYqKGJoX
         NfQiF+uCRSHXn86810ZN4uc6I6tdTmx1KfvBO5Zr62GvWjQ/PePI6TZa9iP/pm6tV3s3
         No44qR9TEjfh/cDHqdWFX7fnIaC29HCNUP1a8WoGWnokVxa6M3875j+/67Rwmj7qZTLC
         69/A==
X-Forwarded-Encrypted: i=1; AL+hErEehOaiuiyWyNSW9MdF12oXosS10q1Po8qatjogB77qXvYsonkM/HOvbTunPbuL06t7yLR1xWOAvLWiPoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tddie3RZkOgpBlHSDpYtvqrwd2fV+PY+CV6N+PtQbUr/ipUB4
	U+niO+Yohl2AAKgS2AL40AT2ZCxodhpTsAKghkFIeBlaYawRP3P9KF/Q
X-Gm-Gg: AYBFou3LzFipZxEUl5Ff6XxgHccseFaS2lPZ2j0K5LXLk7FFXMuxSGv0yMI49GTV2KI
	hV9r6hX9yl0j5duf1NqMbNL09QnzIiKGQzzk1u0vzOAnFaGZto9y/v7Hf6ElaoY/ArOURR7KWCE
	lXkqxBk83HeFu1lVC5RhOTmD0jrfgQbfiutnIoPvQs3BbXMUT4OHYJL2MUfsVPp8gZ2gXtoLs+8
	k8RFV3rbBTZgf7rheNidQdrWzP8sVqQiG7epj+C4vBZFBVWUWfaS7iCzpj0dWDWwzf+LQFiZ/Z5
	ClAHMCGDYQrfVfWHfNbykMXvwMQXjrqGhDNWPzq8l2Ykklz6Pz2QAlrC6YwSB04/G2nmZMfZ+0a
	KnsJML3QtlbeDyBB7KzucBjpGpC5GUq27GbtQa5eLf4HqFkYtxGCUD00M1FAMlCLqOtKeA2+eKU
	ghJ/hpyxrjOZ/ccuAnsqouADKLvSQ56L5Kljko7iIH5kf7ueD62Jta8tCJi4lP4RUr39IAjBJ8i
	1EM4+uYOhe1naZqGmAN/AOMvl6UjPS559LuOnugdGFMO/34kGvSFPj9Mv1jyKOi+OjwcOI9hzl3
	iBRx1mHKj7WNoc/1wM4wKfJuG7qyHgDrq8IrSyGoonsWf8BV8y8GXSH5meAGq13A9UYzPSr1J1H
	nXlxB2Hm4hqanbHZlO4/rEJYI/KxrPvvsGOUFGNDVYRSy9Bzu9Ya2NVO7wzpvv8fdmWnZ2n75R1
	d8oGQ2PcsKv7RvVn07Jb8d/RgY55ZmNX79wDs71kod730JYfGM0QE=
X-Received: by 2002:a05:6820:f016:b0:71a:ce4f:4a7e with SMTP id 006d021491bc7-71ace4f7812mr3792885eaf.12.1794810624151;
        Sun, 15 Nov 2026 22:30:24 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:30:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:46 -0700
Subject: [PATCH v5 31/58] mtd: rawnand: mxc: retain open-handle state on
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
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-31-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.17-dev

Keep chip metadata and controller storage alive until the final MTD
reference is released. Unregister and disconnect each published chip
before releasing the resources used by its hardware operations.

Retain the embedded legacy controller and drain I/O before clock
disable.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/mxc_nand.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/mxc_nand.c b/drivers/mtd/nand/raw/mxc_nand.c
index f976cf3f7210..b68c2f13234f 100644
--- a/drivers/mtd/nand/raw/mxc_nand.c
+++ b/drivers/mtd/nand/raw/mxc_nand.c
@@ -1694,10 +1694,14 @@ static int mxcnd_probe(struct platform_device *pdev)
 	int err = 0;
 
 	/* Allocate memory for MTD device structure and private data */
-	host = devm_kzalloc(&pdev->dev, sizeof(struct mxc_nand_host),
-			GFP_KERNEL);
+	host = kzalloc_obj(*host);
 	if (!host)
 		return -ENOMEM;
+	this = &host->nand;
+	this->controller = &this->legacy.dummy_controller;
+	err = devm_nand_controller_init(&pdev->dev, this->controller, host);
+	if (err)
+		return err;
 
 	/* allocate a temporary buffer for the nand_scan_ident() */
 	host->data_buf = devm_kzalloc(&pdev->dev, PAGE_SIZE, GFP_KERNEL);
@@ -1796,9 +1800,15 @@ static int mxcnd_probe(struct platform_device *pdev)
 		goto escan;
 
 	/* Register the partitions */
-	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	err = nand_set_lifetime(this, NULL);
 	if (err)
 		goto cleanup_nand;
+	err = mtd_device_parse_register(mtd, part_probes, NULL, NULL, 0);
+	if (err) {
+		nand_disconnect(this);
+		mtd_put_master(mtd);
+		goto escan;
+	}
 
 	platform_set_drvdata(pdev, host);
 
@@ -1821,9 +1831,10 @@ static void mxcnd_remove(struct platform_device *pdev)
 
 	ret = mtd_device_unregister(nand_to_mtd(chip));
 	WARN_ON(ret);
-	nand_cleanup(chip);
+	nand_disconnect(chip);
 	if (host->clk_act)
 		clk_disable_unprepare(host->clk);
+	mtd_put_master(nand_to_mtd(chip));
 }
 
 static struct platform_driver mxcnd_driver = {

-- 
2.53.0

