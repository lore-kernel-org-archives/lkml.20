Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28F3136672
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731183; cv=none; b=DnSv4uoH79oI4dpYWDOEOqxLqyER6Fzz6ZUu3VsnTMmS3kNgQ4dgZsrSHqd+NnOgHBnPnP9qghxrAociG4x+m02fM1Bn5mHIP3G9VTYaC3p3Wp2ZzN8/Jzgqbej60D4DyVeVzo40dEK3n0jfyqbFrUZg6lihHd2rkyVNE2M2+aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731183; c=relaxed/simple;
	bh=Cfj326x8LAqdgElCQaG7LVeIWfBp3cL9Pn0z0omeboc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B1S/5vVKc2OkeqhPT5kwVqYn1IgLiaU4INEp6U4o1oJ3tW0GfypqFUaugB3ECR3f055ftpaysUC9A9YHbNGJNTCyIuY9s7QHdohcRrU29EBQJV530USFgJgp2lL9B6AEf+FCWEkR88MOk/YxUcKMA0V/4Djv+QKsEaWQ/zSvjI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e5EhD8Hg; arc=none smtp.client-ip=74.125.82.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e5EhD8Hg"
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34318e88ba2so3794406eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790731177; x=1791335977; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0wlYFbpFghnstlU+2b6sLYN8nNwY9HP02E2/+9cpOkI=;
        b=e5EhD8HgZIUCXkT8608r5TwZvY6McTTk6vXs1LRmo5KRTnPgiW+8z12uk2zHSyF8oG
         iUAiYfJbDbGqdSYeS5cRj42s5teGwwWM92sG1qIikaizG4rGiyAcyi57PSjgpW21FVba
         j37fDq3+sfDh/ad2kmLfGxQk0SgFu0n2elOs/D5mMTyiYdnlucxZA5iaWv2Ql08i5yCI
         uyvbveVzsheQ4pf6cx/EcfcNmNy9Ab+F7p7TRwtFtoXvsYMUY7vfgYO4VBVDsDXsE1ig
         GgG0x9sC0NHynCQa9dI4gyGkA3FUeDJ/FWoRueXhjK1Ra0PoWyzLxDt04EP5xnnv+fI3
         3i0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790731177; x=1791335977;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0wlYFbpFghnstlU+2b6sLYN8nNwY9HP02E2/+9cpOkI=;
        b=HSLZVeOQlNYeG7qbr3lgHzocoJl3HlxUcGn/A1imcom3h6T288Id1UxFbo/LY0H7mw
         llsUQYpH/rc+Qi+CM1K3cdfY73og0Ryi82gqBISnNiKnUF2sFlQBAPjz+7rFRFUU1NUH
         43ordkYv8l2+UtHKqfv/C6z5HX9eQGt4jCXLG0Z8/ky4YVLyjyWsdbxhA7qYYdIgeFbV
         gdBC//XZ1dk3EBJ0f4UsQWkl7RpmOfQu8jW7Kd/cxt3dbZhahHbyuEC2zuwp68178frf
         FLMp1hqyDHJjOUNgfXz1QADt+Geie2l6QYTiNA+lOWdJd1Jj0Jge5zALhDRtsReLxpex
         6+xw==
X-Forwarded-Encrypted: i=1; AKwUvByjhOmOYWH5eSCLX50Mcm1trPKNU/EICWyrvUN3AXuv6h2WhsA3Pa9+32QFdSWpygQ3vdmn1L2W9XMZP2U=@vger.kernel.org
X-Gm-Message-State: AFuF++lsZzlRYU3wCXpC7tR5hlTmQH1yjHhdDw8L8ihl9oe5ZS8riNNz
	G5Y8UGo3YmaFSvJTca/Lb/96wfN7jtqkvmEE7Q9eFnjdbqtjQVlEu7DVgE1lyho56trbU348iGP
	BFGkQvecfQDh0IdsHDcpSDCxKKao+IRl9mFdtpA==
