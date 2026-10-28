Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202323;
	b=JErVzlPKwYHvxu0En5aa4OJE3O32szpG/iwjxs2bhbWgYUanbOwlZXRTLio0SDyXjtXQ
	 Jot4tjBDsm3iYIFvqoDEt7QY5b6DEGFmHoWLV6LlbBKlQhuN8jATgPfDiZDPhT7gDN1Ot
	 tpXuIPVtnVuzO2Of6tM/fQUIWzd60t+c9HKDlQDzwkzhEp0eOeKk1lSHvvVSN6wa4VxMa
	 2MaL53IodEy329/YLzkSWSPJsWevAM3G+a1lBnj0iAghZzAqJxiTFvhn57uKuP6Awvo6x
	 e23XztsXkkvaRoah94ajdezWyUWKQHDy8cPpvuCNsY88999zV1WtAZ7ei65i5pGaqIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202323;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f2OVkf7r4Gjj14HyDJ+Wb2+gjwnUw4k6yJIrssGj6sM=;
	b=5JIwnXtke+yDHTCTJaFhcQLMgKsz4wR5TdaTb9ZEDzEY0mQQpALUpU5rmFlNkW8BVRQ7
	 aPgm/9hWK6qW8xxoXZJMAv2veROjNP7pKNDrJizZWyqnpAT7fLoi75kXNYAzWo1kW+g0F
	 3zKjjOxCjtDdelYTuUQLtESWSrg0Pf8UpRP/KaKQqEI4jx5NT4Tek16F71vNTrpwbmtVd
	 n+f7nfDDJ1iYAJNHn0ukmHhARBuBqw+zoB4ry6zJAYq4PVaExPiPZHAF52eSWsfYTYlRW
	 b5e78pzPenmXlOHM/zpslzbi+4xO/JWDvSlnbtufsVGBGjFxJ6sNXenHzm1bpHYBicQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mLq8jZ7v;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4757F606A771
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4757F606A771
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mLq8jZ7v
Received: by mail-pj2-f11.google.com with SMTP id d9443c01a7336-2ea993271f2so4113945ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202322; x=1793807122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f2OVkf7r4Gjj14HyDJ+Wb2+gjwnUw4k6yJIrssGj6sM=;
        b=mLq8jZ7vuW7kOv2GwE97g7pXtugoLGIX/aKq4l2MZMWBuCrs0OPCG+vQ20FBXihIPx
         vNjEhttWE1WW/4H4JCpFKalRc6nTOK9DvirQYNcAh5QnIq3uphEm7Lts3wEwPgodom5f
         KHgsxSlHzY7k1WCXtl3q6AQX8m4KYhAFqSJ8GNl18aHOhjQjmYAWC3yZUL/CUpYimEP3
         8Db6lM7s+EtjiANFg1C2x69E/NmgP9Gq5NxZ/R39fuHc2HJhLP8fzHH3dlv26gmGNPTU
         gV/Ht5U4bxl+Xpct+eTvQtbyBxHOtUOirRMkiQT7CatvA5Eye8dNYEwj83JXLBvyjQzx
         WbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202322; x=1793807122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2OVkf7r4Gjj14HyDJ+Wb2+gjwnUw4k6yJIrssGj6sM=;
        b=Ntfo1eeqEgMky1v3nFn4MxzAIumYbyOr3BqZN8EMyHKmGSaZajOjkftCpJeSGZGcEx
         ERwbeHg9DmGZSqnoqORnZf77F7ur3OeUPAfzkE7AIl2+92iQeKK7/Xa2jyAk/KkXe86U
         ODlOvMhuAZ1Xevb5AHAxyg4cBAUbaqVf774t7gqQ6ZNG0VlKgTpp6Un24BQ7/ttGD2v3
         xGljBBS6EKxwVsWfZwN38l1dr4DiMJ97b9ck0e8m/yK2DmlB2ifpStULobAAjT1yVUgm
         iSnreEPsv/saZH0ktbqkVWy9ISrDRdkTD9KXnOwtO1HPibO/c0O7BX7Mk04izmtl5q9h
         wCAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE/oVXs6n3b/hG3urgg1GWisHQ42IKReownW8RkT/6xqMC+vGbUILuKyYbDE+0tEpfm+J0dN5j245nSqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5a71hOl3tHxacwAcf77Mgcre5IlIaR/dDmlNUAh6ugjS1GzwO
	pzDrL/6I77DWfaEMi6Vgo1czAqwN94LquONxS3BF7lRN7sIYvusY5Izj
