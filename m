Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891632;
	b=OXfsF46UORGy9zN1NuVCiAoEIVSr8J8JSeap9O9V0gh+W7iESgo27Pw4z1Xz1uoWkZZx
	 sLbMoG9dxJ6wN+f8/PZsXijKSV699cIaXZVPmkIHOfIOYGUzYNwjhnXR8bdgKC6ZELKcb
	 c6YLWi7rHvYVepCb/BUpeNrpzXCH/kOyt6VyggDJbPZENv4SDZ4+yGOsDouZPvGKNYe3S
	 ecsKVyYj7n19wxlMVhP2oWGT77L8KG2rLGsfiKTIpUWTrdQHNeyeQ01FA8PTuvUAsuCkQ
	 HK/h922duzce/w8rXLWzQlDQM5JFlo4HDCa5nezFzV3gQYNJaTAeKj56TINIP1uEIgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=eD/U90elOlLuZ8H1ZNNelJtjhWVVGMS1O6rYfNflbg8=;
	b=UcNJjsTE0oa3LlJX7wOWMnPhplWEZSDEUlxBhvvBScikFqy4Sf/u457tnX0VzeHvGC5r
	 xrt/d8OEQ5zOxk1Z/m28jsX8BG49qeYk7wRUxu959mNiVCtHQsEZmq/JbO7DoKg4o+n1i
	 ssYTTy+49dn8BHgVrkRUbcmI7OKdFRHVblXhmmGRh4VO1m1Vq4oiD2CARXDNcLmvPr9NS
	 b/qiRG2Vm65BJ2mxxnIB/F3MOYEpIELnPa97BCsBovtfMJ56F3FHY/gKf5j5dnYDREBAr
	 KSvxjtf+UVVt+HCFAVMeFGaXG//Khu1Hh1sSG5lhviQtJ3EBI7C5jd39cdG9GSFMAcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=YaXOXgb2;
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20E6606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=YaXOXgb2
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93f3c8958d5so223603985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:13:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891630; x=1794496430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eD/U90elOlLuZ8H1ZNNelJtjhWVVGMS1O6rYfNflbg8=;
        b=YaXOXgb2LB7UJyMuzhPZqITboSOeaC2R94lnsrvcdpcgMGVp5opbkAfjwS5NyH9YVQ
         IhxxZAmVJGIjl3X5We14lSCXhHRUKb2XQE+2nj3FGdGOk+/o+KPQeo+OwyN6qpuKEXKR
         vvagzx+Q8NPJR1bTBTYTfq525CwCkrGyGeXh+MUmW7GI1kdK0RRDxjPxCHcL6ZAiLo3O
         qOnYF0HvER6+IeLjalRvvjES6TB+ECjErFeZkNgThhLMg5gfPm+s5EzZWhaBgpPIATAO
         CgXGMXhyx5T1rW4SVOxmjnGGtbFbCI924ubephgWgS0oncXsD3NGaMSnp6ntK8jl3ReK
         zwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891630; x=1794496430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eD/U90elOlLuZ8H1ZNNelJtjhWVVGMS1O6rYfNflbg8=;
        b=DPFdF4hFpN52wPvZHtN5KUylMYse3gcsI+R/zCk1cLGuUm05zS3j1aitNg7hOgDkXm
         JLYHJhiprXH5ABbLAmA5hxZfPdDFrVdmYK2Kg5+Q76TMAUX+srn9NdBmcHOPb+Pg1aCZ
         yK7EKBCM89oG34pqWoox+q0sOnRtKF+Zba+2vQnXAJvepqxW+v7URBk7w4lp6M+CSqT9
         r1R0GsyVvf+WeJyMfeqFDkAC5RJis/cS7/oLIiAOJJa+LXjAtsrWbuWeEpmzZkXRUQxS
         bJin3nDx51slGzXtodR0AC2mm7T+0PhHSMP98oom7gyjM5NexcELJK3HWkL7+ISf7BID
         svww==
X-Forwarded-Encrypted: i=1; AKwUvBw4AM6ESxy2R9bT7dSrnj8BfXpqnLjywBQekLnC+wZPb9Quj5IbqMPrpPFW+L8+lBW/a47kMNYzO0tYbIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z84A6dc5O44i8w06h3BKEdwIDC4r95KGL2Vb4Hyp/oDOERaRXkb
	Uh9OPvwxt4nrQoi+MIN1gTQEEEMi2jZEZpRQfQa97NH1NaqoQtQtuFJTFLq2sWzPj78=
X-Gm-Gg: AYBFou0xfXQJgP5T6n4xsQhnQefyg0nswx0O98rbeUY8CRt6xc1dg210a8EWNkujUJj
	qO7p1rbCBjoZYiWnypl2JfyZ+IVg/kFOlViCqsirPBhhCe0LOtfDPQGFumsDUvrUcj+9uRjVRnB
	ns9L+zVdxQgautjOVqMXbGNUPl5OkkVwXLjrXln346iXEGnV9fMq8r/At/47IY7FEWrKoZuML9H
	TCxbyCF3ZJgcLWI2rXKht9wF3DaE8Hn8gqNzdVCXC8xmZEBuUwD8VoVYVFLYBf9WX+1ITAhbF3V
	Sj06cYxBjpaCD0loyObZAnpi+oe2tgAUeXZF089YPuv39nGXPx34uqTGj8RURfSNgDdz6ZPOF6s
	e2CDyuKIZr/Kcahg07frLwIujNHRRiU1oT9t3cj4DvCiYJhmJY8uOUfy0zCvPXKMU0wT7SWB1MY
	WBqFfj1FeB4V7QQZHO0CuQUavYyjWHWFK/p1C+7Ej2tjGiG2ulYUMJm0zylvSIhbAnHgo0Chjfu
	SaReXknkQ/oLBnvvTiVkgY9wx2DxRGSp6RM3RGaln2+v/ON+JAGsUFAZMIxvRf21xBQdknypVxg
	kDywtUOHO9xtybTlIyzebUMd34ZJ6PBE9YpM/32UDnJZlA==
