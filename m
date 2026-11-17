Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935239;
	b=BC7NT1v+qFqsVmPTbGAGTJXagtRAJF0rnqlTxzeUWStnRrFiwAMHZp7BaDW1pTUjIgan
	 JyVkR1U9qs2zyK0q2QcCZLksIN72sCutIGxQSkAsGGtulf3HdOVOQmArVo9CoQsSY/wED
	 MavIFT0lgTXLARq5m2KgF6KrOXyHqedoQvk6IbckM95o8RFOW9eqWxUPpkGelvdAt8W2S
	 vHKZP40AJ+fUn94Lb/7hljHw4lpf8OzIIkHe907i2X5qk6WXDDY3otyAK12uS/E0ooK9m
	 ThhVxrYxPa6070U3zztXXgVuUjSTiFrAFDmb7Yz4gMmjDcliAnYvaG+p3rJiFKSGEYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935239;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HDIw7LkPraP3MsfSq3lN0iboBUNVAlrEnjCuPbmeHg0=;
	b=BSaZ+qq66e6ds9bKhIT2ulRUu/bP/b5KdM5ZheIvDD/lS2ytsjI6zyKYOZCabRLzcot3
	 R+LCs4UXn9dJuPeW5LiqU2bavxri5LkEeTJHUBHaUZ5+SeOTDcZsevhoq1aruSNR3ZN/2
	 NMCt7to28CoX9UgbckeL6B/uP6dnUci49qzmA/MN/lBLbRvsj2G5+B7CR4pMTJZ1k0nyI
	 PqpunAdUw9mYNTEX23VZwp50UM8gu0fzu0vwU8cFrO6eYSl36i9AqACSn8yp/uDLcjy4p
	 sWneF+RMkYRfF7zOLdGQ5nrPwonEfxB9ZET0cZvdaWkVgAq9G3aeXPnGQz5l22O0Otg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yt84R+mR;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D560E606A333
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D560E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yt84R+mR
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso2678433a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935238; x=1795540038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HDIw7LkPraP3MsfSq3lN0iboBUNVAlrEnjCuPbmeHg0=;
        b=Yt84R+mRj17Vuxy9vCcizubVYtzU50MDSATSlafYcv7qpRjQv/rCvbTdhu91t/HI2h
         umhUvo9sssSp2MbJK19YfIJfbaHHJY793yfi/5vfcYZCpijnrzBZ1XmEjVRAcUerMLzf
         puasXqREteE0r2y4rj8AMYR2YDwugW+rXLnvQyRTebMFwG1OruPLFjvQevFTFaRmv0DG
         /QuskO9gLF/qlsR5iXhZGJon0c3FY2WjmcLAL7CeuJxfsn6w2VkdqIhaXPzGyA3o8BFZ
         EK/ey1U1xs3Y4MmN8l1h06vXq6qzLM23hpoWH/kwbmMzC8W0dZzMrXKXfTFkn7U/ERZj
         G/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935238; x=1795540038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HDIw7LkPraP3MsfSq3lN0iboBUNVAlrEnjCuPbmeHg0=;
        b=LvucL/G+iNzHCfjRQWkEq+WCrYEV2tN3dVVvx7BoYkh0outBHh4d64ts8wFJfx3qjz
         a2t/wqi8lKZHRIMtzpXYFiTwSUBpTt/PyGDCbjr81I3Wgl0pBYIYsSSeoPjLHZUBdIVi
         1+liW36ycWUr6vgT2BsqQD9IcVFOPgQ/g/BQ5pi42h4Foiwttpvl8mmDyEbO5uoh8+bT
         5VS9QCAAJWEmQoS1kjiuZKJfL9Ei8erMIxJXxb1SdgVdRkDyzUpo4jR+oEDofZg1VVwg
         puBTd4qeQXceUG10wZQML6VkN1VBCf3byakuzvsyPp55TIu0k3NESUZ5zxTpJ6HtohxT
         Y0Xg==
X-Forwarded-Encrypted: i=1; AL+hErG7+0LbhpAxdHyJ5hbhAxeGg1l2XA0o+xZRIgcB6tqSkFz7XEMVoCiP0rK79WexixRoKcZ7x8tHMoSYa5o=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qwV+jJ6frGysXvGzN5zkYhIIJ6TP7Ey5B0FKgc5t3ZhBhlKW4
	PH9eAFWDH10Vvq0My9uzGTgmDN+cprysod5EW/WKqfu5G3tsn0g6bL6d
