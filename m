Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096893E16B9
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787873486; cv=none; b=nAYIN5GAm0pyS8L72nrm4q+gOhHgumAVFmPIjLU059mTRq1WhRQUQx0y+QZNkALcmo6wPdE6ZabwTZ0TfVJRHI5utIo4HjSW7BWrq8zAL4pV1nUZkFNVuO6QgavaN/RDz3jHb52psLWnoxsdoavtlkw6fse/rSju2Kkq7ERst/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787873486; c=relaxed/simple;
	bh=K+D5Y6brOLXG1aN+myxhErHXOB0qjYSBze5FnYnXukE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G7c4WDRvYOh1jKh8BhkqeAAf4b62WbbcFluQFFWmy8mOFmCycNMoBLDzCbxpBWg9AIemA252Gw0kfxJjeKM8ku33tzEEh8ROpTTT8tgJsW8m3kiSqcH9whZ85yIPcHAeU5mQxNvVrJZp8eVmsjOhiCNtspFHxsH5XOWyWy8RV88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jsHHRjku; arc=none smtp.client-ip=209.85.216.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stevensd.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jsHHRjku"
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so1115637a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787873484; x=1788478284; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOrBCjVl+Gsil1QM8OKlKDVjeh9PhasgM5tVDAHOOrA=;
        b=jsHHRjkujr+z7AdG2T8A0WmfXHOj/0izZM6MEoJd9JfiDzNg5R1CJ4xvcAks0fI8ju
         EC7MaTGu8bGIo4biLfzJP6vWZOUOrrSRKSUf8c1ddtOzl2RFA022HjIrHIeY4KjN6gZQ
         xLVg356CwxuLv7tUvqJpjiAUig4zcx1BAQffJQaKEQ73Z6uxppIGXMKVRKatq6wN85RV
         DPrUtiWM4VdfG4GwACRNxRgKzDzkI62r2JLnyWyNn7gPA7LRUi1ChzUXhQu4rZ7LujW1
         jJFsXtH7tdccr3kSrKUJRoSUBJYfGdBePSmn1xQrvlKxQhVyEB+/95T+sBrZ04P6zImY
         uqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787873484; x=1788478284;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LOrBCjVl+Gsil1QM8OKlKDVjeh9PhasgM5tVDAHOOrA=;
        b=ISTa5WLApMY4NTz7MRrlHGckMngyd544XNE1TP2QRMaSDb36AVZRNAmJIMQLurgf08
         7hm36+6RXLYGgtL5JgdUPmuWeoqGoZxyuOnxffS2O1iXS9J0e/c+9Af6Fc8Tav4gTRHI
         RHfoGn1s8Hhz6tCpMoAhPUVuA5JXpCQKO10RRcUQAB+ZBiawxi3wyFSaF+froR03cAup
         S3Ak9Ery5erGxLd7tG+i4N+GTV/4kbbevjTWbqDeKjx36aG4p9PUhPXb0Vp8HVOYQRab
         /f32AXHzgvozEDnNU3ASmgR1D7j+K8jZQC8/JS2tgu5JgXD5ikQKz2Nc80I/m3mvgIol
         2Zww==
X-Gm-Message-State: AFuF++nfqmWNUKwZuRX0YTqXDtjPR4DPzHkaD5ohWMpB2SVd2syMQv0/
	QGUAdI717XZYOnKPBoauUfhq9lN0tkULT9FJxRX2H9e/QkOXl15sK7P1VQIWLSjbJu/V4BXOha/
	IHyEij56nec5jYA==
X-Received: from dlbqi2.prod.google.com ([2002:a05:7022:ebc2:b0:13f:bdf3:f58])
 (user=stevensd job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:4cc2:b0:396:d27b:89b9 with SMTP id 98e67ed59e1d1-396d27bb20emr3178120a91.10.1787873484126;
 Thu, 27 Aug 2026 16:31:24 -0700 (PDT)
Date: Thu, 27 Aug 2026 16:29:42 -0700
In-Reply-To: <20260827232948.2520558-1-stevensd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260827232948.2520558-1-stevensd@google.com>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
Message-ID: <20260827232948.2520558-5-stevensd@google.com>
Subject: [RFC 04/10] mm: vmalloc: support creating aligned vm areas
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

Expose a get_vm_area_node() function that supports passing an alignment
when allocating a vm area.

Signed-off-by: David Stevens <stevensd@google.com>
---
 include/linux/vmalloc.h |  2 ++
 mm/vmalloc.c            | 24 +++++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index d87dc7f77f4e..5ed9c5b25026 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -246,6 +246,8 @@ static inline size_t get_vm_area_size(const struct vm_struct *area)
 extern struct vm_struct *get_vm_area(unsigned long size, unsigned long flags);
 extern struct vm_struct *get_vm_area_caller(unsigned long size,
 					unsigned long flags, const void *caller);
+extern struct vm_struct *get_vm_area_node(unsigned long size, unsigned long align,
+					  unsigned long flags, int node);
 extern struct vm_struct *__get_vm_area_caller(unsigned long size,
 					unsigned long flags,
 					unsigned long start, unsigned long end,
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index d39897300f29..059cd0748514 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3280,7 +3280,7 @@ struct vm_struct *__get_vm_area_caller(unsigned long size, unsigned long flags,
  * @flags:	 %VM_IOREMAP for I/O mappings or VM_ALLOC
  *
  * Search an area of @size in the kernel virtual mapping area,
- * and reserved it for out purposes.  Returns the area descriptor
+ * and reserved it for our purposes.  Returns the area descriptor
  * on success or %NULL on failure.
  *
  * Return: the area descriptor on success or %NULL on failure.
@@ -3301,6 +3301,28 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+/**
+ * get_vm_area_node - reserve a contiguous kernel virtual area
+ * @size:	 size of the area
+ * @align:	 alignment of the area
+ * @flags:	 %VM_IOREMAP for I/O mappings or VM_ALLOC
+ * @node:	 node from which to allocate data structures
+ *
+ * Search an area of @size in the kernel virtual mapping area,
+ * and reserve it for our purposes.  Returns the area descriptor
+ * on success or %NULL on failure.
+ *
+ * Return: the area descriptor on success or %NULL on failure.
+ */
+struct vm_struct *get_vm_area_node(unsigned long size, unsigned long align,
+				   unsigned long flags, int node)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  node, GFP_KERNEL,
+				  __builtin_return_address(0));
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
-- 
2.55.0.897.gb25b4bd76c-goog

