Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB873AD518
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498576; cv=none; b=mYI1hcbCtWJcWMi+WmEOER/b/fUbybKwWlnGBr561V0LL9DhZxuDmUTODQsVjkLAKHA4otp+BNsNmJ0Qxv8TfIcBBAx8pwh7HQBNRqvK7iGaumYCUhuDx3xdk+Y2bbV03H9ArxW8t1K/xozQNlfzj3AFbKXaHrLFj7rP2M0nDm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498576; c=relaxed/simple;
	bh=XDoDohKUT4MMZIf4IQQNH9bM3u5dtDfVD4p1Q9suYvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QR3XC2J7dS203KjnJ4OziAjJWAx4BcuTd0iTBNrsIHQvjcP7JL29wU8ZB9LzgRn8xDovl9tNvaun82SjuqwTv3Y68O6il1qvUoohKG+5uEjiquiVBahgkLsknKgr7n7Lnku7L84jQ1/FrTefkMoGe2TNkX6XNDK+4WdZMUUpt/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b=qNNTNICx; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everpuredata.com header.i=@everpuredata.com header.b="qNNTNICx"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-823545ce223so4837609a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 15:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1791498573; x=1792103373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZOtIgYM1WQR25wgZCSC/vXuzzOnva4ZKPnDOK4M6K0M=;
        b=qNNTNICxCbiAuiKfSfWFYX0vpLEo7MOXs7Io4597cFOAG+PDDxy9lJ1hAnnaZimJMd
         oY4eXNE3pWIepBgWQleR+Bzx7jcmBXxr4MstHPTWAZdTUWeahANwzK0Xzfy0u5cghujc
         X65NTME/PNYBb45/Mp0kqmHMUJKJyBQucNkzA8LaGdN0ZpgVkv0DhRnCDG+9nBPEb56m
         4SEFmkTpjX9KbsDMQMWMAnpAMNFQcX1QXeD/51I5aO+9VtHoJtjDSnGxmiLB3GLmIJK+
         +4yj5PFLievo5Qw5u4k1RbiuwK1TrT/dPs0VcooBm/T8rEW0zuP3+NYuV7ODI8xkEHf3
         XL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791498573; x=1792103373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZOtIgYM1WQR25wgZCSC/vXuzzOnva4ZKPnDOK4M6K0M=;
        b=wqpE8nmif+za1httY+hBsqviaTaa0J+wdpXZjiRd+MylfpLJIZtjSXfU40napP14J3
         EgctTrdD4lnculhLYw3BR+SjzVhVY0hwRfCAgO5Wsgvm+LH0TMjay783iMrO1U26A4d9
         +u192jkPQuuj62rdk5F0raiVRTJXUIdzenLvXgAuD08YlMLCNiOUjJefe8cYkam7QhzE
         g0Hq2Of9fvKuMVnWmEaeZJk0gBp9/6A66QxFfq8TcSJyqwP7cnJxNs/2HantaXZt10Ge
         aIxbjdO9Gggyu2O4RdqbzCwtAUz3UaM3hHCsfWLZfDtFf37VMagpvE4evDsqqTNOrs83
         5pgA==
X-Gm-Message-State: AFuF++lrNN1zJiVI90xZOAhmDN+IMYM9hlKKYOsyTavkyJ9TusuybAIM
	tWInEYfgiG5lWS0++QmOd5mwMrecUX3oD6bOnD5owl7HV2O5Oc0VR1ILMcdgFlTm6+Y=
X-Gm-Gg: AYBFou1qCY5sm8bmYTCeCGjkEaE+60lmsluFEXIn0Xx8nWw6woQqVnQ0WSgOKUzNMuf
	XMr3x9yzV5RmDTIZo2fwHhMknRedV5qChggRe46vTPwmDg+eEq9+Tb0pOXIWy6eii8waXWz7D/+
	r+jx1w+YFRo89JjXO5uw9sU6/v9ZH68ioG+5U/YZdVhM7ZCwQNpPnzlnbU/LfkVM1flnLE3Q98S
	0PvDQvkkhuXWS2kFoi0SUIH5nz3uaQFJEYaOlk18xUpG4hjZ2OX2/s1OCiaIQLrjejezfgu5c10
	ZVLzpySiAtRLWpEe6cgre2E9PRDR7jvLkwpqdJU9xiyHJd0mCH2QIJOEFcaMggmVyFd0YazSdum
	7tgnc/b/GnDLAKI3MWTu8k41BCQNZAhtPP6V1KFRQaPv4tTtHGLPnZvOCtT7AaWMW84B20uK2ih
	bArQio5VuVRfU2kKd7EZbdGzTwiwU0nRi1yMAY+biPVQnyWIvofHubz6HeJ8kily7ILIxOtHid9
	51OJuJiXEVJVmcEGtvGEudeOH0lQP/KvDzQ
