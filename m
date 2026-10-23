Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714663;
	b=UT/Eyd6/7vGVzRE2Cx4B+jILpeZXf/x872fIlOUnw4FHYQP4errerzWYOn9czzVexYgt
	 fZSBfKF8FmnHPFtPFm/BFCGmUhw/Qfhm3aZ2Juju7lxzQVV4nTVHR4GrzEWfZBRVVL4Ui
	 /IGCgRGwztKVXOTMIPct3KEUKs04+iOb/pWHGj0EUoyqreMzjqtqu8P/vi5+I2xBjAXJP
	 1yZ7J+lnStgVE3v42GpMvlHJVgHq9t+rJTk/pDTcdl2i18zEAXVWssJiReeeiLN8a1A/4
	 40MVnZ+Wn6NIrtJ6k5iAMc7JHVDVPYnzLavrPPNNucj9U4xiZY640aEgWaNwbhMrOHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DqleeFdjbt6KHN7sXzWbOq4/x+wnYCrVXyGZTqdZ4EU=;
	b=gKuQu5UzIbLxP/yZlndxws7h2MAc8QoScahrkzHuxbsswKyFw62uVBTrDMBwAgKRyGh8
	 iEqtKOsuZXVhKQkyWjsSKmuPxwcoaHbmxHpzDow91Wg3AWckD+9mioUJneqAsBBF47j0P
	 QvIK6rL87cqkN1FNC/WOy51+bUk7B/z5vbOCaOi4TXkjPlYaTkjwbVIvReEgZUMF3v4Kv
	 CtO6sxTjApjfNq+GEiVxkRMXt9h2HO1guB0rKIMR1FPMbXKudh3InWa/aJ0Qj1lWMUxv/
	 8IjQ2JALQVNLwqaxMdUo+SIWgHxZNBX4vPzyqAf6Qu3QfN1l8zBwHffinhmOABBygMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mU39zfAw;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB864606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB864606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=mU39zfAw
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso563665eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714662; x=1793319462; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqleeFdjbt6KHN7sXzWbOq4/x+wnYCrVXyGZTqdZ4EU=;
        b=mU39zfAw9jnaX4X+dglnA6VBcIqvTFsVSZq6kyuDhMMBKP6bUIGMsnhaJktzMva418
         R6Tu9nweM6+3+hlpU9VqOvtJ8kNli5d8VZCFC6YERhdUtrX0W87pNy5F+p3bXAkI/Qtg
         /bxlP0HLCbMx2KJOyVLRoSg+vp/PKwTin1e35AkrC/g0rZIA0x1xM9C1JHNdybJUxfn0
         dgV3IkDl7P6/PfClFz2YVLBdDscq/u5Vlnil9vqZejdZk72p9ZFPryPCkSG67ddb1MAb
         5RUXZbhNAk4wlFohKXQgo0HYzn3KF8M9b3S+R49/GQ+IEMz/ukh9DtXhpuTIqusLjuHA
         zXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714662; x=1793319462;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DqleeFdjbt6KHN7sXzWbOq4/x+wnYCrVXyGZTqdZ4EU=;
        b=F05wSolf1YKnA87Rp0j8jLAjFrjlC30MMaVoD4QmGrW1ZW41YyybIzIhd21LZ4tYyl
         e9nMz9MH8K6kwFEkDfoF7O2cgFv7CXT1RRRXzTnvh9WVP3vivASD0Qvm36YvjSyoXkPB
         uBlGlAo4XQWxJQeT/8gMjwt/7tv+DDHlYeSrZkU/mC0N/6hQ4WATjbeQp6rWVSgahMbc
         FMi8cPs2AjS9tqBTU5RsOqa06ZTJ/k2R6aHmCAeBCrG9BK17Yj9vc2qXrtEV/oW5lR4z
         6DtpcDEDF/vAY+wMM7nIMvpGlPUJcQC8CEfF680tkFN5C4fL6AZd0lsebvrPW2pM8zHc
         qi9w==
X-Forwarded-Encrypted: i=1; AKwUvBybIqsjcyy7xoXjbCTywErm1SLE3oTQHfU7uDdUFwlJJwX2EdLmZqUb2sKY+/q07dyw1F3iDMYoajfkfPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp+wJC9pluhi6wk+2kmEoL2HCykiprDv0GZbwfeA0/+wzCBDtb
	jzL5tqqvlogch5GESI0v73pEEeqjBvO7rUc+0JLNm9PQmujJOehyOMQ9U8clcwlKCDbbEA3AhzU
	RklPaZqxFn5Devg==
