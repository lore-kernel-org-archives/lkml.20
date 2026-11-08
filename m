Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177745;
	b=jbyHK2LBfzoENxDcbCiHKPadARuYiMAkongWr8FJRH33L3eBL5GoB+ih120wooWGpb2U
	 e+b3mmHhqRVOA3RiQ3RR9WJEv5sBHZkg/qo8vd5MQrEEyOPB05KASiUSzZGF2tzg9kmms
	 aUDg7NgJa7O5/xUZKA8tEnRBVKNs2p0ldbvtG2k00Ly7im1gU8YppjRBQ7vim4tHRoEOc
	 mdEGyROWo2k0lJla/dt+fSVM8Lq9/3GWr90yBqQOOOL/x1NLh4vrhtUpsnTc095qvuq6B
	 qssdf0Gi2yHGRgOLOsGwtRv71+NXn2FOYiMKJNWRDNJKJ6UcMIoOnBs1/55UVyxnjwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
	b=T3URJfoObpq7MKagsCImijHoI2xTCyRbYxAhpIFwzJI9bYLFbsmHokGs+dk9CM2o6CRT
	 F1I8VW35o44/Yepue45y56JlRtwDppd4pNrHBSEfuQwlRm42hVygpK6cJRwey9PjLd7z3
	 n1o13yMUINjoewat16S6GsKd8Pbt42XeNpeywTMFMqK3CSGwhnHBFrlDERAjqc6CZYDbP
	 +0gi7pBb0CN1fTD4T0CXRyANgWtn6ptjvOM+7SdZjHyFV7Z3XlC0ue0+oyVUeDWpsvB8A
	 NZiRHCXx8BaiokpAeRs64dVj11cGCqzr5XsHn2GmHL/KtN01H+F/r95O1WqC4uBrUzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8OzPKdN;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A510606A33F
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A510606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q8OzPKdN
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-563a0462094so136612b6e.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177743; x=1794782543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=q8OzPKdNmdLYRq1zgFWwV/LaYGoCt86qNEDdrNZOhWW/F71jWsFH4YfWBtwve9rPVL
         6xEt0+knLMvyZe+34OrbRH64DftnHEmGQlv7xrReMfweNCdOH54J7L5M6b9u+cAjJjuT
         Tr+VEkJ30s6z7DAgwucuydppZG+yuvBFH4knG+BMrEQ3mlME3nnwMhn3P59efq+KY4ZY
         opSeJD2L/xjG8QWI93uib4QmDWXswlYuCmyzcEuZsmhW5l/drE4BbQWnDwiwe8HwC+R/
         eFYsbTCXoojKiZGhNHAf/iYYKVvCZF4M3L32O+7QBlFXFyLdZvX33lGqt2u7fQo8lxAV
         rNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177743; x=1794782543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ySxSOrcSb7uKygDj4na05JonBIKAGAKmpgaBjQ4aTs=;
        b=p9Eh/HuKdU5/RPPgVIVDxJblyyvbRuHdqayNt6LuFK1pBTvUSiWZnlBF7m5RWLB1b/
         4gQ/DDLfAns22DRU5sSo0I9lgZ/VfLse3P2ytF/iI+FX8Vhbec/+iBrgHH2bgyuMSBXj
         Ny4ruQdJAiDMxZel1NIWkjp4r71CxHtTG54NmdT1Gb/y6/ipQPdCGl3tFS0mC8PF8UPQ
         RnmYHMWAjtxChYU8xxATfWLrDm2n6TmDviLOEFkCZrBN3zlmv7GGuAnWTTYIUEwFTi7g
         Wac50FsYOyaJpxBEFRrGvGmEUg/7nC2GJzhq3i9f4Xoz40Dv4ZiPli3SMY38uXUKZ3Kv
         hRuA==
X-Forwarded-Encrypted: i=1; AL+hErFs/mnysAAY1vkh7Np2lDVm77Kh3dqXjSEy2BmOdPKAObFAU902m9aaD0FFxys1r42S/A9C7n7CSNyiMfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8b07py2kTm4GXAOMH3j1hbQMCcO9lWMALWfhRqpVh9eqt3QEI4
	/cbRPLKTklI3bcP5yCFsKikNguaOMnZsGWGDEjpSz5ze4ei722ZrmBNG
