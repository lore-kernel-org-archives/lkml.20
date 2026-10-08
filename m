Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4DE3AE1BC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791476018; cv=none; b=JCWDP4+DtBuVlOtmYAwVqQUhwyO/DNNY1jUJETYmjwnFF4cP7Bg61y7mSJMKvUjF1JwXGBZ/A7tgITi6olMWr0vRSrWZfvUNc08z2tRDrnc5O8ymMsScHYnRtQ9vqcTdq4CusGO50jXLE4USTnwj/Rt+8DhOX0SVZXTwawhwkaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791476018; c=relaxed/simple;
	bh=ctjqrT0ClDhJ4kwgUJDSm0RQ29Lw8YZNFjREtaOVINs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dPLSHmuL2Wi0mVnCfjdPRhFNUi34HBRo4KGr8b6oU9/YswmVUM4HVZmTWofLkEvFJC2wLwXH1mBYX63wujW+7BssyAMdN3Ykb9Q2q7lr+0gg75Ke6t0y3bm6UxpRtjknL3r/2JXTgpfO160QTaEUEVeEXICLmojMWdyMXx6T/7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkXuoTl4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkXuoTl4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso2180129f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791476011; x=1792080811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnRbsO40pgOKFThX66ioZGni0tsr5d/QoIBkjkvb+Kg=;
        b=bkXuoTl4eWiSXjN2RrMA6Ib+g470o74VfdAjkePD6r5kBQO7kLhHy3biGpxsZ+X7JT
         8SuKLeUF/IIaS31Em75cRDNMQ7CrYEuFp3/sbMZYjuDiC/kkvoD7iPZZMRInqlUDB7/2
         Ow0wN+2qj63VMY+88d6jFl078TDdA/Svc2CWs0xRNczLwhiszHOxcnKb/lNvlG2dCiHL
         VrzVnQoROGvGabw1QgbROCdob5Qu8Kqa7oN69Wm3KSleTtH/07AuBWXr8NTBKMSXfjXT
         dIdwJq6mGY3Ypj9hAVan+9ydVZiiLeVq4N1Lep/lXd9Ujsc9Ydr6B4TJNpY3M8GsGovx
         m9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791476011; x=1792080811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnRbsO40pgOKFThX66ioZGni0tsr5d/QoIBkjkvb+Kg=;
        b=FQI9IvFWL3NGT5epWX4BiFU+uajsFxx2h97/WWrIIVOIvE5KjZ7muyQhEMTE85XPNO
         yPVhLxaz3GvfiOZTOWIkOKfhCJg3Y/EgeLiRDpLK8CfmG9xz0ssSOBEsFbxGpgrVLvVO
         BINgjW7T6HSAyZYvU1HUBxMosxB3OkdTRwBMXQ1ypGcVln2YRxmw6XMrFVGPXRhQtgH+
         0GikNnGj4O3QjqphQylKb4cijRHdrkuV0Pw0cNevopS2+YmfIK/wPdS9N5NNXMAKonkr
         U962lrp6Ed+cdJ4iNYMgFdn+B5RoLVrH/O84j4A/UM+XbZZ/XB+KXZAVNIoUAlfaNY+x
         64DQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNMlmmgYy47Pb1rVIH7cCEwkjFRhGdVuD+x0QgR+T6IL/0woSMLIo0H9YVWRFamQQmlnNCkguJHNIazLs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0Qe6qPpv5bzlGuXuMlRjAM3dCjH+7gif1nqrGBcMHOJXFzx2m
	uuscEB3zXRMIfDZm6xPlpbBwbi0mMOp6gH1k5QeWxzKHyqZff9awYig+
