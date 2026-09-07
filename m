Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CF242E413
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796226; cv=none; b=IysW2uO8uZNiRvrd0Xg4bjcLoxCFlYvLDFHDCw+b/Q5epQJfFPLVrSwNUD5Q+bjHeBy+OZxueZGnkgOU2NJZwd6mcMQGzOx5HVqszu3MF073LmslQtQHWSuhAWd4WEw0Ipnx2kt1+YS67YD3KG+v0d5nRUDf+PKFokTvBEv5FOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796226; c=relaxed/simple;
	bh=vt3/GLdkqF3afqkWs5bD++qOSQPUoFCUoFmsZSprhxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVErvMdQjp27/wCwTPebxS0toZl9DjjykUgcC4SnZjzubxDx35PGEuc8+yu+G3uI8gH+xotWbSXqv6y9WDoUIBqLf2L0tIEUk48GuXuUz8DgWVGitGWKfqlPwqrFOPeYgD7C0eQ4O8EVEZFyMSrcvS9SPDG0y/LkM/3JHdAjLYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoY97u1E; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoY97u1E"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-39b52169dacso1288063a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788796224; x=1789401024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUfc4qmUKrPTEeHzQTps11pHyOKUxPdOgLrGFFPk0Pg=;
        b=WoY97u1EQDywkYkR2CSwNze1eWnYRs7QWZJhelrFN3H1dgLi4VcLjRC6AKPWhpNzw7
         qC0BxgSuqlPsAtOw8O4TfOD0072P3ygNgQNJCogIbSClJWiBO2zJ0Qm6DcT87/qYsPO7
         RRSNGsUUACqCfbdQsY20Szla1tVqeV6QbnSOgYQQY5bjSNJ5XiGfOjP2WJT+E3hLQRYD
         n51h5FkX7Nw9pUxlnopDWWJzb7Knq3QARAf0hIH1WXTcsdx9Cj1CZ0Opm64u+E5MCrnR
         j2ft1DOfV/nam12fkeql2phAJZL5axFBT5Pz2GfM2JdZCe/ekdMcZQMfVXk5VV7+HwzA
         qxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796224; x=1789401024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUfc4qmUKrPTEeHzQTps11pHyOKUxPdOgLrGFFPk0Pg=;
        b=a4xh6rzQ7zfaYdKoWIaWyr45DUiTPzoKuM5rtoYMUzXf1kLwWXr/XGfsSV4XGViwcK
         c/Z5qNJqb7J+KlybbUfl+MySYVx25SYQJGddUeFoQug+XbgdTN59cwTEo4yv2YrDDJ6e
         wwKW2q07A7SnOrwYwk/+x740GjcDKH2QOrZVNgM/KLstE8JQA4m94wLOE33+NeDtupZV
         povq279R5e6CsgQy2nhjcX59c3h5L07Dn5IzYSIZG2euRNAxjyA7jAUhrfR4/zkeK/0d
         zYJSJoti7K3+ru4F8t1ySTVGjuEeSr0DR4e5hirfARgZg+K3Dlgf64m/FNFTHrWszBxf
         z3PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwROOur5d7OZjiil+8+TrkhMF2p/VsyOOLwlWDPzO1JAIMy1GmCM91icoSko8u6qYiVd4uPKBU5GJKy9Vc=@vger.kernel.org
X-Gm-Message-State: AFuF++nEaEPbJSnT0n8tTHVLjt96LOVquVUmQDuoWKmo+D7rwEw47esO
	IMKLODjxQz+lKjyHDPMNrIHKiApVWdTL7XU+wckhrLG3dF4exND8/Zpd
X-Gm-Gg: AYBFou0/CzWnGfC2KU8A2Ihuh3vh801cvd4IKI1Nm/SH4i3ejbDUt7Mg/zoLxblGlHP
	OROwdVws6p/BYqr89ImLfApymvuAz/SULM4yqRKf0cLjmASiJ7SMU47MbQIOxotrot0mD0wk2my
	QykcXXW4ACdD3I2aHUX9sOvuuaEtTs6q9NyTYmQgYGzyGN1K7MRRjtlo6n911ue+XwYH5cXweiw
	VZbL3+zPAiZEy+5emEGo6KmQA24XNL2iYJICintmqXdXYKUXppIlIkAPGn7aPgoug7pc53ijoad
	phDkhA6HNXQce3cR7+w5N69XFWjNIljXNgSXXgLpnymYOMH9JiLcfCsh94xWdQybCArytefGGqW
	2cogl/CY2VU1yASaMVI0mv4Cui1hRgLvmTjDD9vg3MJJpPQsPR8N/nCkOz1MdMpF5f9y1T7PIGr
	iOUxbiB0+5korSdhL+5gF+7jn1g+CQkf7ctwqOiMD8e8F05fLXLEjR1kjfwXQFF0pVsr6sEd5kn
	2qBhQ==
