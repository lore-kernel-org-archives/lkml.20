Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794668852;
	b=nGK7U+jlKe3rku46YLJ97A0C2AKh8lJi5z+v0xvk6WrGrcfSGO7gJsoTyMvSmX42mfAI
	 PF5Xwydgv9SbR9UdwL9hezyraE4bbE2Rgf9Kwgcqjt25Rv8Z03OjwifjNPmIZ0Ish0WX7
	 AL1Ood5b9L5EdZGU2stxpVV/nLbK8EkxpwGZvuYvSktE/UnMkBJ6mz//EP4FSCB/JzXua
	 80otDCc/LuHF0a8YqwfZnQ9OwIU6PBamKBgDWgVtSjLqOWJYHgGHJ3c6E669CBqcUgXv1
	 dLexIQWkohALiAnDIjezOx+alk0VzZT8hrpkK42hIefAi7NQaBxpqpSYbzdY43N1Tdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794668852;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tQQNnVu5sa7UMxlu2gH2t9z3DlNLMLNyr6RhAENgCHk=;
	b=usUFnmwnDOLFRaOVOkLcnmCudhV5/p+zuRf/36IiLN1J0vvXTRn5darUF/wSBoLAmyP2
	 raPLMbiyLW/mxsZk2aX/9tXNv532YSew0IDO157ILg80+/4XtOnP4tkJ4nElKknkPBYpo
	 dWVaaY9iODY+lGO+bI1hhS41kxjrNCsqThtttAWSl7llAtfWzgleU6rcysr/nRJnWLjlI
	 NlpySkzt/q80B3rGEuN8RHQJ4G2GXO/EdkPzdpGLN2AixZ4pS21LI9wJsGDQy6f2SxgsT
	 KoTN7GEyLDZvKVE22qqBr3ABoSdOXn61Hzr5wKRnTYrtxRUb3Aq3xCwujnDMxWH9JNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Zk4NUGaJ;
	arc=none smtp.remote-ip=91.218.175.49
