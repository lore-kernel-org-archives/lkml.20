Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C7D34FF41
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788169347; cv=pass; b=Mz3Ut0rLT3Z/V9TBb9Zd2iUx9OY0t41XJbVvAwhJc+FM3zOG1xaQQbhGOAIZmww3JLR+3SjH0wxIJJvCYVbGUFb+dk/xrU0gJggiV5hHRz0yDoGcSbRrfpreDRfPksR1R/iggLi01z8jk7hHqWLhVOsp0pT3hNhqJgcqRUaFw+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788169347; c=relaxed/simple;
	bh=GsFumLSJL886GKpHbJf15kVOuP8UIgPLqNba42ST3sI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCR6REkNskhpOItdKFc+02/ZOTrL+pTDYkadHjfwCtS8lK6ndGJWKIJD6fJ7K9cHHPL71E0kmLbnsymtMkgb+xUB5RErqvsTmw1iyvjehFjrd9x/q8MA2PicsQM63PKTqZHmfBgpGc2WpepuRKsCQM6rXk30YLLZbYybiK73Cd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NK7BHhtg; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NK7BHhtg"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52f83889a93so34055931cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:42:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788169343; cv=none;
        d=google.com; s=arc-20260327;
        b=bsyTNZNUWNXM1gJHaip6fPaOpslhftmOjZ+Ce/pFjGihbCVJ590Vy462fyD5oDSCX+
         UnDYL4Xe2V0rdPILw3+RqoleyG5N3SgnSB7ivoeKFoB9dlvJAc8OTU55I3qSg6R/wtWi
         6rL/a9bWu9MYi3GkZ44YuWe85aXzNnh/ZhHqpv77uFfKQasSOaLah5Ltjt5QW8fLSjP6
         gDcLuDzuK4tmLsr7PzV9A5uPL3O0kQHCPBagk6GVZ2mSEvwLiGzmgCvlvez/59rVGpZs
         CCRCk9PDroR7vb6vKrbyAeogF1C24Tw6yAOCHQ8fqbpS1TOoK0pe7P1GrHn8o3ECwmVy
         HCFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aes8E7ycjw85I1hPRVRNDb1VK1GawwcAPWMBLAtTYaU=;
        fh=EYtgPjOcWRtS8e8cwZAVpTHoTz9GjTXvEkRTPGoz41Y=;
        b=pOelCDwstDCjECvyDq+gJdeS3trCoqmMMPqgiiRTPOF42/8cdvDROSBIAfbLMOZWCY
         hPb1JGggDwIgG1iF5UhW0G92+rHf8HyxGvm26HLnDWX3cFcvIJUvDSO0k1UqdOo7DmTW
         iA3NYUqTXnGluYzG9xMm12jK+XAj8KoK75Vi7NcFDnofjCKnZ6sofVFP1qRVu4DUYET+
         mamYJ5lwUp0Y3YyD/rGiF5bZEJG7Tlf+zjPZ4rSu19TMjZFlnS3rFDuIGsjC2HAsHM49
         M9Vu1ldpJECtgLe94ljWUwSRbfDxVUO87v1zRF0O1zKI7QKKnBjLN+76/lXIjG+YqYWP
         yVEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788169343; x=1788774143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aes8E7ycjw85I1hPRVRNDb1VK1GawwcAPWMBLAtTYaU=;
        b=NK7BHhtgC0UyHwgjXi/TCvsS5Dh5V6XgICDYxPaWILlJibgmqnHvMcxXzH56o0g76Y
         jH4JYxdYMQQSOxhJUkH4dOtsDYvi5aQ/quFmUxVFhEQWG/1c+HI6B+CMWK4AsAp8pOcE
         G4p06HRJWrbHX59oXkYqRzJao4hlUhfnTFBj3PM3+c7f8tSO2Lx2A9/aip4NPSLH6l7O
         SEVOAa5+qE63zMNcZVez7mSYA4IVlQhkEZYU7+yjzKQlUG+fnpijYYSNcflGOuHKikR8
         36J/mwQ8yRReATf2RtnnmUm5+PXC5UChisBvt4H0VAiegTRO75QZQAWgPp7+ic9tNlgd
         WxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788169343; x=1788774143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aes8E7ycjw85I1hPRVRNDb1VK1GawwcAPWMBLAtTYaU=;
        b=Lxei+eOSNUlR47lPC05yd3//St6AeL0EirTjmGKzCEKjjUGzb20b1D7mAfCBgEzLqO
         CjwNCTy6B4vZFR0SfOreDke3tJ58ICAie69B4WkMRHVO64rzgLgi8BPQXkvJtvj6XMau
         wTsAxSAM7og4kyfr5dMiVzNxoR4+CUqbjdfXKaUnQ8AMJ089NBK5Hi5Rf0xOx8mh4XV4
         8yV9G7FcUGHPs9cT9V1R86gOFKIeb0SZ3XwOAAZNEB83x0M1JuRK69y8ZjfcKQ5O2ljh
         Q0lDMlX5KeiCwb+f3S9WKk16ffumiXsAGsQZvUIvtY89jYp8dgQnasW5rXwm14YtlMKP
         mBqg==
