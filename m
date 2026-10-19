Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437840;
	b=XNeRnYk7BUDFXPTujaEoCsrtA9mANn7BbuSccDjFqiF2rJAa896lzdOpE33/BUAtviEo
	 HV5j+9ia2RIs0BONBFyoohaTl2kar57A56rc8t76yDpuQKk95egiWgbguo3G/k5REIpfJ
	 u27gs8O1E4Sw5/iveCskilRBid8B1lkHx5s/X3BTrw1/M8hgIirHDUglhScQj3Zv208XT
	 6LNup19jEzttWAALwbdGPZxYZbD6BjVJSgXugmXsbbsCF1Dtte6jA3+G4aE3n0x3bykmN
	 yjscKcJDb0Vwf4Puahdj9vPbpkWlw9eAjxaln57Az3wGStk/XqI1oloedPmuCtcq2iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437840;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=roAxgWJeGxuI12n/bhv6tcInHm/0UGxp9FTNXBEeZ7I=;
	b=X6aVvbDh5YI6zKQmaFGfBM6SSVjIRJAvSF34AemOKeWo+6Jw0CKKfbyNjFIF8fQjBgsO
	 a6uVw1Cw84TECyZT7aSDXL8vfMCH/P4uk568K95DhdSGXFGhkIB9sx6o8Gcob10cvbNqx
	 1P1Kd7AUwdAw576DasInHW4hiUJ/VHYw/wO0uHf853ijbZjiSA2rGqYoiprLYqd3y5onW
	 80vMuFN9eEpPSFE6Dj8OxO1TB3BEppwwvZ7Eu+eo0UzQ6xD8hBfFWzzEQrBHmyJs75Xha
	 /9QO7letvBKgOZebhrhVlVzfBpBjHuG/LyGuWZZbvji2ZhKiv7ee+4PPZmt3pDYow6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dybj4dh+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B70606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dybj4dh+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5352D1F000C7;
	Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437840;
	bh=roAxgWJeGxuI12n/bhv6tcInHm/0UGxp9FTNXBEeZ7I=;
	h=Date:From:To:Cc:Subject:References;
	b=Dybj4dh+NuWyupjTl1UN0BAGZaIFrEhQ79YuXK+fUyCG4xRM3J19nZlJdFP1eLImm
	 ybInyvyWQ9lGLPCML/Mr9iTJzwUptc96DfT+nrvPehHuhhy3LKAkSJXC4dckrfqIJo
	 MVI5OeI3Irn/lkzuecOfUpqvK6ZBxGf+4XRG8XlmEyK13UDmCcevFth7CN2qPlNlkS
	 XzlWSIXHZgyDIBHuu0egHsNadnPqSV2bhSM3Jq0H3HCWTbGbzlchMiFEYd1CvaXj2h
	 2jmfojOG0MDxMFQlIssxHPrSYAAb1z/1qmDJpK7qYwdVejkhFvCu86Os5gAHygvDD1
	 Iu7z4HBAEivhA==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIsxj-00000001eFs-2Acx;
	Mon, 19 Oct 2026 15:23:59 -0400
Message-ID: <20261019192359.325485958@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:23:46 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 pengdonglin <pengdonglin@xiaomi.com>
Subject: [for-next][PATCH 2/9] tracing: Avoid BTF lookup in atomic context
References: <20261019192344.004592683@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

From: pengdonglin <pengdonglin@xiaomi.com>

The function graph trace formatter can be called from ftrace_dump_one()
with interrupts disabled. When ftrace_dump_on_oops is enabled, the trace
panic notifier can reach ftrace_dump() from the panic path, including the
nmi_panic() path used by the hard lockup detector.

btf_find_func_proto() calls bpf_find_btf_id(), which may initialize vmlinux
BTF under a mutex. Skip the BTF lookup when running in an atomic context
or with interrupts disabled, and fall back to the existing return value
formatting.

Link: https://patch.msgid.link/20260916133218.1282590-2-dolinux.peng@gmail.com
Fixes: ebeed8d4a555 ("tracing/probes: Move finding func-proto API and getting func-param API to trace_btf")
Signed-off-by: pengdonglin <pengdonglin@xiaomi.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/trace_btf.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/trace/trace_btf.c b/kernel/trace/trace_btf.c
index ee7a04886bf6..b8370ae9bd54 100644
--- a/kernel/trace/trace_btf.c
+++ b/kernel/trace/trace_btf.c
@@ -15,6 +15,9 @@ const struct btf_type *btf_find_func_proto(const char *func_name, struct btf **b
 	const struct btf_type *t;
 	s32 id;
 
+	if (unlikely(in_atomic() || irqs_disabled()))
+		return NULL;
+
 	id = bpf_find_btf_id(func_name, BTF_KIND_FUNC, btf_p);
 	if (id < 0)
 		return NULL;
-- 
2.53.0
