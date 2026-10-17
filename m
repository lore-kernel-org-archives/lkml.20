Received: from mta1.migadu.com (out-75.mta1.migadu.com [95.215.58.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5E3CCFB2
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 14:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792247922; cv=none; b=rXG6wjego3rBhfcBMz3mN0aoPzMTU7w9pNUmjpK43C39comhpnTpL6HRTysB0qVzQuRCuBIQRI+ikFRruQpTU2wU6wq5S1hS7ajTTMLW+kKNVkLP4sQczl7GSO2HFAt34eKMMYZcoVPqa4qeEScnYq5nL86/1cupGCkb3Y9lJLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792247922; c=relaxed/simple;
	bh=EpvuBxKqKA4laIc2RRTTydYfpNhHi/D1qOfWR0z9OUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dYVGIp9wTvdV/wjmqlD9uA/iMLQTElU49Plw/I9tBFs07ZsQcYLU4nNQi34Rsx6d3fgHaGl1jqCwkM6RClr3LQCKXbcp/txD3oMO1+UM016tcO2F4MBehF5gmWZXIc0Fv4Hfxyj1m4oEQc5DPbgnr7SoMgW9IkvYN6HxuIa3Bds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QtEdAY3O; arc=none smtp.client-ip=95.215.58.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QtEdAY3O"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EpvuBxKqKA4laIc2RRTTydYfpNhHi/D1qOfWR0z9OUo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792247918; v=1; x=1792852718;
 b=QtEdAY3OKyScLag+Z2Jpk2i75ZuZqwAmCGbx7Q1Rfp48QMfKBunGUNeycxjU1W81kTuV4fSZ
 hvr3H4h1w8jOBzsQHpJ46kgcD97JdN9dtuc9fNPILBmKhNokXA9+6MBkdMypMh63NQpJgwmC1Eo
 UQsImNvcSI2Kc9XhZryLPCY0=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 826e6dd93e69ed21;
	Sat, 17 Oct 2026 14:38:37 +0000
X-Mizu-Trace-ID: 826e6dd93e69ed21
X-Migadu-Flow: FLOW_OUT
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: bpf@vger.kernel.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Kaiyan Mei <M202472210@hust.edu.cn>,
	Yinhao Hu <dddddd@hust.edu.cn>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Amery Hung <ameryhung@gmail.com>,
	Martin Teichmann <martin.teichmann@xfel.eu>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf v2 1/2] bpf: Fix verifier WARN on narrow read of bpf_tcp_sock u64 fields
Date: Sat, 17 Oct 2026 22:38:12 +0800
Message-ID: <20261017143819.209510-1-jiayuan.chen@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A BPF program can read the middle of a u64 field in struct bpf_tcp_sock:

	tp = bpf_tcp_sock(listener);
	/* +0x54 is in the middle of the u64 bytes_received */
	unsigned hi = *(unsigned *)((char *)tp + 0x54);

bpf_tcp_sock_is_valid_access() allows this 4-byte read (the default case
only checks size == 4), but bpf_tcp_sock_convert_ctx_access() only knows
the field starts and has no idea how to handle such an offset. It emits
no instruction, cnt stays 0 and the fixup pass trips verifier_bug():

	verifier bug: error during ctx access conversion (0)

Just disallow the narrower access by matching the whole u64 range of the
two fields, so it is turned down at check time:

	invalid tcp_sock access off=84 size=4

Fixes: 655a51e536c0 ("bpf: Add struct bpf_tcp_sock and BPF_FUNC_tcp_sock")
Reported-by: Kaiyan Mei <M202472210@hust.edu.cn>
Reported-by: Yinhao Hu <dddddd@hust.edu.cn>
Reported-by: Dongliang Mu <dzm91@hust.edu.cn>
Closes: https://lore.kernel.org/bpf/7a8ff335.1024c.1a14395f3e5.Coremail.kaiyanm@hust.edu.cn/
Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
---
v1 -> v2: Add a selftest (Alexei).
v1: https://lore.kernel.org/bpf/DM6CTQQV55G1.1AU1HIBPQYW8J@gmail.com/T/#t
---
 net/core/filter.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/core/filter.c b/net/core/filter.c
index ba536be2915f..f0eae1c14b2f 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -7600,8 +7600,8 @@ bool bpf_tcp_sock_is_valid_access(int off, int size, enum bpf_access_type type,
 		return false;
 
 	switch (off) {
-	case offsetof(struct bpf_tcp_sock, bytes_received):
-	case offsetof(struct bpf_tcp_sock, bytes_acked):
+	case bpf_ctx_range(struct bpf_tcp_sock, bytes_received):
+	case bpf_ctx_range(struct bpf_tcp_sock, bytes_acked):
 		return size == sizeof(__u64);
 	default:
 		return size == sizeof(__u32);
-- 
2.43.0

