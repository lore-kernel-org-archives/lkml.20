Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A1E4E3231
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552987; cv=none; b=eP57/DH06VCUGzFjp9lmDfbXxejyR5uAMlnLW0gx3IXJMOFJ06niUelTjrtq7vpb8HQYfJKji55y0Gh7MZvsJ3A9g49P5dK3bANFWDNGiPMtIKKkUCtPzUbCseg+PyDFEEgI1VVzeibkQdfDB9Yd2nY0UtlrnHu9Bpq8731+KrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552987; c=relaxed/simple;
	bh=ZhsY1lRzQ+V6ijG3qFiS3fFgTjwYihevXL72coSCjkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OuQwJqQ7uxDvwbZZuhjhbyEqHWrCS4C/PU7fTD2jmHK6lotPtN8rPEs6f+gYHNJ9giXrPJaqXm+9zMYjdQddqOTfTTlxXxEAqoj0x5cl57zzz4lZyQ+kzw1kt7KV+sI5m7e6fgTCZSo9Vj2LYN4HWkk/lkFnwQrvbSLdREqINvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8662d5e95so199395ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552985; x=1792157785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X+cLy2VGZ7LgWJ56rIrD9j476kYKycSgx/bYHSa3aYU=;
        b=OwFllxrK3zsGM0m8gsC+yd82z8nBEqAwhb3ChVCU6a3gYdFpKRFcGEaQIzBkA3JAXL
         EoDi/WqhrGuY4LUxl/1l2MyfahDChoemIZmOLPzZciL8riwtfEmU9WarENhsTFWPan0s
         Ae690gPgK5Vg64MDPZHg5Bf27FgosOSjV7gWWqDPSS0RvqBx5quXnxxZ9PqZRAsOmJGm
         1ZrCVRpTGbZ47tSflUv/2d4ZQNTVdC44F+V2G91zAaQp/ECZFq2PQe/twa5zSfn9gpgg
         pH9/RXJc9y/2f02zQuLK2KPcPkO2J5c5f053dRiqACENLAmBEBWAFK5nN09mwGXR/eO4
         0qcw==
X-Forwarded-Encrypted: i=1; AKwUvBy3atDucs2szpG0jV9fWNrm3QAzPYnYHVuVYOwYsSojQp7b+kDpi45L3spr9Sd9U4iA+5Wa+kqqXsZyhRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJjnjlRq2SGCAUaF08PKTSaJFVeXYQgoa1GQlnCcuOvZCXUKFJ
	FpTdKGym572ERhc69Jshtsj5X7Q+KabiaNPEVSTM9/0XlVdXq4bPWLcK
X-Gm-Gg: AYBFou2okaztjAYw6xKYHHNe4q74jt+Gy1btte+g8LmP5rHP0Q6gRuV2EbfAAsaly++
	9Ohb3OpQ5dMiVSb5M5dy45GbX88E4qNWb+13MDeXDZw7RStnsuGwtW/oTWckj+aoUACcN6Go+yx
	kIVvIXWtgrElrn/xoYSssz9bmsvQx3EOjICoFk6Iczdm8rwklCebKSL2qXDBE40d2uJcw4hJIc8
	+ZQSSSK1KDwvuPSMFQfJdRRF8ftRgD+KLePkZtffxTAH057K+0j6A8sK4Ud91IzHZCPzyQUOagK
	vwbHKa/13R0FU7N5mhTS5OkDGCuv98QjvZ455iHGX7+cCD9kS66jufY5n+6pqa/EYIU1a++a00e
	cLs+OXPRT/5tmYjkekXH/s7pdv805dnAIoyPTHa9yjjNYhdFUDZeKtG7sMWsf0DZm4oyLmo5RXZ
	XoWRSDBsDEiK8CgVU0A3AJR4IyXAMSRHY9wKDqjQTmii9grd+fOPyBVUNx8J8=
X-Received: by 2002:a17:902:e5d1:b0:2e2:e57f:77e0 with SMTP id d9443c01a7336-2e842ac4b98mr17744015ad.24.1791552985435;
        Fri, 09 Oct 2026 06:36:25 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8484c1641sm7656985ad.15.2026.10.09.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:36:25 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 4/5] spi: omap2-mcspi: Use snprintf() instead of sprintf()
Date: Fri,  9 Oct 2026 19:06:08 +0530
Message-ID: <20261009133609.579046-5-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009133609.579046-1-code@aayushk.dev>
References: <20261009133609.579046-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use snprintf() instead of sprintf() to avoid potential buffer
overflows when formatting DMA channel names.

Signed-off-by: Aayush Kumar <code@aayushk.dev>
---
 drivers/spi/spi-omap2-mcspi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-omap2-mcspi.c b/drivers/spi/spi-omap2-mcspi.c
index a3355147f..311ee0ca9 100644
--- a/drivers/spi/spi-omap2-mcspi.c
+++ b/drivers/spi/spi-omap2-mcspi.c
@@ -1544,8 +1544,10 @@ static int omap2_mcspi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < ctlr->num_chipselect; i++) {
-		sprintf(mcspi->dma_channels[i].dma_rx_ch_name, "rx%d", i);
-		sprintf(mcspi->dma_channels[i].dma_tx_ch_name, "tx%d", i);
+		snprintf(mcspi->dma_channels[i].dma_rx_ch_name,
+			 sizeof(mcspi->dma_channels[i].dma_rx_ch_name), "rx%d", i);
+		snprintf(mcspi->dma_channels[i].dma_tx_ch_name,
+			 sizeof(mcspi->dma_channels[i].dma_tx_ch_name), "tx%d", i);
 
 		status = omap2_mcspi_request_dma(mcspi,
 						 &mcspi->dma_channels[i]);
-- 
2.56.0

