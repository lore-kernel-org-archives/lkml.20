Received: from mta1.migadu.com (out-113.mta1.migadu.com [95.215.58.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E03CB2DB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788507494; cv=none; b=Tsx5XXCCFpIziLJ0gAql0ouf36FZcVUDhGlCdqjG/6X6YhNyl1DfR6OApYNU+owo+rFL9pIRcs8P5iZ3dunIg29Ed/qUa15oY8aV+BcKRG85pPIWweeWVPOqDg7/OAOQPNai7GMXKe9ooM2jum2R9IsY/u9OXpdxRwY+YVIjpBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788507494; c=relaxed/simple;
	bh=ut1RAeTmhP4u08aElYbIvkNLEWQ6+/R9w+gyuZCJDQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jZ1uAg/XK8Q9CHnHJUXEdFpBFYYQuU+Itcc60t8BQUv2FnIGdiRyq0ZC6+AmFfNYOQwP3yLrCR7wOA0Gz4LhE9lbFET4QZKD5El/FcFNGaiVuUN+rqG+t1rHS5KOY0f0yIkKBb7iX0YeoIgu4cQdRXkAXxqv1mw2Q5lwMGVZ1a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YVH9nXP+; arc=none smtp.client-ip=95.215.58.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YVH9nXP+"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ut1RAeTmhP4u08aElYbIvkNLEWQ6+/R9w+gyuZCJDQc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788507485; v=1; x=1789112285;
 b=YVH9nXP+5RuWifVAj3y5SLiBTdmYe5A1JlRW3MY/3T65Ud7GHmU2EKYxWKlOvZOZ238JF84X
 NlEvHeSEXbVK++OsPYhjzbQ3UUJj6i13HY6awxaZiB5HD923yhx2U3qGehWVFzswuvu96K7Jr5W
 goAd93v5d1yTyQ2Co0ZJTAEc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ba18ad104a91eea3;
	Fri, 04 Sep 2026 07:37:54 +0000
X-Mizu-Trace-ID: ba18ad104a91eea3
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>,
	Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>,
	Puranjay Mohan <puranjay@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1] selftests/bpf: Fix flaky bpf_nf test when random NAT port is 0
Date: Fri,  4 Sep 2026 15:37:39 +0800
Message-ID: <20260904073745.363314-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bpf_nf test allocs a ct, sets snat and dnat with random addr and
port via bpf_ct_set_nat_info(), then looks the ct up and checks the
reply tuple against what was set.

The port comes from bpf_get_prandom_u32() and can be 0. For
bpf_ct_set_nat_info(), port 0 means "port not specified", so only the
addr is mapped and the kernel keeps the original port. The check then
compares that port with 0 and fails, which shows up as a flaky
"Test for source natting" failure in CI [1][2].

Keep the random port in 1..65535 so it is always specified.

[1] https://github.com/kernel-patches/bpf/actions/runs/33830002889/job/100893868791
[2] https://github.com/kernel-patches/bpf/actions/runs/33829976794/job/100893220999

Fixes: b06b45e82b59 ("selftests/bpf: add tests for bpf_ct_set_nat_info kfunc")
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
 tools/testing/selftests/bpf/progs/test_bpf_nf.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/bpf/progs/test_bpf_nf.c b/tools/testing/selftests/bpf/progs/test_bpf_nf.c
index df43649ecb78..eda9b7bbab75 100644
--- a/tools/testing/selftests/bpf/progs/test_bpf_nf.c
+++ b/tools/testing/selftests/bpf/progs/test_bpf_nf.c
@@ -190,8 +190,8 @@ nf_ct_test(struct nf_conn *(*lookup_fn)(void *, struct bpf_sock_tuple *, u32,
 	ct = alloc_fn(ctx, &bpf_tuple, sizeof(bpf_tuple.ipv4), &opts_def,
 		      sizeof(opts_def));
 	if (ct) {
-		__u16 sport = bpf_get_prandom_u32();
-		__u16 dport = bpf_get_prandom_u32();
+		__u16 sport = bpf_get_prandom_u32() % 65535 + 1;
+		__u16 dport = bpf_get_prandom_u32() % 65535 + 1;
 		union nf_inet_addr saddr = {};
 		union nf_inet_addr daddr = {};
 		struct nf_conn *ct_ins;
@@ -293,8 +293,8 @@ nf_ct_opts_new_test(struct nf_conn *(*lookup_fn)(void *, struct bpf_sock_tuple *
 	ct = alloc_fn(ctx, &bpf_tuple, sizeof(bpf_tuple.ipv4), &opts_def,
 		      sizeof(opts_def));
 	if (ct) {
-		__u16 sport = bpf_get_prandom_u32();
-		__u16 dport = bpf_get_prandom_u32();
+		__u16 sport = bpf_get_prandom_u32() % 65535 + 1;
+		__u16 dport = bpf_get_prandom_u32() % 65535 + 1;
 		union nf_inet_addr saddr = {};
 		union nf_inet_addr daddr = {};
 		struct nf_conn *ct_ins;
-- 
2.43.0

