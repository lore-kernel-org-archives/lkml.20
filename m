Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6088B4C10CD
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792333337; cv=none; b=Mw7OebZJAfnlXOn+qeegCPYTHyL0EPq9PKZ16qkkc/XgJe7X8SP7br4O/JMQ1uHfHLLKmx1VB0ZmHAPRhx49BUHu3PFtzmchsjSgzrS58AZhWPH1r9FaK60pHHZ/Ri0tajo/8fW2IvFm75I1l++JcTDmtotuUqgNiQNw1I8hQow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792333337; c=relaxed/simple;
	bh=3hBEoYmujIN/lIM+LWmpcdreauHJLGhIJOlga1pFDNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+2UXayBVZjhkfvcPwO/d5yczZKBgIeicADHSQA1dS4tpBwYYJbRt9w/8Mcs551PfSOhQljC6OurPbwVt+s9/vOV7vS8UJ5xmWqn9kFTojHXYggq0/heOlhiOsLEGhH6NJn25UnLa9jUj8BxvWlI2i3bsq2BzBa46x7a712CDtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eKuopU1I; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKuopU1I"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-6767d92cde6so1459584d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792333335; x=1792938135; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8OpYwKY4k0JzilSveCfUGKhXNAVuzUj6LeYu6BiAQs=;
        b=eKuopU1IGP03p8Xua8yrk/AbfC5a0W/QZ/fCtFLWnnuF1xJUevvFV+cM8hKK3OA8lN
         h3RFUfY4iuAEG0vko5PVQTddCc8eJhXYs0A3dscENbJ3KOeLg6Z/yYhnjqj/L/1wIKa9
         xfz/B4rFxdbY7ris6EdrrOFFk0oVe0jizVURL39N5M032keW4MfNtOgSuCfPwDHMyOE0
         +99HVF8sta9mgpXE6IP5XlBNykZtMPUi3uPIER7ANf6hicGU431OGh6vhOrK1Sy7/3hf
         oHHjkiwi1ZZQn5eGcU7XmODwNwhxFdvSGezLMs2+UwXQT+NEv6lVrgk132UGzr6GmVLq
         lNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792333335; x=1792938135;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8OpYwKY4k0JzilSveCfUGKhXNAVuzUj6LeYu6BiAQs=;
        b=en18NGHRA5Hn0P2u4M6+7pZEaiYD/LbvkDO9PBw4baatTQdvwealAs5nZz7zx8tEXb
         8srWU3Ro8cavVcdvoKOdEW7aaUO9vt2nb2ejlggsjYc5AuMSTFmvH47q1h3Pg6mr9/Oq
         DNcHW8Vdeu2nmXRa/bpPiuzP+cciGuz1mKfiAQ3soBuZxc0cQw+sgYUB9N4KFmZKTDkZ
         J1znCUVp8Zn+Cj+h3mClAmB5w+6g5xDglijauBenUb+bdGy0S3iYCrEPRaOFbe3zNpDq
         fU/w/DuQi2bU06hekMwu8TaQA4s6jpgDVE/mUkunpMpoOdtbynBRkFlljGjHk/vYi7hi
         cQGw==
X-Forwarded-Encrypted: i=1; AKwUvBzP4HhNO6QzpdEAmPez8vhN83rdEildxfN4TawSTS6QFclFgfBQ4K/OMtlitm9flHHuVHpQptdM7Pqfq8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9g3kkQlpNxrESh70AKk4tr9WE590yOQKpZqbkRezL89/wxxH+
	yv4eW/1jT79/mHZk8l6N8TYwm3lJCW0QcRIOlunt0vS5bTknXitudrhe
X-Gm-Gg: AYBFou2i9ADwBbtljfzNmT6ZdwCAAOF5nqyFtHYrFqHmeDKvGo3uQZ0iaUT9G/SjWx7
	f5FXhAvPoVZ4U+YnmHzruW4czBNCpTHNLqMF+2YBAL6sqM+KtcjSkpQbcMk5+TC+mwY+BdqDh6A
	ojdmu2WUcBoWk+Rps/8nzx+U3eyBFDoMDCygqM71sjBYNq6cbxK2Kf/kXC/yiXtWJeRLFAWF/Y4
	CnO67rADB7CeBMhW5j+YL7UQkqKojCsXwRrZ3GsWFtOKjeX8XqlAnzu1F5uVXvmQw3yBMhe+pIY
	sZOxJCYUWaXi5eKsLcx8cp+JMsStkGNwHaOXsZGI6VgzRsqCguuRFfOPv5nHxbwbst8cOKPe3T7
	eDefOwmo2VdQAhN7X5R4MvakaDBYzoYV1uY7J5o8vgj8bFfuUySnzFVyjAQSXv+4ZozDaZRvZFw
	7Y8oIBX+ewjgKz2aDBpvzNI6moRP87ioYc5VzeuzXGjs+lM8KHIHF1FJXVWuYUBvi3mj8b6Pu7C
	rJKPecTAkenUMnyL8CGbMNoHgfktmJIdGQl2KKhzeYWjSEy49yZ+xXZe/3Kt3RfCdmwPjQiKVUi
	Wf+DuWpBfrjr4QCsrJLQcqKv/RO2