X-Gm-Gg: AZFdTZedtmvRZRbpCK7uVqMV/1a5O9g5GMArQKkxIfEjs/7G0lvkrZ1f7C56wjA9GuR
	uj9TkOP9BChCZILZPHGpxbnXvygcc7Zio+ihSZrnlut5I/p6Ukf8hdBhTuiuOJGyerTexzN1S/N
	W+mKww50U4S04UhRJw7PQnn7UAm5HNV234WwHVfyxsQBiQ5tBLxwfUUSxT23psCkZGj8lA61zIs
	68lZd3VkptZu5AFwkxzraT1pSPC2LRuqjzxzjdCtwMV+GmtJSHA8pNWjGGZGZSy78uIUXpErdZB
	OZIuiyjzCSz/CReqSojxHlUtxBj/YprMZmIv35bXJ3gdiJ5WqvRLyg3xrWuwvrSfGhIVmn+YqpH
	NGzIZCgje5JdOeIz7KI9gBoqecYh/SePKeJDuJFTiqjI0QKPSbWVmKl159SONzCH9AR7NO3xL+o
	97Nh+cJAe+hlJFEGxOKPV0HEZ4aUkeDPsXX8VG2fmcJCvZepXGxtVlHtHab3RlQ7Yqne2u9vi9g
	B4JD+7WYkDyuf8aQMHpHxwuSV3CIigstKgsT5R5NQqR6mBF+92sS+D2qoLwLeAglK1YYuHDRVdg
	C+PHADNqKw/zCVNyo6ECt4o/uESHsI9Phe8lmQSZe414QJdMQOnVUdiMPHiPK+7VMyP4Y5eV0Aq
	GXQyNDKT6yHyiyz7a
X-Received: by 2002:a17:90b:4cc4:b0:3b3:b5e5:3592 with SMTP id 98e67ed59e1d1-3b3d06a2559mr99784a91.9.1794935237917;
        Tue, 17 Nov 2026 09:07:17 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abbad970sm4925368a91.4.2026.11.17.09.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:07:16 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Hui Zhu <hui.zhu@linux.dev>,
	Hui Zhu <zhuhui@kylinos.cn>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Barry Song <baohua@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH bpf-next v2] selftests/bpf: Fall back when memcg_proactive_reclaim data lands in shmem
Date: Wed, 18 Nov 2026 01:07:04 +0800
Message-ID: <20261117170704.1146730-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
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

workload_dir() keeps the data file off tmpfs because shmem cannot be
reclaimed without swap. But statfs() only sees the top of a stacking
filesystem: with /tmp on overlayfs over tmpfs, as in virtme-ng guests,
the check passes and all 32 MiB are still charged as shmem. Whether the
test then passes depends on unrelated page cache in the cgroup; in a
full test_progs run it fails with:

  test_memcg_proactive_reclaim:FAIL:reclaimed unexpected reclaimed: actual 0 <= expected 0

After writing the file, check memory.stat and move on to the next
candidate directory if most of the data was charged as shmem; skip only
when none is left. Give each candidate its own cgroup so that stale
stats from a previous attempt cannot interfere, and poll memory.stat
until the write shows up, as reading it does not force a stats flush.
Fail the test if memory.stat cannot be read or never shows the write.

An AI coding assistant (Claude) was used to find and analyze the
failure and to draft the fix and this changelog.

Fixes: 0f9b1e9ef584 ("selftests/bpf: Add bpf_proactive_reclaim test")
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---

Notes:
    Changes in v2:
    - Try the next candidate directory instead of skipping right away, with
      a fresh cgroup per candidate (sashiko)
    - Poll memory.stat until the write is visible: reading it does not force
      a flush, so it can still show 0 right after the write when many CPUs
      are online (sashiko)
    - Fail the test instead of silently running on when memory.stat cannot
      be read or parsed, or never shows the write (Hui)
    - Comment on the FILE_SIZE / 2 threshold and print the measured shmem
      charge (Hui)
    - Subject was "Skip memcg_proactive_reclaim when data lands in shmem"
    
    Tested in a virtme-ng guest without swap:
    - /tmp on overlayfs over tmpfs: falls back to "." and passes
    - /tmp on tmpfs: uses "." and passes
    - both on overlayfs over tmpfs: skips
    - full test_progs run with /tmp on overlayfs over tmpfs: passes
    
    To exercise the polling, FILE_SIZE was temporarily cut to 2 MiB in a
    128-vCPU guest, which keeps the write below the flush threshold.
    memory.stat read 0 right after the write and the data showed up after
    2-6 s, once the periodic flusher had run.
    
    v1: https://lore.kernel.org/bpf/20261113180159.602033-1-lylin1023@gmail.com/

 .../bpf/prog_tests/memcg_proactive_reclaim.c  | 161 ++++++++++++++----
 1 file changed, 125 insertions(+), 36 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
