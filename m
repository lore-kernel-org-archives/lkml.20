Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794439264;
	b=ez5HXfLFnaVzCwlxFuVMGyMrDT8bBtu5YkBBDNpWoGWxeqC2BuKOprZ65nxRrOx2xNCi
	 3kk8oXWrnURedjn1ZHgixM4za4dlT8UYdsLp5y8KOBy8uCgFEukfVmYuolWKpNODH1qbi
	 hQTvyK31x1YYYLWS8D8xYztBPKxBhwltnNXde494etJxWrESIlfPjRx844rcxikdCb5g/
	 GYzVkXCUK960DE2hHfdr3uaXYOJ1N0TKMdDCwR7cqgecGmx64PjiotJIXZrNby3tyPrdj
	 ZL8ukhuNT/GsiZGbVXQo7LS/aguVHrvmpqgJl4OYOA2A8+kKnPkctes9DBsnpmAJXEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794439264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=eE9X9IsI4DGKfcKaEqbUpAyTJeGhuPKiIV6pCis8+mc=;
	b=30177FL4PZMafI/h+OAC328mW8u/K+UZJKcuFRFGSc8ed8EdJ5fR5oWKA46nGEV49kEX
	 +oecdquaY4+h9trpG221nU2BPXhuplIjmfEiK3JDTD5JEOl66CCl9c+U+9bdhakz561Gc
	 bpq2Bb2cdxJTrjB5h/fUe0JnR9QMxg5sxZTrU/4kONxzS7lXImeW2JqF67NZHe5pdfVu5
	 u177Ez4i2rTkjrpZBgUVB7GqON1oRhhb3nBW4HfUdtH0GaHKoQ79rzJt9NQP35TUHVaDD
	 S9yFrxj+jDtNnk13zBUtYyHeR1BTTKPpWaA6molyeN7W0I70OZD1m80syfyXbNdSrhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AS4FCx2D;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1295606A8AA
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1295606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AS4FCx2D
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso2074486c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794439263; x=1795044063; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eE9X9IsI4DGKfcKaEqbUpAyTJeGhuPKiIV6pCis8+mc=;
        b=AS4FCx2Dzy3knLqQU0KfBNqF5KUSlkLF7ulR+nDPovTotbPJqyuHWJZbdiqD0hnert
         Fjrod0191CeZY5GKnOqJQFXEdEHnEc9RnGOSGH5h4p748bHPLDNJ0byXo7dSycqqcU13
         OyILZU4dK6tcd2Ci05DZ8FF8yEvMkGJErFQBNpoVdDDqtfOvSHLZqPU/NPmpqdQ/5ur1
         G0ewEQXkjx0av1/XfhNJuB0qBTb2u6LImLfzoX4gBMIL2Eoag2sL2m+gsCjyN778IkpV
         3mYuBiwwgs25VP7eFbwR1g1h0EZbnCDVpu2l2LNGRuQnz/SV5so618qySg3qt6ExWr2C
         Jtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794439263; x=1795044063;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eE9X9IsI4DGKfcKaEqbUpAyTJeGhuPKiIV6pCis8+mc=;
        b=cv7HNiQDkHQ7Uo5L52JV9esN9Ql9pfWwCjVJwVccaNVZkYTCn9tuy736drlRjxKXFV
         vsh7/cXLR3mSr87db4AKxiX/647ZshGjlMTh+5BXHG716O3ej2TnqlEGQh+ZteIGtg3G
         TCfNE3DYCMZUuH/+FlSf923RyvuzwNbi9xA+w2lhobsYs4U/BocQh6tV0cvCkP9K/RO4
         MYVnOPxXkk9ehirNgplopiVp8mosKcTcSdALjdTBAPPDP4T8ATaDWl+dqrZvKP5cfKen
         FJLmg97LGkcMgc9W4LOjjBwpVAObedbISSxEP7i/NMRk3wVMAgjOSeV9Di+QCxAPDGbj
         gmPA==
X-Forwarded-Encrypted: i=1; AL+hErFLh3e6wQ+pcYOEIXmcqix6HZdQ3yD5vJMlRIF8pdc4YM9mw+WTpP/3Kxqp9lc5tKCi+yWPgpmQqicGM3A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lLMoi0pp9cvElK8lQVsYMA7gfcqmlpvi0Ca0lCZ3FmhyD6sW6
	P6dnyjdt+WcBUv2EEvOUXl35BB//NbK1Ne7NXONUCusOGenNx8N8GOlE
