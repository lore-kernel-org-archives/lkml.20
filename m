Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794080985;
	b=kbN9pkbkrjH7xW282cn3yK/b1XW7Y8+sYNcnlVtdrZMN5YH7EKxw08yJg5NkvlXQggV5
	 JE0zHuOZLcA23cReyLypF11Ep/gGdC8pv8gvO5iOq1CtvICYZRf7RImpV1wxb9sygO+OO
	 GWt3TOk+OWP4zxUv3Oa2aT1+qvW1+BtB+3PyUMWq+AUq4ITpJrzPi3gMovoy8CaHGaoMw
	 N3AOjPaLWpN1WOYHqPkSrxvPTpMTtH3GI12SLvX70OMirrQbXcO2Jy3q7ER3WgaKzXhZF
	 5yavwkIR6mzwaoCHcZVrcD7vNGJ7HE8MQcbg834t57oGP95QbbOV1N9XGPJhatsf2fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794080985;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/tu4B3PnObEBYuagThQOs/5KWVKGJisJ4D6xN5Num/E=;
	b=WYK1UtwE8UtrPJRFx6neMGS40qxd49rSxXHKR06ugY1O6r0WTY2JdXprwACZVeQeGP2Z
	 NXXlZYLjydXVLzSFHl8mYw4vtyiDmGTRaYePqnrCXfIJmNvxRLnHwABZyVFzu/HajJhRh
	 lImiYciKYu+iQ+cWByURhavfvIpWOLNRUnWB7tXV7h4Ow4fEgwp5bE4hmYrD/MWOXYRjf
	 PjP+bAR30ZQ7sDZ/DCAB/7rBQLO7HgpPvpbEbtdP5ewZAD7k4EsEVuCQe0nYfajbq36BQ
	 dKQcSkSKAdCYBxrUwXWe1GAjo4J+DsntZBbb3dBQIVg6DJQv8ECJ2XrjXvYLFbiU3YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FRWJEU+n;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318B8606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 19:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318B8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FRWJEU+n
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so17446315e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 11:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794080983; x=1794685783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/tu4B3PnObEBYuagThQOs/5KWVKGJisJ4D6xN5Num/E=;
        b=FRWJEU+nYLIHIDiafjim7QX4tRiqCQyFC1XT1ambdtMwelJ3CdfZjEvA/+/C6fP8nd
         7VHR8GHnrEjNCLvIg9qqqmQRZ452j0PU4j9ijne/+6UGcRx/Pa1Vy9xqlhMPEVDlp/uh
         tRugzhGIcTq7x/HtZqsvdymXY7D52L7rixWnRgRHEQgdhp5IOTSnXcfycizIad6nBhuR
         YqNBQBdOO5Y7XkpRQNFQigFkhsRK5LJCCjBEiz5rahCEQzOd8A+o0eoxzH05UwO3bznp
         5pUuS39wNWzJrnudojCUC+qQy9KQh1NDsmVBERvAl6ifjz42R8Q+dzm4pDk1BGUn+riA
         NYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794080983; x=1794685783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/tu4B3PnObEBYuagThQOs/5KWVKGJisJ4D6xN5Num/E=;
        b=wFEitVlHpm0uvu0hpiwoQjtC2aHBGu+rkiNz40IyCNCKVfjORj186IoL3upEunJzXO
         apBnaKMb+M0E1lhyQQgzixtAQ3xIdgaoq98eivITt4Gd5CVHJ0edfYub/aQoC/dTRxLN
         R/c5UR+xH9buZsiAL2Wn0E7V8iwUCdR7MWfedKoydAM0wUQPfhluWBUy9hj+OZ7OP+66
         r/VWy+0QvbsqfwtEamJgFwLiDiAqX+6U5KUJzMNcozLE4iYXhfPw1cQ9cw6Mq/0JmeQK
         EXqXzzcdneIyMiLY+lnQMM0mIM0ggrR7R812KmYXwIXqYdiVZrRhNohs3XeOk970zpkD
         iO6A==
