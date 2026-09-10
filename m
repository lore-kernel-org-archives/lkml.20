Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B26390987
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071638; cv=none; b=liHUZUBmgvLGI44LLsjLbsG6lbcjkO1KJ4ZeH0+rUnT/sMjzd1dmd1cT958PpSwoeQXg6hyMH7XwujDIW5/G1Ar/kjhW0M0MMqWChZctkjoFERZyzt5TphsuXGMWb0Nbxl3hUsE3ZfVae89z0K/pojirpo64nBf65qdqjCvoSdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071638; c=relaxed/simple;
	bh=pSWvcV8K/uxMZaanbQsY4b2j4vYqXLmb3x+8zHpAVM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCbxcXJ/3GBQY4NGSpW/BmLW4sNYnv4Zhpnq6hbAIKu0XWOct+Fcz1wTqnYumbOvcecgNQnqfvSj0G92HPVoX5BB0/uMzUsdCucfIpH2HATss6xwAIZFlDkAnSFCwkd+3uj1AJ/A/oqfLsefQOyOpUqXsLf5atYpQkhQBOOpl7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kVrVv/Hx; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kVrVv/Hx"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso108715f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789071635; x=1789676435; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mOBrXIIG7Xd6rL1yLTU4+HAFOoDEt4viqKwFGqyDssc=;
        b=kVrVv/HxLcTwancbveUEpQzjO5H+T9w1N6fEBXWK7xYYlIzyBn02ZtJPT0MfqppYev
         zIXRXsSbW6IxWSCquP3+ApxrB41cqxbgGPUS8hOQkp9on7Za20+jBqtlMaAKoG1fCAya
         wcAszjRNuzmg4XYyqD5pxFuEwjFKQR2ieoC5KGj0QC7yskK1n4zdJizCvyx3Wnq9wfzU
         +awLsAtB5FZvrfh1npxwlzHfnON8w9n53lGuvWEuwwu7Z/zKc8fEs8c0T6un146h3N+/
         d3+3X/VcIivHV+luZPrln/60MBa8kHsbqqN8aXvdG6viOUvYUcgxFXZ0kWKcpYjYVx3F
         lBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789071635; x=1789676435;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOBrXIIG7Xd6rL1yLTU4+HAFOoDEt4viqKwFGqyDssc=;
        b=MNJp8F0igMPjY0X57MrRlSZscq/0Brv0yv2brm6sLnATNj37DOrwid1iU5FH0HHD6F
         PT0Sds/oRtu9lIwBK9t05HGj995NSjXBdReHUskBiROyyco+eK+D3JWLU+bDJO8rhIeF
         skUoa7AFqmKioGAjhkjRbU9meDtIV2ZKamt2JbjPbHSny16+aIsrPYNxLcULLsUm7RRq
         E4t/8zwKYtDHq672DehkuocNxShkBaQ0jdfKgptb6oM3EeOecsHVLbBB5ONRB4pkOwJ8
         x8PGW/QMIULCwolkdZUUD3Xu59nC+jXuuydsqNLdKRHefFt+Qqa0dG/d4QBzAeLcJIBK
         cXBQ==
X-Gm-Message-State: AFuF++kY78jEqrZSyzobaxzwdJSZ3VLoZx0q0x1lrTv5OMwoX7P8b95D
	bCZ9I8zG41E6557fb1f4fldBokzlW88q4BPk8RIMJdTIVQrFdxI4Hl/9YVNaSD7Ud3WvUFRUj0j
	InX0GVg==
