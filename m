Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356666;
	b=D04fOzhrpGAjYASu4v0RG0yok557tPeYfJ3OeElLegb4N0cCdD+afSpHH5S7dIy1FVDm
	 8v0SA39N2eAyiuWHaJReNhUVVAkpGNcuI3R44+aGBcGh4GZYUL20OnjcjVcKWGMiO041N
	 tGnoh3eXPpSzpDhBa2lDrFOtpwz5bwJE7p/CcHWR+woN26XY2kHA+sHal5a5riSDXKTRv
	 kOW4a04u1ZJVsiDZD2qZVtEQ3Tjc62SRcvWXwBjjByCen6RrI7+6GcGg+U1ROhCSS9s9m
	 PObajvxpuTeMhp8G/Ly2iZvkr5Et8hKh//DdMXxXgfEhKVnx0OJqzRU0Dy34qPQSS4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=M468tcMTyxiICGASSjMUyw305Z48xpIK1tm16lcJZuA=;
	b=ty+MWz7ulZCiaZ0+lcwRZc3PaDOFeD1pWWypcRqaDFHDw8miTe2yRXecyHxW+DHiXJEG
	 kvHBm3rMJ1f6VLO6KliQXHQCBtpp4EgYjIi9OxEnRKZZcfYHQCWZP1EHXO2huHs31pT9X
	 wihoeXqb6y6RpJ5OD71npjo1BdpP5sPErxIEyaHhUdZZZZal6rGCaWaLSju1ME1XfFSSo
	 RDLkiVcYGhzTbUADFCcck+Bijf8cMhQKjcoMmHEJ+uGzShXWUTQFOMZ1g11tXC57Hc5r0
	 SVuZCuWU1lTQnXQxK5Nyj5ksHnjGoUyK2nSm0JuoT9qbYbjvyaFdd0n/NOKl71Hi6OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mUsB0rlp;
	arc=none smtp.remote-ip=209.85.160.70
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFCB60A6F7F
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:24:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FFCB60A6F7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mUsB0rlp
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-4943ed99826so2272434fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356665; x=1794961465; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M468tcMTyxiICGASSjMUyw305Z48xpIK1tm16lcJZuA=;
        b=mUsB0rlpotMemZbYK2JTkc6PJeStFLwkCsRoMZ6F5ggeXOhebXYPTJnrtZFQN+LLKL
         1fs6lthIxLra1ecvwFmCsv0wkJHezdz7V8b6Xy6P9pqYxBelx3eiOjZGPGxY8ET8p/vK
         jd24GgNFsqdY0jxJp7lSwPCSdrW1cv4rcNguxULOMILDJIbDk8SjmnBeDxaWXQkyMB8W
         f1Wc990k5yy/v2+fh/nj0bbom3+Ycr3Tkg7xb1KKlwiiAZ3eL8nJV/qPCMg0mInQyIqk
         U+YffT8ekj2MiqXA+0Uroqp4j/DdCY5jf1VCjZ8jqE4Pea4Ec+CiTjrbNkTAe4xZoLsD
         i1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356665; x=1794961465;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M468tcMTyxiICGASSjMUyw305Z48xpIK1tm16lcJZuA=;
        b=k0wEx0393BX7A5/3V1xADOkSjc38MCYsVOJLW2vXiwITx9EgfJ+GxbYj3HvmqUL+7e
         hkFIy3jykQ33WpG69im+Xy/V2ZiVBjWzmEhtSpHKz77oKUo3ybT/8BUq7Myc7nn2ssIT
         Kyxgj0bn95NA90/JWLk9E6V79XMspTwn18790T/ZWxvRfxOWwES0/0RWDHDo+x4jzslC
         9HsSJ5M/gzomrmXwyllKGJ8VGAudhXO6ngH8qrOLGbwOB1Q3AtEitDSHiosKoApCzqTE
         DbFzaxj5ur7tJD96NcorIIUNnbiUE6Jy8Pr2FrnWH0FZFwzRzoPNwWcsKsQpCFANC6En
         25ig==
X-Forwarded-Encrypted: i=1; AL+hErFHrEHAkZ6OHrPPLxxQBhawPIfg0LdFj4Fb5DejXU9qeZZw6XaKjSwCsKBxE3sAqOVTyPdqhe/8TcDGsoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xzBt8DroDxLLBL0CkSm+fAW94KRIZWECzzvcag2F7Um77+icV
	OGOoTgiuaitUwmTfHAZdoo8xHIY8cQJds2eDkvRVdZoO9/szm+mexb5royxQX3CEvXFds9ke9Ae
	aMCP2VqxO5VIWcw==
