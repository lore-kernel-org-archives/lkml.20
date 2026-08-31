Received: from mail.virtlab.unibo.it (mail.virtlab.unibo.it [130.136.161.50])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1483DA5AB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.136.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788175827; cv=none; b=EwZcJDcIQtYE1MO8Q6EY3Y8BC6ZnE5RgWWqFEVSKgMhVN6uSKsv6jMmULRSQG5phFTwvV8vSilZ/1gskYVWizPCfXRM6MDt+S/VFSKtRSTXQgdNBPU4m71eHIxBPXv8ZhmYL45eWqdGWGio9I10VU8iyuuRO8vgcUi9NewsLgEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788175827; c=relaxed/simple;
	bh=W9iD/bOfEqPrunYUCgVVM2rMwVFfUsJuX6F5x97mCws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K6n+UohC/8r+0+J39EXCsdS699qTTxppdXmpw8RjXNuqO7sHsini/bMrUYCMvGD0+q3r3189/P74ZQKWz01ofI5JTfsxV87RMX6c0Uk+5byLxbVbCJOhG4DNKSvHMTHnLxz5XOlLq0ZLR9jCrhHb1XPLaM7f2vKT/VNpEU+jdiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it; spf=pass smtp.mailfrom=cs.unibo.it; dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b=x5kY3hJS; arc=none smtp.client-ip=130.136.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unibo.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cs.unibo.it header.i=@cs.unibo.it header.b="x5kY3hJS"
Received: from eipi10.cs.unibo.it (unknown [94.32.99.206])
	by mail.virtlab.unibo.it (Postfix) with ESMTPA id DEE8B1C025A;
	Mon, 31 Aug 2026 13:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cs.unibo.it;
	s=virtlab; t=1788175824;
	bh=W9iD/bOfEqPrunYUCgVVM2rMwVFfUsJuX6F5x97mCws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=x5kY3hJS9+M5Z7dT+YmVGPBN8svT5O4oinBaDINcVhxa2qDi5wcTtyqts8kYxfvyg
	 AhuoAGKIy6LyOHijWUVQTlYwTvLqgfjx0bHdeqDIElP4IAntmBMXwbDzGrsoAtimFF
	 OPVDxxtntXngQ5zYZKspZHzZazG8wLN2B//vuk9Q=
From: Renzo Davoli <renzo@cs.unibo.it>
To: linux-kernel@vger.kernel.org
Cc: Renzo Davoli <renzo@cs.unibo.it>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io,
	"Dmitry V . Levin" <ldv@strace.io>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH v3 3/3] selftests/ptrace: add a test case for PTRACE_SYSCALL_INFO_FLAG_SET_IP
Date: Mon, 31 Aug 2026 13:30:04 +0200
Message-ID: <20260831113004.259991-4-renzo@cs.unibo.it>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831113004.259991-1-renzo@cs.unibo.it>
References: <20260831113004.259991-1-renzo@cs.unibo.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check whether PTRACE_SYSCALL_INFO_FLAG_SET_IP semantics implemented in the
kernel matches userspace expectations.

Signed-off-by: Renzo Davoli <renzo@cs.unibo.it>
---
 .../selftests/ptrace/set_syscall_info.c       | 166 ++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/tools/testing/selftests/ptrace/set_syscall_info.c b/tools/testing/selftests/ptrace/set_syscall_info.c
index cb2fe5295ae3..d7463fe4e011 100644
--- a/tools/testing/selftests/ptrace/set_syscall_info.c
+++ b/tools/testing/selftests/ptrace/set_syscall_info.c
@@ -90,6 +90,10 @@ static struct sock_fprog seccomp_prog = {
 	.len = ARRAY_SIZE(seccomp_filter)
 };
 
+static char w1[] = {'A', '\n'};
+static char w2[] = {'B', '\n'};
+static char w3[] = {'C', '\n'};
+
 static void
 check_psi_entry(struct __test_metadata *_metadata,
 		const struct ptrace_syscall_info *info,
@@ -698,4 +702,166 @@ TEST(set_syscall_info_seccomp)
 	}
 }
 
