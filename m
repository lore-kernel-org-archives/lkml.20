Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793145897;
	b=1fm9zMIyKzx1tfe93OzUcwCpjgE19apv3BxKiVXsf3az7VURYHwOFuCAOjgE9mytuuRI
	 Nau2eVbx545xjX/C/zCVTR5vYXqus69F+0RCWPKbTlNu8fuQrjEO8/rdWt6hVn4zYoTUQ
	 wq77EtqIGdg6V232YZQkxazUEbbeRbqTJDh7Qn8fm8UUDLW/1qEA/ynryV72gTwkSZ9Ua
	 f5kQVfwIwR4X6Hb67iMDQNQolgqIsuKN4co7ZEd5SRuW1MMfL5qkJltealUWOt/b0/rnh
	 vx3dISvvZjAZVkvI3Tt81ekzcMdMJ/oG7O2sVwJGBAUgSdpb8x8GbdYqb3oJOkEe5kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793145897;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=TqZMShUwObQw8SKTj74MIhBW352zXxbZoagijRnRZsU=;
	b=CvTIN223zpw5LmQxw72XxbRgrPK7aYcZNBWIbRcrFrVISmVpAH37y65iKM/kHyj42/Bc
	 jPZngfWuueHlQx+gNsbE45RZPpp2pWWzmbWHa6Kc0/Hgj5hNAUj9beJrAHXGYJdsJjTws
	 AqYzNcSzcuqgi0j0SoGwedXfV42s20B+0IPuw/S0jWCZ8A6GtLHdr6hDFPbAELd3VT2VX
	 YVhQh+z6etXbZ7RHX8/id22IPRe0I6BRj2RCkg2DGXI2HvjL9HmoX/jkpG9gs79jbj+xZ
	 RMvt1m7Dy206U58x9AwZJPJbKS1Mqaht7hiyDe+RvSj4rV5qTJWhX0CO4t+VBOhIK3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GjeFvKhQ;
	arc=none smtp.remote-ip=95.215.58.28
Received: from mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326FA606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 326FA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GjeFvKhQ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=kG6PSTw+cy6dHxyAq6KmUby801uCfZJf2HXQ109G+h4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793145894; v=1; x=1793750694;
 b=GjeFvKhQQdRdbZqtb1W4VbUmEEBaYv2YNplwdRLmz4uu6BtWgTcA0rQO/SccAbWJJjBRSFHj
 IHK2icPF5/CR1rhvqvN6kYGrGpt3q6KEgJGfOYTmmU6hCxzYWx808T8EVb0bTz2WD8gSckAJBBB
 8Ko39EIY94ugCople+C7vu2Y=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 76a2d9e2e1102b84;
	Wed, 28 Oct 2026 00:04:54 +0000
X-Mizu-Trace-ID: 76a2d9e2e1102b84
X-Migadu-Flow: FLOW_OUT
From: Vineet Gupta <vineet.gupta@linux.dev>
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
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	jose.marchesi@oracle.com,
	david.faust@oss.qualcomm.com,
	Vineet Gupta <vineet.gupta@linux.dev>
Subject: [PATCH bpf-next v1 4/7] selftests/bpf: make arena_base() opaque to GCC's -Warray-bounds
Date: Tue, 27 Oct 2026 17:04:08 -0700
Message-ID: <20261028000411.4010967-5-vineet.gupta@linux.dev>
X-Mailer: git-send-email 2.56.0
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

arena_base() casts the map definition to the kernel's struct bpf_arena
and reads user_vm_start out of it.  In the object file that definition
is only the 32-byte BTF placeholder the loader rewrites, so the access
is past the end of the object and GCC says so:

  libarena/include/bpf_arena_common.h:52:69: error: array subscript 'struct bpf_arena[0]' is partly outside array bounds of 'struct <anonymous>[1]' [-Werror=array-bounds=]
     52 | #define arena_base(map) ((void __arena *)((struct bpf_arena *)(map))->user_vm_start)
  progs/arena_race.c:58:30: note: in expansion of macro 'arena_base'

GCC is right; clang has the same warning but does not apply it to a
member access through a cast.  With BPF_CFLAGS carrying -Werror this is
a build failure, today, for every prog that calls arena_base() and is
compiled by a GCC with arena support: verifier_arena.c,
verifier_arena_large.c, verifier_arena_globals1.c,
verifier_arena_globals2.c and arena_race.c.

Make the pointer opaque instead, which is what progs/stream.c already
does for its own open-coded copy of the same access.  The bounds
analysis then has nothing to reason about, and every caller is covered
without a per-file opt-out that has to be maintained -- arena_race.c
was added without one and broke the bpf_gcc build.

The barrier is behind #ifdef __clang__ so clang keeps the plain macro.
It does not need it, and the barrier is not free: it blocks reuse of
the map address, so each call site reloads it.  Across the five progs
and 20 call sites that is +35 instructions under GCC
(2528 -> 2563), about 1.4% on those objects and nothing elsewhere.
Clang output is unchanged, bit for bit.

Signed-off-by: Vineet Gupta <vineet.gupta@linux.dev>
---
 .../bpf/libarena/include/bpf_arena_common.h      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h b/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
index 82aafe879fae..4f2c6050215f 100644
--- a/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
+++ b/tools/testing/selftests/bpf/libarena/include/bpf_arena_common.h
@@ -49,7 +49,23 @@ void __arena* bpf_arena_alloc_pages(void *map, void __arena *addr, __u32 page_cn
 int bpf_arena_reserve_pages(void *map, void __arena *addr, __u32 page_cnt) __ksym __weak;
 void bpf_arena_free_pages(void *map, void __arena *ptr, __u32 page_cnt) __ksym __weak;
 
+/*
+ * GCC's -Warray-bounds fires on the member access: the map definition the
+ * object file carries is smaller than struct bpf_arena.  Make the pointer
+ * opaque to it, as the open-coded form in progs/stream.c already does.
+ * clang does not warn and does not need the barrier, which costs a reload
+ * of the map address at every call site.
+ */
+#ifdef __clang__
 #define arena_base(map) ((void __arena *)((struct bpf_arena *)(map))->user_vm_start)
+#else
+#define arena_base(map)							\
+({									\
+	struct bpf_arena *__ma = (void *)(map);				\
+	barrier_var(__ma);						\
+	(void __arena *)__ma->user_vm_start;				\
+})
+#endif
 
 #else /* when compiled as user space code */
 
-- 
2.53.0-Meta

