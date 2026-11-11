Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439268;
	b=lJxxaZ+HCnRyUWsu4z8Gjfsgk63DvnhPS46UtIlkoZ80MOAZ8sy5W8EA0KeGfye2zn4s
	 gGEndzApwh0AjppF/cXY4P2x0+KMyL2eoTbvIt+FgfsPyUvw3tbdpD6q9dpRH7Nb1hxAn
	 CsJYQ1ADN1Cru5lLtnFHLrV/ZxeuY8XN06ajyiCdPnyRu0tnzRAE1UdhcmL+0i4IxMHg7
	 F1gFj1DdEtfADlpR8g+poqnfGVtmJFvFKW0nC0Gk2w/vTE8JbClRRiF3wD+dI358Ot8cB
	 u9Eky8TyBQUQNpKx1OPaocUpqSNdUwY0tEX4XEeKpP26HJduTWArz33g0WkrgW1D2lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=yLiNMvxVQruQcm1dmYQM6B9T1c0wqmTNiOzMtEKz3a0=;
	b=oNcNcHfO67Fk1CUIVG2dIHQA1K68sOvQGITEvBoiWsVIGhO6o4iRj8thmWrO3Lejg9qG
	 cqfP5qVmX/4P5jjpjUUJW5GgLd7YMcTNHG3n06awu8lusy8nObb99elSCXaxMUAXczUb/
	 ScohbN0wn9IMEYn3YXTS8nIewSWPfG8msbwettw8vjeeRN4SLkx3Rp5JjFWiXuwBj4THu
	 FXjU88KNUBmAxJNX+1RGjeor2bQQvsJQm31vzQ/ZS3Wy8LHyVtEx3Xi1A5uFcwOQRCHeB
	 YNsnojRIAlGyCRqS1PVOJgJql7l6RBZqu/kZNcer1cS2RxZfwZmPPZ3VaLg2YDMYcSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="tWA/XaWh";
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2922B60A3812
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2922B60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWA/XaWh
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso3336345c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439267; x=1795044067; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLiNMvxVQruQcm1dmYQM6B9T1c0wqmTNiOzMtEKz3a0=;
        b=tWA/XaWhilDIFlnze3RfmXPT3zuLapRVFasaiN9nd0tewyRhLSq/JoPBuRjVBnWEQF
         EfJ2wfgsGX9owNgchteKd1lIu6RiSP3OH9AEtymuJ65j8FrudMdGkfDxyMJoyeAIJoM5
         wXaQ1drt7KU9O2M3MfvOiG8VNWFHnGTmcWYxF43Uv/U157sVRXT6hKUfXK1PW7gw0sHJ
         RwVku3hTl++BEabzGqVclt/k2pJ9Vb6VrzAfl7t5hSqMBdtfkABefgGE5YtRN0IX4PLj
         ceM2Gr/lktRQmiB0BBCRstLwizRWtFbe4/wlxG3NV4klLz1FaaanhWSP9Z65w3fzO8E2
         J3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439267; x=1795044067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yLiNMvxVQruQcm1dmYQM6B9T1c0wqmTNiOzMtEKz3a0=;
        b=mex4Dccv+jnDfCJaHq2fhd7nEmIhq32fZ5IItnQDGTcrp5fCHh10AUEZTOFXA4ksI3
         yzRcqD4/dbghybp/RoSGmnQT2Nej2B+2Of548dTeIrRvW5GKN7EeDUmnUfTGDpzY+JwL
         65AwPxJx40zQBXHGiselWtCxULNoJgzrtCYaRGIUOGkufkhO+zn7cDBzS4VTy6vWgHAP
         7NhFSymfFo+g2nPnl6feZDisrFN7zYEX2OOtncjzAVlkx78JqtxRWpPQXMvyHUjfc8Ad
         IAaXfiAHg/GFBZYrlsVSPE38dBO8kpMKmCL39OkMeLe5MRYMkGa5n4yBjXWo9psrSPHm
         XR2A==
X-Forwarded-Encrypted: i=1; AL+hErFoESw8OP0Tnffznm1dn9s+U/rXabAWK5MPoCL8VDUniZcD8XS0ZNnJax9sbaCRDX0KZScM9xTcjE5iEuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hrKYmcnraR48xofllWWoI9UOewdyOkPJYlaB5o7BH9fjU77q7
	5sg7gH0GW1CmU1VUcINsYX0WsZ+E0T4JqKIiEa1ovnaFNPNaPqchD0CL