X-Forwarded-Encrypted: i=1; AKwUvBxRYaVZBHxpOIgP4wD1VootqLS6CWIG50nFZ+n+qmbwebM3av0s+7SdkKIM5ztLqQoMzn5NioBKaYwRvaE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mJb9REL65kcU6+TMPKNlw8tkwoXd6iYMYA2CaZiNHvE3QyPUL
	MAUuvfXxn+JaoWavUv2V41x+1GkMJwNVwtvnJpAuJxUOkriKO29R1bSp
X-Gm-Gg: AYBFou32tvSlpJOgE9z13VNX/1+r2qI5pPQji/NME+OdQPf75qN+FWw/1av+nfgeggP
	erZb0CjgZqI8gROTBIy//qe+hpAidToTIae/yNKclKmBY2H3gnbb0Ydlkm7RZR0WpJUgZePgNle
	1LuXgtWlI58t13VajsZXtSnf1EEcsggCCBuLXYI60jw8BTchj8+8u68g3WwV6MPfrAnbWDl9sKn
	3F5Ez6groaxTfsOUF5adFc/IWySWEkfXxN6kqoIB+JPVR6jO4bGeNWTCXAcGRifUyDJGoVakYEE
	hVB8eII7jMhlY5FTbUa+DSOpoiiYLYQAZthgmJpVXFKOvXIAFjP+4KCHcBoplUJugUwBsmmCNHr
	R/Ck1Dastg1TYLkCdjbe/YXH2Zl18JhIXhkMYKO9aqK3nUmFomHxK2CcI70RK8WvC8qQYMZzx8i
	x29u2WbshBJnlSQ2HyBEFI3Bw1JwJQeytBkQPN4RqQN1xDFdIgMM5zWPyMKngazdD35PURyh5+Z
	tnyaFEzCERzfz13X85UtanfS2r6NU6spJ/IanuUUOg3pdEgS2SfOwlPzpWg3CqsY1AsejiS1ckm
	3/9Dkfc1/wyLHpzQLjC4XqazoZwejNPMDjy+CTDa3Y9Kcpz6e5DpfzbIj3pTjWuwfTEsCJOrXvI
	jfN8ytVmi7dMV9DivE+L+ZAGun33eK5B1sRj4cqfzrQUY7xMayUWh/wew0MQhL9Rx0+SYUXzXxU
	qW4OwmIArSLoa+Kr3ruEC/NUkAokZqbgg=
X-Received: by 2002:a05:600c:6211:b0:4a0:1c94:7042 with SMTP id 5b1f17b1804b1-4b6de4a5d5cmr112509125e9.8.1794080983470;
        Sat, 07 Nov 2026 11:49:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62edb4sm118646645e9.1.2026.11.07.11.49.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 11:49:43 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: entry: Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr
Date: Sat,  7 Nov 2026 20:49:31 +0100
Message-Id: <20261107194931.69176-1-kmehltretter@gmail.com>
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

Mark ret_from_fork_kernel() and ret_from_fork_user() noinstr and bracket
the kernel thread callback with instrumentation_begin() and
instrumentation_end().

Fixes: f955aa8723a6 ("riscv: entry: Convert ret_from_fork() to C")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Assisted by an LLM.

Tested on v7.4-rc1 (d48723711bae) under QEMU riscv64 (-smp 4) with
NO_HZ_FULL, FTRACE_VALIDATE_RCU_IS_WATCHING, PROVE_LOCKING,
nohz_full=1-3 rcu_nocbs=1-3 on the kernel command line, and
function_graph tracing during parallel fork bursts across CPUs 0-3.
Without this patch, two consecutive runs trigger:
  RCU not on for: ret_from_fork_user+0x4/0x368
  WARNING: include/linux/trace_recursion.h:132 at ftrace_return_to_handler+0x2e0/0x2f0, CPU#2
followed by an observed kernel paging request Oops in
ftrace_graph_ret_addr() while unwinding the warning backtrace.
With this patch, two consecutive runs complete without the
ftrace_return_to_handler() warning or unwind fault.

 arch/riscv/kernel/process.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d1cad..10c1bee77145f 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -225,14 +225,17 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
 	return 0;
 }
 
-asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs)
+asmlinkage void noinstr ret_from_fork_kernel(void *fn_arg, int (*fn)(void *),
+					     struct pt_regs *regs)
 {
+	instrumentation_begin();
 	fn(fn_arg);
+	instrumentation_end();
 
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

