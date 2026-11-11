Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433556;
	b=4H7TSqfsMDwZtxQokRWx1Vz8XdAtrDFKLxufHBEJaKaIIXQECZ9MQciVQy0V8E8nTuOO
	 msQ43COVbolyKn3NoZMVcC/aTiReOuxHNagEhkCy93bkiqZatq0/E2xAP9rM2h/EpgfIS
	 UATVOUvYTc3Lwo45vHtD5i+2XiJUwmHUtUI2L3kur+9eXpdkfJErNKO040Dtc2jkMA6om
	 5G4V3HXvrYMmMBWJDUIrpWwEDFVPXsOf5dM4lKZJHne8hmPr5t8j/U8gLX4OA+FHiPEz0
	 GUk6KImo755FSMP3KWFaHUk5Y5QnlzmMeQtIfAUojtcfRYMoXD6digRG6GwTKdr5OVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=uLiiTa/Gb7h1TxDGjxBpe1u+WEWowZlfNkmPxqWemd0=;
	b=Pbl1Qa/KSM4ZfXXM9xzRd7upRw5jIWGEatnWrEOvmjDMMUIHHrKaw8/IYmaMCSF/QbGW
	 5Kt49QsL6VluD5r8BbzP7to9Wmii2u974kILuFWPEH0mG5vIAYCfUEHvhoxNiqRJ/kscA
	 +tGzxxw+V+n+2RE/sZMKbrQYcPZY5evPlaAl3p7D+3gjctOWw7rMttaj8F5ZwK45Tplzh
	 HNmw3tcdtyx8HTOfM5P6tCwFCAfslSiUH3Pt46iCYG5jP2UwO0BwV08dkfkBFjpPZ9t+T
	 Ft7zFutyhsFKPFB4YEOfp+OW8F6sxoI8uaBxGn47Mudmxw/1hd1TkGGhJ5RoLg73LPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3o1yGAM;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A205606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A205606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3o1yGAM
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36f8cdd30beso6509846eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433554; x=1795038354; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLiiTa/Gb7h1TxDGjxBpe1u+WEWowZlfNkmPxqWemd0=;
        b=Q3o1yGAMmIMBrIgCVDWk5ZLj3xdQII6hHVqnmtuQqxF30ztQZShfrSaWGPDsxxdTqZ
         NF7wxW4425xwPino3SFafvANsRF6RpeNzwzIY8MrQ8robbnXnI+4LZskJxLaAMM3AMB9
         sQG6Cn9vcAEToQ9Qyqeg2tccYh/hkxtK41BaGgXRj4cOHu3iXLo/F3oVJixljU9STury
         0X1RK0TMK2Qi4v6SRrnM/YApgfD3gpxY8f4LfgMaXRuoog4bqcIwbS0tGnEw0nx4+0XM
         GqGAwjlevoWNUoYT0pKtPnd4QuhU8e77GwG+nJzG3ZpPjjUpkqi+Wocl1zaTpYoPtW38
         fX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433554; x=1795038354;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLiiTa/Gb7h1TxDGjxBpe1u+WEWowZlfNkmPxqWemd0=;
        b=yke7xxSfGm1cyMdhEU/KNla+vXZzoe/Uj064RlQg1hXnGemahHrXPfHbMi4ixvO0P9
         HMHxwXuAnKUBB9uP1krEW0CKypK6Cb2F/VaGv6J+Gw4v9WM3CPjzl4IM0QoNnFQPqHqw
         qQEZhg6BbInuS5CCowDzV8NDkHLLmnNt5k5nCtx7PnwZ0phDO/wD40jit7JSunAg0T7X
         Eauh1l1gOmwcXwMjHrFElnnCCKmOn7DPVo76vM1XKdIPgqTkrnn3QWYy+yHorXb1ados
         Elc6N9VEc76tauIO9xSn8988pN36kzBu7zdFMgi+lYV9vz7LqAhdeAXml1ibd9GVkRyy
         2+xQ==
X-Forwarded-Encrypted: i=1; AL+hErGd0jLJ6kidG6YMn48YnW5IdCqymzYdR2C5aO0lfBK/gxvYFGJJy0T3SrTECoqEemhdh76nLstOHLzw1XA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ihFo5iuX+366NHsP6G0ZMiImau+pClD/892JvGysyt5JHjIRQ
	80Vif0588J6Dj7jjBbwgDtX85yHZEYFBQBxmdGEI0vmDIsKH0RFxEOjc
