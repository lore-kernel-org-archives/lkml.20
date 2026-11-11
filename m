Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356671;
	b=qqAGEipCkIfSQSlPODe4604KpiOxoDTppSHrJ/AMnjhHc1FH7OSuv+CWJzAxfo/XJFp3
	 jHWCAYur/tKYIaGgIBwmlgBnVb///Pski+BSwEWRzg/wmwRw76nH1GFDXct4J/Gf65Azg
	 6DFsqXCBkdlRQVECPFG1ka3aX9yVY6eQMFwPFVW/c+WQkXh0APYkLY8oBLUh6D4QvfZYw
	 +Y/ERmXQdw/qsd/xQZUsyypotfZyfZOK5yONSohEUe6jniQZO9aKB4CsfxM4BJwGHt2Zx
	 Pf2bSwynuWESO2sluGT6+lpSlaejjb9P64Sa0fvpAq9iFA89td72uVIsU+hz5Xx/jrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=1CoGe9fD/ZgqdhBgpqd0QzDfzCHvOXqOoSwskwbt52M=;
	b=gJjZaKsjtcgxgzuJYxSVzfqGqU7RYX6bH1DPynABVPEzosFreoCt1e+7G75/kZGKHR9C
	 ybHLeZYTFE+qswOhsF9Qg0R6YeC/q81XXmJX4LV/6pCpKJOUq3w87nBx8h+rjXq6UT+Mg
	 VUJUJJ7QhEcF99trVYevQJ2TcdkQVHKDt2gmM1TjOEZP4bPktS8m3gV4Pc6++zyr78Oga
	 Fz+HLxVNjgGwCBE9NnImvdVeq2UJ09zLqMoTB4fmBGcUJ3M+/JvnX2fStcYuGNtFmEOVt
	 M2vz8lkepS0xqPxR5mgWmO3qUCJjTlyaloIRV00/pBG9PfpfPPWh4D6aleSbCGmReFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NXe1hHGw;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2948960A6F72
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2948960A6F72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NXe1hHGw
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso3562437b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356670; x=1794961470; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1CoGe9fD/ZgqdhBgpqd0QzDfzCHvOXqOoSwskwbt52M=;
        b=NXe1hHGwBXZaFoGV94mfILaaGeOlSzwO0qR3QENOSBQeKA089lPN5PDoGApnv7gbqQ
         0n8KCGAdjplCmwrU2ffk8LZdihlG3jrbVZS17gUlUjJZVY3Yvgv9tfxsczZ2Nc0fIaBJ
         tf/RFyOTsXleHBTP7GLPX7eAtdtfg1Lql68gLX8nWMZVda0wMVGFdvjJUzTYwfwX+3hZ
         kx5fO3FidiPmQHkLgIxt9Mk2JVtcqJ2wDUTniPxetixjUWXGEr1yCUEJ7IwhpeOZwCaK
         1UF7WNKyLNS33Pzcm4L6TnV1wLDUKyiIl3Jyny3gw/qMO9O/cB3vifUGR4wqi2B3QhSg
         KHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356670; x=1794961470;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1CoGe9fD/ZgqdhBgpqd0QzDfzCHvOXqOoSwskwbt52M=;
        b=GAPUkjHaICdtSobD7xp56ENeYAlDvBDUNnqz7JWT2hhyC+oUVmjnDF3pKWZP9UQouw
         7s5eF2FLZEEeXKg65eOQFOZaY0kNTUeF5BTifWoi42h+TNg6ym7i2odblxgsy7OTT7k8
         BQIW447y0lh+lypR3iJRbr67NJuDEATt9iIyhXkCzCywILdHtkDFhddd5RG53jvWfzyF
         73tyF+dnUgxV8xXAgZzNXF6STMr28eO2B0xRK7qx8K0185Ck0xAw+3hCeiTTZ7n360/i
         5gPj6uTspMPTGjXpd3HFNQOXIfvuqN94VNaUfCQb3Bi9N9tYw6H5D6sh4+RKhcsUOSmr
         cCNA==
X-Forwarded-Encrypted: i=1; AL+hErGjCtGTtAORFirNio2c6uGb6vKKjg9XZccAkkTGOinLoO+lDjcJHdpY0S3PKz2idM8GaDui2ubU80muDc8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aYlfS+B12p7VZcF76kEdVCYFYWHBJVQq/jL3ElxO9dqiAdiQR
	fBVBAwKA9pvloQYWC391PoXyKMsUOvyT8XEW7SGp4tk+RYnEu6AtKKxhKpLRHBkQ/sXnJQ5lg2k
	uv15sfhZXNxq0mw==
