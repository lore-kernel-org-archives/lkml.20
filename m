Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8BA46984E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369012; cv=none; b=jCZ+OwSOg4PrbC5vj1p82A9WcenPQ2m2iaYohWmfJuuuxDhOqOf3r9dQmLJuySkofEc4NRvJNwG6WK99fY43rm9v2TFZUuPSN4dXSyVmJwi3E6+qLHioSZSj55+k15zWIR2JbqeiFCAVDK9G5RqEKl0Ck+w9aTwniLZZYy/LA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369012; c=relaxed/simple;
	bh=VU+1mCWqo7+B67ddwoUD1gZe5snWq20ItfRTexL+qjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBodQLJK4+/qSRriW7kCCXX7HP6Mkz/HV2Jo6isIE6sFfcaXVcpU2QNX2oqRzJ8a/nvH8zlsyXbiLXgazI1NJy8gD88OnlGzI0GXCgUslejgP6Le1jWUiePrrjFA+eQjEoIDhgu8d/cKAOZR6DFMdb9Ec9W7lJEbQuPcqGpTH0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtPPqZEF; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtPPqZEF"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-88aea027391so1975822b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791368997; x=1791973797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LSdEPaTFMwA4pJZC+adjE3HC41fXyUvfQa8u0qcPt5U=;
        b=mtPPqZEFuEIIPgmsmct/v/UdBkffF0fMInWWUpwfyUDMCkeEKk3FSNeZjWHVmA5VQf
         7juBjQVdfcW4OYwwCNHsqxUqo0PvGPdH8G7I+tuHcBTlA3CetKrLNQQY3KrO5h2nGLeq
         eAow3U99eal4Ka0ZNtUVpQLngsgj2T1ku9lCTR6bnDcww7JUlJBbun90Jy30ztWNdl4J
         OF3E4+njHtoRgsiRNXn+D7jgUlpIZMX7kHQad8HCOoVkE7GuT1I+AsM4/0T0aW2s7bAJ
         71t7H7P8re9pV9NbZYcDCJWcoBMTT75cYyvUkj/2B4cxt8mSLLPci5vZyBU1IGofvwaj
         0jpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791368997; x=1791973797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LSdEPaTFMwA4pJZC+adjE3HC41fXyUvfQa8u0qcPt5U=;
        b=ii+36peznLYjjGIfySMULWgXBUgcZFUZlw4q/7e7JLBQRAagzTmJRhenbLF9oRtc2A
         KUWgmPRxOu3Y+YSvsYgzzs3gCHUqOV6FZnQTbJa9JNyrmkYvd4Ly2Hx+YtH2j9hPS0IK
         S6V44uIpQ4wMx3VLGDaYLJiG3ybwx+rz9GufJLVuykNiHj4+p+TgMqCgphhSB7ua279m
         vw5lR905CM3zVDklDqCG2ASIMBgayebl/0GlanzGSlJOcRcZZz7/tbtkKiCq6pqR0/EH
         iBF/SCsHAoGV69xdR6pwPAIavClvVP91vR7uaVrOW6ObN/GYDYzG2jc9FMIZnp6dTnbs
         pvkg==
X-Forwarded-Encrypted: i=1; AKwUvBw3wO99GtXbF/UTToxbdB5KYtWM5xN5MynYmfi/NeWG74tS2TQYI1j5cFhJVyyZWXO+3JBS912smXdMrRY=@vger.kernel.org
X-Gm-Message-State: AFuF++kzVIQizLWTGaEX/HbptizrZaHh7noM+00DC+JA8SpkkV4/SsgU
	AH5gakTLtsjyOBTWeVfW4JnyjQZJqBYchIEA0Kd6IYmRi6w3VomNiK2I
X-Gm-Gg: AYBFou0cQhOZs5+x6fbxOguX2mZRz93YJjx/Fmvcsbmn4Jz7uf8MrdEhjp1XABD5a5/
	M3Ib3SEU6sLZycDcOepNYHAUdw2vs+2lPco/7vQ2NO0Zo8dmL84cbQCFL/99oPsWu1fDSgflg1G
	adwnlK7Y6I0NHMGHlCFp2LbDQR64bI0Vndy2irdPDO4yBponEJMGt9uvZpB5Ql792Sca2Ho4/Mu
	L7B8lxqxY1ucozriILaXyWoXHqsFE93x6QWrEjQ5spnf3BU5A158l9jQG7Qs0hnwxG0WZg/J4Is
	34AYRlDsZ93dIhErdC+gp2SIBquDX+ykeYVJYpMNrgIl1IfU4VfUAphj8GyXDqOK2noxXdU0jjO
	P/e0VTq9suOBoZsGHGz2d3Mks4+GQ1KOOkXvrm+M7xeNn9FlnQIu6EclBDr6EU/cnAqfq4zvtZW
	aZbHdM6diDFDcrS0iFTk+9lFZtrTCqDH3SF8q635nDsP5eupPG9FPgg33khjeOTUZ8H7U9K/GnG
	1VNcrvw9mtb+133IAM+Zs0oI/Q=