X-Gm-Gg: AYBFou2htaJbg712qymwf7p+hEgwnopUEROq+mElg+VE+yMj7kpFMCUCKug0zgiLiYq
	KSTf+Aokj6tsFXo2TKQnggdKFj4TnXTsnP1ROKFWS8dFRp09o32ONHJsn9Ceoc5913xz/NwHThR
	BfzDY3ZfgdxgnVvCdNsvxXz7XjEoiYWMrA81zkQ4B3F91TkrwswoCvyXFn1LsFLrciwSTHnh2Xa
	rQSWrSq14/K5OR8VUmAh3mIARmdxBVo+5e5Pvt1hUPXi48sCilURqdVQJHwEzgReur08ctsKvKF
	ErwObiymikXw7iyrHtJcCC9aSsZu8A6u7CuII/3d6U+RcR9in8tEQ3+wo9EvqcGQSIkwaMwbGmw
	IBZdrepubqVmGlDHX6znxBkfHbiD4Q5LKS3A2v8+KAeboZxcn1l5llejPbX9bu4ve09AH+nD8iy
	N+EuqeFNaz4uiUtZNjERAmpqVew1Ococe7orSLF3tc7DA7cinK2P1AK8fOluWRgIrMDbCrZnQ5D
	GdqB4+SW9kEv0frEb65yWPnHaoaSrKCuhsaVvQRQWSG/nrQIRXT+28e7e9DGyKxntnpDfwMoPmT
	FeOQ8nUr2rI8lpYf6xAVxMmcxYT+fArx5TekqwL+NTW6eXhA6b7Clb4jYcbjrr5ojXrpRBo7wZI
	xc+jK5RaV0P/pETSZT3PBtTgx4a3j0bqO0DBs6A==
