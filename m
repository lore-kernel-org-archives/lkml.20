Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793658979;
	b=jAoMAPGwre2RErE+ZMc/pJT9MfMo08B00Nb6lQFCUOF98yLez6kDUkDSCgPA36t8/gTE
	 zMrSzSN2g6cXcy9vtu9F1Jn9gIxSWnmuqzcNZJCUeiFc3RpIHWLE93tn2O1e5KRc4DwL4
	 o2dVpJgZZnIMQ9sLqjP/ytmmLEVrOkqK26OT+IBrytsoSTgLu7DikTIZIUuh64BxBJb3O
	 rkwk2r3G/Gh+bEUOelc2IUFGsHdX/A2LE4vq57OytZZ8/zB17EgXWrv12X0riMjJ3/dVJ
	 9DmyQpPdlfRGQdKPftNStrlOw3USNV7n95iU8amrFZmoyXpiS2dbPjzsUx/OHJonHwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793658979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=+2B62P6pygpI8xDXVCsGnEznvKzC8xpzSm47oWeOBg4=;
	b=w1kizTDqrGgdp+GuYZWVuqrwllreZxWKuESGiI+WFVlldUe6JWXtHQoqtm8jBf8lDU4v
	 hHyrc6lSKZURzVQVQ9iKGe3QhPoBI8pVhhwNEhL9B+dlRDwZKxJKHs4zugpaaxHbkEV8Y
	 /fS6UAJUcsnJRlfePgegq8qtOvJShUFlPs06I6Ysre5k6ov8iFMXZeBw3g5Tf1rGjwoC8
	 wYc2ht4p1EhXRGle3UFeG2byAwiM2BYWeh63GctOWhLYMKamjM8AE0q7Tu/77jJ4og+80
	 6hkcHT2Xs2Qwmp3hZT9YjmU/0GUkQa7S2RDYRDLjpR+Rlv7Ko6PkWHkwsJKUGTvW3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRSdtq08;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF5606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55EF5606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRSdtq08
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a052aff9e9so2568863b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793658979; x=1794263779; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+2B62P6pygpI8xDXVCsGnEznvKzC8xpzSm47oWeOBg4=;
        b=PRSdtq08wl5FtZ7YS71F2pJ+fvUKNonuRqIl/3w069O+LydfKKf3y1lbdaULR1O9y4
         Ref/0pdN127yUikWeo1tveFpvSxg3gJV6hhnV7pgUse7yY4f3BxnTSGvSgW9UKVsugFu
         V4t3N9gHX51MYQ3e2qkaG0ai9zUmEckq4VxxtW2ItS+pIbA1aP8kvdqLrCyvjk8csSPL
         KfDs0FO4R0jDEDbcmYBIHPG3BnjfSuq7BQnGTem7bEam2MREX0VaMcLK7pYU4fjyjnHq
         nuHokar16KkJJhXoitdL9rkBIbfqr93oTFjFwTDtugRESc0n9V0OgKK6VwYfjgx3VPXw
         yWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793658979; x=1794263779;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2B62P6pygpI8xDXVCsGnEznvKzC8xpzSm47oWeOBg4=;
        b=QXDg0bwQ0Aa9kv/LfLQKNAMjVK07kaSi2E7GdHkru61txw6kwxXePJFekq8JVTWjch
         ZKSmwSnjj897HuzqZj3TUDHEQm3fZXeNVXihOh24raW5SgQLG49lYAr8C4+j/cb7mEx6
         PE4f8Jv5ToDJrjhwkIhaikCktTvZMfjcNFbxJoI3So20BRVSZzWvZsaA4KbNSwbDAoDY
         Lnm6b62gOpsg4XqS6gGf9FEReU/O4P6ZwVr0dPeSk7GI7dpdTCX6URsBKBEuz/SbTlpM
         MtG2OPPERruFuKgcZrI7ghZfYvRWIfTG7pjGH+YE5HBpfDCZnEzVy2CWJS2Tb18XFQil
         AKLw==
X-Forwarded-Encrypted: i=1; AKwUvBzFovwxSsrc68OVgDTn4ANnFmyv7oE53xR0WD03HT9MKURYK4T0QdWCZgxEM8pUwhgav3ZdbN8OyWeekXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQnkQ24VW7vwvxeTCgJg/y4EjaqDkvcqTReLNfuo81JporkxUd
	9umwfAgKqbf23zuZjLShK0fxk5DcHhfSVGjJVN0HxePHAJTXudOsLDiA
