Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868F737B01F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436402; cv=none; b=fLZH+h85jvcuy5mCsIZehL1mV2THm0ThlzbBAeiVJWgDEBzBXWcjxBlR0q2BjASeB7Fe3cLX+sKC+K9hDkgHm5t1W1KEXRuaWk26H/3qryCL5cm+1rcCNn4lfNHgdOgN+LAd1fjDWRJ5Ly8LJ5KgcPPI/hjj07TSCIuxohrxsfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436402; c=relaxed/simple;
	bh=vGrgc1V20xnDibYfrrIi8qa8Tu+oEf6Obx12JO0LlVU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TH7PSi6Ia/M4CnlgLT8HWCZOVSdOgu21gL2mO0lLfukbbeJKM2YFVOjBNkX+r0+9Hs8b6z+3EXtwJ16oC1MchtiPnUePuT/aoa63Kp2o3540V8nyoKQBSxyEOAtfBgrBRpTlLsa6SALYo7tVeEBKCaLhPACj6B5YeNQ4rKGjsfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dFNVeVq+; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFNVeVq+"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9121fe38733so26937636d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789436399; x=1790041199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jA+Gm6Df8SoCPT+Ci3PSWeT1OW/hMiB/+pCm2kOG6rI=;
        b=dFNVeVq+M/lMHuKPWkDAebAOWy5lUJ4EYn1ppVLqLZbvAzxwlA/fDuvxb9YL3WZAhC
         TFL7crcWSSH9FRa6A3g8ISjHUWRnbP2HoVnCiGfp3uE6auWW+0DS53iPcVNjR6MvFRd7
         2mxqxDQSHC4jL4kIGYjhmCGNmUqLmzAR1UwT2LTf0ZGcvWVZcFiCLpLl40Wx/3i4RuWJ
         WTSUY3r92fF7bUgppjVIVO97i1/J1j/27U2xh7U/yGWQWVFhqJoPiuW45GuHud0VOEG8
         KHlX10MT28HyM5lx5u5C6j2C9XqfhRql5wssJe5evUoBAwcUGHIgJcT4GMXYy8yX5MGF
         LoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436399; x=1790041199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jA+Gm6Df8SoCPT+Ci3PSWeT1OW/hMiB/+pCm2kOG6rI=;
        b=QYjwE4VdCwSnYEl8r3CFHOC1+4bzhQmwyRuZVlzixE44N6vfIQGYSP6SNPbqTNsKZf
         rWjOktLUTkzTQjeAc2XcLpqIgeQZK2V07jAR6sut7x60YCLodN+aTwevAk25Xlcqxy2h
         HJDJiuWo+ZLrmpM4X0s5M3A11qFQo0PniayjBJvEBy1cBkJjdPRdGOT9PG7/vUOYt8Fw
         H3bpNrLmxhwQSqD21UaioHnfJUH1764gCwp3F3IKZefM3jgVjicUW7o2X6CZnHdibciP
         /OaSL298GVeHU6TG42j1CdOfEPRu4KEAtZ+n6xGUwsjaXNTl/z+awm7Jek5lPYtylcbp
         8X4g==
X-Forwarded-Encrypted: i=1; AKwUvByXPRhQAmo6bhdA5OFsNgiYtQbiUCQXODIZ9NyMdHzV/TI9q97Hkjgk3YrGKIg2Wx+/4eWTjGVylpDUnUs=@vger.kernel.org
X-Gm-Message-State: AFuF++kS+J0voAjfb9EKcwjNyg/4fKm7RA/dx2fAPS8nZdBpX9SFgtFm
	jjjpZ04k5q4jX9DredOHj9YVAlFYrxx7D/n4APpf5n/SHMVGMGg4o00=
