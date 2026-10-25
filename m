Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792947175;
	b=dD/nTlK1Sa+NNHQZQS/ytZclO5hz3YYLT8uyMFcGoz8whgEaf9azW8g1FQ4+/m300ZLx
	 gFyVPDZacVoye4O4pMKS2eeW9CqJ3pUQTox41bqNPYbBaknXoyBTEkdEYFAGC9uFVxGNh
	 w7Y4qdmBPWnt9i+Lc4u/ZoACdIWvKJD5ryfoyFiyb9YHspLQ0ytZCEiAypuEqIFzbMpwl
	 DbxO2BEh7vFTYO2V4wCIgt79cULjoFdEqcjh2L5Xs1n6zyOSPg9U6GKxicT2NeWb84aSD
	 YMsjmYtx4i7zsns0JkxTHaydiHln4wn1nPUPQXoEb5V4paLW0PhUhbyM+FrLMMdD5lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792947175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ks5Nj1Rp6nJ8C0/sAGiBc8M5bTi1BI3WWiAy9GduFxA=;
	b=vs9jVdAtZQhXq6Ife3mVJG7xi1e3Xyi94SohSpPq70mkY8o6bsHHjPfXdZ0WhC4uJep7
	 xiw8PaUec4ZiqZzpP64jTVLTe6wHlD3Qp0D9pmlOd6v5cB+s/8vPqgr9hxvsCCe2Gr7Ah
	 p/lP9aLzYle6yhBVK5asecu/gy9GUja3W4mylr6fpQeTcR/EtC+YCT2iB6BkPs5n4QU42
	 2XKFcvdLjhSVn11vTVrtlieuNmYtxpsyTTXL64CX/Hi2nD5jekjKHO4UFVGTWrwTj9NdY
	 bOWRTYMYdoIuq55keUjj76Kj9OT57NF10cSwgHyUxE/1GKIFJHTVUoeOIJO6WLZFYaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gO83qPJT;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B2606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:52:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 828B2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gO83qPJT
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-19305bcb72cso1399030c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792947174; x=1793551974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ks5Nj1Rp6nJ8C0/sAGiBc8M5bTi1BI3WWiAy9GduFxA=;
        b=gO83qPJTlsVOuCRHiUlIgxveQCeYRw0awcZJWoKO6HvcBlwdr/EOpPOKyCo4BtQ9c3
         0OhR/DIFFl3ZhoVMSg6hQNys4+lqMr4D2qws1357RfIiF/j2p2SBomdejKMVU19hbSho
         NlqcWd1Lh/TyxhAJHRgTnWcdUNCv2G3OgqTDvf5tpjg7IYc7hqi/JlEO0ckzPad9flXD
         hKNVtyMrgp+G2qBU2otyxiZed8+M7kKzwQEUmjPuEuRCoHlkDa9Xktnmnqf7fXi/eN8h
         ZtlzrZf/UkbgEIg4dxpkUCOQ4fG5kLXyh+D5juCeltMltIS8hxxulciErWKX80A4P9ZT
         /Qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792947174; x=1793551974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ks5Nj1Rp6nJ8C0/sAGiBc8M5bTi1BI3WWiAy9GduFxA=;
        b=xYIFvm9ZQFNkMWoCLYfo1j5rv62TGHzbQegZ9AUJeSZexUgG1juL92iBkhAF66UFjY
         Hp+HBeywUS3Wrzx+RtnO9zmsrK29hnxf2dXX8KpCdw96PTp/cJQzB3H5fu0tk1kQaOK3
         Vg0U1a/7n5y31eJYENZ+dXwSw5EWZLPgZTQsJfOcGYq5NHy1czktXDfCrfbFfkfAG1Ql
         REP0sxgUjkx97aHztnm1zTFDcPpNjzOtd11egfrvT9bb9pFFJimkns87ruJk2f+1QFRV
         OXrs9Zs38nNEB2ZJ/HCpnDWrvzu5B/7WDaybv/xBgdr+UDAd+4SyAuLvWqR7CZ7ABtLr
         Lurw==