X-Received: by 2002:a05:6a00:852:b0:891:6aeb:84fc with SMTP id d2e1a72fcca58-891b3f28e06mr1514627b3a.22.1791368996941;
        Wed, 07 Oct 2026 03:29:56 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-891894f75c4sm1102953b3a.38.2026.10.07.03.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 03:29:55 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sahaj Chaudhari <sahaj123.sc@gmail.com>
Subject: [PATCH] selftests/prctl: Test PR_SET_MM_AUXV terminator
Date: Wed,  7 Oct 2026 16:00:33 +0530
Message-ID: <20261007103033.1549957-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that a shortened vector supplied through PR_SET_MM_AUXV has a
valid AT_NULL terminator when exposed through /proc/self/auxv. This
catches stale AUXV entries left beyond the supplied vector.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 tools/testing/selftests/prctl/.gitignore      |  1 +
 tools/testing/selftests/prctl/Makefile        |  1 +
 .../testing/selftests/prctl/pr_set_mm_auxv.c  | 42 +++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 tools/testing/selftests/prctl/pr_set_mm_auxv.c

diff --git a/tools/testing/selftests/prctl/.gitignore b/tools/testing/selftests/prctl/.gitignore
index 05d5e31661dfd..089af0296aeca 100644
--- a/tools/testing/selftests/prctl/.gitignore
+++ b/tools/testing/selftests/prctl/.gitignore
@@ -4,3 +4,4 @@ disable-tsc-on-off-stress-test
 disable-tsc-test
 set-anon-vma-name-test
 set-process-name
+pr_set_mm_auxv
diff --git a/tools/testing/selftests/prctl/Makefile b/tools/testing/selftests/prctl/Makefile
index e770e86fad9ac..a21811a8f6a06 100644
--- a/tools/testing/selftests/prctl/Makefile
+++ b/tools/testing/selftests/prctl/Makefile
@@ -6,6 +6,7 @@ override ARCH := $(shell echo $(ARCH) | sed -e s/i.86/x86/ -e s/x86_64/x86/)
 ifeq ($(ARCH),x86)
 TEST_PROGS := disable-tsc-ctxt-sw-stress-test disable-tsc-on-off-stress-test \
 		disable-tsc-test set-anon-vma-name-test set-process-name
+TEST_GEN_PROGS := pr_set_mm_auxv
 all: $(TEST_PROGS)
 
 include ../lib.mk
diff --git a/tools/testing/selftests/prctl/pr_set_mm_auxv.c b/tools/testing/selftests/prctl/pr_set_mm_auxv.c
new file mode 100644
index 0000000000000..934ff480c0f4d
--- /dev/null
+++ b/tools/testing/selftests/prctl/pr_set_mm_auxv.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <elf.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <sys/prctl.h>
+#include <unistd.h>
+
+#include "kselftest_harness.h"
+
+TEST(set_mm_auxv_terminator)
+{
+	unsigned long auxv[] = {
+		AT_UID, 0x1111,
+		AT_GID, 0x2222,
+	};
+	unsigned long result[64];
+	ssize_t len;
+	int fd;
+
+	if (prctl(PR_SET_MM, PR_SET_MM_AUXV, (unsigned long)auxv,
+		  sizeof(auxv), 0)) {
+		if (errno == EPERM)
+			SKIP(return, "requires CAP_SYS_RESOURCE");
+		ASSERT_EQ(errno, 0);
+	}
+
+	fd = open("/proc/self/auxv", O_RDONLY);
+	ASSERT_GE(fd, 0);
+
+	len = read(fd, result, sizeof(result));
+	close(fd);
+
+	ASSERT_GE(len, (ssize_t)(6 * sizeof(unsigned long)));
+	EXPECT_EQ(result[0], (unsigned long)AT_UID);
+	EXPECT_EQ(result[1], 0x1111UL);
+	EXPECT_EQ(result[2], (unsigned long)AT_GID);
+	EXPECT_EQ(result[3], 0x2222UL);
+	EXPECT_EQ(result[4], (unsigned long)AT_NULL);
+	EXPECT_EQ(result[5], 0UL);
+}
+
+TEST_HARNESS_MAIN
-- 
2.43.0

