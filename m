Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FAF480331
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277906; cv=none; b=PZDmOgGHYvyTPSE6TMBdqESIDO8q3ucFF+QJ1Du2xS81elDnF3KjTjadLp8BC4ZR6hQIHcOiuRhTjCFlGoCyPL0RX1SFbvE3Q7/h9Juoyk0YFS7NpgGzgqnHx6Dl4q9YJEC/K7GyHjvdZhAfq3VTZPESY/FnuoSAsGB/GgiL+rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277906; c=relaxed/simple;
	bh=0l/w5tN2A38HPGlHiLwd7qatVD3lZl65FFQ5OYFdE2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGHXzK4M5+V6KnwBSP2IwVldCtvYHqoxcNy4gAnTeZfOM5pNs/pKO0QV81jxCdESFbUPfLlHVnCP8ojbBuJfWHjIl+jFPN/yiv3sujsyWFppw+QGwqobCmJiKXMIj31f9/V98mg8DR+2DR2nfmsfymHrZJH7ztrpv4XRe+WY89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZtBDCPf; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZtBDCPf"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-836c4474028so1370397b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788277904; x=1788882704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVlIvJYsDfLaLhbF9XSItAArvjEznVn+8uAWoRZuxY8=;
        b=KZtBDCPf8MZp8BiZR9lk7nPsYqUu8C8D+YYX7Tu2ISJyADwZ9PlC1iN+T+40zkqaiL
         zFDxI36mmr6ljS+fxoIPmE6aT70eskhjOkedKwMyJPT+zB0m0omm5Mk7uNNrK4m/MCNU
         zP1nZvAekiSFatEsBRlaxTFWs3eHEeOiXwMh0/LkW7R8/Drulx6hdrbBCQmRV79OUq/x
         wz/iW0ZsjTbcPkZ/pzVQtwAIaY/S/cIpC9cij/eI2AcJhzxKikg3sy5PQeJuFD/qq/eB
         yZ/wPZB2XzgW/XFg3MKZWDiZ8peO9KqTbnjkUWMAYKve7FVJwxcc7ygzLre5yT7LIRqh
         YJSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277904; x=1788882704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XVlIvJYsDfLaLhbF9XSItAArvjEznVn+8uAWoRZuxY8=;
        b=GARd7D1ZrGNglRzrLrg0A1anAbhiUjGpjMkGByPHrgMeVVSS8lQcK5Z5Xhko5b85lH
         Ym08m1BJE3PPT/C/hW4O15gRoMB0O804zAwpMm7Y1LQ7oxyhd7Z+qQQDkbnBHXFGE+84
         w0rSqGjStalDzUMPQqmu3NjoyUBfyVxG+7mvHbkmt128WkInI0sx6auHnbCAFFa8PwNW
         xDcQnStumTxKyW161jYBFUFlPYUozTrplmPuD2achGbmEz0nAeQdhgVUjQqAFwtEgtSK
         xp7xcV/bPHFR0tAxNuulUQQmBkCtBhn/Mp8D0W3rc60FUCPC6/RXPESLJtRXovA+zfHL
         d+Ug==
X-Forwarded-Encrypted: i=1; AKwUvBzSfzGPlHN52An8FdHfup/rKe9UWjmCYhKUhCwwX5R0jjbui9BzRQqSomlkg2PxGOY0cu0qYMuTEKvZow0=@vger.kernel.org
X-Gm-Message-State: AFuF++kC2PEQi3sXpbodpjLfC3duE0lxaX+g8UZd60VK26f/Z9Tif6el
	YgPIqvZYo8H2fMD/P+cHp0fTSPPS3NN4HoSvvt8LfGFUvqtHp5OO8TvA
X-Gm-Gg: AYBFou37s5sj6wfKEdHLd+5Rz1l6QjI+GgsQcv052W3EfNUmHzAQzJaNFJAvIEchkEM
	VD4H3Tbhqgaq9xTUTpJHtS7Zat4qwgH6X6kI30OI8InMlOc/t3br8sa+yAtEOacaig1m+/DHOFT
	enDJOknr86FmviftiEm+Vw2KKG8WeKSG2JXCW5GAalPusWrxuIzLKYFEXguWeahyl4KN1AsYQPy
	2W2krO+r3L2973eaC2stInhhuxvIBA/YIeNtdQ3Ly+tCHeyXSRk5NYjZu5d5DWdvhaVuRgwaaWn
	aVyRRr4lPJ9Oiq90UM0R1w0expq49YJ8O8PHDNrAw2NOBSfyDJJGUxD2SkLVaiQGPY3/XgxH2Vw
	2emDr4BQbE0qf+cobuxmXV3IOZ+PpDqappyTsRrkL6UTjZ+YSvZAjc7Uf7pQ6+dFdN5Qr6lm225
	Fjn+qgZ1l0wfOMMoPwFsWiJaAWNYTi+hLSGucE3THB7RWKhvvOA31LfEGHJmQ8DRdPqrf2CcKI9
	qo87b6FolN390exPNfA5+8r/iqFR4kjyLYtOYe/QQTe6fFj9fI=
