Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AD5421251
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791719572; cv=none; b=Y/5XP0VLGWleM5pNu4O4aXxVPAwzsBomnu9sCnJyoAUqFN6kv6uBbqCjS1gU/uRgQuq6XTCkTK/rdc0tuAK4cxS2uTaC3GtzP9VJxkKKjPb5unY29xqEr+DV45ewoblb4SC4cDZjvd1Bt2yYQosTNat7svyT0WL/kUgZh/AeMO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791719572; c=relaxed/simple;
	bh=Txb6AsOdVG79wrsPuDvm+J8b3Wm3fGT457wjT3wMNno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TguCtSESL+aEWfhO9eqv+5FHJb2gXYI2ZQbBlciNSfjvDCbTpgilcpZvs9r/Zj2p2W3Uv9ZT3YU3XWPMLBHIldY10B5sQYfKgrRK7iLD97fFWKOcX1BCM0X8vsvBmUqc4eoKWQkT7N3Fu7EV9hNFPfe6SOmH4NJP3SWQE+Rx+50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=slFaiZf0; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="slFaiZf0"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a4c78ee4d6so21460a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791719569; x=1792324369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAs3mUz94y3HVsc+n+czsUW1mDPHFsdfVlUTjRJnHPs=;
        b=slFaiZf0LeKmkOmDoWjoTEhB+2C/zHMdIOXNU9ZmXCzi9LSEOMMKa/DlIEhQCkLRvs
         gwaXogxwffG/nITOP9D2CbThbTSCH3HKKtyACIsTbfC39LomxG++4WF6li4njENKs1sD
         z8NLgn+VsXgSVDeoEZGWfpxQdDxjWS5766u2qCxRqA2jqBSU4hV7etm7pSdUVkFyWA2x
         jeHYvT64EHVoy2nP1kRApArVD7U6SNFL89+lgbucBfxnE5Z+24mJ3lhJskRjATsWsSWe
         SDBOWnwT+ZIxnSAyKIIv2hBSN+wjNtGXTI0swj49TnZwHBb11nDB7TMfM5K8ErPRym2j
         FUvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791719569; x=1792324369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAs3mUz94y3HVsc+n+czsUW1mDPHFsdfVlUTjRJnHPs=;
        b=CYaDRIgAU4Ii8FJ8Zv0ZXr3FJaKbSJYFf066wSSG2sKsbi5RR6g1rmRIcMRbK0Cnsh
         7TzyU2VK0SjMi6UMcGuRLHJM1a2f3zqU3DMc+lRbUEnMuE+wEUuo/bj/yWaLUZy1Lg0O
         ZxGsy8JbXAieNL6ak47mw9onz3nfFGRX08+MuKqkmYtWaobCEz/hx5B2hK2Fp2za5CNs
         lnRz2t6mcxe5w9D+1NSkmwedANhJpG3qXPAOrGJgMdJdTd+ztWNSCtKN+9zEeeKoVljq
         Y6ff3AW1HPh4wRc+joiodlR+SNG9fPF0E/HIe8dtZeORxfcLX7LS6fbyCtlDQRHjoqZL
         GlWA==
X-Forwarded-Encrypted: i=1; AKwUvBxy9fFO0/Pv2UMSXdJRDL6GyjYvx1iDl1puJfjp1RaRYP4BQAdXgT/twStwYS8ciSNecvqGe0Y56g2qf6k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoK5X045fX9tVUWLpHwLNQcZ9boMwr7IA7WRvpSqoodT514s3z
	/dLlRsW6hQ5+Ig6KuYO/v0ghHj4munYEzLUPsurJ3aUPQBG8ivod1ymZO3WD5slv
X-Gm-Gg: AYBFou360x8TfzotiOyf31nU4ahM/wFeh4WVhfmxJxN9Lmm8ivhAQhB9lLjAdrpW/qs
	YEou6nRpHyENZEUS9zcBr/uCo9qrMzFYzEu140/Qn8zgA5RSuj6ByuqcJVFgg2GFKvlYkdcmVCv
	oWTey9X39hDK/UX+dHKhDBzrSN3stRHYVkzIb0OD5Waoc2uvqjQB4VKgZNQ4/VtCIogqeWFDghG
	hB5FFi3NgnG5W4QN8YfNsR/vsjEJMo4Mcbn8FYob+PyJrDVoDddZKUDjQLtIhh0z10r3L+QxP8L
	fCoY/V09YfTPWCNAvZKxV9JAPg/84TLo1K+9RjOxTuBO6jObGSwnkOJ+ZZ1lkT3vLTNvvVztDyU
	TKo/Gs6akg7pIGpSFpHur+uVvoxoUXzCf/SCfiMR2u3VN42EKw4ELB+gGCFopJvyDO8VF9+O37x
	i94d63fp9U+1ttQlC3dyINCBIjiNszP0vfsv4YDkaMavwbbX2gGAw57xGfuMQ8UVQ=
