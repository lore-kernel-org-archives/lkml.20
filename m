Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D154A49BC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468225; cv=none; b=fujPGSoEKcj2byQjvUP6CtB1w1kX618Ka/5fRqtD+pWTHh/uv02vevcwAVW2SzZcNiHMvBG7uxIhXqKWQ7vWPlcDkp72Djo+zvn0RrJ0924hbduPT7MHSdiuE4w9+Th6Nf1ve/jKMpX1Uv1JR+2GLM0ejNWYBVDUVkZuL6TeoGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468225; c=relaxed/simple;
	bh=fcWuRniJfG7FnytnGHSYxDYw7CnJkICYhX9CMJMB5qc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qQXjz7IAghqX31p9yw0FQzmLP8PMq/b1uLtI6fGTWWcxLDCvhzUMQ5I3he/A2VIEFHXu3DxDG8QRWmv5G7/0WNNNb8eduTYPHdjwsD1E+3xJIQl+qoyUFnypBuZ4BZn0NOw6qonpgV3PR0sdrzQb93GE/5LmzdR5adk2XP2xE80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuCBYZ2K; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuCBYZ2K"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so4508081c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791468224; x=1792073024; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M7uL3tEOiQiCctgTllbxUo4F81ApoTm3jkH2XRM5kkw=;
        b=AuCBYZ2KVw0bDDaZfrxy9e12nzaxmtWi+V3std8WbtkuhbBVzQIQPV7GlyOEoh1bm4
         hGlyukJR6dunH45KhWmF6LLg7ppogK3I/95bmjiiKwoPikZWZWhXIaXXAC39O+39ixtv
         OdCX6h06hV0B1q6saivzNG5HR5sAxk1fBDF/efZQFDPsdMbTN9NFs2fFgoBwurM5CgbB
         C5Wx0jJSZEg3dWhJYirAL82ZSi6yy+Cp/B7hMfJFNqdaZJUpRje+miqK9uSOvbWlSgLf
         whw7tPVN2+k4NpV7Wyu3Tq74EILk/cTT8aaXiCERBySZ1QwwrY1XDucxTOPo5uLWKreq
         ciNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791468224; x=1792073024;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=M7uL3tEOiQiCctgTllbxUo4F81ApoTm3jkH2XRM5kkw=;
        b=ogsIoooB8mus5SMkQhyGmDj+391ILzl75TU4ejgX/1XmMlpvsTY3cNnp0QBQLGeRpW
         6EpkhVVpTdXWzFhxhxN471bT2ZZgQn4BDgwUBJ1LvyRFKJVDy2ZIOGgzPiUrzaHUcH7q
         0J/C9nuG7RN6epU3L1/sfq68GVHOg5HpEtWN+jG8yCj0UlaQqqRi7KFFRVPhEk6X88+g
         b61Q8yHyA+sewawmCQpxegFFMsVk/6LIEA5Ncny8YtyR6pS6TWDh4/1kMkLRZluwWFgk
         +s+FVLKvilRgmrIbBXd8gVzISmK/mYo9kzmEYyrchfixb0SikUvoQQj0uWXpjrHFxLBl
         8O/g==
X-Forwarded-Encrypted: i=1; AKwUvBzMGSlw9N74cEln/DopZAQQhiAbzKdSiFQst+yUM2nGntPNX62UMW8Hjb8cf6GA0DVaKZioa3oWqZ4hyDA=@vger.kernel.org
X-Gm-Message-State: AFuF++kpmsHywc/QL2WtigF/RMeuJWlCXC2AmOAyZtcDOhV08CPGAXhK
	uqTuHNqJ+Q2jbf8V/6YW8lbsJT0/g8DOk2Zh/rHMmJt0WKsJZITOLxGv
X-Gm-Gg: AYBFou3ueQF1cYcrO8ZxccDNd9g5P2qfSbq7WZpNuPiHQThqrjQLRFjy2yf6Y1jy80y
	tlyUBv0MCqTYg7GTOTT9JYtmUvaUeDW0qZyoArDFMyXh81OhOx/HIY0WJlvQEFaJJIuHvDNky/N
	1pKy2BFBJGMMarHx+PSgGr9Qod2+MeB5myaAMzInu655N5pQ94H7sHmrf2gGXj34YFVlVX2id7A
	unwbphA9I/0sxKLchmMpp44ZpDH4kDTH99coGBSwbqulHiBnb4l0qP8qNFH057zxA+SMq73QJHj
	2+W+0YGJkBz1Losc3Bk5fckqIqQPMp2HGlR1ucYuXLFH6+XRw708pZC01LQN5QB/UgMoLIa/nYq
	/aNJhwx1VczsaCoyhq8MADKjAWGmtqpFjBR/3IzB/DEGfWgY6C/ryhoGf3FnROsgBmNOsYzCJ15
	heNfK2/5fPt1a+0RYtqEQpt6V47Bo5ieUDskEY1AkIW5c+KhsObrdhhUKfK7KapYCROQ==
