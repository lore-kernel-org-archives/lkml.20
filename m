Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084E24AE115
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070098; cv=none; b=mGCMobMUEj7k3JzQufJtOL5zdJpdYsM7+Vfp3HYyWzlCiTUyJB2yGOngkIkz0oLCDdsdJ2FG2+Qdjdknmr6VfZzykfzKrebzu8X7UKKNZbn4/0fZKt7sp9hqil9lmarPhW1VQkHQJdZR7cmmxwZfSPB9kP2iVD7k7lHxQwtatKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070098; c=relaxed/simple;
	bh=YM+n+gZvVY10p7fJ3CU3SkGJ78Q7KHDu7Ir/VVgrUew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nh5bOBrEWtFWphvgXrgPsOvvyjivT6VoIcNxUcecf2GRBf0jv21TCJmixkRXrEBpYiKOXnQwyubirKNfl9YazvBFB9nkeANpqyT1F56Wa/Dvlm4GgLA4bmdvc37gsYL/zpAKClxLGAKUMEZpEpg4W13c4ScAAE7V5cK6HhoXWHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VFBmzRUS; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VFBmzRUS"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so29091295e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790070095; x=1790674895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ihfL+tJmT3BCBYnWtaQmDFL2P9DOwEac8zYpc3/L1YU=;
        b=VFBmzRUSOLAfIhfPCNV3MaVno7crCbUyiaXPK8+d6Q2/7yGT2YZx8PAsTqB/4uzNxr
         XkDm9WOPD7M+UbOhh/KDA9QvftG0UgjKwHxCYkWsocCVOXNMvhIrFXvEx+wFxXxQYV6X
         a7pGAZVkUTGQPNC7HH/gJxo+a05P0irnwgNEDOLxCt9oGsR4gtRd4SPTTyNCx8kOPb7z
         Eop94XZMEiwH/ySGufrgG1xzC2Xl3SZzHyANs5VSnkb5w8PRH9QCVVQND64zw5Vqs8SI
         0SWKIrq8mt6pWtjjluVxYec/9bY47zVrGqMRftNVq+8msWevTSHv2vyth6wReBNkxb7L
         RZ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070095; x=1790674895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihfL+tJmT3BCBYnWtaQmDFL2P9DOwEac8zYpc3/L1YU=;
        b=lZtDmz74w1QAcSj8b05uCp0rRa8I7wPnVLTpJZ15QCncw44bbZl/M0y3OWDx4L3X2r
         +DhTd3GQoW/d7Uv/Zw6fgGM22VFvO+uRwETYnjZehEf20iTqdli50z0oOGnGaDx94lYD
         y+7NoqJCDVQxOEHvLYzqLlHaO8kK9ISXUl79pNzXUKT2fAJz1Te6j4P1FlIq2wspFoJx
         jXG0BKg30vr9hOOPTr3bILjQnybWBvQL07UCgsWEP1p6X/28lOfLpfKWpwiwP2YCJXb3
         xyz+vRSYlNm0bUNSrCNF3UT3Xv7SeRwlXe15/9WVoS1eA3JolxyQn1QRDa6QyBOXR5+u
         mI2A==
X-Forwarded-Encrypted: i=1; AKwUvBxxhMp8NdnIKEo6SKLKJZS5MKKlH6GdmEQ4mAawCTb/MTq75Q2bQdg0R/gPOJg/B+E/LpG4MiiZNAsH7uY=@vger.kernel.org
X-Gm-Message-State: AFuF++nkWsWKUNIM4kOTK/X1E/bNfJyAfDA+87xlEdYaX9EFVU4RQ+zh
	iGlwkU69zLzw/3Bk+OHYVa/NEk0SGrv5h35tu6Ukj5U1Do3IIoOfKbepqTazbs22jvpWLCrQlta
	GrWrexQ==
