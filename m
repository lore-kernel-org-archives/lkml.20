Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8083E716F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873498; cv=none; b=AW7RsYkX1PHkXZ21PzrjU5UZCrScEKYwL72OqZ79vJE+aY2VCv8u4togX/b7mbndFG7RaD5545VdzaAJxbQornzzs9ldO157RY00kVhpZqVhYlcvjhN6Yjeeo64Fh6lkZoqrcRUqR37LHYqvDt1SpNbDmjlFDXTBePabKWZprR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873498; c=relaxed/simple;
	bh=a4DHxg2eDawzpdV6ihnCiTe31A8NEYh6oPRQKJtlYWQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QKH/Y/w0+IoVhDqFGyg6SvLCHzS1c04SsENJi2MXCiQP0FnZSBLgKJ6aj+EhyVUqjVx0ql/aaBoSqkxTl/R8xRbGFZIB8x8IbyL9379ya5xQGt9aWbZPpVWutsvgyEUJpvBhud7C7/f+6kcB04mdjwyyhn8vAVfXwCnrq4e0ZaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A5T2MugD; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A5T2MugD"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso806939a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873496; x=1788478296; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=THehtAVXPzXeOISNI+hN8Wh32bn5y3s9ZVH/HPQs5Ig=;
        b=A5T2MugDTl03wWg5tWQDSsVhfk/z/7vYj+q2emKo4Ui5SCgwX4lNbBpjXajyIN1m5J
         bjx8lr/bAUE1KeXjh7Yjd4suqFSb1Qh1Rm0mdI6cTtjE1X1ystwmAYxFpSzpvHiahupf
         F0/eVmNM/ozVYo4EawBWlsa3JWT7BRSzaTmwChpmdAM7TKSjDlfTpxuvfahUfLCDhK97
         FEs9JdLeuNJmyuq218op2Gblpgs8cGYxqp/cV8GP9P2z6HO1xWDkXzZtDgSvucgAo20Q
         NxQILCdwiHUSAkAihQhQQhUICzXOELdBapF6TLJjuQBnvpaMDjw5ySayU+iM4D3EfTzG
         cWyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873496; x=1788478296;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THehtAVXPzXeOISNI+hN8Wh32bn5y3s9ZVH/HPQs5Ig=;
        b=bkME7JtwiwEvH7aEaL3zesYKkebn1W3dUCeYeCDD5Ef3ZjyAnpYvRNvjVHF2upplVf
         fvGc+JyIMjbzyxPSqSd33gvv0KL+UWodAA+ew2JndGT14joxv1fzm0InfEJoBP3HZf8q
         n+3yGB+Asw/IsRAzolQ6GrsNrY1lQqBM1PnPhVHyxM2T2W+tvMgXkXAHvVOunXFKNs/7
         wyzCRw/IvwzNyDIPfNULoljL+H14tgQNiFptluGGEhlj8fH64vcPxsvWBen3X/R3v83H
         UxbhqQwPTJtUdALtR5bZ3NOKKB97sZvsCCPS0IlgG+GPmS7JSKv4zCSUsFQ6zmVxCFHa
         leag==
X-Gm-Message-State: AFuF++mFWiamVS7haJp5scqnLno30CPo61trWgSFaEm+1qg+ooKqKYXA
	SPii9/tZ353VArTEBHH5hZe8Xs5yYPF0Xgpgw4JJ/cyOPuSJRKfABm/BQW5ZbKSrHYc0fQlPkRu
	DEaR8GXz0bN5CFw==
X-Received: from dlbsj13.prod.google.com ([2002:a05:7022:f90d:b0:139:d9c7:3cf4])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr5303479a91.8.1787873495813;
 Thu, 27 Aug 2026 16:31:35 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:48 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-11-stevensd@google.com>
Subject: [RFC 10/10] arm64: Enable reclaimable stacks
From: David Stevens <stevensd@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, suleiman@google.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, 
	David Stevens <stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"

Implement top_of_blocked_task_stack() to get the stack pointer out of
a thread_struct and enable HAVE_ARCH_RECLAIMABLE_STACK.

Signed-off-by: David Stevens <stevensd@google.com>
---
 arch/arm64/Kconfig                 | 1 +
 arch/arm64/include/asm/processor.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..262a4fddce19 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -173,6 +173,7 @@ config ARM64
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_VMAP_STACK
+	select HAVE_ARCH_RECLAIMABLE_STACK
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_EBPF_JIT
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index c2a627f39314..f5a550835c94 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -204,6 +204,11 @@ struct thread_struct {
 #endif
 };
 
+static inline unsigned long top_of_blocked_task_stack(struct thread_struct *thread)
+{
+	return thread->cpu_context.sp;
+}
+
 static inline unsigned int thread_get_vl(struct thread_struct *thread,
 					 enum vec_type type)
 {
-- 
2.55.0.897.gb25b4bd76c-goog

