Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794244880;
	b=xFvxANS1sV6MZv8Q2fugoy7r6mH+Zbs9Xs74VnaWCRjKl2e46V5JqrylPkoAPurILABZ
	 JsK1WosKdntD32fYPhg753MJRGP6biEK95VZDIw0xKz8pxvcROWf5yR64utDDHIZWvYuW
	 DDdYNwtjQAorlIsyk8CNFuT7FzvUnV5HBs5GNH6wGzkkXaz6MrPuCT62jrPQ81CV7n9J3
	 vWKHc7wSGGwdRyoT/3ignIv8LWThOvbWGL7dmlTN9bVx7P58T4Am9FLAzwGNU3Aax00ZA
	 UYWRWE+UKL7HpFJnUcqnSypqz45/twGNS6X/uQJ/h9e8h//93Ydnm9e4d7vDWmTRd7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794244880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Lya5VOYipCBA3m/jA7lCTGHVEoCh2C48za/J5i6OB14=;
	b=wOb4RQE3JdKUFOmehTJEQ75PZKpzs+GoQ2MyKOwP+zclXcbfemdZVKvBaTSAO3Q5fs3u
	 pvMhfYpgkjzmIMYWhOWaGoccqcihTjtXMSgh9vBqNwl9A8/XuE5AyTRefKqDqHwf2QiCP
	 eQAAwSfbhBQXJg4fzODKd9yPllXgfRngvibKWklqCpsi+B7WS9dOdsQNdeH6SeviOLydd
	 SeHRK+rXyek4S1cLoTQh3kPYq1JEeUtUoHFsUDh/AXxoTnz+RwjOOaD5kz0RgebsQziMJ
	 sLtAQRLmHzY/IIpNbuhx2cMkv4ocwZY7dD78UK3Y3Xa+p9eiaqXTkFcG99MohZQNsVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N42WBtPw;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C260606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C260606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N42WBtPw
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so682601eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794244879; x=1794849679; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lya5VOYipCBA3m/jA7lCTGHVEoCh2C48za/J5i6OB14=;
        b=N42WBtPwfgmD+BCEgS2a0LNEND5FwOLphMbydWHo16YodSBir7Vub1vLXMCm/Ivd4U
         qg5LmPrOIyA0mrPw4++UM4hY0eBjpee6fNoOQYEHPpRFakTyADiuKjCJie9Ru4EAqUwR
         nw5ioq5ZipiYslJtxUMMYZGU7zj5+3jP/FkhmGvkXlbYLygXQO92TtOq2oQnH6MF4PlB
         B85CODk4yitL4Cg0dYjip32Un4PdmjLUu5xCTvU9QwaAwVla1Yv6efJSelNZle7y8etH
         q+EUFZbvWsrg2+wy7L1Pz97ytHf8/PYD8LUzh3EUxKoeRLog3RQWb1I3y/7AztzQHbHv
         XsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794244879; x=1794849679;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lya5VOYipCBA3m/jA7lCTGHVEoCh2C48za/J5i6OB14=;
        b=tb059SN1WRFnymL79/JV/VutOotVdaQKF/3b164W52vFJoPBKUNnPA+Vc6fQoZze6N
         JldobBmvCIyMmlN03W7pzTKxUu/Afhi/MB80R9nm9yx570XaP0Bowm22qgMrzQ5hyVCF
         y3XY3vIou8mQdO0V4zHEOkcNox6J2mA4g9FMN8/0om7uk9ccFy1dvSfCWZMtmTAjAs40
         fGPw8Oo29a/djlt5mTHz8cyqxfC6nWGXewrLAcuqN8uVc5T9BndRANXyDrd148gz+7km
         dAvnS2xFg0lFTCddm/GlPjcROQy6xhNW12Qr+n+l2OEfb6MnGrqNG/8NkRB6/AMjDwgn
         0WCQ==
X-Forwarded-Encrypted: i=1; AL+hErHnukNw8+2xvh0lZl9QcQalkF3mfFbknlR0kJU3VIE2+GRl8FyEUoc691RrKRBnsxnuIuTzRNLF+/mWX24=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KbQ5/MHfZelFO/Y70XSZZ230wKgNZ1IDo6e/fSfhg/Imq0UN4
	rIL1zMi8vTDzdTda5ohj8g0oDRrhzdj53zHQfJvBRIfPA0jDM+bxgw6k
