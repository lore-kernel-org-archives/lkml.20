Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794864092;
	b=kuksEN0cvzfGEA5PwJqwtTtl3BrM6m7Qh8qR2Z94jkTpgfzGi0jDsuhw07OhrizrG0O9
	 2KqpVzD8KUn+LRVIP6iZIoCQ77ZNxaRZY0cKjbrbk3NteB/wwN+NpJGYuvYU8Bh7cTXEu
	 QYhwGWhNFzBQzj5hATH6KWON6Z7mqt7e8+0B0JkobCBLWeBwU8PiWaBrj0QuvTGzEuW+X
	 g8YKQAy/FPkEh1fzuUlfgQlqtpQArPjXuC7WqzbyCzUnAvH3ceIufZAEV9500+K4VotUG
	 NCD0WV4cyNL8pkgXEAsKwAVE6So5h0gnlq8svwH0lV04jNxpPukO3FG7n5mlHeJcIDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864092;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
	b=lK+FzwvegwchHPwAj79TzAG838bxzBM4uyapGbfeI/+uvmUDCfSAKb0waUlt2Y8wAori
	 GKqk468hcFX/Bl5pqGvX+LjhfM29xLCZZAq+prwqjZ+WjpG8Hs0SHZcsNeloxI8q0JaiS
	 jJTSbO+ou0S1K2JZXaFRPoHp9R10Z5W9cvYGrsuwRVv9YYuWNTIR07RiYm5W8XKiDxGTT
	 sSQzc+iReCVyW9ElnWORDB6qVXWsFT9NBDwJfTBSAISzj53XSu9omLkcQPKXnqxO7Y7V1
	 7i2CrzrglY7S8tltvKC1oCw8wrbEnwJjANXGlGMaOmAxmc2pblMiaEUCxP5eLkZ2QRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mpc2ulQR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6486606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6486606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mpc2ulQR
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae7fc5681dso348c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:21:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794864091; cv=none;
        d=google.com; s=arc-20260327;
        b=FNAK/IRGO1Gw8zuzaYpToC7Ki0D8BNXryGA2j113wPwZ02Kpp0Num9IeuWMF4J1sUR
         Ie6QOwwNbf6jLJ4p88o4p8t7hWs+PcsocKnUUO3RF3WfOzrxKVa0hUmbtUgj1OhJKBVK
         tyaKU+/eUkJ+NarNOpmj4x9hg1kIG/XRi4eNbHzl7JTO5vFc9/nEYKO36zE7yYcx9EO/
         jEipxCPWE+mAOPtmNimXHEqDeZOQPN0I2qr3tH2COyoK2Ke2bgJ5Tcg4P4H7XpwMlzB6
         bO7vyw8yn3Zk6n0UAyY27Fuh2HJ0v/0XMGYrmmfL8MW0nGxrH0a0Ij+NI/UKbHe/wFex
         qJNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
        fh=ZxyonzDg9C2BJ/hqliqh9USMLzvfpQA+fu9ZlzNmZss=;
        b=gi+Ycpiy9gXlc4EXZ+50AoLopoXtXc4vDU4uUoFEdjWhs8EAQ4u/SAyWw7BduHlzYg
         WdpwhoWpui3Upczdc5ZvXMYMzautcOzXWBN1uAaWkBSYXBUS1/P8iXsoQ5KEtG/ghREx
         P84A2bVnpuxa/FSOpX/NOfr7YeA6SUW1HVgn/uSQLlCR0xQfWTVBocz1nII+br4hHHxD
         T0RcnsnfD/bYcskhi4ufUYP3Yy1N2LWxE6VPHFBX0NNlLbDvyWynJZVzDhraBE+KF920
         2+g+HHgmCRpWCw6NmXGD0vHNffxfoSbFLcV/3Xb7PQrF5mLlzqLVVnX9sGaXK+Wq/MHy
         8vfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794864091; x=1795468891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
        b=mpc2ulQRbWKCYMfXteuPNK/WkDbEvq7BHSIozp/WZ5rJ9Ay1UwuDo9j5m255aDnmpe
         GNzvlEuBwblIIy7k0K+/Ti3XB/AJamiDqQwHXrckzMaQaY+AEdBbRckqS48Xy7HcnuZk
         kfiNuOUzahvY9TS+CeaNNQgCR2zzmDklIm/T3kq7FVno6v2vlW5BQC30y+s2wEZskIMX
         odTfuVUIIX8rI6coGiXhokSkAigXX77P9TqXOf7Fs0P7rm9ubE2JCFgv4OBxJvTqo0Nk
         9zJQtMg2R2xQyiElXWglY0jJolpQLWCl1KABb5VYenc2ODepzl9b+0OdTxyyheiE1FUw
         YvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864091; x=1795468891;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2SUB1HJ1zwYZLXTcRtJPzZNMb9jj63+seYf6oj57bQ=;
        b=EeH1kqr2dWpbV8sUHfUTZLQkZmRWCkrd7/W16gg31hkZaDn5MchJj4Go9gQCb74MG+
         E9SNmDj57/iajekFwN2mZcW1NF9k/H2bDFIIsvai3DSLzryQKXqVCPMMNxLD6xTRimnC
         TaQ1lQ3Y7ngf8gFRr2uBBVIWMYPrlZTOYsF3ruGOdLvkcjdK3hXyGeb1+80yf+m57iuU
         /5p/mo4gbidZRXyUYAYi2GU4tn0Uckhn+6q+rsE4nbGI5gChTN0n8FZN7InPpZxuwabD
         CRv6MZBXw2o2JeIyqWvFZ3M00O+3CWhGocWtL2Xx2+kmSTzksX5F2GzCvHDA8p7tr22K
         6B5w==