X-Gm-Gg: AYBFou36Xnm/oVeCRU6M372FlXCOoz+VpEqt3FxO9pZXMEeHJxgElZE+brqbf9s4Irt
	ilJfkW6+8JXsrOggNZA/v/n7FiCXBGAHzzoHAYb3D3pPltaMv1qWj37KKZpIfJgkubJ52OPKRFv
	jIy1mQDvP9SG8O0TT8Id1RzLox+RsKelY3Q25mpbkjopGs3ojAWUJIxmE0e+2blM9qC6FI2RJwy
	UZEW7tIHUgC5QNbLU8zjD0EOxYYP3LqAhC0swbyl6R89tUjXvJbPEIk+e1pGahojbqZDhLg71sS
	E7V0FeKS5y9VaRIa39L1w6sbojY159h5JJpeGeWTQScHNg0TizN1pnnM8Y09q+Hi9HrW48XxQqE
	yLw8CgTKnutKoTj4Kt0kbBN/5JTXJycziPvH6eSVy2IA+o2gNkiJhCEKVRYWezrNqF0cJ5XllBk
	KFpSwGV0BmomJm+dp4siYRZlcbmiQ5kGHtFui0dPJQYo+pdvOQC2qowTQLETvcG8EUJgKELgCh/
	XEomcaYmaFCsZrO0hfiA1Gc0axUNTN9Mf/NSy7dikA=
X-Received: by 2002:a05:600c:3ba0:b0:49e:73d3:78ab with SMTP id 5b1f17b1804b1-49fc55adc12mr237091315e9.0.1790070094567;
        Tue, 22 Sep 2026 02:41:34 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886279298asm3150725f8f.34.2026.09.22.02.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:41:33 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:41:30 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>, gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiang Gao <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v4 1/2] tracing: add ring-buffer memory usage statistics
 in tracefs
Message-ID: <arJNSjKsJ3bK40dH@google.com>
References: <20260916063322.472172-1-gaoxiang17@xiaomi.com>
 <20260921113047.1152602-1-gaoxiang17@xiaomi.com>
 <20260921113047.1152602-2-gaoxiang17@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921113047.1152602-2-gaoxiang17@xiaomi.com>

On Mon, Sep 21, 2026 at 07:30:45PM +0800, Xiang Gao wrote:
> Report the memory consumed by the tracing ring buffers, rather than the
> usable data capacity exposed by buffer_size_kb. Android low-memory
> diagnostics need this to attribute the memory used by tracing when
> calculating lost RAM.
> 
> The buffers can be spread across the global trace array, dynamically
> created instances, and snapshot buffers. Userspace currently has to
> discover and sum every instance, and snapshot memory is not exposed by
> the per-instance totals.
> 
> Add a trace_stats directory with memory_usage_kb reporting:
> 
>   buffers:
>   snapshot_buffers:
> 
> covering the global trace array, all instances, and the bootstrapping
> temp_buffer across all CPUs.
> 
> The values account for the full pages backing the data sub-buffers and
> reader page, plus the cached read page and mmap metadata page when
> present. Slab-allocated ring-buffer metadata is not included, as it is
> already reported through Slab and would be double-counted when
> subtracting tracing memory from lost RAM. Remote buffers, whose pages
> are externally owned, report zero.

For the next version, it is good practice to __not__ in-reply-to with previous
version.

