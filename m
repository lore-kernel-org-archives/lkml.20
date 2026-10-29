Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793268049;
	b=f1XEZ2EfKsbOHT1KSKdsfOeYO3Jti9qH83zIu4cXWLl3Cq6gfVQH53avg0HpbmDY500t
	 B0TD3mNQMRKAAXdSR+p8cmAyQHMAu1ISScqjCx6ef9PBJPILVUrJN0mpTBatuaQmxWgb4
	 /xs1gc83Z3Buys5aWB2thyPr81fKlj0L5n0+Qlf/IJUa20aAI8tMdFG933gbNe4L9w1I+
	 L+6eX/ZOcvxnG5RJMpQlm3Oq2ll4SArv5Hm22DY6Qey8WXqQWM/tikS/8oEf2lbcEq57l
	 Gvh8lOuBP40n/VZ8Hd3JdR93YsIbnhPUyIPH26UE25cazM0815h8WwUyH//geSVXYSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793268049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xXPb7vXtx7Cnf+ZB6yG1UBI/GtTGHHFLNn7WT8GaVN8=;
	b=USo29ZfWejcWgPb7L4UGJ+WJSL5RtPCAO1sMkuaHZRKh5iZX8khhbXPyJ7gxwthQ+hr9
	 20zwXDE3kt7AwOw4p+A1UcXSx8ES6HHq5NxvF2OfwXE9W6YzSQAVRHlEFwKlQiKLoz1Xb
	 KQJV58T+iCrHOsO8pY2zhoiSm9dQsw1UMc611vr4z5BvkhpWMIwwrlHpQYgiM2UHDpZ19
	 Yld4phns50Ed1PU3+PlOJF4lqGHCHCuioNb1dUxa+7D+K7q55mYCvedEfW/7EXplK8bw4
	 RRYy1uRJiQM2F73bh/42JkaZoqNMPsdM1zDGss4wXLx3/PE9SNVzZHXRuQwTbJlm00g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNZkIKPP;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0073606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0073606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yNZkIKPP
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1216283f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793268047; x=1793872847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xXPb7vXtx7Cnf+ZB6yG1UBI/GtTGHHFLNn7WT8GaVN8=;
        b=yNZkIKPPsy62kKyXY0MzMG7flMQhFTDNSEGUoTh37/u5LaMvQ5Hnu8lJ6AQJTr5wkV
         IoIDR8r88gNQulAUC7pZweEGvXLRzTLEJ71tLpf324wVLHLtSuSc8B0g+u2PfV1x6jIK
         v5VOFWqIkLaIPi7U7tLqNtvZ7b3/taprG0x/g48LVqPTsBcY9SLyNRxQ89c5yQNeg/up
         4LhuK/py6Uefa6PU8w+HurcMo67NYS+YMF6xvcT6OSHF3yVEvOPSaGMTm+d5EmyFt7eq
         anU2KhtpNO1OgwXW7DqVUbFa523hoCpCy+VzYrhrrlY3UCG+e2vr8a5dDp/soeEjxP7P
         1zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793268047; x=1793872847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xXPb7vXtx7Cnf+ZB6yG1UBI/GtTGHHFLNn7WT8GaVN8=;
        b=FtQMSAHZY4mKgUpONz6pGz4UIzVbfaZted/ouCc5WEOowFD/bqkFllU5CEVLs8Y3ML
         fw/ZyaP32/sF1zZFUKP9R5+iOXtJInR8RH8A3QLLMFesfSFWr/i1RKDh0pHSspi0fjVX
         wRSmQ+J36vO2C971TZ8b0MAYXFIbDh1V06Hvk5SNnVoo+MlgFopHcFab9N0PJ5PbXPO0
         K/aDG6uRiFgpR99nckksh4Lx9U5jIQJsoiA2FZrHIrNZRlvgc2uc6AEMScDgVGtATpVy
         GgyAg7zv1dnUA24HVP+sIfTQG0UzZDpdzdHbxvskM/vGco47kqhk94sc64LB9Gtw8SY7
         8M8g==
X-Gm-Message-State: AFq9FYLux7MFeQ1S3sAh3NBSEikFK1k/LhPKkR8mEFKF1Q41lg/E3vY1
	w0sddW5mADsKLyG40i1ukW0Jl32PcQH/0sNf5UAN/T/0BXTlIfBp/1Fu