X-Gm-Gg: AYBFou2VG17OeUn1to70Kbr97SxV383gJof67xQk9lRmq20k1xLlZyGAsF7RQuGMnhR
	Qf1jLZd1qWMJtUn4ITn70O1WGSuBHKVqBnnLmTjXQO6Pkm6mBHzpnlkCwrqyEEMEEjfTFg7ZLpH
	w87Tbtqi9BsvXLnmVsu1G6H8A0pj8d3TteyGv/+wHeMpVRVmBNb/Gm0aPyFgD/iS19ZdwaD13zA
	oXlimCELigg2Ix9z0xK/CyaUKUwnXJZ+60EnETpsfqzB3iRiJU7CcLPLG0A+JJv4/ovubZTk7cu
	b7x9DCBiHBtPRJzIGB8v6ggGn6hhRMzWjGbuioJipYtGg3d3tPdj6WUueqGewyPmaMcvdaYG2C1
	7HgyaP478EY/pDpYXI6Tzoyn0l6V0e+mEL+BoHs65pzVDt3Lo2XutVVvKTt+cXAG8ccaR4mmKCx
	Ov3EIZ8h2Zgx5FGaMwMwnWVczCTZ3UtHD58hgZhC392quub/TO7ubz10Si2FO6HEBt+BqAfWbv8
	DZMFr3qyW1VoHrITtvd3Lg2YlSXbsnhAOa5zaq5Zv1Luhxe/2TnCQnImkGB2eRUgnad2VXGKbrE
	Nw51N/RWAs7JosQCm74RqkUoe3R9ig1QGNUDJdfcu+9Dh5K12WNfGFcUfVwVqbLofPCsgxuQmGf
	LquQPOFWGn18PSg4d3oQP2ytIvhkIblGnn2otj+am14BhBEnfkfuKkaCbBw8HALtP6ULkRE1M5/
	+ZquSC0dEmAxi4qV1I3ziI0iynfV4XVYlvf36PKRsqhT1neZ18YPlP
X-Received: by 2002:a05:6808:2383:b0:4d6:90d3:e18f with SMTP id 5614622812f47-56814624be0mr1364853b6e.46.1794177743647;
        Sun, 08 Nov 2026 14:42:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54e39sm2859944b6e.15.2026.11.08.14.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:42:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:42:09 -0700
Subject: [PATCH v2 2/4] mtd: rawnand: qcom: retain the BAM transaction if
 replacement fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-2-4a8704cbf7b4@gmail.com>
References: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
In-Reply-To: <20261108-submit-qcom-nand-child-probe-errors-v1-v2-0-4a8704cbf7b4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Sricharan R <quic_srichara@quicinc.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>, 
 Boris Brezillon <bbrezillon@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

Attaching a chip frees the controller's BAM transaction before allocating
one sized for its page geometry. Allocation failure leaves bam_txn NULL,
although later chip scans and previously registered chips still use that
shared transaction.

Allocate the replacement before freeing the old transaction. Restore the
old capacity on failure so the controller retains a usable transaction
for already initialized chips, including I/O during probe cleanup.

Fixes: ba7542eb2dd5 ("mtd: rawnand: qcom: fix memory corruption that causes panic")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index f240d1effa04..062fba9eaecc 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1329,21 +1329,22 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	ecc->engine_type = NAND_ECC_ENGINE_TYPE_ON_HOST;
 
 	mtd_set_ooblayout(mtd, &qcom_nand_ooblayout_ops);
-	/* Free the initially allocated BAM transaction for reading the ONFI params */
-	if (nandc->props->supports_bam)
-		qcom_free_bam_transaction(nandc);
-
-	nandc->max_cwperpage = max_t(unsigned int, nandc->max_cwperpage,
-				     cwperpage);
-
 	/* Now allocate the BAM transaction based on updated max_cwperpage */
 	if (nandc->props->supports_bam) {
-		nandc->bam_txn = qcom_alloc_bam_transaction(nandc);
-		if (!nandc->bam_txn) {
+		unsigned int old_max_cwperpage = nandc->max_cwperpage;
+		struct bam_transaction *bam_txn;
+
+		nandc->max_cwperpage = max_t(unsigned int, old_max_cwperpage,
+					     cwperpage);
+		bam_txn = qcom_alloc_bam_transaction(nandc);
+		if (!bam_txn) {
+			nandc->max_cwperpage = old_max_cwperpage;
 			dev_err(nandc->dev,
 				"failed to allocate bam transaction\n");
 			return -ENOMEM;
 		}
+		qcom_free_bam_transaction(nandc);
+		nandc->bam_txn = bam_txn;
 	}
 
 	/*

-- 
2.53.0

