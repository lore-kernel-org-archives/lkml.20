Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5376237EFF1
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792035318; cv=none; b=NxABeO3XdjPuIoQ0iuaNjD5b45298roLnTyo2GOX+LTvPZFkO4CkRxImYn9nXmeKBd7bLxxZD8KiVHqWeAOasyYuxl0jEEJoPVczNuztGybCQYu4l3e1qPWdtMwwLCv/Jl3TNewbAuhfNv/2jJdo1DLy4HNA2unLaTZEs311k0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792035318; c=relaxed/simple;
	bh=w+sv6HzCDt2siaTQzxT+ALfMq9a1wr2zBRTinsSzzLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qj+BrNPgGJTPr6/v6ORWk6GdAaSJ7a5TNkBN8gS17C7TlW/6HqibVtTFVtlKL6QK/3/jJV4G8lgjUPkrHQF4d742pnAtwKDMQa+YIZ3hlLAZmePmg1Xzr21QPa8OlgOhAO1Tlwf1d22Xww4qRIUCQSFeAtmZDQqCXpaMJfDWufI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=i5XslI35; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=csysqpOV; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="i5XslI35";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="csysqpOV"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F2ZL9m152204
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=5wEs
	nZ5AZ6fgmP1dz1ZUFuPxnbJ/U9ke/+Fexp+nbXY=; b=i5XslI35pX+u4RO+NH0Q
	M/saAxZCph4aKwn1hEiK5MH/FylnSMA6/4ER5fG07V0/vkytBdhyhdrCpeJH2dJo
	9SG3/8+EBlrFmuMv8/SEf+RCTbEMxcSyit8rO5gpGABX4gzrFFlardNdlyf+EZl5
	JbjqSFqhtsUnzfQyI9Lln1ZB+ByMpmLKQJsEAT29VYs8ByOAmW2xgEiXX+Zsoubw
	GnYNOWUR2GSGvH1x4PLe/+FWhhYb6ohr0vzmGLc+4Q/HKo76UBoLzKeVmLmOZpTd
	++qmU5YSRIeBgK6Z9VyKm7U8NaebWBVGrPDRvqWEyMUn7aiwxm2SVt8cB56mfxMe
	cg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4hah8esv27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:35:15 -0400 (EDT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9197553d398so22827046d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792035315; x=1792640115; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wEsnZ5AZ6fgmP1dz1ZUFuPxnbJ/U9ke/+Fexp+nbXY=;
        b=csysqpOVvpC5BtjjMzR3dZjoTP5DfzTsrHi1Z+wtlzhvG/jY05nqWrEObJiGfCQmI5
         ltuYomBPHIP36rQu4G8ham7PmHC7QuRPE+j11He+PbMYHLo2B1riqs7TA8QuVPQpudec
         8lAmM1hv6BFE16J5Gj3c2UmX8MvrOSq8Xf6fP8eYgaAKMPVHkDi4kAW7zGJRoeM1udUM
         T3gKIDJGGDN5aW1ZKgiCGj0Uis85bBOpe1OZ3zpJ2Q8dJW05lWj7KkbUiy+TM1d1YS4w
         ziebeK+OTHdZtFEh8J+QuOZKiSmhXjYxUH53D69MGIx8lQAq1XmZXbQDps5Z5D47bM3p
         GUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792035315; x=1792640115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wEsnZ5AZ6fgmP1dz1ZUFuPxnbJ/U9ke/+Fexp+nbXY=;
        b=efOyKMg98eL+Hp2ysqUiTqugOy7jP9cgmUqx3NHviJJTZvBJpaPgIgPrgFym7fsKna
         KjbcMy/skHEgf2JeWPreMQ7pgvDObpjx0cRWRZ/r7a3LkPY4+L3H3PeSHFVfYnobIH7j
         dHDzFAC0qucEeL8y0wgKx4eSOGU73AjK2K+nefYuEOFEqfJZFDgND6j+GekD9IegWiDh
         DOzUfwtpzYqQrXRuXS8M6vzH0IB4Ki0tAR/f1gz0DcPoA6mMkkOhrxMT8ajrWdOM8bZg
         rXbO/Ea96MhcM5sKXJttDVFj5JxFfcPWfzyR4NOTpE/7FoAMhlFXgPBe7omrUx7m25Cw
         uTcA==
X-Forwarded-Encrypted: i=1; AKwUvBxs8VGeEdRGH6qnbM2xX3DmTyld3SLmLRpVOvLMf8I/YE+WbNnUcyZ4c8UHa+MFI4iIyPlKXnLxlt4++Ok=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKzp4gegrWVCq7bEALsOxWwtu8ngaX+q/Tu+Ya91o68Ly/IHiF
	mMf9ycbZe+XHlE/TJHbS3cLifF8wAXD7E1iCLYukHDaM/6JA6tUiNOHPtEQ/FvQw4FZHmMRXBi1
	WV75ZwSGKibK6YBGKwDj2EDKA18lDmVB3jMmfwEeFjiPf/RfNeDBBUJkp8tDAYA==
X-Gm-Gg: AYBFou3/t9QyfiI123w9e1ySti/7N5eGWCQdn+vKQLTy2Zr/+ZWkjjGlUR44k2B1q5/
	hnOC9fPXWlRkQQQSwyV5GQ82Xd3gFBZ+GF5SSFaVLq/nI2wdGQGhj0+hlfaJ6J3c1xP13gSIuBw
	YAD6kIPoeQVVjE7HzsrUE3IpIJAEGv0ZocvMnsOfySxdAyyMe42tJzERvmf8W+0lfy6/mG5IKhv
	p7Bu6m2Tg1UDoq27xDmZy6TnwTyiBAU9EJM7XYbm2Vm9ciE7fZih/MtG73TRXLeeAWxx32WdeUF
	G/dNsOol97vEiSOrtkyPYnR1O0B0X2bC0wdujS6RqTla4wJVs9rTD/1J+3hYzqSHddsbtWJRS1V
	RxDn3q4S3pMy4ezSCrtj5ot7Qd8T94dM6YeKCMsE0MkuP
X-Received: by 2002:ad4:594b:0:b0:912:2d72:c08 with SMTP id 6a1803df08f44-91b554f5ec4mr309505406d6.13.1792035315472;
        Wed, 14 Oct 2026 20:35:15 -0700 (PDT)
X-Received: by 2002:ad4:594b:0:b0:912:2d72:c08 with SMTP id 6a1803df08f44-91b554f5ec4mr309505266d6.13.1792035315084;
        Wed, 14 Oct 2026 20:35:15 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b383dasm70645846d6.8.2026.10.14.20.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:35:14 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Wed, 14 Oct 2026 23:34:56 -0400
Subject: [PATCH 3/3] mtd: block2mtd: convert _block2mtd_erase() to folios
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-block2mtd-folio-v1-3-19d24ae676ee@columbia.edu>
References: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
In-Reply-To: <20261014-block2mtd-folio-v1-0-19d24ae676ee@columbia.edu>
To: Joern Engel <joern@lazybastard.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792035311; l=2291;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=w+sv6HzCDt2siaTQzxT+ALfMq9a1wr2zBRTinsSzzLo=;
 b=uTALCie/DfGenDNM1iizTq1GvPwsMazfazwkjLE6MfFgAYOyt44pbfWlvlxmpcDbWa4W6aI6E
 1JB0UtML5xyDm/LaxOcf6/QwzPA3GO/DDplRPZmNUb4aUEVzXRcwbs/
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-GUID: W-45lM6YyNv_yLW5qbs7G5BPzuDM0M-g
X-Proofpoint-ORIG-GUID: W-45lM6YyNv_yLW5qbs7G5BPzuDM0M-g
X-Authority-Analysis: v=2.4 cv=Ob8NnRTY c=1 sm=1 tr=0 ts=6ad049f4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=0LsfiDYzd38Z0ysWLZ4A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX/fOL/RbEZQU5
 ZgvfCoRuACWCQ09cs2MxPh95zF04lllSXIdHzLf9s7+ZJY/mn9EAnE2f+i3famE1NQDZb0m4q8C
 j6zSumoGXp0XFlPLSqEL6IKdsqBQP1nFAsv6b/ewuzXm55y0URI/
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAxNCBTYWx0ZWRfX49RXiCL6DBk7
 8oJfaFEkq8LI2qdkJ3T1bAvF8YKwXRJ22Hw4mEPfWmoucEgzwR1IFKKswGB/5fIaH1CW1GWgH3l
 Cb7odtDNbrp44fi5VeeuhyvkaRwKp4h83bZqvy8vlsgpyIXj579qPFvZReLvKL6CYsbuw6l8BzV
 12ZqeH7zig9Gi4gatgrYClMOamytebA73SrBixWa8Tsb8wYutJIm3/83VgAYh/6eAA+Yjd7Y4M1
 u7z8BmKaac2vN5SxCxeh+uo5sAyVfrlihB4I/9HmKSibGRk5QxkjTfwdAU/BJofSd9oGgd4TgTf
 WT1tkJzdmcAz0r2XlQgvb8/Tfm/IJ1RUzSBYqnt4i7aAf3UL+7QN5dTwU14+b/Xw2qKnTq5y+/r
 hCJnOQMoCJQAKtkmPuQfWKflBX3h/LsL/pDyTF5uiDQMzE/1nQtO7A4zFi53ULoWpEUxN/wgTWc
 plSGAOreDuGe1jlHLBg==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=10 spamscore=0 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150014

Erase through a folio instead of a page, and use memchr_inv() to check
whether a range still needs erasing instead of the open-coded scan.
This removes four hidden compound_head() calls per page, and the last
user of page_read(), so remove that too.

Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 drivers/mtd/devices/block2mtd.c | 51 ++++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 29 deletions(-)

diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
index 910669d6bb94..a1d24fef415d 100644
--- a/drivers/mtd/devices/block2mtd.c
+++ b/drivers/mtd/devices/block2mtd.c
@@ -47,40 +47,33 @@ struct block2mtd_dev {
 static LIST_HEAD(blkmtd_device_list);
 
 
-static struct page *page_read(struct address_space *mapping, pgoff_t index)
-{
-	return read_mapping_page(mapping, index, NULL);
-}
-
 /* erase a specified part of the device */
 static int _block2mtd_erase(struct block2mtd_dev *dev, loff_t to, size_t len)
 {
 	struct address_space *mapping = dev->bdev_file->f_mapping;
-	struct page *page;
-	pgoff_t index = to >> PAGE_SHIFT;	// page index
-	int pages = len >> PAGE_SHIFT;
-	u_long *p;
-	u_long *max;
-
-	while (pages) {
-		page = page_read(mapping, index);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
-
-		max = page_address(page) + PAGE_SIZE;
-		for (p=page_address(page); p<max; p++)
-			if (*p != -1UL) {
-				lock_page(page);
-				memset(page_address(page), 0xff, PAGE_SIZE);
-				set_page_dirty(page);
-				unlock_page(page);
-				balance_dirty_pages_ratelimited(mapping);
-				break;
-			}
+	struct folio *folio;
+	size_t offset, chunk;
+	void *p;
+
+	while (len) {
+		folio = read_mapping_folio(mapping, to >> PAGE_SHIFT, NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
+
+		offset = offset_in_folio(folio, to);
+		chunk = min(len, folio_size(folio) - offset);
+		p = folio_address(folio) + offset;
+		if (memchr_inv(p, 0xff, chunk)) {
+			folio_lock(folio);
+			memset(p, 0xff, chunk);
+			folio_mark_dirty(folio);
+			folio_unlock(folio);
+			balance_dirty_pages_ratelimited(mapping);
+		}
+		folio_put(folio);
 
-		put_page(page);
-		pages--;
-		index++;
+		to += chunk;
+		len -= chunk;
 	}
 	return 0;
 }

-- 
2.39.5

