Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377281;
	b=XKqPnQBIJvtaWQjJocaSWbiAd5Agobim15e6rGXgRzyieT+8k0LuW6gq0JsCmC6qGwbA
	 Xew3S8TXi5p8UhdGlSKY2NqHL/auPVS11nKr86pmaxkI0Kbe8yIHkMeLFCCFK8eWabENE
	 y3Bmki439s6r2SvBq9pJD+mlDS4hDdUL+VWBEh1LiLytYdpvKwYi7NDKx3U0MpdmJjR/j
	 nNuBZr9lOfne6W/D0CMuygvr3B7ReNr1coBY+U0Nil6vJKdOYW7nlRoWFA1eLi0sRPzWk
	 E32LMJlmdojw/pBqhIJDfiv0j+AQVtsjoeaq0iSngvpjfzBUKb/uE3BpuFZ/lB35AJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
	b=FGn668LcvoGd8Vz7PrLe7J3TOBQKdQyU9GNvevt+lewzG20TL/zcBTC4MqGe3ATxQQvR
	 PbU/yGfb0DibDEm/3vriig5CeNfmKAKA2dSAt9f44qxThGZXDTUjkb+ZnLNzWexcXlTVk
	 YjsdQVKW2i9fPrVApTA4VQHEm6MdOnw0wyDsEY+EJCPazQPuyV+rn8T6p9npg8zUze2J/
	 hRovqAXf4mkZjLNsWM1tCnOtxItq2CSdUwo47q+SF20eftt5lC50MU9V16qr4ZJtqZE+H
	 fhN6xxYAn7BApkdyis8xMfBguncE1/GDJzlgYOMNfbMLuhFLpVYgWT6HzuXB/Y2enqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJnQIGuQ;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88268606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88268606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MJnQIGuQ
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a76f63b243so1798071fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377280; x=1793982080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=MJnQIGuQlLPZonf3ey0zhT869dexzoA4QU8naKaMl6T5gjA/WRI4KoPDBmVJE8qay6
         rLukk756sikUoEXt6Td73pH7mFMlPcFbZ08eb2fw4/JMkkv5tbXnQET97K+UlMRfy70f
         NJe33P7WRI+2jxJ2bRFVF8rv5CN6+1dMjdOBSIxIV3cAWocLSu66s4oRADFP7iXW9CUm
         0yfiVz2M1qvP6FNqHZZWzpN9X6Q78oLyJo4xYE6hJalw8uB4tJdbIWVl3Z4as/0EYcWm
         2E0iHweU9P6XNDkDyal2mfTHeEQ7+ERAZLil5nv6i4HqhONM8qlgjF8v73jsNsj+2CxQ
         37ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377280; x=1793982080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P3sMZdQ8vNG+NMmxWGi58o4c8YdyyCQhTB94DmlU1wU=;
        b=weCJWIPL3BFlW6vjyUhEZUVfDwCwlaWhfaJjVntYFkNaqz1+kkRQv6NjRVRhIuFPkv
         62uBMMkSqVJp0dC+SHzEuZPisMXvfEpJsgD9D+AyZWps5eNdhmT7bp6a3j3BEwsMczGb
         LEWtIItpvkkbmG24lBlUh4xkScTS9N1N7XJjYFlWCFVYvyfK2aB+e7mUi+YkRJAn7IqD
         FhQ0m9IUk6pZoe16zVNCglQ3s3O2nPcy/ou4F1iJEuFzVjhIi8B3Okxsb1phrdy4HPoX
         TSu2GddFAALHUuxxniriRHviIoGJdwSYzAZgZYURsZWr1F490gTcfU5x+leVmkXbdgXr
         hr+w==
X-Forwarded-Encrypted: i=1; AKwUvBzjdu7/da5tbmaiu+P4Hq8RRUeZI8Ngl4x/O0seMFsSnWUulnEuu9cmTuHQm6oLxxEO+zSyc9xY/qhD5wY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnoNj+Z8pG/lMCFuKitxefv5rAuGwWyQgygPqRC/Abhu+q4N0G
	/A1MBZwUHGpYY1v7DJ71zNacuvQNnJZj8n87Q85GNvildp61XSRt+YhM
