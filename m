Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F7F31E844
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 01:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791510540; cv=none; b=izeVqSm8e9PYgO4M/HzQrm/k6a/TtlW55tsHQJbTYbGLPuUDP2awzv60KtDZ+dRiJahWYHThjDUYeUdOkmujAaGrS9xyaxe100FOrQTeqVRV/35Ww+Kpe+D/FNCCbGaFc3Wc4QnikKQq0fZH/4bThL9fT441+ZSyxMODKNSVruM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791510540; c=relaxed/simple;
	bh=q1A+5bY9JKcAap1X2UpIetoUf5WvQvLMS3llETCRifs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=inSra8VBorv9m0X6RIQS5CzlwUVgPrb2H+IsWNWWcs2jr8ZATj2yeQJjSXZV04IBtuSfKARoFMAl1H6xtW4VZf85gohO0SJa19JjKcFAIe2099XM1tZyqro2gguhX4CGMKhztLi6RZ8W7IzwoHo26+hVl7q55+5whvbHg9aIXoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIZk5ZLC; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIZk5ZLC"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3535a54bed9so1079974eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 18:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791510537; x=1792115337; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FOAUYQsivtnmX6gmnt+M/vxUdyS2XU3fcOO6GL4Vu+I=;
        b=iIZk5ZLCHtxc1El6cXqOMUNkBvunOMsa5tPoRz1nyS2XArqx/i5FWD8jvuFl5IFyZ3
         1iVIWgqn0Hnz/naNugv2AvtT1v1Kl+s+xU98AWHa6Y4OdFPd+hyQkjWhroARDGkZOoWN
         SJaxPSvkOur3fIcnKiTrLqunsT/YE7pAG2NsyiwZosq0BDDpk+Bvu+GIQ109uV8eJaDv
         a+HQ9XtbyfTvHskK45FQ7xRJR5IeqfLdDV0uU1e1YWuTkjUTRPFM7/oh9K8ZuQ0MmPX8
         b1Bwg8yUiYK6oURkwAjvWFdnO2P53GNOj0lB9Q4GzYEGWY+egP6DHitvsFN6CzVNC0k2
         lQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791510537; x=1792115337;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FOAUYQsivtnmX6gmnt+M/vxUdyS2XU3fcOO6GL4Vu+I=;
        b=XwXEhYQOZtOKXoByEmPZH/i6b/zizZKsnwrCQ+wIhp5Z4L7hhL0yTtMsEZIQBSlVaT
         tbBlMWS3f01EA8QZAsKRIMCFZLCqKYf3xUC7Giw+cep0EfsoElPc2ACcQargabHiR3J7
         rxMyO5/6xHyJXqEZ4mSRUtyRzqp1pGmnk51FKE+ab47qFX96c8s37FcMk9RhNGwe3snn
         PQYnS0kZTIJuPuXtv6U6tveezdF++xSELyhuaO0yOrLjQzLEb47ASuqkRdCzSJ/BVu9J
         7q3QUPGfL4+gdpurqxl5Bfh0qYJ0KRbUSbJwYzMoDxNlxz/CwW0wWJ1aQvuUwfuLVfco
         9IFg==
X-Forwarded-Encrypted: i=1; AKwUvByIHSmhqzKJ4phZQXzxbt6hyMmZzNkk54EvRQi/6vHYutnokP81cTgT7J/37ors9Gi/t+RdG+ogo1T0soU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9nshDu3yACSoHGe+dkc6lfV28wUd8BTkHO81/VWYQCr8mDiHI
	FRwOX48CWPxa+JVGyqbzlSz6aIEPQeVJIcCLi8ao2Opr6GJ/+JaVgx3M
X-Gm-Gg: AYBFou17ty2TsWELXXFWb8e/rUKFrnVnsUyUMia2018b82Rex6QnsrOW3Rh856SVH07
	iuNmeEMzPZCcM46Vxbx5dgdFfPY9i4+DzB2MpG6p2uzLzNB1DvFxqA9km4vCzydsmuRLY010e+g
	lcuCYhOAEPli2fsjm0xKPX6+hh/RTKrMcT0ms+4G+Hl523fiIFxO6UcQtKkyEtHSZnqv8BUw85T
	ojWyLx1IocS4qtg8+78335Nl9LU1Yc0PJ4bWUOGbOzPmvQfHPTI2WdRQrB+XWHBxqtDDKTFwR9L
	n19SCw2V/mmPL+ox7NNUJrDHqIXABscRIXpwlrjA0hRJ7/CIZ7OrInka0tKJ1saSEVfMcWhXBUj
	CCBkPXRIo0A2tRi18H/kCHjMkoo4EfELYLxw9HmBsIYiJ/ykzCFf5mTEyvHorzgyX5bj8pdrhqh
	ufPkm3gyqAPMUX3KthUByn/0f7BvVEWmYmTxiszAphYGet0eJCBP1DuVJEZqiLcJSQsw==
