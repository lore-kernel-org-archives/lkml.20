Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E394DEC3D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552278; cv=none; b=WuC21XooPt9Zf5AzTTBNoZ7JNiVjZ6L43Pb9Tr+LU2X1BetNUMppKIXCIqVQLCh4KUg+AK27iFXOx84LMJl1ds4n3/uJ8Yk6/s4SmXXDU3HOwhChOma/FUKprYwrIb1Lm21j+8DPNX4F75An04vLTmEdxD6PGgpWdQ1/+mOPAiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552278; c=relaxed/simple;
	bh=WbSQqnSb6lfEmKq3flLhSVPofVRAn/XOqGi36l4ja2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZrxmR1VceEoe3zBQLPfA2upCwkCJcFqaqn9oNiVciCOLu226ljwTy4LAfcOWtgU+fROPfFez0mdV0vArmar8LXKoPwj2n/0mzU3rGeEPiPyIgPHVltuOkM8aiVKRAzMGw8sk7oiBkR9YO8PnErz770qNbjNgwLaQCkE8L5ccP8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2dd1dcdcf95so9582025ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552275; x=1792157075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gMJKAweeucpfGaBYlo2vZBKtZgQvSoidwZpt6NP6zwY=;
        b=thoOniL7tBH/579bWzrVlvAu2m0wxD4JKryBEdiEN67dmTFx6KrfbbTuBWK4MR4hQF
         xoGauUNMz2SXyX7yh+A7poPSZqy6zXgk1RYzg2YC6Qc0O092OizXGNMcWi1w6A6l3nM4
         2EemmIfDgA/VMEgmUvRwZsD5zcxArtKtYX+vlGv+/7HZ5reO3y36bvos/k3nkoi7qRH7
         jhL70o06fqXhR8feeua0b954W2HSZTMXi6aBfXKmu24IImPWMhxEYPWhH98S46KN2EQS
         f2Mctn+QaRPT5rADDOIEXlggiKKNRMxLlmvVzNG3tVpaQQCV9fMfolY+NrQ6+4EXAlxK
         ZwXw==
X-Forwarded-Encrypted: i=1; AKwUvBwjk4IIIWP/Y6NtklIIltxsh0YyE7Zfmc/AvoEvzLR+rCGCKq4SmSkykTBQ4osXumlLYZGAHTfQY0ynHog=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKUSmNKJs4nsOTG6KEVfmoCEchVBC7V+PQKqImBpauWLuClTFl
	LLYD6YrOx6e2TbXafWZqAHNJI3jiw0ylOZ0K06kJoFC6g7xX5nISEbQw
X-Gm-Gg: AYBFou3ZCjAYVgCCExrehyN7gfvJENMIHKMc4TZKZDLuhFPXIbRL6X36IKFeNxL1CEB
	/3QBCTYUgDLz+L6y5c0xL3pKX+KShQV5e/1qE7KnyK9lEgchdV4gn0OdB1rh1dec7cxGnbvsAWB
	H230y1nSbgDCgmdziC7IOTesrR/dMjT4ZPhCd+DQhNbPFs3IlRZ5/9rjPsoTnlX9BQ+kPvqSJXc
	qCjbz2OH4Y+DfptP7qX4h1cwqCByK8xwOdeewy5FTKLiAL/TZgtmk46zjzWTJCEyVqFhX+wnsb1
	C86LudBP44XAqfnUt06FrPj2NM/kfqqBtRfWQS37b5XvluZp5x+iRmFl+pfUfYpkrzWUzDWqFWR
	Q6fifTxu4shTD+Mq3sqpmdepXJdhC/y41ewRUw7LVgRIBF8DwDDk3XrFgNZwonFAL/7xQCeZSa3
	puwZmM2pHHx+pSOKGADb8vVIlCCI1RZgM8DvGGyq2mbAfg3GnCjUnuHe7xW3snz1+Gq4QKaA==
X-Received: by 2002:a17:902:e543:b0:2df:98a1:d0a7 with SMTP id d9443c01a7336-2e84053c728mr16407305ad.33.1791552275311;
        Fri, 09 Oct 2026 06:24:35 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e2570sm9327705ad.79.2026.10.09.06.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:24:35 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 1/2] spi: sh-hspi: Use devm_platform_ioremap_resource()
Date: Fri,  9 Oct 2026 18:54:20 +0530
Message-ID: <20261009132421.557758-2-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009132421.557758-1-code@aayushk.dev>
References: <20261009132421.557758-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the devm_platform_ioremap_resource() helper instead of calling
platform_get_resource() and devm_ioremap() separately.

Signed-off-by: Aayush Kumar <code@aayushk.dev>
---
 drivers/spi/spi-sh-hspi.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-sh-hspi.c b/drivers/spi/spi-sh-hspi.c
index f840467cf..56df076b6 100644
--- a/drivers/spi/spi-sh-hspi.c
+++ b/drivers/spi/spi-sh-hspi.c
@@ -211,19 +211,11 @@ static int hspi_transfer_one_message(struct spi_controller *ctlr,
 
 static int hspi_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct spi_controller *ctlr;
 	struct hspi_priv *hspi;
 	struct clk *clk;
 	int ret;
 
-	/* get base addr */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "invalid resource\n");
-		return -EINVAL;
-	}
-
 	ctlr = devm_spi_alloc_host(&pdev->dev, sizeof(*hspi));
 	if (!ctlr)
 		return -ENOMEM;
@@ -241,10 +233,9 @@ static int hspi_probe(struct platform_device *pdev)
 	hspi->ctlr	= ctlr;
 	hspi->dev	= &pdev->dev;
 	hspi->clk	= clk;
-	hspi->addr	= devm_ioremap(hspi->dev,
-				       res->start, resource_size(res));
-	if (!hspi->addr) {
-		ret = -ENOMEM;
+	hspi->addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(hspi->addr)) {
+		ret = PTR_ERR(hspi->addr);
 		goto error1;
 	}
 
-- 
2.56.0

