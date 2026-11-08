Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181790;
	b=GSylIoWhHTw3G/vUcs1feE+Aqfczfuh8OWXkSUsuHanuvxVW0LRB0v0ZG8YW0shqp26x
	 0KDHL8j9M1ay3gKvc26Egu9ETsfbqsy9SO3n2xCFGecEaGdBYziB0sStxeD8dClWavFMw
	 Z0QLxFqNZtKA5x50ukIPAfgrfZfBMXe+6PrgiFE7IoknG+RnWydwczAHvFWy0gokBfkSe
	 8A5FCLt8oUo5mTnBQXqxwmH6NRZ4rouWV2A/iOe974Hqij5YfR7sq9/g1R5c48o4OAUuV
	 kwz3zDOYErfMT5uXuh0x7QSNIReXSxyTXJ0S4HC1BKYQjg0pFC97R04E3PMP8LeIBqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=g2nfNoHKtlD4mhlL1Yw0iPJLjruMz9pBLydXH0Gv9Rg=;
	b=sgq7dAYrBqizC6HFNZK7k6VFMr3HiKqa3sO3/rusrSLQCS9zJ1I7dDEBVzXp+EaD5rtN
	 l/MCKJzzbIp8FFFosHToeTnO3dtWVYn/beBWP9jkcLBTPgg6tT1Xni4GeZHJIzdEcE2QS
	 SCcON5+L4rINvd8rvGbq8fJDEVB3w4P/NE2Id7UXThqSUZTug8yc7xRediiWJMaYV2ALp
	 mTNY9MgYhLh9syeOyR73sIG/SO+Q0BrV1DoihGxzd5Yv9lKdQCUDT83Q65rM5DHeVxg9U
	 wF0rY5UqJtb3Ah3OKUSa0FzLkk/2YYmMvYERUlQCVLH4JbOuZsfisGX4oLSANn2eqJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiTM0hsu;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8E5606A330
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B8E5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UiTM0hsu
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4ed6d69bdfaso164928b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181789; x=1794786589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g2nfNoHKtlD4mhlL1Yw0iPJLjruMz9pBLydXH0Gv9Rg=;
        b=UiTM0hsulXcCxCo6asD3MHWcaqFz0any3chKiSrpCnK9k1VaFW6O9BeYEeksbGA6Aw
         lb6yAONV1yRzRDwcdWb9DpIjMgCIbA1svI5Hhcyk6xBqj2fNVOzlhQvg8Wb3utCtsVN/
         QBwXByMLZhdPb8yxxHReefMLa7tqzlduhZcM34TyBzGRe2Sr+zCWdppi83txZmkx28Ic
         cOELcV+jVkUr3iNkhLxUUd0WKzW2ySUkbERTFJB3Vn2WKPtnludyHI+A0l9iXpo33QE8
         q0Hvor09q23MFjwbHykOjvoQtHTf7bfWp4Nb+qE9A/GeO1EYiGdUV/+UlVhbxHgQ35vl
         gW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181789; x=1794786589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2nfNoHKtlD4mhlL1Yw0iPJLjruMz9pBLydXH0Gv9Rg=;
        b=Ikja7//gbZc+OLBjfMAgO8gR/7phoA+Br+STa4UpVynEWSmrdbN9aotPVHwtTfIl/L
         dwAQ5JSioV2vMukPmXNCcytj17wHlMxQNvwyDudEdqCIN41PSqLB9Kvv7jrGfKfaDjFH
         VtqwcCAgqbI5BCx8Uqkjwcs/pnwF+ia02D81d8jbVZ0/goRtGEjG2NLfTeuFpFyprd5k
         FFHn9arYYM00pJVtjagLXjyKuHiAWlDQZkS4vr7woQWA1GGZl9aLCT8IiLKuYwujJWIp
         hBvbKT2xUTtpWd78L/jo9G4C1mK3sdtKXyjmfxU4yekkoZI4ArgxDgM3zhSiM9cgY8ye
         veNw==
X-Forwarded-Encrypted: i=1; AL+hErFbsn6ZHoI/He2qip94xlSHBIIytiCa2/0FzeVhW6NTKzUVnAMhSY6ahINRUArZHFh2bFhOBTXYlhve19w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QOfX8sJdnTdvzFtLG42IMVKoSegpEvuI5qzraqmELbqKyHtk5
	0kS4Pp1Wkt37Op4MtslAFyi4rqcqcy9yGs5kIqwaY4GYvieGOgGZwDTaMA/K/g==
X-Gm-Gg: AYBFou2yW49CJsFP24EbL51hmr0Au15fyMdPYuK+0zYk8lSarCSg8t/G5C50A0z9Voa
	UH7KLG9SRqurKx0MU8gWJyXtwhZqECo9hXHyhhZXW4QO56BHzpdS0q9tZvG0F0rHMGUnFWYB11s
	ijrq963U8TEUQEng9f5DfsiGpqSIeMz6lavCD5QqjWvD7j2F9vu1IMrGsghkIhju4otPoPASzog
	2ZL5jktifNWpFeJMGNYA9F8064cZ0G07Whmoxoh1VnGCRxtWJSbIgS5jQ6/U0ha36jQtGjfEPan
	He50nRO5Ww2fTnTHg1Rul9TXsiIJwyXdP2VDaexxDLXvUpECmiHa/ZzZKZ6/ZH7y8LwhcSuog3P
	NoC4auNjs1mk42bRtfgjnpuLLX8ZbJJ6Nel72qpf5r0N3zSDPngDR+VUK9r0pyBOXHvWBZKoxU6
	c2w7jgKn4NRecUlOdfnXJXO7mcX4dHh0wCxfo3cTA5/CNZ2BaTuHHHKkz+gxX++hs0vNX7uW84w
	BKJ2GnDnCQRkarND7RdAkUh95U0U7AdGtdYgq9JJj+t4YVjbi0de6vDDzTY8CF8YsRQbL3IRmH3
	44E+VbB8OS/ARRzh7PMr20bhJHeNA8C+24CTo+h9HzMt4X0FuU9fmYun7RjNlD8n+ev0xTdKHuu
	yJ3LQgEk9QjxEWTI+7N/44TsPoj7S6HTwiWH4Z9k0PKyL4CsPDzwUoGm9zHllXeDltWhpmSby28
	adrkvSwDEsyEKAz3jL150uEJJV9xTKxec2JeWVkmcs30s0Y4y57iNU
