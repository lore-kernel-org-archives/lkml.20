Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794480710;
	b=WC2AaU9y0m6Tl42vf2rzc+Py4r0EXHbg3qhl/RnYPti/MMD6ElyYkJJe0e+SkNxWFuJy
	 cmdjxg7+p4D+S/CTmdUiSX0i/xnugN9W4hha4m4aSqLDfFFOCLPESfhBCsa2I3qOzMbcm
	 XfooHwRlVxut8BRWYb0D3A6ImP1NKzUi+pZXKQdadFnJPyexy/I6DzExiHXP2gTv/7CN1
	 SxrRh6Z2MMs1V4Iv9jTYWEaOngFVlMnsB/ah2k9BR68AbxYb7pVh4zEmnjhDSOTUrs1zj
	 dfSiTx+PCPFnbHZkeXL8J39nM7ecLP6HKUmPws8uWiLNF/mDm5UsLJs6qlmrlraFvpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
	b=P3az6A3jTocMPEeuci9xTd1FjUA4NfH73EBbAwWakhc27SAGyV/17fZEAyxMnIElrB5m
	 GDc5tvw8hdFIeBf+6iIh3hFmQ0F7uG/vAgXkMGtf+rcKOq5CmuZmYaF7ifiNP+elit7HG
	 XYfrjkgrg/TBQVEpvJ2+o5Iil5WdDR+QSo0Boz2gCmPVm6YtXg/TR9N+iFAkQyKRrrhdJ
	 t5O2f+LesQNqlSXfpyJgCp87betTmBHWvcA+dBRpyBZgR/eHkROXYwYznORwFD3Bukaum
	 J6FFaku1gedA9dBRi0gI9ebQPwLSyIrOYnrCVzoznEgFRaxGud+An2YRQRm27jfZzLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6txWJLq;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171D2606A894
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 171D2606A894
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6txWJLq
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so5097233eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480709; x=1795085509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
        b=K6txWJLq5QeZD/TA+ezEEMcWqFahlSzKugqMxWT6pBvBhW5Rx2iasjq8E9lFb/QCp3
         jbtCkMcFxjCO3cov25ABwYtrlymvJx+jdLHSM1RNrPjj4ummtDNjNcWbBa4i5Rum5nPL
         pHPUU7KfSxRu4FoOPFM2irEBdBAP3RatVRpVX5/bj7Xt2PswCeZn9dZx+uh7WyOFggLI
         wqUVXlHEsgYoX+hXblZc5OMh4BumYuE8kKCXVuKJ7Qf6svSXt9ucYgODsydy3e30DECQ
         AQ+x/6z0RDLoiWPS/HzaAPfe/ivk47X7PRw65sa4Vp6vwOBSFxTlCrQGZv+JuqIFruDC
         TMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480709; x=1795085509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y2Z4k53MZ5CuMtRn2UaTr841R9J/LmSKA80BVWLhtkM=;
        b=Trerap+zRFTd1Yprh1naLhztXh+YQgj93KNsPv3mOQ4vu8K/qX/FgEmjkX9LmHRekC
         g3rj9vylgC+H1zzWF5fOrlXy3iuzL1QdP1bgGLSbUOGo7W2lE2PuQ6rKiJVGWCS7sBp3
         cIATlTtwp0eF/cxdrMPA1OwP4a8ZrJvH6PuTdPfQFmIeLQYDpxOa43BtAluyE0J324CL
         jcdGq5uol/RCuwYN6ewnoauZzciL2h4cR8Ks/r/Nshv9Cs0kcNXidfTcOg2lVD3CuEXY
         EpcOnqoCB7Obh2dlZ/mSlw/jr44xOdk/iP16IXdUgIMCd7aIQSbPCLiAat4xQoHLM4t4
         aRlA==
X-Forwarded-Encrypted: i=1; AL+hErEBhY960sdFIKjussUTX0B4zeMcZJWIWqjl3inrI7GoY3ovKqWObRfe6sZ+zyd0NP+Bw0BJw8ybXIuofw8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iun0iaDClF0X7Ty6dK/4jivVhBL6tGNL2sgGCnA3DfsCkDe5u
	nf9acjnt5Mtn2fQAQSJv5rbGbijmPb8ak9pLafNt0PS5tri+x76neWaV
X-Gm-Gg: AYBFou20i1FzvdEF1MHrH0B1V+6lkUGxAH1sW9V0AZ/sr23QVqD16igt2O4xPXuSf0Y
	AzkDijhSdV4Z48Lw+7VxTNqD0ZFEFrqnO00T1cz7UzPMwED3DAx2l6IKcUG1JZ5FsCypzt3WWBw
	WTWSXvVAbrtdRaGy5dcUOz96IDQGQqoSW7FyzZgNshAhyLDX7uxhAgz+JJvI85sEILgoZVH1iTI
	3E/ayqbgQKMsaK/SC+kf/X4IT0OxcSG2j9K6cGCNaK2Lr56JpCvcOCqW37cRudV6tHKe28Omgf+
	yhPhfJINEhwlb9LkqeUc6oItStENng+8lhfn4oQhzqpl+FO+Syx7CDWMvRWorRHTOtrOZmtEgXu
	jT9dBJwIxnmbFNoPxGGQnpjuyvfZLHvqCv05Cv2iaF+fZrXwR5o1lgNJ5pYHk14/Am1if+DROlr
	nbca1fe+xa70JqTmlfzD2GFpDoISdCD8QQNDu/Dd1OcImLkt+O8VqctPx8di3rCr1riuINbSRW0
	zj0RYzwzQF7HIcLKhgpx4gsxesydqIBOgnCEfWvppW+WZAEfAVzeso6D12Cw2fgdX4c/6mzn4jz
	y7pLAkSpDH7HKb8V1T2u+93A6SR3C3FCnjHmsEZz8w4Fp4w3QjbLd5B7ce7CVtwRZ+YM5FzfWU3
	8C7lJqo/CTDAEY8ucBahyjqu/Ez/BqylzA3j9Sxxhdsyh
X-Received: by 2002:a05:7301:2121:b0:358:eccb:af7c with SMTP id 5a478bee46e88-37686467c11mr5852796eec.33.1794480709185;
        Thu, 12 Nov 2026 02:51:49 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23047232eec.9.2026.11.12.02.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:51:48 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/5] ASoC: fsl_asrc: Request the IRQ after the device is initialized
Date: Thu, 12 Nov 2026 17:51:15 +0700
Message-ID: <20261112105116.32274-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112105116.32274-1-phucduc.bui@gmail.com>
References: <20261112105116.32274-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

Request the IRQ after fsl_asrc_init(), while the device is still
runtime active, so that the interrupt handler cannot run before
the device is initialized.

If requesting the IRQ fails, balance the runtime PM usage count
before proceeding with cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index f7ac60724c6c..c97f814d7358 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1299,11 +1299,6 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
-			       dev_name(&pdev->dev), asrc);
-	if (ret)
-		return ret;
-
 	asrc->mem_clk = devm_clk_get(&pdev->dev, "mem");
 	if (IS_ERR(asrc->mem_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(asrc->mem_clk),
@@ -1436,6 +1431,14 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		goto err_pm_get_sync;
 	}
 
+	/* Request the IRQ only once the device is initialized */
+	ret = devm_request_irq(&pdev->dev, irq, fsl_asrc_isr, 0,
+			       dev_name(&pdev->dev), asrc);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto err_pm_get_sync;
+	}
+
 	ret = pm_runtime_put_sync(&pdev->dev);
 	if (ret < 0 && ret != -ENOSYS)
 		goto err_pm_get_sync;
-- 
2.43.0

