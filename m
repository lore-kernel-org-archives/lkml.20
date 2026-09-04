Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4908B43F8B5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522993; cv=none; b=J+jjz0BYu+71nWFOgXOa7wCvN9+EeYPuDV8QwGP3dTs4PQ4jvHvoG/OhoroTfL6LkUqMtLDgT0q+Yxm43Os9P7o6zZI8PCQu0tf1CGZ+DEY8ZGlnVMmf2oVr45K2/ebLHagZOM+wpULZ4ZVaoFWERuY0uM68JorRC4mi9sJlENs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522993; c=relaxed/simple;
	bh=SMgtLJNjXLDQMKg8a33KB7njB/dXQsXd86PU6HuYRFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=evVhODEPu9/GNuRzkGcSn2/GNzi5+Hhg6vWlyALmsa2zGYC9OYS3fgTKNe5A72UDmGk0Q7iDIopuDWxVVu26wffk9WTvO5M42mLoMAkrvdgQDau1LogoD5ZxE1myBU3yT8DEouGLwPE+YTrfNKLcRF/im2FhXhU5hmL8qGCqH8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLU2msRj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WLU2msRj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d5335cf904so8569255ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522991; x=1789127791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5cLLqfkkiRZQrmBzJx4zJJUSEYbLxuOIdOhIuHe4h/M=;
        b=WLU2msRjkBYNvqnchsoVEoV7S3hP59C56a4ZuY21/naVkY3JFcN84xnOx2eyxnu0Q2
         +SrRDQKjTyjOEpPDPYiTyUSpqeguHKZLv1RT25GzDqLwHu0y5REO/JmlLhvV5hFrzZwl
         T3k2EZa2/Dx1/Wu5CqqDhHGqX5dLWHDQPj8/7luDFSdgdRFIQOswdThZaRr5IYuysxCm
         hhFYS5YegFw6mb5QFF0ASffgC/y4yna20oEJdp6EFRvq6y77irDEXSHezWDQhUFtp5ye
         arZt93fANeJTIZRB0WoQ7l3obzLsf9kJfXh/Dczh3Tq1KO+6CBfX+qN0XZ1dcnL7z2uL
         UiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522991; x=1789127791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5cLLqfkkiRZQrmBzJx4zJJUSEYbLxuOIdOhIuHe4h/M=;
        b=TRmv2HoBc3uoK1AvGe0zdd1mkQqCtA4uMwMVT5r1sW9yGY6eMN2iMa4UkcIGlNVSg1
         tKFuLVHzsY08B+YUIamatljc2iUYPb2SzPHbw8rh+hlU7RKv3+LgCqxvlOh6rkyhWUe0
         YBxcVtlMThnyv7khenCnlakVwIvawUe6eSOuYCR1naGIYxn3+5XJjFOymiJ2Gbw6+B12
         Pzu5fzfOX/rHuIpiZsup4oJo1b+SiTpNuckVa+k3VYRo2s6WomcSPsitGgNNKU0ixhbr
         XSGAFVIRafZ94afmUEqV6oD53k2CrDyfpeZHxhK4fy/CLcXNl/jxGoPvDSc2pRlTkS9B
         SOUg==
X-Gm-Message-State: AFuF++n0kMTp5mTXAPaXUuETqNoRxfODp6/XHnw/mNQl83bchybR/yaP
	IbOK32tzhz0lOQXau35i3GI/I5oxbWh3BmPE2jUAoVtIhxMN4c3iFr7A
