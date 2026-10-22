Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655647;
	b=q2jOgpkZEXIvYOT0WVRL5NfZ6WnlT43adBlYloZ6pZydZBP0nVwG6jJAYJgGitbuFpVv
	 QVartol6TloCnmW42JYtjtXYBLtZ+802xrLNkFYq5k8ucmVCryhNKHo0IRg0pjb7IQa8j
	 pOzLYncA098vSufTxjnE7/p0DfSeSeU57atyLN+I3OkwzjLjpnZ0VooKkTW9zpq6baviS
	 rhUgG6oJjNkiPtSwcQsXwrt6Rnaa88T7V/lSeXeex7N4O+PRpIrapkWb4vjbBl8cNPCX2
	 oHv53UUmXHli/CKhh6GWvSIE8D2SYBVfHwFxIZ18dLPE6Rf7prQIdiEESmaEwQer/ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dbX8nwakU6g+Gs6/KxYHt1pBiW5NFblLEduXjkYsL8E=;
	b=ds4C90nOc4EPjCyJCApBDCRwvFkyBGa3RKNZGh6R265O3PNzjWXEppIuulFuHzQOC2z0
	 1GUb32z8qnEQ1JlZt9LXj+WKMKh+ZAucjF1AdSDQ0hVq5t1+Aisg5/KqQEVaRoyN8IBAg
	 5N044rh+GAHbf5Z7bSm50Hg+GcjQvEcIdm9kw7l2Y0StiDu/naj48Ymw3e/Y1wxXHJhlB
	 hfS6zPHqVEUH4ksTZxJP5Qt0pRlicXcBEdH2uI4nnWtFASpzWV6NQm9IdIl114fn386ui
	 /JT2RA6h6snX4glION5ozZmL+/yltXeX/ZY+VVge7eX0TQXyhMl2ve+02jRjqtJJFXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d8isK+8H;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489F9606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:54:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489F9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d8isK+8H
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so756924a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792655646; x=1793260446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbX8nwakU6g+Gs6/KxYHt1pBiW5NFblLEduXjkYsL8E=;
        b=d8isK+8HrpYFsDq4D0Ob9lhliheX6wJrD/sQjeOF/ug2fkMqSocmWU0CTOhpu+APPC
         QEjzt8XCQfBkuemWCt06cZohQvMnjcBkXtdigkhq9Rw6+PRbDmCmXL3wrdvl1w7HPnq7
         j3wRjCFmgbI/DSThCy09sJWFNzSacx8i1fYU9GcD9NKb7YoOCB7fniG5tNxOf07qyfeX
         3v43GjVqQop/NuxsA/VCkdVuy34OooZM86DaKZBDLskJyJX6HAvCjYNSq5TMoKqEiizz
         Y6eUFchF0ygSILxhvjAh7e3Vw0AiJJlGl0bAVrY/eYaYYv6fhZdptnUpJBoIFTeuzL7u
         aUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655646; x=1793260446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dbX8nwakU6g+Gs6/KxYHt1pBiW5NFblLEduXjkYsL8E=;
        b=HEwU+6rO+CzJVFcw5GNzs1Vgacg4ZERDV4yKXfrC7awm7E3mJbs+pbrdvFqtboK79F
         jJZWd7WUcdJ3eYkpTkigThQlEmzHX1RrFmAWG7usZD2VcF8VNkfKo6pod8xKdD1Qv1bt
         2FjZxPGyV3QQtPCfbyI2FpBryGV7Wgm0q5zWp8SGOx1r1OuHepv+juXrknpgG1H1mu56
         UveG+m6BU80JKY2KFv7Zexa/YaqYrugR4mtSaIopQDmrTnAAD0Q7u7w3YiHEcO39dPaK
         1l+Po7Fqzn0Hub7YzLSM6aQ9BzydNwElPVJreJgu5vhf7ZSW71BU588EEQvFIepsx3hn
         XGAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxElwuJ5Ysz8q/2Dp60wuwOAsm5tdJNKdTHvCMyf6HZT8znuxMRQE76L6JlQt3qUzioNDzIpst4eVpalbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqcOoGwpNeuaCSZn1juW5tBTtc7RcvTaMv4hF61l2TIwCLUXu6
	GiOdbyDNc202dTXb4elLAE4mSqRNVo+pdMVP95nEhIgOLi0HAuX66cuI
X-Gm-Gg: AYBFou38VE4nHwIb5efkbslo7Db8jmk/kApcmdOsCjXkIF37kJqD6p9VwhW//yXMsR6
	iDCIEpc9vcHYThYBVwUop/V/+wF6h2B788PtT3lql3gn0zOjpYnxkuxa57DeT2CwRcS+DfsHVeO
	UMNF8PI/CnATq+fz2zvBoYbpGBnr9TOhDO7/arNziwVMZIINOBqts6CJ5sAdEg8uB6otp+LL+Un
	6Pcp7cUdcAGqkRvOId6ymTayu/O1GdPUwsuy58qZfAsvCThdf7wzdniak+6oXRYXwcQNGQzf3VM
	3V+mTAt80qyOmF9JhFs2JTtw2+zwS6044AxCQHag/plXmZoZONlJ0szPPf875UAJrfPr6rpvZir
	hibYmOLfbfo60NnKc9QDz1oygKLjEA2HqHppFy7XZsqb5tOlOpQMVRVhQQpSCBJkuPFzawMgFwF
	jAgiBbNoxVZCadUYkKustVfMh5HbaR+lFBaZcQNLxa7JTeHIZQAmMREeKvy5vO70dzaImUBRRAa
	H99LcLCI0V5wQiPfDDBQX03mDKbofD5aN7FfDM/UQDrBx8CcNb38Ouo7PvD3xdT7xJ8Ga7r/Ed7
	j5RiJTIMOqYC4WIbNA==
