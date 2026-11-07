Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794028847;
	b=itNttxjAgKIxYJ8i9GMScFQGPpEmEMxSs2nT0HDFJgLcPybR8ZIBGXrLRlXzVuA4ej9u
	 Frhl3mRGuPIhc5fuWkNIyf+xaedtU7i9uqcJd/T0Om11nhpfGbRpncXxl28ZjfYTBL7Gh
	 X76p9kjwbO/Dzs5EAaD8rudDywMbieGM9n2k/xD8vpawdNuECynw7t4StRnupd2pM3SdV
	 2XWlbjAsRhB1A4mRCzaSAwcI9VP6jOekP+WhsG4uYhGPVsa6TRWNNNPcFR+EsqIxRHrMw
	 03Sc/6HApzD1YA8Hx5d7PI96+ZZ5UnjXSwXkjZ68/X3x+I873nUy4Bxu60zKFM2O6Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794028847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
	b=kiWncPuUjmyA5uOqgUCJqb+b1TeDX0cYddzxPs3z/g30ycX8VJXRtk3/flkAtUX8t7rd
	 fv4sDCqZrPfij35QMpr3F29PA7deEAJzhI1ZKPbJWciuks3Ia61WKxuBsje+wgo35w88I
	 rt9j27fIb99E/+clcxVwvLNpPnrtJTo1YKKqOLQ13w3u5QfF+7JDTNVjW0O27SgdGO3We
	 mzc7sjecVYv4hotZpmfTZWMMqPDWmQR/YuG3ABtSK8JqDCh0cI4D5z/2CD6UAWYufUHpn
	 pRBSPa6zLnYt4tvS67XO5Qz7ISYwEAclG05TXzwlgZIokkH49yAJhr7oa+izp8QBIQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdBv65Yw;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26851606D807
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 05:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26851606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NdBv65Yw
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-53dda625f63so1075416b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 21:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794028846; x=1794633646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
        b=NdBv65YwE5bvpAEcYqLR7BYHh1iHUsAMeBQavJH2Xy/4T0H6ccBJVot9u4kyOjjjkf
         8eEibxyA3cJHUlKRfltxED6UenL56HW+ArUDRhQjZ1lDOkCSu2la40iJT+A3SftHOMnH
         3qbeo/3Zgj4IAVf90L+e9aPXRcwoHIZJ5bU7re2gAHr1U6waSjoo1py6gWyuezxmryKm
         8OKFxCUW1HHqLV/ZtxwcS84jUmXwdHeRObkCDT1/lOFea++9SH4324u3PWYdoe4dmq0j
         XNA6yAuUygUiKT8pSWr383A4ub6ui42Wa8CoDj8lV3rwfYRAKcDuvza/dVgCI0Zy8QPP
         5ekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794028846; x=1794633646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
        b=1M38qsPInwyx+sXsTqdA4Yn0fkWw+/gae0QsQldKanejFyqfYvRwhxokjNO8KQNFgj
         fmMQRzXVtlFsgOYvBClxHoXtYdiwz/T7wUa+ov6e4e4lxaWgEoMD/7my4eKyGeZrTwkR
         uN7JUvfern52ZS7tDdzK29VSsHYBjoHVv4eGjrqdzvMpXeFuDoDlaG2d4WnDFePfhKS9
         Tv/dabzKCBSYAQD02q8+RPvFCCaE+H+lmJbxgB/IrEtnncHT9D24MWwlqOgSXVItYviN
         Okj9MQR3dd05XguNMasAgp2RwTZttHcW8tDf/CHljTHG8Xyj4P36LbEAzKh30srK9/yu
         WHRQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0tiTcDGyOAZvls4uF03Zc7u3OSjxhDq9aIzBjqpFiBKdwVtrpZ37LN9oU140NjDllOQb1O1Zkq0OBOtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YKtknKT7r/laTPo1NkoPGqBF1UVoG96JImmegcFRXCnI8LLPH
	j0ox848ZvmlHgwFZbrF8JJqNdjgnADqnF0Sa6e+c6J094pGLliwjQu63
