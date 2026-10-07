Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686F740B115
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791356101; cv=none; b=eUsZkN8vhd6+3+DkbboJmsDDgrqrKo+i6Dv9N9GQCHbis85oicevMbBy/8u6iYxrKmj/SVSeXVdsAgAQQ4qeYsxYty+nSYSQ+7luZc+yCjhZApr7pzRdfrdS73fkxUdMQdFMerPIGqw+HcHHfpbgkC5+WUZTWdHCuGq827YQJ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791356101; c=relaxed/simple;
	bh=mnDl2TmTR5r6RvnBg2xMLRQMj1KsNWT377F6HtXgKSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UP2cksFAMgMlWUNP7yTDLLHTk7VqazdpDN8s1BTjnAgbGiCgDc5itOgoxS/i8tTNnAgJON6NhXwEJ97sZ/43kPrMO++n+xXs2ipQWAl72ATafnEtBGPH+L66qSfXKRRJ+DG8T74D/YQO4HXsHt0cLUXREkzma4dxFrOXofRjQ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BbDpuyhR; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BbDpuyhR"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-88c72646f03so1844645b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791356100; x=1791960900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dFwfJXMVMMQ8FETY40B7Zp7w/Z3aCe6CKuTJ3GUd91c=;
        b=BbDpuyhRAj0dnJQapvZL5rmTjMmKU+u2BORSovKtdGQKB4yxLeZdMV5Qul9VIRgtJ0
         MHiyFf5WBckk1T5rXiTm+wtGGvzSaMVqe4qXyWjmvXUEcJl4jNuLHGu9Oo0LtG/dU6p6
         mWA/loIEMiZDPEboDXrhYPC7X91FFVFn8wjSBWw8e27cEVf13yruzfsMnwN8NC/Mv5Iq
         vibNos/KU2EH8AbaaXaXo9U7EyKeke+4W+w99ZoBg3SDJ2VgmznoE0nf3tDUcmcXY0m3
         8P5bCNGgSJgp73jZzMVzOHEN8IT+x5RKYOU3Qv8VDJNk48h1q+wjJcnxITvkD0X2VzDs
         OXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791356100; x=1791960900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dFwfJXMVMMQ8FETY40B7Zp7w/Z3aCe6CKuTJ3GUd91c=;
        b=sskXk1udGsAIRS+4w0VyBAXHwKg8umy59v0R4Vs5xKB1hha2gsjmEIx83mmxeWGy7h
         yXIAhqoNWYs1ce4jplJGUQ11f4CjRXI7A+6xSQYgctpNVCVNpAieZd6lXYqygVlPnA3y
         jEbkpwB9ttv8okpGA2As4h4xjp5VJJGQ9liP5beDTdlHzBzJ2FWS0VFQ3h5sFWJpVBYA
         m7UiZv9B5W0lJma57xIPx5NDnKvaqMU+Nyx/jxc7+ss6L+Pkg3iOu/rJ/Y/pvaelGvst
         GLRrEsd/SNuZ1K6iYlRDe3pnC1GiNKORZWUyLnKR7hzrlu0W+jAT305uWMfkxj/ARIGC
         Gxyg==
X-Forwarded-Encrypted: i=1; AKwUvBzDRXibpiQpXDXgdxErN+hU+Un8Q6cb4dCaFtda+E0B/PxwLPXy7J2RWMFHTijwVHR6Nao1X7RGkAW+JOM=@vger.kernel.org
X-Gm-Message-State: AFuF++kfYlqvSnlOKj9FKQc9h2+8Oyd74GWE3Xx2y3LDAflvcbkpFHq2
	TGDUumsnQb/5iBFSsh3nakarB2HRi0CT1Ovl3/ai4rMuYRWuqARoG2cM
X-Gm-Gg: AYBFou3qlbktKRBccFXaNcJsXUqZr18A+mupOh4vy9LIx/YVp2/qSxZiI9VQQHc8FSg
	p4gnYMRkjbsn6vrqJW3JJDDPGPMDkE65I6hPruIP4Qb6ufvGrVwGqBC0SatkncxydFicTLL0pOJ
	7T2AI05pNWNESaSu+SfhLJ6ob0cgdo6fE3OO1x53rNRYQhxlyqncUBXbiTLICR3tSfL0tmcnzvP
	5zXA+jYHNNRlhu9L0Ns2lo1xe9N7hapg0fycH7qNJntmxBA9ixek/PDpfMz8FIaLMMLyraS5Sor
	zoTICNy/KQMdD8+XyPI4LKMsIp+Avz1aVzE9yMdHnwyuejfnjVLv3xeuyhoRBn4VeFKVosqeZla
	Kdp560MmFLYj3Gv/YLfyA5Jac2Oy4/6hySH/RSlmV+caWrClxexknqqAwZjUGpk5FoLnq2X+J73
	ebHhq+p98gXffwTlLPcowr5Cz3cu4HMDJbOgHaH3Cx5pPEr9jwxOGQi9ivrJ0+GdJZpfOYXKXpI
	46+H8KlhbPduZdhiJOiyDnOsgX5h8xq
