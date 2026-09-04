Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42847175A83
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527090; cv=none; b=kCzZQ7FUiCgT8BcZtBeqZPvVGP48JUlkmL7RrqUGXBYhu+ANFSud39o1SkiTcN1aP/RRgWrKNPi9x+WMFMS7mpclnfLwB8vVFcIAxhAnH0oSeOW3ZAoFygglOPUpTsN5YSEQH1weT5/0qHSAQtftE8Z934UwBxSYo6HnDXPX95k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527090; c=relaxed/simple;
	bh=/sa41UtzfZD0TugafCryUEevgoDGEdxb9eKqb+bLE7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GptSIEj8jmhuemMLXJhV7RJg+3N6AgXznVNRhBh5OCe0W18QFroGvmPRoc06sZOrmquxE4/W580vSaCjUqhsvG8MuTTLdD+Msp8XcrN4kjyAZ1r75wtNP45HJmgnQEzSXZJ+rRsIQ1zrgOHCr1lzxy8ECZAkXfN8v18v45Ohlug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vHJjiLVg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vHJjiLVg"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482dd6ee390so978388f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788527087; x=1789131887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SSjeK+InEOwSMEtUuIYSIw3wke/FpQf6/uQzbB1tv10=;
        b=vHJjiLVgIlFZHymZALAGImgxHdRGMAhWKfaotJbHF6MU/4v+cEwgacSttZ6R+B84xp
         2eYF1s5XY/0Rv3V/vfrLYeDvC5Yh33E/3DX7zZFrJg3xoeEEfZzGdBkkh8Mu0GzdS5eX
         DEGXCjbd/PS6BxJL4C82Ln9xEaArAACZdzWFcB5pdaiyuIi6YJdyYTYQNcq7nJcnk67a
         RQQ9gO1vYYyL1aLTTNewopxj0K6w6s9xrUU0a4c9P6+udQ9XAME9rO2oH+lsW1jE0u/6
         GwW9EFFG9OHzIAsEOPn9eqCzuIfqHp9h4WMjqlEdbUComJwnnOR1XT21NOtOA59KNQTS
         oKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527087; x=1789131887;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSjeK+InEOwSMEtUuIYSIw3wke/FpQf6/uQzbB1tv10=;
        b=JYUT2pXzOgpUZrdF21UTQID48CMM63RvvV64UdoVatfdVawqaYcbvC+nlx47rDFzdb
         h1XW/0J+yIO92DtldCVVF4mVyDCvvsYKabmzo6IpKDh9P/5CUAJnZS5no+7DKS8VavS+
         37AmAcm5LU02pjmt8rv+PMcPkoY8IpBla4V4dqtf5f9goG5oDR0VDgav19upJSpzo1TK
         yUNbRwXWeOkWfbba4howQXddwatplbwUiIxbSO3WK7pQRjjO8cxwPFcvF8R8h/RId1hE
         CEUWEVp4QCByOX2AWBJMz1VtnY9EBy+eykR+Jf61rTDp1LwzxkwPZ2AOMP2DSlND69Vy
         r1gA==
X-Forwarded-Encrypted: i=1; AKwUvByAgGBy6jVu0W2qLGtNccYv3o0390GSmKngjwmu+zQ/tZVJzlmESzJavc4ocn7d5JwyZh/lbaS6PbIJ4xI=@vger.kernel.org
X-Gm-Message-State: AFuF++lKKB6I0u82/TQ7LJLTDU2xKouVtuYpgZwgnhu0xilrPQJaary7
	xHlpNOatGaykvWz5smszAFXFy511nUk5E4J1F6youTnGPil0Frn8nxK/q20AdHNOeQ==
X-Gm-Gg: AYBFou0XLFB1HgqKLNAN6hIugTPsj4oLQ/ZLESttf62EZJAik8+lsyfk1zDFF85dp6A
	MEarInPyiNUd14JyT8Dk72v341ZhkDZojfbvtYLkk+xc7p9MN7jkF4fGWYkpJGN3UzjxqUjzAiF
	DaB9B0yp6OXK8rxZD14Fyts5GC4a+mGuRlXkNbX8uB2nzk1oJqluE8RAsqHcnNuJphI+9F9ZQ6d
	q/WfLjSVTwkeLH9bCnAvpguI43ThDrvvtdXT3drjPngVnACOXt7Tuutu8fF1naOna8XalY8qHaL
	NP788cMOaICZ41j6LTlMR44h7HOkYtt4GJHEG+xM1/mVnL1HlDRdRX3JWVR4j+VUL9pE+iPnbFl
	BuMShvPIrEmnuv9XHssdjjxvAvPdUmLw0Rbpx8XnvmrCTkcon2DEQbou7quOaqfLDx0coIE/zyK
	wCJHypsMuPna2/4V00PDRGDyqwaLu56eU9SohXIcXzjHlVGTSgJPqH4rRlRAJjw/guyWkHRCBdY
	rXucCsw/vOIyKnBkJ5SWe2wYYzQCAEH
