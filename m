Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197938;
	b=f6yv4jFLkBp7Pp9EvCNnV4Jd3lOWmiMw9n2c4neH9mzGWZQYjyVQATNAQaTgG4vIBphm
	 iz/7lm1HYHtGQxZHJo0j+5M5jmwLA8pqC6ggDYXFbjz1Pi+f5CWGTqinmU151RxZ7oIDv
	 jsaZ4fcT+fek7tPF0viTQEPCmTyFpyBrAQqe2m00lj1CKhM/TcDPcgRHhFxcG2XVHDgEu
	 lFkADrsivWD8MmJCb3RmIHFq5wLLtPWkuPNGt4rtZ7u1uGesRWyRDVF8Cb5frX+QvSDPA
	 mdVs6AwrW8YqqnkJ9AGl4TuWQTt6WWpG20D53Add5hCYX0AEnPQs7rl7w0yYjw+Ud9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=whvi6uOzLPFDK63sBlOyMwxJI0H9ZrvTEZmk5Ud1UGA=;
	b=gj+KpsfZgvcc3M627ZqHQxAM6uTFiBvzj6Ly7k+7ATdo8FjGGeOwmq+ofEzcnGLY2HYd
	 O18DNVrhUC6gtmFcvefnNEAkbYsLqMkDqSAM2WWv/Q3Flp3W8wvD7BCndUYxSL15xWPSW
	 vRbgvrSBgljy+XwmQAPjHrvWGbfJOjI73DL6p5jlVqg1krFdYORvft+oRzAmjVUmjZD9v
	 FUCPFpR1U4fHZGvDaXOYJBKF4TICYH6whVwrkGFx8+1mol0wDZNrfncrL6BY+bdijuJCS
	 DoNhylUKPrX6Z5wx4na3Li8Fc/SA33Hwszo90LO0GKsGtzgab6k0ug1zVSGbyStTb1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejPwGhhf;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2251606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 04:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2251606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ejPwGhhf
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so4504845e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 20:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197936; x=1794802736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=whvi6uOzLPFDK63sBlOyMwxJI0H9ZrvTEZmk5Ud1UGA=;
        b=ejPwGhhfN/rAaatm6P/axhIAwzQQ4uuR+FB/KZTdNxeKnyRemyT73eArBExR3DhrgZ
         wrqFz4ed7a3czaRfocu4L2vZMw/Fed/DAEftvJKFEl/DOHGOmZ0KjUi7y5eK+Gz+AO0K
         MsY1YCXaVLyrayGyf/YO0uAKqIZpx2yM3v0mJJqeAJo7Fi1gQG+BQsghzYBZL3wu8WnS
         LGXth1jtSMsbG57i+3GGSl6txe/isShpH2ZGGAXGc+FSBLlWxQlNSeB7jD2WSTMDEymY
         PaEM5sR8lW2XdABeyZsp2IpfpmdG8SJC+DZ0SDyHCwl+zfhuykmPM95h3HGX7v3YMwPs
         FXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197936; x=1794802736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=whvi6uOzLPFDK63sBlOyMwxJI0H9ZrvTEZmk5Ud1UGA=;
        b=gxTaAinRh0aoXMBcbbqeWTrh3o8gh9Y2COkWYxXTZK2S6S3Fv2ixwts9rjlzHtgQZR
         W3Vck/n+Al6qpJN1WaXFAOiLHIJHIddWTQRVGHvteo4fp0QpZfq4srn+z0OZnyQkzL5n
         k8tZbVV1512qorwNsiprlxMsJZnI/pPDVvoD878IWUdQOTpah7T3f2TdLOugGtaSCauc
         rNQc7JbSf37QajV+g36zwiIyEouTbaG3gHcQhBxKCanhLqn2a6JRxQbmm7Y/2YuMSSY+
         0srBQFdYTK/nKHnPDydLbBnr7/BSRfgjd4at7smg3MYe1dfBmGGGuaHGCyLEilcXY7u3
         T+uQ==
X-Forwarded-Encrypted: i=1; AL+hErGJGqzbvxImwt3kNvaaddg39g46R6SWLaSEfDQ+jD3A422OrV0udXQjRyw0iD/EZkkxCTtkxjKfLCHGKss=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mi+4UUHGIQHz8Fm86PL4kdOXLSD0b4X9IQyJiF6hwhHKdRXny
	bg1BVAMq8CaxTOIZ7Fdfkss8TNAn8vA97xGa2gJ3FOGodXHyqNZa+WgX35OgA0ro
