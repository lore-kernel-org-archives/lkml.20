Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56103395AF0
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790413552; cv=none; b=Hof5/kKdKsf8E1v7J8/N9It7ew/e00vvObqQzuEA1azBlo9Nuy4XQ8S4AWTot8du9e0ANvIzQf6Sh90vV9Pk7cXzC625A4dHnprtKT1yM6pQ1K5PCA+x+PsJOqyXOwp1VunYuarJJO5OQ2I3C+flxSslyO+uua3/SXT2fhMKjIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790413552; c=relaxed/simple;
	bh=cLYvnwc6UGgUBcOApKiLbl+8MABmd8vFaw9UwBXkSik=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CS4dKvBp+/BGPdTfENTTndFZMG9Rb5X6HnVO3nbKWlXTZy3BebEsRtgV28STLBUMpSVvcRyVdR2jyioJsRLOrUS4zjNxXDtpB1spnYMPRWKnT3UsWe1xOh5HI++WuWpO5pVocgqtIy1Si7weecbEkbOxA2fnDx+1GOl/5hLWmaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F0Uj8Nb2; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F0Uj8Nb2"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aaf10bf094so1661578a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790413549; x=1791018349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aeAHyC+9N6Co7JC4GWq1L6y5uc5GROrj5CA6iuWEnjE=;
        b=F0Uj8Nb2Tx7IClZhSMlFxzJOxtljQzfhoEPdoyuxL9jRT3V5pcNNpTTPY6rMOeUkZ8
         P8ZImvJaLITr0g2G0obPzob5rUpwYmCfXiLkT9tStoQN6arh9bN0hQiQMVFSoAf6OcES
         yVr3uFEY09YxWhLtupLimJh0Q4GVZCFjwwDHU+2g19Yh20LhtVwA2esdHKLfDvaL2p5L
         GEqaW+LhbeDsv6uBT/o7OMoNLHlWibaSqo7dGf96fhDRyEIbl7axKdfLt2oMQethXMBU
         1KSX8s2Xvc27L4rTpnhCPCA1XES2VtBcH//n14INOTnDbmRHZ0sQzIov7p26KjpLH6s1
         LY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790413549; x=1791018349;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aeAHyC+9N6Co7JC4GWq1L6y5uc5GROrj5CA6iuWEnjE=;
        b=dQhAEzcoab5SeM5xqYA+go0CLDcL6Bav4jpD9+Xj/ANqXlr8ESEkfIXcbHPdBVnBPc
         5spVVwZpMwQelnzdnMH6Sxm7zULeN2XCGX6L6DjJi9h2yJJBxvqP4vP1VzuEIsBJ2/25
         GvEZB36DyekNbZSw35gpEkZ2mUSqwkOAORUUu9jeiTLwLu6l1ixIxYxxrkrNvIe0XX4L
         Dem5JGEnE84ZwKMnH+HCEzMJrNEbjv4wTxDrttPz/oQy/Y1RfjoZRsMh+xTtlqCDcGmB
         IfH5meNWV8oZliz3u1hVWF3Gw1izf66+PWe1rrUnpprSf7d9LIIcwuKPcAZJX3KWV3iH
         RKyA==
X-Forwarded-Encrypted: i=1; AKwUvBzDu+bk+DQjLv4nkgZTKfhhCbwtrH+sZbfEvO+6PpRQychRSsjR74aGbJ3E9Nkr1G6kAzbYo2inA7K1tNY=@vger.kernel.org
X-Gm-Message-State: AFuF++l1xF+SqMob1T+qrpDQ4pxJfHyPMG1onJ9FvZZNpPPPiYb4sMa2
	flBTbbBxSnlVYSvnUhqeMvCPVn+2XY5bs7NDpDrXCslb9w9iojMn8uCc
X-Gm-Gg: AYBFou3EaADMNkX5fS+LZHBesm7LcpG2z96ddWe5w/t0sHlU5E7Qw6jIvLh8B86jhxF
	shhPqdJkRPzRC7hk1N+Q+IxBGLLtLOAyasOpUPbwN0Ie599to9nKfZriLuKfOT8atx6oFJKnlYJ
	eknMsFXUAOqKUHpqemAMmhGFSOit9crUt8RhH9SE7wEruay1RCCjfDSXgJf2D6V2N2SvTrtruhv
	CBBlK+X3RlZU23UuA7ftZtxQhbNUZai4LRbG3Wh4BjNy8QZcZB38INJk/76kUZjSNjY4IHTHnYc
	IZnVSi+XPno/PW7Os2Ne0iTA7CA+M/AWU11hEHtAD00SO8ylw89Ig9LYq9cUYI4BKbSOv8/gerx
	NpQMe3mZz+hwOSwCqwhrC//j65qhLlkn46cHItSKDe7vSAe4aoPO5KQOXPIQ//9FOSiacHTVTqq
	rDQO1VSAakYJRL5aBS4ZyoVajQ3QY3X5MW/Xs=
