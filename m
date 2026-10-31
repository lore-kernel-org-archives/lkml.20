Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793426629;
	b=zyOS2U4pLWPWlaIHZM8GsVn3hJAV/PCKOUeenIqifvMgM79jdeXe9zovbXpDGgNlJuF5
	 Ti2BvbbwlFyg8Z/XMg0hbFDir2mzlm4ufgbVoqFA1d6g3J4bEUDFH2PsH8k2fOXaPp8TH
	 XvS0mB2LvS50LcPD7OgXAatK1CDuFZSNdhKf4OVJha6whzGIuN+zxBmlAbe2Gnx1TXtg5
	 PJ1O5K10/bYpi61xYu5WX5xU7dot0f//VX3iQ0mFNBASW0sRvHiD+zE/X6DDRHd2QPIZZ
	 Q9C+ldVR279r1kIi6JSBUpWhySKGDnLAyChulYXPvCo1NxGNAT1DYHf4g6QAXdglpRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793426629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZnHzpDNAsYwgZW+/BH7mx2GO7ajwWfSCvotHqaQHR4k=;
	b=ZEP9FB101WzJx9IsZgMCJpK0k4nxbH2FaY9KTr59E51rzqGvOZxg9042MN/SOZzIaNYm
	 2Xg11gdrMnmJB7BgF5phjYHpCRLl7Za5Tk8bqAb14fb7IJV0/XFFnOnBDW1Ytx6zfaHSA
	 mAZNU/sJF3+ZoHUOxRLPCh3Hkm7oBeU4BtRolH2EAebai8B1JysBDaoKflG8hUTYM163P
	 DKqMGppEdrBHXDj6yCVTMQmxzVdizXMe+ORaFs9KsIU9OZHD+bwgAwVz3/XtWau2MD5dO
	 NbiYa0MrFgJKp3fg7Yu4sxAMBSKrV+RYEZdkZNWs4fjhYxgZYwfi8I69WN/f8o8Fw/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FukbCKf0;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20EA606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C20EA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FukbCKf0
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so859372eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 23:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793426628; x=1794031428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZnHzpDNAsYwgZW+/BH7mx2GO7ajwWfSCvotHqaQHR4k=;
        b=FukbCKf06+gFykKXBYrHgaupwkigiMTsPqp4vmDTtHgqtFGofaur3OblXZYNCzY/Gh
         r7tm+B5mVs/EI0k1ez/FST6AutKSTauCYHfJPTTHcUHcTDuWKaGIZgsDAWGgi0TYHJ53
         ++C/tu2yDh6Fi0nUO+9Ax7ya25G3TLN+KNneSQzHNDxr8qgGuYHUrhvs4nlRsdTDlyBo
         41lY6Ko9POzLise32MxFcxjrsPwlu1ZXEYJslWkWCJDTBbR6q6cq/JmpbW3XV5ou3i3d
         6/v5EVVufR9aDVlqS21xg6mOAS/z02IoKaIUfjZyQQkGLJ6iWWncNUXB4stZeSuIDL7u
         hxcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793426628; x=1794031428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZnHzpDNAsYwgZW+/BH7mx2GO7ajwWfSCvotHqaQHR4k=;
        b=HLSae7G12hhRRBRY2G5bHA/5MfWVHBuZDDltE5Z+gMThrMnADkOTtTKcWLkB7iAtGA
         GBCZJl48JZcfAor+oeu6aVD2r0CmGxsu84+5fwIwl46r1twKBk0mBS+c4GB+QTZvFc+9
         WAx2U47eG+NuGiqLbWs6+UB33BiU/8BlKXf0xAqWyyybFo8hStch9JSzAQxI8/4YanAz
         Yi71VN+NNB7ZBGJ7yuSHkx5JwgLROdD40qFgC9oH1kmL8yh4+62d002nPe/N3o/28t9o
         xkzw4bz7BGBG+I3M1m0Q016fCelrIYGNehWYVvF6dxHEWEPBRmLTdHtSCXU064pXo8Wa
         C+eg==