X-Received: by 2002:a17:90a:d2c6:b0:395:4de4:92c7 with SMTP id 98e67ed59e1d1-39b260d2f07mr35980764a91.3.1788796223638;
        Mon, 07 Sep 2026 08:50:23 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:f6f8:5cb:5f1:8555])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b3312f9a8sm19012359a91.2.2026.09.07.08.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:50:23 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: tytso@mit.edu
Cc: Jan Kara <jack@suse.cz>,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ThangNN99 <ngocthang2710.1999@gmail.com>,
	syzbot+03afbb29537f0336b7ad@syzkaller.appspotmail.com
Subject: [PATCH v2 v2] ext4: avoid buffer/folio lock inversion in __ext4_get_inode_loc()
Date: Mon,  7 Sep 2026 22:50:17 +0700
Message-ID: <20260907155017.75543-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906104841.56075-1-ngocthang2710.1999@gmail.com>
References: <20260906104841.56075-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__ext4_get_inode_loc() looks up the inode bitmap bh while holding the
lock on the inode table bh:

  __ext4_get_inode_loc()
    lock_buffer(itable block)
    sb_getblk(inode bitmap block)
      __find_get_block_nonatomic()
        folio_lock(bdev folio for bitmap block)

whereas block_read_full_folio() (e.g. userspace reading the bdev inode
directly) takes the same two locks in the opposite order:

  block_read_full_folio()
    folio_lock(some folio)
      lock_buffer(bh in folio)

With blocksize == foliosize this can't overlap, but once foliosize >
blocksize the inode table block can land in the same folio as the
inode bitmap block, and the two orders deadlock on each other's lock.
Use the non-blocking cache lookup for the bitmap probe instead; a miss
already falls back to make_io exactly as before.

Only ext4_reserve_inode_write() reaches this probe with a real inode
(ext4_iget() passes NULL, which skips it), and it normally runs right
after the read that loaded that same inode, so the itable buffer is
still warm and the early "already uptodate" return skips the probe.
The window needs the folio reclaimed between load and writeback, which
is why this is rare and why syzbot's bisection could not pin it down.

Reproduction status: root-caused from source and confirmed against
both syzbot stacks (inode.c:__ext4_get_inode_loc vs.
buffer.c:block_read_full_folio); the lock_buffer()/reserve_inode_write
path was exercised live (orphan cleanup on mount) to confirm reachability
and to confirm this patch introduces no regression there. The deadlock
itself was not reproduced locally -- doing so needs the itable buffer
genuinely reclaimed between inode load and writeback, which a small
single-shot QEMU test doesn't naturally produce.

Reported-by: syzbot+03afbb29537f0336b7ad@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=03afbb29537f0336b7ad
Reviewed-by: Jan Kara <jack@suse.cz>
Signed-off-by: ThangNN99 <ngocthang2710.1999@gmail.com>
Assisted-by: LLM
---
 fs/ext4/inode.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index bd4b778df9eb..13e3cb829461 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -4942,8 +4942,12 @@ static int __ext4_get_inode_loc(struct super_block *sb, unsigned long ino,
 
 		start = inode_offset & ~(inodes_per_block - 1);
 
-		/* Is the inode bitmap in cache? */
-		bitmap_bh = sb_getblk(sb, ext4_inode_bitmap(sb, gdp));
+		/*
+		 * Is the inode bitmap in cache? Non-blocking lookup: bh above
+		 * is locked, and blocking here would folio_lock() against a
+		 * block_read_full_folio() that locks bh the other way round.
+		 */
+		bitmap_bh = sb_find_get_block(sb, ext4_inode_bitmap(sb, gdp));
 		if (unlikely(!bitmap_bh))
 			goto make_io;
 
-- 
2.43.0

