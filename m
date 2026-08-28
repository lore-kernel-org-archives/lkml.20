Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C6399354
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908936; cv=none; b=krEtJdtm7mmQAN5mdbFEh4Ex3YSh9G44hCsvx6b+QsS0XOYM5lQXVzN86MgM3il3INZ0dh77nz8K7scdHQIvhrD/CUwG/BcpEJaYo8KuFWiBLq4en4huEPDgG6WGiy097qkZXItaMvyWLyIuTXWThRbu/tPpewG1I0p6Exwgj4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908936; c=relaxed/simple;
	bh=CJLgODrfV2Cp1dGKQQzoBAn4r52V04Ohp6JVxo0/bF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/4s/9IWjluHih8enEFR1sseAvuzHIBaw72aqJZLAjvHsKs2gdnGwhc0sib4g3mJC5Y4wD5wgGpsVK/NjC7HqabM1VkjXOUoEppqCD2u0lN2EdVgRw64SY9tH2hM5OK3cCoghpc9jEFZb98eIN73z6PHp254rPwz6csh50KBb70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=L12MpWWM; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L12MpWWM"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso627026a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787908934; x=1788513734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3lLlM8Ydp+ABqyPX6Fa3ap8cVbB1qq0q8Y2hRhjdpUI=;
        b=L12MpWWMOZUt09UoFHsRWKPAJTpqXfi6VfEyIe25WREFacR0HNk5S9rXfiTBspm97u
         WfCZVE1kOE2ATN+3YK+Ub0ReFnxlH7rq2h2FKn5ekq6D8MphHZrxWXRfJeQppyutAKSM
         B6bmvkIr5VYLOIcZZCRcDulbUAb/816d4xl50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908934; x=1788513734;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3lLlM8Ydp+ABqyPX6Fa3ap8cVbB1qq0q8Y2hRhjdpUI=;
        b=NRpmDOL/qsdhdw3GqkoekXJ8kk/0pK3eMZCLKr883vnS1ZAIOI3zPEZZ+ntaf7utTJ
         +FvwkoQPisCe0+rJR7J7Zs4rMoM9RnWeHiEw1ujBkB6tVpdHgOosqtCGx1xUoe0IEapj
         Fq0tJ+UwplezvU3tTP4p8NqacgHDbds3xGFqP/gyx8v9CmBTNR16xqsqW26MO8NsSjIE
         /gZXPU9oebtKLBpz9R3sh1K0QUHeLAf55C4aIMhbmZADaBzCZXFQ3AJRzx/IHR++8Hl3
         WIa8SxfQ7shbTsWDeoT4nrxSpvSMWVxU8sWAJA3gx+0GJ/r7syCaRzCvXPC7jPOLA7A3
         aaRA==
X-Forwarded-Encrypted: i=1; AHgh+Rpg11wtzGcSCqtm2hhkTzw50GNJAVclZX7Hs+AF5b4KMNO+jNeP6k2iPsSsgrskW8AGasnEm/XurkwaaN0=@vger.kernel.org
X-Gm-Message-State: AFuF++lu2hIqvhbVl9eVTuYCnyJnGfzo2mwm/WxULeNW/uhqrJA+AMc/
	GWBaNbD8xko+DT2IXqtNL3xkAJZX7q7pzASmc6URozlnN7dgJtEHGW/Fcamf5I9xVQ==
X-Gm-Gg: AR+sD12uv3Ia9zCb7r2gsB8zCSpLqwDWKEadWhnFdo9WLLUGKN7/YLAJ7+P490cuDT9
	LyGLYEhNkO4AIJNf/1d/2LojibVTK08tokkZmWNcs129VYYeBI2ki2MSAQw0Cup7fzcBhJfTW+A
	l095U7MMLfXf7Vto9vu2RGmaCyupvMYHuo+kKVTCAJLfMgUqcSw1JjBjBEc5kbXf/CzP0bSSKQB
	7h3rL6I9QEFmcxWavSsGBNSZz7zD0/cxI4kJEPzubWWPYXrlw5i95jCNSr0V4nhZf0BCRM0lNRP
	q8w/uEqJlCfW+9+cCl4Jc7RB1JBawC/O5EQm9Z0Gl2s7mrb4fs77sNPjFN9m5Y6CYMRKOB8RPfM
	IStxgfkaMRXqXzFfd/eJ/SHTBHIsKSMAR8OYKPS6BVm2AFtHCJ6KDoVubVw0qD3h9mLNXhKeLZt
	WC8+3/rVK4Js9gl0WHe4r0w6o+8MWB6AIhWh97m6B/NJdguEPgj1bFEh5BaipDe7xm/YnGZ5UAi
	3frgVsCxnWGMiOyqwI37AnIezsLyg==
