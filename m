Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDD53546E1
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137187; cv=none; b=GIT/mVknAuNMbQkYOll2mDInzB+6t5ovNTWNPZ1vbONWxepn6pVXkt/Fo+8PeUO+bfIpger1nHxNOGIl2V/+Fbx5dV3WthMa80LdkxRZa1HiyLMfpk+WWi39huHJu7IWHtd+35SsqwaiDOzfls3MmN4vqr6guW5Pv50YNMdzIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137187; c=relaxed/simple;
	bh=7hko7o/H65sdidG9ua5QINwVpPh5lJ1izpv08XBoVOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zlf7Q1VQoVngivKcyBx1IVxj9cc3+BXPxCRTpcdk9qfltoCfpTRZSPWjmXT+d3d4Pk5bDOAwn1l5BQVpd/nOKqK7/70xEMlnRs2Gm5urCHsksQXI7cFoMV+oJejZ7iKveeQvpr7xxlI9YFrtvjK/Ip8lRDGtxQa0AWYc3hO/xSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hAsXHPb+; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hAsXHPb+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so553222f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789137183; x=1789741983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8KEhl53zkAvqFRN3fbPLduFb215GtLtUWY587bW//Dk=;
        b=hAsXHPb+PUktTLkPSxfx0e5cjZ/fkH3scHXHrcDcaqD1snxseHCXsq4sad+CDNyoJf
         cBeHRTFFz0txWHVDRisL/4ZPedTBiEl/YOeQecTZXQsRAKw+xo3i87de6gxEMjICTcdt
         rWNK4YM6ljPI4SkJpPu2OyESfHVvMYJ40jFWLEEX0c2pgoUravmTYdq6hV2am1YKHF4O
         pmHNI7KumxGDtQgUMl0oo9LiHkb4onAdfNPgheAZqxWL9albD87sml6S0EtiVDx8s4kZ
         xer+azOrTeVzQtpiYXMG+OooJ204wbcYRKBxBfMkyxTkHWx6yQmVJEZHcZ2GClL73y2A
         gKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137183; x=1789741983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KEhl53zkAvqFRN3fbPLduFb215GtLtUWY587bW//Dk=;
        b=BgfCNaYJYZFywpwoe86HsKaYyOdRHUtY2YqgvGgLErDbGax00cno4HVfgbVXdniBvp
         oIiTQepnIKEke71SxQPhaYbHqLr16xsjaWlEATtCCvq7jnNd/CMa5w0C+qZqMpVcxWzz
         YfTvht4j5+Wjv+C/uGf7M9kKbZEUC1MpwtLBp6EWZd/Ws92aWNzG8kxyKIIuv1TGE7og
         9KbQVncZnmb437IJ+loFm9zGXVoHgzKd36HsAT841P9P7DnBtTfxvwDRaAMjh5kyLVjP
         bdjlElE4uMhX+nCk2sfDdy27/bf0963q3YIUr8gewViJ2j37PNf0IJmX3YC2ROJKinRZ
         +Ymg==
X-Forwarded-Encrypted: i=1; AKwUvBzhFHs/xtJYNSDAqLTXFoRc+y3D/AFnmZv2n8NRxt0TOg4JJNhD8uVTtsoe7HlCOwJK5jsnuVk7I4Bq2bg=@vger.kernel.org
X-Gm-Message-State: AFuF++lkLoZTF0wyNX30+nbHJibY9CH1UlP91ucra9L1EQiSprKkrs/J
	56XDCZIvXOpIQfDPyhUkDp0Wd/lk4dp2WTIubFnghSNkfPi+Qg90kcygkcM1LGsVrp7dGPlMLkR
	WYYpSXg==
X-Gm-Gg: AYBFou0cGWynnMklFLNxk6rg8rmqrqJEhRN5kpuVN1uBhPlIzK3ilTAfAb9tTIiVWLr
	uuEid5FzREdler7gD2cOwQgHCcXmPJJF6tIDUWvU0vwXe1Qre7yqJkRH9KITviDeYni6n/CmAB6
	WSJUNKgySHJEzweKwQc9AXZCXudZA2gCE2Jr9t/oMZvNgFTVncy9pM2s7IH6FehXurDV/qaLXzg
	MSph/n9ND/WLzQi8+/f9ZtYKtY3AOoT3CSkf0z+Q+0Zx8nrT65nwnuKRmgLXQZ7uinSZGPZYE8s
	toiKJszyYslpLbauBVfGU192ovI80TkBATUGRO/oXCcoMIklDe4c6l6j/54o90bAQ54Jtxptn8p
	9g2vLmzTmhyECUIN8vYJlXnf9yeWREROx/L4jtbustsPcpoWYuO2gnSxZ3TZwb834XHfXdpV1M2
	tv2SmiTJ0yEv2I7YQnFx1er9aGrANpIcsx3mehdDXyIZ5NDKCwi28WUHYg3VgqS9BIvJOW7lC9x
	uc9zmsT4El/FxaiFSAFw+0IljQZYoesu0YUDMN5b4U=
X-Received: by 2002:a05:6000:4a1e:b0:485:8542:fee3 with SMTP id ffacd0b85a97d-486eb312fb0mr11837137f8f.16.1789137182139;
        Fri, 11 Sep 2026 07:33:02 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm6594529f8f.13.2026.09.11.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:33:01 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:32:58 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: mhiramat@kernel.org, linux-trace-kernel@vger.kernel.org,
	mathieu.desnoyers@efficios.com, kernel-team@android.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] tracing/remotes: Account for ring buffer page
 header in size calculation