X-Received: by 2002:a05:7300:ec8e:b0:351:7e90:6035 with SMTP id 5a478bee46e88-3537ddf9efemr908440eec.4.1791510537009;
        Thu, 08 Oct 2026 18:48:57 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b53dsm1829232eec.6.2026.10.08.18.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 18:48:56 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Fri, 09 Oct 2026 09:48:52 +0800
Subject: [PATCH bpf-next] selftests/bpf: Wait for the struct_ops map to be
 freed in assoc_in_timer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-selftests-bpf-struct-ops-assoc-timer-v1-1-9a97a9b3d1db@gmail.com>
X-B4-Tracking: v=1; b=H4sIAANIyGoC/x2NwQrCMBAFf6Xs2YVtpEL9FfHQxhdd0CRkVymU/
 rvV4xxmZiVDUxidu5UaPmpa8g79oaP4mPIdrLedKUg49SIjG57JYW4818Tm7R2dSzWezEpk1xc
 aD5gljAPiUYT2VG1Iuvw3F/p5GYvTddu+mTqEOYAAAAA=
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, 
 Amery Hung <ameryhung@gmail.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

st_ops_assoc_in_timer_no_uref runs .test_1, which starts a timer to
call it again 500ms later, drops every reference to the struct_ops map,
and expects the timer callback to find no struct_ops associated with
its program anymore.

The association goes away only when the map is freed, which happens in
a work item after an RCU grace period. With other tests running in
parallel, that can take longer than 500ms, and the callback still
reaches the struct_ops and gets MAP_MAGIC instead of -1.

Restart the timer from its callback until the map is gone.

Fixes: 0e841d19263a ("selftests/bpf: Test getting associated struct_ops in timer callback")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c | 4 +++-
 tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c  | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
index 461ded7223515..84da2c8651bec 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_struct_ops_assoc.c
@@ -158,9 +158,11 @@ static void test_st_ops_assoc_in_timer_no_uref(void)
 	 * Run .test_1 by calling kfunc bpf_kfunc_multi_st_ops_test_1_prog_arg() and checks
 	 * the return value. .test_1 will also schedule timer_cb that runs .test_1 again.
 	 * timer_cb will run 500ms after syscall_prog runs, when the user space no longer
-	 * holds a reference to st_ops_map.
+	 * holds a reference to st_ops_map, and every 500ms after that until the map is
+	 * freed.
 	 */
 	skel->bss->timer_ns = 500000000;
+	skel->bss->wait_map_free = 1;
 	err = bpf_prog_test_run_opts(bpf_program__fd(skel->progs.syscall_prog), NULL);
 	ASSERT_OK(err, "bpf_prog_test_run_opts");
 
diff --git a/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c b/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c
index 0bed49e9f2170..9f3124acd9b04 100644
--- a/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c
+++ b/tools/testing/selftests/bpf/progs/struct_ops_assoc_in_timer.c
@@ -25,6 +25,7 @@ int test_err;
 int timer_ns;
 int timer_test_1_ret;
 int timer_cb_run;
+int wait_map_free;
 
 __noinline static int timer_cb(void *map, int *key, struct bpf_timer *timer)
 {
@@ -34,6 +35,12 @@ __noinline static int timer_cb(void *map, int *key, struct bpf_timer *timer)
 	timer_test_1_ret = bpf_kfunc_multi_st_ops_test_1_assoc(&args);
 	recur--;
 
+	/* Try again later until the map is freed */
+	if (wait_map_free && timer_test_1_ret != -1) {
+		bpf_timer_start(timer, timer_ns, 0);
+		return 0;
+	}
+
 	timer_cb_run++;
 
 	return 0;

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-struct-ops-assoc-timer-5eb0295ec300

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

