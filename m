Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC748EC78
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070171; cv=none; b=TRDFJUUFkrC75E7c6BqYkvHSGbbjElNl1lmh6Ec7WAukWgXfcs9N00dFZlRZCMUd6pX//UG8xLG7WtObbSRywhm0ed0cfUj60NctpGFAyuvwLEFa+j2yjoSCjWIlTeMX1NL4wFOSFGKDuyMgsydjiudmAUI1GPOmSDEYip19MXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070171; c=relaxed/simple;
	bh=a39y1L00I8aIeYf55Sn7jyd8GYre/QU0QKN9hRvsKzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oqfb9i23sXf2cubB1fmFp3VHnNkUcl2na/0hYC0F6QSbMSYHHSYR0l1o3iWzYEiZELIIDgJ05BPj794ktQTe4ozoB0PxAkNaSi5S/Xm0laHs0h3O8Fns6n1xpon6TngVHlaqz/a8lghdYPgTPNGZLCLAuZ5CAEObSj0hA1bzd8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pMPY2MF+; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pMPY2MF+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c3so3080747f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790070167; x=1790674967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=63jLM3p/yGHFLc3CNq4tuxz/dfqASMTYz4nLQopy+Yo=;
        b=pMPY2MF+oQWYDlqrQd3zbhZgL2p/SNbHMrEaNK2vxofJQIopgmpPeeiVbk6HZ9FV16
         Qi+A/Tb7lwDCVUXvXOYjVBQnP0bMXBh4zct6tb3W9pBN1tcTV/KMi/Ai5Fsdbz/3xERT
         CKJUkO473VpEz3ynpWZW/LigXxa1RoVnrA4O6juB4asliJK/ZN809Ci0KKVAHJkoqcll
         fAG+qRFhCFGz6pg9E2Zjt5PZwRgVCInzVeEuXf/fuwMpTA1No90pgqNxPb2OMW7RipET
         0zSNGCIu2R6KxJuQrGNw6fw6rAM8P4Mluy/K9ccI5dzLrZpM7XmDeICFU673F3gTpS+6
         LF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070167; x=1790674967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63jLM3p/yGHFLc3CNq4tuxz/dfqASMTYz4nLQopy+Yo=;
        b=Rz2jQvk30bnOgzySpYe2O6Zuiq9x7AuppO6V7u5lMUBXL+0Q6Q1BReJNdc8HyyLJ+y
         /4x02M6/kN+hDrwqPAA+2ykgl4aY9XTNWq5ktmJdPDOxRNy4vWaj2jnSZgGESKi4yW8G
         7uwImlTee9ZgQojldGzZS5FzOSuIUlk//WovSYU1sM6tJhnkx63lVr9iBBun8KyvJLrR
         nY8o3Y+hvx0CuOdugnREULkVdu2hqAd7T90+z297ECtzEILXtgPKWtrMF4SxRjNWmkey
         cjflF4TxATUc3q3w2btw7xb5XU9ypPu2XT7HkDCY0JM5gSMt9NMMvWQjtluCSwekBhPv
         5h5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzXgjoGgPx+ES1Mwf1XS2cOKvqcwOG4XIHaa942i0LENXCte0nAe6e1BPfnXNF0IK4CG1cu1JQ8fW1m3TM=@vger.kernel.org
X-Gm-Message-State: AFuF++mqV+V9XJ33F5UzYToNA83lv6kbQ6DnFUpmIwqqTeQq6jq8vMcN
	zu+0WvmI47+98y1IHshNbUNFAmRm0WwKlnx8iWCaA5UZeDBH/DcVf+A+G5wtcVa3GT8zIA+pCtY
	kWG0ohg==
X-Gm-Gg: AYBFou0Kpf2U9NzrI2/TTIw7zASdSetaTXeX8w8GsNriJoRHFBaxgFUxnjp+6mc4TDD
	nr9FwIqPveIb9e3Z128AU+l6tj6OswO1nhoURGihD2O+o5JBiLv9jDIjFCya0L3w1rJODaEodyV
	dFazWDasrzluNM+lE0Nd+QwqWNXB2FzCl4lI0YoTZPg1rubFRnT8eUznM1u0L2ILGYVOL3ec2aY
	9OA5LeFEJtXQ0iiWrq3xFMyXbT+g9tOcez3Nrn6C70aBJSC/ZjQSnHB2FH6DtOj3yphQDIzQPaI
	JL6R1KIMgky8dMkc9AKaWKkS4MWbGC/tGuEwAvO7DET68MCQNIWa1kzUl/a5y4PySHJNwYbQfQ8
	DAlS//bD8S9lFcsj+w4JJK19hrTldnMJXvkq8vRE2L+bIQEH6V+aKiOy3GWT1oxdmfNfWdz+fZA
	FnPwwyl7qh4HcLCT64E77b0ehz+iH2h/uKn6eUO+J7CrRFxDMRmooHt/PYMLJnuj86GESVV9c6Z
	9EKeFcIHnYlQzWRCIrN/FxI4GKyuMGve3XJ75p8alyY
X-Received: by 2002:a05:6000:4809:b0:487:360:58d8 with SMTP id ffacd0b85a97d-4871e36fcf0mr19672027f8f.46.1790070167049;
        Tue, 22 Sep 2026 02:42:47 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862795215sm3484729f8f.37.2026.09.22.02.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:42:46 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:42:43 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>, gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiang Gao <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH v4 2/2] tracing: add per-CPU memory usage statistics in
 tracefs
