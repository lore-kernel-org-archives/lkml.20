Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0FE49C4CC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791892597; cv=none; b=pZM49Gx38Fv7cAlALIvnNPEsPj4whzGtLiheK7muoq+xLf6lUpjudByq4zEsNuz627E5GofZCiFeu6gQ5vTzC04jFddZI+a0DIm7vZcl5Znqjzaga63QpIE5Mb3PX14vV/u9vmwkpPQb0zqinBwZAEbPZDVUYavWfoWAgQ4Z2hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791892597; c=relaxed/simple;
	bh=aajoIehjNmVxG+zPDW2Mu4E0IvdQnS07fqtea4FejVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZST3eAfX+tA2gQyoRKABnbTnN29mZbedvSejSWxL/zDHP0abzPX/fCpd290UiKfcMWKOJQjS4k1ZF2DniEm0pkyf5U+/sgdBPcogKnr0YOD7Ek+zsWe7tEGCWXBq/LWifxVP9MkXgmnuqMmvkDI2oumyPRZhNHdOSeQxRMksVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFDB0kx6; arc=none smtp.client-ip=74.125.227.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFDB0kx6"
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ab04c3c533so1302127a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791892595; x=1792497395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aDr2CmceL3ca2fswvyyunUdCe7sbFULSntXyt994J+0=;
        b=AFDB0kx6fAKpLPSIdJbimLrhllzTPBDU66dMN+6kRyxobZq4RjBfzPgeVimeOa2X7S
         BKXDqgUhDQEv57fi7+JOKmsKaMhbSzZg0tAkDXS5vIhEVOOKqta5zCGHmq7kreYNPeKI
         0p2mMUMEFOhl62DwbbRldJSWDqNNxf04vklAfqHfNdXuDLE+HOWyQudU1h6g5w3TTjlE
         K644W9JTbbxPOMNcWnEtRNMM794dmrivM2Bt9FNzahLspoqCDsu7EGLNU2NcsgcDJcHz
         YFytF4zzLg+JNAicCUH7UAEcHiyN7sATJW71YjbzS0KwGeqjSlCcE+7mNK33udeL/BT/
         t1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791892595; x=1792497395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aDr2CmceL3ca2fswvyyunUdCe7sbFULSntXyt994J+0=;
        b=z1j7PIAchV0b1UQwJApgQzg9eNF5Hdya6uZkEsuq1pbrKpzOuzJG2SjiX1WKvVLrxh
         lYiBkiRZCkYjN48A33u5Z141/Do7AwM5xSR/6mL8IWixdfOqJwP8+zK9xOdTrnyQ2mZ7
         3NHJX0okVrdjfFdER4brPM5GpiQaeKW5jEidiB2aWIn/GC9mz1oNiOJPFz6GZFz1aY9S
         L7tdys/1mjtjPRhl/2G/+RwUh7KKRfVyDYRtChAmreHZNvPfhH5I5NBuC0oNZyXeau64
         TvAq3N5DfiXZufDKfHgsIV34TgIMX3YY6rpctydnt29cXSFqcHHLqD+/UtxPRJi8wz6+
         7uHA==
X-Forwarded-Encrypted: i=1; AKwUvBxqNWakQHg5F22LvCGyGG3m0fzxuVUChmSsxpxv/6TRNqvTOx7eDXR3bURcJj7OcCpRPqL02ETMvA/sS0g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWD0OFcNGs0vqmDSdPzAN+lhbZWdB4Hq04E/gU+k7Xu7ZfAwkU
	2kGiDlMM8SoeIhHzFIOZXov2Aq6ifKZ+N3FR4J6g43SUyZkqHHv3RTny
X-Gm-Gg: AYBFou1a9O0kv8e16LqxRn9ZkyENnaFze6J6S6n/Duz7D7zhZ64mhg+quJjWVCrv8iq
	r21b/gC0i+tDJ/lv9W3xnbK6XN6uH8wuXeMu/sKNmUIy3imsjZaso3M96DIqjA0YGVvO/bI9FZn
	S6s1Aea9BF6OJ5E3i5cWRYsV19jN2V7t4hwblyoIpvGZCu3IG6BbPN4p70u771uTp5xs3Iu6CD4
	2At9MlYM5X8F0LzMtgR7aeH0yBECRY1LuNPsJRatT+1BVryQcGW9Efjobs4UdmiCKhMdGCBSc7P
	LSoKhT3PIDStGFLbqiQnGONFc+Bkj4WEum3XYAYspq7ANGpRn3Z68U31DX7ZmvBevfZHWZZ70nb
	+UfO9x0URCU4fBfAHPDFjjOu/wL/Au9GM9PPI/fk1UDKqTKElO8Xisc1KP6Hz0XV0omJ4MFstk6
	a8WDgBJkJW9gzOq0KII0z6mxMadbwjOGGwy1E0sI4KfcJUdn1hL8aPUItZaozjaNXGtkJI+bOyT
	3f5t3gPgWYVFa/N505e/duAXFPEpaemv9JG
