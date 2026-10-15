Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A854355C335
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792084594; cv=none; b=JvHrpKQ1Go3fN7duiHE0H6/o0jDSlKDjZ7DT2TwfJoLmuk35pg5+cLSGpXJORxKvV0NHTkuarr6FrSb9NL9p7fy4zX/bi/tkDlxKh371wloR3MZdAUQfuYQu6QRqwQZQeDEEj6suukNmxmwdkhfBoTfsYVsvVazlb/drFLtwvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792084594; c=relaxed/simple;
	bh=zk3J/AL6+Z3Ly59Klf2ISnugpy+IF3qjEzcB3g2kr28=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PG0tnYy5tU9Vyq3hDKZcNYO+MRk5Jqe4kIRY5Ad3uDbbF5AxQz6srhEckhAtLnX2+17JQYGv6jQhmgwbcIEgVoh/IAKS8R13pb0xUHVNNHil9JhoXgjrlCJwg/gIGTnFmGPP9vKm6F5O+10a/kxVJNIAkKpuSsIY/n5UiWpWcHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSeJt7rz; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSeJt7rz"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-157fe9d771bso2672029c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792084581; x=1792689381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=TSeJt7rzFR92DV1DLvzwoY2HZDo5GWoBwWjLVR3tXvnFecyZ2ANC6ZNB5opXaJcuh0
         uAIqo61oIu8rRuY9b550TyEFk14hnlP2bRfQNp7vl5Q7IcwFmT0LXm5G1r/BzMlDI8m8
         Fa5YVkoI3qwWmSBplig33vR98+OnqPCJ61tVdujNljEoSRk2y1FaV2/nWB8iRfQhn850
         EYMR6WdhqPgeVrzsEkNmmLc9UcEW5VV1DzGH+cQxx/Jk8up73omt39lk6GqPm6biH/KG
         rP2EMHHP1PMbre3jFMjAaAKCfDzFkKQvagtytyEAMMQK+hKCy32ZpjGJzA04c5M6PCRx
         zgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792084581; x=1792689381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2folU0O4bOJirQCG1bT84vwZiHZNPZr+tDe4ocPaDM=;
        b=MEVUGDpBK0EbD7NN10J/ryNbOA4DfZ/pOIOD/kjGAqqRRoRq77fpkxroZKAiwAAl2f
         sKRzHleZCSxaX+fKKB+jpwpxHwIWjCisxdXGXOVPzTXXsDBJv/s/c0mK6Uj4EEZk/uKH
         qyiRIJYPZwZBt7Gu74IJXnLbRKZtClszKgUKMtgk/aZxANvV6ab8vMUgchIauUKwlJNa
         +JKf3LQRIwzrfg5huJHAdGnGNKgfKXN3kA2+qjX6KTmzZU0thh93N00HrhV5niBhCHLM
         F7Kv5d2dwWDOMMA9zNLgQ1tsTMKL3ES2xO1dNsc9rA8529VnTQEi/4lIGztAnoPAJsTg
         BLrw==
X-Forwarded-Encrypted: i=1; AKwUvBxHzVBVNVQUYmfbVg7q3U/J9mWSg8Lqp0xCQdmEcu7V6mKnhVCJpxcQkxXd012D/qXWfKp0ZWrq4piXPDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvCjmbIUnaLadNSHkrB7cb2sZXqzYWhKhQ2T80BVUVioD/5bjP
	Fzjq58jCSbRy/V56gvhCWpSG0TdcSR+Ay0nfXujhw1oz1p1BitIdrIz4
X-Gm-Gg: AYBFou2beI+p72cpyNWNXxtKlOqeFoOdo91sDGYqth4XApgeDlwwWLrkEXCspDmqv1+
	vliZq/QI5Zn9sKQTa6+DmAb9y3JFhkaOG4mLoamUXCwthTRVsZRIIJWgIi1wUpszT8a/cuhOHL6
	c2f53dFcdHJK3ds5WT2D35nRfoFvLn457vMspxM0eQVI7Wl0zNLl2jCOncJRMPKoAXp8a4mqxQK
	vgJb+g1ADneq09uvC2HW87E6XVrUjTBjGvsU6WfiYAz25aRDMqxqdpANwyrolreklgKlTGRhfNB
	80aZJqbhOAe/Rj+fCpvxXxx7yuRA+LLfRNPBZgPphnnYdeBYyUnTXUFRNrwy4bW5cPdKSwcFRhY
	hl0KEkIM8YoV0WJ2TKJbY5fuA5pCjYWvbrHNjoOD3RmElUhPq3ennKAfu8mktDcPHK+aUod+W+4
	qsbaqLtbZ7z65bIXBXFz7kOu3KMYtS25DQ5qzKmeilGKPjUr7YMQfL8j1702uXyri9dsdPJM/I5
	tAqx4N7Ova+2VYmZws=
X-Received: by 2002:a05:7022:1608:b0:143:3da5:cada with SMTP id a92af1059eb24-16a610ca97amr21923438c88.37.1792084581384;
        Thu, 15 Oct 2026 10:16:21 -0700 (PDT)
Received: from hp-OMEN-Laptop-15-en0xxx.. ([122.172.84.237])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-182a66aea30sm318532c88.9.2026.10.15.10.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:16:20 -0700 (PDT)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH v2] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Thu, 15 Oct 2026 22:45:57 +0530
Message-Id: <20261015171557.21243-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261014204331.15383-1-jayarajdmit@gmail.com>
References: <20261014204331.15383-1-jayarajdmit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpc32xx_gpio_probe() registers each gpio chip with
devm_gpiochip_add_data() but ignores the return value. If registering
a chip fails, probe still returns 0, so the driver binds with a chip
missing and no error is reported.

Check the return value, print an error naming the failing chip and
return the error code. Chips registered earlier in the loop are devm
managed and are removed automatically on failure.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>
---
v2: use dev_err_probe() as suggested by Bartosz

 drivers/gpio/gpio-lpc32xx.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 37fc54fc7385..7fb46262e18c 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -510,7 +510,7 @@ static int lpc32xx_of_xlate(struct gpio_chip *gc,
 
 static int lpc32xx_gpio_probe(struct platform_device *pdev)
 {
-	int i;
+	int i, ret;
 	void __iomem *reg_base;
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -524,8 +524,11 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
 			lpc32xx_gpiochip[i].reg_base = reg_base;
 		}
-		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
-				  &lpc32xx_gpiochip[i]);
+		ret = devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
+					     &lpc32xx_gpiochip[i]);
+		if (ret)
+			return dev_err_probe(&pdev->dev, ret,
+					"failed to register gpio chip %d\n", i);
 	}
 
 	return 0;
-- 
2.34.1

