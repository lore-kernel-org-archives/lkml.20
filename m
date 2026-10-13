Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200A03B0587
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878496; cv=pass; b=JrWWZiiQGTJVgUGNsqLnxqSNfdQyklJBP+CbRPvxnOoQLSDBrof8jFUpRcA39WiS4WZGSsDM1cW7D0Bec8naTYxdnRucEQrR7ZTl67pwp7bzfYlaEVlcOOZbtZ5JV/J/8hUdLz2ObalDqGG5MvAp74/NNWiwkUW7d+lk7KkQHMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878496; c=relaxed/simple;
	bh=KFFRxFxAH5AteS6INOuRURvfggPbMI9GON1e33BH2eU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qndvEhSjwRJ/wcME4/kjgq95IIVF6fcZF+4h80glcA6E7j4mxZMbBHoUzMK4i1on24Us5+QgKmPwwguQKN4RH60SfmGqV2pUFkFzFvG749OIXWWB4SX8te/O133w1qPuUgV8srNHygS37Cgj6x8FsGkA9JDmZas6iIa4jSgkirk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qxyXFq1b; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qxyXFq1b"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1bfa1c11bso231703a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791878493; cv=none;
        d=google.com; s=arc-20260327;
        b=gcT7I9lTSmPOyh2CNHJMYSCv5b3NmCQDy5D82Zx1E1yfE/sJhY9NdMy4quzIULZN8f
         KB8UaUYA47JEH4oOMsExbsrRycYU/3qL+BEJbJkOIwQlp5lTkBWy1EpuioWXipQN2hJz
         /DRQtbhseCJ8PeQBqAr3erIdeIcDf77YobOh3hgZDcNach8Cqq5DX5HfmrMZAXT+oHkt
         Q7OLtdBQl/JmwPjfLydSFk07/pcAck5U/Mbq/Ynvp+AAFgMyUt0smxuF342FzGgjs3e8
         F+nlz20bsKcb4iXcr60/mjx55V6B24SWkXGTYz11XE7unEe/PrMxz9RMbajfmX/dx99Y
         n21Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PqPcad7Yc6oLW4/1CPglWS7qsNLhjHruOO8KWIE39Fw=;
        fh=1MPV/EO+EOmW2zA/I+4W1NcxrseZZw6EWvqLbDN4l6U=;
        b=e+UGUCpY4tTk/VJVPokBcPySuT5+MHWfulQmZRDugh7JJUcJ7iqgbqVyU3vf1BqxmM
         sH7E2IoCrPunragkDZUrEdtBljlH+aQ6xyGoMCUrZuqAXT8u8dXUpNeZZJuITETFzW7H
         3dpoZeHJYiXfNY9f7Rj7HuHHc6cvKD7tA6FNFPzvWo9gi4at9O4CFOXqZ+odo2qPAa1Q
         DxnASybt17xSpitXAkWDgRUIYDM2l8oFOJBcvIY6eue0ygAekGhVNvyDXTWh1zjCqHF4
         89txlS2Y1XsHAf9E9Mxsr6rY0P9OHKDY6SnTc0mlkh5sgi4KFBm0ZABISAnUg74esD9X
         xjgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791878493; x=1792483293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PqPcad7Yc6oLW4/1CPglWS7qsNLhjHruOO8KWIE39Fw=;
        b=qxyXFq1bkcx3ruf2GbgzoDHzEi3foh5FTPhb6eDIfq06WFvDo2cU3f/JgloT1j0w01
         CTW9wzFWZqWX14s4r59kfu2qRfSu9BuslmOQrano5rW+nlNthebikB8Ylgn6uHj15cVe
         0drtlcRZbc2Z1U110MccU7QZxa6YHV6xveVrfz0hvqsKdjo3x/PTjWtZdqe4vSV0yNiF
         FEIi2DlNxUWrUS9XQGfC0a+CkGBVLeXQ8pz84PO9Z0xHdcci/DvxebVkU1dby1DX2Frc
         ZgFIx/OMQCtvBdGZh7hJSinVlH2VbPN7jR/uLZqv2HSsjv8MvrDU0pDWBFCFLTHnlGm0
         z1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878493; x=1792483293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PqPcad7Yc6oLW4/1CPglWS7qsNLhjHruOO8KWIE39Fw=;
        b=dvtvB43J27jlChNDfRk1ikOXQEGc/VEBghFAneB7ifq1slN3f7x36eItvckuBL25b1
         /eSrBDICmc7SJ960zrSTJRjrJvNmgNS8A9VNEsBjR6z8Mv/JirXmxAD6kYzuArHVmcfK
         FPNBtto3Z8NPyFpGNAYhfBWQ9zAXcOFW9v/yJRfFHfH30D33NAPwXQQ9F6r/2mLke1Or
         U4o8ST2ILU3Crxpou29sdY/i9XtcyoDzMFQP4Kypiu9fV9WL19H5jkrFGJtLst/Qbjte
         LLd9gS7QrpT6d/bF0FElFyiTELOS2AGDmxHisgp7G3bmRxUeB1IczQLNQF4902X2B6Kg
         7IcA==
