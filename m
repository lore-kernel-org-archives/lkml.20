Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A33C44A3F2
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791790729; cv=none; b=IIqno/iuvs+fbiqLSP4owOc+LAHbC7l58AjiXgcA64VUSHZ5s1fIjjUYzD1gzK9RlSlrcWlyeP1v7AdJLb//vBVaTLxI6+twnwxk49bdW5zkdYcYBkko2lKahjMeOXfmUA425rkPwZWjdH4IsiYwqtVEDdx++T2uDJLR5UI/rP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791790729; c=relaxed/simple;
	bh=frGeHsp77ccEYIjltOywKMw92w1djyDNOnPEz2b3YKM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sHxVf6Bd/p8zw4x1lWBfE4OXI2dwUIjIXyCFci5DcWXHmQhFX1nkz3oFUJ758TZZPUnCJJ3PTH6pi4b/cGZdcNT9okRWhbio8e6gjImMRebCyLzgU5KJdjdFi0pJOgZKZzYikDuOZP9tcw2li9ShRd4Cp5qLLafxnt1tiqyYR00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=cpGnEkhc; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="cpGnEkhc"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-887a58523e6so327114b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791790728; x=1792395528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXAFZNxdX2XaonrsCpg7wn2yHmpFEkowvimbfLrPCIY=;
        b=cpGnEkhcrA8DiFdOHhaLwRsJOWCdYdsfnn1bd5nRIRVyj751mvR+LEnm+PFM2p5mKb
         IIQ1q05awY9Lw9nw+MqlQ92ld6khwciCftkiAk58HAhqtnmybtFE0H1+zmz6TrKLmho/
         u5dR+JJWa0dN7QGQh18Wk0P5awF84pkM2XElkdT2PHc4A51Ujxir/ZKNVlKCADTUrtbF
         FaCPFhp/unAfKC5DlDmqoD+mM8vRPCjSzi/pIe/V/3Iak+xG0BSY1ulUh1ki0cVGJawV
         WFmf4EL9zc/ul1AwnuxZ04OboNTUk/1yKmP/0FY33RJhjJ0GHpmmDSXMb9M9hGavZfaQ
         +peQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791790728; x=1792395528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXAFZNxdX2XaonrsCpg7wn2yHmpFEkowvimbfLrPCIY=;
        b=IDrhGAKqV7SZhLbiHd4j5+kRv/lv9Y3fyfdSHXlHEMyW7981QJccF35pdJRW9tgwKA
         woKyDISZ84DpIpJqh0rzmLlEAZWK+sr7OwRuvmBNbrFvspKak8SSGPVstM5KwHCb7Ova
         irrOnuPxlAKfI3gcURqf77G03+N3govrfb/qsMPLag0dJ/azyKmv5ND0KiicVjZkDhL9
         b7HTZgxFJ76DY9p2m8UTuYSErowVyTztDCGdqRpZUJhqsGLnylZJPFpwoMCH7ysLwMEq
         A3fVSJCeq50NXK5eNzgleASEBY7xquvTobWr30Ki6393alERie51XLV7P6B+GmHP5K12
         f4PA==
X-Forwarded-Encrypted: i=1; AKwUvBzwxemucLkQdbLGQ1CuovJklt3fSDXOceP1VCKYeJWC9e+qct1etLKB+0K0iCDe20McCkuVCPPhqiqGbuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEi5mlfQjL3FVGiyy6fNwuouyVB9JPM5VzLXMq99OybDALZrr7
	zTdycFFVkUVgjtv7hcY2/saPNrBdl42pJ40fspddLUUL/8AOaNVRorLlLzzDGkJCHZ8=
X-Gm-Gg: AYBFou3iIkDyMyGa1MUXmej3G02UVAomzsIquqbaIiDBB0DiCBq+tfbUCzW6kWYbvC7
	E6B01mY2eM2CKunkRPihyjnqTH4uFgDee1iWViaz5sZswlEMYQqIxt+f7fNwiy3Qhk6NPWn9eL4
	8Wd60bbM76TcOYY4ZasQCyZkLBZIgm+Yobb9ewRNGmIaOj+6r/lJjgOuSxfaLHnPU1+IH4OXSS7
	Kqa8htMzIc9JqaMz4YMNl0DwA3HxiUI7bM/LCzePuSFXJAhWuykrwKin31Yro7Iu6tXj6k+9cTL
	8DcihJ5pxQaG7R5YipCgM+J9S70rdLIOnfL7wknjDPwthmj0jaa5FGczhJiz06kJguGTwBYfaf5
	vo/7Fa3RFG7HtY7AHspmGMiNz2BFGxjHiFpH3R4x6t1s1PlFdLVZMLK5MtLHM47Lh2Zz/GDIoj6
	5jxAvMx2wogbs+Kc3kVhV7aGb0hSB/WCQsh3ZG/M/oDM2pNMVvdaVQLQIrrOMKuc9EYHWqlE4tq
	FrsIatUzgU0X6XI