X-Gm-Gg: AYBFou2jj+XTHGCK4Xug62FhqclP774arMvNR5kd/4QvuONDKBeTcX5MkpV2iq1sdBh
	4zxoECR1Le+oc41KWfWIpPq8n0mpYmUb0DVC/Ymqvstgvewg34jbS0fRBEW5r6L9UHhxEO9L+m6
	aLHiFfCEJ1CLF3RgyAL/qnHlMGoxo/SX4tzZQX5E1Ij8fO2mcOHrsNiRhX1Sw61Mpt7ZJg8WgW/
	OHRLh0bvq0OexW3+ae1DyUEINQ/fOMia+NBhGRpbUrmP4qVlGZmWfiPt0oWh4526wymrbQRBeBZ
	+zzkfD3CdZ2dROGQoyT/d/pFCctMXaUexbgdJ6wGoUInnfyml1OAhaTm8KpxRo1GAW5rPgrnva/
	pxW1qkXMKJcFdEjKGTNNXHeMKWB5LOiD/qENBGs0xBghI+TVBd2o9DSYblY90fMnmHL/Gu4RcHi
	xS1d+chLwuVA1klYRcCGkS2sDw3JYgON+fYk/CXpzsH7S3HnIBk5eryn05z2AAVmIMZiI2fa8kT
	SMAqF2o1HSurcZcho9l46yXW2f1sjQHKggEsqJIZeQt
X-Received: by 2002:adf:f9d2:0:b0:486:e6a2:2d7c with SMTP id ffacd0b85a97d-486eb31b1ccmr1092516f8f.15.1789071634748;
        Thu, 10 Sep 2026 13:20:34 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm781202f8f.32.2026.09.10.13.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:20:33 -0700 (PDT)
Date: Thu, 10 Sep 2026 21:20:30 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] ring-buffer: Add a MAINTAINERS category specific for the
 tracing ring-buffer
Message-ID: <aqMRDq3SzHDhFEQp@google.com>
References: <20260908094035.0b180833@gandalf.local.home>
 <20260910155058.1ac4c991@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910155058.1ac4c991@gandalf.local.home>

On Thu, Sep 10, 2026 at 03:50:58PM -0400, Steven Rostedt wrote:
> 
> Masami,
> 
> Can I get an official Acked-by on this?
> 
> Vincent, you can also give an Acked-by too.
> 
> -- Steve
> 
> 
> On Tue, 8 Sep 2026 09:40:35 -0400
> Steven Rostedt <rostedt@goodmis.org> wrote:
> 
> > From: Steven Rostedt <rostedt@goodmis.org>
> > 
> > The ring buffer code in the tracing directory has always been decoupled
> > from the tracing code. It had a clean abstracted API to allow it to be
> > used by systems outside of tracing. The API even allowed the ring buffer
> > code to be drastically changed without affecting the tracing sub-system.
> > 
> > Recently, Vincent Donnefort has been contributing a lot of work to enhance
> > the ring buffer. He implemented the user space mappings and recently
> > created a version to allow pKVM hypervisors to use the code to trace
> > the hypervisor and expose the events to the user.
> > 
> > Create a separate category for maintaining the ring buffer code so that
> > Vincent can become an official maintainer of it. His work has little to do
> > with the tracing code itself. In the future, he may even be the main
> > maintainer of the ring buffer.
> > 
> > Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
> > ---
> >  MAINTAINERS | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 3a19da74d00c..71bd2f57055d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -27778,6 +27778,22 @@ F:	kernel/trace/trace_irqsoff.c
> >  F:	kernel/trace/trace_osnoise.c
> >  F:	kernel/trace/trace_sched_wakeup.c
> >  
> > +TRACING RING BUFFER
> > +M:	Steven Rostedt <rostedt@goodmis.org>
> > +M:	Vincent Donnefort <vdonnefort@google.com>
> > +M:	Masami Hiramatsu <mhiramat@kernel.org>
> > +L:	linux-kernel@vger.kernel.org
> > +L:	linux-trace-kernel@vger.kernel.org
> > +S:	Maintained
> > +Q:	https://patchwork.kernel.org/project/linux-trace-kernel/list/
> > +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
> > +F:	Documentation/trace/ring-buffer*
> > +F:	Documentation/trace/remotes.rst
> > +F:	include/linux/ring-buffer*.h
> > +F:	kernel/trace/*ring_buffer*.c
> > +F:	kernel/trace/remote*.c
> > +F:	tools/testing/selftests/ring-buffer/
> > +
> >  TRADITIONAL CHINESE DOCUMENTATION
> >  M:	Chen-Yu Yeh <chenyou910331@gmail.com>
> >  M:	Weijie Yuan <wy@wyuan.org>
> 

Acked-by: Vincent Donnefort <vdonnefort@google.com>

-- 
Vincent