X-Forwarded-Encrypted: i=1; AKwUvBxqDM4G9vpeNkr4HNghfjhRhjaHEOi8b3ytBUTpfTpXpI5SX4javlij+tV63oVWgmck9Zb70ke3hUxG9ek=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF5uL9EkRS28erEjcxiUOqVIM/I2R6DfhG5eMUGCL7VTQrxmgc
	WQHBp4G9yZJl4QLH+ENNxrvEXotIw3EMzA6CzvVOs2TMgqCH7xrhS/A8Y0BVm8cna4kvphIamT5
	s31MRkFf5FYxmak4VB2CgRZlZrrXXRT0=
X-Gm-Gg: AYBFou1xar8cG5O/th+nE1BqDsK4p8cA266UmEuOug7L8kYhBDNUN/K2W6wfLtP3+Ux
	4fvN1cRQwUYWTo7rzxAaTIrNpBuWlSem3EwEcL+Vul8BtwFH/Gpb9glgvEROX9yNeIirQ7wpyUS
	igYDubXA+/TIE1Is4jG0oUsDl34hmUcTzMtzq+lJEiZFWuYqwCHFqQNsQ60LVxBj5qD5XbS96z5
	diivXzFFPna+bmLw/hS7QKWXXSe8hP7stQthfirSnKEBKss79ZoVcxDUe/12oEQOmkDKKrlmMmx
	MTflOorDmJKVpHRU/L3BBnKS/gPg1sLCZEKKwWM55H7vUqtU9QNLc+/VdQYjAOmgFezjoxQ3NgZ
	plg0mBJKKt8aLtOriw4Y=
X-Received: by 2002:a17:906:2092:b0:c34:d75b:ddd6 with SMTP id
 a640c23a62f3a-c34d75bea07mr278330066b.3.1791878492661; Tue, 13 Oct 2026
 01:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002173844.3537111-1-nicoyip.dev@gmail.com> <20261012200752.3771786-1-kuniyu@google.com>
In-Reply-To: <20261012200752.3771786-1-kuniyu@google.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Tue, 13 Oct 2026 16:01:20 +0800
X-Gm-Features: AclHuK9knlLJpyn2NKb20q7UFVWoMrjulr9UbG2ELaElJRyP4Qnhyg0dvU7dqcE
Message-ID: <CAAo+4rXMefUoP3BwwK20remeQ=qrS5fj-9y0w99LDu0mY0eJxg@mail.gmail.com>
Subject: Re: [PATCH net v4] net: pin protocol module before inet socket allocation
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, 
	kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	pabeni@redhat.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuniyuki

On Tue, Oct 13, 2026 at 4:07=E2=80=AFAM Kuniyuki Iwashima <kuniyu@google.co=
m> wrote:
>
> From: Chengfeng Ye <nicoyip.dev@gmail.com>
> Date: Sat,  3 Oct 2026 01:38:44 +0800
> > inet_create() and inet6_create() look up the protocol under RCU, then d=
rop
> > RCU before using the resulting proto. A concurrent module unload can
> > unregister the protosw, wait for the RCU readers, and destroy the proto=
's
> > slab before sk_alloc() uses it. sk_alloc() may sleep, so the RCU read-s=
ide
> > critical section cannot simply be extended across the allocation.
> >
> > The reported failure occurred during concurrent L2TP socket creation an=
d
> > module unload:
> >
> >   Oops: general protection fault, probably for non-canonical address
> >         0xffff1108974182a0
> >   KASAN: maybe wild-memory-access in range
> >          [0xfff8a844ba0c1500-0xfff8a844ba0c1507]
> >   RIP: kmem_cache_alloc_noprof+0x63/0x370
> >   Call Trace:
> >    sk_prot_alloc+0x74/0x2c0
> >    sk_alloc+0x2b/0x6c0
> >    inet_create+0x2cd/0xd40
> >    __sock_create+0x1c3/0x430
> >    __sys_socket+0x116/0x1d0
> >
> > Cache the proto and its owner under RCU and acquire a temporary module
> > reference before dropping RCU. This prevents normal module unload while
> > the proto is in use. sk_prot_alloc() takes the socket's own reference;
> > drop the temporary reference on every exit after allocation. Use the
> > cached proto for the IPv6 backlog callback as well.
> >
> > Use try_module_get() with its existing initialization semantics. SCTP
> > creates its kernel control socket during module initialization, so
> > rejecting MODULE_STATE_COMING would prevent modular SCTP from loading.
> > Failed module initialization can still unwind published protocols despi=
te
> > module references; that separate publication/unwind lifetime issue is n=
ot
> > fixed here.
> >
> > Fixes: a79af59efd20 ("[NET]: Fix module reference counts for loadable p=
rotocol modules")
> > Cc: stable@vger.kernel.org
> > Assisted-by: GPT-6-Astra
> > Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
> > ---
> > Changes in v4:
> > - Remove the MODULE_STATE_COMING rejection. SCTP creates its kernel con=
trol
> >   socket from module init and must be allowed to use the published prot=
osw.
>
> You can filter the case by @kern.
>
> sockets created from __init_net functions always have
> @kern=3Dtrue otherwise we cannot tear down netns.
>

Thanks for the review and suggestion, v5 adds that @kern checking and
adds back the STATE_COMING rejection in v3

https://lore.kernel.org/netdev/20261013075604.868273-1-nicoyip.dev@gmail.co=
m/T/#u

Best regards,
Chengfeng
