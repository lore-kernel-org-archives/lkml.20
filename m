Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C703AA1B0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792131405; cv=none; b=u+WUq1z+JIwMgqD9GdFlQSnN+KuGtYWWa7c9P3PytCai4wqc71l1TQafzZshKAChw8GesjCncH/+EboATt3wnhkXGGLwg8n2KLArPkQBrM83XsWY+P+YMk1hmCepqiAoqRex/RZQ8lXdk0b1LmgHHx/Ze9kxw6Kti0kr8MEVrlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792131405; c=relaxed/simple;
	bh=sRH0ha2EZ153ajq54eM0Yi85dNlM+hFCBKuV5K/D0/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l5Cae5aEopfMs/kBXrWBH+thGwP1GJJYDJYsy8e5gFzMToIfABxcNzHo8xBlPyAc46XOafBAl7jSP2J1FI8hiNgnephBhq1jNG7g+vyTEkOqXCAmJPtemoADBg18qx8LQ2jKcMWDHROp1Jn/FjkgSITCAKBsi4aqJSyBtixQ8mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cj/TK+CH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cj/TK+CH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so53480795e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792131402; x=1792736202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=haJU0ShvAO1LQDIvBwK5BiMB17AU7LxjM0Mr3FtXsAw=;
        b=cj/TK+CHWG6KFcmymsS6BeXkwJ2UsIkY1V/npmXtcHN+DQVISft2xO2Gwwu0m9kikL
         NptuJtZIkc7eLt3FaylMwDc0DxFgc1QQqsiaU8H9mO918fKDSLkx8JGhi6QqfDeVDQR2
         gHSJRW3EWz0hIYsI4wT+D8RCPQG2aq0W2FwJHhhZeNPB+gwM0307TdsOpYQHeE1/byDh
         k9yWu8X3wD3aw9oQL1sVSeS7lTPohobIu2sRVY6ZVjf/8KXAhRUAeR7YTmYf4QKb12AK
         qMTcP8sghXXmNEjv6AIXxVSbSr5Ap3ocxdG+QHwPRmpuMowzqqa5ibGCAP2iespk8/Dn
         Y1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792131402; x=1792736202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=haJU0ShvAO1LQDIvBwK5BiMB17AU7LxjM0Mr3FtXsAw=;
        b=xA6cTu7UVXWo4K57uJP7y3kuFRtdpsvt9qrO/uiKa1/itXI6gzC8aO+WEaSfvmQHzN
         tJ+XXR7wlvelYVEn0uoV2/QdOrSGmXqp5z2HeMyAdEHUBKLQTIo8nK3PWjPtlazoyChv
         mwt7wQ1n39BLk+mCCIPtxsTa5Y8gQvb/hS0lYdUrL4J/06x3YspzXVXBCJu80U/34d83
         gRJSr0L87ecVKIWBH+5yykqTDyZHX6GGWl/q26QwGUjBMrvZGF/zsS/igTEQSs60z7No
         teAB8Midf+HWa2CnhCfmFjzZq/ROAaCHKPDwA+tefhoI35Mia/asZuejg8TrEk27vFqf
         goQA==
X-Forwarded-Encrypted: i=1; AKwUvBzAgVTTWaqcwv8nf7rl6QAMBqbGoLsQCXjoBZVnhePZJFc4ar6MEfUBqUgymF6kzDQIs7DrEkpjFlVUXgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnsl3qcnFjeQfTR1Z6X0OACCHX06zEghLwKPwYdYrlaB5cXjHj
	KHCcy3qWvZxJ5d8m5me1ZFwaxxAgnF9IJMW65s3HnDGORTSOmmBzWhdp
X-Gm-Gg: AYBFou1YDunP+8Gc9jTfwJv24dbmYjQIS9ORwUMV2f1Nw5Y0bU9PksYbQ7N1t1iEaSO
	gfC1ppEWPrv2vHQ2f166FHzbfPjGJwwRmzc9JvVJsyzqUjuaJAyKRZJzVnwsOtkM79/XHOQQRjB
	nVhYSkHTnz4ZNvA9xummdIGkLqJ37IgwSv6bOKS4I5PcXCWnya6hMLmV7muTJptIu7zIHVdnIW4
	eFPjg1A+YbDSLPNRX+SEfxObuxRv13Cjgjtdp1NGaUBi1LzmsMHj3qRlK85q5wCgRSB/VlxWfSL
	huhQ1cQZY/f9/MKxgZqiqEO5pEeKdfucls5SWcHfAX0ZPK6qslz0mUk6M4DUn09WC2sT+ZPZ6jl
	BE4gvefq312G3RNkMG+AoP2+CwKP5FqJvd2eI9tkLS46eTFUyCL+GeNH4DgAgfDlKX+77vV8b/O
	lvVJzKoJiU6QH6O6+gwm/j3pgDcVfvVvKO+c1cQgEwdf7AteUPEawCBj5atUtM24d7sj1qn2PfW
	dMMkRtxAgLtZqVH0ej7eL3OUAng190jkuE4gkr5DK6t2ZxV8gvglEF1/PA=
X-Received: by 2002:a05:600c:4f14:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a18e4adc5cmr454717125e9.16.1792131401674;
        Thu, 15 Oct 2026 23:16:41 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8abfae7sm14985945e9.0.2026.10.15.23.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 23:16:41 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] tracing: Hold trace_types_lock when updating modules in persistent instances
Date: Fri, 16 Oct 2026 07:16:34 +0100
Message-ID: <20261016061638.214847-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trace_module_record() walks ftrace_trace_arrays from the module notifier
without trace_types_lock. A concurrent rmdir of an instance removes it
from the list and frees it under that lock, so a module load or unload
can walk into a freed trace_array.

Fixes: 5f3719f697c3 ("tracing: Update modules to persistent instances when loaded")
Cc: stable@vger.kernel.org
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 kernel/trace/trace.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index e4a490d3d08c..d3ffbed9c44b 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -9247,6 +9247,8 @@ static void trace_module_record(struct module *mod, bool add)
 	struct trace_array *tr;
 	unsigned long flags;
 
+	guard(mutex)(&trace_types_lock);
+
 	list_for_each_entry(tr, &ftrace_trace_arrays, list) {
 		flags = tr->flags & (TRACE_ARRAY_FL_BOOT | TRACE_ARRAY_FL_LAST_BOOT);
 		/* Update any persistent trace array that has already been started */
-- 
2.55.0

