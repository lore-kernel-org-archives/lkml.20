Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104B6348C6D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792297328; cv=none; b=HOk/ksV+FnR9BKqGd/otdptU1nuHS6kQFQOt0J294EGcFGVLyj4kt7/7Kn5Hgimji/0K9cpaWLHjVZvI4nex8w/PD8NccViBHSVb2RQ1LO7nWSfsYv3LdgZA4l5LYA3DdEzv4X2FvJjcL6kdDALs+qLDlwAXOj+NTeGnCSnVgs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792297328; c=relaxed/simple;
	bh=1WTEq8XDn5lZJt8MvaFJTmJDSDYONR3DmalFi1vhOFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OoJIl5/GEDn8NNhWFzfD3t2dPq3r3leW2zXcTIw6UQIr5WzfE9Pv6EkxFkUdg8UGV7xSg9M8WcXbNLKJE0iuaR3Bo1i/WkQRD8uhfHhOxEjWZEgbDiLseuzaQrAN1PveZnOM+KND7oakhNz7vR0edaJZTOXFmh9OHV9bwyyEpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuKihxCf; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuKihxCf"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-3ac845e7231so307052a91.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 21:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792297326; x=1792902126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LDrqDBR4YF4jx3Glhm4GDi471ougI+ZECXiqokwPJY=;
        b=SuKihxCfIQywq/PsnV6gU89D3HYuor5UMMAtaA+jInzLuzx6/ybmlt/dMhVYJRN51i
         kzbDmFFEbepi9+eNRZrOdXoPeA3djbWgVGJPwtTHE5k9jgPNLKOtfcqFIGiSVwg1SFFq
         EKzSn/ZO4J9oAtHugTd2yJFt2FT7dznZSb9DoPOEsh8UsWOEbdQcldSv1o2ZR31Oo/em
         jIMoO8s8RCEIOEayCEnFYqNpIxSGWMrGtQqLlx+Y1d57VFX8oGBHvbxGPuDeIwe/iEaf
         0P3E6ieLIFHQq8PKAQR1Bjj0KEnFSTLBnqapyCcK25DYrcigvTi3OwMZypXaO+h6NfXc
         FMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792297326; x=1792902126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LDrqDBR4YF4jx3Glhm4GDi471ougI+ZECXiqokwPJY=;
        b=zG2qNzS8M4Mvs5BKjWZP6cDTerXfeLybC7yjQYy9GHolJtZfDfAjBtKagXkAmfPR4S
         PU8auz0/JPgdvYJIrfkYr4P4To8VqfhPpBVyIxCxbQXDKr5DZWMb8/LyzLM0a5XV9F/R
         TrtbFPXViJB3Cw6gZPiAObHcxvCgy6DeoA7Gz+FRShZQm07FuijimbxQ7YL1sFvICbFw
         IKGLPvZhcDJNFPvIihPKENGzredBNReLqEeNIVJf040Bp/QsYpm6y/MvOSpjXgC9UW2j
         nFA5RKQdWGHEbRyVth5WXBzY8JbL3l7ppuluYTOjCG1ovCnCWEGCrf502FjecEkHx2jH
         1qxw==
X-Forwarded-Encrypted: i=1; AKwUvBxs/rDEmvKvH3G6AS0efYrPZC0Iv5GY5OHOK0rUBnZLcG0xAgCNqF9und2ux9maYUec/FPHpRO6NfOvTvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYItkGac0xGU0aPJ5zWBz9qUJyZvBXhNpuHHRSp7cp4jpReQfo7X
	VYX5UT3m0Qugd8ZbtwuEM3eRVURuDJ5VqnO9sTf8SdJg3DE3vTSxM2GX
X-Gm-Gg: AYBFou36s8heapLmGuVeZfMGEsQE5MStKt3QzA8ifrL1maxEVlKMZBBcOut1kJUEIwg
	F/3nFL7s4YQcfgmwN+lIcdlgiBP8mHqE5n9WXzRkyBPAWiIOgk90wYQIGbVcH3wYU9VA8J6Ysgu
	k/+jK5jPCgwzJ8hKZyWMcd8PKO5jpxaDUhGHAM2mb5vUqtj1GawD6lPwQvW7GXdafJpgej+yG9X
	VB2Jxr4nKaT4vvH7iwmGvssLUv8HSgUWJGuMPS/7LnABVJU1VZKKINlK0w9yHn9advBznkCxliH
	qSWPbt/ZGeyJOu/Tj1OAs4puw0zSJV2yLOoLeymGaChGJ7XOn0PBi1RBeEkhbFq6OYjt4ABMiML
	bk5iIK0BInnyP+73/A8x/nrxaT1f6vhcXWrLN5UNOvVUDnR7s+tCCsS+ppg6Mv8fKf/otMFFKmX
	aa09N5gds91va4HcZ7j8NUQcEnee/GpKCDvPlx9J2yICqMfo7YUUj0vE7asUhLeI7niLIo8lla