Message-ID: <aqQRGv26MEjjl1Br@google.com>
References: <20260907192643.42513-1-vdonnefort@google.com>
 <20260907192643.42513-2-vdonnefort@google.com>
 <20260909181316.676b8c56@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909181316.676b8c56@gandalf.local.home>

On Wed, Sep 09, 2026 at 06:13:16PM -0400, Steven Rostedt wrote:
> On Mon,  7 Sep 2026 20:26:42 +0100
> Vincent Donnefort <vdonnefort@google.com> wrote:
> 
> > trace_buffer_desc_size() and trace_remote_alloc_buffer undercount the
> > required pages because every ring buffer page contains a header
> > (BUF_PAGE_HDR_SIZE). Account for that header to ensure allocated remote
> > ring buffers aren't smaller than requested by the user.
> > 
> > While at it, ensure those functions catch nr_pages overflow.
> 
> Fixes patches should never have "while at it". That means it belongs as a
> separate patch. The only "while at it" that is acceptable is white space
> fixes or other formatting changes along with new code that is not a fix.

ack.

> 
> > 
> > Fixes: 2e67fabd8b77 ("ring-buffer: Introduce ring-buffer remotes")
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/include/linux/ring_buffer.h b/include/linux/ring_buffer.h
> > index afc7daa6ee7d..7a1a92f87650 100644
> > --- a/include/linux/ring_buffer.h
> > +++ b/include/linux/ring_buffer.h
> > @@ -8,6 +8,8 @@
> >  
> >  #include <uapi/linux/trace_mmap.h>
> >  
> > +#include <linux/ring_buffer_types.h>
> 
> Hmm, why is this after the uapi header? It should be part of the linux/
> headers.
> 
> > +
> >  struct trace_buffer;
> >  struct ring_buffer_iter;
> >  
> > @@ -281,9 +283,14 @@ static inline struct ring_buffer_desc *__first_ring_buffer_desc(struct trace_buf
> >  
> >  static inline size_t trace_buffer_desc_size(size_t buffer_size, unsigned int nr_cpus)
> >  {
> > -	unsigned int nr_pages = max(DIV_ROUND_UP(buffer_size, PAGE_SIZE), 2UL) + 1;
> > +	unsigned long nr_pages =
> > +		max(DIV_ROUND_UP(buffer_size, PAGE_SIZE - BUF_PAGE_HDR_SIZE), 2UL) + 1;
> 
> This is getting a little unwieldy. Let's break it up:
> 
> 	unsigned long pages_req = DIV_ROUND_UP(buffer_size, PAGE_SIZE - BUF_PAGE_HDR_SIZE);
> 	unsigned long nr_pages = max(pages_req, 2UL) + 1;
> 
> Or better yet, let's add a new helper function:
> 
> static inline unsigned long calculate_nr_pages(size_t buffer_size)
> {
> 	unsigned long req_pages = DIV_ROUND_UP(buffer_size, PAGE_SIZE - BUF_PAGE_HDR_SIZE);
> 	return max(pages_req, 2UL) + 1;
> }

I'll introduce the helper from this patch as suggested.

> 
> Then this could be simply:
> 
> 	unsigned long nr_pages = calculate_nr_pages(buffer_size);
> 
> >  	struct ring_buffer_desc *rbdesc;
> >  
> > +	/* Capped by ring_buffer_desc::nr_page_va */
> > +	if (nr_pages > UINT_MAX)
> > +		return SIZE_MAX;
> 
> Separate patch.
> 
> > +
> >  	return size_add(offsetof(struct trace_buffer_desc, __data),
> >  			size_mul(nr_cpus, struct_size(rbdesc, page_va, nr_pages)));
> >  }
> > diff --git a/kernel/trace/trace_remote.c b/kernel/trace/trace_remote.c
> > index 75fa1ffc4c96..2e0fdbb730b7 100644
> > --- a/kernel/trace/trace_remote.c
> > +++ b/kernel/trace/trace_remote.c
> > @@ -980,9 +980,12 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
> >  			      const struct cpumask *cpumask)
> >  {
> >  	size_t min_desc_size = trace_buffer_desc_size(buffer_size, cpumask_weight(cpumask));
> > -	unsigned int nr_pages = max(DIV_ROUND_UP(buffer_size, PAGE_SIZE), 2UL) + 1;
> >  	struct ring_buffer_desc *rb_desc;
> >  	int cpu, ret = -ENOMEM;
> > +	unsigned int nr_pages;
> > +
> 
> 
> > +	if (min_desc_size == SIZE_MAX)
> > +		return -E2BIG;
> 
> Looks like this should be a separate patch too.
> 
> >  
> >  	if (desc_size < min_desc_size)
> >  		return -EINVAL;
> > @@ -991,6 +994,7 @@ int trace_remote_alloc_buffer(struct trace_buffer_desc *desc, size_t desc_size,
> >  	desc->struct_len = min_desc_size;
> >  
> >  	rb_desc = __first_ring_buffer_desc(desc);
> > +	nr_pages = max(DIV_ROUND_UP(buffer_size, PAGE_SIZE - BUF_PAGE_HDR_SIZE), 2UL) + 1;
> 
> And here we can have;
> 
> 	nr_pages = calculate_nr_pages(buffer_size);
> 
> -- Steve
> 
> >  
> >  	for_each_cpu(cpu, cpumask) {
> >  		unsigned int id;
> 

-- 
Vincent