X-Received: by 2002:a17:907:da1:b0:c2d:bc33:7be3 with SMTP id a640c23a62f3a-c2dbc33c16dmr67023066b.47.1790413549220;
        Sat, 26 Sep 2026 02:05:49 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7357cf3sm224612366b.17.2026.09.26.02.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 02:05:48 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Sat, 26 Sep 2026 11:05:45 +0200
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Palla Raghunath <raghunathpalla.0209@gmail.com>,
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev,
	syzbot+442828bb356b10813a47@syzkaller.appspotmail.com,
	Uladzislau Rezki <urezki@gmail.com>,
	Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org
Subject: Re: [PATCH] mm/vmalloc: do not warn on -ENOMEM from va_clip() in
 pcpu_get_vm_areas()
Message-ID: <areK6Z34m3gP7qe5@milan>
References: <20260925205450.21262-1-raghunathpalla.0209@gmail.com>
 <20260925151500.75fcb001ef8cd7f4842e62aa@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925151500.75fcb001ef8cd7f4842e62aa@linux-foundation.org>

On Fri, Sep 25, 2026 at 03:15:00PM -0700, Andrew Morton wrote:
> On Fri, 25 Sep 2026 21:54:49 +0100 Palla Raghunath <raghunathpalla.0209@gmail.com> wrote:
> 
> > When pcpu_get_vm_areas() has to split a free vmap_area in the middle
> > (NE_FIT_TYPE), va_clip() needs an extra vmap_area object. It takes the
> > per-cpu ne_fit_preload_node if one is there, and otherwise falls back
> > to kmem_cache_alloc(GFP_NOWAIT), which may fail and return -ENOMEM.
> > pcpu_get_vm_areas() never preloads, and a single call can do more than
> > one such split: on a NUMA system it places one area per node group, so
> > the first split consumes the preloaded object and the next one depends
> > on the GFP_NOWAIT allocation.
> > 
> > That failure is expected and already handled: the recovery path returns
> > the areas clipped so far to the free tree, purges lazily freed areas and
> > retries. But the error is checked with WARN_ON_ONCE(), so a transient
> > allocation failure under memory pressure or fault injection triggers a
> > kernel warning, and a panic with panic_on_warn. syzbot hit this on a
> > two-node VM while creating a per-cpu BPF array map.
> > 
> > Keep the WARN_ON_ONCE() for errors other than -ENOMEM, which do indicate
> > a bug, and take the recovery path either way. This matches what commit
> > b9183788a2de ("mm/vmalloc: do not warn on -ENOMEM from va_alloc()") did
> > for the other va_clip() caller.
> > 
> > Fixes: 1b23ff80b399 ("mm/vmalloc: invoke classify_va_fit_type() in adjust_va_to_fit_type()")
> > Reported-by: syzbot+442828bb356b10813a47@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=442828bb356b10813a47
> 
> I assume sysbot hit this via fault injection.    The report doesn't make this
> info easily available.  Or maybe it wasn't fault injection.
> 
> > --- a/mm/vmalloc.c
> > +++ b/mm/vmalloc.c
> > @@ -5107,9 +5107,14 @@ struct vm_struct **pcpu_get_vm_areas(const unsigned long *offsets,
> >  
> >  		ret = va_clip(&free_vmap_area_root,
> >  			&free_vmap_area_list, va, start, size);
> > -		if (WARN_ON_ONCE(unlikely(ret)))
> > -			/* It is a BUG(), but trigger recovery instead. */
> > +		if (unlikely(ret)) {
> > +			/*
> > +			 * -ENOMEM from the GFP_NOWAIT fallback is expected.
> > +			 * Anything else is a BUG(), but trigger recovery instead.
> > +			 */
> > +			WARN_ON_ONCE(ret != -ENOMEM);
> 
> Look good.
> 
> The WARN_ON_ONCE() is potentially redundant.  We could make va_clip()
> remove __GFP_NOWARN from its kmem_cache_alloc() and let the page
> allocator do the warn for us.  Doesn't matter.
> 
The patch looks good to me also:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
