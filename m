Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794181792;
	b=ttynT1k9jogtt7AkY3WXK3krdl1FDAZR4o3JZncMYKayXm8aVV/lha+/bAruvue5+img
	 DXQNpSDGvL8Ngt6nTY/bIeTfoHfIWN3U3idcA18x3aaBCkYRiE2OMaD/KGlfbr4b/JCfL
	 m2TvLQi9DvH6NNwja1jVSnTN2s8RlCW0XBgeCyTrs+sbOkYH07x2+xEjessCIByIQVCPc
	 IKxz+o7KYWOSr+pb9DCzX3LrXf6oDTdRcqYmssBLpzFgH9rWLHbtcCZA8HXbBc0gvgQnF
	 qT3anH5voQLaslAErqijr5V8c+XjACR30/gC+KvabylphjTkmk20fKf6De8XLhzahRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794181792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
	b=boaHuCM0RrcCFsAJQbIxUB1ZSrTsP1ybQ1mA3eIO49Rr/ZQ2d7KmwGuRhsCThT1I5+Vu
	 4LCq2mn4IoIRak37hqPG22Dx6jEhaNba88dR8qtqBgPRCqsyTki+nGyPK7egRO/4cmzpV
	 +HKs+hmLweW3WUo40wUoPr45TszwERU2YTegNabdkTZnUWMXcakeBOvfu5Z0j6fkx4aE6
	 Le9wLK/amWQpQORKZdx/VhDHqWkw2WC49yNDO6YUBZoj28LJnHMCAtnIXSo2rfVOcVFSe
	 sE9eiW8L4oRSygHLSahVSADM0drvHh8Z5SVgSKoivsaNZ/rgXz0Lis2h5xJCqq1+g1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wuWN4VLt;
	arc=none smtp.remote-ip=209.85.167.170
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AC4606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 23:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0AC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wuWN4VLt
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-55e0090c580so113026b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 15:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794181788; x=1794786588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
        b=wuWN4VLtBvxp7KFKzhSQZX8X2vptRXmHNBjyd8ECRmgHFlyM08P9oyyVqfWxlJ/9s4
         3xdS/NSI25rWZJO8xP4YoAVYGN5mWRSPaKJytX3sHp4qMnCH7/20mJpI9OL/VJ3R2aZM
         hvbMdLPUhmfSR8iOftWUBcGk+opXpVz9Al86yWN1TlcA42/x+YbeyhNG5ouTKyyWQHcl
         ijRuPo6TpR2MR9uwOJhD2DT0BdX6n48Qtz0wx3jCLY1WWukQJdPW3fhMfUhvDZAgRqh/
         ZoXwRv9PlOOZJ7be0yeTAyGKJC8+D3ko0FN6Ufv5fvbHIZgYWcvUabwtnlgeUx53NUy1
         kFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794181788; x=1794786588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mapGuynXXw7KDW6DKyURQpWmkV/D5C6EmEzFKbFPSPE=;
        b=1QdmEMVSSs9le2Nz9T7alG6QCVQGFNYMh4w4rZ469ePNbCmzygAuDYwT5uejGlSB5R
         iDHycn6AoRuj3wRjHweblh/ws8eJcgTVcosyY7ABGRqtNUGlnNWG5ZNBHSFGI4rjONvl
         GnRSU4EXaxL/B3AVS/wl183y9s3D9cloQ2h1qDxH+MstiMhAraMqOYScVjulC5p5Xyxo
         /H7eTBMvCTwBd9JKl82+HyWblw3HOXN+V64C8IPjBjDPRVt4iJFTKUz36uhfJOjGJHRg
         1o2zF4ylD2ENeqyOmBp1IMMYlRaFD4042Qc1jLtdMH9NIHCj+wXgirye8Wia2uPDzf4c
         VesA==
X-Forwarded-Encrypted: i=1; AL+hErGUmpSQ6wF/+LmXqNBNALhSyrhKt2fwrzgbAtGkrEbqizKoKTptDLRffZcqofzs4yXbTEiXYeqG50HCplo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/w5wA2fLycH3gW0qBBmdKAtMRExKv2DqCaFZIcvVLa7ZeTdSRa
	Scr4zykDwFG65XDoHUHwx54yy65WzcziT3Wc2or+j/k2+z43hWMHsy+WN/Tm7w==
X-Gm-Gg: AYBFou2zcML7HxHHUI49x9KZDX7FN1h0zqf8XF1uwrid82myJdCpx30oJjdZkkKnInx
	yS9XQe9g6WSR8wwA1Fr8MU52NqAN0lwsbsT96kd/DrqgFYNKg25ydR6pwyYfsFlRjl1wpRhfSl5
	f0sNbn3jGoVH78QsOWBxEJxNXOv0mn2OwpB4l7wvVfl8dXFpkZui9dNS1tcY5QB+EQ4NWFKV9Ns
	LuTwL0TFV22Ybihv3gY1BBAe2+j7iv1MkTi6/xN0Zk3ldfXvzs7osSNb0272Ry1c4/MqLTfLODB
	riSkbi7hazMaz8W+IdEuYKvYt6CmXjcyUKW4zeaDFBgNRruSVpYQXF1vLdAU3Le2VXdipLt+VIa
	tjJSlkwE6YhmZRY6bbzbi20zesBx3u1KFpn+KKqaUtpUiWvD1pKzUgnGc0GjIdEeEEjV0odrGXj
	ok+g5pjSPGPQvbdJU6bD+Dy/mGd0MlTMxgWtnd9ZKkMazTwKPvGslA/IFT0giSbqkFm49pX9qqC
	fOVXbw0cPO1rNmEHw3ZKPorheb7b3RcU2Fm97y0Nga5q+ISFpmblhWADnTkRTylHwcSnEIfU8HO
	z748Qpu7FVUaoyO8bwXBOu4h6piJ8r8whQwYNFcu+vUThaQfytm70kf1eT52/uEx2vNMa/7aU1v
	xZlHW8C15N+vMD2LrTItMyIsHq6kG+kiD4rJ4LRegHjgxgdymDL92NTW5O88ivUTYXDs3wMNlJO
	Ul3T/7APmQpYtsGJQZldFkhdtmEDQHutFnrH4oIMHoxh0D8FxCAaA=
X-Received: by 2002:a05:6808:bd1:b0:4f7:f874:8cba with SMTP id 5614622812f47-56814714267mr1383882b6e.48.1794181787763;
        Sun, 08 Nov 2026 15:49:47 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac6352sm3019435b6e.1.2026.11.08.15.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 15:49:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 16:49:14 -0700
Subject: [PATCH v2 3/4] mtdchar: keep OOB chunks aligned with their data
 pages
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
Message-Id: <20261108-submit-mtdchar-page-chunking-v1-v2-3-838cf8934ba6@gmail.com>
References: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
In-Reply-To: <20261108-submit-mtdchar-page-chunking-v1-v2-0-838cf8934ba6@gmail.com>
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