X-Gm-Gg: AYBFou289G7kvymdOGdF0a0DPJntVyRKKDG3jS6j37e0JEbu0MrQIQciVI0YQNWxsny
	J4zoePm1Knp+D4Q1vk/geYWKRiUAYnN43acLWSFKDwvm/0mdVe+rCOrVgrFwjnWLJLABdf1JbtU
	jkJUyLRLEQ51yrgPnUttTWZ2yKx+T3S7Js9sNMgCkpzGDzIH/FddHG4bp9ibAbavplRLO3uuRkK
	bl8tqcH7Qs1CknEv9dWW/0NI7ONv4hPYm00nzIpcvTUgjnpr1W4KhJZDOd9Q8UbPscpjVzVqXve
	Hcdx3sikx/5x80D0vOxIoI3owjNp3RqN8wmD6EUfPz87+GOUaHQBp7jfFZaDeFUKwp/g3OS/6mz
	7gFuGepj+thw9q2033sQYQec9LbIqe38sqFbclOa5Hku2SHd0i3hlkULPdccfye71hE7FEpgGbX
	pt1pO1kULeNq2nbvGcXVbJmZYfk2Crtm/IGVlbwDd1O5iyMK/VQoshocgNPxDMVxZMcwQbJYoFE
	Ltxl7JeUiO7Sp/iwnYsMydLpmeR7u18AdkaIwANjGhsbWsdsjUPKXxSUkq8N8LU0C8CSpvJS3CV
	HdwCqKfTPpTlsKPQonWE4r2L1WMORir9yt2WJkCYozVIsL2nH3RXpuJ9u1eFaf2sxZb3+7m9MgM
	G7EC66gFhS7Y/5BStHRS8Z1HHl+2Vag0oIg==
X-Received: by 2002:a05:6a00:288c:b0:89e:9c7e:fd5e with SMTP id d2e1a72fcca58-8a9bd1facdbmr9633354b3a.9.1793658978321;
        Mon, 02 Nov 2026 14:36:18 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d479dsm2513387b3a.39.2026.11.02.14.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:36:17 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 22:36:17 +0000
Message-Id: <DML31IUICB7B.2FO0J06WCREC8@gmail.com>
Cc: <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <emil@etsalapatis.com>,
 <ihor.solodrai@linux.dev>, <john.fastabend@gmail.com>, <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <jose.marchesi@oracle.com>, <david.faust@oss.qualcomm.com>
Subject: Re: [PATCH bpf-next v3 3/8] selftests/bpf: report SKIP for arena
 tests a compiler cannot build
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Vineet Gupta" <vineet.gupta@linux.dev>, <bpf@vger.kernel.org>
In-Reply-To: <20261102220717.4079739-4-vineet.gupta@linux.dev>
References: <20261102220717.4079739-1-vineet.gupta@linux.dev> <20261102220717.4079739-4-vineet.gupta@linux.dev>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mon, Nov 02, 2026 at 02:07 PM Vineet Gupta <vineet.gupta@linux.dev> wrote:
> Give each guard an #else with a dummy marked __skip(), so the skip gap is
> reported rather than invisible.  Add __skip_without_arena for it, which
> expands to __skip() with a fixed reason when the compiler cannot do arena.

How about the following approach instead...
looks much simpler to me...

pw-bot: cr

