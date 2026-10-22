Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662499;
	b=Og9gCBcaiKCRGGGNaFPgm1vHuBDWuavAjO+DzbutZgLYm9Rz1kGi+2JlatyqrvmskU6p
	 UEepmZmfnm5O/WrcWz4HAkTJKKnW9dHcv7vNNNGemuelLS1W1EqyjbZpPnlyc2TdxR1rh
	 Xb9rPIZ7CT/JwrXNpNHC1FYBtn1RN4EbOzvX4m52kyuz+bv33LL5ApdsQP1geggjCsbCI
	 +ydayxCWMGoLd1lqpsMMXkwkQjqGYnM6upXviJnXp6HiMZCPgMKfGeg6gBb3ElGD/BZbW
	 nVug421X3fpGjnjBatQVGFUgQmuSihCPTw79FsChKy4g1qZ+5U386XeDXf9e9IzgppA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662499;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oN8PfD05VLTwYnGCsKQJvPE9xhzFQ5FE7iidQLuHzxo=;
	b=m/5QVVULW7kXy4tfEvLapEuqc8eoCi6qNkvBq+jn5IGTgJQG0jV1NR9mF5gwQQjNyXz6
	 aRmr7XN8pnwBcF5c9DzxCK8YDJpL2oVW2FyqT6Ci2fVg8Iu2CSg1M+DvanYFYgStyUIwQ
	 j8NRq52wF5HERTJSbDuKvtfnuRKCy/NK538FTqO14ZS8pxWtYM9RkVrc0zZ/02ciuizYc
	 H0vxWpcYxQP6CT5YB/J73hstNMJWmBxlWZgejoAu0CSNZzxcW7cKClbqzzlqbUjtbOA8c
	 c1ufgJlqFV97YGnDAFIMfZ96KcxryBQkm6z7CzeYLQfiu5+V3r8puBypp1sBV67sBUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p1FMBSU0;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA04B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA04B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=p1FMBSU0
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso894408a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792662498; x=1793267298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oN8PfD05VLTwYnGCsKQJvPE9xhzFQ5FE7iidQLuHzxo=;
        b=p1FMBSU0TaOjh5DxAI3vbawcKd6jTOEZqhYCokNg4HzZ1vatFmVQxcFPLWMJ18YG/B
         sXCYdl41QuTmU/6IzkZYcRKPtRHvMj+A2jYl34GAKlT9mgg8emy6CUGQEeXKUPLIqPtE
         aMjHSfnarW7NOwmH1BFevNRd6FsPi+Kleee29FZH9TFA0FuopZ4/VShhsuk9QjX3ZcYw
         v8oHDVb2YmHSJj6QnJK5awzYymsOoZvBJmJ85qdA/ngJd3Q9lUXuMy3CmEo+rFHy15bD
         sey+V6JZZNfxh+FL34T88SYpMY9Bqmfcji6J2cEXp3kEjWv6VWCQQHfyrQv93vdAespT
         KWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662498; x=1793267298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oN8PfD05VLTwYnGCsKQJvPE9xhzFQ5FE7iidQLuHzxo=;
        b=JYrkObuMdzYawWgdviO7QZOEnf4ChPvMWVNkhOL/p79T0fZqEw1LM+5aVjauB1g9Dh
         mwDfAyyfoj4Y0QK33d7Ux+6dblnZ7ugiV49giog9+KOtPh09gfk0g225iRUJgqOZqC6m
         iRtJsV39bYFWJWXt3CTQmLl+1JT+K1CMKL5UltnqWBgGpUA88/y7mG3c2jUEARYeh5FK
         t2ix2PlHG+UpXWY3cY3Yj/A+2UlUAQQUtDsFar7IrXqo37PlpjRjofREP9ZkQKdbS4Q8
         xziRcXdT+j8HyfRGo/KvTPvJWyAdWjhSSL1OQGjf0/D7RowdepYgUXh1lMq28qzchWOs
         kGrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRpeH1XmgMBozfUYUiuYqmH+W4T7hd2k6Jq6YBByympK9FVlPChZpmK+Q0IVO44y81cMY6NsYgX/BB1Jo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvFR9unqpQVtvRKGXaysvdjl5yxOYPOtg0rEvY5PPJKK50JTjm
	RZfIzmWcFdhFUyVld3hoNHcWqx6s9zqCawLYXOV4nuG/FJ9BTIJ1XDUc