X-Received: from dycam14.prod.google.com ([2002:a05:7300:fc0e:b0:369:739:9a00])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:1c93:b0:366:703c:5ef8 with SMTP id 5a478bee46e88-369d9731914mr883157eec.7.1792714661530;
 Thu, 22 Oct 2026 17:17:41 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:06 -0700
In-Reply-To: <20261023001603.560210-8-wusamuel@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023001603.560210-13-wusamuel@google.com>
Subject: [PATCH bpf-next v2 5/6] selftests/bpf: Test typeless module ksym resolution
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Typeless module ksyms are resolved through kallsyms, but the existing
module ksym tests (ksyms_module, ksym_race) only use typed ksyms, which
are resolved through BTF. With KALLSYMS_QUERY, libbpf resolves module
symbols through the module lookup path of the ioctl.

Add a weak typeless extern for bpf_testmod_ksym_percpu to the ksyms test
and check that its address matches /proc/kallsyms when bpf_testmod is
loaded.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/testing/selftests/bpf/prog_tests/ksyms.c | 7 +++++++
 tools/testing/selftests/bpf/progs/test_ksyms.c | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/ksyms.c b/tools/testing/selftests/bpf/prog_tests/ksyms.c
index dc7aab532fb1..62760284f746 100644
--- a/tools/testing/selftests/bpf/prog_tests/ksyms.c
+++ b/tools/testing/selftests/bpf/prog_tests/ksyms.c
@@ -11,6 +11,7 @@ void test_ksyms(void)
 	struct test_ksyms *skel;
 	struct test_ksyms__data *data;
 	__u64 link_fops_addr, per_cpu_start_addr;
+	__u64 testmod_ksym_addr;
 	struct stat st;
 	__u64 btf_size;
 	int err;
@@ -48,6 +49,12 @@ void test_ksyms(void)
 	ASSERT_EQ(data->out__btf_size, btf_size, "btf_size");
 	ASSERT_EQ(data->out__per_cpu_start, per_cpu_start_addr, "__per_cpu_start");
 
+	if (env.has_testmod &&
+	    ASSERT_OK(kallsyms_find("bpf_testmod_ksym_percpu", &testmod_ksym_addr),
+		      "bpf_testmod_ksym_percpu: kallsyms_find"))
+		ASSERT_EQ(data->out__bpf_testmod_ksym, testmod_ksym_addr,
+			  "bpf_testmod_ksym_percpu");
+
 cleanup:
 	test_ksyms__destroy(skel);
 }
diff --git a/tools/testing/selftests/bpf/progs/test_ksyms.c b/tools/testing/selftests/bpf/progs/test_ksyms.c
index 6c9cbb5a3bdf..69309f2a2d0a 100644
--- a/tools/testing/selftests/bpf/progs/test_ksyms.c
+++ b/tools/testing/selftests/bpf/progs/test_ksyms.c
@@ -9,6 +9,7 @@ __u64 out__bpf_link_fops = -1;
 __u64 out__bpf_link_fops1 = -1;
 __u64 out__btf_size = -1;
 __u64 out__per_cpu_start = -1;
+__u64 out__bpf_testmod_ksym = -1;
 
 extern const void bpf_link_fops __ksym;
 extern const void __start_BTF __ksym;
@@ -16,6 +17,7 @@ extern const void __stop_BTF __ksym;
 extern const void __per_cpu_start __ksym;
 /* non-existing symbol, weak, default to zero */
 extern const void bpf_link_fops1 __ksym __weak;
+extern const void bpf_testmod_ksym_percpu __ksym __weak;
 
 SEC("raw_tp/sys_enter")
 int handler(const void *ctx)
@@ -25,6 +27,7 @@ int handler(const void *ctx)
 	out__per_cpu_start = (__u64)&__per_cpu_start;
 
 	out__bpf_link_fops1 = (__u64)&bpf_link_fops1;
+	out__bpf_testmod_ksym = (__u64)&bpf_testmod_ksym_percpu;
 
 	return 0;
 }
-- 
2.56.0.257.gf7497c7d27-goog

