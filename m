Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E923F44F7
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913142; cv=none; b=sOkgm6WVRfmU2NhayRboC6a4OyPafPGz9acU4eSB+lYXYAGGAJs/RUN7O5vBfDfefBrX4RH3Wa8PRtZWB8GFuvUffDrnT/FsLEFJQyluIrYPCXC0TJHLADWqe5DVMxZ0y/2qo1f4LSUw9wjkZi2Yyz8Tlxi4aMGB5ybPn5XfCv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913142; c=relaxed/simple;
	bh=bz9v35N2cN4t57fWXR/OJ7LMidXqXsdG2U9KmdaQgh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=endMpW8hpTcV3sHZfwGg4IAKcnDTj26wQYgAa+5iO6/iVsEs1j1JU1qmBZrnb6IB3VRrwUn+rv5HG0WN5gO/rZdHcBLT7mIzr8DuG7w5ADe1+d1+f0dOv+pq1fqVjRH5SUixsA16D4PFqQCfy/c6ivi/sTNJfPdcBtKsbJPGm5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b=ZuIHAB8k; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thingy.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thingy.jp header.i=@thingy.jp header.b="ZuIHAB8k"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39682983a0fso914367a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thingy.jp; s=google; t=1787913140; x=1788517940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bPbzwg65kTppiD5kuo4uTU23dG9XkVtn/MhS9ZuANvA=;
        b=ZuIHAB8kRwM5BgcfIFu0wRKtQ73keJFKo9ttkjH/Kr8DFQ2MPvyAxllcSe6OLSoehH
         qWR4WG298JKPxrwloxnpjZbx+gNps5YKSa5M0g0EtU3SQkIUFlxoJWtwFfUJTe5KtRRX
         0Atr5dq3pZSykd3z4U6bWfxCSM2ewcArJ9Po8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787913140; x=1788517940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bPbzwg65kTppiD5kuo4uTU23dG9XkVtn/MhS9ZuANvA=;
        b=cG2kNUKFPeEE0XpOwJoQxyvHsOntT6h8BRgbFULaZxPhJlpzXvXUVk993r1+RC4l2T
         HlG4uM5j2HMec3ptBPRHo0r+wk8W9EaMf+8B4opvtNyADQpUNP05GqIf9huUz2rOt6Se
         6/tti+PeCigdPP2IQPokCSavWb2HAosZe9jfRx1mybxxqw01n/PViupCAnxLfI8yLhkY
         4VZrvBpwt5OPpZILO/iRat5dqmX7F8ZgPdQnF+d/7l5W8nTInmmiKlPR3rWCqNU+ypGB
         mhatle0rlSrUkjmnkeznfJ4t9Q6+R0+b4Yxrv5w0S0wkV/QAhH+997bvHtWFvSpH1An5
         SeuQ==
X-Gm-Message-State: AFuF++kheTnZ1P93mWLD7nLyPgb0oazzzBIyEpsP1QBHxPFjGId5MMG9
	ErJVHVYee095RM6KqEpOCegszi5e5PSgYwaUJZDez5di+9KzTKqK+Hjec582CcnqabyQIDD/bF2
	9eHEV
X-Gm-Gg: AR+sD12HOYdQ/KoRKTdqf9qVAhaZB0iVYJeMRrsbTNZpOvrxklMRJ4370zs5famGQNE
	bv8FLCAJXIN6XjKAedPg9fIUBDdIVORsXZGYmXve+Oi4Xt/Zqja6aBMLk45B6S8WpZOwi5JZ9GS
	3Xx+SCdy9dHRiwHk+a3v8s8v/6n1ar77asSxLM6xQduMS7FnHOJZtMEgOfEqIMf/OBS5hQFb8tJ
	rwQJsagmlzOgmTBCMsf03pge44ue+OyuRo2Mc2qIxzg6tTfFVc7NSFqyb7X6WxJ2YF/xLe2mg2Z
	LxGV3N61Sr6FhoST1VgQQJjwv//uGMMd/x6fzBm0BUbydR18w2QE+0CnBw2yPV3XzmZQBUSDrRG
	o3hA8SLVc0d/P3D1qGkfok+hFpZ2a5xphivUN2BFYdWwg/E8oa/nZde9BkYI8Dtz9A2d3QVap+/
	beH/CE1y7LbX/43c9u/WE/Nn039adtZQFGuvDPMRMC5NRus4haIjVlpA5eQZvhHD14dgGh+Y4HM
	Fzm3MIJ564=