X-Gm-Gg: AYBFou0IFU5sv5NIZ6MBBo9Z/R5IALCi0QCYVO32bAUO2OgYO/2ma4eRmGMhP6Zkee1
	oFxddf80Cl/LGeCCKM1pa3hwpXkiYRfP7u68yHd+wpJfKD7OPH1Syts4cRkaxaDXOSqFd3i/f4k
	S+N3lapDZBRqoDT4BfD5LI8vJdkdhDlzHdCjiJc2QGaHzUs88QCBzarpBLcXrRSbqCXwa9gl/aj
	nwAmeUXIeF4ICEjel2kp//JKHdSHQS6imObEunUF7oYnZ/2eiHZQVj48ThqZUnLiE4pDOK9mP/+
	poEfis/wyQEupmJTJk4jpuf3pgD+LguiIYvo6f8r/mxD4bvWuh1s0D0lmsOuXArAYZ5iOyq2seC
	qoY3vQOwLx8ILVWpreI8l6DyW6lymLslbqHrp2bZedk8FIM2603Euhn1ZIBw7tbpekvyWUj0e/d
	NbE5Ge3Kf5YFze6YKpC1fTB9J6rTR2IymAcZmix3WrxNLHw9ijdKqfFwLOy8P4tmOlaySgFlWUV
	VMiJod50UtYND61fYRPQX9Yyr+ZAnVgxH/11w==
X-Received: by 2002:a5d:64c8:0:b0:48a:f52d:ca47 with SMTP id ffacd0b85a97d-48c72785207mr12533471f8f.22.1791476011230;
        Thu, 08 Oct 2026 09:13:31 -0700 (PDT)
Received: from MacBookAir.home.tenber.ge ([2a00:6020:a725:dc00:95bf:d5d1:d7d8:747f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db63401desm448005f8f.0.2026.10.08.09.13.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 09:13:29 -0700 (PDT)
From: Jan-Gerd Tenberge <janten@gmail.com>
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
	john.fastabend@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jakub@cloudflare.com,
	jiayuan.chen@linux.dev,
	kuniyu@google.com,
	willemb@google.com,
	shuah@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf 2/2] selftests/bpf: Test iterator link target validation
Date: Thu,  8 Oct 2026 18:13:09 +0200
Message-ID: <20261008161309.8179-3-janten@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008161309.8179-1-janten@gmail.com>
References: <20261008161309.8179-1-janten@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exercise target-dependent iterator checks during BPF_LINK_UPDATE.
Verify that updates to a program with an oversized array or socket-storage
value access are rejected, as is an update to a sleepable program on a
non-reschedulable hash iterator.

Run each original program after the rejected update to ensure that it
remains attached. Also verify that a compatible array iterator update
succeeds.

Assisted-by: LLM
Signed-off-by: Jan-Gerd Tenberge <janten@gmail.com>
---
 .../selftests/bpf/prog_tests/bpf_iter.c       | 34 +++++++++++++++++--
 .../bpf/progs/bpf_iter_bpf_array_map.c        | 17 ++++++++++
 2 files changed, 49 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_iter.c b/tools/testing/selftests/bpf/prog_tests/bpf_iter.c
index c69080ca14f5..3ae5203d3fac 100644
--- a/tools/testing/selftests/bpf/prog_tests/bpf_iter.c
+++ b/tools/testing/selftests/bpf/prog_tests/bpf_iter.c
@@ -897,14 +897,22 @@ static void test_bpf_hash_map(void)
 	/* Sleepable program is prohibited for hash map iterator */
 	linfo.map.map_fd = map_fd;
 	link = bpf_program__attach_iter(skel->progs.sleepable_dummy_dump, &opts);
-	if (!ASSERT_ERR_PTR(link, "attach_sleepable_prog_to_iter"))
+	err = libbpf_get_error(link);
+	if (!ASSERT_EQ(err, -EINVAL, "attach_sleepable_prog_to_iter")) {
+		if (!err)
+			bpf_link__destroy(link);
 		goto out;
+	}
 
 	linfo.map.map_fd = map_fd;
 	link = bpf_program__attach_iter(skel->progs.dump_bpf_hash_map, &opts);
 	if (!ASSERT_OK_PTR(link, "attach_iter"))
 		goto out;
 
+	err = bpf_link__update_program(link, skel->progs.sleepable_dummy_dump);
+	if (!ASSERT_EQ(err, -EINVAL, "update_sleepable_prog"))
+		goto free_link;
+
 	iter_fd = bpf_iter_create(bpf_link__fd(link));
 	if (!ASSERT_GE(iter_fd, 0, "create_iter"))
 		goto free_link;
@@ -1023,7 +1031,7 @@ static void test_bpf_array_map(void)
 	int err, i, map_fd, hash_fd, iter_fd;
 	struct bpf_iter_bpf_array_map *skel;
 	union bpf_iter_link_info linfo;
-	struct bpf_link *link;
+	struct bpf_link *link, *bad_link;
 	char buf[64] = {};
 	int len, start;
 
@@ -1049,10 +1057,24 @@ static void test_bpf_array_map(void)
 	linfo.map.map_fd = map_fd;
 	opts.link_info = &linfo;
 	opts.link_info_len = sizeof(linfo);
+	bad_link = bpf_program__attach_iter(skel->progs.oob_write_bpf_array_map,
+					    &opts);
+	err = libbpf_get_error(bad_link);
+	if (!ASSERT_EQ(err, -EACCES, "attach_oob_write_iter")) {
+		if (!err)
+			bpf_link__destroy(bad_link);
+		goto out;
+	}
+
 	link = bpf_program__attach_iter(skel->progs.dump_bpf_array_map, &opts);
 	if (!ASSERT_OK_PTR(link, "attach_iter"))
 		goto out;
 
+	err = bpf_link__update_program(link, skel->progs.oob_write_bpf_array_map);
+	if (!ASSERT_EQ(err, -EACCES, "update_oob_write_iter"))
+		goto free_link;
+
+	/* The rejected update must leave dump_bpf_array_map attached. */
 	iter_fd = bpf_iter_create(bpf_link__fd(link));
 	if (!ASSERT_GE(iter_fd, 0, "create_iter"))
 		goto free_link;
@@ -1092,6 +1114,9 @@ static void test_bpf_array_map(void)
 			goto close_iter;
 	}
 