X-Received: from dycnn9.prod.google.com ([2002:a05:7301:1409:b0:344:1693:c118])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1a02:b0:34b:ee3a:10af with SMTP id 5a478bee46e88-34cd91735admr43302eec.4.1790731177107;
 Tue, 29 Sep 2026 18:19:37 -0700 (PDT)
Date: Tue, 29 Sep 2026 18:19:21 -0700
In-Reply-To: <20260930011921.1188150-1-sarthakkukreti@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260930011921.1188150-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260930011921.1188150-4-sarthakkukreti@google.com>
Subject: [PATCH 3/3] erofs: optimize 48-bit encoded extent lookup with O(1)
 hint, interpolation, and in-page search
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Cc: Sandeep Dhavale <dhavale@google.com>, linux-erofs@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

In z_erofs_map_blocks_ext(), 48-bit variable-length encoded extent
tables (recsz >= 16) currently perform a full O(log N) binary search
across [0, z_extents), invoking erofs_read_metabuf() on every iteration
even when multiple binary search probes land within the same 4 KiB
metadata page or when reading sequentially.

Optimize 48-bit variable-length extent lookup in three ways:
1. O(1) Sequential Continuation Hint: Cache the last resolved extent
   index (z_extent_hint) and its logical end offset (z_extent_hint_lend)
   in struct erofs_inode. Because extent i + 1 starts at hint_lend,
   check map->m_la == hint_lend on step 0 to probe hint + 1 directly
   on sequential reads with zero false positives on random reads.
2. Step-0 Linear Interpolation: On random reads where map->m_la !=
   hint_lend, estimate the initial probe index via linear interpolation
   div64_u64(map->m_la * (r - l), lend) so that step 0 lands on or
   adjacent to the target 4 KiB metadata page (~16 MiB logical coverage
   per 256-record metadata page at recsz = 16).
3. In-Page Binary Search: Once erofs_read_metabuf() maps a metadata
   block, narrow [l, r) across all extent records [blk_first, blk_last]
   residing in that same metadata block in memory before issuing another
   erofs_read_metabuf() call.

Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 fs/erofs/internal.h |  2 +
 fs/erofs/zmap.c     | 94 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 75 insertions(+), 21 deletions(-)

diff --git a/fs/erofs/internal.h b/fs/erofs/internal.h
index 12e3a5b80a5a..9bf1df974bcf 100644
--- a/fs/erofs/internal.h
+++ b/fs/erofs/internal.h
@@ -271,6 +271,8 @@ struct erofs_inode {
 			};
 			erofs_off_t    z_fragmentoff;
 			unsigned short z_idata_size;
+			u64            z_extent_hint;
+			erofs_off_t    z_extent_hint_lend;
 		};
 #endif	/* CONFIG_EROFS_FS_ZIP */
 	};
diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index f8981fc74246..56cd9dd088b6 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -558,36 +558,86 @@ static int z_erofs_map_blocks_ext(struct inode *inode,
 		lend = min(lstart, lend);
 		lstart -= 1 << vi->z_lclusterbits;
 	} else {
+		unsigned int step = 0;
+		u64 hint = READ_ONCE(vi->z_extent_hint);
+		erofs_off_t hint_lend = READ_ONCE(vi->z_extent_hint_lend);
+
 		lstart = lend;
-		for (l = 0, r = vi->z_extents; l < r; ) {
-			mid = l + (r - l) / 2;
+		for (l = 0, r = vi->z_extents; l < r; ++step) {
+			erofs_off_t blk_off;
+			u64 back, fwd, blk_first, blk_last;
+			u64 orig_mid, sub_mid, lo, hi;
+			struct z_erofs_extent *e;
+
+			if (step == 0 && hint_lend &&
+			    map->m_la == hint_lend &&
+			    hint + 1 < vi->z_extents) {
+				mid = hint + 1;
+			} else if (step == 0 && r - l > 4 && lend > map->m_la) {
+				u64 est = div64_u64(map->m_la * (r - l), lend);
+
+				if (est >= r)
+					est = r - 1;
+				mid = est;
+			} else {
+				mid = l + (r - l) / 2;
+			}
 			ext = erofs_read_metabuf(&map->buf, sb,
 						 pos + mid * recsz, in_mbox);
 			if (IS_ERR(ext))
 				return PTR_ERR(ext);
 
-			la = le32_to_cpu(ext->lstart_lo);
-			pa = le32_to_cpu(ext->pstart_lo) |
-				(u64)le32_to_cpu(ext->pstart_hi) << 32;
-			if (recsz > offsetof(struct z_erofs_extent, lstart_hi))
-				la |= (u64)le32_to_cpu(ext->lstart_hi) << 32;
-
-			if (la > map->m_la) {
-				r = mid;
-				if (la > lend) {
-					DBG_BUGON(1);
-					return -EFSCORRUPTED;
+			/*
+			 * Multiple extent records reside in the same metadata
+			 * block (e.g., 256 records per 4 KiB page for
+			 * 16-byte extents, or 128 records for 32-byte extents).
+			 * Narrow [l, r) across all records already present in
+			 * the currently mapped metadata page to avoid repeated
+			 * erofs_read_metabuf() calls.
+			 */
+			blk_off = (pos + mid * recsz) & bmask;
+			back = min_t(u64, mid, blk_off / recsz);
+			fwd = (sb->s_blocksize - blk_off) / recsz;
+			blk_first = mid - back;
+			blk_last = min_t(u64, vi->z_extents - 1, mid + fwd - 1);
+			orig_mid = sub_mid = mid;
+
+			while (l < r) {
+				e = (void *)ext +
+				    ((s64)sub_mid - (s64)orig_mid) * recsz;
+
+				la = le32_to_cpu(e->lstart_lo);
+				pa = le32_to_cpu(e->pstart_lo) |
+					(u64)le32_to_cpu(e->pstart_hi) << 32;
+				if (recsz > offsetof(struct z_erofs_extent, lstart_hi))
+					la |= (u64)le32_to_cpu(e->lstart_hi) << 32;
+
+				if (la > map->m_la) {
+					r = sub_mid;
+					if (la > lend) {
+						DBG_BUGON(1);
+						return -EFSCORRUPTED;
+					}
+					lend = la;
+				} else {
+					l = sub_mid + 1;
+					if (map->m_la == la)
+						r = min(l + 1, r);
+					lstart = la;
+					map->m_plen = le32_to_cpu(e->plen);
+					map->m_pa = pa;
 				}
-				lend = la;
-			} else {
-				l = mid + 1;
-				if (map->m_la == la)
-					r = min(l + 1, r);
-				lstart = la;
-				map->m_plen = le32_to_cpu(ext->plen);
-				map->m_pa = pa;
+				lo = max_t(u64, l, blk_first);
+				hi = min_t(u64, r - 1, blk_last);
+				if (lo > hi)
+					break;
+				sub_mid = lo + (hi - lo) / 2;
 			}
 		}
+		if (l > 0) {
+			WRITE_ONCE(vi->z_extent_hint, l - 1);
+			WRITE_ONCE(vi->z_extent_hint_lend, lend);
+		}
 		last = (l >= vi->z_extents);
 	}
 
@@ -665,6 +715,8 @@ static int z_erofs_fill_inode(struct inode *inode, struct erofs_map_blocks *map)
 	}
 	vi->z_advise = le16_to_cpu(h->h_advise);
 	vi->z_lclusterbits = sb->s_blocksize_bits + (h->h_clusterbits & 15);
+	vi->z_extent_hint = 0;
+	vi->z_extent_hint_lend = 0;
 	if (vi->datalayout == EROFS_INODE_COMPRESSED_FULL &&
 	    (vi->z_advise & Z_EROFS_ADVISE_EXTENTS)) {
 		vi->z_extents = le32_to_cpu(h->h_extents_lo) |
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

