Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532429;
	b=aEu0vmjUcdsUmeLLqz9D8y1Kak1/ReMyydvMpp1ipSjPuT42xs0Y1XlMD1bVqIy2xNgS
	 fIU9veUrlBl90BTLqAfVh4I9zWCCB7rwEe/0Uo4M9lcvswuQPw7pChPsbFlQi/8s80FQG
	 X+OCJjlIu2XwC9S197UCkWuHeiE1VXchXR/9r7z42JsJe3L1+tAaremYTs3xCKCGch495
	 GZC4cDye6KtQx9j885QRswAqHDOWAQi0kEeEt3EBySrnLyB5iFRQSTO4WKFWOtO8W8Rm7
	 qFOFP/4l1oObAJNlEZd8JyXIvBSrqg0bhmokGU9dKD9TXz37r5qphf7CDM/g0FVX84A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Sc5ygLidAeVc1fVLnxfVzT8pc+Zr0/C2OuXAjLAj5yE=;
	b=samrxbrC/kLTFs1Lho74t3HzX60+jteEgtWfYFVy6pQGMAXtlkbPyivjgrqlvaQBSH9R
	 lwDNCd6/iMla1WJ+snLrD7F5HLvcq9xkq24/O5dtYThazCuTHooKqgiyCGy/ODYgYqgFs
	 2FShf0Ky8opQhwHdOtXJzDu14EfBRW3P1Pc98NrN51UMcVzYiyS1z+x4K8CdRvCTPa1q/
	 srwdia3YY8ZQcURKSKm7orqDgb5/MzmzeSlp485H2apwOdgh2rmmZk9SmwGt+ITwThMMM
	 e6Ql9ux2kkMZMBRPeRbDGtIyXWtNfuCaxO/xkmBoQHr4Y2WjG+PjDm/5zqb5hyh7Kxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlXfrmYC;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7B7606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:13:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F7B7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hlXfrmYC
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso4870535e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532427; x=1795137227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sc5ygLidAeVc1fVLnxfVzT8pc+Zr0/C2OuXAjLAj5yE=;
        b=hlXfrmYCQW0yWzGjrBwqAOEDYipKPP1+CZXPVrQdF0f9bnR6+43Z+bKQS6bZj/e9PU
         CgH3o8G8EhNDFlO5Ns7E5e4rz6oM5RcA/hMysCr9qHdOlsIoTi7hbklNQK4gJvkgUD6m
         EGsEVFU2xm1Rcyxqhpn+d9dpjcMRTNGlecx1h6772BeB+wdUV3K3EXfxAru/qrLkXYqr
         mopxtT5uDoVm7Vyo1nuOIXIFo+2id+X4zFRXfIrzW7D8VkqXNzjbaSWEA75iwLfhmLDZ
         wmN9sRoW4NmBkgIOP6ViEnYOY0MCY8ujBUUbSmahSP78PDqixll8kHy/UTUK3YpZI0Bd
         CLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532427; x=1795137227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sc5ygLidAeVc1fVLnxfVzT8pc+Zr0/C2OuXAjLAj5yE=;
        b=wsaMY3AENcxzhI5QfocjmHQarPzPnNjNGBTHtyWVZO2+PAUiIL1m9DfWFAu46BoW5I
         s0pG+u+0qjprHn5AwvVRIjxwOkrM/TXRgOz4xaCO5kMvuaqS9A7epo2Vq/9eomfCpyCI
         TvV46k1hK4a5R68hrgQHxlaoAvhucTsLfnte8kXRWFnRFK6GTnxuoFBcMXTiciPzESLb
         4Fcw7ycVQjbTZa4ETBSDMl9SrEqmcWIqJLeqcsXgy9UTyFdDAELiHvRjUHGgtP6U0x54
         nSqQrEgtqaK24oZmM6F+Ab2nXvwLqYoYwNysZfZ+xChtLQuLQLMJZcHS1GYd2hDaAPUK
         DNbA==
X-Forwarded-Encrypted: i=1; AL+hErHW5GMuJFdz0/H2QfbWOG7/gLtQBdACe5jitlvvdEZQB/PP6SRB7MJVWKgFMAoMTJOZG4nYH28aqybiQIA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YiC4M/BPUhv6OcMqTtdXlmrjL5450EYD58vet2ZVT+5WQa7cu
	JqIXBH/459j4os7U2e+kW7f9fXWE0PTJ0CueaKIVBSP1EqxEIFLobiRo
X-Gm-Gg: AYBFou0pjo9wGq6/AdqoeoUIHZVqES9JSZkwye5PNFqxy8eoc0BZLrHnFdjNDQgc01z
	8aBXSoOKu1emlwV5+Y7Ch/HscsR19YoKvTfSXWU2GrithKR2hisyMOMzPLTn4HnIZjYzHXJo2rH
	bANdv5Fu0s18WWBt7Z8z3zjsB0vdTRtYIbF8xcifQfGY8xpRypssjB91xKUb8tYRzUSTY8kYbnw
	d6iuqrH/t1aJBUo5d75Gk5UDg7r0B4qRzyRPQgJbqd5TCV/WzXOm7SDJOX2GMy0h4gst4fz7woA
	9jj08YIO6gJOqC/5q09JeepRoZW7hHn6w+pE7IdcZMQz2y5xXmMHiIgKuzfcHAuwQZtzAcr3nop
	VGYB7+cl3VDUdem68WM//DtZdqrRAdU9/zweHNfD9uefiZpx4jQIdoX3v3OzEvqXitNV4PC0Jce
	SRGGPxSmTn6gOXMPXA3l+yTjhR4tqUvPdll3TH6i06CZBYSi2UNkotqPAQFfiX6mstsBgff071y
	2zEoKftQAuE5prNsms7kgupvzCu9gyJ+RQN8lCW1t520HPa7IdlDO2ApbzlBDnyOs9qVolhpcpZ
	F9fwjqtnEliibQVVDUE2vxetAiY5kZ7Z7M/3FyUHA8E3+4sosSlRV1mchfVevSQcg8yzf3gYe9K
	rDrWyYKJQOfSrjPSBZY0eoeKewQnBxQnh3uvgxz7c6mU2U2SHZToapHTkqkkool8uaG8AlUVMTj
	oQRc0aU6ASLvDSTpvuBG+/XtGTgBFMBztQd/s=
