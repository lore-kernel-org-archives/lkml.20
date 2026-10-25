Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792967576;
	b=0DC0vFayK9apQQV4/00idZvtI4vikTCKMsyjz3/IOQK/XsIfIqtm5wnf75u9oBE++fI3
	 nJyqtJ0pJGYm+lm13DxDZv3cQP7cfvTC2Jzgc0c5MZIovhzXeEU0b5simQu6BfQ/S6X4a
	 N4hM71snsKIdKh+FEpNNxOFw1KbpCDTxnlKV1qbj1t74ZO04ekcY6OBF41q8ovDstQRAz
	 1UoA28b37pu6kUmw9ocCRga9iKFADxbgwiUy9sK6WN+IiHMJNA+rRWq3lw9iEw/nUj2v7
	 lBfJ2H2yrr9HjBTNvGRtQj0CO6tu42/ANeMTe54LOnh9sEgdjgnkYSdZNaYYonfwdlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792967576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f0CD2JTVPSKVQ8ahg/uzbIr8a3vhy8fPw66NRM5eXd8=;
	b=lNW8trIag0DArkzS1Lz4YUcC80b7f/qbYzhtB7s4QHxgQiYwFmyBcMWumlqRIW/KfSm2
	 Zhc/ygnNbiXc32UQbfIGzeFT91Pb92IUIOrgZ6w0C047rAbYCbqVXkt0H7p3Ga4b0/DV7
	 yGI4/pC4xY5enGFJBlYuqNoQLEFcy/FIYjIRPa8bN9b2NYPF8F97YWuQ/IBHH7NIhgXxj
	 morPx18FGmQngVewGtgBgdK9RkArfjP3SbKsdklpTdNYe06q+1chRDRYI1CBpEhSHBnJ3
	 UOEBD53AR88qHLAL6NW+Xa8jNLCj2kN1KW0dZU5f6jZL7HimjRFPcXg07rFq9pSxggA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dfDtwcBH;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F66A606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F66A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dfDtwcBH
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1589140eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792967575; x=1793572375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f0CD2JTVPSKVQ8ahg/uzbIr8a3vhy8fPw66NRM5eXd8=;
        b=dfDtwcBHat6xDooPW5SkCB74KG8g9hnfX7NXJxMoZmGNkmPkV1IvA4zCYjlguG420M
         AqANLvUkrUVviRy6TEc2TZ/1a0yP2sV6Q9BR3hr4bT7GFdpva49ZrYNMSuDy8zTnzUVE
         xPel8ucoQ/l2Ku9ze4NRxCb9NSMLa1yLF56H8bjf9XLtlh4fYnZ6rAzm367Lvk/slooh
         pPzjsyuTh3d2mWQdRRPwueZmFRE+ERJwRWN+/Kf9UrWm4qNPqFAIIntoIIu9O3eh4hWx
         7UGE+vqoJGYvX57uym85BqGcZ8aYt28Uo/5SOF2x1C2kcC6iqqt+OfdmIg0EfSsMpNxF
         EeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792967575; x=1793572375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f0CD2JTVPSKVQ8ahg/uzbIr8a3vhy8fPw66NRM5eXd8=;
        b=GNg43zvEBymfeiKmhtshQOVT6L7Tuw/sobK74d9WO0dzvRdm+kqRfiKHtezIeOqdj0
         2SrXNS3PVQKTpTwIGymoB666WQfMkmUBcnohx4YOhsVIzaTkWjOOaJhhQYtsUie9d4Yh
         Ffyr3KISmMhmuL4QSlYWmCX+9sCBImA3yVJAqyrm1JUpnv+XBw+fBIR+Irql8ex0xmy4
         PUuXRbX6SPKbxQBZlmYf5ri891LkRdsbKqTk2+bIktWwemq3lHq8VN6WScCgcibwTYpM
         pSFCFBpEMpaAoXIa7GNe5Wzl3xEITIYXpnRCYidgAXD8YXudMrewzFKQj+PntiRE+ukF
         yxrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxtkOWNEpNSrwRa930AUW8YkVcXGum4+DrBA5iGLI+Z9XUk6z+waiPqgxBL5jZ+LjshCb4kOzQKuRalBmg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY4vYL93Vso+LT1L7wSOIHIKRwZ+UMstK6/H/v2ucmtkfelNCd
	xKlcd8R9soz0JISinbSiqHYp29aRD+Aso62RbEJ5/Bgc4T16CMwB9il9
X-Gm-Gg: AYBFou1iwyfawYBV0JBFczW5HchtLpwI9KHungB08wjQbxOfGyqnX4G0judpyJmF9X1
	Kjes4yKr/2cCjfOORc65RegzsmGeakRlJ9Ar65JOn+FmTgjQSacNwrfxiiqIC1OVZr+OuLa5Lz6
	QpRUT4fnlkzKxoujcnAkZ9XhB0AIQ+KJd8sBOqphJeFPWy5eymjDDzQaTH/y0i87sXmTJE7A+Ph
	vyquHUgZ2P95U/gLYZjm7IEV898QX/GYhgIFDrVuMaHHD6o3GgGmnIQFxGTZ+2bjHt8HiJUCt0r
	7se1Lg68QErrpqKIj+bO2UYHRvIQFgGgrdnXnkag6Ej5WVK9nBx1pOkP4eqkaHzrqJR+AdlkxIB
	77iLU8nvX0REW5nP5SevKHbVi2tLUUUJpNWAKaueMT2TXglHoxdLmAyH1FloTWr4ui0QE/M1wat
	VBaEX0w+9OJw9WyBlOAIOeIo9otQn4E6/s9uljaB4TB8TYwCjBhoZOriMnaWAOmcfMIQKAE2Skh
	C2TE67nGTYF/zx9DvmIVjizZa2HNPxBAXXTkPnYDe4sYNzJESzp9mBmD6AoQjbyZQIPtK3xindo
	1J0FwkQ=
X-Received: by 2002:a05:7300:fb01:b0:351:4a80:d94c with SMTP id 5a478bee46e88-369e862a0d5mr7633319eec.21.1792967574632;
        Sun, 25 Oct 2026 15:32:54 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a026e04a0sm1943471eec.1.2026.10.25.15.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 15:32:54 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org
Cc: ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	andreyknvl@gmail.com,
	catalin.marinas@arm.com,
	vincenzo.frascino@arm.com,
	khalid.aziz@oracle.com,
	odys.yuan@gmail.com,
	sashiko-bot@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] mm/migrate: untag addresses when querying page nodes
Date: Sun, 25 Oct 2026 22:32:26 +0000
Message-ID: <20261025223226.33740-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

When move_pages() is used with nodes == NULL, do_pages_stat_array()
passes each page address directly to vma_lookup(). A valid tagged address
therefore fails the VMA lookup and gets -EFAULT in its status entry,
instead of the node reported for the corresponding untagged address.

The tagged address ABI permits these pointers, and the migration path
already removes their tags. Apply the target mm's untagging rules to
the query path as well, while holding its mmap read lock.

Fixes: 057d3389108e ("mm: untag user pointers passed to memory syscalls")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/r/20260721183257.706661F000E9@smtp.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 7e3a81f06974..994c78782a54 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2461,7 +2461,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 	mmap_read_lock(mm);
 
 	for (i = 0; i < nr_pages; i++) {
-		unsigned long addr = (unsigned long)(*pages);
+		unsigned long addr = (unsigned long)untagged_addr_remote(mm, *pages);
 		struct vm_area_struct *vma;
 		struct folio_walk fw;
 		struct folio *folio;
-- 
2.43.0

