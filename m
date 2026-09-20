Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35D33F23B1
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896737; cv=none; b=oYwI78reE/WDcKq0I+B10PgAgxOdpfQ9+EWDdh+dCUnJcR0rlvM/nDs8lil/yeVEELidIJ3o4A9ZRmuVrRY36BexAhZpPs59mrQWcsY2TJiVAZultEXDCLokQTzftY9Y51a6L3b34uJJG2jtMHDUQtlPpRqNUXZUdV6rdTxDZts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896737; c=relaxed/simple;
	bh=PfQzAlFTJmP5nOozLR51GBXWUn9nRQSC5bCLYL7vjKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aHNdyKNNvl6RcLQSY8UfxLp2k5NMAFBKnxdDI6NnPN4J2F7WpdSshiwmcqJqtE698qAfssT13PBiPV1XZcDlLGOxYd5ImH/mSZ51Wgc9cdGDT+47+YCOtR6JvemUsPqqmxm+0xhWjQv/LQt9KSY1YE6MRVG1ezjGoq6svT26Jls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s5WKTDUC; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s5WKTDUC"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso2258200a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896726; x=1790501526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I8CYADlMulmBrbeU/nI2e7mucfs6KlRtSnU3QkA587M=;
        b=s5WKTDUCFleeJgXTo+MAu7z7U2iNrDEvOnbqAWTqEZtBGGienHUi5wmdwxumR7dfiG
         +JQNnm5NXBgtdDUpQkG60wv0LsFeHlEYkA6gXnU8i2uncb474M2yiNVD/53pkrbc3GbY
         mxy6x050RTTETzUCwRhTiPuuKmHazIEWnmib6MtzhuCEOB0TLZfUO5JZNN7jYWJ72ADa
         ODYirkNWamwtjk90kqRzx0YmoylKX/NOfNU7bFTdtOBuJ4c3qrY/eIqMTq/xLi/7qg+Y
         A1IWot8fX/tqj04iSiTPeTYgYpgmWyFAoHp6q54QP3oUgwLVTJYnewii0gouu9Li+WMH
         d8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896726; x=1790501526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I8CYADlMulmBrbeU/nI2e7mucfs6KlRtSnU3QkA587M=;
        b=aSy3hMlNQy/vPtimkNHs5xQmK+FpJVEQDSilSU6G6Gpw3xbzU38sgNJ6bgExi6rSjd
         B+28kK/6CxaVb7+82PgW4xbwE7EW+Ndkn0loiZWTKuyN6ZHVHUbA5ufHvU5lFt49axIb
         OztL/YQFWW7Pe9WGFQ7Z55Y+TpVLxG9JLM3oCGZUqv3ZEVFl5ocC8AOM7crsBbffcBCF
         rVW4MFJNBOeR8kdpRVwnXitvSrkpblvahGW8WJDXbKUwk9BSLluTh+a1ebSRYtdvB+iE
         EpqQcSlcLGJUyvidqI3TnsZ7iHEU4ZpusJ+acwmIJDMNGQme67oPKFzQKtLBs934u75q
         ru6w==
X-Forwarded-Encrypted: i=1; AKwUvBz6vERQ2/3/4nDCrUb6jb3JSOB4ST3+uaofQeJ+UISwrwCIPLh4nWfUlCAFRZQByyCqY5chA76JQBlC8iY=@vger.kernel.org
X-Gm-Message-State: AFuF++kg7AYVqqboUkVs+yDr07J+yMZhYrSPEx6U8Ug0kj65dp2noJ7v
	MPnufG2/pVWsmMSGHQU7HLputYZkbYsB5APk+BUA7xCBLw0j4oDkbA8=
X-Gm-Gg: AYBFou2iYgOjsRf8g9HPIandXNQaVmhAntKRT8d25mjPSuO6j75X2ilTl140KhiPC7B
	cy5d+appNHtHACIblSYKL4DyOSnxRowuYXnO7hGfLSpKWD8O3hY6sdiDfdD+kMoHfsaGhHvUwR3
	+l8YjVrexRqTXhmxmD2nJW0loFWqLQbjjvUXjGmzdnOTExSDBH7Duy3SYCIRgA5uOkZBHeC9ust
	7II8BuHK0YCbxFugKAEAjFPVaP88Z3sJJPoBmY9a+GiJHXDqxMmgFmkv15NL7/KukC6Lg90khk0
	k9G+p35zgOpBRhZOV7hfoH05k0VfNlQfzc1D8PYu75bwHTEMuLtwmGftJjXmLDz5sdk9pQRhZXd
	qBLi/tI6nUdWvQwY3cq4UowobncjlQT7qquruy8Yk1Y1LpTNxajLCNZ31BwblBkVtU7UDSj8rGl
	rZA+8mKVcD4QqoJlVKTsA+uqDJJF4IXCed39BtDJGouIaPSaSi2B6/6Xxu5R/2IwflrfZ8a2PTr
	8C4G4zZxaPz8BzdFxbFu6RGmd8yO2VqIndlTVg=
X-Received: by 2002:a17:90a:104f:b0:39e:574d:3d2f with SMTP id 98e67ed59e1d1-39e574d3f4fmr8126566a91.7.1789896726217;
        Sun, 20 Sep 2026 02:32:06 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:e0d6:4b87:c472:c9ae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6fb75539sm8093503a91.3.2026.09.20.02.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:32:05 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf 2/2] selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created element
