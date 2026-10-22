Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655686;
	b=mISDAfEMJRdgkshw0U3DbUBlKUSBYjdxStBSaPgP0ygqiGTI8jwKTgdDH6UDdqZcyyI9
	 cjUUwyyIRvtmkuGV/65xf7AqGGBWNN8yHviHdvAMbci3difvn1nogINa+ISrIuuzCfMGM
	 gDA2lSxdAYUqCqlNbbCuzxMrrjpRapQExNIfHpkxcIGf6ae+dmlh8QIk2/JUME+5xrRpZ
	 6+fo7QcZ+uUQ57CJATgo+DUkhclNbO78V5qJ+IJqNgNl2Ohv6adKeEDw2VRe0PXj7mYu/
	 Qe4jXaMcg/GVek79F3JhZZtRSRmyMOwdPUf/Qfj/SgRNqT7VzgI7U5IpBx78yJQSOKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VwZz7glalGGPHoe9I+P1yNjh3ZtSHRE0EqtBFVnEPsk=;
	b=0SdIEgibWGpCxGXepu94uMX+6AqOFXFvBWLLqMFdY8WlUqDEsOEN1JU20Dgso+y1jtc9
	 wSLkVY17EhoaQDBiIMv5EYuv43Ja+3+lSz3DjAV4YyOuGblGRuiJ76a6HtE6dqeehtF+n
	 sfJ9zAcFzgy7bDB/PJXOdeVc3x9wSOeSUCnP9aQ492GIsA+Tqll4xm1g9HxGlXeIF8Wmf
	 HLE55g9KzuD732lfn0OyZLp8xUqytvXMHN8akgmP9Ivqnpz9xAWjleoXiVpb106n9h4rd
	 1JNJQz/Zzx9/YPjpfKtzs8r8aVGPpvQwJLPTuguAbRYvXzkTL2oRgOMXSf7igdePSnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bJ2zmrCX;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03DF606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D03DF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bJ2zmrCX
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-3ab37ea4798so409695a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655685; x=1793260485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwZz7glalGGPHoe9I+P1yNjh3ZtSHRE0EqtBFVnEPsk=;
        b=bJ2zmrCXZXqVYkP/hLqMyyy0bZrMjGjX2xuVjmAY/kFzDwJDtyJOqgJztxagEemKXZ
         ZnlOJ4ZthgFe2esCue83/mCJg5LDEHTVeAQ21X0fGQO9aZtMKWyoAAfPjMvEQrr1ZlJz
         JKcSjrP65OjKklHfBuCn3YwLYolH8X1lGypV5pA7oEKaJ4iBIaMymCokvAcULOEB57+4
         k+Eb5ArKapSYt3pzwVyxpD3/mEoLAMRskmfM0YxWcQEKWGEDEYqE8VvFywPoKAN3hT5V
         xkfdUhTZJ3qKB7/ijdz0ty+Rab8Q/n1nPCV2ubLMQCGCJUxKFXCWY7EOA3axmgyZUeew
         09Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655685; x=1793260485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VwZz7glalGGPHoe9I+P1yNjh3ZtSHRE0EqtBFVnEPsk=;
        b=gj+SbDgPV2TKFm9Qsc5O+jUx+tK98za2+llgPWRpmb2mN+MvcwUW+JTn/NJG3Ql6um
         mKBboLQJsf3aiKHPbpOmBhqu2l/1F/p09LhK23PYUxKjdMMkpByhi44HCD1q4NYCfPTQ
         SQibUeYotA5yE2tva3JubdX9JXujQWylLzT9gV0ofBKmZZZ8RgptPzBapopdcvEDLTjJ
         ezGSJ8NmjJFy0empBrRwWCy8v4IGf5u5YLm4hT7mOugSARIdDnJypRh/k1RRZ3QPikqn
         G/UW60OaePyZvOX5avj7WkLv5W2Ee3BjdR2kthNzGHkWDKPhAs1Y8852EwkV/UlahJdd
         +USw==
X-Forwarded-Encrypted: i=1; AKwUvByzg4zbd1ZU1/lalb0n32Ygpo/94ZhpWRE4bEnoLdmoJVAgC8q7s8MVSVdKO0nJTMJTq7AT/As46InVf94=@vger.kernel.org
X-Gm-Message-State: AFq9FYJa4DnQr2homu8traPz8QMc+kaWny3MX2mYJQ7xCgqsaLmHPb6C
	2kt3ChB9tI0HWiJ8ANjf1HqE3NsppzT2bKz7B1sXa/2Yt1eeHRzhyhUR
X-Gm-Gg: AYBFou0k9SQFEbLd2r6JxcVu2gYPuDgEBTOAa6qmuJGpULWVwOlca4pc9f6uyGg8OWz
	w8GNwJpNg7ppx/VGi15CeVKHPcV48inectNUDJUV6eRVgfeDBWxdnx1jEqfLtR0qPFbdlpbcyVM
	9rL7Z0TjnmfyZRdrzrL6CD49KU+/TL95yl72zfkcaStkarBWgfLGxH7Fu+nwyGfZRx36K7VzQPl
	C+7RJpsF9qkeFwsGQcThuy1OzsX1CL4NFN1LN45wclL0qW1WTiwbq3f7Duu7h0WVxZQQKe5yGxr
	cGgH0CHbG78mFF4lg4uCBcUcmIAMbDoXgR8ytwQa9U/FUqv5q+wZ2Zutws6Qlg46ro/d9f8IHSM
	rTWkmEcZJC3PdEicMrc6ps6mFqtoMXeneHhrLdEUWEqmr7fVGn/koiO4Ulh73aGBE3xvQvXx/xm
	qQtweKaDuiD+27s4VjY21g8NgbriUa4Xo1pFfo8QuZaYdXeihkrCj6efTIzgjfmKKGnJi1pKyH8
	PQHLTAE9CcVZapRIWWIQuSpAkoNROdFjbMRxb2+ts0EqRHYJLVKJ5gZS3cAkIjAid0bKW4RhnEO
	4BIbuSU2A3yvTEzMaF35Mm4iqQ2o3i2POrZoW0w=
X-Received: by 2002:a17:90b:3912:b0:3ac:adce:60b5 with SMTP id 98e67ed59e1d1-3ad86e97f66mr3592978a91.14.1792655685189;
        Thu, 22 Oct 2026 00:54:45 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:44 -0700 (PDT)
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
Subject: [PATCH v6 13/15] f2fs: handle block cloning within the same large folio
Date: Thu, 22 Oct 2026 15:53:40 +0800
Message-ID: <20261022075343.3043003-14-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
References: <20261022075343.3043003-1-nzzhao.sigma@gmail.com>
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
index 439e84a4aec3..f621d5e65023 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1598,25 +1598,70 @@ static int __clone_blkaddrs(struct inode *src_inode, struct inode *dst_inode,
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

