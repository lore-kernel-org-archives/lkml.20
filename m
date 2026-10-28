Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793206073;
	b=elw1OAodcfjoO3TZAOXs4uTZJvFMP6sipGrn61lgBvwim46KOdUOkPOTJgkpUlhx2CSh
	 hVP59fiG5887FjTHu1OFEOVEMkzystmxRTIrOIwCakM4cdkmA7XPrzf1IAvDiiR5awyXE
	 l+z4EBLLCl4ZN+umj6ozGUBLLXvZdflJlNNruENgXcM8kauBW3KTC2tJ7VQKtrlVFaVKD
	 H2fQ1L4gbk/lOtrpcPESnnKlTLBIVuKk68iymiZmBNR5buXX2yyzls+kY7zXskmvB+QRo
	 wZ4p7IMFwGCfZvb84xyFh4mTe7pGi+kEB+4/MzOCqWJIhcbL/2CLKCfEkm0jegVwFbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793206073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Y3c8hKxTfQ29WS+Th581uoCwhl1GtRSUhRSi/lkyiBg=;
	b=X0qrofbYk023kfRhxm79JsZGLXRMcThrgBf+KTIbTmCdARE8/AaOnnkcw4FUBa8dFSA7
	 2GsIRU40Mo8pS0U7tqiHwcb/37v7pRg14q89vPxXMX5CVv0IxE/sGWbIhofOd/35tj8ni
	 jdBHpJSDl5UHlSaNXLoRnLieRhMcFHgWzoFDBZxia1N1BAsjdoeSc9e6t3EpvSOAgOAKe
	 h95HmDRiMMF4aGLKNyALuJZI4qa/saAwAUBzIp+L+sOlihNW1rwjHDwKYV76m3loGy0Lh
	 bfRbyJ4RcelH51jbHaO5BDYhDK0SQMlrC77EOJoIgODAIrnO15XU2ov4xKSNzOstSqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="n/+WkKdl";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFC660A2605
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAFC660A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n/+WkKdl
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36a121bb8c2so1503677eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793206071; x=1793810871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y3c8hKxTfQ29WS+Th581uoCwhl1GtRSUhRSi/lkyiBg=;
        b=n/+WkKdlLfVH0OD18dJk7m+iOZAmUe5EAufthxuSJhazbHSXxBR8OVHXSdkyOnMpCh
         qWlV/Nn+uyrOUWb/fLwKXa06QflK9CtFAnlNEOE7Xh/jTi0YBPLkx7rRzNnkhm6X6x+L
         c+sQxvY18roo99y8xMHBmwpjQs+YZfwCKd/F42GGTLYM9c4J4SzphbRSEwnRp4LoTTxb
         wJCXu5l2ZY51tgvnjK15eKkSUKeG8hjr8XJvVtkuV17+OhnCIX9wZhAxUhNSDQU2u205
         GVEy4Zv1RskZTCZIhSuk9pxRoSGNuGAfpFBfCYPGo7BO5wyHklOl+UsR7NpoQjY1cmX9
         NDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793206071; x=1793810871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3c8hKxTfQ29WS+Th581uoCwhl1GtRSUhRSi/lkyiBg=;
        b=v+MrdStDDnukSQvdF1PbwCssawizqfk2ftT4DVMhtEkJkyLb4F28qdIJbhkollDdmO
         gR+ME1mD5VE0VI9os4hi/JbCHFvN+Ug8UYhVTzNqMVXQ45Xybx8rYH6ToAH8Q4Ou4pem
         7Bc5BzUTjgyYfu+i2deal4HriMCAt2HI/dH+pR1ogxWhdhjanMe83oxLLg8NMp4luAob
         VJF9pCx/vV5ggUSL2489OTEB0KzViv1S4qXQWNJLDvSkqpA5/kcFW8S2bdYXQzRsR293
         29li2YJtQaf13BcmuRZrNYuZK7QaWzvIt79idqUmfxVJikNQT+F6YepOzG86ffzG1aGe
         cZjQ==