X-Gm-Gg: AYBFou0zhwkEuALodoHzgZnzSICoM5STSi8EM7jKv2lHAymvjMTasc5THvVg7ATciub
	LmvJnciIvxYURzw1PCPEPdKcL+6bjBCOASxfl2VNvtG7c+uMkzAvUyAcVksUjeOzEts4FUXXnA3
	4fV6L7KiravB/P2ZEpyQ0ivf6nRpP+Y82g7mX8gei5szDEoVbsFHxTa9jLHW3wXCCNkkYXnmtZO
	f7SDb3bRLqhMBhT9FR5Q5RYP9fZ8pyi6NJ4w+CRSFoP3oEEt/xPXivXf+ZPn8Qz/U/DiUUChkT9
	FuxRFpoUK2KKGAB/2PZ7d8/ltOZtRGYwvY3WVP889AD9rW3+UWNtjd1vV2uKQNCHf3U7QPsosUc
	oFhcjZ73QcEUBhi4AXstmWY+tR/HH9YIHiO8swUKwRMOesocAcgsMC3FPckitKmI7g9vBzA7kuu
	ZLEgWSzq138qi2g7bzOh4EjzO8t8m0pWOa84lIW83oVs0W33PU8NJGRPv+3YwtEnFCOTJAKbhly
	g7occ0/ti4GJcrngd+p5B5lxbg1h9RWTHPIzEDxnlca0ihJVdCNor12Xb9PlgQR7SS3gFH/j5BB
	+RbP4/vq+3LZdYpAh/kj+1zkB/CsbGLTvpYw+DWDyFBzt9eHUTIn6xKFc3SdW2F9Z+o=
X-Received: by 2002:a17:903:22d1:b0:2e2:d989:c273 with SMTP id d9443c01a7336-2eb005375fcmr23232635ad.53.1793202322376;
        Wed, 28 Oct 2026 08:45:22 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6be5105sm24111655ad.37.2026.10.28.08.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:45:21 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>
Subject: [PATCH v8 13/15] f2fs: handle block cloning within the same large folio
Date: Wed, 28 Oct 2026 23:44:04 +0800
Message-ID: <20261028154407.1601430-14-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
References: <20261028154407.1601430-1-nzzhao.sigma@gmail.com>
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

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

With large folios, the source and destination block in __clone_blkaddrs()
can belong to the same folio during same-inode operations such as
collapse range and insert range.

In that case, locking the source folio and then looking up the
destination folio can try to lock the same folio again.  It also copies
from and to offset 0, which is only correct for order-0 folios.

Detect the same-inode, same-folio case before looking up the destination
folio.  Then in this case,we reserve the destination block explicitly.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/file.c | 61 +++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 53 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 36258d401818..8360ac4317f3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1611,25 +1611,70 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
 			f2fs_put_dnode(&dn);
 		} else {
 			struct folio *fsrc, *fdst;
+			size_t src_off, dst_off;
+			bool same_folio;
 
 			fsrc = f2fs_get_lock_data_folio(src_inode,
 							src + i, true);
 			if (IS_ERR(fsrc))
 				return PTR_ERR(fsrc);
-			fdst = f2fs_get_new_data_folio(dst_inode, NULL, dst + i,
-								true);
-			if (IS_ERR(fdst)) {
-				f2fs_folio_put(fsrc, true);
-				return PTR_ERR(fdst);
+
+			src_off = offset_in_folio(fsrc,
+						(loff_t)(src + i) << PAGE_SHIFT);
+
+			/*
+			 * For same-inode operations (collapse/insert), src and
+			 * dst may fall within the same large folio. Detect this
+			 * to avoid self-deadlock on folio lock.
+			 */
+			same_folio = src_inode == dst_inode &&
+				     folio_contains(fsrc, dst + i);
+			if (same_folio) {
+				struct dnode_of_data dn;
+
+				/* Reserve block for dst before copying */
+				set_new_dnode(&dn, dst_inode, NULL, NULL, 0);
+				ret = f2fs_reserve_block(&dn, dst + i);
+				if (ret) {
+					f2fs_folio_put(fsrc, true);
+					return ret;
+				}
+				fdst = fsrc;
+			} else {
+				fdst = f2fs_get_new_data_folio(dst_inode, NULL,
+							      dst + i, true);
+				if (IS_ERR(fdst)) {
+					f2fs_folio_put(fsrc, true);
+					return PTR_ERR(fdst);
+				}
 			}
 
+			dst_off = offset_in_folio(fdst,
+					(loff_t)(dst + i) << PAGE_SHIFT);
 			f2fs_folio_wait_writeback(fdst, true, true);
-
-			memcpy_folio(fdst, 0, fsrc, 0, PAGE_SIZE);
+			memcpy_folio(fdst, dst_off, fsrc, src_off,
+				    PAGE_SIZE);
+			if (folio_test_large(fdst)) {
+				if (!f2fs_ffs_find_or_alloc(fdst)) {
+					f2fs_folio_put(fdst, true);
+					if (!same_folio)
+						f2fs_folio_put(fsrc, true);
+					return -ENOMEM;
+				}
+				f2fs_ffs_mark_subrange_uptodate(fdst,
+							dst_off, PAGE_SIZE);
+				f2fs_ffs_mark_subrange_dirty(fdst, dst_off,
+							    PAGE_SIZE);
+			}
 			folio_mark_dirty(fdst);
+			if (same_folio && i_size_read(dst_inode) <
+			    ((loff_t)(dst + i + 1) << PAGE_SHIFT))
+				f2fs_i_size_write(dst_inode,
+					((loff_t)(dst + i + 1) << PAGE_SHIFT));
 			folio_set_f2fs_gcing(fdst);
 			f2fs_folio_put(fdst, true);
-			f2fs_folio_put(fsrc, true);
+			if (!same_folio)
+				f2fs_folio_put(fsrc, true);
 
 			ret = f2fs_truncate_hole(src_inode,
 						src + i, src + i + 1);
-- 
2.43.0