X-Received: by 2002:a17:90a:e7c8:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3ad86e97f59mr3590074a91.13.1792655646453;
        Thu, 22 Oct 2026 00:54:06 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4896c71sm3202562a91.6.2026.10.22.00.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:54:06 -0700 (PDT)
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
Subject: [PATCH v6 04/15] f2fs: support atomic file large folios buffered write
Date: Thu, 22 Oct 2026 15:53:31 +0800
Message-ID: <20261022075343.3043003-5-nzzhao.sigma@gmail.com>
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

ioctl can convert an inode with large folio support into an atomic
file. Support large folio buffered writes for atomic files as well.

Add a large folio atomic write_begin helper that reserves COW mappings
for the write range. For partial head and tail subpages, read the
existing data from either the COW inode or the original inode before
marking the subpage uptodate.

Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
---
 fs/f2fs/data.c | 70 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 63 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ffc25eb09a92..e3d6e3087bb9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4287,18 +4287,16 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 }
 
 static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
-			struct folio *folio, loff_t pos, unsigned int len,
+			struct inode *inode, pgoff_t index,
 			block_t *blk_addr, bool *node_changed)
 {
-	struct inode *inode = folio->mapping->host;
 	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
-	pgoff_t index = folio->index;
 	int err = 0;
 	block_t ori_blk_addr = NULL_ADDR;
 	bool cow_has_reserved_block = false;
 
-	/* If pos is beyond the end of file, reserve a new block in COW inode */
-	if ((pos & PAGE_MASK) >= i_size_read(inode))
+	/* If index is beyond the end of file, reserve a new block in COW inode */
+	if (((loff_t)index << PAGE_SHIFT) >= i_size_read(inode))
 		goto reserve_block;
 
 	/* Look for the block in COW inode first */
@@ -4480,6 +4478,61 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 	return 0;
 }
 
+static int prepare_large_folio_atomic_write_begin(struct inode *inode,
+		struct address_space *mapping, struct folio *folio, loff_t pos,
+		unsigned int len)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	size_t ori_off = offset_in_folio(folio, pos);
+	pgoff_t start, end, index;
+	int err = 0;
+
+	len = min_t(unsigned int, len, folio_size(folio) - ori_off);
+
+	if (!f2fs_ffs_find_or_alloc(folio))
+		return -ENOMEM;
+
+	/* Inline data must have been converted before reaching here. */
+	f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
+
+	start = folio->index + (ori_off >> PAGE_SHIFT);
+	end = folio->index + ((ori_off + len - 1) >> PAGE_SHIFT);
+
+	for (index = start; index <= end; index++) {
+		block_t blkaddr = NULL_ADDR;
+		bool node_changed = false;
+		size_t off = (index - folio->index) << PAGE_SHIFT;
+
+		err = prepare_atomic_write_begin(sbi, inode, index,
+						&blkaddr, &node_changed);
+		if (err)
+			return err;
+
+		if (f2fs_ffs_test_blk_uptodate(folio, index))
+			goto balance;
+
+		if (blkaddr == NEW_ADDR) {
+			folio_zero_segment(folio, off, off + PAGE_SIZE);
+			f2fs_ffs_mark_subrange_uptodate(folio, off, PAGE_SIZE);
+			goto balance;
+		}
+
+		if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
+					   DATA_GENERIC_ENHANCE_READ))
+			return -EFSCORRUPTED;
+
+		err = f2fs_submit_page_read_sync(inode, folio, index,
+						blkaddr);
+		if (err)
+			return err;
+balance:
+		if (f2fs_balance_fs_folio_locked(folio, mapping, node_changed))
+			return -EAGAIN;
+	}
+
+	return 0;
+}
+
 static int f2fs_write_begin(const struct kiocb *iocb,
 			    struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop,
@@ -4569,12 +4622,15 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 */
 	f2fs_folio_wait_writeback(folio, false, true);
 
-	if (f2fs_is_atomic_file(inode))
-		err = prepare_atomic_write_begin(sbi, folio, pos, len,
+	if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
+		err = prepare_atomic_write_begin(sbi, inode, folio->index,
 					&blkaddr, &need_balance);
 	else if (!folio_test_large(folio))
 		err = prepare_write_begin(sbi, folio, pos, blen,
 					&blkaddr, &need_balance);
+	else if (f2fs_is_atomic_file(inode))
+		err = prepare_large_folio_atomic_write_begin(inode,
+					mapping, folio, pos, len);
 	else
 		err = prepare_large_folio_write_begin(inode, folio, pos, blen);
 	if (err) {
-- 
2.43.0

