Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424866;
	b=h3Zwy1+N7tny5CPWWLYlyDoSiqS71m7pRykwyvDEPqjlTUTDmNiCJTS55LUw5TzxGWEQ
	 09b0Rk+SqrNox4oi9XdSfFGOxtsPq5IvzBSq+6zwepMvNboJxjGETMkrQ+rsxEDKMrS4C
	 iTWDUFUwL2ESi8nNcsNe+rBWc0BOd497y4qRHLv6i9/sEpEFZnPOqdRnJ6tiZaKSoNBmn
	 omEVLJw3h0QLj25rZaQmNwDyxQjx1VESpS0Jmpb1S38KzkbKmcMIWpNqUwwiJCDLC7Br4
	 6eGv5E9gQp1rUyvGN0i1uWHkT/Bsor0jdJBwYl1LLjTEwYoYkUDf4VVogsPsur0PvpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J4t4H89v7aV1e5EzzyxhnG8qiUcpvGcd+ixs31MkbCQ=;
	b=fYTeoMJ0XYdzqM+/CQ/9bI+hFd1mZTPUJQw5Fbr5H6jGbXvdpiBmjRRzP8qAS8qtUvcf
	 sCjwcJP/gUXQe1oR7PNi3hpzjM7VzJ3IATXKi3Abp8Wzpza/og3jpwwOmTEml9eXlGBFX
	 pDFrGf32CcB/l565WJqjG+9itG9Bw0VcoibQNtPcicVBpSTlc55D9HSvtloujVGQbX+q6
	 WVZdCkoNt41MtO1330VIEryRFDdafrNUDgDrpwbGlPtiCSAmkRkDaZZM0Fss10ISO1frh
	 Og0RT79sdXdfQaVwVwZZEYvy5SjcWlanxM0gcKo76+h/3raufulCWGCcG5QyDRIuG2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NyB55KG8;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED8606C93A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99ED8606C93A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NyB55KG8
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a07025cce4so486157b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424865; x=1793029665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4t4H89v7aV1e5EzzyxhnG8qiUcpvGcd+ixs31MkbCQ=;
        b=NyB55KG8d1iW+QLhXJyq11mQNA6PgfqLPndw/T7DFLnL+3R/NhJ6+y4gBc2uGctA01
         xKmOFn8XIhtJGBixvzTCHtnkV61Sj9DcejX1ndH1Kt4pO/Fo6BEhVB0eA+USc3HVtQHm
         r7UqpM5WGEpeX0jO/hGYhIrVEPhjWBaSxk6fCD5n/2vkH2sr3k5aL8OkxDSKwLvA8V3h
         oijTd9/iXWa91jWv1TAcMjBNrK0eUsgQxwg1t185OMgttjVC9+nCC2usntILM/kJRHfy
         n4tuZVc+HlDfZ3Zi54xcQX8QY/Di2EYiFV5C1vgeYbb5QbPjpJeAMgkHWTXDJfXdE1AG
         CdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424865; x=1793029665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J4t4H89v7aV1e5EzzyxhnG8qiUcpvGcd+ixs31MkbCQ=;
        b=gNrI7SrNHbsoVcXAjWScyloUW46X/o9kPaJjFmZFU3mwYXgTojV053zwvIUtNbWwNm
         ro+q+7ZozEywM2MsNzZ0XzRn9Z2ltK0P7IWmcSBxSe+USzXPZhRjCmrIdSwHmxnRcXev
         cd7a5JmqKgv5BrLDl6MkSC7+MXHj5XvQhiEFJrFe9VVuJ7mmY/T074hbycRkdeCspBYr
         si/rsnEG1o+Ot5+G0tS7xquOGAwrW3aj7Zf7BIo7BjMlYskkZqq6uoiENKByM3qewy88
         9Vqp8p8o5cPlLiDcmD3QYRA4XH/3N7tgkMhAPBxBojPvRFqwsAyse80qlwWrFLKuzMqG
         pnlg==
