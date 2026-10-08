Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E233CB2D2
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486521; cv=none; b=EjgpxS/onMQoC3XplkKggpniGQ949Q04WN3Am5/v3vP2wQ5vGtfiq3i6JwlplCVZvmH7JnEa1GDthktTjnqQDfEDhqh7HwQ1tWVSYaSWNGJ34NRqp87ATReWdEGeE0/SJdegP+T/WkAUW5yC741Uyb4d69nF6KtS8tdCC0PnBVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486521; c=relaxed/simple;
	bh=5M6ONwAYQGGzjhALLBWWeXFdEJuST9MXsZw5Ht6qjWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZFH0nEAIfEKa/JeVF9r0XrP5gl/ypk1IG7pKtSiY+qhd2uCuUdMOgb/wzbD4xL9fShEY9Q5lFvhazpnC99JU805C2iukMuugnrigkbctWIg7RosCPrweammZqMiaEGkX3e5jaN0x+LKcltoLZANQ4o2ukN/jD6J8keK4pa0PFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=hLKDlfTT; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="hLKDlfTT"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3130610eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 12:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791486517; x=1792091317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89nlx+M34LzIrZosb2dO9gI0RPZyt6hlktU5w00KTX8=;
        b=hLKDlfTTi8wSyzkszQkhy2B98cejuxB/NAGIeUBAThAT3UEZVroGVC1lMXlwlMBuyN
         +K20O9JUrNlHbXdCEQrTRp2NBej7iTL/AduRzVGmCtH/YYjL7MAhxTDLRArgWV7+IS5R
         S+GpC3qlRVURDR5EMZj6xF18VnIiXGjalS/nepMXgpK4oJaURRxtjmT8Wb3vVmuf4Snv
         nVgrg0wZ9ihY1xT870eGQvJcxMhSo8EyCnNWkT/C8aoLxbFZMWXaIVKEeyZGYOjgi6ow
         ziEGGS9zBO65BUU9eQhfcQxVZf31ST0bfcpADR0ljcOlwkhoYu/9Km+RxRJdsCAm5LFx
         AfCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791486517; x=1792091317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=89nlx+M34LzIrZosb2dO9gI0RPZyt6hlktU5w00KTX8=;
        b=tvBO1OeOXgv02NheiDkiELQY4yzHOch4VUk9yIFPIMvV5ywR3GKnaK33oQCmnQ3XkP
         tbPRrE3kx09mm0R7Mmkp3olnTWd/v2T/DfYZ3s3fw+HIFPhmUORfgZs+eiaVuYha/73M
         6ZGRCZfl4FaJJ/f0sRNXY6KvseyKf4LQqIEob49Rspwg/zX8kEcpy1QuHyrcoNM5m01u
         983UTYp6+YgGAr8M4Ri9kE8wDqgLlZUPM4y9+KRKwKXLw2CgJbt6rt4zcCgYU97is1Bb
         3wuxHrEo8KKhRgQ374MsBPKaPQy7UFbxJazJbmZ0hryYUttX8aK296BJ20QrF9Tj9P4C
         PDjA==
X-Forwarded-Encrypted: i=1; AKwUvBwNHahq/2pcW2xh+97vaOypf0KlubE19rRVQqpvcpxVlZqfFqhoW+z+K2ZQPSi9KA97nF9y+oZjJUUl+J0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKejo9edJ7O4P0g0c1TFOHhQ+l2KGZfLB8p1jt4a3YZF6cHNEFS
	wyjU7xsqU2Jw08CX7v76gugocEV8S8xebeYXnzCUIUS7IGbemb8O27Uh6jmtRt4qPGZs4KtCRDb
	pp1akoetdSw==