X-Gm-Gg: AYBFou3sSOiJHtT+iFxR6dKUsqrzW2q7U9Jbn4zg+egnQTL8QGT48fp3aCUwnvZN0Bm
	fc9Mf5vXmGIySMBLO/wdViPXmbmwpYq8tUqU4Fi5sDLsxztGIS7QSEDSqeXzFileQxaYKqVtlJ8
	MJrknuYSqA0eVo/bLrncHte5zhn8B57OdkXqheYN0oSMshAi5sssgGrdEtuEl9w+iWD+AZlIhIx
	LpD38QRtVDZJkhB+V1OM25BOAWrrnKtlOiLhMGXk2Z34cnJPt5e/NcPTs3x2BAUAQ1VcyYC8NaT
	Ce87N+J/hCRqAT/F852tANlIDiu6PjP+htR0fi1preifRrFaBmjD3XidvvKgG6JVi4SAL6VE78Z
	2T2ySrSEyq0EVYL1+a6c7LGH9fVDqAH6gtKw0hhO/lwGJ42+YmuZW//ka/9pasRcZVkUXz2ftIv
	XHTXioqpsMHa9emsYTlcI7Qkbau6H2Tzsf/PaAzUKWJeAosSPfTRRLNxf6CvUgWTw8cwX4QiHkz
	jlNSY1qw0yw3xl+eikRohvXFVSgg+DMF/IG7bTCQmY8tGqTh96ZnQFZmpGDu7sGw46KTCytMT2R
	Wl4cLMCtglTWRHSNPzKYWYMbb1+mGZ+AAsAayk12Oibrkqi7FCyXEj6AHCQm9fUJ1UKzN42CAYS
	RImo3v/F9IR5hv8qkJQve3VvaPyAR5vlcC0LyDaogiOa8dJSJoWmQ3W8naB85GdveoDwiSzMtmF
	/1Iod/gBvwmUzhRjCVCFmY2CiF3U7Rw+JqdcEp
X-Received: by 2002:a05:600c:8714:b0:4a2:150f:1609 with SMTP id 5b1f17b1804b1-4b963c767a3mr47264145e9.8.1794197935987;
        Sun, 08 Nov 2026 20:18:55 -0800 (PST)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a16e-6b01-5d8d-9ced-49ae-4521.310.pool.telefonica.de. [2a02:3100:a16e:6b01:5d8d:9ced:49ae:4521])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b79502d5b1sm135598225e9.5.2026.11.08.20.18.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 20:18:55 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: entry: Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr
Date: Mon,  9 Nov 2026 05:18:45 +0100
Message-Id: <20261109041845.33695-1-kmehltretter@gmail.com>
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

ret_from_fork_kernel() and ret_from_fork_user() are traceable and
return after syscall_exit_to_user_mode() enters the RCU extended
quiescent state via user_enter_irqoff() on NO_HZ_FULL CPUs. When
function_graph tracing is enabled with
FTRACE_VALIDATE_RCU_IS_WATCHING, the return hook runs after RCU stops
watching and triggers the ftrace_return_to_handler() warning.

Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr.

Fixes: f955aa8723a6 ("riscv: entry: Convert ret_from_fork() to C")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

v2:
 - Drop instrumentation_begin()/instrumentation_end() around the kernel
   thread callback. They only feed objtool's noinstr validation, which
   riscv does not have (Jisheng Zhang). ret_from_fork_kernel() and
   ret_from_fork_user() disassemble identically to v1 (Clang, defconfig
   with NO_HZ_FULL and FUNCTION_GRAPH_TRACER).

v1: https://lore.kernel.org/r/20261107194931.69176-1-kmehltretter@gmail.com/

Tested with v1 on mainline d48723711bae (after v7.4-rc1) under QEMU
riscv64 (-smp 4) with NO_HZ_FULL, FTRACE_VALIDATE_RCU_IS_WATCHING,
PROVE_LOCKING, nohz_full=1-3 rcu_nocbs=1-3 on the kernel command line,
and function_graph tracing during parallel fork bursts across CPUs 0-3.

 arch/riscv/kernel/process.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d1cad..6f2b46d1a8e98 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -225,14 +225,15 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
-asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
+asmlinkage void noinstr ret_from_fork_kernel(void *fn_arg, int (*fn)(void *),
+					     struct pt_regs *regs)
 {
 	fn(fn_arg);
 
 	syscall_exit_to_user_mode(regs);
 }
 
-asmlinkage void ret_from_fork_user(struct pt_regs *regs)
+asmlinkage void noinstr ret_from_fork_user(struct pt_regs *regs)
 {
 	syscall_exit_to_user_mode(regs);
 }

base-commit: d48723711bae9b8cdc56719c448ba42fef28cbee
-- 
2.39.5 (Apple Git-154)

