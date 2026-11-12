Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473484;
	b=f0Rn1zAAJwXuDpSg8OmDCdf7f2CWLTXj/4UHQmlkW4mzxCa4T/PeciUsng5JVafJMZbv
	 1jnEhN3TQjh4leHVWB1Zd/RiqyId9BWvHDJCOj7fnP/5IFogputFHgj4H8XPAN2xF//8m
	 +uCCfeeuCk/6XdBHuJCY6Z1wMRnCQb8dm+eGwT0MiQmOCC0oRZ/Chs2b8HYGo4krNOfGf
	 wrt385D8+32D4PiRy/Jb4pwwhv1rlnQ++6kBgpux836a8j507t813iVT1isAAdaXu0tTm
	 9UMpHBGncMnANjH5zEFP50o2jhOKXeVQtgOiLrVh/H30dlCAMIxiSb2FFzZgT92h1aQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+51He1s6aoyuRv7Pl8PGTmRqyfPdZQfGYOE/8zFV1Dk=;
	b=kHM+ttm1JEV3E7tlKJ/Q/GPEF4fM5wsdHzzebGGYm8avRGRTJqIjV/VeuTMa23PlbQap
	 ejM6BN9di9WkIrAwvvRIgSoVEU/rmHBwiEdyQoatYCs8viJUCX+zZWgu2/ZJlOM+nBt/e
	 /vKxWZEc/s7PzULNiOMF0Vq2PSlsMTMsVFm+DCpMT145lwSqvcHlE+yW9k63EAFrOS4u+
	 7xDu0B5Wv40E3pAFn++Cha04YRqAQwnQhuKyFhLDH4M7CnQcIqPcQQmiK+8iuyHmp3PVe
	 sS64lNt7MR+k6R20vLV1F1I7PLQ3l8cVtDEUltyTz5keClIGHJ63nis4IqMU+BwxQTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pnst2cS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EBB606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42EBB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0pnst2cS
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c506a231b88so182522866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:51:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794473482; cv=none;
        d=google.com; s=arc-20260327;
        b=a3HwVSvU2P2FbQVAvXfWd6avPbOLps6WDbyOP3oJQ2ignmotqljnLXMgn7bN2tIuYZ
         P7KAHhKXfXbkF2fspMnDluY2v1O0HCK+jpt8Xeb3Hp+qO+p8EefWoUijwqO0VDjSakxI
         c2nk1WCbOte890476yK1MgoDaZ4aFLDPHMhlP2s8ZDTJ3UVdAsMaDZLsufEKS9qC+AnR
         RXjggOqqmBlneyqlfSa8GZD5gCakBfrem+iGXhkv826veVgSIKfSR6WFrZnp/tt7CtZ2
         dNMoUIkbNZtYlQ4Slr631WMHUIeoaWSdQ8RNfw3oHYer+VZIRkvKE+ftEvbZQ/hLTHWn
         CMfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+51He1s6aoyuRv7Pl8PGTmRqyfPdZQfGYOE/8zFV1Dk=;
        fh=8ZAkFi6u8vFWky8NmpeRJLDueLRmqjjPfoVVCv79Wcg=;
        b=HJBWekA4df9yrIBZai5VOrg24GxJtYjtWJMI/B9CJFQ6JQoDpCTVg0uBCCAqxUGlXn
         svBIVdbdb+bAjLX7SaBVXN4JRZv6inj8DXEx2LF6xRniUUAVbq/BmrE1tEKQN+V5tWYj
         IWeRd0M/MpcigSfQQewUxQUUTLKkjaHQrmSeMV7ATrqgGhYdyN+4CEfcV8skzMcwLo4K
         w7pGK1dM6ACMgRLsXbwdpk/9dD8rvRZU9MI8qkFtgpzbLiskrOHbGNZjiyZUXk5yhzLY
         rbTG240IrbPkRnTu+Sr8SdNRl40wHOYzN8zSzyX44hGcHJHgePM5NxPPPda57GdQPFGc
         Gfyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794473482; x=1795078282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+51He1s6aoyuRv7Pl8PGTmRqyfPdZQfGYOE/8zFV1Dk=;
        b=0pnst2cSpU8w1yb5GYm1Vy4yVMB0bPmIWS2gDeAeGCtFlVRq4VFHtERmUoLBQQyiRc
         c9COXk0vBA4H8+pgtjasCq/oqkBWc6n2OcRZ2HyN5zgPGoWZPdH42F5+yVuNbEbWFJGC
         +EbnpCOCvw6DjxWbzy4anO1e300ohCt7LXOXWZEiPBzUpiBriRN8UtvT2usLwB/NRieN
         g7wmb6CBiLfaRyrFPSCLFhwlGe+Xxr9eusL2AFw1dIGeWHNXGf/T5fxSJ9psHyYQVixb
         o7P/LgwBlEChfGYgM9M/H1P+rhz3OgU6dGZSc7k+71k8Bh9Ku54PIfMroWdovLC6hoV4
         rs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794473482; x=1795078282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+51He1s6aoyuRv7Pl8PGTmRqyfPdZQfGYOE/8zFV1Dk=;
        b=qlw3EMDQl9RLWr1hu26BzAIub0hhkGuczMAtFBZWjnw6G0PFCUDxAwhfqSq5QKIQy6
         UqEy9jXTvuYxb0Li6A4Byfd/h21RMVvzqUW4/9Q7MPMYvLFXTUawxQ+VNwcBgYE1tKdh
         GUbjO6yyUaXPN6XU76ajV2Bs6Sfsm7bXEemv/hdExy5aHa1sa0Kw0ZoPv5I8zYWkhlWn
         BSemaE9VNAgn+2ve3zgx7xNB/lSvv/VQUbLfX8YFLZjyZvIjTtcOePM+rwhBMrKF7TiR
         z37r+Q43mgEXHjJSNVwgrXmhJCAEZ2/eF30x/Xhq1cHnABdagbNYov66WlDwbKOLk5df
         BHrA==