X-Received: by 2002:a05:620a:6497:b0:93f:5519:5e87 with SMTP id af79cd13be357-944214dc4e9mr2928442185a.4.1793891630501;
        Thu, 05 Nov 2026 07:13:50 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4799adcsm482767985a.13.2026.11.05.07.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:13:48 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:29 +0000
Subject: [PATCH RFC v3 37/90] x86: give a task without an mm no user state
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
Message-Id: <20261105-b4-cells-v3-37-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=4121;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=AzJUK89H36+a6DZkLJfb/bsDi6+Ma/W3G+ZrG4Bu/+k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOvh7eMY4P2VdmuVqh6BApfDmksMcmre4B9bSmm4fmjaNCLtAj6C8hwekw8TooCQ0iCvy2Luk72
 VQAXezGMcsgI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A later patch creates tasks that have no mm and whose first action is to
exec. Such a task has no use for the user state of its parent, and none of
that state should be left in it. A kernel thread can keep the state
because it never returns to user mode, but these tasks do.

In copy_thread(), clear the segment bases and selectors, the I/O bitmap
and the shadow stack state for a task without an mm. The registers are
already cleared, as for every task that starts in a kernel function.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 arch/x86/include/asm/shstk.h |  2 ++
 arch/x86/kernel/process.c    | 24 +++++++++++++++++++++---
 arch/x86/kernel/shstk.c      | 14 ++++++++++++++
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/arch/x86/include/asm/shstk.h b/arch/x86/include/asm/shstk.h
index fc7dcec58fd4..fdf43119c2bb 100644
--- a/arch/x86/include/asm/shstk.h
+++ b/arch/x86/include/asm/shstk.h
@@ -16,6 +16,7 @@ struct thread_shstk {
 
 long shstk_prctl(struct task_struct *task, int option, unsigned long arg2);
 void reset_thread_features(void);
+void shstk_clear_thread(struct task_struct *p);
 unsigned long shstk_alloc_thread_stack(struct task_struct *p, u64 clone_flags,
 				       unsigned long stack_size);
 void shstk_free(struct task_struct *p);
@@ -29,6 +30,7 @@ int shstk_push(u64 val);
 static inline long shstk_prctl(struct task_struct *task, int option,
 			       unsigned long arg2) { return -EINVAL; }
 static inline void reset_thread_features(void) {}
+static inline void shstk_clear_thread(struct task_struct *p) {}
 static inline unsigned long shstk_alloc_thread_stack(struct task_struct *p,
 						     u64 clone_flags,
 						     unsigned long stack_size) { return 0; }
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 346c438ac880..d2be7a9647ce 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -219,9 +219,23 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	 * is disabled, new_ssp will remain 0, and fpu_clone() will know not to
 	 * update it.
 	 */
-	new_ssp = shstk_alloc_thread_stack(p, clone_flags, args->stack_size);
-	if (IS_ERR_VALUE(new_ssp))
-		return PTR_ERR((void *)new_ssp);
+	if (unlikely(args->fn && !p->mm)) {
+		/*
+		 * It has no address space to have a shadow stack in, and what
+		 * it will run it has yet to exec. Nothing of the user state of
+		 * whoever created it is any of its business.
+		 */
+		new_ssp = 0;
+		shstk_clear_thread(p);
+#ifdef CONFIG_X86_64
+		p->thread.fsindex = p->thread.gsindex = 0;
+		p->thread.fsbase = p->thread.gsbase = 0;
+#endif
+	} else {
+		new_ssp = shstk_alloc_thread_stack(p, clone_flags, args->stack_size);
+		if (IS_ERR_VALUE(new_ssp))
+			return PTR_ERR((void *)new_ssp);
+	}
 
 	fpu_clone(p, clone_flags, args->fn, new_ssp);
 
@@ -258,6 +272,10 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		 */
 		childregs->sp = 0;
 		childregs->ip = 0;
+		if (!p->mm) {
+			memset(childregs, 0, sizeof(struct pt_regs));
+			p->thread.pkru = pkru_get_init_value();
+		}
 		kthread_frame_init(frame, args->fn, args->fn_arg);
 		return 0;
 	}
diff --git a/arch/x86/kernel/shstk.c b/arch/x86/kernel/shstk.c
index eb690ba90180..41d77efd7952 100644
--- a/arch/x86/kernel/shstk.c
+++ b/arch/x86/kernel/shstk.c
@@ -183,6 +183,20 @@ void reset_thread_features(void)
 	current->thread.features_locked = 0;
 }
 
+/**
+ * shstk_clear_thread - a new task takes no shadow stack state from its parent
+ * @p: a task that is being created
+ *
+ * For a task without an mm, which has no address space to have a shadow stack
+ * in. What reset_thread_features() does for the caller at exec.
+ */
+void shstk_clear_thread(struct task_struct *p)
+{
+	memset(&p->thread.shstk, 0, sizeof(struct thread_shstk));
+	p->thread.features = 0;
+	p->thread.features_locked = 0;
+}
+
 unsigned long shstk_alloc_thread_stack(struct task_struct *tsk, u64 clone_flags,
 				       unsigned long stack_size)
 {

-- 
2.55.0

