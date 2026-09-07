Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42CB44C518
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774258; cv=none; b=d2L8fdabRpNhSOiTMTr5cIU9iAbhwHCjg4zLvgakAGJA0knlcqQT/+UIZbEywynWideSHYKNOBCDFQ1/9+dhNRO0EjWvvpt29DCI9d/m1UoYiDhIVzVAa87djAQtEvo9KA5812k5LCgJdGRt2OXw8qpOGqoTsO32UL9EY+1VCf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774258; c=relaxed/simple;
	bh=V+G+pXgkWD5oMbyKMf/Kct+POyRrsj4wiFT5fbwgfxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxA5IhSnT8OMuzlW+fg1ew1HF4ayFdy3bB4jnzcQDRAgTSEWKvupmqDxG+jOQMmesG1v6Aw4b97Lw5PbOx+7bwwjc/i45vy1HWhYPzHn96Hq1PZIs3qQs9yIm0KuxM/vLk01/mFe5kKUNQzylwLUPWQKd6NAeKi3qV3jVeqJGS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JNU+a0nO; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JNU+a0nO"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so26550955e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788774253; x=1789379053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEvk7PRdC0kt8Nq2kMBGkJ8C3qjIvpK3CTREcBiW39c=;
        b=JNU+a0nO9yc3k35vxVv++FVr3oSTB0Wq+7iWWp5GhPB5hdAsum21fin+AxwM7G3+S3
         AsJPIx+KX10xym6TKl59SJxu+lZW2bddWMmDMZqJplaVTXxWGnvLTTTp5Q7PUDCM0hJg
         jjqwdS/eHox9eanFCTZyAkmx9eXYLPlfCJlDvHEnW78GQTfvogNBr4/E6E+hOJrZe77d
         Pbe9naXW+gInnk9cVwXrvwcrXwP1MsMwwM+r1FpU0PkAcODWWKlVEr6v9xLCuqzdq2vA
         1WbBwkXYsk/RbzKzz6rDZTWo1d4IRbtBnsxxxfIMhyJRPEUkz0aBZQuKqNz/pdAIPnF1
         6w+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774253; x=1789379053;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEvk7PRdC0kt8Nq2kMBGkJ8C3qjIvpK3CTREcBiW39c=;
        b=NJ3rWPBlwQvtcUzYmmlUUrIKi36RO8MQ99tKzVILATBrg3519t3kdGh1YlmfxjKklO
         lJxJDec35dUDfKPMx+k9o6qxxr4V0tkT0BypYArP98oJCQk+O6tzzi/Q5+uBifKz9RnV
         HcBwmVnFwvPVk8ON2og8dNrhWvtmYuGUz6NARdFEYJVBQvLDBhnKM5mf5pWn8cHc1L+x
         TT38wmxRhNpBXaLcjlsezmOr8Je617s3yF6qBCtjsl3gzLezTur7OhfCOjrqd/R0ZpS2
         6pWB6emyl1Z88YxZ6iLBF5pnBrQ+8vsIi/CR9aEpiGmzMnrpufh8VghpdJGyqB5Oo9CR
         tAJw==
X-Forwarded-Encrypted: i=1; AKwUvBwfhWwra/GJ4tvhVPcxZhUweYXOW9mBFoxb3mmU3gPRsFA4xOgxzjXHYSzHAXBURnC1NDf3OV3DTNa9bqw=@vger.kernel.org
X-Gm-Message-State: AFuF++mBMiPKN5RrUWTSsnoAP5zhmBgo6I5XX6uCGL3ewEpDTqL6+Ipa
	16DDTLiUB2XcT3kVKg+OWtaWflkY0dCidioE5Mu8Ke9IGk/TLhwKK1zNc1IiFmvfHw==
X-Gm-Gg: AYBFou11hF4HmuEVbCzgQaZIP0G27I5KbbTw5AOsSK7UX7Xy4+NnHtT1L9B/qHV22wl
	lsr6FK2NF5nTPVzCSUJ8JbkFsg3C6qclhYnlhkIg4vMJc1AftbOwdwZ3HOmp5mhZnk6nqTIzS+s
	YrGS/cjkeHMRI3+2dRD0gefXnGw7qFxYSQmTz2zdIlf1fk4GMj936fD6ngEYT90OrTqaxqCNuFZ
	/6L1ngyO7OcMqI+1Z/o/wbW/F19kAdTekIGOhIVJ4VAzrk1LAXCcs+ETVC822lzaey9mRoxBZ04
	BjDC9ZMxEp6f0IvJKyuJmRnOiXXYmjdcuD/drDaKMcyTBrLuo+DQ+9bNvGBhoM815Mq5nQsGxMg
	tvmVR7xCLH/+q+8W070Z5cOdtFHElIyV07IQA50s1pc19oD3ocO3gPzbfPUGG4EqyuMFdia1KOu
	i5zV9+Sr+2ncFhMj7OYqy9a0Q4fuTJcgBTsWml8gp+QlVhxJTse58WjraUZzkrFKndOlg2oiWb7
	OoRupCwWUGNN+yWNw==
