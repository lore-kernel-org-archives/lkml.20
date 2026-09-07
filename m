Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04544398EE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799158; cv=none; b=hrJaX8M9xA76S/p+Yt3CNIhC20QLhfTtGQFd6pO7P0WUdo+7y6qYkaY3oih1fyH9BmLrrIYPBU8JXAtd8eaJ7HcX/9vcfJNpJALlGOe8aVPaYvX5/0v8n/NXy6N6xRYPgRasmQt7FHjLBtfIjpjYMllgCbAbq62cMnkbumoXzwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799158; c=relaxed/simple;
	bh=3AjmEBPNF0f2ZW0gEE5xyAHj5vNKrZyIijdhUxwlpjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKeSA16OLvH5OmqUdp52a+WdnHOe8/M49mDDKzt6Eigrxy1RUVgqmOGY8w9DKs0Xv6dTMSaEYCXv5nkt8jl0Vathikl4cxMkQQl87E2OHKEYMqzMBpVgLIHnUpLfwP/Mo4B9to7ARpHQaEUDB3k4IS5COZY6I5Li2kf/Cr8Q9D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S8vQuega; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S8vQuega"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4843e397f74so4551332f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788799154; x=1789403954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AgvnbjLKmi1onzNW5R9vjYjtLkXrQ/NRobaPoOB9+Bw=;
        b=S8vQuegaXxqi7NNP0mQokzaMCMZBuxgb0TNfneg6G+fxZ0Qum2rB0qQEyBRNpeKcq5
         XW85NHArqXH/IFwR9U77GFsapHgSGy+WX2o9pu2mS+USnNNVng5V18YEgtE42ZZ9pDok
         0hHzAFMBCw/o500J4Esa03DiPe5xf6u0Z+Gelugd8DsiBMFknsTtofiJvwXoqSD1Oh77
         tulgPjrW/xFv3eUq+/TL4rAy5zdpQsDdZCJPQ4zh49Zs3nf1rft+Y5h6eh1KIEbCjeyg
         GFuvDP49M95qauLm97NJKzdSttY8lJJB94hoGkWUowmuDqMCeyTb4fWzrOGDy6mhVM89
         supA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799154; x=1789403954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AgvnbjLKmi1onzNW5R9vjYjtLkXrQ/NRobaPoOB9+Bw=;
        b=lzVumWqY63NahcZpZisR8CpM1FxYpXiTOoBRg4LqT88g0bnXqlqdxpMF60K0/Vybk2
         hD+Y/d3KRpNhA+9KcRGEw26M/7wslF8Kyna3sHty1yG9mA/frhZvHCyJVjR2Ld8mpTgz
         G516rWrekcRDHSTuvPorWRgUFMO4aUyznFOok5u5ObcoyifNp4y39+xhiZ61SslaTQeW
         8U9pHygUUCf4TCmZLLdGNb4Wj0dvGJSt3ZwkVoCghG5EL4bT+T43JdOgWqBBg98daWFM
         0FApi/G5dUeHxGzA7QN1QHOmuIC1q8DInC5HUamiEjRuqHhcfcsCXA3T1b3osaHp4gBW
         U7Tg==
X-Forwarded-Encrypted: i=1; AKwUvBxS9A45qjuMdcW6v0+nuSRJ7TZ0Rz+tx2FnRkHw2I0gvbzaD38yiqHia03NiZzXfADjiiQkPNBuLeiqSZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mbXGH5fPEsOiTKWTIC9lJVJCKl6+oDVMpP140jIalLpiThgKlF
	mTOmqRusIEUKWxye22YX5LcAl6Il3na3qP3Ka4r1FvCRxj3AVl6DAabe36IHvii1ew==
X-Gm-Gg: AYBFou2VVK3F3pnSGOWBNH0pZJHefZqMIIyWMrx6PVRiHLK7PWzln5isJSu64IxUCYV
	JlfCGZp5aXZ4Dl9JiicSTL+w/xriLaRCnS3Yde4So5zWvYoTorOGnN4du+/zN9df6L1aMi3mi3h
	k8k0r/oyUu7Y5Mmt8OBP3or6MWKcUQr+3HDbOaRjZ6re3b4S23puUZtKHO1jGZVovf31snnjlGq
	bEH6uBoKXUugAH8J3ryO66SILZBjGxz00GuhZKUsCKBRgJaNQJILn6DtVj73rfVcRXdbD6jDMDT
	+lgyuygGiJFTDgbTj6KybkHMINdKi6Odkdb7exwLVVi/Ll2zNyWABalZJbKuj3J19h1UAEORK1X
	ONMCT3uuZ49KUEzyAnOCiUOqi/gzQbIAeFsAqvAeSx6//rKLCIbp2YqVNwrhmofKIgVzEgJStZ7
	q2UZhTXYEIFf263Z5vSmy0GG2Z17AyLBnmc0cXLA5AgQJEj7SXZ4sNPW5sdwHllEoXTtmU8eQeX
	MAdBzTeIGWYErD2p2ofOslET4mtLd2K