X-Received: by 2002:a17:90a:da83:b0:396:5cdc:4bea with SMTP id 98e67ed59e1d1-396d0e7cd03mr10652759a91.5.1787908933848;
        Fri, 28 Aug 2026 02:22:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:a804:e404:4b31:580b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm6454217a91.2.2026.08.28.02.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:22:13 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:22:09 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Brian Geffon <bgeffon@google.com>, minchan@kernel.org, axboe@kernel.dk, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH] zram: fix idle age_sec underflow in idle_store()
Message-ID: <apFS2a3lkskcZaag@google.com>
References: <20260825092316.69658-1-jiahao.kernel@gmail.com>
 <apEK-yRTQR8VdT3e@google.com>
 <apEkQSC5PLQAsrqj@google.com>
 <55c09f16-4b0d-58a8-9413-f88279ed69fe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55c09f16-4b0d-58a8-9413-f88279ed69fe@gmail.com>

On (26/08/28 16:38), Hao Jia wrote:
> On 2026/8/28 14:02, Sergey Senozhatsky wrote:
> > On (26/08/28 13:23), Sergey Senozhatsky wrote:
> > > On (26/08/25 17:23), Hao Jia wrote:
> > > > After commit 2e8ff2f51dde ("zram: use u32 for entry ac_time tracking"),
> > > > idle_store() computes the idle cutoff as follows:
> > > > 
> > > > 	cutoff = ktime_sub((u32)ktime_get_boottime_seconds(), age_sec);
> > > > 
> > > > Because the left operand is cast to a 32-bit unsigned integer, when
> > > > age_sec exceeds the current uptime, the subtraction wraps modulo 2^32
> > > > and the huge result is zero-extended into the s64 cutoff.  mark_idle()
> > > > subsequently marks every entry as idle instead of matching nothing,
> > > > breaking the intended semantics of /sys/block/zramX/idle.  For instance,
> > > > running echo 86400 > idle on a machine up for only two minutes causes
> > > > all newly written pages to be marked as idle and handed over to idle
> > > > writeback and recompression.
> > > > 
> > > > Drop the explicit cast to perform the subtraction in signed arithmetic
> > > > again, restoring the previous behavior: an age_sec greater than uptime
> > > > yields a negative cutoff, and one equal to uptime yields 0. Since a
> > > > cutoff of 0 is now a valid computed value, it can no longer double as
> > > > the "all" sentinel. Switch to KTIME_MIN instead, which no ac_time can
> > > > be after.
> > > 
> > > Can we instead just reject such cases?   It should be an error to
> > > request writeback of pages that are 2y old on a system that has
> > > uptime of 2d.
> > > 
> > > Maybe something like this:
> > > 
> > > +             time64_t uptime;
> > > 
> > > -             if (IS_ENABLED(CONFIG_ZRAM_TRACK_ENTRY_ACTIME) &&
> > > -                 !kstrtouint(buf, 0, &age_sec))
> > > -                     cutoff = ktime_sub((u32)ktime_get_boottime_seconds(),
> > > -                                        age_sec);
> > > -             else
> > > +             if (!IS_ENABLED(CONFIG_ZRAM_TRACK_ENTRY_ACTIME) ||
> > > +                 kstrtouint(buf, 0, &age_sec))
> > >                        return -EINVAL;
> > > +
> > > +             /* No slot can be older than the system uptime */
> > > +             uptime = ktime_get_boottime_seconds();
> > > +             if (age_sec >= uptime)
> > > +                     return -ERANGE;
> > 
> > Or perhaps, instead "return len" and make it a fast path out, w/o the
> > need to iterate any slots, take locks, etc.
> 
> Thanks for the feedback! I've sent out v2 of the patch. Please take a look
> when you get a chance.
> 
> https://lore.kernel.org/all/20260828083149.45760-1-jiahao.kernel@gmail.com

Thanks, looks good.