X-Forwarded-Encrypted: i=1; AHgh+Roe0yNNcnKTFHty+broIfRvG9p00Rzle/pIIZgX6fHL5eK600FIsWvQDAntp8E+vG72bHVEkV4ceUD1mno=@vger.kernel.org
X-Gm-Message-State: AFuF++m8zzzYVZ1FAQFyOKJvb2O5mN7YdaPaiIUoD6d8Ec5N1QXWbs/6
	gp7VlfAgXnUg8dWSYdXffC4y5Xwd9ztICRzp48P50wrdX1WFa+BUaTRHGzTPDQTO8xclPjn4xeo
	Me1aLvO9Ft4C5qyrHVMGbHInAVrt2UPPdOabYkhRd
X-Gm-Gg: AR+sD12v3OYBnqLRqkI6/Enb10Cjcf7rG2T/o1ckSWUgYdkkQp6feZMUqdqtf/IdST7
	4DUnPLIjFOTJHX5ZQMvcv8QjwpyexEoA8+aDl9EFLXIkALNUZhjr4CYW6K9IvR+/qOOwzDmmwN3
	XZv773g4A7fLCAKUlAvTxp/epjgzQdUqLwETN7kaB0kZ11HhoLeRBPApiMikON7Hur0+aG6piL+
	HAf6iXh0i7GSoxhM0nbtMxkzFoRnBZI/1MkQpyyzzle1rEjBfdpQC+SzEwSeWxiI5SBglQLB/N5
	Q3hUPcREqY9ndkux17MDyzcrfEZYSShwNqAZy/xFq31vImVuKNJnR8WaNFdVt+huTJ5kP2mFtsq
	guqNEYXlebh/7tzedvBFi62O6LCZf6Q/FSS4MKw0axHI4atDXY0/15de5iA==
X-Received: by 2002:ac8:6f07:0:b0:52f:ab8f:43da with SMTP id
 d75a77b69052e-52fb9693eb9mr350760701cf.37.1788169342525; Mon, 31 Aug 2026
 02:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828060822.2628276-1-florian@schauer.to> <8c7f834e-5701-4748-9a9a-fed78aa50198@kernel.org>
In-Reply-To: <8c7f834e-5701-4748-9a9a-fed78aa50198@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 31 Aug 2026 11:42:11 +0200
X-Gm-Features: AcwNN1XhZ8DtUPl2WaV0TDG5OJhey4REsDrNdGL196w5BGJaMuaw0J-qgC5r8ZY
Message-ID: <CANn89iKN=uj3+_nESHep7+3rurFw3S9Cqc+7mjFTztYEeXJsSA@mail.gmail.com>
Subject: Re: [PATCH net v2] page_pool: keep frag_offset aligned for odd-sized requests
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Florian Schauer <florian@schauer.to>, ilias.apalodimas@linaro.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, sdf@fomichev.me, 
	linyunsheng@huawei.com, Mina Almasry <almasrymina@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 11:00=E2=80=AFAM Jesper Dangaard Brouer <hawk@kerne=
