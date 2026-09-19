Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB4C47ECD0
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817122; cv=none; b=oVBF6nY3XU47B3GClbrFo7Di2DdSY5yiHmv1oAMDBVIPQO6Dw2z/5xi097vNHbVghsBgtmFd7qbKQvoK9D3ef/9iz5S+qmU65r/wCxmbA0xn1NDNgBTy3MW3V4xdCQaAuQfY9I7OzC4ieER6BUs4CWgfiYc0FqMGyFwJra4SAS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817122; c=relaxed/simple;
	bh=WYVmuKHJkf0XxI5S9mwVnzGt7j/jxkgSXCWwYipENBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4OO+juBSdV8EuGWTKoJpgawn7ZrTDPCJOpCrCLzrB/X2AlDAV3ch65SNWRDeeIDxDLxBZ2QC3+GkibCY1DC0z74SBxmkGJRJv6B+I8PhhXKd/05toU52na8zolug0/N6hLZZQjxkxBLITqBzFS/AGR+A/avNZFsoXkmVyCqGMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLfb1vqu; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLfb1vqu"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b35601so958054b3a.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817120; x=1790421920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptXq5DUVT3K9Jwo/D1LNkcuXeWLTL0CSUgmwhJadvLU=;
        b=nLfb1vquVfOpm1AQpCDBbKFr36pguSeCTUbiDmvlukXT7n2DATjPLawW26RE4xmAIG
         evQe+j0AAHcbzOm3Q9Q/9swjf0woksyrtzIkRz7hj7VOrMgoa38iazeT/6z+nU4A6fKW
         yY7C+2joifqRJy5XxL2A/C3hSw+eaKRLcsoaS5pCnELCc/kYkaXQhETMA2HnXQtnMp+W
         dnqXeV7N3b8/OhOIaGI4XbiP8C1dWpaVEzQW+/zqM28g63GU3tDIz8r0aS3AuZEDj3Fm
         uzojMSqW0Nw0E8YVUsAjJzKlyDbB+V17kT/G4g5bqalzehA1cMHH1LItzUg0HhHyhV+S
         VOmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817120; x=1790421920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ptXq5DUVT3K9Jwo/D1LNkcuXeWLTL0CSUgmwhJadvLU=;
        b=R8drUEOTapvUQQ/zv3QbyE1/Fb8o6I4sVr3AahqRkxsxaSC7/9RAeL5gHaIigozRUS
         cKHFJcrnGIIo/eCPTJG4uN78LJPSgfxu51l8aS9dGSdqTZ3DG+yy+LzSkP+WXGcu7eKY
         q/Rz7f60odRmpRA7HixHUtVzw/HUNRjPi0epzHE8AnIJYmMDdKmtbwjZn7T8Q58hoK7R
         IQEv1cTtdAblEeq4soIcbzYExlvXsTDxiadmPHkBniX2qgt3E7A9CSSPwBOE7Q2Sg9lf
         nyxC1j1j11foq/SwbjhCa7cGmWAPHD7HN2UY1aHILYzYs5PLXc4mEmIow1SwZ6E7KBlT
         n2YA==
X-Forwarded-Encrypted: i=1; AKwUvBxQsJ2wvmXojMVKk0qveTpH7XgH6GMdgh6iHW6d6dWXDb6UkyPdoG9eRz2dtZI+CTOoi3wrwlhXmAS9vls=@vger.kernel.org
X-Gm-Message-State: AFuF++mV5JpaPR/+KNTBeEz1+nEapqj60zEjMC8/hQhgOP6pl9ZxKoqQ
	uX+pHZC3Fvvw2XqwENc0gCROX6adESKjHTTJVyKbYktsECoqk7UyqWYK