X-Received: by 2002:a17:90b:2d86:b0:3ab:33b6:2c27 with SMTP id 98e67ed59e1d1-3aceefbf369mr3429642a91.23.1792297326333;
        Sat, 17 Oct 2026 21:22:06 -0700 (PDT)
Received: from [127.0.1.1] ([123.109.188.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e8758efsm24799195ad.55.2026.10.17.21.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:22:05 -0700 (PDT)
From: Woojin Ji <random6.xyz@gmail.com>
Date: Sun, 18 Oct 2026 13:21:42 +0900
Subject: [PATCH bpf v2 2/2] selftests/bpf: Test out-of-range index bits in
 bpf_get_func_arg()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-get-func-arg-v2-2-048848b3eddf@gmail.com>
References: <20261018-get-func-arg-v2-0-048848b3eddf@gmail.com>
In-Reply-To: <20261018-get-func-arg-v2-0-048848b3eddf@gmail.com>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Woojin Ji <random6.xyz@gmail.com>
X-Mailer: b4 0.14.2

The inlined expansion of bpf_get_func_arg() bounds-checks only the low 32
bits of the index, so a helper prototype that keeps the upper bits of the
index is needed to reach it.

Add check_wide_index() and call it from the fexit and tp_btf tests. It
drives the helper with indices that have upper bits set and with indices
whose low 32 bits are out of range, and it checks that the destination is
left untouched when the helper reports -EINVAL. Without the previous patch
the wide index is shifted as 64-bit and the load uses an address far
outside the context.

Acked-by: Jiri Olsa <jolsa@kernel.org>
Assisted-by: LLM
Signed-off-by: Woojin Ji <random6.xyz@gmail.com>
---
 .../selftests/bpf/progs/get_func_args_test.c       | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/get_func_args_test.c b/tools/testing/selftests/bpf/progs/get_func_args_test.c
index 1bf47f64d0967a3543739841201b58b14b4036a7..9b0beb58d88d5bcf1a36a0598695fd02a2cebbcf 100644
--- a/tools/testing/selftests/bpf/progs/get_func_args_test.c
+++ b/tools/testing/selftests/bpf/progs/get_func_args_test.c
@@ -6,6 +6,40 @@
 
 char _license[] SEC("license") = "GPL";
 
+/* Keep the upper index bits: the inlined expansion must truncate them. */
+static long (*bpf_get_func_arg_wide)(void *ctx, __u64 n, __u64 *value) =
+	(void *)BPF_FUNC_get_func_arg;
+
+/* Both traced functions are called with arguments 2 and 3. */
+static __always_inline int check_wide_index(void *ctx)
+{
+	__u64 a = 0, z = 0xdeadbeefdeadbeefULL;
+	__s64 err;
+	int ok = 1;
+
+	/* The index is truncated to u32, so these select arguments 0 and 1. */
+	err = bpf_get_func_arg_wide(ctx, 1ULL << 32, &a);
+	ok &= err == 0 && ((int)a == 2);
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 32) | 1, &a);
+	ok &= err == 0 && a == 3;
+	err = bpf_get_func_arg_wide(ctx, 1ULL << 59, &a);
+	ok &= err == 0 && ((int)a == 2);
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 59) | 1, &a);
+	ok &= err == 0 && a == 3;
+
+	/* Out of range: -EINVAL and no store into the destination. */
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 32) | 2, &z);
+	ok &= err == -EINVAL && z == 0xdeadbeefdeadbeefULL;
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 32) | 0xffffffffULL, &z);
+	ok &= err == -EINVAL && z == 0xdeadbeefdeadbeefULL;
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 59) | 2, &z);
+	ok &= err == -EINVAL && z == 0xdeadbeefdeadbeefULL;
+	err = bpf_get_func_arg_wide(ctx, (1ULL << 59) | 0xffffffffULL, &z);
+	ok &= err == -EINVAL && z == 0xdeadbeefdeadbeefULL;
+
+	return ok;
+}
+
 __u64 test1_result = 0;
 SEC("fentry/bpf_fentry_test1")
 int BPF_PROG(test1)
@@ -63,6 +97,7 @@ int BPF_PROG(test2)
 	/* return value */
 	err = bpf_get_func_ret(ctx, &ret);
 	test2_result &= err == 0 && ret == 5;
+	test2_result &= check_wide_index(ctx);
 	return 0;
 }
 
@@ -162,6 +197,7 @@ int BPF_PROG(tp_test2)
 	/* not valid argument */
 	err = bpf_get_func_arg(ctx, 2, &z);
 	test6_result &= err == -EINVAL;
+	test6_result &= check_wide_index(ctx);
 
 	return 0;
 }

-- 
2.47.3