X-Received: from jablt8.prod.google.com ([2002:a05:6638:ac08:b0:61f:fbc5:133f])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6605:b0:564:347c:5aa3 with SMTP id 5614622812f47-56b9344c04bmr631370b6e.2.1794356669929;
 Tue, 10 Nov 2026 16:24:29 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:56 +0000
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
Message-ID: <20261111002358.1842967-19-dmatlack@google.com>
Subject: [PATCH v4 18/19] selftests/liveupdate: Test retrieving tmpfs files
 preserved read-only
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

Add test cases to luo_tmpfs for source files preserved through a
read-only fd, through a read-only mount, on a read-only superblock, and
immutable files. Each of these cases except the first also preserves a
sparse file, whose holes are filled when it is preserved. Check that
the files are retrieved with their contents. Also check that the size of
a preserved file is frozen, even when the file is opened by its path,
and that writes within the file are preserved.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 .../testing/selftests/liveupdate/luo_tmpfs.c  | 305 ++++++++++++++++++
 1 file changed, 305 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/luo_tmpfs.c b/tools/testing/selftests/liveupdate/luo_tmpfs.c
index 2d6dd8f0e138..0bd9b95f0575 100644
--- a/tools/testing/selftests/liveupdate/luo_tmpfs.c
+++ b/tools/testing/selftests/liveupdate/luo_tmpfs.c
@@ -451,6 +451,13 @@ static int preserve_memfd(struct test_case *tc, unsigned int flags,
 	return ret;
 }
 
+/* Skip a case whose source file couldn't be preserved in stage 1. */
+static int skip_not_preserved(struct test_case *tc)
+{
+	ksft_print_msg("%s: The source file was not preserved\n", tc->name);
+	return KSFT_SKIP;
+}
+
 static int drop_privileges(void)
 {
 	CHECK_EQ(syscall(__NR_setgroups, 0, NULL), 0);
@@ -808,6 +815,175 @@ static int linked_target_verify(struct test_case *tc)
 	return KSFT_PASS;
 }
 