X-Received: by 2002:a17:90b:3145:b0:3a6:f7be:fee6 with SMTP id 98e67ed59e1d1-3ab3a346e9dmr9175847a91.1.1791719569417;
        Sun, 11 Oct 2026 04:52:49 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm2096472a12.18.2026.10.11.04.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 04:52:48 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>
Subject: [PATCH] ksmbd: truncate files before allocating space below EOF
Date: Sun, 11 Oct 2026 20:52:39 +0900
Message-ID: <20261011115239.1588419-1-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_file_allocation_info() compares the requested allocation with
stat.blocks to decide whether to fallocate or truncate. A file with
holes can have fewer allocated blocks than requested even when its EOF
is beyond the requested allocation size. In that case, ksmbd fallocates
with FALLOC_FL_KEEP_SIZE and returns success without shrinking the file.

For example, a file with one byte at offset 1 MiB has an EOF of
1 MiB + 1 but only one allocated page. Setting AllocationSize to 512 KiB
leaves the EOF and the byte unchanged, including after reopening the
file. [MS-FSA] section 2.1.5.15.1 requires EOF to be reduced when the
new allocation size is smaller than the file size.

Check EOF before comparing allocated blocks. Truncate first when the
requested allocation falls below EOF, and skip fallocate in that case.
This avoids allocating holes immediately before discarding them and
allows a shrink request to succeed when space is exhausted. Preserve
the existing behavior for allocation changes that do not shorten EOF.

Fixes: e2f34481b24d ("cifsd: add server-side procedures for SMB3")
Cc: stable@vger.kernel.org
Signed-off-by: DaeMyung Kang <charsyam@gmail.com>
---
 fs/smb/server/smb2pdu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
index 12a43efdb53f..b155a27eaeac 100644
--- a/fs/smb/server/smb2pdu.c
+++ b/fs/smb/server/smb2pdu.c
@@ -8533,23 +8533,15 @@ static int set_file_allocation_info(struct ksmbd_work *work,
 	alloc_blks = (alloc_size + 511) >> 9;
 	inode = file_inode(fp->filp);
 
-	if (alloc_blks > stat.blocks) {
-		smb_break_all_levII_oplock(work, fp, 1);
-		rc = vfs_fallocate(fp->filp, FALLOC_FL_KEEP_SIZE, 0,
-				   alloc_blks * 512);
-		if (rc && rc != -EOPNOTSUPP) {
-			pr_err("vfs_fallocate is failed : %d\n", rc);
-			return rc;
-		}
-	} else if (alloc_blks < stat.blocks) {
+	if (alloc_blks * 512 < i_size_read(inode) ||
+	    alloc_blks < stat.blocks) {
 		loff_t size;
 
 		/*
-		 * Allocation size could be smaller than original one
-		 * which means allocated blocks in file should be
-		 * deallocated. use truncate to cut out it, but inode
-		 * size is also updated with truncate offset.
-		 * inode size is retained by backup inode size.
+		 * Truncate before considering allocation when the new size is below
+		 * EOF. This avoids allocating holes in a sparse file just before
+		 * shrinking it. Also release excess blocks if EOF is already
+		 * smaller than the requested allocation size.
 		 */
 		size = i_size_read(inode);
 		rc = ksmbd_vfs_truncate(work, fp, alloc_blks * 512);
@@ -8559,6 +8551,14 @@ static int set_file_allocation_info(struct ksmbd_work *work,
 		}
 		if (size < alloc_blks * 512)
 			i_size_write(inode, size);
+	} else if (alloc_blks > stat.blocks) {
+		smb_break_all_levII_oplock(work, fp, 1);
+		rc = vfs_fallocate(fp->filp, FALLOC_FL_KEEP_SIZE, 0,
+				   alloc_blks * 512);
+		if (rc && rc != -EOPNOTSUPP) {
+			pr_err("vfs_fallocate is failed : %d\n", rc);
+			return rc;
+		}
 	}
 
 	fp->allocation_size = le64_to_cpu(file_alloc_info->AllocationSize);
-- 
2.43.0