X-Gm-Gg: AYBFou1wE0wmastby+Zi+tZZNu5M8nhnzSGws/iHQ8lWPNOYwNTmsRoMRCVxCEywY92
	PTdap6xWutWkvA9o8cCf4YqINh43FbGVokdibFTH4aHu2iFJj/lzo580W9trFxVIxKzf2qGNGd/
	PppumD051b/0Npo5nL4dp+TwK3QRT6NjAPhPQNICIQMB0UMFbiYGXlX017QmmGDbm+PryJc7p5e
	oFYiEJ9K1is4MMCXvt4Y01OYdPOf/NAGaHOBEukIEZdzo3rDsTG9GcaLFYmTWJGpdnoF4f+OXX/
	rvBbWu9gB0zX/iPbYvpqCyTZDDkZ2K7FdKSUoW1zrxipu/K/KR5MKSoXYHhzzkJy/QYD9A/J/TP
	o/ZQgn7EIZhr4S+W8LVzPahn65r19/bAmekJsmq2cx5TMHO/CdEPuGtpOxVD9tGsSt2+etw6LW8
	j9Kj2M8FjY29ypyLYLOCv9DstTGZ5AJ/BSNY85Sic2VCDpHel8Zs46kHrfYukuDfxwINdLsLpo0
	ez/dtXhTKv/X1QAcpn8McaOa4gtRdEQBSId2luO/eFhr2zDoqvOZHPrllMWrr+DsWGJUQpNRLbO
	RYozhx61rHTA+PM/T3wepgmFP/vpI+OuYdkVLRRA0/cL
X-Received: by 2002:a05:701b:420e:20b0:144:c112:5f24 with SMTP id a92af1059eb24-1b3c031ae2fmr3766487c88.25.1794439267244;
        Wed, 11 Nov 2026 15:21:07 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:60::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3772121e654sm7807640eec.2.2026.11.11.15.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:21:06 -0800 (PST)
Date: Wed, 11 Nov 2026 15:20:41 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
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
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, 
	Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	io-uring@vger.kernel.org, Mina Almasry <almasrymina@google.com>, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stuart Clark <stuclar@meta.com>
Subject: Re: [PATCH net-next v1 07/11] xsk: Deliver provider chunks without
 copying
Message-ID: <avT3vVT8iyKqyW8q@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-8-bjorn@kernel.org>
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
In-Reply-To: <20261110102039.1002605-8-bjorn@kernel.org>