Message-ID: <arJNk5-i9LPI24Q4@google.com>
References: <20260916063322.472172-1-gaoxiang17@xiaomi.com>
 <20260921113047.1152602-1-gaoxiang17@xiaomi.com>
 <20260921113047.1152602-3-gaoxiang17@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921113047.1152602-3-gaoxiang17@xiaomi.com>

On Mon, Sep 21, 2026 at 07:30:46PM +0800, Xiang Gao wrote:
> Provide a per-CPU view of the tracing ring-buffer memory usage under
> trace_stats/per_cpu/cpuN/memory_usage_kb, using the same format as the
> aggregate file. Each file reports only the buffers belonging to that CPU
> across the global trace array and all tracing instances.
> 
> Signed-off-by: Xiang Gao <gaoxiang17@xiaomi.com>
> ---
>  Documentation/trace/ftrace.rst |  3 ++
>  kernel/trace/trace.c           | 67 +++++++++++++++++++++++++++++++++-
>  2 files changed, 69 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/trace/ftrace.rst b/Documentation/trace/ftrace.rst
> index 99ddfe26b7cd..e53cdd8d6702 100644
> --- a/Documentation/trace/ftrace.rst
> +++ b/Documentation/trace/ftrace.rst
> @@ -230,6 +230,9 @@ of ftrace. Here is a list of some of the key files:
>  	    buffers: ...
>  	    snapshot_buffers: ...
>  
> +	The same file is provided under trace_stats/per_cpu/cpuN/, reporting
> +	only the buffers belonging to that CPU.
> +
>    buffer_subbuf_size_kb:

Could you split the documentation part into a different commit?

>  
>  	This sets or displays the sub buffer size. The ring buffer is broken up
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index d4a913ff8a69..4010f28f3ebf 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -5844,6 +5844,52 @@ static const struct file_operations trace_mem_fops = {
>  	.release	= single_release,
>  };
>  
> +static struct trace_mem_stats trace_buffers_memory_cpu(int cpu)
> +{
> +	struct trace_mem_stats stats = {};
> +	struct trace_array *tr;
> +
> +	guard(mutex)(&trace_types_lock);
> +
> +	list_for_each_entry(tr, &ftrace_trace_arrays, list)
> +		trace_array_buffer_memory(tr, cpu, &stats.buffers,
> +					  &stats.snapshot);
> +
> +	/* Account for the bootstrapping temp_buffer as well. */
> +	if (temp_buffer)
> +		stats.buffers += ring_buffer_memory_size(temp_buffer, cpu);
> +
> +	return stats;
> +}
> +
> +static int trace_mem_per_cpu_show(struct seq_file *m, void *v)
> +{
> +	struct trace_mem_stats stats = trace_buffers_memory_cpu((long)m->private);
> +
> +	seq_printf(m, "buffers: %lu\n", stats.buffers >> 10);
> +	seq_printf(m, "snapshot_buffers: %lu\n", stats.snapshot >> 10);
> +
> +	return 0;
> +}
> +
> +static int trace_mem_per_cpu_open(struct inode *inode, struct file *file)
> +{
> +	int ret;
> +
> +	ret = tracing_check_open_get_tr(NULL);
> +	if (ret)
> +		return ret;
> +
> +	return single_open(file, trace_mem_per_cpu_show, inode->i_private);
> +}
> +
> +static const struct file_operations trace_mem_per_cpu_fops = {
> +	.open		= trace_mem_per_cpu_open,
> +	.read		= seq_read,
> +	.llseek		= seq_lseek,
> +	.release	= single_release,
> +};
> +
>  #define LAST_BOOT_HEADER ((void *)1)
>  
>  static void *l_next(struct seq_file *m, void *v, loff_t *pos)
> @@ -9360,7 +9406,9 @@ static struct notifier_block trace_module_nb = {
>  
>  static __init void init_trace_stats_tracefs(void)
>  {
> -	struct dentry *stats_dir;
> +	struct dentry *stats_dir, *per_cpu_dir, *cpu_dir;
> +	char cpu_dir_name[30];
> +	int cpu;
>  
>  	/*
>  	 * tracer_alloc_buffers() frees tracing_buffer_mask and temp_buffer
> @@ -9376,6 +9424,23 @@ static __init void init_trace_stats_tracefs(void)
>  
>  	trace_create_file("memory_usage_kb", TRACE_MODE_READ, stats_dir,
>  			  NULL, &trace_mem_fops);
> +
> +	per_cpu_dir = tracefs_create_dir("per_cpu", stats_dir);
> +	if (!per_cpu_dir)
> +		return;
> +
> +	for_each_tracing_cpu(cpu) {
> +		snprintf(cpu_dir_name, 30, "cpu%d", cpu);
> +		cpu_dir = tracefs_create_dir(cpu_dir_name, per_cpu_dir);
> +		if (!cpu_dir) {
> +			pr_warn("Could not create tracefs '%s' entry\n",
> +				cpu_dir_name);
> +			continue;
> +		}
> +
> +		trace_create_file("memory_usage_kb", TRACE_MODE_READ, cpu_dir,
> +				  (void *)(long)cpu, &trace_mem_per_cpu_fops);
> +	}
>  }
>  
>  static __init void tracer_init_tracefs_work_func(struct work_struct *work)
> -- 
> 2.34.1
> 

-- 
Vincent
