Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638710;
	b=lhpYup8nKqQ7L1Y+yDEDIQVBthM7Rl+wwT0HpaPlDuB0iPbc1QoZqOmLQAqAfi2Qh2oh
	 j2kAFWIBfzLzQ2aUbyIO8ccf1RyeySQuv5aYY/q1sY0y9n2WqH/D6lLm8xjs+ZZ57uMQY
	 kGLmYMhMbY7z8Vi3od/A9HMOaJyB5O9G6EvExPultALRRjNONGjVfHBYAkzivZO15tpyv
	 WxYaEAwDoYSSEiiv6Rb1rgw31Hmy+ZRAQKN/kn268c8L0Tasy7grXG3whux/O3j/HnXv6
	 61KbOxrSEJEQAlHI9yFoF43X/LeoVBMMCeR60HUHfAaqok4KzUc2bBmXe96ItlNZIsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638710;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=cCxj1N9WBg3v8QOr/cS7tYQ7iVjrM26lFVbbv3e0EmA=;
	b=bB3RvIULm06XOCevmloITXSWfFIX2Qnt1wETLEMhd0R+xChKneUaaOODvagNwes45kPf
	 AvIGi6K7+MdxTKMS0DqpUUC6Di48q4R/0/gqxvL232pckhCcX+NOytyJB+DTTgn45jjVd
	 65ECFUqfckok1jjAwvK68uW9l7+9erTFkyTlX4Av2Shzeqlm6OqntpCk44Tau6fEZ4wcr
	 ib7PYHiFeMYgej8Hg/CbiEZKpoeWFHP9XRHxCh1OAk3ibsXLgkBnYN0DGTbalCvhzaeoh
	 qnDsaUYM++sD0gYmAwkzok2XdRetQ6Ar8F/VKi7GQRRFGNN+QpxCDNdkV+CWf3/u4mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=f3kBB01T;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0C96074A44
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC0C96074A44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=f3kBB01T
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b12b1ee403so18537517b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793638709; x=1794243509; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cCxj1N9WBg3v8QOr/cS7tYQ7iVjrM26lFVbbv3e0EmA=;
        b=f3kBB01TR78HXAYNnVx3Xae24bfMmhW/AK5kSlz5gxYzIxToP8p5FJbeTJ06rvpbBl
         9eqYQa9teQvGHNzC6xs6k46hSA3L2CUDwTDLG2THtMoWW1lYg9TLXZBpWgEN/QvuN1sU
         R7cgUSdnI4lvmTcmvMlFJf9tzwxH1hHCzQS/q5eAMaieuwFC/nmGcbYZfh9EE8vZbZEp
         Qr6tqROlMYDDrP5xy+svldS3bhnz4rp6fAMl6ItiHlnRXrTrRbPmkmyk0hA8gkw13tYs
         0lnp47AoSvfJBvXac2xzqXAsQfUfh4tov+TRdzxJka1EacsUVVY0bnC/MP6Ocf+wmtrg
         iBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638709; x=1794243509;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cCxj1N9WBg3v8QOr/cS7tYQ7iVjrM26lFVbbv3e0EmA=;
        b=mwGm0efLtY6M0sNL0PAaQLfJjbAeiNQeQa1US2sCysV+v4TQwkfYCdvunUu4RuQnIW
         xTWt/s2Lf4FcvG5fdCAHWZgiOXiyz9i8wrpIUMt1WHwCVHx3eXiYCgJMqlKyf7l+JX7c
         5FQVZmpITVJwHycaCgdRXnE9exdcFHxhMcgr+KOO0EEsneku6nNO2II8Z9+mJ/S/aXH/
         YL8hFdN+l1j1yIJoaHnICFH3Bs/wl6sDh1RKv+3xlMbazLncSEr9620N3GYTdbuLxac7
         mWz39B/dCggsSmE2SoiCEcz56NpGDa5rCBVRo3mrP16Hj/faNJCuP4zLkCMblnmMnmy3
         EhbQ==
X-Forwarded-Encrypted: i=1; AKwUvByAXen12qJ/BU5zN6CREl92cYm5WUzKAZBi/RWyPIw6Z4toJjLUMwktKNfnkLAZTls9nre4ttM6BVAtGvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z91HUhwHgodTNkmK9Ks5i5aqcbaV9x/vhA2EbCWYJPVtq2J6/BM
	aR5Jf1oe5X9DInNj/pOtKxeL8tIIl258wZ+t+BCQq+U00rAo60xcz3aXUcj27tU+Xq8=
