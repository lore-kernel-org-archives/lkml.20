Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794079098;
	b=rDt1oDGuy/4qP2Knq4VuCoLZVuqnpzaY4eWI6IypfRp7yzX7B/ex9W6A9H+LoMGC3CJp
	 ARCAT27ZAvqiOrdqw2SFyg+bKaqVoZpUnBtK8EeoZ+J5a79U+Q7llgj/Wu2tRH9s1ExZM
	 7B8bI7H0LpP/lrfWtTZPIg48BQpBxFR1TdLIxGQUGY7p7yuWHHStvu8iCEe0736oknNZy
	 0P5EEybY9Un+oKI+C86fsXMFfLc7cfJSpjxVocPoMfkUcPYIP31zCFnb97DW7u8hYSvWd
	 a29MEwpIfzqTcRBM5YRP5HHNsffY+qGyJdOUVyFwFh0mJeBwis8G1L2yuq3kkq67dOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794079098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zCrty79NgxFUqHJKCt+VIFUPqqO4GcRjBtBn2SXM9ZU=;
	b=oqQXf2r4joQB2ml9fJCgH9OS9SQYhPtcBJyJevnc+lxC5m8a9BfLdHbVMmX3ekqn0UAN
	 XeYmCjjXKStxy6+xphY9PpNCv3Lk4f/8JfK+l51NggI30CHdPVO/NLj4wzRapDs2DRzbs
	 T9KTgKSXiI0bBSC7r8TDfmeO32Qr54NSW3busy94MSrC2XY2Arzn3NpUyYdoMsBPx/RZR
	 20I6rSt/nrRYkgTsTiebaXkcozXrnEuJsxd68X+DVCPJ4FGvd4uDav171D4N19sPg31J+
	 Dq/56TgKn7wa/0/i/zKBA+YXTetnUQe8D0NTcWlhFYPw9cBgFIBIZMTsS95YFGesw5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sGDowJO;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D68606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:18:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D68606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0sGDowJO
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so12951075e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794079097; x=1794683897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zCrty79NgxFUqHJKCt+VIFUPqqO4GcRjBtBn2SXM9ZU=;
        b=0sGDowJOpVou/BLgMivQdrGKLZrgB8EMJlO7//3pxgXcWHd1T6hu5w2oYYpdj6k8z9
         EtG30PbOl5h5l39fzHdI6b9Ciw9YOySsy8PcxC5CSL98TOarQkQeE6Q0VjHqtbktAPn6
         Q9qCTIpLwZk7y/mlsxJFXYNn4LXHqXLHZZixse3m67rFOYfXT9RKEP4R7VmcKKRjZHLx
         XYPU1doRlx42LTiYEl3lPTvUYXYtcK8P6q3UwCSI2BgAfha0eoyXRvGEp6LjBIdPqk/3
         07szF0otyidnrCB3RlhMAI34xU8chyaHViIwGP479V1W3VPG7NC51ypnidifs3ayZ6M5
         xAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794079097; x=1794683897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCrty79NgxFUqHJKCt+VIFUPqqO4GcRjBtBn2SXM9ZU=;
        b=KeOp9FE5aysOiD1ASdglWZ4CsAQAq9TscVt3IiZc40gA96xAK0tF2e2RizP/d3WBpR
         ezOmZ6BgPOvzlEaBw70Bi3K4miTBUai12vQp2vljiIN9LM36AvXOvFjO+5pkgfjLpap0
         eidPwTNzZwOFu1PPkPbAl49d+53HrcfYockWaPQO7gwt10/yeZZrF2icrSmFgVyXduNg
         7F2QblXerJk7EfHcIhIYfcLYezkpSxMsbXJzms4Wa6TIFEMR4MYnFR4vu9d4YHWeOtzQ
         tzCJcndugLQ0xcmpAF0B8+LENsXiF42YrYTKN+gYKSsXJlxs9bYwIQR9u9yDbaNPgW13
         RBEA==
X-Forwarded-Encrypted: i=1; AKwUvByddR5L/iylIHr2zEXOLhxaYXNNdhPUdq3qyeL0BvV4GxZ+80/a5BjJZWqwOUwzwisumcHKGAyhx+uOmjk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9sDAKSNgwy8ZCikw8dIRea3UpqPMJAS+yWHybuk/rfB2XhuGB8
	FaSP7mtiqGym/eM4j7OCC7FWEDv/T7Tq4oW2AZYhk9hjQA265l84YjWq
