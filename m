Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792985892;
	b=2okD1egaOSkG5nQXV9mUnA/LR+PRSagvd0yPGz9vbYgVSTOTJ+iD1HId514mF6k1eoAo
	 FajI2hFksHX59wCMs/TT5ri/PwGEhvF2/HUuoh/JOmTE0fs9TtReuUNufyEjBFPiGhTyc
	 5b++pY27XHy/XEQhGEQbhUCsxrw7w70+qpZGg9WEDitJOW7eOVMerk2aY5eHGKXiY4D3R
	 BxTToF0cfL9fxK3vPnB01LgTdwR3S5hjytzKeo3TxvXhFW5mMyKjXmpttU4R8Os5wpU5y
	 5DtcBwJV+dGifq9mz50caKicb081jZXiGLRfHgJcEryBgtwf6r46r59o5d7JcEQIG0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792985892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jgsLRy03IEgL4aMJC+EcAk/qE7gSd5NIpNv79raGAYk=;
	b=E4jejmqr24UfeTCWJAYpniHiteiQV2QqsiH+FV7yRctDJ0B9Efzb4PgP5NlRRW4ZEFEa
	 hUQ+6XmOuxm0YyQ/G2Qwom1FspqCmzPyWhqjvsdoknYqSod37oX2+qPh7s29sHBArpmJF
	 FiYe95TT/hhEhe2TrorqCyjd68Cs44ZD7+/tW36QvDIVFkzlcBpUls9aUwRQAXp8dqeO4
	 InxxwEfFyGIysGuMLWJr3uXU0kM8hERLlO8BTXj+mrZXlszi6JqdDmZQeYDA2LePPqSOm
	 0kwANO42EYgMPaWRBjYd4DnI/7KVP3Yh67K4FPCueJFwSd9MUy1cmiomSL9+13zYGSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYCaArce;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAAA606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAAAA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qYCaArce
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3ad6011ecebso455742a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792985891; x=1793590691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jgsLRy03IEgL4aMJC+EcAk/qE7gSd5NIpNv79raGAYk=;
        b=qYCaArceIJrSZdchQ+zLWKXBXsoLSB1knrwVXGgqLQlIsJTtj7+iBbTD+1P6Mo3886
         te4q7LEzosPlO2Nswd0EGa7UpsH4hUm4A8C9X6O/cGzwLTWEmti1os8tjISP2Q5HUNG2
         YKyiarvmp+pj0OH2c352kQaDh3OBpRDhM/iLv34KJAyMJMFJoK1H56rVQWCC+GomUHM0
         A80ebsuFAintPGxf82pQr88IcDzJJaoVz7kCNOPzkoEN+JkkQbUGA9LKB1AcFrZTvTdG
         LukWOlg60BgxCLCLRWExRWI/8363xj4AiK6/w3FjMQcZhLx6V63zN6i/I4qM6EwJ3dra
         L4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792985891; x=1793590691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jgsLRy03IEgL4aMJC+EcAk/qE7gSd5NIpNv79raGAYk=;
        b=dzmS0DPHo2NlVbs99sMqIWsSkDZJpWT5hDvSmNdIFMsAT93RsuDAu2JzexLb1668lO
         llGmN7y8AFj5701hff6i75jxA5XOHf5ZkO/YX8kwwatswa2TcNlcn0stwi7ACQrVq+h+
         +66mOvGpELZebS4QKt4qbQhVm1rL3bXOZ4zFE41atEkCx65DNvMg4guSU9DXcv0KfeVz
         SeTMZqKEIDlMeV68RoL8gQaUKjfzIODuw/1JMyt+iK7olsW7vEYAq0wKJRoCq9Y3JPrW
         73AHBNvTPDKy8+eclmnPwdsJKCAeDypKPeYXwHCyTqEwszBSH9sMOdrC/50YXmV8TjZK
         y9ng==
X-Forwarded-Encrypted: i=1; AKwUvBzAwBg8J50oyf/LOMIXzcloZkUaVE6Xf3XWKmYLiH3kY3T5I62AZ9W4Oqj7VLdWqbGNUezdUN6U4IalRUQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVLMsj6+xQj3UCx/H3JZCvVyO6W2g2RivSguwU3Sg9cG/APVMc
	8l+E8jow+kcw5MPabJxh/dFviCJSkWueQ2tekCddPfo2F7Dwr4u/WHfO