X-Received: by 2002:a05:690c:93:b0:862:65f4:c8bb with SMTP id 00721157ae682-86265f4cb64mr81586877b3.3.1788277903439;
        Tue, 01 Sep 2026 08:51:43 -0700 (PDT)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-85e58666e15sm77368977b3.0.2026.09.01.08.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:51:41 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
To: linux-alpha@vger.kernel.org,
	richard.henderson@linaro.org
Cc: linmag7@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/24] alpha: select SYSCTL_EXCEPTION_TRACE
Date: Tue,  1 Sep 2026 11:50:31 -0400
Message-ID: <ea0081603ea4f745e7c10895e83a1cfb4e80baaa.1788277742.git.mattst88@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788277742.git.mattst88@gmail.com>
References: <cover.1788277742.git.mattst88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report unhandled user faults the way other architectures do, and hook up
the debug.exception-trace sysctl that controls the reporting.

The message gives the faulting address, the PC and the user stack
pointer, and is rate limited.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/Kconfig    |  1 +
 arch/alpha/mm/fault.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git ./arch/alpha/Kconfig ./arch/alpha/Kconfig
index c4b4a9b8d770..4c60c442207c 100644
--- ./arch/alpha/Kconfig
+++ ./arch/alpha/Kconfig
@@ -59,6 +59,7 @@ config ALPHA
 	select MMU_GATHER_NO_RANGE
 	select MMU_GATHER_RCU_TABLE_FREE
 	select SPARSEMEM_EXTREME if SPARSEMEM
+	select SYSCTL_EXCEPTION_TRACE
 	select ZONE_DMA
 	select TRACE_IRQFLAGS_SUPPORT
 	select ARCH_WANT_FRAME_POINTERS
diff --git ./arch/alpha/mm/fault.c ./arch/alpha/mm/fault.c
index a9816bbc9f34..dfe427d93072 100644
--- ./arch/alpha/mm/fault.c
+++ ./arch/alpha/mm/fault.c
@@ -27,8 +27,32 @@
 #include <linux/uaccess.h>
 #include <linux/perf_event.h>
 
+#include <asm/pal.h>
+
 extern void die_if_kernel(char *,struct pt_regs *,long, unsigned long *);
 
+int show_unhandled_signals = 1;
+
+static void
+show_signal_msg(struct pt_regs *regs, unsigned long address, int signo,
+		const char *desc)
+{
+	const char *level;
+
+	if (!show_unhandled_signals || !unhandled_signal(current, signo))
+		return;
+	if (!printk_ratelimit())
+		return;
+
+	/* Losing init is fatal, so shout about it.  */
+	level = task_pid_nr(current) > 1 ? KERN_INFO : KERN_EMERG;
+
+	printk("%s%s[%d]: %s at %016lx pc %016lx sp %016lx\n",
+	       level, current->comm, task_pid_nr(current), desc,
+	       address, regs->pc, rdusp());
+	print_vma_addr(KERN_CONT "  in ", regs->pc);
+	printk(KERN_CONT "\n");
+}
 
 /*
  * Force a new ASN for a task.
@@ -217,12 +241,17 @@ do_page_fault(unsigned long address, unsigned long mmcsr,
 	mmap_read_unlock(mm);
 	/* Send a sigbus, regardless of whether we were in kernel
 	   or user mode.  */
+	if (user_mode(regs))
+		show_signal_msg(regs, address, SIGBUS, "bus error");
 	force_sig_fault(SIGBUS, BUS_ADRERR, (void __user *) address);
 	if (!user_mode(regs))
 		goto no_context;
 	return;
 
  do_sigsegv:
+	show_signal_msg(regs, address, SIGSEGV,
+			si_code == SEGV_MAPERR ? "unmapped access"
+					       : "access violation");
 	force_sig_fault(SIGSEGV, si_code, (void __user *) address);
 	return;
 
-- 
2.54.0

