Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A51B4F68A3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790961437; cv=none; b=p/kLzIZFW6Jot15J3t9+/sUYLMTzwiPGK61hZDbbWvFLRrPTKUgBnR8hqsa4t7Yei0DCJ1ZxpCTbZAefiIILBR/w09w4vkN2IwXPctYAcOWNZfk3CId4M/DfBDzVa8TadXmGA9E596/n6q1z9+TppmmXys/17F9pNVl3xHYIXqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790961437; c=relaxed/simple;
	bh=pVaTH1LG4toJiQ54RWcLY95p+VVGQYvbL4PGzm/Z/fU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SiSbaXk/K15EsDLoeQ8YcEOac9pWNuVYe58vRxpMJ4P351YcjnWWdeItyAjICm2zM5aumPaKMmxYA+DbkFUbu15+lUfqtQWpHLMD8U013BTDR4EvePrBRWtHh4NQt6AKIyhuGDx9CEfWW6jcyZBCc7V0FW7dfwncTQ+0v4UO/Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ytxwd7hC; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ytxwd7hC"
Received: by mail-pj2-f40.google.com with SMTP id d9443c01a7336-2e494adf48dso10299245ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790961431; x=1791566231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=at3WCJYxrNqQiRPabCfUcyh8BXLNwHFp+QXUnaRws7o=;
        b=Ytxwd7hCaoNpYlPJVnXaYAhh//hvRuo8WLZ8EnQMdkUwoega4Lqvgf3dnPlgWAqnQn
         nVnOONRuDacNC+4jgV1cP5liGwzhpDTjUcsUB1ieUtaiTGyaPRibtMJ1C+RBl3pfY6pW
         8dt41nwYwA2U7YXUZbhe1SZhP7L4/vQc+NqUVomLKOQ5CAAX6UfPdPNBrSGMG/zSRBok
         hdZspCyNr0Sj0/qKCgrQXK8EiWsfXb09FQI3hczSJ/JH3s2VAA1c18qA2QgVo29pGIZA
         VHs6bhgk/ZILluDLoviJlAPCtQb2bWQcM1IfrgJpsF1YqLzBt00N4Y3F+3h7SzQDbGXw
         ySTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790961431; x=1791566231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=at3WCJYxrNqQiRPabCfUcyh8BXLNwHFp+QXUnaRws7o=;
        b=lNHRHRqCMm4r2Kbw5rPp3jFAY7r/HgEyq2oCQ9cdslbGRu5jGquhqBVq6wK3oTMjnv
         ACbktTCRuhdxVZLumol7KzEtlHfXrAIzHlmrrxwuiA/on3b1RpSDvqJU3fmqO+HZFj7A
         sr14S/FlsMw5swo7AkiPAl1yPEG+ZrxwXJIPqtvKIXzSkeOnpyrgiKD+SA5EFJW9zCvr
         218qscceDSR6WvP3C3KwQN+8LUbjMyUH+QCxBQ+3loDCt2Zn7no9Qoh2Pd1KTifbWE3Y
         IxE9kVRnUCtAasxaJfY+bPY/6LBFbfkdq4s+WIxGM6jW4wGOkk6KgJlFtn0/MVjTcqis
         ZZ8g==
X-Gm-Message-State: AFq9FYKh8+ONaN6BoxeGDCDGr6Zzk15V+Gcq0eUn2BQGJgNBUVZXZyYM
	g26/isMHCcNxOWosMpL0FeQIvUXfeS6nn5rHBftKMC1djlFYv9EHjT67z/xIe61y
X-Gm-Gg: AYBFou3ZrEK6076XVGRRYt42pXEUoXF1zkgpvFuSepAFwrw5TZArH839qwy9sNNr2j3
	GPZFVq5qGXFoDhUwgWc2QbfRuwRyGFBATDeSA+EjmUWya+FaIqa3DCNLgy/JZudxfaYlzo1GkJ9
	Jpt0xbRwb2ZcLo8KMHTYYacZzqt4tf52RglIbIBYP6ElHXx+iV9xZgMOrEzjk+w3RoOovQoqdgl
	bTjJ8bx8/hHdVPy4oVUfvK4bOqGQeDIJH85+iyK19p+hY7vrOO1DvRyaUqrifoRboJWytNaiIlp
	gtp/cZ+ZEuIi7I8OOuelfywLuQGFdRhZYadDVGR7TeCTnqHTN+g+bficSrmpPmmvJCHRwoNGYrB
	ponjaI0qYk0EGCLoBZBpbVld74c/GmAIW74iw4FDIVJmdXrkmRZU7IuPHq1q2Jj/kQdNrb5nS20
	OXe+LgxbkyN8kgidEMFcx5sPmoTQiE1FGXjIFBKVzJ8Q5FmOO4dqCe2zJEQaLKoqlxVKsARgbJX
	wLsA8m402rNPnweriWmYm5u7GHXd542o2t/a/PwulSCwqxD7cpW/bmTZyUxlKB0HSwixuKprExQ
	AI/sIOsz+kQRhzk=
X-Received: by 2002:a17:902:d502:b0:2e2:ffcb:87a9 with SMTP id d9443c01a7336-2e49b4e3702mr32501335ad.24.1790961431271;
        Fri, 02 Oct 2026 10:17:11 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e4c2a7e76csm4075525ad.31.2026.10.02.10.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:17:10 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: disallow mmap write and data-modifying fallocate on atomic files
Date: Fri,  2 Oct 2026 17:17:04 +0000
Message-ID: <20261002171704.3652570-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Stores through a shared writable mapping and fallocate with
FALLOC_FL_PUNCH_HOLE, FALLOC_FL_ZERO_RANGE, FALLOC_FL_COLLAPSE_RANGE or
FALLOC_FL_INSERT_RANGE do not go through ->write_begin, so they bypass
the COW inode and modify the original inode directly. Reject them while
the file is in atomic write mode, as fallocate already does for pinned
and compressed files. A write fault gets SIGBUS and fallocate gets
-EOPNOTSUPP.

fallocate without these flags only preallocates blocks and stays
allowed.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ef4d218e694..56c686b8580 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -140,6 +140,10 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		return VM_FAULT_SIGBUS;
 	}
 
+	/* mmap stores bypass the COW inode and would break atomicity */
+	if (f2fs_is_atomic_file(inode))
+		return VM_FAULT_SIGBUS;
+
 	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
 		err = -EIO;
 		goto out;
@@ -2113,9 +2117,11 @@ static long f2fs_fallocate(struct file *file, int mode,
 
 	/*
 	 * Pinned file should not support partial truncation since the block
-	 * can be used by applications.
+	 * can be used by applications. Atomic files should not either, since
+	 * these modify the original inode directly and break atomicity.
 	 */
-	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &&
+	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode) ||
+	     f2fs_is_atomic_file(inode)) &&
 		(mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
 			FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE))) {
 		ret = -EOPNOTSUPP;
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

