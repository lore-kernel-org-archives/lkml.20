Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DDA565105
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999873; cv=none; b=Jwo3xCYWTqzV5nufPRCjGmO0ucpSsifInNT3jknlUeNu9WSOktoHVOj4WaAOLrsn6P90gppmT/zKust+VXD//t5vbv5Sx/uO+vqMM4cNfvA1D8/iU7+SW1REf+iU+dLvW1EbPF1mP3YQHDUuSVdmyCckV664LBkNttZIVmkBsek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999873; c=relaxed/simple;
	bh=2oZYonurprwc6muwlObjEA8seBjbe0bRboulPYlqu/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PG/OkTFpIGVgvRO9b/MtslMCbWUHpz9HIyt97MKegIgT6+6YrHLHAAj2DE4Az3FYX8Zz15M0plGQryObAMVuUi/uxl9/2wwFJfHItrlZcXE5UJ2OcatuzRT9NWNHG7CGB48JjsafPzIphqA2ZWbx03bXU1YjpBCPCHeWv2oGUnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hN5A65t+; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hN5A65t+"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso11429475e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791999867; x=1792604667; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=95d33N1meM14gVljkWNmVajc6Ur/SmP+/ev0dbA/4bw=;
        b=hN5A65t+SRG6JU+GKFqo2l1KHOgv2T7vYZzDe8NO5klHady/gOAq/g3xxOWMTX8WtZ
         jVmSKxBX221Oo49Wh++sPvVDPUUxRN3ZTYi100k7Zfc/hJbiOZTxoDHRDMGsVm84DCDN
         +SPaXcvHt1Gm4H6BI88DqsblcVEdENx/hsBBHUAcCjkUZSe1mble1XnqdTm/T/ei56Nj
         9zd+ZdJ7DeZWZqQSZwSR0WnwV1HgngQQl1wbI3h3zlDzfNNAN6DyPyCvILkbGd02jQYv
         3clebL9srOaOlfJqpoItq8SPIDpDToIooHRCmQmDtRwesdY0MLSLDxU4kmXOO1dXk6pp
         Gr9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999867; x=1792604667;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=95d33N1meM14gVljkWNmVajc6Ur/SmP+/ev0dbA/4bw=;
        b=tSXO8seN0AfglPs6zLoiA85l5NZyQyNYICc6FI8vjCyuMcZ6RyiCnPVDW/HX5WWa8+
         yAz0cJTJkCPXm9MOQLvACBwo2JhH7k003YDqB+rwlr5o/TT2VbfBy7D0coIWRyBmwvgP
         ewlxMi5CwFC2tRUlSBQjbMUn9iRPSpgKBbj/r90c9RE9G95aRo9QEtKefn0U7RWS6hT3
         k8QxLADmPcukW6zBfIvM7dPlzfequ/Rr7IRb83wLZX7YHY84vXQtlL0xNTzULYNA4VUi
         3qJS/Q+kKraQNAGrlaQRXT+gJrxe/Fb0+qjaH+HzZmgnxbScPkN/eX9gjY2hY/J6eRWz
         qS4Q==
X-Forwarded-Encrypted: i=1; AKwUvByfbLC7j+ZzC203jUhvMI/v6LhAnl/eg/tt7j4kbT3UmBShmUn96AW2bQ8p5bDR5ITxHxNqZ+ems7FT5f0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXUv4MYplOCLZGdSIqvv1J8f9AKnNbCbfuCdI4Qxar06h129Cw
	W7p2ywwnj0RPGE/dOL5gHWOpUUi1TQtATY1qf57k3pVJE1fgmeOOksMwJE/wUVt/KIsg7iQXKKc
	mkfdC+6M=