X-Received: from iocot34-n1.prod.google.com ([2002:a05:6602:c2a2:10b0:9c7:75ad:5e7b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:2507:b0:4f6:6041:f0a2 with SMTP id 5614622812f47-56b96def35emr633097b6e.27.1794356665063;
 Tue, 10 Nov 2026 16:24:25 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:52 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-15-dmatlack@google.com>
Subject: [PATCH v4 14/19] selftests/liveupdate: Test which tmpfs files can be preserved
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Add tests to liveupdate.c for the checks done when preserving a tmpfs
file: A file can be preserved through a read-only fd, but not a
write-only fd. Preserving it requires permission to write to it, except
for the owner of an immutable file or of a file on a read-only
superblock. Append-only files can't be preserved, and files can be
preserved through a read-only mount. Also check that the size of a
preserved file is frozen until the file is unpreserved.

These checks don't need a kexec, so they run as part of the regular
liveupdate selftest.

Enable CONFIG_TMPFS_XATTR for FS_IOC_SETFLAGS. The test cases that use
it are skipped without it.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/liveupdate/config     |   1 +
 .../testing/selftests/liveupdate/liveupdate.c | 303 ++++++++++++++++++
 2 files changed, 304 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/config b/tools/testing/selftests/liveupdate/config
index 016d009dba13..37230f4c488f 100644
--- a/tools/testing/selftests/liveupdate/config
+++ b/tools/testing/selftests/liveupdate/config
@@ -9,4 +9,5 @@ CONFIG_LIVEUPDATE=y
 CONFIG_LIVEUPDATE_TEST=y
 CONFIG_MEMFD_CREATE=y
 CONFIG_TMPFS=y
+CONFIG_TMPFS_XATTR=y
 CONFIG_SHMEM=y
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 4c4272167635..3d943b5672e6 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -16,15 +16,24 @@
  * - Resource preservation: successfully preserving individual and multiple memfds,
  *   verifying contents remain accessible.
  * - Complex multi-session scenarios involving mixed empty and populated files.
+ * - Which tmpfs files can be preserved, and the frozen size of preserved files.
  */
 
 #include <errno.h>
 #include <fcntl.h>
+#include <grp.h>
 #include <stddef.h>
+#include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
+#include <sys/mount.h>
+#include <sys/stat.h>
+#include <sys/wait.h>
 #include <unistd.h>
 
+#include <linux/falloc.h>
+#include <linux/fs.h>
+
 #include <libliveupdate.h>
 #include <linux/liveupdate.h>
 
@@ -574,4 +583,298 @@ TEST_F(liveupdate_device, preserve_memfd_with_arg)
 	ASSERT_EQ(close(mem_fd2), 0);
 }
 
+#define NOBODY 65534
+
+FIXTURE(preserve_tmpfs) {
+	char dir[32];
+	int luo_fd;
+	int session_fd;
+	bool mounted;
+};
+
+FIXTURE_SETUP(preserve_tmpfs)
+{
+	self->luo_fd = -1;
+	self->session_fd = -1;
+	self->mounted = false;
+
+	self->luo_fd = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->luo_fd < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->luo_fd, 0);
+
+	self->session_fd = luo_create_session(self->luo_fd, "preserve-tmpfs");
+	ASSERT_GE(self->session_fd, 0);
+
+	strcpy(self->dir, "/tmp/luo-tmpfs-XXXXXX");
+	ASSERT_NE(mkdtemp(self->dir), NULL);
+	if (mount("tmpfs", self->dir, "tmpfs", 0, "size=1M"))
+		SKIP(return, "Failed to mount tmpfs: %s", strerror(errno));
+	self->mounted = true;
+	ASSERT_EQ(chdir(self->dir), 0);
+}
+
+FIXTURE_TEARDOWN(preserve_tmpfs)
+{
+	if (self->session_fd >= 0)
+		close(self->session_fd);
+	if (self->luo_fd >= 0)
+		close(self->luo_fd);
+	if (chdir("/"))
+		return;
+	if (self->mounted)
+		umount2(self->dir, MNT_DETACH);
+	rmdir(self->dir);
+}
+
+/* Create the file @path with some contents and the mode @mode. */
+static int create_file(const char *path, mode_t mode)
+{
+	int fd;
+
+	fd = open(path, O_CREAT | O_EXCL | O_RDWR, mode);
+	if (fd < 0)
+		return -1;
+
+	if (write(fd, "data", 4) != 4 || fchmod(fd, mode)) {
+		close(fd);
+		return -1;
+	}
+
+	return fd;
+}
+
+/* Open @path with @flags and preserve it. Return 0 or -errno. */
+static int preserve_path(int session_fd, const char *path, int flags,
+			 __u64 token)
+{
+	int fd, ret;
+
+	fd = open(path, flags);
+	if (fd < 0)
+		return -errno;
+
+	ret = luo_session_preserve_fd(session_fd, fd, token);
+	close(fd);
+	return ret;
+}
+
+/* Like preserve_path(), but as the user nobody. */
+static int preserve_as_nobody(int session_fd, const char *path, __u64 token)
+{
+	int status;
+	pid_t pid;
+
+	pid = fork();
+	if (pid < 0)
+		return -errno;
+
+	if (!pid) {
+		if (setgroups(0, NULL) || setresgid(NOBODY, NOBODY, NOBODY) ||
+		    setresuid(NOBODY, NOBODY, NOBODY))
+			_exit(255);
+		_exit(-preserve_path(session_fd, path, O_RDONLY, token));
+	}
+
+	if (waitpid(pid, &status, 0) != pid || !WIFEXITED(status))
+		return -ECHILD;
+
+	return -WEXITSTATUS(status);
+}
+
+/* Add the inode flag @flag, e.g. FS_IMMUTABLE_FL, to the file @fd. */
+static int add_inode_flag(int fd, int flag)
+{
+	int flags;
+
+	if (ioctl(fd, FS_IOC_GETFLAGS, &flags))
+		return -errno;
+
+	flags |= flag;
+	if (ioctl(fd, FS_IOC_SETFLAGS, &flags))
+		return -errno;
+
+	return 0;
+}
+
+/*
+ * Test Case: Preserve Through Read-Only and Write-Only Fds
+ *
+ * A file can be preserved through a read-only fd, but not through a
+ * write-only fd, since the retrieved file can be read.
+ */
+TEST_F(preserve_tmpfs, access_mode)
+{
+	int fd;
+
+	fd = create_file("file", 0644);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	EXPECT_EQ(preserve_path(self->session_fd, "file", O_WRONLY, 1), -EBADF);
+	EXPECT_EQ(preserve_path(self->session_fd, "file", O_RDONLY, 2), 0);
+}
+
+/*
+ * Test Case: Preserve Without Write Permission
+ *
+ * Preserving a file freezes its size for all of its users, so it requires
+ * permission to write to the file.
+ */
+TEST_F(preserve_tmpfs, unwritable)
+{
+	int fd;
+
+	fd = create_file("file", 0644);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	EXPECT_EQ(preserve_as_nobody(self->session_fd, "file", 1), -EACCES);
+	EXPECT_EQ(preserve_path(self->session_fd, "file", O_RDONLY, 2), 0);
+}
+
+/*
+ * Test Case: Preserve an Append-Only File
+ *
+ * Freezing the size of an append-only file would stop all writes to it, so
+ * append-only files can't be preserved.
+ */
+TEST_F(preserve_tmpfs, append_only)
+{
+	int fd, ret;
+
+	fd = create_file("file", 0644);
+	ASSERT_GE(fd, 0);
+	ret = add_inode_flag(fd, FS_APPEND_FL);
+	close(fd);
+	if (ret == -ENOTTY || ret == -EOPNOTSUPP)
+		SKIP(return, "FS_IOC_SETFLAGS is not supported");
+	ASSERT_EQ(ret, 0);
+
+	EXPECT_EQ(preserve_path(self->session_fd, "file", O_RDONLY, 1), -EPERM);
+}
+
+/*
+ * Test Case: Preserve an Immutable File
+ *
+ * The size of an immutable file can't change anyway, so its owner may preserve
+ * it. Others still need permission to write to it.
+ */
+TEST_F(preserve_tmpfs, immutable)
+{
+	int fd, ret;
+
+	fd = create_file("own", 0644);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(fchown(fd, NOBODY, NOBODY), 0);
+	ret = add_inode_flag(fd, FS_IMMUTABLE_FL);
+	close(fd);
+	if (ret == -ENOTTY || ret == -EOPNOTSUPP)
+		SKIP(return, "FS_IOC_SETFLAGS is not supported");
+	ASSERT_EQ(ret, 0);
+
+	fd = create_file("other", 0666);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(add_inode_flag(fd, FS_IMMUTABLE_FL), 0);
+	close(fd);
+
+	EXPECT_EQ(preserve_as_nobody(self->session_fd, "own", 1), 0);
+	EXPECT_EQ(preserve_as_nobody(self->session_fd, "other", 2), -EPERM);
+}
+
+/*
+ * Test Case: Preserve Through a Read-Only Mount
+ *
+ * Preserving a file only needs permission to write to the file, not a writable
+ * mount, so it works through a read-only mount.
+ */
+TEST_F(preserve_tmpfs, rdonly_mount)
+{
+	int fd;
+
+	ASSERT_EQ(mkdir("src", 0755), 0);
+	fd = create_file("src/file", 0644);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	ASSERT_EQ(mkdir("ro", 0755), 0);
+	ASSERT_EQ(mount("src", "ro", NULL, MS_BIND, NULL), 0);
+	ASSERT_EQ(mount(NULL, "ro", NULL, MS_REMOUNT | MS_BIND | MS_RDONLY,
+			NULL), 0);
+
+	EXPECT_EQ(preserve_path(self->session_fd, "ro/file", O_RDONLY, 1), 0);
+	umount2("ro", MNT_DETACH);
+}
+
+/*
+ * Test Case: Preserve on a Read-Only Superblock
+ *
+ * The size of a file on a read-only superblock can't change anyway, so its
+ * owner may preserve it. Others still need permission to write to it.
+ */
+TEST_F(preserve_tmpfs, rdonly_sb)
+{
+	int fd;
+
+	fd = create_file("own", 0644);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(fchown(fd, NOBODY, NOBODY), 0);
+	close(fd);
+
+	fd = create_file("other", 0666);
+	ASSERT_GE(fd, 0);
+	close(fd);
+
+	ASSERT_EQ(mount(NULL, self->dir, NULL, MS_REMOUNT | MS_RDONLY, NULL),
+		  0);
+
+	EXPECT_EQ(preserve_as_nobody(self->session_fd, "own", 1), 0);
+	EXPECT_EQ(preserve_as_nobody(self->session_fd, "other", 2), -EROFS);
+}
+
+/*
+ * Test Case: Frozen Size of a Preserved File
+ *
+ * While a file is preserved, its size can't change and no holes can be punched
+ * into it. Writes within the file still work. Closing the session unpreserves
+ * the file, after which its size can change again.
+ */
+TEST_F(preserve_tmpfs, frozen_size)
+{
+	long page_size = getpagesize();
+	struct stat st;
+	char c;
+	int fd;
+
+	fd = create_file("file", 0644);
+	ASSERT_GE(fd, 0);
+	ASSERT_EQ(ftruncate(fd, 2 * page_size), 0);
+	ASSERT_EQ(luo_session_preserve_fd(self->session_fd, fd, 1), 0);
+
+	EXPECT_EQ(ftruncate(fd, page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+	EXPECT_EQ(ftruncate(fd, 4 * page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+	EXPECT_EQ(fallocate(fd, 0, 0, 4 * page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+	EXPECT_EQ(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0,
+			    page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+	EXPECT_EQ(pwrite(fd, "x", 1, 2 * page_size), -1);
+	EXPECT_EQ(errno, EPERM);
+
+	/* The size didn't change, but writes within the file work. */
+	ASSERT_EQ(fstat(fd, &st), 0);
+	EXPECT_EQ(st.st_size, 2 * page_size);
+	EXPECT_EQ(pwrite(fd, "x", 1, page_size), 1);
+	EXPECT_EQ(pread(fd, &c, 1, page_size), 1);
+	EXPECT_EQ(c, 'x');
+
+	ASSERT_EQ(close(self->session_fd), 0);
+	self->session_fd = -1;
+	EXPECT_EQ(ftruncate(fd, page_size), 0);
+
+	close(fd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.56.0.542.g3ef89b7020-goog