X-Gm-Gg: AYBFou3plH18dCFr3AHBAhraaeba7YlpNk6bhuyPL9kwZ8z1U3Or2RkCuvB3AramJcw
	21KAp14XyjRbZViTwEhkkA9tRFwPfEGfP7sbn6NN8/faGXHlJdfNvjGZqg3OJrgpqiI88unErIb
	Dbi4zarcSZdtqcpvF92ziqLzm+30eRSlKgWeTEKo7enHRmrR0yYi2rf4zb5Rvj1z+SOGvAktOKj
	9BkAwjdgleFGlHiG3hIAJxvpCe9RVeceKCLSHIwGZ2R3OROh/TWMubFHI739Y6qBr7AYE67W8th
	yKY2FyUdUtk7Nhsua8VL6491ljwrpzeZMmBdLV0wolIbSuI6cHaY3ITVAwRwMshk+brPC/zQ04a
	IrNwm7c/N/h2/2ZttSMhRnRrOnLghv6CXe0wAK2G2tKeS6N9Q+A7IlhVy5U4oGleE7pZb/NLmN9
	zOOlfosgZY/F5alJtes1zceoWzm2FoBBiZ7532TAZRkFU8MG7igzG40QVfs6Fqq7Obr8b8ARydy
	ndVCznhcssKsc0P2oYtXosInq73SDIju8EBWkrX7RdZ0LmeAzwuWAToehbd2I9m1RCNHmNMU0cu
	wd9C/JePz+o6PVhu6LDcazGk9nCadSo7SYyEOEKOMG7BFtLipIrSXQ/vPBIIMKN8DtHwqNCq9Wz
	ouFPHxL1zq00NQHLOc7vRYK5wcFwdX0Ina0PRmpdkmYSuMqPCU+kChUBxhIw/SImqalVhrkcfsn
	YhOfMg1fCqb+92fwFBo5+fbKsD//k/VULu88x/
X-Received: by 2002:a05:6870:c191:b0:4a6:d831:cbb1 with SMTP id 586e51a60fabf-4a90767d2f9mr1286539fac.10.1793377280468;
        Fri, 30 Oct 2026 09:21:20 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:19 -0700 (PDT)
From: Samarth Narang <samarth.colleges@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samarth Narang <samarth.colleges@gmail.com>
Subject: [PATCH v2 5/6] mtd: rawnand: marvell: stop DMA before unmapping on timeout
Date: Fri, 30 Oct 2026 16:20:40 +0000
Message-Id: <20261030162041.2998170-6-samarth.colleges@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030162041.2998170-1-samarth.colleges@gmail.com>
References: <20261030162041.2998170-1-samarth.colleges@gmail.com>
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

When marvell_nfc_wait_cmdd() times out in marvell_nfc_xfer_data_dma(),
the driver unmaps the DMA buffer before calling
dmaengine_terminate_all(), which does not guarantee that the transfer
has stopped. As a result, the DMA engine may continue accessing the
buffer after its mapping has been released.

Use dmaengine_terminate_sync() before unmapping the buffer on the
timeout path, while preserving the existing status logging before
termination so that it reflects the timed-out transfer.

Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/marvell_nand.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
index 38b7eb5b9..a342a48e2 100644
--- a/drivers/mtd/nand/raw/marvell_nand.c
+++ b/drivers/mtd/nand/raw/marvell_nand.c
@@ -900,14 +900,15 @@ static int marvell_nfc_xfer_data_dma(struct marvell_nfc *nfc,
 
 	dma_async_issue_pending(nfc->dma_chan);
 	ret = marvell_nfc_wait_cmdd(nfc->selected_chip);
-	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
-	marvell_nfc_disable_dma(nfc);
 	if (ret) {
 		dev_err(nfc->dev, "Timeout waiting for DMA (status: %d)\n",
 			dmaengine_tx_status(nfc->dma_chan, cookie, NULL));
-		dmaengine_terminate_all(nfc->dma_chan);
-		return -ETIMEDOUT;
+		dmaengine_terminate_sync(nfc->dma_chan);
 	}
+	dma_unmap_sg(nfc->dma_chan->device->dev, &sg, 1, direction);
+	marvell_nfc_disable_dma(nfc);
+	if (ret)
+		return -ETIMEDOUT;
 
 	return 0;
 }
-- 
2.34.1

