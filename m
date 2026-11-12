Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473962;
	b=p0ghvrlJUiPVzDYUm1R4P3vFQqkKVnJs6Hlwvi0Nc8QzN3uzkmhvPw/XWFm64BSp4o6S
	 VK3eLR6ResbbzXFRctM7ZJJ2uRyHU174XS5kZSzs1LRGGF0xAxT7uxxzPcuTpnq5PYPau
	 RXmr/rn+qmBomSzR43Z7GF3PdeOPqhTcaXgPIxRyGLxsCuhAYn6Pw/MHW3JMj6+O9Rs1H
	 A2ZV3AJOF1h/JidxSvEpcDE2ZOGeo8OGjEip5l8PV0PDsKVHgz9ENo366vRs4/js+UhWx
	 etcG+DqarUG9Z9zZsyOTm9XoJsGRmO6tui6BDo/TKZ4TR8uiogAvqCZskpX4UMtW/Fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zQkr1RU++tmLxFcJTSSs0phGfaQL6+em9BkBvgFpLks=;
	b=ojELoS/n+uAv3rTz4KeBAKIunhJtaQGdggjln89r19ynU/I8yxTglZWGHE0/fpcetpKj
	 BJ9rHXBFFFmDHrYuVGvcoRUVqJjwV2uT97CE5EffRUp/gqJ+eArjIT0Tsfbjmwhw+KVwa
	 qUEqLRgURYK0MCG3GtgmiQEW/leL0i7MEDwS1Ph63w8SNKBOAMzOs+oT17kfqM9kO2TO+
	 vvy8j3INRY3bwmL22qqX+FZ/GAELjqqDyTIPzo8PvfeYV9Wmaa905RFCtUlRMLZSPZys0
	 A697hwT8mKrm3NudzkhsKEpRfk9CvxYpeEB74iSmcOUir4RB+b9utXoCL/HLbhqn1Fw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s094mCme;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B60606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:59:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8B60606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s094mCme
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4d473cfff6so560746466b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:59:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794473960; cv=none;
        d=google.com; s=arc-20260327;
        b=nw/Oujsu4qV29GuY7zbY8eqgJtVKK+JpX08ZlW2noQe0ytMXe6DDVuv78OmDRNH56+
         vxC0LTkV+tsABEjwI2CbkfsRtZxs3pGK+SWw/4P/acNPzPUp4rB3lmeKv7QlgwaZ11CF
         fLlgHtqoFIvnUkBfAkRbsV2rDU3gitveUA27WkpOK1Cfhv+zLJRBVY5x+HPihmYfKOWA
         zRcYYnydkR8WGWJ+uSAENSqMwURYTJ+RGmWnmh1ufl+Ve07T0uooVX167Z6t2IuYhiqG
         OuOx22YQjqAzIODhs685Q3M8ym8S/UrPA52J/Lex/KYnWkocTwCcfqiTl+EB8L+TqqUJ
         P9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zQkr1RU++tmLxFcJTSSs0phGfaQL6+em9BkBvgFpLks=;
        fh=JoeprilsZK/tU4VB0AOK3nzSqyujtZso5S/wy9MdmVM=;
        b=bpx5bponCeM6kj6ShVHvXVBNkFP0Pw41WYnAZJp0QFPapdHNaSE8hSBOiO9V+y5tzY
         FfsVmnPjyUlUNy5CzmYD26NvWg0+hy22BjjyBnQFA++F49nBnXgqjAYmSMNrjobq8czu
         Me7JQTbVwD+lNkzq7c7wYaAp5hyTbog134yjvzk6sntY/FJ1HE8iVi7HGEVdkUfylBDq
         dL2w1/CCYAHgi9lLmz5PxL0wRQ7FuNoQhmrBpFs0gW5oGvE2VPEJKVdU/injJXAxIe/3
         c+PyX/GeWlJGeQiniPQL+7y6xV1Yq+PdcF1d2H+5YxyTMPRwxfgtTA18AjwAVqOqEAYD
         S+hQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794473960; x=1795078760; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zQkr1RU++tmLxFcJTSSs0phGfaQL6+em9BkBvgFpLks=;
        b=s094mCmezzx4ZGANr523CclcrqY4fEPBsk48pPEz+QazdVa/Ee9WXWvkfUbBuWsXTx
         48MTjQ9zxamsBwn/9tuPDv4vedC0+EBE4LuoBOQ994y7YVvZgTddvyMum3/Ry4Zi4dFO
         J85I7PnDeufTYTZ0S8t204exguQu28gfrI084KSkNBzRupVeMCX3xcp014ZHB28B6m0s
         aEbRZvSvW0im8bcXygaOLFUwJYUp9TIopAazCGZirQdLZT3yvIuXcvQ2+0tqLr/Iw3Ww
         1VMl0xekKww6PD+ubuMIxuQRg+csBaS5g+9VxbgrAAe6y34xwSpXKHntfMlfSoME+G1g
         1aiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473960; x=1795078760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQkr1RU++tmLxFcJTSSs0phGfaQL6+em9BkBvgFpLks=;
        b=lnYF3hZEurMhtc2M2F5rIvsV6ej71Twcp3UAqtpqWXyi86VKwivvQjR3N9Fm+Q67Yf
         77D9JCbJNTWyL/QXBMlQXLhvvP/xDPd/x2Tr/3ntoyaLiiY7TnudVX0Px9BReK20mi7Q
         9EmOEpzPmXGdRTPIVh/tiuC9O6wQ7wT1I239gCIhC7ctrJ6CXt4Qnk5OAhSakugc0oj9
         +R0q6YkgV703+Jl2v5BeVwXEhM0lTyyY6oQdIw1lrkwnAwRUOT/HrMxCAZly+7A+UYbq
         wO+8lInSLH2QqexRTxTdqZw3I/IlChDN0LOwlLnQYk4ZXreW2WkxYvuT1nHsk4Ss5PeB
         TyJw==
