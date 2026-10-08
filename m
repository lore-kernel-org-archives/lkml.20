Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A0A3CC314
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 06:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442576; cv=none; b=VdjfN8Do5sn/NKxTI28fat1JZdNksubnhXGnwdJv2sht2Bp7Wehd0FgeHdu1JSzRVSoXLyoqbk3KrTLDnBI95xCzN+dlONrKBvZjOfUXkl3HfEcoOSDTuoar+//H9PTxVuATm3mBQKNtyGqyuJwFvr5TFVg747ZQ6Qh37kfjrHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442576; c=relaxed/simple;
	bh=htQGzewoljnt8qeiBZrlM3+HFfiGm6UC95cSw3S2ViA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aAwZMmsKi03JnIlktcmtGmS/J//ik/z1cG69Tw9YVRy7QcUECRKnJfmuxWpZr2hl36ZyPgIMpkI8O4TYJAkrbm2KstQJCHQJ1CfsXT9aPthfCaNIAWRMMsZOJ/UuZAl/zmOgMCKW+1zoU29UrR15wtpAD5yy8GLJXT/r5CnSNTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EUiKMhKf; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUiKMhKf"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso2333533a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 23:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791442574; x=1792047374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pAms67KOUjYSfr9b9G0rcYKa8JtQ8KPqGJVcyzHBOmw=;
        b=EUiKMhKf9Xd09xCI1t5b6hhNC0H3eIwWlwgQqhIP6K/qMPfRGi07itIms0OcoJK95y
         2MtJuQF5ankT7zyjvN4/wscMDDFD4/IP5nKagE2UiHBuv11VW6HWp/v4lTd3Q9bx7sI4
         HW/ml07mifXlegJbPI/UKVjA9mYUO2mGxcrfkhDpKb3QERYovXhv9tY06DvOQSijZp5U
         bkg+rk2N1vxLCRFli7jCzy8x3oCoVSo2vpW+k9EwL+EZkI0dzn9xOwk9YzZ/nAxm/WW6
         DlGTKu2y9bZQHtkYshnHz3YvxGwbtn41saKGavLUX+XnE63l+iUEUa6RlCpexDpbNo01
         rKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442574; x=1792047374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAms67KOUjYSfr9b9G0rcYKa8JtQ8KPqGJVcyzHBOmw=;
        b=E69gsPJ/EiOGFUDDBueDcvIhWY4xwN+60ZbQ2AzjiH7E3LoD8bHbLA4wD33rYYM19I
         24JdzFuCAQgzEqpicrvd13V22reF947JuOxBc0z9+9WEqxYEAX33CcJjevRbm+ZcBxBP
         BCZE7fsrDxWTOwVDS948UfYa2XnDFOU2SexAu1/3h3+xRV+o/14hfmg4OECV15LbZnvV
         u7h0t6k2Yp/2aRA8Li4N6iKGT7RUrXXBMAZc/TWZqnPbECrzPt+xJ3ap5g1aCB0l0+XL
         7/6SoVWhM24ajlo6w4FpVyHXizlPU4dSVlJFOUqHVz/ydLJFZx2c6s53wxfrLCD09fUv
         /uug==
X-Gm-Message-State: AFq9FYKbStY91d4Rfdlr4VyOF001FzoX0ZYmGUjDMfG1JhQMOzBekwoj
	KbKzxtVznYpbchQrI7OTd2kfPsRWar55ayBn7wExqZGm6rkhG0uNEzJrlNY5PUCj
X-Gm-Gg: AYBFou1fmF4ctg+t1RKC+SMkV/FlcedEYEp1CdPPQiuhY9ZZgNMzWRkJ+ZpGWq1ZNcj
	VP3AOM/uG0W3XoTCjNTuv8uQ/Iw3NXW7khjK3CAY6uMLfYSDtGy0NoWmrPicbbC2bH/KSgL1mey
	EbzX7PWE4XlmU4sAkqRFfPSvDGwFbjEn15oXdoV555PEVe/pDGTGwau4AN1qJZiFG2KLoHxI8cu
	QQjBvCU16apNQJpdWksApsH5UtGBXbKzFZrRgIoNPkMhzohonkGMHxlUCubCI4d0QQ6FXIOiL/D
	Q9GrPhCbTBoH8Pkul/SV2ivrmccJQwZ/ouH4Wnu8kfFpSSCZTiYcOOVepwh3E5g3qeK3+VdbKpQ
	u+1SqolIPHD/HL3fmEgTqNwRh3Q0AW1FQZdIcDHnv4mE5ncFZ/mIp92HzetjuB8fwQaqSQlSBm0
	hOxe3qCDddTEOOHSs7pUWyqf9tDAJSj8DrYtwq0EjNBqNZdQZHlkYjL7ox3GQMIznu+57TbABbj
	NxmHYrahBeD8kZIXeOUfBT6A++CJzyV
