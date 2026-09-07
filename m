Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D1B243E071
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774771; cv=none; b=Ok5uvT4MlzLQHCfTsI7V2athTFynblkpaSZ70VuF7tijyuI10eDSFzJdGq35KidLiFdHkrC/tM5an3D1OigfYuzkgJtHjgS+sBp53WUXdB5f1PzVzjBL0p+rVbyspHHK8yuO3C+05vEnyQ+Z1XFyKWFYlyoMRY0DvqbtKWPlfoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774771; c=relaxed/simple;
	bh=RAk4/+0VANubwExV/eikqowXjMZXGsN/RmDQCnJKXPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lm4KplRXWlnligPMXtJx5FgJOYnarJmnQ1vYLLoCkI+TEIjseQa9by0WMl8NMOXciMXlQQpra39jAA1VIiOTFzxCahoqhZ2iq0fvKr36lg+sjh2D4l7w55+5oXFNlWg1/CQ62UqqvlwB0+N0af0F0xwvuC/5IyHGebG0UmltBds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YGVMiND5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YGVMiND5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so3781932f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788774768; x=1789379568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kqgfejYSVwSnwDj4+nn08kyPi4IgtneNSDWgXEMZ2iw=;
        b=YGVMiND5rLtrUXZ7ueuCq9Fp+v6MHTN5z15qGkWiXvrEd3fG/O9Lefx0WW5gXl4w+c
         RCK81Ejrs6DPThrdgKRvsgg0Qla9y9hSc/UpQzGdpP82kniEMpezKkSY6SMoephlg0Hm
         llKbwlfSMG17cHKi2IrEo4cdHL78ZT85Rn5EC7I4WLa+Dsi82/KewmqyXsna+lm/QVsU
         rGi2KHegb2emWxuO2b9mN0HmEiLqFqbSNfkckBwcz6EyHZXcu7nmweQIOSwsNwjRdiG0
         /0RiOhoABpKaNh+DfaalaJEfMQalYAhb6ecNgQJHUnesQvuZEHHXrLp5+9garkXv2m4Q
         o/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774768; x=1789379568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqgfejYSVwSnwDj4+nn08kyPi4IgtneNSDWgXEMZ2iw=;
        b=hQFMGk1d4l3cydcteOPMmXTNHDPwH5UojlOFOZu0uErwaW/g53LvjMXxu5UVIyOhQy
         ln9c8gi0XHpIuhyPk91UCeKDBFTEVdhC+fVbOwOa5Tfbv70me8A1wgnPbBfe9wejKju0
         8f1B+qv6aH8b9hlMjzq68nSrH11pKQ/Ce0cWGLK99rPQydzk9vR9ZZpZLmmlhbY5LiyH
         Fh31O2UKMgQ8v6hPWRA73MaI0Cwi6x8MK2v4n7tvfao9NlShVS4xn8j7vrYeV6dFu/nt
         uhfcbSqRTs+6hTXDyUFV7fttseHh+BWJ74w7q262TPL9/CJtS0k31cDVF0uerRwJO/5z
         6/9g==
X-Forwarded-Encrypted: i=1; AKwUvByNbX/xKCDDa2Pv5VA3Vg1j9nucdDdf6opk6hrAo+A0xvvicbbYepgKe2LzHJFbeUwWnc9UxbXdFEH5bQQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ltbtWT/LGzk9WSVZ9nxAvyrXhS8ufcDE84ChONp3sJrZKMvUcp
	VerL1LRCEmv7M/oFz+saYnOdCG3/NnHtvmASaZb5LfftjrCyYU7K48A5zAFWK1wQKA==