X-Forwarded-Encrypted: i=1; AL+hErG1R4YVyUeKudDeSwiuvsfx5alx0Pzr5hl8XTS4nnAga8qyNgVDgRXcbrROExzM/V/AbqQu4PZrMrXrDms=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QPkR7nLWmMhZb6zho67h1wkJ3byT+3lq9S3eWOI2eagZL7YyR
	A6oaKHyP2MoAPKUgrKV8hoJ4phTod2B4zpiNuQfL+xRKqb8pWCtK7asi4l6puwjYFd0TD5EnGfd
	wPn1Gh+i2YjtzQB5Q0QzzoTdRbkdiHghFvboSFhWy
X-Gm-Gg: AYBFou0VyeCyDJT1YlHlWlc2Q1SGGYWeEFoIr0wWV/TwI9Pzxw7mkCzwLhFQXStqMRQ
	NI0dkAfL+Djl/OxbJA06aNDAwgAZrIJIqscFn516oukVwETv8j1Q7Y9j50BE597U8gfkDH8WIl6
	tnVbH6K8IkFtTM7W+MFp/3Erj/rEdDhJY0HNRMolw1gtXhbR8s1nKlksx2uYdzt8zvxbl4q8Jnj
	aTqguVecpX+JTdmroxs2ga8q8dO6tB+kLsVj0cxmB3aMD1mfcf/K8nY7XgueHhxLWDd985WgRaC
	2gmYu8EaGfwX3wTt7q5+qXrC4DiwRGjENKHyrejaL7rJnvfNde/b9ClsUJ2LZbnhs9AHVGX5rTv
	ZZM/xOMRqEZjpVBjaBrJojDTGAlXyqxCEPzU=
X-Received: by 2002:a05:701a:8457:10b0:151:5aef:b375 with SMTP id
 a92af1059eb24-1b53b1cbb03mr26870c88.15.1794864089874; Mon, 16 Nov 2026
 13:21:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-5-bjorn@kernel.org>
 <CAHS8izNC9APadHg9yPtROkii1H7TPMAB7Xhxo+y9Cx-XCw9C1Q@mail.gmail.com> <87v75xj550.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87v75xj550.fsf@all.your.base.are.belong.to.us>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 13:21:16 -0800
