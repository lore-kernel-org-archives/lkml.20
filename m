Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D384B475344
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790878092; cv=none; b=Y6Z/4Eq7GOFGvGU+iLAOeC6QVS02bhlODT6uDAkb+9iNIvKH7T1B9djsMycb4GjzFGJAZFliTIW1aUxP5tBg2ubOwXYCFZeWUNGmkE8a2pP4sYm8Q3+CcDA4rJ4KT7OdkzzI5t+DvVETWxQAkWrFmz5JsYubPKg3e3/4mXnfdto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790878092; c=relaxed/simple;
	bh=oMalSm8hB0qWgrXw0+EvUk1DuiMUoX6eV8N07xHy790=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FuUBIxVHviL5rbRhJm0cc+Qtm+E6F8AcRiboT8vsqULCsWsi5BrNIG1JTX5darjkB2QiVFm4q5NOiNz2SHftxYTinPIF+/s71ljwaE/2ryPazkAAB93v7/ic97LZkQ7MOeFSUXZw9YBO8FmkS+sZ5aWE4Vcu41q9tlGm0FErwB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naLUThIy; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naLUThIy"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc7c058617aso1790243a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 11:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790878088; x=1791482888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLND6mqvtrw/hYdQey6ykKNo6QnpNvUQNznvBKs4ZJI=;
        b=naLUThIyXhcNGLqJ0FVOmEQJU4XQXpzbLCXcost/XKcjXpOfqIx33uCZIjwtQcbyx9
         jreP72SDfOHf0VqLatbtGu2hEfGVEXwkpS9Lrhm+TBLUomXIyux+YMgHdlISDJh9fr3i
         CFD39gxIib5ycRI/cgagGyedNqqSXMW+ZMEg+J7Pm52IbdhU8va2w//sTjgmzAXiO2QN
         9PaFlyfWhrZSZ2K/zniw1VjiUFuzYmKvI4Mg/XwvirvMxybZx2d5ctthkBxR7I0TCmjg
         MyGW/jUtNrtjoFNVQIBKJXpbQL7yONQYk8vNNGyOYb7VMzaf57AxiEhTZSqUzIrNmZiK
         51+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790878088; x=1791482888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLND6mqvtrw/hYdQey6ykKNo6QnpNvUQNznvBKs4ZJI=;
        b=weI8jh1Cb3054fvHscc7ixnBSReEoa751AxPyKmQ+oA9nOejOp/K1ShNTytMnTKDKu
         hiAZhmeASm/gb2boH4JIc1QHGqriFunG+DJ7Hy1q9o+az999DGmEfqg56nJZW90kxrww
         bFX0QQCACeIIygITl2t3/sSDHDvkALDzraFfXtmeuFd9VV7NVxm8OoheMUL7smqyNsBq
         E2MTJ7TYqmbHT6r3XXY3yyI4xn6TB6hCJLq/BEUL75u6sJyBQWrOmPLbJUbpi8VAMU00
         6Hy6PRmsSx3jHRUI8PyC+JufHMtLQh9S/TQFHzFIZ3s/Npgl+QhOJBPlpOVb+WTDXFCN
         VtMw==
X-Gm-Message-State: AFuF++mH/yxhi3n90xv6wV09MfrxqpdPWm8ZS87iS83cLlgrvAtRenu1
	ao0NRs4/Pcj1CYmD/5/v8zyH6/CXhukP3/h57eDZecL9TwsIBOJQoQ0XiloH/g==
X-Gm-Gg: AYBFou2L94QhpX0nQR+dG0pE1ib9yEudUne8p4arJzvQ/8hpYowFMSgh18TNKFKJX5q
	bp2wP3vC8+vi18mobg34gibRpGi3mcyGLxEhcsWDullbec40amVwvDabrjNbRnxNcjGxWCQ7CPA
	FhPMzcGAk8Zcr728cHBcnNdTaXgt7jekcHjPhrIoFbsshSLh/dxgXq3Jbh3yj69vH3wJFCt6VNK
	XhN7trRpulhuoteFQFI9ax12IzoKuXod0MlJN3tPWBIuhcEfTl1lLpahmpje9ocHiIIDhxweVkF
	DIfentMNjSxND7oOSmvOJp2SvoHXy/NyJN4HyYlX0LDRIMPqTIXWIduq+ycgNDNQk0+LmUut1hL
	2VnCGXUEyu3+BkZwHepO1etZmIlew05HEMTKokOaxVUm4zkdO1IoIsZ4wAkOJvlMhaKcQD7TBLZ
	p2oH21+tcPs1EvJT5ZUDwLKAj/ARO0phaB1Z39MTFoUNbf4fhKXeQBnXKIl2vjwLIks3rhOqp+H
	opE9b3ElJPXwGFWzjR+0KcM+dnTsN+SySIYN8Zsqe0u4HyxgzX9pX5r8CkLkl1Cq5KV+Vlh9EZJ
	zHW3KugReR6LGVM=
X-Received: by 2002:a05:6a20:918c:b0:3dd:fdc6:ee7b with SMTP id adf61e73a8af0-3e0bd44aa4cmr130932637.66.1790878088371;
        Thu, 01 Oct 2026 11:08:08 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc9f737a231sm949a12.18.2026.10.01.11.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 11:08:07 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] fsck.f2fs: enable fix_on when CP_RESIZEFS_FLAG is set in auto-fix mode
Date: Thu,  1 Oct 2026 18:07:58 +0000
Message-ID: <20261001180758.2099491-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Commit 9a31cefa2966 ("fsck.f2fs: allow fsck to fix issues with online
resize due to SPO") added logic in sanity_check_ckpt() to recalculate
and fix user_block_count when CP_RESIZEFS_FLAG is set after a sudden
power-off during online resize.

However, sanity_check_ckpt() calls f2fs_should_proceed() and checks
c.fix_on before repairing user_block_count, while f2fs_should_proceed()
did not check CP_RESIZEFS_FLAG when setting c.fix_on in auto_fix (-a) or
preen (-p) mode. As a result, running 'fsck.f2fs -a' after an SPO during
online shrink leaves c.fix_on unset and fails to repair the checkpoint.

Check CP_RESIZEFS_FLAG in f2fs_should_proceed() so that auto-fix and
preen modes properly enable c.fix_on and recover the filesystem.

Fixes: 9a31cefa2966 ("fsck.f2fs: allow fsck to fix issues with online resize due to SPO")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/mount.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fsck/mount.c b/fsck/mount.c
index 2fd8e1c..8479ed1 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1515,6 +1515,7 @@ static int f2fs_should_proceed(struct f2fs_super_block *sb, u32 flag)
 	if (!c.fix_on && (c.auto_fix || c.preen_mode)) {
 		if (flag & CP_FSCK_FLAG ||
 			flag & CP_DISABLED_FLAG ||
+			flag & CP_RESIZEFS_FLAG ||
 			flag & CP_QUOTA_NEED_FSCK_FLAG ||
 			c.invalid_sb & SB_NEED_FIX ||
 			(exist_qf_ino(sb) && (flag & CP_ERROR_FLAG))) {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

