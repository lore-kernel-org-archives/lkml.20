Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794862930;
	b=WxDhBml9SjPqWyhm+dYSUKJlFBdgreg87plP/lichUkVtuxOW1+jHlQzK1u9v/680E9m
	 C+rlVehytHB1vypRe6bDww2R+pYO5YpzOZN2zhJrr6jtDpo1ov48wliALl8OZWep2d0V5
	 tFwrvs+8OTYBd8u+gSu5jdgySG5lFrrHrP4aIZsB4vGEj9BP89TP3LuiTiYphP/wUst+/
	 bKZDUyx94k2ZjsoXI1lrvUhM6eZZW1bB43qByAcO9EEFr5FOVHBgHXd4fl71AnVdmLtEi
	 I548Jqkw7/Pg6L8GmKBUwZxqonRXoBc5zLbJOhqYnBx1hjlu39E2AvTEqQcgTOlk68w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=sCS5KZMGBLoezFGXiUNPAPDsKb/lPpeScZna/DR+4wA=;
	b=h7Cvw+7qFuIVt0CrQ5oPO9wyyF88fej/y0md13Kc6fggXaN8JOVoJSx6OXYG7DfEk+QU
	 9A+kyiBXQA/gNzqTzNRTTTvr97CkiE+mP65UYFKyRrp3bLK7o4a6btwRAR0dXF8swst2j
	 S/PZH+IrOqcEco7yneBrrY26Pm8j96w3eD1U59Or1gbI7fmLmGr/mbPYWqfR0H9tt1Ojf
	 X3xC+jfzZWTWm7vL+TuAqIbk6LqozgA28ucWPAGsA6apqMqyh1B6klMkPe+IXbWPp6kLl
	 6E3upxeq52e2xRhZIs87yhtdgHAJNNFERgHUn0XtbWjEf2EExBR5cP/WeMCNXitPYEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ldsOndDa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D22606A335
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41D22606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ldsOndDa
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b0739d31b9so1415c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:02:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794862929; cv=none;
        d=google.com; s=arc-20260327;
        b=cs1MKiRh7/ALRfjQdnGF/KHhHut59Q/Aj7ny9cjHLlJQ4qF5uPVx8B3UEx/v+VoExE
         DGC1mNSnSc137MUU9IPHQuClnN90lNZe/XyzIfoJqsr5dJmMmmuXfAnmIy0lQ5mnoAB+
         NyKyYE1pvKDm+ANNeItkVhC7Dea/+n/ykBhOlfAu/KgwA+0tWwpCoz4mMiHMnKC9yE1D
         A7RAYBalHWuGZKlywRH6K0CVukfQ+yGqz9n3bbzbm16j7pKZYyMV/yzGF66I3BfyB/CV
         RaRUlHSjCYvGZzkKoNbkbDS8dYM/G+eJrVHb+ZOVPZTeRv1RciFcnv8tokC4MoOLga00
         G6lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sCS5KZMGBLoezFGXiUNPAPDsKb/lPpeScZna/DR+4wA=;
        fh=Vh2RMpxbO+HaCBFsdbdQDe8AadfNbwYtkvl+QeSrbZY=;
        b=FiSlrzw51YqdMGNupVp7h8wCaIAjFAEzKHYTk8f1Oxip/1xKt42PYu/7iZPyehGruD
         Jj85Qzobj5V81EPcOxye2TNDaH5XRFkIDF0DM2PNQY2MBMMU5C5HRQang3cG1ZAam9WZ
         ulRDiPl7oPWzrFa7pVhZ3JuZ8caihq+o2Ym5Kfl5UaPW29BtHbLqElE29kMMFmIGwlCp
         LcqcugbW917HamhYlkKynRT06ddTryKQkZaBnrzHThepd0WcjW0yT3O7oJ43yRWV2Ii8
         vLZLRPE3CMtqgoxgl5Gsh/OmkNh3OghCxUBgeSXbPKvfOeczmF0v0RpBpILPFtSaiSn5
         FqlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794862929; x=1795467729; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sCS5KZMGBLoezFGXiUNPAPDsKb/lPpeScZna/DR+4wA=;
        b=ldsOndDaaU5QY18GvnbJlfwT4saZBZ91nYsgEyjkOy5ZQUNPdp8nSaBoc7WnYkfz8w
         c0anTf42usoZwliGeBFJ3aAcTr9+ZrYsrETL3LqkISh8XB298exW3fulIW0dLm3B5cnC
         u6hiyhdL/SPsxdcV9G6AY+qn0bMe77/OZWqByN7f5HxrNpc6WMa9ljAzUaNoXCN2/Nch
         1RtGcfacXw4e17gjgorciEs4jul2Z8xPgeTJtf44IxPRrf/mHzTlC0mpqjwQxQbh1p+f
         KVx4CKjjRML0wLR1dCfPJn6wa1Fb4a2X5QXpA+2Ct9UCTDi9yqsn+74PSMTr5HOT7+Mc
         37BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862929; x=1795467729;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sCS5KZMGBLoezFGXiUNPAPDsKb/lPpeScZna/DR+4wA=;
        b=ungqEsjGgLhxy0mYPTfzRerWZDJEUfqnUv3w5HlDtW4byDmRuLlRWtjn50wv5mOgjN
         h7lTbOmK+p3VHDlsYZutAVRnBEHkOUJ9pDOveeKr+pa7ucyYAsDhVl7nqmVuDovnuG0U
         wiCrz/L8LFtF7zZrcMpsLywNKIKHXL6M3dejmTVX+hchc7mquh+TBWJ8ZA4Q26LVQp/s
         26YqeyK6O8FDkczNziPXxhd4wnP7H3kLdCKUJE9qYHhPfhgYpn5Hil/4U4gOwOXZEUpb
         I4SGHaG2QUmH3BK9/pzF1RGHJudMZUN4qRyxlWIk03elKUcsyEW/m9xcT7/ziuV2W9Vr
         w5/w==