X-Received: by 2002:a05:600c:4e8f:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-49cfa20cd1fmr190410805e9.19.1788774252331;
        Mon, 07 Sep 2026 02:44:12 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm309781515e9.3.2026.09.07.02.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:44:11 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:44:07 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ring-buffer: Rename ring_buffer_size() to
 ring_buffer_capacity()
Message-ID: <ap6HZzXJIzZhbHTi@google.com>
References: <20260907094238.3624013-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907094238.3624013-1-vdonnefort@google.com>

On Mon, Sep 07, 2026 at 10:42:38AM +0100, Vincent Donnefort wrote:
> Since commit 8a5f63637890 ("ring-buffer: Fix subbuf resize race with ring
> buffer readers"), "capacity" refers to the memory available for events
> (excluding subbuffer headers) while "size" refers to the raw allocation.
> ring_buffer_size() actually calculates this event capacity. Rename it to
> ring_buffer_capacity() to align with this convention.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> 
> diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> index afc7daa6ee7d..9e23ab66176b 100644
> --- a/include/linux/ring_buffer.h
> +++ b/include/linux/ring_buffer.h
> @@ -165,7 +165,7 @@ void ring_buffer_iter_reset(struct ring_buffer_iter *iter);
>  int ring_buffer_iter_empty(struct ring_buffer_iter *iter);
>  bool ring_buffer_iter_dropped(struct ring_buffer_iter *iter);
>  
> -unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu);
> +unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu);
>  unsigned long ring_buffer_max_event_size(struct trace_buffer *buffer);
>  
>  void ring_buffer_reset_cpu(struct trace_buffer *buffer, int cpu);
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index 9c03a555a6ba..2940ff763354 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -6547,18 +6547,23 @@ void ring_buffer_iter_advance(struct ring_buffer_iter *iter)
>  EXPORT_SYMBOL_GPL(ring_buffer_iter_advance);
>  
>  /**
> - * ring_buffer_size - return the size of the ring buffer (in bytes)
> + * ring_buffer_capacity - return the capacity of the ring buffer (in bytes)
>   * @buffer: The ring buffer.
> - * @cpu: The CPU to get ring buffer size from.
> + * @cpu: The CPU to get ring buffer capacity from.
> + *
> + * Capacity is the total memory available for recording event data in the
> + * ring buffer. It excludes subbufer headers.

Of course, I manage to do a typo... "subbuffer" 

-- 
Vincent

> + *
> + * Returns the capacity in bytes, or 0 if the CPU is not set in the buffer mask.
>   */
> -unsigned long ring_buffer_size(struct trace_buffer *buffer, int cpu)
> +unsigned long ring_buffer_capacity(struct trace_buffer *buffer, int cpu)
>  {
>  	if (!cpumask_test_cpu(cpu, buffer->cpumask))
>  		return 0;
>  
>  	return rb_subbuf_capacity(buffer) * buffer->buffers[cpu]->nr_pages;
>  }
> -EXPORT_SYMBOL_GPL(ring_buffer_size);
> +EXPORT_SYMBOL_GPL(ring_buffer_capacity);
>  
>  /**
>   * ring_buffer_max_event_size - return the max data size of an event
> diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> index 8658cad53cb5..f0251788ec75 100644
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -4712,9 +4712,9 @@ void trace_set_buffer_entries(struct array_buffer *buf, unsigned long val)
>  static void update_buffer_entries(struct array_buffer *buf, int cpu)
>  {
>  	if (cpu == RING_BUFFER_ALL_CPUS) {
> -		trace_set_buffer_entries(buf, ring_buffer_size(buf->buffer, 0));
> +		trace_set_buffer_entries(buf, ring_buffer_capacity(buf->buffer, 0));
>  	} else {
> -		per_cpu_ptr(buf->data, cpu)->entries = ring_buffer_size(buf->buffer, cpu);
> +		per_cpu_ptr(buf->data, cpu)->entries = ring_buffer_capacity(buf->buffer, cpu);
>  	}
>  }
>  
> @@ -8476,7 +8476,7 @@ int allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, int
>  
>  	/* Allocate the first page for all buffers */
>  	trace_set_buffer_entries(&tr->array_buffer,
> -				 ring_buffer_size(tr->array_buffer.buffer, 0));
> +				 ring_buffer_capacity(tr->array_buffer.buffer, 0));
>  
>  	return 0;
>  }
> 
> base-commit: df2908090cda368b01ff43709f51890076c56157
> -- 
> 2.55.0.979.g7e5102b832-goog
> 
