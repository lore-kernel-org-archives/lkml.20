Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794593745;
	b=YcgTANqxXy7lrMC3mTGxUkZp6bX76vsroQImW8+xo0g9UT4KYDrL79wpjl/nIKjo9tnD
	 1CbxDIJb7EbykmBDcTW0Yu+8pwhPMGP4FqvOxiqJCOdAjI+92/rAJ/+mLXmnn4lsMm56c
	 hi1V4vcqRM7GGsr0WuDmXkK1nAVXme2aiE/T94ds3glMEj1HdjUhx0D4mLxUurSchS0rW
	 fiKPMUFpp+C1xXptcEsus61t4XJWS149YIj2GW+MDoH9QOvQNHSoEjU65x8kr0RgnTiOD
	 cx7JbI2ZKMLZ+8Ys+Qtj+C37jFI09rwH1OKkH4ZJ5DEbC54pDt0AkLC2GN+Cel7uTFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794593745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
	b=dVxDFF9l1mejXKVZecks7pqTZbXeMt8mQxK5nKpWfT7pjBhYidUfuUTNiOx3kUTgIEJ5
	 ytPOh5Z0SXX6ctAKmXGEAQ3Ny8Pyq+g63DXGKwykdUfOqQI69mXr0oeyOz0fgMX/hYgli
	 HI4izwm2F8qxPK6MDQ6s+lnyTJRR+B8VImfPLUNczQuaPY0FIpMqCisaO5iOaKAZu91Wk
	 LAJkXz8766MUqmbAJ6w414ohP2WbaIrKAsCb++IDsRnJmESiyNgFnaFF6LXbqJNOWoZZA
	 GadY+nrDkwGy/AuUBrMz/9BrTUXIweDRCHzYmhsYNkGf1Zjl1GuUjG7SOaxlfI2oHtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=paVBwKPo;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA44606B51B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA44606B51B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=paVBwKPo
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-86156cf8a7eso2119224a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593744; x=1795198544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=paVBwKPoYhkD++/pVim+IpUhTT6ahkoVBOziAIrwKhbaVq+2lLU1fKcF5FU7fo2LWC
         ETHKnBCQiPehCGvaImxbYGXAGbbxwvhxxdsErsYzqBSMhS/zWy0lPxW43t5CZm451SAB
         A/C/6Ip8iaaQPm6DPmIjuZokSWnLKDixKifFI8y4fSAzkh/4MF2BAw9NQWsh08drLULQ
         Ert6lS89KeN/PKoPPzUt8Sg4qifQaSz+WJelO9WUWYd+9p58jYhoNnvOsHnHKW1B8Ouo
         83c5Grty6gAckJGSEC6jUM/Juro7M0VtM7DdgBN/HRyO8hStplfEBx+glnZdPIflvTE9
         LpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593744; x=1795198544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tE/UBd2p62aoEXVpo74EZZn6P2jLel66mmdXV8wHZN4=;
        b=wWFWBXhFeecBHLJfHmKJ3m/07nVlsV58CRBoNDAY2o9NZ3zskZKt7sGO/Q2Y5g85y8
         fOUPeGzMrfIYKpjH+dirIxINVk7nH0UXmfvyy3fWlpIUPoRkBTGMdc1X0Q4V6pK5snjI
         K9xFqFxTucD33sgm/rWxOkx6fKLPkx/pRmjb7NgvUpdJzWSBkCnldTLFxABlFxODuGCO
         TkPdPhfsc+f/l6nEGsz3eFxb5wXQFsH01ahM8cg4jmth6cviKZSUCqRPf0tI1b58RVXV
         9ODjBshptgxP6W+OUaZmA8HII9MKjXe91VSEvVsvd8D3E0xNYXWBvICyKB103JrGMnXX
         OH0g==
X-Forwarded-Encrypted: i=1; AL+hErG4LyK39Uvsbduk/XdQoshXCn0+aYLuInNn4G3keO6Ath1P+JK8CAfCfPwpfgqo+806oxm3eYL9oN6zjW4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OC6X+QCItRFHLLpXgn/C5U4XFXVxPHRWyVqSMSYg8fgwueGyM
	cCgih8raM6Ho5YZocUfFlceW+L79F6AUdiTnLbhdRZP4QwymGfyHBsK5R12YlkDL
X-Gm-Gg: AYBFou0PzpVsxQJ3ORolPadPkSiXRtlYEumMm/IKq+BgOPPmOQSXuu7KD3rlnDH5gdC
	WPTb9oQsWX/9qIROq+BPcfFbKu8P3NMgTegMtGY7uKfT+NBaD16Z1KDz6KZPRgmVsO5ZW9PbNoO
	rl6A5UumdSUikqzH9u+xi11Z1qUgybP6ZKgw40oIp0kKOEoNTuq9udpzd62fsYDkR5TWygsLkK4
	h2dnCbDKxGEGl2/ZiXvg611Qh2abHVFCoMUlPfwMGkXgTaa+WjCyld64NYD6Wfkuh69joXOTNlz
	S6DC7EbO1JdMjsRazh6HidnaJSVvPCkxnWPd7aQKSHl+EtKNPGfeWwsG5NW43GO4QnzptyEXsYE
	gR3RFSWlUFQbJGpIcFMJt+r5hlTtuxWPnC82fNYk/ZpUmCXCXIE/s2rOaqecasF4unkcD/8fp2p
	11pZi2GHRz1YOaRWBFMbQLKXI97T/vSIVGHirTfDc7v7GQFff4o+2WQNAfOkmBZzQgP6yO57zB4
	W36g1YV814npLzdyn7OR4Env1XmzfjWRKUlpQk9vt5P/gOQF93PxCOIod2twb4+FExw54E4y7ZK
	URqMctEZ++0BzZ/t8J0Ht8Yux1/GjHfUyVv6PUQvqxXtVitEbN8Cp5OcpY6UvH8kOC3kwb4GAp+
	Rm6V01jUCf8RyJN5aDm+tdVLUd6LJCh3kMhmpw6yPXmeYsVzsYp4Brrj4tY3Czp0JeMSqz81nz6
	5QRWFL3oeddYTtBUM5e4GaXLrbnJlDaopr6ovwjFH69UwVwhbC27Q=
X-Received: by 2002:a05:6830:2406:b0:85e:e777:5f7a with SMTP id 46e09a7af769-861527a2626mr4421920a34.28.1794593744051;
        Fri, 13 Nov 2026 10:15:44 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:41 -0700
Subject: [PATCH v4 25/58] mtd: rawnand: hisi504: retain open-handle state
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
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-25-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
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

