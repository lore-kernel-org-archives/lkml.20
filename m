Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5CB363C48
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 05:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791438719; cv=none; b=Ok46Gl/H3qpWcP1dB/quYLnp02Ft03voBLJuDeTJwp3zyHn8GZuBsvAMix0vvBvQ/enYAbOV1Eizf940xmEwiyfkl93URdQGOrx4jnHhgIKRDd0CGvjjRhWh0glJcOEGBoIiQWWy6jgXDjyAtRfY2jVqtrFM4Qghvwv6It4q90k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791438719; c=relaxed/simple;
	bh=dMfCKBLj00WS6ud9NDYUeA29CVFfLdKEAWEavgqpzr0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kOPtrIFPPYwXAxVBGPSX5y+2nAKWayf4qq39X8cBG1lv4Aj0fmp4bumEdmXAlDXbqs8Jk+cBDsVwSo9BjJWbrT0UZggaOs51oWnBYLtORm6fnM2Nj2mVePJDB7XL1QQAJi7a45Ol+I/mcWTbTrMZ+pPXpEjkODm+VNcmE/BjYe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxtXKdEc; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxtXKdEc"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so159961a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 22:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791438717; x=1792043517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tgnizjf+WTXk43Y5M7x3KZcvpBPDG9WlcPau0YfMzHc=;
        b=cxtXKdEc6POiYFaVSgFOXNjSZNtSmWpVUU6F8K8xKHxx667AMMbNKVeYkr+pC7hDPv
         IeAuKyaxBXE3gPYOib9Al4ijcC5fTgMOzNpEPihv4+U4ArJRhi7f1TYyXBEhOMAAWyEI
         lt+dqW4Izmd7n4M6c748fz8jHHYBQQvl4HuUJGb92Bqj/rLGycNmf+cpqLOfwMxy2s1W
         kJLxsgZQqxeeLURNxNSMt/+3xDUhEjpdEy/Ky9c7b6iKnb6pL3/ptnlXCkzZuh1pqoWl
         kM99XD4gdJpNq7fPQki+TmxLM64O0d/VU3h5wBNEYOmAqVHVgBS6m+HRJp5w/19zWQ2Q
         mF/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438717; x=1792043517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgnizjf+WTXk43Y5M7x3KZcvpBPDG9WlcPau0YfMzHc=;
        b=C/3UXkQgb72wPEl/T10rjLt2eoYmal7m3HtP3ZY7RshrCYS/FVXSta/YAKdTlnuP1k
         HtJz1Gj/bKogyrJGs8fTc3NU9ov916TWPmQ/B1hfB7fyX+SYhr7Tqj86T3GsAkXYSosn
         DALrjNGfQaoe0EsNsbQMDR5mRy9xDSycHKu/Fwg9hoYxUEJE2AcXj1Di9Ie/PKP5RAty
         mO8yIX7T3d+dcS+yr7NxMo6oe6nGYyOk/0u1mRs95ci8R1/XG2JsChvKES04kruNpZ1M
         x9R0O08fbPof6tA3beWZlzGh3KYBRli0Tpia1uGzGzLRmgDwWpC6ilAXN6n2c93MU2fK
         +NAg==
X-Forwarded-Encrypted: i=1; AKwUvBwaJc43c0jpYP7izDLiZE5FuzNEuQsW6zErugMuVnRUIYK9IE4+Vpoty9+56H5UNAxfHOHyel1+1OfNusM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8L+mT7IsN2rqdZ8Y25INxKszTQUmgJ8eGEK+xylGGBt1DuAFu
	Uoo9fBycyMpj+Jo5biznQfOhdjrUSaFluXfyamhgn8d4JpHTFEWF12f9
X-Gm-Gg: AYBFou1y44u6LhS3ZZE0qALQY4V3OTRg4tH+xPFb/kjIlhCPyUTvp6aUOTC+4gbORQU
	rYF08LAawUOnpwpBh6Pt3IR0W4jNTRO6o58IUWmiuSPxcWpzo/PmiyxtZw3AOzbCVPWiObfDM3/
	dYN/IUtkOFPfCh7+yHNC9j8eqRlcSHlGqh9I9dcDfPvWnJfUiMXDVxMjJg0TWnY8eZ6HTYvGCpN
	eAhSw8CHUAkuhGsfbpqKvIcRQGJCP+1xj4eH+wvV+a1rHkDbbvqHrVPM1psVeRGTXNclXHs0Us7
	MjK0EAtPCQB69/0NHmtVzGo/5nSfF8hRh0jnpfoSXqntC4kDOjzS0Gj0iDZOx/MJqg2NGHyuh+K
	3oxkjrkaaPItpop8UsWmb1RuMeDKW2+HP9xf5OZIny2Wp5BFdAx2Fe7D86AN7YNll4b+7eTMpT8
	Fq3lk1/5mDpbkIR77baBcBhu9pk764q/T0iQPRQBPhVtzyAvWHK8VWwrM7+kKfWSHIUG1fZVXJ8
	apcmJzYFj4c8KDHR6K8E7wF+z6bnvzC1HY=
