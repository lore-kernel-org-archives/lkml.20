Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8A3448B9C
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788773199; cv=none; b=ZWOmwWBPoJR5nZIGyGFgwHvyWEBrp/aWLV3MzwwgVy9lyXYOsutcitX4ytb7an8fkjgXb9LyRn7ineIriZIrar0RnF8IfqRqCdUaCtESIICCUGgeGfHt9emtg3Ji0gY9Y67+UXmPqBqhJspzZBmLnu8Oyo8ce/j/2uaDqCpNc2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788773199; c=relaxed/simple;
	bh=NZjqV9sLk5M4ltbVQvH+Y+qK2Y8lMcauE4SFlxJ+Ds8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMIVgyby2hSud4+gOHj8XcDoKU4hNk+rebstRmhbK2Yuh6mWrtl9ZAPbPMdNBj0aCrjP0aCVcqlwT3o68MuoSSGcxBf9qZOuTDRISry2UMZJCUEQiyYJSgIp9AugjA3yyc14dAPvvXexbp3h/lmJufzrQJs2VPR9UZVg1xGh99g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oc/9RHjn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oc/9RHjn"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482e257a23aso2277215f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788773195; x=1789377995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9MEER6Ux+1nai2tIQnasCaU7opCHdz3VYPzH1+GfP78=;
        b=oc/9RHjnXk7pwot9XKvkXsb0x9HPlz4mm6TcWBKI6T6Eajldra0aI1659bgHamFjZS
         x8ARtuj5NGMde1px9Ewpuwnss07Z4cF/kc5YsAt2X3HZEsA+JGbYmIhYyC835BPAKDmt
         Kf3HAAPOdlLFEaHX4KZ7s51JSvTIUNvWtDvgCYRCfiKnwoSIYh6jwYusjNc9Bog6AVuv
         sfGVYleZ1ACxu0f3KysQJ+00Y0QRlKP8BHVjPBFNRwYShVc4h73oqp6COzr3Yfb6thjr
         NF7xlLTIXP7L/tqQeBo0zN5PgwmS1O/lBX0a5y6sywEELRywcKgrYTxI6JnmIDAGzG/0
         fjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788773195; x=1789377995;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MEER6Ux+1nai2tIQnasCaU7opCHdz3VYPzH1+GfP78=;
        b=fsnz+R+lang2RgKWdUE0tq4LBSAbS90qswsQp4WKqf6nQ1i9WQxCkzoSrUEvjiKj76
         dMebCmMzO9NgOA8YpQPUXg/Mx8aBTzO28Y5GbOZhN0gMbM9s4ZlMWr3yUFVj6l42GZDi
         ZwR+equJZtLCQWI5CgaN+VnxjPsvfQRArP6O9vLMJtuMZgM38P5gjA0VlBzlqBvnsLgJ
         GY8qfRDDsUEXIUHqspfnwmf8F1YCl2OPlz45vYy5rTRsiSDFfmm8FzcH/9sxoNtl89Vc
         vuSBtf/dnJbuvGvlGEXqkYp4AYpOWYHcCUZmncFPla0MkEaKYDS1YrmdinQ3CpiYLBgX
         uAnA==
X-Forwarded-Encrypted: i=1; AKwUvBx3S1MsqNaKzhDDwZZnMwM7A5CT5T4ctlk/9F7qjiPDY9PT1wVF5qNCeg3oHbtq1q28oONcirTChtuLrwU=@vger.kernel.org
X-Gm-Message-State: AFuF++kI6ksyrJhZe+wt4htBbcTou6Qji/ldXyqzMa6/S83m8hR8i41h
	ZkJEMz7v+VzBQUalINgzthQn+fYxqfvn445DnB+N//GU5HhhNFBjoiJP+3InSx0nUw==
X-Gm-Gg: AYBFou24g4Rl2Qvn7gyieCPgt5Rr7/14Ih2waiflQEBMNmFugtZabkjvMscV7ltL/PW
	J8mFNcagNm9KvGYtUih7UHdw2iltUhbUVMb7v+COtvO6XQgvo5TqeoomOdVYGlE9wzlUqpu1POu
	JD+YI+YbfyMYjYy1rpp7u8kOhCn3+joU/l8FFE4E77KiVBiKxZ5znTj8WpPWsqQ/reth+p9EZhl
	dYHdDml1JMQm/E0byBf4L8h4UaVTGsXRNxdo1iwCD157Y4pjUbkEomwx79lWAPJjJJTFu1wAf5Z
	JNxrA8DRbQBHKlQmEbrU3I0tuAwpca6e/PPrV63+hyiJMqDZD+dM5XlobqC4b1HckKMLOXhJN/A
	mniKbLW6422vAwpXBO2oYoD+XAcjk2h0oXMDuf0/f55CDMaEjat/xxpHP+KU+yuvo7FNEyg17PP
	W8ntEMiC7PRe8L8xWRa/tyAhMXZ4FMyBledUr+1uLnjU7B98iAea4YOFFlX7pyrOjHspRT0AHqo
	/OWwtYV2lxqxl0wQXXSdMXkQ6hfkODw