X-Forwarded-Encrypted: i=1; AKwUvBxgg94grx0MDt1mwPWThX/TlSlnkwB0NLPdRhFMGjRnXtMEikUsN4Q24H9980eLM4b4c72e0J4qtTJ40lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPGwZmsFd8Q/3vaA0cM/PgjDUGOkKAOK2YkpxdqRQetIsInF/P
	r5aszUQLv9vBqugyyLVCkl8A/UWsos+I2L4T1TxGi+WDFN+tM0opk9xa
X-Gm-Gg: AYBFou1Ith6u8SA8YvZU8yE1OVUHH4XVP8H0YF2y6GdqNjDR6qQmoQAcRMK+vcEa3Kz
	KLeRZfqFKr4lOAyh8zRLj7Vx96e734dfTCijfLL5MZBF5pfP4jz5M4Tp+e1jGcQ2jj8rGirtnPA
	bCwlbqblEZ4NqMpu4uIQ+UM0Is/F41KEEwu/QMYBvCH9Ps0OG5GE0RNKXNVhEhrXXugxUubggyd
	m2vMzOTBzMLo4EHAYJCONk4UeHOWyO+pLpGwp5aCx4NQKJM+Pj2+m8/KbGU0xat9YHcZtYDYRUb
	q83/MMDzw5vNJE6AExTRdTpsIGXvKXDSMM4tqtsXje3Z7e0vrbloYIH1A5NUvRWwNtEZXY00rww
	wZXQwjFSTqs85IHwrCQ5LSjZH7NoqUtEeg6/r4FupjWzqi8hMQ/NhHF/nKEVb1kW1wQS1xSbQBH
	3nU3yBGqyBkRfb7x28/caWk6M1WEi9tJUsErIbff3a/ML5ABeNMBTE5x8fYFRjBXq6La6cbe3/I
	BH9Ap60jUKnadI21ZQK
X-Received: by 2002:a05:6a00:7701:b0:89e:37b0:d1b2 with SMTP id d2e1a72fcca58-8a05742b68cmr4299138b3a.37.1792424864745;
        Mon, 19 Oct 2026 08:47:44 -0700 (PDT)