X-Gm-Gg: AYBFou3pDYbgcQqUBZbNvDziLVpiCQNuUrjTct6DFp/3JXpk/gjljOSAefzN59REBP3
	lJD3ep2sLCtbF+A9IbSOwyp0/2pt0YCEMqeaYmhkMRA73+nNcfFk7Hr7lIjht3RxsyagwM6gmGd
	psM5Ictl/d41YwXSDLEiOgd/mcnPguBmzfR4UaleC+XVveg1osyxZGBnOho/CZn4MKUj1Fq3/rY
	4TT5uGaA6tI3EWOaoLfPJXxu7dtkC7FesaMfVZOBIhnuvH7GVLZZk63mHqjr7wSibRsNOhGhnPn
	jqBuDQVtaLDIFgOINpiAkKEueTlMyhm3uVCiFyduvYYmB25HE2ET2VTY1Bm7/1Bzfo7ZBTPOthe
	vblDOCyExuABYV2HM7HGPzggDAGTgJ4scpDu9jjaeA13qZohBBjx6jq5exJQO5Fz2JbhH0iudyQ
	JDukF6kgRcy9tKDdDrwJLVPBct1GKQ0/MFQT651WRepduDXJU4Be+Py23n56/ave/4LnEpK6GQs
	cXlmjqldxWJPZLIbKpyV1KHm8PJdkkIEfnIjHyvzTVvuXddZ5A+atnh+8FQ0q1Jst92vRlY
X-Received: by 2002:a17:90b:4c52:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3ad86ef4b3amr3428235a91.43.1792662498181;
        Thu, 22 Oct 2026 02:48:18 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4954979sm3480681a91.17.2026.10.22.02.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:48:17 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2: validate move extents against a stable EOF
Date: Thu, 22 Oct 2026 17:48:12 +0800
Message-Id: <pm-ocfs2-move-extents-isize-rrw-v3-b2a7508c41108cc2d00b@gmail.com>
X-Mailer: git-send-email 2.34.1
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

ocfs2_ioctl_move_extents() checks and clamps the requested range using
several unlocked i_size_read() calls. It takes the inode and cluster
locks later in ocfs2_move_extents(), without rechecking the range.

A concurrent truncate can move EOF below me_start after the first check,
or shrink it between the range comparison and subtraction. The latter
can underflow me_len. A truncate after the initial clamp can also leave
the range extending beyond EOF when extent movement starts. In addition,
the me_start + me_len comparison can wrap for a large userspace length.

Use a helper that reads EOF once, checks me_start first and clamps me_len
with a subtraction-based bound. Normalize the defragmentation threshold
using the same snapshot. Keep the early ioctl validation, then repeat it
after taking the local inode lock, rw lock and cluster inode lock, once
the inode size is stable and refreshed. This rejects a start beyond the
current EOF and bounds the range before selecting or moving extents.

Fixes: 53069d4e7695 ("Ocfs2/move_extents: move/defrag extents within a certain range.")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/ocfs2/move_extents.c | 49 +++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 17 deletions(-)

diff --git a/fs/ocfs2/move_extents.c b/fs/ocfs2/move_extents.c
index ad1678ee7cc4..ab08c273ca52 100644
--- a/fs/ocfs2/move_extents.c
+++ b/fs/ocfs2/move_extents.c
@@ -907,6 +907,30 @@ out:
 	return ret;
 }
 
+static int ocfs2_validate_and_adjust_move_range(struct inode *inode,
+						struct ocfs2_move_extents *range)
+{
+	u64 i_size = i_size_read(inode);
+
+	if (range->me_start > i_size)
+		return -EINVAL;
+
+	if (range->me_len > i_size - range->me_start)
+		range->me_len = i_size - range->me_start;
+
+	/*
+	 * The default threshold for defragmentation is 1 MiB, which
+	 * matches the maximum OCFS2 cluster size.
+	 */
+	if (!range->me_threshold)
+		range->me_threshold = 1024 * 1024;
+
+	if (range->me_threshold > i_size)
+		range->me_threshold = i_size;
+
+	return 0;
+}
+
 static int ocfs2_move_extents(struct ocfs2_move_extents_context *context)
 {
 	int status;
@@ -936,6 +960,12 @@ static int ocfs2_move_extents(struct ocfs2_move_extents_context *context)
 		goto out_rw_unlock;
 	}
 
+	status = ocfs2_validate_and_adjust_move_range(inode, context->range);
+	if (status) {
+		mlog_errno(status);
+		goto out_inode_unlock;
+	}
+
 	/*
 	 * remember ip_xattr_sem also needs to be held if necessary
 	 */
@@ -1028,27 +1058,12 @@ int ocfs2_ioctl_move_extents(struct file *filp, void __user *argp)
 		goto out_free;
 	}
 
-	if (range.me_start > i_size_read(inode)) {
-		status = -EINVAL;
+	status = ocfs2_validate_and_adjust_move_range(inode, &range);
+	if (status)
 		goto out_free;
-	}
-
-	if (range.me_start + range.me_len > i_size_read(inode))
-			range.me_len = i_size_read(inode) - range.me_start;
 
 	context->range = &range;
 
-	/*
-	 * ok, the default threshold for the defragmentation
-	 * is 1M, since our maximum clustersize was 1M also.
-	 * any thought?
-	 */
-	if (!range.me_threshold)
-		range.me_threshold = 1024 * 1024;
-
-	if (range.me_threshold > i_size_read(inode))
-		range.me_threshold = i_size_read(inode);
-
 	if (range.me_flags & ~(OCFS2_MOVE_EXT_FL_AUTO_DEFRAG |
 			       OCFS2_MOVE_EXT_FL_PART_DEFRAG)) {
 		status = -EINVAL;
