Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528938;
	b=dF5IrJzix7kGmaWYKT3h3CUFBb6Aervn+qQdFjghflFekERT8pIqFcHy0lcbHvJ9ntEy
	 2OnDAYzYOh283pY/R1VyZx1nijazbqLGgcLBj8uReT0QECJfxZniH2fztzl2Yl/K4nc50
	 PvqQraeJyGbWuH5xkTfHvXMqckerpny/xxyr+AuJk3XRLELjuM84eKYLMFEVuN0ejWeRp
	 wvVJJsKDnZiEQT3hlLaDn7r0oxuul8Z8qU4oMctBq8EIgT7AV4kjhsPmFbvIcuVCUTJE+
	 frBNcevy0gOvEx2bOlS5tAWOOWDna6TOTMzvKidbEp+ncsE98+hDFCEEvPXszLnINGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Fy4WFW4Td97IvBSVlIHdYeCc7+bBQ4nJWzT+60QtQBo=;
	b=GaXzhZ4DhgT8hdN7zurmBNmkOTng1eINnsvl9jhiYDsyoQM5u/E0i+IcVNiioQ6bvwNm
	 P+l5tgUwQ//lr3OX0tpNBB3jR/3Q3Q7Exu1EoY0JYOe4xrtm/1J0iyezyBRUwKp2pspCb
	 vGEuzcaIw3qHcTQ4Dt+nacWnBTOFQTQmMX4mr0g0iLBPdMTXw+bWtRBQcW/c6fZzt1FDh
	 W4Aa8V/irdUe5rwIPa+cnbJuhjtmIXgjfkiGLKYAoNJVz6i3LTR73ph/6LMzZ7QDU9/PA
	 WXxAWzKdl9+swsylb8BLE3PhgIsQrjU0xqrslxdynBtckYJyAaywrE/dljQT6j1QK3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVpco5us;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FAA60A2633
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1FAA60A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SVpco5us
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14e307f29so520752e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528936; x=1795133736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fy4WFW4Td97IvBSVlIHdYeCc7+bBQ4nJWzT+60QtQBo=;
        b=SVpco5ussGSCn0fL6muNLwvqer8Lfpvi+E1CqTTeZQuBkCxJvHQ+N3hG4z/neEEgeW
         h3Dnsk4ODSPGYETfVQigcz8D1w5UlcfpZEw7fDWzdQbGH1sMN1vYtXIV3m01bKXyQ8oU
         JUXfQ2y71PKrIJcmlsiDFUsaQY43MuF/A8XVstRowkQperjX+WimCda4RWnVkEUYcQ+M
         liRsSNjupGie/ThC9MnIWL8b1Xs0K85L+6wal0RKS135Okd+DXFOMiQ/QgSQ2zn5THf7
         r7nsEFCRN6U6Ohlawpxl2uEp7qpxTSsSiHn7ug3rNkQRAV2TR14ztfggqPcZIOmhMNSN
         Oj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528936; x=1795133736;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fy4WFW4Td97IvBSVlIHdYeCc7+bBQ4nJWzT+60QtQBo=;
        b=CkpLCodmMR8TUss5KDEk6JO7VSaf8V51Qty+GImdSVoCG/bD+L/DKLqrU7l618x43z
         eEL7Bc1IvDScXiAjP99rvUfA6Tk7P6JA6t/2yz0BRNDrQTK47rE/cd412Kt+QZKErsI4
         pcTMq33iRZ+uxFkR2pAMzvj2NQp+ukQSg79VbjPkkoeiJ3n/K7+EBDWWBThNh/bRNiae
         OYYfeFw/sdnPZqgPkRmN06dHtU42aGC9w0SZhwgFKPr9xCoYuUwvdwNs5QAiih0+iukB
         LJLOC8GShriPZRRrolATNZfRQHG8xTzniuMD4IX21Am5QTc41w89KBsy1rgN+MLy+pEz
         STcg==
X-Gm-Message-State: APuU4Z8z8pyATqCpse8yvlT5GAYQcm7t4Z7txBHEv8Boy71nasAZt1/Y
	4RyO71Blp7hWlKikN+hn6mmWEGmOkW0iCp87bE0j5q9OPVAKL/sIVX8P
X-Gm-Gg: AYBFou1+8RpxVKmmhZqgrijVz/eVq3xhVMAYk0BfPwhTpFXN7jixHLFrPwYQo3tsZLU
	IjiQ9TIi1cQOCloGXGCL7wbYSpd96gJW84K2DTav34NQu4BZ1kSpRPvGR3GtvEXvtsswOgQ2m1m
	UWmJqBWLG+psPJp4yHN56xMQpuQsj1bwkdSsISzk6Hd2q3vn9Cyq4sOQSa82m6F8vr50DvRFk6t
	LdiXxM/0SS0u+vr7OBCc8jkllhtC3pXibMaM/DIT6Oy8XlUIOE/Dr3O3g80ILXtMsT0A9pXlgWj
	gEYoXLETOCy5NAI0LLeuKTz1JT6dPXYskX6++N56ztL0TOP+wv1busnIgHwn9FTAWl42rQrISDy
	H2hRU2LDAFXRGfheU9187D0rfvTWEydzpNIxMEhWUva2FdqBDAB36GZxPIN7Ld8LtVATgr/VlpS
	D58rnLGjoz99s6Uh1jvGIid0kN4pjGbywdjthg/CT6IG7De8z5QpylfyHQCQA9wKxRkwx5LIgfy
	gFSun/YjxrZ949W8ykM1i/YiM8xe9BUcVb5uDFKDVR0r9wTJAggMYuTTni7TkNZA9JVcypIcuvD
	QKnuvYslVm/CYofkK5+EO6c7VKgkrRNUQ6TJKgJmMG69+Z+aRMVVqzJkPPMyJqZagsg0yc1DHEz
	74LpmO5QjOA==
X-Received: by 2002:a05:6512:a8c:b0:5bf:ce85:50e3 with SMTP id 2adb3069b0e04-5c170a0f613mr334159e87.42.1794528935920;
        Thu, 12 Nov 2026 16:15:35 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133ca01sm200968e87.36.2026.11.12.16.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:15:35 -0800 (PST)
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
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	printk@lists.linux.dev,
	linux-pm@vger.kernel.org
Subject: [PATCH 10/10] kernel: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 04:14:16 +0400
Message-ID: <20261113001432.128201-11-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113001432.128201-1-safocl88@gmail.com>
References: <20261113001432.128201-1-safocl88@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Compiling a kernel module with a C++ compiler results in a duplicate
echo ‘extern’ specifier error.
This occurs because the code contains , and
expands to  when processed by a C++ compiler.
The  specifier must be removed.
https://bugzilla.kernel.org/show_bug.cgi?id=222257

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