index c22dcfabe856..23ca1075f260 100644
--- a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
+++ b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
@@ -19,6 +19,15 @@
 #define FILE_SIZE (32 * 1024 * 1024UL)
 #define BUF_SIZE (64 * 1024)
 
+/*
+ * memcg stats are flushed lazily: reading memory.stat only flushes once
+ * pending updates exceed MEMCG_CHARGE_BATCH * num_online_cpus(), so on a
+ * large machine the write may only show up after the periodic flusher
+ * (every 2s, later on a busy machine) has run.
+ */
+#define MEMCG_STAT_RETRIES		40
+#define MEMCG_STAT_RETRY_DELAY_US	(250 * 1000)
+
 struct reclaim_args {
 	__u64 cgroup_id;
 	__u64 size;
@@ -32,18 +41,79 @@ struct reclaim_args {
  * routinely run from a tmpfs working directory, so both candidates need the
  * check.
  */
-static const char *workload_dir(void)
+static const char * const workload_dirs[] = { "/tmp", "." };
+
+static bool usable_dir(const char *dir)
 {
-	static const char * const dirs[] = { "/tmp", "." };
 	struct statfs st;
+
+	return !statfs(dir, &st) && st.f_type != TMPFS_MAGIC &&
+	       st.f_type != RAMFS_MAGIC && !access(dir, W_OK);
+}
+
+static bool memcg_stat(const char *stat, const char *key,
+		       unsigned long long *val)
+{
+	char needle[32];
+	const char *p;
+
+	snprintf(needle, sizeof(needle), "\n%s ", key);
+	p = strstr(stat, needle);
+	return p && sscanf(p + strlen(needle), "%llu", val) == 1;
+}
+
+/*
+ * statfs() only sees the top of a stacking filesystem: when /tmp is an
+ * overlayfs over tmpfs, as in virtme-ng guests, the check above passes but
+ * the data still ends up as shmem. Wait for the write to show up in the
+ * cgroup's stats ("file" includes shmem) and report how much of it is shmem.
+ * Both keys are always present, so failing to read them is an error.
+ */
+static int read_shmem_charge(const char *cg, unsigned long long *shmem)
+{
+	static char buf[8192];
+	unsigned long long file = 0;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(dirs); i++)
-		if (!statfs(dirs[i], &st) && st.f_type != TMPFS_MAGIC &&
-		    st.f_type != RAMFS_MAGIC && !access(dirs[i], W_OK))
-			return dirs[i];
+	for (i = 0; i < MEMCG_STAT_RETRIES; i++) {
+		if (!ASSERT_OK(read_cgroup_file(cg, "memory.stat", buf,
+						sizeof(buf)), "read memory.stat") ||
+		    !ASSERT_TRUE(memcg_stat(buf, "file", &file), "parse file") ||
+		    !ASSERT_TRUE(memcg_stat(buf, "shmem", shmem), "parse shmem"))
+			return -1;
+		if (file >= FILE_SIZE / 2)
+			return 0;
+		usleep(MEMCG_STAT_RETRY_DELAY_US);
+	}
 
-	return NULL;
+	ASSERT_GE(file, FILE_SIZE / 2, "file in memory.stat");
+	return -1;
+}
+
+/* Charge FILE_SIZE of clean page cache to the current cgroup. */
+static int write_data_file(const char *dir, char *path, size_t len)
+{
+	static char buf[BUF_SIZE];
+	off_t off;
+	int fd;
+
+	snprintf(path, len, "%s/memcg_proactive_reclaim_XXXXXX", dir);
+	fd = mkstemp(path);
+	if (!ASSERT_GE(fd, 0, "mkstemp"))
+		return -1;
+
+	for (off = 0; off < (off_t)FILE_SIZE; off += sizeof(buf))
+		if (!ASSERT_EQ(write(fd, buf, sizeof(buf)),
+			       (ssize_t)sizeof(buf), "write"))
+			goto err;
+	if (!ASSERT_OK(fsync(fd), "fsync"))
+		goto err;
+
+	return fd;
+err:
+	close(fd);
+	unlink(path);
+	return -1;
 }
 
 void test_memcg_proactive_reclaim(void)
@@ -55,35 +125,62 @@ void test_memcg_proactive_reclaim(void)
 		    .ctx_in = &args,
 		    .ctx_size_in = sizeof(args));
 