X-Received: by 2002:a05:600d:82c6:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb55c5f5f5mr21265355e9.7.1794532427325;
        Thu, 12 Nov 2026 17:13:47 -0800 (PST)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a440-c701-58be-494d-aade-0870.310.pool.telefonica.de. [2a02:3100:a440:c701:58be:494d:aade:870])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55acdccfsm21838685e9.8.2026.11.12.17.13.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 12 Nov 2026 17:13:46 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Song Liu <song@kernel.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tracing: Keep preemption disabled until the recursion bit is cleared
Date: Fri, 13 Nov 2026 02:13:33 +0100
Message-Id: <20261113011333.20813-1-kmehltretter@gmail.com>
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

Function tracing can drop calls in interrupt entry and exit code, such
as irq_enter_rcu(), because it wrongly detects recursion.

trace_test_and_set_recursion() sets the recursion bit before it
disables preemption, and trace_clear_recursion() enables preemption
before it clears the bit. If the task is preempted in either window,
the scheduler's traced functions find the bit still set and take the
transition bit meant for interrupt entry and exit code. An interrupt
that arrives during one of these callbacks then finds both bits taken.

Disable preemption before setting the bit and enable it after clearing
the bit. The preempt count helpers then run outside the recursion
protection, so they must not be traced.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Patch 12 of my larger RFC series [1] also moved the RCU check and the
trace_recursion read. This version only moves the preempt calls.

Assisted by an LLM.

No Fixes tag. Most callers had the same ordering before ce5e48036c9e
("ftrace: disable preemption when recursion locked") moved the preempt
calls into these helpers.

The preempt count helpers are __always_inline, except on arm64, where
inline implies notrace and Song Liu's series adds an explicit
notrace [2].

Tested on v7.4-rc2 in QEMU TCG with PREEMPT, PROVE_LOCKING and
FTRACE_RECORD_RECURSION, running the function and then the
function_graph tracer while forking processes. On x86_64 and arm64, a
test module also sent IPIs to a CPU inside an ftrace callback.

Calls dropped as recursion, two boots each (function / function_graph):

                 v7.4-rc2       + this patch
  x86_64         0-12 / 14      0 / 0
  arm64          4 / 6          0 / 0

This also reduces use of the transition bit, which Steven would like to
see removed [3]. The remaining users are mostly interrupt entry and exit
code, which the early-hardirq series [4] is meant to cover.

Functions on other architectures that needed the transition bit,
whether they got it or were dropped, counted by a test-only hunk:

                 v7.4-rc2     + this patch
  i386           123 / 123    13 / 14
  ARMv7          118 / -      3 / -
  riscv64        115 / 116    17 / 18
  ppc64le        84 / 90      6 / 8
  ppc32          67 / 89      3 / 5
  mips32         76 / -       7 / -
  mips64         87 / 107     5 / 7
  sparc64        70 / 87      3 / 5
  loongarch64    114 / 119    11 / 15
  s390x          15 / 19      3 / 4

FTRACE_STARTUP_TEST passed with this patch on x86_64 and arm64, and
gave the same results as v7.4-rc2 on i386, ARMv7, riscv64, ppc64le and
loongarch64.

No result on PA-RISC (crashes) and sh4 (does not boot), or for
function_graph on ARMv7 and mips32. Baseline v7.4-rc2 behaves the same.
s390x traced only scheduler and interrupt entry functions, because full
tracing stalls under TCG. csky, microblaze and xtensa were only built.

[1] https://lore.kernel.org/all/20261022051654.79224-13-kmehltretter@gmail.com/
[2] https://lore.kernel.org/all/20261023011049.1164625-1-song@kernel.org/
[3] https://lore.kernel.org/all/20261015084821.3fcf69bf@gandalf.local.home/
[4] https://lore.kernel.org/all/20261028033127.82193-1-kmehltretter@gmail.com/

 include/linux/trace_recursion.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index e6ca052b2a85a..a7c66313bf360 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -132,6 +132,8 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	if (trace_warn_on_no_rcu(ip))
 		return -1;
 
+	preempt_disable_notrace();
+
 	bit = trace_get_context_bit() + start;
 	if (unlikely(val & (1 << bit))) {
 		/*
@@ -145,6 +147,7 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 		bit = TRACE_CTX_TRANSITION + start;
 		if (val & (1 << bit)) {
 			do_ftrace_record_recursion(ip, pip);
+			preempt_enable_notrace();
 			return -1;
 		}
 	}
@@ -153,8 +156,6 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	current->trace_recursion = val;
 	barrier();
 
-	preempt_disable_notrace();
-
 	return bit;
 }
 
@@ -163,9 +164,9 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
  */
 static __always_inline void trace_clear_recursion(int bit)
 {
-	preempt_enable_notrace();
 	barrier();
 	trace_recursion_clear(bit);
+	preempt_enable_notrace();
 }
 
 /**
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb

-- 
2.39.5 (Apple Git-154)