Received: from ustb520lab-MS-7E07.. ([115.25.44.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735e513sm4108693b3a.27.2026.10.19.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:47:44 -0700 (PDT)
From: Jiaming Zhang <r772577952@gmail.com>
To: jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com,
	mark@fasheh.com,
	ocfs2-devel@lists.linux.dev
Cc: r772577952@gmail.com,
	heming.zhao@suse.com,
	linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com,
	stable@vger.kernel.org
Subject: [PATCH] ocfs2: validate the block count of a local quota file
Date: Mon, 19 Oct 2026 23:47:32 +0800
Message-ID: <20261019154732.3149351-1-r772577952@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CANypQFbjcxXjiigMCCyErN=DSEh3ZG3NMWRpq=Hic8KJ76cwew@mail.gmail.com>
References: <CANypQFbjcxXjiigMCCyErN=DSEh3ZG3NMWRpq=Hic8KJ76cwew@mail.gmail.com>
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

Every ocfs2 node keeps a local quota file made of chunks.  A chunk is a
header block, whose bitmap marks the entries in use, followed by up to
ol_chunk_blocks() blocks of entries, and only the last chunk may be
partly filled.  The file header records the number of chunks in
dqi_chunks and the number of blocks in dqi_blocks.  When no chunk has a
free entry, ocfs2_extend_local_quota_file() works out from dqi_blocks
how many entry blocks the last chunk already has, and puts the new entry
right after them:

	chunk_blocks = oinfo->dqi_blocks - ol_quota_chunk_block(sb,
			chunk->qc_num) - 1; ... *offset = chunk_blocks * epb;

olq_alloc_dquot() then sets that bit in the chunk's bitmap, which fits
in a single block.  This is only safe while chunk_blocks is at most
ol_chunk_blocks().

ocfs2_local_read_info() reads dqi_chunks and dqi_blocks from disk at
mount time and never checks that they agree.  With one chunk and a
dqi_blocks of a few thousand, the last chunk appears to hold thousands
of entry blocks, and the bit lands kilobytes past the end of the bitmap.
A dqi_blocks below the last chunk's header block makes chunk_blocks, an
unsigned int, wrap around to the same effect.

The stray write corrupts unrelated kernel memory.  KASAN calls it a
use-after-free only because the page it hits happens to be free; nothing
in ocfs2 was freed.  Reaching it takes mounting a crafted image with
quotas enabled, which needs CAP_SYS_ADMIN, and creating a file.  The
issue was found by fuzzing and not seen in production, the reproducer
can be found in the linked report.

Check in ocfs2_local_read_info() that the last chunk has its header
block and at most ol_chunk_blocks() entry blocks, and that a file
without chunks holds only its info block, since the first new chunk is
placed at block dqi_blocks.  Refuse the file with ocfs2_error()
otherwise, as ocfs2_read_quota_block() does for a corrupted quota file.
The header block of the last chunk is computed in 64 bits because a
crafted dqi_chunks can wrap ol_quota_chunk_block().

Fixes: 9e33d69f553a ("ocfs2: Implementation of local and global quota file handling")
Closes: https://lore.kernel.org/lkml/CANypQFbjcxXjiigMCCyErN=DSEh3ZG3NMWRpq=Hic8KJ76cwew@mail.gmail.com/
Cc: stable@vger.kernel.org
Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Jiaming Zhang <r772577952@gmail.com>
---
 fs/ocfs2/quota_local.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/fs/ocfs2/quota_local.c b/fs/ocfs2/quota_local.c
index f55810c59b1b..bad913d8bc4f 100644
--- a/fs/ocfs2/quota_local.c
+++ b/fs/ocfs2/quota_local.c
@@ -678,6 +678,30 @@ int ocfs2_finish_quota_recovery(struct ocfs2_super *osb,
 	return status;
 }
 
+/* Check that dqi_blocks agrees with dqi_chunks in local quota file info */
+static int ocfs2_local_check_info(struct super_block *sb, struct inode *lqinode,
+				  struct ocfs2_mem_dqinfo *oinfo)
+{
+	u64 hdr_blk;
+
+	if (!oinfo->dqi_chunks) {
+		if (oinfo->dqi_blocks == ol_quota_chunk_block(sb, 0))
+			return 0;
+	} else {
+		/* Same as ol_quota_chunk_block(), but in 64 bits */
+		hdr_blk = 1 + (u64)(ol_chunk_blocks(sb) + 1) *
+			      (oinfo->dqi_chunks - 1);
+		if (oinfo->dqi_blocks > hdr_blk &&
+		    oinfo->dqi_blocks - hdr_blk - 1 <= ol_chunk_blocks(sb))
+			return 0;
+	}
+
+	return ocfs2_error(sb,
+			   "corrupted local quota file %llu (chunks=%u blocks=%u)\n",
+			   (u64)OCFS2_I(lqinode)->ip_blkno,
+			   oinfo->dqi_chunks, oinfo->dqi_blocks);
+}
+
 /* Read information header from quota file */
 static int ocfs2_local_read_info(struct super_block *sb, int type)
 {
@@ -733,6 +757,10 @@ static int ocfs2_local_read_info(struct super_block *sb, int type)
 	oinfo->dqi_blocks = le32_to_cpu(ldinfo->dqi_blocks);
 	oinfo->dqi_libh = bh;
 
+	status = ocfs2_local_check_info(sb, lqinode, oinfo);
+	if (status)
+		goto out_err;
+
 	/* We crashed when using local quota file? */
 	if (!(oinfo->dqi_flags & OLQF_CLEAN)) {
 		rec = OCFS2_SB(sb)->quota_rec;
