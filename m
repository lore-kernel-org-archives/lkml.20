Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB13054E4
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378590; cv=pass; b=Y6oq7B3rzZH3fhs2ZRcD+BUFPMb42+FPqHmBHXN+B97FsoyKCuthBJT+x9ZlCa1Mdme6R4X8KqtH0ReC719Zx6vn2O1LtJyWX0qIKxWmommlfMT5i3dYqQmLNxlsu3Ei27ABlpZ64/a57sBrOw3IvMLDaTw3azXlQzYTZ7YQuKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378590; c=relaxed/simple;
	bh=wmwesieYaCZI6NCjdc4MwaVWmLw8Jr+Ky7zd0yIE7u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b87ds/aMdtsQ76h3QONDTTtHxVSrg80Qn7F2G/sWha5XRqFatvHjYsi8DqLX0k5jA6ZB711h/s2dfrnaNAGBbQH3bipdXc5VnnUx60PHknK1xSa6D8BsW/m2ZmN68YRbeJtYXienoRkE/cu6ZrSAd7eZ+wAsZ4/1upWAnQHf77M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmXGxhqC; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmXGxhqC"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba328513b9so1395358e87.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 19:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792378585; cv=none;
        d=google.com; s=arc-20260327;
        b=fSdhevQiXhlRTl+sXVsoDTcJbZ9xVik/Oi6v5tfmGk2VAaWqe9TbRleMS98C+fjRxb
         Ff1jOBF4O2f7AuXkbxL3FYSmjnihXbVGeYIe3Gu347EewNAgkI32mqzQcs8cpJ+UneNF
         +ODvtqW3wLpciuWpBe7sDFO+fC0EZx4Tu9LQEWIk5r/aEaKQD/I4jay43UOF8nhMpp6M
         6BkHHN2AKL7PVIa3YJIFi8OXOEAlkUGSALAXq9oQ4qh8QFlX5Ve0KGnu5jwC6XxE/yVF
         eEZnB4LmKqoZOUMdRiWQ068QjOSMrOLqQnxomLr9aG+ZTT20cssHRLjbCBeiRRIRHU/y
         naxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8dOkczWcfq1jceZZSINYmfjZD9nSuKoBsaFZX6g5gMI=;
        fh=JqunUt5tZYK1VIb8uQ2UFFRfZGwPegCkxbW1WXB53lY=;
        b=dmRc/ZmsgLlmmPUVaTnlBt/hjsKkAmXGdPhlMYzzLljTA89AovokfSEMedXvbwXAv3
         NgQ9TzvY8poYsgr4rlDzh8iypCWVP2WTe1y8wo1IRrYIi4EgyaHzNYdCsMJRdz2Ano+u
         ZSWV5f/ixExNT5AH+66HMWl3p+YjDYCXWHAzfSB9eiF3olY4LNbTXqO/vUv56Wgj1+mx
         tn7NtSB+239NbWNH7mza4ESZ1qU0DhgBl7clEGxXZ023v41sBkW8A99nWDisuPbUfC1/
         knYAsjV2lFZ64oi0MZUC8yqTE/wBHts6HAcG+yrrQHgZZb3GbZm1a1Dj5xn5SGVroguX
         ewXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792378585; x=1792983385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8dOkczWcfq1jceZZSINYmfjZD9nSuKoBsaFZX6g5gMI=;
        b=lmXGxhqCKxSCptmLfQW5Yz7LGU56YMCKoM5fL5cRbO9xW+GE4NUM1T+UBhDdcP6WrG
         +aYO3NKGUMqIHvX9xGtrrH157KQ+KXoW4NplAF3ijf9Vo/MGV3pj7qdjlSONRGET4G7t
         mmoTz8qqUNXXNhAriNtz0xGsNQzmoD/Iuf/Hw2ImShuGMXIAvdyOmwP11ql2UhGyCMXd
         GESB32idXwHvrIspG3BrKkwi0tA1ALCpjD7oXSIs7a3he9A35Q54SZHCYqWP7RBBI2LA
         oxhtSc18PFSbzwhANVvWwv0hbqwUebyOvuDAnRalbQtjDHeX/UCSm1oUWbrWLOVPGwIa
         a5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378585; x=1792983385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dOkczWcfq1jceZZSINYmfjZD9nSuKoBsaFZX6g5gMI=;
        b=AQUyXHfXq4rnUbY1ljbk9Re/kVLiu8rwgR9BPopC3nw3AmWBEscGTFUkrlB+SANJCT
         1sA5yaFEH7Wnxi70fYW2NnWJjBKuhodOHrZcCHKN0+1jcTqDbX35EXeCE0YF8HUJWuno
         bTmqujKzoAe9TjFSD3Vi5QpZ/asYZOjsOD16+lqXbLCUpr9qZIG7Exh/dfEp/qkHIkgK
         DyYWI2euzLBDIko7KiF40TbAVEl+mnMx3bZuveyaWsq9EjIrvXlUIV8gCjXpy50IxS3t
         vmuIOSfi1nutPGgaOf/N2j6zYBvR0gVSww+Jl0+BO4xI+rVQHh4PYEzXuYOMDPw92L6f
         k39g==