X-Gm-Gg: AYBFou04k3PR6kC7O91Xhtjc6cfe0X19DPmeVeXY3YngEJq8EDup0Bgd3bpu7jHSa/h
	mwTnQz8x7Uiom6ftL+lHk5rJ1PVqjav2lII+/QAfeR+zBJ+ONZXWVunI9EkbNnp2QxmojAOtJdL
	n0ZmQfPKBab9g357ENabst+NY6gfz8UQXFzj7IGSRoCuBwnJ7KJ8zOM331Xq/PN/4fdROC+C6IX
	I5iWyCNEQ8SEdvfQu34jRGELHTsBMn6EYF684hiaQ2b795FZRXGCGjkJoyNG7gKLHQ9lp4au9Dd
	k9ZsCz73EYweLibLIYOE1Ry+COGxRXRfu753AiDraEtmqSZwxGWfHhA2fJ6Bt+hVuwsoJlcyt5j
	OlxFA3ZXNe7yV1HrZPCi95SS06YxRuLk1oEMsQSOJ+CeWPipRSnmCIpdlTb4ZgGegJe9RisddsQ
	Y8pcAQgkp0/03sxRH0DH+Dax9/bI/Sg+qP8T1YzAVEfJq6MNgBJfS54AcRn4XNL9X3j6bDfJxrS
	PBygY2OZyhpQVE=
X-Received: by 2002:a17:90b:3944:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39b261b19d9mr9200259a91.14.1788522991411;
        Fri, 04 Sep 2026 04:56:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa31b24sm6363031eec.13.2026.09.04.04.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:56:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	jfs-discussion@lists.sourceforge.net
Subject: [PATCH] jfs: fix typos in comments
Date: Fri,  4 Sep 2026 17:26:25 +0530
Message-ID: <20260904115627.11748-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/jfs/jfs_dmap.c   | 2 +-
 fs/jfs/jfs_imap.c   | 4 ++--
 fs/jfs/jfs_txnmgr.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a841cf21da7d..f5b008b61698 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -1851,7 +1851,7 @@ static int dbFindCtl(struct bmap * bmp, int l2nb, int level, s64 * blkno)
  *		the dmaps themselves containing the desired contiguous free
  *		space or starting a contiguous free space of desired size
  *		that is made up of the blocks of one or more dmaps. these
- *		calls should not fail due to insufficent resources.
+ *		calls should not fail due to insufficient resources.
  *
  *		this routine is called in some cases where it is not known
  *		whether it will fail due to insufficient resources.  more
diff --git a/fs/jfs/jfs_imap.c b/fs/jfs/jfs_imap.c
index b84ba4d7dfb4..fbb10a26862c 100644
--- a/fs/jfs/jfs_imap.c
+++ b/fs/jfs/jfs_imap.c
@@ -259,7 +259,7 @@ int diSync(struct inode *ipimap)
  *
  * FUNCTION:	initialize an incore inode from disk.
  *
- *		on entry, the specifed incore inode should itself
+ *		on entry, the specified incore inode should itself
  *		specify the disk inode number corresponding to the
  *		incore inode (i.e. i_number should be initialized).
  *
@@ -560,7 +560,7 @@ void diFreeSpecial(struct inode *ip)
  * FUNCTION:	write the on-disk inode portion of the in-memory inode
  *		to its corresponding on-disk inode.
  *
- *		on entry, the specifed incore inode should itself
+ *		on entry, the specified incore inode should itself
  *		specify the disk inode number corresponding to the
  *		incore inode (i.e. i_number should be initialized).
  *
diff --git a/fs/jfs/jfs_txnmgr.c b/fs/jfs/jfs_txnmgr.c
index 083dbbb0c326..c9e4d3d5399b 100644
--- a/fs/jfs/jfs_txnmgr.c
+++ b/fs/jfs/jfs_txnmgr.c
@@ -113,7 +113,7 @@ static DECLARE_WAIT_QUEUE_HEAD(jfs_commit_thread_wait);
 static int jfs_commit_thread_waking;
 
 /*
- * Retry logic exist outside these macros to protect from spurrious wakeups.
+ * Retry logic exist outside these macros to protect from spurious wakeups.
  */
 static inline void TXN_SLEEP_DROP_LOCK(wait_queue_head_t * event)
 {
-- 
2.48.1

