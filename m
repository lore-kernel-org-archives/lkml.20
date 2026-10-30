Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377277;
	b=BEy0WAlk62anFWKPk/w2qcog3AqjflZ0bVM3BXKWGvwaNolUV6KJwh8vV+V1nUJezrDh
	 kvtV9sARzEk/nkedRT69hgFr6vFZn7kBDunIxOhU+0HaxRYnzfny9dYKelur64CcDvbFl
	 is+hW/rKsE0a+wz7thlAOQ51D0JTUsvV3IMpttoBY20gB98xGH8EHfae9k0p4XTG71tP7
	 EgW0elWNPYi+uAjpLsqCf7Y5G8rG39eIx3qnl5G5NOVCoGlB/7rti6MozgGfzbwbliiRo
	 trx1FzethPEA3stZZc5cEC7q5a2r6GwC8wQ147IZYKGUhoTEwtwGWO9vjJDTtiNAsqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
	b=qnm7rc04tXDMvUeyNRjXpIrI99pKVcL0qjProZbKIa6xRgBIZGNVDUwU99joC7x4sCMr
	 xIlkselB5++HiYNI5XNff1vjxUst2ZLHAlABD8luL1xaTvy0iYbme5QeO4TOU8ejDi7ZC
	 miEqw/TEesCraZ8jhwz0+ccPzCGUfQZ7g8dbckV+uPFN+JIfP5aXS3xdKTjYdDKEVeb9V
	 7iDaHLpy+PHWKNOTULyvBPrdm0tsLLmSF9BAEWXJWhlecMQ3jBwIX46S/K+gHLx3oEF+R
	 yYcYyODWRtt9GBeHIRhm/m8GNrxy69wyBB40eBQFTntBiJuzdpwJ60Tdzl+tMd3szQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2AFWnrQ;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737D3606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 737D3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o2AFWnrQ
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-486f013db83so315765fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793377275; x=1793982075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=o2AFWnrQOwPhuS49gaxhb1HgLi4Eu7sqSP3MFnax3w6vq/4ch92RT3cUpbl899YW4l
         Oe1p7MCHutef6NUdpbJcWfBWfIF3ythh7UDTq91BMd98rvXFr7lFcZK04V9TxKcT9FzN
         n5gU9QShTcXbP8SPbFgA/9kfoFbSOvwll0KfLOt3QsgLVfLAuRFJ1CKjMNAsjI/4NJQu
         5TnUOp/wzKiDiP5KLNzVP1Fx/Zu8ENGgv9tvb4uOy9JKpUTyWIR/o0WK9da/nFewanZb
         rc4ayD2XcL7E1N4Qc9qSJmgf2SVn6swyhY+o4tV3ynhICQfdWAhnnkLmn8Jpihn92xNd
         7ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377275; x=1793982075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiCv4TzAu5z9UeTUiidIChOBFFfvn1mb27PyQpvB9kE=;
        b=Ko4Tyy1a5FdaV9S9be8nbOuIuqb698UE+ZtkVpY87DnmSQRfeWdYMz1i7GBshNS3dr
         Gtnmg/ge67EdC5RzzAnru3T97QGgtpHtRfqaSdLPps4E7HuEVdtHuXe6crr3/kuevRwN
         rvNxoRnPscJmJFmhzv3Pc6KwoCzN26+ZhTyCGfKlKDLAxKIPvT9+MfxyeyZToXcrZLm9
         Fn1QlaZ/2FV3UWrKhQXsQmTJTvKzvUn+WZkSYfqjHrrKFTKOyDBwjpLVCnMk0S3dpHsN
         giLfkXLiolofXDVSxtvtZC1c+9ZEuQckQ5GFV+LnJ2ztTA0jDbtF9cifZS6YL6d4jSsI
         PqlQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/NISMqWj68uqkIE+dMuCnKeiA/FvbAW/w9dDFupnmC/E65vpMK11qzA8wj2YD8eBq72GtVYGmObfvo+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIl/gvQGoXfoJ6iToHoVsPwZy0MwXBxxxz44l6mngVZoFhQLvn1
	Wt1LhbMv2JhstU+NxOp9urzB1YffHX370uoHtMZXeQpZqVg9YvPlz/U0
