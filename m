Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D66941C30F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378347; cv=none; b=ujMpeKsXdl19NtNMbAqykC13qlAhUTl7JsPGe4LyVGxgEBZd92+xFpHVU/BQpYC72AXfNXlFKsAtTlVN4ItJ4LCmXVlg2UKamt7SDyX+fth6vvVWOndGnRNORQSAlGFreyayTWOib9mYePQT9+eu4Bk5x3wLxFDkDtVYfnkrO5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378347; c=relaxed/simple;
	bh=ThjuJJIilkFnb3x21CQlJpZVJrdeK0DbvDM3qFJoTpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dy8cfvmOMByDrJzOjcu5Yxfgn227V/nKLeVi0cTnaZhA761W2wSE0SWpwVjdBA1pNy0J7ss+qWvUQz+tLqDoFH6dPbel/5Uo0EcMIM1laeQaIUAUg9GQZLJag/5eh/6Eu7qV6xltlwzrZ6lQrNvSVM1iIvwdj1+6EYuByQf7yTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfNcv0nh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfNcv0nh"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so1733041a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789378345; x=1789983145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VIqJAEv0wE0GewharGE+LoF/XSc70c9h3/w9GQFRHEs=;
        b=EfNcv0nhAz915vEkIxvjKWZxBqPhCt9u/GJJGs26srntvITLsxbYwJIoedxe5PfXNC
         YHip9UY+4Am9Bhzo8lHDNvkRFHIXHFgNRvXpUgXhi5N1Y65xf8u7jQGV1xu+3WTxVr00
         GTnedh2PND+7CLz8lunF4JIEutfu/e/gON8pn2cqv85hjrPDqqOKrQbvXhAzyH2E5upU
         T3tivVUDEfiZSMQyxQJcAIy/6H+TwOJPhGHxTk35fKqqY5LdFhDKRahwWH+XTvi8dgmh
         KBeLCBslKV6zq/fHM4BEEzR/dTeIFv3oXaMfoowlv7kUNw+jkrwxh5YlzpQwkvXhIUmS
         tfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378345; x=1789983145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VIqJAEv0wE0GewharGE+LoF/XSc70c9h3/w9GQFRHEs=;
        b=qfeuP0T3XQgayGF8AsAWJkqKqdZhW4izJdBpSud2M62cFJg4RBJyOjNqlnttvNDbs6
         5aAazw8SS+zGoj10v1wmcdJb4mg4J4b9yDE4qFcE1CxMlGB/KQbOncHuIyqv2ijZKP8e
         wV9C9RQHyQGfDWXKYLwSbTfA8v+bRntutOc3DOn0xNzG56a5vPPoWLSygrxNrtQOEukD
         rdsV/662IKWsiSPzOWOT5zqpQliaa9tCOyO7JcNLHFF1/gA6s47VfTwCFQkdbdBWxCu2
         v1emgiV7UN4MNgrXpanCwzgUkw+NcDf5C2OONmPXhamwg8mZ2b3hWsrqCsnxgxvazXb8
         ukGw==
X-Forwarded-Encrypted: i=1; AKwUvBzeveeDTMIGJemMcPmhRqpaXrq1VA49UdlpYrJOKmCQwGMAqc2GVul8hIB8ojoXZIAokar3+5+yjk213UQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lnXkLnK9lFPIZtCagh43+7+EVrtIYgH+kXuQdTblvUpqRkuHEH
	9CgNPIxJvUv75Dn15wuzsS3q2D5+3y3cxD2LgFuXkAI5otOC4Ct2IspI