+	err = bpf_link__update_program(link, skel->progs.noop_bpf_array_map);
+	ASSERT_OK(err, "update_valid_iter");
+
 close_iter:
 	close(iter_fd);
 free_link:
@@ -1363,6 +1388,11 @@ static void test_bpf_sk_storage_map(void)
 	if (!ASSERT_OK_PTR(link, "attach_iter"))
 		goto out;
 
+	err = bpf_link__update_program(link,
+				       skel->progs.oob_write_bpf_sk_storage_map);
+	if (!ASSERT_EQ(err, -EACCES, "update_oob_write_iter"))
+		goto free_link;
+
 	iter_fd = bpf_iter_create(bpf_link__fd(link));
 	if (!ASSERT_GE(iter_fd, 0, "create_iter"))
 		goto free_link;
diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_bpf_array_map.c b/tools/testing/selftests/bpf/progs/bpf_iter_bpf_array_map.c
index 19710cc0f250..beb1b714f120 100644
--- a/tools/testing/selftests/bpf/progs/bpf_iter_bpf_array_map.c
+++ b/tools/testing/selftests/bpf/progs/bpf_iter_bpf_array_map.c
@@ -51,3 +51,20 @@ int dump_bpf_array_map(struct bpf_iter__bpf_map_elem *ctx)
 	*val = *key;
 	return 0;
 }
+
+SEC("iter/bpf_map_elem")
+int noop_bpf_array_map(struct bpf_iter__bpf_map_elem *ctx)
+{
+	return 0;
+}
+
+SEC("iter/bpf_map_elem")
+int oob_write_bpf_array_map(struct bpf_iter__bpf_map_elem *ctx)
+{
+	__u64 *val = ctx->value;
+
+	if (val)
+		val[1] = 0;
+
+	return 0;
+}
-- 
2.54.0 (Apple Git-157)