X-Gm-Gg: AYBFou3STUcMq/6FBfCC490iRJ2tznbGfz3MsWrs919oCrndGNVnxUvN7OIxb5GY+PA
	umaCdfsKvv+hR40WbzgnUNjYbztIm6Gr/zfK6g6iyBqJgF9TTkV4gXsdcfC5s3dpH+yEbkhfYVu
	1aVuiIRiPIJpx4AJp6y9QaRoLXg4Cm367OXTS0lhyY35I4Uzd2L+XFfSDIcPo/Pmbwd7NEbV0Ia
	vB6B0iUHUx2sFRNTekr+Hlsu407NJYrk0wG73rztdqzMQGtNq2UnYU2VRSp8/xwuLZkIhOHGEAj
	Optv42lgPz+zzXdqH/ejlufOFhjVSv4eD47c7DJ7pudPOBMsB017uEY35vWDlkt0XbD5kz/YtTN
	VbB61tuvR33fmB6JpZjcVoXeQLhlicZB8P+KgbN5Wv4Y4iJJ82KLOIjy6kcptBspDcPY9VeNCHU
	DE1RrnKQ9nN+ymqYzRY4IM8aEKBKAApvLWh3r4JTWiOZqNpWti4pQuYpgmcNKMZrWOON/t8z3D4
	4TOe8d7/AsWKdlJrBrVetkQ/5lNLvT+QPmIn11nhYyiqOVuj8WDDWLlavsIpmg1hrhVGHZGNr33
	RVc5fXyAXFT2vFZoxb6p09wCqKCX
X-Received: by 2002:a05:690c:6d81:b0:8b2:e0c3:1f4d with SMTP id 00721157ae682-8b2e0c31f7fmr27946947b3.37.1793638708798;
        Mon, 02 Nov 2026 08:58:28 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7194217sm56780477b3.35.2026.11.02.08.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:58:27 -0800 (PST)
Date: Mon, 2 Nov 2026 11:58:26 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Kaitao Cheng <kaitao.cheng@linux.dev>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Kaitao Cheng <chengkaitao@kylinos.cn>
Subject: Re: [PATCH] mm/zswap: fix double decrement of the LRU node count on
 writeback
Message-ID: <aujBMrk-nFaVtPsB@cmpxchg.org>
References: <20261028113619.38752-1-kaitao.cheng@linux.dev>
 <CAO9r8zP15iW3ECW2Bs0rfyZrifeisDunLa6qJC43M1RcE16wWQ@mail.gmail.com>
 <auJkvb-Lq0M5Enkz@cmpxchg.org>
 <2bd4f0df-80c7-4d32-ab50-1225681ff6be@linux.dev>
 <CAO9r8zPuDtn1S0g8rDnXNfSdZ6uuH1geXALDN5-X_SZpM_W+wg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAO9r8zPuDtn1S0g8rDnXNfSdZ6uuH1geXALDN5-X_SZpM_W+wg@mail.gmail.com>

On Thu, Oct 29, 2026 at 08:10:54AM -0700, Yosry Ahmed wrote:
> On Wed, Oct 28, 2026 at 9:23 PM Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
> >
> >
> >
> > 在 2026/10/29 05:10, Johannes Weiner 写道:
> > > On Wed, Oct 28, 2026 at 12:22:43PM -0700, Yosry Ahmed wrote:
> > >> On Wed, Oct 28, 2026 at 4:36 AM Kaitao Cheng <kaitao.cheng@linux.dev> wrote:
> > >>>
> > >>> From: Kaitao Cheng <chengkaitao@kylinos.cn>
> > >>>
> > >>> Successful writeback calls zswap_entry_free(), which removes the entry
> > >>> from the LRU and decrements both the sublist and node item counts.
> > >>> shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU walker
> > >>> to decrement the node count again.
> > >>
> > >> I wonder if we have a valid use case for adding LRU_REMOVED_COUNTED or
> > >> LRU_DELETED instead to simply avoid the decrement.
> > >
> > > It bugs me that it's the walker, not the callback, that adjusts the
> > > count. That composes poorly with the normal list manipulation API.
> > >
> > > How about pushing the accounting into the isolation callback, which
> > > can then simply use __list_lru_del()?
> > >
> > > The tradeoff is that more things need to be passed into the isolation
> > > callback, but that seems reasonable. It does make the change noisy,
> > > however, and we might want something like Kaitao's change as a
> > > backportable fix first regardless.
> >
> > I tried three approaches.
> >
> > The first was "pushing the accounting into the isolation callback", as
> > Johannes Weiner suggested. However, as Johannes's example below also shows,
> > this would require extensive changes across multiple subsystems. I doubted
> > that such a broad change would be accepted, so I dropped this approach.
> >
> > The second was to add a new flag to enum lru_status, as Yosry Ahmed suggested,
> > to handle cases like zswap where the callback has already decremented the
> > count. However, the incorrect lru->node[nid].nr_items value in zswap is only
> > an accounting issue: I could not find any code that reads this counter for
> > zswap. Changing a generic interface to fix an accounting error with no
> > apparent functional impact did not seem worthwhile.
> >
> > The third approach is the one implemented in this patch. It keeps the changes
> > within zswap and fixes the accounting issue, so I think it is appropriate.
> 
> I honestly think it's a problem with the list_lru API, as Johannes
> said, walkers compose poorly with the API. So I prefer we either take
> Johannes's suggestion or add LRU_DELETED, unless there's strong
> objection to both ideas.
> 
> FWIW, we don't need a minimal fix for backports, I don't think this
> needs to be backported at all. As Kaitao said, I don't think the wrong
> list_lru count is being used anywhere for zswap.

Good point.

Ok I will send a proper patch and we can discuss it from there.