Date: Sun, 20 Sep 2026 18:31:53 +0900
Message-ID: <20260920093153.439743-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920093153.439743-1-donggeunyoo.kernel@gmail.com>
References: <20260920093153.439743-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing cpu_flag subtests always prime a key with BPF_F_ALL_CPUS
before any BPF_F_CPU write, so the element always exists by the time the
flag is used and the create path is never covered.

Add a subtest that creates the element with BPF_F_CPU on a map whose
max_entries is 1, so the key can only reuse the element the previous key
released, and check that the CPUs the update did not name read back zero
rather than the previous key's value.  Run it for PERCPU_HASH both
preallocated and BPF_F_NO_PREALLOC, whose per-cpu areas are recycled by
different allocators, and for LRU_PERCPU_HASH, which is always
preallocated.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 .../selftests/bpf/prog_tests/percpu_alloc.c   | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c b/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c
index a72ae0b29f6e9..d0084a2405bed 100644
--- a/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c
+++ b/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c
@@ -350,6 +350,74 @@ static void test_lru_percpu_hash_cpu_flag(void)
 	test_percpu_map_cpu_flag(BPF_MAP_TYPE_LRU_PERCPU_HASH);
 }
 
+/* A BPF_F_CPU update that creates an element must zero the value on the other
+ * cpus, rather than leave them holding whatever the recycled element last
+ * contained.  max_entries is 1 so the second key can only reuse the element
+ * the first one released.
+ */
+static void test_percpu_map_cpu_flag_create(enum bpf_map_type map_type, __u32 map_flags)
+{
+	LIBBPF_OPTS(bpf_map_create_opts, opts, .map_flags = map_flags);
+	const u32 stale = 0xDEADC0DE, fresh = 0xC0FFEE;
+	int nr_cpus, cpu, map_fd, err, key;
+	u32 value;
+	u64 flags;
+
+	nr_cpus = libbpf_num_possible_cpus();
+	if (!ASSERT_GT(nr_cpus, 1, "libbpf_num_possible_cpus"))
+		return;
+
+	map_fd = bpf_map_create(map_type, "cpu_flag_create", sizeof(key), sizeof(value), 1, &opts);
+	if (!ASSERT_GE(map_fd, 0, "bpf_map_create"))
+		return;
+
+	key = 1;
+	value = stale;
+	err = bpf_map_update_elem(map_fd, &key, &value, BPF_F_ALL_CPUS);
+	if (!ASSERT_OK(err, "bpf_map_update_elem all_cpus"))
+		goto out;
+
+	err = bpf_map_delete_elem(map_fd, &key);
+	if (!ASSERT_OK(err, "bpf_map_delete_elem"))
+		goto out;
+
+	key = 2;
+	value = fresh;
+	flags = BPF_F_CPU;
+	err = bpf_map_update_elem(map_fd, &key, &value, flags);
+	if (!ASSERT_OK(err, "bpf_map_update_elem specified cpu"))
+		goto out;
+
+	for (cpu = 0; cpu < nr_cpus; cpu++) {
+		value = 0;
+		flags = (u64)cpu << 32 | BPF_F_CPU;
+		err = bpf_map_lookup_elem_flags(map_fd, &key, &value, flags);
+		if (!ASSERT_OK(err, "bpf_map_lookup_elem_flags specified cpu"))
+			goto out;
+		if (!ASSERT_EQ(value, cpu ? 0 : fresh, "value on specified cpu"))
+			goto out;
+	}
+
+out:
+	close(map_fd);
+}
+
+static void test_percpu_hash_cpu_flag_create(void)
+{
+	test_percpu_map_cpu_flag_create(BPF_MAP_TYPE_PERCPU_HASH, 0);
+}
+
+static void test_percpu_hash_cpu_flag_create_malloc(void)
+{
+	test_percpu_map_cpu_flag_create(BPF_MAP_TYPE_PERCPU_HASH, BPF_F_NO_PREALLOC);
+}
+
+static void test_lru_percpu_hash_cpu_flag_create(void)
+{
+	/* lru without prealloc is -ENOTSUPP, so there is no malloc variant. */
+	test_percpu_map_cpu_flag_create(BPF_MAP_TYPE_LRU_PERCPU_HASH, 0);
+}
+
 static void test_percpu_cgroup_storage_cpu_flag(void)
 {
 	struct percpu_alloc_array *skel = NULL;
@@ -454,6 +522,12 @@ void test_percpu_alloc(void)
 		test_percpu_hash_cpu_flag();
 	if (test__start_subtest("cpu_flag_lru_percpu_hash"))
 		test_lru_percpu_hash_cpu_flag();
+	if (test__start_subtest("cpu_flag_create_percpu_hash"))
+		test_percpu_hash_cpu_flag_create();
+	if (test__start_subtest("cpu_flag_create_percpu_hash_malloc"))
+		test_percpu_hash_cpu_flag_create_malloc();
+	if (test__start_subtest("cpu_flag_create_lru_percpu_hash"))
+		test_lru_percpu_hash_cpu_flag_create();
 	if (test__start_subtest("cpu_flag_percpu_cgroup_storage"))
 		test_percpu_cgroup_storage_cpu_flag();
 	if (test__start_subtest("cpu_flag_array"))
-- 
2.53.0