l.org> wrote:
>
>
>
> On 28/08/2026 08.08, Florian Schauer wrote:
> > page_pool_alloc_frag_netmem() rounds the requested fragment size with
> >
> >       size =3D ALIGN(size, dma_get_cache_alignment());
> >
> > dma_get_cache_alignment() returns 1 unless the architecture defines
> > ARCH_DMA_MINALIGN, which DMA-coherent architectures such as x86 do not.
> > There the ALIGN() is a no-op and pool->frag_offset advances by the raw,
> > unrounded size.
> >
> > A single caller asking for an odd size then leaves frag_offset misalign=
ed
> > for every fragment carved out of that page afterwards.  The pool is sha=
red,
> > so the damage is not confined to the caller that caused it.
> >
> > The per-cpu system_page_pool used by generic XDP hits this.
> > skb_pp_cow_data() allocates its fragments with the raw packet length:
> >
> >       size =3D min_t(u32, len, PAGE_SIZE);
> >       truesize =3D size;
> >       page =3D page_pool_dev_alloc(pool, &page_off, &truesize);
> >
> > leaving frag_offset odd for whatever is carved out of that page next.  =
Its
> > own head allocation is already aligned -- SKB_HEAD_ALIGN(size) plus the
> > XDP_PACKET_HEADROOM its callers pass -- so it is a later user of the sh=
ared
> > pool that pays: page_pool_dev_alloc_va() returns a misaligned buffer,
> > napi_build_skb() installs it as skb->head, and skb_shinfo(skb) =3D=3D
> > skb->head + skb->end is misaligned with it.
> >
> > skb_shinfo()->dataref is a 4-byte atomic_t at offset 0x20, so the
> > atomic_inc() in __skb_clone() straddles a cache line.  On x86 with spli=
t
> > lock detection -- fatal for kernel split locks by default -- this panic=
s
> > the machine:
> >
> >    Oops: Split lock detected
> >    RIP: 0010:skb_clone+0x154/0x1e0
> >    Call Trace:
> >     <IRQ>
> >     raw_local_deliver+0x1ed/0x2c0
> >     ip_protocol_deliver_rcu+0x54/0x1c0
> >     ip_local_deliver_finish+0x85/0x100
> >     ip_local_deliver+0x67/0x100
> >     __netif_receive_skb_one_core+0x85/0xa0
> >     process_backlog+0x87/0x130
> >
> > Reproduced by attaching any generic-mode XDP program to loopback and
> > opening a RAW IPPROTO_UDP socket, which makes raw_local_deliver() clone
> > every locally delivered UDP packet; ordinary DNS traffic then triggers =
it,
> > roughly once per 2500 clones.  Observed on 6.12.101 and 7.1.8.
> >
> > Tracing page_pool_alloc_frag_netmem() over one such run shows the
> > amplification -- two odd-sized requests, nine misaligned offsets:
> >
> >    requested size & 7:   0: 17035    5: 1    7: 1
> >    frag_offset & 7:      0: 17028    3: 1    4: 1    5: 1    6: 1    7:=
 5
> >
> > and skb_pp_cow_data() returning heads that were aligned on entry:
> >
> >    head 0xffff8f4c86aeac00 -> 0xffff8f4c53a9a9c4 (&7=3D4)
> >    head 0xffff8f4d6a8a42c0 -> 0xffff8f4c4f7b7a45 (&7=3D5)
> >
> > Round the fragment size up to at least the alignment struct skb_shared_=
info
> > requires, so fragments are always suitably aligned for the objects call=
ers
> > build on them.  Architectures needing a larger DMA alignment keep it.
> >
> > This also makes the remainder computed in page_pool_alloc_netmem(),
> >
> >       *size =3D max_size - *offset;
> >
> > aligned, since max_size is a power of two -- which fixes the matching
> > misalignment of skb->end.
> >
> > Verified with a controlled A/B under QEMU/KVM: same tree, same config,
> > same compiler, same rootfs and identical traffic, differing only by thi=
s
> > patch.  A SEC("xdp.frags") XDP_PASS program on lo plus UDP datagrams
> > larger than max_head_size drives skb_pp_cow_data()'s fragment loop, whi=
ch
> > passes raw packet lengths to the pool.  Measured at the return of
> > skb_pp_cow_data():
> >
> >                            unpatched   patched
> >    skb_pp_cow_data calls       40800     40800
> >    misaligned skb->head         1120         0
> >    dataref at line offset >60     80         0
> >
> > The last row counts the accesses that actually fault:
> > skb_shinfo()->dataref sits at head+end+0x20 and is a 4-byte atomic, so
> > `lock incl` splits a 64-byte cache line only when that address lands at
> > offset 61..63.  All 80 occurrences were at offset 61; the panic reporte=
d
> > above was at offset 62.  Eliminating the misalignment removes every one
> > of them.
> >
> > Same class of bug as commit 3bed3cc4156e ("net: Do not allocate page
> > fragments that are not skb aligned"), which fixed the older
> > netdev_alloc_frag()/napi_alloc_frag() allocators.
> >
> > Fixes: 53e0961da1c7 ("page_pool: add frag page recycling support in pag=
e pool")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Florian Schauer <florian@schauer.to>

Reviewed-by: Eric Dumazet <edumazet@google.com>
Thanks.