X-Gm-Gg: AYBFou2BnDqia/tvbjO7yKAlEUHoJTCPblboUV891m48ypggaqcqh7FsPyuUjRIBgN8
	4tIyuA7/2i6ZGMb9nz82IsuE3yLv0QpIhQ3OgLi0bXx5z53SnTYxLwXpAo+3QeY/0s24Iml5fpe
	Lb9etWLBzBPA0Y0JKv/ZMMtAv/fiqXCJVtpu2hF8vKi8N+JYQgN+MuTzxI6fgQ9mYHQAvZ3G90Q
	0WcTUH1mvIPuLjTj3AtHpwDMIA4IkNA3I/8PzijElnop8qZ8GQ0c58wPD817ptgZuoCk5qzq6Lk
	dqJYPqywOGNH64HYfzl+R5CPHwdbcVzG+aPhnWZeME0I9vLTVHEHvCoM32xf/J0jRIv40BgV6UI
	sRuauMlc5+3NbMKk3m7+2XSSAXOuTKPvkfUJY7Zyalie7GJpSpnDxm5DU6CrUtQ3XjNmp46wUpZ
	57jkQjYR4VpG1pYv97tbFa0GvBw7I5IFgwUpj49Q/Hwj00WIa7NSBLmn5rLkqu3UWLJVuQnRGii
	H0UWutaYFQLXM0DfWzFwGrqR0OeZ3uXGdmnqkZs0zmCPzxD7YUg43EzK69YTLgPyG0cxh91K6zu
	Crx3tCcP4kPGj81h4yKZ0MwywaxVRl4Sodgm0SuxvU2qKdpv/fPXdYceDxBKMw98loWplCKg574
	cbliushE4N5ycpObhCLco7j17BVL5ILU7GrTWzBb++Rw5ty8mXHNTHIXqOuPjy5eCCt0HpoKf3F
	fKcbmG+rgOSeorNX3rijaMYSgAwXfvXsTRq2iC/UC2SbCyM1Tz1fjE7A==
X-Received: by 2002:a05:6808:f13:b0:4c3:4e34:c69e with SMTP id 5614622812f47-567e0fa6011mr3158855b6e.8.1794028846024;
        Fri, 06 Nov 2026 21:20:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567e7ebf4edsm3059846b6e.13.2026.11.06.21.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:20:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 06 Nov 2026 22:20:41 -0700
Subject: [PATCH 3/3] mtdchar: keep OOB chunks aligned with their data pages
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
Message-Id: <20261106-submit-mtdchar-page-chunking-v1-v1-3-2973a03531bc@gmail.com>
References: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
In-Reply-To: <20261106-submit-mtdchar-page-chunking-v1-v1-0-2973a03531bc@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 =?utf-8?q?Micha=C5=82_K=C4=99pie=C5=84?= <kernel@kempniu.pl>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

MEMREAD and MEMWRITE advance the flash address by the data bytes
transferred. OOB-only operations transfer no data, so another buffer-sized
chunk starts at the same address and repeats pages.

Advance OOB-only requests by the number of pages transferred. Round
non-final OOB chunks down to whole pages so the next call starts at the
next page, rather than repeating a partially consumed page. Allow the
buffer to hold at least one page of OOB and reject requests when the
selected mode has no OOB capacity.

When OOB is the limiting buffer, also cap the data chunk to those same
pages. Otherwise a combined request can exhaust its data before all OOB
has been transferred.

