Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643653B42C3
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789429213; cv=none; b=fJ0Fza2UVmmOs1K/4eW54vibmwwlzz/dbFNOZu2jbEukknbA4a5BsVtM1wdRN3fZ5bAw7M4zPCuPDnb0qbIHkRaazG8/rnNvcb1ogTuUn8dM/xz8PVeVu5mK8L5E+Rd07pW52d/mbv4YxqC6az1kG6BdUcb4UCIsdbWqZEBhnMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789429213; c=relaxed/simple;
	bh=qy7ZBQ3XzWiyLT6IhGtwn66uVeBQnzl1JKqYjhWIOOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rmfBU0u5STm3ZmINXCFOm/pZRwcx7JngBS3g7Y7HwZjmrcIPKEbi9bPh5BgTGk0jdaoD12+wguYhtAiPKGoaA+in5qiSJ30CYW26ZaQgQXGKPTINgdklqAXlticN0jYtpKyYUtM5JM9zUZhP8rhebh9hP6haM06pamlVdnoYAV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=e9XHJQBR; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="e9XHJQBR"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6714af30a2cso1830693d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1789429210; x=1790034010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jGnVp+Wdcppn1hNzh9JEPOuRz9gaVRAoKUqUMG8quKI=;
        b=e9XHJQBRBfysZsqw3anMou650KdRkS/rOeLzlkRtu673X8FH3I8EUgYAQjoOPYrU1E
         oJIHYg/iHPiUSohw1pw1dihgUUhCiMPKRrP+VJR6Gle4P3aHWybi+fvBhmJZ4bbrjU8k
         8JSj6UVUgVUJQDZeD/m88XJyeME1BuNFKjSP+AxZu02D6qxqnAfUWXvplHFmUimWZWQ8
         +384Xuph0kN4PhcGIjMojd0CI0xaatb8AYnX42+xFda1JTUde6aR/ROun0lQJNVBVHXX
         smEyyB+FDZ9Oaq5+wT6aMAo8d++Fe8u439H2AL4dXPSlJ8j1Q5ZUTMmHYsKcI3CFfM8H
         4lmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789429210; x=1790034010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jGnVp+Wdcppn1hNzh9JEPOuRz9gaVRAoKUqUMG8quKI=;
        b=cD9eh2ArLyLFRbdR5uYlhcZgKJqnfL8BeVv8A1LGvi2kRg9gvIuawhJaHStd6q+eY5
         /0yKlLl348rv8lONuYG4qoorRxgP3dqgj7NREfaYkmUPTAcK1gHBC3TuKwPT4uyCJk78
         twrR66tZqJTX1UYvciGl9SPrdGweUzOrQMkCcKWxLrwOvgWii8eEqYqUSDN61fCDVwXI
         S31gSxX11m7o323BXKf/rNJluVwVLYMk8VSh6PZQbYb9KB2ERtALKDnAWrpEjp9j/cg0
         Hn/JUQxKpfzB5A7pz9WaFGrj6BwEokrB2kQi1mds8VdsKF6j1kN0ii0BS6RiD9YAwiy6
         fG2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxvC30soRI1EeCVKF73w19TdgmKpAKul7YBdafsVUrHc1IZAU79cRTlf4bgkryeSDMuFrFunoMPimggeLw=@vger.kernel.org
X-Gm-Message-State: AFuF++nOaXG4wNTKq7K10wtLzk/GuW25sNYkQwlKcmvoRCxMQAXqWjRJ
	QQyOPeCJMUEsraxUoGmjTe6c7NLu4znbnIrxqW/xqeZEoKy9PeBknTBimXiRNDdXcsU=
X-Gm-Gg: AYBFou3CU5HRdvOlVjiQbSay2eRXANOvpl0gt17DWeh6UTL3qMGBfEW567EYLq5pno0
	zLPC/DxM6USNjkBlEB33ny2fj65ptA9P+kclZYMC8V/pU+UzYSE1tLG0S2lViRLPlMWuUC11XkB
	8ZLk5/pOT5JDaNDJoVkvYcojljgwQtmvCJR25wicEklXdkTary9hOeeTKk9G43h20L7FaD/mvtL
	to25MLytkopF5TV5ekn2nSoZ9yUQKGemAyJNTpYqEquLc7YhHEUsq8SgpQdf4M2YHBiaVNyNFCb
	wsjRmQW3efZx8jY+bwwB2Y03KCoVhoUoIrLkzhFKCDyHZ98E8MfVqQHe6ab6OSyn4ojdbURK2R1
	NQ8OEdmJi6AF03UmM9nTjO20zAm6xK68vhOuXI27AUPfhE63eahif0b1TBfj7Y2ATrn7jCXmN6+
	05B9uPpfss4fLYmbjtkC5vqewYnp8FuHjbsaKf0TUyDzu+TULFER+Ne4X9+IxGFlX7CkxLoLWyj
	COYF8IDuGz1fN3TF9Q9pSKP3YFuR5Sa5IW9BjYaRv8qqMKP0KpulSO3Kuu6qAFvFpuG6y1oIoJd
	MCOGye5E6R7gRmN5TEU8PdrYVXGL
X-Received: by 2002:a05:690e:43cd:b0:671:2d01:48e3 with SMTP id 956f58d0204a3-6714dff5dd3mr1087542d50.29.1789429209616;
        Mon, 14 Sep 2026 16:40:09 -0700 (PDT)