X-Gm-Gg: AYBFou2GnOQWMfer64WInu4Sh/k8MaFQzBHhwou+uVkqDWa5xnEXXS7iRKJamng45jf
	NSDYfAHJb775VVwfh5yht3yyHU+w/w4VjJn65qbK8aHjABiBotj78+ey3WHNHUwJeBkIPAumXWa
	Go2xQC39GfW/atGVO+ImpYPARB8MHMqVCnhRvSbCx8qrHP4UIRssGDNl91yXjd0+Hziagdpj0Ye
	n46dnMpSID35CwjhAlyZVja+zY5lJ+BFyepcBCWs3d7j3s6fc429ilvst5A8SheG4oSdPOXUe73
	mlf4cw2V/4geg2hlpnjC7FDZXBLLQdx5327idNgjpPi+3afZkbkXDZCtjlv1D9JtqOkrEL/K4WL
	53jfnQtxk7bqKdHwOkfIBhyHmqNYgACSfETrgEfyLY+jLnflx9DYdh4w2qRYukPPaZHuf1BDbpu
	5ocighmbFLxx1K3Q55J1Z9Skmhg0G3/oqd2Uj7z2HQAM6MBb1xJqe/kTMGmhsBVJC0ln5OB7jbv
	vaVto6bk36FUayg3aIxG2tNBjcPZ1oJO1O/L5QXKFaAl6P3RA0hYNJubLQkslBNVOu8NYvuYW4i
	XUXQEye1nHZuI2KC//PAlA==
X-Received: by 2002:a05:693c:62dc:b0:36f:5746:3369 with SMTP id 5a478bee46e88-3725807c859mr7945389eec.24.1794244879122;
        Mon, 09 Nov 2026 09:21:19 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:67::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm14268734eec.24.2026.11.09.09.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:21:18 -0800 (PST)
Date: Mon, 9 Nov 2026 09:21:14 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Eric Dumazet <edumazet@kernel.org>, Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller" <davem@davemloft.net>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Bobby Eshleman <bobbyeshleman@meta.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH net-next v3 2/2] net: prevent mixing frags from different
 memory providers or bindings
Message-ID: <avIAOgCLksqW-ZNP@devvm16445.scu0.facebook.com>
References: <20261104042521.3979880-1-almasrymina@google.com>
 <20261104042521.3979880-3-almasrymina@google.com>
 <auy0aaY0-g32aYi9@devvm16445.scu0.facebook.com>
 <CAHS8izNrM+iaT6OOJVoZdVp00TkNRhFe9ucCVrwaUWL0oQS7Ow@mail.gmail.com>
 <au5SPWdVCuso8Esq@devvm16445.scu0.facebook.com>
 <CAHS8izNXwhTybUHk3Zkh-cmp9CXz2m9kXt-NoB2huu5co1rGAg@mail.gmail.com>
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
In-Reply-To: <CAHS8izNXwhTybUHk3Zkh-cmp9CXz2m9kXt-NoB2huu5co1rGAg@mail.gmail.com>