X-Forwarded-Encrypted: i=1; AKwUvByodk56o68SAGwi+KOP7jhDIrNovjlyywQBflXlwKiN4rcrmKzIr3NiUYRDpsORVVwX74nQuHpNdLVkzV8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGA+6ckWFnCmDdSNzxIvN+TDBHBCcVWbPid+Qyj/uGNFAYgQV5
	4G20kJImOXAALzJ8+gWLC6zWBy7eqEV/J3dFYPzqQSUMFbXTrxrsztGT
X-Gm-Gg: AYBFou06cneHencVOXBDy0DwEpnyA+a8926dRDG2oYe+w9fZYMEeLcUHVJYYJhJjO1C
	rFB51Q2m9qKveFjAeQ+ZFBz+y7oLea3M6n4/0cyZI8Rs3yD02UR9/V5kmTASPOYEK8POjzLntf/
	9edG+5Jh5O55RWwqViTdPno71ZkHwq5mUEY6Jed/bChHeXW1Osnas7AZwiqR409IXwFLTyWSsWf
	cDduZ/X95mUI9BhzUvIgztPShE8JVPcqv/Xowz2A5kzduVQOvF8HLRXCJMSKwQbgmBkb+YBmJKc
	RDrNPVgIDrAY0L54lyXyJNVHys8o5pQ+ju9zGScekGyuw3Qy5Ux5zPvQvzqLsraaiJ3Ozg25GKl
	ZiHfj+Q9nun/buWJ9mPKIzfzzo3huuuxtHespSvNi04YWrgh3L8nc8bi60JoqEK9TefqDPUckJp
	YnG8134+rek3efxJWo31X9wULMXJtYRPxNIg0CHNPqli5TY4GGi76raVDJ4noLZvOrQIVBBEd1g
	tVjaxVbrJbvbxtswpacTD/BAhSvKm5mJAe39t4DgjmjfKM87RjiMdJReNUPQqAjEZvPq3X7ahmf
	mIM1MS/Fk8pC32UUQMtUtsxMO/W5rta/nWZxyWIvkQ1uRwYQ0WJy2/2LwcEjP5XKUq0=
X-Received: by 2002:a05:693c:65d0:b0:369:f7d2:d7a0 with SMTP id 5a478bee46e88-36a423c5d12mr6714625eec.25.1793426627830;
        Fri, 30 Oct 2026 23:03:47 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af91bsm13254968eec.8.2026.10.30.23.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 23:03:47 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	Carlos Song <carlos.song@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: imx: Avoid PIO replay after a completed DMA package
Date: Sat, 31 Oct 2026 15:03:44 +0900
Message-ID: <20261031060344.94687-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

A transfer can span two DMA packages. If the first package completes but
preparing the second one fails, the helper sets SPI_TRANS_FAIL_NO_START
for the second package. The driver treats that flag as applying to the
whole transfer and retries all of it through PIO, sending the completed
prefix twice and reporting success.

Clear NO_START after a failed later package has been unmapped. The driver
then returns the original error without replaying the transfer. A failure
in the first package still takes the existing PIO fallback path.

Fixes: faa8e404ad8e ("spi: imx: support dynamic burst length for ECSPI DMA mode")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
In an arm64 QEMU/KVM kernel, the SPI core and spi-imx driver ran with
modeled MMIO/FIFO and DMA provider callbacks. A 513-byte transfer
completed its first 512-byte package; failing RX descriptor preparation
for the second package made the original driver replay all 513 bytes
through PIO and report success (1025 bytes in the modeled record). With
this change it returned -EINVAL after the first 512 bytes and sent no
PIO bytes. First-package fallback still completed through PIO. No
physical ECSPI/SDMA device or external slave was tested.

 drivers/spi/spi-imx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 79a6c1a60b0a0..eed1936388aa8 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1968,6 +1968,9 @@ static int spi_imx_dma_transfer(struct spi_imx_data *spi_imx,
 		spi_imx_dma_unmap(spi_imx, &spi_imx->dma_data[i]);
 
 		if (ret < 0) {
+			/* Earlier packages have already been transferred. */
+			if (i)
+				transfer->error &= ~SPI_TRANS_FAIL_NO_START;
 			dev_dbg(spi_imx->dev, "DMA %d transfer not really finish\n", i);
 			break;
 		}
-- 
2.55.0