X-Received: by 2002:a17:90a:d450:b0:3a0:d82b:237b with SMTP id 98e67ed59e1d1-3aaed7eb293mr718759a91.25.1791438716883;
        Wed, 07 Oct 2026 22:51:56 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff5c7db6sm2746571a91.16.2026.10.07.22.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 22:51:56 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: kuniyu@google.com
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org
Subject: [RFC net-next] selftests: af_unix: test zero-length MSG_PEEK with OOB data
Date: Thu,  8 Oct 2026 11:22:33 +0530
Message-ID: <20261008055233.3413445-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A zero-length MSG_PEEK on an AF_UNIX stream socket can busy-loop when
an OOB skb is queued. Add a regression test that sends MSG_OOB and
checks that recv(..., 0, MSG_PEEK) returns promptly in a child process.
Skip the test when AF_UNIX OOB support is unavailable.

Register the test as a normal generated program so it is included in
the AF_UNIX selftest run.

The regression was fixed by commit 6e5ee08eb585 ("af_unix: Return
immediately when manage_oob() returns NULL for 0-length buffer.").

Tested: fails on 7.0.0-34-generic (expected regression); passes in QEMU
with a kernel built from 0c2669a9f4a1.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 .../testing/selftests/net/af_unix/.gitignore  |  1 +
 tools/testing/selftests/net/af_unix/Makefile  |  1 +
 .../net/af_unix/unix_oob_zero_peek.c          | 89 +++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 tools/testing/selftests/net/af_unix/unix_oob_zero_peek.c

diff --git a/tools/testing/selftests/net/af_unix/.gitignore b/tools/testing/selftests/net/af_unix/.gitignore
index 954f0958dd03..b95a86fb77f5 100644
--- a/tools/testing/selftests/net/af_unix/.gitignore
+++ b/tools/testing/selftests/net/af_unix/.gitignore
@@ -9,3 +9,4 @@ so_peek_off
 unix_connect
 unix_connreset
 unix_listen
+unix_oob_zero_peek
diff --git a/tools/testing/selftests/net/af_unix/Makefile b/tools/testing/selftests/net/af_unix/Makefile
index a66f10fb0c23..5fbd00741e50 100644
--- a/tools/testing/selftests/net/af_unix/Makefile
+++ b/tools/testing/selftests/net/af_unix/Makefile
@@ -16,6 +16,7 @@ TEST_GEN_PROGS := \
 	unix_connect \
 	unix_connreset \
 	unix_listen \
+	unix_oob_zero_peek \
 # end of TEST_GEN_PROGS
 
 TEST_GEN_FILES := scm_rights_denial_lsm.bpf.o
diff --git a/tools/testing/selftests/net/af_unix/unix_oob_zero_peek.c b/tools/testing/selftests/net/af_unix/unix_oob_zero_peek.c
new file mode 100644
index 000000000000..52a14d0901b4
--- /dev/null
+++ b/tools/testing/selftests/net/af_unix/unix_oob_zero_peek.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <errno.h>
+#include <poll.h>
+#include <signal.h>
+#include <sys/socket.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+
+#define RECV_TIMEOUT_MS 150
+
+struct recv_result {
+	ssize_t result;
+	int error;
+};
+
+int main(void)
+{
+	struct recv_result result;
+	struct pollfd pfd;
+	char byte = 'x';
+	int sockets[2], pipefd[2], status;
+	ssize_t n;
+	pid_t child;
+
+	ksft_print_header();
+	if (socketpair(AF_UNIX, SOCK_STREAM | SOCK_CLOEXEC, 0, sockets))
+		ksft_exit_fail_perror("socketpair");
+	if (send(sockets[0], &byte, sizeof(byte), MSG_OOB) != sizeof(byte)) {
+		if (errno == EOPNOTSUPP || errno == EINVAL)
+			ksft_exit_skip("AF_UNIX OOB support is unavailable\n");
+		ksft_exit_fail_perror("send MSG_OOB");
+	}
+	if (pipe(pipefd))
+		ksft_exit_fail_perror("pipe");
+
+	ksft_set_plan(1);
+	child = fork();
+	if (child < 0)
+		ksft_exit_fail_perror("fork");
+	if (!child) {
+		struct recv_result child_result;
+
+		close(sockets[0]);
+		close(pipefd[0]);
+		errno = 0;
+		child_result.result = recv(sockets[1], &byte, 0, MSG_PEEK);
+		child_result.error = errno;
+		if (write(pipefd[1], &child_result, sizeof(child_result)) !=
+		    sizeof(child_result))
+			_exit(1);
+		_exit(0);
+	}
+
+	close(sockets[1]);
+	close(pipefd[1]);
+	pfd.fd = pipefd[0];
+	pfd.events = POLLIN;
+	n = poll(&pfd, 1, RECV_TIMEOUT_MS);
+	if (n <= 0) {
+		kill(child, SIGKILL);
+		waitpid(child, &status, 0);
+		ksft_test_result_fail("zero-length MSG_PEEK did not return promptly\n");
+		ksft_finished();
+	}
+
+	n = read(pipefd[0], &result, sizeof(result));
+	if (n != sizeof(result)) {
+		waitpid(child, &status, 0);
+		ksft_test_result_fail("worker did not report the recv result\n");
+		ksft_finished();
+	}
+	if (waitpid(child, &status, 0) != child || !WIFEXITED(status) ||
+	    WEXITSTATUS(status)) {
+		ksft_test_result_fail("worker did not exit successfully\n");
+		ksft_finished();
+	}
+	if (result.result != 0) {
+		errno = result.error;
+		ksft_test_result_fail("zero-length MSG_PEEK returned an error\n");
+		ksft_finished();
+	}
+
+	ksft_test_result_pass("zero-length MSG_PEEK returned immediately\n");
+	ksft_finished();
+}
-- 
2.43.0

