Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05DE4D598A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060024; cv=none; b=ssDHkXOHcZkSeivxr+jhlXojfvQAoh3PVwPgvZ9y0jRdCm/5I/qKs2AGOV1v4RuNj3XwimOrQ6vNqpkC7hNr6wKpg7Me4VRRAGDxJO7zG0laM3hwlh+V27NvZnZzz3StQMufMPr0gpm8flbmvWKLTJ7m9HGGuONvtEEodcFj3VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060024; c=relaxed/simple;
	bh=zjPPUGvEe8dgvgWJneVATVbejdh8h+AuLDTIjj+s/TM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JdGtfSH798hzwDayNfQiG/DYc9J557zSvhIw+cbJ7IIIAoSFK2Qw7x75PSBs5m61bRz0uM3Kuw2kX5rUuXgS+Jlcp6z1qhlBn7B9RURIolHTwI6UYgDnNThzVgFH5aXcNvkphsCho7xRLG7qGHodpMw0gDVcQFB+ecOQIRAqV+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr; spf=pass smtp.mailfrom=dgu.ac.kr; dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b=bXRAl74V; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b="bXRAl74V"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398c066106cso2957484a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dgu-ac-kr.20251104.gappssmtp.com; s=20251104; t=1790060022; x=1790664822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5hkDZLfpwpTgVNGBTeOG5mY/TLY3Zz2ZIUT6PQoExQ=;
        b=bXRAl74VQBriKiZsVmhneQm8AKCA8jz2HUnNHwVXdXO2pD+SVfklwTt9c24llTc65j
         5GBVT7mcHCioH0y65yuadWFQiwsYSNEgvxSTmatj2d1uaW7eyHqt7qOJMbK2zUIEsldr
         /i0TPWFGM1M96WdTib+LtH9l53SxGXanjnq6y+66ecdRbMJ7TZktc1Vrl5PANI0ntiRm
         Dp+C19Y2EjHKK5HCuKW65zUbE42BSGqm4kcMyl9THSDP0MnjcfQJcOuA10a/jIEgdJRu
         Mu6L6TOBdZv7umGdIV/psY+U4kTDiPEJHe2/oL/GlHn2XPrluNz+4o1PXiqt9hSOeOdy
         uKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060022; x=1790664822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5hkDZLfpwpTgVNGBTeOG5mY/TLY3Zz2ZIUT6PQoExQ=;
        b=KtEGS4Mxd19szuE+H1zlvkNzzpBGmg9ZkiuGfT4kRCaX2nC+p9mNyJ9Zmh8MpBysJk
         XRDg62HPcvAya3xorYUNuYTlmPwW3fb/pCno8naZlwUlkXbEmNuFn2HNScJ9DyAiWp15
         CAuBR0/FflkdfWSkrBai+by2N2BcOWcr9WZLiJs9S+iHV7zcwT+cUj+cQsTernGjp80T
         W114GZX1M0Sy7b5JLWIK6LlwdyiE32wTzlIAezXgGamBig44Ydy9Yfw/kfzNdkqRJSV+
         6HvtTluePESY9uOHnKzxZxZOSriIW+D85yUS/qwZ8DKXkjAW7EoCPV81TwsPMCpRKhal
         t7UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKkWCJqD1AjaCxhINkT6RDMkiTVC8nPKkAv/k132eSiLxH4rMWt3v1lVCU97xaxnKez7G0T/T88KrOAuw=@vger.kernel.org
X-Gm-Message-State: AFuF++meJPBtxiVBKwCBJTJm6Jl6EK6yOaRcN4bWc4UMwwEPDMHtmBQS
	P44xtUg3LoI4gtdL6mZq7IolQi8Syf//Nw+/8rogGd88lpdTH479LuQf4pOIyGmYKC0=
X-Gm-Gg: AYBFou3PqDg6jv83Gp2fbdC4DAoFOWYmaLvQeb7T2XaLAhHBNeoY+yNPi0usttGEQ/k
	XnZXXXdFSnMPWFgOAHYFVJjk3b3fNlyYkGCOU6E6I3FdUxlyB0t8HICNBNUd8dw2oNWiWClQol4
	mruzodgY+NQ2YmdRkzExxDN8SxZvE0bzQGGB1z7HIfEHouNwS4gWx+0xcF4BI1zAjOx0khsH8Tt
	04iF4ZqTCdAqqlBQJGMwd4345lMUQXuOmIZRTZN94HwVe9Uioh526c13bkOSNASt02EQlI4Yicy
	mlHGqhx0JnBE0epnAbRX6B3dOvf1Z4V6Gi10r8tvCxeTuJpIlQnKobpTJRBzxywAdBaJiYPLjNi
	tghPoyLEB8gwRqJ6xfjPMcFQUIYEEm/8o+LGFUz4IUNT1Uw7J20fKbywhmXX6V3RrdJJ0uVHess
	MIF+RxLTpO7ChUTU+WBwc6sM+bVMWstLJVeKT4AYsR+XDvI9o3hLdzBgAa9xDrk6IslLF+ocRJy
	iXCfw==
