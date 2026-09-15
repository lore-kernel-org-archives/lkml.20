Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A228395266
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453593; cv=none; b=YPflkRnFAHyPRnoMx3LOSNN29DpVY35TycR53/gFkEtdJ1DD88b2Mp9Mj7aO+sJAVop/lu1EHjAo7v420pFAdHc3YQ3CUK90NWTPQfpwOFB2XcyVS+00YQL/HcJDqkcap3GJadWCa7svlSXGzX/BHx0uGo6LZk26C/AOGSKBmfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453593; c=relaxed/simple;
	bh=SKkv80ZA96qi/FuGqfs3SVEcrAzc/ZEJGBgZ1fEwV9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lhjlxStWmtgF00KlOTSioM4xjmq/4iIK0Rj9tTcuAWwVPmGbjp5/O+nwYzb1SwxBxNWhsXd54eEezzm918Fhf8IzFvfb2bY8T9BWBEBecuYr5hyf8hBNB1qV9X1rXS+202BlH3kHoQWfVz52gXpJb/eiYMccu+Il9YsWZJYTtOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1ejAIOq; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1ejAIOq"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-86a25369f16so3246410b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 23:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453590; x=1790058390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g3c12DWMhGwiCLWNDvwB0sFp19akobAYWnpYzYqkItc=;
        b=F1ejAIOqkAOFNFLbH+WweuEmyQjjnerIn808OQxwSzX6xQ1lxlRY65iQX9pXrMdmXW
         tsjTTL4SrQVaGJoEoKpROg08V90cHKKKDfnwfxUwVTMNRDJ4XtWEFoE9FPAbElQ9tLAs
         hI/8PPOe/ZX+TpfeOlJlY3I+JVIbLciBzLdufQV/KwMu5/474EM5rZqH6rQYbTyLPSnl
         UNG0liaKxb89J+RvoQ5e2Tf2F9nIBW3eMtw1gDKSu51V+bQerq6TMbri+FWPBIRjrvUL
         chNB86pJGfw9DOAtrk/YdnqjYPvcQxPgaF9skhC4CcghLP+XvjaiSrIBnANLdF9tnanX
         8PMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453590; x=1790058390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g3c12DWMhGwiCLWNDvwB0sFp19akobAYWnpYzYqkItc=;
        b=HiNaTiX8R7zjY6Wq2DisVS+HQb7tAle3G6gr5F78DrI7/4xEIK/P5mzEbCmlVwQk8W
         UAGb1/kgXO+3qwi6wSmfhmrJQWcE0lAP9MBkPW5Q6iD6ZD/eYHyYHyVNI9gbUVlOub83
         y2rcyiAdsJZBEigP+LxDN54bJUoepEqr3XExs+I+xsBiPJLMn8kxik/tm8vcv3IlpNrV
         zGUuFC2NFnHhmAy+gyYZMJFtzDtooZXsEw8AVVYhumtkoevvBKTHifdZtVItnLx9yrfy
         oLweGNSskreWimCvm1CfJceXLNrfIch17OzZjCSUlB3XKEsn9n2laEDvgxguo1zw/wEn
         XZMQ==
X-Forwarded-Encrypted: i=1; AKwUvByFJ3LWtROhDQR2fS7GKHeOuWM6mVIYT+69Qx56lwDGWuQBK81QsU4sd+g3g7QcIcijdisz0ivOXA2ZpV4=@vger.kernel.org
X-Gm-Message-State: AFuF++lkLFtL/SQ+SFuOfoltIpJfvp9ZtPTCzMMEW/HTYKV3Ja7NoojL
	SE2aREv5MsjFj97m77tUgRKrf2dGBQRfvhrr5snHdE4hdkcDTlEbTkFd
X-Gm-Gg: AYBFou1Ce+yCh1gRLOaRhyYr9N1P/qIFrNuXkHL/yqdNKFuU64SHgi661Tiexb88yAK
	4X1qsHSlAJyzu2VhecfHiMiPLztBCNR2qpH/B9x47jmTBkbj7aAakx9OnBEicVTk/2L114T2H4Z
	iyy5qJa7vmaevVUdgaECvXkhU+Clq+lIpS6bEQsR4RRe+aF7TgtfDXiCjy/KUKuK+5rLWauyjJs
	TN+Ry8YX0XrxPpD1F2ts8e5TgmpHMnSB4k3gWE/i3J1+Ii5T2iWqrQgkpt9/6f833w7ubpN7kkF
	eJ8S+4IGVvOu3H+2wQkosrq5vIUHYccqvu6Q9r3mCpdQVklqQ0vi/wJNqfeycWG+cWPEcVZxuPp
	JBmh91nbciZftin40g8Oo1zZErCSeQ8L4ZOHSlj9fc3lW8Ash4VlupFBX/rTCjrtMs+ihEQ00hT
	niDgjPIiqcONczNVaMgdHEktH3tqxeUhHlViXIJe7AAOMPPbZYk675ZvLIKMbuJ3fB
X-Received: by 2002:a05:6a00:3386:b0:84e:4d6:78fe with SMTP id d2e1a72fcca58-86f833446e5mr12648954b3a.3.1789453590195;
        Mon, 14 Sep 2026 23:26:30 -0700 (PDT)
Received: from 92 ([122.161.76.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b29dc0b1esm5683875b3a.48.2026.09.14.23.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:26:29 -0700 (PDT)
From: Aayansh Ranjan <computergod47@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayansh Ranjan <computergod47@gmail.com>
Subject: [PATCH] kbuild: fix grammar in output Makefile .gitignore generation comment
Date: Tue, 15 Sep 2026 11:56:13 +0530
Message-ID: <20260915062613.13761-1-computergod47@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the grammar in the comment describing the generation of the
output Makefile .gitignore file.

Signed-off-by: Aayansh Ranjan <computergod47@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4ad67b737..ffc8732c7 100644
--- a/Makefile
+++ b/Makefile
@@ -681,8 +681,8 @@ ifdef building_out_of_srctree
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
 # output directory.
-# At the same time when output Makefile generated, generate .gitignore to
-# ignore whole output directory
+# At the same time as when output Makefile is generated, generate .gitignore to
+# ignore the whole output directory
 
 ifdef KBUILD_EXTMOD
 print_env_for_makefile = \
-- 
2.55.0