X-Forwarded-Encrypted: i=1; AL+hErEq8ZDX/M8NTscBdXbBFRY8+B5/A68MT/ibjiaLrHl2tQf4Av3ec8V/qclbuMGt+AN++0O4p7c/7gZK8ao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Okci48RRHlpflgcUCsALUDi8dETH+ydo8Zl7SdwrZ4nOV6vNQ
	3YjsJJ8+6Limup/omMPU4SqAsUBraIUvEKE36vCeStnlb13Wbs6K2p7wc4xg8oBjJvnzx61KTda
	Zz8ConSHbUhB2oqLVWoN9MpaB9Tc/3vSTWsYFZc31
X-Gm-Gg: AYBFou0QbudCQaL0XDNtb3PwHXiI/FedYz/d5PKQEQiOhMy3vI3ou37KO3cKmA0hN9L
	8KewFNh2e5zkODc3Vxdjge/FCkScJ/ITAQTjHg9iTxYuCTeJSxmSwhNegVHPYd7uw4aRlKW7kym
	3xNqQHZediI25c7qdMDwZksNZpupUXMLFwhaDKicymcVJnCqKlQYcDQ+FydmNp1EeokXregepvY
	t+moyljhQ8VyaGi85oyKKwzWE7jecfC3a7U2Yq8N7Gxsr89ub8bfr4wbNy4DpJG621RvG7rOCu2
	VaBK8EsZAMow4ceVYs0T50LTtBFz6jkA6apF+KVyD+Zk8NWrD7+Cq2ow7rBAW3suUQbWuYkI15z
	uKQD7ay94cG1Sj4hM5xR89kFdXWdGnto5dQk=
X-Received: by 2002:a05:701b:290a:b0:1b1:d8c:1ed9 with SMTP id
 a92af1059eb24-1b53b1c51a2mr13906c88.18.1794862926873; Mon, 16 Nov 2026
 13:02:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-3-bjorn@kernel.org>
 <CAHS8izMaAv6gX1NeJR+QCf43CL+DC4DgePRNNxSLoE31jxHU0g@mail.gmail.com> <87fqx2j5jx.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87fqx2j5jx.fsf@all.your.base.are.belong.to.us>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 16 Nov 2026 13:01:46 -0800
