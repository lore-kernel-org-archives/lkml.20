Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E6046EF8D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795736; cv=none; b=lzkCL6rJRO0Vg+99CXJcdu7somULI2DZs0vgUnHueTZ6yTVY37wpzYO1kMMfUZWr4RpdIlDlFHxVtGSvkUZu0kmBzOI49vvo5NsyxRqZ+3xMFJoLxxYbP7x5uIiTWAfTWl9cm362Uo3QeHyNJw10l7a/j3JctPxF+HysYFreuOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795736; c=relaxed/simple;
	bh=AlXKd1yeOH2Vu7G06y/CA/VPoGcy25+0dR5pAcrfU0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZi0qd593lxRNyNo7WmeIcqUxIX6aJcFJpv8Vj2Rdz4meUryd2rM+evJQVXIG9ntLPFujDfUTRM9ffbrLSekT0ppR2m7RcqbKNF6uUkgkq+kXvd1zGZXq5eZEdPyG5cufXGqK1JjHPwPMcJT8QjgO561stu2aJO5lqqzrLvu2uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=n1xxS8Ye; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="n1xxS8Ye"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e8662d5e95so8754035ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791795735; x=1792400535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+RS3qtPpCNvzQb8IiMJLF8fnk/CkQQbrLAsNhPE88k=;
        b=n1xxS8Ye25vU8VSPlpsiH6lSt9mgB9EsLAtFg4c2o2iQhuNB/oZx5OirCPPNjpdheg
         yJdyzQS6LX9Z/lqD6y5rkpBGnJbZ3sljFcLjK/hjIEUpINbwx8HEkueOOR+MTeUcbNO6
         nd9MN800dv9vJNYGuMOQXlgrwMpb4KujUyvrfhLRmZepJ6WFWssSgfL8HSdQPK/lBBjA
         yjE3nzjA1zIxXhiTLcGc1qwGdAASVDyIbKEAVTzjLkQiiFjIpP/Li8tVxRkkOcAswkGQ
         uF33OLQ/NgCm1JzWFVlpmUjoAf2ZHftN7HNxNhcTH0rJyf+UNQxAfm0C+2FHJ19eIgsv
         nwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795735; x=1792400535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7+RS3qtPpCNvzQb8IiMJLF8fnk/CkQQbrLAsNhPE88k=;
        b=fsj7wcB5MQUmXldzeNyvbwWMqZ7NI9VJXS7WxB3aRUncI6eg+8x/RRhEKnFeC+eGIS
         gB7uB2K8p6ObiXFipXvZqemvEUtrQUTVP+cpUHs/9/1zdP2lILGzRW6NJ+cWMRvTtqId
         przv5U2Ws6uCJNk29FkWJR2W53mhX4Y5u16tU9EcXAdHXt4T8fphWjvJ6Yin/jgmtpJA
         /dlb6AoMgS3J7R9kQyJOlz8K7T6LISpMN6EapByP9iAR9juXLjNOWplGWZkHcowHQdIx
         ciYtViAmfi5gT23+/acrDaRP7ttnEuv2Sm7ca9kPGRCOrTRY75h3v27eSi4iOv6gBoG9
         u5lg==
X-Forwarded-Encrypted: i=1; AKwUvBzCzN9b2QNpZhxqSjL7xSS9FNapzQTEwRwda15TFjL+Efk5HWdFqy+34Yfz5GldDAHfJgZPwkB7XUYttXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIicY7ZfQf3zLJLA1PYJa+2+x+TqRSShyqnYwcW8AEB6wonTMvP
	hUD+QmKzmNnnIupDdupbFfEleAA2q1+JKcue4FzouwIT/XLFltoIL2M/AbUN2r75n0E=
X-Gm-Gg: AYBFou1uWYT/p2zAvKnnAkJvOafR0fiCH1gAkfqt6+GUzaTcW4k7Zkr/U78+ty/jTOK
	aiNKPbD12qL4DYvjhU1XN8AvAoCDVSiik4wOKpaRsXgsH2vV9eZQ6I1g0pzrvGRN60yT2GmteLI
	Yg0zHJ9GWzN6rctDGiRKP9YbvubzEmS1OoEWnnUsa3UiJ+O6D86IGlwv+lH2y5nDe+cQiOThRQW
	7qwO/BRimYyIuDDG/GGOzu2Q1g2dup7mXUh7inW8tj08G+w3mt9rVrW9KGNMMlEnz4KDt69VVPX
	vnISIBzmfJllibn79gbozzezRgQ/JKqQOSyQvldubnFp5QD595t+p6RxnmxbqmaXiG82DfOrQrS
	nuYbdmN1Nxir3ZTScgln1RkVY+RLamT/inYdKjAOYOOq7CoJTLi6VnVmlL8MqkiKvOv3BdeEV+n
	z+sbA99gzV0OSfAtI+BJ6m/YLdSTHJVz8jatSbjFHKgt1EBMZ6akmbQkmCNGMkfXu1/IK3bVAc1
	WTR9w==
X-Received: by 2002:a17:902:ecd0:b0:2dd:ad74:ac2c with SMTP id d9443c01a7336-2e842bd5890mr80732945ad.30.1791795735038;
        Mon, 12 Oct 2026 02:02:15 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e4ebfsm41638795ad.78.2026.10.12.02.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:02:14 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	thenzl@redhat.com,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH v2 3/3] scsi: arcmsr: wrap the type B completion index before using it
Date: Mon, 12 Oct 2026 18:01:48 +0900
Message-ID: <d212c8fcde795a43e070d827d1d9d3fe4fcbe65b.1791792888.git.yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791792888.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791792888.git.yhlee@isslab.korea.ac.kr>
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
index 9519715883b5a..c2c62ad6c6502 100644
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
@@ -3669,7 +3669,7 @@ static int arcmsr_hbaB_polling_ccbdone(struct AdapterControlBlock *acb,
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