Received: from mta0.migadu.com (out-49.mta0.migadu.com [91.218.175.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0C3606A88F
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D0C3606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Zk4NUGaJ
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=BkS+y7ePRlJ0EKeZ7dXvg3C7h9wxY5qRABbpyHKvKvE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794668844; v=1; x=1795273644;
 b=Zk4NUGaJluDz3qTlcp44ks0+4f1GvNAMqKgv1mCMwaIpHP2UStzMqfUkXtDqknGZepZZr3K4
 UFFWZBQej/4EFkrXcADE6lvLP7plbC0C4Z5PGfrXPSHqQxG+jbCyGBa5V42Bnqm3DcGYGXMGajW
 GsVAOos559bhzMervouKO7HU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 45ad7670b685d85c;
	Sat, 14 Nov 2026 15:07:24 +0000
X-Mizu-Trace-ID: 45ad7670b685d85c
X-Migadu-Flow: FLOW_OUT
From: Leon Hwang <leon.hwang@linux.dev>
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <matt@bobrowski.net>,
	Shuah Khan <shuah@kernel.org>,
	Leon Hwang <leon.hwang@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next v2 5/9] libbpf: Add log_opts support for BPF_TRACE_ITER
Date: Sat, 14 Nov 2026 23:06:06 +0800
Message-ID: <20261114150610.84507-6-leon.hwang@linux.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114150610.84507-1-leon.hwang@linux.dev>
References: <20261114150610.84507-1-leon.hwang@linux.dev>
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

Add iter.info and iter.len to pass iterator information separately from
log_opts. Keep the existing iter_info and iter_info_len fields working
for callers that do not request logs.

Thereafter, log_opts can work for iter link_create.

Meanwhile, add log_opts support for bpf_program__attach_iter() API.

Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
---
 tools/lib/bpf/bpf.c    | 23 +++++++++++++++++------
 tools/lib/bpf/bpf.h    |  8 ++++++++
 tools/lib/bpf/libbpf.c |  5 +++--
 tools/lib/bpf/libbpf.h |  3 ++-
 4 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/tools/lib/bpf/bpf.c b/tools/lib/bpf/bpf.c
index 38dcb31e8c0e..ad6b356cc48c 100644
--- a/tools/lib/bpf/bpf.c
+++ b/tools/lib/bpf/bpf.c
@@ -808,11 +808,6 @@ int bpf_link_create(int prog_fd, int target_fd,
 	if (iter_info_len && attach_type != BPF_TRACE_ITER)
 		return libbpf_err(-EINVAL);
 
-	if (iter_info_len)
-		iter_info = OPTS_GET(opts, iter_info, (void *)0);
-	else
-		log_opts = OPTS_GET(opts, log_opts, (void *)0);
-
 	/* validate we don't have unexpected combinations of non-zero fields */
 	if (iter_info_len || target_btf_id) {
 		if (iter_info_len && target_btf_id)
@@ -821,6 +816,22 @@ int bpf_link_create(int prog_fd, int target_fd,
 			return libbpf_err(-EINVAL);
 	}
 
+	if (attach_type == BPF_TRACE_ITER) {
+		if (iter_info_len) {
+			iter_info = OPTS_GET(opts, iter_info, (void *)0);
+		} else {
+			log_opts = OPTS_GET(opts, log_opts, (void *)0);
+			iter_info = OPTS_GET(opts, iter.info, (void *)0);
+			iter_info_len = OPTS_GET(opts, iter.len, 0);
+			if (iter_info_len && target_btf_id)
+				return libbpf_err(-EINVAL);
+			if (!OPTS_ZEROED(opts, iter))
+				return libbpf_err(-EINVAL);
+		}
+	} else {
+		log_opts = OPTS_GET(opts, log_opts, (void *)0);
+	}
+
 	memset(&attr, 0, attr_sz);
 	attr.link_create.prog_fd = prog_fd;
 	attr.link_create.target_fd = target_fd;
@@ -970,7 +981,7 @@ int bpf_link_create(int prog_fd, int target_fd,
 			return libbpf_err(-EINVAL);
 		break;
 	default:
-		if (!OPTS_ZEROED(opts, iter_info_len))
+		if (!OPTS_ZEROED(opts, log_opts))
 			return libbpf_err(-EINVAL);
 		break;
 	}
diff --git a/tools/lib/bpf/bpf.h b/tools/lib/bpf/bpf.h
index fe3b7fd8512b..2ac143fd1102 100644
--- a/tools/lib/bpf/bpf.h
+++ b/tools/lib/bpf/bpf.h
@@ -422,6 +422,10 @@ union bpf_iter_link_info; /* defined in up-to-date linux/bpf.h */
 struct bpf_link_create_opts {
 	size_t sz; /* size of this struct for forward/backward compatibility */
 	__u32 flags;
+	/*
+	 * iter_info and iter_info_len are deprecated, use iter.info and
+	 * iter.len instead.
+	 */
 	union {
 		union bpf_iter_link_info *iter_info;
 		struct bpf_log_opts *log_opts;
@@ -478,6 +482,10 @@ struct bpf_link_create_opts {
 			const __u64 *cookies;
 			__u32 cnt;
 		} tracing_multi;
+		struct {
+			union bpf_iter_link_info *info;
+			__u32 len;
+		} iter;
 	};
 	size_t :0;
 };
diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 44134421bd7d..28830d198e9d 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -14811,8 +14811,9 @@ bpf_program__attach_iter(const struct bpf_program *prog,
 	if (!OPTS_VALID(opts, bpf_iter_attach_opts))
 		return libbpf_err_ptr(-EINVAL);
 
-	link_create_opts.iter_info = OPTS_GET(opts, link_info, (void *)0);
-	link_create_opts.iter_info_len = OPTS_GET(opts, link_info_len, 0);
+	link_create_opts.log_opts = OPTS_GET(opts, log_opts, (void *)0);
+	link_create_opts.iter.info = OPTS_GET(opts, link_info, (void *)0);
+	link_create_opts.iter.len = OPTS_GET(opts, link_info_len, 0);
 
 	prog_fd = bpf_program__fd(prog);
 	if (prog_fd < 0) {
diff --git a/tools/lib/bpf/libbpf.h b/tools/lib/bpf/libbpf.h
index 49f1120f4021..56300be81016 100644
--- a/tools/lib/bpf/libbpf.h
+++ b/tools/lib/bpf/libbpf.h
@@ -1000,8 +1000,9 @@ struct bpf_iter_attach_opts {
 	size_t sz; /* size of this struct for forward/backward compatibility */
 	union bpf_iter_link_info *link_info;
 	__u32 link_info_len;
+	struct bpf_log_opts *log_opts;
 };
-#define bpf_iter_attach_opts__last_field link_info_len
+#define bpf_iter_attach_opts__last_field log_opts
 
 LIBBPF_API struct bpf_link *
 bpf_program__attach_iter(const struct bpf_program *prog,
-- 
2.55.0

