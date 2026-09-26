Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B03371041
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790396940; cv=none; b=StVArYBFc5Nv67lfdDhURZvxCRxSE6W9vi2062WOUnYIC1j73N6OjSmZRsM6mHHmvoWB6Mvnig5Om4bvhrd4TXzVeIBUMMmRfoYOCDhmB/+H2ZPB2EQl8I8UAFvHW/eaPoJUDriuu8L2sNsitIvEa9MC7WHhTajB54C/KPUaaCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790396940; c=relaxed/simple;
	bh=+oFiQMh34Yo1wjCxUXc0WSNGzDHCpRZDGEYi5TVqUt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=colme4rJgjDuTU+xSyMJrKqTDTSMNDWd9L0KTcTOjIelhyE6YNaKSjpR0ggGjhGQpCPFtRsdr5kbPWjd7LGr6BSIRD1b6ovw2M4uaVaU1LIboLligsdXOXmehgagmOBDoRl7oK1+i3AEV4zepcHuP/ik83UA0H83b1Ph2ppqQNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJd9uOHP; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJd9uOHP"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so518352a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790396939; x=1791001739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rZYtb7HyZs5jwg8H8lmzZlpM9HbrBErAFFHpko/rscE=;
        b=OJd9uOHPfE4SW5QVX7CGPSbgq5+gTdjzOCkWsGMy6221DiKvqg9x21OL8YpO7b7+Ii
         ghe82xdviLRrufP3I5/5HVTjAiBuLqnHtEiMtLG3hDWoN7eLkxJ2RCH9d7mpqEBsubaV
         axJ7Sq4iZCaPL5ONkqu/5s4NCIYzxbbTf+k8AIoY6cvo1Zto5FGnE8RZK8mMDkIJ4kTz
         z733EnBYWAUzfPD2UPtWeNQvlbyx6scEOfp8NuvS2WTY8rjY2uZ7od35/liSgr9FymM/
         xpBvl6D5Vbk8xq59RV7APxg5NBFj4xB248jGcAUW0K/qFilfdhqajFt6OgqDuHJ4n+um
         2HSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790396939; x=1791001739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZYtb7HyZs5jwg8H8lmzZlpM9HbrBErAFFHpko/rscE=;
        b=c9r2ERK/E0DQdFtrtBUDdsa9v7e3C61fRHdzbwEm3RwZhx3wRhzxe9HuV0rkyevUm6
         wBkDhH5RDeX+b+y2M1WC6vIMP0TGKN0vsZR5AQCEte+WKk7j+NickzL2j1T+sXOv9dvz
         z4A6N+Y7v9J4wBJ7dLgY1tot91K4g5NfUALPwwUXDlennSMLwlc2/GnEShMmluwGwDTD
         PRthsjRq6VE8+0lWUNcnf6G5iIpICLkcN0szQQ/+htaUOi8AhhEWXEh/wBo0XArVvawh
         zyHLjAN19nOwgzXKKJBTUhHOgbYpl/6nIQ5B3YhBk3IGAcK66a5msI/MAKzRNeF52XIM
         uf0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw8H8UreWg4u7j6JxFpYlWVUQ5DyKXAVr/I9HZjAy/T4yEPOB4XYAdiCVEU1HAmQZqB2zNMfFDCUhVdQpw=@vger.kernel.org
X-Gm-Message-State: AFuF++lZWprzXtu8j3IWcB0acUTfaArXjbBxwJRmzMUvYEukwLymLfzQ
	7nCBAs4ibjlf78PTiMTZ6SsWr1w07RW0PYDopfFfoTF8T+TFERIz+8MS
X-Gm-Gg: AYBFou0yefuzJVIlYsUWaop8UK9vo7Gcl7QXB6lzBfqjmMsRy1ukmA0d3Sf5GBMWyuC
	WaFJfhue1EZd64C4tA3Hfv9F93HTy6JgWe9Dkmb64JhPRO9cyFWYMxVO3AqJxFf5Re3TSgmMssh
	JsPGLTg+ZJWEnhvHqpQF3IY5Wr7ZutLCkYn4qB64RKWFj+SxZfhz/4DAMTBD88gV+U59gEPV/Np
	GGMtoC55znx81/GE4VPG5aVV2F+qZ+azhuiyhH3v6LeM/8d1hEFeBPauCqeRRaw8IPPl7TwCnw2
	nd/cSspct6fdDLLeSxdypekZ5DvjvH2h9mYCntQgaMDPxlmqB8A72swBYZT14OnY/UW8W5L6mQB
	s1O6FEV6a13qi1PoDubQhtgPyWL5mjZrzepSzQVzotiMPU7HJL/26oZVFvACew3MPO246qMF+l8
	YSwwilvEqP3HRT/EjPbY5WykEJ9pn6pmIdqT4dJ6ohlP0KX5vUjC1Vp3lOEZh6beTxayAwVDSfq
	W7zITyYZUAL5/fLZxqczbFQmr+TKwwFFSzp2CEIGLz6iCILsblibY6Z6h8lvsWaHleypWow+sNk
	HBtSBV5yPIC82TWVc9Fy1oA0fP9aQrJu3uZm8g==
