Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608088;
	b=SABq/9gRSIIP99UQeRytDiih/M4ha0oGSyXQf8Kthsrk3PBN49h18vt6xRVhFmIEKtk+
	 iCvlavkiump+xTc7170fIyErUlSQvg2uM3kmexeqAu1wn38xnmqPnz65y7piCUr3ClMbw
	 ur28h1pM0n3bXbFKS5pCApRE0pQM8RmYReF/7YubqmMWV6eRdY8pWuBxjB1KeGFiRfR5w
	 9FnAjvb+udP2IHNsvOL1RHlDfGV7ovNFhvATZ/hKQxYbqqER2bdrf2ibxtYNIH/JlHHuG
	 TUg8V3T/xvjff/8ToxsK9UVMPwJI3ooaZEuQGjsFkT7/ADJnhdblhJ6XsB51Pamz4kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ggQ4FFC8Bi0XuOsjCC8PKsr9I1n0o4RHBwZ93v/svPs=;
	b=vnzxNpjSiXBtb6JorafpzUZQOJH/PvdPlq8L6bnlKjD0FT30nIbC2X5TSGVOyR6LCz4g
	 ESt8uZHqxcxJAaFORNcvSSDvXIoWc0KIRYaZJtwrvr8asJsMSaKmr0Xz5rh34wJIeX62M
	 hCOlIWHBFqHA8Era2tqtfGyUaFBPuRLZn8sCggbSqL86oZz+pZyyIUam3STfEGmz4dukp
	 c+fP0trwuVmvn53Mf9drTdtZ11AQCcDCiA398gXqm1wmW1fipHMEB7aM9K1VK+HQjWbxQ
	 nA+tDvDOrVo5q3zc7x9yWETXxstjnjaMqmw0zZOhMiJPml2rgiXQ+HscAWNMAuOdUYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="F0h/yyOj";
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3656160A5BD4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3656160A5BD4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=F0h/yyOj
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b25d977b91so1235581c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608087; x=1795212887; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggQ4FFC8Bi0XuOsjCC8PKsr9I1n0o4RHBwZ93v/svPs=;
        b=F0h/yyOjK9Z89u9J7XgnC5+HYvJukeUSvtRdGdXRYSd6FxItb0m1DCbjnB/F8XGPiH
         u0Mx0HpIawZ/cpcc/qnj3KgRo6EAPV6vOXXLFYrKpg11VGzUbKeGpr+4CsbKgKd2Ax9v
         +1zrwsDOILL2dwtp+1vvlgb337Ta7aiDugkCNuzIGsYnXD5XDmv5t4wuwiCajtILk88n
         LNrHiI4lH+GNFBraZ8z0cwAcBVqjXaoqhujdEUYZisLVg2gj7H76h8O6jAixSP+D0tvv
         W+59YnqWcvMgH6qBfwQxFVFP3Epi+pArc1N0NAkUQSfQ64jH56UgbBzEPYYpE6uwDJii
         ASLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608087; x=1795212887;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggQ4FFC8Bi0XuOsjCC8PKsr9I1n0o4RHBwZ93v/svPs=;
        b=vKdQdWQ73FqNWaf5A7JNqn+ZWazkXphgUbQvh36p+DFS9MAcDn7aKYwBZAj4MGbWRr
         uR3F2nu8XbD9CKO++a+Wj90L6EMdavVjJ+BCmWIg3av+W9OwBtzw33qVOIodjCJVJ4uk
         OEovu+53hWXUkJ0S+LBbOYa7/UV90XeHRqJEzfjZOfi+KU6g4AYnW+KljjGRkvCdXJ13
         8yBfuGyWLpkWNX4n6QKVaXIyuFDSNq7Wfmh/99n/nyJHN+kC9ZsMLtzBYL5YR3649+n6
         9axE54d5PfictYV4oqJKwHOM8WxI9P7Ex8s6ZlSCYb+fwKrl1knXFbXevyp+y2O87rxG
         cSTA==
X-Forwarded-Encrypted: i=1; AL+hErHwH5Lk9qzNNKCCIB9c2WE0HG8B743I4ul0Te0YelRjHr9Y4skBrg68hnXbytjML4PWZ7cY6gqYLKY0J5I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0RLXO8FyxF5u6l3X7k9mqT8u2ti1aEOXfrzArcFMjmbrMamcp
	iYdDKfeRG63Hd01/2LTnr69ZohKKVBS+66e2oUEOM27fBC5eIrJ4gBKbyDXMGln9Q3nFS8hMdKb
	RWI+LPRjII8FSAA==