X-Received: by 2002:a17:90b:4a52:b0:393:288:29e3 with SMTP id 98e67ed59e1d1-396d0eda189mr11170859a91.10.1787913139808;
        Fri, 28 Aug 2026 03:32:19 -0700 (PDT)
Received: from kinako.work.home.arpa ([2400:4162:2428:2ffe:a973:53e4:1a28:8545])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-396dda7835dsm2017492a91.5.2026.08.28.03.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 03:32:18 -0700 (PDT)
From: Daniel Palmer <daniel@thingy.jp>
To: w@1wt.eu,
	linux@weissschuh.net
Cc: linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH 1/2] tools/nolibc: Add sendfile()
Date: Fri, 28 Aug 2026 19:32:04 +0900
Message-ID: <20260828103205.384589-2-daniel@thingy.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260828103205.384589-1-daniel@thingy.jp>
References: <20260828103205.384589-1-daniel@thingy.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is useful because it allows copying data up to 2GB from one
fd to another without a buffer in userspace and with a single syscall.

For 32bit kernels we use the sendfile64 syscall to allow for 64bit
offsets to work.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
---
 tools/include/nolibc/Makefile       |  1 +
 tools/include/nolibc/nolibc.h       |  1 +
 tools/include/nolibc/sys/sendfile.h | 41 +++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)
 create mode 100644 tools/include/nolibc/sys/sendfile.h

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 6d213d372bf8..668883f13cd6 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -59,6 +59,7 @@ all_files := \
 		sys/reboot.h \
 		sys/resource.h \
 		sys/select.h \
+		sys/sendfile.h \
 		sys/stat.h \
 		sys/syscall.h \
 		sys/sysmacros.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index faa94f247281..352a207bbedc 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -106,6 +106,7 @@
 #include "sys/reboot.h"
 #include "sys/resource.h"
 #include "sys/select.h"
+#include "sys/sendfile.h"
 #include "sys/stat.h"
 #include "sys/syscall.h"
 #include "sys/sysmacros.h"
diff --git a/tools/include/nolibc/sys/sendfile.h b/tools/include/nolibc/sys/sendfile.h
new file mode 100644
index 000000000000..7136c0eee547
--- /dev/null
+++ b/tools/include/nolibc/sys/sendfile.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+/*
+ * sendfile for NOLIBC
+ * Copyright (C) 2026 Daniel Palmer <daniel@thingy.jp>
+ */
+
+/* make sure to include all global symbols */
+#include "../nolibc.h"
+
+#ifndef _NOLIBC_SYS_SENDFILE_H
+#define _NOLIBC_SYS_SENDFILE_H
+
+#include "../sys.h"
+#include <linux/unistd.h>
+
+/*
+ * ssize_t sendfile(int out_fd, int in_fd, off_t *offset, size_t count);
+ */
+
+static __attribute__((unused))
+ssize_t _sys_sendfile(int out_fd, int in_fd, off_t *offset, size_t count)
+{
+	__nolibc_static_assert(sizeof(*offset) == sizeof(__kernel_loff_t));
+
+#ifdef __NR_sendfile64
+	/* 32bit kernels use sendfile64 so offset is treated as a __kernel_loff_t */
+	return __nolibc_syscall4(__NR_sendfile64, out_fd, in_fd, offset, count);
+#else
+	__nolibc_static_assert(sizeof(*offset) == sizeof(__kernel_off_t));
+
+	return __nolibc_syscall4(__NR_sendfile, out_fd, in_fd, offset, count);
+#endif
+}
+
+static __attribute__((unused))
+ssize_t sendfile(int out_fd, int in_fd, off_t *offset, size_t count)
+{
+	return __sysret(_sys_sendfile(out_fd, in_fd, offset, count));
+}
+
+#endif /* _NOLIBC_SYS_SENDFILE_H */
-- 
2.53.0