Fixes: 6420ac0af95d ("mtdchar: prevent unbounded allocation in MEMWRITE ioctl")
Fixes: 095bb6e44eb1 ("mtdchar: add MEMREAD ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdchar.c | 53 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 47 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/mtdchar.c b/drivers/mtd/mtdchar.c
index 189e462a9df0..85e98905f732 100644
--- a/drivers/mtd/mtdchar.c
+++ b/drivers/mtd/mtdchar.c
@@ -589,6 +589,30 @@ static void adjust_oob_length(struct mtd_info *mtd, uint64_t start,
 	ops->ooblen = min_t(u64, ops->ooblen, pages * oob_per_page);
 }
 
+static int mtdchar_adjust_io_lengths(struct mtd_info *mtd, uint64_t start,
+				     struct mtd_oob_ops *ops, uint64_t remaining_oob)
+{
+	u32 oob_per_page = mtd_oobavail(mtd, ops);
+	u64 len;
+
+	if (!ops->ooblen)
+		return 0;
+	if (!oob_per_page)
+		return -EINVAL;
+
+	if (ops->ooblen < remaining_oob) {
+		/* Keep a page's OOB together when another chunk follows. */
+		ops->ooblen = rounddown(ops->ooblen, oob_per_page);
+		if (ops->len) {
+			len = (u64)(ops->ooblen / oob_per_page) * mtd->writesize;
+			len -= mtd_mod_by_ws(start, mtd);
+			ops->len = min_t(u64, ops->len, len);
+		}
+	}
+
+	return 0;
+}
+
 static noinline_for_stack int
 mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 {
@@ -628,7 +652,8 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 			return -ENOMEM;
 	}
 
-	oobbuf_len = min_t(size_t, req.ooblen, mtd->erasesize);
+	oobbuf_len = min_t(size_t, req.ooblen,
+			   max(mtd->erasesize, mtd->oobsize));
 	if (oobbuf_len > 0) {
 		oobbuf = kvmalloc(oobbuf_len, GFP_KERNEL);
 		if (!oobbuf) {
@@ -648,13 +673,17 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 
 		/*
 		 * Shorten non-page-aligned, eraseblock-sized writes so that
-		 * the write ends on an eraseblock boundary.  This is necessary
+		 * the write ends on a page boundary.  This is necessary
 		 * for adjust_oob_length() to properly handle non-page-aligned
 		 * writes.
 		 */
 		if (ops.len == mtd->erasesize)
 			ops.len -= mtd_mod_by_ws(req.start + ops.len, mtd);
 
+		ret = mtdchar_adjust_io_lengths(mtd, req.start, &ops, req.ooblen);
+		if (ret)
+			break;
+
 		/*
 		 * For writes which are not OOB-only, adjust the amount of OOB
 		 * data written according to the number of data pages written.
@@ -674,7 +703,11 @@ mtdchar_write_ioctl(struct mtd_info *mtd, struct mtd_write_req __user *argp)
 		if (ret)
 			break;
 
-		req.start += ops.retlen;
+		if (usr_data)
+			req.start += ops.retlen;
+		else
+			req.start += (u64)(ops.oobretlen / mtd_oobavail(mtd, &ops)) *
+				     mtd->writesize;
 		req.len -= ops.retlen;
 		usr_data += ops.retlen;
 
@@ -739,7 +772,8 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		}
 	}
 
-	oobbuf_len = min_t(size_t, req.ooblen, mtd->erasesize);
+	oobbuf_len = min_t(size_t, req.ooblen,
+			   max(mtd->erasesize, mtd->oobsize));
 	if (oobbuf_len > 0) {
 		oobbuf = kvmalloc(oobbuf_len, GFP_KERNEL);
 		if (!oobbuf) {
@@ -761,7 +795,7 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 
 		/*
 		 * Shorten non-page-aligned, eraseblock-sized reads so that the
-		 * read ends on an eraseblock boundary.  This is necessary in
+		 * read ends on a page boundary.  This is necessary in
 		 * order to prevent OOB data for some pages from being
 		 * duplicated in the output of non-page-aligned reads requiring
 		 * multiple mtd_read_oob() calls to be completed.
@@ -769,6 +803,9 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 		if (ops.len == mtd->erasesize)
 			ops.len -= mtd_mod_by_ws(req.start + ops.len, mtd);
 
+		ret = mtdchar_adjust_io_lengths(mtd, req.start, &ops, req.ooblen);
+		if (ret)
+			break;
 		if (ops.len < req.len)
 			adjust_oob_length(mtd, req.start, &ops);
 
@@ -789,7 +826,11 @@ mtdchar_read_ioctl(struct mtd_info *mtd, struct mtd_read_req __user *argp)
 			break;
 		}
 
-		req.start += ops.retlen;
+		if (usr_data)
+			req.start += ops.retlen;
+		else
+			req.start += (u64)(ops.oobretlen / mtd_oobavail(mtd, &ops)) *
+				     mtd->writesize;
 		req.len -= ops.retlen;
 		usr_data += ops.retlen;
 

-- 
2.53.0