-	char data_file[PATH_MAX];
-	static char buf[BUF_SIZE];
+	char data_file[PATH_MAX], cg[64];
+	unsigned long long shmem;
 	__u64 cgroup_id;
-	const char *dir;
-	off_t off;
-	int cg_fd = -1, data_fd = -1, err;
+	int cg_fd = -1, data_fd = -1, err, i;
+
+	if (!ASSERT_OK(setup_cgroup_environment(), "setup_cgroup_environment"))
+		return;
 
 	/*
-	 * Both candidate directories can be unusable: tmpfs (initramfs-based
-	 * CI, for instance) or a read-only mount. That is an environment
-	 * limitation, not a test failure.
+	 * Try each candidate in a cgroup of its own, so that the stats of one
+	 * attempt do not leak into the next.
 	 */
-	dir = workload_dir();
-	if (!dir) {
-		test__skip();
-		return;
-	}
+	for (i = 0; i < ARRAY_SIZE(workload_dirs); i++) {
+		if (!usable_dir(workload_dirs[i]))
+			continue;
 
-	snprintf(data_file, sizeof(data_file),
-		 "%s/memcg_proactive_reclaim_XXXXXX", dir);
-	data_fd = mkstemp(data_file);
-	if (!ASSERT_GE(data_fd, 0, "mkstemp"))
-		return;
+		snprintf(cg, sizeof(cg), CG_PATH "_%d", i);
+		cg_fd = create_and_get_cgroup(cg);
+		if (!ASSERT_OK_FD(cg_fd, "create_and_get_cgroup"))
+			goto out;
+		if (!ASSERT_OK(join_cgroup(cg), "join_cgroup"))
+			goto out;
+
+		data_fd = write_data_file(workload_dirs[i], data_file,
+					  sizeof(data_file));
+		if (data_fd < 0 || read_shmem_charge(cg, &shmem))
+			goto out;
 
-	cg_fd = cgroup_setup_and_join(CG_PATH);
-	if (!ASSERT_OK_FD(cg_fd, "cgroup_setup_and_join"))
+		/*
+		 * All or nothing: the file is either entirely shmem (tmpfs,
+		 * possibly under a stacking filesystem) or not shmem at all
+		 * (disk-backed), so half of FILE_SIZE is a safe midpoint.
+		 */
+		if (shmem < FILE_SIZE / 2)
+			break;
+
+		printf("%s: %s is backed by shmem (%llu MiB charged)\n",
+		       __func__, workload_dirs[i], shmem >> 20);
+		close(data_fd);
+		unlink(data_file);
+		data_fd = -1;
+		close(cg_fd);
+		cg_fd = -1;
+	}
+
+	/*
+	 * No candidate is usable: tmpfs (initramfs-based CI, for instance),
+	 * a read-only mount, or a stacking filesystem on top of tmpfs. That is
+	 * an environment limitation, not a test failure.
+	 */
+	if (data_fd < 0) {
+		test__skip();
 		goto out;
+	}
 
-	cgroup_id = get_cgroup_id(CG_PATH);
+	cgroup_id = get_cgroup_id(cg);
 	if (!ASSERT_GT(cgroup_id, 0, "get_cgroup_id"))
 		goto out;
 
@@ -91,14 +188,6 @@ void test_memcg_proactive_reclaim(void)
 	if (!ASSERT_OK_PTR(skel, "open_and_load"))
 		goto out;
 
-	/* Charge FILE_SIZE of clean page cache to the cgroup. */
-	for (off = 0; off < (off_t)FILE_SIZE; off += sizeof(buf))
-		if (!ASSERT_EQ(write(data_fd, buf, sizeof(buf)),
-			       (ssize_t)sizeof(buf), "write"))
-			goto out;
-	if (!ASSERT_OK(fsync(data_fd), "fsync"))
-		goto out;
-
 	args.cgroup_id = cgroup_id;
 	args.size = FILE_SIZE;
 	skel->bss->reclaimed = 0;

base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
-- 
2.56.1