X-Gm-Gg: AYBFou1i3SY3O7xX+KoYunbsuumN/5SciR/EsivJxCSDafAouEBpZz4pH5RaLpNYKlY
	ocLeUhbvDHClOIcFUFDYHWHOB8ZOOGw3PiU4N3X1Y/HpxDeuxjju8xP2Af0rHkuRT6seIG7ro1x
	Ec4pcZ8PqYy/pxvMmsdLlPR7v5wy57LYBGw3hfCxYQca4oYLhptnz7/GR9PAYlaeXGNq30RuU+p
	d4Emj/i51kd3I7t6gBrarrI2mIsdVn2hzP0uib0am9yaKZTIOExgWchOjn+7wnMyoqeFkk3+NC+
	T1KO8ncNCvX64KJZrTEFNShLrIQtQorczUq6b8Ct5kVEDrRKU0F1VRHft/qamDyYYgVzGVW3FP8
	ctuHYM2EghDONFRKDYf1WhE1UPIATu0YcH1TIiBfbGgQaMEo1xJTs3XJnzJkmkvb4eHTtOed7fy
	AUpU0MXeUeJWz3Aa3ieqZOqfpGH3jKvlOW3Ip9QARQtqRYDKKuQKU3q/HAJ2q8wxP7cx6D1qNG1
	xCBSA8efUfKveIr81EgHSz+/HHoyOKDAOHooWF164pZmU6XrBpQ/TwR82YXjAscwXPnkGwzWZ1C
	tjIZ+ss7w8ifhffW58Q786k=
X-Received: by 2002:a05:7300:1899:b0:376:b957:c01 with SMTP id 5a478bee46e88-376b9570fd3mr5155040eec.16.1794439263001;
        Wed, 11 Nov 2026 15:21:03 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:66::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm19921294eec.5.2026.11.11.15.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:21:02 -0800 (PST)
Date: Wed, 11 Nov 2026 15:05:25 -0800
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
Subject: Re: [PATCH net-next v1 03/11] xdp: Copy buffers with restricted
 lifetime
Message-ID: <avT0b5T5trWZXAMo@devvm16445.scu0.facebook.com>
References: <20261110102039.1002605-1-bjorn@kernel.org>
 <20261110102039.1002605-4-bjorn@kernel.org>
 <avOZa6jLnmvYkk2H@devvm16445.scu0.facebook.com>
 <87eccra46g.fsf@all.your.base.are.belong.to.us>
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
In-Reply-To: <87eccra46g.fsf@all.your.base.are.belong.to.us>

On 11/11, Björn Töpel wrote:
> Stanislav Fomichev <sdf.kernel@gmail.com> writes:
> 
> > On 11/10, Björn Töpel wrote:
> 
> >> diff --git a/include/net/xdp.h b/include/net/xdp.h
> >> index 07231adfb5f8..1105bb9e3292 100644
> >> --- a/include/net/xdp.h
> >> +++ b/include/net/xdp.h
> >> @@ -81,6 +81,16 @@ enum xdp_buff_flags {
> >>  	 * XDP program is not attached.
> >>  	 */
> >>  	XDP_FLAGS_FRAGS_UNREADABLE	= BIT(2),
> >> +	/* Internal: the head netmem and the shared info are in &xdp_buff.ext.
> >> +	 * Not copied to xdp_frames or skbs.
> >> +	 */
> >> +	XDP_FLAGS_EXT			= BIT(3),
> >> +};
> >> +
> >> +/* For a head buffer that cannot hold kernel data, see xdp_init_buff_netmem() */
> >> +struct xdp_buff_ext {
> >> +	netmem_ref netmem;
> >
> > nit: netmem -> head ? and the same for xdp_init_buff_netmem netmem arg?
> 
> Yup, will fix.
> 
> >> @@ -138,7 +153,7 @@ static __always_inline void xdp_buff_set_frag_unreadable(struct xdp_buff *xdp)
> >>  
> >>  static __always_inline u32 xdp_buff_get_skb_flags(const struct xdp_buff *xdp)
> >>  {
> >> -	return xdp->flags;
> >> +	return xdp->flags & ~XDP_FLAGS_EXT;
> >
> > The only consumer is xdp_update_skb_frags_info, so probably not worth
> > filtering out XDP_FLAGS_EXT here? Or is it for
> > xdp_update_frame_from_buff? Can we explicitly clear it at the caller? 
> 
> It was for xdp_update_frame_from_buff(), but looking closer EXT never
> gets there...
> 
> I'll drop the mask. Thanks!
> 
> >> diff --git a/net/core/devmem.c b/net/core/devmem.c
> >> index 8f190b574beb..dea4a4a17e86 100644
> >> --- a/net/core/devmem.c
> >> +++ b/net/core/devmem.c
> >> @@ -698,5 +698,5 @@ static const struct memory_provider_ops dmabuf_devmem_ops = {
> >>  	.release_netmem		= mp_dmabuf_devmem_release_page,
> >>  	.nl_fill		= mp_dmabuf_devmem_nl_fill,
> >>  	.uninstall		= mp_dmabuf_devmem_uninstall,
> >> -	.caps			= MP_CAP_FRAG,
> >> +	.caps			= MP_CAP_FRAG | MP_CAP_RETAIN,
> >
> > Not sure I understand this part, can you explain?
> > These are MP_CAP_RETAIN because they are unreadable?
> 
> No, RETAIN is about lifetime: the stack may hold page pool references
> after the RX poll, e.g. skbs on a TCP receive queue. That's how devmem
> and zcrx work; without it the stack would try to copy them, and they'd
> trip the DEBUG_NET check in skb_add_rx_frag_netmem().
> 
> A provider without RETAIN gets copied, so it must be readable. I'll try
> to make that more clear in the kdoc, and probably refuse a provider that
> is neither.

Ah, yes, thanks, I did miss that warn in skb_add_rx_frag_netme, makes sense!