X-Gm-Gg: AYBFou1O7wjNFo7AxjJ3at0wszAzduMN3YUAbrURgS3aUDt8gEKx9grhN9u+N6+YxVR
	9SeX6sDHWQF11n0sOdNUx4/7lEOxOzRF+9T0UxAV3wtZFk0NDfgiB4+rQu4E+XQrWA8ieM3pUPq
	0nxcBqwr5T29OLdffr9iXm/MzuYvOoRvAvY6O0Z6TbjovyuhowQxDopqVI0LMz+ugvbHkhJlgYZ
	QQjU2OWDRz8xdW2oJIRVCTo5XEke2EdlutUzP5evU3eS6QsKrYiGVtkiBkrPRPtJwVy6kuOEt8L
	wxt5ITjgB46Gelh/nCvr6W/UfbAKdQtDLmd1pCesPEIuoRNQCFmOwdUga+MjSJb5eYxnFqam1nU
	WVlukAe0OzwyhpPW3GHyY4zaFoevu0apQppAZZuq/lSYM3mRI1opI5BFWHLJ1cdcGJtUgIw8LAe
	kLDYMR7aXkQVmeYDliBGLo5D9A1eep+XKlhAEownuE1H/oa4a+iEdP2UPd6zE8VNURl7o7rtFnq
	JJpKItHv9SWtplfYTPh+fuNnBVUjQUlP7RsF1IVGz1kt+Jlj//NGDUyxMsfzXYfZyNJVXSm0Irx
	zDRIdB3jmDc3zUdUP2aDLffDKh0NFuQE/Km5lKuan37dugC2I7xF08kqo5gpq4ghs4PH7uMHROo
	kBReHSsL4dUIVXp4Rvod2B8FIZyuHXv+InCbT6HcDW3CMf8Jl1zaNaW6tZm6xzNSTpqN14vYqzh
	QHFdfsHEa8q0TjPkE=
X-Received: by 2002:a05:6871:3149:b0:4a7:4323:3fe1 with SMTP id 586e51a60fabf-4a9075f9d96mr1952103fac.20.1793377275138;
        Fri, 30 Oct 2026 09:21:15 -0700 (PDT)
Received: from brev-9gdpyq8lp.ap-south-1.compute.internal (ec2-3-110-210-194.ap-south-1.compute.amazonaws.com. [3.110.210.194])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a92167b03csm322536fac.2.2026.10.30.09.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:21:14 -0700 (PDT)
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
Subject: [PATCH v2 4/6] mtd: rawnand: omap2: terminate DMA when prefetch cannot be enabled
Date: Fri, 30 Oct 2026 16:20:39 +0000
Message-Id: <20261030162041.2998170-5-samarth.colleges@gmail.com>
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

When omap_prefetch_enable() fails because the prefetch engine is busy,
omap_nand_dma_transfer() unmaps the buffer and falls back to a CPU copy
without terminating the previously issued DMA descriptor. The descriptor
may therefore continue accessing the unmapped buffer, while its callback
could also signal info->comp for a subsequent transfer.

Terminate the DMA channel with dmaengine_terminate_sync() before
unmapping the buffer, ensuring that the outstanding transfer has stopped
before the fallback path proceeds.

Fixes: 03d3a1df6da6 ("mtd: nand: omap2: Start dma request before enabling prefetch")
Assisted-by: LLM
Signed-off-by: Samarth Narang <samarth.colleges@gmail.com>
---
This issue was identified by a research static analyzer for DMA
lifecycle ordering and has not been validated on hardware.

 drivers/mtd/nand/raw/omap2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/omap2.c b/drivers/mtd/nand/raw/omap2.c
index 552f36da7..b6bd4386c 100644
--- a/drivers/mtd/nand/raw/omap2.c
+++ b/drivers/mtd/nand/raw/omap2.c
@@ -417,9 +417,11 @@ static inline int omap_nand_dma_transfer(struct nand_chip *chip,
 	/*  configure and start prefetch transfer */
 	ret = omap_prefetch_enable(info->gpmc_cs,
 		PREFETCH_FIFOTHRESHOLD_MAX, 0x1, len, is_write, info);
-	if (ret)
+	if (ret) {
 		/* PFPW engine is busy, use cpu copy method */
+		dmaengine_terminate_sync(info->dma);
 		goto out_copy_unmap;
+	}
 
 	wait_for_completion(&info->comp);
 	tim = 0;
-- 
2.34.1