X-Forwarded-Encrypted: i=1; AL+hErHgaBAqTjmHaQKP8J9g2VW51ORfF5amlxOrFRh8y4iKLaoIpZE6jkiAkoVqLJFyG8uIVgac4Hnk4pDkMfw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/v4VD0d+UEamJ9pYPM6hxve84V2/m5ujOyztPG7gMxpiEk9WE5
	Q7ESQwRlWOIgvTxxH/6lbrT95LDfJ0qQucTgIWWnFzIx7wGxw+Xtd4wpNaGzEOFpMAwYuUCbKDP
	Z+58AnLYL3i7mK3BidNaWQ1KOTWJWsrc=
X-Gm-Gg: AYBFou2JIePSzIuoEYXLcZmyelN9hJHzAtsTwMwx9mcC5gqbZBYOG9sm1dfPN0Al58V
	F4xlpNbioRNWBAeSJh6g6T/RlJN8mpITPKsqOFUHyGks10PXBrJRQqO6Y7+aqjQYZXxREA4v6Eb
	I5Z6O3auH3lVmL9dR/Miv+SB3Brv1unJzOBS4Gwoz8Z9vYYDKKVw6E4i+RrlpFuDRt89OamsKdF
	1FosRq4cB+psoJ+TLjXG9XfKpTD4FvNk12aJPVda8m7EaEL37EfjMVHtAAtNOkw8oMAyQ9N9Fvw
	o0hJRdokIyIdtj5n51wGbTUQK8A2QXoFLsQHBrmL45/z9bCHK1jJVDnu46vEV4z13XNc9ziT5SJ
	7C8CqUCHEpOt4JtyL4Eop2kLF23ak2t/W3fKe4jW+/YrCsL0ole8P6WYbwvFA0XgCeHFPjw==
X-Received: by 2002:a17:907:6095:b0:c40:19dc:a24d with SMTP id
 a640c23a62f3a-c5066af4f36mr398521966b.9.1794473959838; Thu, 12 Nov 2026
 00:59:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112075827.255602-1-hui.zhu@linux.dev> <avVx_1BEP7fIzGDK@KASONG-MC4>
 <avV0IbvSx4iuv0tF@tiehlicka>
In-Reply-To: <avV0IbvSx4iuv0tF@tiehlicka>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 12 Nov 2026 16:58:43 +0800
X-Gm-Features: AclHuK-ueh3IWxcuKaV-MJSsNbfRKYSzUtWpmEl4qHfY-8sLr5Df-ouMS4l4hMc
Message-ID: <CAMgjq7D+fUzru-NgOnMcp2EH4gT51=o1LamPFC1sKWkqRds-jw@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: check need_resched() in fill/drain_evictable()
To: Michal Hocko <mhocko@suse.com>
Cc: Hui Zhu <hui.zhu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:09=E2=80=AFPM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Thu 12-11-26 16:03:54, Kairui Song wrote:
> > On Thu, Nov 12, 2026 at 03:58:27PM +0800, Hui Zhu wrote:
> > > From: Hui Zhu <zhuhui@kylinos.cn>
> > >
> > > lru_gen_change_state() migrates folios in batches of up to
> > > MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
> > > keeps local interrupts off for up to about a millisecond, and CPUs
> > > contending for the same lru_lock spin with interrupts disabled for
> > > that long.
> > >
> > > The caller already reschedules between batches, but a batch itself
> > > only ends after 4096 folios.  Stop it early when a resched is
> > > pending; the caller restarts the migration where it left off.  A
> > > remote resched_curr() sets TIF_NEED_RESCHED directly in the target's
> > > thread_info, so the flag can still be set with interrupts off.
> > >
> > > This follows walk_pud_range(), which already pairs need_resched()
> > > with a MAX_LRU_BATCH cap, and commit 6e9be217a3ce ("mm/mglru: use a
> > > smaller batch for reclaim").
> > >
> > > Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> > > ---
> > >  mm/vmscan.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > > index 6a1af9b92349..47f2cb25eb46 100644
> > > --- a/mm/vmscan.c
> > > +++ b/mm/vmscan.c
> > > @@ -5533,7 +5533,8 @@ static bool fill_evictable(struct lruvec *lruve=
c)
> > >                     success =3D lru_gen_add_folio(lruvec, folio, !act=
ive);
> > >                     VM_WARN_ON_ONCE(!success);
> > >
> > > -                   if (!--remaining)
> > > +                   /* stop early to shorten the irq-off section */
> > > +                   if (!--remaining || need_resched())
> >
> > Hi Hui,
> >
> > I've been thinking about a different design, what if we just
> > delete the `--remaining` check completely, and check
> > spin_is_contended on the lruvec and need_resched()?
> >
> > In the optimal case we don't need to keep lock/unlock the lruvec
> > at all so this is faster. And it still avoids lock contention or
> > blocked schedule, and it might be even more responsive as we are
> > release the lock earlier on contention.
>
> Wouldn't this result in too much lock bouncing in the end? Would it make
> sense to reduce the batch instead?

Hi Michal, thanks for the suggestion.

The fill/eviction loop here is a quite cold path so probably fine, I
did just found another reason not to do that though.
