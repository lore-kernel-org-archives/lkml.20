Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593767;
	b=VDU65erRfwSPNQfEwawQNR/W3S+dmvuDvKGJpDtV4lq3ErlvSbwRxyu1yidO2cbyl19X
	 YfeZJtS7QpMu/Tsyx3X3My3KaObIOptF99OsL+/wYlvU9y0dCXwjfJHZATkHUma1IymI2
	 ChMA/t2iK5O4rwTd8BtSz0sVNnYDVof98xG7DnMB4vdK88ujKjEy72WHBtJmt5IwOYMmO
	 NSRoVHz8/QxPZWiBYbLKUddDOFrCdP9UV2TJhhlSCcpnLIhAQYOL7h6nbQ2YlwdNmtiRf
	 wIGahHRZE3DhEl3cqZOsD+XOAW2PS6PHxNZuZKG3xkzOIUe8HLxfytSr5NJ1ifSUuhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593767;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
	b=n6n9L9f6zED4AJIhrR1uYSMjD5CNHAx3fKnveMFpaTzWY+Oz3tRY8ucp6FdWJNyxHVJ/
	 cjNlByaQ90ZHlDsQ0+qa9igzQzYbsm84sTd5I64nG1urofTfKLLLIQOQQZllb22os41mJ
	 azsxsl0SBZoQ1Z2cAGhOlAWHMy2Qgt1symg9WtJ0xUCdl/osPCxYf0ll674OjvD7xf2fz
	 a1777j9Usi1zkHRXhAawFElnmCB+BiAmCDJEIze6d0Gy/p5jz7rZYvXe8wdHJEDwhH4K+
	 +x4o35HDrD4XLn09mXN6HWLy+wstjRbBbCn8iq3Jj6uJVlhMI51oPTeYPaX5d4Tx50A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfYdLbgB;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86A660A2635
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:16:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A86A660A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hfYdLbgB
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-8253bc5a613so1454541a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593765; x=1795198565; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=hfYdLbgBd1rPRydbcon0VoEUcyJzRj03xddX1Y6CzNPWXdfuZT+PNNUozroP6JKWY8
         cQEiSyJ2zKAKcbY18jcNHA1LmC4/XLTkDIyrPaOnwtuqDs/rjf0XuebrnZa3m2WjVWd1
         X2EiGSSld6VcdQHLWLthIUUmcqke78f6ZMDPw1BE8aTZz4tKIXZlet5rVrYJXwR36Klq
         X8EvQvYvoj9Kopg1p43zyYQbdplyzYgOrWQUweazheMqvZftrW+DoO+B4tDygpnXHQNG
         8TGwgH+KH2SW3RMJONL7+BSEptoZ2EngxoXlzSh/r8mWLpHF2Jr4V6Pl0OHVpHJMCQBj
         nS4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593765; x=1795198565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aL3SdYEEyAHQY3wjEITl3iA3pxg0pSYQTXWfqffrDSw=;
        b=bTYGsAN43UPgRNXrtUFcIw9UQ+2Qr4RKqrVLs7GJWF3THAuEEgW66x/OuLEvw5EuO0
         GsKbjFGYU1oWU/46lHBx8fgYlZyRSFBH2iZK58lX8czyIpzX1s8GnKBgEFQkeg+oHDPp
         D022Jmjgs92y7TXtbHt+ya1g0DL5ojT5MWYfoCtyQZihP7Z+7IVasBAmA4zJTj5iri1H
         WPAIfGNfCWlouUlNQAXjtZX4W07voHvwv+vqOxjQmQGYbdsTgGV//on9RU81bYONeKDK
         +kl4tOknEQtO3fa+9ZQcsEI54+j25aYYbRCIzIcRXeIhpoPlgj5JesItOrJLZB1Ttdoe
         HIdA==
X-Forwarded-Encrypted: i=1; AL+hErH/Kw8hhyPgKbUHxYVHWngxirBFrLW/IC94E27fuLmkDhyMI7d+L+eLg686AYYmQmnn1/hlaU3S9P6Ni7o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d5IsTntd9t+fY0lmTmpCB316zyRvQ/oUacXVZjNZczzxViZOm
	3+rvCyfhn1lQRZSQ2QA0UZs8YN6WLvBYmdwzLVXBg6Wp30A32Aj5H1kTrnF4/mk3
X-Gm-Gg: AYBFou3iRf/eDRiLQpBG0qlvk5TOGcExD7ul2VuVygQDi5TGLppxD3zcBCEEZlgJSCV
	k/8vPaeRkTbU3d9LlRsniXst0orjiqDP0dv5HFERyiJj/T4t18ltZUUsb8uzpDBHegfGnwINa31
	G51kkVgAk7MSGIKzlh3eo7842T0l8hVFmWzHv9xYMR/eIbjYHrtEK6yx7YspnYx5H2Rf2V6qGHB
	WGP1+5eoASew2Ln4iAK54Bl0EDy/BCxwxr4FpgSDBd52DNt7Lg/G6/sheQcXhoLiuHcPN3kiVF9
	7siHf+n83xzBR1RoIkwI2j87d7e6Ks/fjdGwQd5butVnbsOcniI9pVXRtpDVfXZ1cTdBR97nb5o
	RoMK6Jz6JlByX3juA3TkFI+eZHWbNr3l1Ke7LeIC53RjkxGbcHSbeAA0oppWhgUPNvyzbB5PVjN
	mPHgqsXNMtFs5G4r0QGP5sdW6jxj0yuid9ueS/sQ3kP3pW76rLWO4gAgzYV34xqidc0vsBaxFeM
	5Am3OKEbn44uCjeU/8emWCNmizzVZMfdy0KtU1DOYm7fJal0CkqLPkr/38MRIkx76zKgHUJXvPz
	cKgUEaKp06U/SeNSWUpOb/xmjg6Peh0OBg3KPz3/5+SBhePUGsno6VAT/Jp7fWwt5XtIrenMEqf
	PobB+JfAzprvEY/7cPa7ixoZeU4hMSbsSNk7/upktT1mBoaBifXIuzC1QyzIuzJoDZmX/jkOi5g
	hQd2Yzl0h5RFSFvziahS2ouJRw9qSRyCGeAa+9k790X/Syuo7PZmxswgJY4qKxMHXjZ1zb2b3KT
	A==
X-Received: by 2002:a05:6830:230c:b0:822:a034:551f with SMTP id 46e09a7af769-86289738d61mr4118424a34.2.1794593765498;
        Fri, 13 Nov 2026 10:16:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:16:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:47 -0700
Subject: [PATCH v4 31/58] mtd: rawnand: mxc: retain open-handle state on
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-31-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>
X-Mailer: b4 0.15.2

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