X-Received: by 2002:a05:6a00:4b42:b0:888:4f06:903f with SMTP id d2e1a72fcca58-897c78d5fe8mr6613335b3a.38.1791790728027;
        Mon, 12 Oct 2026 00:38:48 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-898c9ee8bc5sm2148780b3a.60.2026.10.12.00.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:38:47 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	thenzl@redhat.com,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH 3/3] scsi: arcmsr: wrap the type B completion index before using it
Date: Mon, 12 Oct 2026 16:38:28 +0900
Message-ID: <7e1668a808bb282f43ca0e74189e678e40f03779.1791789900.git.yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791789900.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791789900.git.yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct MessageUnit_B lives in the dma_alloc_coherent() area shared with
the adapter, and holds the completion ring next to the index into it:

	uint32_t	done_qbuffer[ARCMSR_MAX_HBB_POSTQUEUE];
	uint32_t	postq_index;
	uint32_t	doneq_index;

arcmsr_hbaB_postqueue_isr() takes doneq_index from there and subscripts
done_qbuffer[] with it, and only afterwards reduces it:

	index = reg->doneq_index;
	while ((flag_ccb = reg->done_qbuffer[index]) != 0) {
		...
		reg->done_qbuffer[index] = 0;
		index++;
		index %= ARCMSR_MAX_HBB_POSTQUEUE;
		reg->doneq_index = index;
	}

So the first iteration uses the value as it was found, unmasked.  An
index beyond ARCMSR_MAX_HBB_POSTQUEUE (264) reads past done_qbuffer[]
and, should the word it finds be non-zero, stores a zero there as well.
arcmsr_hbaB_polling_ccbdone() has the same ordering.

Reduce the index where it is read instead, which leaves the rest of the
loop unchanged.

Measured with a KASAN build.  struct MessageUnit_B is 2176 bytes with
done_qbuffer at offset 1056, so a reported index of 600 reads 3456 bytes
in:

  BUG: KASAN: slab-out-of-bounds in arcmsr_hbaB_postqueue_isr+0x1f5/0x270 [arcmsr]
  Read of size 4 at addr ffff88800c08cd80 by task init/1
  ...
   which belongs to the cache kmalloc-4k of size 4096
  The buggy address is located 1280 bytes to the right of

Fixes: 1c57e86d75cf ("[SCSI] arcmsr: initial driver, version 1.20.00.13")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/scsi/arcmsr/arcmsr_hba.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_hba.c b/drivers/scsi/arcmsr/arcmsr_hba.c
index 1381420d9fbd7..b73aaa0c8068c 100644
--- a/drivers/scsi/arcmsr/arcmsr_hba.c
+++ b/drivers/scsi/arcmsr/arcmsr_hba.c
@@ -2568,7 +2568,7 @@ static void arcmsr_hbaB_postqueue_isr(struct AdapterControlBlock *acb)
 	bool error;
 	unsigned long cdb_phy_addr;
 
-	index = reg->doneq_index;
+	index = reg->doneq_index % ARCMSR_MAX_HBB_POSTQUEUE;
 	while ((flag_ccb = reg->done_qbuffer[index]) != 0) {
 		cdb_phy_addr = (flag_ccb << 5) & 0xffffffff;
 		if (acb->cdb_phyadd_hipart)
@@ -3662,7 +3662,7 @@ static int arcmsr_hbaB_polling_ccbdone(struct AdapterControlBlock *acb,
 	/* clear doorbell interrupt */
 	writel(ARCMSR_DOORBELL_INT_CLEAR_PATTERN, reg->iop2drv_doorbell);
 	while(1){
-		index = reg->doneq_index;
+		index = reg->doneq_index % ARCMSR_MAX_HBB_POSTQUEUE;
 		flag_ccb = reg->done_qbuffer[index];
 		if (flag_ccb == 0) {
 			if (poll_ccb_done){
-- 
2.43.0