X-Received: by 2002:a05:6808:3096:b0:4bb:ac05:9ebf with SMTP id 5614622812f47-5681431e1dfmr2132113b6e.14.1794181789040;
        Sun, 08 Nov 2026 15:49:49 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:49:15 -0700
Subject: [PATCH v2 4/4] mtdchar: finish OOB transfers after the data runs
 out
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
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-4-838cf8934ba6@gmail.com>
References: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
In-Reply-To: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

A combined request can consume all of its data while OOB still needs
another buffer-sized chunk. The ioctl loop then stops because the user
data pointer remains non-NULL. MEMREAD reports a short OOB count and
MEMWRITE can return success without programming the remaining OOB.

Continue until both streams are exhausted. Limit combined operations to
the pages covered by their data and pass a NULL data buffer for the
remaining OOB-only operations. Advance past the pages visited by either
stream, including a final partial data page. Limit OOB-only writes to one
page, as required by the raw NAND write interface.

Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 41 +++++++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 85e98905f732..cbbc258109f5 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -613,6 +613,20 @@ static int mtdchar_adjust_io_lengths(struct mtd_info *mtd, uint64_t start,
 	return 0;
 }
 
+static u64 mtdchar_next_offset(struct mtd_info *mtd, u64 start,
+			       struct mtd_oob_ops *ops)
+{
+	u64 next = start + ops->retlen;
+	u64 pages;
+
+	if (!ops->oobretlen)
+		return next;
+
+	pages = DIV_ROUND_UP_ULL(ops->oobretlen, mtd_oobavail(mtd, ops));
+	return max(next, start - mtd_mod_by_ws(start, mtd) +
+		   pages * mtd->writesize);
+}
+
 static noinline_for_stack int
 mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 {
@@ -662,12 +676,12 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 		}
 	}
 
-	while (req.len > 0 || (!usr_data && req.ooblen > 0)) {
+	while (req.len > 0 || req.ooblen > 0) {
 		struct mtd_oob_ops ops = {
 			.mode = req.mode,
 			.len = min_t(size_t, req.len, datbuf_len),
 			.ooblen = min_t(size_t, req.ooblen, oobbuf_len),
-			.datbuf = datbuf,
+			.datbuf = req.len ? datbuf : NULL,
 			.oobbuf = oobbuf,
 		};
 
@@ -684,6 +698,10 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 		if (ret)
 			break;
 
+		/* Raw NAND accepts only one page per OOB-only write. */
+		if (!ops.len)
+			ops.ooblen = min_t(size_t, ops.ooblen, mtd_oobavail(mtd, &ops));
+
 		/*
 		 * For writes which are not OOB-only, adjust the amount of OOB
 		 * data written according to the number of data pages written.
@@ -703,11 +721,7 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 		if (ret)
 			break;
 
-		if (usr_data)
-			req.start += ops.retlen;
-		else
-			req.start += (u64)(ops.oobretlen / mtd_oobavail(mtd, &ops)) *
-				     mtd->writesize;
+		req.start = mtdchar_next_offset(mtd, req.start, &ops);
 		req.len -= ops.retlen;
 		usr_data += ops.retlen;
 
@@ -782,13 +796,13 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		}
 	}
 
-	while (req.len > 0 || (!usr_data && req.ooblen > 0)) {
+	while (req.len > 0 || req.ooblen > 0) {
 		struct mtd_req_stats stats;
 		struct mtd_oob_ops ops = {
 			.mode = req.mode,
 			.len = min_t(size_t, req.len, datbuf_len),
 			.ooblen = min_t(size_t, req.ooblen, oobbuf_len),
-			.datbuf = datbuf,
+			.datbuf = req.len ? datbuf : NULL,
 			.oobbuf = oobbuf,
 			.stats = &stats,
 		};
@@ -806,8 +820,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		ret = mtdchar_adjust_io_lengths(mtd, req.start, &ops, req.ooblen);
 		if (ret)
 			break;
-		if (ops.len < req.len)
-			adjust_oob_length(mtd, req.start, &ops);
+		adjust_oob_length(mtd, req.start, &ops);
 
 		ret = mtd_read_oob(mtd, (loff_t)req.start, &ops);
 
@@ -826,11 +839,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 			break;
 		}
 
-		if (usr_data)
-			req.start += ops.retlen;
-		else
-			req.start += (u64)(ops.oobretlen / mtd_oobavail(mtd, &ops)) *
-				     mtd->writesize;
+		req.start = mtdchar_next_offset(mtd, req.start, &ops);
 		req.len -= ops.retlen;
 		usr_data += ops.retlen;
 

-- 
2.53.0