X-Received: by 2002:a17:903:3c48:b0:2d5:2f49:b3f4 with SMTP id d9443c01a7336-2df609ad79dmr2778935ad.2.1790060021931;
        Mon, 21 Sep 2026 23:53:41 -0700 (PDT)
Received: from localhost.localdomain ([175.193.106.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d0581f0sm4534855ad.74.2026.09.21.23.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:53:41 -0700 (PDT)
From: Park Tae-sun <ts930@dgu.ac.kr>
To: Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Park Tae-sun <ts930@dgu.ac.kr>
Subject: [PATCH] selftests/mm: mremap_test: handle ENOSYS for userfaultfd and add missing newlines
Date: Tue, 22 Sep 2026 15:51:43 +0900
Message-ID: <20260922065143.118702-1-ts930@dgu.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When running mremap_test on a kernel built without CONFIG_USERFAULTFD,
test 26 fails:

    userfaultfd: Function not implemented
    not ok 26 mremap move multiple invalid vmas

This happens because mremap_move_multi_invalid_vmas() only checks for
EPERM, so ENOSYS is treated as an unexpected failure instead of being
skipped.

In addition, ksft_test_result_skip() in both
mremap_move_multi_invalid_vmas() and its fallback stub is missing a
trailing newline, which causes the subsequent TAP summary count to get
stuck on the same line:

    ok 26 # SKIP ... - missing uffd# 1 skipped test(s) detected...

Fix this following the switch pattern in guard-regions.c (lines 1498-1506):
check for EPERM (advising running as root) and ENOSYS (missing uffd), move
perror() to default so expected skips don't print noise to stderr, and add
the missing '\n' to both skip strings.

Tested:
- On a minimal kernel without CONFIG_USERFAULTFD in QEMU:
    ok 26 # SKIP mremap move multiple invalid vmas - missing uffd
    # Totals: pass:22 fail:0 xfail:3 xpass:0 skip:1 error:0

- As an unprivileged user on host (vm.unprivileged_userfaultfd=0):
    ok 26 # SKIP mremap move multiple invalid vmas -
          no uffd permissions, try running as root
    # 1 skipped test(s) detected.

- On a kernel with CONFIG_USERFAULTFD=y in QEMU:
    ok 26 mremap move multiple invalid vmas
    # Totals: pass:23 fail:0 xfail:3 xpass:0 skip:0 error:0

Signed-off-by: Park Tae-sun <ts930@dgu.ac.kr>
---
 tools/testing/selftests/mm/mremap_test.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/mm/mremap_test.c b/tools/testing/selftests/mm/mremap_test.c
index 131d9d6db867..1fa2f6aa1a19 100644
--- a/tools/testing/selftests/mm/mremap_test.c
+++ b/tools/testing/selftests/mm/mremap_test.c
@@ -743,14 +743,19 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp,
 
 	uffd = syscall(__NR_userfaultfd, O_NONBLOCK);
 	if (uffd == -1) {
-		err = errno;
-		perror("userfaultfd");
-		if (err == EPERM) {
-			ksft_test_result_skip("%s - missing uffd", test_name);
+		switch (errno) {
+		case EPERM:
+			ksft_test_result_skip("%s - no uffd permissions, try running as root\n",
+					      test_name);
 			return;
+		case ENOSYS:
+			ksft_test_result_skip("%s - missing uffd\n", test_name);
+			return;
+		default:
+			perror("userfaultfd");
+			success = false;
+			goto out;
 		}
-		success = false;
-		goto out;
 	}
 	if (ioctl(uffd, UFFDIO_API, &api)) {
 		perror("ioctl UFFDIO_API");
@@ -965,7 +970,7 @@ static void mremap_move_multi_invalid_vmas(FILE *maps_fp, unsigned long page_siz
 {
 	char *test_name = "mremap move multiple invalid vmas";
 
-	ksft_test_result_skip("%s - missing uffd", test_name);
+	ksft_test_result_skip("%s - missing uffd\n", test_name);
 }
 #endif /* __NR_userfaultfd */
 
-- 
2.43.0