Received: from pop-os.attlocal.net ([2600:1700:6476:1430:df87:8743:655b:3824])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67125e3fa87sm5207804d50.14.2026.09.14.16.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:40:09 -0700 (PDT)
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: glaubitz@physik.fu-berlin.de,
	frank.li@vivo.com,
	hch@lst.de
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vdubeyko@coreweave.com,
	willy@infradead.org,
	brauner@kernel.org,
	djwong@kernel.org,
	Viacheslav Dubeyko <slava@dubeyko.com>
Subject: [PATCH v4 3/7] hfsplus: take the bitmap page lock for allocate/free
Date: Mon, 14 Sep 2026 16:39:37 -0700
Message-ID: <20260914233941.2966421-4-slava@dubeyko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914233941.2966421-1-slava@dubeyko.com>
References: <20260914233941.2966421-1-slava@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The hfsplus_block_allocate() and hfsplus_block_free() kmap
the allocation bitmap's pages and modify their bits in place
under sbi->alloc_mutex, but without holding the page lock.
That leaves the read-modify-write of the bitmap bits
unprotected against a concurrent writeback of the same page,
which can read a partially-updated bitmap word or race with
the dirty-bit update.

Signed-off-by: Viacheslav Dubeyko <slava@dubeyko.com>
cc: Christoph Hellwig <hch@lst.de>
cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
cc: Yangtao Li <frank.li@vivo.com>
cc: linux-fsdevel@vger.kernel.org
---
 fs/hfsplus/bitmap.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/hfsplus/bitmap.c b/fs/hfsplus/bitmap.c
index 1b3af8c87cad..30178ea47362 100644
--- a/fs/hfsplus/bitmap.c
+++ b/fs/hfsplus/bitmap.c
@@ -39,6 +39,8 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 		start = size;
 		goto out;
 	}
+	lock_page(page);
+	folio_wait_writeback(page_folio(page));
 	pptr = kmap_local_page(page);
 	curr = pptr + (offset & (PAGE_CACHE_BITS - 1)) / 32;
 	i = offset % 32;
@@ -75,6 +77,7 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 			curr++;
 		}
 		kunmap_local(pptr);
+		unlock_page(page);
 		offset += PAGE_CACHE_BITS;
 		if (offset >= size)
 			break;
@@ -84,6 +87,8 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 			start = size;
 			goto out;
 		}
+		lock_page(page);
+		folio_wait_writeback(page_folio(page));
 		curr = pptr = kmap_local_page(page);
 		if ((size ^ offset) / PAGE_CACHE_BITS)
 			end = pptr + PAGE_CACHE_BITS / 32;
@@ -98,6 +103,9 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 	start = offset + (curr - pptr) * 32 + i;
 	if (start >= size) {
 		hfs_dbg("bitmap full\n");
+		kunmap_local(pptr);
+		unlock_page(page);
+		start = size;
 		goto out;
 	}
 	/* do any partial u32 at the start */
@@ -128,6 +136,7 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 		}
 		set_page_dirty(page);
 		kunmap_local(pptr);
+		unlock_page(page);
 		offset += PAGE_CACHE_BITS;
 		page = read_mapping_page(mapping, offset / PAGE_CACHE_BITS,
 					 NULL);
@@ -135,6 +144,8 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 			start = size;
 			goto out;
 		}
+		lock_page(page);
+		folio_wait_writeback(page_folio(page));
 		pptr = kmap_local_page(page);
 		curr = pptr;
 		end = pptr + PAGE_CACHE_BITS / 32;
@@ -152,6 +163,7 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 	*curr = cpu_to_be32(n);
 	set_page_dirty(page);
 	kunmap_local(pptr);
+	unlock_page(page);
 	*max = offset + (curr - pptr) * 32 + i - start;
 	sbi->free_blocks -= *max;
 	hfsplus_mark_mdb_dirty(sb);
@@ -185,6 +197,8 @@ int hfsplus_block_free(struct super_block *sb, u32 offset, u32 count)
 	page = read_mapping_page(mapping, pnr, NULL);
 	if (IS_ERR(page))
 		goto kaboom;
+	lock_page(page);
+	folio_wait_writeback(page_folio(page));
 	pptr = kmap_local_page(page);
 	curr = pptr + (offset & (PAGE_CACHE_BITS - 1)) / 32;
 	end = pptr + PAGE_CACHE_BITS / 32;
@@ -216,9 +230,12 @@ int hfsplus_block_free(struct super_block *sb, u32 offset, u32 count)
 			break;
 		set_page_dirty(page);
 		kunmap_local(pptr);
+		unlock_page(page);
 		page = read_mapping_page(mapping, ++pnr, NULL);
 		if (IS_ERR(page))
 			goto kaboom;
+		lock_page(page);
+		folio_wait_writeback(page_folio(page));
 		pptr = kmap_local_page(page);
 		curr = pptr;
 		end = pptr + PAGE_CACHE_BITS / 32;
@@ -232,6 +249,7 @@ int hfsplus_block_free(struct super_block *sb, u32 offset, u32 count)
 out:
 	set_page_dirty(page);
 	kunmap_local(pptr);
+	unlock_page(page);
 	sbi->free_blocks += len;
 	hfsplus_mark_mdb_dirty(sb);
 	mutex_unlock(&sbi->alloc_mutex);
-- 
2.43.0