X-Received: by 2002:a05:6830:919:b0:81e:1262:6536 with SMTP id 46e09a7af769-82acf29f4famr8740093a34.15.1791498573265;
        Thu, 08 Oct 2026 15:29:33 -0700 (PDT)
Received: from irdv-lubao.dev.purestorage.com ([208.88.158.129])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-83038f82468sm278874a34.11.2026.10.08.15.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 15:29:32 -0700 (PDT)
From: Lucheng Bao <lubao@everpuredata.com>
To: linux-nfs@vger.kernel.org,
	Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	tmenninger@everpuredata.com,
	jcurley@everpuredata.com,
	Lucheng Bao <lubao@everpuredata.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] NFSv4/pNFS: prevent i_size regression while layoutcommit is outstanding
Date: Thu,  8 Oct 2026 22:28:42 +0000
Message-Id: <20261008222843.63319-2-lubao@everpuredata.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008222843.63319-1-lubao@everpuredata.com>
References: <20261008222843.63319-1-lubao@everpuredata.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ac46bd374c9a ("pNFS: Ensure we layoutcommit before revalidating
attributes") replaced outstanding-layoutcommit attribute filtering with
synchronization before explicit revalidation. For layouts requiring
LAYOUTCOMMIT, OPEN attributes can still shrink i_size before metadata
synchronization completes.

Commit d8c951c313ed ("NFSv4.1: Don't trust attributes if a pNFS
LAYOUTCOMMIT is outstanding") moved LAYOUTCOMMIT post-op attribute
processing after cleanup, leaving another unprotected window after
NFS_INO_LAYOUTCOMMITTING is cleared.

Extend the existing writeback checks to reject smaller sizes while a
LAYOUTCOMMIT is pending or in flight, preserving size increases and WCC
checks. Process the reply's attributes and establish their generation
barrier before cleanup removes that protection.

Fixes: d8c951c313ed ("NFSv4.1: Don't trust attributes if a pNFS LAYOUTCOMMIT is outstanding")
Fixes: ac46bd374c9a ("pNFS: Ensure we layoutcommit before revalidating attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Lucheng Bao <lubao@everpuredata.com>
---
 fs/nfs/inode.c    | 8 ++++++--
 fs/nfs/nfs4proc.c | 2 +-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 3022454f7698..11432f521b04 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -1636,7 +1636,9 @@ static void nfs_wcc_update_inode(struct inode *inode, struct nfs_fattr *fattr)
 	if ((fattr->valid & NFS_ATTR_FATTR_PRESIZE)
 			&& (fattr->valid & NFS_ATTR_FATTR_SIZE)
 			&& i_size_read(inode) == nfs_size_to_loff_t(fattr->pre_size)
-			&& !nfs_have_writebacks(inode)) {
+			&& !nfs_have_writebacks(inode)
+			&& (nfs_size_to_loff_t(fattr->size) >= i_size_read(inode)
+				|| !pnfs_layoutcommit_outstanding(inode))) {
 		trace_nfs_size_wcc(inode, fattr->size);
 		i_size_write(inode, nfs_size_to_loff_t(fattr->size));
 	}
@@ -2392,7 +2394,9 @@ static int nfs_update_inode(struct inode *inode, struct nfs_fattr *fattr)
 		if (new_isize != cur_isize && !have_delegation) {
 			/* Do we perhaps have any outstanding writes, or has
 			 * the file grown beyond our last write? */
-			if (!nfs_have_writebacks(inode) || new_isize > cur_isize) {
+			if ((!nfs_have_writebacks(inode) &&
+			     !pnfs_layoutcommit_outstanding(inode)) ||
+			    new_isize > cur_isize) {
 				trace_nfs_size_update(inode, new_isize);
 				i_size_write(inode, new_isize);
 				if (!have_writers)
diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
index 04b1987115d5..1ae047a062b8 100644
--- a/fs/nfs/nfs4proc.c
+++ b/fs/nfs/nfs4proc.c
@@ -10093,9 +10093,9 @@ static void nfs4_layoutcommit_release(void *calldata)
 {
 	struct nfs4_layoutcommit_data *data = calldata;
 
-	pnfs_cleanup_layoutcommit(data);
 	nfs_post_op_update_inode_force_wcc(data->args.inode,
 					   data->res.fattr);
+	pnfs_cleanup_layoutcommit(data);
 	put_cred(data->cred);
 	nfs_iput_and_deactive(data->inode);
 	kfree(data);
-- 
2.34.1

