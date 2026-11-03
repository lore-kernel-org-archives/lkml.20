Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674927;
	b=Sr1+yN7Q5R1r5HA/pODGpxDStguVs+SjcSFYIFTyvdtlukrHcoZzt80YZsbgtPoKcWeh
	 /jNeZ/uK1g7AEnAXKwxsankAF/smhoZU9JB1G+Av/f3X7EywcJPwr5T6UXKa9P7O71gj4
	 VfQK0dgusXRptrtPRsEX9lcNGhE2kUyafkK56oLqfaP+8NemRH1MfakJiwygNc49w7Qqe
	 SY5XQvXkT2xgBk1yEHD79TOKVawm6oyeGu5fFb9jlhyf/Ab45hq5KSSo9lgE0ZBFg2yOE
	 H5B+1x/XhTgh8A673JenvCSHxvJJNinBUyZyDXVfrh1acZHIwP9a07tNXSSLvFP+MtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OGPOS8a/gMzDgkVkZsvuazR6ZsFinnPxcukENTgqxQA=;
	b=0ejV5NBh9x77j5LRj4YTmiSHfi4NJqkuQbJTXFmHQlnLO9qZpUYsRa0uWt0KXYXXc+W5
	 XOgNTFYvfxrwvAR54839eEysjRe225f3fx0ehYtQ0+VZ357UnJYEABMDk+osEGjMRTCwU
	 ym4R4s/bmRgheeUb3S7t8KpPy67pOqQHls/8oVN5o4WwGmawblgvtf2UwwCiVvtOydwcq
	 WQINGGBiFa+g4pj/MIcUxjP9Ag4Ce02UO9LWymn/VO1vpioj5TYhzPEgVtPczJVwPP7Vh
	 1jjWwUlSX58cFjmCUFr/HZj1YqH7jy2RP+2cXbA9HnIUUFOzXNKXXqxH7ByEGEu+vwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxOEOGKq;
	arc=none smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D6B606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D6B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxOEOGKq
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8ac9d666d4eso33539417b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674926; x=1794279726; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGPOS8a/gMzDgkVkZsvuazR6ZsFinnPxcukENTgqxQA=;
        b=yxOEOGKq28VdK0l2tjpfm7Hd7ddXHnV6YxClbgjmwT5KIp1bVgeqbPwcMsKOtKB20R
         lUJIjBcj9cblkJ696K+V8nWdrE9Kxx+lljVVofqappvyII8OE3UGg/WeBAr5ouwho0+B
         cxYM65Vt6ewORuqmt2nn8X7Iuw4nBCQTpbhS9I6esTlWFi4Iq74xD1YaZtwXP4LIOEVa
         Y7o61M/8WnkIaKulVc+q49IkHda3sK9u1fVV3ybBq3kX1fyepWl7bCnYPBKy/QtghUPj
         vwmvh7RdOwEjX1D0YxLq+CZ+CRwhqDG82thVruxaJlKVXf+aN8dW+gUanprly0aggbBy
         JbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674926; x=1794279726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OGPOS8a/gMzDgkVkZsvuazR6ZsFinnPxcukENTgqxQA=;
        b=hodw5e/SKLgjmx81tUsCW1hL1QYexA9f+csgdqiNvWJ9Qsmfnzy45gULNsLX5YVQJf
         mqcfKdaKBTTlm0csMBRPGIF1zFTwPL0QQ3lSjzvtDSpIIB61BjCTVP+8F1fwBxK8Hcrv
         j/g9WVX2k/njX580lyXWm91by0EeumUYvV7JvDAuHzvNbqAofM2Op+eca6eJ5I9xZWtJ
         7U6uKsZ6NX/Kc/D900PsrVkhcwq7JJHjQEO0CY6vY9t6mRGxIc5tyWH/hi+YbtnGJ8oF
         7PwRNCHnaDiObUIXR8bEcJ61VqUaakifyRe60PPTkTWRUxVCSA9V9CcI39Jnmy3jEIGN
         xvCA==
X-Forwarded-Encrypted: i=1; AKwUvBwlcdEOOVcStEuYUQMRVZ/HzeWnT2xyqQXM899WWLD3WIjCvovuoaUvSSpG4AIYYxbOTpURXpZr+TbTinY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3bjc0tlq30VUMsiZw8YN+SIdLBQQ+iMkovip3icjK9ciXKTXu
	bvqoM7mM1rH8DsJN24A3G/EoLGKgiiZ8b87Cm+nt29sribgEwjkWuR/X
X-Gm-Gg: AYBFou25gksp/fsgSfPIESF4UURBm0noIiBnX+TQnMEhxsb9itAUf75zojxjFYxfNMb
	H5gvA1T0l8VGIo3DJWR5nQXTbs53IYye3e38pgvsWoibKO/rgSU5isUPokZoNJVlM46x32Y8QPs
	bCmP31yHeXKwuEdrUnjqlNrsjefWUYXDWM5OaKvZirGuGn71hxhI7f3GlxSus7c1LlRzrrXqRrF
	YjTzzapRK3UMHReykb30d5HbXG+nA0TloIAltEjX+62yVwOfMf8kzR2JRLgn37Dz+JTUFAj9Lbv
	kIEKp6gbbWuOb5A3xeU2PnopRLkOnynb02UpjcazTcjSqjWpeMopydr9GV7QjeyYn3b1khjWwUQ
	5KAhgkO8L6AM1B6nOFNx6upqzf3yGiR8xCDhHlU9V1oaIiuK6DonnIIa0IDs3ZLtQ5v3wdiMOqG
	v6Egts1U5pRBL5CcXwrp32YtklhrrHer6ouk5fcxO8ZH4Pw6t6zITCt7p32WIVeWqAaNEnmYukS
	6flIkOvyAhFnvLgg+yfUPmuSOdlZqCt6V14++dyYhHcFvJKI8A4Q8xbmm8EpAtNCfX/7cHSYzSM
	bG7KgjypV6dEKJeRmJRRCdROFfM+vbdCaqXepCet9pgYNuzJEpWpHQius4mDZ15EBnmd+iLwH0s
	EMSHi1p4JBA==
