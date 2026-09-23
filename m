Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E26058125A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203477; cv=none; b=ty9VghAtC2TUqZ7zzHHUNI0VnDZItsixtqPLXAuz4KIHVL2crm4UAoWSihC76ktdpd8ixmvzhHyGO2csFy8d1PgkLldo/23zzBV+fVOnjw4rrKy+NxtgHwGuZ2F4sWVMErnMkcTE2crmclGzdvD6BtmCFfzgIlKVlphGG1CnimY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203477; c=relaxed/simple;
	bh=WmYxQeadB88LZiuc8wfcLY5gKIwbh5i2JDt14HveVm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LcZ9OzYULHqig4cYl5Wn9vZ7U01D5UrOYrLzsO+zVQlCIW4sMtku96Dw3J/5Zn9Z98RXqPBwA3D+lEePWuWjU36eUymuvEhFu2nPl5r7/jvfdMYldvd4qpQY5l2BiGEUGAcfuWkGQjBq/ztXI8ksjcMm8z4zUZpsgejE0teuDF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrNPl32y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrNPl32y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C181F000FF;
	Wed, 23 Sep 2026 22:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790203475;
	bh=eG1RVyLzxpChpBzlqXiCEe5ZgN0Ss8wEK7e+2vb2e54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lrNPl32yv6F7bSR3BBzsqEEgJOJEV8vFbf2FKbw9lshqzfR65ccPCOJrqAkD2p5dL
	 dceuUNDxeMsYJbywPccHmuE230lS6vk/AYFN7uRp5Y6af4bXBnog4RDEgjovaNk0vH
	 1tZtoFXrlSDPdSi+zHKFGvM3jhrruDUqwLP+kB+BFI9KazHg/iH9HA8BeB4POaGwcE
	 oTusEO9VVQk7Ea3J+NAnoHhjtImwGRjE4HBy+5RREt4Uc+/M0VsG6hXtY8iPiMATNZ
	 mLX0J6Za6n2riopDl4RwuE2OFpMbcT4q2cyZEkPOqeC+RrAoUGR3QXVuCkGVKYeCbI
	 90kT3SnYBBQgQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 6/6] selftests/liveupdate: add tmpfs kexec test
Date: Thu, 24 Sep 2026 00:44:05 +0200
Message-ID: <20260923224408.3745689-7-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923224408.3745689-1-pratyush@kernel.org>
References: <20260923224408.3745689-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

Add a two-stage kexec test for tmpfs preservation, in the same shape as
luo_kexec_simple.

The first stage create a tmpfs mount, creates a file in it, write some
data to it, and preserves both. In the second stage, it retrieves both
and verifies the contents of the file. It also verifies it can be
reached by a filesystem path.

Add the test to run_vmtests.sh to allow automated runs.

Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 .../selftests/liveupdate/luo_kexec_tmpfs.c    | 191 ++++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |   1 +
 3 files changed, 193 insertions(+)
 create mode 100644 tools/testing/selftests/liveupdate/luo_kexec_tmpfs.c

diff --git a/tools/testing/selftests/liveupdate/Makefile b/tools/testing/selftests/liveupdate/Makefile
index 634211c66652..c35aee04b4a3 100644
--- a/tools/testing/selftests/liveupdate/Makefile
+++ b/tools/testing/selftests/liveupdate/Makefile
@@ -3,6 +3,7 @@
 TEST_GEN_PROGS += liveupdate
 
 TEST_GEN_PROGS_EXTENDED += luo_kexec_simple
+TEST_GEN_PROGS_EXTENDED += luo_kexec_tmpfs
 TEST_GEN_PROGS_EXTENDED += luo_multi_session
 TEST_GEN_PROGS_EXTENDED += luo_stress_sessions
 TEST_GEN_PROGS_EXTENDED += luo_stress_files