X-Gm-Gg: AYBFou1xnPScjm+xCL6BEBf83DriJu1ofytpqJ+D/ASo418rGUva+bzAP/oUtKqaDQL
	eBix4SnpvX5Pjr2wzwH3/s+jhYK+jg2PWAaJ7pbUlVXJ86iFkg8frCakr/nk+7zIOkE+soajb5F
	WRjXgd6vKdiblsO9/XshP8thhtaZRTTRA5XmX6ZvjHpyaxLmhijaeiTqI/Ey3I7MLtqAcj0qq8y
	A1HBgwamviQH552htQMIk27gBVlv4yeQGMfrM1R0xsdqM4REImhkSp1gePMF5MtWWo5FXl/rhk3
	t96yNAPO0fxkq/xB6TVarggkN/9EyaD5KCab1UHH1DFSurAu/IdgTEmt6pR7uOEj5RA7qZwx3eP
	IZ7J7JxYjoKzn2ljijLSMHOGf4XxWJlM0xtFzuQygJj9S6EVBFN8tMiOvPdtBvEP8VoxwMGPjkq
	fBzzsRTnTpVgdFd0b3V8obLfbq09kVfFcZS4+OArJLFs1cb/vkBZ/2CeUxYpxyEctbcd3tLIW5l
	qBXL6zWX3X6SQKi5AJykb2ayxxIoU7+jxNShtjRhr/kWl4pc49KErZbg5azUuAMGP34/RZw4fUJ
	5QrHPgZdEmvELj9rYA==
X-Received: by 2002:a17:90b:1b0e:b0:3ab:9c73:12f with SMTP id 98e67ed59e1d1-3adeaae626amr4994238a91.24.1792985890961;
        Sun, 25 Oct 2026 20:38:10 -0700 (PDT)
Received: from nzzhao-ThinkCentre-M760t.mioffice.cn ([43.224.245.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0b2sm6409823a91.8.2026.10.25.20.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 20:38:10 -0700 (PDT)
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
Subject: [PATCH v7 04/15] f2fs: support atomic file large folios buffered write
Date: Mon, 26 Oct 2026 11:37:34 +0800
Message-ID: <20261026033745.784107-5-nzzhao.sigma@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
References: <20261026033745.784107-1-nzzhao.sigma@gmail.com>
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
 fs/f2fs/data.c | 86 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 76 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f01bf06a77b0..126cad81227f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4305,18 +4305,22 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
 }
 
 static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
-			struct folio *folio, loff_t pos, unsigned int len,
-			block_t *blk_addr, bool *node_changed)
+			struct inode *inode, pgoff_t index,
+			block_t *blk_addr, bool *node_changed,
+			bool check_reserved)
 {
-	struct inode *inode = folio->mapping->host;
 	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
-	pgoff_t index = folio->index;
 	int err = 0;
 	block_t ori_blk_addr = NULL_ADDR;
 	bool cow_has_reserved_block = false;
+	bool append = ((loff_t)index << PAGE_SHIFT) >= i_size_read(inode);
 
-	/* If pos is beyond the end of file, reserve a new block in COW inode */
-	if ((pos & PAGE_MASK) >= i_size_read(inode))
+	/*
+	 * On the first attempt, an append write can skip the COW lookup and
+	 * reserve directly.  On retry, check the COW block first so the same
+	 * block is not reserved and accounted twice.
+	 */
+	if (append && !check_reserved)
 		goto reserve_block;
 
 	/* Look for the block in COW inode first */
@@ -4330,7 +4334,7 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	if (*blk_addr == NEW_ADDR)
 		cow_has_reserved_block = true;
 
-	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
+	if (append || is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
 		goto reserve_block;
 
 	/* Look for the block in the original inode */
@@ -4498,6 +4502,62 @@ static int prepare_large_folio_write_begin(struct inode *inode,
 	return 0;
 }
 
+static int prepare_large_folio_atomic_write_begin(struct inode *inode,
+		struct address_space *mapping, struct folio *folio, loff_t pos,
+		unsigned int len, bool retried)
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
+						&blkaddr, &node_changed,
+						retried);
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
@@ -4508,6 +4568,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	struct folio *folio;
 	pgoff_t index = pos >> PAGE_SHIFT;
 	bool need_balance = false;
+	bool retried = false;
 	block_t blkaddr = NULL_ADDR;
 	fgf_t fgp = FGP_LOCK | FGP_WRITE | FGP_CREAT;
 	unsigned int blen;
@@ -4587,16 +4648,20 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	 */
 	f2fs_folio_wait_writeback(folio, false, true);
 
-	if (f2fs_is_atomic_file(inode))
-		err = prepare_atomic_write_begin(sbi, folio, pos, len,
-					&blkaddr, &need_balance);
+	if (f2fs_is_atomic_file(inode) && !folio_test_large(folio))
+		err = prepare_atomic_write_begin(sbi, inode, folio->index,
+					&blkaddr, &need_balance, retried);
 	else if (!folio_test_large(folio))
 		err = prepare_write_begin(sbi, folio, pos, blen,
 					&blkaddr, &need_balance);
+	else if (f2fs_is_atomic_file(inode))
+		err = prepare_large_folio_atomic_write_begin(inode,
+					mapping, folio, pos, len, retried);
 	else
 		err = prepare_large_folio_write_begin(inode, folio, pos, blen);
 	if (err) {
 		if (err == -EAGAIN) {
+			retried = true;
 			f2fs_folio_put(folio, true);
 			goto repeat;
 		}
@@ -4604,6 +4669,7 @@ static int f2fs_write_begin(const struct kiocb *iocb,
 	}
 
 	if (f2fs_balance_fs_folio_locked(folio, mapping, need_balance)) {
+		retried = true;
 		f2fs_folio_put(folio, true);
 		goto repeat;
 	}
-- 
2.43.0