+TEST(set_syscall_info_setip)
+{
+	tracer_pid = getpid();
+	tracee_pid = fork();
+
+	ASSERT_LE(0, tracee_pid) {
+		TH_LOG("fork: %m");
+	}
+
+	/* tracee */
+	if (tracee_pid == 0) {
+		int rv;
+
+		tracee_pid = getpid();
+		ASSERT_EQ(0, sys_ptrace(PTRACE_TRACEME, 0, 0, 0)) {
+			TH_LOG("PTRACE_TRACEME: %m");
+		}
+		ASSERT_EQ(0, kill(tracee_pid, SIGSTOP)) {
+			/* cannot happen */
+			TH_LOG("kill SIGSTOP: %m");
+		}
+
+		ASSERT_EQ(0, prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0)) {
+			TH_LOG("prctl: %m");
+			_exit(1);
+		}
+		ASSERT_EQ(0, sys_seccomp(SECCOMP_SET_MODE_FILTER, 0,
+					 (void *) &seccomp_prog)) {
+			TH_LOG("seccomp: %m");
+			_exit(1);
+		}
+
+presyscall:
+		/* this sysall will run twice
+		   (the tracer steps back the instruction pointer) */
+		rv = write(1, w1, sizeof(w1));
+		if (rv != 2) {
+			_exit(1);
+		}
+
+		/* run write unmodified */
+		rv = write(1, w3, sizeof(w3));
+		if (rv != 2) {
+			_exit(1);
+		}
+		_exit(0);
+	}
+
+	int status;
+	void *doitagain = &&presyscall;
+
+	/* tracer */
+	ASSERT_LE(0, waitpid(-1,&status,0)) {
+		LOG_KILL_TRACEE("waitpid: %m");
+	}
+
+	ASSERT_EQ(0, sys_ptrace(PTRACE_SETOPTIONS, tracee_pid, 0, PTRACE_O_TRACESECCOMP | PTRACE_O_TRACESYSGOOD))
+		LOG_KILL_TRACEE("PTRACE_SETOPTIONS: %m");
+
+	ASSERT_EQ(0, sys_ptrace(PTRACE_CONT, tracee_pid, 0, 0)) {
+		LOG_KILL_TRACEE("PTRACE_CONT: %m");
+	}
+
+	const char *testname[] = {
+		"unknown error",
+		"write unexpected return value",
+		"write unexpected set ip return value",
+		"final write unexpected set ip return value"
+	};
+
+	for (ptrace_stop = 0; ; ++ptrace_stop) {
+		ASSERT_EQ(tracee_pid, wait(&status)) {
+			/* cannot happen */
+			LOG_KILL_TRACEE("wait: %m");
+		}
+		if (WIFEXITED(status)) {
+			tracee_pid = 0; /* the tracee is no more */
+			ASSERT_EQ(0, WEXITSTATUS(status)) {
+				LOG_KILL_TRACEE("unexpected exit status %u",
+						WEXITSTATUS(status));
+			}
+			break;
+		}
+		ASSERT_FALSE(WIFSIGNALED(status)) {
+			tracee_pid = 0; /* the tracee is no more */
+			LOG_KILL_TRACEE("unexpected signal %u",
+					WTERMSIG(status));
+		}
+		ASSERT_TRUE(WIFSTOPPED(status)) {
+			LOG_KILL_TRACEE("unexpected wait status %#x", status);
+		}
+
+		ASSERT_LT(ptrace_stop, ARRAY_SIZE(testname)) {
+			LOG_KILL_TRACEE("ptrace stop overflow");
+		}
+
+		if (status >> 8 == (SIGTRAP | (PTRACE_EVENT_SECCOMP << 8))) {
+			struct ptrace_syscall_info info;
+			size_t info_size = sizeof(info);
+			ASSERT_LT(0, sys_ptrace(PTRACE_GET_SYSCALL_INFO, tracee_pid, info_size, (uintptr_t) &info)) {
+				LOG_KILL_TRACEE("PTRACE_GET_SYSCALL_INFO: %m");
+			}
+			ASSERT_EQ(PTRACE_SYSCALL_INFO_SECCOMP, info.op) {
+				LOG_KILL_TRACEE("entry op mismatch: %m");
+			}
+			ASSERT_TRUE(info.arch) {
+				LOG_KILL_TRACEE("entry arch mismatch: %m");
+			}
+			ASSERT_TRUE(info.instruction_pointer) {
+				LOG_KILL_TRACEE("entry instruction_pointer mismatch: %m");
+			}
+			ASSERT_TRUE(info.stack_pointer) {
+				LOG_KILL_TRACEE("entry stack_pointer mismatch: %m");
+			}
+
+			ASSERT_FALSE(info.seccomp.nr == __NR_exit_group && info.seccomp.args[0] == 1) {
+				LOG_KILL_TRACEE("tracee error: %s",
+						testname[ptrace_stop]);
+			}
+
+			switch (ptrace_stop) {
+			case 0:
+				ASSERT_EQ(__NR_write, info.seccomp.nr) {
+					LOG_KILL_TRACEE("step %d nr __NR_write mismatch: %m", ptrace_stop);
+				}
+				info.instruction_pointer = (uintptr_t) doitagain;
+				info.flags = PTRACE_SYSCALL_INFO_FLAG_SET_IP;
+				break;
+			case 1:
+				info.seccomp.nr = __NR_write;
+				info.seccomp.args[0] = 1;
+				info.seccomp.args[1] = (uintptr_t) w2;
+				info.seccomp.args[2] = sizeof(w2);
+				break;
+			case 2:
+				ASSERT_EQ(__NR_write, info.seccomp.nr) {
+					LOG_KILL_TRACEE("step %d nr __NR_write mismatch: %m", ptrace_stop);
+				}
+				break;
+			case 3:
+				ASSERT_EQ(__NR_exit_group, info.seccomp.nr) {
+					LOG_KILL_TRACEE("step %d nr __NR_exit_group mismatch: %m", ptrace_stop);
+				}
+				break;
+			default:
+				LOG_KILL_TRACEE("unexpected system call: %m");
+				break;
+
+			}
+			ASSERT_EQ(0,sys_ptrace(PTRACE_SET_SYSCALL_INFO, tracee_pid, info_size, (uintptr_t) &info)) {
+				LOG_KILL_TRACEE("PTRACE_SET_SYSCALL_INFO: %m");
+			}
+
+			ASSERT_EQ(0,sys_ptrace(PTRACE_CONT, tracee_pid, 0, 0)) {
+				LOG_KILL_TRACEE("PTRACE_CONT: %m");
+			}
+		} else {
+			LOG_KILL_TRACEE("unexpected signal: %m");
+		}
+	}
+}
+
 TEST_HARNESS_MAIN
-- 
2.55.0

