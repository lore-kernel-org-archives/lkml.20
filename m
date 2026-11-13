Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794532052;
	b=WxURJjCIEvdPV/QvmvUZsEytgPeU+2JckisDzm32LTTiq911yKXKoXUbpQKLvbRvXz+Y
	 PdGCzALD7ouMgo1na5DvXqaD8F1O8l3LE3nK6lnGSOFaY/Ii2KcbzCA1IIfGB50+03vdO
	 rXzPzvsO6pvmatXhkeUKVSboSzd5qirhTO6lnNggiBiGlccjaFQcu2wt4nsWa9G8QD8KI
	 VaxsjyWrp9Cgzm0i/EgBCK1k+m5wNRtoccYSuPLrrepxVq3VyU7qpJCA7WelQg/Vv1abP
	 zg4lon+xVoVc3Y6Au/7dk8NG5mI+r2TmuyZJUWheGnzW3g1tspgAIGWCkzNW8EpYdAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y5dvtWN48Of2Ff8r0NZmrMSivJ/dH4bQ2NUxOe+Y+iM=;
	b=dEDmjE890rJ0S3FVxCOL6ktTC5sjGT+Bzg0CxZEzTWVsf8rgqqNubOwhewyBNp7kOP32
	 EQnMAUK/p/HmmjwcC7xBZ1UkTGv7BloBRfZEyf+LB1ckCpQZdybLX/S/2tJJB/e0j1fvD
	 hjs2t7OTQsGaCbWeviHCHqhhTSBDSfLj4fBG67+4ImUD/+q+AVP4LQPD+g+I/wV8hutBD
	 M0OzVwVx+w69udA0jF7ujOXVNuAcV7nowD6Ky4Z8tS7f1UylMZfbCqgL6F6txLX2y5lsa
	 ltr3hJFGF/8U5S4h11A1/+Dw63NUP+CHjAXwU6SXLn78KE9uOl1qyjLCVr+Q3IrYFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alUUlNLL;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D7606A334
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9D7606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=alUUlNLL
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3accd1ff4c3so4511251fa.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532050; x=1795136850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y5dvtWN48Of2Ff8r0NZmrMSivJ/dH4bQ2NUxOe+Y+iM=;
        b=alUUlNLLM4r23MzLGD6KSTwEjevaMWDBsZLRG3xpHOzByGGDfvG4Xk6K14kt9Sec/H
         I3rPYaJMhd67QjqEPCGq7qLBm30ePI2bgEBDuMDSRaYDDqQzrsb60JL77yR8lkxcvWc8
         2DC53lioLkxmqVK15Sf+Goxgqs4M2zOAan1FxU7PUGsdmwsonR/oF72DgKtpx1zC58qd
         RhU5XegWfbQRLn/hGCAc1XHwayw8DaWXC1YgY9LKA4pqa0dATyK9KpD8LqMM/ap6TlpV
         FCMUMeiBHVD46maIEjqVm7wWtwZeaOUf3IlKVYMNril7KkdaOaThhJeAK5EkzG83q3Av
         ZDQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532050; x=1795136850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y5dvtWN48Of2Ff8r0NZmrMSivJ/dH4bQ2NUxOe+Y+iM=;
        b=13px/IhPNSt1eSJWz+ivYP+/XJ4lYwK2VjeNhHMm/B4ei2rmRZ9p2YRT0XkybcQrqt
         KSwCTj55e04hlkj91LtaheY80bBqEQ88yKeU7XzGxytDb+yUt8Z/hr/HUeT50Bt74i4/
         z/JyGTNK/hX0QE/rwcP3R80EYN530mymUxHWzdqV2mqXpaqN0/X4UQtFUL3CTkEAlEEO
         ol4J35DjoJm/gOxgbqGl+2zNmHyB+aGoY0b/5KgIltM7e27fiKrF/Vv3f8qfVQI95BHJ
         aQExQ0HlJr2aoSWMA0DQNLHGBuEc/RJftVlEDNvxRac8V4HpGGLWurKnHlZbUQlv/WQK
         OsQg==
X-Gm-Message-State: APuU4Z/Nm/4YHckMoTWHMZydoL5AcSZz5kiscFxCOwoIEULJlFzR0i29
	eBBa5S3Io80E/qb2LZROQ/98nrYo2cvAM4ld1x/qpZR3WHesmX94zoAg