X-Received: by 2002:a05:7301:3f19:b0:36f:3da8:dbc8 with SMTP id 5a478bee46e88-37686d31fa8mr5532433eec.31.1794433554164;
        Wed, 11 Nov 2026 13:45:54 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c24:4ad9:f660:1904? ([2620:10d:c090:500::6:1f95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm38006432eec.23.2026.11.11.13.45.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 13:45:53 -0800 (PST)
Message-ID: <f9979d3b-2a6a-4fa4-ad4d-10e5d4958678@gmail.com>
Date: Wed, 11 Nov 2026 13:45:51 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 10/11] eth: fbnic: Support RX buffers it
 cannot split
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>,
 kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org,
 bpf@vger.kernel.org, io-uring@vger.kernel.org,
 Mina Almasry <almasrymina@google.com>
Cc: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
 Weiming Shi <bestswngs@gmail.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, David Wei <dw@davidwei.uk>,
 Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-11-bjorn@kernel.org>
Content-Language: en-US
From: Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>
In-Reply-To: <20261110102039.1002605-11-bjorn@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/10/26 2:20 AM, Björn Töpel wrote:
> fbnic packs several headers, and several payloads, into one page. A
> provider without MP_CAP_FRAG needs one descriptor per buffer. Give
> such a buffer a single reference, program the queue so each header and
> payload takes a buffer of its own, and drop packets that break this.
> 
> Header split is now set per queue, so link up changes only the drop
> mode.
> 
> Signed-off-by: Björn Töpel <bjorn@kernel.org>
> ---
>  drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 119 ++++++++++++++++---
>  drivers/net/ethernet/meta/fbnic/fbnic_txrx.h |   2 +
>  2 files changed, 102 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index bfaa284e497e..d96c957d6fba 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> @@ -761,8 +761,14 @@ static void fbnic_page_pool_init(struct fbnic_ring *ring, unsigned int idx,
>  {
>  	struct fbnic_rx_buf *rx_buf = &ring->rx_buf[idx];
>  
> -	page_pool_fragment_netmem(netmem, FBNIC_PAGECNT_BIAS_MAX);
> -	rx_buf->pagecnt_bias = FBNIC_PAGECNT_BIAS_MAX;
> +	/* A whole buffer has one reference. The packet takes it, so the buffer
> +	 * may be reused before its BDQ entry is cleaned.
> +	 */
> +	rx_buf->pagecnt_bias = 1;
> +	if (page_pool_supports_frag(ring->page_pool)) {
> +		page_pool_fragment_netmem(netmem, FBNIC_PAGECNT_BIAS_MAX);
> +		rx_buf->pagecnt_bias = FBNIC_PAGECNT_BIAS_MAX;
> +	}
>  	rx_buf->netmem = netmem;
>  }
>  
> @@ -792,7 +798,8 @@ static void fbnic_page_pool_drain(struct fbnic_ring *ring, unsigned int idx,
>  	struct fbnic_rx_buf *rx_buf = &ring->rx_buf[idx];
>  	netmem_ref netmem = rx_buf->netmem;
>  
> -	if (!page_pool_unref_netmem(netmem, rx_buf->pagecnt_bias))
> +	if (rx_buf->pagecnt_bias &&
> +	    !page_pool_unref_netmem(netmem, rx_buf->pagecnt_bias))
>  		page_pool_put_unrefed_netmem(ring->page_pool, netmem, -1,
>  					     !!budget);
>  
> @@ -993,6 +1000,19 @@ static unsigned int fbnic_hdr_pg_end(unsigned int pg_off, unsigned int len)
>  	return ALIGN(pg_off, 128) - FBNIC_RX_HROOM;
>  }
>  
> +/* A buffer that cannot be split has one reference and takes one descriptor */
> +static bool fbnic_bd_one_desc(struct fbnic_napi_vector *nv,
> +			      const struct fbnic_ring *bdq, unsigned int idx,
> +			      bool ok)
> +{
> +	if (likely(page_pool_supports_frag(bdq->page_pool) ||
> +		   (bdq->rx_buf[idx].pagecnt_bias == 1 && ok)))
> +		return true;
> +
> +	netdev_err_once(nv->napi.dev, "Bad descriptor for a whole RX buffer\n");
> +	return false;
> +}
> +
>  static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>  			      struct fbnic_pkt_buff *pkt,
>  			      struct fbnic_q_triad *qt)
> @@ -1007,6 +1027,17 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>  	/* data_hard_start should always be NULL when this is called */
>  	WARN_ON_ONCE(pkt->buff.data_hard_start);
>  
> +	/* MAX_HDR leaves no room for a second header in a whole buffer, so
> +	 * the device closes it, with PAGE_FIN, after the first.
> +	 */
> +	pkt->add_frag_failed = false;
> +	if (unlikely(!fbnic_bd_one_desc(nv, &qt->sub0, hdr_pg_idx,
> +					FIELD_GET(FBNIC_RCD_AL_PAGE_FIN,
> +						  rcd)))) {
> +		pkt->add_frag_failed = true;
> +		return;
> +	}
> +
>  	netmem = fbnic_page_pool_get_head(qt, hdr_pg_idx);
>  	pkt->head = netmem;
>  
> @@ -1032,7 +1063,6 @@ static void fbnic_pkt_prepare(struct fbnic_napi_vector *nv, u64 rcd,
>  			 len - FBNIC_RX_PAD, true);
>  
>  	pkt->hwtstamp = 0;
> -	pkt->add_frag_failed = false;
>  }
>  
>  static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
> @@ -1046,8 +1076,20 @@ static void fbnic_add_rx_frag(struct fbnic_napi_vector *nv, u64 rcd,
>  	netmem_ref netmem;
>  	bool added;
>  
> +	if (unlikely(!fbnic_bd_one_desc(nv, &qt->sub1, pg_idx, !pg_off))) {
> +		pkt->add_frag_failed = true;
> +		return;
> +	}
> +
>  	netmem = fbnic_page_pool_get_data(qt, pg_idx);
>  
> +	/* Without a header buffer, the packet is dropped. */
> +	if (unlikely(!pkt->buff.data_hard_start)) {
> +		page_pool_put_full_netmem(qt->sub1.page_pool, netmem, true);
> +		pkt->add_frag_failed = true;
> +		return;
> +	}
> +

How would we get in this state? Does the device need to misbehave and skip
the header descriptor?

