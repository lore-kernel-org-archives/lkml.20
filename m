Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9004137B018
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789640375; cv=none; b=eAvqLd97OYs04mxIsMBg0dZc9UB4VsCtywAMfKiz3k64JRFk/NrfQVdFcjk/bvpUYQjy2aUmkwU/buHXWc5AJKm6i672Ycq58dKLcXe8O6e7FiPLPCx2A/OqtJGsXiCqBZufsY4I/kS/1mTxiQyAwWNiaMMdZaEiHlmLggw9ZOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789640375; c=relaxed/simple;
	bh=2MVZl6T9eAsw4fu9kLqtTXKDNHCIRq/Eu703/dv7bTA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IneC8phVbVG4yVzWNLxhJ4bH7x2w/NYS9IXZoZGTsszsiSAzT3jgEJXf1gMRqh4h1QaEj+DuG7n2NqwHNAyegyp5mvXQWWwdY0S8+6gouFz3YbM8cYnmVVgAJZfsiUxcgC+vEmEuZ+4RED2ewANNYsy0Qrw8aj9mE3cMzBnbehw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dX0WJHtu; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dX0WJHtu"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso3270465e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789640372; x=1790245172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIbDzBYUic7atO3Tl8OUtyUr5JA3iHCUK5rlYQyhAyI=;
        b=dX0WJHtul90eiD6mhZIYe7imaOxCrAEcnO7c/LB7l/lvADz/uaimMQwURQFZEdyOJ9
         zlwIDzoj1Jh+YM4sYrwdb1yncld1nKIXMfBjOVQ+MMIznEn+o3GGD5xZAUWtReo1CNFm
         /SqOqR5fAv4gBfqHRmtI9zJ17o/A4Bcp0p8DmVOfjDgPFHBG0jyetUgC3C8IuD/oJVp+
         f0+EOWxSQPbWq5+PC9RrX0dv1YuCML07bk3sbYcZPoTgVuStLk6KZ5ls1FPZDxeK8M7R
         oBqTVy+sot3AWoevW0mGNdz2rG4Yxjgy/j+Kn9PqA8tLD6ffcYXHj1dfg8SzUbBTZhtm
         hKgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789640372; x=1790245172;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIbDzBYUic7atO3Tl8OUtyUr5JA3iHCUK5rlYQyhAyI=;
        b=yS96V1ENBeRDv4KyUy6QiU0D990lnI9tQIUPBiNESD/GbjifNuHEAxanPHoOjZlno2
         4h0GlAW2w147RDmYij3y5xnQ2L6u+4CmGhZ7H/Snm+ItJDgOmslC2X6+hKcNOBP09J8v
         ZsZ7Kg/LvLNS2gMIRfF8zAPOT6iTTurWmiGpXveYUkxu/ujoP8YukriH70sdiP+tPs6P
         FP5yBhBkaoZQu553O3J+GsyoDmvqTDtpz0Jv9aycCBCg+GQdAmZ6DjVHxD6gnRXkCyqU
         8SyovEZmNgzi1KvT1rfWs2SBrx3Kj4r1N8WflZJRPZzhpqoJ74DuyCsJ1cqfSrDvrhN6
         vshA==
X-Forwarded-Encrypted: i=1; AKwUvBxj2zmHHvu9/VPUm8Ee5840nXNUm2RnEpVL5jX/D2Z1nfufBSMdYz1IuoUWWNyfKLsC3tST4CC+PBJznk8=@vger.kernel.org
X-Gm-Message-State: AFuF++mQT7INLte4HbLWKCkjmSloaax7Pcx7XCj6b8lxvAuC1pmdIFNJ
	CPwh1Y/B8qRtkvDR2yF5VmCoMBEe3MjeKvJf9vdpuSrstu2VGAAh9hVE
X-Gm-Gg: AYBFou0QEvYiDT+Fs/dTC8gfSseLbtgVVd0aHU2quDTaATz/OAG11QmK+aIksne319J
	hSR0O2ySZAFfbrC9x9QFJbBq6Uuno1EUjdyWWyEzA+ZpQdMtGVeJt63EuCnF8YRlBQDYOBQgPiL
	+46Fyq8a5Vcna+T9DjSYO+zbjRqoxiJhpnbjlof2bvyW+xml+MBfQfY/RjVegeKh7d2y+HEpAaI
	ha2+b/pp0HWeMGyhvKL3pCxxcP4s7EQz9kG/apSVW2BuS9/lbriWQQQ6nXVbeKRl/kX5cMJrL9/
	H/3dB1xptmGCPGuKJBieBUrC0z/VcJBTy2IpaHEyOlaB2KZ/uc4P3VEyHPMiVDmDT2RbYOQs2q8
	M9/kV4s7JEbET4oiqI8wTbenAMkGFU1IQQjtiM/e558q5SRxGl73kxv6OwT3TCSdapp+4llhdB5
	CMSCvpgiTQ0yscrzebzPkO3dN99xZ9yWT7KlweI4L+PrsE/oUmpOT1x2lHVDMCF/YRmFijDsVdE
	XP0aqaBlpFq89QnNaEM1XjKyLF90lNBl5Q3
