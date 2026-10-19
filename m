Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792437840;
	b=tWX/V232Y/b7cxljreX7O7nEaPXL6+949baBG5iGD/6vmdGUQS11B1UaGhbisMbilevc
	 hBUwZlDswjWjst9S7UiDoEl+Hx07XSvLiG/oyR9fmJkv0QV+AJd5gwsJGLiFbmo2qJtOz
	 +cgkiQY+N7iOtTm/K1JjnMdfoGKIvNwK6kmR846cfXhXT9BmQ4YByrtM9dmZf7+JaFKYK
	 qqkVCZ3TqXhGAUeXXBZ84GQgJ6/vjs9BeecbR3g5SVWLK4GTfDTAJhdQGwDG35uAqDEO3
	 PYUAZewTd4l6ypnxZSiQIB5/q7l1hvkWEs8bWPVF3IJYPX8ZvN45/EolpJkvU9q1W0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792437840;
	h=Received:DKIM-Signature:Received:Message-ID:User-Agent:Date:From:To:
	 Cc:Subject:References:MIME-Version:Content-Type;
	bh=+6cEAA1ydYm4SWQEYhRh3WGX3sCX0MGeRFxH9YV4/XE=;
	b=kkk/QfglPYda1pYOHenbTO3lffjkVTKqVSgCLUznMmO0vCiW1PkLpm04EjRflFoMA7gZ
	 BU98QHnwvENsI5VkP6+jxEN4POtFiYAnnI0ft1FDl8Obl51D5STsLcLvdYnrlVWxyBX/d
	 nN1nda0VMEYnpjhNwlGxXeB3So/s9jYZ2F4eI3zx9x5gY878dRW4mqSsdC4ANw94zTEPY
	 laAlBuFl/UiXgkFIQPoysMshmsBCdoEy1hLCSPRokGV/EMtY3P7ZCwbetI6mKw6GZCwcl
	 +izgFBwZfPr1Jz5jvnNFnAhguk8/1Cu+9s7P0B+JTEz9nDJQkV4+DPvUtCipp2qa3rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8On5tGZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF44606A322
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8On5tGZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C421F000C6;
	Mon, 19 Oct 2026 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792437840;
	bh=+6cEAA1ydYm4SWQEYhRh3WGX3sCX0MGeRFxH9YV4/XE=;
	h=Date:From:To:Cc:Subject:References;
	b=H8On5tGZSszhw6BUmRPRa9exWIGl2o+UzGvJepnlyNRe3WzmSKm48Pmisrp4rWMT9
	 ZgVbWYYhsFFChG297RFY4igETnkRF3v9KkK3HXDLkueSopRid3YhaxugfTjfAew5hI
	 QJ0IiFJTa+8FQtLASRDYNJq0MhA0SgQCJu8dA3Dz//LBUEQagTezyOUmcHAnWqG9V6
	 CH49ZRIT75WUnDymDvg54uqyv4DMQLliJXYwUAS/9+DHLRoAdp3QNc6uToxnZfJqbj
	 Q0q1Ib/AU/AYBRTWlUtVK1nWjcOcTCJNSNguNa7WAMQBsusUamCELtLwwOC8BHSI8Y
	 Ntv4jZc/fZRZQ==
Received: from rostedt by gandalf with local (Exim 4.100.1)
	(envelope-from <rostedt@kernel.org>)
	id 1xIsxj-00000001eGQ-30sW;
	Mon, 19 Oct 2026 15:23:59 -0400
Message-ID: <20261019192359.538356770@kernel.org>
User-Agent: quilt/0.69
Date: Mon, 19 Oct 2026 15:23:47 -0400
From: Steven Rostedt <rostedt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Xiaoqin Zhang <zhangxiaoqin@xiaomi.com>,
 pengdonglin <pengdonglin@xiaomi.com>
Subject: [for-next][PATCH 3/9] ftrace: Build trace_btf.c when CONFIG_DEBUG_INFO_BTF is enabled
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

The trace_btf.c file provides BTF helper functions used by the ftrace
subsystem. Make the compilation of trace_btf.c solely depend on
CONFIG_DEBUG_INFO_BTF, allowing features like funcgraph-retval to also
utilize these helpers.

Additionally, the redundant dependency on CONFIG_PROBE_EVENTS_BTF_ARGS
is removed, as CONFIG_DEBUG_INFO_BTF already depends on
CONFIG_BPF_SYSCALL.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Xiaoqin Zhang <zhangxiaoqin@xiaomi.com>
Link: https://patch.msgid.link/20260916133218.1282590-3-dolinux.peng@gmail.com
Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: pengdonglin <pengdonglin@xiaomi.com>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 kernel/trace/Kconfig  | 2 +-
 kernel/trace/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
index 0ab5916575a9..d8faeb659cfc 100644
--- a/kernel/trace/Kconfig
+++ b/kernel/trace/Kconfig
@@ -770,7 +770,7 @@ config FPROBE_EVENTS
 config PROBE_EVENTS_BTF_ARGS
 	depends on HAVE_FUNCTION_ARG_ACCESS_API
 	depends on FPROBE_EVENTS || KPROBE_EVENTS
-	depends on DEBUG_INFO_BTF && BPF_SYSCALL
+	depends on DEBUG_INFO_BTF
 	bool "Support BTF function arguments for probe events"
 	default y
 	help
diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
index f934ff586bd4..28b08f31e7e5 100644
--- a/kernel/trace/Makefile
+++ b/kernel/trace/Makefile
@@ -119,7 +119,7 @@ obj-$(CONFIG_KGDB_KDB) += trace_kdb.o
 endif
 obj-$(CONFIG_DYNAMIC_EVENTS) += trace_dynevent.o
 obj-$(CONFIG_PROBE_EVENTS) += trace_probe.o
-obj-$(CONFIG_PROBE_EVENTS_BTF_ARGS) += trace_btf.o
+obj-$(CONFIG_DEBUG_INFO_BTF) += trace_btf.o
 obj-$(CONFIG_UPROBE_EVENTS) += trace_uprobe.o
 obj-$(CONFIG_BOOTTIME_TRACING) += trace_boot.o
 obj-$(CONFIG_FTRACE_RECORD_RECURSION) += trace_recursion_record.o
-- 
2.53.0