On 11/10, Björn Töpel wrote:
> A provider socket still receives through the copy path, which takes
> FILL entries without the provider's ownership checks: a chunk that a
> page pool holds could be handed out twice. No driver opts in yet.
> 
> Put packets whose buffers all belong to the socket's provider on the
> RX ring as they are, and copy others into chunks the provider claims.
> Only the queue NAPI may produce to such a socket, so generic XDP and
> CPUMAP redirects to it are dropped.
> 
> A device may place payload at chunk offset 0, as fbnic does, so only
> the first buffer of a packet keeps the UMEM headroom. Such buffers may
> be sent back as they are, so only descriptors with XDP_TX_METADATA
> need room for TX metadata in front.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  Documentation/networking/af_xdp.rst          |   6 +-
>  Documentation/networking/xsk-tx-metadata.rst |   3 +-
>  include/net/page_pool/memory_provider.h      |   2 +
>  net/core/page_pool.c                         |  34 +++-
>  net/xdp/xsk.c                                |  82 ++++++++-
>  net/xdp/xsk.h                                |   5 +
>  net/xdp/xsk_pp.c                             | 165 +++++++++++++++++++
>  net/xdp/xsk_queue.h                          |  18 +-
>  8 files changed, 304 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/networking/af_xdp.rst b/Documentation/networking/af_xdp.rst
> index cc3f0d16b28f..e73a0005e169 100644
> --- a/Documentation/networking/af_xdp.rst
> +++ b/Documentation/networking/af_xdp.rst
> @@ -428,8 +428,10 @@ area and that your largest packet size can be 2K.
>  There is also an option to set the headroom of each single buffer in
>  the UMEM. If you set this to N bytes, it means that the packet will
>  start N bytes into the buffer leaving the first N bytes for the
> -application to use. The final option is the flags field, but it will
> -be dealt with in separate sections for each UMEM flag.
> +application to use. In a multi-buffer packet, only the first buffer is
> +guaranteed this headroom; the others may start at offset 0 of their
> +chunk. The final option is the flags field, but it will be dealt with
> +in separate sections for each UMEM flag.
>  
>  SO_BINDTODEVICE setsockopt
>  --------------------------
> diff --git a/Documentation/networking/xsk-tx-metadata.rst b/Documentation/networking/xsk-tx-metadata.rst
> index f240930ca1df..8bb74a569c26 100644
> --- a/Documentation/networking/xsk-tx-metadata.rst
> +++ b/Documentation/networking/xsk-tx-metadata.rst
> @@ -59,7 +59,8 @@ The flags field enables the particular offload:
>  Besides the flags above, in order to trigger the offloads, the first
>  packet's ``struct xdp_desc`` descriptor should set ``XDP_TX_METADATA``
>  bit in the ``options`` field. Also note that in a multi-buffer packet
> -only the first chunk should carry the metadata.
> +only the first chunk should carry the metadata. Only a descriptor with
> +``XDP_TX_METADATA`` needs ``tx_metadata_len`` bytes in front of it.
>  
>  Software TX Checksum
>  ====================
> diff --git a/include/net/page_pool/memory_provider.h b/include/net/page_pool/memory_provider.h
> index daec73c9dcee..849db08513b8 100644
> --- a/include/net/page_pool/memory_provider.h
> +++ b/include/net/page_pool/memory_provider.h
> @@ -49,6 +49,8 @@ struct memory_provider_ops {
>  bool net_mp_niov_set_dma_addr(struct net_iov *niov, dma_addr_t addr);
>  void net_mp_niov_set_page_pool(struct page_pool *pool, struct net_iov *niov);
>  void net_mp_niov_clear_page_pool(struct net_iov *niov);
> +void net_mp_release_page_pool_bulk(struct page_pool *pool,
> +				   netmem_ref *netmems, u32 count);
>  
>  int netif_mp_open_rxq(struct net_device *dev, unsigned int rxq_idx,
>  		      const struct pp_memory_provider_params *p,
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index e897e79d31f1..56c299f2280d 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -1401,7 +1401,7 @@ bool net_mp_niov_set_dma_addr(struct net_iov *niov, dma_addr_t addr)
>  }
>  
>  /* Associate a niov with a page pool. Should follow with a matching
> - * net_mp_niov_clear_page_pool()
> + * net_mp_niov_clear_page_pool() or net_mp_release_page_pool_bulk()
>   */
>  void net_mp_niov_set_page_pool(struct page_pool *pool, struct net_iov *niov)
>  {
> @@ -1422,3 +1422,35 @@ void net_mp_niov_clear_page_pool(struct net_iov *niov)
>  
>  	page_pool_clear_pp_info(netmem);
>  }
> +
> +/**
> + * net_mp_release_page_pool_bulk() - take net_iovs back from a page pool
> + * @pool: page pool that holds one reference to each net_iov
> + * @netmems: net_iovs of the memory provider of @pool
> + * @count: number of entries in @netmems
> + *
> + * A memory provider takes net_iovs out of a page pool without
> + * ->release_netmem(), for example to give them to userspace. @pool may be
> + * freed on return.
> + */
> +void net_mp_release_page_pool_bulk(struct page_pool *pool,
> +				   netmem_ref *netmems, u32 count)
> +{
> +	bool trace = trace_page_pool_state_release_enabled();
> +	atomic_t *release_cnt = &pool->pages_state_release_cnt;
> +	int released;
> +	u32 i;
> +
> +	for (i = 0; i < count; i++) {
> +		DEBUG_NET_WARN_ON_ONCE(netmem_get_pp(netmems[i]) != pool);
> +		page_pool_clear_pp_info(netmems[i]);
> +		if (!trace)
> +			continue;
> +
> +		released = atomic_inc_return_relaxed(release_cnt);
> +		trace_page_pool_state_release(pool, netmems[i], released);
> +	}
> +
> +	if (!trace)
> +		atomic_add(count, release_cnt);
> +}
> diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> index 113b0b08356d..b419c673e3f1 100644
> --- a/net/xdp/xsk.c
> +++ b/net/xdp/xsk.c
> @@ -386,6 +386,54 @@ static int __xsk_rcv(struct xdp_sock *xs, struct xdp_buff *xdp, u32 len)
>  	return -ENOMEM;
>  }
>  
> +static int xsk_pp_rcv_copy(struct xdp_sock *xs, struct xdp_buff *xdp, u32 len)
> +{
> +	u32 frame_size = __xsk_pool_get_rx_frame_size(xs->pool);
> +	u32 headroom = xsk_pool_get_headroom(xs->pool);
> +	void *copy_from = xsk_copy_xdp_start(xdp);
> +	u32 from_len, meta_len, rem, num_desc, i;
> +	u64 addrs[MAX_SKB_FRAGS + 1];
> +	skb_frag_t *frag = NULL;
> +	u32 to_len, copied;
> +	void *to;
> +
> +	from_len = xdp->data_end - copy_from;
> +	meta_len = xdp->data - copy_from;
> +	rem = len + meta_len;
> +
> +	num_desc = (len - 1) / frame_size + 1;
> +	if (num_desc > ARRAY_SIZE(addrs)) {
> +		xs->rx_dropped++;
> +		return -ENOSPC;
> +	}
> +	if (xskq_prod_nb_free(xs->rx, num_desc) < num_desc) {
> +		xs->rx_queue_full++;
> +		return -ENOBUFS;
> +	}
> +	if (!xsk_pp_claim_copy(xs->pool->pp, addrs, num_desc)) {
> +		xs->rx_dropped++;
> +		return -ENOMEM;
> +	}
> +
> +	if (xdp_buff_has_frags(xdp))
> +		frag = &xdp_get_shared_info_from_buff(xdp)->frags[0];
> +
> +	for (i = 0; rem && i < num_desc; i++) {
> +		to = xp_raw_get_data(xs->pool, addrs[i] + headroom) - meta_len;
> +		to_len = frame_size + meta_len;
> +		copied = xsk_copy_xdp(to, &copy_from, to_len, &from_len, &frag,
> +				      rem);
> +		rem -= copied;
> +
> +		__xskq_prod_reserve_desc(xs->rx, addrs[i] + headroom,
> +					 copied - meta_len,
> +					 rem ? XDP_PKT_CONTD : 0);
> +		meta_len = 0;
> +	}
> +
> +	return 0;
> +}
> +
>  static bool xsk_tx_writeable(struct xdp_sock *xs)
>  {
>  	if (xskq_cons_present_entries(xs->tx) > xs->tx->nentries / 2)
> @@ -453,8 +501,14 @@ static int xsk_rcv_check(struct xdp_sock *xs, struct xdp_buff *xdp, u32 len)
>  
>  static void xsk_flush(struct xdp_sock *xs)
>  {
> +	struct xsk_pp *pp = xs->pool->pp;
> +
> +	if (pp)
> +		xsk_pp_flush(pp);
>  	xskq_prod_submit(xs->rx);
> -	__xskq_cons_release(xs->pool->fq);
> +	/* A provider releases FILL entries under its lock. */
> +	if (!pp)
> +		__xskq_cons_release(xs->pool->fq);
>  	sock_def_readable(&xs->sk);

optional nit:

if (pp) {
	pp_flush
	prod_submit
} else {
	prod_submit
	cons_release
}

sock_def_readable

(hard to follow these scattered if(pp) checks :-( )

>  }
>  
> @@ -464,6 +518,11 @@ int xsk_generic_rcv(struct xdp_sock *xs, struct xdp_buff *xdp)
>  	int err;
>  
>  	err = xsk_rcv_check(xs, xdp, len);
> +	/* Only the NAPI of the queue feeds a memory provider socket. */
> +	if (!err && xs->pool->pp) {
> +		xs->rx_dropped++;
> +		err = -EOPNOTSUPP;
> +	}

This is confusing? Why even call xsk_rcv_check for pp case?

>  	if (!err) {
>  		spin_lock_bh(&xs->pool->rx_lock);
>  		err = __xsk_rcv(xs, xdp, len);
> @@ -488,7 +547,26 @@ static int xsk_rcv(struct xdp_sock *xs, struct xdp_buff *xdp)
>  		return xsk_rcv_zc(xs, xdp, len);
>  	}
>  
> -	err = __xsk_rcv(xs, xdp, len);
> +	if (!xs->pool->pp) {
> +		err = __xsk_rcv(xs, xdp, len);
> +	} else {

[..]

> +		/* A CPUMAP program runs XDP on another CPU, not in NAPI. */
> +		if (unlikely(!xdp_rxq_info_is_reg(xdp->rxq))) {
> +			xs->rx_dropped++;
> +			return -EINVAL;
> +		}
> +
> +		err = xsk_pp_rcv_zc(xs->pool->pp, xs, xdp);
> +		if (err != -EXDEV)
> +			return err;
> +
> +		/* Copy only packets of the queue, from its NAPI */
> +		if (unlikely(!xsk_pp_queue_buf(xs->pool->pp, xdp))) {
> +			xs->rx_dropped++;
> +			return -EINVAL;
> +		}
> +		err = xsk_pp_rcv_copy(xs, xdp, len);

Move this into __xsk_rcv_pp ?