X-Gm-Gg: AYBFou3J8llnF6y2WEcEwlIN9cOtPAb8oNb7MIx9k6/E9NxxABz01wgeM+ru9VRKslY
	U8DdJO/by6vbH+rO4GOmoRNKnPj4JLZeY0zaIZq1ceBPSk7+hCHGmbB8cskEGZ5iQmU4e8fPw1i
	yZuAD7BsoNGD3C1fkb0a0znMVrnvKEGe1Blt6AfjsJ9kXFiPtLjMScz2sFOGjrq7UA1YXX7mBqf
	6KZTXdzThk3/5+18zMgLxR4cJ9klHO1vez/a4gd5N0kgYw72CzlefztdjrtvrizFNgc6Ye0aj4j
	k7Ato3pBQLBGXmiAmeJQnHgthEp5LfMvr+bmkuqfTpehsOnNVrd5kG9NvE6Z9BXPg2+XjR6PMQm
	X/+YQeWDFkVKYq5XZ2icIiWbGfrJcNfd3zh3deEZtZtK76XADI4DdyO7qgKjHA3CvX3a0Ym0FMd
	4k2gwgN/9e7LorAD8rYQGm4EMskWGQMpgcURStTDx/gYE/HeGb4uOf9fZw/Y2QHeZksqA4NJiSG
	oVeZyfnp863qBoKYclIsDH5epvzT1dpGBRCR9M1CJfgx4f8FgY/o7w0z932vOmi6rgmaVIgFbCz
	1ibVDDzaj7WEUru+jEkzcbx0N4QV+1wfDr3kWDgOCiEJmor7F08JGZN76yCJqlhvXTbE9oC+Cds
	6iZCMtSDUGrp5uELTaHfPv5qfTPt5S5zzG+sYAo3UrgwNVOU0nY8niA0Oma7w+JVlQ466apo9OB
	JhqGle29086r7ZUP6XcvCSH/3RdIg0KfK+cQGL17XtiXDELmWF+7ba
X-Received: by 2002:a05:600c:a47:b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4b6df21324cmr114003935e9.13.1794079096603;
        Sat, 07 Nov 2026 11:18:16 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm11155780f8f.21.2026.11.07.11.18.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 11:18:16 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/process: Mark ret_from_fork() noinstr
Date: Sat,  7 Nov 2026 20:16:09 +0100
Message-Id: <20261107191609.60336-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

ret_from_fork() is traceable and returns after
syscall_exit_to_user_mode() enters the RCU extended quiescent state via
user_enter_irqoff() on NO_HZ_FULL CPUs. When function_graph tracing is
enabled with FTRACE_VALIDATE_RCU_IS_WATCHING, the return hook runs in
ret_from_fork() after RCU stops watching and triggers the
ftrace_return_to_handler() warning.

Mark ret_from_fork() noinstr and bracket schedule_tail() and the kernel
thread callback with instrumentation_begin() and instrumentation_end().

Fixes: 3aec4ecb3d1f ("x86: Rewrite ret_from_fork() in C")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested on v7.4-rc1 (d48723711bae) under QEMU x86_64 (-smp 4) with
NO_HZ_FULL, FTRACE_VALIDATE_RCU_IS_WATCHING, PROVE_LOCKING,
nohz_full=1-3 rcu_nocbs=1-3 on the kernel command line, and
function_graph tracing during parallel fork bursts across CPUs 0-3.
Without this patch, two consecutive runs trigger:
  RCU not on for: ret_from_fork+0x4/0x370
  WARNING: include/linux/trace_recursion.h:132 at ftrace_return_to_handler+0x185/0x2e0, CPU#3
With this patch, two consecutive runs complete without the
ftrace_return_to_handler() warning.

 arch/x86/kernel/process.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac8801..270d663e95c76 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -148,9 +148,10 @@ static int set_new_tls(struct task_struct *p, unsigned long tls)
 		return do_set_thread_area_64(p, ARCH_SET_FS, tls);
 }
 
-__visible void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
+__visible noinstr void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
 				     int (*fn)(void *), void *fn_arg)
 {
+	instrumentation_begin();
 	schedule_tail(prev);
 
 	/* Is this a kernel thread? */
@@ -163,6 +164,7 @@ __visible void ret_from_fork(struct task_struct *prev, struct pt_regs *regs,
 		 */
 		regs->ax = 0;
 	}
+	instrumentation_end();
 
 	syscall_exit_to_user_mode(regs);
 }
base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee

-- 
2.39.5 (Apple Git-154)