X-Received: by 2002:a05:690c:c105:b0:8b2:91eb:c0e7 with SMTP id 00721157ae682-8b2b6728887mr62857767b3.42.1793674926384;
        Mon, 02 Nov 2026 19:02:06 -0800 (PST)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf26e646sm6225067d50.7.2026.11.02.19.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:02:05 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 02 Nov 2026 22:01:59 -0500
Subject: [PATCH v4 4/7] alpha/perf: do not report user registers from the
 entry code
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-alpha-profileme-v4-4-61e00f5e1da8@gmail.com>
References: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
In-Reply-To: <20261102-alpha-profileme-v4-0-61e00f5e1da8@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3780; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=jNR7O2OOmkFHrngjpChvruYJ31B4frktZDdtlTtO574=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJe+i3e/Svy+ouGljXCs+rez9/JKtqYLjwlWc1IULqo+
 t48D83Yjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmKQvD//Drx8QKvt
 x1L/j95UlAT3aRWxdfQ4bQ9spz6U324esjFzMy3JetqZvZu7NkvdvxxlR39YQ9jPJ/Mgpsq1l4y
 5/nH2dkBgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

perf_get_regs_user() returns task_pt_regs() whenever a sample of a user
task lands in the kernel. But exception entry runs with interrupts
enabled, so the sample can land before the entry code has saved the user
registers. Only the part PALcode pushed is valid then. An interrupt
taken on the first instruction of entUna, say, pushes its own frame on
top of PALcode's, which overlaps the rest of the user frame, so r7 and r8
read as the interrupt's r23 and r24.

Report no user registers while the interrupted PC is in the entry code.
Such a sample also gets no user stack dump. The range is all of the entry
code from entInt to the end of the save in entSys, so it also drops the
registers of samples that land after they were saved there.

An interrupt that nests on one taken in the entry code still reads the
incomplete frame, as its own PC has left the entry code.

Fixes: 9280e99d87dd ("alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/ptrace.h | 12 ++++++++++++
 arch/alpha/kernel/entry.S       |  9 +++++++++
 arch/alpha/kernel/perf_regs.c   | 13 +++++++++++++
 3 files changed, 34 insertions(+)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 45d1229344b6..1400ba3e7d43 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -14,6 +14,18 @@
 #define task_pt_regs(task) \
   ((struct pt_regs *) (task_stack_page(task) + 2*PAGE_SIZE) - 1)
 
+/*
+ * Whether pc is in entry code that may not have completed the frame at
+ * task_pt_regs(). See entry.S.
+ */
+static inline bool in_entry_save_code(unsigned long pc)
+{
+	extern char __entry_save_start[], __entry_save_end[];
+
+	return pc >= (unsigned long)__entry_save_start &&
+	       pc < (unsigned long)__entry_save_end;
+}
+
 #define current_pt_regs() \
   ((struct pt_regs *) ((char *)current_thread_info() + 2*PAGE_SIZE) - 1)
 
diff --git a/arch/alpha/kernel/entry.S b/arch/alpha/kernel/entry.S
index 790389a15c3c..b8d7804e5aa3 100644
--- a/arch/alpha/kernel/entry.S
+++ b/arch/alpha/kernel/entry.S
@@ -186,8 +186,14 @@
 
 /*
  * Non-syscall kernel entry points.
+ *
+ * Between __entry_save_start and __entry_save_end the frame at task_pt_regs()
+ * may not be complete. perf uses these to avoid reading it.
  */
 
+	.globl	__entry_save_start
+__entry_save_start:
+
 CFI_START_OSF_FRAME entInt
 	SAVE_ALL
 	lda	$8, 0x3fff
@@ -479,9 +485,12 @@ entSys:
 	lda	$8, 0x3fff
 	bic	$sp, $8, $8
 
+	/* PAL_callsys does not save these, unlike the other entries. */
 	stq	$16, SP_OFF+24($sp)
 	stq	$17, SP_OFF+32($sp)
 	stq	$18, SP_OFF+40($sp)
+	.globl	__entry_save_end
+__entry_save_end:
 
 	mov	$0, $1
 	lda	$16, 7
diff --git a/arch/alpha/kernel/perf_regs.c b/arch/alpha/kernel/perf_regs.c
index 33ea2e831ba0..894683851b30 100644
--- a/arch/alpha/kernel/perf_regs.c
+++ b/arch/alpha/kernel/perf_regs.c
@@ -59,6 +59,19 @@ u64 perf_reg_abi(struct task_struct *task)
 void perf_get_regs_user(struct perf_regs *regs_user,
 			struct pt_regs *regs)
 {
+	/*
+	 * Exception entry runs with interrupts enabled, so a sample can land
+	 * before the entry code has saved the user registers. PALcode has
+	 * pushed only its part of the frame, and the rest may hold an
+	 * interrupt's frame. An interrupt that nests on top of one taken here
+	 * is not caught, as its PC has left the entry code.
+	 */
+	if (in_entry_save_code(regs->pc)) {
+		regs_user->regs = NULL;
+		regs_user->abi = PERF_SAMPLE_REGS_ABI_NONE;
+		return;
+	}
+
 	regs_user->regs = task_pt_regs(current);
 	regs_user->abi = perf_reg_abi(current);
 }

-- 
2.55.0

