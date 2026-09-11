Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88ECF3E92AC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147386; cv=none; b=levlZNXxiX3nDB+rc3E3RmFXrHu7DNLDjbYOU8RdUZCws6X8cERaEIWd03w8KkPolmVCB676UuLWAZ/AbyFwdy6SlDbPDbTuAqdFerQxj21k8mRbvKXiFqxji8Z8K9dPpSLKuV8xxIlOka65wZe3YMNwXHn2/1z5/QLJGtB2h8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147386; c=relaxed/simple;
	bh=qIYU1MO0sijHfVdNSQ+Hm4R8rpjO/e9JudMeQRnZ9Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGO7d5FlXPJcL+p24DvFRdhSEf+vbVsHaVvknNHYy/GaOzI4oHH24k7rmhri3CuueuzQVnmvl9ZSvLWON7Mnwi8v4ha8HrqruhHeyIDWv8wAvjw/BsGjbSIxCDfSby0YfKq6OR86QsF305OL73AkhD/1ndWB8S9WToThwUkRi+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IlpRSs0Y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IlpRSs0Y"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso825967f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789147383; x=1789752183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xQGFbAKMzrECW+70hXJrrw/HwpzyGAxZIlkWvSuSMU0=;
        b=IlpRSs0YXO7KYPxYHsiL2va+0N8VtEmucgi60EDw96Z37mq2xNZFwdoDQueHTKUtBg
         gUkW+M74FFmNcoFWEi2EDnXmyWItWHdk/UFzicu4O3H6AhCQu+op3LRaRR/NqY9T7YF3
         jl7I7R8l+Mv39qUoq+1KBwoUs7+l/CD0x91DC7y0s5BvjBEQwoqrbegVnnZdmkZ2DnhW
         cbUyBdS5zMtfCQpGHadTJ5WYyF0r+mRNdCAXyyUBeJ5POeWUH737eoHRKpzfvKnXGryW
         HBB4aU3gVuR4NsmQM56XwQmI5wxUjVnwb0MFOo7F3+X40hXYZeDMhTrPYJ7E5c25i5Td
         7tcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147383; x=1789752183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xQGFbAKMzrECW+70hXJrrw/HwpzyGAxZIlkWvSuSMU0=;
        b=Mvad8Xrgc0oiPrEoM6lDGMTm3/ayf6t6dmhwvk6R/S2e2pNRqIFBqvIqZI9b5g4JI+
         mPObMC6k/tD4sDCOdHWdx9OgmAHGV9RDFPAmoi8T/9wQ91g8tEEVkwjHk3Qilce1Fjf4
         ApBR8syOuo8qqkIyhfVoqyfCNqDH+BHBSw5Fg/ATSCx9ECBsxOf5D+3OTklWIQFe6ThQ
         nDytuhTOTiuujzNAL+Rtt5Hy8B63DRjc00PlbAeWVDxtVvze996X17/fQQJTN7mdI4in
         ylgPdAxgfY3CCbcYNqgW3RB137CgDiof12J5UjUwukQHaab/Y7aaLdRkz61h1jkd+QiI
         NREw==
X-Forwarded-Encrypted: i=1; AKwUvBzdvHjY1+diNQOFLRB4TEimQKiHWkgu4zCvwn0CoA8P6GDk67RmnzzPZkg5faHt9rJ5uerOIwDhhC88Gmw=@vger.kernel.org
X-Gm-Message-State: AFuF++nQVImPtj3+vzqBlssxuix4jSETn1MG9ayriuJC+W6DfLlu5WV2
	QlsA1HIaUW84YIqkYzSmEjfHpN0V/U9FYpqfvMwxDA+w0qSndbieeQtwdYQkimnhbA==
X-Gm-Gg: AYBFou0fo8ITDc2KIXEEFDZT3Eb9fOsnKatbVIUhDc+ifdXW9eFeuz3SLpJF75FdseW
	LW8wQ7IMzqJAhtjn3D2BSdse4edLbjKYjg0jUMqfuCxQeWHP31oc6d9MovVU8BWgji01zoyoecZ
	nUvgMB0yoZrE/VZgr4oHel4QUZDGPwTAqSctRCPfZGiUm0qdhut4ildHiiF7eYYkRget+l4o47C
	DDHZja/izKY6MVcpqofuZOB0VCw+kO8CD5rZFWtrihR2Xl8VGZC5NBRTNu8xqwLjwcIoTM7Gy45
	UPbSsoPXNsfJiO30bfWEYmR9pBNOh3utJxpdLNy5jR73SKyh2pmNqUCXAB8ylaAPBNCTXq0oVVO
	cuv1AnXHfCtA8WB/Pc6iI47/PbXMC59F2Xhx7RDL9gxcE2aMv4UCuAJDsTMAR1BiaCveD4N/fCx
	+A+LEp3Yyb05rIPOQTQN6vfzLmEvjzSi/oG+U8bH6TuNQzEkmSo+b5hEgJFjit+2WhgFWOjBa2c
	KTmvZ4lU9JpNo35alufWYsZ+1VwFWdkOb1T9K/EAHkfGwkeSwKDdw==
X-Received: by 2002:a05:600c:4687:b0:49d:2625:1b0f with SMTP id 5b1f17b1804b1-49e619e7090mr62693815e9.31.1789147382199;
        Fri, 11 Sep 2026 10:23:02 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm184389015e9.1.2026.09.11.10.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 10:23:01 -0700 (PDT)
Date: Fri, 11 Sep 2026 18:22:58 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Xiang Gao <gxxa03070307@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lorenzo Stoakes <ljs@kernel.org>, gao xu <gaoxu2@honor.com>,
	yinchuang1@xiaomi.com, linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiang Gao <gaoxiang17@xiaomi.com>
Subject: Re: [PATCH 0/2] tracing: add ring-buffer memory usage statistics
Message-ID: <aqQ48rGDhQka916N@google.com>
References: <20260905112732.3705405-1-gaoxiang17@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905112732.3705405-1-gaoxiang17@xiaomi.com>

On Sat, Sep 05, 2026 at 07:27:30PM +0800, Xiang Gao wrote:
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
> Patch 1 adds:
> 
>   /sys/kernel/tracing/trace_stats/memory_usage_kb
> 
> reporting:
> 
>   buffers: ...
>   snapshot_buffers: ...
> 
> covering the global trace array and all instances across all CPUs.
> 
> Patch 2 adds the per-CPU view under
> trace_stats/per_cpu/cpuN/memory_usage_kb.
> 
> The values account for the full pages backing the data sub-buffers and
> reader page, plus the cached read page and mmap metadata page when
> present. Slab-allocated ring-buffer metadata is not included.
> 
> Xiang Gao (2):
>   tracing: add ring-buffer memory usage statistics in tracefs
>   tracing: add per-CPU memory usage statistics in tracefs
> 
>  Documentation/trace/ftrace.rst |  15 +++++
>  include/linux/ring_buffer.h    |   1 +
>  kernel/trace/ring_buffer.c     |  41 +++++++++++++
>  kernel/trace/trace.c           | 104 +++++++++++++++++++++++++++++++++
>  4 files changed, 161 insertions(+)
> 
> -- 
> 2.34.1
> 
> 

It looks like you have sent the same v1 again.

-- 
Vincent