X-Gm-Gg: AYBFou0DPOnCqg0s3P5zIbcaiV1/5Eb9HKU1lhc7x9pIeQu+mGD7ldfpw5il0Aeo0uP
	fs95I916dDtzIBT0IN015fTvXrrql9aAnSiTioNtItHkB05Ilp0Z7jO27PltpsZk5ZYYSOCK8FS
	rKwKhyxYGvauI7I7YS7fyTD2w/nKDd3NKIOpAmeIjSsloTVqB5V/sjyTHeBVwzhIo4mm65nA+xj
	kPF1ocwS0XWYAqu3Kv8Kk4aV4LpoFWQ55UZr2xiG2WySqPRMwmlsfm4WPw2uVqwO0Y42Cau0khT
	w7wr20w8tHursLl5pIsE806OGHn6u1yhOfIWKolrBX6Sp5DM4s1JQFnMab+oxQdxBF/MncJja2W
	gC4G93ujCwxUiHBr29/shJ/aXB+gB0u+of3Lo1P/hV/TFfXLM/O1I6qNrAnlIBZ4HJe9hJYSlKj
	qW2YENqT+AYSsnCfZMRDCmk3YII4b6GTdTcGMM+p7jaE39RHNUQ9sHov9am1wnVNw7FtlzJpQ5I
	M6abPD0m4ymqJSTVhmiaSGsNzpujPeO0VEm8+o59HgnfYKznlCBzBgZhBFUcc9Ndz2pMok=
X-Received: by 2002:a05:600c:8b65:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a18e4ca244mr307651825e9.27.1791999867377;
        Wed, 14 Oct 2026 10:44:27 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm6878175e9.9.2026.10.14.10.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:44:27 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Date: Wed, 14 Oct 2026 19:38:10 +0200
Subject: [PATCH] mmc: omap_hsmmc: Do not log error on probe defer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-patch-ektor5-dm8168-mmc-v1-1-2d148ca0f948@linaro.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDvgaJW0Vyku4jjWaYlKEqUg3
 t1Ulx+8928QxKsEeGYbeFk16DQm0C0DHuz4FtQuGYq8qCmnO8428oDyjZOvsHOGaoPOMVJp+GH
 bsk8jSO/ZS6+/s/xqLoel/QjHfw72/QBl3KtkewAAAA==
X-Change-ID: 20261014-patch-ektor5-dm8168-mmc-138c9ab3f014
To: Ulf Hansson <ulfh@kernel.org>, andrew.goodbody@linaro.org, 
 rouven.czerwinski@linaro.org
Cc: linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791999866; l=1397;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=yE8QaLHiQFvOinPAzWnIH4J4gbNmnrzgxRBtfUhPuFU=;
 b=4tpQVRTBiUVmSFWGQ7EK/UCtNNM/h2EK0HJMdtFyRXGA88W+khHRr9T1QxUUTfp+y6NLHaTEv
 KBzcmcjSm45BhEFBjJXlxtcdIkY3IV64VijCih2gg8d/qvisLNWzCUU
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=

From: Andrew Goodbody <andrew.goodbody@linaro.org>

Do not print an error message to the log if the return code is
EPROBE_DEFER by using dev_err_probe instead of dev_err.

Signed-off-by: Andrew Goodbody <andrew.goodbody@linaro.org>
Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
 drivers/mmc/host/omap_hsmmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
index de5a3b70107d..ed52adb38fd5 100644
--- a/drivers/mmc/host/omap_hsmmc.c
+++ b/drivers/mmc/host/omap_hsmmc.c
@@ -1892,15 +1892,15 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
 
 	host->rx_chan = dma_request_chan(&pdev->dev, "rx");
 	if (IS_ERR(host->rx_chan)) {
-		dev_err(mmc_dev(host->mmc), "RX DMA channel request failed\n");
 		ret = PTR_ERR(host->rx_chan);
+		dev_err_probe(mmc_dev(host->mmc), ret, "RX DMA channel request failed\n");
 		goto err_irq;
 	}
 
 	host->tx_chan = dma_request_chan(&pdev->dev, "tx");
 	if (IS_ERR(host->tx_chan)) {
-		dev_err(mmc_dev(host->mmc), "TX DMA channel request failed\n");
 		ret = PTR_ERR(host->tx_chan);
+		dev_err_probe(mmc_dev(host->mmc), ret, "TX DMA channel request failed\n");
 		goto err_irq;
 	}
 

---
base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
change-id: 20261014-patch-ektor5-dm8168-mmc-138c9ab3f014

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>