X-Received: by 2002:a05:6000:2282:b0:485:8a46:b3c0 with SMTP id ffacd0b85a97d-4858a46b595mr21215117f8f.40.1788773194651;
        Mon, 07 Sep 2026 02:26:34 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm26508442f8f.32.2026.09.07.02.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:26:33 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:26:30 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>, gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiang Gao <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH 1/2] tracing: add ring-buffer memory usage statistics in
 tracefs
Message-ID: <ap6DRq_tWE6uGLFm@google.com>
References: <20260905112732.3705405-1-gaoxiang17@xiaomi.com>
 <20260905112732.3705405-2-gaoxiang17@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905112732.3705405-2-gaoxiang17@xiaomi.com>

On Sat, Sep 05, 2026 at 07:27:31PM +0800, Xiang Gao wrote:
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
> covering the global trace array and all instances across all CPUs.
> 
> The values account for the full pages backing the data sub-buffers and
> reader page, plus the cached read page and mmap metadata page when
> present. Slab-allocated ring-buffer metadata is not included, as it is
> already reported through Slab and would be double-counted when
> subtracting tracing memory from lost RAM. Range and remote buffers,
> whose pages are externally owned, report zero.
> 
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> ---
>  Documentation/trace/ftrace.rst | 12 +++++++
>  include/linux/ring_buffer.h    |  1 +
>  kernel/trace/ring_buffer.c     | 41 +++++++++++++++++++++++
>  kernel/trace/trace.c           | 60 ++++++++++++++++++++++++++++++++++
>  4 files changed, 114 insertions(+)
> 
> diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
> index 84f06bf0da9b..ff9d604dd1b8 100644
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
> index 0670742b2d60..64eded40222c 100644
> --- a/include/linux/ring_buffer.h
> +++ b/include/linux/ring_buffer.h
> @@ -166,6 +166,7 @@ int ring_buffer_iter_empty(struct ring_buffer_iter *iter);
>  bool ring_buffer_iter_dropped(struct ring_buffer_iter *iter);
>  
>  unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu);
> +unsigned long ring_buffer_memory_size(struct trace_buffer *buffer, int cpu);
>  unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer);
>  
>  void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu);
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 8e2485bb3aa8..a8719b517798 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -6464,6 +6464,47 @@ unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu)
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
> + * Range and remote buffers do not own page-allocator memory and report zero.
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
> +	/* Range and remote buffers use externally owned memory. */
> +	if (buffer->range_addr_start || buffer->remote)
> +		return 0;

Hum, why not including that? This is still memory immobilised for tracing.
(notice though remote buffers wouldn't appear in ftrace_trace_arrays)

> +
> +	cpu_buffer = buffer->buffers[cpu];
> +	subbuf_size = PAGE_SIZE << buffer->subbuf_order;

READ_ONCE(buffer->subbuf_order);

> +
> +	/* Data sub-buffers plus the reader page. */
> +	size = (cpu_buffer->nr_pages + 1) * subbuf_size;
> +
> +	/* The cached read page, if present, is a full sub-buffer page. */
> +	if (cpu_buffer->free_page)
> +		size += subbuf_size;
> +
> +	/* The mmap metadata page is a single system page. */
> +	if (cpu_buffer->meta_page)
> +		size += PAGE_SIZE;
> +
> +	return size;
> +}
> +
>  /**
>   * ring_buffer_max_event_size - return the max data size of an event
>   * @buffer: The ring buffer.
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 01a5e87af299..b343e03a6cf8 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -5769,6 +5769,52 @@ tracing_total_entries_read(struct file *filp, char __user *ubuf,
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
> +DEFINE_SHOW_ATTRIBUTE(trace_mem);
> +
>  #define LAST_BOOT_HEADER ((void *)1)
>  
>  static void *l_next(struct seq_file *m, void *v, loff_t *pos)
> @@ -9188,6 +9234,18 @@ static struct notifier_block trace_module_nb = {
>  };
>  #endif /* CONFIG_MODULES */
>  
> +static __init void init_trace_stats_tracefs(void)
> +{
> +	struct dentry *stats_dir;
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
> @@ -9196,6 +9254,8 @@ static __init void tracer_init_tracefs_work_func(struct work_struct *work)
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
> 
