Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB92149B1EA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295062; cv=none; b=qopPH5MoOVMunrz25rzCOR+fywDJ6kShL9PGNoIo6yLv5gP/N33u39+jqyxnbFWQZewgUdJFXvMbtqo9yzX5hZSiq+e5H88LU7Ils3blik57KleyvX8iOeaVF9VatBGhzmA/i9ZA2+ppa+yCfMb4bkKe9q3QhcVTbTug4/2oyRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295062; c=relaxed/simple;
	bh=7kWtNHnkgon39160jWf0bk9sq15XmJRpmJ8WMiYmKjE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=adfcn6aEo9BM6zFX4IQGe0yp2OchxQ+uHHBkVFbyGMnyjV9uUgs24pjcEYi6fi2IlRU3LXsAuKfZwhnCs5XZK9sJzPtUDgDCSmiwr6ijTTrNAQLDQxnYdX0GOFqEEKzMmy0yzbcNSY9RxX4+tI3rr26tahVWwdeD69xiBB9cTnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keTKunij; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keTKunij"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e041ea211so303285a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788295059; x=1788899859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=trO+aYhWZ0cKdRoRTUvzCd7Am7CExDkHP+dQWJTMJHc=;
        b=keTKunij1gq8rW6ly4tNjmer4Lpi6FLtJdZcPkfaGDxG4ycwFKU2IKrNSqVpLEJ97c
         SbL9YhOW388SLnvrxfPDmthP+dwvjHJKbA+ms5Hrrv9Zy/upzwCzT8ERi3c9BBVkUUTh
         YC6BLpBVf3apNn6pq2EWMGYa5wYqVsXJHhF1nWypqz/KYhMX92dQEXiptM3B5GHoBYaN
         0/ttTlu+24HK7aIHcRiYZrmdT2XfOJ7by7CakPrJ+XrUBx2/MayRsk0b1ihnRpBZsfb1
         qHhXaLB8LRYN5Xq+SQwIV3zoZnS47k2vnhJuxI/TUP4hJ8zEwSm873WT9iDS6ajktaDs
         sSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788295059; x=1788899859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trO+aYhWZ0cKdRoRTUvzCd7Am7CExDkHP+dQWJTMJHc=;
        b=QeSOI30AFarseIrCRmLptI3ETc6ab405gRUF6O6+lNoX+gVBLQnMtPKbq6UB9SY8CC
         DZcgR0liolRjt/p4wPsCPnpo7HcV/k+KWs8cnbpLw+bXe8Hua0SuBF5ezQyF4LTzo9O5
         urE1p22F/E2RY4D4epb7EEGS3np264znSkgfKbBQYVeflSUECVFjzbDdpdZgqVZEnyZ/
         QGy14WyPxpfBCQvaE8G96cuVgncgfP7pkb2qW9XM7STEiB1Iluw+3EbtfaimqxBokf7J
         BjVOk/aT3mBEa979sWk2hpS1lLJRYjHlD2ymW57UQd+2QpJ1ov4h52c18420TmVVkLAL
         pADA==
X-Forwarded-Encrypted: i=1; AKwUvBwXIuKrrZWq4ayVkpFfzaUCTvtc6TTsTTKnIWW88AGQWe3CNHyvxRvU0oZ6RYoHHKtexR3kJROTbC26iPw=@vger.kernel.org
X-Gm-Message-State: AFuF++lbIDKt3omXWlM3uXM36tcnYTa5odmqN05nEhAtWiU/HHROS6R4
	a2ZwQE+iKa0gwdxoCKCkUIeKpz3EBUumPDS5E6WwKEcna22PxicLH/A2