X-Gm-Gg: AYBFou2jrUEBc8+L/BMTEN01yDRFf/fUvpnPJVGs1LUjK39a4pz8lpztk4W3aXWiH9/
	D6TImmlri6W09MN4iUvMc1JgbebHKTi7U60ayFY9yfv1+ZOs5c/RfTlDzs8e8DV31K7f5TVMJvP
	F6osvbxv8wc6rVyCYoYvQBqDaYfDr8V0rWfFoeW6Tl0nVKPXv38IxpeqJCa/9wEHkZzdHb85nEG
	LOwQJ8w44sPPqmvPJK+5pUsUSfTxXMe0ngioQxUr0IavNh7xjqkNbs8aBMrT7DOHquNjlHyhjBz
	UUK6kEQQe2cfVuWxtdcPKS/kE7sxTKC9SNQ7kFhYvKh5rnE5IluFfovafOsDfdQAxXK+4cYpOlo
	PW1MIKW/Fgwr770v90Bm3P7J1+OxSb3gm1/yVYyre/rtFnMscWOpOxtoDFcePG6F4tcx5cE+uut
	iOZdGeavlgX81iUtUeue5tLBNO7g9rTVUNeDLuTxLsmPjQ4dCQ221BZ3o21xOKjDndtzkPsvaVV
	0xMDEkyDyowRrMIhtQ8tyD1i/MnvLdMecImF7wN/rke2lwfn7NE6ypVV2Kk4zdh2pz53HEgsZ1c
	a3u/A40/t5jHd6Yx/oTpMNdv9zZWHHltZSHHzDOqx9/4g3H5xwzlCqZOSjQ5HAmR
X-Received: by 2002:a05:6000:2512:b0:48e:6812:5ef1 with SMTP id ffacd0b85a97d-48e68125f88mr2837309f8f.25.1793268046622;
        Thu, 29 Oct 2026 03:00:46 -0700 (PDT)