X-Gm-Gg: AYBFou0YAcRxj4bJsWKbdfkKmuUpZlU3T6Ld+Wi/QG1ZLRdscI78BpjlAkqscT0j3zP
	kYvXR+MfWIJyaeT2KiH5kmioQv/UjgathRWajr46DSjdp5V/zvBraHjwf1i3l0FKb0vlXRSjmGy
	o4nRcXim9ziLZ1jPV6a/bM6oTdcirqicod4u5KuoBLAeEO7Kgawg1gpWlMV2wQlVDJEPIPj/Ced
	hWK9vsmzbLIaZw9D8vpFHkWXOWUjvLISyzI80Fiwz3qhPRuj+Glmuh2RSomeObeeiQpIFh4R9xM
	MSAVR91zl+VBGngsi5XYUTEbtQQrIHVHxumSGqb0JU+YsdOx2iOw0wA25B8d2B5Qhz8cG4XxiwK
	+jTRhYy5UPxFRb+HyJhbOyO3Qt8rxaL0w80L0fehjv7x3GlHLvR1UgDxw7tbUxS9AJhGeBaNp1G
	EmLCiKB3ho5Gh7i/RAscKhUin/QwVQCNAgO2KYuizN7yxhm/+HwRgtQYWnD+GRmPXDxE0ofPjPd
	P63XwGxZI1mLwkIBqMY0zjxMkgLD+9+U5NltGZkXLQDNSk1KKBjvGTf3waRR0sZSlaYk02Bv7eC
	bx145rQx8UGLq+xtoQpWlRd/CJGdPlnoTJ2pm4G8xHhbDKhkdQti+7BrBXA+UcgeMxYvD5id4BP
	Srg4Pt0dp277sswUUccOeQ3iTIr99QZo=
X-Received: by 2002:a2e:ac0b:0:b0:3a9:abd6:1acd with SMTP id 38308e7fff4ca-3ae2b4b5d4bmr3909171fa.6.1794532050397;
        Thu, 12 Nov 2026 17:07:30 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:28 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	printk@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 10/10] kernel: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:15 +0400
Message-ID: <20261113010631.139191-11-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
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

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 include/linux/lockdep.h      | 2 +-
 include/linux/printk.h       | 6 +++---
 include/linux/sched/task.h   | 2 +-
 include/linux/start_kernel.h | 2 +-
 include/linux/suspend.h      | 4 ++--
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index a6451ecbb..f436eab07 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -89,7 +89,7 @@ extern void lockdep_init(void);
 extern void lockdep_reset(void);
 extern void lockdep_reset_lock(struct lockdep_map *lock);
 extern void lockdep_free_key_range(void *start, unsigned long size);
-extern asmlinkage void lockdep_sys_exit(void);
+asmlinkage void lockdep_sys_exit(void);
 extern void lockdep_set_selftest_task(struct task_struct *task);
 
 extern void lockdep_init_task(struct task_struct *task);
diff --git a/include/linux/printk.h b/include/linux/printk.h
index f594c1266..09a28181e 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -136,7 +136,7 @@ struct va_format {
 })
 
 #ifdef CONFIG_EARLY_PRINTK
-extern asmlinkage __printf(1, 2)
+asmlinkage __printf(1, 2)
 void early_printk(const char *fmt, ...);
 #else
 static inline __printf(1, 2) __cold
@@ -200,8 +200,8 @@ void __init setup_log_buf(int early);
 __printf(1, 2) void dump_stack_set_arch_desc(const char *fmt, ...);
 void dump_stack_print_info(const char *log_lvl);
 void show_regs_print_info(const char *log_lvl);
-extern asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
-extern asmlinkage void dump_stack(void) __cold;
+asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
+asmlinkage void dump_stack(void) __cold;
 void printk_trigger_flush(void);
 void console_try_replay_all(void);
 void printk_legacy_allow_panic_sync(void);
diff --git a/include/linux/sched/task.h b/include/linux/sched/task.h
index 90ed5bc3c..5cdef6b0f 100644
--- a/include/linux/sched/task.h
+++ b/include/linux/sched/task.h
@@ -61,7 +61,7 @@ extern struct task_struct init_task;
 
 extern int lockdep_tasklist_lock_is_held(void);
 
-extern asmlinkage void schedule_tail(struct task_struct *prev);
+asmlinkage void schedule_tail(struct task_struct *prev);
 extern void init_idle(struct task_struct *idle, int cpu);
 
 extern int sched_fork(u64 clone_flags, struct task_struct *p);
diff --git a/include/linux/start_kernel.h b/include/linux/start_kernel.h
index 09f994ac8..5855467ca 100644
--- a/include/linux/start_kernel.h
+++ b/include/linux/start_kernel.h
@@ -8,6 +8,6 @@
 /* Define the prototype for start_kernel here, rather than cluttering
    up something else. */
 
-extern asmlinkage void __init __noreturn start_kernel(void);
+asmlinkage void __init __noreturn start_kernel(void);
 
 #endif /* _LINUX_START_KERNEL_H */
diff --git a/include/linux/suspend.h b/include/linux/suspend.h
index a38150277..b97af3420 100644
--- a/include/linux/suspend.h
+++ b/include/linux/suspend.h
@@ -385,8 +385,8 @@ extern int swsusp_page_is_forbidden(struct page *);
 extern void swsusp_set_page_free(struct page *);
 extern void swsusp_unset_page_free(struct page *);
 extern unsigned long get_safe_page(gfp_t gfp_mask);
-extern asmlinkage int swsusp_arch_suspend(void);
-extern asmlinkage int swsusp_arch_resume(void);
+asmlinkage int swsusp_arch_suspend(void);
+asmlinkage int swsusp_arch_resume(void);
 
 extern u32 swsusp_hardware_signature;
 extern void hibernation_set_ops(const struct platform_hibernation_ops *ops);
-- 
2.56.1