X-Forwarded-Encrypted: i=1; AL+hErHLm1vqzm0vs65aZjhL4X5Cb3uAaBIWa16PlRqUO8Y7crec7ARO9M6axdKzdD/4tlMwI4v+5auJSSUuwTA=@vger.kernel.org
X-Gm-Message-State: APuU4Z857/SpwRiC7YALKMMdKJKZfKLJUKkiKcskQOp1l8dFBoiWGKqw
	vbcxM+sYuqXvmaIguaNLSd1iO/n4oY+FjPlUdDKBWthSYpzO47NRkUnAXls0lPS93wCo7SbwzfP
	6EE6tt1zV6qh/mfeDP2ziRb1VOf1/mQ1qfrY8sAU=
X-Gm-Gg: AYBFou1kZh21+NaNHbXQuK8uiqWs4X1M6Uft9PSlFdkFQ3V0hiYQXPUYFJb2dtMl4u2
	udyWkn4czneKEejOD+QmqcwlWz2azZ4k8WVhlHbfOVgXwtkTflTTN1/D0DvawNUz8JN3Ujnf6OF
	Dlp+HkxoQ31nB4YMKGUOjeIQnpIR94gusFb/YzH1SUGdl/2fNRx5+nxJbYNtRVVTPnoRrrgptPj
	16Z1Khj91tIetDIexeSakkjMJNBfOPwfK5aTwj+gU+soRedFayK+r6mucowtuw1iJFKH8lsuAZ8
	l7ZZIRPulaMoWKZXtlW1RfjDzE85cbyKpkvW4YY371xD3NlDd5x+F9acEtzcC6jpYNWoxiiHO6u
	EQuTfLEJWs0oAaZX03vuMik5ToPaqgRUnADfqEYryBhPaJ3F5uLcpwdHnkjiA0wOPw6EqWQ==
X-Received: by 2002:a17:907:96a5:b0:c40:9e84:942a with SMTP id
 a640c23a62f3a-c5066dbc955mr389476766b.48.1794473482370; Thu, 12 Nov 2026
 00:51:22 -0800 (PST)
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
In-Reply-To: <avVx_1BEP7fIzGDK@KASONG-MC4>
From: Kairui Song <ryncsn@gmail.com>
Date: Thu, 12 Nov 2026 16:50:46 +0800
X-Gm-Features: AclHuK_p7j4nmA7-jgNf_VxE-Yc5HVRQkRr2Wm-N0NDC1S35NcjsDx4EdkkkDeQ
Message-ID: <CAMgjq7BgNCVwxmiXj72V=Grn_Q72jKCT1NGrv1zS349xcBoPNw@mail.gmail.com>
Subject: Re: [PATCH] mm/mglru: check need_resched() in fill/drain_evictable()
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 4:04=E2=80=AFPM Kairui Song <ryncsn@gmail.com> wrot=
e:
>
> On Thu, Nov 12, 2026 at 03:58:27PM +0800, Hui Zhu wrote:
> > From: Hui Zhu <zhuhui@kylinos.cn>
> >
> > lru_gen_change_state() migrates folios in batches of up to
> > MAX_LRU_BATCH (4096) folios under lruvec_lock_irq().  A full batch
> > keeps local interrupts off for up to about a millisecond, and CPUs
> > contending for the same lru_lock spin with interrupts disabled for
> > that long.
> >
> > The caller already reschedules between batches, but a batch itself
> > only ends after 4096 folios.  Stop it early when a resched is
> > pending; the caller restarts the migration where it left off.  A
> > remote resched_curr() sets TIF_NEED_RESCHED directly in the target's
> > thread_info, so the flag can still be set with interrupts off.
> >
> > This follows walk_pud_range(), which already pairs need_resched()
> > with a MAX_LRU_BATCH cap, and commit 6e9be217a3ce ("mm/mglru: use a
> > smaller batch for reclaim").
> >
> > Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
> > ---
> >  mm/vmscan.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 6a1af9b92349..47f2cb25eb46 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -5533,7 +5533,8 @@ static bool fill_evictable(struct lruvec *lruvec)
> >                       success =3D lru_gen_add_folio(lruvec, folio, !act=
ive);
> >                       VM_WARN_ON_ONCE(!success);
> >
> > -                     if (!--remaining)
> > +                     /* stop early to shorten the irq-off section */
> > +                     if (!--remaining || need_resched())
>
> Hi Hui,
>
> I've been thinking about a different design, what if we just
> delete the `--remaining` check completely, and check
> spin_is_contended on the lruvec and need_resched()?
>
> In the optimal case we don't need to keep lock/unlock the lruvec
> at all so this is faster. And it still avoids lock contention or
> blocked schedule, and it might be even more responsive as we are
> release the lock earlier on contention.

Hmm, nevermind, I just realized we have irq off here so it's
definitely a bad idea to drop batch limit. But maybe we can check the
lock too besides need_resched()?