X-Gm-Features: AclHuK8rxGqdW2QY8q6YZLLoufNsDrdyzNs-Y5WE5rB9qXBUxJnfIT9hDTQTu7k
Message-ID: <CAHS8izNVDU8+JzeuwDBmF24C-XqkO+ox01qnTvK665Y8pyWNLA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 02/11] net: Add memory provider capabilities
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

On Sun, Nov 15, 2026 at 10:47=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kerne=
l.org> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
>
> > On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@ke=
rnel.org> wrote:
> >>
> >> The core treats every memory provider as unreadable: installing one
> >> needs header split and no XDP program, and any page pool that allows
> >> unreadable netmem takes it. An AF_XDP UMEM provider is readable, needs
> >> XDP, and hands out whole buffers.
> >>
> >> Describe providers by MP_CAP_READABLE and MP_CAP_FRAG; devmem and
> >> io_uring keep their behavior with MP_CAP_FRAG. A page pool takes a
> >> readable provider only with the new PP_FLAG_MEM_PROVIDER:
> >
> > Why do we need this? I thought whatever creates the pool actually
> > shouldn't get to pick whether the pool picks up the memory provider. I
> > thought if core has configured the rxq for a memory provider then the
> > pool is forced to take it.
>
> Thanks for looking at series, Mina. ...this needed some thinking.
>
> It isn't forced today either: only pools with
> PP_FLAG_ALLOW_UNREADABLE_NETMEM take the queue's provider. Drivers set
> it on the pool that holds payloads, and keep headers in host memory: in
> a separate pool (fbnic, bnxt), or outside the page pool (gve, mlx5).
> That works because every provider so far backs payloads only.
>
> UMEM doesn't. The socket gets whole packets, so UMEM has to back the
> header buffers, and with multi-buffer the payloads too. The flag was my
> way to get it there, but you're right that it's the wrong knob: it lets
> the driver opt in, where it should only say what each pool holds.
>
> How about this instead. Both sides use the rx_roles bits from patch 5,
> HEAD and PAYLOAD:
>
>  - The provider says which buffers it backs, next to rx_page_size in
>    pp_memory_provider_params: devmem and io_uring zcrx PAYLOAD, AF_XDP
>    HEAD, or HEAD|PAYLOAD with multi-buffer.
>  - The driver says what each pool holds, in rx_roles. A pool without
>    roles but with PP_FLAG_ALLOW_UNREADABLE_NETMEM holds PAYLOAD, so
>    existing drivers don't change.
>  - page_pool_create() gives the provider to a pool whose roles are all
>    backed; the others get host pages. No opt-in.
>  - After ndo_queue_mem_alloc(), the core checks that the new pools that
>    took the provider cover everything it backs, or fails the restart.
>
> With fbnic's header and payload pools:
>
>   devmem:                header pool host, payload pool devmem
>   AF_XDP single-buffer:  header pool UMEM, payload pool host
>   AF_XDP multi-buffer:   one shared pool, UMEM
>
> A shared pool on a devmem queue doesn't take devmem, since devmem
> doesn't back HEAD, so the check fails and the driver has to split.
> That's the "headers in host memory" rule, without the driver asking
> which provider it is.
>
> Wdyt?
>

Hmm, I think maybe the exsiting knobs PP_FLAG_ALLOW_UNREADABLE +
CAP_READABLE covers your needs.

The pp says whether the memory it provides is readable or not via
CAP_READABLE (or !CAP_UNREADABLE).

The driver says whether it will allow unreadable memory for this pool.
For header pools, it doesn't specfiy PP_FLAG_ALLOW_UNREADABLE and for
paylaod pools it specifies ALLOW_UNREADABLE.

The change I think you need to make is: today we disallow any
providers if the caller did not specify ALLOW_UNREADABLE (because we
assume mp's are unreadable). After your series we only need to
disallow memory providers if the mp is unreadable and the caller said
it's not fine with unreadable.

--=20
Thanks,
Mina