X-Gm-Gg: AYBFou2LTvyIFSRig0V5eik/Dk/kQ1kmdi0hmCDeJPit0TLGuFGEcWCOVuMjuXVzvLH
	By9fAJ449Veck6+reh0FmuuPlHV66DsN1uHhjAFQ7KinMXLSGIwqgd0XtC8APCp5Bvir5+pRRc1
	WWPIMZkqKe2IJI5BxinpkNN5ic5iu12udufSeVJoJ5p26oXQLJLUgi9HbApnEEPZNY8TtQRtkoa
	MpwIStrxgxCflh8mJyg4XR04szPV0tMlGWTLecQwjDNHiOB+vy95eOsfbxT7dFVfKXZsfifvsNK
	fuWvqgmWmY0Y+viZWCvXg5r9QtqBRDU5zbeMtSlK90ys7Z4NXKD7l1Hqv7r3rJHYw1xNSSxYeK4
	0g6OuhAD8E8tU5q5sFuEDcVO2zPCZDIkqznr4wiKbEfbUb3fQetrjhS55wM15jHDwoCdpJczfWU
	rQZFLJoN7tHAshVYK3V1OXpgD59mD3+/Znx/mNTUGCRU7MJF2AtBz94mYMEaNkYDGZQrXmO4Owj
	Aa23A7HThsCJWGKYr66d/FQTyaM0rGAZmk6HILDG5Y84VQo2E53yMqBqh/SdGJju0TBjJs=
X-Received: by 2002:a05:693c:88d1:10b0:351:f762:a10c with SMTP id 5a478bee46e88-351f762a25bmr2478155eec.0.1791486516485;
        Thu, 08 Oct 2026 12:08:36 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm80561eec.3.2026.10.08.12.08.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:08:36 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <huyue2@coolpad.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	linux-erofs@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Yue Hu <zbestahu@gmail.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <hongbohbli@tencent.com>,
	Chunhai Guo <guochunhai@vivo.com>
Subject: [PATCH 6.6.y 2/2] erofs: unify lcn as u64 for 32-bit platforms
Date: Thu,  8 Oct 2026 15:08:28 -0400
Message-ID: <20261008190830.97970-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008190830.97970-1-artem@trailofbits.com>
References: <20261008190830.97970-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gao Xiang <hsiangkao@linux.alibaba.com>

[ Upstream commit 2d8c7edcb661812249469f4a5b62e9339118846f ]

As sashiko reported [1], `lcn` was typed as `unsigned long` (or
`unsigned int` sometimes), which is only 32 bits wide on 32-bit
platforms, which causes `(lcn << lclusterbits)` to be truncated
at 4 GiB.

In order to consolidate the logic, just use `u64` consistently
around the codebase.

[1] https://sashiko.dev/r/20260420034612.1899973-1-hsiangkao%40linux.alibaba.com

[ Backport to 6.6.y: rebase after the CVE-2025-68251 compact-index
  validation change. Widen its new lcn diagnostic along with the
  recorder, full and compact loader data flow, lookback and compressed-
  length locals to u64. ]

Fixes: 152a333a5895 ("staging: erofs: add compacted compression indexes support")
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 2 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-53015. The EROFS zmap implementation and the
preceding compact-index validation fix otherwise retain 32-bit lcn values
in shifts on 32-bit systems; widening the complete data flow and the
validation diagnostic to u64 prevents 4-GiB truncation without weakening
the new loop check.
This needed a target-specific adjustment; I called it out in the bracketed
backport note above.