diff --git a/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c b/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c
index b5a01cb..16c3dd9 100644
--- a/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c
+++ b/tools/testing/selftests/bpf/progs/arena_kfunc_jit.c
@@ -23,8 +23,6 @@ struct {
 /* volatile to force the scalar reloads below */
 volatile u64 stash;

-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
-
 SEC("syscall")
 __arch_x86_64
 __jited("...")
@@ -93,6 +91,7 @@ __jited("	cbz	w4, L0")
 __jited("	add	x4, x28, w4, uxtw")
 __jited("L0:	{{.*}}")
 __success
+__skip_without_arena
 int arena_arg_jit_args5(void *ctx)
 {
 	u64 __arena *val;
@@ -113,6 +112,4 @@ int arena_arg_jit_args5(void *ctx)
 	return 0;
 }

-#endif /* __BPF_FEATURE_ADDR_SPACE_CAST */
-
 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/bpf_misc.h b/tools/testing/selftests/bpf/progs/bpf_misc.h
index d7f706c..4ec840b 100644
--- a/tools/testing/selftests/bpf/progs/bpf_misc.h
+++ b/tools/testing/selftests/bpf/progs/bpf_misc.h
@@ -116,6 +116,10 @@
  *                   feature the toolchain or JIT cannot provide, so a run does
  *                   not report OK for coverage it never executed.
  *
+ * __skip_without_arena
+ *                   __skip() when the compiler does not support the arena
+ *                   address space, nothing otherwise.
+ *
  * __log_level       Log level to use for the program, numeric value expected.
  *
  * __flag            Adds one flag use for the program, the following values are valid:
@@ -156,6 +160,11 @@
 #define __success		__test_tag("test_expect_success")
 #define __description(desc)	__test_tag("test_description=" desc)
 #define __skip(reason)		__test_tag("test_skip=" reason)
+#ifdef __BPF_FEATURE_ADDR_SPACE_CAST
+#define __skip_without_arena
+#else
+#define __skip_without_arena	__skip("compiler does not support the arena address space")
+#endif
 #define __msg_unpriv(msg)	__test_tag("test_expect_msg_unpriv=" msg)
 #define __not_msg_unpriv(msg)	__test_tag("test_expect_not_msg_unpriv=" msg)
 #define __msg_next_unpriv(msg)	__test_tag("test_expect_msg_next_unpriv=" msg)
diff --git a/tools/testing/selftests/bpf/progs/jit_insns_arena.c b/tools/testing/selftests/bpf/progs/jit_insns_arena.c
index 95736ea..77d135a 100644
--- a/tools/testing/selftests/bpf/progs/jit_insns_arena.c
+++ b/tools/testing/selftests/bpf/progs/jit_insns_arena.c
@@ -106,6 +106,14 @@ int cast_to_user(void *ctx)
 	: "r1", "r2", "r7", "r9");
 	return res != 0;
 }
+#else
+SEC("socket")
+__skip_without_arena
+__success
+int arena_unsupported(void)
+{
+	return 0;
+}
 #endif

 char _license[] SEC("license") = "GPL";
diff --git a/tools/testing/selftests/bpf/progs/verifier_arena_large.c b/tools/testing/selftests/bpf/progs/verifier_arena_large.c
index dbdea14..428b984 100644
--- a/tools/testing/selftests/bpf/progs/verifier_arena_large.c
+++ b/tools/testing/selftests/bpf/progs/verifier_arena_large.c
@@ -181,7 +181,6 @@ int free_reserved(void *ctx)
 	return 0;
 }

-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 #define PAGE_CNT 100
 __u8 __arena * __arena page[PAGE_CNT]; /* occupies the first page */
 __u8 __arena *base;
@@ -220,6 +219,7 @@ __noinline int alloc_pages(int page_cnt, int pages_atonce, bool first_pass,

 SEC("syscall")
 __success __retval(0)
+__skip_without_arena
 int big_alloc2(void *ctx)
 {
 	__u8 __arena *pg;
@@ -290,9 +290,9 @@ int big_alloc2(void *ctx)
 /* Nonsleepable because it binds to a socket program. */
 SEC("socket")
 __success __retval(0)
+__skip_without_arena
 int big_alloc3(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	char __arena *pages;
 	u64 i;
 	int err = 0;
@@ -314,16 +314,14 @@ int big_alloc3(void *ctx)

 	bpf_arena_free_pages(&arena, pages, LARGE_PAGE_CNT);
 	return err;
-#endif
-	return 0;
 }

 /* SYSCALL programs are always sleepable. */
 SEC("syscall")
 __success __retval(0)
+__skip_without_arena
 int big_alloc4(void *ctx)
 {
-#if defined(__BPF_FEATURE_ADDR_SPACE_CAST)
 	char __arena *pages;
 	u64 i;
 	int err = 0;
@@ -345,8 +343,6 @@ int big_alloc4(void *ctx)

 	bpf_arena_free_pages(&arena, pages, LARGE_PAGE_CNT);
 	return err;
-#endif
-	return 0;
 }
-#endif
+
 char _license[] SEC("license") = "GPL";