X-Received: by 2002:a17:90b:2645:b0:3a0:c85a:ee12 with SMTP id 98e67ed59e1d1-3a0c85aeef6mr1436224a91.41.1790396938711;
        Fri, 25 Sep 2026 21:28:58 -0700 (PDT)
Received: from dell-pro-max-tower-t2.cse.unsw.EDU.AU (pag-t2-pc.cse.unsw.EDU.AU. [129.94.173.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09773e7c3sm13841518a91.17.2026.09.25.21.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:28:58 -0700 (PDT)
From: Weigang He <geoffreyhe2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mtd: parsers: qcom: fix offset/size overflow on large partitions
Date: Sat, 26 Sep 2026 14:28:53 +1000
Message-ID: <20260926042853.2209428-1-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In parse_qcomsmem_part() the partition offset and size are computed as

	parts[j].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
	parts[j].size   = le32_to_cpu(pentry->length) * mtd->erasesize;

Both le32_to_cpu() and mtd->erasesize are 32-bit (u32). The multiply is
therefore evaluated in 32-bit arithmetic and the product is truncated to
32 bits before being widened and stored into the 64-bit (u64)
parts[j].offset / parts[j].size fields, so the 64-bit destinations are
never used at their full width.

The SMEM partition table is firmware-provided and the per-entry offset
and length are not bounds-checked against the device geometry (only
numparts is capped). On a sufficiently large flash, a partition whose
(offset|length) * erasesize is >= 2^32 gets a silently truncated
offset/size and is mapped to the wrong region of the master MTD, which
can overlap or extend into an unintended area.

Cast one operand to u64 so the multiplication is performed in 64-bit and
the result fits the 64-bit fields without truncation.

Found by static analysis tool CodeQL.

Fixes: 803eb124e1a6 ("mtd: parsers: Add Qcom SMEM parser")
Cc: stable@vger.kernel.org
Assisted-by: LLM codeql
Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---

Notes:
    Compile-tested only (ARCH=arm64 allmodconfig, W=1). Not tested on
    hardware, and there is no reproducer.
    
    The CodeQL query behind this report was synthesized with LLM assistance,
    and the fix and changelog were drafted with LLM assistance; I have
    reviewed them.

 drivers/mtd/parsers/qcomsmempart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/parsers/qcomsmempart.c b/drivers/mtd/parsers/qcomsmempart.c
index d4fdc46a00730..1591aea48b280 100644
--- a/drivers/mtd/parsers/qcomsmempart.c
+++ b/drivers/mtd/parsers/qcomsmempart.c
@@ -143,9 +143,9 @@ static int parse_qcomsmem_part(struct mtd_info *mtd,
 			*c = tolower(*c);
 
 		parts[j].name = name;
-		parts[j].offset = le32_to_cpu(pentry->offset) * mtd->erasesize;
+		parts[j].offset = (u64)le32_to_cpu(pentry->offset) * mtd->erasesize;
 		parts[j].mask_flags = pentry->attr;
-		parts[j].size = le32_to_cpu(pentry->length) * mtd->erasesize;
+		parts[j].size = (u64)le32_to_cpu(pentry->length) * mtd->erasesize;
 		pr_debug("%d: %s offs=0x%08x size=0x%08x attr:0x%08x\n",
 			 i, pentry->name, le32_to_cpu(pentry->offset),
 			 le32_to_cpu(pentry->length), pentry->attr);

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
prerequisite-patch-id: c5a3be8688fd8e88a00352acb1374e91fcb52a03
prerequisite-patch-id: 67693e2c08624df0841619cc085ce9200f4385fc
prerequisite-patch-id: f3d73f7c19be7e952aa8061303f53f9a08576a88
prerequisite-patch-id: 541e578709d048f4c8115f1d926be2f2c03ecb0e
prerequisite-patch-id: f23f8e0693435497645805822d98a92e57fb46f3
prerequisite-patch-id: eae82895db8ba67018a777a91a283ad6bc4a55b2
prerequisite-patch-id: aed00f7502865e3f9262959d828eae4a4021108f
-- 
2.43.0