X-Gm-Gg: AYBFou1ZqsC2gs4d8PM09kAQgPOvU/HfNPH8IVf+TIzDTBeffwu5xcQ2lnugfURg/39
	IqxGhLi5jyenvOIm1/cCo55vdJ8NJp3tpyLcxUPMtmVF4r0KSmVzMO6eCF3MrWQ6XEhuffOpSq0
	ALRrARNV9Gw+I7jh7+Yyl5fVC/735sUCLcaki87hKwUybwzq+kq7JNkkbJLMGYwRxfgiGZdMoJV
	MAHrWwbQLTQRS50Jivr1R72wKVep+yY4TKwjXEbouoC6xtjD0u8H9/betgbp/sm1uVbDOc0YdB0
	s036rplca0lXp5G8QYUKuJHUbWOLJ7Sjx8nSg9I8M/J40/T3CALDCClnbO/qbFiPBIuGHZ+sp/k
	H6hGnbwB3bSfLjHwPQLxLiZqBxPvdKrxiExxlzCeYAe74ZARYreD+Sv+gsc8j8Ge+XqY6dlPTPq
	2RYifSP/7eu1d2htikvF80FIUtKmZ8T8LANZjz0cw5WR1c4PepINGdR1DQ/aEaGWNGXy4Bwh7Pj
	zZ+Jy/kRA0ZJkYRAN23eEi1OVivmLP4stkHajM1t5XPXkzoPulBGAaueZ+D1Gfqr6pCaTOKY2cz
	SyP3jBqKKjN4E+ieT7mweor1Z3E4UHOMvOBB+6wTqfY74shkh/tELJs7osCxTQnSJ/cOGneoGxH
	6RtarV+NrRM0=
X-Received: by 2002:a17:90b:57e7:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-39dec05d7femr3897850a91.13.1789378344844;
        Mon, 14 Sep 2026 02:32:24 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.t54fbfa9bf0658dcb-tp.internal (155.135.143.34.bc.googleusercontent.com. [34.143.135.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d951d6b08sm20414733a91.8.2026.09.14.02.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:32:24 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Carlos Maiolino <cem@kernel.org>
Cc: "Darrick J . Wong" <djwong@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Subject: [PATCH v6 1/1] xfs: prevent close() from hanging on frozen filesystems
Date: Mon, 14 Sep 2026 09:31:51 +0000
Message-ID: <20260914093152.1698-2-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914093152.1698-1-aditya.ansh182@gmail.com>
References: <20260914093152.1698-1-aditya.ansh182@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a file is closed, xfs_file_release() attempts to trim speculative
post-EOF blocks. This requires allocating a transaction, which blocks
indefinitely if the filesystem is frozen.

Fix the hang by wrapping the preallocation cleanup block with
sb_start_write_trylock() and xfs_ilock_nowait() to bypass the trim
best-effort when the filesystem is frozen or locking fails.

Suggested-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
 fs/xfs/xfs_file.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index d8202da15aca..dd6d2e08faff 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -1872,17 +1872,21 @@ xfs_file_release(
 		return 0;
 
 	/*
-	 * If we can't get the iolock just skip truncating the blocks past EOF
-	 * because we could deadlock with the mmap_lock otherwise. We'll get
-	 * another chance to drop them once the last reference to the inode is
-	 * dropped, so we'll never leak blocks permanently.
+	 * If we can't get the iolock or if the filesystem is frozen, just skip
+	 * truncating the blocks past EOF because we could deadlock with the
+	 * mmap_lock or hang the close() call. We'll get another chance to drop
+	 * them once the last reference to the inode is dropped, so we'll never
+	 * leak blocks permanently.
 	 */
 	if (!xfs_iflags_test(ip, XFS_EOFBLOCKS_RELEASED) &&
-	    xfs_ilock_nowait(ip, XFS_IOLOCK_EXCL)) {
-		if (xfs_can_free_eofblocks(ip) &&
-		    !xfs_iflags_test_and_set(ip, XFS_EOFBLOCKS_RELEASED))
-			xfs_free_eofblocks(ip);
-		xfs_iunlock(ip, XFS_IOLOCK_EXCL);
+	    sb_start_write_trylock(mp->m_super)) {
+		if (xfs_ilock_nowait(ip, XFS_IOLOCK_EXCL)) {
+			if (xfs_can_free_eofblocks(ip) &&
+			    !xfs_iflags_test_and_set(ip, XFS_EOFBLOCKS_RELEASED))
+				xfs_free_eofblocks(ip);
+			xfs_iunlock(ip, XFS_IOLOCK_EXCL);
+		}
+		sb_end_write(mp->m_super);
 	}
 
 	return 0;
-- 
2.47.3