X-Gm-Gg: AYBFou2oCoPQ3uzho9VpzKmtn/wzpFn91QXJX0jl9HJhnDol1DJRn3wMHVp0R3BfxGb
	I1gjVBBxnqCt9KPwS0AjtF+liZy37Rb4yqJzalpG+A2XFZKr+Tk9ySEkp03BFDQ9Q3zPYJwnecg
	wflWe242b2/YdYfbpZleURiwp/aBhWx+Yt9oLQt7f2Mk3t9Iu8r0g5TbzYCk1UlOPZIxe46IeIM
	ICxu1/SCDqnsJ50/NEmS3cCuyLPPtmFD4DidfPZyeFKz6unCC9Xj46YPck9wJcnKQlotxkP7GK7
	HvmjZfRLg0jO44HtqZBxrPdXjOvAHQc8zLRVEaoi6WmSYpxaVfFULbqXPvfGCo/iOzuaYp6DzvW
	T/rChFzkSRilMqHBJTOUFDZ6rKwoBhC+Uacuw+cieIRgdzVm8MpWaDOnbh7D2HsJVBGHOXI5EsO
	yL2Iu+YsGAeE4NGEnXdFXNkvqf5lN8Oh9fozkiLisYzoIjyAX+4uZseWdarlCMYN0BrqwFrmy1v
	t+CcC/Mc4GmW5l8FjWkSQGV8/XdXoE6
X-Received: by 2002:a05:6000:4b1d:b0:485:8c16:a32a with SMTP id ffacd0b85a97d-4858c16a5a7mr19950748f8f.31.1788774767486;
        Mon, 07 Sep 2026 02:52:47 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm30012615f8f.33.2026.09.07.02.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:52:46 -0700 (PDT)
Date: Mon, 7 Sep 2026 10:52:43 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	sudeep.holla@kernel.org, jenswi@kernel.org, robh@kernel.org,
	mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org,
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 03/10] set_memory.h: Introduce
 can_set_direct_map_range()
Message-ID: <ap6Ja02S5IDqWRHC@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-4-vdonnefort@google.com>
 <ap3BVr5hHwA499gu@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap3BVr5hHwA499gu@kernel.org>

On Sun, Sep 06, 2026 at 10:39:02PM +0300, Mike Rapoport wrote:
> On Wed, Sep 02, 2026 at 11:47:05AM +0100, Vincent Donnefort wrote:
> > While can_set_direct_map() tells whether the direct map can be modified
> > globally, can_set_direct_map_range() checks if a specific range can be
> > modified. e.g. if mapped at PTE-level.
> 
> set_direct_map are going to have number of pages parameter soon:
> 
> https://lore.kernel.org/all/20260903-execmem-set-vm-perms-v0-2-v3-1-949b64a9f755@kernel.org
> 
> so this check can be a part of arm64::set_direct_map

ack.

> 
> I wouldn't expose can_set_direct_map_range() as a public API and rely on
> the callers to "Do The Right Thing".

ack.

Thanks for having a look at the series.

-- 
Vincent


>   
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
> > index 3030d9245f5a..88175c3fa751 100644
> > --- a/include/linux/set_memory.h
> > +++ b/include/linux/set_memory.h
> > @@ -44,6 +44,12 @@ static inline bool kernel_page_present(struct page *page)
> >  {
> >  	return true;
> >  }
> > +
> > +static inline bool can_set_direct_map_range(struct page *page,
> > +					    unsigned long nr_pages)
> > +{
> > +	return false;
> > +}
> >  #else /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> >  /*
> >   * Some architectures, e.g. ARM64 can disable direct map modifications at
> > @@ -56,6 +62,14 @@ static inline bool can_set_direct_map(void)
> >  }
> >  #define can_set_direct_map can_set_direct_map
> >  #endif
> > +
> > +#ifndef can_set_direct_map_range
> > +static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
> > +{
> > +	return can_set_direct_map();
> > +}
> > +#define can_set_direct_map_range can_set_direct_map_range
> > +#endif
> >  #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> >  
> >  #ifdef CONFIG_X86_64
> > -- 
> > 2.55.0.970.g62bdec98f9-goog
> > 
> 
> -- 
> Sincerely yours,
> Mike.