+static int rdonly_source_preserve(struct test_case *tc)
+{
+	int fd, ret;
+
+	fd = create_source("src/rdonly_source", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+
+	fd = open("src/rdonly_source", O_RDONLY);
+	CHECK(fd >= 0);
+	ret = preserve_fd(fd, tc->pos, tc->token);
+	close(fd);
+
+	return ret;
+}
+
+/* Create a sparse file at @path, with a hole after the first page. */
+static int create_sparse_source(const char *path, __u64 token)
+{
+	int fd;
+
+	fd = create_source(path, page_size, token);
+	if (fd < 0)
+		return -1;
+
+	if (ftruncate(fd, 2 * page_size)) {
+		close(fd);
+		return -1;
+	}
+
+	return fd;
+}
+
+/* Open @path with O_RDONLY and try to preserve it with @token. */
+static int try_preserve_path(const char *path, __u64 token)
+{
+	int fd, ret;
+
+	fd = open(path, O_RDONLY);
+	if (fd < 0)
+		return -errno;
+
+	ret = luo_session_preserve_fd(session_fd, fd, token);
+	close(fd);
+	return ret;
+}
+
+/* Check that the file preserved with @token has the source of @tc. */
+static int check_preserved(struct test_case *tc, __u64 token, size_t size)
+{
+	int fd;
+
+	fd = retrieve_new(token, "dst");
+	CHECK(fd >= 0);
+	CHECK_EQ(file_size(fd), size);
+	TRY(check_contents(fd, size, tc->token));
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+/* Check that the file preserved with @token is a create_sparse_source(). */
+static int check_sparse_preserved(struct test_case *tc, __u64 token)
+{
+	unsigned char *p;
+	int fd;
+
+	fd = retrieve_new(token, "dst");
+	CHECK(fd >= 0);
+	CHECK_EQ(file_size(fd), 2 * page_size);
+
+	/* Preserving the file filled the hole. */
+	CHECK_EQ(file_pages(fd), 2);
+	p = mmap(NULL, 2 * page_size, PROT_READ, MAP_SHARED, fd, 0);
+	CHECK(p != MAP_FAILED);
+	TRY(check_range(p, 0, page_size, tc->token));
+	TRY(check_range(p, page_size, 2 * page_size, 0));
+
+	munmap(p, 2 * page_size);
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int rdonly_mount_source_preserve(struct test_case *tc)
+{
+	int fd;
+
+	fd = create_source("src/rdonly_mount_source", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	fd = create_sparse_source("src/rdonly_mount_sparse", tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+
+	CHECK_EQ(mkdir("src_ro", 0755), 0);
+	CHECK_EQ(do_mount("src", "src_ro", NULL, MS_BIND, NULL), 0);
+	CHECK_EQ(do_mount("none", "src_ro", NULL,
+			  MS_REMOUNT | MS_BIND | MS_RDONLY, NULL), 0);
+
+	/*
+	 * Files can be preserved through a read-only mount. Their holes are
+	 * filled as if by read faults, which work through read-only mounts too.
+	 */
+	CHECK_EQ(try_preserve_path("src_ro/rdonly_mount_source", tc->token), 0);
+	CHECK_EQ(try_preserve_path("src_ro/rdonly_mount_sparse", tc->token + 1),
+		 0);
+	return KSFT_PASS;
+}
+
+static int rdonly_mount_source_verify(struct test_case *tc)
+{
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	TRY(check_preserved(tc, tc->token, tc->size));
+	TRY(check_sparse_preserved(tc, tc->token + 1));
+	return KSFT_PASS;
+}
+
+static int rdonly_sb_source_child(struct test_case *tc)
+{
+	TRY(drop_privileges());
+
+	/* The owner can preserve a file whose size can't change anyway... */
+	CHECK_EQ(try_preserve_path("src_rosb/own", tc->token + 1), 0);
+
+	/* ... but nobody else can. */
+	CHECK_EQ(try_preserve_path("src_rosb/other", tc->token + 2), -EROFS);
+	return KSFT_PASS;
+}
+
+static int rdonly_sb_source_preserve(struct test_case *tc)
+{
+	int fd;
+
+	CHECK_EQ(mount_tmpfs("src_rosb", 16, NULL), 0);
+	fd = create_source("src_rosb/root", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	fd = create_source("src_rosb/own", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	CHECK_EQ(chown("src_rosb/own", NOBODY, NOBODY), 0);
+	fd = create_source("src_rosb/other", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	fd = create_sparse_source("src_rosb/sparse", tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+
+	CHECK_EQ(do_mount(NULL, "src_rosb", NULL, MS_REMOUNT | MS_RDONLY, NULL),
+		 0);
+
+	CHECK_EQ(try_preserve_path("src_rosb/root", tc->token), 0);
+	TRY(run_child(rdonly_sb_source_child, tc));
+
+	/* Holes are filled as if by read faults, even on a read-only sb. */
+	CHECK_EQ(try_preserve_path("src_rosb/sparse", tc->token + 3), 0);
+	return KSFT_PASS;
+}
+
+static int rdonly_sb_source_verify(struct test_case *tc)
+{
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	TRY(check_preserved(tc, tc->token, tc->size));
+	TRY(check_preserved(tc, tc->token + 1, tc->size));
+	CHECK_EQ(luo_session_retrieve_fd(session_fd, tc->token + 2), -ENOENT);
+	TRY(check_sparse_preserved(tc, tc->token + 3));
+	return KSFT_PASS;
+}
+
 /* Set the inode flag @flag, e.g. FS_IMMUTABLE_FL, on the file at @path. */
 static int set_inode_flag(const char *path, int flag)
 {
@@ -829,6 +1005,104 @@ static int set_inode_flag(const char *path, int flag)
 	return ret;
 }
 
+static int immutable_source_preserve(struct test_case *tc)
+{
+	int fd, ret;
+
+	fd = create_source("src/immutable_source", tc->size, tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+	fd = create_sparse_source("src/immutable_sparse", tc->token);
+	CHECK(fd >= 0);
+	close(fd);
+
+	ret = set_inode_flag("src/immutable_source", FS_IMMUTABLE_FL);
+	if (ret == -ENOTTY || ret == -EOPNOTSUPP) {
+		ksft_print_msg("%s: FS_IOC_SETFLAGS is not supported\n",
+			       tc->name);
+		return KSFT_SKIP;
+	}
+	CHECK_EQ(ret, 0);
+	CHECK_EQ(set_inode_flag("src/immutable_sparse", FS_IMMUTABLE_FL), 0);
+
+	/*
+	 * The size of an immutable file can't change anyway, so its owner can
+	 * preserve it. Its holes are filled as if by read faults.
+	 */
+	CHECK_EQ(try_preserve_path("src/immutable_source", tc->token), 0);
+	CHECK_EQ(try_preserve_path("src/immutable_sparse", tc->token + 1), 0);
+	return KSFT_PASS;
+}
+
+static int immutable_source_verify(struct test_case *tc)
+{
+	int fd;
+
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	fd = retrieve_new(tc->token, "dst");
+	if (fd == -ENOENT)
+		return skip_not_preserved(tc);
+	CHECK(fd >= 0);
+	CHECK_EQ(file_size(fd), tc->size);
+	TRY(check_contents(fd, tc->size, tc->token));
+	close(fd);
+
+	TRY(check_sparse_preserved(tc, tc->token + 1));
+	return KSFT_PASS;
+}
+
+#define FROZEN_OFFSET		100
+#define FROZEN_DATA		"frozen"
+
+static int frozen_source_preserve(struct test_case *tc)
+{
+	size_t len = strlen(FROZEN_DATA);
+	int fd;
+
+	TRY(preserve_file(tc));
+
+	/* The size of a preserved file can't change, even through its path. */
+	fd = open("src/frozen_source", O_RDWR);
+	CHECK(fd >= 0);
+	CHECK_ERRNO(ftruncate(fd, tc->size / 2), EPERM);
+	CHECK_ERRNO(ftruncate(fd, tc->size * 2), EPERM);
+	CHECK_ERRNO(do_fallocate(fd, 0, 0, tc->size * 2), EPERM);
+	CHECK_ERRNO(do_fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+				 0, page_size), EPERM);
+	CHECK_EQ(lseek(fd, tc->size, SEEK_SET), tc->size);
+	CHECK_ERRNO(write(fd, "x", 1), EPERM);
+	CHECK_EQ(file_size(fd), tc->size);
+
+	/* Writes within the file work, and the data is preserved. */
+	CHECK_EQ(lseek(fd, FROZEN_OFFSET, SEEK_SET), FROZEN_OFFSET);
+	CHECK_EQ(write(fd, FROZEN_DATA, len), len);
+
+	close(fd);
+	return KSFT_PASS;
+}
+
+static int frozen_source_verify(struct test_case *tc)
+{
+	size_t len = strlen(FROZEN_DATA);
+	unsigned char *p;
+	int fd;
+
+	CHECK_EQ(mount_tmpfs("dst", 16, NULL), 0);
+	fd = retrieve_new(tc->token, "dst");
+	CHECK(fd >= 0);
+	CHECK_EQ(file_size(fd), tc->size);
+
+	p = mmap(NULL, tc->size, PROT_READ, MAP_SHARED, fd, 0);
+	CHECK(p != MAP_FAILED);
+	TRY(check_range(p, 0, FROZEN_OFFSET, tc->token));
+	CHECK(!memcmp(p + FROZEN_OFFSET, FROZEN_DATA, len));
+	TRY(check_range(p, FROZEN_OFFSET + len, tc->size, tc->token));
+
+	munmap(p, tc->size);
+	close(fd);
+	return KSFT_PASS;
+}
+
 static int target_rdonly_verify(struct test_case *tc)
 {
 	int target, rd_fd;
@@ -1287,6 +1561,37 @@ static struct test_case test_cases[] = {
 		.size = SMALL_SIZE,
 		.verify = linked_target_verify,
 	},
+	/* Preserving files. */
+	{
+		.name = "rdonly_source",
+		.size = SMALL_SIZE,
+		.preserve = rdonly_source_preserve,
+		.verify = restore_verify,
+	},
+	{
+		.name = "rdonly_mount_source",
+		.size = SMALL_SIZE,
+		.preserve = rdonly_mount_source_preserve,
+		.verify = rdonly_mount_source_verify,
+	},
+	{
+		.name = "rdonly_sb_source",
+		.size = SMALL_SIZE,
+		.preserve = rdonly_sb_source_preserve,
+		.verify = rdonly_sb_source_verify,
+	},
+	{
+		.name = "immutable_source",
+		.size = SMALL_SIZE,
+		.preserve = immutable_source_preserve,
+		.verify = immutable_source_verify,
+	},
+	{
+		.name = "frozen_source",
+		.size = SMALL_SIZE,
+		.preserve = frozen_source_preserve,
+		.verify = frozen_source_verify,
+	},
 	/* The target file. */
 	{
 		.name = "target_rdonly",
-- 
2.56.0.542.g3ef89b7020-goog