Received: from dell-desktop ([2a02:587:4b42:1400:8199:c552:2b9e:c33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3c5bsm34025569f8f.9.2026.10.29.03.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:00:45 -0700 (PDT)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	tasos.papagiannnis@gmail.com
Subject: [PATCH bpf-next 3/3] selftests/bpf: Test bpf_path_getattr()
Date: Thu, 29 Oct 2026 11:59:52 +0200
Message-ID: <20261029095952.44833-4-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261029095952.44833-1-tasos.papagiannnis@gmail.com>
References: <20261029095952.44833-1-tasos.papagiannnis@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compare the result with statx() on tmpfs and overlayfs, including copy-up.
Cover verifier restrictions.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 .../selftests/bpf/prog_tests/path_getattr.c   | 185 ++++++++++++++++++
 .../selftests/bpf/progs/path_getattr.c        |  25 +++
 .../bpf/progs/verifier_path_getattr.c         |  57 ++++++
 3 files changed, 267 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/path_getattr.c
 create mode 100644 tools/testing/selftests/bpf/progs/path_getattr.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_path_getattr.c

diff --git a/tools/testing/selftests/bpf/prog_tests/path_getattr.c b/tools/testing/selftests/bpf/prog_tests/path_getattr.c
new file mode 100644
index 000000000000..667e42342202
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/path_getattr.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+#define _GNU_SOURCE
+
+#include <linux/stat.h>
+#include <sched.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/syscall.h>
+#include <sys/sysmacros.h>
+#include <test_progs.h>
+
+/* Userspace definition of the BTF-visible kfunc result. */
+struct bpf_file_stat {
+	__u64 ino;
+	__u64 dev;
+	__u64 mnt_id;
+	__u64 size;
+	__u64 attributes;
+	__u64 attributes_mask;
+	__u32 mode;
+	__u32 uid;
+	__u32 gid;
+	__u32 result_mask;
+};
+
+#include "path_getattr.skel.h"
+#include "verifier_path_getattr.skel.h"
+
+#define STAT_FIELDS (STATX_TYPE | STATX_MODE | STATX_UID | STATX_GID | \
+		     STATX_INO | STATX_SIZE | STATX_MNT_ID | STATX_MNT_ID_UNIQUE)
+
+static void query_stat(struct path_getattr *skel, const char *path)
+{
+	const struct bpf_file_stat *got = &skel->bss->output;
+	struct statx stx;
+	int err;
+
+	memset(&skel->bss->output, 0xff, sizeof(skel->bss->output));
+	skel->bss->calls = 0;
+	skel->bss->monitored_tid = syscall(SYS_gettid);
+	err = statx(AT_FDCWD, path, 0, skel->bss->request_mask, &stx);
+	skel->bss->monitored_tid = 0;
+	if (!ASSERT_OK(err, "statx") ||
+	    !ASSERT_EQ(skel->bss->calls, 1, "hook_calls") ||
+	    !ASSERT_OK(skel->bss->getattr_ret, "bpf_path_getattr"))
+		return;
+	ASSERT_EQ(got->ino, stx.stx_ino, "ino");
+	ASSERT_EQ(got->dev, makedev(stx.stx_dev_major, stx.stx_dev_minor), "dev");
+	ASSERT_EQ(got->mnt_id, stx.stx_mnt_id, "mnt_id");
+	ASSERT_EQ(got->size, stx.stx_size, "size");
+	ASSERT_EQ(got->mode, stx.stx_mode, "mode");
+	ASSERT_EQ(got->uid, stx.stx_uid, "uid");
+	ASSERT_EQ(got->gid, stx.stx_gid, "gid");
+	ASSERT_EQ(got->attributes, stx.stx_attributes, "attributes");
+	ASSERT_EQ(got->attributes_mask, stx.stx_attributes_mask, "attributes_mask");
+	ASSERT_EQ(got->result_mask, stx.stx_mask & STAT_FIELDS, "result_mask");
+}
+
+static int create_file(const char *path)
+{
+	int fd, err;
+
+	fd = open(path, O_CREAT | O_EXCL | O_RDWR | O_CLOEXEC, 0640);
+	if (!ASSERT_GE(fd, 0, "create_file"))
+		return -1;
+	err = ftruncate(fd, 12345);
+	if (ASSERT_OK(err, "truncate_file"))
+		err = fchown(fd, 123, 456);
+	ASSERT_OK(err, "chown_file");
+	close(fd);
+	return err;
+}
+
+static void test_overlay(struct path_getattr *skel, const char *root)
+{
+	char lower[PATH_MAX], upper[PATH_MAX], work[PATH_MAX], merged[PATH_MAX];
+	char lower_file[PATH_MAX], merged_file[PATH_MAX], opts[PATH_MAX * 3 + 64];
+	__u64 overlay_dev;
+	int fd;
+
+	snprintf(lower, sizeof(lower), "%s/lower", root);
+	snprintf(upper, sizeof(upper), "%s/upper", root);
+	snprintf(work, sizeof(work), "%s/work", root);
+	snprintf(merged, sizeof(merged), "%s/merged", root);
+	if (!ASSERT_OK(mkdir(lower, 0755), "mkdir_lower") ||
+	    !ASSERT_OK(mkdir(upper, 0755), "mkdir_upper") ||
+	    !ASSERT_OK(mkdir(work, 0755), "mkdir_work") ||
+	    !ASSERT_OK(mkdir(merged, 0755), "mkdir_merged"))
+		return;
+	snprintf(lower_file, sizeof(lower_file), "%s/lower/file", root);
+	snprintf(merged_file, sizeof(merged_file), "%s/merged/file", root);
+	/*
+	 * Distinct layer filesystems with xino disabled expose a different
+	 * device for regular files than the overlay superblock's device.
+	 */
+	if (!ASSERT_OK(mount("tmpfs", lower, "tmpfs", 0, NULL), "mount_lower"))
+		return;
+	if (create_file(lower_file))
+		goto out_lower;
+	snprintf(opts, sizeof(opts), "lowerdir=%s,upperdir=%s,workdir=%s,xino=off",
+		 lower, upper, work);
+	if (mount("overlay", merged, "overlay", 0, opts)) {
+		if (errno == ENODEV || errno == EOPNOTSUPP) {
+			printf("%s:SKIP: overlayfs unavailable: %s\n",
+			       __func__, strerror(errno));
+			test__skip();
+			goto out_lower;
+		}
+		ASSERT_OK(-errno, "mount_overlay");
+		goto out_lower;
+	}
+	skel->bss->request_mask = STATX_BASIC_STATS | STATX_MNT_ID;
+	query_stat(skel, merged);
+	overlay_dev = skel->bss->output.dev;
+	query_stat(skel, merged_file);
+	ASSERT_NEQ(skel->bss->output.dev, overlay_dev, "lower_layer_dev");
+	/* Opening for write copies a lower-only file into the upper layer. */
+	fd = open(merged_file, O_WRONLY | O_CLOEXEC);
+	if (ASSERT_GE(fd, 0, "copy_up")) {
+		ASSERT_OK(ftruncate(fd, 23456), "truncate_upper");
+		close(fd);
+		query_stat(skel, merged_file);
+		ASSERT_NEQ(skel->bss->output.dev, overlay_dev, "upper_layer_dev");
+	}
+	umount(merged);
+out_lower:
+	umount(lower);
+}
+
+void test_path_getattr(void)
+{
+	char root[] = "/tmp/bpf_path_getattr.XXXXXX";
+	struct path_getattr *skel;
+	char file[PATH_MAX];
+	int nsfd, cwdfd;
+
+	skel = path_getattr__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open_and_load"))
+		return;
+	if (!ASSERT_OK(path_getattr__attach(skel), "attach_skeleton"))
+		goto out_skel;
+	nsfd = open("/proc/self/ns/mnt", O_RDONLY | O_CLOEXEC);
+	if (!ASSERT_GE(nsfd, 0, "save_mountns"))
+		goto out_skel;
+	cwdfd = open(".", O_RDONLY | O_DIRECTORY | O_CLOEXEC);
+	if (!ASSERT_GE(cwdfd, 0, "save_cwd"))
+		goto out_ns;
+	if (!ASSERT_OK(unshare(CLONE_NEWNS), "unshare_mountns"))
+		goto out_cwd;
+	if (!ASSERT_OK(mount(NULL, "/", NULL, MS_REC | MS_PRIVATE, NULL), "private_mounts") ||
+	    !ASSERT_OK_PTR(mkdtemp(root), "mkdtemp"))
+		goto out_restore;
+	if (!ASSERT_OK(mount("tmpfs", root, "tmpfs", 0, NULL), "mount_tmpfs"))
+		goto out_dir;
+	snprintf(file, sizeof(file), "%s/file", root);
+	if (create_file(file))
+		goto out_umount;
+	if (test__start_subtest("stat_parity")) {
+		skel->bss->request_mask = STATX_BASIC_STATS | STATX_MNT_ID;
+		query_stat(skel, file);
+		skel->bss->request_mask = STATX_BASIC_STATS | STATX_MNT_ID_UNIQUE;
+		query_stat(skel, root);
+	}
+	if (test__start_subtest("overlay"))
+		test_overlay(skel, root);
+out_umount:
+	umount2(root, MNT_DETACH);
+out_dir:
+	rmdir(root);
+out_restore:
+	ASSERT_OK(setns(nsfd, CLONE_NEWNS), "restore_mountns");
+	/* setns() also resets the working directory. */
+	ASSERT_OK(fchdir(cwdfd), "restore_cwd");
+out_cwd:
+	close(cwdfd);
+out_ns:
+	close(nsfd);
+out_skel:
+	path_getattr__destroy(skel);
+}
+
+void test_verifier_path_getattr(void)
+{
+	RUN_TESTS(verifier_path_getattr);
+}
diff --git a/tools/testing/selftests/bpf/progs/path_getattr.c b/tools/testing/selftests/bpf/progs/path_getattr.c
new file mode 100644
index 000000000000..03e9bed2a90b
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/path_getattr.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <vmlinux.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include "bpf_kfuncs.h"
+
+char _license[] SEC("license") = "GPL";
+
+__u32 monitored_tid;
+__u32 request_mask;
+__u32 calls;
+int getattr_ret;
+
+struct bpf_file_stat output;
+
+SEC("lsm.s/inode_getattr")
+int BPF_PROG(path_getattr, const struct path *path, int ret)
+{
+	if (ret || (__u32)bpf_get_current_pid_tgid() != monitored_tid || calls)
+		return ret;
+	calls++;
+	getattr_ret = bpf_path_getattr(path, request_mask, 0, &output, sizeof(output));
+	return ret;
+}
diff --git a/tools/testing/selftests/bpf/progs/verifier_path_getattr.c b/tools/testing/selftests/bpf/progs/verifier_path_getattr.c
new file mode 100644
index 000000000000..5d3d0366f4f0
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/verifier_path_getattr.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <vmlinux.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+#include "bpf_kfuncs.h"
+#include "bpf_misc.h"
+
+char _license[] SEC("license") = "GPL";
+
+static struct bpf_file_stat output;
+
+SEC("lsm.s/file_open")
+__success
+int BPF_PROG(getattr_embedded_path_stack, struct file *file)
+{
+	struct bpf_file_stat st;
+
+	bpf_path_getattr(&file->f_path, 0, 0, &st, sizeof(st));
+	return 0;
+}
+
+SEC("lsm.s/file_open")
+__failure __msg("dereference of modified untrusted_ptr_")
+int BPF_PROG(getattr_untrusted_path)
+{
+	struct task_struct *task = bpf_get_current_task_btf();
+
+	bpf_path_getattr(&task->fs->pwd, 0, 0, &output, sizeof(output));
+	return 0;
+}
+
+SEC("lsm/inode_getattr")
+__failure __msg("program must be sleepable to call sleepable kfunc bpf_path_getattr")
+int BPF_PROG(getattr_non_sleepable, const struct path *path)
+{
+	bpf_path_getattr(path, 0, 0, &output, sizeof(output));
+	return 0;
+}
+
+SEC("fentry/vfs_getattr")
+__failure __msg("calling kernel function bpf_path_getattr is not allowed")
+int BPF_PROG(getattr_fentry, const struct path *path)
+{
+	bpf_path_getattr(path, 0, 0, &output, sizeof(output));
+	return 0;
+}
+
+SEC("lsm.s/inode_getattr")
+__failure __msg("invalid write to stack")
+int BPF_PROG(getattr_short_output, const struct path *path)
+{
+	__u64 small;
+
+	bpf_path_getattr(path, 0, 0, (void *)&small, sizeof(output));
+	return 0;
+}
-- 
2.56.0