X-Gm-Features: AclHuK9w3CNvroM5YXJNKwgkBqNWzGZQCQodYorHP8v1Ci-t1CG7mz-WEanoHTk
Message-ID: <CAHS8izMxaRKkSKqp3x4dLgTrzuzz5=8WMbEvq5W-oiqoL5vckg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 04/11] xsk: Allocate UMEM chunks through page_pool
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 10:55=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
>
> > On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@ke=
rnel.org> wrote:
>
> >> diff --git a/include/net/xdp.h b/include/net/xdp.h
> >> index 1105bb9e3292..5ab7802ac4e1 100644
> >> --- a/include/net/xdp.h
> >> +++ b/include/net/xdp.h
> >> @@ -368,7 +368,7 @@ static inline bool xdp_buff_add_frag(struct xdp_bu=
ff *xdp, netmem_ref netmem,
> >>
> >>         if (unlikely(netmem_is_pfmemalloc(netmem)))
> >>                 xdp_buff_set_frag_pfmemalloc(xdp);
> >> -       if (unlikely(netmem_is_net_iov(netmem)))
> >> +       if (unlikely(netmem_is_net_iov(netmem) && !netmem_address(netm=
em)))
> >>                 xdp_buff_set_frag_unreadable(xdp);
> >>
> >
> >
> > netmem_is_net_iov() check became redundant.
>
> Hmm, not quite... netmem_address() is also NULL for a highmem page
> without a mapping, and the stack reads those through kmap, so they
> aren't unreadable. The net_iov test keeps them out. I'll add a comment.
>


Oh. I missed that. There are a bunch of docs actually that explicitly
wrongly say to use netmem_address to tell if the memory si readable.

Can you, in a separate patch, add a netmem_readable() helper and
update the docs (and if possible code places) that checked net-iov
when they were really checks for readability? Now that you're adding
readable net-iovs, all that assumption break right?

> >> diff --git a/net/xdp/xsk_pp.c b/net/xdp/xsk_pp.c
> >> new file mode 100644
> >> index 000000000000..fdd55265a6cd
> >> --- /dev/null
> >> +++ b/net/xdp/xsk_pp.c
> >> @@ -0,0 +1,246 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/* AF_XDP UMEM as a page pool memory provider
> >> + *
> >> + * Each aligned UMEM chunk is a readable net_iov with one owner at a =
time:
> >> + *
> >> + *   userspace --FILL--> page pool --release--> reuse --alloc--> page=
 pool
> >> + *       ^                   |
> >> + *       +-----RX ring-------+
> >> + */
> >> +
> >> +#include <net/page_pool/helpers.h>
> >> +#include <net/page_pool/memory_provider.h>
> >> +#include <net/xdp_sock_drv.h>
> >> +
> >> +#include "xsk.h"
> >> +#include "xsk_queue.h"
> >> +
> >> +enum xsk_pp_chunk {
> >> +       XSK_PP_USER,    /* owned by userspace */
> >> +       XSK_PP_POOL,    /* owned by a page pool */
> >> +       XSK_PP_REUSE,   /* on the reuse stack */
> >> +};
> >
> > maybe should be xsk_mp_chunk.
> >
> > But also, why is this 3? Usually the mp's track allocated and free. I
> > assume PP_REUSE is actually free, but I'm curious why it matters to
> > your mp whether the pool or the userspace holds the memory (or whether
> > the net stack holds it. Can't it hold it?)
>
> REUSE is free, yes. USER and POOL are both allocated, but userspace
> gives chunks back by writing addresses to FILL, and it can write any
> address, also one of a chunk the kernel still owns. Taking that entry
> would hand the device the same chunk twice. So the provider only takes
> FILL entries for chunks in USER, and drops the rest. io_uring zcrx
> checks the same with user_refs, and devmem with the socket's token
> xarray.
>

Sounds like devmem choose to do extra-pp-refs on netmems given to
userspace, io-uring choose to give extra user_refs for netmems given
to userspace, and you have choosen to do something new? I need to read
the patches more thoroughly to understand.

--
Thanks,
Mina