X-Forwarded-Encrypted: i=1; AKwUvBz3nsJAynTR8cS3jhUaFUjEB/5nqVEMh4d3ZC9fYksZttw8ejm7Pg2Q/NifLGxKcb6EFIXtDS/hhM5QTpY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIimW06RjlwDs/Dn4yvRXfNxI2Zg2SJTRwgmsm3GPUuwV5uBglW
	bDq8HAAaN1Jq8U/9KFE8hwtPZsvPbHmwbKeaTqr0sjDX2uYQdglS8tk6ZPKv9r5+G+qhSn+U2ub
	J+3FL4YtNGDx1ySg5+QzrbjsrU0mCAOU=
X-Gm-Gg: AYBFou0jdSgjnOS6doY5FLJXAowOmIsIQANh80kZnzlN0FryFB/qGfUGmpWn5zwdO++
	HZWGx1vYw6ZR3O/GO2Uft/hHI2bpNW+xf196kQ0IQ1QwtZQw9bVLhzFLPmLu7l8uQGux+Zj6WIE
	27PWX+4rbnySW8dEpKrc3fpQKWtfnsW5dlqrXqMSE33lKdJJq8IUW1gVZSdoEMzPM34EJ5yru9v
	5RmjGs5MDJsTUSSzRslIMHRP/LAuGMQFKOZx0b55iRbbdTpolIXOw5Jca8BSKxvz9gtrJwOgvkT
	XZdlRSTXkbp+maWKwd1v6NhvqW96trVc07ePKFdoG+B0MTUQ0aNH6DQ9bbhbRjJ25Z9XFN+j/dA
	DuVY5Zl2oNY3YjGN6MM+w+Wb1GdFhvV2c6XKGQaXaoQL509/zPrl5rYcpjMkxTxMDoRTTDztI18
	N4tm8K
X-Received: by 2002:a05:6512:3c89:b0:5b6:183c:5c9e with SMTP id
 2adb3069b0e04-5be50a7f102mr2090016e87.60.1792378585014; Sun, 18 Oct 2026
 19:56:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013155658.2196020-1-cjubran@nvidia.com> <CAL+tcoDJx+suVKWjuHDMVMNThK1SS_a=0t1FkUninHnsAkraGg@mail.gmail.com>
 <49c589b9-054d-4f92-ba80-b095571472bb@nvidia.com>
