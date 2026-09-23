Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3493218CC13
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122115; cv=none; b=NU+lcifBYr8zKidFPQMUnp4qUuxJkoR7/dza1gtUOPCA8C7fV3vCYdbqmAmFCerHyP+NbKpfIw1OdKcpQUCjC2iHMK9F+vpEphG4LY1XZretNQGasWXfazvGqEccuPOzLgmTwxIWZeH++afmTR5ytEZc6c5IFAqRG0rtb1k961k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122115; c=relaxed/simple;
	bh=FXOqWk6+ZyNZc5l454FhAHeymScBoMRKHlFW2SXO0lM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eqWqxi9k7lsk+ZKavC+aoqANCwuxB5tTrfpCKCdGYS7AZMg7tWLhqWS7sk5eoH9Il9DjgBPeQ/Zv3FTb1tDYeW7QJsKaJT0kGxvD2QLHTTkPVKtGEwGT8ehLmCv7ZYn2Ty9n405owDhmEmokkFu8sdHM5FtDOPAGelfH/njUm38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRpn16fm; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRpn16fm"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d91ede8035so3155595ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122112; x=1790726912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXRneLdpupGQ5UzSvLNCbz2mrO1OCHoDsNMUHQpwnQo=;
        b=dRpn16fmMpDckJeus7/oLEVwBHFjjTw+OfRGdIJkQSyZIhleUSrAPIZNF/7yNMgjbV
         7jTBInoF/CM6tJrOSJlB2zMcX3N0H3/yYlztuStnMWgRMUQwsI66tomy3KEac4mP0JwJ
         62R4EaqMrj3Vz8B66FlkgOjEmOaEwy1LQ3vH0CJJiNv1v6iAM9oSKoDwyAgUBVUUuF06
         1yw8M7xIETs2lHj68wQUFhtPaZWFwdVSJ6yscWNqIR9euLOoDfe3VGuOYRLcZxiciw26
         QWVDriEjtDqsi+uVsOAwUpowiI5ASaYNq1BEfpmBRrjvPV7/L5m6crTRKYEkftPq9AC7
         ReFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122112; x=1790726912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jXRneLdpupGQ5UzSvLNCbz2mrO1OCHoDsNMUHQpwnQo=;
        b=Ee30oPznKyQz7F0GuQxN66rV/6ZjDbKg1gIcyB01JC96coOFXbRlrloQKg6mrXN8T/
         xGvkJMcEMEeYo3c597SkuQNrmAe5Q+5UXeWS5nkXJOE+DFuTcXdcYDZtTLH921jk9plk
         2YjZrl7TO5wNofyzaSug/kIJB140wEPQd6YUWqDkRiNzgsW9dykz4DFfN9aBOe1WcJcS
         bn4jja8FYmEi70vcL3j0tVgkWfcU5Go6Lfq5Mr35u4pZfM187TsG9G+Z1sBwoCouHLP1
         imzSUQn8ClxB4xxkVvFoijVR/UtIpXaJ+R7cW/4Pf5k1znn1lkmrrpfjZJD/sLfTSJDY
         S6yA==
X-Forwarded-Encrypted: i=1; AKwUvBzJTnFdzRa3Xam6+r2K5YtVEhlfl3GwDqR2gUSCRegImF1JF0NAy60Eq22fmooWESbuQFn79i3rDagghpI=@vger.kernel.org
X-Gm-Message-State: AFuF++lsWioch4PJt4+gi2CajbB0lSPsmO/7cCju97tZuw6PKIjrIDe3
	iikYOw2QRz3kgLTqCDHvY5KT/rABWiXm34kW1AiSqY1RFnUdHvPFFeE=
X-Gm-Gg: AYBFou2HH9aPe6e26xHpIWm0hH53X8rMn22504leLV4cAEdi1D5jIoQR4DJt+2F1355
	PhfeWa1c5oMRTE4OYSymewbUbPhRFsWq2B1kyh3FJAcN550xk1EGe909bugiP58uK4FE/gEuhDb
	4Dp4nlcyLm71c/BGe9gup1ync4/gBbS3zktdhamtK+Salb04h/11odWUrhIBU+yrJy/1kpdZyu+
	iMbAvlOnLhgcqbFIBpUWanWBg46rIvKe/F5B642p7ZJ5IQDfBdwf+GTcFXOUFewLE31qwkXHwM7
	9dAFGEoE1k1p0sTgt0TEelVAKRQTeDiOnztQr1VlpOTgshbX4NffSac+nSLO4Px5kfXCl0NzomO
	CBIQe9P/RC24DChziyzsTmDmokjEwFq+uia/SxPcbwNvplvNDtsPSc4bAxj6iOTBoXpDQm9TkJ3
	qol5Eo5Qx3q3xVPsL9YBde8FrCHRPOUgYTrK5vlK11gAMtk+GNaj8EpsMRpSbnH0p1XSeD+iIJm
	uHw521zTpen9JuQDo7JzuQaTonlB8E5XMsq6+8LeECbfBLY
X-Received: by 2002:a17:902:d484:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2df69d517bdmr9833245ad.14.1790122112335;
        Tue, 22 Sep 2026 17:08:32 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:2466:805a:e198:cde8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3a3dsm2021425ad.43.2026.09.22.17.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 17:08:31 -0700 (PDT)
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
	leon.hwang@linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH bpf v2 2/2] selftests/bpf: Test per-cpu initialization of a BPF_F_CPU created element
Date: Wed, 23 Sep 2026 09:08:01 +0900
Message-ID: <20260923000801.1764758-3-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com>
References: <20260923000801.1764758-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing cpu_flag subtests always prime a key with BPF_F_ALL_CPUS
before any BPF_F_CPU write, so the create path is never covered.

Add a subtest that creates the element with BPF_F_CPU on a map with
max_entries 1, so the key can only reuse the element the previous key
released, and check that the CPUs the update did not name read back
zero.  Run it for PERCPU_HASH preallocated and BPF_F_NO_PREALLOC,
whose per-cpu areas come from different allocators, and for
LRU_PERCPU_HASH.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
v2: skip on a uniprocessor machine instead of failing; the block
comment uses the general kernel style.

 .../selftests/bpf/prog_tests/percpu_alloc.c   | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c b/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c
index a72ae0b29f6e9..f853f97bb882d 100644
--- a/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c
+++ b/tools/testing/selftests/bpf/prog_tests/percpu_alloc.c
@@ -350,6 +350,80 @@ static void test_lru_percpu_hash_cpu_flag(void)
 	test_percpu_map_cpu_flag(BPF_MAP_TYPE_LRU_PERCPU_HASH);
 }
 
+/*
+ * A BPF_F_CPU update that creates an element must zero the value on the other
+ * cpus, rather than leave them holding whatever the recycled element last
+ * contained. max_entries is 1 so the second key can only reuse the element
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
+	if (!ASSERT_GT(nr_cpus, 0, "libbpf_num_possible_cpus"))
+		return;
+
+	if (nr_cpus < 2) {
+		test__skip();
+		return;
+	}
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
+	/* lru without prealloc is -ENOTSUPP, so there is no malloc variant */
+	test_percpu_map_cpu_flag_create(BPF_MAP_TYPE_LRU_PERCPU_HASH, 0);
+}
+
 static void test_percpu_cgroup_storage_cpu_flag(void)
 {
 	struct percpu_alloc_array *skel = NULL;
@@ -454,6 +528,12 @@ void test_percpu_alloc(void)
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