X-Received: by 2002:a5d:624c:0:b0:481:50ae:df9a with SMTP id ffacd0b85a97d-4857e4fdf87mr27409484f8f.9.1788799153524;
        Mon, 07 Sep 2026 09:39:13 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm23526484f8f.5.2026.09.07.09.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:39:12 -0700 (PDT)
Date: Mon, 7 Sep 2026 17:39:08 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: rostedt@goodmis.org, linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ring-buffer: Rename ring_buffer_size() to
 ring_buffer_capacity()
Message-ID: <ap7orBVddKVBMew2@google.com>
References: <20260907094238.3624013-1-vdonnefort@google.com>
 <20260907234146.9739977b015a6c8c39ce3693@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907234146.9739977b015a6c8c39ce3693@kernel.org>

On Mon, Sep 07, 2026 at 11:41:46PM +0900, Masami Hiramatsu wrote:
> On Mon,  7 Sep 2026 10:42:38 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > Since commit 8a5f63637890 ("ring-buffer: Fix subbuf resize race with ring
> > buffer readers"), "capacity" refers to the memory available for events
> > (excluding subbuffer headers) while "size" refers to the raw allocation.
> > ring_buffer_size() actually calculates this event capacity. Rename it to
> > ring_buffer_capacity() to align with this convention.
> 
> I think this is OK, but I have a question.
> 
> [...]
> > diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
> > index 8658cad53cb5..f0251788ec75 100644
> > --- a/kernel/trace/trace.c
> > +++ b/kernel/trace/trace.c
> > @@ -4712,9 +4712,9 @@ void trace_set_buffer_entries(struct array_buffer *buf, unsigned long val)
> >  static void update_buffer_entries(struct array_buffer *buf, int cpu)
> >  {
> >  	if (cpu == RING_BUFFER_ALL_CPUS) {
> > -		trace_set_buffer_entries(buf, ring_buffer_size(buf->buffer, 0));
> > +		trace_set_buffer_entries(buf, ring_buffer_capacity(buf->buffer, 0));
> >  	} else {
> > -		per_cpu_ptr(buf->data, cpu)->entries = ring_buffer_size(buf->buffer, cpu);
> > +		per_cpu_ptr(buf->data, cpu)->entries = ring_buffer_capacity(buf->buffer, cpu);
> 
> nit: Don't we need to re-word this "entries" with "capacity" too? 
> 
> Actually, this "entries" is a bit odd because
> 
> - ring_buffer_entries() returns the number of events.
> - trace_set_buffer_entries() sets the buffer capacity in bytes.
> 
> It seems we call it as "entries" historical reason, but now it becomes the
> source of confusion. Maybe we should change it too. (but in the separate patch)
> 
> Thanks,

Yes, I believe you're right, this "entries" here seems only used for
buffer_size_kb, buffer_total_size_kb and resize_buffer_duplicate_size() so we
can probably use "capacity" there too, it'll be less confusing than "entries".

I'll respin a v2 with that additional patch. (and a fix to the typo)

-- 
Vincent

> 
> >  	}
> >  }
> >  
> > @@ -8476,7 +8476,7 @@ int allocate_trace_buffer(struct trace_array *tr, struct array_buffer *buf, int
> >  
> >  	/* Allocate the first page for all buffers */
> >  	trace_set_buffer_entries(&tr->array_buffer,
> > -				 ring_buffer_size(tr->array_buffer.buffer, 0));
> > +				 ring_buffer_capacity(tr->array_buffer.buffer, 0));
> >  
> >  	return 0;
> >  }
> > 
> > base-commit: df2908090cda368b01ff43709f51890076c56157
> > -- 
> > 2.55.0.979.g7e5102b832-goog
> > 
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