X-Received: by 2002:a17:90b:3c8c:b0:3aa:6b5d:a018 with SMTP id 98e67ed59e1d1-3ab3af94c34mr9681745a91.67.1791892595477;
        Tue, 13 Oct 2026 04:56:35 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab37139b59sm21248516a91.13.2026.10.13.04.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:56:35 -0700 (PDT)
From: Nanzhe Zhao <nzzhao.sigma@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: Barry Song <baohua@kernel.org>,
	Nanzhe Zhao <zhaonanzhe@xiaomi.com>,
	Juan Yescas <jyescas@google.com>,
	Daeho Jeong <daehojeong@google.com>,
	Dev Jain <Dev.Jain@arm.com>,
	David Hildenbrand <David.Hildenbrand@arm.com>,
	linux-kernel@vger.kernel.org,
	Bo Zhang <zhangbo56@xiaomi.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	Nanzhe Zhao <nzzhao@126.com>,
	Pengfei Li <lipengfei28@xiaomi.com>,
	Ryan Roberts <Ryan.Roberts@arm.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v4 01/18] f2fs: read i_size once in f2fs_vm_page_mkwrite
Date: Tue, 13 Oct 2026 19:56:04 +0800
Message-ID: <20261013115621.968742-2-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
References: <20261013115621.968742-1-nzzhao.sigma@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nanzhe Zhao <zhaonanzhe@xiaomi.com>

f2fs_vm_page_mkwrite() reads i_size twice: once to check whether the
folio is partially beyond EOF, and once to calculate the offset for
folio_zero_segment(). But a concurrent buffered write can extend isize
and cause the following race condition to corrupt data:

buffered write writes [0,3500)

CPU0 (write fault)                        CPU1 (buffered write)
 ----                                     ----
 f2fs_vm_page_mkwrite()
 folio_lock(folio)
 if (((loff_t)(folio->index + 1) << PAGE_SHIFT) >
 i_size_read(inode))
 /* i_size_read() = 3500 */
                                           write(fd, buf, 200, 4096)
                                           /* writes into page1, does not
                                              wait for folio lock */
                                           i_size_write(inode, 4296)
 offset = i_size_read(inode) & ~PAGE_MASK
 /* i_size_read() = 4296, offset = 200 */
 folio_zero_segment(folio, offset, folio_size(folio))
 /* valid data [200, 3500) is zeroed */

Fix this by reading i_size once and using the same value for both the
EOF check and the zeroing offset.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20261012030315.978375-1-zhaonanzhe%40xiaomi.com
Fixes: fbfa2cc58d53 ("f2fs: add file operations")
Cc: stable@vger.kernel.org
Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/file.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ed1b944f8..fc959cdb9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -125,6 +125,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn;
 	bool need_alloc = !f2fs_is_pinned_file(inode);
+	loff_t isize;
 	int err = 0;
 	vm_fault_t ret;
 
@@ -188,8 +189,14 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	filemap_invalidate_lock_shared(inode->i_mapping);
 
 	folio_lock(folio);
+	/*
+	 * A concurrent buffered write can extend isize, so we store isize in a
+	 * local variable to let the zeroing offset match the EOF check below.
+	 */
+	isize = i_size_read(inode);
+
 	if (unlikely(folio->mapping != inode->i_mapping ||
-			folio_pos(folio) > i_size_read(inode) ||
+			folio_pos(folio) > isize ||
 			!folio_test_uptodate(folio))) {
 		folio_unlock(folio);
 		err = -EFAULT;
@@ -225,11 +232,10 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		goto out_sem;
 
 	/* page is wholly or partially inside EOF */
-	if (((loff_t)(folio->index + 1) << PAGE_SHIFT) >
-						i_size_read(inode)) {
+	if (((loff_t)(folio->index + 1) << PAGE_SHIFT) > isize) {
 		loff_t offset;
 
-		offset = i_size_read(inode) & ~PAGE_MASK;
+		offset = isize & ~PAGE_MASK;
 		folio_zero_segment(folio, offset, folio_size(folio));
 	}
 	folio_mark_dirty(folio);
-- 
2.43.0