X-Received: by 2002:a05:6a00:27a7:b0:882:bbf4:7dc1 with SMTP id d2e1a72fcca58-891b4aeee03mr1065505b3a.42.1791356099539;
        Tue, 06 Oct 2026 23:54:59 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89188ff26f8sm874001b3a.26.2026.10.06.23.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:54:59 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/perf_events: test text_poke permissions
Date: Wed,  7 Oct 2026 12:25:37 +0530
Message-ID: <20261007065537.1227045-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that a privileged task can open a text-poke perf event while an
unprivileged task is denied.

Skip if text-poke is unsupported or perf settings prevent the check.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 .../testing/selftests/perf_events/.gitignore  |  1 +
 tools/testing/selftests/perf_events/Makefile  |  2 +-
 .../perf_events/text_poke_permissions.c       | 99 +++++++++++++++++++
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/perf_events/text_poke_permissions.c

diff --git a/tools/testing/selftests/perf_events/.gitignore b/tools/testing/selftests/perf_events/.gitignore
index 4931b3b6bbd39..2a475f176feed 100644
--- a/tools/testing/selftests/perf_events/.gitignore
+++ b/tools/testing/selftests/perf_events/.gitignore
@@ -3,3 +3,4 @@ sigtrap_threads
 remove_on_exec
 watermark_signal
 mmap
+text_poke_permissions
diff --git a/tools/testing/selftests/perf_events/Makefile b/tools/testing/selftests/perf_events/Makefile
index 2e5d85770dfea..02aa6e7c6e9a2 100644
--- a/tools/testing/selftests/perf_events/Makefile
+++ b/tools/testing/selftests/perf_events/Makefile
@@ -2,5 +2,5 @@
 CFLAGS += -Wl,-no-as-needed -Wall $(KHDR_INCLUDES)
 LDFLAGS += -lpthread
 
-TEST_GEN_PROGS := sigtrap_threads remove_on_exec watermark_signal mmap
+TEST_GEN_PROGS := sigtrap_threads remove_on_exec watermark_signal mmap text_poke_permissions
 include ../lib.mk
diff --git a/tools/testing/selftests/perf_events/text_poke_permissions.c b/tools/testing/selftests/perf_events/text_poke_permissions.c
new file mode 100644
index 0000000000000..c42af32c32c4d
--- /dev/null
+++ b/tools/testing/selftests/perf_events/text_poke_permissions.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <fcntl.h>
+#include <linux/perf_event.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/syscall.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+
+static int perf_event_open_text_poke(void)
+{
+	struct perf_event_attr attr = {
+		.type = PERF_TYPE_SOFTWARE,
+		.size = sizeof(attr),
+		.config = PERF_COUNT_SW_CPU_CLOCK,
+		.disabled = 1,
+		.exclude_kernel = 1,
+		.text_poke = 1,
+	};
+
+	return syscall(__NR_perf_event_open, &attr, 0, -1, -1, 0);
+}
+
+static int read_perf_paranoid(int *value)
+{
+	FILE *file;
+
+	file = fopen("/proc/sys/kernel/perf_event_paranoid", "r");
+	if (!file)
+		return -1;
+
+	if (fscanf(file, "%d", value) != 1) {
+		fclose(file);
+		return -1;
+	}
+	fclose(file);
+	return 0;
+}
+
+int main(void)
+{
+	pid_t child;
+	int fd, status, paranoid;
+
+	ksft_print_header();
+	if (geteuid() != 0)
+		ksft_exit_skip("run as root to verify the unprivileged permission check\n");
+
+	if (read_perf_paranoid(&paranoid))
+		ksft_exit_skip("cannot read perf_event_paranoid\n");
+	if (paranoid <= 1)
+		ksft_exit_skip("perf_event_paranoid must be greater than 1\n");
+
+	fd = perf_event_open_text_poke();
+	if (fd < 0) {
+		if (errno == EINVAL || errno == E2BIG)
+			ksft_exit_skip("kernel does not support perf text-poke events\n");
+		if (errno == EACCES || errno == EPERM)
+			ksft_exit_skip("root cannot open the probe perf event\n");
+		ksft_exit_fail_perror("perf_event_open probe");
+	}
+	close(fd);
+
+	ksft_set_plan(1);
+	child = fork();
+	if (child < 0)
+		ksft_exit_fail_perror("fork");
+	if (child == 0) {
+		if (setgid(65534) || setuid(65534))
+			_exit(2);
+		fd = perf_event_open_text_poke();
+		if (fd >= 0) {
+			close(fd);
+			_exit(0);
+		}
+		if (errno == EACCES || errno == EPERM)
+			_exit(1);
+		_exit(2);
+	}
+
+	if (waitpid(child, &status, 0) != child)
+		ksft_exit_fail_perror("waitpid");
+	if (!WIFEXITED(status))
+		ksft_test_result_fail("permission-check child did not exit normally\n");
+	else if (WEXITSTATUS(status) == 1)
+		ksft_test_result_pass("unprivileged text-poke perf event is denied\n");
+	else if (WEXITSTATUS(status) == 0)
+		ksft_test_result_fail("unprivileged task opened a text-poke perf event\n");
+	else
+		ksft_test_result_fail("child failed to test text-poke permissions\n");
+
+	ksft_finished();
+}
-- 
2.43.0

