Received: from out-2z4y-a139.jellyfish.systems (out-2z4y-a139.jellyfish.systems [198.54.127.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9C53BFE4A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077290; cv=none; b=nV5YbdlkbLxZ1WMiN/xNmU0MmUDsX0xs2jB8s+SntZ4VT2bnxPxDOXsACyGSs66fOOkhaYKkMTJSO3Kj0Va+5JiE/ZOLFbEjPa+wfYgXlD6Yc/CLxG678Vlw03SMa0j6QE8xlTdB0qDxmKbjhu8PUStDkpxpBFCIkeWSdqDEPTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077290; c=relaxed/simple;
	bh=rZlMlEgUOKkJ42QPQ0hke9Wo1CT6eaOpPAYTZymSOiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=psQPrSRwxZELzRstHX7JpZsig9ShDg47EqbTGz5AH2/W5n9lmp29jHbpq33Nyvp35Ze/HFxpQRpkqQj/TgntefGFyWUu8H9GPODyn0OO80oTQpuqDhT+htO0apxkbuO/crmYsrrZswCsTPQ3Zqzq9jiFWYO9B6OSHKWqbTnwjHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eltavine.com; spf=pass smtp.mailfrom=eltavine.com; dkim=fail (0-bit key) header.d=eltavine.com header.i=@eltavine.com header.b=BMWL15PQ reason="key not found in DNS"; arc=none smtp.client-ip=198.54.127.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eltavine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eltavine.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=eltavine.com header.i=@eltavine.com header.b="BMWL15PQ"
Received: from localhost.localdomain (unknown [188.253.121.98])
	(using TLSv1.3 with cipher TLS_CHACHA20_POLY1305_SHA256 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA512)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j5B0W6htzz2x98;
	Thu, 15 Oct 2026 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eltavine.com;
	s=spacemail; t=1792076033;
	bh=v20J6Lj3iauircsktxZXY7nk0wbgpGdU6Gg01D0XwZg=;
	h=From:To:Cc:Subject:Date:From;
	b=BMWL15PQp2x6A+290OewB5aYU5xZCWpCVCDMDZbuD103TKtkPJ0bdnydWY8jybPnD
	 WUXnfeEVpmZQKmLyOvSK9MDeISQb4KpHrpS19LLDNXQUqFHFltOc0RvI1BjpL0bg9r
	 ZCp8CbTeucr4bFCdpnJc+qOA+XSqXv4AQwKRErtVZNsqVXB/G6wHV/2YALRyPeaHnD
	 yAe58FtAZybg+uHESZP3C7mRBobf00g45LIx246urKKDJ5i4vxPRDdJfrArQ6+UREy
	 tUV34nbSqK7hjVq8AOo3oCLdyqDF2hpMPT2526QVBjp6Fyc6jKr9h27KNFAGKE1YZz
	 iJgOXobfP/rxg==
From: eltavine <me@eltavine.com>
To: Richard Weinberger <richard@nod.at>,
	David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Leonid Arapov <arapovl839@gmail.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com,
	syzbot+48f2d47f83a4c223ad14@syzkaller.appspotmail.com,
	syzbot+e4484dcf0982d86ca2e1@syzkaller.appspotmail.com
Subject: [RFC PATCH] jffs2: disable empty summaries instead of calling BUG()
Date: Thu, 15 Oct 2026 22:53:41 +0800
Message-ID: <20261015145341.34322-1-me@eltavine.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: me@eltavine.com

With CONFIG_JFFS2_SUMMARY enabled, jffs2_do_reserve_space() tries to
write out the current block's summary when a node and its summary
overhead do not fit. jffs2_sum_write_sumnode() assumes that at least
one summary entry has been collected and calls BUG() otherwise.

An empty summary is a valid state. For example, the syzbot reproducer
mounts an image whose selected nextblock contains only a cleanmarker
and padding, leaving 140 bytes free and no summary entries. Creating
a symlink needs 128 bytes for its inode node, but reserving another
60 bytes for the summary reaches the BUG():

  kernel BUG at fs/jffs2/summary.c:868!

Large pristine-node GC reservations and xattr updates that fail after
reserving space can also leave a newly selected block with an empty
summary and reach the same check.

Disable summary collection for the block and return through the
existing exit path. jffs2_do_reserve_space() then retries the
reservation without summary overhead, following the existing fallback
for a summary that does not fit. Use dbg_summary() for this valid
condition.

The block is scanned normally on the next mount. The on-flash format
and xattr size limits are unchanged.

Fixes: e631ddba5887 ("[JFFS2] Add erase block summary support (mount time improvement)")
Reported-by: syzbot+0727f46a0571de01bf93@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0727f46a0571de01bf93
Reported-by: syzbot+48f2d47f83a4c223ad14@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=48f2d47f83a4c223ad14
Reported-by: syzbot+e4484dcf0982d86ca2e1@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=e4484dcf0982d86ca2e1
Cc: stable@vger.kernel.org
Signed-off-by: eltavine <me@eltavine.com>
---
Validation: Built fs/jffs2/ in an arm64 Linux VM with GCC 13.3 (W=1),
with and without summary support; the latter warns about unused vecs
in writev.c. Not runtime-tested.

I'm working from an arm64 Mac and don't have a physical Linux test
machine available. Sorry for the limited testing; I'd appreciate
review and help running the reproducer:)

 fs/jffs2/summary.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/jffs2/summary.c b/fs/jffs2/summary.c
index 4521a7723f30..4a07b7911b21 100644
--- a/fs/jffs2/summary.c
+++ b/fs/jffs2/summary.c
@@ -864,8 +864,11 @@ int jffs2_sum_write_sumnode(struct jffs2_sb_info *c)
 		goto out;
 
 	if (!c->summary->sum_num || !c->summary->sum_list_head) {
-		JFFS2_WARNING("Empty summary info!!!\n");
-		BUG();
+		/* Nothing collected yet, e.g. freshly opened jeb */
+		dbg_summary("empty summary, disabling it for jeb at 0x%08x\n",
+			    jeb->offset);
+		jffs2_sum_disable_collecting(c->summary);
+		goto out;
 	}
 
 	datasize = c->summary->sum_size + sizeof(struct jffs2_sum_marker);

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