X-Received: by 2002:a05:701b:42c7:10b0:144:eaa7:2763 with SMTP id a92af1059eb24-16205514412mr6682965c88.16.1791468223270;
        Thu, 08 Oct 2026 07:03:43 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161680e191esm14504872c88.11.2026.10.08.07.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:03:42 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Thu, 08 Oct 2026 22:03:36 +0800
Subject: [PATCH bpf-next] selftests/bpf: Run the enable_stats program with
 BPF_PROG_TEST_RUN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-selftests-bpf-enable-stats-inflight-v1-1-0cb92ee2c6d3@gmail.com>
X-B4-Tracking: v=1; b=H4sIALeix2oC/x2N0QqDMBAEf0XuuQcxgkh/pfQhqXt6EFLJhSKI/
 97o4yzMzkGGojB6dgcV/NT0mxv0j44+a8gLWOfG5J0fe+cmNiSpsGocN2HkEBPYamiDZkm6rJU
 xSxzG4CcnA7WnrUB0vysvurSMvdL7PP8SfJPGfwAAAA==
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

enable_stats attaches its program to sys_enter, so every syscall of the
system runs it. Once the program is detached, the test compares its
run_cnt to the number of runs the program counted itself.

Detaching doesn't wait for the runs already started on other CPUs, and
each of them increments count before run_cnt. With other tests making
syscalls in parallel, the test reads run_cnt one run behind count now
and then:

  test_enable_stats:FAIL:check_run_cnt_valid invalid run_cnt stats

Run the program once with BPF_PROG_TEST_RUN instead of attaching it,
so that nothing else runs it and both counts are final when the test
reads them.

Fixes: 31a9f7fe9337 ("bpf: Add selftest for BPF_ENABLE_STATS")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/enable_stats.c | 9 ++++-----
 tools/testing/selftests/bpf/progs/test_enable_stats.c | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/enable_stats.c b/tools/testing/selftests/bpf/prog_tests/enable_stats.c
index 75f85d0fe74a4..c4c63315e0798 100644
--- a/tools/testing/selftests/bpf/prog_tests/enable_stats.c
+++ b/tools/testing/selftests/bpf/prog_tests/enable_stats.c
@@ -9,6 +9,7 @@ void test_enable_stats(void)
 	struct bpf_prog_info info;
 	__u32 info_len = sizeof(info);
 	int duration = 0;
+	LIBBPF_OPTS(bpf_test_run_opts, topts);
 
 	skel = test_enable_stats__open_and_load();
 	if (CHECK(!skel, "skel_open_and_load", "skeleton open/load failed\n"))
@@ -20,13 +21,11 @@ void test_enable_stats(void)
 		return;
 	}
 
-	err = test_enable_stats__attach(skel);
-	if (CHECK(err, "attach_raw_tp", "err %d\n", err))
+	prog_fd = bpf_program__fd(skel->progs.test_enable_stats);
+	err = bpf_prog_test_run_opts(prog_fd, &topts);
+	if (CHECK(err, "test_run", "err %d\n", err))
 		goto cleanup;
 
-	test_enable_stats__detach(skel);
-
-	prog_fd = bpf_program__fd(skel->progs.test_enable_stats);
 	memset(&info, 0, info_len);
 	err = bpf_prog_get_info_by_fd(prog_fd, &info, &info_len);
 	if (CHECK(err, "get_prog_info",
diff --git a/tools/testing/selftests/bpf/progs/test_enable_stats.c b/tools/testing/selftests/bpf/progs/test_enable_stats.c
index 1705097d01d7b..e28d674fc77ac 100644
--- a/tools/testing/selftests/bpf/progs/test_enable_stats.c
+++ b/tools/testing/selftests/bpf/progs/test_enable_stats.c
@@ -10,7 +10,7 @@ char _license[] SEC("license") = "GPL";
 
 __u64 count = 0;
 
-SEC("raw_tracepoint/sys_enter")
+SEC("raw_tp")
 int test_enable_stats(void *ctx)
 {
 	__sync_fetch_and_add(&count, 1);

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261008-selftests-bpf-enable-stats-inflight-edfb36a280f3

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