> 
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> ---
>  Documentation/trace/ftrace.rst | 12 +++++
>  include/linux/ring_buffer.h    |  1 +
>  kernel/trace/ring_buffer.c     | 41 +++++++++++++++
>  kernel/trace/trace.c           | 95 ++++++++++++++++++++++++++++++++++
>  4 files changed, 149 insertions(+)
> 
> diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
> index 7261f25f8b4b..99ddfe26b7cd 100644
> --- a/Documentation/trace/ftrace.rst
> +++ b/Documentation/trace/ftrace.rst
> @@ -218,6 +218,18 @@ of ftrace. Here is a list of some of the key files:
>  
>  	This displays the total combined size of all the trace buffers.
>  
> +  trace_stats/memory_usage_kb:
> +
> +	This reports the memory consumed by the ring buffers, as opposed to
> +	the usable data capacity shown by buffer_size_kb. The value covers the
> +	main and snapshot buffers of the global trace array and all tracing
> +	instances. It does not include slab-allocated ring-buffer metadata.
> +
> +	Output::
> +
> +	    buffers: ...
> +	    snapshot_buffers: ...
> +
>    buffer_subbuf_size_kb:
>  
>  	This sets or displays the sub buffer size. The ring buffer is broken up
> diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> index eac3e9080c3c..96b99e6757d4 100644
> --- a/include/linux/ring_buffer.h
> +++ b/include/linux/ring_buffer.h
> @@ -167,6 +167,7 @@ int ring_buffer_iter_empty(struct ring_buffer_iter *iter);
>  bool ring_buffer_iter_dropped(struct ring_buffer_iter *iter);
>  
>  unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu);
> +unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu);
>  unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer);
>  
>  void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu);
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 04bb94c29f58..efb88bf8970c 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -6559,6 +6559,47 @@ unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu)
>  }
>  EXPORT_SYMBOL_GPL(ring_buffer_size);
>  
> +/**
> + * ring_buffer_memory_size - return the memory used by the buffer (in bytes)
> + * @buffer: The ring buffer.
> + * @cpu: The CPU to get ring buffer memory from.
> + *
> + * Returns the page-allocator memory consumed by @cpu, including the data
> + * sub-buffers, the reader page, the cached read page, and the mmap
> + * metadata page. Unlike ring_buffer_size(), which reports the usable data
> + * capacity, this accounts for the full pages allocated to the buffer.
> + * Remote buffers do not own page-allocator memory and report zero.
> + */
> +unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu)
> +{
> +	struct ring_buffer_per_cpu *cpu_buffer;
> +	unsigned long subbuf_size;
> +	unsigned long size;
> +
> +	if (!cpumask_test_cpu(cpu, buffer->cpumask))
> +		return 0;
> +
> +	/* Remote buffers use externally owned memory. */
> +	if (buffer->remote)
> +		return 0;

This is a generic interface. If you want to call this function on a remote
buffer, you should be able to.

Moreover, remote buffer in-production current use is for Android... So not only
ring_buffer_memory_size() should support them, but they should probably be
actively reported somewhere...

> +
> +	cpu_buffer = buffer->buffers[cpu];
> +	subbuf_size = PAGE_SIZE << READ_ONCE(buffer->subbuf_order);
> +
> +	/* Data sub-buffers plus the reader page. */
> +	size = (READ_ONCE(cpu_buffer->nr_pages) + 1) * subbuf_size;
> +
> +	/* The cached read page, if present, is a full sub-buffer page. */
> +	if (READ_ONCE(cpu_buffer->free_page.data))
> +		size += subbuf_size;
> +
> +	/* The mmap metadata page is a single system page. */
> +	if (READ_ONCE(cpu_buffer->meta_page))
> +		size += PAGE_SIZE;
> +
> +	return size;
> +}
> +
>  /**
>   * ring_buffer_max_event_size - return the max data size of an event
>   * @buffer: The ring buffer.
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index e4a490d3d08c..d4a913ff8a69 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -5771,6 +5771,79 @@ tracing_total_entries_read(struct file *filp, char __user *ubuf,
>  	return simple_read_from_buffer(ubuf, cnt, ppos, buf, r);
>  }
>  
> +struct trace_mem_stats {
> +	unsigned long	buffers;
> +	unsigned long	snapshot;
> +};
> +
> +static void
> +trace_array_buffer_memory(struct trace_array *tr, int cpu,
> +			  unsigned long *buffers, unsigned long *snapshot)
> +{
> +	if (tr->array_buffer.buffer)
> +		*buffers += ring_buffer_memory_size(tr->array_buffer.buffer, cpu);
> +
> +#ifdef CONFIG_TRACER_SNAPSHOT
> +	if (tr->snapshot_buffer.buffer)
> +		*snapshot += ring_buffer_memory_size(tr->snapshot_buffer.buffer, cpu);
> +#endif
> +}
> +
> +static struct trace_mem_stats trace_buffers_memory(void)
> +{
> +	struct trace_mem_stats stats = {};
> +	struct trace_array *tr;
> +	int cpu;
> +
> +	guard(mutex)(&trace_types_lock);
> +
> +	list_for_each_entry(tr, &ftrace_trace_arrays, list) {
> +		for_each_tracing_cpu(cpu)
> +			trace_array_buffer_memory(tr, cpu, &stats.buffers,
> +						  &stats.snapshot);
> +	}
> +
> +	/*
> +	 * temp_buffer is allocated in tracer_alloc_buffers() and is never
> +	 * attached to a trace array. It temporarily holds event data for
> +	 * triggers when tracing is off. Account for its pages too.
> +	 */
> +	if (temp_buffer) {
> +		for_each_tracing_cpu(cpu)
> +			stats.buffers += ring_buffer_memory_size(temp_buffer, cpu);
> +	}
> +
> +	return stats;
> +}
> +
> +static int trace_mem_show(struct seq_file *m, void *v)
> +{
> +	struct trace_mem_stats stats = trace_buffers_memory();
> +
> +	seq_printf(m, "buffers: %lu\n", stats.buffers >> 10);
> +	seq_printf(m, "snapshot_buffers: %lu\n", stats.snapshot >> 10);
> +
> +	return 0;
> +}
> +
> +static int trace_mem_open(struct inode *inode, struct file *file)
> +{
> +	int ret;
> +
> +	ret = tracing_check_open_get_tr(NULL);
> +	if (ret)
> +		return ret;
> +
> +	return single_open(file, trace_mem_show, inode->i_private);
> +}
> +
> +static const struct file_operations trace_mem_fops = {
> +	.open		= trace_mem_open,
> +	.read		= seq_read,
> +	.llseek		= seq_lseek,
> +	.release	= single_release,
> +};
> +
>  #define LAST_BOOT_HEADER ((void *)1)
>  
>  static void *l_next(struct seq_file *m, void *v, loff_t *pos)
> @@ -9285,6 +9358,26 @@ static struct notifier_block trace_module_nb = {
>  };
>  #endif /* CONFIG_MODULES */
>  
> +static __init void init_trace_stats_tracefs(void)
> +{
> +	struct dentry *stats_dir;
> +
> +	/*
> +	 * tracer_alloc_buffers() frees tracing_buffer_mask and temp_buffer
> +	 * on failure without NULLing them, so do not iterate tracing CPUs
> +	 * here when tracing failed to initialize.
> +	 */
> +	if (tracing_disabled)
> +		return;
> +
> +	stats_dir = tracefs_create_dir("trace_stats", NULL);
> +	if (!stats_dir)
> +		return;
> +
> +	trace_create_file("memory_usage_kb", TRACE_MODE_READ, stats_dir,
> +			  NULL, &trace_mem_fops);
> +}
> +
>  static __init void tracer_init_tracefs_work_func(struct work_struct *work)
>  {
>  
> @@ -9293,6 +9386,8 @@ static __init void tracer_init_tracefs_work_func(struct work_struct *work)
>  	init_tracer_tracefs(&global_trace, NULL);
>  	ftrace_init_tracefs_toplevel(&global_trace, NULL);
>  
> +	init_trace_stats_tracefs();
> +
>  	trace_create_file("tracing_thresh", TRACE_MODE_WRITE, NULL,
>  			&global_trace, &tracing_thresh_fops);
>  
> -- 
> 2.34.1
> 

-- 
Vincent