X-Forwarded-Encrypted: i=1; AKwUvBwwWGPe7PpTaq4viBJPRHULZNtw5Kn4zfzm1/Ev5rWNrdsrvEa28Pu1X9g3+IUJi2bNM+bbWI0hdLsko64=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWin/EkYlpcpN0tvRO14pmFYL5LGPNRLroMB8iZoyOrDTckzJG
	d0eT5+Z6bkAxndG7Itb0UCa/AJAm7s+yu6m/Kf0pmj3269hzLK6kfjY=
X-Gm-Gg: AYBFou2ThDsWPFLTXc636uGJmoCtum5DM5QN2jGk6xgmIZun299WG2ukSDb9lX1GVyP
	S0SA6D4DWmCGJTYzCDHgGWRChsnUZLF0Y1+e4PxUoPztaMIlT/PeQFQzJ/JRc5CXYEOp1AIuYEV
	GjOBYbZ78om+6c8uogiF3u28DSUnY0oi+hSaB39brK6rW1pWMXq6w4IKhJhZemOpyFIwRt36KwI
	EUJGqwp6B2cBhfZ5enqNYCwoXY6SmZmS8m58NSf70v/tcB1Wzno2Brhz+ttpjZCZr+HCBzis7dt
	mZwRJKUUQvc7PbYItbb1CYTp+wnN4XHHO2nAM4iqIwUY6QacHbcnZ3IOg6u3oOzKVONqhwNDJAq
	d5HZvWZdHBb+Rm0vNDJCxM//QBKWjt4HBSkQIRIh1x/40maxPATA3stEqElae6FZUdi9Qp95o5j
	W1psPZnZblNXBYClKCVrdpkz7Tpl3Y5k/mqobG+HTxt4yf3OVf9ArK0vBMQ+D5RI+ZQ3nxIJI5Z
	ybgBiMQPtZSdW2ku0erEZg3EIEMd/o5Ub4qVZldZPmkodf15Z/r8DtsdU+ICskFokmkOyHfZvr0
	ShXr3iJ4D4rhb69Jh6BsZIjD76HtqRxgUgKzNHzO0JetMOjUUQ0adAsoLrdx6c1PqtwN
X-Received: by 2002:a05:7301:c009:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a2fd52a75mr120073eec.4.1793206070780;
        Wed, 28 Oct 2026 09:47:50 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:7583:67d7:1072:ccc0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm16894099eec.2.2026.10.28.09.47.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 09:47:50 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] mtd: hyperbus: rpc-if: fix an OF node reference leak
Date: Thu, 29 Oct 2026 00:47:40 +0800
Message-ID: <rc-review-20261023-ai33-33-fd231771d138@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpcif_hb_probe() gets a child-node reference with of_get_next_child().
The HyperBus core does not consume it, so the driver leaks the
reference on registration failure and remove.

Put the node on registration failure and after unregistering the
HyperBus device on remove. Leave hardware initialization failures on
out_disable_rpm, since no node reference has been acquired there.

Fixes: 5de15b610f78 ("mtd: hyperbus: add Renesas RPC-IF driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
The object was built from this exact base with the patch applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/mtd/hyperbus/rpc-if.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/hyperbus/rpc-if.c b/drivers/mtd/hyperbus/rpc-if.c
index f448e23f9260f10abe17842849b312365dcd8294..aa69abe6d6bc674bb8cdb531bbadfb7b356e3123 100644
--- a/drivers/mtd/hyperbus/rpc-if.c
+++ b/drivers/mtd/hyperbus/rpc-if.c
@@ -145,10 +145,12 @@ static int rpcif_hb_probe(struct platform_device *pdev)
 	hyperbus->hbdev.np = of_get_next_child(pdev->dev.parent->of_node, NULL);
 	error = hyperbus_register_device(&hyperbus->hbdev);
 	if (error)
-		goto out_disable_rpm;
+		goto out_put_node;
 
 	return 0;
 
+out_put_node:
+	of_node_put(hyperbus->hbdev.np);
 out_disable_rpm:
 	pm_runtime_disable(hyperbus->rpc.dev);
 	return error;
@@ -161,6 +163,7 @@ static void rpcif_hb_remove(struct platform_device *pdev)
 	hyperbus_unregister_device(&hyperbus->hbdev);
 
 	pm_runtime_disable(hyperbus->rpc.dev);
+	of_node_put(hyperbus->hbdev.np);
 }
 
 static const struct platform_device_id rpc_if_hyperflash_id_table[] = {

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