X-Received: by 2002:a05:600c:a47:b0:49e:719e:e215 with SMTP id 5b1f17b1804b1-49eb732eeacmr66304395e9.26.1789640371628;
        Thu, 17 Sep 2026 03:19:31 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd1d0978sm62964985e9.2.2026.09.17.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 03:19:31 -0700 (PDT)
Date: Thu, 17 Sep 2026 11:19:30 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Arnd Bergmann" <arnd@kernel.org>,
 "Johannes Weiner" <hannes@cmpxchg.org>, "David Hildenbrand (Red Hat)"
 <david@kernel.org>, "Michal Hocko" <mhocko@kernel.org>, "Qi Zheng"
 <qi.zheng@linux.dev>, "Shakeel Butt" <shakeel.butt@linux.dev>, "Lorenzo
 Stoakes" <ljs@kernel.org>, "Kairui Song" <kasong@tencent.com>, "Barry Song"
 <baohua@kernel.org>, "Axel Rasmussen" <axelrasmussen@google.com>, "Yuanchu
 Xie" <yuanchu@google.com>, "Wei Xu" <weixugc@google.com>, "Baoquan He"
 <baoquan.he@linux.dev>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Ridong Chen" <chenridong@xiaomi.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vmscan: avoid false-positive -Wuninitialized
 warning, again
Message-ID: <20260917111930.03a5f02b@pumpkin>
In-Reply-To: <20260916230330.f0923cdb679de0b39d1c5d3a@linux-foundation.org>
References: <20260916083456.4136132-1-arnd@kernel.org>
	<20260916162816.39f0f33f6a48d30a71be3575@linux-foundation.org>
	<20260916163044.3daa3811d9b2bf7d958f1f27@linux-foundation.org>
	<75939625-482c-464f-83fb-fa12d3e1d79c@app.fastmail.com>
	<20260916230330.f0923cdb679de0b39d1c5d3a@linux-foundation.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Sep 2026 23:03:30 -0700
Andrew Morton <akpm@linux-foundation.org> wrote:

> On Thu, 17 Sep 2026 07:50:43 +0200 "Arnd Bergmann" <arnd@arndb.de> wrote:
> 
> > On Thu, Sep 17, 2026, at 01:30, Andrew Morton wrote:  
> > > On Wed, 16 Sep 2026 16:28:16 -0700 Andrew Morton  <akpm@linux-foundation.org> wrote:  
> > >> >
> > >> > --- a/mm/vmscan.c
> > >> > +++ b/mm/vmscan.c
> > >> > @@ -3274,8 +3274,10 @@ struct ctrl_pos {
> > >> >  	int gain;
> > >> >  };
> > >> >  
> > >> > -static void read_ctrl_pos(struct lruvec *lruvec, int type, int tier_min,
> > >> > -			  int tier_max, int gain, struct ctrl_pos *pos)
> > >> > +/* __noipa works around  gcc-16 warning for uninitizled use of pos->refaulted */
> > >> > +static __noipa void read_ctrl_pos(struct lruvec *lruvec, int type,
> > >> > +				  int tier_min, int tier_max, int gain,
> > >> > +				  struct ctrl_pos *pos)
> > >> >  {
> > >> >  	int i;
> > >> >  	struct lru_gen_folio *lrugen = &lruvec->lrugen;  
> > >> 
> > >> Current code has changed here somewhat, but I expect the error is still
> > >> there.  I fixed that "uninitizled" while in there.  Altered patch is
> > >> below.  
> > >
> > >
> > > Then the build blew up in unexpected ways.  gcc-15.2.0.
> > >
> > > The failure looks like a legit min() signedness thing which has been
> > > there quite a while.  I'm thinking that __noipa surfaced this for some
> > > reason?  
> > 
> > Right, I now saw the same thing here on the current linux-next.
> > 
> > What I found now is that the __noipa is only needed on top of 
> > "mm/mglru: use explicit tier range in read_ctrl_pos()", which was
> > in next-20260915 but disappeared in next-20260916. This patch
> > also removed the min().  
> 
> So we don't need cc:stable?
> 
> > I think the reason why __noipa causes the warning about min() is
> > that it prevents the constant propagation into read_ctrl_pos() and
> > in turn the hack that suppresses warning about mixed types in
> > minmax.h when both sides are constant.
> > 
> > Is the mglru series currently expected to make it into 7.4?  
> 
> Yes, "mm/mglru: use explicit tier range in read_ctrl_pos()" is in
> mm-unstable at present.
> 
> > If not, I would withdraw my __noipa and hope that the next
> > round of changes to read_ctrl_pos() does not run into this
> > problem again.  
> 
> OK, I'll drop "mm/vmscan.c: fix min() signedness mismatch" and shall
> rely on "mm/mglru: use explicit tier range in read_ctrl_pos()" to fix
> the min() thing.
> 
> And I'll stage "mm/vmscan: avoid false-positive -Wuninitialized
> warning, again".  ahead of "mm/mglru: use explicit tier range in
> read_ctrl_pos()" to fix the build glitch wihout a bisection hole.
> 
> Does that sound sane?
> 

I've don't remember seeing that last patch, but I have looked at
that function before and it is entirely horrible.

It really does need to inlined to avoid really horrid code generation.

But, in reality, it all ought to be reworked to avoid having a function
that is called to either process one entry or all four.

David