X-Gm-Gg: AYBFou1ojEa2nUw95nOerCwODq6zcda34PolRLOHBQGX+oywXQ2ICDb1KlfqyntCC7a
	VcT0j4Hz0VAm4pULBdftAfyPkIB6KWXwPaOj3vTQRwX/pvffBTiFi0Bi0Hi2PYLJJiNP8kK5XM1
	IJjNoCQycenFmjtzGIt802bU01ZopFVcZQiUOOWtfqzOgaRxennWPiwNdWvaOXCk9DobyRWYinS
	1Fu2TffZdX0vVN1w6Ato8pRDoTebWi0Y9OJZgXVy3pw8N9XUKpOR7GVWV74tYjADvMu1XhNSiqS
	oDZzApHNLdR1A+OFg+eExW75bGEBXXlmnF4hECDkelJz15sffy9cPkU84ox09dGbrSIFft0Evx9
	I2t7C6JdT1O42ipdKb0uL9Z+e3BdupYRSLPgi5q7ssjrz04B9AEkWRT3EJQauhncmRMBDJjlWIm
	FGLtliNIu0HI2sbDg/b58eKtlHHfgmeUEHs5UqJA7k6q1+mDJ/BIJkvNQ/XHiH7rXB6ScybclVE
	xFNDhl5ANPi+e5Uvs0pmclGYi/ivmJ7Ckc1MCrI8N6YL3hoe4GY9Tc8HcdEFPunKC+RKpcgz0rJ
	sID7GqCfSbiFzKiQb5o1Mbx4gS2pqAY58oFiitjJ70bH5mUjT99feal+b9aHUBuQhd6E8A==
X-Received: by 2002:a05:6214:5f05:b0:910:6339:1888 with SMTP id 6a1803df08f44-9122e4d4ab3mr103911166d6.2.1789436394569;
        Mon, 14 Sep 2026 18:39:54 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4787eesm108637906d6.21.2026.09.14.18.39.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:39:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Michael Grzeschik <mgr@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH net 1/2] net: arcnet: com20020-pci: clean up failed channels
Date: Mon, 14 Sep 2026 21:39:45 -0400
Message-ID: <20260915013946.73963-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After com20020_found() registers a netdev and requests its IRQ, seven
allocation or LED-registration failure paths free the netdev without
unregistering it or freeing the IRQ. The unfinished channel is not yet
on list_dev, so the common remove path cannot clean it up.

Route those failures through unregister_netdev() and free_irq() before
free_arcdev(). Keep failures before successful com20020_found() on the
existing free-only path.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 6b17a597fc2f ("arcnet: restoring support for multiple Sohard Arcnet cards")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/net/arcnet/com20020-pci.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/net/arcnet/com20020-pci.c b/drivers/net/arcnet/com20020-pci.c
--- a/drivers/net/arcnet/com20020-pci.c
+++ b/drivers/net/arcnet/com20020-pci.c
@@ -243,7 +243,7 @@ static int com20020pci_probe(struct pci_dev *pdev,
 				    GFP_KERNEL);
 		if (!card) {
 			ret = -ENOMEM;
-			goto err_free_arcdev;
+			goto err_unregister_netdev;
 		}
 
 		card->index = i;
@@ -256,14 +256,14 @@ static int com20020pci_probe(struct pci_dev *pdev,
 							dev->dev_id, i);
 			if (!card->tx_led.default_trigger) {
 				ret = -ENOMEM;
-				goto err_free_arcdev;
+				goto err_unregister_netdev;
 			}
 			card->tx_led.name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 							"pci:green:tx:%d-%d",
 							dev->dev_id, i);
 			if (!card->tx_led.name) {
 				ret = -ENOMEM;
-				goto err_free_arcdev;
+				goto err_unregister_netdev;
 			}
 			card->tx_led.dev = &dev->dev;
 			card->recon_led.brightness_set = led_recon_set;
@@ -272,24 +272,24 @@ static int com20020pci_probe(struct pci_dev *pdev,
 							dev->dev_id, i);
 			if (!card->recon_led.default_trigger) {
 				ret = -ENOMEM;
-				goto err_free_arcdev;
+				goto err_unregister_netdev;
 			}
 			card->recon_led.name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 							"pci:red:recon:%d-%d",
 							dev->dev_id, i);
 			if (!card->recon_led.name) {
 				ret = -ENOMEM;
-				goto err_free_arcdev;
+				goto err_unregister_netdev;
 			}
 			card->recon_led.dev = &dev->dev;
 
 			ret = devm_led_classdev_register(&pdev->dev, &card->tx_led);
 			if (ret)
-				goto err_free_arcdev;
+				goto err_unregister_netdev;
 
 			ret = devm_led_classdev_register(&pdev->dev, &card->recon_led);
 			if (ret)
-				goto err_free_arcdev;
+				goto err_unregister_netdev;
 
 			dev_set_drvdata(&dev->dev, card);
 			devm_arcnet_led_init(dev, dev->dev_id, i);
@@ -299,6 +299,9 @@ static int com20020pci_probe(struct pci_dev *pdev,
 		list_add(&card->list, &priv->list_dev);
 		continue;
 
+err_unregister_netdev:
+		unregister_netdev(dev);
+		free_irq(dev->irq, dev);
 err_free_arcdev:
 		free_arcdev(dev);
 		break;