In-Reply-To: <49c589b9-054d-4f92-ba80-b095571472bb@nvidia.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Mon, 19 Oct 2026 10:55:46 +0800
X-Gm-Features: AclHuK_549AqAMI3SZmkXmwocZZjKmDUpYBEfYnPTtZ4BzW9xLahC1qKY4A-xWI
Message-ID: <CAL+tcoAUbJt7xv0Bx7onkKiq=r9zeEcW8KjsSUvLD_wp_kxJHQ@mail.gmail.com>
Subject: Re: [PATCH v2 net] net: skbuff: don't copy alloc_cpu in skb header copies
To: Carolina Jubran <cjubran@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Jiayuan Chen <jiayuan.chen@linux.dev>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dragos Tatulea <dtatulea@nvidia.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 11:58=E2=80=AFPM Carolina Jubran <cjubran@nvidia.co=
m> wrote:
>
>
> On 16/10/2026 11:11, Jason Xing wrote:
> > On Tue, Oct 13, 2026 at 11:59=E2=80=AFPM Carolina Jubran <cjubran@nvidi=
a.com> wrote:
> >> Commit 68822bdf76f1 ("net: generalize skb freeing deferral to
> >> per-cpu lists") added alloc_cpu to struct sk_buff and placed it in the
> >> headers group copied by __copy_skb_header().
> >>
> >> This is wrong for newly allocated skbs. For example, skb_segment()
> >> allocates a new skb and records the current CPU in alloc_cpu, but
> >> __copy_skb_header() overwrites it with the value from the original skb=
.
> >>
> >> If the original skb was allocated on another CPU, the segment may late=
r
> >> be treated as remotely allocated and unnecessarily deferred there when
> >> it is freed.
> >>
> >> Move alloc_cpu out of the headers group so it is preserved across
> >> header copies. Initialize it explicitly in skb_clone(), which allocate=
s
> > nit: s/Initialize/Copying
> >
> >> the skb object directly instead of going through __alloc_skb().
> >>
> >> This was discovered while investigating a throughput regression with
> >> software IPsec. The load used 512 IPsec tunnels carrying traffic over
> >> VXLAN, with 512 parallel iperf3 flows and an MTU of 4500.
> >>
> >> Before the fix:
> >>
> >>    16.09%  queued_spin_lock_slowpath
> >>               |
> >>               --15.90%--_raw_spin_lock_irqsave
> >>                         |
> >>                         --9.37%--__slab_free
> >>                                   kfree
> >>                                   skb_release_data
> >>                                   napi_consume_skb
> >>                                   mlx5e_poll_tx_cq
> >>
> >> After the fix:
> >>
> >>     6.84%  queued_spin_lock_slowpath
> >>               |
> >>               --6.57%--_raw_spin_lock_irqsave
> >>                        |
> >>                        --5.00%--__slab_free
> >>                                  kfree
> >>                                  skb_release_data
> >>                                  napi_consume_skb
> >>                                  mlx5e_poll_tx_cq
> >>
> >> Fixes: 68822bdf76f1 ("net: generalize skb freeing deferral to per-cpu =
lists")
> >> Signed-off-by: Carolina Jubran <cjubran@nvidia.com>
> >> Reviewed-by: Dragos Tatulea <dtatulea@nvidia.com>
> >> Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> > Thanks. Overall it looks good to me:
> > Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>
> Thanks for the review!
> >> ---
> >>   include/linux/skbuff.h | 2 +-
> >>   net/core/skbuff.c      | 2 +-
> >>   2 files changed, 2 insertions(+), 2 deletions(-)
> >> ---
> >> V2 log:
> >> - Move alloc_cpu after the headers group and fix the indentation. (Eri=
c Dumazet)
> >> ---
> >> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> >> index a3ff380d43f01..b3272d379409e 100644
> >> --- a/include/linux/skbuff.h
> >> +++ b/include/linux/skbuff.h
> >> @@ -1036,7 +1036,6 @@ struct sk_buff {
> >>          __u16                   tc_index;       /* traffic control in=
dex */
> >>   #endif
> >>
> >> -       u16                     alloc_cpu;
> >>
> > nit: no blank line here after you remove it
>
>
> Yeah, I will drop one line. Thanks
>
> >
> >>          union {
> >>                  __wsum          csum;
> >> @@ -1088,6 +1087,7 @@ struct sk_buff {
> >>
> >>          ); /* end headers group */
> >>
> >> +       u16                     alloc_cpu;
> >>          /* These elements must be at the end, see alloc_skb() for det=
ails.  */
> >>          sk_buff_data_t          tail;
> >>          sk_buff_data_t          end;
> >> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> >> index 41beaf625421a..3d82eb87f4582 100644
> >> --- a/net/core/skbuff.c
> >> +++ b/net/core/skbuff.c
> >> @@ -1593,7 +1593,6 @@ static void __copy_skb_header(struct sk_buff *ne=
w, const struct sk_buff *old)
> >>   #ifdef CONFIG_NET_RX_BUSY_POLL
> >>          CHECK_SKB_FIELD(napi_id);
> >>   #endif
> >> -       CHECK_SKB_FIELD(alloc_cpu);
> >>   #ifdef CONFIG_XPS
> >>          CHECK_SKB_FIELD(sender_cpu);
> >>   #endif
> >> @@ -1618,6 +1617,7 @@ static struct sk_buff *__skb_clone(struct sk_buf=
f *n, struct sk_buff *skb)
> >>          C(len);
> >>          C(data_len);
> >>          C(mac_len);
> >> +       C(alloc_cpu);
> > One minor question: does it affect the following two cases:
> > 1) skb_morph()
> > 2) else branch in skb_clone()
> >
> > Looking at the above logic, I think as to #2 point it seems the impact
> > doesn't matter...
>
> For skb_morph() this patch does not change the existing behavior.
> skb_morph() reuses an existing destination skb and turns it into a clone =
of
> src by calling __skb_clone(dst, src).
> Before this patch, alloc_cpu was part of the headers group, so
> __copy_skb_header() inside __skb_clone() copied src->alloc_cpu to
> dst->alloc_cpu implicitly.
> After moving alloc_cpu out of the headers group, the explicit
> C(alloc_cpu);
> in __skb_clone() preserves exactly the same behavior.

Makes sense.

>
>
> >
> > And I'm a bit confused reading the allocation process because there
> > are two possible split allocations for the skb structure itself and
> > the head/data area. They might run on different cpus, which means it's
> > hard for 'alloc_cpu" to choose appropriate one to free under this
> > condition.
>
> Good point. The current documentation describes alloc_cpu as the CPU
> that allocated the skb, while skb_attempt_defer_free() refers to the
> CPU that allocated the skb/pages.
> So it seems that alloc_cpu is best effort for deferred freeing?

I suppose so.

Thanks,
Jason