The fix is absent from the pinned 6.6.y branch and queue and must follow
CVE-2025-68251 in this series.

 fs/erofs/zmap.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index e53d5239f04d..990322b228cb 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -12,7 +12,7 @@ struct z_erofs_maprecorder {
 	struct erofs_map_blocks *map;
 	void *kaddr;
 
-	unsigned long lcn;
+	u64 lcn;
 	/* compression extent information gathered */
 	u8  type, headtype;
 	u16 clusterofs;
@@ -22,8 +22,7 @@ struct z_erofs_maprecorder {
 	bool partialref;
 };
 
-static int z_erofs_load_full_lcluster(struct z_erofs_maprecorder *m,
-				      unsigned long lcn)
+static int z_erofs_load_full_lcluster(struct z_erofs_maprecorder *m, u64 lcn)
 {
 	struct inode *const inode = m->inode;
 	struct erofs_inode *const vi = EROFS_I(inode);
@@ -219,7 +218,7 @@ static int unpack_compacted_index(struct z_erofs_maprecorder *m,
 }
 
 static int z_erofs_load_compact_lcluster(struct z_erofs_maprecorder *m,
-					 unsigned long lcn, bool lookahead)
+					 u64 lcn, bool lookahead)
 {
 	struct inode *const inode = m->inode;
 	struct erofs_inode *const vi = EROFS_I(inode);
@@ -270,7 +269,7 @@ static int z_erofs_load_compact_lcluster(struct z_erofs_maprecorder *m,
 }
 
 static int z_erofs_load_lcluster_from_disk(struct z_erofs_maprecorder *m,
-					   unsigned int lcn, bool lookahead)
+					   u64 lcn, bool lookahead)
 {
 	struct erofs_inode *vi = EROFS_I(m->inode);
 	int err;
@@ -289,7 +288,7 @@ static int z_erofs_load_lcluster_from_disk(struct z_erofs_maprecorder *m,
 		return err;
 
 	if (m->type >= Z_EROFS_LCLUSTER_TYPE_MAX) {
-		erofs_err(m->inode->i_sb, "unknown type %u @ lcn %u of nid %llu",
+		erofs_err(m->inode->i_sb, "unknown type %u @ lcn %llu of nid %llu",
 			  m->type, lcn, vi->nid);
 		DBG_BUGON(1);
 		return -EOPNOTSUPP;
@@ -310,7 +309,7 @@ static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
 	const unsigned int lclusterbits = vi->z_logical_clusterbits;
 
 	while (m->lcn >= lookback_distance) {
-		unsigned long lcn = m->lcn - lookback_distance;
+		u64 lcn = m->lcn - lookback_distance;
 		int err;
 
 		err = z_erofs_load_lcluster_from_disk(m, lcn, false);
@@ -330,14 +329,14 @@ static int z_erofs_extent_lookback(struct z_erofs_maprecorder *m,
 			m->map->m_la = (lcn << lclusterbits) | m->clusterofs;
 			return 0;
 		default:
-			erofs_err(sb, "unknown type %u @ lcn %lu of nid %llu",
+			erofs_err(sb, "unknown type %u @ lcn %llu of nid %llu",
 				  m->type, lcn, vi->nid);
 			DBG_BUGON(1);
 			return -EOPNOTSUPP;
 		}
 	}
 err_bogus:
-	erofs_err(sb, "bogus lookback distance %u @ lcn %lu of nid %llu",
+	erofs_err(sb, "bogus lookback distance %u @ lcn %llu of nid %llu",
 		  lookback_distance, m->lcn, vi->nid);
 	DBG_BUGON(1);
 	return -EFSCORRUPTED;
@@ -350,7 +349,7 @@ static int z_erofs_get_extent_compressedlen(struct z_erofs_maprecorder *m,
 	struct erofs_inode *const vi = EROFS_I(m->inode);
 	struct erofs_map_blocks *const map = m->map;
 	const unsigned int lclusterbits = vi->z_logical_clusterbits;
-	unsigned long lcn;
+	u64 lcn;
 	int err;
 
 	DBG_BUGON(m->type != Z_EROFS_LCLUSTER_TYPE_PLAIN &&
@@ -402,7 +401,7 @@ static int z_erofs_get_extent_compressedlen(struct z_erofs_maprecorder *m,
 			break;
 		fallthrough;
 	default:
-		erofs_err(sb, "cannot found CBLKCNT @ lcn %lu of nid %llu", lcn,
+		erofs_err(sb, "cannot found CBLKCNT @ lcn %llu of nid %llu", lcn,
 			  vi->nid);
 		DBG_BUGON(1);
 		return -EFSCORRUPTED;
@@ -411,7 +410,7 @@ static int z_erofs_get_extent_compressedlen(struct z_erofs_maprecorder *m,
 	map->m_plen = erofs_pos(sb, m->compressedblks);
 	return 0;
 err_bonus_cblkcnt:
-	erofs_err(sb, "bogus CBLKCNT @ lcn %lu of nid %llu", lcn, vi->nid);
+	erofs_err(sb, "bogus CBLKCNT @ lcn %llu of nid %llu", lcn, vi->nid);
 	DBG_BUGON(1);
 	return -EFSCORRUPTED;
 }
-- 
2.39.5