X-Received: by 2002:a05:6000:2486:b0:485:8c16:a32c with SMTP id ffacd0b85a97d-4858c16a6f4mr3003582f8f.33.1788527086016;
        Fri, 04 Sep 2026 06:04:46 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b1320sm6312696f8f.27.2026.09.04.06.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 06:04:44 -0700 (PDT)
Date: Fri, 4 Sep 2026 14:04:40 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 3/4] ring-buffer: Cap static ring buffer nr_pages
Message-ID: <aprB6OE1juuopC7q@google.com>
References: <20260901155445.1475405-1-vdonnefort@google.com>
 <20260901155445.1475405-4-vdonnefort@google.com>
 <20260903125621.36cd33b8@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903125621.36cd33b8@gandalf.local.home>

On Thu, Sep 03, 2026 at 12:56:21PM -0400, Steven Rostedt wrote:
> On Tue,  1 Sep 2026 16:54:44 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > Static ring buffers (i.e. persistent, user-mapped and remote) rely on
> > the bpage::id field. The number of pages for those ring buffers must fit
> > into that variable. Enforce this limit on ring buffer creation or
> > user-mapping.
> > 
> > While at it, make buffer_page::id 31 bits. This does not change the
> > struct buffer_page size.
> 
> Let's not add that change to this patch. Especially since this has a fixes
> tag to it. That change has nothing to do with the fix.
> 
> The reason I had it as 30 to begin with was to reserve a bit in case I
> found another reason for it. If 1<<30 is too small for the number of boot
> buffer pages, we can always up in another order in the future.
> 
> > 
> > Fixes: be68d63a139b ("ring-buffer: Add ring_buffer_alloc_range()")
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> > index 28dd76edfecf..c4260d6ecdfc 100644
> > --- a/kernel/trace/ring_buffer.c
> > +++ b/kernel/trace/ring_buffer.c
> > @@ -350,7 +350,7 @@ struct buffer_page {
> >  	local_t		 entries;	/* entries on this page */
> >  	unsigned long	 real_end;	/* real end of data */
> >  	unsigned	 order;		/* order of the page */
> > -	u32		 id:30;		/* ID for external mapping */
> > +	u32		 id:31;		/* ID for external mapping */
> >  	u32		 range:1;	/* Mapped via a range */
> >  	struct buffer_data_page *page;	/* Actual data page */
> >  };
> > @@ -657,6 +657,15 @@ static bool rb_is_static(struct ring_buffer_per_cpu *cpu_buffer)
> >  	return cpu_buffer->user_mapped || cpu_buffer->remote || cpu_buffer->ring_meta;
> >  }
> >  
> > +static unsigned long rb_static_max_pages(void)
> > +{
> > +	/*
> > +	 * Static ring buffers are using bpage::id and must account for the
> > +	 * reader page.
> > +	 */
> > +	return (1UL << 31) - 1;
> > +}
> > +
> >  struct ring_buffer_iter {
> >  	struct ring_buffer_per_cpu	*cpu_buffer;
> >  	unsigned long			head;
> > @@ -2842,6 +2851,10 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
> >  		 */
> >  		nr_pages = (size - sizeof(struct ring_buffer_cpu_meta)) /
> >  			(subbuf_size + sizeof(int));
> > +
> > +		if (nr_pages > rb_static_max_pages())
> > +			goto fail_free_buffers;
> > +
> 
> If you want to add something, we could add to the beginning of this
> function:
> 
> 	/* Prevent ridiculously small sizes */
> 	if (size < PAGE_SIZE)
> 		return NULL;
> 
> to shut up Sashiko about overflows :-p
> 
> -- Steve

tracer_alloc_buffers() uses size of 1 for non-expanded buffers.

I'll test size just before 

  nr_pages = (size - sizeof(struct ring_buffer_cpu_meta)) /
  	(subbuf_size + sizeof(int));

> 
> 
> 
> >  		/* Need at least two pages plus the reader page */
> >  		if (nr_pages < 3)
> >  			goto fail_free_buffers;
> > @@ -2874,6 +2887,10 @@ static struct trace_buffer *alloc_buffer(unsigned long size, unsigned flags,
> >  		/* The writer is remote. This ring-buffer is read-only */
> >  		atomic_inc(&buffer->record_disabled);
> >  		nr_pages = desc->nr_page_va - 1;
> > +
> > +		if (nr_pages > rb_static_max_pages())
> > +			goto fail_free_buffers;
> > +
> >  		if (nr_pages < 2)
> >  			goto fail_free_buffers;
> >  	} else {
> > @@ -7836,6 +7853,9 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
> >  	/* prevent another thread from changing buffer/sub-buffer sizes */
> >  	guard(mutex)(&buffer->mutex);
> >  
> > +	if (cpu_buffer->nr_pages > rb_static_max_pages())
> > +		return -E2BIG;
> > +
> >  	err = rb_alloc_meta_page(cpu_buffer);
> >  	if (err)
> >  		return err;
> 