X-Gm-Gg: AYBFou19f+pOf5oSKD2FkeubRMQPlX2yY6HAX0c10kfqt+AF5l6dt2OxuOg4c1VKkib
	E4UoalKq9qYnNMFEGpp/FsdL67Kk1lPQ4mHcyGtPdE4b9Ae5C4wyRAdjph06UokjGNEqkMfykxJ
	ZzIym5m+28UbBPyQ4F6Y+6wZEiyVDedc4qTKWWGOeFq6JpG8HD7oQoeZSD3iQ7Wb625/nxbnPun
	WAuwKqZoku9ZaMUrQTVuuveCI4hE2QM8ifulN0R0A4MMR2gdmII89a3emQMY2Um4BegQIjJI9V2
	pFx2XbZnGwNVjK8SB6N6x7EgMh5s6WWyiWYPQyVsPDH0TXjhlbx0v3Wh9Gao1RHaEOpu2Tx4W9+
	nHMpBOtm5sV7naSCdE6bRNyWCa9v5cZNougmp7pHr0C9ge2UY/oeuVfN5fZ6J48aGag50zu7Pwm
	PnoJBB9ztMudcNrOsiJM3FkR9+jjo6venxthx5qAKrsEKx0MFTDYJevSykhqvv3XAujk6Be5D2y
	znyS8Uk8F8gSNJ4U5wpF2p1bkaWsrEo1mYbVJhcKWZc4sEW89EmmcBrdMcInEL5+tEso2oLzn5d
	cE/siUQo4Q==
X-Received: by 2002:a05:6a00:3cd6:b0:86e:8deb:fbd4 with SMTP id d2e1a72fcca58-874dbde4f90mr9348313b3a.11.1789817120159;
        Sat, 19 Sep 2026 04:25:20 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a9d07425sm949957b3a.42.2026.09.19.04.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:25:19 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] nsfs: fix u32-vs-bytes unit mismatch in nsfs_fh_to_dentry()
Date: Sat, 19 Sep 2026 11:25:18 +0000
Message-ID: <20260919112519.3872163-1-benquike@gmail.com>
In-Reply-To: <20260919080850.3005810-1-benquike@gmail.com>
References: <20260919080850.3005810-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In nsfs_fh_to_dentry(), both fh_len and NSFS_FID_SIZE_U32_LATEST (4) are
expressed in units of 4-byte u32 words rather than bytes, whereas
pointer arithmetic on (void *)fid and the byte count passed to
memchr_inv() are in bytes (NSFS_FILE_HANDLE_SIZE_LATEST = 16).

Passing (void *)fid + NSFS_FID_SIZE_U32_LATEST and
fh_len - NSFS_FID_SIZE_U32_LATEST to memchr_inv() inspects bytes
[4 .. fh_len) inside struct nsfs_file_handle (fid->ns_id and
fid->ns_type) instead of the trailing bytes [16 .. fh_len * 4) after
struct nsfs_file_handle. Consequently:
1. Valid zero-padded handles with handle_bytes >= 36 (fh_len >= 9) where
   fid->ns_type != 0 (at byte offset 8) are falsely rejected with
   -ESTALE.
2. Non-zero trailing garbage in bytes [16 .. fh_len * 4) is ignored when
   the upper 32 bits of fid->ns_id (bytes [4..7]) are zero.

Fix this by offsetting (void *)fid by NSFS_FILE_HANDLE_SIZE_LATEST (16)
and multiplying (fh_len - NSFS_FID_SIZE_U32_LATEST) by sizeof(u32).

Fixes: 5222470b2fbb ("nsfs: support file handles")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Add a Fixes: tag. nsfs_fh_to_dentry(), both NSFS_FID_SIZE_U32_*
constants and this comparison were all added together by 5222470b2fbb
("nsfs: support file handles"), first released in v6.18.

To be explicit about the impact, since a Fixes: tag will get this picked
up for stable: this is NOT a memory-safety bug. (void *)fid + 4 stays
well inside the 16-byte struct nsfs_file_handle, and fh_len - 4 is
smaller than the intended (fh_len - 4) * 4, so the existing scan is
strictly narrower than it should be. The consequences are a spurious
-ESTALE for handles with handle_bytes >= 36, and trailing non-zero bytes
not being rejected as intended.

 fs/nsfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nsfs.c b/fs/nsfs.c
index c3b6ae765..a1842e12f 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -529,8 +529,8 @@
 
 	/* Check that any trailing bytes are zero. */
 	if ((fh_len > NSFS_FID_SIZE_U32_LATEST) &&
-	    memchr_inv((void *)fid + NSFS_FID_SIZE_U32_LATEST, 0,
-		       fh_len - NSFS_FID_SIZE_U32_LATEST))
+	    memchr_inv((void *)fid + NSFS_FILE_HANDLE_SIZE_LATEST, 0,
+		       (fh_len - NSFS_FID_SIZE_U32_LATEST) * sizeof(u32)))
 		return NULL;
 
 	switch (fh_type) {
-- 
2.43.0