diff --git a/tools/testing/selftests/liveupdate/luo_kexec_tmpfs.c b/tools/testing/selftests/liveupdate/luo_kexec_tmpfs.c
new file mode 100644
index 000000000000..608a6eddbd7b
--- /dev/null
+++ b/tools/testing/selftests/liveupdate/luo_kexec_tmpfs.c
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2026, Google LLC.
+ * Pratyush Yadav <pratyush@kernel.org>
+ *
+ * Validate preservation of a tmpfs mount and a file in it across a kexec
+ * reboot. Stage 1 creates a tmpfs, puts a file in it and preserves both.
+ * Stage 2 retrieves the mount, attaches it with move_mount(2), and checks that
+ * the file's contents are intact and that it is reachable by path.
+ */
+
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/syscall.h>
+#include <unistd.h>
+
+#include <libliveupdate.h>
+
+#define TEST_SESSION_NAME	"tmpfs-session"
+#define TMPFS_MNT_TOKEN		0x2A
+#define TMPFS_FILE_TOKEN	0x2B
+
+/* Constants for the state-tracking mechanism, specific to this test file. */
+#define STATE_SESSION_NAME	"kexec_tmpfs_state"
+#define STATE_MEMFD_TOKEN	998
+
+#define TMPFS_DIR		"/tmpfs"
+#define TMPFS_FILE_NAME		"state.bin"
+#define TMPFS_FILE_PATH		TMPFS_DIR "/" TMPFS_FILE_NAME
+#define TMPFS_DATA		"hello tmpfs kexec world"
+
+#ifndef MOVE_MOUNT_F_EMPTY_PATH
+#define MOVE_MOUNT_F_EMPTY_PATH	0x00000004
+#endif
+
+/* nolibc has no move_mount() wrapper. */
+static int move_mount_empty_from(int from_fd, const char *to_path)
+{
+	return syscall(__NR_move_mount, from_fd, "", AT_FDCWD, to_path,
+		       MOVE_MOUNT_F_EMPTY_PATH);
+}
+
+static void write_file(int fd, const char *data, size_t len)
+{
+	ssize_t written = write(fd, data, len);
+
+	if (written < 0 || (size_t)written != len)
+		fail_exit("write of %zu bytes returned %zd", len, written);
+}
+
+static void verify_contents(int fd, const char *expected, size_t len)
+{
+	char buf[128];
+	ssize_t got;
+
+	if (len > sizeof(buf))
+		fail_exit("test data too large for buffer");
+
+	/* nolibc has no pread(). */
+	if (lseek(fd, 0, SEEK_SET) < 0)
+		fail_exit("lseek to the start of the file");
+
+	got = read(fd, buf, len);
+	if (got < 0 || (size_t)got != len)
+		fail_exit("read of %zu bytes returned %zd", len, got);
+
+	if (memcmp(buf, expected, len))
+		fail_exit("file contents do not match");
+}
+
+/* Stage 1: Executed before the kexec reboot. */
+static void run_stage_1(int luo_fd)
+{
+	int session_fd, mnt_fd, file_fd;
+
+	ksft_print_msg("[STAGE 1] Starting pre-kexec setup...\n");
+
+	ksft_print_msg("[STAGE 1] Creating state file for next stage (2)...\n");
+	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
+
+	session_fd = luo_create_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_create_session for '%s'", TEST_SESSION_NAME);
+
+	ksft_print_msg("[STAGE 1] Mounting tmpfs at %s...\n", TMPFS_DIR);
+	if (mkdir(TMPFS_DIR, 0755) < 0)
+		fail_exit("mkdir %s", TMPFS_DIR);
+	if (mount("tmpfs", TMPFS_DIR, "tmpfs", 0, NULL) < 0)
+		fail_exit("mount tmpfs at %s", TMPFS_DIR);
+
+	/*
+	 * A plain open of the mount root. LUO's preserve uses fget(), which
+	 * refuses O_PATH descriptors, so an fsmount(2) fd cannot be handed to
+	 * it directly either.
+	 */
+	mnt_fd = open(TMPFS_DIR, O_RDONLY | O_DIRECTORY);
+	if (mnt_fd < 0)
+		fail_exit("open %s", TMPFS_DIR);
+
+	file_fd = open(TMPFS_FILE_PATH, O_RDWR | O_CREAT, 0644);
+	if (file_fd < 0)
+		fail_exit("open %s", TMPFS_FILE_PATH);
+
+	write_file(file_fd, TMPFS_DATA, sizeof(TMPFS_DATA));
+
+	/* The mount must be preserved before any file that lives in it. */
+	ksft_print_msg("[STAGE 1] Preserving mount (token %#x)...\n",
+		       TMPFS_MNT_TOKEN);
+	if (luo_session_preserve_fd(session_fd, mnt_fd, TMPFS_MNT_TOKEN) < 0)
+		fail_exit("luo_session_preserve_fd for the mount");
+
+	ksft_print_msg("[STAGE 1] Preserving file (token %#x)...\n",
+		       TMPFS_FILE_TOKEN);
+	if (luo_session_preserve_fd(session_fd, file_fd, TMPFS_FILE_TOKEN) < 0)
+		fail_exit("luo_session_preserve_fd for the file");
+
+	close(file_fd);
+	close(mnt_fd);
+	close(luo_fd);
+	daemonize_and_wait();
+}
+
+/* Stage 2: Executed after the kexec reboot. */
+static void run_stage_2(int luo_fd, int state_session_fd)
+{
+	int session_fd, mnt_fd, file_fd, path_fd, stage;
+
+	ksft_print_msg("[STAGE 2] Starting post-kexec verification...\n");
+
+	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
+	if (stage != 2)
+		fail_exit("Expected stage 2, but state file contains %d", stage);
+
+	session_fd = luo_retrieve_session(luo_fd, TEST_SESSION_NAME);
+	if (session_fd < 0)
+		fail_exit("luo_retrieve_session for '%s'", TEST_SESSION_NAME);
+
+	ksft_print_msg("[STAGE 2] Retrieving mount (token %#x)...\n",
+		       TMPFS_MNT_TOKEN);
+	mnt_fd = luo_session_retrieve_fd(session_fd, TMPFS_MNT_TOKEN);
+	if (mnt_fd < 0)
+		fail_exit("luo_session_retrieve_fd for the mount");
+
+	ksft_print_msg("[STAGE 2] Attaching the restored mount at %s...\n",
+		       TMPFS_DIR);
+	if (mkdir(TMPFS_DIR, 0755) < 0)
+		fail_exit("mkdir %s", TMPFS_DIR);
+	if (move_mount_empty_from(mnt_fd, TMPFS_DIR) < 0)
+		fail_exit("move_mount of the restored mount to %s", TMPFS_DIR);
+	close(mnt_fd);
+
+	ksft_print_msg("[STAGE 2] Retrieving file (token %#x)...\n",
+		       TMPFS_FILE_TOKEN);
+	file_fd = luo_session_retrieve_fd(session_fd, TMPFS_FILE_TOKEN);
+	if (file_fd < 0)
+		fail_exit("luo_session_retrieve_fd for the file");
+
+	/* The contents are intact through the retrieved fd. */
+	verify_contents(file_fd, TMPFS_DATA, sizeof(TMPFS_DATA));
+
+	/* And the file is reachable by path, which is the point. */
+	path_fd = open(TMPFS_FILE_PATH, O_RDONLY);
+	if (path_fd < 0)
+		fail_exit("open restored %s by path", TMPFS_FILE_PATH);
+
+	verify_contents(path_fd, TMPFS_DATA, sizeof(TMPFS_DATA));
+
+	close(path_fd);
+	close(file_fd);
+
+	ksft_print_msg("[STAGE 2] Test data verified successfully.\n");
+	if (luo_session_finish(session_fd) < 0)
+		fail_exit("luo_session_finish for test session");
+	close(session_fd);
+
+	if (luo_session_finish(state_session_fd) < 0)
+		fail_exit("luo_session_finish for state session");
+	close(state_session_fd);
+
+	ksft_print_msg("\n--- TMPFS KEXEC TEST PASSED ---\n");
+}
+
+int main(int argc, char *argv[])
+{
+	return luo_test(argc, argv, STATE_SESSION_NAME,
+			run_stage_1, run_stage_2);
+}
diff --git a/tools/testing/selftests/liveupdate/run-vmtests.sh b/tools/testing/selftests/liveupdate/run-vmtests.sh
index d656ce58c5a7..624d1916eeda 100755
--- a/tools/testing/selftests/liveupdate/run-vmtests.sh
+++ b/tools/testing/selftests/liveupdate/run-vmtests.sh
@@ -17,6 +17,7 @@ skipped=0
 
 TEST_NAMES=(
 	"luo_kexec_simple"
+	"luo_kexec_tmpfs"
 	"luo_multi_session"
 	"luo_stress_files"
 	"luo_stress_sessions"
-- 
2.56.0.rc1.310.g51773c2048-goog