X-Received: by 2002:a05:690c:4d84:b0:8b0:8a9c:fac9 with SMTP id 00721157ae682-8b0f2170e34mr16917187b3.28.1792333335205;
        Sun, 18 Oct 2026 07:22:15 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58e0258sm30708737b3.26.2026.10.18.07.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 07:22:13 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sun, 18 Oct 2026 10:22:01 -0400
Subject: [PATCH v3 1/5] alpha: fix stale user_stack_pointer()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-alpha-perf-regs-v3-v3-1-52be85332c57@gmail.com>
References: <20261018-alpha-perf-regs-v3-v3-0-52be85332c57@gmail.com>
In-Reply-To: <20261018-alpha-perf-regs-v3-v3-0-52be85332c57@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=3hBEoYmujIN/lIM+LWmpcdreauHJLGhIJOlga1pFDNU=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLKuXON8d2G9rfORfxuXS0juvBia8u+1Q8d3Z6/TOn739
 V5ZBOQEdXxkYRDjYpgppsgSt16RZVbbjqU+p6V/wcxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkCGjlE8RE6PQSOzuLg0tUg3raDIIS+/JLEkMz+vWC+/IDWvIL1ALy0zrSQjI7+oOBVohF5eaom
 pq6ObkaGBiaWjhZmThaOpibOzk6GTm6Ojs6uTkaW5iYGzpaOJq6U5AxenAMw1278y/A+SvtLl9z
 F0zv32tf4NTo3/Db/wLqhsyA2X8tJQbu71qGL4XzA53prLtT2LN3Wpq+erVVfOa2ZNzfDySl38K
 Hd+p84nLgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

PALcode keeps the user stack pointer in the PCB, not the trap frame, so
pt_regs->usp is only valid where entry code stores it: entSys,
do_entArith() and do_entIF(). Interrupts, page faults and unaligned
traps leave it stale, and ptrace and /proc/<pid>/syscall read it
through user_stack_pointer().

A user-mode pt_regs is at the top of its task's stack, so find the
thread_info from it and use rdusp() for current or pcb.usp otherwise,
as KSTK_ESP() and the regset code already do.

Fixes: 8a2857bc2b30 ("alpha: enable regset-based ptrace and core dumps")
Assisted-by: Claude:claude-opus-5-5
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Ian Rogers <irogers@google.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/ptrace.h |  7 +------
 arch/alpha/kernel/ptrace.c      | 12 ++++++++++++
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/alpha/include/asm/ptrace.h b/arch/alpha/include/asm/ptrace.h
index 430e8dc27ff7..45d1229344b6 100644
--- a/arch/alpha/include/asm/ptrace.h
+++ b/arch/alpha/include/asm/ptrace.h
@@ -26,12 +26,7 @@ static inline unsigned long regs_return_value(struct pt_regs *regs)
 	return regs->r0;
 }
 
-/* Helpers for working with the user stack pointer */
-static inline unsigned long user_stack_pointer(struct pt_regs *regs)
-{
-	/* Valid for user-mode regs */
-	return regs->usp;
-}
+unsigned long user_stack_pointer(struct pt_regs *regs);
 
 static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
 {
diff --git a/arch/alpha/kernel/ptrace.c b/arch/alpha/kernel/ptrace.c
index e1d8c2f69688..dba7e9905cfa 100644
--- a/arch/alpha/kernel/ptrace.c
+++ b/arch/alpha/kernel/ptrace.c
@@ -440,6 +440,18 @@ ptrace_cancel_bpt(struct task_struct * child)
 	return (nsaved != 0);
 }
 
+/*
+ * PALcode keeps the user stack pointer in the PCB, not the trap frame.
+ * A user-mode pt_regs sits at the top of its task's stack, so the
+ * thread_info is at the base.
+ */
+unsigned long user_stack_pointer(struct pt_regs *regs)
+{
+	struct thread_info *ti = (void *)((unsigned long)regs & -THREAD_SIZE);
+
+	return ti == current_thread_info() ? rdusp() : ti->pcb.usp;
+}
+
 void user_enable_single_step(struct task_struct *child)
 {
 	/* Mark single stepping.  */

-- 
2.55.0