X-Forwarded-Encrypted: i=1; AKwUvBzDFNCQhYL0vsbghETYl70dPkjkDupiESO6tzSIhcswhXoc+rfD5kPMF7dfUnSBpHCia1U7Sa2wlc8BF0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIehs6I3ma7zbzgVlnvkDWyiVoSpfr8j0gt7IJkNURAARC3NCa
	tA6rWZ5hqR6xN/Jz9+zOtir1AJlgTYpJ8xMv1bc0cSt2oUPYuUnBrtNG
X-Gm-Gg: AYBFou15PWpmz1WXLqlxSle5UX4P0Jfn9DPYL0KSPduSLaMP44q63eUes5DM9JMidnv
	aAl1MWuF2jiKTclbXTThearCv7OXdZHrDT6CXwHk099iN9fz3hVDTk+5GlkHHuTURpKWTbzmc6U
	GIrF5TfrES1Ik+WSvRe0zvv8mFQ9GDWtrOePCVAb+0wp7BaXTDNh7V7+ZvAifjjkO/HxRoKujXz
	vAMLOnC9RrOaTY2e7xThPuVIwc6gz/qUdFvSoDpYnIso28096iM8SF9E9yrB3fSUto15CFFBe/4
	uTvFlksnZw83LOo3R2mBX4SaQCXglj4W6fHKuEkVb8eAfHc31/QeFevdPDqA1x+74FF9AxFT+mF
	8A7iV8v+ayIV2AgsYcIcMqOg8u2kOfUzLlBySyEtYHihFTssY8z8wrrlEfYFbflUsHzb1sL8sby
	lLGaF0KC3U5vqIZjo9uWs01S7V3hLgZF1PWrjBcf8JFmcOYZl2KQrQobNSfcoRrdf8Yst9ycmsW
	IDS1eFm+Q67M+tGUi9CTcQ9170OYAi91fJpiZ1sSvk0NUhwAVox0DTSuMJcMdVgIWlWp3Qh
X-Received: by 2002:a05:7022:3f07:b0:144:fa57:c617 with SMTP id a92af1059eb24-19935dd7f53mr7910138c88.34.1792947173498;
        Sun, 25 Oct 2026 09:52:53 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee69sm24035239c88.4.2026.10.25.09.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:52:53 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tracing: Free tracer resources on instance creation failure
Date: Mon, 26 Oct 2026 01:52:50 +0900
Message-ID: <20261025165250.65363-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Creating a tracefs instance can allocate private tracer nodes, copied
flags and option arrays before trace_array_create_dir() returns. If a
later allocation fails, trace_array_create_systems() jumps to
out_free_tr and frees the trace_array without releasing those private
allocations. The failed instance is never registered, so normal removal
cannot reclaim them.

Free the tracer nodes and option arrays when trace_array_create_dir()
fails, then continue through the existing trace_array cleanup. Earlier
failures still use out_free_tr because the tracer list is not yet
initialized there.

Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU/KVM through tracefs instance mkdir with
failslab targeting tracer flags, a later tracer node and option-array
growth. The baseline retained one or four private allocations after
the failed mkdir; the patched kernel retained none. Normal instance
option read/write and removal also passed.

 kernel/trace/trace.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 97a058623f94..ad68a39a1161 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -8751,7 +8751,7 @@ trace_array_create_systems(const char *name, const char *systems,
 	if (trace_instance_dir) {
 		ret = trace_array_create_dir(tr);
 		if (ret)
-			goto out_free_tr;
+			goto out_free_tracers;
 	} else
 		__trace_early_add_events(tr);
 
@@ -8761,6 +8761,11 @@ trace_array_create_systems(const char *name, const char *systems,
 
 	return tr;
 
+ out_free_tracers:
+	free_tracers(tr);
+	for (int i = 0; i < tr->nr_topts; i++)
+		kfree(tr->topts[i].topts);
+	kfree(tr->topts);
  out_free_tr:
 	ftrace_free_ftrace_ops(tr);
 	free_trace_buffers(tr);