X-Gm-Gg: AYBFou02eufvlbQwY37xVJGGS4175ui/Z+5+hfLURreoboKdEUoiXI7YAi78gDrC7Th
	uIuGuj0+bhj3Z1jHNZgMQmYbTGwp8R7AhyUDuZ8YHNQlE4Yswjd0VjdWplD19OO4uzBYkqo5XQN
	I7dFU+yx8ZgLlsjXSL10FmK9xCuYbrIN7Pcz5A0n60uHUOw4H3iK8yk9fAcuGhi8hO6D8N03bW0
	Ot1q9gxjUgC5FZTaqmMkLDu+nAgcccRRY4sycYC2aeR8TQMCQj6QvgUMFFTCyYW81cp8oHK3GaS
	fWEPoj7BbyP+npl0SGN4pYI3s9FiTLoFnEtF9Xnez40UujWmq3skvtZreThLHn8WDJCPWVVD6q2
	/noOgS6a6cbWiIiXBz6ehWKZCz/Zt6RHo+IJxJxZFJqX8sq3Zjn3a39V0mAR5dDjWnShFXaMSTe
	Wrj2a89Cju+2Zm9HKpsl0W6Kplz6m//CcKyTMBCtsl//IwbFz4sisn/3ZeURDugQd6qCUOKheb2
	NuctUyxKAIwfgGop/13lgIkEUYYVUqvN3RaLt5ZjcdBUvA0tgbo+lsx1beb8iZljMpLqSaH5KaV
	GAi43uoix07wcxGEDZf4EApk2BSBpp4/mXlHjw==
X-Received: by 2002:a17:90b:380c:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39907b170f8mr15313233a91.7.1788295058594;
        Tue, 01 Sep 2026 13:37:38 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d75fc49sm7430467a91.12.2026.09.01.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 13:37:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-crypto@vger.kernel.org
Cc: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Rosen Penev <rosenp@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] crypto: caam: map job ring registers without claiming region
Date: Tue,  1 Sep 2026 13:37:36 -0700
Message-ID: <20260901203736.13248-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_platform_ioremap_resource() ends up calling request_mem_region(),
which fails with -EBUSY on i.MX SoCs:

There the job rings are modelled as sub-regions of their parent
fsl,sec-v4.0 register window, and caam_probe() already reserves the
whole window exclusively via devm_of_iomap() before the children are
populated.  Every job ring therefore collides with its own parent and
fails to probe, taking the hardware RNG offline (seen on i.MX6, i.MX7
and i.MX8 boards such as colibri-imx7 and verdin-imx8mp).

Map the job ring registers with devm_ioremap() instead, which does not
claim the (already owned) region.

Fixes: 9a955c0a7d11 ("crypto: caam - simplify probe resource and IRQ handling")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/crypto/caam/jr.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/caam/jr.c b/drivers/crypto/caam/jr.c
index f9e029945b51..2ed8229d4733 100644
--- a/drivers/crypto/caam/jr.c
+++ b/drivers/crypto/caam/jr.c
@@ -583,12 +583,29 @@ static int caam_jr_probe(struct platform_device *pdev)
 	struct caam_drv_private_jr *jrpriv;
 	static int total_jobrs;
 	void __iomem *ctrl;
+	struct resource *r;
 	int error;
 	int irq;
 
-	ctrl = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(ctrl))
-		return PTR_ERR(ctrl);
+	/*
+	 * The job rings live inside the register window of their parent
+	 * fsl,sec-v4.0 node, which caam_probe() already reserves (and maps)
+	 * via devm_of_iomap().  A requested region that overlaps that
+	 * reservation, e.g. from devm_platform_ioremap_resource(), would
+	 * therefore fail with -EBUSY, so map the registers without claiming
+	 * the region here.
+	 */
+	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!r) {
+		dev_err(&pdev->dev, "platform_get_resource() failed\n");
+		return -EINVAL;
+	}
+
+	ctrl = devm_ioremap(&pdev->dev, r->start, resource_size(r));
+	if (!ctrl) {
+		dev_err(&pdev->dev, "devm_ioremap() failed\n");
+		return -ENOMEM;
+	}
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.55.0