On 11/07, Mina Almasry wrote:
> On Fri, Nov 6, 2026 at 2:22 PM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> >
> > On 11/06, Mina Almasry wrote:
> > > On Thu, Nov 5, 2026 at 8:59 AM Stanislav Fomichev <sdf.kernel@gmail.com> wrote:
> > > > > +static inline void *skb_net_iov_provider(const struct sk_buff *skb)
> > > > > +{
> > > > > +     struct net_iov *niov;
> > > > > +
> > > >
> > > > [..]
> > > >
> > > > > +     if (!skb_has_net_iovs(skb) || !skb_shinfo(skb)->nr_frags)
> > > > > +             return NULL;
> > > >
> > > > (a few nits/questions)
> > > >
> > > > Why !skb_has_net_iovs is not enough? (and if !nr_frags is required,
> > > > maybe fold it into skb_has_net_iovs?)
> > > >
> > >
> > > Well skb_has_net_iovs only checks skb->unreadable, which is not
> > > actually enough. The skb doesn't necessarily have net_iovs if it's
> > > unreadable, it technically could be that it has no frags, right?
> > >
> > > Technically we should never have the edge case where
> > > skb->unreadable==true && skb_shinfo->nr_frags==0, but I don't think
> > > the code is careful about that today, and I don't know that I want to
> > > do a global refactor everywhere we remove frags, which skb-> flags
> > > need to be updated.
> > >
> > > but you're right that it can be folded.
> >
> > Not sure I'm buying that, but happy to look again if you disagree. I think
> > the only way to make an skb unreadable right now is to add at least
> > one niov frag? Don't think this is (ever?) gonna change? What does
> > and unreadable skb without frags even means?
> 
> I have no doubt that we set skb->unreadable correctly when we add an
> unreadable frag. I have doubt that we unset it correctly when we
> remove the last unreadable frag (or we do it correctly for other skb
> flags like pfmemalloc). If you can trust it, my LLM confirmed my
> suspicion:
> 
> ```
>   1. skb->pfmemalloc is NEVER cleared (or recomputed) when nr_frags
> becomes 0 on an sk_buff—and isn't even propagated in skb_split() /
> skb_shift():
>       • None of ___pskb_trim(), __pskb_pull_tail(), skb_split(),
> skb_shift(), skb_condense(), gro_pull_from_frag0(), or
> __pskb_trim_head() touch skb->pfmemalloc.
>       • Why it's fundamentally broken to just clear skb->pfmemalloc =
> 0 on nr_frags == 0: Unlike struct xdp_buff (which has a separate
> XDP_FLAGS_FRAGS_PF_MEMALLOC flag that BPF helpers clear via
>       xdp_buff_clear_frag_pfmemalloc() in filter.c:4441-4444 and
> filter.c:12740-12743 when !sinfo->nr_frags), struct sk_buff has a
> single sticky skb->pfmemalloc:1 bit shared by both linear skb->head
>       (skbuff.c:515-885) and frags[] (skbuff.h:2631-2632). Clearing
> skb->pfmemalloc when nr_frags == 0 would wrongly clear pfmemalloc when
> skb->head itself was allocated from PFMEMALLOC reserves.
>   2. skb->unreadable is cleared in some nr_frags -> 0 paths, but still
> missed in a few others:
>       • Unlike pfmemalloc, skb->unreadable only applies to frags[] /
> frag_list (linear skb->head is always CPU-readable).
>       • Where we DO clear skb->unreadable when nr_frags == 0:
>           • ___pskb_trim() (skbuff.c:2810-2811): if
> (!skb_shinfo(skb)->nr_frags && !skb_has_frag_list(skb))
> skb->unreadable = 0;
>           • skb_split_inside_header(), skb_split_no_header(), and
> skb_shift() (skbuff.c:4228-4454): cleared by Patch 1/2 in this series.
>       • Where nr_frags can drop to 0 and skb->unreadable is NOT cleared:
>           • pskb_carve_inside_nonlinear() (skbuff.c:7139-7167): if
> pskb_extract() carves past all frags[] (k == 0, e.g., into frag_list),
> shinfo->nr_frags = 0 on the clone without clearing skb->unreadable (if
>           !skb_has_frag_list(skb) or if the remaining frag_list is readable).
>           • __pskb_trim_head() (tcp_output.c:2020): sets
> shinfo->nr_frags = k without checking !k (in practice tcp_trim_head()
> is only called when len < skb->len and skb_headlen(skb) == 0, so k > 0
> unless a
>           frag_list is present).
>           • skb_try_coalesce() (skbuff.c:6365) and skb_gro_receive()
> (gro.c:131): zero from_shinfo->nr_frags = 0 when stealing frags
> without clearing from->unreadable (benign because from is immediately
> freed
>           via stolen-head free).
>           • __pskb_pull_tail() (skbuff.c:2894) and
> gro_pull_from_frag0() (gro.c:416): cannot be entered with
> skb->unreadable == 1 (__pskb_pull_tail() bails on
> !skb_frags_readable(skb), and
>           skb_gro_reset_offset() requires skb_frag_page(frag0) != NULL).
> ```
> 
> I already have 1 ambitious refactor on list to try to remove
> pp_recycle. I think maybe I want to do the nr_frags checks in this
> patch rather than do a global cleanup of setting skb flags correctly
> so that skb->unread is 100% accurate. WDTY?

Hard to say how real the above are and when they happen. But if they
are, let's fix them separately instead of defensively sprinkling nr_frags
checks everywhere?