X-Received: by 2002:a17:90b:3c50:b0:3a7:a34:6f8e with SMTP id 98e67ed59e1d1-3a8a1ca2236mr3801587a91.41.1791442573971;
        Wed, 07 Oct 2026 23:56:13 -0700 (PDT)
Received: from obadmin-Precision-3680.atlascopco.group ([136.226.232.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff848f9csm2806544a91.9.2026.10.07.23.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:56:13 -0700 (PDT)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] selftests/filesystems: test ext4 reserved GID block allocation
Date: Thu,  8 Oct 2026 12:26:51 +0530
Message-ID: <20261008065651.3517824-1-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that ext4 allows a process in the configured reserved GID to
allocate reserved blocks after ordinary free space is exhausted.

Create a temporary ext4 image with distinct reserved UID and GID values,
mount it in a private mount namespace, and fill ordinary free space as
an unprivileged user. Then verify that a process with the reserved GID
can allocate one more block. Register the test with the filesystem
selftests and ignore its generated binary.

Skip when root privileges, required utilities, or private mount namespace
support are unavailable.

Tested: fails with ENOSPC on 7.0.0-34-generic; passes on the fixed
kernel in QEMU.

Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
 .../testing/selftests/filesystems/.gitignore  |   1 +
 tools/testing/selftests/filesystems/Makefile  |   3 +
 .../selftests/filesystems/ext4_resgid.sh      |  43 ++++
 .../selftests/filesystems/ext4_resgid_test.c  | 239 ++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100755 tools/testing/selftests/filesystems/ext4_resgid.sh
 create mode 100644 tools/testing/selftests/filesystems/ext4_resgid_test.c

diff --git a/tools/testing/selftests/filesystems/.gitignore b/tools/testing/selftests/filesystems/.gitignore
index 9eb185fb2f9d..c5807237efcb 100644
--- a/tools/testing/selftests/filesystems/.gitignore
+++ b/tools/testing/selftests/filesystems/.gitignore
@@ -7,3 +7,4 @@ anon_inode_test
 kernfs_test
 idmapped_tmpfile
 ustat_test
+ext4_resgid_test
diff --git a/tools/testing/selftests/filesystems/Makefile b/tools/testing/selftests/filesystems/Makefile
index 03be337c1f35..a3590e0e5c07 100644
--- a/tools/testing/selftests/filesystems/Makefile
+++ b/tools/testing/selftests/filesystems/Makefile
@@ -4,6 +4,9 @@ CFLAGS += $(KHDR_INCLUDES)
 TEST_GEN_PROGS := devpts_pts file_stressor anon_inode_test kernfs_test fclog ustat_test
 TEST_GEN_PROGS += idmapped_tmpfile
 TEST_GEN_PROGS_EXTENDED := dnotify_test
+TEST_GEN_PROGS_EXTENDED += ext4_resgid_test
+TEST_PROGS += ext4_resgid.sh
+TEST_INCLUDES := ../kselftest/ktap_helpers.sh
 
 include ../lib.mk
 
diff --git a/tools/testing/selftests/filesystems/ext4_resgid.sh b/tools/testing/selftests/filesystems/ext4_resgid.sh
new file mode 100755
index 000000000000..544bfd736d91
--- /dev/null
+++ b/tools/testing/selftests/filesystems/ext4_resgid.sh
@@ -0,0 +1,43 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0
+
+set -e
+
+DIR="$(dirname "$(readlink -f "$0")")"
+# shellcheck source=../kselftest/ktap_helpers.sh
+source "${DIR}"/../kselftest/ktap_helpers.sh
+
+ksft_skip()
+{
+	ktap_skip_all "$1"
+	exit "$KSFT_SKIP"
+}
+
+[ "$(id -u)" -eq 0 ] || ksft_skip "must be run as root"
+
+for tool in mke2fs tune2fs losetup truncate; do
+	command -v "$tool" >/dev/null 2>&1 ||
+		ksft_skip "missing required command: $tool"
+done
+
+tmpdir=$(mktemp -d)
+loop_dev=
+
+cleanup()
+{
+	if [ -n "$loop_dev" ]; then
+		losetup -d "$loop_dev"
+	fi
+	rm -rf "$tmpdir"
+}
+trap cleanup EXIT
+
+image="$tmpdir/ext4.img"
+truncate -s 16M "$image"
+mke2fs -q -F -t ext4 -b 4096 -N 1024 -m 10 -O ^has_journal "$image"
+tune2fs -u 123 -g 456 "$image" >/dev/null
+
+loop_dev=$(losetup --find --show "$image") ||
+	ksft_skip "could not allocate a loop device"
+
+./ext4_resgid_test "$loop_dev"
diff --git a/tools/testing/selftests/filesystems/ext4_resgid_test.c b/tools/testing/selftests/filesystems/ext4_resgid_test.c
new file mode 100644
index 000000000000..9d40d04bdafc
--- /dev/null
+++ b/tools/testing/selftests/filesystems/ext4_resgid_test.c
@@ -0,0 +1,239 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#define _GNU_SOURCE
+#include <errno.h>
+#include <fcntl.h>
+#include <grp.h>
+#include <sched.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "kselftest.h"
+
+#define TEST_UID 1000
+#define FILL_GID 1001
+#define RESGID 456
+#define TEST_BLOCK_SIZE 4096
+#define MAX_BLOCKS 32768
+
+struct worker_result {
+	off_t offset;
+	int error;
+	int setup_error;
+};
+
+static void worker(int fd, gid_t gid, bool fill, off_t offset, int pipefd)
+{
+	struct worker_result result = {
+		.offset = offset,
+	};
+	int i;
+
+	if (setgroups(0, NULL) || setresgid(gid, gid, gid) ||
+	    setresuid(TEST_UID, TEST_UID, TEST_UID)) {
+		result.setup_error = errno;
+		goto report;
+	}
+
+	if (fill) {
+		for (i = 0; i < MAX_BLOCKS; i++) {
+			if (fallocate(fd, 0, result.offset, TEST_BLOCK_SIZE)) {
+				result.error = errno;
+				goto report;
+			}
+			result.offset += TEST_BLOCK_SIZE;
+		}
+		result.error = EFBIG;
+	} else if (fallocate(fd, 0, result.offset, TEST_BLOCK_SIZE)) {
+		result.error = errno;
+	}
+
+report:
+	if (write(pipefd, &result, sizeof(result)) != sizeof(result))
+		_exit(1);
+	_exit(0);
+}
+
+static int run_worker(int fd, gid_t gid, bool fill, off_t offset,
+		      struct worker_result *result)
+{
+	int pipefd[2], status;
+	pid_t pid, waited;
+	ssize_t n;
+
+	if (pipe(pipefd))
+		return -errno;
+	pid = fork();
+	if (pid < 0) {
+		int error = errno;
+
+		close(pipefd[0]);
+		close(pipefd[1]);
+		return -error;
+	}
+	if (!pid) {
+		close(pipefd[0]);
+		worker(fd, gid, fill, offset, pipefd[1]);
+	}
+
+	close(pipefd[1]);
+	do {
+		n = read(pipefd[0], result, sizeof(*result));
+	} while (n < 0 && errno == EINTR);
+	close(pipefd[0]);
+	do {
+		waited = waitpid(pid, &status, 0);
+	} while (waited < 0 && errno == EINTR);
+	if (waited != pid)
+		return -errno;
+	if (n != sizeof(*result) || !WIFEXITED(status) ||
+	    WEXITSTATUS(status))
+		return -EIO;
+
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	char mountpoint[] = "/tmp/ext4-resgid.XXXXXX";
+	char filename[sizeof(mountpoint) + sizeof("/fill")];
+	struct worker_result fill_result, group_result;
+	bool mounted = false, skipped = false;
+	int fd = -1, ret, failed = 0;
+	char message[160] = "reserved GID can allocate reserved ext4 blocks";
+
+	ksft_print_header();
+	ksft_set_plan(1);
+
+	if (geteuid()) {
+		ksft_test_result_skip("must be run as root\n");
+		ksft_finished();
+	}
+	if (argc != 2) {
+		ksft_test_result_fail("usage: %s block-device\n", argv[0]);
+		ksft_finished();
+	}
+	if (unshare(CLONE_NEWNS)) {
+		if (errno == EPERM || errno == EINVAL) {
+			ksft_test_result_skip("private mount namespace is unavailable\n");
+			ksft_finished();
+		}
+		ksft_exit_fail_perror("creating mount namespace");
+	}
+	if (mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL)) {
+		if (errno == EPERM || errno == EACCES) {
+			ksft_test_result_skip("cannot make mounts private\n");
+			ksft_finished();
+		}
+		ksft_exit_fail_perror("making mounts private");
+	}
+	if (!mkdtemp(mountpoint))
+		ksft_exit_fail_perror("creating mountpoint");
+	if (mount(argv[1], mountpoint, "ext4", 0, NULL)) {
+		int error = errno;
+
+		rmdir(mountpoint);
+		errno = error;
+		ksft_exit_fail_perror("mounting ext4 test image");
+	}
+	mounted = true;
+
+	snprintf(filename, sizeof(filename), "%s/fill", mountpoint);
+	fd = open(filename, O_CREAT | O_EXCL | O_RDWR, 0666);
+	if (fd < 0) {
+		snprintf(message, sizeof(message), "creating test file: %s",
+			 strerror(errno));
+		failed = 1;
+		goto out;
+	}
+	if (fchown(fd, TEST_UID, FILL_GID) || fchmod(fd, 0666)) {
+		snprintf(message, sizeof(message), "setting test-file owner: %s",
+			 strerror(errno));
+		failed = 1;
+		goto out;
+	}
+
+	ret = run_worker(fd, FILL_GID, true, 0, &fill_result);
+	if (ret) {
+		snprintf(message, sizeof(message), "filling filesystem: %s",
+			 strerror(-ret));
+		failed = 1;
+		goto out;
+	}
+	if (fill_result.setup_error) {
+		if (fill_result.setup_error == EPERM) {
+			snprintf(message, sizeof(message),
+				 "cannot drop worker privileges: %s",
+				 strerror(fill_result.setup_error));
+			skipped = true;
+			goto out;
+		}
+		snprintf(message, sizeof(message), "dropping worker privileges: %s",
+			 strerror(fill_result.setup_error));
+		failed = 1;
+		goto out;
+	}
+	if (fill_result.error != ENOSPC) {
+		snprintf(message, sizeof(message),
+			 "unprivileged fill stopped with %s, expected ENOSPC",
+			 strerror(fill_result.error));
+		failed = 1;
+		goto out;
+	}
+
+	ret = run_worker(fd, RESGID, false, fill_result.offset, &group_result);
+	if (ret) {
+		snprintf(message, sizeof(message), "testing reserved GID: %s",
+			 strerror(-ret));
+		failed = 1;
+		goto out;
+	}
+	if (group_result.setup_error) {
+		snprintf(message, sizeof(message), "setting reserved GID: %s",
+			 strerror(group_result.setup_error));
+		failed = 1;
+		goto out;
+	}
+	if (group_result.error) {
+		snprintf(message, sizeof(message),
+			 "reserved-GID allocation failed: %s",
+			 strerror(group_result.error));
+		failed = 1;
+	}
+
+out:
+	if (fd >= 0 && close(fd)) {
+		snprintf(message, sizeof(message), "closing test file: %s",
+			 strerror(errno));
+		failed = 1;
+	}
+	if (unlink(filename) && errno != ENOENT) {
+		snprintf(message, sizeof(message), "removing test file: %s",
+			 strerror(errno));
+		failed = 1;
+	}
+	if (mounted && umount(mountpoint)) {
+		snprintf(message, sizeof(message), "unmounting test image: %s",
+			 strerror(errno));
+		failed = 1;
+	}
+	if (rmdir(mountpoint)) {
+		snprintf(message, sizeof(message), "removing mountpoint: %s",
+			 strerror(errno));
+		failed = 1;
+	}
+
+	if (failed)
+		ksft_test_result_fail("%s\n", message);
+	else if (skipped)
+		ksft_test_result_skip("%s\n", message);
+	else
+		ksft_test_result_pass("%s\n", message);
+	ksft_finished();
+}
-- 
2.43.0

