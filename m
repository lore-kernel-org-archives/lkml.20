Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196638;
	b=2Wzkri6xd4L9jXqYimWWNXJ3P4A5CanllbZYHaIL6MB9DghRYF39DtEg6uto8SOeAmUV
	 uDtpUy3ThZDAweTyf1KxbZ6/9OCnrb7iA3vfB9aB6li1G94EmwhTaJJh6zDMbIr8z9u+z
	 fOqdgOw7EfsQMpMxQO1BskEL3xszRej/b3gqGOV8rJuYL11LkcEKerPvIqoeJ0vvH6dF2
	 0i6KJWRYdJDm+R5BgQuxvPnc8P/Otq7skf2eGITKueXHpy5niYQcJRnglRYEqXcFstwQv
	 LHetBVzcYsWt+xTo2DqievZIw6lOIjxAStm+FJUmMzjvCkm9qATrfVfuiFoFXpOEy1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
	b=Guq7Lmhicq95pOKbZORSKEYIeg8qzLhtc9fVAkZy4dMdKZ46J2VT7G9QTsVevcsOIZ6x
	 KyQU9pGjsd6Q6XDhX2vVERhbzVjAlDsINPkE1Bd8sp1VR1cIKiZwidWO1j8B+B+rEkJ9R
	 UWhEN5FohDmZaRvLJXbGLR1n1/HlOsx4kiDRLe3ctpw0LoVLTWraCeE/5Fo57J86U6KYQ
	 kjcyIFAI0rP4JtYjP8GTEA1acOjOJkZjIOcNCixrFVHAHbKaT0v40nxw58L7zTfnqpQGv
	 /kY/LseFgbxCKYAavwrxML2kQPcNX2abIpY44FQAc0xz6Qgx1kJdRfbpIS+c7UTakMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhD46Ax0;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C487606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 03:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C487606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhD46Ax0
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a8cc11ac42so264561c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 19:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196637; x=1794801437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
        b=UhD46Ax02lVvzTXSCqc7wlSSw+K38YCbkGD8adP6ACr1JIGkoKbsmH16TwSp2vKNMO
         7g2NyPuAUgmx+xnaC1ezwQU06ZLtzuLkwL/i0lwTF9RjsN/OeDGWhL5fkfh2OFYRf8nE
         F7U8x9Fgqk++v81kIKE92hyxZ6k1bqefPf3Q93M993Xkk3T86PuVon2G06fxDbJ8HH4a
         w06NLtCCV4RqoacpvuzLXldopi8YATEG4gOqseckgHiV7R7S2AqdG01D4RwWBsXZlKYJ
         lahxFEk4ZXrNOJwu3FZknXFXq/WgFNVBNrcBYIWJcUkutxnMGHhgs5rbxI6gCf68bUjq
         xPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196637; x=1794801437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
        b=kQ+sdUWU8KrqxoW9qQfEAsska/i9/HB83BmIuO96Mu08kz7kfwuqrNo5XLiCFyHPKH
         LZKqTkMWbla4bBVdWtBcsHD8bdg9Oq3gI01VnTV8oGkykhAb//Kz6VninjgLi8OZoN1X
         U0x0B4vVV5D7wv0Pzbb5Xkyd0azVpcqmYLCBa9OI8WIEpSxWzZNuY0Y/AgClSu+YBilU
         9F8Kdnol8Z7nCkYX+TVGoeI+cKvNwg3/LKPPRaeKh/Tq5Dii75cBMZMw39BtqYynVomq
         e2OSwYIxK3Q1k9TCHzgS+uI28xXMwgvPlLj+TCLuv71McyifU+wDnffeC4QTGl7+mkyn
         NqLg==
X-Forwarded-Encrypted: i=1; AL+hErHqktrhS55tLSlCeMAMv0llr8MwNN4ln7J8QE8zGO0+7kTI5F/ihhn6NedL7Z0wa5llR3/yIqlXTcTAlZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ySHs2FIB9xxweNr7bNwnrrPHxAqpbbgv6nmd5dZvRanKYWLPZ
	4Qe8D6uR1RLEBlSj/GX1gTtxQ6WsTEggbNuoD5/pf4NMTvRrkGqNUpKi
X-Gm-Gg: AYBFou0NPS3Wbmb0bKJI+RJXFg6x1E0xvVUWWR/++DcdV2QY4yd+JTTPLpPsaonvsiA
	vRAYMFJ8DdWuQAZ8lEnmnMiwZ957g1GvjDdPfiMvdcsvdsV9pa1ogH/UoBY4L5YVpRqPrmzlw6a
	Db/GdCbXUj8X6GMkigVbRpDO6v/JWmUZDpUwRxOSjvZ4gPO51FrgdUXFQN2LwZWyL8hqyV4nueJ
	WLa9VtNm9tQcBJ7+p2UG16j+z1QTx956FeKpQHA2xmZs1q+vIQnRUjaKOQc5dZsbe6yv8IEUm+N
	wo3S2XSytxe3hGDmOlmY4WuuusOjXDqbop6wd57HaFQXS+elgTl31BwjUlsDYgzndHZRMNvmk+A
	s/Zn9+j68/1vyf9X3/PGDte70j0s+TA1UY270neMCtLtl5ZddmF0NHud8XvMuf9ekRjFawOMecs
	/lpV3mcOhpM9wvJBgfZDB/iZ5K4Unh8hmSFaILZoZBCqNN9mrYKZOGIwrNAK2rTSP+3b/wUTfdL
	W9I/5F9OYQMbNnhOUVODng9MREWqvsbxAM9qfDAl+PxNfXWI/WeDkUDfj+os6PYIJ/pQ4yF2may
	hxSO6m8AD5zgv5NwuwOKrgMCufUeQ8SQcdLs8fF+WoSedw==
X-Received: by 2002:a05:7022:1709:b0:184:992:c9ec with SMTP id a92af1059eb24-1b39fecbba5mr4108971c88.38.1794196635837;
        Sun, 08 Nov 2026 19:57:15 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37560d95dsm8720109c88.11.2026.11.08.19.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:57:15 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org
Cc: joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v2] pinctrl: aspeed: Use managed pinctrl registration
Date: Mon,  9 Nov 2026 09:26:33 +0530
Message-ID: <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
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

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it on device unbind.
The registration can therefore outlive device-managed data.

Use devm_pinctrl_register() to ensure the controller is unregistered
during device teardown.

Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Changes in v2:
- Add Fixes trailer.
- Add Reviewed-by trailer from Andrew Jeffery.

 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11af16..eb5f404af8c2 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,7 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