X-Received: from dlbph19.prod.google.com ([2002:a05:7022:3713:b0:195:8b4e:20b7])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b905:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1b50311e3efmr3121638c88.26.1794608087024;
 Fri, 13 Nov 2026 14:14:47 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:54 -0800
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-20-wusamuel@google.com>
Subject: [PATCH bpf-next v3 9/9] selftests/bpf: Test typeless module ksym resolution
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The module ksym tests use typed ksyms, which libbpf resolves through
BTF. Add a weak typeless module ksym to the ksyms test, to cover the
module path of KALLSYMS_QUERY_BY_NAME.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/testing/selftests/bpf/prog_tests/ksyms.c | 9 +++++++++
 tools/testing/selftests/bpf/progs/test_ksyms.c | 4 ++++
 2 files changed, 13 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/ksyms.c b/tools/testing/selftests/bpf/prog_tests/ksyms.c
index dc7aab532fb1..801d38560473 100644
--- a/tools/testing/selftests/bpf/prog_tests/ksyms.c
+++ b/tools/testing/selftests/bpf/prog_tests/ksyms.c
@@ -11,6 +11,7 @@ void test_ksyms(void)
 	struct test_ksyms *skel;
 	struct test_ksyms__data *data;
 	__u64 link_fops_addr, per_cpu_start_addr;
+	__u64 testmod_ksym_addr = 0;
 	struct stat st;
 	__u64 btf_size;
 	int err;
@@ -27,6 +28,12 @@ void test_ksyms(void)
 	if (!ASSERT_NEQ(err, -ENOENT, "__per_cpu_start: ksym_find"))
 		return;
 
+	if (env.has_testmod &&
+	    !ASSERT_OK(kallsyms_find("bpf_testmod_ksym_percpu",
+				     &testmod_ksym_addr),
+		       "bpf_testmod_ksym_percpu: kallsyms_find"))
+		return;
+
 	if (!ASSERT_OK(stat(btf_path, &st), "stat_btf"))
 		return;
 	btf_size = st.st_size;
@@ -47,6 +54,8 @@ void test_ksyms(void)
 	ASSERT_EQ(data->out__bpf_link_fops1, 0, "bpf_link_fops1");
 	ASSERT_EQ(data->out__btf_size, btf_size, "btf_size");
 	ASSERT_EQ(data->out__per_cpu_start, per_cpu_start_addr, "__per_cpu_start");
+	ASSERT_EQ(data->out__bpf_testmod_ksym_percpu, testmod_ksym_addr,
+		  "bpf_testmod_ksym_percpu");
 
 cleanup:
 	test_ksyms__destroy(skel);
diff --git a/tools/testing/selftests/bpf/progs/test_ksyms.c b/tools/testing/selftests/bpf/progs/test_ksyms.c
index 6c9cbb5a3bdf..0506bb574c4a 100644
--- a/tools/testing/selftests/bpf/progs/test_ksyms.c
+++ b/tools/testing/selftests/bpf/progs/test_ksyms.c
@@ -9,6 +9,7 @@ __u64 out__bpf_link_fops = -1;
 __u64 out__bpf_link_fops1 = -1;
 __u64 out__btf_size = -1;
 __u64 out__per_cpu_start = -1;
+__u64 out__bpf_testmod_ksym_percpu = -1;
 
 extern const void bpf_link_fops __ksym;
 extern const void __start_BTF __ksym;
@@ -16,6 +17,8 @@ extern const void __stop_BTF __ksym;
 extern const void __per_cpu_start __ksym;
 /* non-existing symbol, weak, default to zero */
 extern const void bpf_link_fops1 __ksym __weak;
+/* module symbol, weak, zero if bpf_testmod is not loaded */
+extern const void bpf_testmod_ksym_percpu __ksym __weak;
 
 SEC("raw_tp/sys_enter")
 int handler(const void *ctx)
@@ -25,6 +28,7 @@ int handler(const void *ctx)
 	out__per_cpu_start = (__u64)&__per_cpu_start;
 
 	out__bpf_link_fops1 = (__u64)&bpf_link_fops1;
+	out__bpf_testmod_ksym_percpu = (__u64)&bpf_testmod_ksym_percpu;
 
 	return 0;
 }
-- 
2.56.0.679.gc527c65306-goog

